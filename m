Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CC030169F
	for <lists+nouveau@lfdr.de>; Sat, 23 Jan 2021 17:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403656E1F4;
	Sat, 23 Jan 2021 16:11:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0A56EA3D
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 19:13:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id v24so9033718lfr.7
 for <nouveau@lists.freedesktop.org>; Fri, 22 Jan 2021 11:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oKZhY7iy48rX5/LygKhyf5zwW6evCUR7HIVQibt5l2s=;
 b=luerwkGnfobG6gpXH3hm2C2rsexORQmZNFfSlalKgRuqYOwe/Mhtj6ZQug8QB08G4w
 do4Ntgq1yEGbYsqa54NJqESU+D0msRf8ltsWmG+Uy+JTdyDb31ziE7SRaE8mzD918ECp
 aeXoWyqIdU7dEckMLnsyfZ8xoEQtzGEb1SfB389MISrckmPZ4yESSJvkblEAhWky5RBh
 x+2FRB5nPIYmbtiaIHKOYwHdWWqP150KiCqAg7UoDunlan1EV3m/mHsSoSLorIEV2nOf
 g7khqoSxGufVSHM+p8Z11v5ZuTa3yJwn7heOI4xh/q4psGpkNe+VJbTM8XcnwfIcGl3i
 A8CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oKZhY7iy48rX5/LygKhyf5zwW6evCUR7HIVQibt5l2s=;
 b=fNj5++JPHr4IbRQy+i2vDtTlljMUDJq2NelakqqpDSblRgUv56YsJ8XfdcDx/oOGzq
 FRYIpGF7qaJHip/zPxTHwELPlyMpmfwpvxwtuZoZDqp5/vFp4yXUPj5jUXxfuQJtcbLZ
 w1QsSGyZM1WagRMksA7sfifB1wmrmVlH13+J4FgO3k/teKKiJVUvLDBpHTI6BC7nCkvj
 xXN60blY/AC55ia33sL1DGhYhQ/MHHCRTgjvPmb9Qa4s+F3uM1rNQW3LYzeOqhpl11av
 gNM2UTjDUqN+CiNjTEB9I3NBc8BZJ5eLQXso+oYFuVg4WM6HtqnRApCsxcDEgNJbAZD2
 jeZA==
X-Gm-Message-State: AOAM530IOKPlCBDmbNbz2ERq+ZgemeggDuwShGcW56Td2E2IUROuWMeG
 nVtGT+gTKNs9lHfEtHCnLzr13UkLOhnMmmSoAs0=
X-Google-Smtp-Source: ABdhPJwnUkX4svMnoS5IKZMcPp0FbvA/+NqCebLEsLW0jQzYx4saZWse9hjNKf4Trv4nVwX7ws/7zhM7cvhbk/ayuF4=
X-Received: by 2002:a19:6a1a:: with SMTP id u26mr2851412lfu.497.1611342803907; 
 Fri, 22 Jan 2021 11:13:23 -0800 (PST)
MIME-Version: 1.0
References: <CAPpdf5-SoO4qPKg7WuvRsCMT4RGV34gNp+M0ir27a1E8Qu+s4g@mail.gmail.com>
 <CAKb7UvjfPptmKDm_jma90Q0T+JoTmETL-Y0-KzTbv9z7f=ccoA@mail.gmail.com>
 <CAPpdf59jfbS4dhRJ5kvhri7LwJL4UNEyL8rssG+qOcu7G1ZkQg@mail.gmail.com>
 <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
In-Reply-To: <CAKb7Uvh3UOKQ14MQwoDti0Lvsey5oLM4qk_GLze3s9qBFq+19Q@mail.gmail.com>
From: o1bigtenor <o1bigtenor@gmail.com>
Date: Fri, 22 Jan 2021 13:12:46 -0600
Message-ID: <CAPpdf58rtMsE_vHK-i-nKkX5=3K6W4HieJ0+7mH5HhkuEZG+tg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Approved-At: Sat, 23 Jan 2021 16:11:02 +0000
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

On Fri, Jan 22, 2021 at 12:26 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
snip
> > > Unfortunately my initial attempt at supporting >340mhz modelines over
> > > HDMI was incomplete -- worked in my own testing, but not for everyone.
> > > (You need 597mhz to get 4k@60.)
> >
> > $ cvt 3840 2160
> > # 3840x2160 59.98 Hz (CVT 8.29M9) hsync: 134.18 kHz; pclk: 712.75 MHz
> > Modeline "3840x2160_60.00"  712.75  3840 4160 4576 5312  2160 2163
> > 2168 2237 -hsync +vsync
>
> That just plain won't work. HDMI 2.0 maxes out at 600mhz, whereas
> you're giving it a 712mhz modeline. You're trying to be too clever.

Wasn't trying to be 'clever' - - - - entered the command listed and that was
the output.

> This stuff should just work out of the box.

Sure doesn't seem to.

>
> What happens if you use a 5.8 or later kernel and don't do any of
> this? You should just be able to do like xrandr --output HDMI-1-2
> --auto. But having a 4k display on a secondary GPU is not a great idea
> -- I'd flip it around, make the GTX 1050 the primary.

The GTX 1050 Ti is the primary.
I will try rebooting to get to the 5.10 kernel. This was the kernel where my
system kept refusing to awake after being in sleep mode. Will likely revert
to the older kernel if I run into the same problem again though.
>
> Can you provide the output of "xrandr --verbose" before you've messed
> around with anything like modelines/etc?
>

Its huge - - -

$ xrandr --verbose
Screen 0: minimum 320 x 200, current 7680 x 3000, maximum 16384 x 16384
DVI-D-1 connected primary 1920x1080+0+1920 (0x47) normal (normal left
inverted right x axis y axis) 477mm x 268mm
Identifier: 0x43
Timestamp:  483290
Subpixel:   unknown
Gamma:      1.0:1.0:1.0
Brightness: 1.0
Clones:
CRTC:       0
CRTCs:      0 1 2 3
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
EDID:
00ffffffffffff0009d15f7845540000
0c15010380351d782e6085a6564a9c25
125054a56b80710081c081408180a9c0
b300d1c00101023a801871382d40582c
4500dd0c1100001e000000ff00373342
3039303738534c303030000000fd0032
4c185311000a202020202020000000fc
0047323432304844424c0a20202000cd
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2, temporal
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 69
supported: 69
non-desktop: 0
range: (0, 1)
  1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
  1920x1080 (0x48) 173.000MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz
  1920x1080 (0x49) 138.500MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock  66.59KHz
        v: height 1080 start 1083 end 1088 total 1111           clock  59.93Hz
  1680x1050 (0x4a) 174.000MHz -HSync +VSync
        h: width  1680 start 1800 end 1976 total 2272 skew    0 clock  76.58KHz
        v: height 1050 start 1053 end 1059 total 1096           clock  69.88Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz
  1680x1050 (0x4c) 119.000MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1600x1024 (0x4d) 103.125MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock  61.97KHz
        v: height 1024 start 1024 end 1029 total 1030           clock  60.17Hz
  1400x1050 (0x4e) 155.800MHz +HSync +VSync
        h: width  1400 start 1464 end 1784 total 1912 skew    0 clock  81.49KHz
        v: height 1050 start 1052 end 1064 total 1090           clock  74.76Hz
  1400x1050 (0x4f) 145.060MHz -HSync +VSync
        h: width  1400 start 1496 end 1648 total 1896 skew    0 clock  76.51KHz
        v: height 1050 start 1051 end 1054 total 1093           clock  70.00Hz
  1400x1050 (0x50) 122.000MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock  64.89KHz
        v: height 1050 start 1052 end 1064 total 1082           clock  59.98Hz
  1600x900 (0x51) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock  55.99KHz
        v: height  900 start  903 end  908 total  934           clock  59.95Hz
  1600x900 (0x52) 108.000MHz +HSync +VSync
        h: width  1600 start 1624 end 1704 total 1800 skew    0 clock  60.00KHz
        v: height  900 start  901 end  904 total 1000           clock  60.00Hz
  1600x900 (0x53) 97.500MHz +HSync -VSync
        h: width  1600 start 1648 end 1680 total 1760 skew    0 clock  55.40KHz
        v: height  900 start  903 end  908 total  926           clock  59.82Hz
  1280x1024 (0x54) 135.000MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock  79.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  75.02Hz
  1280x1024 (0x55) 108.000MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1440x900 (0x56) 106.500MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock  55.93KHz
        v: height  900 start  903 end  909 total  934           clock  59.89Hz
  1400x900 (0x57) 103.500MHz -HSync +VSync
        h: width  1400 start 1480 end 1624 total 1848 skew    0 clock  56.01KHz
        v: height  900 start  903 end  913 total  934           clock  59.96Hz
  1400x900 (0x58) 86.500MHz +HSync -VSync
        h: width  1400 start 1448 end 1480 total 1560 skew    0 clock  55.45KHz
        v: height  900 start  903 end  913 total  926           clock  59.88Hz
  1280x960 (0x59) 108.000MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1440x810 (0x5a) 151.875MHz +HSync -VSync DoubleScan
        h: width  1440 start 1464 end 1480 total 1520 skew    0 clock  99.92KHz
        v: height  810 start  811 end  814 total  833           clock  59.97Hz
  1368x768 (0x5b) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock  47.79KHz
        v: height  768 start  771 end  781 total  798           clock  59.88Hz
  1368x768 (0x5c) 72.250MHz +HSync -VSync
        h: width  1368 start 1416 end 1448 total 1528 skew    0 clock  47.28KHz
        v: height  768 start  771 end  781 total  790           clock  59.85Hz
  1360x768 (0x5d) 84.750MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock  47.72KHz
        v: height  768 start  771 end  781 total  798           clock  59.80Hz
  1360x768 (0x5e) 72.000MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock  47.37KHz
        v: height  768 start  771 end  781 total  790           clock  59.96Hz
  1280x800 (0x5f) 174.250MHz -HSync +VSync DoubleScan
        h: width  1280 start 1380 end 1516 total 1752 skew    0 clock  99.46KHz
        v: height  800 start  801 end  804 total  829           clock  59.99Hz
  1280x800 (0x60) 134.250MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  98.71KHz
        v: height  800 start  801 end  804 total  823           clock  59.97Hz
  1280x800 (0x61) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz
        v: height  800 start  803 end  809 total  831           clock  59.81Hz
  1280x800 (0x62) 71.000MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
        v: height  800 start  803 end  809 total  823           clock  59.91Hz
  1152x864 (0x63) 108.000MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock  67.50KHz
        v: height  864 start  865 end  868 total  900           clock  75.00Hz
  1152x864 (0x64) 104.990MHz -HSync +VSync
        h: width  1152 start 1224 end 1352 total 1552 skew    0 clock  67.65KHz
        v: height  864 start  865 end  868 total  902           clock  75.00Hz
  1152x864 (0x65) 96.770MHz -HSync +VSync
        h: width  1152 start 1224 end 1344 total 1536 skew    0 clock  63.00KHz
        v: height  864 start  865 end  868 total  900           clock  70.00Hz
  1152x864 (0x66) 81.620MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz
        v: height  864 start  865 end  868 total  895           clock  60.00Hz
  1280x720 (0x67) 156.125MHz -HSync +VSync DoubleScan
        h: width  1280 start 1376 end 1512 total 1744 skew    0 clock  89.52KHz
        v: height  720 start  721 end  724 total  746           clock  60.00Hz
  1280x720 (0x68) 120.750MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  88.79KHz
        v: height  720 start  721 end  724 total  740           clock  59.99Hz
  1280x720 (0x69) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock  44.77KHz
        v: height  720 start  723 end  728 total  748           clock  59.86Hz
  1280x720 (0x6a) 74.250MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
        v: height  720 start  725 end  730 total  750           clock  60.00Hz
  1280x720 (0x6b) 63.750MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  44.27KHz
        v: height  720 start  723 end  728 total  741           clock  59.74Hz
  1152x720 (0x6c) 67.282MHz -HSync +VSync
        h: width  1152 start 1208 end 1328 total 1504 skew    0 clock  44.74KHz
        v: height  720 start  721 end  724 total  746           clock  59.97Hz
  1024x768 (0x6d) 170.240MHz -HSync +VSync DoubleScan
        h: width  1024 start 1108 end 1220 total 1416 skew    0 clock 120.23KHz
        v: height  768 start  768 end  770 total  801           clock  75.05Hz
  1024x768 (0x6e) 133.475MHz -HSync +VSync DoubleScan
        h: width  1024 start 1100 end 1212 total 1400 skew    0 clock  95.34KHz
        v: height  768 start  768 end  770 total  794           clock  60.04Hz
  1024x768 (0x6f) 78.750MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock  60.02KHz
        v: height  768 start  769 end  772 total  800           clock  75.03Hz
  1024x768 (0x70) 75.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock  56.48KHz
        v: height  768 start  771 end  777 total  806           clock  70.07Hz
  1024x768 (0x71) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  960x720 (0x72) 148.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1032 end 1144 total 1320 skew    0 clock 112.50KHz
        v: height  720 start  720 end  722 total  750           clock  75.00Hz
  960x720 (0x73) 117.000MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1128 total 1300 skew    0 clock  90.00KHz
        v: height  720 start  720 end  722 total  750           clock  60.00Hz
  928x696 (0x74) 144.000MHz -HSync +VSync DoubleScan
        h: width   928 start  992 end 1104 total 1280 skew    0 clock 112.50KHz
        v: height  696 start  696 end  698 total  750           clock  75.00Hz
  928x696 (0x75) 109.150MHz -HSync +VSync DoubleScan
        h: width   928 start  976 end 1088 total 1264 skew    0 clock  86.35KHz
        v: height  696 start  696 end  698 total  719           clock  60.05Hz
  896x672 (0x76) 130.500MHz -HSync +VSync DoubleScan
        h: width   896 start  944 end 1052 total 1228 skew    0 clock 106.27KHz
        v: height  672 start  672 end  674 total  708           clock  75.05Hz
  896x672 (0x77) 102.400MHz -HSync +VSync DoubleScan
        h: width   896 start  960 end 1060 total 1224 skew    0 clock  83.66KHz
        v: height  672 start  672 end  674 total  697           clock  60.01Hz
  1024x576 (0x78) 98.500MHz -HSync +VSync DoubleScan
        h: width  1024 start 1092 end 1200 total 1376 skew    0 clock  71.58KHz
        v: height  576 start  577 end  580 total  597           clock  59.95Hz
  1024x576 (0x79) 78.375MHz +HSync -VSync DoubleScan
        h: width  1024 start 1048 end 1064 total 1104 skew    0 clock  70.99KHz
        v: height  576 start  577 end  580 total  592           clock  59.96Hz
  1024x576 (0x7a) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock  35.88KHz
        v: height  576 start  579 end  584 total  599           clock  59.90Hz
  1024x576 (0x7b) 42.000MHz +HSync -VSync
        h: width  1024 start 1072 end 1104 total 1184 skew    0 clock  35.47KHz
        v: height  576 start  579 end  584 total  593           clock  59.82Hz
  960x600 (0x7c) 96.625MHz -HSync +VSync DoubleScan
        h: width   960 start 1028 end 1128 total 1296 skew    0 clock  74.56KHz
        v: height  600 start  601 end  604 total  622           clock  59.93Hz
  960x600 (0x7d) 77.000MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  74.04KHz
        v: height  600 start  601 end  604 total  617           clock  60.00Hz
  832x624 (0x7e) 57.284MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock  49.73KHz
        v: height  624 start  625 end  628 total  667           clock  74.55Hz
  960x540 (0x7f) 86.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1124 total 1288 skew    0 clock  67.16KHz
        v: height  540 start  541 end  544 total  560           clock  59.96Hz
  960x540 (0x80) 69.250MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  66.59KHz
        v: height  540 start  541 end  544 total  555           clock  59.99Hz
  960x540 (0x81) 40.750MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock  33.51KHz
        v: height  540 start  543 end  548 total  562           clock  59.63Hz
  960x540 (0x82) 37.250MHz +HSync -VSync
        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz
  800x600 (0x83) 101.250MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  93.75KHz
        v: height  600 start  600 end  602 total  625           clock  75.00Hz
  800x600 (0x84) 94.500MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  87.50KHz
        v: height  600 start  600 end  602 total  625           clock  70.00Hz
  800x600 (0x85) 87.750MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  81.25KHz
        v: height  600 start  600 end  602 total  625           clock  65.00Hz
  800x600 (0x86) 81.000MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  75.00KHz
        v: height  600 start  600 end  602 total  625           clock  60.00Hz
  800x600 (0x87) 50.000MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock  48.08KHz
        v: height  600 start  637 end  643 total  666           clock  72.19Hz
  800x600 (0x88) 49.500MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock  46.88KHz
        v: height  600 start  601 end  604 total  625           clock  75.00Hz
  800x600 (0x89) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x8a) 36.000MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  840x525 (0x8b) 93.500MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  82.31KHz
        v: height  525 start  526 end  529 total  549           clock  74.96Hz
  840x525 (0x8c) 87.000MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  76.58KHz
        v: height  525 start  526 end  529 total  548           clock  69.88Hz
  840x525 (0x8d) 73.125MHz -HSync +VSync DoubleScan
        h: width   840 start  892 end  980 total 1120 skew    0 clock  65.29KHz
        v: height  525 start  526 end  529 total  544           clock  60.01Hz
  840x525 (0x8e) 59.500MHz +HSync -VSync DoubleScan
        h: width   840 start  864 end  880 total  920 skew    0 clock  64.67KHz
        v: height  525 start  526 end  529 total  540           clock  59.88Hz
  864x486 (0x8f) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock  30.32KHz
        v: height  486 start  489 end  494 total  506           clock  59.92Hz
  864x486 (0x90) 30.500MHz +HSync -VSync
        h: width   864 start  912 end  944 total 1024 skew    0 clock  29.79KHz
        v: height  486 start  489 end  494 total  500           clock  59.57Hz
  800x512 (0x91) 51.562MHz +HSync +VSync DoubleScan
        h: width   800 start  800 end  828 total  832 skew    0 clock  61.97KHz
        v: height  512 start  512 end  514 total  515           clock  60.17Hz
  700x525 (0x92) 77.900MHz +HSync +VSync DoubleScan
        h: width   700 start  732 end  892 total  956 skew    0 clock  81.49KHz
        v: height  525 start  526 end  532 total  545           clock  74.76Hz
  700x525 (0x93) 72.530MHz -HSync +VSync DoubleScan
        h: width   700 start  748 end  824 total  948 skew    0 clock  76.51KHz
        v: height  525 start  525 end  527 total  546           clock  70.06Hz
  700x525 (0x94) 61.000MHz +HSync +VSync DoubleScan
        h: width   700 start  744 end  820 total  940 skew    0 clock  64.89KHz
        v: height  525 start  526 end  532 total  541           clock  59.98Hz
  800x450 (0x95) 59.125MHz -HSync +VSync DoubleScan
        h: width   800 start  848 end  928 total 1056 skew    0 clock  55.99KHz
        v: height  450 start  451 end  454 total  467           clock  59.95Hz
  800x450 (0x96) 48.750MHz +HSync -VSync DoubleScan
        h: width   800 start  824 end  840 total  880 skew    0 clock  55.40KHz
        v: height  450 start  451 end  454 total  463           clock  59.82Hz
  640x512 (0x97) 67.500MHz +HSync +VSync DoubleScan
        h: width   640 start  648 end  720 total  844 skew    0 clock  79.98KHz
        v: height  512 start  512 end  514 total  533           clock  75.02Hz
  640x512 (0x98) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  664 end  720 total  844 skew    0 clock  63.98KHz
        v: height  512 start  512 end  514 total  533           clock  60.02Hz
  720x450 (0x99) 53.250MHz -HSync +VSync DoubleScan
        h: width   720 start  760 end  836 total  952 skew    0 clock  55.93KHz
        v: height  450 start  451 end  454 total  467           clock  59.89Hz
  700x450 (0x9a) 51.750MHz -HSync +VSync DoubleScan
        h: width   700 start  740 end  812 total  924 skew    0 clock  56.01KHz
        v: height  450 start  451 end  456 total  467           clock  59.96Hz
  700x450 (0x9b) 43.250MHz +HSync -VSync DoubleScan
        h: width   700 start  724 end  740 total  780 skew    0 clock  55.45KHz
        v: height  450 start  451 end  456 total  463           clock  59.88Hz
  640x480 (0x9c) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  688 end  744 total  900 skew    0 clock  60.00KHz
        v: height  480 start  480 end  482 total  500           clock  60.00Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9e) 31.500MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock  37.86KHz
        v: height  480 start  489 end  492 total  520           clock  72.81Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9f) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz
  720x405 (0xa0) 22.500MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock  25.11KHz
        v: height  405 start  408 end  413 total  422           clock  59.51Hz
  720x405 (0xa1) 21.750MHz +HSync -VSync
        h: width   720 start  768 end  800 total  880 skew    0 clock  24.72KHz
        v: height  405 start  408 end  413 total  419           clock  58.99Hz
  720x400 (0xa2) 28.320MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock  31.47KHz
        v: height  400 start  412 end  414 total  449           clock  70.08Hz
  684x384 (0xa3) 42.625MHz -HSync +VSync DoubleScan
        h: width   684 start  720 end  788 total  892 skew    0 clock  47.79KHz
        v: height  384 start  385 end  390 total  399           clock  59.88Hz
  684x384 (0xa4) 36.125MHz +HSync -VSync DoubleScan
        h: width   684 start  708 end  724 total  764 skew    0 clock  47.28KHz
        v: height  384 start  385 end  390 total  395           clock  59.85Hz
  680x384 (0xa5) 42.375MHz -HSync +VSync DoubleScan
        h: width   680 start  716 end  784 total  888 skew    0 clock  47.72KHz
        v: height  384 start  385 end  390 total  399           clock  59.80Hz
  680x384 (0xa6) 36.000MHz +HSync -VSync DoubleScan
        h: width   680 start  704 end  720 total  760 skew    0 clock  47.37KHz
        v: height  384 start  385 end  390 total  395           clock  59.96Hz
  640x400 (0xa7) 41.750MHz -HSync +VSync DoubleScan
        h: width   640 start  676 end  740 total  840 skew    0 clock  49.70KHz
        v: height  400 start  401 end  404 total  415           clock  59.88Hz
  640x400 (0xa8) 35.500MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  49.31KHz
        v: height  400 start  401 end  404 total  411           clock  59.98Hz
  576x432 (0xa9) 54.000MHz +HSync +VSync DoubleScan
        h: width   576 start  608 end  672 total  800 skew    0 clock  67.50KHz
        v: height  432 start  432 end  434 total  450           clock  75.00Hz
  576x432 (0xaa) 52.495MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  676 total  776 skew    0 clock  67.65KHz
        v: height  432 start  432 end  434 total  451           clock  75.00Hz
  576x432 (0xab) 48.385MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  672 total  768 skew    0 clock  63.00KHz
        v: height  432 start  432 end  434 total  450           clock  70.00Hz
  576x432 (0xac) 40.810MHz -HSync +VSync DoubleScan
        h: width   576 start  608 end  668 total  760 skew    0 clock  53.70KHz
        v: height  432 start  432 end  434 total  447           clock  60.06Hz
  640x360 (0xad) 37.250MHz -HSync +VSync DoubleScan
        h: width   640 start  672 end  736 total  832 skew    0 clock  44.77KHz
        v: height  360 start  361 end  364 total  374           clock  59.86Hz
  640x360 (0xae) 31.875MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  44.27KHz
        v: height  360 start  361 end  364 total  370           clock  59.83Hz
  640x360 (0xaf) 18.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock  22.50KHz
        v: height  360 start  363 end  368 total  376           clock  59.84Hz
  640x360 (0xb0) 17.750MHz +HSync -VSync
        h: width   640 start  688 end  720 total  800 skew    0 clock  22.19KHz
        v: height  360 start  363 end  368 total  374           clock  59.32Hz
  512x384 (0xb1) 39.375MHz +HSync +VSync DoubleScan
        h: width   512 start  520 end  568 total  656 skew    0 clock  60.02KHz
        v: height  384 start  384 end  386 total  400           clock  75.03Hz
  512x384 (0xb2) 37.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  664 skew    0 clock  56.48KHz
        v: height  384 start  385 end  388 total  403           clock  70.07Hz
  512x384 (0xb3) 32.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  672 skew    0 clock  48.36KHz
        v: height  384 start  385 end  388 total  403           clock  60.00Hz
  512x288 (0xb4) 23.250MHz -HSync +VSync DoubleScan
        h: width   512 start  532 end  580 total  648 skew    0 clock  35.88KHz
        v: height  288 start  289 end  292 total  299           clock  60.00Hz
  512x288 (0xb5) 21.000MHz +HSync -VSync DoubleScan
        h: width   512 start  536 end  552 total  592 skew    0 clock  35.47KHz
        v: height  288 start  289 end  292 total  296           clock  59.92Hz
  416x312 (0xb6) 28.642MHz -HSync -VSync DoubleScan
        h: width   416 start  432 end  464 total  576 skew    0 clock  49.73KHz
        v: height  312 start  312 end  314 total  333           clock  74.66Hz
  480x270 (0xb7) 20.375MHz -HSync +VSync DoubleScan
        h: width   480 start  496 end  544 total  608 skew    0 clock  33.51KHz
        v: height  270 start  271 end  274 total  281           clock  59.63Hz
  480x270 (0xb8) 18.625MHz +HSync -VSync DoubleScan
        h: width   480 start  504 end  520 total  560 skew    0 clock  33.26KHz
        v: height  270 start  271 end  274 total  278           clock  59.82Hz
  400x300 (0xb9) 25.000MHz +HSync +VSync DoubleScan
        h: width   400 start  428 end  488 total  520 skew    0 clock  48.08KHz
        v: height  300 start  318 end  321 total  333           clock  72.19Hz
  400x300 (0xba) 24.750MHz +HSync +VSync DoubleScan
        h: width   400 start  408 end  448 total  528 skew    0 clock  46.88KHz
        v: height  300 start  300 end  302 total  312           clock  75.12Hz
  400x300 (0xbb) 20.000MHz +HSync +VSync DoubleScan
        h: width   400 start  420 end  484 total  528 skew    0 clock  37.88KHz
        v: height  300 start  300 end  302 total  314           clock  60.32Hz
  400x300 (0xbc) 18.000MHz +HSync +VSync DoubleScan
        h: width   400 start  412 end  448 total  512 skew    0 clock  35.16KHz
        v: height  300 start  300 end  301 total  312           clock  56.34Hz
  432x243 (0xbd) 16.250MHz -HSync +VSync DoubleScan
        h: width   432 start  444 end  484 total  536 skew    0 clock  30.32KHz
        v: height  243 start  244 end  247 total  253           clock  59.92Hz
  432x243 (0xbe) 15.250MHz +HSync -VSync DoubleScan
        h: width   432 start  456 end  472 total  512 skew    0 clock  29.79KHz
        v: height  243 start  244 end  247 total  250           clock  59.57Hz
  320x240 (0xbf) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  332 end  352 total  416 skew    0 clock  37.86KHz
        v: height  240 start  244 end  246 total  260           clock  72.81Hz
  320x240 (0xc0) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  360 total  420 skew    0 clock  37.50KHz
        v: height  240 start  240 end  242 total  250           clock  75.00Hz
  320x240 (0xc1) 12.587MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  376 total  400 skew    0 clock  31.47KHz
        v: height  240 start  245 end  246 total  262           clock  60.05Hz
  360x202 (0xc2) 11.250MHz -HSync +VSync DoubleScan
        h: width   360 start  372 end  404 total  448 skew    0 clock  25.11KHz
        v: height  202 start  204 end  206 total  211           clock  59.51Hz
  360x202 (0xc3) 10.875MHz +HSync -VSync DoubleScan
        h: width   360 start  384 end  400 total  440 skew    0 clock  24.72KHz
        v: height  202 start  204 end  206 total  209           clock  59.13Hz
  320x180 (0xc4)  9.000MHz -HSync +VSync DoubleScan
        h: width   320 start  332 end  360 total  400 skew    0 clock  22.50KHz
        v: height  180 start  181 end  184 total  188           clock  59.84Hz
  320x180 (0xc5)  8.875MHz +HSync -VSync DoubleScan
        h: width   320 start  344 end  360 total  400 skew    0 clock  22.19KHz
        v: height  180 start  181 end  184 total  187           clock  59.32Hz
HDMI-1 disconnected (normal left inverted right x axis y axis)
Identifier: 0x44
Timestamp:  483290
Subpixel:   unknown
Clones:
CRTCs:      0 1 2 3
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2, temporal
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 71
supported: 71
non-desktop: 0
range: (0, 1)
  3840x2160 (0x70a) 712.750MHz -HSync +VSync
        h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
        v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
DP-1 connected 1920x1080+1920+1920 (0x47) normal (normal left inverted
right x axis y axis) 477mm x 268mm
Identifier: 0x45
Timestamp:  483290
Subpixel:   unknown
Gamma:      1.0:1.0:1.0
Brightness: 1.0
Clones:
CRTC:       1
CRTCs:      0 1 2 3
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
EDID:
00ffffffffffff0009d15f7845540000
0c15010380351d782e6085a6564a9c25
125054a56b80710081c081408180a9c0
b300d1c00101023a801871382d40582c
4500dd0c1100001e000000ff00373342
3039313937534c303030000000fd0032
4c185311000a202020202020000000fc
0047323432304844424c0a20202000cb
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2, temporal
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 73
supported: 73
non-desktop: 0
range: (0, 1)
  1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
  1920x1080 (0x48) 173.000MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz
  1920x1080 (0x49) 138.500MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock  66.59KHz
        v: height 1080 start 1083 end 1088 total 1111           clock  59.93Hz
  1680x1050 (0x4a) 174.000MHz -HSync +VSync
        h: width  1680 start 1800 end 1976 total 2272 skew    0 clock  76.58KHz
        v: height 1050 start 1053 end 1059 total 1096           clock  69.88Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz
  1680x1050 (0x4c) 119.000MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1600x1024 (0x4d) 103.125MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock  61.97KHz
        v: height 1024 start 1024 end 1029 total 1030           clock  60.17Hz
  1400x1050 (0x4e) 155.800MHz +HSync +VSync
        h: width  1400 start 1464 end 1784 total 1912 skew    0 clock  81.49KHz
        v: height 1050 start 1052 end 1064 total 1090           clock  74.76Hz
  1400x1050 (0x4f) 145.060MHz -HSync +VSync
        h: width  1400 start 1496 end 1648 total 1896 skew    0 clock  76.51KHz
        v: height 1050 start 1051 end 1054 total 1093           clock  70.00Hz
  1400x1050 (0x50) 122.000MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock  64.89KHz
        v: height 1050 start 1052 end 1064 total 1082           clock  59.98Hz
  1600x900 (0x51) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock  55.99KHz
        v: height  900 start  903 end  908 total  934           clock  59.95Hz
  1600x900 (0x52) 108.000MHz +HSync +VSync
        h: width  1600 start 1624 end 1704 total 1800 skew    0 clock  60.00KHz
        v: height  900 start  901 end  904 total 1000           clock  60.00Hz
  1600x900 (0x53) 97.500MHz +HSync -VSync
        h: width  1600 start 1648 end 1680 total 1760 skew    0 clock  55.40KHz
        v: height  900 start  903 end  908 total  926           clock  59.82Hz
  1280x1024 (0x54) 135.000MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock  79.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  75.02Hz
  1280x1024 (0x55) 108.000MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1440x900 (0x56) 106.500MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock  55.93KHz
        v: height  900 start  903 end  909 total  934           clock  59.89Hz
  1400x900 (0x57) 103.500MHz -HSync +VSync
        h: width  1400 start 1480 end 1624 total 1848 skew    0 clock  56.01KHz
        v: height  900 start  903 end  913 total  934           clock  59.96Hz
  1400x900 (0x58) 86.500MHz +HSync -VSync
        h: width  1400 start 1448 end 1480 total 1560 skew    0 clock  55.45KHz
        v: height  900 start  903 end  913 total  926           clock  59.88Hz
  1280x960 (0x59) 108.000MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1440x810 (0x5a) 151.875MHz +HSync -VSync DoubleScan
        h: width  1440 start 1464 end 1480 total 1520 skew    0 clock  99.92KHz
        v: height  810 start  811 end  814 total  833           clock  59.97Hz
  1368x768 (0x5b) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock  47.79KHz
        v: height  768 start  771 end  781 total  798           clock  59.88Hz
  1368x768 (0x5c) 72.250MHz +HSync -VSync
        h: width  1368 start 1416 end 1448 total 1528 skew    0 clock  47.28KHz
        v: height  768 start  771 end  781 total  790           clock  59.85Hz
  1360x768 (0x5d) 84.750MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock  47.72KHz
        v: height  768 start  771 end  781 total  798           clock  59.80Hz
  1360x768 (0x5e) 72.000MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock  47.37KHz
        v: height  768 start  771 end  781 total  790           clock  59.96Hz
  1280x800 (0x5f) 174.250MHz -HSync +VSync DoubleScan
        h: width  1280 start 1380 end 1516 total 1752 skew    0 clock  99.46KHz
        v: height  800 start  801 end  804 total  829           clock  59.99Hz
  1280x800 (0x60) 134.250MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  98.71KHz
        v: height  800 start  801 end  804 total  823           clock  59.97Hz
  1280x800 (0x61) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz
        v: height  800 start  803 end  809 total  831           clock  59.81Hz
  1280x800 (0x62) 71.000MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
        v: height  800 start  803 end  809 total  823           clock  59.91Hz
  1152x864 (0x63) 108.000MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock  67.50KHz
        v: height  864 start  865 end  868 total  900           clock  75.00Hz
  1152x864 (0x64) 104.990MHz -HSync +VSync
        h: width  1152 start 1224 end 1352 total 1552 skew    0 clock  67.65KHz
        v: height  864 start  865 end  868 total  902           clock  75.00Hz
  1152x864 (0x65) 96.770MHz -HSync +VSync
        h: width  1152 start 1224 end 1344 total 1536 skew    0 clock  63.00KHz
        v: height  864 start  865 end  868 total  900           clock  70.00Hz
  1152x864 (0x66) 81.620MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz
        v: height  864 start  865 end  868 total  895           clock  60.00Hz
  1280x720 (0x67) 156.125MHz -HSync +VSync DoubleScan
        h: width  1280 start 1376 end 1512 total 1744 skew    0 clock  89.52KHz
        v: height  720 start  721 end  724 total  746           clock  60.00Hz
  1280x720 (0x68) 120.750MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  88.79KHz
        v: height  720 start  721 end  724 total  740           clock  59.99Hz
  1280x720 (0x69) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock  44.77KHz
        v: height  720 start  723 end  728 total  748           clock  59.86Hz
  1280x720 (0x6a) 74.250MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
        v: height  720 start  725 end  730 total  750           clock  60.00Hz
  1280x720 (0x6b) 63.750MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  44.27KHz
        v: height  720 start  723 end  728 total  741           clock  59.74Hz
  1152x720 (0x6c) 67.282MHz -HSync +VSync
        h: width  1152 start 1208 end 1328 total 1504 skew    0 clock  44.74KHz
        v: height  720 start  721 end  724 total  746           clock  59.97Hz
  1024x768 (0x6d) 170.240MHz -HSync +VSync DoubleScan
        h: width  1024 start 1108 end 1220 total 1416 skew    0 clock 120.23KHz
        v: height  768 start  768 end  770 total  801           clock  75.05Hz
  1024x768 (0x6e) 133.475MHz -HSync +VSync DoubleScan
        h: width  1024 start 1100 end 1212 total 1400 skew    0 clock  95.34KHz
        v: height  768 start  768 end  770 total  794           clock  60.04Hz
  1024x768 (0x6f) 78.750MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock  60.02KHz
        v: height  768 start  769 end  772 total  800           clock  75.03Hz
  1024x768 (0x70) 75.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock  56.48KHz
        v: height  768 start  771 end  777 total  806           clock  70.07Hz
  1024x768 (0x71) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  960x720 (0x72) 148.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1032 end 1144 total 1320 skew    0 clock 112.50KHz
        v: height  720 start  720 end  722 total  750           clock  75.00Hz
  960x720 (0x73) 117.000MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1128 total 1300 skew    0 clock  90.00KHz
        v: height  720 start  720 end  722 total  750           clock  60.00Hz
  928x696 (0x74) 144.000MHz -HSync +VSync DoubleScan
        h: width   928 start  992 end 1104 total 1280 skew    0 clock 112.50KHz
        v: height  696 start  696 end  698 total  750           clock  75.00Hz
  928x696 (0x75) 109.150MHz -HSync +VSync DoubleScan
        h: width   928 start  976 end 1088 total 1264 skew    0 clock  86.35KHz
        v: height  696 start  696 end  698 total  719           clock  60.05Hz
  896x672 (0x76) 130.500MHz -HSync +VSync DoubleScan
        h: width   896 start  944 end 1052 total 1228 skew    0 clock 106.27KHz
        v: height  672 start  672 end  674 total  708           clock  75.05Hz
  896x672 (0x77) 102.400MHz -HSync +VSync DoubleScan
        h: width   896 start  960 end 1060 total 1224 skew    0 clock  83.66KHz
        v: height  672 start  672 end  674 total  697           clock  60.01Hz
  1024x576 (0x78) 98.500MHz -HSync +VSync DoubleScan
        h: width  1024 start 1092 end 1200 total 1376 skew    0 clock  71.58KHz
        v: height  576 start  577 end  580 total  597           clock  59.95Hz
  1024x576 (0x79) 78.375MHz +HSync -VSync DoubleScan
        h: width  1024 start 1048 end 1064 total 1104 skew    0 clock  70.99KHz
        v: height  576 start  577 end  580 total  592           clock  59.96Hz
  1024x576 (0x7a) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock  35.88KHz
        v: height  576 start  579 end  584 total  599           clock  59.90Hz
  1024x576 (0x7b) 42.000MHz +HSync -VSync
        h: width  1024 start 1072 end 1104 total 1184 skew    0 clock  35.47KHz
        v: height  576 start  579 end  584 total  593           clock  59.82Hz
  960x600 (0x7c) 96.625MHz -HSync +VSync DoubleScan
        h: width   960 start 1028 end 1128 total 1296 skew    0 clock  74.56KHz
        v: height  600 start  601 end  604 total  622           clock  59.93Hz
  960x600 (0x7d) 77.000MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  74.04KHz
        v: height  600 start  601 end  604 total  617           clock  60.00Hz
  832x624 (0x7e) 57.284MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock  49.73KHz
        v: height  624 start  625 end  628 total  667           clock  74.55Hz
  960x540 (0x7f) 86.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1124 total 1288 skew    0 clock  67.16KHz
        v: height  540 start  541 end  544 total  560           clock  59.96Hz
  960x540 (0x80) 69.250MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  66.59KHz
        v: height  540 start  541 end  544 total  555           clock  59.99Hz
  960x540 (0x81) 40.750MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock  33.51KHz
        v: height  540 start  543 end  548 total  562           clock  59.63Hz
  960x540 (0x82) 37.250MHz +HSync -VSync
        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz
  800x600 (0x83) 101.250MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  93.75KHz
        v: height  600 start  600 end  602 total  625           clock  75.00Hz
  800x600 (0x84) 94.500MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  87.50KHz
        v: height  600 start  600 end  602 total  625           clock  70.00Hz
  800x600 (0x85) 87.750MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  81.25KHz
        v: height  600 start  600 end  602 total  625           clock  65.00Hz
  800x600 (0x86) 81.000MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  75.00KHz
        v: height  600 start  600 end  602 total  625           clock  60.00Hz
  800x600 (0x87) 50.000MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock  48.08KHz
        v: height  600 start  637 end  643 total  666           clock  72.19Hz
  800x600 (0x88) 49.500MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock  46.88KHz
        v: height  600 start  601 end  604 total  625           clock  75.00Hz
  800x600 (0x89) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x8a) 36.000MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  840x525 (0x8b) 93.500MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  82.31KHz
        v: height  525 start  526 end  529 total  549           clock  74.96Hz
  840x525 (0x8c) 87.000MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  76.58KHz
        v: height  525 start  526 end  529 total  548           clock  69.88Hz
  840x525 (0x8d) 73.125MHz -HSync +VSync DoubleScan
        h: width   840 start  892 end  980 total 1120 skew    0 clock  65.29KHz
        v: height  525 start  526 end  529 total  544           clock  60.01Hz
  840x525 (0x8e) 59.500MHz +HSync -VSync DoubleScan
        h: width   840 start  864 end  880 total  920 skew    0 clock  64.67KHz
        v: height  525 start  526 end  529 total  540           clock  59.88Hz
  864x486 (0x8f) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock  30.32KHz
        v: height  486 start  489 end  494 total  506           clock  59.92Hz
  864x486 (0x90) 30.500MHz +HSync -VSync
        h: width   864 start  912 end  944 total 1024 skew    0 clock  29.79KHz
        v: height  486 start  489 end  494 total  500           clock  59.57Hz
  800x512 (0x91) 51.562MHz +HSync +VSync DoubleScan
        h: width   800 start  800 end  828 total  832 skew    0 clock  61.97KHz
        v: height  512 start  512 end  514 total  515           clock  60.17Hz
  700x525 (0x92) 77.900MHz +HSync +VSync DoubleScan
        h: width   700 start  732 end  892 total  956 skew    0 clock  81.49KHz
        v: height  525 start  526 end  532 total  545           clock  74.76Hz
  700x525 (0x93) 72.530MHz -HSync +VSync DoubleScan
        h: width   700 start  748 end  824 total  948 skew    0 clock  76.51KHz
        v: height  525 start  525 end  527 total  546           clock  70.06Hz
  700x525 (0x94) 61.000MHz +HSync +VSync DoubleScan
        h: width   700 start  744 end  820 total  940 skew    0 clock  64.89KHz
        v: height  525 start  526 end  532 total  541           clock  59.98Hz
  800x450 (0x95) 59.125MHz -HSync +VSync DoubleScan
        h: width   800 start  848 end  928 total 1056 skew    0 clock  55.99KHz
        v: height  450 start  451 end  454 total  467           clock  59.95Hz
  800x450 (0x96) 48.750MHz +HSync -VSync DoubleScan
        h: width   800 start  824 end  840 total  880 skew    0 clock  55.40KHz
        v: height  450 start  451 end  454 total  463           clock  59.82Hz
  640x512 (0x97) 67.500MHz +HSync +VSync DoubleScan
        h: width   640 start  648 end  720 total  844 skew    0 clock  79.98KHz
        v: height  512 start  512 end  514 total  533           clock  75.02Hz
  640x512 (0x98) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  664 end  720 total  844 skew    0 clock  63.98KHz
        v: height  512 start  512 end  514 total  533           clock  60.02Hz
  720x450 (0x99) 53.250MHz -HSync +VSync DoubleScan
        h: width   720 start  760 end  836 total  952 skew    0 clock  55.93KHz
        v: height  450 start  451 end  454 total  467           clock  59.89Hz
  700x450 (0x9a) 51.750MHz -HSync +VSync DoubleScan
        h: width   700 start  740 end  812 total  924 skew    0 clock  56.01KHz
        v: height  450 start  451 end  456 total  467           clock  59.96Hz
  700x450 (0x9b) 43.250MHz +HSync -VSync DoubleScan
        h: width   700 start  724 end  740 total  780 skew    0 clock  55.45KHz
        v: height  450 start  451 end  456 total  463           clock  59.88Hz
  640x480 (0x9c) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  688 end  744 total  900 skew    0 clock  60.00KHz
        v: height  480 start  480 end  482 total  500           clock  60.00Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9e) 31.500MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock  37.86KHz
        v: height  480 start  489 end  492 total  520           clock  72.81Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9f) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz
  720x405 (0xa0) 22.500MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock  25.11KHz
        v: height  405 start  408 end  413 total  422           clock  59.51Hz
  720x405 (0xa1) 21.750MHz +HSync -VSync
        h: width   720 start  768 end  800 total  880 skew    0 clock  24.72KHz
        v: height  405 start  408 end  413 total  419           clock  58.99Hz
  720x400 (0xa2) 28.320MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock  31.47KHz
        v: height  400 start  412 end  414 total  449           clock  70.08Hz
  684x384 (0xa3) 42.625MHz -HSync +VSync DoubleScan
        h: width   684 start  720 end  788 total  892 skew    0 clock  47.79KHz
        v: height  384 start  385 end  390 total  399           clock  59.88Hz
  684x384 (0xa4) 36.125MHz +HSync -VSync DoubleScan
        h: width   684 start  708 end  724 total  764 skew    0 clock  47.28KHz
        v: height  384 start  385 end  390 total  395           clock  59.85Hz
  680x384 (0xa5) 42.375MHz -HSync +VSync DoubleScan
        h: width   680 start  716 end  784 total  888 skew    0 clock  47.72KHz
        v: height  384 start  385 end  390 total  399           clock  59.80Hz
  680x384 (0xa6) 36.000MHz +HSync -VSync DoubleScan
        h: width   680 start  704 end  720 total  760 skew    0 clock  47.37KHz
        v: height  384 start  385 end  390 total  395           clock  59.96Hz
  640x400 (0xa7) 41.750MHz -HSync +VSync DoubleScan
        h: width   640 start  676 end  740 total  840 skew    0 clock  49.70KHz
        v: height  400 start  401 end  404 total  415           clock  59.88Hz
  640x400 (0xa8) 35.500MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  49.31KHz
        v: height  400 start  401 end  404 total  411           clock  59.98Hz
  576x432 (0xa9) 54.000MHz +HSync +VSync DoubleScan
        h: width   576 start  608 end  672 total  800 skew    0 clock  67.50KHz
        v: height  432 start  432 end  434 total  450           clock  75.00Hz
  576x432 (0xaa) 52.495MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  676 total  776 skew    0 clock  67.65KHz
        v: height  432 start  432 end  434 total  451           clock  75.00Hz
  576x432 (0xab) 48.385MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  672 total  768 skew    0 clock  63.00KHz
        v: height  432 start  432 end  434 total  450           clock  70.00Hz
  576x432 (0xac) 40.810MHz -HSync +VSync DoubleScan
        h: width   576 start  608 end  668 total  760 skew    0 clock  53.70KHz
        v: height  432 start  432 end  434 total  447           clock  60.06Hz
  640x360 (0xad) 37.250MHz -HSync +VSync DoubleScan
        h: width   640 start  672 end  736 total  832 skew    0 clock  44.77KHz
        v: height  360 start  361 end  364 total  374           clock  59.86Hz
  640x360 (0xae) 31.875MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  44.27KHz
        v: height  360 start  361 end  364 total  370           clock  59.83Hz
  640x360 (0xaf) 18.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock  22.50KHz
        v: height  360 start  363 end  368 total  376           clock  59.84Hz
  640x360 (0xb0) 17.750MHz +HSync -VSync
        h: width   640 start  688 end  720 total  800 skew    0 clock  22.19KHz
        v: height  360 start  363 end  368 total  374           clock  59.32Hz
  512x384 (0xb1) 39.375MHz +HSync +VSync DoubleScan
        h: width   512 start  520 end  568 total  656 skew    0 clock  60.02KHz
        v: height  384 start  384 end  386 total  400           clock  75.03Hz
  512x384 (0xb2) 37.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  664 skew    0 clock  56.48KHz
        v: height  384 start  385 end  388 total  403           clock  70.07Hz
  512x384 (0xb3) 32.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  672 skew    0 clock  48.36KHz
        v: height  384 start  385 end  388 total  403           clock  60.00Hz
  512x288 (0xb4) 23.250MHz -HSync +VSync DoubleScan
        h: width   512 start  532 end  580 total  648 skew    0 clock  35.88KHz
        v: height  288 start  289 end  292 total  299           clock  60.00Hz
  512x288 (0xb5) 21.000MHz +HSync -VSync DoubleScan
        h: width   512 start  536 end  552 total  592 skew    0 clock  35.47KHz
        v: height  288 start  289 end  292 total  296           clock  59.92Hz
  416x312 (0xb6) 28.642MHz -HSync -VSync DoubleScan
        h: width   416 start  432 end  464 total  576 skew    0 clock  49.73KHz
        v: height  312 start  312 end  314 total  333           clock  74.66Hz
  480x270 (0xb7) 20.375MHz -HSync +VSync DoubleScan
        h: width   480 start  496 end  544 total  608 skew    0 clock  33.51KHz
        v: height  270 start  271 end  274 total  281           clock  59.63Hz
  480x270 (0xb8) 18.625MHz +HSync -VSync DoubleScan
        h: width   480 start  504 end  520 total  560 skew    0 clock  33.26KHz
        v: height  270 start  271 end  274 total  278           clock  59.82Hz
  400x300 (0xb9) 25.000MHz +HSync +VSync DoubleScan
        h: width   400 start  428 end  488 total  520 skew    0 clock  48.08KHz
        v: height  300 start  318 end  321 total  333           clock  72.19Hz
  400x300 (0xba) 24.750MHz +HSync +VSync DoubleScan
        h: width   400 start  408 end  448 total  528 skew    0 clock  46.88KHz
        v: height  300 start  300 end  302 total  312           clock  75.12Hz
  400x300 (0xbb) 20.000MHz +HSync +VSync DoubleScan
        h: width   400 start  420 end  484 total  528 skew    0 clock  37.88KHz
        v: height  300 start  300 end  302 total  314           clock  60.32Hz
  400x300 (0xbc) 18.000MHz +HSync +VSync DoubleScan
        h: width   400 start  412 end  448 total  512 skew    0 clock  35.16KHz
        v: height  300 start  300 end  301 total  312           clock  56.34Hz
  432x243 (0xbd) 16.250MHz -HSync +VSync DoubleScan
        h: width   432 start  444 end  484 total  536 skew    0 clock  30.32KHz
        v: height  243 start  244 end  247 total  253           clock  59.92Hz
  432x243 (0xbe) 15.250MHz +HSync -VSync DoubleScan
        h: width   432 start  456 end  472 total  512 skew    0 clock  29.79KHz
        v: height  243 start  244 end  247 total  250           clock  59.57Hz
  320x240 (0xbf) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  332 end  352 total  416 skew    0 clock  37.86KHz
        v: height  240 start  244 end  246 total  260           clock  72.81Hz
  320x240 (0xc0) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  360 total  420 skew    0 clock  37.50KHz
        v: height  240 start  240 end  242 total  250           clock  75.00Hz
  320x240 (0xc1) 12.587MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  376 total  400 skew    0 clock  31.47KHz
        v: height  240 start  245 end  246 total  262           clock  60.05Hz
  360x202 (0xc2) 11.250MHz -HSync +VSync DoubleScan
        h: width   360 start  372 end  404 total  448 skew    0 clock  25.11KHz
        v: height  202 start  204 end  206 total  211           clock  59.51Hz
  360x202 (0xc3) 10.875MHz +HSync -VSync DoubleScan
        h: width   360 start  384 end  400 total  440 skew    0 clock  24.72KHz
        v: height  202 start  204 end  206 total  209           clock  59.13Hz
  320x180 (0xc4)  9.000MHz -HSync +VSync DoubleScan
        h: width   320 start  332 end  360 total  400 skew    0 clock  22.50KHz
        v: height  180 start  181 end  184 total  188           clock  59.84Hz
  320x180 (0xc5)  8.875MHz +HSync -VSync DoubleScan
        h: width   320 start  344 end  360 total  400 skew    0 clock  22.19KHz
        v: height  180 start  181 end  184 total  187           clock  59.32Hz
DVI-I-1-1 connected 1920x1080+1080+0 (0x47) inverted (normal left
inverted right x axis y axis) 477mm x 268mm
Identifier: 0xf7
Timestamp:  483290
Subpixel:   unknown
Gamma:      1.0:1.0:1.0
Brightness: 1.0
Clones:
CRTC:       5
CRTCs:      4 5
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
EDID:
00ffffffffffff0009d15f7845540000
0c15010380351d782e6085a6564a9c25
125054a56b80710081c081408180a9c0
b300d1c00101023a801871382d40582c
4500dd0c1100001e000000ff00373342
3039323830534c303030000000fd0032
4c185311000a202020202020000000fc
0047323432304844424c0a20202000d2
PRIME Synchronization: 0
supported: 0, 1
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
subconnector: DVI-D
supported: Unknown, DVI-D, DVI-A
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 55
supported: 55
non-desktop: 0
range: (0, 1)
  1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
  1920x1080 (0x48) 173.000MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz
  1920x1080 (0x49) 138.500MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock  66.59KHz
        v: height 1080 start 1083 end 1088 total 1111           clock  59.93Hz
  1680x1050 (0x4a) 174.000MHz -HSync +VSync
        h: width  1680 start 1800 end 1976 total 2272 skew    0 clock  76.58KHz
        v: height 1050 start 1053 end 1059 total 1096           clock  69.88Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz
  1680x1050 (0x4c) 119.000MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1600x1024 (0x4d) 103.125MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock  61.97KHz
        v: height 1024 start 1024 end 1029 total 1030           clock  60.17Hz
  1400x1050 (0x4e) 155.800MHz +HSync +VSync
        h: width  1400 start 1464 end 1784 total 1912 skew    0 clock  81.49KHz
        v: height 1050 start 1052 end 1064 total 1090           clock  74.76Hz
  1400x1050 (0x4f) 145.060MHz -HSync +VSync
        h: width  1400 start 1496 end 1648 total 1896 skew    0 clock  76.51KHz
        v: height 1050 start 1051 end 1054 total 1093           clock  70.00Hz
  1400x1050 (0x50) 122.000MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock  64.89KHz
        v: height 1050 start 1052 end 1064 total 1082           clock  59.98Hz
  1600x900 (0x51) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock  55.99KHz
        v: height  900 start  903 end  908 total  934           clock  59.95Hz
  1600x900 (0x52) 108.000MHz +HSync +VSync
        h: width  1600 start 1624 end 1704 total 1800 skew    0 clock  60.00KHz
        v: height  900 start  901 end  904 total 1000           clock  60.00Hz
  1600x900 (0x53) 97.500MHz +HSync -VSync
        h: width  1600 start 1648 end 1680 total 1760 skew    0 clock  55.40KHz
        v: height  900 start  903 end  908 total  926           clock  59.82Hz
  1280x1024 (0x54) 135.000MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock  79.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  75.02Hz
  1280x1024 (0x55) 108.000MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1440x900 (0x56) 106.500MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock  55.93KHz
        v: height  900 start  903 end  909 total  934           clock  59.89Hz
  1400x900 (0x57) 103.500MHz -HSync +VSync
        h: width  1400 start 1480 end 1624 total 1848 skew    0 clock  56.01KHz
        v: height  900 start  903 end  913 total  934           clock  59.96Hz
  1400x900 (0x58) 86.500MHz +HSync -VSync
        h: width  1400 start 1448 end 1480 total 1560 skew    0 clock  55.45KHz
        v: height  900 start  903 end  913 total  926           clock  59.88Hz
  1280x960 (0x59) 108.000MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1440x810 (0x5a) 151.875MHz +HSync -VSync DoubleScan
        h: width  1440 start 1464 end 1480 total 1520 skew    0 clock  99.92KHz
        v: height  810 start  811 end  814 total  833           clock  59.97Hz
  1368x768 (0x5b) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock  47.79KHz
        v: height  768 start  771 end  781 total  798           clock  59.88Hz
  1368x768 (0x5c) 72.250MHz +HSync -VSync
        h: width  1368 start 1416 end 1448 total 1528 skew    0 clock  47.28KHz
        v: height  768 start  771 end  781 total  790           clock  59.85Hz
  1360x768 (0x5d) 84.750MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock  47.72KHz
        v: height  768 start  771 end  781 total  798           clock  59.80Hz
  1360x768 (0x5e) 72.000MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock  47.37KHz
        v: height  768 start  771 end  781 total  790           clock  59.96Hz
  1280x800 (0x5f) 174.250MHz -HSync +VSync DoubleScan
        h: width  1280 start 1380 end 1516 total 1752 skew    0 clock  99.46KHz
        v: height  800 start  801 end  804 total  829           clock  59.99Hz
  1280x800 (0x60) 134.250MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  98.71KHz
        v: height  800 start  801 end  804 total  823           clock  59.97Hz
  1280x800 (0x61) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz
        v: height  800 start  803 end  809 total  831           clock  59.81Hz
  1280x800 (0x62) 71.000MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
        v: height  800 start  803 end  809 total  823           clock  59.91Hz
  1152x864 (0x63) 108.000MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock  67.50KHz
        v: height  864 start  865 end  868 total  900           clock  75.00Hz
  1152x864 (0x64) 104.990MHz -HSync +VSync
        h: width  1152 start 1224 end 1352 total 1552 skew    0 clock  67.65KHz
        v: height  864 start  865 end  868 total  902           clock  75.00Hz
  1152x864 (0x65) 96.770MHz -HSync +VSync
        h: width  1152 start 1224 end 1344 total 1536 skew    0 clock  63.00KHz
        v: height  864 start  865 end  868 total  900           clock  70.00Hz
  1152x864 (0x66) 81.620MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz
        v: height  864 start  865 end  868 total  895           clock  60.00Hz
  1280x720 (0x67) 156.125MHz -HSync +VSync DoubleScan
        h: width  1280 start 1376 end 1512 total 1744 skew    0 clock  89.52KHz
        v: height  720 start  721 end  724 total  746           clock  60.00Hz
  1280x720 (0x68) 120.750MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  88.79KHz
        v: height  720 start  721 end  724 total  740           clock  59.99Hz
  1280x720 (0x69) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock  44.77KHz
        v: height  720 start  723 end  728 total  748           clock  59.86Hz
  1280x720 (0x6a) 74.250MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
        v: height  720 start  725 end  730 total  750           clock  60.00Hz
  1280x720 (0x6b) 63.750MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  44.27KHz
        v: height  720 start  723 end  728 total  741           clock  59.74Hz
  1152x720 (0x6c) 67.282MHz -HSync +VSync
        h: width  1152 start 1208 end 1328 total 1504 skew    0 clock  44.74KHz
        v: height  720 start  721 end  724 total  746           clock  59.97Hz
  1024x768 (0x6d) 170.240MHz -HSync +VSync DoubleScan
        h: width  1024 start 1108 end 1220 total 1416 skew    0 clock 120.23KHz
        v: height  768 start  768 end  770 total  801           clock  75.05Hz
  1024x768 (0x6e) 133.475MHz -HSync +VSync DoubleScan
        h: width  1024 start 1100 end 1212 total 1400 skew    0 clock  95.34KHz
        v: height  768 start  768 end  770 total  794           clock  60.04Hz
  1024x768 (0x6f) 78.750MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock  60.02KHz
        v: height  768 start  769 end  772 total  800           clock  75.03Hz
  1024x768 (0x70) 75.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock  56.48KHz
        v: height  768 start  771 end  777 total  806           clock  70.07Hz
  1024x768 (0x71) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  960x720 (0x72) 148.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1032 end 1144 total 1320 skew    0 clock 112.50KHz
        v: height  720 start  720 end  722 total  750           clock  75.00Hz
  960x720 (0x73) 117.000MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1128 total 1300 skew    0 clock  90.00KHz
        v: height  720 start  720 end  722 total  750           clock  60.00Hz
  928x696 (0x74) 144.000MHz -HSync +VSync DoubleScan
        h: width   928 start  992 end 1104 total 1280 skew    0 clock 112.50KHz
        v: height  696 start  696 end  698 total  750           clock  75.00Hz
  928x696 (0x75) 109.150MHz -HSync +VSync DoubleScan
        h: width   928 start  976 end 1088 total 1264 skew    0 clock  86.35KHz
        v: height  696 start  696 end  698 total  719           clock  60.05Hz
  896x672 (0x76) 130.500MHz -HSync +VSync DoubleScan
        h: width   896 start  944 end 1052 total 1228 skew    0 clock 106.27KHz
        v: height  672 start  672 end  674 total  708           clock  75.05Hz
  896x672 (0x77) 102.400MHz -HSync +VSync DoubleScan
        h: width   896 start  960 end 1060 total 1224 skew    0 clock  83.66KHz
        v: height  672 start  672 end  674 total  697           clock  60.01Hz
  1024x576 (0x78) 98.500MHz -HSync +VSync DoubleScan
        h: width  1024 start 1092 end 1200 total 1376 skew    0 clock  71.58KHz
        v: height  576 start  577 end  580 total  597           clock  59.95Hz
  1024x576 (0x79) 78.375MHz +HSync -VSync DoubleScan
        h: width  1024 start 1048 end 1064 total 1104 skew    0 clock  70.99KHz
        v: height  576 start  577 end  580 total  592           clock  59.96Hz
  1024x576 (0x7a) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock  35.88KHz
        v: height  576 start  579 end  584 total  599           clock  59.90Hz
  1024x576 (0x7b) 42.000MHz +HSync -VSync
        h: width  1024 start 1072 end 1104 total 1184 skew    0 clock  35.47KHz
        v: height  576 start  579 end  584 total  593           clock  59.82Hz
  960x600 (0x7c) 96.625MHz -HSync +VSync DoubleScan
        h: width   960 start 1028 end 1128 total 1296 skew    0 clock  74.56KHz
        v: height  600 start  601 end  604 total  622           clock  59.93Hz
  960x600 (0x7d) 77.000MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  74.04KHz
        v: height  600 start  601 end  604 total  617           clock  60.00Hz
  832x624 (0x7e) 57.284MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock  49.73KHz
        v: height  624 start  625 end  628 total  667           clock  74.55Hz
  960x540 (0x7f) 86.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1124 total 1288 skew    0 clock  67.16KHz
        v: height  540 start  541 end  544 total  560           clock  59.96Hz
  960x540 (0x80) 69.250MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  66.59KHz
        v: height  540 start  541 end  544 total  555           clock  59.99Hz
  960x540 (0x81) 40.750MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock  33.51KHz
        v: height  540 start  543 end  548 total  562           clock  59.63Hz
  960x540 (0x82) 37.250MHz +HSync -VSync
        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz
  800x600 (0x83) 101.250MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  93.75KHz
        v: height  600 start  600 end  602 total  625           clock  75.00Hz
  800x600 (0x84) 94.500MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  87.50KHz
        v: height  600 start  600 end  602 total  625           clock  70.00Hz
  800x600 (0x85) 87.750MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  81.25KHz
        v: height  600 start  600 end  602 total  625           clock  65.00Hz
  800x600 (0x86) 81.000MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  75.00KHz
        v: height  600 start  600 end  602 total  625           clock  60.00Hz
  800x600 (0x87) 50.000MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock  48.08KHz
        v: height  600 start  637 end  643 total  666           clock  72.19Hz
  800x600 (0x88) 49.500MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock  46.88KHz
        v: height  600 start  601 end  604 total  625           clock  75.00Hz
  800x600 (0x89) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x8a) 36.000MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  840x525 (0x8b) 93.500MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  82.31KHz
        v: height  525 start  526 end  529 total  549           clock  74.96Hz
  840x525 (0x8c) 87.000MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  76.58KHz
        v: height  525 start  526 end  529 total  548           clock  69.88Hz
  840x525 (0x8d) 73.125MHz -HSync +VSync DoubleScan
        h: width   840 start  892 end  980 total 1120 skew    0 clock  65.29KHz
        v: height  525 start  526 end  529 total  544           clock  60.01Hz
  840x525 (0x8e) 59.500MHz +HSync -VSync DoubleScan
        h: width   840 start  864 end  880 total  920 skew    0 clock  64.67KHz
        v: height  525 start  526 end  529 total  540           clock  59.88Hz
  864x486 (0x8f) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock  30.32KHz
        v: height  486 start  489 end  494 total  506           clock  59.92Hz
  864x486 (0x90) 30.500MHz +HSync -VSync
        h: width   864 start  912 end  944 total 1024 skew    0 clock  29.79KHz
        v: height  486 start  489 end  494 total  500           clock  59.57Hz
  800x512 (0x91) 51.562MHz +HSync +VSync DoubleScan
        h: width   800 start  800 end  828 total  832 skew    0 clock  61.97KHz
        v: height  512 start  512 end  514 total  515           clock  60.17Hz
  700x525 (0x92) 77.900MHz +HSync +VSync DoubleScan
        h: width   700 start  732 end  892 total  956 skew    0 clock  81.49KHz
        v: height  525 start  526 end  532 total  545           clock  74.76Hz
  700x525 (0x93) 72.530MHz -HSync +VSync DoubleScan
        h: width   700 start  748 end  824 total  948 skew    0 clock  76.51KHz
        v: height  525 start  525 end  527 total  546           clock  70.06Hz
  700x525 (0x94) 61.000MHz +HSync +VSync DoubleScan
        h: width   700 start  744 end  820 total  940 skew    0 clock  64.89KHz
        v: height  525 start  526 end  532 total  541           clock  59.98Hz
  800x450 (0x95) 59.125MHz -HSync +VSync DoubleScan
        h: width   800 start  848 end  928 total 1056 skew    0 clock  55.99KHz
        v: height  450 start  451 end  454 total  467           clock  59.95Hz
  800x450 (0x96) 48.750MHz +HSync -VSync DoubleScan
        h: width   800 start  824 end  840 total  880 skew    0 clock  55.40KHz
        v: height  450 start  451 end  454 total  463           clock  59.82Hz
  640x512 (0x97) 67.500MHz +HSync +VSync DoubleScan
        h: width   640 start  648 end  720 total  844 skew    0 clock  79.98KHz
        v: height  512 start  512 end  514 total  533           clock  75.02Hz
  640x512 (0x98) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  664 end  720 total  844 skew    0 clock  63.98KHz
        v: height  512 start  512 end  514 total  533           clock  60.02Hz
  720x450 (0x99) 53.250MHz -HSync +VSync DoubleScan
        h: width   720 start  760 end  836 total  952 skew    0 clock  55.93KHz
        v: height  450 start  451 end  454 total  467           clock  59.89Hz
  700x450 (0x9a) 51.750MHz -HSync +VSync DoubleScan
        h: width   700 start  740 end  812 total  924 skew    0 clock  56.01KHz
        v: height  450 start  451 end  456 total  467           clock  59.96Hz
  700x450 (0x9b) 43.250MHz +HSync -VSync DoubleScan
        h: width   700 start  724 end  740 total  780 skew    0 clock  55.45KHz
        v: height  450 start  451 end  456 total  463           clock  59.88Hz
  640x480 (0x9c) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  688 end  744 total  900 skew    0 clock  60.00KHz
        v: height  480 start  480 end  482 total  500           clock  60.00Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9e) 31.500MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock  37.86KHz
        v: height  480 start  489 end  492 total  520           clock  72.81Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9f) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz
  720x405 (0xa0) 22.500MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock  25.11KHz
        v: height  405 start  408 end  413 total  422           clock  59.51Hz
  720x405 (0xa1) 21.750MHz +HSync -VSync
        h: width   720 start  768 end  800 total  880 skew    0 clock  24.72KHz
        v: height  405 start  408 end  413 total  419           clock  58.99Hz
  720x400 (0xa2) 28.320MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock  31.47KHz
        v: height  400 start  412 end  414 total  449           clock  70.08Hz
  684x384 (0xa3) 42.625MHz -HSync +VSync DoubleScan
        h: width   684 start  720 end  788 total  892 skew    0 clock  47.79KHz
        v: height  384 start  385 end  390 total  399           clock  59.88Hz
  684x384 (0xa4) 36.125MHz +HSync -VSync DoubleScan
        h: width   684 start  708 end  724 total  764 skew    0 clock  47.28KHz
        v: height  384 start  385 end  390 total  395           clock  59.85Hz
  680x384 (0xa5) 42.375MHz -HSync +VSync DoubleScan
        h: width   680 start  716 end  784 total  888 skew    0 clock  47.72KHz
        v: height  384 start  385 end  390 total  399           clock  59.80Hz
  680x384 (0xa6) 36.000MHz +HSync -VSync DoubleScan
        h: width   680 start  704 end  720 total  760 skew    0 clock  47.37KHz
        v: height  384 start  385 end  390 total  395           clock  59.96Hz
  640x400 (0xa7) 41.750MHz -HSync +VSync DoubleScan
        h: width   640 start  676 end  740 total  840 skew    0 clock  49.70KHz
        v: height  400 start  401 end  404 total  415           clock  59.88Hz
  640x400 (0xa8) 35.500MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  49.31KHz
        v: height  400 start  401 end  404 total  411           clock  59.98Hz
  576x432 (0xa9) 54.000MHz +HSync +VSync DoubleScan
        h: width   576 start  608 end  672 total  800 skew    0 clock  67.50KHz
        v: height  432 start  432 end  434 total  450           clock  75.00Hz
  576x432 (0xaa) 52.495MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  676 total  776 skew    0 clock  67.65KHz
        v: height  432 start  432 end  434 total  451           clock  75.00Hz
  576x432 (0xab) 48.385MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  672 total  768 skew    0 clock  63.00KHz
        v: height  432 start  432 end  434 total  450           clock  70.00Hz
  576x432 (0xac) 40.810MHz -HSync +VSync DoubleScan
        h: width   576 start  608 end  668 total  760 skew    0 clock  53.70KHz
        v: height  432 start  432 end  434 total  447           clock  60.06Hz
  640x360 (0xad) 37.250MHz -HSync +VSync DoubleScan
        h: width   640 start  672 end  736 total  832 skew    0 clock  44.77KHz
        v: height  360 start  361 end  364 total  374           clock  59.86Hz
  640x360 (0xae) 31.875MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  44.27KHz
        v: height  360 start  361 end  364 total  370           clock  59.83Hz
  640x360 (0xaf) 18.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock  22.50KHz
        v: height  360 start  363 end  368 total  376           clock  59.84Hz
  640x360 (0xb0) 17.750MHz +HSync -VSync
        h: width   640 start  688 end  720 total  800 skew    0 clock  22.19KHz
        v: height  360 start  363 end  368 total  374           clock  59.32Hz
  512x384 (0xb1) 39.375MHz +HSync +VSync DoubleScan
        h: width   512 start  520 end  568 total  656 skew    0 clock  60.02KHz
        v: height  384 start  384 end  386 total  400           clock  75.03Hz
  512x384 (0xb2) 37.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  664 skew    0 clock  56.48KHz
        v: height  384 start  385 end  388 total  403           clock  70.07Hz
  512x384 (0xb3) 32.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  672 skew    0 clock  48.36KHz
        v: height  384 start  385 end  388 total  403           clock  60.00Hz
  512x288 (0xb4) 23.250MHz -HSync +VSync DoubleScan
        h: width   512 start  532 end  580 total  648 skew    0 clock  35.88KHz
        v: height  288 start  289 end  292 total  299           clock  60.00Hz
  512x288 (0xb5) 21.000MHz +HSync -VSync DoubleScan
        h: width   512 start  536 end  552 total  592 skew    0 clock  35.47KHz
        v: height  288 start  289 end  292 total  296           clock  59.92Hz
  416x312 (0xb6) 28.642MHz -HSync -VSync DoubleScan
        h: width   416 start  432 end  464 total  576 skew    0 clock  49.73KHz
        v: height  312 start  312 end  314 total  333           clock  74.66Hz
  480x270 (0xb7) 20.375MHz -HSync +VSync DoubleScan
        h: width   480 start  496 end  544 total  608 skew    0 clock  33.51KHz
        v: height  270 start  271 end  274 total  281           clock  59.63Hz
  480x270 (0xb8) 18.625MHz +HSync -VSync DoubleScan
        h: width   480 start  504 end  520 total  560 skew    0 clock  33.26KHz
        v: height  270 start  271 end  274 total  278           clock  59.82Hz
  400x300 (0xb9) 25.000MHz +HSync +VSync DoubleScan
        h: width   400 start  428 end  488 total  520 skew    0 clock  48.08KHz
        v: height  300 start  318 end  321 total  333           clock  72.19Hz
  400x300 (0xba) 24.750MHz +HSync +VSync DoubleScan
        h: width   400 start  408 end  448 total  528 skew    0 clock  46.88KHz
        v: height  300 start  300 end  302 total  312           clock  75.12Hz
  400x300 (0xbb) 20.000MHz +HSync +VSync DoubleScan
        h: width   400 start  420 end  484 total  528 skew    0 clock  37.88KHz
        v: height  300 start  300 end  302 total  314           clock  60.32Hz
  400x300 (0xbc) 18.000MHz +HSync +VSync DoubleScan
        h: width   400 start  412 end  448 total  512 skew    0 clock  35.16KHz
        v: height  300 start  300 end  301 total  312           clock  56.34Hz
  432x243 (0xbd) 16.250MHz -HSync +VSync DoubleScan
        h: width   432 start  444 end  484 total  536 skew    0 clock  30.32KHz
        v: height  243 start  244 end  247 total  253           clock  59.92Hz
  432x243 (0xbe) 15.250MHz +HSync -VSync DoubleScan
        h: width   432 start  456 end  472 total  512 skew    0 clock  29.79KHz
        v: height  243 start  244 end  247 total  250           clock  59.57Hz
  320x240 (0xbf) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  332 end  352 total  416 skew    0 clock  37.86KHz
        v: height  240 start  244 end  246 total  260           clock  72.81Hz
  320x240 (0xc0) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  360 total  420 skew    0 clock  37.50KHz
        v: height  240 start  240 end  242 total  250           clock  75.00Hz
  320x240 (0xc1) 12.587MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  376 total  400 skew    0 clock  31.47KHz
        v: height  240 start  245 end  246 total  262           clock  60.05Hz
  360x202 (0xc2) 11.250MHz -HSync +VSync DoubleScan
        h: width   360 start  372 end  404 total  448 skew    0 clock  25.11KHz
        v: height  202 start  204 end  206 total  211           clock  59.51Hz
  360x202 (0xc3) 10.875MHz +HSync -VSync DoubleScan
        h: width   360 start  384 end  400 total  440 skew    0 clock  24.72KHz
        v: height  202 start  204 end  206 total  209           clock  59.13Hz
  320x180 (0xc4)  9.000MHz -HSync +VSync DoubleScan
        h: width   320 start  332 end  360 total  400 skew    0 clock  22.50KHz
        v: height  180 start  181 end  184 total  188           clock  59.84Hz
  320x180 (0xc5)  8.875MHz +HSync -VSync DoubleScan
        h: width   320 start  344 end  360 total  400 skew    0 clock  22.19KHz
        v: height  180 start  181 end  184 total  187           clock  59.32Hz
DVI-I-1-2 connected 1080x1920+0+0 (0x47) left (normal left inverted
right x axis y axis) 477mm x 268mm
Identifier: 0xf8
Timestamp:  483290
Subpixel:   unknown
Gamma:      1.0:1.0:1.0
Brightness: 1.0
Clones:
CRTC:       4
CRTCs:      4 5
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
EDID:
00ffffffffffff0009d15f7845540000
0c15010380351d782e6085a6564a9c25
125054a56b80710081c081408180a9c0
b300d1c00101023a801871382d40582c
4500dd0c1100001e000000ff00373342
3039323133534c303030000000fd0032
4c185311000a202020202020000000fc
0047323432304844424c0a20202000d6
PRIME Synchronization: 0
supported: 0, 1
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
subconnector: DVI-D
supported: Unknown, DVI-D, DVI-A
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 58
supported: 58
non-desktop: 0
range: (0, 1)
  1920x1080 (0x47) 148.500MHz +HSync +VSync *current +preferred
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
  1920x1080 (0x48) 173.000MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz
  1920x1080 (0x49) 138.500MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock  66.59KHz
        v: height 1080 start 1083 end 1088 total 1111           clock  59.93Hz
  1680x1050 (0x4a) 174.000MHz -HSync +VSync
        h: width  1680 start 1800 end 1976 total 2272 skew    0 clock  76.58KHz
        v: height 1050 start 1053 end 1059 total 1096           clock  69.88Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz
  1680x1050 (0x4c) 119.000MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1600x1024 (0x4d) 103.125MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock  61.97KHz
        v: height 1024 start 1024 end 1029 total 1030           clock  60.17Hz
  1400x1050 (0x4e) 155.800MHz +HSync +VSync
        h: width  1400 start 1464 end 1784 total 1912 skew    0 clock  81.49KHz
        v: height 1050 start 1052 end 1064 total 1090           clock  74.76Hz
  1400x1050 (0x4f) 145.060MHz -HSync +VSync
        h: width  1400 start 1496 end 1648 total 1896 skew    0 clock  76.51KHz
        v: height 1050 start 1051 end 1054 total 1093           clock  70.00Hz
  1400x1050 (0x50) 122.000MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock  64.89KHz
        v: height 1050 start 1052 end 1064 total 1082           clock  59.98Hz
  1600x900 (0x51) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock  55.99KHz
        v: height  900 start  903 end  908 total  934           clock  59.95Hz
  1600x900 (0x52) 108.000MHz +HSync +VSync
        h: width  1600 start 1624 end 1704 total 1800 skew    0 clock  60.00KHz
        v: height  900 start  901 end  904 total 1000           clock  60.00Hz
  1600x900 (0x53) 97.500MHz +HSync -VSync
        h: width  1600 start 1648 end 1680 total 1760 skew    0 clock  55.40KHz
        v: height  900 start  903 end  908 total  926           clock  59.82Hz
  1280x1024 (0x54) 135.000MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock  79.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  75.02Hz
  1280x1024 (0x55) 108.000MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1440x900 (0x56) 106.500MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock  55.93KHz
        v: height  900 start  903 end  909 total  934           clock  59.89Hz
  1400x900 (0x57) 103.500MHz -HSync +VSync
        h: width  1400 start 1480 end 1624 total 1848 skew    0 clock  56.01KHz
        v: height  900 start  903 end  913 total  934           clock  59.96Hz
  1400x900 (0x58) 86.500MHz +HSync -VSync
        h: width  1400 start 1448 end 1480 total 1560 skew    0 clock  55.45KHz
        v: height  900 start  903 end  913 total  926           clock  59.88Hz
  1280x960 (0x59) 108.000MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1440x810 (0x5a) 151.875MHz +HSync -VSync DoubleScan
        h: width  1440 start 1464 end 1480 total 1520 skew    0 clock  99.92KHz
        v: height  810 start  811 end  814 total  833           clock  59.97Hz
  1368x768 (0x5b) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock  47.79KHz
        v: height  768 start  771 end  781 total  798           clock  59.88Hz
  1368x768 (0x5c) 72.250MHz +HSync -VSync
        h: width  1368 start 1416 end 1448 total 1528 skew    0 clock  47.28KHz
        v: height  768 start  771 end  781 total  790           clock  59.85Hz
  1360x768 (0x5d) 84.750MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock  47.72KHz
        v: height  768 start  771 end  781 total  798           clock  59.80Hz
  1360x768 (0x5e) 72.000MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock  47.37KHz
        v: height  768 start  771 end  781 total  790           clock  59.96Hz
  1280x800 (0x5f) 174.250MHz -HSync +VSync DoubleScan
        h: width  1280 start 1380 end 1516 total 1752 skew    0 clock  99.46KHz
        v: height  800 start  801 end  804 total  829           clock  59.99Hz
  1280x800 (0x60) 134.250MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  98.71KHz
        v: height  800 start  801 end  804 total  823           clock  59.97Hz
  1280x800 (0x61) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz
        v: height  800 start  803 end  809 total  831           clock  59.81Hz
  1280x800 (0x62) 71.000MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
        v: height  800 start  803 end  809 total  823           clock  59.91Hz
  1152x864 (0x63) 108.000MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock  67.50KHz
        v: height  864 start  865 end  868 total  900           clock  75.00Hz
  1152x864 (0x64) 104.990MHz -HSync +VSync
        h: width  1152 start 1224 end 1352 total 1552 skew    0 clock  67.65KHz
        v: height  864 start  865 end  868 total  902           clock  75.00Hz
  1152x864 (0x65) 96.770MHz -HSync +VSync
        h: width  1152 start 1224 end 1344 total 1536 skew    0 clock  63.00KHz
        v: height  864 start  865 end  868 total  900           clock  70.00Hz
  1152x864 (0x66) 81.620MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz
        v: height  864 start  865 end  868 total  895           clock  60.00Hz
  1280x720 (0x67) 156.125MHz -HSync +VSync DoubleScan
        h: width  1280 start 1376 end 1512 total 1744 skew    0 clock  89.52KHz
        v: height  720 start  721 end  724 total  746           clock  60.00Hz
  1280x720 (0x68) 120.750MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  88.79KHz
        v: height  720 start  721 end  724 total  740           clock  59.99Hz
  1280x720 (0x69) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock  44.77KHz
        v: height  720 start  723 end  728 total  748           clock  59.86Hz
  1280x720 (0x6a) 74.250MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
        v: height  720 start  725 end  730 total  750           clock  60.00Hz
  1280x720 (0x6b) 63.750MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  44.27KHz
        v: height  720 start  723 end  728 total  741           clock  59.74Hz
  1152x720 (0x6c) 67.282MHz -HSync +VSync
        h: width  1152 start 1208 end 1328 total 1504 skew    0 clock  44.74KHz
        v: height  720 start  721 end  724 total  746           clock  59.97Hz
  1024x768 (0x6d) 170.240MHz -HSync +VSync DoubleScan
        h: width  1024 start 1108 end 1220 total 1416 skew    0 clock 120.23KHz
        v: height  768 start  768 end  770 total  801           clock  75.05Hz
  1024x768 (0x6e) 133.475MHz -HSync +VSync DoubleScan
        h: width  1024 start 1100 end 1212 total 1400 skew    0 clock  95.34KHz
        v: height  768 start  768 end  770 total  794           clock  60.04Hz
  1024x768 (0x6f) 78.750MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock  60.02KHz
        v: height  768 start  769 end  772 total  800           clock  75.03Hz
  1024x768 (0x70) 75.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock  56.48KHz
        v: height  768 start  771 end  777 total  806           clock  70.07Hz
  1024x768 (0x71) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  960x720 (0x72) 148.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1032 end 1144 total 1320 skew    0 clock 112.50KHz
        v: height  720 start  720 end  722 total  750           clock  75.00Hz
  960x720 (0x73) 117.000MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1128 total 1300 skew    0 clock  90.00KHz
        v: height  720 start  720 end  722 total  750           clock  60.00Hz
  928x696 (0x74) 144.000MHz -HSync +VSync DoubleScan
        h: width   928 start  992 end 1104 total 1280 skew    0 clock 112.50KHz
        v: height  696 start  696 end  698 total  750           clock  75.00Hz
  928x696 (0x75) 109.150MHz -HSync +VSync DoubleScan
        h: width   928 start  976 end 1088 total 1264 skew    0 clock  86.35KHz
        v: height  696 start  696 end  698 total  719           clock  60.05Hz
  896x672 (0x76) 130.500MHz -HSync +VSync DoubleScan
        h: width   896 start  944 end 1052 total 1228 skew    0 clock 106.27KHz
        v: height  672 start  672 end  674 total  708           clock  75.05Hz
  896x672 (0x77) 102.400MHz -HSync +VSync DoubleScan
        h: width   896 start  960 end 1060 total 1224 skew    0 clock  83.66KHz
        v: height  672 start  672 end  674 total  697           clock  60.01Hz
  1024x576 (0x78) 98.500MHz -HSync +VSync DoubleScan
        h: width  1024 start 1092 end 1200 total 1376 skew    0 clock  71.58KHz
        v: height  576 start  577 end  580 total  597           clock  59.95Hz
  1024x576 (0x79) 78.375MHz +HSync -VSync DoubleScan
        h: width  1024 start 1048 end 1064 total 1104 skew    0 clock  70.99KHz
        v: height  576 start  577 end  580 total  592           clock  59.96Hz
  1024x576 (0x7a) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock  35.88KHz
        v: height  576 start  579 end  584 total  599           clock  59.90Hz
  1024x576 (0x7b) 42.000MHz +HSync -VSync
        h: width  1024 start 1072 end 1104 total 1184 skew    0 clock  35.47KHz
        v: height  576 start  579 end  584 total  593           clock  59.82Hz
  960x600 (0x7c) 96.625MHz -HSync +VSync DoubleScan
        h: width   960 start 1028 end 1128 total 1296 skew    0 clock  74.56KHz
        v: height  600 start  601 end  604 total  622           clock  59.93Hz
  960x600 (0x7d) 77.000MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  74.04KHz
        v: height  600 start  601 end  604 total  617           clock  60.00Hz
  832x624 (0x7e) 57.284MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock  49.73KHz
        v: height  624 start  625 end  628 total  667           clock  74.55Hz
  960x540 (0x7f) 86.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1124 total 1288 skew    0 clock  67.16KHz
        v: height  540 start  541 end  544 total  560           clock  59.96Hz
  960x540 (0x80) 69.250MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  66.59KHz
        v: height  540 start  541 end  544 total  555           clock  59.99Hz
  960x540 (0x81) 40.750MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock  33.51KHz
        v: height  540 start  543 end  548 total  562           clock  59.63Hz
  960x540 (0x82) 37.250MHz +HSync -VSync
        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz
  800x600 (0x83) 101.250MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  93.75KHz
        v: height  600 start  600 end  602 total  625           clock  75.00Hz
  800x600 (0x84) 94.500MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  87.50KHz
        v: height  600 start  600 end  602 total  625           clock  70.00Hz
  800x600 (0x85) 87.750MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  81.25KHz
        v: height  600 start  600 end  602 total  625           clock  65.00Hz
  800x600 (0x86) 81.000MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  75.00KHz
        v: height  600 start  600 end  602 total  625           clock  60.00Hz
  800x600 (0x87) 50.000MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock  48.08KHz
        v: height  600 start  637 end  643 total  666           clock  72.19Hz
  800x600 (0x88) 49.500MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock  46.88KHz
        v: height  600 start  601 end  604 total  625           clock  75.00Hz
  800x600 (0x89) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x8a) 36.000MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  840x525 (0x8b) 93.500MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  82.31KHz
        v: height  525 start  526 end  529 total  549           clock  74.96Hz
  840x525 (0x8c) 87.000MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  76.58KHz
        v: height  525 start  526 end  529 total  548           clock  69.88Hz
  840x525 (0x8d) 73.125MHz -HSync +VSync DoubleScan
        h: width   840 start  892 end  980 total 1120 skew    0 clock  65.29KHz
        v: height  525 start  526 end  529 total  544           clock  60.01Hz
  840x525 (0x8e) 59.500MHz +HSync -VSync DoubleScan
        h: width   840 start  864 end  880 total  920 skew    0 clock  64.67KHz
        v: height  525 start  526 end  529 total  540           clock  59.88Hz
  864x486 (0x8f) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock  30.32KHz
        v: height  486 start  489 end  494 total  506           clock  59.92Hz
  864x486 (0x90) 30.500MHz +HSync -VSync
        h: width   864 start  912 end  944 total 1024 skew    0 clock  29.79KHz
        v: height  486 start  489 end  494 total  500           clock  59.57Hz
  800x512 (0x91) 51.562MHz +HSync +VSync DoubleScan
        h: width   800 start  800 end  828 total  832 skew    0 clock  61.97KHz
        v: height  512 start  512 end  514 total  515           clock  60.17Hz
  700x525 (0x92) 77.900MHz +HSync +VSync DoubleScan
        h: width   700 start  732 end  892 total  956 skew    0 clock  81.49KHz
        v: height  525 start  526 end  532 total  545           clock  74.76Hz
  700x525 (0x93) 72.530MHz -HSync +VSync DoubleScan
        h: width   700 start  748 end  824 total  948 skew    0 clock  76.51KHz
        v: height  525 start  525 end  527 total  546           clock  70.06Hz
  700x525 (0x94) 61.000MHz +HSync +VSync DoubleScan
        h: width   700 start  744 end  820 total  940 skew    0 clock  64.89KHz
        v: height  525 start  526 end  532 total  541           clock  59.98Hz
  800x450 (0x95) 59.125MHz -HSync +VSync DoubleScan
        h: width   800 start  848 end  928 total 1056 skew    0 clock  55.99KHz
        v: height  450 start  451 end  454 total  467           clock  59.95Hz
  800x450 (0x96) 48.750MHz +HSync -VSync DoubleScan
        h: width   800 start  824 end  840 total  880 skew    0 clock  55.40KHz
        v: height  450 start  451 end  454 total  463           clock  59.82Hz
  640x512 (0x97) 67.500MHz +HSync +VSync DoubleScan
        h: width   640 start  648 end  720 total  844 skew    0 clock  79.98KHz
        v: height  512 start  512 end  514 total  533           clock  75.02Hz
  640x512 (0x98) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  664 end  720 total  844 skew    0 clock  63.98KHz
        v: height  512 start  512 end  514 total  533           clock  60.02Hz
  720x450 (0x99) 53.250MHz -HSync +VSync DoubleScan
        h: width   720 start  760 end  836 total  952 skew    0 clock  55.93KHz
        v: height  450 start  451 end  454 total  467           clock  59.89Hz
  700x450 (0x9a) 51.750MHz -HSync +VSync DoubleScan
        h: width   700 start  740 end  812 total  924 skew    0 clock  56.01KHz
        v: height  450 start  451 end  456 total  467           clock  59.96Hz
  700x450 (0x9b) 43.250MHz +HSync -VSync DoubleScan
        h: width   700 start  724 end  740 total  780 skew    0 clock  55.45KHz
        v: height  450 start  451 end  456 total  463           clock  59.88Hz
  640x480 (0x9c) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  688 end  744 total  900 skew    0 clock  60.00KHz
        v: height  480 start  480 end  482 total  500           clock  60.00Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9e) 31.500MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock  37.86KHz
        v: height  480 start  489 end  492 total  520           clock  72.81Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9f) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz
  720x405 (0xa0) 22.500MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock  25.11KHz
        v: height  405 start  408 end  413 total  422           clock  59.51Hz
  720x405 (0xa1) 21.750MHz +HSync -VSync
        h: width   720 start  768 end  800 total  880 skew    0 clock  24.72KHz
        v: height  405 start  408 end  413 total  419           clock  58.99Hz
  720x400 (0xa2) 28.320MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock  31.47KHz
        v: height  400 start  412 end  414 total  449           clock  70.08Hz
  684x384 (0xa3) 42.625MHz -HSync +VSync DoubleScan
        h: width   684 start  720 end  788 total  892 skew    0 clock  47.79KHz
        v: height  384 start  385 end  390 total  399           clock  59.88Hz
  684x384 (0xa4) 36.125MHz +HSync -VSync DoubleScan
        h: width   684 start  708 end  724 total  764 skew    0 clock  47.28KHz
        v: height  384 start  385 end  390 total  395           clock  59.85Hz
  680x384 (0xa5) 42.375MHz -HSync +VSync DoubleScan
        h: width   680 start  716 end  784 total  888 skew    0 clock  47.72KHz
        v: height  384 start  385 end  390 total  399           clock  59.80Hz
  680x384 (0xa6) 36.000MHz +HSync -VSync DoubleScan
        h: width   680 start  704 end  720 total  760 skew    0 clock  47.37KHz
        v: height  384 start  385 end  390 total  395           clock  59.96Hz
  640x400 (0xa7) 41.750MHz -HSync +VSync DoubleScan
        h: width   640 start  676 end  740 total  840 skew    0 clock  49.70KHz
        v: height  400 start  401 end  404 total  415           clock  59.88Hz
  640x400 (0xa8) 35.500MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  49.31KHz
        v: height  400 start  401 end  404 total  411           clock  59.98Hz
  576x432 (0xa9) 54.000MHz +HSync +VSync DoubleScan
        h: width   576 start  608 end  672 total  800 skew    0 clock  67.50KHz
        v: height  432 start  432 end  434 total  450           clock  75.00Hz
  576x432 (0xaa) 52.495MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  676 total  776 skew    0 clock  67.65KHz
        v: height  432 start  432 end  434 total  451           clock  75.00Hz
  576x432 (0xab) 48.385MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  672 total  768 skew    0 clock  63.00KHz
        v: height  432 start  432 end  434 total  450           clock  70.00Hz
  576x432 (0xac) 40.810MHz -HSync +VSync DoubleScan
        h: width   576 start  608 end  668 total  760 skew    0 clock  53.70KHz
        v: height  432 start  432 end  434 total  447           clock  60.06Hz
  640x360 (0xad) 37.250MHz -HSync +VSync DoubleScan
        h: width   640 start  672 end  736 total  832 skew    0 clock  44.77KHz
        v: height  360 start  361 end  364 total  374           clock  59.86Hz
  640x360 (0xae) 31.875MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  44.27KHz
        v: height  360 start  361 end  364 total  370           clock  59.83Hz
  640x360 (0xaf) 18.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock  22.50KHz
        v: height  360 start  363 end  368 total  376           clock  59.84Hz
  640x360 (0xb0) 17.750MHz +HSync -VSync
        h: width   640 start  688 end  720 total  800 skew    0 clock  22.19KHz
        v: height  360 start  363 end  368 total  374           clock  59.32Hz
  512x384 (0xb1) 39.375MHz +HSync +VSync DoubleScan
        h: width   512 start  520 end  568 total  656 skew    0 clock  60.02KHz
        v: height  384 start  384 end  386 total  400           clock  75.03Hz
  512x384 (0xb2) 37.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  664 skew    0 clock  56.48KHz
        v: height  384 start  385 end  388 total  403           clock  70.07Hz
  512x384 (0xb3) 32.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  672 skew    0 clock  48.36KHz
        v: height  384 start  385 end  388 total  403           clock  60.00Hz
  512x288 (0xb4) 23.250MHz -HSync +VSync DoubleScan
        h: width   512 start  532 end  580 total  648 skew    0 clock  35.88KHz
        v: height  288 start  289 end  292 total  299           clock  60.00Hz
  512x288 (0xb5) 21.000MHz +HSync -VSync DoubleScan
        h: width   512 start  536 end  552 total  592 skew    0 clock  35.47KHz
        v: height  288 start  289 end  292 total  296           clock  59.92Hz
  416x312 (0xb6) 28.642MHz -HSync -VSync DoubleScan
        h: width   416 start  432 end  464 total  576 skew    0 clock  49.73KHz
        v: height  312 start  312 end  314 total  333           clock  74.66Hz
  480x270 (0xb7) 20.375MHz -HSync +VSync DoubleScan
        h: width   480 start  496 end  544 total  608 skew    0 clock  33.51KHz
        v: height  270 start  271 end  274 total  281           clock  59.63Hz
  480x270 (0xb8) 18.625MHz +HSync -VSync DoubleScan
        h: width   480 start  504 end  520 total  560 skew    0 clock  33.26KHz
        v: height  270 start  271 end  274 total  278           clock  59.82Hz
  400x300 (0xb9) 25.000MHz +HSync +VSync DoubleScan
        h: width   400 start  428 end  488 total  520 skew    0 clock  48.08KHz
        v: height  300 start  318 end  321 total  333           clock  72.19Hz
  400x300 (0xba) 24.750MHz +HSync +VSync DoubleScan
        h: width   400 start  408 end  448 total  528 skew    0 clock  46.88KHz
        v: height  300 start  300 end  302 total  312           clock  75.12Hz
  400x300 (0xbb) 20.000MHz +HSync +VSync DoubleScan
        h: width   400 start  420 end  484 total  528 skew    0 clock  37.88KHz
        v: height  300 start  300 end  302 total  314           clock  60.32Hz
  400x300 (0xbc) 18.000MHz +HSync +VSync DoubleScan
        h: width   400 start  412 end  448 total  512 skew    0 clock  35.16KHz
        v: height  300 start  300 end  301 total  312           clock  56.34Hz
  432x243 (0xbd) 16.250MHz -HSync +VSync DoubleScan
        h: width   432 start  444 end  484 total  536 skew    0 clock  30.32KHz
        v: height  243 start  244 end  247 total  253           clock  59.92Hz
  432x243 (0xbe) 15.250MHz +HSync -VSync DoubleScan
        h: width   432 start  456 end  472 total  512 skew    0 clock  29.79KHz
        v: height  243 start  244 end  247 total  250           clock  59.57Hz
  320x240 (0xbf) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  332 end  352 total  416 skew    0 clock  37.86KHz
        v: height  240 start  244 end  246 total  260           clock  72.81Hz
  320x240 (0xc0) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  360 total  420 skew    0 clock  37.50KHz
        v: height  240 start  240 end  242 total  250           clock  75.00Hz
  320x240 (0xc1) 12.587MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  376 total  400 skew    0 clock  31.47KHz
        v: height  240 start  245 end  246 total  262           clock  60.05Hz
  360x202 (0xc2) 11.250MHz -HSync +VSync DoubleScan
        h: width   360 start  372 end  404 total  448 skew    0 clock  25.11KHz
        v: height  202 start  204 end  206 total  211           clock  59.51Hz
  360x202 (0xc3) 10.875MHz +HSync -VSync DoubleScan
        h: width   360 start  384 end  400 total  440 skew    0 clock  24.72KHz
        v: height  202 start  204 end  206 total  209           clock  59.13Hz
  320x180 (0xc4)  9.000MHz -HSync +VSync DoubleScan
        h: width   320 start  332 end  360 total  400 skew    0 clock  22.50KHz
        v: height  180 start  181 end  184 total  188           clock  59.84Hz
  320x180 (0xc5)  8.875MHz +HSync -VSync DoubleScan
        h: width   320 start  344 end  360 total  400 skew    0 clock  22.19KHz
        v: height  180 start  181 end  184 total  187           clock  59.32Hz
HDMI-1-2 connected (normal left inverted right x axis y axis)
Identifier: 0xf9
Timestamp:  483290
Subpixel:   unknown
Clones:
CRTCs:      4 5
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
EDID:
00ffffffffffff0020a32f0001000000
0c1a0103807341780acf74a3574cb023
09484c21080081c08140818001010101
01010101010104740030f2705a80b058
8a00501d7400001e023a801871382d40
582c4500501d7400001e000000fc0048
4953454e53450a2020202020000000fd
00184b0f511e000a202020202020017f
02034571525f5e5d0102040510111314
1f202122626364290907071507505506
0083010000e200f9e305ff016e030c00
1000383c20008001020304e50e60616a
6be3060d01011d8018711c1620582c25
00c48e2100009e011d80d0721c162010
2c2580c48e2100009e023a80d072382d
40102c4580c48e2100001e00000000d5
PRIME Synchronization: 1
supported: 0, 1
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 61
supported: 61
non-desktop: 0
range: (0, 1)
  1920x1080 (0xfc) 266.500MHz +HSync -VSync DoubleScan
        h: width  1920 start 1944 end 1960 total 2000 skew    0 clock 133.25KHz
        v: height 1080 start 1081 end 1084 total 1111           clock  59.97Hz
  1920x1080 (0x48) 173.000MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz
  1920x1080 (0x47) 148.500MHz +HSync +VSync
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
  1920x1080 (0xfd) 148.500MHz +HSync +VSync
        h: width  1920 start 2448 end 2492 total 2640 skew    0 clock  56.25KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  50.00Hz
  1920x1080 (0xfe) 148.352MHz +HSync +VSync
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.43KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  59.94Hz
  1920x1080 (0x49) 138.500MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock  66.59KHz
        v: height 1080 start 1083 end 1088 total 1111           clock  59.93Hz
  1920x1080i (0xff) 74.250MHz +HSync +VSync Interlace
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  33.75KHz
        v: height 1080 start 1084 end 1094 total 1125           clock  60.00Hz
  1920x1080i (0x100) 74.250MHz +HSync +VSync Interlace
        h: width  1920 start 2448 end 2492 total 2640 skew    0 clock  28.12KHz
        v: height 1080 start 1084 end 1094 total 1125           clock  50.00Hz
  1920x1080 (0x101) 74.250MHz +HSync +VSync
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  33.75KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  30.00Hz
  1920x1080 (0x102) 74.250MHz +HSync +VSync
        h: width  1920 start 2448 end 2492 total 2640 skew    0 clock  28.12KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  25.00Hz
  1920x1080 (0x103) 74.250MHz +HSync +VSync
        h: width  1920 start 2558 end 2602 total 2750 skew    0 clock  27.00KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  24.00Hz
  1920x1080i (0x104) 74.176MHz +HSync +VSync Interlace
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  33.72KHz
        v: height 1080 start 1084 end 1094 total 1125           clock  59.94Hz
  1920x1080 (0x105) 74.176MHz +HSync +VSync
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  33.72KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  29.97Hz
  1920x1080 (0x106) 74.176MHz +HSync +VSync
        h: width  1920 start 2558 end 2602 total 2750 skew    0 clock  26.97KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  23.98Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz
  1680x1050 (0x4c) 119.000MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1600x1024 (0x4d) 103.125MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock  61.97KHz
        v: height 1024 start 1024 end 1029 total 1030           clock  60.17Hz
  1400x1050 (0x50) 122.000MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock  64.89KHz
        v: height 1050 start 1052 end 1064 total 1082           clock  59.98Hz
  1600x900 (0x107) 246.000MHz -HSync +VSync DoubleScan
        h: width  1600 start 1728 end 1900 total 2200 skew    0 clock 111.82KHz
        v: height  900 start  901 end  904 total  932           clock  59.99Hz
  1600x900 (0x108) 186.500MHz +HSync -VSync DoubleScan
        h: width  1600 start 1624 end 1640 total 1680 skew    0 clock 111.01KHz
        v: height  900 start  901 end  904 total  926           clock  59.94Hz
  1600x900 (0x51) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock  55.99KHz
        v: height  900 start  903 end  908 total  934           clock  59.95Hz
  1600x900 (0x53) 97.500MHz +HSync -VSync
        h: width  1600 start 1648 end 1680 total 1760 skew    0 clock  55.40KHz
        v: height  900 start  903 end  908 total  926           clock  59.82Hz
  1280x1024 (0x55) 108.000MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1440x900 (0x56) 106.500MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock  55.93KHz
        v: height  900 start  903 end  909 total  934           clock  59.89Hz
  1400x900 (0x57) 103.500MHz -HSync +VSync
        h: width  1400 start 1480 end 1624 total 1848 skew    0 clock  56.01KHz
        v: height  900 start  903 end  913 total  934           clock  59.96Hz
  1400x900 (0x58) 86.500MHz +HSync -VSync
        h: width  1400 start 1448 end 1480 total 1560 skew    0 clock  55.45KHz
        v: height  900 start  903 end  913 total  926           clock  59.88Hz
  1280x960 (0x59) 108.000MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1440x810 (0x109) 198.125MHz -HSync +VSync DoubleScan
        h: width  1440 start 1548 end 1704 total 1968 skew    0 clock 100.67KHz
        v: height  810 start  811 end  814 total  839           clock  60.00Hz
  1440x810 (0x5a) 151.875MHz +HSync -VSync DoubleScan
        h: width  1440 start 1464 end 1480 total 1520 skew    0 clock  99.92KHz
        v: height  810 start  811 end  814 total  833           clock  59.97Hz
  1368x768 (0x5b) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock  47.79KHz
        v: height  768 start  771 end  781 total  798           clock  59.88Hz
  1368x768 (0x5c) 72.250MHz +HSync -VSync
        h: width  1368 start 1416 end 1448 total 1528 skew    0 clock  47.28KHz
        v: height  768 start  771 end  781 total  790           clock  59.85Hz
  1360x768 (0x5d) 84.750MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock  47.72KHz
        v: height  768 start  771 end  781 total  798           clock  59.80Hz
  1360x768 (0x5e) 72.000MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock  47.37KHz
        v: height  768 start  771 end  781 total  790           clock  59.96Hz
  1280x800 (0x5f) 174.250MHz -HSync +VSync DoubleScan
        h: width  1280 start 1380 end 1516 total 1752 skew    0 clock  99.46KHz
        v: height  800 start  801 end  804 total  829           clock  59.99Hz
  1280x800 (0x60) 134.250MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  98.71KHz
        v: height  800 start  801 end  804 total  823           clock  59.97Hz
  1280x800 (0x61) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz
        v: height  800 start  803 end  809 total  831           clock  59.81Hz
  1280x800 (0x62) 71.000MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
        v: height  800 start  803 end  809 total  823           clock  59.91Hz
  1152x864 (0x66) 81.620MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz
        v: height  864 start  865 end  868 total  895           clock  60.00Hz
  1280x720 (0x67) 156.125MHz -HSync +VSync DoubleScan
        h: width  1280 start 1376 end 1512 total 1744 skew    0 clock  89.52KHz
        v: height  720 start  721 end  724 total  746           clock  60.00Hz
  1280x720 (0x68) 120.750MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  88.79KHz
        v: height  720 start  721 end  724 total  740           clock  59.99Hz
  1280x720 (0x69) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock  44.77KHz
        v: height  720 start  723 end  728 total  748           clock  59.86Hz
  1280x720 (0x6a) 74.250MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
        v: height  720 start  725 end  730 total  750           clock  60.00Hz
  1280x720 (0x10a) 74.250MHz +HSync +VSync
        h: width  1280 start 1720 end 1760 total 1980 skew    0 clock  37.50KHz
        v: height  720 start  725 end  730 total  750           clock  50.00Hz
  1280x720 (0x10b) 74.176MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  44.96KHz
        v: height  720 start  725 end  730 total  750           clock  59.94Hz
  1280x720 (0x6b) 63.750MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  44.27KHz
        v: height  720 start  723 end  728 total  741           clock  59.74Hz
  1024x768 (0x6e) 133.475MHz -HSync +VSync DoubleScan
        h: width  1024 start 1100 end 1212 total 1400 skew    0 clock  95.34KHz
        v: height  768 start  768 end  770 total  794           clock  60.04Hz
  1024x768 (0x71) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  960x720 (0x73) 117.000MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1128 total 1300 skew    0 clock  90.00KHz
        v: height  720 start  720 end  722 total  750           clock  60.00Hz
  928x696 (0x75) 109.150MHz -HSync +VSync DoubleScan
        h: width   928 start  976 end 1088 total 1264 skew    0 clock  86.35KHz
        v: height  696 start  696 end  698 total  719           clock  60.05Hz
  896x672 (0x77) 102.400MHz -HSync +VSync DoubleScan
        h: width   896 start  960 end 1060 total 1224 skew    0 clock  83.66KHz
        v: height  672 start  672 end  674 total  697           clock  60.01Hz
  1024x576 (0x78) 98.500MHz -HSync +VSync DoubleScan
        h: width  1024 start 1092 end 1200 total 1376 skew    0 clock  71.58KHz
        v: height  576 start  577 end  580 total  597           clock  59.95Hz
  1024x576 (0x79) 78.375MHz +HSync -VSync DoubleScan
        h: width  1024 start 1048 end 1064 total 1104 skew    0 clock  70.99KHz
        v: height  576 start  577 end  580 total  592           clock  59.96Hz
  1024x576 (0x7a) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock  35.88KHz
        v: height  576 start  579 end  584 total  599           clock  59.90Hz
  1024x576 (0x7b) 42.000MHz +HSync -VSync
        h: width  1024 start 1072 end 1104 total 1184 skew    0 clock  35.47KHz
        v: height  576 start  579 end  584 total  593           clock  59.82Hz
  960x600 (0x7c) 96.625MHz -HSync +VSync DoubleScan
        h: width   960 start 1028 end 1128 total 1296 skew    0 clock  74.56KHz
        v: height  600 start  601 end  604 total  622           clock  59.93Hz
  960x600 (0x7d) 77.000MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  74.04KHz
        v: height  600 start  601 end  604 total  617           clock  60.00Hz
  960x540 (0x7f) 86.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1124 total 1288 skew    0 clock  67.16KHz
        v: height  540 start  541 end  544 total  560           clock  59.96Hz
  960x540 (0x80) 69.250MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  66.59KHz
        v: height  540 start  541 end  544 total  555           clock  59.99Hz
  960x540 (0x81) 40.750MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock  33.51KHz
        v: height  540 start  543 end  548 total  562           clock  59.63Hz
  960x540 (0x82) 37.250MHz +HSync -VSync
        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz
  800x600 (0x86) 81.000MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  75.00KHz
        v: height  600 start  600 end  602 total  625           clock  60.00Hz
  800x600 (0x89) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x8a) 36.000MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  840x525 (0x8d) 73.125MHz -HSync +VSync DoubleScan
        h: width   840 start  892 end  980 total 1120 skew    0 clock  65.29KHz
        v: height  525 start  526 end  529 total  544           clock  60.01Hz
  840x525 (0x8e) 59.500MHz +HSync -VSync DoubleScan
        h: width   840 start  864 end  880 total  920 skew    0 clock  64.67KHz
        v: height  525 start  526 end  529 total  540           clock  59.88Hz
  864x486 (0x8f) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock  30.32KHz
        v: height  486 start  489 end  494 total  506           clock  59.92Hz
  864x486 (0x90) 30.500MHz +HSync -VSync
        h: width   864 start  912 end  944 total 1024 skew    0 clock  29.79KHz
        v: height  486 start  489 end  494 total  500           clock  59.57Hz
  720x576 (0x10c) 27.000MHz -HSync -VSync
        h: width   720 start  732 end  796 total  864 skew    0 clock  31.25KHz
        v: height  576 start  581 end  586 total  625           clock  50.00Hz
  800x512 (0x91) 51.562MHz +HSync +VSync DoubleScan
        h: width   800 start  800 end  828 total  832 skew    0 clock  61.97KHz
        v: height  512 start  512 end  514 total  515           clock  60.17Hz
  700x525 (0x94) 61.000MHz +HSync +VSync DoubleScan
        h: width   700 start  744 end  820 total  940 skew    0 clock  64.89KHz
        v: height  525 start  526 end  532 total  541           clock  59.98Hz
  800x450 (0x95) 59.125MHz -HSync +VSync DoubleScan
        h: width   800 start  848 end  928 total 1056 skew    0 clock  55.99KHz
        v: height  450 start  451 end  454 total  467           clock  59.95Hz
  800x450 (0x96) 48.750MHz +HSync -VSync DoubleScan
        h: width   800 start  824 end  840 total  880 skew    0 clock  55.40KHz
        v: height  450 start  451 end  454 total  463           clock  59.82Hz
  720x480 (0x10d) 27.027MHz -HSync -VSync
        h: width   720 start  736 end  798 total  858 skew    0 clock  31.50KHz
        v: height  480 start  489 end  495 total  525           clock  60.00Hz
  720x480 (0x10e) 27.000MHz -HSync -VSync
        h: width   720 start  736 end  798 total  858 skew    0 clock  31.47KHz
        v: height  480 start  489 end  495 total  525           clock  59.94Hz
  640x512 (0x98) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  664 end  720 total  844 skew    0 clock  63.98KHz
        v: height  512 start  512 end  514 total  533           clock  60.02Hz
  720x450 (0x99) 53.250MHz -HSync +VSync DoubleScan
        h: width   720 start  760 end  836 total  952 skew    0 clock  55.93KHz
        v: height  450 start  451 end  454 total  467           clock  59.89Hz
  700x450 (0x9a) 51.750MHz -HSync +VSync DoubleScan
        h: width   700 start  740 end  812 total  924 skew    0 clock  56.01KHz
        v: height  450 start  451 end  456 total  467           clock  59.96Hz
  700x450 (0x9b) 43.250MHz +HSync -VSync DoubleScan
        h: width   700 start  724 end  740 total  780 skew    0 clock  55.45KHz
        v: height  450 start  451 end  456 total  463           clock  59.88Hz
  640x480 (0x9c) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  688 end  744 total  900 skew    0 clock  60.00KHz
        v: height  480 start  480 end  482 total  500           clock  60.00Hz
  640x480 (0x10f) 25.200MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.50KHz
        v: height  480 start  490 end  492 total  525           clock  60.00Hz
  640x480 (0x9f) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz
  720x405 (0xa0) 22.500MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock  25.11KHz
        v: height  405 start  408 end  413 total  422           clock  59.51Hz
  720x405 (0xa1) 21.750MHz +HSync -VSync
        h: width   720 start  768 end  800 total  880 skew    0 clock  24.72KHz
        v: height  405 start  408 end  413 total  419           clock  58.99Hz
  684x384 (0xa3) 42.625MHz -HSync +VSync DoubleScan
        h: width   684 start  720 end  788 total  892 skew    0 clock  47.79KHz
        v: height  384 start  385 end  390 total  399           clock  59.88Hz
  684x384 (0xa4) 36.125MHz +HSync -VSync DoubleScan
        h: width   684 start  708 end  724 total  764 skew    0 clock  47.28KHz
        v: height  384 start  385 end  390 total  395           clock  59.85Hz
  680x384 (0xa5) 42.375MHz -HSync +VSync DoubleScan
        h: width   680 start  716 end  784 total  888 skew    0 clock  47.72KHz
        v: height  384 start  385 end  390 total  399           clock  59.80Hz
  680x384 (0xa6) 36.000MHz +HSync -VSync DoubleScan
        h: width   680 start  704 end  720 total  760 skew    0 clock  47.37KHz
        v: height  384 start  385 end  390 total  395           clock  59.96Hz
  640x400 (0xa7) 41.750MHz -HSync +VSync DoubleScan
        h: width   640 start  676 end  740 total  840 skew    0 clock  49.70KHz
        v: height  400 start  401 end  404 total  415           clock  59.88Hz
  640x400 (0xa8) 35.500MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  49.31KHz
        v: height  400 start  401 end  404 total  411           clock  59.98Hz
  576x432 (0xac) 40.810MHz -HSync +VSync DoubleScan
        h: width   576 start  608 end  668 total  760 skew    0 clock  53.70KHz
        v: height  432 start  432 end  434 total  447           clock  60.06Hz
  640x360 (0xad) 37.250MHz -HSync +VSync DoubleScan
        h: width   640 start  672 end  736 total  832 skew    0 clock  44.77KHz
        v: height  360 start  361 end  364 total  374           clock  59.86Hz
  640x360 (0xae) 31.875MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  44.27KHz
        v: height  360 start  361 end  364 total  370           clock  59.83Hz
  640x360 (0xaf) 18.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock  22.50KHz
        v: height  360 start  363 end  368 total  376           clock  59.84Hz
  640x360 (0xb0) 17.750MHz +HSync -VSync
        h: width   640 start  688 end  720 total  800 skew    0 clock  22.19KHz
        v: height  360 start  363 end  368 total  374           clock  59.32Hz
  512x384 (0xb3) 32.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  672 skew    0 clock  48.36KHz
        v: height  384 start  385 end  388 total  403           clock  60.00Hz
  512x288 (0xb4) 23.250MHz -HSync +VSync DoubleScan
        h: width   512 start  532 end  580 total  648 skew    0 clock  35.88KHz
        v: height  288 start  289 end  292 total  299           clock  60.00Hz
  512x288 (0xb5) 21.000MHz +HSync -VSync DoubleScan
        h: width   512 start  536 end  552 total  592 skew    0 clock  35.47KHz
        v: height  288 start  289 end  292 total  296           clock  59.92Hz
  480x270 (0xb7) 20.375MHz -HSync +VSync DoubleScan
        h: width   480 start  496 end  544 total  608 skew    0 clock  33.51KHz
        v: height  270 start  271 end  274 total  281           clock  59.63Hz
  480x270 (0xb8) 18.625MHz +HSync -VSync DoubleScan
        h: width   480 start  504 end  520 total  560 skew    0 clock  33.26KHz
        v: height  270 start  271 end  274 total  278           clock  59.82Hz
  400x300 (0xbb) 20.000MHz +HSync +VSync DoubleScan
        h: width   400 start  420 end  484 total  528 skew    0 clock  37.88KHz
        v: height  300 start  300 end  302 total  314           clock  60.32Hz
  400x300 (0xbc) 18.000MHz +HSync +VSync DoubleScan
        h: width   400 start  412 end  448 total  512 skew    0 clock  35.16KHz
        v: height  300 start  300 end  301 total  312           clock  56.34Hz
  432x243 (0xbd) 16.250MHz -HSync +VSync DoubleScan
        h: width   432 start  444 end  484 total  536 skew    0 clock  30.32KHz
        v: height  243 start  244 end  247 total  253           clock  59.92Hz
  432x243 (0xbe) 15.250MHz +HSync -VSync DoubleScan
        h: width   432 start  456 end  472 total  512 skew    0 clock  29.79KHz
        v: height  243 start  244 end  247 total  250           clock  59.57Hz
  320x240 (0xc1) 12.587MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  376 total  400 skew    0 clock  31.47KHz
        v: height  240 start  245 end  246 total  262           clock  60.05Hz
  360x202 (0xc2) 11.250MHz -HSync +VSync DoubleScan
        h: width   360 start  372 end  404 total  448 skew    0 clock  25.11KHz
        v: height  202 start  204 end  206 total  211           clock  59.51Hz
  360x202 (0xc3) 10.875MHz +HSync -VSync DoubleScan
        h: width   360 start  384 end  400 total  440 skew    0 clock  24.72KHz
        v: height  202 start  204 end  206 total  209           clock  59.13Hz
  320x180 (0xc4)  9.000MHz -HSync +VSync DoubleScan
        h: width   320 start  332 end  360 total  400 skew    0 clock  22.50KHz
        v: height  180 start  181 end  184 total  188           clock  59.84Hz
  320x180 (0xc5)  8.875MHz +HSync -VSync DoubleScan
        h: width   320 start  344 end  360 total  400 skew    0 clock  22.19KHz
        v: height  180 start  181 end  184 total  187           clock  59.32Hz
  3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
        h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
        v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
  3840x2160R (0x70c) 533.000MHz +HSync -VSync
        h: width  3840 start 3888 end 3920 total 4000 skew    0 clock 133.25KHz
        v: height 2160 start 2163 end 2168 total 2222           clock  59.97Hz
DP-1-2 disconnected (normal left inverted right x axis y axis)
Identifier: 0xfa
Timestamp:  483290
Subpixel:   unknown
Clones:
CRTCs:      4 5
Transform:  1.000000 0.000000 0.000000
            0.000000 1.000000 0.000000
            0.000000 0.000000 1.000000
           filter:
PRIME Synchronization: 1
supported: 0, 1
dithering depth: auto
supported: auto, 6 bpc, 8 bpc
dithering mode: auto
supported: auto, off, static 2x2, dynamic 2x2
scaling mode: None
supported: None, Full, Center, Full aspect
color vibrance: 150
range: (0, 200)
vibrant hue: 90
range: (0, 180)
underscan vborder: 0
range: (0, 128)
underscan hborder: 0
range: (0, 128)
underscan: off
supported: auto, off, on
link-status: Good
supported: Good, Bad
CONNECTOR_ID: 63
supported: 63
non-desktop: 0
range: (0, 1)
  1920x1080 (0x47) 148.500MHz +HSync +VSync
        h: width  1920 start 2008 end 2052 total 2200 skew    0 clock  67.50KHz
        v: height 1080 start 1084 end 1089 total 1125           clock  60.00Hz
  1920x1080 (0x48) 173.000MHz -HSync +VSync
        h: width  1920 start 2048 end 2248 total 2576 skew    0 clock  67.16KHz
        v: height 1080 start 1083 end 1088 total 1120           clock  59.96Hz
  1920x1080 (0x49) 138.500MHz +HSync -VSync
        h: width  1920 start 1968 end 2000 total 2080 skew    0 clock  66.59KHz
        v: height 1080 start 1083 end 1088 total 1111           clock  59.93Hz
  1680x1050 (0x4a) 174.000MHz -HSync +VSync
        h: width  1680 start 1800 end 1976 total 2272 skew    0 clock  76.58KHz
        v: height 1050 start 1053 end 1059 total 1096           clock  69.88Hz
  1680x1050 (0x4b) 146.250MHz -HSync +VSync
        h: width  1680 start 1784 end 1960 total 2240 skew    0 clock  65.29KHz
        v: height 1050 start 1053 end 1059 total 1089           clock  59.95Hz
  1680x1050 (0x4c) 119.000MHz +HSync -VSync
        h: width  1680 start 1728 end 1760 total 1840 skew    0 clock  64.67KHz
        v: height 1050 start 1053 end 1059 total 1080           clock  59.88Hz
  1600x1024 (0x4d) 103.125MHz +HSync +VSync
        h: width  1600 start 1600 end 1656 total 1664 skew    0 clock  61.97KHz
        v: height 1024 start 1024 end 1029 total 1030           clock  60.17Hz
  1400x1050 (0x4e) 155.800MHz +HSync +VSync
        h: width  1400 start 1464 end 1784 total 1912 skew    0 clock  81.49KHz
        v: height 1050 start 1052 end 1064 total 1090           clock  74.76Hz
  1400x1050 (0x4f) 145.060MHz -HSync +VSync
        h: width  1400 start 1496 end 1648 total 1896 skew    0 clock  76.51KHz
        v: height 1050 start 1051 end 1054 total 1093           clock  70.00Hz
  1400x1050 (0x50) 122.000MHz +HSync +VSync
        h: width  1400 start 1488 end 1640 total 1880 skew    0 clock  64.89KHz
        v: height 1050 start 1052 end 1064 total 1082           clock  59.98Hz
  1600x900 (0x51) 118.250MHz -HSync +VSync
        h: width  1600 start 1696 end 1856 total 2112 skew    0 clock  55.99KHz
        v: height  900 start  903 end  908 total  934           clock  59.95Hz
  1600x900 (0x52) 108.000MHz +HSync +VSync
        h: width  1600 start 1624 end 1704 total 1800 skew    0 clock  60.00KHz
        v: height  900 start  901 end  904 total 1000           clock  60.00Hz
  1600x900 (0x53) 97.500MHz +HSync -VSync
        h: width  1600 start 1648 end 1680 total 1760 skew    0 clock  55.40KHz
        v: height  900 start  903 end  908 total  926           clock  59.82Hz
  1280x1024 (0x54) 135.000MHz +HSync +VSync
        h: width  1280 start 1296 end 1440 total 1688 skew    0 clock  79.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  75.02Hz
  1280x1024 (0x55) 108.000MHz +HSync +VSync
        h: width  1280 start 1328 end 1440 total 1688 skew    0 clock  63.98KHz
        v: height 1024 start 1025 end 1028 total 1066           clock  60.02Hz
  1440x900 (0x56) 106.500MHz -HSync +VSync
        h: width  1440 start 1520 end 1672 total 1904 skew    0 clock  55.93KHz
        v: height  900 start  903 end  909 total  934           clock  59.89Hz
  1400x900 (0x57) 103.500MHz -HSync +VSync
        h: width  1400 start 1480 end 1624 total 1848 skew    0 clock  56.01KHz
        v: height  900 start  903 end  913 total  934           clock  59.96Hz
  1400x900 (0x58) 86.500MHz +HSync -VSync
        h: width  1400 start 1448 end 1480 total 1560 skew    0 clock  55.45KHz
        v: height  900 start  903 end  913 total  926           clock  59.88Hz
  1280x960 (0x59) 108.000MHz +HSync +VSync
        h: width  1280 start 1376 end 1488 total 1800 skew    0 clock  60.00KHz
        v: height  960 start  961 end  964 total 1000           clock  60.00Hz
  1440x810 (0x5a) 151.875MHz +HSync -VSync DoubleScan
        h: width  1440 start 1464 end 1480 total 1520 skew    0 clock  99.92KHz
        v: height  810 start  811 end  814 total  833           clock  59.97Hz
  1368x768 (0x5b) 85.250MHz -HSync +VSync
        h: width  1368 start 1440 end 1576 total 1784 skew    0 clock  47.79KHz
        v: height  768 start  771 end  781 total  798           clock  59.88Hz
  1368x768 (0x5c) 72.250MHz +HSync -VSync
        h: width  1368 start 1416 end 1448 total 1528 skew    0 clock  47.28KHz
        v: height  768 start  771 end  781 total  790           clock  59.85Hz
  1360x768 (0x5d) 84.750MHz -HSync +VSync
        h: width  1360 start 1432 end 1568 total 1776 skew    0 clock  47.72KHz
        v: height  768 start  771 end  781 total  798           clock  59.80Hz
  1360x768 (0x5e) 72.000MHz +HSync -VSync
        h: width  1360 start 1408 end 1440 total 1520 skew    0 clock  47.37KHz
        v: height  768 start  771 end  781 total  790           clock  59.96Hz
  1280x800 (0x5f) 174.250MHz -HSync +VSync DoubleScan
        h: width  1280 start 1380 end 1516 total 1752 skew    0 clock  99.46KHz
        v: height  800 start  801 end  804 total  829           clock  59.99Hz
  1280x800 (0x60) 134.250MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  98.71KHz
        v: height  800 start  801 end  804 total  823           clock  59.97Hz
  1280x800 (0x61) 83.500MHz -HSync +VSync
        h: width  1280 start 1352 end 1480 total 1680 skew    0 clock  49.70KHz
        v: height  800 start  803 end  809 total  831           clock  59.81Hz
  1280x800 (0x62) 71.000MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  49.31KHz
        v: height  800 start  803 end  809 total  823           clock  59.91Hz
  1152x864 (0x63) 108.000MHz +HSync +VSync
        h: width  1152 start 1216 end 1344 total 1600 skew    0 clock  67.50KHz
        v: height  864 start  865 end  868 total  900           clock  75.00Hz
  1152x864 (0x64) 104.990MHz -HSync +VSync
        h: width  1152 start 1224 end 1352 total 1552 skew    0 clock  67.65KHz
        v: height  864 start  865 end  868 total  902           clock  75.00Hz
  1152x864 (0x65) 96.770MHz -HSync +VSync
        h: width  1152 start 1224 end 1344 total 1536 skew    0 clock  63.00KHz
        v: height  864 start  865 end  868 total  900           clock  70.00Hz
  1152x864 (0x66) 81.620MHz -HSync +VSync
        h: width  1152 start 1216 end 1336 total 1520 skew    0 clock  53.70KHz
        v: height  864 start  865 end  868 total  895           clock  60.00Hz
  1280x720 (0x67) 156.125MHz -HSync +VSync DoubleScan
        h: width  1280 start 1376 end 1512 total 1744 skew    0 clock  89.52KHz
        v: height  720 start  721 end  724 total  746           clock  60.00Hz
  1280x720 (0x68) 120.750MHz +HSync -VSync DoubleScan
        h: width  1280 start 1304 end 1320 total 1360 skew    0 clock  88.79KHz
        v: height  720 start  721 end  724 total  740           clock  59.99Hz
  1280x720 (0x69) 74.500MHz -HSync +VSync
        h: width  1280 start 1344 end 1472 total 1664 skew    0 clock  44.77KHz
        v: height  720 start  723 end  728 total  748           clock  59.86Hz
  1280x720 (0x6a) 74.250MHz +HSync +VSync
        h: width  1280 start 1390 end 1430 total 1650 skew    0 clock  45.00KHz
        v: height  720 start  725 end  730 total  750           clock  60.00Hz
  1280x720 (0x6b) 63.750MHz +HSync -VSync
        h: width  1280 start 1328 end 1360 total 1440 skew    0 clock  44.27KHz
        v: height  720 start  723 end  728 total  741           clock  59.74Hz
  1152x720 (0x6c) 67.282MHz -HSync +VSync
        h: width  1152 start 1208 end 1328 total 1504 skew    0 clock  44.74KHz
        v: height  720 start  721 end  724 total  746           clock  59.97Hz
  1024x768 (0x6d) 170.240MHz -HSync +VSync DoubleScan
        h: width  1024 start 1108 end 1220 total 1416 skew    0 clock 120.23KHz
        v: height  768 start  768 end  770 total  801           clock  75.05Hz
  1024x768 (0x6e) 133.475MHz -HSync +VSync DoubleScan
        h: width  1024 start 1100 end 1212 total 1400 skew    0 clock  95.34KHz
        v: height  768 start  768 end  770 total  794           clock  60.04Hz
  1024x768 (0x6f) 78.750MHz +HSync +VSync
        h: width  1024 start 1040 end 1136 total 1312 skew    0 clock  60.02KHz
        v: height  768 start  769 end  772 total  800           clock  75.03Hz
  1024x768 (0x70) 75.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1328 skew    0 clock  56.48KHz
        v: height  768 start  771 end  777 total  806           clock  70.07Hz
  1024x768 (0x71) 65.000MHz -HSync -VSync
        h: width  1024 start 1048 end 1184 total 1344 skew    0 clock  48.36KHz
        v: height  768 start  771 end  777 total  806           clock  60.00Hz
  960x720 (0x72) 148.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1032 end 1144 total 1320 skew    0 clock 112.50KHz
        v: height  720 start  720 end  722 total  750           clock  75.00Hz
  960x720 (0x73) 117.000MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1128 total 1300 skew    0 clock  90.00KHz
        v: height  720 start  720 end  722 total  750           clock  60.00Hz
  928x696 (0x74) 144.000MHz -HSync +VSync DoubleScan
        h: width   928 start  992 end 1104 total 1280 skew    0 clock 112.50KHz
        v: height  696 start  696 end  698 total  750           clock  75.00Hz
  928x696 (0x75) 109.150MHz -HSync +VSync DoubleScan
        h: width   928 start  976 end 1088 total 1264 skew    0 clock  86.35KHz
        v: height  696 start  696 end  698 total  719           clock  60.05Hz
  896x672 (0x76) 130.500MHz -HSync +VSync DoubleScan
        h: width   896 start  944 end 1052 total 1228 skew    0 clock 106.27KHz
        v: height  672 start  672 end  674 total  708           clock  75.05Hz
  896x672 (0x77) 102.400MHz -HSync +VSync DoubleScan
        h: width   896 start  960 end 1060 total 1224 skew    0 clock  83.66KHz
        v: height  672 start  672 end  674 total  697           clock  60.01Hz
  1024x576 (0x78) 98.500MHz -HSync +VSync DoubleScan
        h: width  1024 start 1092 end 1200 total 1376 skew    0 clock  71.58KHz
        v: height  576 start  577 end  580 total  597           clock  59.95Hz
  1024x576 (0x79) 78.375MHz +HSync -VSync DoubleScan
        h: width  1024 start 1048 end 1064 total 1104 skew    0 clock  70.99KHz
        v: height  576 start  577 end  580 total  592           clock  59.96Hz
  1024x576 (0x7a) 46.500MHz -HSync +VSync
        h: width  1024 start 1064 end 1160 total 1296 skew    0 clock  35.88KHz
        v: height  576 start  579 end  584 total  599           clock  59.90Hz
  1024x576 (0x7b) 42.000MHz +HSync -VSync
        h: width  1024 start 1072 end 1104 total 1184 skew    0 clock  35.47KHz
        v: height  576 start  579 end  584 total  593           clock  59.82Hz
  960x600 (0x7c) 96.625MHz -HSync +VSync DoubleScan
        h: width   960 start 1028 end 1128 total 1296 skew    0 clock  74.56KHz
        v: height  600 start  601 end  604 total  622           clock  59.93Hz
  960x600 (0x7d) 77.000MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  74.04KHz
        v: height  600 start  601 end  604 total  617           clock  60.00Hz
  832x624 (0x7e) 57.284MHz -HSync -VSync
        h: width   832 start  864 end  928 total 1152 skew    0 clock  49.73KHz
        v: height  624 start  625 end  628 total  667           clock  74.55Hz
  960x540 (0x7f) 86.500MHz -HSync +VSync DoubleScan
        h: width   960 start 1024 end 1124 total 1288 skew    0 clock  67.16KHz
        v: height  540 start  541 end  544 total  560           clock  59.96Hz
  960x540 (0x80) 69.250MHz +HSync -VSync DoubleScan
        h: width   960 start  984 end 1000 total 1040 skew    0 clock  66.59KHz
        v: height  540 start  541 end  544 total  555           clock  59.99Hz
  960x540 (0x81) 40.750MHz -HSync +VSync
        h: width   960 start  992 end 1088 total 1216 skew    0 clock  33.51KHz
        v: height  540 start  543 end  548 total  562           clock  59.63Hz
  960x540 (0x82) 37.250MHz +HSync -VSync
        h: width   960 start 1008 end 1040 total 1120 skew    0 clock  33.26KHz
        v: height  540 start  543 end  548 total  556           clock  59.82Hz
  800x600 (0x83) 101.250MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  93.75KHz
        v: height  600 start  600 end  602 total  625           clock  75.00Hz
  800x600 (0x84) 94.500MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  87.50KHz
        v: height  600 start  600 end  602 total  625           clock  70.00Hz
  800x600 (0x85) 87.750MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  81.25KHz
        v: height  600 start  600 end  602 total  625           clock  65.00Hz
  800x600 (0x86) 81.000MHz +HSync +VSync DoubleScan
        h: width   800 start  832 end  928 total 1080 skew    0 clock  75.00KHz
        v: height  600 start  600 end  602 total  625           clock  60.00Hz
  800x600 (0x87) 50.000MHz +HSync +VSync
        h: width   800 start  856 end  976 total 1040 skew    0 clock  48.08KHz
        v: height  600 start  637 end  643 total  666           clock  72.19Hz
  800x600 (0x88) 49.500MHz +HSync +VSync
        h: width   800 start  816 end  896 total 1056 skew    0 clock  46.88KHz
        v: height  600 start  601 end  604 total  625           clock  75.00Hz
  800x600 (0x89) 40.000MHz +HSync +VSync
        h: width   800 start  840 end  968 total 1056 skew    0 clock  37.88KHz
        v: height  600 start  601 end  605 total  628           clock  60.32Hz
  800x600 (0x8a) 36.000MHz +HSync +VSync
        h: width   800 start  824 end  896 total 1024 skew    0 clock  35.16KHz
        v: height  600 start  601 end  603 total  625           clock  56.25Hz
  840x525 (0x8b) 93.500MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  82.31KHz
        v: height  525 start  526 end  529 total  549           clock  74.96Hz
  840x525 (0x8c) 87.000MHz -HSync +VSync DoubleScan
        h: width   840 start  900 end  988 total 1136 skew    0 clock  76.58KHz
        v: height  525 start  526 end  529 total  548           clock  69.88Hz
  840x525 (0x8d) 73.125MHz -HSync +VSync DoubleScan
        h: width   840 start  892 end  980 total 1120 skew    0 clock  65.29KHz
        v: height  525 start  526 end  529 total  544           clock  60.01Hz
  840x525 (0x8e) 59.500MHz +HSync -VSync DoubleScan
        h: width   840 start  864 end  880 total  920 skew    0 clock  64.67KHz
        v: height  525 start  526 end  529 total  540           clock  59.88Hz
  864x486 (0x8f) 32.500MHz -HSync +VSync
        h: width   864 start  888 end  968 total 1072 skew    0 clock  30.32KHz
        v: height  486 start  489 end  494 total  506           clock  59.92Hz
  864x486 (0x90) 30.500MHz +HSync -VSync
        h: width   864 start  912 end  944 total 1024 skew    0 clock  29.79KHz
        v: height  486 start  489 end  494 total  500           clock  59.57Hz
  800x512 (0x91) 51.562MHz +HSync +VSync DoubleScan
        h: width   800 start  800 end  828 total  832 skew    0 clock  61.97KHz
        v: height  512 start  512 end  514 total  515           clock  60.17Hz
  700x525 (0x92) 77.900MHz +HSync +VSync DoubleScan
        h: width   700 start  732 end  892 total  956 skew    0 clock  81.49KHz
        v: height  525 start  526 end  532 total  545           clock  74.76Hz
  700x525 (0x93) 72.530MHz -HSync +VSync DoubleScan
        h: width   700 start  748 end  824 total  948 skew    0 clock  76.51KHz
        v: height  525 start  525 end  527 total  546           clock  70.06Hz
  700x525 (0x94) 61.000MHz +HSync +VSync DoubleScan
        h: width   700 start  744 end  820 total  940 skew    0 clock  64.89KHz
        v: height  525 start  526 end  532 total  541           clock  59.98Hz
  800x450 (0x95) 59.125MHz -HSync +VSync DoubleScan
        h: width   800 start  848 end  928 total 1056 skew    0 clock  55.99KHz
        v: height  450 start  451 end  454 total  467           clock  59.95Hz
  800x450 (0x96) 48.750MHz +HSync -VSync DoubleScan
        h: width   800 start  824 end  840 total  880 skew    0 clock  55.40KHz
        v: height  450 start  451 end  454 total  463           clock  59.82Hz
  640x512 (0x97) 67.500MHz +HSync +VSync DoubleScan
        h: width   640 start  648 end  720 total  844 skew    0 clock  79.98KHz
        v: height  512 start  512 end  514 total  533           clock  75.02Hz
  640x512 (0x98) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  664 end  720 total  844 skew    0 clock  63.98KHz
        v: height  512 start  512 end  514 total  533           clock  60.02Hz
  720x450 (0x99) 53.250MHz -HSync +VSync DoubleScan
        h: width   720 start  760 end  836 total  952 skew    0 clock  55.93KHz
        v: height  450 start  451 end  454 total  467           clock  59.89Hz
  700x450 (0x9a) 51.750MHz -HSync +VSync DoubleScan
        h: width   700 start  740 end  812 total  924 skew    0 clock  56.01KHz
        v: height  450 start  451 end  456 total  467           clock  59.96Hz
  700x450 (0x9b) 43.250MHz +HSync -VSync DoubleScan
        h: width   700 start  724 end  740 total  780 skew    0 clock  55.45KHz
        v: height  450 start  451 end  456 total  463           clock  59.88Hz
  640x480 (0x9c) 54.000MHz +HSync +VSync DoubleScan
        h: width   640 start  688 end  744 total  900 skew    0 clock  60.00KHz
        v: height  480 start  480 end  482 total  500           clock  60.00Hz
  640x480 (0x9d) 31.500MHz -HSync -VSync
        h: width   640 start  656 end  720 total  840 skew    0 clock  37.50KHz
        v: height  480 start  481 end  484 total  500           clock  75.00Hz
  640x480 (0x9e) 31.500MHz -HSync -VSync
        h: width   640 start  664 end  704 total  832 skew    0 clock  37.86KHz
        v: height  480 start  489 end  492 total  520           clock  72.81Hz
  640x480 (0x9f) 25.175MHz -HSync -VSync
        h: width   640 start  656 end  752 total  800 skew    0 clock  31.47KHz
        v: height  480 start  490 end  492 total  525           clock  59.94Hz
  720x405 (0xa0) 22.500MHz -HSync +VSync
        h: width   720 start  744 end  808 total  896 skew    0 clock  25.11KHz
        v: height  405 start  408 end  413 total  422           clock  59.51Hz
  720x405 (0xa1) 21.750MHz +HSync -VSync
        h: width   720 start  768 end  800 total  880 skew    0 clock  24.72KHz
        v: height  405 start  408 end  413 total  419           clock  58.99Hz
  720x400 (0xa2) 28.320MHz -HSync +VSync
        h: width   720 start  738 end  846 total  900 skew    0 clock  31.47KHz
        v: height  400 start  412 end  414 total  449           clock  70.08Hz
  684x384 (0xa3) 42.625MHz -HSync +VSync DoubleScan
        h: width   684 start  720 end  788 total  892 skew    0 clock  47.79KHz
        v: height  384 start  385 end  390 total  399           clock  59.88Hz
  684x384 (0xa4) 36.125MHz +HSync -VSync DoubleScan
        h: width   684 start  708 end  724 total  764 skew    0 clock  47.28KHz
        v: height  384 start  385 end  390 total  395           clock  59.85Hz
  680x384 (0xa5) 42.375MHz -HSync +VSync DoubleScan
        h: width   680 start  716 end  784 total  888 skew    0 clock  47.72KHz
        v: height  384 start  385 end  390 total  399           clock  59.80Hz
  680x384 (0xa6) 36.000MHz +HSync -VSync DoubleScan
        h: width   680 start  704 end  720 total  760 skew    0 clock  47.37KHz
        v: height  384 start  385 end  390 total  395           clock  59.96Hz
  640x400 (0xa7) 41.750MHz -HSync +VSync DoubleScan
        h: width   640 start  676 end  740 total  840 skew    0 clock  49.70KHz
        v: height  400 start  401 end  404 total  415           clock  59.88Hz
  640x400 (0xa8) 35.500MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  49.31KHz
        v: height  400 start  401 end  404 total  411           clock  59.98Hz
  576x432 (0xa9) 54.000MHz +HSync +VSync DoubleScan
        h: width   576 start  608 end  672 total  800 skew    0 clock  67.50KHz
        v: height  432 start  432 end  434 total  450           clock  75.00Hz
  576x432 (0xaa) 52.495MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  676 total  776 skew    0 clock  67.65KHz
        v: height  432 start  432 end  434 total  451           clock  75.00Hz
  576x432 (0xab) 48.385MHz -HSync +VSync DoubleScan
        h: width   576 start  612 end  672 total  768 skew    0 clock  63.00KHz
        v: height  432 start  432 end  434 total  450           clock  70.00Hz
  576x432 (0xac) 40.810MHz -HSync +VSync DoubleScan
        h: width   576 start  608 end  668 total  760 skew    0 clock  53.70KHz
        v: height  432 start  432 end  434 total  447           clock  60.06Hz
  640x360 (0xad) 37.250MHz -HSync +VSync DoubleScan
        h: width   640 start  672 end  736 total  832 skew    0 clock  44.77KHz
        v: height  360 start  361 end  364 total  374           clock  59.86Hz
  640x360 (0xae) 31.875MHz +HSync -VSync DoubleScan
        h: width   640 start  664 end  680 total  720 skew    0 clock  44.27KHz
        v: height  360 start  361 end  364 total  370           clock  59.83Hz
  640x360 (0xaf) 18.000MHz -HSync +VSync
        h: width   640 start  664 end  720 total  800 skew    0 clock  22.50KHz
        v: height  360 start  363 end  368 total  376           clock  59.84Hz
  640x360 (0xb0) 17.750MHz +HSync -VSync
        h: width   640 start  688 end  720 total  800 skew    0 clock  22.19KHz
        v: height  360 start  363 end  368 total  374           clock  59.32Hz
  512x384 (0xb1) 39.375MHz +HSync +VSync DoubleScan
        h: width   512 start  520 end  568 total  656 skew    0 clock  60.02KHz
        v: height  384 start  384 end  386 total  400           clock  75.03Hz
  512x384 (0xb2) 37.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  664 skew    0 clock  56.48KHz
        v: height  384 start  385 end  388 total  403           clock  70.07Hz
  512x384 (0xb3) 32.500MHz -HSync -VSync DoubleScan
        h: width   512 start  524 end  592 total  672 skew    0 clock  48.36KHz
        v: height  384 start  385 end  388 total  403           clock  60.00Hz
  512x288 (0xb4) 23.250MHz -HSync +VSync DoubleScan
        h: width   512 start  532 end  580 total  648 skew    0 clock  35.88KHz
        v: height  288 start  289 end  292 total  299           clock  60.00Hz
  512x288 (0xb5) 21.000MHz +HSync -VSync DoubleScan
        h: width   512 start  536 end  552 total  592 skew    0 clock  35.47KHz
        v: height  288 start  289 end  292 total  296           clock  59.92Hz
  416x312 (0xb6) 28.642MHz -HSync -VSync DoubleScan
        h: width   416 start  432 end  464 total  576 skew    0 clock  49.73KHz
        v: height  312 start  312 end  314 total  333           clock  74.66Hz
  480x270 (0xb7) 20.375MHz -HSync +VSync DoubleScan
        h: width   480 start  496 end  544 total  608 skew    0 clock  33.51KHz
        v: height  270 start  271 end  274 total  281           clock  59.63Hz
  480x270 (0xb8) 18.625MHz +HSync -VSync DoubleScan
        h: width   480 start  504 end  520 total  560 skew    0 clock  33.26KHz
        v: height  270 start  271 end  274 total  278           clock  59.82Hz
  400x300 (0xb9) 25.000MHz +HSync +VSync DoubleScan
        h: width   400 start  428 end  488 total  520 skew    0 clock  48.08KHz
        v: height  300 start  318 end  321 total  333           clock  72.19Hz
  400x300 (0xba) 24.750MHz +HSync +VSync DoubleScan
        h: width   400 start  408 end  448 total  528 skew    0 clock  46.88KHz
        v: height  300 start  300 end  302 total  312           clock  75.12Hz
  400x300 (0xbb) 20.000MHz +HSync +VSync DoubleScan
        h: width   400 start  420 end  484 total  528 skew    0 clock  37.88KHz
        v: height  300 start  300 end  302 total  314           clock  60.32Hz
  400x300 (0xbc) 18.000MHz +HSync +VSync DoubleScan
        h: width   400 start  412 end  448 total  512 skew    0 clock  35.16KHz
        v: height  300 start  300 end  301 total  312           clock  56.34Hz
  432x243 (0xbd) 16.250MHz -HSync +VSync DoubleScan
        h: width   432 start  444 end  484 total  536 skew    0 clock  30.32KHz
        v: height  243 start  244 end  247 total  253           clock  59.92Hz
  432x243 (0xbe) 15.250MHz +HSync -VSync DoubleScan
        h: width   432 start  456 end  472 total  512 skew    0 clock  29.79KHz
        v: height  243 start  244 end  247 total  250           clock  59.57Hz
  320x240 (0xbf) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  332 end  352 total  416 skew    0 clock  37.86KHz
        v: height  240 start  244 end  246 total  260           clock  72.81Hz
  320x240 (0xc0) 15.750MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  360 total  420 skew    0 clock  37.50KHz
        v: height  240 start  240 end  242 total  250           clock  75.00Hz
  320x240 (0xc1) 12.587MHz -HSync -VSync DoubleScan
        h: width   320 start  328 end  376 total  400 skew    0 clock  31.47KHz
        v: height  240 start  245 end  246 total  262           clock  60.05Hz
  360x202 (0xc2) 11.250MHz -HSync +VSync DoubleScan
        h: width   360 start  372 end  404 total  448 skew    0 clock  25.11KHz
        v: height  202 start  204 end  206 total  211           clock  59.51Hz
  360x202 (0xc3) 10.875MHz +HSync -VSync DoubleScan
        h: width   360 start  384 end  400 total  440 skew    0 clock  24.72KHz
        v: height  202 start  204 end  206 total  209           clock  59.13Hz
  320x180 (0xc4)  9.000MHz -HSync +VSync DoubleScan
        h: width   320 start  332 end  360 total  400 skew    0 clock  22.50KHz
        v: height  180 start  181 end  184 total  188           clock  59.84Hz
  320x180 (0xc5)  8.875MHz +HSync -VSync DoubleScan
        h: width   320 start  344 end  360 total  400 skew    0 clock  22.19KHz
        v: height  180 start  181 end  184 total  187           clock  59.32Hz
  3840x2160_60.00 (0x6ce) 712.750MHz -HSync +VSync
        h: width  3840 start 4160 end 4576 total 5312 skew    0 clock 134.18KHz
        v: height 2160 start 2163 end 2168 total 2237           clock  59.98Hz
  3840x2160R (0x70c) 533.000MHz +HSync -VSync
        h: width  3840 start 3888 end 3920 total 4000 skew    0 clock 133.25KHz
        v: height 2160 start 2163 end 2168 total 2222           clock  59.97Hz
$
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
