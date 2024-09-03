Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B5D969BBB
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EEA10E4C7;
	Tue,  3 Sep 2024 11:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bhla3hDH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC8F10E17D
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LWaiVxUDn5x4EDUb0RXQKucUIM8lh/m7gazYhUKWNcw=;
 b=bhla3hDHMY8MnruSNc8/u/w/nyr/nPa/Sm0fhEXgwrDWfoiZv47UDmYTMs2HGvdijRK78v
 XzhPFoohN1Txqtk3xft9Dh8Nl35xP8VChAafIsbD/8ONaLpEke0H7mC7bb4yc74sJWa6v/
 ulFwOUbCAmr1W36QHSqk9ygha/PKi20=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253-AzPvSxwAPLqw-9fmZGvfzQ-1; Tue, 03 Sep 2024 07:28:37 -0400
X-MC-Unique: AzPvSxwAPLqw-9fmZGvfzQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374bacd5cccso2480905f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362916; x=1725967716;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LWaiVxUDn5x4EDUb0RXQKucUIM8lh/m7gazYhUKWNcw=;
 b=FwPawM0djbu8pd315dC8LSF+a7fW/+zzbRh4PRGAcblc/suuujUcY+ST7hCz2rm2/n
 jO7vrDPwZYp4jPoxsPbybW2sM0+f+Z2FkdJlTvLlSrEQc+iOjfY1ZySWh871MgKPSShb
 RIRofxRGEAt5kNdZS5GPVyUjoY1+wSSz7PrP+96FP0BmKNsBcR9LkqoRKoArmV8i1W22
 g5n8WhHBRLIUDb4/UkqJv7ze/tdJj9uu13PexgoUSVy+7h3ig5ei0/Ee9qdl/Qi7WcYJ
 0m4DDKpOOPQBx1bPbQDQfEMRN93+iDA3bJe9ifi02EdXdlqkua5oQpbSTdygHbwg/u2O
 /m3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDxw9/Bc43OnhytJK8cGfdHpnJxNnTs8SfxieoQNomoUV7ElQX0s7a4filBZHry9j4Od7mTHLm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtG8ItFCb3pzbU96BrMm97827fYRMvULDRl/zSGHVUxXWAy7DV
 bdP6kHXj4o0kboyBTCOh/ntMKwD4SYw6lWHXj/+eW9b4pc0kcoKR5igFogCGzgPLN2mtJBovs6y
 GmmBkAMoGUk0Reyhb8dT+JiihTuQdM/j29eJkvnIXhW7jFUSPV0v/Do0wl8r+eeQ=
X-Received: by 2002:a5d:6446:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-374c2659badmr6645349f8f.21.1725362916413; 
 Tue, 03 Sep 2024 04:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOC1T6h6rVXlfVpjA/pVe7KOeoA4/WKcQU1WD4uFO7ri9zXFh51Y6FFr5rxsYl8wc+Lnpi4g==
X-Received: by 2002:a5d:6446:0:b0:368:445e:91cc with SMTP id
 ffacd0b85a97d-374c2659badmr6645326f8f.21.1725362915923; 
 Tue, 03 Sep 2024 04:28:35 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c5ba7027sm7134412f8f.19.2024.09.03.04.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:28:35 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 29/81] drm/mxsfb/lcdif: Run DRM default client setup
In-Reply-To: <20240830084456.77630-30-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-30-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:28:34 +0200
Message-ID: <878qw9f02l.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The lcdif driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

