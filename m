Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2287C619D61
	for <lists+nouveau@lfdr.de>; Fri,  4 Nov 2022 17:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF1210E90C;
	Fri,  4 Nov 2022 16:35:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F26B10E90B
 for <nouveau@lists.freedesktop.org>; Fri,  4 Nov 2022 16:35:54 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id t14so4979806vsr.9
 for <nouveau@lists.freedesktop.org>; Fri, 04 Nov 2022 09:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7DP79EAe5DeULdmGH89nCSLm48kWsCAT+Anmy0/QCY=;
 b=ZFCYtEZrjjsLDDKP52MbVAMnRPEVclAU5nHqP2LaKGELlo7xhdGe+utzViUua620qC
 YrRGgYkEVw4ZZf2ByGp4o30r2ik0jt0B+pKcm1DMY6rbrEQbLoOZZPna5WmBU3I7vBMp
 Ls56z8OOFySnU8gDo/g8JC4zMR+vC5hBFttVnDEmlZkmRY8EOUB96qJtsqY0e9R5sKCb
 b4qCs3mbMdWml3kqF3X0iVZ3NVCTX5QMLPXLoSjCnWOXunYC725LBz9RTJAomFfYlWSf
 6mqDLnh7dFuX0sifRvuachuyxAPVSilvlambv3LH6aubvrA5tj9kUaPWhyJgAQHjLUkr
 8MMA==
X-Gm-Message-State: ACrzQf2yJ+Nh4kdh50JlDeVe3Kv2MJ+YTiqMxphUPeM9OzL9BNnNaG6E
 Z8A1CdFSDlR4k4JwAdrPTGGF4sgvq0NAXDsYteQ=
X-Google-Smtp-Source: AMsMyM7tt4pMLe77scPokY2KzFmPcxicDzkB6XoaEBEAv2/0MItkASUHvf/O/8azMBImYy/JpM59qt0erM6y2bcqyIw=
X-Received: by 2002:a67:b308:0:b0:3ac:74ca:c8ce with SMTP id
 a8-20020a67b308000000b003ac74cac8cemr20031530vsm.18.1667579753017; Fri, 04
 Nov 2022 09:35:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
In-Reply-To: <CAEFVmOL+163rX7hEpgKn20RrzMXekw6JcM30rY4AmoHhDV_5Qw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 4 Nov 2022 12:35:41 -0400
Message-ID: <CAKb7Uvi79P6skuKgF6Q884TtiC1k0bwrBw7r41TfY1-BBLjTxQ@mail.gmail.com>
To: Lukas Satin <luke.satin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] TV Out question
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

https://nouveau.freedesktop.org/KernelModuleParameters.html

Perhaps nouveau.tv_norm=3DNTSC-M will help get you the 60hz modes? I
haven't played with these options much at all, it has always sorta
Just Worked for me.

This should have the validation of new modes, make sure you don't run
afoul of this:

https://cgit.freedesktop.org/drm/drm/tree/drivers/gpu/drm/nouveau/dispnv04/=
tvnv17.c#n303

Cheers,

  -ilia

On Thu, Nov 3, 2022 at 10:56 PM Lukas Satin <luke.satin@gmail.com> wrote:
>
> Hi, I am currently testing Batocera Linux for retrogaming with 15KHz outp=
ut on CRT / TV.
>
> The machine I discovered is a certified Windows Media Center / Intel ViiV=
 machine: Acer iDEA 510
>
> It features:
> RCA component output
> S-Video CVBS output
> S-Video DIN output
> Scart IN / Scart OUT (two DVB-T tuners for realtime playback and recordin=
g)
> DVI-I out
> HDMI out
>
> Laptop style components, MXM module Geforce 7 Go 7600 (NVIDIA Curie).
>
> Now, BIOS default output via RCA component is 640x480 NTSC (480i, 60Hz). =
In Windows I can switch between NTSC and PAL (480i or 576i).
>
> As this is EU machine, after BIOS it often defaults to 576i PAL, unless s=
et otherwise.
>
> Now your nouveau driver therefore defaults to 576i.
>
> Xrandr looks like this:
> TV-1 connected 640x480+0+0 (normal left inverted right x axis y axis) 0mm=
 x 0mm
>    720x576       50.00 +
>    1024x768      50.00
>    800x600       50.00
>    720x480       50.00
>    640x480       50.00*
>    400x300       50.00
>    320x240       50.00
>    320x200       50.00
>    768x576       50.00
>    360x200       60.00
>    360x240       60.00
>    640x240       60.00
>
> I tried to add some additional modelines. But look at 640x480. It forces =
50Hz and I am unable to remove it, create new or change it to 60Hz. Therefo=
re the TV is always set to 576i and screen output is 640x480, therefore it =
looks like GPU scaled. First I read your troubleshooting which mentions sca=
ling, so I tried to disable scaling. Did not help.
>
> Now I read about this:
> https://nvidia.custhelp.com/app/answers/detail/a_id/177/~/linux---configu=
ring-tv-out
>
> And this might be the solution and issue. It would correspond with what c=
an be observed in Windows 7.
>
> Does your driver have some options for configuring TV Out and name switch=
ing from PAL to NTSC or HD480i mode? It should be automatic based on 480i o=
r 576i or 240p or 288p, but it is not.
>
> Thanks,
> Lukas
