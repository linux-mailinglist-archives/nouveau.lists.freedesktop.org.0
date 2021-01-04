Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1D52E95C4
	for <lists+nouveau@lfdr.de>; Mon,  4 Jan 2021 14:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2684F890B6;
	Mon,  4 Jan 2021 13:22:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C2D890B6
 for <nouveau@lists.freedesktop.org>; Mon,  4 Jan 2021 13:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609766525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fWv0yGQ0eLuTwu2nIgG6D4gDhBSzEVINIyX8tqXkgLw=;
 b=Y788YOj1w8htDwCAAClxnQaTCa1A+WUyta4wSsPS+PjJii1gVO9SFBMSpZMTnVYPWBmpuo
 UHMUzUFLMCdLGk9niQ/jSm2P9V9dUqM8AZWZeEFkeAqgNtewRhyB3UAdeLeJBMPxAMTLix
 9olVCquc7Jx05il7mYsJdgmympyhV9s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-NoQk64S4Mrq7-CIlrhK3og-1; Mon, 04 Jan 2021 08:22:00 -0500
X-MC-Unique: NoQk64S4Mrq7-CIlrhK3og-1
Received: by mail-wm1-f70.google.com with SMTP id u9so4951069wmj.1
 for <nouveau@lists.freedesktop.org>; Mon, 04 Jan 2021 05:22:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fWv0yGQ0eLuTwu2nIgG6D4gDhBSzEVINIyX8tqXkgLw=;
 b=rseojaPaSoq4Iv67ifiG6fRQ4mVAeJp70CxAdotPzTgFgAiwRGNLeP79Dq/Axej/u7
 6grDWs+Ahbsk4+kzp3qpmdSQ7RXusHq5I75pgW1Mp4+95WoSoTD8Kl9gy73LBj45B+GS
 53Xs5u4xNq5kDh/hzpDCdhA7BqOM+6GFb8EKP/Lxa0TlvS37L054CcUs1AGrDFsJNTzL
 6Ce0cwR9TSTxk/K6UT8aqDiCL9+RMQAZmm/QfIxo1xxFI0GDBezes8p17SIiGOy3tEEW
 2iZvJ0mWCY5D/H5EEdjqKpMyqGIONRqiteZ1O+nhAhIccVEEBAGBPvtthXGaZYe8LDlh
 92Hw==
X-Gm-Message-State: AOAM533CB9jqzNheqqaGYgW0LQZlZZ6SoBGiAM41WY3snh/8Iu2ciEjF
 eBMvk3SeE1HGDj5ZKogWhloV0RC0NhDjZl5iBgogcF4XmqfoNjuToKhNCSNy18NcczOKrU/ONaU
 +iQdL8PQwoAjYqwE41xWrWdCUmbOwNnEv0A1UjcC24w==
X-Received: by 2002:adf:dec7:: with SMTP id i7mr80504978wrn.373.1609766519222; 
 Mon, 04 Jan 2021 05:21:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXEfCWocg1X/83Zesd3hEFouiTCGCKTiaLf2WKboF/+LXnVJWX5opyzqTI2/RoRO2+TeHFaF+K+1C2j66kI34=
X-Received: by 2002:adf:dec7:: with SMTP id i7mr80504956wrn.373.1609766519009; 
 Mon, 04 Jan 2021 05:21:59 -0800 (PST)
MIME-Version: 1.0
References: <X+WV8OiQzTIfLdgW@audible.transient.net>
In-Reply-To: <X+WV8OiQzTIfLdgW@audible.transient.net>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Jan 2021 14:21:48 +0100
Message-ID: <CACO55tt9GbwBU6igAJ_8RjwzSZcDbu+_1wGWKiye3TosgoiHyw@mail.gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

do you think you'd be able to do a kernel bisect in order to pinpoint
the actual commit causing it? Thanks

On Sun, Dec 27, 2020 at 8:16 PM Jamie Heilman
<jamie@audible.transient.net> wrote:
>
> Something between v5.8 and v5.9 has resulted in periodically losing video.
> Unfortunately, I can't reliably reproduce it, it seems to happen every
> once in a long while---I can go weeks without an occurance, but it
> always seems to happen after my workstation has been idle long enough
> to screen blank and put the monitor to sleep.  I'm using a single
> display (Dell 2405FPW) connected via DVI, running X (Xorg 1.20.x from
> Debian sid).  I don't really do anything fancy, xterms, a browser or
> two, play the occasional video, but like I said, I can't reliably
> reproduce this.  I've had it happen about 11 times since August.
>
> lspci -vv output is:
>
> 01:00.0 VGA compatible controller: NVIDIA Corporation G86 [Quadro NVS 290] (rev a1) (prog-if 00 [VGA controller])
>         Subsystem: NVIDIA Corporation G86 [Quadro NVS 290]
>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 0, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 28
>         Region 0: Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
>         Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
>         Region 3: Memory at fa000000 (64-bit, non-prefetchable) [size=32M]
>         Region 5: I/O ports at dc80 [size=128]
>         Expansion ROM at 000c0000 [disabled] [size=128K]
>         Capabilities: [60] Power Management version 2
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>                 Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>                 Address: 00000000fee01004  Data: 4023
>         Capabilities: [78] Express (v1) Endpoint, MSI 00
>                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <512ns, L1 <4us
>                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 25.000W
>                 DevCtl: CorrErr- NonFatalErr+ FatalErr+ UnsupReq-
>                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
>                 LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
>                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>                 LnkSta: Speed 2.5GT/s (ok), Width x16 (ok)
>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>         Capabilities: [100 v1] Virtual Channel
>                 Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>                 Arb:    Fixed- WRR32- WRR64- WRR128-
>                 Ctrl:   ArbSelect=Fixed
>                 Status: InProgress-
>                 VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>                         Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>                         Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>                         Status: NegoPending- InProgress-
>         Capabilities: [128 v1] Power Budgeting <?>
>         Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
>         Kernel driver in use: nouveau
>
> The last time this happened, this is what got logged:
>
> nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> nouveau 0000:01:00.0: disp: Base 1:
> nouveau 0000:01:00.0: disp:        0084: 00000000
> nouveau 0000:01:00.0: disp:        0088: 00000000
> nouveau 0000:01:00.0: disp:        008c: 00000000
> nouveau 0000:01:00.0: disp:        0090: 00000000
> nouveau 0000:01:00.0: disp:        0094: 00000000
> nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> nouveau 0000:01:00.0: disp:        00c0: 00000000
> nouveau 0000:01:00.0: disp:        00c4: 00000000
> nouveau 0000:01:00.0: disp:        00c8: 00000000
> nouveau 0000:01:00.0: disp:        00cc: 00000000
> nouveau 0000:01:00.0: disp:        00e0: 40000000
> nouveau 0000:01:00.0: disp:        00e4: 00000000
> nouveau 0000:01:00.0: disp:        00e8: 00000000
> nouveau 0000:01:00.0: disp:        00ec: 00000000
> nouveau 0000:01:00.0: disp:        00fc: 00000000
> nouveau 0000:01:00.0: disp:        0100: fffe0000
> nouveau 0000:01:00.0: disp:        0104: 00000000
> nouveau 0000:01:00.0: disp:        0110: 00000000
> nouveau 0000:01:00.0: disp:        0114: 00000000
> nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> nouveau 0000:01:00.0: disp:        0800: 00009500
> nouveau 0000:01:00.0: disp:        0804: 00000000
> nouveau 0000:01:00.0: disp:        0808: 04b00780
> nouveau 0000:01:00.0: disp:        080c: 00007804
> nouveau 0000:01:00.0: disp:        0810: 0000cf00
> nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> nouveau 0000:01:00.0: disp:        0c00: 00009500
> nouveau 0000:01:00.0: disp:        0c04: 00000000
> nouveau 0000:01:00.0: disp:        0c08: 04b00780
> nouveau 0000:01:00.0: disp:        0c0c: 00007804
> nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> nouveau 0000:01:00.0: disp: ERROR 5 [INVALID_STATE] 06 [] chid 1 mthd 0080 data 00000001
> nouveau 0000:01:00.0: disp: Base 1:
> nouveau 0000:01:00.0: disp:        0084: 00000000
> nouveau 0000:01:00.0: disp:        0088: 00000000
> nouveau 0000:01:00.0: disp:        008c: 00000000
> nouveau 0000:01:00.0: disp:        0090: 00000000
> nouveau 0000:01:00.0: disp:        0094: 00000000
> nouveau 0000:01:00.0: disp:        00a0: 00000060 -> 00000070
> nouveau 0000:01:00.0: disp:        00a4: 00000000 -> f0000000
> nouveau 0000:01:00.0: disp:        00c0: 00000000
> nouveau 0000:01:00.0: disp:        00c4: 00000000
> nouveau 0000:01:00.0: disp:        00c8: 00000000
> nouveau 0000:01:00.0: disp:        00cc: 00000000
> nouveau 0000:01:00.0: disp:        00e0: 40000000
> nouveau 0000:01:00.0: disp:        00e4: 00000000
> nouveau 0000:01:00.0: disp:        00e8: 00000000
> nouveau 0000:01:00.0: disp:        00ec: 00000000
> nouveau 0000:01:00.0: disp:        00fc: 00000000
> nouveau 0000:01:00.0: disp:        0100: fffe0000
> nouveau 0000:01:00.0: disp:        0104: 00000000
> nouveau 0000:01:00.0: disp:        0110: 00000000
> nouveau 0000:01:00.0: disp:        0114: 00000000
> nouveau 0000:01:00.0: disp: Base 1 - Image 0:
> nouveau 0000:01:00.0: disp:        0800: 00009500
> nouveau 0000:01:00.0: disp:        0804: 00000000
> nouveau 0000:01:00.0: disp:        0808: 04b00780
> nouveau 0000:01:00.0: disp:        080c: 00007804
> nouveau 0000:01:00.0: disp:        0810: 0000cf00
> nouveau 0000:01:00.0: disp: Base 1 - Image 1:
> nouveau 0000:01:00.0: disp:        0c00: 00009500
> nouveau 0000:01:00.0: disp:        0c04: 00000000
> nouveau 0000:01:00.0: disp:        0c08: 04b00780
> nouveau 0000:01:00.0: disp:        0c0c: 00007804
> nouveau 0000:01:00.0: disp:        0c10: 0000cf00
> nouveau 0000:01:00.0: DRM: core notifier timeout
> nouveau 0000:01:00.0: DRM: base-0: timeout
>
> I've got logs of all of this, if they help I can collect them.  The
> timeout message are consistent the error messages a little less so.
>
> If there's more debugging I can do when this happens, I'd love to know
> what it is.
>
> kernel config: http://audible.transient.net/~jamie/k/nouveau.config-5.10.0
> dmesg at boot: http://audible.transient.net/~jamie/k/nouveau.dmesg
>
> --
> Jamie Heilman                     http://audible.transient.net/~jamie/
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
