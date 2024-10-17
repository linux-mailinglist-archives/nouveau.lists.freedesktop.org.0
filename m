Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D23ED9A2439
	for <lists+nouveau@lfdr.de>; Thu, 17 Oct 2024 15:49:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA4210E83F;
	Thu, 17 Oct 2024 13:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="B4Clw0OI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8091B10E83F;
 Thu, 17 Oct 2024 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=snZpsDz54GwpfnkEbUricuY28KyqdWxXHVT3LdPzGmY=; b=B4Clw0OIg5EUXc3aunxOUC9Ez/
 gKlaSNLiUzISmC0vOFIFFX48E2DBY4cSXf3NU9zFGsZr9w+yRK2sq6rGXUVRHVHPaqf/gJI/roXeY
 NY0L2+L/6Te6tZVl+6B9CzMGScG0EJFAqggCIf2MwRYzo0l3jUf3ZcLluLRl/yXl10xq/jMm73pFt
 jhkdiEMaAct/myAd5XzMiM1u+MYQj1G0RJJM9NMfv+XB22sQ4XypBQoG9vOHkD7qO+FImArT3KVjc
 2wmuYuQtJHyxD8EKA5YTyc5aEu9o8Da4xdg9B5ic7jKjqkAyA9v/xS6RyHxn9bvH5Qmn2nqQHXdd4
 4PbErMOg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t1Qsc-0000000F06G-24M0; Thu, 17 Oct 2024 13:49:30 +0000
Date: Thu, 17 Oct 2024 06:49:30 -0700
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
Message-ID: <ZxEV6ocpKLjPC8H4@infradead.org>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
 <20241016154428.GD4020792@ziepe.ca>
 <Zw_sn_DdZRUw5oxq@infradead.org>
 <20241016174445.GF4020792@ziepe.ca>
 <ZxD71D66qLI0qHpW@infradead.org> <20241017130539.GA897978@ziepe.ca>
 <ZxENV_EppCYIXfOW@infradead.org> <20241017134644.GA948948@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017134644.GA948948@ziepe.ca>
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

On Thu, Oct 17, 2024 at 10:46:44AM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 17, 2024 at 06:12:55AM -0700, Christoph Hellwig wrote:
> > On Thu, Oct 17, 2024 at 10:05:39AM -0300, Jason Gunthorpe wrote:
> > > Broadly I think whatever flow NVMe uses for P2P will apply to ODP as
> > > well.
> > 
> > ODP is a lot simpler than NVMe for P2P actually :(
> 
> What is your thinking there? I'm looking at the latest patches and I
> would expect dma_iova_init() to accept a phys so it can call
> pci_p2pdma_map_type() once for the whole transaction. It is a slow
> operation.

You can't do it for the whole transaction.  Here is my suggestion
for ODP:

http://git.infradead.org/?p=users/hch/misc.git;a=shortlog;h=refs/heads/dma-split-wip

For NVMe I need to figure out a way to split bios on a per P2P
type boundary as we don't have any space to record if something is a bus
mapped address.

