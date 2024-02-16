Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AB85851D
	for <lists+nouveau@lfdr.de>; Fri, 16 Feb 2024 19:28:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8139910E10D;
	Fri, 16 Feb 2024 18:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JwhJwy5q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DA710E0DC
 for <nouveau@lists.freedesktop.org>; Fri, 16 Feb 2024 18:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708108086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=04otk5iNZ32itm1hBkllWfSwBWl7wL1ic55X2+oUtF8=;
 b=JwhJwy5qe+xVS8UwmsC5swxdPPnMfzjYbXz7tcoP0AaOYmujgufdlQP0Q3ngauVP6qrofx
 g7S7xBz18BrsdM0yHDB8Fsyg+1qtJouRbJtIWergcXwAxeR34IfUw4bovO75KJBCCl+iAv
 9Gj/Zva6gycutX72Mf9A8QhAzXPSiD8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-GIITQelgNQau2Si6i-ioAw-1; Fri, 16 Feb 2024 13:28:04 -0500
X-MC-Unique: GIITQelgNQau2Si6i-ioAw-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-511490b3d50so2307380e87.0
 for <nouveau@lists.freedesktop.org>; Fri, 16 Feb 2024 10:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708108082; x=1708712882;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04otk5iNZ32itm1hBkllWfSwBWl7wL1ic55X2+oUtF8=;
 b=tLduzYqiVc0UUH13103q+XRkxNyJk+k3Pkfj5odLtjXzaxEDe/TO1+B5jXCB+EXL4N
 e0TswvJpqWNEmrNjtsrtbPIkZbbQULB9EZYLQXWHNaLgFA6+kJmWBpEw7s87R5X90fBB
 WzInnb1Cdf5BoBnpvBxsi7yxNNWK038E4XdAopBH1tkxWes2aCsxsRPTwvByaFY9SWCv
 IXSE+dgti+0Nn5TJAAuTmcbXbjJcmN6azpifDLsUvmEwWmR+IibsYS4oSv4Yhf0ou78I
 hfvDM9Dl+YuKok6bRTdDsVVQHoS1swLj1zr60/KES8zFnmhU8JWOc35FW4NPwHgsWf65
 xMOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJEiK339AWNZP0HqiOPtmwI137v/0FpQGLk1zgigODZLxZAYFo7QGNXboOi6zmIs4/BHRDFXGgW2E9VPUpB759EwmpULX7Ppz2Ye+2eg==
X-Gm-Message-State: AOJu0YyQVpgmEvh5CTiWjTe4NGZ8MluciUtjOkAjosLCqyA2C5Hyv15T
 UgzmVhMYKB0ZHwcknKOVggpBQLNy9kSz+GG2VjIlwotB0SAaqSmVPMyW33tQ681jVhY/bCxF1fu
 qFlPhREXSDmv0gIPYCCWP48JV3EImqtWAFV7cLmeTKkDoKPjCyRU/+79ml4C/bMQ=
X-Received: by 2002:a05:6512:6d5:b0:512:86fa:a781 with SMTP id
 u21-20020a05651206d500b0051286faa781mr5126923lff.62.1708108082049; 
 Fri, 16 Feb 2024 10:28:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlTdqcYB6gYrq3Gc55U5e1iav+rzbv+UkBZ9iNFp6WAozBF1MgQrgrIw9sAy+0/Uzd7DC4mA==
X-Received: by 2002:a05:6512:6d5:b0:512:86fa:a781 with SMTP id
 u21-20020a05651206d500b0051286faa781mr5126912lff.62.1708108081675; 
 Fri, 16 Feb 2024 10:28:01 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056402501b00b00562d908daf4sm224163eda.84.2024.02.16.10.28.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 10:28:01 -0800 (PST)
Message-ID: <6536ebe0-4577-41dd-b3f1-1525b9fe30b7@redhat.com>
Date: Fri, 16 Feb 2024 19:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/mmu/r535: uninitialized variable in
 r535_bar_new_()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
References: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
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

On 2/13/24 19:09, Dan Carpenter wrote:
> If gf100_bar_new_() fails then "bar" is not initialized.
> 
> Fixes: 5bf0257136a2 ("drm/nouveau/mmu/r535: initial support")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied to drm-misc-fixes, thanks!

> ---
> It looks like this was intended to handle a failure from the "rm" func
> but "rm" can't actually fail so it's easier to write the error handling
> for the code as-is.
> 
>   drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> index 4135690326f4..3a30bea30e36 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> @@ -168,12 +168,11 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
>   	rm->flush = r535_bar_flush;
>   
>   	ret = gf100_bar_new_(rm, device, type, inst, &bar);
> -	*pbar = bar;
>   	if (ret) {
> -		if (!bar)
> -			kfree(rm);
> +		kfree(rm);
>   		return ret;
>   	}
> +	*pbar = bar;
>   
>   	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
>   	if (!bar->flushBAR2PhysMode)

