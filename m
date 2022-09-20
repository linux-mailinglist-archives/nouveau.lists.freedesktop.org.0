Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F415BE498
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 13:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E110E182;
	Tue, 20 Sep 2022 11:36:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F164510E182
 for <nouveau@lists.freedesktop.org>; Tue, 20 Sep 2022 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663673804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsCfV3jb8Y6CJkx3bnF/8eo0TaIrp2G1MgoQNK12Cok=;
 b=M3rUlbFM61qUUSSF8jvKnStvxlPo8GPXaBEyzKarlg/+gVoXcUEOkMtKeliRQ0jmKzzxbP
 QL88kH5+90rSbvB3uUIZbdlecKIugnx7QGv3ZnIhCwRzbsq1C2cLcAuZqtV5G14IQcCqYQ
 qONOKVeQSlHUic78bCf58Gl0pQnSXYo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-338-UJQrMWl0NPqCv4QGHHobqQ-1; Tue, 20 Sep 2022 07:36:43 -0400
X-MC-Unique: UJQrMWl0NPqCv4QGHHobqQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bk21-20020a05620a1a1500b006be9f844c59so1685114qkb.9
 for <nouveau@lists.freedesktop.org>; Tue, 20 Sep 2022 04:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PsCfV3jb8Y6CJkx3bnF/8eo0TaIrp2G1MgoQNK12Cok=;
 b=EWr2Oq+dIJKVUBhouwofOHNHrpbAA3813WbO6H24/JN3UAyDi/pfO2tcpYzNBk5HHy
 rRWsnV2UDa2naQOuvXtKKjCYLSEZM97L2E83pvxH+zcrJ3exdY/Oj5cYILfqnMMyPdY6
 ZM9YvjOJ60p5AKyi9vjzBiaWx96gfjqomdrta51QZXkpwQ0B+O6tXtljBjW9msdI0exS
 lzmhMsoMVtXBv5uwmFhkj1GnMwcoDUcpcZxciSWHcYpdfrGfuUvegZjbwl+em0T7QK5x
 r4g4X5gGvraaYdVDttkDCd1hsogju0n/sBYV8bMWReugJ6Xa/QolTBjg6WOZg3alDx9Q
 gNVA==
X-Gm-Message-State: ACrzQf3DQF4WioNrHcfj56QKk9KCoZvXTd9zES8ebLN4KhAYduKw8lYA
 rPmBgEKFwIkUgKPlcvoJBl5mkTtzuEfEFoOvoYMnzFrP6bjS03TjbFwTm5aDaF0hzpxz5RAEXjZ
 Gdy3PV7HNncMdho8lJ3ltzwSjCLla5/XnQXtpuVk1tg==
X-Received: by 2002:a05:622a:1793:b0:35b:af87:4f22 with SMTP id
 s19-20020a05622a179300b0035baf874f22mr18699727qtk.673.1663673803212; 
 Tue, 20 Sep 2022 04:36:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6wIQ0jFhCaudvcBegNkhf6TY0qdf9hDp0ELXrNPeuoLTirgC5lOzDVWzTY40c9modUSL/vnMBgHTmfH7PrYgM=
X-Received: by 2002:a05:622a:1793:b0:35b:af87:4f22 with SMTP id
 s19-20020a05622a179300b0035baf874f22mr18699716qtk.673.1663673802999; Tue, 20
 Sep 2022 04:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220819200928.401416-1-kherbst@redhat.com>
 <YymY+3+C2aI7T3GU@eldamar.lan>
In-Reply-To: <YymY+3+C2aI7T3GU@eldamar.lan>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 20 Sep 2022 13:36:32 +0200
Message-ID: <CACO55ts7rpbyYv3ovWt1iCfkGsChCUVitmHqtzAwFpfbPEZGYQ@mail.gmail.com>
To: Salvatore Bonaccorso <carnil@debian.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 20, 2022 at 12:42 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> Hi,
>
> On Fri, Aug 19, 2022 at 10:09:28PM +0200, Karol Herbst wrote:
> > It is a bit unlcear to us why that's helping, but it does and unbreaks
> > suspend/resume on a lot of GPUs without any known drawbacks.
> >
> > Cc: stable@vger.kernel.org # v5.15+
> > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index 35bb0bb3fe61..126b3c6e12f9 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
> >               if (ret == 0) {
> >                       ret = nouveau_fence_new(chan, false, &fence);
> >                       if (ret == 0) {
> > +                             /* TODO: figure out a better solution here
> > +                              *
> > +                              * wait on the fence here explicitly as going through
> > +                              * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> > +                              *
> > +                              * Without this the operation can timeout and we'll fallback to a
> > +                              * software copy, which might take several minutes to finish.
> > +                              */
> > +                             nouveau_fence_wait(fence, false, false);
> >                               ret = ttm_bo_move_accel_cleanup(bo,
> >                                                               &fence->base,
> >                                                               evict, false,
> > --
> > 2.37.1
> >
> >
>
> While this is marked for 5.15+ only, a user in Debian was seeing the
> suspend issue as well on 5.10.y and did confirm the commit fixes the
> issue as well in the 5.10.y series:
>
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#69
>
> Karol, Lyude, should that as well be picked for 5.10.y?
>

mhh from the original report 5.10 was fine, but maybe something got
backported and it broke it? I'll try to do some testing on my machine
and see what I can figure out, but it could also be a debian only
issue at this point.

> Regards,
> Salvatore
>

