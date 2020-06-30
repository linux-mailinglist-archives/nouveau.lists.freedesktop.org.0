Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6B020FD26
	for <lists+nouveau@lfdr.de>; Tue, 30 Jun 2020 21:58:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F2889B27;
	Tue, 30 Jun 2020 19:58:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E9389B05
 for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2020 19:58:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb98f40000>; Tue, 30 Jun 2020 12:56:36 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 12:58:15 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 12:58:15 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 19:58:07 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 30 Jun 2020 19:58:07 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5efb994f0002>; Tue, 30 Jun 2020 12:58:07 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 30 Jun 2020 12:57:33 -0700
Message-ID: <20200630195737.8667-2-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200630195737.8667-1-rcampbell@nvidia.com>
References: <20200630195737.8667-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593546996; bh=2WyHYZcAAd5j4j8YMKEb9Xnebvu/ReeLnPA7IJpaPHY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=r0AhEB3uF+5wNNtM0mmIB01SZmgLqLlmHnepBFQmHzf4tRP0UTxTQs9DPBBRuI0FP
 zqjRwmgP1abIaPUC7nsZvRET4KZmg+f9mjYRi59+5CTjpP8xRc37YbBvC94qcxixKo
 GMJGXam43JhMVk8m5Yr87K0qbRDzfBHuBQrOSeE8UpsCAWiClRlr/h4Ic38BqYsWk2
 YONZNtzbM1atRj0HZuCSqgCkGm/atkoVDj66ClPR00F8p/EFuu3Fr0O4ndlzdir4wp
 3mFRc3Xa3s/yv1B7CTJDLEX2naf8jt7Yni2zry2JH1TX5u4ZVOUlejHE8/he4/MtPP
 o+cnDyb/dc/XQ==
Subject: [Nouveau] [PATCH v2 1/5] nouveau/hmm: fault one page at a time
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
 Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The SVM page fault handler groups faults into a range of contiguous
virtual addresses and requests hmm_range_fault() to populate and
return the page frame number of system memory mapped by the CPU.
In preparation for supporting large pages to be mapped by the GPU,
process faults one page at a time. In addition, use the hmm_range
default_flags to fix a corner case where the input hmm_pfns array
is not reinitialized after hmm_range_fault() returns -EBUSY and must
be called again.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 199 +++++++++-----------------
 1 file changed, 66 insertions(+), 133 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index ba9f9359c30e..665dede69bd1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -516,7 +516,7 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
 static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 				    struct hmm_range *range, u64 *ioctl_addr)
 {
-	unsigned long i, npages;
+	struct page *page;
 
 	/*
 	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
@@ -525,42 +525,38 @@ static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
 	 * This is all just encoding the internal hmm representation into a
 	 * different nouveau internal representation.
 	 */
-	npages = (range->end - range->start) >> PAGE_SHIFT;
-	for (i = 0; i < npages; ++i) {
-		struct page *page;
-
-		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
-			ioctl_addr[i] = 0;
-			continue;
-		}
-
-		page = hmm_pfn_to_page(range->hmm_pfns[i]);
-		if (is_device_private_page(page))
-			ioctl_addr[i] = nouveau_dmem_page_addr(page) |
-					NVIF_VMM_PFNMAP_V0_V |
-					NVIF_VMM_PFNMAP_V0_VRAM;
-		else
-			ioctl_addr[i] = page_to_phys(page) |
-					NVIF_VMM_PFNMAP_V0_V |
-					NVIF_VMM_PFNMAP_V0_HOST;
-		if (range->hmm_pfns[i] & HMM_PFN_WRITE)
-			ioctl_addr[i] |= NVIF_VMM_PFNMAP_V0_W;
+	if (!(range->hmm_pfns[0] & HMM_PFN_VALID)) {
+		ioctl_addr[0] = 0;
+		return;
 	}
+
+	page = hmm_pfn_to_page(range->hmm_pfns[0]);
+	if (is_device_private_page(page))
+		ioctl_addr[0] = nouveau_dmem_page_addr(page) |
+				NVIF_VMM_PFNMAP_V0_V |
+				NVIF_VMM_PFNMAP_V0_VRAM;
+	else
+		ioctl_addr[0] = page_to_phys(page) |
+				NVIF_VMM_PFNMAP_V0_V |
+				NVIF_VMM_PFNMAP_V0_HOST;
+	if (range->hmm_pfns[0] & HMM_PFN_WRITE)
+		ioctl_addr[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       struct nouveau_drm *drm, void *data, u32 size,
-			       unsigned long hmm_pfns[], u64 *ioctl_addr,
+			       u64 *ioctl_addr, unsigned long hmm_flags,
 			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =
 		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	/* Have HMM fault pages within the fault window to the GPU. */
+	unsigned long hmm_pfns[1];
 	struct hmm_range range = {
 		.notifier = &notifier->notifier,
 		.start = notifier->notifier.interval_tree.start,
 		.end = notifier->notifier.interval_tree.last + 1,
-		.pfn_flags_mask = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE,
+		.default_flags = hmm_flags,
 		.hmm_pfns = hmm_pfns,
 	};
 	struct mm_struct *mm = notifier->notifier.mm;
@@ -575,11 +571,6 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		ret = hmm_range_fault(&range);
 		mmap_read_unlock(mm);
 		if (ret) {
-			/*
-			 * FIXME: the input PFN_REQ flags are destroyed on
-			 * -EBUSY, we need to regenerate them, also for the
-			 * other continue below
-			 */
 			if (ret == -EBUSY)
 				continue;
 			return ret;
@@ -614,17 +605,12 @@ nouveau_svm_fault(struct nvif_notify *notify)
 	struct nvif_object *device = &svm->drm->client.device.object;
 	struct nouveau_svmm *svmm;
 	struct {
-		struct {
-			struct nvif_ioctl_v0 i;
-			struct nvif_ioctl_mthd_v0 m;
-			struct nvif_vmm_pfnmap_v0 p;
-		} i;
-		u64 phys[16];
+		struct nouveau_pfnmap_args i;
+		u64 phys[1];
 	} args;
-	unsigned long hmm_pfns[ARRAY_SIZE(args.phys)];
-	struct vm_area_struct *vma;
+	unsigned long hmm_flags;
 	u64 inst, start, limit;
-	int fi, fn, pi, fill;
+	int fi, fn;
 	int replay = 0, ret;
 
 	/* Parse available fault buffer entries into a cache, and update
@@ -691,66 +677,53 @@ nouveau_svm_fault(struct nvif_notify *notify)
 		 * window into a single update.
 		 */
 		start = buffer->fault[fi]->addr;
-		limit = start + (ARRAY_SIZE(args.phys) << PAGE_SHIFT);
+		limit = start + PAGE_SIZE;
 		if (start < svmm->unmanaged.limit)
 			limit = min_t(u64, limit, svmm->unmanaged.start);
-		SVMM_DBG(svmm, "wndw %016llx-%016llx", start, limit);
 
-		mm = svmm->notifier.mm;
-		if (!mmget_not_zero(mm)) {
-			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
-			continue;
-		}
-
-		/* Intersect fault window with the CPU VMA, cancelling
-		 * the fault if the address is invalid.
+		/*
+		 * Prepare the GPU-side update of all pages within the
+		 * fault window, determining required pages and access
+		 * permissions based on pending faults.
 		 */
-		mmap_read_lock(mm);
-		vma = find_vma_intersection(mm, start, limit);
-		if (!vma) {
-			SVMM_ERR(svmm, "wndw %016llx-%016llx", start, limit);
-			mmap_read_unlock(mm);
-			mmput(mm);
-			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
-			continue;
+		args.i.p.addr = start;
+		args.i.p.page = PAGE_SHIFT;
+		args.i.p.size = PAGE_SIZE;
+		/*
+		 * Determine required permissions based on GPU fault
+		 * access flags.
+		 * XXX: atomic?
+		 */
+		switch (buffer->fault[fi]->access) {
+		case 0: /* READ. */
+			hmm_flags = HMM_PFN_REQ_FAULT;
+			break;
+		case 3: /* PREFETCH. */
+			hmm_flags = 0;
+			break;
+		default:
+			hmm_flags = HMM_PFN_REQ_FAULT | HMM_PFN_REQ_WRITE;
+			break;
 		}
-		start = max_t(u64, start, vma->vm_start);
-		limit = min_t(u64, limit, vma->vm_end);
-		mmap_read_unlock(mm);
-		SVMM_DBG(svmm, "wndw %016llx-%016llx", start, limit);
 
-		if (buffer->fault[fi]->addr != start) {
-			SVMM_ERR(svmm, "addr %016llx", buffer->fault[fi]->addr);
-			mmput(mm);
+		mm = svmm->notifier.mm;
+		if (!mmget_not_zero(mm)) {
 			nouveau_svm_fault_cancel_fault(svm, buffer->fault[fi]);
 			continue;
 		}
 
-		/* Prepare the GPU-side update of all pages within the
-		 * fault window, determining required pages and access
-		 * permissions based on pending faults.
-		 */
-		args.i.p.page = PAGE_SHIFT;
-		args.i.p.addr = start;
-		for (fn = fi, pi = 0;;) {
-			/* Determine required permissions based on GPU fault
-			 * access flags.
-			 *XXX: atomic?
-			 */
-			switch (buffer->fault[fn]->access) {
-			case 0: /* READ. */
-				hmm_pfns[pi++] = HMM_PFN_REQ_FAULT;
-				break;
-			case 3: /* PREFETCH. */
-				hmm_pfns[pi++] = 0;
-				break;
-			default:
-				hmm_pfns[pi++] = HMM_PFN_REQ_FAULT |
-						 HMM_PFN_REQ_WRITE;
-				break;
-			}
-			args.i.p.size = pi << PAGE_SHIFT;
+		notifier.svmm = svmm;
+		ret = mmu_interval_notifier_insert(&notifier.notifier, mm,
+						   args.i.p.addr, args.i.p.size,
+						   &nouveau_svm_mni_ops);
+		if (!ret) {
+			ret = nouveau_range_fault(svmm, svm->drm, &args,
+				sizeof(args), args.phys, hmm_flags, &notifier);
+			mmu_interval_notifier_remove(&notifier.notifier);
+		}
+		mmput(mm);
 
+		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
 			 * same SVMM as faults are ordered by access type such
 			 * that only the first one needs to be handled.
@@ -758,61 +731,21 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			 * ie. WRITE faults appear first, thus any handling of
 			 * pending READ faults will already be satisfied.
 			 */
-			while (++fn < buffer->fault_nr &&
-			       buffer->fault[fn]->svmm == svmm &&
-			       buffer->fault[fn    ]->addr ==
-			       buffer->fault[fn - 1]->addr);
-
-			/* If the next fault is outside the window, or all GPU
-			 * faults have been dealt with, we're done here.
-			 */
-			if (fn >= buffer->fault_nr ||
-			    buffer->fault[fn]->svmm != svmm ||
+			if (buffer->fault[fn]->svmm != svmm ||
 			    buffer->fault[fn]->addr >= limit)
 				break;
-
-			/* Fill in the gap between this fault and the next. */
-			fill = (buffer->fault[fn    ]->addr -
-				buffer->fault[fn - 1]->addr) >> PAGE_SHIFT;
-			while (--fill)
-				hmm_pfns[pi++] = 0;
 		}
 
-		SVMM_DBG(svmm, "wndw %016llx-%016llx covering %d fault(s)",
-			 args.i.p.addr,
-			 args.i.p.addr + args.i.p.size, fn - fi);
-
-		notifier.svmm = svmm;
-		ret = mmu_interval_notifier_insert(&notifier.notifier,
-						   svmm->notifier.mm,
-						   args.i.p.addr, args.i.p.size,
-						   &nouveau_svm_mni_ops);
-		if (!ret) {
-			ret = nouveau_range_fault(
-				svmm, svm->drm, &args,
-				sizeof(args.i) + pi * sizeof(args.phys[0]),
-				hmm_pfns, args.phys, &notifier);
-			mmu_interval_notifier_remove(&notifier.notifier);
-		}
-		mmput(mm);
+		/* If handling failed completely, cancel all faults. */
+		if (ret) {
+			while (fi < fn) {
+				struct nouveau_svm_fault *fault =
+					buffer->fault[fi++];
 
-		/* Cancel any faults in the window whose pages didn't manage
-		 * to keep their valid bit, or stay writeable when required.
-		 *
-		 * If handling failed completely, cancel all faults.
-		 */
-		while (fi < fn) {
-			struct nouveau_svm_fault *fault = buffer->fault[fi++];
-			pi = (fault->addr - args.i.p.addr) >> PAGE_SHIFT;
-			if (ret ||
-			     !(args.phys[pi] & NVIF_VMM_PFNMAP_V0_V) ||
-			    (!(args.phys[pi] & NVIF_VMM_PFNMAP_V0_W) &&
-			     fault->access != 0 && fault->access != 3)) {
 				nouveau_svm_fault_cancel_fault(svm, fault);
-				continue;
 			}
+		} else
 			replay++;
-		}
 	}
 
 	/* Issue fault replay to the GPU. */
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
