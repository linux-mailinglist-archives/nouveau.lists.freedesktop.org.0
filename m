Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEBF379F82
	for <lists+nouveau@lfdr.de>; Tue, 11 May 2021 08:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F356E9C4;
	Tue, 11 May 2021 06:05:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792EB6E9C4;
 Tue, 11 May 2021 06:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7Py9cu8kcM6SirnXfGAqtPpIrhz3oLTsugh+mdF45Rc=; b=t96tbXTYNxfNTT9sTc7MBAVQlH
 qjnOMh8IUI3Ihgj/QNX4MwuE5D245No4GbqKNRqQwWOAXGxrsKGSaUhBj8f1rtCS218I6IdmN7x+0
 KfbRfZz4Imv4eBogzFTuPEeNEt0zUNnFvnivbPIHjR/m04uY8D76SCbssUdekz3T0Q0sM15VbWC8G
 Z+RKIh/POuNX2sfhKqGQsrF06NKiP4WlNY7Wwnxl+HOL2WwFukXjRvQAZGvryOzkX2JF8AtmlWiSR
 mCWWQNtg8ZRXMNaFkVVEGlTpNxVKPMTzniVMVw4W779bLH0ClY0wZh0IsoKdpEbaAx1Hd+fIcb9uW
 AmEK29JQ==;
Received: from [2001:4bb8:198:fbc8:d27d:cdc6:80b6:b410] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lgLWC-009KPE-0K; Tue, 11 May 2021 06:05:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>
Date: Tue, 11 May 2021 08:05:14 +0200
Message-Id: <20210511060514.3956745-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511060514.3956745-1-hch@lst.de>
References: <20210511060514.3956745-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH] drm/ttm: use dma_alloc_pages for the page pool
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Roland Scheidegger <sroland@vmware.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dave Airlie <airlied@redhat.com>, spice-devel@lists.freedesktop.org,
 Zack Rusin <zackr@vmware.com>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use the dma_alloc_pages allocator for the TTM pool allocator.
This allocator is a front end to the page allocator which takes the
DMA mask of the device into account, thus offering the best of both
worlds of the two existing allocator versions.  This conversion also
removes the ugly layering violation where the TTM pool assumes what
kind of virtual address dma_alloc_attrs can return.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |   4 +-
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c   |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c   |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c   |   1 -
 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c   |   1 -
 drivers/gpu/drm/drm_cache.c             |  31 -----
 drivers/gpu/drm/drm_gem_vram_helper.c   |   3 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |   8 +-
 drivers/gpu/drm/qxl/qxl_ttm.c           |   3 +-
 drivers/gpu/drm/radeon/radeon.h         |   1 -
 drivers/gpu/drm/radeon/radeon_device.c  |   1 -
 drivers/gpu/drm/radeon/radeon_ttm.c     |   4 +-
 drivers/gpu/drm/ttm/ttm_device.c        |   7 +-
 drivers/gpu/drm/ttm/ttm_pool.c          | 178 ++++--------------------
 drivers/gpu/drm/ttm/ttm_tt.c            |  25 +---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |   4 +-
 include/drm/drm_cache.h                 |   1 -
 include/drm/ttm/ttm_device.h            |   3 +-
 include/drm/ttm/ttm_pool.h              |   9 +-
 20 files changed, 41 insertions(+), 246 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index dc3a69296321b3..5f40527eeef1ff 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -819,7 +819,6 @@ struct amdgpu_device {
 	int				usec_timeout;
 	const struct amdgpu_asic_funcs	*asic_funcs;
 	bool				shutdown;
-	bool				need_swiotlb;
 	bool				accel_working;
 	struct notifier_block		acpi_nb;
 	struct amdgpu_i2c_chan		*i2c_bus[AMDGPU_MAX_I2C_BUS];
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3bef0432cac2f7..9bf17b44cba6fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1705,9 +1705,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
 			       adev_to_drm(adev)->anon_inode->i_mapping,
-			       adev_to_drm(adev)->vma_offset_manager,
-			       adev->need_swiotlb,
-			       dma_addressing_limited(adev->dev));
+			       adev_to_drm(adev)->vma_offset_manager);
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index 405d6ad09022ca..2d4fa754513033 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -846,7 +846,6 @@ static int gmc_v6_0_sw_init(void *handle)
 		dev_warn(adev->dev, "No suitable DMA available.\n");
 		return r;
 	}
-	adev->need_swiotlb = drm_need_swiotlb(44);
 
 	r = gmc_v6_0_init_microcode(adev);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
index 210ada2289ec9c..a504db24f4c2a8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v7_0.c
@@ -1025,7 +1025,6 @@ static int gmc_v7_0_sw_init(void *handle)
 		pr_warn("No suitable DMA available\n");
 		return r;
 	}
-	adev->need_swiotlb = drm_need_swiotlb(40);
 
 	r = gmc_v7_0_init_microcode(adev);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
index e4f27b3f28fb58..42e7b1eb84b3bc 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v8_0.c
@@ -1141,7 +1141,6 @@ static int gmc_v8_0_sw_init(void *handle)
 		pr_warn("No suitable DMA available\n");
 		return r;
 	}
-	adev->need_swiotlb = drm_need_swiotlb(40);
 
 	r = gmc_v8_0_init_microcode(adev);
 	if (r) {
diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
index 455bb91060d0bc..f74784b3423740 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c
@@ -1548,7 +1548,6 @@ static int gmc_v9_0_sw_init(void *handle)
 		printk(KERN_WARNING "amdgpu: No suitable DMA available.\n");
 		return r;
 	}
-	adev->need_swiotlb = drm_need_swiotlb(44);
 
 	if (adev->gmc.xgmi.supported) {
 		r = adev->gfxhub.funcs->get_xgmi_info(adev);
diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index 79a50ef1250fd1..7e6eb4b33d0069 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -178,34 +178,3 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 #endif
 }
 EXPORT_SYMBOL(drm_clflush_virt_range);
-
-bool drm_need_swiotlb(int dma_bits)
-{
-	struct resource *tmp;
-	resource_size_t max_iomem = 0;
-
-	/*
-	 * Xen paravirtual hosts require swiotlb regardless of requested dma
-	 * transfer size.
-	 *
-	 * NOTE: Really, what it requires is use of the dma_alloc_coherent
-	 *       allocator used in ttm_dma_populate() instead of
-	 *       ttm_populate_and_map_pages(), which bounce buffers so much in
-	 *       Xen it leads to swiotlb buffer exhaustion.
-	 */
-	if (xen_pv_domain())
-		return true;
-
-	/*
-	 * Enforce dma_alloc_coherent when memory encryption is active as well
-	 * for the same reasons as for Xen paravirtual hosts.
-	 */
-	if (mem_encrypt_active())
-		return true;
-
-	for (tmp = iomem_resource.child; tmp; tmp = tmp->sibling)
-		max_iomem = max(max_iomem,  tmp->end);
-
-	return max_iomem > ((u64)1 << dma_bits);
-}
-EXPORT_SYMBOL(drm_need_swiotlb);
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 2b7c3a07956d59..6ce93d2d84d0e9 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -1034,8 +1034,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 	ret = ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
 				 dev->anon_inode->i_mapping,
-				 dev->vma_offset_manager,
-				 false, true);
+				 dev->vma_offset_manager);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index e8b506a6685b56..4876a637933980 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -285,7 +285,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	struct nvkm_pci *pci = device->pci;
 	struct nvif_mmu *mmu = &drm->client.mmu;
 	struct drm_device *dev = drm->dev;
-	bool need_swiotlb = false;
 	int typei, ret;
 
 	ret = nouveau_ttm_init_host(drm, 0);
@@ -320,14 +319,9 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 		drm->agp.cma = pci->agp.cma;
 	}
 
-#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active();
-#endif
-
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
 				  dev->anon_inode->i_mapping,
-				  dev->vma_offset_manager, need_swiotlb,
-				  drm->client.mmu.dmabits <= 32);
+				  dev->vma_offset_manager);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 47afe95d04a1a7..823eb562ba3d53 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -186,8 +186,7 @@ int qxl_ttm_init(struct qxl_device *qdev)
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
 			    qdev->ddev.anon_inode->i_mapping,
-			    qdev->ddev.vma_offset_manager,
-			    false, false);
+			    qdev->ddev.vma_offset_manager);
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index 42281fce552e6e..7d41302c55886d 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -2379,7 +2379,6 @@ struct radeon_device {
 	struct radeon_wb		wb;
 	struct radeon_dummy_page	dummy_page;
 	bool				shutdown;
-	bool				need_swiotlb;
 	bool				accel_working;
 	bool				fastfb_working; /* IGP feature*/
 	bool				needs_reset, in_reset;
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
index cc445c4cba2e3d..3efdb5fb55ad57 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -1385,7 +1385,6 @@ int radeon_device_init(struct radeon_device *rdev,
 		pr_warn("radeon: No suitable DMA available\n");
 		return r;
 	}
-	rdev->need_swiotlb = drm_need_swiotlb(dma_bits);
 
 	/* Registers mapping */
 	/* TODO: block userspace mapping of io register */
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 380b3007fd0b0d..28334f86eaa24a 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -717,9 +717,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
 	/* No others user of address space so set it to 0 */
 	r = ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
 			       rdev->ddev->anon_inode->i_mapping,
-			       rdev->ddev->vma_offset_manager,
-			       rdev->need_swiotlb,
-			       dma_addressing_limited(&rdev->pdev->dev));
+			       rdev->ddev->vma_offset_manager);
 	if (r) {
 		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
 		return r;
diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 510e3e001dabe0..289aab652486ef 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -198,8 +198,6 @@ static void ttm_device_delayed_workqueue(struct work_struct *work)
  * @dev: The core kernel device pointer for DMA mappings and allocations.
  * @mapping: The address space to use for this bo.
  * @vma_manager: A pointer to a vma manager.
- * @use_dma_alloc: If coherent DMA allocation API should be used.
- * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
  *
  * Initializes a struct ttm_device:
  * Returns:
@@ -207,8 +205,7 @@ static void ttm_device_delayed_workqueue(struct work_struct *work)
  */
 int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
-		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32)
+		    struct drm_vma_offset_manager *vma_manager)
 {
 	struct ttm_global *glob = &ttm_glob;
 	int ret;
@@ -223,7 +220,7 @@ int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 	bdev->funcs = funcs;
 
 	ttm_init_sysman(bdev);
-	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
+	ttm_pool_init(&bdev->pool, dev);
 
 	bdev->vma_manager = vma_manager;
 	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index cb38b1a17b0985..51b6585e54470c 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -50,11 +50,10 @@
  * struct ttm_pool_dma - Helper object for coherent DMA mappings
  *
  * @addr: original DMA address returned for the mapping
- * @vaddr: original vaddr return for the mapping and order in the lower bits
  */
 struct ttm_pool_dma {
 	dma_addr_t addr;
-	unsigned long vaddr;
+	unsigned int order;
 };
 
 static unsigned long page_pool_size;
@@ -64,12 +63,6 @@ module_param(page_pool_size, ulong, 0644);
 
 static atomic_long_t allocated_pages;
 
-static struct ttm_pool_type global_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_uncached[MAX_ORDER];
-
-static struct ttm_pool_type global_dma32_write_combined[MAX_ORDER];
-static struct ttm_pool_type global_dma32_uncached[MAX_ORDER];
-
 static struct mutex shrinker_lock;
 static struct list_head shrinker_list;
 static struct shrinker mm_shrinker;
@@ -78,10 +71,8 @@ static struct shrinker mm_shrinker;
 static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 					unsigned int order)
 {
-	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
 	struct page *p;
-	void *vaddr;
 
 	/* Don't set the __GFP_COMP flag for higher order allocations.
 	 * Mapping pages directly into an userspace process and calling
@@ -91,34 +82,16 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 		gfp_flags |= __GFP_NOMEMALLOC | __GFP_NORETRY | __GFP_NOWARN |
 			__GFP_KSWAPD_RECLAIM;
 
-	if (!pool->use_dma_alloc) {
-		p = alloc_pages(gfp_flags, order);
-		if (p)
-			p->private = order;
-		return p;
-	}
-
 	dma = kmalloc(sizeof(*dma), GFP_KERNEL);
 	if (!dma)
 		return NULL;
 
-	if (order)
-		attr |= DMA_ATTR_NO_WARN;
-
-	vaddr = dma_alloc_attrs(pool->dev, (1ULL << order) * PAGE_SIZE,
-				&dma->addr, gfp_flags, attr);
-	if (!vaddr)
+	p = dma_alloc_pages(pool->dev, (1ULL << order) * PAGE_SIZE,
+				&dma->addr, DMA_BIDIRECTIONAL, gfp_flags);
+	if (!p)
 		goto error_free;
 
-	/* TODO: This is an illegal abuse of the DMA API, but we need to rework
-	 * TTM page fault handling and extend the DMA API to clean this up.
-	 */
-	if (is_vmalloc_addr(vaddr))
-		p = vmalloc_to_page(vaddr);
-	else
-		p = virt_to_page(vaddr);
-
-	dma->vaddr = (unsigned long)vaddr | order;
+	dma->order = order;
 	p->private = (unsigned long)dma;
 	return p;
 
@@ -131,9 +104,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
 static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 			       unsigned int order, struct page *p)
 {
-	unsigned long attr = DMA_ATTR_FORCE_CONTIGUOUS;
 	struct ttm_pool_dma *dma;
-	void *vaddr;
 
 #ifdef CONFIG_X86
 	/* We don't care that set_pages_wb is inefficient here. This is only
@@ -143,18 +114,14 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
 		set_pages_wb(p, 1 << order);
 #endif
 
-	if (!pool || !pool->use_dma_alloc) {
+	if (!pool) {
 		__free_pages(p, order);
 		return;
 	}
 
-	if (order)
-		attr |= DMA_ATTR_NO_WARN;
-
 	dma = (void *)p->private;
-	vaddr = (void *)(dma->vaddr & PAGE_MASK);
-	dma_free_attrs(pool->dev, (1UL << order) * PAGE_SIZE, vaddr, dma->addr,
-		       attr);
+	dma_free_pages(pool->dev, (1UL << order) * PAGE_SIZE, p, dma->addr,
+			DMA_BIDIRECTIONAL);
 	kfree(dma);
 }
 
@@ -184,20 +151,12 @@ static int ttm_pool_apply_caching(struct page **first, struct page **last,
 static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
 			struct page *p, dma_addr_t **dma_addr)
 {
-	dma_addr_t addr;
+	struct ttm_pool_dma *dma = (void *)p->private;
+	dma_addr_t addr = dma->addr;
 	unsigned int i;
 
-	if (pool->use_dma_alloc) {
-		struct ttm_pool_dma *dma = (void *)p->private;
-
-		addr = dma->addr;
-	} else {
-		size_t size = (1ULL << order) * PAGE_SIZE;
-
-		addr = dma_map_page(pool->dev, p, 0, size, DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(pool->dev, addr))
-			return -EFAULT;
-	}
+	dma_sync_single_for_device(pool->dev, addr,
+			(1ULL << dma->order) * PAGE_SIZE, DMA_BIDIRECTIONAL);
 
 	for (i = 1 << order; i ; --i) {
 		*(*dma_addr)++ = addr;
@@ -211,12 +170,8 @@ static int ttm_pool_map(struct ttm_pool *pool, unsigned int order,
 static void ttm_pool_unmap(struct ttm_pool *pool, dma_addr_t dma_addr,
 			   unsigned int num_pages)
 {
-	/* Unmapped while freeing the page */
-	if (pool->use_dma_alloc)
-		return;
-
-	dma_unmap_page(pool->dev, dma_addr, (long)num_pages << PAGE_SHIFT,
-		       DMA_BIDIRECTIONAL);
+	dma_sync_single_for_cpu(pool->dev, dma_addr, num_pages * PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 }
 
 /* Give pages into a specific pool_type */
@@ -286,27 +241,7 @@ static struct ttm_pool_type *ttm_pool_select_type(struct ttm_pool *pool,
 						  enum ttm_caching caching,
 						  unsigned int order)
 {
-	if (pool->use_dma_alloc)
-		return &pool->caching[caching].orders[order];
-
-#ifdef CONFIG_X86
-	switch (caching) {
-	case ttm_write_combined:
-		if (pool->use_dma32)
-			return &global_dma32_write_combined[order];
-
-		return &global_write_combined[order];
-	case ttm_uncached:
-		if (pool->use_dma32)
-			return &global_dma32_uncached[order];
-
-		return &global_uncached[order];
-	default:
-		break;
-	}
-#endif
-
-	return NULL;
+	return &pool->caching[caching].orders[order];
 }
 
 /* Free pages using the global shrinker list */
@@ -336,13 +271,9 @@ static unsigned int ttm_pool_shrink(void)
 /* Return the allocation order based for a page */
 static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
 {
-	if (pool->use_dma_alloc) {
-		struct ttm_pool_dma *dma = (void *)p->private;
+	struct ttm_pool_dma *dma = (void *)p->private;
 
-		return dma->vaddr & ~PAGE_MASK;
-	}
-
-	return p->private;
+	return dma->order;
 }
 
 /**
@@ -364,7 +295,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	dma_addr_t *dma_addr = tt->dma_address;
 	struct page **caching = tt->pages;
 	struct page **pages = tt->pages;
-	gfp_t gfp_flags = GFP_USER;
+	gfp_t gfp_flags = GFP_HIGHUSER;
 	unsigned int i, order;
 	struct page *p;
 	int r;
@@ -378,11 +309,6 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 	if (ctx->gfp_retry_mayfail)
 		gfp_flags |= __GFP_RETRY_MAYFAIL;
 
-	if (pool->use_dma32)
-		gfp_flags |= GFP_DMA32;
-	else
-		gfp_flags |= GFP_HIGHUSER;
-
 	for (order = min(MAX_ORDER - 1UL, __fls(num_pages)); num_pages;
 	     order = min_t(unsigned int, order, __fls(num_pages))) {
 		bool apply_caching = false;
@@ -489,28 +415,20 @@ EXPORT_SYMBOL(ttm_pool_free);
  *
  * @pool: the pool to initialize
  * @dev: device for DMA allocations and mappings
- * @use_dma_alloc: true if coherent DMA alloc should be used
- * @use_dma32: true if GFP_DMA32 should be used
  *
  * Initialize the pool and its pool types.
  */
-void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   bool use_dma_alloc, bool use_dma32)
+void ttm_pool_init(struct ttm_pool *pool, struct device *dev)
 {
 	unsigned int i, j;
 
-	WARN_ON(!dev && use_dma_alloc);
+	WARN_ON(!dev);
 
 	pool->dev = dev;
-	pool->use_dma_alloc = use_dma_alloc;
-	pool->use_dma32 = use_dma32;
-
-	if (use_dma_alloc) {
-		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
-				ttm_pool_type_init(&pool->caching[i].orders[j],
-						   pool, i, j);
-	}
+	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
+		for (j = 0; j < MAX_ORDER; ++j)
+			ttm_pool_type_init(&pool->caching[i].orders[j], pool, i,
+					   j);
 }
 
 /**
@@ -525,11 +443,9 @@ void ttm_pool_fini(struct ttm_pool *pool)
 {
 	unsigned int i, j;
 
-	if (pool->use_dma_alloc) {
-		for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
-			for (j = 0; j < MAX_ORDER; ++j)
-				ttm_pool_type_fini(&pool->caching[i].orders[j]);
-	}
+	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i)
+		for (j = 0; j < MAX_ORDER; ++j)
+			ttm_pool_type_fini(&pool->caching[i].orders[j]);
 }
 
 /* As long as pages are available make sure to release at least one */
@@ -603,18 +519,6 @@ static void ttm_pool_debugfs_footer(struct seq_file *m)
 static int ttm_pool_debugfs_globals_show(struct seq_file *m, void *data)
 {
 	ttm_pool_debugfs_header(m);
-
-	mutex_lock(&shrinker_lock);
-	seq_puts(m, "wc\t:");
-	ttm_pool_debugfs_orders(global_write_combined, m);
-	seq_puts(m, "uc\t:");
-	ttm_pool_debugfs_orders(global_uncached, m);
-	seq_puts(m, "wc 32\t:");
-	ttm_pool_debugfs_orders(global_dma32_write_combined, m);
-	seq_puts(m, "uc 32\t:");
-	ttm_pool_debugfs_orders(global_dma32_uncached, m);
-	mutex_unlock(&shrinker_lock);
-
 	ttm_pool_debugfs_footer(m);
 
 	return 0;
@@ -633,11 +537,6 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
 {
 	unsigned int i;
 
-	if (!pool->use_dma_alloc) {
-		seq_puts(m, "unused\n");
-		return 0;
-	}
-
 	ttm_pool_debugfs_header(m);
 
 	mutex_lock(&shrinker_lock);
@@ -688,25 +587,12 @@ DEFINE_SHOW_ATTRIBUTE(ttm_pool_debugfs_shrink);
  */
 int ttm_pool_mgr_init(unsigned long num_pages)
 {
-	unsigned int i;
-
 	if (!page_pool_size)
 		page_pool_size = num_pages;
 
 	mutex_init(&shrinker_lock);
 	INIT_LIST_HEAD(&shrinker_list);
 
-	for (i = 0; i < MAX_ORDER; ++i) {
-		ttm_pool_type_init(&global_write_combined[i], NULL,
-				   ttm_write_combined, i);
-		ttm_pool_type_init(&global_uncached[i], NULL, ttm_uncached, i);
-
-		ttm_pool_type_init(&global_dma32_write_combined[i], NULL,
-				   ttm_write_combined, i);
-		ttm_pool_type_init(&global_dma32_uncached[i], NULL,
-				   ttm_uncached, i);
-	}
-
 #ifdef CONFIG_DEBUG_FS
 	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
 			    &ttm_pool_debugfs_globals_fops);
@@ -727,16 +613,6 @@ int ttm_pool_mgr_init(unsigned long num_pages)
  */
 void ttm_pool_mgr_fini(void)
 {
-	unsigned int i;
-
-	for (i = 0; i < MAX_ORDER; ++i) {
-		ttm_pool_type_fini(&global_write_combined[i]);
-		ttm_pool_type_fini(&global_uncached[i]);
-
-		ttm_pool_type_fini(&global_dma32_write_combined[i]);
-		ttm_pool_type_fini(&global_dma32_uncached[i]);
-	}
-
 	unregister_shrinker(&mm_shrinker);
 	WARN_ON(!list_empty(&shrinker_list));
 }
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index a1a25410ec742d..d8f30ce4c65655 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -51,7 +51,6 @@ MODULE_PARM_DESC(dma32_pages_limit, "Limit for the allocated DMA32 pages");
 module_param_named(dma32_pages_limit, ttm_dma32_pages_limit, ulong, 0644);
 
 static atomic_long_t ttm_pages_allocated;
-static atomic_long_t ttm_dma32_pages_allocated;
 
 /*
  * Allocates a ttm structure for the given BO.
@@ -317,17 +316,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG))
 		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_add(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
-
-	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
-	       atomic_long_read(&ttm_dma32_pages_allocated) >
-	       ttm_dma32_pages_limit) {
 
+	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit) {
 		ret = ttm_global_swapout(ctx, GFP_KERNEL);
 		if (ret == 0)
 			break;
@@ -355,12 +347,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	return 0;
 
 error:
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG))
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_sub(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
 	return ret;
 }
 EXPORT_SYMBOL(ttm_tt_populate);
@@ -390,13 +378,8 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	else
 		ttm_pool_free(&bdev->pool, ttm);
 
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG))
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_sub(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
-
 	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 399f70d340eb5b..0c5783651ae187 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -881,9 +881,7 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
 	ret = ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
 			      dev_priv->drm.dev,
 			      dev_priv->drm.anon_inode->i_mapping,
-			      &dev_priv->vma_manager,
-			      dev_priv->map_mode == vmw_dma_alloc_coherent,
-			      false);
+			      &dev_priv->vma_manager);
 	if (unlikely(ret != 0)) {
 		DRM_ERROR("Failed initializing TTM buffer object driver.\n");
 		goto out_no_bdev;
diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index e9ad4863d91568..c3122588811731 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -38,7 +38,6 @@
 void drm_clflush_pages(struct page *pages[], unsigned long num_pages);
 void drm_clflush_sg(struct sg_table *st);
 void drm_clflush_virt_range(void *addr, unsigned long length);
-bool drm_need_swiotlb(int dma_bits);
 
 
 static inline bool drm_arch_can_wc_memory(void)
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 7c8f87bd52d383..8b5281b982b7da 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -310,8 +310,7 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 
 int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
-		    struct drm_vma_offset_manager *vma_manager,
-		    bool use_dma_alloc, bool use_dma32);
+		    struct drm_vma_offset_manager *vma_manager);
 void ttm_device_fini(struct ttm_device *bdev);
 
 #endif
diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
index 4321728bdd11f8..7c7800c934e272 100644
--- a/include/drm/ttm/ttm_pool.h
+++ b/include/drm/ttm/ttm_pool.h
@@ -60,16 +60,10 @@ struct ttm_pool_type {
 /**
  * ttm_pool - Pool for all caching and orders
  *
- * @use_dma_alloc: if coherent DMA allocations should be used
- * @use_dma32: if GFP_DMA32 should be used
  * @caching: pools for each caching/order
  */
 struct ttm_pool {
 	struct device *dev;
-
-	bool use_dma_alloc;
-	bool use_dma32;
-
 	struct {
 		struct ttm_pool_type orders[MAX_ORDER];
 	} caching[TTM_NUM_CACHING_TYPES];
@@ -79,8 +73,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
 		   struct ttm_operation_ctx *ctx);
 void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt);
 
-void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
-		   bool use_dma_alloc, bool use_dma32);
+void ttm_pool_init(struct ttm_pool *pool, struct device *dev);
 void ttm_pool_fini(struct ttm_pool *pool);
 
 int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
-- 
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
