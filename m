Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375264AB4B8
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 07:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6682D10F0E4;
	Mon,  7 Feb 2022 06:33:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9752A10F0E7;
 Mon,  7 Feb 2022 06:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=FprCSxOzzhgt/vZhOSgfyqEp3ddGvZRG1UbdNuX2PMc=; b=UwxDJOl0w3Tc1ukfFptssv9q89
 9iR1FrPpwD+U46r34HDO/qCEmzzoMWkIx7aATXOezYEaExx6dG22CM+sgENWERwKTrXGLtHWK3E0z
 jd4Hm1fFI0p4hipzo6+ehRMszzaFAcqibfgBSnlrP7V7RlwN9ARXb/tZdJAsL8rVbnL+A1A+3ycLf
 ppjemEaVPzCqfT8/DAAZ47dItaXNA+cTc1HtotheMsIb6/Jatu8QHcR/CAfzmhSoz3dWVbajEmffZ
 OSj97pifQbugN4ukyI0wugraPA4GyyfLZofP0mrsteXLa3qvcI96M1dSlkZPmI4UlY1afjewiEe/O
 vRDGlOJQ==;
Received: from [2001:4bb8:188:3efc:2cbe:55d7:bb63:46d2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGxaG-0099MB-7n; Mon, 07 Feb 2022 06:33:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>
Date: Mon,  7 Feb 2022 07:32:47 +0100
Message-Id: <20220207063249.1833066-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220207063249.1833066-1-hch@lst.de>
References: <20220207063249.1833066-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 6/8] mm: don't include <linux/memremap.h> in
 <linux/mm.h>
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Move the check for the actual pgmap types that need the free at refcount
one behavior into the out of line helper, and thus avoid the need to
pull memremap.h into mm.h.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/mm/mmu.c                    |  1 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h  |  1 +
 drivers/gpu/drm/drm_cache.c            |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  1 +
 drivers/gpu/drm/nouveau/nouveau_svm.c  |  1 +
 drivers/infiniband/core/rw.c           |  1 +
 drivers/nvdimm/pmem.h                  |  1 +
 drivers/nvme/host/pci.c                |  1 +
 drivers/nvme/target/io-cmd-bdev.c      |  1 +
 fs/fuse/virtio_fs.c                    |  1 +
 include/linux/memremap.h               | 18 ++++++++++++++++++
 include/linux/mm.h                     | 20 --------------------
 lib/test_hmm.c                         |  1 +
 mm/memremap.c                          |  6 +++++-
 14 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index acfae9b41cc8c9..580abae6c0b93f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -17,6 +17,7 @@
 #include <linux/mman.h>
 #include <linux/nodemask.h>
 #include <linux/memblock.h>
+#include <linux/memremap.h>
 #include <linux/memory.h>
 #include <linux/fs.h>
 #include <linux/io.h>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index ea68f3b3a4e9cb..6d643b4b791d87 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -25,6 +25,7 @@
 
 #include <linux/hashtable.h>
 #include <linux/mmu_notifier.h>
+#include <linux/memremap.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 #include <linux/atomic.h>
diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index f19d9acbe95936..50b8a088f763a6 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -27,11 +27,11 @@
 /*
  * Authors: Thomas Hellström <thomas-at-tungstengraphics-dot-com>
  */
-
 #include <linux/dma-buf-map.h>
 #include <linux/export.h>
 #include <linux/highmem.h>
 #include <linux/cc_platform.h>
+#include <linux/ioport.h>
 #include <xen/xen.h>
 
 #include <drm/drm_cache.h>
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e886a3b9e08c7d..a5cdfbe32b5e54 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -39,6 +39,7 @@
 
 #include <linux/sched/mm.h>
 #include <linux/hmm.h>
+#include <linux/memremap.h>
 #include <linux/migrate.h>
 
 /*
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 266809e511e2c1..090b9b47708cca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -35,6 +35,7 @@
 #include <linux/sched/mm.h>
 #include <linux/sort.h>
 #include <linux/hmm.h>
+#include <linux/memremap.h>
 #include <linux/rmap.h>
 
 struct nouveau_svm {
diff --git a/drivers/infiniband/core/rw.c b/drivers/infiniband/core/rw.c
index 5a3bd41b331c93..4d98f931a13ddd 100644
--- a/drivers/infiniband/core/rw.c
+++ b/drivers/infiniband/core/rw.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2016 HGST, a Western Digital Company.
  */
+#include <linux/memremap.h>
 #include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/pci-p2pdma.h>
diff --git a/drivers/nvdimm/pmem.h b/drivers/nvdimm/pmem.h
index 59cfe13ea8a85c..1f51a23614299b 100644
--- a/drivers/nvdimm/pmem.h
+++ b/drivers/nvdimm/pmem.h
@@ -3,6 +3,7 @@
 #define __NVDIMM_PMEM_H__
 #include <linux/page-flags.h>
 #include <linux/badblocks.h>
+#include <linux/memremap.h>
 #include <linux/types.h>
 #include <linux/pfn_t.h>
 #include <linux/fs.h>
diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 6a99ed68091589..ab15bc72710dbe 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -15,6 +15,7 @@
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/memremap.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 70ca9dfc1771a9..a141446db1bea3 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/blkdev.h>
 #include <linux/blk-integrity.h>
+#include <linux/memremap.h>
 #include <linux/module.h>
 #include "nvmet.h"
 
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 9d737904d07c0b..86b7dbb6a0d43e 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -8,6 +8,7 @@
 #include <linux/dax.h>
 #include <linux/pci.h>
 #include <linux/pfn_t.h>
+#include <linux/memremap.h>
 #include <linux/module.h>
 #include <linux/virtio.h>
 #include <linux/virtio_fs.h>
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 1fafcc38acbad6..514ab46f597e5c 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _LINUX_MEMREMAP_H_
 #define _LINUX_MEMREMAP_H_
+
+#include <linux/mm.h>
 #include <linux/range.h>
 #include <linux/ioport.h>
 #include <linux/percpu-refcount.h>
@@ -129,6 +131,22 @@ static inline unsigned long pgmap_vmemmap_nr(struct dev_pagemap *pgmap)
 	return 1 << pgmap->vmemmap_shift;
 }
 
+static inline bool is_device_private_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
+		is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
+}
+
+static inline bool is_pci_p2pdma_page(const struct page *page)
+{
+	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
+		IS_ENABLED(CONFIG_PCI_P2PDMA) &&
+		is_zone_device_page(page) &&
+		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
+}
+
 #ifdef CONFIG_ZONE_DEVICE
 void *memremap_pages(struct dev_pagemap *pgmap, int nid);
 void memunmap_pages(struct dev_pagemap *pgmap);
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 26baadcef4556b..80fccfe31c3444 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -23,7 +23,6 @@
 #include <linux/err.h>
 #include <linux/page-flags.h>
 #include <linux/page_ref.h>
-#include <linux/memremap.h>
 #include <linux/overflow.h>
 #include <linux/sizes.h>
 #include <linux/sched.h>
@@ -1101,9 +1100,6 @@ static inline bool put_devmap_managed_page(struct page *page)
 		return false;
 	if (!is_zone_device_page(page))
 		return false;
-	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
-	    page->pgmap->type != MEMORY_DEVICE_FS_DAX)
-		return false;
 	return __put_devmap_managed_page(page);
 }
 
@@ -1114,22 +1110,6 @@ static inline bool put_devmap_managed_page(struct page *page)
 }
 #endif /* CONFIG_DEV_PAGEMAP_OPS */
 
-static inline bool is_device_private_page(const struct page *page)
-{
-	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
-		IS_ENABLED(CONFIG_DEVICE_PRIVATE) &&
-		is_zone_device_page(page) &&
-		page->pgmap->type == MEMORY_DEVICE_PRIVATE;
-}
-
-static inline bool is_pci_p2pdma_page(const struct page *page)
-{
-	return IS_ENABLED(CONFIG_DEV_PAGEMAP_OPS) &&
-		IS_ENABLED(CONFIG_PCI_P2PDMA) &&
-		is_zone_device_page(page) &&
-		page->pgmap->type == MEMORY_DEVICE_PCI_P2PDMA;
-}
-
 /* 127: arbitrary random number, small enough to assemble well */
 #define folio_ref_zero_or_close_to_overflow(folio) \
 	((unsigned int) folio_ref_count(folio) + 127u <= 127u)
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 396beee6b061d4..e5fc14ba71f33e 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/cdev.h>
 #include <linux/device.h>
+#include <linux/memremap.h>
 #include <linux/mutex.h>
 #include <linux/rwsem.h>
 #include <linux/sched.h>
diff --git a/mm/memremap.c b/mm/memremap.c
index f41233a67edb12..a0ece2344c2cab 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -4,7 +4,7 @@
 #include <linux/io.h>
 #include <linux/kasan.h>
 #include <linux/memory_hotplug.h>
-#include <linux/mm.h>
+#include <linux/memremap.h>
 #include <linux/pfn_t.h>
 #include <linux/swap.h>
 #include <linux/mmzone.h>
@@ -504,6 +504,10 @@ void free_devmap_managed_page(struct page *page)
 
 bool __put_devmap_managed_page(struct page *page)
 {
+	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
+	    page->pgmap->type != MEMORY_DEVICE_FS_DAX)
+		return false;
+
 	/*
 	 * devmap page refcounts are 1-based, rather than 0-based: if
 	 * refcount is 1, then the page is free and the refcount is
-- 
2.30.2

