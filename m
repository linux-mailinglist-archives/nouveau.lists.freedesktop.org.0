Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5906325A75
	for <lists+nouveau@lfdr.de>; Fri, 26 Feb 2021 00:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ED06E80B;
	Thu, 25 Feb 2021 23:59:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0141A6E80B
 for <nouveau@lists.freedesktop.org>; Thu, 25 Feb 2021 23:59:05 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id h18so6546595ils.2
 for <nouveau@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apkHnD1v4NSKkWvhCxkjGmlfWyKh5hZwXjMh9j4dIV4=;
 b=m8dU7bU/Y1wCYYcqpO5oKhvwhSrM+7DH0tzbRDQu5vIyI1kMuRuLYn9wnF1OG3+KBi
 NvG6hHReUdVs9Z5bXEO7Eq+pnc/bflfMPZ/p2Yk6/A2wdwLSHzxTl7HmlVovwsUj989T
 7QvRTGnamdaQ2akp486RXH8y7rzeOubxlfjAOLExWYoqevrIsg7m7F+flwVOFYUP9Q6C
 KGTPZaLF7RMEAU6vnTP00IAqzlI9JZiNGknZvx1ssypXi7qoTkj1MYDkcP825ZAl9OFb
 RvIBQFR+jSuO9Svxk0esTUZ6tnAzXxsW9ZRuW9t65ZOg7kcrRq+DbOJoUD7fAVXx0BXA
 2I7w==
X-Gm-Message-State: AOAM530SRbwoF+JxUimL1bTMiD4qKhGFedbtHooqZ+wjaizS/D3+Pe7l
 FQjCxh3vF7h41sC5zbgsZ5lWWHT8SEXqRIeDUY6Xgd8ciDkeqQ==
X-Google-Smtp-Source: ABdhPJxb3dAfHpjjNDV+8Aebyk1Dj9ZCKx8MwucBbHhJjuVqQSLkyQGTgRSinvhobICGEuU1KJAqvoMa9HFuW3kAh3g=
X-Received: by 2002:a05:6e02:1848:: with SMTP id
 b8mr187710ilv.210.1614297545300; 
 Thu, 25 Feb 2021 15:59:05 -0800 (PST)
MIME-Version: 1.0
References: <YDgnVpKo8ya8WRAF@localhost4.local>
In-Reply-To: <YDgnVpKo8ya8WRAF@localhost4.local>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 25 Feb 2021 18:58:54 -0500
Message-ID: <CAKb7UvjWv2P01bDLcxpXmvZzn++kmA9+t=YMQbNamUP5Zj8HMw@mail.gmail.com>
To: Roger <rogerx.oss@gmail.com>
Subject: Re: [Nouveau] i2c-dev driver corrupts display?
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

That's very surprising. As I recall, i2c-dev just adds /dev nodes for
various i2c devices (some of which would be exposed by nouveau, most
likely just the connector one to read EDID in your case, as temp/etc
sensors came later). It shouldn't cause nouveau to do anything
differently -- just allows user-space to have access to the i2c
adapters.

You can try messing with the i2c implementation a bit with

nouveau.config=NvI2C=1

which will flip the internal implementation from the "shared" bit-bang
implementation, to a dedicated nouveau one. But it shouldn't matter.
And as I mentioned before, not sure how the i2c-dev module can affect
it either way -- either the shared impl works or it doesn't.

You can also try booting with

nouveau.debug=debug

to see if you can glean any meaningful information from the "broken" case.

I also remember reports of a later mobile board (NV28M) having weird
clock-related and cursor layout issues
(https://bugs.freedesktop.org/show_bug.cgi?id=54700,
https://bugs.freedesktop.org/show_bug.cgi?id=78543). Not directly
related to your situation, but just pointing to it in case it triggers
some ideas.

In your testing, it might also be wise to differentiate warm vs cold
boots. You can also force re-initialization of the board with

nouveau.config=NvForcePost=1

Cheers,

  -ilia

On Thu, Feb 25, 2021 at 5:40 PM Roger <rogerx.oss@gmail.com> wrote:
>
> HARDWARE:
> Dell Inspiron 8100 laptop
> nVIDIA Geforce2 Go (NV11) with Intel AGP
>
> PROBLEM:
> Display corruption whenever nouveau module was loaded, seemingly at random.
>
> CULPRIT:
> Whenever the i2c-dev.ko driver/module was loaded, the display would become
> corrupted, or as if the timing became out of sync with hardware specifications,
> with weird moving pixels throughout the display.
>
> If the i2c-dev is built into the kernel, possible the display would turn-off
> upon nouveau module loading, but could be possibly worked around (I think) by
> building the nouveau driver statically into the kernel, possibly loading prior
> to i2c-dev loading?
>
> Been having this problem for many years, finally found it, and nothing found
> via Google on i2c-dev & nouveau.
>
> WORKAROUND:
> /etc/modprobe.d/blacklist.conf
> blacklist i2c_dev
>
> Or, rebuild the kernel without i2c-dev.
>
> Quite a few Linux distributions either compile the i2c-dev into the kernel, or
> load the module during booting, creating significant display problems (as noted
> above) when trying to install from a Linux distribution CD/DVD.  Most people
> performing an install, I'm guessing, are then simply performing a nomodeset
> during boot and/or reverting to VESA/UVESAFB.
>
>
> --
> Roger
> http://rogerx.sdf.org/
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
