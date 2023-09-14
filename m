Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3C79FED1
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57A310E536;
	Thu, 14 Sep 2023 08:47:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D90E10E53C
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:43 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-68fdcc37827so1363066b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681262; x=1695286062; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EvbBYD88zQ9iNE1ilQMyjf2MotCmnw/jdzQA+xzxyF8=;
 b=b7iJ2iXcFSySAy3c+GHqK+0incvPsbQzxO6379FYlz4CdICVOnF8mwfuofo5jAWgZy
 KhBgvqA8Bs97GW0GacOv5gZ+XYwHFlAEb1mhtMHiaKoYT8WU7wPQjHff01QonR7MOQ6f
 Lb7vRmYCM6RDd9UbeugTL2TpXDHG362Ig7pMI4YE1LW60UpO5SCxlhH81Iv7NdE3P2/U
 sGIMPOTefyopGaGjTQd0vorJGoI2Fjb9+vVK+ZnisRfXNKXV36FMMFGuNRe1q8r5na8m
 Vbd60L/zsbxV0HUgbfZAXLHzi89oOi8yCXmAzcXrd4p/YRdXQto7Si+oHyL+3ovdscLx
 970g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681262; x=1695286062;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EvbBYD88zQ9iNE1ilQMyjf2MotCmnw/jdzQA+xzxyF8=;
 b=lFIkGq7lM66lfls28I5Sr39WYwO7dCoxrfLsxPiC85dp8NBX913ZqX3h5wni7162CN
 oBKpFcnHG7hN1xaTCw8YPY2qZY4X3CsgqsRZQI3CzMId+P1IZNiy1qRqqdtKxQzcxFEE
 rrDVR7KTM7iImyYmuc5pz6hhACqqOqhP/n5Ja9riFyLnm/+06l8fRE0u2XHbRFaDdpdd
 79angufI2PUuyooJ1NSjhxSZ/XQkZzQRCjNanfkiKHtBdk6yVrQsQpxh4H2nU3LCEJkO
 OAkjiHFjIkK3QgdEDl23vtf5VjI8NDmW9+WEZAqIByREFg9Zuz4GvonEgLmYOIvcglsK
 Dvvw==
X-Gm-Message-State: AOJu0Yyceo9i9L7XzUBmIunDyl9eAkWX4NzDlO71n3Vo8VHVGxkWf0Vd
 xUdZhnU+7r2U/ej7kBXuIx8bvwCesuA=
X-Google-Smtp-Source: AGHT+IHKsC7sBN8Ym8GUjlYENogidKz61FeFONgxdxZQgo28BXi62E9T6N6k/3zQBtHs/Sfh32Zg6w==
X-Received: by 2002:a05:6a21:6811:b0:13e:90aa:8c8b with SMTP id
 wr17-20020a056a21681100b0013e90aa8c8bmr1337887pzb.4.1694681262281; 
 Thu, 14 Sep 2023 01:47:42 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:41 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:01 +1000
Message-ID: <20230914084624.2299765-22-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 20/44] drm/nouveau/disp: move hdmi disable out of
 release()
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

