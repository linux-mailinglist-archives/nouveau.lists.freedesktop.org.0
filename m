Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE3426B9EA
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5760C6E97E;
	Wed, 16 Sep 2020 02:22:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D53B6E11B
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YyUYJJvCAvZ+Ejy09p/bfqb5Ir+B3+nId2ZgsdVDN6s=; b=lTlWz6dY2/M2EtVz4ZyqbMyvxc
 CO32EPAbfoFEB7TEOcfVHb6ewtzIV93i/6CDOBHysyXd7KnLCBuxRbg1wpCUqS6963tMaP4NLDKIU
 aqEcM6i+1GSMqZAhZU8hdQodIqDfecSvdFQM3TmuH9ZUZt6R3MQPpatMCAHAnXiocKwXsbpJ0LECq
 l629t+qjp80PU0ra0t+w/sq5O1BwCWbpktibS3BPRKrC7+4H8BnD71J8TpGlJKRcWPP5TJkgchvzW
 +51/TGzfRwH+Rc2cvjYRJFbk2vrbsuQ/bvr2SWuB+a7o7pujwDgXe/yi34kTPTsFQBeE8xiqauzvt
 lfgEH6Ng==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDeB-00054b-NE; Tue, 15 Sep 2020 16:17:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Date: Tue, 15 Sep 2020 17:51:15 +0200
Message-Id: <20200915155122.1768241-12-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915155122.1768241-1-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
Subject: [Nouveau] [PATCH 11/18] lib82596: convert to dma_alloc_noncoherent
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
This includes moving the DMA helpers to lib82596 based of an ifdef to
avoid include order problems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/i825xx/lasi_82596.c |  25 ++---
 drivers/net/ethernet/i825xx/lib82596.c   | 114 ++++++++++++++---------
 drivers/net/ethernet/i825xx/sni_82596.c  |   4 -
 3 files changed, 80 insertions(+), 63 deletions(-)

diff --git a/drivers/net/ethernet/i825xx/lasi_82596.c b/drivers/net/ethernet/i825xx/lasi_82596.c
index a12218e940a2fa..96c6f4f36904ed 100644
--- a/drivers/net/ethernet/i825xx/lasi_82596.c
+++ b/drivers/net/ethernet/i825xx/lasi_82596.c
@@ -96,21 +96,14 @@
 
 #define OPT_SWAP_PORT	0x0001	/* Need to wordswp on the MPU port */
 
-#define DMA_WBACK(ndev, addr, len) \
-	do { dma_cache_sync((ndev)->dev.parent, (void *)addr, len, DMA_TO_DEVICE); } while (0)
-
-#define DMA_INV(ndev, addr, len) \
-	do { dma_cache_sync((ndev)->dev.parent, (void *)addr, len, DMA_FROM_DEVICE); } while (0)
-
-#define DMA_WBACK_INV(ndev, addr, len) \
-	do { dma_cache_sync((ndev)->dev.parent, (void *)addr, len, DMA_BIDIRECTIONAL); } while (0)
-
 #define SYSBUS      0x0000006c
 
 /* big endian CPU, 82596 "big" endian mode */
 #define SWAP32(x)   (((u32)(x)<<16) | ((((u32)(x)))>>16))
 #define SWAP16(x)   (x)
 
+#define NONCOHERENT_DMA 1
+
 #include "lib82596.c"
 
 MODULE_AUTHOR("Richard Hirst");
@@ -184,9 +177,9 @@ lan_init_chip(struct parisc_device *dev)
 
 	lp = netdev_priv(netdevice);
 	lp->options = dev->id.sversion == 0x72 ? OPT_SWAP_PORT : 0;
-	lp->dma = dma_alloc_attrs(&dev->dev, sizeof(struct i596_dma),
-			      &lp->dma_addr, GFP_KERNEL,
-			      DMA_ATTR_NON_CONSISTENT);
+	lp->dma = dma_alloc_noncoherent(&dev->dev,
+			sizeof(struct i596_dma), &lp->dma_addr,
+			DMA_BIDIRECTIONAL, GFP_KERNEL);
 	if (!lp->dma)
 		goto out_free_netdev;
 
@@ -196,8 +189,8 @@ lan_init_chip(struct parisc_device *dev)
 	return 0;
 
 out_free_dma:
-	dma_free_attrs(&dev->dev, sizeof(struct i596_dma), lp->dma,
-			lp->dma_addr, DMA_ATTR_NON_CONSISTENT);
+	dma_free_noncoherent(&dev->dev, sizeof(struct i596_dma),
+		       lp->dma, lp->dma_addr, DMA_BIDIRECTIONAL);
 out_free_netdev:
 	free_netdev(netdevice);
 	return retval;
@@ -209,8 +202,8 @@ static int __exit lan_remove_chip(struct parisc_device *pdev)
 	struct i596_private *lp = netdev_priv(dev);
 
 	unregister_netdev (dev);
-	dma_free_attrs(&pdev->dev, sizeof(struct i596_private), lp->dma,
-		       lp->dma_addr, DMA_ATTR_NON_CONSISTENT);
+	dma_free_noncoherent(&pdev->dev, sizeof(struct i596_private), lp->dma,
+		       lp->dma_addr, DMA_BIDIRECTIONAL);
 	free_netdev (dev);
 	return 0;
 }
diff --git a/drivers/net/ethernet/i825xx/lib82596.c b/drivers/net/ethernet/i825xx/lib82596.c
index b4e4b3eb5758b5..ca2fb303fcc6f6 100644
--- a/drivers/net/ethernet/i825xx/lib82596.c
+++ b/drivers/net/ethernet/i825xx/lib82596.c
@@ -365,13 +365,44 @@ static int max_cmd_backlog = TX_RING_SIZE-1;
 static void i596_poll_controller(struct net_device *dev);
 #endif
 
+static inline dma_addr_t virt_to_dma(struct i596_private *lp, volatile void *v)
+{
+	return lp->dma_addr + ((unsigned long)v - (unsigned long)lp->dma);
+}
+
+#ifdef NONCOHERENT_DMA
+static inline void dma_sync_dev(struct net_device *ndev, volatile void *addr,
+		size_t len)
+{
+	dma_sync_single_for_device(ndev->dev.parent,
+			virt_to_dma(netdev_priv(ndev), addr), len,
+			DMA_BIDIRECTIONAL);
+}
+
+static inline void dma_sync_cpu(struct net_device *ndev, volatile void *addr,
+		size_t len)
+{
+	dma_sync_single_for_cpu(ndev->dev.parent,
+			virt_to_dma(netdev_priv(ndev), addr), len,
+			DMA_BIDIRECTIONAL);
+}
+#else
+static inline void dma_sync_dev(struct net_device *ndev, volatile void *addr,
+		size_t len)
+{
+}
+static inline void dma_sync_cpu(struct net_device *ndev, volatile void *addr,
+		size_t len)
+{
+}
+#endif /* NONCOHERENT_DMA */
 
 static inline int wait_istat(struct net_device *dev, struct i596_dma *dma, int delcnt, char *str)
 {
-	DMA_INV(dev, &(dma->iscp), sizeof(struct i596_iscp));
+	dma_sync_cpu(dev, &(dma->iscp), sizeof(struct i596_iscp));
 	while (--delcnt && dma->iscp.stat) {
 		udelay(10);
-		DMA_INV(dev, &(dma->iscp), sizeof(struct i596_iscp));
+		dma_sync_cpu(dev, &(dma->iscp), sizeof(struct i596_iscp));
 	}
 	if (!delcnt) {
 		printk(KERN_ERR "%s: %s, iscp.stat %04x, didn't clear\n",
@@ -384,10 +415,10 @@ static inline int wait_istat(struct net_device *dev, struct i596_dma *dma, int d
 
 static inline int wait_cmd(struct net_device *dev, struct i596_dma *dma, int delcnt, char *str)
 {
-	DMA_INV(dev, &(dma->scb), sizeof(struct i596_scb));
+	dma_sync_cpu(dev, &(dma->scb), sizeof(struct i596_scb));
 	while (--delcnt && dma->scb.command) {
 		udelay(10);
-		DMA_INV(dev, &(dma->scb), sizeof(struct i596_scb));
+		dma_sync_cpu(dev, &(dma->scb), sizeof(struct i596_scb));
 	}
 	if (!delcnt) {
 		printk(KERN_ERR "%s: %s, status %4.4x, cmd %4.4x.\n",
@@ -451,12 +482,9 @@ static void i596_display_data(struct net_device *dev)
 		       SWAP32(rbd->b_data), SWAP16(rbd->size));
 		rbd = rbd->v_next;
 	} while (rbd != lp->rbd_head);
-	DMA_INV(dev, dma, sizeof(struct i596_dma));
+	dma_sync_cpu(dev, dma, sizeof(struct i596_dma));
 }
 
-
-#define virt_to_dma(lp, v) ((lp)->dma_addr + (dma_addr_t)((unsigned long)(v)-(unsigned long)((lp)->dma)))
-
 static inline int init_rx_bufs(struct net_device *dev)
 {
 	struct i596_private *lp = netdev_priv(dev);
@@ -508,7 +536,7 @@ static inline int init_rx_bufs(struct net_device *dev)
 	rfd->b_next = SWAP32(virt_to_dma(lp, dma->rfds));
 	rfd->cmd = SWAP16(CMD_EOL|CMD_FLEX);
 
-	DMA_WBACK_INV(dev, dma, sizeof(struct i596_dma));
+	dma_sync_dev(dev, dma, sizeof(struct i596_dma));
 	return 0;
 }
 
@@ -547,7 +575,7 @@ static void rebuild_rx_bufs(struct net_device *dev)
 	lp->rbd_head = dma->rbds;
 	dma->rfds[0].rbd = SWAP32(virt_to_dma(lp, dma->rbds));
 
-	DMA_WBACK_INV(dev, dma, sizeof(struct i596_dma));
+	dma_sync_dev(dev, dma, sizeof(struct i596_dma));
 }
 
 
@@ -575,9 +603,9 @@ static int init_i596_mem(struct net_device *dev)
 
 	DEB(DEB_INIT, printk(KERN_DEBUG "%s: starting i82596.\n", dev->name));
 
-	DMA_WBACK(dev, &(dma->scp), sizeof(struct i596_scp));
-	DMA_WBACK(dev, &(dma->iscp), sizeof(struct i596_iscp));
-	DMA_WBACK(dev, &(dma->scb), sizeof(struct i596_scb));
+	dma_sync_dev(dev, &(dma->scp), sizeof(struct i596_scp));
+	dma_sync_dev(dev, &(dma->iscp), sizeof(struct i596_iscp));
+	dma_sync_dev(dev, &(dma->scb), sizeof(struct i596_scb));
 
 	mpu_port(dev, PORT_ALTSCP, virt_to_dma(lp, &dma->scp));
 	ca(dev);
@@ -596,24 +624,24 @@ static int init_i596_mem(struct net_device *dev)
 	rebuild_rx_bufs(dev);
 
 	dma->scb.command = 0;
-	DMA_WBACK(dev, &(dma->scb), sizeof(struct i596_scb));
+	dma_sync_dev(dev, &(dma->scb), sizeof(struct i596_scb));
 
 	DEB(DEB_INIT, printk(KERN_DEBUG
 			     "%s: queuing CmdConfigure\n", dev->name));
 	memcpy(dma->cf_cmd.i596_config, init_setup, 14);
 	dma->cf_cmd.cmd.command = SWAP16(CmdConfigure);
-	DMA_WBACK(dev, &(dma->cf_cmd), sizeof(struct cf_cmd));
+	dma_sync_dev(dev, &(dma->cf_cmd), sizeof(struct cf_cmd));
 	i596_add_cmd(dev, &dma->cf_cmd.cmd);
 
 	DEB(DEB_INIT, printk(KERN_DEBUG "%s: queuing CmdSASetup\n", dev->name));
 	memcpy(dma->sa_cmd.eth_addr, dev->dev_addr, ETH_ALEN);
 	dma->sa_cmd.cmd.command = SWAP16(CmdSASetup);
-	DMA_WBACK(dev, &(dma->sa_cmd), sizeof(struct sa_cmd));
+	dma_sync_dev(dev, &(dma->sa_cmd), sizeof(struct sa_cmd));
 	i596_add_cmd(dev, &dma->sa_cmd.cmd);
 
 	DEB(DEB_INIT, printk(KERN_DEBUG "%s: queuing CmdTDR\n", dev->name));
 	dma->tdr_cmd.cmd.command = SWAP16(CmdTDR);
-	DMA_WBACK(dev, &(dma->tdr_cmd), sizeof(struct tdr_cmd));
+	dma_sync_dev(dev, &(dma->tdr_cmd), sizeof(struct tdr_cmd));
 	i596_add_cmd(dev, &dma->tdr_cmd.cmd);
 
 	spin_lock_irqsave (&lp->lock, flags);
@@ -625,7 +653,7 @@ static int init_i596_mem(struct net_device *dev)
 	DEB(DEB_INIT, printk(KERN_DEBUG "%s: Issuing RX_START\n", dev->name));
 	dma->scb.command = SWAP16(RX_START);
 	dma->scb.rfd = SWAP32(virt_to_dma(lp, dma->rfds));
-	DMA_WBACK(dev, &(dma->scb), sizeof(struct i596_scb));
+	dma_sync_dev(dev, &(dma->scb), sizeof(struct i596_scb));
 
 	ca(dev);
 
@@ -659,13 +687,13 @@ static inline int i596_rx(struct net_device *dev)
 
 	rfd = lp->rfd_head;		/* Ref next frame to check */
 
-	DMA_INV(dev, rfd, sizeof(struct i596_rfd));
+	dma_sync_cpu(dev, rfd, sizeof(struct i596_rfd));
 	while (rfd->stat & SWAP16(STAT_C)) {	/* Loop while complete frames */
 		if (rfd->rbd == I596_NULL)
 			rbd = NULL;
 		else if (rfd->rbd == lp->rbd_head->b_addr) {
 			rbd = lp->rbd_head;
-			DMA_INV(dev, rbd, sizeof(struct i596_rbd));
+			dma_sync_cpu(dev, rbd, sizeof(struct i596_rbd));
 		} else {
 			printk(KERN_ERR "%s: rbd chain broken!\n", dev->name);
 			/* XXX Now what? */
@@ -713,7 +741,7 @@ static inline int i596_rx(struct net_device *dev)
 							  DMA_FROM_DEVICE);
 				rbd->v_data = newskb->data;
 				rbd->b_data = SWAP32(dma_addr);
-				DMA_WBACK_INV(dev, rbd, sizeof(struct i596_rbd));
+				dma_sync_dev(dev, rbd, sizeof(struct i596_rbd));
 			} else {
 				skb = netdev_alloc_skb_ip_align(dev, pkt_len);
 			}
@@ -765,7 +793,7 @@ static inline int i596_rx(struct net_device *dev)
 		if (rbd != NULL && (rbd->count & SWAP16(0x4000))) {
 			rbd->count = 0;
 			lp->rbd_head = rbd->v_next;
-			DMA_WBACK_INV(dev, rbd, sizeof(struct i596_rbd));
+			dma_sync_dev(dev, rbd, sizeof(struct i596_rbd));
 		}
 
 		/* Tidy the frame descriptor, marking it as end of list */
@@ -779,14 +807,14 @@ static inline int i596_rx(struct net_device *dev)
 
 		lp->dma->scb.rfd = rfd->b_next;
 		lp->rfd_head = rfd->v_next;
-		DMA_WBACK_INV(dev, rfd, sizeof(struct i596_rfd));
+		dma_sync_dev(dev, rfd, sizeof(struct i596_rfd));
 
 		/* Remove end-of-list from old end descriptor */
 
 		rfd->v_prev->cmd = SWAP16(CMD_FLEX);
-		DMA_WBACK_INV(dev, rfd->v_prev, sizeof(struct i596_rfd));
+		dma_sync_dev(dev, rfd->v_prev, sizeof(struct i596_rfd));
 		rfd = lp->rfd_head;
-		DMA_INV(dev, rfd, sizeof(struct i596_rfd));
+		dma_sync_cpu(dev, rfd, sizeof(struct i596_rfd));
 	}
 
 	DEB(DEB_RXFRAME, printk(KERN_DEBUG "frames %d\n", frames));
@@ -827,12 +855,12 @@ static inline void i596_cleanup_cmd(struct net_device *dev, struct i596_private
 			ptr->v_next = NULL;
 			ptr->b_next = I596_NULL;
 		}
-		DMA_WBACK_INV(dev, ptr, sizeof(struct i596_cmd));
+		dma_sync_dev(dev, ptr, sizeof(struct i596_cmd));
 	}
 
 	wait_cmd(dev, lp->dma, 100, "i596_cleanup_cmd timed out");
 	lp->dma->scb.cmd = I596_NULL;
-	DMA_WBACK(dev, &(lp->dma->scb), sizeof(struct i596_scb));
+	dma_sync_dev(dev, &(lp->dma->scb), sizeof(struct i596_scb));
 }
 
 
@@ -850,7 +878,7 @@ static inline void i596_reset(struct net_device *dev, struct i596_private *lp)
 
 	/* FIXME: this command might cause an lpmc */
 	lp->dma->scb.command = SWAP16(CUC_ABORT | RX_ABORT);
-	DMA_WBACK(dev, &(lp->dma->scb), sizeof(struct i596_scb));
+	dma_sync_dev(dev, &(lp->dma->scb), sizeof(struct i596_scb));
 	ca(dev);
 
 	/* wait for shutdown */
@@ -878,20 +906,20 @@ static void i596_add_cmd(struct net_device *dev, struct i596_cmd *cmd)
 	cmd->command |= SWAP16(CMD_EOL | CMD_INTR);
 	cmd->v_next = NULL;
 	cmd->b_next = I596_NULL;
-	DMA_WBACK(dev, cmd, sizeof(struct i596_cmd));
+	dma_sync_dev(dev, cmd, sizeof(struct i596_cmd));
 
 	spin_lock_irqsave (&lp->lock, flags);
 
 	if (lp->cmd_head != NULL) {
 		lp->cmd_tail->v_next = cmd;
 		lp->cmd_tail->b_next = SWAP32(virt_to_dma(lp, &cmd->status));
-		DMA_WBACK(dev, lp->cmd_tail, sizeof(struct i596_cmd));
+		dma_sync_dev(dev, lp->cmd_tail, sizeof(struct i596_cmd));
 	} else {
 		lp->cmd_head = cmd;
 		wait_cmd(dev, dma, 100, "i596_add_cmd timed out");
 		dma->scb.cmd = SWAP32(virt_to_dma(lp, &cmd->status));
 		dma->scb.command = SWAP16(CUC_START);
-		DMA_WBACK(dev, &(dma->scb), sizeof(struct i596_scb));
+		dma_sync_dev(dev, &(dma->scb), sizeof(struct i596_scb));
 		ca(dev);
 	}
 	lp->cmd_tail = cmd;
@@ -956,7 +984,7 @@ static void i596_tx_timeout (struct net_device *dev, unsigned int txqueue)
 		/* Issue a channel attention signal */
 		DEB(DEB_ERRORS, printk(KERN_DEBUG "Kicking board.\n"));
 		lp->dma->scb.command = SWAP16(CUC_START | RX_START);
-		DMA_WBACK_INV(dev, &(lp->dma->scb), sizeof(struct i596_scb));
+		dma_sync_dev(dev, &(lp->dma->scb), sizeof(struct i596_scb));
 		ca (dev);
 		lp->last_restart = dev->stats.tx_packets;
 	}
@@ -1014,8 +1042,8 @@ static netdev_tx_t i596_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		tbd->data = SWAP32(tx_cmd->dma_addr);
 
 		DEB(DEB_TXADDR, print_eth(skb->data, "tx-queued"));
-		DMA_WBACK_INV(dev, tx_cmd, sizeof(struct tx_cmd));
-		DMA_WBACK_INV(dev, tbd, sizeof(struct i596_tbd));
+		dma_sync_dev(dev, tx_cmd, sizeof(struct tx_cmd));
+		dma_sync_dev(dev, tbd, sizeof(struct i596_tbd));
 		i596_add_cmd(dev, &tx_cmd->cmd);
 
 		dev->stats.tx_packets++;
@@ -1071,7 +1099,7 @@ static int i82596_probe(struct net_device *dev)
 	lp->dma->scb.rfd = I596_NULL;
 	spin_lock_init(&lp->lock);
 
-	DMA_WBACK_INV(dev, lp->dma, sizeof(struct i596_dma));
+	dma_sync_dev(dev, lp->dma, sizeof(struct i596_dma));
 
 	ret = register_netdev(dev);
 	if (ret)
@@ -1141,7 +1169,7 @@ static irqreturn_t i596_interrupt(int irq, void *dev_id)
 				   dev->name, status & 0x0700));
 
 		while (lp->cmd_head != NULL) {
-			DMA_INV(dev, lp->cmd_head, sizeof(struct i596_cmd));
+			dma_sync_cpu(dev, lp->cmd_head, sizeof(struct i596_cmd));
 			if (!(lp->cmd_head->status & SWAP16(STAT_C)))
 				break;
 
@@ -1223,7 +1251,7 @@ static irqreturn_t i596_interrupt(int irq, void *dev_id)
 			}
 			ptr->v_next = NULL;
 			ptr->b_next = I596_NULL;
-			DMA_WBACK(dev, ptr, sizeof(struct i596_cmd));
+			dma_sync_dev(dev, ptr, sizeof(struct i596_cmd));
 			lp->last_cmd = jiffies;
 		}
 
@@ -1237,13 +1265,13 @@ static irqreturn_t i596_interrupt(int irq, void *dev_id)
 
 			ptr->command &= SWAP16(0x1fff);
 			ptr = ptr->v_next;
-			DMA_WBACK_INV(dev, prev, sizeof(struct i596_cmd));
+			dma_sync_dev(dev, prev, sizeof(struct i596_cmd));
 		}
 
 		if (lp->cmd_head != NULL)
 			ack_cmd |= CUC_START;
 		dma->scb.cmd = SWAP32(virt_to_dma(lp, &lp->cmd_head->status));
-		DMA_WBACK_INV(dev, &dma->scb, sizeof(struct i596_scb));
+		dma_sync_dev(dev, &dma->scb, sizeof(struct i596_scb));
 	}
 	if ((status & 0x1000) || (status & 0x4000)) {
 		if ((status & 0x4000))
@@ -1268,7 +1296,7 @@ static irqreturn_t i596_interrupt(int irq, void *dev_id)
 	}
 	wait_cmd(dev, dma, 100, "i596 interrupt, timeout");
 	dma->scb.command = SWAP16(ack_cmd);
-	DMA_WBACK(dev, &dma->scb, sizeof(struct i596_scb));
+	dma_sync_dev(dev, &dma->scb, sizeof(struct i596_scb));
 
 	/* DANGER: I suspect that some kind of interrupt
 	 acknowledgement aside from acking the 82596 might be needed
@@ -1299,7 +1327,7 @@ static int i596_close(struct net_device *dev)
 
 	wait_cmd(dev, lp->dma, 100, "close1 timed out");
 	lp->dma->scb.command = SWAP16(CUC_ABORT | RX_ABORT);
-	DMA_WBACK(dev, &lp->dma->scb, sizeof(struct i596_scb));
+	dma_sync_dev(dev, &lp->dma->scb, sizeof(struct i596_scb));
 
 	ca(dev);
 
@@ -1358,7 +1386,7 @@ static void set_multicast_list(struct net_device *dev)
 			       dev->name);
 		else {
 			dma->cf_cmd.cmd.command = SWAP16(CmdConfigure);
-			DMA_WBACK_INV(dev, &dma->cf_cmd, sizeof(struct cf_cmd));
+			dma_sync_dev(dev, &dma->cf_cmd, sizeof(struct cf_cmd));
 			i596_add_cmd(dev, &dma->cf_cmd.cmd);
 		}
 	}
@@ -1390,7 +1418,7 @@ static void set_multicast_list(struct net_device *dev)
 					   dev->name, cp));
 			cp += ETH_ALEN;
 		}
-		DMA_WBACK_INV(dev, &dma->mc_cmd, sizeof(struct mc_cmd));
+		dma_sync_dev(dev, &dma->mc_cmd, sizeof(struct mc_cmd));
 		i596_add_cmd(dev, &cmd->cmd);
 	}
 }
diff --git a/drivers/net/ethernet/i825xx/sni_82596.c b/drivers/net/ethernet/i825xx/sni_82596.c
index 4b9ac0c6557731..27937c5d795673 100644
--- a/drivers/net/ethernet/i825xx/sni_82596.c
+++ b/drivers/net/ethernet/i825xx/sni_82596.c
@@ -24,10 +24,6 @@
 
 static const char sni_82596_string[] = "snirm_82596";
 
-#define DMA_WBACK(priv, addr, len)     do { } while (0)
-#define DMA_INV(priv, addr, len)       do { } while (0)
-#define DMA_WBACK_INV(priv, addr, len) do { } while (0)
-
 #define SYSBUS      0x00004400
 
 /* big endian CPU, 82596 little endian */
-- 
2.28.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
