Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AD18906CA
	for <lists+nouveau@lfdr.de>; Thu, 28 Mar 2024 18:08:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A308D89F35;
	Thu, 28 Mar 2024 17:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IPk+e/Bw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4834410E4E4
 for <nouveau@lists.freedesktop.org>; Thu, 28 Mar 2024 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711645682;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5P9kc8AeNy7Pb1W4UwkpUGNPJcYVPgnE+JYjej0DV/M=;
 b=IPk+e/BwqlPedap7c5hVpSDYMfkhuSPkJG+JhAZ90lf6uk15U7qqyNZrteNXlcgeefBAXb
 9bxv2aYwy151SVCLITApyRHM/vpSlzOE0jclfamhqyFlBeJKJi0r0Pd02zr2APIUydFow+
 eY0efQW0jutU3FOLD/J82y8STvI1F4k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-ymDwVNm4Ojyt9txs2wlNrw-1; Thu, 28 Mar 2024 13:08:00 -0400
X-MC-Unique: ymDwVNm4Ojyt9txs2wlNrw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-33eca6f6e4bso765145f8f.0
 for <nouveau@lists.freedesktop.org>; Thu, 28 Mar 2024 10:07:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711645679; x=1712250479;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5P9kc8AeNy7Pb1W4UwkpUGNPJcYVPgnE+JYjej0DV/M=;
 b=sBMYyMfYB8FbeL+BqxdN10ufo+Z3eAIiuvOCC93/j+Ql99wIcEpa0nWzBE2U1RjADU
 vM3AMRY0n7aExruViqV1vzMiBY/JXYcxG1h1SxhGGVIWtziQLFH63H8iFUMqSuqVeMD7
 mqHEgRRoryikMas8mC0PvOQ2Pq/+B3zBc8YP/vEkD1MmVF1POnbv94R8Z8CEy6NmISF3
 OpqGNwnuduRT781RLYuK070/lU/0C9hYSLDTwtIse1Nj195hU4v+j3S5DuA4Uz5GE1nH
 VD8CVzAFIildjn9I4fLE3/IHNSfAejAJOzApjwhzJlTPM7WJjryytMFN5bcEjBNuEGIw
 +aig==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHdjzhkh3SQamKPPybCZDhQOaMHTrGuaXBQ1ryZ9PyJrOaga9LQbK8FKcZCzMy+inoE8i717FFMq1fLJrtRUC5OJIFBpwcZeFOk9tP+Q==
X-Gm-Message-State: AOJu0YxQe5WUHpiP3elRquplq71oSejssYEX1Qg+6j0gTxRKRhIW+KpH
 KwBGu+GukoKKqH98Q1674AQHuU4ZozXngfWMYpdQelY52Z02iWjCIn1afggaJnfFECrw2nlrpUa
 /E/HcTGGWlEe7Ux5zNMysSBQK5AYUEHrdSS2rX6aiq/F2B42tJnYJFpn6RWIl9BY=
X-Received: by 2002:a5d:568d:0:b0:341:90ec:c317 with SMTP id
 f13-20020a5d568d000000b0034190ecc317mr2649887wrv.63.1711645679073; 
 Thu, 28 Mar 2024 10:07:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0kCaWOgFqSkjDwOuZqLVH1dZGXlR4PgILPsTnPkro8qeZaiPDnYX63V0xNlrPUDMQT0nqMA==
X-Received: by 2002:a5d:568d:0:b0:341:90ec:c317 with SMTP id
 f13-20020a5d568d000000b0034190ecc317mr2649872wrv.63.1711645678706; 
 Thu, 28 Mar 2024 10:07:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a056000008a00b0033ec91c9eadsm2209121wrx.53.2024.03.28.10.07.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 10:07:58 -0700 (PDT)
Message-ID: <b55be4df-9541-4bbd-8b9e-26f6b48a3dd8@redhat.com>
Date: Thu, 28 Mar 2024 18:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/uvmm: fix addr/range calcs for remap operations
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>
References: <20240328024317.2041851-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240328024317.2041851-1-airlied@gmail.com>
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

On 3/28/24 03:43, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> dEQP-VK.sparse_resources.image_rebind.2d_array.r64i.128_128_8
> was causing a remap operation like the below.
> 
> op_remap: prev: 0000003fffed0000 00000000000f0000 00000000a5abd18a 0000000000000000
> op_remap: next:
> op_remap: unmap: 0000003fffed0000 0000000000100000 0
> op_map: map: 0000003ffffc0000 0000000000010000 000000005b1ba33c 00000000000e0000
> 
> This was resulting in an unmap operation from 0x3fffed0000+0xf0000, 0x100000
> which was corrupting the pagetables and oopsing the kernel.

Good catch, thanks for looking into that.

> 
> Fixes the prev + unmap range calcs to use start/end and map back to addr/range.

I like how using start/end instead fixes the issue and keeps it simple.

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> Fixes: b88baab82871 ("drm/nouveau: implement new VM_BIND uAPI")
> Cc: Danilo Krummrich <dakr@redhat.com>

Applied the patch to drm-misc-fixes.

> ---
>   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> index 9675ef25b16d..87bce1a9d073 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -813,15 +813,15 @@ op_remap(struct drm_gpuva_op_remap *r,
>   	struct drm_gpuva_op_unmap *u = r->unmap;
>   	struct nouveau_uvma *uvma = uvma_from_va(u->va);
>   	u64 addr = uvma->va.va.addr;
> -	u64 range = uvma->va.va.range;
> +	u64 end = uvma->va.va.addr + uvma->va.va.range;
>   
>   	if (r->prev)
>   		addr = r->prev->va.addr + r->prev->va.range;
>   
>   	if (r->next)
> -		range = r->next->va.addr - addr;
> +		end = r->next->va.addr;
>   
> -	op_unmap_range(u, addr, range);
> +	op_unmap_range(u, addr, end - addr);
>   }
>   
>   static int

