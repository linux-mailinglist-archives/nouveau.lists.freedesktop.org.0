Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892EB79FEBF
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A41A10E520;
	Thu, 14 Sep 2023 08:47:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB8F10E523
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:03 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68fbbea0dfeso548441b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681223; x=1695286023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I4RPNy4ncGOrNY9zb5J2voUgKlfYJuHFnk3gb9UoEhI=;
 b=m6OkdqCFtBBPDCm5U9YcirPX9DdhFZ2OcBAjzEfaM5Maz8TVuuqIlBaX3Nfy29FY1H
 3H8wjgadPidUFaEpKTCbGyrxprE5CvOVMndm/WP4kxj8WUv516rvR9aSq1yiWCZWyTbX
 SUh8nnJsTxK8MktMrMXWFJJC/vMizEAuWa3swqexwYUpfzVj4UkZQdJ+qOa5lIqSvDLw
 qj09Nl/8G+Viva52O/xhp+zV8KxrUh6son7pGV2IrR09flM1NycyvJjMGDg9i1Ohq83+
 ODxyfhWYTcF4o7dyjMXL+HAPkzwnMc8ZdGmL1Xv+uT1BkFavus0P0+2XNSoXam29imF6
 t77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681223; x=1695286023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I4RPNy4ncGOrNY9zb5J2voUgKlfYJuHFnk3gb9UoEhI=;
 b=rCKl9CwgkNB32ucLwmRMDmQ4SAiwNBlAzWm+usSBYczxasOYJK5PzLEOQZgO9X+Kl3
 EJgN5G5JpfwGOXPfCiEkV/IhLDCiFEwAIp7ramqYh2kEFagaIGdhmCmdO+OnxLc3gwAX
 LZzOaw+9HdZWftgmA2stsGkjALJNNnHY2gz52yS+LZVO/wSTwnndIWQLB3rb8EOYL3oe
 f5I678sCviCEm5Z3uN5Ey/oTH01VqPOl3GnOnAG0dvvFZjbFlgYeW79E8tVRxYGO3PN4
 nVgWnar8Prmkej6H/TyZyi+7BgLePyBl0Vs5ov9Uqm/Vhf3oSv7QicJI7TxBxfiq3fZc
 KuzA==
X-Gm-Message-State: AOJu0YzTGI6tBtAo69Fxlf3o33HRooJO3y0qprfVwFyU8CnFKT4COOkl
 b5Ha/0p6tvkP5kIFYXADOhgao6aS48g=
X-Google-Smtp-Source: AGHT+IGA5hI/EfwZhYDFg+lzz2ol+RYqgEMsxmM5ciqkFt2ZCMwI7XIaRGXeMR39xcnXfDe8XSFXNg==
X-Received: by 2002:a05:6a00:b87:b0:68b:e710:ee9c with SMTP id
 g7-20020a056a000b8700b0068be710ee9cmr5755365pfj.19.1694681222904; 
 Thu, 14 Sep 2023 01:47:02 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:02 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:43 +1000
Message-ID: <20230914084624.2299765-4-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 02/44] drm/nouveau/imem: support allocations not
 preserved across suspend
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

Will initially be used to tag some large grctx allocations which don't
need to be saved, to speedup suspend/resume.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/core/memory.h    |  1 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/memory.c    | 15 +++++++++++++--
 .../drm/nouveau/nvkm/subdev/instmem/base.c    | 19 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  1 +
 5 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h b/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h
index d3b6a68ddda3..fc0f38981391 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/memory.h
@@ -12,6 +12,7 @@ struct nvkm_tags {
 };
 
 enum nvkm_memory_target {
+	NVKM_MEM_TARGET_INST_SR_LOST, /* instance memory - not preserved across suspend */
 	NVKM_MEM_TARGET_INST, /* instance memory */
 	NVKM_MEM_TARGET_VRAM, /* video memory */
 	NVKM_MEM_TARGET_HOST, /* coherent system memory */
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index fcdaefc99fe8..92a36ddfc29f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -26,7 +26,7 @@ struct nvkm_instmem {
 
 u32 nvkm_instmem_rd32(struct nvkm_instmem *, u32 addr);
 void nvkm_instmem_wr32(struct nvkm_instmem *, u32 addr, u32 data);
-int nvkm_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero,
+int nvkm_instobj_new(struct nvkm_instmem *, u32 size, u32 align, bool zero, bool preserve,
 		     struct nvkm_memory **);
 int nvkm_instobj_wrap(struct nvkm_device *, struct nvkm_memory *, struct nvkm_memory **);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/memory.c b/drivers/gpu/drm/nouveau/nvkm/core/memory.c
index c69daac9bac7..a705c2dfca80 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/memory.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/memory.c
@@ -140,12 +140,23 @@ nvkm_memory_new(struct nvkm_device *device, enum nvkm_memory_target target,
 {
 	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_memory *memory;
+	bool preserve = true;
 	int ret;
 
-	if (unlikely(target != NVKM_MEM_TARGET_INST || !imem))
+	if (unlikely(!imem))
 		return -ENOSYS;
 
-	ret = nvkm_instobj_new(imem, size, align, zero, &memory);
+	switch (target) {
+	case NVKM_MEM_TARGET_INST_SR_LOST:
+		preserve = false;
+		break;
+	case NVKM_MEM_TARGET_INST:
+		break;
+	default:
+		return -ENOSYS;
+	}
+
+	ret = nvkm_instobj_new(imem, size, align, zero, preserve, &memory);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
index e0e4f97be029..24886eabe8dc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
@@ -94,15 +94,21 @@ nvkm_instobj_wrap(struct nvkm_device *device,
 		  struct nvkm_memory *memory, struct nvkm_memory **pmemory)
 {
 	struct nvkm_instmem *imem = device->imem;
+	int ret;
 
 	if (!imem->func->memory_wrap)
 		return -ENOSYS;
 
-	return imem->func->memory_wrap(imem, memory, pmemory);
+	ret = imem->func->memory_wrap(imem, memory, pmemory);
+	if (ret)
+		return ret;
+
+	container_of(*pmemory, struct nvkm_instobj, memory)->preserve = true;
+	return 0;
 }
 
 int
-nvkm_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero,
+nvkm_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero, bool preserve,
 		 struct nvkm_memory **pmemory)
 {
 	struct nvkm_subdev *subdev = &imem->subdev;
@@ -130,6 +136,7 @@ nvkm_instobj_new(struct nvkm_instmem *imem, u32 size, u32 align, bool zero,
 		nvkm_done(memory);
 	}
 
+	container_of(memory, struct nvkm_instobj, memory)->preserve = preserve;
 done:
 	if (ret)
 		nvkm_memory_unref(&memory);
@@ -176,9 +183,11 @@ nvkm_instmem_fini(struct nvkm_subdev *subdev, bool suspend)
 
 	if (suspend) {
 		list_for_each_entry(iobj, &imem->list, head) {
-			int ret = nvkm_instobj_save(iobj);
-			if (ret)
-				return ret;
+			if (iobj->preserve) {
+				int ret = nvkm_instobj_save(iobj);
+				if (ret)
+					return ret;
+			}
 		}
 
 		nvkm_bar_bar2_fini(subdev->device);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
index fe92986a3885..390ca00ab567 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/priv.h
@@ -25,6 +25,7 @@ void nvkm_instmem_boot(struct nvkm_instmem *);
 struct nvkm_instobj {
 	struct nvkm_memory memory;
 	struct list_head head;
+	bool preserve;
 	u32 *suspend;
 };
 
-- 
2.41.0

