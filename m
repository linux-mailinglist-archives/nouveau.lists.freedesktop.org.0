Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873316E73C1
	for <lists+nouveau@lfdr.de>; Wed, 19 Apr 2023 09:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2EA10E2F2;
	Wed, 19 Apr 2023 07:14:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1513 seconds by postgrey-1.36 at gabe;
 Wed, 19 Apr 2023 07:14:34 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA1A10E24A
 for <nouveau@lists.freedesktop.org>; Wed, 19 Apr 2023 07:14:34 +0000 (UTC)
Received: from merlin by mail1.merlins.org with local (Exim 4.94.2 #2)
 id 1pp1cz-0006zg-0t by authid <merlin>; Tue, 18 Apr 2023 23:49:17 -0700
Date: Tue, 18 Apr 2023 23:49:16 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Message-ID: <20230419064916.GA25282@merlins.org>
References: <20200529180315.GA18804@merlins.org>
 <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
 <20200529194605.GB18804@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529194605.GB18804@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: marc@merlins.org
Subject: Re: [Nouveau] 6.1 still cannot get display on Thinkpad P73Quadro
 RTX 4000 Mobile for hybrid graphics?
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

Howdy,

I still have this:
> sauron:~$ lspci |grep -i nvidia
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
> 01:00.1 Audio device: NVIDIA Corporation TU104 HD Audio Controller (rev a1)
> 01:00.2 USB controller: NVIDIA Corporation TU104 USB 3.1 Host Controller (rev a1)
> 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)

Everything looks like it works when I run the commands, but I get no display outside of the X cursor.

+ xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x42 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 3 outputs: 1 associated providers: 1 name:modesetting
Provider 1: id: 0xe5 cap: 0x2, Sink Output crtcs: 4 outputs: 5 associated providers: 1 name:modesetting
+ xrandr
+ grep connected
eDP-1 connected primary 3840x2160+0+0 (normal left inverted right x axis y axis) 382mm x 214mm panning 3840x2160+0+0
eDP-1-2 disconnected (normal left inverted right x axis y axis)
HDMI-1-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 575mm x 323mm
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-3 disconnected (normal left inverted right x axis y axis)
+ grep modeset /var/log/Xorg.0.log
+ grep driver:
[    86.135] (II) modeset(0): [DRI2]   DRI driver: i965
[    86.135] (II) modeset(0): [DRI2]   VDPAU driver: va_gl
+ echo 'route intel output to nvidia chip'
route intel output to nvidia chip
+ xrandr --setprovideroutputsource 1 0
+ xrandr
+ grep connected
eDP-1 connected primary 3840x2160+0+0 (normal left inverted right x axis y axis) 382mm x 214mm panning 3840x2160+0+0
eDP-1-2 disconnected (normal left inverted right x axis y axis)
HDMI-1-1 connected 1920x1200+0+0 (normal left inverted right x axis y axis) 575mm x 323mm
DP-1-1 disconnected (normal left inverted right x axis y axis)
DP-1-2 disconnected (normal left inverted right x axis y axis)
DP-1-3 disconnected (normal left inverted right x axis y axis)
+ xrandr --auto

The 2nd screen shows up in xrandr or lxrandr, I can move it around, and I 
see my X cursor on the 2nd screen, but that's it, just the X cursor from
enlightenment.
I do not see any of my windows or anything else, only what enlightenent
draws for the mouse, including some different looking mouse if I resize
a window

sauron:/sys/class/backlight# uname -r
6.1.0-7-amd64

sauron:/sys/class/backlight# dmesg | grep nouveau
[    6.643601] nouveau: detected PR support, will not use DSM
[    6.643619] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    6.643754] nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
[    6.733717] nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c
[    6.734139] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/nvdec/scrubber.bin
[    6.734156] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/bl.bin
[    6.734169] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/ucode_ahesasc.bin
[    6.734182] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/bl.bin
[    6.734192] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/ucode_asb.bin
[    6.734220] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/unload_bl.bin
[    6.734230] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/acr/ucode_unload.bin
[    6.734236] nouveau 0000:01:00.0: pmu: firmware unavailable
[    6.734359] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_bl.bin
[    6.734372] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_inst.bin
[    6.734381] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_data.bin
[    6.734390] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/fecs_sig.bin
[    6.734406] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_bl.bin
[    6.734415] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_inst.bin
[    6.734422] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_data.bin
[    6.734430] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/gpccs_sig.bin
[    6.734442] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_nonctx.bin
[    6.734453] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_ctx.bin
[    6.734464] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_bundle_init.bin
[    6.734476] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/gr/sw_method_init.bin
[    6.734495] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/sec2/sig.bin
[    6.734512] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/sec2/image.bin
[    6.734527] nouveau 0000:01:00.0: firmware: direct-loading firmware nvidia/tu104/sec2/desc.bin
[    6.734612] nouveau 0000:01:00.0: disp: preinit running...
[    6.734614] nouveau 0000:01:00.0: disp: preinit completed in 0us
[    6.734632] nouveau 0000:01:00.0: disp: fini running...
[    6.734634] nouveau 0000:01:00.0: disp: fini completed in 1us
[    6.734841] nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
[    6.744811] nouveau 0000:01:00.0: disp: init running...
[    6.744836] nouveau 0000:01:00.0: disp: init skipped, engine has no users
[    6.744837] nouveau 0000:01:00.0: disp: init completed in 1us
[    6.744925] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[    6.744927] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    6.744929] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    6.744931] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    6.744932] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    6.744934] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    6.744935] nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04600020
[    6.744937] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f52 00020010
[    6.744939] nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f36 04600010
[    6.744941] nouveau 0000:01:00.0: DRM: DCB outp 03: 04033f76 04600010
[    6.744943] nouveau 0000:01:00.0: DRM: DCB outp 04: 04044f86 04600020
[    6.744944] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
[    6.744946] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    6.744947] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001248
[    6.744948] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000348
[    6.744950] nouveau 0000:01:00.0: DRM: DCB conn 04: 02000471
[    6.746538] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    6.746552] nouveau 0000:01:00.0: disp: init running...
[    6.746554] nouveau 0000:01:00.0: disp: one-time init running...
[    6.746556] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: type 06 loc 0 or 2 link 2 con 0 edid 6 bus 0 head f
[    6.746560] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: bios dp 42 13 00 00
[    6.746563] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: type 02 loc 0 or 2 link 1 con 1 edid 5 bus 1 head f
[    6.746566] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: type 06 loc 0 or 1 link 1 con 2 edid 3 bus 2 head f
[    6.746568] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: bios dp 42 13 00 00
[    6.746570] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: type 06 loc 0 or 4 link 1 con 3 edid 7 bus 3 head f
[    6.746573] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: bios dp 42 13 00 00
[    6.746575] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: type 06 loc 0 or 4 link 2 con 4 edid 8 bus 4 head f
[    6.746578] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: bios dp 42 13 00 00
[    6.746581] nouveau 0000:01:00.0: disp: conn 00:0047: type 47 loc 0 hpd 08 dp 0 di 0 sr 0 lcdid 0
[    6.746584] nouveau 0000:01:00.0: disp: conn 00:0047: func 52 (HPD)
[    6.746586] nouveau 0000:01:00.0: disp: conn 01:0161: type 61 loc 1 hpd 04 dp 0 di 0 sr 0 lcdid 0
[    6.746589] nouveau 0000:01:00.0: disp: conn 01:0161: func 51 (HPD)
[    6.746591] nouveau 0000:01:00.0: disp: conn 02:0248: type 48 loc 2 hpd 01 dp 0 di 0 sr 0 lcdid 0
[    6.746593] nouveau 0000:01:00.0: disp: conn 02:0248: func 07 (HPD)
[    6.746595] nouveau 0000:01:00.0: disp: conn 03:0348: type 48 loc 3 hpd 10 dp 0 di 0 sr 0 lcdid 0
[    6.746598] nouveau 0000:01:00.0: disp: conn 03:0348: func 5e (HPD)
[    6.746599] nouveau 0000:01:00.0: disp: conn 04:0471: type 71 loc 4 hpd 20 dp 0 di 0 sr 0 lcdid 0
[    6.746602] nouveau 0000:01:00.0: disp: conn 04:0471: func 5f (HPD)
[    6.746607] nouveau 0000:01:00.0: disp: Window(s): 8 (000000ff)
[    6.746611] nouveau 0000:01:00.0: disp:   Head(s): 4 (0f)
[    6.746615] nouveau 0000:01:00.0: disp: head-0: ctor
[    6.746618] nouveau 0000:01:00.0: disp: head-1: ctor
[    6.746621] nouveau 0000:01:00.0: disp: head-2: ctor
[    6.746624] nouveau 0000:01:00.0: disp: head-3: ctor
[    6.746628] nouveau 0000:01:00.0: disp:    SOR(s): 4 (0f)
[    6.746632] nouveau 0000:01:00.0: disp: SOR-0: ctor
[    6.746635] nouveau 0000:01:00.0: disp: SOR-1: ctor
[    6.746639] nouveau 0000:01:00.0: disp: SOR-2: ctor
[    6.746659] nouveau 0000:01:00.0: disp: SOR-3: ctor
[    6.746679] nouveau 0000:01:00.0: disp: one-time init completed in 124us
[    6.746737] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: no route
[    7.067699] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> always
[    7.067764] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> demand
[    7.067794] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: no route
[    7.067805] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: no route
[    7.067828] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> always
[    7.067877] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> demand
[    7.067901] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: no route
[    7.067922] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> always
[    7.067971] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> demand
[    7.067996] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: no route
[    7.068016] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> always
[    7.068065] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> demand
[    7.068469] nouveau 0000:01:00.0: disp: init completed in 321914us
[    7.073323] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[    7.073494] nouveau 0000:01:00.0: disp: supervisor 1: 00000000
[    7.073515] nouveau 0000:01:00.0: disp: head-0: 00000000
[    7.073527] nouveau 0000:01:00.0: disp: head-1: 00000000
[    7.073536] nouveau 0000:01:00.0: disp: head-2: 00000000
[    7.073545] nouveau 0000:01:00.0: disp: head-3: 00000000
[    7.073552] nouveau 0000:01:00.0: disp: Core:
[    7.073563] nouveau 0000:01:00.0: disp: 	0200: 3effbfff -> 00000001
[    7.073578] nouveau 0000:01:00.0: disp: 	0208: 00000000 -> f0000000
[    7.073591] nouveau 0000:01:00.0: disp: 	020c: 00000000 -> 00001000
[    7.073603] nouveau 0000:01:00.0: disp: 	0210: 00000000              
[    7.073616] nouveau 0000:01:00.0: disp: 	0214: 00000000              
[    7.073628] nouveau 0000:01:00.0: disp: 	0218: 00000000              
[    7.073641] nouveau 0000:01:00.0: disp: 	021c: 00000000              
[    7.073649] nouveau 0000:01:00.0: disp: Core - SOR 0:
[    7.073660] nouveau 0000:01:00.0: disp: 	0300: 00000100              
[    7.073673] nouveau 0000:01:00.0: disp: 	0304: 00000000              
[    7.073686] nouveau 0000:01:00.0: disp: 	0308: 00000000              
[    7.073698] nouveau 0000:01:00.0: disp: 	030c: 00000000              
[    7.073706] nouveau 0000:01:00.0: disp: Core - SOR 1:
[    7.073717] nouveau 0000:01:00.0: disp: 	0320: 00000100              
[    7.073730] nouveau 0000:01:00.0: disp: 	0324: 00000000              
[    7.073740] nouveau 0000:01:00.0: disp: 	0328: 00000000              
[    7.073752] nouveau 0000:01:00.0: disp: 	032c: 00000000              
[    7.073760] nouveau 0000:01:00.0: disp: Core - SOR 2:
[    7.073770] nouveau 0000:01:00.0: disp: 	0340: 00000100              
[    7.073782] nouveau 0000:01:00.0: disp: 	0344: 00000000              
[    7.073794] nouveau 0000:01:00.0: disp: 	0348: 00000000              
[    7.073806] nouveau 0000:01:00.0: disp: 	034c: 00000000              
[    7.073814] nouveau 0000:01:00.0: disp: Core - SOR 3:
[    7.073824] nouveau 0000:01:00.0: disp: 	0360: 00000100              
[    7.073836] nouveau 0000:01:00.0: disp: 	0364: 00000000              
[    7.073848] nouveau 0000:01:00.0: disp: 	0368: 00000000              
[    7.073860] nouveau 0000:01:00.0: disp: 	036c: 00000000              
[    7.073868] nouveau 0000:01:00.0: disp: Core - WINDOW 0:
[    7.073879] nouveau 0000:01:00.0: disp: 	1000: 0000000f -> 00000000
[    7.073891] nouveau 0000:01:00.0: disp: 	1004: 000003b7 -> 0000000f
[    7.073904] nouveau 0000:01:00.0: disp: 	1008: 00000000              
[    7.073915] nouveau 0000:01:00.0: disp: 	100c: 04000400              
[    7.073928] nouveau 0000:01:00.0: disp: 	1010: 00100000 -> 00117fff
[    7.073937] nouveau 0000:01:00.0: disp: Core - WINDOW 1:
[    7.073948] nouveau 0000:01:00.0: disp: 	1080: 0000000f -> 00000000
[    7.073960] nouveau 0000:01:00.0: disp: 	1084: 000003b7 -> 0000000f
[    7.073972] nouveau 0000:01:00.0: disp: 	1088: 00000000              
[    7.073984] nouveau 0000:01:00.0: disp: 	108c: 04000400              
[    7.073997] nouveau 0000:01:00.0: disp: 	1090: 00100000 -> 00117fff
[    7.074005] nouveau 0000:01:00.0: disp: Core - WINDOW 2:
[    7.074016] nouveau 0000:01:00.0: disp: 	1100: 0000000f -> 00000001
[    7.074028] nouveau 0000:01:00.0: disp: 	1104: 000003b7 -> 0000000f
[    7.074041] nouveau 0000:01:00.0: disp: 	1108: 00000000              
[    7.074053] nouveau 0000:01:00.0: disp: 	110c: 04000400              
[    7.074065] nouveau 0000:01:00.0: disp: 	1110: 00100000 -> 00117fff
[    7.074073] nouveau 0000:01:00.0: disp: Core - WINDOW 3:
[    7.074083] nouveau 0000:01:00.0: disp: 	1180: 0000000f -> 00000001
[    7.074095] nouveau 0000:01:00.0: disp: 	1184: 000003b7 -> 0000000f
[    7.074107] nouveau 0000:01:00.0: disp: 	1188: 00000000              
[    7.074119] nouveau 0000:01:00.0: disp: 	118c: 04000400              
[    7.074132] nouveau 0000:01:00.0: disp: 	1190: 00100000 -> 00117fff
[    7.074140] nouveau 0000:01:00.0: disp: Core - WINDOW 4:
[    7.074150] nouveau 0000:01:00.0: disp: 	1200: 0000000f -> 00000002
[    7.074162] nouveau 0000:01:00.0: disp: 	1204: 000003b7 -> 0000000f
[    7.074174] nouveau 0000:01:00.0: disp: 	1208: 00000000              
[    7.074187] nouveau 0000:01:00.0: disp: 	120c: 04000400              
[    7.074198] nouveau 0000:01:00.0: disp: 	1210: 00100000 -> 00117fff
[    7.074206] nouveau 0000:01:00.0: disp: Core - WINDOW 5:
[    7.074217] nouveau 0000:01:00.0: disp: 	1280: 0000000f -> 00000002
[    7.074229] nouveau 0000:01:00.0: disp: 	1284: 000003b7 -> 0000000f
[    7.074241] nouveau 0000:01:00.0: disp: 	1288: 00000000              
[    7.074252] nouveau 0000:01:00.0: disp: 	128c: 04000400              
[    7.074264] nouveau 0000:01:00.0: disp: 	1290: 00100000 -> 00117fff
[    7.074272] nouveau 0000:01:00.0: disp: Core - WINDOW 6:
[    7.074283] nouveau 0000:01:00.0: disp: 	1300: 0000000f -> 00000003
[    7.074295] nouveau 0000:01:00.0: disp: 	1304: 000003b7 -> 0000000f
[    7.074307] nouveau 0000:01:00.0: disp: 	1308: 00000000              
[    7.074318] nouveau 0000:01:00.0: disp: 	130c: 04000400              
[    7.074330] nouveau 0000:01:00.0: disp: 	1310: 00100000 -> 00117fff
[    7.074338] nouveau 0000:01:00.0: disp: Core - WINDOW 7:
[    7.074348] nouveau 0000:01:00.0: disp: 	1380: 0000000f -> 00000003
[    7.074360] nouveau 0000:01:00.0: disp: 	1384: 000003b7 -> 0000000f
[    7.074371] nouveau 0000:01:00.0: disp: 	1388: 00000000              
[    7.074383] nouveau 0000:01:00.0: disp: 	138c: 04000400              
[    7.074396] nouveau 0000:01:00.0: disp: 	1390: 00100000 -> 00117fff
[    7.074404] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[    7.074415] nouveau 0000:01:00.0: disp: 	2000: 00000000              
[    7.074427] nouveau 0000:01:00.0: disp: 	2004: fc000040              
[    7.074440] nouveau 0000:01:00.0: disp: 	2008: 00000180              
[    7.074452] nouveau 0000:01:00.0: disp: 	200c: 00000000              
[    7.074464] nouveau 0000:01:00.0: disp: 	2014: 00000011              
[    7.074476] nouveau 0000:01:00.0: disp: 	2018: 00000000              
[    7.074488] nouveau 0000:01:00.0: disp: 	201c: 00000000              
[    7.074498] nouveau 0000:01:00.0: disp: 	2020: 00000000              
[    7.074511] nouveau 0000:01:00.0: disp: 	2028: 00000000              
[    7.074523] nouveau 0000:01:00.0: disp: 	202c: 04000400              
[    7.074536] nouveau 0000:01:00.0: disp: 	2030: 00001000              
[    7.074548] nouveau 0000:01:00.0: disp: 	2038: 00000001              
[    7.074560] nouveau 0000:01:00.0: disp: 	203c: 00000005              
[    7.074573] nouveau 0000:01:00.0: disp: 	2048: 00000000              
[    7.074583] nouveau 0000:01:00.0: disp: 	204c: 00000000              
[    7.074595] nouveau 0000:01:00.0: disp: 	2050: 00000000              
[    7.074606] nouveau 0000:01:00.0: disp: 	2054: 00000000              
[    7.074618] nouveau 0000:01:00.0: disp: 	2058: 00000000              
[    7.074630] nouveau 0000:01:00.0: disp: 	205c: 00000000              
[    7.074640] nouveau 0000:01:00.0: disp: 	2060: 00000000              
[    7.074652] nouveau 0000:01:00.0: disp: 	2064: 00050008              
[    7.074664] nouveau 0000:01:00.0: disp: 	2068: 00000000              
[    7.074676] nouveau 0000:01:00.0: disp: 	206c: 00010003              
[    7.074689] nouveau 0000:01:00.0: disp: 	2070: 00030004              
[    7.074700] nouveau 0000:01:00.0: disp: 	2074: 00000001              
[    7.074711] nouveau 0000:01:00.0: disp: 	2078: 00000000              
[    7.074723] nouveau 0000:01:00.0: disp: 	207c: 00000000              
[    7.074736] nouveau 0000:01:00.0: disp: 	2080: 00000000              
[    7.074748] nouveau 0000:01:00.0: disp: 	2088: 00000000              
[    7.074759] nouveau 0000:01:00.0: disp: 	2090: 00000000              
[    7.074770] nouveau 0000:01:00.0: disp: 	209c: 000000e9              
[    7.074782] nouveau 0000:01:00.0: disp: 	20a0: 000002ff              
[    7.074795] nouveau 0000:01:00.0: disp: 	20a4: 00000000              
[    7.074808] nouveau 0000:01:00.0: disp: 	20a8: 00000000              
[    7.074820] nouveau 0000:01:00.0: disp: 	20ac: 00000000              
[    7.074831] nouveau 0000:01:00.0: disp: 	2180: 00000000              
[    7.074843] nouveau 0000:01:00.0: disp: 	2184: 00000000              
[    7.074855] nouveau 0000:01:00.0: disp: 	218c: 00000000              
[    7.074866] nouveau 0000:01:00.0: disp: 	2194: 00000000              
[    7.074877] nouveau 0000:01:00.0: disp: 	2198: 00000000              
[    7.074889] nouveau 0000:01:00.0: disp: 	219c: 00000000              
[    7.074900] nouveau 0000:01:00.0: disp: 	21a0: 00000000              
[    7.074910] nouveau 0000:01:00.0: disp: 	21a4: 00000000              
[    7.074922] nouveau 0000:01:00.0: disp: 	2214: 00000000              
[    7.074933] nouveau 0000:01:00.0: disp: 	2218: 00010002              
[    7.074942] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[    7.074952] nouveau 0000:01:00.0: disp: 	2400: 00000000              
[    7.074964] nouveau 0000:01:00.0: disp: 	2404: fc000040              
[    7.074975] nouveau 0000:01:00.0: disp: 	2408: 00000180              
[    7.074987] nouveau 0000:01:00.0: disp: 	240c: 00000000              
[    7.074998] nouveau 0000:01:00.0: disp: 	2414: 00000011              
[    7.075009] nouveau 0000:01:00.0: disp: 	2418: 00000000              
[    7.075021] nouveau 0000:01:00.0: disp: 	241c: 00000000              
[    7.075032] nouveau 0000:01:00.0: disp: 	2420: 00000000              
[    7.075043] nouveau 0000:01:00.0: disp: 	2428: 00000000              
[    7.075054] nouveau 0000:01:00.0: disp: 	242c: 04000400              
[    7.075066] nouveau 0000:01:00.0: disp: 	2430: 00001000              
[    7.075079] nouveau 0000:01:00.0: disp: 	2438: 00000001              
[    7.075090] nouveau 0000:01:00.0: disp: 	243c: 00000005              
[    7.075101] nouveau 0000:01:00.0: disp: 	2448: 00000000              
[    7.075113] nouveau 0000:01:00.0: disp: 	244c: 00000000              
[    7.075125] nouveau 0000:01:00.0: disp: 	2450: 00000000              
[    7.075136] nouveau 0000:01:00.0: disp: 	2454: 00000000              
[    7.075147] nouveau 0000:01:00.0: disp: 	2458: 00000000              
[    7.075159] nouveau 0000:01:00.0: disp: 	245c: 00000000              
[    7.075171] nouveau 0000:01:00.0: disp: 	2460: 00000000              
[    7.075183] nouveau 0000:01:00.0: disp: 	2464: 00050008              
[    7.075196] nouveau 0000:01:00.0: disp: 	2468: 00000000              
[    7.075206] nouveau 0000:01:00.0: disp: 	246c: 00010003              
[    7.075218] nouveau 0000:01:00.0: disp: 	2470: 00030004              
[    7.075230] nouveau 0000:01:00.0: disp: 	2474: 00000001              
[    7.075243] nouveau 0000:01:00.0: disp: 	2478: 00000000              
[    7.075254] nouveau 0000:01:00.0: disp: 	247c: 00000000              
[    7.075264] nouveau 0000:01:00.0: disp: 	2480: 00000000              
[    7.075276] nouveau 0000:01:00.0: disp: 	2488: 00000000              
[    7.075287] nouveau 0000:01:00.0: disp: 	2490: 00000000              
[    7.075300] nouveau 0000:01:00.0: disp: 	249c: 000000e9              
[    7.075310] nouveau 0000:01:00.0: disp: 	24a0: 000002ff              
[    7.075338] nouveau 0000:01:00.0: disp: 	24a4: 00000000              
[    7.075350] nouveau 0000:01:00.0: disp: 	24a8: 00000000              
[    7.075361] nouveau 0000:01:00.0: disp: 	24ac: 00000000              
[    7.075372] nouveau 0000:01:00.0: disp: 	2580: 00000000              
[    7.075383] nouveau 0000:01:00.0: disp: 	2584: 00000000              
[    7.075394] nouveau 0000:01:00.0: disp: 	258c: 00000000              
[    7.075406] nouveau 0000:01:00.0: disp: 	2594: 00000000              
[    7.075417] nouveau 0000:01:00.0: disp: 	2598: 00000000              
[    7.075430] nouveau 0000:01:00.0: disp: 	259c: 00000000              
[    7.075442] nouveau 0000:01:00.0: disp: 	25a0: 00000000              
[    7.075453] nouveau 0000:01:00.0: disp: 	25a4: 00000000              
[    7.075465] nouveau 0000:01:00.0: disp: 	2614: 00000000              
[    7.075477] nouveau 0000:01:00.0: disp: 	2618: 00010002              
[    7.075485] nouveau 0000:01:00.0: disp: Core - HEAD 2:
[    7.075495] nouveau 0000:01:00.0: disp: 	2800: 00000000              
[    7.075507] nouveau 0000:01:00.0: disp: 	2804: fc000040             
[    7.075520] nouveau 0000:01:00.0: disp: 	2808: 00000180              
[    7.075532] nouveau 0000:01:00.0: disp: 	280c: 00000000              
[    7.075543] nouveau 0000:01:00.0: disp: 	2814: 00000011              
[    7.075555] nouveau 0000:01:00.0: disp: 	2818: 00000000              
[    7.075567] nouveau 0000:01:00.0: disp: 	281c: 00000000              
[    7.075579] nouveau 0000:01:00.0: disp: 	2820: 00000000              
[    7.075592] nouveau 0000:01:00.0: disp: 	2828: 00000000              
[    7.075604] nouveau 0000:01:00.0: disp: 	282c: 04000400              
[    7.075615] nouveau 0000:01:00.0: disp: 	2830: 00001000              
[    7.075627] nouveau 0000:01:00.0: disp: 	2838: 00000001              
[    7.075638] nouveau 0000:01:00.0: disp: 	283c: 00000005              
[    7.075650] nouveau 0000:01:00.0: disp: 	2848: 00000000              
[    7.075661] nouveau 0000:01:00.0: disp: 	284c: 00000000              
[    7.075673] nouveau 0000:01:00.0: disp: 	2850: 00000000              
[    7.075684] nouveau 0000:01:00.0: disp: 	2854: 00000000              
[    7.075696] nouveau 0000:01:00.0: disp: 	2858: 00000000              
[    7.075707] nouveau 0000:01:00.0: disp: 	285c: 00000000              
[    7.075718] nouveau 0000:01:00.0: disp: 	2860: 00000000              
[    7.075730] nouveau 0000:01:00.0: disp: 	2864: 00050008              
[    7.075742] nouveau 0000:01:00.0: disp: 	2868: 00000000              
[    7.075755] nouveau 0000:01:00.0: disp: 	286c: 00010003              
[    7.075766] nouveau 0000:01:00.0: disp: 	2870: 00030004              
[    7.075777] nouveau 0000:01:00.0: disp: 	2874: 00000001              
[    7.075789] nouveau 0000:01:00.0: disp: 	2878: 00000000              
[    7.075802] nouveau 0000:01:00.0: disp: 	287c: 00000000              
[    7.075814] nouveau 0000:01:00.0: disp: 	2880: 00000000              
[    7.075826] nouveau 0000:01:00.0: disp: 	2888: 00000000              
[    7.075838] nouveau 0000:01:00.0: disp: 	2890: 00000000              
[    7.075849] nouveau 0000:01:00.0: disp: 	289c: 000000e9              
[    7.075861] nouveau 0000:01:00.0: disp: 	28a0: 000002ff              
[    7.075873] nouveau 0000:01:00.0: disp: 	28a4: 00000000              
[    7.075884] nouveau 0000:01:00.0: disp: 	28a8: 00000000              
[    7.075895] nouveau 0000:01:00.0: disp: 	28ac: 00000000              
[    7.075907] nouveau 0000:01:00.0: disp: 	2980: 00000000              
[    7.075920] nouveau 0000:01:00.0: disp: 	2984: 00000000              
[    7.075932] nouveau 0000:01:00.0: disp: 	298c: 00000000              
[    7.075944] nouveau 0000:01:00.0: disp: 	2994: 00000000              
[    7.075956] nouveau 0000:01:00.0: disp: 	2998: 00000000              
[    7.075967] nouveau 0000:01:00.0: disp: 	299c: 00000000              
[    7.075978] nouveau 0000:01:00.0: disp: 	29a0: 00000000              
[    7.075989] nouveau 0000:01:00.0: disp: 	29a4: 00000000              
[    7.076000] nouveau 0000:01:00.0: disp: 	2a14: 00000000              
[    7.076012] nouveau 0000:01:00.0: disp: 	2a18: 00010002              
[    7.076020] nouveau 0000:01:00.0: disp: Core - HEAD 3:
[    7.076030] nouveau 0000:01:00.0: disp: 	2c00: 00000000              
[    7.076042] nouveau 0000:01:00.0: disp: 	2c04: fc000040              
[    7.076054] nouveau 0000:01:00.0: disp: 	2c08: 00000180              
[    7.076065] nouveau 0000:01:00.0: disp: 	2c0c: 00000000              
[    7.076076] nouveau 0000:01:00.0: disp: 	2c14: 00000011              
[    7.076088] nouveau 0000:01:00.0: disp: 	2c18: 00000000              
[    7.076099] nouveau 0000:01:00.0: disp: 	2c1c: 00000000              
[    7.076112] nouveau 0000:01:00.0: disp: 	2c20: 00000000              
[    7.076123] nouveau 0000:01:00.0: disp: 	2c28: 00000000              
[    7.076134] nouveau 0000:01:00.0: disp: 	2c2c: 04000400              
[    7.076146] nouveau 0000:01:00.0: disp: 	2c30: 00001000              
[    7.076158] nouveau 0000:01:00.0: disp: 	2c38: 00000001              
[    7.076169] nouveau 0000:01:00.0: disp: 	2c3c: 00000005              
[    7.076181] nouveau 0000:01:00.0: disp: 	2c48: 00000000              
[    7.076193] nouveau 0000:01:00.0: disp: 	2c4c: 00000000              
[    7.076204] nouveau 0000:01:00.0: disp: 	2c50: 00000000              
[    7.076216] nouveau 0000:01:00.0: disp: 	2c54: 00000000              
[    7.076229] nouveau 0000:01:00.0: disp: 	2c58: 00000000              
[    7.076241] nouveau 0000:01:00.0: disp: 	2c5c: 00000000              
[    7.076252] nouveau 0000:01:00.0: disp: 	2c60: 00000000              
[    7.076264] nouveau 0000:01:00.0: disp: 	2c64: 00050008              
[    7.076275] nouveau 0000:01:00.0: disp: 	2c68: 00000000              
[    7.076288] nouveau 0000:01:00.0: disp: 	2c6c: 00010003              
[    7.076300] nouveau 0000:01:00.0: disp: 	2c70: 00030004              
[    7.076312] nouveau 0000:01:00.0: disp: 	2c74: 00000001              
[    7.076323] nouveau 0000:01:00.0: disp: 	2c78: 00000000              
[    7.076335] nouveau 0000:01:00.0: disp: 	2c7c: 00000000              
[    7.076348] nouveau 0000:01:00.0: disp: 	2c80: 00000000              
[    7.076361] nouveau 0000:01:00.0: disp: 	2c88: 00000000              
[    7.076371] nouveau 0000:01:00.0: disp: 	2c90: 00000000              
[    7.076383] nouveau 0000:01:00.0: disp: 	2c9c: 000000e9              
[    7.076395] nouveau 0000:01:00.0: disp: 	2ca0: 000002ff              
[    7.076407] nouveau 0000:01:00.0: disp: 	2ca4: 00000000              
[    7.076419] nouveau 0000:01:00.0: disp: 	2ca8: 00000000              
[    7.076431] nouveau 0000:01:00.0: disp: 	2cac: 00000000              
[    7.076443] nouveau 0000:01:00.0: disp: 	2d80: 00000000              
[    7.076454] nouveau 0000:01:00.0: disp: 	2d84: 00000000              
[    7.076466] nouveau 0000:01:00.0: disp: 	2d8c: 00000000              
[    7.076478] nouveau 0000:01:00.0: disp: 	2d94: 00000000              
[    7.076489] nouveau 0000:01:00.0: disp: 	2d98: 00000000              
[    7.076500] nouveau 0000:01:00.0: disp: 	2d9c: 00000000              
[    7.076512] nouveau 0000:01:00.0: disp: 	2da0: 00000000              
[    7.076525] nouveau 0000:01:00.0: disp: 	2da4: 00000000              
[    7.076537] nouveau 0000:01:00.0: disp: 	2e14: 00000000              
[    7.076548] nouveau 0000:01:00.0: disp: 	2e18: 00010002              
[    7.076794] nouveau 0000:01:00.0: disp: supervisor 2: 00000010
[    7.076815] nouveau 0000:01:00.0: disp: head-0: 00000000
[    7.076826] nouveau 0000:01:00.0: disp: head-1: 00000000
[    7.076835] nouveau 0000:01:00.0: disp: head-2: 00000000
[    7.076844] nouveau 0000:01:00.0: disp: head-3: 00000000
[    7.076972] nouveau 0000:01:00.0: disp: supervisor 3: 00000010
[    7.076992] nouveau 0000:01:00.0: disp: head-0: 00000000
[    7.077003] nouveau 0000:01:00.0: disp: head-1: 00000000
[    7.077013] nouveau 0000:01:00.0: disp: head-2: 00000000
[    7.077022] nouveau 0000:01:00.0: disp: head-3: 00000000
[    7.078270] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
[    7.078290] nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
[    7.078624] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[    7.080354] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   12.312805] nouveau 0000:01:00.0: disp: suspend running...
[   12.312871] nouveau 0000:01:00.0: disp: suspend completed in 40us
[   77.467757] nouveau 0000:01:00.0: disp: preinit running...
[   77.471532] nouveau 0000:01:00.0: disp: preinit completed in 1us
[   77.471804] nouveau 0000:01:00.0: disp: fini running...
[   77.477305] nouveau 0000:01:00.0: disp: fini completed in 6us
[   77.494867] nouveau 0000:01:00.0: disp: init running...
[   77.496106] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: no route
[   77.819347] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> always
[   77.820436] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> demand
[   77.821489] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: no route
[   77.822529] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: no route
[   77.823582] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> always
[   77.824679] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> demand
[   77.825798] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: no route
[   77.826910] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> always
[   77.828029] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> demand
[   77.829129] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: no route
[   77.830247] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> always
[   77.831389] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> demand
[   77.832716] nouveau 0000:01:00.0: disp: init completed in 336663us
[   77.884010] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops nv50_audio_component_bind_ops [nouveau])
[   86.059716] nouveau 0000:01:00.0: disp: supervisor 1: 00000000
[   86.059722] nouveau 0000:01:00.0: disp: head-0: 00000000
[   86.059725] nouveau 0000:01:00.0: disp: head-1: 00000000
[   86.059729] nouveau 0000:01:00.0: disp: head-2: 00000000
[   86.059732] nouveau 0000:01:00.0: disp: head-3: 00000000
[   86.059733] nouveau 0000:01:00.0: disp: Core:
[   86.059737] nouveau 0000:01:00.0: disp: 	0200: 7efe9eff -> 00000001
[   86.059743] nouveau 0000:01:00.0: disp: 	0208: 00000000 -> f0000000
[   86.059747] nouveau 0000:01:00.0: disp: 	020c: 00000000 -> 00001000
[   86.059752] nouveau 0000:01:00.0: disp: 	0210: 00000000              
[   86.059757] nouveau 0000:01:00.0: disp: 	0214: 00000000              
[   86.059761] nouveau 0000:01:00.0: disp: 	0218: 00000000              
[   86.059766] nouveau 0000:01:00.0: disp: 	021c: 00000000              
[   86.059767] nouveau 0000:01:00.0: disp: Core - SOR 0:
[   86.059772] nouveau 0000:01:00.0: disp: 	0300: 00000100              
[   86.059776] nouveau 0000:01:00.0: disp: 	0304: 00000000              
[   86.059781] nouveau 0000:01:00.0: disp: 	0308: 00000000              
[   86.059786] nouveau 0000:01:00.0: disp: 	030c: 00000000              
[   86.059787] nouveau 0000:01:00.0: disp: Core - SOR 1:
[   86.059792] nouveau 0000:01:00.0: disp: 	0320: 00000100              
[   86.059796] nouveau 0000:01:00.0: disp: 	0324: 00000000              
[   86.059800] nouveau 0000:01:00.0: disp: 	0328: 00000000              
[   86.059804] nouveau 0000:01:00.0: disp: 	032c: 00000000              
[   86.059805] nouveau 0000:01:00.0: disp: Core - SOR 2:
[   86.059809] nouveau 0000:01:00.0: disp: 	0340: 00000100              
[   86.059813] nouveau 0000:01:00.0: disp: 	0344: 00000000              
[   86.059816] nouveau 0000:01:00.0: disp: 	0348: 00000000              
[   86.059821] nouveau 0000:01:00.0: disp: 	034c: 00000000              
[   86.059822] nouveau 0000:01:00.0: disp: Core - SOR 3:
[   86.059826] nouveau 0000:01:00.0: disp: 	0360: 00000100              
[   86.059830] nouveau 0000:01:00.0: disp: 	0364: 00000000              
[   86.059835] nouveau 0000:01:00.0: disp: 	0368: 00000000              
[   86.059840] nouveau 0000:01:00.0: disp: 	036c: 00000000              
[   86.059841] nouveau 0000:01:00.0: disp: Core - WINDOW 0:
[   86.059845] nouveau 0000:01:00.0: disp: 	1000: 0000000f -> 00000000
[   86.059849] nouveau 0000:01:00.0: disp: 	1004: 000003b7 -> 0000000f
[   86.059854] nouveau 0000:01:00.0: disp: 	1008: 00000000              
[   86.059859] nouveau 0000:01:00.0: disp: 	100c: 04000400              
[   86.059864] nouveau 0000:01:00.0: disp: 	1010: 00100000 -> 00117fff
[   86.059865] nouveau 0000:01:00.0: disp: Core - WINDOW 1:
[   86.059869] nouveau 0000:01:00.0: disp: 	1080: 0000000f -> 00000000
[   86.059874] nouveau 0000:01:00.0: disp: 	1084: 000003b7 -> 0000000f
[   86.059879] nouveau 0000:01:00.0: disp: 	1088: 00000000              
[   86.059884] nouveau 0000:01:00.0: disp: 	108c: 04000400              
[   86.059888] nouveau 0000:01:00.0: disp: 	1090: 00100000 -> 00117fff
[   86.059890] nouveau 0000:01:00.0: disp: Core - WINDOW 2:
[   86.059893] nouveau 0000:01:00.0: disp: 	1100: 0000000f -> 00000001
[   86.059898] nouveau 0000:01:00.0: disp: 	1104: 000003b7 -> 0000000f
[   86.059903] nouveau 0000:01:00.0: disp: 	1108: 00000000              
[   86.059907] nouveau 0000:01:00.0: disp: 	110c: 04000400              
[   86.059912] nouveau 0000:01:00.0: disp: 	1110: 00100000 -> 00117fff
[   86.059913] nouveau 0000:01:00.0: disp: Core - WINDOW 3:
[   86.059918] nouveau 0000:01:00.0: disp: 	1180: 0000000f -> 00000001
[   86.059922] nouveau 0000:01:00.0: disp: 	1184: 000003b7 -> 0000000f
[   86.059927] nouveau 0000:01:00.0: disp: 	1188: 00000000              
[   86.059932] nouveau 0000:01:00.0: disp: 	118c: 04000400              
[   86.059936] nouveau 0000:01:00.0: disp: 	1190: 00100000 -> 00117fff
[   86.059938] nouveau 0000:01:00.0: disp: Core - WINDOW 4:
[   86.059941] nouveau 0000:01:00.0: disp: 	1200: 0000000f -> 00000002
[   86.059946] nouveau 0000:01:00.0: disp: 	1204: 000003b7 -> 0000000f
[   86.059951] nouveau 0000:01:00.0: disp: 	1208: 00000000              
[   86.059955] nouveau 0000:01:00.0: disp: 	120c: 04000400              
[   86.059960] nouveau 0000:01:00.0: disp: 	1210: 00100000 -> 00117fff
[   86.059961] nouveau 0000:01:00.0: disp: Core - WINDOW 5:
[   86.059966] nouveau 0000:01:00.0: disp: 	1280: 0000000f -> 00000002
[   86.059970] nouveau 0000:01:00.0: disp: 	1284: 000003b7 -> 0000000f
[   86.059975] nouveau 0000:01:00.0: disp: 	1288: 00000000              
[   86.059980] nouveau 0000:01:00.0: disp: 	128c: 04000400              
[   86.059985] nouveau 0000:01:00.0: disp: 	1290: 00100000 -> 00117fff
[   86.059986] nouveau 0000:01:00.0: disp: Core - WINDOW 6:
[   86.059989] nouveau 0000:01:00.0: disp: 	1300: 0000000f -> 00000003
[   86.059994] nouveau 0000:01:00.0: disp: 	1304: 000003b7 -> 0000000f
[   86.059999] nouveau 0000:01:00.0: disp: 	1308: 00000000              
[   86.060003] nouveau 0000:01:00.0: disp: 	130c: 04000400              
[   86.060008] nouveau 0000:01:00.0: disp: 	1310: 00100000 -> 00117fff
[   86.060009] nouveau 0000:01:00.0: disp: Core - WINDOW 7:
[   86.060014] nouveau 0000:01:00.0: disp: 	1380: 0000000f -> 00000003
[   86.060019] nouveau 0000:01:00.0: disp: 	1384: 000003b7 -> 0000000f
[   86.060023] nouveau 0000:01:00.0: disp: 	1388: 00000000              
[   86.060028] nouveau 0000:01:00.0: disp: 	138c: 04000400              
[   86.060033] nouveau 0000:01:00.0: disp: 	1390: 00100000 -> 00117fff
[   86.060034] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[   86.060038] nouveau 0000:01:00.0: disp: 	2000: 00000000              
[   86.060042] nouveau 0000:01:00.0: disp: 	2004: fc000040              
[   86.060047] nouveau 0000:01:00.0: disp: 	2008: 00000180              
[   86.060052] nouveau 0000:01:00.0: disp: 	200c: 00000000              
[   86.060056] nouveau 0000:01:00.0: disp: 	2014: 00000011              
[   86.060061] nouveau 0000:01:00.0: disp: 	2018: 00000000              
[   86.060066] nouveau 0000:01:00.0: disp: 	201c: 00000000              
[   86.060070] nouveau 0000:01:00.0: disp: 	2020: 00000000              
[   86.060075] nouveau 0000:01:00.0: disp: 	2028: 00000000              
[   86.060080] nouveau 0000:01:00.0: disp: 	202c: 04000400              
[   86.060084] nouveau 0000:01:00.0: disp: 	2030: 00001000              
[   86.060089] nouveau 0000:01:00.0: disp: 	2038: 00000001              
[   86.060094] nouveau 0000:01:00.0: disp: 	203c: 00000005              
[   86.060099] nouveau 0000:01:00.0: disp: 	2048: 00000000              
[   86.060103] nouveau 0000:01:00.0: disp: 	204c: 00000000              
[   86.060108] nouveau 0000:01:00.0: disp: 	2050: 00000000              
[   86.060113] nouveau 0000:01:00.0: disp: 	2054: 00000000              
[   86.060117] nouveau 0000:01:00.0: disp: 	2058: 00000000              
[   86.060122] nouveau 0000:01:00.0: disp: 	205c: 00000000              
[   86.060127] nouveau 0000:01:00.0: disp: 	2060: 00000000              
[   86.060131] nouveau 0000:01:00.0: disp: 	2064: 00050008              
[   86.060136] nouveau 0000:01:00.0: disp: 	2068: 00000000              
[   86.060141] nouveau 0000:01:00.0: disp: 	206c: 00010003             
[   86.060146] nouveau 0000:01:00.0: disp: 	2070: 00030004              
[   86.060150] nouveau 0000:01:00.0: disp: 	2074: 00000001              
[   86.060155] nouveau 0000:01:00.0: disp: 	2078: 00000000              
[   86.060160] nouveau 0000:01:00.0: disp: 	207c: 00000000              
[   86.060164] nouveau 0000:01:00.0: disp: 	2080: 00000000              
[   86.060169] nouveau 0000:01:00.0: disp: 	2088: 00000000              
[   86.060173] nouveau 0000:01:00.0: disp: 	2090: 00000000              
[   86.060178] nouveau 0000:01:00.0: disp: 	209c: 000000e9              
[   86.060183] nouveau 0000:01:00.0: disp: 	20a0: 000002ff              
[   86.060187] nouveau 0000:01:00.0: disp: 	20a4: 00000000              
[   86.060192] nouveau 0000:01:00.0: disp: 	20a8: 00000000              
[   86.060197] nouveau 0000:01:00.0: disp: 	20ac: 00000000              
[   86.060201] nouveau 0000:01:00.0: disp: 	2180: 00000000              
[   86.060206] nouveau 0000:01:00.0: disp: 	2184: 00000000              
[   86.060211] nouveau 0000:01:00.0: disp: 	218c: 00000000              
[   86.060216] nouveau 0000:01:00.0: disp: 	2194: 00000000              
[   86.060220] nouveau 0000:01:00.0: disp: 	2198: 00000000              
[   86.060225] nouveau 0000:01:00.0: disp: 	219c: 00000000              
[   86.060230] nouveau 0000:01:00.0: disp: 	21a0: 00000000              
[   86.060234] nouveau 0000:01:00.0: disp: 	21a4: 00000000              
[   86.060239] nouveau 0000:01:00.0: disp: 	2214: 00000000              
[   86.060244] nouveau 0000:01:00.0: disp: 	2218: 00010002              
[   86.060245] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[   86.060249] nouveau 0000:01:00.0: disp: 	2400: 00000000              
[   86.060254] nouveau 0000:01:00.0: disp: 	2404: fc000040              
[   86.060259] nouveau 0000:01:00.0: disp: 	2408: 00000180              
[   86.060263] nouveau 0000:01:00.0: disp: 	240c: 00000000              
[   86.060268] nouveau 0000:01:00.0: disp: 	2414: 00000011              
[   86.060273] nouveau 0000:01:00.0: disp: 	2418: 00000000              
[   86.060277] nouveau 0000:01:00.0: disp: 	241c: 00000000              
[   86.060282] nouveau 0000:01:00.0: disp: 	2420: 00000000              
[   86.060287] nouveau 0000:01:00.0: disp: 	2428: 00000000              
[   86.060291] nouveau 0000:01:00.0: disp: 	242c: 04000400              
[   86.060296] nouveau 0000:01:00.0: disp: 	2430: 00001000              
[   86.060301] nouveau 0000:01:00.0: disp: 	2438: 00000001              
[   86.060305] nouveau 0000:01:00.0: disp: 	243c: 00000005              
[   86.060310] nouveau 0000:01:00.0: disp: 	2448: 00000000              
[   86.060315] nouveau 0000:01:00.0: disp: 	244c: 00000000              
[   86.060319] nouveau 0000:01:00.0: disp: 	2450: 00000000              
[   86.060324] nouveau 0000:01:00.0: disp: 	2454: 00000000              
[   86.060329] nouveau 0000:01:00.0: disp: 	2458: 00000000              
[   86.060333] nouveau 0000:01:00.0: disp: 	245c: 00000000              
[   86.060338] nouveau 0000:01:00.0: disp: 	2460: 00000000              
[   86.060343] nouveau 0000:01:00.0: disp: 	2464: 00050008              
[   86.060347] nouveau 0000:01:00.0: disp: 	2468: 00000000              
[   86.060352] nouveau 0000:01:00.0: disp: 	246c: 00010003              
[   86.060357] nouveau 0000:01:00.0: disp: 	2470: 00030004              
[   86.060361] nouveau 0000:01:00.0: disp: 	2474: 00000001              
[   86.060366] nouveau 0000:01:00.0: disp: 	2478: 00000000              
[   86.060371] nouveau 0000:01:00.0: disp: 	247c: 00000000              
[   86.060376] nouveau 0000:01:00.0: disp: 	2480: 00000000              
[   86.060380] nouveau 0000:01:00.0: disp: 	2488: 00000000              
[   86.060385] nouveau 0000:01:00.0: disp: 	2490: 00000000              
[   86.060389] nouveau 0000:01:00.0: disp: 	249c: 000000e9              
[   86.060394] nouveau 0000:01:00.0: disp: 	24a0: 000002ff              
[   86.060399] nouveau 0000:01:00.0: disp: 	24a4: 00000000              
[   86.060404] nouveau 0000:01:00.0: disp: 	24a8: 00000000              
[   86.060408] nouveau 0000:01:00.0: disp: 	24ac: 00000000              
[   86.060413] nouveau 0000:01:00.0: disp: 	2580: 00000000              
[   86.060418] nouveau 0000:01:00.0: disp: 	2584: 00000000              
[   86.060422] nouveau 0000:01:00.0: disp: 	258c: 00000000              
[   86.060427] nouveau 0000:01:00.0: disp: 	2594: 00000000              
[   86.060432] nouveau 0000:01:00.0: disp: 	2598: 00000000              
[   86.060436] nouveau 0000:01:00.0: disp: 	259c: 00000000              
[   86.060441] nouveau 0000:01:00.0: disp: 	25a0: 00000000              
[   86.060446] nouveau 0000:01:00.0: disp: 	25a4: 00000000              
[   86.060450] nouveau 0000:01:00.0: disp: 	2614: 00000000              
[   86.060455] nouveau 0000:01:00.0: disp: 	2618: 00010002              
[   86.060456] nouveau 0000:01:00.0: disp: Core - HEAD 2:
[   86.060460] nouveau 0000:01:00.0: disp: 	2800: 00000000              
[   86.060464] nouveau 0000:01:00.0: disp: 	2804: fc000040              
[   86.060469] nouveau 0000:01:00.0: disp: 	2808: 00000180              
[   86.060474] nouveau 0000:01:00.0: disp: 	280c: 00000000              
[   86.060478] nouveau 0000:01:00.0: disp: 	2814: 00000011              
[   86.060483] nouveau 0000:01:00.0: disp: 	2818: 00000000              
[   86.060488] nouveau 0000:01:00.0: disp: 	281c: 00000000              
[   86.060492] nouveau 0000:01:00.0: disp: 	2820: 00000000              
[   86.060497] nouveau 0000:01:00.0: disp: 	2828: 00000000              
[   86.060502] nouveau 0000:01:00.0: disp: 	282c: 04000400              
[   86.060506] nouveau 0000:01:00.0: disp: 	2830: 00001000              
[   86.060511] nouveau 0000:01:00.0: disp: 	2838: 00000001              
[   86.060516] nouveau 0000:01:00.0: disp: 	283c: 00000005              
[   86.060520] nouveau 0000:01:00.0: disp: 	2848: 00000000              
[   86.060525] nouveau 0000:01:00.0: disp: 	284c: 00000000              
[   86.060530] nouveau 0000:01:00.0: disp: 	2850: 00000000              
[   86.060535] nouveau 0000:01:00.0: disp: 	2854: 00000000              
[   86.060539] nouveau 0000:01:00.0: disp: 	2858: 00000000              
[   86.060544] nouveau 0000:01:00.0: disp: 	285c: 00000000              
[   86.060548] nouveau 0000:01:00.0: disp: 	2860: 00000000              
[   86.060553] nouveau 0000:01:00.0: disp: 	2864: 00050008              
[   86.060558] nouveau 0000:01:00.0: disp: 	2868: 00000000              
[   86.060563] nouveau 0000:01:00.0: disp: 	286c: 00010003              
[   86.060567] nouveau 0000:01:00.0: disp: 	2870: 00030004              
[   86.060572] nouveau 0000:01:00.0: disp: 	2874: 00000001              
[   86.060577] nouveau 0000:01:00.0: disp: 	2878: 00000000              
[   86.060581] nouveau 0000:01:00.0: disp: 	287c: 00000000              
[   86.060586] nouveau 0000:01:00.0: disp: 	2880: 00000000              
[   86.060591] nouveau 0000:01:00.0: disp: 	2888: 00000000              
[   86.060595] nouveau 0000:01:00.0: disp: 	2890: 00000000              
[   86.060600] nouveau 0000:01:00.0: disp: 	289c: 000000e9              
[   86.060605] nouveau 0000:01:00.0: disp: 	28a0: 000002ff              
[   86.060609] nouveau 0000:01:00.0: disp: 	28a4: 00000000              
[   86.060614] nouveau 0000:01:00.0: disp: 	28a8: 00000000              
[   86.060619] nouveau 0000:01:00.0: disp: 	28ac: 00000000              
[   86.060623] nouveau 0000:01:00.0: disp: 	2980: 00000000              
[   86.060628] nouveau 0000:01:00.0: disp: 	2984: 00000000              
[   86.060633] nouveau 0000:01:00.0: disp: 	298c: 00000000              
[   86.060637] nouveau 0000:01:00.0: disp: 	2994: 00000000              
[   86.060642] nouveau 0000:01:00.0: disp: 	2998: 00000000              
[   86.060647] nouveau 0000:01:00.0: disp: 	299c: 00000000              
[   86.060651] nouveau 0000:01:00.0: disp: 	29a0: 00000000              
[   86.060656] nouveau 0000:01:00.0: disp: 	29a4: 00000000              
[   86.060661] nouveau 0000:01:00.0: disp: 	2a14: 00000000              
[   86.060665] nouveau 0000:01:00.0: disp: 	2a18: 00010002              
[   86.060667] nouveau 0000:01:00.0: disp: Core - HEAD 3:
[   86.060671] nouveau 0000:01:00.0: disp: 	2c00: 00000000              
[   86.060675] nouveau 0000:01:00.0: disp: 	2c04: fc000040              
[   86.060680] nouveau 0000:01:00.0: disp: 	2c08: 00000180              
[   86.060685] nouveau 0000:01:00.0: disp: 	2c0c: 00000000              
[   86.060689] nouveau 0000:01:00.0: disp: 	2c14: 00000011              
[   86.060694] nouveau 0000:01:00.0: disp: 	2c18: 00000000              
[   86.060699] nouveau 0000:01:00.0: disp: 	2c1c: 00000000              
[   86.060703] nouveau 0000:01:00.0: disp: 	2c20: 00000000              
[   86.060708] nouveau 0000:01:00.0: disp: 	2c28: 00000000              
[   86.060713] nouveau 0000:01:00.0: disp: 	2c2c: 04000400              
[   86.060717] nouveau 0000:01:00.0: disp: 	2c30: 00001000              
[   86.060722] nouveau 0000:01:00.0: disp: 	2c38: 00000001              
[   86.060727] nouveau 0000:01:00.0: disp: 	2c3c: 00000005              
[   86.060732] nouveau 0000:01:00.0: disp: 	2c48: 00000000              
[   86.060736] nouveau 0000:01:00.0: disp: 	2c4c: 00000000              
[   86.060741] nouveau 0000:01:00.0: disp: 	2c50: 00000000              
[   86.060746] nouveau 0000:01:00.0: disp: 	2c54: 00000000              
[   86.060750] nouveau 0000:01:00.0: disp: 	2c58: 00000000              
[   86.060755] nouveau 0000:01:00.0: disp: 	2c5c: 00000000              
[   86.060760] nouveau 0000:01:00.0: disp: 	2c60: 00000000              
[   86.060764] nouveau 0000:01:00.0: disp: 	2c64: 00050008              
[   86.060768] nouveau 0000:01:00.0: disp: 	2c68: 00000000              
[   86.060773] nouveau 0000:01:00.0: disp: 	2c6c: 00010003              
[   86.060778] nouveau 0000:01:00.0: disp: 	2c70: 00030004              
[   86.060782] nouveau 0000:01:00.0: disp: 	2c74: 00000001              
[   86.060787] nouveau 0000:01:00.0: disp: 	2c78: 00000000              
[   86.060792] nouveau 0000:01:00.0: disp: 	2c7c: 00000000              
[   86.060797] nouveau 0000:01:00.0: disp: 	2c80: 00000000              
[   86.060801] nouveau 0000:01:00.0: disp: 	2c88: 00000000              
[   86.060806] nouveau 0000:01:00.0: disp: 	2c90: 00000000              
[   86.060811] nouveau 0000:01:00.0: disp: 	2c9c: 000000e9              
[   86.060815] nouveau 0000:01:00.0: disp: 	2ca0: 000002ff              
[   86.060820] nouveau 0000:01:00.0: disp: 	2ca4: 00000000              
[   86.060825] nouveau 0000:01:00.0: disp: 	2ca8: 00000000              
[   86.060829] nouveau 0000:01:00.0: disp: 	2cac: 00000000              
[   86.060834] nouveau 0000:01:00.0: disp: 	2d80: 00000000              
[   86.060839] nouveau 0000:01:00.0: disp: 	2d84: 00000000              
[   86.060843] nouveau 0000:01:00.0: disp: 	2d8c: 00000000              
[   86.060848] nouveau 0000:01:00.0: disp: 	2d94: 00000000              
[   86.060853] nouveau 0000:01:00.0: disp: 	2d98: 00000000              
[   86.060857] nouveau 0000:01:00.0: disp: 	2d9c: 00000000              
[   86.060862] nouveau 0000:01:00.0: disp: 	2da0: 00000000              
[   86.060866] nouveau 0000:01:00.0: disp: 	2da4: 00000000              
[   86.060871] nouveau 0000:01:00.0: disp: 	2e14: 00000000              
[   86.060876] nouveau 0000:01:00.0: disp: 	2e18: 00010002              
[   86.061048] nouveau 0000:01:00.0: disp: supervisor 2: 00000010
[   86.061053] nouveau 0000:01:00.0: disp: head-0: 00000000
[   86.061056] nouveau 0000:01:00.0: disp: head-1: 00000000
[   86.061059] nouveau 0000:01:00.0: disp: head-2: 00000000
[   86.061061] nouveau 0000:01:00.0: disp: head-3: 00000000
[   86.061144] nouveau 0000:01:00.0: disp: supervisor 3: 00000010
[   86.061148] nouveau 0000:01:00.0: disp: head-0: 00000000
[   86.061152] nouveau 0000:01:00.0: disp: head-1: 00000000
[   86.061154] nouveau 0000:01:00.0: disp: head-2: 00000000
[   86.061157] nouveau 0000:01:00.0: disp: head-3: 00000000
[  596.211351] nouveau 0000:01:00.0: disp: conn 01:0161: HPD: 2
[  596.361362] nouveau 0000:01:00.0: disp: conn 01:0161: HPD: 1
[  596.361434] nouveau 0000:01:00.0: disp: conn 01:0161: HPD: 3
[  596.688955] nouveau 0000:01:00.0: DRM: allocated 1920x1200 fb: 0x600000, bo 0000000008af3c41
[  596.689075] nouveau 0000:01:00.0: [drm] fb1: nouveaudrmfb frame buffer device
[  598.183454] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: acquire 00 |= 02 0000000000000000
[  598.185712] nouveau 0000:01:00.0: disp: supervisor 1: 00000000
[  598.185718] nouveau 0000:01:00.0: disp: head-0: 00011100
[  598.185722] nouveau 0000:01:00.0: disp: head-1: 00000000
[  598.185726] nouveau 0000:01:00.0: disp: head-2: 00000000
[  598.185728] nouveau 0000:01:00.0: disp: head-3: 00000000
[  598.185729] nouveau 0000:01:00.0: disp: Core:
[  598.185733] nouveau 0000:01:00.0: disp: 	0200: 7efe9eff -> 00000001
[  598.185738] nouveau 0000:01:00.0: disp: 	0208: f0000000              
[  598.185754] nouveau 0000:01:00.0: disp: 	020c: 00001000              
[  598.185760] nouveau 0000:01:00.0: disp: 	0210: 00000000              
[  598.185764] nouveau 0000:01:00.0: disp: 	0214: 00000000              
[  598.185768] nouveau 0000:01:00.0: disp: 	0218: 00000000              
[  598.185773] nouveau 0000:01:00.0: disp: 	021c: 00000000 -> 00000001
[  598.185774] nouveau 0000:01:00.0: disp: Core - SOR 0:
[  598.185779] nouveau 0000:01:00.0: disp: 	0300: 00000100 -> 00000101
[  598.185783] nouveau 0000:01:00.0: disp: 	0304: 00000000              
[  598.185802] nouveau 0000:01:00.0: disp: 	0308: 00000000              
[  598.185809] nouveau 0000:01:00.0: disp: 	030c: 00000000              
[  598.185810] nouveau 0000:01:00.0: disp: Core - SOR 1:
[  598.185816] nouveau 0000:01:00.0: disp: 	0320: 00000100              
[  598.185822] nouveau 0000:01:00.0: disp: 	0324: 00000000              
[  598.185827] nouveau 0000:01:00.0: disp: 	0328: 00000000              
[  598.185833] nouveau 0000:01:00.0: disp: 	032c: 00000000              
[  598.185834] nouveau 0000:01:00.0: disp: Core - SOR 2:
[  598.185838] nouveau 0000:01:00.0: disp: 	0340: 00000100              
[  598.185842] nouveau 0000:01:00.0: disp: 	0344: 00000000              
[  598.185845] nouveau 0000:01:00.0: disp: 	0348: 00000000              
[  598.185850] nouveau 0000:01:00.0: disp: 	034c: 00000000              
[  598.185851] nouveau 0000:01:00.0: disp: Core - SOR 3:
[  598.185854] nouveau 0000:01:00.0: disp: 	0360: 00000100              
[  598.185859] nouveau 0000:01:00.0: disp: 	0364: 00000000              
[  598.185864] nouveau 0000:01:00.0: disp: 	0368: 00000000              
[  598.185868] nouveau 0000:01:00.0: disp: 	036c: 00000000              
[  598.185869] nouveau 0000:01:00.0: disp: Core - WINDOW 0:
[  598.185873] nouveau 0000:01:00.0: disp: 	1000: 00000000              
[  598.185877] nouveau 0000:01:00.0: disp: 	1004: 0000000f              
[  598.185882] nouveau 0000:01:00.0: disp: 	1008: 00000000              
[  598.185886] nouveau 0000:01:00.0: disp: 	100c: 04000400              
[  598.185894] nouveau 0000:01:00.0: disp: 	1010: 00117fff              
[  598.185895] nouveau 0000:01:00.0: disp: Core - WINDOW 1:
[  598.185901] nouveau 0000:01:00.0: disp: 	1080: 00000000              
[  598.185907] nouveau 0000:01:00.0: disp: 	1084: 0000000f              
[  598.185911] nouveau 0000:01:00.0: disp: 	1088: 00000000              
[  598.185916] nouveau 0000:01:00.0: disp: 	108c: 04000400              
[  598.185920] nouveau 0000:01:00.0: disp: 	1090: 00117fff              
[  598.185921] nouveau 0000:01:00.0: disp: Core - WINDOW 2:
[  598.185925] nouveau 0000:01:00.0: disp: 	1100: 00000001              
[  598.185929] nouveau 0000:01:00.0: disp: 	1104: 0000000f              
[  598.185934] nouveau 0000:01:00.0: disp: 	1108: 00000000              
[  598.185939] nouveau 0000:01:00.0: disp: 	110c: 04000400              
[  598.185943] nouveau 0000:01:00.0: disp: 	1110: 00117fff              
[  598.185944] nouveau 0000:01:00.0: disp: Core - WINDOW 3:
[  598.185949] nouveau 0000:01:00.0: disp: 	1180: 00000001              
[  598.185953] nouveau 0000:01:00.0: disp: 	1184: 0000000f              
[  598.185958] nouveau 0000:01:00.0: disp: 	1188: 00000000              
[  598.185962] nouveau 0000:01:00.0: disp: 	118c: 04000400              
[  598.185967] nouveau 0000:01:00.0: disp: 	1190: 00117fff              
[  598.185968] nouveau 0000:01:00.0: disp: Core - WINDOW 4:
[  598.185972] nouveau 0000:01:00.0: disp: 	1200: 00000002              
[  598.185978] nouveau 0000:01:00.0: disp: 	1204: 0000000f              
[  598.185985] nouveau 0000:01:00.0: disp: 	1208: 00000000              
[  598.185989] nouveau 0000:01:00.0: disp: 	120c: 04000400              
[  598.185996] nouveau 0000:01:00.0: disp: 	1210: 00117fff              
[  598.185997] nouveau 0000:01:00.0: disp: Core - WINDOW 5:
[  598.186001] nouveau 0000:01:00.0: disp: 	1280: 00000002              
[  598.186006] nouveau 0000:01:00.0: disp: 	1284: 0000000f              
[  598.186011] nouveau 0000:01:00.0: disp: 	1288: 00000000              
[  598.186015] nouveau 0000:01:00.0: disp: 	128c: 04000400              
[  598.186020] nouveau 0000:01:00.0: disp: 	1290: 00117fff              
[  598.186021] nouveau 0000:01:00.0: disp: Core - WINDOW 6:
[  598.186025] nouveau 0000:01:00.0: disp: 	1300: 00000003              
[  598.186029] nouveau 0000:01:00.0: disp: 	1304: 0000000f              
[  598.186034] nouveau 0000:01:00.0: disp: 	1308: 00000000              
[  598.186038] nouveau 0000:01:00.0: disp: 	130c: 04000400              
[  598.186043] nouveau 0000:01:00.0: disp: 	1310: 00117fff              
[  598.186044] nouveau 0000:01:00.0: disp: Core - WINDOW 7:
[  598.186048] nouveau 0000:01:00.0: disp: 	1380: 00000003              
[  598.186053] nouveau 0000:01:00.0: disp: 	1384: 0000000f              
[  598.186059] nouveau 0000:01:00.0: disp: 	1388: 00000000              
[  598.186066] nouveau 0000:01:00.0: disp: 	138c: 04000400              
[  598.186071] nouveau 0000:01:00.0: disp: 	1390: 00117fff              
[  598.186073] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[  598.186079] nouveau 0000:01:00.0: disp: 	2000: 00000000              
[  598.186085] nouveau 0000:01:00.0: disp: 	2004: fc000040 -> fc000048
[  598.186089] nouveau 0000:01:00.0: disp: 	2008: 00000180 -> 00000000
[  598.186094] nouveau 0000:01:00.0: disp: 	200c: 00000000 -> 092dda80
[  598.186098] nouveau 0000:01:00.0: disp: 	2014: 00000011              
[  598.186103] nouveau 0000:01:00.0: disp: 	2018: 00000000 -> 00000010
[  598.186108] nouveau 0000:01:00.0: disp: 	201c: 00000000              
[  598.186112] nouveau 0000:01:00.0: disp: 	2020: 00000000              
[  598.186117] nouveau 0000:01:00.0: disp: 	2028: 00000000 -> 092dda80
[  598.186121] nouveau 0000:01:00.0: disp: 	202c: 04000400              
[  598.186126] nouveau 0000:01:00.0: disp: 	2030: 00001000 -> 00001114
[  598.186131] nouveau 0000:01:00.0: disp: 	2038: 00000001              
[  598.186135] nouveau 0000:01:00.0: disp: 	203c: 00000005              
[  598.186141] nouveau 0000:01:00.0: disp: 	2048: 00000000              
[  598.186149] nouveau 0000:01:00.0: disp: 	204c: 00000000 -> 04b00780
[  598.186154] nouveau 0000:01:00.0: disp: 	2050: 00000000              
[  598.186160] nouveau 0000:01:00.0: disp: 	2054: 00000000              
[  598.186165] nouveau 0000:01:00.0: disp: 	2058: 00000000 -> 04b00780
[  598.186170] nouveau 0000:01:00.0: disp: 	205c: 00000000              
[  598.186174] nouveau 0000:01:00.0: disp: 	2060: 00000000              
[  598.186178] nouveau 0000:01:00.0: disp: 	2064: 00050008 -> 04cb0831
[  598.186210] nouveau 0000:01:00.0: disp: 	2068: 00000000 -> 0005006f
[  598.186214] nouveau 0000:01:00.0: disp: 	206c: 00010003 -> 00170070
[  598.186241] nouveau 0000:01:00.0: disp: 	2070: 00030004 -> 04c707f0
[  598.186248] nouveau 0000:01:00.0: disp: 	2074: 00000001              
[  598.186255] nouveau 0000:01:00.0: disp: 	2078: 00000000              
[  598.186262] nouveau 0000:01:00.0: disp: 	207c: 00000000              
[  598.186269] nouveau 0000:01:00.0: disp: 	2080: 00000000              
[  598.186290] nouveau 0000:01:00.0: disp: 	2088: 00000000              
[  598.186309] nouveau 0000:01:00.0: disp: 	2090: 00000000              
[  598.186313] nouveau 0000:01:00.0: disp: 	209c: 000000e9              
[  598.186317] nouveau 0000:01:00.0: disp: 	20a0: 000002ff              
[  598.186322] nouveau 0000:01:00.0: disp: 	20a4: 00000000              
[  598.186326] nouveau 0000:01:00.0: disp: 	20a8: 00000000              
[  598.186331] nouveau 0000:01:00.0: disp: 	20ac: 00000000              
[  598.186357] nouveau 0000:01:00.0: disp: 	2180: 00000000              
[  598.186365] nouveau 0000:01:00.0: disp: 	2184: 00000000              
[  598.186370] nouveau 0000:01:00.0: disp: 	218c: 00000000              
[  598.186377] nouveau 0000:01:00.0: disp: 	2194: 00000000              
[  598.186382] nouveau 0000:01:00.0: disp: 	2198: 00000000              
[  598.186386] nouveau 0000:01:00.0: disp: 	219c: 00000000              
[  598.186391] nouveau 0000:01:00.0: disp: 	21a0: 00000000              
[  598.186396] nouveau 0000:01:00.0: disp: 	21a4: 00000000              
[  598.186400] nouveau 0000:01:00.0: disp: 	2214: 00000000              
[  598.186425] nouveau 0000:01:00.0: disp: 	2218: 00010002              
[  598.186426] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[  598.186431] nouveau 0000:01:00.0: disp: 	2400: 00000000              
[  598.186435] nouveau 0000:01:00.0: disp: 	2404: fc000040              
[  598.186440] nouveau 0000:01:00.0: disp: 	2408: 00000180              
[  598.186444] nouveau 0000:01:00.0: disp: 	240c: 00000000              
[  598.186449] nouveau 0000:01:00.0: disp: 	2414: 00000011              
[  598.186473] nouveau 0000:01:00.0: disp: 	2418: 00000000              
[  598.186478] nouveau 0000:01:00.0: disp: 	241c: 00000000              
[  598.186485] nouveau 0000:01:00.0: disp: 	2420: 00000000              
[  598.186489] nouveau 0000:01:00.0: disp: 	2428: 00000000              
[  598.186494] nouveau 0000:01:00.0: disp: 	242c: 04000400              
[  598.186498] nouveau 0000:01:00.0: disp: 	2430: 00001000              
[  598.186504] nouveau 0000:01:00.0: disp: 	2438: 00000001              
[  598.186508] nouveau 0000:01:00.0: disp: 	243c: 00000005              
[  598.186513] nouveau 0000:01:00.0: disp: 	2448: 00000000              
[  598.186516] nouveau 0000:01:00.0: disp: 	244c: 00000000              
[  598.186550] nouveau 0000:01:00.0: disp: 	2450: 00000000              
[  598.186555] nouveau 0000:01:00.0: disp: 	2454: 00000000              
[  598.186563] nouveau 0000:01:00.0: disp: 	2458: 00000000              
[  598.186569] nouveau 0000:01:00.0: disp: 	245c: 00000000              
[  598.186593] nouveau 0000:01:00.0: disp: 	2460: 00000000              
[  598.186598] nouveau 0000:01:00.0: disp: 	2464: 00050008              
[  598.186625] nouveau 0000:01:00.0: disp: 	2468: 00000000              
[  598.186630] nouveau 0000:01:00.0: disp: 	246c: 00010003              
[  598.186634] nouveau 0000:01:00.0: disp: 	2470: 00030004              
[  598.186639] nouveau 0000:01:00.0: disp: 	2474: 00000001              
[  598.186644] nouveau 0000:01:00.0: disp: 	2478: 00000000              
[  598.186648] nouveau 0000:01:00.0: disp: 	247c: 00000000              
[  598.186653] nouveau 0000:01:00.0: disp: 	2480: 00000000              
[  598.186674] nouveau 0000:01:00.0: disp: 	2488: 00000000              
[  598.186706] nouveau 0000:01:00.0: disp: 	2490: 00000000              
[  598.186711] nouveau 0000:01:00.0: disp: 	249c: 000000e9              
[  598.186734] nouveau 0000:01:00.0: disp: 	24a0: 000002ff              
[  598.186741] nouveau 0000:01:00.0: disp: 	24a4: 00000000              
[  598.186746] nouveau 0000:01:00.0: disp: 	24a8: 00000000              
[  598.186750] nouveau 0000:01:00.0: disp: 	24ac: 00000000              
[  598.186755] nouveau 0000:01:00.0: disp: 	2580: 00000000              
[  598.186760] nouveau 0000:01:00.0: disp: 	2584: 00000000              
[  598.186764] nouveau 0000:01:00.0: disp: 	258c: 00000000              
[  598.186769] nouveau 0000:01:00.0: disp: 	2594: 00000000              
[  598.186773] nouveau 0000:01:00.0: disp: 	2598: 00000000              
[  598.186778] nouveau 0000:01:00.0: disp: 	259c: 00000000              
[  598.186782] nouveau 0000:01:00.0: disp: 	25a0: 00000000              
[  598.186787] nouveau 0000:01:00.0: disp: 	25a4: 00000000              
[  598.186792] nouveau 0000:01:00.0: disp: 	2614: 00000000              
[  598.186796] nouveau 0000:01:00.0: disp: 	2618: 00010002              
[  598.186797] nouveau 0000:01:00.0: disp: Core - HEAD 2:
[  598.186802] nouveau 0000:01:00.0: disp: 	2800: 00000000              
[  598.186808] nouveau 0000:01:00.0: disp: 	2804: fc000040              
[  598.186816] nouveau 0000:01:00.0: disp: 	2808: 00000180              
[  598.186822] nouveau 0000:01:00.0: disp: 	280c: 00000000              
[  598.186829] nouveau 0000:01:00.0: disp: 	2814: 00000011              
[  598.186834] nouveau 0000:01:00.0: disp: 	2818: 00000000              
[  598.186839] nouveau 0000:01:00.0: disp: 	281c: 00000000              
[  598.186843] nouveau 0000:01:00.0: disp: 	2820: 00000000              
[  598.186848] nouveau 0000:01:00.0: disp: 	2828: 00000000              
[  598.186852] nouveau 0000:01:00.0: disp: 	282c: 04000400              
[  598.186857] nouveau 0000:01:00.0: disp: 	2830: 00001000              
[  598.186862] nouveau 0000:01:00.0: disp: 	2838: 00000001              
[  598.186866] nouveau 0000:01:00.0: disp: 	283c: 00000005              
[  598.186871] nouveau 0000:01:00.0: disp: 	2848: 00000000              
[  598.186875] nouveau 0000:01:00.0: disp: 	284c: 00000000              
[  598.186880] nouveau 0000:01:00.0: disp: 	2850: 00000000              
[  598.186884] nouveau 0000:01:00.0: disp: 	2854: 00000000              
[  598.186889] nouveau 0000:01:00.0: disp: 	2858: 00000000              
[  598.186896] nouveau 0000:01:00.0: disp: 	285c: 00000000              
[  598.186902] nouveau 0000:01:00.0: disp: 	2860: 00000000              
[  598.186907] nouveau 0000:01:00.0: disp: 	2864: 00050008              
[  598.186911] nouveau 0000:01:00.0: disp: 	2868: 00000000              
[  598.186915] nouveau 0000:01:00.0: disp: 	286c: 00010003              
[  598.186920] nouveau 0000:01:00.0: disp: 	2870: 00030004              
[  598.186924] nouveau 0000:01:00.0: disp: 	2874: 00000001              
[  598.186929] nouveau 0000:01:00.0: disp: 	2878: 00000000              
[  598.186933] nouveau 0000:01:00.0: disp: 	287c: 00000000              
[  598.186938] nouveau 0000:01:00.0: disp: 	2880: 00000000              
[  598.186943] nouveau 0000:01:00.0: disp: 	2888: 00000000              
[  598.186947] nouveau 0000:01:00.0: disp: 	2890: 00000000              
[  598.186952] nouveau 0000:01:00.0: disp: 	289c: 000000e9              
[  598.186956] nouveau 0000:01:00.0: disp: 	28a0: 000002ff              
[  598.186961] nouveau 0000:01:00.0: disp: 	28a4: 00000000              
[  598.186965] nouveau 0000:01:00.0: disp: 	28a8: 00000000              
[  598.186970] nouveau 0000:01:00.0: disp: 	28ac: 00000000              
[  598.186977] nouveau 0000:01:00.0: disp: 	2980: 00000000              
[  598.186983] nouveau 0000:01:00.0: disp: 	2984: 00000000              
[  598.186988] nouveau 0000:01:00.0: disp: 	298c: 00000000              
[  598.186994] nouveau 0000:01:00.0: disp: 	2994: 00000000              
[  598.186999] nouveau 0000:01:00.0: disp: 	2998: 00000000              
[  598.187004] nouveau 0000:01:00.0: disp: 	299c: 00000000              
[  598.187008] nouveau 0000:01:00.0: disp: 	29a0: 00000000              
[  598.187012] nouveau 0000:01:00.0: disp: 	29a4: 00000000              
[  598.187017] nouveau 0000:01:00.0: disp: 	2a14: 00000000              
[  598.187021] nouveau 0000:01:00.0: disp: 	2a18: 00010002              
[  598.187022] nouveau 0000:01:00.0: disp: Core - HEAD 3:
[  598.187026] nouveau 0000:01:00.0: disp: 	2c00: 00000000              
[  598.187031] nouveau 0000:01:00.0: disp: 	2c04: fc000040              
[  598.187035] nouveau 0000:01:00.0: disp: 	2c08: 00000180              
[  598.187040] nouveau 0000:01:00.0: disp: 	2c0c: 00000000              
[  598.187045] nouveau 0000:01:00.0: disp: 	2c14: 00000011              
[  598.187049] nouveau 0000:01:00.0: disp: 	2c18: 00000000              
[  598.187054] nouveau 0000:01:00.0: disp: 	2c1c: 00000000              
[  598.187060] nouveau 0000:01:00.0: disp: 	2c20: 00000000              
[  598.187067] nouveau 0000:01:00.0: disp: 	2c28: 00000000              
[  598.187071] nouveau 0000:01:00.0: disp: 	2c2c: 04000400              
[  598.187076] nouveau 0000:01:00.0: disp: 	2c30: 00001000              
[  598.187080] nouveau 0000:01:00.0: disp: 	2c38: 00000001              
[  598.187084] nouveau 0000:01:00.0: disp: 	2c3c: 00000005              
[  598.187089] nouveau 0000:01:00.0: disp: 	2c48: 00000000              
[  598.187093] nouveau 0000:01:00.0: disp: 	2c4c: 00000000              
[  598.187098] nouveau 0000:01:00.0: disp: 	2c50: 00000000              
[  598.187103] nouveau 0000:01:00.0: disp: 	2c54: 00000000              
[  598.187107] nouveau 0000:01:00.0: disp: 	2c58: 00000000              
[  598.187112] nouveau 0000:01:00.0: disp: 	2c5c: 00000000              
[  598.187116] nouveau 0000:01:00.0: disp: 	2c60: 00000000              
[  598.187121] nouveau 0000:01:00.0: disp: 	2c64: 00050008              
[  598.187126] nouveau 0000:01:00.0: disp: 	2c68: 00000000              
[  598.187130] nouveau 0000:01:00.0: disp: 	2c6c: 00010003              
[  598.187135] nouveau 0000:01:00.0: disp: 	2c70: 00030004              
[  598.187141] nouveau 0000:01:00.0: disp: 	2c74: 00000001              
[  598.187149] nouveau 0000:01:00.0: disp: 	2c78: 00000000              
[  598.187154] nouveau 0000:01:00.0: disp: 	2c7c: 00000000              
[  598.187161] nouveau 0000:01:00.0: disp: 	2c80: 00000000              
[  598.187166] nouveau 0000:01:00.0: disp: 	2c88: 00000000              
[  598.187170] nouveau 0000:01:00.0: disp: 	2c90: 00000000              
[  598.187175] nouveau 0000:01:00.0: disp: 	2c9c: 000000e9              
[  598.187180] nouveau 0000:01:00.0: disp: 	2ca0: 000002ff              
[  598.187184] nouveau 0000:01:00.0: disp: 	2ca4: 00000000              
[  598.187189] nouveau 0000:01:00.0: disp: 	2ca8: 00000000              
[  598.187193] nouveau 0000:01:00.0: disp: 	2cac: 00000000              
[  598.187198] nouveau 0000:01:00.0: disp: 	2d80: 00000000              
[  598.187202] nouveau 0000:01:00.0: disp: 	2d84: 00000000              
[  598.187207] nouveau 0000:01:00.0: disp: 	2d8c: 00000000              
[  598.187212] nouveau 0000:01:00.0: disp: 	2d94: 00000000              
[  598.187216] nouveau 0000:01:00.0: disp: 	2d98: 00000000              
[  598.187221] nouveau 0000:01:00.0: disp: 	2d9c: 00000000              
[  598.187229] nouveau 0000:01:00.0: disp: 	2da0: 00000000              
[  598.187235] nouveau 0000:01:00.0: disp: 	2da4: 00000000              
[  598.187241] nouveau 0000:01:00.0: disp: 	2e14: 00000000              
[  598.187246] nouveau 0000:01:00.0: disp: 	2e18: 00010002              
[  598.187342] nouveau 0000:01:00.0: disp: head-0: supervisor 1.0
[  598.187343] nouveau 0000:01:00.0: disp: head-0: nothing attached
[  598.187364] nouveau 0000:01:00.0: disp: supervisor 2: 00000010
[  598.187366] nouveau 0000:01:00.0: disp: head-0: 00011100
[  598.187369] nouveau 0000:01:00.0: disp: head-1: 00000000
[  598.187371] nouveau 0000:01:00.0: disp: head-2: 00000000
[  598.187374] nouveau 0000:01:00.0: disp: head-3: 00000000
[  598.187375] nouveau 0000:01:00.0: disp: head-0: supervisor 2.0
[  598.187376] nouveau 0000:01:00.0: disp: head-0: nothing attached
[  598.187377] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: acquire SOR-0
[  598.187379] nouveau 0000:01:00.0: disp: head-0: supervisor 2.1 - 154000 khz
[  598.187382] nouveau 0000:01:00.0: disp: head-0: supervisor 2.2
[  598.187383] nouveau 0000:01:00.0: disp: head-0: to SOR-0
[  598.187386] nouveau 0000:01:00.0: disp: 0x0000575b[0]: ZM_REG_SEQUENCE	0x02
[  598.187387] nouveau 0000:01:00.0: disp: 0x00005761[0]: 		R[0x6061c118] = 0x333a3a3a
[  598.18738] nouveau 0000:01:00.0: disp: 0x00005765[0]: 		R[0x6061c11c] = 0x0000003a
[  598.187389] nouveau 0000:01:00.0: disp: 0x00005769[0]: ZM_REG_SEQUENCE	0x02
[  598.187390] nouveau 0000:01:00.0: disp: 0x0000576f[0]: 		R[0x4061c198] = 0x333a3a3a
[  598.187391] nouveau 0000:01:00.0: disp: 0x00005773[0]: 		R[0x4061c19c] = 0x0000003a
[  598.187393] nouveau 0000:01:00.0: disp: 0x00005777[0]: ZM_REG	R[0x6061c120] = 0x00000000
[  598.187394] nouveau 0000:01:00.0: disp: 0x00005780[0]: ZM_REG	R[0x4061c1a0] = 0x00000000
[  598.187395] nouveau 0000:01:00.0: disp: 0x00005789[0]: SUB_DIRECT	0x51a7
[  598.187396] nouveau 0000:01:00.0: disp: 0x000051a7[1]: SUB_DIRECT	0x5240
[  598.187397] nouveau 0000:01:00.0: disp: 0x00005240[2]: NV_REG	R[0x4061c138] &= 0xfffff00c |= 0x00000442
[  598.187402] nouveau 0000:01:00.0: disp: 0x0000524d[2]: DONE
[  598.187403] nouveau 0000:01:00.0: disp: 0x000051aa[1]: ZM_REG_SEQUENCE	0x02
[  598.187404] nouveau 0000:01:00.0: disp: 0x000051b0[1]: 		R[0x4061c00c] = 0x05050000
[  598.187407] nouveau 0000:01:00.0: disp: 0x000051b4[1]: 		R[0x4061c010] = 0x00000d00
[  598.187408] nouveau 0000:01:00.0: disp: 0x000051b8[1]: NV_REG	R[0x4061c1b8] &= 0x01fff0ff |= 0x48000500
[  598.187412] nouveau 0000:01:00.0: disp: 0x000051c5[1]: ZM_REG_SEQUENCE	0x02
[  598.187413] nouveau 0000:01:00.0: disp: 0x000051cb[1]: 		R[0x4061c014] = 0x00020000
[  598.187414] nouveau 0000:01:00.0: disp: 0x000051cf[1]: 		R[0x4061c018] = 0x00245af8
[  598.187415] nouveau 0000:01:00.0: disp: 0x000051d3[1]: SUB_DIRECT	0x524e
[  598.187416] nouveau 0000:01:00.0: disp: 0x0000524e[2]: TIME	0x0032
[  598.187466] nouveau 0000:01:00.0: disp: 0x00005251[2]: ZM_REG	R[0x4061c138] = 0x38000440
[  598.187468] nouveau 0000:01:00.0: disp: 0x0000525a[2]: DONE
[  598.187469] nouveau 0000:01:00.0: disp: 0x000051d6[1]: SUB_DIRECT	0x50ed
[  598.187469] nouveau 0000:01:00.0: disp: 0x000050ed[2]: NV_REG	R[0x4061c200] &= 0xffffdfff |= 0x00002000
[  598.187473] nouveau 0000:01:00.0: disp: 0x000050fa[2]: NV_REG	R[0x40612300] &= 0xfffcffff |= 0x00030000
[  598.187478] nouveau 0000:01:00.0: disp: 0x00005107[2]: NV_REG	R[0x4061c1b0] &= 0xff7fffff |= 0x00000000
[  598.187482] nouveau 0000:01:00.0: disp: 0x00005114[2]: DONE
[  598.187483] nouveau 0000:01:00.0: disp: 0x000051d9[1]: DONE
[  598.187484] nouveau 0000:01:00.0: disp: 0x0000578c[0]: SUB_DIRECT	0x41e3
[  598.187485] nouveau 0000:01:00.0: disp: 0x000041e3[1]: NV_REG	R[0x612488] &= 0xffffffdf |= 0x00000000
[  598.187488] nouveau 0000:01:00.0: disp: 0x000041f0[1]: NV_REG	R[0x612408] &= 0xfffff0ff |= 0x00000800
[  598.187492] nouveau 0000:01:00.0: disp: 0x000041fd[1]: TIME	0x0064
[  598.187593] nouveau 0000:01:00.0: disp: 0x00004200[1]: CONDITION	0x02
[  598.187594] nouveau 0000:01:00.0: disp: 0x00004202[1]: 	[0x02] (R[0x612408] & 0x00000080) == 0x00000080
[  598.187598] nouveau 0000:01:00.0: disp: 0x00004202[1]: ANDN_REG	R[0x612408] &= ~0x00000800
[  598.187600] nouveau 0000:01:00.0: disp: 0x0000420b[1]: RESUME
[  598.187601] nouveau 0000:01:00.0: disp: 0x0000420c[1]: OR_REG	R[0x612408] |= 0x00000400
[  598.187603] nouveau 0000:01:00.0: disp: 0x00004215[1]: TIME	0x0064
[  598.187703] nouveau 0000:01:00.0: disp: 0x00004218[1]: CONDITION	0x02
[  598.187704] nouveau 0000:01:00.0: disp: 0x0000421a[1]: 	[0x02] (R[0x612408] & 0x00000080) == 0x00000080
[  598.187707] nouveau 0000:01:00.0: disp: 0x0000421a[ ]: ANDN_REG	R[0x612408] &= ~0x00000400
[  598.187708] nouveau 0000:01:00.0: disp: 0x00004223[ ]: RESUME
[  598.187709] nouveau 0000:01:00.0: disp: 0x00004224[1]: OR_REG	R[0x612408] |= 0x00000200
[  598.187712] nouveau 0000:01:00.0: disp: 0x0000422d[1]: TIME	0x0064
[  598.187812] nouveau 0000:01:00.0: disp: 0x00004230[1]: CONDITION	0x02
[  598.187814] nouveau 0000:01:00.0: disp: 0x00004232[1]: 	[0x02] (R[0x612408] & 0x00000080) == 0x00000080
[  598.187816] nouveau 0000:01:00.0: disp: 0x00004232[ ]: ANDN_REG	R[0x612408] &= ~0x00000200
[  598.187818] nouveau 0000:01:00.0: disp: 0x0000423b[ ]: RESUME
[  598.187819] nouveau 0000:01:00.0: disp: 0x0000423c[1]: OR_REG	R[0x612408] |= 0x00000100
[  598.187822] nouveau 0000:01:00.0: disp: 0x00004245[1]: TIME	0x0064
[  598.187922] nouveau 0000:01:00.0: disp: 0x00004248[1]: CONDITION	0x02
[  598.187923] nouveau 0000:01:00.0: disp: 0x0000424a[1]: 	[0x02] (R[0x612408] & 0x00000080) == 0x00000080
[  598.187926] nouveau 0000:01:00.0: disp: 0x0000424a[1]: ANDN_REG	R[0x612408] &= ~0x00000100
[  598.187928] nouveau 0000:01:00.0: disp: 0x00004253[1]: RESUME
[  598.187929] nouveau 0000:01:00.0: disp: 0x00004254[1]: CONDITION	0x34
[  598.187930] nouveau 0000:01:00.0: disp: 0x00004256[1]: 	[0x34] (R[0x625488] & 0x00020000) == 0x00000000
[  598.187933] nouveau 0000:01:00.0: disp: 0x00004256[1]: COPY_NV_REG	R[0x612488] &= 0xfffff0ff |= ((R[0x612408] >> 0x00) & 0x00000f00 ^ 0x00000000)
[  598.187939] nouveau 0000:01:00.0: disp: 0x0000426c[1]: RESUME
[  598.187940] nouveau 0000:01:00.0: disp: 0x0000426d[1]: DONE
[  598.187940] nouveau 0000:01:00.0: disp: 0x0000578f[0]: SUB_DIRECT	0x57eb
[  598.187941] nouveau 0000:01:00.0: disp: 0x000057eb[1]: NV_REG	R[0x6061c130] &= 0xffff0fff |= 0x00002000
[  598.187945] nouveau 0000:01:00.0: disp: 0x000057f8[1]: NV_REG	R[0x4061c1b0] &= 0xffff0fff |= 0x00002000
[  598.187948] nouveau 0000:01:00.0: disp: 0x00005805[1]: SUB_DIRECT	0x5115
[  598.187949] nouveau 0000:01:00.0: disp: 0x00005115[2]: SUB_DIRECT	0x5bdd
[  598.187950] nouveau 0000:01:00.0: disp: 0x00005bdd[3]: ZM_REG_SEQUENCE	0x10
[  598.187951] nouveau 0000:01:00.0: disp: 0x00005be3[3]: 		R[0x4061c040] = 0x030b0000
[  598.187952] nouveau 0000:01:00.0: disp: 0x00005be7[3]: 		R[0x4061c044] = 0x020a0000
[  598.187953] nouveau 0000:01:00.0: disp: 0x00005beb[3]: 		R[0x4061c048] = 0x02080000
[  598.187954] nouveau 0000:01:00.0: disp: 0x00005bef[3]: 		R[0x4061c04c] = 0x02042000
[  598.187955] nouveau 0000:01:00.0: disp: 0x00005bf3[3]: 		R[0x4061c050] = 0x00008000
[  598.187956] nouveau 0000:01:00.0: disp: 0x00005bf7[3]: 		R[0x4061c054] = 0x00008000
[  598.187957] nouveau 0000:01:00.0: disp: 0x00005bfb[3]: 		R[0x4061c058] = 0x00008000
[  598.187958] nouveau 0000:01:00.0: disp: 0x00005bff[3]: 		R[0x4061c05c] = 0x00008000
[  598.187959] nouveau 0000:01:00.0: disp: 0x00005c03[3]: 		R[0x4061c060] = 0x00002000
[  598.187960] nouveau 0000:01:00.0: disp: 0x00005c07[3]: 		R[0x4061c064] = 0x03002000
[  598.187961] nouveau 0000:01:00.0: disp: 0x00005c0b[3]: 		R[0x4061c068] = 0x030c0000
[  598.187962] nouveau 0000:01:00.0: disp: 0x00005c0f[3]: 		R[0x4061c06c] = 0x030a0000
[  598.187963] nouveau 0000:01:00.0: disp: 0x00005c13[3]: 		R[0x4061c070] = 0x030b8000
[  598.187964] nouveau 0000:01:00.0: disp: 0x00005c17[3]: 		R[0x4061c074] = 0x030b8000
[  598.187965] nouveau 0000:01:00.0: disp: 0x00005c1b[3]: 		R[0x4061c078] = 0x030b8000
[  598.187966] nouveau 0000:01:00.0: disp: 0x00005c1f[3]: 		R[0x4061c07c] = 0x030b8000
[  598.187967] nouveau 0000:01:00.0: disp: 0x00005c23[3]: DONE
[  598.187968] nouveau 0000:01:00.0: disp: 0x00005118[2]: NV_REG	R[0x4061c130] &= 0xffbff0ff |= 0x00400600
[  598.187971] nouveau 0000:01:00.0: disp: 0x00005125[2]: NV_REG	R[0x4061c1b0] &= 0xff3ff0ff |= 0x00c00600
[  598.187976] nouveau 0000:01:00.0: disp: 0x00005132[2]: NV_REG	R[0x40612300] &= 0xfcffffff |= 0x00000000
[  598.187980] nouveau 0000:01:00.0: disp: 0x0000513f[2]: NV_REG	R[0x4061c1b8] &= 0x7fffffff |= 0x80000000
[  598.187984] nouveau 0000:01:00.0: disp: 0x0000514c[2]: DONE
[  598.187984] nouveau 0000:01:00.0: disp: 0x00005808[1]: DONE
[  598.187985] nouveau 0000:01:00.0: disp: 0x00005792[0]: DONE
[  598.188264] nouveau 0000:01:00.0: disp: supervisor 3: 00000010
[  598.188267] nouveau 0000:01:00.0: disp: head-0: 00011100
[  598.188269] nouveau 0000:01:00.0: disp: head-1: 00000000
[  598.188272] nouveau 0000:01:00.0: disp: head-2: 00000000
[  598.188275] nouveau 0000:01:00.0: disp: head-3: 00000000
[  598.188276] nouveau 0000:01:00.0: disp: head-0: supervisor 3.0
[  598.188277] nouveau 0000:01:00.0: disp: head-0: to SOR-0
[  598.188278] nouveau 0000:01:00.0: disp: 0x0000514d[0]: SUB_DIRECT	0x5154
[  598.188279] nouveau 0000:01:00.0: disp: 0x00005154[1]: CONDITION_TIME	0x00 0xff
[  598.188280] nouveau 0000:01:00.0: disp: 0x00005157[1]: 	[0x00] (R[0x4061c030] & 0x10000000) == 0x00000000
[  598.188283] nouveau 0000:01:00.0: disp: 0x00005157[1]: RESUME
[  598.188283] nouveau 0000:01:00.0: disp: 0x00005158[1]: DONE
[  598.188284] nouveau 0000:01:00.0: disp: 0x00005150[0]: SUB_DIRECT	0x5159
[  598.188285] nouveau 0000:01:00.0: disp: 0x00005159[1]: NV_REG	R[0x4061c10c] &= 0xfffffffe |= 0x00000000
[  598.188288] nouveau 0000:01:00.0: disp: 0x00005166[1]: NV_REG	R[0x80616540] &= 0xfffffffe |= 0x00000000
[  598.188291] nouveau 0000:01:00.0: disp: 0x00005173[1]: DONE
[  598.188292] nouveau 0000:01:00.0: disp: 0x00005153[0]: DONE

-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/  
