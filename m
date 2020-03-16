Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF27D1871A3
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 18:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 358AB89FE8;
	Mon, 16 Mar 2020 17:55:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D8289FE8;
 Mon, 16 Mar 2020 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=nobQ3uzm+JHEPydVrGYqwuRbQqPMygh1gwzX1tFiMsQ=; b=ECBBtrM0tmEz3A7OjDfk3rlIIj
 yoZOp41N3POGZrdfh/lg2q/V39z/vWovZ+bkhVUFr6SLYu/CEbssY+VzO5mXSlChLTOTh4boUxutf
 SDGeh22Q3F4NLjI+k8AQqWv/oGY7U+l5uffjcNiFVtxfhdCiI9klIkBtUZAfqRLhrs4Knk09j1lzV
 3Vovt8y/pu/ELD/gZqF1jSIZ5fVcAWVLus+vph0U+MWg6ixMBrFgfzoOcTl5kixY3PcD8mx3snFFx
 xlpDt7NmWgCTCDIz80fqBqYeehcex0unzgIePezsdNl6Eky0kQOSIJfL24vMf0p2KsrhnJ9YHsRwf
 2VL//lAg==;
Received: from [2001:4bb8:188:30cd:8026:d98c:a056:3e33] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDtxP-0000yO-3q; Mon, 16 Mar 2020 17:55:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Mar 2020 18:52:59 +0100
Message-Id: <20200316175259.908713-3-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316175259.908713-1-hch@lst.de>
References: <20200316175259.908713-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 2/2] mm: remove device private page support from
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

No driver has actually used properly wire up and support this feature.
There is various code related to it in nouveau, but as far as I can tell
it never actually got turned on, and the only changes since the initial
commit are global cleanups.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
 drivers/gpu/drm/nouveau/nouveau_dmem.c  | 37 -------------------------
 drivers/gpu/drm/nouveau/nouveau_dmem.h  |  2 --
 drivers/gpu/drm/nouveau/nouveau_svm.c   |  3 --
 include/linux/hmm.h                     |  2 --
 mm/hmm.c                                | 28 -------------------
 6 files changed, 73 deletions(-)

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
index 7605c4c48985..42808efceaf2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -671,40 +671,3 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out:
 	return ret;
 }
-
-static inline bool
-nouveau_dmem_page(struct nouveau_drm *drm, struct page *page)
-{
-	return is_device_private_page(page) && drm->dmem == page_to_dmem(page);
-}
-
-void
-nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
-			 struct hmm_range *range)
-{
-	unsigned long i, npages;
-
-	npages = (range->end - range->start) >> PAGE_SHIFT;
-	for (i = 0; i < npages; ++i) {
-		struct page *page;
-		uint64_t addr;
-
-		page = hmm_device_entry_to_page(range, range->pfns[i]);
-		if (page == NULL)
-			continue;
-
-		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
-			continue;
-		}
-
-		if (!nouveau_dmem_page(drm, page)) {
-			WARN(1, "Some unknown device memory !\n");
-			range->pfns[i] = 0;
-			continue;
-		}
-
-		addr = nouveau_dmem_page_addr(page);
-		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
-		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
-	}
-}
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
index 92394be5d649..1ac620b3d4fb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
@@ -38,8 +38,6 @@ int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			     unsigned long start,
 			     unsigned long end);
 
-void nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
-			      struct hmm_range *range);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
 static inline void nouveau_dmem_fini(struct nouveau_drm *drm) {}
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index df9bf1fd1bc0..7e0376dca137 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -367,7 +367,6 @@ static const u64
 nouveau_svm_pfn_flags[HMM_PFN_FLAG_MAX] = {
 	[HMM_PFN_VALID         ] = NVIF_VMM_PFNMAP_V0_V,
 	[HMM_PFN_WRITE         ] = NVIF_VMM_PFNMAP_V0_W,
-	[HMM_PFN_DEVICE_PRIVATE] = NVIF_VMM_PFNMAP_V0_VRAM,
 };
 
 static const u64
@@ -558,8 +557,6 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		break;
 	}
 
-	nouveau_dmem_convert_pfn(drm, &range);
-
 	svmm->vmm->vmm.object.client->super = true;
 	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
 	svmm->vmm->vmm.object.client->super = false;
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
index 180e398170b0..3d10485bf323 100644
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
@@ -259,25 +250,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
 	if (!pte_present(pte)) {
 		swp_entry_t entry = pte_to_swp_entry(pte);
 
-		/*
-		 * This is a special swap entry, ignore migration, use
-		 * device and report anything else as error.
-		 */
-		if (is_device_private_entry(entry)) {
-			cpu_flags = range->flags[HMM_PFN_VALID] |
-				range->flags[HMM_PFN_DEVICE_PRIVATE];
-			cpu_flags |= is_write_device_private_entry(entry) ?
-				range->flags[HMM_PFN_WRITE] : 0;
-			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
-					   &fault, &write_fault);
-			if (fault || write_fault)
-				goto fault;
-			*pfn = hmm_device_entry_from_pfn(range,
-					    swp_offset(entry));
-			*pfn |= cpu_flags;
-			return 0;
-		}
-
 		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
 				   &write_fault);
 		if (!fault && !write_fault)
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
