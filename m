Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BB27A5400
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413E510E333;
	Mon, 18 Sep 2023 20:23:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4553210E330
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:25 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5789de5c677so602121a12.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068604; x=1695673404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TasMEnJNckkb+MQs7CWVdz4B+oP1mJyrVIGpLd8hCu0=;
 b=AcFybgVBmZW1j1ZhQvh413Lqk4TjG3LaljhF4FKlFnu/1MpGWiEJjXfSgFGJ9MAFZe
 6yHualibi/yXwTgMyZw0H1BK3N5S+T5ud+UZ5npyS1mPpl29xuWoHHE/P24tfwyEa27Z
 505D8khJShwfGivBAZDclkF5xni7BJbMk4fZuPRrE2QSt6WsiuGPmNaO1DB07lR1RbFM
 wac7MwoGTl7JalY4TddTYc+12fQA/JYdd2otvhmro35Flke2YdqGJytK6dKd2wNR2n+f
 8YpOQaHGFakBv+T6/OAIN+QebLK7dP2k7c8A/UcrDElc/ct85fdfCXRJ1e0weKyMfz+b
 G+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068604; x=1695673404;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TasMEnJNckkb+MQs7CWVdz4B+oP1mJyrVIGpLd8hCu0=;
 b=nuqq/d6hYiY2ne4jr+WWQkE+nDMvOZSLo1waJhyNWmiNrUYOyIv5S1z/lujqd/JxCy
 ZmeYn+J8nxHHPF8ZAbaZ7MyJStaTx16voEtSkF+7T7m2LRz1m5nzgWOx6XNijJoB35P0
 v7LnqUWbeLOQ2xXSJ/sNCQwhoMBTL88nCHrtHtviNKTaDQSrDSGorIEjBdRxdW/w7aWC
 WOi1wPkUfctCr60UQbJDQYGokPq0M2imCYVAnPpBew/QCI0vt37CNOFIFb54foCnUUw0
 yJYr66HKf0keUz4vp7T9qjJsPlWsqitsm3jVki/m1o1bV/b9IcE0p0iCkoEju2AueWOh
 Awpg==
X-Gm-Message-State: AOJu0YzNnfM3xFuGB8FfzjLmIS8g5u31qTJra3v5HXNfPG5HVseWgxe4
 JACofkbwjA8JhdB4EBx15OFOQxw/EuQ=
X-Google-Smtp-Source: AGHT+IGTz7ckc1XNmEgNxRFDQMrUgXrX8VR1J997OKwpbL2fOYfG34hB3lc9KX/LjybtjUS/lJ6ZhA==
X-Received: by 2002:a05:6a20:d90b:b0:13b:a2c9:922e with SMTP id
 jd11-20020a056a20d90b00b0013ba2c9922emr8323986pzb.27.1695068603629; 
 Mon, 18 Sep 2023 13:23:23 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:23 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:41 +1000
Message-ID: <20230918202149.4343-37-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 36/44] drm/nouveau/mmu/r535: initial support
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

- Valid VRAM regions are read from GSP-RM, and used to construct our MM
- BAR1/BAR2 VMMs modified to be shared with RM
- Client VMMs have RM VASPACE objects created for them
- Adds FBSR to backup system objects in VRAM across suspend

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/bar.h |   4 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |   5 +
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  11 +
 .../common/sdk/nvidia/inc/class/cl84a0.h      |  33 ++
 .../common/sdk/nvidia/inc/class/cl90f1.h      |  31 ++
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  22 ++
 .../common/sdk/nvidia/inc/ctrl/ctrl90f1.h     |  95 +++++
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |  94 +++++
 .../535.54.03/nvidia/generated/g_fbsr_nvoc.h  |  31 ++
 .../nvidia/generated/g_rpc-structures.h       |  20 ++
 .../nvidia/generated/g_sdk-structures.h       |   8 +
 .../nvidia/kernel/inc/vgpu/rpc_headers.h      |   7 +
 .../nvidia/kernel/inc/vgpu/sdk-structures.h   |  40 +++
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  20 ++
 .../gpu/drm/nouveau/nvkm/subdev/bar/Kbuild    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |   3 +
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    | 186 ++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/bar/tu102.c   |   2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c |  37 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  47 +++
 .../drm/nouveau/nvkm/subdev/instmem/Kbuild    |   2 +
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |   2 +-
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   3 +
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    | 333 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |   4 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |   6 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/r535.c    | 123 +++++++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c   |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |   6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |   7 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |   5 +-
 33 files changed, 1201 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bar.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bar.h
index 4f07836ab984..874a5080ba06 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bar.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bar.h
@@ -11,6 +11,10 @@ struct nvkm_bar {
 	spinlock_t lock;
 	bool bar2;
 
+	void __iomem *flushBAR2PhysMode;
+	struct nvkm_memory *flushFBZero;
+	void __iomem *flushBAR2;
+
 	/* whether the BAR supports to be ioremapped WC or should be uncached */
 	bool iomap_uncached;
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 4f8616a58336..f5130f4f4a5a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -65,6 +65,13 @@ struct nvkm_gsp {
 		} heap;
 		u64 addr;
 		u64 size;
+
+		struct {
+			u64 addr;
+			u64 size;
+		} region[16];
+		int region_nr;
+		u32 rsvd_size;
 	} fb;
 
 	struct {
@@ -159,6 +166,11 @@ struct nvkm_gsp {
 	} intr[32];
 	int intr_nr;
 
+	struct {
+		u64 rm_bar1_pdb;
+		u64 rm_bar2_pdb;
+	} bar;
+
 	const struct nvkm_gsp_rm {
 		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
 		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index 7d93c742ee59..e10cbd9203ec 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -24,6 +24,11 @@ struct nvkm_instmem {
 	struct nvkm_ramht  *ramht;
 	struct nvkm_memory *ramro;
 	struct nvkm_memory *ramfc;
+
+	struct {
+		struct sg_table fbsr;
+		bool fbsr_valid;
+	} rm;
 };
 
 u32 nvkm_instmem_rd32(struct nvkm_instmem *, u32 addr);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 2fd2f2433fc7..935b1cacd528 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_MMU_H__
 #define __NVKM_MMU_H__
 #include <core/subdev.h>
+#include <subdev/gsp.h>
 
 struct nvkm_vma {
 	struct list_head head;
@@ -63,6 +64,16 @@ struct nvkm_vmm {
 	void *nullp;
 
 	bool replay;
+
+	struct {
+		u64 bar2_pdb;
+
+		struct nvkm_gsp_client client;
+		struct nvkm_gsp_device device;
+		struct nvkm_gsp_object object;
+
+		struct nvkm_vma *rsvd;
+	} rm;
 };
 
 int nvkm_vmm_new(struct nvkm_device *, u64 addr, u64 size, void *argv, u32 argc,
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h
new file mode 100644
index 000000000000..d96855d42e62
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h
@@ -0,0 +1,33 @@
+#ifndef __src_common_sdk_nvidia_inc_class_cl84a0_h__
+#define __src_common_sdk_nvidia_inc_class_cl84a0_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV01_MEMORY_LIST_SYSTEM (0x00000081)
+
+#define NV01_MEMORY_LIST_FBMEM  (0x00000082)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h
new file mode 100644
index 000000000000..6ed4ed49bbcc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h
@@ -0,0 +1,31 @@
+#ifndef __src_common_sdk_nvidia_inc_class_cl90f1_h__
+#define __src_common_sdk_nvidia_inc_class_cl90f1_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2011 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define FERMI_VASPACE_A                                     (0x000090f1)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
index 419610f582e9..e76669fe0453 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
@@ -59,4 +59,26 @@ typedef struct NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS {
     NV2080_INTR_CATEGORY_SUBTREE_MAP                 subtreeMap[NV2080_INTR_CATEGORY_ENUM_COUNT];
 } NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS;
 
+#define NV2080_CTRL_CMD_INTERNAL_FBSR_INIT (0x20800ac2) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
+    NvU32    fbsrType;
+    NvU32    numRegions;
+    NvHandle hClient;
+    NvHandle hSysMem;
+    NV_DECLARE_ALIGNED(NvU64 gspFbAllocsSysOffset, 8);
+    NvBool   bEnteringGcoffState;
+} NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_FBSR_SEND_REGION_INFO (0x20800ac3) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS {
+    NvU32    fbsrType;
+    NvHandle hClient;
+    NvHandle hVidMem;
+    NV_DECLARE_ALIGNED(NvU64 vidOffset, 8);
+    NV_DECLARE_ALIGNED(NvU64 sysOffset, 8);
+    NV_DECLARE_ALIGNED(NvU64 size, 8);
+} NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS;
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
new file mode 100644
index 000000000000..fbc2794c0341
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
@@ -0,0 +1,95 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl90f1_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl90f1_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2014-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define GMMU_FMT_MAX_LEVELS  6U
+
+#define NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES (0x90f10106U) /* finn: Evaluated from "(FINN_FERMI_VASPACE_A_VASPACE_INTERFACE_ID << 8) | NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS_MESSAGE_ID" */
+
+typedef struct NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS {
+    /*!
+     * [in] GPU sub-device handle - this API only supports unicast.
+     *      Pass 0 to use subDeviceId instead.
+     */
+    NvHandle hSubDevice;
+
+    /*!
+     * [in] GPU sub-device ID. Ignored if hSubDevice is non-zero.
+     */
+    NvU32    subDeviceId;
+
+    /*!
+     * [in] Page size (VA coverage) of the level to reserve.
+     *      This need not be a leaf (page table) page size - it can be
+     *      the coverage of an arbitrary level (including root page directory).
+     */
+    NV_DECLARE_ALIGNED(NvU64 pageSize, 8);
+
+    /*!
+     * [in] First GPU virtual address of the range to reserve.
+     *      This must be aligned to pageSize.
+     */
+    NV_DECLARE_ALIGNED(NvU64 virtAddrLo, 8);
+
+    /*!
+     * [in] Last GPU virtual address of the range to reserve.
+     *      This (+1) must be aligned to pageSize.
+     */
+    NV_DECLARE_ALIGNED(NvU64 virtAddrHi, 8);
+
+    /*! 
+     * [in] Number of PDE levels to copy.
+     */
+    NvU32    numLevelsToCopy;
+
+   /*!
+     * [in] Per-level information.
+     */
+    struct {
+        /*!
+         * Physical address of this page level instance.
+         */
+        NV_DECLARE_ALIGNED(NvU64 physAddress, 8);
+
+        /*!
+         * Size in bytes allocated for this level instance.
+         */
+        NV_DECLARE_ALIGNED(NvU64 size, 8);
+
+        /*!
+         * Aperture in which this page level instance resides.
+         */
+        NvU32 aperture;
+
+        /*!
+         * Page shift corresponding to the level
+         */
+        NvU8  pageShift;
+    } levels[GMMU_FMT_MAX_LEVELS];
+} NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
new file mode 100644
index 000000000000..28f8aaa9da47
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
@@ -0,0 +1,94 @@
+#ifndef __src_common_sdk_nvidia_inc_nvos_h__
+#define __src_common_sdk_nvidia_inc_nvos_h__
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
+#define NVOS02_FLAGS_PHYSICALITY                                   7:4
+#define NVOS02_FLAGS_PHYSICALITY_CONTIGUOUS                        (0x00000000)
+#define NVOS02_FLAGS_PHYSICALITY_NONCONTIGUOUS                     (0x00000001)
+#define NVOS02_FLAGS_LOCATION                                      11:8
+#define NVOS02_FLAGS_LOCATION_PCI                                  (0x00000000)
+#define NVOS02_FLAGS_LOCATION_AGP                                  (0x00000001)
+#define NVOS02_FLAGS_LOCATION_VIDMEM                               (0x00000002)
+#define NVOS02_FLAGS_COHERENCY                                     15:12
+#define NVOS02_FLAGS_COHERENCY_UNCACHED                            (0x00000000)
+#define NVOS02_FLAGS_COHERENCY_CACHED                              (0x00000001)
+#define NVOS02_FLAGS_COHERENCY_WRITE_COMBINE                       (0x00000002)
+#define NVOS02_FLAGS_COHERENCY_WRITE_THROUGH                       (0x00000003)
+#define NVOS02_FLAGS_COHERENCY_WRITE_PROTECT                       (0x00000004)
+#define NVOS02_FLAGS_COHERENCY_WRITE_BACK                          (0x00000005)
+#define NVOS02_FLAGS_ALLOC                                         17:16
+#define NVOS02_FLAGS_ALLOC_NONE                                    (0x00000001)
+#define NVOS02_FLAGS_GPU_CACHEABLE                                 18:18
+#define NVOS02_FLAGS_GPU_CACHEABLE_NO                              (0x00000000)
+#define NVOS02_FLAGS_GPU_CACHEABLE_YES                             (0x00000001)
+
+#define NVOS02_FLAGS_KERNEL_MAPPING                                19:19
+#define NVOS02_FLAGS_KERNEL_MAPPING_NO_MAP                         (0x00000000)
+#define NVOS02_FLAGS_KERNEL_MAPPING_MAP                            (0x00000001)
+#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY                            20:20
+#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY_NO                         (0x00000000)
+#define NVOS02_FLAGS_ALLOC_NISO_DISPLAY_YES                        (0x00000001)
+
+#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY                          21:21
+#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY_NO                       (0x00000000)
+#define NVOS02_FLAGS_ALLOC_USER_READ_ONLY_YES                      (0x00000001)
+
+#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY                        22:22
+#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY_NO                     (0x00000000)
+#define NVOS02_FLAGS_ALLOC_DEVICE_READ_ONLY_YES                    (0x00000001)
+
+#define NVOS02_FLAGS_PEER_MAP_OVERRIDE                             23:23
+#define NVOS02_FLAGS_PEER_MAP_OVERRIDE_DEFAULT                     (0x00000000)
+#define NVOS02_FLAGS_PEER_MAP_OVERRIDE_REQUIRED                    (0x00000001)
+
+#define NVOS02_FLAGS_ALLOC_TYPE_SYNCPOINT                          24:24
+#define NVOS02_FLAGS_ALLOC_TYPE_SYNCPOINT_APERTURE                 (0x00000001)
+
+#define NVOS02_FLAGS_MEMORY_PROTECTION                             26:25
+#define NVOS02_FLAGS_MEMORY_PROTECTION_DEFAULT                     (0x00000000)
+#define NVOS02_FLAGS_MEMORY_PROTECTION_PROTECTED                   (0x00000001)
+#define NVOS02_FLAGS_MEMORY_PROTECTION_UNPROTECTED                 (0x00000002)
+
+#define NVOS02_FLAGS_MAPPING                                       31:30
+#define NVOS02_FLAGS_MAPPING_DEFAULT                               (0x00000000)
+#define NVOS02_FLAGS_MAPPING_NO_MAP                                (0x00000001)
+#define NVOS02_FLAGS_MAPPING_NEVER_MAP                             (0x00000002)
+
+typedef struct
+{
+    NvU32   index;
+    NvV32   flags;
+    NvU64   vaSize NV_ALIGN_BYTES(8);
+    NvU64   vaStartInternal NV_ALIGN_BYTES(8);
+    NvU64   vaLimitInternal NV_ALIGN_BYTES(8);
+    NvU32   bigPageSize;
+    NvU64   vaBase NV_ALIGN_BYTES(8);
+} NV_VASPACE_ALLOCATION_PARAMETERS;
+
+#define NV_VASPACE_ALLOCATION_INDEX_GPU_NEW                                 0x00 //<! Create new VASpace, by default
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h
new file mode 100644
index 000000000000..00198b7ecd23
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h
@@ -0,0 +1,31 @@
+#ifndef __src_nvidia_generated_g_fbsr_nvoc_h__
+#define __src_nvidia_generated_g_fbsr_nvoc_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2009-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define FBSR_TYPE_DMA                                 4   // Copy using DMA. Fastest.
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
index 38d42cdbc9cb..05ac91facca4 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
@@ -1,6 +1,7 @@
 #ifndef __src_nvidia_generated_g_rpc_structures_h__
 #define __src_nvidia_generated_g_rpc_structures_h__
 #include <nvrm/535.54.03/nvidia/generated/g_sdk-structures.h>
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h>
 
 /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
 
@@ -27,6 +28,20 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+typedef struct rpc_alloc_memory_v13_01
+{
+    NvHandle   hClient;
+    NvHandle   hDevice;
+    NvHandle   hMemory;
+    NvU32      hClass;
+    NvU32      flags;
+    NvU32      pteAdjust;
+    NvU32      format;
+    NvU64      length NV_ALIGN_BYTES(8);
+    NvU32      pageCount;
+    struct pte_desc pteDesc;
+} rpc_alloc_memory_v13_01;
+
 typedef struct rpc_free_v03_00
 {
     NVOS00_PARAMETERS_v03_00 params;
@@ -39,6 +54,11 @@ typedef struct rpc_unloading_guest_driver_v1F_07
     NvU32      newLevel;
 } rpc_unloading_guest_driver_v1F_07;
 
+typedef struct rpc_update_bar_pde_v15_00
+{
+    UpdateBarPde_v15_00 info;
+} rpc_update_bar_pde_v15_00;
+
 typedef struct rpc_gsp_rm_alloc_v03_00
 {
     NvHandle   hClient;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
index 4ed66c13bb91..fe2d9062a4c4 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
@@ -1,5 +1,6 @@
 #ifndef __src_nvidia_generated_g_sdk_structures_h__
 #define __src_nvidia_generated_g_sdk_structures_h__
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
 
 /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
 
@@ -34,4 +35,11 @@ typedef struct NVOS00_PARAMETERS_v03_00
     NvV32      status;
 } NVOS00_PARAMETERS_v03_00;
 
+typedef struct UpdateBarPde_v15_00
+{
+    NV_RPC_UPDATE_PDE_BAR_TYPE barType;
+    NvU64      entryValue NV_ALIGN_BYTES(8);
+    NvU64      entryLevelShift NV_ALIGN_BYTES(8);
+} UpdateBarPde_v15_00;
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h
index b48b26049b9d..07143060a9f5 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h
@@ -28,6 +28,13 @@
 
 #define MAX_GPC_COUNT           32
 
+typedef enum
+{
+    NV_RPC_UPDATE_PDE_BAR_1,
+    NV_RPC_UPDATE_PDE_BAR_2,
+    NV_RPC_UPDATE_PDE_BAR_INVALID,
+} NV_RPC_UPDATE_PDE_BAR_TYPE;
+
 typedef struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS 
 {
     NvU32 headIndex;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h
new file mode 100644
index 000000000000..2dc692ec9352
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h
@@ -0,0 +1,40 @@
+#ifndef __src_nvidia_kernel_inc_vgpu_sdk_structures_h__
+#define __src_nvidia_kernel_inc_vgpu_sdk_structures_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+struct pte_desc
+{
+    NvU32 idr:2;
+    NvU32 reserved1:14;
+    NvU32 length:16;
+    union {
+        NvU64 pte; // PTE when IDR==0; PDE when IDR > 0
+        NvU64 pde; // PTE when IDR==0; PDE when IDR > 0
+    } pte_pde[]  NV_ALIGN_BYTES(8); // PTE when IDR==0; PDE when IDR > 0
+};
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index a64be7ee0ed7..fc2d896f71ce 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2747,10 +2747,14 @@ nv177_chipset = {
 static const struct nvkm_device_chip
 nv192_chipset = {
 	.name = "AD102",
+	.bar      = { 0x00000001, tu102_bar_new },
 	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga102_fb_new },
 	.gsp      = { 0x00000001, ad102_gsp_new },
+	.imem     = { 0x00000001, nv50_instmem_new },
+	.mmu      = { 0x00000001, tu102_mmu_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
@@ -2760,10 +2764,14 @@ nv192_chipset = {
 static const struct nvkm_device_chip
 nv193_chipset = {
 	.name = "AD103",
+	.bar      = { 0x00000001, tu102_bar_new },
 	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga102_fb_new },
 	.gsp      = { 0x00000001, ad102_gsp_new },
+	.imem     = { 0x00000001, nv50_instmem_new },
+	.mmu      = { 0x00000001, tu102_mmu_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
@@ -2773,10 +2781,14 @@ nv193_chipset = {
 static const struct nvkm_device_chip
 nv194_chipset = {
 	.name = "AD104",
+	.bar      = { 0x00000001, tu102_bar_new },
 	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga102_fb_new },
 	.gsp      = { 0x00000001, ad102_gsp_new },
+	.imem     = { 0x00000001, nv50_instmem_new },
+	.mmu      = { 0x00000001, tu102_mmu_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
@@ -2786,10 +2798,14 @@ nv194_chipset = {
 static const struct nvkm_device_chip
 nv196_chipset = {
 	.name = "AD106",
+	.bar      = { 0x00000001, tu102_bar_new },
 	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga102_fb_new },
 	.gsp      = { 0x00000001, ad102_gsp_new },
+	.imem     = { 0x00000001, nv50_instmem_new },
+	.mmu      = { 0x00000001, tu102_mmu_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
@@ -2799,10 +2815,14 @@ nv196_chipset = {
 static const struct nvkm_device_chip
 nv197_chipset = {
 	.name = "AD107",
+	.bar      = { 0x00000001, tu102_bar_new },
 	.bios     = { 0x00000001, nvkm_bios_new },
 	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fault    = { 0x00000001, tu102_fault_new },
 	.fb       = { 0x00000001, ga102_fb_new },
 	.gsp      = { 0x00000001, ad102_gsp_new },
+	.imem     = { 0x00000001, nv50_instmem_new },
+	.mmu      = { 0x00000001, tu102_mmu_new },
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild
index 8faee3317a74..9754c6872543 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild
@@ -7,3 +7,5 @@ nvkm-y += nvkm/subdev/bar/gk20a.o
 nvkm-y += nvkm/subdev/bar/gm107.o
 nvkm-y += nvkm/subdev/bar/gm20b.o
 nvkm-y += nvkm/subdev/bar/tu102.o
+
+nvkm-y += nvkm/subdev/bar/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
index daebfc991c76..d0168e0b78fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/priv.h
@@ -4,6 +4,9 @@
 #define nvkm_bar(p) container_of((p), struct nvkm_bar, subdev)
 #include <subdev/bar.h>
 
+int r535_bar_new_(const struct nvkm_bar_func *,
+		  struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_bar **);
+
 void nvkm_bar_ctor(const struct nvkm_bar_func *, struct nvkm_device *,
 		   enum nvkm_subdev_type, int, struct nvkm_bar *);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
new file mode 100644
index 000000000000..461fb8daf596
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
@@ -0,0 +1,186 @@
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
+#include "gf100.h"
+
+#include <core/mm.h>
+#include <subdev/fb.h>
+#include <subdev/gsp.h>
+#include <subdev/instmem.h>
+#include <subdev/mmu/vmm.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
+
+static void
+r535_bar_flush(struct nvkm_bar *bar)
+{
+	ioread32_native(bar->flushBAR2);
+}
+
+static void
+r535_bar_bar2_wait(struct nvkm_bar *base)
+{
+}
+
+static int
+r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr)
+{
+	rpc_update_bar_pde_v15_00 *rpc;
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UPDATE_BAR_PDE, sizeof(*rpc));
+	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
+		return -EIO;
+
+	rpc->info.barType = NV_RPC_UPDATE_PDE_BAR_2;
+	rpc->info.entryValue = addr ? ((addr >> 4) | 2) : 0; /* PD3 entry format! */
+	rpc->info.entryLevelShift = 47; //XXX: probably fetch this from mmu!
+
+	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+}
+
+static void
+r535_bar_bar2_fini(struct nvkm_bar *bar)
+{
+	struct nvkm_gsp *gsp = bar->subdev.device->gsp;
+
+	bar->flushBAR2 = bar->flushBAR2PhysMode;
+	nvkm_done(bar->flushFBZero);
+
+	WARN_ON(r535_bar_bar2_update_pde(gsp, 0));
+}
+
+static void
+r535_bar_bar2_init(struct nvkm_bar *bar)
+{
+	struct nvkm_device *device = bar->subdev.device;
+	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[0].vmm;
+	struct nvkm_gsp *gsp = device->gsp;
+
+	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->pd->pde[0]->pt[0]->addr));
+	vmm->rm.bar2_pdb = gsp->bar.rm_bar2_pdb;
+
+	if (!bar->flushFBZero) {
+		struct nvkm_memory *fbZero;
+		int ret;
+
+		ret = nvkm_ram_wrap(device, 0, 0x1000, &fbZero);
+		if (ret == 0) {
+			ret = nvkm_memory_kmap(fbZero, &bar->flushFBZero);
+			nvkm_memory_unref(&fbZero);
+		}
+		WARN_ON(ret);
+	}
+
+	bar->bar2 = true;
+	bar->flushBAR2 = nvkm_kmap(bar->flushFBZero);
+	WARN_ON(!bar->flushBAR2);
+}
+
+static void
+r535_bar_bar1_wait(struct nvkm_bar *base)
+{
+}
+
+static void
+r535_bar_bar1_fini(struct nvkm_bar *base)
+{
+}
+
+static void
+r535_bar_bar1_init(struct nvkm_bar *bar)
+{
+	struct nvkm_device *device = bar->subdev.device;
+	struct nvkm_gsp *gsp = device->gsp;
+	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[1].vmm;
+	struct nvkm_memory *pd3;
+	int ret;
+
+	ret = nvkm_ram_wrap(device, gsp->bar.rm_bar1_pdb, 0x1000, &pd3);
+	if (WARN_ON(ret))
+		return;
+
+	nvkm_memory_unref(&vmm->pd->pt[0]->memory);
+
+	ret = nvkm_memory_kmap(pd3, &vmm->pd->pt[0]->memory);
+	nvkm_memory_unref(&pd3);
+	if (WARN_ON(ret))
+		return;
+
+	vmm->pd->pt[0]->addr = nvkm_memory_addr(vmm->pd->pt[0]->memory);
+}
+
+static void *
+r535_bar_dtor(struct nvkm_bar *bar)
+{
+	void *data = gf100_bar_dtor(bar);
+
+	nvkm_memory_unref(&bar->flushFBZero);
+
+	if (bar->flushBAR2PhysMode)
+		iounmap(bar->flushBAR2PhysMode);
+
+	kfree(bar->func);
+	return data;
+}
+
+int
+r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
+	      enum nvkm_subdev_type type, int inst, struct nvkm_bar **pbar)
+{
+	struct nvkm_bar_func *rm;
+	struct nvkm_bar *bar;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_bar_dtor;
+	rm->oneinit = hw->oneinit;
+	rm->bar1.init = r535_bar_bar1_init;
+	rm->bar1.fini = r535_bar_bar1_fini;
+	rm->bar1.wait = r535_bar_bar1_wait;
+	rm->bar1.vmm = hw->bar1.vmm;
+	rm->bar2.init = r535_bar_bar2_init;
+	rm->bar2.fini = r535_bar_bar2_fini;
+	rm->bar2.wait = r535_bar_bar2_wait;
+	rm->bar2.vmm = hw->bar2.vmm;
+	rm->flush = r535_bar_flush;
+
+	ret = gf100_bar_new_(rm, device, type, inst, &bar);
+	*pbar = bar;
+	if (ret) {
+		if (!bar)
+			kfree(rm);
+		return ret;
+	}
+
+	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
+	if (!bar->flushBAR2PhysMode)
+		return -ENOMEM;
+
+	bar->flushBAR2 = bar->flushBAR2PhysMode;
+
+	gf100_bar(*pbar)->bar2_halve = true;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c
index 8041bb632835..b4196edad5b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/tu102.c
@@ -97,7 +97,7 @@ tu102_bar_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_bar **pbar)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_bar_new_(&tu102_bar, device, type, inst, pbar);
 
 	return gf100_bar_new_(&tu102_bar, device, type, inst, pbar);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
index 0c301882f2fc..d32515010167 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
@@ -20,6 +20,42 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "priv.h"
+#include "ram.h"
+
+#include <subdev/gsp.h>
+
+static const struct nvkm_ram_func
+r535_fb_ram = {
+};
+
+static int
+r535_fb_ram_new(struct nvkm_fb *fb, struct nvkm_ram **pram)
+{
+	struct nvkm_gsp *gsp = fb->subdev.device->gsp;
+	struct nvkm_ram *ram;
+	int ret;
+
+	if (!(ram = *pram = kzalloc(sizeof(*ram), GFP_KERNEL)))
+		return -ENOMEM;
+
+	ram->func = &r535_fb_ram;
+	ram->fb = fb;
+	ram->type = NVKM_RAM_TYPE_UNKNOWN; /*TODO: pull this from GSP. */
+	ram->size = gsp->fb.size;
+	ram->stolen = false;
+	mutex_init(&ram->mutex);
+
+	for (int i = 0; i < gsp->fb.region_nr; i++) {
+		ret = nvkm_mm_init(&ram->vram, NVKM_RAM_MM_NORMAL,
+				   gsp->fb.region[i].addr >> NVKM_RAM_MM_SHIFT,
+				   gsp->fb.region[i].size >> NVKM_RAM_MM_SHIFT,
+				   1);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
 
 static void *
 r535_fb_dtor(struct nvkm_fb *fb)
@@ -41,6 +77,7 @@ r535_fb_new(const struct nvkm_fb_func *hw,
 	rm->dtor = r535_fb_dtor;
 	rm->sysmem.flush_page_init = hw->sysmem.flush_page_init;
 	rm->vidmem.size = hw->vidmem.size;
+	rm->ram_new = r535_fb_ram_new;
 
 	ret = nvkm_fb_new_(rm, device, type, inst, pfb);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index f1d1a709ada5..a3f3db4d312b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -787,6 +787,7 @@ static int
 r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 {
 	GspStaticConfigInfo *rpc;
+	int last_usable = -1;
 
 	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
 	if (IS_ERR(rpc))
@@ -805,6 +806,38 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
 	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
 
+	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
+	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
+
+	for (int i = 0; i < rpc->fbRegionInfoParams.numFBRegions; i++) {
+		NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO *reg =
+			&rpc->fbRegionInfoParams.fbRegion[i];
+
+		nvkm_debug(&gsp->subdev, "fb region %d: "
+			   "%016llx-%016llx rsvd:%016llx perf:%08x comp:%d iso:%d prot:%d\n", i,
+			   reg->base, reg->limit, reg->reserved, reg->performance,
+			   reg->supportCompressed, reg->supportISO, reg->bProtected);
+
+		if (!reg->reserved && !reg->bProtected) {
+			if (reg->supportCompressed && reg->supportISO &&
+			    !WARN_ON_ONCE(gsp->fb.region_nr >= ARRAY_SIZE(gsp->fb.region))) {
+					const u64 size = (reg->limit + 1) - reg->base;
+
+					gsp->fb.region[gsp->fb.region_nr].addr = reg->base;
+					gsp->fb.region[gsp->fb.region_nr].size = size;
+					gsp->fb.region_nr++;
+			}
+
+			last_usable = i;
+		}
+	}
+
+	if (last_usable >= 0) {
+		u32 rsvd_base = rpc->fbRegionInfoParams.fbRegion[last_usable].limit + 1;
+
+		gsp->fb.rsvd_size = gsp->fb.heap.addr - rsvd_base;
+	}
+
 	nvkm_gsp_rpc_done(gsp, rpc);
 	return 0;
 }
@@ -1106,6 +1139,18 @@ r535_gsp_msg_os_error_log(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
+static int
+r535_gsp_msg_mmu_fault_queued(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+
+	WARN_ON(repc != 0);
+
+	nvkm_error(subdev, "mmu fault queued\n");
+	return 0;
+}
+
 static int
 r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 {
@@ -1827,6 +1872,8 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
 			      r535_gsp_msg_run_cpu_sequencer, gsp);
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
+			      r535_gsp_msg_mmu_fault_queued, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);
 
 	ret = r535_gsp_rm_boot_ctor(gsp);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
index 06cbe19ce376..553d540f2736 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
@@ -4,3 +4,5 @@ nvkm-y += nvkm/subdev/instmem/nv04.o
 nvkm-y += nvkm/subdev/instmem/nv40.o
 nvkm-y += nvkm/subdev/instmem/nv50.o
 nvkm-y += nvkm/subdev/instmem/gk20a.o
+
+nvkm-y += nvkm/subdev/instmem/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 6649e30d7cd7..a7f3fc342d87 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -432,7 +432,7 @@ nv50_instmem_new(struct nvkm_device *device, enum nvkm_subdev_type type, int ins
 		 struct nvkm_instmem **pimem)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_instmem_new(&nv50_instmem, device, type, inst, pimem);
 
 	return nv50_instmem_new_(&nv50_instmem, device, type, inst, pimem);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index 95a83358aa7d..4c14c96fb60a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -28,6 +28,9 @@ void nvkm_instmem_boot(struct nvkm_instmem *);
 int nv04_instmem_suspend(struct nvkm_instmem *);
 void nv04_instmem_resume(struct nvkm_instmem *);
 
+int r535_instmem_new(const struct nvkm_instmem_func *,
+		     struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_instmem **);
+
 #include <core/memory.h>
 
 struct nvkm_instobj {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
new file mode 100644
index 000000000000..fc6e54e436d0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
@@ -0,0 +1,333 @@
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
+#include <nvhw/drf.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h>
+#include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+
+struct fbsr_item {
+	const char *type;
+	u64 addr;
+	u64 size;
+
+	struct list_head head;
+};
+
+struct fbsr {
+	struct list_head items;
+
+	u64 size;
+	int regions;
+
+	struct nvkm_gsp_client client;
+	struct nvkm_gsp_device device;
+
+	u64 hmemory;
+	u64 sys_offset;
+};
+
+static int
+fbsr_memlist(struct nvkm_gsp_device *device, u32 handle, enum nvkm_memory_target aper,
+	     u64 phys, u64 size, struct sg_table *sgt, struct nvkm_gsp_object *object)
+{
+	struct nvkm_gsp_client *client = device->object.client;
+	struct nvkm_gsp *gsp = client->gsp;
+	const u32 pages = size / GSP_PAGE_SIZE;
+	rpc_alloc_memory_v13_01 *rpc;
+	int ret;
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
+			       sizeof(*rpc) + pages * sizeof(rpc->pteDesc.pte_pde[0]));
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	rpc->hClient = client->object.handle;
+	rpc->hDevice = device->object.handle;
+	rpc->hMemory = handle;
+	if (aper == NVKM_MEM_TARGET_HOST) {
+		rpc->hClass = NV01_MEMORY_LIST_SYSTEM;
+		rpc->flags = NVDEF(NVOS02, FLAGS, PHYSICALITY, NONCONTIGUOUS) |
+			     NVDEF(NVOS02, FLAGS, LOCATION, PCI) |
+			     NVDEF(NVOS02, FLAGS, MAPPING, NO_MAP);
+	} else {
+		rpc->hClass = NV01_MEMORY_LIST_FBMEM;
+		rpc->flags = NVDEF(NVOS02, FLAGS, PHYSICALITY, CONTIGUOUS) |
+			     NVDEF(NVOS02, FLAGS, LOCATION, VIDMEM) |
+			     NVDEF(NVOS02, FLAGS, MAPPING, NO_MAP);
+		rpc->format = 6; /* NV_MMU_PTE_KIND_GENERIC_MEMORY */
+	}
+	rpc->pteAdjust = 0;
+	rpc->length = size;
+	rpc->pageCount = pages;
+	rpc->pteDesc.idr = 0;
+	rpc->pteDesc.reserved1 = 0;
+	rpc->pteDesc.length = pages;
+
+	if (sgt) {
+		struct scatterlist *sgl;
+		int pte = 0, idx;
+
+		for_each_sgtable_dma_sg(sgt, sgl, idx) {
+			for (int i = 0; i < sg_dma_len(sgl) / GSP_PAGE_SIZE; i++)
+				rpc->pteDesc.pte_pde[pte++].pte = (sg_dma_address(sgl) >> 12) + i;
+
+		}
+	} else {
+		for (int i = 0; i < pages; i++)
+			rpc->pteDesc.pte_pde[i].pte = (phys >> 12) + i;
+	}
+
+	ret = nvkm_gsp_rpc_wr(gsp, rpc, true);
+	if (ret)
+		return ret;
+
+	object->client = device->object.client;
+	object->parent = &device->object;
+	object->handle = handle;
+	return 0;
+}
+
+static int
+fbsr_send(struct fbsr *fbsr, struct fbsr_item *item)
+{
+	NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = fbsr->client.gsp;
+	struct nvkm_gsp_object memlist;
+	int ret;
+
+	ret = fbsr_memlist(&fbsr->device, fbsr->hmemory, NVKM_MEM_TARGET_VRAM,
+			   item->addr, item->size, NULL, &memlist);
+	if (ret)
+		return ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_FBSR_SEND_REGION_INFO,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl)) {
+		ret = PTR_ERR(ctrl);
+		goto done;
+	}
+
+	ctrl->fbsrType = FBSR_TYPE_DMA;
+	ctrl->hClient = fbsr->client.object.handle;
+	ctrl->hVidMem = fbsr->hmemory++;
+	ctrl->vidOffset = 0;
+	ctrl->sysOffset = fbsr->sys_offset;
+	ctrl->size = item->size;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+done:
+	nvkm_gsp_rm_free(&memlist);
+	if (ret)
+		return ret;
+
+	fbsr->sys_offset += item->size;
+	return 0;
+}
+
+static int
+fbsr_init(struct fbsr *fbsr, struct sg_table *sgt, u64 items_size)
+{
+	NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = fbsr->client.gsp;
+	struct nvkm_gsp_object memlist;
+	int ret;
+
+	ret = fbsr_memlist(&fbsr->device, fbsr->hmemory, NVKM_MEM_TARGET_HOST,
+			   0, fbsr->size, sgt, &memlist);
+	if (ret)
+		return ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_FBSR_INIT, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->fbsrType = FBSR_TYPE_DMA;
+	ctrl->numRegions = fbsr->regions;
+	ctrl->hClient = fbsr->client.object.handle;
+	ctrl->hSysMem = fbsr->hmemory++;
+	ctrl->gspFbAllocsSysOffset = items_size;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+	if (ret)
+		return ret;
+
+	nvkm_gsp_rm_free(&memlist);
+	return 0;
+}
+
+static bool
+fbsr_vram(struct fbsr *fbsr, const char *type, u64 addr, u64 size)
+{
+	struct fbsr_item *item;
+
+	if (!(item = kzalloc(sizeof(*item), GFP_KERNEL)))
+		return false;
+
+	item->type = type;
+	item->addr = addr;
+	item->size = size;
+	list_add_tail(&item->head, &fbsr->items);
+	return true;
+}
+
+static bool
+fbsr_inst(struct fbsr *fbsr, const char *type, struct nvkm_memory *memory)
+{
+	return fbsr_vram(fbsr, type, nvkm_memory_addr(memory), nvkm_memory_size(memory));
+}
+
+static void
+r535_instmem_resume(struct nvkm_instmem *imem)
+{
+	/* RM has restored VRAM contents already, so just need to free the sysmem buffer. */
+	if (imem->rm.fbsr_valid) {
+		nvkm_gsp_sg_free(imem->subdev.device, &imem->rm.fbsr);
+		imem->rm.fbsr_valid = false;
+	}
+}
+
+static int
+r535_instmem_suspend(struct nvkm_instmem *imem)
+{
+	struct nvkm_subdev *subdev = &imem->subdev;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_gsp *gsp = device->gsp;
+	struct nvkm_instobj *iobj;
+	struct fbsr fbsr = {};
+	struct fbsr_item *item, *temp;
+	u64 items_size;
+	int ret;
+
+	INIT_LIST_HEAD(&fbsr.items);
+	fbsr.hmemory = 0xcaf00003;
+
+	/* Create a list of all regions we need RM to save during suspend. */
+	list_for_each_entry(iobj, &imem->list, head) {
+		if (iobj->preserve) {
+			if (!fbsr_inst(&fbsr, "inst", &iobj->memory))
+				return -ENOMEM;
+		}
+	}
+
+	list_for_each_entry(iobj, &imem->boot, head) {
+		if (!fbsr_inst(&fbsr, "boot", &iobj->memory))
+			return -ENOMEM;
+	}
+
+	if (!fbsr_vram(&fbsr, "gsp-non-wpr", gsp->fb.heap.addr, gsp->fb.heap.size))
+		return -ENOMEM;
+
+	/* Determine memory requirements. */
+	list_for_each_entry(item, &fbsr.items, head) {
+		nvkm_debug(subdev, "fbsr: %016llx %016llx %s\n",
+			   item->addr, item->size, item->type);
+		fbsr.size += item->size;
+		fbsr.regions++;
+	}
+
+	items_size = fbsr.size;
+	nvkm_debug(subdev, "fbsr: %d regions (0x%llx bytes)\n", fbsr.regions, items_size);
+
+	fbsr.size += gsp->fb.rsvd_size;
+	fbsr.size += gsp->fb.bios.vga_workspace.size;
+	nvkm_debug(subdev, "fbsr: size: 0x%llx bytes\n", fbsr.size);
+
+	ret = nvkm_gsp_sg(gsp->subdev.device, fbsr.size, &imem->rm.fbsr);
+	if (ret)
+		goto done;
+
+	/* Tell RM about the sysmem which will hold VRAM contents across suspend. */
+	ret = nvkm_gsp_client_device_ctor(gsp, &fbsr.client, &fbsr.device);
+	if (ret)
+		goto done_sgt;
+
+	ret = fbsr_init(&fbsr, &imem->rm.fbsr, items_size);
+	if (WARN_ON(ret))
+		goto done_sgt;
+
+	/* Send VRAM regions that need saving. */
+	list_for_each_entry(item, &fbsr.items, head) {
+		ret = fbsr_send(&fbsr, item);
+		if (WARN_ON(ret))
+			goto done_sgt;
+	}
+
+	imem->rm.fbsr_valid = true;
+
+	/* Cleanup everything except the sysmem backup, which will be removed after resume. */
+done_sgt:
+	if (ret) /* ... unless we failed already. */
+		nvkm_gsp_sg_free(device, &imem->rm.fbsr);
+done:
+	list_for_each_entry_safe(item, temp, &fbsr.items, head) {
+		list_del(&item->head);
+		kfree(item);
+	}
+
+	nvkm_gsp_device_dtor(&fbsr.device);
+	nvkm_gsp_client_dtor(&fbsr.client);
+	return ret;
+}
+
+static void *
+r535_instmem_dtor(struct nvkm_instmem *imem)
+{
+	kfree(imem->func);
+	return imem;
+}
+
+int
+r535_instmem_new(const struct nvkm_instmem_func *hw,
+		 struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		 struct nvkm_instmem **pinstmem)
+{
+	struct nvkm_instmem_func *rm;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_instmem_dtor;
+	rm->fini = hw->fini;
+	rm->suspend = r535_instmem_suspend;
+	rm->resume  = r535_instmem_resume;
+	rm->memory_new = hw->memory_new;
+	rm->memory_wrap = hw->memory_wrap;
+	rm->zero = false;
+
+	ret = nv50_instmem_new_(rm, device, type, inst, pinstmem);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
index a602b0cb5b31..7ba35ea59c06 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
@@ -16,6 +16,8 @@ nvkm-y += nvkm/subdev/mmu/gp10b.o
 nvkm-y += nvkm/subdev/mmu/gv100.o
 nvkm-y += nvkm/subdev/mmu/tu102.o
 
+nvkm-y += nvkm/subdev/mmu/r535.o
+
 nvkm-y += nvkm/subdev/mmu/mem.o
 nvkm-y += nvkm/subdev/mmu/memnv04.o
 nvkm-y += nvkm/subdev/mmu/memnv50.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index ad3b44a9e0e7..b67ace7ae93c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -403,6 +403,10 @@ nvkm_mmu_dtor(struct nvkm_subdev *subdev)
 
 	nvkm_mmu_ptc_fini(mmu);
 	mutex_destroy(&mmu->mutex);
+
+	if (mmu->func->dtor)
+		mmu->func->dtor(mmu);
+
 	return mmu;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
index 5265bf4d8366..e9ca6537778c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/priv.h
@@ -4,12 +4,16 @@
 #define nvkm_mmu(p) container_of((p), struct nvkm_mmu, subdev)
 #include <subdev/mmu.h>
 
+int r535_mmu_new(const struct nvkm_mmu_func *hw, struct nvkm_device *, enum nvkm_subdev_type, int,
+		 struct nvkm_mmu **);
+
 void nvkm_mmu_ctor(const struct nvkm_mmu_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		   struct nvkm_mmu *);
 int nvkm_mmu_new_(const struct nvkm_mmu_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_mmu **);
 
 struct nvkm_mmu_func {
+	void (*dtor)(struct nvkm_mmu *);
 	void (*init)(struct nvkm_mmu *);
 
 	u8  dma_bits;
@@ -37,6 +41,8 @@ struct nvkm_mmu_func {
 
 	const u8 *(*kind)(struct nvkm_mmu *, int *count, u8 *invalid);
 	bool kind_sys;
+
+	int (*promote_vmm)(struct nvkm_vmm *);
 };
 
 extern const struct nvkm_mmu_func nv04_mmu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
new file mode 100644
index 000000000000..9cdea8842923
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
@@ -0,0 +1,123 @@
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
+#include "vmm.h"
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+
+static int
+r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
+{
+	NV_VASPACE_ALLOCATION_PARAMETERS *args;
+	int ret;
+
+	ret = nvkm_gsp_client_device_ctor(vmm->mmu->subdev.device->gsp,
+					  &vmm->rm.client, &vmm->rm.device);
+	if (ret)
+		return ret;
+
+	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, 0x90f10000, FERMI_VASPACE_A,
+				     sizeof(*args), &vmm->rm.object);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->index = NV_VASPACE_ALLOCATION_INDEX_GPU_NEW;
+
+	ret = nvkm_gsp_rm_alloc_wr(&vmm->rm.object, args);
+	if (ret)
+		return ret;
+
+	{
+		NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS *ctrl;
+
+		mutex_lock(&vmm->mutex.vmm);
+		ret = nvkm_vmm_get_locked(vmm, true, false, false, 0x1d, 32, 0x20000000,
+					  &vmm->rm.rsvd);
+		mutex_unlock(&vmm->mutex.vmm);
+		if (ret)
+			return ret;
+
+		ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.object,
+					    NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES,
+					    sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		ctrl->pageSize = 0x20000000;
+		ctrl->virtAddrLo = vmm->rm.rsvd->addr;
+		ctrl->virtAddrHi = vmm->rm.rsvd->addr + vmm->rm.rsvd->size - 1;
+		ctrl->numLevelsToCopy = vmm->pd->pde[0]->pde[0] ? 3 : 2;
+		ctrl->levels[0].physAddress = vmm->pd->pt[0]->addr;
+		ctrl->levels[0].size = 0x20;
+		ctrl->levels[0].aperture = 1;
+		ctrl->levels[0].pageShift = 0x2f;
+		ctrl->levels[1].physAddress = vmm->pd->pde[0]->pt[0]->addr;
+		ctrl->levels[1].size = 0x1000;
+		ctrl->levels[1].aperture = 1;
+		ctrl->levels[1].pageShift = 0x26;
+		if (vmm->pd->pde[0]->pde[0]) {
+			ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
+			ctrl->levels[2].size = 0x1000;
+			ctrl->levels[2].aperture = 1;
+			ctrl->levels[2].pageShift = 0x1d;
+		}
+
+		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.object, ctrl);
+	}
+
+	return ret;
+}
+
+static void
+r535_mmu_dtor(struct nvkm_mmu *mmu)
+{
+	kfree(mmu->func);
+}
+
+int
+r535_mmu_new(const struct nvkm_mmu_func *hw,
+	     struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	     struct nvkm_mmu **pmmu)
+{
+	struct nvkm_mmu_func *rm;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_mmu_dtor;
+	rm->dma_bits = hw->dma_bits;
+	rm->mmu = hw->mmu;
+	rm->mem = hw->mem;
+	rm->vmm = hw->vmm;
+	rm->kind = hw->kind;
+	rm->kind_sys = hw->kind_sys;
+	rm->promote_vmm = r535_mmu_promote_vmm;
+
+	ret = nvkm_mmu_new_(rm, device, type, inst, pmmu);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
index 87979952df4b..df662ce4a4b0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
@@ -56,7 +56,7 @@ tu102_mmu_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_mmu **pmmu)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_mmu_new(&tu102_mmu, device, type, inst, pmmu);
 
 	return nvkm_mmu_new_(&tu102_mmu, device, type, inst, pmmu);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 8e459d88ff8f..cf490ff2b9f1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -572,6 +572,12 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	}
 	uvmm->vmm->managed.raw = raw;
 
+	if (mmu->func->promote_vmm) {
+		ret = mmu->func->promote_vmm(uvmm->vmm);
+		if (ret)
+			return ret;
+	}
+
 	page = uvmm->vmm->func->page;
 	args->v0.page_nr = 0;
 	while (page && (page++)->shift)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index eb5fcadcb39a..9c97800fe037 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1030,6 +1030,13 @@ nvkm_vmm_dtor(struct nvkm_vmm *vmm)
 	struct nvkm_vma *vma;
 	struct rb_node *node;
 
+	if (vmm->rm.client.gsp) {
+		nvkm_gsp_rm_free(&vmm->rm.object);
+		nvkm_gsp_device_dtor(&vmm->rm.device);
+		nvkm_gsp_client_dtor(&vmm->rm.client);
+		nvkm_vmm_put(vmm, &vmm->rm.rsvd);
+	}
+
 	if (0)
 		nvkm_vmm_dump(vmm);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index 29c12e69540f..e34bc6076401 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -35,7 +35,10 @@ tu102_vmm_flush(struct nvkm_vmm *vmm, int depth)
 
 	mutex_lock(&vmm->mmu->mutex);
 
-	nvkm_wr32(device, 0xb830a0, vmm->pd->pt[0]->addr >> 8);
+	if (!vmm->rm.bar2_pdb)
+		nvkm_wr32(device, 0xb830a0, vmm->pd->pt[0]->addr >> 8);
+	else
+		nvkm_wr32(device, 0xb830a0, vmm->rm.bar2_pdb >> 8);
 	nvkm_wr32(device, 0xb830a4, 0x00000000);
 	nvkm_wr32(device, 0xb830b0, 0x80000000 | type);
 
-- 
2.41.0

