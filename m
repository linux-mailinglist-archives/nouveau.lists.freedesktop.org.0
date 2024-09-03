Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAC7969BAC
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44A410E4BA;
	Tue,  3 Sep 2024 11:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EF9RUXeJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05CC10E4BA
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362781;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vdWgGVoYLM430WyC+dlybsR86ICY1TW+TxFH6owfPF0=;
 b=EF9RUXeJY4M6RqFXVvhq84Jvjt8yQgQbEkTKQkNvnwXtrpcedes0ccGE6yJHnvTwezP/Er
 pR8l3WqZdN9pQJevZ4VJOy+T/Mh7qMfXShYl+PnGoEW+cZpwSJ2ADhzfvuflij+89vOBw7
 6GlIjveE1V9a+B/WLu+DdBX0iUi3g0I=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-uwe0p_ivOTSTqCM-sSF-3g-1; Tue, 03 Sep 2024 07:26:20 -0400
X-MC-Unique: uwe0p_ivOTSTqCM-sSF-3g-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5334824e68dso849064e87.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362778; x=1725967578;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdWgGVoYLM430WyC+dlybsR86ICY1TW+TxFH6owfPF0=;
 b=rdsD3dFsKCP+fWYhKdt+pRdI4TAROVLEHAe5SYfAsdoI14amy5iO7japinuVYkOgl0
 preHLynuJ44kPiAMMqMuHZVL/LOEYCxvZ585bVPeAvjdb8WWi3IUoSG7Sow5ZZ3CHLH4
 XAJAt8hGAKyQv6fp24OQSkjKYEQUs5LwLDOu7W+VPBw0iikKcviESmuJ+d1jTpdFLJZz
 2GBvpNdjGRyXWzkonLJoMki46xTUhFkefTeMnJgYOgYrB31uj+jmq0wub/R35IDpZgij
 ahq8yvhES51bypM+/OdBw5iBLggiiHuWzig/ae+mMnnK5BHDtH1CMuehtXKP72W7QHit
 fl7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6lucA6c9HTuRmCPKKxQ4n+10tqfp3xanztBVq1CdWOAhugftdYyhWaZnxvIXwlwzob7HbXwJA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxD7+eL0nJAc90sh/VqkclG044vCr5Ahzj5czC/o6PuN/pcJGFT
 I+EU3DfYPUG+87F1DT1pWhuTua/S6K2WiMATv2sjo7njuis0FNH0AnK/a4pG8rdkFDMT3ewcZuu
 YrHnwx88BHMvk0jwlQ7my4sfrQpqQSRcCkpqDw2j+cFXG5i4rp2fmT9LZiMENDjcwQizGgf4=
X-Received: by 2002:a05:6512:1294:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-53546b04544mr8808340e87.16.1725362778304; 
 Tue, 03 Sep 2024 04:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHwRLJHDZdrQkwQWAm+tFo/D0GDWaihGfGc3BFYX5j5bYPJbZDKSAndVvvzTOghOv1AtRVHQ==
X-Received: by 2002:a05:6512:1294:b0:533:4477:28a2 with SMTP id
 2adb3069b0e04-53546b04544mr8808321e87.16.1725362777673; 
 Tue, 03 Sep 2024 04:26:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba7b4271fsm200957535e9.29.2024.09.03.04.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:26:17 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea
 <edmund.j.dea@intel.com>
Subject: Re: [PATCH v3 23/81] drm/kmb: Run DRM default client setup
In-Reply-To: <20240830084456.77630-24-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-24-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:26:16 +0200
Message-ID: <87ikvdf06f.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> Cc: Edmund Dea <edmund.j.dea@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>


-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

