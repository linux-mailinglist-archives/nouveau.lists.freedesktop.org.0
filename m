Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20EA95709D
	for <lists+nouveau@lfdr.de>; Mon, 19 Aug 2024 18:42:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7320E10E280;
	Mon, 19 Aug 2024 16:42:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eVbYholp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A17810E27E
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2024 16:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724085763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Md3KCJoK6feytlwXA33ydyo8XOfTQqPq8yxw0ziYE7M=;
 b=eVbYholpvaZNYFw+ilaVaR7C0+Hhf8emC8k44KTnbFTeVCNrXS847ATRAgl8f4wOYnXGVL
 6eegTkHoDwEmEYZCOdalyjJh8KIEj/siqAO0ob1LecYz2kU7KyC40FrJQ7NZWxSapttK/Z
 Cxo4cyk3EFc/w82Deb1TBfwlwNZjX88=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-HwfKyhbyOSCzRapX6ff7kQ-1; Mon, 19 Aug 2024 12:42:42 -0400
X-MC-Unique: HwfKyhbyOSCzRapX6ff7kQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2d3c89669a3so5068920a91.3
 for <nouveau@lists.freedesktop.org>; Mon, 19 Aug 2024 09:42:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724085761; x=1724690561;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Md3KCJoK6feytlwXA33ydyo8XOfTQqPq8yxw0ziYE7M=;
 b=q5SBuSiv5bL98SBwjst0Uq96REltmbX92cxuGN1A/ve9xA+o1qvrNxTmdO90lLt+sy
 5U+MPsxroKlvPunOtTBB2zDRoHATRbH7dtWZ7g2Oa1E9FS+j89Kw7orrscDPjzMTWj4h
 DFyRNmmxM83EeJL5QQHuvJudrCxMOkchzA6Aa5pzV/yZBQoaov4HV906VM5mWluR8/0A
 IXmo0SJvTHvoJHuBLTrncfVjNlNWFLtkXvhDI8OCubT5uNOTIYlmvmjAjPyXipQRWFD/
 8CtWZctZDGu7YR4roG6pGqqOd0f3Qm4UNQmtB3/2VxaqmHN7nOmphRDvtTN3IClvG1K1
 m5DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ3MLJ4M/jIZ7saeyx33y1eO4QY8N6JFbClPpf+zoBDU4PzuuBucaXgOtlj23nLiGoUXAmBxmdSHcUPYjrmQMsG/HJ5XBq5gpvf8sFuQ==
X-Gm-Message-State: AOJu0YwxXTAiEw2gfZqHNdefksdZzCee3yEqcq0HrEa8pVegVtQwFUH8
 7kZKjhOtuJ+ZENQ6I8kwtN74H12Fy3AR3//F2C2dc+0ArOY/1nIGiTkRm9QAbCXafS5O5NTbGDr
 CkGGRZKLfqsdvrEJaJ43pmQLI/rBE55hmJ4+0UfqxydTt2Dj98T048jbaJU2Xhzw=
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2d3dfc7b35bmr13719467a91.24.1724085761049; 
 Mon, 19 Aug 2024 09:42:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsNdEpvtSkAl5rzLqXEcAkgXsVKtNu15fJmALgqr6qS5TBLy4yzi6qcqcR03rEDCVVXij1Uw==
X-Received: by 2002:a17:90a:fe93:b0:2cf:fe5d:ea12 with SMTP id
 98e67ed59e1d1-2d3dfc7b35bmr13719449a91.24.1724085760670; 
 Mon, 19 Aug 2024 09:42:40 -0700 (PDT)
Received: from localhost ([2803:2a00:8:776f:3d96:6be:69c7:46c2])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3d32853f9sm8430017a91.30.2024.08.19.09.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 09:42:40 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 59/86] drm/solomon: Run DRM default client setup
In-Reply-To: <20240816125408.310253-60-tzimmermann@suse.de>
References: <20240816125408.310253-1-tzimmermann@suse.de>
 <20240816125408.310253-60-tzimmermann@suse.de>
Date: Mon, 19 Aug 2024 18:42:36 +0200
Message-ID: <87ikvwa2gz.fsf@minerva.mail-host-address-is-not-set>
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
> The solomon driver specifies a preferred color mode of 32. As this
> is the default if no format has been given, leave it out entirely.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

