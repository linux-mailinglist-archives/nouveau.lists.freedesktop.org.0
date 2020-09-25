Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF94E2794F1
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 01:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FEB6ED7C;
	Fri, 25 Sep 2020 23:46:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B650A6ED37
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 20:44:54 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6e56b80001>; Fri, 25 Sep 2020 13:44:40 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 20:44:49 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 25 Sep 2020 20:44:49 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <kvm-ppc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 25 Sep 2020 13:44:42 -0700
Message-ID: <20200925204442.31348-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925204442.31348-1-rcampbell@nvidia.com>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601066681; bh=lY+MAo59AVccL8lf+hv6kgC9mNiDhM9kmvtwEw1vnTc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=kUTBmFHS20BaKQDy+fAJddFU9znxFQapMKyH9CHz8oW/ggxioiCrxKGvuKt4q/blX
 ewRla4EuRUByBUfFIScLULYcbW+cSxg+RYawUuo+FuAkxJunK8iLXshFqrY74fBmpQ
 dyYQK/+m1FIO7lP+67+Eqg5v+tPRjjVg+7WDPYsRG8W9N8uljapqEko7ZLw32pTisc
 S4mrmKO68w5u9Y1s5mKmxJvMtAsUrU/zNzEoP6CffLUxGMILdjLMGfBZmnGKLHihP5
 kk7ueD2506gOcBMoqrTlJd1+ihUZ8U7pi7vmpCx43wL3ZbBfzZKNxxSDCA1zamwwL3
 L0R3FbvohA4lg==
X-Mailman-Approved-At: Fri, 25 Sep 2020 23:46:15 +0000
Subject: [Nouveau] [PATCH 2/2] mm: remove extra ZONE_DEVICE struct page
 refcount
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
be treated specially for ZONE_DEVICE.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 include/linux/dax.h                    |  2 +-
 include/linux/memremap.h               |  7 ++-
 include/linux/mm.h                     | 44 --------------
 lib/test_hmm.c                         |  2 +-
 mm/gup.c                               | 44 --------------
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 82 ++++++--------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 +
 mm/swap.c                              | 46 +++------------
 12 files changed, 44 insertions(+), 203 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 7705d5557239..e6ec98325fab 100644
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
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 4e8112fde3e6..ca2e3c3edc36 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -323,7 +323,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
 			return NULL;
 	}
 
-	get_page(page);
+	init_page_count(page);
 	lock_page(page);
 	return page;
 }
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 3f78ed78d1d6..8d29f38645aa 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -240,7 +240,7 @@ static inline bool dax_mapping(struct address_space *mapping)
 
 static inline bool dax_layout_is_idle_page(struct page *page)
 {
-	return page_ref_count(page) <= 1;
+	return page_ref_count(page) == 0;
 }
 
 #endif
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index e5862746751b..f9224f88e4cd 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -65,9 +65,10 @@ enum memory_type {
 
 struct dev_pagemap_ops {
 	/*
-	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
-	 * reach 0 refcount unless there is a refcount bug. This allows the
-	 * device driver to implement its own memory management.)
+	 * Called once the page refcount reaches 0. The reference count
+	 * should be reset to one with init_page_count(page) before reusing
+	 * the page. This allows the device driver to implement its own
+	 * memory management.
 	 */
 	void (*page_free)(struct page *page);
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index b2f370f0b420..2159c2477aa3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1092,39 +1092,6 @@ static inline bool is_zone_device_page(const struct page *page)
 }
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page);
-DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
-
-static inline bool page_is_devmap_managed(struct page *page)
-{
-	if (!static_branch_unlikely(&devmap_managed_key))
-		return false;
-	if (!is_zone_device_page(page))
-		return false;
-	switch (page->pgmap->type) {
-	case MEMORY_DEVICE_PRIVATE:
-	case MEMORY_DEVICE_FS_DAX:
-		return true;
-	default:
-		break;
-	}
-	return false;
-}
-
-void put_devmap_managed_page(struct page *page);
-
-#else /* CONFIG_DEV_PAGEMAP_OPS */
-static inline bool page_is_devmap_managed(struct page *page)
-{
-	return false;
-}
-
-static inline void put_devmap_managed_page(struct page *page)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static inline bool is_device_private_page(const struct page *page)
 {
 	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
@@ -1171,17 +1138,6 @@ static inline void put_page(struct page *page)
 {
 	page = compound_head(page);
 
-	/*
-	 * For devmap managed pages we need to catch refcount transition from
-	 * 2 to 1, when refcount reach one it means the page is free and we
-	 * need to inform the device driver through callback. See
-	 * include/linux/memremap.h and HMM for details.
-	 */
-	if (page_is_devmap_managed(page)) {
-		put_devmap_managed_page(page);
-		return;
-	}
-
 	if (put_page_testzero(page))
 		__put_page(page);
 }
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e7dc3de355b7..1033b19c9c52 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -561,7 +561,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
 	}
 
 	dpage->zone_device_data = rpage;
-	get_page(dpage);
+	init_page_count(dpage);
 	lock_page(dpage);
 	return dpage;
 
diff --git a/mm/gup.c b/mm/gup.c
index e5739a1974d5..9b3e94db3a09 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -177,41 +177,6 @@ bool __must_check try_grab_page(struct page *page, unsigned int flags)
 	return true;
 }
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-static bool __unpin_devmap_managed_user_page(struct page *page)
-{
-	int count, refs = 1;
-
-	if (!page_is_devmap_managed(page))
-		return false;
-
-	if (hpage_pincount_available(page))
-		hpage_pincount_sub(page, 1);
-	else
-		refs = GUP_PIN_COUNTING_BIAS;
-
-	count = page_ref_sub_return(page, refs);
-
-	mod_node_page_state(page_pgdat(page), NR_FOLL_PIN_RELEASED, 1);
-	/*
-	 * devmap page refcounts are 1-based, rather than 0-based: if
-	 * refcount is 1, then the page is free and the refcount is
-	 * stable because nobody holds a reference on the page.
-	 */
-	if (count == 1)
-		free_devmap_managed_page(page);
-	else if (!count)
-		__put_page(page);
-
-	return true;
-}
-#else
-static bool __unpin_devmap_managed_user_page(struct page *page)
-{
-	return false;
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 /**
  * unpin_user_page() - release a dma-pinned page
  * @page:            pointer to page to be released
@@ -227,15 +192,6 @@ void unpin_user_page(struct page *page)
 
 	page = compound_head(page);
 
-	/*
-	 * For devmap managed pages we need to catch refcount transition from
-	 * GUP_PIN_COUNTING_BIAS to 1, when refcount reach one it means the
-	 * page is free and we need to inform the device driver through
-	 * callback. See include/linux/memremap.h and HMM for details.
-	 */
-	if (__unpin_devmap_managed_user_page(page))
-		return;
-
 	if (hpage_pincount_available(page))
 		hpage_pincount_sub(page, 1);
 	else
diff --git a/mm/internal.h b/mm/internal.h
index 10c677655912..c9de39ad5f52 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -620,4 +620,12 @@ struct migration_target_control {
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
index 006dace60b1a..961e09b20543 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <linux/wait_bit.h>
 #include <linux/xarray.h>
+#include "internal.h"
 
 static DEFINE_XARRAY(pgmap_array);
 
@@ -37,39 +38,6 @@ unsigned long memremap_compat_align(void)
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
 
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
-EXPORT_SYMBOL(devmap_managed_key);
-static atomic_t devmap_managed_enable;
-
-static void devmap_managed_enable_put(void)
-{
-	if (atomic_dec_and_test(&devmap_managed_enable))
-		static_branch_disable(&devmap_managed_key);
-}
-
-static int devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-	if (pgmap->type == MEMORY_DEVICE_PRIVATE &&
-	    (!pgmap->ops || !pgmap->ops->page_free)) {
-		WARN(1, "Missing page_free method\n");
-		return -EINVAL;
-	}
-
-	if (atomic_inc_return(&devmap_managed_enable) == 1)
-		static_branch_enable(&devmap_managed_key);
-	return 0;
-}
-#else
-static int devmap_managed_enable_get(struct dev_pagemap *pgmap)
-{
-	return -EINVAL;
-}
-static void devmap_managed_enable_put(void)
-{
-}
-#endif /* CONFIG_DEV_PAGEMAP_OPS */
-
 static void pgmap_array_delete(struct resource *res)
 {
 	xa_store_range(&pgmap_array, PHYS_PFN(res->start), PHYS_PFN(res->end),
@@ -90,16 +58,6 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap)
 	return (res->start + resource_size(res)) >> PAGE_SHIFT;
 }
 
-static unsigned long pfn_next(unsigned long pfn)
-{
-	if (pfn % 1024 == 0)
-		cond_resched();
-	return pfn + 1;
-}
-
-#define for_each_device_pfn(pfn, map) \
-	for (pfn = pfn_first(map); pfn < pfn_end(map); pfn = pfn_next(pfn))
-
 static void dev_pagemap_kill(struct dev_pagemap *pgmap)
 {
 	if (pgmap->ops && pgmap->ops->kill)
@@ -128,12 +86,10 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 {
 	struct resource *res = &pgmap->res;
 	struct page *first_page;
-	unsigned long pfn;
 	int nid;
 
 	dev_pagemap_kill(pgmap);
-	for_each_device_pfn(pfn, pgmap)
-		put_page(pfn_to_page(pfn));
+	percpu_ref_put_many(pgmap->ref, pfn_end(pgmap) - pfn_first(pgmap));
 	dev_pagemap_cleanup(pgmap);
 
 	/* make sure to access a memmap that was actually initialized */
@@ -158,7 +114,6 @@ void memunmap_pages(struct dev_pagemap *pgmap)
 	untrack_pfn(NULL, PHYS_PFN(res->start), resource_size(res));
 	pgmap_array_delete(res);
 	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
-	devmap_managed_enable_put();
 }
 EXPORT_SYMBOL_GPL(memunmap_pages);
 
@@ -192,7 +147,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		.pgprot = PAGE_KERNEL,
 	};
 	int error, is_ram;
-	bool need_devmap_managed = true;
 
 	switch (pgmap->type) {
 	case MEMORY_DEVICE_PRIVATE:
@@ -217,11 +171,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
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
@@ -245,12 +197,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 		}
 	}
 
-	if (need_devmap_managed) {
-		error = devmap_managed_enable_get(pgmap);
-		if (error)
-			return ERR_PTR(error);
-	}
-
 	conflict_pgmap = get_dev_pagemap(PHYS_PFN(res->start), NULL);
 	if (conflict_pgmap) {
 		WARN(1, "Conflicting mapping in same section\n");
@@ -348,7 +294,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
  err_array:
 	dev_pagemap_kill(pgmap);
 	dev_pagemap_cleanup(pgmap);
-	devmap_managed_enable_put();
 	return ERR_PTR(error);
 }
 EXPORT_SYMBOL_GPL(memremap_pages);
@@ -443,14 +388,8 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
 
 #ifdef CONFIG_DEV_PAGEMAP_OPS
-void free_devmap_managed_page(struct page *page)
+static void free_device_private_page(struct page *page)
 {
-	/* notify page idle for dax */
-	if (!is_device_private_page(page)) {
-		wake_up_var(&page->_refcount);
-		return;
-	}
-
 	/* Clear Active bit in case of parallel mark_page_accessed */
 	__ClearPageActive(page);
 	__ClearPageWaiters(page);
@@ -481,4 +420,19 @@ void free_devmap_managed_page(struct page *page)
 	page->mapping = NULL;
 	page->pgmap->ops->page_free(page);
 }
+
+void free_zone_device_page(struct page *page)
+{
+	switch (page->pgmap->type) {
+	case MEMORY_DEVICE_FS_DAX:
+		/* notify page idle */
+		wake_up_var(&page->_refcount);
+		return;
+	case MEMORY_DEVICE_PRIVATE:
+		free_device_private_page(page);
+		return;
+	default:
+		return;
+	}
+}
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
diff --git a/mm/migrate.c b/mm/migrate.c
index aecb1433cf3c..c51749c7cb9d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -380,11 +380,6 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
 {
 	int expected_count = 1;
 
-	/*
-	 * Device public or private pages have an extra refcount as they are
-	 * ZONE_DEVICE pages.
-	 */
-	expected_count += is_device_private_page(page);
 	if (mapping)
 		expected_count += thp_nr_pages(page) + page_has_private(page);
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fab5e97dc9ca..397b0765de97 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6070,6 +6070,9 @@ void __ref memmap_init_zone_device(struct zone *zone,
 
 		__init_single_page(page, pfn, zone_idx, nid);
 
+		/* ZONE_DEVICE pages start with a zero reference count. */
+		set_page_count(page, 0);
+
 		/*
 		 * Mark page reserved as it will need to wait for onlining
 		 * phase for it to be fully associated with a zone.
diff --git a/mm/swap.c b/mm/swap.c
index e7bdf094f76a..769644fe70ef 100644
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
 
@@ -848,30 +847,22 @@ void release_pages(struct page **pages, int nr)
 			locked_pgdat = NULL;
 		}
 
+		page = compound_head(page);
 		if (is_huge_zero_page(page))
 			continue;
 
+		if (!put_page_testzero(page))
+			continue;
+
 		if (is_zone_device_page(page)) {
 			if (locked_pgdat) {
 				spin_unlock_irqrestore(&locked_pgdat->lru_lock,
 						       flags);
 				locked_pgdat = NULL;
 			}
-			/*
-			 * ZONE_DEVICE pages that return 'false' from
-			 * put_devmap_managed_page() do not require special
-			 * processing, and instead, expect a call to
-			 * put_page_testzero().
-			 */
-			if (page_is_devmap_managed(page)) {
-				put_devmap_managed_page(page);
-				continue;
-			}
-		}
-
-		page = compound_head(page);
-		if (!put_page_testzero(page))
+			free_zone_device_page(page);
 			continue;
+		}
 
 		if (PageCompound(page)) {
 			if (locked_pgdat) {
@@ -1151,26 +1142,3 @@ void __init swap_setup(void)
 	 * _really_ don't want to cluster much more
 	 */
 }
-
-#ifdef CONFIG_DEV_PAGEMAP_OPS
-void put_devmap_managed_page(struct page *page)
-{
-	int count;
-
-	if (WARN_ON_ONCE(!page_is_devmap_managed(page)))
-		return;
-
-	count = page_ref_dec_return(page);
-
-	/*
-	 * devmap page refcounts are 1-based, rather than 0-based: if
-	 * refcount is 1, then the page is free and the refcount is
-	 * stable because nobody holds a reference on the page.
-	 */
-	if (count == 1)
-		free_devmap_managed_page(page);
-	else if (!count)
-		__put_page(page);
-}
-EXPORT_SYMBOL(put_devmap_managed_page);
-#endif
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
