Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A5AB101C9
	for <lists+nouveau@lfdr.de>; Thu, 24 Jul 2025 09:30:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FACB10E1CA;
	Thu, 24 Jul 2025 07:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="Wcm48Xl9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4019010E1CA;
 Thu, 24 Jul 2025 07:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=x0ieeULae3wZoXFYbacES0pRJT+dyok9yRpzdF6F6T0=; b=Wcm48Xl9he+9gkl3mD7JfqaQce
 x8ztVwaaQNB53A5F0yo+KJrnZBPNw4lAAfrPl0N8sY5OVPJkJwDMEuhieCsS8U2mg6MaQuEwoJP8A
 xMtVgtwNnUmpskEXT899TV8M6A/t15OZ56RkAqlELlIhtEg6MJI7GHk5/pnYN3CooEIxTiMxJOupF
 e/fzMsUaHaqch4kbHHT4PsbtVhXeYYpulwGUn4Mg0RNT9PSKNDvu085SQy4hz65m6cPkTug6Yab24
 Ok2AgKIsmRhAGwRl+UsJpcNYYufuJ2+ztViaJE6jZJ4iGTvhPqtPDql8iGT7pCunDpG/dtx/NVm61
 BqqmT/kw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1ueqPS-00000006i6Y-1TLE;
 Thu, 24 Jul 2025 07:30:34 +0000
Date: Thu, 24 Jul 2025 00:30:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@infradead.org>, Yonatan Maman <ymaman@nvidia.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Leon Romanovsky <leon@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 4/5] RDMA/mlx5: Enable P2P DMA with fallback mechanism
Message-ID: <aIHhGi3adOiLykJn@infradead.org>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-5-ymaman@nvidia.com>
 <aH3mTZP7w8KnMLx1@infradead.org> <aIBdKhzft4umCGZO@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIBdKhzft4umCGZO@ziepe.ca>
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

On Wed, Jul 23, 2025 at 12:55:22AM -0300, Jason Gunthorpe wrote:
> On Mon, Jul 21, 2025 at 12:03:41AM -0700, Christoph Hellwig wrote:
> > On Fri, Jul 18, 2025 at 02:51:11PM +0300, Yonatan Maman wrote:
> > > From: Yonatan Maman <Ymaman@Nvidia.com>
> > > 
> > > Add support for P2P for MLX5 NIC devices with automatic fallback to
> > > standard DMA when P2P mapping fails.
> > 
> > That's now how the P2P API works.  You need to check the P2P availability
> > higher up.
> 
> How do you mean?
> 
> This looks OKish to me, for ODP and HMM it has to check the P2P
> availability on a page by page basis because every single page can be
> a different origin device.
> 
> There isn't really a higher up here...

The DMA API expects the caller to already check for connectability,
why can't HMM do that like everyone else?

