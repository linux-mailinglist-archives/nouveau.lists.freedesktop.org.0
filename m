Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618FD79FED6
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB7710E54A;
	Thu, 14 Sep 2023 08:47:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6B010E550
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:52 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-3a9f88b657eso408065b6e.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681271; x=1695286071; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P6uvgqUOTgO1OEcCdzxpQRvUmrJNVUqPGg3W3ojL/Pw=;
 b=nItKy4Zfl/LmEScfQgmiAZH24RMz4wlx0UL87olRKlapcdVxI7iRi5X72Kbw45a+C2
 5k1fqo0kTiUL6WA7fvdA8F7CoAvLSqk9GnU37pdmHtAL2bISVEzrE7XOod79B6ZaFn0B
 elVTJjYeMKfK9i7L4bFcsKFXdwBu7AUoVUEt/wk2uR5j5HqXN440WVNcTHppdIW1hvzJ
 657M6oE8OUxFwOB4yX2RWB8adqyGCC+LxkznsdhJQvqBaRDq5z9ZqNBnGyis+tqIzCg/
 Ui6n3tH3LhRegIelJxkMN2QMuCD2Pw9w/7s4JDYeu/piCor9R2inzWLSMHkB/25prFYy
 pAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681271; x=1695286071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P6uvgqUOTgO1OEcCdzxpQRvUmrJNVUqPGg3W3ojL/Pw=;
 b=Lz8Fpvw975Ir7mnf8jr5y67XZV8dhh00LHnRVfUyHZExH577BhjsK0LaGmHDgUYRpA
 99/meDtBvyUjoY6yITuk6B77O1pJ2/mLkcax8sKUAUOWoXQogbHUseMkVCqP2trHrdxu
 kAI5GB8NHE8RyuCJXuNSwyst6QgjFhnukoqsxs+TJidReiJHQ1ychSh3e50r9p8RiLys
 jYsM3dYqzZdKf+/uuC6Bb+Ew+PAjV5K3uKnVc0OZhMrZ999uoE0appV5b4VfRaJarvh/
 Yvq/1/gxFioS2mmHmV/K74SCv8GCMzC1HaldP4189Z/UNoTrFi+4cBzgqdoe1m6VTvwp
 UZnA==
X-Gm-Message-State: AOJu0YybqlB0hBS7FjHHjiceuElDv/hYJXQe7NwlDUeuCCo3ZXaDlftO
 BAmQDoHTKnJ7xloEIXKWCceSmi+gHGc=
X-Google-Smtp-Source: AGHT+IFsl+cvFvsYo6dCq6GG2jus7NQl0jKKxHf8w3uQu1sBL8ANT4sTjkb2hLkEKtrV2e4ab2AGfA==
X-Received: by 2002:a05:6808:288d:b0:3a4:894a:9f3d with SMTP id
 eu13-20020a056808288d00b003a4894a9f3dmr5022979oib.41.1694681271283; 
 Thu, 14 Sep 2023 01:47:51 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:50 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:05 +1000
Message-ID: <20230914084624.2299765-26-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 24/44] drm/nouveau/disp: add output lvds config
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

