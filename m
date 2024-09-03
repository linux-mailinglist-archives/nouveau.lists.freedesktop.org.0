Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D811969BBF
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C3A10E4CA;
	Tue,  3 Sep 2024 11:29:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fFU7tAGQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C323410E4C9
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725362950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SOwnsv9Ex7Dst0oT+vzWucUQJDjqV43haxzxxhRT6eM=;
 b=fFU7tAGQoaguZItrMpZTa+Xgr0T+fVI6s8JpYj4KWeg4Zj1rFoXcZ8U2eHI5BDZ4eTicW1
 fL2wqBD5RLElJwc67g7KSggQfPj/z3WAkrSeIkzZWcnuTw3ouYSgYxo4GjtWkxLjqG79zx
 IANHJsqR5J8o+9a9Xgtk8kbqNF7HrJA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-eQ7UazOwPRCU8Ns6sJ4-6g-1; Tue, 03 Sep 2024 07:29:09 -0400
X-MC-Unique: eQ7UazOwPRCU8Ns6sJ4-6g-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3756212a589so756616f8f.2
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725362948; x=1725967748;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SOwnsv9Ex7Dst0oT+vzWucUQJDjqV43haxzxxhRT6eM=;
 b=lx/wTuilBZBgPtk2Thrw8zdwWWFtvWFS7K2h2JAIuAKQTOh22twRasycPpihLBKbiT
 qTxCcHrH3JBAbUNU9NqDt1pU920gnR8MZl3MVAArDXIIXL9+PQA17wgqZS3r2uCDgdft
 hjVHZUsE4/0kw8jtyo+NxiFD1ma3iyjtdLtO3RC1ehOU4Ajn5XqGuSLDYjHeiuB/aLHp
 ATXADhLieRl6d0OBNE2QzdSQfjz5GMWcSpEkrys15LrKQPgX+ZWE27xgKdiKJ3yMk9e4
 M9dmhZ90TydXJzsIzwHrqC6Og78iNpHHm98zuYM94fhTxrv6Rwt3m5fp21JY7wYcb/J8
 zEOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmZiXHaq4omqwGQ7Epa10+DW7qlEyyO502FDST5W2QvVnPPZJXzqbVVD+YG+TRyMu/GO6QXdUT@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyalywdGubzM6YST3V7mY0u3lsL2OTHDCFdZwomJF/P2ZdgfRhz
 gCnjayeBaVmwSL6bgrrkZsYp1zwijl2PNoUnJ98+9L/ib3s0wbzZKVndx6KXO4Bo1iLGIpkYv7q
 UcnE5LH9ehggn3BzRJZeFRMiJ1ix82ksUkBrzF5EdEoOGrE1SxN6U5mUMxOvqtvpvHwQ3foQ=
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id
 ffacd0b85a97d-374bf857f23mr7600170f8f.61.1725362947575; 
 Tue, 03 Sep 2024 04:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFplzXWPnS8z1FVY1e2/1mWosdqwoo68I7PXq6d9DOV9oX5IACg3DEStSkSK8s6tqHoRzr8g==
X-Received: by 2002:a5d:5309:0:b0:374:bf85:7d74 with SMTP id
 ffacd0b85a97d-374bf857f23mr7600141f8f.61.1725362947101; 
 Tue, 03 Sep 2024 04:29:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374c9487bebsm6146536f8f.94.2024.09.03.04.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:29:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 30/81] drm/mxsfb: Run DRM default client setup
In-Reply-To: <20240830084456.77630-31-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-31-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:29:06 +0200
Message-ID: <875xrdf01p.fsf@minerva.mail-host-address-is-not-set>
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
> The mxsfb driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> v3:
> - fix driver name "msxfb" to "mxsfb"
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

