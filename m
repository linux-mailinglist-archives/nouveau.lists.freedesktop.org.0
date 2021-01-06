Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE3B2EBBC2
	for <lists+nouveau@lfdr.de>; Wed,  6 Jan 2021 10:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9AF89C7F;
	Wed,  6 Jan 2021 09:40:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC46C89C7F
 for <nouveau@lists.freedesktop.org>; Wed,  6 Jan 2021 09:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609926055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F3eUpnCrQuAZI0nuhza1dDy8L4a4noI5irQsCVVek9c=;
 b=YYdBNvi3u3ds+mMxY0WewJPGcjkI5NABQ6gfePvMglO1uOIgxewd7864yz/x9gniifRsXY
 zcMZu3FRfhQWTDL1qcKKGgBwHmzNUDasklS2te4ih7PREcYFVwijENrapkDep7MesNL6/U
 84osxeOJN/QdfteqLcEckFcOBdFS7kk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-bZjKRJDOMjynTO1OGyR31Q-1; Wed, 06 Jan 2021 04:40:52 -0500
X-MC-Unique: bZjKRJDOMjynTO1OGyR31Q-1
Received: by mail-wr1-f70.google.com with SMTP id 88so1105652wrc.17
 for <nouveau@lists.freedesktop.org>; Wed, 06 Jan 2021 01:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=F3eUpnCrQuAZI0nuhza1dDy8L4a4noI5irQsCVVek9c=;
 b=N4Ry3mvmna4kESYxgnyEwr1Kn61gT0yTs8nW57O92gHUqz3xF20zWmENo97C/B5tBv
 XMua9pJKfcK34ifD/jmlEd1V1bjKbehH8K7hv48OHK3Ot5GnhBEZVpMRztL9e59MP6h1
 1eCVHbc1/ZA/Ntim/6MGt6lcJzLyhFba9xZ5n5BvFiy/TITPJQ0DMSmSlWge6QdJS4Og
 QvFfOTi231fr0aR3GGGscNpvPUQeEfZrMZXtGdgf9sYNJVdO/VK0n8pA7/xqeDxRY0mZ
 TBdO1Klkv4Ieb3BlpqEPuCqRGVJEiVJeLWMIuUicZAqTUQgoGktUPHMH8PhaHb/Vyald
 /vhA==
X-Gm-Message-State: AOAM530ExISrb10d/sXcWmXEo2TLIweSeuL2h0CGSp4Sc/YfuY6chzJE
 /2C5hsH0ZEkZPQdXwWXyZLHUcIWF9T2lU5nHd05tQNKo9JP5nXQHaaBAoTDJ50sb4P88fiiZiKj
 +A4wOVeInKEYSa0IQB3n818JoOkE52lNhANPI20etgg==
X-Received: by 2002:a1c:9e86:: with SMTP id h128mr2939075wme.171.1609926051381; 
 Wed, 06 Jan 2021 01:40:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB9Fbr2x3P8X4E31YrRWwe/aDqOwBxQj814mpAcqTAlWdhQYNMg0RXwSbqs/N2/dEBKAcKJ7b4k+qTUYogmL8=
X-Received: by 2002:a1c:9e86:: with SMTP id h128mr2939052wme.171.1609926050928; 
 Wed, 06 Jan 2021 01:40:50 -0800 (PST)
MIME-Version: 1.0
References: <X+WV8OiQzTIfLdgW@audible.transient.net>
 <CACO55tt9GbwBU6igAJ_8RjwzSZcDbu+_1wGWKiye3TosgoiHyw@mail.gmail.com>
 <X/NO9kAlCd/k8Di2@audible.transient.net>
 <X/NT0iN9KlSXQJJ7@audible.transient.net>
 <X/UsBWwFR+V0hIOS@audible.transient.net>
In-Reply-To: <X/UsBWwFR+V0hIOS@audible.transient.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 6 Jan 2021 10:40:40 +0100
Message-ID: <CACO55ttrFCOzREQxi3+SSaCSsAP1bEUBEt78ajkRGQQU1xYxtw@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 LKML <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau regression post v5.8, still present in v5.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 6, 2021 at 4:25 AM Jamie Heilman
<jamie@audible.transient.net> wrote:
>
> Jamie Heilman wrote:
> > Jamie Heilman wrote:
> > > Karol Herbst wrote:
> > > > do you think you'd be able to do a kernel bisect in order to pinpoint
> > > > the actual commit causing it? Thanks
> > >
> > > No.  I can't reproduce it reliably.  I if I could, bisection wouldn't
> > > be a problem but as I can't and as it can take weeks for the problem
> > > to occur there's essentially no chance.  I know it regressed roughly
> > > in 5.8-rc1 only because that's what I was running when the first event
> > > occured.
> >
> > er, 5.9.0-rc1 rather
>
> Actually ... I've found a way to reproduce this in hours intead of
> weeks, so I think I may be able to bisect it after all, it's something
> of a brute force approach and its probably doing horrible things to
> the backlight in my poor old monitor, but just running this:
>
> #!/bin/sh
> sleep 5
> while ! dmesg | tail | grep -q nouveau
> do
>     xset dpms force off
>     sleep 65
>     xdotool mousemove 1024 1024 mousemove restore
>     sleep 10
> done
>
> Does manage to trip the issue sooner than it would otherwise happen
> with natural usage.  Given that this is my primary workstation and I
> sort of need it functional during waking hours, it'll take me a bit,
> but I'll update folks when I have the error more dialed in.
>

huh interesting. Kind of feels like a random thing still. But I think
in general you'd spend way too much time on this if you can't
reproduce within seconds/minutes and then it might not point out the
actual issue, because randomly the issue didn't appear and stuff.

maybe you can tune it to have shorter pauses or something? I'd really
try to bring down the time per cycle.

> I'm using git bisect start -- drivers/gpu/drm include/drm include/video
> in an effort to make this go a bit quicker, let me know if you think
> that's a bad idea or I should add other paths.
>
> > > > On Sun, Dec 27, 2020 at 8:16 PM Jamie Heilman
> > > > <jamie@audible.transient.net> wrote:
> > > > >
> > > > > Something between v5.8 and v5.9 has resulted in periodically losing video.
> > > > > Unfortunately, I can't reliably reproduce it, it seems to happen every
> > > > > once in a long while---I can go weeks without an occurance, but it
> > > > > always seems to happen after my workstation has been idle long enough
> > > > > to screen blank and put the monitor to sleep.  I'm using a single
> > > > > display (Dell 2405FPW) connected via DVI, running X (Xorg 1.20.x from
> > > > > Debian sid).  I don't really do anything fancy, xterms, a browser or
> > > > > two, play the occasional video, but like I said, I can't reliably
> > > > > reproduce this.  I've had it happen about 11 times since August.
> > > > >
> > > > > lspci -vv output is:
> > > > >
> > > > > 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1) (prog-if 00 [VGA controller])
> > > > >         Subsystem: NVIDIA Corporation G86 [Quadro NVS 290]
> > > > >         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> > > > >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> > > > >         Latency: 0, Cache Line Size: 64 bytes
> > > > >         Interrupt: pin A routed to IRQ 28
> > > > >         Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
> > > > >         Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
> > > > >         Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
> > > > >         Region 5: I/O ports at dc80 [size=128]
> > > > >         Expansion ROM at 000c0000 [disabled] [size=128K]
> > > > >         Capabilities: [60] Power Management version 2
> > > > >                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> > > > >                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> > > > >         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> > > > >                 Address: 00000000fee01004  Data: 4023
> > > > >         Capabilities: [78] Express (v1) Endpoint, MSI 00
> > > > >                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
> > > > >                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25.000W
> > > > >                 DevCtl: CorrErr- NonFatalErr+ FatalErr+ UnsupReq-
> > > > >                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> > > > >                         MaxPayload 128 bytes, MaxReadReq 512 bytes
> > > > >                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> > > > >                 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
> > > > >                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> > > > >                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
> > > > >                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> > > > >                 LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
> > > > >                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> > > > >         Capabilities: [100 v1] Virtual Channel
> > > > >                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
> > > > >                 Arb:    Fixed- WRR32- WRR64- WRR128-
> > > > >                 Ctrl:   ArbSelect=Fixed
> > > > >                 Status: InProgress-
> > > > >                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> > > > >                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> > > > >                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> > > > >                         Status: NegoPending- InProgress-
> > > > >         Capabilities: [128 v1] Power Budgeting <?>
> > > > >         Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> > > > >         Kernel driver in use: nouveau
> > > > >
> > > > > The last time this happened, this is what got logged:
> > > > >
> > > > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > > > nouveau 0000:01:00.0: disp: Base 1:
> > > > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > > > nouveau 0000:01:00.0: disp: Base 1:
> > > > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > > > nouveau 0000:01:00.0: DRM: core notifier timeout
> > > > > nouveau 0000:01:00.0: DRM: base-0: timeout
> > > > >
> > > > > I've got logs of all of this, if they help I can collect them.  The
> > > > > timeout message are consistent the error messages a little less so.
> > > > >
> > > > > If there's more debugging I can do when this happens, I'd love to know
> > > > > what it is.
> > > > >
> > > > > kernel config: http://audible.transient.net/~jamie/k/nouveau.config-5.10.0
> > > > > dmesg at boot: http://audible.transient.net/~jamie/k/nouveau.dmesg
> > > > >
> > > > > --
> > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > > > _______________________________________________
> > > > > Nouveau mailing list
> > > > > Nouveau@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > > > >
> > > >
> > >
> > > --
> > > Jamie Heilman                     http://audible.transient.net/~jamie/
> >
> > --
> > Jamie Heilman                     http://audible.transient.net/~jamie/
>
> --
> Jamie Heilman                     http://audible.transient.net/~jamie/
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
