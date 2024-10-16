Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F1D9A0EC0
	for <lists+nouveau@lfdr.de>; Wed, 16 Oct 2024 17:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D42710E03D;
	Wed, 16 Oct 2024 15:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="K9sSdFEr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953C210E03D
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2024 15:44:31 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-46098928354so2053881cf.1
 for <nouveau@lists.freedesktop.org>; Wed, 16 Oct 2024 08:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1729093470; x=1729698270; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WQGH0HVIW9SU96PYTPyuC1ydSkg4GgQM+hqbTFWgoGo=;
 b=K9sSdFEr8xRPpQrCxA8mpwoTrjQMLHY8Yx++laaN8zuslRsUzAQBY0S3Mhx6OPIMBh
 Jeim61d4rvwm/WlU66iO6cJhVQG7FW5cLl39ObT/H0T1sl1k9PXyT0sOAH5CzpgE2klI
 OXds/CmweSGYFF018MR2vkosj0uSE4wlqUf7QYxf410EwiDGzU4ip+ZjXUjKuwwP/KU0
 xOBOpTx9rbqWSrqrW3Kd8M1PdOamN/kLaVNOkn7t9Ka0pY27A5sBAD+TqBIs119xB46f
 gMHsm8TrIfgjRtbBso7a5HhAoshKvllz4oEbiIzzqZPV1PzuSXDEFS60qvJ17V4yxQzc
 kFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729093470; x=1729698270;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQGH0HVIW9SU96PYTPyuC1ydSkg4GgQM+hqbTFWgoGo=;
 b=T/jvaWLMnX8Xs/XMdp6s0F+xuEDhn8F/kHwsq7JuicrHe+E9KS2OzUzs8UYZtu67dD
 TkOO/tFFdVBlJu3jzI81NUyUF6bq1G6m5WyOS9ZyOm3LBNWBtFie5FG07vm7YjE/I1rx
 HoRIcdZlXJue8FKcVr/HUAIT0x29JzZMj6OiSwLIgx5IbdHTCIWrGNIU0JWXeZUBR9Zm
 caSM/tnqytrD93eyBun3UM3ASySQAZoKYCY6cjf0DJM4wCzFetJWOePNKWUnHoEw0ozw
 a7xO1t/tCuHTQFePHgFhZUCl2J2Ct58nJyI50vOzmv9YKbRN5iKQj+V+2h6i9ZebzqoI
 PyGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs7UiBM5JpwUkYFD4dohoEPZDpb+FcD0kNrSpyfGGcbTSKe7sAoHwwavAkFuNmu1ry1szwh2dU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuF+76f3NCLr5LRDo0+pihY9gePHnwcniIpE7Y64wDD4Lwe52N
 +IDJ3HYCR+yJhmz8dTV6gUAz/wsMLb+wgEmj+K9cD62WSD8FrNb4l3pG7MbwtIw=
X-Google-Smtp-Source: AGHT+IHphNZzLqFYrOFx7/ySDq7sBcTOs9Dks5qU/HFioLD65ljv8EK1dQjanMksDh9hLfIE6iUrIw==
X-Received: by 2002:a05:622a:2608:b0:458:4bc9:e949 with SMTP id
 d75a77b69052e-46058424bc2mr231836401cf.22.1729093470391; 
 Wed, 16 Oct 2024 08:44:30 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.128.5]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4607b0a6760sm18990161cf.6.2024.10.16.08.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 08:44:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1t16CK-000COv-F5;
 Wed, 16 Oct 2024 12:44:28 -0300
Date: Wed, 16 Oct 2024 12:44:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com,
 dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
 leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, apopple@nvidia.com,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Message-ID: <20241016154428.GD4020792@ziepe.ca>
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <Zw9F2uiq6-znYmTk@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw9F2uiq6-znYmTk@infradead.org>
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

On Tue, Oct 15, 2024 at 09:49:30PM -0700, Christoph Hellwig wrote:

> > +	/*
> > +	 * Used for private (un-addressable) device memory only. Return a
> > +	 * corresponding struct page, that can be mapped to device
> > +	 * (e.g using dma_map_page)
> > +	 */
> > +	struct page *(*get_dma_page_for_device)(struct page *private_page);
> 
> We are talking about P2P memory here.  How do you manage to get a page
> that dma_map_page can be used on?  All P2P memory needs to use the P2P
> aware dma_map_sg as the pages for P2P memory are just fake zone device
> pages.

FWIW, I've been expecting this series to be rebased on top of Leon's
new DMA API series so it doesn't have this issue.. I think this series
is at RFC quality, but shows more of the next steps.

I'm guessing they got their testing done so far on a system without an
iommu translation?

> which also makes it clear that returning a page from the method is
> not that great, a PFN might work a lot better, e.g.
> 
> 	unsigned long (*device_private_dma_pfn)(struct page *page);

Ideally I think we should not have the struct page * at all through
these APIs if we can avoid it..

Jason
