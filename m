Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A4A216175
	for <lists+nouveau@lfdr.de>; Tue,  7 Jul 2020 00:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FA26E141;
	Mon,  6 Jul 2020 22:24:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083796E134
 for <nouveau@lists.freedesktop.org>; Mon,  6 Jul 2020 22:24:05 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f03a44f0001>; Mon, 06 Jul 2020 15:23:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 06 Jul 2020 15:24:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 06 Jul 2020 15:24:04 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Jul
 2020 22:23:58 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 6 Jul 2020 22:23:58 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f03a47e0007>; Mon, 06 Jul 2020 15:23:58 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 6 Jul 2020 15:23:45 -0700
Message-ID: <20200706222347.32290-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200706222347.32290-1-rcampbell@nvidia.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594074191; bh=T3rNe1ZTEVG4rl8pgs5SeLiYvOfEdwAB9yHLkYyf/KY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=lACYXImjh2MKxWWjgEAbn5Mb2PV8VPVQapX5510HmfjELKQmCjzJUHwb4sknDDLpI
 IBK0RUbMz/85An/pTVvFvqQvh0MY00fVMhgsCtmJSFJyXR2fleDBkkD9pqj+T3viaR
 hU4/zpU3284WwuwBqRmWGGwYCZd5ImIArCPpnt8Co+ZJQwUTklkxabolcER2//9kqn
 /PdtaZr3c4ket4bY6e+9NUJYVI0Zfv+ZRhdh2M0k9AYvPpVZjlFNtc92vS1OUs/pSi
 +xhN7+H3646QSrlE6O9t4dOM9PIRnQgEgZcPq90AK3zw+L/sRdsg/Io6V5iFh5iPJV
 yaJzaRnKwunsQ==
Subject: [Nouveau] [PATCH 3/5] mm/notifier: add migration invalidation type
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

Currently migrate_vma_setup() calls mmu_notifier_invalidate_range_start()
which flushes all device private page mappings whether or not a page
is being migrated to/from device private memory. In order to not disrupt
device mappings that are not being migrated, shift the responsibility
for clearing device private mappings to the device driver and leave
CPU page table unmapping handled by migrate_vma_setup(). To support
this, the caller of migrate_vma_setup() should always set struct
migrate_vma::src_owner to a non NULL value that matches the device
private page->pgmap->owner. This value is then passed to the struct
mmu_notifier_range with a new event type which the driver's invalidation
function can use to avoid device MMU invalidations.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/mmu_notifier.h | 7 +++++++
 mm/migrate.c                 | 8 +++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index fc68f3570e19..bd0b34dbe4de 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -38,6 +38,10 @@ struct mmu_interval_notifier;
  *
  * @MMU_NOTIFY_RELEASE: used during mmu_interval_notifier invalidate to signal
  * that the mm refcount is zero and the range is no longer accessible.
+ *
+ * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
+ * a device driver to possibly ignore the invalidation if the src_own
+ * field matches.
  */
 enum mmu_notifier_event {
 	MMU_NOTIFY_UNMAP = 0,
@@ -46,6 +50,7 @@ enum mmu_notifier_event {
 	MMU_NOTIFY_PROTECTION_PAGE,
 	MMU_NOTIFY_SOFT_DIRTY,
 	MMU_NOTIFY_RELEASE,
+	MMU_NOTIFY_MIGRATE,
 };
 
 #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
@@ -264,6 +269,7 @@ struct mmu_notifier_range {
 	unsigned long end;
 	unsigned flags;
 	enum mmu_notifier_event event;
+	void *data;
 };
 
 static inline int mm_has_notifiers(struct mm_struct *mm)
@@ -513,6 +519,7 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
 	range->start = start;
 	range->end = end;
 	range->flags = flags;
+	range->data = NULL;
 }
 
 #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
diff --git a/mm/migrate.c b/mm/migrate.c
index 2bbc5c4c672e..62270e6727b0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2391,8 +2391,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
 {
 	struct mmu_notifier_range range;
 
-	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL,
+	/*
+	 * Note that the src_owner is passed to the mmu notifier callback so
+	 * that the registered device driver can skip invalidating device
+	 * private page mappings that won't be migrated.
+	 */
+	mmu_notifier_range_init(&range, MMU_NOTIFY_MIGRATE, 0, migrate->vma,
 			migrate->vma->vm_mm, migrate->start, migrate->end);
+	range.data = migrate->src_owner;
 	mmu_notifier_invalidate_range_start(&range);
 
 	walk_page_range(migrate->vma->vm_mm, migrate->start, migrate->end,
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
