Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 595BA4242B1
	for <lists+nouveau@lfdr.de>; Wed,  6 Oct 2021 18:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE986EDBC;
	Wed,  6 Oct 2021 16:30:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DEA6EDBC
 for <nouveau@lists.freedesktop.org>; Wed,  6 Oct 2021 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633537821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ljugr8xYdJo7W0S7wZ1H4kpTYrrrY7cxZ+QUOs2N9UQ=;
 b=B9G18LG3X1/8ETee4pnUeSXHpS/pK0RlZHSY7slTCygIU6qRWxiZ99gvhI+MK4dINwr1Yq
 +BSuGsf1xeJT2rTxyH4fja7hjmEVCMBJEM3mCACFMh48JndSeEmEjV5HKAON1y5e6k5hod
 yiGPsPNmLgJ8kJJ1qsMqq6FNf4nK9vw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-8XTPjg-GONi2u89ArGkwbg-1; Wed, 06 Oct 2021 12:30:20 -0400
X-MC-Unique: 8XTPjg-GONi2u89ArGkwbg-1
Received: by mail-wr1-f69.google.com with SMTP id
 75-20020adf82d1000000b00160cbb0f800so1733293wrc.22
 for <nouveau@lists.freedesktop.org>; Wed, 06 Oct 2021 09:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ljugr8xYdJo7W0S7wZ1H4kpTYrrrY7cxZ+QUOs2N9UQ=;
 b=oPpLXGOgZbIzAv9GXVCPSQI4F/51ID0okX/dUvM5zUxqgIGEz1z7WIV3GWUZy8bCVD
 lZkN04yL77dFqNikpwEJF8rEAhEvwsqA7NkIlJQ3OhEbfA0EWQ0+9wQUHHgENufnVnbz
 vOl66AmFRwP+3X3UDT2wENwPfkgO5x6V9sJWWoA/MUgtkiW3vRm0QSCP0voks4U5sMPD
 KsLHM2cGM9COnz8BdPQZjzosaG3QDECm0C0SEJn/M2+e6//xs0e2maoAyHpGl33cSbRz
 hQbyQzKJ5F6mduu4olunCBRYurWfDs0aJDTgjowNGS4bR76f1XNMb+eMDAenypYSz7W4
 DIEQ==
X-Gm-Message-State: AOAM533ijujylDWIuasFhzU5XMOM23k+zAsl6AXEQMuY5Sn5ZJmzKAs5
 S1QrraqV9xkQPSEmnna4YV7/XAXxR/4FrzNb+XU5ZgbD6nuu7WSLCMVH9WyCC1pLo0PD5ER3ZN4
 cn3osw3kcWo0Br4GmZ4+U6I3tjC/CXCeIBq91f2Vg8w==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr26148173wrb.11.1633537818908; 
 Wed, 06 Oct 2021 09:30:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaown5rjXY7mQV5Hye51uwbkDUn6obL2IN464EW1FNLtOpErXXEji0g/kFgw0COlTE8icr8YVIyFdXOgO8M+U=
X-Received: by 2002:adf:a48e:: with SMTP id g14mr26148135wrb.11.1633537818634; 
 Wed, 06 Oct 2021 09:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211006024018.320394-1-lyude@redhat.com>
 <20211006024018.320394-3-lyude@redhat.com>
In-Reply-To: <20211006024018.320394-3-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 6 Oct 2021 18:30:07 +0200
Message-ID: <CACO55tuMWVgsd44s1sAvgrKDHFZT2Z3F+CSqAh34_XaekYWuHA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, 
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH v3 2/5] drm/nouveau/kms/nv50-: Explicitly
 check DPCD backlights for aux enable/brightness
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

On Wed, Oct 6, 2021 at 4:41 AM Lyude Paul <lyude@redhat.com> wrote:
>
> Since we don't support hybrid AUX/PWM backlights in nouveau right now,
> let's add some explicit checks so that we don't break nouveau once we
> enable support for these backlights in other drivers.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 1cbd71abc80a..ae2f2abc8f5a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -308,7 +308,10 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>                 if (ret < 0)
>                         return ret;
>
> -               if (drm_edp_backlight_supported(edp_dpcd)) {
> +               /* TODO: Add support for hybrid PWM/DPCD panels */
> +               if (drm_edp_backlight_supported(edp_dpcd) &&
> +                   (edp_dpcd[1] & DP_EDP_BACKLIGHT_AUX_ENABLE_CAP) &&

where does the DP_EDP_BACKLIGHT_AUX_ENABLE_CAP come from? afaik
drm_edp_backlight_supported checks for
DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP and
DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP so wondering if this was
intentional or a typo

> +                   (edp_dpcd[2] & DP_EDP_BACKLIGHT_BRIGHTNESS_AUX_SET_CAP)) {
>                         NV_DEBUG(drm, "DPCD backlight controls supported on %s\n",
>                                  nv_conn->base.name);
>
> --
> 2.31.1
>

