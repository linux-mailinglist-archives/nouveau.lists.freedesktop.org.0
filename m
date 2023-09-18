Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED47A53FC
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC5010E32E;
	Mon, 18 Sep 2023 20:23:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C8410E332
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:12 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-68fb46f38f9so4293148b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068591; x=1695673391; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+n6j7pcIceqx6uea17gTIKtzesxqyGCEzN0VV8Lud8I=;
 b=VxqDoQAXPhNWsACVnfzDqoeG4CmJfBUUZfirJ/+mJI/g3LAq6LkCHC4q45KD66u65A
 hJBxX1ToT1QvlzX7mBy3UtULh8ai4iCyF2S0E8tp1HsF34sYZeuyRdBAE29wyga3/KqZ
 2w7h6Z+U7NOp/OKoZ4Pgc5yzqjfIGkqghHQ3vDMmVqFpEkozhoBvzLr2gRl8Q6BpPJnM
 nioc08g5weNkqHlL6BvXl+pgLHklbCZALDQAIAd2XkiPCRhbN5iu+BUMgD22Hh1en9HY
 1wa+3DL9FklRfCK4MqVRk2qtafIo0i/2qHJNP81lYFCcuvdBik31zipy5/eixIWu0od7
 NEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068591; x=1695673391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+n6j7pcIceqx6uea17gTIKtzesxqyGCEzN0VV8Lud8I=;
 b=KfPiW5rh8bkxDBLqjLTtA/p8GEDzVadl9OxCQHlM9fZ4yrNzatrIxaPC2n3ueZ8OYM
 bTjnqQ73nzV7XuTiZXRWICIDcV9vCq+Vu0QFiKhhq6CrGR5etQTBhFdV9w0OXerXZdCP
 vjvdor7JtsxEy+bcvX49OJEcpDdU+37p0CIsUKNMY9cUqKENe2aCg1tLFqHGpquAiRJd
 gz7+1ve2trjpDB1NJtkIjGgIEnvG+JRjL7bF42JgdbuFAkc4PZp67vxMOaq3MOZj5GpJ
 M+VCOhh6LgonEnzOWMQN0nOfsrBGWx6kChfqc1clvE2cBqyl2lfJ1Ke42H9Pxg6l9ayQ
 02ag==
X-Gm-Message-State: AOJu0YyYjDrJIXdRKt5oTUsJ/iwuL0t0jukx98Y6MsF7wQ5RqV/Ynb32
 gYDZgVFK7jArSg/TJJtD4lKByEDKLMA=
X-Google-Smtp-Source: AGHT+IGwvl46GMeo9zINFORTOQdEddpuniM8wc230jD0ihjb+galXHc2dr8wOo7Om8qc7/ZxvEuBYA==
X-Received: by 2002:a05:6a20:13cb:b0:140:c838:2b2e with SMTP id
 ho11-20020a056a2013cb00b00140c8382b2emr7985637pzc.22.1695068591421; 
 Mon, 18 Sep 2023 13:23:11 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:11 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:36 +1000
Message-ID: <20230918202149.4343-32-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 31/44] drm/nouveau/nvkm: support loading fws into
 sg_table
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

- preparation for GSP-RM, which has massive FW images
- based on a patch by Dave Airlie

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../drm/nouveau/include/nvkm/core/firmware.h  |  6 +-
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c  | 74 ++++++++++++++++++-
 2 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h b/drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h
index d4e507e252b1..20839be72644 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/firmware.h
@@ -10,6 +10,7 @@ struct nvkm_firmware {
 		enum nvkm_firmware_type {
 			NVKM_FIRMWARE_IMG_RAM,
 			NVKM_FIRMWARE_IMG_DMA,
+			NVKM_FIRMWARE_IMG_SGT,
 		} type;
 	} *func;
 	const char *name;
@@ -21,7 +22,10 @@ struct nvkm_firmware {
 
 	struct nvkm_firmware_mem {
 		struct nvkm_memory memory;
-		struct scatterlist sgl;
+		union {
+			struct scatterlist sgl; /* DMA */
+			struct sg_table sgt;	/* SGT */
+		};
 	} mem;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index 91fb494d4009..4641e7eebe56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -113,6 +113,22 @@ nvkm_firmware_put(const struct firmware *fw)
 
 #define nvkm_firmware_mem(p) container_of((p), struct nvkm_firmware, mem.memory)
 
+static struct scatterlist *
+nvkm_firmware_mem_sgl(struct nvkm_memory *memory)
+{
+	struct nvkm_firmware *fw = nvkm_firmware_mem(memory);
+
+	switch (fw->func->type) {
+	case NVKM_FIRMWARE_IMG_DMA: return &fw->mem.sgl;
+	case NVKM_FIRMWARE_IMG_SGT: return  fw->mem.sgt.sgl;
+	default:
+		WARN_ON(1);
+		break;
+	}
+
+	return NULL;
+}
+
 static int
 nvkm_firmware_mem_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *vmm,
 		      struct nvkm_vma *vma, void *argv, u32 argc)
@@ -121,10 +137,10 @@ nvkm_firmware_mem_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *v
 	struct nvkm_vmm_map map = {
 		.memory = &fw->mem.memory,
 		.offset = offset,
-		.sgl = &fw->mem.sgl,
+		.sgl = nvkm_firmware_mem_sgl(memory),
 	};
 
-	if (WARN_ON(fw->func->type != NVKM_FIRMWARE_IMG_DMA))
+	if (!map.sgl)
 		return -ENOSYS;
 
 	return nvkm_vmm_map(vmm, vma, argv, argc, &map);
@@ -133,12 +149,15 @@ nvkm_firmware_mem_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *v
 static u64
 nvkm_firmware_mem_size(struct nvkm_memory *memory)
 {
-	return sg_dma_len(&nvkm_firmware_mem(memory)->mem.sgl);
+	struct scatterlist *sgl = nvkm_firmware_mem_sgl(memory);
+
+	return sgl ? sg_dma_len(sgl) : 0;
 }
 
 static u64
 nvkm_firmware_mem_addr(struct nvkm_memory *memory)
 {
+	BUG_ON(nvkm_firmware_mem(memory)->func->type != NVKM_FIRMWARE_IMG_DMA);
 	return nvkm_firmware_mem(memory)->phys;
 }
 
@@ -189,6 +208,12 @@ nvkm_firmware_dtor(struct nvkm_firmware *fw)
 		nvkm_memory_unref(&memory);
 		dma_free_coherent(fw->device->dev, sg_dma_len(&fw->mem.sgl), fw->img, fw->phys);
 		break;
+	case NVKM_FIRMWARE_IMG_SGT:
+		nvkm_memory_unref(&memory);
+		dma_unmap_sgtable(fw->device->dev, &fw->mem.sgt, DMA_TO_DEVICE, 0);
+		sg_free_table(&fw->mem.sgt);
+		vfree(fw->img);
+		break;
 	default:
 		WARN_ON(1);
 		break;
@@ -226,6 +251,49 @@ nvkm_firmware_ctor(const struct nvkm_firmware_func *func, const char *name,
 		sg_dma_len(&fw->mem.sgl) = len;
 	}
 		break;
+	case NVKM_FIRMWARE_IMG_SGT:
+		len = ALIGN(fw->len, PAGE_SIZE);
+
+		fw->img = vmalloc(len);
+		if (fw->img) {
+			int pages = len >> PAGE_SHIFT;
+			int ret = 0;
+
+			memcpy(fw->img, src, fw->len);
+
+			ret = sg_alloc_table(&fw->mem.sgt, pages, GFP_KERNEL);
+			if (ret == 0) {
+				struct scatterlist *sgl;
+				u8 *data = fw->img;
+				int i;
+
+				for_each_sgtable_sg(&fw->mem.sgt, sgl, i) {
+					struct page *page = vmalloc_to_page(data);
+
+					if (!page) {
+						ret = -EFAULT;
+						break;
+					}
+
+					sg_set_page(sgl, page, PAGE_SIZE, 0);
+					data += PAGE_SIZE;
+				}
+
+				if (ret == 0) {
+					ret = dma_map_sgtable(fw->device->dev, &fw->mem.sgt,
+							      DMA_TO_DEVICE, 0);
+				}
+
+				if (ret)
+					sg_free_table(&fw->mem.sgt);
+			}
+
+			if (ret) {
+				vfree(fw->img);
+				fw->img = NULL;
+			}
+		}
+		break;
 	default:
 		WARN_ON(1);
 		return -EINVAL;
-- 
2.41.0

