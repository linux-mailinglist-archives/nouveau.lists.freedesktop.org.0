Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ADA7A5402
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815C410E337;
	Mon, 18 Sep 2023 20:23:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9885F10E328
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:32 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-690bd8f89baso352742b3a.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068612; x=1695673412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OPa0DOB1JFJvOnFoeO3K88UXNoBQi8d+EpQZYNup2G4=;
 b=nWrBbtv2DEdVlooKRckw2uYuOOkTYXHkGLCgJqsUpYa6u/b7zgkxcuoDLwFEQ40Kco
 414dCYrBRKQS85lFbENsyDjTj3QcA1GQkgqle5akK2PD4sIVla9+URJpBYAvflD/IQtM
 1IulhiokeYb6Q3DXdrJoDouExMf/Yzbks6eNnavokU7/OKmilvt0YtxAA3WZ3SbZoiKI
 roTIZQ9C7DBfC+uNm8oCf2vWhN6BCqt8CgE9Z9QqhYWrwircwfuPdMAcg39P08yV0NZo
 ASXHlionF2LXyOzO7ZjXkFJKjLfgdD/znRgKSUZiQoDmGQFxucDzzVVvL0PT2bBvOefg
 apmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068612; x=1695673412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OPa0DOB1JFJvOnFoeO3K88UXNoBQi8d+EpQZYNup2G4=;
 b=h6TNuvKcz2HFtOPfYgCs6BcIqZiM4/SIj4A8xhjUW/FN4MvVWwThSXaAcZDzsk05B+
 DGIqu5BBSsjK9geREx+ZcQ+iJh+1BmgBQ7dAMZK/r39vlXzSzeSk3IpjTQB8ZC649jml
 XRTZi2BjYu9NqE5wQi9aVTA67Qs7vkOOLm1u6ZaN3j1hTbAhAFaQeAGBtZj7Tzip8Czj
 4HNN3Y43ade9OGbDs1RtLZQ9dZRG/QXpTJ9WllLzFLz17RwJVYnhemf5604CYyMZDKDW
 yL9ylGcO5uef3RvA6tsnOrvxJpb+taxlpTkDX/FCwc+R9EMYX64CjZzaQsbdxorqohTA
 rbMQ==
X-Gm-Message-State: AOJu0Yw4bLHjE9u4b0j/5XGU20RdI3GIllPC/Q1PYbQo2+cW/C+7Wy8S
 xiGI6sKdvQMuitmd4McmEGkoyoO1zys=
X-Google-Smtp-Source: AGHT+IEpHmsYg6+dqtTl8NztwmKpDorzOEoyfllLaNWnrELWax3clh25g5PB0G/JCPt495fF9IAv7g==
X-Received: by 2002:a05:6a00:b50:b0:68f:efc2:ba46 with SMTP id
 p16-20020a056a000b5000b0068fefc2ba46mr9175051pfo.25.1695068611524; 
 Mon, 18 Sep 2023 13:23:31 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:31 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:44 +1000
Message-ID: <20230918202149.4343-40-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 39/44] drm/nouveau/ce/r535: initial support
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

Adds support for allocating DMA_COPY classes from RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/engine/fifo.h    |   2 +
 .../common/sdk/nvidia/inc/class/clc0b5sw.h    |  34 ++++++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   4 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild |   2 +
 .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/ce/ga102.c    |   2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |   3 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c | 108 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/ce/tu102.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   5 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |  19 +++
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |   9 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |   4 +
 13 files changed, 193 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
index 93c75540ba5a..a26dfeece4b7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
@@ -52,6 +52,8 @@ struct nvkm_chan *nvkm_chan_get_chid(struct nvkm_engine *, int id, unsigned long
 struct nvkm_chan *nvkm_chan_get_inst(struct nvkm_engine *, u64 inst, unsigned long *irqflags);
 void nvkm_chan_put(struct nvkm_chan **, unsigned long irqflags);
 
+struct nvkm_chan *nvkm_uchan_chan(struct nvkm_object *);
+
 struct nvkm_fifo {
 	const struct nvkm_fifo_func *func;
 	struct nvkm_engine engine;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h
new file mode 100644
index 000000000000..7dcc961cf0dc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h
@@ -0,0 +1,34 @@
+#ifndef __src_common_sdk_nvidia_inc_class_clc0b5sw_h__
+#define __src_common_sdk_nvidia_inc_class_clc0b5sw_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2014-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct NVC0B5_ALLOCATION_PARAMETERS {
+    NvU32 version;
+    NvU32 engineType;
+} NVC0B5_ALLOCATION_PARAMETERS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
index 2cdea853f265..0965c2ee50e8 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -28,6 +28,10 @@
 
 #define MC_ENGINE_IDX_DISP                          2
 
+#define MC_ENGINE_IDX_CE0                           15
+
+#define MC_ENGINE_IDX_CE9                           24
+
 #define MC_ENGINE_IDX_GSP                           49
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
index 8bf1635ffabc..165d61fc5d6c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
@@ -10,3 +10,5 @@ nvkm-y += nvkm/engine/ce/gv100.o
 nvkm-y += nvkm/engine/ce/tu102.o
 nvkm-y += nvkm/engine/ce/ga100.o
 nvkm-y += nvkm/engine/ce/ga102.o
+
+nvkm-y += nvkm/engine/ce/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
index 1c0c60138706..9427a592bd16 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga100.c
@@ -90,7 +90,7 @@ ga100_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_ce_new(&ga100_ce, device, type, inst, pengine);
 
 	return nvkm_engine_new_(&ga100_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
index 9359c5e7aa3a..ce56ede7c2e9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/ga102.c
@@ -44,7 +44,7 @@ ga102_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_ce_new(&ga102_ce, device, type, inst, pengine);
 
 	return nvkm_engine_new_(&ga102_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
index 0be72c463b21..806a76a72249 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
@@ -3,6 +3,9 @@
 #define __NVKM_CE_PRIV_H__
 #include <engine/ce.h>
 
+int r535_ce_new(const struct nvkm_engine_func *, struct nvkm_device *,
+		enum nvkm_subdev_type, int, struct nvkm_engine **);
+
 void gt215_ce_intr(struct nvkm_falcon *, struct nvkm_chan *);
 void gk104_ce_intr(struct nvkm_engine *);
 void gp100_ce_intr(struct nvkm_engine *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
new file mode 100644
index 000000000000..0c6f921d31c3
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
@@ -0,0 +1,108 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "priv.h"
+
+#include <core/object.h>
+#include <subdev/gsp.h>
+#include <engine/fifo.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h>
+
+struct r535_ce_obj {
+	struct nvkm_object object;
+	struct nvkm_gsp_object rm;
+};
+
+static void *
+r535_ce_obj_dtor(struct nvkm_object *object)
+{
+	struct r535_ce_obj *obj = container_of(object, typeof(*obj), object);
+
+	nvkm_gsp_rm_free(&obj->rm);
+	return obj;
+}
+
+static const struct nvkm_object_func
+r535_ce_obj = {
+	.dtor = r535_ce_obj_dtor,
+};
+
+static int
+r535_ce_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+		 struct nvkm_object **pobject)
+{
+	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
+	struct r535_ce_obj *obj;
+	NVC0B5_ALLOCATION_PARAMETERS *args;
+
+	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_object_ctor(&r535_ce_obj, oclass, &obj->object);
+	*pobject = &obj->object;
+
+	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
+				     sizeof(*args), &obj->rm);
+	if (WARN_ON(IS_ERR(args)))
+		return PTR_ERR(args);
+
+	args->version = 1;
+	args->engineType = NV2080_ENGINE_TYPE_COPY0 + oclass->engine->subdev.inst;
+
+	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+}
+
+static void *
+r535_ce_dtor(struct nvkm_engine *engine)
+{
+	kfree(engine->func);
+	return engine;
+}
+
+int
+r535_ce_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
+	    enum nvkm_subdev_type type, int inst, struct nvkm_engine **pengine)
+{
+	struct nvkm_engine_func *rm;
+	int nclass, ret;
+
+	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
+
+	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_ce_dtor;
+	for (int i = 0; i < nclass; i++) {
+		rm->sclass[i].minver = hw->sclass[i].minver;
+		rm->sclass[i].maxver = hw->sclass[i].maxver;
+		rm->sclass[i].oclass = hw->sclass[i].oclass;
+		rm->sclass[i].ctor = r535_ce_obj_ctor;
+	}
+
+	ret = nvkm_engine_new_(rm, device, type, inst, true, pengine);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
index 67d0545cf902..7c8647dcb349 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/tu102.c
@@ -40,7 +40,7 @@ tu102_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	     struct nvkm_engine **pengine)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_ce_new(&tu102_ce, device, type, inst, pengine);
 
 	return nvkm_engine_new_(&tu102_ce, device, type, inst, true, pengine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 7652b3218847..bd4b8cf40d4c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2758,6 +2758,7 @@ nv192_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.ce       = { 0x0000001f, ga102_ce_new },
 	.disp     = { 0x00000001, ad102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
@@ -2778,6 +2779,7 @@ nv193_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.ce       = { 0x0000001f, ga102_ce_new },
 	.disp     = { 0x00000001, ad102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
@@ -2798,6 +2800,7 @@ nv194_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.ce       = { 0x0000001f, ga102_ce_new },
 	.disp     = { 0x00000001, ad102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
@@ -2818,6 +2821,7 @@ nv196_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.ce       = { 0x0000001f, ga102_ce_new },
 	.disp     = { 0x00000001, ad102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
@@ -2838,6 +2842,7 @@ nv197_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.ce       = { 0x0000001f, ga102_ce_new },
 	.disp     = { 0x00000001, ad102_disp_new },
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index effb97d3eb3c..102e5a586e01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -331,6 +331,22 @@ static const struct nvkm_cgrp_func
 r535_cgrp = {
 };
 
+static int
+r535_engn_nonstall(struct nvkm_engn *engn)
+{
+	struct nvkm_subdev *subdev = &engn->engine->subdev;
+	int ret;
+
+	ret = nvkm_gsp_intr_nonstall(subdev->device->gsp, subdev->type, subdev->inst);
+	WARN_ON(ret < 0);
+	return ret;
+}
+
+static const struct nvkm_engn_func
+r535_ce = {
+	.nonstall = r535_engn_nonstall,
+};
+
 static void
 r535_runl_allow(struct nvkm_runl *runl, u32 engm)
 {
@@ -458,6 +474,9 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		}
 
 		switch (type) {
+		case NVKM_ENGINE_CE:
+			engn = nvkm_runl_add(runl, nv2080, &r535_ce, type, inst);
+			break;
 		case NVKM_ENGINE_SW:
 			continue;
 		default:
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 04140e0110be..9e56bcc166ed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -317,6 +317,15 @@ nvkm_uchan = {
 	.uevent = nvkm_uchan_uevent,
 };
 
+struct nvkm_chan *
+nvkm_uchan_chan(struct nvkm_object *object)
+{
+	if (WARN_ON(object->func != &nvkm_uchan))
+		return NULL;
+
+	return nvkm_uchan(object)->chan;
+}
+
 int
 nvkm_uchan_new(struct nvkm_fifo *fifo, struct nvkm_cgrp *cgrp, const struct nvkm_oclass *oclass,
 	       void *argv, u32 argc, struct nvkm_object **pobject)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 55ecb4d42c51..f36eed2fb3b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -851,6 +851,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			type = NVKM_ENGINE_DISP;
 			inst = 0;
 			break;
+		case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE9:
+			type = NVKM_ENGINE_CE;
+			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_CE0;
+			break;
 		default:
 			continue;
 		}
-- 
2.41.0

