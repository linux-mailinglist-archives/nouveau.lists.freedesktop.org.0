Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62A2623118
	for <lists+nouveau@lfdr.de>; Wed,  9 Nov 2022 18:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F174E10E5F7;
	Wed,  9 Nov 2022 17:09:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D13D10E5FF
 for <nouveau@lists.freedesktop.org>; Wed,  9 Nov 2022 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668013753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=upBhh3tf2YeJs0Ui54TR2IQ+XSYjRkdPr1fWGChfdYU=;
 b=SulFQkrlo3Uc+hXSwJBB2NCYy8HX8ZD4lEMc3tJo7pzh2PlKJU0vq2xByr/a6mJ9/A3J3V
 6gtdfgaq/F5oPIwitLDQEKYxKgnj7X4OMvnTzFusmN+HW5p7tY4NuNHMZz05bEH43026rM
 nwi1aGnv1JaIipUpLx5+erZ8WyHSIn8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-_WpZ_RGvOIi0PHxYvLxh6A-1; Wed, 09 Nov 2022 12:09:10 -0500
X-MC-Unique: _WpZ_RGvOIi0PHxYvLxh6A-1
Received: by mail-qt1-f197.google.com with SMTP id
 s14-20020a05622a1a8e00b00397eacd9c1aso13072946qtc.21
 for <nouveau@lists.freedesktop.org>; Wed, 09 Nov 2022 09:09:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=upBhh3tf2YeJs0Ui54TR2IQ+XSYjRkdPr1fWGChfdYU=;
 b=MeObwcxunWmsvVxdk5RdhyVY8xl53F7phHv7xedLZtwgvAwu0CJYvIH3yjoGKP/n7d
 a52fD5C5CYdULJ6xIV8M9aiw+KgC+hBFlKBeQztq17mFQXvFKvqyj+dEFofUQng8kKlB
 /AANU97CY3pW128qF5TqOtFqsC7q432tz6K8wmXk0iaiZsYbhnhS0dlBCMwwJZTMWtqP
 HsNrKMLosV+UOiapFJJDbpEP3O3M6CA7uBYD5lcood1t4cVuTKzPmery9CZqZJQnEezz
 thWiVCKvSuQQfIPJwBr1uco0NOY9IZ/sCbbeh4dcFdYLeSRuhmq2IVWs4M0n8rXn0Enx
 jpLg==
X-Gm-Message-State: ACrzQf0RImkxjwcX5a9nDNZwxawokZ3PGSb8TduwE7gS9E1Tv1VA8uKd
 SczvkQ6P1wUZZt2TKg9Wuf4gMcJ9pqT9PJCYUe6q9bfESZtYolmdEn3L4Fnf+iYoVC72Tjzd1fo
 2bet4BONKLzJ8pFrkB/gxSTR8XPp5kdTG9E+EocOaSw==
X-Received: by 2002:a05:622a:1015:b0:3a4:f0c4:e8ff with SMTP id
 d21-20020a05622a101500b003a4f0c4e8ffmr49327083qte.141.1668013750483; 
 Wed, 09 Nov 2022 09:09:10 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6CER2NjfL6gW2cHCg7k6TFxpFj9M4CDm+qG78yLBTsXX/dUFY9/GnHR1vrOryl4ljnTR9BetCm7ikms3WUPIU=
X-Received: by 2002:a05:622a:1015:b0:3a4:f0c4:e8ff with SMTP id
 d21-20020a05622a101500b003a4f0c4e8ffmr49327064qte.141.1668013750303; Wed, 09
 Nov 2022 09:09:10 -0800 (PST)
MIME-Version: 1.0
References: <20221031163211.13228-1-antoniospg100@gmail.com>
 <20221104220424.41164-1-antoniospg100@gmail.com>
In-Reply-To: <20221104220424.41164-1-antoniospg100@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Nov 2022 18:08:59 +0100
Message-ID: <CACO55tt0skPqe2YNrq3qnMvsUa1cT2db2zt718yF4S4hLnqC0Q@mail.gmail.com>
To: Antonio Gomes <antoniospg100@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH v3] drm/nouveau: Add support to control
 backlight using bl_power for nva3.
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 4, 2022 at 11:04 PM Antonio Gomes <antoniospg100@gmail.com> wrote:
>
> From: antoniospg <antoniospg100@gmail.com>
>
> Summary:
>
> * Add support to turn on/off backlight when changing values in bl_power
>   file. This is achieved by using function backlight_get_brightness()
>   in nva3_set_intensity to get current brightness.
>
> Test plan:
>
> * Turn off:
> echo 1 > /sys/class/backlight/nv_backlight/bl_power
>
> * Turn on:
> echo 0 > /sys/class/backlight/nv_backlight/bl_power
>
> Signed-off-by: antoniospg <antoniospg100@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index a2141d3d9b1d..5c82f5189b79 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -263,7 +263,11 @@ nva3_set_intensity(struct backlight_device *bd)
>         u32 div, val;
>
>         div = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
> -       val = (bd->props.brightness * div) / 100;
> +
> +       val = backlight_get_brightness(bd);
> +       if (val)
> +               val = (val * div) / 100;
> +
>         if (div) {
>                 nvif_wr32(device, NV50_PDISP_SOR_PWM_CTL(or),
>                           val |
> --
> 2.25.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

btw, i'll fix up the name with the one from the Email From field, so
you won't have to send it out again.

