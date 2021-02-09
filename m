Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCA33157E5
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 21:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BFE56EBA7;
	Tue,  9 Feb 2021 20:46:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161276EBA7
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 20:46:34 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id m25so5739vkk.6
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 12:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xVdgR+f8uO7fLmelkZLbkVTpMZ965mYrglGbtti2VPc=;
 b=W2bKaxYIEDLQpjPIsEFbuyR2zNeMSR1rlztHRx/NDSdBBQEtPQKYruawgx9U6YQnat
 OnYdSpv8tG8yJxSo5PzV+GUt3DRrv2M6zAGtzLYGrH/tnMfgEi7Kfv3lQz+SdbSqE3cE
 k4q0XfBXGEDpriQj26rMEJ/+jCdLxuo9UTA17rZlJmQn+5SqLUWsGKk/4zYAiqBTYitF
 WRsUYex3HX8cQOPn30dU47Wc5+YNEbukMIda0K+yyOXCWDo4seXgn6qEIILqzdMiErX8
 qP3hxndyeRpROQ1X4szbEG/fBaoHwl8qNGKRN/GDyO6A8z78dJyUn91dYDRRykzNP3vK
 UyNw==
X-Gm-Message-State: AOAM531HWhXWBe9nQ4YgT8dABb6Vj5fNsuydfnwyjC6Mk10QALk8AhQ8
 I9G4DCQVP1tYE4ZvDttGIeMA1Yen2mrLms7PF5c=
X-Google-Smtp-Source: ABdhPJzwIZFFbARdVP4L1z63Pmy5NXKkPmyubaecgL+u/PgBExcNKlXxmdROOhTg02uW3SHSLOVdOsfBEuPL9syiLkA=
X-Received: by 2002:a05:6122:1213:: with SMTP id
 v19mr15187801vkc.9.1612903593175; 
 Tue, 09 Feb 2021 12:46:33 -0800 (PST)
MIME-Version: 1.0
References: <5af5c2c5-4764-e0b3-ecf8-d46b5b73455e@gmail.com>
 <CAKb7UvjMP+VfqKn_GKkk=5r1yqwOG7FDxWU6tkDOuWF9iTVxUg@mail.gmail.com>
 <917e6a2d-11f5-6d34-e927-b3f5ed461853@gmail.com>
 <CAKb7Uvh1kRnF1CD-KfbxfcWmteVdq-vCpzBY8G8cHAqJy3SbbA@mail.gmail.com>
 <a4e928c9-4db7-79ab-ba98-cac49087b5ff@gmail.com>
 <CAKb7UvjR-37vaw+4CLuhK-nsvsmHtdrLp4WE4N7LC95oDpC4hQ@mail.gmail.com>
 <e7fb18a9-5023-3bfa-2907-5938a07b08e2@gmail.com>
In-Reply-To: <e7fb18a9-5023-3bfa-2907-5938a07b08e2@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 9 Feb 2021 15:46:22 -0500
Message-ID: <CAKb7UvggrtXBUVDC+g=OxJs59ZWwomNHuSbQvNHggSQwZBU2tw@mail.gmail.com>
To: uwe.sauter.de@gmail.com
Subject: Re: [Nouveau] nouveau 1.0.17 and GT-710 (GK208B): graphics stack
 freezes when turning off display
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

No, you still need nouveau. Just add an xorg.conf which has Driver
"modesetting" rather than Driver "nouveau".

On Tue, Feb 9, 2021 at 3:43 PM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
>
> Re-adding the list to receipients as it got lost.
>
>
> I'm unsure how to configure the modeset ddx. Do I need to rebuild my initrd so it does not include the nouveau driver?
> Do I need to blacklist nouveau?
>
>
> Am 09.02.21 um 21:34 schrieb Ilia Mirkin:
> > I don't see any indication of a nouveau failure here. You could try
> > with the modeset ddx, perhaps the nouveau ddx gets hung up somehow.
> >
> > On Tue, Feb 9, 2021 at 3:32 PM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
> >>
> >> When I stop the X server I fall back to the console and I can through vt1 to vt6.
> >>
> >> Starting X another time brings me back to a desktop where the seconds in the clock applet are counting. Pulling a frame
> >> around desktop symbols is working and applications started from the panel show their window.
> >>
> >> What's strange is that the issue doesn't occur when using the proprietary drivers. Do you really think that the driver
> >> would make a difference for Mate?
> >>
> >> Attached are the logs from the second run.
> >>
> >> Am 09.02.21 um 21:11 schrieb Ilia Mirkin:
> >>> And presumably at the point where the display was turned back on, the
> >>> image was stuck? There are no prints in dmesg here, which means you're
> >>> not getting a traditional error... although curiously the stream of
> >>> framebuffer creations stops too. Maybe not a kernel issue after all?
> >>> Could it be MATE getting stuck somehow? Perhaps it waits for some
> >>> event and doesn't get it?
> >>>
> >>> What happens if you restart X after it gets into this stuck state?
> >>>
> >>> On Tue, Feb 9, 2021 at 2:57 PM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
> >>>>
> >>>> Hi Ilia,
> >>>>
> >>>> this is a first shot on getting the logs.
> >>>>
> >>>> Does the list allow attachments? Else I need to find a place where I can upload the files.
> >>>>
> >>>> The dmesg log was created with kernel command line arguments "log_buf_len=16M drm.debug=12".
> >>>>
> >>>> I have indicated within the file when the desktop environment was ready, when the display was turned off by the
> >>>> screensaver and back on when moving the mouse. I then stopped the X server.
> >>>>
> >>>> Please let me know if this test should be repeated with more verbose settings or if other log files are required, too.
> >>>>
> >>>>
> >>>> Regards,
> >>>>
> >>>>           Uwe
> >>>>
> >>>>
> >>>> Am 08.02.21 um 23:32 schrieb Ilia Mirkin:
> >>>>> The referenced issue is a context switching error / timeout. Is that
> >>>>> what you're seeing?
> >>>>>
> >>>>> Is there anything in dmesg when the problem occurs? Can you reproduce
> >>>>> it by forcing the monitor to sleep (xset s off or equivalent)?
> >>>>>
> >>>>> What you're describing sounds most like a display engine hang. Cursor
> >>>>> position updates happen on another channel, so that makes sense it
> >>>>> keeps working. Usually when there's an error, we'll print what the
> >>>>> failing transition was. But sometimes that info isn't available, and
> >>>>> it just says "timeout" a lot on the core channel. In that case, we'll
> >>>>> have to enable more logging.
> >>>>>
> >>>>> On Mon, Feb 8, 2021 at 4:58 PM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
> >>>>>>
> >>>>>> Hello,
> >>>>>>
> >>>>>> I don't know if this is the appropriate list to post; if not please point me in the right direction.
> >>>>>>
> >>>>>>
> >>>>>> I have an issue with the nouveau driver for a GT 710 (GK208B) card, hardware details and software versions below.
> >>>>>> Once the X server decides to switch into power saving mode and turns the display off using DPMS some part of the
> >>>>>> graphics stack seems to freeze. I can wake up the display and it will show me the last picture but most of the
> >>>>>> functionality is still frozen. I can move the mouse pointer but the clock applet won't show the current time and
> >>>>>> selecting desktop icons does not work.
> >>>>>> It seems that I can still start programs from the panel (I can see the process when remotely logging in) but they
> >>>>>> produce no graphics output.
> >>>>>>
> >>>>>> This happens in either of the two clock settings I can set in /sys/kernel/debug/dri/0/pstate .
> >>>>>>
> >>>>>>
> >>>>>> The proprietary driver does not show this behavior but seems to be much slower with glxgears, though this is not a
> >>>>>> proper benchmark, I know. The results between nouveau and nvidia are about the same when nouveau is in the low pstate
> >>>>>> but performance almost triples when the high pstate is configured.
> >>>>>>
> >>>>>> I bought this card just recently because it was said to be the last model that was properly usable without the
> >>>>>> proprietary driver.
> >>>>>>
> >>>>>> As you can see below, I'm already running xf86-video-nouveau 1.0.17 but compiling from git shouldn't be a problem if
> >>>>>> necessary.
> >>>>>>
> >>>>>> Currently the nvidia driver is in use but I should be able to quickly switch back to nouveau for any logs that might be
> >>>>>> required.
> >>>>>>
> >>>>>> Please advise what logs (and log levels) are needed in order to get to the bottom of this.
> >>>>>>
> >>>>>>
> >>>>>> This bug reports also describes what I see:
> >>>>>>
> >>>>>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/1171#note_385608
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> Regards,
> >>>>>>
> >>>>>>            Uwe
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> ### hardware ###
> >>>>>> CPU: AMD Ryzen 3 3100
> >>>>>> Mainboard: Gigabyte B550M S2H, Bios F13a with AMD AGESA ComboV2 1.2.0.0
> >>>>>> RAM: 2x 16GB Kingston DDR4 3200MHz ECC
> >>>>>> GPU: ASUS GT710-4H-SL-2GD5, 2GB GDDR5, 4x HDMI, VideoBIOS: 80.28.b8.00.05
> >>>>>> Display: ViewSonic VP2468
> >>>>>> ################
> >>>>>>
> >>>>>> ### software ###
> >>>>>> Arch Linux
> >>>>>> Kernel: 5.10.13-arch1-2
> >>>>>> linux-firmware: 20201218.646f159-1
> >>>>>> mate-desktop: 1.24.1-1
> >>>>>> Mesa: 20.3.4-1
> >>>>>> xorg-server: 1.20.10-3
> >>>>>> xf86-video-nouveau: 1.0.17-1
> >>>>>>
> >>>>>> alternatively:
> >>>>>> nvidia-dkms: 460.39-1
> >>>>>> #################
> >>>>>>
> >>>>>> ### lspci fpr GPU ###
> >>>>>> # lspci -s 3:0.0 -v | head -n 2
> >>>>>> #03:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710] (rev a1) (prog-if 00 [VGA controller])
> >>>>>>            Subsystem: ASUSTeK Computer Inc. Device 8770
> >>>>>>
> >>>>>> # lspci -s 3:0.0 -vvn
> >>>>>> 03:00.0 0300: 10de:128b (rev a1) (prog-if 00 [VGA controller])
> >>>>>>            Subsystem: 1043:8770
> >>>>>>            Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
> >>>>>>            Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
> >>>>>>            Latency: 0
> >>>>>>            Interrupt: pin A routed to IRQ 55
> >>>>>>            IOMMU group: 12
> >>>>>>            Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
> >>>>>>            Region 1: Memory at fff0000000 (64-bit, prefetchable) [size=128M]
> >>>>>>            Region 3: Memory at fff8000000 (64-bit, prefetchable) [size=32M]
> >>>>>>            Region 5: I/O ports at f000 [size=128]
> >>>>>>            Expansion ROM at fc000000 [virtual] [disabled] [size=512K]
> >>>>>>            Capabilities: [60] Power Management version 3
> >>>>>>                    Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
> >>>>>>                    Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
> >>>>>>            Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
> >>>>>>                    Address: 00000000fee00000  Data: 0000
> >>>>>>            Capabilities: [78] Express (v2) Legacy Endpoint, MSI 00
> >>>>>>                    DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
> >>>>>>                            ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> >>>>>>                    DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
> >>>>>>                            RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
> >>>>>>                            MaxPayload 128 bytes, MaxReadReq 512 bytes
> >>>>>>                    DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
> >>>>>>                    LnkCap: Port #6, Speed 5GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
> >>>>>>                            ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
> >>>>>>                    LnkCtl: ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
> >>>>>>                            ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
> >>>>>>                    LnkSta: Speed 2.5GT/s (downgraded), Width x1 (downgraded)
> >>>>>>                            TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
> >>>>>>                    DevCap2: Completion Timeout: Range AB, TimeoutDis+ NROPrPrP- LTR-
> >>>>>>                             10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
> >>>>>>                             EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
> >>>>>>                             FRS-
> >>>>>>                             AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> >>>>>>                    DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
> >>>>>>                             AtomicOpsCtl: ReqEn-
> >>>>>>                    LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
> >>>>>>                    LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
> >>>>>>                             Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
> >>>>>>                             Compliance De-emphasis: -6dB
> >>>>>>                    LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
> >>>>>>                             EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
> >>>>>>                             Retimer- 2Retimers- CrosslinkRes: unsupported
> >>>>>>            Capabilities: [100 v1] Virtual Channel
> >>>>>>                    Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
> >>>>>>                    Arb:    Fixed- WRR32- WRR64- WRR128-
> >>>>>>                    Ctrl:   ArbSelect=Fixed
> >>>>>>                    Status: InProgress-
> >>>>>>                    VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
> >>>>>>                            Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
> >>>>>>                            Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
> >>>>>>                            Status: NegoPending- InProgress-
> >>>>>>            Capabilities: [128 v1] Power Budgeting <?>
> >>>>>>            Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
> >>>>>>            Kernel driver in use: nvidia
> >>>>>>            Kernel modules: nouveau, nvidia_drm, nvidia
> >>>>>> ######################
> >>>>>> _______________________________________________
> >>>>>> Nouveau mailing list
> >>>>>> Nouveau@lists.freedesktop.org
> >>>>>> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
