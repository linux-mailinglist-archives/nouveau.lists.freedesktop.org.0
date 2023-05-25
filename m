Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49C7101FD
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D23110E4D4;
	Thu, 25 May 2023 00:31:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B4710E10E
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:23 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2535d86a41bso639805a91.3
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974683; x=1687566683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2ooXaZgIeeOePfFSnJ1DbVvf0GCbzwdSL86UkPBwNk=;
 b=XaXJksn8fPjGMWpL69d/JkF0nggPYjXedavRKvcgxBB93GK2ab6+pi3m+xGzBP/0t0
 OOOdDtHzbpo7syGAjWDIg2f6UEb1iH0yGSKZ+4ud1UYKcEqzHeAbTDk/ixXFang94lfZ
 QunSYUzmEmE5HrhGKvCu2QAU7xgI7I7fl2nDi+xGznoDFbY647NL9s5icOFAZFdOjO6r
 c7VlwYGXMK6wZibJvViOHYmwgToMYh4cFJE3W+5KkEsmnc3cPlXbuSzjygB+m4z7CaXN
 8lCui7FHD5ppRwN32WtxSm7zlbG2jdbhdpPCEM/dYfGOudG3mMttiWKaI0zOJlE9QEWO
 ImUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974683; x=1687566683;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2ooXaZgIeeOePfFSnJ1DbVvf0GCbzwdSL86UkPBwNk=;
 b=d/rnxR9dZr+orPAVQhRdSAdnIEIX7ZHZ+268qFswINl014pKHetSvtw41PdrWjeHis
 nEFgQyJuyRIvUlzVt7Q9qw4oHSJ2VSicGazTi8Eom5UJtx6mH7U00Rwvj0ZW2a7TT2xB
 DSCR9hnmFQAc3K4T4rsu1NZboxiwjuJ0VfAOk8Vqf/CKNuodTZBfjEZhDRFQ0EaLfJ9t
 TRWqZWFhbAkTSPkKKMzRM/rfAKHUo4ACFUOpxPR+XwKk07ke5iJTsHGMNsLYjbVU99pq
 /KXGloj8OwIUsz4nxChx+RMv73i5gytbe6V+B18AHs9gas6woDNYur5U1uA4Lwj/apvR
 V9mw==
X-Gm-Message-State: AC+VfDwk6BJOpj8ATPyFjUUIRsYR70EfBdm4zrKHYnjAhNpdjQLj8qZ8
 nA3nlUkx0h7IFYm5PYTBT0gJqu/XeJU=
X-Google-Smtp-Source: ACHHUZ7G/ple5uuSniYAdsN9JM8uVkE2LrlRTsom1lmRxJ9YhUwk0+y55ZCU0oA+/OCRo7qws/4aJA==
X-Received: by 2002:a17:90a:648e:b0:255:7e1b:ca6d with SMTP id
 h14-20020a17090a648e00b002557e1bca6dmr10196556pjj.7.1684974682822; 
 Wed, 24 May 2023 17:31:22 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:22 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:30:59 +1000
Message-Id: <20230525003106.3853741-3-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 03/10] drm/nouveau/fb/gp102-ga100: switch to
 simpler vram size detection method
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

Also exposes this for use by upcoming GSP-RM initialisation code.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c | 12 +++++
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga100.c    |  3 +-
 .../gpu/drm/nouveau/nvkm/subdev/fb/gp102.c    | 17 ++++++-
 .../gpu/drm/nouveau/nvkm/subdev/fb/gv100.c    |  3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |  5 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c | 50 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fb/tu102.c    |  3 +-
 10 files changed, 92 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index 01a22a13b452..1755b0df3cc1 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -59,6 +59,7 @@ struct nvkm_fb {
 	struct nvkm_memory *mmu_wr;
 };
 
+u64 nvkm_fb_vidmem_size(struct nvkm_device *);
 int nvkm_fb_mem_unlock(struct nvkm_fb *);
 
 void nvkm_fb_tile_init(struct nvkm_fb *, int region, u32 addr, u32 size,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index 6ba5120a2ebe..11dbfc4a381a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -55,6 +55,7 @@ nvkm-y += nvkm/subdev/fb/ramgk104.o
 nvkm-y += nvkm/subdev/fb/ramgm107.o
 nvkm-y += nvkm/subdev/fb/ramgm200.o
 nvkm-y += nvkm/subdev/fb/ramgp100.o
+nvkm-y += nvkm/subdev/fb/ramgp102.o
 nvkm-y += nvkm/subdev/fb/ramga102.o
 nvkm-y += nvkm/subdev/fb/sddr2.o
 nvkm-y += nvkm/subdev/fb/sddr3.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
index 0955340cc421..8a286a9349ac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
@@ -174,6 +174,18 @@ nvkm_fb_mem_unlock(struct nvkm_fb *fb)
 	return 0;
 }
 
+u64
+nvkm_fb_vidmem_size(struct nvkm_device *device)
+{
+	struct nvkm_fb *fb = device->fb;
+
+	if (fb && fb->func->vidmem.size)
+		return fb->func->vidmem.size(fb);
+
+	WARN_ON(1);
+	return 0;
+}
+
 static int
 nvkm_fb_init(struct nvkm_subdev *subdev)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
index a7456e786463..12037fd4fdf2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga100.c
@@ -30,7 +30,8 @@ ga100_fb = {
 	.init_page = gv100_fb_init_page,
 	.init_unkn = gp100_fb_init_unkn,
 	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
-	.ram_new = gp100_ram_new,
+	.vidmem.size = gp102_fb_vidmem_size,
+	.ram_new = gp102_ram_new,
 	.default_bigpage = 16,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c
index 14d942e8b857..534553c64805 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gp102.c
@@ -40,6 +40,20 @@ gp102_fb_vpr_scrub_required(struct nvkm_fb *fb)
 	return (nvkm_rd32(device, 0x100cd0) & 0x00000010) != 0;
 }
 
+u64
+gp102_fb_vidmem_size(struct nvkm_fb *fb)
+{
+	const u32 data = nvkm_rd32(fb->subdev.device, 0x100ce0);
+	const u32 lmag = (data & 0x000003f0) >> 4;
+	const u32 lsca = (data & 0x0000000f);
+	const u64 size = (u64)lmag << (lsca + 20);
+
+	if (data & 0x40000000)
+		return size / 16 * 15;
+
+	return size;
+}
+
 int
 gp102_fb_oneinit(struct nvkm_fb *fb)
 {
@@ -59,9 +73,10 @@ gp102_fb = {
 	.init_remapper = gp100_fb_init_remapper,
 	.init_page = gm200_fb_init_page,
 	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
+	.vidmem.size = gp102_fb_vidmem_size,
 	.vpr.scrub_required = gp102_fb_vpr_scrub_required,
 	.vpr.scrub = gp102_fb_vpr_scrub,
-	.ram_new = gp100_ram_new,
+	.ram_new = gp102_ram_new,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
index 4d8a286a7a34..f422564bee5b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gv100.c
@@ -36,9 +36,10 @@ gv100_fb = {
 	.init_page = gv100_fb_init_page,
 	.init_unkn = gp100_fb_init_unkn,
 	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
+	.vidmem.size = gp102_fb_vidmem_size,
 	.vpr.scrub_required = gp102_fb_vpr_scrub_required,
 	.vpr.scrub = gp102_fb_vpr_scrub,
-	.ram_new = gp100_ram_new,
+	.ram_new = gp102_ram_new,
 	.default_bigpage = 16,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
index 726c30c8bf95..77d6a8c10829 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h
@@ -20,6 +20,10 @@ struct nvkm_fb_func {
 		void (*flush_page_init)(struct nvkm_fb *);
 	} sysmem;
 
+	struct nvkm_fb_func_vidmem {
+		u64 (*size)(struct nvkm_fb *);
+	} vidmem;
+
 	struct {
 		bool (*scrub_required)(struct nvkm_fb *);
 		int (*scrub)(struct nvkm_fb *);
@@ -84,6 +88,7 @@ void gp100_fb_init_remapper(struct nvkm_fb *);
 void gp100_fb_init_unkn(struct nvkm_fb *);
 
 int gp102_fb_oneinit(struct nvkm_fb *);
+u64 gp102_fb_vidmem_size(struct nvkm_fb *);
 bool gp102_fb_vpr_scrub_required(struct nvkm_fb *);
 int gp102_fb_vpr_scrub(struct nvkm_fb *);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
index ea7d66f3dd82..33d4ab8d92e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
@@ -70,5 +70,6 @@ int gk104_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int gm107_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int gm200_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int gp100_ram_new(struct nvkm_fb *, struct nvkm_ram **);
+int gp102_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int ga102_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
new file mode 100644
index 000000000000..ee541b049fc5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgp102.c
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
+#include "ram.h"
+
+#include <subdev/bios.h>
+
+static const struct nvkm_ram_func
+gp102_ram = {
+};
+
+int
+gp102_ram_new(struct nvkm_fb *fb, struct nvkm_ram **pram)
+{
+	enum nvkm_ram_type type = nvkm_fb_bios_memtype(fb->subdev.device->bios);
+	const u32 rsvd_head = ( 256 * 1024); /* vga memory */
+	const u32 rsvd_tail = (1024 * 1024); /* vbios etc */
+	u64 size = fb->func->vidmem.size(fb);
+	int ret;
+
+	ret = nvkm_ram_new_(&gp102_ram, fb, type, size, pram);
+	if (ret)
+		return ret;
+
+	nvkm_mm_fini(&(*pram)->vram);
+
+	return nvkm_mm_init(&(*pram)->vram, NVKM_RAM_MM_NORMAL,
+			    rsvd_head >> NVKM_RAM_MM_SHIFT,
+			    (size - rsvd_head - rsvd_tail) >> NVKM_RAM_MM_SHIFT,
+			    1);
+
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
index b8803c124c3b..bcc23d4c8115 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/tu102.c
@@ -36,9 +36,10 @@ tu102_fb = {
 	.init_page = gv100_fb_init_page,
 	.init_unkn = gp100_fb_init_unkn,
 	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
+	.vidmem.size = gp102_fb_vidmem_size,
 	.vpr.scrub_required = tu102_fb_vpr_scrub_required,
 	.vpr.scrub = gp102_fb_vpr_scrub,
-	.ram_new = gp100_ram_new,
+	.ram_new = gp102_ram_new,
 	.default_bigpage = 16,
 };
 
-- 
2.40.1

