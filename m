Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD179FEC5
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C22710E52B;
	Thu, 14 Sep 2023 08:47:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4111C10E52B
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:17 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68fe2470d81so616082b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681236; x=1695286036; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RxNSxp8D7ICT6ihiUbVB/4f14Rj3eHOxJUCIUvg8Tcw=;
 b=l1ulIsRKEre/P/xjnuZxAdLCxofhICuVZ1C0GVeJlIIDuntK6iRZ/2JWfb+GqBayOH
 0oMsPGiC9OFQgQV6VX3Ol55DBbEKRcNCoGomSniWDm3veHng5t0y1bYsNNM/Rq0DUt6P
 TJYzv/OuQ350XvDYy8/LxGJJgXEg6baMmEMMt0H0vYU8fyueCij45LmIwkWv/vJFmUFS
 h/ad/XZEuQFgnQjk8C0wLQEKuANQL2OchdyJMgrKvmpEY5bnbKOD26HkWfwm4w0GVrZk
 4cDC5Z+pGdpjsIwtBtH97YWVN8+6r/xhd9Hxz5tp6ce/i0xewGXI/HEMroYDShOiVQG/
 Ycmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681236; x=1695286036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RxNSxp8D7ICT6ihiUbVB/4f14Rj3eHOxJUCIUvg8Tcw=;
 b=nipPlO8dqeePcKK4tWLkd4xq2wV5ApGJW//dWK31dMAqzG1mWrmZTKfvNBPMoOoc2Y
 FVw60S4WteCNJ2Iq1SP++3Q26uW6WFgNurs/4fghWuU6OMGvhwMaMmQOHQYOQTYFxPdJ
 TtMDauUvDBHXt48LZrpyy+44XJSC3uUO0enuXE93f5FxdivSPXhGgUTbFNx1pqOnu6pp
 rAB2argAwY8ju7vuVqHfdBVGUqksc5QnRWbMmN1RGqdfBG914Tz8Fu9Ubd5Zwhf5VusI
 w9fhu9gWRDzSgKHouwWBFOT+JFVOR6zhj8OplBenOmqOWf4rYJeSJlNL+Tk5Wl+r8O5d
 GQsQ==
X-Gm-Message-State: AOJu0YxDk7JVXTCfFTgIYSFRA4fzQj6tUgG+eYGW2FG+wmSUXEgeCRpp
 k9LW1N+qh/IR8Fsh+8sBa0ZPx5pXgeA=
X-Google-Smtp-Source: AGHT+IHeTIlD4gCnibHcOD7Yd31TzHsWGWGcjTuMhrmlTgiqOidYmAXyW3YRp0uS57pUTRijsqHMcQ==
X-Received: by 2002:a05:6a20:1041:b0:13f:9cee:ff42 with SMTP id
 gt1-20020a056a20104100b0013f9ceeff42mr4181614pzc.41.1694681235856; 
 Thu, 14 Sep 2023 01:47:15 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:15 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:49 +1000
Message-ID: <20230914084624.2299765-10-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 08/44] drm/nouveau/disp: add output method to
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

