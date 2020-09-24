Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD052773EF
	for <lists+nouveau@lfdr.de>; Thu, 24 Sep 2020 16:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0DD06E45D;
	Thu, 24 Sep 2020 14:29:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
 [209.85.217.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E8C36E45D
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 14:29:29 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id 7so2240907vsp.6
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 07:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8M9fjGZbr5pOzbxoVIxhe8l1oW7CZ6sxKur9yIXaE5c=;
 b=S+F/ILEg9Dbvcbn5qEmFEV1i2wAiHUdeMOBOfqsW8f/zzLGGP7y18zSgwmpypcSww9
 5oM+PSp3fciyhWDUq0Z4PEsTH/PlJeRM9LFpz+Z5mLu1E2v8NWKZ3cemjcPam7FZPtro
 wPp++m+yNGfXeYcKlFYk9wh9dI04b3v0qT2PHAJRwd/VPoaImH1c4/bZRMefqTEAJGgh
 jzr76VpaCGA1ScsVlH/RSAMLHfcuH9k0x6PvAISUwtM06HjrGmjFVG0F7DzmGjgu/auo
 jCMhif/a553XdJD5RGmG72IakLOkW4AToPsqkOsLmJKrDeFw6VklB6WsG8utkD8X2ci6
 J48g==
X-Gm-Message-State: AOAM533YJDdLkMOcm+cSmtNS/mdcp//TB3YxH42+Y5ng+c0XgKZui6EJ
 VlDNNYypuz8LhLYbTPplQ97Vc3hYAbTZHhvRkIvsf8B5BSg=
X-Google-Smtp-Source: ABdhPJw2Vn1N9Sc+3mVz4o3GEo8if2l6VeF13ziBDU0GCsGcHufn03C3Tk56eZBZ1rtRPfSFw8UZaCXVZQGSkR0GlZU=
X-Received: by 2002:a67:fe8f:: with SMTP id b15mr4050204vsr.46.1600957768171; 
 Thu, 24 Sep 2020 07:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
 <20200923203918.GA37078@xps13>
 <CACO55ttM+wmbcYz6h5qeEb9_Ta=JcnRzURFYu3-9GJPMHzdFeg@mail.gmail.com>
 <c04d84e2-9091-a22c-c3e4-e43e4ee72057@spliet.org>
In-Reply-To: <c04d84e2-9091-a22c-c3e4-e43e4ee72057@spliet.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 24 Sep 2020 10:29:17 -0400
Message-ID: <CAKb7UvhJ+OR0tj_73qcO=FHj3pvSz+LmQwCSN_sun0T28cCVLA@mail.gmail.com>
To: Roy Spliet <nouveau@spliet.org>
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 9:06 AM Roy Spliet <nouveau@spliet.org> wrote:
>
>
> Op 23-09-2020 om 22:36 schreef Karol Herbst:
> > On Wed, Sep 23, 2020 at 10:39 PM Jeremy Cline <jcline@redhat.com> wrote:
> >>
> >> On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> >>> On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline@redhat.com> wrote:
> >>
> >> <snip>
> >>
> >>> yeah, I think overall this file is a good idea and being able to get a
> >>> quick overview over the driver is helpful. I think if we focus on the
> >>> user facing things first, like the hwmon or other things users
> >>> generally interact with would be helpful. I think if we start to
> >>> document areas where there are many low hanging fruits, this could
> >>> help random people to start with easier tasks and get more used to the
> >>> driver overall, so I'd probably ignore most of the stuff which really
> >>> requires a fundamental understanding on how things work and focus more
> >>> on vbios parsing (which has annoying interfaces anyway and it might
> >>> make sense to make it more consistent and nicer to use) and/or simple
> >>> code interfacing with the mmio space.
> >>>
> >>
> >> I'll admit to being motivated by entirely selfish reasons. I know
> >> practically nothing about nouveau and I'm the type of person who likes
> >> to keep notes about how things work together, both free form and
> >> structured in-line docs. All that to say, I think focusing on the
> >> "low-hanging fruit" stuff will be very beneficial and I'm happy to do
> >> that, but I'm also interested in documenting everything else I run
> >> across.
> >>
> >
> > yeah, that's fine. I was just giving a suggestion on where the initial
> > focus should be on.
> >
> >>> Eg some users have problems with their fans as they are either always
> >>> ramping up to max, or not running at all... GPUs temperature or power
> >>> consumption is reporting incorrectly... all those things users hit
> >>> regularly, but which isn't really important enough so it just falls
> >>> under the table even if it gets reported.
> >>>
> >>
> >> This does bring up an interesting point about organization and target
> >> audiences. Typically when I'm writing documentation I like to organize
> >> things by target audiences, so we could have a layout like:
> >>
> >> * General Introduction
> >>
> >> * User Guide
> >>      - Overview of supported hardware/features/etc
> >
> > That's best to document in a wiki though. And we had plans to convert
> > the existing old wiki over to gitlab. And maybe It think we really
> > should do that and clean it up while we work on that. It's just a huge
> > project but maybe just starting with whatever you want to do would be
> > fine and after a while nothing is left. Anyway, I think we should
> > discuss this more openly with the others as well. i don't like the
> > current wiki anyway, as only approved developers can change things and
> > with a gitlab wiki we could even take MRs on stuff.
> >
> >>      - Installation
> >
> > well.. I think this can be skipped ;) But still, also belongs more
> > into a wiki. I think what we could cover here is to how to clean up
> > remaining stuff from the blob driver as this is something which comes
> > up quite a lot on IRC though.
> >
> >>      - Configuration (module parameters and such)
> >>      - Troubleshooting
> >
> > that would be cool to have in the wiki as well. Just collecting the
> > most common issue and document it there. Especially if it is on
> > gitlab, users can just do that as well :)
> >
> >>      - Getting Involved (bug reporting, running tests, etc)
> >
> > yeah, and we have some stuff on that on the old wiki already, it's
> > just very outdated and needs updating, which as said above can only be
> > done by developers and developers sadly have other things to do :)
> >
> >>
> >> * Developer Guide
> >>      - Architecture Overview
> >>      - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
> >>      - Internal APIs
> >
> > Right, those things I'd like to see in the kernel tree actually.
> >
> >>      - Debugging and Development Tools
> >>      - Contribution Guide
> >>
> >
> > Those I think belong more into the wiki again. The latter is a bit
> > hard to split as there are kernel guides, but also community and
> > project guides. Mesa does things differently than let's say the
> > kernel. And Nouveau is still in this limbo state being on the old
> > infra, but also on the new one with mesa...
> >
> >> I'm not sure how much stuff people want to keep on the
> >> nouveau.freedesktop.org wiki vs here.
> >>
> >
> > I think the first step actually is to set up a proper nouveau project
> > on gitlab for dealing with issues and the wiki. I would be fine to do
> > that and we can also move the code there late. But maybe let's start
> > with the wiki :)
>
> Risking to turn this into a "let's fix everything in one go" project
> that ends up never getting finished, I just want to make sure that
> everybody is also aware of the documentation generated from Envytools
> [0]. Especially "architecture overview" (that is, if we're talking about
> hardware architecture and not driver/software architecture) might be
> better suited in envytools.
>
> As for module parameters, IMHO modinfo is supposed to be the source of
> information. It's sadly lacking any "sub-"option inside nouveau.config
> and nouveau.debug, which may be by design. Perhaps expanding the modinfo
> explanations can help cover at least all the other options in a way that
> never gets out of sync with source code.

The general idea of envytools was to document NVIDIA GPUs, and to a
lesser extent, some blob details which may not be intrinsic to the
hardware itself. The idea of this patch appears to be documenting how
nouveau works, which is a different and largely unrelated goal. I
think it'd be a bit much to document in great detail the inner
workings of the GPUs in the kernel, I don't think there's precedent
for it, and it's just not the right place for it.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
