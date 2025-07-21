Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08459B0BD14
	for <lists+nouveau@lfdr.de>; Mon, 21 Jul 2025 08:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4915210E484;
	Mon, 21 Jul 2025 06:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="vYpHXEg9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E69910E484;
 Mon, 21 Jul 2025 06:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FpsdNncfl7Fn6zKa5KAn1qcGLHrA7rubnu/E/1G43iI=; b=vYpHXEg9pEu1FA2kUkaWCXV0K0
 nJYsJ3Y+pdkP151+s2eNi2zh3kWTgc6D4nBaOT8dl9jkeAe2z0BnuGbOfV5Q7rV49OFEOKlIEi4m/
 UlFmX1Fi/itPjIookMI3tKnVZ+YDzO02fHcLDY3BCFrpQ1eWeHD0A2xEJGNVHTati7lOx7KNKQiLO
 K38rVOjyQIXQ4GAHWZ5oeZ1Xrdyql/o9VTePgB+5HNSCNDgD20ULMvWTqUoPpY2Ot0N79wLc5Mnq1
 BKQrheY1HdIhK/KaPtsfAWFhJ8B9dj21ltsV23BiT1L1XI9MaqmtQ6e49tAV1SLkVyORBwavsCA0A
 dIgmTIiA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1udkUQ-0000000GRbM-0VEv;
 Mon, 21 Jul 2025 06:59:10 +0000
Date: Sun, 20 Jul 2025 23:59:10 -0700
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
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <aH3lPnIUGn29HJFo@infradead.org>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718115112.3881129-2-ymaman@nvidia.com>
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

On Fri, Jul 18, 2025 at 02:51:08PM +0300, Yonatan Maman wrote:
> From: Yonatan Maman <Ymaman@Nvidia.com>
> 
> hmm_range_fault() by default triggered a page fault on device private
> when HMM_PFN_REQ_FAULT flag was set. pages, migrating them to RAM. In some
> cases, such as with RDMA devices, the migration overhead between the
> device (e.g., GPU) and the CPU, and vice-versa, significantly degrades
> performance. Thus, enabling Peer-to-Peer (P2P) DMA access for device
> private page might be crucial for minimizing data transfer overhead.

You don't enable DMA for device private pages.  You allow discovering
a DMAable alias for device private pages.

Also absolutely nothing GPU specific here.

> +	/*
> +	 * Don't fault in device private pages owned by the caller,
> +	 * just report the PFN.
> +	 */
> +	if (pgmap->owner == range->dev_private_owner) {
> +		*hmm_pfn = swp_offset_pfn(entry);
> +		goto found;

This is dangerous because it mixes actual DMAable alias PFNs with the
device private fake PFNs.  Maybe your hardware / driver can handle
it, but just leaking this out is not a good idea.

> +		    hmm_handle_device_private(range, pfn_req_flags, entry, hmm_pfn))

Overly long line here.

