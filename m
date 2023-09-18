Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCEB7A5389
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEB410E30B;
	Mon, 18 Sep 2023 20:14:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E3510E2E2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:26 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c43166b7e5so32102275ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068065; x=1695672865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tA9Rq6K5OfQT0EdObD3Qlqg220poINlz9M7btRQSDzk=;
 b=AWSE3dcOal/i52VLTJSIulPLVnLrYBA9hv2AHLFB+1Whm2jDlVvQndcQYR8Vooe7VX
 u0ga/VoRITTrJ+j1VZ2xiZOnYnsYJNtogTYsGDJMNDaEhTP7zPXNd1aSXGvwCk6bNzD0
 ordz0/KtsscJ5piXYTYNvGdib94HL8krAc6T9KcVqr9HP+hADyhnQ+heuy3S+efMV+ej
 aKDmz6h1kxFH+1gogRFePYxxAZweBlXW/AXSKo7uSJCmiZpk82UyoSfczFp8jDizCNex
 qwxB1jH7m9gBXt8k6fd2mD5RHKbqQw5d0CTYNeVrReUQkRbOpFqWSjNQoDBgwho+fBk7
 9vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068065; x=1695672865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tA9Rq6K5OfQT0EdObD3Qlqg220poINlz9M7btRQSDzk=;
 b=TZZAeABd3dCQE3fLPE1C4z04KN6zto6wYVnq5xqh7oPpwpwUTv88aO/qjhLA8m0oBB
 m8E1Kk6iiJG2b7xf/g1YCtLxTVhJrI0+BhHgA/vTed57SvCQS9Unu+k/Huoo7FuD12Ol
 yWJgva6aT1E36yo26ZJlPD3B+QnCGkf4ybqgMrK7hLhCWMho0897E0GQJqrQ1OhlwUgC
 fX8p6lDt4l0Y7BUmxR3CEqbfk+0bm9xikCzlCxGDneotybmWi68OX3af6NsDk51CyElP
 ZdAXzVUKhJAsUOdopisxUa+ARXGWzHxLbLGyGbkuYlradYRAO8j9hQKEAG1hKYrbf4TR
 BxEw==
X-Gm-Message-State: AOJu0Yw6ToZVqy63U6PYc4QmdQBRz9Zsl6REAsH+6ofajQrjoKCDTZ7f
 Mw3yEPV4ThAV2PNAPHKeCaPpyUEegoM=
X-Google-Smtp-Source: AGHT+IHj80vXuv//cB16glJKm+PY8MQXEONMTIH9gKuQ6OyBlbf81w6HnYK8PG1H2UH/fOxFU2mJSQ==
X-Received: by 2002:a17:902:dacb:b0:1c4:3ae6:381a with SMTP id
 q11-20020a170902dacb00b001c43ae6381amr12813876plx.0.1695068065523; 
 Mon, 18 Sep 2023 13:14:25 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:25 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:22 +1000
Message-ID: <20230918201404.3765-3-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 02/44] drm/nouveau/imem: support allocations
 not preserved across suspend
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

