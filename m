Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D822126DC9C
	for <lists+nouveau@lfdr.de>; Thu, 17 Sep 2020 15:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5371E6EC4A;
	Thu, 17 Sep 2020 13:15:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510676EC4A
 for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2020 13:15:43 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id i17so2380840oig.10
 for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2020 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CREpsFwnlRokcG6H35zF+6z20U4xUwHGwMPLudH5dfg=;
 b=bI0SHrfGTy54mKFtgwyUlqSlka0zevPpnUHfSMG3R2rQZyfvJsUtmN3IXigONpsweu
 wm7O/BkIDVUZMrP6Vxji/SUBwml2V7iaz/SC8phN17s1fgTr3u2/0RHnne45eQ/r6GfD
 gE63yEub7xahJJ82uPXAKEygc5lR89OiQG/io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CREpsFwnlRokcG6H35zF+6z20U4xUwHGwMPLudH5dfg=;
 b=o79mxnt9S2E0Vskru27RwJCl+7h1ESI/Z/rWKopEe4iPejFexBd/YfsinDlopK/wYC
 LVe2hYJrUvwEGaXLgPKXGafBfAGDwAetrlQVfoIJJQIwBebfaaVdqyYYm1adOLox6rum
 aSRw8arLFuYLA1yKu651ZPchGQulpT+vcw5AB/gjb2u1a5AD10QWto1LCAUFf0tv6BNO
 NMyslp74pvnVWb+pbbT3f+pr1Eewu1ZvNFOQ0sYvd3xVbaPvrIKX1Snio56rpXz1CkXx
 iVKu3r9uFrR85/TYX9yQgve61SVt7LlLcopjWMMFnZMtdmItYz0ImZbhZJgFj2kSEt/s
 0NOw==
X-Gm-Message-State: AOAM530X3s5cFNN139xwmNWW+KeaX3mMcZSLJtp0/ao0VEx8ctUax+vJ
 d9gctKOqFJp5YNM+6neUD1Q82yAGMV/fkZUOXEXtqg==
X-Google-Smtp-Source: ABdhPJwh/xpv4EaHS/C5Vakvo23Yj6nV8rJSwmXwV09kTIZfYvaDpiRM2cphKiJ6UXJ9r+XrmfIcegnJdbnfWcExEQg=
X-Received: by 2002:aca:5106:: with SMTP id f6mr5888580oib.101.1600348542650; 
 Thu, 17 Sep 2020 06:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
In-Reply-To: <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 17 Sep 2020 15:15:31 +0200
Message-ID: <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Drop mutex_lock_nested for atomic
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
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ben, did you have a chance to look at this?
-Daniel

On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
<maarten.lankhorst@linux.intel.com> wrote:
>
> Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > Purely conjecture, but I think the original locking inversion with the
> > legacy page flip code between flipping and ttm's bo move function
> > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > actual modeset commit is completely separated in the code patsh.
> >
> > This annotation was originally added in
> >
> > commit 060810d7abaabcab282e062c595871d661561400
> > Author: Ben Skeggs <bskeggs@redhat.com>
> > Date:   Mon Jul 8 14:15:51 2013 +1000
> >
> >     drm/nouveau: fix locking issues in page flipping paths
> >
> > due to
> >
> > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > Date:   Thu Jun 27 13:48:18 2013 +0200
> >
> >     drm/nouveau: make flipping lockdep safe
> >
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: nouveau@lists.freedesktop.org
> > ---
> > I might be totally wrong, so this definitely needs testing :-)
> >
> > Cheers, Daniel
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index 7806278dce57..a7b2a9bb0ffe 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> >                       return ret;
> >       }
> >
> > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > +             mutex_lock(&cli->mutex);
> > +     else
> > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > +
> >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> >       if (ret == 0) {
> >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
>
> Well if you're certain it works now. :)
>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
