Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197E31F6BE
	for <lists+nouveau@lfdr.de>; Fri, 19 Feb 2021 10:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10C66E8B3;
	Fri, 19 Feb 2021 09:48:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C1F6E8B3;
 Fri, 19 Feb 2021 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZI0RLkKXb+MTh0o6tijJ0vZsP4VuwukuwPULbyVK0mQ=; b=aYlimAFS+2sygyQngCLjEk9f5x
 0pEI9OFxZfCtaaeKB13nLxYUu4zvXmV0lDajMqRUzu9Fvpow+hMUrjS+a4AHeOOm3IrbhakGPgfpn
 61wibgPfFl0Qz28R5vXOrRfnI8Suo9j3lNM5Hrh781KfWrQ9fNIBPO65IeheJhkMgfy6f7TjjHzcF
 7lc3IUTVHAMhzUlp17Hk51ia8PEStjOvmxozV9TNRIPeJYQJAHZmZI36IYH8HHtTNa7ez5hm8Xhip
 jgD8cGtVcG62iiYBFywTr8VHhKdDUBX7hP5NCnjT5jnVXIVib6izttVigeC6oNafx+KBkILaniIj9
 AOgRJhNg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lD2Nx-002iIr-C7; Fri, 19 Feb 2021 09:47:45 +0000
Date: Fri, 19 Feb 2021 09:47:41 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210219094741.GA641389@infradead.org>
References: <20210219020750.16444-1-apopple@nvidia.com>
 <20210219020750.16444-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210219020750.16444-2-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v2 1/4] hmm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, daniel@ffwll.ch, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, hch@infradead.org,
 linux-mm@kvack.org, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

>  			page = migration_entry_to_page(swpent);
>  		else if (is_device_private_entry(swpent))
>  			page = device_private_entry_to_page(swpent);
> +		else if (is_device_exclusive_entry(swpent))
> +			page = device_exclusive_entry_to_page(swpent);

>  			page = migration_entry_to_page(swpent);
>  		else if (is_device_private_entry(swpent))
>  			page = device_private_entry_to_page(swpent);
> +		else if (is_device_exclusive_entry(swpent))
> +			page = device_exclusive_entry_to_page(swpent);

>  		if (is_device_private_entry(entry))
>  			page = device_private_entry_to_page(entry);
> +
> +		if (is_device_exclusive_entry(entry))
> +			page = device_exclusive_entry_to_page(entry);

Any chance we can come up with a clever scheme to avoid all this
boilerplate code (and maybe also what it gets compiled to)?

> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 866a0fa104c4..5d28ff6d4d80 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -109,6 +109,10 @@ struct hmm_range {
>   */
>  int hmm_range_fault(struct hmm_range *range);
>  
> +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> +			unsigned long end, struct page **pages);
> +vm_fault_t hmm_remove_exclusive_entry(struct vm_fault *vmf);

Can we avoid the hmm naming for new code (we should probably also kill
it off for the existing code)?

> +#define free_swap_and_cache(e) ({(is_migration_entry(e) || is_device_private_entry(e) \
> +					|| is_device_exclusive_entry(e)); })
> +#define swapcache_prepare(e) ({(is_migration_entry(e) || is_device_private_entry(e) \
> +					|| is_device_exclusive_entry(e)); })

Can you turn these into properly formatted inline functions?  As-is this
becomes pretty unreadable.

> +static inline void make_device_exclusive_entry_read(swp_entry_t *entry)
> +{
> +	*entry = swp_entry(SWP_DEVICE_EXCLUSIVE_READ, swp_offset(*entry));
> +}

s/make_device_exclusive_entry_read/mark_device_exclusive_entry_readable/
??

> +
> +static inline swp_entry_t make_device_exclusive_entry(struct page *page, bool write)
> +{
> +	return swp_entry(write ? SWP_DEVICE_EXCLUSIVE_WRITE : SWP_DEVICE_EXCLUSIVE_READ,
> +			 page_to_pfn(page));
> +}

I'd split this into two helpers, which is easier to follow and avoids
the pointlessly overlong lines.

> +static inline bool is_device_exclusive_entry(swp_entry_t entry)
> +{
> +	int type = swp_type(entry);
> +	return type == SWP_DEVICE_EXCLUSIVE_READ || type == SWP_DEVICE_EXCLUSIVE_WRITE;
> +}

Another overly long line.  I also wouldn't bother with the local
variable:

	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_READ ||
		swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
		

> +static inline bool is_write_device_exclusive_entry(swp_entry_t entry)
> +{
> +	return swp_type(entry) == SWP_DEVICE_EXCLUSIVE_WRITE;
> +}

Or reuse these kind of helpers..

> +
> +static inline unsigned long device_exclusive_entry_to_pfn(swp_entry_t entry)
> +{
> +	return swp_offset(entry);
> +}
> +
> +static inline struct page *device_exclusive_entry_to_page(swp_entry_t entry)
> +{
> +	return pfn_to_page(swp_offset(entry));
> +}

I'd rather open code these two, and as a prep patch also kill off the
equivalents for the migration and device private entries, which would
actually clean up a lot of the mess mentioned in my first comment above.

> +static int hmm_exclusive_skip(unsigned long start,
> +		      unsigned long end,
> +		      __always_unused int depth,
> +		      struct mm_walk *walk)
> +{
> +	struct hmm_exclusive_walk *hmm_exclusive_walk = walk->private;
> +	unsigned long addr;
> +
> +	for (addr = start; addr < end; addr += PAGE_SIZE)
> +		hmm_exclusive_walk->pages[hmm_exclusive_walk->npages++] = NULL;
> +
> +	return 0;
> +}

Wouldn't pre-zeroing the array be simpler and more efficient?

> +int hmm_exclusive_range(struct mm_struct *mm, unsigned long start,
> +			unsigned long end, struct page **pages)
> +{
> +	struct hmm_exclusive_walk hmm_exclusive_walk = { .pages = pages, .npages = 0 };
> +	int i;
> +
> +	/* Collect and lock candidate pages */
> +	walk_page_range(mm, start, end, &hmm_exclusive_walk_ops, &hmm_exclusive_walk);

Please avoid the overly long lines.

But more importantly:  Unless I'm missing something obvious this
walk_page_range call just open codes get_user_pages_fast, why can't you
use that?

> +#if defined(CONFIG_ARCH_ENABLE_THP_MIGRATION) || defined(CONFIG_HUGETLB)
> +		if (PageTransHuge(page)) {
> +			VM_BUG_ON_PAGE(1, page);
> +			continue;
> +		}
> +#endif

Doesn't PageTransHuge always return false for that case?  If not
shouldn't we make sure it does?

> +
> +		pte = pte_mkold(mk_pte(page, READ_ONCE(vma->vm_page_prot)));
> +		if (pte_swp_soft_dirty(*pvmw.pte))
> +			pte = pte_mksoft_dirty(pte);
> +
> +		entry = pte_to_swp_entry(*pvmw.pte);
> +		if (pte_swp_uffd_wp(*pvmw.pte))
> +			pte = pte_mkuffd_wp(pte);
> +		else if (is_write_device_exclusive_entry(entry))
> +			pte = maybe_mkwrite(pte_mkdirty(pte), vma);
> +
> +		set_pte_at(vma->vm_mm, pvmw.address, pvmw.pte, pte);
> +
> +		/*
> +		 * No need to take a page reference as one was already
> +		 * created when the swap entry was made.
> +		 */
> +		if (PageAnon(page))
> +			page_add_anon_rmap(page, vma, pvmw.address, false);
> +		else
> +			page_add_file_rmap(page, false);
> +
> +		if (vma->vm_flags & VM_LOCKED)
> +			mlock_vma_page(page);
> +
> +		/*
> +		 * No need to invalidate - it was non-present before. However
> +		 * secondary CPUs may have mappings that need invalidating.
> +		 */
> +		update_mmu_cache(vma, pvmw.address, pvmw.pte);

It would be nice to split out the body of this loop into a helper.

> +				if (!is_device_private_entry(entry) &&
> +					!is_device_exclusive_entry(entry))

The normal style for this would be:

				if (!is_device_private_entry(entry) &&
				    !is_device_exclusive_entry(entry))

> -		if (!is_device_private_entry(entry))
> +		if (!is_device_private_entry(entry) && !is_device_exclusive_entry(entry))

Plase split this into two lines.

> @@ -216,6 +219,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  	}
>  	if (!map_pte(pvmw))
>  		goto next_pte;
> +
>  	while (1) {
>  		if (check_pte(pvmw))
>  			return true;

Spurious whitespace change.

> -	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & TTU_MIGRATION) &&
> +	if (IS_ENABLED(CONFIG_MIGRATION) && (flags & (TTU_MIGRATION | TTU_EXCLUSIVE)) &&

Please split this into two lines.

>  	    is_zone_device_page(page) && !is_device_private_page(page))
>  		return true;
>  
> @@ -1591,6 +1591,33 @@ static bool try_to_unmap_one(struct page *page, struct vm_area_struct *vma,
>  			/* We have to invalidate as we cleared the pte */
>  			mmu_notifier_invalidate_range(mm, address,
>  						      address + PAGE_SIZE);
> +		} else if (flags & TTU_EXCLUSIVE) {

try_to_unmap_one has turned into a monster.  A little refactoring to
split it into managable pieces would be nice.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
