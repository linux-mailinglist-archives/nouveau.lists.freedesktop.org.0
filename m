Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C0092C051
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 18:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F0C10E609;
	Tue,  9 Jul 2024 16:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UOBP2BMX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9701810E5FA
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720542902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YC7LUzij0vW3euNx55JR0BHrDdrhu+yigROvo7eG7uc=;
 b=UOBP2BMXtjz0Z6aYAQrT5HYT9rDB0nKqooMPMld6YA/VhEJfNAJQSWwoLu6Ft6NeFo5SM+
 WvytPplx7M0/RMYTKshz+/x/ox6Hrvu1SYCzc6nAOhV+3velEeVOuxrGnLLXqx+CV+eQRf
 h9d5qvTypv1Zl9OJFL2s3Mp1jW2ubBA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-_B6DxPDbP8Gt4GEj7KRr2A-1; Tue, 09 Jul 2024 12:35:01 -0400
X-MC-Unique: _B6DxPDbP8Gt4GEj7KRr2A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-42667e82901so16619155e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 09:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720542899; x=1721147699;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YC7LUzij0vW3euNx55JR0BHrDdrhu+yigROvo7eG7uc=;
 b=Q9EXVVKn6/qzArE6xmP7fWV0B/gn57nwYm8xThvH+8w/EwMXfGpBfvlulypA1rDcTy
 1dZQmdpHGaqXvqU9GqCnC9g7c7RMi8QXsF1nCl5jNrFmG425GaM5db0/4h4ZrB40tYN4
 SJJSuHSvaVW9SOICVCBAg/336jdBiAw1Py3jro3LdeU/P+A6+JzSEYj0DCGd7UUIw2Oh
 wfs+fgVk8HSCwpmSTjqB/TyzbhZuhGHSnfCu3S2ehZH7NulTNuikl/s5q7fqHn3T5xe5
 ZjAj6NFb/ZcQGNvzYx/lQOoVkeToQTJ2mLuJZdEXGNzjj/GDPcC+5G6x7YJcxgjY1c4A
 zT8g==
X-Gm-Message-State: AOJu0YzFPz0y2Gh648blpf+Gvyhzby8BlnVPihH62zNH3RiXshbRxb75
 535CN55y2X4HJIV7tsCLgNzGT/vB8Nlf27WgtJhLAA/z4Knk1Q20TGLY1hUSGbw2ZXJy6hdXVWK
 rDxo+stTdKttIumOYiEYAOzydmgl3to5AzLfSdB3JpZTfLw8snwpsdq5nZPsEtPFpbmnDMz8=
X-Received: by 2002:a5d:4589:0:b0:367:95d2:4ec0 with SMTP id
 ffacd0b85a97d-367cead925emr2172459f8f.62.1720542899404; 
 Tue, 09 Jul 2024 09:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxcgRBvk5lzZkO9QO3p9aY18SboLu55898LcGIDsmhZEuz4ko1vVSnBxi7kK9VhHHUnk5IZA==
X-Received: by 2002:a5d:4589:0:b0:367:95d2:4ec0 with SMTP id
 ffacd0b85a97d-367cead925emr2172449f8f.62.1720542899031; 
 Tue, 09 Jul 2024 09:34:59 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde84660sm3006733f8f.25.2024.07.09.09.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 09:34:58 -0700 (PDT)
Date: Tue, 9 Jul 2024 18:34:56 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 28/37] drm/nouveau: add nvif_mmu to nouveau_drm
Message-ID: <Zo1msLvf2Vfz90Mb@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-29-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-29-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:37:12AM +1000, Ben Skeggs wrote:
> This allocates a new nvif_mmu in nouveau_drm, and uses it for TTM
> backend memory allocations instead of nouveau_drm.master.mmu,
> which will be removed in a later commit.

It would be good to make clear that this is part of a couple of commits that aim
at removing nouveau_drm::master.

Also, can we get all related commits a bit closer to each other?

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 35 ++++++++++++++++-----------
>  drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
>  3 files changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5ff116bcbabf..07748cfab233 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -227,13 +227,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  		{}
>  	};
>  	static const struct nvif_mclass
> -	mmus[] = {
> -		{ NVIF_CLASS_MMU_GF100, -1 },
> -		{ NVIF_CLASS_MMU_NV50 , -1 },
> -		{ NVIF_CLASS_MMU_NV04 , -1 },
> -		{}
> -	};
> -	static const struct nvif_mclass
>  	vmms[] = {
>  		{ NVIF_CLASS_VMM_GP100, -1 },
>  		{ NVIF_CLASS_VMM_GM200, -1 },
> @@ -270,13 +263,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  
>  	cli->device.object.map.ptr = drm->device.object.map.ptr;
>  
> -	ret = nvif_mclass(&cli->device.object, mmus);
> -	if (ret < 0) {
> -		NV_PRINTK(err, cli, "No supported MMU class\n");
> -		goto done;
> -	}
> -
> -	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", mmus[ret].oclass,
> +	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
>  			    &cli->mmu);
>  	if (ret) {
>  		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
> @@ -717,6 +704,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>  	if (drm->dev)
>  		drm_dev_put(drm->dev);
>  
> +	nvif_mmu_dtor(&drm->mmu);
>  	nvif_device_dtor(&drm->device);
>  	nvif_client_dtor(&drm->master.base);
>  	nvif_parent_dtor(&drm->parent);
> @@ -728,6 +716,13 @@ static struct nouveau_drm *
>  nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
>  		       struct nvkm_device *device)
>  {
> +	static const struct nvif_mclass
> +	mmus[] = {
> +		{ NVIF_CLASS_MMU_GF100, -1 },
> +		{ NVIF_CLASS_MMU_NV50 , -1 },
> +		{ NVIF_CLASS_MMU_NV04 , -1 },
> +		{}
> +	};
>  	struct nouveau_drm *drm;
>  	int ret;
>  
> @@ -757,6 +752,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>  		goto done;
>  	}
>  
> +	ret = nvif_mclass(&drm->device.object, mmus);
> +	if (ret < 0) {
> +		NV_ERROR(drm, "No supported MMU class\n");
> +		goto done;
> +	}
> +
> +	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
> +	if (ret) {
> +		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
> +		goto done;
> +	}
> +
>  	drm->dev = drm_dev_alloc(drm_driver, parent);
>  	if (IS_ERR(drm->dev)) {
>  		ret = PTR_ERR(drm->dev);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index a9e0a63c772e..2535a50b99f3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -204,6 +204,7 @@ struct nouveau_drm {
>  	struct nvkm_device *nvkm;
>  	struct nvif_parent parent;
>  	struct nvif_device device;
> +	struct nvif_mmu mmu;
>  
>  	struct nouveau_cli master;
>  	struct nouveau_cli client;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 25f31d5169e5..67f93cf753ba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -91,7 +91,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>  	struct nouveau_mem *mem = nouveau_mem(reg);
>  	struct nouveau_cli *cli = mem->cli;
>  	struct nouveau_drm *drm = cli->drm;
> -	struct nvif_mmu *mmu = &cli->mmu;
> +	struct nvif_mmu *mmu = &drm->mmu;
>  	struct nvif_mem_ram_v0 args = {};
>  	u8 type;
>  	int ret;
> @@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>  		args.dma = tt->dma_address;
>  
>  	mutex_lock(&drm->master.lock);
> -	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
> +	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
>  				 reg->size,
>  				 &args, sizeof(args), &mem->mem);
>  	mutex_unlock(&drm->master.lock);
> @@ -128,14 +128,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  	struct nouveau_mem *mem = nouveau_mem(reg);
>  	struct nouveau_cli *cli = mem->cli;
>  	struct nouveau_drm *drm = cli->drm;
> -	struct nvif_mmu *mmu = &cli->mmu;
> +	struct nvif_mmu *mmu = &drm->mmu;
>  	u64 size = ALIGN(reg->size, 1 << page);
>  	int ret;
>  
>  	mutex_lock(&drm->master.lock);
> -	switch (cli->mem->oclass) {
> +	switch (mmu->mem) {
>  	case NVIF_CLASS_MEM_GF100:
> -		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
> +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>  					 drm->ttm.type_vram, page, size,
>  					 &(struct gf100_mem_v0) {
>  						.contig = contig,
> @@ -143,7 +143,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  					 &mem->mem);
>  		break;
>  	case NVIF_CLASS_MEM_NV50:
> -		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
> +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>  					 drm->ttm.type_vram, page, size,
>  					 &(struct nv50_mem_v0) {
>  						.bankswz = mmu->kind[mem->kind] == 2,
> -- 
> 2.45.1
> 

