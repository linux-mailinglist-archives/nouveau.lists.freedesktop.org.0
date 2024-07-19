Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF4937703
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 13:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CA510EBE6;
	Fri, 19 Jul 2024 11:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SRsEqPGU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DE510EBE6
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 11:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721387456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uV9JPGNj9SHoBl/3RIuh76JoYSKTqYDN6a/kdeQEecQ=;
 b=SRsEqPGU/Nx3jeQo7TMMBJjzeJTc6ms/H3qL8G/TDyTEIY/vEP0G/ppboyH4UjydngL+u6
 AjTG7wMKApVA4Zuuih50QlSsiWyC5OprafZRPZkNbl4RhPS+Dx/JBeiXEWoAaa19wMH5qG
 XOMnhd/1KwziF08sbL7l3v3De9krTt4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-31-H3L744eYOMeHAMJOuU43Ew-1; Fri, 19 Jul 2024 07:10:55 -0400
X-MC-Unique: H3L744eYOMeHAMJOuU43Ew-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4266d0183feso9801875e9.0
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 04:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721387453; x=1721992253;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uV9JPGNj9SHoBl/3RIuh76JoYSKTqYDN6a/kdeQEecQ=;
 b=AE7e0rQYUK8JkSEisjycXqx+iQdiunWbIRWpfhGkrYY7XtQCdfn2U7lNW4lc311WkV
 kpb8l4A0VN6pmXd59gVLHcvDCEq4nNIW3ldOZk5DGHkvr92kytVX1emD4dtHOZyE5tM2
 mLUPtFhSdbKauT7Qjj/astxdwp6fjqvHUeKa1yPYoBp1Q3tniXdxIiNUyUmiQpu+U4eM
 UDgKwTaHqc1svA+ojpbDN9F0oszOntaLtk1q9XQX1y3/sb8rntwNnPgLt2de8FIGvzyB
 ZfkrpJfPB37GwhzICMvBA4o1NhEcutOcFi0IwKXItR5XwTTRGBrtR9Mll/j6la6LEQtZ
 r8mA==
X-Gm-Message-State: AOJu0YypYIgsZJdclHNBhaGXYTl+jgAovRKjd7cARegeslbuMrbAUxx/
 4yxDPspLUoDruYkghalS0YHLqlN/mSMLK2xsWQgjo9TrUcalToS7K9cbjpYziKMutJ3+ZQgAl+v
 UsrTkvZFhSZk6dK/9+FBBUwHFI8zl+nv2xPivsQ8uLrS/BvZok1A4wZTCb5RarWHvvvoZQho=
X-Received: by 2002:a05:600c:a015:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-427d72923b8mr11939525e9.18.1721387453534; 
 Fri, 19 Jul 2024 04:10:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYQgMLaR5tRMV4Oxe70XV6D/3S79a/Z7HMzgVmMQnZY8ZDeJ1dfhsHsTfMsvkaYDMYM9rZ2Q==
X-Received: by 2002:a05:600c:a015:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-427d72923b8mr11939325e9.18.1721387453014; 
 Fri, 19 Jul 2024 04:10:53 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a7257esm46572465e9.28.2024.07.19.04.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 04:10:52 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:10:50 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <ZppJuiWfgfkEKeCH@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Thu, Jul 18, 2024 at 05:14:15PM +1000, Ben Skeggs wrote:
> On 10/7/24 01:16, Danilo Krummrich wrote:
> 
> > On Fri, Jul 05, 2024 at 04:36:46AM +1000, Ben Skeggs wrote:
> > > The next commit will change the pointer we store via dev_set_drvdata()
> > > to allow simplifying the code using it.
> > Please don't use future tense, e.g "In subsequent commits, the pointer we store
> > [...]". Also, when you mention that something is changes (such as the pointer
> > type here), it probably makes sense to mention what it is changed to instead.
> > 
> > > Here we want to unify some more of the PCI/Tegra DRM driver init, both
> > > as a general cleanup, and to enable the dev_set_drvdata() change to be
> > > made in a single place.
> > In this case I think it makes sense to switch things up. First mention what the
> > commit does and why, i.e. "Unify some more of the PCI/Tegra DRM driver init
> > [...]" and then mention that the actual change to the pointer stored in a
> > device' drvdata in done in a subsequent commit.
> 
> I've reworded the commit message.
> 
> 
> > 
> > > Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c      | 93 ++++++++++++++--------
> > >   drivers/gpu/drm/nouveau/nouveau_platform.c |  6 --
> > >   2 files changed, 60 insertions(+), 39 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index eae48c87e3d5..9beff8737617 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -628,20 +628,14 @@ nouveau_drm_device_fini(struct drm_device *dev)
> > >   	destroy_workqueue(drm->sched_wq);
> > >   	nvif_parent_dtor(&drm->parent);
> > >   	mutex_destroy(&drm->clients_lock);
> > > -	kfree(drm);
> > >   }
> > >   static int
> > > -nouveau_drm_device_init(struct drm_device *dev)
> > > +nouveau_drm_device_init(struct nouveau_drm *drm)
> > >   {
> > > -	struct nouveau_drm *drm;
> > > +	struct drm_device *dev = drm->dev;
> > >   	int ret;
> > > -	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
> > > -		return -ENOMEM;
> > > -	dev->dev_private = drm;
> > > -	drm->dev = dev;
> > > -
> > >   	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> > >   	drm->master.base.object.parent = &drm->parent;
> > > @@ -711,6 +705,12 @@ nouveau_drm_device_init(struct drm_device *dev)
> > >   		pm_runtime_put(dev->dev);
> > >   	}
> > > +	ret = drm_dev_register(drm->dev, 0);
> > > +	if (ret) {
> > > +		nouveau_drm_device_fini(drm->dev);
> > > +		return ret;
> > > +	}
> > > +
> > >   	return 0;
> > >   fail_dispinit:
> > >   	nouveau_display_destroy(dev);
> > > @@ -728,10 +728,47 @@ nouveau_drm_device_init(struct drm_device *dev)
> > >   	destroy_workqueue(drm->sched_wq);
> > >   fail_alloc:
> > >   	nvif_parent_dtor(&drm->parent);
> > > -	kfree(drm);
> > >   	return ret;
> > >   }
> > > +static void
> > > +nouveau_drm_device_del(struct nouveau_drm *drm)
> > > +{
> > > +	if (drm->dev)
> > > +		drm_dev_put(drm->dev);
> > > +
> > > +	kfree(drm);
> > > +}
> > > +
> > > +static struct nouveau_drm *
> > > +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
> > > +		       struct nvkm_device *device)
> > > +{
> > > +	struct nouveau_drm *drm;
> > > +	int ret;
> > > +
> > > +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
> > > +	if (!drm)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	drm->dev = drm_dev_alloc(drm_driver, parent);
> > Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?
> > 
> > This also gets us rid of nouveau_drm_device_del().
> 
> No, we can't.  I originally had this change as a cleanup patch in the series
> I posted implementing aux bus support.  However it turns out that in order
> to avoid breaking udev etc, we can't use the aux device as parent of the drm

Can you please expand a bit on what was breaking?

> device and instead have to continue passing the pci/platform device as we do
> now.
> 
> Using devm_drm_dev_alloc() with the pci device as parent would tie the
> lifetime of the drm device to the pci device, which is owned by nvkm (after

How does this tie the lifetime of the drm device to the pci device? It's the
other way around, the drm device takes a reference of its parent (i.e. the pci
device).

I don't think there's anything wrong with that.

> the auxdev series).  We could look at changing devm_drm_dev_alloc() of
> course, but I think that's best left until later.

I don't think that this is necessary.

> 
> > 
> > > +	if (IS_ERR(drm->dev)) {
> > > +		ret = PTR_ERR(drm->dev);
> > > +		goto done;
> > > +	}
> > > +
> > > +	drm->dev->dev_private = drm;
> > > +	dev_set_drvdata(parent, drm->dev);
> > > +
> > > +done:
> > > +	if (ret) {
> > > +		nouveau_drm_device_del(drm);
> > > +		drm = NULL;
> > > +	}
> > > +
> > > +	return ret ? ERR_PTR(ret) : drm;
> > > +}
> > > +
> > >   /*
> > >    * On some Intel PCIe bridge controllers doing a
> > >    * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not reappear.
> > > @@ -794,7 +831,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> > >   			     const struct pci_device_id *pent)
> > >   {
> > >   	struct nvkm_device *device;
> > > -	struct drm_device *drm_dev;
> > > +	struct nouveau_drm *drm;
> > >   	int ret;
> > >   	if (vga_switcheroo_client_probe_defer(pdev))
> > > @@ -825,9 +862,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> > >   	if (nouveau_atomic)
> > >   		driver_pci.driver_features |= DRIVER_ATOMIC;
> > > -	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
> > > -	if (IS_ERR(drm_dev)) {
> > > -		ret = PTR_ERR(drm_dev);
> > > +	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev, device);
> > > +	if (IS_ERR(drm)) {
> > > +		ret = PTR_ERR(drm);
> > >   		goto fail_nvkm;
> > >   	}
> > > @@ -835,30 +872,22 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> > >   	if (ret)
> > >   		goto fail_drm;
> > > -	pci_set_drvdata(pdev, drm_dev);
> > > -
> > > -	ret = nouveau_drm_device_init(drm_dev);
> > > +	ret = nouveau_drm_device_init(drm);
> > >   	if (ret)
> > >   		goto fail_pci;
> > > -	ret = drm_dev_register(drm_dev, pent->driver_data);
> > > -	if (ret)
> > > -		goto fail_drm_dev_init;
> > > -
> > > -	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
> > > -		drm_fbdev_ttm_setup(drm_dev, 8);
> > > +	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
> > > +		drm_fbdev_ttm_setup(drm->dev, 8);
> > >   	else
> > > -		drm_fbdev_ttm_setup(drm_dev, 32);
> > > +		drm_fbdev_ttm_setup(drm->dev, 32);
> > >   	quirk_broken_nv_runpm(pdev);
> > >   	return 0;
> > > -fail_drm_dev_init:
> > > -	nouveau_drm_device_fini(drm_dev);
> > >   fail_pci:
> > >   	pci_disable_device(pdev);
> > >   fail_drm:
> > > -	drm_dev_put(drm_dev);
> > > +	nouveau_drm_device_del(drm);
> > >   fail_nvkm:
> > >   	nvkm_device_del(&device);
> > >   	return ret;
> > > @@ -877,7 +906,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
> > >   	device = nvkm_device_find(client->device);
> > >   	nouveau_drm_device_fini(dev);
> > > -	drm_dev_put(dev);
> > > +	nouveau_drm_device_del(drm);
> > >   	nvkm_device_del(&device);
> > >   }
> > > @@ -1369,7 +1398,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> > >   			       struct platform_device *pdev,
> > >   			       struct nvkm_device **pdevice)
> > >   {
> > > -	struct drm_device *drm;
> > > +	struct nouveau_drm *drm;
> > >   	int err;
> > >   	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
> > > @@ -1377,7 +1406,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> > >   	if (err)
> > >   		goto err_free;
> > > -	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
> > > +	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev, *pdevice);
> > >   	if (IS_ERR(drm)) {
> > >   		err = PTR_ERR(drm);
> > >   		goto err_free;
> > > @@ -1387,12 +1416,10 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> > >   	if (err)
> > >   		goto err_put;
> > > -	platform_set_drvdata(pdev, drm);
> > > -
> > > -	return drm;
> > > +	return drm->dev;
> > >   err_put:
> > > -	drm_dev_put(drm);
> > > +	nouveau_drm_device_del(drm);
> > >   err_free:
> > >   	nvkm_device_del(pdevice);
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
> > > index bf2dc7567ea4..d0a63f0f54a2 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_platform.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
> > > @@ -34,12 +34,6 @@ static int nouveau_platform_probe(struct platform_device *pdev)
> > >   	if (IS_ERR(drm))
> > >   		return PTR_ERR(drm);
> > > -	ret = drm_dev_register(drm, 0);
> > > -	if (ret < 0) {
> > > -		drm_dev_put(drm);
> > > -		return ret;
> > > -	}
> > > -
> > >   	return 0;
> > >   }
> > > -- 
> > > 2.45.1
> > > 
> 

