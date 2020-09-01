Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0F9259E2F
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 20:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C36D6E8D4;
	Tue,  1 Sep 2020 18:38:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C583E6E0CD
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 17:16:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 48CDB68B05; Tue,  1 Sep 2020 19:16:27 +0200 (CEST)
Date: Tue, 1 Sep 2020 19:16:27 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Message-ID: <20200901171627.GA8255@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-23-hch@lst.de>
 <20200901152209.GA14288@alpha.franken.de>
 <20200901171241.GA20685@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901171241.GA20685@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Tue, 01 Sep 2020 18:38:08 +0000
Subject: Re: [Nouveau] [PATCH 22/28] sgiseeq: convert from dma_cache_sync to
 dma_sync_single_for_device
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 iommu@lists.linux-foundation.org, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 07:12:41PM +0200, Thomas Bogendoerfer wrote:
> On Tue, Sep 01, 2020 at 05:22:09PM +0200, Thomas Bogendoerfer wrote:
> > On Wed, Aug 19, 2020 at 08:55:49AM +0200, Christoph Hellwig wrote:
> > > Use the proper modern API to transfer cache ownership for incoherent DMA.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  drivers/net/ethernet/seeq/sgiseeq.c | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/net/ethernet/seeq/sgiseeq.c b/drivers/net/ethernet/seeq/sgiseeq.c
> > > index 39599bbb5d45b6..f91dae16d69a19 100644
> > > --- a/drivers/net/ethernet/seeq/sgiseeq.c
> > > +++ b/drivers/net/ethernet/seeq/sgiseeq.c
> > > @@ -112,14 +112,18 @@ struct sgiseeq_private {
> > >  
> > >  static inline void dma_sync_desc_cpu(struct net_device *dev, void *addr)
> > >  {
> > > -	dma_cache_sync(dev->dev.parent, addr, sizeof(struct sgiseeq_rx_desc),
> > > -		       DMA_FROM_DEVICE);
> > > +	struct sgiseeq_private *sp = netdev_priv(dev);
> > > +
> > > +	dma_sync_single_for_cpu(dev->dev.parent, VIRT_TO_DMA(sp, addr),
> > > +			sizeof(struct sgiseeq_rx_desc), DMA_BIDIRECTIONAL);
> > >  }
> > >  
> > >  static inline void dma_sync_desc_dev(struct net_device *dev, void *addr)
> > >  {
> > > -	dma_cache_sync(dev->dev.parent, addr, sizeof(struct sgiseeq_rx_desc),
> > > -		       DMA_TO_DEVICE);
> > > +	struct sgiseeq_private *sp = netdev_priv(dev);
> > > +
> > > +	dma_sync_single_for_device(dev->dev.parent, VIRT_TO_DMA(sp, addr),
> > > +			sizeof(struct sgiseeq_rx_desc), DMA_BIDIRECTIONAL);
> > >  }
> > 
> > this breaks ethernet on IP22 completely, but I haven't figured out why, yet.
> 
> the problem is that dma_sync_single_for_cpu() doesn't flush anything
> for IP22, because it only flushes for CPUs which do speculation. So
> either MIPS arch_sync_dma_for_cpu() should always flush or sgiseeq
> needs to use a different sync funktion, when it wants to re-read descriptors
> from memory.

Well, if IP22 doesn't speculate (which I'm pretty sure is the case),
dma_sync_single_for_cpu should indeeed be a no-op.  But then there
also shouldn't be anything in the cache, as the previous
dma_sync_single_for_device should have invalidated it.  So it seems like
we are missing one (or more) ownership transfers to the device.  I'll
try to look at the the ownership management in a little more detail
tomorrow.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
