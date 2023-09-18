Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB9B7A53F5
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8036310E327;
	Mon, 18 Sep 2023 20:22:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D50C10E326
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-68c576d35feso4554615b3a.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068576; x=1695673376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bF9V8kLUSibQTBGFALm5fhs6ScB4UyQZ35SaEGi9EP8=;
 b=bIcnlJ7uOPyDhpUhO8KYZgW3ImqCpA02sktLNVbxHIJ9Yo0O55nW3otOnzLZcExq3U
 lh2nogJfuGdPweIbc0UfSH6XP7Wa5CcIHI93A8+5VJI5tpl3I4mXjZ3ZY7N+3EsoRJS3
 s24Qm2K+3HuivI/Mp8GdCC0JSxttdcVJv0ZvOeIMVJ5qmCh7WZzc2jVita6eXewgwrLb
 T+Zxtvy3ToDcUt6F1adrzf6twWaUidnzuhlKu1nvvay6O+a3BZT+7eCyJhlTVNzMlJKp
 k+lDN7a1/N6XfG9S97IuDC2bSmUQPZShMl/tcAE+neA/diYkuMh/D920h643lWcDjCbo
 iLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068576; x=1695673376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bF9V8kLUSibQTBGFALm5fhs6ScB4UyQZ35SaEGi9EP8=;
 b=kkJDN0WqcEzBOCLP8F152HEF2yjbfUr3db3Fx6DttC74j7h3y7DEy1FhSrCV5XfHHk
 n2YEEPCl0nl7OfMLtFBOY3ERGyyvDyXr9uQ/eH3+G8f41m9hsqF/26taOMpi+JMii75x
 OPemTdMQsrD3uuAidAnyxwTS5Ljs2saJqrpjra5gwJ7nXikFLwmTQdi5RQHIXBBHZO1a
 D8tn5J9NtxgttMzOKz462UlDFujA4SWjBjRtzNvPFy4CHeH7H8V9khdX+SpUDDj8kcMn
 FgPnbDbXLQTEhe56GmziunUmGpTekrAM+73zTrZsUqwimek7n1YKkUDQ7/INbEhF7OL6
 CBFg==
X-Gm-Message-State: AOJu0Yz8R0YOwr4mThgZkR8/RwBj7kbF/TVHuT2CMXPRoqeiGdQFPDMt
 orfmJLK8ivobktGoPcCLvTIEJnuHyYM=
X-Google-Smtp-Source: AGHT+IGbhID3BH+Mw7dtYyew/2Gq/Uju1sDs64NGetYhxAzWG6P9X0V9kFoQ/U3VY30thyUFN+XbqA==
X-Received: by 2002:a05:6a00:139b:b0:690:41a1:9b6a with SMTP id
 t27-20020a056a00139b00b0069041a19b6amr13229105pfg.5.1695068576253; 
 Mon, 18 Sep 2023 13:22:56 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:55 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:29 +1000
Message-ID: <20230918202149.4343-25-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 24/44] drm/nouveau/disp/tu102-: prepare for GSP-RM
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
- pass "suspend" flag down to chipset-specific DISP code

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c  |  5 ++++-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h  | 11 ++++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c |  4 ++++
 7 files changed, 21 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 39f7e7ce9f4a..7356e20e5770 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -105,7 +105,7 @@ nvkm_disp_fini(struct nvkm_engine *engine, bool suspend)
 	struct nvkm_outp *outp;
 
 	if (disp->func->fini)
-		disp->func->fini(disp);
+		disp->func->fini(disp, suspend);
 
 	list_for_each_entry(outp, &disp->outps, head) {
 		if (outp->func->fini)
@@ -208,6 +208,9 @@ nvkm_disp_dtor(struct nvkm_engine *engine)
 		nvkm_head_del(&head);
 	}
 
+	if (disp->func->dtor)
+		disp->func->dtor(disp);
+
 	return data;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
index efe66ba3c61f..d632c09d962e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
@@ -24,6 +24,7 @@
 #include "head.h"
 #include "ior.h"
 
+#include <subdev/gsp.h>
 #include <subdev/timer.h>
 
 #include <nvif/class.h>
@@ -147,5 +148,8 @@ int
 ga102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_disp **pdisp)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_disp_new_(&ga102_disp, device, type, inst, pdisp);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
index b48ead31da30..83a1323600ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
@@ -1154,7 +1154,7 @@ gf119_disp_intr(struct nvkm_disp *disp)
 }
 
 void
-gf119_disp_fini(struct nvkm_disp *disp)
+gf119_disp_fini(struct nvkm_disp *disp, bool suspend)
 {
 	struct nvkm_device *device = disp->engine.subdev.device;
 	/* disable all interrupts */
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index e1634f7bca56..9fde83fe2e2f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -1115,7 +1115,7 @@ gv100_disp_intr(struct nvkm_disp *disp)
 }
 
 void
-gv100_disp_fini(struct nvkm_disp *disp)
+gv100_disp_fini(struct nvkm_disp *disp, bool suspend)
 {
 	struct nvkm_device *device = disp->engine.subdev.device;
 	nvkm_wr32(device, 0x611db0, 0x00000000);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 2d05e2f7e46b..03a5f88a4b99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1504,7 +1504,7 @@ nv50_disp_intr(struct nvkm_disp *disp)
 }
 
 void
-nv50_disp_fini(struct nvkm_disp *disp)
+nv50_disp_fini(struct nvkm_disp *disp, bool suspend)
 {
 	struct nvkm_device *device = disp->engine.subdev.device;
 	/* disable all interrupts */
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index ec5292a8f3c8..13ef71f428b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -15,9 +15,10 @@ int nvkm_disp_new_(const struct nvkm_disp_func *, struct nvkm_device *, enum nvk
 void nvkm_disp_vblank(struct nvkm_disp *, int head);
 
 struct nvkm_disp_func {
+	void (*dtor)(struct nvkm_disp *);
 	int (*oneinit)(struct nvkm_disp *);
 	int (*init)(struct nvkm_disp *);
-	void (*fini)(struct nvkm_disp *);
+	void (*fini)(struct nvkm_disp *, bool suspend);
 	void (*intr)(struct nvkm_disp *);
 	void (*intr_error)(struct nvkm_disp *, int chid);
 
@@ -32,7 +33,7 @@ struct nvkm_disp_func {
 
 	u16 ramht_size;
 
-	const struct nvkm_sclass root;
+	struct nvkm_sclass root;
 
 	struct nvkm_disp_user {
 		struct nvkm_sclass base;
@@ -44,7 +45,7 @@ struct nvkm_disp_func {
 
 int nv50_disp_oneinit(struct nvkm_disp *);
 int nv50_disp_init(struct nvkm_disp *);
-void nv50_disp_fini(struct nvkm_disp *);
+void nv50_disp_fini(struct nvkm_disp *, bool suspend);
 void nv50_disp_intr(struct nvkm_disp *);
 extern const struct nvkm_enum nv50_disp_intr_error_type[];
 void nv50_disp_super(struct work_struct *);
@@ -56,12 +57,12 @@ void nv50_disp_super_2_2(struct nvkm_disp *, struct nvkm_head *);
 void nv50_disp_super_3_0(struct nvkm_disp *, struct nvkm_head *);
 
 int gf119_disp_init(struct nvkm_disp *);
-void gf119_disp_fini(struct nvkm_disp *);
+void gf119_disp_fini(struct nvkm_disp *, bool suspend);
 void gf119_disp_intr(struct nvkm_disp *);
 void gf119_disp_super(struct work_struct *);
 void gf119_disp_intr_error(struct nvkm_disp *, int);
 
-void gv100_disp_fini(struct nvkm_disp *);
+void gv100_disp_fini(struct nvkm_disp *, bool suspend);
 void gv100_disp_intr(struct nvkm_disp *);
 void gv100_disp_super(struct work_struct *);
 int gv100_disp_wndw_cnt(struct nvkm_disp *, unsigned long *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index 19f5d3a6035e..02b6c9fcb973 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -25,6 +25,7 @@
 #include "ior.h"
 
 #include <core/gpuobj.h>
+#include <subdev/gsp.h>
 #include <subdev/timer.h>
 
 #include <nvif/class.h>
@@ -233,5 +234,8 @@ int
 tu102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_disp **pdisp)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_disp_new_(&tu102_disp, device, type, inst, pdisp);
 }
-- 
2.41.0

