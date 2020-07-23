Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 156A622B96C
	for <lists+nouveau@lfdr.de>; Fri, 24 Jul 2020 00:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D31F6E487;
	Thu, 23 Jul 2020 22:30:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243BA6E487
 for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2020 22:30:51 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f1a0f200000>; Thu, 23 Jul 2020 15:28:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Jul 2020 15:30:50 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Jul 2020 15:30:50 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Jul
 2020 22:30:42 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Thu, 23 Jul 2020 22:30:42 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f1a0f910002>; Thu, 23 Jul 2020 15:30:41 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 23 Jul 2020 15:30:03 -0700
Message-ID: <20200723223004.9586-6-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200723223004.9586-1-rcampbell@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595543328; bh=BeVUOTJgQepW+LMWyDGWqpRY0jrU7O9ftBuhCh+HHBg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=c5NVsiziP4cirzdcWC6K4LcVP4KSZN9WPHjiDB+wb369XeSgW+x0ffbg5/GsZEdHZ
 VNlqkYRVXriPkI7ArKZLO64O9s9bii6xIeiWVSn4lGPyTmw4PRgI+Gtqh+QLzLZuZj
 YWQRDbCiFOqf/ouBw74NnHOkciuxCGS3m1CrofSqd3zATJF3aqCFPcZZXNR6CqiIZz
 KekhEI0xT5i1MApDLFN41+rGbDo1hdbh0//Zubm+a3DuFfV5TO6Xv8RGAzhZEjAhEO
 j5W7XxfbfN+/isxrdbiUbqx1idn5RUo2XnM3MonM0s/2zPxlLTN2gpqZZau7Ejo0tO
 MGzZ+BIT5US8A==
Subject: [Nouveau] [PATCH v4 5/6] mm/hmm/test: use the new migration
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
 lib/test_hmm.c                         | 30 +++++++++++++++-----------
 tools/testing/selftests/vm/hmm-tests.c | 18 ++++++++++++----
 2 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index e78a1414f58e..e7dc3de355b7 100644
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
@@ -693,7 +701,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst = dst_pfns;
 		args.start = addr;
 		args.end = next;
-		args.pgmap_owner = NULL;
+		args.pgmap_owner = dmirror->mdevice;
 		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
@@ -983,7 +991,7 @@ static void dmirror_devmem_free(struct page *page)
 }
 
 static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
-						struct dmirror_device *mdevice)
+						      struct dmirror *dmirror)
 {
 	const unsigned long *src = args->src;
 	unsigned long *dst = args->dst;
@@ -1005,6 +1013,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 			continue;
 
 		lock_page(dpage);
+		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
 		copy_highpage(dpage, spage);
 		*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
 		if (*src & MIGRATE_PFN_WRITE)
@@ -1013,15 +1022,6 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
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
@@ -1051,11 +1051,15 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
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
+	 * invalidated the device page table.
+	 */
 	migrate_vma_finalize(&args);
 	return 0;
 }
diff --git a/tools/testing/selftests/vm/hmm-tests.c b/tools/testing/selftests/vm/hmm-tests.c
index b533dd08da1d..91d38a29956b 100644
--- a/tools/testing/selftests/vm/hmm-tests.c
+++ b/tools/testing/selftests/vm/hmm-tests.c
@@ -881,8 +881,9 @@ TEST_F(hmm, migrate)
 }
 
 /*
- * Migrate anonymous memory to device private memory and fault it back to system
- * memory.
+ * Migrate anonymous memory to device private memory and fault some of it back
+ * to system memory, then try migrating the resulting mix of system and device
+ * private memory to the device.
  */
 TEST_F(hmm, migrate_fault)
 {
@@ -924,8 +925,17 @@ TEST_F(hmm, migrate_fault)
 	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
 
-	/* Fault pages back to system memory and check them. */
-	for (i = 0, ptr = buffer->ptr; i < size / sizeof(*ptr); ++i)
+	/* Fault half the pages back to system memory and check them. */
+	for (i = 0, ptr = buffer->ptr; i < size / (2 * sizeof(*ptr)); ++i)
+		ASSERT_EQ(ptr[i], i);
+
+	/* Migrate memory to the device again. */
+	ret = hmm_dmirror_cmd(self->fd, HMM_DMIRROR_MIGRATE, buffer, npages);
+	ASSERT_EQ(ret, 0);
+	ASSERT_EQ(buffer->cpages, npages);
+
+	/* Check what the device read. */
+	for (i = 0, ptr = buffer->mirror; i < size / sizeof(*ptr); ++i)
 		ASSERT_EQ(ptr[i], i);
 
 	hmm_buffer_free(buffer);
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
