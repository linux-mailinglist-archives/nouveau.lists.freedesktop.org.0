Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB4933AC66
	for <lists+nouveau@lfdr.de>; Mon, 15 Mar 2021 08:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDB489394;
	Mon, 15 Mar 2021 07:42:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF7A89394;
 Mon, 15 Mar 2021 07:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=a0crwDimWuDDFbQSyz3+xFwWCr0UuEjinSqp5FgMyJQ=; b=GonZpIh8oQ35/lgbuyAazr754g
 ymArFIK48vHRADKrI7FoPunJP2FDYfPjcCFFX8sZOOXbc5S0+Tv0oLBvzXawhHXhrDIxKE2vDdWGc
 0ZFmYCNt1B0CpKBLvCNl+zazYzJnc05ohUmEkHMLdEde6ONgnLxWkSQkghMm73TA7msRuL53MreVd
 AHAltoj4GcwxUbanRdRiGgz9xDB8SKQ7lpeR2RZ6HcMqRqRk1kwyW+b9j8UPDCRdVTTn5Vwpcac+x
 i0gb0GbEuyZejWop1J3hTZ0QbU8pjf43J2fzmYlAPV68tQYl/0aoNYn8jAGzrDPnnby+8dB0IbjDU
 weKd2ByQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lLhsD-00HNdD-P4; Mon, 15 Mar 2021 07:42:46 +0000
Date: Mon, 15 Mar 2021 07:42:45 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210315074245.GC4136862@infradead.org>
References: <20210312083851.15981-1-apopple@nvidia.com>
 <20210312083851.15981-6-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312083851.15981-6-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v6 5/8] mm: Device exclusive memory access
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
Cc: rcampbell@nvidia.com, willy@infradead.org, daniel@ffwll.ch,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> +Not all devices support atomic access to system memory. To support atomic
> +operations to a shared virtual memory page such a device needs access to that
> +page which is exclusive of any userspace access from the CPU. The
> +``make_device_exclusive_range()`` function can be used to make a memory range
> +inaccessible from userspace.

s/Not all devices/Some devices/ ?

>  static inline int mm_has_notifiers(struct mm_struct *mm)
> @@ -528,7 +534,17 @@ static inline void mmu_notifier_range_init_migrate(
>  {
>  	mmu_notifier_range_init(range, MMU_NOTIFY_MIGRATE, flags, vma, mm,
>  				start, end);
> -	range->migrate_pgmap_owner = pgmap;
> +	range->owner = pgmap;
> +}
> +
> +static inline void mmu_notifier_range_init_exclusive(
> +			struct mmu_notifier_range *range, unsigned int flags,
> +			struct vm_area_struct *vma, struct mm_struct *mm,
> +			unsigned long start, unsigned long end, void *owner)
> +{
> +	mmu_notifier_range_init(range, MMU_NOTIFY_EXCLUSIVE, flags, vma, mm,
> +				start, end);
> +	range->owner = owner;

Maybe just replace mmu_notifier_range_init_migrate with a
mmu_notifier_range_init_owner helper that takes the owner but does
not hard code a type?

>  		}
> +	} else if (is_device_exclusive_entry(entry)) {
> +		page = pfn_swap_entry_to_page(entry);
> +
> +		get_page(page);
> +		rss[mm_counter(page)]++;
> +
> +		if (is_writable_device_exclusive_entry(entry) &&
> +		    is_cow_mapping(vm_flags)) {
> +			/*
> +			 * COW mappings require pages in both
> +			 * parent and child to be set to read.
> +			 */
> +			entry = make_readable_device_exclusive_entry(
> +							swp_offset(entry));
> +			pte = swp_entry_to_pte(entry);
> +			if (pte_swp_soft_dirty(*src_pte))
> +				pte = pte_swp_mksoft_dirty(pte);
> +			if (pte_swp_uffd_wp(*src_pte))
> +				pte = pte_swp_mkuffd_wp(pte);
> +			set_pte_at(src_mm, addr, src_pte, pte);
> +		}

Just cosmetic, but I wonder if should factor this code block into
a little helper.

> +
> +static bool try_to_protect_one(struct page *page, struct vm_area_struct *vma,
> +			unsigned long address, void *arg)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	struct page_vma_mapped_walk pvmw = {
> +		.page = page,
> +		.vma = vma,
> +		.address = address,
> +	};
> +	struct ttp_args *ttp = (struct ttp_args *) arg;

This cast should not be needed.

> +	return ttp.valid && (!page_mapcount(page) ? true : false);

This can be simplified to:

	return ttp.valid && !page_mapcount(page);

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
> +		if (!try_to_protect(pages[i], mm, start, arg)) {
> +			unlock_page(pages[i]);
> +			put_page(pages[i]);
> +			pages[i] = NULL;
> +		}

Should the trylock_page go into try_to_protect to simplify the loop
a little?  Also I wonder if we need make_device_exclusive_range or
should just open code the get_user_pages_remote + try_to_protect
loop in the callers, as that might allow them to also deduct other
information about the found pages.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
