Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404B27A53A2
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D51F10E2ED;
	Mon, 18 Sep 2023 20:15:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC9710E2EF
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:18 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1c3cbfa40d6so44316345ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068117; x=1695672917; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CmGTKm8Zc/Ke3YZLNWYXYbn77eCy4lSbo52AICVigiM=;
 b=FdrgZwy1VbFDPX+pDt7GJzIqnHFa1nkBr1WYDNqLK+t4f8tAX/wAAl8HXdfwUZjfwL
 PmHetQ7O8TD1HO7ufHr7YjReHV8TgvygSUoPC1TtWFjtT7N0Hghb6Thr0g54q0vFcGoh
 Psgb2sx1EPs6+1GnH0csNHuI+QxpiphBghcT3Rm/uywgTfQYIDf2ZE6sxBy7RXOVXkHd
 e87dCI68BsxX7i98lkReuheZ4n+Y+Hzdkd8I7Ew7RhXGA+LA3xrLDhPdwLHJqd2BSrYF
 Bbt5UqIknWJib1qH7U2A19OhR5j+BYcd/alIgHN5isbqDRWphpn22VYSk5sDPiS194yA
 92kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068117; x=1695672917;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CmGTKm8Zc/Ke3YZLNWYXYbn77eCy4lSbo52AICVigiM=;
 b=NjHv2FJ4MOq9ZMnUs6vs02aGX6VFyYD3ow4+sFKWJMEMU7poKNpodl1CvOAHMSy+hE
 Er/n8PmtMT7d3hSYvTmXVO3YF2szDiiisbStA6mWjG/JSNxikuP19qelLagt8nonX6Gz
 Te83TIZfE+ok5Iml+SDvu/IVxxOaNvwlzBLygti5mV+6sinLyWCXvs4Ez6qmeObUitcP
 Kg3f6UfHfoAc//dFzX0F+nLAWCd3X+C4oiNg6Ol6xz/ZyPpgUwscvtU2jbTVuN6d0tSK
 UEVu+9ksyPbKTUwpcRd3Biyl5L+Bf1PbrUK5bbqA4LvaWFvZNGphJJkCrh33YqIKZTKT
 eN0A==
X-Gm-Message-State: AOJu0Yw5vlSy9R1C0vCV4Ibh0T3DJ4/L71cXXAZX052zTWJRUobFyHjn
 tUZ6DFOKlA6rM1w7uggkY4Tv2eeovIM=
X-Google-Smtp-Source: AGHT+IEZS/NGX/osVIv+3kXCnLDMW5Hx9eR0TMVvt+QNGg4S3CV8HzOs2dEMvtACqZcnSzw3SfJjdw==
X-Received: by 2002:a17:902:728a:b0:1bb:d048:3173 with SMTP id
 d10-20020a170902728a00b001bbd0483173mr10275626pll.61.1695068117195; 
 Mon, 18 Sep 2023 13:15:17 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:16 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:43 +1000
Message-ID: <20230918201404.3765-24-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 23/44] drm/nouveau/disp: add output backlight
 control methods
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
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 17 ++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  3 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c   | 90 ++-----------------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 27 ++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  | 38 ++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |  7 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 32 +++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 38 ++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  8 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 41 +++++++++
 22 files changed, 233 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 230084d675ec..f878784593b4 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -21,6 +21,9 @@ union nvif_outp_args {
 
 #define NVIF_OUTP_V0_LOAD_DETECT   0x20
 
+#define NVIF_OUTP_V0_BL_GET        0x30
+#define NVIF_OUTP_V0_BL_SET        0x31
+
 #define NVIF_OUTP_V0_HDMI          0x50
 
 #define NVIF_OUTP_V0_INFOFRAME     0x60
@@ -118,6 +121,20 @@ union nvif_outp_release_args {
 	} vn;
 };
 
+union nvif_outp_bl_get_args {
+	struct nvif_outp_bl_get_v0 {
+		__u8  version;
+		__u8  level;
+	} v0;
+};
+
+union nvif_outp_bl_set_args {
+	struct nvif_outp_bl_set_v0 {
+		__u8  version;
+		__u8  level;
+	} v0;
+};
+
 union nvif_outp_hdmi_args {
 	struct nvif_outp_hdmi_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index ea60d418d7f0..ef63d22b62f8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -47,6 +47,9 @@ nvif_outp_acquired(struct nvif_outp *outp)
 	return outp->or.id >= 0;
 }
 
+int nvif_outp_bl_get(struct nvif_outp *);
+int nvif_outp_bl_set(struct nvif_outp *, int level);
+
 int nvif_outp_hdmi(struct nvif_outp *, int head, bool enable, u8 max_ac_packet, u8 rekey, u32 khz,
 		   bool scdc, bool scdc_scrambling, bool scdc_low_rates);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 91b5ecc57538..d47442125fa1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -109,42 +109,6 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
 	return 0;
 }
 
-static int
-nv50_get_intensity(struct backlight_device *bd)
-{
-	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
-	int or = ffs(nv_encoder->dcb->or) - 1;
-	u32 div = 1025;
-	u32 val;
-
-	val  = nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(or));
-	val &= NV50_PDISP_SOR_PWM_CTL_VAL;
-	return ((val * 100) + (div / 2)) / div;
-}
-
-static int
-nv50_set_intensity(struct backlight_device *bd)
-{
-	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
-	int or = ffs(nv_encoder->dcb->or) - 1;
-	u32 div = 1025;
-	u32 val = (bd->props.brightness * div) / 100;
-
-	nvif_wr32(device, NV50_PDISP_SOR_PWM_CTL(or),
-		  NV50_PDISP_SOR_PWM_CTL_NEW | val);
-	return 0;
-}
-
-static const struct backlight_ops nv50_bl_ops = {
-	.options = BL_CORE_SUSPENDRESUME,
-	.get_brightness = nv50_get_intensity,
-	.update_status = nv50_set_intensity,
-};
-
 /*
  * eDP brightness callbacks need to happen under lock, since we need to
  * enable/disable the backlight ourselves for modesets
@@ -238,53 +202,25 @@ static const struct backlight_ops nv50_edp_bl_ops = {
 };
 
 static int
-nva3_get_intensity(struct backlight_device *bd)
+nv50_get_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
-	int or = ffs(nv_encoder->dcb->or) - 1;
-	u32 div, val;
 
-	div  = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
-	val  = nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(or));
-	val &= NVA3_PDISP_SOR_PWM_CTL_VAL;
-	if (div && div >= val)
-		return ((val * 100) + (div / 2)) / div;
-
-	return 100;
+	return nvif_outp_bl_get(&nv_encoder->outp);
 }
 
 static int
-nva3_set_intensity(struct backlight_device *bd)
+nv50_set_intensity(struct backlight_device *bd)
 {
 	struct nouveau_encoder *nv_encoder = bl_get_data(bd);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
-	int or = ffs(nv_encoder->dcb->or) - 1;
-	u32 div, val;
-
-	div = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
 
-	val = backlight_get_brightness(bd);
-	if (val)
-		val = (val * div) / 100;
-
-	if (div) {
-		nvif_wr32(device, NV50_PDISP_SOR_PWM_CTL(or),
-			  val |
-			  NV50_PDISP_SOR_PWM_CTL_NEW |
-			  NVA3_PDISP_SOR_PWM_CTL_UNK);
-		return 0;
-	}
-
-	return -EINVAL;
+	return nvif_outp_bl_set(&nv_encoder->outp, backlight_get_brightness(bd));
 }
 
-static const struct backlight_ops nva3_bl_ops = {
+static const struct backlight_ops nv50_bl_ops = {
 	.options = BL_CORE_SUSPENDRESUME,
-	.get_brightness = nva3_get_intensity,
-	.update_status = nva3_set_intensity,
+	.get_brightness = nv50_get_intensity,
+	.update_status = nv50_set_intensity,
 };
 
 /* FIXME: perform backlight probing for eDP _before_ this, this only gets called after connector
@@ -298,13 +234,12 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 		    const struct backlight_ops **ops)
 {
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
-	struct nvif_object *device = &drm->client.device.object;
 
 	/*
 	 * Note when this runs the connectors have not been probed yet,
 	 * so nv_conn->base.status is not set yet.
 	 */
-	if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
+	if (nvif_outp_bl_get(&nv_encoder->outp) < 0 ||
 	    drm_helper_probe_detect(&nv_conn->base, NULL, false) != connector_status_connected)
 		return -ENODEV;
 
@@ -346,15 +281,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
 		}
 	}
 
-	if (drm->client.device.info.chipset <= 0xa0 ||
-	    drm->client.device.info.chipset == 0xaa ||
-	    drm->client.device.info.chipset == 0xac)
-		*ops = &nv50_bl_ops;
-	else
-		*ops = &nva3_bl_ops;
-
+	*ops = &nv50_bl_ops;
 	props->max_brightness = 100;
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 6e1bcc265d07..5a3c0dd7d532 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -165,6 +165,33 @@ nvif_outp_acquire_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
 	return ret;
 }
 
+int
+nvif_outp_bl_set(struct nvif_outp *outp, int level)
+{
+	struct nvif_outp_bl_set_v0 args;
+	int ret;
+
+	args.version = 0;
+	args.level = level;
+
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_BL_SET, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[BL_SET level:%d]", args.level);
+	return ret;
+}
+
+int
+nvif_outp_bl_get(struct nvif_outp *outp)
+{
+	struct nvif_outp_bl_get_v0 args;
+	int ret;
+
+	args.version = 0;
+
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_BL_GET, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[BL_GET level:%d]", args.level);
+	return ret ? ret : args.level;
+}
+
 void
 nvif_outp_release(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 3b6d58c15452..0e6e38800376 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -812,6 +812,8 @@ nvkm_dp_func = {
 	.acquire = nvkm_dp_acquire,
 	.release = nvkm_dp_release,
 	.disable = nvkm_dp_disable,
+	.bl.get = nvkm_outp_bl_get,
+	.bl.set = nvkm_outp_bl_set,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c
index 23ae451ba473..1be97a68a83e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c
@@ -124,6 +124,7 @@ g84_sor = {
 	.state = nv50_sor_state,
 	.power = nv50_sor_power,
 	.clock = nv50_sor_clock,
+	.bl = &nv50_sor_bl,
 	.hdmi = &g84_sor_hdmi,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
index 67ef889a0c5f..843a2661ce9d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
@@ -295,6 +295,7 @@ g94_sor = {
 	.clock = nv50_sor_clock,
 	.war_2 = g94_sor_war_2,
 	.war_3 = g94_sor_war_3,
+	.bl = &nv50_sor_bl,
 	.hdmi = &g84_sor_hdmi,
 	.dp = &g94_sor_dp,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
index 52099b75f52a..efe66ba3c61f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
@@ -105,6 +105,7 @@ ga102_sor = {
 	.state = gv100_sor_state,
 	.power = nv50_sor_power,
 	.clock = ga102_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gv100_sor_hdmi,
 	.dp = &ga102_sor_dp,
 	.hda = &gv100_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
index 937baae6a3eb..b48ead31da30 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
@@ -328,6 +328,7 @@ gf119_sor = {
 	.state = gf119_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gf119_sor_hdmi,
 	.dp = &gf119_sor_dp,
 	.hda = &gf119_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
index 876a21a0cebb..a3e2fbadade4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
@@ -115,6 +115,7 @@ gk104_sor = {
 	.state = gf119_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gk104_sor_hdmi,
 	.dp = &gf119_sor_dp,
 	.hda = &gf119_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c
index b4d8e868616f..688e123ad482 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c
@@ -70,6 +70,7 @@ gm107_sor = {
 	.state = gf119_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gk104_sor_hdmi,
 	.dp = &gm107_sor_dp,
 	.hda = &gf119_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
index 126a90805dee..511e7831b2f5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
@@ -147,6 +147,7 @@ gm200_sor = {
 	.state = gf119_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gm200_sor_hdmi,
 	.dp = &gm200_sor_dp,
 	.hda = &gf119_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c
index 7f1eb4332040..4070447bd800 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c
@@ -37,6 +37,7 @@ gp100_sor = {
 	.state = gf119_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gm200_sor_hdmi,
 	.dp = &gm200_sor_dp,
 	.hda = &gf119_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
index 506ffbe7b842..6318721b66f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
@@ -182,11 +182,49 @@ gt215_sor_hdmi = {
 	.infoframe_vsi = gt215_sor_hdmi_infoframe_vsi,
 };
 
+static int
+gt215_sor_bl_set(struct nvkm_ior *ior, int lvl)
+{
+	struct nvkm_device *device = ior->disp->engine.subdev.device;
+	const u32 soff = nv50_ior_base(ior);
+	u32 div, val;
+
+	div = nvkm_rd32(device, 0x61c080 + soff);
+	val = (lvl * div) / 100;
+	if (div)
+		nvkm_wr32(device, 0x61c084 + soff, 0xc0000000 | val);
+
+	return 0;
+}
+
+static int
+gt215_sor_bl_get(struct nvkm_ior *ior)
+{
+	struct nvkm_device *device = ior->disp->engine.subdev.device;
+	const u32 soff = nv50_ior_base(ior);
+	u32 div, val;
+
+	div  = nvkm_rd32(device, 0x61c080 + soff);
+	val  = nvkm_rd32(device, 0x61c084 + soff);
+	val &= 0x00ffffff;
+	if (div && div >= val)
+		return ((val * 100) + (div / 2)) / div;
+
+	return 100;
+}
+
+const struct nvkm_ior_func_bl
+gt215_sor_bl = {
+	.get = gt215_sor_bl_get,
+	.set = gt215_sor_bl_set,
+};
+
 static const struct nvkm_ior_func
 gt215_sor = {
 	.state = g94_sor_state,
 	.power = nv50_sor_power,
 	.clock = nv50_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gt215_sor_hdmi,
 	.dp = &gt215_sor_dp,
 	.hda = &gt215_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 7ac59bab6309..e1634f7bca56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -212,6 +212,7 @@ gv100_sor = {
 	.state = gv100_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gv100_sor_hdmi,
 	.dp = &gv100_sor_dp,
 	.hda = &gv100_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index f8b9d16304e9..6e750890bcc9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -63,6 +63,11 @@ struct nvkm_ior_func {
 	void (*war_2)(struct nvkm_ior *);
 	void (*war_3)(struct nvkm_ior *);
 
+	const struct nvkm_ior_func_bl {
+		int (*get)(struct nvkm_ior *);
+		int (*set)(struct nvkm_ior *, int lvl);
+	} *bl;
+
 	const struct nvkm_ior_func_hdmi {
 		void (*ctrl)(struct nvkm_ior *, int head, bool enable, u8 max_ac_packet, u8 rekey);
 		void (*scdc)(struct nvkm_ior *, u32 khz, bool support, bool scrambling,
@@ -123,6 +128,7 @@ int nv50_sor_cnt(struct nvkm_disp *, unsigned long *);
 void nv50_sor_state(struct nvkm_ior *, struct nvkm_ior_state *);
 void nv50_sor_power(struct nvkm_ior *, bool, bool, bool, bool, bool);
 void nv50_sor_clock(struct nvkm_ior *);
+extern const struct nvkm_ior_func_bl nv50_sor_bl;
 
 int g84_sor_new(struct nvkm_disp *, int);
 extern const struct nvkm_ior_func_hdmi g84_sor_hdmi;
@@ -139,6 +145,7 @@ void g94_sor_dp_audio_sym(struct nvkm_ior *, int, u16, u32);
 void g94_sor_dp_activesym(struct nvkm_ior *, int, u8, u8, u8, u8);
 void g94_sor_dp_watermark(struct nvkm_ior *, int, u8);
 
+extern const struct nvkm_ior_func_bl gt215_sor_bl;
 extern const struct nvkm_ior_func_hdmi gt215_sor_hdmi;
 void gt215_sor_dp_audio(struct nvkm_ior *, int, bool);
 extern const struct nvkm_ior_func_hda gt215_sor_hda;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c
index f96ba4752655..e0c5fb6df3d7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c
@@ -44,6 +44,7 @@ mcp89_sor = {
 	.state = g94_sor_state,
 	.power = nv50_sor_power,
 	.clock = nv50_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gt215_sor_hdmi,
 	.dp = &mcp89_sor_dp,
 	.hda = &gt215_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index a4ce60517789..948a46f3a1bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -156,6 +156,37 @@ nv50_pior_cnt(struct nvkm_disp *disp, unsigned long *pmask)
 	return 3;
 }
 
+static int
+nv50_sor_bl_set(struct nvkm_ior *ior, int lvl)
+{
+	struct nvkm_device *device = ior->disp->engine.subdev.device;
+	const u32 soff = nv50_ior_base(ior);
+	u32 div = 1025;
+	u32 val = (lvl * div) / 100;
+
+	nvkm_wr32(device, 0x61c084 + soff, 0x80000000 | val);
+	return 0;
+}
+
+static int
+nv50_sor_bl_get(struct nvkm_ior *ior)
+{
+	struct nvkm_device *device = ior->disp->engine.subdev.device;
+	const u32 soff = nv50_ior_base(ior);
+	u32 div = 1025;
+	u32 val;
+
+	val  = nvkm_rd32(device, 0x61c084 + soff);
+	val &= 0x000007ff;
+	return ((val * 100) + (div / 2)) / div;
+}
+
+const struct nvkm_ior_func_bl
+nv50_sor_bl = {
+	.get = nv50_sor_bl_get,
+	.set = nv50_sor_bl_set,
+};
+
 void
 nv50_sor_clock(struct nvkm_ior *sor)
 {
@@ -220,6 +251,7 @@ nv50_sor = {
 	.state = nv50_sor_state,
 	.power = nv50_sor_power,
 	.clock = nv50_sor_clock,
+	.bl = &nv50_sor_bl,
 };
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 20a013f1bbba..28ec7b378513 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -209,6 +209,42 @@ nvkm_outp_acquire_or(struct nvkm_outp *outp, u8 user, bool hda)
 	return nvkm_outp_acquire_hda(outp, type, user, false);
 }
 
+int
+nvkm_outp_bl_set(struct nvkm_outp *outp, int level)
+{
+	int ret;
+
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_PRIV, false);
+	if (ret)
+		return ret;
+
+	if (outp->ior->func->bl)
+		ret = outp->ior->func->bl->set(outp->ior, level);
+	else
+		ret = -EINVAL;
+
+	nvkm_outp_release_or(outp, NVKM_OUTP_PRIV);
+	return ret;
+}
+
+int
+nvkm_outp_bl_get(struct nvkm_outp *outp)
+{
+	int ret;
+
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_PRIV, false);
+	if (ret)
+		return ret;
+
+	if (outp->ior->func->bl)
+		ret = outp->ior->func->bl->get(outp->ior);
+	else
+		ret = -EINVAL;
+
+	nvkm_outp_release_or(outp, NVKM_OUTP_PRIV);
+	return ret;
+}
+
 int
 nvkm_outp_detect(struct nvkm_outp *outp)
 {
@@ -376,6 +412,8 @@ static const struct nvkm_outp_func
 nvkm_outp = {
 	.detect = nvkm_outp_detect,
 	.inherit = nvkm_outp_inherit,
+	.bl.get = nvkm_outp_bl_get,
+	.bl.set = nvkm_outp_bl_set,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index ab1699b07acc..38b6b43a9f20 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -84,6 +84,9 @@ void nvkm_outp_release(struct nvkm_outp *);
 void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
 
+int nvkm_outp_bl_get(struct nvkm_outp *);
+int nvkm_outp_bl_set(struct nvkm_outp *, int level);
+
 struct nvkm_outp_func {
 	void *(*dtor)(struct nvkm_outp *);
 	void (*init)(struct nvkm_outp *);
@@ -96,6 +99,11 @@ struct nvkm_outp_func {
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
 	void (*disable)(struct nvkm_outp *, struct nvkm_ior *);
+
+	struct {
+		int (*get)(struct nvkm_outp *);
+		int (*set)(struct nvkm_outp *, int level);
+	} bl;
 };
 
 #define OUTP_MSG(o,l,f,a...) do {                                              \
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index f5242a672279..19f5d3a6035e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -88,6 +88,7 @@ tu102_sor = {
 	.state = gv100_sor_state,
 	.power = nv50_sor_power,
 	.clock = gf119_sor_clock,
+	.bl = &gt215_sor_bl,
 	.hdmi = &gv100_sor_hdmi,
 	.dp = &tu102_sor_dp,
 	.hda = &gv100_sor_hda,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 40cbb4ddc037..c1775524919f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -181,6 +181,45 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_bl_set(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_bl_get_args *args = argv;
+	int ret;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	if (outp->func->bl.set)
+		ret = outp->func->bl.set(outp, args->v0.level);
+	else
+		ret = -EINVAL;
+
+	return ret;
+}
+
+static int
+nvkm_uoutp_mthd_bl_get(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_bl_get_args *args = argv;
+	int ret;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	if (outp->func->bl.get) {
+		ret = outp->func->bl.get(outp);
+		if (ret >= 0) {
+			args->v0.level = ret;
+			ret = 0;
+		}
+	} else {
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static int
 nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -388,6 +427,8 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
+	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
+	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

