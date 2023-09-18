Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB3D7A53F3
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C69910E323;
	Mon, 18 Sep 2023 20:22:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D174910E31E
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:52 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68fb98745c1so3686905b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068572; x=1695673372; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YF8WzdGn7g2YuOB34nREIRKdKycQ/JTIwks9E58vbRo=;
 b=CmMwryl4sozNxkkgPTdyxfaIorOS/BL8b/+f5VVp0/RDjSGD0fWeLFB8lRB/OR7otE
 dgYE/ugcNVuck5OkXuUYGvS8prQB79KzjFuIKeWBCOkAv8DyScp9dHUs/AWKZ1rWQnr4
 c+u4R3tdbWXF9UjDcZOiGJEFk7un34RmWbQJMeoHv1qx/qQLl2Rk3ba3Lpjl+fO01IPm
 msATxFg5fc57H3N5ywIxk7XmtzP7m+ibKZVtueO2gS0uLwJpH8GiD3oRexKAhwRLUQrp
 6JzjwXtJ9kaTaPIwiIo0AxGgNTOfvNuRRe7TtabCcbxppJFHuRtBeIgyL594GYc1BfKq
 ueUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068572; x=1695673372;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YF8WzdGn7g2YuOB34nREIRKdKycQ/JTIwks9E58vbRo=;
 b=YqzbT6VeQD3DV8C4pjlUl1ndi9Kp83VqLQIlTgBEZZst+34mDLgQ60mWOTt2rwO2C8
 QX/SbBKzEbOiLGRa48VcyaulTmAqcQOOxK7+/6BrRQLj2blQ+ZvZLj3vmDGxxx6di24o
 cQRYbNcoTWaRo3bRqSZC9wzztf/6+PG3MP7xeYj8nNcPHYpNalFXAYu17IIXqrND+7+0
 AY8H2lHxjnl+2/5wZ3ml+w5h9aYWAmUgGc8LE3iLEgzaOSj2ByVUKG9YdfM2wmeB3DNS
 wgJooohs7zZLl0XLY0iZQjJC4T5zLhbjvzqD8wCjYVD3dHeSIb0rqsjXiSkZktSijDZe
 iF9g==
X-Gm-Message-State: AOJu0Yy/umdln09cQKN/OGrBzYcSmS6YjQ5/1tzTJVPnWcqOP3YCkNWh
 P1g21XazrJV4EpfsveGcMmMgTvCupDU=
X-Google-Smtp-Source: AGHT+IHMHHATDavwQVhBVrImhD+zphEdyq2NDC5KHdxyjn5d/A5N9dquOCK/qb0NTwlGDz040uCR+A==
X-Received: by 2002:a05:6a00:2284:b0:68e:4605:a8d3 with SMTP id
 f4-20020a056a00228400b0068e4605a8d3mr10158607pfe.29.1695068571927; 
 Mon, 18 Sep 2023 13:22:51 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:51 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:27 +1000
Message-ID: <20230918202149.4343-23-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 22/44] drm/nouveau/vfn/tu102-: prepare for GSP-RM
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

- add R535 implementation of VFN, minus interrupt table

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild    |  2 +
 .../gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c   |  5 ++
 .../gpu/drm/nouveau/nvkm/subdev/vfn/priv.h    |  7 ++-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/r535.c    | 50 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c   |  5 ++
 5 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild
index 23cd21b40a25..23a85460615f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild
@@ -4,3 +4,5 @@ nvkm-y += nvkm/subdev/vfn/uvfn.o
 nvkm-y += nvkm/subdev/vfn/gv100.o
 nvkm-y += nvkm/subdev/vfn/tu102.o
 nvkm-y += nvkm/subdev/vfn/ga100.o
+
+nvkm-y += nvkm/subdev/vfn/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c
index fd5c6931322d..bb0bb6fda54b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 #include <nvif/class.h>
 
 static const struct nvkm_intr_data
@@ -43,5 +45,8 @@ int
 ga100_vfn_new(struct nvkm_device *device,
 	      enum nvkm_subdev_type type, int inst, struct nvkm_vfn **pvfn)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_vfn_new(&ga100_vfn, device, type, inst, 0xb80000, pvfn);
+
 	return nvkm_vfn_new_(&ga100_vfn, device, type, inst, 0xb80000, pvfn);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
index 96d53c02041b..3a09781ad032 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/priv.h
@@ -5,16 +5,21 @@
 #include <subdev/vfn.h>
 
 struct nvkm_vfn_func {
+	void (*dtor)(struct nvkm_vfn *);
+
 	const struct nvkm_intr_func *intr;
 	const struct nvkm_intr_data *intrs;
 
 	struct {
 		u32 addr;
 		u32 size;
-		const struct nvkm_sclass base;
+		struct nvkm_sclass base;
 	} user;
 };
 
+int r535_vfn_new(const struct nvkm_vfn_func *hw, struct nvkm_device *, enum nvkm_subdev_type, int,
+		 u32 addr, struct nvkm_vfn **);
+
 int nvkm_vfn_new_(const struct nvkm_vfn_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  u32 addr, struct nvkm_vfn **);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
new file mode 100644
index 000000000000..dce337306cab
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
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
+static void
+r535_vfn_dtor(struct nvkm_vfn *vfn)
+{
+	kfree(vfn->func);
+}
+
+int
+r535_vfn_new(const struct nvkm_vfn_func *hw,
+	     struct nvkm_device *device, enum nvkm_subdev_type type, int inst, u32 addr,
+	     struct nvkm_vfn **pvfn)
+{
+	struct nvkm_vfn_func *rm;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_vfn_dtor;
+	rm->intr = hw->intr;
+	rm->user = hw->user;
+
+	ret = nvkm_vfn_new_(rm, device, type, inst, addr, pvfn);
+	if (ret)
+		kfree(rm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c
index 3d063fb5e136..a3bf13c5c79b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 #include <nvif/class.h>
 
 static void
@@ -104,5 +106,8 @@ int
 tu102_vfn_new(struct nvkm_device *device,
 	      enum nvkm_subdev_type type, int inst, struct nvkm_vfn **pvfn)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_vfn_new(&tu102_vfn, device, type, inst, 0xb80000, pvfn);
+
 	return nvkm_vfn_new_(&tu102_vfn, device, type, inst, 0xb80000, pvfn);
 }
-- 
2.41.0

