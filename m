Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CD07A53EB
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D0110E31B;
	Mon, 18 Sep 2023 20:22:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABAA10E319
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:35 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-690bc3f8326so459214b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068555; x=1695673355; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvtNth/tz32sjCebjnzvYaDE5PkbPCN+s5P4S4iHxLA=;
 b=NiFio/PXJ+fGM4TNIhCkvmupNOkSQ23twtoR0ll6ZWUs+Btm6lI7wr8+AfkhVy2ict
 ILnbvQwSZMKo8dqeu/pB3gqXWbedHe8ofqj4lSMovOf/OMdFjv96T11ubgOm/LLA70Yz
 LVROCP4h++cus2UISVjzfbRcRIf4isQiXNbl4iKlVakOCoMUWb5gFThKRANkfXwjKZie
 d9day84McE+C8SXiU5yyWR24+QA4PPfiVJvsRWm/at3LWlFhaGzjwumLw7H4V1sE9tpq
 RhgtfOCrYvIM9rRxw9cVCcDo4RIe7ZmEmKwwAnkJqyz+g18NpbEO61Tqs0ycqhP12s7Q
 YdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068555; x=1695673355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qvtNth/tz32sjCebjnzvYaDE5PkbPCN+s5P4S4iHxLA=;
 b=ikGmcMQG2knSUFTbyA0hmH3WDRmj/wWEtQUfJLQMASWmjf/nLICH9p9nh8wdCQSLh0
 sMvCwyiCZuUHZZAQ5GM+jgy7gtZJu9SRqvjg3uUsMDOyiv62ch8EREcS4Nd/CNDWnwVD
 oKfYH++xD32ZXRUDJsq9dAVXladW657CFBLaesyBBDOQmkul14NteDKl85JHi9Ku7V6T
 vQijdFi7SGOaJHrmnSxh9dM37fJgsYEbLJQZbEiX1zz/HCI20l9vxYLvUX2Abc5nRwAR
 zdejV16P51hZv63A5ZaC0RM8ecScVdrBLUOUAMIA6p3i0AmT6ItNXdjAHqqmAQ+dLVT2
 yy/g==
X-Gm-Message-State: AOJu0YxdogKSOzK8jdPb+WtWnwg9G/ATEfIYilXo610Asm3FPsS5cU45
 h9PFukvwbILqZUcn+m1JVwYMUlT/gws=
X-Google-Smtp-Source: AGHT+IH9np5WCnY8XYJHpiodsMP3rSB0iFLHE9Kl0vrczyC8JK/wJ8Ve9XCH8EgvrZKp+OJ4upXvNA==
X-Received: by 2002:a05:6a00:cd1:b0:68a:4d66:caf with SMTP id
 b17-20020a056a000cd100b0068a4d660cafmr9510948pfv.34.1695068554719; 
 Mon, 18 Sep 2023 13:22:34 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:34 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:19 +1000
Message-ID: <20230918202149.4343-15-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 14/44] drm/nouveau/imem/tu102-: prepare for GSP-RM
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

- move suspend/resume paths to HW-specific code
- allow (future) RM paths to be based on nv50_instmem

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/subdev/instmem.h |  2 +
 .../drm/nouveau/nvkm/subdev/instmem/base.c    | 40 ++++++-----------
 .../drm/nouveau/nvkm/subdev/instmem/gk20a.c   |  2 +
 .../drm/nouveau/nvkm/subdev/instmem/nv04.c    | 45 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 27 +++++++++--
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    | 10 +++++
 6 files changed, 96 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index 92a36ddfc29f..7d93c742ee59 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -8,6 +8,8 @@ struct nvkm_instmem {
 	const struct nvkm_instmem_func *func;
 	struct nvkm_subdev subdev;
 
+	bool suspend;
+
 	spinlock_t lock;
 	struct list_head list;
 	struct list_head boot;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
index 24886eabe8dc..a2cd3330efc6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
@@ -28,7 +28,7 @@
 /******************************************************************************
  * instmem object base implementation
  *****************************************************************************/
-static void
+void
 nvkm_instobj_load(struct nvkm_instobj *iobj)
 {
 	struct nvkm_memory *memory = &iobj->memory;
@@ -48,7 +48,7 @@ nvkm_instobj_load(struct nvkm_instobj *iobj)
 	iobj->suspend = NULL;
 }
 
-static int
+int
 nvkm_instobj_save(struct nvkm_instobj *iobj)
 {
 	struct nvkm_memory *memory = &iobj->memory;
@@ -179,24 +179,14 @@ static int
 nvkm_instmem_fini(struct nvkm_subdev *subdev, bool suspend)
 {
 	struct nvkm_instmem *imem = nvkm_instmem(subdev);
-	struct nvkm_instobj *iobj;
+	int ret;
 
 	if (suspend) {
-		list_for_each_entry(iobj, &imem->list, head) {
-			if (iobj->preserve) {
-				int ret = nvkm_instobj_save(iobj);
-				if (ret)
-					return ret;
-			}
-		}
-
-		nvkm_bar_bar2_fini(subdev->device);
+		ret = imem->func->suspend(imem);
+		if (ret)
+			return ret;
 
-		list_for_each_entry(iobj, &imem->boot, head) {
-			int ret = nvkm_instobj_save(iobj);
-			if (ret)
-				return ret;
-		}
+		imem->suspend = true;
 	}
 
 	if (imem->func->fini)
@@ -209,20 +199,16 @@ static int
 nvkm_instmem_init(struct nvkm_subdev *subdev)
 {
 	struct nvkm_instmem *imem = nvkm_instmem(subdev);
-	struct nvkm_instobj *iobj;
 
-	list_for_each_entry(iobj, &imem->boot, head) {
-		if (iobj->suspend)
-			nvkm_instobj_load(iobj);
-	}
+	if (imem->suspend) {
+		if (imem->func->resume)
+			imem->func->resume(imem);
 
-	nvkm_bar_bar2_init(subdev->device);
-
-	list_for_each_entry(iobj, &imem->list, head) {
-		if (iobj->suspend)
-			nvkm_instobj_load(iobj);
+		imem->suspend = false;
+		return 0;
 	}
 
+	nvkm_bar_bar2_init(subdev->device);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index a4ac94a2ab57..1b811d6972a1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -564,6 +564,8 @@ gk20a_instmem_dtor(struct nvkm_instmem *base)
 static const struct nvkm_instmem_func
 gk20a_instmem = {
 	.dtor = gk20a_instmem_dtor,
+	.suspend = nv04_instmem_suspend,
+	.resume = nv04_instmem_resume,
 	.memory_new = gk20a_instobj_new,
 	.zero = false,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c
index 25603b01d6f8..e5320ef849bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv04.c
@@ -25,6 +25,7 @@
 #include "priv.h"
 
 #include <core/ramht.h>
+#include <subdev/bar.h>
 
 struct nv04_instmem {
 	struct nvkm_instmem base;
@@ -154,6 +155,48 @@ nv04_instmem_wr32(struct nvkm_instmem *imem, u32 addr, u32 data)
 	nvkm_wr32(imem->subdev.device, 0x700000 + addr, data);
 }
 
+void
+nv04_instmem_resume(struct nvkm_instmem *imem)
+{
+	struct nvkm_instobj *iobj;
+
+	list_for_each_entry(iobj, &imem->boot, head) {
+		if (iobj->suspend)
+			nvkm_instobj_load(iobj);
+	}
+
+	nvkm_bar_bar2_init(imem->subdev.device);
+
+	list_for_each_entry(iobj, &imem->list, head) {
+		if (iobj->suspend)
+			nvkm_instobj_load(iobj);
+	}
+}
+
+int
+nv04_instmem_suspend(struct nvkm_instmem *imem)
+{
+	struct nvkm_instobj *iobj;
+
+	list_for_each_entry(iobj, &imem->list, head) {
+		if (iobj->preserve) {
+			int ret = nvkm_instobj_save(iobj);
+			if (ret)
+				return ret;
+		}
+	}
+
+	nvkm_bar_bar2_fini(imem->subdev.device);
+
+	list_for_each_entry(iobj, &imem->boot, head) {
+		int ret = nvkm_instobj_save(iobj);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int
 nv04_instmem_oneinit(struct nvkm_instmem *base)
 {
@@ -210,6 +253,8 @@ static const struct nvkm_instmem_func
 nv04_instmem = {
 	.dtor = nv04_instmem_dtor,
 	.oneinit = nv04_instmem_oneinit,
+	.suspend = nv04_instmem_suspend,
+	.resume = nv04_instmem_resume,
 	.rd32 = nv04_instmem_rd32,
 	.wr32 = nv04_instmem_wr32,
 	.memory_new = nv04_instobj_new,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
index 4b2d7465d22f..6649e30d7cd7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c
@@ -27,6 +27,7 @@
 #include <core/memory.h>
 #include <subdev/bar.h>
 #include <subdev/fb.h>
+#include <subdev/gsp.h>
 #include <subdev/mmu.h>
 
 struct nv50_instmem {
@@ -394,24 +395,44 @@ nv50_instmem_fini(struct nvkm_instmem *base)
 	nv50_instmem(base)->addr = ~0ULL;
 }
 
+static void *
+nv50_instmem_dtor(struct nvkm_instmem *base)
+{
+	return nv50_instmem(base);
+}
+
 static const struct nvkm_instmem_func
 nv50_instmem = {
+	.dtor = nv50_instmem_dtor,
 	.fini = nv50_instmem_fini,
+	.suspend = nv04_instmem_suspend,
+	.resume = nv04_instmem_resume,
 	.memory_new = nv50_instobj_new,
 	.memory_wrap = nv50_instobj_wrap,
 	.zero = false,
 };
 
 int
-nv50_instmem_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
-		 struct nvkm_instmem **pimem)
+nv50_instmem_new_(const struct nvkm_instmem_func *func,
+		  struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		  struct nvkm_instmem **pimem)
 {
 	struct nv50_instmem *imem;
 
 	if (!(imem = kzalloc(sizeof(*imem), GFP_KERNEL)))
 		return -ENOMEM;
-	nvkm_instmem_ctor(&nv50_instmem, device, type, inst, &imem->base);
+	nvkm_instmem_ctor(func, device, type, inst, &imem->base);
 	INIT_LIST_HEAD(&imem->lru);
 	*pimem = &imem->base;
 	return 0;
 }
+
+int
+nv50_instmem_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		 struct nvkm_instmem **pimem)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
+	return nv50_instmem_new_(&nv50_instmem, device, type, inst, pimem);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index 390ca00ab567..95a83358aa7d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -7,6 +7,8 @@
 struct nvkm_instmem_func {
 	void *(*dtor)(struct nvkm_instmem *);
 	int (*oneinit)(struct nvkm_instmem *);
+	int (*suspend)(struct nvkm_instmem *);
+	void (*resume)(struct nvkm_instmem *);
 	void (*fini)(struct nvkm_instmem *);
 	u32  (*rd32)(struct nvkm_instmem *, u32 addr);
 	void (*wr32)(struct nvkm_instmem *, u32 addr, u32 data);
@@ -16,10 +18,16 @@ struct nvkm_instmem_func {
 	bool zero;
 };
 
+int nv50_instmem_new_(const struct nvkm_instmem_func *, struct nvkm_device *,
+		      enum nvkm_subdev_type, int, struct nvkm_instmem **);
+
 void nvkm_instmem_ctor(const struct nvkm_instmem_func *, struct nvkm_device *,
 		       enum nvkm_subdev_type, int, struct nvkm_instmem *);
 void nvkm_instmem_boot(struct nvkm_instmem *);
 
+int nv04_instmem_suspend(struct nvkm_instmem *);
+void nv04_instmem_resume(struct nvkm_instmem *);
+
 #include <core/memory.h>
 
 struct nvkm_instobj {
@@ -32,4 +40,6 @@ struct nvkm_instobj {
 void nvkm_instobj_ctor(const struct nvkm_memory_func *func,
 		       struct nvkm_instmem *, struct nvkm_instobj *);
 void nvkm_instobj_dtor(struct nvkm_instmem *, struct nvkm_instobj *);
+int nvkm_instobj_save(struct nvkm_instobj *);
+void nvkm_instobj_load(struct nvkm_instobj *);
 #endif
-- 
2.41.0

