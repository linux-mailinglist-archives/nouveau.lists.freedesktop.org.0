Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C87A5395
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA9CC10E2E7;
	Mon, 18 Sep 2023 20:14:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215AB10E2EC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:51 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c4194f769fso34616775ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068090; x=1695672890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a3CmwkJTFdC0iOjdRZiMW7SV46Pn7+hMiMc05PeErJI=;
 b=TsmP0+ap0OO/s9PY7xIatrWLSBXrkjgWCldsNDdd+fyjRSNlzUXg/Qc0FjQ2b1nVEJ
 5nCK3Qn1lsdSJ7jjsramQHEYoTsNDoxwlnmQjHnhnATeHye+APEPROlgAU4aBJwhmhQo
 kVBAWd05k1Jp19TAzVAynxEOm3etbU7J5CRPBXlDjW2IpDGNy+zpeG9UVvNajnD9uNEM
 xu0dPXlq3xGX2xkErrRcCjxexfsCUPjgQM5fLdOQpxYH02h+iDf964vglm+JkKTSKEln
 /5FdMVq1BhlozToyfAxgAEtFoZ6eOb1/Yl4ne1S4KXeawwcFCHrcH5OtTdZ4JLlNo+Zi
 A8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068090; x=1695672890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3CmwkJTFdC0iOjdRZiMW7SV46Pn7+hMiMc05PeErJI=;
 b=lGYwzUQ4essOaVBcgyOBCUDQivn3ncgyp2Vn+dWnLuaTtZyR6ooNuoEGSvs4fg4O+s
 XJcbjKTerJFcJmlODcCsjKn8e32QntHf1keIdSEqhvA0XUUB6HM8ZKKebLN03FhQPGUB
 RP95z3bYvn5xDRskRmhkzcqa0TS6wDUhj6RJkU80TOoGDfMFK/Xwsxm2a+BedVGmgHcf
 PsPk0mWoCZ1PK9k+7Q2l5+KpMX9oykp2bqCYt8no0PFi2EVATY7GTWfrphQX/DFQgBBe
 DiR54rOQPjTj82l1gspSm7HEdZgaTZesEXdht0CtTTxIbGfPSb8yyppR9UuOHypxBsHn
 oA1A==
X-Gm-Message-State: AOJu0YzcxWUQYKgt1fbHtxKMWCufdfZA/NyCjuG/TYmjzGNTJAKzcZAg
 q/oOt21ElTdJy2ScWMaj2kWJjJLeh0Q=
X-Google-Smtp-Source: AGHT+IFiZXwXpI7zzAn+u+GRGS5QiStJAAaYdPFgWjq0SN56IrdiqHpXfXxPtguasbFhNnzYdHK5+g==
X-Received: by 2002:a17:902:c404:b0:1c3:1f0c:fb82 with SMTP id
 k4-20020a170902c40400b001c31f0cfb82mr8997325plk.41.1695068090169; 
 Mon, 18 Sep 2023 13:14:50 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:49 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:32 +1000
Message-ID: <20230918201404.3765-13-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 12/44] drm/nouveau/disp: add acquire_dac()
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

