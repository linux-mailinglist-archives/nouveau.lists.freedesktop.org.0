Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9302321DE71
	for <lists+nouveau@lfdr.de>; Mon, 13 Jul 2020 19:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 808116E53C;
	Mon, 13 Jul 2020 17:22:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD126E530
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2020 17:22:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f0c98070003>; Mon, 13 Jul 2020 10:21:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 13 Jul 2020 10:22:09 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 13 Jul 2020 10:22:09 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jul
 2020 17:22:01 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 13 Jul 2020 17:22:01 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f0c9838000b>; Mon, 13 Jul 2020 10:22:01 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 13 Jul 2020 10:21:49 -0700
Message-ID: <20200713172149.2310-6-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713172149.2310-1-rcampbell@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594660871; bh=9IIuPtj59etQET6XQzw0bMUB+2aW73xZLXgD2GoJ4ec=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=kh5nU6VW9tnNBPWQqX71XltgDPOm1zkutww5LVlecYz2mLPH3oKZQAyW9rtckV084
 qA1j9je3ucjTMg/3t65OpqoSFb5gMN4jmqzKD42GuPNEs1G4YgCDOkkrVQtdgjZRre
 6uM4nqv054kJDrfvRKpXWXXsogMFOt60pn+J/0flBYkKdrUhqY5R2u/GJgC5xzHB0U
 uH5Z5o/w88n9kL/iYoCi5c+dDF9nQ4dewS4qX4Kp64hVGj0rUzSdc/XBEFSXf3SHje
 gleJnXunyobNzEN0wJ56h2idOoaAwZwcp8yrAr5JcWrnTZODtIqB66AFFVLXruI0m9
 thlDkRVOTEATg==
Subject: [Nouveau] [PATCH v2 5/5] mm/hmm/test: use the new migration
 invalidation
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
Cc: Ralph
 Campbell <rcampbell@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use the new MMU_NOTIFY_MIGRATE event to skip MMU invalidations of device
private memory and handle the invalidation in the driver as part of
migrating device private memory.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 lib/test_hmm.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 1bd60cfb5a25..77875fc4e7c1 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -214,6 +214,14 @@ static bool dmirror_interval_invalidate(struct mmu_interval_notifier *mni,
 {
 	struct dmirror *dmirror = container_of(mni, struct dmirror, notifier);
 
+	/*
+	 * Ignore invalidation callbacks for device private pages since
+	 * the invalidation is handled as part of the migration process.
+	 */
+	if (range->event == MMU_NOTIFY_MIGRATE &&
+	    range->migrate_pgmap_owner == dmirror->mdevice)
+		return true;
+
 	if (mmu_notifier_range_blockable(range))
 		mutex_lock(&dmirror->mutex);
 	else if (!mutex_trylock(&dmirror->mutex))
@@ -702,7 +710,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst = dst_pfns;
 		args.start = addr;
 		args.end = next;
-		args.src_owner = NULL;
+		args.src_owner = dmirror->mdevice;
 		args.dir = MIGRATE_VMA_FROM_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -992,7 +1000,7 @@ static void dmirror_devmem_free(struct page *page)
 }
 
 static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
-						struct dmirror_device *mdevice)
+						      struct dmirror *dmirror)
 {
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
@@ -1014,6 +1022,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			continue;
 
 		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 		if (*src & MIGRATE_PFN_WRITE)
@@ -1022,15 +1031,6 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 	return 0;
 }
 
-static void dmirror_devmem_fault_finalize_and_map(struct migrate_vma *args,
-						  struct dmirror *dmirror)
-{
-	/* Invalidate the device's page table mapping. */
-	mutex_lock(&dmirror->mutex);
-	dmirror_do_update(dmirror, args->start, args->end);
-	mutex_unlock(&dmirror->mutex);
-}
-
 static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 {
 	struct migrate_vma args;
@@ -1060,11 +1060,16 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
 
-	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror->mdevice);
+	ret = dmirror_devmem_fault_alloc_and_copy(&args, dmirror);
 	if (ret)
 		return ret;
 	migrate_vma_pages(&args);
-	dmirror_devmem_fault_finalize_and_map(&args, dmirror);
+	/*
+	 * No device finalize step is needed since
+	 * dmirror_devmem_fault_alloc_and_copy() will have already
+	 * invalidated the device page table. We could reinstate device MMU
+	 * entries for pages that didn't migrate but that should be rare.
+	 */
 	migrate_vma_finalize(&args);
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
