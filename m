Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A0330EEE
	for <lists+nouveau@lfdr.de>; Mon,  8 Mar 2021 14:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F5C6E0CD;
	Mon,  8 Mar 2021 13:13:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9456E0CD
 for <nouveau@lists.freedesktop.org>; Mon,  8 Mar 2021 13:13:51 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id 2so16015229ljr.5
 for <nouveau@lists.freedesktop.org>; Mon, 08 Mar 2021 05:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u3KxBlq0zPK8QIlO8+MuF0pPec8mDS4KY0jLiSi9nSI=;
 b=FllWGJOZuyDz/G3ut+BvyCRg7VUvoTemVJ0NfOSIhoI0bdAx1tJkTkZh1cU/0mxxRP
 42JaGhf0nZAkwYpnK5g9zpKjptbYjI6BKzoAA7hx0Y/B26nWsRlPHBtu846jtd2LhjaJ
 h4eHiWZBrotTUTgtA2rY2S4uxqgSrfEBGh4uH+USWJsfX8JlyrHpEigsz/dNLnosrSrn
 SNZvfRA/ZTwOjbEFMPawBsonFnyjKl0uFX2bfBGnOB70bVe+5raFK83EQkWrboYDKuFW
 Sdioci7UAc8oarozlPxJfWzpLS47fpSB986JLyA+6e7oMraEOMxiDXXlchDl9R38F/Kh
 3fXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u3KxBlq0zPK8QIlO8+MuF0pPec8mDS4KY0jLiSi9nSI=;
 b=CUgWOVI8dGCD+YUFjUrTmiL4KqBGFFwOm8DGULPpsk/hVEVzNtbU29AC9sTz2uMtlB
 BfKLs65rdXEfotPsdRwbJtMZkjbqxkT62pWsqAMcebHM6PmBKOGmC4N2ALLvM3IfdMHG
 /z1YCpBMTXmnRfrvKiYfBFcHhDDAc1QwcO3A6DbqYls5wIBhMGLC6bRD+Ie+hSJgZNQj
 tLKRYhcyLpLWQo6u0xAvVbSiyCM6i8wnE4yuWshMAYOgjBV8PTVGGuR4rlEXTviM6VbA
 Lu8WK13nyXB30CW8Ox5mXP3pWnkyhwYsocf7vBJu+KIu4sDc56kDARH0v04JZoBzniX/
 B/Qw==
X-Gm-Message-State: AOAM530ZLjUhMsPdt2qY6+lBkRsFf+eBsOQQSEGValvhJr0FrDFfgE4W
 H+bT88x3lBoE0/klTpHl6csjexXV6AG2smKz2nY=
X-Google-Smtp-Source: ABdhPJxqXbpJu7xhP92c7F0V15HL7BDOVi27xRhCvFFfsJmEyW+nvefLiFeTewaXymmi5pJPZCgEpYfaCDXhuxfXBt8=
X-Received: by 2002:a2e:730b:: with SMTP id o11mr13792256ljc.221.1615209230026; 
 Mon, 08 Mar 2021 05:13:50 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf59bkxEQ9+iozLOc0o51w2h1e1jJhSROH-91YAEry3k8cw@mail.gmail.com>
 <CACO55tu4PtcVCdUta2MXr9UQQA2nCrmL4-O6btD2F4d_=zUMKA@mail.gmail.com>
In-Reply-To: <CACO55tu4PtcVCdUta2MXr9UQQA2nCrmL4-O6btD2F4d_=zUMKA@mail.gmail.com>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Mon, 8 Mar 2021 07:13:13 -0600
Message-ID: <CAPpdf5887gqSzw=yGjO3ZWzkJWAvjwK-Uh=wkrAdAgN=K6ZWxA@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] Request for information and/or assistance
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

On Mon, Mar 8, 2021 at 3:05 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Thu, Mar 4, 2021 at 3:21 AM o1bigtenor <o1bigtenor@gmail.com> wrote:
> >
> > Greetings
> >
> > Running debian testing, 2 nvidia gpus (GP107 and GF110) and 5 monitors
> > (1 - 3840x2160 and 2 1920x1080 on the GP107 and 2 - 1920x1080 on the
> > GF110) using one screen (7680x3000).
> >Direct firmware load for nouveau/nvc8_fuc084 failed with error -2
> > I would still like to modify some things but can't find any docs on
> > how to do that and my attempts have only made things worse and I can
> > function, even though some things are right awkward, on the system.
> > What I've run into is that my graphics system either refuses to come
> > out of hibernation or decides to come back on but in a locked state. I
> > then log into this machine from another on the network and do a reboot
> > for a 'graceful' restart (rather than use the kill button - - - the
> > hard shut off).
> >
> > This event, graphics shutdown, is happening in direct relationship to
> > how much I have happening on the desktops of which I have lots.
> >
> > In searching it seems that nouveau support for the GP107 is not yet
> > complete - - - - or that's what it seems like.
> >
> > Is there someone out there who has some idea what the problem is?
> > (There are quite a number of different individuals mentioning this
> > issue in one of the bug reports.)
> >
> > I would be happy to revise the nouveau pages on xrandr updating the
> > information from 1.3 to 1.5 and possibly some of the other pages as
> > well. I have no programming skills but I do have reasonable writing
> > skills - - - - would rather trade than to continue taking that 1/2
> > hour it takes to set my system up after each reboot - - - - taking an
> > hour or even 1.5 hours a day doing this is a huge drain on my
> > resources and would rather change this.
> >
> > Please advise!
> >
>
> I think at this point we can only guess what's going on there and
> having system logs would help us figure out what's wrong. Mind sharing
> system logs from the time the crash or whatever that is happens?
> Output of dmesg via ssh could be enough.
>

As requested:

debianbase kernel: [  436.180582] nouveau 0000:02:00.0: Direct
firmware load for nouveau/nvc8_fuc084 failed with error -2
Mar  5 20:24:40 debianbase kernel: [  436.180597] nouveau
0000:02:00.0: Direct firmware load for nouveau/nvc8_fuc084d failed
with error -2
Mar  6 00:00:02 debianbase kernel: [13358.378698] audit: type=1400
audit(1615010402.464:22): apparmor="DENIED" operation="capable"
profile="/usr/sbin/cupsd" pid=13168 comm="cupsd" capability=12
capname="net_admin"
Mar  6 00:00:02 debianbase kernel: [13358.415978] audit: type=1400
audit(1615010402.500:23): apparmor="DENIED" operation="capable"
profile="/usr/sbin/cups-browsed" pid=13170 comm="cups-browsed"
capability=23  capname="sys_nice"
Mar  6 07:40:56 debianbase kernel: [41012.952323] perf: interrupt took
too long (2511 > 2500), lowering kernel.perf_event_max_sample_rate to
79500
Mar  6 12:04:47 debianbase kernel: [56843.957285] perf: interrupt took
too long (3152 > 3138), lowering kernel.perf_event_max_sample_rate to
63250
Mar  6 15:56:25 debianbase kernel: [70741.868103] perf: interrupt took
too long (3952 > 3940), lowering kernel.perf_event_max_sample_rate to
50500
Mar  7 00:00:01 debianbase kernel: [99758.601985] audit: type=1400
audit(1615096801.491:24): apparmor="DENIED" operation="capable"
profile="/usr/sbin/cupsd" pid=56136 comm="cupsd" capability=12
capname="net_admin"
Mar  7 00:00:01 debianbase kernel: [99758.625644] audit: type=1400
audit(1615096801.515:25): apparmor="DENIED" operation="capable"
profile="/usr/sbin/cups-browsed" pid=56139 comm="cups-browsed"
capability=23  capname="sys_nice"

Is this sufficient?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
