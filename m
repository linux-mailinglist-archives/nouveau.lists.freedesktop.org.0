Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A025526905F
	for <lists+nouveau@lfdr.de>; Mon, 14 Sep 2020 17:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507D86E508;
	Mon, 14 Sep 2020 15:43:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9255089F49
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RqQGv7rUrofRqLyMSzfEtcHVgVUslC8cDoNR577KrIg=; b=dP3pKRmpC+I0E+dOSbraRXJ35X
 3haQwB40uPuLpGR5zn67wQbMCYeYUDIDCnlsB5tNCLi9vaoDWIjbKg2ty0ncKAbUYHiAWQ1Gwe4T2
 /L1d3ii2rUMCke8WZymWHb2tl/HocPOnGFPqgOwVy0kntsQ5+2r+a5DBRhRIc7Qwt5AhJHft+rUwc
 cUuL4BH3aNOU3nrCkiiuv/cztMGgjnYHVBqE36sUV2hPE4iUig7eK9l316jWvenjHMhEIQ2Nevj2v
 NzaWOE2Dnmj9Uqr/OYUKSLadMvLX2JkZjrKxFODSeBkgfvxBjLKXD/2ClVZgj/x7V7GdULKR4vyHX
 B3N9jL+g==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqAB-0003UL-04; Mon, 14 Sep 2020 15:13:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Date: Mon, 14 Sep 2020 16:44:28 +0200
Message-Id: <20200914144433.1622958-13-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Mon, 14 Sep 2020 15:43:42 +0000
Subject: [Nouveau] [PATCH 12/17] 53c700: convert to dma_alloc_noncoherent
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use the new non-coherent DMA API including proper ownership transfers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/53c700.c | 11 +++++++++--
 drivers/scsi/53c700.h | 16 ++++++++--------
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 9a343f8ecb6c3e..5117d90ccd9edf 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -269,18 +269,25 @@ NCR_700_get_SXFER(struct scsi_device *SDp)
 					      spi_period(SDp->sdev_target));
 }
 
+static inline dma_addr_t virt_to_dma(struct NCR_700_Host_Parameters *h, void *p)
+{
+	return h->pScript + ((uintptr_t)p - (uintptr_t)h->script);
+}
+
 static inline void dma_sync_to_dev(struct NCR_700_Host_Parameters *h,
 		void *addr, size_t size)
 {
 	if (h->noncoherent)
-		dma_cache_sync(h->dev, addr, size, DMA_TO_DEVICE);
+		dma_sync_single_for_device(h->dev, virt_to_dma(h, addr),
+					   size, DMA_BIDIRECTIONAL);
 }
 
 static inline void dma_sync_from_dev(struct NCR_700_Host_Parameters *h,
 		void *addr, size_t size)
 {
 	if (h->noncoherent)
-		dma_cache_sync(h->dev, addr, size, DMA_FROM_DEVICE);
+		dma_sync_single_for_device(h->dev, virt_to_dma(h, addr), size,
+					   DMA_BIDIRECTIONAL);
 }
 
 struct Scsi_Host *
diff --git a/drivers/scsi/53c700.h b/drivers/scsi/53c700.h
index 0f545b05fe611d..c9f8c497babb3d 100644
--- a/drivers/scsi/53c700.h
+++ b/drivers/scsi/53c700.h
@@ -423,33 +423,33 @@ struct NCR_700_Host_Parameters {
 #define NCR_710_MIN_XFERP	0
 #define NCR_700_MIN_PERIOD	25 /* for SDTR message, 100ns */
 
-#define script_patch_32(dev, script, symbol, value) \
+#define script_patch_32(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		__u32 val = bS_to_cpu((script)[A_##symbol##_used[i]]) + da; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
-#define script_patch_32_abs(dev, script, symbol, value) \
+#define script_patch_32_abs(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		(script)[A_##symbol##_used[i]] = bS_to_host(da); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
 /* Used for patching the SCSI ID in the SELECT instruction */
-#define script_patch_ID(dev, script, symbol, value) \
+#define script_patch_ID(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -457,13 +457,13 @@ struct NCR_700_Host_Parameters {
 		val &= 0xff00ffff; \
 		val |= ((value) & 0xff) << 16; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching ID field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
 }
 
-#define script_patch_16(dev, script, symbol, value) \
+#define script_patch_16(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -471,7 +471,7 @@ struct NCR_700_Host_Parameters {
 		val &= 0xffff0000; \
 		val |= ((value) & 0xffff); \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_sync_to_dev((dev), &(script)[A_##symbol##_used[i]], 4); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching short field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
