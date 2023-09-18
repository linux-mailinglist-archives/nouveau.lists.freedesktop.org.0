Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF7E7A53E7
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EE910E314;
	Mon, 18 Sep 2023 20:22:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C7810E316
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:26 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68fdcc37827so4187470b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068546; x=1695673346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ah4Wk2lQR9UHFIJRs74t2/vCOak0Rgvqt1fd/VyJ0oA=;
 b=ljELqO2ryBTz+rWrxU6EfTsED7rWP9a7XMyb4AwQJo/oG1iqeS7ecRvSgd2sD2FZEu
 YfdlU7kvrEznI6jyUHEvRP+QMdGWh9m+YS7wM79z0JBm8lQaNJP88Etimm43trwnvHwH
 Emyj5HtwwscsvYKFe0hf453kStokyejS1nEuOEpkGfjFj8RdY0rE3TkORl21ju8xFOWP
 f0V/N55n0MlfuN6Dx2L+Kp/qFe1NPIRL3lN1W1FW9G+aAHTtY1qaeq1KsBWvMul1Ao/V
 NnDE8qTfsJ955OrwSDOACKaGq1TfvsUL4o/zfadzkIaqaucWvycJys/M5d5p2z0g3WGw
 toTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068546; x=1695673346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ah4Wk2lQR9UHFIJRs74t2/vCOak0Rgvqt1fd/VyJ0oA=;
 b=oVo5BA91B776ha5I8flcnZCe1v/QkbQjRrwNzNNRrJvr3UPG71aXtjaljmWRs3qUtP
 olsyxcpud/ZpSNDrZq5UOch07O0RTFZHmc79B5QNTysdhAL4cLweX2+3Q+9MeHGneJX0
 sGga+W2C1BexogWGgjZ8qihubNFoz/h581BJ2/QU0qob5A/RemcfAmZK7SNLhV8t8qwA
 98RQ0mkbmwrzhioACyBjP91y3Z1Id4nliNvEcJ6yJWV+APg1jcT4ykjJvJD/avhfc5Zb
 gj3A1tQxlrJQV8q/zB0WOZiz6elTLSg/7RaQCkwLyiucLBhThhloOCVqzhxnOkfuMPwo
 +UnQ==
X-Gm-Message-State: AOJu0YxCiseQMdV8YV4EFEwwcxnQR0ZnRcYA3nkVVtUYdJeDnwNv0Ziq
 zQ6OaN9pogH28A2TQAfVOAf9PdoqBec=
X-Google-Smtp-Source: AGHT+IEpAnl18SHSoOD3GM+0hV2Z97ZMIiDpzl3cR8pWT1yYrpDmfdlu7sUxPjct+WUjPEmYPta2Qw==
X-Received: by 2002:a05:6a20:3951:b0:137:c971:6a0c with SMTP id
 r17-20020a056a20395100b00137c9716a0cmr630437pzg.31.1695068545899; 
 Mon, 18 Sep 2023 13:22:25 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:25 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:15 +1000
Message-ID: <20230918202149.4343-11-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 10/44] drm/nouveau/fb/tu102-: prepare for GSP-RM
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

- add (initial) R535 implementation of FB, need VRAM size etc for boot
- expose a way to "wrap" vram at a specific address/size as a standard
  nvkm_memory allocation, which will be used to write PTEs etc for RM-
  defined memory regions

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  6 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  2 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga100.c    |  5 ++
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga102.c    |  4 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |  3 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c | 50 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c  | 46 +++++++++++++++--
 .../gpu/drm/nouveau/nvkm/subdev/fb/tu102.c    |  5 ++
 8 files changed, 113 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index 1755b0df3cc1..5b798a1a313d 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -158,9 +158,9 @@ struct nvkm_ram {
 	struct nvkm_ram_data target;
 };
 
-int
-nvkm_ram_get(struct nvkm_device *, u8 heap, u8 type, u8 page, u64 size,
-	     bool contig, bool back, struct nvkm_memory **);
+int nvkm_ram_wrap(struct nvkm_device *, u64 addr, u64 size, struct nvkm_memory **);
+int nvkm_ram_get(struct nvkm_device *, u8 heap, u8 type, u8 page, u64 size,
+		 bool contig, bool back, struct nvkm_memory **);
 
 struct nvkm_ram_func {
 	u64 upper;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index 394c305e759a..d1611ad3bf81 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -36,6 +36,8 @@ nvkm-y += nvkm/subdev/fb/tu102.o
 nvkm-y += nvkm/subdev/fb/ga100.o
 nvkm-y += nvkm/subdev/fb/ga102.o
 
+nvkm-y += nvkm/subdev/fb/r535.o
+
 nvkm-y += nvkm/subdev/fb/ram.o
 nvkm-y += nvkm/subdev/fb/ramnv04.o
 nvkm-y += nvkm/subdev/fb/ramnv10.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
index 12037fd4fdf2..e9e7c1d5c4c4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
@@ -22,6 +22,8 @@
 #include "gf100.h"
 #include "ram.h"
 
+#include <subdev/gsp.h>
+
 static const struct nvkm_fb_func
 ga100_fb = {
 	.dtor = gf100_fb_dtor,
@@ -38,5 +40,8 @@ ga100_fb = {
 int
 ga100_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_fb_new(&ga100_fb, device, type, inst, pfb);
+
 	return gf100_fb_new_(&ga100_fb, device, type, inst, pfb);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
index 76f6877b54c6..25f82b372bca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
@@ -22,6 +22,7 @@
 #include "gf100.h"
 #include "ram.h"
 
+#include <subdev/gsp.h>
 #include <engine/nvdec.h>
 
 static u64
@@ -59,6 +60,9 @@ ga102_fb = {
 int
 ga102_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_fb_new(&ga102_fb, device, type, inst, pfb);
+
 	return gf100_fb_new_(&ga102_fb, device, type, inst, pfb);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
index 77d6a8c10829..35c55dfba23d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
@@ -6,6 +6,9 @@
 #include <subdev/therm.h>
 struct nvkm_bios;
 
+int r535_fb_new(const struct nvkm_fb_func *,
+		struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
+
 struct nvkm_fb_func {
 	void *(*dtor)(struct nvkm_fb *);
 	u32 (*tags)(struct nvkm_fb *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
new file mode 100644
index 000000000000..0c301882f2fc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
@@ -0,0 +1,50 @@
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
+static void *
+r535_fb_dtor(struct nvkm_fb *fb)
+{
+	kfree(fb->func);
+	return fb;
+}
+
+int
+r535_fb_new(const struct nvkm_fb_func *hw,
+	    struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
+{
+	struct nvkm_fb_func *rm;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_fb_dtor;
+	rm->sysmem.flush_page_init = hw->sysmem.flush_page_init;
+	rm->vidmem.size = hw->vidmem.size;
+
+	ret = nvkm_fb_new_(rm, device, type, inst, pfb);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c
index 5c34416cb637..c826980bf70e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c
@@ -88,12 +88,20 @@ nvkm_vram_dtor(struct nvkm_memory *memory)
 	struct nvkm_vram *vram = nvkm_vram(memory);
 	struct nvkm_mm_node *next = vram->mn;
 	struct nvkm_mm_node *node;
-	mutex_lock(&vram->ram->mutex);
-	while ((node = next)) {
-		next = node->next;
-		nvkm_mm_free(&vram->ram->vram, &node);
+
+	if (next) {
+		if (likely(next->nl_entry.next)){
+			mutex_lock(&vram->ram->mutex);
+			while ((node = next)) {
+				next = node->next;
+				nvkm_mm_free(&vram->ram->vram, &node);
+			}
+			mutex_unlock(&vram->ram->mutex);
+		} else {
+			kfree(vram->mn);
+		}
 	}
-	mutex_unlock(&vram->ram->mutex);
+
 	return vram;
 }
 
@@ -108,6 +116,34 @@ nvkm_vram = {
 	.kmap = nvkm_vram_kmap,
 };
 
+int
+nvkm_ram_wrap(struct nvkm_device *device, u64 addr, u64 size,
+	      struct nvkm_memory **pmemory)
+{
+	struct nvkm_ram *ram;
+	struct nvkm_vram *vram;
+
+	if (!device->fb || !(ram = device->fb->ram))
+		return -ENODEV;
+	ram = device->fb->ram;
+
+	if (!(vram = kzalloc(sizeof(*vram), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_memory_ctor(&nvkm_vram, &vram->memory);
+	vram->ram = ram;
+	vram->page = NVKM_RAM_MM_SHIFT;
+	*pmemory = &vram->memory;
+
+	vram->mn = kzalloc(sizeof(*vram->mn), GFP_KERNEL);
+	if (!vram->mn)
+		return -ENOMEM;
+
+	vram->mn->offset = addr >> NVKM_RAM_MM_SHIFT;
+	vram->mn->length = size >> NVKM_RAM_MM_SHIFT;
+	return 0;
+}
+
 int
 nvkm_ram_get(struct nvkm_device *device, u8 heap, u8 type, u8 rpage, u64 size,
 	     bool contig, bool back, struct nvkm_memory **pmemory)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
index bcc23d4c8115..f7d2a749ce3f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
@@ -22,6 +22,8 @@
 #include "gf100.h"
 #include "ram.h"
 
+#include <subdev/gsp.h>
+
 bool
 tu102_fb_vpr_scrub_required(struct nvkm_fb *fb)
 {
@@ -46,6 +48,9 @@ tu102_fb = {
 int
 tu102_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_fb_new(&tu102_fb, device, type, inst, pfb);
+
 	return gf100_fb_new_(&tu102_fb, device, type, inst, pfb);
 }
 
-- 
2.41.0

