Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4824A25C063
	for <lists+nouveau@lfdr.de>; Thu,  3 Sep 2020 13:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426866E9D3;
	Thu,  3 Sep 2020 11:34:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAB36E1B3
 for <nouveau@lists.freedesktop.org>; Thu,  3 Sep 2020 08:42:31 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2B13F68BEB; Thu,  3 Sep 2020 10:42:27 +0200 (CEST)
Date: Thu, 3 Sep 2020 10:42:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Message-ID: <20200903084226.GA24410@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-23-hch@lst.de>
 <20200901152209.GA14288@alpha.franken.de>
 <20200901171241.GA20685@alpha.franken.de> <20200901171627.GA8255@lst.de>
 <20200901173810.GA25282@alpha.franken.de>
 <20200902213809.GA7998@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200902213809.GA7998@alpha.franken.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 03 Sep 2020 11:34:11 +0000
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

On Wed, Sep 02, 2020 at 11:38:09PM +0200, Thomas Bogendoerfer wrote:
> the patch below fixes the problem.

But is very wrong unfortunately.

>  static inline void dma_sync_desc_cpu(struct net_device *dev, void *addr)
>  {
> -       dma_cache_sync(dev->dev.parent, addr, sizeof(struct sgiseeq_rx_desc),
> -                      DMA_FROM_DEVICE);
> +       struct sgiseeq_private *sp = netdev_priv(dev);
> +
> +       dma_sync_single_for_device(dev->dev.parent, VIRT_TO_DMA(sp, addr),
> +                       sizeof(struct sgiseeq_rx_desc), DMA_FROM_DEVICE);
>  }
>  
>  static inline void dma_sync_desc_dev(struct net_device *dev, void *addr)
>  {
> -       dma_cache_sync(dev->dev.parent, addr, sizeof(struct sgiseeq_rx_desc),
> -                      DMA_TO_DEVICE);
> +       struct sgiseeq_private *sp = netdev_priv(dev);
> +
> +       dma_sync_single_for_device(dev->dev.parent, VIRT_TO_DMA(sp, addr),
> +                       sizeof(struct sgiseeq_rx_desc), DMA_TO_DEVICE);

This is not how the DMA API works.  You can only call
dma_sync_single_for_{device,cpu} with the direction that the memory
was mapped.  It then transfer ownership to the device or the cpu,
and the ownership of the memory is a fundamental concept that allows
for reasoning about the caching interaction.

>  }
>  
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
---end quoted text---
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
