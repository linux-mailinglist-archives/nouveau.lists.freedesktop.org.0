Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6009390B390
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2024 17:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4437A10E41D;
	Mon, 17 Jun 2024 15:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hRj9ZPxo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79ABF10E41D
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 15:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718637099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RmpaHxW5DBNijlkWopR6OA4OAvwIWI3NJ5EJ/C2CTLw=;
 b=hRj9ZPxoZ7agQQxUMPAdVri55v2C6NeD52DeoK6Q50htYlWYnSvNt6Ae+oQfLODgNK3Xbm
 ZodqZzuegOgIzHHmU4VnSHYOVYjrufHO714j2fm8JTJyMQoG/IhA2+70frP/0/yn77MUrC
 tj5tFnmIr1mTYtHQTAhRNJ+Zm70yyq0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-A_dY9uaBNK6YDTYMgvvxsg-1; Mon, 17 Jun 2024 11:11:38 -0400
X-MC-Unique: A_dY9uaBNK6YDTYMgvvxsg-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-42183fdb37cso32536785e9.3
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 08:11:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718637097; x=1719241897;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RmpaHxW5DBNijlkWopR6OA4OAvwIWI3NJ5EJ/C2CTLw=;
 b=aOPcI907eVnDJnknXkmCkdCriUzkXVsrVvc/R2zU4w7dwrFZTpm5TCwVH2GCfMXPck
 t4fS4NUPMeW6DXQ4oFhkquXUtACjLm0l6YAfPVeQIJ7/6vhoaArITZVPqsU7E3SvufS2
 YLmYGpU9OOMP54uzVs6x4xGIml9MQjruh/AHaDplrqQCsXMaaKb47WNvSi6COrgfChm7
 8dhA9jYUADIYZyCV7VnEXJnHOKP+rQobMYg3Fm/VyPL9Dl1iUzaEY3YdFXKiXC8BIOOg
 u/BenDec+EU5EseR/U/fG3wFUjcjaPIfkGnwRVUVfcdIxm90SoGTKDcmjA0zpRgBlL+O
 cGhw==
X-Gm-Message-State: AOJu0YxWx/4LDqTudGRabnb3A/K3PldAlOY3EZrlZ92r1usmn21nC29x
 tI7kRMbpWylRuHG8V8Pf8t9zJ+DHN7vvpY9avUtljuoRGmW7yLaYx0REGYD2qRcWDRHzkLTRI9O
 agWYcopTN/DGNDaodvkVr1rnC75pweNiMwNxgFfvt/kjW5MimraZizk0CJTve99I=
X-Received: by 2002:a05:600c:4f92:b0:422:6765:2726 with SMTP id
 5b1f17b1804b1-4230484d079mr80409215e9.30.1718637096844; 
 Mon, 17 Jun 2024 08:11:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbUZ0kC9iahSgqGysgBb2fdpDMRTR4tIb55KjCARPQYG0A+YVPIiF/Ctlrh9VFnaLcAVhJ3A==
X-Received: by 2002:a05:600c:4f92:b0:422:6765:2726 with SMTP id
 5b1f17b1804b1-4230484d079mr80408995e9.30.1718637096416; 
 Mon, 17 Jun 2024 08:11:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6320bfdsm161681415e9.37.2024.06.17.08.11.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 08:11:35 -0700 (PDT)
Message-ID: <9baa140c-b6ca-4d52-9d3b-15960a995c14@redhat.com>
Date: Mon, 17 Jun 2024 17:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: rip out busy fence waits
To: Dave Airlie <airlied@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20240417054032.3145721-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240417054032.3145721-1-airlied@gmail.com>
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

On 4/17/24 07:40, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> I'm pretty sure this optimisation is actually not a great idea,
> and is racy with other things waiting for fences.

Yes, I tried to use it in the past on scheduler tear down, to have an
indicator whether all jobs had the chance to finish.

However, it happened that using a CPU busy loop saw the fence as signaled,
while an (event based) dma_fence was still seen as unsignaled.

> 
> Just nuke it, there should be no need to do fence waits in a
> busy CPU loop.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Applied to drm-misc-next.

> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_fence.c | 30 +------------------------
>   drivers/gpu/drm/nouveau/nouveau_fence.h |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_gem.c   |  2 +-
>   6 files changed, 6 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 8a30f5a0525b..a4e8f625fce6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -902,7 +902,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>   	 * Without this the operation can timeout and we'll fallback to a
>   	 * software copy, which might take several minutes to finish.
>   	 */
> -	nouveau_fence_wait(fence, false, false);
> +	nouveau_fence_wait(fence, false);
>   	ret = ttm_bo_move_accel_cleanup(bo, &fence->base, evict, false,
>   					new_reg);
>   	nouveau_fence_unref(&fence);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
> index 7c97b2886807..66fca95c10c7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -72,7 +72,7 @@ nouveau_channel_idle(struct nouveau_channel *chan)
>   
>   		ret = nouveau_fence_new(&fence, chan);
>   		if (!ret) {
> -			ret = nouveau_fence_wait(fence, false, false);
> +			ret = nouveau_fence_wait(fence, false);
>   			nouveau_fence_unref(&fence);
>   		}
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 12feecf71e75..033a09cd3c8f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -128,7 +128,7 @@ static void nouveau_dmem_page_free(struct page *page)
>   static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
>   {
>   	if (fence) {
> -		nouveau_fence_wait(*fence, true, false);
> +		nouveau_fence_wait(*fence, false);
>   		nouveau_fence_unref(fence);
>   	} else {
>   		/*
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index c3ea3cd933cd..8de941379324 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -312,39 +312,11 @@ nouveau_fence_wait_legacy(struct dma_fence *f, bool intr, long wait)
>   	return timeout - t;
>   }
>   
> -static int
> -nouveau_fence_wait_busy(struct nouveau_fence *fence, bool intr)
> -{
> -	int ret = 0;
> -
> -	while (!nouveau_fence_done(fence)) {
> -		if (time_after_eq(jiffies, fence->timeout)) {
> -			ret = -EBUSY;
> -			break;
> -		}
> -
> -		__set_current_state(intr ?
> -				    TASK_INTERRUPTIBLE :
> -				    TASK_UNINTERRUPTIBLE);
> -
> -		if (intr && signal_pending(current)) {
> -			ret = -ERESTARTSYS;
> -			break;
> -		}
> -	}
> -
> -	__set_current_state(TASK_RUNNING);
> -	return ret;
> -}
> -
>   int
> -nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
> +nouveau_fence_wait(struct nouveau_fence *fence, bool intr)
>   {
>   	long ret;
>   
> -	if (!lazy)
> -		return nouveau_fence_wait_busy(fence, intr);
> -
>   	ret = dma_fence_wait_timeout(&fence->base, intr, 15 * HZ);
>   	if (ret < 0)
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
> index bc13110bdfa4..88213014b675 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
> @@ -23,7 +23,7 @@ void nouveau_fence_unref(struct nouveau_fence **);
>   
>   int  nouveau_fence_emit(struct nouveau_fence *);
>   bool nouveau_fence_done(struct nouveau_fence *);
> -int  nouveau_fence_wait(struct nouveau_fence *, bool lazy, bool intr);
> +int  nouveau_fence_wait(struct nouveau_fence *, bool intr);
>   int  nouveau_fence_sync(struct nouveau_bo *, struct nouveau_channel *, bool exclusive, bool intr);
>   
>   struct nouveau_fence_chan {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 49c2bcbef129..f715e381da69 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -928,7 +928,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
>   	}
>   
>   	if (sync) {
> -		if (!(ret = nouveau_fence_wait(fence, false, false))) {
> +		if (!(ret = nouveau_fence_wait(fence, false))) {
>   			if ((ret = dma_fence_get_status(&fence->base)) == 1)
>   				ret = 0;
>   		}

