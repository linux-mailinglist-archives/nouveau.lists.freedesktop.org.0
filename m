Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD766BBF648
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871DC10E53A;
	Mon,  6 Oct 2025 20:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VyiXNkCy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FA210E450
 for <nouveau@lists.freedesktop.org>; Mon,  6 Oct 2025 19:14:16 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso35470815e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 06 Oct 2025 12:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778054; x=1760382854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1j0V90HxcPRVTKrhHkvxSsBjf2AtjVnHy6SmuJWd4uc=;
 b=VyiXNkCyI/ruPOOUtrfyqjZysCapCeA+OHMxG2fG9V9EIqbs1uWHYZpwXjCBJXSdyG
 zZskBgVLoG2s/cEx512jk/iQqKDwKRR7prOQuwokWMtFCR8hrfiGLDKWtcd8MFRUnBHY
 0xYtpbUcVrS6g6ueB8X1f72+yB+nRopktv31s3SfU4GA7K7AYFLVKxxpwN6f+nS7l9qL
 2adJSsYtDMO6GTtApMmw5zhnDAwFoIUB7WT7cBN2MBt9BUYBCfqzD0Rhl+NLiGC2bIT1
 thQXUaRRDuyLPbDeB+b7IicGxJhmjWxUUm64g0iqvTou7XOcg62v+plSqJ/C6V3Fu9WA
 atCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778054; x=1760382854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1j0V90HxcPRVTKrhHkvxSsBjf2AtjVnHy6SmuJWd4uc=;
 b=Tr8dsr4s6OIqdvFNUoUe4XFKoZewh+Uf0Eiv5lvWJFmEqWSmaqNdbqUbCZGCoZkuXE
 m43v7WEfnmV8kfZW38F0CrgBC/2/jyw0oYq7ZYHaWI8qgKrF7FmzfO4g/U6kG3sycfml
 LdRupHdyexJJay+lmCFT4LNh6vV+LSGG2NTE8y6Si0C4tQd8JDXKwAeTONL9zQrxC/uF
 sak3EPos0rxqny7tU9TcjHWfiUW+iUa4/JJ7MqThtuWTTn5xHEOH4ceIaBAmKbyCyQpF
 2PnIW44HGHkbFAL4uB13wlMw5+u0Edcqrijw/5uFsjcuY72COhGz5l3tYPw7BTNKWgJK
 PkXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGvJSSQvAugeYd1ImNnb7Qcu2GC3fkqpA8aAvHxewD1G95PPUI+1opDzn5/lt0MaGuxKEPSu74@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwE3KsfEwPYK2ZPENQB8fDGXpGMCLbqgS+b0uWQGsmUejXra8ww
 jqEg9tR8UKJ49u1EtuWbHBnmVmVpjExXrXlxYRDHPxS3jFbIWdhwJQoG
X-Gm-Gg: ASbGncsTWRDElB5uZ3PQ+AvD64OMZpld/W8USBjYsYRiT2LvZA3j0/E2KK2iKCQr1NR
 PPqQOuv/NCbTMW1jHMF7BVbSc2Tq8981WeYHT5iIh2Kjru6OoCyyBnCeDq3lRrL2bbh50Oon8gv
 dvTq7jieZiToOz4tk8Wn8s6B15gw+iC6NoLaALJ23xg40Ras4Fewmlxdl2h/6x//1N+3/4WUy6I
 kDsvqDCnR4v7i+lT6aU+nohhx4eDk8P8vPOZnaUWmlO6HwdA5yqAEKjZXCeYHbF7tGCGyq06feG
 91rG9iCFwBOSrdkWXH+PewPLQLmlbmY0PJYdXsF8Sfc9nbxyjf6dzcHTWYVnx9b6UC2BbX+pI/g
 ZmJCTn1Hbn2Zx/33rHZvLmNkG7mLNNPx4L6Ak7K1iFgMx3uo544vrV3cJ0HGrkoJEw1dT+AGYTM
 r8C6M=
X-Google-Smtp-Source: AGHT+IFUbfCqi9C93YR2bP5dtsE3l+2iS9CguomaGDGXJEXk2nSHZJBr5r0pl0Mosg68LCW/bIjt9A==
X-Received: by 2002:a05:6000:1842:b0:3c8:7fbf:2d6d with SMTP id
 ffacd0b85a97d-425671b28ecmr7651955f8f.50.1759778054388; 
 Mon, 06 Oct 2025 12:14:14 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:14:13 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Subject: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
Date: Mon,  6 Oct 2025 22:13:25 +0300
Message-ID: <20251006191329.277485-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Oct 2025 20:49:11 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Mary Guillemard <mary@mary.zone>

Now that everything in UVMM knows about the variable page shift, we can
select larger values.

The proposed approach rely on nouveau_bo::page unless it would cause
alignment issues (in which case we fall back to searching an appropriate
shift)

Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 55 +++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index a92c729600d6..c336a121e320 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -454,6 +454,56 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
 	drm_gpuva_insert(va->vm, va);
 }
 
+static bool
+op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
+{
+	u64 page_size = 1ULL << page_shift;
+
+	return op->va.addr % page_size == 0 && op->va.range % page_size == 0 &&
+		   op->gem.offset % page_size == 0;
+}
+
+static u8
+select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
+
+	if (nvbo) {
+		/* If the BO preferred page shift already fits, use it. */
+		if (op_map_aligned_to_page_shift(op, nvbo->page))
+			return nvbo->page;
+
+		struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
+		struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+		int i;
+
+		/* Otherwise let's find a granuality that will fit. */
+		for (i = 0; i < vmm->page_nr; i++) {
+			/* Ignore anything that is bigger or identical to the BO preference. */
+			if (vmm->page[i].shift >= nvbo->page)
+				continue;
+
+			/* Skip incompatible domains. */
+			if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
+				continue;
+			if ((mem->mem.type & NVIF_MEM_HOST) &&
+			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+				continue;
+
+			/* If it fits, return the proposed shift. */
+			if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
+				return vmm->page[i].shift;
+		}
+
+		/* If we get here then nothing can reconcile the requirements. This should never
+		 * happen.
+		 */
+		WARN_ON(1);
+	}
+
+	return PAGE_SHIFT;
+}
+
 static void
 nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			       struct nouveau_uvma_prealloc *new,
@@ -506,7 +556,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
 						     vmm_get_range,
-						     PAGE_SHIFT);
+						     select_page_shift(uvmm, &op->map));
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -636,7 +686,8 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 		case DRM_GPUVA_OP_MAP: {
 			u64 vmm_get_range = vmm_get_end - vmm_get_start;
 
-			ret = op_map_prepare(uvmm, &new->map, &op->map, args, PAGE_SHIFT);
+			ret = op_map_prepare(uvmm, &new->map, &op->map, args,
+					     select_page_shift(uvmm, &op->map));
 			if (ret)
 				goto unwind;
 
-- 
2.51.0

