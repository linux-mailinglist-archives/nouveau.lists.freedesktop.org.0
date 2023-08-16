Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31E977E44F
	for <lists+nouveau@lfdr.de>; Wed, 16 Aug 2023 16:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BD110E371;
	Wed, 16 Aug 2023 14:57:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A460110E0EF
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692197864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yk77+UL4rkIMHcGRM0KHSL7Wr7OhKG9eO6qnc5jbyxA=;
 b=bh/wQG376IZhkvQ3xW+jEXvMWXVQ64A9n4YvP7PdXm0ZkND8M9FyaLIieDckofwnLIe41H
 zPpQMouJgndlzRyB98o8YyGpnmitS5KaTuphksKNRCwivwiTi+oHO7b3Zor7Zs0SCuCsds
 OxXxes5HO6wdUYz5QPd7cJPuo0p1yFQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-WjH21efnMM64FrrYexoZMw-1; Wed, 16 Aug 2023 10:57:42 -0400
X-MC-Unique: WjH21efnMM64FrrYexoZMw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so12010201fa.1
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 07:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692197860; x=1692802660;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yk77+UL4rkIMHcGRM0KHSL7Wr7OhKG9eO6qnc5jbyxA=;
 b=ZqD11KRXF2BM2KJRrVBhQGoSPBZEkpl7bnH3LAc0W3lv6DdASQ4O7uLloORiA2aNpS
 yQok5vNHSuJNbZj0ChlUQaQRa7qpnGBPeJ6IvVZlhJ2bAh8oLBJqVX8qH7ha3WJGBVjx
 tHR98OO/kLxeZ2Kf8RgJtZnCHaLWwmA4YB0YUZvYzAs12cYC2rjYgG2/86bbeC2HJVWu
 6T7XTVVIE3lqTF3CqLqX+k/eRVBtFlkJlONLkn75BzBOjueZTyucNXprxPU87R53B97S
 4rt56+DoZ3uSQtxLnCLJdVa/P5DioufP6e9FBfo8ibxPUDjBDUNJv8ojsaDYEBUfWiPt
 G6hw==
X-Gm-Message-State: AOJu0YxGYsWcdL8T4PY/P2yS+8zjq9RaO4w6oMI8Xw44ktlGGrcev8Mo
 ddf6q3wBeEQUTRf3saKiE55BY5H2GRGX/sA4Qxtf3qh6cUiaxM5pG5oJ8tPwrTPE1LY3uk8vwH1
 69tXGKWPDlJ41sWsm28R6TOcfWjsV/bjxo0GSxlNkWQ==
X-Received: by 2002:a2e:9044:0:b0:2b6:120a:af65 with SMTP id
 n4-20020a2e9044000000b002b6120aaf65mr1677649ljg.3.1692197859981; 
 Wed, 16 Aug 2023 07:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtXtNqg21X9ZOSLzbXnEOEcUIWB02GorJnwoMjXv3h8rzLDe9xXToWb6sVF3Vcn+RVHqVwlCLFO47V5NdG1ws=
X-Received: by 2002:a2e:9044:0:b0:2b6:120a:af65 with SMTP id
 n4-20020a2e9044000000b002b6120aaf65mr1677636ljg.3.1692197859612; Wed, 16 Aug
 2023 07:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
In-Reply-To: <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 16 Aug 2023 16:57:28 +0200
Message-ID: <CACO55ttasKLxBTmZjN-XBOuJFC7rng2PbLgxCT8WT6ukOZNGzQ@mail.gmail.com>
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 4:54=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Wed, Aug 16, 2023 at 11:51:50AM +0200, Karol Herbst wrote:
> > Mind sharing your kernel logs with that patch applied? I suspect your
> > system boots up but you might just not have the connector available or
> > something? It could be that you have one of those GPUs affected by the
> > original change and then we'd have to figure out what to do with that.
>
> Close. With your patch applied, the machine is up and I can log in and
> use it. However, the output on the connected monitor stops after...
>
> [    6.815167] ACPI: \_PR_.CP05: Found 4 idle states
> [    6.825438] ACPI: \_PR_.CP06: Found 4 idle states
> [    6.835661] ACPI: \_PR_.CP07: Found 4 idle states
> [    7.280093] Freeing initrd memory: 8328K
> [    7.601986] tsc: Refined TSC clocksource calibration: 3591.346 MHz
> [    7.608360] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x3=
3c46403b59, max_idle_ns: 440795293818 ns
> [    7.620254] clocksource: Switched to clocksource tsc
> [    8.337724] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    8.350553] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    8.375311] serial 0000:00:16.3: enabling device (0000 -> 0003)
> [    8.403681] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq =3D 17, base_baud =
=3D 115200) is a 16550A
> [    8.424951] Linux agpgart interface v0.103
> [    8.432456] ACPI: bus type drm_connector registered
>
> ... this line here above. It is the last one output. What you see here
> below what I'm catching from serial.
>
> [    8.456734] Console: switching to colour dummy device 80x25
> [    8.464414] nouveau 0000:03:00.0: vgaarb: deactivate vga console
> [    8.473063] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
> [    8.594096] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
> [    8.607906] nouveau 0000:03:00.0: fb: 512 MiB DDR3
> [    8.926721] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> [    8.931763] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> [    8.937156] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> [    8.942969] nouveau 0000:03:00.0: DRM: DCB version 4.0
> [    8.948173] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
> [    8.954696] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
> [    8.961211] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
> [    8.967739] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
> [    8.974261] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
> [    8.980769] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
> [    8.987293] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
> [    8.993015] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
> [    9.005724] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copie=
s
> [    9.023889] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 =
on minor 0
> [    9.032044] nouveau 0000:03:00.0: [drm] Cannot find any crtc or sizes
> [    9.162909] megasas: 07.725.01.00-rc1
> [    9.167537] st: Version 20160209, fixed bufsize 32768, s/g segs 256
> [    9.176058] ahci 0000:00:1f.2: version 3.0
> [    9.194078] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps =
0x3 impl SATA mode
> [    9.202487] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio sl=
um part ems apst
> [    9.243154] scsi host0: ahci
> [    9.252090] scsi host1: ahci
> [    9.260389] scsi host2: ahci
> [    9.268061] scsi host3: ahci
> [    9.273542] scsi host4: ahci
> [    9.279071] scsi host5: ahci
> ...
>
> and so on until full boot.
>

okay, so the patch at least fixes the memory corruption, which is
good, so I'd go ahead and push it out as it might also fix other
unrelated crashes.

Do you have any connectors listed in "/sys/class/drm"? Also, mind
sharing your vbios.rom file from "/sys/kernel/debug/dri/0/vbios.rom"?

Thanks

> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

