Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF0187373
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 20:34:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC456E4B7;
	Mon, 16 Mar 2020 19:34:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B6B6E4B7;
 Mon, 16 Mar 2020 19:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CqE8yp+meruwjp4Y/RQeAqRepVDJVC6RTRv2F0kbZfE=; b=AfelOdjl/97tRybYDWoh1v/AFH
 6FR3zydF4JS4qq0eiWtLd/O4ZNskOs1nOxvghJzAWSQyqKnxJ2DgPXckcg9qrs8X1xDef5jTcfyJq
 piiaDcvFaMj93uBS9wrQcJvAPvZNEss9FVtTgfYCR5ni0zL65EpIXRBOAVK9ESc2b4f5i4u4ofX2i
 l6m8TT5VOjJ0qWxlx+3F1s52w7mCtzAfCZUABRqH5R2pw+m43Xjj5YKU0ZEDQ3xrythSrI+j2XNb+
 SQ6UzUT7FJS95anPabkyqB+AraghaH5/8gAKbY/cSsIpR/uhQXx8F2KTPwDFHP57mJ/5tvhhFankW
 KmFaCxLQ==;
Received: from 089144202225.atnat0011.highway.a1.net ([89.144.202.225]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDvVU-0003xY-K3; Mon, 16 Mar 2020 19:34:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Mar 2020 20:32:15 +0100
Message-Id: <20200316193216.920734-4-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316193216.920734-1-hch@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 3/4] mm: simplify device private page handling in
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

Remove the code to fault device private pages back into system memory
that has never been used by any driver.  Also replace the usage of the
HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
is_device_private_page check in nouveau.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  5 +++--
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  1 -
 include/linux/hmm.h                     |  2 --
 mm/hmm.c                                | 25 +++++--------------------
 5 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index dee446278417..90821ce5e6ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -776,7 +776,6 @@ struct amdgpu_ttm_tt {
 static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
 	(1 << 0), /* HMM_PFN_VALID */
 	(1 << 1), /* HMM_PFN_WRITE */
-	0 /* HMM_PFN_DEVICE_PRIVATE */
 };
 
 static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 0e36345d395c..edfd0805fba4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -28,6 +28,7 @@
 
 #include <nvif/class.h>
 #include <nvif/object.h>
+#include <nvif/if000c.h>
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
 
@@ -692,9 +693,8 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 		if (page == NULL)
 			continue;
 
-		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
+		if (!is_device_private_page(page))
 			continue;
-		}
 
 		if (!nouveau_dmem_page(drm, page)) {
 			WARN(1, "Some unknown device memory !\n");
@@ -705,5 +705,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
 		addr = nouveau_dmem_page_addr(page);
 		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
 		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
+		range->pfns[i] |= NVIF_VMM_PFNMAP_V0_VRAM;
 	}
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index df9bf1fd1bc0..39c731a99937 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -367,7 +367,6 @@ static const u64
 nouveau_svm_pfn_flags[HMM_PFN_FLAG_MAX] = {
 	[HMM_PFN_VALID         ] = NVIF_VMM_PFNMAP_V0_V,
 	[HMM_PFN_WRITE         ] = NVIF_VMM_PFNMAP_V0_W,
-	[HMM_PFN_DEVICE_PRIVATE] = NVIF_VMM_PFNMAP_V0_VRAM,
 };
 
 static const u64
diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index 4bf8d6997b12..5e6034f105c3 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -74,7 +74,6 @@
  * Flags:
  * HMM_PFN_VALID: pfn is valid. It has, at least, read permission.
  * HMM_PFN_WRITE: CPU page table has write permission set
- * HMM_PFN_DEVICE_PRIVATE: private device memory (ZONE_DEVICE)
  *
  * The driver provides a flags array for mapping page protections to device
  * PTE bits. If the driver valid bit for an entry is bit 3,
@@ -86,7 +85,6 @@
 enum hmm_pfn_flag_e {
 	HMM_PFN_VALID = 0,
 	HMM_PFN_WRITE,
-	HMM_PFN_DEVICE_PRIVATE,
 	HMM_PFN_FLAG_MAX
 };
 
diff --git a/mm/hmm.c b/mm/hmm.c
index 180e398170b0..cfad65f6a67b 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -118,15 +118,6 @@ static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
 	/* We aren't ask to do anything ... */
 	if (!(pfns & range->flags[HMM_PFN_VALID]))
 		return;
-	/* If this is device memory then only fault if explicitly requested */
-	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
-		/* Do we fault on device memory ? */
-		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
-			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
-			*fault = true;
-		}
-		return;
-	}
 
 	/* If CPU page table is not valid then we need to fault */
 	*fault = !(cpu_flags & range->flags[HMM_PFN_VALID]);
@@ -260,21 +251,15 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 		swp_entry_t entry = pte_to_swp_entry(pte);
 
 		/*
-		 * This is a special swap entry, ignore migration, use
-		 * device and report anything else as error.
+		 * Never fault in device private pages pages, but just report
+		 * the PFN even if not present.
 		 */
 		if (is_device_private_entry(entry)) {
-			cpu_flags = range->flags[HMM_PFN_VALID] |
-				range->flags[HMM_PFN_DEVICE_PRIVATE];
-			cpu_flags |= is_write_device_private_entry(entry) ?
-				range->flags[HMM_PFN_WRITE] : 0;
-			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
-					   &fault, &write_fault);
-			if (fault || write_fault)
-				goto fault;
 			*pfn = hmm_device_entry_from_pfn(range,
 					    swp_offset(entry));
-			*pfn |= cpu_flags;
+			*pfn |= range->flags[HMM_PFN_VALID];
+			if (is_write_device_private_entry(entry))
+				*pfn |= range->flags[HMM_PFN_WRITE];
 			return 0;
 		}
 
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
