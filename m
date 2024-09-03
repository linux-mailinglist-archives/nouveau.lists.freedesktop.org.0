Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3736969CD3
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 14:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834C910E3DC;
	Tue,  3 Sep 2024 12:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dFW91iIA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82CB10E3DC
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725365061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3fiZjoQDP1pxCas9l8KljpRaPLENWaMi4jehrGgSlHU=;
 b=dFW91iIAtx99Wx9S0eA8oIPAtRqF2zhgfZuICPCy7POYqhh8MrnG0ZjxGfyTP917s4c0C9
 3499/hbw94frmTiy7ICXg+Nx1sg74RrwdFuC1IzWzBAhGFHc8MIicB9olUp3mid9PqyS7h
 uobtvw2SNW/b1xOal/MizLQMsG8JiO8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-aqJzIyBzOdy2oEkGG8Twjw-1; Tue, 03 Sep 2024 08:04:20 -0400
X-MC-Unique: aqJzIyBzOdy2oEkGG8Twjw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42bafca2438so59539235e9.3
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 05:04:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725365059; x=1725969859;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3fiZjoQDP1pxCas9l8KljpRaPLENWaMi4jehrGgSlHU=;
 b=vCQbE8smtvdBlMC1ZcW2/LFuudhPk9YRW+WLs/u7swJ2soSVSk2hOmdJcxH+WLanHd
 QR+4EokfsasVn59RYc088P80ix3WekJs5+mNqQnuRmSgp1KjRzaYa8A3uRmCUb6l7Mj9
 6zai+n27eHplFKOcG1OVh3QQdGrFUZ0LbApvTVejJD6FAyvSSqs3SuwgZrFhWz+nwN60
 nohsbGiOsVAhHOnFX7y6mCSVpOvofiTK+BLPzGfpBzUWGI8FOwkLGW9x0nE3/t0q51nN
 8mLCF5ZwQ+NWikI+ylUtUYap/VMbrfSblU4rPqHPzAkBsMu06fM5yiqb2SX5sOLqVmfj
 ojMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9skEP13O+WnuNeVBfIhLEvOlUo7yuTrL9W0bnCgplDfywXud9GjoKmD1wOZKMC+26xqzJVyaa@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6teJ783JOLY5ERng7ZoFtCp1AeaoAtUgg1gw0lEUM2q2NX2Bo
 2S8bpFbo2J9ImYAXbeQI2w6URvGGM16Y4uJe2fQoR1aI74sd/xTslOex0gIimTEjleYyIYC/OXc
 rjH2EiDBkzDKEIC4gUPoRG8inHJs/vP9NtcRfsYRHoYAcE3wSxGM4vbHs8hu/6F0=
X-Received: by 2002:a05:600c:474c:b0:429:c674:d9de with SMTP id
 5b1f17b1804b1-42bb01ad776mr149399555e9.2.1725365058831; 
 Tue, 03 Sep 2024 05:04:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExAsxohFpaNmRsPtig4vIEqTLLJJ6A9qw2cCf0dEsQNkZ8aqk53IDxglqBJcoW1INXcnXT9w==
X-Received: by 2002:a05:600c:474c:b0:429:c674:d9de with SMTP id
 5b1f17b1804b1-42bb01ad776mr149399315e9.2.1725365058397; 
 Tue, 03 Sep 2024 05:04:18 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bbf00e095sm129587485e9.13.2024.09.03.05.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 05:04:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 63/81] drm/fbdev-shmem: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-64-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-64-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 14:04:17 +0200
Message-ID: <874j6xdjum.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_shmem_setup() is unused. Remove it
> and its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_shmem.c | 120 +-----------------------------
>  include/drm/drm_fbdev_shmem.h     |   6 --
>  2 files changed, 1 insertion(+), 125 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

