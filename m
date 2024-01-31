Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D312D8447D0
	for <lists+nouveau@lfdr.de>; Wed, 31 Jan 2024 20:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DD210FC6D;
	Wed, 31 Jan 2024 19:10:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7EC810FC62
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jan 2024 19:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706728242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVxUbMWh6nuUV7HAlwwrXn49k8LjkIFOKFR9DwoBMVA=;
 b=EgdIbQGwz58cXIT3lvuhCugB0ISm1aWEeeyysr2wUUTYDHDUqn/UxYvmTxdG6A1qnFCUvQ
 QWey50Yx7e5FRWKPYeuU+n9qrsXZmZ/adJB1e9XmeN8jtQht4eBmg2M9FDKkq1cbidM06G
 UFcDHZq0IyYDpX7SgEjJe3u4iFttuO8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-488-77xwZgN6N3iHwwu0Ihc0yQ-1; Wed, 31 Jan 2024 14:10:40 -0500
X-MC-Unique: 77xwZgN6N3iHwwu0Ihc0yQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a2f71c9f5d2so3391166b.2
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jan 2024 11:10:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706728239; x=1707333039;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BVxUbMWh6nuUV7HAlwwrXn49k8LjkIFOKFR9DwoBMVA=;
 b=llMfy1pif+Qnz3N8Ye2aQ43ePL34xJaCzIhXBGOAokle3ngdVdAKNzXW1ofqbbooB8
 NVGT4gbsk1rPs+tTrPkJDFhog1fcbHZPkMytI49F2P2aYeDYsoLUnfVuWI/v6yJ8+KEG
 39hPBZ8f9VOBRPRPbYl5KHutUAWTSgLCPL913Gdw4zwDjy0z4NUOxvTBFst4kGBcfw0d
 XVIQroWbFYPxIxh1zAfq7iNE745x9YQDHyibc02CkifxBSVEFeWQylG3y8ozwl4CqJHn
 DgIIJtIhL06yXKzYzcPMWHKb0aysXFbmFsGtOkolW8wPZcy6ralAsQ+F2khndCDaDbR6
 qAfA==
X-Gm-Message-State: AOJu0YzKi0CenG1WlRMkOzNPlySSdvLALFlJXp5tcJi5MX0xDkaUkgGC
 bTXlwuvU3b9ZEtCv3QRTQ8+zeswERXFCTaB0STNZTl+v8eu9mcYShhzC/XJJbmL10oTNHP6RyMM
 7nXe9sgH161TWRKArht2AnG+oW5o/CRK1iJgQ7S1cuvyvdRX/xxMvQEE3r+reH+k=
X-Received: by 2002:a17:907:171b:b0:a35:b2b1:5372 with SMTP id
 le27-20020a170907171b00b00a35b2b15372mr1869965ejc.68.1706728239404; 
 Wed, 31 Jan 2024 11:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEu38E4u4tFn+VorqkD/WncuomGRye9/IU/vt9+7QV1Ygj3N6RHb83/ZusPyTNmHK3yPi6BQg==
X-Received: by 2002:a17:907:171b:b0:a35:b2b1:5372 with SMTP id
 le27-20020a170907171b00b00a35b2b15372mr1869951ejc.68.1706728239152; 
 Wed, 31 Jan 2024 11:10:39 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a1709061d4e00b00a2c70ec1533sm6410851ejh.66.2024.01.31.11.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 11:10:38 -0800 (PST)
Message-ID: <4ba66e36-f4a8-4c5e-af88-bc47157b5c03@redhat.com>
Date: Wed, 31 Jan 2024 20:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/nouveau/svm: remove unused but set variables
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
References: <cover.1704908087.git.jani.nikula@intel.com>
 <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <8b133e7ec0e9aef728be301ac019c5ddcb3bbf51.1704908087.git.jani.nikula@intel.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 1/10/24 18:39, Jani Nikula wrote:
> Fix the W=1 warning -Wunused-but-set-variable.
> 
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_svm.c | 10 +++-------
>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index cc03e0c22ff3..4d1008915499 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -112,7 +112,7 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>   {
>   	struct nouveau_cli *cli = nouveau_cli(file_priv);
>   	struct drm_nouveau_svm_bind *args = data;
> -	unsigned target, cmd, priority;
> +	unsigned target, cmd;
>   	unsigned long addr, end;
>   	struct mm_struct *mm;
>   
> @@ -136,9 +136,6 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
>   		return -EINVAL;
>   	}
>   
> -	priority = args->header >> NOUVEAU_SVM_BIND_PRIORITY_SHIFT;
> -	priority &= NOUVEAU_SVM_BIND_PRIORITY_MASK;
> -
>   	/* FIXME support CPU target ie all target value < GPU_VRAM */
>   	target = args->header >> NOUVEAU_SVM_BIND_TARGET_SHIFT;
>   	target &= NOUVEAU_SVM_BIND_TARGET_MASK;
> @@ -926,15 +923,14 @@ nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
>   		 unsigned long addr, u64 *pfns, unsigned long npages)
>   {
>   	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
> -	int ret;
>   
>   	args->p.addr = addr;
>   	args->p.size = npages << PAGE_SHIFT;
>   
>   	mutex_lock(&svmm->mutex);
>   
> -	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> -				struct_size(args, p.phys, npages), NULL);
> +	nvif_object_ioctl(&svmm->vmm->vmm.object, args,
> +			  struct_size(args, p.phys, npages), NULL);
>   
>   	mutex_unlock(&svmm->mutex);
>   }

