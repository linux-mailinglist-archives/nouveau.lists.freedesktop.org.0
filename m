Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE47C3018D7
	for <lists+nouveau@lfdr.de>; Sun, 24 Jan 2021 00:13:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7217D6E237;
	Sat, 23 Jan 2021 23:13:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CC96E237
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 23:13:21 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id p2so3160277uac.3
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 15:13:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nYqBxXPlbTZPcEhPR5WxjlTbQAs7A6O5ehpKbiWh7qU=;
 b=ImtZPp2sDbhFYTT8JlucmKWNmwrOTGJq5tiUnocSR9DojRYfvp0o12VTbEugQFV3b8
 V0YDvMyXtgPEZHnhhZl6v1kkMmlC3z4QzeDNgjtQjeZoyLi+Bz7eGuYrn7S7jAa+Giid
 X3HuJmZXcXfSdXNFnE5zR2d0EjO8o9K7Thh7Ji7c1cgFNerAgp4tPD9EZ0cTe7kaFRYW
 5DnIyDRNeuEUvtcmyuImBZGGJo4QcX6W1t6Q+koaIAL9gnBctUAAlVfp+vXYp+KhOyMt
 CgUztF1M6DjMdn/IkUIhhWBzane54aa6uu4jBCh6WU7Kw1HBSmLxrnTLlHrWDMYDcEwk
 yYyg==
X-Gm-Message-State: AOAM531wD25xMEBvfDfpVOiOy28k7teN4W36YLH3eNb2ACN92AFjHBWh
 d6lt6Y46jcDq2TvOz7pnfCwAuxHJ7pqad8uUFLw=
X-Google-Smtp-Source: ABdhPJyYI84M8FuAcvKjCwNwBL8uKrb4JVlOFqpjvoROfovVH2/9OAezAlD/V514qAgXKcuY7lheIvw/Pt0A2iVEy2Y=
X-Received: by 2002:ab0:5e6:: with SMTP id e93mr88020uae.109.1611443600381;
 Sat, 23 Jan 2021 15:13:20 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
 <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
 <CAKb7UvgUHnYt7Uhobu5Lxu1bfFV_Lc+R9fn-UGCMMcjKbcswHw@mail.gmail.com>
 <CAPpdf58uFaMzWYQTGj=XV9naHnO5LNL==S3v+N_yUv=MQwEmWA@mail.gmail.com>
 <CAKb7UviywJgO_=8iOOf3akyJN7OtpuOFqMCmjpT704Kek7BhzA@mail.gmail.com>
 <CAPpdf590+xGC2NrznrF-QafrgsRMS2LXMXaAVYjV5QcKWtPc=A@mail.gmail.com>
In-Reply-To: <CAPpdf590+xGC2NrznrF-QafrgsRMS2LXMXaAVYjV5QcKWtPc=A@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 23 Jan 2021 18:13:09 -0500
Message-ID: <CAKb7UvhFtXT7Kt6UCAZ7tCm2=kssTfCLRqUm+ajXiPo0Vn1Ksw@mail.gmail.com>
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

On Sat, Jan 23, 2021 at 6:09 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> On Sat, Jan 23, 2021 at 12:52 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Sat, Jan 23, 2021 at 1:40 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
> > >
> > > On Sat, Jan 23, 2021 at 10:55 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > >
> > > > On Fri, Jan 22, 2021 at 2:13 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
> > > > >
> > > > > On Fri, Jan 22, 2021 at 12:26 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > > > snip
> > >
> > > I've been doing a bunch of research and have a whole lot more input but still
> > > can't find any answers - - - - except holes where there 'should be' answers.
> > >338.75  3840 4080 4488 5136  2160 2163 2168 2200 -hsync +vsync
> > > I also understand you're trying to help but some of the stuff you've
> > > been stating
> > > - - - well - - - it just ain't so! - - - - so if you'd rather not
> > > continue - - - - fair enough
> > > - - - -
> >
> > No one's perfect. I have to make do with guesses which are the
> > simplest explanations. Sometimes there's something else.
> >
> > > >
> > > > Unfortunately it looks like you did this *after* messing with modelines.
> > > >
> > > Getting that information would have meant being able to go back in time some
> > > 24 hours or so. I can't find any way of removing mode lines from xrandr - - -
> > > or do you know of some?338.75  3840 4080 4488 5136  2160 2163 2168 2200 -hsync +vsync
> >
> > A reboot is a great way to reset these things.
>
> Unfortunately- - - - here - - - - a reboot means the use of about 30 minutes
> in using xrandr to connect monitors 3 and 4 (even without the HDMI I'm
> working on) and then setting up everything else on my system (only 20 desktops
> and almost all of the them are loaded) so reboots are used as seldom as
> possible.
> >
> > > > >
> > > > > $ xrandr --verbose
> > > >
> > > > [ ... snip ...]
> > > >
> > > > > HDMI-1-2 connected (normal left inverted right x axis y axis)
> > > > > Identifier: 0xf9
> > > > > Timestamp:  483290
> > > > > Subpixel:   unknown
> > > > > Clones:
> > > > > CRTCs:      4 5
> > > > > Transform:  1.000000 0.000000 0.000000
> > > > >             0.000000 1.000000 0.000000
> > > > >             0.000000 0.000000 1.000000
> > > > >            filter:
> > > > > EDID:
> > > > > 00ffffffffffff0020a32f0001000000
> > > > > 0c1a0103807341780acf74a3574cb023
> > > > > 09484c21080081c08140818001010101
> > > > > 01010101010104740030f2705a80b058
> > > > > 8a00501d7400001e023a801871382d40
> > > > > 582c4500501d7400001e000000fc0048
> > > > > 4953454e53450a2020202020000000fd
> > > > > 00184b0f511e000a202020202020017f
> > > > > 02034571525f5e5d0102040510111314
> > > > > 1f202122626364290907071507505506
> > > > > 0083010000e200f9e305ff016e030c00
> > > > > 1000383c20008001020304e50e60616a
> > > > > 6be3060d01011d8018711c1620582c25
> > > > > 00c48e2100009e011d80d0721c162010
> > > > > 2c2580c48e2100009e023a80d072382d
> > > > > 40102c4580c48e2100001e00000000d5
> > > >
> > > > OK, so this is your 4k monitor. It is plugged into the *secondary*
> > > > GPU, and does not report any 4k@60 modes in the EDID (well, it does
> > > > report 4k@60 YUV 4:2:0 modes, but we don't support those in nouveau at
> > > > this time). Whether that's because the monitor itself doesn't support
> > > > HDMI 2.0, or you plugged it into your old GPU which does not support
> > > > HDMI 2.0, I couldn't say from just this output. What I can say is that
> > > > no amount of modelines will get you 4k@60 in this setup with nouveau.
> > >
> > > Here comes the part where you're getting some very funky information
> > > and I wish I knew from where!
> > > Actually the code, in hex, is NOT EDID - - - - that was superseded in
> > > some 2017. Now that may be what nouveau is using but EDID2.0 was
> > > released some time in 2007 yet its EDID1.4 that is used. That's the first
> > > problem and it introduces the next problems. Using EDID means that
> > > nouveau 'thinks' it see  a : (taken from /var/log/Xorg.0.log)
> >
> > EDID is very much a thing, and is basically the only thing. Things
> > like DisplayID are extension blocks to the EDID.
> >
> > > So where are we at now - - - - -
> > > well there is NO HDMI port on the EVGA Nvidia 570 card
> >
> > OK, that was a bad guess on my part to explain what I was seeing.
> >
> > > HDMI cable IS plugged in and there is only only place for it to be plugged
> > >   in - - - - so the HDMI cable is plugged into the Nvidia 1050 Ti card
> >
> > Cool. So then what you said was incorrect -- the GTX 570 is the
> > primary, and the 1050 is secondary. Please flip that around.
> >
> > > EDID really is way beyond EOL
> > > Information provided by the EDID reading is most likely erroneous
> > > Nouveau at lest doesn't seem to have gotten to DisplayID where the current,
> > >    at least as of 2017, version is 2.0
> > > if DisplayID were used perhaps the information  listed as taken from my system
> > >    might be accurate
> >
> > EDID is the only way for a monitor to provide information. DisplayID
> > is a block within the EDID. You can access a relatively full-featured
> > parser at https://people.freedesktop.org/~imirkin/edid-decode/ -- just
> > paste the hex there.
>
> edid-decode (hex):
>
> 00 ff ff ff ff ff ff 00 20 a3 2f 00 01 00 00 00
> 0c 1a 01 03 80 73 41 78 0a cf 74 a3 57 4c b0 23
> 09 48 4c 21 08 00 81 c0 81 40 81 80 01 01 01 01
> 01 01 01 01 01 01 04 74 00 30 f2 70 5a 80 b0 58
> 8a 00 50 1d 74 00 00 1e 02 3a 80 18 71 38 2d 40
> 58 2c 45 00 50 1d 74 00 00 1e 00 00 00 fc 00 48
> 49 53 45 4e 53 45 0a 20 20 20 20 20 00 00 00 fd
> 00 18 4b 0f 51 1e 00 0a 20 20 20 20 20 20 01 7f
>
> 02 03 45 71 52 5f 5e 5d 01 02 04 05 10 11 13 14
> 1f 20 21 22 62 63 64 29 09 07 07 15 07 50 55 06
> 00 83 01 00 00 e2 00 f9 e3 05 ff 01 6e 03 0c 00
> 10 00 38 3c 20 00 80 01 02 03 04 e5 0e 60 61 6a
> 6b e3 06 0d 01 01 1d 80 18 71 1c 16 20 58 2c 25
> 00 c4 8e 21 00 00 9e 01 1d 80 d0 72 1c 16 20 10
> 2c 25 80 c4 8e 21 00 00 9e 02 3a 80 d0 72 38 2d
> 40 10 2c 45 80 c4 8e 21 00 00 1e 00 00 00 00 d5
>
> ----------------
>
> Block 0, Base EDID:
>   EDID Structure Version & Revision: 1.3
>   Vendor & Product Identification:
>     Manufacturer: HEC
>     Model: 47
>     Serial Number: 1
>     Made in: week 12 of 2016
>   Basic Display Parameters & Features:
>     Digital display
>     Maximum image size: 115 cm x 65 cm
>     Gamma: 2.20
>     RGB color display
>     First detailed timing is the preferred timing
>   Color Characteristics:
>     Red  : 0.6396, 0.3398
>     Green: 0.2998, 0.6904
>     Blue : 0.1376, 0.0380
>     White: 0.2822, 0.2968
>   Established Timings I & II:
>     DMT 0x04:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
>     DMT 0x09:   800x600    60.317 Hz   4:3    37.879 kHz  40.000 MHz
>     DMT 0x10:  1024x768    60.004 Hz   4:3    48.363 kHz  65.000 MHz
>   Standard Timings:
>     DMT 0x55:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz
>     DMT 0x20:  1280x960    60.000 Hz   4:3    60.000 kHz 108.000 MHz
>     DMT 0x23:  1280x1024   60.020 Hz   5:4    63.981 kHz 108.000 MHz
>   Detailed Timing Descriptors:
>     DTD 1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
> (1872 mm x 1053 mm)
>                  Hfront  176 Hsync  88 Hback 296 Hpol P
>                  Vfront    8 Vsync  10 Vback  72 Vpol P
>     DTD 2:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz
> (1872 mm x 1053 mm)
>                  Hfront   88 Hsync  44 Hback 148 Hpol P
>                  Vfront    4 Vsync   5 Vback  36 Vpol P
>     Display Product Name: 'HISENSE'
>   Display Range Limits:
>     Monitor ranges (GTF): 24-75 Hz V, 15-81 kHz H, max dotclock 300 MHz
>   Extension blocks: 1
> Checksum: 0x7f
>
> ----------------
>
> Block 1, CTA-861 Extension Block:
>   Revision: 3
>   Basic audio support
>   Supports YCbCr 4:4:4
>   Supports YCbCr 4:2:2
>   Native detailed modes: 1
>   Video Data Block:
>     VIC  95:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
>     VIC  94:  3840x2160   25.000 Hz  16:9    56.250 kHz 297.000 MHz
>     VIC  93:  3840x2160   24.000 Hz  16:9    54.000 kHz 297.000 MHz
>     VIC   1:   640x480    59.940 Hz   4:3    31.469 kHz  25.175 MHz
>     VIC   2:   720x480    59.940 Hz   4:3    31.469 kHz  27.000 MHz
>     VIC   4:  1280x720    60.000 Hz  16:9    45.000 kHz  74.250 MHz
>     VIC   5:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz
>     VIC  16:  1920x1080   60.000 Hz  16:9    67.500 kHz 148.500 MHz
>     VIC  17:   720x576    50.000 Hz   4:3    31.250 kHz  27.000 MHz
>     VIC  19:  1280x720    50.000 Hz  16:9    37.500 kHz  74.250 MHz
>     VIC  20:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz
>     VIC  31:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz
>     VIC  32:  1920x1080   24.000 Hz  16:9    27.000 kHz  74.250 MHz
>     VIC  33:  1920x1080   25.000 Hz  16:9    28.125 kHz  74.250 MHz
>     VIC  34:  1920x1080   30.000 Hz  16:9    33.750 kHz  74.250 MHz
>     VIC  98:  4096x2160   24.000 Hz 256:135  54.000 kHz 297.000 MHz
>     VIC  99:  4096x2160   25.000 Hz 256:135  56.250 kHz 297.000 MHz
>     VIC 100:  4096x2160   30.000 Hz 256:135  67.500 kHz 297.000 MHz
>   Audio Data Block:
>     Linear PCM:
>       Max channels: 2
>       Supported sample rates (kHz): 48 44.1 32
>       Supported sample sizes (bits): 24 20 16
>     AC-3:
>       Max channels: 6
>       Supported sample rates (kHz): 48 44.1 32
>       Maximum bit rate: 640 kb/s
>     Enhanced AC-3 (DD+):
>       Max channels: 6
>       Supported sample rates (kHz): 48 44.1
>   Speaker Allocation Data Block:
>     FL/FR - Front Left/Right
>   Video Capability Data Block:
>     YCbCr quantization: Selectable (via AVI YQ)
>     RGB quantization: Selectable (via AVI Q)
>     PT scan behavior: Supports both over- and underscan
>     IT scan behavior: Always Underscanned
>     CE scan behavior: Always Overscanned
>   Colorimetry Data Block:
>     xvYCC601
>     xvYCC709
>     sYCC601
>     opYCC601
>     opRGB
>     BT2020cYCC
>     BT2020YCC
>     BT2020RGB
>   Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
>     Source physical address: 1.0.0.0
>     DC_36bit
>     DC_30bit
>     DC_Y444
>     Maximum TMDS clock: 300 MHz
>     Extended HDMI video details:
>       HDMI VICs:
>         HDMI VIC 1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
>         HDMI VIC 2:  3840x2160   25.000 Hz  16:9    56.250 kHz 297.000 MHz
>         HDMI VIC 3:  3840x2160   24.000 Hz  16:9    54.000 kHz 297.000 MHz
>         HDMI VIC 4:  4096x2160   24.000 Hz 256:135  54.000 kHz 297.000 MHz
>   YCbCr 4:2:0 Video Data Block:
>     VIC  96:  3840x2160   50.000 Hz  16:9    56.250 kHz 297.000 MHz
>     VIC  97:  3840x2160   60.000 Hz  16:9    67.500 kHz 297.000 MHz
>     VIC 106:  3840x2160   50.000 Hz  64:27   56.250 kHz 297.000 MHz
>     VIC 107:  3840x2160   60.000 Hz  64:27   67.500 kHz 297.000 MHz
>   HDR Static Metadata Data Block:
>     Electro optical transfer functions:
>       Traditional gamma - SDR luminance range
>       SMPTE ST2084
>       Hybrid Log-Gamma
>     Supported static metadata descriptors:
>       Static metadata type 1
>   Detailed Timing Descriptors:
>     DTD 3:  1920x1080i  60.000 Hz  16:9    33.750 kHz  74.250 MHz (708
> mm x 398 mm)
>                  Hfront   88 Hsync  44 Hback 148 Hpol P
>                  Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd Field
>                  Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 Even Field
>     DTD 4:  1920x1080i  50.000 Hz  16:9    28.125 kHz  74.250 MHz (708
> mm x 398 mm)
>                  Hfront  528 Hsync  44 Hback 148 Hpol P
>                  Vfront    2 Vsync   5 Vback  15 Vpol P Vfront +0.5 Odd Field
>                  Vfront    2 Vsync   5 Vback  15 Vpol P Vback  +0.5 Even Field
>     DTD 5:  1920x1080   50.000 Hz  16:9    56.250 kHz 148.500 MHz (708
> mm x 398 mm)
>                  Hfront  528 Hsync  44 Hback 148 Hpol P
>                  Vfront    4 Vsync   5 Vback  36 Vpol P
> Checksum: 0xd5
>
> ----------------
>
> Preferred Video Timing if only Block 0 is parsed:
>   DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
> (1872 mm x 1053 mm)
>                  Hfront  176 Hsync  88 Hback 296 Hpol P
>                  Vfront    8 Vsync  10 Vback  72 Vpol P
>
> ----------------
>
> Native Video Timing if only Block 0 is parsed:
>   DTD   1:  3840x2160   30.000 Hz  16:9    67.500 kHz 297.000 MHz
> (1872 mm x 1053 mm)
>                  Hfront  176 Hsync  88 Hback 296 Hpol P
>                  Vfront    8 Vsync  10 Vback  72 Vpol P

Yes ... I ran that output myself. What's the point here? Just
confirming all the things I said I guess?

> >
> >
> > Well, I knew it was for secondary GPU. Based on your comments, that
> > was the 570. I shouldn't have assumed that to be accurate, that's my
> > bad. I know it's the secondary because the output is named HDMI-1-2.
> > That means it's on a secondary device. If it were primary, it would
> > have been like HDMI-1 or HDMI-2.
>
> xrandr gives the following
> HDMI-1 disconnected (normal left inverted right x axis y axis)
> Identifier: 0x44
> Timestamp:  483290
> Subpixel:   unknown
> Clones:
> CRTCs:      0 1 2 3
> Transform:  1.000000 0.000000 0.000000
>             0.000000 1.000000 0.000000338.75  3840 4080 4488 5136
> 2160 2163 2168 2200 -hsync +vsync338.75  3840 4080 4488 5136  2160
> 2163 2168 2200 -hsync +vsync
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
>
> >
> > Perhaps not all the HDMI ports on the device are HDMI 2.0-capable? Or
> > perhaps not all of them are on the GPU? What I'm seeing is the monitor
> > reporting a max TMDS of 300mhz, which is not enough for 4k@60. However
> > 4k@30 should work just fine out of the box.
> >
>
> Had done apt upgrade so now am on a 5.10 kernel. (Maybe that will change
> some things - - - here's hoping!!)
> Did a reboot.
> Setup system (xrandr to setup monitors for card 1 + other programs).
>
> $ cvt 3840 2160 30
> # 3840x2160 29.98 Hz (CVT) hsync: 65.96 kHz; pclk: 338.75 MHz
> Modeline "3840x2160_30.00"  338.75  3840 4080 4488 5136  2160 2163
> 2168 2200 -hsync +vsync
> $ xrandr --newmode "3840x2160_30.00"  338.75  3840 4080 4488 5136
> 2160 2163 2168 2200 -hsync +vsync
> $ xrandr --addmode HDMI-1 3840x2160_30.00

If you do this, then you know you're messing something up. If the
modeline isn't already there, don't try adding it. It won't work.

Anyways, good luck in getting this to work. It doesn't seem like
you're too interested in applying my suggestions, so I'm not sure how
I can help.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
