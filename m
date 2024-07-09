Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E319D92BF6D
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 18:14:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED5C510E088;
	Tue,  9 Jul 2024 16:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OtGRauTu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8810E088
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 16:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720541690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SGw2QhibXd0se/kuqgy+Y99Qu0VySRQvb3r3EwzUcvc=;
 b=OtGRauTuYbYrNwFaqz0fXP0TachOB2pdD66Wu21uP33PC/DA4Q5PVaPgMRv1fwh5gf6B6c
 8s2khJzJDk9bqadD39Dc7tRaByeyuEc/kHKVT0mkOPZhHTY7bViEN7o1RXBjchLHYppwFm
 qdxGOGTQYK/MKqxnvaTtDu3HxzzCTM0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-bMVMeASQPuy55w7ifiWXFw-1; Tue, 09 Jul 2024 12:14:48 -0400
X-MC-Unique: bMVMeASQPuy55w7ifiWXFw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-367af2cd5f3so2277812f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 09:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720541686; x=1721146486;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SGw2QhibXd0se/kuqgy+Y99Qu0VySRQvb3r3EwzUcvc=;
 b=m7ObuRZ/WCR+wjbsFY5UvtBcMu1iSRBpjUrj+sqZAV6D6CH6Ph0+w22BjKhxi0iVxh
 ex8ZZlGCXjRAuY6S81zFHHyrkRzejphZ5lWswio7mRLD+h77pWPiPdpvx3PGFxMpbgV3
 rRUokkwgse5YjeeKVcMiWl5dW/NOwuc/xLody9yPcnjRjeepVKspH3B8eew8FsDhuYQk
 UOyR+ABXGyQeV5At6e8vJqK5Jh6u7j4YorEfci8PBJ/rt9il4JX5wgrC2qIMlEXfZt4i
 ScE+z/w80H9mmtbrbmvt2M47KVitJugCJZBeFomdNFNyd8ikNl0ED7OjDpuxaxu5M8bU
 QENg==
X-Gm-Message-State: AOJu0YygFtMAJxvP3gDcjLECPj5dcvP2xzXBDXkEu9z5LpP+/8G064xR
 k/T1l3ZA21Ra+T2qmdEIrMHkXpYUzZpG3zv7SjWmYE2t1gAF20zJgRMzwwmce01mLcZp5Ev9Hpy
 7z2hmzoYT+bTa3moet9WXwmI6VZKrCNxOas6Lz8C7rNGRb0ux4sVNj9RYT91RZJ61CgWbtMM=
X-Received: by 2002:a05:6000:1888:b0:367:8fee:443b with SMTP id
 ffacd0b85a97d-367cea96744mr2313540f8f.41.1720541686557; 
 Tue, 09 Jul 2024 09:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeH60nGdH6RkIweCznBjdK7pRvS4skeScVNEDrm0H6hH4YlvAGA2LJjgjTjgQ+wQUSZjvqtw==
X-Received: by 2002:a05:6000:1888:b0:367:8fee:443b with SMTP id
 ffacd0b85a97d-367cea96744mr2313526f8f.41.1720541686190; 
 Tue, 09 Jul 2024 09:14:46 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab199sm2961716f8f.106.2024.07.09.09.14.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:14:45 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:14:44 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 16/37] drm/nouveau/nvif: remove nvxx_object()
Message-ID: <Zo1h9HPwojB5tkPN@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-17-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-17-bskeggs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

On Fri, Jul 05, 2024 at 04:37:00AM +1000, Ben Skeggs wrote:
> This hasn't been used in a while.
> 
> Moves some io accessors to another include at the same time to

Please don't just say something was moves somewhere, say where it was moved to.

> fix a compile issue that resulted from <nvkm/core/object.h> no
> longer being included.

Saying "resulted" instead of "results" here sounds a bit like a previous commit
introduced the issue, but it's actually this one. Please use present tense.

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/object.h |  7 -------
>  drivers/gpu/drm/nouveau/include/nvif/os.h     | 19 +++++++++++++++++++
>  .../gpu/drm/nouveau/include/nvkm/core/os.h    | 19 -------------------
>  3 files changed, 19 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
> index f52399caee82..478cbb8f2dfe 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/object.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
> @@ -134,11 +134,4 @@ struct nvif_mclass {
>  #define NVIF_MR32(p,A...) DRF_MR(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
>  #define NVIF_MV32(p,A...) DRF_MV(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
>  #define NVIF_MD32(p,A...) DRF_MD(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
> -
> -/*XXX*/
> -#include <core/object.h>
> -#define nvxx_object(a) ({                                                      \
> -	struct nvif_object *_object = (a);                                     \
> -	(struct nvkm_object *)_object->priv;                                   \
> -})
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/os.h b/drivers/gpu/drm/nouveau/include/nvif/os.h
> index 429d0106c123..a2eaf3929ac3 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/os.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/os.h
> @@ -34,4 +34,23 @@
>  
>  #include <soc/tegra/fuse.h>
>  #include <soc/tegra/pmc.h>
> +
> +#ifdef __BIG_ENDIAN
> +#define ioread16_native ioread16be
> +#define iowrite16_native iowrite16be
> +#define ioread32_native  ioread32be
> +#define iowrite32_native iowrite32be
> +#else
> +#define ioread16_native ioread16
> +#define iowrite16_native iowrite16
> +#define ioread32_native  ioread32
> +#define iowrite32_native iowrite32
> +#endif
> +
> +#define iowrite64_native(v,p) do {                                             \
> +	u32 __iomem *_p = (u32 __iomem *)(p);                                  \
> +	u64 _v = (v);                                                          \
> +	iowrite32_native(lower_32_bits(_v), &_p[0]);                           \
> +	iowrite32_native(upper_32_bits(_v), &_p[1]);                           \
> +} while(0)
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
> index 3fd5c007a663..9b05612e6490 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
> @@ -3,25 +3,6 @@
>  #define __NVKM_OS_H__
>  #include <nvif/os.h>
>  
> -#ifdef __BIG_ENDIAN
> -#define ioread16_native ioread16be
> -#define iowrite16_native iowrite16be
> -#define ioread32_native  ioread32be
> -#define iowrite32_native iowrite32be
> -#else
> -#define ioread16_native ioread16
> -#define iowrite16_native iowrite16
> -#define ioread32_native  ioread32
> -#define iowrite32_native iowrite32
> -#endif
> -
> -#define iowrite64_native(v,p) do {                                             \
> -	u32 __iomem *_p = (u32 __iomem *)(p);				       \
> -	u64 _v = (v);							       \
> -	iowrite32_native(lower_32_bits(_v), &_p[0]);			       \
> -	iowrite32_native(upper_32_bits(_v), &_p[1]);			       \
> -} while(0)
> -
>  struct nvkm_blob {
>  	void *data;
>  	u32 size;
> -- 
> 2.45.1
> 

