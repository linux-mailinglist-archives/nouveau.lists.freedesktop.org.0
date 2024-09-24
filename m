Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B42984E2B
	for <lists+nouveau@lfdr.de>; Wed, 25 Sep 2024 00:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFEC10E0FC;
	Tue, 24 Sep 2024 22:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KWpFvnR6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537E410E0FC
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 22:52:48 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2f761461150so73402551fa.0
 for <nouveau@lists.freedesktop.org>; Tue, 24 Sep 2024 15:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727218366; x=1727823166; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DG6xrNPym56aK8LAKmxMfrGHarHScAF79oavhZ2Vtmk=;
 b=KWpFvnR6DEtglookoUGWofTBCtbqSKzegXmC23f5w3wQBwnDygpv9dlQoOyqse/u32
 VObNZtdleh9KOi6eyG24Aa+br2/zBe7aNSX/iwJC3CtC5ee6AdrlNpN0CGXTrLn7IDVR
 PG1Gqolqe4ZCtU8jNnj8LK9WONFmFQpN1qRLcQPAOaCYBKWQQjLc2f+oVgp3VoNUaFcG
 zdc9VpuRvQoxxeEGiVYfQ21C/qn9TUfN09zsz5vWYc/zZpq4EzNiGIRVi9Q3fwoCa4ZK
 e3hmS/6bZbjIbxEbAQuQxx6jGLHXbBcPyEtOhZ3l6mdqI66huHoPGTCS532+0F/d6L5x
 Hq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727218366; x=1727823166;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DG6xrNPym56aK8LAKmxMfrGHarHScAF79oavhZ2Vtmk=;
 b=D0Z4eKfDGu37SKBacbaXEWmuwVv5b3PeKlkW7WoLf0Xv0NwcbNpoDbWDEsFVGR8OX6
 chA02JWkcR3DiprhJPhranr6I/hlmB5DSkBVzMh9QLH4drzsBaMKOLFpaNOkHOZKh8XG
 znaAeTgYVvd6zyon3GnOb/u0/mauM/oPos1DUxz8oIpqxRHFqw/3dtbBqyVEOXldooju
 U3etA6uGXIgIusYKsgsDfNXRnrK0Hg7apxSY9eH0bOeOrw62oEvO3i+Ioi4q0dSmYAOG
 NpjtfyLDHmCsl+LEAffkvwge8ZB27+DFY4A0dRoDzVUWxZ8u5a4ZCRp/ywiunVosp/iL
 gFnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXrRsQlXkI6sCJTcZRPyfJYtMRLIkNG1T0OEehgwnVS1+cNy+lEWlleX+S6rAGgsFLl0sTnMYl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLMp/T900V5gus+qQUG/xbJEYFzgQWEjSYHNp6Qt4MTk7mzD4u
 Achh6w1eaD1Oam5F8cLqGUVsk9ex3zSUWBJAKzA1bpSQLGNelj6BXWfuOdl6jQs2H82dRXQFHyl
 GpMczEQZgsqYZeVuRL+5osWxYUFY=
X-Google-Smtp-Source: AGHT+IHehfdQqVpDfskG5qXL6TYOLMF3UxYA7HT7uW2SOYu3NMSBWbS/7HpJB2G+T4wMgezitrxjqDunEmdwKZ7hbkc=
X-Received: by 2002:a2e:4a02:0:b0:2f7:c7f3:1d2e with SMTP id
 38308e7fff4ca-2f915ff7e2cmr5896861fa.19.1727218365822; Tue, 24 Sep 2024
 15:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <ZvErg51xH32b8iW6@pollux>
 <20240923150140.GB9417@nvidia.com> <ZvHwzzp2F71W8TAs@pollux.localdomain>
 <20240924164151.GJ9417@nvidia.com> <ZvMZisyZFO888N0E@cassiopeiae>
In-Reply-To: <ZvMZisyZFO888N0E@cassiopeiae>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 25 Sep 2024 08:52:32 +1000
Message-ID: <CAPM=9twKGFV8SA165QufaGUev0tnuHABAi0TMvDQSfa7PJfZaQ@mail.gmail.com>
Subject: Re: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 kvm@vger.kernel.org, 
 nouveau@lists.freedesktop.org, alex.williamson@redhat.com, 
 kevin.tian@intel.com, daniel@ffwll.ch, acurrid@nvidia.com, cjia@nvidia.com, 
 smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
 kwankhede@nvidia.com, targupta@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 25 Sept 2024 at 05:57, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Tue, Sep 24, 2024 at 01:41:51PM -0300, Jason Gunthorpe wrote:
> > On Tue, Sep 24, 2024 at 12:50:55AM +0200, Danilo Krummrich wrote:
> >
> > > > From the VFIO side I would like to see something like this merged in
> > > > nearish future as it would bring a previously out of tree approach to
> > > > be fully intree using our modern infrastructure. This is a big win for
> > > > the VFIO world.
> > > >
> > > > As a commercial product this will be backported extensively to many
> > > > old kernels and that is harder/impossible if it isn't exclusively in
> > > > C. So, I think nova needs to co-exist in some way.
> > >
> > > We'll surely not support two drivers for the same thing in the long term,
> > > neither does it make sense, nor is it sustainable.
> >
> > What is being done here is the normal correct kernel thing to
> > do. Refactor the shared core code into a module and stick higher level
> > stuff on top of it. Ideally Nova/Nouveau would exist as peers
> > implementing DRM subsystem on this shared core infrastructure. We've
> > done this sort of thing before in other places in the kernel. It has
> > been proven to work well.
>
> So, that's where you have the wrong understanding of what we're working on: You
> seem to think that Nova is just another DRM subsystem layer on top of the NVKM
> parts (what you call the core driver) of Nouveau.
>
> But the whole point of Nova is to replace the NVKM parts of Nouveau, since
> that's where the problems we want to solve reside in.

Just to re-emphasise for Jason who might not be as across this stuff,

NVKM replacement with rust is the main reason for the nova project,
100% the driving force for nova is the unstable NVIDIA firmware API.
The ability to use rust proc-macros to hide the NVIDIA instability
instead of trying to do it in C by either generators or abusing C
macros (which I don't think are sufficient).

The lower level nvkm driver needs to start being in rust before we can
add support for newer stuff.

Now there is possibly some scope about evolving the rust pieces in it
as, rust wrapped in C APIs to make things easier for backports or
avoid some pitfalls, but that is a discussion that we need to have
here.

I think the idea of a nova drm and nova core driver architecture is
acceptable to most of us, but long term trying to main a nouveau based
nvkm is definitely not acceptable due to the unstable firmware APIs.

Dave.
