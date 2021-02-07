Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 448023125E3
	for <lists+nouveau@lfdr.de>; Sun,  7 Feb 2021 17:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EFCB6E1D6;
	Sun,  7 Feb 2021 16:12:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FE9887DE;
 Sun,  7 Feb 2021 15:56:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3732F68B02; Sun,  7 Feb 2021 16:56:02 +0100 (CET)
Date: Sun, 7 Feb 2021 16:56:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <20210207155601.GA25111@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-6-dongli.zhang@oracle.com>
 <20210204084023.GA32328@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204084023.GA32328@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Sun, 07 Feb 2021 16:12:13 +0000
Subject: Re: [Nouveau] [PATCH RFC v1 5/6] xen-swiotlb: convert variables to
 arrays
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bhelgaas@google.com, paulus@samba.org,
 hpa@zytor.com, hch@lst.de, m.szyprowski@samsung.com, sstabellini@kernel.org,
 adrian.hunter@intel.com, mpe@ellerman.id.au, x86@kernel.org,
 joe.jin@oracle.com, mingo@kernel.org, peterz@infradead.org, mingo@redhat.com,
 bskeggs@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, nouveau@lists.freedesktop.org,
 boris.ostrovsky@oracle.com, chris@chris-wilson.co.uk, jgross@suse.com,
 tsbogend@alpha.franken.de, robin.murphy@arm.com, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
 tglx@linutronix.de, bauerman@linux.ibm.com, daniel@ffwll.ch,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Feb 04, 2021 at 09:40:23AM +0100, Christoph Hellwig wrote:
> So one thing that has been on my mind for a while:  I'd really like
> to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
> to swiotlb the main difference seems to be:
> 
>  - additional reasons to bounce I/O vs the plain DMA capable
>  - the possibility to do a hypercall on arm/arm64
>  - an extra translation layer before doing the phys_to_dma and vice
>    versa
>  - an special memory allocator
> 
> I wonder if inbetween a few jump labels or other no overhead enablement
> options and possibly better use of the dma_range_map we could kill
> off most of swiotlb-xen instead of maintaining all this code duplication?

So I looked at this a bit more.

For x86 with XENFEAT_auto_translated_physmap (how common is that?)
pfn_to_gfn is a nop, so plain phys_to_dma/dma_to_phys do work as-is.

xen_arch_need_swiotlb always returns true for x86, and
range_straddles_page_boundary should never be true for the
XENFEAT_auto_translated_physmap case.

So as far as I can tell the mapping fast path for the
XENFEAT_auto_translated_physmap can be trivially reused from swiotlb.

That leaves us with the next more complicated case, x86 or fully cache
coherent arm{,64} without XENFEAT_auto_translated_physmap.  In that case
we need to patch in a phys_to_dma/dma_to_phys that performs the MFN
lookup, which could be done using alternatives or jump labels.
I think if that is done right we should also be able to let that cover
the foreign pages in is_xen_swiotlb_buffer/is_swiotlb_buffer, but
in that worst case that would need another alternative / jump label.

For non-coherent arm{,64} we'd also need to use alternatives or jump
labels to for the cache maintainance ops, but that isn't a hard problem
either.


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
