Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10654269058
	for <lists+nouveau@lfdr.de>; Mon, 14 Sep 2020 17:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D2D6E2E6;
	Mon, 14 Sep 2020 15:43:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0AA6E4D0
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7O2Rc307Jq8KkaDn7zbVItvtt/ecHc/too3yP9zxMNw=; b=M80c+D3BqJySppi+H3eNYCcnH/
 gkfi1LX5tkOxqiYr7vGlDhimfScWmyFoD4H7IZc29yxj59fxiZw4CTf73qE/Frs6kv2D1VP9Z0cDk
 mxHwC6y23VXZp0GWVeuCJj/TuYsYfRbshYeLxTfn4NkxNbZt/mCYZDG48aAzhZnPSD26Tjx+8/mwu
 2BX9yzKsoQKr11uV/Bwnigc9od3UdV8s2rG69+T+l2QU+9l3XPVzWYgBbLqR3TeV+3H8nv+hHYZRQ
 AbZDHlAxP767K2OWIVLYATsG32mlziFsc93sPs4pmGxH1oa7RFwa/hq19KGZWcLA7yuKXtQ9v35Ul
 oAwe3FdQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kHqN0-0004bK-27; Mon, 14 Sep 2020 15:26:18 +0000
Date: Mon, 14 Sep 2020 16:26:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200914152617.GR6583@casper.infradead.org>
References: <20200914144433.1622958-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914144433.1622958-1-hch@lst.de>
X-Mailman-Approved-At: Mon, 14 Sep 2020 15:43:42 +0000
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
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 04:44:16PM +0200, Christoph Hellwig wrote:
> I'm still a little unsure about the API naming, as alloc_pages sort of
> implies a struct page return value, but we return a kernel virtual
> address.

Erm ... dma_alloc_pages() returns a struct page, so is this sentence
stale?

From patch 14:

+struct page *dma_alloc_pages(struct device *dev, size_t size,
+               dma_addr_t *dma_handle, enum dma_data_direction dir, gfp_t gfp);

> The other alternative would be to name the API
> dma_alloc_noncoherent, but the whole non-coherent naming seems to put
> people off.

You say that like it's a bad thing.  I think the problem is more that
people don't understand what non-coherent means and think they're
supporting it when they're not.

dma_alloc_manual_flushing()?

> As a follow up I plan to move the implementation of the
> DMA_ATTR_NO_KERNEL_MAPPING flag over to this framework as well, given
> that is also is a fundamentally non coherent allocation.  The replacement
> for that flag would then return a struct page, as it is allowed to
> actually return pages without a kernel mapping as the name suggested
> (although most of the time they will actually have a kernel mapping..)

If the page doesn't have a kernel mapping, shouldn't it return a PFN
or a phys_addr?

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
