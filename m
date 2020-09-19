Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFC5271156
	for <lists+nouveau@lfdr.de>; Sun, 20 Sep 2020 01:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38F489A61;
	Sat, 19 Sep 2020 23:18:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D96289A61
 for <nouveau@lists.freedesktop.org>; Sat, 19 Sep 2020 23:18:21 +0000 (UTC)
Received: from c-24-5-124-255.hsd1.ca.comcast.net ([24.5.124.255]:53418
 helo=sauron.svh.merlins.org) by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1kJm7Y-0001TU-7Y by authid <merlins.org> with srv_auth_plain;
 Sat, 19 Sep 2020 16:18:20 -0700
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1kJm7X-0004Dt-Tx; Sat, 19 Sep 2020 16:18:19 -0700
Date: Sat, 19 Sep 2020 16:18:19 -0700
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20200919231819.GA15608@merlins.org>
References: <20191004123947.11087-1-mika.westerberg@linux.intel.com>
 <20191004123947.11087-2-mika.westerberg@linux.intel.com>
 <20200808202202.GA12007@merlins.org>
 <20200906181852.GC13955@merlins.org>
 <CACO55tsodfUGVUjFw9=smFOhp_oXP8zWY_9+vL+iiPZhKJdtyg@mail.gmail.com>
 <20200907205825.GB20064@merlins.org>
 <CACO55ttBXKWTbxERK-aHsYQe_4=eK_WVc2+ebmCbCJJcQpFZrQ@mail.gmail.com>
 <20200908002935.GD20064@merlins.org>
 <20200913201545.GL2622@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200913201545.GL2622@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 24.5.124.255
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: Re: [Nouveau] pcieport 0000:00:01.0: PME: Spurious native interrupt
 (nvidia with nouveau and thunderbolt on thinkpad P73)
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Sep 13, 2020 at 01:15:45PM -0700, Marc MERLIN wrote:
> On Mon, Sep 07, 2020 at 05:29:35PM -0700, Marc MERLIN wrote:
> > On Tue, Sep 08, 2020 at 01:51:19AM +0200, Karol Herbst wrote:
> > > oh, I somehow missed that "disp ctor failed" message. I think that
> > > might explain why things are a bit hanging. From the top of my head I
> > > am not sure if that's something known or something new. But just in
> > > case I CCed Lyude and Ben. And I think booting with
> > > nouveau.debug=disp=trace could already show something relevant.
> > 
> > Thanks.
> > I've added that to my boot for next time I reboot.
> > 
> > I'm moving some folks to Bcc now, and let's remove the lists other than
> > nouveau on followups (lkml and pci). I'm just putting a warning here
> > so that it shows up in other list archives and anyone finding this
> > later knows that they should look in the nouveau archives for further
> > updates/resolution.
> 
> Hi, I didn't hear back on this issue. Did you need the nouveau.debug=disp=trace
> or are you already working on the "disp ctor failed" issue?

I rebooted with the option you asked for:
BOOT_IMAGE=/vmlinuz-5.8.5-amd64-preempt-sysrq-20190817 root=/dev/mapper/cryptroot ro rootflags=subvol=roo
t cryptopts=source=/dev/nvme0n1p7,keyscript=/sbin/cryptgetpw usbcore.autosuspend=1 pcie_aspm=force resume=/dev/dm-1 acpi_backlight=ven
dor nouveau.debug=disp=trace

[    8.371448] nouveau: detected PR support, will not use DSM
[    8.371458] nouveau 0000:01:00.0: runtime IRQ mapping not provided by arch
[    8.371463] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[    8.371510] Console: switching to colour dummy device 80x25
[    8.371542] i915 0000:00:02.0: vgaarb: deactivate vga console
[    8.371574] nouveau 0000:01:00.0: NVIDIA TU104 (164000a1)
[    8.373522] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    8.374215] i915 0000:00:02.0: vgaarb: changed VGA decodes: olddecodes=io+mem,decodes=none:owns=mem
[    8.377328] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/kbl_dmc_ver1_04.bin (v1.4)
[    8.472037] nouveau 0000:01:00.0: bios: version 90.04.4d.00.2c

note that I still get a 3mn hang at boot here

[  188.334912] nouveau 0000:01:00.0: disp: destroy running...
[  188.341741] nouveau 0000:01:00.0: disp: destroy completed in 1us
[  188.344559] nouveau 0000:01:00.0: disp ctor failed, -12
[  188.347708] nouveau: probe of 0000:01:00.0 failed with error -12

As a reminder:
sauron:~# lspci |grep -i nvidia
01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
01:00.1 Audio device: NVIDIA Corporation TU104 HD Audio Controller (rev a1)
01:00.2 USB controller: NVIDIA Corporation TU104 USB 3.1 Host Controller (rev a1)
01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)

full boot still looks like this:
[    9.812614] Console: switching to colour frame buffer device 240x67
[    9.844351] i915 0000:00:02.0: fb0: i915drmfb frame buffer device

16 seconds here? Why?

[   25.107472] thunderbolt 0000:06:00.0: saving config space at offset 0x0 (reading 0x15eb8086)
[   25.107503] thunderbolt 0000:06:00.0: saving config space at offset 0x4 (reading 0x100406)
[   25.107509] thunderbolt 0000:06:00.0: saving config space at offset 0x8 (reading 0x8800006)
[   25.107514] thunderbolt 0000:06:00.0: saving config space at offset 0xc (reading 0x20)
[   25.107520] thunderbolt 0000:06:00.0: saving config space at offset 0x10 (reading 0xcc100000)
[   25.107525] thunderbolt 0000:06:00.0: saving config space at offset 0x14 (reading 0xcc140000)
[   25.107530] thunderbolt 0000:06:00.0: saving config space at offset 0x18 (reading 0x0)
[   25.107535] thunderbolt 0000:06:00.0: saving config space at offset 0x1c (reading 0x0)
[   25.107540] thunderbolt 0000:06:00.0: saving config space at offset 0x20 (reading 0x0)
[   25.107545] thunderbolt 0000:06:00.0: saving config space at offset 0x24 (reading 0x0)
[   25.107550] thunderbolt 0000:06:00.0: saving config space at offset 0x28 (reading 0x0)
[   25.107556] thunderbolt 0000:06:00.0: saving config space at offset 0x2c (reading 0x229b17aa)
[   25.107561] thunderbolt 0000:06:00.0: saving config space at offset 0x30 (reading 0x0)
[   25.107566] thunderbolt 0000:06:00.0: saving config space at offset 0x34 (reading 0x80)
[   25.107571] thunderbolt 0000:06:00.0: saving config space at offset 0x38 (reading 0x0)
[   25.107576] thunderbolt 0000:06:00.0: saving config space at offset 0x3c (reading 0x1ff)
[   25.107661] thunderbolt 0000:06:00.0: PME# enabled
[   25.125418] pcieport 0000:05:00.0: saving config space at offset 0x0 (reading 0x15ea8086)
[   25.125448] pcieport 0000:05:00.0: saving config space at offset 0x4 (reading 0x100407)
[   25.125454] pcieport 0000:05:00.0: saving config space at offset 0x8 (reading 0x6040006)
[   25.125459] pcieport 0000:05:00.0: saving config space at offset 0xc (reading 0x10020)
[   25.125464] pcieport 0000:05:00.0: saving config space at offset 0x10 (reading 0x0)
[   25.125469] pcieport 0000:05:00.0: saving config space at offset 0x14 (reading 0x0)
[   25.125474] pcieport 0000:05:00.0: saving config space at offset 0x18 (reading 0x60605)
[   25.125478] pcieport 0000:05:00.0: saving config space at offset 0x1c (reading 0x1f1)
[   25.125483] pcieport 0000:05:00.0: saving config space at offset 0x20 (reading 0xcc10cc10)
[   25.125488] pcieport 0000:05:00.0: saving config space at offset 0x24 (reading 0x1fff1)
[   25.125493] pcieport 0000:05:00.0: saving config space at offset 0x28 (reading 0x0)
[   25.125498] pcieport 0000:05:00.0: saving config space at offset 0x2c (reading 0x0)
[   25.125503] pcieport 0000:05:00.0: saving config space at offset 0x30 (reading 0x0)
[   25.125508] pcieport 0000:05:00.0: saving config space at offset 0x34 (reading 0x80)
[   25.125512] pcieport 0000:05:00.0: saving config space at offset 0x38 (reading 0x0)
[   25.125517] pcieport 0000:05:00.0: saving config space at offset 0x3c (reading 0x201ff)
[   25.125603] pcieport 0000:05:00.0: PME# enabled
[   25.145407] pcieport 0000:04:00.0: saving config space at offset 0x0 (reading 0x15ea8086)
[   25.145426] pcieport 0000:04:00.0: saving config space at offset 0x4 (reading 0x100007)
[   25.145431] pcieport 0000:04:00.0: saving config space at offset 0x8 (reading 0x6040006)
[   25.145436] pcieport 0000:04:00.0: saving config space at offset 0xc (reading 0x10020)
[   25.145441] pcieport 0000:04:00.0: saving config space at offset 0x10 (reading 0x0)
[   25.145446] pcieport 0000:04:00.0: saving config space at offset 0x14 (reading 0x0)
[   25.145451] pcieport 0000:04:00.0: saving config space at offset 0x18 (reading 0x510504)
[   25.145456] pcieport 0000:04:00.0: saving config space at offset 0x1c (reading 0x5141)
[   25.145461] pcieport 0000:04:00.0: saving config space at offset 0x20 (reading 0xcc10b400)
[   25.145466] pcieport 0000:04:00.0: saving config space at offset 0x24 (reading 0x3ff10001)
[   25.145471] pcieport 0000:04:00.0: saving config space at offset 0x28 (reading 0x60)
[   25.145476] pcieport 0000:04:00.0: saving config space at offset 0x2c (reading 0x60)
[   25.145481] pcieport 0000:04:00.0: saving config space at offset 0x30 (reading 0x0)
[   25.145485] pcieport 0000:04:00.0: saving config space at offset 0x34 (reading 0x80)
[   25.145490] pcieport 0000:04:00.0: saving config space at offset 0x38 (reading 0x0)
[   25.145495] pcieport 0000:04:00.0: saving config space at offset 0x3c (reading 0x201ff)
[   25.145578] pcieport 0000:04:00.0: PME# enabled
[   25.165654] pcieport 0000:00:1c.0: saving config space at offset 0x0 (reading 0xa3388086)
[   25.165667] pcieport 0000:00:1c.0: saving config space at offset 0x4 (reading 0x100407)
[   25.165676] pcieport 0000:00:1c.0: saving config space at offset 0x8 (reading 0x60400f0)
[   25.165684] pcieport 0000:00:1c.0: saving config space at offset 0xc (reading 0x810000)
[   25.165692] pcieport 0000:00:1c.0: saving config space at offset 0x10 (reading 0x0)
[   25.165699] pcieport 0000:00:1c.0: saving config space at offset 0x14 (reading 0x0)
[   25.165704] pcieport 0000:00:1c.0: saving config space at offset 0x18 (reading 0x510400)
[   25.165711] pcieport 0000:00:1c.0: saving config space at offset 0x1c (reading 0x20006040)
[   25.165724] pcieport 0000:00:1c.0: saving config space at offset 0x20 (reading 0xcc10b400)
[   25.165731] pcieport 0000:00:1c.0: saving config space at offset 0x24 (reading 0x3ff10001)
[   25.165736] pcieport 0000:00:1c.0: saving config space at offset 0x28 (reading 0x60)
[   25.165740] pcieport 0000:00:1c.0: saving config space at offset 0x2c (reading 0x60)
[   25.165745] pcieport 0000:00:1c.0: saving config space at offset 0x30 (reading 0x0)
[   25.165749] pcieport 0000:00:1c.0: saving config space at offset 0x34 (reading 0x40)
[   25.165754] pcieport 0000:00:1c.0: saving config space at offset 0x38 (reading 0x0)
[   25.165758] pcieport 0000:00:1c.0: saving config space at offset 0x3c (reading 0x201ff)
[   25.165849] pcieport 0000:00:1c.0: PME# enabled
[   26.293697] pcieport 0000:00:1c.0: power state changed by ACPI to D3cold

then 2mn lost here.

[  128.473799] async_tx: api initialized (async)
[  128.492893] device-mapper: uevent: version 1.0.3
[  128.493134] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[  128.504534] random: cryptsetup: uninitialized urandom read (4 bytes read)
[  138.554741] random: cryptsetup: uninitialized urandom read (4 bytes read)
[  144.837421] e1000e 0000:00:1f.6 eth0: NIC Link is Down
[  188.334912] nouveau 0000:01:00.0: disp: destroy running...
[  188.341741] nouveau 0000:01:00.0: disp: destroy completed in 1us
[  188.344559] nouveau 0000:01:00.0: disp ctor failed, -12
[  188.347708] nouveau: probe of 0000:01:00.0 failed with error -12

Full lspci if it's helpful:

00:00.0 Host bridge: Intel Corporation Device 3e20 (rev 0d)
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor PCIe Controller (x16) (rev 0d)
00:02.0 VGA compatible controller: Intel Corporation UHD Graphics 630 (Mobile) (rev 02)
00:04.0 Signal processing controller: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem (rev 0d)
00:08.0 System peripheral: Intel Corporation Xeon E3-1200 v5/v6 / E3-1500 v5 / 6th/7th/8th Gen Core Processor Gaussian Mixture Model
00:12.0 Signal processing controller: Intel Corporation Cannon Lake PCH Thermal Controller (rev 10)
00:14.0 USB controller: Intel Corporation Cannon Lake PCH USB 3.1 xHCI Host Controller (rev 10)
00:14.2 RAM memory: Intel Corporation Cannon Lake PCH Shared SRAM (rev 10)
00:15.0 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH Serial IO I2C Controller #0 (rev 10)
00:15.1 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH Serial IO I2C Controller #1 (rev 10)
00:16.0 Communication controller: Intel Corporation Cannon Lake PCH HECI Controller (rev 10)
00:17.0 SATA controller: Intel Corporation Cannon Lake Mobile PCH SATA AHCI Controller (rev 10)
00:1b.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port #17 (rev f0)
00:1c.0 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port #1 (rev f0)
00:1c.5 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port #6 (rev f0)
00:1c.7 PCI bridge: Intel Corporation Cannon Lake PCH PCI Express Root Port #8 (rev f0)
00:1e.0 Communication controller: Intel Corporation Cannon Lake PCH Serial IO UART Host Controller (rev 10)
00:1f.0 ISA bridge: Intel Corporation Cannon Lake LPC Controller (rev 10)
00:1f.3 Audio device: Intel Corporation Cannon Lake PCH cAVS (rev 10)
00:1f.4 SMBus: Intel Corporation Cannon Lake PCH SMBus Controller (rev 10)
00:1f.5 Serial bus controller [0c80]: Intel Corporation Cannon Lake PCH SPI Controller (rev 10)
00:1f.6 Ethernet controller: Intel Corporation Ethernet Connection (7) I219-LM (rev 10)
01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
01:00.1 Audio device: NVIDIA Corporation TU104 HD Audio Controller (rev a1)
01:00.2 USB controller: NVIDIA Corporation TU104 USB 3.1 Host Controller (rev a1)
01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)
02:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd NVMe SSD Controller SM981/PM981/PM983
04:00.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
05:00.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
05:01.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
05:02.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
05:04.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan Ridge 4C 2018] (rev 06)
06:00.0 System peripheral: Intel Corporation JHL7540 Thunderbolt 3 NHI [Titan Ridge 4C 2018] (rev 06)
2c:00.0 USB controller: Intel Corporation JHL7540 Thunderbolt 3 USB Controller [Titan Ridge 4C 2018] (rev 06)
52:00.0 Network controller: Intel Corporation Wi-Fi 6 AX200 (rev 1a)
54:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A PCI Express Card Reader (rev 01)

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
