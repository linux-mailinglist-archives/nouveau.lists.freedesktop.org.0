Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3658F139CC6
	for <lists+nouveau@lfdr.de>; Mon, 13 Jan 2020 23:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C106E187;
	Mon, 13 Jan 2020 22:47:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3AD6E187
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jan 2020 22:47:13 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1cf33b0000>; Mon, 13 Jan 2020 14:46:19 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 13 Jan 2020 14:47:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 13 Jan 2020 14:47:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 22:47:12 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jan
 2020 22:47:11 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 13 Jan 2020 22:47:11 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e1cf36e0002>; Mon, 13 Jan 2020 14:47:10 -0800
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <linux-kselftest@vger.kernel.org>
Date: Mon, 13 Jan 2020 14:47:00 -0800
Message-ID: <20200113224703.5917-4-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200113224703.5917-1-rcampbell@nvidia.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578955579; bh=TvyJfevH15DcsYYlg1rhbnrL9loOhhGn+LYPOlmhmyc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=AT64yj12cDf8d9m2d5PHRVyJQn01pmmfIgdIF/Mu1SgCFD8gzKo0+N+MLbgytF0Kq
 08iWJ1L+ANzJiO/IJd2bbKeFsJGwPlw9m3StvGCbYWbsPos5uL8UrqpxJbofrN2vgC
 fd2J0737Os0CKXwpudp5DfMNnmnN9WqUd7GjPpv805n4G7j5kia/Zp31zmxE/cp/Fl
 1E3D0qMe+HKOTBd8ZWlrwncTWpqm3ctXcNvVTKAHH/uhTNCokPX2VaCmO52zbvC94b
 o3iHkoMjsyec15n7Ub2WzQcjeipCuQzu31iazOG3cs5rkCqtmym/5gP9DVvJSAAF02
 2I5H2/fWA41HQ==
Subject: [Nouveau] [PATCH v6 3/6] mm/notifier: add
 mmu_interval_notifier_update()
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

When using mmu interval notifiers, the underlying VMA range that the
interval is tracking might be expanded or shrunk. Add a helper function
to allow the interval to be updated safely from the ops->invalidate()
callback in response to VMA range changes. This is effectively removing
and inserting the mmu interval notifier but more efficient.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 include/linux/mmu_notifier.h |  4 +++
 mm/mmu_notifier.c            | 69 ++++++++++++++++++++++++++++++++++--
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
index 6dcaa632eef7..0ce59b4f22c2 100644
--- a/include/linux/mmu_notifier.h
+++ b/include/linux/mmu_notifier.h
@@ -251,6 +251,8 @@ struct mmu_interval_notifier {
 	struct mm_struct *mm;
 	struct hlist_node deferred_item;
 	unsigned long invalidate_seq;
+	unsigned long updated_start;
+	unsigned long updated_last;
 };
 
 #ifdef CONFIG_MMU_NOTIFIER
@@ -310,6 +312,8 @@ int mmu_interval_notifier_insert_safe(
 	const struct mmu_interval_notifier_ops *ops);
 void mmu_interval_notifier_remove(struct mmu_interval_notifier *mni);
 void mmu_interval_notifier_put(struct mmu_interval_notifier *mni);
+void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
+				  unsigned long start, unsigned long last);
 
 /**
  * mmu_interval_set_seq - Save the invalidation sequence
diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
index 40c837ae8d90..47ad9cc89aab 100644
--- a/mm/mmu_notifier.c
+++ b/mm/mmu_notifier.c
@@ -157,7 +157,14 @@ static void mn_itree_inv_end(struct mmu_notifier_mm *mmn_mm)
 		else {
 			interval_tree_remove(&mni->interval_tree,
 					     &mmn_mm->itree);
-			if (mni->ops->release)
+			if (mni->updated_last) {
+				mni->interval_tree.start = mni->updated_start;
+				mni->interval_tree.last = mni->updated_last;
+				mni->updated_start = 0;
+				mni->updated_last = 0;
+				interval_tree_insert(&mni->interval_tree,
+						     &mmn_mm->itree);
+			} else if (mni->ops->release)
 				hlist_add_head(&mni->deferred_item,
 					       &removed_list);
 		}
@@ -872,6 +879,8 @@ static int __mmu_interval_notifier_insert(
 	mni->ops = ops;
 	RB_CLEAR_NODE(&mni->interval_tree.rb);
 	mni->interval_tree.start = start;
+	mni->updated_start = 0;
+	mni->updated_last = 0;
 	/*
 	 * Note that the representation of the intervals in the interval tree
 	 * considers the ending point as contained in the interval.
@@ -1038,8 +1047,12 @@ static unsigned long __mmu_interval_notifier_put(
 		if (RB_EMPTY_NODE(&mni->interval_tree.rb)) {
 			hlist_del(&mni->deferred_item);
 		} else {
-			hlist_add_head(&mni->deferred_item,
-				       &mmn_mm->deferred_list);
+			if (mni->updated_last) {
+				mni->updated_start = 0;
+				mni->updated_last = 0;
+			} else
+				hlist_add_head(&mni->deferred_item,
+					       &mmn_mm->deferred_list);
 			seq = mmn_mm->invalidate_seq;
 		}
 	} else {
@@ -1108,6 +1121,56 @@ void mmu_interval_notifier_put(struct mmu_interval_notifier *mni)
 }
 EXPORT_SYMBOL_GPL(mmu_interval_notifier_put);
 
+/**
+ * mmu_interval_notifier_update - Update interval notifier range
+ * @mni: Interval notifier to update
+ * @start: New starting virtual address to monitor
+ * @last: New last virtual address (inclusive) to monitor
+ *
+ * This function updates the range being monitored and is safe to call from
+ * the invalidate() callback function.
+ * Upon return, the mmu_interval_notifier range may not be updated in the
+ * interval tree yet. The caller must use the normal interval notifier read
+ * flow via mmu_interval_read_begin() to establish SPTEs for this range.
+ */
+void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
+				  unsigned long start, unsigned long last)
+{
+	struct mm_struct *mm = mni->mm;
+	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
+	unsigned long seq = 0;
+
+	if (WARN_ON(start >= last))
+		return;
+
+	spin_lock(&mmn_mm->lock);
+	if (mn_itree_is_invalidating(mmn_mm)) {
+		/*
+		 * Update is being called after insert put this on the
+		 * deferred list, but before the deferred list was processed.
+		 */
+		if (RB_EMPTY_NODE(&mni->interval_tree.rb)) {
+			mni->interval_tree.start = start;
+			mni->interval_tree.last = last;
+		} else {
+			if (!mni->updated_last)
+				hlist_add_head(&mni->deferred_item,
+					       &mmn_mm->deferred_list);
+			mni->updated_start = start;
+			mni->updated_last = last;
+		}
+		seq = mmn_mm->invalidate_seq;
+	} else {
+		WARN_ON(RB_EMPTY_NODE(&mni->interval_tree.rb));
+		interval_tree_remove(&mni->interval_tree, &mmn_mm->itree);
+		mni->interval_tree.start = start;
+		mni->interval_tree.last = last;
+		interval_tree_insert(&mni->interval_tree, &mmn_mm->itree);
+	}
+	spin_unlock(&mmn_mm->lock);
+}
+EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
+
 /**
  * mmu_notifier_synchronize - Ensure all mmu_notifiers are freed
  *
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
