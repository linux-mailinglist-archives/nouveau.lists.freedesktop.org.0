Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C43AEBCE
	for <lists+nouveau@lfdr.de>; Mon, 21 Jun 2021 16:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C2E6E1A4;
	Mon, 21 Jun 2021 14:54:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F776E1A2
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jun 2021 14:54:38 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 f16-20020a05600c1550b02901b00c1be4abso14121267wmg.2
 for <nouveau@lists.freedesktop.org>; Mon, 21 Jun 2021 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XLVAZwAxuXNsGaV6lvPX7vIKs+0qO2BfXOSpcxK89hk=;
 b=CeFZUpYWyygSdLxxQ3eB4z2Nk6uk921eYPoXBo/JPjyJbOyoFIWC5KOrJYX4j73pY3
 2iOfXdUrkwhkp58y6/RPMu8y2ZruriZjHFk2+m1BZYRkvu05V3lLx8/GS8Gt0Bz8pRUZ
 kdfSXYYgrKfPrI7nD2Svww6QvgK98Vroo5+tI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XLVAZwAxuXNsGaV6lvPX7vIKs+0qO2BfXOSpcxK89hk=;
 b=CkLl0XSyEjTyqpT7d0JEaMQ7S8mmSXEkrWyH5S9iOcMtJDEWXl2PVlXZ62BlfuR5Ba
 s5JAEyhPlH+6jVTxJZidD5d58hhatnDvsbjpUgee0F7Zo3g9FZhYjpf8IjN+qO94FqFf
 AMlCCqzzYmGVcMWtgagli3PWg0gj4KRJuvuKE6WPKJ32mM0l8/SJ/+CSUug0p9Xm0DnW
 HWl967YYkjdQDZ7PwRLLeJXvpSaPZujGmgXZHxRarcliRuVEDSJnLLoStCJA6Wnaa4eq
 FqHSjVdTh3BElwDBElXaietL4l89lO8qHJ4uR8IXw62+Wdk0TFjEvlbKxO6UtpG3dvJS
 av1g==
X-Gm-Message-State: AOAM532soc+SYUhlOg4t8wioi5wV02iK4OjQLI4tFcoq+N/IuOAKnhnP
 s/aZpDO8+vSHRjCmQg/XqzUAhw==
X-Google-Smtp-Source: ABdhPJyQ0JSmH8QndMZrr5AL5YLnvQqlqh8f8Kc50ydxa8bqPvF6adZqTFdw3Y3grNzRd/IgPkjjIA==
X-Received: by 2002:a05:600c:281:: with SMTP id
 1mr25368979wmk.171.1624287277670; 
 Mon, 21 Jun 2021 07:54:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n4sm4429425wrw.21.2021.06.21.07.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 07:54:37 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:54:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <YNCoK1qv6CCIy0Rl@phenom.ffwll.local>
References: <20210621130328.11070-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621130328.11070-1-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
Subject: Re: [Nouveau] [PATCH 1/3] drm/nouveau: wait for moving fence after
 pinning
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jun 21, 2021 at 03:03:26PM +0200, Christian K=F6nig wrote:
> We actually need to wait for the moving fence after pinning
> the BO to make sure that the pin is completed.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> CC: stable@kernel.org
> ---
>  drivers/gpu/drm/nouveau/nouveau_prime.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/no=
uveau/nouveau_prime.c
> index 347488685f74..591738545eba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_prime.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
> @@ -93,7 +93,13 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
>  	if (ret)
>  		return -EINVAL;
>  =

> -	return 0;
> +	if (nvbo->bo.moving) {

Don't we need to hold the dma_resv to read this? We can grab a reference
and then unlock, but I think just unlocked wait can go boom pretty easily
(since we don't hold a reference or lock so someone else can jump in and
free the moving fence).
-Daniel

> +		ret =3D dma_fence_wait(nvbo->bo.moving, true);
> +		if (ret)
> +			nouveau_bo_unpin(nvbo);
> +	}
> +
> +	return ret;
>  }
>  =

>  void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
> -- =

> 2.25.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
