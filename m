Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0F26B9E8
	for <lists+nouveau@lfdr.de>; Wed, 16 Sep 2020 04:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67B76E959;
	Wed, 16 Sep 2020 02:22:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F0EB89FC8
 for <nouveau@lists.freedesktop.org>; Tue, 15 Sep 2020 06:36:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CFEFC6736F; Tue, 15 Sep 2020 08:36:18 +0200 (CEST)
Date: Tue, 15 Sep 2020 08:36:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200915063618.GD19113@lst.de>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914152617.GR6583@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914152617.GR6583@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Wed, 16 Sep 2020 02:22:34 +0000
Subject: Re: [Nouveau] a saner API for allocating DMA addressable pages v2
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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

On Mon, Sep 14, 2020 at 04:26:17PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 04:44:16PM +0200, Christoph Hellwig wrote:
> > I'm still a little unsure about the API naming, as alloc_pages sort of
> > implies a struct page return value, but we return a kernel virtual
> > address.
> 
> Erm ... dma_alloc_pages() returns a struct page, so is this sentence
> stale?

Yes.

> You say that like it's a bad thing.  I think the problem is more that
> people don't understand what non-coherent means and think they're
> supporting it when they're not.
> 
> dma_alloc_manual_flushing()?

That sounds pretty awkward..

> 
> > As a follow up I plan to move the implementation of the
> > DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> > that is also is a fundamentally non coherent allocation.  The replacement
> > for that flag would then return a struct page, as it is allowed to
> > actually return pages without a kernel mapping as the name suggested
> > (although most of the time they will actually have a kernel mapping..)
> 
> If the page doesn't have a kernel mapping, shouldn't it return a PFN
> or a phys_addr?

Most APIs we'll feed it into need a struct page.  The difference is just
that it can be a highmem page.  And if we want to get fancy we could
change the kernel mapping to PROT_NONE eventually.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
