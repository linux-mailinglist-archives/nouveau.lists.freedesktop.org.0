Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66789969B97
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ED010E4A8;
	Tue,  3 Sep 2024 11:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EU5DbxSE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B732B10E4A8
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a0gkkLunGIQ2kaDQMdtHzMdkTGKuWZFk1+nOKDyR4as=;
 b=EU5DbxSE13IkHye0LE2JOchyXp4nrD4PHLCceRPoteKdx9fY1lgfbk1IeLrtCY9q/so+mp
 UAS56IOzZtfxrnzq7UtmgVstubL1JuTW3Yk1KbD3EpSvNu7Vk9Otd8rc6nadbYEaQCgbtH
 N/h5lka0T1AcVm6Um9Nul6cqyQLuYMA=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-fGRigi_WOFOwvgmDBW-Qmw-1; Tue, 03 Sep 2024 07:24:44 -0400
X-MC-Unique: fGRigi_WOFOwvgmDBW-Qmw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-53350003ef9so6359142e87.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362683; x=1725967483;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0gkkLunGIQ2kaDQMdtHzMdkTGKuWZFk1+nOKDyR4as=;
 b=tFcluBjJ3Ce8z7e2/vd3F/QnNCbtKpUbweUJSLTMtb70vgDbJaaMaXPxOZ80BFuCc8
 5zf3bGbMHkAXAUXZyb6S6MbXib1A591ujSROx6WKw+x/DiPYiZMdVi4NbiZY1dvEUS5Z
 b5udp0hLvD/EtYwE9q39KA84yjJE99Dmb+4L5HMwc7ug39k91t99gAVPu8UZzE5OHuy7
 4dhm0D5HRf3+t77fUaAZplQxXyhTKtutK96XOiXlS6hRP55GvOlcgmlqGmohp/kWRzKn
 ztaJKP7kuGPk9f0+XXN9HMBITMhT+bmaqGmZcAjvoq4Prf05sjL2xZ7tfGVFbqLilKiW
 MTKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbieQyRmSbkgrjrt4ccCz9hh9aJB3mb3WP3E9xs9kahMf2kwjT9S6vnqxxXaIGtp46o5GQjiox@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgz8P8yZMgEmPgPgW2UkRYFIAtqrUuB1OCsv4a782jWycfvV0w
 URx5pu7WXRTm+TZAAETJscL72Ozc5cp8PLAy6mncCaonOx88T33zSXJN0oCT6tSsYYcJiTPkGvk
 q362WGJiiqGa0GghohfOGZX3s7gfX+tTnxdAhK8ceB4IFer9q90bexcJ5KnST5WI=
X-Received: by 2002:a05:6512:3b99:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-53546b167famr9189241e87.7.1725362683186; 
 Tue, 03 Sep 2024 04:24:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV4RoPHMRrjPOqT1ox2wOnC/TMkJttXZQfXhIXmK0ZwIW9dx/0UkvKvAIAwP3zEiWjbdgR2g==
X-Received: by 2002:a05:6512:3b99:b0:535:3ca5:daa with SMTP id
 2adb3069b0e04-53546b167famr9189216e87.7.1725362682612; 
 Tue, 03 Sep 2024 04:24:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9d54f98sm10542803f8f.69.2024.09.03.04.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:24:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 19/81] drm/imx/dcss: Run DRM default client setup
In-Reply-To: <20240830084456.77630-20-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-20-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:24:41 +0200
Message-ID: <87r0a1f092.fsf@minerva.mail-host-address-is-not-set>
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
> The dcss driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-kms.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

