Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C63E215056
	for <lists+nouveau@lfdr.de>; Mon,  6 Jul 2020 01:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725BB6E217;
	Sun,  5 Jul 2020 23:17:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FE16E217
 for <nouveau@lists.freedesktop.org>; Sun,  5 Jul 2020 23:17:33 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id h190so8168213vkh.6
 for <nouveau@lists.freedesktop.org>; Sun, 05 Jul 2020 16:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oCRXe+/LScuqyHmBDaWvthMTmOIzAovCFjTBVg0kU5Q=;
 b=jSG9/evzoG/wsXEairkGWj0tb7Vn32MAOfuO0w3NUoXWlj+R3m9PXP3xhvOPmOESip
 0v0e7JrV1r+PogMCG7C6UHEqlGWhAsP2zqA8K+bqEW3BeuJ8FbSYskcWlKyPgxyyMyBR
 ddgWxkl4x9GgW48kxj31bdEK61UpDtoq1A25UNwYk1nGgYu9pXKnq7X01VgO4UjjcLC3
 qOlq+JvNaHt4ddXb4OB9IaKyfcXF+7gFqjzwINY+K4j3zdyXalVw3RymghVw1pR0Huo7
 r4IDJtwj5yLMZOIdkk85pnmGWXdRm9YNORDcQQAdm42wEUNJMENx9sJA5XJnO/b1sBOa
 Odqg==
X-Gm-Message-State: AOAM5316zTxfPFFkykTlE/yuYRsJOEflQP3sbFsP+6a0vlYRRL6y5MQL
 R6YtN0qtCVcfPr6vCUUNnQpJMcr8wK9xDFaxCpGDrrrtu6A=
X-Google-Smtp-Source: ABdhPJzpznhvyz3UlLCGbZQFWzdwTe+MhOF5EAP9F31tAghwCR8JjaBtTtPI/NAmFGdqIgOeJKSuc+egcehPGTl0Lp4=
X-Received: by 2002:a1f:9e8a:: with SMTP id h132mr33311445vke.14.1593991052391; 
 Sun, 05 Jul 2020 16:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAKb7UvjHqAtH4+R70VbpE-dXe3y0=ZWdvRdWpQC1m-gK=NxoDw@mail.gmail.com>
 <f4f3a042-78a3-46d9-b452-bb1d251a7391@email.android.com>
 <CAKb7Uvi5=H3pNO4eKT37jsN8+KUS6a7dLKOpYsOwkc44pVc6Xg@mail.gmail.com>
 <1a21e9f1-4ba8-51f2-045b-13bbcbfc13d5@michaelkloos.com>
In-Reply-To: <1a21e9f1-4ba8-51f2-045b-13bbcbfc13d5@michaelkloos.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 5 Jul 2020 19:17:21 -0400
Message-ID: <CAKb7UvjshMUGwLP0bBsgNcvEjN_oV0rGrHYu1pLFavzCk=pb9A@mail.gmail.com>
To: "Michael T. Kloos" <michael@michaelkloos.com>
Subject: Re: [Nouveau] Framebuffer double buffering (via FBIOPAN_DISPLAY)
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

Check fb_pan_display in drivers/video/fbdev/core/fbmem.c for the
argument validation of the FBIOPAN_DISPLAY ioctl.

CONFIG_FB_NVIDIA is a dedicated fbdev driver, not compatible with
nouveau (it takes over the relevant PCI device). It also won't support
your Pascal GPU, I believe -- I think it MIGHT support the Tesla
generation (i.e. G80..GT21x) but definitely not anything newer. Most
likely it supports pre-G80 GPUs, and again, not compatible with
nouveau.

DRM-based drivers use the DRM <-> FBDEV emulation layer to provide an
fbdev interface for legacy applications. The fbdev emulation acts as
sort of a regular DRM client and exposes the FBDEV API.

The overallocation logic was added to this emulation layer in commit
5f15257689bfa, which is included in v4.12 and later kernels.

Hope this helps,

  -ilia

On Sun, Jul 5, 2020 at 7:02 PM Michael T. Kloos
<michael@michaelkloos.com> wrote:
>
> Well...it's been a bit of a mixed bag.  Setting
> drm_kms_helper.drm_fbdev_overalloc=200 set the vinfo.yres_virtual to
> 2160 as opposed to 1080 (My monitor vertical resolution)  This fixed the
> mmap() problem.  However, it only worked on my main workstation.  My
> laptop running Intel graphics wasn't affected by the change in kernel
> cmdline.  My workstation is a custom build from a few years ago with a
> GTX 1060 6GB, running Gentoo(Kernel version: 5.4) machine, and my laptop
> running Manjaro.  I also can not get the IOCTL FBIOPAN_DISPLAY to work.
> It is now giving me an invalid argument error.  I have set vinfo.xoffset
> and vinfo.yoffset to 0 earlier in my program to try to eliminate them as
> variables.
>
> Other factors that may be at play:
>
> -I am trying to run this from an alternate TTY.  I have a graphical
> environment on TTY7 with x.org.  I think it is using the DRM interface.
> Maybe there is a conflict.
> -Maybe I am missing a driver in my Gentoo kernel config?  I'm still
> learning about it, but going into my workstation's kernel config, I
> noticed that CONFIG_FB_NVIDIA was set to "n".
>
> Do you know when CONFIG_DRM_FBDEV_OVERALLOC went into the kernel?  I was
> about to try this on my MacBook Pro running Gentoo, but I will have to
> recompile upgrade the kernel before I can give a report (It is currently
> running: 4.9).  I couldn't find it in menuconfig so I doubt the cmdline
> would make a difference.
>
> I really appreciate the help.  I've been looking header files and a such
> trying to cobble together some information to figure this out.  I hate
> to bother you with this because it seems slightly off topic.
>
> On 7/5/20 3:45 PM, Ilia Mirkin wrote:
> > Try booting with drm_kms_helper.drm_fbdev_overalloc=200 and see if it
> > works with that. (There's also CONFIG_DRM_FBDEV_OVERALLOC which sets
> > the default.)
> >
> > Cheers,
> >
> >    -ilia
> >
> > On Sun, Jul 5, 2020 at 3:41 PM <michael@michaelkloos.com> wrote:
> >> I am not familiar with that setting, but I have really struggled to find documentation on dealing with the framebuffer.  Referring to this guide, "http://betteros.org/tut/graphics1.php#doublebuffer", I attempted to set the mmap allocation size to double, but it caused the mmap to fail.  I no longer believe that it is a driver issue, though, because I just tried it again on a dell laptop with Intel HD Graphics 4400 to the same failure.
> >>
> >> On Jul 5, 2020 12:35, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >>
> >> Are you setting the overallocation to 200?
> >>
> >> On Sun, Jul 5, 2020 at 3:41 AM Michael T. Kloos
> >> <michael@michaelkloos.com> wrote:
> >>> Does NOUVEAU support mmaping a double-sized Framebuffer?
> >>> When attempting to run, where fd refers to "/dev/fb0":
> >>>
> >>> mmap(ptr, screensize * 2, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> >>>
> >>> I get back an invalid argument error.  This doesn't happen if I only
> >>> request a single screensize.  Is this a limitation of the driver?
> >>>
> >>> _______________________________________________
> >>> Nouveau mailing list
> >>> Nouveau@lists.freedesktop.org
> >>> https://lists.freedesktop.org/mailman/listinfo/nouveau
> >>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
