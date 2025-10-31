Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4CC249BE
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 11:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE3010EBA5;
	Fri, 31 Oct 2025 10:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fk50LOWF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B2210EBA4
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 10:49:52 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so16744975e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 03:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907791; x=1762512591; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytESlltqRxcX4R1jrclfkLL9qc0CSP/KNMvJhvbH8BE=;
 b=Fk50LOWFgesJn0iutNIHfjzzVjOrdHevVKeWK1ChM3NNfw4Zz9tRR5gTCnd/f2y4hL
 QmlZcaqfhxJBO/l8mn2BjpEmEYVr1oabtRe0hLqk1w6au+jf4qriF2SjuZ8adTYelvvD
 uZV4j8vXot25ZQawDM6L+KQrPL8lCGhzT5OMdr/2UwtSL4sN0ZPOjrO4is04Bxfboq+b
 JY+1M72SJcbUc45myeHQeX4sil8RXqHPxiiE0V9euUFAkL5K7srSaMVhoSUzbUTLQeBt
 ERpJj1+wNLP72HjgXv2FsXemsA9ZvMzgbeKsSUtQJtYqOEjFo1DxBg+8qzVheUrxhFcm
 j4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907791; x=1762512591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytESlltqRxcX4R1jrclfkLL9qc0CSP/KNMvJhvbH8BE=;
 b=AKZcUaiODVZVti1sXxa7nBZkLvFSAlUvOCjlLd4MQSfJV708R97Y1uo1bwAVlM2jbn
 t3Pa1yTpCa7Wf3nqBIlpQwhc8TRbIOOdS4QMAP+0WjXMTH3cPgm3dNn8mo4QsCJ1++hc
 DXZYexS6gGnfiARw5PFHvoIz7w5pxaj2w26/ZlqZbrD7ewL88v8+57+g6zw9Ggb/d+tp
 qauJu2F25p8+C6jCgMeKIY6Uzn404G32gH+qHG8qwO90VXP2v+OsRDYTMJDCYV4xuJrr
 CbCbvDeQ1mIhCkMBQVrb8KTH8sPSISjvsib9yiFdWEbUmme5pRQImZI4Ql1VA0RHc6bK
 Y3lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+OpyEIzcoDKgUx0+KZfCN5vHiveA8PPF/RWWhRl2y+VoDOCdDtHe+kZTpATd4uwj4popEBZvl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlrVy0JCHT1Bb7qyTEOIgMMtWEBTQ6Z/BkIDdEUtem9zhQRAeX
 rfdYhOfkAAYZuLjV2gXOHaYQBF6zM9WG7U/XCepx1sNkm1wpQ1gRSr/H
X-Gm-Gg: ASbGnctMtnXV7buq6UQqhIK8suF65v2t6G+TNXtGVqChdNkzLZEbvDxdG/e0bvFbinK
 DSqCB7FEcuCz7ZX3k8VIMaRWWTRHbU8bcyFwL66OzhIZrKki+bsfvL4ML0IMFJEQ62XgP9rE8jA
 3hBqZXTQ4Pzh13DF6mkuWKiQwcqBm7GYjdTa2+3wzcC2MZRU1dXYUfulORecQ/hiiViauL7HhTb
 8E2mtipgkta2GFRcizhL3KXAfsZ9vpcxah8Lnh8ovAWN9OoFxk1n70NbJZIk/h9MMo5xhAsCjMl
 skmff7rerOJNubwZA1OMqEVo2WiJ17Y4pBancXk5U6al+7TLSqcIRaA9B5VSn30ojVE8ok3TBkq
 FyXgZSCCqTRkIiuDqiWvk3OVaGX1/ynDaIzoZl5IUf5T47gs+4U0AJnwNEA0117OQHHYwXkIP4W
 yECDhdyCDDFqE=
X-Google-Smtp-Source: AGHT+IEOFyWQviAB5WzOHqdnu6OhTfkzRX9usv/bSGoYjbNq2l0qgpNuGqp+EDuIzC2/qXoWeByspw==
X-Received: by 2002:a05:600c:1e19:b0:46e:711c:efeb with SMTP id
 5b1f17b1804b1-477308aa8acmr27643765e9.25.1761907790763; 
 Fri, 31 Oct 2025 03:49:50 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:49:50 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
Date: Fri, 31 Oct 2025 12:49:21 +0200
Message-ID: <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
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

Now that everything in UVMM knows about the variable page shift, we can
select larger values.

The proposed approach relies on nouveau_bo::page unless if it would cause
alignment issues (in which case we fall back to searching for an
appropriate shift)

Signed-off-by: Mary Guillemard <mary@mary.zone>
Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 +++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2cd0835b05e8..ab8933b88337 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -454,6 +454,62 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
 	drm_gpuva_insert(va->vm, va);
 }
 
+static bool
+op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_shift)
+{
+	u64 non_page_bits = (1ULL << page_shift) - 1;
+
+	return (op->va.addr & non_page_bits) == 0 &&
+	       (op->va.range & non_page_bits) == 0 &&
+	       (op->gem.offset & non_page_bits) == 0;
+}
+
+static u8
+select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op)
+{
+	struct nouveau_bo *nvbo = nouveau_gem_object(op->gem.obj);
+
+	/* nouveau_bo_fixup_align() guarantees that the page size will be aligned
+	 * for most cases, but it can't handle cases where userspace allocates with
+	 * a size and then binds with a smaller granularity. So in order to avoid
+	 * breaking old userspace, we need to ensure that the VA is actually
+	 * aligned before using it, and if it isn't, then we downgrade to the first
+	 * granularity that will fit, which is optimal from a correctness and
+	 * performance perspective.
+	 */
+	if (op_map_aligned_to_page_shift(op, nvbo->page))
+		return nvbo->page;
+
+	struct nouveau_mem *mem = nouveau_mem(nvbo->bo.resource);
+	struct nvif_vmm *vmm = &uvmm->vmm.vmm;
+	int i;
+
+	/* If the given granularity doesn't fit, let's find one that will fit. */
+	for (i = 0; i < vmm->page_nr; i++) {
+		/* Ignore anything that is bigger or identical to the BO preference. */
+		if (vmm->page[i].shift >= nvbo->page)
+			continue;
+
+		/* Skip incompatible domains. */
+		if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram)
+			continue;
+		if ((mem->mem.type & NVIF_MEM_HOST) &&
+		    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+			continue;
+
+		/* If it fits, return the proposed shift. */
+		if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
+			return vmm->page[i].shift;
+	}
+
+	/* If we get here then nothing can reconcile the requirements. This should never
+	 * happen.
+	 */
+	WARN_ON(1);
+
+	return PAGE_SHIFT;
+}
+
 static void
 nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			       struct nouveau_uvma_prealloc *new,
@@ -506,7 +562,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
 						     vmm_get_range,
-						     PAGE_SHIFT);
+						     select_page_shift(uvmm, &op->map));
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -599,7 +655,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 
 	uvma->region = args->region;
 	uvma->kind = args->kind;
-	uvma->page_shift = PAGE_SHIFT;
+	uvma->page_shift = select_page_shift(uvmm, op);
 
 	drm_gpuva_map(&uvmm->base, &uvma->va, op);
 
-- 
2.51.1

