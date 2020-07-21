Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB21228B5C
	for <lists+nouveau@lfdr.de>; Tue, 21 Jul 2020 23:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB8D6E462;
	Tue, 21 Jul 2020 21:31:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE1D6E462
 for <nouveau@lists.freedesktop.org>; Tue, 21 Jul 2020 21:31:35 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f175eaa0004>; Tue, 21 Jul 2020 14:31:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 21 Jul 2020 14:31:35 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 21 Jul 2020 14:31:35 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Jul
 2020 21:31:25 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 21 Jul 2020 21:31:26 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f175ead0003>; Tue, 21 Jul 2020 14:31:25 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 21 Jul 2020 14:31:16 -0700
Message-ID: <20200721213119.32344-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200721213119.32344-1-rcampbell@nvidia.com>
References: <20200721213119.32344-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595367082; bh=/rTL1SELeyzjCutSqs4XUcVe6mFBaH/jwq6ZNlytm7Q=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=J7DgT51EjZ8nD9G6/JU1O1XbZURFtSDXnymf1K4W8e042QHgmAKYphQil9q3H85d2
 8bC2QjPCdvKncLvQlAe7kbnk6Ys/6P2i3tQZsrYPA5ZSya+mbeGbIwebGoD5uMc3Y4
 GgBjI9CDZ0dtv3fWXAFGVwd9wsj1u7ARp6KiAV7Egxp3eTKPS9hl8SqwKnaMLrbm18
 NcDSwMwZ5mzPfP0e22a45zn9ZOh68N6LAw7F9lPwXfcnxV/3fZoHYN7k2Y1DNqdnpN
 LH2SPBKvokJDsXs/bX+v4SSRUvhlgs09ie3yN+CDmany+kpLCJeXSYdDO18hM7xPYX
 jOKH9+KQ0OGDA==
Subject: [Nouveau] [PATCH v3 2/5] mm/migrate: add a flags parameter to
 migrate_vma
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

The src_owner field in struct migrate_vma is being used for two purposes,
it acts as a selection filter for which types of pages are to be migrated
and it identifies device private pages owned by the caller. Split this
into separate parameters so the src_owner field can be used just to
identify device private pages owned by the caller of migrate_vma_setup().
Rename the src_owner field to pgmap_owner to reflect it is now used only
to identify which device private pages to migrate.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  4 +++-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  4 +++-
 include/linux/migrate.h                | 13 +++++++++----
 lib/test_hmm.c                         |  6 ++++--
 mm/migrate.c                           |  6 ++++--
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 09d8119024db..6850bd04bcb9 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -400,6 +400,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
+	mig.flags = MIGRATE_VMA_SELECT_SYSTEM;
 
 	/*
 	 * We come here with mmap_lock write lock held just for
@@ -577,7 +578,8 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
-	mig.src_owner = &kvmppc_uvmem_pgmap;
+	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
+	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* The requested page is already paged-out, nothing to do */
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e5c230d9ae24..78b9e3c2a5b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -182,7 +182,8 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.end		= vmf->address + PAGE_SIZE,
 		.src		= &src,
 		.dst		= &dst,
-		.src_owner	= drm->dev,
+		.pgmap_owner	= drm->dev,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
 	};
 
 	/*
@@ -615,6 +616,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
 	};
 	unsigned long i;
 	u64 *pfns;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 3e546cbf03dd..aafec0ca7b41 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+enum migrate_vma_direction {
+	MIGRATE_VMA_SELECT_SYSTEM         = (1UL << 0),
+	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = (1UL << 1),
+};
+
 struct migrate_vma {
 	struct vm_area_struct	*vma;
 	/*
@@ -199,11 +204,11 @@ struct migrate_vma {
 
 	/*
 	 * Set to the owner value also stored in page->pgmap->owner for
-	 * migrating out of device private memory.  If set only device
-	 * private pages with this owner are migrated.  If not set
-	 * device private pages are not migrated at all.
+	 * migrating out of device private memory. The flags also need to
+	 * be set to MIGRATE_VMA_SELECT_DEVICE_PRIVATE.
 	 */
-	void			*src_owner;
+	void			*pgmap_owner;
+	unsigned long		flags;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9aa577afc269..74c6ee66ef15 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -702,7 +702,8 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.dst = dst_pfns;
 		args.start = addr;
 		args.end = next;
-		args.src_owner = NULL;
+		args.pgmap_owner = NULL;
+		args.flags = MIGRATE_VMA_SELECT_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -1053,7 +1054,8 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.end = args.start + PAGE_SIZE;
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
-	args.src_owner = dmirror->mdevice;
+	args.pgmap_owner = dmirror->mdevice;
+	args.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/migrate.c b/mm/migrate.c
index f37729673558..e3ea68e3a08b 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2287,7 +2287,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 
 			page = device_private_entry_to_page(entry);
-			if (page->pgmap->owner != migrate->src_owner)
+			if (!(migrate->flags &
+				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			    page->pgmap->owner != migrate->pgmap_owner)
 				goto next;
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
@@ -2295,7 +2297,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (migrate->src_owner)
+			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
 				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
