Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C837D937733
	for <lists+nouveau@lfdr.de>; Fri, 19 Jul 2024 13:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFC710EBAB;
	Fri, 19 Jul 2024 11:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JN3eDGi/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486C910EBAB
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721389041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+JuURbarw8EENCLF2mUtpkuoLAptvAa7lzoqe/2UH4=;
 b=JN3eDGi/Yko12Ls6AFk7CbRDk+LV+H9YWOymI7g1JenOz2JdLs/uI+5rBfKaEQTSUCJfG3
 cm3ehqiXW8uHgupVy3kqZXKlVKtArxSRdxgdyDfL5VBRj0eWnzISYC55NQuG86m01ObUzR
 or8x6fkMRTYHOzNGZy5D4aW4vmDeJBA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-ZBbzuhLuNICBxrUaSjLP0g-1; Fri, 19 Jul 2024 07:37:20 -0400
X-MC-Unique: ZBbzuhLuNICBxrUaSjLP0g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3685e0df024so695875f8f.0
 for <nouveau@lists.freedesktop.org>; Fri, 19 Jul 2024 04:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721389038; x=1721993838;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8+JuURbarw8EENCLF2mUtpkuoLAptvAa7lzoqe/2UH4=;
 b=XZa9U1bz2GpcAFVKI/OQDlrxvUUpfgjXIKskaE7rz4/2KVqDCSiLV/v/srdjkbFfPK
 dmocQYyA6hrw+BQJL4I8gmc9lLEk1Je6vAKJN1yARWKHOAbgOJwY1vM0tmJ/pLxYvjqN
 LLEMC4dAjkFsaGTAvP+ZT7XaFRsKKATothlQpS86ramx8ASpPE2bh0OY5VcgrEn4bLMf
 xNa683Odcnk1n2jEVfYkgwG8ZLqcL9suNv8oPfDCHFTccLjcOEMd2ZolvkqEQAV31oVO
 cVMhZ4lwFlE8wlL1gFXm6ucLntJ6UTOOZg/bfE8ipOxmk82MmLmzlcrjGIiMdGGFHpcK
 VZsg==
X-Gm-Message-State: AOJu0Yw1oag7EVlTJZDDRZqLMNNy7rT0UejHCPVcOqIi1Ppc77SYbNYS
 VdAGDFXfS/vDt9ymxKq9Tdpeu6OtexnFZcJRU36ZBSrCS1Ud+Jam6kiujT389dwW3WwmyIcW0Fh
 TQNTXTkzezx4zMWm2N2Ml4Ut+93i5mRrLPt9DrWUShHPThGtnjPSN4K5mN/r36h0yd/plrXk=
X-Received: by 2002:a05:6000:1368:b0:35f:1f8a:e69a with SMTP id
 ffacd0b85a97d-3683170827dmr5978373f8f.49.1721389038491; 
 Fri, 19 Jul 2024 04:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECuhFuAG0SvmzqcFVDHZmlGuNdQCx+2OZJSoDMhdgdhANVD7yztEp901sXEPV032cLOdRIXg==
X-Received: by 2002:a05:6000:1368:b0:35f:1f8a:e69a with SMTP id
 ffacd0b85a97d-3683170827dmr5978360f8f.49.1721389038047; 
 Fri, 19 Jul 2024 04:37:18 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a635cdsm49119955e9.13.2024.07.19.04.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 04:37:17 -0700 (PDT)
Date: Fri, 19 Jul 2024 13:37:15 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 06/37] drm/nouveau: move allocation of root client out
 of nouveau_cli_init()
Message-ID: <ZppP67rPLTjoWyfQ@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-7-bskeggs@nvidia.com>
 <Zo1YMjbL5ax8deYL@pollux>
 <ab2b00fd-e7e5-49d2-aab3-c6f9b1f5c53d@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ab2b00fd-e7e5-49d2-aab3-c6f9b1f5c53d@nvidia.com>
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

On Thu, Jul 18, 2024 at 05:29:20PM +1000, Ben Skeggs wrote:
> On 10/7/24 01:33, Danilo Krummrich wrote:
> 
> > On Fri, Jul 05, 2024 at 04:36:50AM +1000, Ben Skeggs wrote:
> > > drm->master isn't really a nouveau_cli, and is mostly just used to get
> > > at an nvif_mmu object to implement a hack around issues with the ioctl
> > > interface to nvkm.
> > > 
> > > Later patches in this series will allocate nvif_device/mmu objects in
> > > nouveau_drm directly, removing the need for master.
> > Please don't use future tense.
> > 
> > > Another patch series will remove the need for the above-mentioned hack
> > > entirely.
> > Do you have those patches already?
> 
> Yes.  It's the "remove-ioctl" series, of which this one used to be a part
> of.  I've mentioned it in the updated commit message regardless.
> 
> 
> > 
> > > The only other member of drm->master that's needed is the nvif_client,
> > > and is a dependency of device/mmu.  So the first step is to move its
> > > allocation out of code handling nouveau_cli init.
> > > 
> > > v2:
> > > - modified slightly due to the addition of tegra/pci cleanup patches
> > > 
> > > Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> > > ---
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c | 46 ++++++++++++++-------------
> > >   1 file changed, 24 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > index 140e27af0d64..a942d2c03d44 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> > > @@ -129,12 +129,12 @@ nouveau_platform_name(struct platform_device *platformdev)
> > >   }
> > >   static u64
> > > -nouveau_name(struct drm_device *dev)
> > > +nouveau_name(struct device *dev)
> > >   {
> > > -	if (dev_is_pci(dev->dev))
> > > -		return nouveau_pci_name(to_pci_dev(dev->dev));
> > > +	if (dev_is_pci(dev))
> > > +		return nouveau_pci_name(to_pci_dev(dev));
> > >   	else
> > > -		return nouveau_platform_name(to_platform_device(dev->dev));
> > > +		return nouveau_platform_name(to_platform_device(dev));
> > This looks like it should be a separate patch.
> 
> No.  One of its callers is now before drm_device.dev is valid. Also, the

Which doesn't seem necessary. You could call drm_dev_alloc() before
nvif_driver_init() in nouveau_drm_device_new(), can't you?

> remove-ioctl series removes these functions entirely.

Then why bother changing?

> 
> 
> > 
> > >   }
> > >   static inline bool
> > > @@ -209,9 +209,11 @@ nouveau_cli_fini(struct nouveau_cli *cli)
> > >   	nouveau_vmm_fini(&cli->vmm);
> > >   	nvif_mmu_dtor(&cli->mmu);
> > >   	nvif_device_dtor(&cli->device);
> > > -	mutex_lock(&cli->drm->master.lock);
> > > -	nvif_client_dtor(&cli->base);
> > > -	mutex_unlock(&cli->drm->master.lock);
> > > +	if (cli != &cli->drm->master) {
> > > +		mutex_lock(&cli->drm->master.lock);
> > > +		nvif_client_dtor(&cli->base);
> > > +		mutex_unlock(&cli->drm->master.lock);
> > > +	}
> > >   }
> > >   static int
> > > @@ -241,7 +243,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
> > >   		{ NVIF_CLASS_VMM_NV04 , -1 },
> > >   		{}
> > >   	};
> > > -	u64 device = nouveau_name(drm->dev);
> > > +	u64 device = nouveau_name(drm->dev->dev);
> > >   	int ret;
> > >   	snprintf(cli->name, sizeof(cli->name), "%s", sname);
> > > @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
> > >   	INIT_LIST_HEAD(&cli->worker);
> > >   	mutex_init(&cli->lock);
> > > -	if (cli == &drm->master) {
> > > -		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
> > > -				       cli->name, device, &cli->base);
> > > -	} else {
> > > +	if (cli != &drm->master) {
> > >   		mutex_lock(&drm->master.lock);
> > >   		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
> > >   				       &cli->base);
> > > @@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
> > >   	nouveau_cli_fini(&drm->client);
> > >   	nouveau_cli_fini(&drm->master);
> > >   	destroy_workqueue(drm->sched_wq);
> > > -	nvif_parent_dtor(&drm->parent);
> > >   	mutex_destroy(&drm->clients_lock);
> > >   }
> > > @@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
> > >   	struct drm_device *dev = drm->dev;
> > >   	int ret;
> > > -	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> > > -	drm->master.base.object.parent = &drm->parent;
> > Moving this to nouveau_drm_device_new(), plus the resulting changes in error
> > handling, don't seem to be related to this commit either.
> 
> They are, because they're needed by nvif printk macros, and as other
> nvif-related setup moves to this function, they'll oops without it.

Such things definitely deserve a comment, this is not obvious.

> 
> Yes, the linkage between "parent" and master.base (nvif_client) is clumsy,
> but, once again, this is fixed in the remove-ioctl series.

Less important if removed later on, but you still want to make it obvious to the
reviewers that what you are doing is required and the "right" thing to do.

> 
> > 
> > > -
> > >   	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
> > >   					WQ_MAX_ACTIVE);
> > > -	if (!drm->sched_wq) {
> > > -		ret = -ENOMEM;
> > > -		goto fail_alloc;
> > > -	}
> > > +	if (!drm->sched_wq)
> > > +		return -ENOMEM;
> > >   	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
> > >   	if (ret)
> > > @@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
> > >   	nouveau_cli_fini(&drm->master);
> > >   fail_wq:
> > >   	destroy_workqueue(drm->sched_wq);
> > > -fail_alloc:
> > > -	nvif_parent_dtor(&drm->parent);
> > >   	return ret;
> > >   }
> > > @@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
> > >   	if (drm->dev)
> > >   		drm_dev_put(drm->dev);
> > > +	nvif_client_dtor(&drm->master.base);
> > > +	nvif_parent_dtor(&drm->parent);
> > > +
> > >   	kfree(drm);
> > >   }
> > > @@ -753,6 +747,14 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
> > >   	drm->nvkm = device;
> > > +	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> > > +	drm->master.base.object.parent = &drm->parent;
> > > +
> > > +	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
> > > +			       nouveau_name(parent), &drm->master.base);
> > > +	if (ret)
> > > +		goto done;
> > > +
> > >   	drm->dev = drm_dev_alloc(drm_driver, parent);
> > >   	if (IS_ERR(drm->dev)) {
> > >   		ret = PTR_ERR(drm->dev);
> > > -- 
> > > 2.45.1
> > > 
> 

