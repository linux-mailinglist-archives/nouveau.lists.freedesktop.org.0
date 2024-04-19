Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0228AB1BB
	for <lists+nouveau@lfdr.de>; Fri, 19 Apr 2024 17:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174C110E460;
	Fri, 19 Apr 2024 15:25:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F0810E460
 for <nouveau@lists.freedesktop.org>; Fri, 19 Apr 2024 15:25:15 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6114c9b4d83so19086077b3.3
 for <nouveau@lists.freedesktop.org>; Fri, 19 Apr 2024 08:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713540314; x=1714145114;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xEy3w+5fTQ+1NaZxLSii+bi2dV5Lv7A/ojoUk5oPytw=;
 b=i5S3nj0m1Ip++59/LZszPj9L9IjUViW7Mw/XeaOc0wlntZJ7FG8GQzIQmuOt/S+J7B
 6MXni3GWzoTiVWtI+ETKnfh+YZW+LsczyriiYT30wkpD5wwCNRZP34S2qRIBrzDUaB7g
 rkmoRD+o3k8tgOD6V4n+1lxQb7z22RLuuptL46Hw84hFvOVy6y25AShdSsAv1QOHlRkM
 XL9vrm9g/QTaFdQUQYezCZGj+7s8POfVHS3Q4fh0hObpTEwexAtHDXGuc3Xdqpfv2gpg
 tEGuHhDJynhDQUg5jroGZ715txVSI1yUA2iE1DNgJKNLASDqwkl6aksANeo0wlFCv7xR
 hUvA==
X-Gm-Message-State: AOJu0YwlWJ6B08CjS5kHE3/Ir9rGvXXefsgAq4dORT6xsGQfTwHhw+X4
 ylp/Du/Q5cvodYACAKsGwYyPsmoncib2ifknwsQdzk9gm8AivORtJiw2rg11v1w8HwOi1AnywDU
 4hUANcCrhzBPvvuQJzLM4DZR9cwo=
X-Google-Smtp-Source: AGHT+IEnqCCpBDTojgLKtjI4UPhjGscI6KcfbK5vv9s6HAOo7pLHnKwHjz7drBWSjuvPCeWCfhrl385FEvHc26gIGmw=
X-Received: by 2002:a05:690c:708d:b0:609:ff22:1a88 with SMTP id
 jg13-20020a05690c708d00b00609ff221a88mr2723110ywb.44.1713540314500; Fri, 19
 Apr 2024 08:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACnaySK2RJV-1k7EsS1fGgsnBA1HE-PrzuPUdFw2JPaEGHEgMA@mail.gmail.com>
In-Reply-To: <CACnaySK2RJV-1k7EsS1fGgsnBA1HE-PrzuPUdFw2JPaEGHEgMA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 19 Apr 2024 11:25:03 -0400
Message-ID: <CAKb7UvgRV-kq_LUfd-wiyQPZhZJnr7_qxzpR6WGmz2E5J65=Hg@mail.gmail.com>
Subject: Re: Nouveau on a RISC-V SBC with Tesla K80? Supposed to not work or
 yes?
To: Raymond Wong <raymondwong3690@gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

I don't think anyone was ever able to get their hands on a K80 to
confirm. It's a different ID than the GK110 (0xf0) / GK110B (0xf1). I
believe it's referred to as a GK210, but not sure if that's just a
marketing thing or if it's actually different.

You can try copying the 0xf1 entry in devinit and seeing what happens.

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/nvkm/engi=
ne/device/base.c#n3284

i.e. just add "case 0xf2: device->chip =3D &nvf1_chipset; break;"

However it does seem somewhat likely there would be additional
differences, so I wouldn't be extremely surprised if it didn't come up
without at least some extracted firmware (which we've never done for
that chipset).

Cheers,

  -ilia

On Fri, Apr 19, 2024 at 11:14=E2=80=AFAM Raymond Wong <raymondwong3690@gmai=
l.com> wrote:
>
> NOUVEAU MESSAGE :  {
> [ 47.314360] nouveau 0001:03:00.0: enabling device (0000 -> 0002)
>
> [ 47.314452] nouveau 0001:03:00.0: unknown chipset (0f22d0a1) [ 47.323897=
]
>
> pci 0001:02:10.0: enabling device (0000 -> 0002) [ 47.323938] nouveau 000=
1:04:00.0: enabling device (0000 -> 0002)
>
> [ 47.324095] nouveau 0001:04:00.0: unknown chipset (0f22d0a1)
> }
>
> CONTEXT : {
> This thing belongs to someone else, but I'm playing with it. It is a Visi=
onFive 2 (a third one). It would seem like the PCIe implementation in there=
 is missing something that Navi 2s and 3s want. Therefore some Polaris card=
s and Kepler cards are probably the best GPUs this SBC can run.
> Of course, it is two GPUs on a single PCIe 2.0 x1 lane using a riser. I s=
ee that the Tesla K80 has it's own suspiciously incomplete line in the Code=
Names section. But nouveau reports unknown chipset when attempting to load =
drivers onto the GPUs. Maybe it doesn't have the configuration for a Tesla =
K80 after all?
> However, given Fishwaldo's 5.15.131 kernel is running on the SBC, I wonde=
r if Tesla K80 support has been added somewhere, But my roommates (myself i=
ncluded) are combined all just too noob at googling to find it.
> }
>
> SYSTEM : {
> Board : VisionFive 2
> Kernel : 5.15.131 Fishwaldo using pine64-star64_defconfig
> Nouveau enabled using scripts/config -m CONFIG_DRM_NOUVEAU
> GPU : Tesla K80 dual GPU wanting to use nouveau drivers. One PCIe 2.0 x1 =
link connects both GPUs.
> OS : Slackware ARM RISC-V (Full system, 16GB installed)
> Notes : It would appear that a GTX 750 Ti worked on another VisionFive 2,=
 as did a RX 550 on my Star64.
> }
