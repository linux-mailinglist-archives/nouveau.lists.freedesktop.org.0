Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D2C4342B
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 20:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2710E1FF;
	Sat,  8 Nov 2025 19:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CmfyjO78";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003F310E200
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 19:50:03 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso9004425e9.2
 for <nouveau@lists.freedesktop.org>; Sat, 08 Nov 2025 11:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762631402; x=1763236202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzVBO3wygi8AtPeTVGw8SAvM16hukiPubsoP12gEgLs=;
 b=CmfyjO78TamDQO62wDfPPhWX7DBPwcbYakvxDsW8QgTOKZ9ZA/ZVAPpeJfLoOBxA+6
 5lfencOhLl9ycJg8icX2CBhxdhFOLkjeo1wUKyB708XixLthdzxgxHjt7IbclhcDMtFr
 /W1wxOovTIIYZcVRkVkUo0/Cgn/u4Syc87fWKXwRw8W636wcAP0bKCfuxD4G9Og/3YIX
 wxPbA2AJ+sDEH9vq0dMBDOG5IB8R/FC3fLxFbEtCpEoQKKqEp76CzQOFUkcDN4jyV+Cu
 B5irhM3o8oXEQYFFMwPJwllfzTdGskE/seau72VAhCqCjmI4DSHj58wypKMq5b4Bf29y
 oiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762631402; x=1763236202;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YzVBO3wygi8AtPeTVGw8SAvM16hukiPubsoP12gEgLs=;
 b=qSsBBnnPuDTu1QmABZCR3beyx9q8QX6Br1N/AqJgbUj7VVjLPCFDAlpW7clyR5Sgp6
 zFpJqLyZNVDXs1nMU7bJksgivVlYC7uPi90yx5gkrXJsJ49vWCJxDDjb3akbHeJEkcuF
 mOBwFkmJMIpFY1X6BkxCHGImPTobS4W2glyYqPfxPgW1gL4OIMtJ7gRLjvwz5tdW8Is9
 cTjO/IiLGz/3aqcNPF63MicOXepTFGAPq1AU9FJ35mND17jDiKxHJ9IWwMPmWXXfVfmC
 8FW+FSH5Aznmn7QROGrIVoR3OgUwFdHLDyL5d1Umhfc/T3YVChMeZ9G8Ei9FHwJ+XSwT
 +Y1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHCUMDwgXhlkFXi4gF8797ygEEqlEEo6XgxItkdyun3MRuYSmHjjMPFkH3Sp+yyYFfm/FraFXU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkrLugWzk6lz/keWlG01X/8K9uLo+xiCI901naDKZdO/zx44pY
 DPApgv2b5pFCXXnfl5CmSvIilvIrgsISpBefPhq9pmh5rIFHhBkthV9fJnTssg==
X-Gm-Gg: ASbGncsYKFQ3aF2SEhXWRKnU+pimdUT8g0Alj1iuB3sSa09ZE8nHyrDG0s0pnZNRSSk
 0Q1AvygtqGo1rWrT+AEPZG2BWokg1UHEbPCXJdZ/3ddILH3UXnnYi+9voh7FH4LStLFJYUigsgv
 SQBY+DIePa8dnv91vRWX1B+V6ZlaDIm+X5uicazt8ZuaZIYLtETQcKUl1i+yp+Fl6BLDnvVRcts
 KIx5lwlHmEkbw3tGpEBXduOiZMcFMpa8+NxTQV5TE3jLiIRQCpN54Ovglc07AqZ47pIco4pcMUh
 WU+WnMw+HjgE8cKInvykjyhHRZc6glAjuG7NCD8kj5Wzrnv/baMFt/fhyahBDs3xDebBHa2i0oz
 KyenMTfIPegvLLVJ8VLgb0/5sbW9R1eKTvziYnhMLwT3bIUGelrEdN8OOalROJgY4RR9S9vTKav
 AG7hNwYYPfvw==
X-Google-Smtp-Source: AGHT+IFKRtnzr6h/yDOoNnlfXZI3TwwKRMvaZxn/CG3D9oz1Xwc15sQ3+kUt+r2cqQSOgU1wH0tHyw==
X-Received: by 2002:a05:600c:46d5:b0:477:4345:7c5c with SMTP id
 5b1f17b1804b1-47773297851mr27813065e9.38.1762631402423; 
 Sat, 08 Nov 2025 11:50:02 -0800 (PST)
Received: from fedora ([156.208.73.128]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc33bdsm233461435e9.1.2025.11.08.11.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 11:50:01 -0800 (PST)
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
Subject: [PATCH v5 2/5] drm/nouveau/uvmm: Allow larger pages
Date: Sat,  8 Nov 2025 21:49:16 +0200
Message-ID: <20251108194919.68754-3-mohamedahmedegypt2001@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 +++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2cd0835b05e8..acc1556d1ef4 100644
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
+	dev_warn_once(op->gem.obj->dev, "Could not find an appropriate page size.\n");
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

