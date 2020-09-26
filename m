Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F479279B59
	for <lists+nouveau@lfdr.de>; Sat, 26 Sep 2020 19:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6696E21D;
	Sat, 26 Sep 2020 17:26:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E95E96E038
 for <nouveau@lists.freedesktop.org>; Sat, 26 Sep 2020 15:30:49 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a12so5487498eds.13
 for <nouveau@lists.freedesktop.org>; Sat, 26 Sep 2020 08:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NyijGOIcOg0IQ8xJ7tRK9WXb8VbwFr7joS3ngRxTFtY=;
 b=IgNtiCGTIRw+9Jq9+OugAEUgOtWjA8eNb9N0lGKIZhSzq8+Nq6i8p6dAPgDSw3WCu5
 5zLCQcy1nGd484dN8MEuuVSYHqucVtHjEfU81Ws4/lYX/HOp4JbMrZzXbrOql6BtdQAy
 +hEnD/Pr6tT/viPh9YkxxEEc7eplb0NwJB92c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NyijGOIcOg0IQ8xJ7tRK9WXb8VbwFr7joS3ngRxTFtY=;
 b=WvYeWsOO+TvGuNKC2hhh4io4ISfG290kL2dOW/wgRyJnrJppVsS53SSpc8XEqdqz78
 pvcrVmpSDrob4/Q+3Vqdod56Onkf6dUNGIQF7EKnioAhzN6sSgf5XLzQ0UhMgtJBDssg
 lvFmTZvWuLTV0ZMNxxJeoNEqBv7dc48iW6wLVEnPa6ytSBhrTfu05vUC5uUpdxDiowqc
 QiJB6lkOaBnKlNS6Gp7ghtPt71tUkZnxPi02Ka2mVcOhfyICpxdjAiwpezPtbIooiIhD
 qZe4fYltm3/3V556S1I+bsQGbme46tU/d/0p/G3wip0hOyhVUDEoffWe5iRvYDtYphmC
 XQmw==
X-Gm-Message-State: AOAM532dv2E9xom5c4YZQBs0A0xd6zu3xIc2Mm7W+fyPYAdYNn+KWQxY
 Mbb7ULf7HgGvlF+BEWsdK//NpS1MbHeFOp1R
X-Google-Smtp-Source: ABdhPJyRDvqLdFKkrsAyxKhZRp+8pFuaMPHb9evNYyGqlQHk9dL20SxtMg3oDnPZ/aNgRg8r0dm94A==
X-Received: by 2002:aa7:dcd9:: with SMTP id w25mr6781875edu.280.1601134248382; 
 Sat, 26 Sep 2020 08:30:48 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42])
 by smtp.gmail.com with ESMTPSA id bx24sm4373582ejb.51.2020.09.26.08.30.48
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 08:30:48 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id e11so1434472wme.0
 for <nouveau@lists.freedesktop.org>; Sat, 26 Sep 2020 08:30:48 -0700 (PDT)
X-Received: by 2002:a7b:c925:: with SMTP id h5mr2968012wml.28.1601133943201;
 Sat, 26 Sep 2020 08:25:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-18-hch@lst.de>
 <20200925184622.GB3607091@chromium.org> <20200926141428.GB10379@lst.de>
In-Reply-To: <20200926141428.GB10379@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Sat, 26 Sep 2020 17:25:27 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CjSKswdc3qOEZy73cyYJ9kfaXsSFyxkOHA+buh-J12UA@mail.gmail.com>
Message-ID: <CAAFQd5CjSKswdc3qOEZy73cyYJ9kfaXsSFyxkOHA+buh-J12UA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Sat, 26 Sep 2020 17:26:05 +0000
Subject: Re: [Nouveau] [PATCH 17/18] dma-iommu: implement ->alloc_noncoherent
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
Cc: alsa-devel@alsa-project.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Sep 26, 2020 at 4:14 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Sep 25, 2020 at 06:46:22PM +0000, Tomasz Figa wrote:
> > > +static void *iommu_dma_alloc_noncoherent(struct device *dev, size_t size,
> > > +           dma_addr_t *handle, enum dma_data_direction dir, gfp_t gfp)
> > > +{
> > > +   if (!gfpflags_allow_blocking(gfp)) {
> > > +           struct page *page;
> > > +
> > > +           page = dma_common_alloc_pages(dev, size, handle, dir, gfp);
> > > +           if (!page)
> > > +                   return NULL;
> > > +           return page_address(page);
> > > +   }
> > > +
> > > +   return iommu_dma_alloc_remap(dev, size, handle, gfp | __GFP_ZERO,
> > > +                                PAGE_KERNEL, 0);
> >
> > iommu_dma_alloc_remap() makes use of the DMA_ATTR_ALLOC_SINGLE_PAGES attribute
> > to optimize the allocations for devices which don't care about how contiguous
> > the backing memory is. Do you think we could add an attrs argument to this
> > function and pass it there?
> >
> > As ARM is being moved to the common iommu-dma layer as well, we'll probably
> > make use of the argument to support the DMA_ATTR_NO_KERNEL_MAPPING attribute to
> > conserve the vmalloc area.
>
> We could probably at it.  However I wonder why this is something the
> drivers should care about.  Isn't this really something that should
> be a kernel-wide policy for a given system?

There are IOMMUs out there which support huge pages and those can
benefit *some* hardware depending on what kind of accesses they
perform, possibly on a per-buffer basis. At the same time, order > 0
allocations can be expensive, significantly affecting allocation
latency, so for devices which don't care about huge pages anyone would
prefer simple single-page allocations. Currently the drivers know the
best on whether the hardware they drive would care. There are some
decision factors listed in the documentation [1].

I can imagine cases where drivers could not be the best to decide
about this - for example, the workload could vary depending on the
userspace or a product decision regarding the performance vs
allocation latency, but we haven't seen such cases in practice yet.

[1] https://www.kernel.org/doc/html/latest/core-api/dma-attributes.html?highlight=dma_attr_alloc_single_pages#dma-attr-alloc-single-pages

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
