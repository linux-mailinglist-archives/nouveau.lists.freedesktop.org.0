Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B203D28064B
	for <lists+nouveau@lfdr.de>; Thu,  1 Oct 2020 20:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2FC6E8CB;
	Thu,  1 Oct 2020 18:11:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA106E8C4
 for <nouveau@lists.freedesktop.org>; Thu,  1 Oct 2020 18:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601575875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Jym8Eza3KIHQaaOI/V8IBSOkqWCi/qHMXKuK4RG3Ck=;
 b=LQDXzin9A6yMeICX4DcieGCfHt/CWwqpidiQWcWx0D/5qTyY+h8QE8GGTLXEhkphx8AyLl
 B5RxrTlcanZQU51fhVL+cqhHD8b837geVxD68Ux9zjou8/t3sBvcOTaJeXPECpzi+5HENg
 lpuoEAsxPB4F3oL++P8Lh+MNDmNs2vw=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-WN7e87fUN4qfkmWxHH-W9g-1; Thu, 01 Oct 2020 14:10:57 -0400
X-MC-Unique: WN7e87fUN4qfkmWxHH-W9g-1
Received: by mail-qv1-f69.google.com with SMTP id o14so3638124qve.7
 for <nouveau@lists.freedesktop.org>; Thu, 01 Oct 2020 11:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Jym8Eza3KIHQaaOI/V8IBSOkqWCi/qHMXKuK4RG3Ck=;
 b=SiGNioK9QUTib8QKFPerqvQ1tCb2QPaOqXYUsCXfZC81TDs94W6J6qIjODCb+E9kf3
 079urRFIQ2sjRq4c2m1VxV5mY7BBCLE3FZ2gCqnV9J5s2NlGUtcn/alAcJoS9zNdmHg/
 TTPdEQsDoUTOFesL8PvFtcZI80n3onME4BNjBPLskXwHJx97fc5e1ErpXq9Qgb6GE6J6
 0yiiA5AZxUwySHHKZBzWrvUo8gYeChUQIvBiVTxd1m276oQR+arnu8LuDJgfv4/dMwvr
 G/KkKi4zpeKVnZGC5fxOuIdGOgZBlYVrXxa/A0kYcn+BPaF/xgME8liiHjqS6n9ia+ql
 Mimw==
X-Gm-Message-State: AOAM530JPQHuewGYHxC1QpYY8XAPEga6x3y557oZNRovGahOmz/EXGrl
 kbBFKNCmLZW3u+bLiK2UGrXZHBvNC/wVzw6t5QFKIMXuOp/gUisHMT5P1tycKU5FuBd0nuyfuc6
 ftSt9XwlqMfpWWjimw+vEWRZvAnRRwNL9NeNZW1CoHw==
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr8893837qkd.381.1601575857229; 
 Thu, 01 Oct 2020 11:10:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJAVsRkcuUDqaRE3xnTfpJO/ELYRVzrAgllVzep6Xa2nU5Z84q7LMrvP+FACMORWBpeaQV5JX7lrif/8UT7Jg=
X-Received: by 2002:a37:7fc3:: with SMTP id a186mr8893816qkd.381.1601575856950; 
 Thu, 01 Oct 2020 11:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55ts6hfd_v8V8_yJ45wm8MAN7TENL9pZZmijFaB3h-FrR=A@mail.gmail.com>
 <CACO55tviMespp4FNko+2ipmx0DNx4de2WKSrmEW05EufW7P_ZA@mail.gmail.com>
 <20201001175257.GA188932@ravnborg.org>
In-Reply-To: <20201001175257.GA188932@ravnborg.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 1 Oct 2020 20:10:46 +0200
Message-ID: <CACO55ttPBijaKCv1QxLHN-mAdkazDikV_wprn8R-wJx4F4oaWQ@mail.gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] Nouveau wiki migration
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 1, 2020 at 7:53 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Karol.
>
> On Thu, Oct 01, 2020 at 01:36:52PM +0200, Karol Herbst wrote:
> > On Fri, Sep 25, 2020 at 11:27 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > Hi everybody,
> > >
> > > I think it's time to finally move our wiki from the old infrastructure
> > > over to gitlab pages.
> > >
> > > This comes with several benefits:
> > > * full control through git over the ikiwiki pipeline (setup files,
> > > plugins, system packages, ...)
> > > * random users are able to create MRs against the wiki as long as they
> > > are willing to create a gitlab account.
> > > * possible to migrate over to a different wiki generator or mix and
> > > match or whatever.
> > > * no CGI stuff on the wiki as we don't use ikiwiki for the git
> > > operations anymore
> > >
> > > To view the migrate wiki visit this URL:
> > > https://nouveau.pages.freedesktop.org/wiki/
>
> I poked around a little - almost all of it looked good.
>
> The FAQ points back to some pages on https://nouveau.freedesktop.org -
> like https://nouveau.freedesktop.org/wiki/XvMC/
> I guess this is a bug.
>

The migration includes using the old subdomain with gitlab pages and
most of the links are auto-generated anyway, so this should just work
after migration. I just have to prepare accordingly.

> But in general looks good.
>
> > I did some further changes, like ensuring backwards compatibility to
> > existing links and already started to clean up some bits, like
> > removing the google translate stuff.
> >
> > Now I'd like to get the subdomain changed of the current wiki over to
> > the gitlab stuff and wanted to ask for acks/nacks on this
>
> No ack/nack here - as I really do not know what to ack/nack.
> But maybe the above counts like an ack???
>
> But looks good and I hope that others find it simple to help
> with the pages from the gitlab repo.
>
>         Sam
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
