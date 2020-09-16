Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A4C26BBE9
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 07:41:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345B6E287;
	Wed, 16 Sep 2020 05:41:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429166E287
 for <nouveau@lists.freedesktop.org>; Wed, 16 Sep 2020 05:37:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4C02568BFE; Wed, 16 Sep 2020 07:36:54 +0200 (CEST)
Date: Wed, 16 Sep 2020 07:36:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200916053653.GA7321@lst.de>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
 <20200915162956.GA21990@infradead.org>
 <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 16 Sep 2020 05:41:17 +0000
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
 Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Linux MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 09:39:47AM -0700, Ralph Campbell wrote:
>> I don't think any of the three ->page_free instances even cares about
>> the page refcount.
>>
> Not true. The page_free() callback records the page is free by setting
> a bit or putting the page on a free list but when it allocates a free
> device private struct page to be used with migrate_vma_setup(), it needs to
> increment the refcount.
>
> For the ZONE_DEVICE MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA
> struct pages, I think you are correct because they don't define page_free()
> and from what I can see, don't decrement the page refcount to zero.

Umm, the whole point of ZONE_DEVICE is to have a struct page for
something that is not system memory.  For both the ppc kvm case (magic
hypervisor pool) and Noveau (device internal) memory that clear is the
case.  But looks like test_hmm uses normal pages to fake this up, so
I was wrong about the third caller.  But I think we can just call
set_page_count just before freeing the page there with a comment
explaining what is goin on.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
