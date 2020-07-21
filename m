Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC986228B56
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 23:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59FB36E45C;
	Tue, 21 Jul 2020 21:31:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DC16E462
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 21:31:34 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f175e3d0000>; Tue, 21 Jul 2020 14:29:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 21 Jul 2020 14:31:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 21 Jul 2020 14:31:33 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jul
 2020 21:31:26 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 21 Jul 2020 21:31:25 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f175ead0002>; Tue, 21 Jul 2020 14:31:25 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 21 Jul 2020 14:31:15 -0700
Message-ID: <20200721213119.32344-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721213119.32344-1-rcampbell@nvidia.com>
References: <20200721213119.32344-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595366973; bh=rz9ii3/rSLaotraZODv9PDOOFrnasJhkv9z9XY7GWhs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Lzk6cshHRX/BtFLrsq8xHfMA6HokZ777+MSJVvy+6Sta2onDtG3g4eA2pgGbItERn
 jIAJxTUrh2YOzKRVMrPuOgLnVt5p4cA4CejLkZ0nLfYIEVLI7yJtFcztVe9S2oN9fx
 pDG9d/3C+2/AvoZiwu1fjuHeQUAgU5EMxVxxv+SGN+OusoWOvaoNQLT08L1Ydb0shi
 K8ODV7nxGzM7ASarEV9ZJ9/PGjRV6mjY0m2srCgsv0+CXDdLi3+hQCF4AahBzbQYlo
 riUyUFlbET/CM79xRa9Y/tAWAxIqhm7F1UqmLVKam2/LsF7g9QSRsrGpD1WUomIjfQ
 npdElPFnwaiFA==
Subject: [Nouveau] [PATCH v3 1/5] nouveau: fix storing invalid ptes
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
Cc: Ralph
 Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

When migrating a range of system memory to device private memory, some
of the pages in the address range may not be migrating. In this case,
the non migrating pages won't have a new GPU MMU entry to store but
the nvif_object_ioctl() NVIF_VMM_V0_PFNMAP method doesn't check the input
and stores a bad valid GPU page table entry.
Fix this by skipping the invalid input PTEs when updating the GPU page
tables.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index ed37fddd063f..7eabe9fe0d2b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -79,8 +79,12 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 	dma_addr_t addr;
 
 	nvkm_kmap(pt->memory);
-	while (ptes--) {
+	for (; ptes; ptes--, map->pfn++) {
 		u64 data = 0;
+
+		if (!(*map->pfn & NVKM_VMM_PFN_V))
+			continue;
+
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |= BIT_ULL(6); /* RO. */
 
@@ -100,7 +104,6 @@ gp100_vmm_pgt_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		}
 
 		VMM_WO064(pt, vmm, ptei++ * 8, data);
-		map->pfn++;
 	}
 	nvkm_done(pt->memory);
 }
@@ -310,9 +313,12 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 	dma_addr_t addr;
 
 	nvkm_kmap(pt->memory);
-	while (ptes--) {
+	for (; ptes; ptes--, map->pfn++) {
 		u64 data = 0;
 
+		if (!(*map->pfn & NVKM_VMM_PFN_V))
+			continue;
+
 		if (!(*map->pfn & NVKM_VMM_PFN_W))
 			data |= BIT_ULL(6); /* RO. */
 
@@ -332,7 +338,6 @@ gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
 		}
 
 		VMM_WO064(pt, vmm, ptei++ * 16, data);
-		map->pfn++;
 	}
 	nvkm_done(pt->memory);
 }
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
