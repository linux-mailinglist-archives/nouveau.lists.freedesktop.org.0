Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCF6969B7C
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AADE10E499;
	Tue,  3 Sep 2024 11:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e4qM8i0/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BAB10E49B
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQTpGzPFQqB5gAShloE0zxFF7qqYRFvzMaH5N3OQkCs=;
 b=e4qM8i0/QDug9VCPJoIelXDgZF6XSvw9+/4VAy+1SjUN7NAyuH0yjXzVz+lanhWO2qo7WL
 uQPMPV+/YCMcFCib3IcsrOqflPQMZpBN/fPdW2M1zdQbUPc3y1Nl81ySZV5wsVnZBTU2X/
 mcV+1tz+D/lmQuoIQMuGW+zplNeVJNQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-CBrA_9sYPkS_UAmZK6t-cA-1; Tue, 03 Sep 2024 07:21:19 -0400
X-MC-Unique: CBrA_9sYPkS_UAmZK6t-cA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3730b54347cso3197562f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:21:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362478; x=1725967278;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQTpGzPFQqB5gAShloE0zxFF7qqYRFvzMaH5N3OQkCs=;
 b=ODry99e1V4fcDj7A1EAW+h17EvidFewl+ZS7psZlA6C3wS0nk+1EMUuCe1JesA+ii8
 szKLlzgyKJ0COefw+Nkz1eig+PAHYJmhVOHzH9CYNUkk5pGkg7wHTJxs7VzeM/mjuGMI
 m+2ExoecJFf2+dNH5bEzouFN4ZbMVcOh8oovZAQrAb2Ogx+cevbBl0guvKbPuYu3SxDI
 tP9U9i5WpMRdk1W0HfH8R6spnRa0K8QjpVyAiBhBDIofVq0OXs1EtGTCmOFngxNV2gXc
 T8GWpVjV27Pnm1zg0WMLY6IEr7OOQA2p2cDD/6TTFWxZO5Sew0R52xljXnIBEDeGIZNk
 Ir9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD04vzSJGt6Ju6OBqanluEPCVyHyktLKjr6RVTQKcAzH3yfI29+MCRgrZhERjxxeSfftJgrGBA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybBI48zW3bX5rKsqU9/qkoFXKeXDJHxwko6O5/lZfQQbgUsMqo
 6wnrmBs+JUKcquKd4bOah0No2Wa5znjTYgd9/+2jKiXZUFmMOUVJ+BuDesNTQDeZ/MxkkZxt3ug
 qRA9rxLZL7GdbJTDaTvqhBPSw/GCQZlgJYZEJsEL1yYZR3TWasc2pJmy7adnci1Yf0YJME4k=
X-Received: by 2002:adf:a30c:0:b0:374:baf1:41cb with SMTP id
 ffacd0b85a97d-374ecc67bacmr2268364f8f.4.1725362478472; 
 Tue, 03 Sep 2024 04:21:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbXnmNinNKcxIoQZ/xbsrsLu5CSXkPJ8NSjds5BWMTJG6QY5z6avZlP02srMBnOR8Wv7uPgg==
X-Received: by 2002:adf:a30c:0:b0:374:baf1:41cb with SMTP id
 ffacd0b85a97d-374ecc67bacmr2268340f8f.4.1725362478084; 
 Tue, 03 Sep 2024 04:21:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374be2edf08sm9391463f8f.6.2024.09.03.04.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:21:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 15/81] drm/ili9163: Run DRM default client setup
In-Reply-To: <20240830084456.77630-16-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-16-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:21:17 +0200
Message-ID: <87zfopf0eq.fsf@minerva.mail-host-address-is-not-set>
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
>  drivers/gpu/drm/tiny/ili9163.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

