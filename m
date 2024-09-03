Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BAC969CE5
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 746B110E52A;
	Tue,  3 Sep 2024 12:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Rx3T54+l";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8797510E52A
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bKH42MPBYmGRwEigr3d5s600iIva9uiUrOTp/Gc7qDw=;
 b=Rx3T54+lHUkqk/yocrmVZl4ElddWnpg1ws27Ew7vxtQBZbkhrnrOe8gy8vtmhm/n+b8w3M
 /1+2UxBPKhq0XoIkXGPzv9a2WeIXE8ouJeB+kbBxv+U9hXj3ROOHZDm6Y24uvKzGKU53HJ
 RwLVi0NfBv9xhnLuH+Zm/7J6Ez2Zoxo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-kRZDE0cUN6mJwKDta66NEQ-1; Tue, 03 Sep 2024 08:06:35 -0400
X-MC-Unique: kRZDE0cUN6mJwKDta66NEQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a86f0c0af53so453275466b.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365194; x=1725969994;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bKH42MPBYmGRwEigr3d5s600iIva9uiUrOTp/Gc7qDw=;
 b=uANJO5w17G9nK8uZIRJRBqRkH5NK/U5f5yZ3kpOY9ttW9QhhRBK5Wsr+dpLa/3YSdc
 yG4K/BZiX12uylEJzxesV8dCeqKkQiALMA2CyPro6e3y310NihixI5AJk6WqkCd1m/BW
 NdJlq40r1FdADK9mdMaTIS7u9q62nAQ5KoEBLHhaQutAXyXBpSOhSMOy/Gik105iVNc6
 carHMy13vE4NKGQXvmVrHPRevSFAcVXUGm+7UjLtwR17izoXDJWCFbwmNtwGLwn2R1jq
 bt7LDgyPS3GYqu3wd0tTaPOljaNos9IWiZ1oqlKPJRhZpRcKCRDO65jsHOTitK4FI1Yb
 3kCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURiJXYNxJOq/e1XnMMuSB2r+ZkzkUhAzGkLnKP3Uu3vRKK1/U+M2N64y1iuhX58ieAfNuNZFGT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRPlxiWNYFMd2mONAUeAONQ9OZTgU2H42qtLY8yyYh6fGk2h3E
 VKL0ehYDNnAw3wGct2h3wwNDLMx3pDQ7OrH+1bcm6figQdGfKWcXwtjrDUPX162WKKVt0CT4luD
 5Bp5vAuZrBxyv0zHG1kEP0hp/HcbcpJRInOA11Lm0PriKzXDxmIm/Gy20SqUbjPQ=
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a897f83a33bmr1262520766b.23.1725365193652; 
 Tue, 03 Sep 2024 05:06:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKoeIshuDSdtf/JGgIl6tnQAFAZn+DDFBpQM9QN52xxGXt/DVTGdF5osqSdNpaEvBaP2lGVw==
X-Received: by 2002:a17:907:980d:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a897f83a33bmr1262519066b.23.1725365193131; 
 Tue, 03 Sep 2024 05:06:33 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f0acsm674520966b.73.2024.09.03.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:06:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, John
 Stultz <jstultz@google.com>
Subject: Re: [PATCH v3 67/81] drm/hisilicon/hibmc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-68-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-68-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:32 +0200
Message-ID: <87v7zdc56f.fsf@minerva.mail-host-address-is-not-set>
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
> The hibmc driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> ---
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

