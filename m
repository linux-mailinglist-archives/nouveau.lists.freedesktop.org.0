Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6412013AE6A
	for <lists+nouveau@lfdr.de>; Tue, 14 Jan 2020 17:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66696E426;
	Tue, 14 Jan 2020 16:08:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8936E426
 for <nouveau@lists.freedesktop.org>; Tue, 14 Jan 2020 16:08:34 +0000 (UTC)
Received: by mail-vk1-f177.google.com with SMTP id i4so3774683vkc.3
 for <nouveau@lists.freedesktop.org>; Tue, 14 Jan 2020 08:08:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FgqfsK+QyRU9HYyRa8pGYnweSAm3bnsY6cU8VGFXAZQ=;
 b=flwYOmaDZ1qMGmTp4EcYe5A2Oz9DDbpyiK2qQsfhQQy/k/r4IoiYaDsNvGwk50QGaR
 MfaJcCEIFk3hd8kZaV4sxnL3h13E3Nle3eA+7/GTW6jboFPJqt+ndFd/p3KlFmKMxkmT
 asm3g+kWBZCLjm+Cv9i+owRcDBr5TpL6UqNSTdh6zusvUtmhXTrR7P9BZgHf9fMGjURk
 UxKGniUKMmatQn77pfkl6v3s4aboafGliZvHHcr6a98o+VWeISUfk7Bttl8erog39JzH
 S68s9Y0ERHuotuRZmLx/Ij2X/n6jJc3C3BKZRPFy1V/mLr3Oi5vIxPpYAqgmgQDCWuhb
 aQEg==
X-Gm-Message-State: APjAAAVPO8AZIMwa6HGdv42C9P3mX4EHEIeyTbTjkRH9ye7mY+sRNWgm
 4QQDBwWvKqk9po2dE33JUGLEY0qiLbZ/CUM+c1k=
X-Google-Smtp-Source: APXvYqyjWheo+sJmdZwKYcxaSAKhJKNfOJvQYgZ0SpdH7i7WBJT33tRZ4MlgpDo5SmNRu0HOB0rYv8R+0mzx0DLKkp4=
X-Received: by 2002:a1f:5385:: with SMTP id h127mr11135577vkb.56.1579018113173; 
 Tue, 14 Jan 2020 08:08:33 -0800 (PST)
MIME-Version: 1.0
References: <18822946.zTA3u1jjGg@hosanna> <3275761.aAKvXfyuvj@hosanna>
In-Reply-To: <3275761.aAKvXfyuvj@hosanna>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 14 Jan 2020 11:08:20 -0500
Message-ID: <CAKb7Uvijz2hopSSrD7h28uxgMY1YGPXbf9H+hCKb-Lk27N_SXA@mail.gmail.com>
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

Hi Joshua,

Not a fix for your issue, but Ben noticed this (and fixed it):

https://github.com/skeggsb/nouveau/commit/024bda7d2b0c3b0731433d60a494c78ab58cb216

which is what causes us to even try 540MB/s link training. However
with this fix applied, it'll just give up faster. I'm told eDP is
generally a single lane, and you're trying to get more than 270MB/s.
So ... the question is ... why is it trying to do 10bpc. One likely
reason is that the display_info.bpc == 0 for some reason (and we,
rather questionably, default to 10bpc for bandwidth determination).
There's no concrete theory as to what that reason might be, but it
would explain what's going on.

After resuming into a bad state, can you grab the contents of
/sys/class/drm/card0-eDP-1/edid (you'll have to cat it or something)?
My hope is that it's somehow messed up.

Also, can you add "drm.debug=0x1e" to the boot cmd line, in addition
to the bits you have already? Should provide some more info, perhaps
some of it will even be relevant.

Thanks,

  -ilia

On Mon, Jan 13, 2020 at 6:48 PM Joshua J. Kugler <joshua@azariah.com> wrote:
>
> I've added debugging command-line parameters to the kernel command line, per
> skeggsb and imirkin on #nouveau.
>
> root@joyful:~# cat /proc/cmdline
> BOOT_IMAGE=/vmlinuz-5.3.0-26-generic root=/dev/mapper/vgubuntu-root ro quiet
> splash log_buf_len=8M nouveau.debug=disp=trace,bios=trace,i2c=trace 3
>
> On this particular run, closing the lid and then opening got me back to the
> console, but then I tried running
>
> echo mem > /sys/power/state
>
> and it did not recover from that. That is, the laptop is awake, I can ssh in,
> screen back-light is on; black screen.
>
> j
>
>
> On Sunday, January 12, 2020 2:02:00 PM AKST Joshua J. Kugler wrote:
> > Howdy! I've been doing a lot of troubleshooting, and haven't arrived at a
> > solution yet.
> >
> > Kernel log attached. VBIOS also attached.
> > Ubuntu 19.10
> >
> > $ uname -a
> > Linux joyful 5.3.0-26-generic #28-Ubuntu SMP Wed Dec 18 05:37:46 UTC 2019
> > x86_64 x86_64 x86_64 GNU/Linux
> > $ dpkg -l|grep nouveau
> > ii  libdrm-nouveau2:amd64                      2.4.99-1ubuntu1
> > amd64        Userspace interface to nouveau-specific kernel DRM services --
> > runtime
> > ii  xserver-xorg-video-nouveau                 1:1.0.16-1
> > amd64        X.Org X server -- Nouveau display driver
> > $ lspci |grep VGA
> > 01:00.0 VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M]
> > (rev a2)
> >
> > This is a Dell Latitude E6510, so not exactly bleeding edge. :)
> >
> > The system boots just fine, and I can use the laptop without issue. Goes to
> > sleep just fine. When I resume from sleep, the display is black, and will
> > not come to life (the back light is on, though).  I can ssh in, and run all
> > kinds of commands; restart the display manager does *not* bring it back to
> > life.
> >
> > Any tips would be greatly appreciated.
> >
> > j
>
>
> --
> Joshua J. Kugler - Fairbanks, Alaska - joshua@azariah.com
> Azariah Enterprises - Programming and Website Design
> PGP Key: http://pgp.mit.edu/  ID 0x68108cbb73b13b6a_______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
