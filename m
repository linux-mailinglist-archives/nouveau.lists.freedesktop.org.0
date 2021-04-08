Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28E35823C
	for <lists+nouveau@lfdr.de>; Thu,  8 Apr 2021 13:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85B46EAB4;
	Thu,  8 Apr 2021 11:42:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5E46EAB1
 for <nouveau@lists.freedesktop.org>; Thu,  8 Apr 2021 11:42:35 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a12so1763221wrq.13
 for <nouveau@lists.freedesktop.org>; Thu, 08 Apr 2021 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=R65GywHXY6Fc2e+ProU0fQrhGygShywDhnFpjD0tbcA=;
 b=f9q20eAowroji1JeNyfiJW1gyq3Qbig/EeYtCCZbQBaaEmzE7iXHwg0uLGw6deCknA
 wzpgxc2pY3KDewfYQUhTdFpudSc1/KVc0S66EDHjSO3vxdCb7k34DnN9v909IaYBD1E9
 wRJp/KDZxjM5MsSceyvaWgO2+VrHM2OysnNm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=R65GywHXY6Fc2e+ProU0fQrhGygShywDhnFpjD0tbcA=;
 b=C6g86zQEb6RRUYwr92pxjMj8iv99rSziV+aeLTMqTuM8GHHPgZ8QGDS1lxKRLAJpKa
 rLPk7f2J6FHPyKEsn5JDlDNlv1AIfBAtNUowT8LtTYUlRoIdsYnfv6an8+Dm2fDp4U7N
 J4pZ5ABzpKZ4u2nevIge3OtkiLY76GPnrUJflGTjmUsXYQsvKgI1ci94W10YO8NN2B7a
 iM4S/+6mTJnJX5NwAJMVXjJby20WsvLlrGgbJLy+KpaoOSM3/QTZvvJ3nNXsQV4tJVAK
 Meri/XvBvR3xlDOUmW41aisH6eQTAuS3WG0sSQTRunfIhE+ygyyyZ6xaB5VDDWKsO1Q3
 RK/Q==
X-Gm-Message-State: AOAM533egiq/qEu6XgeMUpIlcMM2cw/0i7oyA8u6or4i9GSKvkAQJZQF
 HjUCfAFriBkDDRCLuNmAcEOB1g==
X-Google-Smtp-Source: ABdhPJwh4uXfJD5FrmhaWotHi5lg733P1+EI0n9GZ++/IedyrAicmIC7s7JbFeYqPqga68QeuC1qFw==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr10712722wrp.295.1617882153804; 
 Thu, 08 Apr 2021 04:42:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m9sm15723025wrr.82.2021.04.08.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:42:33 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:42:31 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <YG7sJ9xf3he4OZui@phenom.ffwll.local>
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <YG7msOScvAKpjAXx@phenom.ffwll.local>
 <78bd7249-8bea-e61d-ab7f-7067d31aa854@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78bd7249-8bea-e61d-ab7f-7067d31aa854@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Subject: Re: [Nouveau] [PATCH 0/8] drm: Clean up mmap for TTM-based GEM
 drivers
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
Cc: shashank.sharma@amd.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 Felix.Kuehling@amd.com, sroland@vmware.com, dri-devel@lists.freedesktop.org,
 nirmoy.das@amd.com, linux-graphics-maintainer@vmware.com,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 alexander.deucher@amd.com, ray.huang@amd.com, emil.velikov@collabora.com,
 sam@ravnborg.org, christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 01:38:59PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 08.04.21 um 13:19 schrieb Daniel Vetter:
> > On Tue, Apr 06, 2021 at 11:08:55AM +0200, Thomas Zimmermann wrote:
> > > Implement mmap via struct drm_gem_object_functions.mmap for amdgpu,
> > > radeon and nouveau. This allows for using common DRM helpers for
> > > the mmap-related callbacks in struct file_operations and struct
> > > drm_driver. The drivers have their own vm_ops, which are now set
> > > automatically by the DRM core functions. The code in each driver's
> > > verify_access becomes part of the driver's new mmap implementation.
> > =

> > Is there anything left in there which isn't already handled by the gem
> > checks? Iirc there was some custom limit for ttm drivers once to allow
> > co-existing with ums drivers, but that's never really been a thing since
> > forever ...
> =

> Vmwgfx does its own thing. radeon and amdgpu have some checks (userptr). =
But
> it's all very small. The general tests will be in the GEM helpers.

Ah userptr makes tons of sense. I think that should be rejected when
creating the mmap offset, and then a WARN_ON to bail out.

But that means we'd need to lift the basic userptr scaffolding to
drm_gem_object. Which would make tons of sense imo (all the various
semi-broken copypasta versions aren't great), but that's definitely for
another time.
-Daniel

> =

> Best regards
> Thomas
> =

> > -Daniel
> > =

> > > =

> > > With the GEM drivers converted, vmwgfx is the only user of
> > > ttm_bo_mmap() and related infrastructure. So move everything into
> > > vmwgfx and delete the rsp code from TTM.
> > > =

> > > This touches several drivers. Preferably everything would be merged
> > > at once via drm-misc-next.
> > > =

> > > Thomas Zimmermann (8):
> > >    drm/ttm: Don't override vm_ops callbacks, if set
> > >    drm/amdgpu: Remove unused function amdgpu_bo_fbdev_mmap()
> > >    drm/amdgpu: Implement mmap as GEM object function
> > >    drm/radeon: Implement mmap as GEM object function
> > >    drm/nouveau: Implement mmap as GEM object function
> > >    drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
> > >    drm/vmwgfx: Inline vmw_verify_access()
> > >    drm/ttm: Remove ttm_bo_mmap() and friends
> > > =

> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 64 +++++++++++++++++++
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 19 ------
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  2 -
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 71 ------------------=
---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
> > >   drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ---
> > >   drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
> > >   drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 +++++++++++
> > >   drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 --------------
> > >   drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
> > >   drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
> > >   drivers/gpu/drm/radeon/radeon_gem.c         | 52 +++++++++++++++
> > >   drivers/gpu/drm/radeon/radeon_ttm.c         | 65 -------------------
> > >   drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
> > >   drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++---------------
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
> > >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 51 ++++++++++++++-
> > >   include/drm/ttm/ttm_bo_api.h                | 13 ----
> > >   include/drm/ttm/ttm_device.h                | 15 -----
> > >   22 files changed, 212 insertions(+), 365 deletions(-)
> > > =

> > > --
> > > 2.30.2
> > > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
