Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 293BE22B966
	for <lists+nouveau@lfdr.de>; Fri, 24 Jul 2020 00:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1936E384;
	Thu, 23 Jul 2020 22:30:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE3E6E2D8
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2020 22:30:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1a0f8b0000>; Thu, 23 Jul 2020 15:30:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jul 2020 15:30:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 15:30:47 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 22:30:41 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 23 Jul 2020 22:30:41 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f1a0f910001>; Thu, 23 Jul 2020 15:30:41 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 23 Jul 2020 15:30:02 -0700
Message-ID: <20200723223004.9586-5-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200723223004.9586-1-rcampbell@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595543435; bh=inLsVikJBBkWjiEyE8zRFI/DuD2s6zsmXcBd/dKKSw0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=K+uzCyO5X+CLEDAY7hOvTpRj7xhokS2k4OA2vew5F6595FKjKW5ieWRPS5yz2DLXz
 rNJgnx0ioa7neP0Ab9S6mlbOkXNY/MKIg3Yb/46kqMZ+iCMjnpYqHhQxbWG0UHVlsv
 SLpw/u4OjTvdbmIAneTACH/JyWbpOxNh958OzcJXGbTJ6mkcS+jPVonss2F4hY2Sex
 kWEviWFSMYVGY4bArXShWnEoeoGRx/NqtR42tPU0nOMD7DJ8IBmA6EIoh+L0Lp/Ejg
 ZQVp5wsjvEdPHdZ30FmYNC/o2TsW1vMRW0AbU8/GWqxSIH2486JWA3ZiQ8USD/MdhI
 YnjS1cUyPioOQ==
Subject: [Nouveau] [PATCH v4 4/6] nouveau/svm: use the new migration
 invalidation
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

Use the new MMU_NOTIFY_MIGRATE event to skip GPU MMU invalidations of
device private memory and handle the invalidation in the driver as part
of migrating device private memory.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 15 ++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  | 21 +++++++++------------
 drivers/gpu/drm/nouveau/nouveau_svm.h  | 13 ++++++++++++-
 3 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 78b9e3c2a5b3..511fe04cd680 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -140,6 +140,7 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
+	struct nouveau_svmm *svmm;
 
 	spage = migrate_pfn_to_page(args->src[0]);
 	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
@@ -154,14 +155,19 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 	if (dma_mapping_error(dev, *dma_addr))
 		goto error_free_page;
 
+	svmm = spage->zone_device_data;
+	mutex_lock(&svmm->mutex);
+	nouveau_svmm_invalidate(svmm, args->start, args->end);
 	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
 			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
 		goto error_dma_unmap;
+	mutex_unlock(&svmm->mutex);
 
 	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 	return 0;
 
 error_dma_unmap:
+	mutex_unlock(&svmm->mutex);
 	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 error_free_page:
 	__free_page(dpage);
@@ -531,7 +537,8 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 }
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
-		unsigned long src, dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_svmm *svmm, unsigned long src,
+		dma_addr_t *dma_addr, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
@@ -561,6 +568,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 			goto out_free_page;
 	}
 
+	dpage->zone_device_data = svmm;
 	*pfn = NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
@@ -584,8 +592,8 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	unsigned long addr = args->start, nr_dma = 0, i;
 
 	for (i = 0; addr < args->end; i++) {
-		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, args->src[i],
-				dma_addrs + nr_dma, pfns + i);
+		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
+				args->src[i], dma_addrs + nr_dma, pfns + i);
 		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
 			nr_dma++;
 		addr += PAGE_SIZE;
@@ -616,6 +624,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
+		.pgmap_owner	= drm->dev,
 		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
 	};
 	unsigned long i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index c5f8ca6fb2e3..67b068ac57b2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -93,17 +93,6 @@ nouveau_ivmm_find(struct nouveau_svm *svm, u64 inst)
 	return NULL;
 }
 
-struct nouveau_svmm {
-	struct mmu_notifier notifier;
-	struct nouveau_vmm *vmm;
-	struct {
-		unsigned long start;
-		unsigned long limit;
-	} unmanaged;
-
-	struct mutex mutex;
-};
-
 #define SVMM_DBG(s,f,a...)                                                     \
 	NV_DEBUG((s)->vmm->cli->drm, "svm-%p: "f"\n", (s), ##a)
 #define SVMM_ERR(s,f,a...)                                                     \
@@ -246,7 +235,7 @@ nouveau_svmm_join(struct nouveau_svmm *svmm, u64 inst)
 }
 
 /* Invalidate SVMM address-range on GPU. */
-static void
+void
 nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit)
 {
 	if (limit > start) {
@@ -279,6 +268,14 @@ nouveau_svmm_invalidate_range_start(struct mmu_notifier *mn,
 	if (unlikely(!svmm->vmm))
 		goto out;
 
+	/*
+	 * Ignore invalidation callbacks for device private pages since
+	 * the invalidation is handled as part of the migration process.
+	 */
+	if (update->event == MMU_NOTIFY_MIGRATE &&
+	    update->migrate_pgmap_owner == svmm->vmm->cli->drm->dev)
+		goto out;
+
 	if (limit > svmm->unmanaged.start && start < svmm->unmanaged.limit) {
 		if (start < svmm->unmanaged.start) {
 			nouveau_svmm_invalidate(svmm, start,
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index f0fcd1b72e8b..e7d63d7f0c2d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -1,11 +1,21 @@
 #ifndef __NOUVEAU_SVM_H__
 #define __NOUVEAU_SVM_H__
 #include <nvif/os.h>
+#include <linux/mmu_notifier.h>
 struct drm_device;
 struct drm_file;
 struct nouveau_drm;
 
-struct nouveau_svmm;
+struct nouveau_svmm {
+	struct mmu_notifier notifier;
+	struct nouveau_vmm *vmm;
+	struct {
+		unsigned long start;
+		unsigned long limit;
+	} unmanaged;
+
+	struct mutex mutex;
+};
 
 #if IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM)
 void nouveau_svm_init(struct nouveau_drm *);
@@ -19,6 +29,7 @@ int nouveau_svmm_join(struct nouveau_svmm *, u64 inst);
 void nouveau_svmm_part(struct nouveau_svmm *, u64 inst);
 int nouveau_svmm_bind(struct drm_device *, void *, struct drm_file *);
 
+void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
