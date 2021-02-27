Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6464A326F06
	for <lists+nouveau@lfdr.de>; Sat, 27 Feb 2021 22:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5538D6E083;
	Sat, 27 Feb 2021 21:27:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E1F6E083
 for <nouveau@lists.freedesktop.org>; Sat, 27 Feb 2021 21:27:08 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id v14so84755ilj.11
 for <nouveau@lists.freedesktop.org>; Sat, 27 Feb 2021 13:27:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ruONYkSzxOj/u/+MRJzDrCXwZoqYkxBqZvq4nfg6lPY=;
 b=i1ov6d+gBjYN0Me+z5Bv9UqpJvbZM89Pup5bZdeI+deS62QKwZO9GEwVzpMSb7Xw93
 1LvmgCerx7sYAYcuFlwCXFURCDCX92fzMU6fRv6OIWHEQEj47xqjMsVjuEOdVvNQCS0C
 BWVL3HUlJifbbqk7EY/sBxboIDcexVBw6IyPHQUHIKOxBh1cgPumxWQmB0MacL2ewsZw
 2v/nFqHD/PoL+2Pi0q5rzDaqfFmjQvdv3VxI88YuhORzyCN8N38QJhVzbShkQ1salQHL
 cBsGzJ54/EhOYdRhBTkIPZjI3xnhhO0sEqrXLWiJG++RCOvzJvvfqPJRS0ig6Lb7u4G9
 ao2w==
X-Gm-Message-State: AOAM531YcOQECMChIgfndzYXdnGafZSFY+a5Urs+ijM1hX7o/ZoJhsnR
 u1ikG6AfZlWzDAWCXxiaOyCX+0rsfLuOQSXGvnw=
X-Google-Smtp-Source: ABdhPJxCDdUk8VUDMIFhGnWm9oR0qfUq9Ps7OqBmD38rq46zWrI60w+cm7dGMtm1j7CG7QcOv0v0iWR0LeC5yZGwOc0=
X-Received: by 2002:a92:1a51:: with SMTP id z17mr7889440ill.295.1614461227984; 
 Sat, 27 Feb 2021 13:27:07 -0800 (PST)
MIME-Version: 1.0
References: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
 <YDUkfjDA4xLJlxE5@pflmari> <YDUr2OGDsxDyC0l2@pflmari>
 <CAKb7UvjmdgS536tNzisomi_oXOGk3Q+anp0AfPvA8OruU_9m5Q@mail.gmail.com>
 <YDYXiTm7MDXgYT7H@pflmari>
 <CAKb7UvgQXXThAfqJo+FEfUbgLtGzb2kvg9aSFXZn_XWivsv48Q@mail.gmail.com>
 <YDaAQts9LIb5h3xd@pflmari>
 <CAKb7Uvi8GUe+F3oMOwtAxOAi5ffF=b=9XYv+fZf742frroXfSA@mail.gmail.com>
 <YDaEiDkTiqhy/r+i@pflmari>
 <CAKb7UviFdgqqSrFvZJzfenaKa_0P6hJ4SaDrwA39Lz8jVigDGw@mail.gmail.com>
 <YDaGtzRDUIbErYDY@pflmari>
 <CAKb7UvjBQeb84sitYUTLOd6EJo_+_9hXjmT=8r5V1onxtUMh7g@mail.gmail.com>
 <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
In-Reply-To: <91687a59-dae6-199e-ca4a-35b49b6959ea@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 27 Feb 2021 16:26:57 -0500
Message-ID: <CAKb7Uvg-R-rW_=+YZusocwwedDzHc0Nffwki5vOEd4tP6zRy3g@mail.gmail.com>
To: uwe.sauter.de@gmail.com
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Cc: Alex Riesen <alexander.riesen@cetitec.com>,
 nouveau <nouveau@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Feb 27, 2021 at 7:28 AM Uwe Sauter <uwe.sauter.de@gmail.com> wrote:
>
> Hi Ilia,
>
> Am 24.02.21 um 18:47 schrieb Ilia Mirkin:
> > On Wed, Feb 24, 2021 at 12:03 PM Alex Riesen
> > <alexander.riesen@cetitec.com> wrote:
> >>
> >> Ilia Mirkin, Wed, Feb 24, 2021 17:57:41 +0100:
> >>> On Wed, Feb 24, 2021 at 11:53 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> >>>> Ilia Mirkin, Wed, Feb 24, 2021 17:48:39 +0100:
> >>>>> Just to be crystal clear -- are you saying that 128x128 works or does
> >>>>> not work? (You said "yes", which would imply it works OK, but then you
> >>>>> said both cases, which would imply doesn't work since 256x256 doesn't
> >>>>> work?)
> >>>>
> >>>> Modetest with 128x128 cursor works. Without damage to the cursor: modetest
> >>>> shows normal cursor in vanilla v5.11. Modetest also shows normal cursor in
> >>>> vanilla v5.11 with the commit reverted.
> >>>
> >>> But modetest with 256x256 doesn't work (correctly) right? Or did I
> >>> misunderstand?
> >>
> >> Right. That's why I was asking if I did everything right: it was just corrupted
> >> in both kernels.
> >
> > OK. So 128x128 works, 256x256 does not. Interesting.
> >
> >>
> >>> All the patch does is allow those large cursors to be used, which gets
> >>> reported via drm APIs and modesetting picks the largest cursor
> >>> available. (And actually I think it's even not required to use the
> >>> large cursors, it just controls what's reported in the defaults to
> >>> userspace.)
> >>
> >> Maybe something in X code is not prepared to handle the kernel reporting
> >> large cursor support? Even though 128x128 is pretty large, and I don't think
> >> I even use that large cursors in X configuration. How can I check?
> >
> > Yes, 64x64 is enough for anyone (or was it 640kb?) But it's unlikely
> > to be an issue. I believe that AMD also exposes 256x256 cursors
> > depending on the gen:
> >
> > display/dc/dce100/dce100_resource.c:    dc->caps.max_cursor_size = 128;
> > display/dc/dce110/dce110_resource.c:    dc->caps.max_cursor_size = 128;
> > display/dc/dce112/dce112_resource.c:    dc->caps.max_cursor_size = 128;
> > display/dc/dce120/dce120_resource.c:    dc->caps.max_cursor_size = 128;
> > display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
> > display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
> > display/dc/dce60/dce60_resource.c:      dc->caps.max_cursor_size = 64;
> > display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
> > display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
> > display/dc/dce80/dce80_resource.c:      dc->caps.max_cursor_size = 128;
> > display/dc/dcn10/dcn10_resource.c:      dc->caps.max_cursor_size = 256;
> > display/dc/dcn20/dcn20_resource.c:      dc->caps.max_cursor_size = 256;
> > display/dc/dcn21/dcn21_resource.c:      dc->caps.max_cursor_size = 256;
> > display/dc/dcn30/dcn30_resource.c:      dc->caps.max_cursor_size = 256;
> >
> > which should have the equivalent effect.
> >
> > But since you're seeing issues with modetest as well (which uses the
> > ioctl's pretty directly), presumably Xorg is not to blame.
> >
> > It's easy enough to adjust the kernel to report a lower size (and
> > reject the larger cursors), I just want to understand which gens are
> > affected by this.
>
> I can also report that the modesetting ddx that comes with xorg-server 1.20.10-3 (Arch Linux package) shows this kind of
> cursor-cut-into-horizontal-stripes behavior. Changing to xf86-video-nouveau 1.0.17-1 solves this issue. But nouveau has
> issues with Mate 1.24 (as discussed earlier this month).
>
> My hardware:
> # lspci -s 3:0.0 -v
> 03:00.0 VGA compatible controller: NVIDIA Corporation GK208B [GeForce GT 710] (rev a1) (prog-if 00 [VGA controller])
>         Subsystem: ASUSTeK Computer Inc. GT710-4H-SL-2GD5
>         Flags: bus master, fast devsel, latency 0, IRQ 36, IOMMU group 12
>         Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
>         Memory at fff0000000 (64-bit, prefetchable) [size=128M]
>         Memory at fff8000000 (64-bit, prefetchable) [size=32M]
>         I/O ports at f000 [size=128]
>         Expansion ROM at fc000000 [disabled] [size=512K]
>         Capabilities: [60] Power Management version 3
>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>         Capabilities: [100] Virtual Channel
>         Capabilities: [128] Power Budgeting <?>
>         Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
>         Capabilities: [900] Secondary PCI Express
>         Kernel driver in use: nouveau
>         Kernel modules: nouveau
>
>
> If I can help in any way please let me know.

Thanks, that's good info. Simon - you originally said that everything
looked good on your GK208, so a retest would be super.

I just double-checked on a GP108 (with an older kernel, but same idea
should apply), and it seems like 256x256 cursors are fine there.
However the display logic has gone through some ideally no-op updates
since that kernel version, but there could very easily be issues.

Can you try Alex's patch to modetest and confirm that you see issues
with modetest? If so, can you (and maybe Alex as well) try an older
kernel (I'm on 5.6) and see if modetest behaves well there. [The patch
in question was to expose 256x256 as the 'preferred' size, but support
for the larger cursors has been around for a while.] Alex - if you
have time, same question to you.

You can find the patch here:
https://lists.x.org/archives/nouveau/2021-February/037992.html

Unfortunately I'm doing some other stuff, so it's not convenient for
me to hop to a different kernel version right now.

Cheers,

  -ilia
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
