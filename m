Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 493BE969B34
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C37410E08E;
	Tue,  3 Sep 2024 11:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jv1iQGsD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051E710E44F
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725361739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KNCsJ15HkUgltOPMm708gH3cAto2XwAuJxZwET5MHs=;
 b=Jv1iQGsDscG4vY8v3IFxvipGXQOyKUxFNWFIKt/GK4B+KQgs/WCoMPZuTgYrEWCnNbKI7j
 tO7q4BYEnp4KtyTmRrrNUF6ve6V2vC8T4eyFHZ4vtg7uNW3Uv9nkcZXw5rJPfSA8NlxMi4
 GYb58T03oEvyJhaNW9uNTaNJYP75cNE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-ybK1ABeQO1GSox50zg02wA-1; Tue, 03 Sep 2024 07:08:58 -0400
X-MC-Unique: ybK1ABeQO1GSox50zg02wA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42c7b6358a6so25209495e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725361737; x=1725966537;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5KNCsJ15HkUgltOPMm708gH3cAto2XwAuJxZwET5MHs=;
 b=wAB3W9HnypzerYmXF5JWmY0620CmV4665KVmt8aaeKfwnsm/Z13vrEHr8I4aM84fZZ
 VYgwDJP1q4szZIWsuRR/MOGiZJ+Z/YMr3QPH99+W/BGGvT7I7MrZDlY+PhJfB/jEx6/X
 hH2U/N+o/eNN+hxk3SNUUZdwn/Tu5hI9cJzRZ43JbuLqFLogyPbDnPd7bsicwoG930GM
 SkSSsjmlH2KSZo9eUDqlIqKJhhIqucmh1PKpIis5NxZQM8lFu1eLLpSxcoEingokTzpJ
 dhtdUCJsauZsMuPuHC/F369VEs7SclBCx/aF0ASDVh1Swt75U3TaxjTF5EvsRLgiWP3p
 T8fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWsLXPnswPSTnNiQnvcgxDufsEgE8j7iP87vyPqkei1JUKmc5yIB/IG7smgSSiLsBUP2dy2LC3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzrhnPBsZ/egfr25ib9m87BGZeshj1dQA+uYi84gff0qDutWImC
 5LJiBRwJRW+5OmgWAvBmpZtR3KCeLwpRzXwb0TRiQeL9hRNeDA3Ll96b7cJsqOCQkMOKU1BcZGH
 x9C9K3LADX6bfgs+aqLJhzyen4TbvWMJFQ3xZReHGC3//eter9pg0bwzs9DXccnI=
X-Received: by 2002:a05:600c:6592:b0:426:61ef:ec36 with SMTP id
 5b1f17b1804b1-42c82f13bb8mr49158865e9.0.1725361736883; 
 Tue, 03 Sep 2024 04:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/LIzZrmcj69ybDsKA77dubjSmW4Tpk5zW1Gf9bYbxoUzrG0GhAgYYbYf75Z9LDiQ3xPDERQ==
X-Received: by 2002:a05:600c:6592:b0:426:61ef:ec36 with SMTP id
 5b1f17b1804b1-42c82f13bb8mr49158605e9.0.1725361736297; 
 Tue, 03 Sep 2024 04:08:56 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbc36bd88sm139398275e9.24.2024.09.03.04.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:08:56 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 05/81] drm/fbdev-dma: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-6-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-6-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:08:55 +0200
Message-ID: <87h6axgfjs.fsf@minerva.mail-host-address-is-not-set>
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
> and reimplement the old fb_probe callback on top of it. Provide an
> initializer macro for struct drm_driver that sets the callback
> according to the kernel configuration.
>
> This change allows the common fbdev client to run on top of DMA-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 60 ++++++++++++++++++++-------------
>  include/drm/drm_fbdev_dma.h     | 12 +++++++
>  2 files changed, 48 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
> index 7ef5a48c8029..aeccf7f7a522 100644
> --- a/drivers/gpu/drm/drm_fbdev_dma.c
> +++ b/drivers/gpu/drm/drm_fbdev_dma.c
> @@ -86,6 +86,40 @@ static const struct fb_ops drm_fbdev_dma_fb_ops = {
>  
>  static int drm_fbdev_dma_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  					 struct drm_fb_helper_surface_size *sizes)
> +{

static inline for this wrapper maybe ?

> +	return drm_fbdev_dma_driver_fbdev_probe(fb_helper, sizes);
> +}
> +

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

