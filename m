Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED67957095
	for <lists+nouveau@lfdr.de>; Mon, 19 Aug 2024 18:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CEE10E206;
	Mon, 19 Aug 2024 16:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jEsy7iOi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A89110E252
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2024 16:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sQyHttrBtLhi/oG6jgxpPMBUYcZOG59jM7Kv+K2onC4=;
 b=jEsy7iOios3uP4aXUb3H9I+9YAS+S4rKrykxysqDp7FSaTBf553vFgLSd+lug6cbaH/5NV
 qjldjLo4U3Eoz+yn2iAf7neXCs9FKQmAHmOkvpsmEotdB9Fbga0tXf3m7d6XQ1nE/ZySTP
 kn+t6B7C1LPaeK41yH69hACVP5CIHyQ=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-fwRPT9FSN2ObsBbwG13Izg-1; Mon, 19 Aug 2024 12:41:12 -0400
X-MC-Unique: fwRPT9FSN2ObsBbwG13Izg-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-70d14709555so3491898b3a.2
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2024 09:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085672; x=1724690472;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQyHttrBtLhi/oG6jgxpPMBUYcZOG59jM7Kv+K2onC4=;
 b=YiA3JeS9vBNYhuUZYzCm7eBSBDcmMLG2XZbzuIAtlArc9+i8OcqEXGzSy4uiW/fbdj
 hkrQu8Ac9DVIFDtElAH44dObumJWNEz46K/8T8sAZBX7pDyr2II+Tde8KixTAJZjMkSz
 TAxUCrsnfp6JxsJ81kFAl0Q/IgXktsQ5TIhGD3Mm4MaBXR/CJwWfiAuTDGjAlZEYDh7T
 PeGYX+X5bFNTUkhjmVPPZdkxGC9zH8Z1FabqAABVzrnI2peA1iGwVv869zNgPoBsP55y
 nwsG0jjsUBy0FDee2OzO2QdK9EBZL6bkbe+dP7IDtrVKKxXAHZ6JGW/Qgc30TVWmUou5
 BH2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSkNB81US4ZzdHTn9aIBajsPsI8fKRLGtKg7ZkGLIo7lVd93Fq4WKhNhi/oDHYuwU/6/VGIliyR/DQP3zJJ5puvl5KLSr2/T4T6f7AVw==
X-Gm-Message-State: AOJu0Ywa9R4d/i7f0L4iJAJaQHWJJ9FYfrzWu4gplFF/lsnfwegNwI/t
 ZF6bG6YNXhNvGGAaf4rjBBOaWrYgdnEOewSks225iFlC561GQG4j9qskKanyAO8nIqNazksuKAA
 HMSJOU0OwwwbfO8kQvym1qMFGiItpjzGt0oYeu+lY6XI8jDtpjwNhJSiTPo2kD5k=
X-Received: by 2002:a05:6a21:3944:b0:1c4:ce43:7dd1 with SMTP id
 adf61e73a8af0-1c904f90c9dmr11465769637.20.1724085671797; 
 Mon, 19 Aug 2024 09:41:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWbLTAHBQpebC83mbq0CLnlglkWZHDsgxNbLZIw6fOMIdWWrAP8SjyYuTq6n8R0zn4nWNw7g==
X-Received: by 2002:a05:6a21:3944:b0:1c4:ce43:7dd1 with SMTP id
 adf61e73a8af0-1c904f90c9dmr11465743637.20.1724085671437; 
 Mon, 19 Aug 2024 09:41:11 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7127addcc5fsm6777501b3a.9.2024.08.19.09.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:41:11 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 58/86] drm/simpledrm: Run DRM default client setup
In-Reply-To: <20240816125408.310253-59-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-59-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:41:08 +0200
Message-ID: <87le0sa2jf.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/simpledrm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

