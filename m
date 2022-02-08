Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768D44AD83E
	for <lists+nouveau@lfdr.de>; Tue,  8 Feb 2022 13:21:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC710E38E;
	Tue,  8 Feb 2022 12:21:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD66110E38E
 for <nouveau@lists.freedesktop.org>; Tue,  8 Feb 2022 12:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644322898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Mdb5Ebivxr6jzHOzSN/tIiK6XfSCOdpNYf9wIWORf4=;
 b=HUNlfGU3yBltsWdais2WIAjeQeAMeB/hHok/1Dd4acEZMpfPl/1IS9PtzoT855WgKTFNyB
 kXSpdjC8qMmoEGKlI00BlzGqQmMagBHth8yet3uE6NUX7gJfYUbD7bjpWSDTkNQ/F2WQQT
 qYJbI6WOZekmN59tmsLw6++GT+t0dQE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-ifbpXNHVMT6MAgKLCNKeOw-1; Tue, 08 Feb 2022 07:21:32 -0500
X-MC-Unique: ifbpXNHVMT6MAgKLCNKeOw-1
Received: by mail-wm1-f71.google.com with SMTP id
 l20-20020a05600c1d1400b0035153bf34c3so980021wms.2
 for <nouveau@lists.freedesktop.org>; Tue, 08 Feb 2022 04:21:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Mdb5Ebivxr6jzHOzSN/tIiK6XfSCOdpNYf9wIWORf4=;
 b=1NqSPv12zR1KPHT4gaj7qdk2z7SnDbzxwVAM4CoOLYSvIj2kkhi3/5P2mJIee/2VIP
 Cnw1xOIlqZNCnLtD/Q7eFVHeErbGGT0FJvWoZgbiibQtrH+Y/0YgYBcWBraLKQYzYfdg
 +8/Jn9AO4zWAynQmCSCCdCUxpdu28xk3erI6rGxAiavq735y+GhYratOnqv24DHRzqX1
 88DVk8G7RbYkVk2yKyInwV3NKTwb0TdpYK3qIgbjG6gGKztK/DFimaZme1TmkwWnTTOn
 wqrX6PgIOZhFwz6dNwIMW55G+dAd2+hP12khHTvzSkDA0jKzWp3cCpxsGDqVpO6waQ7x
 zNPw==
X-Gm-Message-State: AOAM530YIbHauk+Sj/xzZMoV9wBzAY1Dso8CLC1G0ZWDYgFb6lg4ymjc
 YwrTAfmj7s4OfinNy/sxYe9C32fhlGByy1FFDjKrR+s+cNFfKvo7pUbJcC/Fvxwu/Ioa1zqznVu
 +HE1Azs1DdyqtN9IEDFYapQ2RlYwSrCf2u47FBzRunA==
X-Received: by 2002:adf:e281:: with SMTP id v1mr3333552wri.308.1644322890911; 
 Tue, 08 Feb 2022 04:21:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLlALWJQvkTxajX4mY5wFPC0i9Cbyibc6vh+dA8xRid1wKDVpfMqtwnuSqGnDZsRaAsQEg1IKxzDseghgHQVU=
X-Received: by 2002:adf:e281:: with SMTP id v1mr3333537wri.308.1644322890725; 
 Tue, 08 Feb 2022 04:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20220204180504.328999-1-lyude@redhat.com>
In-Reply-To: <20220204180504.328999-1-lyude@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 8 Feb 2022 13:21:12 +0100
Message-ID: <CACO55ttjtNW9Gx6pJegGD+r37j53Do+jc5xoyTFf8aXaBt5y-g@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau/backlight: Fix LVDS backlight
 detection on some laptops
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

On Fri, Feb 4, 2022 at 7:05 PM Lyude Paul <lyude@redhat.com> wrote:
>
> It seems that some laptops will report having both an eDP and LVDS
> connector, even though only the LVDS connector is actually hooked up. This
> can lead to issues with backlight registration if the eDP connector ends up
> getting registered before the LVDS connector, as the backlight device will
> then be registered to the eDP connector instead of the LVDS connector.
>
> So, fix this by only registering the backlight on connectors that are
> reported as being connected.
>

I think the patch might risk breaking muxed systems where we have two
GPUs, but.. the systems I know of have different ways of controlling
the backlight anyway. So unless there is something I missed this is

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> Bugzilla: https://gitlab.freedesktop.org/drm/nouveau/-/issues/137
> Cc: <stable@vger.kernel.org> # v5.15+
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index ae2f2abc8f5a..6af12dc99d7f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -294,7 +294,8 @@ nv50_backlight_init(struct nouveau_backlight *bl,
>         struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
>         struct nvif_object *device = &drm->client.device.object;
>
> -       if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)))
> +       if (!nvif_rd32(device, NV50_PDISP_SOR_PWM_CTL(ffs(nv_encoder->dcb->or) - 1)) ||
> +           nv_conn->base.status != connector_status_connected)
>                 return -ENODEV;
>
>         if (nv_conn->type == DCB_CONNECTOR_eDP) {
> --
> 2.34.1
>

