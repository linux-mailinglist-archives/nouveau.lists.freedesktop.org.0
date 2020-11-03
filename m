Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4852A4EF9
	for <lists+nouveau@lfdr.de>; Tue,  3 Nov 2020 19:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDF56E8E8;
	Tue,  3 Nov 2020 18:34:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D9A6E154
 for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2020 18:34:42 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c16so263746wmd.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Nov 2020 10:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWd6GUTP9k4ShWmbzfNf9FvXL4VnIPLaFDJecbqAuWE=;
 b=IyFXgbDyt5gTz/A/ptV+PAU7cizY4BAlYN97SeD0I2y0A+1JSqNlp1tXJ/OAI35Dk1
 Ijpy5Rsm13efIgI1fr5Lh312etvv7/cuFxIok8k52HLRlGgHcph7/g50kpcKj/xh482d
 18E5naY8PuNp35hlxO9xwStZA99TftCFgXQq63O4gCkCb8OFbujB+OEYa6EuMztSetEI
 pl7o1Xz7CelFdzZvpA4r9Li91s2HDEuAsWU+I3zC/oCSMeYWLCt47hxDl7DP+HzYQ3oN
 TPdRC92puRI75zuvuy3YPuBM0BjYWnegwwu/VT3iBe2KuxMN1cNtcUMweI3+qwgAbQyT
 dyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWd6GUTP9k4ShWmbzfNf9FvXL4VnIPLaFDJecbqAuWE=;
 b=p7dzzeoa0dZjd6MNu68F7xNpG3+bsF8tqXlKgCjdPysPReIQ9e3TOkSpIPATV+SHID
 xr9XeelBQO4rO7fQVZKjOJLnI5k0AdY6Qhcq3T6Hfd18F04YYL0FkP+xqJ3olRyn4gxF
 4nKT44/ZQVVtUNkFD7poKIaWlJ0jJF4RuMngssLTiuZbd7iovrtPX21VIsxTGy92UJSB
 vXVBR4IPGfkt9dlBBsAhAV4zVo1fQ2xHCI/En4uGcqNQ7WGSh68Fd7d+hoBVSS2lVZL5
 CKYkKdKqf+xVhSUk+rkqlraICImGUAS7p/0ltSVrr+JTLqQSt2NNSIPOLD3+YFEl+ev+
 4H6w==
X-Gm-Message-State: AOAM530ipIgrcwaWMKjl8M6IoD75RwO2w71Svxye+hTL/SaGZgv06uXq
 EU0o0fFTn33enEt73EdGhHwompHPTFUU41+YjdOFLBIoLaM=
X-Google-Smtp-Source: ABdhPJwp28j7uyRzbhR1x79r7/HiWM5zbzZxu4uYVmp7MbB/q/my/J0tmFQ1eL3HxHJI/3+xPUGJRtd3h9v7WACFM3M=
X-Received: by 2002:a7b:c932:: with SMTP id h18mr549685wml.82.1604428481521;
 Tue, 03 Nov 2020 10:34:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPY8ntDMWeJao5Ld435s0cLSH-a7yYe4=daUso-nZNLdarMupg@mail.gmail.com>
 <CAKb7Uvi-+0nt8Jfp+kaRC=Eq2s5bSB_VFSHqSyV_9tgdDRvg9A@mail.gmail.com>
 <CAPY8ntBOnWo78VhhgRew9o67_0VrtLtAAcDY-U07ksCPQA-e0w@mail.gmail.com>
 <CAKb7UvguZ0VfDLTUJwBpTjR_M1dHaeajrkjDCHmpKQty4Ja9yw@mail.gmail.com>
 <CAPY8ntC6NTJyMyXv_1wrw4D52-MRRFn8AVZaVpKJ5NEaba1thg@mail.gmail.com>
 <CAKb7UvhqU-2tSWD4xjpoxKJsp1F=FhgSHaHr6sr2uagpxHMYzQ@mail.gmail.com>
In-Reply-To: <CAKb7UvhqU-2tSWD4xjpoxKJsp1F=FhgSHaHr6sr2uagpxHMYzQ@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 3 Nov 2020 18:34:25 +0000
Message-ID: <CAPY8ntCTo9vh7jnAc+xLR+8cC0JqzfXCAcVJUgEKK3Efki5nWA@mail.gmail.com>
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

On Tue, 3 Nov 2020 at 18:25, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Tue, Nov 3, 2020 at 1:08 PM Dave Stevenson
> <dave.stevenson@raspberrypi.com> wrote:
> >
> > Hi Ilia
> > Thanks again for the reply.
> >
> > On Wed, 28 Oct 2020 at 14:59, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > >
> > > On Wed, Oct 28, 2020 at 10:20 AM Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Ilia
> > > >
> > > > Thanks for taking the time to reply.
> > > >
> > > > On Wed, 28 Oct 2020 at 14:10, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > > >
> > > > > The most common issue on arm is that the pci memory window is too narrow to allocate all the BARs. Can you see if there are messages in the kernel to that effect?
> > > >
> > > > All the BAR allocations seem to succeed except for the IO one.
> > > > AIUI I/O is deprecated, but is it still used on these cards?
> > >
> > > I must admit I was ignorant of the fact that the IO ports were treated
> > > as a BAR, but it makes a lot of sense.
> > >
> > > One thing does stand out as odd:
> > >
> > > >
> > > > [    1.060851] brcm-pcie fd500000.pcie: host bridge /scb/pcie@7d500000 ranges:
> > > > [    1.060892] brcm-pcie fd500000.pcie:   No bus range found for
> > > > /scb/pcie@7d500000, using [bus 00-ff]
> > > > [    1.060975] brcm-pcie fd500000.pcie:      MEM
> > > > 0x0600000000..0x063fffffff -> 0x00c0000000
> > > > [    1.061061] brcm-pcie fd500000.pcie:   IB MEM
> > > > 0x0000000000..0x00ffffffff -> 0x0100000000
> > > > [    1.109943] brcm-pcie fd500000.pcie: link up, 5.0 GT/s PCIe x1 (SSC)
> > > > [    1.110129] brcm-pcie fd500000.pcie: PCI host bridge to bus 0000:00
> > > > [    1.110159] pci_bus 0000:00: root bus resource [bus 00-ff]
> > > > [    1.110187] pci_bus 0000:00: root bus resource [mem
> > > > 0x600000000-0x63fffffff] (bus address [0xc0000000-0xffffffff])
> > > > [    1.110286] pci 0000:00:00.0: [14e4:2711] type 01 class 0x060400
> > > > [    1.110505] pci 0000:00:00.0: PME# supported from D0 D3hot
> > > > [    1.114095] pci 0000:00:00.0: bridge configuration invalid ([bus
> > > > 00-00]), reconfiguring
> > > > [    1.114343] pci 0000:01:00.0: [10de:128b] type 00 class 0x030000
> > > > [    1.114404] pci 0000:01:00.0: reg 0x10: [mem 0x00000000-0x00ffffff]
> > > > [    1.114456] pci 0000:01:00.0: reg 0x14: [mem 0x00000000-0x07ffffff
> > > > 64bit pref]
> > > > [    1.114510] pci 0000:01:00.0: reg 0x1c: [mem 0x00000000-0x01ffffff
> > > > 64bit pref]
> > > > [    1.114551] pci 0000:01:00.0: reg 0x24: [io  0x0000-0x007f]
> > > > [    1.114590] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
> > > > [    1.114853] pci 0000:01:00.0: 4.000 Gb/s available PCIe bandwidth,
> > > > limited by 5.0 GT/s PCIe x1 link at 0000:00:00.0 (capable of 63.008
> > > > Gb/s with 8.0 GT/s PCIe x8 link)
> > > > [    1.115022] pci 0000:01:00.0: vgaarb: VGA device added:
> > > > decodes=io+mem,owns=none,locks=none
> > > > [    1.115125] pci 0000:01:00.1: [10de:0e0f] type 00 class 0x040300
> > > > [    1.115184] pci 0000:01:00.1: reg 0x10: [mem 0x00000000-0x00003fff]
> > > > [    1.119065] pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
> > > > [    1.119120] pci 0000:00:00.0: BAR 9: assigned [mem
> > > > 0x600000000-0x60bffffff 64bit pref]
> > > > [    1.119151] pci 0000:00:00.0: BAR 8: assigned [mem 0x60c000000-0x60d7fffff]
> > >
> > > This is your brcm-pcie device.
> > >
> > > > [    1.119183] pci 0000:01:00.0: BAR 1: assigned [mem
> > > > 0x600000000-0x607ffffff 64bit pref]
> > > > [    1.119235] pci 0000:01:00.0: BAR 3: assigned [mem
> > > > 0x608000000-0x609ffffff 64bit pref]
> > > > [    1.119285] pci 0000:01:00.0: BAR 0: assigned [mem 0x60c000000-0x60cffffff]
> > >
> > > And this is the NVIDIA device. Note that these memory windows are
> > > identical (or at least overlapping). I must admit almost complete
> > > ignorance of PCIe and whether this is OK, but it seems sketchy at
> > > first glance. A quick eyeballing of my x86 system suggests that all
> > > PCIe devices get non-overlapping windows. OTOH there are messages
> > > further up about some sort of remapping going on, so perhaps it's OK?
> > > But two things on the same bus still shouldn't have the same addresses
> > > allocated, based on my (limited) understanding.
> >
> > I've raised this with colleagues and it seems that this is normal.
> > The PCI bridge reports the window through which devices can be mapped,
> > and all devices have to fit within that. Pass as to whether that is a
> > quirk of ARM or this particular bridge.
> >
> > I do note that on my x86 systems device 0000:00:00.0 is reported by
> > lspci as a "Host bridge" instead of a "PCI bridge".
> > On an Ubuntu VM I've got running, I do get
> > [    0.487249] PCI host bridge to bus 0000:00
> > [    0.487252] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
> > [    0.487254] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> > [    0.487256] pci_bus 0000:00: root bus resource [mem
> > 0x000a0000-0x000bffff window]
> > [    0.487258] pci_bus 0000:00: root bus resource [mem
> > 0xe0000000-0xfdffffff window]
> > [    0.487260] pci_bus 0000:00: root bus resource [bus 00-ff]
> > and all device allocations are from within those ranges, so I'm not
> > convinced it's that different.
> >
> > > In case it's an option, could you "unplug" the NIC (not just not load
> > > its driver, but make it not appear at all on the PCI bus)?
> >
> > NIC? The network interface is totally separate. Or is this another
> > reuse of a TLA?
> >
> > Unplugging the GPU means the PCI bus reports as being down and I get
> > no output at all from lspci.
>
> Oh duh. I thought brcm-pcie was a broadcom NIC. Apparently it's the
> whole bus - can't unplug that! Also explains the "conflict" which
> makes a lot more sense if you (correctly) understand that other
> "device" is the bus itself. Apologies for the misinterpretation :(
> [And in hindsight, RPi runs on a Broadcom SoC, so ... I should have
> remembered that. In my mind they just make network stuff, will try to
> get that updated.]

Phew, I thought I was going crazy :-)

> > > > >> I've tried it so far with a GT710 board [1] and ARM64. It's blowing up
> > > > >> in the memset of nvkm_instobj_new whilst initialising the BAR
> > > > >> subdevice [2], having gone through the "No such luck" path in
> > > > >> nvkm_mmu_ptc_get [3].
> > > > >>
> > > > >> Taking the naive approach of simply removing the memset, I get through
> > > > >> initialising all the subdevices, but again die in a location I
> > > > >> currently haven't pinpointed. The last logging messages are:
> > >
> > > That's not a winning strategy, I'm afraid. You need to figure out why
> > > the memset is blowing up. The simplest explanation is "it's trying to
> > > write to an I/O resource but that resource wasn't allocated", hence my
> > > question about BARs. But something's not mapped, or mapped in the
> > > wrong way, or whatever. If you can't write to it at that point in
> > > time, you won't be able to write to it later either. I would focus on
> > > that.
> >
> > I did say it was the naive approach :-)
> > I was trying to gauge how much effort was going to be needed to get
> > this going. Was it going to blow up in 1, 10, or 100 places? It feels
> > like it is only a couple of things that are wrong, so there is hope.
> >
> > Slightly annoyingly something more urgent has come up and I need to
> > shelve my experimentation for now, but thanks for the pointers. At
> > least I have some idea of where to start looking when time allows.
>
> When/if you do get back to it, you might consider posting a more
> complete log without getting rid of the memset, perhaps the nature of
> the blow-up will make the underlying problem more apparent, or make
> further investigation paths apparent.

Will do, thanks.

  Dave
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
