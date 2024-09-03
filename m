Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AD8969BB8
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED5510E4C3;
	Tue,  3 Sep 2024 11:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KuYZki7w";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1410E4BE
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Six38zRCaVcSjI7X8SSQRqVfbWN9LoiIAfaa2uKesPo=;
 b=KuYZki7wgEkwOaViQkNGl9KH3jDkka6u/onOIuqjXUMsfb38S5IEGhZAHCfvr1lKgBVO8Z
 4KWKOmfZOC1V+CwPFQn/V40zE2mVUJhTUGtWYuGh2XWvpZHty7EChbfpClmnZlCZa/oJkh
 FnvkUyqF5OqxEEcMBY6tcP9CSucyx6U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-K4EYrRl6O62_gkmLt7p9bQ-1; Tue, 03 Sep 2024 07:27:48 -0400
X-MC-Unique: K4EYrRl6O62_gkmLt7p9bQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-374beb23f35so2157923f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362867; x=1725967667;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Six38zRCaVcSjI7X8SSQRqVfbWN9LoiIAfaa2uKesPo=;
 b=tOmd9uU0Xp7Bmf38oDzYyeBq/1xu7gBiwIoUXJimUCEZ9Wgyy0xzmi/ZGO5pPUYC2l
 jQmZe4JAQRb0O4b+Uwo8itmX8sUSRhsAOzNkCOo7ckGmIlc4qkz/DYJ45HBRomfvV3JP
 AEm2TkLt3JWGrkZ4jqucwjG8jKReJuK9tKPtYt+HDVYPDZW7ZRya7/UqdEobYCTKRoS6
 3H6+FUE1fp6D8kcce3ILu9pXPSSED4W5D3Wov+FT2uiCJQQLyl7GSEpOkucKvKGKkACa
 mhykCPy9RiGWHTjM/CBdcmBYkIYX240yChzhNT+8c/E6ldvm+tPjfP0UnE5eb0NhHsLb
 aN3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLJR/mSaSYsaiR2pz79isc5GoFCyOWNzkgLF1qwC6/rmycXInI9386miTpiLe8beoVPTG5h8Qk@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysNkqTiPw52Cw5JwsssQtMjplhR9UwHbTPxQvA7rJvbl95SJLT
 8sNFD71B+ZGgI6ee2uhl44XP/0HpYX8jSkuWfRYgvZMQzMB2T5rGiV8whob+Ot/brfBV/jRVHHP
 OfuPA+fMrQUsPdgBHTlZWCAf04931yi52npvmB6QdQwQDn4H0zkpLWxU0mQZBdRY=
X-Received: by 2002:adf:fcc5:0:b0:374:c782:8d5d with SMTP id
 ffacd0b85a97d-374c7828f39mr5378714f8f.10.1725362866999; 
 Tue, 03 Sep 2024 04:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp94tO1qK4mqf4zM7tEKst5ObXZnlzOtHmVRYL5VNue/xInqnwrhNf4Qo0JnEU9e1wjil+MA==
X-Received: by 2002:adf:fcc5:0:b0:374:c782:8d5d with SMTP id
 ffacd0b85a97d-374c7828f39mr5378690f8f.10.1725362866488; 
 Tue, 03 Sep 2024 04:27:46 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef7e109sm13887878f8f.67.2024.09.03.04.27.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:27:46 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 25/81] drm/mcde: Run DRM default client setup
In-Reply-To: <20240830084456.77630-26-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-26-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:27:45 +0200
Message-ID: <87bk15f03y.fsf@minerva.mail-host-address-is-not-set>
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
> The mcde driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

