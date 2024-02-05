Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017184A1CF
	for <lists+nouveau@lfdr.de>; Mon,  5 Feb 2024 19:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E917A10FB7B;
	Mon,  5 Feb 2024 18:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CtOZ1KXs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF0010FB7B
 for <nouveau@lists.freedesktop.org>; Mon,  5 Feb 2024 18:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707156497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+srA/srYifSBpY5BtOmDgNLYwcZl3e6ChqErA8Pz/c=;
 b=CtOZ1KXsm55vYAcOrZqd1iZgqXMYdHLiBDet4JbHGCFZTZNvncSMU7r6tm9OI3UlVMsZrV
 ucvdVLwhtnui/9DP89KLzywyz6iUVxx/T/pTUvRNHYhAhxJqwVXalyWOKPUBFwBZXzTSHg
 SMPbQBns0cYtU2gxeFS7IdFseXk9XM4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-8OwLYmEIPVaMyiyRTr-FvA-1; Mon, 05 Feb 2024 13:08:16 -0500
X-MC-Unique: 8OwLYmEIPVaMyiyRTr-FvA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33b2949d6b3so1014664f8f.0
 for <nouveau@lists.freedesktop.org>; Mon, 05 Feb 2024 10:08:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707156495; x=1707761295;
 h=content-transfer-encoding:in-reply-to:organization:from:cc
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+srA/srYifSBpY5BtOmDgNLYwcZl3e6ChqErA8Pz/c=;
 b=mWm3rS6OJRYgc/wKC+SP1+UC7SyLvNgM/pkBTRZEe4MiyE6fUAz7L205sg+SPk1yC2
 WbChGhMsEtJmGHIQQphQeFgQE4P6tm7MCl+GktlfSiXU+GRDjjj6tRGkT3mQP1FeDoLy
 YhnSbC1nWOoOJtwWxa7C0ccuYpL1JbcN8KMC93sb3y55JXo86f7S3ycJAQNo2Xv1Z1Ou
 MDv5YcFC3CZX64AFl1ch1L4PITl7Wrgx+WYYogo8MLUEAg9G/HxNNaZCWwbKJHzsD2lP
 qI3ZYswXAXLWvdeha9ibpGFFAEJ3vbtdroQyqoiwGPFWbZ6T0ziEA2DK4iDjObCOp9G1
 hZEg==
X-Gm-Message-State: AOJu0Yy7T0wjPPloIphCYbUdTWcPU8ag2EjDQ4spWlI4YXTmwk/R7fIg
 S3g20RBIcZUzP102D6QsQoWzPoyeHLeDGzStAl7aN1mCerbxq0sqKaXRamHWmAEzOcbci9hd05X
 wxa+zcNsh7Hkm9OakrAgjXPmF2OCa7zCpvrS0ra+pIbbZ9ae0xSsdGRJP4nlSoM+8RY2YoCg=
X-Received: by 2002:a05:6000:1f07:b0:33b:304a:cf90 with SMTP id
 bv7-20020a0560001f0700b0033b304acf90mr6794629wrb.2.1707156495272; 
 Mon, 05 Feb 2024 10:08:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmQbdHpz6On0UIPHOL1CH80vHcrMjV8QVUb2QKTI7cGP1DpmS8CikLv7CVVLO13p1qPm/Fyg==
X-Received: by 2002:a05:6000:1f07:b0:33b:304a:cf90 with SMTP id
 bv7-20020a0560001f0700b0033b304acf90mr6794612wrb.2.1707156494828; 
 Mon, 05 Feb 2024 10:08:14 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCW2W0PAxU0BLd2Sbimy/e8mKxU6JmhohLOPwq2i+9bvs91L/YbpnuPp47BKKCBJQLgSimMXOIaeIJEL5fLFbYaehHaZDzFpi2ZpJ0ITAA==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c1c0d00b0040fb0bf6abesm551822wms.29.2024.02.05.10.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 10:08:14 -0800 (PST)
Message-ID: <4bcf8896-7adb-406f-a6aa-dfa990afbfdb@redhat.com>
Date: Mon, 5 Feb 2024 19:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] [v3] drm/nouveau: fix several DMA buffer leaks
To: Timur Tabi <ttabi@nvidia.com>
References: <20240202230608.1981026-1-ttabi@nvidia.com>
Cc: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240202230608.1981026-1-ttabi@nvidia.com>
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

On 2/3/24 00:06, Timur Tabi wrote:
> Nouveau manages GSP-RM DMA buffers with nvkm_gsp_mem objects.  Several of
> these buffers are never dealloced.  Some of them can be deallocated
> right after GSP-RM is initialized, but the rest need to stay until the
> driver unloads.
> 
> Also futher bullet-proof these objects by poisoning the buffer and
> clearing the nvkm_gsp_mem object when it is deallocated.  Poisoning
> the buffer should trigger an error (or crash) from GSP-RM if it tries
> to access the buffer after we've deallocated it, because we were wrong
> about when it is safe to deallocate.
> 
> Finally, change the mem->size field to a size_t because that's the same
> type that dma_alloc_coherent expects.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Series applied to drm-misc-fixes, thanks!

> ---
> v3: use size_t
> v2: add buffer poisoning
> 
>   .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  2 +-
>   .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 59 ++++++++++++-------
>   2 files changed, 39 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 5c6b8536e31c..3fbc57b16a05 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -9,7 +9,7 @@
>   #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
>   
>   struct nvkm_gsp_mem {
> -	u32 size;
> +	size_t size;
>   	void *data;
>   	dma_addr_t addr;
>   };
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index 17fc429ee50b..a9030eb83b4d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -999,6 +999,32 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
>   	return 0;
>   }
>   
> +static void
> +nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
> +{
> +	if (mem->data) {
> +		/*
> +		 * Poison the buffer to catch any unexpected access from
> +		 * GSP-RM if the buffer was prematurely freed.
> +		 */
> +		memset(mem->data, 0xFF, mem->size);
> +
> +		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
> +		memset(mem, 0, sizeof(*mem));
> +	}
> +}
> +
> +static int
> +nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, size_t size, struct nvkm_gsp_mem *mem)
> +{
> +	mem->size = size;
> +	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
> +	if (WARN_ON(!mem->data))
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>   static int
>   r535_gsp_postinit(struct nvkm_gsp *gsp)
>   {
> @@ -1026,6 +1052,13 @@ r535_gsp_postinit(struct nvkm_gsp *gsp)
>   
>   	nvkm_inth_allow(&gsp->subdev.inth);
>   	nvkm_wr32(device, 0x110004, 0x00000040);
> +
> +	/* Release the DMA buffers that were needed only for boot and init */
> +	nvkm_gsp_mem_dtor(gsp, &gsp->boot.fw);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->libos);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->rmargs);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->wpr_meta);
> +
>   	return ret;
>   }
>   
> @@ -1760,27 +1793,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
>   	return 0;
>   }
>   
> -static void
> -nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
> -{
> -	if (mem->data) {
> -		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
> -		mem->data = NULL;
> -	}
> -}
> -
> -static int
> -nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
> -{
> -	mem->size = size;
> -	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
> -	if (WARN_ON(!mem->data))
> -		return -ENOMEM;
> -
> -	return 0;
> -}
> -
> -
>   static int
>   r535_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
>   {
> @@ -2378,6 +2390,11 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
>   	mutex_destroy(&gsp->cmdq.mutex);
>   
>   	r535_gsp_dtor_fws(gsp);
> +
> +	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
> +	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
>   }
>   
>   int

