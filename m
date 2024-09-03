Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4681969D00
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9BB10E53F;
	Tue,  3 Sep 2024 12:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NS0YJHda";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A29810E548
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+2kjQIs9q8n/JYo2kgRLarbQBGYwxsIauUZqYrHGHRk=;
 b=NS0YJHda/zAyc1SNkmxjiR01RErm6em7FpfR6eUneZngZtXCYwUqKjImlsgvgB3gaYNQ73
 raJErb/2ij/tybK5xkmJb43MDxde9zLU3yoMZoUW6Fp/1ILACmFeIGLIWA29WHTsYIpNyl
 6eoY1HLYp5yTzf7OIyVhLuJmBQbHLRM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-KDOHM349Nw66Hlg-TxPtPQ-1; Tue, 03 Sep 2024 08:08:31 -0400
X-MC-Unique: KDOHM349Nw66Hlg-TxPtPQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb6f7e7adso48839425e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365310; x=1725970110;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+2kjQIs9q8n/JYo2kgRLarbQBGYwxsIauUZqYrHGHRk=;
 b=c9IEg5Fi/fvwqo+bvvZXarJ1f2topTTJpGOlDgCO+iGpbf1MgH7HOupVFUywypfd2e
 2dFerLCXeoWaU25gEmD2tIB6cIv5hAyL/osAZqHLReAA7nY/YmfKtKStz3FalfElOdTf
 XdoKXQ2+MHEEJHYFOwaRYoCYH149809AZMWVanWanu+lpN2HJTfTjzLlYPNF8FAn2E78
 ZcLHHntiUtvz8cENDnNqPwfnEqwXdeqT8ERyHt6OCSNEfxARxIdjLa+R4gRC4qaclY+e
 iuNjB5jrVJYntzPU9fcXEtbZFxmw/npNfACXTfjEnEk/AbHeTiin22AkmzWkk6GrTie7
 dL4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGfzyf6rQufhgpEkSek7kVoVNHaeQ06XiJyYepsE5bwFXx1pPZSR75YSEOEW6urUIBrO9hL6ZO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVIFGvv8evgNhwRpa1OfgIBAPfwtcsWOKZTa193Kc36fMkTsQT
 uvAFekwZ/XArGyTBh0yrEEBB8GMgyqDA+AZUl+/UZxc1FAzL0bqcj5o9cPYZXNYilHymS/xLIY5
 kB14d+SfiLPWmhzT5wz7KNhgTWMER5bPPKQWQ+aNUCGopmf5pchLdR0jOoPiCJK8=
X-Received: by 2002:a05:6000:1201:b0:374:b399:ad6e with SMTP id
 ffacd0b85a97d-374bf17d7eemr6675597f8f.35.1725365310216; 
 Tue, 03 Sep 2024 05:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHACC0i5llQBZQ7GHMHlMA55f2d++yOjIWrXMsMueQKdfzTBOjaiAt72tflYDm2X5ITcqKKvw==
X-Received: by 2002:a05:6000:1201:b0:374:b399:ad6e with SMTP id
 ffacd0b85a97d-374bf17d7eemr6675573f8f.35.1725365309653; 
 Tue, 03 Sep 2024 05:08:29 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b9859486sm10862586f8f.111.2024.09.03.05.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:08:29 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 73/81] drm/fbdev-ttm: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-74-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-74-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:08:28 +0200
Message-ID: <87jzftc537.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_ttm_setup() is unused. Remove it and
> its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_ttm.c | 119 --------------------------------
>  include/drm/drm_fbdev_ttm.h     |   6 --
>  2 files changed, 125 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

