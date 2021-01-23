Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F49301701
	for <lists+nouveau@lfdr.de>; Sat, 23 Jan 2021 17:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4236E200;
	Sat, 23 Jan 2021 16:55:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD5589EB1
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 16:55:03 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id k47so2941744uad.1
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 08:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMLoHr+tYL2BnaoWmYdantMMBvNj9df2D9V09iBZXbo=;
 b=LUOPm9nLBiVWf9COL/QNu5w9CuX5P5Nfs7Z11C/07UJ6uWZjY22RTIHhZeY8oOMgAM
 OpbON38wmJOjm1ur/f1RLkIBYJpx0HfvH7EFuk38qlalwh8ROdQ0vLj6nPRVCSTzJvDS
 vRIs6eqnY/RqHjgje2Nba0CIVnbQCBfRev4UapQ+sOR+yMCCfkA6AmMIpord3ThBMXpt
 UUb8P9sKwqsAY0Lt48El+odk/8Wot69wy2GU0f2rND3oN6TUXRfHCa5rDSwB3hIMkkR6
 p0EKYixTEbQ1L6lsp3radL1WwvrKFReAt6CTB1sUmV6Hh8crZkSJBZoc0Q8YeXXERWb3
 Dulg==
X-Gm-Message-State: AOAM5330q0pAXk8MniAGB9q3hz4VHqUnF56VxDhNYsa2VFnGcFDDlPyf
 eJWtOFgY7tC46M/iZDZyqYoDSgd5CqUjnPxJeTQ=
X-Google-Smtp-Source: ABdhPJwCR08wpMZ1wIPRkFFJn768jYqSNe/U6OiTyoA/TxRGcYoeUQU8GTJ8CLAtiakQUUezp3gRf+X58ZUmYeHxx9E=
X-Received: by 2002:ab0:35e1:: with SMTP id w1mr210731uau.98.1611420902132;
 Sat, 23 Jan 2021 08:55:02 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
In-Reply-To: <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 23 Jan 2021 11:54:50 -0500
Message-ID: <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
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

On Fri, Jan 22, 2021 at 2:13 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 12:26 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> snip
> > Can you provide the output of "xrandr --verbose" before you've messed
> > around with anything like modelines/etc?
> >
>
> Its huge - - -

Unfortunately it looks like you did this *after* messing with modelines.

>
> $ xrandr --verbose

[ ... snip ...]

> HDMI-1-2 connected (normal left inverted right x axis y axis)
> Identifier: 0xf9
> Timestamp:  483290
> Subpixel:   unknown
> Clones:
> CRTCs:      4 5
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> EDID:
> 00ffffffffffff0020a32f0001000000
> 0c1a0103807341780acf74a3574cb023
> 09484c21080081c08140818001010101
> 01010101010104740030f2705a80b058
> 8a00501d7400001e023a801871382d40
> 582c4500501d7400001e000000fc0048
> 4953454e53450a2020202020000000fd
> 00184b0f511e000a202020202020017f
> 02034571525f5e5d0102040510111314
> 1f202122626364290907071507505506
> 0083010000e200f9e305ff016e030c00
> 1000383c20008001020304e50e60616a
> 6be3060d01011d8018711c1620582c25
> 00c48e2100009e011d80d0721c162010
> 2c2580c48e2100009e023a80d072382d
> 40102c4580c48e2100001e00000000d5

OK, so this is your 4k monitor. It is plugged into the *secondary*
GPU, and does not report any 4k@60 modes in the EDID (well, it does
report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
this time). Whether that's because the monitor itself doesn't support
HDMI 2.0, or you plugged it into your old GPU which does not support
HDMI 2.0, I couldn't say from just this output. What I can say is that
no amount of modelines will get you 4k@60 in this setup with nouveau.

>   3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
>         h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
>         v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
>   3840x2160R (0x70c) 533.000MHz +HSync -VSync
>         h: width  3840 start 3888 end 3920 total 4000 skew    0 clock 133.25KHz
>         v: height 2160 start 2163 end 2168 total 2222           clock  59.97Hz

And this is how I know you've messed with modelines. The whole point
of the above question was to see the pre-messing-with-modelines state.
This is not the default setup. The NVIDIA GTX 570 can only handle up
to 225mhz by default over HDMI, which isn't enough for the 4k@30 modes
either. If you think it can handle more, you can try to override that
with the hdmimhz parameter. However I'd strongly recommend plugging
the 4k screen into the GTX 1050, as even if it did work on the
secondary GPU, sending a 4k screen to a remote GPU is really not a
great idea.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
