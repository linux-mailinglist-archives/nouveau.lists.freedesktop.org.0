Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AC221DE70
	for <lists+nouveau@lfdr.de>; Mon, 13 Jul 2020 19:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E556E530;
	Mon, 13 Jul 2020 17:22:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D036E536
 for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2020 17:22:09 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f0c98070002>; Mon, 13 Jul 2020 10:21:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 13 Jul 2020 10:22:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 13 Jul 2020 10:22:08 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jul
 2020 17:22:00 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 13 Jul 2020 17:22:00 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f0c98370001>; Mon, 13 Jul 2020 10:21:59 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <kvm-ppc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date: Mon, 13 Jul 2020 10:21:46 -0700
Message-ID: <20200713172149.2310-3-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713172149.2310-1-rcampbell@nvidia.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594660871; bh=oUFyut0bYbUlRSiOKSQzYag17RS/tfE1NY07M2r4NuM=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=a/3tko9LlFA9S/p9fHKn5ZyPDjpqNEiDPwIpL8GqIO9Zb6M5+Ga/Utrsie4r0Fumm
 K16mG0JeoguFCkPQXWoJ4eK7OWD4o2c0Eo9ixNvTS8+7x3bi5mVIlElRUIzt9Q1lGf
 Y/r0AX9tvZbNRKX79JXnpdezxZR9ulB2iOjx4oUsdPYSo8/0azD8Gn3qmKNrd+YyC+
 gQbKkSeDly0oHbEJEVT9VgHYMLS5M0ftUffP7JhtqfS81rVq4kAPBreLY8+M9xt+Sl
 NC/GhlOhSXi40ZPdkVZvY51/2dzubpCQUrdcyXK7lkm2kChEzF4Xf8fnBkDtkbq8Pa
 lR7CyWBGgeDHQ==
Subject: [Nouveau] [PATCH v2 2/5] mm/migrate: add a direction parameter to
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
it implies the direction of the migration and it identifies device private
pages owned by the caller. Split this into separate parameters so the
src_owner field can be used just to identify device private pages owned
by the caller of migrate_vma_setup().

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 ++
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 ++
 include/linux/migrate.h                | 12 +++++++++---
 lib/test_hmm.c                         |  2 ++
 mm/migrate.c                           |  5 +++--
 5 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 09d8119024db..acbf14cd2d72 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -400,6 +400,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
+	mig.dir = MIGRATE_VMA_FROM_SYSTEM;
 
 	/*
 	 * We come here with mmap_lock write lock held just for
@@ -578,6 +579,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
 	mig.src_owner = &kvmppc_uvmem_pgmap;
+	mig.dir = MIGRATE_VMA_FROM_DEVICE_PRIVATE;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* The requested page is already paged-out, nothing to do */
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index e5c230d9ae24..e5c83b8ee82e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -183,6 +183,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.src		= &src,
 		.dst		= &dst,
 		.src_owner	= drm->dev,
+		.dir		= MIGRATE_VMA_FROM_DEVICE_PRIVATE,
 	};
 
 	/*
@@ -615,6 +616,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
+		.dir		= MIGRATE_VMA_FROM_SYSTEM,
 	};
 	unsigned long i;
 	u64 *pfns;
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 3e546cbf03dd..620f2235d7d4 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -180,6 +180,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
 	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
 }
 
+enum migrate_vma_direction {
+	MIGRATE_VMA_FROM_SYSTEM,
+	MIGRATE_VMA_FROM_DEVICE_PRIVATE,
+};
+
 struct migrate_vma {
 	struct vm_area_struct	*vma;
 	/*
@@ -199,11 +204,12 @@ struct migrate_vma {
 
 	/*
 	 * Set to the owner value also stored in page->pgmap->owner for
-	 * migrating out of device private memory.  If set only device
-	 * private pages with this owner are migrated.  If not set
-	 * device private pages are not migrated at all.
+	 * migrating device private memory. The direction also needs to
+	 * be set to MIGRATE_VMA_FROM_DEVICE_PRIVATE.
 	 */
 	void			*src_owner;
+
+	enum migrate_vma_direction dir;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 9aa577afc269..1bd60cfb5a25 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -703,6 +703,7 @@ static int dmirror_migrate(struct dmirror *dmirror,
 		args.start = addr;
 		args.end = next;
 		args.src_owner = NULL;
+		args.dir = MIGRATE_VMA_FROM_SYSTEM;
 		ret = migrate_vma_setup(&args);
 		if (ret)
 			goto out;
@@ -1054,6 +1055,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
 	args.src = &src_pfns;
 	args.dst = &dst_pfns;
 	args.src_owner = dmirror->mdevice;
+	args.dir = MIGRATE_VMA_FROM_DEVICE_PRIVATE;
 
 	if (migrate_vma_setup(&args))
 		return VM_FAULT_SIGBUS;
diff --git a/mm/migrate.c b/mm/migrate.c
index f37729673558..2bbc5c4c672e 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2287,7 +2287,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 
 			page = device_private_entry_to_page(entry);
-			if (page->pgmap->owner != migrate->src_owner)
+			if (migrate->dir != MIGRATE_VMA_FROM_DEVICE_PRIVATE ||
+			    page->pgmap->owner != migrate->src_owner)
 				goto next;
 
 			mpfn = migrate_pfn(page_to_pfn(page)) |
@@ -2295,7 +2296,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			if (is_write_device_private_entry(entry))
 				mpfn |= MIGRATE_PFN_WRITE;
 		} else {
-			if (migrate->src_owner)
+			if (migrate->dir != MIGRATE_VMA_FROM_SYSTEM)
 				goto next;
 			pfn = pte_pfn(pte);
 			if (is_zero_pfn(pfn)) {
-- 
2.20.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
