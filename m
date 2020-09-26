Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA7B279B5A
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 19:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F406E220;
	Sat, 26 Sep 2020 17:26:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573E66E161
 for <nouveau@lists.freedesktop.org>; Sat, 26 Sep 2020 06:41:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2CCB268B02; Sat, 26 Sep 2020 08:41:17 +0200 (CEST)
Date: Sat, 26 Sep 2020 08:41:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200926064116.GB3540@lst.de>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925204442.31348-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sat, 26 Sep 2020 17:26:05 +0000
Subject: Re: [Nouveau] [PATCH 2/2] mm: remove extra ZONE_DEVICE struct page
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 01:44:42PM -0700, Ralph Campbell wrote:
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for ZONE_DEVICE.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>  include/linux/dax.h                    |  2 +-
>  include/linux/memremap.h               |  7 ++-
>  include/linux/mm.h                     | 44 --------------
>  lib/test_hmm.c                         |  2 +-
>  mm/gup.c                               | 44 --------------
>  mm/internal.h                          |  8 +++
>  mm/memremap.c                          | 82 ++++++--------------------
>  mm/migrate.c                           |  5 --
>  mm/page_alloc.c                        |  3 +
>  mm/swap.c                              | 46 +++------------
>  12 files changed, 44 insertions(+), 203 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 7705d5557239..e6ec98325fab 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -711,7 +711,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>  
>  	dpage = pfn_to_page(uvmem_pfn);
>  	dpage->zone_device_data = pvt;
> -	get_page(dpage);
> +	init_page_count(dpage);
>  	lock_page(dpage);
>  	return dpage;
>  out_clear:
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 4e8112fde3e6..ca2e3c3edc36 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -323,7 +323,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>  			return NULL;
>  	}
>  
> -	get_page(page);
> +	init_page_count(page);
>  	lock_page(page);
>  	return page;
>  }
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 3f78ed78d1d6..8d29f38645aa 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -240,7 +240,7 @@ static inline bool dax_mapping(struct address_space *mapping)
>  
>  static inline bool dax_layout_is_idle_page(struct page *page)
>  {
> -	return page_ref_count(page) <= 1;
> +	return page_ref_count(page) == 0;
>  }
>  
>  #endif
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index e5862746751b..f9224f88e4cd 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -65,9 +65,10 @@ enum memory_type {
>  
>  struct dev_pagemap_ops {
>  	/*
> -	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
> -	 * reach 0 refcount unless there is a refcount bug. This allows the
> -	 * device driver to implement its own memory management.)
> +	 * Called once the page refcount reaches 0. The reference count
> +	 * should be reset to one with init_page_count(page) before reusing
> +	 * the page. This allows the device driver to implement its own
> +	 * memory management.
>  	 */
>  	void (*page_free)(struct page *page);
>  
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b2f370f0b420..2159c2477aa3 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1092,39 +1092,6 @@ static inline bool is_zone_device_page(const struct page *page)
>  }
>  #endif
>  
> -#ifdef CONFIG_DEV_PAGEMAP_OPS
> -void free_devmap_managed_page(struct page *page);
> -DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> -
> -static inline bool page_is_devmap_managed(struct page *page)
> -{
> -	if (!static_branch_unlikely(&devmap_managed_key))
> -		return false;
> -	if (!is_zone_device_page(page))
> -		return false;
> -	switch (page->pgmap->type) {
> -	case MEMORY_DEVICE_PRIVATE:
> -	case MEMORY_DEVICE_FS_DAX:
> -		return true;
> -	default:
> -		break;
> -	}
> -	return false;
> -}
> -
> -void put_devmap_managed_page(struct page *page);
> -
> -#else /* CONFIG_DEV_PAGEMAP_OPS */
> -static inline bool page_is_devmap_managed(struct page *page)
> -{
> -	return false;
> -}
> -
> -static inline void put_devmap_managed_page(struct page *page)
> -{
> -}
> -#endif /* CONFIG_DEV_PAGEMAP_OPS */
> -
>  static inline bool is_device_private_page(const struct page *page)
>  {
>  	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> @@ -1171,17 +1138,6 @@ static inline void put_page(struct page *page)
>  {
>  	page = compound_head(page);
>  
> -	/*
> -	 * For devmap managed pages we need to catch refcount transition from
> -	 * 2 to 1, when refcount reach one it means the page is free and we
> -	 * need to inform the device driver through callback. See
> -	 * include/linux/memremap.h and HMM for details.
> -	 */
> -	if (page_is_devmap_managed(page)) {
> -		put_devmap_managed_page(page);
> -		return;
> -	}
> -
>  	if (put_page_testzero(page))
>  		__put_page(page);
>  }
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index e7dc3de355b7..1033b19c9c52 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -561,7 +561,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  	}
>  
>  	dpage->zone_device_data = rpage;
> -	get_page(dpage);
> +	init_page_count(dpage);
>  	lock_page(dpage);
>  	return dpage;
>  

Doesn't test_hmm also need to reinitialize the refcount before freeing
the page in hmm_dmirror_exit?

>  	int error, is_ram;
> -	bool need_devmap_managed = true;
>  
>  	switch (pgmap->type) {
>  	case MEMORY_DEVICE_PRIVATE:
> @@ -217,11 +171,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  		}
>  		break;
>  	case MEMORY_DEVICE_GENERIC:

The MEMORY_DEVICE_PRIVATE cases loses the sanity check that the
page_free method is set.

Otherwise this looks good.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
