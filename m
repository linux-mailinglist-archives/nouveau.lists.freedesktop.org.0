Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0F7382C15
	for <lists+nouveau@lfdr.de>; Mon, 17 May 2021 14:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D196A6E949;
	Mon, 17 May 2021 12:28:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827446E949
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 12:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621254507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vfPmasSXlbc68Q5HKH2tpVKWrekLoesFztlvho+RFl4=;
 b=J1QGYDiLarA4o+l2hu0QiERyjqlLk5UwhKvO3jMeXR077MC8rFOqIDooBY5NbmwgIsKtVF
 OYZ1rvggOmSKAMI5h0NVYrdzbVU1g+Yu0F8ymwNI4z8EnEKUy1PGv7shP2l2+vO4EDK9kQ
 oGiwnQFa1VYhcn4XpD5YbijOMDSTrSk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-M0tj8n0eNOOxLnQuiC3vCw-1; Mon, 17 May 2021 08:28:25 -0400
X-MC-Unique: M0tj8n0eNOOxLnQuiC3vCw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r15-20020a05600c35cfb029017373d9f318so1348022wmq.4
 for <nouveau@lists.freedesktop.org>; Mon, 17 May 2021 05:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfPmasSXlbc68Q5HKH2tpVKWrekLoesFztlvho+RFl4=;
 b=GHt9IFyqgir2mTSm2BymDI+2bcaRwZEvGBFUGs312GojtV18qRbCRBa9NekDOAImyF
 JvJ4FZxnVrsj1BhdWfewVWAu5cjv2brFupYrAMrha0QvR7Jx62BS0gmavI64o0HcOyeL
 FwHkpHidkSBQlU+ESWm+Dwk6Ab6Yg7Gh5IqAr/UdJuMIvT88aDmOqI04ZBtOuBjWt54i
 /cdVOPKvjyI/a6mUWu928tFNm9JhYlXgmbV+dVyLPVQPf1ZNJzNhnisfYG+/+JqM5jvh
 gJvADt3dFm4Ye2ktIkv/fs4BecpQXX0/CZvjlkgHXXK+XRKO4600aZ5HFpsUJxOq0PE+
 mZVA==
X-Gm-Message-State: AOAM533fkBU5F1fAoiYPm1R4aV+wbWCCPjNNMyLQyYGCE9pHWEfHJlOD
 HkuSQx+O3gPCqWhQwf2LLf1bF3E5OuV7U5qq+XDyK0Z2MKYQAISXd5Xm4kP808DgvJ8IVIPvQKZ
 Sof9eUtVjRY+sF2d3+yXIPDiv1AG8UMVXvD+pzxwzQg==
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr23075564wmr.139.1621254504552; 
 Mon, 17 May 2021 05:28:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPEan2bPWCv+LQZ0A3ajY84Aj0dgXkDPuTaQZo5psIC9jprcnFZja+Cg+4aEwcnAg357lUl2L+KeR8I7hEzTQ=
X-Received: by 2002:a05:600c:3796:: with SMTP id
 o22mr23075545wmr.139.1621254504334; 
 Mon, 17 May 2021 05:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210511163553.2344244-1-kherbst@redhat.com>
 <YKIvusHWjax1dSqf@orome.fritz.box>
 <YKI1Bp3vD5RFTy7h@orome.fritz.box>
In-Reply-To: <YKI1Bp3vD5RFTy7h@orome.fritz.box>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 17 May 2021 14:28:13 +0200
Message-ID: <CACO55ttBc3_=Eih=L0sUV+BscFJV0JN894n_8qqJBh2RCQ-3Fw@mail.gmail.com>
To: Thierry Reding <treding@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 11:17 AM Thierry Reding <treding@nvidia.com> wrote:
>
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
> > >     ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > >     if (ret) {
> > > -           nouveau_bo_ref(NULL, &nvbo);
> > >             return ret;
> > >     }
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
> >        * to the caller, instead of a normal nouveau_bo ttm reference. */
> >       ret = drm_gem_object_init(drm->dev, &nvbo->bo.base, size);
> >       if (ret) {
> > -             drm_gem_object_release(&nvbo->bo.base);
> >               kfree(nvbo);
> >               return ret;
> >       }
> >
> >       ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> >       if (ret) {
> > -             nouveau_bo_ref(NULL, &nvbo);
> > +             drm_gem_object_release(&nvbo->bo.base);
> >               return ret;
> >       }
> >

I was looking at this already and fixed the above part in
925681454d7b557d404b5d28ef4469fac1b2e105, but yeah.. maybe calling
drm_gem_object_release up there is indeed not needed. Would have to
take a deeper look as well.

> > --- >8 ---
> >
> > Thierry
>
> Adding Jeremy for visibility.
>
> Thierry

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
