Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B56C249CA
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 11:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EEA10EBAA;
	Fri, 31 Oct 2025 10:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kBAAmDw/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C40210EBAA
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 10:49:58 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso23213765e9.3
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 03:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907797; x=1762512597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zzdi8nfSSs1sZofLN+Os1wqi0upcCWxbMTjLpxylR+I=;
 b=kBAAmDw/rGfFdEdUmlaAApLUUs4L0ufz90yWVyDIGTk/yB9zuc/DI+dxHogIrHGi9F
 hc8wCNll8grzJVmFAYwGqh2YMaHHo25deR3+lAMNHnWVdtl7tx8T5RCaeJ4FROgkeQun
 eBieXjmjj0vZX2A+VPLtCN1GMCJJ6vto3vyia7xOWlR8IPk0MxrbS1uqC0feVYRBOYdR
 8A+1b/vlRkQ2Lcs1q3LqwixHr0aJ+zN9YwWYDBKyi/xsdYCYfXo3mEt/oMOVdV4Rf/dA
 AhS9YH3OnQh9TkxyWBnY3ia1/jaqYvjbE5xPyfo7NP2xZaRwnTfp3EY7YvVASG8r61zM
 k3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907797; x=1762512597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zzdi8nfSSs1sZofLN+Os1wqi0upcCWxbMTjLpxylR+I=;
 b=e64oDO9Y8aPkLvJMlMxh/8moxbB1DUbsJkY6Qk1nf9KMh+UWJU7fVTZGAdHbtg+lK/
 CWzDMN0MeRqkG3C+JTmXw6F304mzu33ufxytXVZbFQUKkiqcZ8/Za6GXIDchrGOD3ak+
 y4PMLoEZYeLbQy8AmowGE2fs9cIPc2XKyeMCZjJ8RxltQFPp6gy5gbfkExrCICymw1Sv
 U5/OgJnSLk1G4HhXvI9INP40bsb2nvi4gc0xAjySyZ74692+sDNCgsvYnpAcL9l1CHnI
 nE3SvO2IjsijzZ4uoqXZXKWNprnlN6ZpFiFSAftwFeVifcNMPc5B1YAubCXeKQQLg5Ih
 RK2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFU2tm6xxpfboA76MSCkj4CHHj4bAGzj4FT554JpvoqlzWVdfnKbfZ/AthuPZH7yARgZJsei0b@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywh4IFSMquu+0Eqjgju9eh4LwAypZukdKFpzU1HDfVfwxshDAoR
 ITtJDZW1FMblyvBZfykCA08BdCS8QcveQmB6ziwKtlx1jCLDPE18Wt7F
X-Gm-Gg: ASbGnctghR6g9ORlqbvOGQ7jvROj62KfjZjK0Um+JmvEYMii5+zMLfT74zKWosdArg8
 hUgFqpCb1UBGEmxvYV0R9/XpB3s3l/KT0j265y6uAMDye6FEzrihlXMFy8fj7b/9Jp3d868RxiG
 yLROJRw9cWBt3lH0Eno6UmhIZdMwhk/yD0AzKou6MJxODnDVVCwv5wbTt16QqlHy0A0tUQ8YIh3
 InwZCv+zVMcUP9xl8VuU8+M0V/CND+VzBgb+VY8ayhYY1bi5xxKJTrG/gsr2poa9vi5N+1FmQk3
 P29tZ4zaO0vCcOb+c9MhCaS3/W4nMA4dgBLcDqfz/uj0ybJjwaJ7UF9FxlUiIDTY1i4wTNVXqWC
 fL/VeLC/fOLigyCz3fFGdHe6Y6lE0RWyzIPMUT+9xnMoxr7QN2IUV1JkUY9axwbDPkzKeQuS3Kd
 j2faFLcAOsPF67FyK0eeYU1w==
X-Google-Smtp-Source: AGHT+IExqiXaV3tY1QYgyp3Vb/lFXZy9Ed+LjlywLCtsIPMBbB1MZkrDAGvWrVtUBRa7sksEKHFBPg==
X-Received: by 2002:a05:600c:4e44:b0:45f:2cb5:ecff with SMTP id
 5b1f17b1804b1-477308ce7b2mr30226905e9.31.1761907796910; 
 Fri, 31 Oct 2025 03:49:56 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:49:56 -0700 (PDT)
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
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
Date: Fri, 31 Oct 2025 12:49:23 +0200
Message-ID: <20251031104924.10631-5-mohamedahmedegypt2001@gmail.com>
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

From: Ben Skeggs <bskeggs@nvidia.com>

Allow compressed PTE kinds to be written into PTEs when GSP-RM is
present, rather than reverting to their non-compressed versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

