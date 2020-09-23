Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A183B276339
	for <lists+nouveau@lfdr.de>; Wed, 23 Sep 2020 23:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96F076EA05;
	Wed, 23 Sep 2020 21:37:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8598A6EA05
 for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2020 21:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600897032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LqGH3qwcCMfMPD67hSTdgnqIJd4Qv6+l8bPu0Ejj+0w=;
 b=D4EkanMBhwowvhidlBDV0M/yasBP/g8gTOrCLmD20coPCmN1tTxZZIsWo3UsXu5TQ5h0uP
 tyVbdqK1L46NyB++hf3eO2xPhOowVgs2iuVd633FMY7prQ7+qfVFKARxeIbnB9bfG2WzQB
 DXPsrIdR7HR54WrIQPdtSFUYnUlooB8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-WZfOqKCXOc6SsP5qj2DnBw-1; Wed, 23 Sep 2020 17:37:07 -0400
X-MC-Unique: WZfOqKCXOc6SsP5qj2DnBw-1
Received: by mail-qt1-f198.google.com with SMTP id g1so941813qtc.22
 for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2020 14:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LqGH3qwcCMfMPD67hSTdgnqIJd4Qv6+l8bPu0Ejj+0w=;
 b=V9zjCVbRU0prsisypd+kBkh1qcQ/fHVAHi6A7oDI9ccNVMjBxj1OquZEZREpB0kdJA
 KGT+Iy8Ej2tDZjMsBimbnTYlU9d2QHSJ2q38JyWZZnOB2zylNNvTFfEsLnwGC9aBTTPw
 DIuTqJa6KHRRhfttNZnV6mRiGBrETvMfiH1cl5lG9YVqKMNoZaFZIl3WWQxdMf0FjsjI
 mf1GSAgyFy6F7ZKVUApwUU7qcog+6k6Ypk5H7cKpkM+2r49ALoJ+FwAUafAJPtaCOdQG
 q8ze4NIMSRRR7f+I+JGL72I9ed8sYKKF1J0PeE68s72Uix8YTux2g7Z8XVotTD5KBCug
 HHnA==
X-Gm-Message-State: AOAM533aQ8ShtvI+x6he52R3jpbP3eoTU3xDAWi1XxxpYgeN6DU5tJCn
 um6wC2EIOG0PRmbxNHqpq1TnhRhHRFSCdNya6zXKWzHX/JPBALV8bHgMyXkhro2Y7SWHu/8LZFm
 kuNmpKuE/GLa++4vpm+4y9ysmmLGjGCQc+l66zyz1IQ==
X-Received: by 2002:a37:7e42:: with SMTP id z63mr1996877qkc.62.1600897026155; 
 Wed, 23 Sep 2020 14:37:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5XUhbJ7JmZnVNq8r0FcouoHAhkXYsylpekCprrI/VwPbQ9nHEy/EcLxXBUaGRe2WKnK6I3DPy0Kwlr8Xx2ng=
X-Received: by 2002:a37:7e42:: with SMTP id z63mr1996844qkc.62.1600897025737; 
 Wed, 23 Sep 2020 14:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
 <20200923203918.GA37078@xps13>
In-Reply-To: <20200923203918.GA37078@xps13>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 23 Sep 2020 23:36:54 +0200
Message-ID: <CACO55ttM+wmbcYz6h5qeEb9_Ta=JcnRzURFYu3-9GJPMHzdFeg@mail.gmail.com>
To: Jeremy Cline <jcline@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [RFC] Documentation: nouveau: Introduce some nouveau
 documentation
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 23, 2020 at 10:39 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> > On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> <snip>
>
> > yeah, I think overall this file is a good idea and being able to get a
> > quick overview over the driver is helpful. I think if we focus on the
> > user facing things first, like the hwmon or other things users
> > generally interact with would be helpful. I think if we start to
> > document areas where there are many low hanging fruits, this could
> > help random people to start with easier tasks and get more used to the
> > driver overall, so I'd probably ignore most of the stuff which really
> > requires a fundamental understanding on how things work and focus more
> > on vbios parsing (which has annoying interfaces anyway and it might
> > make sense to make it more consistent and nicer to use) and/or simple
> > code interfacing with the mmio space.
> >
>
> I'll admit to being motivated by entirely selfish reasons. I know
> practically nothing about nouveau and I'm the type of person who likes
> to keep notes about how things work together, both free form and
> structured in-line docs. All that to say, I think focusing on the
> "low-hanging fruit" stuff will be very beneficial and I'm happy to do
> that, but I'm also interested in documenting everything else I run
> across.
>

yeah, that's fine. I was just giving a suggestion on where the initial
focus should be on.

> > Eg some users have problems with their fans as they are either always
> > ramping up to max, or not running at all... GPUs temperature or power
> > consumption is reporting incorrectly... all those things users hit
> > regularly, but which isn't really important enough so it just falls
> > under the table even if it gets reported.
> >
>
> This does bring up an interesting point about organization and target
> audiences. Typically when I'm writing documentation I like to organize
> things by target audiences, so we could have a layout like:
>
> * General Introduction
>
> * User Guide
>     - Overview of supported hardware/features/etc

That's best to document in a wiki though. And we had plans to convert
the existing old wiki over to gitlab. And maybe It think we really
should do that and clean it up while we work on that. It's just a huge
project but maybe just starting with whatever you want to do would be
fine and after a while nothing is left. Anyway, I think we should
discuss this more openly with the others as well. i don't like the
current wiki anyway, as only approved developers can change things and
with a gitlab wiki we could even take MRs on stuff.

>     - Installation

well.. I think this can be skipped ;) But still, also belongs more
into a wiki. I think what we could cover here is to how to clean up
remaining stuff from the blob driver as this is something which comes
up quite a lot on IRC though.

>     - Configuration (module parameters and such)
>     - Troubleshooting

that would be cool to have in the wiki as well. Just collecting the
most common issue and document it there. Especially if it is on
gitlab, users can just do that as well :)

>     - Getting Involved (bug reporting, running tests, etc)

yeah, and we have some stuff on that on the old wiki already, it's
just very outdated and needs updating, which as said above can only be
done by developers and developers sadly have other things to do :)

>
> * Developer Guide
>     - Architecture Overview
>     - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
>     - Internal APIs

Right, those things I'd like to see in the kernel tree actually.

>     - Debugging and Development Tools
>     - Contribution Guide
>

Those I think belong more into the wiki again. The latter is a bit
hard to split as there are kernel guides, but also community and
project guides. Mesa does things differently than let's say the
kernel. And Nouveau is still in this limbo state being on the old
infra, but also on the new one with mesa...

> I'm not sure how much stuff people want to keep on the
> nouveau.freedesktop.org wiki vs here.
>

I think the first step actually is to set up a proper nouveau project
on gitlab for dealing with issues and the wiki. I would be fine to do
that and we can also move the code there late. But maybe let's start
with the wiki :)

> > > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > > index 5a96c942d912..76b90d7ddfc6 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > > @@ -1,22 +1,57 @@
> > >  /* SPDX-License-Identifier: MIT */
> > > +
> > > +/**
> > > + * DOC: Overview
> > > + *
> > > + * Interfaces for working with the display engine.
> > > + */
> > > +
> > >  #ifndef __NVKM_DISP_H__
> > >  #define __NVKM_DISP_H__
> > > +
> > > +/**
> > > + * nvkm_disp() - Get a &struct nvkm_disp from a &struct nvkm_engine.
> > > + *
> > > + * @p: A &struct nvkm_engine reference.
> > > + *
> > > + * Return: The &struct nvkm_disp that contains the given engine.
> > > + */
> > >  #define nvkm_disp(p) container_of((p), struct nvkm_disp, engine)
> > >  #include <core/engine.h>
> > >  #include <core/event.h>
> > >
> > > +/**
> > > + * struct nvkm_disp - Represents a display engine.
> > > + *
> > > + * This structure is for <some abstraction here>. It has <some assumptions
> > > + * about its usage here>.
> > > + */
> > >  struct nvkm_disp {
> > > +    /** @func: Chipset-specific vtable for manipulating the display. */
> > >         const struct nvkm_disp_func *func;
> > > +
> > > +    /** @engine: The engine for this display. */
> > >         struct nvkm_engine engine;
> > >
> > > +    /** @head: list of heads attached to this display. */
> > >         struct list_head head;
> > > +
> > > +    /** @ior: List of IO resources for this display. */
> > >         struct list_head ior;
> > > +
> > > +    /** @outp: List of outputs for this display. */
> > >         struct list_head outp;
> > > +
> > > +    /** @conn: List of connectors for this display. */
> > >         struct list_head conn;
> > >
> > > +    /** @hpd: An event that fires when something happens I guess. */
> > >         struct nvkm_event hpd;
> > > +
> > > +    /** @vblank: An event that fires and has some relation to the vblank. */
> > >         struct nvkm_event vblank;
> > >
> > > +    /** @client: The oproxy (?) client for this display. */
> > >         struct nvkm_oproxy *client;
> > >  };
> >
> > generally not a big fan of "int a; // a is an int" kind of
> > documentation. But if it would specify constraints or details on how
> > it's valid to use those fields, then it makes totally sense to add
> > stuff.
>
> Definitely, I think that is not particularly helpful documentation. Of
> course, the what and why of a function parameter or struct member is
> very likely to be more interesting than that, but it's true that every
> once in a while that the variable name can be so clear there's not much
> else to say.
>
> I think it's fair to say the documentation I added for the above struct
> is not good. I think it's also fair to say that a new-comer such as
> myself who stumbles upon this structure has practically no chance of
> guessing what it's all about without reading a bunch of additional code.
> My first guess was that it represented a display I had plugged in, which
> at this point I'm fairly confident is not at all correct. It required me
> to look at many users of this struct along with perusing envytools
> documentation to guess it represented a display engine.
>

yeah, but given that you run into the confusion you can actually
document this and leave a comment addressing that. So describing a
little bit what the engine does, what are heads, iors and outputs,
etc... I think getting the high level overview should be the focus
atm. We can always deal with the technical details later as those are
usually easier to get once you have a rough idea on what's going on.

> It may well be I'm an exceptionally slow learner, but even short notes
> can be extremely helpful.
>
> >
> > not sure if you were aware of it, but we have some documentation on
> > the module options here:
> > https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> >
> > But I think it makes sense to move it into the source code and link to
> > the new thing from the wiki then.
> >
>
> Indeed, and in fact I started this documentation from the wiki, but
> tried my best to fill in the missing parameters and config options (you
> don't happen to know what the NvAcrWpr* config options do, do you?)
>

I only know that this option specifies the version of the ACR WPR
firmware to load, but I don't know what that actually is :)

> Thanks!
>
> - Jeremy
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
