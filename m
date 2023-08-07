Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB55772307
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 13:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3E710E09D;
	Mon,  7 Aug 2023 11:50:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA4A10E09D
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 11:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691408997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mG2NhYzfplbmKkIE00bPnzpUVGRPUtJTepr1bHxlmZQ=;
 b=AKzyVITsr+wv3u/Oblv8uzZAAHc7sE/eA2EruNgJTpKKPIcPwFZL7+jqZCv0Dk6lDYOj69
 ImOXUJ1MLM4XbVEmRUOMUcD6OmVBrE/5tQOT3dcPzpyIRY18+aRX+pNsL3jYEhE0sR8i/V
 GZOCZfx+wio/HuZdmIas/Ow4+zwr3D0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-5KCY7yh5O7-gtTx82yhQ5g-1; Mon, 07 Aug 2023 07:49:55 -0400
X-MC-Unique: 5KCY7yh5O7-gtTx82yhQ5g-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6fdb8d0acso10138661fa.0
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 04:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691408993; x=1692013793;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mG2NhYzfplbmKkIE00bPnzpUVGRPUtJTepr1bHxlmZQ=;
 b=chHSFuIVbksB9IFQLf9G6pUgYnaoDEj1UjI2M2NuoVOKGj5/2/rWT3LAcCNj8yLkkV
 uHAyu6mvsN7rIw44RuRuqRM1pcoZDLXKzW1OaxysUafDmHMDaWj39kShQ/st3A5noIYS
 uFA2iAXlUKXUBJ0dnm5NcIdCwUds/AaC3jKnrgtN8dNTrxUhUgVPniq9KaE8cjXVPpZY
 OP68/UuAowdOoGSTTew9QB0J5NFyU9dxU3UG1YYFjhg312NI9gkrvjh5d9KxQm0Ry/On
 iVNLjVUcOv9Vo0ABM+kBunr8Tl+lHehMeFdtF3ko4fI5HnfSNEBUTsEAZsHH5FYMk6RV
 O1VQ==
X-Gm-Message-State: ABy/qLY5fzjS4EBgvbI+ribBGHB7NE7MylByc1tqgwMIItq3t5kuo58B
 JgXhRQs6hVb1cF7QTWhC4kMDC68BscPhvwrCxrIdalMqP66oItt0P3ISJTIwXfL9oZQnTIg4ljq
 MQ8bmxlB0iwfkWbSVGVTyXTChdJzjxHDa74lTbkvJaA==
X-Received: by 2002:a2e:bc84:0:b0:2b9:54bd:caed with SMTP id
 h4-20020a2ebc84000000b002b954bdcaedmr16712866ljf.1.1691408993630; 
 Mon, 07 Aug 2023 04:49:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlExSUWhNJ81vX6HUXFUR8xlxXCSIw/e9zk4mzsUV+6UFWXVLC8jYx4RugJwmDvEGeGD4TpgCL5L3Us+HicSNVQ=
X-Received: by 2002:a2e:bc84:0:b0:2b9:54bd:caed with SMTP id
 h4-20020a2ebc84000000b002b954bdcaedmr16712862ljf.1.1691408993345; Mon, 07 Aug
 2023 04:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
In-Reply-To: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 7 Aug 2023 13:49:42 +0200
Message-ID: <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
To: Borislav Petkov <bp@alien8.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO
 for HPD, not PMGR AUX interrupts")
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, regressions@leemhuis.info,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sun, Aug 6, 2023 at 11:40=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> Hi folks,
>
> the patch in $Subject breaks booting here on one of my test boxes, see
> below.
>
> Reverting it ontop of -rc4 fixes the issue.
>
> Thx.
>
> [    3.580535] ACPI: \_PR_.CP04: Found 4 idle states
> [    3.585694] ACPI: \_PR_.CP05: Found 4 idle states
> [    3.590852] ACPI: \_PR_.CP06: Found 4 idle states
> [    3.596037] ACPI: \_PR_.CP07: Found 4 idle states
> [    3.644065] Freeing initrd memory: 6740K
> [    3.742932] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    3.750409] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    3.762111] serial 0000:00:16.3: enabling device (0000 -> 0003)
> [    3.771589] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq =3D 17, base_baud =
=3D 115200) is a 16550A
> [    3.782503] Linux agpgart interface v0.103
> [    3.787805] ACPI: bus type drm_connector registered
>
> <--- boot stops here.
>

in what way does it stop? Just not progressing? That would be kinda
concerning. Mind tracing with what arguments `nvkm_uevent_add` is
called with and without that patch?

Also a boot log with `nouveau.debug=3Dtrace` might be helpful here.

> It should continue with this:
>
> [    3.795491] Console: switching to colour dummy device 80x25
> [    3.801933] nouveau 0000:03:00.0: vgaarb: deactivate vga console
> [    3.808303] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
> [    3.931002] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
> [    3.941731] nouveau 0000:03:00.0: fb: 512 MiB DDR3
> [    4.110348] tsc: Refined TSC clocksource calibration: 3591.349 MHz
> [    4.116627] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x3=
3c466a1ab5, max_idle_ns: 440795209767 ns
> [    4.126871] clocksource: Switched to clocksource tsc
> [    4.252013] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
> [    4.257088] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
> [    4.262501] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
> [    4.268333] nouveau 0000:03:00.0: DRM: DCB version 4.0
> [    4.273561] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
> [    4.280104] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
> [    4.286630] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
> [    4.293176] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
> [    4.299711] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
> [    4.306243] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
> [    4.312772] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
> [    4.318520] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
> [    4.329488] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copie=
s
> [    4.336261] stackdepot: allocating hash table of 1048576 entries via k=
vcalloc
> ...
>
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
>

