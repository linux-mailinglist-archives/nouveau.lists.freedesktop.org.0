Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A4B0BD20
	for <lists+nouveau@lfdr.de>; Mon, 21 Jul 2025 09:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CFAE10E486;
	Mon, 21 Jul 2025 07:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="FrQtjwJF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0693610E486;
 Mon, 21 Jul 2025 07:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AgLgPBRTNxxvHF8cSuGGdkujqZoQFY1bUgkbASNTV9k=; b=FrQtjwJFdTS0B8Kua0PIQIJwO4
 3Zk4OyGXroeJfhkGSdhFxSEBscp3zXhBhIQ6NwXrtxpbI60BKwSIZXQl+KtjCzhiJXmJFlaCgW5H6
 787Obg4n7axKxGI3qFCHvAQUEnqWrxbhqwrrQZ7WAkM4bp4H3/jz2k4IGrAPVCh0qP+LaA9JZFgDr
 jjEUKFcl8C3TQemByFLGJ1jsaQ7NovcnBV2OHT5r8P4osQ/hy1aidsCJhHekKhoWfD4Msh5vd/ph8
 axLv1bME8qKqnaZNCpYgUHNEjLQm9rPlsEFOVoq3Nv5r8+S0f7cDr5BgLpcKQstH+81zMrSB2v8cd
 PLo+MAmA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1udkW7-0000000GRux-455c;
 Mon, 21 Jul 2025 07:00:55 +0000
Date: Mon, 21 Jul 2025 00:00:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Yonatan Maman <ymaman@nvidia.com>
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Michael Guralnik <michaelgur@nvidia.com>,
 Or Har-Toov <ohartoov@nvidia.com>,
 Daisuke Matsuda <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>,
 linux-mm@kvack.org, linux-rdma@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v2 2/5] nouveau/dmem: HMM P2P DMA for private dev pages
Message-ID: <aH3lpyhdnCdZISK5@infradead.org>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-3-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718115112.3881129-3-ymaman@nvidia.com>
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

On Fri, Jul 18, 2025 at 02:51:09PM +0300, Yonatan Maman wrote:
> +	.get_dma_pfn_for_device = nouveau_dmem_get_dma_pfn,

Please don't shorten the method name prefix in the implementation
symbol name, as that makes reading / refactoring the code a pain.

This might also be a hint that your method name is too long.

