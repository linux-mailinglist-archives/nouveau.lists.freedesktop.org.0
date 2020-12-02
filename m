Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8BD2CBA26
	for <lists+nouveau@lfdr.de>; Wed,  2 Dec 2020 11:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066BF6EA20;
	Wed,  2 Dec 2020 10:09:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E856EA1D
 for <nouveau@lists.freedesktop.org>; Wed,  2 Dec 2020 10:09:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4A8C467373; Wed,  2 Dec 2020 11:08:55 +0100 (CET)
Date: Wed, 2 Dec 2020 11:08:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Message-ID: <20201202100854.GB7597@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
 <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
 <20201120200133.GH917484@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120200133.GH917484@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v3 3/6] mm: support THP migration to device
 private memory
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 04:01:33PM -0400, Jason Gunthorpe wrote:
> On Wed, Nov 11, 2020 at 03:38:42PM -0800, Ralph Campbell wrote:
> 
> > MEMORY_DEVICE_GENERIC:
> > Struct pages are created in dev_dax_probe() and represent non-volatile memory.
> > The device can be mmap()'ed which calls dax_mmap() which sets
> > vma->vm_flags | VM_HUGEPAGE.
> > A CPU page fault will result in a PTE, PMD, or PUD sized page
> > (but not compound) to be inserted by vmf_insert_mixed() which will call either
> > insert_pfn() or insert_page().
> > Neither insert_pfn() nor insert_page() increments the page reference
> > count.
> 
> But why was this done? It seems very strange to put a pfn with a
> struct page into a VMA and then deliberately not take the refcount for
> the duration of that pfn being in the VMA?
> 
> What prevents memunmap_pages() from progressing while VMAs still point
> at the memory?

Agreed.  Adding Roger who added MEMORY_DEVICE_GENERIC and the only
user.

> > I think just leaving the page reference count at one is better than trying
> > to use the mmu_interval_notifier or changing vmf_insert_mixed() and
> > invalidations of pfn_t_devmap(pfn) to adjust the page reference count.
> 
> Why so? The entire point of getting struct page's for this stuff was
> to be able to follow the struct page flow. I never did learn a reason
> why there is devmap stuff all over the place in the page table code...

Exactly.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
