Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C78957092
	for <lists+nouveau@lfdr.de>; Mon, 19 Aug 2024 18:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB46610E232;
	Mon, 19 Aug 2024 16:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZOeDxYeG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E038E10E207
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2024 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6aiAlEMlkVSgDq4kg8Uhoyt8PHhKwhvjGwHD+aR8CT0=;
 b=ZOeDxYeG6gr8BfdrJbbwyomlt/qTDDfqljxql+zF7fAwPe2x6qVTLDGCCfKG843dU61l1a
 g+mM1qCnqpWFWpTIj1m2KEtkAANLGJeArqI8SzkHyiO55jFu9lhDkAsQmnKLkeQPqg9W0f
 JG3x9Nsr+n6JZh1YVDNjQA8C2lY2Ii4=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-5lpaLSSYN3qRI_NvLH3LMw-1; Mon, 19 Aug 2024 12:40:34 -0400
X-MC-Unique: 5lpaLSSYN3qRI_NvLH3LMw-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2d1da888717so4612956a91.2
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2024 09:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085634; x=1724690434;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aiAlEMlkVSgDq4kg8Uhoyt8PHhKwhvjGwHD+aR8CT0=;
 b=N+32xq0j+nxEFbmUi8FHq5zsP8OIuIY+lPqruK3PfwwWrvKr1UZUA32DxxVF9Vd5kW
 OsxYt+KrRUQ9pySvJwukgsrtU2eSq91l0VhVLe4/wjXBBsMT1IC/tg94omEsxKn2m9Oq
 pKyDZileKKm+Z2wMhK03Uk9RWpXEJV21KQuZAKxF+keLVwNeMjH8Nx3NLJknoJD1P5Xw
 FQPDVZmPnytOZXu+yQGtxRhmP4N0dITcZzvQir5KxVTyBrBROdtR+Gsngqe68bTC064X
 ZRJySMYNYzij1nCRiiz/my/ErzB8B1HRUeJoEYbdBteyUhK+gjev0fmZK+eKtFalHVTE
 VD9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU4KPtFRTwM3er23o0CGyIFFOF8eMLOKGZDjxB3vxvt2fjrULN0wer9TSXgAoWDH9mh3CbdBYaPOMN+M3k84FGFLYQn3xmOOXLbzUmqw==
X-Gm-Message-State: AOJu0YwmIHt5SzXn69G8o9kNXeVaE4Shj/hB3b/djeXfItzPvlZNgUp4
 nnXH9aRaO3yLFe3OoCUOSOalv3YHXV0KWQoYzV2ffx3HUlbfewQpcw9o1tSEzA/qaVYtf6VbKVo
 EnLeONxOHyLYdat1jKW9XVoBka6z2uB7VPyvpDntCj6tqfVYHGujRktiyWx6LlCA=
X-Received: by 2002:a17:90a:bb86:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d4063e87e6mr8810668a91.31.1724085633793; 
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGr6UwLRtlBXjaOWivmxZxfUPO4m8tw0lWZ8JSfXwSkB6KBvIXRvb1qTy/OQw15401HlQn4nw==
X-Received: by 2002:a17:90a:bb86:b0:2ca:8a93:a40b with SMTP id
 98e67ed59e1d1-2d4063e87e6mr8810646a91.31.1724085633478; 
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d427efec73sm3604053a91.48.2024.08.19.09.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:40:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 57/86] drm/ofdrm: Use DRM default client setup
In-Reply-To: <20240816125408.310253-58-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-58-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:40:27 +0200
Message-ID: <87o75oa2kk.fsf@minerva.mail-host-address-is-not-set>
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

Hello Thomas,

> Call drm_client_setup() to run the kernel's default client setup
> for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/tiny/ofdrm.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

