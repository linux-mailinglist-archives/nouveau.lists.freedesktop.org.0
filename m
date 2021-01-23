Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D50330122B
	for <lists+nouveau@lfdr.de>; Sat, 23 Jan 2021 03:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850756EA93;
	Sat, 23 Jan 2021 02:09:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07936EA93
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 02:09:28 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id b10so8706309ljp.6
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 18:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p5gXuLURDaXYpcDIyKIpwPb67xOGaCj7KcDo/pVxWsY=;
 b=qms6YEvaNkomx/CWOShgPlTjJO2+vBaOjNwpIGBAwNlBLz3bnnnDGXD5ezzJbHhU9s
 6Ba2qq+kWA+r3fFVVr+4IWFMZG8apjzwpaW6dqZKhPEksVZINIzLhFgKRifh+Rwbov4d
 Y5GIm+vCcwFNJbYrh2MmN9/ma0P9RjXsUGRDaCe/kUzYghmv4v3r+CBICgPkv9ZuvwMq
 oD234VqUpG9DJjtC2VSW05ar6/br8ISJmUZCktFBrtug0DsaisUbPbbdvZaZz4ifUhVu
 PtEip8lSq9YsRwPAzrnGr7tsr/9UNVz2pf+VJd6JbqpMwDKrneu/QdYZNhrF2xlPCTvI
 OpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5gXuLURDaXYpcDIyKIpwPb67xOGaCj7KcDo/pVxWsY=;
 b=R4PzEuWGYQy9gWMBUgdcvZ+rZmwQceVCQ+1+OdBYc80WTHBdFO3AcATTW2By3Odotd
 gJzk+ROSX0gKdNdlMDLI+ZGvDRtkjr+q9yyg52NAh5U8gG19LGiheclHCpVxCwn+HsnN
 EZkDpgma7BWKkJlcqY59RZw1W/8vSWuLp5XbkPPVFkcPDY9AoomnMMNGnhcrywPFCOgg
 r11i1zKmFCWw9qDQKJkYKwJW8rwYXZV8YiSP1u7uWZhgqfBZBVLOIrLF9XTI2sFWIn4B
 zLdi1BF4lvPgMwARHXjVa9wCwPeC/kFg+j+oSifpY/Hjdt4iwTcc4i39PbcuLCTfo98+
 Enrg==
X-Gm-Message-State: AOAM533SGKMyKgKrHk9FK7DPcQAovtFTtlo0E06TnYWbJnLz+z3EAtQ3
 h3G3A+Wu9iWPykI6HQwHQ5dXYACrKdMRFHWaoN8g97jExho=
X-Google-Smtp-Source: ABdhPJznLVmkQfoHU73dJRYSTbvApEbneEj3J/7zFt3+zzV9GngSiZbhs+fhLz97uX8wNsaMoKiGHMu5YUJ3tqk/YLU=
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr134736ljn.491.1611367766874; 
 Fri, 22 Jan 2021 18:09:26 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
In-Reply-To: <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Fri, 22 Jan 2021 20:08:50 -0600
Message-ID: <CAPpdf5-hvhq9dyrAt8iv5dAT=J_=vDedoA2BgD4wRn_PRkOabA@mail.gmail.com>
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

On Fri, Jan 22, 2021 at 1:12 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> On Fri, Jan 22, 2021 at 12:26 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> snip
> > > > Unfortunately my initial attempt at supporting >340mhz modelines over
> > > > HDMI was incomplete -- worked in my own testing, but not for everyone.
> > > > (You need 597mhz to get 4k@60.)
> > >
> > > $ cvt 3840 2160
> > > # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
> > > Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
> > > 2168 2237 -hsync +vsync
> >
> > That just plain won't work. HDMI 2.0 maxes out at 600mhz, whereas
> > you're giving it a 712mhz modeline. You're trying to be too clever.
>
> Wasn't trying to be 'clever' - - - - entered the command listed and that was
> the output.
>
> > This stuff should just work out of the box.
>
> Sure doesn't seem to.
>
> >
> > What happens if you use a 5.8 or later kernel and don't do any of
> > this? You should just be able to do like xrandr --output HDMI-1-2
> > --auto. But having a 4k display on a secondary GPU is not a great idea
> > -- I'd flip it around, make the GTX 1050 the primary.
>
> The GTX 1050 Ti is the primary.
> I will try rebooting to get to the 5.10 kernel. This was the kernel where my
> system kept refusing to awake after being in sleep mode. Will likely revert
> to the older kernel if I run into the same problem again though.
> >
> > Can you provide the output of "xrandr --verbose" before you've messed
> > around with anything like modelines/etc?
> >
>
> Its huge - - -
>
> $ xrandr --verbose
> Screen 0: minimum 320 x 200, current 7680 x 3000, maximum 16384 x 16384
> DVI-D-1 connected primary 1920x1080+0+1920 (0x47) normal (normal left
> inverted right x axis y axis) 477mm x 268mm
> Identifier: 0x43
> Timestamp:  483290
> Subpixel:   unknown
> Gamma:      1.0:1.0:1.0
> Brightness: 1.0
> Clones:
> CRTC:       0
> CRTCs:      0 1 2 3
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> EDID:
> 00ffffffffffff0009d15f7845540000
> 0c15010380351d782e6085a6564a9c25
> 125054a56b80710081c081408180a9c0
> b300d1c00101023a801871382d40582c
> 4500dd0c1100001e000000ff00373342
> 3039303738534c303030000000fd0032
> 4c185311000a202020202020000000fc
> 0047323432304844424c0a20202000cd
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2, temporal
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 69
> supported: 69
> non-desktop: 0
> range: (0, 1)
>   1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
>         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
>         v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
snip
> HDMI-1 disconnected (normal left inverted right x axis y axis)
> Identifier: 0x44
> Timestamp:  483290
> Subpixel:   unknown
> Clones:
> CRTCs:      0 1 2 3
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2, temporal
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 71
> supported: 71
> non-desktop: 0
> range: (0, 1)
>   3840x2160 (0x70a) 712.750MHz -HSync +VSync
>         h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
>         v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
> DP-1 connected 1920x1080+1920+1920 (0x47) normal (normal left inverted
> right x axis y axis) 477mm x 268mm
> Identifier: 0x45
> Timestamp:  483290
> Subpixel:   unknown
> Gamma:      1.0:1.0:1.0
> Brightness: 1.0
> Clones:
> CRTC:       1
> CRTCs:      0 1 2 3
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> EDID:
> 00ffffffffffff0009d15f7845540000
> 0c15010380351d782e6085a6564a9c25
> 125054a56b80710081c081408180a9c0
> b300d1c00101023a801871382d40582c
> 4500dd0c1100001e000000ff00373342
> 3039313937534c303030000000fd0032
> 4c185311000a202020202020000000fc
> 0047323432304844424c0a20202000cb
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2, temporal
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 73
> supported: 73
> non-desktop: 0
> range: (0, 1)
>   1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
>         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
>         v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
snip
> DVI-I-1-1 connected 1920x1080+1080+0 (0x47) inverted (normal left
> inverted right x axis y axis) 477mm x 268mm
> Identifier: 0xf7
> Timestamp:  483290
> Subpixel:   unknown
> Gamma:      1.0:1.0:1.0
> Brightness: 1.0
> Clones:
> CRTC:       5
> CRTCs:      4 5
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> EDID:
> 00ffffffffffff0009d15f7845540000
> 0c15010380351d782e6085a6564a9c25
> 125054a56b80710081c081408180a9c0
> b300d1c00101023a801871382d40582c
> 4500dd0c1100001e000000ff00373342
> 3039323830534c303030000000fd0032
> 4c185311000a202020202020000000fc
> 0047323432304844424c0a20202000d2
> PRIME Synchronization: 0
> supported: 0, 1
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> subconnector: DVI-D
> supported: Unknown, DVI-D, DVI-A
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 55
> supported: 55
> non-desktop: 0
> range: (0, 1)
>   1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
>         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
>         v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
snip
> DVI-I-1-2 connected 1080x1920+0+0 (0x47) left (normal left inverted
> right x axis y axis) 477mm x 268mm
> Identifier: 0xf8
> Timestamp:  483290
> Subpixel:   unknown
> Gamma:      1.0:1.0:1.0
> Brightness: 1.0
> Clones:
> CRTC:       4
> CRTCs:      4 5
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> EDID:
> 00ffffffffffff0009d15f7845540000
> 0c15010380351d782e6085a6564a9c25
> 125054a56b80710081c081408180a9c0
> b300d1c00101023a801871382d40582c
> 4500dd0c1100001e000000ff00373342
> 3039323133534c303030000000fd0032
> 4c185311000a202020202020000000fc
> 0047323432304844424c0a20202000d6
> PRIME Synchronization: 0
> supported: 0, 1
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> subconnector: DVI-D
> supported: Unknown, DVI-D, DVI-A
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 58
> supported: 58
> non-desktop: 0
> range: (0, 1)
>   1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
>         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
>         v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
snip
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
> PRIME Synchronization: 1
> supported: 0, 1
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 61
> supported: 61
> non-desktop: 0
> range: (0, 1)
>   1920x1080 (0xfc) 266.500MHz +HSync -VSync DoubleScan
>         h: width  1920 start 1944 end 1960 total 2000 skew    0 clock 133.25KHz
>         v: height 1080 start 1081 end 1084 total 1111           clock  59.97Hz
snip
>   3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
>         h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
>         v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
>   3840x2160R (0x70c) 533.000MHz +HSync -VSync
>         h: width  3840 start 3888 end 3920 total 4000 skew    0 clock 133.25KHz
>         v: height 2160 start 2163 end 2168 total 2222           clock  59.97Hz
> DP-1-2 disconnected (normal left inverted right x axis y axis)
> Identifier: 0xfa
> Timestamp:  483290
> Subpixel:   unknown
> Clones:
> CRTCs:      4 5
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000
>             0.000000 0.000000 1.000000
>            filter:
> PRIME Synchronization: 1
> supported: 0, 1
> dithering depth: auto
> supported: auto, 6 bpc, 8 bpc
> dithering mode: auto
> supported: auto, off, static 2x2, dynamic 2x2
> scaling mode: None
> supported: None, Full, Center, Full aspect
> color vibrance: 150
> range: (0, 200)
> vibrant hue: 90
> range: (0, 180)
> underscan vborder: 0
> range: (0, 128)
> underscan hborder: 0
> range: (0, 128)
> underscan: off
> supported: auto, off, on
> link-status: Good
> supported: Good, Bad
> CONNECTOR_ID: 63
> supported: 63
> non-desktop: 0
> range: (0, 1)
>   1920x1080 (0x47) 148.500MHz +HSync +VSync
>         h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
>         v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
snip
> $

(second try at sending - - removed the bulk of the mode lines - the complete
message causes size issues with the list serve)

TIA for the assistance
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
