Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48289969D63
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EDF10E573;
	Tue,  3 Sep 2024 12:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fxJ46ba2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDF010E573
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725366093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BELKt6Ttgttp44KZLo39NaUCnuGWPJGVPDpp4SZgL/I=;
 b=fxJ46ba2d54NWMJXB9BJq9qyMFh0bZ0mf1a5x58zLoYMrDAYHioU+BwoKz9JZxoblMyACk
 +B1oqTYxBYI7RLhkWS1RxVD/RhoyIPuUIzq4vNVwFf3G8BpyDdAnH/DGU2L4Ru6Gj/8BXA
 ARhP5nNDoCh1W1BJtl/zYt69UC67/wA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-7st_GuhNPaSrGJV4XuwIzQ-1; Tue, 03 Sep 2024 08:21:30 -0400
X-MC-Unique: 7st_GuhNPaSrGJV4XuwIzQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374c9b0daf3so1317791f8f.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725366089; x=1725970889;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BELKt6Ttgttp44KZLo39NaUCnuGWPJGVPDpp4SZgL/I=;
 b=BAnHeIyjmNI8QSjCxBSGt+p8OWwCNrSX7YM9hXHsaPEtp1GoE5c7gh1b2wml/eoYyg
 xSgUYnf51btjKTDqHd0tv8P+fndQniql0IuM+OjEpLkTkbhc57AwTXaMO2NvhKa3H39f
 wi0PwkXvUZeIdmRDNU9xAxfSCNWdwoWIg66EDbN3G6yzLrrlm0+zJeI2Q+AIm92YLFaI
 jboTrPa9s7F7xi0HN+WBlxwhocMqq1LO2ihN8N3yyUBU7G5nJzHIeCT6+OXaMLndEcZo
 eBFRE4befvEAfgpVQu10DDqsfQQC9/L3/zWa5R+G6+TJjhn8JVhMO6xCzyvC6yp4ahtq
 jstw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVteGv/DL9F+JbZijz1goR/XoznMyYR7eGO3egbnqrBg5etkTdIY2EiYHbCI3IBKUG+F4/ZQYZX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yze0pPRez0WB7Q/U5UD8wLTP2W7Pu0yuoGSCb/pvKMPvuH5Vh09
 Q8ICKhkNlxAzZl7VaoBulNKudrihaTU+xzSqPRkaTM4lCiI6HNrvsVgQgnjoU72dzU5UCS8L1Jl
 yXrwBlk9uQzb6wFF5rler3q9wGMBmgq6lyi59ajM9sHNtUGT/qTl2HeW9UjrDScM=
X-Received: by 2002:adf:e444:0:b0:374:c1de:7e64 with SMTP id
 ffacd0b85a97d-374c1de81d6mr5378317f8f.42.1725366089285; 
 Tue, 03 Sep 2024 05:21:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF8EjxKd2aOIdtAzJFfWCYf1w8V/EizPUPJu8WLhb/9BPY/tZjtvJP/yhzDFusXvOdur9h1Q==
X-Received: by 2002:adf:e444:0:b0:374:c1de:7e64 with SMTP id
 ffacd0b85a97d-374c1de81d6mr5378299f8f.42.1725366088831; 
 Tue, 03 Sep 2024 05:21:28 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c958c471sm6157477f8f.25.2024.09.03.05.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:21:28 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v3 80/81] drm/omapdrm: Remove struct drm_fb_helper from
 struct omap_fbdev.
In-Reply-To: <20240830084456.77630-81-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-81-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:21:27 +0200
Message-ID: <8734mhc4hk.fsf@minerva.mail-host-address-is-not-set>
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

> Store instances of drm_fb_helper and struct omap_fbdev separately.
> This will allow omapdrm to use the common fbdev client, which allocates
> its own instance of struct drm_fb_helper.
>
> There is at most one instance of each per DRM device, so both can be
> referenced directly from the omap and DRM device structures. A later
> patchset might rework the common fbdev client to allow for storing
> both, drm_fb_helper and omap_fbdev, together in the same place.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.h   |  3 ++
>  drivers/gpu/drm/omapdrm/omap_fbdev.c | 42 +++++++++++++++-------------
>  2 files changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
> index 4c7217b35f6b..d903568fd8cc 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.h
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.h
> @@ -32,6 +32,7 @@
>  #define MODULE_NAME     "omapdrm"
>  

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

