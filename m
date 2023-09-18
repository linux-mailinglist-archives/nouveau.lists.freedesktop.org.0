Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5567A5405
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ED410E332;
	Mon, 18 Sep 2023 20:23:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE2010E330
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:39 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5774b3de210so3628791a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068618; x=1695673418; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IpRB4U8d++cT27ihSlMu4R6JOJ05u26kdtVOfYc+mSQ=;
 b=PA8EKmkmI61ikPxMnyLbjpScfmN0hEjPvA7XWIhaa1Xi11Ex/u4fks8PkopV+Fla2M
 KuZjkJc7cE6hh8+49/p9OLa/KQVLCA6OIg3SUNBfTm4CgUl9zur4ijjXaNVJoiK9XMHz
 tBRhhiiw9rJC786xZRCC448WaqKc/bPz0D8y0yPt/nAeqS+t6Lw9rxSrUWSY7lVsFh8R
 ZYm58/Cy2EWGQVE3SjtP5oj1Z064YPtwM6LO5A0CDXePGAAtKhg4fRQhedQlL/Q1QG5U
 D8Fkr7SxjzPOQ/YApDCD3LUQn4iXTNFFpJMptltMf0/qHNMG00uaOMsYHm79FWtP5mGF
 QasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068618; x=1695673418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IpRB4U8d++cT27ihSlMu4R6JOJ05u26kdtVOfYc+mSQ=;
 b=vMVrgtdOF2YoVCPCVK607O02hfNof1/zzxRvKUuEqkszM2gO7m6mhRzqvtMUpnUdmw
 HYh+HsWnKvnLtOLgrpSiPB7tO9q+EnC4wBPWJOZy3GUyAAxUoAPVBDyHnHuZYR6oE1Ny
 7iNjm9ixddlPv0qPwH/ckNh2RfsxxgsJbWKm5v1gpPBUk1apgt8cRbisg3luwBIuWF16
 +UBl9+Zi2xOiuarleDE+at7eDlP50lGsNHc9JA7XCWwyNO9liKgMmN16j20ZxgilwRzg
 Lx0irEV4e2MbTHvqgskew1ePgCdLA9eK1izq1tYjqN7ULK/gug0eTsfavynAtGSo4cZL
 /MFQ==
X-Gm-Message-State: AOJu0Yzur7x6YsstvCgzqrRVuVvPeVEdU+SUWoJJMYUMzztxE22ElXRl
 4ShKpzd9FJgPh5F3h2xcjlIVfBzOr6Y=
X-Google-Smtp-Source: AGHT+IG7jsCq9f+oS/SXrOBukmlff0ATfFgRLsC5RTfBs9sbqVvzo1kc/V/0R9PwYdGaH+IzIL7rOA==
X-Received: by 2002:a05:6a20:e10b:b0:155:1221:a3d5 with SMTP id
 kr11-20020a056a20e10b00b001551221a3d5mr11433088pzb.5.1695068618229; 
 Mon, 18 Sep 2023 13:23:38 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:37 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:47 +1000
Message-ID: <20230918202149.4343-43-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 42/44] drm/nouveau/nvenc/r535: initial support
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

Adds support for allocating VIDEO_ENCODER classes from RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   4 +
 .../drm/nouveau/include/nvkm/engine/nvenc.h   |   2 +
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |   7 ++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   4 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  10 ++
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild  |   4 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/nvenc/priv.h  |   3 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/r535.c  | 110 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c |  12 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |   4 +
 13 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 17a8867648b9..86648c5d0dba 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -231,6 +231,10 @@
 #define AMPERE_DMA_COPY_A                                            0x0000c6b5
 #define AMPERE_DMA_COPY_B                                            0x0000c7b5
 
+#define NVC4B7_VIDEO_ENCODER                                         0x0000c4b7
+#define NVC7B7_VIDEO_ENCODER                                         0x0000c7b7
+#define NVC9B7_VIDEO_ENCODER                                         0x0000c9b7
+
 #define FERMI_DECOMPRESS                                             0x000090b8
 
 #define NV50_COMPUTE                                                 0x000050c0
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
index 1f6eef13f872..018c58fc32ba 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
@@ -13,4 +13,6 @@ struct nvkm_nvenc {
 
 int gm107_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
 int tu102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
+int ga102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
+int ad102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
index 5c1cad9bc5db..61b98109a1c8 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
@@ -112,6 +112,13 @@ typedef struct
     NvU32 engineInstance;               // Select NVDEC0 or NVDEC1 or NVDEC2
 } NV_BSP_ALLOCATION_PARAMETERS;
 
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of MSENC?
+    NvU32 engineInstance;             // Select MSENC/NVENC0 or NVENC1 or NVENC2
+} NV_MSENC_ALLOCATION_PARAMETERS;
+
 typedef struct
 {
     NvU32   index;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
index b5cc77ab05a3..5ed292000036 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -32,6 +32,10 @@
 
 #define MC_ENGINE_IDX_CE9                           24
 
+#define MC_ENGINE_IDX_MSENC                         38
+
+#define MC_ENGINE_IDX_MSENC2                        40
+
 #define MC_ENGINE_IDX_GSP                           49
 
 #define MC_ENGINE_IDX_BSP                           64
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index cc54cb3365d0..af072ebcc8fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2622,6 +2622,7 @@ nv172_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
+	.nvenc    = { 0x00000001, ga102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2652,6 +2653,7 @@ nv173_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
+	.nvenc    = { 0x00000001, ga102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2682,6 +2684,7 @@ nv174_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
+	.nvenc    = { 0x00000001, ga102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2712,6 +2715,7 @@ nv176_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
+	.nvenc    = { 0x00000001, ga102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2742,6 +2746,7 @@ nv177_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
 	.nvdec    = { 0x00000003, ga102_nvdec_new },
+	.nvenc    = { 0x00000001, ga102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2765,6 +2770,7 @@ nv192_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
+	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2788,6 +2794,7 @@ nv193_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
+	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2811,6 +2818,7 @@ nv194_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
+	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2834,6 +2842,7 @@ nv196_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
+	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2857,6 +2866,7 @@ nv197_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
 	.nvdec    = { 0x0000000f, ad102_nvdec_new },
+	.nvenc    = { 0x00000007, ad102_nvenc_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index 553658a20025..7257120386e8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -596,6 +596,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			engn = nvkm_runl_add(runl, nv2080, &r535_gr, type, inst);
 			break;
 		case NVKM_ENGINE_NVDEC:
+		case NVKM_ENGINE_NVENC:
 			engn = nvkm_runl_add(runl, nv2080, &r535_flcn, type, inst);
 			break;
 		case NVKM_ENGINE_SW:
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
index 6dcb20d1d156..2c1495b730f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
@@ -2,3 +2,7 @@
 nvkm-y += nvkm/engine/nvenc/base.o
 nvkm-y += nvkm/engine/nvenc/gm107.o
 nvkm-y += nvkm/engine/nvenc/tu102.o
+nvkm-y += nvkm/engine/nvenc/ga102.o
+nvkm-y += nvkm/engine/nvenc/ad102.o
+
+nvkm-y += nvkm/engine/nvenc/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
new file mode 100644
index 000000000000..1b4619ff9e8e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
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
+ad102_nvenc = {
+	.sclass = {
+		{ -1, -1, NVC9B7_VIDEO_ENCODER },
+		{}
+	}
+};
+
+int
+ad102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_nvenc **pnvenc)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_nvenc_new(&ad102_nvenc, device, type, inst, pnvenc);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
new file mode 100644
index 000000000000..6463ab8e5871
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
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
+ga102_nvenc = {
+	.sclass = {
+		{ -1, -1, NVC7B7_VIDEO_ENCODER },
+		{}
+	}
+};
+
+int
+ga102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_nvenc **pnvenc)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_nvenc_new(&ga102_nvenc, device, type, inst, pnvenc);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
index b097e3f2867b..7917affc6505 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
@@ -18,4 +18,7 @@ extern const struct nvkm_nvenc_fwif gm107_nvenc_fwif[];
 
 int nvkm_nvenc_new_(const struct nvkm_nvenc_fwif *, struct nvkm_device *, enum nvkm_subdev_type,
 		    int, struct nvkm_nvenc **pnvenc);
+
+int r535_nvenc_new(const struct nvkm_engine_func *, struct nvkm_device *,
+		   enum nvkm_subdev_type, int, struct nvkm_nvenc **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
new file mode 100644
index 000000000000..8449b41c72db
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
@@ -0,0 +1,110 @@
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
+struct r535_nvenc_obj {
+	struct nvkm_object object;
+	struct nvkm_gsp_object rm;
+};
+
+static void *
+r535_nvenc_obj_dtor(struct nvkm_object *object)
+{
+	struct r535_nvenc_obj *obj = container_of(object, typeof(*obj), object);
+
+	nvkm_gsp_rm_free(&obj->rm);
+	return obj;
+}
+
+static const struct nvkm_object_func
+r535_nvenc_obj = {
+	.dtor = r535_nvenc_obj_dtor,
+};
+
+static int
+r535_nvenc_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+		 struct nvkm_object **pobject)
+{
+	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
+	struct r535_nvenc_obj *obj;
+	NV_MSENC_ALLOCATION_PARAMETERS *args;
+
+	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_object_ctor(&r535_nvenc_obj, oclass, &obj->object);
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
+r535_nvenc_dtor(struct nvkm_engine *engine)
+{
+	struct nvkm_nvenc *nvenc = nvkm_nvenc(engine);
+
+	kfree(nvenc->engine.func);
+	return nvenc;
+}
+
+int
+r535_nvenc_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
+	       enum nvkm_subdev_type type, int inst, struct nvkm_nvenc **pnvenc)
+{
+	struct nvkm_engine_func *rm;
+	int nclass;
+
+	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
+
+	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_nvenc_dtor;
+	for (int i = 0; i < nclass; i++) {
+		rm->sclass[i].minver = hw->sclass[i].minver;
+		rm->sclass[i].maxver = hw->sclass[i].maxver;
+		rm->sclass[i].oclass = hw->sclass[i].oclass;
+		rm->sclass[i].ctor = r535_nvenc_obj_ctor;
+	}
+
+	if (!(*pnvenc = kzalloc(sizeof(**pnvenc), GFP_KERNEL))) {
+		kfree(rm);
+		return -ENOMEM;
+	}
+
+	return nvkm_engine_ctor(rm, device, type, inst, true, &(*pnvenc)->engine);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
index 8a436b398749..933864423bb3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
@@ -23,12 +23,22 @@
 
 #include <subdev/gsp.h>
 
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+tu102_nvenc = {
+	.sclass = {
+		{ -1, -1, NVC4B7_VIDEO_ENCODER },
+		{}
+	}
+};
+
 int
 tu102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_nvenc **pnvenc)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_nvenc_new(&tu102_nvenc, device, type, inst, pnvenc);
 
 	return nvkm_nvenc_new_(gm107_nvenc_fwif, device, type, inst, pnvenc);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index eb82dad1f74e..8a1f7ef913e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -863,6 +863,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			type = NVKM_ENGINE_NVDEC;
 			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVDEC0;
 			break;
+		case MC_ENGINE_IDX_MSENC ... MC_ENGINE_IDX_MSENC2:
+			type = NVKM_ENGINE_NVENC;
+			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_MSENC;
+			break;
 		default:
 			continue;
 		}
-- 
2.41.0

