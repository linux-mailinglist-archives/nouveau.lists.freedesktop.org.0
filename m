Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA627B768
	for <lists+nouveau@lfdr.de>; Tue, 29 Sep 2020 00:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A7889E1D;
	Mon, 28 Sep 2020 22:29:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B17C89E1D
 for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2020 22:29:28 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7263960000>; Mon, 28 Sep 2020 15:28:38 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 28 Sep
 2020 22:29:24 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20200925204442.31348-1-rcampbell@nvidia.com>
 <20200925204442.31348-3-rcampbell@nvidia.com> <20200926064116.GB3540@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <78746c2f-4bbb-886f-6eb6-0daffab8be3f@nvidia.com>
Date: Mon, 28 Sep 2020 15:29:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200926064116.GB3540@lst.de>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601332118; bh=ntlK3Xi4LRi5JEwFdimDv+bjXFI0l+EMLXJlC3bQqIo=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=p+5vdv8JLToXbkMmRk7a4etC29I/vEqOTkTM+BP6PCvq8/5JBz/n6y5wSi+CIRqrL
 vzauJc3enPL/CL5m/kIxahvUYZwNmqhnSze1+RAQvbPbZ5BcFErSe/vtmTl8Ju3roI
 k6gj0REdmzH+87NjkeLyC9Tv1Mz89CcLz0CVd0PSQEUxFO+3CKMNR/sKmlqMOFXiim
 0LxBkAntA2XFm4Kumm1ThCARsbAYSqekzue1TSj7Qn1RlBBurKZpBwo8DsqsNyTB/s
 GpYRxmbyeILVoxewkJ/ODDzdDFagQVpK732chT36eASHb4Z7nRS/u/m1pfcRd+04WT
 x2y64mfoCE0Ug==
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
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 9/25/20 11:41 PM, Christoph Hellwig wrote:
> On Fri, Sep 25, 2020 at 01:44:42PM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>>   include/linux/dax.h                    |  2 +-
>>   include/linux/memremap.h               |  7 ++-
>>   include/linux/mm.h                     | 44 --------------
>>   lib/test_hmm.c                         |  2 +-
>>   mm/gup.c                               | 44 --------------
>>   mm/internal.h                          |  8 +++
>>   mm/memremap.c                          | 82 ++++++--------------------
>>   mm/migrate.c                           |  5 --
>>   mm/page_alloc.c                        |  3 +
>>   mm/swap.c                              | 46 +++------------
>>   12 files changed, 44 insertions(+), 203 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index 7705d5557239..e6ec98325fab 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -711,7 +711,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>   
>>   	dpage = pfn_to_page(uvmem_pfn);
>>   	dpage->zone_device_data = pvt;
>> -	get_page(dpage);
>> +	init_page_count(dpage);
>>   	lock_page(dpage);
>>   	return dpage;
>>   out_clear:
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index 4e8112fde3e6..ca2e3c3edc36 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -323,7 +323,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>>   			return NULL;
>>   	}
>>   
>> -	get_page(page);
>> +	init_page_count(page);
>>   	lock_page(page);
>>   	return page;
>>   }
>> diff --git a/include/linux/dax.h b/include/linux/dax.h
>> index 3f78ed78d1d6..8d29f38645aa 100644
>> --- a/include/linux/dax.h
>> +++ b/include/linux/dax.h
>> @@ -240,7 +240,7 @@ static inline bool dax_mapping(struct address_space *mapping)
>>   
>>   static inline bool dax_layout_is_idle_page(struct page *page)
>>   {
>> -	return page_ref_count(page) <= 1;
>> +	return page_ref_count(page) == 0;
>>   }
>>   
>>   #endif
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index e5862746751b..f9224f88e4cd 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -65,9 +65,10 @@ enum memory_type {
>>   
>>   struct dev_pagemap_ops {
>>   	/*
>> -	 * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
>> -	 * reach 0 refcount unless there is a refcount bug. This allows the
>> -	 * device driver to implement its own memory management.)
>> +	 * Called once the page refcount reaches 0. The reference count
>> +	 * should be reset to one with init_page_count(page) before reusing
>> +	 * the page. This allows the device driver to implement its own
>> +	 * memory management.
>>   	 */
>>   	void (*page_free)(struct page *page);
>>   
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index b2f370f0b420..2159c2477aa3 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1092,39 +1092,6 @@ static inline bool is_zone_device_page(const struct page *page)
>>   }
>>   #endif
>>   
>> -#ifdef CONFIG_DEV_PAGEMAP_OPS
>> -void free_devmap_managed_page(struct page *page);
>> -DECLARE_STATIC_KEY_FALSE(devmap_managed_key);
>> -
>> -static inline bool page_is_devmap_managed(struct page *page)
>> -{
>> -	if (!static_branch_unlikely(&devmap_managed_key))
>> -		return false;
>> -	if (!is_zone_device_page(page))
>> -		return false;
>> -	switch (page->pgmap->type) {
>> -	case MEMORY_DEVICE_PRIVATE:
>> -	case MEMORY_DEVICE_FS_DAX:
>> -		return true;
>> -	default:
>> -		break;
>> -	}
>> -	return false;
>> -}
>> -
>> -void put_devmap_managed_page(struct page *page);
>> -
>> -#else /* CONFIG_DEV_PAGEMAP_OPS */
>> -static inline bool page_is_devmap_managed(struct page *page)
>> -{
>> -	return false;
>> -}
>> -
>> -static inline void put_devmap_managed_page(struct page *page)
>> -{
>> -}
>> -#endif /* CONFIG_DEV_PAGEMAP_OPS */
>> -
>>   static inline bool is_device_private_page(const struct page *page)
>>   {
>>   	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
>> @@ -1171,17 +1138,6 @@ static inline void put_page(struct page *page)
>>   {
>>   	page = compound_head(page);
>>   
>> -	/*
>> -	 * For devmap managed pages we need to catch refcount transition from
>> -	 * 2 to 1, when refcount reach one it means the page is free and we
>> -	 * need to inform the device driver through callback. See
>> -	 * include/linux/memremap.h and HMM for details.
>> -	 */
>> -	if (page_is_devmap_managed(page)) {
>> -		put_devmap_managed_page(page);
>> -		return;
>> -	}
>> -
>>   	if (put_page_testzero(page))
>>   		__put_page(page);
>>   }
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index e7dc3de355b7..1033b19c9c52 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -561,7 +561,7 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>>   	}
>>   
>>   	dpage->zone_device_data = rpage;
>> -	get_page(dpage);
>> +	init_page_count(dpage);
>>   	lock_page(dpage);
>>   	return dpage;
>>   
> 
> Doesn't test_hmm also need to reinitialize the refcount before freeing
> the page in hmm_dmirror_exit?

The dmirror_zero_page is dead code, it isn't used. There is a patch queued in
linux-mm which removes it. Besides, it was allocated with alloc_page() so it
isn't a device private struct page.

>>   	int error, is_ram;
>> -	bool need_devmap_managed = true;
>>   
>>   	switch (pgmap->type) {
>>   	case MEMORY_DEVICE_PRIVATE:
>> @@ -217,11 +171,9 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>>   		}
>>   		break;
>>   	case MEMORY_DEVICE_GENERIC:
> 
> The MEMORY_DEVICE_PRIVATE cases loses the sanity check that the
> page_free method is set.

I'll add that back into memremap_pages() with other sanity checks in v3.

> Otherwise this looks good.

Thanks!
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
