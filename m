Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554AB969BD3
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA4810E4D8;
	Tue,  3 Sep 2024 11:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="icA1LDHX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176810E4D8
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JsgjyVAoZiwX/0plI8r6xhrkXgx4B8n714qF3W8WxEQ=;
 b=icA1LDHXfDhJPx6egvlxbTUlYG8/aEMOoKtaMxNvlQXo/cYtbKQMNtJrE0e+oXyxoA1KxQ
 Ixw0erSmT1FjryYBnTbO1B84ey8rzjVnPVM2+b3bYNGw57v8fZSgdUuvpVv4hVrqrprKxT
 l17kEb4FDQ7IWhZMU7n3aW1ikgyBgCw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-ULLbKS6zPPqYNGsNKrc-wg-1; Tue, 03 Sep 2024 07:31:28 -0400
X-MC-Unique: ULLbKS6zPPqYNGsNKrc-wg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42c7936e564so27733785e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363087; x=1725967887;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JsgjyVAoZiwX/0plI8r6xhrkXgx4B8n714qF3W8WxEQ=;
 b=O9SH1xaf9fFEfwIQKXfXxJzBftTWssv3N0tOHxIEkRxbkqIRLKXgyHs+qg4hxsdFVL
 B0hhwrdA4VBNy1o7iEcZ+p8DuGLRm99+6HPJxtw43EUEA2j9GvUolaHlQTugYd5hbGPT
 zlnmjHqzAyok0NNs5MSwoayGD+8Wb/1GnDWc9gm4VrJIU69BLgd33+Et1e64nOO5UO7h
 uvT7MA/hS7vaqqMseXQUk3TdhvchllkMKJQiXwz1fNlB/WIjaLHNV9mjKr0IASiuqM1w
 OpkaHtPkez++N6A4qWr49dw38WsxbWNGhunz0isw/dd5DRCNjZZ2RQXhZSg35/Pp64Ez
 DILA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7/iXg2YNg8TC1QZZsVvm5zx9FFTfNcFpJwpgXgoNOvHV7T6aliOSIeiT8Z+g07eJzMZr5IKuu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgQSUise3Gt6VL3NEChgajtef8OS7ae6X3+VwQsxFGLwiKLnzi
 m2vx1u97K+WS7tLaphdXJt6knjoRbhjS/KokAoDPZ4MBjQgzTZrrAfG4o3NF2G8PgyJwYKBi1WV
 7bgBvVksPxR6tivqcb9akFpe47CdUFeXNxNUImBDbFTjp1p1nwkCH59J+aTNK/Vk=
X-Received: by 2002:a05:600c:3ca0:b0:426:5e8e:410a with SMTP id
 5b1f17b1804b1-42c8810319emr24400925e9.24.1725363086974; 
 Tue, 03 Sep 2024 04:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5maMqjeo2zbQD/i+Rl7OMnLTPEPO4OhEAVhbI0hhGbDze6A2VsY4Z4sxV6OhxoUjaVqcBwg==
X-Received: by 2002:a05:600c:3ca0:b0:426:5e8e:410a with SMTP id
 5b1f17b1804b1-42c8810319emr24400635e9.24.1725363086472; 
 Tue, 03 Sep 2024 04:31:26 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e274b6sm168609195e9.33.2024.09.03.04.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:31:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 41/81] drm/sun4i: Run DRM default client setup
In-Reply-To: <20240830084456.77630-42-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-42-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:31:25 +0200
Message-ID: <87wmjtdlde.fsf@minerva.mail-host-address-is-not-set>
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
> The sun4i driver specifies as preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> ---
>  drivers/gpu/drm/sun4i/sun4i_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

