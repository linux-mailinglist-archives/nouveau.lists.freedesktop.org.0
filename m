Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B904926CFFA
	for <lists+nouveau@lfdr.de>; Thu, 17 Sep 2020 02:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F29E6EB6A;
	Thu, 17 Sep 2020 00:34:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FAD6EB6A
 for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2020 00:34:24 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f62aeb60001>; Wed, 16 Sep 2020 17:32:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 16 Sep 2020 17:34:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 17:34:22 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 17 Sep 2020 00:34:18 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <20200916060921.GB7321@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <45942676-a87f-c6ef-1514-cabfc4a5fa8e@nvidia.com>
Date: Wed, 16 Sep 2020 17:34:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200916060921.GB7321@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1600302774; bh=ITgHj0XAkgZskpfmNSquGxzCCfbz03lmRzNgV2/ej+M=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=nWL6vw5KSkD6hKxF7BFJXcCNzF+xJ8M9Yql3tuI3JADmTsTohAupXvlSfifV03/v6
 UTm8uZ1f87FJOmFX3H7GEeDofr2dhnXCn/VmBBNswHn8zAGEbipODNR2B56fntzz+p
 CVnbX49uKq1A3fw1UYwn2A7yxVtqsRspoSCUQ58AlSEGkGMs0b684arpkwVQv3Dj+Z
 d25RhLPZwGFhs1AL2QXTV8Yx+nTiCA9oOBtfwy3LDy0v0P1/5J450jDyL6i/6nx6KK
 CraSEgSYM/wXuhTDx6YLi4lZdq4RZ3RPXt7SPZG+W7RDRAAZANA/0GQgRiVCdaiBxC
 BCZNxIxSLY3fQ==
Subject: Re: [Nouveau] [PATCH] mm: remove extra ZONE_DEVICE struct page
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
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 9/15/20 11:09 PM, Christoph Hellwig wrote:
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 517751310dd2..5a82037a4b26 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1093,34 +1093,6 @@ static inline bool is_zone_device_page(const struct page *page)
>>   #ifdef CONFIG_DEV_PAGEMAP_OPS
>>   void free_devmap_managed_page(struct page *page);
>>   DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> 
> The export for devmap_managed_key can be dropped now.  In fact I think
> we can remove devmap_managed_key entirely now - it is only checked in
> the actual page free path instead of for each refcount manipulation,
> so a good old unlikely is probably enough.
> 
> Also free_devmap_managed_page can move to mm/internal.h.

Good suggestion.

>> +#ifdef CONFIG_DEV_PAGEMAP_OPS
>> +static void __put_devmap_managed_page(struct page *page)
>> +{
>> +	if (!static_branch_unlikely(&devmap_managed_key))
>> +		return;
>> +
>> +	switch (page->pgmap->type) {
>> +	case MEMORY_DEVICE_PRIVATE:
>> +	case MEMORY_DEVICE_FS_DAX:
>> +		free_devmap_managed_page(page);
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +#else
>> +static inline void __put_devmap_managed_page(struct page *page)
>> +{
>> +}
>> +#endif
> 
> I think this should be moved to mm/memremap.c or even better
> actually be folded into free_devmap_managed_page, which would need
> a new name like free_zone_device_page().
> 
> Something like this incremental patch:
> 
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7bb9e93cf86cde..29350dc27cd0cd 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -1090,11 +1090,6 @@ static inline bool is_zone_device_page(const struct page *page)
>   }
>   #endif
>   
> -#ifdef CONFIG_DEV_PAGEMAP_OPS
> -void free_devmap_managed_page(struct page *page);
> -DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
> -#endif /* CONFIG_DEV_PAGEMAP_OPS */
> -
>   static inline bool is_device_private_page(const struct page *page)
>   {
>   	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
> diff --git a/mm/internal.h b/mm/internal.h
> index 6345b08ce86ccf..629959a6f26d7c 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -618,4 +618,12 @@ struct migration_target_control {
>   	gfp_t gfp_mask;
>   };
>   
> +#ifdef CONFIG_DEV_PAGEMAP_OPS
> +void free_zone_device_page(struct page *page);
> +#else
> +static inline void free_zone_device_page(struct page *page)
> +{
> +}
> +#endif
> +
>   #endif	/* __MM_INTERNAL_H */
> diff --git a/mm/memremap.c b/mm/memremap.c
> index d549e3733f4098..b15ad2264a4f1c 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -12,6 +12,7 @@
>   #include <linux/types.h>
>   #include <linux/wait_bit.h>
>   #include <linux/xarray.h>
> +#include "internal.h"
>   
>   static DEFINE_XARRAY(pgmap_array);
>   
> @@ -37,36 +38,6 @@ unsigned long memremap_compat_align(void)
>   EXPORT_SYMBOL_GPL(memremap_compat_align);
>   #endif
>   
> -#ifdef CONFIG_DEV_PAGEMAP_OPS
> -DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
> -EXPORT_SYMBOL(devmap_managed_key);
> -
> -static void devmap_managed_enable_put(void)
> -{
> -	static_branch_dec(&devmap_managed_key);
> -}
> -
> -static int devmap_managed_enable_get(struct dev_pagemap *pgmap)
> -{
> -	if (pgmap->type == MEMORY_DEVICE_PRIVATE &&
> -	    (!pgmap->ops || !pgmap->ops->page_free)) {
> -		WARN(1, "Missing page_free method\n");
> -		return -EINVAL;
> -	}
> -
> -	static_branch_inc(&devmap_managed_key);
> -	return 0;
> -}
> -#else
> -static int devmap_managed_enable_get(struct dev_pagemap *pgmap)
> -{
> -	return -EINVAL;
> -}
> -static void devmap_managed_enable_put(void)
> -{
> -}
> -#endif /* CONFIG_DEV_PAGEMAP_OPS */
> -
>   static void pgmap_array_delete(struct range *range)
>   {
>   	xa_store_range(&pgmap_array, PHYS_PFN(range->start), PHYS_PFN(range->end),
> @@ -181,7 +152,6 @@ void memunmap_pages(struct dev_pagemap *pgmap)
>   		pageunmap_range(pgmap, i);
>   
>   	WARN_ONCE(pgmap->altmap.alloc, "failed to free all reserved pages\n");
> -	devmap_managed_enable_put();
>   }
>   EXPORT_SYMBOL_GPL(memunmap_pages);
>   
> @@ -319,7 +289,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>   		.pgprot = PAGE_KERNEL,
>   	};
>   	const int nr_range = pgmap->nr_range;
> -	bool need_devmap_managed = true;
>   	int error, i;
>   
>   	if (WARN_ONCE(!nr_range, "nr_range must be specified\n"))
> @@ -331,8 +300,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>   			WARN(1, "Device private memory not supported\n");
>   			return ERR_PTR(-EINVAL);
>   		}
> -		if (!pgmap->ops || !pgmap->ops->migrate_to_ram) {
> -			WARN(1, "Missing migrate_to_ram method\n");
> +		if (!pgmap->ops ||
> +		    !pgmap->ops->migrate_to_ram || !pgmap->ops->page_free) {
> +			WARN(1, "Missing ops\n");
>   			return ERR_PTR(-EINVAL);
>   		}
>   		if (!pgmap->owner) {
> @@ -348,11 +318,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>   		}
>   		break;
>   	case MEMORY_DEVICE_GENERIC:
> -		need_devmap_managed = false;
>   		break;
>   	case MEMORY_DEVICE_PCI_P2PDMA:
>   		params.pgprot = pgprot_noncached(params.pgprot);
> -		need_devmap_managed = false;
>   		break;
>   	default:
>   		WARN(1, "Invalid pgmap type %d\n", pgmap->type);
> @@ -376,12 +344,6 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>   		}
>   	}
>   
> -	if (need_devmap_managed) {
> -		error = devmap_managed_enable_get(pgmap);
> -		if (error)
> -			return ERR_PTR(error);
> -	}
> -
>   	/*
>   	 * Clear the pgmap nr_range as it will be incremented for each
>   	 * successfully processed range. This communicates how many
> @@ -496,16 +458,9 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>   EXPORT_SYMBOL_GPL(get_dev_pagemap);
>   
>   #ifdef CONFIG_DEV_PAGEMAP_OPS
> -void free_devmap_managed_page(struct page *page)
> +static void free_device_private_page(struct page *page)
>   {
> -	/* notify page idle for dax */
> -	if (!is_device_private_page(page)) {
> -		wake_up_var(&page->_refcount);
> -		return;
> -	}
> -
>   	__ClearPageWaiters(page);
> -
>   	mem_cgroup_uncharge(page);
>   
>   	/*
> @@ -540,4 +495,19 @@ void free_devmap_managed_page(struct page *page)
>   	page->mapping = NULL;
>   	page->pgmap->ops->page_free(page);
>   }
> +
> +void free_zone_device_page(struct page *page)
> +{
> +	switch (page->pgmap->type) {
> +	case MEMORY_DEVICE_FS_DAX:
> +		/* notify page idle */
> +		wake_up_var(&page->_refcount);
> +		return;
> +	case MEMORY_DEVICE_PRIVATE:
> +		free_device_private_page(page);
> +		return;
> +	default:
> +		return;
> +	}
> +}
>   #endif /* CONFIG_DEV_PAGEMAP_OPS */
> diff --git a/mm/swap.c b/mm/swap.c
> index bcab5db351184a..83451ac70d0f05 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -113,36 +113,14 @@ static void __put_compound_page(struct page *page)
>   	destroy_compound_page(page);
>   }
>   
> -#ifdef CONFIG_DEV_PAGEMAP_OPS
> -static void __put_devmap_managed_page(struct page *page)
> -{
> -	if (!static_branch_unlikely(&devmap_managed_key))
> -		return;
> -
> -	switch (page->pgmap->type) {
> -	case MEMORY_DEVICE_PRIVATE:
> -	case MEMORY_DEVICE_FS_DAX:
> -		free_devmap_managed_page(page);
> -		break;
> -	default:
> -		break;
> -	}
> -}
> -#else
> -static inline void __put_devmap_managed_page(struct page *page)
> -{
> -}
> -#endif
> -
>   void __put_page(struct page *page)
>   {
>   	if (is_zone_device_page(page)) {
> -		__put_devmap_managed_page(page);
> -
>   		/*
>   		 * The page belongs to the device that created pgmap. Do
>   		 * not return it to page allocator.
>   		 */
> +		free_zone_device_page(page);
>   		return;
>   	}
>   
> @@ -923,7 +901,7 @@ void release_pages(struct page **pages, int nr)
>   						       flags);
>   				locked_pgdat = NULL;
>   			}
> -			__put_devmap_managed_page(page);
> +			free_zone_device_page(page);
>   			return;
>   		}
>   
> 

Thanks for the review!
I will apply the above in v2.
I found a couple of more reference count checks in fs/dax.c so I need to
run fstests with dax before sending v2 out.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
