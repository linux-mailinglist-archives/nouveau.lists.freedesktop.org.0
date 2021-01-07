Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7C2ECB7F
	for <lists+nouveau@lfdr.de>; Thu,  7 Jan 2021 09:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64756E429;
	Thu,  7 Jan 2021 08:08:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFFE89CA8;
 Thu,  7 Jan 2021 08:07:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFBD9AE55;
 Thu,  7 Jan 2021 08:07:54 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Date: Thu,  7 Jan 2021 09:07:40 +0100
Message-Id: <20210107080748.4768-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v3 0/8] drm: Move struct drm_device.pdev to legacy
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I merged many of the patches that were ready in v2 into drm-misc-next. In
v3 remain only patches that need an r-b/a-b (i915/gt/gvt) or required
a change from v2.

The pdev field in struct drm_device points to a PCI device structure and
goes back to UMS-only days when all DRM drivers were for PCI devices.
Meanwhile we also support USB, SPI and platform devices. Each of those
uses the generic device stored in struct drm_device.dev.

To reduce duplication and remove the special case of PCI, this patchset
converts all modesetting drivers from pdev to dev and makes pdev a field
for legacy UMS drivers.

For PCI devices, the pointer in struct drm_device.dev can be upcasted to
struct pci_device; or tested for PCI with dev_is_pci(). In several places
the code can use the dev field directly.

After converting all drivers and the DRM core, the pdev fields becomes
only relevant for legacy drivers. In a later patchset, we may want to
convert these as well and remove pdev entirely.

v3:
	* fix one pdev reference in nouveau (Jeremy)
	* rebases
v2:
	* move whitespace fixes into separate patches (Alex, Sam)
	* move i915 gt/ and gvt/ changes into separate patches (Joonas)


Thomas Zimmermann (8):
  drm/amdgpu: Fix trailing whitespaces
  drm/amdgpu: Remove references to struct drm_device.pdev
  drm/hibmc: Remove references to struct drm_device.pdev
  drm/i915: Remove references to struct drm_device.pdev
  drm/i915/gt: Remove references to struct drm_device.pdev
  drm/i915/gvt: Remove references to struct drm_device.pdev
  drm/nouveau: Remove references to struct drm_device.pdev
  drm: Upcast struct drm_device.dev to struct pci_device; replace pdev

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 23 ++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 10 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c       |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c       | 10 +--
 drivers/gpu/drm/drm_agpsupport.c              |  9 ++-
 drivers/gpu/drm/drm_bufs.c                    |  4 +-
 drivers/gpu/drm/drm_edid.c                    |  7 ++-
 drivers/gpu/drm/drm_irq.c                     | 12 ++--
 drivers/gpu/drm/drm_pci.c                     | 26 ++++----
 drivers/gpu/drm/drm_vm.c                      |  2 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   | 13 ++--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c   |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c   | 61 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 14 ++---
 drivers/gpu/drm/i915/display/intel_csr.c      |  2 +-
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 .../gpu/drm/i915/display/intel_lpe_audio.c    |  5 +-
 drivers/gpu/drm/i915/display/intel_opregion.c |  6 +-
 drivers/gpu/drm/i915/display/intel_overlay.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_panel.c    |  4 +-
 drivers/gpu/drm/i915/display/intel_quirks.c   |  2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_vga.c      |  8 +--
 drivers/gpu/drm/i915/gem/i915_gem_phys.c      |  6 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 10 +--
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  4 +-
 drivers/gpu/drm/i915/gt/intel_reset.c         |  6 +-
 drivers/gpu/drm/i915/gvt/cfg_space.c          |  5 +-
 drivers/gpu/drm/i915/gvt/firmware.c           | 10 +--
 drivers/gpu/drm/i915/gvt/gtt.c                | 12 ++--
 drivers/gpu/drm/i915/gvt/gvt.c                |  6 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_drv.c               | 20 +++---
 drivers/gpu/drm/i915/i915_drv.h               |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.c           |  5 +-
 drivers/gpu/drm/i915/i915_getparam.c          |  5 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  2 +-
 drivers/gpu/drm/i915/i915_irq.c               |  6 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  2 +-
 drivers/gpu/drm/i915/i915_suspend.c           |  4 +-
 drivers/gpu/drm/i915/i915_switcheroo.c        |  4 +-
 drivers/gpu/drm/i915/i915_vgpu.c              |  2 +-
 drivers/gpu/drm/i915/intel_device_info.c      |  2 +-
 drivers/gpu/drm/i915/intel_region_lmem.c      |  8 +--
 drivers/gpu/drm/i915/intel_runtime_pm.c       |  2 +-
 drivers/gpu/drm/i915/intel_uncore.c           |  4 +-
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  1 -
 drivers/gpu/drm/i915/selftests/mock_gtt.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/arb.c        | 12 ++--
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  5 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h       | 14 +++--
 drivers/gpu/drm/nouveau/dispnv04/hw.c         | 10 +--
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  7 ++-
 drivers/gpu/drm/nouveau/nouveau_acpi.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        | 11 +++-
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 10 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  5 +-
 drivers/gpu/drm/nouveau/nouveau_fbcon.c       |  6 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c         | 20 +++---
 include/drm/drm_device.h                      | 12 +++-
 70 files changed, 296 insertions(+), 198 deletions(-)
 create mode 100644 drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c

--
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
