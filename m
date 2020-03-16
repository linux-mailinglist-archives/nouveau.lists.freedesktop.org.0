Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1518737E
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 20:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7487C6E4BA;
	Mon, 16 Mar 2020 19:36:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC476E40C;
 Mon, 16 Mar 2020 19:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Tabi3VaB35wO0dKz/HPf0fwGujEMouYj0SOz1efF65E=; b=t+WBqoMRGwN6Le048kH8FgJyJt
 1pbKsThDZHr+bZTpD+XEgFMA7wfDCUzMh6rn7JJNm+UgWPmBb8p8npStYC3/LGkaNUC5NFGa3tT4e
 QXzA9stUoWtn7ijfUA0UVCW1I/HGTeTQg0XJ2djb+Oa2TBhMJoCBeFlV+lhIDoEkw9NBMwxD78eaw
 f/u22FVYmTT21fH0p3mYHXmNTYCGHPFzjBCYxnHMRbpc2PY0vNmvnZK3dxuFFMuBK87TSzzyrqPNt
 llVQnf4OND0EgSCrR8bDNJiYBqZ4edKPYdQqvtiRgp+t4mau45I5wB8l9bJMGJB1fN9PD6JmmwCiG
 7weWV6rw==;
Received: from 089144202225.atnat0011.highway.a1.net ([89.144.202.225]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDvXd-0005Hn-OG; Mon, 16 Mar 2020 19:36:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Mar 2020 20:32:16 +0100
Message-Id: <20200316193216.920734-5-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316193216.920734-1-hch@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 4/4] mm: check the device private page owner in
 hmm_range_fault
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
Cc: kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hmm range fault will succeed for any kind of device private memory,
even if it doesn't belong to the calling entity.  While nouveau
has some crude checks for that, they are broken because they assume
nouveau is the only user of device private memory.  Fix this by
passing in an expected pgmap owner in the hmm_range_fault structure.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Fixes: 4ef589dc9b10 ("mm/hmm/devmem: device memory hotplug using ZONE_DEVICE")
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 12 ------------
 include/linux/hmm.h                    |  2 ++
 mm/hmm.c                               | 10 +++++++++-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index edfd0805fba4..ad89e09a0be3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -672,12 +672,6 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	return ret;
 }
 
-static inline bool
-nouveau_dmem_page(struct nouveau_drm *drm, struct page *page)
-{
-	return is_device_private_page(page) && drm->dmem == page_to_dmem(page);
-}
-
 void
 nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 			 struct hmm_range *range)
@@ -696,12 +690,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 		if (!is_device_private_page(page))
 			continue;
 
-		if (!nouveau_dmem_page(drm, page)) {
-			WARN(1, "Some unknown device memory !\n");
-			range->pfns[i] = 0;
-			continue;
-		}
-
 		addr = nouveau_dmem_page_addr(page);
 		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
 		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 5e6034f105c3..bb6be4428633 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -132,6 +132,7 @@ enum hmm_pfn_value_e {
  * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
  * @pfn_shifts: pfn shift value (should be <= PAGE_SHIFT)
  * @valid: pfns array did not change since it has been fill by an HMM function
+ * @dev_private_owner: owner of device private pages
  */
 struct hmm_range {
 	struct mmu_interval_notifier *notifier;
@@ -144,6 +145,7 @@ struct hmm_range {
 	uint64_t		default_flags;
 	uint64_t		pfn_flags_mask;
 	uint8_t			pfn_shift;
+	void			*dev_private_owner;
 };
 
 /*
diff --git a/mm/hmm.c b/mm/hmm.c
index cfad65f6a67b..b75b3750e03d 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -216,6 +216,14 @@ int hmm_vma_handle_pmd(struct mm_walk *walk, unsigned long addr,
 		unsigned long end, uint64_t *pfns, pmd_t pmd);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static inline bool hmm_is_device_private_entry(struct hmm_range *range,
+		swp_entry_t entry)
+{
+	return is_device_private_entry(entry) &&
+		device_private_entry_to_page(entry)->pgmap->owner ==
+		range->dev_private_owner;
+}
+
 static inline uint64_t pte_to_hmm_pfn_flags(struct hmm_range *range, pte_t pte)
 {
 	if (pte_none(pte) || !pte_present(pte) || pte_protnone(pte))
@@ -254,7 +262,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		 * Never fault in device private pages pages, but just report
 		 * the PFN even if not present.
 		 */
-		if (is_device_private_entry(entry)) {
+		if (hmm_is_device_private_entry(range, entry)) {
 			*pfn = hmm_device_entry_from_pfn(range,
 					    swp_offset(entry));
 			*pfn |= range->flags[HMM_PFN_VALID];
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
