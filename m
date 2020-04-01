Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A779B19A319
	for <lists+nouveau@lfdr.de>; Wed,  1 Apr 2020 02:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A346E8B4;
	Wed,  1 Apr 2020 00:55:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C756E8B4
 for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2020 00:55:33 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id x206so14830374vsx.5
 for <nouveau@lists.freedesktop.org>; Tue, 31 Mar 2020 17:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H4Bb9of1Vk6cu0T0S9HoCuOiU+X3niwtYGVbqHn0s1M=;
 b=QoS7f1N+U2JvJ8BqM3e5Y/SFmDFmdwfdZJVmSeZyMTunz+JAaKqAsK5Ft9Ea1IC61t
 +Z2jm6v2vRYHHGJQjVS1d4XTrNc6ldRFG5z7L96IRqLSsmqXwq3avMfxyzIShMM1Bhyp
 IygJtnPevaoZSjf6l+fzmwXXFQjnkkog56JrLf7uWRG2oPRvJKKaT8Oktnl2SpIP1wVm
 KMRkca2A8bvXELNyLn8HGg8ZDfRbeIWrN44UF7kQLqBmrCpfY7qHR/atk3qXLJJ4RRlT
 HRBWTq15KFSAr877uauknzqg8j5gBuWdOxULQNMlfSCqqjtGVbacQ/Kn2AN7WKnotOHa
 UxUw==
X-Gm-Message-State: AGi0PuZkLK8ppu2ogTDqvIcdsOqmuURHy3KtCz4VR6rnZQbxsYlB4TGA
 X0TpUdR7L5iCDly9PuP8WdAlrFE5P0pDLW6Ag3KHloXAJXU=
X-Google-Smtp-Source: APiQypKlKxWOk/enf/Rs7rovpIjrNg6Ct4jYhsbvvvuu6gRNXUfeBPtnDC7cLXb2y4U6lttVqq07BidJOpjYXNxlRQw=
X-Received: by 2002:a67:1942:: with SMTP id 63mr11611575vsz.37.1585702532297; 
 Tue, 31 Mar 2020 17:55:32 -0700 (PDT)
MIME-Version: 1.0
References: <18822946.zTA3u1jjGg@hosanna> <1579051245.qf4Q62zFPI@hosanna>
 <1724765.ZV22uHRcT5@hosanna> <1867521.yYtKkQ1SVJ@hosanna>
In-Reply-To: <1867521.yYtKkQ1SVJ@hosanna>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 31 Mar 2020 20:55:21 -0400
Message-ID: <CAKb7Uvhrx5cHTbCNx59Xfxy_+P++YBNHxOJZHp-WtbxRGJVUjA@mail.gmail.com>
To: "Joshua J. Kugler" <joshua@azariah.com>
Subject: Re: [Nouveau] Display broken after resume from suspend
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

Sorry, haven't really looked since our initial interaction. That EDID
decodes as:

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.0
  Vendor & Product Identification:
    Manufacturer: SEC
    Model: 21569
    Made in: 2010
  Basic Display Parameters & Features:
    Digital display
    Maximum image size: 34 cm x 19 cm
    Gamma: 2.20
    RGB color display
    First detailed timing is preferred timing
  Color Characteristics:
    Red  : 0.6201, 0.3398
    Green: 0.3300, 0.5703
    Blue : 0.1503, 0.0595
    White: 0.3134, 0.3291
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1366x768    60.003 Hz 683:384  47.402 kHz  75.180 MHz (344
mm x 194 mm)
                 Hfront   48 Hsync  32 Hback 140 Hpol P
                 Vfront    2 Vsync   5 Vback  15 Vpol N
    DTD 2:  1366x768    39.999 Hz 683:384  31.599 kHz  48.220 MHz (344
mm x 194 mm)
                 Hfront   48 Hsync  32 Hback  80 Hpol P
                 Vfront    2 Vsync   5 Vback  15 Vpol N
    Alphanumeric Data String: 'T892T'
    Manufacturer-Specified Display Descriptor (0x00): 00 00 00 00 41
01 19 00 00 00 00 09 01 0a 20 20 '....A.........  '
Checksum: 0x4

----------------

edid-decode SHA: 9bdf55523f83072f5c056953f1fbc9fcf09d9496

Warnings:

Block 0, Base EDID:
  EDID Structure Version & Revision: EDID 1.0 is deprecated, do not use.

Failures:

Block 0, Base EDID:
  Basic Display Parameters & Features: Digital Video Interface
Standard set to reserved value 0x15.
  Display Descriptor #3: Has descriptor blocks other than detailed timings.
  Alphanumeric Data String: Non-printable character.
  Display Descriptor #4: Has descriptor blocks other than detailed timings.



and in your logs you have

[  289.906506] nouveau 0000:01:00.0: disp: outp 00:0006:0344: data
281925 KB/s link 0 KB/s mst 0->0
[  289.906511] nouveau 0000:01:00.0: disp: outp 00:0006:0344: link
requirements changed

Where completely coincidentally,

75180 * 30 / 8 = 281925

So it's clearly wanting 10bpc. And based on my reading of the logic in
drm_edid.c, your display_info.bpc with that edid would == 0. However
in nouveau_connector_detect_depth() we would then force it to 6. And
in nv50_mstc_get_modes it'd become 8. So this is still a bit unclear
to me.

If you're up to it, do some tracing, try to figure out why it's
deciding to do 10bpc.

Cheers,

  -ilia

On Tue, Mar 31, 2020 at 8:37 PM Joshua J. Kugler <joshua@azariah.com> wrote:
>
> Just curious if any of the recent fixes have addressed this. :)
>
> j
>
> On Tuesday, January 14, 2020 1:05:28 PM AKDT Joshua J. Kugler wrote:
> > Another log, per Lyude on #nouveau.
> >
> > j
> >
> > On Tuesday, January 14, 2020 8:52:51 AM AKST Joshua J. Kugler wrote:
> > > Here we go!
> > >
> > > j
> > >
> > > On Tuesday, January 14, 2020 7:08:20 AM AKST Ilia Mirkin wrote:
> > > > Hi Joshua,
> > > >
> > > > Not a fix for your issue, but Ben noticed this (and fixed it):
> > > >
> > > > https://github.com/skeggsb/nouveau/commit/024bda7d2b0c3b0731433d60a494c7
> > > > 8a
> > > > b5 8cb216
> > > >
> > > > which is what causes us to even try 540MB/s link training. However
> > > > with this fix applied, it'll just give up faster. I'm told eDP is
> > > > generally a single lane, and you're trying to get more than 270MB/s.
> > > > So ... the question is ... why is it trying to do 10bpc. One likely
> > > > reason is that the display_info.bpc == 0 for some reason (and we,
> > > > rather questionably, default to 10bpc for bandwidth determination).
> > > > There's no concrete theory as to what that reason might be, but it
> > > > would explain what's going on.
> > > >
> > > > After resuming into a bad state, can you grab the contents of
> > > > /sys/class/drm/card0-eDP-1/edid (you'll have to cat it or something)?
> > > > My hope is that it's somehow messed up.
> > > >
> > > > Also, can you add "drm.debug=0x1e" to the boot cmd line, in addition
> > > > to the bits you have already? Should provide some more info, perhaps
> > > > some of it will even be relevant.
> > > >
> > > > Thanks,
> > > >
> > > >   -ilia
> > > >
> > > > On Mon, Jan 13, 2020 at 6:48 PM Joshua J. Kugler <joshua@azariah.com>
> >
> > wrote:
> > > > > I've added debugging command-line parameters to the kernel command
> > > > > line,
> > > > > per skeggsb and imirkin on #nouveau.
> > > > >
> > > > > root@joyful:~# cat /proc/cmdline
> > > > > BOOT_IMAGE=/vmlinuz-5.3.0-26-generic root=/dev/mapper/vgubuntu-root ro
> > > > > quiet splash log_buf_len=8M
> > > > > nouveau.debug=disp=trace,bios=trace,i2c=trace
> > > > > 3
> > > > >
> > > > > On this particular run, closing the lid and then opening got me back
> > > > > to
> > > > > the
> > > > > console, but then I tried running
> > > > >
> > > > > echo mem > /sys/power/state
> > > > >
> > > > > and it did not recover from that. That is, the laptop is awake, I can
> > > > > ssh
> > > > > in, screen back-light is on; black screen.
> > > > >
> > > > > j
> > > > >
> > > > > On Sunday, January 12, 2020 2:02:00 PM AKST Joshua J. Kugler wrote:
> > > > > > Howdy! I've been doing a lot of troubleshooting, and haven't arrived
> > > > > > at
> > > > > > a
> > > > > > solution yet.
> > > > > >
> > > > > > Kernel log attached. VBIOS also attached.
> > > > > > Ubuntu 19.10
> > > > > >
> > > > > > $ uname -a
> > > > > > Linux joyful 5.3.0-26-generic #28-Ubuntu SMP Wed Dec 18 05:37:46 UTC
> > > > > > 2019
> > > > > > x86_64 x86_64 x86_64 GNU/Linux
> > > > > > $ dpkg -l|grep nouveau
> > > > > > ii  libdrm-nouveau2:amd64                      2.4.99-1ubuntu1
> > > > > > amd64        Userspace interface to nouveau-specific kernel DRM
> > > > > > services
> > > > > > --
> > > > > > runtime
> > > > > > ii  xserver-xorg-video-nouveau                 1:1.0.16-1
> > > > > > amd64        X.Org X server -- Nouveau display driver
> > > > > > $ lspci |grep VGA
> > > > > > 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS
> > > > > > 3100M]
> > > > > > (rev a2)
> > > > > >
> > > > > > This is a Dell Latitude E6510, so not exactly bleeding edge. :)
> > > > > >
> > > > > > The system boots just fine, and I can use the laptop without issue.
> > > > > > Goes
> > > > > > to
> > > > > > sleep just fine. When I resume from sleep, the display is black, and
> > > > > > will
> > > > > > not come to life (the back light is on, though).  I can ssh in, and
> > > > > > run
> > > > > > all
> > > > > > kinds of commands; restart the display manager does *not* bring it
> > > > > > back
> > > > > > to
> > > > > > life.
> > > > > >
> > > > > > Any tips would be greatly appreciated.
> > > > > >
> > > > > > j
> > > > >
> > > > > --
> > > > > Joshua J. Kugler - Fairbanks, Alaska - joshua@azariah.com
> > > > > Azariah Enterprises - Programming and Website Design
> > > > > PGP Key: http://pgp.mit.edu/  ID
> > > > > 0x68108cbb73b13b6a_______________________________________________
> > > > > Nouveau
> > > > > mailing list
> > > > > Nouveau@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
> --
> Joshua J. Kugler - Fairbanks, Alaska - joshua@azariah.com
> Azariah Enterprises - Programming and Website Design
> PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
