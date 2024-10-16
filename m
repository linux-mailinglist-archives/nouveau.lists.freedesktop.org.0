Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAF9A0FE1
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2024 18:41:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D788D10E746;
	Wed, 16 Oct 2024 16:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="pNoSSNO1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C11910E14C;
 Wed, 16 Oct 2024 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OPi0Qi7ew8T7pJV/9wlWhHFA+S+BQq/imu/tsZu/g3M=; b=pNoSSNO1akqzN16H+ivxfA5F6w
 oWLzRYEjkRbAaCfvwjRsqoChyr/VQkXakM4Mbi8nq2NnY7pORaZUyuwbdqeej8/dP+0AqLPNPkifB
 Gr4nX3Gt8l6tMV3b8/qUc8rjJr5CG3U7D5CUga0I0daNg6ZTu4kYn5g6Z8WBuR85ejaxAAZyFC2UJ
 8lUXbK650wYjKFdQAgObOgnO67YpBORX/azzOKG/jQ69CI1s0L61KgnmjjhT1kXPKUyaWXDBrM0I4
 WO7s9MLrq0zfRmRxO60dkpYlqU3Ny8KaIT+aPGUIv527IDTi9eAZuDESu3iiPIJgd8BmNwwVPTHLr
 TEDDtT9g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t1755-0000000CS4t-2ATs; Wed, 16 Oct 2024 16:41:03 +0000
Date: Wed, 16 Oct 2024 09:41:03 -0700
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
Message-ID: <Zw_sn_DdZRUw5oxq@infradead.org>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016154428.GD4020792@ziepe.ca>
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

On Wed, Oct 16, 2024 at 12:44:28PM -0300, Jason Gunthorpe wrote:
> > We are talking about P2P memory here.  How do you manage to get a page
> > that dma_map_page can be used on?  All P2P memory needs to use the P2P
> > aware dma_map_sg as the pages for P2P memory are just fake zone device
> > pages.
> 
> FWIW, I've been expecting this series to be rebased on top of Leon's
> new DMA API series so it doesn't have this issue..

That's not going to make a difference at this level.

> I'm guessing they got their testing done so far on a system without an
> iommu translation?

IOMMU or not doens't matter much for P2P.  The important difference is
through the host bridge or through a switch.  dma_map_page will work
for P2P through the host brige (assuming the host bridge even support
it as it also lacks the error handling for when not), but it lacks the
handling for P2P through a switch.

> 
> > which also makes it clear that returning a page from the method is
> > not that great, a PFN might work a lot better, e.g.
> > 
> > 	unsigned long (*device_private_dma_pfn)(struct page *page);
> 
> Ideally I think we should not have the struct page * at all through
> these APIs if we can avoid it..

The input page is the device private page that we have at hand
anyway.  Until that scheme is complete redone it is the right kind
of parameter.

