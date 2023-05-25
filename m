Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0D7101FE
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259DE10E621;
	Thu, 25 May 2023 00:31:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D02E310E621
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:25 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-253340db64fso794961a91.2
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974685; x=1687566685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urz6ULZ5kaGOfUrZ8N5ZADKd3xrBEzXIBUwbOb2ZK0E=;
 b=giA09KCSNIwQjLd8hK6poF+7VJHasuv8jOSQxRrU62/rkN3qjccR1Buu0b7qu2lz1i
 IYIJXm5yUva2kNAEsrv2uOOF4i+tLzBW05TJSa5A2xO38TuF5TYNWYGBGwqXgT0YXRpg
 mByZB698FjYAMZNuMxd/ChdZnvOxydoql3oaA96IBhkdfVlcQ6bhbDUsK3WLhRG68USi
 YRqW7Bago4bHC0KbTRcTRpQFdQpFN5iboMyHozLXEu5pKsojx84JmJwgh8BPEkMFa3ry
 iv2trtBPoCghHfS3xIiCPIIFF7MzZJGjc8RAVarPNZ92pMT3bktFVjCoGcJ8psyaMAoR
 cIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974685; x=1687566685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=urz6ULZ5kaGOfUrZ8N5ZADKd3xrBEzXIBUwbOb2ZK0E=;
 b=CmGBpE/Kpqy9+Zy7GkvK12Soi2atVcbcTy7TTAhijD5vIuQYKBE9aymCZf3ZQ7C0ad
 0YAjid0cBE9iN6TprYGQVz05XRZExeI50ZMaJCqFVSkh+QhZMf8COCVeax0HHKlwJQaA
 GChIqi4PPEpsxylrNKMdlfFwE9i+2iHmrQj3u+jv5u349sPnoY2E3g5vACFxJWk5MNTG
 z9BbAr57IUjOAk/JS+55nbvHYf+69a6BzRupwtnd+58CkzmPVMeeQNeLh1Hbj5ZLgIz0
 5IIWr4p3dnI3oVMZQq2PprkwXZC31qVJBSM/x1pLdKlTIbqYQbo8TJgZ0oL/5J4FZCpu
 yAYg==
X-Gm-Message-State: AC+VfDwnTz4CrDKopHyay+Hme9LTBzkAbJZ7eU6XHlL75tg+o+WG8WRr
 lsKoqUfGZVnHkjXVut74f+/xk8gkbp0=
X-Google-Smtp-Source: ACHHUZ6wufWfxP49LN+CNNt/Sj2cz8+H17ZcbAtCHfaHNcK9o1r4AjyCOGsmBnvHmGQeBvrBL7pktA==
X-Received: by 2002:a17:90a:4409:b0:255:361a:e447 with SMTP id
 s9-20020a17090a440900b00255361ae447mr14044057pjg.18.1684974684773; 
 Wed, 24 May 2023 17:31:24 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:24 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:00 +1000
Message-Id: <20230525003106.3853741-4-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 04/10] drm/nouveau/fb/ga102-: construct vidmem
 heap via new gp102 paths
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

No need for custom implementation anymore.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 -
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga102.c    |  9 ++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h  |  1 -
 .../gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c | 40 -------------------
 4 files changed, 8 insertions(+), 43 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index 11dbfc4a381a..394c305e759a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -56,7 +56,6 @@ nvkm-y += nvkm/subdev/fb/ramgm107.o
 nvkm-y += nvkm/subdev/fb/ramgm200.o
 nvkm-y += nvkm/subdev/fb/ramgp100.o
 nvkm-y += nvkm/subdev/fb/ramgp102.o
-nvkm-y += nvkm/subdev/fb/ramga102.o
 nvkm-y += nvkm/subdev/fb/sddr2.o
 nvkm-y += nvkm/subdev/fb/sddr3.o
 nvkm-y += nvkm/subdev/fb/gddr3.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
index dd476e079fe1..76f6877b54c6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ga102.c
@@ -24,6 +24,12 @@
 
 #include <engine/nvdec.h>
 
+static u64
+ga102_fb_vidmem_size(struct nvkm_fb *fb)
+{
+	return (u64)nvkm_rd32(fb->subdev.device, 0x1183a4) << 20;
+}
+
 static int
 ga102_fb_oneinit(struct nvkm_fb *fb)
 {
@@ -43,7 +49,8 @@ ga102_fb = {
 	.init_page = gv100_fb_init_page,
 	.init_unkn = gp100_fb_init_unkn,
 	.sysmem.flush_page_init = gf100_fb_sysmem_flush_page_init,
-	.ram_new = ga102_ram_new,
+	.vidmem.size = ga102_fb_vidmem_size,
+	.ram_new = gp102_ram_new,
 	.default_bigpage = 16,
 	.vpr.scrub_required = tu102_fb_vpr_scrub_required,
 	.vpr.scrub = gp102_fb_vpr_scrub,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
index 33d4ab8d92e6..50f0c1914f58 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.h
@@ -71,5 +71,4 @@ int gm107_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int gm200_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int gp100_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 int gp102_ram_new(struct nvkm_fb *, struct nvkm_ram **);
-int ga102_ram_new(struct nvkm_fb *, struct nvkm_ram **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c
deleted file mode 100644
index 298c136cefe0..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramga102.c
+++ /dev/null
@@ -1,40 +0,0 @@
-/*
- * Copyright 2021 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-#include "ram.h"
-
-#include <subdev/bios.h>
-#include <subdev/bios/init.h>
-#include <subdev/bios/rammap.h>
-
-static const struct nvkm_ram_func
-ga102_ram = {
-};
-
-int
-ga102_ram_new(struct nvkm_fb *fb, struct nvkm_ram **pram)
-{
-	struct nvkm_device *device = fb->subdev.device;
-	enum nvkm_ram_type type = nvkm_fb_bios_memtype(device->bios);
-	u32 size = nvkm_rd32(device, 0x1183a4);
-
-	return nvkm_ram_new_(&ga102_ram, fb, type, (u64)size << 20, pram);
-}
-- 
2.40.1

