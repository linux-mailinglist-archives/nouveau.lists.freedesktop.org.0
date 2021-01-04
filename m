Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB3A2E9449
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 12:50:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25A8898C4;
	Mon,  4 Jan 2021 11:49:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFFB898C4
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 11:49:57 +0000 (UTC)
Received: from aaubervilliers-653-1-146-240.w86-218.abo.wanadoo.fr
 ([86.218.37.240]:50110 helo=sauron.svh.merlins.org)
 by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1kwON2-0008Ac-V4 by authid <merlins.org> with srv_auth_plain;
 Mon, 04 Jan 2021 03:49:56 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1kwON1-0008QN-Jb; Mon, 04 Jan 2021 03:49:55 -0800
Date: Mon, 4 Jan 2021 03:49:55 -0800
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20210104114955.GM32533@merlins.org>
References: <20200908002935.GD20064@merlins.org>
 <20200529180315.GA18804@merlins.org>
 <20201229155159.GG23389@merlins.org>
 <CAKb7UviFP_YVxC4PO7MDNnw6NDrD=3BCGF37umwAfaimjbX9Pw@mail.gmail.com>
 <20201229174750.GI23389@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201229174750.GI23389@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 86.218.37.240
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
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

On Tue, Dec 29, 2020 at 09:47:50AM -0800, Marc MERLIN wrote:
> > Of course now that I read your email a bit more carefully, it seems
> > your issue is with the "saving config space" messages. I'm not sure
> > I've seen those before. Perhaps you have some sort of debug enabled.
> > I'd find where in the kernel they are being produced, and what the
> > conditions for it are. But the failure to load firmware isn't great --
> > not 100% sure if it impacts runpm or not.
>  
> Yes, I have 'nouveau.debug=disp=trace'
> Someone on this list asked me to add this a few months back.
> 
> > I just double-checked, TU10x accel came in via
> > afa3b96b058d87c2c44d1c83dadb2ba6998d03ce, which was first in v5.6.
> > Initial TU10x support came in v5.0. So that doesn't line up with your
> > timeline.
> 
> You know, I said 5.5, maybe it was 5.6 now, it's been a little while
> since those issues started.
> 
> Now we know I was missing the required firmware, it's a good place to
> start, so I'll start there, thank you very much for the pointers.

Sorry for the delay. I rebooted and everything worked great.
No hang at boot.
As for the PME loop I've been seeing, it hasn't happened so far.

I can't comment on whether firmware should be required for the kernel to
boot properly, but if it's at all possible, please try to make the
driver fall back or shut down if the firmware is absent as opposed to
hanging the boot 2mn.

Also some drivers give a better clue that their firmware is missing
and where to get it from. Adding a printk to help users could be a good
idea.

Below is the boot with firmware present.

Thanks for your help
Marc

sauron:~$ grep nouveau /var/log/dmesg 
[   11.016605] nouveau: detected PR support, will not use DSM
[   11.025191] nouveau 0000:01:00.0: runtime IRQ mapping not provided by arch
[   11.071823] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[   11.111588] nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
[   11.203598] nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c
[   11.203921] nouveau 0000:01:00.0: pmu: firmware unavailable
[   11.204229] nouveau 0000:01:00.0: enabling bus mastering
[   11.204543] nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
[   11.215524] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[   11.215525] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[   11.215527] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[   11.215527] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[   11.215528] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   11.215529] nouveau 0000:01:00.0: DRM: DCB version 4.1
[   11.215530] nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04600020
[   11.215531] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f52 00020010
[   11.215532] nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f36 04600010
[   11.215532] nouveau 0000:01:00.0: DRM: DCB outp 03: 04033f76 04600010
[   11.215533] nouveau 0000:01:00.0: DRM: DCB outp 04: 04044f86 04600020
[   11.215533] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
[   11.215534] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[   11.215534] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001248
[   11.215535] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000348
[   11.215535] nouveau 0000:01:00.0: DRM: DCB conn 04: 02000471
[   11.216166] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   11.526753] nouveau 0000:01:00.0: DRM: unknown connector type 48
[   11.527077] nouveau 0000:01:00.0: DRM: unknown connector type 48
[   11.552051] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   11.554239] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   11.555822] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   11.556054] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
[   11.556060] nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
[   18.887229] nouveau 0000:01:00.0: saving config space at offset 0x0 (reading 0x1eb610de)
[   18.887231] nouveau 0000:01:00.0: saving config space at offset 0x4 (reading 0x100407)
[   18.887233] nouveau 0000:01:00.0: saving config space at offset 0x8 (reading 0x30000a1)
[   18.887235] nouveau 0000:01:00.0: saving config space at offset 0xc (reading 0x800000)
[   18.887237] nouveau 0000:01:00.0: saving config space at offset 0x10 (reading 0xcd000000)
[   18.887239] nouveau 0000:01:00.0: saving config space at offset 0x14 (reading 0xa000000c)
[   18.887241] nouveau 0000:01:00.0: saving config space at offset 0x18 (reading 0x0)
[   18.887243] nouveau 0000:01:00.0: saving config space at offset 0x1c (reading 0xb000000c)
[   18.887245] nouveau 0000:01:00.0: saving config space at offset 0x20 (reading 0x0)
[   18.887247] nouveau 0000:01:00.0: saving config space at offset 0x24 (reading 0x2001)
[   18.887249] nouveau 0000:01:00.0: saving config space at offset 0x28 (reading 0x0)
[   18.887251] nouveau 0000:01:00.0: saving config space at offset 0x2c (reading 0x229b17aa)
[   18.887253] nouveau 0000:01:00.0: saving config space at offset 0x30 (reading 0xfff80000)
[   18.887255] nouveau 0000:01:00.0: saving config space at offset 0x34 (reading 0x60)
[   18.887257] nouveau 0000:01:00.0: saving config space at offset 0x38 (reading 0x0)
[   18.887259] nouveau 0000:01:00.0: saving config space at offset 0x3c (reading 0x1ff)
[   18.887311] nouveau 0000:01:00.0: power state changed by ACPI to D3cold
[   42.094494] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   42.094663] nouveau 0000:01:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x1ff)
[   42.094679] nouveau 0000:01:00.0: restoring config space at offset 0x30 (was 0x0, writing 0xfff80000)
[   42.094699] nouveau 0000:01:00.0: restoring config space at offset 0x24 (was 0x1, writing 0x2001)
[   42.094721] nouveau 0000:01:00.0: restoring config space at offset 0x1c (was 0xc, writing 0xb000000c)
[   42.094738] nouveau 0000:01:00.0: restoring config space at offset 0x14 (was 0xc, writing 0xa000000c)
[   42.094769] nouveau 0000:01:00.0: restoring config space at offset 0x10 (was 0x0, writing 0xcd000000)
[   42.094792] nouveau 0000:01:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100407)
[   42.538785] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops nv50_audio_component_bind_ops [nouveau])

-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
