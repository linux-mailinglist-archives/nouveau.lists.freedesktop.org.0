Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC1090B86F
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2024 19:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF010E47D;
	Mon, 17 Jun 2024 17:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="daJqNTzG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9352710E47D
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718646528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VWwWGuYYpy1Zyv2/cJDM32Xhne0vp4u1M4bIgV9w6DQ=;
 b=daJqNTzGuZfsAMBbt6fyUOPXYwCxLVe2nPGjsRh7xx2QXXRGqIhl31JGMmSUc8KvjdohLo
 yma+mKibQc1FWLET/80T2AF8Yojn1w0uer3fjX8lN+nRzkpW3wWVrx2qUwtgQldPpYsOhi
 Zkyu8uN5To4nBFWoWbqum8JLigkGHpM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-61-djMMMUW8OE6P43oIeObwVQ-1; Mon, 17 Jun 2024 13:48:47 -0400
X-MC-Unique: djMMMUW8OE6P43oIeObwVQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42117a61bccso33568105e9.0
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 10:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718646526; x=1719251326;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VWwWGuYYpy1Zyv2/cJDM32Xhne0vp4u1M4bIgV9w6DQ=;
 b=RYIY15WBqIV5TKBdP7m5J0v54U3cbS8YnLN/rY4aG8CtutXLY6JpnNI62ydsi8lc5S
 Nfw148/Mh4g7TgeaUc6DWoIvljYqYvNsuOpZJA8M8msDQfD8Mpx085QxhfPWEfRzdk5S
 mIlLlzTEWdgKgSxuXkPFss+ML+/DIZ85TIOn4VzzreV152X25lgTrRReDDolXphDuky8
 7oD78oHW2JOtOjApTuIpcIcmNASNpOfy0TS8TVl2h8/4aJRj0QHJkEkWxV65GTCn9SpM
 vvrYL2uxgdzzUbzyXn9lazJR7xm06Tb3vpM64HVSVy7kbv1Xf+9d5fcxksRO3AGnDibW
 +EWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3cmQiS4Fba3dMP0UFr2NeVpVqy1HmpLkJK44a0a4vMB1M+a9tjbICD9qvbTTQZ0HIdtGNg/NJEKlfnMnwpKWl3jzkl7D6iovti9npfw==
X-Gm-Message-State: AOJu0YyxLopm49+nelBIGWvvG5x0grj/jKDrhn8o6nO8wGjZyJaKg8sx
 oXBViIMbnkoPn0tQaT+fGG+o/dNW8T412HMcIogtZsK+rjsV6dpoqpF9CpG5kDBw1FLHRbl2V6c
 D7IbWXKx1W4rr3Ch1Dn5N2keFbZThgOGqF9Bd5l7QnzjDPo0QJaupkULkDj1c7EPY1rh+7UU=
X-Received: by 2002:a05:600c:4fcc:b0:422:1163:44aa with SMTP id
 5b1f17b1804b1-42304823251mr92305705e9.4.1718646525877; 
 Mon, 17 Jun 2024 10:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNM2bzbAbXDc822PBTbWYT01ojAmibnMInZnzxXcxs/onBldp5JyZRSqFGqLQ9GSPKv0WQFg==
X-Received: by 2002:a05:600c:4fcc:b0:422:1163:44aa with SMTP id
 5b1f17b1804b1-42304823251mr92305585e9.4.1718646525505; 
 Mon, 17 Jun 2024 10:48:45 -0700 (PDT)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f6419e38sm167763705e9.39.2024.06.17.10.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:48:45 -0700 (PDT)
Date: Mon, 17 Jun 2024 19:48:43 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, bskeggs@nvidia.com,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH 1/2] [v2] drm/nouveau: retain device pointer in
 nvkm_gsp_mem object
Message-ID: <ZnB2-3UIAq-aTLpG@cassiopeiae>
References: <20240612235253.1624004-1-ttabi@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240612235253.1624004-1-ttabi@nvidia.com>
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

On Wed, Jun 12, 2024 at 06:52:52PM -0500, Timur Tabi wrote:
> Store the struct device pointer used to allocate the DMA buffer in
> the nvkm_gsp_mem object.  This allows nvkm_gsp_mem_dtor() to release
> the buffer without needing the nvkm_gsp.  This is needed so that
> we can retain DMA buffers even after the nvkm_gsp object is deleted.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
> v2: rebased to drm-misc-next
> 
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 36 ++++++++++---------
>  2 files changed, 20 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 9e6f39912368..a45a4ad843b9 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -9,6 +9,7 @@
>  #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>  
>  struct nvkm_gsp_mem {
> +	struct device *dev;
>  	size_t size;
>  	void *data;
>  	dma_addr_t addr;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index cf58f9da9139..bbab6d452aa2 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1000,7 +1000,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
>  }
>  
>  static void
> -nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
> +nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
>  {
>  	if (mem->data) {
>  		/*
> @@ -1009,7 +1009,7 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
>  		 */
>  		memset(mem->data, 0xFF, mem->size);
>  
> -		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
> +		dma_free_coherent(mem->dev, mem->size, mem->data, mem->addr);
>  		memset(mem, 0, sizeof(*mem));
>  	}
>  }
> @@ -1017,11 +1017,13 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
>  static int
>  nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
>  {
> -	mem->size = size;
>  	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
>  	if (WARN_ON(!mem->data))
>  		return -ENOMEM;
>  
> +	mem->size = size;
> +	mem->dev = gsp->subdev.device->dev;

If this can potentially out-live the drivers remove() callback, we have to take
a device reference here and drop it in nvkm_gsp_mem_dtor().

	mem->dev = get_device(gsp->subdev.device->dev);

> +
>  	return 0;
>  }
>  
> @@ -1054,8 +1056,8 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
>  	nvkm_wr32(device, 0x110004, 0x00000040);
>  
>  	/* Release the DMA buffers that were needed only for boot and init */
> -	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
> +	nvkm_gsp_mem_dtor(&gsp->boot.fw);
> +	nvkm_gsp_mem_dtor(&gsp->libos);
>  
>  	return ret;
>  }
> @@ -2234,8 +2236,8 @@ static void
>  nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
>  {
>  	nvkm_gsp_sg_free(gsp->subdev.device, &rx3->lvl2);
> -	nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
> -	nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
> +	nvkm_gsp_mem_dtor(&rx3->lvl1);
> +	nvkm_gsp_mem_dtor(&rx3->lvl0);
>  }
>  
>  /**
> @@ -2323,9 +2325,9 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
>  
>  	if (ret) {
>  lvl2_fail:
> -		nvkm_gsp_mem_dtor(gsp, &rx3->lvl1);
> +		nvkm_gsp_mem_dtor(&rx3->lvl1);
>  lvl1_fail:
> -		nvkm_gsp_mem_dtor(gsp, &rx3->lvl0);
> +		nvkm_gsp_mem_dtor(&rx3->lvl0);
>  	}
>  
>  	return ret;
> @@ -2417,7 +2419,7 @@ r535_gsp_init(struct nvkm_gsp *gsp)
>  
>  done:
>  	if (gsp->sr.meta.data) {
> -		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
> +		nvkm_gsp_mem_dtor(&gsp->sr.meta);
>  		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
>  		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
>  		return ret;
> @@ -2498,7 +2500,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>  	mutex_destroy(&gsp->client_id.mutex);
>  
>  	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
> +	nvkm_gsp_mem_dtor(&gsp->sig);
>  	nvkm_firmware_dtor(&gsp->fw);
>  
>  	nvkm_falcon_fw_dtor(&gsp->booter.unload);
> @@ -2509,12 +2511,12 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>  
>  	r535_gsp_dtor_fws(gsp);
>  
> -	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
> +	nvkm_gsp_mem_dtor(&gsp->rmargs);
> +	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
> +	nvkm_gsp_mem_dtor(&gsp->shm.mem);
> +	nvkm_gsp_mem_dtor(&gsp->loginit);
> +	nvkm_gsp_mem_dtor(&gsp->logintr);
> +	nvkm_gsp_mem_dtor(&gsp->logrm);
>  }
>  
>  int
> 
> base-commit: a13aaf157467e694a3824d81304106b58d4c20d6
> prerequisite-patch-id: 1428f57d0b137672ec09da08e76c5d3069b35432
> -- 
> 2.34.1
> 

