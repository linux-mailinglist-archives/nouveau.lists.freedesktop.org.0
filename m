Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BED8139CC5
	for <lists+nouveau@lfdr.de>; Mon, 13 Jan 2020 23:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7B989930;
	Mon, 13 Jan 2020 22:47:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF55C89930
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2020 22:47:11 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1cf3390001>; Mon, 13 Jan 2020 14:46:17 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 13 Jan 2020 14:47:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 13 Jan 2020 14:47:11 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 22:47:09 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 13 Jan 2020 22:47:09 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e1cf36d0001>; Mon, 13 Jan 2020 14:47:09 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>
Date: Mon, 13 Jan 2020 14:46:58 -0800
Message-ID: <20200113224703.5917-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113224703.5917-1-rcampbell@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578955577; bh=usqCLSpPHPIcP3XBGGSE1vwQGADMCClZ0wXkTAqd5L8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=T1gTwrUmup3ZAEIwku7WzU48gEGGQkY5/8zH66sUmLJsia3qUt8h/xqKhhNkzzn2K
 QHYAnUchESxsa9ZLy+gtRHXOfTK2y4l9PZ+8lMlIpfbAEXhLaC/bQaOZhEZRkfW/bf
 3qpD8AyAoeWumC9R1qN8MMjxHJVK7Jcgyezqq3VS38eOVWFphCf59dnuSJyitsWN1e
 XTQHL1uBiW2NE/96aZHHcA3hAv9e8M2n+zPJ6EQ9hCosTuZLveYbMawMbTtqPuIRSy
 ILbZThymZz+UIchn1qmzWDSoyeDERjiQmAx18duaOZPAl9y0r+zHZ/Eh93zrNQsyXS
 nspOfXPhiVM+Q==
Subject: [Nouveau] [PATCH v6 1/6] mm/mmu_notifier: add
 mmu_interval_notifier_insert_safe()
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew
 Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

mmu_interval_notifier_insert() can't be called safely from inside the
invalidate() callback because it can acquire the mmap_sem lock which
might already be held. Insertion might be needed when the invalidate()
callback creates a "hole" in the interval being tracked (i.e., the event
type MMU_NOTIFY_UNMAP) and the interval needs to be split in order to
continue receiving callbacks for the remaining left and right intervals.

Add a new function mmu_interval_notifier_insert_safe() which can be called
from the invalidate() callback.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/mmu_notifier.h |  4 ++++
 mm/mmu_notifier.c            | 45 ++++++++++++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 9e6caa8ecd19..027c9c8f3a69 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -299,6 +299,10 @@ int mmu_interval_notifier_insert_locked(
 	struct mmu_interval_notifier *mni, struct mm_struct *mm,
 	unsigned long start, unsigned long length,
 	const struct mmu_interval_notifier_ops *ops);
+int mmu_interval_notifier_insert_safe(
+	struct mmu_interval_notifier *mni, struct mm_struct *mm,
+	unsigned long start, unsigned long length,
+	const struct mmu_interval_notifier_ops *ops);
 void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni);
 
 /**
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index f76ea05b1cb0..a5ff19cd1bc5 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -913,16 +913,17 @@ static int __mmu_interval_notifier_insert(
 /**
  * mmu_interval_notifier_insert - Insert an interval notifier
  * @mni: Interval notifier to register
+ * @mm: mm_struct to attach to
  * @start: Starting virtual address to monitor
  * @length: Length of the range to monitor
- * @mm : mm_struct to attach to
+ * @ops: Interval notifier callback operations
  *
  * This function subscribes the interval notifier for notifications from the
- * mm.  Upon return the ops related to mmu_interval_notifier will be called
+ * mm.  Upon return, the ops related to mmu_interval_notifier will be called
  * whenever an event that intersects with the given range occurs.
  *
- * Upon return the range_notifier may not be present in the interval tree yet.
- * The caller must use the normal interval notifier read flow via
+ * Upon return, the mmu_interval_notifier may not be present in the interval
+ * tree yet.  The caller must use the normal interval notifier read flow via
  * mmu_interval_read_begin() to establish SPTEs for this range.
  */
 int mmu_interval_notifier_insert(struct mmu_interval_notifier *mni,
@@ -969,6 +970,42 @@ int mmu_interval_notifier_insert_locked(
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert_locked);
 
+/**
+ * mmu_interval_notifier_insert_safe - Insert an interval notifier
+ * @mni: Interval notifier to register
+ * @mm: mm_struct to attach to
+ * @start: Starting virtual address to monitor
+ * @length: Length of the range to monitor
+ * @ops: Interval notifier callback operations
+ *
+ * Return: -EINVAL if @mm hasn't been initialized for interval notifiers
+ *	by calling mmu_notifier_register(NULL, mm) or
+ *	__mmu_notifier_register(NULL, mm).
+ *
+ * This function subscribes the interval notifier for notifications from the
+ * mm.  Upon return, the ops related to mmu_interval_notifier will be called
+ * whenever an event that intersects with the given range occurs.
+ *
+ * This function is safe to call from the ops->invalidate() function.
+ * Upon return, the mmu_interval_notifier may not be present in the interval
+ * tree yet.  The caller must use the normal interval notifier read flow via
+ * mmu_interval_read_begin() to establish SPTEs for this range.
+ */
+int mmu_interval_notifier_insert_safe(
+	struct mmu_interval_notifier *mni, struct mm_struct *mm,
+	unsigned long start, unsigned long length,
+	const struct mmu_interval_notifier_ops *ops)
+{
+	struct mmu_notifier_mm *mmn_mm;
+
+	mmn_mm = mm->mmu_notifier_mm;
+	if (!mmn_mm || !mmn_mm->has_itree)
+		return -EINVAL;
+	return __mmu_interval_notifier_insert(mni, mm, mmn_mm, start, length,
+					      ops);
+}
+EXPORT_SYMBOL_GPL(mmu_interval_notifier_insert_safe);
+
 /**
  * mmu_interval_notifier_remove - Remove a interval notifier
  * @mni: Interval notifier to unregister
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
