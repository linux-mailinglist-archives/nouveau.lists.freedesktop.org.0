Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA4C2A97D7
	for <lists+nouveau@lfdr.de>; Fri,  6 Nov 2020 15:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DA56E1F8;
	Fri,  6 Nov 2020 14:46:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20E16E0ED
 for <nouveau@lists.freedesktop.org>; Fri,  6 Nov 2020 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604673960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cFd8XANW2NnqIDs5fKPXlkt8TxDQ++SJbHnaDAAQH+k=;
 b=SdVANaV0NT00KW8eHuOFzPpLEdvEo2rJseJcYcxcNfs2At1PlxRsjRGWF/FAV0NJ6bIi/T
 7sVHsogiLPpQ5Ob+dxUI2mbCnBsI3XKGWJ6gr0AQ05BF/t9sN0cWeg6MfeC76ozXqZU15J
 cjUJINpKyvT6nl4prR0Mhc2HmqGZFDg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-XwtSTxJxPlieEo-JAnAz4g-1; Fri, 06 Nov 2020 09:45:56 -0500
X-MC-Unique: XwtSTxJxPlieEo-JAnAz4g-1
Received: by mail-qk1-f198.google.com with SMTP id h23so839962qka.8
 for <nouveau@lists.freedesktop.org>; Fri, 06 Nov 2020 06:45:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cFd8XANW2NnqIDs5fKPXlkt8TxDQ++SJbHnaDAAQH+k=;
 b=YA92jmnrRLN+2QovsTSyiisWVurRf4iQ9gQGDRirNEnr/ebg7CQu6hVknjFJ+uQznw
 gZGbXE7pw20SSNriPbKlBvdO0Vm/ULUjHuMVrZ6GiWhSFchwzEhc3/0M5qCvTYMm6HBh
 ruFZlENczKAPqb+DzHOpn+qwW/WvwLRiwu8pB8veDH7bzhOdPSvhqCbEPSExtx5V/KfR
 eGOxZEv/z1mA/MBBVtXuuwHy/AuQnhCtuh+tWd+McHMFtR54pobCSYVVVrF4BWsX21aG
 OusS/NX1hhqlWlUBbFGNlQS0DiMWVeyl9ELcfY353epISOW4bCXsAVE8Ubj4TDKxaUH2
 T6Bg==
X-Gm-Message-State: AOAM532FOZ4W673315GB1ei0kcVjkBXyyND1LQV6CoP1b8/XxzqfSL1e
 NasPRyy2cBr7DbH5xbzKCHq5Pf2r00WoBE7NMgXmEnHUKq9pbCs9RUjG0iRvoMtgvDq76rmpPt0
 kNB/7ndqQvq09Wgjm60/Xa/XtWA==
X-Received: by 2002:ac8:7a7b:: with SMTP id w27mr1820845qtt.381.1604673955468; 
 Fri, 06 Nov 2020 06:45:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVvVeyqh85AZyi8q2FX0MGeNnGekEj5wHHNrBCPg310gp4Id2tCxZmt7Ocg8HZKlHCzrDATA==
X-Received: by 2002:ac8:7a7b:: with SMTP id w27mr1820808qtt.381.1604673955102; 
 Fri, 06 Nov 2020 06:45:55 -0800 (PST)
Received: from xps13 ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id h9sm590245qth.78.2020.11.06.06.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 06:45:53 -0800 (PST)
Date: Fri, 6 Nov 2020 09:45:51 -0500
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20201106144551.GA7656@xps13>
References: <20201106021656.40743-1-jcline@redhat.com>
 <20201106021656.40743-3-jcline@redhat.com>
 <CACO55tsRGOH5rwy-40_6FY_9mGZKfkiFBoAT2jowbQYmaLGK8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tsRGOH5rwy-40_6FY_9mGZKfkiFBoAT2jowbQYmaLGK8g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau: manage nouveau_drm lifetime
 with devres
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 02:31:44PM +0100, Karol Herbst wrote:
> On Fri, Nov 6, 2020 at 3:17 AM Jeremy Cline <jcline@redhat.com> wrote:
> >
> > Make use of the devm_drm_dev_alloc() API to bind the lifetime of
> > nouveau_drm structure to the drm_device. This is important because a
> > reference to nouveau_drm is accessible from drm_device, which is
> > provided to a number of DRM layer callbacks that can run after the
> > deallocation of nouveau_drm currently occurs.
> >
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_drm.c | 44 ++++++++++++---------------
> >  drivers/gpu/drm/nouveau/nouveau_drv.h | 10 ++++--
> >  2 files changed, 26 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > index bc6f51bf23b7..f750c25e92f9 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > @@ -30,9 +30,11 @@
> >  #include <linux/vga_switcheroo.h>
> >  #include <linux/mmu_notifier.h>
> >
> > +#include <drm/drm_drv.h>
> >  #include <drm/drm_crtc_helper.h>
> >  #include <drm/drm_ioctl.h>
> >  #include <drm/drm_vblank.h>
> > +#include <drm/drm_managed.h>
> >
> >  #include <core/gpuobj.h>
> >  #include <core/option.h>
> > @@ -532,13 +534,8 @@ nouveau_parent = {
> >  static int
> >  nouveau_drm_device_init(struct drm_device *dev)
> >  {
> > -       struct nouveau_drm *drm;
> >         int ret;
> > -
> > -       if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
> > -               return -ENOMEM;
> > -       dev->dev_private = drm;
> > -       drm->dev = dev;
> > +       struct nouveau_drm *drm = nouveau_drm(dev);
> >
> >         nvif_parent_ctor(&nouveau_parent, &drm->parent);
> >         drm->master.base.object.parent = &drm->parent;
> > @@ -620,7 +617,6 @@ nouveau_drm_device_init(struct drm_device *dev)
> >         nouveau_cli_fini(&drm->master);
> >  fail_alloc:
> >         nvif_parent_dtor(&drm->parent);
> > -       kfree(drm);
> >         return ret;
> >  }
> >
> > @@ -654,7 +650,6 @@ nouveau_drm_device_fini(struct drm_device *dev)
> >         nouveau_cli_fini(&drm->client);
> >         nouveau_cli_fini(&drm->master);
> >         nvif_parent_dtor(&drm->parent);
> > -       kfree(drm);
> >  }
> >
> >  /*
> > @@ -720,6 +715,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >  {
> >         struct nvkm_device *device;
> >         struct drm_device *drm_dev;
> > +       struct nouveau_drm *nv_dev;
> >         int ret;
> >
> >         if (vga_switcheroo_client_probe_defer(pdev))
> > @@ -750,15 +746,16 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >         if (nouveau_atomic)
> >                 driver_pci.driver_features |= DRIVER_ATOMIC;
> >
> > -       drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
> > -       if (IS_ERR(drm_dev)) {
> > -               ret = PTR_ERR(drm_dev);
> > +       nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_stub, typeof(*nv_dev), drm_dev);
> > +       if (IS_ERR(nv_dev)) {
> > +               ret = PTR_ERR(nv_dev);
> >                 goto fail_nvkm;
> >         }
> > +       drm_dev = nouveau_to_drm_dev(nv_dev);
> >
> >         ret = pci_enable_device(pdev);
> >         if (ret)
> > -               goto fail_drm;
> > +               goto fail_nvkm;
> >
> >         drm_dev->pdev = pdev;
> >         pci_set_drvdata(pdev, drm_dev);
> > @@ -778,8 +775,6 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
> >         nouveau_drm_device_fini(drm_dev);
> >  fail_pci:
> >         pci_disable_device(pdev);
> > -fail_drm:
> > -       drm_dev_put(drm_dev);
> 
> it sounded like that when using devm_drm_dev_alloc we still have an
> initial refcount of 1, so at least in this regard nothing changed so I
> am wondering why this change is necessary and if the reason is
> unrelated it might make sense to move it into its own patch.
> 

The way I read the supporting code is that when the allocation occurs,
an action is registered on the parent device to call drm_dev_put(), so
as long as the PCI device is dropped, and as far as I could tell it is
when an error is returned, it should be handled automatically. The same
I *think* goes for the platform device variety with Tegra.

However, this is by far the most likely thing for me to have
misunderstood so I'll look through it a second time and would love to
have a second opinion on it.

> >  fail_nvkm:
> >         nvkm_device_del(&device);
> >         return ret;
> > @@ -799,7 +794,6 @@ nouveau_drm_device_remove(struct drm_device *dev)
> >         device = nvkm_device_find(client->device);
> >
> >         nouveau_drm_device_fini(dev);
> > -       drm_dev_put(dev);
> >         nvkm_device_del(&device);
> >  }
> >
> > @@ -1285,7 +1279,8 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> >                                struct platform_device *pdev,
> >                                struct nvkm_device **pdevice)
> >  {
> > -       struct drm_device *drm;
> > +       struct nouveau_drm *nv_dev;
> > +       struct drm_device *drm_dev;
> >         int err;
> >
> >         err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
> > @@ -1293,22 +1288,21 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
> >         if (err)
> >                 goto err_free;
> >
> > -       drm = drm_dev_alloc(&driver_platform, &pdev->dev);
> > -       if (IS_ERR(drm)) {
> > -               err = PTR_ERR(drm);
> > +       nv_dev = devm_drm_dev_alloc(&pdev->dev, &driver_platform, typeof(*nv_dev), drm_dev);
> > +       if (IS_ERR(nv_dev)) {
> > +               err = PTR_ERR(nv_dev);
> >                 goto err_free;
> >         }
> > +       drm_dev = nouveau_to_drm_dev(nv_dev);
> >
> > -       err = nouveau_drm_device_init(drm);
> > +       err = nouveau_drm_device_init(drm_dev);
> >         if (err)
> > -               goto err_put;
> > +               goto err_free;
> >
> > -       platform_set_drvdata(pdev, drm);
> > +       platform_set_drvdata(pdev, drm_dev);
> >
> > -       return drm;
> > +       return drm_dev;
> >
> > -err_put:
> > -       drm_dev_put(drm);
> >  err_free:
> >         nvkm_device_del(pdevice);
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > index 3e2920a10099..cf6c33e52a5c 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> > +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> > @@ -137,7 +137,11 @@ struct nouveau_drm {
> >         struct nvif_parent parent;
> >         struct nouveau_cli master;
> >         struct nouveau_cli client;
> > -       struct drm_device *dev;
> > +
> > +       /**
> > +        * @drm_dev: The parent DRM device object.
> > +        */
> > +       struct drm_device drm_dev;
> >
> >         struct list_head clients;
> >
> > @@ -237,7 +241,7 @@ struct nouveau_drm {
> >  static inline struct nouveau_drm *
> >  nouveau_drm(struct drm_device *dev)
> >  {
> > -       return dev->dev_private;
> > +       return container_of(dev, struct nouveau_drm, drm_dev);
> >  }
> >
> >  /**
> > @@ -251,7 +255,7 @@ nouveau_drm(struct drm_device *dev)
> >   */
> >  static inline struct drm_device *
> >  nouveau_to_drm_dev(struct nouveau_drm *nv_dev) {
> > -       return nv_dev->dev;
> > +       return &nv_dev->drm_dev;
> >  }
> >
> >  /**
> > --
> > 2.28.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >
> 

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
