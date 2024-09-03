Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C24C969CD9
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC4D10E519;
	Tue,  3 Sep 2024 12:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C4MYhrF4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949D910E51C
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NHMOo9WHt2Js8QMS+ivCDnsW0bhD6c2SxEScDuVLqTo=;
 b=C4MYhrF4Q2v2qEFKHC07jj+Q+dL4DT/kPdhoeG3VY1ty+vL5z5GKQE4q2V0doP+THhuvHY
 vHRcaoWeWRs4gkMU5Q41ilvrStCV51SH2twnsfDz083g3jLTKuKJGLd7rAtsjWYUaujJMw
 wN4LQ+7BoajJgBOwBfjQpR6mDqbg9cM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-3U5UmHiMML23FVf2qnDswQ-1; Tue, 03 Sep 2024 08:05:32 -0400
X-MC-Unique: 3U5UmHiMML23FVf2qnDswQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-534363ab6a0so4827141e87.1
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365131; x=1725969931;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHMOo9WHt2Js8QMS+ivCDnsW0bhD6c2SxEScDuVLqTo=;
 b=kKK/ion7cOLtcO11AWQ8gUU9FFIhy/U7SUAUpo70xImrxcQAZLLkfOeEcHd2KTIsPo
 /zefQiVcNZ2kLxS76hydnRo6cqTczevv4hnNsPLcKAy8fvgUyCd0+kNNCqt/CFPPuX8u
 dTvEHpcnObq6SPNTzZUMiMk0kyGetTkcWFZknCoU3wzSce3NHu06ITm/0W7qU71nr5fW
 aGJuU7CJhP2TMigE34T5A8nwZu+C4x8AELEajIvvS94abnFCpB4aNpigQmYBBD3mcRHw
 4VOnpIKKJVSK0ZekvD9LZU2hyOi5NnD4qMb3XOm4lUJUGHjOlHacbl/+jUdQbC5j1K0A
 ylkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa0IN5VPI18DJSg6NTDqKtqvfAaoji9Lk/uDA9PsQ4oWzSgT88QL2dFxzleD2ENVSYYJ/AF3AA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZE5zaXZgD2HSudvx49uTsha/8DZnNyqEvaCdhDpLgu/xaVfuk
 o0k4pp67zJGD43EDCeq0Vi5XzGOi+uBjs9e5rcHmQ5nX7cpOuJDt0sIY5pXUbUrUaM2MyN93WQu
 URHFv36tud72coPogExczkVNVeGnWE1447iofVLN49C84G1i7N+6zg8w+p8S/vIs=
X-Received: by 2002:a05:6512:10d2:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53546aff5a3mr8192622e87.20.1725365131112; 
 Tue, 03 Sep 2024 05:05:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpghN3bq0VjJ2vU/J5Df8ul1O4uqOm+Qk8JhPzaDhtvMoqfngbzTsco324Pw6cFzJjTlVtzw==
X-Received: by 2002:a05:6512:10d2:b0:52f:ca2b:1d33 with SMTP id
 2adb3069b0e04-53546aff5a3mr8192591e87.20.1725365130473; 
 Tue, 03 Sep 2024 05:05:30 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4ddc8sm14049200f8f.21.2024.09.03.05.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:05:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 64/81] drm/fbdev-ttm: Support struct
 drm_driver.fbdev_probe
In-Reply-To: <20240830084456.77630-65-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-65-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:05:29 +0200
Message-ID: <871q21djsm.fsf@minerva.mail-host-address-is-not-set>
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
> and reimplement the old fb_probe callback on top of it. Provide an
> initializer macro for struct drm_driver that sets the callback
> according to the kernel configuration.
>
> This change allows the common fbdev client to run on top of TTM-
> based DRM drivers.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_ttm.c | 142 +++++++++++++++++---------------
>  include/drm/drm_fbdev_ttm.h     |  13 +++
>  2 files changed, 90 insertions(+), 65 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

