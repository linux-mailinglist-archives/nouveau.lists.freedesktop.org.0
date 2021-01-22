Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C4300951
	for <lists+nouveau@lfdr.de>; Fri, 22 Jan 2021 18:12:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED976EA14;
	Fri, 22 Jan 2021 17:12:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F412C6EA14
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 17:12:03 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id n11so7346929lji.5
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 09:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VVbtnjPKxSlJxQ01QH3rO9CVMNqzlbGU71xAuA0nMls=;
 b=Die3eiIQph1SJYjsK9+EW9SMv42qg+YigrATecX9knVuQaM96ScShPU1Mx8Ut82JAG
 JytJhTmsXWhZjKpUrNyV1s0a88hWKI2TtpLUXTLbLBTIecc1tHFlTCUarvHAqyf4cHpR
 z1qodBUKi/vlTJs3I/O5jjrTMwmMl2P3r/ZNdl5SWEsQycC6Js5HAh9lMHTm+CFs6zmV
 yTP9DlvFqpd/T7plmsoQAeck7MJcCY7pg2Ihf2mHizwvIgLEYlqjWNHYFezOLRlRGXYI
 Dsn6h4RD6/w7FKmAvHGTHk9jUIQpUEJ6DB8ztFUaTiJNFNSuyttFj5F1z6Wq5Om6uMMQ
 YpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VVbtnjPKxSlJxQ01QH3rO9CVMNqzlbGU71xAuA0nMls=;
 b=kdpLrY8EOTWx/f5ZVUSuCEKnhdqkSMto5zT9WXfgXXe+f0S1KDTPzEGGqeO0IwkI9D
 3nbS78uKqy5kmztrYb7Vl6iOReDyOrKW4LNCDkGpX+PKis1y3cRCPmp2q3DSBR+Pcj0+
 roF5Za35thqpKI0kJf5r92Bq+ZJDXESsBnZYE+QbhqhQp1SO25LhiEYXGCxDWs9aSm9t
 90EmkF9W+bZHUueLz7oWc8iscxfUqi/5U9aOV4zg47JK0r70PQuK+sCqHhIefp8TN8eE
 HAK2Id6Odp77a1qL5lBoI9YVDBGVf+VJDMlMOmvuNAsOJs0lGMAMN6qjgq+cli1zIxMn
 SS9g==
X-Gm-Message-State: AOAM533GsrpKJg0Zw9ZXCSvJ+ZU9Q9nUWlKTaP9FuJYpFk8pz9ZXUf/P
 vPKRJ8h+g7H37dwqP5f8Q51S1zlzIvBu6D+gZ4E=
X-Google-Smtp-Source: ABdhPJzcm/BzZo4ypkh2Twyf3EdDYLbmyOuqQDi471I6DnzNB+VjaxuEFCIRgmMEYb+VMPFpWuQQptuvZ9oR5tn2YcY=
X-Received: by 2002:a2e:9dc7:: with SMTP id x7mr268560ljj.46.1611335522365;
 Fri, 22 Jan 2021 09:12:02 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
In-Reply-To: <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Fri, 22 Jan 2021 11:11:26 -0600
Message-ID: <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] Request for help in adding a HDMI output
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

On Fri, Jan 22, 2021 at 8:30 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Thu, Jan 21, 2021 at 9:59 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
> >
> > Greetings
> >
> > Running a debian testing system
> > $ uname -r
> > 5.4.0-4-amd64
> > with 2 graphics cards.
> > The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti
> >
> > Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
> > and I HDMI2.0 ports (four in total).
> >
> > I have been running 2 1920x1080 monitors on this card (and its
> > previous nvidia 570) for quite some time. Been running nouveau for the
> > last about 4 years as my last nvidia 570 (started with 3) is EOL by
> > nvidia.

> Cheers,
>
>   -ilia
> > Have gotten quite comfortable using xrandr setting up the second card
> > (the nvidia 570) and its 2 monitors. Nouveau software is:
> > xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
> > xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .
> >
> > I want to add a 4k TV onto the HDMI port on card #1.
> > Can't seem to get the card and the TV talking.
>
> Unfortunately my initial attempt at supporting >340mhz modelines over
> HDMI was incomplete -- worked in my own testing, but not for everyone.
> (You need 597mhz to get 4k@60.)

$ cvt 3840 2160
# 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
2168 2237 -hsync +vsync

I've tried setting that mode into xrandr - - - - maybe I did something wrong?
(xrandr --newmode  then xrandr --addmode  then xrandr --output
>
> Ben was able to figure out what was wrong and fix it:
>
> commit a1ef8bad506e4ffa0c57ac5f8cb99ab5cbc3b1fc
> Author: Ben Skeggs <bskeggs@redhat.com>
> Date:   Fri May 29 15:18:47 2020 +1000
>
>     drm/nouveau/disp/gm200-: fix NV_PDISP_SOR_HDMI2_CTRL(n) selection
>
> I believe this change is in kernel v5.8. If you don't want to upgrade,
> just ensure you pick a 30hz mode-line for that display, which should
> enable 4k to work.

> Cheers,
>
>   -ilia
I would love to 'pick a 30Hz mode-line' but there just aren't any!

In fact I have both kernel 5.5 and 5.10 on the machine. I reverted to using the
older kernel as with 5.10 it was maybe at worst a couple hours and at best
maybe a day when I would come to my machine and I just couldn't get it
to snap out of 'sleep' (AIUI) mode. Kernel 5.5 was a little better but the best
up time was still measured as less than a couple days - - very occasionally
somewhat longer - - then I had to log in from a different machine on the
network and get the m/c to reboot.

Dunno what's causing the problem there and as I use the machine all the
time for business - - - - well - - - - I wasn't prepared to spend an hour a
day setting the system back up the way I wanted it using xrandr and
starting the various other programs running.

Should I perhaps be filing a bug report?
>
> Also it looks like you have both GPUs plugged in, and slaving one off
> the other. If possible, I'd recommend to keep everything on one GPU.
> The DP port can (most likely) be used for HDMI or DVI with a passive
> converter (not sure if it can be used with HDMI 2.0 though). Having
> remote displays is not a great experience (it does work though, and
> better than nothing in cases that require it).
>

Sorta got to have both GPUs in use - - - - there already 2 monitors running
on each of the GPUs - - - - I'm trying to add a 4K to the newer graphics
card. I've read reports of others where it was a do nothing on M$ yet here
in Linux land - - - - - well it just isn't working!

I've done some more looking and have found this:

$ xrandr --output HDMI-1-2 --mode 3840x2160_60.00  --verbose
xrandr: cannot find crtc for output HDMI-1-2

digging into this it seems something might be changed:

/sys/class/drm/card0/card0-HDMI-A-1/subsystem/ttm/power/async

reads as disabled - - - - so if I change that to 'enabled' is that going
to kick the card in the pants so it will output something?
(the monitor reads -  'weak or no signal' )

TIA
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
