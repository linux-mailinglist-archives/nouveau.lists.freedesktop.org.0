Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CAD2FE5F7
	for <lists+nouveau@lfdr.de>; Thu, 21 Jan 2021 10:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D0E6E049;
	Thu, 21 Jan 2021 09:11:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 776916E049
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611220286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pbplf9Sl2OA+jEnptp1T53Sr+m67yaibfSpRJ5rlkAU=;
 b=PYiLdwxse4M9V15BSQBJSh9rAKKBAY3bEK9JX3CPm6WzG8Ng7q3HOUSvBo9FHlD1oLcHUZ
 kcafOa42zqg5Del9zMaJCt6Dd0fU6NijwyH6TrETx46tjanAYSj9U2eYffau6HrMcUAJWg
 TGif/ywaj2FudoTYDbEgZ2XSbULxS3Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-Ps5ru4NCNmKVGAvyHAP_jw-1; Thu, 21 Jan 2021 04:11:21 -0500
X-MC-Unique: Ps5ru4NCNmKVGAvyHAP_jw-1
Received: by mail-wr1-f72.google.com with SMTP id o17so655834wra.8
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 01:11:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=pbplf9Sl2OA+jEnptp1T53Sr+m67yaibfSpRJ5rlkAU=;
 b=p7BDCCBoLD0Xvy9H1YlDsmCYrdPSuSGDBs5y9sa5P8svGPCgcTm+oa3afUqJskHddA
 Usk+cb/KA/17TSZdEYOnFJSsqb4I8mN2AFRS+zped09LupXYjhBabxVO2DU7+lOzJ4J8
 /xRJr32a15gj3zEfz8gNX7jylY9sAk3qHvAa6s4iOFDRDwbVDO4ZBDuNHy6XeUp/goBW
 UsFzlbofkilC8CAbu0SfuVD2NGAWOH++JWRda99WCPdaKqBqaZ5Gay9aBXNQc9aAjLp6
 kRMUSMnZGiVed1DHPaXayiJbdw/suJGeqnqeaZuCUj1voxL96+KW5d+b1SwduRrMo1GZ
 yC/w==
X-Gm-Message-State: AOAM533lORKOcFDG8AMMnCoP0Suej+jkqy85J133M11PpGRMEI38CDW2
 cSU0HAQrdtNkit+aqlG4HAg9LidzcHizh5bbX0pSL0+F5a5yOcDHsugD/AKhFOoEJwQwnN4xZ9T
 tM5vD0VYqHDC2jrO6J4BfDYWlHv91sgO1visbrkQUOQ==
X-Received: by 2002:adf:f707:: with SMTP id r7mr13713615wrp.113.1611220279900; 
 Thu, 21 Jan 2021 01:11:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgpVWzocCygyTPT6dDjY2yHIjCUEEPxumfl2nlkz6PJc3SRXyHWigURBcpybIrjahQRYJLof4gUYHYKxg4is8=
X-Received: by 2002:adf:f707:: with SMTP id r7mr13713588wrp.113.1611220279662; 
 Thu, 21 Jan 2021 01:11:19 -0800 (PST)
MIME-Version: 1.0
References: <X+WV8OiQzTIfLdgW@audible.transient.net>
 <CACO55tt9GbwBU6igAJ_8RjwzSZcDbu+_1wGWKiye3TosgoiHyw@mail.gmail.com>
 <X/NO9kAlCd/k8Di2@audible.transient.net>
 <X/NT0iN9KlSXQJJ7@audible.transient.net>
 <X/UsBWwFR+V0hIOS@audible.transient.net>
 <CACO55ttrFCOzREQxi3+SSaCSsAP1bEUBEt78ajkRGQQU1xYxtw@mail.gmail.com>
 <YAjn9jR+d2zRfNjb@audible.transient.net>
In-Reply-To: <YAjn9jR+d2zRfNjb@audible.transient.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 21 Jan 2021 10:11:08 +0100
Message-ID: <CACO55tu+5vv3dU3+O=DGDo9EdcyqFtpF4WR-VNj5eo89WMSfpw@mail.gmail.com>
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

fyi, there is a patch which solves a maybe related issue on your GPU,
mind giving it a try before we dig further?
https://gitlab.freedesktop.org/drm/nouveau/-/issues/14#note_767791

On Thu, Jan 21, 2021 at 3:33 AM Jamie Heilman
<jamie@audible.transient.net> wrote:
>
> Karol Herbst wrote:
> > On Wed, Jan 6, 2021 at 4:25 AM Jamie Heilman
> > <jamie@audible.transient.net> wrote:
> > >
> > > Jamie Heilman wrote:
> > > > Jamie Heilman wrote:
> > > > > Karol Herbst wrote:
> > > > > > do you think you'd be able to do a kernel bisect in order to pinpoint
> > > > > > the actual commit causing it? Thanks
> > > > >
> > > > > No.  I can't reproduce it reliably.  I if I could, bisection wouldn't
> > > > > be a problem but as I can't and as it can take weeks for the problem
> > > > > to occur there's essentially no chance.  I know it regressed roughly
> > > > > in 5.8-rc1 only because that's what I was running when the first event
> > > > > occured.
> > > >
> > > > er, 5.9.0-rc1 rather
> > >
> > > Actually ... I've found a way to reproduce this in hours intead of
> > > weeks, so I think I may be able to bisect it after all, it's something
> > > of a brute force approach and its probably doing horrible things to
> > > the backlight in my poor old monitor, but just running this:
> > >
> > > #!/bin/sh
> > > sleep 5
> > > while ! dmesg | tail | grep -q nouveau
> > > do
> > >     xset dpms force off
> > >     sleep 65
> > >     xdotool mousemove 1024 1024 mousemove restore
> > >     sleep 10
> > > done
> > >
> > > Does manage to trip the issue sooner than it would otherwise happen
> > > with natural usage.  Given that this is my primary workstation and I
> > > sort of need it functional during waking hours, it'll take me a bit,
> > > but I'll update folks when I have the error more dialed in.
> > >
> >
> > huh interesting. Kind of feels like a random thing still. But I think
> > in general you'd spend way too much time on this if you can't
> > reproduce within seconds/minutes and then it might not point out the
> > actual issue, because randomly the issue didn't appear and stuff.
> >
> > maybe you can tune it to have shorter pauses or something? I'd really
> > try to bring down the time per cycle.
>
> Well I'm confident enough, at this point, to say this bisects to
> 0a96099691c8 ("drm/nouveau/kms/nv50-: implement proper push buffer control logic")
>
> Now... I wish I could say the bisection was straightforward and
> simple, but it wasn't thanks to still not having a reproducer really
> dialed in.  The above script doesn't work unless I've got some normal
> usage around it.  It certainly triggers the issue sooner than it
> otherwise would, but by itself it isn't enough.  I modified it
> somewhat in the hopes of capturing the rough idea of how many
> itterations it would take to trigger the problem by using:
>
> #!/bin/sh
> I=0
> trap 'echo;echo $I' 0
> trap 'exit' INT
> sleep 5
> while ! dmesg | tail | grep -q nouveau
> do
>     I=$(($I + 1))
>     xset dpms force off
>     sleep 32
>     xdotool mousemove 1 12 mousemove restore
>     sleep 28
> done
>
> but ultimately that didn't really pan out the way I'd hoped.  I don't
> think the itterations have all that much to do with the condition in
> the end.  I wanted to try applying ca386aa7155a
> ("drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug") on
> top of the first bad commit becuase I sort of felt like when I was
> running -rc versions that things got a bit less chaotic after that
> commit landed, but it was just a gut feeling and I wanted to see if I
> could support it with metrics---but no, I can't really get consistent
> metrics even without that commit so I gave up, and decided to report
> what I've got so far.
>
>
>
> > > I'm using git bisect start -- drivers/gpu/drm include/drm include/video
> > > in an effort to make this go a bit quicker, let me know if you think
> > > that's a bad idea or I should add other paths.
> > >
> > > > > > On Sun, Dec 27, 2020 at 8:16 PM Jamie Heilman
> > > > > > <jamie@audible.transient.net> wrote:
> > > > > > >
> > > > > > > Something between v5.8 and v5.9 has resulted in periodically losing video.
> > > > > > > Unfortunately, I can't reliably reproduce it, it seems to happen every
> > > > > > > once in a long while---I can go weeks without an occurance, but it
> > > > > > > always seems to happen after my workstation has been idle long enough
> > > > > > > to screen blank and put the monitor to sleep.  I'm using a single
> > > > > > > display (Dell 2405FPW) connected via DVI, running X (Xorg 1.20.x from
> > > > > > > Debian sid).  I don't really do anything fancy, xterms, a browser or
> > > > > > > two, play the occasional video, but like I said, I can't reliably
> > > > > > > reproduce this.  I've had it happen about 11 times since August.
> > > > > > >
> > > > > > > lspci -vv output is:
> > > > > > >
> > > > > > > 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1) (prog-if 00 [VGA controller])
> > > > > > >         Subsystem: NVIDIA Corporation G86 [Quadro NVS 290]
> > > > > > >         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> > > > > > >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> > > > > > >         Latency: 0, Cache Line Size: 64 bytes
> > > > > > >         Interrupt: pin A routed to IRQ 28
> > > > > > >         Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
> > > > > > >         Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
> > > > > > >         Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
> > > > > > >         Region 5: I/O ports at dc80 [size=128]
> > > > > > >         Expansion ROM at 000c0000 [disabled] [size=128K]
> > > > > > >         Capabilities: [60] Power Management version 2
> > > > > > >                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> > > > > > >                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> > > > > > >         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> > > > > > >                 Address: 00000000fee01004  Data: 4023
> > > > > > >         Capabilities: [78] Express (v1) Endpoint, MSI 00
> > > > > > >                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
> > > > > > >                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25.000W
> > > > > > >                 DevCtl: CorrErr- NonFatalErr+ FatalErr+ UnsupReq-
> > > > > > >                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> > > > > > >                         MaxPayload 128 bytes, MaxReadReq 512 bytes
> > > > > > >                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> > > > > > >                 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
> > > > > > >                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> > > > > > >                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
> > > > > > >                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> > > > > > >                 LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
> > > > > > >                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> > > > > > >         Capabilities: [100 v1] Virtual Channel
> > > > > > >                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
> > > > > > >                 Arb:    Fixed- WRR32- WRR64- WRR128-
> > > > > > >                 Ctrl:   ArbSelect=Fixed
> > > > > > >                 Status: InProgress-
> > > > > > >                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> > > > > > >                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> > > > > > >                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> > > > > > >                         Status: NegoPending- InProgress-
> > > > > > >         Capabilities: [128 v1] Power Budgeting <?>
> > > > > > >         Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> > > > > > >         Kernel driver in use: nouveau
> > > > > > >
> > > > > > > The last time this happened, this is what got logged:
> > > > > > >
> > > > > > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > > > > > nouveau 0000:01:00.0: disp: Base 1:
> > > > > > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > > > > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > > > > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > > > > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > > > > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > > > > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > > > > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > > > > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > > > > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > > > > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > > > > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > > > > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > > > > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > > > > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > > > > > nouveau 0000:01:00.0: disp: Base 1:
> > > > > > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > > > > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > > > > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > > > > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > > > > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > > > > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > > > > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > > > > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > > > > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > > > > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > > > > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > > > > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > > > > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > > > > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > > > > > nouveau 0000:01:00.0: DRM: core notifier timeout
> > > > > > > nouveau 0000:01:00.0: DRM: base-0: timeout
> > > > > > >
> > > > > > > I've got logs of all of this, if they help I can collect them.  The
> > > > > > > timeout message are consistent the error messages a little less so.
> > > > > > >
> > > > > > > If there's more debugging I can do when this happens, I'd love to know
> > > > > > > what it is.
> > > > > > >
> > > > > > > kernel config: http://audible.transient.net/~jamie/k/nouveau.config-5.10.0
> > > > > > > dmesg at boot: http://audible.transient.net/~jamie/k/nouveau.dmesg
> > > > > > >
> > > > > > > --
> > > > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > > > > > _______________________________________________
> > > > > > > Nouveau mailing list
> > > > > > > Nouveau@lists.freedesktop.org
> > > > > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > > > > > >
> > > > > >
> > > > >
> > > > > --
> > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > >
> > > > --
> > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > >
> > > --
> > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > >
> >
>
> --
> Jamie Heilman                     http://audible.transient.net/~jamie/
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
