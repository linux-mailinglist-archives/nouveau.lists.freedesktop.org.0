Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB9211656
	for <lists+nouveau@lfdr.de>; Thu,  2 Jul 2020 00:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4288D6EA0F;
	Wed,  1 Jul 2020 22:54:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E2F6EA0C
 for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2020 22:54:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efd13e30000>; Wed, 01 Jul 2020 15:53:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 01 Jul 2020 15:54:14 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 01 Jul 2020 15:54:14 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 22:54:05 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 1 Jul 2020 22:54:05 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5efd140c0008>; Wed, 01 Jul 2020 15:54:05 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Wed, 1 Jul 2020 15:53:50 -0700
Message-ID: <20200701225352.9649-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701225352.9649-1-rcampbell@nvidia.com>
References: <20200701225352.9649-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593644003; bh=LJGpDBN6OLESv1BK8GJcMMzgaimKKBD7JI7EOfFUHn4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=DjjW30v6+Cfy6bZJwRzn6y5hmjWqM49qlwQHrTkQrUPuvuiOLetOQUCY7U0j8/urh
 nt+Z80p6IZGt7VC8tHXR1vJZKl/aB5O/jSTGSuu9ov+eo4KeWqGhWNpj+Lws1qIjbF
 TI3AelyG54HMZxvT+bVo6jwwx2EliKrnwqwj7zPgry7tU3wVH7TKl2s8RDvkSLC1BS
 xo6LbZrVkrFmsXCoXX4HGfC1IrsTK81hV2vomfaeLuNEzzf9UvIwuaoEllgGowzRAZ
 Bnzq0HEu/7VtHC90/QE5/OBdQB6rWSEIEOM/3ytIwXoPoYpoUAgyoApHh1dnGavQrv
 0PsJwxJDp+j9Q==
Subject: [Nouveau] [PATCH v3 3/5] nouveau: fix mapping 2MB sysmem pages
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The nvif_object_ioctl() method NVIF_VMM_V0_PFNMAP wasn't correctly
setting the hardware specific GPU page table entries for 2MB sized
pages. Fix this by adding functions to set and clear PD0 GPU page
table entries.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  5 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 82 +++++++++++++++++++
 2 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 199f94e15c5f..19a6804e3989 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1204,7 +1204,6 @@ nvkm_vmm_pfn_unmap(struct nvkm_vmm *vmm, u64 addr, u64 size)
 /*TODO:
  * - Avoid PT readback (for dma_unmap etc), this might end up being dealt
  *   with inside HMM, which would be a lot nicer for us to deal with.
- * - Multiple page sizes (particularly for huge page support).
  * - Support for systems without a 4KiB page size.
  */
 int
@@ -1220,8 +1219,8 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
 	/* Only support mapping where the page size of the incoming page
 	 * array matches a page size available for direct mapping.
 	 */
-	while (page->shift && page->shift != shift &&
-	       page->desc->func->pfn == NULL)
+	while (page->shift && (page->shift != shift ||
+	       page->desc->func->pfn == NULL))
 		page++;
 
 	if (!page->shift || !IS_ALIGNED(addr, 1ULL << shift) ||
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index d86287565542..ed37fddd063f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -258,12 +258,94 @@ gp100_vmm_pd0_unmap(struct nvkm_vmm *vmm,
 	VMM_FO128(pt, vmm, pdei * 0x10, 0ULL, 0ULL, pdes);
 }
 
+static void
+gp100_vmm_pd0_pfn_unmap(struct nvkm_vmm *vmm,
+			struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
+{
+	struct device *dev = vmm->mmu->subdev.device->dev;
+	dma_addr_t addr;
+
+	nvkm_kmap(pt->memory);
+	while (ptes--) {
+		u32 datalo = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 0);
+		u32 datahi = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 4);
+		u64 data   = (u64)datahi << 32 | datalo;
+
+		if ((data & (3ULL << 1)) != 0) {
+			addr = (data >> 8) << 12;
+			dma_unmap_page(dev, addr, 1UL << 21, DMA_BIDIRECTIONAL);
+		}
+		ptei++;
+	}
+	nvkm_done(pt->memory);
+}
+
+static bool
+gp100_vmm_pd0_pfn_clear(struct nvkm_vmm *vmm,
+			struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
+{
+	bool dma = false;
+
+	nvkm_kmap(pt->memory);
+	while (ptes--) {
+		u32 datalo = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 0);
+		u32 datahi = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 4);
+		u64 data   = (u64)datahi << 32 | datalo;
+
+		if ((data & BIT_ULL(0)) && (data & (3ULL << 1)) != 0) {
+			VMM_WO064(pt, vmm, ptei * 16, data & ~BIT_ULL(0));
+			dma = true;
+		}
+		ptei++;
+	}
+	nvkm_done(pt->memory);
+	return dma;
+}
+
+static void
+gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
+		  u32 ptei, u32 ptes, struct nvkm_vmm_map *map)
+{
+	struct device *dev = vmm->mmu->subdev.device->dev;
+	dma_addr_t addr;
+
+	nvkm_kmap(pt->memory);
+	while (ptes--) {
+		u64 data = 0;
+
+		if (!(*map->pfn & NVKM_VMM_PFN_W))
+			data |= BIT_ULL(6); /* RO. */
+
+		if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
+			addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
+			addr = dma_map_page(dev, pfn_to_page(addr), 0,
+					    1UL << 21, DMA_BIDIRECTIONAL);
+			if (!WARN_ON(dma_mapping_error(dev, addr))) {
+				data |= addr >> 4;
+				data |= 2ULL << 1; /* SYSTEM_COHERENT_MEMORY. */
+				data |= BIT_ULL(3); /* VOL. */
+				data |= BIT_ULL(0); /* VALID. */
+			}
+		} else {
+			data |= (*map->pfn & NVKM_VMM_PFN_ADDR) >> 4;
+			data |= BIT_ULL(0); /* VALID. */
+		}
+
+		VMM_WO064(pt, vmm, ptei++ * 16, data);
+		map->pfn++;
+	}
+	nvkm_done(pt->memory);
+}
+
 static const struct nvkm_vmm_desc_func
 gp100_vmm_desc_pd0 = {
 	.unmap = gp100_vmm_pd0_unmap,
 	.sparse = gp100_vmm_pd0_sparse,
 	.pde = gp100_vmm_pd0_pde,
 	.mem = gp100_vmm_pd0_mem,
+	.pfn = gp100_vmm_pd0_pfn,
+	.pfn_clear = gp100_vmm_pd0_pfn_clear,
+	.pfn_unmap = gp100_vmm_pd0_pfn_unmap,
 };
 
 static void
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
