Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF5374B35
	for <lists+nouveau@lfdr.de>; Thu,  6 May 2021 00:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7E86EC74;
	Wed,  5 May 2021 22:23:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 2484 seconds by postgrey-1.36 at gabe;
 Wed, 05 May 2021 22:23:51 UTC
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE236EC73
 for <nouveau@lists.freedesktop.org>; Wed,  5 May 2021 22:23:51 +0000 (UTC)
Received: from c-24-5-124-255.hsd1.ca.comcast.net ([24.5.124.255]:34298
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1lePHn-0000Ot-9u by authid <merlins.org> with srv_auth_plain;
 Wed, 05 May 2021 14:42:27 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1lePHn-0004CR-35; Wed, 05 May 2021 14:42:27 -0700
Date: Wed, 5 May 2021 14:42:27 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20210505214227.GA11517@merlins.org>
References: <20210129005626.GP29348@merlins.org>
 <20210129212032.GA99457@bjorn-Precision-5520>
 <20210130020411.GZ29348@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130020411.GZ29348@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 24.5.124.255
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: [Nouveau] 5.12.1 0010:nvkm_falcon_v1_wait_for_halt+0x8f/0xb9
 [nouveau]
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
Cc: nouveau@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Howdy,
I upgraded my thinkpad P73 from 5.9 to 5.12, and I now get this new
ug at boot (although the system does continue booting and display works
since I use i915 for display and only use nouveau for PM)

Short:
[   18.561181] WARNING: CPU: 15 PID: 220 at drivers/gpu/drm/nouveau/nvkm/falcon/v1.c:247 nvkm_falcon_v1_wait_for_halt+0x8f/0xb9 [nouveau]
[   18.561300] Modules linked in: dm_crypt trusted tpm rng_core dm_mod raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx multipath sata_sil24 r8169 realtek mdio_devres libphy mii hid_generic usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel xhci_pci rtsx_pci_sdmmc nouveau ghash_clmulni_intel xhci_hcd mmc_core e1000e i2c_designware_platform mxm_wmi i2c_designware_core hwmon ptp aesni_intel intel_lpss_pci drm_ttm_helper i2c_i801 crypto_simd intel_lpss i2c_smbus psmouse i915 cryptd pps_core thunderbolt rtsx_pci idma64 usbcore ttm i2c_nvidia_gpu thermal wmi battery
[   18.561636] CPU: 15 PID: 220 Comm: kworker/15:2 Tainted: G     U            5.12.1-amd64-preempt-sysrq-20190817 #1
[   18.561707] Hardware name: LENOVO 20QRS00200/20QRS00200, BIOS N2NET40W (1.25 ) 08/26/2020
[   18.561765] Workqueue: pm pm_runtime_work
[   18.561799] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x8f/0xb9 [nouveau]

Despite the warning, chip seems to go to sleep on batteries, poewertop
shows an encouraging low battery use (my lowest one yet of any kernel):
The battery reports a discharge rate of 10.7 W
The power consumed was 230 J

So it seems that what I need from nouveau is working (power management)

Full warning below with logs


Long:
[    0.000000] Linux version 5.12.1-amd64-preempt-sysrq-20190817 (root@sauron.svh.merlins.org) (gcc (Debian 10.2.1-3) 10.2.1 20201224, GNU ld (GNU Binutils for Debian) 2.35.1) #1 SMP PREEMPT Wed May 5 13:05:02 PDT 2021
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-5.12.1-amd64-preempt-sysrq-20190817 root=/dev/mapper/cryptroot ro rootflags=subvol=root cryptopts=source=/dev/nvme0n1p7,keyscript=/sbin/cryptgetpw usbcore.autosuspend=1 pcie_aspm=force resume=/dev/dm-1 acpi_backlight=vendor nouveau.debug=disp=trace
[    8.672663] nouveau 0000:01:00.0: runtime IRQ mapping not provided by arch
[    8.677434] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    8.691872] nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
[    8.789240] nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c
[    8.789605] nouveau 0000:01:00.0: pmu: firmware unavailable
[    8.789897] nouveau 0000:01:00.0: enabling bus mastering
[    8.789978] nouveau 0000:01:00.0: disp: preinit running...
[    8.789981] nouveau 0000:01:00.0: disp: preinit completed in 0us
[    8.789997] nouveau 0000:01:00.0: disp: fini running...
[    8.789999] nouveau 0000:01:00.0: disp: fini completed in 0us
[    8.790189] nouveau 0000:01:00.0: fb: 8192 MiB GDDR6
[    8.800113] nouveau 0000:01:00.0: disp: init running...
[    8.800116] nouveau 0000:01:00.0: disp: init skipped, engine has no users
[    8.800118] nouveau 0000:01:00.0: disp: init completed in 2us
[    8.801512] nouveau 0000:01:00.0: DRM: VRAM: 8192 MiB
[    8.801515] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    8.801517] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    8.801520] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    8.801521] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    8.801525] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    8.801527] nouveau 0000:01:00.0: DRM: DCB outp 00: 02800f66 04600020
[    8.801529] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f52 00020010
[    8.801531] nouveau 0000:01:00.0: DRM: DCB outp 02: 01022f36 04600010
[    8.801533] nouveau 0000:01:00.0: DRM: DCB outp 03: 04033f76 04600010
[    8.801535] nouveau 0000:01:00.0: DRM: DCB outp 04: 04044f86 04600020
[    8.801537] nouveau 0000:01:00.0: DRM: DCB conn 00: 00020047
[    8.801539] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    8.801541] nouveau 0000:01:00.0: DRM: DCB conn 02: 00001248
[    8.801543] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000348
[    8.801543] nouveau 0000:01:00.0: DRM: DCB conn 04: 02000471
[    8.802234] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    8.802255] nouveau 0000:01:00.0: disp: init running...
[    8.802257] nouveau 0000:01:00.0: disp: one-time init running...
[    8.802259] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: type 06 loc 0 or 2 link 2 con 0 edid 6 bus 0 head f
[    8.802265] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: bios dp 42 13 00 00
[    8.802268] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: type 02 loc 0 or 2 link 1 con 1 edid 5 bus 1 head f
[    8.802272] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: type 06 loc 0 or 1 link 1 con 2 edid 3 bus 2 head f
[    8.802276] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: bios dp 42 13 00 00
[    8.802279] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: type 06 loc 0 or 4 link 1 con 3 edid 7 bus 3 head f
[    8.802283] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: bios dp 42 13 00 00
[    8.802285] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: type 06 loc 0 or 4 link 2 con 4 edid 8 bus 4 head f
[    8.802290] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: bios dp 42 13 00 00
[    8.802293] nouveau 0000:01:00.0: disp: conn 00:0047: type 47 loc 0 hpd 08 dp 0 di 0 sr 0 lcdid 0
[    8.802298] nouveau 0000:01:00.0: disp: conn 00:0047: func 52 (HPD)
[    8.802300] nouveau 0000:01:00.0: disp: conn 01:0161: type 61 loc 1 hpd 04 dp 0 di 0 sr 0 lcdid 0
[    8.802305] nouveau 0000:01:00.0: disp: conn 01:0161: func 51 (HPD)
[    8.802307] nouveau 0000:01:00.0: disp: conn 02:0248: type 48 loc 2 hpd 01 dp 0 di 0 sr 0 lcdid 0
[    8.802311] nouveau 0000:01:00.0: disp: conn 02:0248: func 07 (HPD)
[    8.802313] nouveau 0000:01:00.0: disp: conn 03:0348: type 48 loc 3 hpd 10 dp 0 di 0 sr 0 lcdid 0
[    8.802317] nouveau 0000:01:00.0: disp: conn 03:0348: func 5e (HPD)
[    8.802319] nouveau 0000:01:00.0: disp: conn 04:0471: type 71 loc 4 hpd 20 dp 0 di 0 sr 0 lcdid 0
[    8.802324] nouveau 0000:01:00.0: disp: conn 04:0471: func 5f (HPD)
[    8.802329] nouveau 0000:01:00.0: disp: Window(s): 8 (000000ff)
[    8.802334] nouveau 0000:01:00.0: disp:   Head(s): 4 (0f)
[    8.802338] nouveau 0000:01:00.0: disp: head-0: ctor
[    8.802341] nouveau 0000:01:00.0: disp: head-1: ctor
[    8.802345] nouveau 0000:01:00.0: disp: head-2: ctor
[    8.802348] nouveau 0000:01:00.0: disp: head-3: ctor
[    8.802352] nouveau 0000:01:00.0: disp:    SOR(s): 4 (0f)
[    8.802356] nouveau 0000:01:00.0: disp: SOR-0: ctor
[    8.802360] nouveau 0000:01:00.0: disp: SOR-1: ctor
[    8.802364] nouveau 0000:01:00.0: disp: SOR-2: ctor
[    8.802367] nouveau 0000:01:00.0: disp: SOR-3: ctor
[    8.802387] nouveau 0000:01:00.0: disp: one-time init completed in 129us
[    8.802440] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: no route
[    9.112902] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> always
[    9.112987] nouveau 0000:01:00.0: disp: outp 00:0006:0f82: aux power -> demand
[    9.113021] nouveau 0000:01:00.0: disp: outp 01:0002:0f42: no route
[    9.113034] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: no route
[    9.113059] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> always
[    9.113093] nouveau 0000:01:00.0: disp: outp 02:0006:0f41: aux power -> demand
[    9.113119] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: no route
[    9.113141] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> always
[    9.113175] nouveau 0000:01:00.0: disp: outp 03:0006:0f44: aux power -> demand
[    9.113202] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: no route
[    9.113224] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> always
[    9.113258] nouveau 0000:01:00.0: disp: outp 04:0006:0f84: aux power -> demand
[    9.113665] nouveau 0000:01:00.0: disp: init completed in 311407us
[    9.205451] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[    9.205682] nouveau 0000:01:00.0: disp: supervisor 1: 00000000
[    9.205707] nouveau 0000:01:00.0: disp: head-0: 00000000
[    9.205720] nouveau 0000:01:00.0: disp: head-1: 00000000
[    9.205732] nouveau 0000:01:00.0: disp: head-2: 00000000
[    9.205742] nouveau 0000:01:00.0: disp: head-3: 00000000
[    9.205751] nouveau 0000:01:00.0: disp: Core:
[    9.205764] nouveau 0000:01:00.0: disp: 	0200: 7efebfff -> 00000001
[    9.205781] nouveau 0000:01:00.0: disp: 	0208: 00000000 -> f0000000
[    9.205795] nouveau 0000:01:00.0: disp: 	020c: 00000000 -> 00001000
[    9.205810] nouveau 0000:01:00.0: disp: 	0210: 00000000              
[    9.205824] nouveau 0000:01:00.0: disp: 	0214: 00000000              
[    9.205837] nouveau 0000:01:00.0: disp: 	0218: 00000000              
[    9.205851] nouveau 0000:01:00.0: disp: 	021c: 00000000              
[    9.205862] nouveau 0000:01:00.0: disp: Core - SOR 0:
[    9.205874] nouveau 0000:01:00.0: disp: 	0300: 00000100              
[    9.205889] nouveau 0000:01:00.0: disp: 	0304: 00000000              
[    9.205903] nouveau 0000:01:00.0: disp: 	0308: 00000000              
[    9.205918] nouveau 0000:01:00.0: disp: 	030c: 00000000              
[    9.205928] nouveau 0000:01:00.0: disp: Core - SOR 1:
[    9.205940] nouveau 0000:01:00.0: disp: 	0320: 00000100              
[    9.205954] nouveau 0000:01:00.0: disp: 	0324: 00000000              
[    9.205967] nouveau 0000:01:00.0: disp: 	0328: 00000000              
[    9.205981] nouveau 0000:01:00.0: disp: 	032c: 00000000              
[    9.205991] nouveau 0000:01:00.0: disp: Core - SOR 2:
[    9.206003] nouveau 0000:01:00.0: disp: 	0340: 00000100              
[    9.206017] nouveau 0000:01:00.0: disp: 	0344: 00000000              
[    9.206030] nouveau 0000:01:00.0: disp: 	0348: 00000000              
[    9.206044] nouveau 0000:01:00.0: disp: 	034c: 00000000              
[    9.206054] nouveau 0000:01:00.0: disp: Core - SOR 3:
[    9.206065] nouveau 0000:01:00.0: disp: 	0360: 00000100              
[    9.206078] nouveau 0000:01:00.0: disp: 	0364: 00000000              
[    9.206091] nouveau 0000:01:00.0: disp: 	0368: 00000000              
[    9.206104] nouveau 0000:01:00.0: disp: 	036c: 00000000              
[    9.206115] nouveau 0000:01:00.0: disp: Core - WINDOW 0:
[    9.206127] nouveau 0000:01:00.0: disp: 	1000: 0000000f -> 00000000
[    9.206142] nouveau 0000:01:00.0: disp: 	1004: 000003b7 -> 0000000f
[    9.206156] nouveau 0000:01:00.0: disp: 	1008: 00000000              
[    9.206171] nouveau 0000:01:00.0: disp: 	100c: 04000400              
[    9.206186] nouveau 0000:01:00.0: disp: 	1010: 00100000 -> 00117fff
[    9.206197] nouveau 0000:01:00.0: disp: Core - WINDOW 1:
[    9.206209] nouveau 0000:01:00.0: disp: 	1080: 0000000f -> 00000000
[    9.206223] nouveau 0000:01:00.0: disp: 	1084: 000003b7 -> 0000000f
[    9.206237] nouveau 0000:01:00.0: disp: 	1088: 00000000              
[    9.206250] nouveau 0000:01:00.0: disp: 	108c: 04000400              
[    9.206265] nouveau 0000:01:00.0: disp: 	1090: 00100000 -> 00117fff
[    9.206275] nouveau 0000:01:00.0: disp: Core - WINDOW 2:
[    9.206287] nouveau 0000:01:00.0: disp: 	1100: 0000000f -> 00000001
[    9.206300] nouveau 0000:01:00.0: disp: 	1104: 000003b7 -> 0000000f
[    9.206313] nouveau 0000:01:00.0: disp: 	1108: 00000000              
[    9.206327] nouveau 0000:01:00.0: disp: 	110c: 04000400              
[    9.206341] nouveau 0000:01:00.0: disp: 	1110: 00100000 -> 00117fff
[    9.206351] nouveau 0000:01:00.0: disp: Core - WINDOW 3:
[    9.206362] nouveau 0000:01:00.0: disp: 	1180: 0000000f -> 00000001
[    9.206375] nouveau 0000:01:00.0: disp: 	1184: 000003b7 -> 0000000f
[    9.206389] nouveau 0000:01:00.0: disp: 	1188: 00000000              
[    9.206403] nouveau 0000:01:00.0: disp: 	118c: 04000400              
[    9.206417] nouveau 0000:01:00.0: disp: 	1190: 00100000 -> 00117fff
[    9.206427] nouveau 0000:01:00.0: disp: Core - WINDOW 4:
[    9.206440] nouveau 0000:01:00.0: disp: 	1200: 0000000f -> 00000002
[    9.206455] nouveau 0000:01:00.0: disp: 	1204: 000003b7 -> 0000000f
[    9.206469] nouveau 0000:01:00.0: disp: 	1208: 00000000              
[    9.206481] nouveau 0000:01:00.0: disp: 	120c: 04000400              
[    9.206495] nouveau 0000:01:00.0: disp: 	1210: 00100000 -> 00117fff
[    9.206505] nouveau 0000:01:00.0: disp: Core - WINDOW 5:
[    9.206517] nouveau 0000:01:00.0: disp: 	1280: 0000000f -> 00000002
[    9.206531] nouveau 0000:01:00.0: disp: 	1284: 000003b7 -> 0000000f
[    9.206544] nouveau 0000:01:00.0: disp: 	1288: 00000000              
[    9.206558] nouveau 0000:01:00.0: disp: 	128c: 04000400              
[    9.206571] nouveau 0000:01:00.0: disp: 	1290: 00100000 -> 00117fff
[    9.206582] nouveau 0000:01:00.0: disp: Core - WINDOW 6:
[    9.206594] nouveau 0000:01:00.0: disp: 	1300: 0000000f -> 00000003
[    9.206607] nouveau 0000:01:00.0: disp: 	1304: 000003b7 -> 0000000f
[    9.206620] nouveau 0000:01:00.0: disp: 	1308: 00000000              
[    9.206635] nouveau 0000:01:00.0: disp: 	130c: 04000400              
[    9.206650] nouveau 0000:01:00.0: disp: 	1310: 00100000 -> 00117fff
[    9.206660] nouveau 0000:01:00.0: disp: Core - WINDOW 7:
[    9.206672] nouveau 0000:01:00.0: disp: 	1380: 0000000f -> 00000003
[    9.206685] nouveau 0000:01:00.0: disp: 	1384: 000003b7 -> 0000000f
[    9.206699] nouveau 0000:01:00.0: disp: 	1388: 00000000              
[    9.206713] nouveau 0000:01:00.0: disp: 	138c: 04000400              
[    9.206727] nouveau 0000:01:00.0: disp: 	1390: 00100000 -> 00117fff
[    9.206737] nouveau 0000:01:00.0: disp: Core - HEAD 0:
[    9.206748] nouveau 0000:01:00.0: disp: 	2000: 00000000              
[    9.206762] nouveau 0000:01:00.0: disp: 	2004: fc000040              
[    9.206776] nouveau 0000:01:00.0: disp: 	2008: 00000180              
[    9.206790] nouveau 0000:01:00.0: disp: 	200c: 00000000              
[    9.206804] nouveau 0000:01:00.0: disp: 	2014: 00000011              
[    9.206818] nouveau 0000:01:00.0: disp: 	2018: 00000000              
[    9.206832] nouveau 0000:01:00.0: disp: 	201c: 00000000              
[    9.206846] nouveau 0000:01:00.0: disp: 	2020: 00000000              
[    9.206860] nouveau 0000:01:00.0: disp: 	2028: 00000000              
[    9.206874] nouveau 0000:01:00.0: disp: 	202c: 04000400              
[    9.206889] nouveau 0000:01:00.0: disp: 	2030: 00001000              
[    9.206903] nouveau 0000:01:00.0: disp: 	2038: 00000001              
[    9.206918] nouveau 0000:01:00.0: disp: 	203c: 00000005              
[    9.206933] nouveau 0000:01:00.0: disp: 	2048: 00000000              
[    9.206947] nouveau 0000:01:00.0: disp: 	204c: 00000000              
[    9.206960] nouveau 0000:01:00.0: disp: 	2050: 00000000              
[    9.206973] nouveau 0000:01:00.0: disp: 	2054: 00000000              
[    9.206986] nouveau 0000:01:00.0: disp: 	2058: 00000000              
[    9.206999] nouveau 0000:01:00.0: disp: 	205c: 00000000              
[    9.207013] nouveau 0000:01:00.0: disp: 	2060: 00000000              
[    9.207027] nouveau 0000:01:00.0: disp: 	2064: 00050008              
[    9.207041] nouveau 0000:01:00.0: disp: 	2068: 00000000              
[    9.207055] nouveau 0000:01:00.0: disp: 	206c: 00010003              
[    9.207069] nouveau 0000:01:00.0: disp: 	2070: 00030004              
[    9.207083] nouveau 0000:01:00.0: disp: 	2074: 00000001              
[    9.207098] nouveau 0000:01:00.0: disp: 	2078: 00000000              
[    9.207112] nouveau 0000:01:00.0: disp: 	207c: 00000000              
[    9.207127] nouveau 0000:01:00.0: disp: 	2080: 00000000              
[    9.207141] nouveau 0000:01:00.0: disp: 	2088: 00000000              
[    9.207156] nouveau 0000:01:00.0: disp: 	2090: 00000000              
[    9.207170] nouveau 0000:01:00.0: disp: 	209c: 000000e9              
[    9.207185] nouveau 0000:01:00.0: disp: 	20a0: 000002ff              
[    9.207200] nouveau 0000:01:00.0: disp: 	20a4: 00000000              
[    9.207212] nouveau 0000:01:00.0: disp: 	20a8: 00000000              
[    9.207225] nouveau 0000:01:00.0: disp: 	20ac: 00000000              
[    9.207239] nouveau 0000:01:00.0: disp: 	218c: 00000000              
[    9.207252] nouveau 0000:01:00.0: disp: 	2194: 00000000              
[    9.207266] nouveau 0000:01:00.0: disp: 	2198: 00000000              
[    9.207279] nouveau 0000:01:00.0: disp: 	219c: 00000000              
[    9.207292] nouveau 0000:01:00.0: disp: 	21a0: 00000000              
[    9.207307] nouveau 0000:01:00.0: disp: 	21a4: 00000000              
[    9.207320] nouveau 0000:01:00.0: disp: 	2214: 00000000              
[    9.207332] nouveau 0000:01:00.0: disp: 	2218: 00010002              
[    9.207343] nouveau 0000:01:00.0: disp: Core - HEAD 1:
[    9.207355] nouveau 0000:01:00.0: disp: 	2400: 00000000              
[    9.207369] nouveau 0000:01:00.0: disp: 	2404: fc000040              
[    9.207382] nouveau 0000:01:00.0: disp: 	2408: 00000180              
[    9.207396] nouveau 0000:01:00.0: disp: 	240c: 00000000              
[    9.207410] nouveau 0000:01:00.0: disp: 	2414: 00000011              
[    9.207425] nouveau 0000:01:00.0: disp: 	2418: 00000000              
[    9.207438] nouveau 0000:01:00.0: disp: 	241c: 00000000              
[    9.207451] nouveau 0000:01:00.0: disp: 	2420: 00000000              
[    9.207463] nouveau 0000:01:00.0: disp: 	2428: 00000000              
[    9.207476] nouveau 0000:01:00.0: disp: 	242c: 04000400              
[    9.207490] nouveau 0000:01:00.0: disp: 	2430: 00001000              
[    9.207504] nouveau 0000:01:00.0: disp: 	2438: 00000001              
[    9.207518] nouveau 0000:01:00.0: disp: 	243c: 00000005              
[    9.207531] nouveau 0000:01:00.0: disp: 	2448: 00000000              
[    9.207545] nouveau 0000:01:00.0: disp: 	244c: 00000000              
[    9.207559] nouveau 0000:01:00.0: disp: 	2450: 00000000              
[    9.207573] nouveau 0000:01:00.0: disp: 	2454: 00000000              
[    9.207587] nouveau 0000:01:00.0: disp: 	2458: 00000000              
[    9.207600] nouveau 0000:01:00.0: disp: 	245c: 00000000              
[    9.207613] nouveau 0000:01:00.0: disp: 	2460: 00000000              
[    9.207626] nouveau 0000:01:00.0: disp: 	2464: 00050008              
[    9.207640] nouveau 0000:01:00.0: disp: 	2468: 00000000              
[    9.207654] nouveau 0000:01:00.0: disp: 	246c: 00010003              
[    9.207668] nouveau 0000:01:00.0: disp: 	2470: 00030004              
[    9.207681] nouveau 0000:01:00.0: disp: 	2474: 00000001              
[    9.207695] nouveau 0000:01:00.0: disp: 	2478: 00000000              
[    9.207709] nouveau 0000:01:00.0: disp: 	247c: 00000000              
[    9.207724] nouveau 0000:01:00.0: disp: 	2480: 00000000              
[    9.207738] nouveau 0000:01:00.0: disp: 	2488: 00000000              
[    9.207753] nouveau 0000:01:00.0: disp: 	2490: 00000000              
[    9.207766] nouveau 0000:01:00.0: disp: 	249c: 000000e9              
[    9.207781] nouveau 0000:01:00.0: disp: 	24a0: 000002ff              
[    9.207794] nouveau 0000:01:00.0: disp: 	24a4: 00000000              
[    9.207807] nouveau 0000:01:00.0: disp: 	24a8: 00000000              
[    9.207821] nouveau 0000:01:00.0: disp: 	24ac: 00000000              
[    9.207834] nouveau 0000:01:00.0: disp: 	258c: 00000000              
[    9.207848] nouveau 0000:01:00.0: disp: 	2594: 00000000              
[    9.207861] nouveau 0000:01:00.0: disp: 	2598: 00000000              
[    9.207875] nouveau 0000:01:00.0: disp: 	259c: 00000000              
[    9.207888] nouveau 0000:01:00.0: disp: 	25a0: 00000000              
[    9.207901] nouveau 0000:01:00.0: disp: 	25a4: 00000000              
[    9.207914] nouveau 0000:01:00.0: disp: 	2614: 00000000              
[    9.207927] nouveau 0000:01:00.0: disp: 	2618: 00010002              
[    9.207937] nouveau 0000:01:00.0: disp: Core - HEAD 2:
[    9.207949] nouveau 0000:01:00.0: disp: 	2800: 00000000              
[    9.207963] nouveau 0000:01:00.0: disp: 	2804: fc000040              
[    9.207976] nouveau 0000:01:00.0: disp: 	2808: 00000180              
[    9.207991] nouveau 0000:01:00.0: disp: 	280c: 00000000              
[    9.208004] nouveau 0000:01:00.0: disp: 	2814: 00000011              
[    9.208019] nouveau 0000:01:00.0: disp: 	2818: 00000000              
[    9.208031] nouveau 0000:01:00.0: disp: 	281c: 00000000              
[    9.208044] nouveau 0000:01:00.0: disp: 	2820: 00000000              
[    9.208058] nouveau 0000:01:00.0: disp: 	2828: 00000000              
[    9.208071] nouveau 0000:01:00.0: disp: 	282c: 04000400              
[    9.208085] nouveau 0000:01:00.0: disp: 	2830: 00001000              
[    9.208099] nouveau 0000:01:00.0: disp: 	2838: 00000001              
[    9.208113] nouveau 0000:01:00.0: disp: 	283c: 00000005              
[    9.208126] nouveau 0000:01:00.0: disp: 	2848: 00000000              
[    9.208140] nouveau 0000:01:00.0: disp: 	284c: 00000000              
[    9.208153] nouveau 0000:01:00.0: disp: 	2850: 00000000              
[    9.208165] nouveau 0000:01:00.0: disp: 	2854: 00000000              
[    9.208178] nouveau 0000:01:00.0: disp: 	2858: 00000000              
[    9.208191] nouveau 0000:01:00.0: disp: 	285c: 00000000              
[    9.208205] nouveau 0000:01:00.0: disp: 	2860: 00000000              
[    9.208218] nouveau 0000:01:00.0: disp: 	2864: 00050008              
[    9.208232] nouveau 0000:01:00.0: disp: 	2868: 00000000              
[    9.208246] nouveau 0000:01:00.0: disp: 	286c: 00010003              
[    9.208259] nouveau 0000:01:00.0: disp: 	2870: 00030004              
[    9.208274] nouveau 0000:01:00.0: disp: 	2874: 00000001              
[    9.208289] nouveau 0000:01:00.0: disp: 	2878: 00000000              
[    9.208303] nouveau 0000:01:00.0: disp: 	287c: 00000000              
[    9.208318] nouveau 0000:01:00.0: disp: 	2880: 00000000              
[    9.208332] nouveau 0000:01:00.0: disp: 	2888: 00000000              
[    9.208345] nouveau 0000:01:00.0: disp: 	2890: 00000000              
[    9.208358] nouveau 0000:01:00.0: disp: 	289c: 000000e9              
[    9.208371] nouveau 0000:01:00.0: disp: 	28a0: 000002ff              
[    9.208385] nouveau 0000:01:00.0: disp: 	28a4: 00000000              
[    9.208398] nouveau 0000:01:00.0: disp: 	28a8: 00000000              
[    9.208412] nouveau 0000:01:00.0: disp: 	28ac: 00000000              
[    9.208425] nouveau 0000:01:00.0: disp: 	298c: 00000000              
[    9.208439] nouveau 0000:01:00.0: disp: 	2994: 00000000              
[    9.208452] nouveau 0000:01:00.0: disp: 	2998: 00000000              
[    9.208465] nouveau 0000:01:00.0: disp: 	299c: 00000000              
[    9.208478] nouveau 0000:01:00.0: disp: 	29a0: 00000000              
[    9.208491] nouveau 0000:01:00.0: disp: 	29a4: 00000000              
[    9.208504] nouveau 0000:01:00.0: disp: 	2a14: 00000000              
[    9.208517] nouveau 0000:01:00.0: disp: 	2a18: 00010002              
[    9.208528] nouveau 0000:01:00.0: disp: Core - HEAD 3:
[    9.208540] nouveau 0000:01:00.0: disp: 	2c00: 00000000              
[    9.208554] nouveau 0000:01:00.0: disp: 	2c04: fc000040              
[    9.208568] nouveau 0000:01:00.0: disp: 	2c08: 00000180              
[    9.208583] nouveau 0000:01:00.0: disp: 	2c0c: 00000000              
[    9.208597] nouveau 0000:01:00.0: disp: 	2c14: 00000011              
[    9.208610] nouveau 0000:01:00.0: disp: 	2c18: 00000000              
[    9.208623] nouveau 0000:01:00.0: disp: 	2c1c: 00000000              
[    9.208636] nouveau 0000:01:00.0: disp: 	2c20: 00000000              
[    9.208650] nouveau 0000:01:00.0: disp: 	2c28: 00000000              
[    9.208664] nouveau 0000:01:00.0: disp: 	2c2c: 04000400              
[    9.208677] nouveau 0000:01:00.0: disp: 	2c30: 00001000              
[    9.208691] nouveau 0000:01:00.0: disp: 	2c38: 00000001              
[    9.208722] nouveau 0000:01:00.0: disp: 	2c3c: 00000005              
[    9.208736] nouveau 0000:01:00.0: disp: 	2c48: 00000000              
[    9.208750] nouveau 0000:01:00.0: disp: 	2c4c: 00000000              
[    9.208764] nouveau 0000:01:00.0: disp: 	2c50: 00000000              
[    9.208777] nouveau 0000:01:00.0: disp: 	2c54: 00000000              
[    9.208790] nouveau 0000:01:00.0: disp: 	2c58: 00000000              
[    9.208803] nouveau 0000:01:00.0: disp: 	2c5c: 00000000              
[    9.208815] nouveau 0000:01:00.0: disp: 	2c60: 00000000              
[    9.208829] nouveau 0000:01:00.0: disp: 	2c64: 00050008              
[    9.208842] nouveau 0000:01:00.0: disp: 	2c68: 00000000              
[    9.208856] nouveau 0000:01:00.0: disp: 	2c6c: 00010003              
[    9.208870] nouveau 0000:01:00.0: disp: 	2c70: 00030004              
[    9.208884] nouveau 0000:01:00.0: disp: 	2c74: 00000001              
[    9.208897] nouveau 0000:01:00.0: disp: 	2c78: 00000000              
[    9.208911] nouveau 0000:01:00.0: disp: 	2c7c: 00000000              
[    9.208925] nouveau 0000:01:00.0: disp: 	2c80: 00000000              
[    9.208940] nouveau 0000:01:00.0: disp: 	2c88: 00000000              
[    9.208954] nouveau 0000:01:00.0: disp: 	2c90: 00000000              
[    9.208969] nouveau 0000:01:00.0: disp: 	2c9c: 000000e9              
[    9.208984] nouveau 0000:01:00.0: disp: 	2ca0: 000002ff              
[    9.208999] nouveau 0000:01:00.0: disp: 	2ca4: 00000000              
[    9.209014] nouveau 0000:01:00.0: disp: 	2ca8: 00000000              
[    9.209029] nouveau 0000:01:00.0: disp: 	2cac: 00000000              
[    9.209043] nouveau 0000:01:00.0: disp: 	2d8c: 00000000              
[    9.209058] nouveau 0000:01:00.0: disp: 	2d94: 00000000              
[    9.209073] nouveau 0000:01:00.0: disp: 	2d98: 00000000              
[    9.209087] nouveau 0000:01:00.0: disp: 	2d9c: 00000000              
[    9.209099] nouveau 0000:01:00.0: disp: 	2da0: 00000000              
[    9.209112] nouveau 0000:01:00.0: disp: 	2da4: 00000000              
[    9.209126] nouveau 0000:01:00.0: disp: 	2e14: 00000000              
[    9.209139] nouveau 0000:01:00.0: disp: 	2e18: 00010002              
[    9.209388] nouveau 0000:01:00.0: disp: supervisor 2: 00000010
[    9.209413] nouveau 0000:01:00.0: disp: head-0: 00000000
[    9.209426] nouveau 0000:01:00.0: disp: head-1: 00000000
[    9.209437] nouveau 0000:01:00.0: disp: head-2: 00000000
[    9.209448] nouveau 0000:01:00.0: disp: head-3: 00000000
[    9.209619] nouveau 0000:01:00.0: disp: supervisor 3: 00000010
[    9.209643] nouveau 0000:01:00.0: disp: head-0: 00000000
[    9.209656] nouveau 0000:01:00.0: disp: head-1: 00000000
[    9.209668] nouveau 0000:01:00.0: disp: head-2: 00000000
[    9.209679] nouveau 0000:01:00.0: disp: head-3: 00000000
[    9.210852] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 1
[    9.210885] nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
[    9.212755] usb 1-8: new high-speed USB device number 3 using xhci_hcd
[    9.296013] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[    9.382897] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   18.460917] nouveau 0000:01:00.0: disp: suspend running...
[   18.461005] nouveau 0000:01:00.0: disp: suspend completed in 41us
[   18.561101] ------------[ cut here ]------------
[   18.561138] nouveau 0000:01:00.0: timeout
[   18.561181] WARNING: CPU: 15 PID: 220 at drivers/gpu/drm/nouveau/nvkm/falcon/v1.c:247 nvkm_falcon_v1_wait_for_halt+0x8f/0xb9 [nouveau]
[   18.561300] Modules linked in: dm_crypt trusted tpm rng_core dm_mod raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx multipath sata_sil24 r8169 realtek mdio_devres libphy mii hid_generic usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel xhci_pci rtsx_pci_sdmmc nouveau ghash_clmulni_intel xhci_hcd mmc_core e1000e i2c_designware_platform mxm_wmi i2c_designware_core hwmon ptp aesni_intel intel_lpss_pci drm_ttm_helper i2c_i801 crypto_simd intel_lpss i2c_smbus psmouse i915 cryptd pps_core thunderbolt rtsx_pci idma64 usbcore ttm i2c_nvidia_gpu thermal wmi battery
[   18.561636] CPU: 15 PID: 220 Comm: kworker/15:2 Tainted: G     U            5.12.1-amd64-preempt-sysrq-20190817 #1
[   18.561707] Hardware name: LENOVO 20QRS00200/20QRS00200, BIOS N2NET40W (1.25 ) 08/26/2020
[   18.561765] Workqueue: pm pm_runtime_work
[   18.561799] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x8f/0xb9 [nouveau]
[   18.561874] Code: 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 eb 5c 43 e2 4c 89 e2 48 c7 c7 ef 95 33 c1 48 89 c6 e8 c4 b2 6e e2 <0f> 0b 85 db b8 00 00 00 00 0f 4e c3 48 8b 4c 24 28 65 48 2b 0c 25
[   18.561995] RSP: 0018:ffffb518007a7b08 EFLAGS: 00010286
[   18.562035] RAX: 0000000000000000 RBX: ffffffffffffff92 RCX: 0000000000000003
[   18.562086] RDX: 0000000000000850 RSI: 0000000000000001 RDI: ffffffffa4b25bac
[   18.562136] RBP: ffff89e351f0a058 R08: 0000000000000003 R09: 0000000000000001
[   18.562187] R10: 0000000000aaaaaa R11: ffffb51821e14440 R12: ffff89e34291c5a0
[   18.562238] R13: 0000000000000000 R14: ffff89e355782e00 R15: ffff89e3524cb000
[   18.562289] FS:  0000000000000000(0000) GS:ffff89f25c7c0000(0000) knlGS:0000000000000000
[   18.562345] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   18.562388] CR2: 000055ec245a00a8 CR3: 0000000545410006 CR4: 00000000003706e0
[   18.562439] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   18.562491] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   18.562542] Call Trace:
[   18.562569]  gm200_acr_hsfw_boot+0xc4/0x168 [nouveau]
[   18.562636]  nvkm_acr_hsf_boot+0xad/0x115 [nouveau]
[   18.565673]  nvkm_acr_fini+0x22/0x30 [nouveau]
[   18.568732]  nvkm_subdev_fini+0xb8/0xff [nouveau]
[   18.571775]  nvkm_device_fini+0x8b/0x178 [nouveau]
[   18.574834]  nvkm_udevice_fini+0x34/0x55 [nouveau]
[   18.577872]  nvkm_object_fini+0xeb/0x1d6 [nouveau]
[   18.580862]  nvkm_object_fini+0x8d/0x1d6 [nouveau]
[   18.584095]  nouveau_do_suspend+0x1fe/0x26f [nouveau]
[   18.587135]  nouveau_pmops_runtime_suspend+0x46/0x82 [nouveau]
[   18.590097]  pci_pm_runtime_suspend+0x5e/0x155
[   18.593013]  ? pci_pm_thaw_noirq+0x62/0x62
[   18.595914]  ? pci_pm_thaw_noirq+0x62/0x62
[   18.598802]  __rpm_callback+0x75/0xdb
[   18.601654]  ? pci_pm_thaw_noirq+0x62/0x62
[   18.604491]  rpm_callback+0x55/0x6b
[   18.607317]  rpm_suspend+0x2a6/0x4af
[   18.610117]  ? __raw_spin_unlock_irq+0x8/0x17
[   18.612901]  ? finish_task_switch.isra.0+0x136/0x214
[   18.615673]  pm_runtime_work+0x77/0x81
[   18.618428]  process_one_work+0x1ea/0x2e0
[   18.621156]  worker_thread+0x19c/0x240
[   18.624140]  ? rescuer_thread+0x294/0x294
[   18.626886]  kthread+0x10c/0x114
[   18.629567]  ? kthread_create_worker_on_cpu+0x65/0x65
[   18.632253]  ret_from_fork+0x1f/0x30
[   18.634949] ---[ end trace a858a74de695aa08 ]---
[   18.637620] nouveau 0000:01:00.0: acr: unload binary failed
[   18.913087] nouveau 0000:01:00.0: saving config space at offset 0x0 (reading 0x1eb610de)
[   18.913091] nouveau 0000:01:00.0: saving config space at offset 0x4 (reading 0x100407)
[   18.913093] nouveau 0000:01:00.0: saving config space at offset 0x8 (reading 0x30000a1)
[   18.913095] nouveau 0000:01:00.0: saving config space at offset 0xc (reading 0x800000)
[   18.913097] nouveau 0000:01:00.0: saving config space at offset 0x10 (reading 0xcd000000)
[   18.913099] nouveau 0000:01:00.0: saving config space at offset 0x14 (reading 0xa000000c)
[   18.913102] nouveau 0000:01:00.0: saving config space at offset 0x18 (reading 0x0)
[   18.913104] nouveau 0000:01:00.0: saving config space at offset 0x1c (reading 0xb000000c)
[   18.913106] nouveau 0000:01:00.0: saving config space at offset 0x20 (reading 0x0)
[   18.913108] nouveau 0000:01:00.0: saving config space at offset 0x24 (reading 0x2001)
[   18.913111] nouveau 0000:01:00.0: saving config space at offset 0x28 (reading 0x0)
[   18.913113] nouveau 0000:01:00.0: saving config space at offset 0x2c (reading 0x229b17aa)
[   18.913115] nouveau 0000:01:00.0: saving config space at offset 0x30 (reading 0xfff80000)
[   18.913117] nouveau 0000:01:00.0: saving config space at offset 0x34 (reading 0x60)
[   18.913119] nouveau 0000:01:00.0: saving config space at offset 0x38 (reading 0x0)
[   18.913122] nouveau 0000:01:00.0: saving config space at offset 0x3c (reading 0x1ff)
[   18.913179] nouveau 0000:01:00.0: power state changed by ACPI to D3cold
[   43.064748] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   43.064836] nouveau 0000:01:00.0: restoring config space at offset 0x3c (was 0x100, writing 0x1ff)
[   43.064845] nouveau 0000:01:00.0: restoring config space at offset 0x30 (was 0x0, writing 0xfff80000)
[   43.064853] nouveau 0000:01:00.0: restoring config space at offset 0x24 (was 0x1, writing 0x2001)
[   43.064860] nouveau 0000:01:00.0: restoring config space at offset 0x1c (was 0xc, writing 0xb000000c)
[   43.064868] nouveau 0000:01:00.0: restoring config space at offset 0x14 (was 0xc, writing 0xa000000c)
[   43.064874] nouveau 0000:01:00.0: restoring config space at offset 0x10 (was 0x0, writing 0xcd000000)
[   43.064883] nouveau 0000:01:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100407)
[   43.065008] nouveau 0000:01:00.0: disp: preinit running...
[   43.065038] nouveau 0000:01:00.0: disp: preinit completed in 0us
[   43.065200] nouveau 0000:01:00.0: disp: fini running...
[   43.065226] nouveau 0000:01:00.0: disp: fini completed in 2us
[   43.073510] nouveau 0000:01:00.0: fifo: fault 01 [VIRT_WRITE] at 00000000003b1000 engine c0 [BAR2] client 08 [HUB/HOST_CPU_NB] reason 02 [PTE] on channel -1 [01ffedf000 unknown]
[   43.073579] nouveau 0000:01:00.0: fifo: fault 00 [VIRT_READ] at 0000000000000000 engine 0e [sec2] client 16 [HUB/SEC] reason 00 [PDE] on channel -1 [01ffe5d000 unknown]
[   43.073616] nouveau 0000:01:00.0: fifo: runlist 3: scheduled for recovery
[   43.073636] nouveau 0000:01:00.0: fifo: engine 3: scheduled for recovery
[   43.173456] ------------[ cut here ]------------
[   43.173477] nouveau 0000:01:00.0: timeout
[   43.173533] WARNING: CPU: 9 PID: 1468 at drivers/gpu/drm/nouveau/nvkm/falcon/v1.c:247 nvkm_falcon_v1_wait_for_halt+0x8f/0xb9 [nouveau]
[   43.173614] Modules linked in: uvcvideo videobuf2_vmalloc videobuf2_memops btusb videobuf2_v4l2 btrtl videobuf2_common btbcm btintel videodev bluetooth mc ecdh_generic ecc iwlmvm mac80211 libarc4 mei_hdcp x86_pkg_temp_thermal intel_powerclamp kvm_intel nls_utf8 snd_hda_codec_conexant snd_hda_codec_generic nls_cp437 kvm snd_hda_intel(+) vfat snd_intel_dspcfg iwlwifi fat irqbypass snd_hda_codec squashfs input_leds joydev rapl deflate serio_raw intel_cstate efi_pstore pcspkr snd_hda_core iTCO_wdt wmi_bmof intel_wmi_thunderbolt tpm_crb cfg80211 iTCO_vendor_support ee1004 8250_dw snd_hwdep processor_thermal_device processor_thermal_rfim ucsi_ccg(+) snd_pcm sg ucsi_acpi thinkpad_acpi nvidiafb typec_ucsi vgastate mei_me processor_thermal_mbox typec intel_pch_thermal fb_ddc tpm_tis intel_soc_dts_iosf snd_timer nvram roles tpm_tis_core platform_profile ledtrig_audio snd soundcore rfkill int3403_thermal ac int340x_thermal_zone evdev int3400_thermal acpi_thermal_rel acpi_pad loop configs cor
 etemp
[   43.173670]  msr fuse nfsd auth_rpcgss nfs_acl lockd grace sunrpc nfs_ssc ip_tables x_tables autofs4 essiv authenc dm_crypt trusted tpm rng_core dm_mod raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx multipath sata_sil24 r8169 realtek mdio_devres libphy mii hid_generic usbhid hid crct10dif_pclmul crc32_pclmul crc32c_intel xhci_pci rtsx_pci_sdmmc nouveau ghash_clmulni_intel xhci_hcd mmc_core e1000e i2c_designware_platform mxm_wmi i2c_designware_core hwmon ptp aesni_intel intel_lpss_pci drm_ttm_helper i2c_i801 crypto_simd intel_lpss i2c_smbus psmouse i915 cryptd pps_core thunderbolt rtsx_pci idma64 usbcore ttm i2c_nvidia_gpu thermal wmi battery
[   43.173970] CPU: 9 PID: 1468 Comm: kworker/9:3 Tainted: G     U  W         5.12.1-amd64-preempt-sysrq-20190817 #1
[   43.174001] Hardware name: LENOVO 20QRS00200/20QRS00200, BIOS N2NET40W (1.25 ) 08/26/2020
[   43.174022] Workqueue: pm pm_runtime_work
[   43.174038] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x8f/0xb9 [nouveau]
[   43.174296] Code: 8b 40 10 48 8b 78 10 4c 8b 67 50 4d 85 e4 75 03 4c 8b 27 e8 eb 5c 43 e2 4c 89 e2 48 c7 c7 ef 95 33 c1 48 89 c6 e8 c4 b2 6e e2 <0f> 0b 85 db b8 00 00 00 00 0f 4e c3 48 8b 4c 24 28 65 48 2b 0c 25
[   43.174336] RSP: 0018:ffffb51800eb39f0 EFLAGS: 00010286
[   43.174351] RAX: 0000000000000000 RBX: ffffffffffffff92 RCX: 0000000000000027
[   43.174370] RDX: 0000000000000027 RSI: 0000000000000001 RDI: ffff89f25c658590
[   43.174388] RBP: ffff89e351f09898 R08: 0000000000000003 R09: 0000000000000001
[   43.174407] R10: 0000000000aaaaaa R11: ffffb5182251c420 R12: ffff89e34291c5a0
[   43.178020] R13: 0000000000000000 R14: ffff89e355782e00 R15: ffff89e3524cb000
[   43.180638] FS:  0000000000000000(0000) GS:ffff89f25c640000(0000) knlGS:0000000000000000
[   43.183418] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   43.186150] CR2: 00007f2e4be0e1af CR3: 0000000109928001 CR4: 00000000003706e0
[   43.188876] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   43.191778] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   43.194511] Call Trace:
[   43.197753]  gm200_acr_hsfw_boot+0xc4/0x168 [nouveau]
[   43.203012]  nvkm_acr_hsf_boot+0xad/0x115 [nouveau]
[   43.205781]  tu102_acr_init+0x16/0x2d [nouveau]
[   43.208502]  nvkm_acr_load+0x62/0x135 [nouveau]
[   43.211256]  ? timekeeping_get_ns+0x1c/0x32
[   43.216266]  nvkm_subdev_init+0x100/0x175 [nouveau]
[   43.222767]  nvkm_device_init+0x150/0x203 [nouveau]
[   43.230884]  nvkm_udevice_init+0x31/0x4b [nouveau]
[   43.234889]  nvkm_object_init+0x75/0x15f [nouveau]
[   43.237646]  nvkm_object_init+0x9e/0x15f [nouveau]
[   43.240283]  nvkm_object_init+0x9e/0x15f [nouveau]
[   43.242977]  nouveau_do_resume+0x4b/0x170 [nouveau]
[   43.245737]  nouveau_pmops_runtime_resume+0x76/0x12d [nouveau]
[   43.248416]  pci_pm_runtime_resume+0x75/0x80
[   43.251095]  ? pci_pm_restore+0x7a/0x7a
[   43.253750]  ? pci_pm_restore+0x7a/0x7a
[   43.256355]  __rpm_callback+0x75/0xdb
[   43.259020]  ? pci_pm_restore+0x7a/0x7a
[   43.261687]  rpm_callback+0x55/0x6b
[   43.264269]  ? pci_pm_restore+0x7a/0x7a
[   43.267104]  rpm_resume+0x376/0x47d
[   43.269799]  ? __schedule+0x5de/0x632
[   43.272370]  __pm_runtime_resume+0x5a/0x76
[   43.277743]  ? pci_pm_restore+0x7a/0x7a
[   43.281006]  rpm_get_suppliers+0x39/0x70
[   43.283602]  ? pci_pm_restore+0x7a/0x7a
[   43.286254]  __rpm_callback+0x59/0xdb
[   43.288886]  ? pci_pm_restore+0x7a/0x7a
[   43.296391]  rpm_callback+0x55/0x6b
[   43.300273]  ? pci_pm_restore+0x7a/0x7a
[   43.302811]  rpm_resume+0x376/0x47d
[   43.305372]  ? try_to_wake_up+0x1e8/0x2df
[   43.307844]  pm_runtime_work+0x5f/0x81
[   43.310390]  process_one_work+0x1ea/0x2e0
[   43.312937]  worker_thread+0x19c/0x240
[   43.315389]  ? rescuer_thread+0x294/0x294
[   43.317920]  kthread+0x10c/0x114
[   43.320392]  ? kthread_create_worker_on_cpu+0x65/0x65
[   43.322938]  ret_from_fork+0x1f/0x30
[   43.325469] ---[ end trace a858a74de695aa09 ]---
[   43.327909] nouveau 0000:01:00.0: acr: AHESASC binary failed
[   43.330611] nouveau 0000:01:00.0: acr: init failed, -110
[   43.333198] nouveau 0000:01:00.0: disp: fini running...
[   43.335614] nouveau 0000:01:00.0: disp: fini completed in 23us
[   43.340415] nouveau 0000:01:00.0: disp: fini running...
[   43.344006] nouveau 0000:01:00.0: disp: fini completed in 1us
[   43.346565] nouveau 0000:01:00.0: init failed with -110
[   43.349003] nouveau: systemd-udevd[290]:00000000:00000080: init failed with -110
[   43.351417] nouveau: DRM-master:00000000:00000000: init failed with -110
[   43.354505] nouveau: DRM-master:00000000:00000000: init failed with -110
[   43.362121] nouveau 0000:01:00.0: DRM: Client resume failed with error: -110
[   43.368650] nouveau 0000:01:00.0: DRM: resume failed with: -110
[   43.374973] snd_hda_intel 0000:01:00.1: runtime IRQ mapping not provided by arch
[   43.375016] snd_hda_intel 0000:01:00.1: enabling device (0000 -> 0002)
[   43.377906] snd_hda_intel 0000:01:00.1: Disabling MSI
[   43.380469] snd_hda_intel 0000:01:00.1: Handle vga_switcheroo audio client
[   43.383361] snd_hda_intel 0000:01:00.1: VGA controller is disabled
[   43.386078] snd_hda_intel 0000:01:00.1: Delaying initialization
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
