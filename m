Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C12FEFC1
	for <lists+nouveau@lfdr.de>; Thu, 21 Jan 2021 17:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199E56E093;
	Thu, 21 Jan 2021 16:06:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B76E093
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 16:05:30 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id t17so1894005qtq.2
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 08:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QsCZ+3Qv2OqBHLfFLD05Wez1vRkOzhgGESIBtrDBy2c=;
 b=NL3OliGWdB+SFyeqXGK6KccjBMzsaZPGhLdZydsWcU8J309f75iVP6CtuC6hezatMf
 4wAqRqVOONToaj6Rw2yljIgdizRR/nUmuQn2udf7w6tP1mDgFqD1nVRy5YfQzSbaNuiB
 P80GYg0iPjBUJMXdKpN9oQxXSV3IapbXHdQm0K6cWUO3RRd1C1EX5pd6XrxJ9SLX2JIR
 7tTmUyvd8Haxqbooz+qY2AdElmQ1Q4Mdn8CPJq+7kgwnEyOG8Sy+5i7C04PEd8X4QA0L
 z5Rsi/D/6OaFdDpt1+Nrd0JwzasGjyedfqWSvgagKaEzY28iyJL10sqiTNMD+GOZFKim
 SiZQ==
X-Gm-Message-State: AOAM531aQaS55HhjQlpuMa/r0CaCr2NZJdy5+L6GaKxxc3MtTuGmoMUK
 pxD0gRlhJvTCxuYzDLs9Pyd1PWZDSez7GYLADEEZI9Z2
X-Google-Smtp-Source: ABdhPJylK3HSqbQY6cHOls9+JWL6iC8+T1V6evUrm8kgrVZJyXmgL4A9hXVPEn9CNUjnV3AvHHFJ2ja/JK7KpZrNRDA=
X-Received: by 2002:ac8:6a01:: with SMTP id t1mr274907qtr.105.1611245129225;
 Thu, 21 Jan 2021 08:05:29 -0800 (PST)
MIME-Version: 1.0
References: <20210121111118.34587-1-bastian.beischer@rwth-aachen.de>
 <20210121142736.9525-1-bastian.beischer@rwth-aachen.de>
In-Reply-To: <20210121142736.9525-1-bastian.beischer@rwth-aachen.de>
From: Bastian Beranek <bastian.beischer@rwth-aachen.de>
Date: Thu, 21 Jan 2021 17:05:13 +0100
Message-ID: <CAK9AuB9UkqH0QvVKjZfwwxFYxHePYPRiuRhByn-EqRP__40sVg@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
X-Mailman-Approved-At: Thu, 21 Jan 2021 16:06:11 +0000
Subject: Re: [Nouveau] [PATCH v3] drm/gpu/nouveau/dispnv50: Restore pushing
 of all data.
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Sorry, please use v3, I made a mistake in v2 and v1 was incomplete.

Apologies for the inconveniences!

On Thu, Jan 21, 2021 at 3:27 PM Bastian Beranek
<bastian.beischer@rwth-aachen.de> wrote:
>
> Commit f844eb485eb056ad3b67e49f95cbc6c685a73db4 introduced a regression for
> NV50, which lead to visual artifacts, tearing and eventual crashes.
>
> In the changes of f844eb485eb056ad3b67e49f95cbc6c685a73db4 only the first line
> was correctly translated to the new NVIDIA header macros:
>
> -               PUSH_NVSQ(push, NV827C, 0x0110, 0,
> -                                       0x0114, 0);
> +               PUSH_MTHD(push, NV827C, SET_PROCESSING,
> +                         NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
>
> The lower part ("0x0114, 0") was probably omitted by accident.
>
> This patch restores the push of the missing data and fixes the regression.
>
> Signed-off-by: Bastian Beranek <bastian.beischer@rwth-aachen.de>
> Fixes: f844eb485eb056ad3b67e49f95cbc6c685a73db4
> Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/14
> ---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c | 6 +++++-
>  drivers/gpu/drm/nouveau/dispnv50/base827c.c | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> index 302d4e6fc52f..788db043a342 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> @@ -88,7 +88,11 @@ base507c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
>                           NVVAL(NV507C, SET_CONVERSION, OFS, 0x64));
>         } else {
>                 PUSH_MTHD(push, NV507C, SET_PROCESSING,
> -                         NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
> +                         NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE),
> +
> +                                       SET_CONVERSION,
> +                         NVVAL(NV507C, SET_CONVERSION, GAIN, 0) |
> +                         NVVAL(NV507C, SET_CONVERSION, OFS, 0));
>         }
>
>         PUSH_MTHD(push, NV507C, SURFACE_SET_OFFSET(0, 0), asyw->image.offset[0] >> 8);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base827c.c b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
> index 18d34096f125..093d4ba6910e 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/base827c.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
> @@ -49,7 +49,11 @@ base827c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
>                           NVVAL(NV827C, SET_CONVERSION, OFS, 0x64));
>         } else {
>                 PUSH_MTHD(push, NV827C, SET_PROCESSING,
> -                         NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
> +                         NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE),
> +
> +                                       SET_CONVERSION,
> +                         NVVAL(NV827C, SET_CONVERSION, GAIN, 0) |
> +                         NVVAL(NV827C, SET_CONVERSION, OFS, 0));
>         }
>
>         PUSH_MTHD(push, NV827C, SURFACE_SET_OFFSET(0, 0), asyw->image.offset[0] >> 8,
> --
> 2.30.0
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
