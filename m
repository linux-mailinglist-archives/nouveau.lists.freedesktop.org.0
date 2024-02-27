Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C621E8697A1
	for <lists+nouveau@lfdr.de>; Tue, 27 Feb 2024 15:23:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997A310E589;
	Tue, 27 Feb 2024 14:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IMfEXCog";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB9410E3E4
 for <nouveau@lists.freedesktop.org>; Tue, 27 Feb 2024 14:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709043811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PbrLUb1pCrsKDksK2gdv2zkqBING2ANpTJe1rjV7IlE=;
 b=IMfEXCogQdhczXlDwpDam9x2LroKc1Wz0IkvaocsABRcWPu/B64V7Wf/vi1WMZ92EU0cXG
 xK2FeRSePG+Pb+RysFTjSeWzqgAUxEllHO9Vyu/Jm4WXRUhlIXxPzCiUW2vX7SbJHPG7EC
 5leqABjUd2a7+afOm1mXvDjN3tYSfDc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-p4NKPi1dPrmfiLx8i5Sr8Q-1; Tue, 27 Feb 2024 09:23:28 -0500
X-MC-Unique: p4NKPi1dPrmfiLx8i5Sr8Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-42e7b7fe5b4so41751821cf.1
 for <nouveau@lists.freedesktop.org>; Tue, 27 Feb 2024 06:23:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709043808; x=1709648608;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PbrLUb1pCrsKDksK2gdv2zkqBING2ANpTJe1rjV7IlE=;
 b=XjdSfIUzKn2QecA/dgVIMxD6bVUZIz8fa8ZAQOtkjwD3F504MiSa32cNxBeHSqKVAr
 Yqp6m90ZX2AHaRKuAzz5N2UAWeggg8ELwSsP3YL1l4IagAoOv7boiPxLXBqGYPYiTeD6
 VC3RZGkVZeTfH7EMk5QMRsI2PbaCbeDGSuoHxUKXXPK4Dlp4wV14pPsZbEHvnnr4Igl2
 Jdy824v74hB0j9YjB5HQGb+ZI7X7uwDCDo59WZj+qdrgLmAHEHXcHUfCff9ZyJxwIrNA
 m2wQhkilBaV3frJnwP8uw9ZeANlo4W26OC0s5/kvoTy2/Z6rVRHWp2LMauBre+7YBGzx
 pzQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsMzQ2aLegU7bM9lSmiQjBiT0w6A06aQlYezIwyG4eU37MbVlzw59UZl5+auHcy+xPLRgZmjpEljg/CbQXq+27H1s2HYwo3c6aZR3FJw==
X-Gm-Message-State: AOJu0YwM7fzaY91hr8XlTJ8GgKGRJgQACc2IOLy8NOkykyxphnmoGCrG
 80NV4G42g4P5CKJwfTGb+ciwWbDGwjTlsiU1o5laprtYq/CuoBIGifBR3QsEnwepfR2nWgFP8xL
 Zz7SaBUz19pZaTBT2heMeYEFBgPWdNvapaNIXbhAKgxM5QpFUS2HIaVC0OvWzHK4=
X-Received: by 2002:a05:622a:1c8:b0:42e:80d5:2c56 with SMTP id
 t8-20020a05622a01c800b0042e80d52c56mr10836035qtw.6.1709043807967; 
 Tue, 27 Feb 2024 06:23:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2kfdSWfJvywMN8Fr/apUkb+7Ir5L2BO3SJoaxEMEOaHXGPDHTqeoseNQH84EyumQ/fQRX7g==
X-Received: by 2002:a05:622a:1c8:b0:42e:80d5:2c56 with SMTP id
 t8-20020a05622a01c800b0042e80d52c56mr10836005qtw.6.1709043807614; 
 Tue, 27 Feb 2024 06:23:27 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 jv2-20020a05622aa08200b0042e2002ed12sm3601655qtb.57.2024.02.27.06.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 06:23:27 -0800 (PST)
Message-ID: <9ede5589-cc59-4bf7-8b53-77f9a2638a70@redhat.com>
Date: Tue, 27 Feb 2024 15:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: retain device pointer in nvkm_gsp_mem object
To: Timur Tabi <ttabi@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
References: <20240226210408.4022992-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240226210408.4022992-1-ttabi@nvidia.com>
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

Hi Timur,

On 2/26/24 22:04, Timur Tabi wrote:
> Store the struct device pointer used to allocate the DMA buffer in
> the nvkm_gsp_mem object.  This allows nvkm_gsp_mem_dtor() to release
> the buffer without needing the nvkm_gsp.  This is needed so that
> we can retain DMA buffers even after the nvkm_gsp object is deleted.

Considering "[v4][RFC] drm/nouveau: expose GSP-RM logging buffers via
debugfs", I don't see where this one is needed.

Do I miss anything?

- Danilo

> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 30 ++++++++++---------
>   2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 3fbc57b16a05..a9be0d86e412 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -9,6 +9,7 @@
>   #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>   
>   struct nvkm_gsp_mem {
> +	struct device *dev;
>   	size_t size;
>   	void *data;
>   	dma_addr_t addr;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 40757a21e150..1eb1bc5df39a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1000,7 +1000,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
>   }
>   
>   static void
> -nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
> +nvkm_gsp_mem_dtor(struct nvkm_gsp_mem *mem)
>   {
>   	if (mem->data) {
>   		/*
> @@ -1009,7 +1009,7 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
>   		 */
>   		memset(mem->data, 0xFF, mem->size);
>   
> -		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
> +		dma_free_coherent(mem->dev, mem->size, mem->data, mem->addr);
>   		memset(mem, 0, sizeof(*mem));
>   	}
>   }
> @@ -1017,11 +1017,13 @@ nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
>   static int
>   nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
>   {
> -	mem->size = size;
>   	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
>   	if (WARN_ON(!mem->data))
>   		return -ENOMEM;
>   
> +	mem->size = size;
> +	mem->dev = gsp->subdev.device->dev;
> +
>   	return 0;
>   }
>   
> @@ -1054,10 +1056,10 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
>   	nvkm_wr32(device, 0x110004, 0x00000040);
>   
>   	/* Release the DMA buffers that were needed only for boot and init */
> -	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
> +	nvkm_gsp_mem_dtor(&gsp->boot.fw);
> +	nvkm_gsp_mem_dtor(&gsp->libos);
> +	nvkm_gsp_mem_dtor(&gsp->rmargs);
> +	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
>   
>   	return ret;
>   }
> @@ -2249,7 +2251,7 @@ static void
>   nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
>   {
>   	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--)
> -		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
> +		nvkm_gsp_mem_dtor(&rx3->mem[i]);
>   }
>   
>   /**
> @@ -2407,7 +2409,7 @@ r535_gsp_init(struct nvkm_gsp *gsp)
>   
>   done:
>   	if (gsp->sr.meta.data) {
> -		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
> +		nvkm_gsp_mem_dtor(&gsp->sr.meta);
>   		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
>   		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
>   		return ret;
> @@ -2488,7 +2490,7 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>   	mutex_destroy(&gsp->client_id.mutex);
>   
>   	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
> +	nvkm_gsp_mem_dtor(&gsp->sig);
>   	nvkm_firmware_dtor(&gsp->fw);
>   
>   	nvkm_falcon_fw_dtor(&gsp->booter.unload);
> @@ -2499,10 +2501,10 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>   
>   	r535_gsp_dtor_fws(gsp);
>   
> -	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> -	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
> +	nvkm_gsp_mem_dtor(&gsp->shm.mem);
> +	nvkm_gsp_mem_dtor(&gsp->loginit);
> +	nvkm_gsp_mem_dtor(&gsp->logintr);
> +	nvkm_gsp_mem_dtor(&gsp->logrm);
>   }
>   
>   int

