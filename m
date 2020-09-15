Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CE526BA04
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F29D76E962;
	Wed, 16 Sep 2020 02:22:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798956E83A
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 06:33:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 553AD6736F; Tue, 15 Sep 2020 08:33:14 +0200 (CEST)
Date: Tue, 15 Sep 2020 08:33:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <20200915063314.GC19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914144433.1622958-4-hch@lst.de>
 <7a1d11c2-0fc5-e110-dabe-960e516bb343@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7a1d11c2-0fc5-e110-dabe-960e516bb343@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
Subject: Re: [Nouveau] [PATCH 03/17] drm/exynos: stop setting
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-scsi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 06:34:02PM +0300, Sergei Shtylyov wrote:
> On 9/14/20 5:44 PM, Christoph Hellwig wrote:
> 
> > DMA_ATTR_NON_CONSISTENT is a no-op except on PARISC and some mips
> > configs, so don't set it in this ARM specific driver.
> 
>    Hm, PARICS and ARM capitalized but mips in lower case? :-)

I guess it should also be PA-RISC if we start nitpicking..
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
