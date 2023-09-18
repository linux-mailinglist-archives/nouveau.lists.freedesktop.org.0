Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E657A53FA
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE7210E322;
	Mon, 18 Sep 2023 20:23:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07C910E32D
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:07 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68fdd6011f2so3682980b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068587; x=1695673387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7iDsZRuXeYrSpCAi/gvyAS50C7GMjmVC6AMYPEpuePc=;
 b=BSw7WGN/GZRaJ6dhpeQ/1kx3HHiBEm71rx5lGE1Cn/lALta8zfQziE6reiH2xx61cl
 8n2sKNNsJaQSe2UoDc3Gm2XeKVxm40xaEXTN21qll3od4QovN0v7Ba2XKjCSIDb/SnSg
 J0Wfjll+AK2pArppDfSwAVr4rq8teH1yVhV5kkt7Izz+Wcy5W/sRAQWW2qKv4YdQ8CqD
 w/p6OZkIrNR6dPvnCRlUfv/dqkkKEBqhQM6HUM1gZyTSXYOMbZl85x/HOwsyAChxhy/h
 BBXpof6mgEjyVRyKmBJTy5MmMpR00rAxpgI8enYDhc0ratlh4ik6n/xWHJQUTqdlpoJi
 6RhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068587; x=1695673387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7iDsZRuXeYrSpCAi/gvyAS50C7GMjmVC6AMYPEpuePc=;
 b=fx5AHu+zobfhUkt+ljoqm9nC/t+089f8Y8mqyI8YHnJQY93gsOiuFDnRqBUl2fdx+r
 XKB+lOKlDmUDCsLS0AnCQ4R+eqFSl9Cvl4gqmJRLvPVHssdvWUgbQylLpfiPs44nrEhA
 32aVXDMAvZ5iiLnughdice36OxWZRy/G9pgiOc4EXFklY8VYqAn2v1ATREfqZObANGyg
 IKV5V8ZUvcL7cRDT4nfe65nxL9CQYHRhQzWbKdIUiL/ADAVpBF7XSUWG9tN+MjHNCB/7
 Q1l5aP1c9dbRiWh5CLeRJjbOX0/TJxb5pN2gqZhp9cEUwTgXW0tZjA6qJojRFxf/jpZO
 eszQ==
X-Gm-Message-State: AOJu0YxdbAfiRaimuLcvFcKS17C0tgrvQ3xiwcqg1MlNsc1g7+KrPvna
 m0wCNJf86P4gSWYmMIgb421WVk2Z0Lg=
X-Google-Smtp-Source: AGHT+IEY/M7HkWIqBNGfv4MwSCwIrDRs8ti+5wabmVctsNE7EFJ10YO4fOtR9AZ8r2SKy+sZgNJOUA==
X-Received: by 2002:a05:6a00:a1f:b0:68f:e810:e87e with SMTP id
 p31-20020a056a000a1f00b0068fe810e87emr11097374pfh.31.1695068587021; 
 Mon, 18 Sep 2023 13:23:07 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:06 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:34 +1000
Message-ID: <20230918202149.4343-30-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 29/44] drm/nouveau/sec2/tu102-: prepare for GSP-RM
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

- add (initial) R535 implementation of SEC2, needed for boot

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/sec2/Kbuild   |  2 +
 .../gpu/drm/nouveau/nvkm/engine/sec2/ga102.c  |  8 ++-
 .../gpu/drm/nouveau/nvkm/engine/sec2/priv.h   |  3 ++
 .../gpu/drm/nouveau/nvkm/engine/sec2/r535.c   | 54 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/sec2/tu102.c  |  8 ++-
 5 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild
index 19feadb1f67b..b43b7e5e2733 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/Kbuild
@@ -4,3 +4,5 @@ nvkm-y += nvkm/engine/sec2/gp102.o
 nvkm-y += nvkm/engine/sec2/gp108.o
 nvkm-y += nvkm/engine/sec2/tu102.o
 nvkm-y += nvkm/engine/sec2/ga102.o
+
+nvkm-y += nvkm/engine/sec2/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c
index 945abb8156d7..54be7596b046 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/ga102.c
@@ -21,6 +21,7 @@
  */
 #include "priv.h"
 #include <subdev/acr.h>
+#include <subdev/gsp.h>
 #include <subdev/vfn.h>
 
 #include <nvfw/flcn.h>
@@ -193,5 +194,10 @@ ga102_sec2_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	/* TOP info wasn't updated on Turing to reflect the PRI
 	 * address change for some reason.  We override it here.
 	 */
-	return nvkm_sec2_new_(ga102_sec2_fwif, device, type, inst, 0x840000, psec2);
+	const u32 addr = 0x840000;
+
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_sec2_new(&ga102_sec2, device, type, inst, addr, psec2);
+
+	return nvkm_sec2_new_(ga102_sec2_fwif, device, type, inst, addr, psec2);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h
index 172d2705c199..e158a40a4f09 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/priv.h
@@ -4,6 +4,9 @@
 #include <engine/sec2.h>
 struct nvkm_acr_lsfw;
 
+int r535_sec2_new(const struct nvkm_sec2_func *,
+		  struct nvkm_device *, enum nvkm_subdev_type, int, u32 addr, struct nvkm_sec2 **);
+
 struct nvkm_sec2_func {
 	const struct nvkm_falcon_func *flcn;
 	u8 unit_unload;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c
new file mode 100644
index 000000000000..83a6bad5967e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c
@@ -0,0 +1,54 @@
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
+r535_sec2_dtor(struct nvkm_engine *engine)
+{
+	struct nvkm_sec2 *sec2 = nvkm_sec2(engine);
+
+	nvkm_falcon_dtor(&sec2->falcon);
+	return sec2;
+}
+
+static const struct nvkm_engine_func
+r535_sec2 = {
+	.dtor = r535_sec2_dtor,
+};
+
+int
+r535_sec2_new(const struct nvkm_sec2_func *func, struct nvkm_device *device,
+	      enum nvkm_subdev_type type, int inst, u32 addr, struct nvkm_sec2 **psec2)
+{
+	struct nvkm_sec2 *sec2;
+	int ret;
+
+	if (!(sec2 = *psec2 = kzalloc(sizeof(*sec2), GFP_KERNEL)))
+		return -ENOMEM;
+
+	ret = nvkm_engine_ctor(&r535_sec2, device, type, inst, true, &sec2->engine);
+	if (ret)
+		return ret;
+
+	return nvkm_falcon_ctor(func->flcn, &sec2->engine.subdev, sec2->engine.subdev.name,
+				addr, &sec2->falcon);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c
index 0afc4b2fa529..20452046d7d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sec2/tu102.c
@@ -21,6 +21,7 @@
  */
 #include "priv.h"
 #include <subdev/acr.h>
+#include <subdev/gsp.h>
 
 #include <nvfw/sec2.h>
 
@@ -82,5 +83,10 @@ tu102_sec2_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	/* TOP info wasn't updated on Turing to reflect the PRI
 	 * address change for some reason.  We override it here.
 	 */
-	return nvkm_sec2_new_(tu102_sec2_fwif, device, type, inst, 0x840000, psec2);
+	const u32 addr = 0x840000;
+
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_sec2_new(&tu102_sec2, device, type, inst, addr, psec2);
+
+	return nvkm_sec2_new_(tu102_sec2_fwif, device, type, inst, addr, psec2);
 }
-- 
2.41.0

