Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A347A5407
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33C7410E33B;
	Mon, 18 Sep 2023 20:23:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236B10E33B
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:43 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-690b85eb2dcso575114b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068623; x=1695673423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GFwCdLhLTnELrZ6HspmlJ/v70Div0wojeOKbgMEaMHc=;
 b=DlxYXP739xzq0lzbKeCVs4+5d7NWACTngrGfHtPdf111brxEwMxEd8qz8jD9fWA2Q7
 r7NxbDoq+wy+MhzmzH42NobAQiGitcpzirhHhsrCUgUQO1iia0jlXbUrjERvVJcdiuPu
 nvYU0KeRGlt1kI9HXYbaYGuT4ggZs9Y+VXs2LBktM6/t+XuSSBVXVSFmOcjF0T45f988
 ov76IsfsKfIKGYxlBKxuk/2Afr4cRpxx3bN499Um7J+ZUcufoopbtSQDKmcJFRt17tSD
 kSOIvzQnrUJSLLPnT5FJMFNQmcwAWnwbk65+JK6iWHSk/hOJNXphuH5ntvDWqKj6ZJxK
 LfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068623; x=1695673423;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GFwCdLhLTnELrZ6HspmlJ/v70Div0wojeOKbgMEaMHc=;
 b=UmM21Ps5G8qCGw++qF6EXAeszpw0cV59/ZkIo2prA4XTqUAmpFq5HfHjhLCQdS1uVI
 xY+CYWWJb8apifQOJ1wBv8nIqM4NIq2y2XUavrUMTbgoNhEFzcU8nOFsX34byzTL5e68
 I1GgZxfGqnI/9hfBQDNqq9e0EehyzMjtunjCSVZ+ftemSToLjYp5ah1wwId4ASmg9Seg
 5/16s5ohc0mH31Wtqmg/TPq3iLVmNqC9UO9UT9FAIgcY9VnfgYkWJmjkubD9oKXC+Bbz
 sK2HkiTUl7DUW82ujUbyxK5pcmualrds9NK3KFoiXVcxtEbo8JgvmPIXsRGBxZ9y4dSx
 qoZA==
X-Gm-Message-State: AOJu0YzEsAghJAEGAiVdAbiG37dX2aXKN2q4M3bB3KFR2LpJkx1MKakT
 ZzBiXP18z27EdlecpnS/EMotB7XZwF0=
X-Google-Smtp-Source: AGHT+IE9YSqQhdLry0aSUsiy2NB3bCjxBkg/9kXBJjGlO22TAFGjhN/IBqs/Xibd0wC5XVgFqeN2LQ==
X-Received: by 2002:a05:6a00:1794:b0:690:1c1b:aefd with SMTP id
 s20-20020a056a00179400b006901c1baefdmr12858811pfg.5.1695068622582; 
 Mon, 18 Sep 2023 13:23:42 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:42 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:49 +1000
Message-ID: <20230918202149.4343-45-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 44/44] drm/nouveau/ofa/r535: initial support
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

Adds support for allocating OFA classes from RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   4 +
 .../gpu/drm/nouveau/include/nvkm/engine/ofa.h |   9 ++
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |   6 +
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   2 +
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  11 ++
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/Kbuild    |   6 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/ad102.c   |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga100.c   |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga102.c   |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/ofa/priv.h    |   8 ++
 .../gpu/drm/nouveau/nvkm/engine/ofa/r535.c    | 107 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |   4 +
 17 files changed, 294 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index 95110a83960e..fa161b74d967 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -92,6 +92,7 @@ struct nv_device_time_v0 {
 #define NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC                         0x00008000
 #define NV_DEVICE_HOST_RUNLIST_ENGINES_NVENC                         0x00010000
 #define NV_DEVICE_HOST_RUNLIST_ENGINES_NVJPG                         0x00020000
+#define NV_DEVICE_HOST_RUNLIST_ENGINES_OFA                           0x00040000
 /* Returns the number of available channels on runlist(data). */
 #define NV_DEVICE_HOST_RUNLIST_CHANNELS               NV_DEVICE_HOST(0x00000101)
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 52441b6f28fc..e668ab1664f0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -256,4 +256,8 @@
 
 #define NVC4D1_VIDEO_NVJPG                                           0x0000c4d1
 #define NVC9D1_VIDEO_NVJPG                                           0x0000c9d1
+
+#define NVC6FA_VIDEO_OFA                                             0x0000c6fa
+#define NVC7FA_VIDEO_OFA                                             0x0000c7fa
+#define NVC9FA_VIDEO_OFA                                             0x0000c9fa
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
new file mode 100644
index 000000000000..e72e2115333b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_OFA_H__
+#define __NVKM_OFA_H__
+#include <core/engine.h>
+
+int ga100_ofa_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
+int ga102_ofa_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
+int ad102_ofa_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
index d8efd5372993..7e909d8945cd 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
@@ -126,6 +126,12 @@ typedef struct
     NvU32 engineInstance;
 } NV_NVJPG_ALLOCATION_PARAMETERS;
 
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of OFA?
+} NV_OFA_ALLOCATION_PARAMETERS;
+
 typedef struct
 {
     NvU32   index;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
index 87fe6c4f7898..cca520f61818 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -49,6 +49,8 @@
 
 #define MC_ENGINE_IDX_NVDEC7                        71
 
+#define MC_ENGINE_IDX_OFA0                          80
+
 #define MC_ENGINE_IDX_GR                            82
 #define MC_ENGINE_IDX_GR0                           MC_ENGINE_IDX_GR
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
index fb8c93ee5030..bfaaff645a34 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
@@ -18,6 +18,7 @@ include $(src)/nvkm/engine/msvld/Kbuild
 include $(src)/nvkm/engine/nvenc/Kbuild
 include $(src)/nvkm/engine/nvdec/Kbuild
 include $(src)/nvkm/engine/nvjpg/Kbuild
+include $(src)/nvkm/engine/ofa/Kbuild
 include $(src)/nvkm/engine/pm/Kbuild
 include $(src)/nvkm/engine/sec/Kbuild
 include $(src)/nvkm/engine/sec2/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 77bb0956d9d6..31ed3da32fe7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2594,6 +2594,7 @@ nv170_chipset = {
 	.fifo     = { 0x00000001, ga100_fifo_new },
 	.nvdec    = { 0x0000001f, ga100_nvdec_new },
 	.nvjpg    = { 0x00000001, ga100_nvjpg_new },
+	.ofa      = { 0x00000001, ga100_ofa_new },
 };
 
 static const struct nvkm_device_chip
@@ -2624,6 +2625,7 @@ nv172_chipset = {
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.nvenc    = { 0x00000001, ga102_nvenc_new },
+	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2655,6 +2657,7 @@ nv173_chipset = {
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.nvenc    = { 0x00000001, ga102_nvenc_new },
+	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2686,6 +2689,7 @@ nv174_chipset = {
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.nvenc    = { 0x00000001, ga102_nvenc_new },
+	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2717,6 +2721,7 @@ nv176_chipset = {
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.nvenc    = { 0x00000001, ga102_nvenc_new },
+	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2748,6 +2753,7 @@ nv177_chipset = {
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.nvenc    = { 0x00000001, ga102_nvenc_new },
+	.ofa      = { 0x00000001, ga102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2773,6 +2779,7 @@ nv192_chipset = {
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
+	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2798,6 +2805,7 @@ nv193_chipset = {
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
+	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2823,6 +2831,7 @@ nv194_chipset = {
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
+	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2848,6 +2857,7 @@ nv196_chipset = {
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
+	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2873,6 +2883,7 @@ nv197_chipset = {
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
+	.ofa      = { 0x00000001, ad102_ofa_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
index c5eff0bc7a3c..bf3176bec18a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -44,6 +44,7 @@
 #include <engine/nvenc.h>
 #include <engine/nvdec.h>
 #include <engine/nvjpg.h>
+#include <engine/ofa.h>
 #include <engine/pm.h>
 #include <engine/sec.h>
 #include <engine/sec2.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 52699085c2d1..22443fe4a39f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -211,6 +211,7 @@ nvkm_fifo_info(struct nvkm_engine *engine, u64 mthd, u64 *data)
 				CASE(NVDEC );
 				CASE(NVENC );
 				CASE(NVJPG );
+				CASE(OFA   );
 				default:
 					WARN_ON(1);
 					break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index 9d962264e30c..14a67cf96204 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -598,6 +598,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		case NVKM_ENGINE_NVDEC:
 		case NVKM_ENGINE_NVENC:
 		case NVKM_ENGINE_NVJPG:
+		case NVKM_ENGINE_OFA:
 			engn = nvkm_runl_add(runl, nv2080, &r535_flcn, type, inst);
 			break;
 		case NVKM_ENGINE_SW:
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
new file mode 100644
index 000000000000..99f1713d7e51
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: MIT
+nvkm-y += nvkm/engine/ofa/ga100.o
+nvkm-y += nvkm/engine/ofa/ga102.o
+nvkm-y += nvkm/engine/ofa/ad102.o
+
+nvkm-y += nvkm/engine/ofa/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
new file mode 100644
index 000000000000..7ac87ef26aec
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
@@ -0,0 +1,44 @@
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
+#include <subdev/gsp.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+ad102_ofa = {
+	.sclass = {
+		{ -1, -1, NVC9FA_VIDEO_OFA },
+		{}
+	}
+};
+
+int
+ad102_ofa_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_engine **pengine)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_ofa_new(&ad102_ofa, device, type, inst, pengine);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
new file mode 100644
index 000000000000..ef474f61a1b5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
@@ -0,0 +1,44 @@
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
+#include <subdev/gsp.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+ga100_ofa = {
+	.sclass = {
+		{ -1, -1, NVC6FA_VIDEO_OFA },
+		{}
+	}
+};
+
+int
+ga100_ofa_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_engine **pengine)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_ofa_new(&ga100_ofa, device, type, inst, pengine);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
new file mode 100644
index 000000000000..bea255529993
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
@@ -0,0 +1,44 @@
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
+#include <subdev/gsp.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+ga102_ofa = {
+	.sclass = {
+		{ -1, -1, NVC7FA_VIDEO_OFA },
+		{}
+	}
+};
+
+int
+ga102_ofa_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_engine **pengine)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_ofa_new(&ga102_ofa, device, type, inst, pengine);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
new file mode 100644
index 000000000000..caf29e6bddb4
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_OFA_PRIV_H__
+#define __NVKM_OFA_PRIV_H__
+#include <engine/ofa.h>
+
+int r535_ofa_new(const struct nvkm_engine_func *, struct nvkm_device *,
+		 enum nvkm_subdev_type, int, struct nvkm_engine **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
new file mode 100644
index 000000000000..b34d6d0a6913
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
@@ -0,0 +1,107 @@
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
+#include <subdev/mmu.h>
+#include <engine/fifo.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+
+struct r535_ofa_obj {
+	struct nvkm_object object;
+	struct nvkm_gsp_object rm;
+};
+
+static void *
+r535_ofa_obj_dtor(struct nvkm_object *object)
+{
+	struct r535_ofa_obj *obj = container_of(object, typeof(*obj), object);
+
+	nvkm_gsp_rm_free(&obj->rm);
+	return obj;
+}
+
+static const struct nvkm_object_func
+r535_ofa_obj = {
+	.dtor = r535_ofa_obj_dtor,
+};
+
+static int
+r535_ofa_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+		 struct nvkm_object **pobject)
+{
+	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
+	struct r535_ofa_obj *obj;
+	NV_OFA_ALLOCATION_PARAMETERS *args;
+
+	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_object_ctor(&r535_ofa_obj, oclass, &obj->object);
+	*pobject = &obj->object;
+
+	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
+				     sizeof(*args), &obj->rm);
+	if (WARN_ON(IS_ERR(args)))
+		return PTR_ERR(args);
+
+	args->size = sizeof(*args);
+
+	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+}
+
+static void *
+r535_ofa_dtor(struct nvkm_engine *engine)
+{
+	kfree(engine->func);
+	return engine;
+}
+
+int
+r535_ofa_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
+	     enum nvkm_subdev_type type, int inst, struct nvkm_engine **pengine)
+{
+	struct nvkm_engine_func *rm;
+	int nclass, ret;
+
+	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
+
+	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_ofa_dtor;
+	for (int i = 0; i < nclass; i++) {
+		rm->sclass[i].minver = hw->sclass[i].minver;
+		rm->sclass[i].maxver = hw->sclass[i].maxver;
+		rm->sclass[i].oclass = hw->sclass[i].oclass;
+		rm->sclass[i].ctor = r535_ofa_obj_ctor;
+	}
+
+	ret = nvkm_engine_new_(rm, device, type, inst, true, pengine);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 0df0ff36b8cb..c24693f265e8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -871,6 +871,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			type = NVKM_ENGINE_NVJPG;
 			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVJPEG0;
 			break;
+		case MC_ENGINE_IDX_OFA0:
+			type = NVKM_ENGINE_OFA;
+			inst = 0;
+			break;
 		default:
 			continue;
 		}
-- 
2.41.0

