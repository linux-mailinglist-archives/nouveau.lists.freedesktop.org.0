Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B99A2845852
	for <lists+nouveau@lfdr.de>; Thu,  1 Feb 2024 13:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF9510ED3E;
	Thu,  1 Feb 2024 12:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FXKs91Z+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3510ED83
 for <nouveau@lists.freedesktop.org>; Thu,  1 Feb 2024 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706792301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j+VHQEw/AyQGOe2N2KBTNz4Hg8XQ2Kpm/53V3jvkytQ=;
 b=FXKs91Z+UNnZqu+3byvRb3ZaJTAWJ0AM8S/sT6v6jf+mjvPfwLm2It+Kf/XoLlHC1oO+N/
 pr59O/F4b1/TUicCIXr7GJgQZUBLigc4cpWfReTyUELiudeURD9a+S9xuk3gmiS+ri8q71
 mnBYGoDjhEEtZNVH1CuhR9nFcx2CgSA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-q7iqrWzePMOVZCRkPykuPQ-1; Thu, 01 Feb 2024 07:58:19 -0500
X-MC-Unique: q7iqrWzePMOVZCRkPykuPQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-55958b1a666so656745a12.0
 for <nouveau@lists.freedesktop.org>; Thu, 01 Feb 2024 04:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706792298; x=1707397098;
 h=content-transfer-encoding:in-reply-to:cc:organization:from
 :references:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j+VHQEw/AyQGOe2N2KBTNz4Hg8XQ2Kpm/53V3jvkytQ=;
 b=M52O1/YaMUmOyQ/AfiV83pHDQieT9eWwZc+mb5hbZgpmUOb2eEdl/lCuaU1VH+j+Jq
 8zOlJyGbPv+gw0/BL3idxnjMBd+BTeti1IStHgBac42HXYm08i17cHBL+/rEZu2Sx84S
 JjFfwh58ZiSyORK6FVcQaq0RJGRwHIgHnlTGxp6MPV2T61lqO2ooiXkyF1d6KVvlhlJ8
 wpQmNUvxRixQ4ImVIPZyyJyVax/kAxz4d1CNZrm/bGkl4ZO3rE4nqe3Uxi0KYjM+AUCX
 vubuaTHFKNOmDa1E7adr1JdeObhZN7BlDrcIvOteGydHiA1u6zw41Nbx62BNnkWRHEia
 wv2g==
X-Gm-Message-State: AOJu0YxNesPNYrr7eA8wYkeYSWTYIGXfya7POKbkg84cOy2Fwm1Xerwa
 L0OSI4pVmo2DPA1EeALKCJvDzgcIOh6FdQbBvF7V624uny1s2u9qggbscIhg+xtEM2sX4tqaLNP
 TBSKe4VJala72CzaTxlCD66GXo73hrTTPUxf7ZtEgWlrd60Xb3NvHN5Bpz2bVG80=
X-Received: by 2002:a05:6402:3506:b0:55f:9bb6:b205 with SMTP id
 b6-20020a056402350600b0055f9bb6b205mr2775762edd.34.1706792298452; 
 Thu, 01 Feb 2024 04:58:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfGl0b+3qc5P9vwPeiD3acm1WD1fGQNR325T4llqjM6TLmGzzP5Eh0ho+QFkdoSDpL5JUUUQ==
X-Received: by 2002:a05:6402:3506:b0:55f:9bb6:b205 with SMTP id
 b6-20020a056402350600b0055f9bb6b205mr2775744edd.34.1706792298121; 
 Thu, 01 Feb 2024 04:58:18 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWv7O7XuXoh6FdbX3J/LyGyA24iM2v6Bxip9yviwYiD5oZMyZN3K0mpLsg2l1AVH5FBDDJQ4+hJjxiJInzsI9lNuUji/S4i0rmvmimAuQ==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 fe1-20020a056402390100b005598e3d6d23sm6725413edb.16.2024.02.01.04.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 04:58:17 -0800 (PST)
Message-ID: <cf79b780-2add-438e-aac0-e29b08799314@redhat.com>
Date: Thu, 1 Feb 2024 13:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau: nouveau_sched_fini() should check for init
 failure
To: Timur Tabi <ttabi@nvidia.com>
References: <20240131213917.1545604-1-ttabi@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
Cc: Dave Airlie <airlied@redhat.com>, nouveau@lists.freedesktop.org
In-Reply-To: <20240131213917.1545604-1-ttabi@nvidia.com>
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

On 1/31/24 22:39, Timur Tabi wrote:
> If initialization fails, Nouveau can still call the _fini() function
> to clean up, with the expectation that the function can handle if its
> corresponding _init() function was never called or exited with error.
> 
> Such is not the case with nouveau_sched_fini(), which still attempts
> to wait for jobs to finish even if the underlying data structures were
> never initialized.

Good catch!

> 
> Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_sched.c | 5 +++++
>   drivers/gpu/drm/nouveau/nouveau_sched.h | 2 ++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
> index dd98f6910f9c..9c771bc0e332 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> @@ -443,6 +443,8 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
>   	INIT_LIST_HEAD(&sched->job.list.head);
>   	init_waitqueue_head(&sched->job.wq);
>   
> +	sched->initialized = true;

I wonder if we should allocate struct nouveau_sched dynamically instead and just
check for NULL in the corresponding *_fini() functions.

Actually, in nouveau_abi16_ioctl_channel_alloc() we can omit creating a scheduler
instance entirely if !nouveau_cli_uvmm().

- Danilo

> +
>   	return 0;
>   
>   fail_sched:
> @@ -459,6 +461,9 @@ nouveau_sched_fini(struct nouveau_sched *sched)
>   	struct drm_gpu_scheduler *drm_sched = &sched->base;
>   	struct drm_sched_entity *entity = &sched->entity;
>   
> +	if (!sched->initialized)
> +		return;
> +
>   	rmb(); /* for list_empty to work without lock */
>   	wait_event(sched->job.wq, list_empty(&sched->job.list.head));
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
> index a6528f5981e6..351931c706aa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sched.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
> @@ -109,6 +109,8 @@ struct nouveau_sched {
>   		} list;
>   		struct wait_queue_head wq;
>   	} job;
> +
> +	bool initialized;
>   };
>   
>   int nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,

