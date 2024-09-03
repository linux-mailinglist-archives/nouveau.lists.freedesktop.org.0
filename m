Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD903969B56
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB37B10E488;
	Tue,  3 Sep 2024 11:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RVm0TRaE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB9310E484
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qPIaWn3XKTIUYS+fskj3MRFK24/VwACXAg9gDBEvo1Q=;
 b=RVm0TRaEbuKhsGY740Jz1XcERq637dAA865C5NqGloni+OFgcDarEmQlckuMcqybVCq4H0
 iGq/49FZ1mgikHluXEx9D3vxccAbzHJIcC7Bos33dhMEynGCCncr7Xn1DWE9lPftqqSEa0
 T9rr6EuUM6SqzZVL5d7wEa19AdQBOh4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-O6hXIkABNOmDDnamc2yIqQ-1; Tue, 03 Sep 2024 07:15:01 -0400
X-MC-Unique: O6hXIkABNOmDDnamc2yIqQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374c581ce35so1369948f8f.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362100; x=1725966900;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qPIaWn3XKTIUYS+fskj3MRFK24/VwACXAg9gDBEvo1Q=;
 b=KsXDMkiFrgeFJX4PWza3278AYEjzJmCSW7TIKMS4qqZTSzls/J2z0DQYi3VSqn6CRU
 BDIiUdjBFp6VsGFAIT7RQyAD5BHgpqxnDwF6NzLLwo6Tw+e6n7DrfadFDVO2XNEDKKdx
 B7LIjIS8KoENFZipaNLyDGDNqKinIRm2j3yDBiYibhe4lLLluuyUyGThMMuoZI8h/UMA
 XovKKR8Id95gXK3l3y1fWkwkNogja1u9V0eo1wnPs05aCpKMn/VihMu9RR90uBOP3XBk
 bK6F1qH1tcnhInuUsAxGdx7cKY4+D+/ao4xIrdgpuvfZ4nRbI5nCag6Z6UMP5WRPW8gI
 HXTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAI9qLjHinUHjds5yLMgtTBI1hwQaPkOhP+T5MCZcN1JrkB8qsIyo+LxUJs4U25ka9Zl9TdwL/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV/LONVPQ94WCvGJceJ4ZPWEXjr4M9TtB9c3WA7RwjSa+J+Sa6
 x410nRDEK+Z8vCSo1OvAk6YHHQ/4Nh7j04DRknQVy4d2LvhGb7hTuQVQ4jsLfSEyYqfASF59Idq
 WIjRTOAgATyYwohPSp4nC96TBiJ43LSaSaFMiPEPzki7KgowPWiUEwaMsqHTlAEg=
X-Received: by 2002:adf:ffc6:0:b0:374:c075:ff34 with SMTP id
 ffacd0b85a97d-376dea47229mr253922f8f.38.1725362099845; 
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9s7pVNolnOfMNcbdY8XHk0ufGy7cJsjGqLu3OjVig8fSkTk0+X4NyG6sNUsFTrkUHEkNUg==
X-Received: by 2002:adf:ffc6:0:b0:374:c075:ff34 with SMTP id
 ffacd0b85a97d-376dea47229mr253900f8f.38.1725362099279; 
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba3da654sm10294803f8f.89.2024.09.03.04.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:14:59 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>
Subject: Re: [PATCH v3 12/81] drm/fsl-dcu: Run DRM default client setup
In-Reply-To: <20240830084456.77630-13-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-13-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:14:58 +0200
Message-ID: <878qw9gf9p.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Alison Wang <alison.wang@nxp.com>
> ---
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

