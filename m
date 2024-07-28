Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978693E9B5
	for <lists+nouveau@lfdr.de>; Sun, 28 Jul 2024 23:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6A210E030;
	Sun, 28 Jul 2024 21:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dqbpFhpv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B540410E030
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2024 21:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722202461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WDjRDdxJvUgyjNllUOSRPG7PWMivs21epBW052uXsQk=;
 b=dqbpFhpv+rCgkcqNg+kFMMnzY/c+R5AP4O1gRkHTmlXM1aC45tL4pWmggR5z5tn3xZxyx/
 ZJpHxWW+bPadNX1DhVIOOzBldpP90gi+tBAZOO0SIAZU0ZDxnbaluxkGK4X7eGC0FB4MjI
 68XJLN8LkFdlIosFmZ71lh52TSoi19U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-LUJ-ms9GP6qP79jtvFfEKw-1; Sun, 28 Jul 2024 17:34:19 -0400
X-MC-Unique: LUJ-ms9GP6qP79jtvFfEKw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5af9df8ef73so2862126a12.1
 for <nouveau@lists.freedesktop.org>; Sun, 28 Jul 2024 14:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722202458; x=1722807258;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WDjRDdxJvUgyjNllUOSRPG7PWMivs21epBW052uXsQk=;
 b=anIx28TApbOKm9hCGY4TNGO9a2etPio/HeuXG9qsU4iRKoNXwZwt6Ls3MsT44FCxJG
 1uATy4g4cgJv96Uf4xb0bPQvmpPYfVpepHnw8iFHYOOkn0glUY+kPDejKVKuUC7eL1H2
 zRNYADEEbWpj2KzT+oLR9zIZ5uP/dJlU+OHs5tF71j1RKJBvY8X6vGvw++47S4VDo445
 QX/3dbKmCMHzbNwG8vijKpDDRYLyQpFBMz9Dx5RaQeEdC0VhwGM5qqH3DpQ1HBc9g8Qg
 +3ijJT8USIILGWrxH+prQ2mMPSvMqy5On8f6UNoP3zqSGrJWMgyfwQ3MtTPxa32wHxN5
 GsoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVumt1STXnPfk9olRh/MF1qA/7MUxn8p+nPxSfU3fX/FpcVoPVmQUuOSravpndKuGa0S6UdH45bFjT/NWNrQUM89GkWs2Mg2eoJybnd8w==
X-Gm-Message-State: AOJu0YyDtGhCntiLkHT3DyLlfY69fFdhE6S/bIvZcNX0BnFmcTJzaBZa
 DbzpALT7SjhpJhoEPdsqdROVV1bBnO2hZ92FPdoLEtFyPhN21fXyNbVKK1HM9htSZNBvtws34cR
 LUNHHSrDVp9fCWr7aljpqLZKmICRBNjBzd0P6tNwP3S8Ii9bAAV9tvdyDkLqNPBZ1e+3HBOU=
X-Received: by 2002:a50:9e66:0:b0:5af:5538:e03e with SMTP id
 4fb4d7f45d1cf-5b017787918mr5541707a12.9.1722202457816; 
 Sun, 28 Jul 2024 14:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlrhgsckcZ/1k+Fni2/7VNMn1yQRdmmrh77wErdlWWuBzh5jD3hD7UZ/IKQ/7JFJmdsS3ghw==
X-Received: by 2002:a50:9e66:0:b0:5af:5538:e03e with SMTP id
 4fb4d7f45d1cf-5b017787918mr5541695a12.9.1722202457201; 
 Sun, 28 Jul 2024 14:34:17 -0700 (PDT)
Received: from pollux.localdomain ([2a02:810d:4b3f:ee94:1880:4e6c:1065:fb6a])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac63b59cb0sm4836024a12.45.2024.07.28.14.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jul 2024 14:34:16 -0700 (PDT)
Date: Sun, 28 Jul 2024 23:34:14 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Ben Skeggs <bskeggs@nvidia.com>, nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <Zqa5VovShzF1lGC2@pollux.localdomain>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
 <20240704183721.25778-3-bskeggs@nvidia.com>
 <Zo1UP-aapSyf2Rnj@pollux>
 <e67e0c36-5c21-4f37-b489-78ec45298c4e@nvidia.com>
 <ZppJuiWfgfkEKeCH@pollux>
 <9760d7df-dfbf-478e-9b0e-ddc7768b8de1@nvidia.com>
 <ZqPDkZ2t5MjXX4Sx@cassiopeiae>
 <a6b13446-d903-4a94-9afc-ce04b41d5dbf@nvidia.com>
 <20240728181308.GA3043865@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240728181308.GA3043865@nvidia.com>
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

On Sun, Jul 28, 2024 at 03:13:08PM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 26, 2024 at 11:07:19PM +1000, Ben Skeggs wrote:
> 
> > > Right, I think I took that too literally.
> > > 
> > > The lifetime of the DRM device (or more precisely one of its references) is
> > > bound to the binding between the parent device and its corresponding driver.
> > > 
> > > But the lifetime of the parent device itself is bound to the DRM device.
> > > 
> > > So, yes this doesn't work, and proves the point that initializing the DRM device
> > > with the parent's parent is just a workaround.
> > 
> > You're greatly overstating the "complexity" that's added here. It's a minor
> > inconvenience that doesn't require much code at all to implement, and is
> > essentially irrelevant outside of module load/unload.
> > 
> > I agree it's not ideal, and userspace should gain auxiliary bus support
> > before a new driver implements a similar architecture, but it's really not
> > that big a deal.
> 
> Ben asked me to share what other places are doing this stuff.
> 
> To recap, when converting a legacy driver into an aux split we've
> found in several places that there is existing userspace that has
> hardwired certain sysfs paths. ie an assumption that an infiniband
> device appears under the sys/../pci/ directory.
> 
> Argubaly this userspace is not in good shape, but we have to preserve
> it.
> 
> So the approach is to make the sysfs visible elements tied to the
> original sysfs location (ie the pci device) and continue to use aux
> otherwise for discovery, probing and tying subsystems together.
> 
> Obviously you have to be careful about the difference between the
> sysfs parent (for owning a subordinate struct device, sysfs files,
> etc) and the probe time parent (for owning devres, and other tasks)

I think we're on the same page with all that. As clarified in [1], that's not a
big concern, I was referring to the changes required to integrate the auxbus
stuff.

[1] https://lore.kernel.org/nouveau/ZqRTY1GjPE6CZqL3@pollux.localdomain/

> 
> We've been fortunate enough that subsystems so far have had a clean
> enough setup that this is easy enough to do. It sounds like DRM is the
> same if it just requires calling  a put in .remove() - that is pretty

Yes, I already mentioned that that DRM devices should still work with this
workaround.

> normal (though most subsystems would call that unregister, not put)

A DRM device is reference counted and can out-live the driver, hence the
drm_dev_put() call in .remove(). There is also a special drm_dev_unplug()
function, which does not only unregister the DRM device, but also sets a guard
to be able prevent HW accesses after the HW is accessible anymore.

> 
> Jason
> 

