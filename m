Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FF97A53F6
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3652B10E324;
	Mon, 18 Sep 2023 20:23:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5001810E326
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:59 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-578af21ff50so194539a12.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068578; x=1695673378; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QgZDg6b6YZSqM7otf3qx5AbBGJgWvLFJY5frLkpZxL4=;
 b=AxvpJAJElXkM1AwcUyDImGYh7X26YCqbvZXs4YVhXgi2FmOGOgp+KWRz1mVPeIUMzq
 Cu+31aw1tuvBRMkoTfm69BRyaEAjn2tOCldC/XBw7RSqa/b8unlQJASojXE5PabLm0aR
 mUmYTccOoettNQh4dRsn8GjxVt2H2fLVxgHkjnBmxO0JytphvzLESvj7PX1CTg7yEXCV
 GLRVAzedJmoZbFKe71iFETcLMydfVmyB1CxgCyNZKRpo7FL0Nd4lkKpEIZQ0Zsp6XpwB
 7TFi1+PDlWpst40hWUynij88V7GRbqk0lgtUlLtfT7Pjmhh9p4XkJ6SoFOlUFSis4d8F
 ZP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068578; x=1695673378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QgZDg6b6YZSqM7otf3qx5AbBGJgWvLFJY5frLkpZxL4=;
 b=MenUiW9JZIRp+Q1jhXRq/YXtXdWOHQUJvDcK7pgJlcqpmJuq8MRlT2xhI3n7egWv9T
 AIukwyVgmFMZJTxO0J8RwV0h/J02+r5ClUwOqFL8RVs/anz0FloZfiIluXxNQA333BFM
 gR665PJ6hqHtnz4WvAAntHQ8HPr1Nd7jtkZBk+DntV88Ap2zChOA7jGeH7mGR8aDOJsk
 TsN/ZZGrSPzZHI6KZRpf8zCfIRQL+RcMGW0XrFyfautnHX75Hu8wGTe8CeTC/g2t9L6b
 hrrwwpWFT+/nc3NXbXRFNdfjWNT0W6At120nidECDQWZLraOrFHxvwpjMY+j5vm3k+Pq
 RGgQ==
X-Gm-Message-State: AOJu0YwaNcrzAUPq0nok4NXSFJuD7irYBx5BE4KsSeHGpJY3nyfqGVzT
 2+JlRkVXtu4UxQbbC6NwtDSm8KSQr+E=
X-Google-Smtp-Source: AGHT+IFMK/3a27ufYSPKgOyfDoGxw6dNCCt+Ehn0XUeJwuzga9Wwjly02Aj2gcnWYGS4tfOiyTErGg==
X-Received: by 2002:a05:6a20:8f29:b0:158:f65:12d5 with SMTP id
 b41-20020a056a208f2900b001580f6512d5mr3290691pzk.43.1695068578375; 
 Mon, 18 Sep 2023 13:22:58 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:57 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:30 +1000
Message-ID: <20230918202149.4343-26-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 25/44] drm/nouveau/fifo/tu102-: prepare for GSP-RM
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

- (temporarily) disable if GSP-RM detected, will be added later
- add dtor() so GSP-RM paths can cleanup properly
- add alternate engine context mapping interface for RM engines
- add alternate chid interfaces to handle RM USERD oddities

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/engine/fifo.h    |  3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  9 +++
 .../gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c   |  3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   | 55 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |  3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  |  4 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  |  5 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/runl.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  |  4 ++
 10 files changed, 67 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
index 221abd6c4310..7de63718ae7e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
@@ -66,6 +66,9 @@ struct nvkm_fifo {
 	struct {
 		struct nvkm_memory *mem;
 		struct nvkm_vma *bar1;
+
+		struct mutex mutex;
+		struct list_head list;
 	} userd;
 
 	spinlock_t lock;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 5db37247dc29..d7bff2e3f75c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -347,8 +347,14 @@ nvkm_fifo_dtor(struct nvkm_engine *engine)
 	nvkm_chid_unref(&fifo->cgid);
 	nvkm_chid_unref(&fifo->chid);
 
+	mutex_destroy(&fifo->userd.mutex);
+
 	nvkm_event_fini(&fifo->nonstall.event);
 	mutex_destroy(&fifo->mutex);
+
+	if (fifo->func->dtor)
+		fifo->func->dtor(fifo);
+
 	return fifo;
 }
 
@@ -383,5 +389,8 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, struct nvkm_device *device,
 	spin_lock_init(&fifo->lock);
 	mutex_init(&fifo->mutex);
 
+	INIT_LIST_HEAD(&fifo->userd.list);
+	mutex_init(&fifo->userd.mutex);
+
 	return nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &fifo->engine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c
index ea53fb3d5d06..814db9daa194 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c
@@ -156,6 +156,9 @@ nvkm_cgrp_vctx_get(struct nvkm_cgrp *cgrp, struct nvkm_engn *engn, struct nvkm_c
 		atomic_inc(&vctx->vmm->engref[engn->engine->subdev.type]);
 
 	/* Allocate the HW structures. */
+	if (engn->func->ctor2) {
+		ret = engn->func->ctor2(engn, vctx, chan);
+	} else
 	if (engn->func->bind) {
 		ret = nvkm_object_bind(vctx->ectx->object, NULL, 0, &vctx->inst);
 		if (ret == 0 && engn->func->ctor)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index b7c9d6115bce..87a62d4ff4bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -275,13 +275,17 @@ nvkm_chan_del(struct nvkm_chan **pchan)
 	nvkm_gpuobj_del(&chan->cache);
 	nvkm_gpuobj_del(&chan->ramfc);
 
-	nvkm_memory_unref(&chan->userd.mem);
-
 	if (chan->cgrp) {
-		nvkm_chid_put(chan->cgrp->runl->chid, chan->id, &chan->cgrp->lock);
+		if (!chan->func->id_put)
+			nvkm_chid_put(chan->cgrp->runl->chid, chan->id, &chan->cgrp->lock);
+		else
+			chan->func->id_put(chan);
+
 		nvkm_cgrp_unref(&chan->cgrp);
 	}
 
+	nvkm_memory_unref(&chan->userd.mem);
+
 	if (chan->vmm) {
 		nvkm_vmm_part(chan->vmm, chan->inst->memory);
 		nvkm_vmm_unref(&chan->vmm);
@@ -438,7 +442,32 @@ nvkm_chan_new_(const struct nvkm_chan_func *func, struct nvkm_runl *runl, int ru
 	}
 
 	/* Allocate channel ID. */
-	chan->id = nvkm_chid_get(runl->chid, chan);
+	if (!chan->func->id_get) {
+		chan->id = nvkm_chid_get(runl->chid, chan);
+		if (chan->id >= 0) {
+			if (func->userd->bar < 0) {
+				if (ouserd + chan->func->userd->size >=
+					nvkm_memory_size(userd)) {
+					RUNL_DEBUG(runl, "ouserd %llx", ouserd);
+					return -EINVAL;
+				}
+
+				ret = nvkm_memory_kmap(userd, &chan->userd.mem);
+				if (ret) {
+					RUNL_DEBUG(runl, "userd %d", ret);
+					return ret;
+				}
+
+				chan->userd.base = ouserd;
+			} else {
+				chan->userd.mem = nvkm_memory_ref(fifo->userd.mem);
+				chan->userd.base = chan->id * chan->func->userd->size;
+			}
+		}
+	} else {
+		chan->id = chan->func->id_get(chan, userd, ouserd);
+	}
+
 	if (chan->id < 0) {
 		RUNL_ERROR(runl, "!chids");
 		return -ENOSPC;
@@ -448,24 +477,6 @@ nvkm_chan_new_(const struct nvkm_chan_func *func, struct nvkm_runl *runl, int ru
 		cgrp->id = chan->id;
 
 	/* Initialise USERD. */
-	if (func->userd->bar < 0) {
-		if (ouserd + chan->func->userd->size >= nvkm_memory_size(userd)) {
-			RUNL_DEBUG(runl, "ouserd %llx", ouserd);
-			return -EINVAL;
-		}
-
-		ret = nvkm_memory_kmap(userd, &chan->userd.mem);
-		if (ret) {
-			RUNL_DEBUG(runl, "userd %d", ret);
-			return ret;
-		}
-
-		chan->userd.base = ouserd;
-	} else {
-		chan->userd.mem = nvkm_memory_ref(fifo->userd.mem);
-		chan->userd.base = chan->id * chan->func->userd->size;
-	}
-
 	if (chan->func->userd->clear)
 		chan->func->userd->clear(chan);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
index 85b94f699128..013682a709d5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
@@ -17,6 +17,9 @@ struct nvkm_cctx {
 };
 
 struct nvkm_chan_func {
+	int (*id_get)(struct nvkm_chan *, struct nvkm_memory *userd, u64 ouserd);
+	void (*id_put)(struct nvkm_chan *);
+
 	const struct nvkm_chan_func_inst {
 		u32 size;
 		bool zero;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
index c56d2a839efb..a41a460ca9d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
@@ -27,6 +27,7 @@
 #include "runq.h"
 
 #include <core/gpuobj.h>
+#include <subdev/gsp.h>
 #include <subdev/top.h>
 #include <subdev/vfn.h>
 
@@ -607,5 +608,8 @@ int
 ga100_fifo_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_fifo **pfifo)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_fifo_new_(&ga100_fifo, device, type, inst, pfifo);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
index 2cdf5da339b6..3701de24fefa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 #include <nvif/class.h>
 
 static const struct nvkm_fifo_func
@@ -41,5 +43,8 @@ int
 ga102_fifo_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_fifo **pfifo)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_fifo_new_(&ga102_fifo, device, type, inst, pfifo);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
index 4d448be19224..4a3ef0277738 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -13,6 +13,8 @@ struct nvkm_runq;
 struct nvkm_vctx;
 
 struct nvkm_fifo_func {
+	void (*dtor)(struct nvkm_fifo *);
+
 	int (*chid_nr)(struct nvkm_fifo *);
 	int (*chid_ctor)(struct nvkm_fifo *, int nr);
 	int (*runq_nr)(struct nvkm_fifo *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
index 5421321f8e85..b450b79bb1d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
@@ -18,6 +18,7 @@ struct nvkm_engn {
 		bool (*mmu_fault_triggered)(struct nvkm_engn *);
 		int (*ctor)(struct nvkm_engn *, struct nvkm_vctx *);
 		void (*bind)(struct nvkm_engn *, struct nvkm_cctx *, struct nvkm_chan *);
+		int (*ctor2)(struct nvkm_engn *, struct nvkm_vctx *, struct nvkm_chan *);
 		int (*ramht_add)(struct nvkm_engn *, struct nvkm_object *, struct nvkm_chan *);
 		void (*ramht_del)(struct nvkm_chan *, int hash);
 	} *func;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index ea9e151dbb48..f310091b74e4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -25,6 +25,7 @@
 #include "runl.h"
 
 #include <core/memory.h>
+#include <subdev/gsp.h>
 #include <subdev/mc.h>
 #include <subdev/vfn.h>
 
@@ -282,5 +283,8 @@ int
 tu102_fifo_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_fifo **pfifo)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_fifo_new_(&tu102_fifo, device, type, inst, pfifo);
 }
-- 
2.41.0

