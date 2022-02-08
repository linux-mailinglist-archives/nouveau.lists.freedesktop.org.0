Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 706C84AD83F
	for <lists+nouveau@lfdr.de>; Tue,  8 Feb 2022 13:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A687F10E5D1;
	Tue,  8 Feb 2022 12:22:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568FF10E51A
 for <nouveau@lists.freedesktop.org>; Tue,  8 Feb 2022 12:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644322930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mt0hncQ/RRm0riihXr626lJBH3pbgbYhHyz5dtgoOAs=;
 b=h/biWEzIboYQxj/i4m7E8LLf3Ca9ZqJkRlBdThiKTIyBKHNXOsrkXnCYk6YXJ6oDK0UY/a
 DJplQvm0gaxC/mZJh9qm1UqqB65RHFPUdDHc9YN+o+Mjy229yblj2S13pOcANLDKQgDhyk
 x1AM+Eujvr2NaEmHAIs+zRPODwc37mA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-n1rxoiKHNuybL5ZqFRDi-Q-1; Tue, 08 Feb 2022 07:22:09 -0500
X-MC-Unique: n1rxoiKHNuybL5ZqFRDi-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 m3-20020a7bcb83000000b0034f75d92f27so465855wmi.2
 for <nouveau@lists.freedesktop.org>; Tue, 08 Feb 2022 04:22:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mt0hncQ/RRm0riihXr626lJBH3pbgbYhHyz5dtgoOAs=;
 b=0/CvOPv7GF3o9nyoC+aPC06MdZuE8fk84CARUxMazvnL9kOhGZv8koFU0M7KS7+XBN
 ZES/IBUNNlVtSMB0tOqUqLVa6LYPN3U65EnRiSOzoz/+EIDdZjSLHBdsnw9jtywMuLkm
 5tOIQvnknB06lfoXT80QepP+Hob/MeZFjZ1YRnpIqeSoOjOEVH4O7ML+ukkyITZPVXeX
 LGPlLS0xhFOQthnyNfE2xIUCmndNbmfLGNjF3veMaS82xkbVzes2ays8tXVLk8srDQLU
 JuFbOlRvzFE7Agp9jlRsyrGu6bGfHSu2U93tXg1dim/s8YaE5iv0O6ZVGR3jMAg1bgpr
 kcfg==
X-Gm-Message-State: AOAM532ONfKR+cQqOIV5T3Omwh9zG6qX67YpI+tJ5o97dEcnfO+yRDCf
 aQAHLtkLYD85w8K4qDwu6+ynqNimMi8+jq1Mc+hWdYpHTb/XBDw/v3MszoMBibvp3rhEbcVWXMv
 3k3aTP75RqJJ1YQ75XR0CSe7cCBNHGUz8BEnyGQPkow==
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr938360wmi.74.1644322928221;
 Tue, 08 Feb 2022 04:22:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw05S2FM4hb+eMcua2vq2VzpKE6qzOqTT3pzSCAKpcyucQY5qglNO8kSljUgpASBmw4liJar8UCAeaCMl7/oQ0=
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr938337wmi.74.1644322927980;
 Tue, 08 Feb 2022 04:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20220204193319.451119-1-lyude@redhat.com>
In-Reply-To: <20220204193319.451119-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 8 Feb 2022 13:21:57 +0100
Message-ID: <CACO55tv1yFYeboJsdV9sg1KWqWhs3WfJVmHuBKjAV6FUi6BLSA@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/backlight: Just set all backlight
 types as RAW
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Feb 4, 2022 at 8:33 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Currently we can get a warning on systems with eDP backlights like so:
>
>   nv_backlight: invalid backlight type
>   WARNING: CPU: 4 PID: 454 at drivers/video/backlight/backlight.c:420
>     backlight_device_register+0x226/0x250
>
> This happens as a result of us not filling out props.type for the eDP
> backlight, even though we do it for all other backlight types.
>
> Since nothing in our driver uses anything but BACKLIGHT_RAW, let's take the
> props\.type assignments out of the codepaths for individual backlight types
> and just set it unconditionally to prevent this from happening again.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index 6af12dc99d7f..daf9f87477ba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -101,7 +101,6 @@ nv40_backlight_init(struct nouveau_encoder *encoder,
>         if (!(nvif_rd32(device, NV40_PMC_BACKLIGHT) & NV40_PMC_BACKLIGHT_MASK))
>                 return -ENODEV;
>
> -       props->type = BACKLIGHT_RAW;
>         props->max_brightness = 31;
>         *ops = &nv40_bl_ops;
>         return 0;
> @@ -343,7 +342,6 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>         else
>                 *ops = &nva3_bl_ops;
>
> -       props->type = BACKLIGHT_RAW;
>         props->max_brightness = 100;
>
>         return 0;
> @@ -411,6 +409,7 @@ nouveau_backlight_init(struct drm_connector *connector)
>                 goto fail_alloc;
>         }
>
> +       props.type = BACKLIGHT_RAW;
>         bl->dev = backlight_device_register(backlight_name, connector->kdev,
>                                             nv_encoder, ops, &props);
>         if (IS_ERR(bl->dev)) {
> --
> 2.34.1
>

