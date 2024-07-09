Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1F92C081
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 18:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC40410E608;
	Tue,  9 Jul 2024 16:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GhpYHKj8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAF910E608
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 16:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720543130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+y5ex2ZHIYJdSAq+QwDoJNdOKOJs8B0ptQp6BS03afw=;
 b=GhpYHKj8EsOJWst/PzGrNUbJI7xS+2Eox54UnhpU03QyXVJzgi7BFreSm8nS69M2vf3mAv
 qW/zFc+cdRnTQoGDSRZoEz91URPb1Z42Q/ppjVIwxD/ugb8YGIpQDeDIBVhxGJTMZvAfbl
 30F/gfoMX9FPO24GZyq8cfAdQoquvpo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-KR6xSF4BNOCxwFyJKN7byg-1; Tue, 09 Jul 2024 12:38:49 -0400
X-MC-Unique: KR6xSF4BNOCxwFyJKN7byg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-36795e2ce86so3048729f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 09:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720543128; x=1721147928;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+y5ex2ZHIYJdSAq+QwDoJNdOKOJs8B0ptQp6BS03afw=;
 b=SuFtE1rEjxMjdUWtA5d/pUW9ho50A5WPyo9kWe2kBYkbUNLm+97QRkfLol5eHcoX5g
 BxYE/Ib6+8YWcKrFppOnulmL2wvE+0oHIVRw10LddvVhqffQGW932Jmr7P2qe18e3A/C
 Jm9+JQdzq8x7lPSuu3Jx03wUN9HLQDQoGaH2+KO1SmqN7gT2301jKTiz7h3W8DAnKP32
 kxHG67XCX9He2dyS9ITsf64oayGBiUAG7IWzEwU81aEWd0n+EwpkT86xz1Eex3JIpY4z
 n0FKiFzQYktfgw9/tIhROBFCi0vlqCTuRlsOxxdNnJnIkUFr+zsy6SrCgZEat0Ff8StS
 4F7g==
X-Gm-Message-State: AOJu0YxCJJl3wpaWFWv6EOYWNBQi9dxpTx9ImGd95cx8wZ9FQL4WrDBE
 0mHVndoCGsY/RZXnyU6JgBzbtkPsE44M4oBxXnSgdWgXPkLjLrF32K8VPuKrudPdwM9Wb2J4iUj
 wSuhR7nvvCATHn2E78h85z3F3mDqC6S3DdsnuhyjuI1TlgU+N27yEL3uF3Ix5gel325mfU/U=
X-Received: by 2002:adf:f743:0:b0:367:9718:5792 with SMTP id
 ffacd0b85a97d-367cea7377cmr2098950f8f.18.1720543127806; 
 Tue, 09 Jul 2024 09:38:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaXQz9C1MUsyT+lH06GXOSDdQ+Sb+tXsxNgTnFb4duYStD224r3gy5PwjcNTVCAZl+DN6aLQ==
X-Received: by 2002:adf:f743:0:b0:367:9718:5792 with SMTP id
 ffacd0b85a97d-367cea7377cmr2098943f8f.18.1720543127383; 
 Tue, 09 Jul 2024 09:38:47 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfab141sm2992292f8f.96.2024.07.09.09.38.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:38:46 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:38:45 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 34/37] drm/nouveau: remove master
Message-ID: <Zo1nlfrtZjPtHC6V@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-35-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-35-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:37:18AM +1000, Ben Skeggs wrote:
> The only remaining nouveau_drm.master struct member that's being used is
> the mutex that protects its object tree.  Move that into nouveau_drm and
> remove nouveau_drm.master entirely.
> 
> Another patch series will make it possible to also remove the mutex, but
> it's still required for the moment.

It would be good to also mention what we're left with to protect and how we get
rid of that later on.

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++----------------
>  drivers/gpu/drm/nouveau/nouveau_drv.h |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
>  3 files changed, 23 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index c6c9a528783a..85214d35fd5d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -208,11 +208,9 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>  	nvif_mmu_dtor(&cli->mmu);
>  	cli->device.object.map.ptr = NULL;
>  	nvif_device_dtor(&cli->device);
> -	if (cli != &cli->drm->master) {
> -		mutex_lock(&cli->drm->master.lock);
> -		nvif_client_dtor(&cli->base);
> -		mutex_unlock(&cli->drm->master.lock);
> -	}
> +	mutex_lock(&cli->drm->client_mutex);
> +	nvif_client_dtor(&cli->base);
> +	mutex_unlock(&cli->drm->client_mutex);
>  }
>  
>  static int
> @@ -245,11 +243,9 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  	INIT_LIST_HEAD(&cli->worker);
>  	mutex_init(&cli->lock);
>  
> -	if (cli != &drm->master) {
> -		mutex_lock(&drm->master.lock);
> -		ret = nvif_client_ctor(&drm->master.base, cli->name, &cli->base);
> -		mutex_unlock(&drm->master.lock);
> -	}
> +	mutex_lock(&drm->client_mutex);
> +	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
> +	mutex_unlock(&drm->client_mutex);
>  	if (ret) {
>  		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
>  		goto done;
> @@ -602,7 +598,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>  	mutex_unlock(&drm->clients_lock);
>  
>  	nouveau_cli_fini(&drm->client);
> -	nouveau_cli_fini(&drm->master);
>  	destroy_workqueue(drm->sched_wq);
>  	mutex_destroy(&drm->clients_lock);
>  }
> @@ -618,13 +613,9 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  	if (!drm->sched_wq)
>  		return -ENOMEM;
>  
> -	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
> -	if (ret)
> -		goto fail_wq;
> -
>  	ret = nouveau_cli_init(drm, "DRM", &drm->client);
>  	if (ret)
> -		goto fail_master;
> +		goto fail_wq;
>  
>  	INIT_LIST_HEAD(&drm->clients);
>  	mutex_init(&drm->clients_lock);
> @@ -691,8 +682,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  fail_ttm:
>  	nouveau_vga_fini(drm);
>  	nouveau_cli_fini(&drm->client);
> -fail_master:
> -	nouveau_cli_fini(&drm->master);
>  fail_wq:
>  	destroy_workqueue(drm->sched_wq);
>  	return ret;
> @@ -706,9 +695,10 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>  
>  	nvif_mmu_dtor(&drm->mmu);
>  	nvif_device_dtor(&drm->device);
> -	nvif_client_dtor(&drm->master.base);
> +	nvif_client_dtor(&drm->_client);
>  	nvif_parent_dtor(&drm->parent);
>  
> +	mutex_destroy(&drm->client_mutex);
>  	kfree(drm);
>  }
>  
> @@ -733,14 +723,15 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>  	drm->nvkm = device;
>  
>  	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> -	drm->master.base.object.parent = &drm->parent;
> +	mutex_init(&drm->client_mutex);
> +	drm->_client.object.parent = &drm->parent;
>  
>  	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
> -			       nouveau_name(parent), &drm->master.base);
> +			       nouveau_name(parent), &drm->_client);
>  	if (ret)
>  		goto done;
>  
> -	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
> +	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
>  	if (ret) {
>  		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
>  		goto done;
> @@ -966,7 +957,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
>  	}
>  
>  	NV_DEBUG(drm, "suspending object tree...\n");
> -	ret = nvif_client_suspend(&drm->master.base);
> +	ret = nvif_client_suspend(&drm->_client);
>  	if (ret)
>  		goto fail_client;
>  
> @@ -991,7 +982,7 @@ nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
>  	int ret = 0;
>  
>  	NV_DEBUG(drm, "resuming object tree...\n");
> -	ret = nvif_client_resume(&drm->master.base);
> +	ret = nvif_client_resume(&drm->_client);
>  	if (ret) {
>  		NV_ERROR(drm, "Client resume failed with error: %d\n", ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 2535a50b99f3..630463668a76 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -203,10 +203,11 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>  struct nouveau_drm {
>  	struct nvkm_device *nvkm;
>  	struct nvif_parent parent;
> +	struct mutex client_mutex;
> +	struct nvif_client _client;
>  	struct nvif_device device;
>  	struct nvif_mmu mmu;
>  
> -	struct nouveau_cli master;
>  	struct nouveau_cli client;
>  	struct drm_device *dev;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index b112b62dca3c..fac92fdbf9cc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -80,9 +80,9 @@ nouveau_mem_fini(struct nouveau_mem *mem)
>  {
>  	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[1]);
>  	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[0]);
> -	mutex_lock(&mem->drm->master.lock);
> +	mutex_lock(&mem->drm->client_mutex);
>  	nvif_mem_dtor(&mem->mem);
> -	mutex_unlock(&mem->drm->master.lock);
> +	mutex_unlock(&mem->drm->client_mutex);
>  }
>  
>  int
> @@ -113,11 +113,11 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>  	else
>  		args.dma = tt->dma_address;
>  
> -	mutex_lock(&drm->master.lock);
> +	mutex_lock(&drm->client_mutex);
>  	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
>  				 reg->size,
>  				 &args, sizeof(args), &mem->mem);
> -	mutex_unlock(&drm->master.lock);
> +	mutex_unlock(&drm->client_mutex);
>  	return ret;
>  }
>  
> @@ -130,7 +130,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  	u64 size = ALIGN(reg->size, 1 << page);
>  	int ret;
>  
> -	mutex_lock(&drm->master.lock);
> +	mutex_lock(&drm->client_mutex);
>  	switch (mmu->mem) {
>  	case NVIF_CLASS_MEM_GF100:
>  		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
> @@ -154,7 +154,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  		WARN_ON(1);
>  		break;
>  	}
> -	mutex_unlock(&drm->master.lock);
> +	mutex_unlock(&drm->client_mutex);
>  
>  	reg->start = mem->mem.addr >> PAGE_SHIFT;
>  	return ret;
> -- 
> 2.45.1
> 

