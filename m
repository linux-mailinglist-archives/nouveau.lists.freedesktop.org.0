Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264027D1DB
	for <lists+nouveau@lfdr.de>; Tue, 29 Sep 2020 16:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E2589CD5;
	Tue, 29 Sep 2020 14:52:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAF489CD5
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 14:52:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id g96so4668492otb.12
 for <nouveau@lists.freedesktop.org>; Tue, 29 Sep 2020 07:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rPPXygZpzq9GUSfGOTbHR/oyN1//VICOUWLY0E6v4MM=;
 b=Ho+XxXi5ACUZ8esXVjJlwKAXFD0NTq6chJJ+WXCn4aiw6wOlh4ao4wDhWD9Rayb0+D
 UHdFvmqKv7DokFFXkV8AlD0+fLjf4+qIGdm72NgAo7lnl7wdKWurgoUqCaaT0esLGZC0
 mICjE2tzQ9/6KC3m/9YCvsQMQDPW1OcKg86xI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPPXygZpzq9GUSfGOTbHR/oyN1//VICOUWLY0E6v4MM=;
 b=ZjWBBAiT/IrIX65dWUpsodwNpUXxu7MSf8dZRC3qOOT9eeJHD3UBHLYW98V45rNTL1
 HmHQVfFHObG+Vl2OTZgG5+7ePtsGL9+lSN6U/JSE4zxC26O0qGVn3M21IGL4zQJ3H+Tb
 HcYjxezn2NpOEzHaqFr6cp3HHIPh8358FdiFVN8dUk5MabxutBlAylF60bp10XtO8kOZ
 it+7Pd3EutowhbaRfxEkeOa4i51cPZJtjU+qUEKo9LZp/qALX0zxP36NdpFdCJT80zjY
 /W4jBTyb/gcMDqoKeViQPAomjJVbqN8WxzFumbpv8seyspvB0ZpP7Oc3/Q2HQ/ciJAVR
 /RDQ==
X-Gm-Message-State: AOAM5327A8hTAbUhO7vraV/4d4Fu3tSiy4gVeG5tWuHxy36UeQGwppoB
 BoWfDzgT6AXO125wsJOL+5PXdbF2PgXFPVMVdEK2oA==
X-Google-Smtp-Source: ABdhPJycJt2AzY8h+0ku2hXxDhhkYoHhCQavBX1f/Wk0JEvpi81QFW8kiUFC9ek5T9COAOOJ2r6yEzHjl4rNTHmhGdQ=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr3167384otf.281.1601391157431; 
 Tue, 29 Sep 2020 07:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200802181849.1586281-1-daniel.vetter@ffwll.ch>
 <579702ca-4b4e-0b05-1b93-25b99554d464@linux.intel.com>
 <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
In-Reply-To: <CAKMK7uHbdcLMJONxR5OZXBLtm0WVxT117mBD72RDW5MRQ=ky4g@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 29 Sep 2020 16:52:26 +0200
Message-ID: <CAKMK7uE89ZyvVronwpS=+ovJj_njVo3C5+GjjZp2S-Dk_7p2jg@mail.gmail.com>
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

On Thu, Sep 17, 2020 at 3:15 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Ben, did you have a chance to look at this?

Ping
-Daniel

> On Mon, Aug 3, 2020 at 1:22 PM Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
> >
> > Op 02-08-2020 om 20:18 schreef Daniel Vetter:
> > > Purely conjecture, but I think the original locking inversion with the
> > > legacy page flip code between flipping and ttm's bo move function
> > > shoudn't exist anymore with atomic: With atomic the bo pinning and
> > > actual modeset commit is completely separated in the code patsh.
> > >
> > > This annotation was originally added in
> > >
> > > commit 060810d7abaabcab282e062c595871d661561400
> > > Author: Ben Skeggs <bskeggs@redhat.com>
> > > Date:   Mon Jul 8 14:15:51 2013 +1000
> > >
> > >     drm/nouveau: fix locking issues in page flipping paths
> > >
> > > due to
> > >
> > > commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
> > > Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > Date:   Thu Jun 27 13:48:18 2013 +0200
> > >
> > >     drm/nouveau: make flipping lockdep safe
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Dave Airlie <airlied@gmail.com>
> > > Cc: nouveau@lists.freedesktop.org
> > > ---
> > > I might be totally wrong, so this definitely needs testing :-)
> > >
> > > Cheers, Daniel
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > index 7806278dce57..a7b2a9bb0ffe 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > @@ -776,7 +776,11 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, bool intr,
> > >                       return ret;
> > >       }
> > >
> > > -     mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > +     if (drm_drv_uses_atomic_modeset(drm->dev))
> > > +             mutex_lock(&cli->mutex);
> > > +     else
> > > +             mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
> > > +
> > >       ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, intr);
> > >       if (ret == 0) {
> > >               ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
> >
> > Well if you're certain it works now. :)
> >
> > Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
