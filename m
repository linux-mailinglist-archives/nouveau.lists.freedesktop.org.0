Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC86872077
	for <lists+nouveau@lfdr.de>; Tue,  5 Mar 2024 14:40:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC11112AFC;
	Tue,  5 Mar 2024 13:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NfSz9unA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16465112AFC
 for <nouveau@lists.freedesktop.org>; Tue,  5 Mar 2024 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709646056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZnEToW5t7As1au0rwMSuY1nkYFxsgpWnFlldMYKeW4=;
 b=NfSz9unA4rAFpOn6BKEJDJZr1FD++oHTDWHVF+QM2X9NAXp6STMUHGNA5mvTkmh4sEUE4l
 E+JigwEdch4OCjxzOu3+BweJFFTMfxXyratlioisbn8XSwsFAe+EHryXgINmNf4bZDgwPY
 gmJlRKyWcfNZHjv3ouitvya/UJ09YyY=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-dQvFNk3EODyCz1jtswL05Q-1; Tue, 05 Mar 2024 08:40:54 -0500
X-MC-Unique: dQvFNk3EODyCz1jtswL05Q-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5dca5c631ffso5436180a12.2
 for <nouveau@lists.freedesktop.org>; Tue, 05 Mar 2024 05:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709646054; x=1710250854;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VZnEToW5t7As1au0rwMSuY1nkYFxsgpWnFlldMYKeW4=;
 b=ZUI8Qwd7BZr3ybaNlDNRvmTwGBxmlYrFnVcoaWY1I6QTNhyayISYEEeUWbQDYmgrMp
 db8bbZ9m9fteQlU9AcC6sQUiGxy8b1btpDS0TAms5yQTeH9nQXISS+AL3KrJUBaolKvy
 zCwv3H3gy043iSkuy+8ZsJKFxxtj9DvEcqOFhomNTkCNNxWhD+f3I6Zs1rREOzRYLaQl
 PCsmb/GclGw2CCM44q0WIfObDdyGCdDQWfMvsbHVu0gAkAXykkc8wZrR4OE/ahFgpwu2
 jY/vEtFeAy8a/+N/3DKfaIemUiIfL8Q0xGvy85/5TKCyE9LMCxSAFULFfL3XvH6s2wUu
 4FxQ==
X-Gm-Message-State: AOJu0Ywvfsc9TZY5M+yb/VDoRRrlD7gzf9eO91f2T373/c3rlmARBk6l
 AAHPZXfN+Lb3TY3ml0emjX1HYX4agJhiNdRWyD234ucAg7GoHJKT2fN1d3z+WKTBITFObCzyKH+
 Q3Uw5gwG8CC6tQ27LRs8Z3NlyBQapuY68gBzEiYiHcO1Lvodv3So3djyWULZ2goQ=
X-Received: by 2002:a05:6a20:cea4:b0:1a1:45b8:bba4 with SMTP id
 if36-20020a056a20cea400b001a145b8bba4mr1537446pzb.37.1709646054009; 
 Tue, 05 Mar 2024 05:40:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZZ9bEhXrO6qofCmunP2PwITI7ouZsIJbjodQXvB3Cecr0rJmvJ+jNDD8uikp00KYqrjuu6g==
X-Received: by 2002:a05:6a20:cea4:b0:1a1:45b8:bba4 with SMTP id
 if36-20020a056a20cea400b001a145b8bba4mr1537431pzb.37.1709646053643; 
 Tue, 05 Mar 2024 05:40:53 -0800 (PST)
Received: from [10.200.68.248] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 a13-20020aa78e8d000000b006e558416202sm9236593pfr.148.2024.03.05.05.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 05:40:53 -0800 (PST)
Message-ID: <fbe9453d-53c5-44d1-a478-2496c5928603@redhat.com>
Date: Tue, 5 Mar 2024 14:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/dmem: handle kcalloc() allocation failure
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, airlied@gmail.com, lyude@redhat.com, kherbst@redhat.com,
 linux-kernel@vger.kernel.org
References: <20240303075312.56349-1-duoming@zju.edu.cn>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240303075312.56349-1-duoming@zju.edu.cn>
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

Hi Duoming,

On 3/3/24 08:53, Duoming Zhou wrote:
> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
> the physical memory has run out. As a result, if we dereference
> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
> will happen.
> 
> This patch uses stack variables to replace the kcalloc().
> 
> Fixes: 249881232e14 ("nouveau/dmem: evict device private memory during release")
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 12feecf71e7..9a578262c6d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -374,13 +374,13 @@ static void
>   nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   {
>   	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
> -	unsigned long *src_pfns, *dst_pfns;
> -	dma_addr_t *dma_addrs;
> +	unsigned long src_pfns[npages], dst_pfns[npages];
> +	dma_addr_t dma_addrs[npages];

Please don't use variable length arrays, this can potentially blow up
the stack.

As a fix I think we should allocate with __GFP_NOFAIL instead.

- Danilo

>   	struct nouveau_fence *fence;
>   
> -	src_pfns = kcalloc(npages, sizeof(*src_pfns), GFP_KERNEL);
> -	dst_pfns = kcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL);
> -	dma_addrs = kcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL);
> +	memset(src_pfns, 0, npages);
> +	memset(dst_pfns, 0, npages);
> +	memset(dma_addrs, 0, npages);
>   
>   	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
>   			npages);
> @@ -406,11 +406,8 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
>   	migrate_device_pages(src_pfns, dst_pfns, npages);
>   	nouveau_dmem_fence_done(&fence);
>   	migrate_device_finalize(src_pfns, dst_pfns, npages);
> -	kfree(src_pfns);
> -	kfree(dst_pfns);
>   	for (i = 0; i < npages; i++)
>   		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
> -	kfree(dma_addrs);
>   }
>   
>   void

