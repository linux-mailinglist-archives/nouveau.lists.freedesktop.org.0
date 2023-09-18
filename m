Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 429E77A5391
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9168110E2DF;
	Mon, 18 Sep 2023 20:14:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B83610E2E1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:46 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so38474395ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068085; x=1695672885; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/pa0TPEFsh2ea3/yAl0p3yh8634Vj7RyBH132kkDJtE=;
 b=GdxpPhVt+eIaBpGzG5XH4YtEU0Qa7wMiOWYruFHZ+CQ7YYZHp0ZcHUd8I5k2XsBBdz
 b74MLuFhRc3OvH707uiAJVo0t9/oeIEud6dB1gtsWGpAfjenC27LmLXUvi/dlYTbd0NO
 nms2UHwCQ34tv+irzQzR0IYQvjlj1v9oauykaYO0UuojQeRJG0XltqBtQnbgDRe/t0BY
 +/iBlmmeAavpyhMrJZhPYYfYVqkQxHkr2iqUt43enqaVTipD4bcbPLUC6TB8aHkO2Am5
 4hz8w0eIsw004JcB4erB8TAGip3wNAFionQ2+VOUebcMvR8nT3Qz4I91btZ/G3qKEZWr
 nDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068085; x=1695672885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pa0TPEFsh2ea3/yAl0p3yh8634Vj7RyBH132kkDJtE=;
 b=ZW0EyfobxJrcFUR6xY4umUn9LSgre7ivA02hqXocYWby7y+gsR7mh+PpS4VnMfdv2a
 PV7iF8pl7qwyp6t4y0fQHW+go6EyT9US/Xt68+JsnCCSZh5ccEunvK1iS6G8ceFWzJLi
 4w7FXPDAh+ICF5IF1CVKBeWr9elIWt/mZg/7Yu3M9nUlNm0jveT6Cj6KlXP5RyKwNB5g
 z9c4jU9O8aHgnA2YQSZr3cwbb5pMeFkbUWHLgsSdiOJfTOUz/5fiqp5a/VV4wC9zHpSo
 jyS01JC9C7bBLMTLSpkaOn3SsixK8NhXQoPkrfo2/mJq/66z8oVzMi4bU5ZycXg4E3I7
 8PhQ==
X-Gm-Message-State: AOJu0YwZynezy2bRXMZUvy9myeBhZLoooyIfrAtuD3dFlDx1EQA7gLar
 gvXezlYHA0zEPXDyX7SfE+n3YjFBWxE=
X-Google-Smtp-Source: AGHT+IH2ucbpgjGHkgnbpcQEftrhVjatF1o5S1OsdCd9i4us4S5CQpPyTSfp3TeN2QY9O5T3Xqy74g==
X-Received: by 2002:a17:902:7202:b0:1bc:10cf:50d8 with SMTP id
 ba2-20020a170902720200b001bc10cf50d8mr8547208plb.23.1695068085281; 
 Mon, 18 Sep 2023 13:14:45 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:44 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:30 +1000
Message-ID: <20230918201404.3765-11-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 10/44] drm/nouveau/kms: Add INHERIT ioctl to
 nvkm/nvif for reading IOR state
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

From: Lyude Paul <lyude@redhat.com>

Now that we're supporting things like Ada and the GSP, there's situations
where we really need to actually know the display state that we're starting
with when loading the driver in order to prevent breaking GSP expectations.
The first step in doing this is making it so that we can read the current
state of IORs from nvkm in DRM, so that we can fill in said into into the
atomic state.

We do this by introducing an INHERIT ioctl to nvkm/nvif. This is basically
another form of ACQUIRE, except that it will only acquire the given output
path for userspace if it's already set up in hardware. This way, we can go
through and probe each outp object we have in DRM in order to figure out
the current hardware state of each one. If the outp isn't in use, it simply
returns -ENODEV.

This is also part of the work that will be required for implementing GSP
support for display. While the GSP should mostly work without this commit,
this commit should fix some edge case bugs that can occur on initial driver
load. This also paves the way for some of the initial groundwork for
fastboot support.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 101 ++++++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h |  23 ++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |   5 +
 drivers/gpu/drm/nouveau/nvif/outp.c           |  68 ++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  39 ++++---
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   3 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  |  64 +++++++++++
 8 files changed, 291 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 2911167bf22a..32b40229fd18 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2521,6 +2521,104 @@ nv50_display_fini(struct drm_device *dev, bool runtime, bool suspend)
 		cancel_work_sync(&drm->hpd_work);
 }
 
+static inline void
+nv50_display_read_hw_or_state(struct drm_device *dev, struct nv50_disp *disp,
+			      struct nouveau_encoder *outp)
+{
+	struct drm_crtc *crtc;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *conn;
+	struct nv50_head_atom *armh;
+	const u32 encoder_mask = drm_encoder_mask(&outp->base.base);
+	bool found_conn = false, found_head = false;
+	u8 proto;
+	int head_idx;
+	int ret;
+
+	switch (outp->dcb->type) {
+	case DCB_OUTPUT_TMDS:
+		ret = nvif_outp_inherit_tmds(&outp->outp, &proto);
+		break;
+	case DCB_OUTPUT_DP:
+		ret = nvif_outp_inherit_dp(&outp->outp, &proto);
+		break;
+	case DCB_OUTPUT_LVDS:
+		ret = nvif_outp_inherit_lvds(&outp->outp, &proto);
+		break;
+	case DCB_OUTPUT_ANALOG:
+		ret = nvif_outp_inherit_rgb_crt(&outp->outp, &proto);
+		break;
+	default:
+		drm_dbg_kms(dev, "Readback for %s not implemented yet, skipping\n",
+			    outp->base.base.name);
+		drm_WARN_ON(dev, true);
+		return;
+	}
+
+	if (ret < 0)
+		return;
+
+	head_idx = ret;
+
+	drm_for_each_crtc(crtc, dev) {
+		if (crtc->index != head_idx)
+			continue;
+
+		armh = nv50_head_atom(crtc->state);
+		found_head = true;
+		break;
+	}
+	if (drm_WARN_ON(dev, !found_head))
+		return;
+
+	/* Figure out which connector is being used by this encoder */
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	nouveau_for_each_non_mst_connector_iter(conn, &conn_iter) {
+		if (nouveau_connector(conn)->index == outp->dcb->connector) {
+			found_conn = true;
+			break;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+	if (drm_WARN_ON(dev, !found_conn))
+		return;
+
+	armh->state.encoder_mask = encoder_mask;
+	armh->state.connector_mask = drm_connector_mask(conn);
+	armh->state.active = true;
+	armh->state.enable = true;
+	pm_runtime_get_noresume(dev->dev);
+
+	outp->crtc = crtc;
+	outp->ctrl = NVVAL(NV507D, SOR_SET_CONTROL, PROTOCOL, proto) | BIT(crtc->index);
+
+	drm_connector_get(conn);
+	conn->state->crtc = crtc;
+	conn->state->best_encoder = &outp->base.base;
+}
+
+/* Read back the currently programmed display state */
+static void
+nv50_display_read_hw_state(struct nouveau_drm *drm)
+{
+	struct drm_device *dev = drm->dev;
+	struct drm_encoder *encoder;
+	struct drm_modeset_acquire_ctx ctx;
+	struct nv50_disp *disp = nv50_disp(dev);
+	int ret;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+
+	drm_for_each_encoder(encoder, dev) {
+		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST)
+			continue;
+
+		nv50_display_read_hw_or_state(dev, disp, nouveau_encoder(encoder));
+	}
+
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+}
+
 static int
 nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 {
@@ -2538,6 +2636,9 @@ nv50_display_init(struct drm_device *dev, bool resume, bool runtime)
 		}
 	}
 
+	if (!resume)
+		nv50_display_read_hw_state(nouveau_drm(dev));
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 725d6e8e3d2d..6cfc885e0aa9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -15,6 +15,7 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DETECT        0x00
 #define NVIF_OUTP_V0_EDID_GET      0x01
 
+#define NVIF_OUTP_V0_INHERIT       0x10
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
@@ -96,6 +97,28 @@ union nvif_outp_acquire_args {
 	} v0;
 };
 
+union nvif_outp_inherit_args {
+	struct nvif_outp_inherit_v0 {
+		__u8 version;
+#define NVIF_OUTP_INHERIT_V0_RGB_CRT 0x00
+#define NVIF_OUTP_INHERIT_V0_TV      0x01
+#define NVIF_OUTP_INHERIT_V0_TMDS    0x02
+#define NVIF_OUTP_INHERIT_V0_LVDS    0x03
+#define NVIF_OUTP_INHERIT_V0_DP      0x04
+		// In/out. Input is one of the above values, output is the actual hw protocol
+		__u8 proto;
+		__u8 or;
+		__u8 link;
+		__u8 head;
+		union {
+			struct {
+				// TODO: Figure out padding, and whether we even want this field
+				__u8 hda;
+			} tmds;
+		};
+	} v0;
+};
+
 union nvif_outp_release_args {
 	struct nvif_outp_release_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 7c2c34a84fbd..23776057bfea 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -34,6 +34,11 @@ int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
 int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
 int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 			 int link_nr, int link_bw, bool hda, bool mst);
+int nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out);
+int nvif_outp_inherit_lvds(struct nvif_outp *outp, u8 *proto_out);
+int nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out);
+int nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out);
+
 void nvif_outp_release(struct nvif_outp *);
 int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
 int nvif_outp_hda_eld(struct nvif_outp *, int head, void *data, u32 size);
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 10480142eea5..795658f0c920 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -196,6 +196,74 @@ nvif_outp_acquire_rgb_crt(struct nvif_outp *outp)
 	return ret;
 }
 
+static int
+nvif_outp_inherit(struct nvif_outp *outp,
+		  u8 proto,
+		  struct nvif_outp_inherit_v0 *args,
+		  u8 *proto_out)
+{
+	int ret;
+
+	args->version = 0;
+	args->proto = proto;
+
+	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_INHERIT, args, sizeof(*args));
+	if (ret)
+		return ret;
+
+	outp->or.id = args->or;
+	outp->or.link = args->link;
+	*proto_out = args->proto;
+	return 0;
+}
+
+int
+nvif_outp_inherit_lvds(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_LVDS, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:LVDS] ret:%d", ret);
+	return ret ?: args.head;
+}
+
+int
+nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_TMDS, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:TMDS] ret:%d", ret);
+	return ret ?: args.head;
+}
+
+int
+nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_DP, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:DP] ret:%d", ret);
+
+	// TODO: Get current link info
+
+	return ret ?: args.head;
+}
+
+int
+nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out)
+{
+	struct nvif_outp_inherit_v0 args;
+	int ret;
+
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_RGB_CRT, &args, proto_out);
+	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:RGB_CRT] ret:%d", ret);
+	return ret ?: args.head;
+}
+
 int
 nvif_outp_load_detect(struct nvif_outp *outp, u32 loadval)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 0d2de4769b94..3b6d58c15452 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -808,6 +808,7 @@ nvkm_dp_func = {
 	.init = nvkm_dp_init,
 	.fini = nvkm_dp_fini,
 	.detect = nvkm_outp_detect,
+	.inherit = nvkm_outp_inherit,
 	.acquire = nvkm_dp_acquire,
 	.release = nvkm_dp_release,
 	.disable = nvkm_dp_disable,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 3ed93df475fc..5b55598e09c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -104,7 +104,7 @@ nvkm_outp_release_or(struct nvkm_outp *outp, u8 user)
 	}
 }
 
-static inline int
+int
 nvkm_outp_acquire_ior(struct nvkm_outp *outp, u8 user, struct nvkm_ior *ior)
 {
 	outp->ior = ior;
@@ -247,32 +247,30 @@ nvkm_outp_fini(struct nvkm_outp *outp)
 		outp->func->fini(outp);
 }
 
-static void
-nvkm_outp_init_route(struct nvkm_outp *outp)
+struct nvkm_ior *
+nvkm_outp_inherit(struct nvkm_outp *outp)
 {
 	struct nvkm_disp *disp = outp->disp;
+	struct nvkm_ior *ior;
 	enum nvkm_ior_proto proto;
 	enum nvkm_ior_type type;
-	struct nvkm_ior *ior;
 	int id, link;
 
 	/* Find any OR from the class that is able to support this device. */
 	proto = nvkm_outp_xlat(outp, &type);
 	if (proto == UNKNOWN)
-		return;
+		return NULL;
 
 	ior = nvkm_ior_find(disp, type, -1);
-	if (!ior) {
-		WARN_ON(1);
-		return;
-	}
+	if (WARN_ON(!ior))
+		return NULL;
 
 	/* Determine the specific OR, if any, this device is attached to. */
 	if (ior->func->route.get) {
 		id = ior->func->route.get(outp, &link);
 		if (id < 0) {
 			OUTP_DBG(outp, "no route");
-			return;
+			return NULL;
 		}
 	} else {
 		/* Prior to DCB 4.1, this is hardwired like so. */
@@ -281,10 +279,24 @@ nvkm_outp_init_route(struct nvkm_outp *outp)
 	}
 
 	ior = nvkm_ior_find(disp, type, id);
-	if (!ior) {
-		WARN_ON(1);
+	if (WARN_ON(!ior))
+		return NULL;
+
+	return ior;
+}
+
+static void
+nvkm_outp_init_route(struct nvkm_outp *outp)
+{
+	enum nvkm_ior_proto proto;
+	enum nvkm_ior_type type;
+	struct nvkm_ior *ior;
+
+	/* Find any OR from the class that is able to support this device. */
+	proto = nvkm_outp_xlat(outp, &type);
+	ior = outp->func->inherit(outp);
+	if (!ior)
 		return;
-	}
 
 	/* Determine if the OR is already configured for this device. */
 	ior->func->state(ior, &ior->arm);
@@ -362,6 +374,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 static const struct nvkm_outp_func
 nvkm_outp = {
 	.detect = nvkm_outp_detect,
+	.inherit = nvkm_outp_inherit,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 76d83fb9c6e5..ab1699b07acc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -77,7 +77,9 @@ void nvkm_outp_fini(struct nvkm_outp *);
 
 int nvkm_outp_detect(struct nvkm_outp *);
 
+struct nvkm_ior *nvkm_outp_inherit(struct nvkm_outp *);
 int nvkm_outp_acquire_or(struct nvkm_outp *, u8 user, bool hda);
+int nvkm_outp_acquire_ior(struct nvkm_outp *, u8 user, struct nvkm_ior *);
 void nvkm_outp_release(struct nvkm_outp *);
 void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
@@ -90,6 +92,7 @@ struct nvkm_outp_func {
 	int (*detect)(struct nvkm_outp *);
 	int (*edid_get)(struct nvkm_outp *, u8 *data, u16 *size);
 
+	struct nvkm_ior *(*inherit)(struct nvkm_outp *);
 	int (*acquire)(struct nvkm_outp *);
 	void (*release)(struct nvkm_outp *);
 	void (*disable)(struct nvkm_outp *, struct nvkm_ior *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 828db77af242..31b76f17fa70 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -252,6 +252,69 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_inherit_args *args = argv;
+	struct nvkm_ior *ior;
+	int ret = 0;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+		return -ENOSYS;
+
+	/* Ensure an ior is hooked up to this outp already */
+	ior = outp->func->inherit(outp);
+	if (!ior)
+		return -ENODEV;
+
+	/* With iors, there will be a separate output path for each type of connector - and all of
+	 * them will appear to be hooked up. Figure out which one is actually the one we're using
+	 * based on the protocol we were given over nvif
+	 */
+	switch (args->v0.proto) {
+	case NVIF_OUTP_INHERIT_V0_TMDS:
+		if (ior->arm.proto != TMDS)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_DP:
+		if (ior->arm.proto != DP)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_LVDS:
+		if (ior->arm.proto != LVDS)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_TV:
+		if (ior->arm.proto != TV)
+			return -ENODEV;
+		break;
+	case NVIF_OUTP_INHERIT_V0_RGB_CRT:
+		if (ior->arm.proto != CRT)
+			return -ENODEV;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	/* Make sure that userspace hasn't already acquired this */
+	if (outp->acquired) {
+		OUTP_ERR(outp, "cannot inherit an already acquired (%02x) outp", outp->acquired);
+		return -EBUSY;
+	}
+
+	/* Mark the outp acquired by userspace now that we've confirmed it's already active */
+	OUTP_TRACE(outp, "inherit %02x |= %02x %p", outp->acquired, NVKM_OUTP_USER, ior);
+	nvkm_outp_acquire_ior(outp, NVKM_OUTP_USER, ior);
+
+	args->v0.or = ior->id;
+	args->v0.link = ior->arm.link;
+	args->v0.head = ffs(ior->arm.head) - 1;
+	args->v0.proto = ior->arm.proto_evo;
+
+	return ret;
+}
+
 static int
 nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -334,6 +397,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 	switch (mthd) {
 	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
 	case NVIF_OUTP_V0_EDID_GET   : return nvkm_uoutp_mthd_edid_get   (outp, argv, argc);
+	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_LOAD_DETECT: return nvkm_uoutp_mthd_load_detect(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
-- 
2.41.0

