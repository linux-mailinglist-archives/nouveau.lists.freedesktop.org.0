Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CC1382D7A
	for <lists+nouveau@lfdr.de>; Mon, 17 May 2021 15:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E540E6E970;
	Mon, 17 May 2021 13:32:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A786E6E970
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621258368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7nzySJNfopFTe/zvqTJ6fpuCH+R3adj5DO3/cZKoXHU=;
 b=LLp0H0+Rh8jy//DdFziqcoIyhQVAlVPQC2u2oiiHQFvZvu8FHGE+nBujayi4vhn6///mQl
 DvIc1vTZX8Qz9+Nd4TkshkugAhek/iu16tMQVfeQwLVYXqke6qe8bLrPKb8PhsjxDimhR7
 v49BVYOrdl81Sng7TR+5HQiqRIWyL04=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95--9bJuC5uPEqb5pYSnanEEQ-1; Mon, 17 May 2021 09:32:46 -0400
X-MC-Unique: -9bJuC5uPEqb5pYSnanEEQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 o14-20020a05620a130eb02902ea53a6ef80so4732317qkj.6
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 06:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7nzySJNfopFTe/zvqTJ6fpuCH+R3adj5DO3/cZKoXHU=;
 b=SJFC5CKrGZ676XjK3RAsb7uCnED9gLZ2M13FqIgdDQLo8dIMXLSOu3m22rxbzMw0IQ
 SnKkfE2vIZIUw1wbPISLH86X0j8Xvt0Ax0WSvC4Pcyg83Q27bu7RN80yCjLP8XXezbBT
 23rQdmLEWfX3h/D6YX2RomKETlhLhtX/2812/dC0LAqLnjQbrG5MuXZ7XwKt3H2SVvvO
 CcFvTTMEjgowtSiplpI/n6T2NKPJmFlqD+tw8YNsRD3g/UBAne4bsMW50Idly4mHh3Zz
 o7B8a+DPiV9zQfOeZqneCsCLPHiYFavOCls6fu+AKPWI5hIIYjb+mQsXUfjRrY1a+4oS
 aChA==
X-Gm-Message-State: AOAM530oVf5Agm4LvUXCMXe4civH7WYMIlhtwhR55nfv0QI+lSH0VGm+
 3N55sV/vUuJYwKzDfk8yOmrE9yhZD2vgELrVTbNAAoaLaps6A0ktmLHsBqdgHQf6BqO8wwbhuRH
 cMptKa6B23JzIuFsOLaRyf3Us6w==
X-Received: by 2002:ad4:5112:: with SMTP id g18mr16281506qvp.26.1621258366398; 
 Mon, 17 May 2021 06:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4Hbg0dr7iVt3Lvy150G8W6ETZlfUeH/7kb5jeLKKFdZMIdmzt0B258o79RqahIafiVGaDlw==
X-Received: by 2002:ad4:5112:: with SMTP id g18mr16281486qvp.26.1621258366175; 
 Mon, 17 May 2021 06:32:46 -0700 (PDT)
Received: from dev ([2605:a601:a63d:7f01:3e3e:f81:8e8d:ad8a])
 by smtp.gmail.com with ESMTPSA id o12sm10493330qtg.14.2021.05.17.06.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 06:32:45 -0700 (PDT)
Date: Mon, 17 May 2021 09:32:44 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Thierry Reding <treding@nvidia.com>
Message-ID: <YKJwfJfES/LrJhgW@dev>
References: <20210511163553.2344244-1-kherbst@redhat.com>
 <YKIvusHWjax1dSqf@orome.fritz.box>
 <YKI1Bp3vD5RFTy7h@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <YKI1Bp3vD5RFTy7h@orome.fritz.box>
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 11:19:02AM +0200, Thierry Reding wrote:
> On Mon, May 17, 2021 at 10:56:29AM +0200, Thierry Reding wrote:
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
> > >  	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > >  	if (ret) {
> > > -		nouveau_bo_ref(NULL, &nvbo);
> > >  		return ret;
> > >  	}
> > 
> > Looking at the surrounding code, I wonder if I just managed to jumble
> > the cleanup paths for drm_gem_object_init() and nouveau_bo_init(). If
> > drm_gem_object_init() fails, I don't think it's necessary (though it
> > also doesn't look harmful) to call drm_gem_object_release().
> > 
> > However, if nouveau_bo_init() fails, then I think we'd still need to
> > call drm_gem_object_release(), to make sure to undo the effects of
> > drm_gem_object_init().
> > 
> > So I wonder if we need something like this instead:
> > 
> > --- >8 ---
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index c88cbb85f101..9b6055116f30 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -205,14 +205,13 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
> >  	 * to the caller, instead of a normal nouveau_bo ttm reference. */
> >  	ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
> >  	if (ret) {
> > -		drm_gem_object_release(&nvbo->bo.base);
> >  		kfree(nvbo);
> >  		return ret;
> >  	}
> >  
> >  	ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> >  	if (ret) {
> > -		nouveau_bo_ref(NULL, &nvbo);
> > +		drm_gem_object_release(&nvbo->bo.base);
> >  		return ret;
> >  	}
> >  
> > --- >8 ---
> > 
> > Thierry
> 
> Adding Jeremy for visibility.
> 

Admittedly I only skimmed the code so I'm not extremely confident in my
analysis, but isn't that handled by the nouveau_bo_del_ttm() callback
which should get called after the last reference is dropped with
nouveau_bo_ref?

- Jeremy

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
