Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95479A21A6
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 13:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238E610E7F8;
	Thu, 17 Oct 2024 11:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="w6k0JD7i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2A710E7F8;
 Thu, 17 Oct 2024 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=EEDlW0Z+27Cz1a36GnGWzG69pvQQcfAeec1992co/rU=; b=w6k0JD7itqBz1TeMuMUHKr2szV
 HdrbD5T6KpkzUq67echeUaMGiLU86Jhj67No8E02ULxoUSkbQFEG7QeJlA9i6jCbzVyHdhuhVrCm9
 QEbjccVpvAry4xZVtmywe8TpIdwRgeQCAf04vKCPZdaH0ibPWuCoga7WOklEOu7G9flfeP3TOMDbj
 PeQV3HJ2agNF9brsTbkzHmLHdvpuHq/vmfopnhKxf+H7kerzEqeNPCkgpGhg4A7F5abFkIj1VoBQt
 8WiBq5FPcPVE4wxmfiUHJ0j0xYFX5ygiAo17X3gLbyq5MXBm5g5AmNIOBNOYG/WNS1rlPDNX1CXF/
 NYo8NzBQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t1P8u-0000000Ehiu-2ZiO; Thu, 17 Oct 2024 11:58:12 +0000
Date: Thu, 17 Oct 2024 04:58:12 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@infradead.org>,
 Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <ZxD71D66qLI0qHpW@infradead.org>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
 <20241016174445.GF4020792@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016174445.GF4020792@ziepe.ca>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Oct 16, 2024 at 02:44:45PM -0300, Jason Gunthorpe wrote:
> > > FWIW, I've been expecting this series to be rebased on top of Leon's
> > > new DMA API series so it doesn't have this issue..
> > 
> > That's not going to make a difference at this level.
> 
> I'm not sure what you are asking then.
> 
> Patch 2 does pci_p2pdma_add_resource() and so a valid struct page with
> a P2P ZONE_DEVICE type exists, and that gets returned back to the
> hmm/odp code.
> 
> Today odp calls dma_map_page() which only works by chance in limited
> cases. With Leon's revision it will call hmm_dma_map_pfn() ->
> dma_iova_link() which does call pci_p2pdma_map_type() and should do
> the right thing.

Again none of this affects the code posted here.  It reshuffles the
callers but has no direct affect on the patches posted here.

(and the current DMA series lacks P2P support, I'm trying to figure
out how to properly handle it at the moment).

> > IOMMU or not doens't matter much for P2P.  The important difference is
> > through the host bridge or through a switch.  dma_map_page will work
> > for P2P through the host brige (assuming the host bridge even support
> > it as it also lacks the error handling for when not), but it lacks the
> > handling for P2P through a switch.
> 
> On most x86 systems the BAR/bus address of the P2P memory is the same
> as the CPU address, so without an IOMMU translation dma_map_page()
> will return the CPU/host physical address which is the same as the
> BAR/bus address and that will take the P2P switch path for testing.

Maybe.  Either way the use of dma_map_page is incorrect.


> 
> Jason
---end quoted text---
