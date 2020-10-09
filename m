Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF3B289B3E
	for <lists+nouveau@lfdr.de>; Fri,  9 Oct 2020 23:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50F86EE23;
	Fri,  9 Oct 2020 21:54:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC11E6EE23
 for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2020 21:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602280449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1DGRdcsDNGl9gVS7YYV990kOut6FXvc+T+EaiHpDxCk=;
 b=QWpsMtSbxd7r1iJZvxc2zZXFafiKw9qbqdY002kHuZHi3lDeoaWFkXIGz1dMUefqcg2+nY
 lvBiyux8fEUthJ0fLq5JbKKVS59bzb1GcPWtzHgYXXomUksADU4sfuvdfTi9qBFfMYLk9a
 OE6GXqm/hvHr3Z8LqyGeQmge6ozIEyA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-XuPgJGyiMOWVwjotUZ44Xg-1; Fri, 09 Oct 2020 17:54:05 -0400
X-MC-Unique: XuPgJGyiMOWVwjotUZ44Xg-1
Received: by mail-qt1-f199.google.com with SMTP id z12so4274493qto.4
 for <nouveau@lists.freedesktop.org>; Fri, 09 Oct 2020 14:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DGRdcsDNGl9gVS7YYV990kOut6FXvc+T+EaiHpDxCk=;
 b=HMwR8OTvaJ2TQrsJHu+D9uq7+4l5gd3kvO+rpGam9V5vEtM+uIjfTfGlWZfpIsytb0
 Rej1/HeIjoVTE8Wxxc8qR6pgOaqeja9TaiEKN3saRjLSyVJlF1ahJj9hG9e42bMxrFMb
 3Igz9qQx5SJtgAz9UXrbeO4sQoNDEjQPZ7bPD97qCcYftDwxCWyixLsInOkUXC13d9VZ
 xiFzYwtZ2Yo4y7SdTHz18L828AdE7L9OsoSDXVsBDFP1PsKVe9AIyLmJOi1k6NUfUufu
 w5mk5LhIvPiBRaexs++OlpwJr4XDsARIYRhKE42XPYwThMTVD+BF37OmM/RLlLG3r4Tn
 BB+g==
X-Gm-Message-State: AOAM532Eq0EphL8KiVfIwomfZqDDC0CX5hr3GyyggJc8GEiSuvZLW0mJ
 rzY0Z1Z7j48rSCweA8ujJd++h1zrtJqN5cg95bNOoTmkWu7FoQAToibePckWuAtVRjdR21SK90j
 mrI5H3JH4zCfHuFbKqEj2h8eTujZWpTDVzmMac/N04Q==
X-Received: by 2002:a37:7805:: with SMTP id t5mr41078qkc.157.1602280444950;
 Fri, 09 Oct 2020 14:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKFe0fZM+UI+kwnaS3rhTnXdP4Ft6MV/RhHjc26A66FZKTRWIGz5gj2waLbdahUrnRKpEWmENOBiFZvhqso3g=
X-Received: by 2002:a37:7805:: with SMTP id t5mr41003qkc.157.1602280443645;
 Fri, 09 Oct 2020 14:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <202010092326.20482.linux@zary.sk>
In-Reply-To: <202010092326.20482.linux@zary.sk>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 9 Oct 2020 23:53:52 +0200
Message-ID: <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
To: Ondrej Zary <linux@zary.sk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
>
> Hello,
> I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> ...
> [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
>
> big-endian? WTF? The machine is x86.
>

mhh, we reworked the endianess checks a bit and apparently that broke
something... I will give it some thoughts, but could you be so kind
and create an mmiotrace under 5.9 with nouveau? You won't need to
start X or anything while doing it. Just enable the trace and modprobe
nouveau and collect the trace.

> It works fine with Debian 5.7 kernel (5.7.10-1~bpo10+1):
> [    0.000000] Linux version 5.7.0-0.bpo.2-686 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6), GNU ld (GNU Binutils for Debian) 2.31.1) #1 SMP Debian 5.7.10-1~bpo10+1 (2020-07-30)
> ...
> [   23.266196] nouveau 0000:01:00.0: NVIDIA NV05 (20154000)
> [   23.288582] nouveau 0000:01:00.0: bios: version 02.05.20.02.00
> [   23.288869] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.289595] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.289956] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.290015] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.290215] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
> [   23.290287] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
> [   23.290351] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   23.290430] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   23.290565] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
> [   23.290627] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
> [   23.290690] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
> [   23.290768] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
> [   23.290830] nouveau 0000:01:00.0: tmr: unknown input clock freq
> [   23.293026] nouveau 0000:01:00.0: fb: 32 MiB SDRAM
> [   23.301269] [TTM] Zone  kernel: Available graphics memory: 382728 KiB
> [   23.301327] [TTM] Initializing pool allocator
> [   23.301414] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
> [   23.301465] nouveau 0000:01:00.0: DRM: GART: 128 MiB
> [   23.301518] nouveau 0000:01:00.0: DRM: BMP version 5.6
> [   23.301570] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   23.303594] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
> [   23.303719] nouveau 0000:01:00.0: bios: DCB table not found
> [   23.304904] nouveau 0000:01:00.0: DRM: Saving VGA fonts
> [   23.349089] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   23.349681] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   23.383066] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo b10d2f17
> [   23.413903] fbcon: nouveaudrmfb (fb0) is primary device
> [   23.569851] Console: switching to colour frame buffer device 160x64
> [   23.571050] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
>
>
> --
> Ondrej Zary
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
