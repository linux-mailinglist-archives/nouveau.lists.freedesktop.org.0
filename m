Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544B8768BB
	for <lists+nouveau@lfdr.de>; Fri,  8 Mar 2024 17:45:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F0510EAA7;
	Fri,  8 Mar 2024 16:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E6V4gDSU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A319C10EAA7
 for <nouveau@lists.freedesktop.org>; Fri,  8 Mar 2024 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709916337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=534u/67YBq7t7mIqXOVTlZcmBGl/1NW7WJ5BcOAUIpI=;
 b=E6V4gDSUEDRcPdFI4nvpzfIYRTFGdmXL0gZJvfs7R8AjP4z3ORuC/z6jupS399imSkEnE0
 Y855IEQ7VSH9djN9IX9QVOdr4iv+tBhQhrxpGAs5jtRUfucWDDzWapRkCcd2gdVRZRVAhn
 1pLrCNCCSmOMS4gu9UjsmRDuX4Gw7Lk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-8E4Kc-7VPV2cmyb7O6Ea0Q-1; Fri, 08 Mar 2024 11:45:36 -0500
X-MC-Unique: 8E4Kc-7VPV2cmyb7O6Ea0Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a448cfe2266so177067466b.2
 for <nouveau@lists.freedesktop.org>; Fri, 08 Mar 2024 08:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709916334; x=1710521134;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=534u/67YBq7t7mIqXOVTlZcmBGl/1NW7WJ5BcOAUIpI=;
 b=BHDC8eZ1lAc4iBDTt5GWSLubcI9nPMAlYEezhx+CZcD3ar2qend6y9V9XZIIN1xJei
 L4xED0uGjGnnf44iVUBa0xygsnpfyzSarizzq7usOJJ6RlM/4SVWcvSbENoGI2L2lF87
 +qzL4WlFvsJVJAvu923xrBPUmvf59LA26AEoD52Tq0m5GgDjUahjeuLgPra7olBt15vH
 wrJLWbChWNzxIW1bpSWttVs6VWaUENzaDdRr91WKRXRC8Hz6kxteHbDQia/cTqU2YJIE
 iT18yKkTEYoehNexhG4kGC0NH4pY5bryXcXKXPXLTMJ9xIC4mpfDXAn/sNeX0rf05z4f
 ufJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8GY8wJX7BqQR/LPwxkxDptroJTshVqNSkPCVhSdM48dRdT1pak16/IojBx6GtuiSwew07m1l3ntAfnP6DhIU10uzcX46lwVRDy4UqXg==
X-Gm-Message-State: AOJu0Yzs/0QeZ4P1GPbyNVOdxZjgVSI+4CBHXMPqhILuTENCLV1YjFr0
 tvFElDNydqH2ZxoLSpbGRritc5I0TZcSAwy82O6RNXwyIWYYPjrsZcZ8WGEe5/MXNvajGMfJmpJ
 Q6CJSfBiMAeJMdqUnmpaq8/vqdNNCQYfK5YMI6KtX5GrB+sLFGNlPb/lc64Jlx/uMVuXi9Aw=
X-Received: by 2002:a17:907:d301:b0:a45:f4d9:d911 with SMTP id
 vg1-20020a170907d30100b00a45f4d9d911mr1172170ejc.34.1709916334728; 
 Fri, 08 Mar 2024 08:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEn7ZndBGszHKq0H8y6c/T3rs7VSPm+fqpniPAcpA1gNnmrOtVIRBYfNM3Sudcp2tOC29DwLw==
X-Received: by 2002:a17:907:d301:b0:a45:f4d9:d911 with SMTP id
 vg1-20020a170907d30100b00a45f4d9d911mr1172156ejc.34.1709916334330; 
 Fri, 08 Mar 2024 08:45:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a170906119200b00a45e04e3ebdsm1409444eja.83.2024.03.08.08.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 08:45:33 -0800 (PST)
Message-ID: <fc80adaa-3bbc-4331-abd3-3cfbff9b3dcd@redhat.com>
Date: Fri, 8 Mar 2024 17:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] nouveau/dmem: handle kcalloc() allocation failure
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, lyude@redhat.com, kherbst@redhat.com,
 timur@kernel.org, jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org
References: <20240306050104.11259-1-duoming@zju.edu.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240306050104.11259-1-duoming@zju.edu.cn>
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

On 3/6/24 06:01, Duoming Zhou wrote:
> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
> the physical memory has run out. As a result, if we dereference
> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
> will happen.
> 
> Moreover, the GPU is going away. If the kcalloc() fails, we could not
> evict all pages mapping a chunk. So this patch adds a __GFP_NOFAIL
> flag in kcalloc().
> 
> Finally, as there is no need to have physically contiguous memory,
> this patch switches kcalloc() to kvcalloc() in order to avoid
> failing allocations.
> 
> Fixes: 249881232e14 ("nouveau/dmem: evict device private memory during release")
> Suggested-by: Danilo Krummrich <dakr@redhat.com>
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

Applied to drm-misc-fixes, thanks!

> ---
> Changes in v3:
>    - Switch kcalloc() to kvcalloc().
> 
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 12feecf71e7..6fb65b01d77 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -378,9 +378,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   	dma_addr_t *dma_addrs;
>   	struct nouveau_fence *fence;
>   
> -	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> -	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> -	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
> +	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
> +	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
> +	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
>   
>   	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
>   			npages);
> @@ -406,11 +406,11 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   	migrate_device_pages(src_pfns, dst_pfns, npages);
>   	nouveau_dmem_fence_done(&fence);
>   	migrate_device_finalize(src_pfns, dst_pfns, npages);
> -	kfree(src_pfns);
> -	kfree(dst_pfns);
> +	kvfree(src_pfns);
> +	kvfree(dst_pfns);
>   	for (i = 0; i < npages; i++)
>   		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
> -	kfree(dma_addrs);
> +	kvfree(dma_addrs);
>   }
>   
>   void

