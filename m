Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 323FE654EA3
	for <lists+nouveau@lfdr.de>; Fri, 23 Dec 2022 10:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E7189EFF;
	Fri, 23 Dec 2022 09:44:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A0E89EFF
 for <nouveau@lists.freedesktop.org>; Fri, 23 Dec 2022 09:44:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ud5so10890682ejc.4
 for <nouveau@lists.freedesktop.org>; Fri, 23 Dec 2022 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pupsl173ER+FNF5b3/wQ+7hV6OTifqboCmhZDPM5uH8=;
 b=mkOnvVt+7lozUiIaZqRc1a9x+zgMVNPurzuEZ7Y5i08pH5lB4WohjtEG1zwBOlC7AV
 GC5newXFPEmaPG/zzj8gExnAG/q7IP2lCTswv9a5dwrD/K/XjP3+xCr3eFVZI98Q+tE7
 1qbxNWP2oM5XVFxlXgnnxQhsp8DhIZV7BOHfzZay33b2SIBxxi3n1EtmyRHnrX2IIb5J
 v8gdv6DBKskv46S1ecF5rrUXCi69v3UA+1MyYb1ed6cMHo40/0Wf5Zq9Yd9FD3FFp7zJ
 dhplagEz00rRqP8MRgCNG9bTaxD34ahFrSlWLGpQC8Z4cxd83B4J1jXTa98h+WlrJM0c
 3ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pupsl173ER+FNF5b3/wQ+7hV6OTifqboCmhZDPM5uH8=;
 b=OWRIm+NRRVS2/V57ZJQRYqy+6caYX4ZgTZfAjsLKtfXUN3vwdu52zuMtFo3lxQDmof
 hioAagrgoRpEYMVCH4W9gEbkETrZaZcOQ6FWe1UG/W9x68RYB7hDRdYhM+nDMxvo9Koo
 lp9vlH8JDe7yHuZVcF42qf0mwqXH3R44B0sO3PLJs5s4Iiu7RShh6HzMhHfSzZB68UEg
 j0REmNGZtaGsaTs0dyPnJau0bCTNFUoWZNIRVUtWpN6olLWsyNj33BYGbZD8bLP4FiVK
 /4TGPnBcmt9un6ROThnD0VBAdXSCdILyOTvXK+pvi09AyyCNsvDzviDe79D5+AeL8hss
 TntQ==
X-Gm-Message-State: AFqh2kpx7LV5+kNA2xTGCyAGC3qgxIOr8sIT6jlf9NdV2pY+DkCz3l2I
 V4Ty8f32B7K41KlrL7y2k+gVOUph5R0tTxtfOm0=
X-Google-Smtp-Source: AMrXdXvEQQOOGkdKpTEPByCdj6HJfxZQ+Y4Ny9nRn3Q5KobRTUHLngj++8FDMsQ29n3Nd8OWw0z5ovY8aCm1Nw1wllg=
X-Received: by 2002:a17:906:dcf:b0:7c1:6781:9c97 with SMTP id
 p15-20020a1709060dcf00b007c167819c97mr664049eji.676.1671788645486; Fri, 23
 Dec 2022 01:44:05 -0800 (PST)
MIME-Version: 1.0
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
 <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
In-Reply-To: <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Fri, 23 Dec 2022 10:43:52 +0100
Message-ID: <CAHSpYy117N0A1QJKVNmFNii3iL9mU71_RusiUo5ZAMcJZciM-g@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello Karol,

Il giorno mar 1 nov 2022 alle ore 11:46 Karol Herbst
<kherbst@redhat.com> ha scritto:
>
> On Tue, Nov 1, 2022 at 7:45 AM Computer Enthusiastic
> <computer.enthusiastic@gmail.com> wrote:
> >
> > Hello,
> >
> > Il giorno ven 19 ago 2022 alle ore 22:09 Karol Herbst
> > <kherbst@redhat.com> ha scritto:
> > >
> > > It is a bit unlcear to us why that's helping, but it does and unbreaks
> > > suspend/resume on a lot of GPUs without any known drawbacks.
> > >
> > > Cc: stable@vger.kernel.org # v5.15+
> > > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > index 35bb0bb3fe61..126b3c6e12f9 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
> > >                 if (ret == 0) {
> > >                         ret = nouveau_fence_new(chan, false, &fence);
> > >                         if (ret == 0) {
> > > +                               /* TODO: figure out a better solution here
> > > +                                *
> > > +                                * wait on the fence here explicitly as going through
> > > +                                * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> > > +                                *
> > > +                                * Without this the operation can timeout and we'll fallback to a
> > > +                                * software copy, which might take several minutes to finish.
> > > +                                */
> > > +                               nouveau_fence_wait(fence, false, false);
> > >                                 ret = ttm_bo_move_accel_cleanup(bo,
> > >                                                                 &fence->base,
> > >                                                                 evict, false,
> > > --
> > > 2.37.1
> > >
> >
> > Do you think it could be possible to make the patch land in kernel
> > 5.10.x in the near future ?
> >
> > Is there something I can do to help it to happen ?
> >
>
> you can send it out to the stable mailing list and I ack it there. I
> just totally forgot about it, sorry.
>
> > Thanks.
> >

As you suggested, I sent a request to a request to linux-kernel [1],
but it was not acknowledged.

What else can I do to help the patch land in the 5.10.x kernel in the future ?

Thanks and happy Christmas.

[1] https://marc.info/?l=linux-kernel&m=166883482714930&w=2
