Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 885AA8FAFBF
	for <lists+nouveau@lfdr.de>; Tue,  4 Jun 2024 12:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0597910E407;
	Tue,  4 Jun 2024 10:20:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NTRqDD2U";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 673B110E407
 for <nouveau@lists.freedesktop.org>; Tue,  4 Jun 2024 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717496425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGeeKgYU6rkn2OXAYfrJvAaOBlgojp5nTaR7J9U6cY4=;
 b=NTRqDD2Uczvyo/ZsiBqHdvTXpIu28dtoRFoeqz+VtzemkTaRljSDuXBZMF2atRMUTdoPr1
 APrkNaLmBI4xgG+VAtkSxdOMzBsRiKqs0tbCiwdyrwXiXqCjIJuE86QO1VxYKznYVPBz4C
 tNwdHcnzFt9MISOcybb5CPn+Q+lBMDk=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-PsmU0D6cNY6HtSvjQna6sQ-1; Tue, 04 Jun 2024 06:20:24 -0400
X-MC-Unique: PsmU0D6cNY6HtSvjQna6sQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3d1de7d29d9so1011336b6e.2
 for <nouveau@lists.freedesktop.org>; Tue, 04 Jun 2024 03:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717496423; x=1718101223;
 h=content-transfer-encoding:in-reply-to:organization:cc:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fGeeKgYU6rkn2OXAYfrJvAaOBlgojp5nTaR7J9U6cY4=;
 b=jhDppdfPed2wEtQSjMI8N9cpRaVxYUjEHModS9WJIxhO3EgTCIWqcovpHm1iAkte8X
 PLYWkZgcskFmyVMxd1fmGuORwOfxv6eZ3O2eY1LPMAoWSIr5m+OAxY1SblB5/qXkgFqA
 mZQSg7Jw2o8Aj70Z7ievWpGJI8xroa859yBKwzjnIq5vXScqn2MTocIcCBHvHOtt3VTI
 XG0W+F3y82Eb6/1kyPYjX/1G8gJc2zFToE1ri3sgKGNx/JWgWGizGb9511oXgJUok73u
 doe8DuOAkAR1kH7OrdTOvuyRDf8R4EtnJLeKKFDs01KB3NLg0CvJq7KKDGUf8uqWOE8Z
 XUVg==
X-Gm-Message-State: AOJu0YyDtYHX2dt3oNuRWC+NjFqiJo3o1DAGrZArvE26O46vjVLQoSoe
 O+pYtWV2MqzWFSBf7renOAMRxwptEz1BreZ+s/qUUgHW0TLnwoKR9o5wYjiAJBybkCAo5tMi2O0
 GeuFyWY9pD2N3ztEgkCygzXVepitsugGH+gzmmxfYfqcbarCQoPhzvuuqBYnel3k=
X-Received: by 2002:a05:6808:200e:b0:3c9:6e4f:eeec with SMTP id
 5614622812f47-3d1e35b9bebmr15216387b6e.37.1717496423248; 
 Tue, 04 Jun 2024 03:20:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7b1NEfWuSdjph1A3AnzmaFnY4z0KlpzRje8XWKH/C5RLwuwVSQNAl1J0KMtXuIANnqEywQA==
X-Received: by 2002:a05:6808:200e:b0:3c9:6e4f:eeec with SMTP id
 5614622812f47-3d1e35b9bebmr15216366b6e.37.1717496422763; 
 Tue, 04 Jun 2024 03:20:22 -0700 (PDT)
Received: from [10.32.64.131] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-44009a2902csm27372401cf.38.2024.06.04.03.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jun 2024 03:20:22 -0700 (PDT)
Message-ID: <56280b42-52b2-4233-b38f-b4864ea65633@redhat.com>
Date: Tue, 4 Jun 2024 12:20:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/34] drm/nouveau: store nvkm_device pointer in
 nouveau_drm
To: Ben Skeggs <bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
 <20240527141959.59193-3-bskeggs@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Organization: RedHat
In-Reply-To: <20240527141959.59193-3-bskeggs@nvidia.com>
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

On 5/27/24 16:19, Ben Skeggs wrote:
> There's various different places in the drm code that get at the
> nvkm_device via various creative (and not very type-safe) means.
> 
> One of those being via nvif_device.object.priv.
> 
> Another patch series is going to entirely remove the ioctl-like
> interfaces beween the drm code and nvkm, and that field will no
> longer exist.
> 
> This provides a safer replacement for accessing the nvkm_device,
> and will used more in upcoming patches to cleanup other cases.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drm.c | 13 +++++--------
>   drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
>   2 files changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index c37798b507ea..e6ed68dcef78 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -579,7 +579,7 @@ nouveau_parent = {
>   };
>   
>   static int
> -nouveau_drm_device_init(struct drm_device *dev)
> +nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
>   {
>   	struct nouveau_drm *drm;
>   	int ret;
> @@ -588,6 +588,7 @@ nouveau_drm_device_init(struct drm_device *dev)
>   		return -ENOMEM;
>   	dev->dev_private = drm;
>   	drm->dev = dev;
> +	drm->nvkm = nvkm;
>   
>   	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>   	drm->master.base.object.parent = &drm->parent;
> @@ -830,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>   
>   	pci_set_drvdata(pdev, drm_dev);
>   
> -	ret = nouveau_drm_device_init(drm_dev);
> +	ret = nouveau_drm_device_init(drm_dev, device);

NIT (and actually not directly related to this patch): It seems that we
randomly switch between 'dev', 'drm_dev' for struct drm_device and
'device', 'nvkm' for nvkm_device. Since this is a cleanup series, mind
adding a patch to get this straight?

>   	if (ret)
>   		goto fail_pci;
>   
> @@ -861,14 +862,10 @@ void
>   nouveau_drm_device_remove(struct drm_device *dev)
>   {
>   	struct nouveau_drm *drm = nouveau_drm(dev);
> -	struct nvkm_client *client;
> -	struct nvkm_device *device;
> +	struct nvkm_device *device = drm->nvkm;
>   
>   	drm_dev_unplug(dev);
>   
> -	client = nvxx_client(&drm->client.base);
> -	device = nvkm_device_find(client->device);
> -
>   	nouveau_drm_device_fini(dev);
>   	drm_dev_put(dev);
>   	nvkm_device_del(&device);
> @@ -1376,7 +1373,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>   		goto err_free;
>   	}
>   
> -	err = nouveau_drm_device_init(drm);
> +	err = nouveau_drm_device_init(drm, *pdevice);

Same here, 'pdev' for struct platform_device and 'pdevice' for a ** to a
struct nvkm_device seems confusing.

>   	if (err)
>   		goto err_put;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index e239c6bf4afa..b711e994407b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -201,6 +201,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>   #include <nvif/parent.h>
>   
>   struct nouveau_drm {
> +	struct nvkm_device *nvkm;
>   	struct nvif_parent parent;
>   	struct nouveau_cli master;
>   	struct nouveau_cli client;

