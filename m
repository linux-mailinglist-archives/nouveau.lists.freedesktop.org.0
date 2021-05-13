Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E9337FD30
	for <lists+nouveau@lfdr.de>; Thu, 13 May 2021 20:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6B06ED9D;
	Thu, 13 May 2021 18:22:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F5A6ED9D
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620930170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VvOcZV0DfqkTu/rJHQV1Nq/YahfJjzXI4+MW1lElfaw=;
 b=eAC9qlLB7zk2Yf9xsVAMgTxkILk2Mthx9RYpChiTs9BDHIf9hcOH6uMMaET+0a4Hn1VSR/
 QaRpBGH+9tU3jyhzK+rdOXDfl0G9bHAko4kZ5/BJu7a0tcFEIILq5+0g+O6WuJyzKexMwF
 kf3+su6k4QKvhJBmdBNEJZsYXTaoUKY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-JkzuAyAtNAW6wommET3hOA-1; Thu, 13 May 2021 14:22:48 -0400
X-MC-Unique: JkzuAyAtNAW6wommET3hOA-1
Received: by mail-qt1-f199.google.com with SMTP id
 e28-20020ac84b5c0000b02901cd9b2b2170so18504254qts.13
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 11:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VvOcZV0DfqkTu/rJHQV1Nq/YahfJjzXI4+MW1lElfaw=;
 b=OeMy+3wy08PvqmV4g1rsJK0Y+650Jx7SSy1MZ5Dp50OvSMYW4f18BzL94odxZrInts
 Z37ougYAnMqNRZC1Hb1mn+oETls1AGdOf4mIzvlo/GPWan2cK950RUaAh/EXK2u5X4eP
 sW7GJCX84MkmABd11XWCl7/U1hcKgKzRXaR64tBrycrU2aRC6779jVNAXXB3KZRBViIJ
 PiM7CHM5Yg2QJVOOrYZ/mzCl5/kKWGNrXO3QrkS7/NeEcZ1oS8mL1WSAwPmWeaC7hcnz
 YbwysJ7zNsiB9LZ26/rLgERvg5dGwOYHomyAuLOAhCxdEVD9Af7I/jthuhv6Brlj577v
 MsMw==
X-Gm-Message-State: AOAM530uTUoaoaQ+NXjqGAaQ/shihtCRhGLulMawGHYAkh7yMJkAPhk7
 i3XTHqR6MTqVKCG6tnrdnJO94TJRQQB5WH7iF9pZz/hBM7A5DgJX3oB3bnHLnASIBLDFZ0MPTC8
 0c/5hmSfxisD0hKenv896i5hDPQ==
X-Received: by 2002:a05:620a:13a6:: with SMTP id
 m6mr1468297qki.370.1620930167034; 
 Thu, 13 May 2021 11:22:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjZT9sHhR8v1oIasLisxYJc0TDJvLLaaXyrXmbrJzYqQxztjRBSfsjKiLcM02cmkObnyZvSQ==
X-Received: by 2002:a05:620a:13a6:: with SMTP id
 m6mr1468285qki.370.1620930166833; 
 Thu, 13 May 2021 11:22:46 -0700 (PDT)
Received: from dev ([2605:a601:a63d:7f01:3e3e:f81:8e8d:ad8a])
 by smtp.gmail.com with ESMTPSA id j29sm2846873qtv.6.2021.05.13.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 11:22:46 -0700 (PDT)
Date: Thu, 13 May 2021 14:22:44 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YJ1udEIGH+KK4tI1@dev>
References: <20210511163553.2344244-1-kherbst@redhat.com>
 <YJ1E+opCkn9STuAr@dev>
 <CACO55tveh2931qY8wCxm7ofH-iy0sj5V=08amDKyu8SAQUsxdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tveh2931qY8wCxm7ofH-iy0sj5V=08amDKyu8SAQUsxdA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH] nouveau/gem: fix user-after-free in
 nouveau_gem_new
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 07:37:40PM +0200, Karol Herbst wrote:
> On Thu, May 13, 2021 at 5:25 PM Jeremy Cline <jcline@redhat.com> wrote:
> >
> > On Tue, May 11, 2021 at 06:35:53PM +0200, Karol Herbst wrote:
> > > If ttm_bo_init fails it will already call ttm_bo_put, so we don't have to
> > > do it through nouveau_bo_ref.
> > >
> > > ==================================================================
> > > BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]
> > >
> > > Use-after-free write at 0x000000004dc4663c (in kfence-#44):
> > >  ttm_bo_put+0x11/0x40 [ttm]
> > >  nouveau_gem_new+0xc1/0xf0 [nouveau]
> > >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> > >  drm_ioctl_kernel+0xb2/0x100 [drm]
> > >  drm_ioctl+0x215/0x390 [drm]
> > >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> > >  __x64_sys_ioctl+0x83/0xb0
> > >  do_syscall_64+0x33/0x40
> > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > >
> > > kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=792, cache=kmalloc-1k] allocated by task 2657:
> > >  nouveau_bo_alloc+0x63/0x4c0 [nouveau]
> > >  nouveau_gem_new+0x38/0xf0 [nouveau]
> > >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> > >  drm_ioctl_kernel+0xb2/0x100 [drm]
> > >  drm_ioctl+0x215/0x390 [drm]
> > >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> > >  __x64_sys_ioctl+0x83/0xb0
> > >  do_syscall_64+0x33/0x40
> > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > >
> > > freed by task 2657:
> > >  ttm_bo_release+0x1cc/0x300 [ttm]
> > >  ttm_bo_init_reserved+0x2ec/0x300 [ttm]
> > >  ttm_bo_init+0x5e/0xd0 [ttm]
> > >  nouveau_bo_init+0xaf/0xc0 [nouveau]
> > >  nouveau_gem_new+0x7f/0xf0 [nouveau]
> > >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> > >  drm_ioctl_kernel+0xb2/0x100 [drm]
> > >  drm_ioctl+0x215/0x390 [drm]
> > >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> > >  __x64_sys_ioctl+0x83/0xb0
> > >  do_syscall_64+0x33/0x40
> > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> > >
> > > Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM object"
> > > Cc: Thierry Reding <treding@nvidia.com>
> > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > index c88cbb85f101..1165ff990fb5 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > > @@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
> > >
> > >       ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > >       if (ret) {
> > > -             nouveau_bo_ref(NULL, &nvbo);
> > >               return ret;
> > >       }
> > >
> >
> > I submitted a patch for this in the beginning of December, it got
> > reviewed and it's languished ever since[0]. It's frustrating that these
> > issues have to get fixed multiple times by multiple developers because
> > bug fixes (with reviews!) aren't being accepted.
> >
> > [0] https://lists.freedesktop.org/archives/nouveau/2020-December/037571.html
> >
> > Anyway, for whatever it's worth:
> >
> > Reviewed-by: Jeremy Cline <jcline@redhat.com>
> >
> 
> oh indeed... as the patches are equivalent I'd say we should merge
> yours and add my
> 
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
> 
> let's see if we can get it in this time *sigh*
> 

To be clear I don't care about the credit, accepting this patch is fine,
but I wanted to highlight how multiple developers are doing the same
work over and over because it seems nigh on impossible to get nouveau
kernel patches accepted.

- Jeremy

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
