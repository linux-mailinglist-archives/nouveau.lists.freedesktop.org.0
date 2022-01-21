Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C74495A1F
	for <lists+nouveau@lfdr.de>; Fri, 21 Jan 2022 07:48:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48DAE10E892;
	Fri, 21 Jan 2022 06:48:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D89610E8AC
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jan 2022 06:48:19 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id w5so2698530ilo.2
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jan 2022 22:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5KQQx46xQrc01DnZR0DSwdOR1l35gAn16zm6DTWeBJI=;
 b=P9KkDg0C6Rh5uUT3fuoA8ES7EAJMUg9VhbZ9b62+gbXDrzrl75AC/4BhfTo+h8cubg
 /YEkrSKNqu0xWBy2fGiDCIAzKu/Y2Qpb1QaEeaAeKj3pKaOjFwKNiuPfmqy0g6LutcHr
 RUyeF2dng+oS2tG20SyJ0aE0z1Mlw9GYWsyOO8AFy0mzOFkFkUPNSHbaNjf0sFvbELGb
 791EbpvQmwJv53d3l5z2VzUmPsaLxg08LwgVryxOEbkEJ4is96LoVeC3jpLgfFTOgFsY
 QwOByWjMK1NHiRxpP8j+Lm1YqqJXVoB52fuHBUYfkd6MnWlGRsAbkKIIfHy5nqOgp7UQ
 upwg==
X-Gm-Message-State: AOAM531vnuJsfYiY6piVgCfXtgpvec4mTxX3QZAQoAWjm6ZcMavX8Sob
 9GOW4Ip/nByjavkqP8IfqZDyLgSOWsF+/B601zKZvTX4dTs=
X-Google-Smtp-Source: ABdhPJwLPR+ARgX/ALIKSOCcFhQ8bN30wFOtilUUrOO5X9rkm++hrv7aY2mcI+YVQIBIDC8H3SDSJ4BPcsGexKyjMF4=
X-Received: by 2002:a05:6e02:15c5:: with SMTP id
 q5mr1458461ilu.218.1642747698721; 
 Thu, 20 Jan 2022 22:48:18 -0800 (PST)
MIME-Version: 1.0
References: <20220120181657.8E3BB10E684@gabe.freedesktop.org>
 <CAKb7Uvi4+=7PTATZMh0vHcX8pg0FqR48r4_1MHphZKYQu1=hEw@mail.gmail.com>
 <2cc8f675-dec2-4640-88ab-b64dea2e3bc6@DM3NAM02FT036.eop-nam02.prod.protection.outlook.com>
In-Reply-To: <2cc8f675-dec2-4640-88ab-b64dea2e3bc6@DM3NAM02FT036.eop-nam02.prod.protection.outlook.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 21 Jan 2022 01:48:07 -0500
Message-ID: <CAKb7UvgpgHdv34oKMKXNKWMnjk=7f5y+Ab2cwfM1yDr3LkNCOQ@mail.gmail.com>
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

There's a surprisingly long document at
https://docs.kernel.org/process/submitting-patches.html

But basically make a git commit, make sure the commit message looks
like other commit messages in the area (look at "git log
drivers/gpu/drm/nouveau" for inspiration). Make sure your
Signed-off-by is on there. Then git format-patch the commit, and use
git send-email to send the resulting file to this mailing list +
dri-devel (or any other method of causing the contents of that file to
end up as the email that's sent rather than an attachment).

Cheers,

  -ilia

On Fri, Jan 21, 2022 at 12:07 AM Nick Lopez <nick@glowingmonkey.org> wrote:
>
> If it=E2=80=99s correct I=E2=80=99d like to see it make its way upstream.=
 I have no idea what the submission procedure is.
>
>
>
> From: Ilia Mirkin
> Sent: Thursday, January 20, 2022 11:24 AM
> To: Nick Lopez
> Cc: nouveau@lists.freedesktop.org
> Subject: Re: [Nouveau] Off-by-one or bad BIOS image? Apple eMac 800 GeFor=
ce 2MX
>
>
>
> This stuff is always so confusing. Let's think this through.... if
>
> bios size is 4, and we're trying to read a 4-byte thing starting at
>
> address 0, that _ought_ to work, I think. So in my strawman case,
>
> bios->size =3D=3D 4, and size =3D=3D 4. So we should only error if size >
>
> bios->size, not if they're =3D=3D. Looks like your patch is right.
>
>
>
> Want to make a linux kernel patch submission with this? (i.e.
>
> including changelog, signoff, etc?)
>
>
>
> Cheers,
>
>
>
>   -ilia
>
>
>
> On Thu, Jan 20, 2022 at 1:17 PM Nick Lopez <nick@glowingmonkey.org> wrote=
:
>
> >
>
> > Because I watch too much retro YouTube I decided it was a good idea to =
try installing Adelie Linux on my old G4/800 eMac, but the Live installer w=
ould freeze. By blacklisting nouveau I was able to get it booted and manual=
ly installed and, after hours and hours of compiling, get a working kernel =
tree to poke at. After only a few iterations with dump_stack() and nvkm_deb=
ug and the output of envytools/nvbios I worked out at the last initscript i=
nstruction was stored in the last byte of the ROM. I think the bounds check=
 in the nvbios_addr() function is miscalculating the limit as one byte shor=
t, that=E2=80=99s why I was seeing this in the syslog:
>
> >
>
> >
>
> >
>
> > nouveau 0000:00:10.0: bios: OOB 1 000007b2 000007b2
>
> >
>
> > nouveau 0000:00:10.0: devinit: 0x000007b2[ ]: unknown opcode 0x00
>
> >
>
> > nouveau 0000:00:10.0: preinit failed with -22
>
> >
>
> > nouveau: DRM-master:00000000:00000080: init failed with -22
>
> >
>
> > nouveau 0000:00:10.0: DRM-master: Device allocation failed: -22
>
> >
>
> > nouveau: probe of 0000:00:10.0 failed with error -22
>
> >
>
> >
>
> >
>
> > After I changed the limit check from:
>
> >
>
> > if (unlikely(*addr + size >=3D bios->size)) {
>
> >
>
> > to:
>
> >
>
> > if (unlikely(*addr + size > bios->size)) {
>
> >
>
> >
>
> >
>
> > it initialized the card properly, brought up the fbconsole and even see=
ms to be working in X with DRI. So the question is: was the bounds check wr=
ong, or is the NVDA,BMP image provided by OpenFirmware truncated? I=E2=80=
=99m guess this doesn=E2=80=99t turn up elsewhere because the ROM images re=
ad through any of the other methods are the size of flash chip they=E2=80=
=99re stored on so there=E2=80=99s always unused space at the end and they =
never use the last byte where the NVDA,BMP provided by OpenFirmware is just=
 the active section.
>
> >
>
> >
>
> >
>
> > The patch is against the Adelie easy-kernel patch 5.4 tree, but it look=
s like that code is still there in the current upstream torvalds/linux git.
>
>
