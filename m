Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3554E7A538E
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF5C010E0F4;
	Mon, 18 Sep 2023 20:14:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291CC10E2E1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:39 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c434c33ec0so24878925ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068078; x=1695672878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZWiITfG+NtW9GxEdCh3cUvX5wGgWRKBnenKsKcuqRk=;
 b=e48l7ZW+LbIged0Mcsc7+dWGA9jsjD4nN+ffp66YDntB5hNBrkfH+/aW30cZPY9O1B
 M9TQ9pvqGnfJOOwBx0qyAv2mGg5+E8WTGcOJZE3TwsFBcmOElLuWyoHL5KhCgifQkQGi
 l3tCkTVnvh/rxnPbH0osqS/QD4FLGp9VWdqA69OmqMBmp96jctchpodOifytyTfZEf2Y
 xFvchlbIdkRtxS+seM3aATryP4bkwAr1iQFHwryEmaCfwT+I+yqabwlsDPGt89xhjRX7
 NpqInH6iwZ/Kzp9msJzNpzruEvmaQhA0MRhxKTptnDacvwtwg4n4olosPc9VwWk10yP6
 Zdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068078; x=1695672878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZWiITfG+NtW9GxEdCh3cUvX5wGgWRKBnenKsKcuqRk=;
 b=ovcSo7p/LPH9ViwUKED3tJ6Y+t6d0DAdTrBAccXcwFwOCV+o7POq6Kww7E7c0hNnBU
 Y8YKlB3g1J12p40d9WU82tdcWZJ6kYPn6KOtkHQS13i9uoQscIc4vxDkR4W41TLfpKDz
 y75Efym1RZPirsyguT/eZMWQXsA1q+ABhCyL7lzYZw/ViMaUQSeeLxsNdEjpzET1bxqb
 MDiNkQarCN/cUbBXMpxj9OYgh07mXKuO08yx62wyySIw4fjxPTyPZZmKedB8Rhy3Qba/
 8pY20z/ZIQ3JetxGJY+d9+ZPdED2bdHn70+6pZksC93FWh9ENHVvqwy48YsqKL8vd0co
 7f8w==
X-Gm-Message-State: AOJu0Yx13m/WLfPLhEIY+DjUGUGc1jbGJb98J4CZSGmh5VrxRZrWqXkv
 3GLBujDEgRW/3sszeDSqMztdBq88xkw=
X-Google-Smtp-Source: AGHT+IGb7qlhf9ha4Iw3HkZzMC0O9z2NcmVnFyunOUIib1PInHHs9TZs2s5dvgOdBGlxz7+MXoexFQ==
X-Received: by 2002:a17:902:d2cb:b0:1c4:a650:21df with SMTP id
 n11-20020a170902d2cb00b001c4a65021dfmr4687030plc.50.1695068077791; 
 Mon, 18 Sep 2023 13:14:37 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:37 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:27 +1000
Message-ID: <20230918201404.3765-8-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 07/44] drm/nouveau/disp: add output detect
 method
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

This will check the relevant hotplug pin and skip the DDC probe we
currently do if a display is present.

- preparation for GSP-RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/conn.h   |  5 --
 drivers/gpu/drm/nouveau/include/nvif/if0011.h | 11 ----
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 12 ++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  9 +++
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 60 ++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_dp.c          | 10 +---
 drivers/gpu/drm/nouveau/nvif/conn.c           | 14 -----
 drivers/gpu/drm/nouveau/nvif/outp.c           | 25 ++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   | 28 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  6 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 41 -------------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 24 ++++++++
 13 files changed, 145 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/conn.h b/drivers/gpu/drm/nouveau/include/nvif/conn.h
index dc355e1dfafa..8a6017a35897 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/conn.h
@@ -18,11 +18,6 @@ nvif_conn_id(struct nvif_conn *conn)
 	return conn->object.handle;
 }
 
-#define NVIF_CONN_HPD_STATUS_UNSUPPORTED 0 /* negative if query fails */
-#define NVIF_CONN_HPD_STATUS_NOT_PRESENT 1
-#define NVIF_CONN_HPD_STATUS_PRESENT     2
-int nvif_conn_hpd_status(struct nvif_conn *);
-
 int nvif_conn_event_ctor(struct nvif_conn *, const char *name, nvif_event_func, u8 types,
 			 struct nvif_event *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0011.h b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
index 69b0b779f942..0c25288a5a78 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0011.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
@@ -20,15 +20,4 @@ union nvif_conn_event_args {
 		__u8 pad02[6];
 	} v0;
 };
-
-#define NVIF_CONN_V0_HPD_STATUS 0x00000000
-
-union nvif_conn_hpd_status_args {
-	struct nvif_conn_hpd_status_v0 {
-		__u8 version;
-		__u8 support;
-		__u8 present;
-		__u8 pad03[5];
-	} v0;
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 7c56f653070c..923bc30af2a9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -12,6 +12,8 @@ union nvif_outp_args {
 	} v0;
 };
 
+#define NVIF_OUTP_V0_DETECT        0x00
+
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
@@ -24,6 +26,16 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_RETRAIN    0x73
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
+union nvif_outp_detect_args {
+	struct nvif_outp_detect_v0 {
+		__u8 version;
+#define NVIF_OUTP_DETECT_V0_NOT_PRESENT 0x00
+#define NVIF_OUTP_DETECT_V0_PRESENT     0x01
+#define NVIF_OUTP_DETECT_V0_UNKNOWN     0x02
+		__u8 status;
+	} v0;
+};
+
 union nvif_outp_load_detect_args {
 	struct nvif_outp_load_detect_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index fa76a7b5e4b3..c3e1e4d2f1a1 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -17,6 +17,15 @@ struct nvif_outp {
 
 int nvif_outp_ctor(struct nvif_disp *, const char *name, int id, struct nvif_outp *);
 void nvif_outp_dtor(struct nvif_outp *);
+
+enum nvif_outp_detect_status {
+	NOT_PRESENT,
+	PRESENT,
+	UNKNOWN,
+};
+
+enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
+
 int nvif_outp_load_detect(struct nvif_outp *, u32 loadval);
 int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
 int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 79ea30aac31f..ff57466c8d28 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -413,6 +413,7 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 {
 	struct drm_device *dev = connector->dev;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
+	struct nouveau_connector *conn = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL, *found = NULL;
 	struct drm_encoder *encoder;
 	int ret;
@@ -421,33 +422,48 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 	drm_connector_for_each_possible_encoder(connector, encoder) {
 		nv_encoder = nouveau_encoder(encoder);
 
-		switch (nv_encoder->dcb->type) {
-		case DCB_OUTPUT_DP:
-			ret = nouveau_dp_detect(nouveau_connector(connector),
-						nv_encoder);
-			if (ret == NOUVEAU_DP_MST)
-				return NULL;
-			else if (ret == NOUVEAU_DP_SST)
-				found = nv_encoder;
+		if (nvif_object_constructed(&nv_encoder->outp.object)) {
+			enum nvif_outp_detect_status status;
+
+			if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
+				ret = nouveau_dp_detect(conn, nv_encoder);
+				if (ret == NOUVEAU_DP_MST)
+					return NULL;
+				if (ret != NOUVEAU_DP_SST)
+					continue;
+
+				return nv_encoder;
+			} else {
+				status = nvif_outp_detect(&nv_encoder->outp);
+				switch (status) {
+				case PRESENT:
+					return nv_encoder;
+				case NOT_PRESENT:
+					continue;
+				case UNKNOWN:
+					break;
+				default:
+					WARN_ON(1);
+					break;
+				}
+			}
+		}
 
-			break;
-		case DCB_OUTPUT_LVDS:
+		if (!nv_encoder->i2c)
+			continue;
+
+		if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS) {
 			switcheroo_ddc = !!(vga_switcheroo_handler_flags() &
 					    VGA_SWITCHEROO_CAN_SWITCH_DDC);
-			fallthrough;
-		default:
-			if (!nv_encoder->i2c)
-				break;
+		}
 
-			if (switcheroo_ddc)
-				vga_switcheroo_lock_ddc(pdev);
-			if (nvkm_probe_i2c(nv_encoder->i2c, 0x50))
-				found = nv_encoder;
-			if (switcheroo_ddc)
-				vga_switcheroo_unlock_ddc(pdev);
+		if (switcheroo_ddc)
+			vga_switcheroo_lock_ddc(pdev);
+		if (nvkm_probe_i2c(nv_encoder->i2c, 0x50))
+			found = nv_encoder;
+		if (switcheroo_ddc)
+			vga_switcheroo_unlock_ddc(pdev);
 
-			break;
-		}
 		if (found)
 			break;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 6a4980b2d4d4..01aa9b9c74a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -132,14 +132,8 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 		}
 	}
 
-	/* Check status of HPD pin before attempting an AUX transaction that
-	 * would result in a number of (futile) retries on a connector which
-	 * has no display plugged.
-	 *
-	 * TODO: look into checking this before probing I2C to detect DVI/HDMI
-	 */
-	hpd = nvif_conn_hpd_status(&nv_connector->conn);
-	if (hpd == NVIF_CONN_HPD_STATUS_NOT_PRESENT) {
+	hpd = nvif_outp_detect(&nv_encoder->outp);
+	if (hpd == NOT_PRESENT) {
 		nvif_outp_dp_aux_pwr(&nv_encoder->outp, false);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index a3cf91aeae2d..879569d4ba4c 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -45,20 +45,6 @@ nvif_conn_event_ctor(struct nvif_conn *conn, const char *name, nvif_event_func f
 	return ret;
 }
 
-int
-nvif_conn_hpd_status(struct nvif_conn *conn)
-{
-	struct nvif_conn_hpd_status_v0 args;
-	int ret;
-
-	args.version = 0;
-
-	ret = nvif_mthd(&conn->object, NVIF_CONN_V0_HPD_STATUS, &args, sizeof(args));
-	NVIF_ERRON(ret, &conn->object, "[HPD_STATUS] support:%d present:%d",
-		   args.support, args.present);
-	return ret ? ret : !!args.support + !!args.present;
-}
-
 void
 nvif_conn_dtor(struct nvif_conn *conn)
 {
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index c24bc5eae3ec..7f1daab35a0d 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -210,6 +210,31 @@ nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 	return ret < 0 ? ret : args.load;
 }
 
+enum nvif_outp_detect_status
+nvif_outp_detect(struct nvif_outp *outp)
+{
+	struct nvif_outp_detect_v0 args;
+	int ret;
+
+	args.version = 0;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_DETECT, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DETECT] status:%02x", args.status);
+	if (ret)
+		return UNKNOWN;
+
+	switch (args.status) {
+	case NVIF_OUTP_DETECT_V0_NOT_PRESENT: return NOT_PRESENT;
+	case NVIF_OUTP_DETECT_V0_PRESENT: return PRESENT;
+	case NVIF_OUTP_DETECT_V0_UNKNOWN: return UNKNOWN;
+	default:
+		WARN_ON(1);
+		break;
+	}
+
+	return UNKNOWN;
+}
+
 void
 nvif_outp_dtor(struct nvif_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index b8ac66b4a2c4..0d2de4769b94 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -807,6 +807,7 @@ nvkm_dp_func = {
 	.dtor = nvkm_dp_dtor,
 	.init = nvkm_dp_init,
 	.fini = nvkm_dp_fini,
+	.detect = nvkm_outp_detect,
 	.acquire = nvkm_dp_acquire,
 	.release = nvkm_dp_release,
 	.disable = nvkm_dp_disable,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 6094805fbd63..fb061144438d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -22,11 +22,13 @@
  * Authors: Ben Skeggs
  */
 #include "outp.h"
+#include "conn.h"
 #include "dp.h"
 #include "ior.h"
 
 #include <subdev/bios.h>
 #include <subdev/bios/dcb.h>
+#include <subdev/gpio.h>
 #include <subdev/i2c.h>
 
 void
@@ -207,6 +209,31 @@ nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
 	return nvkm_outp_acquire_hda(outp, type, user, false);
 }
 
+int
+nvkm_outp_detect(struct nvkm_outp *outp)
+{
+	struct nvkm_gpio *gpio = outp->disp->engine.subdev.device->gpio;
+	int ret = -EINVAL;
+
+	if (outp->conn->info.hpd != DCB_GPIO_UNUSED) {
+		ret = nvkm_gpio_get(gpio, 0, DCB_GPIO_UNUSED, outp->conn->info.hpd);
+		if (ret < 0)
+			return ret;
+		if (ret)
+			return 1;
+
+		/*TODO: Look into returning NOT_PRESENT if !HPD on DVI/HDMI.
+		 *
+		 *      It's uncertain whether this is accurate for all older chipsets,
+		 *      so we're returning UNKNOWN, and the DRM will probe DDC instead.
+		 */
+		if (outp->info.type == DCB_OUTPUT_DP)
+			return 0;
+	}
+
+	return ret;
+}
+
 void
 nvkm_outp_fini(struct nvkm_outp *outp)
 {
@@ -328,6 +355,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 
 static const struct nvkm_outp_func
 nvkm_outp = {
+	.detect = nvkm_outp_detect,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 4e7f873f66e2..8c9fe878f320 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -74,6 +74,9 @@ int nvkm_outp_new(struct nvkm_disp *, int index, struct dcb_output *, struct nvk
 void nvkm_outp_del(struct nvkm_outp **);
 void nvkm_outp_init(struct nvkm_outp *);
 void nvkm_outp_fini(struct nvkm_outp *);
+
+int nvkm_outp_detect(struct nvkm_outp *);
+
 int nvkm_outp_acquire(struct nvkm_outp *, u8 user, bool hda);
 void nvkm_outp_release(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
@@ -82,6 +85,9 @@ struct nvkm_outp_func {
 	void *(*dtor)(struct nvkm_outp *);
 	void (*init)(struct nvkm_outp *);
 	void (*fini)(struct nvkm_outp *);
+
+	int (*detect)(struct nvkm_outp *);
+
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
 	void (*disable)(struct nvkm_outp *, struct nvkm_ior *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 46b057fe1412..9d602ff6f347 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -109,46 +109,6 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 			       nvkm_uconn_uevent_gpio);
 }
 
-static int
-nvkm_uconn_mthd_hpd_status(struct nvkm_conn *conn, void *argv, u32 argc)
-{
-	struct nvkm_gpio *gpio = conn->disp->engine.subdev.device->gpio;
-	union nvif_conn_hpd_status_args *args = argv;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
-	args->v0.support = gpio && conn->info.hpd != DCB_GPIO_UNUSED;
-	args->v0.present = 0;
-
-	if (args->v0.support) {
-		int ret = nvkm_gpio_get(gpio, 0, DCB_GPIO_UNUSED, conn->info.hpd);
-
-		if (WARN_ON(ret < 0)) {
-			args->v0.support = false;
-			return 0;
-		}
-
-		args->v0.present = ret;
-	}
-
-	return 0;
-}
-
-static int
-nvkm_uconn_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvkm_conn *conn = nvkm_uconn(object);
-
-	switch (mthd) {
-	case NVIF_CONN_V0_HPD_STATUS: return nvkm_uconn_mthd_hpd_status(conn, argv, argc);
-	default:
-		break;
-	}
-
-	return -EINVAL;
-}
-
 static void *
 nvkm_uconn_dtor(struct nvkm_object *object)
 {
@@ -164,7 +124,6 @@ nvkm_uconn_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uconn = {
 	.dtor = nvkm_uconn_dtor,
-	.mthd = nvkm_uconn_mthd,
 	.uevent = nvkm_uconn_uevent,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 440ea52cc7d2..43752e216ce8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -275,6 +275,29 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	return ret;
 }
 
+static int
+nvkm_uoutp_mthd_detect(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_detect_args *args = argv;
+	int ret;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+	if (!outp->func->detect)
+		return -EINVAL;
+
+	ret = outp->func->detect(outp);
+	switch (ret) {
+	case 0: args->v0.status = NVIF_OUTP_DETECT_V0_NOT_PRESENT; break;
+	case 1: args->v0.status = NVIF_OUTP_DETECT_V0_PRESENT; break;
+	default:
+		args->v0.status = NVIF_OUTP_DETECT_V0_UNKNOWN;
+		break;
+	}
+
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
@@ -295,6 +318,7 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
+	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
-- 
2.41.0

