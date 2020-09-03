Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58A25C060
	for <lists+nouveau@lfdr.de>; Thu,  3 Sep 2020 13:34:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D19C6E9CF;
	Thu,  3 Sep 2020 11:34:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2094E6E1B3
 for <nouveau@lists.freedesktop.org>; Thu,  3 Sep 2020 08:43:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1CF6368CEC; Thu,  3 Sep 2020 10:43:03 +0200 (CEST)
Date: Thu, 3 Sep 2020 10:43:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Message-ID: <20200903084302.GB24410@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-23-hch@lst.de>
 <20200901152209.GA14288@alpha.franken.de>
 <20200901171241.GA20685@alpha.franken.de> <20200901171627.GA8255@lst.de>
 <20200901173810.GA25282@alpha.franken.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901173810.GA25282@alpha.franken.de>
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

On Tue, Sep 01, 2020 at 07:38:10PM +0200, Thomas Bogendoerfer wrote:
> this is the problem:
> 
>        /* Always check for received packets. */
>         sgiseeq_rx(dev, sp, hregs, sregs);
> 
> so the driver will look at the rx descriptor on every interrupt, so
> we cache the rx descriptor on the first interrupt and if there was
> $no rx packet, we will only see it, if cache line gets flushed for
> some other reason.

That means a transfer back to device ownership is missing after a
(negative) check.

> kick_tx() does a busy loop checking tx descriptors,
> with just sync_desc_cpu...
> 
> Thomas.
> 
> -- 
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
---end quoted text---
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
