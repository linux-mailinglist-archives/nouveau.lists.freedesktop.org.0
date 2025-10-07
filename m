Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7018BC1FD4
	for <lists+nouveau@lfdr.de>; Tue, 07 Oct 2025 17:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F3210E1BB;
	Tue,  7 Oct 2025 15:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="w7bngF3l";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFEB10E1CE
 for <nouveau@lists.freedesktop.org>; Tue,  7 Oct 2025 15:51:05 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-b49c1c130c9so4221628a12.0
 for <nouveau@lists.freedesktop.org>; Tue, 07 Oct 2025 08:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1759852265; x=1760457065;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMkkLZecLshDmLpas5ysGNdgQh45YFNhGTbrh0PHnMs=;
 b=w7bngF3lHp7pJATiAuJQITsZnpEoW/R8pZebDD169OUD14N0MprxENTgW2uNMZ7Q2G
 dYxrTBieiCsevCuMenM3YCz1TmbFFhdAfle2htmHngCBs/deq8AWffVsSLR5ugy9D+tA
 LNxMXE8Irs/is6ClEDu593O1baDygy4T8o/gxH9z6vBh6+qFsu6fKmAK73p2UXlMFt5M
 yFXTnHcd7rkmPtdTIyWQLcgafn2qArvNOxSrvS+nTla4w9WmljZkl3VnFmu7GBXumjLX
 v5Qkz+2ez2eqtyWUjwq2JGccc7Avjlez49m2Pa5lUmJeB7rZno7PYg5fYDN7lV92/wCM
 bJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759852265; x=1760457065;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMkkLZecLshDmLpas5ysGNdgQh45YFNhGTbrh0PHnMs=;
 b=UsmqgpGyyW3AVIUC9CO/aukRqTEMnakFGDtgoLCG/m2btdmjmLAa/tUBMJZitOEn2x
 1GtjSEyHeRU1FzsBGmJZjdvVBVV05GSN5R3WmBAtzmL3dwUOEENm0SQPOkLIPpH75uO5
 vSF1ayYjJv4MnbyxWwIs7GPSIHlvht+gKehH9mT35SCNEslmQJK6gGfgE+7/GEuCeCFB
 nlPAwmSmQ5CvELOsVee1v9JyzjAxfFWCwETUV4w6CtZVCLFsxA1vTbIDqOEDkWmYaRFT
 oti5jxN6GEk1nFB0/4867Wad+017d9QjcRh5qowa6gpxT794OuyhBxULp6s85pWNPHz2
 Z8LA==
X-Gm-Message-State: AOJu0YwZYdxXDpG8XxIYpEMf+V9NNXHLCVHjTt6kOeL2Pfjzyo6OmRdd
 ixFjbNiypZX5qAILBvDH082KJMS5EwPPRqDbmSUY3WhFUS6att5K2REhsjTq9AWIHaOusZucf7Q
 JR52Tlx/9oNrpQmo0tDRWRna5obPPEoRv7JoU4zOnoMMkbR8mP0kd/Gjz3A==
X-Gm-Gg: ASbGncuThJfGP7AIERjGJ3G7+HV2iu6kWY5oaVMPT3lQWhQe7RViFLk4cWxNto6EWIb
 cPjkabd4BcFJSZopPWWKwxm8F902ZVep9CQt/u+Oofq2/ko6fT22zPMCdx5NkIkkE0P0lC9bObX
 fEOsY1pQYH/497uDaLgqckvFTxW5Y95zwX33xwFr7Ro8AhgqVFfEww/h5CrgYtImAaGQxDidlN7
 Q9S3gFVzaciLycpbPWAwUepp+r8q4k=
X-Google-Smtp-Source: AGHT+IFXM9FGLPDlJ92jZCfjdSVAUPQ/zN1SNrCuay0cBT/H2n7QO1itqHGG+xRLqdqqtGAq0FrOy4kZjejQRM8TXBU=
X-Received: by 2002:a17:903:298e:b0:26c:9b12:2b6d with SMTP id
 d9443c01a7336-290272b550dmr2787125ad.38.1759852264850; Tue, 07 Oct 2025
 08:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251007152424.7322-1-pvorel@suse.cz>
In-Reply-To: <20251007152424.7322-1-pvorel@suse.cz>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Tue, 7 Oct 2025 11:50:53 -0400
X-Gm-Features: AS18NWDL00salixdVAXR_qvXxcMkq-7tbGMICGwNimbvUwO392Kbqinqijl33Gg
Message-ID: <CAOFGe96TGxbwwwUnz=NimY1vv=Fzr-S0KT3xq1xSS08MvKFAzA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] Avoid NOUVEAU_GETPARAM_HAS_VMA_TILEMODE on nv177
To: Petr Vorel <pvorel@suse.cz>
Cc: nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Takashi Iwai <tiwai@suse.de>, Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>
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

This likely has nothing to do with GA107 and everything to do with the
fact that the GPU is in the dock. Also, this by itself doesn't fix a
kernel bug. It disables DRM format modifiers in Mesa and that's likely
having knock-on effects with compositors and GPUs vanishing. Please
file a Mesa issue. We should sort it out in userspace.

~Faith

On Tue, Oct 7, 2025 at 11:24=E2=80=AFAM Petr Vorel <pvorel@suse.cz> wrote:
>
> 959314c438ca broke behavior at least on GA107GLM RTX A1000 on Thinkpad
> P16, which has GPU in dock. unplugging dock freezes GUI on KDE5 Plasma,
> plugging dock freezes GUI on GNOME.
>
> As a workaround avoid setting value on NOUVEAU_GETPARAM_HAS_VMA_TILEMODE
> for nv177.
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi all,
>
> [ I'm sorry to repost due previously not being subscribed to the list ]
>
> obviously this is not a solution (that's why RFC and I don't set Fixes:
> 959314c438ca), but it documents that hardware is unusable with 959314c438=
ca.
>
> FYI we are going to not set getparam->value for
> NOUVEAU_GETPARAM_HAS_VMA_TILEMODE for any GPU on openSUSE Tumbleweed.
> https://bugzilla.suse.com/show_bug.cgi?id=3D1198108
>
> Kind regards,
> Petr
>
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/no=
uveau/nouveau_abi16.c
> index a3ba07fc48a08..fefaf7287723c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -323,7 +323,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>                 break;
>         }
>         case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:
> -               getparam->value =3D 1;
> +               if (drm->client.device.info.chipset !=3D 0x177) {
> +                       getparam->value =3D 1;
> +               } else {
> +                       NV_PRINTK(dbg, cli, "Ignoring NOUVEAU_GETPARAM_HA=
S_VMA_TILEMODE for 0x%x\n",
> +                                 drm->client.device.info.chipset);
> +               }
>                 break;
>         default:
>                 NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam-=
>param);
> --
> 2.51.0
>
