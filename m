Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4B8969CF5
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726D610E53D;
	Tue,  3 Sep 2024 12:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f0+EJh0b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9EF610E537
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oAf/TzZtq+rwzNtcBqcoWPNDNpw8IbIKF1x2SXWWyZs=;
 b=f0+EJh0bEfqtP20AhvQ5uchIpeCcH+Xof9NT/a1i5/CsqMjBGiWCfIBEgP78mhj6m5yrQC
 /mYF8LKyH5aTv7ADCcpbX90ZDP2Mf3qKcm4IE2Z+oMEWlGQGuM55z100LgJ25aRQmYsIs9
 ynmK8ONLXJQlK4PkAMfgMg5QveijLOQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-JoDc4aaPMHi6RBCL1epjtw-1; Tue, 03 Sep 2024 08:07:46 -0400
X-MC-Unique: JoDc4aaPMHi6RBCL1epjtw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3756212a589so785893f8f.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365265; x=1725970065;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oAf/TzZtq+rwzNtcBqcoWPNDNpw8IbIKF1x2SXWWyZs=;
 b=nKQL3uPka+vKiifygIzxd4pGqWcaFxe4sfD6/X+Jj3gBZBBa/gO4lnelaOUny9Jzvy
 oD4e6B87lcAdDJUHRSbORJwf8bo1Oc9hlPxG7xGYTGzHAEUHWC02ld6l/g0gYyyeSF15
 JNgTJstLWejTRoqU5PPWP9b0IhDLXpnIJQZ4saaiqdDpKwrfYHy0jXrLteLaxHo2Um8t
 ViM0oGWhz0F9DYeEIm8bOJmSwL4Wzsy+OTLscJNkE8mgHdLvkJKslOUUxnUpCKiECmfy
 HV5/1mIbqH0EQH2Ku/W477ThJ/Zhctbub03wFlFOF5kQlRhQrHa5ABLxg0aYRpF3u2Jh
 jszA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj2p6j7OcTpXf4wvHG3ZE8QgfCe0wmNS+WtJ+cR4aJ8md3vhZfG7O+4gZOY0JEoN5Skr41Yunk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsrZGrz8raTx5iVVR1QmwRv+qYeXuaLzu3D4ElxdXHoKm4hRBH
 0i6z+kRXjwHI7NXxOZhIrEk7lU/DlGCtmw5NBOqsGAZ6ACzCJWNQd0MvAyMnHexEppGbnQ32Lkx
 QecWZ4BfDNMxGYwS66xC7dQ/6iaT1G5c+oKko7sLrKVP0zEN2VDL/mg2lsO5hMko=
X-Received: by 2002:adf:f4d1:0:b0:374:c160:269e with SMTP id
 ffacd0b85a97d-374c1602776mr7846594f8f.22.1725365265441; 
 Tue, 03 Sep 2024 05:07:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCZGf4oyMzQD1xP820+OtoZdwpD9efRDqC8p6dHAxE3oooeovG0mBCFinpOGmjQ84JGX0fEg==
X-Received: by 2002:adf:f4d1:0:b0:374:c160:269e with SMTP id
 ffacd0b85a97d-374c1602776mr7846571f8f.22.1725365264915; 
 Tue, 03 Sep 2024 05:07:44 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374b23f20d1sm11428477f8f.35.2024.09.03.05.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:07:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Zack Rusin <zack.rusin@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>
Subject: Re: [PATCH v3 72/81] drm/vmwgfx: Run DRM default client setup
In-Reply-To: <20240830084456.77630-73-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-73-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:07:43 +0200
Message-ID: <87mskpc54g.fsf@minerva.mail-host-address-is-not-set>
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
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

