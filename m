Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72CA969B8B
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001AF10E1AE;
	Tue,  3 Sep 2024 11:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="icboxGNX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BDC10E48D
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bbJNkV9u0ZGr/jKEh9pTFkh2fVXMicyQllArXRfkk5s=;
 b=icboxGNXrqbTB++QzdU48uG5eOw/phj1SSaxm/2LcAWOFWEhYWNmU44mP8fKGgMcK4JER1
 Y6RAk3Vu//JPBxzfwUHj3GWHrZHYzL9X1iwcDK/HYCPx4/bQbJBiGrz9jC5x0mkRok590K
 ODa/kaX14LT1e0rW8VGHGm+W4rV90+0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-y7SsjFicNQW0CMR73gVx8g-1; Tue, 03 Sep 2024 07:23:47 -0400
X-MC-Unique: y7SsjFicNQW0CMR73gVx8g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-374b69e65e8so2535998f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362626; x=1725967426;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbJNkV9u0ZGr/jKEh9pTFkh2fVXMicyQllArXRfkk5s=;
 b=nYyzH1w7fw0xvlZSLycCGSp+ls5iE54jYkRlgX5vcaM7s6Tnnbk7EeOJzlIeStAzZ4
 8OzYxqDbz4YI9z5nkgiAYaeCYSzHY+CK75WUAvmAfELvW6WvJfWXr/RGwwf8pSnzH5UJ
 O0yIPmZ04kMSjnRQM5Y4V1BcaYHe9EMwKiw0h8WFYPnrfH1Pw1AJZZzjFAsAlHF7qKcP
 83EY9XS/uQBRMjYasXKreLVVCqqoGzbRC3i2uJfon6SpMt0/hBpFRnWRVrHy7bxESqbO
 muqPRXR0x+HPD+5WRj3wooNGAA6cta3Xvu55iWnhDXYgfXq1Po5FaRZNm8Eq+gKRxRyN
 RWdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvn1g+Mu765yb10I0XvrfmRrX64caXzMFCnzNVURO2JCg1nOnkeJ7ihDSQvBFjS8FHVwOPVIPU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCWqqzxIZ6OUjaTacjbBIDJBjmpsl5nKGmjC/njJ+yCNHEAvgV
 1RRwmrsIkvY5i9/u1WWcoXj4cYMH/lpN1iBxoCwrLHKaWMKZMwFn7Nn/0ND9BfIOply092kVTYM
 gH0ZGiHKOnGQhFN4wHuJ6zKbTpM+UBpuhMdo2UleZWCb6a5YmWzgY0ge5BfSOtKM=
X-Received: by 2002:adf:f784:0:b0:374:c69b:5a16 with SMTP id
 ffacd0b85a97d-374f9e47a5cmr2179064f8f.50.1725362626239; 
 Tue, 03 Sep 2024 04:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSm/RqGjce7S7ZMEuf3IOUzOzr9uuowr5iGarnhEC2vfQARAToz2WJdH4ddi+cl3DwZjT8sw==
X-Received: by 2002:adf:f784:0:b0:374:c69b:5a16 with SMTP id
 ffacd0b85a97d-374f9e47a5cmr2179047f8f.50.1725362625744; 
 Tue, 03 Sep 2024 04:23:45 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba30d5b8sm10273357f8f.15.2024.09.03.04.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:23:45 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 17/81] drm/ili9341: Run DRM default client setup
In-Reply-To: <20240830084456.77630-18-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-18-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:23:44 +0200
Message-ID: <87wmjtf0an.fsf@minerva.mail-host-address-is-not-set>
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
> ---
>  drivers/gpu/drm/tiny/ili9341.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

