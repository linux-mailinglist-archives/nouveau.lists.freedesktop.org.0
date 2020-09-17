Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D47626E792
	for <lists+nouveau@lfdr.de>; Thu, 17 Sep 2020 23:46:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3AC6E39B;
	Thu, 17 Sep 2020 21:46:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD40D6EB6D
 for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2020 00:29:37 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f62ade40002>; Wed, 16 Sep 2020 17:29:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 16 Sep 2020 17:29:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 16 Sep 2020 17:29:37 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 17 Sep 2020 00:29:35 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
 <20200915162956.GA21990@infradead.org>
 <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com>
 <20200916053653.GA7321@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <d3f80030-2ac4-384c-fd7e-66affb229577@nvidia.com>
Date: Wed, 16 Sep 2020 17:29:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200916053653.GA7321@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1600302564; bh=1i3pq4DrsfAWDVtR8cFn1IB1tfsEr058q9gpy2HuS9Q=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=caAwSctdzbWEenNN1UGAJD9cndTHHMtPdIvHnfYyy9NCs4UYoesgLmsKAX4pplK+S
 jHX0wsG3bOReVssA5a6DPV6yEId91gR1f43cs1k+jXF11gfHrHlWmkBzK1HDnboHTj
 0X02RdTOqyy2psmjgcVknwVliDeAKXIc35Kvs9PkBNgRnanLccOaSYkxgcz32kxeZQ
 8gMhUoRj7cjyV5fYtImJdKvIF1Xva6DsQVBRHg47x8mBnFiVeLGoFjF0Wt502JwWOW
 5B1HVD/KTNyqCQvzslx2owOZ+33Veswqt8/NCmz2inGyrgvGOoRZiZWv3ZoJ0chyXh
 i9TR2Pn+gH8gw==
X-Mailman-Approved-At: Thu, 17 Sep 2020 21:46:51 +0000
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
Cc: Paul Mackerras <paulus@ozlabs.org>, Yang Shi <yang.shi@linux.alibaba.com>,
 Zi Yan <ziy@nvidia.com>, nouveau@lists.freedesktop.org,
 Alistair Popple <apopple@nvidia.com>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Linux MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 9/15/20 10:36 PM, Christoph Hellwig wrote:
> On Tue, Sep 15, 2020 at 09:39:47AM -0700, Ralph Campbell wrote:
>>> I don't think any of the three ->page_free instances even cares about
>>> the page refcount.
>>>
>> Not true. The page_free() callback records the page is free by setting
>> a bit or putting the page on a free list but when it allocates a free
>> device private struct page to be used with migrate_vma_setup(), it needs to
>> increment the refcount.
>>
>> For the ZONE_DEVICE MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA
>> struct pages, I think you are correct because they don't define page_free()
>> and from what I can see, don't decrement the page refcount to zero.
> 
> Umm, the whole point of ZONE_DEVICE is to have a struct page for
> something that is not system memory.  For both the ppc kvm case (magic
> hypervisor pool) and Noveau (device internal) memory that clear is the
> case.  But looks like test_hmm uses normal pages to fake this up, so
> I was wrong about the third caller.  But I think we can just call
> set_page_count just before freeing the page there with a comment
> explaining what is goin on.

Dan Williams thought that having the ZONE_DEVICE struct pages
be on a free list with a refcount of one was a bit strange and
that the driver should handle the zero to one transition.
But, that would mean a bit more invasive change to the 3 drivers
to set the reference count to zero after calling memremap_pages()
and setting the reference count to one when allocating a struct
page. What you are suggesting is what I also proposed in v1.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
