Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3B9B0A684
	for <lists+nouveau@lfdr.de>; Fri, 18 Jul 2025 16:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE8610E9CA;
	Fri, 18 Jul 2025 14:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Kvz1qmlF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C658810E9CA
 for <nouveau@lists.freedesktop.org>; Fri, 18 Jul 2025 14:44:44 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-4ab63f8fb91so19757171cf.0
 for <nouveau@lists.freedesktop.org>; Fri, 18 Jul 2025 07:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1752849884; x=1753454684; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/JlY6wrS7xoiZAd1n9VylKL/5klHKuhmeV2q/x+jhjE=;
 b=Kvz1qmlFXJcGhkj8n7dItecjsd+khBrg2A9Hr7a2msVtHgQps8+D1Pd3gV0S1Jp7Gs
 rgS+x1EEPqOHk7SbhuYuwmHLfsPa12/fnSWY50ORdHifDpOJxls+Na7RThFCutjXTu9W
 kf0+DzEJHPYksEIK67PYFDAAy63DK7dcjPxTk396330SSDNA2fdxBz2J7pSZdvxH9YEK
 ZF+3Pec2G+uwhNJUcm4YxYUBYcYOz0FWsmIisStP25i6IQ0m4A0K/vl5W+Qw70Li8l+9
 fbYXj5hqWkT3JAoFyqv2pnrbuFMTETHbDqX5cu2HwTIaN2sjO9hn2sRvXyv7fCjJyLeU
 W0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752849884; x=1753454684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/JlY6wrS7xoiZAd1n9VylKL/5klHKuhmeV2q/x+jhjE=;
 b=NbmWPOiY6VHZAtkih8QFst4W23NEGozNrnVqEzL4oCaSJsgys14oK+LT17hA62DZ1D
 9C2AncTzQt/+Ut3EjO0T41JweVewcHDsWMDgmPxETd3Q/PSJyGhLWNhMowJJV6ku563N
 I0qmJLRbyK0uS2kaciY6Go0RkOyqd2SNTQemOMyeUz6JL8fYo8OoXPGTrdcbU6sLTHOF
 44tbjqQrUkGFDbgBH6T7hd8OYLJJ5KC8sDbQ82gddpq22GbRBMw0rDU0W7UPPmvfdGrc
 QpkHRk9bSz3BhMbz08r944Ui0vRf2qAX3zbj7RENGKm8/FPB2CTNa+R4Fkh6Ozo1VnvV
 z1nQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYW+2+mP9TNJigLLrwTa74smyz8KvVqjz4Qucg/jM04crWtducBOE7iYl9SvPtnGtrDw2J8Ihz@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0n5gX2CjxnE+Q1PJAp7S+m4V+MSuPlESjXRJLGr5T7KD13ixL
 iViX3BB6YaCdRogbWYj+74K+vdyGn72m9X3qI3hGyPpPdnSoU27dfNrRAvhR9GL8KRM=
X-Gm-Gg: ASbGncu2NWsztceDU8l2o/ecQb0S15kf4hQC8Q78hzKfT9H6vIIaIN/FXV7FCvD1G33
 hB5CAdWJIpNLh0m8eQ4JaDkgmaSsi1ncFmbQDVMu+WcXcYHVuXPEfEno/ph+hsq/n4y0U1J/1t/
 ATZFsGC7AuN/cDAyFK1ZwoCHAzqdjCEyPq0ybugQRYY42Kr7UiFjbM2Ye3A2N5ZlOpsG6b+db3d
 QXVLbgJrjs/Iq6mudHINoDEl16tlV9hxlLMF0na/Y2u1KOWMsHSgw3aRa1qheHlbdjqtGFkR2/6
 5C2N6TXKs+ZmJXB5IGLT4cauv2Z9ZojIsmuKT47mJ6agxblzstVXChQq5PJ9bG0Q4MohIUSmKcp
 87NtKU2o/usLzACpfS262bknjKwi1h8B9sw114mZI9m3abQjsoWh8Sj/bj+iO0Q/hLm3HZ3XAro
 4QywAz1dPH
X-Google-Smtp-Source: AGHT+IEYd5qGIZ9KDhfEstxE616f9xXLY8QoZsrjUpURE5IRjE2GiKRGVckhayOKGta9pjoTuDB7PQ==
X-Received: by 2002:a05:622a:1448:b0:4a9:cff3:68a2 with SMTP id
 d75a77b69052e-4ab93d88915mr157868681cf.37.1752849883674; 
 Fri, 18 Jul 2025 07:44:43 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.167.56.70]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-7051b8c04fdsm8211446d6.15.2025.07.18.07.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 07:44:43 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1ucmKI-00000009zcK-2UVK;
 Fri, 18 Jul 2025 11:44:42 -0300
Date: Fri, 18 Jul 2025 11:44:42 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Matthew Wilcox <willy@infradead.org>
Cc: Yonatan Maman <ymaman@nvidia.com>,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
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
Subject: Re: [PATCH v2 1/5] mm/hmm: HMM API to enable P2P DMA for device
 private pages
Message-ID: <20250718144442.GG2206214@ziepe.ca>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
 <20250718115112.3881129-2-ymaman@nvidia.com>
 <aHpXXKTaqp8FUhmq@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHpXXKTaqp8FUhmq@casper.infradead.org>
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

On Fri, Jul 18, 2025 at 03:17:00PM +0100, Matthew Wilcox wrote:
> On Fri, Jul 18, 2025 at 02:51:08PM +0300, Yonatan Maman wrote:
> > +++ b/include/linux/memremap.h
> > @@ -89,6 +89,14 @@ struct dev_pagemap_ops {
> >  	 */
> >  	vm_fault_t (*migrate_to_ram)(struct vm_fault *vmf);
> >  
> > +	/*
> > +	 * Used for private (un-addressable) device memory only. Return a
> > +	 * corresponding PFN for a page that can be mapped to device
> > +	 * (e.g using dma_map_page)
> > +	 */
> > +	int (*get_dma_pfn_for_device)(struct page *private_page,
> > +				      unsigned long *dma_pfn);
> 
> This makes no sense.  If a page is addressable then it has a PFN.
> If a page is not addressable then it doesn't have a PFN.

The DEVICE_PRIVATE pages have a PFN, but it is not usable for
anything.

This is effectively converting from a DEVICE_PRIVATE page to an actual
DMA'able address of some kind. The DEVICE_PRIVATE is just a non-usable
proxy, like a swap entry, for where the real data is sitting.

Jason

