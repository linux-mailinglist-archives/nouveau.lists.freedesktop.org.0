Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE376969D4C
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B4B10E55C;
	Tue,  3 Sep 2024 12:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YcQLtvTA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC7B10E55C
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+pVSR+7TVbjbUaLmGraYgM7q/wqENOvzyHgdTPQixk4=;
 b=YcQLtvTAaAd/11GyFze+/K/ydvCiLq6bmJ2Xz/wARHeWcWswDDhyvozDO+OjJBsgUXfogU
 buZEcp6bHnlSGBHjCSXNqMr7eFG8tliB4DvTLiob9ISbWIdXY+LHqjPfzu/e2AyWtopYOT
 aJe6W02YJPqOBL7+yOuJhlknGGWA3vA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-8EepCIzxMKuZdgyrbXxSUw-1; Tue, 03 Sep 2024 08:18:12 -0400
X-MC-Unique: 8EepCIzxMKuZdgyrbXxSUw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42c7b6358a6so25761115e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365891; x=1725970691;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+pVSR+7TVbjbUaLmGraYgM7q/wqENOvzyHgdTPQixk4=;
 b=Ns09Ji0eeiKyre/VBBWDFB2b4gkEbKAijacatE5e+DRWU2RL6CEfZcCVxwn4K7LqML
 OIshKIArd3x1nCXyOQzUJG/nxPZkviXo9uGIZ4vOLrFdfqbb+ddoFR8PRwDcBz9gqrBG
 YiUjulXl1w7Wgs+ohq6EgNCfLhTav7epJ5vvoyw/YGkSELn91iOhTqvkhJ14m9HBduf0
 WQJRll+JL0xENb/69FDa+11uv0QcfzuiZACkXRiHvTratGdKPg4U6HDDuFHBdDQ2Y1s6
 HjTPAuwWqMBPgTd/F7ApulXdzdjlVJch2u5iU874KbkEPz8/ZGWeG4QCb69r+5XUnMuU
 cXFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/DyGnEEXQyyjZGxHpDY/wxVNJIelTqCxsKytVTFJ10TzgVifOChGhwGpv18v4o7HGw4cwz++q@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw50LO3CJoOQZVKa91xGmw0/wmflA/KUZwMurTGtSEGEZHhGMlS
 INWkW7qBGGrQokF7WaK3HVFv/S36mxCu1T/7dvI7gpf6G8LSd6/XRQBYKktFAY6mbB1yALjO8tw
 VV64/qLUGIrUmLx6/dg2kpsAR3fRzToMiVxXiSiz5bEgNBCxIhXqO1haA1/2Ljjc=
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42c82f53210mr49626395e9.13.1725365891691; 
 Tue, 03 Sep 2024 05:18:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1PB5397pxPS+al287j5eSLcqH0EiAmMQ60AOH/NehoWOvOhNnHbQE2ALKLczHDDhpPV0k3A==
X-Received: by 2002:a05:600c:511d:b0:426:5ee3:728b with SMTP id
 5b1f17b1804b1-42c82f53210mr49626185e9.13.1725365891158; 
 Tue, 03 Sep 2024 05:18:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e367b3sm168493655e9.48.2024.09.03.05.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:18:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen
 <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 79/81] drm/tegra: Run DRM default client setup
In-Reply-To: <20240830084456.77630-80-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-80-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:18:10 +0200
Message-ID: <875xrdc4n1.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Rework fbdev probing to support fbdev_probe in struct drm_driver
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The tegra driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/drm.c   |  5 +-
>  drivers/gpu/drm/tegra/drm.h   | 12 +++--
>  drivers/gpu/drm/tegra/fbdev.c | 98 +++--------------------------------
>  3 files changed, 19 insertions(+), 96 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

