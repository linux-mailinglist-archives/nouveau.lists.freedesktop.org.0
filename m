Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892FA27790C
	for <lists+nouveau@lfdr.de>; Thu, 24 Sep 2020 21:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53BE36E48C;
	Thu, 24 Sep 2020 19:17:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDA76E48C
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 19:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600975072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3MfvPnF1mqDuPci89b1ThNM7/UaDl4dGRB689LB1h4c=;
 b=gkkTJYHr+kPIBVK9Iak3sEYXpfXk9SCyCQlXiLVYhfikLCJExMe4VLLwK9eKDo8zdMl1+f
 p4FQGuGxHaSTnPmqPq4WKSCYIMxNWWnPY0UUwWLgDv8ZsAjfLdRsjcjFwZggVDqVIdbKNv
 pJNwajyuWTm+E0+Q2Y7Czk55uovHXT8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-jTh6xz-QOoG50V-cSP1PVw-1; Thu, 24 Sep 2020 15:17:47 -0400
X-MC-Unique: jTh6xz-QOoG50V-cSP1PVw-1
Received: by mail-qk1-f199.google.com with SMTP id 196so352800qkn.6
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 12:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3MfvPnF1mqDuPci89b1ThNM7/UaDl4dGRB689LB1h4c=;
 b=TxPllJ/n9PiMramdIkY74NF/EIUrR1VzF2GOcFKF6AoV/B6ZEv7WpotUvWLV8zg1Ej
 /VU3rH36OeKSPFxJfx6+azarIU6ooWe6pH0UQe3eR3KUa4S2EhcvuvpKVD3ey8yonDRh
 tmFqpqgmm6hvZP0x12y/QGV+ZRkXXnLegpZMI+G+f9tyoG8BEpGy8LdBBFCMjJXWAQym
 xyHACtVS+xDp2xZVn/vhxuvDe1yzqaRHF6fifSQema1nZlDNRtXoJO/v7F60JsqLKjQ+
 po+sD0DW2S1RW20IqcmGcuto0QHExjk9WYyHzU8xLLN1SrqLgmo3a8nItz+BywnSw/Ga
 nQ4Q==
X-Gm-Message-State: AOAM530w5tdCirt4D1tmkeryZg2CB37ZNMrt02GwdLALDPfR6MhVwtWG
 s6LpFTOxrz3KBRhJV19v65Qw8Dv0ESU6FANVPGkAQf88u3iY3aIUEI+MeHbjdfUKNtaNmmM9mrs
 MQznicv9RF6RklV7Fm04uG9/rPTvbplhPRrT1Gl57Bg==
X-Received: by 2002:a37:62c4:: with SMTP id w187mr648435qkb.102.1600975066405; 
 Thu, 24 Sep 2020 12:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyxFohHO9/nWOIDMsFoArofQGh211OAujP4mFjgeU0zp5LMoJIxo0aq8jAG8U8Xtvj8VMX9cHmJUmU+/0EAgA=
X-Received: by 2002:a37:62c4:: with SMTP id w187mr648371qkb.102.1600975065625; 
 Thu, 24 Sep 2020 12:17:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
 <20200923203918.GA37078@xps13>
 <CACO55ttM+wmbcYz6h5qeEb9_Ta=JcnRzURFYu3-9GJPMHzdFeg@mail.gmail.com>
 <20200924160255.GB12520@xps13.jcline.org>
 <CACO55tvdOWtqSLCZg+rYL--XY8sHipMTo2vDCCoJ9YD7eYhxHg@mail.gmail.com>
 <20200924181810.GB17438@xps13.jcline.org>
In-Reply-To: <20200924181810.GB17438@xps13.jcline.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 24 Sep 2020 21:17:34 +0200
Message-ID: <CACO55ttA3C3VmLfu4b68PBj6oVHDcYWf5k62dqqHM9=_arBn5A@mail.gmail.com>
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

On Thu, Sep 24, 2020 at 8:18 PM Jeremy Cline <jcline@redhat.com> wrote:
>
> On Thu, Sep 24, 2020 at 07:26:01PM +0200, Karol Herbst wrote:
> > On Thu, Sep 24, 2020 at 6:03 PM Jeremy Cline <jcline@redhat.com> wrote:
> > >
> > > On Wed, Sep 23, 2020 at 11:36:54PM +0200, Karol Herbst wrote:
> > > > On Wed, Sep 23, 2020 at 10:39 PM Jeremy Cline <jcline@redhat.com> wrote:
> > > > >
> > > > > On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> > > > > > On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline@redhat.com> wrote:
> > > > >
> > > > > <snip>
> > > > >
> > > > > > yeah, I think overall this file is a good idea and being able to get a
> > > > > > quick overview over the driver is helpful. I think if we focus on the
> > > > > > user facing things first, like the hwmon or other things users
> > > > > > generally interact with would be helpful. I think if we start to
> > > > > > document areas where there are many low hanging fruits, this could
> > > > > > help random people to start with easier tasks and get more used to the
> > > > > > driver overall, so I'd probably ignore most of the stuff which really
> > > > > > requires a fundamental understanding on how things work and focus more
> > > > > > on vbios parsing (which has annoying interfaces anyway and it might
> > > > > > make sense to make it more consistent and nicer to use) and/or simple
> > > > > > code interfacing with the mmio space.
> > > > > >
> > > > >
> > > > > I'll admit to being motivated by entirely selfish reasons. I know
> > > > > practically nothing about nouveau and I'm the type of person who likes
> > > > > to keep notes about how things work together, both free form and
> > > > > structured in-line docs. All that to say, I think focusing on the
> > > > > "low-hanging fruit" stuff will be very beneficial and I'm happy to do
> > > > > that, but I'm also interested in documenting everything else I run
> > > > > across.
> > > > >
> > > >
> > > > yeah, that's fine. I was just giving a suggestion on where the initial
> > > > focus should be on.
> > > >
> > > > > > Eg some users have problems with their fans as they are either always
> > > > > > ramping up to max, or not running at all... GPUs temperature or power
> > > > > > consumption is reporting incorrectly... all those things users hit
> > > > > > regularly, but which isn't really important enough so it just falls
> > > > > > under the table even if it gets reported.
> > > > > >
> > > > >
> > > > > This does bring up an interesting point about organization and target
> > > > > audiences. Typically when I'm writing documentation I like to organize
> > > > > things by target audiences, so we could have a layout like:
> > > > >
> > > > > * General Introduction
> > > > >
> > > > > * User Guide
> > > > >     - Overview of supported hardware/features/etc
> > > >
> > > > That's best to document in a wiki though. And we had plans to convert
> > > > the existing old wiki over to gitlab. And maybe It think we really
> > > > should do that and clean it up while we work on that. It's just a huge
> > > > project but maybe just starting with whatever you want to do would be
> > > > fine and after a while nothing is left. Anyway, I think we should
> > > > discuss this more openly with the others as well. i don't like the
> > > > current wiki anyway, as only approved developers can change things and
> > > > with a gitlab wiki we could even take MRs on stuff.
> > > >
> > >
> > > Yeah, so I think there's going to be at least three separate locations
> > > for documentation: Envytools (hardware), the nouveau wiki (user guide),
> > > and in the kernel (developer-focused and only the kernel bits). I don't
> > > know much about the userspace bits yet, so maybe there's going to be
> > > more than three places. I think it'd be good to at least cross-reference
> > > between the wiki and the kernel docs, so this "section" could really
> > > just be a link to the nouveau wiki for folks who end up in the kernel
> > > docs, but really just want to use things (and maybe new developers who
> > > haven't historically been users, such as myself).
> > >
> > > > >     - Installation
> > > >
> > > > well.. I think this can be skipped ;) But still, also belongs more
> > > > into a wiki. I think what we could cover here is to how to clean up
> > > > remaining stuff from the blob driver as this is something which comes
> > > > up quite a lot on IRC though.
> > > >
> > > > >     - Configuration (module parameters and such)
> > > > >     - Troubleshooting
> > > >
> > > > that would be cool to have in the wiki as well. Just collecting the
> > > > most common issue and document it there. Especially if it is on
> > > > gitlab, users can just do that as well :)
> > > >
> > > > >     - Getting Involved (bug reporting, running tests, etc)
> > > >
> > > > yeah, and we have some stuff on that on the old wiki already, it's
> > > > just very outdated and needs updating, which as said above can only be
> > > > done by developers and developers sadly have other things to do :)
> > > >
> > > > >
> > > > > * Developer Guide
> > > > >     - Architecture Overview
> > > > >     - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
> > > > >     - Internal APIs
> > > >
> > > > Right, those things I'd like to see in the kernel tree actually.
> > > >
> > > > >     - Debugging and Development Tools
> > > > >     - Contribution Guide
> > > > >
> > > >
> > > > Those I think belong more into the wiki again. The latter is a bit
> > > > hard to split as there are kernel guides, but also community and
> > > > project guides. Mesa does things differently than let's say the
> > > > kernel. And Nouveau is still in this limbo state being on the old
> > > > infra, but also on the new one with mesa...
> > > >
> > > > > I'm not sure how much stuff people want to keep on the
> > > > > nouveau.freedesktop.org wiki vs here.
> > > > >
> > > >
> > > > I think the first step actually is to set up a proper nouveau project
> > > > on gitlab for dealing with issues and the wiki. I would be fine to do
> > > > that and we can also move the code there late. But maybe let's start
> > > > with the wiki :)
> > > >
> > >
> > > I've got some experience with GitLab's wiki, and as far as I could tell
> > > there wasn't a great way to handle contribution from folks without write
> > > access as well as reviews (it may exist, I just don't know it) so what
> > > I've done in the past is use GitLab Pages[0] and stored a Sphinx project
> > > in the repository so contributions are through normal merge requests. I
> > > don't know if gitlab.freedesktop.org has Pages set up, though.
> > > Regardless, I'm more than happy to do that work as well.
> > >
> >
> > there might be an easier way. In gitlab you can actually mirror
> > repositories. I created https://gitlab.freedesktop.org/nouveau/wiki
> > and asked Daniels to set up a mirror against the wiki git repo of the
> > same project. If we add some CI pipeline on top we could even verify
> > the proposed changes are valid. Maybe that would be good enough...
> >
> > But yeah.. maybe having a simple pages site would also work.. dunno if
> > it actually makes a difference anyway, but that might be more work.
> >
>
> The work is pretty minimal for what I typically do. You need a CI job to
> build the docs on merge requests and pushes, which at its most verbose
> is something like:
>
> docs:
>   stage: test
>   before_script:
>     # Pin Sphinx to a particular major version
>     - python3 -m venv ~/docs-venv
>     - source ~/docs-venv/bin/activate
>     - pip install "sphinx<3"
>     - pushd path/to/docs
>   script: make SPHINXOPTS="-W" html
>   artifacts:
>     paths:
>       - path/to/docs/_build/
>   only:
>     refs:
>       - merge_requests
>       - main
>
> After that, you just deploy documentation changes to a particular branch
> updates:
>
> pages:
>   stage: deploy
>   dependencies:
>     - docs
>   script:
>     - mv path/to/docs/_build/ public/
>   artifacts:
>     paths:
>       - public
>   only:
>     refs:
>       - main
>
> And that's about it. This gives you CI that catches any incorrectly
> formatted/invalid documentation, provide reviewers with easy-to-view
> HTML versions of proposed docs in the merge request, and automatically
> deploys updates when changes are pushed to the main branch.
>
> Of course, my only real reason for preferring this approach is that I've
> done it a couple times and I'm very familiar with Sphinx. I don't have
> any objection to doing it a different way.
>

yeah.. I think for now I will just copy whatever we have in the old
wiki and try to make that work somehow.. will ping you once I have it
working.

> - Jeremy
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
