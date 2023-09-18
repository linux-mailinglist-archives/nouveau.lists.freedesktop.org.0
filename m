Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616937A53F8
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D387710E32C;
	Mon, 18 Sep 2023 20:23:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA80E10E328
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:03 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68fb6fd2836so4573869b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068583; x=1695673383; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvKNxRbbIik2FiyaPP7+Kdla4cI3E3lF8WOk4CPdIxU=;
 b=Hm1hgz7bQUQfeWl+WzN4aYWxyCKp9YOGv4/PozxyfYn2WR3VvjI0S47F9IlSGJW+bd
 uprvEMfi6aziTpVNXW9GEhTJKe7UXPadtKuhN+RVLdU2GrAVB1m4YELKKCuUDycvmjPv
 4Wm3GTTzX9ksOG4QQi1OLP1rQ2DEaG3snsUVwKkx5Djq8pYAvcQftCmC08NYJcTBdh8l
 ogT10i5MeT6Ee/KDW4z/EzBjECx93uor/jaybuBLQ15krH2VFu5JLfWluxrFSDE1TaLO
 qSUvnswHvTxYYQZDq/5sPc5O+Ioec4TXHzAVeE0+nHk/NJEWkbsw8udSLmo2jq6uSsXa
 AzBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068583; x=1695673383;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvKNxRbbIik2FiyaPP7+Kdla4cI3E3lF8WOk4CPdIxU=;
 b=wJ/Xxv/dnRDlyGtgNQY/cfnMjLHtisigumiTUYM7RClVOfKXQnvv+cIrSLeb5254SJ
 jkzBFLhBNIycQe9jMbvwSJLE6Z4OQIvxWeDgHL/ZaWvEoidrQk2qrvWDUXh1SjHFvWFD
 0QoRP9A9F0iMM1ntzMlJfLiymsPUNmLPu9HI955UvzUFhSro+SFbHEoMGAtFgHS3WEWw
 7mypdvv29UhB5tMTiKshcXwvT+dKKg+ePVbraIjEjt6ruYjTqAfD1gHZyNSM6eB7TXzO
 3IQv/S5vzISJjS0mezsscfneTt4tpZFMNxFB09Gj56PKNuBvQa3sYEDxlXcY+83cxaz3
 IfAA==
X-Gm-Message-State: AOJu0YxFTLxXzM8JBTzwTVSLXWXcRApUE5SSkmUZTOCC4Lb9+Cao/Q2b
 P0se7IqB2GBFqiuNNLJr93TZw7dhyLk=
X-Google-Smtp-Source: AGHT+IEM3R/9p3WG4uqVlwa1WzUVbPjIpFMZIXv7umD3Z8fnoaTG6Dyzef7V5ypQ+9YtU7+GCKsXxw==
X-Received: by 2002:a05:6a00:3994:b0:690:2ecd:a593 with SMTP id
 fi20-20020a056a00399400b006902ecda593mr11671799pfb.26.1695068582731; 
 Mon, 18 Sep 2023 13:23:02 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:02 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:32 +1000
Message-ID: <20230918202149.4343-28-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 27/44] drm/nouveau/nvdec/tu102-: prepare for GSP-RM
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
- provide empty class list for non-GSP paths
- split tu102- from gm107, they will provide host classes later
- fixup HW engine instance masks

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/engine/nvdec.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 20 +++++------
 .../gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/base.c  |  3 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c |  4 +++
 .../gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/priv.h  |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c | 34 +++++++++++++++++++
 8 files changed, 55 insertions(+), 12 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
index 9baf197ac833..ca83caa55157 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
@@ -12,5 +12,6 @@ struct nvkm_nvdec {
 };
 
 int gm107_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
+int tu102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 int ga102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 395702870872..c0f1a8110452 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2426,7 +2426,7 @@ nv162_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
-	.nvdec    = { 0x00000001, gm107_nvdec_new },
+	.nvdec    = { 0x00000001, tu102_nvdec_new },
 	.nvenc    = { 0x00000001, gm107_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
@@ -2461,7 +2461,7 @@ nv164_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
-	.nvdec    = { 0x00000003, gm107_nvdec_new },
+	.nvdec    = { 0x00000003, tu102_nvdec_new },
 	.nvenc    = { 0x00000001, gm107_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
@@ -2496,7 +2496,7 @@ nv166_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
-	.nvdec    = { 0x00000007, gm107_nvdec_new },
+	.nvdec    = { 0x00000007, tu102_nvdec_new },
 	.nvenc    = { 0x00000001, gm107_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
@@ -2531,7 +2531,7 @@ nv167_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
-	.nvdec    = { 0x00000001, gm107_nvdec_new },
+	.nvdec    = { 0x00000001, tu102_nvdec_new },
 	.nvenc    = { 0x00000001, gm107_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
@@ -2566,7 +2566,7 @@ nv168_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
-	.nvdec    = { 0x00000001, gm107_nvdec_new },
+	.nvdec    = { 0x00000001, tu102_nvdec_new },
 	.nvenc    = { 0x00000001, gm107_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
@@ -2620,7 +2620,7 @@ nv172_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
-	.nvdec    = { 0x00000001, ga102_nvdec_new },
+	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2650,7 +2650,7 @@ nv173_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
-	.nvdec    = { 0x00000001, ga102_nvdec_new },
+	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2680,7 +2680,7 @@ nv174_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
-	.nvdec    = { 0x00000001, ga102_nvdec_new },
+	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2710,7 +2710,7 @@ nv176_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
-	.nvdec    = { 0x00000001, ga102_nvdec_new },
+	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2740,7 +2740,7 @@ nv177_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ga102_gr_new },
-	.nvdec    = { 0x00000001, ga102_nvdec_new },
+	.nvdec    = { 0x00000003, ga102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
index f05e79670d22..37b0cdc760c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: MIT
 nvkm-y += nvkm/engine/nvdec/base.o
 nvkm-y += nvkm/engine/nvdec/gm107.o
+nvkm-y += nvkm/engine/nvdec/tu102.o
 nvkm-y += nvkm/engine/nvdec/ga102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c
index 1f6e3b32ba16..7d1c6791ae82 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/base.c
@@ -33,6 +33,7 @@ nvkm_nvdec_dtor(struct nvkm_engine *engine)
 static const struct nvkm_engine_func
 nvkm_nvdec = {
 	.dtor = nvkm_nvdec_dtor,
+	.sclass = { {} },
 };
 
 int
@@ -58,4 +59,4 @@ nvkm_nvdec_new_(const struct nvkm_nvdec_fwif *fwif, struct nvkm_device *device,
 
 	return nvkm_falcon_ctor(nvdec->func->flcn, &nvdec->engine.subdev,
 				nvdec->engine.subdev.name, addr, &nvdec->falcon);
-};
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
index 37d8c3c0f3ab..1ec88a9b6504 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
@@ -21,6 +21,7 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
 #include <subdev/mc.h>
 #include <subdev/timer.h>
 
@@ -57,5 +58,8 @@ int
 ga102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_nvdec **pnvdec)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_nvdec_new_(ga102_nvdec_fwif, device, type, inst, 0x848000, pnvdec);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c
index 564f7e8960a2..51c9d0e68ee4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c
@@ -44,7 +44,7 @@ gm107_nvdec_nofw(struct nvkm_nvdec *nvdec, int ver,
 	return 0;
 }
 
-static const struct nvkm_nvdec_fwif
+const struct nvkm_nvdec_fwif
 gm107_nvdec_fwif[] = {
 	{ -1, gm107_nvdec_nofw, &gm107_nvdec },
 	{}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
index 61e1f7aaa509..2a7ef527ed31 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
@@ -14,6 +14,8 @@ struct nvkm_nvdec_fwif {
 	const struct nvkm_nvdec_func *func;
 };
 
+extern const struct nvkm_nvdec_fwif gm107_nvdec_fwif[];
+
 int nvkm_nvdec_new_(const struct nvkm_nvdec_fwif *fwif, struct nvkm_device *,
 		    enum nvkm_subdev_type, int, u32 addr, struct nvkm_nvdec **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
new file mode 100644
index 000000000000..fe95b6e22f21
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
@@ -0,0 +1,34 @@
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
+int
+tu102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_nvdec **pnvdec)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
+	return nvkm_nvdec_new_(gm107_nvdec_fwif, device, type, inst, 0, pnvdec);
+}
-- 
2.41.0

