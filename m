Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21C3326512
	for <lists+nouveau@lfdr.de>; Fri, 26 Feb 2021 16:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 437EB6EE06;
	Fri, 26 Feb 2021 15:59:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534816EE06;
 Fri, 26 Feb 2021 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LBaKHm661e2/pCw2/WvK+r7G9CV6irEmIaQaUTUrM/I=; b=sW/OjqIpj6duvHj3cvoK44nFoC
 Bbj/3yA8GY9h9BMJAKOOsa5sW+pBKuHPgCK5xKV5CxRPmDmphYR8ev591rOD/YKAznDD1X97olu6c
 JqboHG2zspmXFBui0uTbvpSPO3gWFX/hBaAd3ovQ/+mnW7ZYkfHh6Yzw3clipK+bmYjnenJBrNncl
 EVwfdz5giJvu80Ps9BWVccGfx72XsL1x7uaKseu4ViUxtPcy92u9OLoA8RiBo1yzcbbiZES8i4h+w
 rkil1V1rVJNY20RGNZhZ2F9vLWiPqyCS7yIrh4N+HToimxqsr/RB254l0GAlWbiSjJ2eTpKg8QpRR
 xL62pMxg==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lFfWH-00CD0S-J5; Fri, 26 Feb 2021 15:59:11 +0000
Date: Fri, 26 Feb 2021 15:59:09 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20210226155909.GA2907711@infradead.org>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210226071832.31547-2-apopple@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Subject: Re: [Nouveau] [PATCH v3 1/8] mm: Remove special swap entry functions
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
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 bskeggs@redhat.com, jgg@nvidia.com, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

> -		struct page *page = migration_entry_to_page(entry);
> +		struct page *page = pfn_to_page(swp_offset(entry));

I wonder if keeping a single special_entry_to_page() helper would still
me a useful.  But I'm not entirely sure.  There are also two more open
coded copies of this in the THP migration code.

> -#define free_swap_and_cache(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
> -#define swapcache_prepare(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
> +#define free_swap_and_cache(e) is_special_entry(e)
> +#define swapcache_prepare(e) is_special_entry(e)

Staring at this I'm really, really confused at what this is doing.

Looking a little closer these are the !CONFIG_SWAP stubs, but it could
probably use a comment or two.

>  	} else if (is_migration_entry(entry)) {
> -		page = migration_entry_to_page(entry);
> +		page = pfn_to_page(swp_offset(entry));
>  
>  		rss[mm_counter(page)]++;
>  
> @@ -737,7 +737,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>  			set_pte_at(src_mm, addr, src_pte, pte);
>  		}
>  	} else if (is_device_private_entry(entry)) {
> -		page = device_private_entry_to_page(entry);
> +		page = pfn_to_page(swp_offset(entry));
>  
>  		/*
>  		 * Update rss count even for unaddressable pages, as
> @@ -1274,7 +1274,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  
>  		entry = pte_to_swp_entry(ptent);
>  		if (is_device_private_entry(entry)) {
> -			struct page *page = device_private_entry_to_page(entry);
> +			struct page *page = pfn_to_page(swp_offset(entry));
>  
>  			if (unlikely(details && details->check_mapping)) {
>  				/*
> @@ -1303,7 +1303,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>  		else if (is_migration_entry(entry)) {
>  			struct page *page;
>  
> -			page = migration_entry_to_page(entry);
> +			page = pfn_to_page(swp_offset(entry));
>  			rss[mm_counter(page)]--;
>  		}
>  		if (unlikely(!free_swap_and_cache(entry)))
> @@ -3271,7 +3271,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  			migration_entry_wait(vma->vm_mm, vmf->pmd,
>  					     vmf->address);
>  		} else if (is_device_private_entry(entry)) {
> -			vmf->page = device_private_entry_to_page(entry);
> +			vmf->page = pfn_to_page(swp_offset(entry));
>  			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>  		} else if (is_hwpoison_entry(entry)) {
>  			ret = VM_FAULT_HWPOISON;
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 20ca887ea769..72adcc3d8f5b 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -321,7 +321,7 @@ void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
>  	if (!is_migration_entry(entry))
>  		goto out;
>  
> -	page = migration_entry_to_page(entry);
> +	page = pfn_to_page(swp_offset(entry));
>  
>  	/*
>  	 * Once page cache replacement of page migration started, page_count
> @@ -361,7 +361,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>  	ptl = pmd_lock(mm, pmd);
>  	if (!is_pmd_migration_entry(*pmd))
>  		goto unlock;
> -	page = migration_entry_to_page(pmd_to_swp_entry(*pmd));
> +	page = pfn_to_page(swp_offset(pmd_to_swp_entry(*pmd)));
>  	if (!get_page_unless_zero(page))
>  		goto unlock;
>  	spin_unlock(ptl);
> @@ -2437,7 +2437,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			if (!is_device_private_entry(entry))
>  				goto next;
>  
> -			page = device_private_entry_to_page(entry);
> +			page = pfn_to_page(swp_offset(entry));
>  			if (!(migrate->flags &
>  				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
>  			    page->pgmap->owner != migrate->pgmap_owner)
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 86e3a3688d59..34230d08556a 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -96,7 +96,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>  		if (!is_migration_entry(entry))
>  			return false;
>  
> -		pfn = migration_entry_to_pfn(entry);
> +		pfn = swp_offset(entry);
>  	} else if (is_swap_pte(*pvmw->pte)) {
>  		swp_entry_t entry;
>  
> @@ -105,7 +105,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>  		if (!is_device_private_entry(entry))
>  			return false;
>  
> -		pfn = device_private_entry_to_pfn(entry);
> +		pfn = swp_offset(entry);
>  	} else {
>  		if (!pte_present(*pvmw->pte))
>  			return false;
> @@ -200,7 +200,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>  				if (is_migration_entry(pmd_to_swp_entry(*pvmw->pmd))) {
>  					swp_entry_t entry = pmd_to_swp_entry(*pvmw->pmd);
>  
> -					if (migration_entry_to_page(entry) != page)
> +					if (pfn_to_page(swp_offset(entry)) != page)
>  						return not_found(pvmw);
>  					return true;
>  				}
> -- 
> 2.20.1
> 
---end quoted text---
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
