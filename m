Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B125631575C
	for <lists+nouveau@lfdr.de>; Tue,  9 Feb 2021 21:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDCE6EBA2;
	Tue,  9 Feb 2021 20:04:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A9A6EBA2
 for <nouveau@lists.freedesktop.org>; Tue,  9 Feb 2021 20:04:11 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id g10so25562980eds.2
 for <nouveau@lists.freedesktop.org>; Tue, 09 Feb 2021 12:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=HyzM052hr35NvT1B0bon2uSc8n6o6XalmwHxOAYIliY=;
 b=rAPfk2+dB6uOFRzHRfXvvPCFsVL3pqfIOdE3K7jskZ8T8m0l+MAHu8tR6AG8Oo+pzR
 jnG8Haje3j7SSCILZtTfTfHYI1nylE8U5NzwSpXLj7YapUXE6DS+QK9ZCcVNPPY7Sp7L
 zGckKvgtuu+dvwdnj9g82TxWNWSMjcSFryu5Hpc7D3DSN4MP1dWS5LnxkWVSszsizUS9
 XWhPjH4sGbMeD82FleIwTP5crDxS/m9+dLUDikf3ykS7HX7QHXzmSPg/rZICmeLoLWnM
 +Tz/5mQR1n4tc7Cbxm9W+foGIp3AgW7ws2AddV4vk86wPFJtTu/FbqCYA30o9kUcIHr+
 aCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=HyzM052hr35NvT1B0bon2uSc8n6o6XalmwHxOAYIliY=;
 b=dr/UNSguwgab8HSGmqBgEdOm/utDzAHKF13B9pjc/q5s7VIelMJYqBlLaiXtDFjgT1
 SYnC1GhfUfzRkfdZh64OmYRNiQMwu9UPnYUftGj1OCgkdapu40KrzA0mweyMs628A/oZ
 Xk8Wgo/FRfpYvCn/NqY0hMiHkMr7wd+kxRBvi+Hv9Ncl4dXwHwYI77qYCRXYxQ90dzGu
 bM8FAgzmd+mWSJTBsCx8M0XtYdZ+pWt/qUVbfWGsEoqY7+yh57LaYai7zx2msC0KgHro
 B0Rv3Rz6HPjiYf3igwdPbwIhQ43o108LTJ4Djn2vDHoCvUvmiuXi19EgWSJkrbH7yAu8
 ET3A==
X-Gm-Message-State: AOAM531ZwWFBW71rHdSH5T5HcnkcVn6mb0yv634NwmQQChn862YTMmHs
 LLj+R7iQmmDAmVBlzp2boUJ2lvhLbDQ=
X-Google-Smtp-Source: ABdhPJxWTeyf/V26io3gQua+eBvUBAjlPJsiJ9fv6tF3+s/4/xHnrAGOyNGUhrJs7BhCfzqdOpH/+g==
X-Received: by 2002:aa7:c685:: with SMTP id n5mr25766229edq.150.1612901049538; 
 Tue, 09 Feb 2021 12:04:09 -0800 (PST)
Received: from ?IPv6:2a02:8070:a396:f000:7549:17bd:ed49:8057?
 ([2a02:8070:a396:f000:7549:17bd:ed49:8057])
 by smtp.googlemail.com with ESMTPSA id s14sm11019535ejf.47.2021.02.09.12.04.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:04:07 -0800 (PST)
To: Ilia Mirkin <imirkin@alum.mit.edu>
References: <5af5c2c5-4764-e0b3-ecf8-d46b5b73455e@gmail.com>
 <CAKb7UvjMP+VfqKn_GKkk=5r1yqwOG7FDxWU6tkDOuWF9iTVxUg@mail.gmail.com>
From: Uwe Sauter <uwe.sauter.de@gmail.com>
Message-ID: <2446928f-e78b-6d35-5787-8d3178e467c3@gmail.com>
Date: Tue, 9 Feb 2021 21:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKb7UvjMP+VfqKn_GKkk=5r1yqwOG7FDxWU6tkDOuWF9iTVxUg@mail.gmail.com>
Content-Type: multipart/mixed; boundary="------------278DA75434103C31973CC3E4"
Content-Language: de-DE
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
Reply-To: uwe.sauter.de@gmail.com
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------278DA75434103C31973CC3E4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ilia,

this is a first shot on getting the logs.

Does the list allow attachments? Else I need to find a place where I can upload the files.

The dmesg log was created with kernel command line arguments "log_buf_len=16M drm.debug=12".

I have indicated within the file when the desktop environment was ready, when the display was turned off by the 
screensaver and back on when moving the mouse. I then stopped the X server.

Please let me know if this test should be repeated with more verbose settings or if other log files are required, too.


Regards,

     Uwe


Am 08.02.21 um 23:32 schrieb Ilia Mirkin:
> The referenced issue is a context switching error / timeout. Is that
> what you're seeing?
> 
> Is there anything in dmesg when the problem occurs? Can you reproduce
> it by forcing the monitor to sleep (xset s off or equivalent)?
> 
> What you're describing sounds most like a display engine hang. Cursor
> position updates happen on another channel, so that makes sense it
> keeps working. Usually when there's an error, we'll print what the
> failing transition was. But sometimes that info isn't available, and
> it just says "timeout" a lot on the core channel. In that case, we'll
> have to enable more logging.
> 
> On Mon, Feb 8, 2021 at 4:58 PM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
>>
>> Hello,
>>
>> I don't know if this is the appropriate list to post; if not please point me in the right direction.
>>
>>
>> I have an issue with the nouveau driver for a GT 710 (GK208B) card, hardware details and software versions below.
>> Once the X server decides to switch into power saving mode and turns the display off using DPMS some part of the
>> graphics stack seems to freeze. I can wake up the display and it will show me the last picture but most of the
>> functionality is still frozen. I can move the mouse pointer but the clock applet won't show the current time and
>> selecting desktop icons does not work.
>> It seems that I can still start programs from the panel (I can see the process when remotely logging in) but they
>> produce no graphics output.
>>
>> This happens in either of the two clock settings I can set in /sys/kernel/debug/dri/0/pstate .
>>
>>
>> The proprietary driver does not show this behavior but seems to be much slower with glxgears, though this is not a
>> proper benchmark, I know. The results between nouveau and nvidia are about the same when nouveau is in the low pstate
>> but performance almost triples when the high pstate is configured.
>>
>> I bought this card just recently because it was said to be the last model that was properly usable without the
>> proprietary driver.
>>
>> As you can see below, I'm already running xf86-video-nouveau 1.0.17 but compiling from git shouldn't be a problem if
>> necessary.
>>
>> Currently the nvidia driver is in use but I should be able to quickly switch back to nouveau for any logs that might be
>> required.
>>
>> Please advise what logs (and log levels) are needed in order to get to the bottom of this.
>>
>>
>> This bug reports also describes what I see:
>>
>> https://gitlab.freedesktop.org/mesa/mesa/-/issues/1171#note_385608
>>
>>
>>
>>
>> Regards,
>>
>>          Uwe
>>
>>
>>
>> ### hardware ###
>> CPU: AMD Ryzen 3 3100
>> Mainboard: Gigabyte B550M S2H, Bios F13a with AMD AGESA ComboV2 1.2.0.0
>> RAM: 2x 16GB Kingston DDR4 3200MHz ECC
>> GPU: ASUS GT710-4H-SL-2GD5, 2GB GDDR5, 4x HDMI, VideoBIOS: 80.28.b8.00.05
>> Display: ViewSonic VP2468
>> ################
>>
>> ### software ###
>> Arch Linux
>> Kernel: 5.10.13-arch1-2
>> linux-firmware: 20201218.646f159-1
>> mate-desktop: 1.24.1-1
>> Mesa: 20.3.4-1
>> xorg-server: 1.20.10-3
>> xf86-video-nouveau: 1.0.17-1
>>
>> alternatively:
>> nvidia-dkms: 460.39-1
>> #################
>>
>> ### lspci fpr GPU ###
>> # lspci -s 3:0.0 -v | head -n 2
>> #03:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710] (rev a1) (prog-if 00 [VGA controller])
>>          Subsystem: ASUSTeK Computer Inc. Device 8770
>>
>> # lspci -s 3:0.0 -vvn
>> 03:00.0 0300: 10de:128b (rev a1) (prog-if 00 [VGA controller])
>>          Subsystem: 1043:8770
>>          Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>>          Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>          Latency: 0
>>          Interrupt: pin A routed to IRQ 55
>>          IOMMU group: 12
>>          Region 0: Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
>>          Region 1: Memory at fff0000000 (64-bit, prefetchable) [size=128M]
>>          Region 3: Memory at fff8000000 (64-bit, prefetchable) [size=32M]
>>          Region 5: I/O ports at f000 [size=128]
>>          Expansion ROM at fc000000 [virtual] [disabled] [size=512K]
>>          Capabilities: [60] Power Management version 3
>>                  Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>                  Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>>          Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>                  Address: 00000000fee00000  Data: 0000
>>          Capabilities: [78] Express (v2) Legacy Endpoint, MSI 00
>>                  DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
>>                          ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
>>                  DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>>                          RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>>                          MaxPayload 128 bytes, MaxReadReq 512 bytes
>>                  DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
>>                  LnkCap: Port #6, Speed 5GT/s, Width x8, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
>>                          ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>>                  LnkCtl: ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
>>                          ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-
>>                  LnkSta: Speed 2.5GT/s (downgraded), Width x1 (downgraded)
>>                          TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>>                  DevCap2: Completion Timeout: Range AB, TimeoutDis+ NROPrPrP- LTR-
>>                           10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
>>                           EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>>                           FRS-
>>                           AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>>                  DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
>>                           AtomicOpsCtl: ReqEn-
>>                  LnkCap2: Supported Link Speeds: 2.5-5GT/s, Crosslink- Retimer- 2Retimers- DRS-
>>                  LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
>>                           Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
>>                           Compliance De-emphasis: -6dB
>>                  LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete+ EqualizationPhase1+
>>                           EqualizationPhase2+ EqualizationPhase3+ LinkEqualizationRequest-
>>                           Retimer- 2Retimers- CrosslinkRes: unsupported
>>          Capabilities: [100 v1] Virtual Channel
>>                  Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
>>                  Arb:    Fixed- WRR32- WRR64- WRR128-
>>                  Ctrl:   ArbSelect=Fixed
>>                  Status: InProgress-
>>                  VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
>>                          Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
>>                          Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
>>                          Status: NegoPending- InProgress-
>>          Capabilities: [128 v1] Power Budgeting <?>
>>          Capabilities: [600 v1] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
>>          Kernel driver in use: nvidia
>>          Kernel modules: nouveau, nvidia_drm, nvidia
>> ######################
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau

--------------278DA75434103C31973CC3E4
Content-Type: application/gzip;
 name="dmesg.drmdebug=12.nouveau1.0.17.GT710.log.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg.drmdebug=12.nouveau1.0.17.GT710.log.gz"

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
--------------278DA75434103C31973CC3E4
Content-Type: application/gzip;
 name="Xorg.0.log.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Xorg.0.log.gz"

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
yIREJZ7/Aycb9LsL+AAA
--------------278DA75434103C31973CC3E4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--------------278DA75434103C31973CC3E4--
