Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A43A2E95F3
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 14:28:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B88889AD2;
	Mon,  4 Jan 2021 13:28:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06F989AD2
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609766932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=w5ezdbmaFEZDRu9ux1bZudfKCEPN3dzIs7FpVocmHMM=;
 b=O/jBFgvKeU4aq2FDQ4Mrke1YkZr0xUTA/LrNjLJ2ajhtnk6liB0Dj8gTfPLVG6ihxwF69r
 PH4EWRdL2X4tAO+eR6Gi//ue5ZBIQjJOJwEJSMKi3qYc0R45QOmfmyaaao5hdYpB3eHDrN
 GvIyKylxtIu3qYDRg64veFzyG9yjpoM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-2h-r5C1PPciQJdamYyqQLw-1; Mon, 04 Jan 2021 08:28:49 -0500
X-MC-Unique: 2h-r5C1PPciQJdamYyqQLw-1
Received: by mail-wm1-f72.google.com with SMTP id b184so4957400wmh.6
 for <nouveau@lists.freedesktop.org>; Mon, 04 Jan 2021 05:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w5ezdbmaFEZDRu9ux1bZudfKCEPN3dzIs7FpVocmHMM=;
 b=Tzi+85ROw/b9v9s51IQt/5sfPKZDxOx4RpTRhrGRz7b2+ORgduGqsYKRd1kJHxSgIe
 u0qASQ3KERYrWyyD2zPjSid1NG1H0+b2rrdGJhn9MeyHIEJD3ow4+qRurAPjixy0I1d3
 N6+NX6JOjOnHH91TRoa+7HISyhfD1e4Gv6E6I/m891MWenOqTQihAR9TOLriuNBtkGp9
 U+MPtQjKt3q15LBmhPhRiPnCMu5HE6YVEId1gANa0xvxFBBk2ktedPbQhOQJk1WJDNR3
 n6nE707+/VuI7LmxOyWnU4Do9zNMWHK20TalYXiDeib+7+uLGvB66vEz6EKb+neARNEW
 CPwA==
X-Gm-Message-State: AOAM531/nvZHA4j6s5wytjgvDaZkpcpjgvkQhHrTQX5lM3lf3anRIGQ9
 0cB5D7g6yEPCcDh2J3B9Qnwd5HyJqlOBrdrhB1GBL1b5rMHAhYyptCQ/XiZhfTxxtOQspUKarUc
 xqm+YM8e6oB0Q7/AeLuxFQinyLoMHVx2aiK8xJWLi4w==
X-Received: by 2002:adf:e452:: with SMTP id t18mr76957087wrm.177.1609766928299; 
 Mon, 04 Jan 2021 05:28:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWErdcanKK6aR2TvUr3iQKhPQNxu70WYLSJ3DmLOF7UjkLdlhOCPiPMPxS4kGiYZy+T/ZP18hbSb0rsHaNyfY=
X-Received: by 2002:adf:e452:: with SMTP id t18mr76957076wrm.177.1609766928041; 
 Mon, 04 Jan 2021 05:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
 <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
 <20201229174750.GI23389@merlins.org> <20210104114955.GM32533@merlins.org>
In-Reply-To: <20210104114955.GM32533@merlins.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Jan 2021 14:28:37 +0100
Message-ID: <CACO55tsdG37YKv7FV2er4hRnXk9vmwMbPuPptA+=ZtziWXC2+g@mail.gmail.com>
To: Marc MERLIN <marc_nouveau@merlins.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

mhh, that PCI config stuff should really not happen all the time, but
it also doesn't appear to. The other thing I really don't know is, how
well the runpm works with tools like TLP if there isn't only an audio
device, but also the USB stuff and all the subdevices have to be
turned off all the time in order for the GPU to stay powered down.

The firmware stuff is also just a functional problem, so you won't get
display offloading, but it shouldn't drain your battery as long as
nothing is connected. I'd check with "grep .
/sys/bus/pci/devices/*/power/runtime_status" if all subdevices of the
GPU are powered down, and check which one gets enabled regularly or
something.

On Mon, Jan 4, 2021 at 12:50 PM Marc MERLIN <marc_nouveau@merlins.org> wrote:
>
> On Tue, Dec 29, 2020 at 09:47:50AM -0800, Marc MERLIN wrote:
> > > Of course now that I read your email a bit more carefully, it seems
> > > your issue is with the "saving config space" messages. I'm not sure
> > > I've seen those before. Perhaps you have some sort of debug enabled.
> > > I'd find where in the kernel they are being produced, and what the
> > > conditions for it are. But the failure to load firmware isn't great --
> > > not 100% sure if it impacts runpm or not.
> >
> > Yes, I have 'nouveau.debug=disp=trace'
> > Someone on this list asked me to add this a few months back.
> >
> > > I just double-checked, TU10x accel came in via
> > > afa3b96b058d87c2c44d1c83dadb2ba6998d03ce, which was first in v5.6.
> > > Initial TU10x support came in v5.0. So that doesn't line up with your
> > > timeline.
> >
> > You know, I said 5.5, maybe it was 5.6 now, it's been a little while
> > since those issues started.
> >
> > Now we know I was missing the required firmware, it's a good place to
> > start, so I'll start there, thank you very much for the pointers.
>
> Sorry for the delay. I rebooted and everything worked great.
> No hang at boot.
> As for the PME loop I've been seeing, it hasn't happened so far.
>
> I can't comment on whether firmware should be required for the kernel to
> boot properly, but if it's at all possible, please try to make the
> driver fall back or shut down if the firmware is absent as opposed to
> hanging the boot 2mn.
>
> Also some drivers give a better clue that their firmware is missing
> and where to get it from. Adding a printk to help users could be a good
> idea.
>
> Below is the boot with firmware present.
>
> Thanks for your help
> Marc
>
> sauron:~$ grep nouveau /var/log/dmesg
> [   11.016605] nouveau: detected PR support, will not use DSM
> [   11.025191] nouveau 0000:01:00.0: runtime IRQ mapping not provided by arch
> [   11.071823] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
> [   11.111588] nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
> [   11.203598] nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c
> [   11.203921] nouveau 0000:01:00.0: pmu: firmware unavailable
> [   11.204229] nouveau 0000:01:00.0: enabling bus mastering
> [   11.204543] nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
> [   11.215524] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
> [   11.215525] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
> [   11.215527] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
> [   11.215527] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
> [   11.215528] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [   11.215529] nouveau 0000:01:00.0: DRM: DCB version 4.1
> [   11.215530] nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04600020
> [   11.215531] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f52 00020010
> [   11.215532] nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f36 04600010
> [   11.215532] nouveau 0000:01:00.0: DRM: DCB outp 03: 04033f76 04600010
> [   11.215533] nouveau 0000:01:00.0: DRM: DCB outp 04: 04044f86 04600020
> [   11.215533] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
> [   11.215534] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
> [   11.215534] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001248
> [   11.215535] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000348
> [   11.215535] nouveau 0000:01:00.0: DRM: DCB conn 04: 02000471
> [   11.216166] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> [   11.526753] nouveau 0000:01:00.0: DRM: unknown connector type 48
> [   11.527077] nouveau 0000:01:00.0: DRM: unknown connector type 48
> [   11.552051] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
> [   11.554239] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
> [   11.555822] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
> [   11.556054] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
> [   11.556060] nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
> [   18.887229] nouveau 0000:01:00.0: saving config space at offset 0x0 (reading 0x1eb610de)
> [   18.887231] nouveau 0000:01:00.0: saving config space at offset 0x4 (reading 0x100407)
> [   18.887233] nouveau 0000:01:00.0: saving config space at offset 0x8 (reading 0x30000a1)
> [   18.887235] nouveau 0000:01:00.0: saving config space at offset 0xc (reading 0x800000)
> [   18.887237] nouveau 0000:01:00.0: saving config space at offset 0x10 (reading 0xcd000000)
> [   18.887239] nouveau 0000:01:00.0: saving config space at offset 0x14 (reading 0xa000000c)
> [   18.887241] nouveau 0000:01:00.0: saving config space at offset 0x18 (reading 0x0)
> [   18.887243] nouveau 0000:01:00.0: saving config space at offset 0x1c (reading 0xb000000c)
> [   18.887245] nouveau 0000:01:00.0: saving config space at offset 0x20 (reading 0x0)
> [   18.887247] nouveau 0000:01:00.0: saving config space at offset 0x24 (reading 0x2001)
> [   18.887249] nouveau 0000:01:00.0: saving config space at offset 0x28 (reading 0x0)
> [   18.887251] nouveau 0000:01:00.0: saving config space at offset 0x2c (reading 0x229b17aa)
> [   18.887253] nouveau 0000:01:00.0: saving config space at offset 0x30 (reading 0xfff80000)
> [   18.887255] nouveau 0000:01:00.0: saving config space at offset 0x34 (reading 0x60)
> [   18.887257] nouveau 0000:01:00.0: saving config space at offset 0x38 (reading 0x0)
> [   18.887259] nouveau 0000:01:00.0: saving config space at offset 0x3c (reading 0x1ff)
> [   18.887311] nouveau 0000:01:00.0: power state changed by ACPI to D3cold
> [   42.094494] nouveau 0000:01:00.0: power state changed by ACPI to D0
> [   42.094663] nouveau 0000:01:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x1ff)
> [   42.094679] nouveau 0000:01:00.0: restoring config space at offset 0x30 (was 0x0, writing 0xfff80000)
> [   42.094699] nouveau 0000:01:00.0: restoring config space at offset 0x24 (was 0x1, writing 0x2001)
> [   42.094721] nouveau 0000:01:00.0: restoring config space at offset 0x1c (was 0xc, writing 0xb000000c)
> [   42.094738] nouveau 0000:01:00.0: restoring config space at offset 0x14 (was 0xc, writing 0xa000000c)
> [   42.094769] nouveau 0000:01:00.0: restoring config space at offset 0x10 (was 0x0, writing 0xcd000000)
> [   42.094792] nouveau 0000:01:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100407)
> [   42.538785] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops nv50_audio_component_bind_ops [nouveau])
>
> --
> "A mouse is a device used to point at the xterm you want to type in" - A.S.R.
>
> Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
