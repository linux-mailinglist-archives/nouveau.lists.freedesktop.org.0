Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD517A53FD
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC6710E32F;
	Mon, 18 Sep 2023 20:23:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10510E326
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:18 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690b7cb71aeso493273b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068597; x=1695673397; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x9Bf/Ijsp9sw3oVg1R9u2OZaFnVB/WGg3cpBJlZCHJA=;
 b=hYyptdZ7LQ+1I4rtFjYaiOlLqmkGcHTu+/LlUhsEIbBBDWbYyl+ArgyNrH/4qiuVcJ
 NBRO6WO+N/x7pix3H1KUV99afIaCLMQg2WnqzzpcRsQNUPwpojuYc3GnX0feTzq0jgfl
 IHeF7KOKVw0aC9lqqz80nXtRlcHbEPclQkUqqrnC1dOWpzoGLnGQCK7JQLqqSlpIlB0o
 o67IqBhECCnOMAjFoOYaI7WB7LzxWC4OJa5EUhF9A3ep+X2mBPptMQ0QBJHULY4yuT+s
 nhnt6y6EvPZK2SOzB8FVkNTrbLs/H+tS2owFWgjbLOERX5oI7J0AxTFOUZlUCsl3IAAG
 lBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068597; x=1695673397;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x9Bf/Ijsp9sw3oVg1R9u2OZaFnVB/WGg3cpBJlZCHJA=;
 b=rhdDUmsrRi+UaGJ65vODA6bx4XgCJJ9UY2+NJVLR/Hbet1ZIlh3ZPCkyNuK63/hdsX
 axGwJQ2Vyo2TrEdro1F8BNc23rKrslftwOZo+ckvQf/EfYaygHAjwNkciTSWGF85/VSg
 wZlO08SD40BRH8UzNvIKtpnuvqETow3IUESO+ssj5Z9Ihm+015tvsufF8yR5dFMuph5M
 kNbe3b8Gz721yo/Cgpnt7SM1dLhN1HBk4dYpr8I2vGD60ZFb4QXpGlxxctS+PkjKygGS
 MtDeCihU2JdvF8dJH4xuRtUlDUe01xWy+Abs027m7E2XBcR9nKIUBrs/4kS4V9fiLqSl
 RcaQ==
X-Gm-Message-State: AOJu0YzvyKJbnf+vjwgM7pWAZupJPA0l5dcFJTi2/7vNqA9SvvzgM9O3
 SYM8lw6Hxv8FHfTW5riMX13bCU81Eo0=
X-Google-Smtp-Source: AGHT+IGS+eTtbbO5VDM0cb3oBcKmFht2Od5Cak51IclnDQRxFbJyOUogs23iwGE2wNHjAU7wvf3mSg==
X-Received: by 2002:a05:6a00:1823:b0:68f:d44c:22f8 with SMTP id
 y35-20020a056a00182300b0068fd44c22f8mr834992pfa.1.1695068596836; 
 Mon, 18 Sep 2023 13:23:16 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:16 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:38 +1000
Message-ID: <20230918202149.4343-34-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 33/44] drm/nouveau/gsp/r535: add support for rm
 control
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

Adds the plumbing to start making RM control calls, and initialises
objects to represent internal RM objects provided to us during init.

These will be used by subsequent patches.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  62 +++++++++++
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h    |  48 +++++++++
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h |  31 ++++++
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h   |  40 +++++++
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h |  51 +++++++++
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    |  25 +++++
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h |  41 +++++++
 .../535.54.03/nvidia/generated/g_gpu_nvoc.h   |  35 ++++++
 .../nvidia/generated/g_rpc-structures.h       |  11 ++
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h   |  86 +++++++++++++++
 .../inc/kernel/gpu/gsp/gsp_static_config.h    | 100 +++++++++++++++++
 .../nvidia/inc/kernel/gpu/nvbitmask.h         |  33 ++++++
 .../nvidia/kernel/inc/vgpu/rpc_headers.h      |  44 ++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 101 ++++++++++++++++++
 14 files changed, 708 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 41fd11822b30..8f0805474981 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -132,10 +132,32 @@ struct nvkm_gsp {
 
 	bool running;
 
+	/* Internal GSP-RM control handles. */
+	struct {
+		struct nvkm_gsp_client {
+			struct nvkm_gsp_object {
+				struct nvkm_gsp_client *client;
+				struct nvkm_gsp_object *parent;
+				u32 handle;
+			} object;
+
+			struct nvkm_gsp *gsp;
+		} client;
+
+		struct nvkm_gsp_device {
+			struct nvkm_gsp_object object;
+			struct nvkm_gsp_object subdevice;
+		} device;
+	} internal;
+
 	const struct nvkm_gsp_rm {
 		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
 		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
 		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
+
+		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
+		void *(*rm_ctrl_push)(struct nvkm_gsp_object *, void *argv, u32 repc);
+		void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
 	} *rm;
 };
 
@@ -185,6 +207,46 @@ nvkm_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 	gsp->rm->rpc_done(gsp, repv);
 }
 
+static inline void *
+nvkm_gsp_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 argc)
+{
+	return object->client->gsp->rm->rm_ctrl_get(object, cmd, argc);
+}
+
+static inline void *
+nvkm_gsp_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
+{
+	return object->client->gsp->rm->rm_ctrl_push(object, argv, repc);
+}
+
+static inline void *
+nvkm_gsp_rm_ctrl_rd(struct nvkm_gsp_object *object, u32 cmd, u32 repc)
+{
+	void *argv = nvkm_gsp_rm_ctrl_get(object, cmd, repc);
+
+	if (IS_ERR(argv))
+		return argv;
+
+	return nvkm_gsp_rm_ctrl_push(object, argv, repc);
+}
+
+static inline int
+nvkm_gsp_rm_ctrl_wr(struct nvkm_gsp_object *object, void *argv)
+{
+	void *repv = nvkm_gsp_rm_ctrl_push(object, argv, 0);
+
+	if (IS_ERR(repv))
+		return PTR_ERR(repv);
+
+	return 0;
+}
+
+static inline void
+nvkm_gsp_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
+{
+	object->client->gsp->rm->rm_ctrl_done(object, repv);
+}
+
 int gv100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
new file mode 100644
index 000000000000..60ba4967dcd9
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
@@ -0,0 +1,48 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gpu_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+typedef struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
+    NvU32  totalVFs;
+    NvU32  firstVfOffset;
+    NvU32  vfFeatureMask;
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar0Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar1Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar2Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar0Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar1Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar2Size, 8);
+    NvBool b64bitBar0;
+    NvBool b64bitBar1;
+    NvBool b64bitBar2;
+    NvBool bSriovEnabled;
+    NvBool bSriovHeavyEnabled;
+    NvBool bEmulateVFBar0TlbInvalidationRegister;
+    NvBool bClientRmAllocatedCtxBuffer;
+} NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
new file mode 100644
index 000000000000..c08e2fcb4979
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
@@ -0,0 +1,31 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0080_ctrl0080gr_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2004-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV0080_CTRL_GR_CAPS_TBL_SIZE            23
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
new file mode 100644
index 000000000000..9c61a6f74aa4
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
@@ -0,0 +1,40 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080bios_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+typedef struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
+    NvU32 BoardID;
+    char  chipSKU[4];
+    char  chipSKUMod[2];
+    char  project[5];
+    char  projectSKU[5];
+    char  CDP[6];
+    char  projectSKUMod[2];
+    NvU32 businessCycle;
+} NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
new file mode 100644
index 000000000000..20a50a22e748
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
@@ -0,0 +1,51 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080fb_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES   17U
+
+typedef NvBool NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES];
+
+typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    NV_DECLARE_ALIGNED(NvU64 base, 8);
+    NV_DECLARE_ALIGNED(NvU64 limit, 8);
+    NV_DECLARE_ALIGNED(NvU64 reserved, 8);
+    NvU32                                                  performance;
+    NvBool                                                 supportCompressed;
+    NvBool                                                 supportISO;
+    NvBool                                                 bProtected;
+    NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG blackList;
+} NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO;
+
+#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES 16U
+
+typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    NvU32 numFBRegions;
+    NV_DECLARE_ALIGNED(NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO fbRegion[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES], 8);
+} NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
index a9a287469305..49a1390743c4 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
@@ -26,8 +26,33 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#define NV2080_GPU_MAX_NAME_STRING_LENGTH                  (0x0000040U)
+
 #define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0            (0x00000000U)
 
 #define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
 
+typedef struct NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS {
+    NvU32 gpcMask;
+} NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS {
+    NvU32 gpcId;
+    NvU32 tpcMask;
+} NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS {
+    NvU32 gpcId;
+    NvU32 zcullMask;
+} NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS;
+
+#define NV2080_GPU_MAX_GID_LENGTH             (0x000000100ULL)
+
+typedef struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    NvU32 index;
+    NvU32 flags;
+    NvU32 length;
+    NvU8  data[NV2080_GPU_MAX_GID_LENGTH];
+} NV2080_CTRL_GPU_GET_GID_INFO_PARAMS;
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
new file mode 100644
index 000000000000..6f99038d6e16
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
@@ -0,0 +1,41 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gr_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN = 0,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL = 1,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_PAGEPOOL = 2,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_BETACB = 3,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_RTV = 4,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL = 5,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL = 6,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL_CONTROL_CPU = 7,
+    NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_END = 8,
+} NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h
new file mode 100644
index 000000000000..7194a8f02909
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h
@@ -0,0 +1,35 @@
+#ifndef __src_nvidia_generated_g_gpu_nvoc_h__
+#define __src_nvidia_generated_g_gpu_nvoc_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2004-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+typedef enum
+{
+    COMPUTE_BRANDING_TYPE_NONE,
+    COMPUTE_BRANDING_TYPE_TESLA,
+} COMPUTE_BRANDING_TYPE;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
index ac59ffa4330b..1ae0a97df392 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
@@ -33,6 +33,17 @@ typedef struct rpc_unloading_guest_driver_v1F_07
     NvU32      newLevel;
 } rpc_unloading_guest_driver_v1F_07;
 
+typedef struct rpc_gsp_rm_control_v03_00
+{
+    NvHandle   hClient;
+    NvHandle   hObject;
+    NvU32      cmd;
+    NvU32      status;
+    NvU32      paramsSize;
+    NvU32      flags;
+    NvU8       params[];
+} rpc_gsp_rm_control_v03_00;
+
 typedef struct rpc_run_cpu_sequencer_v17_00
 {
     NvU32      bufferSizeDWord;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h
new file mode 100644
index 000000000000..90cd9f6c4d9a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h
@@ -0,0 +1,86 @@
+#ifndef __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
+#define __src_nvidia_inc_kernel_gpu_gpu_engine_type_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+typedef enum
+{
+    RM_ENGINE_TYPE_NULL                 =       (0x00000000),
+    RM_ENGINE_TYPE_GR0                  =       (0x00000001),
+    RM_ENGINE_TYPE_GR1                  =       (0x00000002),
+    RM_ENGINE_TYPE_GR2                  =       (0x00000003),
+    RM_ENGINE_TYPE_GR3                  =       (0x00000004),
+    RM_ENGINE_TYPE_GR4                  =       (0x00000005),
+    RM_ENGINE_TYPE_GR5                  =       (0x00000006),
+    RM_ENGINE_TYPE_GR6                  =       (0x00000007),
+    RM_ENGINE_TYPE_GR7                  =       (0x00000008),
+    RM_ENGINE_TYPE_COPY0                =       (0x00000009),
+    RM_ENGINE_TYPE_COPY1                =       (0x0000000a),
+    RM_ENGINE_TYPE_COPY2                =       (0x0000000b),
+    RM_ENGINE_TYPE_COPY3                =       (0x0000000c),
+    RM_ENGINE_TYPE_COPY4                =       (0x0000000d),
+    RM_ENGINE_TYPE_COPY5                =       (0x0000000e),
+    RM_ENGINE_TYPE_COPY6                =       (0x0000000f),
+    RM_ENGINE_TYPE_COPY7                =       (0x00000010),
+    RM_ENGINE_TYPE_COPY8                =       (0x00000011),
+    RM_ENGINE_TYPE_COPY9                =       (0x00000012),
+    RM_ENGINE_TYPE_NVDEC0               =       (0x0000001d),
+    RM_ENGINE_TYPE_NVDEC1               =       (0x0000001e),
+    RM_ENGINE_TYPE_NVDEC2               =       (0x0000001f),
+    RM_ENGINE_TYPE_NVDEC3               =       (0x00000020),
+    RM_ENGINE_TYPE_NVDEC4               =       (0x00000021),
+    RM_ENGINE_TYPE_NVDEC5               =       (0x00000022),
+    RM_ENGINE_TYPE_NVDEC6               =       (0x00000023),
+    RM_ENGINE_TYPE_NVDEC7               =       (0x00000024),
+    RM_ENGINE_TYPE_NVENC0               =       (0x00000025),
+    RM_ENGINE_TYPE_NVENC1               =       (0x00000026),
+    RM_ENGINE_TYPE_NVENC2               =       (0x00000027),
+    RM_ENGINE_TYPE_VP                   =       (0x00000028),
+    RM_ENGINE_TYPE_ME                   =       (0x00000029),
+    RM_ENGINE_TYPE_PPP                  =       (0x0000002a),
+    RM_ENGINE_TYPE_MPEG                 =       (0x0000002b),
+    RM_ENGINE_TYPE_SW                   =       (0x0000002c),
+    RM_ENGINE_TYPE_TSEC                 =       (0x0000002d),
+    RM_ENGINE_TYPE_VIC                  =       (0x0000002e),
+    RM_ENGINE_TYPE_MP                   =       (0x0000002f),
+    RM_ENGINE_TYPE_SEC2                 =       (0x00000030),
+    RM_ENGINE_TYPE_HOST                 =       (0x00000031),
+    RM_ENGINE_TYPE_DPU                  =       (0x00000032),
+    RM_ENGINE_TYPE_PMU                  =       (0x00000033),
+    RM_ENGINE_TYPE_FBFLCN               =       (0x00000034),
+    RM_ENGINE_TYPE_NVJPEG0              =       (0x00000035),
+    RM_ENGINE_TYPE_NVJPEG1              =       (0x00000036),
+    RM_ENGINE_TYPE_NVJPEG2              =       (0x00000037),
+    RM_ENGINE_TYPE_NVJPEG3              =       (0x00000038),
+    RM_ENGINE_TYPE_NVJPEG4              =       (0x00000039),
+    RM_ENGINE_TYPE_NVJPEG5              =       (0x0000003a),
+    RM_ENGINE_TYPE_NVJPEG6              =       (0x0000003b),
+    RM_ENGINE_TYPE_NVJPEG7              =       (0x0000003c),
+    RM_ENGINE_TYPE_OFA                  =       (0x0000003d),
+    RM_ENGINE_TYPE_LAST                 =       (0x0000003e),
+} RM_ENGINE_TYPE;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
index ba8cd897ebcc..3f99cab47a13 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
@@ -1,7 +1,16 @@
 #ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
 #define __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
 #include <nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h>
+#include <nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h>
 #include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h>
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h>
 
 /* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
 
@@ -40,6 +49,97 @@ typedef struct GSP_VF_INFO
     NvBool b64bitBar2;
 } GSP_VF_INFO;
 
+typedef struct GspSMInfo_t
+{
+    NvU32 version;
+    NvU32 regBankCount;
+    NvU32 regBankRegCount;
+    NvU32 maxWarpsPerSM;
+    NvU32 maxThreadsPerWarp;
+    NvU32 geomGsObufEntries;
+    NvU32 geomXbufEntries;
+    NvU32 maxSPPerSM;
+    NvU32 rtCoreCount;
+} GspSMInfo;
+
+typedef struct GspStaticConfigInfo_t
+{
+    NvU8 grCapsBits[NV0080_CTRL_GR_CAPS_TBL_SIZE];
+    NV2080_CTRL_GPU_GET_GID_INFO_PARAMS gidInfo;
+    NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS gpcInfo;
+    NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS tpcInfo[MAX_GPC_COUNT];
+    NV2080_CTRL_GPU_GET_FERMI_ZCULL_INFO_PARAMS zcullInfo[MAX_GPC_COUNT];
+    NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS SKUInfo;
+    NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS fbRegionInfoParams;
+    COMPUTE_BRANDING_TYPE computeBranding;
+
+    NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS sriovCaps;
+    NvU32 sriovMaxGfid;
+
+    NvU32 engineCaps[NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX];
+
+    GspSMInfo SM_info;
+
+    NvBool poisonFuseEnabled;
+
+    NvU64 fb_length;
+    NvU32 fbio_mask;
+    NvU32 fb_bus_width;
+    NvU32 fb_ram_type;
+    NvU32 fbp_mask;
+    NvU32 l2_cache_size;
+
+    NvU32 gfxpBufferSize[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL];
+    NvU32 gfxpBufferAlignment[NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_CONTEXT_POOL];
+
+    NvU8 gpuNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvU8 gpuShortNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvU16 gpuNameString_Unicode[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvBool bGpuInternalSku;
+    NvBool bIsQuadroGeneric;
+    NvBool bIsQuadroAd;
+    NvBool bIsNvidiaNvs;
+    NvBool bIsVgx;
+    NvBool bGeforceSmb;
+    NvBool bIsTitan;
+    NvBool bIsTesla;
+    NvBool bIsMobile;
+    NvBool bIsGc6Rtd3Allowed;
+    NvBool bIsGcOffRtd3Allowed;
+    NvBool bIsGcoffLegacyAllowed;
+
+    NvU64 bar1PdeBase;
+    NvU64 bar2PdeBase;
+
+    NvBool bVbiosValid;
+    NvU32 vbiosSubVendor;
+    NvU32 vbiosSubDevice;
+
+    NvBool bPageRetirementSupported;
+
+    NvBool bSplitVasBetweenServerClientRm;
+
+    NvBool bClRootportNeedsNosnoopWAR;
+
+    VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS displaylessMaxHeads;
+    VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS displaylessMaxResolution;
+    NvU64 displaylessMaxPixels;
+
+    // Client handle for internal RMAPI control.
+    NvHandle hInternalClient;
+
+    // Device handle for internal RMAPI control.
+    NvHandle hInternalDevice;
+
+    // Subdevice handle for internal RMAPI control.
+    NvHandle hInternalSubdevice;
+
+    NvBool bSelfHostedMode;
+    NvBool bAtsSupported;
+
+    NvBool bIsGpuUefi;
+} GspStaticConfigInfo;
+
 typedef struct GspSystemInfo
 {
     NvU64 gpuPhysAddr;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h
new file mode 100644
index 000000000000..16168294e524
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h
@@ -0,0 +1,33 @@
+#ifndef __src_nvidia_inc_kernel_gpu_nvbitmask_h__
+#define __src_nvidia_inc_kernel_gpu_nvbitmask_h__
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2021-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NVGPU_ENGINE_CAPS_MASK_BITS                32
+#define NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX           ((RM_ENGINE_TYPE_LAST-1)/NVGPU_ENGINE_CAPS_MASK_BITS + 1)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h
new file mode 100644
index 000000000000..b48b26049b9d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h
@@ -0,0 +1,44 @@
+#ifndef __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
+#define __src_nvidia_kernel_inc_vgpu_rpc_headers_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2017-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define MAX_GPC_COUNT           32
+
+typedef struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS 
+{
+    NvU32 headIndex;
+    NvU32 maxHResolution;
+    NvU32 maxVResolution;
+} VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS;
+
+typedef struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS 
+{
+    NvU32 numHeads;
+    NvU32 maxNumHeads;
+} VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 4aaceb65217d..0fafb8f1e88d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -354,6 +354,61 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	return repv;
 }
 
+static void
+r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
+{
+	rpc_gsp_rm_control_v03_00 *rpc = container_of(repv, typeof(*rpc), params);
+
+	nvkm_gsp_rpc_done(object->client->gsp, rpc);
+}
+
+static void *
+r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
+{
+	rpc_gsp_rm_control_v03_00 *rpc = container_of(argv, typeof(*rpc), params);
+	struct nvkm_gsp *gsp = object->client->gsp;
+	void *ret;
+
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
+
+	if (rpc->status) {
+		nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
+			   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
+		ret = ERR_PTR(-EINVAL);
+	} else {
+		ret = repc ? rpc->params : NULL;
+	}
+
+	if (IS_ERR_OR_NULL(ret))
+		nvkm_gsp_rpc_done(gsp, rpc);
+
+	return ret;
+}
+
+static void *
+r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 argc)
+{
+	struct nvkm_gsp_client *client = object->client;
+	struct nvkm_gsp *gsp = client->gsp;
+	rpc_gsp_rm_control_v03_00 *rpc;
+
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x argc:%d\n",
+		   client->object.handle, object->handle, cmd, argc);
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL, sizeof(*rpc) + argc);
+	if (IS_ERR(rpc))
+		return rpc;
+
+	rpc->hClient    = client->object.handle;
+	rpc->hObject    = object->handle;
+	rpc->cmd	= cmd;
+	rpc->status     = 0;
+	rpc->paramsSize = argc;
+	return rpc->params;
+}
+
 static void
 r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 {
@@ -450,8 +505,50 @@ r535_gsp_rm = {
 	.rpc_get = r535_gsp_rpc_get,
 	.rpc_push = r535_gsp_rpc_push,
 	.rpc_done = r535_gsp_rpc_done,
+
+	.rm_ctrl_get = r535_gsp_rpc_rm_ctrl_get,
+	.rm_ctrl_push = r535_gsp_rpc_rm_ctrl_push,
+	.rm_ctrl_done = r535_gsp_rpc_rm_ctrl_done,
 };
 
+static int
+r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
+{
+	GspStaticConfigInfo *rpc;
+
+	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	gsp->internal.client.object.client = &gsp->internal.client;
+	gsp->internal.client.object.parent = NULL;
+	gsp->internal.client.object.handle = rpc->hInternalClient;
+	gsp->internal.client.gsp = gsp;
+
+	gsp->internal.device.object.client = &gsp->internal.client;
+	gsp->internal.device.object.parent = &gsp->internal.client.object;
+	gsp->internal.device.object.handle = rpc->hInternalDevice;
+
+	gsp->internal.device.subdevice.client = &gsp->internal.client;
+	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
+	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
+
+	nvkm_gsp_rpc_done(gsp, rpc);
+	return 0;
+}
+
+static int
+r535_gsp_postinit(struct nvkm_gsp *gsp)
+{
+	int ret;
+
+	ret = r535_gsp_rpc_get_gsp_static_info(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	return ret;
+}
+
 static int
 r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 {
@@ -1302,8 +1399,12 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
+		return ret;
 	}
 
+	if (ret == 0)
+		ret = r535_gsp_postinit(gsp);
+
 	return ret;
 }
 
-- 
2.41.0

