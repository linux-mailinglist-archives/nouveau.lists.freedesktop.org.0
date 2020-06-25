Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A85C20996B
	for <lists+nouveau@lfdr.de>; Thu, 25 Jun 2020 07:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312986E0B7;
	Thu, 25 Jun 2020 05:24:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26A6A6E0B7
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2020 05:24:00 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id y13so2138077ybj.10
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jun 2020 22:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GN+vwP6awwYeHuE8Nxiqbib4DkikNLChIdT3TjcmjCQ=;
 b=sZXf7Z4uTzNP+UaPk4pvsBCB6Gb0KK2NKJ2Uj2afN3SNByxwcpyOH5XIzCMP6mIA+2
 CnnbQis6REgQ7JqaCwg9MtoIc4rbrAKsfUI4rpxVIYPyMUze2M6Qaw+jHudWWiYl+/fS
 QgMlyLL7eXQ2fJGZU66vUqktic6M3Khz09xX4hocet+bGg2alfsUYEF8nHDEB0wXA0Gi
 6Z1h0KovhSdX62UmrEIfec1z0hlYhHrB3JpMUn9XxHdNNmWVq3FiFwDnJR5VEwaHLme/
 zPlzIWwt4FrIfTca7NMZAjrtEuib2Fe39kqHKoCc5TeZqurravOsZyu7zWqwtcccppkX
 twSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GN+vwP6awwYeHuE8Nxiqbib4DkikNLChIdT3TjcmjCQ=;
 b=t26ittyC4apLfHG4y2rb9BD8a4YfiLK7RN/rEyQioDBqr+5PWdX90oPw6zWFOz/sWf
 n6GvF4clNFN90ERQmxdCXXch05FcP//cDT0retEF3eKkb5xOM9nByY4fdHUdSyHQNcX9
 enjrVUJC1KtS6V1ECYIGQgDRt8m/5x9tB74L3sLrPhSZytbLxaP9tQrk/BBlPMe8osBW
 OvDvDvVB7Rr9M9FbZVA4SbE7HBhs76v9ER013VXYxxc0xJJaSh25IHiLCJauTmVWqDQh
 4QCyQ8gIFI3kxMwq9Srpee/Takzg71Mr720cQCQVBm3/5EnBWA/MqcWEadhnzqYBpr4H
 lVUQ==
X-Gm-Message-State: AOAM533LyJrqrw3o9NAE11KHLYL2xUBc5YI/PVE8/Jyd6Ek6s+h4LLK1
 M9oqICiSp3d80sS45h8BBomVB+YWYQwisrVV5vg=
X-Google-Smtp-Source: ABdhPJwFBExNOvnqSjcHjjCVFajvYo439vZFDatYszxkdzA35ELrTHJE0dawomj2kgWq9q2Xs7xI85GoF1jMKWsa2A8=
X-Received: by 2002:a5b:582:: with SMTP id l2mr45827370ybp.147.1593062639308; 
 Wed, 24 Jun 2020 22:23:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-2-rcampbell@nvidia.com>
 <53751f8e-d901-df2e-a2e0-1b1484b31b81@nvidia.com>
In-Reply-To: <53751f8e-d901-df2e-a2e0-1b1484b31b81@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 25 Jun 2020 15:23:48 +1000
Message-ID: <CACAvsv5NqqF704HyvTd6DH43-one06OO7Z=uENUS5RSOJzP8Jg@mail.gmail.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [Nouveau] [RESEND PATCH 1/3] nouveau: fix migrate page
 regression
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, 23 Jun 2020 at 10:51, John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 2020-06-22 16:38, Ralph Campbell wrote:
> > The patch to add zero page migration to GPU memory inadvertantly included
>
> inadvertently
>
> > part of a future change which broke normal page migration to GPU memory
> > by copying too much data and corrupting GPU memory.
> > Fix this by only copying one page instead of a byte count.
> >
> > Fixes: 9d4296a7d4b3 ("drm/nouveau/nouveau/hmm: fix migrate zero page to GPU")
> > Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > index e5c230d9ae24..cc9993837508 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > @@ -550,7 +550,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
> >                                        DMA_BIDIRECTIONAL);
> >               if (dma_mapping_error(dev, *dma_addr))
> >                       goto out_free_page;
> > -             if (drm->dmem->migrate.copy_func(drm, page_size(spage),
> > +             if (drm->dmem->migrate.copy_func(drm, 1,
> >                       NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
> >                       goto out_dma_unmap;
> >       } else {
> >
>
>
> I Am Not A Nouveau Expert, nor is it really clear to me how
> page_size(spage) came to contain something other than a page's worth of
> byte count, but this fix looks accurate to me. It's better for
> maintenance, too, because the function never intends to migrate "some
> number of bytes". It intends to migrate exactly one page.
>
> Hope I'm not missing something fundamental, but:
I'm actually a bit confused here too.  Because, it *looks* like the
function takes a byte count, not a page count, and unless I'm missing
something too, it's setup the copy class for a byte count also.

>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com
>
>
> thanks,
> --
> John Hubbard
> NVIDIA
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
