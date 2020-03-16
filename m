Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D7187360
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 20:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3066E4B1;
	Mon, 16 Mar 2020 19:32:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E0A56E214;
 Mon, 16 Mar 2020 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4gaTFJs/l9N8IeQMQi7DOyHD1CPLDY/nz5Zeu/uMNCU=; b=oEHEcwlD88rLBGohYprCQEAAgf
 HCglg57j6YbWxMQ22C8YyUXtRbsGd1W/FJ1f793/E+7o8EC3qy/ThsQ9MEqZTb9oL/KRVqjarX3o5
 VGJMJpnkyaCqfdcxcNDeqGKflR3tAaU4Mvz0Z7dXn4raeJeEz2Mu097skFYa2NmSkHL/Yb/UZeX/x
 dLst1Tr1iwFwkUj0h8I3nbwlnxyWkTyNyehKoWvsHFLSc6M73sLPL09j41pPjGNP3XofxH1N7AYVS
 puYeetoypX8PAC2xhtd239cqs6kbXSpXceIk27vNdraVVTe7pU9R3Uzmy/eUwcQ4Shv5Phg5NXgsN
 p8K8zWoA==;
Received: from [2001:4bb8:188:30cd:8026:d98c:a056:3e33] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDvTI-0003bC-LS; Mon, 16 Mar 2020 19:32:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 16 Mar 2020 20:32:13 +0100
Message-Id: <20200316193216.920734-2-hch@lst.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200316193216.920734-1-hch@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 1/4] memremap: add an owner field to struct
 dev_pagemap
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
 arch/powerpc/kvm/book3s_hv_uvmem.c     | 2 ++
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
 include/linux/memremap.h               | 4 ++++
 mm/memremap.c                          | 4 ++++
 4 files changed, 11 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 79b1202b1c62..67fefb03b9b7 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -779,6 +779,8 @@ int kvmppc_uvmem_init(void)
 	kvmppc_uvmem_pgmap.type = MEMORY_DEVICE_PRIVATE;
 	kvmppc_uvmem_pgmap.res = *res;
 	kvmppc_uvmem_pgmap.ops = &kvmppc_uvmem_ops;
+	/* just one global instance: */
+	kvmppc_uvmem_pgmap.owner = &kvmppc_uvmem_pgmap;
 	addr = memremap_pages(&kvmppc_uvmem_pgmap, NUMA_NO_NODE);
 	if (IS_ERR(addr)) {
 		ret = PTR_ERR(addr);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 0ad5d87b5a8e..a4682272586e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -526,6 +526,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	drm->dmem->pagemap.type = MEMORY_DEVICE_PRIVATE;
 	drm->dmem->pagemap.res = *res;
 	drm->dmem->pagemap.ops = &nouveau_dmem_pagemap_ops;
+	drm->dmem->pagemap.owner = drm->dev;
 	if (IS_ERR(devm_memremap_pages(device, &drm->dmem->pagemap)))
 		goto out_free;
 
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
diff --git a/mm/memremap.c b/mm/memremap.c
index 09b5b7adc773..9b2c97ceb775 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -181,6 +181,10 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
 			WARN(1, "Missing migrate_to_ram method\n");
 			return ERR_PTR(-EINVAL);
 		}
+		if (!pgmap->owner) {
+			WARN(1, "Missing owner\n");
+			return ERR_PTR(-EINVAL);
+		}
 		break;
 	case MEMORY_DEVICE_FS_DAX:
 		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
-- 
2.24.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
