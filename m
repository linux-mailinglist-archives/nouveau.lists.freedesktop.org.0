Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3899C7A53E5
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7D410E312;
	Mon, 18 Sep 2023 20:22:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1C910E312
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:22 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-690bf8fdd1aso259945b3a.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068541; x=1695673341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dyNTG5EQkj7tT3LEwLPEWBDgiyc6lDj7GjPCaQbkH6o=;
 b=bWTs0mXY3S4CFqG91g6IjAUNh1rS6Wb6Vt0zpHE0GywPJLtx1eVqvUOqnClfowZGmO
 jyKjyTGemRbQez5YxSMSnQe+R35bvrBici8qbwm9VY/OY5aydXwd31KhA9npWixEapoU
 j7m41xPVu6lm0trikwr9WxAPjqwJ9uQkDdrLPaJDPSJAx14FugoZSSGMs6CKFwYDxxFA
 EL/3BG+ucFI3rX7qJOTefCof3oua8NOrkCd2oGAs91BMipbI+jxC/N2aP73slyWB4v4U
 DbHhl8d+Ban1Lzk67n7KCgMKlo9HjHRd8kBfBEi7HlIVMI4Xcqcvf6R14dNd1Xs7879t
 j0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068541; x=1695673341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyNTG5EQkj7tT3LEwLPEWBDgiyc6lDj7GjPCaQbkH6o=;
 b=koeMMt2o3EtnWkTdhk4/tKhYJus8UPt99iuZnHagzE+2ff6Il/b4Pn2htghqvj40/M
 P/gy3XPVyrL1Li7AaPesR4siJup8XhnATzylzd92kECUSwPrdBfgw9Lzz4Hq6wXLvNgr
 D22I7BPHmscGFZ7pSogvqn6ZRhD2X3EzsjhOJ5Z3YB+5eWFL1lLRRbvVAnDnqQ5zg6MI
 D6S8YhvbZowHl4ktX2Z2U3bhUPQFYjzbQXckKn2wg4ox3NcTe/fcnWRkh/TPuwDkVABQ
 sh1U6qnmZuJ4NTh48No6p+dC0V9e3F0iRgxCu0yTkYRiLmwQC0/6K03eT5NhX/IJEy1f
 XUjA==
X-Gm-Message-State: AOJu0Yw2vBAVI9L2vqMJBNge9D21llAcqu11He3Q5RC0tdAE/tdgxYxo
 Xd0WeVe5xcLZ1Kml2GfoTJzHb02ict4=
X-Google-Smtp-Source: AGHT+IFyKIq3YfSINzuhQ5YQrRgRBuJGp3o1Uya8JREFoUN/nZH0egJMtRhFqK39xTiM13IFYj5kYw==
X-Received: by 2002:a05:6a00:2da2:b0:690:38b6:b2da with SMTP id
 fb34-20020a056a002da200b0069038b6b2damr10091377pfb.2.1695068541468; 
 Mon, 18 Sep 2023 13:22:21 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:21 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:13 +1000
Message-ID: <20230918202149.4343-9-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 08/44] drm/nouveau/devinit/tu102-: prepare for
 GSP-RM
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

- add R535 implementation of DEVINIT, we need some of this for boot
- add display disable fuse for ga100-

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/nvkm/subdev/devinit/Kbuild    |  2 +
 .../drm/nouveau/nvkm/subdev/devinit/ga100.c   | 15 ++++++
 .../drm/nouveau/nvkm/subdev/devinit/priv.h    |  3 ++
 .../drm/nouveau/nvkm/subdev/devinit/r535.c    | 51 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |  4 ++
 5 files changed, 75 insertions(+)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild
index d1abb64841da..5f97bffca979 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild
@@ -16,3 +16,5 @@ nvkm-y += nvkm/subdev/devinit/gm200.o
 nvkm-y += nvkm/subdev/devinit/gv100.o
 nvkm-y += nvkm/subdev/devinit/tu102.o
 nvkm-y += nvkm/subdev/devinit/ga100.o
+
+nvkm-y += nvkm/subdev/devinit/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
index 6b280b05c4ca..5f0b12a1fc38 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
@@ -24,6 +24,7 @@
 #include <subdev/bios.h>
 #include <subdev/bios/pll.h>
 #include <subdev/clk/pll.h>
+#include <subdev/gsp.h>
 
 static int
 ga100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
@@ -62,8 +63,19 @@ ga100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
 	return ret;
 }
 
+static void
+ga100_devinit_disable(struct nvkm_devinit *init)
+{
+	struct nvkm_device *device = init->subdev.device;
+	u32 r820c04 = nvkm_rd32(device, 0x820c04);
+
+	if (r820c04 & 0x00000001)
+		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
+}
+
 static const struct nvkm_devinit_func
 ga100_devinit = {
+	.disable = ga100_devinit_disable,
 	.init = nv50_devinit_init,
 	.post = tu102_devinit_post,
 	.pll_set = ga100_devinit_pll_set,
@@ -73,5 +85,8 @@ int
 ga100_devinit_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		  struct nvkm_devinit **pinit)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_devinit_new(&ga100_devinit, device, type, inst, pinit);
+
 	return nv50_devinit_new_(&ga100_devinit, device, type, inst, pinit);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
index a648482d06e9..06bbfdcc788c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
@@ -4,6 +4,9 @@
 #define nvkm_devinit(p) container_of((p), struct nvkm_devinit, subdev)
 #include <subdev/devinit.h>
 
+int r535_devinit_new(const struct nvkm_devinit_func *,
+		     struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_devinit **);
+
 struct nvkm_devinit_func {
 	void *(*dtor)(struct nvkm_devinit *);
 	void (*preinit)(struct nvkm_devinit *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
new file mode 100644
index 000000000000..666eb93b1742
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
@@ -0,0 +1,51 @@
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
+#include "nv50.h"
+
+static void *
+r535_devinit_dtor(struct nvkm_devinit *devinit)
+{
+	kfree(devinit->func);
+	return devinit;
+}
+
+int
+r535_devinit_new(const struct nvkm_devinit_func *hw,
+		 struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		 struct nvkm_devinit **pdevinit)
+{
+	struct nvkm_devinit_func *rm;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_devinit_dtor;
+	rm->post = hw->post;
+	rm->disable = hw->disable;
+
+	ret = nv50_devinit_new_(rm, device, type, inst, pdevinit);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
index 40997ad1d101..f406b1525a4a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
@@ -24,6 +24,7 @@
 #include <subdev/bios.h>
 #include <subdev/bios/pll.h>
 #include <subdev/clk/pll.h>
+#include <subdev/gsp.h>
 
 static int
 tu102_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
@@ -100,5 +101,8 @@ int
 tu102_devinit_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		  struct nvkm_devinit **pinit)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_devinit_new(&tu102_devinit, device, type, inst, pinit);
+
 	return nv50_devinit_new_(&tu102_devinit, device, type, inst, pinit);
 }
-- 
2.41.0

