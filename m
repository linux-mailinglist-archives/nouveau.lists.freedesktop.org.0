Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A049C3A08F6
	for <lists+nouveau@lfdr.de>; Wed,  9 Jun 2021 03:24:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E92D6EC71;
	Wed,  9 Jun 2021 01:24:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A296E204
 for <nouveau@lists.freedesktop.org>; Tue,  8 Jun 2021 18:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623177236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=delY2SS1lhupvaRgnNu9Xn4xsk68fX/j14ghIq7gu1s=;
 b=Typv4xLA1Wiiv3Nv97Od6KsrE+qL4WS5hkGMNPIIZfUiYFGOgVjQm2SJ1FHeJ7U4h75q3p
 vTPSn1Y1ioCiNefV0T6ky/peSjRrC7NVis4PU5txe9ZgGwHiusXBIJ2ZEZG/dSjVi907Mh
 yGf5vvbg5a0RuRNVm1K1HmzdJpUZOAo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-a4zZLEmROt-XGq5z-VsBlw-1; Tue, 08 Jun 2021 14:33:55 -0400
X-MC-Unique: a4zZLEmROt-XGq5z-VsBlw-1
Received: by mail-qk1-f199.google.com with SMTP id
 c15-20020ae9e20f0000b02903aafa8c83e7so1333804qkc.21
 for <nouveau@lists.freedesktop.org>; Tue, 08 Jun 2021 11:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=delY2SS1lhupvaRgnNu9Xn4xsk68fX/j14ghIq7gu1s=;
 b=sERyJcWWWqmaLu9SakGpC5/OHM7yho0WMRTAnt/aC7499/Pe9l7y5nbGaoFr0WekAt
 Nmu5Q4/Ld6i4cGi2iqqwOwVbaOk5eOGCLlOmORZrX55veKaPHaDtSwkSA8FZAkCCw6dv
 UQR1rTsKMII0oCE7SI7JNmBgHI6G4D1x9taCJZLRzFl05ZG4mFN+OJUsoghgjCLsAdS3
 /TG/gaqBmcgzw8sI8Z0G2JZvTETg/infpYwSbttyQu3K4WJ+xeHDsmOZg+xcf5rkNCWe
 z2ermjbMCHzMvAMsLb8kUVN3+YfbwA2OelNQo+dVtMrihVOslQKDBAk0KwJulRIf30KE
 z1qQ==
X-Gm-Message-State: AOAM530ZNCsqUlJhdtQuWI+fihmYjUIJNuZgwq9z5mZOeKO/6gOTDe+m
 9ykZsflSZNh80ws+2J0a75KxtKwMPHriiKoOvr+L7xzpTto0Bk39GW3m7/519lFvn5QzYjmEITn
 33QpOMn8lNhSSSZtMiQRAxl9ibw==
X-Received: by 2002:ac8:74d3:: with SMTP id j19mr17841561qtr.208.1623177234623; 
 Tue, 08 Jun 2021 11:33:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCzpIjpybZgCqNOGL7UtIAt5dTDg/VWSRnVpPRNFhhv0BAITQtxCHxRMSpNs30HAG02DhEqA==
X-Received: by 2002:ac8:74d3:: with SMTP id j19mr17841531qtr.208.1623177234325; 
 Tue, 08 Jun 2021 11:33:54 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id i21sm12311627qkl.20.2021.06.08.11.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 11:33:53 -0700 (PDT)
Date: Tue, 8 Jun 2021 14:33:52 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <YL+4ENiwbn9QAa2V@t490s>
References: <20210607075855.5084-1-apopple@nvidia.com>
 <20210607075855.5084-8-apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210607075855.5084-8-apopple@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 09 Jun 2021 01:24:46 +0000
Subject: Re: [Nouveau] [PATCH v10 07/10] mm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 shakeelb@google.com, bskeggs@redhat.com, jgg@nvidia.com,
 akpm@linux-foundation.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jun 07, 2021 at 05:58:52PM +1000, Alistair Popple wrote:

[...]

> +static bool page_make_device_exclusive_one(struct page *page,
> +		struct vm_area_struct *vma, unsigned long address, void *priv)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	struct page_vma_mapped_walk pvmw = {
> +		.page = page,
> +		.vma = vma,
> +		.address = address,
> +	};
> +	struct make_exclusive_args *args = priv;
> +	pte_t pteval;
> +	struct page *subpage;
> +	bool ret = true;
> +	struct mmu_notifier_range range;
> +	swp_entry_t entry;
> +	pte_t swp_pte;
> +
> +	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
> +				      vma->vm_mm, address, min(vma->vm_end,
> +				      address + page_size(page)), args->owner);
> +	mmu_notifier_invalidate_range_start(&range);
> +
> +	while (page_vma_mapped_walk(&pvmw)) {
> +		/* Unexpected PMD-mapped THP? */
> +		VM_BUG_ON_PAGE(!pvmw.pte, page);

[1]

> +
> +		if (!pte_present(*pvmw.pte)) {
> +			ret = false;
> +			page_vma_mapped_walk_done(&pvmw);
> +			break;
> +		}
> +
> +		subpage = page - page_to_pfn(page) + pte_pfn(*pvmw.pte);
> +		address = pvmw.address;

I raised a question here previously and didn't get an answer...

https://lore.kernel.org/linux-mm/YLDr%2FRyAdUR4q0kk@t490s/

I think I get your point now and it does look possible that the split page can
still be mapped somewhere else as thp, then having some subpage maintainance
looks necessary.  The confusing part is above [1] you've also got that
VM_BUG_ON_PAGE() assuming it must not be a mapped pmd at all..

Then I remembered these code majorly come from the try_to_unmap() so I looked
there.  I _think_ what's missing here is something like:

	if (flags & TTU_SPLIT_HUGE_PMD)
		split_huge_pmd_address(vma, address, false, page);

at the entry of page_make_device_exclusive_one()?

That !pte assertion in try_to_unmap() makes sense to me as long as it has split
the thp page first always.  However seems not the case for FOLL_SPLIT_PMD as
you previously mentioned.

Meanwhile, I also started to wonder whether it's even right to call rmap_walk()
with tail pages...  Please see below.

> +
> +		/* Nuke the page table entry. */
> +		flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
> +		pteval = ptep_clear_flush(vma, address, pvmw.pte);
> +
> +		/* Move the dirty bit to the page. Now the pte is gone. */
> +		if (pte_dirty(pteval))
> +			set_page_dirty(page);
> +
> +		/*
> +		 * Check that our target page is still mapped at the expected
> +		 * address.
> +		 */
> +		if (args->mm == mm && args->address == address &&
> +		    pte_write(pteval))
> +			args->valid = true;
> +
> +		/*
> +		 * Store the pfn of the page in a special migration
> +		 * pte. do_swap_page() will wait until the migration
> +		 * pte is removed and then restart fault handling.
> +		 */
> +		if (pte_write(pteval))
> +			entry = make_writable_device_exclusive_entry(
> +							page_to_pfn(subpage));
> +		else
> +			entry = make_readable_device_exclusive_entry(
> +							page_to_pfn(subpage));
> +		swp_pte = swp_entry_to_pte(entry);
> +		if (pte_soft_dirty(pteval))
> +			swp_pte = pte_swp_mksoft_dirty(swp_pte);
> +		if (pte_uffd_wp(pteval))
> +			swp_pte = pte_swp_mkuffd_wp(swp_pte);
> +
> +		set_pte_at(mm, address, pvmw.pte, swp_pte);
> +
> +		/*
> +		 * There is a reference on the page for the swap entry which has
> +		 * been removed, so shouldn't take another.
> +		 */
> +		page_remove_rmap(subpage, false);
> +	}
> +
> +	mmu_notifier_invalidate_range_end(&range);
> +
> +	return ret;
> +}
> +
> +/**
> + * page_make_device_exclusive - mark the page exclusively owned by a device
> + * @page: the page to replace page table entries for
> + * @mm: the mm_struct where the page is expected to be mapped
> + * @address: address where the page is expected to be mapped
> + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier callbacks
> + *
> + * Tries to remove all the page table entries which are mapping this page and
> + * replace them with special device exclusive swap entries to grant a device
> + * exclusive access to the page. Caller must hold the page lock.
> + *
> + * Returns false if the page is still mapped, or if it could not be unmapped
> + * from the expected address. Otherwise returns true (success).
> + */
> +static bool page_make_device_exclusive(struct page *page, struct mm_struct *mm,
> +				unsigned long address, void *owner)
> +{
> +	struct make_exclusive_args args = {
> +		.mm = mm,
> +		.address = address,
> +		.owner = owner,
> +		.valid = false,
> +	};
> +	struct rmap_walk_control rwc = {
> +		.rmap_one = page_make_device_exclusive_one,
> +		.done = page_not_mapped,
> +		.anon_lock = page_lock_anon_vma_read,
> +		.arg = &args,
> +	};
> +
> +	/*
> +	 * Restrict to anonymous pages for now to avoid potential writeback
> +	 * issues.
> +	 */
> +	if (!PageAnon(page))
> +		return false;
> +
> +	rmap_walk(page, &rwc);

Here we call rmap_walk() on each page we've got.  If it was thp then IIUC it'll
become the tail pages to walk as the outcome of FOLL_SPLIT_PMD gup (please
refer to the last reply of mine).  However now I'm uncertain whether we can do
rmap_walk on tail page at all...  As rmap_walk_anon() has thp_nr_pages() which
has:

	VM_BUG_ON_PGFLAGS(PageTail(page), page);

So... for thp mappings, wondering whether we should do normal GUP (without
SPLIT), pass in always normal or head pages into rmap_walk(), but then
unconditionally split_huge_pmd_address() in page_make_device_exclusive_one()?

Please correct me if I made silly mistakes on above, as I am looking at the
code when/during trying to review the patch, so it's possible I missed
something again.  Neither does this code a huge matter since it's not in
general mm path, but still raise this question up.

Thanks,

> +
> +	return args.valid && !page_mapcount(page);
> +}
> +
> +/**
> + * make_device_exclusive_range() - Mark a range for exclusive use by a device
> + * @mm: mm_struct of assoicated target process
> + * @start: start of the region to mark for exclusive device access
> + * @end: end address of region
> + * @pages: returns the pages which were successfully marked for exclusive access
> + * @owner: passed to MMU_NOTIFY_EXCLUSIVE range notifier to allow filtering
> + *
> + * Returns: number of pages found in the range by GUP. A page is marked for
> + * exclusive access only if the page pointer is non-NULL.
> + *
> + * This function finds ptes mapping page(s) to the given address range, locks
> + * them and replaces mappings with special swap entries preventing userspace CPU
> + * access. On fault these entries are replaced with the original mapping after
> + * calling MMU notifiers.
> + *
> + * A driver using this to program access from a device must use a mmu notifier
> + * critical section to hold a device specific lock during programming. Once
> + * programming is complete it should drop the page lock and reference after
> + * which point CPU access to the page will revoke the exclusive access.
> + */
> +int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
> +				unsigned long end, struct page **pages,
> +				void *owner)
> +{
> +	long npages = (end - start) >> PAGE_SHIFT;
> +	unsigned long i;
> +
> +	npages = get_user_pages_remote(mm, start, npages,
> +				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
> +				       pages, NULL, NULL);
> +	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
> +		if (!trylock_page(pages[i])) {
> +			put_page(pages[i]);
> +			pages[i] = NULL;
> +			continue;
> +		}
> +
> +		if (!page_make_device_exclusive(pages[i], mm, start, owner)) {
> +			unlock_page(pages[i]);
> +			put_page(pages[i]);
> +			pages[i] = NULL;
> +		}
> +	}
> +
> +	return npages;
> +}
> +EXPORT_SYMBOL_GPL(make_device_exclusive_range);
> +#endif
> +
>  void __put_anon_vma(struct anon_vma *anon_vma)
>  {
>  	struct anon_vma *root = anon_vma->root;
> -- 
> 2.20.1
> 

-- 
Peter Xu

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
