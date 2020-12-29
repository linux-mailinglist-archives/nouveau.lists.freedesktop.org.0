Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D142D2E7251
	for <lists+nouveau@lfdr.de>; Tue, 29 Dec 2020 17:33:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012AE89327;
	Tue, 29 Dec 2020 16:33:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB0089327
 for <nouveau@lists.freedesktop.org>; Tue, 29 Dec 2020 16:33:29 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id u7so7283773vsg.11
 for <nouveau@lists.freedesktop.org>; Tue, 29 Dec 2020 08:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c90Yfkzxi2l1NqUDIqbf6Cne1PXUWdz6gZSsPnQW+zE=;
 b=PAdUcVpsa4AbZcZDka3qNN9jctXmgqH6QWvVrZF9hOIf0IrqP+GcZWmZJLIVVdc05b
 1FuLg7RomzTeLXqMVwanRlTpnM9YZd/jH89AFLV838qcg3Xt4O5xmmnR2GIErzr+OgTU
 +HUaI83ruwz1MMTaxxZWomFSSuU8OsM9ASRzcpIUJZhA8EG8OGOPYTiegC0b+JGn11P5
 rNQ/JV2YEzvblovbPeHasfzltrj9wXt709RVV7IFYnJeQDa3JvGTvZW7YP2RhkJKtkkx
 EvkLnpg41kOUF8U7W4jBg/TRlXo4b/JcAmmYFSy103MHiCrVi0ZHixRLA5x7PAWAo2Iz
 +jzw==
X-Gm-Message-State: AOAM530E8vqB8UzuEytUL1M/K8MYTIeZV3t6Q1ro6TUWBhFF0PVvknvw
 1iYr0tVoWf/0kSg2Y7NB98L936VG237wKC6n5As=
X-Google-Smtp-Source: ABdhPJygiqPIW+1oU9rzWZsuwzhAAFBJgTgpCzgGaBDBFFck84jgtUQzsqb8Me3je1qgZXUHrXaTToqlp41gvtkN0Lc=
X-Received: by 2002:a67:ca84:: with SMTP id a4mr33047893vsl.2.1609259608233;
 Tue, 29 Dec 2020 08:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
In-Reply-To: <20201229155159.GG23389@merlins.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 29 Dec 2020 11:33:16 -0500
Message-ID: <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
To: Marc MERLIN <marc_nouveau@merlins.org>
Subject: Re: [Nouveau] 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Dec 29, 2020 at 10:52 AM Marc MERLIN <marc_nouveau@merlins.org> wrote:
>
> On Sat, Dec 26, 2020 at 03:12:09AM -0800, Ilia Mirkin wrote:
> > > after boot, when it gets the right trigger (not sure which ones), it
> > > loops on this evern 2 seconds, mostly forever.
> >
> > The gpu suspends with runtime pm. And then gets woken up for some
> > reason (could be something quite silly, like lspci, or could be
> > something explicitly checking connectors, etc). Repeat.
>
> Ah, fair point.  Could it be powertop even?
> How would I go towards tracing that?
> Sounds like this would be a problem with all chips if userspace is able
> to wake them up every second or two with a probe. Now I wonder what
> broken userspace I have that could be doing this.

Well, it's a theory. Some userspace helpfully prevents the GPU from
suspending entirely, unfortunately I don't remember its name though by
messing with the attached audio device. It's very common and meant to
help... oh well.

>
> > Display offload usually requires acceleration -- the copies are done
> > using the DMA engine. Please make sure that you have firmware
> > available (and a new enough mesa). The errors suggest that you don't
> > have firmware available at the time that nouveau loads. Depending on
> > your setup, that might mean the firmware has to be built into the
> > kernel, or available in initramfs. (Or just regular filesystem if you
> > don't use a complicated boot sequence. But many people go with distro
> > defaults, which do have this complexity.)
>
> Hi Ilia, thanks for your answer.
>
> Do you think that could be a reason why the boot would hang for 2 full minutes at every
> boot ever since I upgraded to 5.5?

I'd have to check, but I'm guessing TU104 acceleration became a thing
in 5.5. I would also not be very surprised if the code didn't handle
failure extremely gracefully - there definitely have been problems
with that in the past.

>
> Also, without wanting to sound like a full newbie, where is that
> firmware you're talking about? In my kernel source?
>
> Here's what I do have:
> sauron:/usr/local/bin# dpkggrep nouveau
> libdrm-nouveau2:amd64                           install
> xserver-xorg-video-nouveau                      install
>
> no nouveau-firmware package in debian:
> sauron:/usr/local/bin# apt-cache search nouveau
> bumblebee - NVIDIA Optimus support for Linux
> libdrm-nouveau2 - Userspace interface to nouveau-specific kernel DRM services -- runtime
> xfonts-jmk - Jim Knoble's character-cell fonts for X
> xserver-xorg-video-nouveau - X.Org X server -- Nouveau display driver
>
> No firmware file on my disk:
> sauron:/usr/local/bin# find /lib/modules/5.9.11-amd64-preempt-sysrq-20190817/ /lib/firmware/ |grep nouveau
> /lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau
> /lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau/nouveau.ko
> sauron:/usr/local/bin#
>
> The kernel module is in my initrd:
> sauron:/usr/local/bin# dd if=/boot/initrd.img-5.9.11-amd64-preempt-sysrq-20190817 bs=2966528  skip=1 | gunzip | cpio -tdv | grep nouveau
> drwxr-xr-x   1 root     root            0 Nov 30 15:40 usr/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau
> -rw-r--r--   1 root     root      3691385 Nov 30 15:35 usr/lib/modules/5.9.11-amd64-preempt-sysrq-20190817/kernel/drivers/gpu/drm/nouveau/nouveau.ko
> 17+1 records in
> 17+1 records out
> 52566778 bytes (53 MB, 50 MiB) copied, 1.69708 s, 31.0 MB/s

I think that gets you out of "full newbie" land...

>
> What am I supposed to do/check next?
>
> Note that ultimately I only need nouveau not to hang my boot 2mn and do
> PM so that the nvidia chip goes to sleep since I don't use it.

I'm not extremely familiar with debian packaging, but the firmware is
provided by NVIDIA and shipped as part of linux-firmware:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/nvidia

This needs to be available at /lib/firmware/nvidia when nouveau loads.
Based on your email above, it's most likely that it would load from
the initrd - so make sure it's in there.

Of course now that I read your email a bit more carefully, it seems
your issue is with the "saving config space" messages. I'm not sure
I've seen those before. Perhaps you have some sort of debug enabled.
I'd find where in the kernel they are being produced, and what the
conditions for it are. But the failure to load firmware isn't great --
not 100% sure if it impacts runpm or not.

I just double-checked, TU10x accel came in via
afa3b96b058d87c2c44d1c83dadb2ba6998d03ce, which was first in v5.6.
Initial TU10x support came in v5.0. So that doesn't line up with your
timeline.

Anyways, I'd definitely sort the firmware situation out, but it may
not be the cause of your problem.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
