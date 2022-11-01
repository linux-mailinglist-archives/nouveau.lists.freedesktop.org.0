Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A921B6147DF
	for <lists+nouveau@lfdr.de>; Tue,  1 Nov 2022 11:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A5D10E12D;
	Tue,  1 Nov 2022 10:46:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD8C10E12D
 for <nouveau@lists.freedesktop.org>; Tue,  1 Nov 2022 10:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667299574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0obgjw3z7dN3OmY18vr5NlDpGlYfWacvqa8i9mpD2aY=;
 b=Yy3+l6JH/1V36PoB9FjCvFZPnp26cK4pr5VestZbFfrmdkuKRuiLX960cLbEEZSYQPl1Dz
 0d9GUfXdhf9Y/A1hvc8U1HbQWNcto/5Ar8xwgzJIMcYy2po6C2boZ7Z5XhbTLtNuSnUk1Y
 1hdeQO/dWHqh+YMygyYJneV8XKmCDlE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-153-qju-Mp9MM0iE08EfHmNLqw-1; Tue, 01 Nov 2022 06:46:13 -0400
X-MC-Unique: qju-Mp9MM0iE08EfHmNLqw-1
Received: by mail-qk1-f199.google.com with SMTP id
 x22-20020a05620a259600b006b552a69231so11733407qko.18
 for <nouveau@lists.freedesktop.org>; Tue, 01 Nov 2022 03:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0obgjw3z7dN3OmY18vr5NlDpGlYfWacvqa8i9mpD2aY=;
 b=F4663zi+R83zy9KC0geVeBdF/VYFylNBnNsht0N7lTLrqJLoKAfUXxTEo3bxGnKVNb
 9ZbYN4pXMjUfywWOetbDhzAO8V3gp3nGHbCWEqJzQ2zyX0MHpihR0v+aqPZE/C2ZaefJ
 uVIbGL4x9ldShLTKKo2bmie0B1CNV6LKdbH1nu7t/A/J/ct6vMFjCtCg/Gy+OhVkBD3X
 mFGXR54OuC9c51RmWGde3dfw82hg5ax3mlttJ1MuKS6mXg2C8JHe1BpMS0bxyv/mgokw
 UdXPI+sGJV2t04HaXqISQZGq6T9V5EVYqUK855aCGOT3BqMzRuXkDlj6Y2U61O8dFmOY
 pR2Q==
X-Gm-Message-State: ACrzQf3EB5GmIVaH0MNnbDXlTudnIZKU4I/qrLjtBZRLLq7VNwCeYQM2
 EXv08vFtXk0lye6loTDOV9co6YOkZ/skPrULQP1I0zuRL2IHW+j6HqacBk2mi7itYJ3ul4CXK/a
 L4ydB1v4HyDzDsrpY/jCs5VH0YfiHK4AWVY9FBjuLhw==
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id
 s12-20020a05620a0bcc00b006cec077acf3mr12358097qki.263.1667299572761; 
 Tue, 01 Nov 2022 03:46:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Fsnq9dgsTc1ABX3kQ//ctJ1pS+s00335UxAOgbK2nj3qnw1I8IfmM3LrEczAYDohSKkrhUriYhE+6M6dg5VY=
X-Received: by 2002:a05:620a:bcc:b0:6ce:c077:acf3 with SMTP id
 s12-20020a05620a0bcc00b006cec077acf3mr12358075qki.263.1667299572498; Tue, 01
 Nov 2022 03:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220819200928.401416-1-kherbst@redhat.com>
 <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
In-Reply-To: <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Nov 2022 11:46:01 +0100
Message-ID: <CACO55tv0jO2TmuWcwFiAUQB-__DZVwhv7WNN9MfgMXV053gknw@mail.gmail.com>
To: Computer Enthusiastic <computer.enthusiastic@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Nov 1, 2022 at 7:45 AM Computer Enthusiastic
<computer.enthusiastic@gmail.com> wrote:
>
> Hello,
>
> Il giorno ven 19 ago 2022 alle ore 22:09 Karol Herbst
> <kherbst@redhat.com> ha scritto:
> >
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
> >                 if (ret == 0) {
> >                         ret = nouveau_fence_new(chan, false, &fence);
> >                         if (ret == 0) {
> > +                               /* TODO: figure out a better solution here
> > +                                *
> > +                                * wait on the fence here explicitly as going through
> > +                                * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> > +                                *
> > +                                * Without this the operation can timeout and we'll fallback to a
> > +                                * software copy, which might take several minutes to finish.
> > +                                */
> > +                               nouveau_fence_wait(fence, false, false);
> >                                 ret = ttm_bo_move_accel_cleanup(bo,
> >                                                                 &fence->base,
> >                                                                 evict, false,
> > --
> > 2.37.1
> >
>
> Do you think it could be possible to make the patch land in kernel
> 5.10.x in the near future ?
>
> Is there something I can do to help it to happen ?
>

you can send it out to the stable mailing list and I ack it there. I
just totally forgot about it, sorry.

> Thanks.
>

