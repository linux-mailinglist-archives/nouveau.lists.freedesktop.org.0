Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D317C209977
	for <lists+nouveau@lfdr.de>; Thu, 25 Jun 2020 07:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484836E1A5;
	Thu, 25 Jun 2020 05:25:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E856E1A5
 for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2020 05:25:16 +0000 (UTC)
Received: by mail-yb1-xb41.google.com with SMTP id d13so2147465ybk.8
 for <nouveau@lists.freedesktop.org>; Wed, 24 Jun 2020 22:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I1M8fJ0FCnOMntV70VPwyXOwsOWPRieVnDXWWBkV3kw=;
 b=bH/jGypyE1zLUM2BzGbRZ+mL9qES7p2JsAFtpu5w5rE08w0/89Pnb6xPSN2garomn6
 R0Gt+tpJgOSkD9T74ZhQGnWBjgfS9q8iiEP7/CfpsFBEa5Uc3Fol4pVXEv4JR1qp6HPu
 xvvl4RRZ61cUGBHq46nfQdGfPyc7cxX5Q7GnMqv0+ods4OQROyUmfwUJx3hyAQhg5iSQ
 EizCXC2GFVb1ENVkJDCpaHpA9Vaz1TMaM05C/UDOl5XTh0/HzPfKtOe8v7fkG1n0m/Bh
 5s/MZrzRpZ6i9WtBatEtQ9G6MaE71rnkJ65k+q2Tpj/VXVsEX6rEWu6YGQ5W3UajXqjM
 7vbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I1M8fJ0FCnOMntV70VPwyXOwsOWPRieVnDXWWBkV3kw=;
 b=ddKwdKwQ6DDW0h9AF+Td7DeDDGpwhdUHMveNkXf8OjcNk9n9UAKPoeCiiO2xYpzTr9
 Sz0eVNtDS/eIFiS2Gs5ZkgP2lGLpkYfu0TxB0oYp/JLrIoDHS5j8MDJNh8nfi+4Zt28I
 /Smk7IFmHmMxjZTZYfJaM1cPFCbVkn9x1DB/ErvuDNs6PMidue/m03Thlioivn2QNih1
 Nrt58ISBPuxeEVjTT5mqBuj/I5RpgA59V+n//O1cQlpjM0O0NMVUR3no5I41w8g9sItf
 +5Ru4NxZDDVHgrcgNnJ97FrtUgfUwI1bO2e3ZJz4VcslB8M7qYbjgr/REGcgH3lG7UZ1
 IU6g==
X-Gm-Message-State: AOAM530MmZ2Kb5VoEOGI8t6b+NbC2RR1uDKy2SbNkTLsqh5lkIzHTRkS
 n1MYgpfSQhZ0U50ZK+dQ+jUjPUClwlJmSPh8WnM=
X-Google-Smtp-Source: ABdhPJw7ZFJyA2mTuN2nynWCKPET3/NaIg+hFTh9bauwWQt500TZj9ueHtwWFzh19zkWupDS8iOIi1R9z6ugEJyArgs=
X-Received: by 2002:a5b:2c7:: with SMTP id h7mr49120445ybp.162.1593062715465; 
 Wed, 24 Jun 2020 22:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-2-rcampbell@nvidia.com>
 <53751f8e-d901-df2e-a2e0-1b1484b31b81@nvidia.com>
 <CACAvsv5NqqF704HyvTd6DH43-one06OO7Z=uENUS5RSOJzP8Jg@mail.gmail.com>
In-Reply-To: <CACAvsv5NqqF704HyvTd6DH43-one06OO7Z=uENUS5RSOJzP8Jg@mail.gmail.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 25 Jun 2020 15:25:04 +1000
Message-ID: <CACAvsv6x5PPjFcpz0VD1e6PcXhJ9ENkOr1p=X4dFarJ-OF-Wvw@mail.gmail.com>
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

On Thu, 25 Jun 2020 at 15:23, Ben Skeggs <skeggsb@gmail.com> wrote:
>
> On Tue, 23 Jun 2020 at 10:51, John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > On 2020-06-22 16:38, Ralph Campbell wrote:
> > > The patch to add zero page migration to GPU memory inadvertantly included
> >
> > inadvertently
> >
> > > part of a future change which broke normal page migration to GPU memory
> > > by copying too much data and corrupting GPU memory.
> > > Fix this by only copying one page instead of a byte count.
> > >
> > > Fixes: 9d4296a7d4b3 ("drm/nouveau/nouveau/hmm: fix migrate zero page to GPU")
> > > Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > index e5c230d9ae24..cc9993837508 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> > > @@ -550,7 +550,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
> > >                                        DMA_BIDIRECTIONAL);
> > >               if (dma_mapping_error(dev, *dma_addr))
> > >                       goto out_free_page;
> > > -             if (drm->dmem->migrate.copy_func(drm, page_size(spage),
> > > +             if (drm->dmem->migrate.copy_func(drm, 1,
> > >                       NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
> > >                       goto out_dma_unmap;
> > >       } else {
> > >
> >
> >
> > I Am Not A Nouveau Expert, nor is it really clear to me how
> > page_size(spage) came to contain something other than a page's worth of
> > byte count, but this fix looks accurate to me. It's better for
> > maintenance, too, because the function never intends to migrate "some
> > number of bytes". It intends to migrate exactly one page.
> >
> > Hope I'm not missing something fundamental, but:
> I'm actually a bit confused here too.  Because, it *looks* like the
> function takes a byte count, not a page count, and unless I'm missing
> something too, it's setup the copy class for a byte count also.
No, nevermind.. I was looking at nvc0b5_migrate_clear() :)

>
> >
> > Reviewed-by: John Hubbard <jhubbard@nvidia.com
> >
> >
> > thanks,
> > --
> > John Hubbard
> > NVIDIA
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
