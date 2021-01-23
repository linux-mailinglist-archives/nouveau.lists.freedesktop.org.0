Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA063017C0
	for <lists+nouveau@lfdr.de>; Sat, 23 Jan 2021 19:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9446E08E;
	Sat, 23 Jan 2021 18:52:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058D06E08E
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 18:52:45 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id 187so4978508vsg.4
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 10:52:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eZFueveS3NEW8UQI1yxeubw5h+H9jSwe8y4rC/wvnjg=;
 b=MouJB7sJpbdD55jpSf9Xf5pUe+NmCEvbM9HXv+vrcFLFV3RTkF/t7DxRQlYFUzfck4
 tXBDi/RM7Tt0NZYxg8h2cDgk+jzSqWLp8h0w+Q/8Cd0tvDvEsrwV3nGsz3sEQk3IG8Kn
 g0cDpyd6IYmZXIqT1frCFmlDfMcIQWJ6fgOhjw4uw+sFAlUrzKh3NkqAMCXekNH6FgXa
 qaS16o6jGjnJ2jy6kK8Ioq9VY00cbdLmJjRSmAlvLgGS9fx34YFMVJLS8St/NV7IS9W7
 /I5+IIKNy+dhOSvflixZJGEV/iWNOEhZYyZ3sYPWwBRbE+6orXYbQfLBRhcITHw6b9av
 PCJg==
X-Gm-Message-State: AOAM532Auq5Q6YBW5KWp0BcqVJ1XMKrR0IvWrAzGTugTB0VqRcmJW08U
 XnRQNjfi97g212oaM4qupWo7budazYWIfECM+ZWHFkeZVWfwQw==
X-Google-Smtp-Source: ABdhPJxEe3qA8o/sL1RxEiOfBsJYKDnmCim15UFTG10VfFwFvgJnkEfllFG69swworlMbubN7iDQaVMkNHgww58Lz0M=
X-Received: by 2002:a67:f910:: with SMTP id t16mr29939vsq.50.1611427964996;
 Sat, 23 Jan 2021 10:52:44 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
In-Reply-To: <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 23 Jan 2021 13:52:33 -0500
Message-ID: <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
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

On Sat, Jan 23, 2021 at 1:40 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> On Sat, Jan 23, 2021 at 10:55 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Fri, Jan 22, 2021 at 2:13 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
> > >
> > > On Fri, Jan 22, 2021 at 12:26 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > snip
>
> I've been doing a bunch of research and have a whole lot more input but still
> can't find any answers - - - - except holes where there 'should be' answers.
>
> I also understand you're trying to help but some of the stuff you've
> been stating
> - - - well - - - it just ain't so! - - - - so if you'd rather not
> continue - - - - fair enough
> - - - -

No one's perfect. I have to make do with guesses which are the
simplest explanations. Sometimes there's something else.

> >
> > Unfortunately it looks like you did this *after* messing with modelines.
> >
> Getting that information would have meant being able to go back in time some
> 24 hours or so. I can't find any way of removing mode lines from xrandr - - -
> or do you know of some?

A reboot is a great way to reset these things.

> > >
> > > $ xrandr --verbose
> >
> > [ ... snip ...]
> >
> > > HDMI-1-2 connected (normal left inverted right x axis y axis)
> > > Identifier: 0xf9
> > > Timestamp:  483290
> > > Subpixel:   unknown
> > > Clones:
> > > CRTCs:      4 5
> > > Transform:  1.000000 0.000000 0.000000
> > >             0.000000 1.000000 0.000000
> > >             0.000000 0.000000 1.000000
> > >            filter:
> > > EDID:
> > > 00ffffffffffff0020a32f0001000000
> > > 0c1a0103807341780acf74a3574cb023
> > > 09484c21080081c08140818001010101
> > > 01010101010104740030f2705a80b058
> > > 8a00501d7400001e023a801871382d40
> > > 582c4500501d7400001e000000fc0048
> > > 4953454e53450a2020202020000000fd
> > > 00184b0f511e000a202020202020017f
> > > 02034571525f5e5d0102040510111314
> > > 1f202122626364290907071507505506
> > > 0083010000e200f9e305ff016e030c00
> > > 1000383c20008001020304e50e60616a
> > > 6be3060d01011d8018711c1620582c25
> > > 00c48e2100009e011d80d0721c162010
> > > 2c2580c48e2100009e023a80d072382d
> > > 40102c4580c48e2100001e00000000d5
> >
> > OK, so this is your 4k monitor. It is plugged into the *secondary*
> > GPU, and does not report any 4k@60 modes in the EDID (well, it does
> > report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
> > this time). Whether that's because the monitor itself doesn't support
> > HDMI 2.0, or you plugged it into your old GPU which does not support
> > HDMI 2.0, I couldn't say from just this output. What I can say is that
> > no amount of modelines will get you 4k@60 in this setup with nouveau.
>
> Here comes the part where you're getting some very funky information
> and I wish I knew from where!
> Actually the code, in hex, is NOT EDID - - - - that was superseded in
> some 2017. Now that may be what nouveau is using but EDID2.0 was
> released some time in 2007 yet its EDID1.4 that is used. That's the first
> problem and it introduces the next problems. Using EDID means that
> nouveau 'thinks' it see  a : (taken from /var/log/Xorg.0.log)

EDID is very much a thing, and is basically the only thing. Things
like DisplayID are extension blocks to the EDID.

> So where are we at now - - - - -
> well there is NO HDMI port on the EVGA Nvidia 570 card

OK, that was a bad guess on my part to explain what I was seeing.

> HDMI cable IS plugged in and there is only only place for it to be plugged
>   in - - - - so the HDMI cable is plugged into the Nvidia 1050 Ti card

Cool. So then what you said was incorrect -- the GTX 570 is the
primary, and the 1050 is secondary. Please flip that around.

> EDID really is way beyond EOL
> Information provided by the EDID reading is most likely erroneous
> Nouveau at lest doesn't seem to have gotten to DisplayID where the current,
>    at least as of 2017, version is 2.0
> if DisplayID were used perhaps the information  listed as taken from my system
>    might be accurate

EDID is the only way for a monitor to provide information. DisplayID
is a block within the EDID. You can access a relatively full-featured
parser at https://people.freedesktop.org/~imirkin/edid-decode/ -- just
paste the hex there.

>
> >
> > >   3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
> > >         h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
> > >         v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
> > >   3840x2160R (0x70c) 533.000MHz +HSync -VSync
> > >         h: width  3840 start 3888 end 3920 total 4000 skew    0 clock 133.25KHz
> > >         v: height 2160 start 2163 end 2168 total 2222           clock  59.97Hz
> >
> Curious as to where in the foregoing you see that this modeline is for
> card 1 (nvidia GTX570)?

Well, I knew it was for secondary GPU. Based on your comments, that
was the 570. I shouldn't have assumed that to be accurate, that's my
bad. I know it's the secondary because the output is named HDMI-1-2.
That means it's on a secondary device. If it were primary, it would
have been like HDMI-1 or HDMI-2.

Perhaps not all the HDMI ports on the device are HDMI 2.0-capable? Or
perhaps not all of them are on the GPU? What I'm seeing is the monitor
reporting a max TMDS of 300mhz, which is not enough for 4k@60. However
4k@30 should work just fine out of the box.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
