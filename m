Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EAF1E8BE0
	for <lists+nouveau@lfdr.de>; Sat, 30 May 2020 01:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944A6E987;
	Fri, 29 May 2020 23:24:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0E96E987
 for <nouveau@lists.freedesktop.org>; Fri, 29 May 2020 23:24:52 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id b27so3868186qka.4
 for <nouveau@lists.freedesktop.org>; Fri, 29 May 2020 16:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NGBn/AuzNZpYdh5SlPF2DkI93ztTCm2iyZ9aPkUohiY=;
 b=IKwS+7d7WuYKZu+Q4GbtHw2D0LkjSL5A7lbo392iOd2v43Z52P0dFEEYFCiMEnQ/56
 qHXRFTF3iYnEeR12Gy6AN1N5Ko5uNF6SGa8LgjOUNf8ofjtnodQ2Wa/NwtsqJSS9TAys
 Gg2F/FQkn7AKIU6PXRK/IbsFEIAuxiMa6Q3VFGdqW0PKTMO71Ulqc96eqRatHrZT+job
 CmB7I7tKfzmPXdiHFwtNNVdIZthAMoYLj8buxmbD42FxW/NSzvPxiyagJjl2OyvsdhpD
 S5MOG5N3YQf1bbr8iJo0die/KuV0BMoW3Ysy/3VNSMrpD8wNAee0a8qz06MN/4Fpt6fO
 lZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NGBn/AuzNZpYdh5SlPF2DkI93ztTCm2iyZ9aPkUohiY=;
 b=AR3Dcuj+/AgY82XblRTPYm2o8ZB/l64/LqzVe3lHsjayfNSOal0j/ma9SPjiNMRocX
 xR2UgxDqyf17Luo/vhVEqsj97NJMaHRQF5lRbftazy3iWqPfYPwv57hczhffD6YzbCFv
 88sR5mwpChbG9SK7GNrd8McX2lSw4aS6EbvnSwdZJ4rjCCC4w+xzX9qTasfj3AjhdMDn
 GVITgoAjDkYcw7V8fuactx8ID9gGzC8Bd9Fwvx4BtTqApDx/RxR7GMzDLvOkFVnN4/M0
 //fYjnWB+cjxSqfxVmnGkcj3hxSC/6wGV2ymJPu94Y/+5zFTKfSL+I6Me/0mKcZqFAIF
 NV4g==
X-Gm-Message-State: AOAM531a4NUgi2KbOVUrDjkDsd/ny97SO6csJrFoi4CL/Y8JN7MkE2vB
 15TP1OyeS3Y6MDs9ktkkzXv3ctsxcdA=
X-Google-Smtp-Source: ABdhPJzKrllspgHFufnfAlSPKJ28Ce9a8Ik5xQzMRPQlXECpMQP4AXzw/tDE7D+9+tIgrQIxQDZLBQ==
X-Received: by 2002:a05:620a:102c:: with SMTP id
 a12mr10189193qkk.214.1590794691029; 
 Fri, 29 May 2020 16:24:51 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id h19sm3668912qkl.49.2020.05.29.16.24.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 May 2020 16:24:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jeoMr-0000gH-PQ; Fri, 29 May 2020 20:24:49 -0300
Date: Fri, 29 May 2020 20:24:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200529232449.GC21651@ziepe.ca>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200525134118.GA2536@ziepe.ca>
 <4743ec6e-a5a0-16ac-a1b8-992f851515f0@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4743ec6e-a5a0-16ac-a1b8-992f851515f0@nvidia.com>
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

On Tue, May 26, 2020 at 10:32:48AM -0700, Ralph Campbell wrote:
> 
> On 5/25/20 6:41 AM, Jason Gunthorpe wrote:
> > On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
> > > hmm_range_fault() returns an array of page frame numbers and flags for
> > > how the pages are mapped in the requested process' page tables. The PFN
> > > can be used to get the struct page with hmm_pfn_to_page() and the page size
> > > order can be determined with compound_order(page) but if the page is larger
> > > than order 0 (PAGE_SIZE), there is no indication that the page is mapped
> > > using a larger page size. To be fully general, hmm_range_fault() would need
> > > to return the mapping size to handle cases like a 1GB compound page being
> > > mapped with 2MB PMD entries. However, the most common case is the mapping
> > > size the same as the underlying compound page size.
> > > This series adds a new output flag to indicate this so that callers know it
> > > is safe to use a large device page table mapping if one is available.
> > > Nouveau and the HMM tests are updated to use the new flag.
> > > 
> > > Note that this series depends on a patch queued in Ben Skeggs' nouveau
> > > tree ("nouveau/hmm: map pages after migration") and the patches queued
> > > in Jason's HMM tree.
> > > There is also a patch outstanding ("nouveau/hmm: fix nouveau_dmem_chunk
> > > allocations") that is independent of the above and could be applied
> > > before or after.
> > 
> > Did Christoph and Matt's remarks get addressed here?
> 
> Both questioned the need to add the HMM_PFN_COMPOUND flag to the
> hmm_range_fault() output array saying that the PFN can be used to get the
> struct page pointer and the page can be examined to determine the page size.
> My response is that while is true, it is also important that the device only
> access the same parts of a large page that the process/cpu has access to.
> There are places where a large page is mapped with smaller page table entries
> when a page is shared by multiple processes.
> After I explained this, I haven't seen any further comments from Christoph
> and Matt. I'm still looking for reviews, acks, or suggested changes.

Okay, well, we reached the merge window, so since there may be some
conflicts repost again in three weeks.

It would be more compelling if there was some performance data if it
is much of a win vs the 'compute large page' algorithm something like
ODP uses.

Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
