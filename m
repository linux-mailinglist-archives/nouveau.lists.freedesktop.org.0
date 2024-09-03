Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80C6969CED
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6911B10E531;
	Tue,  3 Sep 2024 12:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BiVwh+Sc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2763C10E51F
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zx4hxQtRMdOzrygXNdwQEDskzaynxlUA2aQcUcONdUA=;
 b=BiVwh+ScsdhggeB/RdB3+G3JoPbn3JtVOTgU+nmq/WEHINBE+GGl0LbltdHKarKNLICNKX
 l5rqu8MEwqmQeMzi+OlN6gtKcq71DSZtDzPI6LiaXMIzNBVJZCmUA26Vc1+IMA1/ljyqPg
 9YDudoBlp4DvU+EE97WP9mgydREFqg0=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-dtrDNNJ5NOaYG-k1om_sGw-1; Tue, 03 Sep 2024 08:07:02 -0400
X-MC-Unique: dtrDNNJ5NOaYG-k1om_sGw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2f3fc9d8c00so52378861fa.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365221; x=1725970021;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zx4hxQtRMdOzrygXNdwQEDskzaynxlUA2aQcUcONdUA=;
 b=XIcAC6pcR7pHHFuWJOavbVVMaAr2e5Z6cd7EdxD5fr7PZP/Te8+vz/anSM07GgJdv1
 DBu/BZX6WPdQumkOknzzMCs/72wjcUIhk95ITnvtJQgmX6/JPHngFOmN7oqWd2s43vnX
 LRPJVKyZpTqpmfxpB0zl/uePEgtZn+27kJP0TiD7Tn/b2NRBHDNxtJjaCOVgyRD11haS
 AsENEbmL7vzzdJEuoBit8fdyonGQP6L/9i29WMDC4MvXbcLfbIh+63ukxYbw3yTRIx9R
 TrooO/0LMuhQvMW6a/Y3/YsxaY0/sCmOgEcAxEY+FBoHRdIh8VYxStDkqGE6ABN9INaC
 VVYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXv2/UICfu8H2HjLFNfyccEamj6XTsl0YQTVzj7VVKayFwhMm3bverpsWkyFD3mktIoygkHTQlE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxqLD/PqoUh5p80Lfs+/V3Zk9nPWVEbW3fNAl5kQaWNHP3lM8wm
 /DnSYAecr/F6JYjtZy2w9gCAHF8KCvxQyVggkFAgPYLfVDuuiW3M4TcsRWE7l2ZB6RRryePVMRU
 Dlgfu2c2wUZUzdT+qpOxFKvEzA5jeGbjbY+2NfZj//MvZz//fkQ/Sb1il9vWsiwU=
X-Received: by 2002:a2e:be07:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f62655044fmr76801971fa.7.1725365221298; 
 Tue, 03 Sep 2024 05:07:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhYL7VU+pPWXFbZvZO3luoy/PZCZxgIoqNkVLPQzNR06jKjtB+IuiohUKE273yPfAVbpvuDQ==
X-Received: by 2002:a2e:be07:0:b0:2ef:2b53:c77e with SMTP id
 38308e7fff4ca-2f62655044fmr76801781fa.7.1725365220740; 
 Tue, 03 Sep 2024 05:07:00 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6e273e3sm168566335e9.30.2024.09.03.05.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 70/81] drm/qxl: Run DRM default client setup
In-Reply-To: <20240830084456.77630-71-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-71-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:06:59 +0200
Message-ID: <87seuhc55o.fsf@minerva.mail-host-address-is-not-set>
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
> The qxl driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  drivers/gpu/drm/qxl/qxl_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

