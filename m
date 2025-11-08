Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC8C43425
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 20:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568BC10E1FD;
	Sat,  8 Nov 2025 19:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="a70E0u4k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921B710E1FD
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 19:49:59 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-477770019e4so4830095e9.3
 for <nouveau@lists.freedesktop.org>; Sat, 08 Nov 2025 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762631398; x=1763236198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tC6CcFDtB9h0jZt5MH9nV4+dpNMBEY/OO1REMIcE6dc=;
 b=a70E0u4kL6GiNTjKIEpo2qN3zvZVZp5mllkwyyUxP+mq8IrIF91KfsiFMiNXDmt4Qb
 sdMYgD3fnCmdjtD4Em251QaHia9pX2fow1w+UWIvVVD7lxYVSymidhBdZ+T6XGIYy94L
 szD8o7KzTI1mEYOQUY+u5eWK4UXlgNpZL9ik5AS9HprriaoCQN8Siv7zVwAtD17Z05T6
 fXY+mvUY2nAhmLx5uV1KWICznV86bKLkWP2/5XXuIiOHJZQyQccKA4X0CuZZt84PUJn0
 pOqeg9ynhKFQaJFlgTU53/P27xXDX5V1395yJXXmZGQQmeN4b1ktND2STsgvsxtzUBpZ
 kttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762631398; x=1763236198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tC6CcFDtB9h0jZt5MH9nV4+dpNMBEY/OO1REMIcE6dc=;
 b=lzOuaMoOxpR8HOGS5JrKfe8Zc4enxqtkEFnIhChJErfwY3na32Tz0MILrs8rkqkMlO
 WFmUCc8C//PnaG9pR5CsRizM3W+0jBxxGSIIbbDlBhHB97mDGeWyTggKMjt9Cy1ceZvF
 1HK8U3IfJ+P+SCuIwmRCH4KYW4tNHYM4cziwN5ggO+nHpIXg9Hlhfks8i6TSn9Kx/pb3
 mODsyZrA1/JbA8bd7/X/2zwKLjkDbKBObk7cLWCdioZjIL0QOw2/ocxm8Pws6x8Kqu3m
 k2/fGqkXgodRLflF41fLPhsFCOYocglim5zxVAjV42Rf704q1Y6t//0nFXHfNOqLreP/
 RVdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnOzbS+SRvxvaha6LdkAMHzY1h2QZvpZ73/QFQWTJFyaHSszqI6gTOhFItt11Qh884mLFpispe@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9GPTb4frOJYjixGY2iBP9a1+h4IvQ4wvM4ufVuiLW3Rbh1Iwc
 py7vIKLLuT7uNeRjtzlRRDrqiuj30PgY6Mm1xKWjyIGi+RVcG7xgau0a
X-Gm-Gg: ASbGnctCK6nlqpGnY8O+mvAtEaQO+9DMe/8Lu4OliRHaa69mDvmi1kXmfSTMLvIIprX
 Mi/aGMa+vQo31BHSl/sTlPVxi1FDQavmIe4eIJ3Bwt2Z1emmYZxycfQjK23x0adw7KSgs81T60+
 atOCrEba2nFLcTrFsCRTGJwkz+8HvbINH9Jt/RyK61qvTDZ5lW9R1UKHlV3zpK52zRjyqGHwCXQ
 L0Hba0AOJ0Zsqx5mxcUQ+Yrqbt0Ytn2rYdYOcb83KYiSJvbuGtYJWFbdTidLWmL5j4bNmWHhkf/
 fakSlq7prWwEuG19jpLU/e5+oZSvboMO5xGJMsIS1sy/9WoSipgyIc8PlJcq1mI+JEOvLpd4Mw/
 uqfrQ+3KXiCEms1Eo4Hfmt2+8G2y/s/10E8KNlwYWEZzi4FuxYaI+po2NtoBpMJYK+aH8SRUjf0
 VWL4//LjyTNw==
X-Google-Smtp-Source: AGHT+IF/+3+SUkojh3Q/ztfASRycevQZ9mrL6CnFlh8YCnITjDaQVoH9rXfdZTj0M9ykzZfqI+PgLg==
X-Received: by 2002:a05:600c:22ce:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-47776bfe447mr9951605e9.16.1762631397945; 
 Sat, 08 Nov 2025 11:49:57 -0800 (PST)
Received: from fedora ([156.208.73.128]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc33bdsm233461435e9.1.2025.11.08.11.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 11:49:57 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v5 1/5] drm/nouveau/uvmm: Prepare for larger pages
Date: Sat,  8 Nov 2025 21:49:15 +0200
Message-ID: <20251108194919.68754-2-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
References: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Currently memory allocated by VM_BIND uAPI can only have a  granuality
matching PAGE_SIZE (4KiB in common case)

To have a better memory management and to allow big (64KiB) and huge
(2MiB) pages later in the series, we are now passing the page shift all
around the internals of UVMM.

Signed-off-by: Mary Guillemard <mary@mary.zone>
Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 46 ++++++++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  1 +
 2 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 79eefdfd08a2..2cd0835b05e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -107,34 +107,34 @@ nouveau_uvmm_vmm_sparse_unref(struct nouveau_uvmm *uvmm,
 
 static int
 nouveau_uvmm_vmm_get(struct nouveau_uvmm *uvmm,
-		     u64 addr, u64 range)
+		     u64 addr, u64 range, u8 page_shift)
 {
 	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
 
-	return nvif_vmm_raw_get(vmm, addr, range, PAGE_SHIFT);
+	return nvif_vmm_raw_get(vmm, addr, range, page_shift);
 }
 
 static int
 nouveau_uvmm_vmm_put(struct nouveau_uvmm *uvmm,
-		     u64 addr, u64 range)
+		     u64 addr, u64 range, u8 page_shift)
 {
 	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
 
-	return nvif_vmm_raw_put(vmm, addr, range, PAGE_SHIFT);
+	return nvif_vmm_raw_put(vmm, addr, range, page_shift);
 }
 
 static int
 nouveau_uvmm_vmm_unmap(struct nouveau_uvmm *uvmm,
-		       u64 addr, u64 range, bool sparse)
+		       u64 addr, u64 range, u8 page_shift, bool sparse)
 {
 	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
 
-	return nvif_vmm_raw_unmap(vmm, addr, range, PAGE_SHIFT, sparse);
+	return nvif_vmm_raw_unmap(vmm, addr, range, page_shift, sparse);
 }
 
 static int
 nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
-		     u64 addr, u64 range,
+		     u64 addr, u64 range, u8 page_shift,
 		     u64 bo_offset, u8 kind,
 		     struct nouveau_mem *mem)
 {
@@ -163,7 +163,7 @@ nouveau_uvmm_vmm_map(struct nouveau_uvmm *uvmm,
 		return -ENOSYS;
 	}
 
-	return nvif_vmm_raw_map(vmm, addr, range, PAGE_SHIFT,
+	return nvif_vmm_raw_map(vmm, addr, range, page_shift,
 				&args, argc,
 				&mem->mem, bo_offset);
 }
@@ -182,8 +182,9 @@ nouveau_uvma_vmm_put(struct nouveau_uvma *uvma)
 {
 	u64 addr = uvma->va.va.addr;
 	u64 range = uvma->va.va.range;
+	u8 page_shift = uvma->page_shift;
 
-	return nouveau_uvmm_vmm_put(to_uvmm(uvma), addr, range);
+	return nouveau_uvmm_vmm_put(to_uvmm(uvma), addr, range, page_shift);
 }
 
 static int
@@ -193,9 +194,11 @@ nouveau_uvma_map(struct nouveau_uvma *uvma,
 	u64 addr = uvma->va.va.addr;
 	u64 offset = uvma->va.gem.offset;
 	u64 range = uvma->va.va.range;
+	u8 page_shift = uvma->page_shift;
 
 	return nouveau_uvmm_vmm_map(to_uvmm(uvma), addr, range,
-				    offset, uvma->kind, mem);
+				    page_shift, offset, uvma->kind,
+				    mem);
 }
 
 static int
@@ -203,12 +206,13 @@ nouveau_uvma_unmap(struct nouveau_uvma *uvma)
 {
 	u64 addr = uvma->va.va.addr;
 	u64 range = uvma->va.va.range;
+	u8 page_shift = uvma->page_shift;
 	bool sparse = !!uvma->region;
 
 	if (drm_gpuva_invalidated(&uvma->va))
 		return 0;
 
-	return nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, sparse);
+	return nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, page_shift, sparse);
 }
 
 static int
@@ -501,7 +505,8 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
-						     vmm_get_range);
+						     vmm_get_range,
+						     PAGE_SHIFT);
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -528,6 +533,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			u64 ustart = va->va.addr;
 			u64 urange = va->va.range;
 			u64 uend = ustart + urange;
+			u8 page_shift = uvma_from_va(va)->page_shift;
 
 			/* Nothing to do for mappings we merge with. */
 			if (uend == vmm_get_start ||
@@ -538,7 +544,8 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 				u64 vmm_get_range = ustart - vmm_get_start;
 
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
-						     vmm_get_range);
+						     vmm_get_range,
+						     page_shift);
 			}
 			vmm_get_start = uend;
 			break;
@@ -592,6 +599,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 
 	uvma->region = args->region;
 	uvma->kind = args->kind;
+	uvma->page_shift = PAGE_SHIFT;
 
 	drm_gpuva_map(&uvmm->base, &uvma->va, op);
 
@@ -633,7 +641,8 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 
 			if (vmm_get_range) {
 				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
-							   vmm_get_range);
+							   vmm_get_range,
+							   new->map->page_shift);
 				if (ret) {
 					op_map_prepare_unwind(new->map);
 					goto unwind;
@@ -689,6 +698,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			u64 ustart = va->va.addr;
 			u64 urange = va->va.range;
 			u64 uend = ustart + urange;
+			u8 page_shift = uvma_from_va(va)->page_shift;
 
 			op_unmap_prepare(u);
 
@@ -704,7 +714,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 				u64 vmm_get_range = ustart - vmm_get_start;
 
 				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
-							   vmm_get_range);
+							   vmm_get_range, page_shift);
 				if (ret) {
 					op_unmap_prepare_unwind(va);
 					goto unwind;
@@ -799,10 +809,11 @@ op_unmap_range(struct drm_gpuva_op_unmap *u,
 	       u64 addr, u64 range)
 {
 	struct nouveau_uvma *uvma = uvma_from_va(u->va);
+	u8 page_shift = uvma->page_shift;
 	bool sparse = !!uvma->region;
 
 	if (!drm_gpuva_invalidated(u->va))
-		nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, sparse);
+		nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, page_shift, sparse);
 }
 
 static void
@@ -882,6 +893,7 @@ nouveau_uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
 			struct drm_gpuva_op_map *n = r->next;
 			struct drm_gpuva *va = r->unmap->va;
 			struct nouveau_uvma *uvma = uvma_from_va(va);
+			u8 page_shift = uvma->page_shift;
 
 			if (unmap) {
 				u64 addr = va->va.addr;
@@ -893,7 +905,7 @@ nouveau_uvmm_sm_cleanup(struct nouveau_uvmm *uvmm,
 				if (n)
 					end = n->va.addr;
 
-				nouveau_uvmm_vmm_put(uvmm, addr, end - addr);
+				nouveau_uvmm_vmm_put(uvmm, addr, end - addr, page_shift);
 			}
 
 			nouveau_uvma_gem_put(uvma);
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 9d3c348581eb..51925711ae90 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -33,6 +33,7 @@ struct nouveau_uvma {
 
 	struct nouveau_uvma_region *region;
 	u8 kind;
+	u8 page_shift;
 };
 
 #define uvmm_from_gpuvm(x) container_of((x), struct nouveau_uvmm, base)
-- 
2.51.1

