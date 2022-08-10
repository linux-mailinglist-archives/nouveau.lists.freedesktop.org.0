Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E502558EB9B
	for <lists+nouveau@lfdr.de>; Wed, 10 Aug 2022 13:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56323A1871;
	Wed, 10 Aug 2022 11:59:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37A98D3CD
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660132759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VnWYyKBR431FlBZi2ksePWmmZA0X4aalhIgZbd1hifM=;
 b=eHDIeCqzElOGGYzbAZY2/slM47IfDUJyO3iWob3Jn0HPI2jSg+Tgty10WPyLkGbdfBUmtT
 K18FAZTy37NcpRm8mokopzuwFObwO6ciSRrGZk+vuo2mLf+dBOyR03jm7TqWVL9x0sJDH0
 2o6+xa3upSWtdze1k/ZFJLcELrBz9D0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-oPD9VeQ7ODaxy_zp4PxVow-1; Wed, 10 Aug 2022 07:59:18 -0400
X-MC-Unique: oPD9VeQ7ODaxy_zp4PxVow-1
Received: by mail-qv1-f72.google.com with SMTP id
 o9-20020a0cecc9000000b0047491274bb1so7682437qvq.19
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 04:59:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=VnWYyKBR431FlBZi2ksePWmmZA0X4aalhIgZbd1hifM=;
 b=Sl+sE00ptV+qTkU56MqlLgTsWODvABbdGlkhWSZ95Cf/iFmlL0/zLejBkPEoi48iXu
 ur6VCLfG8Acb6IJsAVycqR6nmYSa/2G4xdIxf3/R8i63KOxkg0yW+m2e4CNi29r1rp4l
 dYeZWVq95WSzRPJVj4NoIoKiC5lwgaXDpVyQqtPZl7/xRevSan/bTMB1VJPB/5pSkT13
 2YSwbOFV6qbrcCPSLPziSQvUewlZ9jGWVOvQmlQYQT93ZRqve0MgYGNz8VZDAWIp2W07
 yVpwLsi9ms//RBu3EWJNiRM7qbrku6gY21JdCnVVqY6iRctCh0Vz9+yjGPplXq+pkuNt
 f2CA==
X-Gm-Message-State: ACgBeo1/APDdfhwZrzip00y4eZkzIUcw65SSa4FDR7VVYF+JVs7xd4r5
 3uJEH9Js7AaULvIFS7NbVednbmO2DuR42Zz1AyxkwBDOsLvoSJVM2EaNhv42Ys8uFoTcAAV7Dl6
 lSpdaDC0ZxYv28DYMWJHl3L/haNUjQSQW+i6ajebXug==
X-Received: by 2002:ad4:5f48:0:b0:476:787f:1cd with SMTP id
 p8-20020ad45f48000000b00476787f01cdmr23711946qvg.77.1660132758433; 
 Wed, 10 Aug 2022 04:59:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5dnRHl2umC88IMm/4aTtQ3oeOyJpR6eBORHZIEUB+WzB8eubnz6LY7Di7kdOm96dMaSKOqBpsWjSMnkxxXh9s=
X-Received: by 2002:ad4:5f48:0:b0:476:787f:1cd with SMTP id
 p8-20020ad45f48000000b00476787f01cdmr23711934qvg.77.1660132758248; Wed, 10
 Aug 2022 04:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
 <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
In-Reply-To: <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 10 Aug 2022 13:59:07 +0200
Message-ID: <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
To: Computer Enthusiastic <computer.enthusiastic@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 10, 2022 at 12:42 PM Computer Enthusiastic
<computer.enthusiastic@gmail.com> wrote:
>
> Hello,
>
> The "supend to ram" issue (system freeze when resuming after suspend
> to ram or disk hibernation) is still affecting the nouveau kernel
> module from linux version 5 and above with nvidia GeForce 9600M GT and
> other nvidia graphic card with the same chipset [1][2][3].
>
> I've been successfully using the "work in progress" patch by Karol
> Herbst [4] to solve the "supend to ram" issue since it was proposed
> for an apparent different issue ("[GT216][Linux 5.16.4] Long stalls in
> dma_fence_default_wait") [5] whose root cause is probably the same.
>
> I send this message to bring to your attention the aforementioned
> patch [4] (below in the message as text) to evaluate it for  the next
> steps for possible inclusion  in the upstream kernel version.
>

I think it might be better to CC Ben and Lyude, who _might_ have a
good idea on what's the proper patch, but maybe the patch is fine as
it is?

> Thanks.
>
> [1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#5
> [3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
> [4] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156#note_1385770
> [5] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
>
> ----- %= ----- %= ----- %=
>
> From 70271cb0aa30e4523d39c3942e84b16fe18338f5 Mon Sep 17 00:00:00 2001
> From: Karol Herbst <kherbst@redhat.com>
> Date: Mon, 16 May 2022 17:40:20 +0200
> Subject: [PATCH] nouveau WIP
>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 05076e530e7d..b6343741eda6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -820,6 +820,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo,
> int evict,
>   if (ret == 0) {
>   ret = nouveau_fence_new(chan, false, &fence);
>   if (ret == 0) {
> + nouveau_fence_wait(fence, false, false);
>   ret = ttm_bo_move_accel_cleanup(bo,
>   &fence->base,
>   evict, false,
> --
> 2.35.3
>

