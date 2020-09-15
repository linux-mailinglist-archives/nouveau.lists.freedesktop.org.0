Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9658E26B9F6
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505436E97C;
	Wed, 16 Sep 2020 02:22:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4934E6E897
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 16:39:50 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f60ee470004>; Tue, 15 Sep 2020 09:39:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 15 Sep 2020 09:39:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 15 Sep 2020 09:39:48 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 15 Sep 2020 16:39:47 +0000
To: Christoph Hellwig <hch@infradead.org>
References: <20200914224509.17699-1-rcampbell@nvidia.com>
 <CAPcyv4gVJuWsOtejrKvWgByq=c1niwQOZ0HHYaSo4h6vc-Xw+Q@mail.gmail.com>
 <10b4b85c-f1e9-b6b5-74cd-6190ee0aca5d@nvidia.com>
 <20200915162956.GA21990@infradead.org>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <6dff5231-26d5-1aec-0c05-6880cf747642@nvidia.com>
Date: Tue, 15 Sep 2020 09:39:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200915162956.GA21990@infradead.org>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1600187975; bh=C1s92L4x7f4rIF6lqQWyaq+r/2kk7tSSBG+aULp1tK0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=MjyrTGfIene7vVu5hucCl8X7jJJtGy4gEfp8s9S8BvUOqlyhVR/Jr/cF4kdzJc0Sy
 LCNccr/EB6s9AbvrN0g1vzjM0eTf5Ecb0AFIePVFELVPA01dU+slLbzDLM67GL26Ek
 hRD/99TeqMFmNTw8ILvsCZqgAHPunVc0BJXMZXgbWMvQ3LinUrL1J2/FZJuuGPurhp
 l2c3JDfB5skX8McyhBI3hpbKwAXU/D1yYeLTxWXKEYDXLR2Cc+bMRYvFmtgboy2agT
 8cLHw3JEIT9+4E0SQHnvIvwomdfJGbjdgwupYbPF07ykO5rH/LOpLA8eYXXUPqITk7
 Je7vqmrwPefZQ==
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
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
 Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 Linux MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 9/15/20 9:29 AM, Christoph Hellwig wrote:
> On Mon, Sep 14, 2020 at 04:53:25PM -0700, Ralph Campbell wrote:
>> Since set_page_refcounted() is defined in mm_interal.h I would have to
>> move the definition to someplace like page_ref.h or have the drivers
>> cal init_page_count() or set_page_count() since get_page() calls
>> VM_BUG_ON_PAGE() if refcount == 0.
>> I'll move set_page_refcounted() since that is what the page allocator
>> uses and seems named for the purpose.
> 
> I don't think any of the three ->page_free instances even cares about
> the page refcount.
> 
Not true. The page_free() callback records the page is free by setting
a bit or putting the page on a free list but when it allocates a free
device private struct page to be used with migrate_vma_setup(), it needs to
increment the refcount.

For the ZONE_DEVICE MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA
struct pages, I think you are correct because they don't define page_free()
and from what I can see, don't decrement the page refcount to zero.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
