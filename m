Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF09F21165B
	for <lists+nouveau@lfdr.de>; Thu,  2 Jul 2020 00:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927DD6EA11;
	Wed,  1 Jul 2020 22:54:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36EFE6EA12
 for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2020 22:54:16 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efd13e50000>; Wed, 01 Jul 2020 15:53:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 01 Jul 2020 15:54:15 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 01 Jul 2020 15:54:15 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Jul
 2020 22:54:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 1 Jul 2020 22:54:05 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5efd140d0001>; Wed, 01 Jul 2020 15:54:05 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Date: Wed, 1 Jul 2020 15:53:51 -0700
Message-ID: <20200701225352.9649-5-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200701225352.9649-1-rcampbell@nvidia.com>
References: <20200701225352.9649-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593644005; bh=cSxX1xcaeaVcHhbqRAtPNiO5QBvYsOaavmMJfbi6bA8=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=RneYORG0eLMMF1TBC1VCffQdhZXUumV6NibVW/pUNBMR/CkOHfnTy1w3+B3dTBlSv
 TY2UgbpNs8kbKLVOs3NMsJmwsNbozTd5ja9B/ePtH/ID9aydeOjVW4B0JflCCXYQTZ
 qOcXy33CqC+UWJZ3wegUSbeq/QCBSE2gY80lRMumE7fZUEOChWCq619a1o/8fyoo6R
 rj3FkBqwQNHW+eyU2entd5XAya7yx2YRVFS2pg7z3Sbyy9vZ49N94WLpiEmZ5yKMmf
 7DPZhAzx8FdAPBdES44V5Q3omggZgS9IxXwr9ltFr6V0Z19BmVjLxEn1+LLJtUkCjY
 lEqIVPY5FlScw==
Subject: [Nouveau] [PATCH v3 4/5] nouveau/hmm: support mapping large sysmem
 pages
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

Nouveau currently only supports mapping PAGE_SIZE sized pages of system
memory when shared virtual memory (SVM) is enabled. Use the new
hmm_pfn_to_map_order() function to support mapping system memory pages
that are PMD_SIZE.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 53 ++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 665dede69bd1..c5f8ca6fb2e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -514,38 +514,57 @@ static const struct mmu_interval_notifier_ops nouveau_svm_mni_ops = {
 };
 
 static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
-				    struct hmm_range *range, u64 *ioctl_addr)
+				    struct hmm_range *range,
+				    struct nouveau_pfnmap_args *args)
 {
 	struct page *page;
 
 	/*
-	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
+	 * The address prepared here is passed through nvif_object_ioctl()
 	 * to an eventual DMA map in something like gp100_vmm_pgt_pfn()
 	 *
 	 * This is all just encoding the internal hmm representation into a
 	 * different nouveau internal representation.
 	 */
 	if (!(range->hmm_pfns[0] & HMM_PFN_VALID)) {
-		ioctl_addr[0] = 0;
+		args->p.phys[0] = 0;
 		return;
 	}
 
 	page = hmm_pfn_to_page(range->hmm_pfns[0]);
+	/*
+	 * Only map compound pages to the GPU if the CPU is also mapping the
+	 * page as a compound page. Otherwise, the PTE protections might not be
+	 * consistent (e.g., CPU only maps part of a compound page).
+	 * Note that the underlying page might still be larger than the
+	 * CPU mapping (e.g., a PUD sized compound page partially mapped with
+	 * a PMD sized page table entry).
+	 */
+	if (hmm_pfn_to_map_order(range->hmm_pfns[0])) {
+		unsigned long addr = args->p.addr;
+
+		args->p.page = hmm_pfn_to_map_order(range->hmm_pfns[0]) +
+				PAGE_SHIFT;
+		args->p.size = 1UL << args->p.page;
+		args->p.addr &= ~(args->p.size - 1);
+		page -= (addr - args->p.addr) >> PAGE_SHIFT;
+	}
 	if (is_device_private_page(page))
-		ioctl_addr[0] = nouveau_dmem_page_addr(page) |
+		args->p.phys[0] = nouveau_dmem_page_addr(page) |
 				NVIF_VMM_PFNMAP_V0_V |
 				NVIF_VMM_PFNMAP_V0_VRAM;
 	else
-		ioctl_addr[0] = page_to_phys(page) |
+		args->p.phys[0] = page_to_phys(page) |
 				NVIF_VMM_PFNMAP_V0_V |
 				NVIF_VMM_PFNMAP_V0_HOST;
 	if (range->hmm_pfns[0] & HMM_PFN_WRITE)
-		ioctl_addr[0] |= NVIF_VMM_PFNMAP_V0_W;
+		args->p.phys[0] |= NVIF_VMM_PFNMAP_V0_W;
 }
 
 static int nouveau_range_fault(struct nouveau_svmm *svmm,
-			       struct nouveau_drm *drm, void *data, u32 size,
-			       u64 *ioctl_addr, unsigned long hmm_flags,
+			       struct nouveau_drm *drm,
+			       struct nouveau_pfnmap_args *args, u32 size,
+			       unsigned long hmm_flags,
 			       struct svm_notifier *notifier)
 {
 	unsigned long timeout =
@@ -585,10 +604,10 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 		break;
 	}
 
-	nouveau_hmm_convert_pfn(drm, &range, ioctl_addr);
+	nouveau_hmm_convert_pfn(drm, &range, args);
 
 	svmm->vmm->vmm.object.client->super = true;
-	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
+	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args, size, NULL);
 	svmm->vmm->vmm.object.client->super = false;
 	mutex_unlock(&svmm->mutex);
 
@@ -717,12 +736,13 @@ nouveau_svm_fault(struct nvif_notify *notify)
 						   args.i.p.addr, args.i.p.size,
 						   &nouveau_svm_mni_ops);
 		if (!ret) {
-			ret = nouveau_range_fault(svmm, svm->drm, &args,
-				sizeof(args), args.phys, hmm_flags, &notifier);
+			ret = nouveau_range_fault(svmm, svm->drm, &args.i,
+				sizeof(args), hmm_flags, &notifier);
 			mmu_interval_notifier_remove(&notifier.notifier);
 		}
 		mmput(mm);
 
+		limit = args.i.p.addr + args.i.p.size;
 		for (fn = fi; ++fn < buffer->fault_nr; ) {
 			/* It's okay to skip over duplicate addresses from the
 			 * same SVMM as faults are ordered by access type such
@@ -730,9 +750,16 @@ nouveau_svm_fault(struct nvif_notify *notify)
 			 *
 			 * ie. WRITE faults appear first, thus any handling of
 			 * pending READ faults will already be satisfied.
+			 * But if a large page is mapped, make sure subsequent
+			 * fault addresses have sufficient access permission.
 			 */
 			if (buffer->fault[fn]->svmm != svmm ||
-			    buffer->fault[fn]->addr >= limit)
+			    buffer->fault[fn]->addr >= limit ||
+			    (buffer->fault[fi]->access == 0 /* READ. */ &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_V)) ||
+			    (buffer->fault[fi]->access != 0 /* READ. */ &&
+			     buffer->fault[fi]->access != 3 /* PREFETCH. */ &&
+			     !(args.phys[0] & NVIF_VMM_PFNMAP_V0_W)))
 				break;
 		}
 
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
