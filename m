Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B2969D45
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:17:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5416410E55B;
	Tue,  3 Sep 2024 12:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YpycK3IN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CF910E55B
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=agFMB1xAtcWm4AXKS6Y4zMlSOya0yRuTuGxykObZEjk=;
 b=YpycK3INP1FvrNCAA7tn96JdEF9pazAD+6gNCzloZVW+BuwHZuk3WQGbyvTSO4chYLnMRY
 wpBFe8gs8nhuesTQjNfulRz41/lAac3sMmgA6miSbH+/pTf39uvzTjhrD4XgVT/fkaNyXw
 /vzar8LkVS7m9eq8CqbWSfv8JQtOwuM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-163-Bginw-QzO4GDcbaqcmvPHg-1; Tue, 03 Sep 2024 08:16:56 -0400
X-MC-Unique: Bginw-QzO4GDcbaqcmvPHg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42bb6d3cd05so48519795e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365815; x=1725970615;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=agFMB1xAtcWm4AXKS6Y4zMlSOya0yRuTuGxykObZEjk=;
 b=he2lsBEdzZXzN/Y0dQ/r4F51hns/1b3tl6uz11sEVI7eAmIjcIQchyt3NXUaGwSwwU
 Yv/KocVkf7ibO6R2vlUoZu/T2Fpf8aj/mK7d7v5WYjp2OxbGbScwP9W0IhCMvKrneACx
 tMVgWdaykiJrT2FQohJ7jtct2gJJ1PqffvIwlX4SePr5Wx7NqhCPOCOIJtROppXTBBFp
 4sDmsKYESNl1BZeRc+Cu3vdedC3gxc9ljttBz+ZfY2HjHSj99loUq+X1aj0zoGs1eJ+K
 geTk3QzCPD3gVauTa4TY3PZuTnsRLM4KokwFXXbWInSGgikR0s43ul5uJ6bTbECIwIjQ
 1jGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWML0RsykJudgvuzwKvBP+Eb1tbZKca/4WMkagWvUx6tBaniMqxQ0t8CXW3d2nyjk5bZ6LfwuwY@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxAbTKU8Ei/vzM22RaTSq3dAi8xv4P7spmlok0kMI1TUzRZNCSo
 V3zGi6XksTPRTRgUzLHD5V7OeUo9GyrbSskQQegTR0WFb6QN7mcr1nRGTdCPd+oFYJihRYEyWQl
 5fTS/GzVONuX96lrTmUwdKyRYRJhgQinNwwYXBgWmeqSBzmju/UVA13yDRu9kJVk=
X-Received: by 2002:a05:600c:310a:b0:42b:ac55:b327 with SMTP id
 5b1f17b1804b1-42c880efb88mr26637175e9.12.1725365815299; 
 Tue, 03 Sep 2024 05:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4j1HQbJZ4tQ+5HUrU1wf3ZhSaYNsES3j6jps+inrau18KybLARTHZrpwsf2i8vLhskKlqcQ==
X-Received: by 2002:a05:600c:310a:b0:42b:ac55:b327 with SMTP id
 5b1f17b1804b1-42c880efb88mr26637005e9.12.1725365814792; 
 Tue, 03 Sep 2024 05:16:54 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df100csm168841155e9.20.2024.09.03.05.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:16:54 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 77/81] drm/msm: Run DRM default client setup
In-Reply-To: <20240830084456.77630-78-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-78-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:16:53 +0200
Message-ID: <878qw9c4p6.fsf@minerva.mail-host-address-is-not-set>
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
> and remove the old fb_probe callback. Provide an initializer macro
> for struct drm_driver that sets the callback according to the kernel
> configuration.
>
> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> The msm driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c   |   4 +-
>  drivers/gpu/drm/msm/msm_drv.h   |  13 ++-
>  drivers/gpu/drm/msm/msm_fbdev.c | 144 ++++++--------------------------
>  3 files changed, 38 insertions(+), 123 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

