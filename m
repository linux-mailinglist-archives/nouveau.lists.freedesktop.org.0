Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F0288F36
	for <lists+nouveau@lfdr.de>; Fri,  9 Oct 2020 18:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752516ED45;
	Fri,  9 Oct 2020 16:53:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF54B6ED45
 for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2020 16:53:52 +0000 (UTC)
IronPort-SDR: NOoXw/avzBd6freQbfmWezSCzas+6Rudqw6diDILZ0qwOaj0kKevEHF0uU09JiaEyIiDyS5q6d
 weqH+wOGt1Tg==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145376912"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145376912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 09:53:51 -0700
IronPort-SDR: cZPsX0pTjYEGuD0ArdpSCuRg3di0O8Q5VtMLwajHT3ZQMVDnnXcOC/xpo+DvF5F75jcclyC3Q9
 zRwAKC+0JvpA==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="528996042"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 09:53:50 -0700
Date: Fri, 9 Oct 2020 09:53:50 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20201009165350.GV2046448@iweiny-DESK2.sc.intel.com>
References: <20201008172544.29905-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008172544.29905-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
Subject: Re: [Nouveau] [PATCH] mm: make device private reference counts zero
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, kvm-ppc@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 10:25:44AM -0700, Ralph Campbell wrote:
> ZONE_DEVICE struct pages have an extra reference count that complicates the
> code for put_page() and several places in the kernel that need to check the
> reference count to see that a page is not being used (gup, compaction,
> migration, etc.). Clean up the code so the reference count doesn't need to
> be treated specially for device private pages, leaving DAX as still being
> a special case.

What about the check in mc_handle_swap_pte()?

mm/memcontrol.c:

5513                 /*
5514                  * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
5515                  * a refcount of 1 when free (unlike normal page)
5516                  */
5517                 if (!page_ref_add_unless(page, 1, 1))
5518                         return NULL;

... does that need to change?  Perhaps just the comment?

> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
> 

[snip]

>  
>  void put_devmap_managed_page(struct page *page);
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index e151a7f10519..bf92a261fa6f 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -509,10 +509,15 @@ static bool dmirror_allocate_chunk(struct dmirror_device *mdevice,
>  		mdevice->devmem_count * (DEVMEM_CHUNK_SIZE / (1024 * 1024)),
>  		pfn_first, pfn_last);
>  
> +	/*
> +	 * Pages are created with an initial reference count of one but should
> +	 * have a reference count of zero while in the free state.
> +	 */
>  	spin_lock(&mdevice->lock);
>  	for (pfn = pfn_first; pfn < pfn_last; pfn++) {
>  		struct page *page = pfn_to_page(pfn);
>  
> +		set_page_count(page, 0);

This confuses me.  How does this and init_page_count() not confuse the buddy
allocator?  Don't you have to reset the refcount somewhere after the test?

>  		page->zone_device_data = mdevice->free_pages;
>  		mdevice->free_pages = page;
>  	}
> @@ -561,7 +566,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>  	}
>  
>  	dpage->zone_device_data = rpage;
> -	get_page(dpage);
> +	init_page_count(dpage);
>  	lock_page(dpage);
>  	return dpage;
>  
> diff --git a/mm/internal.h b/mm/internal.h
> index c43ccdddb0f6..e1443b73aa9b 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
>  

[snip]

> diff --git a/mm/swap.c b/mm/swap.c
> index 0eb057141a04..93d880c6f73c 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -116,12 +116,11 @@ static void __put_compound_page(struct page *page)
>  void __put_page(struct page *page)
>  {
>  	if (is_zone_device_page(page)) {
> -		put_dev_pagemap(page->pgmap);
> -
>  		/*
>  		 * The page belongs to the device that created pgmap. Do
>  		 * not return it to page allocator.
>  		 */
> +		free_zone_device_page(page);

I really like this.

Ira

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
