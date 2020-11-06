Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4B2A9E9B
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 21:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE376EB07;
	Fri,  6 Nov 2020 20:34:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB276EB07
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 20:34:53 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa5b36a0000>; Fri, 06 Nov 2020 12:34:50 -0800
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 20:34:49 +0000
To: Matthew Wilcox <willy@infradead.org>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-2-rcampbell@nvidia.com>
 <20201106121407.GQ17076@casper.infradead.org>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <e384a09a-23a2-6a9b-dda6-db93e26c8f66@nvidia.com>
Date: Fri, 6 Nov 2020 12:34:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201106121407.GQ17076@casper.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604694890; bh=3kQ//mMEobyQywMprE0fVaDOJaCYEqZr2rGa9riAH38=;
 h=Subject:To:CC:References:From:X-Nvconfidentiality:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=ZfdPSy+wi5oJm1vMDFZi1SmNpeYM/8prR76BnNgoMkSMSy4w7h5WgBEzZsEPEcS7N
 DRqem5D7qEyAsyuyRSY1i0ypwydJcgYVspVqXuDd3UeWrYgNZ+wbrcfPkA1ygnQn0T
 CgmMWbi80T2WSfm1AmNpNcKF6QcMvRpiihkgA3C35EL15KcKT671+VzYGb8zgXxAOJ
 SLVF/22aNTf29FHM+5IKkAi7SOxnYjbRIIXFE+b9Kjh+qhWw4+VWDRnR6Wd7DV0QQw
 fSpOl7pA3HC2EoGrk4/m0ZED4KnZacd2J5rab7HOFIpKm/ZWATixv9WLIel2nUmv/A
 EnHQPaKIzWVMQ==
Subject: Re: [Nouveau] [PATCH v3 1/6] mm/thp: add
 prep_transhuge_device_private_page()
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 nouveau@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Zi Yan <ziy@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 11/6/20 4:14 AM, Matthew Wilcox wrote:
> On Thu, Nov 05, 2020 at 04:51:42PM -0800, Ralph Campbell wrote:
>> Add a helper function to allow device drivers to create device private
>> transparent huge pages. This is intended to help support device private
>> THP migrations.
> 
> I think you'd be better off with these calling conventions:
> 
> -void prep_transhuge_page(struct page *page)
> +struct page *thp_prep(struct page *page)
>   {
> +       if (!page || compound_order(page) == 0)
> +               return page;
>          /*
> -        * we use page->mapping and page->indexlru in second tail page
> +        * we use page->mapping and page->index in second tail page
>           * as list_head: assuming THP order >= 2
>           */
> +       BUG_ON(compound_order(page) == 1);
>   
>          INIT_LIST_HEAD(page_deferred_list(page));
>          set_compound_page_dtor(page, TRANSHUGE_PAGE_DTOR);
> +
> +       return page;
>   }
> 
> It simplifies the users.

I'm not sure what the simplification is.
If you mean the name change from prep_transhuge_page() to thp_prep(),
that seems fine to me. The following could also be renamed to
thp_prep_device_private_page() or similar.

>> +void prep_transhuge_device_private_page(struct page *page)
>> +{
>> +	prep_compound_page(page, HPAGE_PMD_ORDER);
>> +	prep_transhuge_page(page);
>> +	/* Only the head page has a reference to the pgmap. */
>> +	percpu_ref_put_many(page->pgmap->ref, HPAGE_PMD_NR - 1);
>> +}
>> +EXPORT_SYMBOL_GPL(prep_transhuge_device_private_page);
> 
> Something else that may interest you from my patch series is support
> for page sizes other than PMD_SIZE.  I don't know what page sizes 
> hardware supports.  There's no support for page sizes other than PMD
> for anonymous memory, so this might not be too useful for you yet.

I did see those changes. It might help some device drivers to do DMA in
larger than PAGE_SIZE blocks but less than PMD_SIZE. It might help
reduce page table sizes since 2MB, 64K, and 4K are commonly supported
GPU page sizes. The MIGRATE_PFN_COMPOUND flag is intended to indicate
that the page size is determined by page_size() so I was thinking ahead
to other than PMD sized pages. However, when migrating a pte_none() or
pmd_none() page, there is no source page to determine the size.
Maybe I need to encode the page order in the migrate PFN entry like
hmm_range_fault().

Anyway, I agree that thinking about page sizes other than PMD is good.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
