Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CB47A53DE
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A810E30D;
	Mon, 18 Sep 2023 20:22:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FE410E11B
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:05 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-690bc3f82a7so497899b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068524; x=1695673324; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RD1daADqVeGb5AX2B7gqhOiSIH7LI05ma7W9qHYEFTY=;
 b=Bnwh8eSReDQiBfwC8OjsiB1Owix2BIw9lJ3019UAPCVS9fqaydwvz3fNASgBOKkIGp
 qCIwfmucPbQndbHKvHn/KJD4W/SRfJOvyC16h3UnokAibupALjZjRf6TzDaUX3p4aHLT
 9yNBKaPi7ee/QMy5BMWR7nj+QgSV2onwTPllPDEyRm11TSGLfjf4pycuI55d89SXQSn+
 ZBxv+y1/PugYEGUmSMhVbrpeA5+IsTzb7o+G43DEhNJQl5lDuQnKwFWlGUfU2SOyGj/r
 4jsP6HdkDX/I44VNJE0lpqaawtkqynNSd7nHzbuAfAvuzih00+pnRxeEkDSk4gHDGRhy
 D5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068524; x=1695673324;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RD1daADqVeGb5AX2B7gqhOiSIH7LI05ma7W9qHYEFTY=;
 b=CXcLpt4MQBNEaF/b+6648qtO7Rof+k9tYoyIuKSSwxqrT7fNrvCytc8aIldI+ZV5Wd
 Rh+wmSlznYIM4mLicHcW00gJNXXGHJyOAluX487JZas54j9GkjbHaLIrb56nut0mmqE/
 8qaMIyRIuj/9dcKy+5Z3MqgimIQwZptNN2icGOaWDREUyPSkBx4NnLb1xvstQQqnCxtT
 KTpY72MSNPD1veUMg6+qXiUXiHQ94347Xaa6Ako7hxakr1GsUW2Hwt2MvsWDkIphpxXb
 hyU6lweqfbDrbtZyIQN/2VJkoonrjx8b2CImuR4ISEPHQsiSUt9Czfde2CXObropO3GM
 P7pQ==
X-Gm-Message-State: AOJu0YxnoA//liGOf3XhGm0mARjc5ADN7O4FgAICNWtq2BjCM4kRHzkF
 KCBfXjCeECTcXmhW6N9W3Rnem0LymZ0=
X-Google-Smtp-Source: AGHT+IGVzN2Awo0/9mxApIW9/AoL05rZccjTSBMgFqDnYz7Lxb5nH+is8UUdfW3zyvOnuGZ9RVbzfA==
X-Received: by 2002:a05:6a00:813:b0:68e:39b5:7e63 with SMTP id
 m19-20020a056a00081300b0068e39b57e63mr10566221pfk.16.1695068524081; 
 Mon, 18 Sep 2023 13:22:04 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:03 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:05 +1000
Message-ID: <20230918202149.4343-1-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 00/44] drm/nouveau: initial support for GSP-RM
 535.54.04 (and Ada GPUs)
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

This series adds support for loading and running on top of NVIDIA's
GSP-RM firmware, instead of directly programming large portions of the
hardware ourselves.

The implementation is a little crude in places, but the goal of this
series is to get (more-or-less) GSP-RM support on par with what we
already support on HW.  Next steps would be to look at what features
GSP-RM enables us to more fully support, and clean up the GSP-RM
integration once it's known what those will require.

Things should be somewhat faster when running on GSP-RM, as it's able
to control GPU clocks, which wasn't possible for us previously.

SVM support is not available when running on top of GSP-RM at this
point, due to GPU fault buffers not being implemented yet.  This won't
effect any real use-case, as SVM is experimental at best in nouveau
anyway.

Aside from that, things should more or less work as normal.

GSP-RM support is disabled by default for now (except on Ada, where
it's the only option) and can be enabled with nouveau.config=NvGspRm=1.

There'll likely be some nit-picky bugs to sort through, but I don't
anticipate any huge disasters.  I've smoke-tested this on a selection
of GPUs right back to nv50, testing both HW and GSP paths depending
on the GPU, and more thoroughly tested on Turing/Ampere/Ada, both
discrete and laptop GPUs.

Firmware from NVIDIA is required to enable this support.


Ben Skeggs (44):
  drm/nouveau/mmu/tu102-: remove write to 0x100e68 during tlb invalidate
  drm/nouveau/nvkm: bump maximum number of NVDEC
  drm/nouveau/nvkm: bump maximum number of NVJPG
  drm/nouveau/gsp: prepare for GSP-RM
  drm/nouveau/acr/tu102-: prepare for GSP-RM
  drm/nouveau/bar/tu102-: prepare for GSP-RM
  drm/nouveau/bus/tu102-: prepare for GSP-RM
  drm/nouveau/devinit/tu102-: prepare for GSP-RM
  drm/nouveau/fault/tu102-: prepare for GSP-RM
  drm/nouveau/fb/tu102-: prepare for GSP-RM
  drm/nouveau/fuse/tu102-: prepare for GSP-RM
  drm/nouveau/gpio/tu102-: prepare for GSP-RM
  drm/nouveau/i2c/tu102-: prepare for GSP-RM
  drm/nouveau/imem/tu102-: prepare for GSP-RM
  drm/nouveau/ltc/tu102-: prepare for GSP-RM
  drm/nouveau/mc/tu102-: prepare for GSP-RM
  drm/nouveau/mmu/tu102-: prepare for GSP-RM
  drm/nouveau/pmu/tu102-: prepare for GSP-RM
  drm/nouveau/privring/tu102-: prepare for GSP-RM
  drm/nouveau/therm/tu102-: prepare for GSP-RM
  drm/nouveau/top/tu102-: prepare for GSP-RM
  drm/nouveau/vfn/tu102-: prepare for GSP-RM
  drm/nouveau/ce/tu102-: prepare for GSP-RM
  drm/nouveau/disp/tu102-: prepare for GSP-RM
  drm/nouveau/fifo/tu102-: prepare for GSP-RM
  drm/nouveau/gr/tu102-: prepare for GSP-RM
  drm/nouveau/nvdec/tu102-: prepare for GSP-RM
  drm/nouveau/nvenc/tu102-: prepare for GSP-RM
  drm/nouveau/sec2/tu102-: prepare for GSP-RM
  drm/nouveau/kms/tu102-: disable vbios parsing when running on RM
  drm/nouveau/nvkm: support loading fws into sg_table
  drm/nouveau/gsp/r535: add support for booting GSP-RM
  drm/nouveau/gsp/r535: add support for rm control
  drm/nouveau/gsp/r535: add support for rm alloc
  drm/nouveau/gsp/r535: add interrupt handling
  drm/nouveau/mmu/r535: initial support
  drm/nouveau/disp/r535: initial support
  drm/nouveau/fifo/r535: initial support
  drm/nouveau/ce/r535: initial support
  drm/nouveau/gr/r535: initial support
  drm/nouveau/nvdec/r535: initial support
  drm/nouveau/nvenc/r535: initial support
  drm/nouveau/nvjpg/r535: initial support
  drm/nouveau/ofa/r535: initial support

 drivers/gpu/drm/nouveau/dispnv50/core.c       |    1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  141 ++
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |    3 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   21 +
 .../drm/nouveau/include/nvkm/core/device.h    |    1 +
 .../drm/nouveau/include/nvkm/core/falcon.h    |    7 +
 .../drm/nouveau/include/nvkm/core/firmware.h  |    6 +-
 .../drm/nouveau/include/nvkm/core/layout.h    |    6 +-
 .../drm/nouveau/include/nvkm/engine/disp.h    |   19 +
 .../drm/nouveau/include/nvkm/engine/falcon.h  |    4 +
 .../drm/nouveau/include/nvkm/engine/fifo.h    |   19 +
 .../gpu/drm/nouveau/include/nvkm/engine/gr.h  |    1 +
 .../drm/nouveau/include/nvkm/engine/nvdec.h   |    3 +
 .../drm/nouveau/include/nvkm/engine/nvenc.h   |    3 +
 .../drm/nouveau/include/nvkm/engine/nvjpg.h   |    8 +
 .../gpu/drm/nouveau/include/nvkm/engine/ofa.h |    9 +
 .../gpu/drm/nouveau/include/nvkm/subdev/bar.h |    4 +
 .../drm/nouveau/include/nvkm/subdev/bios.h    |    1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |    6 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  435 ++++
 .../drm/nouveau/include/nvkm/subdev/instmem.h |    7 +
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   11 +
 .../sdk/nvidia/inc/alloc/alloc_channel.h      |  161 ++
 .../common/sdk/nvidia/inc/class/cl0000.h      |   38 +
 .../common/sdk/nvidia/inc/class/cl0005.h      |   38 +
 .../common/sdk/nvidia/inc/class/cl0080.h      |   43 +
 .../common/sdk/nvidia/inc/class/cl2080.h      |   35 +
 .../nvidia/inc/class/cl2080_notification.h    |   62 +
 .../common/sdk/nvidia/inc/class/cl84a0.h      |   33 +
 .../common/sdk/nvidia/inc/class/cl90f1.h      |   31 +
 .../common/sdk/nvidia/inc/class/clc0b5sw.h    |   34 +
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073common.h |   39 +
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h    |  166 ++
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h |  335 +++
 .../inc/ctrl/ctrl0073/ctrl0073specific.h      |  216 ++
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073system.h |   65 +
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h   |   57 +
 .../nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h    |   48 +
 .../sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h |   31 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h   |   40 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h |   35 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080event.h  |   41 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h |   51 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h   |   52 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    |  100 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h |   41 +
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  162 ++
 .../common/sdk/nvidia/inc/ctrl/ctrl90f1.h     |   95 +
 .../nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h |   42 +
 .../common/sdk/nvidia/inc/nvlimits.h          |   33 +
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |  148 ++
 .../common/shared/msgq/inc/msgq/msgq_priv.h   |   46 +
 .../uproc/os/common/include/libos_init_args.h |   52 +
 .../nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |   79 +
 .../nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  |  149 ++
 .../arch/nvalloc/common/inc/rmRiscvUcode.h    |   82 +
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h |  100 +
 .../535.54.03/nvidia/generated/g_allclasses.h |   33 +
 .../nvidia/generated/g_chipset_nvoc.h         |   38 +
 .../535.54.03/nvidia/generated/g_fbsr_nvoc.h  |   31 +
 .../535.54.03/nvidia/generated/g_gpu_nvoc.h   |   35 +
 .../nvidia/generated/g_kernel_channel_nvoc.h  |   62 +
 .../nvidia/generated/g_kernel_fifo_nvoc.h     |  119 +
 .../nvidia/generated/g_mem_desc_nvoc.h        |   32 +
 .../535.54.03/nvidia/generated/g_os_nvoc.h    |   44 +
 .../nvidia/generated/g_rpc-structures.h       |  124 +
 .../nvidia/generated/g_sdk-structures.h       |   45 +
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h     |   74 +
 .../nvidia/inc/kernel/gpu/gpu_engine_type.h   |   86 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h   |   33 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h |   57 +
 .../inc/kernel/gpu/gsp/gsp_static_config.h    |  174 ++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   57 +
 .../nvidia/inc/kernel/gpu/nvbitmask.h         |   33 +
 .../nvidia/inc/kernel/os/nv_memory_type.h     |   31 +
 .../nvidia/kernel/inc/vgpu/rpc_global_enums.h |  262 ++
 .../nvidia/kernel/inc/vgpu/rpc_headers.h      |   51 +
 .../nvidia/kernel/inc/vgpu/sdk-structures.h   |   40 +
 .../gpu/drm/nouveau/include/nvrm/nvtypes.h    |   24 +
 drivers/gpu/drm/nouveau/nouveau_bios.c        |    5 +-
 drivers/gpu/drm/nouveau/nvif/disp.c           |    1 +
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c  |   74 +-
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild |    2 +
 .../gpu/drm/nouveau/nvkm/engine/ce/ga100.c    |    4 +
 .../gpu/drm/nouveau/nvkm/engine/ce/ga102.c    |    5 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |    3 +
 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c |  108 +
 .../gpu/drm/nouveau/nvkm/engine/ce/tu102.c    |    5 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  190 +-
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |    2 +
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |    1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |    3 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  |   52 +
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |    8 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.h   |    4 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |    4 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |    6 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |    2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |   14 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 1671 +++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |    4 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |   31 +-
 drivers/gpu/drm/nouveau/nvkm/engine/falcon.c  |    4 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |    2 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   11 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/cgrp.c   |    3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |   55 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |    3 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  |    4 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga102.c  |    7 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |    4 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |  664 +++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/runl.h   |    6 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/tu102.c  |    4 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  |    9 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild |    3 +
 .../gpu/drm/nouveau/nvkm/engine/gr/ad102.c    |   46 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c |    6 +-
 .../gpu/drm/nouveau/nvkm/engine/gr/ga102.c    |    4 +
 .../gpu/drm/nouveau/nvkm/engine/gr/gf100.h    |    2 +
 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c |  508 ++++
 .../gpu/drm/nouveau/nvkm/engine/gr/tu102.c    |    5 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild  |    5 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/base.c  |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c |   16 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/gm107.c |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/priv.h  |    7 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/r535.c  |  110 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild  |    5 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/base.c  |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/gm107.c |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/nvenc/priv.h  |    5 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/r535.c  |  110 +
 .../gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild  |    5 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c |   44 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h  |    8 +
 .../gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c  |  107 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/Kbuild    |    6 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/ad102.c   |   44 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga100.c   |   44 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/ga102.c   |   44 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/priv.h    |    8 +
 .../gpu/drm/nouveau/nvkm/engine/ofa/r535.c    |  107 +
 .../gpu/drm/nouveau/nvkm/engine/sec2/Kbuild   |    2 +
 .../gpu/drm/nouveau/nvkm/engine/sec2/ga102.c  |    8 +-
 .../gpu/drm/nouveau/nvkm/engine/sec2/priv.h   |    3 +
 .../gpu/drm/nouveau/nvkm/engine/sec2/r535.c   |   54 +
 .../gpu/drm/nouveau/nvkm/engine/sec2/tu102.c  |    8 +-
 drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild    |    1 +
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c    |   16 +
 drivers/gpu/drm/nouveau/nvkm/falcon/ga100.c   |    6 +
 drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c   |    6 +
 drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c   |   28 +
 .../gpu/drm/nouveau/nvkm/subdev/acr/ga102.c   |    4 +
 .../gpu/drm/nouveau/nvkm/subdev/acr/tu102.c   |    3 +
 .../gpu/drm/nouveau/nvkm/subdev/bar/Kbuild    |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/bar/base.c    |   10 +-
 .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |    3 +
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  186 ++
 .../gpu/drm/nouveau/nvkm/subdev/bar/tu102.c   |    4 +
 .../gpu/drm/nouveau/nvkm/subdev/bios/base.c   |    8 +
 .../gpu/drm/nouveau/nvkm/subdev/bus/gf100.c   |    5 +
 .../drm/nouveau/nvkm/subdev/devinit/Kbuild    |    2 +
 .../drm/nouveau/nvkm/subdev/devinit/ga100.c   |   15 +
 .../drm/nouveau/nvkm/subdev/devinit/priv.h    |    3 +
 .../drm/nouveau/nvkm/subdev/devinit/r535.c    |   51 +
 .../drm/nouveau/nvkm/subdev/devinit/tu102.c   |    4 +
 .../gpu/drm/nouveau/nvkm/subdev/fault/tu102.c |    8 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga100.c    |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/ga102.c    |    4 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/priv.h |    3 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c |   87 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ram.c  |   46 +-
 .../gpu/drm/nouveau/nvkm/subdev/fb/tu102.c    |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/fuse/gm107.c  |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/gpio/ga102.c  |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/gpio/gk104.c  |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |    8 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |   57 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |   78 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   |  359 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   74 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  148 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gv100.c   |    4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |   57 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 2195 +++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  198 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |   57 +
 .../gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c   |    5 +
 .../drm/nouveau/nvkm/subdev/instmem/Kbuild    |    2 +
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |   40 +-
 .../drm/nouveau/nvkm/subdev/instmem/gk20a.c   |    2 +
 .../drm/nouveau/nvkm/subdev/instmem/nv04.c    |   45 +
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    |   27 +-
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |   13 +
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  333 +++
 .../gpu/drm/nouveau/nvkm/subdev/ltc/ga102.c   |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/ltc/gp102.c   |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/mc/ga100.c    |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/mc/gp100.c    |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild    |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |    4 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/priv.h    |    6 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/r535.c    |  123 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c   |    4 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |    6 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |    7 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |    6 +-
 .../gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c   |    5 +
 .../drm/nouveau/nvkm/subdev/privring/gm200.c  |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/top/ga100.c   |    7 +-
 .../gpu/drm/nouveau/nvkm/subdev/top/gk104.c   |    7 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/Kbuild    |    2 +
 .../gpu/drm/nouveau/nvkm/subdev/vfn/ga100.c   |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/vfn/priv.h    |    7 +-
 .../gpu/drm/nouveau/nvkm/subdev/vfn/r535.c    |   50 +
 .../gpu/drm/nouveau/nvkm/subdev/vfn/tu102.c   |    5 +
 230 files changed, 13977 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/nvjpg.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/ofa.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/alloc/alloc_channel.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl84a0.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl90f1.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/clc0b5sw.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080fifo.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0080/ctrl0080gr.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080bios.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fb.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl90f1.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvlimits.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_allclasses.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_fbsr_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_gpu_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_sdk-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_engine_type.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/nvbitmask.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_headers.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/sdk-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/ga102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/priv.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/sec2/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c

-- 
2.41.0

