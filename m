Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A17280C24
	for <lists+nouveau@lfdr.de>; Fri,  2 Oct 2020 03:51:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C656E90C;
	Fri,  2 Oct 2020 01:51:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97426E8CD
 for <nouveau@lists.freedesktop.org>; Thu,  1 Oct 2020 18:17:32 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f761d2f0003>; Thu, 01 Oct 2020 11:17:19 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 1 Oct
 2020 18:17:29 +0000
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 1 Oct 2020 18:17:29 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <kvm-ppc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 1 Oct 2020 11:17:13 -0700
Message-ID: <20201001181715.17416-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601576239; bh=i0qUDZQiDgjdg2NQQq4taWQVT+/yq1DDbtLpj8BY1+U=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
 b=aYellwqK2P3dWBrhCxRGJ8OXRs6Jr0de+ldluE7qBkEQejd6H6l/p/7xQ0x6CKfrz
 aVnh57TO+QEAXq1CRPAb9cR6Bf8qH+BWLIkXWTzBiYF/JNRZMGpRhj1hG8Oj7TSTdz
 btaqfQcLRhbUMZiQFTFkrphTnw7JrOuEgO95LUgnt5c9YBumUXVBIFh/8z4kShLmKx
 gjss5LyadHCdc9LSwiY+YUYTHO+NIoiSK3uJcGvYWpiso1pOTeGJJi95rbkqMhlsdw
 MxpIyFzWLvYqQlCFVw0+A8wsksau+ZM3P2uvngN7cpD/q6+TdpjbsWVdjRkvs6tLCU
 MkMpcmuscGiuA==
X-Mailman-Approved-At: Fri, 02 Oct 2020 01:51:24 +0000
Subject: [Nouveau] [RFC PATCH v3 0/2] mm: remove extra ZONE_DEVICE struct
 page refcount
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
 Alistair Popple <apopple@nvidia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is still an RFC because after looking at the pmem/dax code some
more, I realized that the ZONE_DEVICE struct pages are being inserted
into the process' page tables with vmf_insert_mixed() and a zero
refcount on the ZONE_DEVICE struct page. This is sort of OK because
insert_pfn() increments the reference count on the pgmap which is what
prevents memunmap_pages() from freeing the struct pages and it doesn't
check for a non-zero struct page reference count.
But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
checks for a reference count == 0.

// mmap() an ext4 file that is mounted -o dax.
ext4_dax_fault()
  ext4_dax_huge_fault()
    dax_iomap_fault(&ext4_iomap_ops)
      dax_iomap_pte_fault()
        ops->iomap_begin() // ext4_iomap_begin()
          ext4_map_blocks()
          ext4_set_iomap()
        dax_iomap_pfn()
        dax_insert_entry()
        vmf_insert_mixed(pfn)
          __vm_insert_mixed()
            if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) &&
                !pfn_t_devmap(pfn) && pfn_t_valid(pfn))
              insert_page()
                get_page(page) // XXX would trigger VM_BUG_ON_PAGE()
                page_add_file_rmap()
                set_pte_at()
            else
              insert_pfn()
                pte_mkdevmap()
                set_pte_at()

Should pmem set the page reference count to one before inserting the
pfn into the page tables (and decrement when removing devmap PTEs)?
What about MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA use cases?
Where should they icrement/decrement the page reference count?
I don't know enough about how these are used to really know what to
do at this point. If people want me to continue to work on this series,
I will need some guidance.

---

Matthew Wilcox, Ira Weiny, and others have complained that ZONE_DEVICE
struct page reference counting is ugly because they are "free" when the
reference count is one instead of zero. This leads to explicit checks
for ZONE_DEVICE pages in places like put_page(), GUP, THP splitting, and
page migration which have to adjust the expected reference count when
determining if the page is isolated or idle. This is my attempt to make
ZONE_DEVICE pages be free when the reference count is zero and removing
the special cases.

I'm only sending this out as a RFC since I'm not that familiar with the
DAX, PMEM, XEN, and other uses of ZONE_DEVICE struct pages allocated
with devm_memremap_pages() or memremap_pages() but my best reading of
the code looks like it might be OK. I could use help testing these
configurations.
I have been able to successfully run xfstests on ext4 with the memmap
kernel boot option to simulate pmem.

Changes in v3:
Rebase to linux-mm 5.9.0-rc7-mm1.
Added a check for page_free() as suggested by Christoph Hellwig.
Added a helper for dax_wait_page() as suggested by Christoph Hellwig.

Changes in v2:
One of the big changes in v2 is that devm_memremap_pages() and
memremap_pages() now return the struct pages' reference count set to
zero instead of one. Normally, get_page() will VM_BUG_ON_PAGE() if
page->_refcount is zero. I didn't see any such warnings running the
xfstests with dax/pmem but I'm not clear how the zero to one reference
count is handled.

Other changes in v2:
Rebased to Linux-5.9.0-rc6 to include pmem fixes.
I added patch 1 to introduce a page refcount helper for ext4 and xfs as
suggested by Christoph Hellwig.
I also applied Christoph Hellwig's other suggested changes for removing
the devmap_managed_key, etc.

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  8 +--
 fs/ext4/inode.c                        |  5 +-
 fs/xfs/xfs_file.c                      |  4 +-
 include/linux/dax.h                    | 10 +++
 include/linux/memremap.h               |  7 ++-
 include/linux/mm.h                     | 44 --------------
 lib/test_hmm.c                         |  2 +-
 mm/gup.c                               | 44 --------------
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 84 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 +
 mm/swap.c                              | 44 ++------------
 15 files changed, 63 insertions(+), 209 deletions(-)

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
