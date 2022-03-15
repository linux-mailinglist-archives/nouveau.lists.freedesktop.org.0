Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F0A4D986F
	for <lists+nouveau@lfdr.de>; Tue, 15 Mar 2022 11:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A8E10E0A9;
	Tue, 15 Mar 2022 10:10:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49E910E0A9
 for <nouveau@lists.freedesktop.org>; Tue, 15 Mar 2022 10:10:15 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id r11so21498405ioh.10
 for <nouveau@lists.freedesktop.org>; Tue, 15 Mar 2022 03:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ta9Beq8lq4blzjoQprkJd8ZALLPVWntf0pnQIX18z4s=;
 b=3NXK58My/dY81Dn3iPAFR/bzKnGn5vurmu1qPo7x/16eBq5kr93KReYaHeTsVqVRxe
 6BeZYMBCZtC5MJWc9Y/KlRirZ4c4Sv7oeqo8yH+fFMvO9gD+UJbCLM7WqmMZk1/KbuZA
 xrMwASFDAAF+QUQPBaCRPPjJhFQDeK6qOwSdEjzqaFb760yNbz876AmqUuIW+/sJsKV4
 IbFDZN8RUW7nxPbiLs8VhZz+awiXlGTvVXdLnQl62cX2EPNgm4RXV57Yx2YwD6QE5oKr
 hgOKEZIdM4YYFIpa2cR62AXi3eBB64Jnb7N8Xd5N6zrxm3ICHxeIkJzoetLgrwK7RtR0
 +JSA==
X-Gm-Message-State: AOAM531+lkmON7c6iMVZ8P+Ty6JhD+M4J6LprbkZn0hRj1RXpMltCld4
 WE192LJMylpLlQqK4bYTZeYMImHAUHaBWeLd/R4ZnbJ5tg==
X-Google-Smtp-Source: ABdhPJzBI+iqGcxRXuRmRXQz4eIZd87G3Qq8OvTXsBHPRbdtclIuHx055pRzVC7q2Qcr82icvd5RhtwftbpcFJgTrB8=
X-Received: by 2002:a05:6602:492:b0:648:d9bc:1e63 with SMTP id
 y18-20020a056602049200b00648d9bc1e63mr12500283iov.62.1647339015181; Tue, 15
 Mar 2022 03:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAJtcoLYpx0Dnr8VbtBV74aiwGm1UkCHqJOZAxGb9-tG7o6=gjA@mail.gmail.com>
 <CAKb7UvihMs9b_mjsSoGrZRM0qLUYwGQdfnznqNKPhSF6TUpyEg@mail.gmail.com>
 <CAJtcoLZgBYuFbAqUz5KUHeZYGLTr_489MTuc7eCWTd+WP7bBtA@mail.gmail.com>
 <CAKb7Uvgv9Y8NKbgiq0zPRrf-ROT-z-BQO4Xj9d04a5wTAoqVaQ@mail.gmail.com>
 <CAJtcoLZ8wGyeGUz05U2N8SiTVgaX18m10F4fx+jYjoCZbL_Lrw@mail.gmail.com>
In-Reply-To: <CAJtcoLZ8wGyeGUz05U2N8SiTVgaX18m10F4fx+jYjoCZbL_Lrw@mail.gmail.com>
From: Martin Knoblauch <knobi@knobisoft.de>
Date: Tue, 15 Mar 2022 11:10:04 +0100
Message-ID: <CAJtcoLZNqoZ2gR_BFYQ2BGcsCfLcgcO3T52WzvEaLpbAw0bBqA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nvidia GK106GLM (Quadro K2100M) with Nouveau
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Mar 15, 2022 at 10:55 AM Martin Knoblauch <knobi@knobisoft.de> wrote:
>
> On Mon, Mar 14, 2022 at 10:42 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Mon, Mar 14, 2022 at 5:30 PM Martin Knoblauch <knobi@knobisoft.de> wrote:
> > >
> > > On Mon, Mar 14, 2022 at 7:45 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> > > >
> > > > Hi Martin,
> > > >
> > > > Depends what your expectations are. Nouveau is missing a number of
> > > > features of the blob, the most important of which is probably
> > > > stability. Whether you run into instability or not depends a lot on
> > > > the software that you use, so you'll just have to find out for
> > > > yourself if it works well for you or not. Personally, I have
> > > > multi-month uptimes with it. But others struggle to stay up for an
> > > > hour.
> > > >
> > > > With GK106, you should have manual reclocking, which should enable you
> > > > to achieve ~50-80% of blob performance, if that's a concern for you.
> > > > You won't get Vulkan nor H.264 hardware encoding.
> > > >
> > > > Cheers,
> > > >
> > > >   -ilia
> > > >
> > > Hi Ilia,
> > >
> > >  most of my expectations would be met, if I were able to get a decent
> > > resolution from the GK106. As it is the card is not recognized, and it
> > > falls back to VESA with 1280x1024 which is pathetic. I have not much
> > > need or expectation on speed.
> >
> > That's not normal. Please post logs. Perhaps you have nouveau
> > blacklisted or something like that? Nouveau should definitely
> > recognize your card.
> >
> >   -ilia
> Hi Ilia,
>
>  thanks for providing the correct clue: "blacklisted". I had removed
> one blacklist command from /etc/modprobe.d, but the proprietary
> installer had left another at /usr/lib/modprobe.d. Kicked that out and
> now I have 1920x1080 and all my stuff is working fine :-)
>
> Btw card is recognized as "NVIDIA NVE6". Does that make sense?
>
> Cheers
> Martin

Just for completeness, here the kernel messages with the exception of
the last four line it looks fine to me:
L2XQJL32:/etc/X11 # dmesg | egrep -i "nouv|drm"
[    0.622266] ata1.00: supports DRM functions and may not be fully accessible
[    0.626716] ata1.00: supports DRM functions and may not be fully accessible
[    2.449847] ACPI: bus type drm_connector registered
[    2.503983] fb0: switching to nouveau from VESA VGA
[    2.504110] nouveau 0000:01:00.0: vgaarb: deactivate vga console
[    2.504203] nouveau 0000:01:00.0: NVIDIA GK106 (0e63c0a1)
[    2.581231] nouveau 0000:01:00.0: bios: version 80.06.7d.00.06
[    2.581548] nouveau 0000:01:00.0: mxm: BIOS version 3.0
[    2.582662] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    2.649210] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    2.649213] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    2.649215] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    2.649216] nouveau 0000:01:00.0: DRM: DCB version 4.0
[    2.649217] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f13 00010034
[    2.649218] nouveau 0000:01:00.0: DRM: DCB outp 03: 08015fd6 0f420020
[    2.649219] nouveau 0000:01:00.0: DRM: DCB outp 04: 08015f92 00020020
[    2.649220] nouveau 0000:01:00.0: DRM: DCB outp 05: 08014fc6 0f420010
[    2.649221] nouveau 0000:01:00.0: DRM: DCB outp 06: 08014f82 00020010
[    2.649222] nouveau 0000:01:00.0: DRM: DCB outp 10: 02027fa6 0f420010
[    2.649223] nouveau 0000:01:00.0: DRM: DCB outp 11: 02027f62 00020010
[    2.649224] nouveau 0000:01:00.0: DRM: DCB outp 13: 02049f00 00000000
[    2.649225] nouveau 0000:01:00.0: DRM: DCB conn 00: 00000040
[    2.649226] nouveau 0000:01:00.0: DRM: DCB conn 04: 01000446
[    2.649227] nouveau 0000:01:00.0: DRM: DCB conn 05: 02000546
[    2.649227] nouveau 0000:01:00.0: DRM: DCB conn 07: 00010746
[    2.649228] nouveau 0000:01:00.0: DRM: DCB conn 08: 00020847
[    2.649229] nouveau 0000:01:00.0: DRM: DCB conn 09: 00000900
[    2.650904] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    3.094131] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb:
0xa0000, bo 00000000f4ade0b2
[    3.094272] fbcon: nouveaudrmfb (fb0) is primary device
[    3.870574] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[    3.889230] [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0
[    4.568900] systemd[1]: Starting Load Kernel Module drm...
[    4.584059] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    4.584210] systemd[1]: Finished Load Kernel Module drm.
[    5.158821] snd_hda_intel 0000:01:00.1: bound 0000:01:00.0 (ops
nv50_audio_component_bind_ops [nouveau])
[    9.120392] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve6_fuc084 failed with error -2
[    9.120404] nouveau 0000:01:00.0: Direct firmware load for
nouveau/nve6_fuc084d failed with error -2
[    9.120405] nouveau 0000:01:00.0: msvld: unable to load firmware data
[    9.120409] nouveau 0000:01:00.0: msvld: init failed, -19

Martin
