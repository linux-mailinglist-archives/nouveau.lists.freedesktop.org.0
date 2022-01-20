Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C150749541E
	for <lists+nouveau@lfdr.de>; Thu, 20 Jan 2022 19:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5121210E93D;
	Thu, 20 Jan 2022 18:24:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7BA10EBE2
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jan 2022 18:24:14 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id d3so5706664ilr.10
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jan 2022 10:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sFP1wVyx7t56F3h899HjLSDKtPOh4Dwk1dyymvIKXj8=;
 b=AI4xxKtkVdCDdeTz0j/Z9vATKC5FKPtYqqSIMsQp11Qx8TQqzN36snhBh2vSPw7ZhK
 fUEgCFkqTW8vEmbUnyZNFAFRK7yGabJmlPSr94E5M+0aTpLEnE+bZMXGRUBVAWQOGI/z
 Wfben9Tqqd4eV+jpuMQMKxbnvUdR9ZFPs1DxZ9yABkMxGV2Iv5wsXEkILPzLkzXE1rX+
 aRiXefgWKM/nS6qxg4V/uFZNhD9yYstq3X2DqwKoYuSV1WXT5KHcIF01kC17KatWD77+
 y6BJH8ab8DA3diq08KLz6NJMwxCVJFMJ5VzQp4hUbGjMjbYAZMDlQdf8TIHxWO0drkRW
 3DMw==
X-Gm-Message-State: AOAM530vXs7Lfd+PClnOgwqeLMJ2s1zwcylD6QFWQKFMTep9zSodLCh1
 fDVO3Ca6utUV+bRtpQTVMpDXxNIfF3SLfIfM8S/46znu
X-Google-Smtp-Source: ABdhPJwBU+q82iCba/BE0eOTpzEuD0Qw3uS0bvX/+ZOkQ/EjZ27bkRgaS0Zdr8xZJJ6U/3kIKKvGFR70jjpQeljzShE=
X-Received: by 2002:a05:6e02:1ba8:: with SMTP id
 n8mr113816ili.235.1642703053940; 
 Thu, 20 Jan 2022 10:24:13 -0800 (PST)
MIME-Version: 1.0
References: <20220120181657.8E3BB10E684@gabe.freedesktop.org>
In-Reply-To: <20220120181657.8E3BB10E684@gabe.freedesktop.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 20 Jan 2022 13:24:02 -0500
Message-ID: <CAKb7Uvi4+=7PTATZMh0vHcX8pg0FqR48r4_1MHphZKYQu1=hEw@mail.gmail.com>
To: Nick Lopez <nick@glowingmonkey.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] Off-by-one or bad BIOS image? Apple eMac 800 GeForce
 2MX
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

This stuff is always so confusing. Let's think this through.... if
bios size is 4, and we're trying to read a 4-byte thing starting at
address 0, that _ought_ to work, I think. So in my strawman case,
bios->size =3D=3D 4, and size =3D=3D 4. So we should only error if size >
bios->size, not if they're =3D=3D. Looks like your patch is right.

Want to make a linux kernel patch submission with this? (i.e.
including changelog, signoff, etc?)

Cheers,

  -ilia

On Thu, Jan 20, 2022 at 1:17 PM Nick Lopez <nick@glowingmonkey.org> wrote:
>
> Because I watch too much retro YouTube I decided it was a good idea to tr=
y installing Adelie Linux on my old G4/800 eMac, but the Live installer wou=
ld freeze. By blacklisting nouveau I was able to get it booted and manually=
 installed and, after hours and hours of compiling, get a working kernel tr=
ee to poke at. After only a few iterations with dump_stack() and nvkm_debug=
 and the output of envytools/nvbios I worked out at the last initscript ins=
truction was stored in the last byte of the ROM. I think the bounds check i=
n the nvbios_addr() function is miscalculating the limit as one byte short,=
 that=E2=80=99s why I was seeing this in the syslog:
>
>
>
> nouveau 0000:00:10.0: bios: OOB 1 000007b2 000007b2
>
> nouveau 0000:00:10.0: devinit: 0x000007b2[ ]: unknown opcode 0x00
>
> nouveau 0000:00:10.0: preinit failed with -22
>
> nouveau: DRM-master:00000000:00000080: init failed with -22
>
> nouveau 0000:00:10.0: DRM-master: Device allocation failed: -22
>
> nouveau: probe of 0000:00:10.0 failed with error -22
>
>
>
> After I changed the limit check from:
>
> if (unlikely(*addr + size >=3D bios->size)) {
>
> to:
>
> if (unlikely(*addr + size > bios->size)) {
>
>
>
> it initialized the card properly, brought up the fbconsole and even seems=
 to be working in X with DRI. So the question is: was the bounds check wron=
g, or is the NVDA,BMP image provided by OpenFirmware truncated? I=E2=80=99m=
 guess this doesn=E2=80=99t turn up elsewhere because the ROM images read t=
hrough any of the other methods are the size of flash chip they=E2=80=99re =
stored on so there=E2=80=99s always unused space at the end and they never =
use the last byte where the NVDA,BMP provided by OpenFirmware is just the a=
ctive section.
>
>
>
> The patch is against the Adelie easy-kernel patch 5.4 tree, but it looks =
like that code is still there in the current upstream torvalds/linux git.
