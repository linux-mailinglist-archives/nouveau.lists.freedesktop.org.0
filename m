Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB1E25B24C
	for <lists+nouveau@lfdr.de>; Wed,  2 Sep 2020 18:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778906E949;
	Wed,  2 Sep 2020 16:58:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319526E945
 for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2020 16:58:37 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4fcebc0004>; Wed, 02 Sep 2020 09:56:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 02 Sep 2020 09:58:36 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 02 Sep 2020 09:58:36 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep
 2020 16:58:36 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Sep 2020 16:58:36 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4fcf3c0002>; Wed, 02 Sep 2020 09:58:36 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 2 Sep 2020 09:58:30 -0700
Message-ID: <20200902165830.5367-8-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200902165830.5367-1-rcampbell@nvidia.com>
References: <20200902165830.5367-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1599065789; bh=AJUp5oJSVkG5/knqs/F6FOPXqf6dVM42k+QNkVPqYoQ=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=V4qQ5W7Yfy+dJJx8g9499OfOPQFPJYgd1WoacoZfSNhRqH7SEMUo3h3prF92m6+Yr
 TtbHPryo7ZXfDN2XagrcMqxpl0AHW8ewAPmGBLVZAbrfQx9ycJxuTx3QCmn/TAYOPB
 4/UbYpM6zSkwx57XSCPOdvrCwFkPiAjnAkB2eSN8ZhxPPJ+O66/Nir+3/KRJlOEgZw
 WpeIJoPXHsXB6GbdhNORfgFmxkBDjlu7gd6+zkecgxLA5zIGhyaGK5AGqgu0w0meUT
 5PwAXOT9V0skRJHUVdF2f2rnhtgggz1q9s+YYISMgUOb44tpRLZRvYY7qmqKBTEELA
 rF4pZOwvr9D8w==
Subject: [Nouveau] [PATCH v2 7/7] nouveau: support THP migration to private
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Bharata B Rao <bharata@linux.ibm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Add support for migrating transparent huge pages to and from device
private memory.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 289 ++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  11 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 215 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a13c6215bba8..78ad0ee77b3d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -82,6 +82,7 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct page *free_huge_pages;
 	spinlock_t lock;
 };
 
@@ -112,8 +113,13 @@ static void nouveau_dmem_page_free(struct page *page)
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (PageHead(page)) {
+		page->zone_device_data = dmem->free_huge_pages;
+		dmem->free_huge_pages = page;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,51 +145,100 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 
 static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 		struct vm_fault *vmf, struct migrate_vma *args,
-		dma_addr_t *dma_addr)
+		struct page *spage, bool is_huge, dma_addr_t *dma_addr)
 {
+	struct nouveau_svmm *svmm = spage->zone_device_data;
 	struct device *dev = drm->dev->dev;
-	struct page *dpage, *spage;
-	struct nouveau_svmm *svmm;
-
-	spage = migrate_pfn_to_page(args->src[0]);
-	if (!spage || !(args->src[0] & MIGRATE_PFN_MIGRATE))
-		return 0;
+	struct page *dpage;
+	unsigned int i;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	if (is_huge)
+		dpage = alloc_transhugepage(vmf->vma, args->start);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
 	if (!dpage)
-		return VM_FAULT_SIGBUS;
-	lock_page(dpage);
+		return VM_FAULT_OOM;
+	WARN_ON_ONCE(compound_order(spage) != compound_order(dpage));
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	*dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+				 DMA_BIDIRECTIONAL);
 	if (dma_mapping_error(dev, *dma_addr))
 		goto error_free_page;
 
-	svmm = spage->zone_device_data;
+	lock_page(dpage);
+	i = (vmf->address - args->start) >> PAGE_SHIFT;
+	spage += i;
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args->start, args->end);
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
+	if (drm->dmem->migrate.copy_func(drm, compound_nr(dpage),
+			NOUVEAU_APER_HOST, *dma_addr, NOUVEAU_APER_VRAM,
+			nouveau_dmem_page_addr(spage)))
 		goto error_dma_unmap;
 	mutex_unlock(&svmm->mutex);
 
-	args->dst[0] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	args->dst[i] = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	if (is_huge)
+		args->dst[i] |= MIGRATE_PFN_COMPOUND;
 	return 0;
 
 error_dma_unmap:
 	mutex_unlock(&svmm->mutex);
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	unlock_page(dpage);
+	dma_unmap_page(dev, *dma_addr, page_size(dpage), DMA_BIDIRECTIONAL);
 error_free_page:
 	__free_page(dpage);
 	return VM_FAULT_SIGBUS;
 }
 
+static vm_fault_t nouveau_dmem_fault_chunk(struct nouveau_drm *drm,
+		struct vm_fault *vmf, struct migrate_vma *args)
+{
+	struct device *dev = drm->dev->dev;
+	struct nouveau_fence *fence;
+	struct page *spage;
+	unsigned long src = args->src[0];
+	bool is_huge = (src & (MIGRATE_PFN_MIGRATE | MIGRATE_PFN_COMPOUND)) ==
+		(MIGRATE_PFN_MIGRATE | MIGRATE_PFN_COMPOUND);
+	unsigned long dma_page_size;
+	dma_addr_t dma_addr;
+	vm_fault_t ret = 0;
+
+	spage = migrate_pfn_to_page(src);
+	if (!spage) {
+		ret = VM_FAULT_SIGBUS;
+		goto out;
+	}
+	if (is_huge) {
+		dma_page_size = PMD_SIZE;
+		ret = nouveau_dmem_fault_copy_one(drm, vmf, args, spage, true,
+						  &dma_addr);
+		if (!ret)
+			goto fence;
+		/*
+		 * If we couldn't allocate a huge page, fallback to migrating
+		 * a single page.
+		 */
+	}
+	dma_page_size = PAGE_SIZE;
+	ret = nouveau_dmem_fault_copy_one(drm, vmf, args, spage, false,
+					  &dma_addr);
+	if (ret)
+		goto out;
+fence:
+	nouveau_fence_new(drm->dmem->migrate.chan, false, &fence);
+	migrate_vma_pages(args);
+	nouveau_dmem_fence_done(&fence);
+	dma_unmap_page(dev, dma_addr, dma_page_size, DMA_BIDIRECTIONAL);
+out:
+	migrate_vma_finalize(args);
+	return ret;
+}
+
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 {
 	struct nouveau_drm *drm = page_to_drm(vmf->page);
-	struct nouveau_dmem *dmem = drm->dmem;
-	struct nouveau_fence *fence;
 	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *page;
 	vm_fault_t ret;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
@@ -192,39 +247,64 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.src		= &src,
 		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
 	};
 
+	/*
+	 * If the page was migrated to the GPU as a huge page, try to
+	 * migrate it back the same way.
+	 */
+	page = compound_head(vmf->page);
+	if (PageHead(page)) {
+		unsigned int order = compound_order(page);
+		unsigned int nr_pages = 1U << order;
+
+		args.start &= PAGE_MASK << order;
+		args.end = args.start + (PAGE_SIZE << order);
+		args.src = kmalloc_array(nr_pages, sizeof(*args.src),
+					 GFP_KERNEL);
+		if (!args.src)
+			return VM_FAULT_OOM;
+		args.dst = kmalloc_array(nr_pages, sizeof(*args.dst),
+					 GFP_KERNEL);
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
-
-	ret = nouveau_dmem_fault_copy_one(drm, vmf, &args, &dma_addr);
-	if (ret || dst == 0)
-		goto done;
-
-	nouveau_fence_new(dmem->migrate.chan, false, &fence);
-	migrate_vma_pages(&args);
-	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
-done:
-	migrate_vma_finalize(&args);
+	if (migrate_vma_setup(&args))
+		ret = VM_FAULT_SIGBUS;
+	else
+		ret = nouveau_dmem_fault_chunk(drm, vmf, &args);
+	if (args.dst != &dst)
+		kfree(args.dst);
+error_src:
+	if (args.src != &src)
+		kfree(args.src);
 	return ret;
 }
 
+static void nouveau_page_split(struct page *head, struct page *page)
+{
+	page->pgmap = head->pgmap;
+	page->zone_device_data = head->zone_device_data;
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.page_split		= nouveau_page_split,
 };
 
-static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+static int nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, bool is_huge,
+				    struct page **ppage)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -278,16 +358,20 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
-	}
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && is_huge)
+		prep_transhuge_device_private_page(page);
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
 
@@ -304,14 +388,20 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
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
@@ -319,7 +409,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 		spin_unlock(&drm->dmem->lock);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, is_huge, &page);
 		if (ret)
 			return NULL;
 	}
@@ -567,31 +657,22 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct page *spage, bool is_huge, dma_addr_t dma_addr, u64 *pfn)
 {
-	struct device *dev = drm->dev->dev;
-	struct page *dpage, *spage;
+	struct page *dpage;
 	unsigned long paddr;
+	unsigned long dst;
 
-	spage = migrate_pfn_to_page(src);
-	if (!(src & MIGRATE_PFN_MIGRATE))
-		goto out;
-
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_huge);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
-					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, compound_nr(dpage),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
-			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -602,10 +683,11 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
 	if (src & MIGRATE_PFN_WRITE)
 		*pfn |= NVIF_VMM_PFNMAP_V0_W;
-	return migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
+	if (PageHead(dpage))
+		dst |= MIGRATE_PFN_COMPOUND;
+	return dst;
 
-out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -617,26 +699,64 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
 		dma_addr_t *dma_addrs, u64 *pfns)
 {
+	struct device *dev = drm->dev->dev;
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned int page_shift = PAGE_SHIFT;
+	struct page *spage;
+	unsigned long src = args->src[0];
+	bool is_huge = (src & (MIGRATE_PFN_MIGRATE | MIGRATE_PFN_COMPOUND)) ==
+		(MIGRATE_PFN_MIGRATE | MIGRATE_PFN_COMPOUND);
+	unsigned long dma_page_size = is_huge ? PMD_SIZE : PAGE_SIZE;
+
+	if (is_huge) {
+		spage = migrate_pfn_to_page(src);
+		if (spage) {
+			dma_addrs[nr_dma] = dma_map_page(dev, spage, 0,
+							 page_size(spage),
+							 DMA_BIDIRECTIONAL);
+			if (dma_mapping_error(dev, dma_addrs[nr_dma]))
+				goto out;
+			nr_dma++;
+		}
+		args->dst[0] = nouveau_dmem_migrate_copy_one(drm, svmm, src,
+				spage, true, *dma_addrs, pfns);
+		if (args->dst[0] & MIGRATE_PFN_COMPOUND) {
+			page_shift = PMD_SHIFT;
+			i = 1;
+			goto fence;
+		}
+	}
 
-	for (i = 0; addr < args->end; i++) {
-		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+	for (i = 0; addr < args->end; i++, addr += PAGE_SIZE) {
+		src = args->src[i];
+		if (!(src & MIGRATE_PFN_MIGRATE))
+			continue;
+		spage = migrate_pfn_to_page(src);
+		if (spage && !is_huge) {
+			dma_addrs[i] = dma_map_page(dev, spage, 0,
+						    page_size(spage),
+						    DMA_BIDIRECTIONAL);
+			if (dma_mapping_error(dev, dma_addrs[i]))
+				break;
 			nr_dma++;
-		addr += PAGE_SIZE;
+		} else if (spage && is_huge && i != 0)
+			dma_addrs[i] = dma_addrs[i - 1] + PAGE_SIZE;
+		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm, src,
+				spage, false, dma_addrs[i], pfns + i);
 	}
 
+fence:
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
+				dma_page_size, DMA_BIDIRECTIONAL);
+out:
 	migrate_vma_finalize(args);
 }
 
@@ -648,25 +768,25 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			 unsigned long end)
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
-	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
+	unsigned long max = min(1UL << (PMD_SHIFT - PAGE_SHIFT), npages);
 	dma_addr_t *dma_addrs;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM |
+				  MIGRATE_VMA_SELECT_COMPOUND,
 	};
-	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
 
 	if (drm->dmem == NULL)
 		return -ENODEV;
 
-	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
+	args.src = kmalloc_array(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
-	args.dst = kcalloc(max, sizeof(*args.dst), GFP_KERNEL);
+	args.dst = kmalloc_array(max, sizeof(*args.dst), GFP_KERNEL);
 	if (!args.dst)
 		goto out_free_src;
 
@@ -678,8 +798,10 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!pfns)
 		goto out_free_dma;
 
-	for (i = 0; i < npages; i += max) {
-		args.end = start + (max << PAGE_SHIFT);
+	for (; args.start < end; args.start = args.end) {
+		args.end = min(end, ALIGN(args.start, PMD_SIZE));
+		if (args.start == args.end)
+			args.end = min(end, args.start + PMD_SIZE);
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out_free_pfns;
@@ -687,7 +809,6 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 		if (args.cpages)
 			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
 						   pfns);
-		args.start = args.end;
 	}
 
 	ret = 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4f69e4c3dafd..3db0997f21b5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -681,7 +681,6 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
-		SVMM_DBG(svmm, "addr %016llx", buffer->fault[fi]->addr);
 
 		/* We try and group handling of faults within a small
 		 * window into a single update.
@@ -733,6 +732,10 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		}
 		mmput(mm);
 
+		SVMM_DBG(svmm, "addr %llx %s %c", buffer->fault[fi]->addr,
+			args.phys[0] & NVIF_VMM_PFNMAP_V0_VRAM ?
+			"vram" : "sysmem",
+			args.i.p.size > PAGE_SIZE ? 'H' : 'N');
 		limit = args.i.p.addr + args.i.p.size;
 		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
@@ -804,13 +807,15 @@ nouveau_pfns_free(u64 *pfns)
 
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
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
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
