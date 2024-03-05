Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC968719E0
	for <lists+nouveau@lfdr.de>; Tue,  5 Mar 2024 10:47:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF86D112993;
	Tue,  5 Mar 2024 09:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ODs1/xaW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820C6112984
 for <nouveau@lists.freedesktop.org>; Tue,  5 Mar 2024 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709632050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WbI5i4Q4tsI2CMeqv6RPoW9fsJnk/FBruMClWqYDOF0=;
 b=ODs1/xaWLN6ZX2JP32K/LFi6wvzsVP1ajo0VJrGXHpmb335mwtYfv1y0Cv9CV4TG3MiCyr
 E0zgummyAp9t8kIeq98JidTFP8tzd81V1Qf5kpibooKyGw8X5YXkmiVYC0FSqB4hQ+PbKz
 IEJTAuZA/j2pJGGG6iu1+knJOMoJzWc=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-oz6bfjdaOMS36t8OYwU4OA-1; Tue, 05 Mar 2024 04:47:29 -0500
X-MC-Unique: oz6bfjdaOMS36t8OYwU4OA-1
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-36516d55c5fso62760945ab.2
 for <nouveau@lists.freedesktop.org>; Tue, 05 Mar 2024 01:47:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709632048; x=1710236848;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WbI5i4Q4tsI2CMeqv6RPoW9fsJnk/FBruMClWqYDOF0=;
 b=cWcaRzhRJofdxqUakOnfPxnT5ufqAD7Beo0u67HgzJZ51Bvn3FIy4wkgEk7CakJqiS
 eYjfKmWb0eSpVFy3eTFVVmFSi5t7vH2+Zs8u1ns5ZVlWIpVh0Ya+qpmiM9bqrvNbKWaC
 1nEi/JWPMT7sBxQJoPTYLkhJAH5sPh5+e4vWvY8zoxfUtBs8ptq8QhUT6BuwczG69dv7
 bkBMVhvmf6rDEwgoF16X7b2Exv8BaKd3tzoRNDBF+8urq3432Gzl9UQPagqzVnjps+K4
 qUa2Y4uH64IykZ4dcBRbWjYuTkeiHNt72FqkL6MbphRFl2hMbk9cf2T63WlE6/yi7kSt
 /5rA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYXPWg+9JXRZwmwXbE1inyiLplRms1CepCrUP+B4Y/+auwCgSGMz+cFT+T3JSask6dqjnjVGCmm5ElaajHSv2Dl7XSX99/ma80Q3Rsjg==
X-Gm-Message-State: AOJu0Yz3W/v5HO4Y7HflRQxuCzwCxw3yaCwIvRhiLLpL1j0l86puNk3P
 KeL5Pregup0A9DLKzuGIJfLiBTgNap2idPs3i1dCUGSMxtxJGGUN0auIEnDW9xjOw6+Gpu52GBR
 QJhnF34CHi1qkZ/JemxKQ1lKGhXfEjlMlPGRiri9ZY80r7aAZatLTK+C6UsskfcA=
X-Received: by 2002:a05:620a:1242:b0:787:d904:c4a0 with SMTP id
 a2-20020a05620a124200b00787d904c4a0mr1202515qkl.22.1709630353356; 
 Tue, 05 Mar 2024 01:19:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR/eLfKqYtzfYee7+jBwIfv5EmSixRoxgVGr/h1uW7ijmEXZ0/siIVOehOVecT/HyGvhvi8w==
X-Received: by 2002:a05:620a:1242:b0:787:d904:c4a0 with SMTP id
 a2-20020a05620a124200b00787d904c4a0mr1202512qkl.22.1709630353047; 
 Tue, 05 Mar 2024 01:19:13 -0800 (PST)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 bp9-20020a05620a458900b0078812f8a042sm3635157qkb.90.2024.03.05.01.19.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 01:19:12 -0800 (PST)
Message-ID: <123c38bd-5b68-4f28-a218-b96fbb41f15d@redhat.com>
Date: Tue, 5 Mar 2024 10:19:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: move more missing UAPI bits
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20240304183157.1587152-1-kherbst@redhat.com>
 <20240304183157.1587152-2-kherbst@redhat.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240304183157.1587152-2-kherbst@redhat.com>
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

On 3/4/24 19:31, Karol Herbst wrote:
> Those are already de-facto UAPI, so let's just move it into the uapi
> header.
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_abi16.c | 20 +++++++++++++++-----
>   drivers/gpu/drm/nouveau/nouveau_abi16.h | 12 ------------
>   include/uapi/drm/nouveau_drm.h          | 22 ++++++++++++++++++++++
>   3 files changed, 37 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index cd14f993bdd1b..92f9127b284ac 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -312,11 +312,21 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>   	if (device->info.family >= NV_DEVICE_INFO_V0_KEPLER) {
>   		if (init->fb_ctxdma_handle == ~0) {
>   			switch (init->tt_ctxdma_handle) {
> -			case 0x01: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR    ; break;
> -			case 0x02: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC; break;
> -			case 0x04: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP ; break;
> -			case 0x08: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD ; break;
> -			case 0x30: engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE    ; break;
> +			case NOUVEAU_FIFO_ENGINE_GR:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_VP:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPDEC;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_PPP:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSPPP;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_BSP:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_MSVLD;
> +				break;
> +			case NOUVEAU_FIFO_ENGINE_CE:
> +				engine = NV_DEVICE_HOST_RUNLIST_ENGINES_CE;
> +				break;
>   			default:
>   				return nouveau_abi16_put(abi16, -ENOSYS);
>   			}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> index 11c8c4a80079b..661b901d8ecc9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
> @@ -50,18 +50,6 @@ struct drm_nouveau_grobj_alloc {
>   	int      class;
>   };
>   
> -struct drm_nouveau_notifierobj_alloc {
> -	uint32_t channel;
> -	uint32_t handle;
> -	uint32_t size;
> -	uint32_t offset;
> -};
> -
> -struct drm_nouveau_gpuobj_free {
> -	int      channel;
> -	uint32_t handle;
> -};
> -
>   struct drm_nouveau_setparam {
>   	uint64_t param;
>   	uint64_t value;
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 77d7ff0d5b110..5404d4cfff4c2 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -73,6 +73,16 @@ struct drm_nouveau_getparam {
>   	__u64 value;
>   };
>   
> +/*
> + * Those are used to support selecting the main engine used on Kepler.
> + * This goes into drm_nouveau_channel_alloc::tt_ctxdma_handle
> + */
> +#define NOUVEAU_FIFO_ENGINE_GR  0x01
> +#define NOUVEAU_FIFO_ENGINE_VP  0x02
> +#define NOUVEAU_FIFO_ENGINE_PPP 0x04
> +#define NOUVEAU_FIFO_ENGINE_BSP 0x08
> +#define NOUVEAU_FIFO_ENGINE_CE  0x30
> +
>   struct drm_nouveau_channel_alloc {
>   	__u32     fb_ctxdma_handle;
>   	__u32     tt_ctxdma_handle;
> @@ -95,6 +105,18 @@ struct drm_nouveau_channel_free {
>   	__s32 channel;
>   };
>   
> +struct drm_nouveau_notifierobj_alloc {
> +	__u32 channel;
> +	__u32 handle;
> +	__u32 size;
> +	__u32 offset;
> +};
> +
> +struct drm_nouveau_gpuobj_free {
> +	__s32 channel;
> +	__u32 handle;
> +};
> +
>   #define NOUVEAU_GEM_DOMAIN_CPU       (1 << 0)
>   #define NOUVEAU_GEM_DOMAIN_VRAM      (1 << 1)
>   #define NOUVEAU_GEM_DOMAIN_GART      (1 << 2)

