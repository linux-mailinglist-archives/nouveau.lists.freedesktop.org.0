Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57200249C9A
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 13:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68046E261;
	Wed, 19 Aug 2020 11:52:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74BB36E1A3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 06:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5I0Wekw7PGkNV3dZaIEsA8c8Eplwzl97xo8vYosQxdI=; b=UdYV4uHpyw9x3F5rwAWsVUPFE0
 Hqm02Lgcb3b7szXHtRYFh2Q2mQ0XgXJIRXZnNarHY8BTFPY/yfILYo9XBcRi7QMB28ipLhHbeYlLZ
 mACjmpKK8MPjiLf3dQYi0vBMkZJd/+MdUBQ3P1z7bbLGarn+eG74rMpDjApvZcefIfvlujyIZSqxu
 wHrDyEJGotoW7dL28Oiu4mTNTADO4SZxq3ID/xa3uKrXpchLC5U0otmEnB0C95mcVGd+TWrgeSorS
 YoshIRrHigr4PRqKUustXCWc2qvmN6xs6AZEOX38KVFTfpoTISa6SdfuLtcuYFCOYm/EHyRiUeiPJ
 oIt3VQVw==;
Received: from [2001:4bb8:198:f3b2:86b6:2277:f429:37a1] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8I0x-0008LJ-Vp; Wed, 19 Aug 2020 06:56:04 +0000
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
Date: Wed, 19 Aug 2020 08:55:31 +0200
Message-Id: <20200819065555.1802761-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200819065555.1802761-1-hch@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 19 Aug 2020 11:52:18 +0000
Subject: [Nouveau] [PATCH 04/28] net/au1000-eth: stop using
 DMA_ATTR_NON_CONSISTENT
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

The au1000-eth driver contains none of the manual cache synchronization
required for using DMA_ATTR_NON_CONSISTENT.  From what I can tell it
can be used on both dma coherent and non-coherent DMA platforms, but
I suspect it has been buggy on the non-coherent platforms all along.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/amd/au1000_eth.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 75dbd221dc594b..19e195420e2434 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1131,10 +1131,9 @@ static int au1000_probe(struct platform_device *pdev)
 	/* Allocate the data buffers
 	 * Snooping works fine with eth on all au1xxx
 	 */
-	aup->vaddr = (u32)dma_alloc_attrs(&pdev->dev, MAX_BUF_SIZE *
+	aup->vaddr = (u32)dma_alloc_coherent(&pdev->dev, MAX_BUF_SIZE *
 					  (NUM_TX_BUFFS + NUM_RX_BUFFS),
-					  &aup->dma_addr, 0,
-					  DMA_ATTR_NON_CONSISTENT);
+					  &aup->dma_addr, 0);
 	if (!aup->vaddr) {
 		dev_err(&pdev->dev, "failed to allocate data buffers\n");
 		err = -ENOMEM;
@@ -1310,9 +1309,8 @@ static int au1000_probe(struct platform_device *pdev)
 err_remap2:
 	iounmap(aup->mac);
 err_remap1:
-	dma_free_attrs(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
-			(void *)aup->vaddr, aup->dma_addr,
-			DMA_ATTR_NON_CONSISTENT);
+	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
+			(void *)aup->vaddr, aup->dma_addr);
 err_vaddr:
 	free_netdev(dev);
 err_alloc:
@@ -1344,9 +1342,8 @@ static int au1000_remove(struct platform_device *pdev)
 		if (aup->tx_db_inuse[i])
 			au1000_ReleaseDB(aup, aup->tx_db_inuse[i]);
 
-	dma_free_attrs(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
-			(void *)aup->vaddr, aup->dma_addr,
-			DMA_ATTR_NON_CONSISTENT);
+	dma_free_coherent(&pdev->dev, MAX_BUF_SIZE * (NUM_TX_BUFFS + NUM_RX_BUFFS),
+			(void *)aup->vaddr, aup->dma_addr);
 
 	iounmap(aup->macdma);
 	iounmap(aup->mac);
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
