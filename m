Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B7551AAB4
	for <lists+nouveau@lfdr.de>; Wed,  4 May 2022 19:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BE210ED3E;
	Wed,  4 May 2022 17:29:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19A810E5D9
 for <nouveau@lists.freedesktop.org>; Wed,  4 May 2022 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651685361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DtzKR9aJWXKQXaXTDvVkj3EbrIwKfckZvxRRNgRE8g=;
 b=JyNBY4jhhq6XOQthmoIPa+z+79WAYvB+fs7kmlpxzUtihRDWaSSVvXliVvy1S+f4uqiv/W
 eMEO/zGGItES4/jNbM1tarG8IRQvnGip+9HD7nRG31yDWFkf3FnDjrh6mSRzDbwdtqq3pV
 4/3ccxSL0Sbz0C+BYR/lwAPYFTpSShU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-hIh2-WSRObiR0EsxM732XQ-1; Wed, 04 May 2022 13:29:21 -0400
X-MC-Unique: hIh2-WSRObiR0EsxM732XQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 fw9-20020a056214238900b0043522aa5b81so1348804qvb.21
 for <nouveau@lists.freedesktop.org>; Wed, 04 May 2022 10:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=6DtzKR9aJWXKQXaXTDvVkj3EbrIwKfckZvxRRNgRE8g=;
 b=7hUuVk2cvhQT8rJdbmYX9M47Q3EvAxN+3Buqaz3Zgk33yqWDhyyiHUQCW3rujQ+XkX
 3CifKqJZ0hWznErY9Ut+H9yLRsXIy1nAcsCjcmUWqbhpbHfsRFnycuThgBs0H0WuC2Fg
 Iwn1/WN7XrjGGpVipWKJi6AtjMBmH3xi+vlEwG0Ev46mEEk+vwqNbohx2iHpJLChy29X
 w+d2kGt4CS/p1tAZtW/tGinToG8W7P1L2i1pdGpfMy7igyugg+vfybW9SzlWdKEqrZDT
 tY8FiP6HATeOWOnlJXaLOb2ZWYWVEW/BuvspL4pJsr8Wq8fwa4QkER7DndwkDomGmzba
 4EWg==
X-Gm-Message-State: AOAM531S0F6n5OloEEKk2yL0cL+cvKdVv5rVB7EgzYLY4QRxuzhfHUwq
 rNGIE+Er9Kaj3XRtyxbduWrI659jSyA65X4efriyOgi52eplVywTuQ90beR9WqB1bWw+5oqCkUj
 h+lRF12o5UswLBl3HfHweAGmF2g==
X-Received: by 2002:ac8:5e0c:0:b0:2f3:adfd:bd30 with SMTP id
 h12-20020ac85e0c000000b002f3adfdbd30mr8408568qtx.277.1651685360396; 
 Wed, 04 May 2022 10:29:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjrX58n0IOhBj6Fr3PV/2lw6DGC036Yba/rU/r+Mamk+IeEqM5857Vdlz0oR2XeiB+lpTMJA==
X-Received: by 2002:ac8:5e0c:0:b0:2f3:adfd:bd30 with SMTP id
 h12-20020ac85e0c000000b002f3adfdbd30mr8408554qtx.277.1651685360137; 
 Wed, 04 May 2022 10:29:20 -0700 (PDT)
Received: from [192.168.8.138] (static-71-184-137-158.bstnma.ftas.verizon.net.
 [71.184.137.158]) by smtp.gmail.com with ESMTPSA id
 h23-20020ac85497000000b002f39b99f6b9sm7762181qtq.83.2022.05.04.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 10:29:19 -0700 (PDT)
Message-ID: <0ca5c54fab5dd7dd5988ae48af779570076800a6.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Guo Zhengkui <guozhengkui@vivo.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Wed, 04 May 2022 13:29:18 -0400
In-Reply-To: <20220504161003.9245-1-guozhengkui@vivo.com>
References: <20220504161003.9245-1-guozhengkui@vivo.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH] drm/nouveau/devinit: fix returnvar.cocci
 warnings
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
Cc: zhengkui_guo@outlook.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to the appropriate branch in a little bit

On Thu, 2022-05-05 at 00:09 +0800, Guo Zhengkui wrote:
> Fix the following coccicheck warnings:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c:71:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 90.
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c:35:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 44.
> drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c:35:5-12:
> Unneeded variable: "disable". Return "0ULL" on line 50.
> 
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c   | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 3 +--
>  drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> index 05729ca19e9a..8977483a9f42 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
> @@ -32,7 +32,6 @@ g98_devinit_disable(struct nvkm_devinit *init)
>         struct nvkm_device *device = init->subdev.device;
>         u32 r001540 = nvkm_rd32(device, 0x001540);
>         u32 r00154c = nvkm_rd32(device, 0x00154c);
> -       u64 disable = 0ULL;
>  
>         if (!(r001540 & 0x40000000)) {
>                 nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
> @@ -47,7 +46,7 @@ g98_devinit_disable(struct nvkm_devinit *init)
>         if (!(r00154c & 0x00000040))
>                 nvkm_subdev_disable(device, NVKM_ENGINE_SEC, 0);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  static const struct nvkm_devinit_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> index 051cfd6a5caf..5b7cb1fe7897 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
> @@ -68,7 +68,6 @@ gf100_devinit_disable(struct nvkm_devinit *init)
>  {
>         struct nvkm_device *device = init->subdev.device;
>         u32 r022500 = nvkm_rd32(device, 0x022500);
> -       u64 disable = 0ULL;
>  
>         if (r022500 & 0x00000001)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
> @@ -87,7 +86,7 @@ gf100_devinit_disable(struct nvkm_devinit *init)
>         if (r022500 & 0x00000200)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_CE, 1);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> index 4323732a3cb2..8955af2704c7 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
> @@ -32,7 +32,6 @@ gm107_devinit_disable(struct nvkm_devinit *init)
>         struct nvkm_device *device = init->subdev.device;
>         u32 r021c00 = nvkm_rd32(device, 0x021c00);
>         u32 r021c04 = nvkm_rd32(device, 0x021c04);
> -       u64 disable = 0ULL;
>  
>         if (r021c00 & 0x00000001)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
> @@ -41,7 +40,7 @@ gm107_devinit_disable(struct nvkm_devinit *init)
>         if (r021c04 & 0x00000001)
>                 nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
>  
> -       return disable;
> +       return 0ULL;
>  }
>  
>  static const struct nvkm_devinit_func

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

