Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBCE3F0C1A
	for <lists+nouveau@lfdr.de>; Wed, 18 Aug 2021 21:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52636E932;
	Wed, 18 Aug 2021 19:51:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0889F6E932
 for <nouveau@lists.freedesktop.org>; Wed, 18 Aug 2021 19:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629316273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=amdDBemAc3I4RCdnBoZYxHBW8kTlwHo3pNb7IEHGqNU=;
 b=bxG+nE2OBiQs+Lq0DMmbzyiwoAfn6tl6ht8ymTgky4AkE7gLfVY61+zg9vqp/DG+PloYDJ
 EKWmS2P6+Oid4oBHr/HIXLSfmc/QUinm5jNLkWNbKlb4xseoj5HSvmKoA9/nS7iVgo7d18
 7gGIRea2LKN5qGiufQEsfiLkc95To3Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-ExONdSb_PieB4uqQXWigyQ-1; Wed, 18 Aug 2021 15:51:12 -0400
X-MC-Unique: ExONdSb_PieB4uqQXWigyQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g70-20020a1c20490000b02902e6753bf473so2626053wmg.0
 for <nouveau@lists.freedesktop.org>; Wed, 18 Aug 2021 12:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=amdDBemAc3I4RCdnBoZYxHBW8kTlwHo3pNb7IEHGqNU=;
 b=hvall1pIoRDIKqFzE0ME2eUyB1MSpoU81HeOPoIVlqbpPzu3CCJsijKhy1nDX6Md7y
 t6H+grh9jsTodUEgxk9fSpE5+ZVs1DXewCh9gR1blhcpLJdyQbVZ/xmadG2Ar5YKRfjV
 RbbGtcXRhRozHPS8K9wqLtXeBRGtrDVOmeSzojYv3v1uXHZ5XTsSt0RReMQVxDeXcd2N
 UKpRmnCC24sHBGN/AuclP7rKaWx6bMN8jMX8nyaQ5EOf9m3b7OjrBDfN6arlSri0c6q5
 +WZs1kTNBtPU0EsHNVLL4HmU+Ft3UYBp7wCbLL1g7cjrXvZXQk/x6aV2B+dLNtTL8ZKS
 HJIQ==
X-Gm-Message-State: AOAM530kRI+iZB4JQ5GhnKKCNoUxuSG/ivWokLc3jswVYNj8QJpbGQWh
 TCLe1lRB8/MxJE30fmw/uclW0YjjRoLlD8+Yh+94ggeB3CQ3Tnhvg11uqU/G2Yc6WtO50NMBN6q
 XebRthaAo82STfM8U1EEPRVRV7cd8tW63Y+crLcYH2g==
X-Received: by 2002:a7b:c847:: with SMTP id c7mr8202886wml.1.1629316270557;
 Wed, 18 Aug 2021 12:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyhRnPvXpLsvI0wUvVrKSk5AwA8fIkMGKTIOptuMu9gIODg6aZGUGyY0nSMKH9vPo6zu1BLTmhDnj6nW1eCvo=
X-Received: by 2002:a7b:c847:: with SMTP id c7mr8202858wml.1.1629316270154;
 Wed, 18 Aug 2021 12:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <189814ad-62e1-2f0a-4841-81870fd2c887@bitmer.com>
In-Reply-To: <189814ad-62e1-2f0a-4841-81870fd2c887@bitmer.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 18 Aug 2021 21:50:59 +0200
Message-ID: <CACO55ttJxELVk6BQxavCiTEz3yiLPLMrR71Oh5F6qYc-TOSfXQ@mail.gmail.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 nouveau <nouveau@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] nouveau resume regression after 64f7c698bea9
 ("drm/nouveau/fifo: add engine_id hook")
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 18, 2021 at 8:52 PM Jarkko Nikula <jarkko.nikula@bitmer.com> wrote:
>
> Hi
>
> My old Thinkpad T410i won't resume properly anymore after suspend or
> hibernation after v5.12 including today's head 614cb2751d31 ("Merge tag
> 'trace-v5.14-rc6' of
> git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace").
>
> I bisected regression to commit 64f7c698bea9 ("drm/nouveau/fifo: add
> engine_id hook").
>

thanks for the report. We already had an user on IRC reporting this.
There might be a proper patch soon to fix this issue.

> Issue is that Xorg screen is completely messed up, like screen is filled
> with random pixels and changing patterns. Text console is fine but Xorg
> doesn't get better when switching between them.
>
> $ sudo lspci -s 01:00.0 -nnv
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218M [NVS
> 3100M] [10de:0a6c] (rev a2) (prog-if 00 [VGA controller])
>         Subsystem: Lenovo ThinkPad T410 [17aa:2142]
>         Flags: bus master, fast devsel, latency 0, IRQ 30
>         Memory at cc000000 (32-bit, non-prefetchable) [size=16M]
>         Memory at d0000000 (64-bit, prefetchable) [size=256M]
>         Memory at ce000000 (64-bit, prefetchable) [size=32M]
>         I/O ports at 2000 [size=128]
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
>         Capabilities: [60] Power Management version 3
>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Capabilities: [78] Express Endpoint, MSI 00
>         Capabilities: [b4] Vendor Specific Information: Len=14 <?>
>         Capabilities: [100] Virtual Channel
>         Capabilities: [128] Power Budgeting <?>
>         Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1
> Len=024 <?>
>         Kernel driver in use: nouveau
>         Kernel modules: nouveau
>
> "dmesg | grep -i nouveau" before suspend:
> [    0.698044] nouveau 0000:01:00.0: vgaarb: deactivate vga console
> [    0.699574] nouveau 0000:01:00.0: NVIDIA GT218 (0a8600a2)
> [    0.737665] nouveau 0000:01:00.0: bios: version 70.18.88.00.06
> [    0.738228] nouveau 0000:01:00.0: fb: 256 MiB GDDR3
> [    0.838796] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
> [    0.838798] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [    0.838802] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    0.838804] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [    0.838807] nouveau 0000:01:00.0: DRM: DCB outp 00: 01800323 00010034
> [    0.838809] nouveau 0000:01:00.0: DRM: DCB outp 01: 02811300 00000000
> [    0.838811] nouveau 0000:01:00.0: DRM: DCB outp 02: 028223a6 0f220010
> [    0.838813] nouveau 0000:01:00.0: DRM: DCB outp 03: 02822362 00020010
> [    0.838815] nouveau 0000:01:00.0: DRM: DCB outp 04: 048333b6 0f220010
> [    0.838817] nouveau 0000:01:00.0: DRM: DCB outp 05: 04833372 00020010
> [    0.838819] nouveau 0000:01:00.0: DRM: DCB outp 06: 088443c6 0f220010
> [    0.838821] nouveau 0000:01:00.0: DRM: DCB outp 07: 08844382 00020010
> [    0.838823] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
> [    0.838825] nouveau 0000:01:00.0: DRM: DCB conn 01: 00000100
> [    0.838827] nouveau 0000:01:00.0: DRM: DCB conn 02: 00101246
> [    0.838828] nouveau 0000:01:00.0: DRM: DCB conn 03: 00202346
> [    0.838830] nouveau 0000:01:00.0: DRM: DCB conn 04: 00410446
> [    0.841812] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> [    1.268466] nouveau 0000:01:00.0: DRM: allocated 1440x900 fb:
> 0x50000, bo (____ptrval____)
> [    1.268527] fbcon: nouveaudrmfb (fb0) is primary device
> [    2.600674] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame
> buffer device
> [    2.632208] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0
> on minor 0
>
> Around suspend/resume dmesg is overrun with these kind of errors:
>
> [   80.883468] nouveau 0000:01:00.0: fb: trapped read at 00005756c0 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
> reason 00000006 [NULL_DMAOBJ]
> [   80.883479] nouveau 0000:01:00.0: ce: intr 00000300
> [   80.883504] nouveau 0000:01:00.0: fb: trapped read at 0000576000 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
> reason 00000006 [NULL_DMAOBJ]
> [   80.883515] nouveau 0000:01:00.0: ce: intr 00000300
> [   80.883523] nouveau 0000:01:00.0: fb: trapped read at 0000579170 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
> reason 00000006 [NULL_DMAOBJ]
> [   80.883535] nouveau 0000:01:00.0: ce: intr 00000300
> [   80.883557] nouveau 0000:01:00.0: fb: trapped write at 000057dbd0 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
> reason 00000006 [NULL_DMAOBJ]
> ...
> [   81.435778] OOM killer enabled.
> [   81.435780] Restarting tasks ...
> [   81.436020] systemd-journald[248]: /dev/kmsg buffer overrun, some
> messages lost.
> [   81.443134] done.
> [   81.445883] nouveau 0000:01:00.0: ce: intr 00000300
> [   81.445908] nouveau 0000:01:00.0: fb: trapped read at 0000026000 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 01 []
> reason 00000006 [NULL_DMAOBJ]
> [   81.445932] nouveau 0000:01:00.0: ce: intr 00000300
> ...
> [   81.977050] nouveau 0000:01:00.0: fb: trapped write at 00219728b0 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
> reason 00000006 [NULL_DMAOBJ]
> [   81.983342] nouveau 0000:01:00.0: ce: intr 00000300
> [   81.989505] nouveau 0000:01:00.0: fb: trapped write at 0021bbd2c0 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
> reason 00000006 [NULL_DMAOBJ]
> [   81.995758] nouveau 0000:01:00.0: ce: intr 00000300
> [   82.001600] nouveau 0000:01:00.0: fb: trapped write at 0021e13320 on
> channel 1 [0fbce000 DRM] engine 0d [PCE0] client 13 [] subclient 02 []
> reason 00000006 [NULL_DMAOBJ]
> [   82.006931] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040
> [RT_FAULT] - Address 0020230000
> [   82.012021] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c:
> 00000000, e18: 00000000, e1c: 00000000, e20: 00002a00, e24: 00030000
> [   82.017184] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f8c8000
> Xorg[628]] subc 3 class 8597 mthd 15f0 data 00170017
> [   82.022332] nouveau 0000:01:00.0: fb: trapped write at 002026bd00 on
> channel 4 [0f8c8000 Xorg[628]] engine 00 [PGRAPH] client 0b [PROP]
> subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
>
> Jarkko
>

