Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 417F779FEC3
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5684910E527;
	Thu, 14 Sep 2023 08:47:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03E10E527
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:12 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3a9b41ffe12so395074b6e.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681231; x=1695286031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VG2WusEym5GlOjvNA0tFBHcZ1RdYJUh+2fTgFvYJG6I=;
 b=jk+2Ub3ohR630gDpWg60RAJeD0BV70+gOZWVHMXQ9oMgzUBGtk3XzfYbBpE/juhECQ
 5Negz/UzLfufGFpFKVrJXZ23xqtQ87xhbIc9fZ+/bo5oFBx/jx0a0ILwd+yNATV/Z4GD
 eGVf8l9nAJBLWKi/nQupsc4dSc4xtgZ7APopvb458qLdLHSkJRO2h58KmOX5R1l74jgi
 vk5/WbngbbTe7+emjA6eLL8aRxTctLmsafGZeDFkLD3nM4DJQkBFFhzEOH5OQcVISA1o
 NjlNMM7dnFKwiUTWaNAYVGtCOI1WbOvFYWvVJ1v7b8Os2reU5Es6IbMuXLs5J98CNZba
 057w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681231; x=1695286031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VG2WusEym5GlOjvNA0tFBHcZ1RdYJUh+2fTgFvYJG6I=;
 b=ZoublWyzUKAHOHE+5IZdGEm8cX7oqqbOe+cj6LR4T5J0oXaYk1OZORvgkuMUkE3a7H
 dK9Eq7YYu8J3qd1CYnLZA776tFnGgDELA41AXBQpUjWxdgLImTBbp2/Mwx2AgmGgog4T
 WAu42gzYXOy4hl2NDTyiSdg0t2ciHc0YzcWEzagKnbs0Wz1ooA0E/2w0dtmYQ+WUoNJw
 vvmFlGvA8Mb3hK67EEzhxAmriKrW2HZEPZX/JuztX4WMTZ2hG8XFG5t0YLKOwc6jCJm0
 fU/EfsN8uFeNZVT5ODeZlfUCjWmwdX9RF0lhcwlRJB3/a0wp0mTL0+fRaVczifM6NkOC
 s2fw==
X-Gm-Message-State: AOJu0Yw0nwLQO3RTHhIy24TMwChryFztYbThldoExzDu6sLYRa1tTkGX
 j+YFrsrgq1eDfh28EsCWSXva+PpUm5s=
X-Google-Smtp-Source: AGHT+IE3K32vSpt6DDlWZjc8MbR1KBsW3xWZnEZguk8H7oC+T0qOLtY+RJRBPz2WB7ZBbs/dkhLPOg==
X-Received: by 2002:a05:6808:21aa:b0:3a7:d857:c588 with SMTP id
 be42-20020a05680821aa00b003a7d857c588mr6874796oib.2.1694681231476; 
 Thu, 14 Sep 2023 01:47:11 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:11 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:47 +1000
Message-ID: <20230914084624.2299765-8-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 06/44] drm/nouveau/disp: rearrange output methods
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

