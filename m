Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6231277590
	for <lists+nouveau@lfdr.de>; Thu, 24 Sep 2020 17:38:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E79ED6E045;
	Thu, 24 Sep 2020 15:38:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D726E045
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600961934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uy2hTJMQ2iBARDEHpVHjUE9x0PrrUpQz2KYZi2LRliA=;
 b=K4xcKmOQczNcxTxRpSimODm8WuNDPJYeBRSeM3yCNrEbUBPuKxjpm0QJrfcYCjcycA+FCi
 9tuelG7CHVlHfpPxSeU4t2TmeODl9WQr7F2ExlnwmzCFchhTOvF6S789sDW9i2KxgCdqLF
 /8qrle0rTCBt8tWiHwy+UKdNJ7WO2cI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-Wh2bwv3UOiS1bwyVxVyg5w-1; Thu, 24 Sep 2020 11:38:51 -0400
X-MC-Unique: Wh2bwv3UOiS1bwyVxVyg5w-1
Received: by mail-qk1-f198.google.com with SMTP id r128so2179191qkc.9
 for <nouveau@lists.freedesktop.org>; Thu, 24 Sep 2020 08:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uy2hTJMQ2iBARDEHpVHjUE9x0PrrUpQz2KYZi2LRliA=;
 b=h/icEMZ7nUT/PgE0Rr9Tr9iLN+Nr8u4dAe9bhgaIOUNfoPXtqJB87H3K1uu3ZGtxfc
 I+zbI8kGlcGupTWSfsTQ3yX3k9u5n+Jsg4eR+JRgC4WGHay8glWUGngYoPwGmmX1v8Ws
 LVfucw3vPrpsRehhZT2F9RnC4fFRPBTtFUtGaMFZ9Nf8aLng9k1g9Cb0GXSLiPSZgq9o
 d/9e03EtWvr36lamQWDudfccOFNqnnlq5KiCt/qyPlOILsSqVij74mLcFaqJDKpU4JZy
 H5GUQTldKvoLHtvVVhBEY09KFeZ85gHiY/n9upLUh9zDppeFY293k+L/A6746Lz0E6mO
 4/qg==
X-Gm-Message-State: AOAM530uOxEvVg5KdlZkXd22ATFbh32NL16KdFSsIt7wn0UjHjA+8/lq
 bz3eJYV1PcRd/6yI56uaKkj0CqEshCzijqV8SBEpL8Qhs2ebv0OvyunVZQwsZIUEAxuBxCIw81O
 g8rLPdq35l76mTRJ/iOT8EoeSvA==
X-Received: by 2002:ac8:44da:: with SMTP id b26mr116734qto.147.1600961930339; 
 Thu, 24 Sep 2020 08:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweuf15R9Nmx8QGwo6TtW8RlzEErLBcVQGc9I0JP8hApaULFFLb4Xg3YJsVhntcPA4CZayFVw==
X-Received: by 2002:ac8:44da:: with SMTP id b26mr116704qto.147.1600961929991; 
 Thu, 24 Sep 2020 08:38:49 -0700 (PDT)
Received: from xps13.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id v90sm2450323qtd.66.2020.09.24.08.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:38:49 -0700 (PDT)
Date: Thu, 24 Sep 2020 11:38:47 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Roy Spliet <nouveau@spliet.org>
Message-ID: <20200924153847.GA12520@xps13.jcline.org>
References: <20200911162128.405604-1-jcline@redhat.com>
 <CACO55tsspNbYBYdNH-zd_TeZo02yY9AtJot4FW8SYEZPuKjkZA@mail.gmail.com>
 <20200923203918.GA37078@xps13>
 <CACO55ttM+wmbcYz6h5qeEb9_Ta=JcnRzURFYu3-9GJPMHzdFeg@mail.gmail.com>
 <c04d84e2-9091-a22c-c3e4-e43e4ee72057@spliet.org>
MIME-Version: 1.0
In-Reply-To: <c04d84e2-9091-a22c-c3e4-e43e4ee72057@spliet.org>
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
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 01:56:32PM +0100, Roy Spliet wrote:
> 
> Op 23-09-2020 om 22:36 schreef Karol Herbst:
> > On Wed, Sep 23, 2020 at 10:39 PM Jeremy Cline <jcline@redhat.com> wrote:
> > > 
> > > On Wed, Sep 23, 2020 at 09:02:45PM +0200, Karol Herbst wrote:
> > > > On Fri, Sep 11, 2020 at 6:21 PM Jeremy Cline <jcline@redhat.com> wrote:
> > > 
> > > <snip>
> > > 
> > > > yeah, I think overall this file is a good idea and being able to get a
> > > > quick overview over the driver is helpful. I think if we focus on the
> > > > user facing things first, like the hwmon or other things users
> > > > generally interact with would be helpful. I think if we start to
> > > > document areas where there are many low hanging fruits, this could
> > > > help random people to start with easier tasks and get more used to the
> > > > driver overall, so I'd probably ignore most of the stuff which really
> > > > requires a fundamental understanding on how things work and focus more
> > > > on vbios parsing (which has annoying interfaces anyway and it might
> > > > make sense to make it more consistent and nicer to use) and/or simple
> > > > code interfacing with the mmio space.
> > > > 
> > > 
> > > I'll admit to being motivated by entirely selfish reasons. I know
> > > practically nothing about nouveau and I'm the type of person who likes
> > > to keep notes about how things work together, both free form and
> > > structured in-line docs. All that to say, I think focusing on the
> > > "low-hanging fruit" stuff will be very beneficial and I'm happy to do
> > > that, but I'm also interested in documenting everything else I run
> > > across.
> > > 
> > 
> > yeah, that's fine. I was just giving a suggestion on where the initial
> > focus should be on.
> > 
> > > > Eg some users have problems with their fans as they are either always
> > > > ramping up to max, or not running at all... GPUs temperature or power
> > > > consumption is reporting incorrectly... all those things users hit
> > > > regularly, but which isn't really important enough so it just falls
> > > > under the table even if it gets reported.
> > > > 
> > > 
> > > This does bring up an interesting point about organization and target
> > > audiences. Typically when I'm writing documentation I like to organize
> > > things by target audiences, so we could have a layout like:
> > > 
> > > * General Introduction
> > > 
> > > * User Guide
> > >      - Overview of supported hardware/features/etc
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
> > >      - Installation
> > 
> > well.. I think this can be skipped ;) But still, also belongs more
> > into a wiki. I think what we could cover here is to how to clean up
> > remaining stuff from the blob driver as this is something which comes
> > up quite a lot on IRC though.
> > 
> > >      - Configuration (module parameters and such)
> > >      - Troubleshooting
> > 
> > that would be cool to have in the wiki as well. Just collecting the
> > most common issue and document it there. Especially if it is on
> > gitlab, users can just do that as well :)
> > 
> > >      - Getting Involved (bug reporting, running tests, etc)
> > 
> > yeah, and we have some stuff on that on the old wiki already, it's
> > just very outdated and needs updating, which as said above can only be
> > done by developers and developers sadly have other things to do :)
> > 
> > > 
> > > * Developer Guide
> > >      - Architecture Overview
> > >      - External APIs (include/uapi/drm/nouveau_drm.h, any sysfs stuff)?
> > >      - Internal APIs
> > 
> > Right, those things I'd like to see in the kernel tree actually.
> > 
> > >      - Debugging and Development Tools
> > >      - Contribution Guide
> > > 
> > 
> > Those I think belong more into the wiki again. The latter is a bit
> > hard to split as there are kernel guides, but also community and
> > project guides. Mesa does things differently than let's say the
> > kernel. And Nouveau is still in this limbo state being on the old
> > infra, but also on the new one with mesa...
> > 
> > > I'm not sure how much stuff people want to keep on the
> > > nouveau.freedesktop.org wiki vs here.
> > > 
> > 
> > I think the first step actually is to set up a proper nouveau project
> > on gitlab for dealing with issues and the wiki. I would be fine to do
> > that and we can also move the code there late. But maybe let's start
> > with the wiki :)
> 
> Risking to turn this into a "let's fix everything in one go" project that
> ends up never getting finished, I just want to make sure that everybody is
> also aware of the documentation generated from Envytools [0]. Especially
> "architecture overview" (that is, if we're talking about hardware
> architecture and not driver/software architecture) might be better suited in
> envytools.

As Ilia noted, my hope is this document will focus on the software
architecture and not necessarily the hardware. The Envytools docs are
really useful so I think it would be good to add pointers to it in this
document and note all hardware architecture documentation should go
there.

> 
> As for module parameters, IMHO modinfo is supposed to be the source of
> information. It's sadly lacking any "sub-"option inside nouveau.config and
> nouveau.debug, which may be by design. Perhaps expanding the modinfo
> explanations can help cover at least all the other options in a way that
> never gets out of sync with source code.
> 

I spent a little time looking at how difficult it would be to
auto-generate Sphinx documentation using the same source as modinfo, but
it seemed to be a non-trivial task so I though in the interim using
doc-blocks (as some other drivers do) would be nice. I do agree with
you, though, that ideally modinfo is the one place to document options.

I'm still hoping to find time at some point to wire up a general
solution such that any kernel doc can just use a Sphinx directive to
yank the modinfo documentation, at which point we could move these
doc-blocks into the modinfo explanations.

- Jeremy

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
