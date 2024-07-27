Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017C693DCFE
	for <lists+nouveau@lfdr.de>; Sat, 27 Jul 2024 03:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C39410E814;
	Sat, 27 Jul 2024 01:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HrAKjhrl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 918DB10E814
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2024 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722045289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A73vBDLEMb2y4qa6Jkc9ydtU80ewiMlGGSOi9185VrM=;
 b=HrAKjhrlOXP9GjYXj8Z9ilWAs8E9XsexFh5gdfO000XgOZu/qQ1DR/mgdWMclZny9mnE4m
 xNUI1G1KqpddJff1mIvhvoq/WKDNYS3FTXtXpBY1/4YsXdMFth30pFi/8SN/dV9m/OBAUk
 nTkUwRrViY2w/R92YgRVeZIZQ7xghH0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-jwkZUouMPfukE7vwm63RRg-1; Fri, 26 Jul 2024 21:54:47 -0400
X-MC-Unique: jwkZUouMPfukE7vwm63RRg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3687faecea0so134690f8f.2
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 18:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722045286; x=1722650086;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A73vBDLEMb2y4qa6Jkc9ydtU80ewiMlGGSOi9185VrM=;
 b=jVQ8pXwckQMuIP0OOgtbDpt0BEcJqioqU21nzJtSxXM39R+mnAReQoK3N+lAyNE5E/
 AHOxOzsEFBQ0QCal9+V5TULA/DUDo/LnPquMrhT+GY67t/Zx5MCImln8xe1MYtCmrJEO
 FQuB6zXM7rybL/3bCSnbDkrHFdDcHkRyilS8VH87o6YMrxj9fkX9Jy0oZE0Sa82eY2G4
 /jRuvG5AgIDAF36H4DWwtNeO62gogETkS/Jah0OBWytGQGQshxe7d5gldZk4Hl9GREgo
 wUbV4cCPK/EJo/YF2BRloHHxCwOJoXgB9XXTXICYu03kYE0E/+v4r5lWifEcFU1RZy8y
 0TUw==
X-Gm-Message-State: AOJu0YxYjDu9YxdnCKTxA26H9EkZMUbRM0//34AoLK1O7dNzJ8x4GGPT
 coUnfLAC0gIchE+29njUNHmoissM5DtZwJIPbraRFUVzSsjIwtrCwF/39T/ZM3B6GIB1RJ2+w5q
 fWjfmALnVIhHUhHUydh8JEwVNKzgB9NZjCksrbVE1Q4DSWeaKfQGRkfHhYYCR7R1CbHDh/YY=
X-Received: by 2002:a05:6000:1ccb:b0:367:95e6:158a with SMTP id
 ffacd0b85a97d-36b5d0bb424mr714894f8f.63.1722045285602; 
 Fri, 26 Jul 2024 18:54:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERUmBj9Qol4QMNME+OPLZ6RdXPX5Kq0JrgwQTn/3Jx3yKE7fXOrkJSHnIz+dtvl5REX6W7TQ==
X-Received: by 2002:a05:6000:1ccb:b0:367:95e6:158a with SMTP id
 ffacd0b85a97d-36b5d0bb424mr714886f8f.63.1722045284986; 
 Fri, 26 Jul 2024 18:54:44 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:9964:13b:63b9:b197])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367d989asm6469781f8f.29.2024.07.26.18.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 18:54:44 -0700 (PDT)
Date: Sat, 27 Jul 2024 03:54:43 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <ZqRTY1GjPE6CZqL3@pollux.localdomain>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
 <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
 <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
 <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
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

On Fri, Jul 26, 2024 at 11:07:19PM +1000, Ben Skeggs wrote:
> On 27/7/24 01:41, Danilo Krummrich wrote:
> 
> > On Fri, Jul 26, 2024 at 02:27:53PM +1000, Ben Skeggs wrote:
> > > > > > > +
> > > > > > > +static struct nouveau_drm *
> > > > > > > +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
> > > > > > > +		       struct nvkm_device *device)
> > > > > > > +{
> > > > > > > +	struct nouveau_drm *drm;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
> > > > > > > +	if (!drm)
> > > > > > > +		return ERR_PTR(-ENOMEM);
> > > > > > > +
> > > > > > > +	drm->dev = drm_dev_alloc(drm_driver, parent);
> > > > > > Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?
> > > > > > 
> > > > > > This also gets us rid of nouveau_drm_device_del().
> > > > > No, we can't.  I originally had this change as a cleanup patch in the series
> > > > > I posted implementing aux bus support.  However it turns out that in order
> > > > > to avoid breaking udev etc, we can't use the aux device as parent of the drm
> > > > Can you please expand a bit on what was breaking?
> > > Sorry, I meant to say PRIME, not udev.  The device selection logic ties the
> > > DRM device back to its sysfs node, and doesn't understand the auxiliary
> > > bus.  So, if nouveau were to use its auxiliary device as parent of the DRM
> > > device, PRIME breaks.
> > The Vulkan device selector stuff looks like it should mostly work.
> > 
> > However, I guess you refer to the loader stuff in Mesa that uses
> > drmGetDevices2() from libdrm? This stuff indeed whitelists busses it accepts to
> > report DRM device from:
> > 
> > 	{ "/pci", DRM_BUS_PCI },
> > 	{ "/usb", DRM_BUS_USB },
> > 	{ "/platform", DRM_BUS_PLATFORM },
> > 	{ "/spi", DRM_BUS_PLATFORM },
> > 	{ "/host1x", DRM_BUS_HOST1X },
> > 	{ "/virtio", DRM_BUS_VIRTIO },
> > 
> > Not a big deal to just add it for a new driver, but obviously we can't just do
> > this for an existing one.
> > 
> > > Fortunately it didn't turn out to be necessary, and we
> > > can happily probe() against the auxiliary device and still use the PCI
> > > device as the DRM device's parent.
> > At a first glance, I guess this should work. But, before we introduce
> > workarounds like this one and add even more complexity, I wonder what's the
> > benefit of doing this for Nouveau in the first place? I think we agreed to this
> > split for Nova, for the reasons discussed in [1].
> 
> Because, as I already mentioned in the cover letter for series I posted

For some reason your auxbus series never hit my inbox - fetched it from lore
now.

> implementing the auxiliary bus support, this brings immediate benefits to
> users, such as eliminating the long pauses on systems using prime whilst the
> entire GPU is woken up for some PCI query by userspace.

Sounds good, what is the difference we're talking about?

> 
> It also (finally) integrates Tegra in a reasonably clean fashion, and would
> allow the DRM-level suspend/resume code to be shared there too if someone
> were to implement the platform-level code for it.  That was not possible
> before.

I agree it's an advantage, but it's probably not too bad as it currently is
either.

> 
> > 
> > [1] https://lore.kernel.org/dri-devel/20240613170211.88779-1-bskeggs@nvidia.com/
> > 
> > > > > device and instead have to continue passing the pci/platform device as we do
> > > > > now.
> > > > > 
> > > > > Using devm_drm_dev_alloc() with the pci device as parent would tie the
> > > > > lifetime of the drm device to the pci device, which is owned by nvkm (after
> > > > How does this tie the lifetime of the drm device to the pci device? It's the
> > > > other way around, the drm device takes a reference of its parent (i.e. the pci
> > > > device).
> > > > 
> > > > I don't think there's anything wrong with that.
> > > My understanding is that devres will cleanup allocations when the driver
> > > detaches from the device.
> > Right, I think I took that too literally.
> > 
> > The lifetime of the DRM device (or more precisely one of its references) is
> > bound to the binding between the parent device and its corresponding driver.
> > 
> > But the lifetime of the parent device itself is bound to the DRM device.
> > 
> > So, yes this doesn't work, and proves the point that initializing the DRM device
> > with the parent's parent is just a workaround.
> 
> You're greatly overstating the "complexity" that's added here. It's a minor
> inconvenience that doesn't require much code at all to implement, and is
> essentially irrelevant outside of module load/unload.

When I was talking about complexity I was referring to the changes required to
integrate the auxbus stuff.

Having to call drm_dev_put() from .remove() by hand obviously isn't something
I'm overly concerned about in terms of complexity...

> 
> I agree it's not ideal, and userspace should gain auxiliary bus support
> before a new driver implements a similar architecture, but it's really not
> that big a deal.
> 
> > 
> > > With the auxdev changes, it's *NVKM* that's
> > > attached to the PCI device, not the DRM driver (which is attached to an
> > > auxiliary device instead).
> > > 
> > > This means that the devm_drm_dev_init_release() won't be called when the DRM
> > > driver detaches from its auxiliary device as it should, but when NVKM
> > > detaches from the PCI device, which isn't the most obvious and could lead to
> > > confusion.
> > > 
> > > It also entirely blows up in the split module case as nouveau.ko is unloaded
> > > already by the time NVKM detaches and drm_dev_put() gets called.
> > > 
> > > > > the auxdev series).  We could look at changing devm_drm_dev_alloc() of
> > > > > course, but I think that's best left until later.
> > > > I don't think that this is necessary.
> 

