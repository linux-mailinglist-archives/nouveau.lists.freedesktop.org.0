Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FC7A53A3
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4CD310E2F7;
	Mon, 18 Sep 2023 20:15:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BED310E2EF
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:20 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c3f97f2239so44479905ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068119; x=1695672919; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6uduEomhEOPj1pcZID2LLz5ejkU3+wCTewhSLco1mg=;
 b=SwKzvVtqxv8n9BQADtZ7u6EuVN7XmSnFtfxfMOcml7s7jvVchQJyhYYTsZ6yJFCGgT
 tnd04+XZBjr2r5jOnUx92JenhjvPSIYt+RjxYCoEs4wJAi0qBx3ba2rzyzQFDhMcMs8G
 2oDX6aFQemMfdD/x+OgdYROKAYPJzmWwDeUKwGX7S0qR+Nw+ONQgitxJMZ6TEypjgNGE
 gp7Z9pHasoepJr6mOrtAyBOPqwbweNiFgs+YlcxixiSJlmvHxjrPwKe0Gw03UwhtKa8k
 cTcK3YzvC9sduyUqWTP3x3X6a6+7Vo1vnnW18mEdOan28BvQnOHvDjfVWM7XGziL68S0
 vGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068119; x=1695672919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D6uduEomhEOPj1pcZID2LLz5ejkU3+wCTewhSLco1mg=;
 b=awvTJrVx/5mE0Q0+wUlmg7O5gxD+WqNTDqxGjnZwuvjsfWJmznPFDmSWYprY9EFA0s
 A/VZ2VD4GjRdKJyxO3/3mTp0Gt/JC44KWx0ffw5O/RGwbXVfsblmA8RiTGiIxn2nTSdE
 giwAsYy1i3S8/svuNJ/OdyBaKo3N91MW75pW0ubDShtxIWZtUSfy6WfUh6KENFLUBToy
 4TL3fnvxRc1K+BtTc7JtgBe8A0pM35ECRg7mV41hDWCNkZD/d6w+m+ocSshqs4bSwznu
 Y4IxqnE48Wjg7B6siRW0UwPngUjwx9LTQuR9jmb401IrMfB0uIndCT6Sbc8snCl+WV0R
 U6wg==
X-Gm-Message-State: AOJu0YwEpwHy/ZdrGyHIGJMk7Qm25+Qqz7SmiyeQOgF56umsZII6IdeV
 A18Uw049Ez2gkuJhltANvdta6MWV/Ys=
X-Google-Smtp-Source: AGHT+IFkFhh1Eu+UqE3GupaS1txNqT333EkN8V0+AXXFpB6WQODZ0mCB6rMsMSng70wWieLt6U2jXQ==
X-Received: by 2002:a17:902:e54c:b0:1bf:2e5c:7367 with SMTP id
 n12-20020a170902e54c00b001bf2e5c7367mr12316160plf.42.1695068119588; 
 Mon, 18 Sep 2023 13:15:19 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:19 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:44 +1000
Message-ID: <20230918201404.3765-25-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 24/44] drm/nouveau/disp: add output lvds config
 method
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

- was previously part of acquire()

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    | 16 ++++++++++------
 drivers/gpu/drm/nouveau/include/nvif/outp.h      |  3 ++-
 drivers/gpu/drm/nouveau/nvif/outp.c              | 15 +++++++--------
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 14 ++++++++------
 5 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 7b238f6599e2..a574b4315ac2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1663,7 +1663,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 				lvds_8bpc = true;
 		}
 
-		nvif_outp_acquire_lvds(&nv_encoder->outp, lvds_dual, lvds_8bpc);
+		nvif_outp_lvds(&nv_encoder->outp, lvds_dual, lvds_8bpc);
 		break;
 	case DCB_OUTPUT_DP:
 		nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, hda, false);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index f878784593b4..ee4cec541a90 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -24,6 +24,8 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_BL_GET        0x30
 #define NVIF_OUTP_V0_BL_SET        0x31
 
+#define NVIF_OUTP_V0_LVDS          0x40
+
 #define NVIF_OUTP_V0_HDMI          0x50
 
 #define NVIF_OUTP_V0_INFOFRAME     0x60
@@ -67,7 +69,6 @@ union nvif_outp_acquire_args {
 #define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
 #define NVIF_OUTP_ACQUIRE_V0_SOR  0x01
 #define NVIF_OUTP_ACQUIRE_V0_PIOR 0x02
-#define NVIF_OUTP_ACQUIRE_V0_LVDS    0x03
 #define NVIF_OUTP_ACQUIRE_V0_DP      0x04
 		__u8 type;
 		__u8 or;
@@ -77,11 +78,6 @@ union nvif_outp_acquire_args {
 			struct {
 				__u8 hda;
 			} sor;
-			struct {
-				__u8 dual;
-				__u8 bpc8;
-				__u8 pad02[6];
-			} lvds;
 			struct {
 				__u8 link_nr; /* 0 = highest possible. */
 				__u8 link_bw; /* 0 = highest possible, DP BW code otherwise. */
@@ -135,6 +131,14 @@ union nvif_outp_bl_set_args {
 	} v0;
 };
 
+union nvif_outp_lvds_args {
+	struct nvif_outp_lvds_v0 {
+		__u8  version;
+		__u8  dual;
+		__u8  bpc8;
+	} v0;
+};
+
 union nvif_outp_hdmi_args {
 	struct nvif_outp_hdmi_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index ef63d22b62f8..0ddaec9416ee 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -31,7 +31,6 @@ int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_dac(struct nvif_outp *);
 int nvif_outp_acquire_sor(struct nvif_outp *, bool hda);
 int nvif_outp_acquire_pior(struct nvif_outp *);
-int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
 int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			 int link_nr, int link_bw, bool hda, bool mst);
 int nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out);
@@ -50,6 +49,8 @@ nvif_outp_acquired(struct nvif_outp *outp)
 int nvif_outp_bl_get(struct nvif_outp *);
 int nvif_outp_bl_set(struct nvif_outp *, int level);
 
+int nvif_outp_lvds(struct nvif_outp *, bool dual, bool bpc8);
+
 int nvif_outp_hdmi(struct nvif_outp *, int head, bool enable, u8 max_ac_packet, u8 rekey, u32 khz,
 		   bool scdc, bool scdc_scrambling, bool scdc_low_rates);
 
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 5a3c0dd7d532..dbb0986f0555 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -150,18 +150,17 @@ nvif_outp_hdmi(struct nvif_outp *outp, int head, bool enable, u8 max_ac_packet,
 }
 
 int
-nvif_outp_acquire_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
+nvif_outp_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
 {
-	struct nvif_outp_acquire_v0 args;
+	struct nvif_outp_lvds_v0 args;
 	int ret;
 
-	args.lvds.dual = dual;
-	args.lvds.bpc8 = bpc8;
+	args.version = 0;
+	args.dual = dual;
+	args.bpc8 = bpc8;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_LVDS, &args);
-	NVIF_ERRON(ret, &outp->object,
-		   "[ACQUIRE proto:LVDS dual:%d 8bpc:%d] or:%d link:%d",
-		   args.lvds.dual, args.lvds.bpc8, args.or, args.link);
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_LVDS, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[LVDS dual:%d 8bpc:%d]", args.dual, args.bpc8);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index c1775524919f..ad75dc5c50cf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -171,13 +171,17 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
+nvkm_uoutp_mthd_lvds(struct nvkm_outp *outp, void *argv, u32 argc)
 {
+	union nvif_outp_lvds_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
 	if (outp->info.type != DCB_OUTPUT_LVDS)
 		return -EINVAL;
 
-	outp->lvds.dual = dual;
-	outp->lvds.bpc8 = bpc8;
+	outp->lvds.dual = !!args->v0.dual;
+	outp->lvds.bpc8 = !!args->v0.bpc8;
 	return 0;
 }
 
@@ -253,9 +257,6 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	case NVIF_OUTP_ACQUIRE_V0_SOR:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, args->v0.sor.hda);
 		break;
-	case NVIF_OUTP_ACQUIRE_V0_LVDS:
-		ret = nvkm_uoutp_mthd_acquire_lvds(outp, args->v0.lvds.dual, args->v0.lvds.bpc8);
-		break;
 	case NVIF_OUTP_ACQUIRE_V0_DP:
 		ret = nvkm_uoutp_mthd_acquire_dp(outp, args->v0.dp.dpcd,
 						       args->v0.dp.link_nr,
@@ -406,6 +407,7 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
 	case NVIF_OUTP_V0_RELEASE      : return nvkm_uoutp_mthd_release      (outp, argv, argc);
+	case NVIF_OUTP_V0_LVDS         : return nvkm_uoutp_mthd_lvds         (outp, argv, argc);
 	case NVIF_OUTP_V0_HDMI         : return nvkm_uoutp_mthd_hdmi         (outp, argv, argc);
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
-- 
2.41.0

