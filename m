Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01949969BC5
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:30:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928BB10E4CC;
	Tue,  3 Sep 2024 11:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LrfAxgyU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332A610E4D0
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dxxrRERlM1KKjx6cIQxxpxez8ndiAEATgkodVQZqsO4=;
 b=LrfAxgyUyYSs/nEWox5tt+0+4RFjdnIpZ80ijy88O9lqfZz3i+qBe679tIk/ngEmjleCC3
 QIv/7/t4EckQR7KiDsHZMASeff+xJGeskqHdnqbgqUofcsB82EnYlD/mbF8AMBniOqSZYv
 MmpfLfNmNCiYgpbqecPrRAV/z5rFErg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-N0hknQArMcCrF6DrV8XO5w-1; Tue, 03 Sep 2024 07:30:07 -0400
X-MC-Unique: N0hknQArMcCrF6DrV8XO5w-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42c881282cfso9396395e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:30:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363006; x=1725967806;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dxxrRERlM1KKjx6cIQxxpxez8ndiAEATgkodVQZqsO4=;
 b=vv0HD0eCRWuBGeG2ihH7QIzIPtslX28Hm1gB8GqmdJFQELvaSS7bE3BWsi07N/pUoQ
 5AuE96qOSkXJUOzFRLyxiLFScpuL22CXWiqce5bAOwvr1463iqfjguXcSbZozqX9xtld
 C8YaAanX7ei8AIGnWxYaOMSDnl38lcN1zpiLmo2EaKa3Ok8QeaI5AO4ZuLyDiPwOVTCi
 xUJnaZSRiarfaBJHj6zcjJ0fgxWyR1vKPjgzu01yAge0RwvJxRPwIog7P31ReVhoECkY
 qNCJn61/k5ek7rDJPTaaQpI43R3twoTpzP9Zp+9byzl1q9t0p1awg5s2FfE4+w/ZgSFH
 yWMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtbMnc0Qvv0KVA/xh1t1Io20bCy5NuNMbvpWt/rt0jJndyqjBM0vd8FV5dkFX6Bk6+uoIqcltW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGFbxu+acD3DowSLoaBkXLcY0swwMZmoKBiEdNOtslC7qNfVv5
 XdtwMvMzfJEK4vsC4C6aVsH+YKYUoK3mUbbkGqAZLWUCSyuUWEakOUUw/YWKu7a47FtvmPzuGG7
 6bO2s6p031KNVxnVYrdvzRbdXZTXPBuriLL06txiWmQWipGb0GQ1JIgJnaf1g3rM=
X-Received: by 2002:a05:600c:3c90:b0:428:1a48:d5cf with SMTP id
 5b1f17b1804b1-42c8de798b4mr4038975e9.9.1725363006019; 
 Tue, 03 Sep 2024 04:30:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdvAYpzgdPZsIwkrEWFvZvdn75hpa0fqZPHsIu48fvr3XJmd4Ap7A23CN95pFqKYIWUbhWWg==
X-Received: by 2002:a05:600c:3c90:b0:428:1a48:d5cf with SMTP id
 5b1f17b1804b1-42c8de798b4mr4038695e9.9.1725363005569; 
 Tue, 03 Sep 2024 04:30:05 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e27c70sm168136785e9.35.2024.09.03.04.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:30:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 33/81] drm/pl111: Run DRM default client setup
In-Reply-To: <20240830084456.77630-34-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-34-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:30:03 +0200
Message-ID: <8734mhf004.fsf@minerva.mail-host-address-is-not-set>
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

> Call drm_client_setup_with_color_mode() to run the kernel's default
> client setup for DRM. Set fbdev_probe in struct drm_driver, so that
> the client setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/pl111/pl111_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

