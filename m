Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA379FEED
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8AC10E54B;
	Thu, 14 Sep 2023 08:48:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E7210E551
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:31 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3a88ef953adso411746b6e.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681310; x=1695286110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYJkWPmumW5i4Pczc/Tv0jyMzR2ZJD/EnnNTh+p/knU=;
 b=peBHIPvkvVDSyGHlgF5T0+xmTw57gnK5dELvuop6NFD7WwIG2yViPnt6XY1A68zTWH
 XMJszUEDhgpQo5+W2hsv8CvxMdmQQmLhdK83rpmr5CR++n67nOQ/h8pt0a3B8OXzO8nn
 YEbm6/UtaPRm/ZwJ3lLQRaMlEhDZ5C6FJms/HSLZMs9xiXCJus5x90w2PEldQXDfBPSB
 YAghVeb/ZmwVlz9RAGg47G3YABLcUjlRaUWC7LyX4kmTfprfPd58Vt/0lsYR5RJ6Q05k
 CbzdXVBPlKapChxipDwUHX3yrn+q0oKdyKHYGHtvv6aWcwZ+ES1e4goFmG1ZarvRXAzM
 q+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681310; x=1695286110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYJkWPmumW5i4Pczc/Tv0jyMzR2ZJD/EnnNTh+p/knU=;
 b=PlARhtvS3MHeEajCG/Yne+rJy46aDmKVmBt8dAhiYUm1IL2fEkC9TgVwEpfKodE+KB
 9DcqqhCVoFlVXtrcahBL94mG9M1Jel7o/qC7OrfamjcCaz0WcXXuPzquGKcg3Rcdw8Ro
 s3ibT24jATaSUR49Ds72cTyhjRXYaVNIBtQgZXjKh4tBcWOJkNFAQREXKVjKGhyiAXHR
 9CeC5+DGd7FOawMljgUbKtc5QRqnJBQ3PodxHwVrpa3O2T+SVkyEbxp9ei+9MTKo+3+G
 Qz79DRpDBva3nqDq9uyU6CCTHznRkmP43XdOYPbxIK5HbwTJeC7MVhnxACdh/3aP/M6y
 5b9g==
X-Gm-Message-State: AOJu0Yydynejjc2WsuwV+fT7GA4ZvFCQzee8U7mKsg2lQeyP1e98AC1W
 fELwYJYZcgrI7cwMJjs86TYa8/E5dHs=
X-Google-Smtp-Source: AGHT+IH9TmBHFMaoC0pUqgXwtpVDQp+IE9YT3Nmx2V9IJpGquljuzEdq7D9fDHLDptVRnHPuZob2kA==
X-Received: by 2002:a05:6808:2a6e:b0:3a8:7f65:a7a with SMTP id
 fu14-20020a0568082a6e00b003a87f650a7amr4501040oib.36.1694681310338; 
 Thu, 14 Sep 2023 01:48:30 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:29 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:23 +1000
Message-ID: <20230914084624.2299765-44-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 42/44] drm/nouveau/kms/nv50-: create connectors
 based on nvkm info
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

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  15 ++
 drivers/gpu/drm/nouveau/include/nvif/if0011.h |  10 ++
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 130 +++++++++---------
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   3 +-
 drivers/gpu/drm/nouveau/nvif/conn.c           |  22 ++-
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  26 ++++
 8 files changed, 139 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index e9ac3fb27ff7..13705c5f1497 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -256,7 +256,7 @@ nv04_display_create(struct drm_device *dev)
 	for (i = 0; i < dcb->entries; i++) {
 		struct dcb_output *dcbent = &dcb->entry[i];
 
-		connector = nouveau_connector_create(dev, dcbent);
+		connector = nouveau_connector_create(dev, dcbent->connector);
 		if (IS_ERR(connector))
 			continue;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 76d3fd1dec77..642b6bcde121 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2790,7 +2790,7 @@ nv50_display_create(struct drm_device *dev)
 			continue;
 		}
 
-		connector = nouveau_connector_create(dev, dcbe);
+		connector = nouveau_connector_create(dev, dcbe->connector);
 		if (IS_ERR(connector)) {
 			nvif_outp_dtor(&outp->outp);
 			kfree(outp);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/conn.h b/drivers/gpu/drm/nouveau/include/nvif/conn.h
index 8a6017a35897..406c12a111f9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/conn.h
@@ -7,6 +7,21 @@ struct nvif_disp;
 
 struct nvif_conn {
 	struct nvif_object object;
+	u32 id;
+
+	struct {
+		enum {
+			NVIF_CONN_VGA,
+			NVIF_CONN_TV,
+			NVIF_CONN_DVI_I,
+			NVIF_CONN_DVI_D,
+			NVIF_CONN_LVDS,
+			NVIF_CONN_LVDS_SPWG,
+			NVIF_CONN_HDMI,
+			NVIF_CONN_DP,
+			NVIF_CONN_EDP,
+		} type;
+	} info;
 };
 
 int nvif_conn_ctor(struct nvif_disp *, const char *name, int id, struct nvif_conn *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0011.h b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
index 0c25288a5a78..3ed0ddd75bd8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0011.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
@@ -7,6 +7,16 @@ union nvif_conn_args {
 		__u8 version;
 		__u8 id;	/* DCB connector table index. */
 		__u8 pad02[6];
+#define NVIF_CONN_V0_VGA       0x00
+#define NVIF_CONN_V0_TV        0x01
+#define NVIF_CONN_V0_DVI_I     0x02
+#define NVIF_CONN_V0_DVI_D     0x03
+#define NVIF_CONN_V0_LVDS      0x04
+#define NVIF_CONN_V0_LVDS_SPWG 0x05
+#define NVIF_CONN_V0_HDMI      0x06
+#define NVIF_CONN_V0_DP        0x07
+#define NVIF_CONN_V0_EDP       0x08
+		__u8 type;
 	} v0;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 34f5ad0fdfd6..bd55c3bd0957 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1275,15 +1275,13 @@ drm_conntype_from_dcb(enum dcb_connector_type dcb)
 }
 
 struct drm_connector *
-nouveau_connector_create(struct drm_device *dev,
-			 const struct dcb_output *dcbe)
+nouveau_connector_create(struct drm_device *dev, int index)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_connector *nv_connector = NULL;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	int index = dcbe->connector;
 	int type, ret = 0;
 	bool dummy;
 
@@ -1305,70 +1303,76 @@ nouveau_connector_create(struct drm_device *dev,
 	nv_connector->index = index;
 	INIT_WORK(&nv_connector->irq_work, nouveau_dp_irq);
 
-	/* attempt to parse vbios connector type and hotplug gpio */
-	nv_connector->dcb = olddcb_conn(dev, index);
-	if (nv_connector->dcb) {
-		u32 entry = ROM16(nv_connector->dcb[0]);
-		if (olddcb_conntab(dev)[3] >= 4)
-			entry |= (u32)ROM16(nv_connector->dcb[2]) << 16;
-
-		nv_connector->type = nv_connector->dcb[0];
-		if (drm_conntype_from_dcb(nv_connector->type) ==
-					  DRM_MODE_CONNECTOR_Unknown) {
-			NV_WARN(drm, "unknown connector type %02x\n",
-				nv_connector->type);
-			nv_connector->type = DCB_CONNECTOR_NONE;
+	if (disp->disp.conn_mask & BIT(nv_connector->index)) {
+		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
+				     &nv_connector->conn);
+		if (ret) {
+			kfree(nv_connector);
+			return ERR_PTR(ret);
 		}
 
-		/* Gigabyte NX85T */
-		if (nv_match_device(dev, 0x0421, 0x1458, 0x344c)) {
-			if (nv_connector->type == DCB_CONNECTOR_HDMI_1)
-				nv_connector->type = DCB_CONNECTOR_DVI_I;
+		switch (nv_connector->conn.info.type) {
+		case NVIF_CONN_VGA      : type = DCB_CONNECTOR_VGA; break;
+		case NVIF_CONN_DVI_I    : type = DCB_CONNECTOR_DVI_I; break;
+		case NVIF_CONN_DVI_D    : type = DCB_CONNECTOR_DVI_D; break;
+		case NVIF_CONN_LVDS     : type = DCB_CONNECTOR_LVDS; break;
+		case NVIF_CONN_LVDS_SPWG: type = DCB_CONNECTOR_LVDS_SPWG; break;
+		case NVIF_CONN_DP       : type = DCB_CONNECTOR_DP; break;
+		case NVIF_CONN_EDP      : type = DCB_CONNECTOR_eDP; break;
+		case NVIF_CONN_HDMI     : type = DCB_CONNECTOR_HDMI_0; break;
+		default:
+			WARN_ON(1);
+			return NULL;
 		}
 
-		/* Gigabyte GV-NX86T512H */
-		if (nv_match_device(dev, 0x0402, 0x1458, 0x3455)) {
-			if (nv_connector->type == DCB_CONNECTOR_HDMI_1)
-				nv_connector->type = DCB_CONNECTOR_DVI_I;
-		}
+		nv_connector->type = type;
 	} else {
-		nv_connector->type = DCB_CONNECTOR_NONE;
-	}
+		u8 *dcb = olddcb_conn(dev, nv_connector->index);
 
-	/* no vbios data, or an unknown dcb connector type - attempt to
-	 * figure out something suitable ourselves
-	 */
-	if (nv_connector->type == DCB_CONNECTOR_NONE) {
-		struct nouveau_drm *drm = nouveau_drm(dev);
-		struct dcb_table *dcbt = &drm->vbios.dcb;
-		u32 encoders = 0;
-		int i;
-
-		for (i = 0; i < dcbt->entries; i++) {
-			if (dcbt->entry[i].connector == nv_connector->index)
-				encoders |= (1 << dcbt->entry[i].type);
+		if (dcb)
+			nv_connector->type = dcb[0];
+		else
+			nv_connector->type = DCB_CONNECTOR_NONE;
+
+		/* attempt to parse vbios connector type and hotplug gpio */
+		if (nv_connector->type != DCB_CONNECTOR_NONE) {
+			if (drm_conntype_from_dcb(nv_connector->type) ==
+						  DRM_MODE_CONNECTOR_Unknown) {
+				NV_WARN(drm, "unknown connector type %02x\n",
+					nv_connector->type);
+				nv_connector->type = DCB_CONNECTOR_NONE;
+			}
 		}
 
-		if (encoders & (1 << DCB_OUTPUT_DP)) {
-			if (encoders & (1 << DCB_OUTPUT_TMDS))
-				nv_connector->type = DCB_CONNECTOR_DP;
-			else
-				nv_connector->type = DCB_CONNECTOR_eDP;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_TMDS)) {
-			if (encoders & (1 << DCB_OUTPUT_ANALOG))
-				nv_connector->type = DCB_CONNECTOR_DVI_I;
-			else
-				nv_connector->type = DCB_CONNECTOR_DVI_D;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_ANALOG)) {
-			nv_connector->type = DCB_CONNECTOR_VGA;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_LVDS)) {
-			nv_connector->type = DCB_CONNECTOR_LVDS;
-		} else
-		if (encoders & (1 << DCB_OUTPUT_TV)) {
-			nv_connector->type = DCB_CONNECTOR_TV_0;
+		/* no vbios data, or an unknown dcb connector type - attempt to
+		 * figure out something suitable ourselves
+		 */
+		if (nv_connector->type == DCB_CONNECTOR_NONE &&
+		    !WARN_ON(drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)) {
+			struct dcb_table *dcbt = &drm->vbios.dcb;
+			u32 encoders = 0;
+			int i;
+
+			for (i = 0; i < dcbt->entries; i++) {
+				if (dcbt->entry[i].connector == nv_connector->index)
+					encoders |= (1 << dcbt->entry[i].type);
+			}
+
+			if (encoders & (1 << DCB_OUTPUT_TMDS)) {
+				if (encoders & (1 << DCB_OUTPUT_ANALOG))
+					nv_connector->type = DCB_CONNECTOR_DVI_I;
+				else
+					nv_connector->type = DCB_CONNECTOR_DVI_D;
+			} else
+			if (encoders & (1 << DCB_OUTPUT_ANALOG)) {
+				nv_connector->type = DCB_CONNECTOR_VGA;
+			} else
+			if (encoders & (1 << DCB_OUTPUT_LVDS)) {
+				nv_connector->type = DCB_CONNECTOR_LVDS;
+			} else
+			if (encoders & (1 << DCB_OUTPUT_TV)) {
+				nv_connector->type = DCB_CONNECTOR_TV_0;
+			}
 		}
 	}
 
@@ -1414,13 +1418,7 @@ nouveau_connector_create(struct drm_device *dev,
 	drm_connector_helper_add(connector, &nouveau_connector_helper_funcs);
 	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
 
-	if (nv_connector->dcb && (disp->disp.conn_mask & BIT(nv_connector->index))) {
-		ret = nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_connector->index,
-				     &nv_connector->conn);
-		if (ret) {
-			goto drm_conn_err;
-		}
-
+	if (nvif_object_constructed(&nv_connector->conn.object)) {
 		ret = nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
 					   nouveau_connector_hotplug,
 					   NVIF_CONN_EVENT_V0_PLUG | NVIF_CONN_EVENT_V0_UNPLUG,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.h b/drivers/gpu/drm/nouveau/nouveau_connector.h
index 35bcb541722b..a2df4918340c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.h
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.h
@@ -121,7 +121,6 @@ struct nouveau_connector {
 	struct drm_connector base;
 	enum dcb_connector_type type;
 	u8 index;
-	u8 *dcb;
 
 	struct nvif_conn conn;
 	u64 hpd_pending;
@@ -200,7 +199,7 @@ nouveau_crtc_connector_get(struct nouveau_crtc *nv_crtc)
 }
 
 struct drm_connector *
-nouveau_connector_create(struct drm_device *, const struct dcb_output *);
+nouveau_connector_create(struct drm_device *, int id);
 void nouveau_connector_hpd(struct nouveau_connector *, u64 bits);
 
 extern int nouveau_tv_disable;
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index 879569d4ba4c..9ee18cb99264 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -63,5 +63,25 @@ nvif_conn_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_con
 	ret = nvif_object_ctor(&disp->object, name ?: "nvifConn", id, NVIF_CLASS_CONN,
 			       &args, sizeof(args), &conn->object);
 	NVIF_ERRON(ret, &disp->object, "[NEW conn id:%d]", id);
-	return ret;
+	if (ret)
+		return ret;
+
+	conn->id = id;
+
+	switch (args.type) {
+	case NVIF_CONN_V0_VGA      : conn->info.type = NVIF_CONN_VGA; break;
+	case NVIF_CONN_V0_TV       : conn->info.type = NVIF_CONN_TV; break;
+	case NVIF_CONN_V0_DVI_I    : conn->info.type = NVIF_CONN_DVI_I; break;
+	case NVIF_CONN_V0_DVI_D    : conn->info.type = NVIF_CONN_DVI_D; break;
+	case NVIF_CONN_V0_LVDS     : conn->info.type = NVIF_CONN_LVDS; break;
+	case NVIF_CONN_V0_LVDS_SPWG: conn->info.type = NVIF_CONN_LVDS_SPWG; break;
+	case NVIF_CONN_V0_HDMI     : conn->info.type = NVIF_CONN_HDMI; break;
+	case NVIF_CONN_V0_DP       : conn->info.type = NVIF_CONN_DP; break;
+	case NVIF_CONN_V0_EDP      : conn->info.type = NVIF_CONN_EDP; break;
+	default:
+		break;
+	}
+
+	return 0;
+
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 9d602ff6f347..ff82bb248492 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -151,6 +151,32 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	ret = -EBUSY;
 	spin_lock(&disp->client.lock);
 	if (!conn->object.func) {
+		switch (conn->info.type) {
+		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
+		case DCB_CONNECTOR_TV_0     :
+		case DCB_CONNECTOR_TV_1     :
+		case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
+		case DCB_CONNECTOR_DMS59_0  :
+		case DCB_CONNECTOR_DMS59_1  :
+		case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
+		case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
+		case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
+		case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+		case DCB_CONNECTOR_DMS59_DP0:
+		case DCB_CONNECTOR_DMS59_DP1:
+		case DCB_CONNECTOR_DP       :
+		case DCB_CONNECTOR_mDP      :
+		case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
+		case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
+		case DCB_CONNECTOR_HDMI_0   :
+		case DCB_CONNECTOR_HDMI_1   :
+		case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+		default:
+			WARN_ON(1);
+			ret = -EINVAL;
+			break;
+		}
+
 		nvkm_object_ctor(&nvkm_uconn, oclass, &conn->object);
 		*pobject = &conn->object;
 		ret = 0;
-- 
2.41.0

