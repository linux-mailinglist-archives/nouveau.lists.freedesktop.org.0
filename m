Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B6A969CEF
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892A510E535;
	Tue,  3 Sep 2024 12:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FCjn/aZb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD2710E533
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Swr4IS8dbgShAURYPvnCTpzYM2TD6Zc8Nzbs4EI076g=;
 b=FCjn/aZbq3IU6mc9taUpXCVGF6R8ylKCcKp7sl7TFF8U/nmuzrPSvOw3smnue9DVtl4Hlg
 dBh+W7umYlnx1UdwVgHEeQZJN78O/EtfIZyF25R/DTxIwkOI77iI/cNm+S56uAY/OTrnSE
 gB87w05UI7NzMjbjZJ0rQK8q7bcAjgE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-wvFrarv0OOmMAEV_ChkViA-1; Tue, 03 Sep 2024 08:07:23 -0400
X-MC-Unique: wvFrarv0OOmMAEV_ChkViA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374c960ee7aso1725248f8f.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365242; x=1725970042;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Swr4IS8dbgShAURYPvnCTpzYM2TD6Zc8Nzbs4EI076g=;
 b=H7vszUC3QapUBUtCj0usgfmE5Q54K2fv9R2h8IWpc9FD4wSNqx9HYJQCdqbvbKaCVQ
 L1P+a4K2Zq2h6eos1PAvA2kBue5xHe1d0zmF8SCnfGUiIwykioFHTUndglKl2REyJxXu
 dXBNbJGOyBgwJxcu0gkAXmieTSa84IFi7wYtHiT400hHOpD5hYEZg8wp4MzrpjkC9f59
 ZqFEiz2QckqBzvxf59mQWJq1FC2VjxiCf5FyRevG2gJo5i1tQ93SWsJVvyti4r6Dj5eq
 vioFNY7xg7/R2ONZRxSpeJnYmAwE6rvij0ZRwYrTQYs+B191scoJs1ZBQtRij7bywjxO
 Ogiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+XiSiXMaAB3BqLJSoj0vHSrhSNQy36uhI47zoIkomG0z625Oro83BXn1QTLMP19j8UW+5nI8b@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3Wp04BKgYuXRWFUtVVdLDIT2wmj60yPT4yPoMUdmnCYDncLlK
 ietpT7ABjmTA4OHnGShg71/GN1inPrkJzKyE10ZOwbE/kxlEOsoFAneCaimTIWND48C7+vZOxj3
 lM27Aw/QgZHsQO8V6gukLJ0cDd5eCiGO0l8tzWzSiZJUc+UqMvUuojoTomcnGwDU=
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr13863876f8f.12.1725365241916; 
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NHKd/OZS0qGl6rQ/cQL7X9ho+DUsYgIVLhqFSVXN311ZJ1N/JkOGUvCE3TFPMHJvuHGT6Q==
X-Received: by 2002:a05:6000:cc1:b0:366:f04d:676f with SMTP id
 ffacd0b85a97d-3749b526222mr13863856f8f.12.1725365241536; 
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c88c624f7sm27274635e9.39.2024.09.03.05.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 71/81] drm/vboxvideo: Run DRM default client setup
In-Reply-To: <20240830084456.77630-72-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-72-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:07:20 +0200
Message-ID: <87plplc553.fsf@minerva.mail-host-address-is-not-set>
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
> The vboxvideo driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/vboxvideo/vbox_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

