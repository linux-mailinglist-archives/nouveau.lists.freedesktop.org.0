Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC979FECC
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EEA810E52A;
	Thu, 14 Sep 2023 08:47:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEB310E52A
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:32 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6c09d760cb9so395861a34.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681251; x=1695286051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4J1pY+omIlml/Nlo5xmA4lrYbFFWRankShAuCCnfe4=;
 b=rELd5jjW8dAnVGUBbXX5pal5hJ9ETFJ1+7b0BU4PSbC12wJKhOAW87voqEqyw2eExF
 gMpfYuGxTkH739RPuRQY6rJPqfFjkBOfQTsGqUD3mcMv6IFSYYi1h0CxEDa03GbxLc3B
 pAdNzr+XPka4YekY2CkZjey15txCx5cR6P01hY9y7lKyr9DwiqIWp3UT40HbvqMQCrfw
 IzIq0DfmMBJXmtV67nhQe3Hfj92VTCNx864CM9g4lH/fD+AkeOjECiOIZ2L20vRJNCFc
 ayn/8CRCcETK9CCvG+E+YMzlo20R7owXsim94yth+xNQmzxlr8LwNzqCapOh3VMVADUC
 672A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681251; x=1695286051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4J1pY+omIlml/Nlo5xmA4lrYbFFWRankShAuCCnfe4=;
 b=clvEFnBhq+0xI03e8XtAa0hbkvth/4l4lpAVABAtUaMVv7hA5x8994q+Vt1sQi+LHJ
 ESO3g3SM/XlTxqrGi2U9tRv+V2R29IQBAGSK6QN3NazWcE9UR7856/KOgPEC7FVHUsk8
 zdXfBAxRnB4cYyoRgE1JGNSR5OT0yuYOwB3CABPT18klWkW6WHOtMfVTqnaXcuB/9Ycv
 bkSLbNUyh7MEE1K4jizZ52howueGSe4zyCw7sMcojcbZujmMF8Di3KU8H1QF9YT594mB
 w5QFRzR4NbUVwibB2hrOtChzmbsMo1ZB0vdT0o4dWvZrx+bVeDgvf3dtcvQPASxzJGfQ
 cHWQ==
X-Gm-Message-State: AOJu0Yx8SyFmaZ1bVqVQlnOV/vFZbi8AJY1nZ6KAr360EBvY5FOraKr9
 hugIdkcD35RaBAzyTNgzzdCBXA5Gymw=
X-Google-Smtp-Source: AGHT+IGuReV3dsDt/WIzH/8XPM0kquyz7v4Zx5/YmAIljXnk3QRVKUcqFpxWf9uJGcs0k+U1Nmrw4w==
X-Received: by 2002:a05:6830:1299:b0:6bf:21d3:2de5 with SMTP id
 z25-20020a056830129900b006bf21d32de5mr5926351otp.17.1694681251273; 
 Thu, 14 Sep 2023 01:47:31 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:30 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:56 +1000
Message-ID: <20230914084624.2299765-17-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 15/44] drm/nouveau/kms/nv50-: pull some common
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

