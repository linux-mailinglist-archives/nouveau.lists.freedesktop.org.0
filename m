Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F38DF29FB6C
	for <lists+nouveau@lfdr.de>; Fri, 30 Oct 2020 03:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81A46E936;
	Fri, 30 Oct 2020 02:37:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E4F6E93F
 for <nouveau@lists.freedesktop.org>; Fri, 30 Oct 2020 02:37:07 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f9b7c550000>; Thu, 29 Oct 2020 19:37:09 -0700
Received: from localhost (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 02:37:06 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <nouveau@lists.freedesktop.org>
Date: Fri, 30 Oct 2020 13:36:43 +1100
Message-ID: <20201030023645.10114-4-apopple@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030023645.10114-1-apopple@nvidia.com>
References: <20201030023645.10114-1-apopple@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604025430; bh=7YApKPp49nXafNP/yt4OlbQ73giDD7wB37Sinarsry4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=NtO14tIL3cY/r949R/gfMRA9NyQX8N7Spw/Lo5gX36ZxT/B2z0xtSXAlfrhcjTHuM
 sMPKQ1Hsq5bLu8TkVH7vv7XMzCWJkKGNQVP+YlLJ+XOXasi+YqF1URqDA24G5pC0rx
 cp1G/DnzXRZYGhl8oxpibfHWAWgOQy9n6Fj7Dudw8Tj1Y6bHlH0vxvtvjkmqLOI93E
 ARS2ocK1z6hU8KkgteImWMHz9hEmofZPQiog/6nSEDAryBR8OC1wnlr2Ckbx7Jyifv
 228f/mwKQd1Pd7kftVC1PWJXN8rTKRBknzNh3jgphQHyuSQeXkXVx7LcBLXF7mikfl
 sOL1ChSIhbIzg==
Subject: [Nouveau] [PATCH 3/5] drm/nouveau: Move Turing specific FIFO
 functions
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
Cc: Alistair Popple <apopple@nvidia.com>, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Turing requires some changes to FIFO interrupt handling due to changes
in HW register layout. It also requires some changes to implement robust
channel (RC) recovery. This preparatory patch moves the functions
requiring changes into nvkm/engine/fifo/tu102.c so they can be altered
without affecting gk104 and other users. It should not introduce any
functional changes.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.c  |  46 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/gk104.h  |  32 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  | 463 +++++++++++++++++-
 3 files changed, 511 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index 5d4b695cab8e..c73b7eab776e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -36,19 +36,7 @@
 #include <nvif/class.h>
 #include <nvif/cl0080.h>
 
-struct gk104_fifo_engine_status {
-	bool busy;
-	bool faulted;
-	bool chsw;
-	bool save;
-	bool load;
-	struct {
-		bool tsg;
-		u32 id;
-	} prev, next, *chan;
-};
-
-static void
+void
 gk104_fifo_engine_status(struct gk104_fifo *fifo, int engn,
 			 struct gk104_fifo_engine_status *status)
 {
@@ -95,7 +83,7 @@ gk104_fifo_engine_status(struct gk104_fifo *fifo, int engn,
 		   status->chan == &status->next ? "*" : " ");
 }
 
-static int
+int
 gk104_fifo_class_new(struct nvkm_fifo *base, const struct nvkm_oclass *oclass,
 		     void *argv, u32 argc, struct nvkm_object **pobject)
 {
@@ -112,7 +100,7 @@ gk104_fifo_class_new(struct nvkm_fifo *base, const struct nvkm_oclass *oclass,
 	return -EINVAL;
 }
 
-static int
+int
 gk104_fifo_class_get(struct nvkm_fifo *base, int index,
 		     struct nvkm_oclass *oclass)
 {
@@ -134,14 +122,14 @@ gk104_fifo_class_get(struct nvkm_fifo *base, int index,
 	return c;
 }
 
-static void
+void
 gk104_fifo_uevent_fini(struct nvkm_fifo *fifo)
 {
 	struct nvkm_device *device = fifo->engine.subdev.device;
 	nvkm_mask(device, 0x002140, 0x80000000, 0x00000000);
 }
 
-static void
+void
 gk104_fifo_uevent_init(struct nvkm_fifo *fifo)
 {
 	struct nvkm_device *device = fifo->engine.subdev.device;
@@ -556,7 +544,7 @@ gk104_fifo_bind_reason[] = {
 	{}
 };
 
-static void
+void
 gk104_fifo_intr_bind(struct gk104_fifo *fifo)
 {
 	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
@@ -627,7 +615,7 @@ gk104_fifo_intr_sched(struct gk104_fifo *fifo)
 	}
 }
 
-static void
+void
 gk104_fifo_intr_chsw(struct gk104_fifo *fifo)
 {
 	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
@@ -637,7 +625,7 @@ gk104_fifo_intr_chsw(struct gk104_fifo *fifo)
 	nvkm_wr32(device, 0x00256c, stat);
 }
 
-static void
+void
 gk104_fifo_intr_dropped_fault(struct gk104_fifo *fifo)
 {
 	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
@@ -680,7 +668,7 @@ static const struct nvkm_bitfield gk104_fifo_pbdma_intr_0[] = {
 	{}
 };
 
-static void
+void
 gk104_fifo_intr_pbdma_0(struct gk104_fifo *fifo, int unit)
 {
 	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
@@ -729,7 +717,7 @@ static const struct nvkm_bitfield gk104_fifo_pbdma_intr_1[] = {
 	{}
 };
 
-static void
+void
 gk104_fifo_intr_pbdma_1(struct gk104_fifo *fifo, int unit)
 {
 	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
@@ -750,7 +738,7 @@ gk104_fifo_intr_pbdma_1(struct gk104_fifo *fifo, int unit)
 	nvkm_wr32(device, 0x040148 + (unit * 0x2000), stat);
 }
 
-static void
+void
 gk104_fifo_intr_runlist(struct gk104_fifo *fifo)
 {
 	struct nvkm_device *device = fifo->base.engine.subdev.device;
@@ -763,7 +751,7 @@ gk104_fifo_intr_runlist(struct gk104_fifo *fifo)
 	}
 }
 
-static void
+void
 gk104_fifo_intr_engine(struct gk104_fifo *fifo)
 {
 	nvkm_fifo_uevent(&fifo->base);
@@ -861,7 +849,7 @@ gk104_fifo_intr(struct nvkm_fifo *base)
 	}
 }
 
-static void
+void
 gk104_fifo_fini(struct nvkm_fifo *base)
 {
 	struct gk104_fifo *fifo = gk104_fifo(base);
@@ -871,7 +859,7 @@ gk104_fifo_fini(struct nvkm_fifo *base)
 	nvkm_mask(device, 0x002140, 0x10000000, 0x10000000);
 }
 
-static int
+int
 gk104_fifo_info(struct nvkm_fifo *base, u64 mthd, u64 *data)
 {
 	struct gk104_fifo *fifo = gk104_fifo(base);
@@ -899,7 +887,7 @@ gk104_fifo_info(struct nvkm_fifo *base, u64 mthd, u64 *data)
 	}
 }
 
-static int
+int
 gk104_fifo_oneinit(struct nvkm_fifo *base)
 {
 	struct gk104_fifo *fifo = gk104_fifo(base);
@@ -974,7 +962,7 @@ gk104_fifo_oneinit(struct nvkm_fifo *base)
 	return nvkm_memory_map(fifo->user.mem, 0, bar, fifo->user.bar, NULL, 0);
 }
 
-static void
+void
 gk104_fifo_init(struct nvkm_fifo *base)
 {
 	struct gk104_fifo *fifo = gk104_fifo(base);
@@ -1006,7 +994,7 @@ gk104_fifo_init(struct nvkm_fifo *base)
 	nvkm_wr32(device, 0x002140, 0x7fffffff);
 }
 
-static void *
+void *
 gk104_fifo_dtor(struct nvkm_fifo *base)
 {
 	struct gk104_fifo *fifo = gk104_fifo(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h
index 6407a4a174cf..4398b340e514 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.h
@@ -87,11 +87,43 @@ struct gk104_fifo_func {
 	bool cgrp_force;
 };
 
+struct gk104_fifo_engine_status {
+	bool busy;
+	bool faulted;
+	bool chsw;
+	bool save;
+	bool load;
+	struct {
+		bool tsg;
+		u32 id;
+	} prev, next, *chan;
+};
+
 int gk104_fifo_new_(const struct gk104_fifo_func *, struct nvkm_device *,
 		    int index, int nr, struct nvkm_fifo **);
 void gk104_fifo_runlist_insert(struct gk104_fifo *, struct gk104_fifo_chan *);
 void gk104_fifo_runlist_remove(struct gk104_fifo *, struct gk104_fifo_chan *);
 void gk104_fifo_runlist_update(struct gk104_fifo *, int runl);
+void gk104_fifo_engine_status(struct gk104_fifo *fifo, int engn,
+			      struct gk104_fifo_engine_status *status);
+void gk104_fifo_intr_bind(struct gk104_fifo *fifo);
+void gk104_fifo_intr_chsw(struct gk104_fifo *fifo);
+void gk104_fifo_intr_dropped_fault(struct gk104_fifo *fifo);
+void gk104_fifo_intr_pbdma_0(struct gk104_fifo *fifo, int unit);
+void gk104_fifo_intr_pbdma_1(struct gk104_fifo *fifo, int unit);
+void gk104_fifo_intr_runlist(struct gk104_fifo *fifo);
+void gk104_fifo_intr_engine(struct gk104_fifo *fifo);
+void *gk104_fifo_dtor(struct nvkm_fifo *base);
+int gk104_fifo_oneinit(struct nvkm_fifo *base);
+int gk104_fifo_info(struct nvkm_fifo *base, u64 mthd, u64 *data);
+void gk104_fifo_init(struct nvkm_fifo *base);
+void gk104_fifo_fini(struct nvkm_fifo *base);
+int gk104_fifo_class_new(struct nvkm_fifo *base, const struct nvkm_oclass *oclass,
+			 void *argv, u32 argc, struct nvkm_object **pobject);
+int gk104_fifo_class_get(struct nvkm_fifo *base, int index,
+			 struct nvkm_oclass *oclass);
+void gk104_fifo_uevent_fini(struct nvkm_fifo *fifo);
+void gk104_fifo_uevent_init(struct nvkm_fifo *fifo);
 
 extern const struct gk104_fifo_pbdma_func gk104_fifo_pbdma;
 int gk104_fifo_pbdma_nr(struct gk104_fifo *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 005f3e1729b9..2924381a6b3c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -24,7 +24,13 @@
 #include "changk104.h"
 #include "user.h"
 
+#include <core/client.h>
 #include <core/gpuobj.h>
+#include <subdev/bar.h>
+#include <subdev/fault.h>
+#include <subdev/top.h>
+#include <subdev/timer.h>
+#include <engine/sw.h>
 
 #include <nvif/class.h>
 
@@ -109,8 +115,463 @@ tu102_fifo = {
 	.cgrp_force = true,
 };
 
+static void
+tu102_fifo_recover_work(struct work_struct *w)
+{
+	struct gk104_fifo *fifo = container_of(w, typeof(*fifo), recover.work);
+	struct nvkm_device *device = fifo->base.engine.subdev.device;
+	struct nvkm_engine *engine;
+	unsigned long flags;
+	u32 engm, runm, todo;
+	int engn, runl;
+
+	spin_lock_irqsave(&fifo->base.lock, flags);
+	runm = fifo->recover.runm;
+	engm = fifo->recover.engm;
+	fifo->recover.engm = 0;
+	fifo->recover.runm = 0;
+	spin_unlock_irqrestore(&fifo->base.lock, flags);
+
+	nvkm_mask(device, 0x002630, runm, runm);
+
+	for (todo = engm; engn = __ffs(todo), todo; todo &= ~BIT(engn)) {
+		if ((engine = fifo->engine[engn].engine)) {
+			nvkm_subdev_fini(&engine->subdev, false);
+			WARN_ON(nvkm_subdev_init(&engine->subdev));
+		}
+	}
+
+	for (todo = runm; runl = __ffs(todo), todo; todo &= ~BIT(runl))
+		gk104_fifo_runlist_update(fifo, runl);
+
+	nvkm_wr32(device, 0x00262c, runm);
+	nvkm_mask(device, 0x002630, runm, 0x00000000);
+}
+
+static void tu102_fifo_recover_engn(struct gk104_fifo *fifo, int engn);
+
+static void
+tu102_fifo_recover_runl(struct gk104_fifo *fifo, int runl)
+{
+	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	const u32 runm = BIT(runl);
+
+	assert_spin_locked(&fifo->base.lock);
+	if (fifo->recover.runm & runm)
+		return;
+	fifo->recover.runm |= runm;
+
+	/* Block runlist to prevent channel assignment(s) from changing. */
+	nvkm_mask(device, 0x002630, runm, runm);
+
+	/* Schedule recovery. */
+	nvkm_warn(subdev, "runlist %d: scheduled for recovery\n", runl);
+	schedule_work(&fifo->recover.work);
+}
+
+static struct gk104_fifo_chan *
+tu102_fifo_recover_chid(struct gk104_fifo *fifo, int runl, int chid)
+{
+	struct gk104_fifo_chan *chan;
+	struct nvkm_fifo_cgrp *cgrp;
+
+	list_for_each_entry(chan, &fifo->runlist[runl].chan, head) {
+		if (chan->base.chid == chid) {
+			list_del_init(&chan->head);
+			return chan;
+		}
+	}
+
+	list_for_each_entry(cgrp, &fifo->runlist[runl].cgrp, head) {
+		if (cgrp->id == chid) {
+			chan = list_first_entry(&cgrp->chan, typeof(*chan), head);
+			list_del_init(&chan->head);
+			if (!--cgrp->chan_nr)
+				list_del_init(&cgrp->head);
+			return chan;
+		}
+	}
+
+	return NULL;
+}
+
+static void
+tu102_fifo_recover_chan(struct nvkm_fifo *base, int chid)
+{
+	struct gk104_fifo *fifo = gk104_fifo(base);
+	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	const u32  stat = nvkm_rd32(device, 0x800004 + (chid * 0x08));
+	const u32  runl = (stat & 0x000f0000) >> 16;
+	const bool used = (stat & 0x00000001);
+	unsigned long engn, engm = fifo->runlist[runl].engm;
+	struct gk104_fifo_chan *chan;
+
+	assert_spin_locked(&fifo->base.lock);
+	if (!used)
+		return;
+
+	/* Lookup SW state for channel, and mark it as dead. */
+	chan = tu102_fifo_recover_chid(fifo, runl, chid);
+	if (chan) {
+		chan->killed = true;
+		nvkm_fifo_kevent(&fifo->base, chid);
+	}
+
+	/* Disable channel. */
+	nvkm_wr32(device, 0x800004 + (chid * 0x08), stat | 0x00000800);
+	nvkm_warn(subdev, "channel %d: killed\n", chid);
+
+	/* Block channel assignments from changing during recovery. */
+	tu102_fifo_recover_runl(fifo, runl);
+
+	/* Schedule recovery for any engines the channel is on. */
+	for_each_set_bit(engn, &engm, fifo->engine_nr) {
+		struct gk104_fifo_engine_status status;
+
+		gk104_fifo_engine_status(fifo, engn, &status);
+		if (!status.chan || status.chan->id != chid)
+			continue;
+		tu102_fifo_recover_engn(fifo, engn);
+	}
+}
+
+static void
+tu102_fifo_recover_engn(struct gk104_fifo *fifo, int engn)
+{
+	struct nvkm_engine *engine = fifo->engine[engn].engine;
+	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	const u32 runl = fifo->engine[engn].runl;
+	const u32 engm = BIT(engn);
+	struct gk104_fifo_engine_status status;
+	int mmui = -1;
+
+	assert_spin_locked(&fifo->base.lock);
+	if (fifo->recover.engm & engm)
+		return;
+	fifo->recover.engm |= engm;
+
+	/* Block channel assignments from changing during recovery. */
+	tu102_fifo_recover_runl(fifo, runl);
+
+	/* Determine which channel (if any) is currently on the engine. */
+	gk104_fifo_engine_status(fifo, engn, &status);
+	if (status.chan) {
+		/* The channel is not longer viable, kill it. */
+		tu102_fifo_recover_chan(&fifo->base, status.chan->id);
+	}
+
+	/* Determine MMU fault ID for the engine, if we're not being
+	 * called from the fault handler already.
+	 */
+	if (!status.faulted && engine) {
+		mmui = nvkm_top_fault_id(device, engine->subdev.index);
+		if (mmui < 0) {
+			const struct nvkm_enum *en = fifo->func->fault.engine;
+
+			for (; en && en->name; en++) {
+				if (en->data2 == engine->subdev.index) {
+					mmui = en->value;
+					break;
+				}
+			}
+		}
+		WARN_ON(mmui < 0);
+	}
+
+	/* Trigger a MMU fault for the engine.
+	 *
+	 * No good idea why this is needed, but nvgpu does something similar,
+	 * and it makes recovery from CTXSW_TIMEOUT a lot more reliable.
+	 */
+	if (mmui >= 0) {
+		nvkm_wr32(device, 0x002a30 + (engn * 0x04), 0x00000100 | mmui);
+
+		/* Wait for fault to trigger. */
+		nvkm_msec(device, 2000,
+			gk104_fifo_engine_status(fifo, engn, &status);
+			if (status.faulted)
+				break;
+		);
+
+		/* Release MMU fault trigger, and ACK the fault. */
+		nvkm_wr32(device, 0x002a30 + (engn * 0x04), 0x00000000);
+		nvkm_wr32(device, 0x00259c, BIT(mmui));
+		nvkm_wr32(device, 0x002100, 0x10000000);
+	}
+
+	/* Schedule recovery. */
+	nvkm_warn(subdev, "engine %d: scheduled for recovery\n", engn);
+	schedule_work(&fifo->recover.work);
+}
+
+static void
+tu102_fifo_fault(struct nvkm_fifo *base, struct nvkm_fault_data *info)
+{
+	struct gk104_fifo *fifo = gk104_fifo(base);
+	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	const struct nvkm_enum *er, *ee, *ec, *ea;
+	struct nvkm_engine *engine = NULL;
+	struct nvkm_fifo_chan *chan;
+	unsigned long flags;
+	char ct[8] = "HUB/", en[16] = "";
+	int engn;
+
+	er = nvkm_enum_find(fifo->func->fault.reason, info->reason);
+	ee = nvkm_enum_find(fifo->func->fault.engine, info->engine);
+	if (info->hub) {
+		ec = nvkm_enum_find(fifo->func->fault.hubclient, info->client);
+	} else {
+		ec = nvkm_enum_find(fifo->func->fault.gpcclient, info->client);
+		snprintf(ct, sizeof(ct), "GPC%d/", info->gpc);
+	}
+	ea = nvkm_enum_find(fifo->func->fault.access, info->access);
+
+	if (ee && ee->data2) {
+		switch (ee->data2) {
+		case NVKM_SUBDEV_BAR:
+			nvkm_bar_bar1_reset(device);
+			break;
+		case NVKM_SUBDEV_INSTMEM:
+			nvkm_bar_bar2_reset(device);
+			break;
+		case NVKM_ENGINE_IFB:
+			nvkm_mask(device, 0x001718, 0x00000000, 0x00000000);
+			break;
+		default:
+			engine = nvkm_device_engine(device, ee->data2);
+			break;
+		}
+	}
+
+	if (ee == NULL) {
+		enum nvkm_devidx engidx = nvkm_top_fault(device, info->engine);
+
+		if (engidx < NVKM_SUBDEV_NR) {
+			const char *src = nvkm_subdev_name[engidx];
+			char *dst = en;
+
+			do {
+				*dst++ = toupper(*src++);
+			} while (*src);
+			engine = nvkm_device_engine(device, engidx);
+		}
+	} else {
+		snprintf(en, sizeof(en), "%s", ee->name);
+	}
+
+	spin_lock_irqsave(&fifo->base.lock, flags);
+	chan = nvkm_fifo_chan_inst_locked(&fifo->base, info->inst);
+
+	nvkm_error(subdev,
+		   "fault %02x [%s] at %016llx engine %02x [%s] client %02x "
+		   "[%s%s] reason %02x [%s] on channel %d [%010llx %s]\n",
+		   info->access, ea ? ea->name : "", info->addr,
+		   info->engine, ee ? ee->name : en,
+		   info->client, ct, ec ? ec->name : "",
+		   info->reason, er ? er->name : "", chan ? chan->chid : -1,
+		   info->inst, chan ? chan->object.client->name : "unknown");
+
+	/* Kill the channel that caused the fault. */
+	if (chan)
+		tu102_fifo_recover_chan(&fifo->base, chan->chid);
+
+	/* Channel recovery will probably have already done this for the
+	 * correct engine(s), but just in case we can't find the channel
+	 * information...
+	 */
+	for (engn = 0; engn < fifo->engine_nr && engine; engn++) {
+		if (fifo->engine[engn].engine == engine) {
+			tu102_fifo_recover_engn(fifo, engn);
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&fifo->base.lock, flags);
+}
+
+static const struct nvkm_enum
+tu102_fifo_sched_reason[] = {
+	{ 0x0a, "CTXSW_TIMEOUT" },
+	{}
+};
+
+static void
+tu102_fifo_intr_sched_ctxsw(struct gk104_fifo *fifo)
+{
+	struct nvkm_device *device = fifo->base.engine.subdev.device;
+	unsigned long flags, engm = 0;
+	u32 engn;
+
+	/* We need to ACK the SCHED_ERROR here, and prevent it reasserting,
+	 * as MMU_FAULT cannot be triggered while it's pending.
+	 */
+	spin_lock_irqsave(&fifo->base.lock, flags);
+	nvkm_mask(device, 0x002140, 0x00000100, 0x00000000);
+	nvkm_wr32(device, 0x002100, 0x00000100);
+
+	for (engn = 0; engn < fifo->engine_nr; engn++) {
+		struct gk104_fifo_engine_status status;
+
+		gk104_fifo_engine_status(fifo, engn, &status);
+		if (!status.busy || !status.chsw)
+			continue;
+
+		engm |= BIT(engn);
+	}
+
+	for_each_set_bit(engn, &engm, fifo->engine_nr)
+		tu102_fifo_recover_engn(fifo, engn);
+
+	nvkm_mask(device, 0x002140, 0x00000100, 0x00000100);
+	spin_unlock_irqrestore(&fifo->base.lock, flags);
+}
+
+static void
+tu102_fifo_intr_sched(struct gk104_fifo *fifo)
+{
+	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 intr = nvkm_rd32(device, 0x00254c);
+	u32 code = intr & 0x000000ff;
+	const struct nvkm_enum *en =
+		nvkm_enum_find(tu102_fifo_sched_reason, code);
+
+	nvkm_error(subdev, "SCHED_ERROR %02x [%s]\n", code, en ? en->name : "");
+
+	switch (code) {
+	case 0x0a:
+		tu102_fifo_intr_sched_ctxsw(fifo);
+		break;
+	default:
+		break;
+	}
+}
+
+static void
+tu102_fifo_intr(struct nvkm_fifo *base)
+{
+	struct gk104_fifo *fifo = gk104_fifo(base);
+	struct nvkm_subdev *subdev = &fifo->base.engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 mask = nvkm_rd32(device, 0x002140);
+	u32 stat = nvkm_rd32(device, 0x002100) & mask;
+
+	if (stat & 0x00000001) {
+		gk104_fifo_intr_bind(fifo);
+		nvkm_wr32(device, 0x002100, 0x00000001);
+		stat &= ~0x00000001;
+	}
+
+	if (stat & 0x00000010) {
+		nvkm_error(subdev, "PIO_ERROR\n");
+		nvkm_wr32(device, 0x002100, 0x00000010);
+		stat &= ~0x00000010;
+	}
+
+	if (stat & 0x00000100) {
+		tu102_fifo_intr_sched(fifo);
+		nvkm_wr32(device, 0x002100, 0x00000100);
+		stat &= ~0x00000100;
+	}
+
+	if (stat & 0x00010000) {
+		gk104_fifo_intr_chsw(fifo);
+		nvkm_wr32(device, 0x002100, 0x00010000);
+		stat &= ~0x00010000;
+	}
+
+	if (stat & 0x00800000) {
+		nvkm_error(subdev, "FB_FLUSH_TIMEOUT\n");
+		nvkm_wr32(device, 0x002100, 0x00800000);
+		stat &= ~0x00800000;
+	}
+
+	if (stat & 0x01000000) {
+		nvkm_error(subdev, "LB_ERROR\n");
+		nvkm_wr32(device, 0x002100, 0x01000000);
+		stat &= ~0x01000000;
+	}
+
+	if (stat & 0x08000000) {
+		gk104_fifo_intr_dropped_fault(fifo);
+		nvkm_wr32(device, 0x002100, 0x08000000);
+		stat &= ~0x08000000;
+	}
+
+	if (stat & 0x10000000) {
+		u32 mask = nvkm_rd32(device, 0x00259c);
+
+		while (mask) {
+			u32 unit = __ffs(mask);
+			fifo->func->intr.fault(&fifo->base, unit);
+			nvkm_wr32(device, 0x00259c, (1 << unit));
+			mask &= ~(1 << unit);
+		}
+		stat &= ~0x10000000;
+	}
+
+	if (stat & 0x20000000) {
+		u32 mask = nvkm_rd32(device, 0x0025a0);
+
+		while (mask) {
+			u32 unit = __ffs(mask);
+
+			gk104_fifo_intr_pbdma_0(fifo, unit);
+			gk104_fifo_intr_pbdma_1(fifo, unit);
+			nvkm_wr32(device, 0x0025a0, (1 << unit));
+			mask &= ~(1 << unit);
+		}
+		stat &= ~0x20000000;
+	}
+
+	if (stat & 0x40000000) {
+		gk104_fifo_intr_runlist(fifo);
+		stat &= ~0x40000000;
+	}
+
+	if (stat & 0x80000000) {
+		nvkm_wr32(device, 0x002100, 0x80000000);
+		gk104_fifo_intr_engine(fifo);
+		stat &= ~0x80000000;
+	}
+
+	if (stat) {
+		nvkm_error(subdev, "INTR %08x\n", stat);
+		nvkm_mask(device, 0x002140, stat, 0x00000000);
+		nvkm_wr32(device, 0x002100, stat);
+	}
+}
+
+static const struct nvkm_fifo_func
+tu102_fifo_ = {
+	.dtor = gk104_fifo_dtor,
+	.oneinit = gk104_fifo_oneinit,
+	.info = gk104_fifo_info,
+	.init = gk104_fifo_init,
+	.fini = gk104_fifo_fini,
+	.intr = tu102_fifo_intr,
+	.fault = tu102_fifo_fault,
+	.uevent_init = gk104_fifo_uevent_init,
+	.uevent_fini = gk104_fifo_uevent_fini,
+	.recover_chan = tu102_fifo_recover_chan,
+	.class_get = gk104_fifo_class_get,
+	.class_new = gk104_fifo_class_new,
+};
+
 int
 tu102_fifo_new(struct nvkm_device *device, int index, struct nvkm_fifo **pfifo)
 {
-	return gk104_fifo_new_(&tu102_fifo, device, index, 4096, pfifo);
+	struct gk104_fifo *fifo;
+
+	if (!(fifo = kzalloc(sizeof(*fifo), GFP_KERNEL)))
+		return -ENOMEM;
+	fifo->func = &tu102_fifo;
+	INIT_WORK(&fifo->recover.work, tu102_fifo_recover_work);
+	*pfifo = &fifo->base;
+
+	return nvkm_fifo_ctor(&tu102_fifo_, device, index, 4096, &fifo->base);
 }
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
