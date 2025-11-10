Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17898C48320
	for <lists+nouveau@lfdr.de>; Mon, 10 Nov 2025 18:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C2810E47C;
	Mon, 10 Nov 2025 17:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="fsRM5GsH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97DE10E400
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 15:33:06 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-b64cdbb949cso545040166b.1
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 07:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1762788785; x=1763393585; darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lphwm18lHOH8GUN+4yFjFjzr4xIhvT5dzK4hQnRKziE=;
 b=fsRM5GsHCKQpMMDPM7cWtMBxeu4Qx/1tukRZ8nISPOzATv6nPOfZkAXa+f3IPl+dqU
 hPkCkAy1FEXvNj/sAkp+PDkDCfjbYR7DnC08G/clth9pjKirYZiIXEJsrpcPuckg5dbF
 UmtCEJEXpnDbt1FJv5f8Md2YpQ9ASopQNKbxijuBYvUN8Vf9fwm4eqp/teywePjVvsKW
 3M6osYgEh1nw7nYfYSPHMfQ70G4zQ98ZsgiTnHEqrQl2Oe6sApTK9m6o4UIizV4t5S34
 aLkb/bRYjrAog74huH13aSFy1ufQfizNCSVmXAcNBwDBK4RpgctrstGY1ObT6sWn6rWd
 5bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762788785; x=1763393585;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lphwm18lHOH8GUN+4yFjFjzr4xIhvT5dzK4hQnRKziE=;
 b=JBnGMTF8faeam6bqiTfIvpGHeMUABP/U8JUvB0UpmTJfdK6rJHFqvp4vIbEd1nq6LX
 252gfjv0JREZLTVnhor2XG4GTB2aH8umdLMC6kEnSEGrwLvuoeAqvhDHdTfHrpG+pOou
 W7g/Za6+E4qFLaSCSlphsJ6O99xtUolaZNVClUJRTJWv36A/G4jgibtmwOLO0QgXIJuU
 EWVu1KkGkUecffoYf/nBdejyJQeGjRzmJL9lwNS202oh2uzH6ATdH+HtwRSPieL+pnu6
 wQPL2FHUPDYylB6UJzfQ0pMMx3jy1I1a9+9Yc+raN9l9v9H8iVqOnDqZ0pmqWj7TtXzA
 UuQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGPX2BBt/1Bgkmoo3yfLba0j0nufAy3HbMFAwPpbbF4gNUAU4wi3rvimXMnPWoBHIxLAEB3VQl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOcnrnG4F0H7I+lPR0r4nowIkZ6gPx9sgw2MTT5xO65JceosLc
 O9QosNbfs/ZcQ7O7JDLmA1Fl3DMcerSFuofrp9w+D6hxLfNxIUsTCaGxU3rtLjra3Pk=
X-Gm-Gg: ASbGncu4Aax2OnJsefqtlRB45ItziAL/aC93r/PkNfTfo7VS+/ZASjAbF0f2OzsJzRW
 EM2rJU/m+SA+vuRJo43h/2MdJP5ZMytUNGjR8Gt74PIjnmGfmbn1HRO0kduc6nzmo3Xslxh2uwF
 acUDJHb9KOp82bPLlHJ+2zXCKX7wUFdB43/Gvu38zt0FPOGYOzRWdre+wL99lNOsO090Pl7G3PC
 VO1Korxa5Agcw1fBj1Ezu95X1Nj1fT/N3hYd2nIr1HAwT7ocju746rmLqg1Rv22NIAs6nu4aoNd
 HxQuT5Gea5GwUWx5OtSD6MTG6tLKQFr3TtH3NqXGBFetABV3iKVz3tDYY+F24qTeB79EjnoWrjD
 z0BKoGA+w0/klhgEcRsFZRU2ctHB0S7iIwNqXQx6yB9T/mP6UPancRxAx2+yeoJ9jwmy/NRy3A3
 jsKHnEPeSEZe5HeeK/2b/le3WFGkRlLd71eZpZxq0fZIvPEwZs9aNyDG4bEh/xMVXHEwECUaU=
X-Google-Smtp-Source: AGHT+IG70p62xu1Iuwa33zY/SzOofNGuNdD0jOrfLb2TRpLg/LojF9DWIwzRCiYu+VP8gJxW9BMb4A==
X-Received: by 2002:a17:907:9807:b0:b6d:2b14:4aa4 with SMTP id
 a640c23a62f3a-b72e05ac909mr786170366b.63.1762788785220; 
 Mon, 10 Nov 2025 07:33:05 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf7231dcsm1115978466b.31.2025.11.10.07.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 07:33:04 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Mon, 10 Nov 2025 16:32:59 +0100
Subject: [PATCH v6 4/5] drm/nouveau/mmu/tu102: Add support for compressed kinds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-nouveau-compv6-v6-4-83b05475f57c@mary.zone>
References: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
In-Reply-To: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 James Jones <jajones@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>, 
 Ben Skeggs <bskeggs@nvidia.com>
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

From: Ben Skeggs <bskeggs@nvidia.com>

Allow compressed PTE kinds to be written into PTEs when GSP-RM is
present, rather than reverting to their non-compressed versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Signed-off-by: Mary Guillemard <mary@mary.zone>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: James Jones <jajones@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 46 +++++++++++++++++++++-
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

