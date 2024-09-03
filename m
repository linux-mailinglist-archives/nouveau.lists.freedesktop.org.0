Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D600969B71
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6305F10E494;
	Tue,  3 Sep 2024 11:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RWlDFUbw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5B210E495
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=H24uYoqbfGl2vUBYr+//xmtelWdObhpGCRj8ekWugog=;
 b=RWlDFUbwKfQJ4D+WMECz9OTP+Ws0jfTGI0uUmRNQdv5Qu7/KDKiOZc52P3egwBA1VJRN8f
 Q4JTtW26ivCT+kHJN0sjo72geXAKIb4FOVtYZh0S+U+8DJmNih7UmrpAULYJ5lLlzUN/uV
 COv/xZ4Ub3SMOq47RlAg/hpk8kEsLBg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-wvUGTMMRPzOe-Dtjw96dIw-1; Tue, 03 Sep 2024 07:20:33 -0400
X-MC-Unique: wvUGTMMRPzOe-Dtjw96dIw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374bacd5cccso2476489f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362432; x=1725967232;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H24uYoqbfGl2vUBYr+//xmtelWdObhpGCRj8ekWugog=;
 b=iFzR/urjXfQueYgq8hhBgBojyHzaPVA+QSrsy1H6+MLYmghwVGvxOGx92guQ220Wgb
 FjzbvZ5vo6yd2dfgLBQnVAA5AdvyDnOvHh046X7k4vbZM7FdL8twJIcrBjfEXI9TBGDN
 PrsMHe1XpGrElM+RwQmdRVQSijFzbVkdkgxcGOKbgg/B7oIQmPWXDc5enCRBDRVh7bQv
 WHf5ihAB5AVUYiQ79xdSPbxtMPcWPtZikhW5fwY6PiESr8VmPL9BtvPw+h8+Amr0h+h9
 wb0mgvHm+zn6RbZ3kc6rVOfgRqg//MRi5hu5rdUJcZ81nbp/LvkF5tK8mKdmkdfoBpI4
 fzkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP2cYgANtCmJtr932lgClcMCXSJagb7UF56Nwb3yZqzTJNJ3qsJDjPFnxWqOrzF/sc4rK9cJkF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfvXhGNpZIhyc3UWBSEl+r7ULwdrVUTv8DUeRHUZ7VsbglE849
 95Rh38MMhtKZ9yYZdn1BXcrumToIPHWpw2pEAfFQZqgneJi+gbNz9Y/j5MmTGOuwMIuzjM3/NyZ
 F2lczFDKFkAyQM/kiGH1IqIbArnu+E4dq2Y8VEaGU5Jxp0gLRyejHLxIogQ51aDU=
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr6548898f8f.11.1725362432187; 
 Tue, 03 Sep 2024 04:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwpteDh/jYV60lwH9EfcQ38ojTrOG4EYTUpYCdQn17HGXGrVhhlQh31XG3MTmZZx8V6M3Sw==
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr6548866f8f.11.1725362431651; 
 Tue, 03 Sep 2024 04:20:31 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27364sm166897175e9.34.2024.09.03.04.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:20:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 14/81] drm/hx8357d: Run DRM default client setup
In-Reply-To: <20240830084456.77630-15-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-15-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:20:30 +0200
Message-ID: <8734mhgf0h.fsf@minerva.mail-host-address-is-not-set>
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/tiny/hx8357d.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

