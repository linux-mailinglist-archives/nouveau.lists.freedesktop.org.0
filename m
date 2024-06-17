Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D7590B06E
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2024 15:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD12610E3D7;
	Mon, 17 Jun 2024 13:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="bDfAQc4J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CCA10E3F2
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 13:55:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52a559e4429so583144e87.0
 for <nouveau@lists.freedesktop.org>; Mon, 17 Jun 2024 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718632521; x=1719237321; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qzDPJfsgZhb1g/yioQfswoeGptaPfmJwvwtJ/4hmYQs=;
 b=bDfAQc4JgIMTI8toRTp/epCaPQGg/mGzC+C8QyWVCiOJtDVf0Jre56YkbztOgjO9m5
 Zc6f60gr2nnkpt+Sw/Jzulwd4I/8P7tIuEtM/dScRg/RDRac7K2yPaCE+/Qe/8GvTg3P
 QPH4qh65ccs2xpzpqwwmMd1iqcuksRn45xMuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718632521; x=1719237321;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzDPJfsgZhb1g/yioQfswoeGptaPfmJwvwtJ/4hmYQs=;
 b=jtPR++aFVUGsHrJDPIxpU0crP4Ep3FijvLj76/gs7/p/hyxnaWLSVgDvFbkQSoZmfj
 pZiUtdy1GRK9O0yukxLn92sKxZBctsrW67tO7BNkNDmt9ymtkTyE0pxeljyY+S5CFmb0
 iY9HcRartp1dqHWCQc+f4RSFFGAnte5TgbH7YtOIoWHz4n8FgUaB15Fa9fmZOqaWgNpv
 9u0XClqOo8BE3A7kflz6R1LpDFVQ38URidVUNYCXY50VE5pxMnWpM3AaI/XXclMGNLCv
 wFzrpPD0ciga0jfoiKfVYY0eEDI7G9BKjzBjMNMQFxfGENiLYwGF5P46XrJI4yLSkL7c
 WkfQ==
X-Gm-Message-State: AOJu0YzINz+mwmfK2H0xIWiZ/QmOCZzI2sOafohEOOx9YFWMA+V1mDQa
 1lzzdfUCSCaDcEBjpEUE3EmRa+3eIpNtporY3eQNRSpCLoEGF+Suk6A6ZPUehdI=
X-Google-Smtp-Source: AGHT+IE1FDuu8RQV+CcOawU/GActveNfBdlcHW4ejsuoO5VdaiTxbDzq/1KovUkfPCSAVOjFCbYexA==
X-Received: by 2002:a05:6512:3ba1:b0:52c:a88c:1db8 with SMTP id
 2adb3069b0e04-52ca88c2155mr6394951e87.2.1718632520729; 
 Mon, 17 Jun 2024 06:55:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3609a892324sm1326351f8f.6.2024.06.17.06.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 06:55:20 -0700 (PDT)
Date: Mon, 17 Jun 2024 15:55:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC] GPU driver with separate "core" and "DRM" modules
Message-ID: <ZnBARgjk-83NXC5S@phenom.ffwll.local>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613170211.88779-1-bskeggs@nvidia.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 14, 2024 at 03:02:09AM +1000, Ben Skeggs wrote:
> NVIDIA has been exploring ways to better support the effort for an
> upstream kernel mode driver for GPUs that are capable of running GSP-RM
> firmware, since the introduction[1] to Nova.
> 
> Use cases have been identified for which separating the core GPU
> programming out of the full DRM driver stack is a strong requirement
> from our key customers.
> 
> An upstreamed NVIDIA GPU driver should be able to support current and
> emerging customer use cases for vGPU hosts.  NVIDIA's vGPU deployments
> to date do not support compute or graphics functionality within the
> hypervisor host, and have no dependency on the Linux graphics subsystem,
> instead implementing the minimal functionality required to run vGPU
> guest VMs.
> 
> For security-sensitive environments such as cloud infrastructure, it's
> important to continue support for running a minimal footprint vGPU host
> driver in a stripped-down / barebones kernel environment.
> 
> This can be achieved by supporting both VFIO and DRM drivers as clients
> of a core driver, without requiring a full-fledged DRM driver (or the
> DRM subsystem itself) to be built into the host kernel.
> 
> A core driver would be responsible for booting and communicating with
> GSP-RM, enumeration of HW configuration, shared/partitioned resource
> management, exception handling, and event dispatch.
> 
> The DRM driver would do all the standard things a DRM driver does, and
> implement GPU memory management (TTM/HMM), KMS, command submission etc,
> as well as providing UAPI for userspace clients.  These features would
> be implemented using HW resources allocated from a core driver, rather
> than the DRM driver being directly responsible for HW programming.
> 
> As Nouveau's KMD is already split (in the logical sense) along similar
> lines, we're using it here for the purposes of this RFC to demonstrate
> the feasibility of such an architecture, and open it up for discussion.

Sounds reasonable.

Only bikeshed I have to add is that the blessed way (according to the cool
kernel maintainers at least or something) to structure this is using
auxbus. Definitely when you end up with more than one driver binding to
the core (like maybe some system management interface thing, or perhaps a
special compute-only kernel driver).

https://dri.freedesktop.org/docs/drm/driver-api/auxiliary_bus.html

Cheers, Sima

> 
> A link[2] to a tree containing the patches is below.
> 
> [1] https://lore.kernel.org/all/3ed356488c9b0ca93845501425d427309f4cf616.camel@redhat.com/
> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.03-module
> 
> *** BLURB HERE ***
> 
> Ben Skeggs (2):
>   drm/nouveau/nvkm: export symbols needed by the drm driver
>   drm/nouveau/nvkm: separate out into nvkm.ko
> 
>  drivers/gpu/drm/nouveau/Kbuild                      |  4 ++--
>  drivers/gpu/drm/nouveau/include/nvkm/core/module.h  |  3 ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c               | 10 +---------
>  drivers/gpu/drm/nouveau/nvkm/core/driver.c          |  1 +
>  drivers/gpu/drm/nouveau/nvkm/core/gpuobj.c          |  2 ++
>  drivers/gpu/drm/nouveau/nvkm/core/mm.c              |  4 ++++
>  drivers/gpu/drm/nouveau/nvkm/device/acpi.c          |  1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c       |  1 +
>  drivers/gpu/drm/nouveau/nvkm/module.c               |  8 ++++++--
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c     |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/pll.c      |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c       |  3 +++
>  drivers/gpu/drm/nouveau/nvkm/subdev/gpio/base.c     |  3 +++
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c      |  2 ++
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c       |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c    |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/fan.c     |  1 +
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c     |  1 +
>  19 files changed, 33 insertions(+), 16 deletions(-)
> 
> -- 
> 2.44.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
