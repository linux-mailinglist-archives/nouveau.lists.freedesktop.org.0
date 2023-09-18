Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 872897A53B9
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B87010E2FC;
	Mon, 18 Sep 2023 20:16:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764BD10E30C
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:16:01 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c43b4b02c1so21592495ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068160; x=1695672960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BYryuzxoRW8iGFdglpn9256gtaKdV3BdsW2F9OEaIEI=;
 b=XgwVmr5rxP17ugc9ebGraaP1X04O/x991O/Xj0ZG75PPy96hKGjWpGiMPNP+dHa3XF
 W0FCX1+Q+093KDNFyuyKFRD3BJwGsw0BKYuqDn1owsH5seEsuBMoTFL/xdO3FsK1KWJ6
 qLYVxpxp+GlhYO4K0ErLrWUxrMj9TjUZa5kjG/9o5+KHbLKCrS5GeJT8R8m7MOl4+9eD
 sc7TIJvXXFVUhdKD2nmfG6Dp5PYB3stwduDWbLkww8xHuMMAifOcngAkLpOS5XFaGUXn
 Go4ozXVmfHENRP6Bte+T2wsrI+kkdaXbAuG/GXaxL4VRWIT5PsYbu6qQxRmMZhCuPXD8
 jcrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068160; x=1695672960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BYryuzxoRW8iGFdglpn9256gtaKdV3BdsW2F9OEaIEI=;
 b=l3TfiYKyFvEw2IiFwUQW1PSQ1VsvFxPtt5I6gn3OZCcVDr7gpg46o5LTQ20AhkeRB4
 UVE+NX4JjT/pPKCNRE0RNoXz7KHXCYm4WeCDbdCKZhzTqja6CYcB0pLLR1ZQ+R/ww6kl
 9kaJZOk/sEuzTotG7/D2jmQRyHOnYoZws+/veMHb4VMgk9Hd1aRmuKcRuux0XNdoFL2l
 kPakq841q8g/CzT4xEclvZ0rgznHL+gOSIhy3sfGsR7AllCIiEdeHwnE+Jhu9MviwjHE
 EJH6LhNpZaBwSzrQVmDp1eRI/PJKL4diCTQyqvHNfNYfKo6iei/hm2CjLzxv1rPlXAJq
 PnIQ==
X-Gm-Message-State: AOJu0YxNHuBc69SiuBAdW47WYl1fd4FfXGmyHzRrL9SlYIrGeH4WfLnV
 +tSCUk000J1tNX9aIJsF3omAicXngLU=
X-Google-Smtp-Source: AGHT+IEbl53Ju9Yp0NMi0QXd80nWWuZHzOcS5adNQuzusR3QuZjsh3VXXD6EPTLaTfVB9JKxA/IUCg==
X-Received: by 2002:a17:902:ec87:b0:1c3:523b:557a with SMTP id
 x7-20020a170902ec8700b001c3523b557amr9905820plg.4.1695068160622; 
 Mon, 18 Sep 2023 13:16:00 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:16:00 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:14:01 +1000
Message-ID: <20230918201404.3765-42-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 41/44] drm/nouveau/kms/nv50-: name aux channels
 after their connector
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

- removes use of VBIOS data for naming
- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 25 ++++++++-------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index c2929ad64b60..34f5ad0fdfd6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -400,10 +400,8 @@ nouveau_connector_destroy(struct drm_connector *connector)
 	kfree(nv_connector->edid);
 	drm_connector_unregister(connector);
 	drm_connector_cleanup(connector);
-	if (nv_connector->aux.transfer) {
+	if (nv_connector->aux.transfer)
 		drm_dp_cec_unregister_connector(&nv_connector->aux);
-		kfree(nv_connector->aux.name);
-	}
 	nvif_conn_dtor(&nv_connector->conn);
 	kfree(connector);
 }
@@ -1280,13 +1278,11 @@ struct drm_connector *
 nouveau_connector_create(struct drm_device *dev,
 			 const struct dcb_output *dcbe)
 {
-	const struct drm_connector_funcs *funcs = &nouveau_connector_funcs;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = NULL;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	char aux_name[48] = {0};
 	int index = dcbe->connector;
 	int type, ret = 0;
 	bool dummy;
@@ -1376,7 +1372,13 @@ nouveau_connector_create(struct drm_device *dev,
 		}
 	}
 
-	switch ((type = drm_conntype_from_dcb(nv_connector->type))) {
+	type = drm_conntype_from_dcb(nv_connector->type);
+	if (type == DRM_MODE_CONNECTOR_LVDS)
+		drm_connector_init(dev, connector, &nouveau_connector_funcs_lvds, type);
+	else
+		drm_connector_init(dev, connector, &nouveau_connector_funcs, type);
+
+	switch (type) {
 	case DRM_MODE_CONNECTOR_LVDS:
 		ret = nouveau_bios_parse_lvds_table(dev, 0, &dummy, &dummy);
 		if (ret) {
@@ -1385,24 +1387,16 @@ nouveau_connector_create(struct drm_device *dev,
 			return ERR_PTR(ret);
 		}
 
-		funcs = &nouveau_connector_funcs_lvds;
 		break;
 	case DRM_MODE_CONNECTOR_DisplayPort:
 	case DRM_MODE_CONNECTOR_eDP:
 		nv_connector->aux.dev = connector->kdev;
 		nv_connector->aux.drm_dev = dev;
 		nv_connector->aux.transfer = nouveau_connector_aux_xfer;
-		snprintf(aux_name, sizeof(aux_name), "sor-%04x-%04x",
-			 dcbe->hasht, dcbe->hashm);
-		nv_connector->aux.name = kstrdup(aux_name, GFP_KERNEL);
-		if (!nv_connector->aux.name) {
-			kfree(nv_connector);
-			return ERR_PTR(-ENOMEM);
-		}
+		nv_connector->aux.name = connector->name;
 		drm_dp_aux_init(&nv_connector->aux);
 		break;
 	default:
-		funcs = &nouveau_connector_funcs;
 		break;
 	}
 
@@ -1417,7 +1411,6 @@ nouveau_connector_create(struct drm_device *dev,
 	connector->interlace_allowed = false;
 	connector->doublescan_allowed = false;
 
-	drm_connector_init(dev, connector, funcs, type);
 	drm_connector_helper_add(connector, &nouveau_connector_helper_funcs);
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
-- 
2.41.0

