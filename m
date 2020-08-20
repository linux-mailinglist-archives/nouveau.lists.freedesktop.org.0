Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F124AE5B
	for <lists+nouveau@lfdr.de>; Thu, 20 Aug 2020 07:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1E56E8A2;
	Thu, 20 Aug 2020 05:19:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D72C6E8A2
 for <nouveau@lists.freedesktop.org>; Thu, 20 Aug 2020 05:15:17 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A894C68BEB; Thu, 20 Aug 2020 07:15:12 +0200 (CEST)
Date: Thu, 20 Aug 2020 07:15:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tomasz Figa <tfiga@chromium.org>
Message-ID: <20200820051512.GA5141@lst.de>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-20-hch@lst.de>
 <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 20 Aug 2020 05:19:07 +0000
Subject: Re: [Nouveau] [PATCH 19/28] dma-mapping: replace
 DMA_ATTR_NON_CONSISTENT with dma_{alloc, free}_pages
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
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 19, 2020 at 05:03:52PM +0200, Tomasz Figa wrote:
> >
> > -Warning: These pieces of the DMA API should not be used in the
> > -majority of cases, since they cater for unlikely corner cases that
> > -don't belong in usual drivers.
> > +These APIs allow to allocate pages that can be used like normal pages
> > +in the kernel direct mapping, but are guaranteed to be DMA addressable.
> 
> Could we elaborate a bit more on what "like normal pages in kernel
> direct mapping" mean from the driver perspective?

It mostly means you can call virt_to_page and then do anything you'd
do with a page struct.  Unlike dma_alloc_attrs that just return an
opaque virtual address that the caller is not allowed to poke into.

> There is one aspect that the existing dma_alloc_attrs() handles, but
> this new function doesn't: IOMMU support. The function will always
> allocate a physically-contiguous block memory, which is a costly
> operation and not even guaranteed to succeed, even if enough free
> memory is available.
> 
> Modern SoCs employ IOMMUs to avoid the need to allocate
> physically-contiguous memory and those happen to be also the devices
> that could benefit from non-coherent allocations a lot. One of the
> tasks of the DMA API was making it possible to allocate suitable
> memory for a given device, without having the driver know about the
> SoC integration details, such as the presence of an IOMMU.

This is completely out of scope for this API exactly because it
guarantees a page in the direct mapping.  But see my previous mail
in reply to Robin on how you can implement the funtionality you
want right now without any help from the dma-mapping subsystem.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
