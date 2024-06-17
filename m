Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D0290B565
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2024 17:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B758D10E44B;
	Mon, 17 Jun 2024 15:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Sl1Sb+GA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6269510E453
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 15:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718639738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qmb8gUny6Zpgr7K8KEYWVXXhXU3OWlH3oKm/5lLTDS8=;
 b=Sl1Sb+GAj34IwWArz/vhWg+mMfngLdgoVK+rZyI5opZsZz4yPdadFHFpZYECD5TG3iaACN
 6sd04nd1WiNlZFhybC35ikr487rHXMVr5AX3jhU/ZXdRIdhHkGM+QV6jhdA8G1Tdp1f8ZR
 cX/m0w7h8elqwxtLB5ho3YjlQwViaqA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-bBGP5sv5MbKRbvgQL-h7ug-1; Mon, 17 Jun 2024 11:55:37 -0400
X-MC-Unique: bBGP5sv5MbKRbvgQL-h7ug-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-35f123fb9deso2999342f8f.1
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 08:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718639736; x=1719244536;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qmb8gUny6Zpgr7K8KEYWVXXhXU3OWlH3oKm/5lLTDS8=;
 b=AlDTmTL8j6c4cTVEGpvqlCqFdHU6ktyBPoHsg5FYC5JRvD5i36RZ6TlwrJNf2wHYph
 dpY4mCVSsJ2GyVH3ynk8nqFIueEisHd4WjpE0LkCCvI8t9kjn0bIz0UuEQU1Y8JBnG17
 YNOyCoJhTzzojTbEl7NnvX7oS9vdQlnIsb9M0hCgJnFBjPZit+r2iSyGyknrM/P68iht
 bgi/59KYPI4jCEkBXHhUiwdHvYmTe8lW91nogXt1jpkDgx//UWKKHLAbAlRjp2r6hIZ+
 m3S/hyPjkW6sT9h32MpwhMosDNqBLOchIzNgraDlDifeCNSIVO+NiGHRukw50MMIFwNF
 j3Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtfJxKymy8hNb9UPjSYe5bQmxHfyZb4PYeywEbYN1tC/IFYplzPx80lokWU1B3OGbuhtIvBBa0Y7U9wihZIwHPYNYrv9sZ2ptVc6Wlsg==
X-Gm-Message-State: AOJu0YzwLy6LBLu1WRkoBie8bIcd08OOe2MTWTn40NHi4IH80+7Q5q8k
 PUYovzYPHaYr1bSdMwo40/gp0A4f66quAXFMTYkajamXpSH4Q+DMlWKwIyNxkMPJOL4KLJ5EEGL
 Ug0cnIu93t1rely6tSGsp4E5akE32K3/xAcUYFlW41DxVxRmbIwmnUCOZUK1/oeI=
X-Received: by 2002:a05:600c:4ed2:b0:421:7983:f1c4 with SMTP id
 5b1f17b1804b1-42304822952mr78837495e9.6.1718639735981; 
 Mon, 17 Jun 2024 08:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG2HBjQR/zaDHDGvKUJDd9tDwyIlWmvB+O3V20u9Yfc0HFIdhjMf6sutXTwVwI4ehzNmpWbg==
X-Received: by 2002:a05:600c:4ed2:b0:421:7983:f1c4 with SMTP id
 5b1f17b1804b1-42304822952mr78837335e9.6.1718639735666; 
 Mon, 17 Jun 2024 08:55:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f5f33bdasm164871085e9.8.2024.06.17.08.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:55:35 -0700 (PDT)
Message-ID: <a61d9781-7c6e-46b8-ab1b-cf4fc1c76ba3@redhat.com>
Date: Mon, 17 Jun 2024 17:55:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: Use kmemdup_array() instead of kmemdup()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
References: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <a3e8cecc-77dd-4a4a-bb12-c1d6759d3efb@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 6/17/24 11:33, Dan Carpenter wrote:
> Use kmemdup_array() because we're allocating an array.
> 
> The main difference between kmemdup() and kmemdup_array() is that the
> kmemdup_array() function has integer overflow checking built it.  The
> "args->in_sync.count" variable is a u32 so integer overflows would only
> be a concern on 32bit systems.  Fortunately, however, the u_memcpya()
> function has integer overflow checking which means that it is not an
> issue.
> 
> Still using kmemdup_array() is more appropriate and makes auditing the
> code easier.

Indeed, we shouldn't rely on the previous check here, good catch.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_sched.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index 32fa2e273965..53d8b0584a56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -45,10 +45,10 @@ nouveau_job_init(struct nouveau_job *job,
>   		if (job->sync)
>   			return -EINVAL;
>   
> -		job->in_sync.data = kmemdup(args->in_sync.s,
> -					 sizeof(*args->in_sync.s) *
> -					 args->in_sync.count,
> -					 GFP_KERNEL);
> +		job->in_sync.data = kmemdup_array(args->in_sync.s,
> +					args->in_sync.count,
> +					sizeof(*args->in_sync.s),
> +					GFP_KERNEL);
>   		if (!job->in_sync.data)
>   			return -ENOMEM;

Not sure if this is what we want for kmemdup_array(). It just saturates the
size. This doesn't prevent accessing the array out of bounds later on. I mean,
it's rather unlikely to get such a huge amount of physically contiguous memory
anyways, but wouldn't it be cleaner to let kmemdup_array() return
ERR_PTR(-EOVERFLOW) on overflow, just like memdup_array_user()[1]?

AFAICS, there's just two users of kmemdup_array(), hence it should be an easy
change. :-)

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/string.h#L30

>   	}
> @@ -60,10 +60,10 @@ nouveau_job_init(struct nouveau_job *job,
>   			goto err_free_in_sync;
>   		}
>   
> -		job->out_sync.data = kmemdup(args->out_sync.s,
> -					  sizeof(*args->out_sync.s) *
> -					  args->out_sync.count,
> -					  GFP_KERNEL);
> +		job->out_sync.data = kmemdup_array(args->out_sync.s,
> +					args->out_sync.count,
> +					sizeof(*args->out_sync.s),
> +					GFP_KERNEL);
>   		if (!job->out_sync.data) {
>   			ret = -ENOMEM;
>   			goto err_free_in_sync;

