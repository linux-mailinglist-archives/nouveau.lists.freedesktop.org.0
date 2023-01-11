Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129D665823
	for <lists+nouveau@lfdr.de>; Wed, 11 Jan 2023 10:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22DD10E4F3;
	Wed, 11 Jan 2023 09:52:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A3510E4F3
 for <nouveau@lists.freedesktop.org>; Wed, 11 Jan 2023 09:52:20 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id i15so21550959edf.2
 for <nouveau@lists.freedesktop.org>; Wed, 11 Jan 2023 01:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xRPlleekOC+fYo7CfWrJ+A2miIPcQaqzNRB+BTSi0co=;
 b=St8Wjl4NeuNx9dnWxnYCq41NskmHUV//IDl2IzZW3Id9OdTLoZh+bNlVDvUHLLPoaE
 L4YDC4tebEMGRjbUE0cjgk0NqABMc5agUo1prNxVJ3z/dSttjgcC1oDbXaubXM6VI6ZP
 nfDjT5ddT0uySt3SyQyZEEkQSkxwIL7aIDvb25BXSrz0Jl969VbAb87X19ez8kKp+++b
 wrwzpRnWNWseA/zKjO2KEmgiaMvIPGhwup3/3EjryXg4jArNFoVOlJLw0MKESHiCvTvU
 GGy2o/pgoxzybETUBi9kl/oJHQ0ai8AVhvxOyUqRKgRo+nLxKDLVLecNpVCY3Y46lAR5
 2L+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:cc:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xRPlleekOC+fYo7CfWrJ+A2miIPcQaqzNRB+BTSi0co=;
 b=aydV4HAEUBzTN8ZDw3FL0DAzoyxq84JSP0amGc803NoQVXk/eSro7dzYvR1uQUAhAv
 aLlZk+mL5m7d5qvWAUsnZhyq4O1iXHwjMfF0hM+H4d2Fgzlqh3cXMKZPHEri169zWVUU
 cFqAYvrG8hmT0K1BaqYN12IpwWNO+IcNLl3ibqgdi4zessi1KeFFzVHyU/85wJtMBSWI
 qZ/sG5pVy4SdicGaehdCCikOHwGv8UIlh7MrueXAWh08cXkxE8DXthVAeM+9VQ+SeRZj
 bHdWl83PKn8TXWBmND5NmzH4GAQyA1BVlXBMFggcG4FpIZQ9AphSXVlfxq6CBb9AZ3Pv
 PYJQ==
X-Gm-Message-State: AFqh2kpyXX1YhyPXpGdUBPzMTsnQS4kZNcoeP4zfR3OfruBeOVAy9yuV
 BNNNbdcBHdhy+2Xb25FR10o=
X-Google-Smtp-Source: AMrXdXvRPZb4sXRAdQB0wJF7pq8slZaOLzOFuvqWbKF6T3QkrRABKZoKNSX3OMGsVR9qkp0pdgkPhQ==
X-Received: by 2002:a05:6402:2927:b0:46f:d386:117d with SMTP id
 ee39-20020a056402292700b0046fd386117dmr57348719edb.33.1673430738365; 
 Wed, 11 Jan 2023 01:52:18 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:752d:cd68:6cff:3acf?
 ([2a02:908:1256:79a0:752d:cd68:6cff:3acf])
 by smtp.gmail.com with ESMTPSA id
 et14-20020a056402378e00b00497d8613532sm5163278edb.5.2023.01.11.01.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 01:52:17 -0800 (PST)
Message-ID: <1b69d455-ce93-4a9d-0bb3-f145c03837c7@gmail.com>
Date: Wed, 11 Jan 2023 10:52:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20221125102137.1801-1-christian.koenig@amd.com>
 <20221125102137.1801-5-christian.koenig@amd.com>
In-Reply-To: <20221125102137.1801-5-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Nouveau] [PATCH 5/9] drm/nouveau: stop using ttm_bo_wait
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi guys,

can I get a quick ack for this?

The patch has no functional change and is just a cleanup.

Thanks,
Christian.

Am 25.11.22 um 11:21 schrieb Christian König:
> TTM is just wrapping core DMA functionality here, remove the mid-layer.
> No functional change.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c  |  6 +++++-
>   drivers/gpu/drm/nouveau/nouveau_gem.c | 11 ++++++++---
>   2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 335fa91ca4ad..288eebc70a67 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -922,6 +922,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
>   	struct nouveau_mem *mem = new_reg ? nouveau_mem(new_reg) : NULL;
>   	struct nouveau_bo *nvbo = nouveau_bo(bo);
>   	struct nouveau_vma *vma;
> +	long ret;
>   
>   	/* ttm can now (stupidly) pass the driver bos it didn't create... */
>   	if (bo->destroy != nouveau_bo_del_ttm)
> @@ -936,7 +937,10 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
>   		}
>   	} else {
>   		list_for_each_entry(vma, &nvbo->vma_list, head) {
> -			WARN_ON(ttm_bo_wait(bo, false, false));
> +			ret = dma_resv_wait_timeout(bo->base.resv,
> +						    DMA_RESV_USAGE_BOOKKEEP,
> +						    false, 15 * HZ);
> +			WARN_ON(ret <= 0);
>   			nouveau_vma_unmap(vma);
>   		}
>   	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index ac5793c96957..f77e44958037 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -645,7 +645,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   				struct drm_nouveau_gem_pushbuf_reloc *reloc,
>   				struct drm_nouveau_gem_pushbuf_bo *bo)
>   {
> -	int ret = 0;
> +	long ret = 0;
>   	unsigned i;
>   
>   	for (i = 0; i < req->nr_relocs; i++) {
> @@ -703,9 +703,14 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
>   				data |= r->vor;
>   		}
>   
> -		ret = ttm_bo_wait(&nvbo->bo, false, false);
> +		ret = dma_resv_wait_timeout(nvbo->bo.base.resv,
> +					    DMA_RESV_USAGE_BOOKKEEP,
> +					    false, 15 * HZ);
> +		if (ret == 0)
> +			ret = -EBUSY;
>   		if (ret) {
> -			NV_PRINTK(err, cli, "reloc wait_idle failed: %d\n", ret);
> +			NV_PRINTK(err, cli, "reloc wait_idle failed: %ld\n",
> +				  ret);
>   			break;
>   		}
>   

