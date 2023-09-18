Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4C07A53B1
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA7010E2FD;
	Mon, 18 Sep 2023 20:15:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E0410E2FD
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:47 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bf7423ef3eso36017995ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068146; x=1695672946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFKCWB+qGyIpzTcxNn4wbY5UpVzJ7QOXPbTYI8TS8H4=;
 b=MtTrfQ/pNWI+qTM8rgq4X1vw1vnvaAeAuzO5G+OJ07K7BSCWyPUHNmMrcZ584xS2vH
 lauPjkLNHV5dsG5TcDChaKHjoCPwinK7ch1A92aKHWVAnOkPhdH58H7LlvQrFmHIT0hf
 5m5qjAIKSYVFaMNh8z4LMV2YLwQsta5TzAmqfESdG1fuG71Gp8qBTuZjBNBv9ExicS6l
 enZG+XNTpf7KtpKCd1Rbd7SZpi9pcyML7vKVTZUTk8siFJlQSyCG8tAUzqVjSFMk9VDh
 98Set7zf4WkUHzy4RLQKwkKkt25+Gawp457PnhGzK5qH6exB+mg3it61C4cplnRUhdoN
 I6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068146; x=1695672946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CFKCWB+qGyIpzTcxNn4wbY5UpVzJ7QOXPbTYI8TS8H4=;
 b=O+S7CYLIr0gal2fRHlK2t8j5BQUBK9f0GaCZHBJq8rZyQqqFl5G3NPxRVDEt1rbgO2
 ra1SsEwSIcN2AHqcsMjWPqXaCJq/aSSi9dnuPgscVB+d0hjelLlU5IRb+OjkZ4vX9841
 yXlZULoly2WYggiPv6R1HKVI2p0ViCEmAgnjhnIKBOOJIzk7GKMlthtzLa3KyrdRgDUt
 +j0tKI++llBqfN2wNT/oMkZSaSB2TBbVK5SX770+p1r84116xTLxh+EtCyXlqEKwR6YH
 yFjBOap/SeoGq5HyumS7snYDTzmsSV5P7ZV4+VY+VReVej2U4Ht4Nm2ctW07faLpkzbR
 RIiQ==
X-Gm-Message-State: AOJu0YzJeSqQPzsyj7yOh8r1i9iVlrhiGtktBQ7zgoIVyO2fSiEjF+Qt
 ShhEhNgZYLzdZUFgWaSit/DRYqQKL8Y=
X-Google-Smtp-Source: AGHT+IGfBpshQ3ErBAPH68ECWh8AT70AtR9FQ11tQ1OjJ+ET5XNlhyMX6ZL1QCer8kdOdukxGDTJ1Q==
X-Received: by 2002:a17:902:da86:b0:1b8:6cab:db7f with SMTP id
 j6-20020a170902da8600b001b86cabdb7fmr9977035plx.53.1695068146445; 
 Mon, 18 Sep 2023 13:15:46 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:46 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:55 +1000
Message-ID: <20230918201404.3765-36-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 35/44] drm/nouveau/disp: add dp mst id get/put
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

