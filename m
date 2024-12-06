Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A59E783D
	for <lists+nouveau@lfdr.de>; Fri,  6 Dec 2024 19:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D3810F169;
	Fri,  6 Dec 2024 18:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OT49tmlt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22D10E612
 for <nouveau@lists.freedesktop.org>; Fri,  6 Dec 2024 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733510460; x=1765046460;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=II52/UWK1BUaOs8u4UNuLQ9mN5dPz+oX6QV8SE+chZc=;
 b=OT49tmltjk8JYRAD6Owxm6hy7+gIRuU/Wd5OqQMDnAxyI/gmJGiN9fod
 nVm1S1Z4Bx4scxc+Cj+V085Y/4pNB+M/OGsQy76PfaIA6lqndy/xp5G3y
 A+47Ir6e41s5+4In+IsYaHZalEA4K6WLe3o6Q+jRP5C6L8gx4n7W53eOZ
 UbCJkEjTlfiLw6qpNDmX1NUEIHwqiVXozIFoyjI73j69ZAGCLGlrC5dgm
 eabXSAuf1NJncjJpNf9jIjvbmGKHdI5cy6MPgP4W8q7bL3CBMXrInuAup
 WE1UtHaIGDBq8Glvnql2cm5eb3veLjhakOnsRvg4Acyw5JbqbqMFHFtbO g==;
X-CSE-ConnectionGUID: 5WX1KrLpS1aavKpTZ3blRA==
X-CSE-MsgGUID: sNlZXspDSDCfZ3KPvsb0Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33756852"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="33756852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 10:40:57 -0800
X-CSE-ConnectionGUID: DFLj0YwPTeqgj264I1bqew==
X-CSE-MsgGUID: tck0WIAXQXKHFg85XfBtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="98927915"
Received: from tassilo.jf.intel.com ([10.54.38.190])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 10:40:56 -0800
From: Andi Kleen <ak@linux.intel.com>
To: nouveau@lists.freedesktop.org
Cc: Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] nvn: Place flush_page below 4GB.
Date: Fri,  6 Dec 2024 10:40:48 -0800
Message-ID: <20241206184048.66691-1-ak@linux.intel.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
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

A system with an older Nvidia card keeps spewing this warning at boot
about NVN trying to DMA map the flush page that exceeds the 4GB mask of the
device.

I don't see any negative effects, so maybe the mask is incorrect,
but anyways, can just easily put the flush page into DMA32.

[    2.389824] nouveau 0000:65:00.0: bios: version 70.18.5f.00.00
[    2.389970] ------------[ cut here ]------------
[    2.389971] nouveau 0000:65:00.0: DMA addr 0x0000000118d1a000+4096 overflow (mask ffffffff, bus limit 0).
[    2.389977] WARNING: CPU: 0 PID: 8 at kernel/dma/direct.h:103 dma_map_page_attrs+0x280/0x2a0
[    2.389981] Modules linked in: nouveau(+) drm_ttm_helper ttm video gpu_sched crct10dif_pclmul crc32_pclmul i2c_algo_bit crc32c_intel drm_gpuvm polyval_clmulni drm_exec polyval_generic drm_display_helper mxm_wmi ghash_clmulni_intel sha512_ssse3 sha256_ssse3 cec sha1_ssse3 wdat_wdt wmi scsi_dh_rdac scsi_dh_emc scsi_dh_alua fuse
[    2.389996] CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.11.10-300.fc41.x86_64 #1
[    2.389998] Hardware name: Gigabyte Technology Co., Ltd. X299 AORUS Gaming 3 Pro/X299 AORUS Gaming 3 Pro-CF, BIOS F3 12/28/2017
[    2.389999] Workqueue: events work_for_cpu_fn
[    2.390003] RIP: 0010:dma_map_page_attrs+0x280/0x2a0
[    2.390005] Code: 8b 5d 00 48 89 ef e8 cf 7d 9d 00 4d 89 e1 4d 89 e8 48 89 da 48 8d 4c 24 08 41 56 48 89 c6 48 c7 c7 a0 30 be bb e8 00 d1 f2 ff <0f> 0b 58 eb 81 49 8b 43 08 83 78 68 05 0f 85 36 ff ff ff e9 6e ff
[    2.390006] RSP: 0018:ffffaca2c00e7c48 EFLAGS: 00010286
[    2.390008] RAX: 0000000000000000 RBX: ffff9bd044d2af20 RCX: 0000000000000027
[    2.390009] RDX: ffff9bdf9f021908 RSI: 0000000000000001 RDI: ffff9bdf9f021900
[    2.390010] RBP: ffff9bd0452e80c8 R08: 0000000000000000 R09: 202c666666666666
[    2.390011] R10: 6c20737562202c66 R11: 2e29302074696d69 R12: 00000000ffffffff
[    2.390012] R13: 0000000000001000 R14: 0000000000000000 R15: ffff9bd056d32c00
[    2.390013] FS:  0000000000000000(0000) GS:ffff9bdf9f000000(0000) knlGS:0000000000000000
[    2.390014] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.390015] CR2: 000055eba91b7000 CR3: 0000000af942a006 CR4: 00000000003706f0
[    2.390016] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[    2.390017] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[    2.390018] Call Trace:
[    2.390019]  <TASK>
[    2.390020]  ? dma_map_page_attrs+0x280/0x2a0
[    2.390022]  ? __warn.cold+0x8e/0xe8
[    2.390024]  ? dma_map_page_attrs+0x280/0x2a0
[    2.390026]  ? report_bug+0xff/0x140
[    2.390029]  ? console_unlock+0x84/0x130
[    2.390031]  ? handle_bug+0x58/0x90
[    2.390034]  ? exc_invalid_op+0x17/0x70
[    2.390035]  ? asm_exc_invalid_op+0x1a/0x20
[    2.390037]  ? dma_map_page_attrs+0x280/0x2a0
[    2.390038]  ? dma_map_page_attrs+0x280/0x2a0
[    2.390040]  nvkm_fb_ctor+0xba/0xe0 [nouveau]
[    2.390215]  nv50_fb_new_+0x91/0xc0 [nouveau]
[    2.390363]  nvkm_device_ctor+0x2457/0x4640 [nouveau]
[    2.390535]  nvkm_device_pci_new+0x12c/0x2f0 [nouveau]
[    2.390706]  nouveau_drm_probe+0xd2/0x220 [nouveau]
[    2.390870]  local_pci_probe+0x42/0x90
[    2.390874]  work_for_cpu_fn+0x17/0x30
[    2.390876]  process_one_work+0x176/0x330
[    2.390879]  worker_thread+0x252/0x390
[    2.390882]  ? __pfx_worker_thread+0x10/0x10
[    2.390884]  kthread+0xcf/0x100
[    2.390886]  ? __pfx_kthread+0x10/0x10
[    2.390888]  ret_from_fork+0x31/0x50
[    2.390891]  ? __pfx_kthread+0x10/0x10
[    2.390892]  ret_from_fork_asm+0x1a/0x30
[    2.390896]  </TASK>
[    2.390897] ---[ end trace 0000000000000000 ]---
[    2.391160] nouveau 0000:65:00.0: fb: 512 MiB DDR3
[    2.391165] nouveau 0000:65:00.0: fb: memory controller reports 512 MiB VRAM
[    3.099923] nouveau 0000:65:00.0: DRM: VRAM: 512 MiB
[    3.099925] nouveau 0000:65:00.0: DRM: GART: 1048576 MiB
[    3.099928] nouveau 0000:65:00.0: DRM: TMDS table version 2.0
[    3.101857] nouveau 0000:65:00.0: DRM: failed to create ce channel, -22
[    3.101980] nouveau 0000:65:00.0: DRM: MM: using COPY for buffer copies
[    3.102855] [drm] Initialized nouveau 1.4.0 for 0000:65:00.0 on minor 0
[    3.122956] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes
[    3.165323] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes
[    3.185419] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes
[    3.206448] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes
[    3.226508] nouveau 0000:65:00.0: [drm] Cannot find any crtc or sizes

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
index 8a286a9349ac..7b21ef375114 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/base.c
@@ -279,7 +279,7 @@ nvkm_fb_ctor(const struct nvkm_fb_func *func, struct nvkm_device *device,
 	mutex_init(&fb->tags.mutex);
 
 	if (func->sysmem.flush_page_init) {
-		fb->sysmem.flush_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		fb->sysmem.flush_page = alloc_page(GFP_KERNEL | __GFP_ZERO | GFP_DMA32);
 		if (!fb->sysmem.flush_page)
 			return -ENOMEM;
 
-- 
2.47.1

