Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B564D7A6DE8
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 00:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466FE10E29B;
	Tue, 19 Sep 2023 22:05:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889D210E298
 for <nouveau@lists.freedesktop.org>; Tue, 19 Sep 2023 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695161115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=babyV+EuNU9bfSyJWebeUGnu6HoQFg+NYoHkXDi5Dx4=;
 b=jIcp3zRf7Vv55K4v9FMWLp4yA1XafORqRhf26v6cuDmOisE7653jHyP/Wf9/N0wMphnssT
 VRnqEo85SipHpIc7tFTJhC/6/ySd+sgHGItXgcUbxuKWSHlW8SQ+HOIzZYDjI7Bo00uk14
 QnnIwNBUwQfen9Yb3cGGmu0fNDk7RWI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-_Z4BPE-wOvmz3IV1VM909g-1; Tue, 19 Sep 2023 18:05:14 -0400
X-MC-Unique: _Z4BPE-wOvmz3IV1VM909g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB76F29ABA26;
 Tue, 19 Sep 2023 22:05:13 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.18.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5252A40C2064;
 Tue, 19 Sep 2023 22:05:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 17:56:01 -0400
Message-ID: <20230919220442.202488-7-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
References: <20230919220442.202488-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Nouveau] [PATCH v3 06/44] drm/nouveau/disp: rearrange output
 methods
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: open list <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- preparation for a bunch of API changes, to make diffs prettier

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <me@dakr.org>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 19 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 12 ++++++------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 16d4ad5023a3e..7c56f653070c9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -12,14 +12,17 @@ union nvif_outp_args {
 	} v0;
 };
 
-#define NVIF_OUTP_V0_LOAD_DETECT 0x00
-#define NVIF_OUTP_V0_ACQUIRE     0x01
-#define NVIF_OUTP_V0_RELEASE     0x02
-#define NVIF_OUTP_V0_INFOFRAME   0x03
-#define NVIF_OUTP_V0_HDA_ELD     0x04
-#define NVIF_OUTP_V0_DP_AUX_PWR  0x05
-#define NVIF_OUTP_V0_DP_RETRAIN  0x06
-#define NVIF_OUTP_V0_DP_MST_VCPI 0x07
+#define NVIF_OUTP_V0_ACQUIRE       0x11
+#define NVIF_OUTP_V0_RELEASE       0x12
+
+#define NVIF_OUTP_V0_LOAD_DETECT   0x20
+
+#define NVIF_OUTP_V0_INFOFRAME     0x60
+#define NVIF_OUTP_V0_HDA_ELD       0x61
+
+#define NVIF_OUTP_V0_DP_AUX_PWR    0x70
+#define NVIF_OUTP_V0_DP_RETRAIN    0x73
+#define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index fc283a4a1522a..440ea52cc7d2b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -279,11 +279,11 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_RELEASE    : return nvkm_uoutp_mthd_release    (outp, argv, argc);
-	case NVIF_OUTP_V0_INFOFRAME  : return nvkm_uoutp_mthd_infoframe  (outp, argv, argc);
-	case NVIF_OUTP_V0_HDA_ELD    : return nvkm_uoutp_mthd_hda_eld    (outp, argv, argc);
-	case NVIF_OUTP_V0_DP_RETRAIN : return nvkm_uoutp_mthd_dp_retrain (outp, argv, argc);
-	case NVIF_OUTP_V0_DP_MST_VCPI: return nvkm_uoutp_mthd_dp_mst_vcpi(outp, argv, argc);
+	case NVIF_OUTP_V0_RELEASE      : return nvkm_uoutp_mthd_release      (outp, argv, argc);
+	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
+	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_RETRAIN   : return nvkm_uoutp_mthd_dp_retrain   (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
 	}
@@ -295,8 +295,8 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
+	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

