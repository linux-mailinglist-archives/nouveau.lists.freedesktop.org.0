Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CCA2E9F46
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 22:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A57E6E055;
	Mon,  4 Jan 2021 21:04:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id 29C216E039
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 17:43:47 +0000 (UTC)
Received: (qmail 13789 invoked from network); 4 Jan 2021 17:43:46 -0000
Received: from cucamonga.audible.transient.net (192.168.2.5)
 by canarsie.audible.transient.net with QMQP; 4 Jan 2021 17:43:46 -0000
Received: (nullmailer pid 6695 invoked by uid 1000);
 Mon, 04 Jan 2021 17:43:46 -0000
Date: Mon, 4 Jan 2021 17:43:46 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Message-ID: <X/NT0iN9KlSXQJJ7@audible.transient.net>
Mail-Followup-To: Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <X+WV8OiQzTIfLdgW@audible.transient.net>
 <CACO55tt9GbwBU6igAJ_8RjwzSZcDbu+_1wGWKiye3TosgoiHyw@mail.gmail.com>
 <X/NO9kAlCd/k8Di2@audible.transient.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/NO9kAlCd/k8Di2@audible.transient.net>
X-Mailman-Approved-At: Mon, 04 Jan 2021 21:04:22 +0000
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

Jamie Heilman wrote:
> Karol Herbst wrote:
> > do you think you'd be able to do a kernel bisect in order to pinpoint
> > the actual commit causing it? Thanks
> 
> No.  I can't reproduce it reliably.  I if I could, bisection wouldn't
> be a problem but as I can't and as it can take weeks for the problem
> to occur there's essentially no chance.  I know it regressed roughly
> in 5.8-rc1 only because that's what I was running when the first event
> occured.

er, 5.9.0-rc1 rather

> > On Sun, Dec 27, 2020 at 8:16 PM Jamie Heilman
> > <jamie@audible.transient.net> wrote:
> > >
> > > Something between v5.8 and v5.9 has resulted in periodically losing video.
> > > Unfortunately, I can't reliably reproduce it, it seems to happen every
> > > once in a long while---I can go weeks without an occurance, but it
> > > always seems to happen after my workstation has been idle long enough
> > > to screen blank and put the monitor to sleep.  I'm using a single
> > > display (Dell 2405FPW) connected via DVI, running X (Xorg 1.20.x from
> > > Debian sid).  I don't really do anything fancy, xterms, a browser or
> > > two, play the occasional video, but like I said, I can't reliably
> > > reproduce this.  I've had it happen about 11 times since August.
> > >
> > > lspci -vv output is:
> > >
> > > 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1) (prog-if 00 [VGA controller])
> > >         Subsystem: NVIDIA Corporation G86 [Quadro NVS 290]
> > >         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> > >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> > >         Latency: 0, Cache Line Size: 64 bytes
> > >         Interrupt: pin A routed to IRQ 28
> > >         Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
> > >         Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
> > >         Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
> > >         Region 5: I/O ports at dc80 [size=128]
> > >         Expansion ROM at 000c0000 [disabled] [size=128K]
> > >         Capabilities: [60] Power Management version 2
> > >                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> > >                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> > >         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> > >                 Address: 00000000fee01004  Data: 4023
> > >         Capabilities: [78] Express (v1) Endpoint, MSI 00
> > >                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
> > >                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25.000W
> > >                 DevCtl: CorrErr- NonFatalErr+ FatalErr+ UnsupReq-
> > >                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> > >                         MaxPayload 128 bytes, MaxReadReq 512 bytes
> > >                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> > >                 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
> > >                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> > >                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
> > >                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> > >                 LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
> > >                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> > >         Capabilities: [100 v1] Virtual Channel
> > >                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
> > >                 Arb:    Fixed- WRR32- WRR64- WRR128-
> > >                 Ctrl:   ArbSelect=Fixed
> > >                 Status: InProgress-
> > >                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> > >                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> > >                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> > >                         Status: NegoPending- InProgress-
> > >         Capabilities: [128 v1] Power Budgeting <?>
> > >         Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> > >         Kernel driver in use: nouveau
> > >
> > > The last time this happened, this is what got logged:
> > >
> > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > nouveau 0000:01:00.0: disp: Base 1:
> > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > nouveau 0000:01:00.0: disp: Base 1:
> > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > nouveau 0000:01:00.0: DRM: core notifier timeout
> > > nouveau 0000:01:00.0: DRM: base-0: timeout
> > >
> > > I've got logs of all of this, if they help I can collect them.  The
> > > timeout message are consistent the error messages a little less so.
> > >
> > > If there's more debugging I can do when this happens, I'd love to know
> > > what it is.
> > >
> > > kernel config: http://audible.transient.net/~jamie/k/nouveau.config-5.10.0
> > > dmesg at boot: http://audible.transient.net/~jamie/k/nouveau.dmesg
> > >
> > > --
> > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > >
> > 
> 
> -- 
> Jamie Heilman                     http://audible.transient.net/~jamie/

-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
