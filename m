Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D145F58F430
	for <lists+nouveau@lfdr.de>; Thu, 11 Aug 2022 00:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6318B6EF;
	Wed, 10 Aug 2022 22:09:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A666113B50
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 22:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660169321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p2QhbLdvA4JcFHkAlsKnN1EAVgqJ5iTFLTn+TqQtC18=;
 b=TfFnnW2reOGlhk+3kqjU3h2ujMFNx29ocXGNy4OpPiM81WiTIA9nR0MELWqmkvy5Hij7wZ
 PrhoMV1JDk6hWfGgNITOvVNaNJ1fVj31uUIzCdMsFAgIWxGuQbIwup+Wu6hNdoev9QufP1
 xQGQAl3KseuUSbGAdod/3MLuru6ZKq0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-287-lNS1CrGXN3eNhHkAf9gz-w-1; Wed, 10 Aug 2022 18:08:40 -0400
X-MC-Unique: lNS1CrGXN3eNhHkAf9gz-w-1
Received: by mail-qv1-f72.google.com with SMTP id
 dp8-20020a05621409c800b0047b6911be44so4473061qvb.7
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 15:08:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=p2QhbLdvA4JcFHkAlsKnN1EAVgqJ5iTFLTn+TqQtC18=;
 b=iSxYf8QD5dFxYru0LuLyxTAT9d6s+gOeOzITFkAMnN1bBtYfzySjJRyJZZiJ/m1yj3
 6tGs7mlYI9m+ymIgi/lyDJKfhOPdeYmpk/z7rexPjRvphHJ6nIcV3t9wBSVilwiBAkL3
 5UgpmQalCEY5hrFXYVOU7mrDrdblQC4HJw1shzN0DWTiiZSJJJKO0qi+VbtG0fKCb5n1
 TuCyOyGnY96WBEe0IaUhD4z7JjiM8rd1DQaaH6OsInRVj2fpa1fPrFxTlGV8GL9JItyX
 l0rHztMwEP5qlIrcbOO3qux0qFXOcBQ3oOO35phi39NodKFT1ysUJYDLTjljk73Pyueh
 DD+A==
X-Gm-Message-State: ACgBeo0OVV7X5QmTh/0BbPGb4J3bB2m/+FkkiuYw20xF+UXiGl8+m/Kf
 nuNYHXBSD8Mo8X1E86rrGrAfjx/DNkgc1VbKn0MEvtPOFZCCXE6zmKNrvwcann83jJz7XQzxJ6Q
 Q7qKUHgj018YC3Z7+PGbF5pg1RQ30tOEv2MvZQRDeTQ==
X-Received: by 2002:a05:6214:2345:b0:473:a82c:34eb with SMTP id
 hu5-20020a056214234500b00473a82c34ebmr25895261qvb.9.1660169319913; 
 Wed, 10 Aug 2022 15:08:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6p2BaxPhHljffibe3VfEzJ6xec5iEhYYsNvoJnk7EdW3bvH/re9fjb4+kXu57547zCqTWlZEyzMqf32RfL2aI=
X-Received: by 2002:a05:6214:2345:b0:473:a82c:34eb with SMTP id
 hu5-20020a056214234500b00473a82c34ebmr25895247qvb.9.1660169319642; Wed, 10
 Aug 2022 15:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
 <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
 <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
 <071b71819660d61d9b5caa368f683189a192754f.camel@redhat.com>
In-Reply-To: <071b71819660d61d9b5caa368f683189a192754f.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 11 Aug 2022 00:08:28 +0200
Message-ID: <CACO55ttafiSS+eU=g0=uqwvU7yi+B_6LJK1VJ2FLObn6Rg8LYQ@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Advice about debugging nouveau driver suspend issue
 (init_on_alloc=1 and init_on_free=1)
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
Cc: Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 11:35 PM Lyude Paul <lyude@redhat.com> wrote:
>
> On Wed, 2022-08-10 at 13:59 +0200, Karol Herbst wrote:
> > On Wed, Aug 10, 2022 at 12:42 PM Computer Enthusiastic
> > <computer.enthusiastic@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > The "supend to ram" issue (system freeze when resuming after suspend
> > > to ram or disk hibernation) is still affecting the nouveau kernel
> > > module from linux version 5 and above with nvidia GeForce 9600M GT and
> > > other nvidia graphic card with the same chipset [1][2][3].
> > >
> > > I've been successfully using the "work in progress" patch by Karol
> > > Herbst [4] to solve the "supend to ram" issue since it was proposed
> > > for an apparent different issue ("[GT216][Linux 5.16.4] Long stalls in
> > > dma_fence_default_wait") [5] whose root cause is probably the same.
> > >
> > > I send this message to bring to your attention the aforementioned
> > > patch [4] (below in the message as text) to evaluate it for  the next
> > > steps for possible inclusion  in the upstream kernel version.
> > >
> >
> > I think it might be better to CC Ben and Lyude, who _might_ have a
> > good idea on what's the proper patch, but maybe the patch is fine as
> > it is?
>
> When the GPU starts going into suspend, TTM migrates all of the active bos in
> vram over to system ram so they aren't lost. Based on what's described here
> and the fact that a fence wait seems to fix it, it sounds like to me that TTM
> may still be migrating bos (buffer objects) from the GPU over to system RAM
> when the suspend process starts. Of course this causes those operations to get
> interrupted and lose access to VRAM unexpectedly, which likely causes the
> world to go boom.
>

the thing is, without this patch, the "hw path" fails with a timeout
of... 30 seconds?, the code falls back to sw and it takes up to 2-3
minutes to finish up. So even if this solution is overkill, it fixes a
real issue. I suspect _something_ is bonkers with the fencing we do
here and we don't see that the stuff is actually finished or whatever,
or maybe we never emit the fence in the first place.. I didn't dig
deep enough.

With this, it's really quick and everything.

> So, I'm not 100% sure but I think this patch is potentially overkill since it
> looks like it would fix this issue by just making all m2mf bo moves
> synchronous. Thisis something we probably(?) don't want to do since if my
> theory is correct, the only time we should need to do a fence wait is before
> suspending the GPU in order to ensure that all m2mf operations have been
> completed before continuing suspend. I think Ben would likely need to weigh
> in, or you might be able to figure out the answer to this just by seeing how
> we handle this with the newer method of vram blitting - the CE (copy engine).
> Let me know if you need any more input, or are able to come up with a patch
> that more or less does what I just described.
>
> >
> > > Thanks.
> > >
> > > [1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
> > > [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#5
> > > [3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
> > > [4] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156#note_1385770
> > > [5] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> > >
> > > ----- %= ----- %= ----- %=
> > >
> > > From 70271cb0aa30e4523d39c3942e84b16fe18338f5 Mon Sep 17 00:00:00 2001
> > > From: Karol Herbst <kherbst@redhat.com>
> > > Date: Mon, 16 May 2022 17:40:20 +0200
> > > Subject: [PATCH] nouveau WIP
> > >
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > index 05076e530e7d..b6343741eda6 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > @@ -820,6 +820,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo,
> > > int evict,
> > >   if (ret == 0) {
> > >   ret = nouveau_fence_new(chan, false, &fence);
> > >   if (ret == 0) {
> > > + nouveau_fence_wait(fence, false, false);
> > >   ret = ttm_bo_move_accel_cleanup(bo,
> > >   &fence->base,
> > >   evict, false,
> > > --
> > > 2.35.3
> > >
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>

