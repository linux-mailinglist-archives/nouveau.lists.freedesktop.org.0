Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37924249CB9
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 13:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E466B6E2E2;
	Wed, 19 Aug 2020 11:52:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD6D6E1C4
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=t/kUI/553mQLkPn2YstRQ1uK7QcbAe6EXdXOlcFiX/o=; b=B+Kbvqduoiia1ONSXw50+AAvII
 SDCx6Q5i1wD1ezj1lsE/JQF3YbqSMgFxv6KOUYJxjYqh+96u7plrV+/YdrNpz8WDFhQW1S4H5Srxd
 /svckscBzNBWdiFRGXc2AbTzAzlrdpesdCvrY46aj8wx3UqzriA+qG5PDFJHIufcy2Szc07uAzFjB
 A9bjJtEhAaOU0mBzU+YkTgw4yRv/Y0j0IVpmaClidPQq8MFJqjPcXNDdKkAEO/BSDZFQ9pgQ7EfIo
 NG5HP1xs9rulYgK4ERUivl4xbpNxfSmTYqP8Uxwxc0Fm5HhzEwUo1cHA/Is6oiJmP0q5bUvgMU50R
 pqfWn1Xg==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I16-0008NH-FO; Wed, 19 Aug 2020 06:56:12 +0000
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
Date: Wed, 19 Aug 2020 08:55:35 +0200
Message-Id: <20200819065555.1802761-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:52:18 +0000
Subject: [Nouveau] [PATCH 08/28] MIPS: make dma_sync_*_for_cpu a little less
 overzealous
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

When transferring DMA ownership back to the CPU there should never
be any writeback from the cache, as the buffer was owned by the
device until now.  Instead it should just be invalidated for the
mapping directions where the device could have written data.
Note that the changes rely on the fact that kmap_atomic is stubbed
out for the !HIGHMEM case to simplify the code a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/mm/dma-noncoherent.c | 44 +++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 563c2c0d0c8193..97a14adbafc99c 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -55,22 +55,34 @@ void *arch_dma_set_uncached(void *addr, size_t size)
 	return (void *)(__pa(addr) + UNCAC_BASE);
 }
 
-static inline void dma_sync_virt(void *addr, size_t size,
+static inline void dma_sync_virt_for_device(void *addr, size_t size,
 		enum dma_data_direction dir)
 {
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		dma_cache_wback((unsigned long)addr, size);
 		break;
-
 	case DMA_FROM_DEVICE:
 		dma_cache_inv((unsigned long)addr, size);
 		break;
-
 	case DMA_BIDIRECTIONAL:
 		dma_cache_wback_inv((unsigned long)addr, size);
 		break;
+	default:
+		BUG();
+	}
+}
 
+static inline void dma_sync_virt_for_cpu(void *addr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		dma_cache_inv((unsigned long)addr, size);
+		break;
 	default:
 		BUG();
 	}
@@ -82,7 +94,7 @@ static inline void dma_sync_virt(void *addr, size_t size,
  * configured then the bulk of this loop gets optimized out.
  */
 static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+		enum dma_data_direction dir, bool for_device)
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned long offset = paddr & ~PAGE_MASK;
@@ -90,18 +102,20 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 
 	do {
 		size_t len = left;
+		void *addr;
 
 		if (PageHighMem(page)) {
-			void *addr;
-
 			if (offset + len > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
+		}
+
+		addr = kmap_atomic(page);
+		if (for_device)
+			dma_sync_virt_for_device(addr + offset, len, dir);
+		else
+			dma_sync_virt_for_cpu(addr + offset, len, dir);
+		kunmap_atomic(addr);
 
-			addr = kmap_atomic(page);
-			dma_sync_virt(addr + offset, len, dir);
-			kunmap_atomic(addr);
-		} else
-			dma_sync_virt(page_address(page) + offset, size, dir);
 		offset = 0;
 		page++;
 		left -= len;
@@ -111,7 +125,7 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_sync_phys(paddr, size, dir);
+	dma_sync_phys(paddr, size, dir, true);
 }
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
@@ -119,16 +133,14 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	if (cpu_needs_post_dma_flush())
-		dma_sync_phys(paddr, size, dir);
+		dma_sync_phys(paddr, size, dir, false);
 }
 #endif
 
 void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
 		enum dma_data_direction direction)
 {
-	BUG_ON(direction == DMA_NONE);
-
-	dma_sync_virt(vaddr, size, direction);
+	dma_sync_virt_for_device(vaddr, size, direction);
 }
 
 #ifdef CONFIG_DMA_PERDEV_COHERENT
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
