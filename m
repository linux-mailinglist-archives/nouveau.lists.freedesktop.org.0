Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA36EA395
	for <lists+nouveau@lfdr.de>; Fri, 21 Apr 2023 08:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9244610ED7C;
	Fri, 21 Apr 2023 06:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1690 seconds by postgrey-1.36 at gabe;
 Fri, 21 Apr 2023 06:14:34 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0110ED7C
 for <nouveau@lists.freedesktop.org>; Fri, 21 Apr 2023 06:14:34 +0000 (UTC)
Received: from svh-gw.merlins.org ([76.132.34.178]:37418
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
 id 1ppiem-0007ib-Eh by authid <merlins.org> with srv_auth_plain;
 Thu, 20 Apr 2023 22:46:20 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1ppjbA-0003aE-IT; Thu, 20 Apr 2023 22:46:20 -0700
Date: Thu, 20 Apr 2023 22:46:20 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20230421054620.GA13387@merlins.org>
References: <20200529180315.GA18804@merlins.org>
 <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
 <20200529194605.GB18804@merlins.org>
 <20230419064916.GA25282@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419064916.GA25282@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 76.132.34.178
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: Re: [Nouveau] 6.2 still cannot get hdmi display out on Thinkpad P73
 Quadro RTX 4000 Mobile/TU104
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Tested with 6.2.8 and still nothing.  Is it meant to work at all?

Intel graphics works, but as soon as I plug in external HDMI, nouveau outputs huge amount of spam logs
but nothing seems to work

nouveau: detected PR support, will not use DSM
nouveau 0000:01:00.0: enabling device (0000 -> 0003)
Console: switching to colour dummy device 80x25
nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/nvdec/scrubber.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/bl.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/ucode_ahesasc.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/bl.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/ucode_asb.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/unload_bl.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/ucode_unload.bin
nouveau 0000:01:00.0: pmu: firmware unavailable
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_bl.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_inst.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_data.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_sig.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_bl.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_inst.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_data.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_sig.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_nonctx.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_ctx.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_bundle_init.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_method_init.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/sec2/sig.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/sec2/image.bin
nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/sec2/desc.bin
nouveau 0000:01:00.0: disp: preinit running...
nouveau 0000:01:00.0: disp: preinit completed in 0us
nouveau 0000:01:00.0: disp: fini running...
nouveau 0000:01:00.0: disp: fini completed in 0us
nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
nouveau 0000:01:00.0: disp: init running...
nouveau 0000:01:00.0: disp: init skipped, engine has no users
nouveau 0000:01:00.0: disp: init completed in 2us
nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
nouveau 0000:01:00.0: DRM: BIT table 'A' not found
nouveau 0000:01:00.0: DRM: BIT table 'L' not found
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.1
nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04600020
nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f52 00020010
nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f36 04600010
nouveau 0000:01:00.0: DRM: DCB outp 03: 04033f76 04600010
nouveau 0000:01:00.0: DRM: DCB outp 04: 04044f86 04600020
nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
nouveau 0000:01:00.0: DRM: DCB conn 02: 00001248
nouveau 0000:01:00.0: DRM: DCB conn 03: 01000348
nouveau 0000:01:00.0: DRM: DCB conn 04: 02000471
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:01:00.0: disp: init running...
nouveau 0000:01:00.0: disp: one-time init running...
nouveau 0000:01:00.0: disp: outp 00:0006:0f82: type 06 loc 0 or 2 link 2 con 0 edid 6 bus 0 head f
nouveau 0000:01:00.0: disp: outp 00:0006:0f82: bios dp 42 13 00 00
nouveau 0000:01:00.0: disp: outp 01:0002:0f42: type 02 loc 0 or 2 link 1 con 1 edid 5 bus 1 head f
nouveau 0000:01:00.0: disp: outp 02:0006:0f41: type 06 loc 0 or 1 link 1 con 2 edid 3 bus 2 head f
nouveau 0000:01:00.0: disp: outp 02:0006:0f41: bios dp 42 13 00 00
nouveau 0000:01:00.0: disp: outp 03:0006:0f44: type 06 loc 0 or 4 link 1 con 3 edid 7 bus 3 head f
nouveau 0000:01:00.0: disp: outp 03:0006:0f44: bios dp 42 13 00 00
nouveau 0000:01:00.0: disp: outp 04:0006:0f84: type 06 loc 0 or 4 link 2 con 4 edid 8 bus 4 head f
nouveau 0000:01:00.0: disp: outp 04:0006:0f84: bios dp 42 13 00 00
nouveau 0000:01:00.0: disp: conn 00:0047: type 47 loc 0 hpd 08 dp 0 di 0 sr 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 00:0047: func 52 (HPD)
nouveau 0000:01:00.0: disp: conn 01:0161: type 61 loc 1 hpd 04 dp 0 di 0 sr 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 01:0161: func 51 (HPD)
nouveau 0000:01:00.0: disp: conn 02:0248: type 48 loc 2 hpd 01 dp 0 di 0 sr 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 02:0248: func 07 (HPD)
nouveau 0000:01:00.0: disp: conn 03:0348: type 48 loc 3 hpd 10 dp 0 di 0 sr 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 03:0348: func 5e (HPD)
nouveau 0000:01:00.0: disp: conn 04:0471: type 71 loc 4 hpd 20 dp 0 di 0 sr 0 lcdid 0
nouveau 0000:01:00.0: disp: conn 04:0471: func 5f (HPD)
nouveau 0000:01:00.0: disp: Window(s): 8 (000000ff)
nouveau 0000:01:00.0: disp:   Head(s): 4 (0f)
nouveau 0000:01:00.0: disp: head-0: ctor
nouveau 0000:01:00.0: disp: head-1: ctor
nouveau 0000:01:00.0: disp: head-2: ctor
nouveau 0000:01:00.0: disp: head-3: ctor
nouveau 0000:01:00.0: disp:    SOR(s): 4 (0f)
nouveau 0000:01:00.0: disp: SOR-0: ctor
nouveau 0000:01:00.0: disp: SOR-1: ctor
nouveau 0000:01:00.0: disp: SOR-2: ctor
nouveau 0000:01:00.0: disp: SOR-3: ctor
nouveau 0000:01:00.0: disp: one-time init completed in 103us
nouveau 0000:01:00.0: disp: outp 00:0006:0f82: no route
i915: unknown parameter 'i915_enable_fbc' ignored
Setting dangerous option enable_guc - tainting kernel
i915 0000:00:02.0: enabling device (0006 -> 0007)
i915 0000:00:02.0: [drm] VT-d active for gfx access
i915 0000:00:02.0: vgaarb: deactivate vga console
i915 0000:00:02.0: [drm] Using Transparent Hugepages
i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=mem
nouveau 0000:01:00.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=none
(...)
nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> always
nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> demand
nouveau 0000:01:00.0: disp: outp 01:0002:0f42: no route
nouveau 0000:01:00.0: disp: outp 02:0006:0f41: no route
nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> always
nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> demand
nouveau 0000:01:00.0: disp: outp 03:0006:0f44: no route
nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> always
nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> demand
nouveau 0000:01:00.0: disp: outp 04:0006:0f84: no route
nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> always
nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> demand
nouveau 0000:01:00.0: disp: init completed in 332939us
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
nouveau 0000:01:00.0: disp: supervisor 1: 00000000
nouveau 0000:01:00.0: disp: head-0: 00000000
nouveau 0000:01:00.0: disp: head-1: 00000000
nouveau 0000:01:00.0: disp: head-2: 00000000
nouveau 0000:01:00.0: disp: head-3: 00000000
nouveau 0000:01:00.0: disp: Core:
nouveau 0000:01:00.0: disp:       0200: 7afebeff -> 00000001
nouveau 0000:01:00.0: disp:       0208: 00000000 -> f0000000
nouveau 0000:01:00.0: disp:       020c: 00000000 -> 00001000
nouveau 0000:01:00.0: disp:       0210: 00000000              
nouveau 0000:01:00.0: disp:       0214: 00000000              
nouveau 0000:01:00.0: disp:       0218: 00000000              
nouveau 0000:01:00.0: disp:       021c: 00000000              
nouveau 0000:01:00.0: disp: Core - SOR 0:
nouveau 0000:01:00.0: disp:       0300: 00000100              
nouveau 0000:01:00.0: disp:       0304: 00000000              
nouveau 0000:01:00.0: disp:       0308: 00000000              
nouveau 0000:01:00.0: disp:       030c: 00000000              
nouveau 0000:01:00.0: disp: Core - SOR 1:
nouveau 0000:01:00.0: disp:       0320: 00000100              
nouveau 0000:01:00.0: disp:       0324: 00000000              
nouveau 0000:01:00.0: disp:       0328: 00000000              
nouveau 0000:01:00.0: disp:       032c: 00000000              
nouveau 0000:01:00.0: disp: Core - SOR 2:
nouveau 0000:01:00.0: disp:       0340: 00000100              
nouveau 0000:01:00.0: disp:       0344: 00000000              
nouveau 0000:01:00.0: disp:       0348: 00000000              
nouveau 0000:01:00.0: disp:       034c: 00000000              
nouveau 0000:01:00.0: disp: Core - SOR 3:
nouveau 0000:01:00.0: disp:       0360: 00000100              
nouveau 0000:01:00.0: disp:       0364: 00000000              
nouveau 0000:01:00.0: disp:       0368: 00000000              
nouveau 0000:01:00.0: disp:       036c: 00000000              
nouveau 0000:01:00.0: disp: Core - WINDOW 0:
nouveau 0000:01:00.0: disp:       1000: 0000000f -> 00000000
nouveau 0000:01:00.0: disp:       1004: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1008: 00000000              
nouveau 0000:01:00.0: disp:       100c: 04000400              
nouveau 0000:01:00.0: disp:       1010: 00100000 -> 00117fff
nouveau 0000:01:00.0: disp: Core - WINDOW 1:
nouveau 0000:01:00.0: disp:       1080: 0000000f -> 00000000
nouveau 0000:01:00.0: disp:       1084: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1088: 00000000              
nouveau 0000:01:00.0: disp:       108c: 04000400              
nouveau 0000:01:00.0: disp:       1090: 00100000 -> 00117fff
nouveau 0000:01:00.0: disp: Core - WINDOW 2:
nouveau 0000:01:00.0: disp:       1100: 0000000f -> 00000001
nouveau 0000:01:00.0: disp:       1104: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1108: 00000000              
nouveau 0000:01:00.0: disp:       110c: 04000400              
nouveau 0000:01:00.0: disp:       1110: 00100000 -> 00117fff
nouveau 0000:01:00.0: disp: Core - WINDOW 3:
nouveau 0000:01:00.0: disp:       1180: 0000000f -> 00000001
nouveau 0000:01:00.0: disp:       1184: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1188: 00000000              
nouveau 0000:01:00.0: disp:       118c: 04000400              
nouveau 0000:01:00.0: disp:       1190: 00100000 -> 00117fff
nouveau 0000:01:00.0: disp: Core - WINDOW 4:
nouveau 0000:01:00.0: disp:       1200: 0000000f -> 00000002
nouveau 0000:01:00.0: disp:       1204: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1208: 00000000              
nouveau 0000:01:00.0: disp:       120c: 04000400              
nouveau 0000:01:00.0: disp:       1210: 00100000 -> 00117fff
nouveau 0000:01:00.0: disp: Core - WINDOW 5:
nouveau 0000:01:00.0: disp:       1280: 0000000f -> 00000002
nouveau 0000:01:00.0: disp:       1284: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1288: 00000000              
nouveau 0000:01:00.0: disp:       128c: 04000400              
nouveau 0000:01:00.0: disp:       1290: 00100000 -> 00117fff
nouveau 0000:01:00.0: disp: Core - WINDOW 6:
nouveau 0000:01:00.0: disp:       1300: 0000000f -> 00000003
nouveau 0000:01:00.0: disp:       1304: 000003b7 -> 0000000f
nouveau 0000:01:00.0: disp:       1308: 00000000              
nouveau 0000:01:00.0: disp:       130c: 04000400 

nouveau 0000:01:00.0: disp:       2e14: 00000000              
nouveau 0000:01:00.0: disp:       2e18: 00010002              
nouveau 0000:01:00.0: disp: supervisor 2: 00000010
nouveau 0000:01:00.0: disp: head-0: 00000000
nouveau 0000:01:00.0: disp: head-1: 00000000
nouveau 0000:01:00.0: disp: head-2: 00000000
nouveau 0000:01:00.0: disp: head-3: 00000000
nouveau 0000:01:00.0: disp: supervisor 3: 00000010
nouveau 0000:01:00.0: disp: head-0: 00000000
nouveau 0000:01:00.0: disp: head-1: 00000000
nouveau 0000:01:00.0: disp: head-2: 00000000
nouveau 0000:01:00.0: disp: head-3: 00000000
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0
nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes

then I plug HDMI:
Apr 20 22:07:52 sauron kernel: [   81.418141] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: acquire 00 |= 02 0000000000000000
Apr 20 22:07:52 sauron kernel: [   81.418685] nouveau 0000:01:00.0: disp: event: ntfy allow 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.418687] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.418688] nouveau 0000:01:00.0: disp: event: incr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.418690] nouveau 0000:01:00.0: disp: event: allowing 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.419863] nouveau 0000:01:00.0: disp: supervisor 1: 00000000
Apr 20 22:07:52 sauron kernel: [   81.419869] nouveau 0000:01:00.0: disp: head-0: 00001100
Apr 20 22:07:52 sauron kernel: [   81.419872] nouveau 0000:01:00.0: disp: head-1: 00000000
Apr 20 22:07:52 sauron kernel: [   81.419875] nouveau 0000:01:00.0: disp: head-2: 00000000
Apr 20 22:07:52 sauron kernel: [   81.419879] nouveau 0000:01:00.0: disp: head-3: 00000000
Apr 20 22:07:52 sauron kernel: [   81.419880] nouveau 0000:01:00.0: disp: Core:
Apr 20 22:07:52 sauron kernel: [   81.419885] nouveau 0000:01:00.0: disp:       0200: 3efebfff -> 00000001
Apr 20 22:07:52 sauron kernel: [   81.419894] nouveau 0000:01:00.0: disp:       0208: f0000000              
Apr 20 22:07:52 sauron kernel: [   81.419900] nouveau 0000:01:00.0: disp:       020c: 00001000              
Apr 20 22:07:52 sauron kernel: [   81.419907] nouveau 0000:01:00.0: disp:       0210: 00000000              
Apr 20 22:07:52 sauron kernel: [   81.419912] nouveau 0000:01:00.0: disp:       0214: 00000000              
Apr 20 22:07:52 sauron kernel: [   81.419916] nouveau 0000:01:00.0: disp:       0218: 00000000              
Apr 20 22:07:52 sauron kernel: [   81.419922] nouveau 0000:01:00.0: disp:       021c: 00000001              
Apr 20 22:07:52 sauron kernel: [   81.419923] nouveau 0000:01:00.0: disp: Core - SOR 0:
(...)
Apr 20 22:07:52 sauron kernel: [   81.421484] nouveau 0000:01:00.0: disp: head-0: supervisor 2.0
Apr 20 22:07:52 sauron kernel: [   81.421485] nouveau 0000:01:00.0: disp: head-0: nothing attached
Apr 20 22:07:52 sauron kernel: [   81.421486] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: acquire SOR-0
Apr 20 22:07:52 sauron kernel: [   81.421505] nouveau 0000:01:00.0: disp: head-0: supervisor 2.2
Apr 20 22:07:52 sauron kernel: [   81.421507] nouveau 0000:01:00.0: disp: head-0: to SOR-0
Apr 20 22:07:52 sauron kernel: [   81.421521] nouveau 0000:01:00.0: disp: 0x000057c1[0]: ZM_REG_SEQUENCE        0x02
Apr 20 22:07:52 sauron kernel: [   81.421523] nouveau 0000:01:00.0: disp: 0x000057c7[0]:                R[0x6061c118] = 0x333f3f3f
Apr 20 22:07:52 sauron kernel: [   81.421526] nouveau 0000:01:00.0: disp: 0x000057cb[0]:                R[0x6061c11c] = 0x0000003c
Apr 20 22:07:52 sauron kernel: [   81.421528] nouveau 0000:01:00.0: disp: 0x000057cf[0]: ZM_REG R[0x6061c120] = 0x00030303
Apr 20 22:07:52 sauron kernel: [   81.421530] nouveau 0000:01:00.0: disp: 0x000057d8[0]: ZM_REG R[0x4061c1b8] = 0x00000500
Apr 20 22:07:52 sauron kernel: [   81.421531] nouveau 0000:01:00.0: disp: 0x000057e1[0]: SUB_DIRECT     0x520d
Apr 20 22:07:52 sauron kernel: [   81.421533] nouveau 0000:01:00.0: disp: 0x0000520d[1]: SUB_DIRECT     0x5240
Apr 20 22:07:52 sauron kernel: [   81.421535] nouveau 0000:01:00.0: disp: 0x00005240[2]: NV_REG R[0x4061c138] &= 0xfffff00c |= 0x00000442
Apr 20 22:07:52 sauron kernel: [   81.421540] nouveau 0000:01:00.0: disp: 0x0000524d[2]: DONE
Apr 20 22:07:52 sauron kernel: [   81.421541] nouveau 0000:01:00.0: disp: 0x00005210[1]: ZM_REG_SEQUENCE        0x02
Apr 20 22:07:52 sauron kernel: [   81.421543] nouveau 0000:01:00.0: disp: 0x00005216[1]:                R[0x4061c00c] = 0x03050300
Apr 20 22:07:52 sauron kernel: [   81.421545] nouveau 0000:01:00.0: disp: 0x0000521a[1]:                R[0x4061c010] = 0x00000d00
Apr 20 22:07:52 sauron kernel: [   81.421547] nouveau 0000:01:00.0: disp: 0x0000521e[1]: NV_REG R[0x4061c1b8] &= 0x01fff0ff |= 0x38000500
Apr 20 22:07:52 sauron kernel: [   81.421551] nouveau 0000:01:00.0: disp: 0x0000522b[1]: ZM_REG_SEQUENCE        0x02
Apr 20 22:07:52 sauron kernel: [   81.421552] nouveau 0000:01:00.0: disp: 0x00005231[1]:                R[0x4061c014] = 0x00020000
Apr 20 22:07:52 sauron kernel: [   81.421554] nouveau 0000:01:00.0: disp: 0x00005235[1]:                R[0x4061c018] = 0x00245888
Apr 20 22:07:52 sauron kernel: [   81.421555] nouveau 0000:01:00.0: disp: 0x00005239[1]: SUB_DIRECT     0x524e
Apr 20 22:07:52 sauron kernel: [   81.421557] nouveau 0000:01:00.0: disp: 0x0000524e[2]: TIME   0x0032
Apr 20 22:07:52 sauron kernel: [   81.421608] nouveau 0000:01:00.0: disp: 0x00005251[2]: ZM_REG R[0x4061c138] = 0x38000440
Apr 20 22:07:52 sauron kernel: [   81.421609] nouveau 0000:01:00.0: disp: 0x0000525a[2]: DONE
Apr 20 22:07:52 sauron kernel: [   81.421611] nouveau 0000:01:00.0: disp: 0x0000523c[1]: SUB_DIRECT     0x50ed
Apr 20 22:07:52 sauron kernel: [   81.421612] nouveau 0000:01:00.0: disp: 0x000050ed[2]: NV_REG R[0x4061c200] &= 0xffffdfff |= 0x00002000
Apr 20 22:07:52 sauron kernel: [   81.421616] nouveau 0000:01:00.0: disp: 0x000050fa[2]: NV_REG R[0x40612300] &= 0xfffcffff |= 0x00030000
Apr 20 22:07:52 sauron kernel: [   81.421623] nouveau 0000:01:00.0: disp: 0x00005107[2]: NV_REG R[0x4061c1b0] &= 0xff7fffff |= 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.421629] nouveau 0000:01:00.0: disp: 0x00005114[2]: DONE
Apr 20 22:07:52 sauron kernel: [   81.421630] nouveau 0000:01:00.0: disp: 0x0000523f[1]: DONE
Apr 20 22:07:52 sauron kernel: [   81.421632] nouveau 0000:01:00.0: disp: 0x000057e4[0]: SUB_DIRECT     0x41e3
Apr 20 22:07:52 sauron kernel: [   81.421634] nouveau 0000:01:00.0: disp: 0x000041e3[1]: NV_REG R[0x612488] &= 0xffffffdf |= 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.421638] nouveau 0000:01:00.0: disp: 0x000041f0[1]: NV_REG R[0x612408] &= 0xfffff0ff |= 0x00000800
Apr 20 22:07:52 sauron kernel: [   81.421642] nouveau 0000:01:00.0: disp: 0x000041fd[1]: TIME   0x0064
Apr 20 22:07:52 sauron kernel: [   81.421742] nouveau 0000:01:00.0: disp: 0x00004200[1]: CONDITION      0x02
Apr 20 22:07:52 sauron kernel: [   81.421744] nouveau 0000:01:00.0: disp: 0x00004202[1]:        [0x02] (R[0x612408] & 0x00000080) == 0x00000080
Apr 20 22:07:52 sauron kernel: [   81.421748] nouveau 0000:01:00.0: disp: 0x00004202[1]: ANDN_REG       R[0x612408] &= ~0x00000800
Apr 20 22:07:52 sauron kernel: [   81.421751] nouveau 0000:01:00.0: disp: 0x0000420b[1]: RESUME
Apr 20 22:07:52 sauron kernel: [   81.421753] nouveau 0000:01:00.0: disp: 0x0000420c[1]: OR_REG R[0x612408] |= 0x00000400
Apr 20 22:07:52 sauron kernel: [   81.421756] nouveau 0000:01:00.0: disp: 0x00004215[1]: TIME   0x0064
Apr 20 22:07:52 sauron kernel: [   81.421857] nouveau 0000:01:00.0: disp: 0x00004218[1]: CONDITION      0x02
Apr 20 22:07:52 sauron kernel: [   81.421858] nouveau 0000:01:00.0: disp: 0x0000421a[1]:        [0x02] (R[0x612408] & 0x00000080) == 0x00000080
Apr 20 22:07:52 sauron kernel: [   81.421861] nouveau 0000:01:00.0: disp: 0x0000421a[ ]: ANDN_REG       R[0x612408] &= ~0x00000400
Apr 20 22:07:52 sauron kernel: [   81.421863] nouveau 0000:01:00.0: disp: 0x00004223[ ]: RESUME
Apr 20 22:07:52 sauron kernel: [   81.421864] nouveau 0000:01:00.0: disp: 0x00004224[1]: OR_REG R[0x612408] |= 0x00000200
Apr 20 22:07:52 sauron kernel: [   81.421869] nouveau 0000:01:00.0: disp: 0x0000422d[1]: TIME   0x0064
Apr 20 22:07:52 sauron kernel: [   81.421969] nouveau 0000:01:00.0: disp: 0x00004230[1]: CONDITION      0x02
Apr 20 22:07:52 sauron kernel: [   81.421971] nouveau 0000:01:00.0: disp: 0x00004232[1]:        [0x02] (R[0x612408] & 0x00000080) == 0x00000080
Apr 20 22:07:52 sauron kernel: [   81.421974] nouveau 0000:01:00.0: disp: 0x00004232[ ]: ANDN_REG       R[0x612408] &= ~0x00000200
Apr 20 22:07:52 sauron kernel: [   81.421976] nouveau 0000:01:00.0: disp: 0x0000423b[ ]: RESUME
Apr 20 22:07:52 sauron kernel: [   81.421977] nouveau 0000:01:00.0: disp: 0x0000423c[1]: OR_REG R[0x612408] |= 0x00000100
Apr 20 22:07:52 sauron kernel: [   81.421980] nouveau 0000:01:00.0: disp: 0x00004245[1]: TIME   0x0064
Apr 20 22:07:52 sauron kernel: [   81.422081] nouveau 0000:01:00.0: disp: 0x00004248[1]: CONDITION      0x02
Apr 20 22:07:52 sauron kernel: [   81.422082] nouveau 0000:01:00.0: disp: 0x0000424a[1]:        [0x02] (R[0x612408] & 0x00000080) == 0x00000080
Apr 20 22:07:52 sauron kernel: [   81.422086] nouveau 0000:01:00.0: disp: 0x0000424a[1]: ANDN_REG       R[0x612408] &= ~0x00000100
Apr 20 22:07:52 sauron kernel: [   81.422090] nouveau 0000:01:00.0: disp: 0x00004253[1]: RESUME
Apr 20 22:07:52 sauron kernel: [   81.422091] nouveau 0000:01:00.0: disp: 0x00004254[1]: CONDITION      0x34
Apr 20 22:07:52 sauron kernel: [   81.422093] nouveau 0000:01:00.0: disp: 0x00004256[1]:        [0x34] (R[0x625488] & 0x00020000) == 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.422096] nouveau 0000:01:00.0: disp: 0x00004256[1]: COPY_NV_REG    R[0x612488] &= 0xfffff0ff |= ((R[0x612408] >> 0x00) & 0x00000f00 ^ 0x00000000)
Apr 20 22:07:52 sauron kernel: [   81.422102] nouveau 0000:01:00.0: disp: 0x0000426c[1]: RESUME
Apr 20 22:07:52 sauron kernel: [   81.422103] nouveau 0000:01:00.0: disp: 0x0000426d[1]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422105] nouveau 0000:01:00.0: disp: 0x000057e7[0]: SUB_DIRECT     0x57eb
Apr 20 22:07:52 sauron kernel: [   81.422106] nouveau 0000:01:00.0: disp: 0x000057eb[1]: NV_REG R[0x6061c130] &= 0xffff0fff |= 0x00002000
Apr 20 22:07:52 sauron kernel: [   81.422110] nouveau 0000:01:00.0: disp: 0x000057f8[1]: NV_REG R[0x4061c1b0] &= 0xffff0fff |= 0x00002000
Apr 20 22:07:52 sauron kernel: [   81.422114] nouveau 0000:01:00.0: disp: 0x00005805[1]: SUB_DIRECT     0x5115
Apr 20 22:07:52 sauron kernel: [   81.422116] nouveau 0000:01:00.0: disp: 0x00005115[2]: SUB_DIRECT     0x5bdd
Apr 20 22:07:52 sauron kernel: [   81.422118] nouveau 0000:01:00.0: disp: 0x00005bdd[3]: ZM_REG_SEQUENCE        0x10
Apr 20 22:07:52 sauron kernel: [   81.422119] nouveau 0000:01:00.0: disp: 0x00005be3[3]:                R[0x4061c040] = 0x030b0000
Apr 20 22:07:52 sauron kernel: [   81.422121] nouveau 0000:01:00.0: disp: 0x00005be7[3]:                R[0x4061c044] = 0x020a0000
Apr 20 22:07:52 sauron kernel: [   81.422123] nouveau 0000:01:00.0: disp: 0x00005beb[3]:                R[0x4061c048] = 0x02080000
Apr 20 22:07:52 sauron kernel: [   81.422125] nouveau 0000:01:00.0: disp: 0x00005bef[3]:                R[0x4061c04c] = 0x02042000
Apr 20 22:07:52 sauron kernel: [   81.422127] nouveau 0000:01:00.0: disp: 0x00005bf3[3]:                R[0x4061c050] = 0x00008000
Apr 20 22:07:52 sauron kernel: [   81.422128] nouveau 0000:01:00.0: disp: 0x00005bf7[3]:                R[0x4061c054] = 0x00008000
Apr 20 22:07:52 sauron kernel: [   81.422130] nouveau 0000:01:00.0: disp: 0x00005bfb[3]:                R[0x4061c058] = 0x00008000
Apr 20 22:07:52 sauron kernel: [   81.422131] nouveau 0000:01:00.0: disp: 0x00005bff[3]:                R[0x4061c05c] = 0x00008000
Apr 20 22:07:52 sauron kernel: [   81.422133] nouveau 0000:01:00.0: disp: 0x00005c03[3]:                R[0x4061c060] = 0x00002000
Apr 20 22:07:52 sauron kernel: [   81.422134] nouveau 0000:01:00.0: disp: 0x00005c07[3]:                R[0x4061c064] = 0x03002000
Apr 20 22:07:52 sauron kernel: [   81.422136] nouveau 0000:01:00.0: disp: 0x00005c0b[3]:                R[0x4061c068] = 0x030c0000
Apr 20 22:07:52 sauron kernel: [   81.422137] nouveau 0000:01:00.0: disp: 0x00005c0f[3]:                R[0x4061c06c] = 0x030a0000
Apr 20 22:07:52 sauron kernel: [   81.422139] nouveau 0000:01:00.0: disp: 0x00005c13[3]:                R[0x4061c070] = 0x030b8000
Apr 20 22:07:52 sauron kernel: [   81.422140] nouveau 0000:01:00.0: disp: 0x00005c17[3]:                R[0x4061c074] = 0x030b8000
Apr 20 22:07:52 sauron kernel: [   81.422142] nouveau 0000:01:00.0: disp: 0x00005c1b[3]:                R[0x4061c078] = 0x030b8000
Apr 20 22:07:52 sauron kernel: [   81.422143] nouveau 0000:01:00.0: disp: 0x00005c1f[3]:                R[0x4061c07c] = 0x030b8000
Apr 20 22:07:52 sauron kernel: [   81.422145] nouveau 0000:01:00.0: disp: 0x00005c23[3]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422146] nouveau 0000:01:00.0: disp: 0x00005118[2]: NV_REG R[0x4061c130] &= 0xffbff0ff |= 0x00400600
Apr 20 22:07:52 sauron kernel: [   81.422150] nouveau 0000:01:00.0: disp: 0x00005125[2]: NV_REG R[0x4061c1b0] &= 0xff3ff0ff |= 0x00c00600
Apr 20 22:07:52 sauron kernel: [   81.422154] nouveau 0000:01:00.0: disp: 0x00005132[2]: NV_REG R[0x40612300] &= 0xfcffffff |= 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.422158] nouveau 0000:01:00.0: disp: 0x0000513f[2]: NV_REG R[0x4061c1b8] &= 0x7fffffff |= 0x80000000
Apr 20 22:07:52 sauron kernel: [   81.422162] nouveau 0000:01:00.0: disp: 0x0000514c[2]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422163] nouveau 0000:01:00.0: disp: 0x00005808[1]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422164] nouveau 0000:01:00.0: disp: 0x000057ea[0]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422478] nouveau 0000:01:00.0: disp: supervisor 3: 00000010

And then it loops and spams forever with:
Apr 20 22:07:52 sauron kernel: [   81.422494] nouveau 0000:01:00.0: disp: 0x0000514d[0]: SUB_DIRECT     0x5154
Apr 20 22:07:52 sauron kernel: [   81.422496] nouveau 0000:01:00.0: disp: 0x00005154[1]: CONDITION_TIME 0x00 0xff
Apr 20 22:07:52 sauron kernel: [   81.422498] nouveau 0000:01:00.0: disp: 0x00005157[1]:        [0x00] (R[0x4061c030] & 0x10000000) == 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.422516] nouveau 0000:01:00.0: disp: 0x00005157[1]: RESUME
Apr 20 22:07:52 sauron kernel: [   81.422517] nouveau 0000:01:00.0: disp: 0x00005158[1]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422518] nouveau 0000:01:00.0: disp: 0x00005150[0]: SUB_DIRECT     0x5159
Apr 20 22:07:52 sauron kernel: [   81.422520] nouveau 0000:01:00.0: disp: 0x00005159[1]: NV_REG R[0x4061c10c] &= 0xfffffffe |= 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.422523] nouveau 0000:01:00.0: disp: 0x00005166[1]: NV_REG R[0x80616540] &= 0xfffffffe |= 0x00000000
Apr 20 22:07:52 sauron kernel: [   81.422526] nouveau 0000:01:00.0: disp: 0x00005173[1]: DONE
Apr 20 22:07:52 sauron kernel: [   81.422528] nouveau 0000:01:00.0: disp: 0x00005153[0]: DONE
Apr 20 22:07:52 sauron kernel: [   81.439093] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.455749] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.455791] nouveau 0000:01:00.0: disp: event: ntfy block 00000001 on 0 wait:0
Apr 20 22:07:52 sauron kernel: [   81.455795] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.455798] nouveau 0000:01:00.0: disp: event: decr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.455800] nouveau 0000:01:00.0: disp: event: blocking 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.459792] nouveau 0000:01:00.0: disp: event: ntfy allow 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.459797] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.459799] nouveau 0000:01:00.0: disp: event: incr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.459800] nouveau 0000:01:00.0: disp: event: allowing 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.472413] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.489115] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.505777] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.505801] nouveau 0000:01:00.0: disp: event: ntfy block 00000001 on 0 wait:0
Apr 20 22:07:52 sauron kernel: [   81.505803] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.505804] nouveau 0000:01:00.0: disp: event: decr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.505806] nouveau 0000:01:00.0: disp: event: blocking 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.514072] nouveau 0000:01:00.0: disp: event: ntfy allow 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.514076] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.514077] nouveau 0000:01:00.0: disp: event: incr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.514079] nouveau 0000:01:00.0: disp: event: allowing 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.522417] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.539114] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.539143] nouveau 0000:01:00.0: disp: event: ntfy block 00000001 on 0 wait:0
Apr 20 22:07:52 sauron kernel: [   81.539145] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.539147] nouveau 0000:01:00.0: disp: event: decr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.539148] nouveau 0000:01:00.0: disp: event: blocking 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.688694] vgaarb: client 0x0000000009c9a4a6 called 'target'
Apr 20 22:07:52 sauron kernel: [   81.688703] vgaarb: PCI:0000:00:02.0 ==> 0000:00:02.0 pdev 00000000cea7876c
Apr 20 22:07:52 sauron kernel: [   81.688706] vgaarb: vgadev 0000000061e2f948
Apr 20 22:07:52 sauron kernel: [   81.704107] vgaarb: client 0x0000000009c9a4a6 called 'target'
Apr 20 22:07:52 sauron kernel: [   81.704116] vgaarb: PCI:0000:00:02.0 ==> 0000:00:02.0 pdev 00000000cea7876c
Apr 20 22:07:52 sauron kernel: [   81.704119] vgaarb: vgadev 0000000061e2f948

it then loops forever and fill my logs with:
Apr 20 22:07:52 sauron kernel: [   81.704150] nouveau 0000:01:00.0: disp: event: ntfy allow 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.704152] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.704154] nouveau 0000:01:00.0: disp: event: incr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.704156] nouveau 0000:01:00.0: disp: event: allowing 0 on 0
Apr 20 22:07:52 sauron kernel: [   81.704208] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.704232] nouveau 0000:01:00.0: disp: event: ntfy block 00000001 on 0 wait:0
Apr 20 22:07:52 sauron kernel: [   81.704234] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:52 sauron kernel: [   81.704235] nouveau 0000:01:00.0: disp: event: decr 00000001 on 0
Apr 20 22:07:52 sauron kernel: [   81.704237] nouveau 0000:01:00.0: disp: event: blocking 0 on 0
Apr 20 22:07:53 sauron kernel: [   81.851196] nouveau 0000:01:00.0: disp: event: ntfy allow 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.851220] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:53 sauron kernel: [   81.851222] nouveau 0000:01:00.0: disp: event: incr 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.851224] nouveau 0000:01:00.0: disp: event: allowing 0 on 0
Apr 20 22:07:53 sauron kernel: [   81.851271] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.855801] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.872466] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.872546] nouveau 0000:01:00.0: disp: event: ntfy block 00000001 on 0 wait:0
Apr 20 22:07:53 sauron kernel: [   81.872548] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:53 sauron kernel: [   81.872550] nouveau 0000:01:00.0: disp: event: decr 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.872552] nouveau 0000:01:00.0: disp: event: blocking 0 on 0
Apr 20 22:07:53 sauron kernel: [   81.880706] nouveau 0000:01:00.0: disp: event: ntfy allow 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.880712] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:53 sauron kernel: [   81.880714] nouveau 0000:01:00.0: disp: event: incr 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.880715] nouveau 0000:01:00.0: disp: event: allowing 0 on 0
Apr 20 22:07:53 sauron kernel: [   81.889167] nouveau 0000:01:00.0: disp: event: ntfy 00000001 on 0
Apr 20 22:07:53 sauron kernel: [   81.889261] nouveau 0000:01:00.0: disp: event: ntfy block 00000001 on 0 wait:0
Apr 20 22:07:53 sauron kernel: [   81.889263] nouveau 0000:01:00.0: disp: event: ntfy state changed
Apr 20 22:07:53 sauron kernel: [   81.889264] nouveau 0000:01:00.0: disp: event: decr 00000001 on 0

and continues/loops forever. Most of the time, I cannot recover my X
session on the intel chip, even after I unplug HDMI.

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08

