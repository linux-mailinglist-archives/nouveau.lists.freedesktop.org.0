Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7E7A53F9
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DCA10E334;
	Mon, 18 Sep 2023 20:23:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D539B10E32D
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:05 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68cbbff84f6so4171225b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068585; x=1695673385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NS0Z3nZA7AIUwLklUu30/IVmr0mR2LR5HTq1eohTlXg=;
 b=Klv4WrSk7c1im0zmljlk6tfesTJz1DJGQAOBKHlGkKrijJVqtCrI53laQYZtZbkN0Q
 bI6uhvwJdDZtqru64ho343eKEbIj0x0U0HtFFFOOAW8aPI+jNGbTDXaRsOPaiwaWHd0d
 AWKl+629d60S2XSdz6JurNWcQHRdzcdfdwhImqYcRk/9jjUSvRfriecDh1ZtMl1+HMZR
 je10q3kgl59h/NLFC2yV1mC5d1b8KoqIH85vYcbQB3djFJ6SbEKAm/fshTU1G/fgRGik
 8Rv+680ADGvabRrhoidWZ0tJPBrCf7jydG7rNox8CyYd4U1TStiL0lie9YTdWIeI2n9w
 6ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068585; x=1695673385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NS0Z3nZA7AIUwLklUu30/IVmr0mR2LR5HTq1eohTlXg=;
 b=paEC1Pk06jDlNQV3JW/aG1KFRdMuSkejfssqiXl3hQvkv0eD086MzLzZOwWP3OkO5x
 R4zBIJf/PV5DOa75u2d6eAEBUycoQ5g3iE0vRm8rSEfWeM89gRg0Lv498h83aPnnVC1L
 CgpeTgQyiWuEBOz51qb3ndTDSbxgJFA0kjq/TXi/JcP7gAeUiHWsTsi15+mLrWxqVkVY
 TZPo3G7rCS0923wqt9Gqcb7dj8jlPd5n/52uOcIso9Y9WfXC7z6zLBmd52Epb+WHZU/A
 wlIJNGJOyXiGjVDcNrpyX5zHEGR4QSBmIHlGbrSsrkYmzQlHNiPDvDywEr06Ge8o8cjL
 fhHg==
X-Gm-Message-State: AOJu0YxFgOdOxawc0qqzF+hAh6q/Y9yUQZIcYSKyMMFlEcRYrxuEf8E8
 MsF0XrZ1Vq0YZ+sidODYXjKnwPVswkk=
X-Google-Smtp-Source: AGHT+IFeg1Ap4fRGNyLOETtc878uTCJ2Wypa5gwSBXamHSjWFLOa3O1hJBVDVPfTKERGtyvKvVsBig==
X-Received: by 2002:a05:6a20:a124:b0:154:8d7a:aeb3 with SMTP id
 q36-20020a056a20a12400b001548d7aaeb3mr673395pzk.28.1695068584832; 
 Mon, 18 Sep 2023 13:23:04 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:04 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:33 +1000
Message-ID: <20230918202149.4343-29-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 28/44] drm/nouveau/nvenc/tu102-: prepare for GSP-RM
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
- split tu102 from gm107, it will provide host classes later

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/engine/nvenc.h   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 10 +++---
 .../gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild  |  1 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/base.c  |  3 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/priv.h  |  2 ++
 .../gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c | 34 +++++++++++++++++++
 7 files changed, 46 insertions(+), 7 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
index 1a259c5c9a71..1f6eef13f872 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvenc.h
@@ -12,4 +12,5 @@ struct nvkm_nvenc {
 };
 
 int gm107_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
+int tu102_nvenc_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvenc **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index c0f1a8110452..80ebf2a3a990 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2427,7 +2427,7 @@ nv162_chipset = {
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
 	.nvdec    = { 0x00000001, tu102_nvdec_new },
-	.nvenc    = { 0x00000001, gm107_nvenc_new },
+	.nvenc    = { 0x00000001, tu102_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
@@ -2462,7 +2462,7 @@ nv164_chipset = {
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
 	.nvdec    = { 0x00000003, tu102_nvdec_new },
-	.nvenc    = { 0x00000001, gm107_nvenc_new },
+	.nvenc    = { 0x00000001, tu102_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
@@ -2497,7 +2497,7 @@ nv166_chipset = {
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
 	.nvdec    = { 0x00000007, tu102_nvdec_new },
-	.nvenc    = { 0x00000001, gm107_nvenc_new },
+	.nvenc    = { 0x00000001, tu102_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
@@ -2532,7 +2532,7 @@ nv167_chipset = {
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
 	.nvdec    = { 0x00000001, tu102_nvdec_new },
-	.nvenc    = { 0x00000001, gm107_nvenc_new },
+	.nvenc    = { 0x00000001, tu102_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
@@ -2567,7 +2567,7 @@ nv168_chipset = {
 	.fifo     = { 0x00000001, tu102_fifo_new },
 	.gr       = { 0x00000001, tu102_gr_new },
 	.nvdec    = { 0x00000001, tu102_nvdec_new },
-	.nvenc    = { 0x00000001, gm107_nvenc_new },
+	.nvenc    = { 0x00000001, tu102_nvenc_new },
 	.sec2     = { 0x00000001, tu102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
index 75bf4436bf3f..6dcb20d1d156 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: MIT
 nvkm-y += nvkm/engine/nvenc/base.o
 nvkm-y += nvkm/engine/nvenc/gm107.o
+nvkm-y += nvkm/engine/nvenc/tu102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
index cf5dcfda7b25..d45dbb42a0db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
@@ -34,6 +34,7 @@ nvkm_nvenc_dtor(struct nvkm_engine *engine)
 static const struct nvkm_engine_func
 nvkm_nvenc = {
 	.dtor = nvkm_nvenc_dtor,
+	.sclass = { {} },
 };
 
 int
@@ -59,4 +60,4 @@ nvkm_nvenc_new_(const struct nvkm_nvenc_fwif *fwif, struct nvkm_device *device,
 
 	return nvkm_falcon_ctor(nvenc->func->flcn, &nvenc->engine.subdev,
 				nvenc->engine.subdev.name, 0, &nvenc->falcon);
-};
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c
index ad27d8b97569..922abb647ad3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c
@@ -38,7 +38,7 @@ gm107_nvenc_nofw(struct nvkm_nvenc *nvenc, int ver,
 	return 0;
 }
 
-static const struct nvkm_nvenc_fwif
+const struct nvkm_nvenc_fwif
 gm107_nvenc_fwif[] = {
 	{ -1, gm107_nvenc_nofw, &gm107_nvenc },
 	{}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
index 4130a2bfbb4f..b097e3f2867b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/priv.h
@@ -14,6 +14,8 @@ struct nvkm_nvenc_fwif {
 	const struct nvkm_nvenc_func *func;
 };
 
+extern const struct nvkm_nvenc_fwif gm107_nvenc_fwif[];
+
 int nvkm_nvenc_new_(const struct nvkm_nvenc_fwif *, struct nvkm_device *, enum nvkm_subdev_type,
 		    int, struct nvkm_nvenc **pnvenc);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
new file mode 100644
index 000000000000..8a436b398749
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
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
+tu102_nvenc_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_nvenc **pnvenc)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
+	return nvkm_nvenc_new_(gm107_nvenc_fwif, device, type, inst, pnvenc);
+}
-- 
2.41.0

