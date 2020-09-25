Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFE2794F0
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 01:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917596ED82;
	Fri, 25 Sep 2020 23:46:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B28946ED0A
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 16:17:58 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 39A7E68AFE; Fri, 25 Sep 2020 18:17:55 +0200 (CEST)
Date: Fri, 25 Sep 2020 18:17:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Message-ID: <20200925161754.GA18721@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-9-hch@lst.de>
 <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 25 Sep 2020 23:46:15 +0000
Subject: Re: [Nouveau] [PATCH 08/18] dma-mapping: add a new
 dma_alloc_noncoherent API
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

On Fri, Sep 25, 2020 at 12:15:37PM +0100, Robin Murphy wrote:
> On 2020-09-15 16:51, Christoph Hellwig wrote:
> [...]
>> +These APIs allow to allocate pages in the kernel direct mapping that are
>> +guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
>> +virt_to_page can be called on the resulting address, and the resulting
>
> Nit: if we explicitly describe this as if it's a guarantee that can be 
> relied upon...
>
>> +struct page can be used for everything a struct page is suitable for.
>
> [...]
>> +This routine allocates a region of <size> bytes of consistent memory.  It
>> +returns a pointer to the allocated region (in the processor's virtual address
>> +space) or NULL if the allocation failed.  The returned memory may or may not
>> +be in the kernels direct mapping.  Drivers must not call virt_to_page on
>> +the returned memory region.
>
> ...then forbid this document's target audience from relying on it, 
> something seems off. At the very least it's unhelpfully unclear :/
>
> Given patch #17, I suspect that the first paragraph is the one that's no 
> longer true.

Yes.  dma_alloc_pages is the replacement for allocations that need the
direct mapping.  I'll send a patch to document dma_alloc_pages and
fixes this up
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
