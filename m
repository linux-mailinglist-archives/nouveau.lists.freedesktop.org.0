Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF646C74A
	for <lists+nouveau@lfdr.de>; Tue,  7 Dec 2021 23:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A7F6E192;
	Tue,  7 Dec 2021 22:16:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 992 seconds by postgrey-1.36 at gabe;
 Sat, 04 Dec 2021 16:56:47 UTC
Received: from manul.sfritsch.de (manul.sfritsch.de
 [IPv6:2a01:4f8:172:195f:112::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274F06E86F;
 Sat,  4 Dec 2021 16:56:47 +0000 (UTC)
Message-ID: <da142fb9-07d7-24fe-4533-0247b8d16cdd@sfritsch.de>
Date: Sat, 4 Dec 2021 17:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: de-DE
From: Stefan Fritsch <sf@sfritsch.de>
To: nouveau@lists.freedesktop.org, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 07 Dec 2021 22:16:38 +0000
Subject: [Nouveau] Regression in 5.15 in nouveau
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
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

when updating from 5.14 to 5.15 on a system with NVIDIA GP108 [GeForce 
GT 1030] (NV138) and Ryzen 9 3900XT using kde/plasma on X (not wayland), 
there is a regression: There is now some annoying black flickering in 
some applications, for example thunderbird, firefox, or mpv. It mostly 
happens when scrolling or when playing video. Only the window of the 
application flickers, not the whole screen. But the flickering is not 
limited to the scrolled area: for example in firefox the url and 
bookmark bars flicker, too, not only the web site. I have bisected the 
issue to this commit:

commit 3e1ad79bf66165bdb2baca3989f9227939241f11 (HEAD)
Author: Christian König <christian.koenig@amd.com>
Date:   Sun Jun 6 11:50:15 2021 +0200

     drm/nouveau: always wait for the exclusive fence

     Drivers also need to to sync to the exclusive fence when
     a shared one is present.

     Signed-off-by: Christian König <christian.koenig@amd.com>
     Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
     Link: 
https://patchwork.freedesktop.org/patch/msgid/20210702111642.17259-4-christian.koenig@amd.com


This sounds like performance is impacted severely by that commit. Can 
this be fixed somehow? A partial dmesg is below.

Cheers,
Stefan


dmesg |grep -i -e drm -e dri -e nvidia -e nouveau -e fb
[    0.000000] BIOS-e820: [mem 0x00000000bc552000-0x00000000bc8fbfff] 
reserved
[    0.004971] ACPI: XSDT 0x00000000BCFB0728 0000CC (v01 ALASKA A M I 
01072009 AMI  01000013)
[    0.010838] PM: hibernation: Registered nosave memory: [mem 
0xbc552000-0xbc8fbfff]
[    0.204873] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.292761] Registering PCC driver as Mailbox controller
[    0.292761] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.518295] pci 0000:06:00.0: reg 0x10: [mem 0xfb000000-0xfbffffff]
[    0.519132] pci 0000:06:00.1: [10de:0fb8] type 00 class 0x040300
[    0.519653] pci 0000:00:03.1:   bridge window [mem 0xfb000000-0xfc0fffff]
[    0.549101] pci 0000:00:03.1:   bridge window [mem 0xfb000000-0xfc0fffff]
[    0.550994] pci_bus 0000:06: resource 1 [mem 0xfb000000-0xfc0fffff]
[    0.561285] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 250)
[    0.564152] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.570870] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.571531] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    0.988343] microcode: Microcode Update Driver: v2.2.
[    1.112435] ACPI: OSL: Resource conflict; ACPI support missing from 
driver?
[    1.114174] usbcore: registered new interface driver usbfs
[    1.114331] usbcore: registered new interface driver hub
[    1.114599] usbcore: registered new device driver usb
[    2.373857] hid: raw HID events driver (C) Jiri Kosina
[    2.378553] usbcore: registered new interface driver usbhid
[    2.378641] usbhid: USB HID core driver
[    2.581069] ata3.00: supports DRM functions and may not be fully 
accessible
[    2.582388] ata3.00: supports DRM functions and may not be fully 
accessible
[    3.371574] ata5.00: supports DRM functions and may not be fully 
accessible
[    3.396636] ata5.00: supports DRM functions and may not be fully 
accessible
[    4.159005] sr 1:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram 
cd/rw xa/form2 cdda tray
[    4.159120] cdrom: Uniform CD-ROM driver Revision: 3.20
[    5.936017] systemd[1]: Starting Load Kernel Module drm...
[    5.957038] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.957238] systemd[1]: Finished Load Kernel Module drm.
[    6.104901] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    6.122007] usbcore: registered new device driver apple-mfi-fastcharge
[    6.213866] input: HDA NVidia HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input8
[    6.236581] AMD64 EDAC driver v3.5.0
[    6.259473] input: HDA NVidia HDMI/DP,pcm=7 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input9
[    6.259631] input: HDA NVidia HDMI/DP,pcm=8 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input10
[    6.260559] input: HDA NVidia HDMI/DP,pcm=9 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input11
[    6.260913] input: HDA NVidia HDMI/DP,pcm=10 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input12
[    6.485220] nouveau 0000:06:00.0: vgaarb: deactivate vga console
[    6.486484] nouveau 0000:06:00.0: NVIDIA GP108 (138000a1)
[    6.612994] nouveau 0000:06:00.0: bios: version 86.08.24.00.23
[    6.617303] nouveau 0000:06:00.0: pmu: firmware unavailable
[    6.621410] nouveau 0000:06:00.0: fb: 2048 MiB GDDR5
[    6.653892] nouveau 0000:06:00.0: DRM: VRAM: 2048 MiB
[    6.653895] nouveau 0000:06:00.0: DRM: GART: 536870912 MiB
[    6.653897] nouveau 0000:06:00.0: DRM: BIT table 'A' not found
[    6.653899] nouveau 0000:06:00.0: DRM: BIT table 'L' not found
[    6.653900] nouveau 0000:06:00.0: DRM: TMDS table version 2.0
[    6.653902] nouveau 0000:06:00.0: DRM: DCB version 4.1
[    6.653904] nouveau 0000:06:00.0: DRM: DCB outp 00: 01800346 04600010
[    6.653906] nouveau 0000:06:00.0: DRM: DCB outp 01: 01000342 00020010
[    6.653908] nouveau 0000:06:00.0: DRM: DCB outp 02: 01011352 00020020
[    6.653909] nouveau 0000:06:00.0: DRM: DCB conn 00: 00001046
[    6.653911] nouveau 0000:06:00.0: DRM: DCB conn 01: 00002161
[    6.654295] nouveau 0000:06:00.0: DRM: MM: using COPY for buffer copies
[    6.655460] snd_hda_intel 0000:06:00.1: bound 0000:06:00.0 (ops 
nv50_audio_component_bind_ops [nouveau])
[    6.828018] nouveau 0000:06:00.0: DRM: allocated 3840x2160 fb: 
0x200000, bo 000000001a41f1fe
[    6.828086] fbcon: nouveau (fb0) is primary device
[    6.915486] nouveau 0000:06:00.0: [drm] fb0: nouveau frame buffer device
[    6.939244] [drm] Initialized nouveau 1.3.1 20120801 for 0000:06:00.0 
on minor 0
[   11.338075] audit: type=1400 audit(1638634273.245:6): 
apparmor="STATUS" operation="profile_load" profile="unconfined" 
name="nvidia_modprobe" pid=1354 comm="apparmor_parser"
[   11.338078] audit: type=1400 audit(1638634273.245:7): 
apparmor="STATUS" operation="profile_load" profile="unconfined" 
name="nvidia_modprobe//kmod" pid=1354 comm="apparmor_parser"
[   11.479123] RTL8226B_RTL8221B 2.5Gbps PHY r8169-500:00: attached PHY 
driver (mii_bus:phy_addr=r8169-500:00, irq=MAC)
stf@k:~/comp/linux/linux$ sudo dmesg |less
stf@k:~/comp/linux/linux$ sudo dmesg |grep -i -e drm -e dri -e nvidia -e 
nouveau -e fb
[    0.000000] BIOS-e820: [mem 0x00000000bc552000-0x00000000bc8fbfff] 
reserved
[    0.004971] ACPI: XSDT 0x00000000BCFB0728 0000CC (v01 ALASKA A M I 
01072009 AMI  01000013)
[    0.010838] PM: hibernation: Registered nosave memory: [mem 
0xbc552000-0xbc8fbfff]
[    0.204873] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
[    0.292761] Registering PCC driver as Mailbox controller
[    0.292761] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.518295] pci 0000:06:00.0: reg 0x10: [mem 0xfb000000-0xfbffffff]
[    0.519132] pci 0000:06:00.1: [10de:0fb8] type 00 class 0x040300
[    0.519653] pci 0000:00:03.1:   bridge window [mem 0xfb000000-0xfc0fffff]
[    0.549101] pci 0000:00:03.1:   bridge window [mem 0xfb000000-0xfc0fffff]
[    0.550994] pci_bus 0000:06: resource 1 [mem 0xfb000000-0xfc0fffff]
[    0.561285] Block layer SCSI generic (bsg) driver version 0.4 loaded 
(major 250)
[    0.564152] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.570870] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.571531] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    0.988343] microcode: Microcode Update Driver: v2.2.
[    1.112435] ACPI: OSL: Resource conflict; ACPI support missing from 
driver?
[    1.114174] usbcore: registered new interface driver usbfs
[    1.114331] usbcore: registered new interface driver hub
[    1.114599] usbcore: registered new device driver usb
[    2.373857] hid: raw HID events driver (C) Jiri Kosina
[    2.378553] usbcore: registered new interface driver usbhid
[    2.378641] usbhid: USB HID core driver
[    2.581069] ata3.00: supports DRM functions and may not be fully 
accessible
[    2.582388] ata3.00: supports DRM functions and may not be fully 
accessible
[    3.371574] ata5.00: supports DRM functions and may not be fully 
accessible
[    3.396636] ata5.00: supports DRM functions and may not be fully 
accessible
[    4.159005] sr 1:0:0:0: [sr0] scsi3-mmc drive: 48x/48x writer dvd-ram 
cd/rw xa/form2 cdda tray
[    4.159120] cdrom: Uniform CD-ROM driver Revision: 3.20
[    5.936017] systemd[1]: Starting Load Kernel Module drm...
[    5.957038] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    5.957238] systemd[1]: Finished Load Kernel Module drm.
[    6.104901] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    6.122007] usbcore: registered new device driver apple-mfi-fastcharge
[    6.213866] input: HDA NVidia HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input8
[    6.236581] AMD64 EDAC driver v3.5.0
[    6.259473] input: HDA NVidia HDMI/DP,pcm=7 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input9
[    6.259631] input: HDA NVidia HDMI/DP,pcm=8 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input10
[    6.260559] input: HDA NVidia HDMI/DP,pcm=9 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input11
[    6.260913] input: HDA NVidia HDMI/DP,pcm=10 as 
/devices/pci0000:00/0000:00:03.1/0000:06:00.1/sound/card0/input12
[    6.485220] nouveau 0000:06:00.0: vgaarb: deactivate vga console
[    6.486484] nouveau 0000:06:00.0: NVIDIA GP108 (138000a1)
[    6.612994] nouveau 0000:06:00.0: bios: version 86.08.24.00.23
[    6.617303] nouveau 0000:06:00.0: pmu: firmware unavailable
[    6.621410] nouveau 0000:06:00.0: fb: 2048 MiB GDDR5
[    6.653892] nouveau 0000:06:00.0: DRM: VRAM: 2048 MiB
[    6.653895] nouveau 0000:06:00.0: DRM: GART: 536870912 MiB
[    6.653897] nouveau 0000:06:00.0: DRM: BIT table 'A' not found
[    6.653899] nouveau 0000:06:00.0: DRM: BIT table 'L' not found
[    6.653900] nouveau 0000:06:00.0: DRM: TMDS table version 2.0
[    6.653902] nouveau 0000:06:00.0: DRM: DCB version 4.1
[    6.653904] nouveau 0000:06:00.0: DRM: DCB outp 00: 01800346 04600010
[    6.653906] nouveau 0000:06:00.0: DRM: DCB outp 01: 01000342 00020010
[    6.653908] nouveau 0000:06:00.0: DRM: DCB outp 02: 01011352 00020020
[    6.653909] nouveau 0000:06:00.0: DRM: DCB conn 00: 00001046
[    6.653911] nouveau 0000:06:00.0: DRM: DCB conn 01: 00002161
[    6.654295] nouveau 0000:06:00.0: DRM: MM: using COPY for buffer copies
[    6.655460] snd_hda_intel 0000:06:00.1: bound 0000:06:00.0 (ops 
nv50_audio_component_bind_ops [nouveau])
[    6.828018] nouveau 0000:06:00.0: DRM: allocated 3840x2160 fb: 
0x200000, bo 000000001a41f1fe
[    6.828086] fbcon: nouveau (fb0) is primary device
[    6.915486] nouveau 0000:06:00.0: [drm] fb0: nouveau frame buffer device
[    6.939244] [drm] Initialized nouveau 1.3.1 20120801 for 0000:06:00.0 
on minor 0
[   11.338075] audit: type=1400 audit(1638634273.245:6): 
apparmor="STATUS" operation="profile_load" profile="unconfined" 
name="nvidia_modprobe" pid=1354 comm="apparmor_parser"
[   11.338078] audit: type=1400 audit(1638634273.245:7): 
apparmor="STATUS" operation="profile_load" profile="unconfined" 
name="nvidia_modprobe//kmod" pid=1354 comm="apparmor_parser"
[   11.479123] RTL8226B_RTL8221B 2.5Gbps PHY r8169-500:00: attached PHY 
driver (mii_bus:phy_addr=r8169-500:00, irq=MAC)

