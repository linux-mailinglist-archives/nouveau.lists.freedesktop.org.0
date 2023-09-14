Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A4379FEC9
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315410E52D;
	Thu, 14 Sep 2023 08:47:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D915610E531
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:25 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68fba57030fso639438b3a.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681245; x=1695286045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k8v22SuPBwtzh5xircX5HnZZOW9Qb1iRalyOEsLO+b0=;
 b=USiF2XesH0nsYNg+exRAWQ+/nb1wm2Gx2y+jkoJXVJ1vsEvGy+ALwBccWxZxQ5kRFY
 AmiRVnHjhQ76I93WM6ibUldI8Xga7jSY3c38GWDT/8R+jPGDqic9jNYm5x7DXgID4M0j
 Jd2zpF6++djwf5FjCbrWUVaGW8V+7Kpb0JYNMi9jYl2y9svtmhBIwQG3iUwUMftIfEA1
 C5dXRNidNptB4fKRgUQtxgNdzksO/HmUWiT0Y0M82iCEMASVUgsAL/huFkvV0PAB9MZv
 Bqr8Glyn/yGKQm4wnHR6Ft9FaNcpnEiLtqUxz7w8dZmt4Kusqttsiy6Q2iRO5xbwlJuy
 o7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681245; x=1695286045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8v22SuPBwtzh5xircX5HnZZOW9Qb1iRalyOEsLO+b0=;
 b=pvmg2qqdVr9gnUZecENhMIC/wRSv5qwp1y6aL0ECuuqETTwhFRWjYE12aAW5xfSVt0
 84jnevz0dYFoRb7acCFI/E1LV7QlvI8cWwTRzV5SndnvXuCUK1fQZKRrpajJWO4JWDeM
 LPWK9dMPpNYyZ/3PHZUkUSTQPxYtCOGsB2hKJgdZf6gxTkuTOHQrghwt2KFA/USd+2pU
 deUCVIhiIeRZJvPIeX514MJkZTQY0cwCYm+O0TjD5qjVkuLSZg0vnxpuxOv36oeihp6d
 YFu0C+ZNDguM335fyz+hICdbgpHK6gVRtCpFj+7L9ADr0PGAKuBOfMuFbaY0WwkyENeV
 aang==
X-Gm-Message-State: AOJu0YyZ1gC2D2WrKloIMakdicbxG9C5NBgFj8WHGsR0ct7S6sAIEHSX
 S64ypTXqBPPJSXn4O0JrLH7lAjWKK08=
X-Google-Smtp-Source: AGHT+IFeKG11+gFT0JdtonEpgEG73sijJxDMwCD4uK3Vd35MKYCOqYiLK+iQ722pS7XnuNPbzWM3SQ==
X-Received: by 2002:a05:6a00:b95:b0:68b:f529:a329 with SMTP id
 g21-20020a056a000b9500b0068bf529a329mr5558506pfj.5.1694681244814; 
 Thu, 14 Sep 2023 01:47:24 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:24 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:53 +1000
Message-ID: <20230914084624.2299765-14-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 12/44] drm/nouveau/disp: add acquire_dac()
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

- preparing to move protocol-specific args out of acquire() again
- avoid re-acquiring acquired output, will matter when enforced later
- this one is basically just a rename

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |  3 ++-
 drivers/gpu/drm/nouveau/include/nvif/if0012.h    |  5 ++---
 drivers/gpu/drm/nouveau/include/nvif/outp.h      |  9 ++++++++-
 drivers/gpu/drm/nouveau/nvif/outp.c              | 10 +++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c |  4 ++--
 5 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 32b40229fd18..9339971aa90b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -502,7 +502,8 @@ nv50_dac_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 
 	ctrl |= NVDEF(NV507D, DAC_SET_CONTROL, PROTOCOL, RGB_CRT);
 
-	nvif_outp_acquire_rgb_crt(&nv_encoder->outp);
+	if (!nvif_outp_acquired(&nv_encoder->outp))
+		nvif_outp_acquire_dac(&nv_encoder->outp);
 
 	core->func->dac->ctrl(core, nv_encoder->outp.or.id, ctrl, asyh);
 	asyh->or.depth = 0;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 6cfc885e0aa9..d139d070c0bc 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -59,12 +59,11 @@ union nvif_outp_load_detect_args {
 union nvif_outp_acquire_args {
 	struct nvif_outp_acquire_v0 {
 		__u8 version;
-#define NVIF_OUTP_ACQUIRE_V0_RGB_CRT 0x00
-#define NVIF_OUTP_ACQUIRE_V0_TV      0x01
+#define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
 #define NVIF_OUTP_ACQUIRE_V0_TMDS    0x02
 #define NVIF_OUTP_ACQUIRE_V0_LVDS    0x03
 #define NVIF_OUTP_ACQUIRE_V0_DP      0x04
-		__u8 proto;
+		__u8 type;
 		__u8 or;
 		__u8 link;
 		__u8 pad04[4];
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 23776057bfea..c6d8823ef782 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -28,7 +28,7 @@ enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
 int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
-int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
+int nvif_outp_acquire_dac(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
@@ -40,6 +40,13 @@ int nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out);
 int nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out);
 
 void nvif_outp_release(struct nvif_outp *);
+
+static inline bool
+nvif_outp_acquired(struct nvif_outp *outp)
+{
+	return outp->or.id >= 0;
+}
+
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
 int nvif_outp_dp_aux_pwr(struct nvif_outp *, bool enable);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index eecccfc17c1c..41c4de40895f 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -171,12 +171,12 @@ nvif_outp_release(struct nvif_outp *outp)
 }
 
 static inline int
-nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0 *args)
+nvif_outp_acquire(struct nvif_outp *outp, u8 type, struct nvif_outp_acquire_v0 *args)
 {
 	int ret;
 
 	args->version = 0;
-	args->proto = proto;
+	args->type = type;
 
 	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
 	if (ret)
@@ -188,13 +188,13 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0
 }
 
 int
-nvif_outp_acquire_rgb_crt(struct nvif_outp *outp)
+nvif_outp_acquire_dac(struct nvif_outp *outp)
 {
 	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_RGB_CRT, &args);
-	NVIF_ERRON(ret, &outp->object, "[ACQUIRE proto:RGB_CRT] or:%d", args.or);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DAC, &args);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE DAC] or:%d", args.or);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index d56a87ae5b26..73c6227446fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -217,8 +217,8 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (outp->ior)
 		return -EBUSY;
 
-	switch (args->v0.proto) {
-	case NVIF_OUTP_ACQUIRE_V0_RGB_CRT:
+	switch (args->v0.type) {
+	case NVIF_OUTP_ACQUIRE_V0_DAC:
 		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
-- 
2.41.0

