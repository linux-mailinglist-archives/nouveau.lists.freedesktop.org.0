Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129C829D080
	for <lists+nouveau@lfdr.de>; Wed, 28 Oct 2020 15:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EC389FAD;
	Wed, 28 Oct 2020 14:59:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC88989FAD
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 14:59:37 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id b34so1599192uab.8
 for <nouveau@lists.freedesktop.org>; Wed, 28 Oct 2020 07:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=caxryTBr4fje1mWkD0I4Uj7lAOITo7Kxjh4hGirTdWU=;
 b=Hla0nK6iCTJ/0LZKmLpvivkTIBM/Gg5hm6PmW39jaIRIKn5AuMXj9xGOc6Jn48pbYF
 LCdATZGI+gYSLGWGj8Lr8a+EjvaQgoC7o03rbccRIab4B+OxSyOV0uNEqqsYtd0Xn8bI
 9kq35N13lVmboUprq2LCXleEn6+CIph5T+CBWnfRJnqfYty9A5i+g4c5hp9mik0p1YrT
 no7MFFSkkHcByjr/m85dYO3jrobWuZPXT5TQ6XmOkf/T5gSo12FsU3wbRWMwo+6hRVKT
 oM4eqZzI9cq2Pwwd2AoP6DHrTYk3utbvZihu1LipADS/u79SAE7DWwSadJz9Y80yKUar
 UKjQ==
X-Gm-Message-State: AOAM532iJ9nuaf0ew2ZYSY5SIvJisSl6ZBLQrbShNYm4NjY+8g040GUO
 kvEBsldEKlVKODTsoK9LgARKhTBT8kB48/K/5P84dVY2WHo=
X-Google-Smtp-Source: ABdhPJwUuRIu/zuCwMMMeU6A4GMEabRtFTsdhUe3TURxUaMIN9iMAi+vRAc9kdmCjYGdwKY1hwkNz+rdvaxECjjxq+c=
X-Received: by 2002:ab0:124:: with SMTP id 33mr4705674uak.98.1603897176993;
 Wed, 28 Oct 2020 07:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
 <CAKb7Uvi-+0nt8Jfp+kaRC=Eq2s5bSB_VFSHqSyV_9tgdDRvg9A@mail.gmail.com>
 <CAPY8ntBOnWo78VhhgRew9o67_0VrtLtAAcDY-U07ksCPQA-e0w@mail.gmail.com>
In-Reply-To: <CAPY8ntBOnWo78VhhgRew9o67_0VrtLtAAcDY-U07ksCPQA-e0w@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Wed, 28 Oct 2020 10:59:25 -0400
Message-ID: <CAKb7UvguZ0VfDLTUJwBpTjR_M1dHaeajrkjDCHmpKQty4Ja9yw@mail.gmail.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
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

On Wed, Oct 28, 2020 at 10:20 AM Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Ilia
>
> Thanks for taking the time to reply.
>
> On Wed, 28 Oct 2020 at 14:10, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > The most common issue on arm is that the pci memory window is too narrow to allocate all the BARs. Can you see if there are messages in the kernel to that effect?
>
> All the BAR allocations seem to succeed except for the IO one.
> AIUI I/O is deprecated, but is it still used on these cards?

I must admit I was ignorant of the fact that the IO ports were treated
as a BAR, but it makes a lot of sense.

One thing does stand out as odd:

>
> [    1.060851] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
> [    1.060892] brcm-pcie fd500000.pcie:   No bus range found for
> /scb/pcie@7d500000, using [bus 00-ff]
> [    1.060975] brcm-pcie fd500000.pcie:      MEM
> 0x0600000000..0x063fffffff -> 0x00c0000000
> [    1.061061] brcm-pcie fd500000.pcie:   IB MEM
> 0x0000000000..0x00ffffffff -> 0x0100000000
> [    1.109943] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
> [    1.110129] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
> [    1.110159] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.110187] pci_bus 0000:00: root bus resource [mem
> 0x600000000-0x63fffffff] (bus address [0xc0000000-0xffffffff])
> [    1.110286] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
> [    1.110505] pci 0000:00:00.0: PME# supported from D0 D3hot
> [    1.114095] pci 0000:00:00.0: bridge configuration invalid ([bus
> 00-00]), reconfiguring
> [    1.114343] pci 0000:01:00.0: [10de:128b] type 00 class 0x030000
> [    1.114404] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00ffffff]
> [    1.114456] pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x07ffffff
> 64bit pref]
> [    1.114510] pci 0000:01:00.0: reg 0x1c: [mem 0x00000000-0x01ffffff
> 64bit pref]
> [    1.114551] pci 0000:01:00.0: reg 0x24: [io  0x0000-0x007f]
> [    1.114590] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
> [    1.114853] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
> limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
> Gb/s with 8.0 GT/s PCIe x8 link)
> [    1.115022] pci 0000:01:00.0: vgaarb: VGA device added:
> decodes=io+mem,owns=none,locks=none
> [    1.115125] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
> [    1.115184] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
> [    1.119065] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> [    1.119120] pci 0000:00:00.0: BAR 9: assigned [mem
> 0x600000000-0x60bffffff 64bit pref]
> [    1.119151] pci 0000:00:00.0: BAR 8: assigned [mem 0x60c000000-0x60d7fffff]

This is your brcm-pcie device.

> [    1.119183] pci 0000:01:00.0: BAR 1: assigned [mem
> 0x600000000-0x607ffffff 64bit pref]
> [    1.119235] pci 0000:01:00.0: BAR 3: assigned [mem
> 0x608000000-0x609ffffff 64bit pref]
> [    1.119285] pci 0000:01:00.0: BAR 0: assigned [mem 0x60c000000-0x60cffffff]

And this is the NVIDIA device. Note that these memory windows are
identical (or at least overlapping). I must admit almost complete
ignorance of PCIe and whether this is OK, but it seems sketchy at
first glance. A quick eyeballing of my x86 system suggests that all
PCIe devices get non-overlapping windows. OTOH there are messages
further up about some sort of remapping going on, so perhaps it's OK?
But two things on the same bus still shouldn't have the same addresses
allocated, based on my (limited) understanding.

In case it's an option, could you "unplug" the NIC (not just not load
its driver, but make it not appear at all on the PCI bus)?

> [    1.119317] pci 0000:01:00.0: BAR 6: assigned [mem
> 0x60d000000-0x60d07ffff pref]

Never heard of a BAR6 on NVIDIA. Probably just my ignorance though.

> [    1.119345] pci 0000:01:00.1: BAR 0: assigned [mem 0x60d080000-0x60d083fff]
> [    1.119376] pci 0000:01:00.0: BAR 5: no space for [io  size 0x0080]
> [    1.119400] pci 0000:01:00.0: BAR 5: failed to assign [io  size 0x0080]
> [    1.119426] pci 0000:00:00.0: PCI bridge to [bus 01]
> [    1.119456] pci 0000:00:00.0:   bridge window [mem 0x60c000000-0x60d7fffff]
> [    1.119484] pci 0000:00:00.0:   bridge window [mem
> 0x600000000-0x60bffffff 64bit pref]
> [    1.119662] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0

Back to your original issue:

>
>   Dave
>
> > On Wed, Oct 28, 2020, 9:46 AM Dave Stevenson <dave.stevenson@raspberrypi.com> wrote:
> >>
> >> Hi
> >>
> >> Seeing as we (Raspberry Pi) have just launched the Compute Module 4
> >> with an exposed PCIe x1 lane, people are asking about adding graphics
> >> cards.
> >>
> >> Seeing as you are the people who have the knowledge with regard to
> >> NVidia and nouveau, what are your immediate thoughts of nouveau
> >> working on ARM/ARM64? Is there a chance of this working? I'm no PCIe
> >> expert, although I can call on some expertise :-/
> >>
> >> I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
> >> in the memset of nvkm_instobj_new whilst initialising the BAR
> >> subdevice [2], having gone through the "No such luck" path in
> >> nvkm_mmu_ptc_get [3].
> >>
> >> Taking the naive approach of simply removing the memset, I get through
> >> initialising all the subdevices, but again die in a location I
> >> currently haven't pinpointed. The last logging messages are:

That's not a winning strategy, I'm afraid. You need to figure out why
the memset is blowing up. The simplest explanation is "it's trying to
write to an I/O resource but that resource wasn't allocated", hence my
question about BARs. But something's not mapped, or mapped in the
wrong way, or whatever. If you can't write to it at that point in
time, you won't be able to write to it later either. I would focus on
that.

FWIW this all does "work" on ARM in general -- the Jetson
TK1/TX1/T(latest)1 are NVIDIA ARM devices with onboard *platform*
devices (not PCI) which work OK. So the core of nouveau works (or at
least worked) fine. Just some of the PCIe glue may be off.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
