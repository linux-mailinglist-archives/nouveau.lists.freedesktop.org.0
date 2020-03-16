Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D5B1871A6
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 18:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2029D6E497;
	Mon, 16 Mar 2020 17:55:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E3D89FFD;
 Mon, 16 Mar 2020 17:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=QlKIjMPLL+dBAMQ3x7lfLeAxdAk09SIP8MWt/OwJJ0U=; b=J7cWL+vS4aEBIqxKHgqDMyuei/
 MlTSB4ZjYrRgBqlYlzjlOVe43VQxvmPdy5iE8rt2j5EgHVSmfJlCI4rsan45dQ6CrUl4XjARnMVBt
 K7Vci5bJdhRt92/IMy/FHUNXafOOSX2bj369iF7RqWJcuLA0sLNkjc8UrXaEMKiiN/N8YAcVgAXN1
 Inv6XXfGSMpTbd9yhaJYxJgFO/uM3C4d9iv8dWTUSyRqqQU7JE408nHEnYp6byizqaNEX07VSEste
 UWTP9/2yY1ZLFu+uvhdab7Yv+ed6MYC4V6ucqDFWv5cc+t9/t21FPk0PhIlULWjFdpHY2dWSLkMcI
 Skyg48JQ==;
Received: from [2001:4bb8:188:30cd:8026:d98c:a056:3e33] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDtxM-0000yH-BG; Mon, 16 Mar 2020 17:55:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Mar 2020 18:52:58 +0100
Message-Id: <20200316175259.908713-2-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316175259.908713-1-hch@lst.de>
References: <20200316175259.908713-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 1/2] mm: handle multiple owners of device private
 pages in migrate_vma
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

Add a new opaque owner field to struct dev_pagemap, which will allow
the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
and refuse to work on mappings not owned by the calling entity.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c     | 4 ++++
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 3 +++
 include/linux/memremap.h               | 4 ++++
 include/linux/migrate.h                | 2 ++
 mm/migrate.c                           | 3 +++
 5 files changed, 16 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 79b1202b1c62..29ed52892d31 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -386,6 +386,7 @@ kvmppc_svm_page_in(struct vm_area_struct *vma, unsigned long start,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
+	mig.dev_private_owner = &kvmppc_uvmem_pgmap;
 
 	/*
 	 * We come here with mmap_sem write lock held just for
@@ -563,6 +564,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
 	mig.end = end;
 	mig.src = &src_pfn;
 	mig.dst = &dst_pfn;
+	mig.dev_private_owner = &kvmppc_uvmem_pgmap;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	/* The requested page is already paged-out, nothing to do */
@@ -779,6 +781,8 @@ int kvmppc_uvmem_init(void)
 	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
 	kvmppc_uvmem_pgmap.res = *res;
 	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
+	/* just one global instance: */
+	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
 	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
 	if (IS_ERR(addr)) {
 		ret = PTR_ERR(addr);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 0ad5d87b5a8e..7605c4c48985 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -176,6 +176,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 		.end		= vmf->address + PAGE_SIZE,
 		.src		= &src,
 		.dst		= &dst,
+		.dev_private_owner = drm->dev,
 	};
 
 	/*
@@ -526,6 +527,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	drm->dmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	drm->dmem->pagemap.res = *res;
 	drm->dmem->pagemap.ops = &nouveau_dmem_pagemap_ops;
+	drm->dmem->pagemap.owner = drm->dev;
 	if (IS_ERR(devm_memremap_pages(device, &drm->dmem->pagemap)))
 		goto out_free;
 
@@ -631,6 +633,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
+		.dev_private_owner = drm->dev,
 	};
 	unsigned long c, i;
 	int ret = -ENOMEM;
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index 6fefb09af7c3..60d97e8fd3c0 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -103,6 +103,9 @@ struct dev_pagemap_ops {
  * @type: memory type: see MEMORY_* in memory_hotplug.h
  * @flags: PGMAP_* flags to specify defailed behavior
  * @ops: method table
+ * @owner: an opaque pointer identifying the entity that manages this
+ *	instance.  Used by various helpers to make sure that no
+ *	foreign ZONE_DEVICE memory is accessed.
  */
 struct dev_pagemap {
 	struct vmem_altmap altmap;
@@ -113,6 +116,7 @@ struct dev_pagemap {
 	enum memory_type type;
 	unsigned int flags;
 	const struct dev_pagemap_ops *ops;
+	void *owner;
 };
 
 static inline struct vmem_altmap *pgmap_altmap(struct dev_pagemap *pgmap)
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 72120061b7d4..4bbd8d732e53 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -196,6 +196,8 @@ struct migrate_vma {
 	unsigned long		npages;
 	unsigned long		start;
 	unsigned long		end;
+
+	void			*dev_private_owner;
 };
 
 int migrate_vma_setup(struct migrate_vma *args);
diff --git a/mm/migrate.c b/mm/migrate.c
index b1092876e537..201e8fa627e0 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2267,6 +2267,9 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 				goto next;
 
 			page = device_private_entry_to_page(entry);
+			if (page->pgmap->owner != migrate->dev_private_owner)
+				goto next;
+
 			mpfn = migrate_pfn(page_to_pfn(page)) |
 					MIGRATE_PFN_MIGRATE;
 			if (is_write_device_private_entry(entry))
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
