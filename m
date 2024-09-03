Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A03969BF3
	for <lists+nouveau@lfdr.de>; Tue,  3 Sep 2024 13:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E587110E3AF;
	Tue,  3 Sep 2024 11:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TIstK9UM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7650110E3B5
 for <nouveau@lists.freedesktop.org>; Tue,  3 Sep 2024 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725363350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TSTF58qr8+XEIh+oYno8E8uAlH24T+aQUMezZd/qxQM=;
 b=TIstK9UME90S4xbTo4QN4d5nQFeXahrwLTfRwygAcO5N+VGd7o+xXm6dvkW0jf3q3r4Y8l
 f2MyjcMRV071rvpMNuXET4SNxCMXtSTZG9QsNgXt7MIPYZLP9SVcRaSMT6zyYv08Is/eih
 5y70NjCijN2VcF5aB9T4qvW9fCB7RBc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-xOGkMAguO0Ks6xmf22tYwQ-1; Tue, 03 Sep 2024 07:35:49 -0400
X-MC-Unique: xOGkMAguO0Ks6xmf22tYwQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-428040f49f9so48724605e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 03 Sep 2024 04:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725363348; x=1725968148;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TSTF58qr8+XEIh+oYno8E8uAlH24T+aQUMezZd/qxQM=;
 b=VYknKddqFLRhGtPfZm5B41MdJiNZorwhithPOfx5uC71lpE97OI+T/vwqMmRjtGUG3
 6AcdML6fkDogOxmHFyYNGfSBdw9lW2YSVR+yMARPkklqoKAenZ+iPXaCRNONKWrmrehc
 aSQIF6CA7RuU8EiDbSsIF1T7jlg90xsjM9wz/ZHqpPH0spFia/jN6HH07FaaMUAfuGmd
 irz0YCXUAe5vFy6W7p8R8pBgA3OgHMIasuvvk1/EUp2Ikb/c/ksO6Vz404DF1FHtgCER
 IIdvfzb1+okBcOPpYEO4hgUvLg0+Tq9kWpXMxUzxf/UfOwljw/AQgfGjpPjdV84cfR9g
 QjlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4AQpqTqLXsJXSG/CJx2MX+0s97vuTN8rM0hSxaSr6Czcrj0aEAqLVeecSr7oCKOSRsOXvAtCR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNZlQFpNK3jCSBc/g/ZtPHNYzaBstJi04Jnxz3Ir6I8kXBfVKS
 SmHWTy9JKM8cSizOkytZWLrPPkykOm40V/PqYQmZimsLnMhqSMVrm2IcejEz5dIviYhIF9h7U39
 xTVpVMEFlCuy45xt3axcswysWl745W57r8cB8zBn+B4yTIjBDlkx/dsRp3I6Yh1E=
X-Received: by 2002:a05:600c:1ca8:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42bb02edaf6mr130000915e9.13.1725363348479; 
 Tue, 03 Sep 2024 04:35:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtyX2uOKVFE476IZPot6lc0AMFObvLiZGeI1TgAffaxGluqt7ZPRIl9eZVAwWXt4J+zTGPbA==
X-Received: by 2002:a05:600c:1ca8:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-42bb02edaf6mr130000635e9.13.1725363347900; 
 Tue, 03 Sep 2024 04:35:47 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6df0a42sm165399665e9.11.2024.09.03.04.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 04:35:47 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 49/81] drm/fbdev-dma: Remove obsolete setup function
In-Reply-To: <20240830084456.77630-50-tzimmermann@suse.de>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-50-tzimmermann@suse.de>
Date: Tue, 03 Sep 2024 13:35:46 +0200
Message-ID: <87o755dl65.fsf@minerva.mail-host-address-is-not-set>
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

> The old setup function drm_fbdev_dma_setup() is unused. Remove it and
> its internal callbacks. New drivers should call drm_client_setup()
> instead.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fbdev_dma.c | 120 +-------------------------------
>  include/drm/drm_fbdev_dma.h     |   7 --
>  2 files changed, 1 insertion(+), 126 deletions(-)
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

