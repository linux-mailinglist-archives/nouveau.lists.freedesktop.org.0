Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95799969BCB
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213EC10E4D5;
	Tue,  3 Sep 2024 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hU/UiXTF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AEE10E4D5
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+7KjPkZaY6LPM2R/IvEHcw05+p3Okl3omvvBGG6T0MA=;
 b=hU/UiXTFoUOV/r3VTLKJxeVWdEhiWyBjsVYpsjBVhHg7uAgXEVtXMAYMzZfFwSsu4qeJ9Z
 lFFOMWZVGRutRZyzTTTXmCal7s9ruq9m5cpI7GRWOg/wAO7ejHHEIycUWGOMIgZ801C3Gi
 jn7v5E/J2PamqT0z2pqbnf/4l/w7xbs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-ruvPVvxcN_iy8Db_uzx4jg-1; Tue, 03 Sep 2024 07:30:43 -0400
X-MC-Unique: ruvPVvxcN_iy8Db_uzx4jg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bb5950d1aso59173845e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363042; x=1725967842;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+7KjPkZaY6LPM2R/IvEHcw05+p3Okl3omvvBGG6T0MA=;
 b=NuU2W3ehoGBlE+dm6U3r2fClMFZeguGaDH/a20nbc/2Wo7XceLatVQQAtK4QyHtEiW
 DIKJwoUwPYmn7ZFG486El4q4geCNfIuGDG1CwYRqTLdSCG3SiE9qn9N0HoFg0t6O2jpQ
 Way1+ENyUeqrnta6XybZ21T6ptv26OAtm0//ZeqTkVX+xBrGPiSyVipTkp4rx6+5B25C
 dMCZwhdq6YBCbgGmYJfNM1578bwNX9Cg6zjwo0m9AoEgvxo0rtgE3yXG0j7Ss2VUKurr
 mVoXnmzfA8Jp0A/Aguf3T4oojeasERngVLSck1FOzEuDioqSYrC28LO3owUuhO8IaeSJ
 A4vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkp9T7SPzB8N5VcOgLLWOAIyqQ+bDWg0bZel568+86qwoAIsLpzDsHGsAyXo92P0jLkPAuIrc5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCWZMLRKSRLNuj+69ZoPyF4S+7/xLFTqJ09TlNQWuGD0PNowVe
 Vvon2bk7e6m7gufmYuJxmoQHF9DtEjvm4xV/n7Ay4wCIyNncO/tpsIgnlSiVb74RxBr6qyS0L0k
 STW2nDz05JLNNTeQN0xiMgaTBJPmHW/ksk8fJmg+6f6QYwudukzh+2qdLU8SZido=
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr4142331f8f.20.1725363041820; 
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaxU5bJuIzUDf8RSjazoPcbW/KJpDG6+5g7d7j21W0xhBI7SOXf/r+/zCa6XdnhnO6fGnIQQ==
X-Received: by 2002:a5d:4fc4:0:b0:374:cafe:c55f with SMTP id
 ffacd0b85a97d-374cafec737mr4142303f8f.20.1725363041396; 
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4d391sm14089852f8f.3.2024.09.03.04.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:30:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v3 39/81] drm/sti: Run DRM default client setup
In-Reply-To: <20240830084456.77630-40-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-40-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:30:40 +0200
Message-ID: <87zfopdlen.fsf@minerva.mail-host-address-is-not-set>
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
> The sti driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/gpu/drm/sti/sti_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

