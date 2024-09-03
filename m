Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FD0969B4C
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D19610E3AD;
	Tue,  3 Sep 2024 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ICINzkNi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8E510E3AD
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pdYvLK+Rh99QxPTllaFff6lfcZBjKvVWEKqFob5Jn+U=;
 b=ICINzkNiW3tIch9htWeUWBs06HvjfqsQIb5iNImkxmhZDB9W/z6lQAP5zMiBQlGuQt1fpW
 yrqS1YOOeOHgW7Cl6tAwXK16NGFWqG7mOky4SQ27QESmlOVqTdNmrnWFBV4Oj1DBj0B0/P
 9Mas5sXk67FuKGiYNrMP6xyXiN54tWs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-K8YpyxcsPRmHn9oCRUlLOw-1; Tue, 03 Sep 2024 07:14:08 -0400
X-MC-Unique: K8YpyxcsPRmHn9oCRUlLOw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c9b0daf3so1280814f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362047; x=1725966847;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pdYvLK+Rh99QxPTllaFff6lfcZBjKvVWEKqFob5Jn+U=;
 b=veS6i7ORwI09kGixm9NogZyrrLBYdOOaw9ntVfeMuZDE67EAhPqX7sORUwhhGsL3jd
 kDJQVy9IHhp8YdDgH5bfngzLr2Y42SRiUg44tY5nWBBprLdHqb2J6arSy04CIWTv5iFm
 wY5YN9KF/Qk0ohO5GrCqE2+prOdpUARqXqBXK6GEPvhD6fcVovNgFT2EkI8kede7NByX
 OmPtL7QA/hPUVVQb7n5H0ng7VmZKdlV8volBm+B6RKRkxtQituQzIuny8MpYNwKKsu/k
 Ne04evJD9Afs5R21aJPDKemvOTp7WTi3Ixnuiv7L6O0DD9VZ5Sr6zv87YQ6oTG8kU0a5
 luuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsWsz17Dddjq/1FIHHXDIMs3buF9gJpkm7In8gi9rWaYkWjNYNkyBrIV9zOw587xZGfXVpW1pC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxs7bgmvtcElDyqheJ8ItUeIIwH0SEQrcECroMjYHTf0EXKdHWZ
 DaVmKmJBibf0U9l7T0bDF6fIqYGTtwX5iMLR05j6ZV6dT+9pbkMEQoBTHV0dWOOHwtxjnJaiS2m
 BFmdqAuf7s8Q5icidykz0YUb0AO0Ex+ZqjqK8PxAcAm2MOrr5uBpj2EQXoI5SirA=
X-Received: by 2002:adf:9bde:0:b0:374:bd05:a074 with SMTP id
 ffacd0b85a97d-374bd05a0cemr5699410f8f.12.1725362046746; 
 Tue, 03 Sep 2024 04:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH58B10Y+zMIj05Ntjvj4TsORZDmCGRgoqT96GpUgWHC5vVRBWe2bAZAxHLAeIC6rm49Wp7yQ==
X-Received: by 2002:adf:9bde:0:b0:374:bd05:a074 with SMTP id
 ffacd0b85a97d-374bd05a0cemr5699378f8f.12.1725362046152; 
 Tue, 03 Sep 2024 04:14:06 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c90c6c06sm6188692f8f.84.2024.09.03.04.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:14:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v3 10/81] drm/aspeed: Run DRM default client setup
In-Reply-To: <20240830084456.77630-11-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-11-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:14:04 +0200
Message-ID: <87bk15gfb7.fsf@minerva.mail-host-address-is-not-set>
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
> The aspeed driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> v3:
> - add DRM_FBDEV_DMA_DRIVER_OPS macro
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

