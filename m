Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A247A53FF
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BEE10E329;
	Mon, 18 Sep 2023 20:23:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5858F10E333
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:22 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-578a397a30dso499572a12.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068601; x=1695673401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icbbPVci/Dj8h4IfO4iyrvuivnsckH3KGbUJB0kEEe0=;
 b=hOPGHo6TOQaRc8CW+o+uClMNhMF8JuHrdPQ+Tpqzg+n/T374EU76gPSo1/+/Kan6PS
 acMHju8VKPYrsAB1s9xZRqtXUQo/jlFgixfGXeLVJBoFBBxMZbeypDHTSpgC6oG7qOig
 BuSFAlR1ve/zcUoTONL+WmnXuOnDJwijNE0VnUC0TEdhedqxicdLjGuPs17dWz9YvUMn
 FDOkRp5/lBqdNEunzZyXECEtibW5TwuLyNjq1CNmIACVnO5Do7pEwWdXHh2Cwe3kJ2LS
 i5FMOGI9oCxdTVj+xsDfeSNGqsLuX0rZdO1shfHRiCRZEoYjiitg9tQq9eGy1DgZh0PU
 hUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068601; x=1695673401;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=icbbPVci/Dj8h4IfO4iyrvuivnsckH3KGbUJB0kEEe0=;
 b=lDHTpRFut0cE1np5XuvMPpHTgK5RE1nX7Ho24jyqX4EIpw2oXku+Wh9ZO38BYAGKc1
 dTYuCUMKui1m0T5yrM1yMDzjJe5wrgOu0j9kEO9zMbcBrT/M8oB7+M2Q9cfbRu/7ky8F
 vaJZSWA3T9oIUCe+u6wmy4TYeznaqXTStzys0roUpGxMn8RzpQroPNOTCbffEHxP/4AO
 vuAiIa0rzArycw9GW0VaoE0BOvVZwZOL8EvXw+gFVwgyBzJbqARmdoMDIBLvjh6NNdt4
 l82GPyDGjsUIjFXGaMuo8sSBwqRSGPfc30GNYbs1IHfLEnSgoZu0A4EfdYzIT2Q3Alsp
 /vCQ==
X-Gm-Message-State: AOJu0YyOxb+2igaQjsijq3gtOb8J4sllYjGXmAnMTdj/4WRkYyhYEDlp
 /BBuNkQ0dYUe19wemjrqGA/s8qGS/qc=
X-Google-Smtp-Source: AGHT+IHuwXI3bdYieuUk/SiGujnWPINTZjQOsX77tA6dA90JyOtExyoKLmrSRke3OQttWMHuh0wcyQ==
X-Received: by 2002:a05:6a20:1394:b0:14e:3daf:fdb9 with SMTP id
 hn20-20020a056a20139400b0014e3daffdb9mr10343792pzc.22.1695068601212; 
 Mon, 18 Sep 2023 13:23:21 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:20 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:40 +1000
Message-ID: <20230918202149.4343-36-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 35/44] drm/nouveau/gsp/r535: add interrupt handling
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

Fetches the interrupt table from RM, and hooks up the GSP interrupt
handler to message queue processing to catch async messages.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/core/falcon.h    |   3 +
 .../drm/nouveau/include/nvkm/engine/falcon.h  |   2 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 ++
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  62 ++++++++++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |  31 +++++
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   5 +
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c    |   7 ++
 drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c   |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |  30 +++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |  19 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 112 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |   1 +
 13 files changed, 291 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h b/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
index 529b8a8cce7b..3d3f1063aaa7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
@@ -49,6 +49,7 @@ int nvkm_falcon_pio_rd(struct nvkm_falcon *, u8 port, enum nvkm_falcon_mem type,
 int nvkm_falcon_dma_wr(struct nvkm_falcon *, const u8 *img, u64 dma_addr, u32 dma_base,
 		       enum nvkm_falcon_mem mem_type, u32 mem_base, int len, bool sec);
 bool nvkm_falcon_riscv_active(struct nvkm_falcon *);
+void nvkm_falcon_intr_retrigger(struct nvkm_falcon *);
 
 int gm200_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *);
 int gm200_flcn_disable(struct nvkm_falcon *);
@@ -64,6 +65,8 @@ extern const struct nvkm_falcon_func_pio gp102_flcn_emem_pio;
 
 bool tu102_flcn_riscv_active(struct nvkm_falcon *);
 
+void ga100_flcn_intr_retrigger(struct nvkm_falcon *);
+
 int ga102_flcn_select(struct nvkm_falcon *);
 int ga102_flcn_reset_prep(struct nvkm_falcon *);
 int ga102_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
index 607eac8474b0..341f133dc38c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
@@ -62,6 +62,7 @@ struct nvkm_falcon_func {
 	int (*enable)(struct nvkm_falcon *);
 	int (*select)(struct nvkm_falcon *);
 	u32 addr2;
+	u32 riscv_irqmask;
 	bool reset_pmc;
 	int (*reset_eng)(struct nvkm_falcon *);
 	int (*reset_prep)(struct nvkm_falcon *);
@@ -88,6 +89,7 @@ struct nvkm_falcon_func {
 	} cmdq, msgq;
 
 	bool (*riscv_active)(struct nvkm_falcon *);
+	void (*intr_retrigger)(struct nvkm_falcon *);
 
 	struct {
 		u32 *data;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 94b14f906df6..4f8616a58336 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -128,6 +128,7 @@ struct nvkm_gsp {
 			void *priv;
 		} ntfy[16];
 		int ntfy_nr;
+		struct work_struct work;
 	} msgq;
 
 	bool running;
@@ -150,6 +151,14 @@ struct nvkm_gsp {
 		} device;
 	} internal;
 
+	struct {
+		enum nvkm_subdev_type type;
+		int inst;
+		u32 stall;
+		u32 nonstall;
+	} intr[32];
+	int intr_nr;
+
 	const struct nvkm_gsp_rm {
 		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
 		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
@@ -378,6 +387,9 @@ nvkm_gsp_client_device_ctor(struct nvkm_gsp *gsp,
 	return ret;
 }
 
+int nvkm_gsp_intr_stall(struct nvkm_gsp *, enum nvkm_subdev_type, int);
+int nvkm_gsp_intr_nonstall(struct nvkm_gsp *, enum nvkm_subdev_type, int);
+
 int gv100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
new file mode 100644
index 000000000000..419610f582e9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
@@ -0,0 +1,62 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080internal_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080internal_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV2080_CTRL_CMD_INTERNAL_INTR_GET_KERNEL_TABLE (0x20800a5c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE       128
+
+typedef enum NV2080_INTR_CATEGORY {
+    NV2080_INTR_CATEGORY_DEFAULT = 0,
+    NV2080_INTR_CATEGORY_ESCHED_DRIVEN_ENGINE = 1,
+    NV2080_INTR_CATEGORY_ESCHED_DRIVEN_ENGINE_NOTIFICATION = 2,
+    NV2080_INTR_CATEGORY_RUNLIST = 3,
+    NV2080_INTR_CATEGORY_RUNLIST_NOTIFICATION = 4,
+    NV2080_INTR_CATEGORY_UVM_OWNED = 5,
+    NV2080_INTR_CATEGORY_UVM_SHARED = 6,
+    NV2080_INTR_CATEGORY_ENUM_COUNT = 7,
+} NV2080_INTR_CATEGORY;
+
+typedef struct NV2080_INTR_CATEGORY_SUBTREE_MAP {
+    NvU8 subtreeStart;
+    NvU8 subtreeEnd;
+} NV2080_INTR_CATEGORY_SUBTREE_MAP;
+
+typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY {
+    NvU16 engineIdx;
+    NvU32 pmcIntrMask;
+    NvU32 vectorStall;
+    NvU32 vectorNonStall;
+} NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY;
+
+typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS {
+    NvU32                                            tableLen;
+    NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_ENTRY table[NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE];
+    NV2080_INTR_CATEGORY_SUBTREE_MAP                 subtreeMap[NV2080_INTR_CATEGORY_ENUM_COUNT];
+} NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
new file mode 100644
index 000000000000..018e5c3f58d6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -0,0 +1,31 @@
+#ifndef __src_nvidia_inc_kernel_gpu_intr_engine_idx_h__
+#define __src_nvidia_inc_kernel_gpu_intr_engine_idx_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define MC_ENGINE_IDX_GSP                           49
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index ce5652496e2c..a64be7ee0ed7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2753,6 +2753,7 @@ nv192_chipset = {
 	.gsp      = { 0x00000001, ad102_gsp_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2765,6 +2766,7 @@ nv193_chipset = {
 	.gsp      = { 0x00000001, ad102_gsp_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2777,6 +2779,7 @@ nv194_chipset = {
 	.gsp      = { 0x00000001, ad102_gsp_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2789,6 +2792,7 @@ nv196_chipset = {
 	.gsp      = { 0x00000001, ad102_gsp_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2801,6 +2805,7 @@ nv197_chipset = {
 	.gsp      = { 0x00000001, ad102_gsp_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/base.c b/drivers/gpu/drm/nouveau/nvkm/falcon/base.c
index 8c4f659e982b..3b790865aece 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/base.c
@@ -25,6 +25,13 @@
 #include <subdev/timer.h>
 #include <subdev/top.h>
 
+void
+nvkm_falcon_intr_retrigger(struct nvkm_falcon *falcon)
+{
+	if (falcon->func->intr_retrigger)
+		falcon->func->intr_retrigger(falcon);
+}
+
 bool
 nvkm_falcon_riscv_active(struct nvkm_falcon *falcon)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c b/drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c
index 49fd32943916..5db94fb10afc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c
@@ -21,6 +21,12 @@
  */
 #include "priv.h"
 
+void
+ga100_flcn_intr_retrigger(struct nvkm_falcon *falcon)
+{
+	nvkm_falcon_wr32(falcon, 0x3e8, 0x00000001);
+}
+
 int
 ga100_flcn_fw_signature(struct nvkm_falcon_fw *fw, u32 *src_base_src)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index d456ca29c418..04bceaa28a19 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -21,6 +21,36 @@
  */
 #include "priv.h"
 
+int
+nvkm_gsp_intr_nonstall(struct nvkm_gsp *gsp, enum nvkm_subdev_type type, int inst)
+{
+	for (int i = 0; i < gsp->intr_nr; i++) {
+		if (gsp->intr[i].type == type && gsp->intr[i].inst == inst) {
+			if (gsp->intr[i].nonstall != ~0)
+				return gsp->intr[i].nonstall;
+
+			return -EINVAL;
+		}
+	}
+
+	return -ENOENT;
+}
+
+int
+nvkm_gsp_intr_stall(struct nvkm_gsp *gsp, enum nvkm_subdev_type type, int inst)
+{
+	for (int i = 0; i < gsp->intr_nr; i++) {
+		if (gsp->intr[i].type == type && gsp->intr[i].inst == inst) {
+			if (gsp->intr[i].stall != ~0)
+				return gsp->intr[i].stall;
+
+			return -EINVAL;
+		}
+	}
+
+	return -ENOENT;
+}
+
 static int
 nvkm_gsp_fini(struct nvkm_subdev *subdev, bool suspend)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index be73678607c5..8a2c7347f64e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -21,9 +21,26 @@
  */
 #include "priv.h"
 
+static const struct nvkm_falcon_func
+ga100_gsp_flcn = {
+	.disable = gm200_flcn_disable,
+	.enable = gm200_flcn_enable,
+	.addr2 = 0x1000,
+	.riscv_irqmask = 0x2b4,
+	.reset_eng = gp102_flcn_reset_eng,
+	.reset_wait_mem_scrubbing = gm200_flcn_reset_wait_mem_scrubbing,
+	.bind_inst = gm200_flcn_bind_inst,
+	.bind_stat = gm200_flcn_bind_stat,
+	.bind_intr = true,
+	.imem_pio = &gm200_flcn_imem_pio,
+	.dmem_pio = &gm200_flcn_dmem_pio,
+	.riscv_active = tu102_flcn_riscv_active,
+	.intr_retrigger = ga100_flcn_intr_retrigger,
+};
+
 static const struct nvkm_gsp_func
 ga100_gsp_r535_54_03 = {
-	.flcn = &tu102_gsp_flcn,
+	.flcn = &ga100_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
 	.sig_section = ".fwsignature_ga100",
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 19a2b582c661..1c41e77d607f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -139,12 +139,14 @@ ga102_gsp_flcn = {
 	.enable = gm200_flcn_enable,
 	.select = ga102_flcn_select,
 	.addr2 = 0x1000,
+	.riscv_irqmask = 0x528,
 	.reset_eng = gp102_flcn_reset_eng,
 	.reset_prep = ga102_flcn_reset_prep,
 	.reset_wait_mem_scrubbing = ga102_flcn_reset_wait_mem_scrubbing,
 	.imem_dma = &ga102_flcn_dma,
 	.dmem_dma = &ga102_flcn_dma,
 	.riscv_active = ga102_flcn_riscv_active,
+	.intr_retrigger = ga100_flcn_intr_retrigger,
 };
 
 static const struct nvkm_gsp_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index c1a5f0696e85..f1d1a709ada5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -23,6 +23,7 @@
 
 #include <core/pci.h>
 #include <subdev/timer.h>
+#include <subdev/vfn.h>
 #include <engine/sec2.h>
 
 #include <nvfw/fw.h>
@@ -32,6 +33,7 @@
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
 #include <nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h>
 #include <nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h>
 #include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h>
@@ -43,6 +45,7 @@
 #include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
 #include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h>
 #include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h>
 #include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
 
 #include <linux/acpi.h>
@@ -689,6 +692,97 @@ r535_gsp_rm = {
 	.device_dtor = r535_gsp_device_dtor,
 };
 
+static void
+r535_gsp_msgq_work(struct work_struct *work)
+{
+	struct nvkm_gsp *gsp = container_of(work, typeof(*gsp), msgq.work);
+
+	mutex_lock(&gsp->cmdq.mutex);
+	if (*gsp->msgq.rptr != *gsp->msgq.wptr)
+		r535_gsp_msg_recv(gsp, 0, 0);
+	mutex_unlock(&gsp->cmdq.mutex);
+}
+
+static irqreturn_t
+r535_gsp_intr(struct nvkm_inth *inth)
+{
+	struct nvkm_gsp *gsp = container_of(inth, typeof(*gsp), subdev.inth);
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	u32 intr = nvkm_falcon_rd32(&gsp->falcon, 0x0008);
+	u32 inte = nvkm_falcon_rd32(&gsp->falcon, gsp->falcon.func->addr2 +
+						  gsp->falcon.func->riscv_irqmask);
+	u32 stat = intr & inte;
+
+	if (!stat) {
+		nvkm_debug(subdev, "inte %08x %08x\n", intr, inte);
+		return IRQ_NONE;
+	}
+
+	if (stat & 0x00000040) {
+		nvkm_falcon_wr32(&gsp->falcon, 0x004, 0x00000040);
+		schedule_work(&gsp->msgq.work);
+		stat &= ~0x00000040;
+	}
+
+	if (stat) {
+		nvkm_error(subdev, "intr %08x\n", stat);
+		nvkm_falcon_wr32(&gsp->falcon, 0x014, stat);
+		nvkm_falcon_wr32(&gsp->falcon, 0x004, stat);
+	}
+
+	nvkm_falcon_intr_retrigger(&gsp->falcon);
+	return IRQ_HANDLED;
+}
+
+static int
+r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
+{
+	NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS *ctrl;
+	int ret = 0;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_INTR_GET_KERNEL_TABLE, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&gsp->internal.device.subdevice, ctrl, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
+
+	for (unsigned i = 0; i < ctrl->tableLen; i++) {
+		enum nvkm_subdev_type type;
+		int inst;
+
+		nvkm_debug(&gsp->subdev,
+			   "%2d: engineIdx %3d pmcIntrMask %08x stall %08x nonStall %08x\n", i,
+			   ctrl->table[i].engineIdx, ctrl->table[i].pmcIntrMask,
+			   ctrl->table[i].vectorStall, ctrl->table[i].vectorNonStall);
+
+		switch (ctrl->table[i].engineIdx) {
+		case MC_ENGINE_IDX_GSP:
+			type = NVKM_SUBDEV_GSP;
+			inst = 0;
+			break;
+		default:
+			continue;
+		}
+
+		if (WARN_ON(gsp->intr_nr == ARRAY_SIZE(gsp->intr))) {
+			ret = -ENOSPC;
+			break;
+		}
+
+		gsp->intr[gsp->intr_nr].type = type;
+		gsp->intr[gsp->intr_nr].inst = inst;
+		gsp->intr[gsp->intr_nr].stall = ctrl->table[i].vectorStall;
+		gsp->intr[gsp->intr_nr].nonstall = ctrl->table[i].vectorNonStall;
+		gsp->intr_nr++;
+	}
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return ret;
+}
+
 static int
 r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 {
@@ -718,12 +812,30 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 static int
 r535_gsp_postinit(struct nvkm_gsp *gsp)
 {
+	struct nvkm_device *device = gsp->subdev.device;
 	int ret;
 
 	ret = r535_gsp_rpc_get_gsp_static_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
+	INIT_WORK(&gsp->msgq.work, r535_gsp_msgq_work);
+
+	ret = r535_gsp_intr_get_table(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = nvkm_gsp_intr_stall(gsp, gsp->subdev.type, gsp->subdev.inst);
+	if (WARN_ON(ret < 0))
+		return ret;
+
+	ret = nvkm_inth_add(&device->vfn->intr, ret, NVKM_INTR_PRIO_NORMAL, &gsp->subdev,
+			    r535_gsp_intr, &gsp->subdev.inth);
+	if (WARN_ON(ret))
+		return ret;
+
+	nvkm_inth_allow(&gsp->subdev.inth);
+	nvkm_wr32(device, 0x110004, 0x00000040);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index b9b0e5989bd3..999150aa6721 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -151,6 +151,7 @@ tu102_gsp_flcn = {
 	.disable = gm200_flcn_disable,
 	.enable = gm200_flcn_enable,
 	.addr2 = 0x1000,
+	.riscv_irqmask = 0x2b4,
 	.reset_eng = gp102_flcn_reset_eng,
 	.reset_wait_mem_scrubbing = gm200_flcn_reset_wait_mem_scrubbing,
 	.bind_inst = gm200_flcn_bind_inst,
-- 
2.41.0

