Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98416C4830C
	for <lists+nouveau@lfdr.de>; Mon, 10 Nov 2025 18:05:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937E110E440;
	Mon, 10 Nov 2025 17:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="ar58+ul4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05910E403
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 15:33:04 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b72dc0c15abso408111066b.1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 07:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1762788783; x=1763393583; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=R8anBBbHESquXQhbkwtAuSkGAXh7jPk8kuEQGrPhUcY=;
 b=ar58+ul4zExTsN9FV73NQkV2A3AF1VXkDbMbgyoRVrckTaPPdZtT3XPRt38kPwC70+
 hPin7q0AU/6LbK/+88QQ3YcFdi3qWNLWlIIiiOubzviCmiWEaiH9joWWr70XeLiV9qTX
 z342tv61TuEinKV8XoCcD1JjS0ER9L/yQvZjWzGPSM0lhI9vdyejjQJYzzx4KimGDWsN
 v44zLVF2XUBYBwEVDJpQZaZ1h+t8BU7ctNOwwSrlYg4g8UB9Ul/jRJnfOOxhiPqDQ+Ig
 D6ow0cPB4bS9NHTw5TtBboObH15if6kH4eUcQGLovfLHngDQOewdrTWSO1nxtt84bqEN
 Sjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762788783; x=1763393583;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=R8anBBbHESquXQhbkwtAuSkGAXh7jPk8kuEQGrPhUcY=;
 b=UtGAosv3K10njP7/g8vxjdIiEJQXqnloyDo4DABohREYCjQ67ikU+miiJW25LVG/h6
 IXUjZ1VWtsvGAM/gHatvweDwl4edxORCFkYXARy3Q2qJQOEQGJoMl5hYlpgEIny+z3V5
 rXS98yXXmmbeobpBcmiki4qMRXeOtQeuCtAhnE8gqgJrVZ8E+SQ6QXZwUlO4Vgrxp9GJ
 K1J7fWEWqGemhzJ0SdwB5pGr+9fHgUWUOr+Zx8QFnpdgzlLsoVgNBcYhYrM9VcwF6yiE
 ENO76w82soJLjrTjAbbsyahsFTf3jRdSErT5wO6mxBokHX2MZGgCpC1yKeBvv0B9szUC
 AWKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCs2lx14KI3jHSdEiDFL4LbP3iI1Zd0CWz9gEvaJGSPkQaj8l80ZdxkWlIBUGzVllCtyYJSnJl@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyz/JYyZj5CziZjmx4yWTsO3FA7+eG3O8J47sAMLpxjI2keee9g
 /F6kU4h2R75uCcKoNl9+mgFr5ixROqQyroEptgLGA0kQ2V6YI6EJdwCa6PRQIRht8Hk=
X-Gm-Gg: ASbGncszWJhOgS4k4hl+RoRpzs47BStJA7Kp1KA8yhdLzLnBkvYUt6t8KTB8AGHIVB3
 PG+dQpCBt4O5F9UjYABED5n/bi6/Sy3Ilt61wv09Pq7Fpbw3e3ppn1Viheiw2BpPugHTYty0yXm
 t4smDOclfYGBXJyO/hUvhXYYS+kKy4qB7PGgQcdIu9vVDf1OgkvbKhnH2uXaSPd9safAk5EdKIw
 yZrAJzCbQc+zEKOB3cgRyhTpQiJKSBDhjwgIOdjFxx2jKVZ5h7m4tJL2nAv3qMwmTJn+pJkmc4d
 /GuG/ud0/VuPME0XBeEYSHhA3gAh/K7NNBt+Ag5CeZ6JDxC3+hF5AGqqI6v0y6a22iEHzj0dD+w
 XaDtzBUVzpy/Vd0xE8Z5cfbSlHBEWz7s6FeEgOCty+/3o4k3lCJIvmlreAaYAcHFNJO+26DfBec
 whArmVDV74a8wzRI36Zncak/uxzDQio/sSb0e8ZCY/67QfHkWdqvt3d+WA5T6qff0eV0qGspg=
X-Google-Smtp-Source: AGHT+IGLnUb5JAPQPO72VTewXJyhQbqwXbtomELs4bxH7l4C0hn/3i6G7eKjJQqBAuCg+Rqn79a5JA==
X-Received: by 2002:a17:907:c1f:b0:b6d:565f:7862 with SMTP id
 a640c23a62f3a-b72e02d3b95mr919506966b.14.1762788783332; 
 Mon, 10 Nov 2025 07:33:03 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf7231dcsm1115978466b.31.2025.11.10.07.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 07:33:02 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Mon, 10 Nov 2025 16:32:57 +0100
Subject: [PATCH v6 2/5] drm/nouveau/uvmm: Allow larger pages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-nouveau-compv6-v6-2-83b05475f57c@mary.zone>
References: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
In-Reply-To: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 James Jones <jajones@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailer: b4 0.14.3
X-Mailman-Approved-At: Mon, 10 Nov 2025 17:05:26 +0000
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

Now that everything in UVMM knows about the variable page shift, we can
select larger values.

The proposed approach relies on nouveau_bo::page unless if it would cause
alignment issues (in which case we fall back to searching for an
appropriate shift)

Signed-off-by: Mary Guillemard <mary@mary.zone>
Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 ++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2cd0835b05e8..f10809115c56 100644
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
+	drm_WARN_ONCE(op->gem.obj->dev, 1, "Could not find an appropriate page size.\n");
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

