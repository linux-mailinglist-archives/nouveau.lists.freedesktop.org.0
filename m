Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71C24AE40
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 07:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0440A6E8A0;
	Thu, 20 Aug 2020 05:05:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4856E8A0
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 05:02:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7DCC068BEB; Thu, 20 Aug 2020 07:02:14 +0200 (CEST)
Date: Thu, 20 Aug 2020 07:02:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20200820050214.GA4815@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com>
 <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2b32f1d8-16f7-3352-40a5-420993d52fb5@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 20 Aug 2020 05:05:24 +0000
Subject: Re: [Nouveau] [PATCH 05/28] media/v4l2: remove
 V4L2-FLAG-MEMORY-NON-CONSISTENT
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
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, Kyungmin Park <kyungmin.park@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 03:07:04PM +0100, Robin Murphy wrote:
>> FWIW, I asked back in time what the plan is for non-coherent
>> allocations and it seemed like DMA_ATTR_NON_CONSISTENT and
>> dma_sync_*() was supposed to be the right thing to go with. [2] The
>> same thread also explains why dma_alloc_pages() isn't suitable for the
>> users of dma_alloc_attrs() and DMA_ATTR_NON_CONSISTENT.
>
> AFAICS even back then Christoph was implying getting rid of NON_CONSISTENT 
> and *replacing* it with something streaming-API-based - i.e. this series - 
> not encouraging mixing the existing APIs. It doesn't seem impossible to 
> implement a remapping version of this new dma_alloc_pages() for 
> IOMMU-backed ops if it's really warranted (although at that point it seems 
> like "non-coherent" vb2-dc starts to have significant conceptual overlap 
> with vb2-sg).

You can alway vmap the returned pages from dma_alloc_pages, but it will
make cache invalidation hell - you'll need to use
invalidate_kernel_vmap_range and flush_kernel_vmap_range to properly
handle virtually indexed caches.

Or with remapping you mean using the iommu do de-scatter/gather?

You can implement that trivially implement it yourself for the iommu
case:

{
	merge_boundary = dma_get_merge_boundary(dev);
	if (!merge_boundary || merge_boundary > chunk_size - 1) {
		/* can't coalesce */
		return -EINVAL;
	}

	
	nents = DIV_ROUND_UP(total_size, chunk_size);
	sg = sgl_alloc();
	for_each_sgl() {
		sg->page = __alloc_pages(get_order(chunk_size))
		sg->len = chunk_size;
	}
	dma_map_sg(sg, DMA_ATTR_SKIP_CPU_SYNC);
	// you are guaranteed to get a single dma_addr out
}

Of course this still uses the scatterlist structure with its annoying
mix of input and output parametes, so I'd rather not expose it as
an official API at the DMA layer.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
