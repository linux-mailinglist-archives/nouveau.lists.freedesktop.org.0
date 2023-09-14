Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAB079FEE7
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3B810E549;
	Thu, 14 Sep 2023 08:48:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42C3A10E546
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:18 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-68fc9a4ebe9so595551b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681297; x=1695286097; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ngdhUDMfmS1yECI1uCg1EMT99o6JY47wx1X4m/c1R4c=;
 b=fCBVJM2Q9zaE55Qm6pk3UCYll/vd+nmO0dLMIMUmKyyhD0uXwPD3IK01fwyfdeH5rD
 2d6ixL1MoQ102E1QZGm+ZJCgwx6bbv3kpn2+H40KiOMLS2D4IUCFaFxO1zMqRNY00psi
 eLYiENU4MUelJOwDJJf5fMf1qnUdH+3Tr1GkOteTMTrZtaQuucFPaH95qZ0o/GOhUgfk
 mzhO5gswmda+tDSHCKYezNSaceyY+PHy83IKn9Ye2962C8c6UC0iXAgpsMB8eGtb0rKv
 NVS5HYMWEHOm4ZspN8NLRM6p4XUoIoYOEwOfQ2PJFGXKBYl6z3wLyuMx7eZ4oHcZl1nm
 u/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681297; x=1695286097;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ngdhUDMfmS1yECI1uCg1EMT99o6JY47wx1X4m/c1R4c=;
 b=URKiiuFUEmLCGL+oO3lLN2VYVoDe3fKlQwY8IaYeeuZ4zPy+PG0NqmtnnrthEUpUR4
 XxXtTHOmhJJhvGpZiQTM9aHKl+awRbLO6brhFpDBGA/sxPzNkadDW7bVD0olbd8Xe5a1
 Rw5wyiX06DIEPAZFX5fIO263F7qK3ils3KkoiqTE6Z5NSLG81FS9M63TreDXM1yKVgmg
 4MB1e8R0Saqh+WF1X15aXT1GOhY0xEXavhUjBRgf0LrX4FahVXtx73h/YNOasnps6ltD
 ou9n4jqXlbDqgP0g68JQTaTHJVPvQ61WjgNR/67eOePi0a6FitTj24+OZMXOdlvuA5CP
 WKFA==
X-Gm-Message-State: AOJu0YwYLhu7oTCL7crzNV3/NBWyxx7/WnA5FgIhCS6l15Y1Ot5E3wgq
 i6EGRWsRCo9HRjnuDH4HcKThTuFMfWA=
X-Google-Smtp-Source: AGHT+IES7Dd2Qg3ewcx6G4dYupSwAwi73U5maz/45Nqgi1TVjfOKg6SApReHqxsdGcl3IlGKaa97mw==
X-Received: by 2002:a05:6a21:6d84:b0:132:a85f:b20c with SMTP id
 wl4-20020a056a216d8400b00132a85fb20cmr5758685pzb.38.1694681297330; 
 Thu, 14 Sep 2023 01:48:17 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:16 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:17 +1000
Message-ID: <20230914084624.2299765-38-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 36/44] drm/nouveau/disp: add dp mst id get/put
 methods
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
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 32 ++++++++++++++++---
 drivers/gpu/drm/nouveau/dispnv50/head.h       |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   | 14 ++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 18 +++++++++++
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  2 ++
 drivers/gpu/drm/nouveau/nvif/outp.c           | 29 +++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 15 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 28 ++++++++++++++++
 9 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9cce1323338b..2c1dd7106518 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -869,6 +869,8 @@ struct nv50_msto {
 	struct nv50_mstc *mstc;
 	bool disabled;
 	bool enabled;
+
+	u32 display_id;
 };
 
 struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder)
@@ -893,10 +895,17 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
 	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
 	struct drm_dp_mst_atomic_payload *payload =
 		drm_atomic_get_mst_payload_state(mst_state, msto->mstc->port);
+	struct nv50_mstc *mstc = msto->mstc;
+	struct nv50_mstm *mstm = mstc->mstm;
 
 	NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
 
 	if (msto->disabled) {
+		if (msto->head->func->display_id) {
+			nvif_outp_dp_mst_id_put(&mstm->outp->outp, msto->display_id);
+			msto->display_id = 0;
+		}
+
 		msto->mstc = NULL;
 		msto->disabled = false;
 	} else if (msto->enabled) {
@@ -1039,6 +1048,11 @@ nv50_msto_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *st
 		nouveau_dp_train(mstm->outp, true, 0, 0);
 	}
 
+	if (head->func->display_id) {
+		if (!WARN_ON(nvif_outp_dp_mst_id_get(&mstm->outp->outp, &msto->display_id)))
+			head->func->display_id(head, msto->display_id);
+	}
+
 	if (mstm->outp->outp.or.link & 1)
 		proto = NV917D_SOR_SET_CONTROL_PROTOCOL_DP_A;
 	else
@@ -1059,6 +1073,9 @@ nv50_msto_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *s
 	struct nv50_mstc *mstc = msto->mstc;
 	struct nv50_mstm *mstm = mstc->mstm;
 
+	if (msto->head->func->display_id)
+		msto->head->func->display_id(msto->head, 0);
+
 	mstm->outp->update(mstm->outp, msto->head->base.index, NULL, 0, 0);
 	mstm->modified = true;
 	if (!--mstm->links)
@@ -1542,7 +1559,7 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
+	struct nv50_head *head = nv50_head(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
@@ -1561,7 +1578,7 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 #endif
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_TMDS && nv_encoder->hdmi.enabled) {
-		nvif_outp_hdmi(&nv_encoder->outp, nv_crtc->index,
+		nvif_outp_hdmi(&nv_encoder->outp, head->base.index,
 			       false, 0, 0, 0, false, false, false);
 		nv_encoder->hdmi.enabled = false;
 	}
@@ -1569,8 +1586,11 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
 		nouveau_dp_power_down(nv_encoder);
 
-	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
-	nv50_audio_disable(encoder, nv_crtc);
+	if (head->func->display_id)
+		head->func->display_id(head, 0);
+
+	nv_encoder->update(nv_encoder, head->base.index, NULL, 0, 0);
+	nv50_audio_disable(encoder, &head->base);
 	nv_encoder->crtc = NULL;
 }
 
@@ -1583,6 +1603,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		nv50_head_atom(drm_atomic_get_new_crtc_state(state, &nv_crtc->base));
 	struct drm_display_mode *mode = &asyh->state.adjusted_mode;
 	struct nv50_disp *disp = nv50_disp(encoder->dev);
+	struct nv50_head *head = nv50_head(&nv_crtc->base);
 	struct nvif_outp *outp = &nv_encoder->outp;
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
@@ -1680,6 +1701,9 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		break;
 	}
 
+	if (head->func->display_id)
+		head->func->display_id(head, BIT(nv_encoder->dcb->id));
+
 	nv_encoder->update(nv_encoder, nv_crtc->index, asyh, proto, depth);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index 41c8788dfb31..e9d17037ffcf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -49,6 +49,7 @@ struct nv50_head_func {
 	int (*procamp)(struct nv50_head *, struct nv50_head_atom *);
 	int (*or)(struct nv50_head *, struct nv50_head_atom *);
 	void (*static_wndw_map)(struct nv50_head *, struct nv50_head_atom *);
+	int (*display_id)(struct nv50_head *, u32 display_id);
 };
 
 extern const struct nv50_head_func head507d;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 543f08ceaad6..53b1248c40ec 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -27,6 +27,19 @@
 
 #include <nvhw/class/clc57d.h>
 
+static int
+headc57d_display_id(struct nv50_head *head, u32 display_id)
+{
+	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	int ret;
+
+	if ((ret = PUSH_WAIT(push, 2)))
+		return ret;
+
+	PUSH_NVSQ(push, NVC57D, 0x2020 + (head->base.index * 0x400), display_id);
+	return 0;
+}
+
 static int
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
@@ -250,4 +263,5 @@ headc57d = {
 	.or = headc57d_or,
 	/* TODO: flexible window mappings */
 	.static_wndw_map = headc37d_static_wndw_map,
+	.display_id = headc57d_display_id,
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 6fb297b65ae8..502f342e0d77 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -37,6 +37,8 @@ union nvif_outp_args {
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
 #define NVIF_OUTP_V0_DP_SST        0x75
+#define NVIF_OUTP_V0_DP_MST_ID_GET 0x76
+#define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
 union nvif_outp_detect_args {
@@ -234,6 +236,22 @@ union nvif_outp_dp_sst_args {
 	} v0;
 };
 
+union nvif_outp_dp_mst_id_put_args {
+	struct nvif_outp_dp_mst_id_put_v0 {
+		__u8  version;
+		__u8  pad01[3];
+		__u32 id;
+	} v0;
+};
+
+union nvif_outp_dp_mst_id_get_args {
+	struct nvif_outp_dp_mst_id_get_v0 {
+		__u8  version;
+		__u8  pad01[3];
+		__u32 id;
+	} v0;
+};
+
 union nvif_outp_dp_mst_vcpi_args {
 	struct nvif_outp_dp_mst_vcpi_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 881cbed5f0ee..2d86838ed559 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -69,6 +69,8 @@ int nvif_outp_dp_train(struct nvif_outp *, u8 dpcd[DP_RECEIVER_CAP_SIZE],
 		       bool retrain);
 int nvif_outp_dp_drive(struct nvif_outp *, u8 link_nr, u8 pe[4], u8 vs[4]);
 int nvif_outp_dp_sst(struct nvif_outp *, int head, u32 watermark, u32 hblanksym, u32 vblanksym);
+int nvif_outp_dp_mst_id_get(struct nvif_outp *, u32 *id);
+int nvif_outp_dp_mst_id_put(struct nvif_outp *, u32 id);
 int nvif_outp_dp_mst_vcpi(struct nvif_outp *, int head,
 			  u8 start_slot, u8 num_slots, u16 pbn, u16 aligned_pbn);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 952103aa93b7..97e5855c2cf5 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -46,6 +46,35 @@ nvif_outp_dp_mst_vcpi(struct nvif_outp *outp, int head,
 	return ret;
 }
 
+int
+nvif_outp_dp_mst_id_put(struct nvif_outp *outp, u32 id)
+{
+	struct nvif_outp_dp_mst_id_get_v0 args;
+	int ret;
+
+	args.version = 0;
+	args.id = id;
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_ID_PUT, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_PUT id:%08x]", args.id);
+	return ret;
+}
+
+int
+nvif_outp_dp_mst_id_get(struct nvif_outp *outp, u32 *id)
+{
+	struct nvif_outp_dp_mst_id_get_v0 args;
+	int ret;
+
+	args.version = 0;
+	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_MST_ID_GET, &args, sizeof(args));
+	NVIF_ERRON(ret, &outp->object, "[DP_MST_ID_GET] id:%08x", args.id);
+	if (ret)
+		return ret;
+
+	*id = args.id;
+	return 0;
+}
+
 int
 nvif_outp_dp_sst(struct nvif_outp *outp, int head, u32 watermark, u32 hblanksym, u32 vblanksym)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 77a91d42b977..aaa7796946ce 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -41,6 +41,19 @@
  */
 #define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
 
+static int
+nvkm_dp_mst_id_put(struct nvkm_outp *outp, u32 id)
+{
+	return 0;
+}
+
+static int
+nvkm_dp_mst_id_get(struct nvkm_outp *outp, u32 *pid)
+{
+	*pid = BIT(outp->index);
+	return 0;
+}
+
 static int
 nvkm_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *size)
 {
@@ -614,6 +627,8 @@ nvkm_dp_func = {
 	.dp.aux_xfer = nvkm_dp_aux_xfer,
 	.dp.train = nvkm_dp_train,
 	.dp.drive = nvkm_dp_drive,
+	.dp.mst_id_get = nvkm_dp_mst_id_get,
+	.dp.mst_id_put = nvkm_dp_mst_id_put,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index cda17941de89..3ec7318d9144 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -109,6 +109,8 @@ struct nvkm_outp_func {
 		int (*rates)(struct nvkm_outp *);
 		int (*train)(struct nvkm_outp *, bool retrain);
 		int (*drive)(struct nvkm_outp *, u8 lanes, u8 pe[4], u8 vs[4]);
+		int (*mst_id_get)(struct nvkm_outp *, u32 *id);
+		int (*mst_id_put)(struct nvkm_outp *, u32 id);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 225f88fbdae0..ad52d9ed594a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -45,6 +45,32 @@ nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 	return 0;
 }
 
+static int
+nvkm_uoutp_mthd_dp_mst_id_put(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_mst_id_put_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+	        return -ENOSYS;
+	if (!outp->func->dp.mst_id_put)
+	        return -EINVAL;
+
+	return outp->func->dp.mst_id_put(outp, args->v0.id);
+}
+
+static int
+nvkm_uoutp_mthd_dp_mst_id_get(struct nvkm_outp *outp, void *argv, u32 argc)
+{
+	union nvif_outp_dp_mst_id_get_args *args = argv;
+
+	if (argc != sizeof(args->v0) || args->v0.version != 0)
+	        return -ENOSYS;
+	if (!outp->func->dp.mst_id_get)
+	        return -EINVAL;
+
+	return outp->func->dp.mst_id_get(outp, &args->v0.id);
+}
+
 static int
 nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -482,6 +508,8 @@ nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
+	case NVIF_OUTP_V0_DP_MST_ID_GET: return nvkm_uoutp_mthd_dp_mst_id_get(outp, argv, argc);
+	case NVIF_OUTP_V0_DP_MST_ID_PUT: return nvkm_uoutp_mthd_dp_mst_id_put(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_VCPI  : return nvkm_uoutp_mthd_dp_mst_vcpi  (outp, argv, argc);
 	default:
 		break;
-- 
2.41.0

