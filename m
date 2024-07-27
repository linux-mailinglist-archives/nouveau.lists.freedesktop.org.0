Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A61D3CBAABC
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5373610E9FD;
	Sat, 13 Dec 2025 12:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CvAyf0pm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D177410E82E
 for <nouveau@lists.freedesktop.org>; Sat, 27 Jul 2024 01:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1BE4B6172E;
 Sat, 27 Jul 2024 01:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C411C32782;
 Sat, 27 Jul 2024 01:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722045525;
 bh=QWkpOyQ8skDBYJJuo1q56u4T3/WsmyzpazhCLyqKVyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CvAyf0pmfrTbkFRkCmWKcYEnRjAbeag+cHWOzeQXjBfnX8E7B8723dOKkjnqq8gWI
 QRNZgHxUsM6hL2LbO0raYbbwI2gFOMWKy9yXhZdNeGMCBQKVq9whck2b9sxXJDZaNi
 Rm4i9A1Dn72WwVTlrB5Rh2FWqVTGL9d0Rbszu9dZgF8roD/BfOrrbaRGvQP1jbD8QX
 xWGwiTaCk9+tVkUmTmWOvMgItHsSmsRohkrWUw1BwgVPHn0Ha6MVg0AwzD98cG0hx7
 V4GbI0hg8LUVm6jL1RQLeA5dUMGOy0vbn2Tc5kiKcSdlHvdWNA0wZBUER4HxZU3aLB
 V8eAZQAX0LFkA==
Date: Sat, 27 Jul 2024 03:58:41 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 00/37] drm/nouveau: misc. cleanups and removal of
 unused apis
Message-ID: <ZqRUUavTiEUdi62f@cassiopeiae>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
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

On Fri, Jul 26, 2024 at 02:37:51PM +1000, Ben Skeggs wrote:
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
> v3:
> - remove unnecessary change to nouveau_name()
> - reword some commit messages/comments
> 
> [1] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.00-cleanup
> [2] https://gitlab.freedesktop.org/bskeggs/nouveau/-/tree/00.01-remove-ioctl

Applied to drm-misc-next, thanks!

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
>  drivers/gpu/drm/nouveau/include/nvif/object.h |  24 +-
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
>  drivers/gpu/drm/nouveau/nouveau_abi16.c       | 330 +++++--
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
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 387 ++++----
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |  61 +-
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
>  128 files changed, 1119 insertions(+), 4194 deletions(-)
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
