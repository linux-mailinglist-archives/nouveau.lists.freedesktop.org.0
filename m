Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2897592BE79
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 17:33:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E61E10E5A3;
	Tue,  9 Jul 2024 15:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NTacrcZc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF1B10E5A3
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720539191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7/h3lrRQmAT3KOaYdsF1Zsx8pGGzzrUKa9UTkf0nBGI=;
 b=NTacrcZc8Ymx5Pr/1F73DsDZ1whnC3tedxVW97+pF5Y/2bdF04Y5teneI7dWJBr46AVN2X
 g2UR9oCb5sAuwfyONJEPXAsYCsO12PhDlO+OYoJYQsshAilEw/SY2bXhSN4JXOvj5tCqnW
 BLKkBVTIVm3gxi9TfMT0N8tDdBzCYDA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-wGuuI3J6PxKEXI6D18fOsw-1; Tue, 09 Jul 2024 11:33:10 -0400
X-MC-Unique: wGuuI3J6PxKEXI6D18fOsw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3679ed08797so3666037f8f.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 08:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720539188; x=1721143988;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7/h3lrRQmAT3KOaYdsF1Zsx8pGGzzrUKa9UTkf0nBGI=;
 b=Dr0iJBkGXQ+4JJmYRM2h99dgzj1Q7TMKIoFbR94Vish2+2L9hSxk4c2Byk47jGjk0n
 dpqtlJqQ03cbTQYZJkmX7O3RT5GJ5+fVfvh+8ZKnP+y4NYK8cj2ozZvKmjOUlXF3WHTg
 OTq7dLB+aQIXpr4OkV7FVV8DVTfp43u1ef9+7R7jkXquHQMEn91bGBMbkq+ThP2nt0lz
 c7wWrjs5uJ1JH9iopGbtb+VdHWRrW8Z/V/n0DXoxyfYE0/muil/dWn3RMloSuUJ32Snd
 G+OGij5B1kY5pbqHHsUUi4X5R81PPtsZR2VKWUANUlHQm8wqXl4zqyoC7fyUfz8H6J/I
 uenA==
X-Gm-Message-State: AOJu0Yz3Y0uy+xPnjzhPeKV79BDyWyqE/I0VL6bQ2PpKAuGlKhqcPfAn
 2U9zYDx8JeL9SVF7Ls2KMrIkVMxNLVm5AMaD98CFFzjaypjGaS+ZTLm2sLCTLSkc+WdZjG1aNB8
 r/OhEgD1Spm2zoXRB++EHh3Hi5HyovmE/fbjhME9goZujcdW9PwbXHJ8AQs5Os8MQpztXcYI=
X-Received: by 2002:a5d:64e1:0:b0:367:973c:aa7b with SMTP id
 ffacd0b85a97d-367cea4600amr2731889f8f.2.1720539188640; 
 Tue, 09 Jul 2024 08:33:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDkU1zmLB/Z7eQGv2/Byw6UvnueR1PQKS+48d8QoWF6xowvk9/Y+pyXOBU3az7y6EbbXZeDA==
X-Received: by 2002:a5d:64e1:0:b0:367:973c:aa7b with SMTP id
 ffacd0b85a97d-367cea4600amr2731873f8f.2.1720539188246; 
 Tue, 09 Jul 2024 08:33:08 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa07dasm2862184f8f.87.2024.07.09.08.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:33:07 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:33:06 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 06/37] drm/nouveau: move allocation of root client out
 of nouveau_cli_init()
Message-ID: <Zo1YMjbL5ax8deYL@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-7-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-7-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:36:50AM +1000, Ben Skeggs wrote:
> drm->master isn't really a nouveau_cli, and is mostly just used to get
> at an nvif_mmu object to implement a hack around issues with the ioctl
> interface to nvkm.
> 
> Later patches in this series will allocate nvif_device/mmu objects in
> nouveau_drm directly, removing the need for master.

Please don't use future tense.

> 
> Another patch series will remove the need for the above-mentioned hack
> entirely.

Do you have those patches already?

> 
> The only other member of drm->master that's needed is the nvif_client,
> and is a dependency of device/mmu.  So the first step is to move its
> allocation out of code handling nouveau_cli init.
> 
> v2:
> - modified slightly due to the addition of tegra/pci cleanup patches
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 46 ++++++++++++++-------------
>  1 file changed, 24 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 140e27af0d64..a942d2c03d44 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -129,12 +129,12 @@ nouveau_platform_name(struct platform_device *platformdev)
>  }
>  
>  static u64
> -nouveau_name(struct drm_device *dev)
> +nouveau_name(struct device *dev)
>  {
> -	if (dev_is_pci(dev->dev))
> -		return nouveau_pci_name(to_pci_dev(dev->dev));
> +	if (dev_is_pci(dev))
> +		return nouveau_pci_name(to_pci_dev(dev));
>  	else
> -		return nouveau_platform_name(to_platform_device(dev->dev));
> +		return nouveau_platform_name(to_platform_device(dev));

This looks like it should be a separate patch.

>  }
>  
>  static inline bool
> @@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
>  	nouveau_vmm_fini(&cli->vmm);
>  	nvif_mmu_dtor(&cli->mmu);
>  	nvif_device_dtor(&cli->device);
> -	mutex_lock(&cli->drm->master.lock);
> -	nvif_client_dtor(&cli->base);
> -	mutex_unlock(&cli->drm->master.lock);
> +	if (cli != &cli->drm->master) {
> +		mutex_lock(&cli->drm->master.lock);
> +		nvif_client_dtor(&cli->base);
> +		mutex_unlock(&cli->drm->master.lock);
> +	}
>  }
>  
>  static int
> @@ -241,7 +243,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  		{ NVIF_CLASS_VMM_NV04 , -1 },
>  		{}
>  	};
> -	u64 device = nouveau_name(drm->dev);
> +	u64 device = nouveau_name(drm->dev->dev);
>  	int ret;
>  
>  	snprintf(cli->name, sizeof(cli->name), "%s", sname);
> @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
>  	INIT_LIST_HEAD(&cli->worker);
>  	mutex_init(&cli->lock);
>  
> -	if (cli == &drm->master) {
> -		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
> -				       cli->name, device, &cli->base);
> -	} else {
> +	if (cli != &drm->master) {
>  		mutex_lock(&drm->master.lock);
>  		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
>  				       &cli->base);
> @@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>  	nouveau_cli_fini(&drm->client);
>  	nouveau_cli_fini(&drm->master);
>  	destroy_workqueue(drm->sched_wq);
> -	nvif_parent_dtor(&drm->parent);
>  	mutex_destroy(&drm->clients_lock);
>  }
>  
> @@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  	struct drm_device *dev = drm->dev;
>  	int ret;
>  
> -	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> -	drm->master.base.object.parent = &drm->parent;

Moving this to nouveau_drm_device_new(), plus the resulting changes in error
handling, don't seem to be related to this commit either.

> -
>  	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
>  					WQ_MAX_ACTIVE);
> -	if (!drm->sched_wq) {
> -		ret = -ENOMEM;
> -		goto fail_alloc;
> -	}
> +	if (!drm->sched_wq)
> +		return -ENOMEM;
>  
>  	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>  	if (ret)
> @@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  	nouveau_cli_fini(&drm->master);
>  fail_wq:
>  	destroy_workqueue(drm->sched_wq);
> -fail_alloc:
> -	nvif_parent_dtor(&drm->parent);
>  	return ret;
>  }
>  
> @@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>  	if (drm->dev)
>  		drm_dev_put(drm->dev);
>  
> +	nvif_client_dtor(&drm->master.base);
> +	nvif_parent_dtor(&drm->parent);
> +
>  	kfree(drm);
>  }
>  
> @@ -753,6 +747,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
>  
>  	drm->nvkm = device;
>  
> +	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> +	drm->master.base.object.parent = &drm->parent;
> +
> +	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
> +			       nouveau_name(parent), &drm->master.base);
> +	if (ret)
> +		goto done;
> +
>  	drm->dev = drm_dev_alloc(drm_driver, parent);
>  	if (IS_ERR(drm->dev)) {
>  		ret = PTR_ERR(drm->dev);
> -- 
> 2.45.1
> 

