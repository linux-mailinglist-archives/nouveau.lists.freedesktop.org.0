Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51B7A53BA
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6994310E307;
	Mon, 18 Sep 2023 20:16:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED2D10E302
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:16:04 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c328b53aeaso44217165ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068163; x=1695672963; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sPN/mA9GZP/pfZVsp+msPICS1OeLH1G43oRadgjZTcQ=;
 b=bUw71KASyNT4E1wCNES/4LaqCrlWL9A+r0IFzs2UUbpT50m8TxZ1rn6sYoALaa28jv
 hnjzVSJ8aLQoENxB4I5Fk51sdm+pOzOjZxy8JeaA3i6APPbGijNsr/N7lhINPSA8FB6P
 DB1k63KL5Hs1Dlm6ia3qMESzqZo1KPzj7jxIxwxv7I1C4l2y+E6ndGDo4Dm7xRN6Gbrk
 OLNVNqPYhp4u7yzAiVDrr4QHslP7Wan4RiTKxYhWxCzY9qibMqFCl7GEnWsbCgWwI2EY
 D05fCL381UCWf1GSbrNirMImH6oH2jcC4ujzcSlQmXMAyAraG9dvdIXyAJJimODcSooR
 8m9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068163; x=1695672963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sPN/mA9GZP/pfZVsp+msPICS1OeLH1G43oRadgjZTcQ=;
 b=cFSd06VxTkfeqtxg4cIVtIh6LJrxIh5LNa3pkaVzW74W9l0pOyWLneuLqkMlz0I0Mu
 6dw14PUw719Y1ofjd98vexq7gO1cMNh78odxPMEN4GTH/7BVWGGHnDTa0Vc4iRL6jHxz
 dM6xcNM8jVRwUNm+ulB+ovUIdrU6yA1Ub6QKozQZd/KtUngqVesgIC8kRJYfroBRBgdo
 SPAc4Ey5C9oYQi2dp4Hore47FyB73VswjQFnbN2CdsTWo1KYCKbCRyfVf4gdKF/vlZ42
 ktlDl9WOHwbe7Q6WbX7tKJaUBP8eP074T1KsdmA8BqS+eMdB4zoDXrF5YRYivMXpJ0Jo
 KGFA==
X-Gm-Message-State: AOJu0Yx++rMMLRQjCjlyYxiqlq3kO4/XK6BBGlqwm2LauFEfSjzUjMIq
 o6hQJyziBjzhNQ18UQX5Uj3Grgs3kmE=
X-Google-Smtp-Source: AGHT+IEKqq/nL1cJMuzLbejqo6AIaoV2jhjrWw0mGbQmPqnJEjdGGBLdEvk8qJhxrcgGEQzLgZIqWQ==
X-Received: by 2002:a17:903:244a:b0:1c3:dafa:b1e9 with SMTP id
 l10-20020a170903244a00b001c3dafab1e9mr12734462pls.10.1695068163104; 
 Mon, 18 Sep 2023 13:16:03 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:16:02 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:14:02 +1000
Message-ID: <20230918201404.3765-43-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 42/44] drm/nouveau/kms/nv50-: create connectors
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

