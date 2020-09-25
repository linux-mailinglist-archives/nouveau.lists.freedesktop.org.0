Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD312794EC
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 01:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A026ED78;
	Fri, 25 Sep 2020 23:46:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 469736ED37
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 20:44:54 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6e56640000>; Fri, 25 Sep 2020 13:43:16 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 20:44:48 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 25 Sep 2020 20:44:48 +0000
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>, <kvm-ppc@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Fri, 25 Sep 2020 13:44:40 -0700
Message-ID: <20200925204442.31348-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601066596; bh=IIi6Sijxjm9DkdSwlUuTFLfh6/fqFTnXKxwmblAGiV8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
 b=NFJ6YFkhgNIOOdMlie0VWq8+8mXjElOrB6784/lkZUqNHwZbby6427Saf3tjOwQSt
 LOhmadYzy+XQNjNAapH2D+f9sU3nLJ9dE3Hij6pantDaopl6Yem83LAWQBXECgUdLB
 ZFl0uZacEHu81yE63YccWCofRpK1FVm3+lsuOfFW8z/jrOJXZBYq9BwiEXDcdJ69UF
 Wr9fxgfqwIiD2S8rWNhXITPRiBn89uScWvQgJlEbq9LdyT5TZEiGNbfOVimrhg4+1S
 jnqGZZ9g5HHiWsiXnKNX0CpD06Y4bx6h1L16K07AVLsSHwrl45o7rNXVR5Sm/4Ui+Y
 VMq0PBuPd7ovw==
X-Mailman-Approved-At: Fri, 25 Sep 2020 23:46:15 +0000
Subject: [Nouveau] [RFC PATCH v2 0/2] mm: remove extra ZONE_DEVICE struct
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
 fs/ext4/inode.c                        |  2 +-
 fs/xfs/xfs_file.c                      |  2 +-
 include/linux/dax.h                    |  5 ++
 include/linux/memremap.h               |  7 ++-
 include/linux/mm.h                     | 44 --------------
 lib/test_hmm.c                         |  2 +-
 mm/gup.c                               | 44 --------------
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 82 ++++++--------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 +
 mm/swap.c                              | 46 +++------------
 15 files changed, 54 insertions(+), 208 deletions(-)

-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
