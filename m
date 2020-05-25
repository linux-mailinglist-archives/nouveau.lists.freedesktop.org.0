Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 392AF1E0FA4
	for <lists+nouveau@lfdr.de>; Mon, 25 May 2020 15:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B8E88E07;
	Mon, 25 May 2020 13:41:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9814188E07
 for <nouveau@lists.freedesktop.org>; Mon, 25 May 2020 13:41:20 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id b6so17418907qkh.11
 for <nouveau@lists.freedesktop.org>; Mon, 25 May 2020 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gPDO3X5exveNuQB33sqGwYFDtLpn1MHpqh7qgx9Ds0U=;
 b=YWisdnilIhfDrM+E+SxMXaOOM3S8J0owofy6L63tPMKNlQpTOnDBXaJIGIpfLVuv8e
 RPwFtQIUH3v7EOrCTGWLmLB0H7YbUEomLIfmYte8O6ZPx64QjusgkIxmiTn0/Veefq7M
 pGEt8yH0t/vwgIpSl+RtDysE0yr6nJS4JK3YSde04NTeyPjZmiEOJpHUKytYk9YebMaP
 ZBwTqRWOlcbPbyxbCtPg/99VSLhwlIy3blfpxEsFWPNLZqUxUrAIQcRPOOcELjbAp/DY
 UMb0QDSHWVMTyUFW5IIroZvxqvroUZ4aOu//kLYALqNBVGf71IaS4QGAehurQ0LEWc+H
 VK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gPDO3X5exveNuQB33sqGwYFDtLpn1MHpqh7qgx9Ds0U=;
 b=BkH+GO/s/GObGc+uq4uTBTy/ACHPiw2DDbtB9BHDsWUVqHLAme7qD/UgeQHzj++094
 fjHO6vYjvVDoHLWfJh38658VVrkScyDFrJB24pT7fqj8sVuz0g0FZQ2Yf7ijG4HBJ2xe
 Pj+/hTJ/WdkHn2+eUE1h4q31t6q+sXa8yQKP0jiWTwExmOo3yr/6kCF+5iBixVanGurL
 WCK+Qljg5Nkc8XWmtPcLOhc88RPEMOVA0V+p13YniZMdVEv/dehbmGtmTLqevtUtHGMS
 JZbBAWqx/q8hgZF2u6zcROzw1QWLyFBAEzUvRbNK25SfXp0z5YU2RWzBq0/HIVAGmU/3
 LbrQ==
X-Gm-Message-State: AOAM533A50Ty+YdQph/T/J2zZ8qDEbUh6Zr+CrT5dM1ZRFtX80wkQ9dY
 JIZp3TTgSGaTBwVWPqJZ3SUdeg==
X-Google-Smtp-Source: ABdhPJztwwj2Lmnes/knDFhWm/x9ekYq2TGHNL3KtgNw4hZnEPBap7aZFzv7gZ3WmAGU8iH6kzNbLg==
X-Received: by 2002:a37:2dc4:: with SMTP id t187mr3763851qkh.166.1590414079640; 
 Mon, 25 May 2020 06:41:19 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id r15sm2718512qtt.42.2020.05.25.06.41.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 May 2020 06:41:19 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jdDLy-0000hA-Jv; Mon, 25 May 2020 10:41:18 -0300
Date: Mon, 25 May 2020 10:41:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200525134118.GA2536@ziepe.ca>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200508192009.15302-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Nouveau] [PATCH 0/6] nouveau/hmm: add support for mapping
 large pages
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
> hmm_range_fault() returns an array of page frame numbers and flags for
> how the pages are mapped in the requested process' page tables. The PFN
> can be used to get the struct page with hmm_pfn_to_page() and the page size
> order can be determined with compound_order(page) but if the page is larger
> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
> using a larger page size. To be fully general, hmm_range_fault() would need
> to return the mapping size to handle cases like a 1GB compound page being
> mapped with 2MB PMD entries. However, the most common case is the mapping
> size the same as the underlying compound page size.
> This series adds a new output flag to indicate this so that callers know it
> is safe to use a large device page table mapping if one is available.
> Nouveau and the HMM tests are updated to use the new flag.
> 
> Note that this series depends on a patch queued in Ben Skeggs' nouveau
> tree ("nouveau/hmm: map pages after migration") and the patches queued
> in Jason's HMM tree.
> There is also a patch outstanding ("nouveau/hmm: fix nouveau_dmem_chunk
> allocations") that is independent of the above and could be applied
> before or after.

Did Christoph and Matt's remarks get addressed here?

I think ODP could use something like this, currently it checks every
page to get back to the huge page size and this flag would optimze
that

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
