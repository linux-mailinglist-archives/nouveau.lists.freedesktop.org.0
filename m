Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06B1201D76
	for <lists+nouveau@lfdr.de>; Fri, 19 Jun 2020 23:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BB36ECD1;
	Fri, 19 Jun 2020 21:57:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2156EC1B
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jun 2020 21:57:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5eed344e0004>; Fri, 19 Jun 2020 14:55:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 19 Jun 2020 14:57:07 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 19 Jun 2020 14:57:07 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jun
 2020 21:57:00 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 19 Jun 2020 21:57:00 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5eed34ac0002>; Fri, 19 Jun 2020 14:57:00 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 19 Jun 2020 14:56:49 -0700
Message-ID: <20200619215649.32297-17-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200619215649.32297-1-rcampbell@nvidia.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592603726; bh=6E8QYJLMPfg495+ft9rGkWwj8WhcZsUUFgmXEro+uMM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=TI2S7MxUA6F3bIfzYcmnUckxh/9t4xftCzgh2KXaiOJMjM+AdSiNGu74zzcYp3xJh
 undb6TzcQbdGmT1cQKPcn3MK6ih/nwtYZrMwv5ZJQydA/zvJMiVdNodDHx0C1F9L8L
 1EIWefmpyhSiKB2ZS2oPPggt9ukCY96x/8QW1eZM5TIRAy0CseSE8pSp8kwZY1lrgt
 juVtOr5V7lnobM7J+Aw5iAhb0n2fe3XX1IEnaaZ+Q0zXJwDge2jn21M8nZdqJvYuN0
 1t86utAruVLAWa5KF2IMtSDzyC/USnNdkmTx103BEuHKzHCjBI98+bpGVxbV0P7ov0
 cHSkhZb9+NI1g==
Subject: [Nouveau] [PATCH 16/16] nouveau: support THP migration to private
 memory
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
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add support for migrating transparent huge pages to and from device
private memory.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 171 +++++++++++++++++--------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  11 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 127 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index f6a806ba3caa..e8c4c0bc78ae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -46,6 +46,7 @@
  */
 #define DMEM_CHUNK_SIZE (2UL << 20)
 #define DMEM_CHUNK_NPAGES (DMEM_CHUNK_SIZE >> PAGE_SHIFT)
+#define PMD_ORDER (PMD_SHIFT - PAGE_SHIFT)
 
 enum nouveau_aper {
 	NOUVEAU_APER_VIRT,
@@ -53,7 +54,7 @@ enum nouveau_aper {
 	NOUVEAU_APER_HOST,
 };
 
-typedef int (*nouveau_migrate_copy_t)(struct nouveau_drm *drm, u64 npages,
+typedef int (*nouveau_migrate_copy_t)(struct nouveau_drm *drm, u32 length,
 				      enum nouveau_aper, u64 dst_addr,
 				      enum nouveau_aper, u64 src_addr);
 typedef int (*nouveau_clear_page_t)(struct nouveau_drm *drm, u32 length,
@@ -79,6 +80,7 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct page *free_huge_pages;
 	spinlock_t lock;
 };
 
@@ -109,8 +111,13 @@ static void nouveau_dmem_page_free(struct page *page)
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (PageHuge(page)) {
+		page->zone_device_data = dmem->free_huge_pages;
+		dmem->free_huge_pages = page;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -136,33 +143,41 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 
 static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 		struct vm_fault *vmf, struct migrate_vma *args,
-		dma_addr_t *dma_addr)
+		dma_addr_t *dma_addr, size_t *sizep)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
+	unsigned int order;
 
 	spage = migrate_pfn_to_page(args->src[0]);
 	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
 		return 0;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	order = compound_order(spage);
+	if (order)
+		dpage = alloc_transhugepage(vmf->vma, vmf->address);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
 	if (!dpage)
 		return VM_FAULT_SIGBUS;
+	WARN_ON_ONCE(order != compound_order(dpage));
 	lock_page(dpage);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	*sizep = page_size(dpage);
+	*dma_addr = dma_map_page(dev, dpage, 0, *sizep, DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, *dma_addr))
 		goto error_free_page;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
+	if (drm->dmem->migrate.copy_func(drm, page_size(spage),
+			NOUVEAU_APER_HOST, *dma_addr, NOUVEAU_APER_VRAM,
+			nouveau_dmem_page_addr(spage)))
 		goto error_dma_unmap;
 
 	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 	return 0;
 
 error_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, *dma_addr, page_size(dpage), DMA_BIDIRECTIONAL);
 error_free_page:
 	__free_page(dpage);
 	return VM_FAULT_SIGBUS;
@@ -173,8 +188,11 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
+	struct page *page;
+	unsigned int order;
 	unsigned long src = 0, dst = 0;
 	dma_addr_t dma_addr = 0;
+	size_t size = 0;
 	vm_fault_t ret;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
@@ -185,26 +203,52 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.src_owner	= drm->dev,
 	};
 
+	/*
+	 * If the page was migrated to the GPU as a huge page, migrate it
+	 * back the same way.
+	 * FIXME If there is thrashing, maybe we should migrate one page.
+	 */
+	page = compound_head(vmf->page);
+	order = compound_order(page);
+	if (order) {
+		args.start &= PAGE_MASK << order;
+		args.end = args.start + (PAGE_SIZE << order);
+		args.src = kcalloc(1U << order, sizeof(*args.src), GFP_KERNEL);
+		if (!args.src)
+			return VM_FAULT_OOM;
+		args.dst = kcalloc(1U << order, sizeof(*args.dst), GFP_KERNEL);
+		if (!args.dst) {
+			ret = VM_FAULT_OOM;
+			goto error_src;
+		}
+	}
+
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
 	 * likely that more surrounding page will CPU fault too.
 	 */
-	if (migrate_vma_setup(&args) < 0)
-		return VM_FAULT_SIGBUS;
-	if (!args.cpages)
-		return 0;
+	if (migrate_vma_setup(&args) < 0) {
+		ret = VM_FAULT_SIGBUS;
+		goto error_dst;
+	}
 
-	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr);
-	if (ret || dst == 0)
+	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr, &size);
+	if (ret)
 		goto done;
 
 	nouveau_fence_new(dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_addr, size, DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+error_dst:
+	if (args.dst != &dst)
+		kfree(args.dst);
+error_src:
+	if (args.src != &src)
+		kfree(args.src);
 	return ret;
 }
 
@@ -213,8 +257,8 @@ static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
 };
 
-static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+static int nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, bool is_huge,
+				    struct page **ppage)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -266,16 +310,20 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.res.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
-	}
+	if (is_huge)
+		prep_compound_page(page, PMD_ORDER);
+	else
+		for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
+			page->zone_device_data = drm->dmem->free_pages;
+			drm->dmem->free_pages = page;
+		}
 	*ppage = page;
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		DMEM_CHUNK_SIZE >> 20, is_huge ? "huge " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -293,14 +341,20 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_huge)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
 	int ret;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_huge && drm->dmem->free_huge_pages) {
+		page = drm->dmem->free_huge_pages;
+		drm->dmem->free_huge_pages = page->zone_device_data;
+		chunk = nouveau_page_to_chunk(page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+	} else if (!is_huge && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
@@ -308,7 +362,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 		spin_unlock(&drm->dmem->lock);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, is_huge, &page);
 		if (ret)
 			return NULL;
 	}
@@ -381,19 +435,18 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 }
 
 static int
-nvc0b5_migrate_copy(struct nouveau_drm *drm, u64 npages,
+nvc0b5_migrate_copy(struct nouveau_drm *drm, u32 length,
 		    enum nouveau_aper dst_aper, u64 dst_addr,
 		    enum nouveau_aper src_aper, u64 src_addr)
 {
 	struct nouveau_channel *chan = drm->dmem->migrate.chan;
-	u32 launch_dma = (1 << 9) /* MULTI_LINE_ENABLE. */ |
-			 (1 << 8) /* DST_MEMORY_LAYOUT_PITCH. */ |
+	u32 launch_dma = (1 << 8) /* DST_MEMORY_LAYOUT_PITCH. */ |
 			 (1 << 7) /* SRC_MEMORY_LAYOUT_PITCH. */ |
 			 (1 << 2) /* FLUSH_ENABLE_TRUE. */ |
 			 (2 << 0) /* DATA_TRANSFER_TYPE_NON_PIPELINED. */;
 	int ret;
 
-	ret = RING_SPACE(chan, 13);
+	ret = RING_SPACE(chan, 11);
 	if (ret)
 		return ret;
 
@@ -425,17 +478,15 @@ nvc0b5_migrate_copy(struct nouveau_drm *drm, u64 npages,
 		launch_dma |= 0x00002000; /* DST_TYPE_PHYSICAL. */
 	}
 
-	BEGIN_NVC0(chan, NvSubCopy, 0x0400, 8);
-	OUT_RING  (chan, upper_32_bits(src_addr));
-	OUT_RING  (chan, lower_32_bits(src_addr));
-	OUT_RING  (chan, upper_32_bits(dst_addr));
-	OUT_RING  (chan, lower_32_bits(dst_addr));
-	OUT_RING  (chan, PAGE_SIZE);
-	OUT_RING  (chan, PAGE_SIZE);
-	OUT_RING  (chan, PAGE_SIZE);
-	OUT_RING  (chan, npages);
+	BEGIN_NVC0(chan, NvSubCopy, 0x0400, 4);
+	OUT_RING(chan, upper_32_bits(src_addr));
+	OUT_RING(chan, lower_32_bits(src_addr));
+	OUT_RING(chan, upper_32_bits(dst_addr));
+	OUT_RING(chan, lower_32_bits(dst_addr));
+	BEGIN_NVC0(chan, NvSubCopy, 0x0418, 1);
+	OUT_RING(chan, length);
 	BEGIN_NVC0(chan, NvSubCopy, 0x0300, 1);
-	OUT_RING  (chan, launch_dma);
+	OUT_RING(chan, launch_dma);
 	return 0;
 }
 
@@ -535,6 +586,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	unsigned long dst;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
@@ -546,7 +598,8 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		goto done;
 	}
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	dpage = nouveau_dmem_page_alloc_locked(drm,
+					       src & MIGRATE_PFN_COMPOUND);
 	if (!dpage)
 		goto out;
 
@@ -556,7 +609,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 					 DMA_BIDIRECTIONAL);
 		if (dma_mapping_error(dev, *dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
+		if (drm->dmem->migrate.copy_func(drm, page_size(spage),
 			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
 			goto out_dma_unmap;
 	} else {
@@ -571,10 +624,13 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	if (PageHead(dpage))
+		dst |= MIGRATE_PFN_COMPOUND;
+	return dst;
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, *dma_addr, page_size(spage), DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -588,24 +644,30 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned int page_shift = PAGE_SHIFT;
 
 	for (i = 0; addr < args->end; i++) {
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, args->src[i],
 				dma_addrs + nr_dma, pfns + i);
 		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
 			nr_dma++;
+		if (args->dst[i] & MIGRATE_PFN_COMPOUND) {
+			page_shift = PMD_SHIFT;
+			i++;
+			break;
+		}
 		addr += PAGE_SIZE;
 	}
 
 	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i,
+			 page_shift);
 
-	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
-	}
+	while (nr_dma)
+		dma_unmap_page(drm->dev->dev, dma_addrs[--nr_dma],
+				1UL << page_shift, DMA_BIDIRECTIONAL);
 	migrate_vma_finalize(args);
 }
 
@@ -617,7 +679,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			 unsigned long end)
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
-	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
+	unsigned long max = min(1UL << PMD_ORDER, npages);
 	dma_addr_t *dma_addrs;
 	struct migrate_vma args = {
 		.vma		= vma,
@@ -646,8 +708,10 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!pfns)
 		goto out_free_dma;
 
-	for (i = 0; i < npages; i += max) {
-		args.end = start + (max << PAGE_SHIFT);
+	for (; args.start < end; args.start = args.end) {
+		args.end = ALIGN(args.start, PMD_SIZE);
+		if (args.start == args.end)
+			args.end = min(end, args.start + PMD_SIZE);
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out_free_pfns;
@@ -655,7 +719,6 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 		if (args.cpages)
 			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
 						   pfns);
-		args.start = args.end;
 	}
 
 	ret = 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a27625f3c5f9..f386a9318190 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -684,7 +684,6 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
-		SVMM_DBG(svmm, "addr %016llx", buffer->fault[fi]->addr);
 
 		/* We try and group handling of faults within a small
 		 * window into a single update.
@@ -736,6 +735,10 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
 		mmput(mm);
 
+		SVMM_DBG(svmm, "addr %llx %s %c", buffer->fault[fi]->addr,
+			args.phys[0] & NVIF_VMM_PFNMAP_V0_VRAM ?
+			"vram" : "sysmem",
+			args.i.p.size > PAGE_SIZE ? 'H' : 'N');
 		limit = args.i.p.addr + args.i.p.size;
 		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
@@ -807,13 +810,15 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 	int ret;
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.page = page_shift;
+	args->p.size = npages << args->p.page;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index f0fcd1b72e8b..ba5927e445ad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -22,7 +22,8 @@ int nouveau_svmm_bind(struct drm_device *, void *, struct drm_file *);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
