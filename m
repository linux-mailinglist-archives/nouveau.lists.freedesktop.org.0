Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3303B1B32F0
	for <lists+nouveau@lfdr.de>; Wed, 22 Apr 2020 01:11:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC9B89C28;
	Tue, 21 Apr 2020 23:11:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCD989B27
 for <nouveau@lists.freedesktop.org>; Tue, 21 Apr 2020 23:11:24 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e9f7d280000>; Tue, 21 Apr 2020 16:09:28 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 21 Apr 2020 16:11:24 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 16:11:24 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 23:11:21 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 21 Apr 2020 23:11:21 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e9f7d980002>; Tue, 21 Apr 2020 16:11:20 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-rdma@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 21 Apr 2020 16:11:07 -0700
Message-ID: <20200421231107.30958-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1587510569; bh=Ss8LfMa+AksRBRBDjwFG7kPV3m+nba4icKUZa29lbwk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Transfer-Encoding:Content-Type;
 b=r34r7CLwQDvewRDrcUQOx4DDD//43GPekmJWZrveP9FkSq8orDvJFOTX0jZf7fxeF
 IpG/w3nAey9hjiObLKN8qjo2caJa59Ek3/MRrUwdfFL+ng3a6d2lq17MZrdGMmt9B+
 nX40EVkDSwAQnk/jiGYfTShKTd8UFLrWxMyQVj1Vny62A7D5zF8WwCF1uht7vqqpag
 vhPw/ZswmDImWkEHb3kihjmKTJk3dAUO6RpHQJqqzQgw91PwV6+72hXBwajS2QaEA/
 CPPoydhMZj056WtSkQrdHwNQsT0dRpA9OtcwIHglQO6HliTozJbNWiw7Loa625DZEK
 BJlVLaKr9+NWw==
Subject: [Nouveau] [PATCH] nouveau/hmm: fix nouveau_dmem_chunk allocations
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
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In nouveau_dmem_init(), a number of struct nouveau_dmem_chunk are allocated
and put on the dmem->chunk_empty list. Then in nouveau_dmem_pages_alloc(),
a nouveau_dmem_chunk is removed from the list and GPU memory is allocated.
However, the nouveau_dmem_chunk is never removed from the chunk_empty
list nor placed on the chunk_free or chunk_full lists. This results
in only one chunk ever being actually used (2MB) and quickly leads to
migration to device private memory failures.

Fix this by having just one list of free device private pages and if no
pages are free, allocate a chunk of device private pages and GPU memory.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 304 +++++++++----------------
 1 file changed, 112 insertions(+), 192 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a2ef8d562867..c39500a84b17 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -61,10 +61,8 @@ struct nouveau_dmem_chunk {
 	struct list_head list;
 	struct nouveau_bo *bo;
 	struct nouveau_drm *drm;
-	unsigned long pfn_first;
 	unsigned long callocated;
-	unsigned long bitmap[BITS_TO_LONGS(DMEM_CHUNK_NPAGES)];
-	spinlock_t lock;
+	struct dev_pagemap pagemap;
 };
 
 struct nouveau_dmem_migrate {
@@ -74,48 +72,50 @@ struct nouveau_dmem_migrate {
 
 struct nouveau_dmem {
 	struct nouveau_drm *drm;
-	struct dev_pagemap pagemap;
 	struct nouveau_dmem_migrate migrate;
-	struct list_head chunk_free;
-	struct list_head chunk_full;
-	struct list_head chunk_empty;
+	struct list_head chunks;
 	struct mutex mutex;
+	struct page *free_pages;
+	spinlock_t lock;
 };
 
-static inline struct nouveau_dmem *page_to_dmem(struct page *page)
+static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
+{
+	return container_of(page->pgmap, struct nouveau_dmem_chunk, pagemap);
+}
+
+static struct nouveau_drm *page_to_drm(struct page *page)
 {
-	return container_of(page->pgmap, struct nouveau_dmem, pagemap);
+	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
+
+	return chunk->drm;
 }
 
 static unsigned long nouveau_dmem_page_addr(struct page *page)
 {
-	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
-	unsigned long idx = page_to_pfn(page) - chunk->pfn_first;
+	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
+	unsigned long off = (page_to_pfn(page) << PAGE_SHIFT) -
+				chunk->pagemap.res.start;
 
-	return (idx << PAGE_SHIFT) + chunk->bo->bo.offset;
+	return chunk->bo->bo.offset + off;
 }
 
 static void nouveau_dmem_page_free(struct page *page)
 {
-	struct nouveau_dmem_chunk *chunk = page->zone_device_data;
-	unsigned long idx = page_to_pfn(page) - chunk->pfn_first;
+	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
+	struct nouveau_dmem *dmem = chunk->drm->dmem;
+
+	spin_lock(&dmem->lock);
+	page->zone_device_data = dmem->free_pages;
+	dmem->free_pages = page;
 
-	/*
-	 * FIXME:
-	 *
-	 * This is really a bad example, we need to overhaul nouveau memory
-	 * management to be more page focus and allow lighter locking scheme
-	 * to be use in the process.
-	 */
-	spin_lock(&chunk->lock);
-	clear_bit(idx, chunk->bitmap);
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
 	/*
 	 * FIXME when chunk->callocated reach 0 we should add the chunk to
 	 * a reclaim list so that it can be freed in case of memory pressure.
 	 */
-	spin_unlock(&chunk->lock);
+	spin_unlock(&dmem->lock);
 }
 
 static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
@@ -167,8 +167,8 @@ static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
 
 static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 {
-	struct nouveau_dmem *dmem = page_to_dmem(vmf->page);
-	struct nouveau_drm *drm = dmem->drm;
+	struct nouveau_drm *drm = page_to_drm(vmf->page);
+	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	unsigned long src = 0, dst = 0;
 	dma_addr_t dma_addr = 0;
@@ -211,131 +211,105 @@ static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 {
 	struct nouveau_dmem_chunk *chunk;
+	struct resource *res;
+	struct page *page;
+	void *ptr;
+	unsigned long i, pfn_first;
 	int ret;
 
-	if (drm->dmem == NULL)
-		return -EINVAL;
-
-	mutex_lock(&drm->dmem->mutex);
-	chunk = list_first_entry_or_null(&drm->dmem->chunk_empty,
-					 struct nouveau_dmem_chunk,
-					 list);
+	chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
 	if (chunk == NULL) {
-		mutex_unlock(&drm->dmem->mutex);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out;
 	}
 
-	list_del(&chunk->list);
-	mutex_unlock(&drm->dmem->mutex);
+	/* Allocate unused physical address space for device private pages. */
+	res = request_free_mem_region(&iomem_resource, DMEM_CHUNK_SIZE,
+				      "nouveau_dmem");
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
+		goto out_free;
+	}
+
+	chunk->drm = drm;
+	chunk->pagemap.type = MEMORY_DEVICE_PRIVATE;
+	chunk->pagemap.res = *res;
+	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
+	chunk->pagemap.owner = drm->dev;
 
 	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
 			     TTM_PL_FLAG_VRAM, 0, 0, NULL, NULL,
 			     &chunk->bo);
 	if (ret)
-		goto out;
+		goto out_release;
 
 	ret = nouveau_bo_pin(chunk->bo, TTM_PL_FLAG_VRAM, false);
-	if (ret) {
-		nouveau_bo_ref(NULL, &chunk->bo);
-		goto out;
-	}
+	if (ret)
+		goto out_bo_free;
 
-	bitmap_zero(chunk->bitmap, DMEM_CHUNK_NPAGES);
-	spin_lock_init(&chunk->lock);
+	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
+	if (IS_ERR(ptr)) {
+		ret = PTR_ERR(ptr);
+		goto out_bo_unpin;
+	}
 
-out:
 	mutex_lock(&drm->dmem->mutex);
-	if (chunk->bo)
-		list_add(&chunk->list, &drm->dmem->chunk_empty);
-	else
-		list_add_tail(&chunk->list, &drm->dmem->chunk_empty);
+	list_add(&chunk->list, &drm->dmem->chunks);
 	mutex_unlock(&drm->dmem->mutex);
 
-	return ret;
-}
-
-static struct nouveau_dmem_chunk *
-nouveau_dmem_chunk_first_free_locked(struct nouveau_drm *drm)
-{
-	struct nouveau_dmem_chunk *chunk;
-
-	chunk = list_first_entry_or_null(&drm->dmem->chunk_free,
-					 struct nouveau_dmem_chunk,
-					 list);
-	if (chunk)
-		return chunk;
-
-	chunk = list_first_entry_or_null(&drm->dmem->chunk_empty,
-					 struct nouveau_dmem_chunk,
-					 list);
-	if (chunk->bo)
-		return chunk;
-
-	return NULL;
-}
-
-static int
-nouveau_dmem_pages_alloc(struct nouveau_drm *drm,
-			 unsigned long npages,
-			 unsigned long *pages)
-{
-	struct nouveau_dmem_chunk *chunk;
-	unsigned long c;
-	int ret;
-
-	memset(pages, 0xff, npages * sizeof(*pages));
-
-	mutex_lock(&drm->dmem->mutex);
-	for (c = 0; c < npages;) {
-		unsigned long i;
-
-		chunk = nouveau_dmem_chunk_first_free_locked(drm);
-		if (chunk == NULL) {
-			mutex_unlock(&drm->dmem->mutex);
-			ret = nouveau_dmem_chunk_alloc(drm);
-			if (ret) {
-				if (c)
-					return 0;
-				return ret;
-			}
-			mutex_lock(&drm->dmem->mutex);
-			continue;
-		}
-
-		spin_lock(&chunk->lock);
-		i = find_first_zero_bit(chunk->bitmap, DMEM_CHUNK_NPAGES);
-		while (i < DMEM_CHUNK_NPAGES && c < npages) {
-			pages[c] = chunk->pfn_first + i;
-			set_bit(i, chunk->bitmap);
-			chunk->callocated++;
-			c++;
-
-			i = find_next_zero_bit(chunk->bitmap,
-					DMEM_CHUNK_NPAGES, i);
-		}
-		spin_unlock(&chunk->lock);
+	pfn_first = chunk->pagemap.res.start >> PAGE_SHIFT;
+	page = pfn_to_page(pfn_first);
+	spin_lock(&drm->dmem->lock);
+	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
+		page->zone_device_data = drm->dmem->free_pages;
+		drm->dmem->free_pages = page;
 	}
-	mutex_unlock(&drm->dmem->mutex);
+	*ppage = page;
+	chunk->callocated++;
+	spin_unlock(&drm->dmem->lock);
+
+	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
+		DMEM_CHUNK_SIZE >> 20);
 
 	return 0;
+
+out_bo_unpin:
+	nouveau_bo_unpin(chunk->bo);
+out_bo_free:
+	nouveau_bo_ref(NULL, &chunk->bo);
+out_release:
+	release_mem_region(chunk->pagemap.res.start,
+			   resource_size(&chunk->pagemap.res));
+out_free:
+	kfree(chunk);
+out:
+	return ret;
 }
 
 static struct page *
 nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 {
-	unsigned long pfns[1];
-	struct page *page;
+	struct nouveau_dmem_chunk *chunk;
+	struct page *page = NULL;
 	int ret;
 
-	/* FIXME stop all the miss-match API ... */
-	ret = nouveau_dmem_pages_alloc(drm, 1, pfns);
-	if (ret)
-		return NULL;
+	spin_lock(&drm->dmem->lock);
+	if (drm->dmem->free_pages) {
+		page = drm->dmem->free_pages;
+		drm->dmem->free_pages = page->zone_device_data;
+		chunk = nouveau_page_to_chunk(page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+	} else {
+		spin_unlock(&drm->dmem->lock);
+		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		if (ret)
+			return NULL;
+	}
 
-	page = pfn_to_page(pfns[0]);
 	get_page(page);
 	lock_page(page);
 	return page;
@@ -358,12 +332,7 @@ nouveau_dmem_resume(struct nouveau_drm *drm)
 		return;
 
 	mutex_lock(&drm->dmem->mutex);
-	list_for_each_entry (chunk, &drm->dmem->chunk_free, list) {
-		ret = nouveau_bo_pin(chunk->bo, TTM_PL_FLAG_VRAM, false);
-		/* FIXME handle pin failure */
-		WARN_ON(ret);
-	}
-	list_for_each_entry (chunk, &drm->dmem->chunk_full, list) {
+	list_for_each_entry(chunk, &drm->dmem->chunks, list) {
 		ret = nouveau_bo_pin(chunk->bo, TTM_PL_FLAG_VRAM, false);
 		/* FIXME handle pin failure */
 		WARN_ON(ret);
@@ -380,12 +349,8 @@ nouveau_dmem_suspend(struct nouveau_drm *drm)
 		return;
 
 	mutex_lock(&drm->dmem->mutex);
-	list_for_each_entry (chunk, &drm->dmem->chunk_free, list) {
-		nouveau_bo_unpin(chunk->bo);
-	}
-	list_for_each_entry (chunk, &drm->dmem->chunk_full, list) {
+	list_for_each_entry(chunk, &drm->dmem->chunks, list)
 		nouveau_bo_unpin(chunk->bo);
-	}
 	mutex_unlock(&drm->dmem->mutex);
 }
 
@@ -399,15 +364,13 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 
 	mutex_lock(&drm->dmem->mutex);
 
-	WARN_ON(!list_empty(&drm->dmem->chunk_free));
-	WARN_ON(!list_empty(&drm->dmem->chunk_full));
-
-	list_for_each_entry_safe (chunk, tmp, &drm->dmem->chunk_empty, list) {
-		if (chunk->bo) {
-			nouveau_bo_unpin(chunk->bo);
-			nouveau_bo_ref(NULL, &chunk->bo);
-		}
+	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
+		nouveau_bo_unpin(chunk->bo);
+		nouveau_bo_ref(NULL, &chunk->bo);
 		list_del(&chunk->list);
+		memunmap_pages(&chunk->pagemap);
+		release_mem_region(chunk->pagemap.res.start,
+				   resource_size(&chunk->pagemap.res));
 		kfree(chunk);
 	}
 
@@ -493,9 +456,6 @@ nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 void
 nouveau_dmem_init(struct nouveau_drm *drm)
 {
-	struct device *device = drm->dev->dev;
-	struct resource *res;
-	unsigned long i, size, pfn_first;
 	int ret;
 
 	/* This only make sense on PASCAL or newer */
@@ -507,59 +467,16 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 	drm->dmem->drm = drm;
 	mutex_init(&drm->dmem->mutex);
-	INIT_LIST_HEAD(&drm->dmem->chunk_free);
-	INIT_LIST_HEAD(&drm->dmem->chunk_full);
-	INIT_LIST_HEAD(&drm->dmem->chunk_empty);
-
-	size = ALIGN(drm->client.device.info.ram_user, DMEM_CHUNK_SIZE);
+	INIT_LIST_HEAD(&drm->dmem->chunks);
+	mutex_init(&drm->dmem->mutex);
+	spin_lock_init(&drm->dmem->lock);
 
 	/* Initialize migration dma helpers before registering memory */
 	ret = nouveau_dmem_migrate_init(drm);
-	if (ret)
-		goto out_free;
-
-	/*
-	 * FIXME we need some kind of policy to decide how much VRAM we
-	 * want to register with HMM. For now just register everything
-	 * and latter if we want to do thing like over commit then we
-	 * could revisit this.
-	 */
-	res = devm_request_free_mem_region(device, &iomem_resource, size);
-	if (IS_ERR(res))
-		goto out_free;
-	drm->dmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
-	drm->dmem->pagemap.res = *res;
-	drm->dmem->pagemap.ops = &nouveau_dmem_pagemap_ops;
-	drm->dmem->pagemap.owner = drm->dev;
-	if (IS_ERR(devm_memremap_pages(device, &drm->dmem->pagemap)))
-		goto out_free;
-
-	pfn_first = res->start >> PAGE_SHIFT;
-	for (i = 0; i < (size / DMEM_CHUNK_SIZE); ++i) {
-		struct nouveau_dmem_chunk *chunk;
-		struct page *page;
-		unsigned long j;
-
-		chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
-		if (chunk == NULL) {
-			nouveau_dmem_fini(drm);
-			return;
-		}
-
-		chunk->drm = drm;
-		chunk->pfn_first = pfn_first + (i * DMEM_CHUNK_NPAGES);
-		list_add_tail(&chunk->list, &drm->dmem->chunk_empty);
-
-		page = pfn_to_page(chunk->pfn_first);
-		for (j = 0; j < DMEM_CHUNK_NPAGES; ++j, ++page)
-			page->zone_device_data = chunk;
+	if (ret) {
+		kfree(drm->dmem);
+		drm->dmem = NULL;
 	}
-
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n", size >> 20);
-	return;
-out_free:
-	kfree(drm->dmem);
-	drm->dmem = NULL;
 }
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
@@ -646,6 +563,9 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	u64 *pfns;
 	int ret = -ENOMEM;
 
+	if (drm->dmem == NULL)
+		return -ENODEV;
+
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
-- 
2.25.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
