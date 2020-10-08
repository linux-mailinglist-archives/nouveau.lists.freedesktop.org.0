Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A723C28A11E
	for <lists+nouveau@lfdr.de>; Sat, 10 Oct 2020 20:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F016E095;
	Sat, 10 Oct 2020 18:05:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDB36EAB5
 for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2020 17:26:41 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7f4ba10000>; Thu, 08 Oct 2020 10:25:53 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 17:26:01 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 8 Oct 2020 17:26:01 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <kvm-ppc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 8 Oct 2020 10:25:44 -0700
Message-ID: <20201008172544.29905-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602177953; bh=GlplT1LvPY9Kd9Bb3zKH1uY50ciSQCyHRTZBgEH1UEg=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
 b=AZt/9oqVClTYI2N2YgO8sQQbfFxRX9cdEl/14JZvf0vkFkLIzffe7EQSfIkHU046i
 ZTO2oDZ3HySmgXXGM7RmgxT8ygjxKkwG2eYIzEecugnuu7LL67VAYxroFnChoIx+BT
 SodLyHf2a+hVWsyn8E4cRo3pDRaLzs/pyWfxvtqa6m335mDOcqClN9Bt+j6ZyN9MUm
 x1CXxJV8PLJaj5LIJ8c6O75vm6sAZgu1RgHaNLOXbwy57VwyAUx9HgzXANYQ0yh4ux
 E0wZZt0Cl8HyYuqqywxS2anUK+Z8xiLpiayTVF1rC1A9QKJAgyQYRgyKhal+LOa27U
 556fR2ZPupAhA==
X-Mailman-Approved-At: Sat, 10 Oct 2020 18:05:19 +0000
Subject: [Nouveau] [PATCH] mm: make device private reference counts zero
 based
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ZONE_DEVICE struct pages have an extra reference count that complicates the
code for put_page() and several places in the kernel that need to check the
reference count to see that a page is not being used (gup, compaction,
migration, etc.). Clean up the code so the reference count doesn't need to
be treated specially for device private pages, leaving DAX as still being
a special case.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---

I'm sending this as a separate patch since I think it is ready to
merge. Originally, this was part of an RFC:
https://lore.kernel.org/linux-mm/20201001181715.17416-1-rcampbell@nvidia.com
and is changed to only make device private struct page reference
counts be zero based since DAX needs to detect when a page is not
referenced by GUP and not no references at all.

It applies cleanly to linux-5.9.0-rc8-mm1 plus my patch
("ext4/xfs: add page refcount helper")
https://lore.kernel.org/linux-mm/20201007214925.11181-1-rcampbell@nvidia.com
but doesn't really depend on it, just a simple merge conflict
without it.

This is for Andrew Morton after the 5.10.0-rc1 merge window closes.

 arch/powerpc/kvm/book3s_hv_uvmem.c     | 13 +++++++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 include/linux/memremap.h               |  6 ++--
 include/linux/mm.h                     |  9 +-----
 lib/test_hmm.c                         |  7 ++++-
 mm/internal.h                          |  8 +++++
 mm/memremap.c                          | 42 ++++++++++----------------
 mm/migrate.c                           |  5 ---
 mm/swap.c                              |  6 ++--
 9 files changed, 51 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 84e5a2dc8be5..a0d08b1d8c1e 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -711,7 +711,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
 
 	dpage = pfn_to_page(uvmem_pfn);
 	dpage->zone_device_data = pvt;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 out_clear:
@@ -1151,6 +1151,7 @@ int kvmppc_uvmem_init(void)
 	struct resource *res;
 	void *addr;
 	unsigned long pfn_last, pfn_first;
+	unsigned long pfn;
 
 	size = kvmppc_get_secmem_size();
 	if (!size) {
@@ -1191,6 +1192,16 @@ int kvmppc_uvmem_init(void)
 		goto out_unmap;
 	}
 
+	/*
+	 * Pages are created with an initial reference count of one but should
+	 * have a reference count of zero while in the free state.
+	 */
+	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
+		struct page *dpage = pfn_to_page(pfn);
+
+		set_page_count(dpage, 0);
+	}
+
 	pr_info("KVMPPC-UVMEM: Secure Memory size 0x%lx\n", size);
 	return ret;
 out_unmap:
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 92987daa5e17..8bc7120e1216 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -324,7 +324,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
-	get_page(page);
+	init_page_count(page);
 	lock_page(page);
 	return page;
 }
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 86c6c368ce9b..43860870bc51 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -66,9 +66,9 @@ enum memory_type {
 
 struct dev_pagemap_ops {
 	/*
-	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
-	 * reach 0 refcount unless there is a refcount bug. This allows the
-	 * device driver to implement its own memory management.)
+	 * Called once the page refcount reaches 0. The reference count should
+	 * be reset to one with init_page_count(page) before reusing the page.
+	 * This allows device drivers to implement their own memory management.
 	 */
 	void (*page_free)(struct page *page);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index d6b8e30dce2e..ac848eeb2a1d 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1110,14 +1110,7 @@ static inline bool page_is_devmap_managed(struct page *page)
 		return false;
 	if (!is_zone_device_page(page))
 		return false;
-	switch (page->pgmap->type) {
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_FS_DAX:
-		return true;
-	default:
-		break;
-	}
-	return false;
+	return page->pgmap->type == MEMORY_DEVICE_FS_DAX;
 }
 
 void put_devmap_managed_page(struct page *page);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e151a7f10519..bf92a261fa6f 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -509,10 +509,15 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
 		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
 		pfn_first, pfn_last);
 
+	/*
+	 * Pages are created with an initial reference count of one but should
+	 * have a reference count of zero while in the free state.
+	 */
 	spin_lock(&mdevice->lock);
 	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
 		struct page *page = pfn_to_page(pfn);
 
+		set_page_count(page, 0);
 		page->zone_device_data = mdevice->free_pages;
 		mdevice->free_pages = page;
 	}
@@ -561,7 +566,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	}
 
 	dpage->zone_device_data = rpage;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 
diff --git a/mm/internal.h b/mm/internal.h
index c43ccdddb0f6..e1443b73aa9b 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -618,4 +618,12 @@ struct migration_target_control {
 	gfp_t gfp_mask;
 };
 
+#ifdef CONFIG_DEV_PAGEMAP_OPS
+void free_zone_device_page(struct page *page);
+#else
+static inline void free_zone_device_page(struct page *page)
+{
+}
+#endif
+
 #endif	/* __MM_INTERNAL_H */
diff --git a/mm/memremap.c b/mm/memremap.c
index 504a10ff2edf..a163a9e36e56 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -49,12 +49,6 @@ static void devmap_managed_enable_put(void)
 
 static int devmap_managed_enable_get(struct dev_pagemap *pgmap)
 {
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE &&
-	    (!pgmap->ops || !pgmap->ops->page_free)) {
-		WARN(1, "Missing page_free method\n");
-		return -EINVAL;
-	}
-
 	static_branch_inc(&devmap_managed_key);
 	return 0;
 }
@@ -92,13 +86,6 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
 	return (range->start + range_len(range)) >> PAGE_SHIFT;
 }
 
-static unsigned long pfn_next(unsigned long pfn)
-{
-	if (pfn % 1024 == 0)
-		cond_resched();
-	return pfn + 1;
-}
-
 /*
  * This returns true if the page is reserved by ZONE_DEVICE driver.
  */
@@ -119,9 +106,6 @@ bool pfn_zone_device_reserved(unsigned long pfn)
 	return ret;
 }
 
-#define for_each_device_pfn(pfn, map, i) \
-	for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
-
 static void dev_pagemap_kill(struct dev_pagemap *pgmap)
 {
 	if (pgmap->ops && pgmap->ops->kill)
@@ -177,20 +161,20 @@ static void pageunmap_range(struct dev_pagemap *pgmap, int range_id)
 
 void memunmap_pages(struct dev_pagemap *pgmap)
 {
-	unsigned long pfn;
 	int i;
 
 	dev_pagemap_kill(pgmap);
 	for (i = 0; i < pgmap->nr_range; i++)
-		for_each_device_pfn(pfn, pgmap, i)
-			put_page(pfn_to_page(pfn));
+		percpu_ref_put_many(pgmap->ref, pfn_end(pgmap, i) -
+						pfn_first(pgmap, i));
 	dev_pagemap_cleanup(pgmap);
 
 	for (i = 0; i < pgmap->nr_range; i++)
 		pageunmap_range(pgmap, i);
 
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
-	devmap_managed_enable_put();
+	if (pgmap->type == MEMORY_DEVICE_FS_DAX)
+		devmap_managed_enable_put();
 }
 EXPORT_SYMBOL_GPL(memunmap_pages);
 
@@ -328,7 +312,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		.pgprot = PAGE_KERNEL,
 	};
 	const int nr_range = pgmap->nr_range;
-	bool need_devmap_managed = true;
+	bool need_devmap_managed = false;
 	int error, i;
 
 	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
@@ -344,6 +328,10 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			WARN(1, "Missing migrate_to_ram method\n");
 			return ERR_PTR(-EINVAL);
 		}
+		if (!pgmap->ops->page_free) {
+			WARN(1, "Missing page_free method\n");
+			return ERR_PTR(-EINVAL);
+		}
 		if (!pgmap->owner) {
 			WARN(1, "Missing owner\n");
 			return ERR_PTR(-EINVAL);
@@ -355,13 +343,12 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			WARN(1, "File system DAX not supported\n");
 			return ERR_PTR(-EINVAL);
 		}
+		need_devmap_managed = true;
 		break;
 	case MEMORY_DEVICE_GENERIC:
-		need_devmap_managed = false;
 		break;
 	case MEMORY_DEVICE_PCI_P2PDMA:
 		params.pgprot = pgprot_noncached(params.pgprot);
-		need_devmap_managed = false;
 		break;
 	default:
 		WARN(1, "Invalid pgmap type %d\n", pgmap->type);
@@ -508,10 +495,13 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
 void free_devmap_managed_page(struct page *page)
 {
 	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
-		dax_wakeup_page(page);
+	dax_wakeup_page(page);
+}
+
+void free_zone_device_page(struct page *page)
+{
+	if (!is_device_private_page(page))
 		return;
-	}
 
 	__ClearPageWaiters(page);
 
diff --git a/mm/migrate.c b/mm/migrate.c
index 5ca5842df5db..ee09334b46d8 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -380,11 +380,6 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 {
 	int expected_count = 1;
 
-	/*
-	 * Device private pages have an extra refcount as they are
-	 * ZONE_DEVICE pages.
-	 */
-	expected_count += is_device_private_page(page);
 	if (mapping)
 		expected_count += thp_nr_pages(page) + page_has_private(page);
 
diff --git a/mm/swap.c b/mm/swap.c
index 0eb057141a04..93d880c6f73c 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -116,12 +116,11 @@ static void __put_compound_page(struct page *page)
 void __put_page(struct page *page)
 {
 	if (is_zone_device_page(page)) {
-		put_dev_pagemap(page->pgmap);
-
 		/*
 		 * The page belongs to the device that created pgmap. Do
 		 * not return it to page allocator.
 		 */
+		free_zone_device_page(page);
 		return;
 	}
 
@@ -907,6 +906,9 @@ void release_pages(struct page **pages, int nr)
 				put_devmap_managed_page(page);
 				continue;
 			}
+			if (put_page_testzero(page))
+				__put_page(page);
+			continue;
 		}
 
 		if (!put_page_testzero(page))
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
