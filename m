Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75788249C99
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 13:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A617B6E25F;
	Wed, 19 Aug 2020 11:52:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92AAD6E1D7
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lNMBC694MGzhD+uJcSmWDHi7UPoDvxCv6DsPxBphUDM=; b=hvsEVEvLhFqVJsYwQI9fVfL5lp
 KW/X5c84TRVEWiCq+JWY6sNEc2oPPEGv+njCJOloQQfIY5LUVW8trunjunigerqOpw/bNuW3d15Nk
 KgKieclLAYJPG4mvEkrbXHTLSkS3oIM/sohwRcqd7QHlpj3mv/N3/MXfm3eBRP5C0/LNJ5ouorMBE
 EFFTa7MVts6kBXsmWo/w+5Hd0w5Fe84gvTgCYwvRXDgUbWV9izyuuyq+19e30v6LdcypJRbfFaF/y
 BVzr8sMb9JqE5r5zxB/kHyoI/WzgowY0Vk+Xyd6UQArjHPMonvBv0ewspWNMbu/2jhayLSYkMZBFZ
 7BeuNtag==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1v-00007x-Sa; Wed, 19 Aug 2020 06:57:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Pawel Osciak <pawel@osciak.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Date: Wed, 19 Aug 2020 08:55:55 +0200
Message-Id: <20200819065555.1802761-29-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:52:18 +0000
Subject: [Nouveau] [PATCH 28/28] nvme-pci: use dma_alloc_pages backed
 dmapools
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Switch from coherent DMA pools to those backed by dma_alloc_pages.  This
helps device with non-coherent DMA to avoid host accesses to uncached
memory for every submission of a larger than single entry I/O.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 80 ++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index a33adab62acbaf..fb34dbcb973673 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -114,8 +114,8 @@ struct nvme_dev {
 	struct blk_mq_tag_set admin_tagset;
 	u32 __iomem *dbs;
 	struct device *dev;
-	struct dma_pool *prp_page_pool;
-	struct dma_pool *prp_small_pool;
+	struct dma_pool prp_page_pool;
+	struct dma_pool prp_small_pool;
 	unsigned online_queues;
 	unsigned max_qid;
 	unsigned io_queues[HCTX_MAX_TYPES];
@@ -536,7 +536,7 @@ static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
 
 
 	if (iod->npages == 0)
-		dma_pool_free(dev->prp_small_pool, nvme_pci_iod_list(req)[0],
+		dma_pool_free(&dev->prp_small_pool, nvme_pci_iod_list(req)[0],
 			dma_addr);
 
 	for (i = 0; i < iod->npages; i++) {
@@ -553,7 +553,7 @@ static void nvme_unmap_data(struct nvme_dev *dev, struct request *req)
 			next_dma_addr = le64_to_cpu(prp_list[last_prp]);
 		}
 
-		dma_pool_free(dev->prp_page_pool, addr, dma_addr);
+		dma_pool_free(&dev->prp_page_pool, addr, dma_addr);
 		dma_addr = next_dma_addr;
 	}
 
@@ -611,10 +611,10 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 
 	nprps = DIV_ROUND_UP(length, NVME_CTRL_PAGE_SIZE);
 	if (nprps <= (256 / 8)) {
-		pool = dev->prp_small_pool;
+		pool = &dev->prp_small_pool;
 		iod->npages = 0;
 	} else {
-		pool = dev->prp_page_pool;
+		pool = &dev->prp_page_pool;
 		iod->npages = 1;
 	}
 
@@ -630,6 +630,11 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 	for (;;) {
 		if (i == NVME_CTRL_PAGE_SIZE >> 3) {
 			__le64 *old_prp_list = prp_list;
+
+			dma_sync_single_for_device(dev->dev, prp_dma,
+						   i * sizeof(*prp_list),
+						   DMA_TO_DEVICE);
+
 			prp_list = dma_pool_alloc(pool, GFP_ATOMIC, &prp_dma);
 			if (!prp_list)
 				return BLK_STS_RESOURCE;
@@ -653,6 +658,8 @@ static blk_status_t nvme_pci_setup_prps(struct nvme_dev *dev,
 		dma_len = sg_dma_len(sg);
 	}
 
+	dma_sync_single_for_device(dev->dev, prp_dma, i * sizeof(*prp_list),
+				   DMA_TO_DEVICE);
 done:
 	cmnd->dptr.prp1 = cpu_to_le64(sg_dma_address(iod->sg));
 	cmnd->dptr.prp2 = cpu_to_le64(iod->first_dma);
@@ -706,10 +713,10 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 	}
 
 	if (entries <= (256 / sizeof(struct nvme_sgl_desc))) {
-		pool = dev->prp_small_pool;
+		pool = &dev->prp_small_pool;
 		iod->npages = 0;
 	} else {
-		pool = dev->prp_page_pool;
+		pool = &dev->prp_page_pool;
 		iod->npages = 1;
 	}
 
@@ -728,6 +735,10 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 		if (i == SGES_PER_PAGE) {
 			struct nvme_sgl_desc *old_sg_desc = sg_list;
 			struct nvme_sgl_desc *link = &old_sg_desc[i - 1];
+	
+			dma_sync_single_for_device(dev->dev, sgl_dma,
+						   i * sizeof(*sg_list),
+						   DMA_TO_DEVICE);
 
 			sg_list = dma_pool_alloc(pool, GFP_ATOMIC, &sgl_dma);
 			if (!sg_list)
@@ -743,6 +754,8 @@ static blk_status_t nvme_pci_setup_sgls(struct nvme_dev *dev,
 		sg = sg_next(sg);
 	} while (--entries > 0);
 
+	dma_sync_single_for_device(dev->dev, sgl_dma, i * sizeof(*sg_list),
+				   DMA_TO_DEVICE);
 	return BLK_STS_OK;
 }
 
@@ -2457,30 +2470,6 @@ static int nvme_disable_prepare_reset(struct nvme_dev *dev, bool shutdown)
 	return 0;
 }
 
-static int nvme_setup_prp_pools(struct nvme_dev *dev)
-{
-	dev->prp_page_pool = dma_pool_create("prp list page", dev->dev,
-						NVME_CTRL_PAGE_SIZE,
-						NVME_CTRL_PAGE_SIZE, 0);
-	if (!dev->prp_page_pool)
-		return -ENOMEM;
-
-	/* Optimisation for I/Os between 4k and 128k */
-	dev->prp_small_pool = dma_pool_create("prp list 256", dev->dev,
-						256, 256, 0);
-	if (!dev->prp_small_pool) {
-		dma_pool_destroy(dev->prp_page_pool);
-		return -ENOMEM;
-	}
-	return 0;
-}
-
-static void nvme_release_prp_pools(struct nvme_dev *dev)
-{
-	dma_pool_destroy(dev->prp_page_pool);
-	dma_pool_destroy(dev->prp_small_pool);
-}
-
 static void nvme_free_tagset(struct nvme_dev *dev)
 {
 	if (dev->tagset.tags)
@@ -2851,10 +2840,6 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	INIT_WORK(&dev->remove_work, nvme_remove_dead_ctrl_work);
 	mutex_init(&dev->shutdown_lock);
 
-	result = nvme_setup_prp_pools(dev);
-	if (result)
-		goto unmap;
-
 	quirks |= check_vendor_combination_bug(pdev);
 
 	if (!noacpi && nvme_acpi_storage_d3(pdev)) {
@@ -2867,6 +2852,18 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		quirks |= NVME_QUIRK_SIMPLE_SUSPEND;
 	}
 
+	result = dma_pool_init(dev->dev, &dev->prp_page_pool, "prp list page",
+			NVME_CTRL_PAGE_SIZE, NVME_CTRL_PAGE_SIZE, 0,
+			DMA_TO_DEVICE);
+	if (result)
+		goto unmap;
+
+	/* Optimisation for I/Os between 4k and 128k */
+	result = dma_pool_init(dev->dev, &dev->prp_small_pool, "prp list 256",
+			256, 256, 0, DMA_TO_DEVICE);
+	if (result)
+		goto release_prp_page_pool;
+
 	/*
 	 * Double check that our mempool alloc size will cover the biggest
 	 * command we support.
@@ -2880,7 +2877,7 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 						GFP_KERNEL, node);
 	if (!dev->iod_mempool) {
 		result = -ENOMEM;
-		goto release_pools;
+		goto release_prp_small_pool;
 	}
 
 	result = nvme_init_ctrl(&dev->ctrl, &pdev->dev, &nvme_pci_ctrl_ops,
@@ -2897,8 +2894,10 @@ static int nvme_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
  release_mempool:
 	mempool_destroy(dev->iod_mempool);
- release_pools:
-	nvme_release_prp_pools(dev);
+ release_prp_small_pool:
+	dma_pool_exit(&dev->prp_small_pool);
+ release_prp_page_pool:
+	dma_pool_exit(&dev->prp_page_pool);
  unmap:
 	nvme_dev_unmap(dev);
  put_pci:
@@ -2963,7 +2962,8 @@ static void nvme_remove(struct pci_dev *pdev)
 	nvme_free_host_mem(dev);
 	nvme_dev_remove_admin(dev);
 	nvme_free_queues(dev, 0);
-	nvme_release_prp_pools(dev);
+	dma_pool_exit(&dev->prp_small_pool);
+	dma_pool_exit(&dev->prp_page_pool);
 	nvme_dev_unmap(dev);
 	nvme_uninit_ctrl(&dev->ctrl);
 }
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
