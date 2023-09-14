Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693F79FEEC
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C528510E54F;
	Thu, 14 Sep 2023 08:48:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1B710E54B
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:28 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68fbbb953cfso537467b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681308; x=1695286108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lt1P7azzm7S2HxbXQ0cFUYe/y9YHGKXx9DNxkkgu84=;
 b=AkA9NiCQp03NL5jIDnmm8bWx7JxxrdmmJ4k1FPb7vv6Wyhg0hVGbb59qcH3Rkh7abu
 D8j3lKM1oqIuCPD079G0fIiugzdj8hN6Hmv/CUDPEDSAIeyKcMjBbHcQUYGj+PaBcvUQ
 qafcw8KMWwNlawxS8GGjRRKk4UgKUnrd3j6tkSNIdg4w3HXs61mDBB20mrNqQ9fKhDiU
 XmwLDYCcQ4OTtg+3zufdKmm/5bbNHmTlR2KwAoHjcE+Z+XTTlPsmcN1qTsVeVGJtUcw3
 9teihybQ7T1+rNAkGYRQ3tSQPAfut2eg6MFhLJaMoSewEDGTh3RCHycPN89DG6kKbXlf
 QWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681308; x=1695286108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8lt1P7azzm7S2HxbXQ0cFUYe/y9YHGKXx9DNxkkgu84=;
 b=Crm80sa5fvc1xBIkOcHAp7LREhpnxny8TqOVVolK6bI0F3DSZY7Xte5FoZ0TRxhKRg
 8PMjNUgQyjLQb7QNKMiSINk/yO0AYGEQ7zlpCSENpVW2F2666ZbrulNc9WMKz5nEYp0M
 ZGQKpyM7OAOC8DiK+kn/S++Lyts8ZEBy6pSdftpa6eFkLoYZSZ2eVyuqJExSs2AgaOb9
 SN11EyUd63L10CRlXPgwxsBlL7q0DKKErjuupi/2CqOX0/jO5QDYltGYtc3LWvxGiOP0
 YFfAQWrCrPp7VjqW/5WJj4hUcnu7r8yYgecOKwNjjJV6uuSI8HdcQN05B/vFq+ycXdYE
 k0Ng==
X-Gm-Message-State: AOJu0Yy5wdfCrNk6/iCmBauA1Pkq49MLBpc/81nVvVmcYMxyjzNdNxR3
 ++fLBgTOMCS273JBzUc6HeLX8F6cPCo=
X-Google-Smtp-Source: AGHT+IFmhYpXbCBDGmiaINtMjFfAPeU85tt0yGYya0iU0H5nFNuywLiDlcAWwemMgIC4J8DIwmKfZQ==
X-Received: by 2002:aa7:9f85:0:b0:690:2ecd:a597 with SMTP id
 z5-20020aa79f85000000b006902ecda597mr941295pfr.21.1694681308051; 
 Thu, 14 Sep 2023 01:48:28 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:27 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:22 +1000
Message-ID: <20230914084624.2299765-43-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 41/44] drm/nouveau/kms/nv50-: name aux channels
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

