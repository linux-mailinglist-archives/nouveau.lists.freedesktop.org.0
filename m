Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6680F710203
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781FA10E6AA;
	Thu, 25 May 2023 00:31:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7B510E6A4
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:33 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-52c30fa5271so602879a12.0
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974693; x=1687566693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hqQCLajPZFGXhzoICv/q0MvRmpPjli96MuPJKU7m2rM=;
 b=CJJQY+IQ/rdTWGVV/fyHRb66ktwWjBilG+IiA7tSsMT2fEIdnNRpnQjB1X78bliqqg
 +UseiFJ1HOfsJi/GFbXK7rYkQD+D3zgL8B5HK+srwGgEeUw+7sWKLqg6fSUB8C+FDjbX
 7OWLcgIbzWpqqoajkNX87fiU5BmBqKrOe+r3UXoxt+2rhvRF/6PoSQwt6MIIqM65qr2w
 aFoFei9Ksyi86dcFrpf6x5P6wA1VVjOCwOyDitQlAhOnMhcrxUCuh3HszOBHjfTWiuMH
 BW0K/LOfJuDBtEI+1bx+cMuDj1snw+qbjyjVFrRTnFcHC/LfuX3w1LY6bGZ1BVCWnZhE
 sQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974693; x=1687566693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hqQCLajPZFGXhzoICv/q0MvRmpPjli96MuPJKU7m2rM=;
 b=LAJxcHDLVA0T0JdwdUBBQ9uZR0dWgWDFndjAfSpCBwW9PjmNUlHD4/vwpqdW2KuGCP
 rWpbCZd2vafWaiaxVh7W4FNtlljUFw16shF29N8O9LYj4QjKnKWhAWGEUjfhFLnaPt9v
 PiJhk9R8IYk6QavxwgIurYxUlNWdDKkbBDVmg1LCaZPc9tSIF1CVoLw0Hse07wpMfqUh
 E9a/YOCglw8//3fVXJJyEwHQvdEKjTsx2VrggyYqdBZTLPyYFcmPoKVPrXce3zys05Nb
 tT728Nx0jmea06ezCwfkbmeKLlSOlOIoABJKyym+nbF/p4DUeZC2Ww/kmScHWAS39weg
 OL8g==
X-Gm-Message-State: AC+VfDyLUrVUY2AlJJ3MnNUGYVxf1SPyQvr0cjuUqzPAd10Z140NCDiK
 fEzfmA5QzhyUcwZ/XwFc0L0stytcAkk=
X-Google-Smtp-Source: ACHHUZ4b4rnFOAKIOs8qlwu/FEOxCPkn0mBbFV7TYc+0tSCPnzhuK+NuK9e1G1JRum/6e2tnQEYdIA==
X-Received: by 2002:a17:90a:e40b:b0:255:c5f7:ff37 with SMTP id
 hv11-20020a17090ae40b00b00255c5f7ff37mr5523960pjb.7.1684974692616; 
 Wed, 24 May 2023 17:31:32 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:32 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:04 +1000
Message-Id: <20230525003106.3853741-8-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 08/10] drm/nouveau/fifo/ga100-: add per-runlist
 nonstall intr handling
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

GSP-RM will enforce this, so implement on HW too so we can share code.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/core/engine.h    |  1 +
 .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    | 10 ++++
 .../gpu/drm/nouveau/nvkm/engine/ce/ga102.c    |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   | 32 +++++-----
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 59 +++++++++++++++----
 .../gpu/drm/nouveau/nvkm/engine/fifo/runl.h   |  6 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c | 12 ++++
 .../gpu/drm/nouveau/nvkm/engine/gr/ga102.c    |  7 +++
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.c    | 12 ++++
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.h    |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h |  1 +
 13 files changed, 116 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
index 8041fe03237e..738899fcf30b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
@@ -22,6 +22,7 @@ struct nvkm_engine_func {
 	int (*init)(struct nvkm_engine *);
 	int (*fini)(struct nvkm_engine *, bool suspend);
 	int (*reset)(struct nvkm_engine *);
+	int (*nonstall)(struct nvkm_engine *);
 	void (*intr)(struct nvkm_engine *);
 	void (*tile)(struct nvkm_engine *, int region, struct nvkm_fb_tile *);
 	bool (*chsw_load)(struct nvkm_engine *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
index 6648ed62daa6..315a69f7fdd1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
@@ -35,6 +35,15 @@ ga100_ce_intr(struct nvkm_inth *inth)
 	return IRQ_NONE;
 }
 
+int
+ga100_ce_nonstall(struct nvkm_engine *engine)
+{
+	struct nvkm_subdev *subdev = &engine->subdev;
+	struct nvkm_device *device = subdev->device;
+
+	return nvkm_rd32(device, 0x104424 + (subdev->inst * 0x80)) & 0x00000fff;
+}
+
 int
 ga100_ce_fini(struct nvkm_engine *engine, bool suspend)
 {
@@ -67,6 +76,7 @@ ga100_ce = {
 	.oneinit = ga100_ce_oneinit,
 	.init = ga100_ce_init,
 	.fini = ga100_ce_fini,
+	.nonstall = ga100_ce_nonstall,
 	.cclass = &gv100_ce_cclass,
 	.sclass = {
 		{ -1, -1, AMPERE_DMA_COPY_A },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
index 9f3448ad625f..461b73c7e2e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
@@ -28,6 +28,7 @@ ga102_ce = {
 	.oneinit = ga100_ce_oneinit,
 	.init = ga100_ce_init,
 	.fini = ga100_ce_fini,
+	.nonstall = ga100_ce_nonstall,
 	.cclass = &gv100_ce_cclass,
 	.sclass = {
 		{ -1, -1, AMPERE_DMA_COPY_A },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
index 53ba2abe0bf5..0be72c463b21 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
@@ -12,4 +12,5 @@ extern const struct nvkm_object_func gv100_ce_cclass;
 int ga100_ce_oneinit(struct nvkm_engine *);
 int ga100_ce_init(struct nvkm_engine *);
 int ga100_ce_fini(struct nvkm_engine *, bool);
+int ga100_ce_nonstall(struct nvkm_engine *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 5ea9a2ff0663..5db37247dc29 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -283,11 +283,21 @@ nvkm_fifo_oneinit(struct nvkm_engine *engine)
 	}
 
 	/* Initialise non-stall intr handling. */
-	if (fifo->func->nonstall_ctor) {
-		ret = fifo->func->nonstall_ctor(fifo);
-		if (ret) {
-			nvkm_error(subdev, "nonstall %d\n", ret);
+	if (fifo->func->nonstall) {
+		if (fifo->func->nonstall_ctor) {
+			ret = fifo->func->nonstall_ctor(fifo);
+			if (ret < 0) {
+				nvkm_error(subdev, "nonstall %d\n", ret);
+				return ret;
+			}
+		} else {
+			ret = 1;
 		}
+
+		ret = nvkm_event_init(fifo->func->nonstall, &fifo->engine.subdev, 1, ret,
+				      &fifo->nonstall.event);
+		if (ret)
+			return ret;
 	}
 
 	/* Allocate USERD + BAR1 polling area. */
@@ -358,7 +368,6 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, struct nvkm_device *device,
 	       enum nvkm_subdev_type type, int inst, struct nvkm_fifo **pfifo)
 {
 	struct nvkm_fifo *fifo;
-	int ret;
 
 	if (!(fifo = *pfifo = kzalloc(sizeof(*fifo), GFP_KERNEL)))
 		return -ENOMEM;
@@ -374,16 +383,5 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, struct nvkm_device *device,
 	spin_lock_init(&fifo->lock);
 	mutex_init(&fifo->mutex);
 
-	ret = nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &fifo->engine);
-	if (ret)
-		return ret;
-
-	if (func->nonstall) {
-		ret = nvkm_event_init(func->nonstall, &fifo->engine.subdev, 1, 1,
-				      &fifo->nonstall.event);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
+	return nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &fifo->engine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
index a729f8b7f0da..c56d2a839efb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
@@ -32,9 +32,6 @@
 
 #include <nvif/class.h>
 
-/*TODO: allocate? */
-#define GA100_FIFO_NONSTALL_VECTOR 0
-
 static u32
 ga100_chan_doorbell_handle(struct nvkm_chan *chan)
 {
@@ -83,7 +80,7 @@ ga100_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	nvkm_wo32(chan->inst, 0x0e4, priv ? 0x00000020 : 0x00000000);
 	nvkm_wo32(chan->inst, 0x0e8, chan->id);
 	nvkm_wo32(chan->inst, 0x0f4, 0x00001000 | (priv ? 0x00000100 : 0x00000000));
-	nvkm_wo32(chan->inst, 0x0f8, 0x80000000 | GA100_FIFO_NONSTALL_VECTOR);
+	nvkm_wo32(chan->inst, 0x0f8, 0x80000000 | chan->cgrp->runl->nonstall.vector);
 	nvkm_mo32(chan->inst, 0x218, 0x00000000, 0x00000000);
 	nvkm_done(chan->inst);
 	return 0;
@@ -148,8 +145,20 @@ ga100_engn_cxid(struct nvkm_engn *engn, bool *cgid)
 	return -ENODEV;
 }
 
+static int
+ga100_engn_nonstall(struct nvkm_engn *engn)
+{
+	struct nvkm_engine *engine = engn->engine;
+
+	if (WARN_ON(!engine->func->nonstall))
+		return -EINVAL;
+
+	return engine->func->nonstall(engine);
+}
+
 const struct nvkm_engn_func
 ga100_engn = {
+	.nonstall = ga100_engn_nonstall,
 	.cxid = ga100_engn_cxid,
 	.ctor = gk104_ectx_ctor,
 	.bind = gv100_ectx_bind,
@@ -157,6 +166,7 @@ ga100_engn = {
 
 const struct nvkm_engn_func
 ga100_engn_ce = {
+	.nonstall = ga100_engn_nonstall,
 	.cxid = ga100_engn_cxid,
 	.ctor = gv100_ectx_ce_ctor,
 	.bind = gv100_ectx_ce_bind,
@@ -470,6 +480,11 @@ ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 addr, struct nvkm_runl **prun
 				     tdev->type, tdev->inst);
 		if (!engn)
 			return -EINVAL;
+
+		if (!engn->engine->func->nonstall) {
+			RUNL_DEBUG(runl, "engn %s !nonstall", engn->engine->subdev.name);
+			return -EINVAL;
+		}
 	}
 
 	if (list_empty(&runl->engns)) {
@@ -492,9 +507,9 @@ ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 addr, struct nvkm_runl **prun
 static irqreturn_t
 ga100_fifo_nonstall_intr(struct nvkm_inth *inth)
 {
-	struct nvkm_fifo *fifo = container_of(inth, typeof(*fifo), nonstall.intr);
+	struct nvkm_runl *runl = container_of(inth, typeof(*runl), nonstall.inth);
 
-	nvkm_event_ntfy(&fifo->nonstall.event, 0, NVKM_FIFO_NONSTALL_EVENT);
+	nvkm_event_ntfy(&runl->fifo->nonstall.event, runl->id, NVKM_FIFO_NONSTALL_EVENT);
 	return IRQ_HANDLED;
 }
 
@@ -502,16 +517,18 @@ static void
 ga100_fifo_nonstall_block(struct nvkm_event *event, int type, int index)
 {
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
+	struct nvkm_runl *runl = nvkm_runl_get(fifo, index, 0);
 
-	nvkm_inth_block(&fifo->nonstall.intr);
+	nvkm_inth_block(&runl->nonstall.inth);
 }
 
 static void
 ga100_fifo_nonstall_allow(struct nvkm_event *event, int type, int index)
 {
 	struct nvkm_fifo *fifo = container_of(event, typeof(*fifo), nonstall.event);
+	struct nvkm_runl *runl = nvkm_runl_get(fifo, index, 0);
 
-	nvkm_inth_allow(&fifo->nonstall.intr);
+	nvkm_inth_allow(&runl->nonstall.inth);
 }
 
 const struct nvkm_event_func
@@ -523,9 +540,29 @@ ga100_fifo_nonstall = {
 int
 ga100_fifo_nonstall_ctor(struct nvkm_fifo *fifo)
 {
-	return nvkm_inth_add(&fifo->engine.subdev.device->vfn->intr, GA100_FIFO_NONSTALL_VECTOR,
-			     NVKM_INTR_PRIO_NORMAL, &fifo->engine.subdev, ga100_fifo_nonstall_intr,
-			     &fifo->nonstall.intr);
+	struct nvkm_subdev *subdev = &fifo->engine.subdev;
+	struct nvkm_vfn *vfn = subdev->device->vfn;
+	struct nvkm_runl *runl;
+	int ret, nr = 0;
+
+	nvkm_runl_foreach(runl, fifo) {
+		struct nvkm_engn *engn = list_first_entry(&runl->engns, typeof(*engn), head);
+
+		runl->nonstall.vector = engn->func->nonstall(engn);
+		if (runl->nonstall.vector < 0) {
+			RUNL_ERROR(runl, "nonstall %d", runl->nonstall.vector);
+			return runl->nonstall.vector;
+		}
+
+		ret = nvkm_inth_add(&vfn->intr, runl->nonstall.vector, NVKM_INTR_PRIO_NORMAL,
+				    subdev, ga100_fifo_nonstall_intr, &runl->nonstall.inth);
+		if (ret)
+			return ret;
+
+		nr = max(nr, runl->id + 1);
+	}
+
+	return nr;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
index c93d21bb7bd5..5421321f8e85 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
@@ -11,6 +11,7 @@ enum nvkm_subdev_type;
 
 struct nvkm_engn {
 	const struct nvkm_engn_func {
+		int (*nonstall)(struct nvkm_engn *);
 		bool (*chsw)(struct nvkm_engn *);
 		int (*cxid)(struct nvkm_engn *, bool *cgid);
 		void (*mmu_fault_trigger)(struct nvkm_engn *);
@@ -69,6 +70,11 @@ struct nvkm_runl {
 
 	struct nvkm_inth inth;
 
+	struct {
+		int vector;
+		struct nvkm_inth inth;
+	} nonstall;
+
 	struct list_head cgrps;
 	int cgrp_nr;
 	int chan_nr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 1dac95ae7b43..04140e0110be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -52,7 +52,7 @@ nvkm_uchan_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 
 	switch (args->v0.type) {
 	case NVIF_CHAN_EVENT_V0_NON_STALL_INTR:
-		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event, 0,
+		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event, runl->id,
 				       NVKM_FIFO_NONSTALL_EVENT, NULL);
 	case NVIF_CHAN_EVENT_V0_KILLED:
 		return nvkm_uevent_add(uevent, &runl->chid->event, chan->id,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
index 5653fbf785e1..0096ad401b15 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
@@ -125,6 +125,17 @@ nvkm_gr_intr(struct nvkm_engine *engine)
 	gr->func->intr(gr);
 }
 
+static int
+nvkm_gr_nonstall(struct nvkm_engine *engine)
+{
+	struct nvkm_gr *gr = nvkm_gr(engine);
+
+	if (gr->func->nonstall)
+		return gr->func->nonstall(gr);
+
+	return -EINVAL;
+}
+
 static int
 nvkm_gr_oneinit(struct nvkm_engine *engine)
 {
@@ -177,6 +188,7 @@ nvkm_gr = {
 	.init = nvkm_gr_init,
 	.fini = nvkm_gr_fini,
 	.reset = nvkm_gr_reset,
+	.nonstall = nvkm_gr_nonstall,
 	.intr = nvkm_gr_intr,
 	.tile = nvkm_gr_tile,
 	.chsw_load = nvkm_gr_chsw_load,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
index a5b5ac2755a2..00cd70abad67 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/ga102.c
@@ -137,8 +137,15 @@ ga102_gr_oneinit_intr(struct gf100_gr *gr, enum nvkm_intr_type *pvector)
 	return &device->vfn->intr;
 }
 
+static int
+ga102_gr_nonstall(struct gf100_gr *gr)
+{
+	return nvkm_rd32(gr->base.engine.subdev.device, 0x400160) & 0x00000fff;
+}
+
 static const struct gf100_gr_func
 ga102_gr = {
+	.nonstall = ga102_gr_nonstall,
 	.oneinit_intr = ga102_gr_oneinit_intr,
 	.oneinit_tiles = gm200_gr_oneinit_tiles,
 	.oneinit_sm_id = gv100_gr_oneinit_sm_id,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 29afec9a55bf..3648868bb9fc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -2494,12 +2494,24 @@ gf100_gr_gpccs_ucode = {
 	.data.size = sizeof(gf100_grgpc_data),
 };
 
+static int
+gf100_gr_nonstall(struct nvkm_gr *base)
+{
+	struct gf100_gr *gr = gf100_gr(base);
+
+	if (gr->func->nonstall)
+		return gr->func->nonstall(gr);
+
+	return -EINVAL;
+}
+
 static const struct nvkm_gr_func
 gf100_gr_ = {
 	.dtor = gf100_gr_dtor,
 	.oneinit = gf100_gr_oneinit,
 	.init = gf100_gr_init_,
 	.fini = gf100_gr_fini,
+	.nonstall = gf100_gr_nonstall,
 	.reset = gf100_gr_reset,
 	.units = gf100_gr_units,
 	.chan_new = gf100_gr_chan_new,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
index 94ca7ac16acf..54f686ba39ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.h
@@ -147,6 +147,7 @@ struct gf100_gr_func_zbc {
 };
 
 struct gf100_gr_func {
+	int (*nonstall)(struct gf100_gr *);
 	struct nvkm_intr *(*oneinit_intr)(struct gf100_gr *, enum nvkm_intr_type *);
 	void (*oneinit_tiles)(struct gf100_gr *);
 	int (*oneinit_sm_id)(struct gf100_gr *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
index 6ec8b94854c0..0884abc73a9d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
@@ -18,6 +18,7 @@ struct nvkm_gr_func {
 	int (*init)(struct nvkm_gr *);
 	int (*fini)(struct nvkm_gr *, bool);
 	int (*reset)(struct nvkm_gr *);
+	int (*nonstall)(struct nvkm_gr *);
 	void (*intr)(struct nvkm_gr *);
 	void (*tile)(struct nvkm_gr *, int region, struct nvkm_fb_tile *);
 	int (*tlb_flush)(struct nvkm_gr *);
-- 
2.40.1

