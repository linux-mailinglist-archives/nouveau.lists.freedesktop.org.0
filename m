Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EF2969D3A
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE3F10E544;
	Tue,  3 Sep 2024 12:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CcxDh/q3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A26C10E559
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NAq91MHu1YedLn3F02fhYw1UruzCX/irseYvT1RQybQ=;
 b=CcxDh/q3IFF5Gz3TrdoajCHKXXY/uvvEVLAZ+DdKEbjQFuI7OjssAytCRlb2teM3juE9zQ
 W6pidiaSIck4GcRBivkbCocABS9hSeneAwYM7RbRp6GZ2Cdo+VAHohbHL/I+nRGvhkz0ZK
 8YWyT9bniBichuaTcyZdx7gnlROEq3I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-ZKo9OyDrPnqaxC27J-oFUg-1; Tue, 03 Sep 2024 08:15:44 -0400
X-MC-Unique: ZKo9OyDrPnqaxC27J-oFUg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37496a7daf2so3554281f8f.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365743; x=1725970543;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NAq91MHu1YedLn3F02fhYw1UruzCX/irseYvT1RQybQ=;
 b=Uzknw7y6l+YAN5a6Xr/UNS+iOdiBTArGgfHU1IPxUcso8N1xw/T6p8FMWRunv/KsHz
 yE3TY/MNIL4M1ReKR39NbJLM+TcKklCVxdwOce0qnk15lX/Lcds0ypUbU85XZ869K9pz
 kRzgQje7jEN1/BU/6JqKP9Wq/3Hl9qsm2ukWhlmlT4vbZ2OmeZ42ppwILW1NugCJqxal
 IN56xdCiE96XK+rmM9pf7/BF4b0FGNh1b/ttUs7j3n50qcdnUfjbjiynh0Nz+X/RuQIL
 QehTmOAUXznaV0azZVPdwd68cb2FDIYncXsG9pjxe1TiLdevTYCYepGMt7vzYNSiddCd
 1GvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEPXS2AEfli/O58ZwmyTd8LivtkGBRq+UTsTy4JsiksmUasTmy0wLABE/hREPeZ9ol9SrEY1Dx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvnxoOzrWk/cSUMDDEvRZUvHbBzYm7n5hxARe2+sP+rngViyTG
 wAHrt5JFwaN5fw98hDiFY0AHWiWMycXpMVYyTDNikAWP5oVB7ArQgOlv9EJr2npXtIQqxRipsC9
 N8X1LABspBhtGCkjFRCJ6bNKyaWkcaf0VNHebTq3k/rSWnj/4BMsbpuvjoIqoFWY=
X-Received: by 2002:adf:fa51:0:b0:374:c1a9:b97b with SMTP id
 ffacd0b85a97d-376dcc8b8e5mr467031f8f.8.1725365742990; 
 Tue, 03 Sep 2024 05:15:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrOxGUesKlUZWk0uC4i7YVs6JItUFj0a5y2fMikJdW7sd9iJpSVoWROtdMbdcImV5AXcDIYQ==
X-Received: by 2002:adf:fa51:0:b0:374:c1a9:b97b with SMTP id
 ffacd0b85a97d-376dcc8b8e5mr466725f8f.8.1725365742564; 
 Tue, 03 Sep 2024 05:15:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b6a3d27fsm11081760f8f.59.2024.09.03.05.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:15:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH v3 76/81] drm/gma500: Run DRM default client setup
In-Reply-To: <20240830084456.77630-77-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-77-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:15:41 +0200
Message-ID: <87bk15c4r6.fsf@minerva.mail-host-address-is-not-set>
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
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>  drivers/gpu/drm/gma500/fbdev.c   | 100 +++----------------------------
>  drivers/gpu/drm/gma500/psb_drv.c |   4 +-
>  drivers/gpu/drm/gma500/psb_drv.h |  12 +++-
>  3 files changed, 19 insertions(+), 97 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

