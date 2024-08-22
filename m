Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C8995ADB6
	for <lists+nouveau@lfdr.de>; Thu, 22 Aug 2024 08:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 540C410E764;
	Thu, 22 Aug 2024 06:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TQEuDsWQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0C910E760
 for <nouveau@lists.freedesktop.org>; Thu, 22 Aug 2024 06:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724308744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=opGg6/BWhtL5WACV1y1lk17vbvidiAf6fU2jwHA8Plc=;
 b=TQEuDsWQ/lmz1Go+MSMm9ce9YfjW9/2EK5Jpl2XD2hb7I7crd9igUgbaWFPuMkSffgctRz
 wttA9MMTTVkpz4lvVkpiw6N/eQRghw9zOdO8ChO0gsEwQTPIPl4EwBpH5/qJcrSXXCGXp9
 Pt8SgXcOMJjCENO3miUPRygG7UVc49Q=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-wyyaR-vsNUmYYU4oef0Nkg-1; Thu, 22 Aug 2024 02:39:02 -0400
X-MC-Unique: wyyaR-vsNUmYYU4oef0Nkg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-428207daff2so3192865e9.0
 for <nouveau@lists.freedesktop.org>; Wed, 21 Aug 2024 23:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724308741; x=1724913541;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opGg6/BWhtL5WACV1y1lk17vbvidiAf6fU2jwHA8Plc=;
 b=ScDoz+0rUq9cMTNja1NHIAz/yrNiV87nZNSzyxwND8sR50+sNiRZeNQMoNm9J8vzdC
 EweVvs2CmbWDL8g1mMwVM6X6X8nUlmgkCFv+IaKHLcoTf5kDzYNIS+5fcD13bVACKo/z
 PULWjAN+YEEX24HFnYS6CJ567iFaXFiyh14z4cYwjxpKVU8dRM4cqdzfPCfCyn4Nqp8t
 yF0eI2ePopGHaBxgSujY3yp2TRddGUG58yWR3KfcZrasMBk0mEeWs1WVC12WW/dtS26S
 fGSV1jfK1j6TBhk4JQrLnLMlA8Ynlg73dv9b2eHVXhIf7Yyfs/IZKS7zfEzkH9OkNB69
 2lSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7JScGrOODdcRpJ35yvOVqpz+GXrbIdcf/zhFtGQZKl7s/3FIdxTe5SHu464OYjEMwc20RajlV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxy46RLuvRmkLhS6FKKW5xHVIde0v0axEYxGpLPgpNLzBBfs51z
 xyiUm9Yrew1ePuycyzHGSjrM5GtQXPtvt+OBtfuPRtct7l9SZGlbfa63qaZdwCvTrLIJdFCAg91
 KTrjs08jE1i1MZZsemUTgzNOg4CB+P9BrpShe02gCJAy78y5QdXa2737gJENBW88=
X-Received: by 2002:a05:600c:4445:b0:426:629f:1556 with SMTP id
 5b1f17b1804b1-42ac564e997mr5432155e9.31.1724308740903; 
 Wed, 21 Aug 2024 23:39:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNSJ+B67xvaGtjlYSDRu+Bj+yxQk9e7g47HD9d837R1mmSh16JUoPKQQQ2x1Jtyx01W4ZulA==
X-Received: by 2002:a05:600c:4445:b0:426:629f:1556 with SMTP id
 5b1f17b1804b1-42ac564e997mr5431995e9.31.1724308740507; 
 Wed, 21 Aug 2024 23:39:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42abed8b8b9sm48526185e9.9.2024.08.21.23.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 23:39:00 -0700 (PDT)
Message-ID: <0b93ac2d-b1dd-4ad4-91a0-0f3c49365190@redhat.com>
Date: Thu, 22 Aug 2024 08:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 56/86] drm/mgag200: Run DRM default client setup
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-57-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240821130348.73038-57-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 21/08/2024 14:59, Thomas Zimmermann wrote:
> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.

Thanks for this whole series.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> v2:
> - use drm_client_setup_with_fourcc()
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>   drivers/gpu/drm/drm_client_setup.c    | 2 +-
>   drivers/gpu/drm/mgag200/mgag200_drv.c | 5 ++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_setup.c b/drivers/gpu/drm/drm_client_setup.c
> index c8ca5afaa47a..5373a892f097 100644
> --- a/drivers/gpu/drm/drm_client_setup.c
> +++ b/drivers/gpu/drm/drm_client_setup.c
> @@ -64,6 +64,6 @@ void drm_client_setup_with_color_mode(struct drm_device *dev, unsigned int color
>   {
>   	u32 fourcc = drm_driver_color_mode_format(dev, color_mode);
>   
> -	drm_client_setup_with_fourcc(dev, fmt);
> +	drm_client_setup_with_fourcc(dev, fourcc);
>   }
>   EXPORT_SYMBOL(drm_client_setup_with_color_mode);
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 6623ee4e3277..29087e2398df 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -11,9 +11,11 @@
>   
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>   #include <drm/drm_drv.h>
>   #include <drm/drm_fbdev_shmem.h>
>   #include <drm/drm_file.h>
> +#include <drm/drm_fourcc.h>
>   #include <drm/drm_ioctl.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_module.h>
> @@ -129,6 +131,7 @@ static const struct drm_driver mgag200_driver = {
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
>   	DRM_GEM_SHMEM_DRIVER_OPS,
> +	DRM_FBDEV_SHMEM_DRIVER_OPS,
>   };
>   
>   /*
> @@ -314,7 +317,7 @@ mgag200_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>   	 * FIXME: A 24-bit color depth does not work with 24 bpp on
>   	 * G200ER. Force 32 bpp.
>   	 */
> -	drm_fbdev_shmem_setup(dev, 32);
> +	drm_client_setup_with_fourcc(dev, DRM_FORMAT_XRGB8888);
>   
>   	return 0;
>   }

