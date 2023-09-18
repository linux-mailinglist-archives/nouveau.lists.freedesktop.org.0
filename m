Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B895C7A5399
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E15B10E1AA;
	Mon, 18 Sep 2023 20:15:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960A10E2EC
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:58 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso44211815ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068097; x=1695672897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s6bKQqkxHtmfLBmQCBHixUdixE2X0uutrzp8PzgDc6M=;
 b=T2AwcahFPVUCmeLPrA7px3PS0ew6aIbRXT7uHGJBuv6dgOJNQZB5prQEt4+4sbU4o4
 QEEgVaU8H9CiDEWOzirclKODKmThHElzfvXNyJheriBzOVKO7epZ4/pvIc3rD/kS13B+
 sbCk9tHyrtoALmNDrCgIq09JmLNm+3jNyQbcEyCVTKphVEJVPnczCDJXt95qO6/EnSOM
 JFOf5cCl0jMV3IDywBnaDoys33HCCre7quocEPP33H8dCn+Bmd3X49oJAGNuMR/mgkYy
 Awi0gEaAus65K9sXobMfpRGEDmsDFssuWriXfntabnbOIY9u3hjVxaQKB+FTbaJkhrbG
 s49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068097; x=1695672897;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6bKQqkxHtmfLBmQCBHixUdixE2X0uutrzp8PzgDc6M=;
 b=hkdL2b1fhu9Dt4QteWObIUzwvqXZhLLwRYaobRjMgtvzU/RO8U7SfEYKZ2bVtnlfm1
 jAUsDzNtsww2opddY1FVwnp7ILfWGujTnibsbwSFgRmTTHR8bg6+GLnGoRtlYtJO8hSm
 Q+zcv0/FUJ5GnQMyH+/+Gg6WqMh4nIhXugFctrgRXpgaXHfAOJrssQVYAYk1pkNaBozn
 7xhnxbMRgsy2umWCiYZVK+eNyRg5qqgBcZ5xlA7H49FvfpWnwN3rc6GrnCw55nNQC9/D
 Rm+VJjO3E4SxImI9X4TlIwZS6EZith3jRdmh4zofkTVYJHATbA1BJDE2B6OiOCR86Pup
 BwXw==
X-Gm-Message-State: AOJu0YyfFiio+Pr8bT+8xJYVYJJNUlonZ42cJxLg6soiWkEv6Sba0Feg
 GVuHJSUfeUissmfcGsCAWai/HJ+WtFc=
X-Google-Smtp-Source: AGHT+IGBBFUDugdElVpvwlF557WPkCC69InL8Zz+s5XBSr596bHqdhujh/tiKsElO0WChVFgA3qI9A==
X-Received: by 2002:a17:903:244a:b0:1c3:dafa:b1e9 with SMTP id
 l10-20020a170903244a00b001c3dafab1e9mr12730811pls.10.1695068097471; 
 Mon, 18 Sep 2023 13:14:57 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:57 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:35 +1000
Message-ID: <20230918201404.3765-16-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 15/44] drm/nouveau/kms/nv50-: pull some common
 init out of OR-specific code
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

- cleanup before additional changes

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 69 ++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  2 +
 2 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4c54c46bb451..1123d25be77d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -554,34 +554,27 @@ nv50_dac_func = {
 };
 
 static int
-nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
+nv50_dac_create(struct nouveau_encoder *nv_encoder)
 {
+	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nv50_disp *disp = nv50_disp(connector->dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
 	struct nvkm_i2c_bus *bus;
-	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct dcb_output *dcbe = nv_encoder->dcb;
 	int type = DRM_MODE_ENCODER_DAC;
 
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
-
 	bus = nvkm_i2c_bus_find(i2c, dcbe->i2c_index);
 	if (bus)
 		nv_encoder->i2c = &bus->i2c;
 
 	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
 	drm_encoder_init(connector->dev, encoder, &nv50_dac_func, type,
 			 "dac-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_dac_help);
 
 	drm_connector_attach_encoder(connector, encoder);
-	return nvif_outp_ctor(disp->disp, nv_encoder->base.base.name, dcbe->id, &nv_encoder->outp);
+	return 0;
 }
 
 /*
@@ -1724,13 +1717,14 @@ bool nv50_has_mst(struct nouveau_drm *drm)
 }
 
 static int
-nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
+nv50_sor_create(struct nouveau_encoder *nv_encoder)
 {
+	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
 	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
-	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct dcb_output *dcbe = nv_encoder->dcb;
 	struct nv50_disp *disp = nv50_disp(connector->dev);
 	int type, ret;
 
@@ -1743,15 +1737,9 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 		break;
 	}
 
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
 	nv_encoder->update = nv50_sor_update;
 
 	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
 	drm_encoder_init(connector->dev, encoder, &nv50_sor_func, type,
 			 "sor-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_sor_help);
@@ -1795,7 +1783,7 @@ nv50_sor_create(struct drm_connector *connector, struct dcb_output *dcbe)
 			nv_encoder->i2c = &bus->i2c;
 	}
 
-	return nvif_outp_ctor(disp->disp, nv_encoder->base.base.name, dcbe->id, &nv_encoder->outp);
+	return 0;
 }
 
 /******************************************************************************
@@ -1897,8 +1885,9 @@ nv50_pior_func = {
 };
 
 static int
-nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
+nv50_pior_create(struct nouveau_encoder *nv_encoder)
 {
+	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct drm_device *dev = connector->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv50_disp *disp = nv50_disp(dev);
@@ -1906,8 +1895,8 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	struct nvkm_i2c_bus *bus = NULL;
 	struct nvkm_i2c_aux *aux = NULL;
 	struct i2c_adapter *ddc;
-	struct nouveau_encoder *nv_encoder;
 	struct drm_encoder *encoder;
+	struct dcb_output *dcbe = nv_encoder->dcb;
 	int type;
 
 	switch (dcbe->type) {
@@ -1925,18 +1914,12 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 		return -ENODEV;
 	}
 
-	nv_encoder = kzalloc(sizeof(*nv_encoder), GFP_KERNEL);
-	if (!nv_encoder)
-		return -ENOMEM;
-	nv_encoder->dcb = dcbe;
 	nv_encoder->i2c = ddc;
 	nv_encoder->aux = aux;
 
 	mutex_init(&nv_encoder->dp.hpd_irq_lock);
 
 	encoder = to_drm_encoder(nv_encoder);
-	encoder->possible_crtcs = dcbe->heads;
-	encoder->possible_clones = 0;
 	drm_encoder_init(connector->dev, encoder, &nv50_pior_func, type,
 			 "pior-%04x-%04x", dcbe->hasht, dcbe->hashm);
 	drm_encoder_helper_add(encoder, &nv50_pior_help);
@@ -1946,7 +1929,7 @@ nv50_pior_create(struct drm_connector *connector, struct dcb_output *dcbe)
 	disp->core->func->pior->get_caps(disp, nv_encoder, ffs(dcbe->or) - 1);
 	nv50_outp_dump_caps(drm, nv_encoder);
 
-	return nvif_outp_ctor(disp->disp, nv_encoder->base.base.name, dcbe->id, &nv_encoder->outp);
+	return 0;
 }
 
 /******************************************************************************
@@ -2799,26 +2782,46 @@ nv50_display_create(struct drm_device *dev)
 
 	/* create encoder/connector objects based on VBIOS DCB table */
 	for (i = 0, dcbe = &dcb->entry[0]; i < dcb->entries; i++, dcbe++) {
+		struct nouveau_encoder *outp;
+
+		outp = kzalloc(sizeof(*outp), GFP_KERNEL);
+		if (!outp)
+			break;
+
+		ret = nvif_outp_ctor(disp->disp, "kmsOutp", dcbe->id, &outp->outp);
+		if (ret) {
+			kfree(outp);
+			continue;
+		}
+
 		connector = nouveau_connector_create(dev, dcbe);
-		if (IS_ERR(connector))
+		if (IS_ERR(connector)) {
+			nvif_outp_dtor(&outp->outp);
+			kfree(outp);
 			continue;
+		}
+
+		outp->base.base.possible_crtcs = dcbe->heads;
+		outp->base.base.possible_clones = 0;
+		outp->dcb = dcbe;
+		outp->conn = nouveau_connector(connector);
 
 		if (dcbe->location == DCB_LOC_ON_CHIP) {
 			switch (dcbe->type) {
 			case DCB_OUTPUT_TMDS:
 			case DCB_OUTPUT_LVDS:
 			case DCB_OUTPUT_DP:
-				ret = nv50_sor_create(connector, dcbe);
+				ret = nv50_sor_create(outp);
 				break;
 			case DCB_OUTPUT_ANALOG:
-				ret = nv50_dac_create(connector, dcbe);
+				ret = nv50_dac_create(outp);
 				break;
 			default:
 				ret = -ENODEV;
 				break;
 			}
 		} else {
-			ret = nv50_pior_create(connector, dcbe);
+			ret = nv50_pior_create(outp);
 		}
 
 		if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_encoder.h b/drivers/gpu/drm/nouveau/nouveau_encoder.h
index bcba1a14cfab..b1554ad9d929 100644
--- a/drivers/gpu/drm/nouveau/nouveau_encoder.h
+++ b/drivers/gpu/drm/nouveau/nouveau_encoder.h
@@ -49,6 +49,8 @@ struct nouveau_encoder {
 	struct nvif_outp outp;
 	int or;
 
+	struct nouveau_connector *conn;
+
 	struct i2c_adapter *i2c;
 	struct nvkm_i2c_aux *aux;
 
-- 
2.41.0

