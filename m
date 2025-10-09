Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EA8BCB34F
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 01:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3869F10E252;
	Thu,  9 Oct 2025 23:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDUxTTad";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C66C10E256
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:35 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-42420c7de22so705906f8f.1
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053174; x=1760657974; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNJhbRyXnLpVcJDyTCl+QlImHdH1yijCDQYOlaa6U08=;
 b=UDUxTTad09I+VU3kfFV5JWPenB6IUV+Iwml1MvsrucH3jT/ZfHNMJrpsZQ55wLJvRz
 9+FfqZSWGAp905dAKZAThxlV5aeuFsLaoHOnnpR1vXKIWMptmvxJJ8vNQyL+nPfoFAyr
 nimYA9bFauAOkXtQbKCpNGFldmMaouqFXUjohhja/4IhvTPK4j1LdMU3sXpIaFiuLRuS
 UeMFqZM55vlQKbGp7I8x5iA1zYaPH1Sxprpw/FY/97x7syGHp8QagL3IDSrEXEP5O1KA
 feOhEPCRDTyVDgEUKAIPsR/8cOQc3TzkZ/vYwDz1CEzgyAanRfY6h6zR1ilIt1/22vlP
 InsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053174; x=1760657974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNJhbRyXnLpVcJDyTCl+QlImHdH1yijCDQYOlaa6U08=;
 b=n1BtAm+s2VnLdaj5Pk6QyzPv8VrrGis+RJvzJ7YBsw82vMbuGv98TpEbbVS7KGTnyr
 atfxVBkT93dT36QKzbNkF7Mu+9Oz13NIhulSj7c6TYlhqI/iCrAxq6wDjFqKiB8PctVr
 X0jjX6cWm3MI9Makb6FZc9mgachPN3OqGhxhuNOgGatFO2QxuruzWi8svw0wEJE+ftA2
 GtFYftRHj7F7rDuJdq1I6jnYF59mX3ETAbcWW8/k4SxUZFbZBc/66XRi5pmE/nhnX5+A
 G1lSgnGKf8lpGTmUCVAdX5j2T/owStq5H3QFHd1aNsS9cPpz2oXG/Pn2ZE7CRUtMWG0y
 5uVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlBPBJwW6FbZXe+bTiFevN07FkiFjCRIok98palLGYCt9cTfCgV6G/3soNM/b7VE5tiX7vXehC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbd1QAbRjE5avSj6hfA3Ru+K8pQb2wamrDk4UmKyuQ3qe2GaoF
 HuHs/MKDamt4ixXIAKKK2NYQ0kQU/MDIDNCpgcGUwFzmyRs9Vhy03IIO
X-Gm-Gg: ASbGnctZm3bLF3u8+Vl4QG3KWE4M7qA2L+YE7lYp8+2UAOaOIK63AvwXgM9uiOc/8YU
 AxbxCcKNKDqeh9PzdFs83wpxmctAdm2xow/0K7f/34oh/pdjGtM4A6il5xwWLbN8vM9CFytRO3W
 qtAkRvg59SWrwxgcuuHlA0MCQaiJm9KhwS5MSE9/DMawVxEmnYzoc8OqcKabiSbrER2zJDcwheo
 Cgt2mpiHitSndcaX6gMmbnHSwYiKACHYcTmKjKPa4CzPubKgz1440Hx/0cHHhRL03TLUMP63vRt
 +i4CnjTziq1Oketr7vzzWuD8+pIWaFS4SPMaZgIJpbPpaWz6L7ODRuBqQ0TcFtxvuM7SB4YndD2
 azoCfGuOo9t0hmwEZ3oDbpadqk3Ax8+d2akr+69uDFKLxd+VMoAUJ
X-Google-Smtp-Source: AGHT+IEHbriviJcKghNvsIijh1pBMhiKzJ4SyCmZlLqgkmtnMByimnxocABQh66B8voRln+z3wk6JA==
X-Received: by 2002:a05:6000:2485:b0:425:8133:ec6c with SMTP id
 ffacd0b85a97d-42666ac634cmr5253436f8f.9.1760053173778; 
 Thu, 09 Oct 2025 16:39:33 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:32 -0700 (PDT)
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
Subject: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
Date: Fri, 10 Oct 2025 02:38:34 +0300
Message-ID: <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
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
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 29 ++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 2cd0835b05e8..26edc60a530b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -454,6 +454,31 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
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
+	/* nouveau_bo_fixup_align() guarantees for us that the page size will be aligned
+	 * but just in case, make sure that it is aligned.
+	 */
+	if (op_map_aligned_to_page_shift(op, nvbo->page))
+		return nvbo->page;
+
+	/* This should never happen, but raise a warning and return 4K if we get here. */
+	WARN_ON(1);
+	return PAGE_SHIFT;
+}
+
 static void
 nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			       struct nouveau_uvma_prealloc *new,
@@ -506,7 +531,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
 			if (vmm_get_range)
 				nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
 						     vmm_get_range,
-						     PAGE_SHIFT);
+						     select_page_shift(uvmm, &op->map));
 			break;
 		}
 		case DRM_GPUVA_OP_REMAP: {
@@ -599,7 +624,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 
 	uvma->region = args->region;
 	uvma->kind = args->kind;
-	uvma->page_shift = PAGE_SHIFT;
+	uvma->page_shift = select_page_shift(uvmm, op);
 
 	drm_gpuva_map(&uvmm->base, &uvma->va, op);
 
-- 
2.51.0

