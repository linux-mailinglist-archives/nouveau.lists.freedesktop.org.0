Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D2F7A538F
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E77C10E2E2;
	Mon, 18 Sep 2023 20:14:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608D610E0F4
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c44a25bd0bso18368345ad.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068080; x=1695672880; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aZjaspRqsrFZdRwQPArnBF5g6pUFmk50HvLX79djRzw=;
 b=InuEy8yySpykG73dMvXzFv+HhEXpgcM91COKikiPMX4+9h7cC/8AWbrw2X0sRqimWC
 UyOY9sgSHDqgw0GIjUfk+ix2njcQuL9KYnkpd9bLEemWkVD2gwhz9M9//oPa4+66ezan
 ZZHZEqq6YpRUkobZB9DgqyTusSXuxYXfpQCFP1yVdJDa+/UutgeG/bk3Wk8BKbAMPGBx
 AnAkAWxJJrcB7agzY1r47yvoRk7ugAkBudZD6P3MsXy/freLuxehVSBMvscSJamH0rUZ
 F7EzZpwiDL4zxEUCpf5WMhs4RBRP4jOSR2Dl5Au4hC2CmEt6gvFm5UNnCLV40yp1/tFL
 CGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068080; x=1695672880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aZjaspRqsrFZdRwQPArnBF5g6pUFmk50HvLX79djRzw=;
 b=PB6XX9EyBMYbebXk6bKI+rsCn+9hFbAPHySs2OY5nI+d1rRdt/BnofmeNz02CVNicd
 H1SBVaktnXom3kzRfAw9es7xrLQGr+zGaJYgQ4qMMc1hAg4/u/wJzIV+vHV6s4Ubmnne
 7Rxe8n49i0Ne0QtocDkL7wDr5omaK466rwUfWPP8awIJLjYUWLSegTly+U1o/LVV4SE1
 Wam3ehfBwFt7cT5zHpXercvtNS48/QFgBAYKn3T27Z2X5g6++mdfa/46VT9nbtfgO5QB
 nOP5FOjT1XTvCq1ZJ/1rrOwfp8wL3R1MOeKxSgDXCH2ak7iyFRicxwCo6fRwyTgrb0Xz
 ewDw==
X-Gm-Message-State: AOJu0Ywv9ViUFIhNb/9Cge6IhWH8sIXHTZvS4J5l52O0E0pOM5ebmZYq
 E0jdaCiG9Tr0E7uza+8tFXj8a7y29Hg=
X-Google-Smtp-Source: AGHT+IHTSgN+alaIYdm2sf3ycXEtZcUKwD3gAsDFel4BDVpmmQdrUmwbAVmjU103DG9CGJd00VTFrg==
X-Received: by 2002:a17:903:228b:b0:1c3:81b7:2385 with SMTP id
 b11-20020a170903228b00b001c381b72385mr796545plh.11.1695068080339; 
 Mon, 18 Sep 2023 13:14:40 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:39 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:28 +1000
Message-ID: <20230918201404.3765-9-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 08/44] drm/nouveau/disp: add output method to
 fetch edid
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

- needed to support TMDS EDID on RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 10 +++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  1 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 22 ++++++++------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 30 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 15 ++++++++++
 6 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 923bc30af2a9..725d6e8e3d2d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -13,6 +13,7 @@ union nvif_outp_args {
 };
 
 #define NVIF_OUTP_V0_DETECT        0x00
+#define NVIF_OUTP_V0_EDID_GET      0x01
 
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
@@ -36,6 +37,15 @@ union nvif_outp_detect_args {
 	} v0;
 };
 
+union nvif_outp_edid_get_args {
+	struct nvif_outp_edid_get_v0 {
+		__u8  version;
+		__u8  pad01;
+		__u16 size;
+		__u8  data[2048];
+	} v0;
+};
+
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index c3e1e4d2f1a1..7c2c34a84fbd 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -25,6 +25,7 @@ enum nvif_outp_detect_status {
 };
 
 enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
+int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index ff57466c8d28..b95ec49935fe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -570,7 +570,6 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
 	struct nouveau_encoder *nv_partner;
-	struct i2c_adapter *i2c;
 	int type;
 	int ret;
 	enum drm_connector_status conn_status = connector_status_disconnected;
@@ -593,15 +592,20 @@ nouveau_connector_detect(struct drm_connector *connector, bool force)
 	}
 
 	nv_encoder = nouveau_connector_ddc_detect(connector);
-	if (nv_encoder && (i2c = nv_encoder->i2c) != NULL) {
-		struct edid *new_edid;
+	if (nv_encoder) {
+		struct edid *new_edid = NULL;
 
-		if ((vga_switcheroo_handler_flags() &
-		     VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
-		    nv_connector->type == DCB_CONNECTOR_LVDS)
-			new_edid = drm_get_edid_switcheroo(connector, i2c);
-		else
-			new_edid = drm_get_edid(connector, i2c);
+		if (nv_encoder->i2c) {
+			if ((vga_switcheroo_handler_flags() & VGA_SWITCHEROO_CAN_SWITCH_DDC) &&
+			    nv_connector->type == DCB_CONNECTOR_LVDS)
+				new_edid = drm_get_edid_switcheroo(connector, nv_encoder->i2c);
+			else
+				new_edid = drm_get_edid(connector, nv_encoder->i2c);
+		} else {
+			ret = nvif_outp_edid_get(&nv_encoder->outp, (u8 **)&new_edid);
+			if (ret < 0)
+				return connector_status_disconnected;
+		}
 
 		nouveau_connector_set_edid(nv_connector, new_edid);
 		if (!nv_connector->edid) {
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 7f1daab35a0d..10480142eea5 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -210,6 +210,36 @@ nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 	return ret < 0 ? ret : args.load;
 }
 
+int
+nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
+{
+	struct nvif_outp_edid_get_v0 *args;
+	int ret;
+
+	args = kmalloc(sizeof(*args), GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	args->version = 0;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_EDID_GET, args, sizeof(*args));
+	NVIF_ERRON(ret, &outp->object, "[EDID_GET] size:%d", args->size);
+	if (ret)
+		goto done;
+
+	*pedid = kmalloc(args->size, GFP_KERNEL);
+	if (!*pedid) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	memcpy(*pedid, args->data, args->size);
+	ret = args->size;
+done:
+	kfree(args);
+	return ret;
+}
+
 enum nvif_outp_detect_status
 nvif_outp_detect(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 8c9fe878f320..1cd70868f225 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -87,6 +87,7 @@ struct nvkm_outp_func {
 	void (*fini)(struct nvkm_outp *);
 
 	int (*detect)(struct nvkm_outp *);
+	int (*edid_get)(struct nvkm_outp *, u8 *data, u16 *size);
 
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 43752e216ce8..0c4ffa3ffb28 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -275,6 +275,20 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	return ret;
 }
 
+static int
+nvkm_uoutp_mthd_edid_get(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_edid_get_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->edid_get)
+		return -EINVAL;
+
+	args->v0.size = ARRAY_SIZE(args->v0.data);
+	return outp->func->edid_get(outp, args->v0.data, &args->v0.size);
+}
+
 static int
 nvkm_uoutp_mthd_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -319,6 +333,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 {
 	switch (mthd) {
 	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
+	case NVIF_OUTP_V0_EDID_GET   : return nvkm_uoutp_mthd_edid_get   (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
-- 
2.41.0

