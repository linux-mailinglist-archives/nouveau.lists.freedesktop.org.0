Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE51D58F3E5
	for <lists+nouveau@lfdr.de>; Wed, 10 Aug 2022 23:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD018D215;
	Wed, 10 Aug 2022 21:36:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556A5914DC
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660167356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5ay9tk8uTy+hvyllGM1M62hdAGJQ9c5LICkWxYSMzls=;
 b=PXko1LJJTTz3IIsGVXIfI3XN5F9EP/N6z0gJG3WH+d6j0QTgVv6MZcxuPNOnC06etSxypF
 VkxKZDCVuLl/2dR2vo+wJohJwhQsw19Rllf9WyrGoJpEfT437U2ihGmV9sJ9blN4GCYzb1
 zt/e2o2KL6l5Oiuetid5mlUVvjW2v+U=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-299-zlMp3k-YOZOpC2sNL5qGYQ-1; Wed, 10 Aug 2022 17:35:55 -0400
X-MC-Unique: zlMp3k-YOZOpC2sNL5qGYQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 e30-20020ac8011e000000b00342f61e67aeso8082379qtg.3
 for <nouveau@lists.freedesktop.org>; Wed, 10 Aug 2022 14:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=5ay9tk8uTy+hvyllGM1M62hdAGJQ9c5LICkWxYSMzls=;
 b=n16xXZXya01OTtfhejUytomuM6e0hgkkecyvEu7KaYxJNLQiWS9+EQu+0uym+QwDuC
 IUTHbOL1aZQlon5KZheklrp+mrKnSXC74BAG85zYdEUUy/1BhtETFZvBkvXI3f0a6Qxt
 zQlh5LCzVitDqOCWpDlDZvW+1cDiv7yBtyBm9kfCLPQFBRUA7r4/L96mD7uC45DCEpIP
 3dkM8W7Tc4bb2EOM/jJzZFq/lwo5K/XgBxMVXlIPBeWJ/CNVsU1US3M9v8AeRGzQ4DSl
 e6hhbVxMZJtoJz/WCowca+IzPewxyz2zz5LjfS/yvxld/xNmj9apxMoRn4oB6z+LRGae
 FOIg==
X-Gm-Message-State: ACgBeo2r39AK1ef3YZc7d+oc1NMAJS9RpAcpS4KALs/Xitq1AK7eE18a
 t59BhEk2sWDBohn25uPentr7FZdy+RbmLMdKqqfq/KlvR7uYaj4Jd0UgVwlLVdjDWdRufX/Q1Tv
 DCOy6FpcZ1DSan2epsOnfgPNtwQ==
X-Received: by 2002:a05:620a:2451:b0:6b9:ab33:64c3 with SMTP id
 h17-20020a05620a245100b006b9ab3364c3mr2970538qkn.565.1660167354539; 
 Wed, 10 Aug 2022 14:35:54 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7gf+8EEumm/WsRQd3xkMo11EIyiVDmHrzM6TKJGbD5VgUYpQ3viKhgUf5ZePo7pTk45Cr2nA==
X-Received: by 2002:a05:620a:2451:b0:6b9:ab33:64c3 with SMTP id
 h17-20020a05620a245100b006b9ab3364c3mr2970518qkn.565.1660167354299; 
 Wed, 10 Aug 2022 14:35:54 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 t25-20020ac87399000000b00342f80223adsm496932qtp.89.2022.08.10.14.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 14:35:53 -0700 (PDT)
Message-ID: <071b71819660d61d9b5caa368f683189a192754f.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, Computer Enthusiastic
 <computer.enthusiastic@gmail.com>
Date: Wed, 10 Aug 2022 17:35:52 -0400
In-Reply-To: <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
References: <CAHSpYy3G7EPhLBAiy4MgngKRqFgs1cTC-pnJb662vxxmkmxPXA@mail.gmail.com>
 <CAKb7UvhBekZhHhq=aD+hLCfOWe33whi_bScbLiDhXDwvEvbzfA@mail.gmail.com>
 <YWhgFZPqx3qKqr0C@debian.fritz.box>
 <CAKb7UviFVRe7hbtEXF6hUQh2TuZPthu+bt90h+8haf3A1FYt7g@mail.gmail.com>
 <2296778.YFyOdMMpyM@debian>
 <CAHSpYy1HJzY5kNoxk36yGRsKhmxQYP7FVM=Orn7RyKCtZc293w@mail.gmail.com>
 <CACO55tsJCPLw+UH6ADyHy62CfQKTtAwskoP86as2pwKnO7-NwQ@mail.gmail.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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

On Wed, 2022-08-10 at 13:59 +0200, Karol Herbst wrote:
> On Wed, Aug 10, 2022 at 12:42 PM Computer Enthusiastic
> <computer.enthusiastic@gmail.com> wrote:
> > 
> > Hello,
> > 
> > The "supend to ram" issue (system freeze when resuming after suspend
> > to ram or disk hibernation) is still affecting the nouveau kernel
> > module from linux version 5 and above with nvidia GeForce 9600M GT and
> > other nvidia graphic card with the same chipset [1][2][3].
> > 
> > I've been successfully using the "work in progress" patch by Karol
> > Herbst [4] to solve the "supend to ram" issue since it was proposed
> > for an apparent different issue ("[GT216][Linux 5.16.4] Long stalls in
> > dma_fence_default_wait") [5] whose root cause is probably the same.
> > 
> > I send this message to bring to your attention the aforementioned
> > patch [4] (below in the message as text) to evaluate it for  the next
> > steps for possible inclusion  in the upstream kernel version.
> > 
> 
> I think it might be better to CC Ben and Lyude, who _might_ have a
> good idea on what's the proper patch, but maybe the patch is fine as
> it is?

When the GPU starts going into suspend, TTM migrates all of the active bos in
vram over to system ram so they aren't lost. Based on what's described here
and the fact that a fence wait seems to fix it, it sounds like to me that TTM
may still be migrating bos (buffer objects) from the GPU over to system RAM
when the suspend process starts. Of course this causes those operations to get
interrupted and lose access to VRAM unexpectedly, which likely causes the
world to go boom.

So, I'm not 100% sure but I think this patch is potentially overkill since it
looks like it would fix this issue by just making all m2mf bo moves
synchronous. Thisis something we probably(?) don't want to do since if my
theory is correct, the only time we should need to do a fence wait is before
suspending the GPU in order to ensure that all m2mf operations have been
completed before continuing suspend. I think Ben would likely need to weigh
in, or you might be able to figure out the answer to this just by seeing how
we handle this with the newer method of vram blitting - the CE (copy engine).
Let me know if you need any more input, or are able to come up with a patch
that more or less does what I just described.

> 
> > Thanks.
> > 
> > [1] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues/547
> > [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#5
> > [3] https://bugzilla.kernel.org/show_bug.cgi?id=213617
> > [4] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156#note_1385770
> > [5] https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> > 
> > ----- %= ----- %= ----- %=
> > 
> > From 70271cb0aa30e4523d39c3942e84b16fe18338f5 Mon Sep 17 00:00:00 2001
> > From: Karol Herbst <kherbst@redhat.com>
> > Date: Mon, 16 May 2022 17:40:20 +0200
> > Subject: [PATCH] nouveau WIP
> > 
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_bo.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > index 05076e530e7d..b6343741eda6 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -820,6 +820,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo,
> > int evict,
> >   if (ret == 0) {
> >   ret = nouveau_fence_new(chan, false, &fence);
> >   if (ret == 0) {
> > + nouveau_fence_wait(fence, false, false);
> >   ret = ttm_bo_move_accel_cleanup(bo,
> >   &fence->base,
> >   evict, false,
> > --
> > 2.35.3
> > 
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

