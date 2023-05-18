Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF52708301
	for <lists+nouveau@lfdr.de>; Thu, 18 May 2023 15:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997C610E52E;
	Thu, 18 May 2023 13:43:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31A810E0B6
 for <nouveau@lists.freedesktop.org>; Thu, 18 May 2023 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=0qIa3nDGH6TUOBAqJwF2s8Hp3AbyQ3Z9bxsITaMukWA=; b=pbfDTeq5MMRbhVEH4CcdLdnaIl
 cLan6u3lCSEqM4f7q8nJqZieDbhwOHHwFhSmsXM+2qxYj6DG3yMd0HOMjR58sstguuZ77BU9YJPyF
 Gq2BxiI4p9KIc19qV7MrhjjquWR8DTa68qrZBvDpK4lspAF2bcFqXQFEGH/ctEOaYlz0ydULrznJu
 fTKWdqL1KcqMzgW8IWNlqgjkpiSonSU/N02Ryto3srwkIe5afJY4CG3YrCwULl9ZWmNuF8if5C7Pj
 f+9G6D6Evcs7iO6Gx1cZhk6B1nbfBHfS3KpZeNIVDKkj5akOhZyeVSrW5OgkXWV06WpKhlDx7WvLX
 bin8x6rQ==;
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduK-00D6SB-1r; Thu, 18 May 2023 13:43:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Date: Thu, 18 May 2023 15:42:52 +0200
Message-Id: <20230518134253.909623-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518134253.909623-1-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Nouveau] [PATCH 3/4] drm/nouveau: stop using is_swiotlb_active
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Drivers have no business looking into dma-mapping internals and check
what backend is used.  Unfortunstely the DRM core is still broken and
tries to do plain page allocations instead of using DMA API allocators
by default and uses various bandaids on when to use dma_alloc_coherent.

Switch nouveau to use the same (broken) scheme as amdgpu and radeon
to remove the last driver user of is_swiotlb_active.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 1469a88910e45d..486f39f31a38df 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -24,9 +24,9 @@
  */
 
 #include <linux/limits.h>
-#include <linux/swiotlb.h>
 
 #include <drm/ttm/ttm_range_manager.h>
+#include <drm/drm_cache.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_gem.h"
@@ -265,7 +265,6 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	struct nvkm_pci *pci = device->pci;
 	struct nvif_mmu *mmu = &drm->client.mmu;
 	struct drm_device *dev = drm->dev;
-	bool need_swiotlb = false;
 	int typei, ret;
 
 	ret = nouveau_ttm_init_host(drm, 0);
@@ -300,13 +299,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 		drm->agp.cma = pci->agp.cma;
 	}
 
-#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
-	need_swiotlb = is_swiotlb_active(dev->dev);
-#endif
-
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
 				  dev->anon_inode->i_mapping,
-				  dev->vma_offset_manager, need_swiotlb,
+				  dev->vma_offset_manager,
+				  drm_need_swiotlb(drm->client.mmu.dmabits),
 				  drm->client.mmu.dmabits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
-- 
2.39.2

