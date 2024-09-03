Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090D969C1C
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7E010E4EF;
	Tue,  3 Sep 2024 11:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gAZVTy/P";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1358A10E4F5
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B4mDjfLV7OAnvVKb4h3wcvxirCud+mre7CyjFzqqSY0=;
 b=gAZVTy/PewzD29qSBjRySZlI6OOEPft3D6i1WF7j2P3dPY5dOOW9tvg53wDpleiZzHFRBC
 i39kYnsamhhYodsxYsDpi0B7gMTKKfnEYn6tS+Y0KLgcNs/WkXHfI5rOboTnTMzlmILVs0
 WvqrAuwG/CsYyv4Q/TKmTHUrkLtf9B8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-Ov0M6mnfOAyB7AyAfCmUMg-1; Tue, 03 Sep 2024 07:39:30 -0400
X-MC-Unique: Ov0M6mnfOAyB7AyAfCmUMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374b385b146so1955186f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363569; x=1725968369;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B4mDjfLV7OAnvVKb4h3wcvxirCud+mre7CyjFzqqSY0=;
 b=KtP2Hwsy1ty2LR56/Zt70FuyvBn5OynrMXCehoaP3BzsA7kdYgMhDAbOvg/nwZBIaL
 CZdADBe3bIynJKRC9zrFPYARaDmF5hsMRm5qloUrN9jHUrKfpCxlJvg71GAppjKsmbtd
 189XknZKoJJh+zAcUjtTxJ3TSckE5Y8R7pnhG9GKcWXDtYG/5XfdSP2LDITAaE4JZJ+l
 BC50tbzqsjdfGtKbsURdmSiY5EVF4oVxtsFR1wTIaVU3m5aQBubYl2zRQYha8kRxLCbh
 r9WSUQQfp3DWvrt/f/ffOLM64r2tQBTaPxiOsLtIMC/MnvqZnFkLut3wMX2TjZA10RHc
 fhmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBbbB3/HLx2gISbFO5P2vDQLjOljxNuaUNjshRdzzqgdK/EfvP5ihoEwJEPejvsUrXwwbslv82@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4bIrLfw6Zn1rxtqQ/V49A16EUEjoaEbMuSr0IIN49JMcl4Nfj
 wFRJ1BCGsXrj+IOGej9tjbYKHNJRGqVtzpQxy+K01VZ58RxG8U6xWRJVa7JZHzQWOcuRFuBhLwd
 VZ/1/ArSjVmj2UZXLAuhgmsiqWDEwHQuK6G+UFesPsGMEGqqqLtUwxdsPcyDIhbM=
X-Received: by 2002:a5d:6e42:0:b0:374:c56c:fbc7 with SMTP id
 ffacd0b85a97d-376dd15a895mr357670f8f.15.1725363568988; 
 Tue, 03 Sep 2024 04:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQSUDUfzSKG3LOW3MagIfuHvjKQDUVhkyVId3Miv17du6YGeJMV1X8eK/OXklKwkOqAbQaAQ==
X-Received: by 2002:a5d:6e42:0:b0:374:c56c:fbc7 with SMTP id
 ffacd0b85a97d-376dd15a895mr357651f8f.15.1725363568458; 
 Tue, 03 Sep 2024 04:39:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749eea50dasm14014489f8f.56.2024.09.03.04.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:39:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 50/81] drm/fbdev-shmem: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-51-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-51-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:39:27 +0200
Message-ID: <87le09dl00.fsf@minerva.mail-host-address-is-not-set>
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
> This change allows the common fbdev client to run on top of SHMEM-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_shmem.c | 60 ++++++++++++++++++-------------
>  include/drm/drm_fbdev_shmem.h     | 11 ++++++
>  2 files changed, 47 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_fbdev_shmem.c b/drivers/gpu/drm/drm_fbdev_shmem.c
> index 0c785007f11b..3bca333917d1 100644
> --- a/drivers/gpu/drm/drm_fbdev_shmem.c
> +++ b/drivers/gpu/drm/drm_fbdev_shmem.c
> @@ -107,6 +107,40 @@ static struct page *drm_fbdev_shmem_get_page(struct fb_info *info, unsigned long
>  
>  static int drm_fbdev_shmem_helper_fb_probe(struct drm_fb_helper *fb_helper,
>  					   struct drm_fb_helper_surface_size *sizes)
> +{

I was going to ask if this whould be static inline too but I guess is just
a transition change and will be removed by a later patch, as was the case
for the fbdev-dma setup function. So it doesn't really matter that much...

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

