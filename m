Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C437FC9C
	for <lists+nouveau@lfdr.de>; Thu, 13 May 2021 19:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441036ED98;
	Thu, 13 May 2021 17:37:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0E16ED98
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620927474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JGTH2Rjo6og/5WOF890r8rWe7TQUPE5S5HrB/bBhV5g=;
 b=dEigaynFhPm5ltpcT+N0FbpBMbLtBxQ0NQJMeYOvSjE3Jf3paywHYLq5PhmfBVsrXAqWs/
 /R5d2SJYys474CYoekQCpJUxPuPdlQDiurZgPBdDxNpJsLZ2DwqaQ81GSkeNOr04mjycOg
 v1R8sI7qD5cNQOaL64D3DPDZSIZ1nLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-nCBaTspDNUeLfG3YRIJs_A-1; Thu, 13 May 2021 13:37:52 -0400
X-MC-Unique: nCBaTspDNUeLfG3YRIJs_A-1
Received: by mail-wm1-f71.google.com with SMTP id
 b16-20020a7bc2500000b029014587f5376dso956865wmj.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 May 2021 10:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JGTH2Rjo6og/5WOF890r8rWe7TQUPE5S5HrB/bBhV5g=;
 b=MR035eLF0gyMefkWqDsNzElGN6NpyRqAUBnYVW04+lQPwcEbP5yw2BrTHxF7zaIzaD
 4K0Tf3INcT1FZ1rETiqwcLsshafSyo0zPnr9na/Y2+HaTDYSHGOwaEFzCDBkD4+DMYqt
 iAWp/2HDGnLFNa5ItwXjjmGRUNUsFtvrejL438qeOxRRQQmhNA5+zYFkjQJkZGxwiTWb
 Sa0+SW7IFbrqkcBaP4DoiDjrEEVWyoo9FhUJvC28DENeLnBP3xohemxeqvFOzzRMthzl
 G5YgXPZAkWhy84X/OF6lXGalJN5ioG53NgbkYSMeZWWaFW5lKbPU4YBUFvWy8cF0lDoF
 pOKw==
X-Gm-Message-State: AOAM5301I/b8YVsr4eaurWLVoUtXA9Lqrq9TrFaVWcq3FylXLrytq6q+
 dh0e3anOBDOivGmGnj+BVrySQ83ZFCh+JRXjsB81Y0lwZmCHrYr4Hgdvj6xOtrycoObkKRsrca0
 8PhXXUpiEuqxkzUaAm8oqqL0U6kW5Cs3vfze5YK+j8w==
X-Received: by 2002:adf:e944:: with SMTP id m4mr10974825wrn.10.1620927470987; 
 Thu, 13 May 2021 10:37:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYBbvIzhLOGElw/qeUoF39ZKfM1ynSPIT+X5hYcNhHx2oy3oB3wbPIii40Dc/+deCvND8y5X9dWiiirTSfqLM=
X-Received: by 2002:adf:e944:: with SMTP id m4mr10974819wrn.10.1620927470803; 
 Thu, 13 May 2021 10:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210511163553.2344244-1-kherbst@redhat.com>
 <YJ1E+opCkn9STuAr@dev>
In-Reply-To: <YJ1E+opCkn9STuAr@dev>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 May 2021 19:37:40 +0200
Message-ID: <CACO55tveh2931qY8wCxm7ofH-iy0sj5V=08amDKyu8SAQUsxdA@mail.gmail.com>
To: Jeremy Cline <jcline@redhat.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, May 13, 2021 at 5:25 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> On Tue, May 11, 2021 at 06:35:53PM +0200, Karol Herbst wrote:
> > If ttm_bo_init fails it will already call ttm_bo_put, so we don't have to
> > do it through nouveau_bo_ref.
> >
> > ==================================================================
> > BUG: KFENCE: use-after-free write in ttm_bo_put+0x11/0x40 [ttm]
> >
> > Use-after-free write at 0x000000004dc4663c (in kfence-#44):
> >  ttm_bo_put+0x11/0x40 [ttm]
> >  nouveau_gem_new+0xc1/0xf0 [nouveau]
> >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> >  drm_ioctl_kernel+0xb2/0x100 [drm]
> >  drm_ioctl+0x215/0x390 [drm]
> >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> >  __x64_sys_ioctl+0x83/0xb0
> >  do_syscall_64+0x33/0x40
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > kfence-#44 [0x00000000c0593b31-0x000000002e74122b, size=792, cache=kmalloc-1k] allocated by task 2657:
> >  nouveau_bo_alloc+0x63/0x4c0 [nouveau]
> >  nouveau_gem_new+0x38/0xf0 [nouveau]
> >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> >  drm_ioctl_kernel+0xb2/0x100 [drm]
> >  drm_ioctl+0x215/0x390 [drm]
> >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> >  __x64_sys_ioctl+0x83/0xb0
> >  do_syscall_64+0x33/0x40
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > freed by task 2657:
> >  ttm_bo_release+0x1cc/0x300 [ttm]
> >  ttm_bo_init_reserved+0x2ec/0x300 [ttm]
> >  ttm_bo_init+0x5e/0xd0 [ttm]
> >  nouveau_bo_init+0xaf/0xc0 [nouveau]
> >  nouveau_gem_new+0x7f/0xf0 [nouveau]
> >  nouveau_gem_ioctl_new+0x53/0xf0 [nouveau]
> >  drm_ioctl_kernel+0xb2/0x100 [drm]
> >  drm_ioctl+0x215/0x390 [drm]
> >  nouveau_drm_ioctl+0x55/0xa0 [nouveau]
> >  __x64_sys_ioctl+0x83/0xb0
> >  do_syscall_64+0x33/0x40
> >  entry_SYSCALL_64_after_hwframe+0x44/0xae
> >
> > Fixes: 019cbd4a4feb3 "drm/nouveau: Initialize GEM object before TTM object"
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index c88cbb85f101..1165ff990fb5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -212,7 +212,6 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
> >
> >       ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> >       if (ret) {
> > -             nouveau_bo_ref(NULL, &nvbo);
> >               return ret;
> >       }
> >
>
> I submitted a patch for this in the beginning of December, it got
> reviewed and it's languished ever since[0]. It's frustrating that these
> issues have to get fixed multiple times by multiple developers because
> bug fixes (with reviews!) aren't being accepted.
>
> [0] https://lists.freedesktop.org/archives/nouveau/2020-December/037571.html
>
> Anyway, for whatever it's worth:
>
> Reviewed-by: Jeremy Cline <jcline@redhat.com>
>

oh indeed... as the patches are equivalent I'd say we should merge
yours and add my

Reviewed-by: Karol Herbst <kherbst@redhat.com>

let's see if we can get it in this time *sigh*

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
