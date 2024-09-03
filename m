Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B6969CB8
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FADD10E506;
	Tue,  3 Sep 2024 12:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ccmQBuhC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517DD10E50A
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725364904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HnbFxSgYkBRN5Q+wqX95+Hyx0YeccZ2urpdeGG0ywWk=;
 b=ccmQBuhCYbLdJJFysmmWUw7OWGowgrzCeyv0NaJDtP9pB5mf+xbDZFKU2im6fGptlug41K
 75Wg8iaubvlf4Lf5srlS/KhY0QqBweywXNaUh21MT/1ttdUS28ae0p75YDVPG6Nlrfnb01
 fxTdy1gdeYMzYvZuUVTvJCi0P57V02s=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-kUms48t5PI-7olqe8O0X8Q-1; Tue, 03 Sep 2024 08:01:43 -0400
X-MC-Unique: kUms48t5PI-7olqe8O0X8Q-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-5334aba4422so4348114e87.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:01:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725364902; x=1725969702;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HnbFxSgYkBRN5Q+wqX95+Hyx0YeccZ2urpdeGG0ywWk=;
 b=l5uU/ILAwY5HpRCbwlFXNPABpolyhytxR8hpMcKwTuSbf7rKsFubBJmhzGPxN0EOHN
 Cq+xwYa0FbIXDGskDzUs1Vo/JUtsZRp9X6dpcaXBtoBCfRB7YrXSgaQMiemSa4p61KJ2
 2phc9Ho8V5amM9kR9qpsu4WIArW8QU4uae2Qn2ILAI79J5VfqL0PPxUzk7h4GwFKjayO
 FRtdSOsoJ7loZBEYK3uyJCYGVoDduYuViQI/3EMv79hARNBM2MqEQV7r4TkUZ0gIbXjC
 3T5I7OwHoN9Bljvs5hYx7WJKTOdx3GTd9FvGTFqgodNYC67zSsUd1yXOsBFS0W1RVeHG
 gk/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj3BzeLJU/uU4/7XM37uXNGsxY7FJ7PGo040DochK2OK5fUiTB6IfS3VXgh8ZAC/GYCAJlp8Z9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI0FQ2uGU821Laiw7nn+nPsXmYWBu9dmdiGVtpL6TiykJHJv7K
 r/q4fVwcZpqP1dfVnbHaDVAM8J0HslxLG6G9CLOHnA6X/woORG2RU3SwDMX/gpLgTPBh697LeJD
 je/cm0dLM8LZoyVB8rTLuJP9hD4mP7r/hYbNDkWh5+x2VNdpASOciiqTfX+T/T8o=
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr10669821e87.44.1725364901771; 
 Tue, 03 Sep 2024 05:01:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDjxWGjvuovR8Aopi451WacRBX2Wf/wOeUhWBSbhzIhjLIYAAi1Vp+ANICqYmaRYGmnJV2vg==
X-Received: by 2002:a05:6512:280c:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-53546b92af7mr10669769e87.44.1725364901129; 
 Tue, 03 Sep 2024 05:01:41 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb2dcsm169907915e9.1.2024.09.03.05.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:01:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v3 60/81] drm/udl: Run DRM default client setup
In-Reply-To: <20240830084456.77630-61-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-61-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:01:40 +0200
Message-ID: <87cylldjyz.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

