Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E818847D
	for <lists+nouveau@lfdr.de>; Tue, 17 Mar 2020 13:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8E46E0EC;
	Tue, 17 Mar 2020 12:48:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98A6E0F2
 for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2020 12:47:58 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id w5so10708950qvp.11
 for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2020 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hGKwnunGHWWeSvJ9/XCv+nR79KkE26ubf6RE0d+GYLk=;
 b=PtubQYZSU9HgtWJjpFqwEdIYwtlB49Vs3D0G3zYORKcPGhEsIfZRIiROQOxddsRvWA
 RjAy+r9b/I8P2+0SEwcZEHsGUaxQE/qlu5dpc9kPAnznApNphxMVv4h20GpK+9p67yFs
 6hjcLG3hAAH3kBZTDZzuv6MILCdugULe8uRlXsNfw2yB//OumwIf2+qafVNvyuWJVzZk
 88vQy3I7t0nW6CNqJ8Lab2RMTtgH9hmh0oi4/hZaMDTe+VWad/wJZA4Ie452V4GsyVJG
 d7MvTYBDlTMGkbCUf2QQJe9saGpyKzd5K1BGve8IZKxbN0kyWBmlJs91ikMF2jJwlaJr
 0W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hGKwnunGHWWeSvJ9/XCv+nR79KkE26ubf6RE0d+GYLk=;
 b=fa9VPoUndPTUNgleLTZzUrFGLh3XrgH/PSjjqdQVMWnGDLQe74iOZVZ546SWC/f/jI
 WviBCJFNKQrTNtqzwsgGMeKvvSWzrzgLjn/h+CaxFhHVSh1sW98ysepB+xIReojbvbfr
 7tCJNj5bt+POK7dL6TKUCoWOU+PkpPpBvv9+YLR0JHFz0SChJMQe2TiN/QV6NGg8viCT
 rIf9AaM75W5wrbBQgUVFu72xxFpdAvUsYAAUIyfu0bBCNPiTJnAQlRuubLKuFvH6S1Pz
 CSmNQ5A63rIzNDKDMHrq38zZVQXvXYB8NiUo97Arcv6o24R7uxqiGG10spAR78RQqeVq
 Y/nQ==
X-Gm-Message-State: ANhLgQ2urHIES+k5vTQVz3Hwy2z55DAp6Nv7zzsOkdLJ7qGFmd5GR94j
 2l4Geu+vGoMsKBNCsJ8zWSAnRg==
X-Google-Smtp-Source: ADFU+vvumVznBXG0A6Iq3xCvezlrI9LHYhCJTZJg7hVXuURUfk1WF2tONVQteVKlbjpHyfZ+mfUmNQ==
X-Received: by 2002:a0c:ecc3:: with SMTP id o3mr4832950qvq.163.1584449277445; 
 Tue, 17 Mar 2020 05:47:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m65sm1863433qke.109.2020.03.17.05.47.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 17 Mar 2020 05:47:56 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jEBdT-0001XI-Q8; Tue, 17 Mar 2020 09:47:55 -0300
Date: Tue, 17 Mar 2020 09:47:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200317124755.GR20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca> <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317122813.GA11866@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 3/4] mm: simplify device private page handling
 in hmm_range_fault
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 01:28:13PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 01:24:45PM +0100, Christoph Hellwig wrote:
> > On Tue, Mar 17, 2020 at 09:15:36AM -0300, Jason Gunthorpe wrote:
> > > > Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> > > > look at the struct page but what if a driver needs to fault in a page from
> > > > another device's private memory? Should it call handle_mm_fault()?
> > > 
> > > Isn't that what this series basically does?
> > >
> > > The dev_private_owner is set to the type of pgmap the device knows how
> > > to handle, and everything else is automatically faulted for the
> > > device.
> > > 
> > > If the device does not know how to handle device_private then it sets
> > > dev_private_owner to NULL and it never gets device_private pfns.
> > > 
> > > Since the device_private pfn cannot be dma mapped, drivers must have
> > > explicit support for them.
> > 
> > No, with this series (and all actual callers before this series)
> > we never fault in device private pages.
> 
> IFF we want to fault it in we'd need something like this.  But I'd
> really prefer to see test cases for that first.

In general I think hmm_range_fault should have a mode that is the same
as get_user_pages in terms of when it returns a hard failure, and
generates faults. AFAIK, GUP will fault in this case?

I need this for making ODP use this API. ODP is the one that is highly
likely to see other driver's device_private pages and must have them
always fault to CPU.

> diff --git a/mm/hmm.c b/mm/hmm.c
> index b75b3750e03d..2884a3d11a1f 100644
> +++ b/mm/hmm.c
> @@ -276,7 +276,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  		if (!fault && !write_fault)
>  			return 0;
>  
> -		if (!non_swap_entry(entry))
> +		if (!non_swap_entry(entry) || is_device_private_entry(entry))
>  			goto fault;

Yes, OK,  makes sense.

I've been using v7 of Ralph's tester and it is working well - it has
DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
you able?

This hunk seems trivial enough to me, can we include it now?

Thanks,
Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
