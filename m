Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC1946C2E1
	for <lists+nouveau@lfdr.de>; Tue,  7 Dec 2021 19:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322132AAB4;
	Tue,  7 Dec 2021 18:30:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707C42AAB0
 for <nouveau@lists.freedesktop.org>; Tue,  7 Dec 2021 18:30:19 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 137so63446wma.1
 for <nouveau@lists.freedesktop.org>; Tue, 07 Dec 2021 10:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=P9Uwn09eYyyIwTRyGRWnTwTRM7dwnhKedDkxkKM4RXA=;
 b=eVOiso57lmaa7m0exq+juyzObkr5L3REVnX+YO49Sj24AMMpT+aAZD98kjqXWFeXdA
 uXzzbL1CKOGomq0M8Cataknysxcvm7aOEqqoeV8gnfVXi5NZS8pltkIW6cez8WKO5P8Z
 XhAtzzuBYgrKn8akByL4pB5ioq3Qh075yVfvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P9Uwn09eYyyIwTRyGRWnTwTRM7dwnhKedDkxkKM4RXA=;
 b=5fI1ratfi5WRsDZRtdLLMpVqpRgDwDfy1rC1B1gDOH5YC/nLQ0+e+654qa4UT+7gox
 3Tk+rketVMnkmXYS2f2R36VIeFSoUdWpWN1VUh+IdVV2hDiZpETFwNfZQoOhw4Ttio5b
 cnwxOMnRTKmNxbKqzBuRABYUT/xeyGM6UHgg8ozBiMaKDlEPw+kc5L+QBTDoB63eYqH5
 ldKR+RdZjg6z5Vq2iafAfvi8woqxf6sXZ1hjzPWqzGOnoziJCI23GnRZpFYGwvs7wKge
 7B5AvdsUhIziCGQ1+qKI35XwpsZ/P9UqR04qcTyQ29u8lxmO9I1HG6dviChNQ/Jg6J5z
 aUMQ==
X-Gm-Message-State: AOAM531ONqLLByuo/YiKkt0DVnGehwsIJx37hMWVJs2ak2KsaJFsufGl
 GwSwbOZCUhX4RrFXELeUM//Wcw==
X-Google-Smtp-Source: ABdhPJzJKxPmKfAmyPFfcG2dghRlQo23z//Ukr8GLwTiMK8XCD3uaZGjXhIFu+FfV6u7dTGIS5NT3w==
X-Received: by 2002:a1c:a905:: with SMTP id s5mr9333034wme.150.1638901817985; 
 Tue, 07 Dec 2021 10:30:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 10sm688585wrb.75.2021.12.07.10.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 10:30:17 -0800 (PST)
Date: Tue, 7 Dec 2021 19:30:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <Ya+oN5kw1Ner66zd@phenom.ffwll.local>
References: <5dafba25-5424-3fe2-5046-ae1d4320f9c1@leemhuis.info>
 <20211206183721.6495-1-dmoulding@me.com>
 <6f62bd8c-3a2c-e553-898c-d42fb1583208@amd.com>
 <CACO55tuw2pwqUnknvZmSiuEaMcjArsgzLy9NYBqZPE6f9zPXsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACO55tuw2pwqUnknvZmSiuEaMcjArsgzLy9NYBqZPE6f9zPXsA@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Subject: Re: [Nouveau] Regression in 5.15 in nouveau
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
Cc: regressions@lists.linux.dev, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Dan Moulding <dmoulding@me.com>,
 regressions@leemhuis.info, Ben Skeggs <bskeggs@redhat.com>, sf@sfritsch.de,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 06:32:06PM +0100, Karol Herbst wrote:
> On Tue, Dec 7, 2021 at 10:52 AM Christian K�nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 06.12.21 um 19:37 schrieb Dan Moulding:
> > > On 04.12.21 17:40, Stefan Fritsch wrote:
> > >> Hi,
> > >>
> > >> when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce
> > >> GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland),
> > >> there is a regression: There is now some annoying black flickering in
> > >> some applications, for example thunderbird, firefox, or mpv. It mostly
> > >> happens when scrolling or when playing video. Only the window of the
> > >> application flickers, not the whole screen. But the flickering is not
> > >> limited to the scrolled area: for example in firefox the url and
> > >> bookmark bars flicker, too, not only the web site. I have bisected the
> > >> issue to this commit:
> > >>
> > >> commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
> > > I have been experiencing this same issue since switching to 5.15. I
> > > can confirm that reverting the above mentioned commit fixes the issue
> > > for me. I'm on GP104 hardware (GeForce GTX 1070), also running KDE
> > > Plasma on X.
> >
> > I'm still scratching my head what's going wrong here.
> >
> > Either we trigger some performance problem because we now wait twice for
> > submissions or nouveau is doing something very nasty and not syncing
> > it's memory accesses correctly.
> >
> > Attached is an only compile tested patch which might mitigate the first
> > problem.
> >
> > But if it's the second then nouveau has a really nasty design issue here
> > and somebody with more background on that driver design needs to take a
> > look.
> >
> 
> Ben mentioned a few times that fences might be busted but we all have
> no idea what's actually wrong. So it might be that your change is
> indeed triggering something which was always broken or something else.

Description sounds a bit like we're doing a clear before Xorg has had a
chance to copy the pixmap to the frontbuffer perhaps? That would point to
a fencing issue in userspace, and somehow ignoring fences ensures that the
Xorg copy/blt completes before we get around to clearing stuff.

I'm assuming we're rendering with glamour, so is nouveau relying on kernel
implicit sync or doing it's own fencing in userspace?
-Daniel

> 
> > Please test if that patch changes anything.
> >
> > Thanks,
> > Christian.
> >
> > >
> > > Cheers,
> > >
> > > -- Dan
> >
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
