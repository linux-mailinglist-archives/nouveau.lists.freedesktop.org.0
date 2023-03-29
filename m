Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874C96CD093
	for <lists+nouveau@lfdr.de>; Wed, 29 Mar 2023 05:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72D5310E4B1;
	Wed, 29 Mar 2023 03:16:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD45610E4B1
 for <nouveau@lists.freedesktop.org>; Wed, 29 Mar 2023 03:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=x2QU0i8AOW8SXapwpIOh0yTZpKuiJGcrxVeB4KLZ04A=; b=PqzjDIvqDKFOF8Ej3/Ldr8z2DH
 /ZB7NpsdY8HR2kiuJHh/ZZRUShsjh8HGhYlyssQ71V/ZSouwnTwdeoUccrwIa0upRJyrIEuCPQZHK
 O19uxnE/h3Lj8r7KqXRW4dW2cxqFdKfgtPd/72DVu22mxQ78rC8qyNqdilYel3VHmbGcfHLxXqmKL
 D2FTjbWnL163Z0WftJQjXtnwFjFWaZK7ImGz8igET0N02VKgSQ3juruCZGf4zMCastH7yUrc44KY0
 KCb6cpGOgIuP0nxGqaf6lj4I+RpA+oIcWxqPl5UHyizyAtMgpRbpkFeuz3F3OCRdSjI7brRKfvZIf
 it3JtAgA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1phMIT-00929p-Ap; Wed, 29 Mar 2023 03:16:25 +0000
Date: Wed, 29 Mar 2023 04:16:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <ZCOtiZFoxC6w/eoZ@casper.infradead.org>
References: <20230328021434.292971-1-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230328021434.292971-1-apopple@nvidia.com>
Subject: Re: [Nouveau] [PATCH] mm: Take a page reference when removing
 device exclusive entries
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 28, 2023 at 01:14:34PM +1100, Alistair Popple wrote:
> +++ b/mm/memory.c
> @@ -3623,8 +3623,19 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
>  	struct vm_area_struct *vma = vmf->vma;
>  	struct mmu_notifier_range range;
>  
> -	if (!folio_lock_or_retry(folio, vma->vm_mm, vmf->flags))
> +	/*
> +	 * We need a page reference to lock the page because we don't
> +	 * hold the PTL so a racing thread can remove the
> +	 * device-exclusive entry and unmap the page. If the page is
> +	 * free the entry must have been removed already.
> +	 */
> +	if (!get_page_unless_zero(vmf->page))
> +		return 0;

From a folio point of view: what the hell are you doing here?  Tail
pages don't have individual refcounts; all the refcounts are actually
taken on the folio.  So this should be:

	if (!folio_try_get(folio))
		return 0;

(you can fix up the comment yourself)

> +	if (!folio_lock_or_retry(folio, vma->vm_mm, vmf->flags)) {
> +		put_page(vmf->page);

folio_put(folio);

>  		return VM_FAULT_RETRY;
> +	}
>  	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_EXCLUSIVE, 0, vma,
>  				vma->vm_mm, vmf->address & PAGE_MASK,
>  				(vmf->address & PAGE_MASK) + PAGE_SIZE, NULL);
> @@ -3637,6 +3648,7 @@ static vm_fault_t remove_device_exclusive_entry(struct vm_fault *vmf)
>  
>  	pte_unmap_unlock(vmf->pte, vmf->ptl);
>  	folio_unlock(folio);
> +	put_page(vmf->page);

folio_put(folio)

There, I just saved you 3 calls to compound_head(), saving roughly 150
bytes of kernel text.

>  	mmu_notifier_invalidate_range_end(&range);
>  	return 0;
> -- 
> 2.39.2
> 
> 
