Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 299D7CBAC8B
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2825710EAB5;
	Sat, 13 Dec 2025 12:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LBc2/Das";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDBE10E104
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 15:41:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 909776181E;
 Fri, 26 Jul 2024 15:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C8AEC32782;
 Fri, 26 Jul 2024 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722008469;
 bh=LMzbVZA4QYawYf4BRRlbZ4n/Y3AGIuAifB0ECz0TYWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LBc2/DasYPuibayilf6QlhnErzKO11OVZA6Cj6XW5Zh1XYv1H9ou/JyO2aufIJWar
 YM8RKJ5XFYhWe0/yZzZyYt3/mZiOSTfI39iBtRxAKlyGNCke0G5yz8oSnJO1ptp5/l
 0oX+wMTkDQzyffJbyfV3aTFILTsdxWEuRUrZ8bS2KHWeO+FFKnUbVLfRxl3HJ/nruO
 l7M8CuvHClUyl7hm/UtbXlsQp7//3PBOQkrxTk0sTFmYDMssP34ftyO/C/cY5asYKI
 CpYdPSfcQ+A162eBwKklspKpy4IcjWpUwi8Sq9lH7m+2TiVbNoYh0L+QFvFzCxRNdj
 ZtuHxIFUiuLZw==
Date: Fri, 26 Jul 2024 17:41:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
 <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:50 +0000
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

On Fri, Jul 26, 2024 at 02:27:53PM +1000, Ben Skeggs wrote:
> > > > > +
> > > > > +static struct nouveau_drm *
> > > > > +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
> > > > > +		       struct nvkm_device *device)
> > > > > +{
> > > > > +	struct nouveau_drm *drm;
> > > > > +	int ret;
> > > > > +
> > > > > +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
> > > > > +	if (!drm)
> > > > > +		return ERR_PTR(-ENOMEM);
> > > > > +
> > > > > +	drm->dev = drm_dev_alloc(drm_driver, parent);
> > > > Since you're reworking this anyways, can we switch to devm_drm_dev_alloc()?
> > > > 
> > > > This also gets us rid of nouveau_drm_device_del().
> > > No, we can't.  I originally had this change as a cleanup patch in the series
> > > I posted implementing aux bus support.  However it turns out that in order
> > > to avoid breaking udev etc, we can't use the aux device as parent of the drm
> > Can you please expand a bit on what was breaking?
> 
> Sorry, I meant to say PRIME, not udev.  The device selection logic ties the
> DRM device back to its sysfs node, and doesn't understand the auxiliary
> bus.  So, if nouveau were to use its auxiliary device as parent of the DRM
> device, PRIME breaks.

The Vulkan device selector stuff looks like it should mostly work.

However, I guess you refer to the loader stuff in Mesa that uses
drmGetDevices2() from libdrm? This stuff indeed whitelists busses it accepts to
report DRM device from:

	{ "/pci", DRM_BUS_PCI },
	{ "/usb", DRM_BUS_USB },
	{ "/platform", DRM_BUS_PLATFORM },
	{ "/spi", DRM_BUS_PLATFORM },
	{ "/host1x", DRM_BUS_HOST1X },
	{ "/virtio", DRM_BUS_VIRTIO },

Not a big deal to just add it for a new driver, but obviously we can't just do
this for an existing one.

> Fortunately it didn't turn out to be necessary, and we
> can happily probe() against the auxiliary device and still use the PCI
> device as the DRM device's parent.

At a first glance, I guess this should work. But, before we introduce
workarounds like this one and add even more complexity, I wonder what's the
benefit of doing this for Nouveau in the first place? I think we agreed to this
split for Nova, for the reasons discussed in [1].

[1] https://lore.kernel.org/dri-devel/20240613170211.88779-1-bskeggs@nvidia.com/

> 
> > 
> > > device and instead have to continue passing the pci/platform device as we do
> > > now.
> > > 
> > > Using devm_drm_dev_alloc() with the pci device as parent would tie the
> > > lifetime of the drm device to the pci device, which is owned by nvkm (after
> > How does this tie the lifetime of the drm device to the pci device? It's the
> > other way around, the drm device takes a reference of its parent (i.e. the pci
> > device).
> > 
> > I don't think there's anything wrong with that.
> 
> My understanding is that devres will cleanup allocations when the driver
> detaches from the device.

Right, I think I took that too literally.

The lifetime of the DRM device (or more precisely one of its references) is
bound to the binding between the parent device and its corresponding driver.

But the lifetime of the parent device itself is bound to the DRM device.

So, yes this doesn't work, and proves the point that initializing the DRM device
with the parent's parent is just a workaround.

> With the auxdev changes, it's *NVKM* that's
> attached to the PCI device, not the DRM driver (which is attached to an
> auxiliary device instead).
> 
> This means that the devm_drm_dev_init_release() won't be called when the DRM
> driver detaches from its auxiliary device as it should, but when NVKM
> detaches from the PCI device, which isn't the most obvious and could lead to
> confusion.
> 
> It also entirely blows up in the split module case as nouveau.ko is unloaded
> already by the time NVKM detaches and drm_dev_put() gets called.
> 
> > 
> > > the auxdev series).  We could look at changing devm_drm_dev_alloc() of
> > > course, but I think that's best left until later.
> > I don't think that this is necessary.
