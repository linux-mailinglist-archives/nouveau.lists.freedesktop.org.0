Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38BF283CEB
	for <lists+nouveau@lfdr.de>; Mon,  5 Oct 2020 18:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27D089B01;
	Mon,  5 Oct 2020 16:57:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A66789B01
 for <nouveau@lists.freedesktop.org>; Mon,  5 Oct 2020 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=48svzprtCtBeLxZUOMJ4cbXcIutSXC9w6o9yaeAk50k=; b=iWTCFntwCLL8/a77EO9Ham7WER
 /v09FwH8m65Cm7f7V9zH1XsZICAX4Zr8V/gfyQf452KXVw9qhBPoDJvSCt+9lFw8EKPgph6n53U3h
 2lVn18LbsXGQq/B2X1MRmI6QgRehi0okhVIYtocng/lXKldOaUc6wNhINVtDt1Et7sSGUM0BDQU+Y
 M7jhOXl3YWrsYtMLhlXvcgMzVMQRePzybDW/fD8Sl41tPp0cwSZQjhHLXIWRqixlInAhJwPnxBXPr
 bjzdg1nxkf87nmMDxi0mTkhXWdXH4vR3ozsU8wyf7I/PuefCVBnkC44MycsgJFa+NwZz8Hjp2g14/
 a2MRbyug==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kPTnC-0007qG-1K; Mon, 05 Oct 2020 16:56:54 +0000
Date: Mon, 5 Oct 2020 17:56:53 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20201005165653.GN20115@casper.infradead.org>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201001181715.17416-1-rcampbell@nvidia.com>
Subject: Re: [Nouveau] [RFC PATCH v3 0/2] mm: remove extra ZONE_DEVICE
 struct page refcount
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
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 01, 2020 at 11:17:13AM -0700, Ralph Campbell wrote:
> This is still an RFC because after looking at the pmem/dax code some
> more, I realized that the ZONE_DEVICE struct pages are being inserted
> into the process' page tables with vmf_insert_mixed() and a zero
> refcount on the ZONE_DEVICE struct page. This is sort of OK because
> insert_pfn() increments the reference count on the pgmap which is what
> prevents memunmap_pages() from freeing the struct pages and it doesn't
> check for a non-zero struct page reference count.
> But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
> checks for a reference count == 0.

And presumably get_user_pages() would call get_page()?  Or is that gated
off somewhere?

Looking at this from a design standpoint instead of getting into the
code, I would say that a struct page which cannot be referenced from
anywhere should have a reference count of 0.  As soon as it can be
found by something, it should have a positive refcount.

For DAX, I think that means it should have its refcount raised to
1 immediately before a DAX entry for it is put in the page cache.
It should have its refcount decreased when its DAX entry is removed from
the page cache.

That should ensure that we can't put a 0-ref DAX page in the page tables,
and thus it can't be found by get_user_pages().

> // mmap() an ext4 file that is mounted -o dax.
> ext4_dax_fault()
>   ext4_dax_huge_fault()
>     dax_iomap_fault(&ext4_iomap_ops)
>       dax_iomap_pte_fault()
>         ops->iomap_begin() // ext4_iomap_begin()
>           ext4_map_blocks()
>           ext4_set_iomap()
>         dax_iomap_pfn()
>         dax_insert_entry()
>         vmf_insert_mixed(pfn)
>           __vm_insert_mixed()
>             if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) &&
>                 !pfn_t_devmap(pfn) && pfn_t_valid(pfn))
>               insert_page()
>                 get_page(page) // XXX would trigger VM_BUG_ON_PAGE()
>                 page_add_file_rmap()
>                 set_pte_at()
>             else
>               insert_pfn()
>                 pte_mkdevmap()
>                 set_pte_at()
> 
> Should pmem set the page reference count to one before inserting the
> pfn into the page tables (and decrement when removing devmap PTEs)?
> What about MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA use cases?
> Where should they icrement/decrement the page reference count?
> I don't know enough about how these are used to really know what to
> do at this point. If people want me to continue to work on this series,
> I will need some guidance.
> 
> ---
> 
> Matthew Wilcox, Ira Weiny, and others have complained that ZONE_DEVICE
> struct page reference counting is ugly because they are "free" when the
> reference count is one instead of zero. This leads to explicit checks
> for ZONE_DEVICE pages in places like put_page(), GUP, THP splitting, and
> page migration which have to adjust the expected reference count when
> determining if the page is isolated or idle. This is my attempt to make
> ZONE_DEVICE pages be free when the reference count is zero and removing
> the special cases.
> 
> I'm only sending this out as a RFC since I'm not that familiar with the
> DAX, PMEM, XEN, and other uses of ZONE_DEVICE struct pages allocated
> with devm_memremap_pages() or memremap_pages() but my best reading of
> the code looks like it might be OK. I could use help testing these
> configurations.
> I have been able to successfully run xfstests on ext4 with the memmap
> kernel boot option to simulate pmem.
> 
> Changes in v3:
> Rebase to linux-mm 5.9.0-rc7-mm1.
> Added a check for page_free() as suggested by Christoph Hellwig.
> Added a helper for dax_wait_page() as suggested by Christoph Hellwig.
> 
> Changes in v2:
> One of the big changes in v2 is that devm_memremap_pages() and
> memremap_pages() now return the struct pages' reference count set to
> zero instead of one. Normally, get_page() will VM_BUG_ON_PAGE() if
> page->_refcount is zero. I didn't see any such warnings running the
> xfstests with dax/pmem but I'm not clear how the zero to one reference
> count is handled.
> 
> Other changes in v2:
> Rebased to Linux-5.9.0-rc6 to include pmem fixes.
> I added patch 1 to introduce a page refcount helper for ext4 and xfs as
> suggested by Christoph Hellwig.
> I also applied Christoph Hellwig's other suggested changes for removing
> the devmap_managed_key, etc.
> 
> Ralph Campbell (2):
>   ext4/xfs: add page refcount helper
>   mm: remove extra ZONE_DEVICE struct page refcount
> 
>  arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
>  fs/dax.c                               |  8 +--
>  fs/ext4/inode.c                        |  5 +-
>  fs/xfs/xfs_file.c                      |  4 +-
>  include/linux/dax.h                    | 10 +++
>  include/linux/memremap.h               |  7 ++-
>  include/linux/mm.h                     | 44 --------------
>  lib/test_hmm.c                         |  2 +-
>  mm/gup.c                               | 44 --------------
>  mm/internal.h                          |  8 +++
>  mm/memremap.c                          | 84 +++++++-------------------
>  mm/migrate.c                           |  5 --
>  mm/page_alloc.c                        |  3 +
>  mm/swap.c                              | 44 ++------------
>  15 files changed, 63 insertions(+), 209 deletions(-)
> 
> -- 
> 2.20.1
> 
> 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
