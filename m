Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E33969BB2
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC14410E4C1;
	Tue,  3 Sep 2024 11:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Grw3lI6t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251A010E4BD
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0YkFi1fyEEJj9fRFEj28CQ1Rb7oXd2qBLLQ3U3hDrnU=;
 b=Grw3lI6tItknWC0yN3PGLL+Od0Kk4NF8i8OkUmM5YgZImIuSmZ5IG/kf0WRKCi5rsx6E47
 j4bjS3ArXSqXMSqe4fTYDYdH1Xthk2gk1Unn4YyAJDQy4kHvTl3cb30EgjvYHgdhgPZpAI
 YmtGWEG9/aR9XdzwJoOYdHRPUyZq3Ho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-DJ-aExJgPMGBbeGWC-xnKw-1; Tue, 03 Sep 2024 07:27:19 -0400
X-MC-Unique: DJ-aExJgPMGBbeGWC-xnKw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42bbadffbbdso41383215e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:27:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362838; x=1725967638;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YkFi1fyEEJj9fRFEj28CQ1Rb7oXd2qBLLQ3U3hDrnU=;
 b=F9qHeQsVFVFvs6VIdCFaaymVqobmFyQV4bMPfY6W9Bb9puxBcznc8b5zOQmKQwQmEQ
 HDc/2GriUW/B9sCmGX/ffqU5b7gR/eaTXFucukcifjwcOc6OklHmVzd/e47MyI4H86S8
 kkTFOrBZaD7KJwBmsDDonUbJNcuZ+RbrVxDKKmxjaZZqhIUTCxm+GHv3nZF0vs0vFTBb
 zda1NCN9SLXwpumLikcxlzdJWxS+EuUC4HErqO05tFwEwikRV/C6wVlnB5HsJ7ysD2xk
 6RQAwwJ2sIeJPBsf3Fz62Lo051KCfCn5PNWjQmjW65yIt7G6LuXFD3hilHfQMOzmTxfu
 NVDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDtU1PPFPnfKbQNFVhhYz2OQ/Zmsrq/gD+KDOmOTyINjoI8mx+Pxlygg/O20qqE69DQEJGRPvl@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNjSDrpk4Ftf/lGvJF03gCmYinzLILGEjXYBtbrsUINX2+haM4
 YnfTGgzoNP1aqPk3EzwLFUyx0ZnMNRdBVjPxBJSsz+bfmhCZTTnnFJjBtexx4waIYUGkp+8/LeN
 SsV1LU+OvQYtL70bm6k/xjWLX7nW6TtJ1twAr0bwjYiIu2QQgWaDgd/wOsEpb0x8=
X-Received: by 2002:a05:600c:34d4:b0:426:6388:d59f with SMTP id
 5b1f17b1804b1-42c8de5f5acmr3366775e9.1.1725362837727; 
 Tue, 03 Sep 2024 04:27:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw8DiOnCu7RE+sIqOn4hIKBEfR8ZpeC8W2x9A+tmFPou1BHLNhfPrR0uHNJ780jkjZzKr9YQ==
X-Received: by 2002:a05:600c:34d4:b0:426:6388:d59f with SMTP id
 5b1f17b1804b1-42c8de5f5acmr3366515e9.1.1725362837007; 
 Tue, 03 Sep 2024 04:27:17 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb72fcca2sm94059455e9.1.2024.09.03.04.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:27:16 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 24/81] drm/logicvc: Run DRM default client setup
In-Reply-To: <20240830084456.77630-25-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-25-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:27:15 +0200
Message-ID: <87frqhf04s.fsf@minerva.mail-host-address-is-not-set>
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
> The logicvc driver specifies a preferred color mode from the value
> in struct drm_mode_config.preferred_depth. The fbdev client also
> looks at this value for the default pixel format. Thus remove the
> format selection from logicvc.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  drivers/gpu/drm/logicvc/logicvc_drm.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

