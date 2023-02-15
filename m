Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91670698872
	for <lists+nouveau@lfdr.de>; Thu, 16 Feb 2023 00:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3466B10E30A;
	Wed, 15 Feb 2023 23:01:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F7A10E30A
 for <nouveau@lists.freedesktop.org>; Wed, 15 Feb 2023 23:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676502094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqVitRGjYBX8GSzEkilO7B7lFiZnfb8r4eRKt2Vhqk0=;
 b=fYfqtpMxJevMU/cbTTwbOxM96QwVsbF994+WpSqzHc8m0nRl73cBaCRDMNmzH+7OAefdgk
 AT/cEgUxNm9nsEH5XVf5nQDz7MLYIPhnsVUhnMdmzCit2f/jZnqjrU6YCUUvr0nEDv6sOZ
 0FlDB/jLmXXrK2sz7m0lwEJXzKF8aUo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-91fEioxSOomOV2_Y7Pbtgw-1; Wed, 15 Feb 2023 18:01:32 -0500
X-MC-Unique: 91fEioxSOomOV2_Y7Pbtgw-1
Received: by mail-qt1-f200.google.com with SMTP id
 t5-20020a05622a180500b003b9c03cd525so171320qtc.20
 for <nouveau@lists.freedesktop.org>; Wed, 15 Feb 2023 15:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsYrZzYMtnpPy1dLr5xbLMKSM/UlrfB6vQQZ4rqlNLU=;
 b=f2sBspTNeAyW35rC/gkThkzuAE0o25hUmFUF4VIpu4BHH5tAZv+mhHmgule2RhONH5
 ONFf37pTB8Z1pagtFod5KP3Ae9prcwIzPeb8WztpjclgUvs7V297B86s1B2IPP7ixeLC
 3gW4VoF9L6QMFjXkYTPTRX2zTL3LjtFOe0GGCb1Hj9HE8GhpMhmuKCzZ/ZzPwRTFYa9Q
 MM3ePU6WWXtc3rWNfzGZH6DWaWbtPEUfKnpbIx9TeqbuyEv9yQ5KCgDCzkdamQjpH2eH
 TGvRUhg0xePh8jefHnm1d2xwP98bJ0EjvQ/LAH+W9Ztu2jcm5DR3AkW0qXZvHukZKlWE
 DImg==
X-Gm-Message-State: AO0yUKUDQw1/+FTeDE/FOEhLoHzFF+wo8TneomDI1563aPl26aJw0FTJ
 rK2zGCy9IeB0EA0WS8L3QDCvIA5d9upoI038i2PH/kVKRLVV+fDFQzThqRd9sqHX7C6njXebmAe
 tEQYUANiZy7RyFSybAIQFcFWZlg==
X-Received: by 2002:ac8:7f16:0:b0:3b9:b422:4d5b with SMTP id
 f22-20020ac87f16000000b003b9b4224d5bmr6282648qtk.26.1676502092427; 
 Wed, 15 Feb 2023 15:01:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+qnHViHFdBUIjxUI6M3KrFKZ6NirVS+Cp47Y7N9ahccvHsZrp34JkpSRGEGSaqRlksgX+0TA==
X-Received: by 2002:ac8:7f16:0:b0:3b9:b422:4d5b with SMTP id
 f22-20020ac87f16000000b003b9b4224d5bmr6282620qtk.26.1676502092198; 
 Wed, 15 Feb 2023 15:01:32 -0800 (PST)
Received: from ?IPv6:2600:4040:5c68:6800::feb? ([2600:4040:5c68:6800::feb])
 by smtp.gmail.com with ESMTPSA id
 o190-20020a375ac7000000b0073b45004754sm6662405qkb.34.2023.02.15.15.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 15:01:31 -0800 (PST)
Message-ID: <d676862c180af8c5325fb00f0e2e469e6f600835.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Feb 2023 18:01:30 -0500
In-Reply-To: <20230215-power_supply-leds-nouveau-v1-1-ea93bfa0ba7e@weissschuh.net>
References: <20230215-power_supply-leds-nouveau-v1-1-ea93bfa0ba7e@weissschuh.net>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/led: explicitly include
 linux/leds.h
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Wed, 2023-02-15 at 01:04 +0000, Thomas Wei=C3=9Fschuh wrote:
> Instead of relying on an accidental, transitive inclusion of linux/leds.h
> use it directly.
>=20
> Also drop the forware definition of struct led_classdev that is now
> provided by linux/leds.h.
>=20
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/gpu/drm/nouveau/nouveau_led.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_led.h b/drivers/gpu/drm/nouv=
eau/nouveau_led.h
> index 21a5775028cc..bc9bc7208da3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_led.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_led.h
> @@ -27,7 +27,7 @@
> =20
>  #include "nouveau_drv.h"
> =20
> -struct led_classdev;
> +#include <linux/leds.h>
> =20
>  struct nouveau_led {
>  =09struct drm_device *dev;
>=20
> ---
> base-commit: e1c04510f521e853019afeca2a5991a5ef8d6a5b
> change-id: 20230215-power_supply-leds-nouveau-ff4995ba0794
>=20
> Best regards,

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

