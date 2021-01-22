Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C144300B2E
	for <lists+nouveau@lfdr.de>; Fri, 22 Jan 2021 19:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5266EA27;
	Fri, 22 Jan 2021 18:26:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40786EA27
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 18:26:36 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id v23so2123419uam.8
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 10:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iz0b+JqRcL5KlsQFqPyCS+iz9vlmHyZ6LVXt35AlY6s=;
 b=b4fpwbZU7ImQUXexHKB1j/UhQ69ZKSTkodPzTt7TeVdVqssvfO+CJj0e8OEecTWAlm
 o4uQcNMwRKnFRvkvW7v9ITMnf5K79XQ/DhcX8NhlXWkOAWmZb2elyK660snmHXAvkVCz
 nMf4zM6jVcmcJM59gwnSdDTQA+956ksinhWLBuLYSlb9IsyLNE+5xbM2hv9Pq4ZlZh0G
 JA77YrIy0xpLeVfsW+rZ0wfk2BIWt+vj3xwHSVo+4qiSJcwpUD95BwJH60q6HcRuFzRB
 NhKvRXFvT5b0u3i1jqAukgQJ1gvN/gVjejWqzyB5qqn+mMHu8J+tUs0K+dWHw1LvKmj/
 ouJA==
X-Gm-Message-State: AOAM533+ULXrC0kqyIIUNZluHa19I7h29xqfQBbydWcXtSHVWBD/mTew
 hUj3H9zgtXeBhigjf3Hsfa+26KAYWn0jN4/HUbo=
X-Google-Smtp-Source: ABdhPJxZqdtthufOdthDQu/NSBgKV/qTxH2MZu2sH8emjii0mz+on1Zt8LhnODsBF7DJTDLKq311E6Wq4RJHsZjr88I=
X-Received: by 2002:ab0:581:: with SMTP id e1mr1200107uae.47.1611339995757;
 Fri, 22 Jan 2021 10:26:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
In-Reply-To: <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 22 Jan 2021 13:26:24 -0500
Message-ID: <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
To: o1bigtenor <o1bigtenor@gmail.com>
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

On Fri, Jan 22, 2021 at 12:12 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 8:30 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Thu, Jan 21, 2021 at 9:59 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
> > >
> > > Greetings
> > >
> > > Running a debian testing system
> > > $ uname -r
> > > 5.4.0-4-amd64
> > > with 2 graphics cards.
> > > The one I'm working on is a: GP 107 Nvidia  GTX 1050 Ti
> > >
> > > Asus ROG GeForce GX 1050 Ti Strix-GTX1050 Ti with 2 - DVI plus 1 DP1.4
> > > and I HDMI2.0 ports (four in total).
> > >
> > > I have been running 2 1920x1080 monitors on this card (and its
> > > previous nvidia 570) for quite some time. Been running nouveau for the
> > > last about 4 years as my last nvidia 570 (started with 3) is EOL by
> > > nvidia.
>
> > Cheers,
> >
> >   -ilia
> > > Have gotten quite comfortable using xrandr setting up the second card
> > > (the nvidia 570) and its 2 monitors. Nouveau software is:
> > > xserver-xorg-video-nouveau -> 1:1.0.16-1 ;
> > > xserver-xorg -> 1:7.7+21 ; and libdrm-nouveau2:amd64 -> 2.4.102-1 .
> > >
> > > I want to add a 4k TV onto the HDMI port on card #1.
> > > Can't seem to get the card and the TV talking.
> >
> > Unfortunately my initial attempt at supporting >340mhz modelines over
> > HDMI was incomplete -- worked in my own testing, but not for everyone.
> > (You need 597mhz to get 4k@60.)
>
> $ cvt 3840 2160
> # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
> Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
> 2168 2237 -hsync +vsync

That just plain won't work. HDMI 2.0 maxes out at 600mhz, whereas
you're giving it a 712mhz modeline. You're trying to be too clever.
This stuff should just work out of the box.

What happens if you use a 5.8 or later kernel and don't do any of
this? You should just be able to do like xrandr --output HDMI-1-2
--auto. But having a 4k display on a secondary GPU is not a great idea
-- I'd flip it around, make the GTX 1050 the primary.

Can you provide the output of "xrandr --verbose" before you've messed
around with anything like modelines/etc?

Thanks,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
