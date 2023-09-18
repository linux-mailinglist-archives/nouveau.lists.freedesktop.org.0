Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061D7A538D
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7F010E2DE;
	Mon, 18 Sep 2023 20:14:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFBF10E2DF
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:36 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1bdf4752c3cso35372155ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068075; x=1695672875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezc7MJDOXe67RT8y9JNVqHe5b5HiiQLMbQOkxrfoqtc=;
 b=BfGlMbAMSH7MjdfnKCsTzGOzF8ojCE67/kK5w3TxEr+P/XyF9+a+nC+CPPm68O0h3i
 G7x95t3bUecgjeYCTf1aBAHI+pHLbYa0e7FRrtgpO9PrG9Ag5DXYFHTxZ6XQYAzH1jZz
 D+egACb1a+dyx1TjYO+VPY7G7hmlTSOxC8x+c9SrMDw7TCmFa872ZmIDtaF8tE1FSCaP
 7SO9u9uJEbBjc2UU242U0OKxY/DFnRUfyW9WNd7oWGPsKv4q5fJGOBToYc9K6Ny51RvW
 WTt4mqlcr8Pvsy/GrpYsp283sepvdPkxPhHUsZyE9R6SJ+Sh8VwsXH13l7LVsFvQu97Q
 R6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068075; x=1695672875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ezc7MJDOXe67RT8y9JNVqHe5b5HiiQLMbQOkxrfoqtc=;
 b=MKPmpa8hKMMmfkyxab9ihUoNWVh7ZNUH0yKC5pOS/AzBkWgPcaR/XEgNsHKVm1Uj4x
 5G5SONQ+Hrkyp7xkhnXo8lO9LbdaxX0rf6rKEdbGnuD6rx2MnvR2KlZavcT8iG72G4w4
 Bqb15Ew1m7MUr1hH68RkyE76AT1Xsp7yYhsNKL2M+HM1w4u5MttUCRHtZcWcbB6lihpK
 IMBIvAMGNcCdKX/oO1QxBFgSzftt4GHkqdwRIQLf7yTiSurCvc7pVeolWoSD0bWsObO7
 UTLBcSgmHiYWusAvPd47hV7gZ1qkuOXR2/yNAIbP8fq+UDgADgnaAWQxCPqN1OKeinbs
 dDug==
X-Gm-Message-State: AOJu0YzywBoc0bI+LU3KM/JPwQucuiS+ANHdXal59FdyIEu7Kjcwqh9I
 vZcJijWXgqPsJyryx6MNxISyrOQ6XEQ=
X-Google-Smtp-Source: AGHT+IGtr+BGw3cql1uFHsdxYLxjskFs2NBUsslnNPWeIwFXdLoUODHHBu4DZx8xzLGzdcnBCrvYFg==
X-Received: by 2002:a17:902:ce88:b0:1c1:fafd:d169 with SMTP id
 f8-20020a170902ce8800b001c1fafdd169mr9091026plg.3.1695068075235; 
 Mon, 18 Sep 2023 13:14:35 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:34 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:26 +1000
Message-ID: <20230918201404.3765-7-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 06/44] drm/nouveau/disp: rearrange output
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

- preparation for a bunch of API changes, to make diffs prettier

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 19 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 12 ++++++------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 16d4ad5023a3..7c56f653070c 100644
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
index fc283a4a1522..440ea52cc7d2 100644
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

