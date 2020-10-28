Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A77729D03C
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 15:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3296E51D;
	Wed, 28 Oct 2020 14:19:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C8C6E51D
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 14:19:56 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g12so5863482wrp.10
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 07:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K0kDGmNtNZhbyCmEZG6NUqoRAxxwmZZzVlek8tbFxr8=;
 b=o7j+1XR4lNanCMV146+DCd+hU3zbnt6X7QkVy7XsBmIJo8n24tiGI3QySYNh4ILpFQ
 EupWxsaTOJ6BLVJ2Cmj+4B8nh5lFDR/3s3ebNVxmn2keBajE3Z26iH3cglVp1PQUB5kW
 xapPV+l9HT3MhKm68c/TLJ294tWpaiD5i01KBMEG6PtZLFQPLUoCEy3ehbTjKhgiNh8C
 soh7MEpmT86HWXjCRgCrdxxKsNFN0M2x73sFWoF6TbPeEDf3SJDfukLJtdUmE27zu1dV
 o76WeC9T+GjzvkKr++yCtEcVSV0yN/Ku6ZFyFSgbfMBG+rFap37/BF2HzHkQLiwIfYSc
 Ws9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K0kDGmNtNZhbyCmEZG6NUqoRAxxwmZZzVlek8tbFxr8=;
 b=WnJodg1A2Gx/WSiD8murc9XaYP2WCx4LJ4NOQpVj0by1YEdXWPsP4AKBz4nkf9lkiZ
 Bpn6csc4J87Li8rhIbXW8wngHFjQ47QvmhcW0oulRlMahyLuVRxHjJsSzvz38rSzK4JE
 v3kGiAlzInxDYGB3/FVQuziVlBpwlTS4XhTghh0YCn5LeZ5+REbHdieN57O/qkxKYFWu
 uwfYSQ1iQqv50rLoPVU1d3JjB4yLLkjh0A7AQXeT0XDogsIEUkYKYVbE5ILZKVvF7Csl
 g2ttIKUq+8qymjbdPjq7BDQf87TSlyFZ7GCPkwOGAWFxfxfTRsrqdC9/OWbeSzYlf6/o
 GZiw==
X-Gm-Message-State: AOAM530DIWbWdoDrcnNGS+01TNyYYhu2xhHEqoauEN5hgm1f8vVk5k2w
 qFXs2+o+QtCt4WiKu5+UsSgb+LeN8x7tPISGlfmtuVih6Z/YKG9T
X-Google-Smtp-Source: ABdhPJwAE/yGfdjBERtC66kdJJWOzvhwJXR8/wpbVdoowM2edcVRRnXf1J4CT4sq2ehLfed8O6Jh5pKSo3zjcCtL1Cs=
X-Received: by 2002:a5d:66cc:: with SMTP id k12mr8891630wrw.47.1603894795151; 
 Wed, 28 Oct 2020 07:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
 <CAKb7Uvi-+0nt8Jfp+kaRC=Eq2s5bSB_VFSHqSyV_9tgdDRvg9A@mail.gmail.com>
In-Reply-To: <CAKb7Uvi-+0nt8Jfp+kaRC=Eq2s5bSB_VFSHqSyV_9tgdDRvg9A@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 28 Oct 2020 14:19:37 +0000
Message-ID: <CAPY8ntBOnWo78VhhgRew9o67_0VrtLtAAcDY-U07ksCPQA-e0w@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] GT710 and Nouveau on ARM/ARM64
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

Hi Ilia

Thanks for taking the time to reply.

On Wed, 28 Oct 2020 at 14:10, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> The most common issue on arm is that the pci memory window is too narrow to allocate all the BARs. Can you see if there are messages in the kernel to that effect?

All the BAR allocations seem to succeed except for the IO one.
AIUI I/O is deprecated, but is it still used on these cards?

[    1.060851] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
[    1.060892] brcm-pcie fd500000.pcie:   No bus range found for
/scb/pcie@7d500000, using [bus 00-ff]
[    1.060975] brcm-pcie fd500000.pcie:      MEM
0x0600000000..0x063fffffff -> 0x00c0000000
[    1.061061] brcm-pcie fd500000.pcie:   IB MEM
0x0000000000..0x00ffffffff -> 0x0100000000
[    1.109943] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
[    1.110129] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
[    1.110159] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.110187] pci_bus 0000:00: root bus resource [mem
0x600000000-0x63fffffff] (bus address [0xc0000000-0xffffffff])
[    1.110286] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
[    1.110505] pci 0000:00:00.0: PME# supported from D0 D3hot
[    1.114095] pci 0000:00:00.0: bridge configuration invalid ([bus
00-00]), reconfiguring
[    1.114343] pci 0000:01:00.0: [10de:128b] type 00 class 0x030000
[    1.114404] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00ffffff]
[    1.114456] pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x07ffffff
64bit pref]
[    1.114510] pci 0000:01:00.0: reg 0x1c: [mem 0x00000000-0x01ffffff
64bit pref]
[    1.114551] pci 0000:01:00.0: reg 0x24: [io  0x0000-0x007f]
[    1.114590] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    1.114853] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
Gb/s with 8.0 GT/s PCIe x8 link)
[    1.115022] pci 0000:01:00.0: vgaarb: VGA device added:
decodes=io+mem,owns=none,locks=none
[    1.115125] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
[    1.115184] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
[    1.119065] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
[    1.119120] pci 0000:00:00.0: BAR 9: assigned [mem
0x600000000-0x60bffffff 64bit pref]
[    1.119151] pci 0000:00:00.0: BAR 8: assigned [mem 0x60c000000-0x60d7fffff]
[    1.119183] pci 0000:01:00.0: BAR 1: assigned [mem
0x600000000-0x607ffffff 64bit pref]
[    1.119235] pci 0000:01:00.0: BAR 3: assigned [mem
0x608000000-0x609ffffff 64bit pref]
[    1.119285] pci 0000:01:00.0: BAR 0: assigned [mem 0x60c000000-0x60cffffff]
[    1.119317] pci 0000:01:00.0: BAR 6: assigned [mem
0x60d000000-0x60d07ffff pref]
[    1.119345] pci 0000:01:00.1: BAR 0: assigned [mem 0x60d080000-0x60d083fff]
[    1.119376] pci 0000:01:00.0: BAR 5: no space for [io  size 0x0080]
[    1.119400] pci 0000:01:00.0: BAR 5: failed to assign [io  size 0x0080]
[    1.119426] pci 0000:00:00.0: PCI bridge to [bus 01]
[    1.119456] pci 0000:00:00.0:   bridge window [mem 0x60c000000-0x60d7fffff]
[    1.119484] pci 0000:00:00.0:   bridge window [mem
0x600000000-0x60bffffff 64bit pref]
[    1.119662] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0

  Dave

> On Wed, Oct 28, 2020, 9:46 AM Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
>>
>> Hi
>>
>> Seeing as we (Raspberry Pi) have just launched the Compute Module 4
>> with an exposed PCIe x1 lane, people are asking about adding graphics
>> cards.
>>
>> Seeing as you are the people who have the knowledge with regard to
>> NVidia and nouveau, what are your immediate thoughts of nouveau
>> working on ARM/ARM64? Is there a chance of this working? I'm no PCIe
>> expert, although I can call on some expertise :-/
>>
>> I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
>> in the memset of nvkm_instobj_new whilst initialising the BAR
>> subdevice [2], having gone through the "No such luck" path in
>> nvkm_mmu_ptc_get [3].
>>
>> Taking the naive approach of simply removing the memset, I get through
>> initialising all the subdevices, but again die in a location I
>> currently haven't pinpointed. The last logging messages are:
>> [ 1023.407302] nouveau 0000:01:00.0: fifo: one-time init completed in 760us
>> [ 1023.407312] nouveau 0000:01:00.0: fifo: init completed in 775us
>> [ 1023.407325] nouveau: DRM-master:00000000:80009009: init running...
>> [ 1023.407329] nouveau: DRM-master:00000000:80009009: init children...
>> [ 1023.407333] nouveau: DRM-master:00000000:80009009: init completed in 4us
>> [ 1023.407352] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
>> 00000000000d1000 engine 05 [BAR2] client 08 [HUB/HOST_CPU_NB] reason
>> 02 [PTE] on channel -1 [007fd38000 unknown]
>> [ 1023.407354] nouveau: DRM-master:00000000:00000000: ioctl: return 0
>> [ 1023.407385] nouveau: DRM-master:00000000:00000000: ioctl: size 32
>> [ 1023.407392] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
>> type 01 object ffffff80ee8c2170 owner ff
>> [ 1023.407415] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 8
>> [ 1023.407419] nouveau: DRM-master:00000000:80009009: ioctl: sclass
>> vers 0 count 0
>> [ 1023.407432] nouveau: DRM-master:00000000:00000000: ioctl: return 0
>> [ 1023.407452] nouveau: DRM-master:00000000:00000000: ioctl: size 48
>> [ 1023.407459] nouveau: DRM-master:00000000:00000000: ioctl: vers 0
>> type 01 object ffffff80ee8c2170 owner ff
>> [ 1023.407482] nouveau: DRM-master:00000000:80009009: ioctl: sclass size 24
>> [ 1023.407485] nouveau: DRM-master:00000000:80009009: ioctl: sclass
>> vers 0 count 2
>> [ 1023.407498] nouveau: DRM-master:00000000:00000000: ioctl: return 0
>> [ 1023.407519] nouveau: DRM-master:00000000:00000000: ioctl: size 48
>>
>> Any input very welcome, otherwise I'll continue blundering about
>> slightly in the dark.
>>
>> Thanks
>>   Dave
>>
>> [1] https://www.amazon.co.uk/ASUS-GT710-4H-SL-2GD5-GeForce-Multi-Monitor-Productivity/dp/B0897T6PYM/
>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c#L114
>> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c#L201
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
