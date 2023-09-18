Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E39FB7A54B8
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 23:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9910E0B4;
	Mon, 18 Sep 2023 21:02:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237810E0B4
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695070948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vYq9GddjfhWls7cBVEUs/koAj+ZZ9XbPFD8PuuKxtTE=;
 b=TIOdVCHa9n2Yu/gSTZclw+dThCUOY6cx0kr5l3oSo96jiM6rrYewzwGbsL9kp+i1RFBvFu
 g4A5g3DNXSYFyd5nc9vYV9UY1sRxwF98bjLjHltR5wXqgak2iyeYum6qYbwbymu8F60w+0
 qZjUVjqwAaHoCpDfiVWshlb55MPd8S4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-P7Knd80SMWGKFZHF1xdoOw-1; Mon, 18 Sep 2023 17:02:26 -0400
X-MC-Unique: P7Knd80SMWGKFZHF1xdoOw-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5009ee2287aso5841183e87.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 14:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695070945; x=1695675745;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vYq9GddjfhWls7cBVEUs/koAj+ZZ9XbPFD8PuuKxtTE=;
 b=sLFLBY4Ts85DKpCBFU5vtZ/SfA7woo2ohbgsoGVzFxKPWRMkGqxEkook1PnwBUfEJ6
 tDy2rQeZoMsxLKZXiL/tCyVpc1X/AR0EQuAKRFBKVOjWcuF681rb9Oc+MyhWqr5vxWvT
 jGh6LClJLc8p2e5JhR+gFrXkn8R/1GZ9omXOFjPTzmEefQX6kDb6RuARm5lac1DrIC88
 6WwICl/DLzg797bVCmQuxPb1ZLR+UeqxbnyvmSgktHiir8rtJWzGl6r42bBYEx4tbxX7
 dDA1oV3bIKP8B+3JLffG/aRydskbpic+YQWUdTGpBTT3HJVf8/4dHQL+mxp6xme/gK1t
 03dQ==
X-Gm-Message-State: AOJu0YxpbTMYU1AyslRqM9Aa3q0wbllYPi85jNZYbo7kGm3nuzodoiLF
 XA1JbMZ10RvyRSFrU4nM3Jb9it6GJf/f/QmBEEs+L0OQoghDF5HGbsWFf+ZTNxoMu8xmJuyhi1F
 UnHB6wRCTs0i75mtgaY7Az4TXzQ==
X-Received: by 2002:ac2:4f0a:0:b0:503:522:9ca5 with SMTP id
 k10-20020ac24f0a000000b0050305229ca5mr6740095lfr.27.1695070945121; 
 Mon, 18 Sep 2023 14:02:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3ZS8O7wyj71x9Z/hnKf+yermslQa2LZH54c8YO2xFrV/cd58DQesK7/34LlmnHz6X6yU0Ig==
X-Received: by 2002:ac2:4f0a:0:b0:503:522:9ca5 with SMTP id
 k10-20020ac24f0a000000b0050305229ca5mr6740085lfr.27.1695070944766; 
 Mon, 18 Sep 2023 14:02:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402516400b0052fc0832e08sm6602084ede.1.2023.09.18.14.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Sep 2023 14:02:24 -0700 (PDT)
Message-ID: <568006bf-c380-87b4-057e-26205d7484af@redhat.com>
Date: Mon, 18 Sep 2023 23:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Ben Skeggs <skeggsb@gmail.com>, nouveau@lists.freedesktop.org
References: <20230918202149.4343-1-skeggsb@gmail.com>
 <20230918202149.4343-9-skeggsb@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230918202149.4343-9-skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Nouveau] [PATCH 08/44] drm/nouveau/devinit/tu102-: prepare for
 GSP-RM
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 9/18/23 22:21, Ben Skeggs wrote:
> From: Ben Skeggs <bskeggs@redhat.com>
> 
> - add R535 implementation of DEVINIT, we need some of this for boot
> - add display disable fuse for ga100-
> 
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>   .../drm/nouveau/nvkm/subdev/devinit/Kbuild    |  2 +
>   .../drm/nouveau/nvkm/subdev/devinit/ga100.c   | 15 ++++++
>   .../drm/nouveau/nvkm/subdev/devinit/priv.h    |  3 ++
>   .../drm/nouveau/nvkm/subdev/devinit/r535.c    | 51 +++++++++++++++++++
>   .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |  4 ++
>   5 files changed, 75 insertions(+)
>   create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild
> index d1abb64841da..5f97bffca979 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/Kbuild
> @@ -16,3 +16,5 @@ nvkm-y += nvkm/subdev/devinit/gm200.o
>   nvkm-y += nvkm/subdev/devinit/gv100.o
>   nvkm-y += nvkm/subdev/devinit/tu102.o
>   nvkm-y += nvkm/subdev/devinit/ga100.o
> +
> +nvkm-y += nvkm/subdev/devinit/r535.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
> index 6b280b05c4ca..5f0b12a1fc38 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/ga100.c
> @@ -24,6 +24,7 @@
>   #include <subdev/bios.h>
>   #include <subdev/bios/pll.h>
>   #include <subdev/clk/pll.h>
> +#include <subdev/gsp.h>
>   
>   static int
>   ga100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
> @@ -62,8 +63,19 @@ ga100_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
>   	return ret;
>   }
>   
> +static void
> +ga100_devinit_disable(struct nvkm_devinit *init)
> +{
> +	struct nvkm_device *device = init->subdev.device;
> +	u32 r820c04 = nvkm_rd32(device, 0x820c04);

I'd probably prefer to use NV_FUSE_STATUS_OPT_DISPLAY or a custom define.
'r820c04' could just be data, reg, val or similar.

> +
> +	if (r820c04 & 0x00000001)
> +		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
> +}
> +
>   static const struct nvkm_devinit_func
>   ga100_devinit = {
> +	.disable = ga100_devinit_disable,
>   	.init = nv50_devinit_init,
>   	.post = tu102_devinit_post,
>   	.pll_set = ga100_devinit_pll_set,
> @@ -73,5 +85,8 @@ int
>   ga100_devinit_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
>   		  struct nvkm_devinit **pinit)
>   {
> +	if (nvkm_gsp_rm(device->gsp))
> +		return r535_devinit_new(&ga100_devinit, device, type, inst, pinit);
> +
>   	return nv50_devinit_new_(&ga100_devinit, device, type, inst, pinit);
>   }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
> index a648482d06e9..06bbfdcc788c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/priv.h
> @@ -4,6 +4,9 @@
>   #define nvkm_devinit(p) container_of((p), struct nvkm_devinit, subdev)
>   #include <subdev/devinit.h>
>   
> +int r535_devinit_new(const struct nvkm_devinit_func *,
> +		     struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_devinit **);
> +
>   struct nvkm_devinit_func {
>   	void *(*dtor)(struct nvkm_devinit *);
>   	void (*preinit)(struct nvkm_devinit *);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> new file mode 100644
> index 000000000000..666eb93b1742
> --- /dev/null
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
> @@ -0,0 +1,51 @@
> +/*
> + * Copyright 2023 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */> +#include "nv50.h"
> +
> +static void *
> +r535_devinit_dtor(struct nvkm_devinit *devinit)
> +{
> +	kfree(devinit->func);
> +	return devinit;
> +}
> +
> +int
> +r535_devinit_new(const struct nvkm_devinit_func *hw,
> +		 struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
> +		 struct nvkm_devinit **pdevinit)
> +{
> +	struct nvkm_devinit_func *rm;
> +	int ret;
> +
> +	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
> +		return -ENOMEM;
> +
> +	rm->dtor = r535_devinit_dtor;
> +	rm->post = hw->post;
> +	rm->disable = hw->disable;
> +
> +	ret = nv50_devinit_new_(rm, device, type, inst, pdevinit);
> +	if (ret)
> +		kfree(rm);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> index 40997ad1d101..f406b1525a4a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
> @@ -24,6 +24,7 @@
>   #include <subdev/bios.h>
>   #include <subdev/bios/pll.h>
>   #include <subdev/clk/pll.h>
> +#include <subdev/gsp.h>
>   
>   static int
>   tu102_devinit_pll_set(struct nvkm_devinit *init, u32 type, u32 freq)
> @@ -100,5 +101,8 @@ int
>   tu102_devinit_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
>   		  struct nvkm_devinit **pinit)
>   {
> +	if (nvkm_gsp_rm(device->gsp))
> +		return r535_devinit_new(&tu102_devinit, device, type, inst, pinit);
> +
>   	return nv50_devinit_new_(&tu102_devinit, device, type, inst, pinit);
>   }

