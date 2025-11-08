Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2A6C4343A
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 20:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E5B10E204;
	Sat,  8 Nov 2025 19:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FesPfLf5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B20310E205
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 19:50:15 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso14155655e9.0
 for <nouveau@lists.freedesktop.org>; Sat, 08 Nov 2025 11:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762631414; x=1763236214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vtdKmJcqO9zaIwqI/14ufG9W4yGZnpTrnplEsPvtN6c=;
 b=FesPfLf5H6iM8h547KHxPYwRJvFG9DHljhqAcD2bXzmLG5xX4jDef51eNHieJ0jKsp
 PHr1MPHeAw+JWBILH86FfXweT7v4ARaVlLv/0EBkQM9pHCP/x3P0aBsSWqMxcyvkuPfQ
 L47M8fDbjm8E2KMLeUATNNNHyBHdz8DtTZkRNr93Rb5619e7aSWVcWE1Nt0O16HGoBwT
 gs4xelAh/zeZ5lDn2NXGsW12Ns/R1VxApjM68YcHADrQwTmI/wdpYJv7sFoNCG77OGsm
 o6ElMq+0FzUjy967QZ12hqHluiMJAdYxsmkAImR+0/4pwFMTNP1xvAJxfU17TywSdMPq
 Tgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762631414; x=1763236214;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vtdKmJcqO9zaIwqI/14ufG9W4yGZnpTrnplEsPvtN6c=;
 b=BuN9Zl4HVNa0ksBNbm7AeGDPs6lLLLVyugdKGTIUeNkYwFplT7Zseh5AJ8wcDbKtMb
 Bz3my4bvtVuPHwbfQqTWpQZzr+rwmpuV7AOttQn92AJw2eAFGfl6X7mFXgUvyiTXapDe
 t26263zqSsSUoGFyrYCSX3mZPsX+sfGctVlN7oF/0jSIdKRY7suguLSVtlBxBlqm+/sP
 sXD/ar6Akc+deba0V2MEqIyfRTmCQ0gEnqrPv2u06ZUmKc9SLHhVXBVwhyV75G1JFvTZ
 y3Yrr/uWWkQ7BnbZG6jR1xRkym4rPIYfQ03faTn7HtXZ+a/0xtGMyd2voyHVNV1kfBb4
 c/gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVI7PpX3fGs+7y4OnlvA+5/c8kQy4DWzePDaTY25ghkGdxghOCvWp8XGD5MBHjrEvSP2Nw4u3JI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW36zlAV1CgHEFAuKcSG5b78EOZv7wQWxeFvKKuQA0gW10nFEY
 41Jx+Ey5TmO+MukMAcu9apqcW/wARCYLsiIfLzGAZGJzesp+Z/FlA8RK
X-Gm-Gg: ASbGncsZER3YVTV0KTa33H4DoeQcQeuEjGbJMVOq1sH1vqmFBIF89v++BeYRgnRdGLw
 Fs2o1fiID2ayO/nNlnrcaEZVYAfghj0kQoaHTTx6nLKDwUjy40LsMiGruEQJx2eDiX02vkuQLLF
 KMPQQzRSp9q65Ilib4/haiKvHisUEyJYiUeDSo9dXwHcY1mc+1fuqRMhHfJhUxs2sLoj6KVXtwn
 R9xtycvX8ms3QTRAEvZLUQZMgLAFQQzND5RuyLIhJhkkSLz1ymCwFUK7Dsq+FA4Vx4cU9hIojpB
 FWYnW8fBkQbLE077NwVemGquezIP2rIDO0MhNHQ/KB2iSvlf1kiL7UTB7bKgFjeLkm3zHbwCEeA
 B4r21qNS4MT4Pbs7+6kG2BSqoB+BMl+Ay1ATNBCfd8hMcLpxK17agboKBqnhg7jQf+7KE7z+K1s
 TjJXiyCufK4gjAiCAZIMl/
X-Google-Smtp-Source: AGHT+IHLDsB59QWASihliDj9gIsX+r8OWcAsgYDGHKKuet7SX9VhC3x8d+fQ/Gzbhl5mk70HXHn1uw==
X-Received: by 2002:a05:600c:608d:b0:477:73cc:82c3 with SMTP id
 5b1f17b1804b1-47773cc8453mr18802295e9.26.1762631413614; 
 Sat, 08 Nov 2025 11:50:13 -0800 (PST)
Received: from fedora ([156.208.73.128]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc33bdsm233461435e9.1.2025.11.08.11.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 11:50:13 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@nvidia.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 James Jones <jajones@nvidia.com>
Subject: [PATCH v5 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Sat,  8 Nov 2025 21:49:18 +0200
Message-ID: <20251108194919.68754-5-mohamedahmedegypt2001@gmail.com>
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

From: Ben Skeggs <bskeggs@nvidia.com>

Allow compressed PTE kinds to be written into PTEs when GSP-RM is
present, rather than reverting to their non-compressed versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 46 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index ecff1096a1bb..ed15a4475181 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -109,12 +109,34 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 	nvkm_done(pt->memory);
 }
 
+static inline u64
+gp100_vmm_comptag_nr(u64 size)
+{
+	return size >> 16; /* One comptag per 64KiB VRAM. */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_base(u64 addr)
+{
+	/* RM allocates enough comptags for all of VRAM, so use a 1:1 mapping. */
+	return (1 + gp100_vmm_comptag_nr(addr)) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
+static inline u64
+gp100_vmm_pte_comptagline_incr(u32 page_size)
+{
+	return gp100_vmm_comptag_nr(page_size) << 36; /* NV_MMU_VER2_PTE_COMPTAGLINE */
+}
+
 static inline void
 gp100_vmm_pgt_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map, u64 addr)
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
 		data += map->next;
@@ -195,6 +217,9 @@ gp100_vmm_pd0_pte(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 {
 	u64 data = (addr >> 4) | map->type;
 
+	if (map->ctag)
+		data |= gp100_vmm_pte_comptagline_base(addr);
+
 	while (ptes--) {
 		VMM_WO128(pt, vmm, ptei++ * 0x10, data, 0ULL);
 		data += map->next;
@@ -440,9 +465,26 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 		return -EINVAL;
 	}
 
+	/* Handle compression. */
 	if (kindm[kind] != kind) {
-		/* Revert to non-compressed kind. */
-		kind = kindm[kind];
+		struct nvkm_device *device = vmm->mmu->subdev.device;
+
+		/* Compression is only supported when using GSP-RM, as
+		 * PMU firmware is required in order to initialise the
+		 * compbit backing store.
+		 */
+		if (nvkm_gsp_rm(device->gsp)) {
+			/* Turing GPUs require PTE_COMPTAGLINE to be filled,
+			 * in addition to specifying a compressed kind.
+			 */
+			if (device->card_type < GA100) {
+				map->ctag  = gp100_vmm_pte_comptagline_incr(1 << map->page->shift);
+				map->next |= map->ctag;
+			}
+		} else {
+			/* Revert to non-compressed kind. */
+			kind = kindm[kind];
+		}
 	}
 
 	map->type |= BIT(0);
-- 
2.51.1

