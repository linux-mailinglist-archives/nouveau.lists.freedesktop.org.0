Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC47A5406
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996F910E33A;
	Mon, 18 Sep 2023 20:23:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C6210E339
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:41 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fdd5c1bbbso3509902b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068620; x=1695673420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AP89kUSnXpcswAxyDoeA2Mpe/aRSr/19TqL72jZBKXM=;
 b=UVp6pUXG6jxS/JRiOi6zvctgMQSFVJr+FLd2w9cayPW1T4OnNRRL8Cr1TYnk869PAY
 2ZQo+ffa6HVq0XC8ZhoxFxIr1Ha2UP8MyJ0gFOt1uEkcEDqt3TpKw1eLn4Oy1mM2lD9E
 NfVKzd9BlG0Ubd6y48juV+/HKDu7zMo+/MP6UlwXPXeO1jt0IL2X12rwFo+UgQec6Iul
 1Jk549Do5iPFyh55BBoV2OeM9U9dm4uY7pNlwPEY7vFI2Uamzf47xHWEG77mnXITr/ms
 +LFmWghxVGfN+Ywt4EvYMdgXimESB3omMtfFZ1bO+XEP2EGo4bSXRt14jMFT/t5soo2H
 Te5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068620; x=1695673420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AP89kUSnXpcswAxyDoeA2Mpe/aRSr/19TqL72jZBKXM=;
 b=IatHTt9pinKT0+EsxTkx88K7f49/EYGAuDatZxIVEHn0yxjrIkf1ZlLoZTYJO/8FyS
 ZZJcmyzJmfku3bKGlN9L37SD46taUUzc6L3FsI12KLrfrKp3IhO1w2Ez3wXh2gRFdIku
 4GxaLCKCZZUepZmJM+pvPEHgeYG533QZya1xrPD1+LN9XJly/VgPS/p6N0FWY0BZd53F
 OK/0iCVOr2EaR1EaKR3KBeLAy03HuN5arVX+sL/R4YcaNAePNsmdWYKC3LJWyISHugRh
 KjOkpJ5g5Dq4hyySbb58a+MaDYe6/cinx0uvN+0/UsQa+Kr67cDZBcOVT+f8eIFFOOEd
 cLEw==
X-Gm-Message-State: AOJu0YywRQivbSgCYD4Xq9F4GRaWqh6uQ4u3ilbsaYZU+BmksXRzBS4V
 Fid7X3F9kQx+GOba7k98HEET53fil/c=
X-Google-Smtp-Source: AGHT+IHILoYHbTR8CDcIsFpjSqqc7KHLLdyVlm1U1jXR7XowVkCSaUGTFw+DN3vGSfJmcWWQmkLUeQ==
X-Received: by 2002:a05:6a00:309e:b0:68f:b769:9182 with SMTP id
 bh30-20020a056a00309e00b0068fb7699182mr669227pfb.9.1695068620424; 
 Mon, 18 Sep 2023 13:23:40 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:40 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:48 +1000
Message-ID: <20230918202149.4343-44-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 43/44] drm/nouveau/nvjpg/r535: initial support
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

Adds support for allocating NVJPG classes from RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 +
 .../drm/nouveau/include/nvkm/engine/nvjpg.h   |   8 ++
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |   7 ++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   5 +
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   6 +
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild  |   5 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h  |   8 ++
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c  | 107 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |   4 +
 16 files changed, 246 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index 8ccc082a4a63..95110a83960e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -91,6 +91,7 @@ struct nv_device_time_v0 {
 #define NV_DEVICE_HOST_RUNLIST_ENGINES_SEC2                          0x00004000
 #define NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC                         0x00008000
 #define NV_DEVICE_HOST_RUNLIST_ENGINES_NVENC                         0x00010000
+#define NV_DEVICE_HOST_RUNLIST_ENGINES_NVJPG                         0x00020000
 /* Returns the number of available channels on runlist(data). */
 #define NV_DEVICE_HOST_RUNLIST_CHANNELS               NV_DEVICE_HOST(0x00000101)
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 86648c5d0dba..52441b6f28fc 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -253,4 +253,7 @@
 #define ADA_COMPUTE_A                                                0x0000c9c0
 
 #define NV74_CIPHER                                                  0x000074c1
+
+#define NVC4D1_VIDEO_NVJPG                                           0x0000c4d1
+#define NVC9D1_VIDEO_NVJPG                                           0x0000c9d1
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
new file mode 100644
index 000000000000..80b7933a789e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_NVJPG_H__
+#define __NVKM_NVJPG_H__
+#include <core/engine.h>
+
+int ga100_nvjpg_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
+int ad102_nvjpg_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_engine **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
index 61b98109a1c8..d8efd5372993 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
@@ -119,6 +119,13 @@ typedef struct
     NvU32 engineInstance;             // Select MSENC/NVENC0 or NVENC1 or NVENC2
 } NV_MSENC_ALLOCATION_PARAMETERS;
 
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of NVJPG?
+    NvU32 engineInstance;
+} NV_NVJPG_ALLOCATION_PARAMETERS;
+
 typedef struct
 {
     NvU32   index;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
index 5ed292000036..87fe6c4f7898 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -37,6 +37,11 @@
 #define MC_ENGINE_IDX_MSENC2                        40
 
 #define MC_ENGINE_IDX_GSP                           49
+#define MC_ENGINE_IDX_NVJPG                         50
+#define MC_ENGINE_IDX_NVJPEG                        MC_ENGINE_IDX_NVJPG
+#define MC_ENGINE_IDX_NVJPEG0                       MC_ENGINE_IDX_NVJPEG
+
+#define MC_ENGINE_IDX_NVJPEG7                       57
 
 #define MC_ENGINE_IDX_BSP                           64
 #define MC_ENGINE_IDX_NVDEC                         MC_ENGINE_IDX_BSP
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
index c6dfed18f35b..fb8c93ee5030 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
@@ -17,6 +17,7 @@ include $(src)/nvkm/engine/msppp/Kbuild
 include $(src)/nvkm/engine/msvld/Kbuild
 include $(src)/nvkm/engine/nvenc/Kbuild
 include $(src)/nvkm/engine/nvdec/Kbuild
+include $(src)/nvkm/engine/nvjpg/Kbuild
 include $(src)/nvkm/engine/pm/Kbuild
 include $(src)/nvkm/engine/sec/Kbuild
 include $(src)/nvkm/engine/sec2/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index af072ebcc8fa..77bb0956d9d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2593,6 +2593,7 @@ nv170_chipset = {
 	.ce       = { 0x000003ff, ga100_ce_new },
 	.fifo     = { 0x00000001, ga100_fifo_new },
 	.nvdec    = { 0x0000001f, ga100_nvdec_new },
+	.nvjpg    = { 0x00000001, ga100_nvjpg_new },
 };
 
 static const struct nvkm_device_chip
@@ -2771,6 +2772,7 @@ nv192_chipset = {
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
+	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2795,6 +2797,7 @@ nv193_chipset = {
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
+	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2819,6 +2822,7 @@ nv194_chipset = {
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
+	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2843,6 +2847,7 @@ nv196_chipset = {
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
+	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2867,6 +2872,7 @@ nv197_chipset = {
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.nvenc    = { 0x00000007, ad102_nvenc_new },
+	.nvjpg    = { 0x0000000f, ad102_nvjpg_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
index 24faaac15891..c5eff0bc7a3c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -43,6 +43,7 @@
 #include <engine/msvld.h>
 #include <engine/nvenc.h>
 #include <engine/nvdec.h>
+#include <engine/nvjpg.h>
 #include <engine/pm.h>
 #include <engine/sec.h>
 #include <engine/sec2.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index d7bff2e3f75c..52699085c2d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -210,6 +210,7 @@ nvkm_fifo_info(struct nvkm_engine *engine, u64 mthd, u64 *data)
 				CASE(SEC2  );
 				CASE(NVDEC );
 				CASE(NVENC );
+				CASE(NVJPG );
 				default:
 					WARN_ON(1);
 					break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index 7257120386e8..9d962264e30c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -597,6 +597,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			break;
 		case NVKM_ENGINE_NVDEC:
 		case NVKM_ENGINE_NVENC:
+		case NVKM_ENGINE_NVJPG:
 			engn = nvkm_runl_add(runl, nv2080, &r535_flcn, type, inst);
 			break;
 		case NVKM_ENGINE_SW:
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
new file mode 100644
index 000000000000..1408f664add6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: MIT
+nvkm-y += nvkm/engine/nvjpg/ga100.o
+nvkm-y += nvkm/engine/nvjpg/ad102.o
+
+nvkm-y += nvkm/engine/nvjpg/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
new file mode 100644
index 000000000000..62705dc6494c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
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
+ad102_nvjpg = {
+	.sclass = {
+		{ -1, -1, NVC9D1_VIDEO_NVJPG },
+		{}
+	}
+};
+
+int
+ad102_nvjpg_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_engine **pengine)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_nvjpg_new(&ad102_nvjpg, device, type, inst, pengine);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
new file mode 100644
index 000000000000..f550eb07da5a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
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
+ga100_nvjpg = {
+	.sclass = {
+		{ -1, -1, NVC4D1_VIDEO_NVJPG },
+		{}
+	}
+};
+
+int
+ga100_nvjpg_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_engine **pengine)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_nvjpg_new(&ga100_nvjpg, device, type, inst, pengine);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
new file mode 100644
index 000000000000..1e80cf70033a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_NVJPG_PRIV_H__
+#define __NVKM_NVJPG_PRIV_H__
+#include <engine/nvjpg.h>
+
+int r535_nvjpg_new(const struct nvkm_engine_func *, struct nvkm_device *,
+		   enum nvkm_subdev_type, int, struct nvkm_engine **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
new file mode 100644
index 000000000000..a054bff98f96
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
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
+#include <engine/fifo.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+
+struct r535_nvjpg_obj {
+	struct nvkm_object object;
+	struct nvkm_gsp_object rm;
+};
+
+static void *
+r535_nvjpg_obj_dtor(struct nvkm_object *object)
+{
+	struct r535_nvjpg_obj *obj = container_of(object, typeof(*obj), object);
+
+	nvkm_gsp_rm_free(&obj->rm);
+	return obj;
+}
+
+static const struct nvkm_object_func
+r535_nvjpg_obj = {
+	.dtor = r535_nvjpg_obj_dtor,
+};
+
+static int
+r535_nvjpg_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+		    struct nvkm_object **pobject)
+{
+	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
+	struct r535_nvjpg_obj *obj;
+	NV_NVJPG_ALLOCATION_PARAMETERS *args;
+
+	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_object_ctor(&r535_nvjpg_obj, oclass, &obj->object);
+	*pobject = &obj->object;
+
+	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
+				     sizeof(*args), &obj->rm);
+	if (WARN_ON(IS_ERR(args)))
+		return PTR_ERR(args);
+
+	args->size = sizeof(*args);
+	args->engineInstance = oclass->engine->subdev.inst;
+
+	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+}
+
+static void *
+r535_nvjpg_dtor(struct nvkm_engine *engine)
+{
+	kfree(engine->func);
+	return engine;
+}
+
+int
+r535_nvjpg_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
+	       enum nvkm_subdev_type type, int inst, struct nvkm_engine **pengine)
+{
+	struct nvkm_engine_func *rm;
+	int nclass, ret;
+
+	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
+
+	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_nvjpg_dtor;
+	for (int i = 0; i < nclass; i++) {
+		rm->sclass[i].minver = hw->sclass[i].minver;
+		rm->sclass[i].maxver = hw->sclass[i].maxver;
+		rm->sclass[i].oclass = hw->sclass[i].oclass;
+		rm->sclass[i].ctor = r535_nvjpg_obj_ctor;
+	}
+
+	ret = nvkm_engine_new_(rm, device, type, inst, true, pengine);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 8a1f7ef913e6..0df0ff36b8cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -867,6 +867,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			type = NVKM_ENGINE_NVENC;
 			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_MSENC;
 			break;
+		case MC_ENGINE_IDX_NVJPEG0 ... MC_ENGINE_IDX_NVJPEG7:
+			type = NVKM_ENGINE_NVJPG;
+			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVJPEG0;
+			break;
 		default:
 			continue;
 		}
-- 
2.41.0

