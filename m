Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5229192BE02
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 17:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D79CA10E586;
	Tue,  9 Jul 2024 15:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g9lyF7hd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F0C10E586
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720538181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kKerYGAysO/9EzHtths/1FLeH5DTc0aS0z5amH0W+4U=;
 b=g9lyF7hdil9D+Lt97fZj3NgV/aVsR0J8LSQ4AstFQGXvLS9PVRo8ucGScSUtORGC7n7M4V
 fqy2eBp9Gpf3ffVKfDsK+T+QyZWr7GGs1mvCACaMeKfunTi9gPj1oh8CgZor3o2V9X3bqa
 26qJSbjqXzbueew8quFST0YwhGT9DwI=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-mw5Pjc8dMi2iNCtKzJnqog-1; Tue, 09 Jul 2024 11:16:20 -0400
X-MC-Unique: mw5Pjc8dMi2iNCtKzJnqog-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2ee9b383ffbso34415191fa.1
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 08:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720538178; x=1721142978;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKerYGAysO/9EzHtths/1FLeH5DTc0aS0z5amH0W+4U=;
 b=KY/FtqgUi7z7y1BswYg/aBuY9dRopcXavoYxoQW9MS3nXa6SLTCXk4xV94As+ZcR6g
 iZxVEw4ZXD41S8duCcEDyzmHJAY31qho1bAzqdlkd8ev+UwwSNeZRZY9m3vL1ZsaU/zi
 FEBYEvMDG4rVmYDopW8x0ch8J/EHN3Zl5qo89NTFQVjTLINoMA9VFtrvTpy5BsUtEF5Y
 aH+j2Yk7uWOH5HwhfnFwaYjXMQmTUEaeRcxTT6zXcGajdEKTqIK0WOvDNXbn2Fk9NH45
 NeCvAVlVQJWPL6w4MW0z28nlAflHUwvTXpdMQwTPC9iuYA0j1WWoEPp8tbypDJ/2McAp
 hoMw==
X-Gm-Message-State: AOJu0YzJVrcQrhaoazirGw1QB7lpNj1dbLUaP9+BQGA9e0MqURKA0/RA
 4mBh30EHMee9TS2KkS6Y2COFSc5DdxCP6gCls3q3UnkHqmLSmDsCAhViGhij2b1aGcXlVRHa8K0
 amCPC/yIWYcHIrTCJAt/ZmO4YA27x/D+UXdSsjLxDmkcAjGlk5+/jHt9BmPa8ONReFFjO96Y=
X-Received: by 2002:a2e:98d4:0:b0:2ee:8d81:5a92 with SMTP id
 38308e7fff4ca-2eeb317149dmr19370061fa.38.1720538178007; 
 Tue, 09 Jul 2024 08:16:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6phIjUfyp62e2vyNjorC/c2Y0LhJ7vUpX4qqi2nqBp8FYUmaqad6djs8x4JFOmUk+0WFo7Q==
X-Received: by 2002:a2e:98d4:0:b0:2ee:8d81:5a92 with SMTP id
 38308e7fff4ca-2eeb317149dmr19369891fa.38.1720538177505; 
 Tue, 09 Jul 2024 08:16:17 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f74159csm44362875e9.42.2024.07.09.08.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 08:16:17 -0700 (PDT)
Date: Tue, 9 Jul 2024 17:16:15 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <Zo1UP-aapSyf2Rnj@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-3-bskeggs@nvidia.com>
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

On Fri, Jul 05, 2024 at 04:36:46AM +1000, Ben Skeggs wrote:
> The next commit will change the pointer we store via dev_set_drvdata()
> to allow simplifying the code using it.

Please don't use future tense, e.g "In subsequent commits, the pointer we store
[...]". Also, when you mention that something is changes (such as the pointer
type here), it probably makes sense to mention what it is changed to instead.

> 
> Here we want to unify some more of the PCI/Tegra DRM driver init, both
> as a general cleanup, and to enable the dev_set_drvdata() change to be
> made in a single place.

In this case I think it makes sense to switch things up. First mention what the
commit does and why, i.e. "Unify some more of the PCI/Tegra DRM driver init
[...]" and then mention that the actual change to the pointer stored in a
device' drvdata in done in a subsequent commit.

> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c      | 93 ++++++++++++++--------
>  drivers/gpu/drm/nouveau/nouveau_platform.c |  6 --
>  2 files changed, 60 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index eae48c87e3d5..9beff8737617 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -628,20 +628,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
>  	destroy_workqueue(drm->sched_wq);
>  	nvif_parent_dtor(&drm->parent);
>  	mutex_destroy(&drm->clients_lock);
> -	kfree(drm);
>  }
>  
>  static int
> -nouveau_drm_device_init(struct drm_device *dev)
> +nouveau_drm_device_init(struct nouveau_drm *drm)
>  {
> -	struct nouveau_drm *drm;
> +	struct drm_device *dev = drm->dev;
>  	int ret;
>  
> -	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
> -		return -ENOMEM;
> -	dev->dev_private = drm;
> -	drm->dev = dev;
> -
>  	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>  	drm->master.base.object.parent = &drm->parent;
>  
> @@ -711,6 +705,12 @@ nouveau_drm_device_init(struct drm_device *dev)
>  		pm_runtime_put(dev->dev);
>  	}
>  
> +	ret = drm_dev_register(drm->dev, 0);
> +	if (ret) {
> +		nouveau_drm_device_fini(drm->dev);
> +		return ret;
> +	}
> +
>  	return 0;
>  fail_dispinit:
>  	nouveau_display_destroy(dev);
> @@ -728,10 +728,47 @@ nouveau_drm_device_init(struct drm_device *dev)
>  	destroy_workqueue(drm->sched_wq);
>  fail_alloc:
>  	nvif_parent_dtor(&drm->parent);
> -	kfree(drm);
>  	return ret;
>  }
>  
> +static void
> +nouveau_drm_device_del(struct nouveau_drm *drm)
> +{
> +	if (drm->dev)
> +		drm_dev_put(drm->dev);
> +
> +	kfree(drm);
> +}
> +
> +static struct nouveau_drm *
> +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
> +		       struct nvkm_device *device)
> +{
> +	struct nouveau_drm *drm;
> +	int ret;
> +
> +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
> +	if (!drm)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm->dev = drm_dev_alloc(drm_driver, parent);

Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?

This also gets us rid of nouveau_drm_device_del().

> +	if (IS_ERR(drm->dev)) {
> +		ret = PTR_ERR(drm->dev);
> +		goto done;
> +	}
> +
> +	drm->dev->dev_private = drm;
> +	dev_set_drvdata(parent, drm->dev);
> +
> +done:
> +	if (ret) {
> +		nouveau_drm_device_del(drm);
> +		drm = NULL;
> +	}
> +
> +	return ret ? ERR_PTR(ret) : drm;
> +}
> +
>  /*
>   * On some Intel PCIe bridge controllers doing a
>   * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
> @@ -794,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  			     const struct pci_device_id *pent)
>  {
>  	struct nvkm_device *device;
> -	struct drm_device *drm_dev;
> +	struct nouveau_drm *drm;
>  	int ret;
>  
>  	if (vga_switcheroo_client_probe_defer(pdev))
> @@ -825,9 +862,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  	if (nouveau_atomic)
>  		driver_pci.driver_features |= DRIVER_ATOMIC;
>  
> -	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
> -	if (IS_ERR(drm_dev)) {
> -		ret = PTR_ERR(drm_dev);
> +	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
> +	if (IS_ERR(drm)) {
> +		ret = PTR_ERR(drm);
>  		goto fail_nvkm;
>  	}
>  
> @@ -835,30 +872,22 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  	if (ret)
>  		goto fail_drm;
>  
> -	pci_set_drvdata(pdev, drm_dev);
> -
> -	ret = nouveau_drm_device_init(drm_dev);
> +	ret = nouveau_drm_device_init(drm);
>  	if (ret)
>  		goto fail_pci;
>  
> -	ret = drm_dev_register(drm_dev, pent->driver_data);
> -	if (ret)
> -		goto fail_drm_dev_init;
> -
> -	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
> -		drm_fbdev_ttm_setup(drm_dev, 8);
> +	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
> +		drm_fbdev_ttm_setup(drm->dev, 8);
>  	else
> -		drm_fbdev_ttm_setup(drm_dev, 32);
> +		drm_fbdev_ttm_setup(drm->dev, 32);
>  
>  	quirk_broken_nv_runpm(pdev);
>  	return 0;
>  
> -fail_drm_dev_init:
> -	nouveau_drm_device_fini(drm_dev);
>  fail_pci:
>  	pci_disable_device(pdev);
>  fail_drm:
> -	drm_dev_put(drm_dev);
> +	nouveau_drm_device_del(drm);
>  fail_nvkm:
>  	nvkm_device_del(&device);
>  	return ret;
> @@ -877,7 +906,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
>  	device = nvkm_device_find(client->device);
>  
>  	nouveau_drm_device_fini(dev);
> -	drm_dev_put(dev);
> +	nouveau_drm_device_del(drm);
>  	nvkm_device_del(&device);
>  }
>  
> @@ -1369,7 +1398,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>  			       struct platform_device *pdev,
>  			       struct nvkm_device **pdevice)
>  {
> -	struct drm_device *drm;
> +	struct nouveau_drm *drm;
>  	int err;
>  
>  	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
> @@ -1377,7 +1406,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>  	if (err)
>  		goto err_free;
>  
> -	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
> +	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
>  	if (IS_ERR(drm)) {
>  		err = PTR_ERR(drm);
>  		goto err_free;
> @@ -1387,12 +1416,10 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
>  	if (err)
>  		goto err_put;
>  
> -	platform_set_drvdata(pdev, drm);
> -
> -	return drm;
> +	return drm->dev;
>  
>  err_put:
> -	drm_dev_put(drm);
> +	nouveau_drm_device_del(drm);
>  err_free:
>  	nvkm_device_del(pdevice);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
> index bf2dc7567ea4..d0a63f0f54a2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> @@ -34,12 +34,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
>  	if (IS_ERR(drm))
>  		return PTR_ERR(drm);
>  
> -	ret = drm_dev_register(drm, 0);
> -	if (ret < 0) {
> -		drm_dev_put(drm);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  
> -- 
> 2.45.1
> 

