Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A14BE7A539F
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6E110E2F2;
	Mon, 18 Sep 2023 20:15:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A41C810E2EC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:10 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c44a25bd0bso18371265ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068110; x=1695672910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0RnPbHVI0HvpPl5ekN/AN4RFnQK1ag42GIaUVCn7MsU=;
 b=S34Bbs+0O6vNAJ8FdE99SRpTf88HyPKIHLw/drzNH45HQGyLttxvIng9Z4HmokB+kR
 DnRVhMik4Pv1+nrrN1ZYbEsiMAHPgQk9owqeKgSdhJGROfosEa1BDNc9WGZ97224xP6a
 kQe+hYZo7MJaJX09CrZkMgV0K8NvqRjdtb8DqhB4+dg7ge6DwuWUdthn8/Cx+uLu86El
 qMZ+GmFMExktykqPsKop7HBWxTq60I0Z3HMbjKNZ79iUzsF4PailAhxI988/kKJxMvOe
 Tx9Zh616js8w4htpPaIewOfjkYkQ9d+YjzpwMaJb+GFO+Yu6RwTMbUZ/B/myxLNO3MQo
 PHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068110; x=1695672910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0RnPbHVI0HvpPl5ekN/AN4RFnQK1ag42GIaUVCn7MsU=;
 b=FpeirHp1dTY7LfhMwuzol0RTuEv56VbAWdoOYBLEsJu/MAkjxzz7dAkRfK67Chyy6P
 NYjmvwm0XxSAejJCBfMo71GFVqotBJug7bCitniXV5VmKCOrkTeSKIoVWvvnCKpPgryB
 j/homjkBwj0nF8ifI0giQTaKz3/ayV4ps0uI1odY8SZjWh0Nha9j2BA3OkSmDvSSkoqj
 u6P6j7Emxxnc7rW9F6Mg11abrBVhXJsc/4Bt7n0xtLE3tI3rX82Dv4QmeV5VV2U0XsS0
 4SfgkiaClGhsKB8SxOCRrN3+W8fPBGwXCh+Ihax9+iZUyob81AUiGREGn8e6l2ZRWzCe
 H7BA==
X-Gm-Message-State: AOJu0Yylbhe57grSXTqaOQ1DoSTmu6pC+/X8aEhhIRhNXNYeOy8rDnMk
 V0sxUvbw/AIzeiQCKZ3YSb6Ed/H/mgc=
X-Google-Smtp-Source: AGHT+IFNqWum9zfsWKFXqx5J0xkWIUaUmpP4Zer7yTO9Gs6KXzkEVi2ZkfiEhMRu616z7NFTAPSj0Q==
X-Received: by 2002:a17:902:ab5e:b0:1c1:f3f7:50bc with SMTP id
 ij30-20020a170902ab5e00b001c1f3f750bcmr703157plb.26.1695068109745; 
 Mon, 18 Sep 2023 13:15:09 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:09 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:40 +1000
Message-ID: <20230918201404.3765-21-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 20/44] drm/nouveau/disp: move hdmi disable out
 of release()
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

- release() is being moved post-modeset, preserve hdmi behaviour for now

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c          |  8 ++++++++
 drivers/gpu/drm/nouveau/nouveau_encoder.h        |  6 +++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 15 +++++++--------
 3 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a4e1525ac48e..15ddb92c31fb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -842,6 +842,8 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		size = 0;
 
 	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
+
+	nv_encoder->hdmi.enabled = true;
 }
 
 /******************************************************************************
@@ -1560,6 +1562,12 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	}
 #endif
 
+	if (nv_encoder->dcb->type == DCB_OUTPUT_TMDS && nv_encoder->hdmi.enabled) {
+		nvif_outp_hdmi(&nv_encoder->outp, nv_crtc->index,
+			       false, 0, 0, 0, false, false, false);
+		nv_encoder->hdmi.enabled = false;
+	}
+
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
 		ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index ea8ef10e71aa..b3a9415ba879 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -69,7 +69,11 @@ struct nouveau_encoder {
 
 	struct nv04_output_reg restore;
 
-	union {
+	struct {
+		struct {
+			bool enabled;
+		} hdmi;
+
 		struct {
 			struct nv50_mstm *mstm;
 			int link_nr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 8ba96323e1de..ffd174091454 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -154,6 +154,13 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 	    (args->v0.scdc && !ior->func->hdmi->scdc))
 		return -EINVAL;
 
+	if (!args->v0.enable) {
+		ior->func->hdmi->infoframe_avi(ior, args->v0.head, NULL, 0);
+		ior->func->hdmi->infoframe_vsi(ior, args->v0.head, NULL, 0);
+		ior->func->hdmi->ctrl(ior, args->v0.head, false, 0, 0);
+		return 0;
+	}
+
 	ior->func->hdmi->ctrl(ior, args->v0.head, args->v0.enable,
 			      args->v0.max_ac_packet, args->v0.rekey);
 	if (ior->func->hdmi->scdc)
@@ -177,19 +184,11 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 static int
 nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 {
-	struct nvkm_head *head = outp->asy.head;
-	struct nvkm_ior *ior = outp->ior;
 	union nvif_outp_release_args *args = argv;
 
 	if (argc != sizeof(args->vn))
 		return -ENOSYS;
 
-	if (ior->func->hdmi && head) {
-		ior->func->hdmi->infoframe_avi(ior, head->id, NULL, 0);
-		ior->func->hdmi->infoframe_vsi(ior, head->id, NULL, 0);
-		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
-	}
-
 	nvkm_outp_release(outp);
 	return 0;
 }
-- 
2.41.0

