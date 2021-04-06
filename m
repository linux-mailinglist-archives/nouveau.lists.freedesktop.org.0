Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87240354F77
	for <lists+nouveau@lfdr.de>; Tue,  6 Apr 2021 11:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B9F6E0AB;
	Tue,  6 Apr 2021 09:09:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871EE6E0AB;
 Tue,  6 Apr 2021 09:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 11B72B2FA;
 Tue,  6 Apr 2021 09:09:06 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
Date: Tue,  6 Apr 2021 11:08:55 +0200
Message-Id: <20210406090903.7019-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/8] drm: Clean up mmap for TTM-based GEM drivers
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Implement mmap via struct drm_gem_object_functions.mmap for amdgpu,
radeon and nouveau. This allows for using common DRM helpers for
the mmap-related callbacks in struct file_operations and struct
drm_driver. The drivers have their own vm_ops, which are now set
automatically by the DRM core functions. The code in each driver's
verify_access becomes part of the driver's new mmap implementation.

With the GEM drivers converted, vmwgfx is the only user of
ttm_bo_mmap() and related infrastructure. So move everything into
vmwgfx and delete the rsp code from TTM.

This touches several drivers. Preferably everything would be merged
at once via drm-misc-next.

Thomas Zimmermann (8):
  drm/ttm: Don't override vm_ops callbacks, if set
  drm/amdgpu: Remove unused function amdgpu_bo_fbdev_mmap()
  drm/amdgpu: Implement mmap as GEM object function
  drm/radeon: Implement mmap as GEM object function
  drm/nouveau: Implement mmap as GEM object function
  drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
  drm/vmwgfx: Inline vmw_verify_access()
  drm/ttm: Remove ttm_bo_mmap() and friends

 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 46 -------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.h |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     |  4 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 64 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 19 ------
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  2 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 71 ---------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  1 -
 drivers/gpu/drm/nouveau/nouveau_bo.c        | 10 ---
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c       | 36 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c       | 49 --------------
 drivers/gpu/drm/nouveau/nouveau_ttm.h       |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c         |  3 +-
 drivers/gpu/drm/radeon/radeon_gem.c         | 52 +++++++++++++++
 drivers/gpu/drm/radeon/radeon_ttm.c         | 65 -------------------
 drivers/gpu/drm/radeon/radeon_ttm.h         |  1 -
 drivers/gpu/drm/ttm/ttm_bo_vm.c             | 60 ++---------------
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  9 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c    | 51 ++++++++++++++-
 include/drm/ttm/ttm_bo_api.h                | 13 ----
 include/drm/ttm/ttm_device.h                | 15 -----
 22 files changed, 212 insertions(+), 365 deletions(-)

--
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
