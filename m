Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C21249CB6
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 13:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0A16E2DE;
	Wed, 19 Aug 2020 11:52:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1279A6E1F1
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rHSBc/M4bEuOb9Ey0sWSjsN3haNI1yyBuzSqz9ajJzQ=; b=YVejIXY46cjbXnB7HRS7QdyGN0
 rzYUMX3LQCwvbmHC6T4MNtkWhsUIW62+JBnb7nbIi53asopN5O5j8LI/TbrhrTaXhtiNUiNct2i3P
 uk78NGgvVuH/tDXGWfzr1c9ZKALeWVaYgQZxSkrFbZjeARGsdjhRaPBOVTI+9S7YkW4DyKTwu4Eqe
 ZdL5pVD9fQZA45Mvfyz4KprhJJxEFgphsAyBLur+DYrJO9et6FfP1sA4FfkqSOmHH6fYKJ008ANQP
 L//Kb+0DzBCMDP/39KncfO9EvWWgJ3EUkh1q6MV+AfG2SnJA6QEX6d4EDY7nkSU2dHdJADBMSZjm1
 dYYyAX3Q==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I1U-0008Ra-0J; Wed, 19 Aug 2020 06:56:36 +0000
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
Date: Wed, 19 Aug 2020 08:55:45 +0200
Message-Id: <20200819065555.1802761-19-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:52:18 +0000
Subject: [Nouveau] [PATCH 18/28] dma-mapping: move the
 dma_declare_coherent_memory documentation
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

dma_declare_coherent_memory should not be in a DMA API guide aimed
at driver writers (that is consumers of the API).  Move it to a comment
near the function instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/core-api/dma-api.rst | 24 ------------------------
 kernel/dma/coherent.c              | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
index 3b3abbbb4b9a6f..90239348b30f6f 100644
--- a/Documentation/core-api/dma-api.rst
+++ b/Documentation/core-api/dma-api.rst
@@ -586,30 +586,6 @@ the DMA_ATTR_NON_CONSISTENT flag starting at virtual address vaddr and
 continuing on for size.  Again, you *must* observe the cache line
 boundaries when doing this.
 
-::
-
-	int
-	dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
-				    dma_addr_t device_addr, size_t size);
-
-Declare region of memory to be handed out by dma_alloc_coherent() when
-it's asked for coherent memory for this device.
-
-phys_addr is the CPU physical address to which the memory is currently
-assigned (this will be ioremapped so the CPU can access the region).
-
-device_addr is the DMA address the device needs to be programmed
-with to actually address this memory (this will be handed out as the
-dma_addr_t in dma_alloc_coherent()).
-
-size is the size of the area (must be multiples of PAGE_SIZE).
-
-As a simplification for the platforms, only *one* such region of
-memory may be declared per device.
-
-For reasons of efficiency, most platforms choose to track the declared
-region only at the granularity of a page.  For smaller allocations,
-you should use the dma_pool() API.
 
 Part III - Debug drivers use of the DMA-API
 -------------------------------------------
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 2a0c4985f38e41..f85d14bbfcbe03 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -107,6 +107,23 @@ static int dma_assign_coherent_memory(struct device *dev,
 	return 0;
 }
 
+/*
+ * Declare a region of memory to be handed out by dma_alloc_coherent() when it
+ * is asked for coherent memory for this device.  This shall only be used
+ * from platform code, usually based on the device tree description.
+ * 
+ * phys_addr is the CPU physical address to which the memory is currently
+ * assigned (this will be ioremapped so the CPU can access the region).
+ *
+ * device_addr is the DMA address the device needs to be programmed with to
+ * actually address this memory (this will be handed out as the dma_addr_t in
+ * dma_alloc_coherent()).
+ *
+ * size is the size of the area (must be a multiple of PAGE_SIZE).
+ *
+ * As a simplification for the platforms, only *one* such region of memory may
+ * be declared per device.
+ */
 int dma_declare_coherent_memory(struct device *dev, phys_addr_t phys_addr,
 				dma_addr_t device_addr, size_t size)
 {
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
