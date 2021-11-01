Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B291B44202A
	for <lists+nouveau@lfdr.de>; Mon,  1 Nov 2021 19:38:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92F46E1BD;
	Mon,  1 Nov 2021 18:38:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4766E1BD
 for <nouveau@lists.freedesktop.org>; Mon,  1 Nov 2021 18:38:49 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id g10so67125339edj.1
 for <nouveau@lists.freedesktop.org>; Mon, 01 Nov 2021 11:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=JTHgTeFu7+nKB/pWRXo2lPlg6Bf/9BWypyQ9Xxbg2F4=;
 b=hsulbIgMXi8H0w/v8/GQz2yj6kmu+uQfJ2qKOb+17z67TZWapfv+Y8x8tVPXkLHWeK
 zlzCdArtMh6/5ytScnAs0OfCsKjhxbAsTUCJ6dMwpvsuut+3lvTZZliUybEn0RgdSjSG
 fGufGRkBKK1Ducm3m0P30+YDnyiNjHgZt9KNzKlV2XFTjC0wrUY/n3CfKK+9IjZkmF0x
 dT4J6zb7RE6r71f2sULns3RwamLAxfFLnJnRKVS4VwDRifKk/Hu4cVuQrCVTHgBv8FQ6
 yWFCy5Yq4Dyw12aqquXwh/sqZDo8v3Yt4S3XWj+6tWbnm5/7KOFOHz/p3bTbHUhHTiP0
 etSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JTHgTeFu7+nKB/pWRXo2lPlg6Bf/9BWypyQ9Xxbg2F4=;
 b=ba/v9BjbJhZAt1uT0/OH4Hs8/1EApSs5pto6A1fmJyqMZlZCc5aofa+n8rU9mnOqOS
 KXxYs2MPA1rfa0UENoJw4G7+o6iqJazBatfA9jsfckXJrjo1AYxc1SRUgHgqgBE/+iiT
 TT1DRH9pogWaFGfPm8fuucKpJnGfkKwyIZssmcxPpTlGod1B2vMKE/ih/wZf+pjrB4eb
 V/EF7YnXgAYK21kAkBG7+gye26KbDDqKKsG31OFkKD89iA7rfW65la0y3qOGWq95wshL
 BpmwQjeH77mbkxN7U9j3sw2PH7dBcfu+DbnFd5/hXtasrML2O7jaQj1MXBuqKZPbO4Mp
 3k0g==
X-Gm-Message-State: AOAM533Auqv7DvxYIcFQ+cxAvIajt8RYoIz9iviIwL5BYWK5K5hwQ2sU
 n//GQJALroWOOcpy1fvK1EqeRQ3xVVx4NYBc7G5Z4RsL
X-Google-Smtp-Source: ABdhPJxOYPa+uE2Oon87pX2Ky+LwiOsuSnKiirrtkBtz5d1LMySPqzmFNuzftXfxZQ3DSlCrdFVRRbDhd0V1JrFYgBk=
X-Received: by 2002:aa7:c4d3:: with SMTP id p19mr1356418edr.333.1635791927699; 
 Mon, 01 Nov 2021 11:38:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:4c95:0:0:0:0 with HTTP; Mon, 1 Nov 2021 11:38:47
 -0700 (PDT)
From: riveravaldez <riveravaldezmail@gmail.com>
Date: Mon, 1 Nov 2021 15:38:47 -0300
Message-ID: <CAD8U+g_=X07mpM4_EJ_vteqTNdYqH+Ev7ihgea25qJW-3FZ_uw@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="000000000000c6ee2805cfbe7c25"
Subject: [Nouveau] Various kernel error messages on updated Arch box
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--000000000000c6ee2805cfbe7c25
Content-Type: text/plain; charset="UTF-8"

Hi, I'm having this error messages at boot:

$ sudo journalctl -ex -p3 | grep nouveau
nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: ce: ucode exceeds falcon
limit(s)
nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: ce: init failed, -22
nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 10312c [ PRIVRING ]
nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 103048 [ PRIVRING ]
(...)
nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 103048 [ PRIVRING ]
nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO write of
00000000 FAULT at 103048 [ PRIVRING ]
nov 01 14:54:22 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 103048 [ PRIVRING ]
nov 01 14:54:54 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 103048 [ PRIVRING ]
nov 01 14:55:06 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of
00000000 FAULT at 103048 [ PRIVRING ]
(..., many similar)

In this hardware:

$ lspci -k
00:00.0 Host bridge: Intel Corporation 2nd Generation Core Processor Family
DRAM Controller (rev 09)
Subsystem: Dell Device 04b6
00:01.0 PCI bridge: Intel Corporation Xeon E3-1200/2nd Generation Core
Processor Family PCI Express Root Port (rev 09)
Kernel driver in use: pcieport
00:02.0 VGA compatible controller: Intel Corporation 2nd Generation Core
Processor Family Integrated Graphics Controller (rev 09)
Subsystem: Dell Device 04b6
Kernel driver in use: i915
Kernel modules: i915
00:16.0 Communication controller: Intel Corporation 6 Series/C200 Series
Chipset Family MEI Controller #1 (rev 04)
Subsystem: Dell Device 04b6
Kernel driver in use: mei_me
Kernel modules: mei_me
00:1a.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset
Family USB Enhanced Host Controller #2 (rev 05)
Subsystem: Dell Device 04b6
Kernel driver in use: ehci-pci
00:1b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family
High Definition Audio Controller (rev 05)
Subsystem: Dell Device 04b6
Kernel driver in use: snd_hda_intel
Kernel modules: snd_hda_intel
00:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family
PCI Express Root Port 1 (rev b5)
Kernel driver in use: pcieport
00:1c.1 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family
PCI Express Root Port 2 (rev b5)
Kernel driver in use: pcieport
00:1c.3 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family
PCI Express Root Port 4 (rev b5)
Kernel driver in use: pcieport
00:1c.4 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family
PCI Express Root Port 5 (rev b5)
Kernel driver in use: pcieport
00:1c.5 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family
PCI Express Root Port 6 (rev b5)
Kernel driver in use: pcieport
00:1d.0 USB controller: Intel Corporation 6 Series/C200 Series Chipset
Family USB Enhanced Host Controller #1 (rev 05)
Subsystem: Dell Device 04b6
Kernel driver in use: ehci-pci
00:1f.0 ISA bridge: Intel Corporation HM67 Express Chipset LPC Controller
(rev 05)
Subsystem: Dell Device 04b6
Kernel driver in use: lpc_ich
Kernel modules: lpc_ich
00:1f.2 SATA controller: Intel Corporation 6 Series/C200 Series Chipset
Family 6 port Mobile SATA AHCI Controller (rev 05)
Subsystem: Dell Device 04b6
Kernel driver in use: ahci
00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family SMBus
Controller (rev 05)
Subsystem: Dell Device 04b6
Kernel driver in use: i801_smbus
Kernel modules: i2c_i801
01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [GeForce GT
525M] (rev a1)
Subsystem: Dell Device 04b6
Kernel driver in use: nouveau
Kernel modules: nouveau
01:00.1 Audio device: NVIDIA Corporation GF108 High Definition Audio
Controller (rev a1)
Kernel driver in use: snd_hda_intel
Kernel modules: snd_hda_intel
03:00.0 Network controller: Intel Corporation Centrino Wireless-N 1030
[Rainbow Peak] (rev 34)
Subsystem: Intel Corporation Centrino Wireless-N 1030 BGN
Kernel driver in use: iwlwifi
Kernel modules: iwlwifi
04:00.0 USB controller: NEC Corporation uPD720200 USB 3.0 Host Controller
(rev 04)
Subsystem: Dell Device 04b6
Kernel driver in use: xhci_hcd
Kernel modules: xhci_pci
06:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 06)
Subsystem: Dell Device 04b6
Kernel driver in use: r8169
Kernel modules: r8169

Updated Arch system.

$ uname -a
Linux arch 5.14.14-arch1-1 #1 SMP PREEMPT Wed, 20 Oct 2021 21:35:18 +0000
x86_64 GNU/Linux

Something I should worry or do about?

Thanks a lot in advance. Kind regards.

--000000000000c6ee2805cfbe7c25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I&#39;m having this error messages at boot:<br><br>$ sudo journalctl -e=
x -p3 | grep nouveau<br>nov 01 14:47:39 arch kernel: nouveau 0000:01:00.0: =
ce: ucode exceeds falcon limit(s)<br>nov 01 14:47:39 arch kernel: nouveau 0=
000:01:00.0: ce: init failed, -22<br>nov 01 14:47:39 arch kernel: nouveau 0=
000:01:00.0: bus: MMIO read of 00000000 FAULT at 10312c [ PRIVRING ]<br>nov=
 01 14:47:39 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 =
FAULT at 103048 [ PRIVRING ]<br>(...)<br>nov 01 14:54:04 arch kernel: nouve=
au 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]<br=
>nov 01 14:54:04 arch kernel: nouveau 0000:01:00.0: bus: MMIO write of 0000=
0000 FAULT at 103048 [ PRIVRING ]<br>nov 01 14:54:22 arch kernel: nouveau 0=
000:01:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]<br>nov=
 01 14:54:54 arch kernel: nouveau 0000:01:00.0: bus: MMIO read of 00000000 =
FAULT at 103048 [ PRIVRING ]<br>nov 01 14:55:06 arch kernel: nouveau 0000:0=
1:00.0: bus: MMIO read of 00000000 FAULT at 103048 [ PRIVRING ]<br>(..., ma=
ny similar)<br><br>In this hardware:<br><br>$ lspci -k<br>00:00.0 Host brid=
ge: Intel Corporation 2nd Generation Core Processor Family DRAM Controller =
(rev 09)<br>	Subsystem: Dell Device 04b6<br>00:01.0 PCI bridge: Intel Corpo=
ration Xeon E3-1200/2nd Generation Core Processor Family PCI Express Root P=
ort (rev 09)<br>	Kernel driver in use: pcieport<br>00:02.0 VGA compatible c=
ontroller: Intel Corporation 2nd Generation Core Processor Family Integrate=
d Graphics Controller (rev 09)<br>	Subsystem: Dell Device 04b6<br>	Kernel d=
river in use: i915<br>	Kernel modules: i915<br>00:16.0 Communication contro=
ller: Intel Corporation 6 Series/C200 Series Chipset Family MEI Controller =
#1 (rev 04)<br>	Subsystem: Dell Device 04b6<br>	Kernel driver in use: mei_m=
e<br>	Kernel modules: mei_me<br>00:1a.0 USB controller: Intel Corporation 6=
 Series/C200 Series Chipset Family USB Enhanced Host Controller #2 (rev 05)=
<br>	Subsystem: Dell Device 04b6<br>	Kernel driver in use: ehci-pci<br>00:1=
b.0 Audio device: Intel Corporation 6 Series/C200 Series Chipset Family Hig=
h Definition Audio Controller (rev 05)<br>	Subsystem: Dell Device 04b6<br>	=
Kernel driver in use: snd_hda_intel<br>	Kernel modules: snd_hda_intel<br>00=
:1c.0 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI=
 Express Root Port 1 (rev b5)<br>	Kernel driver in use: pcieport<br>00:1c.1=
 PCI bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Expr=
ess Root Port 2 (rev b5)<br>	Kernel driver in use: pcieport<br>00:1c.3 PCI =
bridge: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express R=
oot Port 4 (rev b5)<br>	Kernel driver in use: pcieport<br>00:1c.4 PCI bridg=
e: Intel Corporation 6 Series/C200 Series Chipset Family PCI Express Root P=
ort 5 (rev b5)<br>	Kernel driver in use: pcieport<br>00:1c.5 PCI bridge: In=
tel Corporation 6 Series/C200 Series Chipset Family PCI Express Root Port 6=
 (rev b5)<br>	Kernel driver in use: pcieport<br>00:1d.0 USB controller: Int=
el Corporation 6 Series/C200 Series Chipset Family USB Enhanced Host Contro=
ller #1 (rev 05)<br>	Subsystem: Dell Device 04b6<br>	Kernel driver in use: =
ehci-pci<br>00:1f.0 ISA bridge: Intel Corporation HM67 Express Chipset LPC =
Controller (rev 05)<br>	Subsystem: Dell Device 04b6<br>	Kernel driver in us=
e: lpc_ich<br>	Kernel modules: lpc_ich<br>00:1f.2 SATA controller: Intel Co=
rporation 6 Series/C200 Series Chipset Family 6 port Mobile SATA AHCI Contr=
oller (rev 05)<br>	Subsystem: Dell Device 04b6<br>	Kernel driver in use: ah=
ci<br>00:1f.3 SMBus: Intel Corporation 6 Series/C200 Series Chipset Family =
SMBus Controller (rev 05)<br>	Subsystem: Dell Device 04b6<br>	Kernel driver=
 in use: i801_smbus<br>	Kernel modules: i2c_i801<br>01:00.0 VGA compatible =
controller: NVIDIA Corporation GF108M [GeForce GT 525M] (rev a1)<br>	Subsys=
tem: Dell Device 04b6<br>	Kernel driver in use: nouveau<br>	Kernel modules:=
 nouveau<br>01:00.1 Audio device: NVIDIA Corporation GF108 High Definition =
Audio Controller (rev a1)<br>	Kernel driver in use: snd_hda_intel<br>	Kerne=
l modules: snd_hda_intel<br>03:00.0 Network controller: Intel Corporation C=
entrino Wireless-N 1030 [Rainbow Peak] (rev 34)<br>	Subsystem: Intel Corpor=
ation Centrino Wireless-N 1030 BGN<br>	Kernel driver in use: iwlwifi<br>	Ke=
rnel modules: iwlwifi<br>04:00.0 USB controller: NEC Corporation uPD720200 =
USB 3.0 Host Controller (rev 04)<br>	Subsystem: Dell Device 04b6<br>	Kernel=
 driver in use: xhci_hcd<br>	Kernel modules: xhci_pci<br>06:00.0 Ethernet c=
ontroller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gi=
gabit Ethernet Controller (rev 06)<br>	Subsystem: Dell Device 04b6<br>	Kern=
el driver in use: r8169<br>	Kernel modules: r8169<br><br>Updated Arch syste=
m.<br><br>$ uname -a<br>Linux arch 5.14.14-arch1-1 #1 SMP PREEMPT Wed, 20 O=
ct 2021 21:35:18 +0000 x86_64 GNU/Linux<br><br>Something I should worry or =
do about?<br><br>Thanks a lot in advance. Kind regards.

--000000000000c6ee2805cfbe7c25--
