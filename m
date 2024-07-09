Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 989A092BD4D
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 16:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34410E099;
	Tue,  9 Jul 2024 14:44:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JEuZMKCn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E168C10E099
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720536257;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J00E74qyOH5PrXTnHCbqN48Jx4bgW9wPzuaecMjdvPU=;
 b=JEuZMKCnRuiGFaDUd7DeD8wpMtUs3iCnKfEQQHTCMud7JB9gQHV9GoMO28F49A2LKZgcXP
 rhVsHfg2hpXNYwXjE/tGhdkX+FSMQ6WDL12ss+uY2WS6k/8owT8fLB5YKTziMJqb2TuK1x
 W5IzzcM22d4bDHxOKDAQtyQ6gx+VrW0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-G9iydREpMF2cgWWA1Iwgcw-1; Tue, 09 Jul 2024 10:44:16 -0400
X-MC-Unique: G9iydREpMF2cgWWA1Iwgcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42725ec6e0aso3374545e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 09 Jul 2024 07:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720536254; x=1721141054;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J00E74qyOH5PrXTnHCbqN48Jx4bgW9wPzuaecMjdvPU=;
 b=A6zK7ZZUSf82O93dS2jJpVclj3UMSJ2Vmi4RPX8w1Tcgb1QhtNUkHlA2TWC33mZ/EM
 J8pgkECKfd1a9R2ye0yLK3spuEwY7qb1EYQZCtqvAgkGHnnnBGFxKwu/kngsPiKAK0Md
 CoEnI9EqAJjWSj9FhLAjdw017EbwhJz8oMSRZWu+cddaIG6aahucQQ/fAc3HMjH+ibUQ
 kUOAS5mnKiyEXqmUsZW35DNF0AFWLH3H2BYbXgXmSswNS9aPIiQEOH3noaG1VsNskmez
 +Zi+VowGnGvDqVrH0m4rHvx2WaWZRiii11tq0q8/WxS9s1Dpg+n+JjeBWat33JH0vIIV
 x5CQ==
X-Gm-Message-State: AOJu0YxcHAg9jlmvae7AiNM0BHz5/dnjD9HBT45NpxC6FTN4trKshLPr
 1iHFpOeCKumwqtWUnurRzk5osvLRiiYQf8R+kgiGuKli6oECPfBYHy3+5myM40fONGV/iTeEX3x
 +TZ1fXGaRk3Tv6W9yXyPMseDsHW+4RE9ze1iNx66ANFLBeNa82nFZk5y+sltPDBnMvxwJ07g=
X-Received: by 2002:adf:f98c:0:b0:365:e76b:e908 with SMTP id
 ffacd0b85a97d-367cea68090mr1679494f8f.24.1720536254586; 
 Tue, 09 Jul 2024 07:44:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzbK+RSj1O9irKf5qDm+p9/ioQ8Nnc0i9rIuRFKroS3Uug4SscEBg+I0xAEFO3y41X0He+Gg==
X-Received: by 2002:adf:f98c:0:b0:365:e76b:e908 with SMTP id
 ffacd0b85a97d-367cea68090mr1679482f8f.24.1720536254138; 
 Tue, 09 Jul 2024 07:44:14 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cdfa07dasm2748136f8f.87.2024.07.09.07.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 07:44:13 -0700 (PDT)
Date: Tue, 9 Jul 2024 16:44:11 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 00/37] drm/nouveau: misc. cleanups and removal of
 unused apis
Message-ID: <Zo1Mu6PrrEuSSR6M@pollux>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
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

Hi Ben,

On Fri, Jul 05, 2024 at 04:36:44AM +1000, Ben Skeggs wrote:
> This series is a smaller subset of the prior series I posted, that aimed
> to remove the ioctl layer between NVKM and the nouveau DRM driver.
> 
> Whilst this series doesn't go the full way, it aims to remove a bunch of
> internal APIs that aren't useful anymore so they don't have to be ported,
> and to cleanup a few paths in the DRM driver that have suffered from bit-
> rot over the years to ensure it's safe to remove the ioctl layer next.
> 
> There's more details of the specific changes in the relevant commits.
> 
> A git tree is available at [1], and the remaining commits that were in
> the prior series, but not this one, are available at [2].
> 
> v2:
> - prepended a couple of patches that begin to cleanup pci vs tegra
>   paths, addressing some comments about variable naming, more in a
>   future series
> - rebased on current drm-misc-next
> - other changes mentioned in their relevant commits
> 
> [1] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.00-cleanup
> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.01-remove-ioctl

Thanks for the follow-up.

There are quite some checkpatch errors and warnings. It looks like most of them
originate from moving around existing code.

Did you check if you introduce new ones? Also, it's probably fine to fix
existing ones when changing things up (where appropriate).

> 
> Ben Skeggs (37):
>   drm/nouveau: move nouveau_drm_device_fini() above init()
>   drm/nouveau: handle pci/tegra drm_dev_{alloc,register} from common
>     code
>   drm/nouveau: replace drm_device* with nouveau_drm* as dev drvdata
>   drm/nouveau: create pci device once
>   drm/nouveau: store nvkm_device pointer in nouveau_drm
>   drm/nouveau: move allocation of root client out of nouveau_cli_init()
>   drm/nouveau: add nouveau_cli to nouveau_abi16
>   drm/nouveau: handle limited nvif ioctl in abi16
>   drm/nouveau: remove abi16->device
>   drm/nouveau: remove abi16->handles
>   drm/nouveau/nvkm: remove detect/mmio/subdev_mask from device args
>   drm/nouveau/nvkm: remove perfmon
>   drm/nouveau/nvkm: remove nvkm_client_search()
>   drm/nouveau/nvif: remove support for userspace backends
>   drm/nouveau/nvif: remove route/token
>   drm/nouveau/nvif: remove nvxx_object()
>   drm/nouveau/nvif: remove nvxx_client()
>   drm/nouveau/nvif: remove driver keep/fini
>   drm/nouveau/nvif: remove client device arg
>   drm/nouveau/nvif: remove client version
>   drm/nouveau/nvif: remove client devlist
>   drm/nouveau/nvif: remove client fini
>   drm/nouveau/nvif: remove device args
>   drm/nouveau: always map device
>   drm/nouveau/nvif: remove device rd/wr
>   drm/nouveau/nvif: remove disp chan rd/wr
>   drm/nouveau: move nvxx_* definitions to nouveau_drv.h
>   drm/nouveau: add nvif_mmu to nouveau_drm
>   drm/nouveau: pass drm to nouveau_mem_new(), instead of cli
>   drm/nouveau: pass drm to nv50_dmac_create(), rather than device+disp
>   drm/nouveau: pass cli to nouveau_channel_new() instead of drm+device
>   drm/nouveau: remove nouveau_chan.device
>   drm/nouveau: remove chan->drm
>   drm/nouveau: remove master
>   drm/nouveau: remove push pointer from nouveau_channel
>   drm/nouveau/kms: remove a few unused struct members and fn decls
>   drm/nouveau/kms: remove push pointer from nv50_dmac
> 
>  drivers/gpu/drm/nouveau/Kbuild                |   1 -
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  14 +-
>  drivers/gpu/drm/nouveau/dispnv04/dac.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c        |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |   7 +-
>  drivers/gpu/drm/nouveau/dispnv04/disp.h       |   2 +-
>  drivers/gpu/drm/nouveau/dispnv04/hw.c         |   9 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |   4 +-
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c   |  21 +-
>  drivers/gpu/drm/nouveau/dispnv50/base827c.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/base907c.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c   |   8 +-
>  drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |   4 +-
>  drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/dac507d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/dac907d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  74 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h       |  14 +-
>  drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/head827d.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/head907d.c   |  26 +-
>  drivers/gpu/drm/nouveau/dispnv50/head917d.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc37d.c   |  18 +-
>  drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |  12 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c   |   6 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly827e.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly907e.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/pior507d.c   |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sor507d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sor907d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/sorc37d.c    |   2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c   |   7 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |  24 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c   |  10 +-
>  drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c   |   2 +-
>  drivers/gpu/drm/nouveau/include/nvif/cl0080.h |   7 -
>  drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 -
>  drivers/gpu/drm/nouveau/include/nvif/client.h |  11 +-
>  drivers/gpu/drm/nouveau/include/nvif/device.h |  37 +-
>  drivers/gpu/drm/nouveau/include/nvif/driver.h |   5 -
>  drivers/gpu/drm/nouveau/include/nvif/if0000.h |  10 -
>  drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
>  drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
>  drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  27 -
>  drivers/gpu/drm/nouveau/include/nvif/object.h |  26 +-
>  drivers/gpu/drm/nouveau/include/nvif/os.h     |  19 +
>  .../drm/nouveau/include/nvkm/core/client.h    |   1 -
>  .../drm/nouveau/include/nvkm/core/device.h    |   1 -
>  .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
>  .../drm/nouveau/include/nvkm/core/object.h    |  14 -
>  .../drm/nouveau/include/nvkm/core/oclass.h    |   2 -
>  .../gpu/drm/nouveau/include/nvkm/core/os.h    |  19 -
>  .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
>  .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
>  .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
>  drivers/gpu/drm/nouveau/nouveau_abi16.c       | 321 +++++--
>  drivers/gpu/drm/nouveau/nouveau_abi16.h       |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.c        |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_bios.h        |   1 +
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c      |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c      |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_bo74c1.c      |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo85b5.c      |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo9039.c      |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_bo90b5.c      |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_boa0b5.c      |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c        |  96 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.h        |   8 +-
>  drivers/gpu/drm/nouveau/nouveau_display.c     |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_display.h     |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_dma.c         |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c        |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 395 ++++----
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |  51 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c       |  17 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  21 +-
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  46 +-
>  drivers/gpu/drm/nouveau/nouveau_led.c         |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.c         |  38 +-
>  drivers/gpu/drm/nouveau/nouveau_mem.h         |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_nvif.c        |   2 -
>  drivers/gpu/drm/nouveau/nouveau_platform.c    |  11 +-
>  drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |  12 +-
>  drivers/gpu/drm/nouveau/nouveau_usif.c        | 194 ----
>  drivers/gpu/drm/nouveau/nouveau_usif.h        |  10 -
>  drivers/gpu/drm/nouveau/nouveau_vga.c         |  14 +-
>  drivers/gpu/drm/nouveau/nv04_fence.c          |   2 +-
>  drivers/gpu/drm/nouveau/nv10_fence.c          |   2 +-
>  drivers/gpu/drm/nouveau/nv17_fence.c          |  10 +-
>  drivers/gpu/drm/nouveau/nv50_fence.c          |   2 +-
>  drivers/gpu/drm/nouveau/nv84_fence.c          |  12 +-
>  drivers/gpu/drm/nouveau/nvc0_fence.c          |   4 +-
>  drivers/gpu/drm/nouveau/nvif/client.c         |  32 +-
>  drivers/gpu/drm/nouveau/nvif/device.c         |  15 +-
>  drivers/gpu/drm/nouveau/nvif/driver.c         |  32 +-
>  drivers/gpu/drm/nouveau/nvif/object.c         |  40 -
>  drivers/gpu/drm/nouveau/nvkm/core/client.c    |  64 +-
>  drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     |  91 +-
>  drivers/gpu/drm/nouveau/nvkm/core/object.c    |  50 -
>  drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    |  42 -
>  drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |   4 +-
>  drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 -
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 479 +++++-----
>  .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   4 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   2 -
>  .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/user.c |  93 +-
>  .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   |  24 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild |  11 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 867 ------------------
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c  | 165 ----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf100.c    | 243 -----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf100.h    |  20 -
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf108.c    |  66 --
>  .../gpu/drm/nouveau/nvkm/engine/pm/gf117.c    |  80 --
>  .../gpu/drm/nouveau/nvkm/engine/pm/gk104.c    | 184 ----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gt200.c    | 157 ----
>  .../gpu/drm/nouveau/nvkm/engine/pm/gt215.c    | 138 ---
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c | 123 ---
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h |  15 -
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c | 175 ----
>  drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 105 ---
>  128 files changed, 1105 insertions(+), 4199 deletions(-)
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
>  delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nouveau_usif.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
>  delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
> 
> -- 
> 2.45.1
> 

