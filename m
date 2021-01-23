Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 515993016A2
	for <lists+nouveau@lfdr.de>; Sat, 23 Jan 2021 17:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0406E212;
	Sat, 23 Jan 2021 16:11:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
 by gabe.freedesktop.org (Postfix) with SMTP id 3B8246EA93
 for <nouveau@lists.freedesktop.org>; Sat, 23 Jan 2021 00:44:49 +0000 (UTC)
Received: (qmail 18715 invoked from network); 23 Jan 2021 00:44:48 -0000
Received: from cucamonga.audible.transient.net (192.168.2.5)
 by canarsie.audible.transient.net with QMQP; 23 Jan 2021 00:44:48 -0000
Received: (nullmailer pid 2945 invoked by uid 1000);
 Sat, 23 Jan 2021 00:44:48 -0000
Date: Sat, 23 Jan 2021 00:44:48 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Message-ID: <YAtxgP6YJJwcotuA@audible.transient.net>
Mail-Followup-To: Karol Herbst <kherbst@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <X+WV8OiQzTIfLdgW@audible.transient.net>
 <CACO55tt9GbwBU6igAJ_8RjwzSZcDbu+_1wGWKiye3TosgoiHyw@mail.gmail.com>
 <X/NO9kAlCd/k8Di2@audible.transient.net>
 <X/NT0iN9KlSXQJJ7@audible.transient.net>
 <X/UsBWwFR+V0hIOS@audible.transient.net>
 <CACO55ttrFCOzREQxi3+SSaCSsAP1bEUBEt78ajkRGQQU1xYxtw@mail.gmail.com>
 <YAjn9jR+d2zRfNjb@audible.transient.net>
 <CACO55tu+5vv3dU3+O=DGDo9EdcyqFtpF4WR-VNj5eo89WMSfpw@mail.gmail.com>
 <YAtMEGJxlRklqYw8@audible.transient.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAtMEGJxlRklqYw8@audible.transient.net>
X-Mailman-Approved-At: Sat, 23 Jan 2021 16:11:02 +0000
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
> > fyi, there is a patch which solves a maybe related issue on your GPU,
> > mind giving it a try before we dig further?
> > https://gitlab.freedesktop.org/drm/nouveau/-/issues/14#note_767791
> 
> So, I tried that.  Turns out, I can still trigger a problem.  Is it
> the same problem?  Maybe?  I also tried applying the patch from 
> 
> ca386aa7155a ("drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug")
> to 5.8.0-rc6-01516-g0a96099691c8 and very interestingly, it changed
> the mode of failure to same thing I saw with 5.10.9 patched with the patch
> from that bug report.  In both cases I get this in the log:
> 
> kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> kern.err: nouveau 0000:01:00.0: Xorg[2243]: nv50cal_space: -16
> ...
> and so on
> 
> In one incident my monitor would't even wake up anymore after this.
> 
> 
> I'm trying to repo it now on an unpatched 5.8.0-rc6-01515-gae09163ac27c
> right now, as running glxgears does seem to help reproduce problems
> faster which is nice, I'm just not entirely sure it's the same set of
> problems; hopefully that version is free from issues, but we'll
> see...

Ugh, well I can crash 5.8.0-rc6-01515-gae09163ac27c and 5.8.18 in
basically the same way running glxgears and a xset dpms force off
loop.  So I'm starting to think it's not the same thing, and that
problem has been latent from before I started having periodic issues.

I should note that my exact testing technique for the above was to run
4 copies of glxgears and the xset force dpms off loop at the same
time.  Really looks more like it triggers a resource starvation issue
maybe.  The crash is also worse, particularly if I don't do anything
about it right away as my workstation eventually falls off the network
and I'm forced to power cycle it; the crashes I was chasing after
wouldn't do quite that much violence, normally I could still log in,
rebuild a kernel, and shut things down cleanly.

More than one bug here I suspect.

> > On Thu, Jan 21, 2021 at 3:33 AM Jamie Heilman
> > <jamie@audible.transient.net> wrote:
> > >
> > > Karol Herbst wrote:
> > > > On Wed, Jan 6, 2021 at 4:25 AM Jamie Heilman
> > > > <jamie@audible.transient.net> wrote:
> > > > >
> > > > > Jamie Heilman wrote:
> > > > > > Jamie Heilman wrote:
> > > > > > > Karol Herbst wrote:
> > > > > > > > do you think you'd be able to do a kernel bisect in order to pinpoint
> > > > > > > > the actual commit causing it? Thanks
> > > > > > >
> > > > > > > No.  I can't reproduce it reliably.  I if I could, bisection wouldn't
> > > > > > > be a problem but as I can't and as it can take weeks for the problem
> > > > > > > to occur there's essentially no chance.  I know it regressed roughly
> > > > > > > in 5.8-rc1 only because that's what I was running when the first event
> > > > > > > occured.
> > > > > >
> > > > > > er, 5.9.0-rc1 rather
> > > > >
> > > > > Actually ... I've found a way to reproduce this in hours intead of
> > > > > weeks, so I think I may be able to bisect it after all, it's something
> > > > > of a brute force approach and its probably doing horrible things to
> > > > > the backlight in my poor old monitor, but just running this:
> > > > >
> > > > > #!/bin/sh
> > > > > sleep 5
> > > > > while ! dmesg | tail | grep -q nouveau
> > > > > do
> > > > >     xset dpms force off
> > > > >     sleep 65
> > > > >     xdotool mousemove 1024 1024 mousemove restore
> > > > >     sleep 10
> > > > > done
> > > > >
> > > > > Does manage to trip the issue sooner than it would otherwise happen
> > > > > with natural usage.  Given that this is my primary workstation and I
> > > > > sort of need it functional during waking hours, it'll take me a bit,
> > > > > but I'll update folks when I have the error more dialed in.
> > > > >
> > > >
> > > > huh interesting. Kind of feels like a random thing still. But I think
> > > > in general you'd spend way too much time on this if you can't
> > > > reproduce within seconds/minutes and then it might not point out the
> > > > actual issue, because randomly the issue didn't appear and stuff.
> > > >
> > > > maybe you can tune it to have shorter pauses or something? I'd really
> > > > try to bring down the time per cycle.
> > >
> > > Well I'm confident enough, at this point, to say this bisects to
> > > 0a96099691c8 ("drm/nouveau/kms/nv50-: implement proper push buffer control logic")
> > >
> > > Now... I wish I could say the bisection was straightforward and
> > > simple, but it wasn't thanks to still not having a reproducer really
> > > dialed in.  The above script doesn't work unless I've got some normal
> > > usage around it.  It certainly triggers the issue sooner than it
> > > otherwise would, but by itself it isn't enough.  I modified it
> > > somewhat in the hopes of capturing the rough idea of how many
> > > itterations it would take to trigger the problem by using:
> > >
> > > #!/bin/sh
> > > I=0
> > > trap 'echo;echo $I' 0
> > > trap 'exit' INT
> > > sleep 5
> > > while ! dmesg | tail | grep -q nouveau
> > > do
> > >     I=$(($I + 1))
> > >     xset dpms force off
> > >     sleep 32
> > >     xdotool mousemove 1 12 mousemove restore
> > >     sleep 28
> > > done
> > >
> > > but ultimately that didn't really pan out the way I'd hoped.  I don't
> > > think the itterations have all that much to do with the condition in
> > > the end.  I wanted to try applying ca386aa7155a
> > > ("drm/nouveau/kms/nv50-gp1xx: add WAR for EVO push buffer HW bug") on
> > > top of the first bad commit becuase I sort of felt like when I was
> > > running -rc versions that things got a bit less chaotic after that
> > > commit landed, but it was just a gut feeling and I wanted to see if I
> > > could support it with metrics---but no, I can't really get consistent
> > > metrics even without that commit so I gave up, and decided to report
> > > what I've got so far.
> > >
> > >
> > >
> > > > > I'm using git bisect start -- drivers/gpu/drm include/drm include/video
> > > > > in an effort to make this go a bit quicker, let me know if you think
> > > > > that's a bad idea or I should add other paths.
> > > > >
> > > > > > > > On Sun, Dec 27, 2020 at 8:16 PM Jamie Heilman
> > > > > > > > <jamie@audible.transient.net> wrote:
> > > > > > > > >
> > > > > > > > > Something between v5.8 and v5.9 has resulted in periodically losing video.
> > > > > > > > > Unfortunately, I can't reliably reproduce it, it seems to happen every
> > > > > > > > > once in a long while---I can go weeks without an occurance, but it
> > > > > > > > > always seems to happen after my workstation has been idle long enough
> > > > > > > > > to screen blank and put the monitor to sleep.  I'm using a single
> > > > > > > > > display (Dell 2405FPW) connected via DVI, running X (Xorg 1.20.x from
> > > > > > > > > Debian sid).  I don't really do anything fancy, xterms, a browser or
> > > > > > > > > two, play the occasional video, but like I said, I can't reliably
> > > > > > > > > reproduce this.  I've had it happen about 11 times since August.
> > > > > > > > >
> > > > > > > > > lspci -vv output is:
> > > > > > > > >
> > > > > > > > > 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1) (prog-if 00 [VGA controller])
> > > > > > > > >         Subsystem: NVIDIA Corporation G86 [Quadro NVS 290]
> > > > > > > > >         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> > > > > > > > >         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> > > > > > > > >         Latency: 0, Cache Line Size: 64 bytes
> > > > > > > > >         Interrupt: pin A routed to IRQ 28
> > > > > > > > >         Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
> > > > > > > > >         Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
> > > > > > > > >         Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
> > > > > > > > >         Region 5: I/O ports at dc80 [size=128]
> > > > > > > > >         Expansion ROM at 000c0000 [disabled] [size=128K]
> > > > > > > > >         Capabilities: [60] Power Management version 2
> > > > > > > > >                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> > > > > > > > >                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
> > > > > > > > >         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> > > > > > > > >                 Address: 00000000fee01004  Data: 4023
> > > > > > > > >         Capabilities: [78] Express (v1) Endpoint, MSI 00
> > > > > > > > >                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
> > > > > > > > >                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25.000W
> > > > > > > > >                 DevCtl: CorrErr- NonFatalErr+ FatalErr+ UnsupReq-
> > > > > > > > >                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> > > > > > > > >                         MaxPayload 128 bytes, MaxReadReq 512 bytes
> > > > > > > > >                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> > > > > > > > >                 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
> > > > > > > > >                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
> > > > > > > > >                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
> > > > > > > > >                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
> > > > > > > > >                 LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
> > > > > > > > >                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> > > > > > > > >         Capabilities: [100 v1] Virtual Channel
> > > > > > > > >                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
> > > > > > > > >                 Arb:    Fixed- WRR32- WRR64- WRR128-
> > > > > > > > >                 Ctrl:   ArbSelect=Fixed
> > > > > > > > >                 Status: InProgress-
> > > > > > > > >                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> > > > > > > > >                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> > > > > > > > >                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> > > > > > > > >                         Status: NegoPending- InProgress-
> > > > > > > > >         Capabilities: [128 v1] Power Budgeting <?>
> > > > > > > > >         Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> > > > > > > > >         Kernel driver in use: nouveau
> > > > > > > > >
> > > > > > > > > The last time this happened, this is what got logged:
> > > > > > > > >
> > > > > > > > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > > > > > > > nouveau 0000:01:00.0: disp: Base 1:
> > > > > > > > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > > > > > > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > > > > > > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > > > > > > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > > > > > > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > > > > > > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > > > > > > > nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> > > > > > > > > nouveau 0000:01:00.0: disp: Base 1:
> > > > > > > > > nouveau 0000:01:00.0: disp:        0084: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0088: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        008c: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0090: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0094: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> > > > > > > > > nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00c0: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00c4: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00c8: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00cc: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00e0: 40000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00e4: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00e8: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00ec: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        00fc: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0100: fffe0000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0104: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0110: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0114: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> > > > > > > > > nouveau 0000:01:00.0: disp:        0800: 00009500
> > > > > > > > > nouveau 0000:01:00.0: disp:        0804: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0808: 04b00780
> > > > > > > > > nouveau 0000:01:00.0: disp:        080c: 00007804
> > > > > > > > > nouveau 0000:01:00.0: disp:        0810: 0000cf00
> > > > > > > > > nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c00: 00009500
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c04: 00000000
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c08: 04b00780
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c0c: 00007804
> > > > > > > > > nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> > > > > > > > > nouveau 0000:01:00.0: DRM: core notifier timeout
> > > > > > > > > nouveau 0000:01:00.0: DRM: base-0: timeout
> > > > > > > > >
> > > > > > > > > I've got logs of all of this, if they help I can collect them.  The
> > > > > > > > > timeout message are consistent the error messages a little less so.
> > > > > > > > >
> > > > > > > > > If there's more debugging I can do when this happens, I'd love to know
> > > > > > > > > what it is.
> > > > > > > > >
> > > > > > > > > kernel config: http://audible.transient.net/~jamie/k/nouveau.config-5.10.0
> > > > > > > > > dmesg at boot: http://audible.transient.net/~jamie/k/nouveau.dmesg
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > > > > > > > _______________________________________________
> > > > > > > > > Nouveau mailing list
> > > > > > > > > Nouveau@lists.freedesktop.org
> > > > > > > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > > --
> > > > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > > > >
> > > > > > --
> > > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > > >
> > > > > --
> > > > > Jamie Heilman                     http://audible.transient.net/~jamie/
> > > > >
> > > >
> > >
> > > --
> > > Jamie Heilman                     http://audible.transient.net/~jamie/
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
