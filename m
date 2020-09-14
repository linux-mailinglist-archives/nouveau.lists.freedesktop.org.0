Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9082699EE
	for <lists+nouveau@lfdr.de>; Tue, 15 Sep 2020 01:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 778D66E822;
	Mon, 14 Sep 2020 23:53:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3BC6E822
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 23:53:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f6001ec0000>; Mon, 14 Sep 2020 16:51:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 14 Sep 2020 16:53:28 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 14 Sep 2020 16:53:28 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 14 Sep 2020 23:53:26 +0000
To: Dan Williams <dan.j.williams@intel.com>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
Date: Mon, 14 Sep 2020 16:53:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1600127468; bh=GSb48WQPQrkgi3bBuccaFuKU67HsPRSlHk+Uq/1GA1o=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=dbMe0ECus2gTUFHe8/EBdTG4bM7a+Szx8krahhX/k29r99HHbmD68ATPlhtwnTF9n
 C7TC982i8Jc/5aPiL2zAOpmuksKWq48vM3OHgCxO7MnVYDNko4Iq++kuBOWAO9LzZE
 Dqg5Q+fKWQ96YvBB6v9Oghw9EljXDcrdFJBKfe1tGWveRagxMvjZr/nq3WA2le6AMr
 h82lKgJNzBp+2CsP6rGlL6SZSf457Gi4YF79V3sMfANnPLN9Hbe7qsSqwbxPIU4EpV
 0zuB+3QAuNzfS4e/E7mmwdT5zpkubVabPUTY83gjy8ryR1p3huULeumACtmkH4AsM0
 LXVytDljms0fA==
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew
 Wilcox <willy@infradead.org>, Bharata B
 Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 Linux MM <linux-mm@kvack.org>, kvm-ppc@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 9/14/20 4:10 PM, Dan Williams wrote:
> On Mon, Sep 14, 2020 at 3:45 PM Ralph Campbell <rcampbell@nvidia.com> wrote:
>>
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>>
>> Matthew Wilcox, Ira Weiny, and others have complained that ZONE_DEVICE
>> struct page reference counting is ugly/broken. This is my attempt to
>> fix it and it works for the HMM migration self tests.
> 
> Can you link to a technical description of what's broken? Or better
> yet, summarize that argument in the changelog?
> 
>> I'm only sending this out as a RFC since I'm not that familiar with the
>> DAX, PMEM, XEN, and other uses of ZONE_DEVICE struct pages allocated
>> with devm_memremap_pages() or memremap_pages() but my best reading of
>> the code looks like it might be OK. I could use help testing these
>> configurations.
> 
> Back in the 4.15 days I could not convince myself that some code paths
> blindly assumed that pages with refcount==0 were on an lru list. Since
> then, struct page has been reorganized to not collide the ->pgmap back
> pointer with the ->lru list and there have been other cleanups for
> page pinning that might make this incremental cleanup viable.
> 
> You also need to fix up ext4_break_layouts() and
> xfs_break_dax_layouts() to expect ->_refcount is 0 instead of 1. This
> also needs some fstests exposure.

Got it. Thanks!

>> I have a modified THP migration patch series that applies on top of
>> this one and is cleaner since I don't have to add code to handle the
>> +1 reference count. The link below is for the earlier v2:
>> ("mm/hmm/nouveau: add THP migration to migrate_vma_*")
>> https://lore.kernel.org/linux-mm/20200902165830.5367-1-rcampbell@nvidia.com
>>
>>
>>   arch/powerpc/kvm/book3s_hv_uvmem.c     |  1 -
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 -
>>   include/linux/memremap.h               |  6 +--
>>   include/linux/mm.h                     | 39 ---------------
>>   lib/test_hmm.c                         |  1 -
>>   mm/gup.c                               | 44 -----------------
>>   mm/memremap.c                          | 20 ++++----
>>   mm/migrate.c                           |  5 --
>>   mm/swap.c                              | 66 +++++++++++---------------
>>   9 files changed, 41 insertions(+), 142 deletions(-)
> 
> This diffstat is indeed appealing.
> 
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> index 84e5a2dc8be5..00d97050d7ff 100644
>> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
>> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
>> @@ -711,7 +711,6 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>>
>>          dpage = pfn_to_page(uvmem_pfn);
>>          dpage->zone_device_data = pvt;
>> -       get_page(dpage);
>>          lock_page(dpage);
>>          return dpage;
>>   out_clear:
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> index a13c6215bba8..2a4bbe01a455 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
>> @@ -324,7 +324,6 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>>                          return NULL;
>>          }
>>
>> -       get_page(page);
>>          lock_page(page);
>>          return page;
>>   }
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 4e9c738f4b31..7dd9802d2612 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -67,9 +67,9 @@ enum memory_type {
>>
>>   struct dev_pagemap_ops {
>>          /*
>> -        * Called once the page refcount reaches 1.  (ZONE_DEVICE pages never
>> -        * reach 0 refcount unless there is a refcount bug. This allows the
>> -        * device driver to implement its own memory management.)
>> +        * Called once the page refcount reaches 0. The reference count is
>> +        * reset to 1 before calling page_free(). This allows the
>> +        * device driver to implement its own memory management.
> 
> I'd clarify the order events / responsibility of the common core
> page_free() and the device specific page_free(). At the same time, why
> not update drivers to expect that the page is already refcount==0 on
> entry? Seems odd to go through all this trouble to make the reference
> count appear to be zero to the wider kernel but expect that drivers
> get a fake reference on entry to their ->page_free() callbacks.

Good point.

Since set_page_refcounted() is defined in mm_interal.h I would have to
move the definition to someplace like page_ref.h or have the drivers
cal init_page_count() or set_page_count() since get_page() calls
VM_BUG_ON_PAGE() if refcount == 0.
I'll move set_page_refcounted() since that is what the page allocator
uses and seems named for the purpose.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
