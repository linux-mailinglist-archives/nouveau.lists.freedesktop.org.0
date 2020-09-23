Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CCE276244
	for <lists+nouveau@lfdr.de>; Wed, 23 Sep 2020 22:39:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DA16E9FB;
	Wed, 23 Sep 2020 20:39:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D246E9FA
 for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2020 20:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600893566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WoxEyTVMXxj2FaYpIzAG9n+Tb+rbPt41uNn1Dv+OZ8I=;
 b=GTcabSB1YA/44v7FbgP1+CBFHhs9QvfwR/m6ltKTwUL4fMCS93Nt/KozyXoh5f+ojqrN1C
 jPkHzrR/EmLO0w3oMBGRkNfRifShYf4Q/xsE7fIQjm5+0jBLeexatwqH1adil176V/iPID
 IvfCmp2Uz/8z7IHoK4WqNaortQ8A/fk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-AouXi_24PjGbqILDfc67IQ-1; Wed, 23 Sep 2020 16:39:21 -0400
X-MC-Unique: AouXi_24PjGbqILDfc67IQ-1
Received: by mail-qt1-f200.google.com with SMTP id a16so888869qtj.7
 for <nouveau@lists.freedesktop.org>; Wed, 23 Sep 2020 13:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WoxEyTVMXxj2FaYpIzAG9n+Tb+rbPt41uNn1Dv+OZ8I=;
 b=HDfA9z+W4AXCSQO1+HS9/5F2zfuF3fSdyxqovlmmzm2AWdLUDUVZ1cvhlY2q1zyDvV
 QFvpGzPvupOwWvx4dfvzGZlDPM0H8wAsYkxrxAn8/4hFdp65XAU9WuD3qgvXCTBmPzm9
 pQlxDR4SuPIgT89nYCFDOWUIaYgKKwFKvDttRjiFXyJ4UZYgwg0oXA+wHTj8QXA6uvTB
 2nh/04OgQfk5l//bMahnaYTW5MzYO7pl+skmxzFqPiaqlaGzznucgLI1Izj+RRx0pzSE
 CAMUHlqNffkwPudHVzeOqwGxkiRXAkz7ziFYAr11cX3jHt+Ud0hItyeph3xS0WNgbdG6
 hFlw==
X-Gm-Message-State: AOAM533V+dIK61jYTArCewL/fMXQ60xJdUWju8o4NbncUGOli6YTfntc
 Ny/x8jXYlYz8QX578gFPR38df1pTBbtNTCsyu0aL2xrlaEzTPZVFrvAU8Wm1lJAb3J/QNPYCRDH
 lp9qRRY4cZ27pVB4XnaEFCuwgDw==
X-Received: by 2002:aed:3bf1:: with SMTP id s46mr1970508qte.389.1600893560883; 
 Wed, 23 Sep 2020 13:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGO9BLUaO6GtmBD7VMbREP58vrVp2TCZWNBrKt2Xtr60KrHAfoqZnwBcm5vMcX+dJCUc0aqw==
X-Received: by 2002:aed:3bf1:: with SMTP id s46mr1970477qte.389.1600893560474; 
 Wed, 23 Sep 2020 13:39:20 -0700 (PDT)
Received: from xps13 ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id z26sm684107qkj.107.2020.09.23.13.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 13:39:19 -0700 (PDT)
Date: Wed, 23 Sep 2020 16:39:18 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20200923203918.GA37078@xps13>
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline@redhat.com> wrote:

<snip>

> yeah, I think overall this file is a good idea and being able to get a
> quick overview over the driver is helpful. I think if we focus on the
> user facing things first, like the hwmon or other things users
> generally interact with would be helpful. I think if we start to
> document areas where there are many low hanging fruits, this could
> help random people to start with easier tasks and get more used to the
> driver overall, so I'd probably ignore most of the stuff which really
> requires a fundamental understanding on how things work and focus more
> on vbios parsing (which has annoying interfaces anyway and it might
> make sense to make it more consistent and nicer to use) and/or simple
> code interfacing with the mmio space.
> 

I'll admit to being motivated by entirely selfish reasons. I know
practically nothing about nouveau and I'm the type of person who likes
to keep notes about how things work together, both free form and
structured in-line docs. All that to say, I think focusing on the
"low-hanging fruit" stuff will be very beneficial and I'm happy to do
that, but I'm also interested in documenting everything else I run
across.

> Eg some users have problems with their fans as they are either always
> ramping up to max, or not running at all... GPUs temperature or power
> consumption is reporting incorrectly... all those things users hit
> regularly, but which isn't really important enough so it just falls
> under the table even if it gets reported.
> 

This does bring up an interesting point about organization and target
audiences. Typically when I'm writing documentation I like to organize
things by target audiences, so we could have a layout like:

* General Introduction

* User Guide
    - Overview of supported hardware/features/etc
    - Installation
    - Configuration (module parameters and such)
    - Troubleshooting
    - Getting Involved (bug reporting, running tests, etc)

* Developer Guide
    - Architecture Overview
    - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
    - Internal APIs
    - Debugging and Development Tools
    - Contribution Guide

I'm not sure how much stuff people want to keep on the
nouveau.freedesktop.org wiki vs here.

> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > index 5a96c942d912..76b90d7ddfc6 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
> > @@ -1,22 +1,57 @@
> >  /* SPDX-License-Identifier: MIT */
> > +
> > +/**
> > + * DOC: Overview
> > + *
> > + * Interfaces for working with the display engine.
> > + */
> > +
> >  #ifndef __NVKM_DISP_H__
> >  #define __NVKM_DISP_H__
> > +
> > +/**
> > + * nvkm_disp() - Get a &struct nvkm_disp from a &struct nvkm_engine.
> > + *
> > + * @p: A &struct nvkm_engine reference.
> > + *
> > + * Return: The &struct nvkm_disp that contains the given engine.
> > + */
> >  #define nvkm_disp(p) container_of((p), struct nvkm_disp, engine)
> >  #include <core/engine.h>
> >  #include <core/event.h>
> >
> > +/**
> > + * struct nvkm_disp - Represents a display engine.
> > + *
> > + * This structure is for <some abstraction here>. It has <some assumptions
> > + * about its usage here>.
> > + */
> >  struct nvkm_disp {
> > +    /** @func: Chipset-specific vtable for manipulating the display. */
> >         const struct nvkm_disp_func *func;
> > +
> > +    /** @engine: The engine for this display. */
> >         struct nvkm_engine engine;
> >
> > +    /** @head: list of heads attached to this display. */
> >         struct list_head head;
> > +
> > +    /** @ior: List of IO resources for this display. */
> >         struct list_head ior;
> > +
> > +    /** @outp: List of outputs for this display. */
> >         struct list_head outp;
> > +
> > +    /** @conn: List of connectors for this display. */
> >         struct list_head conn;
> >
> > +    /** @hpd: An event that fires when something happens I guess. */
> >         struct nvkm_event hpd;
> > +
> > +    /** @vblank: An event that fires and has some relation to the vblank. */
> >         struct nvkm_event vblank;
> >
> > +    /** @client: The oproxy (?) client for this display. */
> >         struct nvkm_oproxy *client;
> >  };
> 
> generally not a big fan of "int a; // a is an int" kind of
> documentation. But if it would specify constraints or details on how
> it's valid to use those fields, then it makes totally sense to add
> stuff.

Definitely, I think that is not particularly helpful documentation. Of
course, the what and why of a function parameter or struct member is
very likely to be more interesting than that, but it's true that every
once in a while that the variable name can be so clear there's not much
else to say.

I think it's fair to say the documentation I added for the above struct
is not good. I think it's also fair to say that a new-comer such as
myself who stumbles upon this structure has practically no chance of
guessing what it's all about without reading a bunch of additional code.
My first guess was that it represented a display I had plugged in, which
at this point I'm fairly confident is not at all correct. It required me
to look at many users of this struct along with perusing envytools
documentation to guess it represented a display engine.

It may well be I'm an exceptionally slow learner, but even short notes
can be extremely helpful.

> 
> not sure if you were aware of it, but we have some documentation on
> the module options here:
> https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> 
> But I think it makes sense to move it into the source code and link to
> the new thing from the wiki then.
> 

Indeed, and in fact I started this documentation from the wiki, but
tried my best to fill in the missing parameters and config options (you
don't happen to know what the NvAcrWpr* config options do, do you?)

Thanks!

- Jeremy

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
