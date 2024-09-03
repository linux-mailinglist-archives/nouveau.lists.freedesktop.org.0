Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE5969CBC
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFAD10E507;
	Tue,  3 Sep 2024 12:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LcdAxe8L";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B7D10E508
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pKK2QQnQ+cfp5Bkofc8ATvqaWrX2Xfp7Uc2gYkHJUw4=;
 b=LcdAxe8LyFRMiJGQL1qldW8kFvAS3T51Ao0D2P9gp5gBmoahYCteZK7niXpMZe2HURUh+8
 D1f8Y/CkVqPXrkNK406oGeUKtauXF2/EtuLhyRnIITaDoyI7jULiKABUtJWVFVibXHCloI
 ZY4xIiABFk/YLqrGZbRKOEpN4z2zrO0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-aACgf7uaMdKsaj-fsPoA9Q-1; Tue, 03 Sep 2024 08:02:12 -0400
X-MC-Unique: aACgf7uaMdKsaj-fsPoA9Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bb9fa67c5so2221945e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364932; x=1725969732;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pKK2QQnQ+cfp5Bkofc8ATvqaWrX2Xfp7Uc2gYkHJUw4=;
 b=olZqamuRzpWuilF4wG042j6Ct7uOFlczl+UVgT38oKeDqd+LO2Z6zZVDZXLJ6jtaY2
 OEi4GHpJQ47TSW/B/6sCbOaxi17NzsYhbWTvwjUAvtlzCNvPu9oe3EY/oxC2Z4yPHHz7
 ozlYLSOaugB4WFVjhuCs+w1r8XnhP03pw/MSmVVIA1b0iEnaqOB2+NzhGFbYLjEUGhIJ
 c/hYcVIn+vz72WKZJR9jMoAqHRd+s6J9s1YKh9KHJh/9cq6glNWrwu03kpridv5fceBv
 fjT7harFprc4xVgXnHUwFOiOUxiTMO2HJtOKHJzgfVSjPO2Aoy5MtwdnzFgQKC3IZK61
 q7zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLMHLzUrwei3E2uemFCLd30qCXmYqLSuMkj9dO1UvjOGSrM5dOc3UTYSmjp6I03XmrlLrms+Lw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkUPWMVJYOaCz7gc8edtIFQk79mxZLpL/jn1XPY8+h0/tdHxYj
 Yq83pU0577KEc20QG1ic5XHUMfThRqaKhr3yqkpSbeoD7t+cWD/gBoINy7QQ65yLop8DoZFMgVf
 L+W6HUsY5K0auxhSCzXQLewgJuo2Cs1l3Wh3yHjUeQNs0G0Dq38pmd0K/GzXqS3A=
X-Received: by 2002:a05:600c:1548:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-42bb01bfbfemr122465065e9.17.1725364931541; 
 Tue, 03 Sep 2024 05:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEU1f5pEh1/LWdcdNFaDJqTeBylHrSHEG8GX+8Ch9n4e6ZFe+eJQZXbxWE8WbPHjx9DxpA5KA==
X-Received: by 2002:a05:600c:1548:b0:426:6876:83bb with SMTP id
 5b1f17b1804b1-42bb01bfbfemr122464655e9.17.1725364931030; 
 Tue, 03 Sep 2024 05:02:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df9705sm168596475e9.27.2024.09.03.05.02.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:02:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>
Subject: Re: [PATCH v3 61/81] drm/virtgpu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-62-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-62-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:02:09 +0200
Message-ID: <87a5gpdjy6.fsf@minerva.mail-host-address-is-not-set>
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
> The virtgpu driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

