Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB567B2E0F
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 10:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECC010E6C9;
	Fri, 29 Sep 2023 08:42:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A94610E328
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:17 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68fb2e9ebcdso3682096b3a.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068596; x=1695673396; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0bn4fb4IMUqhCx69je/jJOWxti0Rv2O4Re+HJFzQddM=;
 b=V8Yux38YxYb6QvFoZrKKd5OjaoeNsI23KTomfUhKylJuIg+37YCDcdBY10giQBImGf
 yIy44KG0oWGpFIKzjDp9T1c25bdBDwaZSUfrWd1Mofntnm26Izopu4OZGzpywE4l2Vsn
 yCSkR7XKQHx9BQ1Px0z/vqBeSV7EOyuu571oBj7hLEvUG076/xpdcHeXY5B9qBiuNbvA
 txnm2MJBN77oqfxVEF6h3nQIxKLymVBI+TXxf00yxq9+k7be2gLOj4bawcPrrhCtBU79
 qDzhDIQq5OwfrEiC82WPi2ozA+Ow99vP0Fwsa9JcmqIvSphcVPvF3HEXEv2TJwmqnhRt
 LwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068596; x=1695673396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0bn4fb4IMUqhCx69je/jJOWxti0Rv2O4Re+HJFzQddM=;
 b=IrUUJdBLGDabGkA5vuvvroo997ZeUeRUpPSs1aRguid3HlCsu6vQnu0MCfDccZOIEe
 MN8CJ6Lc/HPTvfxaqRSaVqQ4UZ3qb0X080C2yECATRhgkkG4z6d7A/oB6XH7yHumNBMQ
 km2K7pRwu/qiQ4ptu9ncVZAVmI70jKCty1FJ+95DSZB6Lr7Dyc2o0PJ8GxkM0+FaBrgv
 38Bw+f9dpGoSEAlc2dPf09Y9Fx4dmVmjqhtExk9X/bHrftSrg3rHZicOG9WpRCtNA0Uy
 SDbwkfluWyEi8EFwHZ6eZGHmbcRXtVnG6oQfpmTh0yhmK0XUGZjAGixL0y27HGJ0vNLv
 w6yw==
X-Gm-Message-State: AOJu0Yx9bMWScrLWU8gCetp/xV9XDkgy+d2dLqgYYgWLKFlbPjtsosqA
 sK6IUgGD64NBfPWfqi+ruOe0QGKRtf4=
X-Google-Smtp-Source: AGHT+IGPmnMSv+bx5HV8cbOeS0yeium+gktMC8MB1hTRRTJTkI/ByryzjZAwvPSe6zDrE17HGC8ruQ==
X-Received: by 2002:a05:6a00:23c4:b0:68e:29a6:e247 with SMTP id
 g4-20020a056a0023c400b0068e29a6e247mr10872096pfc.10.1695068594455; 
 Mon, 18 Sep 2023 13:23:14 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:13 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:37 +1000
Message-ID: <20230918202149.4343-33-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:42:15 +0000
Subject: [Nouveau] [PATCH 32/44] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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

This commit adds the initial code needed to boot the GSP-RM firmware
provided by NVIDIA, bringing with it the beginnings of Ada support.

Until it's had more testing and time to bake, support is disabled by
default (except on Ada).  GSP-RM usage can be enabled by passing the
"config=NvGspRm=1" module option.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |    1 +
 .../drm/nouveau/include/nvkm/core/device.h    |    1 +
 .../drm/nouveau/include/nvkm/core/falcon.h    |    4 +
 .../drm/nouveau/include/nvkm/engine/falcon.h  |    2 +
 .../drm/nouveau/include/nvkm/subdev/bios.h    |    1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  171 +-
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073system.h |   31 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    |   33 +
 .../common/shared/msgq/inc/msgq/msgq_priv.h   |   46 +
 .../uproc/os/common/include/libos_init_args.h |   52 +
 .../nvalloc/common/inc/gsp/gsp_fw_sr_meta.h   |   79 +
 .../nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h  |  149 ++
 .../arch/nvalloc/common/inc/rmRiscvUcode.h    |   82 +
 .../nvidia/arch/nvalloc/common/inc/rmgspseq.h |  100 ++
 .../nvidia/generated/g_chipset_nvoc.h         |   38 +
 .../535.54.03/nvidia/generated/g_os_nvoc.h    |   44 +
 .../nvidia/generated/g_rpc-structures.h       |   52 +
 .../nvidia/inc/kernel/gpu/gpu_acpi_data.h     |   74 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h   |   33 +
 .../nvidia/inc/kernel/gpu/gsp/gsp_init_args.h |   57 +
 .../inc/kernel/gpu/gsp/gsp_static_config.h    |   74 +
 .../nvidia/kernel/inc/vgpu/rpc_global_enums.h |  262 +++
 .../gpu/drm/nouveau/include/nvrm/nvtypes.h    |   24 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   66 +
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |    1 +
 drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild    |    1 +
 drivers/gpu/drm/nouveau/nvkm/falcon/base.c    |    9 +
 drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c   |    6 +
 drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c   |   28 +
 .../gpu/drm/nouveau/nvkm/subdev/bios/base.c   |    8 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |    5 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |   57 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |    1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c   |  359 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   22 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |  138 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |   42 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 1561 +++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  162 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |   22 +
 40 files changed, 3896 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index 8b5a240d57e4..8ccc082a4a63 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -35,6 +35,7 @@ struct nv_device_info_v0 {
 #define NV_DEVICE_INFO_V0_VOLTA                                            0x0b
 #define NV_DEVICE_INFO_V0_TURING                                           0x0c
 #define NV_DEVICE_INFO_V0_AMPERE                                           0x0d
+#define NV_DEVICE_INFO_V0_ADA                                              0x0e
 	__u8  family;
 	__u8  pad06[2];
 	__u64 ram_size;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index f65b5009acf7..f057d348221e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -46,6 +46,7 @@ struct nvkm_device {
 		GV100    = 0x140,
 		TU100    = 0x160,
 		GA100    = 0x170,
+		AD100    = 0x190,
 	} card_type;
 	u32 chipset;
 	u8  chiprev;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h b/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
index b857cf142c4a..529b8a8cce7b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/falcon.h
@@ -48,6 +48,7 @@ int nvkm_falcon_pio_rd(struct nvkm_falcon *, u8 port, enum nvkm_falcon_mem type,
 		       const u8 *img, u32 img_base, int len);
 int nvkm_falcon_dma_wr(struct nvkm_falcon *, const u8 *img, u64 dma_addr, u32 dma_base,
 		       enum nvkm_falcon_mem mem_type, u32 mem_base, int len, bool sec);
+bool nvkm_falcon_riscv_active(struct nvkm_falcon *);
 
 int gm200_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *);
 int gm200_flcn_disable(struct nvkm_falcon *);
@@ -61,10 +62,13 @@ void gm200_flcn_tracepc(struct nvkm_falcon *);
 int gp102_flcn_reset_eng(struct nvkm_falcon *);
 extern const struct nvkm_falcon_func_pio gp102_flcn_emem_pio;
 
+bool tu102_flcn_riscv_active(struct nvkm_falcon *);
+
 int ga102_flcn_select(struct nvkm_falcon *);
 int ga102_flcn_reset_prep(struct nvkm_falcon *);
 int ga102_flcn_reset_wait_mem_scrubbing(struct nvkm_falcon *);
 extern const struct nvkm_falcon_func_dma ga102_flcn_dma;
+bool ga102_flcn_riscv_active(struct nvkm_falcon *);
 
 void nvkm_falcon_v1_load_imem(struct nvkm_falcon *,
 			      void *, u32, u32, u16, u8, bool);
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
index b7bb8a29a729..607eac8474b0 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
@@ -87,6 +87,8 @@ struct nvkm_falcon_func {
 		u32 stride;
 	} cmdq, msgq;
 
+	bool (*riscv_active)(struct nvkm_falcon *);
+
 	struct {
 		u32 *data;
 		u32  size;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h
index b61cfb077533..b4b7841e3b13 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios.h
@@ -29,6 +29,7 @@ int nvbios_memcmp(struct nvkm_bios *, u32 addr, const char *, u32 len);
 u8  nvbios_rd08(struct nvkm_bios *, u32 addr);
 u16 nvbios_rd16(struct nvkm_bios *, u32 addr);
 u32 nvbios_rd32(struct nvkm_bios *, u32 addr);
+void *nvbios_pointer(struct nvkm_bios *, u32 addr);
 
 int nvkm_bios_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_bios **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 688270f62e09..41fd11822b30 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -3,18 +3,186 @@
 #define nvkm_gsp(p) container_of((p), struct nvkm_gsp, subdev)
 #include <core/subdev.h>
 #include <core/falcon.h>
+#include <core/firmware.h>
+
+#define GSP_PAGE_SHIFT 12
+#define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
+
+struct nvkm_gsp_mem {
+	u32 size;
+	void *data;
+	dma_addr_t addr;
+};
+
+struct nvkm_gsp_radix3 {
+	struct nvkm_gsp_mem mem[3];
+};
+
+int nvkm_gsp_sg(struct nvkm_device *, u64 size, struct sg_table *);
+void nvkm_gsp_sg_free(struct nvkm_device *, struct sg_table *);
+
+typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
 
 struct nvkm_gsp {
 	const struct nvkm_gsp_func *func;
 	struct nvkm_subdev subdev;
 
 	struct nvkm_falcon falcon;
+
+	struct {
+		struct {
+			const struct firmware *load;
+			const struct firmware *unload;
+		} booter;
+		const struct firmware *bl;
+		const struct firmware *rm;
+	} fws;
+
+	struct nvkm_firmware fw;
+	struct nvkm_gsp_mem sig;
+	struct nvkm_gsp_radix3 radix3;
+
+	struct {
+		struct {
+			struct {
+				u64 addr;
+				u64 size;
+			} vga_workspace;
+			u64 addr;
+			u64 size;
+		} bios;
+		struct {
+			struct {
+				u64 addr;
+				u64 size;
+			} frts, boot, elf, heap;
+			u64 addr;
+			u64 size;
+		} wpr2;
+		struct {
+			u64 addr;
+			u64 size;
+		} heap;
+		u64 addr;
+		u64 size;
+	} fb;
+
+	struct {
+		struct nvkm_falcon_fw load;
+		struct nvkm_falcon_fw unload;
+	} booter;
+
+	struct {
+		struct nvkm_gsp_mem fw;
+		u32 code_offset;
+		u32 data_offset;
+		u32 manifest_offset;
+		u32 app_version;
+	} boot;
+
+	struct nvkm_gsp_mem libos;
+	struct nvkm_gsp_mem loginit;
+	struct nvkm_gsp_mem logintr;
+	struct nvkm_gsp_mem logrm;
+	struct nvkm_gsp_mem rmargs;
+
+	struct nvkm_gsp_mem wpr_meta;
+
+	struct {
+		struct sg_table sgt;
+		struct nvkm_gsp_radix3 radix3;
+		struct nvkm_gsp_mem meta;
+	} sr;
+
+	struct {
+		struct nvkm_gsp_mem mem;
+
+		struct {
+			int   nr;
+			u32 size;
+			u64 *ptr;
+		} ptes;
+
+		struct {
+			u32  size;
+			void *ptr;
+		} cmdq, msgq;
+	} shm;
+
+	struct nvkm_gsp_cmdq {
+		struct mutex mutex;
+		u32 cnt;
+		u32 seq;
+		u32 *wptr;
+		u32 *rptr;
+	} cmdq;
+
+	struct nvkm_gsp_msgq {
+		struct mutex mutex;
+		u32 cnt;
+		u32 *wptr;
+		u32 *rptr;
+		struct nvkm_gsp_msgq_ntfy {
+			u32 fn;
+			nvkm_gsp_msg_ntfy_func func;
+			void *priv;
+		} ntfy[16];
+		int ntfy_nr;
+	} msgq;
+
+	bool running;
+
+	const struct nvkm_gsp_rm {
+		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
+		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
+		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
+	} *rm;
 };
 
 static inline bool
 nvkm_gsp_rm(struct nvkm_gsp *gsp)
 {
-	return false;
+	return gsp && (gsp->fws.rm || gsp->fw.img);
+}
+
+static inline void *
+nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
+{
+	return gsp->rm->rpc_get(gsp, fn, argc);
+}
+
+static inline void *
+nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+{
+	return gsp->rm->rpc_push(gsp, argv, wait, repc);
+}
+
+static inline void *
+nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 argc)
+{
+	void *argv = nvkm_gsp_rpc_get(gsp, fn, argc);
+
+	if (IS_ERR_OR_NULL(argv))
+		return argv;
+
+	return nvkm_gsp_rpc_push(gsp, argv, true, argc);
+}
+
+static inline int
+nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, bool wait)
+{
+	void *repv = nvkm_gsp_rpc_push(gsp, argv, wait, 0);
+
+	if (IS_ERR(repv))
+		return PTR_ERR(repv);
+
+	return 0;
+}
+
+static inline void
+nvkm_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
+{
+	gsp->rm->rpc_done(gsp, repv);
 }
 
 int gv100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
@@ -22,4 +190,5 @@ int tu102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_
 int tu116_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ga100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ga102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
+int ad102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
new file mode 100644
index 000000000000..c1f1c8881a42
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
@@ -0,0 +1,31 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073system_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073system_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2005-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
new file mode 100644
index 000000000000..a9a287469305
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
@@ -0,0 +1,33 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gpu_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080gpu_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2006-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0            (0x00000000U)
+
+#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h
new file mode 100644
index 000000000000..26b096d0e225
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h
@@ -0,0 +1,46 @@
+#ifndef __src_common_shared_msgq_inc_msgq_msgq_priv_h__
+#define __src_common_shared_msgq_inc_msgq_msgq_priv_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2018-2019 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct
+{
+    NvU32 version;   // queue version
+    NvU32 size;      // bytes, page aligned
+    NvU32 msgSize;   // entry size, bytes, must be power-of-2, 16 is minimum
+    NvU32 msgCount;  // number of entries in queue
+    NvU32 writePtr;  // message id of next slot
+    NvU32 flags;     // if set it means "i want to swap RX"
+    NvU32 rxHdrOff;  // Offset of msgqRxHeader from start of backing store.
+    NvU32 entryOff;  // Offset of entries from start of backing store.
+} msgqTxHeader;
+
+typedef struct
+{
+    NvU32 readPtr; // message id of last message read
+} msgqRxHeader;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h
new file mode 100644
index 000000000000..0aa4b26fda09
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h
@@ -0,0 +1,52 @@
+#ifndef __src_common_uproc_os_common_include_libos_init_args_h__
+#define __src_common_uproc_os_common_include_libos_init_args_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2018-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef NvU64 LibosAddress;
+
+typedef enum {
+    LIBOS_MEMORY_REGION_NONE,
+    LIBOS_MEMORY_REGION_CONTIGUOUS,
+    LIBOS_MEMORY_REGION_RADIX3
+} LibosMemoryRegionKind;
+
+typedef enum {
+    LIBOS_MEMORY_REGION_LOC_NONE,
+    LIBOS_MEMORY_REGION_LOC_SYSMEM,
+    LIBOS_MEMORY_REGION_LOC_FB
+} LibosMemoryRegionLoc;
+
+typedef struct
+{
+    LibosAddress          id8;  // Id tag.
+    LibosAddress          pa;   // Physical address.
+    LibosAddress          size; // Size of memory area.
+    NvU8                  kind; // See LibosMemoryRegionKind above.
+    NvU8                  loc;  // See LibosMemoryRegionLoc above.
+} LibosMemoryRegionInitArgument;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
new file mode 100644
index 000000000000..e3754a3bfe39
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h
@@ -0,0 +1,79 @@
+#ifndef __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_sr_meta_h__
+#define __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_sr_meta_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2022-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#define GSP_FW_SR_META_MAGIC     0x8a3bb9e6c6c39d93ULL
+#define GSP_FW_SR_META_REVISION  2
+
+typedef struct
+{
+    //
+    // Magic
+    // Use for verification by Booter
+    //
+    NvU64 magic;  // = GSP_FW_SR_META_MAGIC;
+
+    //
+    // Revision number
+    // Bumped up when we change this interface so it is not backward compatible.
+    // Bumped up when we revoke GSP-RM ucode
+    //
+    NvU64 revision;  // = GSP_FW_SR_META_MAGIC_REVISION;
+
+    //
+    // ---- Members regarding data in SYSMEM ----------------------------
+    // Consumed by Booter for DMA
+    //
+    NvU64 sysmemAddrOfSuspendResumeData;
+    NvU64 sizeOfSuspendResumeData;
+
+    // ---- Members for crypto ops across S/R ---------------------------
+
+    //
+    // HMAC over the entire GspFwSRMeta structure (including padding)
+    // with the hmac field itself zeroed.
+    //
+    NvU8 hmac[32];
+
+    // Hash over GspFwWprMeta structure
+    NvU8 wprMetaHash[32];
+
+    // Hash over GspFwHeapFreeList structure. All zeros signifies no free list.
+    NvU8 heapFreeListHash[32];
+
+    // Hash over data in WPR2 (skipping over free heap chunks; see Booter for details)
+    NvU8 dataHash[32];
+
+    //
+    // Pad structure to exactly 256 bytes (1 DMA chunk).
+    // Padding initialized to zero.
+    //
+    NvU32 padding[24];
+
+} GspFwSRMeta;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
new file mode 100644
index 000000000000..65efe8985a72
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h
@@ -0,0 +1,149 @@
+#ifndef __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_wpr_meta_h__
+#define __src_nvidia_arch_nvalloc_common_inc_gsp_gsp_fw_wpr_meta_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2021-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct
+{
+    // Magic
+    // BL to use for verification (i.e. Booter locked it in WPR2)
+    NvU64 magic; // = 0xdc3aae21371a60b3;
+
+    // Revision number of Booter-BL-Sequencer handoff interface
+    // Bumped up when we change this interface so it is not backward compatible.
+    // Bumped up when we revoke GSP-RM ucode
+    NvU64 revision; // = 1;
+
+    // ---- Members regarding data in SYSMEM ----------------------------
+    // Consumed by Booter for DMA
+
+    NvU64 sysmemAddrOfRadix3Elf;
+    NvU64 sizeOfRadix3Elf;
+
+    NvU64 sysmemAddrOfBootloader;
+    NvU64 sizeOfBootloader;
+
+    // Offsets inside bootloader image needed by Booter
+    NvU64 bootloaderCodeOffset;
+    NvU64 bootloaderDataOffset;
+    NvU64 bootloaderManifestOffset;
+
+    union
+    {
+        // Used only at initial boot
+        struct
+        {
+            NvU64 sysmemAddrOfSignature;
+            NvU64 sizeOfSignature;
+        };
+
+        //
+        // Used at suspend/resume to read GspFwHeapFreeList
+        // Offset relative to GspFwWprMeta FBMEM PA (gspFwWprStart)
+        //
+        struct
+        {
+            NvU32 gspFwHeapFreeListWprOffset;
+            NvU32 unused0;
+            NvU64 unused1;
+        };
+    };
+
+    // ---- Members describing FB layout --------------------------------
+    NvU64 gspFwRsvdStart;
+
+    NvU64 nonWprHeapOffset;
+    NvU64 nonWprHeapSize;
+
+    NvU64 gspFwWprStart;
+
+    // GSP-RM to use to setup heap.
+    NvU64 gspFwHeapOffset;
+    NvU64 gspFwHeapSize;
+
+    // BL to use to find ELF for jump
+    NvU64 gspFwOffset;
+    // Size is sizeOfRadix3Elf above.
+
+    NvU64 bootBinOffset;
+    // Size is sizeOfBootloader above.
+
+    NvU64 frtsOffset;
+    NvU64 frtsSize;
+
+    NvU64 gspFwWprEnd;
+
+    // GSP-RM to use for fbRegionInfo?
+    NvU64 fbSize;
+
+    // ---- Other members -----------------------------------------------
+
+    // GSP-RM to use for fbRegionInfo?
+    NvU64 vgaWorkspaceOffset;
+    NvU64 vgaWorkspaceSize;
+
+    // Boot count.  Used to determine whether to load the firmware image.
+    NvU64 bootCount;
+
+    // TODO: the partitionRpc* fields below do not really belong in this
+    //       structure. The values are patched in by the partition bootstrapper
+    //       when GSP-RM is booted in a partition, and this structure was a
+    //       convenient place for the bootstrapper to access them. These should
+    //       be moved to a different comm. mechanism between the bootstrapper
+    //       and the GSP-RM tasks.
+
+    // Shared partition RPC memory (physical address)
+    NvU64 partitionRpcAddr;
+
+    // Offsets relative to partitionRpcAddr
+    NvU16 partitionRpcRequestOffset;
+    NvU16 partitionRpcReplyOffset;
+
+    // Code section and dataSection offset and size.
+    NvU32 elfCodeOffset;
+    NvU32 elfDataOffset;
+    NvU32 elfCodeSize;
+    NvU32 elfDataSize;
+
+    // Used during GSP-RM resume to check for revocation
+    NvU32 lsUcodeVersion;
+
+    // Number of VF partitions allocating sub-heaps from the WPR heap
+    // Used during boot to ensure the heap is adequately sized
+    NvU8 gspFwHeapVfPartitionCount;
+
+    // Pad structure to exactly 256 bytes.  Can replace padding with additional
+    // fields without incrementing revision.  Padding initialized to 0.
+    NvU8 padding[7];
+
+    // BL to use for verification (i.e. Booter says OK to boot)
+    NvU64 verified;  // 0x0 -> unverified, 0xa0a0a0a0a0a0a0a0 -> verified
+} GspFwWprMeta;
+
+#define GSP_FW_WPR_META_REVISION  1
+#define GSP_FW_WPR_META_MAGIC     0xdc3aae21371a60b3ULL
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
new file mode 100644
index 000000000000..da18e7eab940
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h
@@ -0,0 +1,82 @@
+#ifndef __src_nvidia_arch_nvalloc_common_inc_rmRiscvUcode_h__
+#define __src_nvidia_arch_nvalloc_common_inc_rmRiscvUcode_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2018-2019 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct {
+    //
+    // Version 1
+    // Version 2
+    // Version 3 = for Partition boot
+    // Version 4 = for eb riscv boot
+    // Version 5 = Support signing entire RISC-V image as "code" in code section for hopper and later.
+    //
+    NvU32  version;                         // structure version
+    NvU32  bootloaderOffset;
+    NvU32  bootloaderSize;
+    NvU32  bootloaderParamOffset;
+    NvU32  bootloaderParamSize;
+    NvU32  riscvElfOffset;
+    NvU32  riscvElfSize;
+    NvU32  appVersion;                      // Changelist number associated with the image
+    //
+    // Manifest contains information about Monitor and it is
+    // input to BR
+    //
+    NvU32  manifestOffset;
+    NvU32  manifestSize;
+    //
+    // Monitor Data offset within RISCV image and size
+    //
+    NvU32  monitorDataOffset;
+    NvU32  monitorDataSize;
+    //
+    // Monitor Code offset withtin RISCV image and size
+    //
+    NvU32  monitorCodeOffset;
+    NvU32  monitorCodeSize;
+    NvU32  bIsMonitorEnabled;
+    //
+    // Swbrom Code offset within RISCV image and size
+    //
+    NvU32  swbromCodeOffset;
+    NvU32  swbromCodeSize;
+    //
+    // Swbrom Data offset within RISCV image and size
+    //
+    NvU32  swbromDataOffset;
+    NvU32  swbromDataSize;
+    //
+    // Total size of FB carveout (image and reserved space).  
+    //
+    NvU32  fbReservedSize;
+    //
+    // Indicates whether the entire RISC-V image is signed as "code" in code section.
+    //
+    NvU32  bSignedAsCode;
+} RM_RISCV_UCODE_DESC;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h
new file mode 100644
index 000000000000..1048205a0e46
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h
@@ -0,0 +1,100 @@
+#ifndef __src_nvidia_arch_nvalloc_common_inc_rmgspseq_h__
+#define __src_nvidia_arch_nvalloc_common_inc_rmgspseq_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2019-2020 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef enum GSP_SEQ_BUF_OPCODE
+{
+    GSP_SEQ_BUF_OPCODE_REG_WRITE = 0,
+    GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    GSP_SEQ_BUF_OPCODE_REG_POLL,
+    GSP_SEQ_BUF_OPCODE_DELAY_US,
+    GSP_SEQ_BUF_OPCODE_REG_STORE,
+    GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    GSP_SEQ_BUF_OPCODE_CORE_START,
+    GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+    GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+} GSP_SEQ_BUF_OPCODE;
+
+#define GSP_SEQUENCER_PAYLOAD_SIZE_DWORDS(opcode)                       \
+    ((opcode == GSP_SEQ_BUF_OPCODE_REG_WRITE)  ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_WRITE)  / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_REG_MODIFY) ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_MODIFY) / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_REG_POLL)   ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_POLL)   / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_DELAY_US)   ? (sizeof(GSP_SEQ_BUF_PAYLOAD_DELAY_US)   / sizeof(NvU32)) : \
+     (opcode == GSP_SEQ_BUF_OPCODE_REG_STORE)  ? (sizeof(GSP_SEQ_BUF_PAYLOAD_REG_STORE)  / sizeof(NvU32)) : \
+    /* GSP_SEQ_BUF_OPCODE_CORE_RESET */                                 \
+    /* GSP_SEQ_BUF_OPCODE_CORE_START */                                 \
+    /* GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT */                         \
+    /* GSP_SEQ_BUF_OPCODE_CORE_RESUME */                                \
+    0)
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 val;
+} GSP_SEQ_BUF_PAYLOAD_REG_WRITE;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 mask;
+    NvU32 val;
+} GSP_SEQ_BUF_PAYLOAD_REG_MODIFY;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 mask;
+    NvU32 val;
+    NvU32 timeout;
+    NvU32 error;
+} GSP_SEQ_BUF_PAYLOAD_REG_POLL;
+
+typedef struct
+{
+    NvU32 val;
+} GSP_SEQ_BUF_PAYLOAD_DELAY_US;
+
+typedef struct
+{
+    NvU32 addr;
+    NvU32 index;
+} GSP_SEQ_BUF_PAYLOAD_REG_STORE;
+
+typedef struct GSP_SEQUENCER_BUFFER_CMD
+{
+    GSP_SEQ_BUF_OPCODE opCode;
+    union
+    {
+        GSP_SEQ_BUF_PAYLOAD_REG_WRITE regWrite;
+        GSP_SEQ_BUF_PAYLOAD_REG_MODIFY regModify;
+        GSP_SEQ_BUF_PAYLOAD_REG_POLL regPoll;
+        GSP_SEQ_BUF_PAYLOAD_DELAY_US delayUs;
+        GSP_SEQ_BUF_PAYLOAD_REG_STORE regStore;
+    } payload;
+} GSP_SEQUENCER_BUFFER_CMD;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h
new file mode 100644
index 000000000000..94e79e14cba7
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h
@@ -0,0 +1,38 @@
+#ifndef __src_nvidia_generated_g_chipset_nvoc_h__
+#define __src_nvidia_generated_g_chipset_nvoc_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 1993-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct
+{
+    NvU16               deviceID;           // deviceID
+    NvU16               vendorID;           // vendorID
+    NvU16               subdeviceID;        // subsystem deviceID
+    NvU16               subvendorID;        // subsystem vendorID
+    NvU8                revisionID;         // revision ID
+} BUSINFO;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h
new file mode 100644
index 000000000000..639adbd99545
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_os_nvoc.h
@@ -0,0 +1,44 @@
+#ifndef __src_nvidia_generated_g_os_nvoc_h__
+#define __src_nvidia_generated_g_os_nvoc_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 1993-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct PACKED_REGISTRY_ENTRY
+{
+    NvU32                   nameOffset;
+    NvU8                    type;
+    NvU32                   data;
+    NvU32                   length;
+} PACKED_REGISTRY_ENTRY;
+
+typedef struct PACKED_REGISTRY_TABLE
+{
+    NvU32                   size;
+    NvU32                   numEntries;
+    PACKED_REGISTRY_ENTRY   entries[0];
+} PACKED_REGISTRY_TABLE;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
new file mode 100644
index 000000000000..ac59ffa4330b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
@@ -0,0 +1,52 @@
+#ifndef __src_nvidia_generated_g_rpc_structures_h__
+#define __src_nvidia_generated_g_rpc_structures_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2008-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct rpc_unloading_guest_driver_v1F_07
+{
+    NvBool     bInPMTransition;
+    NvBool     bGc6Entering;
+    NvU32      newLevel;
+} rpc_unloading_guest_driver_v1F_07;
+
+typedef struct rpc_run_cpu_sequencer_v17_00
+{
+    NvU32      bufferSizeDWord;
+    NvU32      cmdIndex;
+    NvU32      regSaveArea[8];
+    NvU32      commandBuffer[];
+} rpc_run_cpu_sequencer_v17_00;
+
+typedef struct rpc_os_error_log_v17_00
+{
+    NvU32      exceptType;
+    NvU32      runlistId;
+    NvU32      chid;
+    char       errString[0x100];
+} rpc_os_error_log_v17_00;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h
new file mode 100644
index 000000000000..11f822f875d5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h
@@ -0,0 +1,74 @@
+#ifndef __src_nvidia_inc_kernel_gpu_gpu_acpi_data_h__
+#define __src_nvidia_inc_kernel_gpu_gpu_acpi_data_h__
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct DOD_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     acpiIdListLen;
+    NvU32     acpiIdList[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+} DOD_METHOD_DATA;
+
+typedef struct JT_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     jtCaps;
+    NvU16     jtRevId;
+    NvBool    bSBIOSCaps;
+} JT_METHOD_DATA;
+
+typedef struct MUX_METHOD_DATA_ELEMENT
+{
+    NvU32       acpiId;
+    NvU32       mode;
+    NV_STATUS   status;
+} MUX_METHOD_DATA_ELEMENT;
+
+typedef struct MUX_METHOD_DATA
+{
+    NvU32                       tableLen;
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxModeTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxPartTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+} MUX_METHOD_DATA;
+
+typedef struct CAPS_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     optimusCaps;
+} CAPS_METHOD_DATA;
+
+typedef struct ACPI_METHOD_DATA
+{
+    NvBool                                               bValid;
+    DOD_METHOD_DATA                                      dodMethodData;
+    JT_METHOD_DATA                                       jtMethodData;
+    MUX_METHOD_DATA                                      muxMethodData;
+    CAPS_METHOD_DATA                                     capsMethodData;
+} ACPI_METHOD_DATA;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
new file mode 100644
index 000000000000..1169ff62160f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h
@@ -0,0 +1,33 @@
+#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_fw_heap_h__
+#define __src_nvidia_inc_kernel_gpu_gsp_gsp_fw_heap_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2022-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+#define GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB                  (96 << 10)   // All architectures
+
+#define GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE      ((48 << 10) * 2048)   // Support 2048 channels
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
new file mode 100644
index 000000000000..cacd46f3208c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h
@@ -0,0 +1,57 @@
+#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_init_args_h__
+#define __src_nvidia_inc_kernel_gpu_gsp_gsp_init_args_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct {
+    RmPhysAddr sharedMemPhysAddr;
+    NvU32 pageTableEntryCount;
+    NvLength cmdQueueOffset;
+    NvLength statQueueOffset;
+    NvLength locklessCmdQueueOffset;
+    NvLength locklessStatQueueOffset;
+} MESSAGE_QUEUE_INIT_ARGUMENTS;
+
+typedef struct {
+    NvU32 oldLevel;
+    NvU32 flags;
+    NvBool bInPMTransition;
+} GSP_SR_INIT_ARGUMENTS;
+
+typedef struct
+{
+    MESSAGE_QUEUE_INIT_ARGUMENTS      messageQueueInitArguments;
+    GSP_SR_INIT_ARGUMENTS             srInitArguments;
+    NvU32                             gpuInstance;
+
+    struct
+    {
+        NvU64                         pa;
+        NvU64                         size;
+    } profilerArgs;
+} GSP_ARGUMENTS_CACHED;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
new file mode 100644
index 000000000000..ba8cd897ebcc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h
@@ -0,0 +1,74 @@
+#ifndef __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
+#define __src_nvidia_inc_kernel_gpu_gsp_gsp_static_config_h__
+#include <nvrm/535.54.03/nvidia/generated/g_chipset_nvoc.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gpu_acpi_data.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2019-2023 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * SPDX-License-Identifier: MIT
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+
+typedef struct GSP_VF_INFO
+{
+    NvU32  totalVFs;
+    NvU32  firstVFOffset;
+    NvU64  FirstVFBar0Address;
+    NvU64  FirstVFBar1Address;
+    NvU64  FirstVFBar2Address;
+    NvBool b64bitBar0;
+    NvBool b64bitBar1;
+    NvBool b64bitBar2;
+} GSP_VF_INFO;
+
+typedef struct GspSystemInfo
+{
+    NvU64 gpuPhysAddr;
+    NvU64 gpuPhysFbAddr;
+    NvU64 gpuPhysInstAddr;
+    NvU64 nvDomainBusDeviceFunc;
+    NvU64 simAccessBufPhysAddr;
+    NvU64 pcieAtomicsOpMask;
+    NvU64 consoleMemSize;
+    NvU64 maxUserVa;
+    NvU32 pciConfigMirrorBase;
+    NvU32 pciConfigMirrorSize;
+    NvU8 oorArch;
+    NvU64 clPdbProperties;
+    NvU32 Chipset;
+    NvBool bGpuBehindBridge;
+    NvBool bMnocAvailable;
+    NvBool bUpstreamL0sUnsupported;
+    NvBool bUpstreamL1Unsupported;
+    NvBool bUpstreamL1PorSupported;
+    NvBool bUpstreamL1PorMobileOnly;
+    NvU8   upstreamAddressValid;
+    BUSINFO FHBBusInfo;
+    BUSINFO chipsetIDInfo;
+    ACPI_METHOD_DATA acpiMethodData;
+    NvU32 hypervisorType;
+    NvBool bIsPassthru;
+    NvU64 sysTimerOffsetNs;
+    GSP_VF_INFO gspVFInfo;
+} GspSystemInfo;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h
new file mode 100644
index 000000000000..5b7ffd56084b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h
@@ -0,0 +1,262 @@
+#ifndef __src_nvidia_kernel_inc_vgpu_rpc_global_enums_h__
+#define __src_nvidia_kernel_inc_vgpu_rpc_global_enums_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+#ifndef X
+#    define X(UNIT, RPC) NV_VGPU_MSG_FUNCTION_##RPC,
+#    define DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
+enum {
+#endif
+    X(RM, NOP)                             // 0
+    X(RM, SET_GUEST_SYSTEM_INFO)           // 1
+    X(RM, ALLOC_ROOT)                      // 2
+    X(RM, ALLOC_DEVICE)                    // 3 deprecated
+    X(RM, ALLOC_MEMORY)                    // 4
+    X(RM, ALLOC_CTX_DMA)                   // 5
+    X(RM, ALLOC_CHANNEL_DMA)               // 6
+    X(RM, MAP_MEMORY)                      // 7
+    X(RM, BIND_CTX_DMA)                    // 8 deprecated
+    X(RM, ALLOC_OBJECT)                    // 9
+    X(RM, FREE)                            //10
+    X(RM, LOG)                             //11
+    X(RM, ALLOC_VIDMEM)                    //12
+    X(RM, UNMAP_MEMORY)                    //13
+    X(RM, MAP_MEMORY_DMA)                  //14
+    X(RM, UNMAP_MEMORY_DMA)                //15
+    X(RM, GET_EDID)                        //16
+    X(RM, ALLOC_DISP_CHANNEL)              //17
+    X(RM, ALLOC_DISP_OBJECT)               //18
+    X(RM, ALLOC_SUBDEVICE)                 //19
+    X(RM, ALLOC_DYNAMIC_MEMORY)            //20
+    X(RM, DUP_OBJECT)                      //21
+    X(RM, IDLE_CHANNELS)                   //22
+    X(RM, ALLOC_EVENT)                     //23
+    X(RM, SEND_EVENT)                      //24
+    X(RM, REMAPPER_CONTROL)                //25 deprecated
+    X(RM, DMA_CONTROL)                     //26
+    X(RM, DMA_FILL_PTE_MEM)                //27
+    X(RM, MANAGE_HW_RESOURCE)              //28
+    X(RM, BIND_ARBITRARY_CTX_DMA)          //29 deprecated
+    X(RM, CREATE_FB_SEGMENT)               //30
+    X(RM, DESTROY_FB_SEGMENT)              //31
+    X(RM, ALLOC_SHARE_DEVICE)              //32
+    X(RM, DEFERRED_API_CONTROL)            //33
+    X(RM, REMOVE_DEFERRED_API)             //34
+    X(RM, SIM_ESCAPE_READ)                 //35
+    X(RM, SIM_ESCAPE_WRITE)                //36
+    X(RM, SIM_MANAGE_DISPLAY_CONTEXT_DMA)  //37
+    X(RM, FREE_VIDMEM_VIRT)                //38
+    X(RM, PERF_GET_PSTATE_INFO)            //39  deprecated for vGPU, used by GSP
+    X(RM, PERF_GET_PERFMON_SAMPLE)         //40
+    X(RM, PERF_GET_VIRTUAL_PSTATE_INFO)    //41  deprecated
+    X(RM, PERF_GET_LEVEL_INFO)             //42
+    X(RM, MAP_SEMA_MEMORY)                 //43
+    X(RM, UNMAP_SEMA_MEMORY)               //44
+    X(RM, SET_SURFACE_PROPERTIES)          //45
+    X(RM, CLEANUP_SURFACE)                 //46
+    X(RM, UNLOADING_GUEST_DRIVER)          //47
+    X(RM, TDR_SET_TIMEOUT_STATE)           //48
+    X(RM, SWITCH_TO_VGA)                   //49
+    X(RM, GPU_EXEC_REG_OPS)                //50
+    X(RM, GET_STATIC_INFO)                 //51
+    X(RM, ALLOC_VIRTMEM)                   //52
+    X(RM, UPDATE_PDE_2)                    //53
+    X(RM, SET_PAGE_DIRECTORY)              //54
+    X(RM, GET_STATIC_PSTATE_INFO)          //55
+    X(RM, TRANSLATE_GUEST_GPU_PTES)        //56
+    X(RM, RESERVED_57)                     //57
+    X(RM, RESET_CURRENT_GR_CONTEXT)        //58
+    X(RM, SET_SEMA_MEM_VALIDATION_STATE)   //59
+    X(RM, GET_ENGINE_UTILIZATION)          //60
+    X(RM, UPDATE_GPU_PDES)                 //61
+    X(RM, GET_ENCODER_CAPACITY)            //62
+    X(RM, VGPU_PF_REG_READ32)              //63
+    X(RM, SET_GUEST_SYSTEM_INFO_EXT)       //64
+    X(GSP, GET_GSP_STATIC_INFO)            //65
+    X(RM, RMFS_INIT)                       //66
+    X(RM, RMFS_CLOSE_QUEUE)                //67
+    X(RM, RMFS_CLEANUP)                    //68
+    X(RM, RMFS_TEST)                       //69
+    X(RM, UPDATE_BAR_PDE)                  //70
+    X(RM, CONTINUATION_RECORD)             //71
+    X(RM, GSP_SET_SYSTEM_INFO)             //72
+    X(RM, SET_REGISTRY)                    //73
+    X(GSP, GSP_INIT_POST_OBJGPU)           //74 deprecated
+    X(RM, SUBDEV_EVENT_SET_NOTIFICATION)   //75 deprecated
+    X(GSP, GSP_RM_CONTROL)                 //76
+    X(RM, GET_STATIC_INFO2)                //77
+    X(RM, DUMP_PROTOBUF_COMPONENT)         //78
+    X(RM, UNSET_PAGE_DIRECTORY)            //79
+    X(RM, GET_CONSOLIDATED_STATIC_INFO)    //80
+    X(RM, GMMU_REGISTER_FAULT_BUFFER)      //81 deprecated
+    X(RM, GMMU_UNREGISTER_FAULT_BUFFER)    //82 deprecated
+    X(RM, GMMU_REGISTER_CLIENT_SHADOW_FAULT_BUFFER)   //83 deprecated
+    X(RM, GMMU_UNREGISTER_CLIENT_SHADOW_FAULT_BUFFER) //84 deprecated
+    X(RM, CTRL_SET_VGPU_FB_USAGE)          //85
+    X(RM, CTRL_NVFBC_SW_SESSION_UPDATE_INFO)    //86
+    X(RM, CTRL_NVENC_SW_SESSION_UPDATE_INFO)    //87
+    X(RM, CTRL_RESET_CHANNEL)                   //88
+    X(RM, CTRL_RESET_ISOLATED_CHANNEL)          //89
+    X(RM, CTRL_GPU_HANDLE_VF_PRI_FAULT)         //90
+    X(RM, CTRL_CLK_GET_EXTENDED_INFO)           //91
+    X(RM, CTRL_PERF_BOOST)                      //92
+    X(RM, CTRL_PERF_VPSTATES_GET_CONTROL)       //93
+    X(RM, CTRL_GET_ZBC_CLEAR_TABLE)             //94
+    X(RM, CTRL_SET_ZBC_COLOR_CLEAR)             //95
+    X(RM, CTRL_SET_ZBC_DEPTH_CLEAR)             //96
+    X(RM, CTRL_GPFIFO_SCHEDULE)                 //97
+    X(RM, CTRL_SET_TIMESLICE)                   //98
+    X(RM, CTRL_PREEMPT)                         //99
+    X(RM, CTRL_FIFO_DISABLE_CHANNELS)           //100
+    X(RM, CTRL_SET_TSG_INTERLEAVE_LEVEL)        //101
+    X(RM, CTRL_SET_CHANNEL_INTERLEAVE_LEVEL)    //102
+    X(GSP, GSP_RM_ALLOC)                        //103
+    X(RM, CTRL_GET_P2P_CAPS_V2)                 //104
+    X(RM, CTRL_CIPHER_AES_ENCRYPT)              //105
+    X(RM, CTRL_CIPHER_SESSION_KEY)              //106
+    X(RM, CTRL_CIPHER_SESSION_KEY_STATUS)       //107
+    X(RM, CTRL_DBG_CLEAR_ALL_SM_ERROR_STATES)   //108
+    X(RM, CTRL_DBG_READ_ALL_SM_ERROR_STATES)    //109
+    X(RM, CTRL_DBG_SET_EXCEPTION_MASK)          //110
+    X(RM, CTRL_GPU_PROMOTE_CTX)                 //111
+    X(RM, CTRL_GR_CTXSW_PREEMPTION_BIND)        //112
+    X(RM, CTRL_GR_SET_CTXSW_PREEMPTION_MODE)    //113
+    X(RM, CTRL_GR_CTXSW_ZCULL_BIND)             //114
+    X(RM, CTRL_GPU_INITIALIZE_CTX)              //115
+    X(RM, CTRL_VASPACE_COPY_SERVER_RESERVED_PDES)    //116
+    X(RM, CTRL_FIFO_CLEAR_FAULTED_BIT)          //117
+    X(RM, CTRL_GET_LATEST_ECC_ADDRESSES)        //118
+    X(RM, CTRL_MC_SERVICE_INTERRUPTS)           //119
+    X(RM, CTRL_DMA_SET_DEFAULT_VASPACE)         //120
+    X(RM, CTRL_GET_CE_PCE_MASK)                 //121
+    X(RM, CTRL_GET_ZBC_CLEAR_TABLE_ENTRY)       //122
+    X(RM, CTRL_GET_NVLINK_PEER_ID_MASK)         //123
+    X(RM, CTRL_GET_NVLINK_STATUS)               //124
+    X(RM, CTRL_GET_P2P_CAPS)                    //125
+    X(RM, CTRL_GET_P2P_CAPS_MATRIX)             //126
+    X(RM, RESERVED_0)                           //127
+    X(RM, CTRL_RESERVE_PM_AREA_SMPC)            //128
+    X(RM, CTRL_RESERVE_HWPM_LEGACY)             //129
+    X(RM, CTRL_B0CC_EXEC_REG_OPS)               //130
+    X(RM, CTRL_BIND_PM_RESOURCES)               //131
+    X(RM, CTRL_DBG_SUSPEND_CONTEXT)             //132
+    X(RM, CTRL_DBG_RESUME_CONTEXT)              //133
+    X(RM, CTRL_DBG_EXEC_REG_OPS)                //134
+    X(RM, CTRL_DBG_SET_MODE_MMU_DEBUG)          //135
+    X(RM, CTRL_DBG_READ_SINGLE_SM_ERROR_STATE)  //136
+    X(RM, CTRL_DBG_CLEAR_SINGLE_SM_ERROR_STATE) //137
+    X(RM, CTRL_DBG_SET_MODE_ERRBAR_DEBUG)       //138
+    X(RM, CTRL_DBG_SET_NEXT_STOP_TRIGGER_TYPE)  //139
+    X(RM, CTRL_ALLOC_PMA_STREAM)                //140
+    X(RM, CTRL_PMA_STREAM_UPDATE_GET_PUT)       //141
+    X(RM, CTRL_FB_GET_INFO_V2)                  //142
+    X(RM, CTRL_FIFO_SET_CHANNEL_PROPERTIES)     //143
+    X(RM, CTRL_GR_GET_CTX_BUFFER_INFO)          //144
+    X(RM, CTRL_KGR_GET_CTX_BUFFER_PTES)         //145
+    X(RM, CTRL_GPU_EVICT_CTX)                   //146
+    X(RM, CTRL_FB_GET_FS_INFO)                  //147
+    X(RM, CTRL_GRMGR_GET_GR_FS_INFO)            //148
+    X(RM, CTRL_STOP_CHANNEL)                    //149
+    X(RM, CTRL_GR_PC_SAMPLING_MODE)             //150
+    X(RM, CTRL_PERF_RATED_TDP_GET_STATUS)       //151
+    X(RM, CTRL_PERF_RATED_TDP_SET_CONTROL)      //152
+    X(RM, CTRL_FREE_PMA_STREAM)                 //153
+    X(RM, CTRL_TIMER_SET_GR_TICK_FREQ)          //154
+    X(RM, CTRL_FIFO_SETUP_VF_ZOMBIE_SUBCTX_PDB) //155
+    X(RM, GET_CONSOLIDATED_GR_STATIC_INFO)      //156
+    X(RM, CTRL_DBG_SET_SINGLE_SM_SINGLE_STEP)   //157
+    X(RM, CTRL_GR_GET_TPC_PARTITION_MODE)       //158
+    X(RM, CTRL_GR_SET_TPC_PARTITION_MODE)       //159
+    X(UVM, UVM_PAGING_CHANNEL_ALLOCATE)         //160
+    X(UVM, UVM_PAGING_CHANNEL_DESTROY)          //161
+    X(UVM, UVM_PAGING_CHANNEL_MAP)              //162
+    X(UVM, UVM_PAGING_CHANNEL_UNMAP)            //163
+    X(UVM, UVM_PAGING_CHANNEL_PUSH_STREAM)      //164
+    X(UVM, UVM_PAGING_CHANNEL_SET_HANDLES)      //165
+    X(UVM, UVM_METHOD_STREAM_GUEST_PAGES_OPERATION)  //166
+    X(RM, CTRL_INTERNAL_QUIESCE_PMA_CHANNEL)    //167
+    X(RM, DCE_RM_INIT)                          //168
+    X(RM, REGISTER_VIRTUAL_EVENT_BUFFER)        //169
+    X(RM, CTRL_EVENT_BUFFER_UPDATE_GET)         //170
+    X(RM, GET_PLCABLE_ADDRESS_KIND)             //171
+    X(RM, CTRL_PERF_LIMITS_SET_STATUS_V2)       //172
+    X(RM, CTRL_INTERNAL_SRIOV_PROMOTE_PMA_STREAM)    //173
+    X(RM, CTRL_GET_MMU_DEBUG_MODE)              //174
+    X(RM, CTRL_INTERNAL_PROMOTE_FAULT_METHOD_BUFFERS) //175
+    X(RM, CTRL_FLCN_GET_CTX_BUFFER_SIZE)        //176
+    X(RM, CTRL_FLCN_GET_CTX_BUFFER_INFO)        //177
+    X(RM, DISABLE_CHANNELS)                     //178
+    X(RM, CTRL_FABRIC_MEMORY_DESCRIBE)          //179
+    X(RM, CTRL_FABRIC_MEM_STATS)                //180
+    X(RM, SAVE_HIBERNATION_DATA)                //181
+    X(RM, RESTORE_HIBERNATION_DATA)             //182
+    X(RM, CTRL_INTERNAL_MEMSYS_SET_ZBC_REFERENCED) //183
+    X(RM, CTRL_EXEC_PARTITIONS_CREATE)          //184
+    X(RM, CTRL_EXEC_PARTITIONS_DELETE)          //185
+    X(RM, CTRL_GPFIFO_GET_WORK_SUBMIT_TOKEN)    //186
+    X(RM, CTRL_GPFIFO_SET_WORK_SUBMIT_TOKEN_NOTIF_INDEX) //187
+    X(RM, PMA_SCRUBBER_SHARED_BUFFER_GUEST_PAGES_OPERATION)  //188
+    X(RM, CTRL_MASTER_GET_VIRTUAL_FUNCTION_ERROR_CONT_INTR_MASK)    //189
+    X(RM, SET_SYSMEM_DIRTY_PAGE_TRACKING_BUFFER)  //190
+    X(RM, CTRL_SUBDEVICE_GET_P2P_CAPS)          // 191
+    X(RM, CTRL_BUS_SET_P2P_MAPPING)             // 192
+    X(RM, CTRL_BUS_UNSET_P2P_MAPPING)           // 193
+    X(RM, CTRL_FLA_SETUP_INSTANCE_MEM_BLOCK)    // 194
+    X(RM, CTRL_GPU_MIGRATABLE_OPS)              // 195
+    X(RM, CTRL_GET_TOTAL_HS_CREDITS)            // 196
+    X(RM, CTRL_GET_HS_CREDITS)                  // 197
+    X(RM, CTRL_SET_HS_CREDITS)                  // 198
+    X(RM, CTRL_PM_AREA_PC_SAMPLER)              // 199
+    X(RM, INVALIDATE_TLB)                       // 200
+    X(RM, NUM_FUNCTIONS)                        //END
+#ifdef DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
+};
+#   undef X
+#   undef DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
+#endif
+
+#ifndef E
+#    define E(RPC) NV_VGPU_MSG_EVENT_##RPC,
+#    define DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+enum {
+#endif
+    E(FIRST_EVENT = 0x1000)                      // 0x1000
+    E(GSP_INIT_DONE)                             // 0x1001
+    E(GSP_RUN_CPU_SEQUENCER)                     // 0x1002
+    E(POST_EVENT)                                // 0x1003
+    E(RC_TRIGGERED)                              // 0x1004
+    E(MMU_FAULT_QUEUED)                          // 0x1005
+    E(OS_ERROR_LOG)                              // 0x1006
+    E(RG_LINE_INTR)                              // 0x1007
+    E(GPUACCT_PERFMON_UTIL_SAMPLES)              // 0x1008
+    E(SIM_READ)                                  // 0x1009
+    E(SIM_WRITE)                                 // 0x100a
+    E(SEMAPHORE_SCHEDULE_CALLBACK)               // 0x100b
+    E(UCODE_LIBOS_PRINT)                         // 0x100c
+    E(VGPU_GSP_PLUGIN_TRIGGERED)                 // 0x100d
+    E(PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK)       // 0x100e
+    E(PERF_BRIDGELESS_INFO_UPDATE)               // 0x100f
+    E(VGPU_CONFIG)                               // 0x1010
+    E(DISPLAY_MODESET)                           // 0x1011
+    E(EXTDEV_INTR_SERVICE)                       // 0x1012
+    E(NVLINK_INBAND_RECEIVED_DATA_256)           // 0x1013
+    E(NVLINK_INBAND_RECEIVED_DATA_512)           // 0x1014
+    E(NVLINK_INBAND_RECEIVED_DATA_1024)          // 0x1015
+    E(NVLINK_INBAND_RECEIVED_DATA_2048)          // 0x1016
+    E(NVLINK_INBAND_RECEIVED_DATA_4096)          // 0x1017
+    E(TIMED_SEMAPHORE_RELEASE)                   // 0x1018
+    E(NVLINK_IS_GPU_DEGRADED)                    // 0x1019
+    E(PFM_REQ_HNDLR_STATE_SYNC_CALLBACK)         // 0x101a
+    E(GSP_SEND_USER_SHARED_DATA)                 // 0x101b
+    E(NVLINK_FAULT_UP)                           // 0x101c
+    E(GSP_LOCKDOWN_NOTICE)                       // 0x101d
+    E(MIG_CI_CONFIG_UPDATE)                      // 0x101e
+    E(NUM_EVENTS)                                // END
+#ifdef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+};
+#   undef E
+#   undef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h b/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
new file mode 100644
index 000000000000..e6833df1ccc7
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/nvtypes.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVRM_NVTYPES_H__
+#define __NVRM_NVTYPES_H__
+
+#define NV_ALIGN_BYTES(a) __attribute__ ((__aligned__(a)))
+#define NV_DECLARE_ALIGNED(f,a) f __attribute__ ((__aligned__(a)))
+
+typedef u32 NvV32;
+
+typedef u8 NvU8;
+typedef u16 NvU16;
+typedef u32 NvU32;
+typedef u64 NvU64;
+
+typedef void* NvP64;
+
+typedef NvU8 NvBool;
+typedef NvU32 NvHandle;
+typedef NvU64 NvLength;
+
+typedef NvU64 RmPhysAddr;
+
+typedef NvU32 NV_STATUS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 80ebf2a3a990..ce5652496e2c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2744,6 +2744,66 @@ nv177_chipset = {
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
+static const struct nvkm_device_chip
+nv192_chipset = {
+	.name = "AD102",
+	.bios     = { 0x00000001, nvkm_bios_new },
+	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fb       = { 0x00000001, ga102_fb_new },
+	.gsp      = { 0x00000001, ad102_gsp_new },
+	.pci      = { 0x00000001, gp100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.sec2     = { 0x00000001, ga102_sec2_new },
+};
+
+static const struct nvkm_device_chip
+nv193_chipset = {
+	.name = "AD103",
+	.bios     = { 0x00000001, nvkm_bios_new },
+	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fb       = { 0x00000001, ga102_fb_new },
+	.gsp      = { 0x00000001, ad102_gsp_new },
+	.pci      = { 0x00000001, gp100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.sec2     = { 0x00000001, ga102_sec2_new },
+};
+
+static const struct nvkm_device_chip
+nv194_chipset = {
+	.name = "AD104",
+	.bios     = { 0x00000001, nvkm_bios_new },
+	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fb       = { 0x00000001, ga102_fb_new },
+	.gsp      = { 0x00000001, ad102_gsp_new },
+	.pci      = { 0x00000001, gp100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.sec2     = { 0x00000001, ga102_sec2_new },
+};
+
+static const struct nvkm_device_chip
+nv196_chipset = {
+	.name = "AD106",
+	.bios     = { 0x00000001, nvkm_bios_new },
+	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fb       = { 0x00000001, ga102_fb_new },
+	.gsp      = { 0x00000001, ad102_gsp_new },
+	.pci      = { 0x00000001, gp100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.sec2     = { 0x00000001, ga102_sec2_new },
+};
+
+static const struct nvkm_device_chip
+nv197_chipset = {
+	.name = "AD107",
+	.bios     = { 0x00000001, nvkm_bios_new },
+	.devinit  = { 0x00000001, ga100_devinit_new },
+	.fb       = { 0x00000001, ga102_fb_new },
+	.gsp      = { 0x00000001, ad102_gsp_new },
+	.pci      = { 0x00000001, gp100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.sec2     = { 0x00000001, ga102_sec2_new },
+};
+
 struct nvkm_subdev *
 nvkm_device_subdev(struct nvkm_device *device, int type, int inst)
 {
@@ -3062,6 +3122,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 			case 0x140: device->card_type = GV100; break;
 			case 0x160: device->card_type = TU100; break;
 			case 0x170: device->card_type = GA100; break;
+			case 0x190: device->card_type = AD100; break;
 			default:
 				break;
 			}
@@ -3164,6 +3225,11 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x174: device->chip = &nv174_chipset; break;
 		case 0x176: device->chip = &nv176_chipset; break;
 		case 0x177: device->chip = &nv177_chipset; break;
+		case 0x192: device->chip = &nv192_chipset; break;
+		case 0x193: device->chip = &nv193_chipset; break;
+		case 0x194: device->chip = &nv194_chipset; break;
+		case 0x196: device->chip = &nv196_chipset; break;
+		case 0x197: device->chip = &nv197_chipset; break;
 		default:
 			if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
 				switch (device->chipset) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 9b39ec341615..7fd4800a876a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -147,6 +147,7 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 	case GV100: args->v0.family = NV_DEVICE_INFO_V0_VOLTA; break;
 	case TU100: args->v0.family = NV_DEVICE_INFO_V0_TURING; break;
 	case GA100: args->v0.family = NV_DEVICE_INFO_V0_AMPERE; break;
+	case AD100: args->v0.family = NV_DEVICE_INFO_V0_ADA; break;
 	default:
 		args->v0.family = 0;
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild b/drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild
index 9ffe7b921ccb..d6b015564401 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/Kbuild
@@ -8,5 +8,6 @@ nvkm-y += nvkm/falcon/v1.o
 
 nvkm-y += nvkm/falcon/gm200.o
 nvkm-y += nvkm/falcon/gp102.o
+nvkm-y += nvkm/falcon/tu102.o
 nvkm-y += nvkm/falcon/ga100.o
 nvkm-y += nvkm/falcon/ga102.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/base.c b/drivers/gpu/drm/nouveau/nvkm/falcon/base.c
index 235149f73a69..8c4f659e982b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/base.c
@@ -25,6 +25,15 @@
 #include <subdev/timer.h>
 #include <subdev/top.h>
 
+bool
+nvkm_falcon_riscv_active(struct nvkm_falcon *falcon)
+{
+	if (!falcon->func->riscv_active)
+		return false;
+
+	return falcon->func->riscv_active(falcon);
+}
+
 static const struct nvkm_falcon_func_dma *
 nvkm_falcon_dma(struct nvkm_falcon *falcon, enum nvkm_falcon_mem *mem_type, u32 *mem_base)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c b/drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c
index 0ff450fe3590..834afa45f2fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/ga102.c
@@ -24,6 +24,12 @@
 #include <subdev/mc.h>
 #include <subdev/timer.h>
 
+bool
+ga102_flcn_riscv_active(struct nvkm_falcon *falcon)
+{
+	return (nvkm_falcon_rd32(falcon, falcon->addr2 + 0x388) & 0x00000080) != 0;
+}
+
 static bool
 ga102_flcn_dma_done(struct nvkm_falcon *falcon)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c b/drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c
new file mode 100644
index 000000000000..399918219485
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/tu102.c
@@ -0,0 +1,28 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "priv.h"
+
+bool
+tu102_flcn_riscv_active(struct nvkm_falcon *falcon)
+{
+	return (nvkm_falcon_rd32(falcon, falcon->addr2 + 0x240) & 0x00000001) != 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
index 6c318e41bde0..91f486ee4c42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
@@ -46,6 +46,14 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
 	return true;
 }
 
+void *
+nvbios_pointer(struct nvkm_bios *bios, u32 addr)
+{
+	if (likely(nvbios_addr(bios, &addr, 0)))
+		return &bios->data[addr];
+	return NULL;
+}
+
 u8
 nvbios_rd08(struct nvkm_bios *bios, u32 addr)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
index 4b497ad9bb91..16bf2f1bb780 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
@@ -1,7 +1,12 @@
 # SPDX-License-Identifier: MIT
 nvkm-y += nvkm/subdev/gsp/base.o
+nvkm-y += nvkm/subdev/gsp/fwsec.o
+
 nvkm-y += nvkm/subdev/gsp/gv100.o
 nvkm-y += nvkm/subdev/gsp/tu102.o
 nvkm-y += nvkm/subdev/gsp/tu116.o
 nvkm-y += nvkm/subdev/gsp/ga100.o
 nvkm-y += nvkm/subdev/gsp/ga102.o
+nvkm-y += nvkm/subdev/gsp/ad102.o
+
+nvkm-y += nvkm/subdev/gsp/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
new file mode 100644
index 000000000000..0ca6c397de96
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -0,0 +1,57 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "priv.h"
+
+static const struct nvkm_gsp_func
+ad102_gsp_r535_54_03 = {
+	.flcn = &ga102_gsp_flcn,
+	.fwsec = &ga102_gsp_fwsec,
+
+	.sig_section = ".fwsignature_ad10x",
+
+	.wpr_heap.os_carveout_size = 20 << 20,
+	.wpr_heap.base_size = 8 << 20,
+	.wpr_heap.min_size = 84 << 20,
+
+	.booter.ctor = ga102_gsp_booter_ctor,
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = tu102_gsp_oneinit,
+	.init = r535_gsp_init,
+	.fini = r535_gsp_fini,
+	.reset = ga102_gsp_reset,
+
+	.rm = &r535_gsp_rm,
+};
+
+static struct nvkm_gsp_fwif
+ad102_gsps[] = {
+	{ 0, r535_gsp_load, &ad102_gsp_r535_54_03, "535.54.03", true },
+	{}
+};
+
+int
+ad102_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_gsp **pgsp)
+{
+	return nvkm_gsp_new_(ad102_gsps, device, type, inst, pgsp);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index 9424d104f2be..d456ca29c418 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -90,6 +90,7 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 		return PTR_ERR(fwif);
 
 	gsp->func = fwif->func;
+	gsp->rm = gsp->func->rm;
 
 	return nvkm_falcon_ctor(gsp->func->flcn, &gsp->subdev, gsp->subdev.name, 0x110000,
 				&gsp->falcon);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
new file mode 100644
index 000000000000..330d72b1a4af
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
@@ -0,0 +1,359 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "priv.h"
+
+#include <subdev/bios.h>
+#include <subdev/bios/pmu.h>
+
+#include <nvfw/fw.h>
+
+union nvfw_falcon_appif_hdr {
+	struct nvfw_falcon_appif_hdr_v1 {
+		u8 ver;
+		u8 hdr;
+		u8 len;
+		u8 cnt;
+	} v1;
+};
+
+union nvfw_falcon_appif {
+	struct nvfw_falcon_appif_v1 {
+#define NVFW_FALCON_APPIF_ID_DMEMMAPPER 0x00000004
+		u32 id;
+		u32 dmem_base;
+	} v1;
+};
+
+union nvfw_falcon_appif_dmemmapper {
+	struct {
+		u32 signature;
+		u16 version;
+		u16 size;
+		u32 cmd_in_buffer_offset;
+		u32 cmd_in_buffer_size;
+		u32 cmd_out_buffer_offset;
+		u32 cmd_out_buffer_size;
+		u32 nvf_img_data_buffer_offset;
+		u32 nvf_img_data_buffer_size;
+		u32 printf_buffer_hdr;
+		u32 ucode_build_time_stamp;
+		u32 ucode_signature;
+#define NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS 0x00000015
+#define NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB   0x00000019
+		u32 init_cmd;
+		u32 ucode_feature;
+		u32 ucode_cmd_mask0;
+		u32 ucode_cmd_mask1;
+		u32 multi_tgt_tbl;
+	} v3;
+};
+
+struct nvfw_fwsec_frts_cmd {
+	struct {
+	    u32 ver;
+	    u32 hdr;
+	    u64 addr;
+	    u32 size;
+	    u32 flags;
+	} read_vbios;
+	struct {
+	    u32 ver;
+	    u32 hdr;
+	    u32 addr;
+	    u32 size;
+#define NVFW_FRTS_CMD_REGION_TYPE_FB 0x00000002
+	    u32 type;
+	} frts_region;
+};
+
+static int
+nvkm_gsp_fwsec_patch(struct nvkm_gsp *gsp, struct nvkm_falcon_fw *fw, u32 if_offset, u32 init_cmd)
+{
+	union nvfw_falcon_appif_hdr *hdr = (void *)(fw->fw.img + fw->dmem_base_img + if_offset);
+	const u8 *dmem = fw->fw.img + fw->dmem_base_img;
+	int i;
+
+	if (WARN_ON(hdr->v1.ver != 1))
+		return -EINVAL;
+
+	for (i = 0; i < hdr->v1.cnt; i++) {
+		union nvfw_falcon_appif *app = (void *)((u8 *)hdr + hdr->v1.hdr + i * hdr->v1.len);
+		union nvfw_falcon_appif_dmemmapper *dmemmap;
+		struct nvfw_fwsec_frts_cmd *frtscmd;
+
+		if (app->v1.id != NVFW_FALCON_APPIF_ID_DMEMMAPPER)
+			continue;
+
+		dmemmap = (void *)(dmem + app->v1.dmem_base);
+		dmemmap->v3.init_cmd = init_cmd;
+
+		frtscmd = (void *)(dmem + dmemmap->v3.cmd_in_buffer_offset);
+
+		frtscmd->read_vbios.ver = 1;
+		frtscmd->read_vbios.hdr = sizeof(frtscmd->read_vbios);
+		frtscmd->read_vbios.addr = 0;
+		frtscmd->read_vbios.size = 0;
+		frtscmd->read_vbios.flags = 2;
+
+		if (init_cmd == NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS) {
+			frtscmd->frts_region.ver = 1;
+			frtscmd->frts_region.hdr = sizeof(frtscmd->frts_region);
+			frtscmd->frts_region.addr = gsp->fb.wpr2.frts.addr >> 12;
+			frtscmd->frts_region.size = gsp->fb.wpr2.frts.size >> 12;
+			frtscmd->frts_region.type = NVFW_FRTS_CMD_REGION_TYPE_FB;
+		}
+
+		break;
+	}
+
+	if (WARN_ON(i == hdr->v1.cnt))
+		return -EINVAL;
+
+	return 0;
+}
+
+union nvfw_falcon_ucode_desc {
+	struct nvkm_falcon_ucode_desc_v2 {
+		u32 Hdr;
+		u32 StoredSize;
+		u32 UncompressedSize;
+		u32 VirtualEntry;
+		u32 InterfaceOffset;
+		u32 IMEMPhysBase;
+		u32 IMEMLoadSize;
+		u32 IMEMVirtBase;
+		u32 IMEMSecBase;
+		u32 IMEMSecSize;
+		u32 DMEMOffset;
+		u32 DMEMPhysBase;
+		u32 DMEMLoadSize;
+		u32 altIMEMLoadSize;
+		u32 altDMEMLoadSize;
+	} v2;
+
+	struct nvkm_falcon_ucode_desc_v3 {
+		u32 Hdr;
+		u32 StoredSize;
+		u32 PKCDataOffset;
+		u32 InterfaceOffset;
+		u32 IMEMPhysBase;
+		u32 IMEMLoadSize;
+		u32 IMEMVirtBase;
+		u32 DMEMPhysBase;
+		u32 DMEMLoadSize;
+		u16 EngineIdMask;
+		u8  UcodeId;
+		u8  SignatureCount;
+		u16 SignatureVersions;
+		u16 Reserved;
+	} v3;
+};
+
+static int
+nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
+		  const struct nvkm_falcon_ucode_desc_v2 *desc, u32 size, u32 init_cmd,
+		  struct nvkm_falcon_fw *fw)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	const struct firmware *bl;
+	const struct nvfw_bin_hdr *hdr;
+	const struct nvfw_bl_desc *bld;
+	int ret;
+
+	/* Build ucode. */
+	ret = nvkm_falcon_fw_ctor(gsp->func->fwsec, name, subdev->device, true,
+				  (u8 *)desc + size, desc->IMEMLoadSize + desc->DMEMLoadSize,
+				  &gsp->falcon, fw);
+	if (WARN_ON(ret))
+		return ret;
+
+	fw->nmem_base_img = 0;
+	fw->nmem_base = desc->IMEMPhysBase;
+	fw->nmem_size = desc->IMEMLoadSize - desc->IMEMSecSize;
+
+	fw->imem_base_img = 0;
+	fw->imem_base = desc->IMEMSecBase;
+	fw->imem_size = desc->IMEMSecSize;
+
+	fw->dmem_base_img = desc->DMEMOffset;
+	fw->dmem_base = desc->DMEMPhysBase;
+	fw->dmem_size = desc->DMEMLoadSize;
+
+	/* Bootloader. */
+	ret = nvkm_firmware_get(subdev, "acr/bl", 0, &bl);
+	if (ret)
+		return ret;
+
+	hdr = nvfw_bin_hdr(subdev, bl->data);
+	bld = nvfw_bl_desc(subdev, bl->data + hdr->header_offset);
+
+	fw->boot_addr = bld->start_tag << 8;
+	fw->boot_size = bld->code_size;
+	fw->boot = kmemdup(bl->data + hdr->data_offset + bld->code_off, fw->boot_size, GFP_KERNEL);
+	if (!fw->boot)
+		ret = -ENOMEM;
+
+	nvkm_firmware_put(bl);
+
+	/* Patch in interface data. */
+	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
+}
+
+static int
+nvkm_gsp_fwsec_v3(struct nvkm_gsp *gsp, const char *name,
+		  const struct nvkm_falcon_ucode_desc_v3 *desc, u32 size, u32 init_cmd,
+		  struct nvkm_falcon_fw *fw)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	struct nvkm_bios *bios = device->bios;
+	int ret;
+
+	/* Build ucode. */
+	ret = nvkm_falcon_fw_ctor(gsp->func->fwsec, name, device, true,
+				  (u8 *)desc + size, desc->IMEMLoadSize + desc->DMEMLoadSize,
+				  &gsp->falcon, fw);
+	if (WARN_ON(ret))
+		return ret;
+
+	fw->imem_base_img = 0;
+	fw->imem_base = desc->IMEMPhysBase;
+	fw->imem_size = desc->IMEMLoadSize;
+	fw->dmem_base_img = desc->IMEMLoadSize;
+	fw->dmem_base = desc->DMEMPhysBase;
+	fw->dmem_size = ALIGN(desc->DMEMLoadSize, 256);
+	fw->dmem_sign = desc->PKCDataOffset;
+	fw->boot_addr = 0;
+	fw->fuse_ver = desc->SignatureVersions;
+	fw->ucode_id = desc->UcodeId;
+	fw->engine_id = desc->EngineIdMask;
+
+	/* Patch in signature. */
+	ret = nvkm_falcon_fw_sign(fw, fw->dmem_base_img + desc->PKCDataOffset, 96 * 4,
+				  nvbios_pointer(bios, 0), desc->SignatureCount,
+				  (u8 *)desc + 0x2c - (u8 *)nvbios_pointer(bios, 0), 0, 0);
+	if (WARN_ON(ret))
+		return ret;
+
+	/* Patch in interface data. */
+	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset, init_cmd);
+}
+
+static int
+nvkm_gsp_fwsec(struct nvkm_gsp *gsp, const char *name, u32 init_cmd)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_bios *bios = device->bios;
+	const union nvfw_falcon_ucode_desc *desc;
+	struct nvbios_pmuE flcn_ucode;
+	u8 idx, ver, hdr;
+	u32 data;
+	u16 size, vers;
+	struct nvkm_falcon_fw fw = {};
+	u32 mbox0 = 0;
+	int ret;
+
+	/* Lookup in VBIOS. */
+	for (idx = 0; (data = nvbios_pmuEp(bios, idx, &ver, &hdr, &flcn_ucode)); idx++) {
+		if (flcn_ucode.type == 0x85)
+			break;
+	}
+
+	if (WARN_ON(!data))
+		return -EINVAL;
+
+	/* Deteremine version. */
+	desc = nvbios_pointer(bios, flcn_ucode.data);
+	if (WARN_ON(!(desc->v2.Hdr & 0x00000001)))
+		return -EINVAL;
+
+	size = (desc->v2.Hdr & 0xffff0000) >> 16;
+	vers = (desc->v2.Hdr & 0x0000ff00) >> 8;
+
+	switch (vers) {
+	case 2: ret = nvkm_gsp_fwsec_v2(gsp, name, &desc->v2, size, init_cmd, &fw); break;
+	case 3: ret = nvkm_gsp_fwsec_v3(gsp, name, &desc->v3, size, init_cmd, &fw); break;
+	default:
+		nvkm_error(subdev, "%s(v%d): version unknown\n", name, vers);
+		return -EINVAL;
+	}
+
+	if (ret) {
+		nvkm_error(subdev, "%s(v%d): %d\n", name, vers, ret);
+		return ret;
+	}
+
+	/* Boot. */
+	ret = nvkm_falcon_fw_boot(&fw, subdev, true, &mbox0, NULL, 0, 0);
+	nvkm_falcon_fw_dtor(&fw);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int
+nvkm_gsp_fwsec_sb(struct nvkm_gsp *gsp)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	int ret;
+	u32 err;
+
+	ret = nvkm_gsp_fwsec(gsp, "fwsec-sb", NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB);
+	if (ret)
+		return ret;
+
+	/* Verify. */
+	err = nvkm_rd32(device, 0x001400 + (0xf * 4)) & 0x0000ffff;
+	if (err) {
+		nvkm_error(subdev, "fwsec-sb: 0x%04x\n", err);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int
+nvkm_gsp_fwsec_frts(struct nvkm_gsp *gsp)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	int ret;
+	u32 err, wpr2_lo, wpr2_hi;
+
+	ret = nvkm_gsp_fwsec(gsp, "fwsec-frts", NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS);
+	if (ret)
+		return ret;
+
+	/* Verify. */
+	err = nvkm_rd32(device, 0x001400 + (0xe * 4)) >> 16;
+	if (err) {
+		nvkm_error(subdev, "fwsec-frts: 0x%04x\n", err);
+		return -EIO;
+	}
+
+	wpr2_lo = nvkm_rd32(device, 0x1fa824);
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	nvkm_debug(subdev, "fwsec-frts: WPR2 @ %08x - %08x\n", wpr2_lo, wpr2_hi);
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index 73c3676d15a6..be73678607c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -21,8 +21,30 @@
  */
 #include "priv.h"
 
+static const struct nvkm_gsp_func
+ga100_gsp_r535_54_03 = {
+	.flcn = &tu102_gsp_flcn,
+	.fwsec = &tu102_gsp_fwsec,
+
+	.sig_section = ".fwsignature_ga100",
+
+	.wpr_heap.base_size = 8 << 20,
+	.wpr_heap.min_size = 64 << 20,
+
+	.booter.ctor = tu102_gsp_booter_ctor,
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = tu102_gsp_oneinit,
+	.init = r535_gsp_init,
+	.fini = r535_gsp_fini,
+	.reset = tu102_gsp_reset,
+
+	.rm = &r535_gsp_rm,
+};
+
 static struct nvkm_gsp_fwif
 ga100_gsps[] = {
+	{  0,  r535_gsp_load, &ga100_gsp_r535_54_03, "535.54.03" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index ec6380f8bac5..19a2b582c661 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -21,7 +21,119 @@
  */
 #include "priv.h"
 
-static const struct nvkm_falcon_func
+#include <nvfw/flcn.h>
+#include <nvfw/fw.h>
+#include <nvfw/hs.h>
+
+int
+ga102_gsp_reset(struct nvkm_gsp *gsp)
+{
+	int ret;
+
+	ret = gsp->falcon.func->reset_eng(&gsp->falcon);
+	if (ret)
+		return ret;
+
+	nvkm_falcon_mask(&gsp->falcon, 0x1668, 0x00000111, 0x00000111);
+	return 0;
+}
+
+int
+ga102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmware *blob,
+		      struct nvkm_falcon *falcon, struct nvkm_falcon_fw *fw)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	const struct nvkm_falcon_fw_func *func = &ga102_flcn_fw;
+	const struct nvfw_bin_hdr *hdr;
+	const struct nvfw_hs_header_v2 *hshdr;
+	const struct nvfw_hs_load_header_v2 *lhdr;
+	u32 loc, sig, cnt, *meta;
+	int ret;
+
+	hdr = nvfw_bin_hdr(subdev, blob->data);
+	hshdr = nvfw_hs_header_v2(subdev, blob->data + hdr->header_offset);
+	meta = (u32 *)(blob->data + hshdr->meta_data_offset);
+	loc = *(u32 *)(blob->data + hshdr->patch_loc);
+	sig = *(u32 *)(blob->data + hshdr->patch_sig);
+	cnt = *(u32 *)(blob->data + hshdr->num_sig);
+
+	ret = nvkm_falcon_fw_ctor(func, name, subdev->device, true,
+				  blob->data + hdr->data_offset, hdr->data_size, falcon, fw);
+	if (ret)
+		goto done;
+
+	ret = nvkm_falcon_fw_sign(fw, loc, hshdr->sig_prod_size / cnt, blob->data,
+				  cnt, hshdr->sig_prod_offset + sig, 0, 0);
+	if (ret)
+		goto done;
+
+	lhdr = nvfw_hs_load_header_v2(subdev, blob->data + hshdr->header_offset);
+
+	fw->imem_base_img = lhdr->app[0].offset;
+	fw->imem_base = 0;
+	fw->imem_size = lhdr->app[0].size;
+
+	fw->dmem_base_img = lhdr->os_data_offset;
+	fw->dmem_base = 0;
+	fw->dmem_size = lhdr->os_data_size;
+	fw->dmem_sign = loc - lhdr->os_data_offset;
+
+	fw->boot_addr = lhdr->app[0].offset;
+
+	fw->fuse_ver = meta[0];
+	fw->engine_id = meta[1];
+	fw->ucode_id = meta[2];
+
+done:
+	if (ret)
+		nvkm_falcon_fw_dtor(fw);
+
+	return ret;
+}
+
+static int
+ga102_gsp_fwsec_signature(struct nvkm_falcon_fw *fw, u32 *src_base_src)
+{
+	struct nvkm_falcon *falcon = fw->falcon;
+	struct nvkm_device *device = falcon->owner->device;
+	u32 sig_fuse_version = fw->fuse_ver;
+	u32 reg_fuse_version;
+	int idx = 0;
+
+	FLCN_DBG(falcon, "brom: %08x %08x", fw->engine_id, fw->ucode_id);
+	FLCN_DBG(falcon, "sig_fuse_version: %08x", sig_fuse_version);
+
+	if (fw->engine_id & 0x00000400) {
+		reg_fuse_version = nvkm_rd32(device, 0x8241c0 + (fw->ucode_id - 1) * 4);
+	} else {
+		WARN_ON(1);
+		return -ENOSYS;
+	}
+
+	FLCN_DBG(falcon, "reg_fuse_version: %08x", reg_fuse_version);
+	reg_fuse_version = BIT(fls(reg_fuse_version));
+	FLCN_DBG(falcon, "reg_fuse_version: %08x", reg_fuse_version);
+	if (!(reg_fuse_version & fw->fuse_ver))
+		return -EINVAL;
+
+	while (!(reg_fuse_version & sig_fuse_version & 1)) {
+		idx += (sig_fuse_version & 1);
+		reg_fuse_version >>= 1;
+		sig_fuse_version >>= 1;
+	}
+
+	return idx;
+}
+
+const struct nvkm_falcon_fw_func
+ga102_gsp_fwsec = {
+	.signature = ga102_gsp_fwsec_signature,
+	.reset = gm200_flcn_fw_reset,
+	.load = ga102_flcn_fw_load,
+	.boot = ga102_flcn_fw_boot,
+};
+
+const struct nvkm_falcon_func
 ga102_gsp_flcn = {
 	.disable = gm200_flcn_disable,
 	.enable = gm200_flcn_enable,
@@ -32,6 +144,29 @@ ga102_gsp_flcn = {
 	.reset_wait_mem_scrubbing = ga102_flcn_reset_wait_mem_scrubbing,
 	.imem_dma = &ga102_flcn_dma,
 	.dmem_dma = &ga102_flcn_dma,
+	.riscv_active = ga102_flcn_riscv_active,
+};
+
+static const struct nvkm_gsp_func
+ga102_gsp_r535_54_03 = {
+	.flcn = &ga102_gsp_flcn,
+	.fwsec = &ga102_gsp_fwsec,
+
+	.sig_section = ".fwsignature_ga10x",
+
+	.wpr_heap.os_carveout_size = 20 << 20,
+	.wpr_heap.base_size = 8 << 20,
+	.wpr_heap.min_size = 84 << 20,
+
+	.booter.ctor = ga102_gsp_booter_ctor,
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = tu102_gsp_oneinit,
+	.init = r535_gsp_init,
+	.fini = r535_gsp_fini,
+	.reset = ga102_gsp_reset,
+
+	.rm = &r535_gsp_rm,
 };
 
 static const struct nvkm_gsp_func
@@ -41,6 +176,7 @@ ga102_gsp = {
 
 static struct nvkm_gsp_fwif
 ga102_gsps[] = {
+	{  0,  r535_gsp_load, &ga102_gsp_r535_54_03, "535.54.03" },
 	{ -1, gv100_gsp_nofw, &ga102_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 351c959476ec..9f4a62375a27 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -4,23 +4,65 @@
 #include <subdev/gsp.h>
 enum nvkm_acr_lsf_id;
 
+int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
+int nvkm_gsp_fwsec_sb(struct nvkm_gsp *);
+
 struct nvkm_gsp_fwif {
 	int version;
 	int (*load)(struct nvkm_gsp *, int ver, const struct nvkm_gsp_fwif *);
 	const struct nvkm_gsp_func *func;
+	const char *ver;
+	bool enable;
 };
 
 int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+int  r535_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
 
 struct nvkm_gsp_func {
 	const struct nvkm_falcon_func *flcn;
+	const struct nvkm_falcon_fw_func *fwsec;
+
+	char *sig_section;
+
+	struct {
+		u32 os_carveout_size;
+		u32 base_size;
+		u64 min_size;
+	} wpr_heap;
+
+	struct {
+		int (*ctor)(struct nvkm_gsp *, const char *name, const struct firmware *,
+			    struct nvkm_falcon *, struct nvkm_falcon_fw *);
+	} booter;
 
 	void (*dtor)(struct nvkm_gsp *);
 	int (*oneinit)(struct nvkm_gsp *);
 	int (*init)(struct nvkm_gsp *);
 	int (*fini)(struct nvkm_gsp *, bool suspend);
+	int (*reset)(struct nvkm_gsp *);
+
+	const struct nvkm_gsp_rm *rm;
 };
 
+extern const struct nvkm_falcon_func tu102_gsp_flcn;
+extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
+int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
+			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
+int tu102_gsp_oneinit(struct nvkm_gsp *);
+int tu102_gsp_reset(struct nvkm_gsp *);
+
+extern const struct nvkm_falcon_func ga102_gsp_flcn;
+extern const struct nvkm_falcon_fw_func ga102_gsp_fwsec;
+int ga102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
+			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
+int ga102_gsp_reset(struct nvkm_gsp *);
+
+void r535_gsp_dtor(struct nvkm_gsp *);
+int r535_gsp_oneinit(struct nvkm_gsp *);
+int r535_gsp_init(struct nvkm_gsp *);
+int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
+extern const struct nvkm_gsp_rm r535_gsp_rm;
+
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_gsp **);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
new file mode 100644
index 000000000000..4aaceb65217d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -0,0 +1,1561 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include "priv.h"
+
+#include <core/pci.h>
+#include <subdev/timer.h>
+#include <engine/sec2.h>
+
+#include <nvfw/fw.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
+#include <nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h>
+#include <nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h>
+#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h>
+#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h>
+#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h>
+#include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h>
+#include <nvrm/535.54.03/nvidia/generated/g_os_nvoc.h>
+#include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_init_args.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h>
+#include <nvrm/535.54.03/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+
+#include <linux/acpi.h>
+
+struct r535_gsp_msg {
+	u32 checksum;
+	u32 sequence;
+	u8  data[];
+};
+
+static void *
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 repc, u32 *prepc, int *ptime)
+{
+	struct r535_gsp_msg *mqe;
+	u32 size, rptr = *gsp->msgq.rptr;
+	int used;
+	u8 *msg;
+	u32 len;
+
+	size = DIV_ROUND_UP(sizeof(*mqe) + repc, GSP_PAGE_SIZE);
+	if (WARN_ON(!size || size >= gsp->msgq.cnt))
+		return ERR_PTR(-EINVAL);
+
+	do {
+		u32 wptr = *gsp->msgq.wptr;
+
+		used = wptr + gsp->msgq.cnt - rptr;
+		if (used >= gsp->msgq.cnt)
+			used -= gsp->msgq.cnt;
+		if (used >= size)
+			break;
+
+		usleep_range(1, 2);
+	} while (--(*ptime));
+
+	if (WARN_ON(!*ptime))
+		return ERR_PTR(-ETIMEDOUT);
+
+	mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
+
+	if (prepc) {
+		*prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
+		return mqe->data;
+	}
+
+	msg = kvmalloc(repc, GFP_KERNEL);
+	if (!msg)
+		return ERR_PTR(-ENOMEM);
+
+	len = ((gsp->msgq.cnt - rptr) * GSP_PAGE_SIZE) - sizeof(*mqe);
+	len = min_t(u32, repc, len);
+	memcpy(msg, mqe->data, len);
+
+	rptr += DIV_ROUND_UP(len, GSP_PAGE_SIZE);
+	if (rptr == gsp->msgq.cnt)
+		rptr = 0;
+
+	repc -= len;
+
+	if (repc) {
+		mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + 0 * 0x1000);
+		memcpy(msg + len, mqe, repc);
+
+		rptr += DIV_ROUND_UP(repc, GSP_PAGE_SIZE);
+	}
+
+	mb();
+	(*gsp->msgq.rptr) = rptr;
+	return msg;
+}
+
+static void *
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 repc, int *ptime)
+{
+	return r535_gsp_msgq_wait(gsp, repc, NULL, ptime);
+}
+
+static int
+r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
+{
+	struct r535_gsp_msg *cmd = container_of(argv, typeof(*cmd), data);
+	struct r535_gsp_msg *cqe;
+	u32 argc = cmd->checksum;
+	u64 *ptr = (void *)cmd;
+	u64 *end = (void *)cmd->data + argc;
+	u64 csum = 0;
+	int free, time = 1000000;
+	u32 wptr, size;
+	u32 off = 0;
+
+	cmd->checksum = 0;
+	cmd->sequence = gsp->cmdq.seq++;
+	while (ptr < end)
+		csum ^= *ptr++;
+
+	cmd->checksum = upper_32_bits(csum) ^ lower_32_bits(csum);
+
+	argc = sizeof(*cmd) + argc;
+	wptr = *gsp->cmdq.wptr;
+	do {
+		do {
+			free = *gsp->cmdq.rptr + gsp->cmdq.cnt - wptr - 1;
+			if (free >= gsp->cmdq.cnt)
+				free -= gsp->cmdq.cnt;
+			if (free >= 1)
+				break;
+
+			usleep_range(1, 2);
+		} while(--time);
+
+		if (WARN_ON(!time)) {
+			kvfree(cmd);
+			return -ETIMEDOUT;
+		}
+
+		cqe = (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wptr * 0x1000);
+		size = min_t(u32, argc, (gsp->cmdq.cnt - wptr) * GSP_PAGE_SIZE);
+		memcpy(cqe, (u8 *)cmd + off, size);
+
+		wptr += DIV_ROUND_UP(size, 0x1000);
+		if (wptr == gsp->cmdq.cnt)
+			wptr = 0;
+
+		off  += size;
+		argc -= size;
+	} while(argc);
+
+	nvkm_trace(&gsp->subdev, "cmdq: wptr %d\n", wptr);
+	wmb();
+	(*gsp->cmdq.wptr) = wptr;
+	mb();
+
+	nvkm_falcon_wr32(&gsp->falcon, 0xc00, 0x00000000);
+
+	kvfree(cmd);
+	return 0;
+}
+
+static void *
+r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
+{
+	struct r535_gsp_msg *cmd;
+
+	cmd = kvzalloc(sizeof(*cmd) + argc, GFP_KERNEL);
+	if (!cmd)
+		return ERR_PTR(-ENOMEM);
+
+	cmd->checksum = argc;
+	return cmd->data;
+}
+
+struct nvfw_gsp_rpc {
+	u32 header_version;
+	u32 signature;
+	u32 length;
+	u32 function;
+	u32 rpc_result;
+	u32 rpc_result_private;
+	u32 sequence;
+	union {
+		u32 spare;
+		u32 cpuRmGfid;
+	};
+	u8  data[];
+};
+
+static void
+r535_gsp_msg_done(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg)
+{
+	kvfree(msg);
+}
+
+static void
+r535_gsp_msg_dump(struct nvkm_gsp *gsp, struct nvfw_gsp_rpc *msg, int lvl)
+{
+	if (gsp->subdev.debug >= lvl) {
+		nvkm_printk__(&gsp->subdev, lvl, info,
+			      "msg fn:%d len:0x%x/0x%zx res:0x%x resp:0x%x\n",
+			      msg->function, msg->length, msg->length - sizeof(*msg),
+			      msg->rpc_result, msg->rpc_result_private);
+		print_hex_dump(KERN_INFO, "msg: ", DUMP_PREFIX_OFFSET, 16, 1,
+			       msg->data, msg->length - sizeof(*msg), true);
+	}
+}
+
+static struct nvfw_gsp_rpc *
+r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 repc)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvfw_gsp_rpc *msg;
+	int time = 4000000, i;
+	u32 size;
+
+retry:
+	msg = r535_gsp_msgq_wait(gsp, sizeof(*msg), &size, &time);
+	if (IS_ERR_OR_NULL(msg))
+		return msg;
+
+	msg = r535_gsp_msgq_recv(gsp, msg->length, &time);
+	if (IS_ERR_OR_NULL(msg))
+		return msg;
+
+	if (msg->rpc_result) {
+		r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
+		r535_gsp_msg_done(gsp, msg);
+		return ERR_PTR(-EINVAL);
+	}
+
+	r535_gsp_msg_dump(gsp, msg, NV_DBG_TRACE);
+
+	if (fn && msg->function == fn) {
+		if (repc) {
+			if (msg->length < sizeof(*msg) + repc) {
+				nvkm_error(subdev, "msg len %d < %zd\n",
+					   msg->length, sizeof(*msg) + repc);
+				r535_gsp_msg_dump(gsp, msg, NV_DBG_ERROR);
+				r535_gsp_msg_done(gsp, msg);
+				return ERR_PTR(-EIO);
+			}
+
+			return msg;
+		}
+
+		r535_gsp_msg_done(gsp, msg);
+		return NULL;
+	}
+
+	for (i = 0; i < gsp->msgq.ntfy_nr; i++) {
+		struct nvkm_gsp_msgq_ntfy *ntfy = &gsp->msgq.ntfy[i];
+
+		if (ntfy->fn == msg->function) {
+			ntfy->func(ntfy->priv, ntfy->fn, msg->data, msg->length - sizeof(*msg));
+			break;
+		}
+	}
+
+	if (i == gsp->msgq.ntfy_nr)
+		r535_gsp_msg_dump(gsp, msg, NV_DBG_WARN);
+
+	r535_gsp_msg_done(gsp, msg);
+	if (fn)
+		goto retry;
+
+	if (*gsp->msgq.rptr != *gsp->msgq.wptr)
+		goto retry;
+
+	return NULL;
+}
+
+static int
+r535_gsp_msg_ntfy_add(struct nvkm_gsp *gsp, u32 fn, nvkm_gsp_msg_ntfy_func func, void *priv)
+{
+	int ret = 0;
+
+	mutex_lock(&gsp->msgq.mutex);
+	if (WARN_ON(gsp->msgq.ntfy_nr >= ARRAY_SIZE(gsp->msgq.ntfy))) {
+		ret = -ENOSPC;
+	} else {
+		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].fn = fn;
+		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].func = func;
+		gsp->msgq.ntfy[gsp->msgq.ntfy_nr].priv = priv;
+		gsp->msgq.ntfy_nr++;
+	}
+	mutex_unlock(&gsp->msgq.mutex);
+	return ret;
+}
+
+static int
+r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
+{
+	void *repv;
+
+	mutex_lock(&gsp->cmdq.mutex);
+	repv = r535_gsp_msg_recv(gsp, fn, 0);
+	mutex_unlock(&gsp->cmdq.mutex);
+	if (IS_ERR(repv))
+		return PTR_ERR(repv);
+
+	return 0;
+}
+
+static void *
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+{
+	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
+	struct nvfw_gsp_rpc *msg;
+	u32 fn = rpc->function;
+	void *repv = NULL;
+	int ret;
+
+	if (gsp->subdev.debug >= NV_DBG_TRACE) {
+		nvkm_trace(&gsp->subdev, "rpc fn:%d len:0x%x/0x%zx\n", rpc->function,
+			   rpc->length, rpc->length - sizeof(*rpc));
+		print_hex_dump(KERN_INFO, "rpc: ", DUMP_PREFIX_OFFSET, 16, 1,
+			       rpc->data, rpc->length - sizeof(*rpc), true);
+	}
+
+	ret = r535_gsp_cmdq_push(gsp, rpc);
+	if (ret) {
+		mutex_unlock(&gsp->cmdq.mutex);
+		return ERR_PTR(ret);
+	}
+
+	if (wait) {
+		msg = r535_gsp_msg_recv(gsp, fn, repc);
+		if (!IS_ERR_OR_NULL(msg))
+			repv = msg->data;
+		else
+			repv = msg;
+	}
+
+	return repv;
+}
+
+static void
+r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
+{
+	struct nvfw_gsp_rpc *rpc = container_of(repv, typeof(*rpc), data);
+
+	r535_gsp_msg_done(gsp, rpc);
+}
+
+static void *
+r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
+{
+	struct nvfw_gsp_rpc *rpc;
+
+	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
+	if (!rpc)
+		return NULL;
+
+	rpc->header_version = 0x03000000;
+	rpc->signature = ('V' << 24) | ('R' << 16) | ('P' << 8) | 'C';
+	rpc->function = fn;
+	rpc->rpc_result = 0xffffffff;
+	rpc->rpc_result_private = 0xffffffff;
+	rpc->length = sizeof(*rpc) + argc;
+	return rpc->data;
+}
+
+static void *
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+{
+	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
+	struct r535_gsp_msg *cmd = container_of((void *)rpc, typeof(*cmd), data);
+	const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
+	const u32 max_rpc_size = max_msg_size - sizeof(*rpc);
+	u32 rpc_size = rpc->length - sizeof(*rpc);
+	void *repv;
+
+	mutex_lock(&gsp->cmdq.mutex);
+	if (rpc_size > max_rpc_size) {
+		const u32 fn = rpc->function;
+
+		/* Adjust length, and send initial RPC. */
+		rpc->length = sizeof(*rpc) + max_rpc_size;
+		cmd->checksum = rpc->length;
+
+		repv = r535_gsp_rpc_send(gsp, argv, false, 0);
+		if (IS_ERR(repv))
+			goto done;
+
+		argv += max_rpc_size;
+		rpc_size -= max_rpc_size;
+
+		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
+		while (rpc_size) {
+			u32 size = min(rpc_size, max_rpc_size);
+			void *next;
+
+			next = r535_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD, size);
+			if (IS_ERR(next)) {
+				repv = next;
+				goto done;
+			}
+
+			memcpy(next, argv, size);
+
+			repv = r535_gsp_rpc_send(gsp, next, false, 0);
+			if (IS_ERR(repv))
+				goto done;
+
+			argv += size;
+			rpc_size -= size;
+		}
+
+		/* Wait for reply. */
+		if (wait) {
+			rpc = r535_gsp_msg_recv(gsp, fn, repc);
+			if (!IS_ERR_OR_NULL(rpc))
+				repv = rpc->data;
+			else
+				repv = rpc;
+		} else {
+			repv = NULL;
+		}
+	} else {
+		repv = r535_gsp_rpc_send(gsp, argv, wait, repc);
+	}
+
+done:
+	mutex_unlock(&gsp->cmdq.mutex);
+	return repv;
+}
+
+const struct nvkm_gsp_rm
+r535_gsp_rm = {
+	.rpc_get = r535_gsp_rpc_get,
+	.rpc_push = r535_gsp_rpc_push,
+	.rpc_done = r535_gsp_rpc_done,
+};
+
+static int
+r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
+{
+	rpc_unloading_guest_driver_v1F_07 *rpc;
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER, sizeof(*rpc));
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	if (suspend) {
+		rpc->bInPMTransition = 1;
+		rpc->bGc6Entering = 0;
+		rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
+	} else {
+		rpc->bInPMTransition = 0;
+		rpc->bGc6Entering = 0;
+		rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0;
+	}
+
+	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+}
+
+static int
+r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
+{
+	PACKED_REGISTRY_TABLE *rpc;
+	char *strings;
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
+			       sizeof(*rpc) + sizeof(rpc->entries[0]) + 1);
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	rpc->size = sizeof(*rpc);
+	rpc->numEntries = 1;
+	rpc->entries[0].nameOffset = offsetof(typeof(*rpc), entries[1]);
+	rpc->entries[0].type = 1;
+	rpc->entries[0].data = 0;
+	rpc->entries[0].length = 4;
+
+	strings = (char *)&rpc->entries[1];
+	strings[0] = '\0';
+
+	return nvkm_gsp_rpc_wr(gsp, rpc, false);
+}
+
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
+static void
+r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DATA *caps)
+{
+	const guid_t NVOP_DSM_GUID =
+		GUID_INIT(0xA486D8F8, 0x0BDA, 0x471B,
+			  0xA7, 0x2B, 0x60, 0x42, 0xA6, 0xB5, 0xBE, 0xE0);
+	u64 NVOP_DSM_REV = 0x00000100;
+	union acpi_object argv4 = {
+		.buffer.type    = ACPI_TYPE_BUFFER,
+		.buffer.length  = 4,
+		.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
+	}, *obj;
+
+	caps->status = 0xffff;
+
+	if (!acpi_check_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV, BIT_ULL(0x1a)))
+		return;
+
+	obj = acpi_evaluate_dsm(handle, &NVOP_DSM_GUID, NVOP_DSM_REV, 0x1a, &argv4);
+	if (!obj)
+		return;
+
+	printk(KERN_ERR "nvop: obj type %d\n", obj->type);
+	printk(KERN_ERR "nvop: obj len %d\n", obj->buffer.length);
+
+	if (WARN_ON(obj->type != ACPI_TYPE_BUFFER) ||
+	    WARN_ON(obj->buffer.length != 4))
+		return;
+
+	caps->status = 0;
+	caps->optimusCaps = *(u32 *)obj->buffer.pointer;
+	printk(KERN_ERR "nvop: caps %08x\n", caps->optimusCaps);
+
+	ACPI_FREE(obj);
+
+	kfree(argv4.buffer.pointer);
+}
+
+static void
+r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA *jt)
+{
+	const guid_t JT_DSM_GUID =
+		GUID_INIT(0xCBECA351L, 0x067B, 0x4924,
+			  0x9C, 0xBD, 0xB4, 0x6B, 0x00, 0xB8, 0x6F, 0x34);
+	u64 JT_DSM_REV = 0x00000103;
+	u32 caps;
+	union acpi_object argv4 = {
+		.buffer.type    = ACPI_TYPE_BUFFER,
+		.buffer.length  = sizeof(caps),
+		.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
+	}, *obj;
+
+	jt->status = 0xffff;
+
+	obj = acpi_evaluate_dsm(handle, &JT_DSM_GUID, JT_DSM_REV, 0x1, &argv4);
+	if (!obj)
+		return;
+
+	printk(KERN_ERR "jt: obj type %d\n", obj->type);
+	printk(KERN_ERR "jt: obj len %d\n", obj->buffer.length);
+
+	if (WARN_ON(obj->type != ACPI_TYPE_BUFFER) ||
+	    WARN_ON(obj->buffer.length != 4))
+		return;
+
+	jt->status = 0;
+	jt->jtCaps = *(u32 *)obj->buffer.pointer;
+	jt->jtRevId = (jt->jtCaps & 0xfff00000) >> 20;
+	jt->bSBIOSCaps = 0;
+	printk(KERN_ERR "jt: caps %08x rev:%04x\n", jt->jtCaps, jt->jtRevId);
+
+	ACPI_FREE(obj);
+
+	kfree(argv4.buffer.pointer);
+}
+
+static void
+r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
+						 MUX_METHOD_DATA_ELEMENT *part)
+{
+	acpi_handle iter = NULL, handle_mux;
+	acpi_status status;
+	unsigned long long value;
+
+	mode->status = 0xffff;
+	part->status = 0xffff;
+
+	do {
+		status = acpi_get_next_object(ACPI_TYPE_DEVICE, handle, iter, &iter);
+		if (ACPI_FAILURE(status) || !iter)
+			return;
+
+		status = acpi_evaluate_integer(iter, "_ADR", NULL, &value);
+		if (ACPI_FAILURE(status) || value != id)
+			continue;
+
+		handle_mux = iter;
+	} while (!handle_mux);
+
+	if (!handle_mux)
+		return;
+
+	status = acpi_evaluate_integer(handle_mux, "MXDM", NULL, &value);
+	if (ACPI_SUCCESS(status)) {
+		mode->acpiId = id;
+		mode->mode   = value;
+		mode->status = 0;
+	}
+
+	status = acpi_evaluate_integer(handle_mux, "MXDS", NULL, &value);
+	if (ACPI_SUCCESS(status)) {
+		part->acpiId = id;
+		part->mode   = value;
+		part->status = 0;
+	}
+}
+
+static void
+r535_gsp_acpi_mux(acpi_handle handle, DOD_METHOD_DATA *dod, MUX_METHOD_DATA *mux)
+{
+	mux->tableLen = dod->acpiIdListLen / sizeof(dod->acpiIdList[0]);
+
+	for (int i = 0; i < mux->tableLen; i++) {
+		r535_gsp_acpi_mux_id(handle, dod->acpiIdList[i], &mux->acpiIdMuxModeTable[i],
+								 &mux->acpiIdMuxPartTable[i]);
+	}
+}
+
+static void
+r535_gsp_acpi_dod(acpi_handle handle, DOD_METHOD_DATA *dod)
+{
+	acpi_status status;
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *_DOD;
+
+	dod->status = 0xffff;
+
+	status = acpi_evaluate_object(handle, "_DOD", NULL, &output);
+	if (ACPI_FAILURE(status))
+		return;
+
+	_DOD = output.pointer;
+
+	if (WARN_ON(_DOD->type != ACPI_TYPE_PACKAGE) ||
+	    WARN_ON(_DOD->package.count > ARRAY_SIZE(dod->acpiIdList)))
+		return;
+
+	for (int i = 0; i < _DOD->package.count; i++) {
+		if (WARN_ON(_DOD->package.elements[i].type != ACPI_TYPE_INTEGER))
+			return;
+
+		dod->acpiIdList[i] = _DOD->package.elements[i].integer.value;
+		dod->acpiIdListLen += sizeof(dod->acpiIdList[0]);
+	}
+
+	printk(KERN_ERR "_DOD: ok! len:%d\n", dod->acpiIdListLen);
+	dod->status = 0;
+}
+#endif
+
+static void
+r535_gsp_acpi_info(struct nvkm_gsp *gsp, ACPI_METHOD_DATA *acpi)
+{
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
+	acpi_handle handle = ACPI_HANDLE(gsp->subdev.device->dev);
+
+	if (!handle)
+		return;
+
+	acpi->bValid = 1;
+
+	r535_gsp_acpi_dod(handle, &acpi->dodMethodData);
+	if (acpi->dodMethodData.status == 0)
+		r535_gsp_acpi_mux(handle, &acpi->dodMethodData, &acpi->muxMethodData);
+
+	r535_gsp_acpi_jt(handle, &acpi->jtMethodData);
+	r535_gsp_acpi_caps(handle, &acpi->capsMethodData);
+#endif
+}
+
+static int
+r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	struct nvkm_device_pci *pdev = container_of(device, typeof(*pdev), device);
+	GspSystemInfo *info;
+
+	if (WARN_ON(device->type == NVKM_DEVICE_TEGRA))
+		return -ENOSYS;
+
+	info = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, sizeof(*info));
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	info->gpuPhysAddr = device->func->resource_addr(device, 0);
+	info->gpuPhysFbAddr = device->func->resource_addr(device, 1);
+	info->gpuPhysInstAddr = device->func->resource_addr(device, 3);
+	info->nvDomainBusDeviceFunc = pci_dev_id(pdev->pdev);
+	info->maxUserVa = TASK_SIZE;
+	info->pciConfigMirrorBase = 0x088000;
+	info->pciConfigMirrorSize = 0x001000;
+	r535_gsp_acpi_info(gsp, &info->acpiMethodData);
+
+	return nvkm_gsp_rpc_wr(gsp, info, false);
+}
+
+static int
+r535_gsp_msg_os_error_log(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	rpc_os_error_log_v17_00 *msg = repv;
+
+	if (WARN_ON(repc < sizeof(*msg)))
+		return -EINVAL;
+
+	nvkm_error(subdev, "Xid:%d %s\n", msg->exceptType, msg->errString);
+	return 0;
+}
+
+static int
+r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	rpc_run_cpu_sequencer_v17_00 *seq = repv;
+	int ptr = 0, ret;
+
+	nvkm_debug(subdev, "seq: %08x %08x\n", seq->bufferSizeDWord, seq->cmdIndex);
+
+	while (ptr < seq->cmdIndex) {
+		GSP_SEQUENCER_BUFFER_CMD *cmd = (void *)&seq->commandBuffer[ptr];
+
+		ptr += 1;
+		ptr += GSP_SEQUENCER_PAYLOAD_SIZE_DWORDS(cmd->opCode);
+
+		switch (cmd->opCode) {
+		case GSP_SEQ_BUF_OPCODE_REG_WRITE: {
+			u32 addr = cmd->payload.regWrite.addr;
+			u32 data = cmd->payload.regWrite.val;
+
+			nvkm_trace(subdev, "seq wr32 %06x %08x\n", addr, data);
+			nvkm_wr32(device, addr, data);
+		}
+			break;
+		case GSP_SEQ_BUF_OPCODE_REG_MODIFY: {
+			u32 addr = cmd->payload.regModify.addr;
+			u32 mask = cmd->payload.regModify.mask;
+			u32 data = cmd->payload.regModify.val;
+
+			nvkm_trace(subdev, "seq mask %06x %08x %08x\n", addr, mask, data);
+			nvkm_mask(device, addr, mask, data);
+		}
+			break;
+		case GSP_SEQ_BUF_OPCODE_REG_POLL: {
+			u32 addr = cmd->payload.regPoll.addr;
+			u32 mask = cmd->payload.regPoll.mask;
+			u32 data = cmd->payload.regPoll.val;
+			u32 usec = cmd->payload.regPoll.timeout ?: 4000000;
+			//u32 error = cmd->payload.regPoll.error;
+
+			nvkm_trace(subdev, "seq poll %06x %08x %08x %d\n", addr, mask, data, usec);
+			nvkm_rd32(device, addr);
+			nvkm_usec(device, usec,
+				if ((nvkm_rd32(device, addr) & mask) == data)
+					break;
+			);
+		}
+			break;
+		case GSP_SEQ_BUF_OPCODE_DELAY_US: {
+			u32 usec = cmd->payload.delayUs.val;
+
+			nvkm_trace(subdev, "seq usec %d\n", usec);
+			udelay(usec);
+		}
+			break;
+		case GSP_SEQ_BUF_OPCODE_REG_STORE: {
+			u32 addr = cmd->payload.regStore.addr;
+			u32 slot = cmd->payload.regStore.index;
+
+			seq->regSaveArea[slot] = nvkm_rd32(device, addr);
+			nvkm_trace(subdev, "seq save %08x -> %d: %08x\n", addr, slot,
+				   seq->regSaveArea[slot]);
+		}
+			break;
+		case GSP_SEQ_BUF_OPCODE_CORE_RESET:
+			nvkm_trace(subdev, "seq core reset\n");
+			nvkm_falcon_reset(&gsp->falcon);
+			nvkm_falcon_mask(&gsp->falcon, 0x624, 0x00000080, 0x00000080);
+			nvkm_falcon_wr32(&gsp->falcon, 0x10c, 0x00000000);
+			break;
+		case GSP_SEQ_BUF_OPCODE_CORE_START:
+			nvkm_trace(subdev, "seq core start\n");
+			if (nvkm_falcon_rd32(&gsp->falcon, 0x100) & 0x00000040)
+				nvkm_falcon_wr32(&gsp->falcon, 0x130, 0x00000002);
+			else
+				nvkm_falcon_wr32(&gsp->falcon, 0x100, 0x00000002);
+			break;
+		case GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT:
+			nvkm_trace(subdev, "seq core wait halt\n");
+			nvkm_msec(device, 2000,
+				if (nvkm_falcon_rd32(&gsp->falcon, 0x100) & 0x00000010)
+					break;
+			);
+			break;
+		case GSP_SEQ_BUF_OPCODE_CORE_RESUME: {
+			struct nvkm_sec2 *sec2 = device->sec2;
+			u32 mbox0;
+
+			nvkm_trace(subdev, "seq core resume\n");
+
+			ret = gsp->func->reset(gsp);
+			if (WARN_ON(ret))
+				return ret;
+
+			nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
+			nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
+
+			nvkm_falcon_start(&sec2->falcon);
+
+			if (nvkm_msec(device, 2000,
+				if (nvkm_rd32(device, 0x1180f8) & 0x04000000)
+					break;
+			) < 0)
+				return -ETIMEDOUT;
+
+			mbox0 = nvkm_falcon_rd32(&sec2->falcon, 0x040);
+			if (WARN_ON(mbox0)) {
+				nvkm_error(&gsp->subdev, "seq core resume sec2: 0x%x\n", mbox0);
+				return -EIO;
+			}
+
+			nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
+
+			if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
+				return -EIO;
+		}
+			break;
+		default:
+			nvkm_error(subdev, "unknown sequencer opcode %08x\n", cmd->opCode);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static void
+nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
+{
+	if (mem->data) {
+		dma_free_coherent(gsp->subdev.device->dev, mem->size, mem->data, mem->addr);
+		mem->data = NULL;
+	}
+}
+
+static int
+nvkm_gsp_mem_ctor(struct nvkm_gsp *gsp, u32 size, struct nvkm_gsp_mem *mem)
+{
+	mem->size = size;
+	mem->data = dma_alloc_coherent(gsp->subdev.device->dev, size, &mem->addr, GFP_KERNEL);
+	if (WARN_ON(!mem->data))
+		return -ENOMEM;
+
+	return 0;
+}
+
+
+static int
+r535_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 wpr2_hi;
+	int ret;
+
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	if (!wpr2_hi) {
+		nvkm_debug(subdev, "WPR2 not set - skipping booter unload\n");
+		return 0;
+	}
+
+	ret = nvkm_falcon_fw_boot(&gsp->booter.unload, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
+	if (WARN_ON(ret))
+		return ret;
+
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	if (WARN_ON(wpr2_hi))
+		return -EIO;
+
+	return 0;
+}
+
+static int
+r535_gsp_booter_load(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
+{
+	int ret;
+
+	ret = nvkm_falcon_fw_boot(&gsp->booter.load, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
+	if (ret)
+		return ret;
+
+	nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
+
+	if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
+		return -EIO;
+
+	return 0;
+}
+
+static int
+r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
+{
+	GspFwWprMeta *meta;
+	int ret;
+
+	ret = nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->wpr_meta);
+	if (ret)
+		return ret;
+
+	meta = gsp->wpr_meta.data;
+
+	meta->magic = GSP_FW_WPR_META_MAGIC;
+	meta->revision = GSP_FW_WPR_META_REVISION;
+
+	meta->sysmemAddrOfRadix3Elf = gsp->radix3.mem[0].addr;
+	meta->sizeOfRadix3Elf = gsp->fb.wpr2.elf.size;
+
+	meta->sysmemAddrOfBootloader = gsp->boot.fw.addr;
+	meta->sizeOfBootloader = gsp->boot.fw.size;
+	meta->bootloaderCodeOffset = gsp->boot.code_offset;
+	meta->bootloaderDataOffset = gsp->boot.data_offset;
+	meta->bootloaderManifestOffset = gsp->boot.manifest_offset;
+
+	meta->sysmemAddrOfSignature = gsp->sig.addr;
+	meta->sizeOfSignature = gsp->sig.size;
+
+	meta->gspFwRsvdStart = gsp->fb.heap.addr;
+	meta->nonWprHeapOffset = gsp->fb.heap.addr;
+	meta->nonWprHeapSize = gsp->fb.heap.size;
+	meta->gspFwWprStart = gsp->fb.wpr2.addr;
+	meta->gspFwHeapOffset = gsp->fb.wpr2.heap.addr;
+	meta->gspFwHeapSize = gsp->fb.wpr2.heap.size;
+	meta->gspFwOffset = gsp->fb.wpr2.elf.addr;
+	meta->bootBinOffset = gsp->fb.wpr2.boot.addr;
+	meta->frtsOffset = gsp->fb.wpr2.frts.addr;
+	meta->frtsSize = gsp->fb.wpr2.frts.size;
+	meta->gspFwWprEnd = ALIGN_DOWN(gsp->fb.bios.vga_workspace.addr, 0x20000);
+	meta->fbSize = gsp->fb.size;
+	meta->vgaWorkspaceOffset = gsp->fb.bios.vga_workspace.addr;
+	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
+	meta->bootCount = 0;
+	meta->partitionRpcAddr = 0;
+	meta->partitionRpcRequestOffset = 0;
+	meta->partitionRpcReplyOffset = 0;
+	meta->verified = 0;
+	return 0;
+}
+
+static int
+r535_gsp_shared_init(struct nvkm_gsp *gsp)
+{
+	struct {
+		msgqTxHeader tx;
+		msgqRxHeader rx;
+	} *cmdq, *msgq;
+	int ret, i;
+
+	gsp->shm.cmdq.size = 0x40000;
+	gsp->shm.msgq.size = 0x40000;
+
+	gsp->shm.ptes.nr  = (gsp->shm.cmdq.size + gsp->shm.msgq.size) >> GSP_PAGE_SHIFT;
+	gsp->shm.ptes.nr += DIV_ROUND_UP(gsp->shm.ptes.nr * sizeof(u64), GSP_PAGE_SIZE);
+	gsp->shm.ptes.size = ALIGN(gsp->shm.ptes.nr * sizeof(u64), GSP_PAGE_SIZE);
+
+	ret = nvkm_gsp_mem_ctor(gsp, gsp->shm.ptes.size +
+				     gsp->shm.cmdq.size +
+				     gsp->shm.msgq.size,
+				&gsp->shm.mem);
+	if (ret)
+		return ret;
+
+	gsp->shm.ptes.ptr = gsp->shm.mem.data;
+	gsp->shm.cmdq.ptr = (u8 *)gsp->shm.ptes.ptr + gsp->shm.ptes.size;
+	gsp->shm.msgq.ptr = (u8 *)gsp->shm.cmdq.ptr + gsp->shm.cmdq.size;
+
+	for (i = 0; i < gsp->shm.ptes.nr; i++)
+		gsp->shm.ptes.ptr[i] = gsp->shm.mem.addr + (i << GSP_PAGE_SHIFT);
+
+	cmdq = gsp->shm.cmdq.ptr;
+	cmdq->tx.version = 0;
+	cmdq->tx.size = gsp->shm.cmdq.size;
+	cmdq->tx.entryOff = GSP_PAGE_SIZE;
+	cmdq->tx.msgSize = GSP_PAGE_SIZE;
+	cmdq->tx.msgCount = (cmdq->tx.size - cmdq->tx.entryOff) / cmdq->tx.msgSize;
+	cmdq->tx.writePtr = 0;
+	cmdq->tx.flags = 1;
+	cmdq->tx.rxHdrOff = offsetof(typeof(*cmdq), rx.readPtr);
+
+	msgq = gsp->shm.msgq.ptr;
+
+	gsp->cmdq.cnt = cmdq->tx.msgCount;
+	gsp->cmdq.wptr = &cmdq->tx.writePtr;
+	gsp->cmdq.rptr = &msgq->rx.readPtr;
+	gsp->msgq.cnt = cmdq->tx.msgCount;
+	gsp->msgq.wptr = &msgq->tx.writePtr;
+	gsp->msgq.rptr = &cmdq->rx.readPtr;
+	return 0;
+}
+
+static int
+r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
+{
+	GSP_ARGUMENTS_CACHED *args;
+	int ret;
+
+	if (!resume) {
+		ret = r535_gsp_shared_init(gsp);
+		if (ret)
+			return ret;
+
+		ret = nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->rmargs);
+		if (ret)
+			return ret;
+	}
+
+	args = gsp->rmargs.data;
+	args->messageQueueInitArguments.sharedMemPhysAddr = gsp->shm.mem.addr;
+	args->messageQueueInitArguments.pageTableEntryCount = gsp->shm.ptes.nr;
+	args->messageQueueInitArguments.cmdQueueOffset =
+		(u8 *)gsp->shm.cmdq.ptr - (u8 *)gsp->shm.mem.data;
+	args->messageQueueInitArguments.statQueueOffset =
+		(u8 *)gsp->shm.msgq.ptr - (u8 *)gsp->shm.mem.data;
+
+	if (!resume) {
+		args->srInitArguments.oldLevel = 0;
+		args->srInitArguments.flags = 0;
+		args->srInitArguments.bInPMTransition = 0;
+	} else {
+		args->srInitArguments.oldLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
+		args->srInitArguments.flags = 0;
+		args->srInitArguments.bInPMTransition = 1;
+	}
+
+	return 0;
+}
+
+static inline u64
+r535_gsp_libos_id8(const char *name)
+{
+	u64 id = 0;
+
+	for (int i = 0; i < sizeof(id) && *name; i++, name++)
+		id = (id << 8) | *name;
+
+	return id;
+}
+
+static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
+{
+	unsigned int num_pages = DIV_ROUND_UP_ULL(size, GSP_PAGE_SIZE);
+	unsigned int i;
+
+	for (i = 0; i < num_pages; i++)
+		ptes[i] = (u64)addr + (i << GSP_PAGE_SHIFT);
+}
+
+static int
+r535_gsp_libos_init(struct nvkm_gsp *gsp)
+{
+	LibosMemoryRegionInitArgument *args;
+	int ret;
+
+	ret = nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->libos);
+	if (ret)
+		return ret;
+
+	args = gsp->libos.data;
+
+	ret = nvkm_gsp_mem_ctor(gsp, 0x10000, &gsp->loginit);
+	if (ret)
+		return ret;
+
+	args[0].id8  = r535_gsp_libos_id8("LOGINIT");
+	args[0].pa   = gsp->loginit.addr;
+	args[0].size = gsp->loginit.size;
+	args[0].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
+	args[0].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+	create_pte_array(gsp->loginit.data + sizeof(u64), gsp->loginit.addr, gsp->loginit.size);
+
+	ret = nvkm_gsp_mem_ctor(gsp, 0x10000, &gsp->logintr);
+	if (ret)
+		return ret;
+
+	args[1].id8  = r535_gsp_libos_id8("LOGINTR");
+	args[1].pa   = gsp->logintr.addr;
+	args[1].size = gsp->logintr.size;
+	args[1].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
+	args[1].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+	create_pte_array(gsp->logintr.data + sizeof(u64), gsp->logintr.addr, gsp->logintr.size);
+
+	ret = nvkm_gsp_mem_ctor(gsp, 0x10000, &gsp->logrm);
+	if (ret)
+		return ret;
+
+	args[2].id8  = r535_gsp_libos_id8("LOGRM");
+	args[2].pa   = gsp->logrm.addr;
+	args[2].size = gsp->logrm.size;
+	args[2].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
+	args[2].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+	create_pte_array(gsp->logrm.data + sizeof(u64), gsp->logrm.addr, gsp->logrm.size);
+
+	ret = r535_gsp_rmargs_init(gsp, false);
+	if (ret)
+		return ret;
+
+	args[3].id8  = r535_gsp_libos_id8("RMARGS");
+	args[3].pa   = gsp->rmargs.addr;
+	args[3].size = gsp->rmargs.size;
+	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
+	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+	return 0;
+}
+
+void
+nvkm_gsp_sg_free(struct nvkm_device *device, struct sg_table *sgt)
+{
+	struct scatterlist *sgl;
+	int i;
+
+	dma_unmap_sgtable(device->dev, sgt, DMA_BIDIRECTIONAL, 0);
+
+	for_each_sgtable_sg(sgt, sgl, i) {
+		struct page *page = sg_page(sgl);
+
+		__free_page(page);
+	}
+
+	sg_free_table(sgt);
+}
+
+int
+nvkm_gsp_sg(struct nvkm_device *device, u64 size, struct sg_table *sgt)
+{
+	const u64 pages = DIV_ROUND_UP(size, PAGE_SIZE);
+	struct scatterlist *sgl;
+	int ret, i;
+
+	ret = sg_alloc_table(sgt, pages, GFP_KERNEL);
+	if (ret)
+		return ret;
+
+	for_each_sgtable_sg(sgt, sgl, i) {
+		struct page *page = alloc_page(GFP_KERNEL);
+
+		if (!page) {
+			nvkm_gsp_sg_free(device, sgt);
+			return -ENOMEM;
+		}
+
+		sg_set_page(sgl, page, PAGE_SIZE, 0);
+	}
+
+	ret = dma_map_sgtable(device->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	if (ret)
+		nvkm_gsp_sg_free(device, sgt);
+
+	return ret;
+}
+
+static void
+nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
+{
+	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--)
+		nvkm_gsp_mem_dtor(gsp, &rx3->mem[i]);
+}
+
+static int
+nvkm_gsp_radix3_sg(struct nvkm_device *device, struct sg_table *sgt, u64 size,
+		   struct nvkm_gsp_radix3 *rx3)
+{
+	u64 addr;
+
+	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--) {
+		u64 *ptes;
+		int idx;
+
+		rx3->mem[i].size = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
+		rx3->mem[i].data = dma_alloc_coherent(device->dev, rx3->mem[i].size,
+						      &rx3->mem[i].addr, GFP_KERNEL);
+		if (WARN_ON(!rx3->mem[i].data))
+			return -ENOMEM;
+
+		ptes = rx3->mem[i].data;
+		if (i == 2) {
+			struct scatterlist *sgl;
+
+			for_each_sgtable_dma_sg(sgt, sgl, idx) {
+				for (int j = 0; j < sg_dma_len(sgl) / GSP_PAGE_SIZE; j++)
+					*ptes++ = sg_dma_address(sgl) + (GSP_PAGE_SIZE * j);
+			}
+		} else {
+			for (int j = 0; j < size / GSP_PAGE_SIZE; j++)
+				*ptes++ = addr + GSP_PAGE_SIZE * j;
+		}
+
+		size = rx3->mem[i].size;
+		addr = rx3->mem[i].addr;
+	}
+
+	return 0;
+}
+
+int
+r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+{
+	u32 mbox0 = 0xff, mbox1 = 0xff;
+	int ret;
+
+	if (!gsp->running)
+		return 0;
+
+	if (suspend) {
+		GspFwWprMeta *meta = gsp->wpr_meta.data;
+		u64 len = meta->gspFwWprEnd - meta->gspFwWprStart;
+		GspFwSRMeta *sr;
+
+		ret = nvkm_gsp_sg(gsp->subdev.device, len, &gsp->sr.sgt);
+		if (ret)
+			return ret;
+
+		ret = nvkm_gsp_radix3_sg(gsp->subdev.device, &gsp->sr.sgt, len, &gsp->sr.radix3);
+		if (ret)
+			return ret;
+
+		ret = nvkm_gsp_mem_ctor(gsp, sizeof(*sr), &gsp->sr.meta);
+		if (ret)
+			return ret;
+
+		sr = gsp->sr.meta.data;
+		sr->magic = GSP_FW_SR_META_MAGIC;
+		sr->revision = GSP_FW_SR_META_REVISION;
+		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.mem[0].addr;
+		sr->sizeOfSuspendResumeData = len;
+
+		mbox0 = lower_32_bits(gsp->sr.meta.addr);
+		mbox1 = upper_32_bits(gsp->sr.meta.addr);
+	}
+
+	ret = r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
+	if (WARN_ON(ret))
+		return ret;
+
+	nvkm_msec(gsp->subdev.device, 2000,
+		if (nvkm_falcon_rd32(&gsp->falcon, 0x040) & 0x80000000)
+			break;
+	);
+
+	nvkm_falcon_reset(&gsp->falcon);
+
+	ret = nvkm_gsp_fwsec_sb(gsp);
+	WARN_ON(ret);
+
+	ret = r535_gsp_booter_unload(gsp, mbox0, mbox1);
+	WARN_ON(ret);
+
+	gsp->running = false;
+	return 0;
+}
+
+int
+r535_gsp_init(struct nvkm_gsp *gsp)
+{
+	u32 mbox0, mbox1;
+	int ret;
+
+	if (!gsp->sr.meta.data) {
+		mbox0 = lower_32_bits(gsp->wpr_meta.addr);
+		mbox1 = upper_32_bits(gsp->wpr_meta.addr);
+	} else {
+		r535_gsp_rmargs_init(gsp, true);
+
+		mbox0 = lower_32_bits(gsp->sr.meta.addr);
+		mbox1 = upper_32_bits(gsp->sr.meta.addr);
+	}
+
+	/* Execute booter to handle (eventually...) booting GSP-RM. */
+	ret = r535_gsp_booter_load(gsp, mbox0, mbox1);
+	if (WARN_ON(ret))
+		goto done;
+
+	ret = r535_gsp_rpc_poll(gsp, NV_VGPU_MSG_EVENT_GSP_INIT_DONE);
+	if (ret)
+		goto done;
+
+	gsp->running = true;
+
+done:
+	if (gsp->sr.meta.data) {
+		nvkm_gsp_mem_dtor(gsp, &gsp->sr.meta);
+		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
+		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
+	}
+
+	return ret;
+}
+
+static int
+r535_gsp_rm_boot_ctor(struct nvkm_gsp *gsp)
+{
+	const struct firmware *fw = gsp->fws.bl;
+	const struct nvfw_bin_hdr *hdr;
+	RM_RISCV_UCODE_DESC *desc;
+	int ret;
+
+	hdr = nvfw_bin_hdr(&gsp->subdev, fw->data);
+	desc = (void *)fw->data + hdr->header_offset;
+
+	ret = nvkm_gsp_mem_ctor(gsp, hdr->data_size, &gsp->boot.fw);
+	if (ret)
+		return ret;
+
+	memcpy(gsp->boot.fw.data, fw->data + hdr->data_offset, hdr->data_size);
+
+	gsp->boot.code_offset = desc->monitorCodeOffset;
+	gsp->boot.data_offset = desc->monitorDataOffset;
+	gsp->boot.manifest_offset = desc->manifestOffset;
+	gsp->boot.app_version = desc->appVersion;
+	return 0;
+}
+
+static const struct nvkm_firmware_func
+r535_gsp_fw = {
+	.type = NVKM_FIRMWARE_IMG_SGT,
+};
+
+static int
+r535_gsp_elf_section(struct nvkm_gsp *gsp, const char *name, const u8 **pdata, u64 *psize)
+{
+	const u8 *img = gsp->fws.rm->data;
+	const struct elf64_hdr *ehdr = (const struct elf64_hdr *)img;
+	const struct elf64_shdr *shdr = (const struct elf64_shdr *)&img[ehdr->e_shoff];
+	const char *names = &img[shdr[ehdr->e_shstrndx].sh_offset];
+
+	for (int i = 0; i < ehdr->e_shnum; i++, shdr++) {
+		if (!strcmp(&names[shdr->sh_name], name)) {
+			*pdata = &img[shdr->sh_offset];
+			*psize = shdr->sh_size;
+			return 0;
+		}
+	}
+
+	nvkm_error(&gsp->subdev, "section '%s' not found\n", name);
+	return -ENOENT;
+}
+
+static void
+r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
+{
+	nvkm_firmware_put(gsp->fws.bl);
+	gsp->fws.bl = NULL;
+	nvkm_firmware_put(gsp->fws.booter.unload);
+	gsp->fws.booter.unload = NULL;
+	nvkm_firmware_put(gsp->fws.booter.load);
+	gsp->fws.booter.load = NULL;
+	nvkm_firmware_put(gsp->fws.rm);
+	gsp->fws.rm = NULL;
+}
+
+void
+r535_gsp_dtor(struct nvkm_gsp *gsp)
+{
+	nvkm_gsp_radix3_dtor(gsp, &gsp->radix3);
+	nvkm_gsp_mem_dtor(gsp, &gsp->sig);
+	nvkm_firmware_dtor(&gsp->fw);
+
+	nvkm_falcon_fw_dtor(&gsp->booter.unload);
+	nvkm_falcon_fw_dtor(&gsp->booter.load);
+
+	mutex_destroy(&gsp->msgq.mutex);
+	mutex_destroy(&gsp->cmdq.mutex);
+
+	r535_gsp_dtor_fws(gsp);
+}
+
+int
+r535_gsp_oneinit(struct nvkm_gsp *gsp)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	const u8 *data;
+	u64 size;
+	int ret;
+
+	mutex_init(&gsp->cmdq.mutex);
+	mutex_init(&gsp->msgq.mutex);
+
+	ret = gsp->func->booter.ctor(gsp, "booter-load", gsp->fws.booter.load,
+				     &device->sec2->falcon, &gsp->booter.load);
+	if (ret)
+		return ret;
+
+	ret = gsp->func->booter.ctor(gsp, "booter-unload", gsp->fws.booter.unload,
+				     &device->sec2->falcon, &gsp->booter.unload);
+	if (ret)
+		return ret;
+
+	/* Load GSP firmware from ELF image into DMA-accessible memory. */
+	ret = r535_gsp_elf_section(gsp, ".fwimage", &data, &size);
+	if (ret)
+		return ret;
+
+	ret = nvkm_firmware_ctor(&r535_gsp_fw, "gsp-rm", device, data, size, &gsp->fw);
+	if (ret)
+		return ret;
+
+	/* Load relevant signature from ELF image. */
+	ret = r535_gsp_elf_section(gsp, gsp->func->sig_section, &data, &size);
+	if (ret)
+		return ret;
+
+	ret = nvkm_gsp_mem_ctor(gsp, ALIGN(size, 256), &gsp->sig);
+	if (ret)
+		return ret;
+
+	memcpy(gsp->sig.data, data, size);
+
+	/* Build radix3 page table for ELF image. */
+	ret = nvkm_gsp_radix3_sg(device, &gsp->fw.mem.sgt, gsp->fw.len, &gsp->radix3);
+	if (ret)
+		return ret;
+
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
+			      r535_gsp_msg_run_cpu_sequencer, gsp);
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);
+
+	ret = r535_gsp_rm_boot_ctor(gsp);
+	if (ret)
+		return ret;
+
+	/* Release FW images - we've copied them to DMA buffers now. */
+	r535_gsp_dtor_fws(gsp);
+
+	/* Calculate FB layout. */
+	gsp->fb.wpr2.frts.size = 0x100000;
+	gsp->fb.wpr2.frts.addr = ALIGN_DOWN(gsp->fb.bios.addr, 0x20000) - gsp->fb.wpr2.frts.size;
+
+	gsp->fb.wpr2.boot.size = gsp->boot.fw.size;
+	gsp->fb.wpr2.boot.addr = ALIGN_DOWN(gsp->fb.wpr2.frts.addr - gsp->fb.wpr2.boot.size, 0x1000);
+
+	gsp->fb.wpr2.elf.size = gsp->fw.len;
+	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size, 0x10000);
+
+	{
+		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
+
+		gsp->fb.wpr2.heap.size =
+			gsp->func->wpr_heap.os_carveout_size +
+			gsp->func->wpr_heap.base_size +
+			ALIGN(GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB * fb_size_gb, 1 << 20) +
+			ALIGN(GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE, 1 << 20);
+
+		gsp->fb.wpr2.heap.size = max(gsp->fb.wpr2.heap.size, gsp->func->wpr_heap.min_size);
+	}
+
+	gsp->fb.wpr2.heap.addr = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.size, 0x100000);
+	gsp->fb.wpr2.heap.size = ALIGN_DOWN(gsp->fb.wpr2.elf.addr - gsp->fb.wpr2.heap.addr, 0x100000);
+
+	gsp->fb.wpr2.addr = ALIGN_DOWN(gsp->fb.wpr2.heap.addr - sizeof(GspFwWprMeta), 0x100000);
+	gsp->fb.wpr2.size = gsp->fb.wpr2.frts.addr + gsp->fb.wpr2.frts.size - gsp->fb.wpr2.addr;
+
+	gsp->fb.heap.size = 0x100000;
+	gsp->fb.heap.addr = gsp->fb.wpr2.addr - gsp->fb.heap.size;
+
+	ret = nvkm_gsp_fwsec_frts(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = r535_gsp_libos_init(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = r535_gsp_wpr_meta_init(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = r535_gsp_rpc_set_system_info(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = r535_gsp_rpc_set_registry(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	/* Reset GSP into RISC-V mode. */
+	ret = gsp->func->reset(gsp);
+	if (WARN_ON(ret))
+		return ret;
+
+	nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
+	nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
+	return 0;
+}
+
+static int
+r535_gsp_load_fw(struct nvkm_gsp *gsp, const char *name, const char *ver,
+		 const struct firmware **pfw)
+{
+	char fwname[64];
+
+	snprintf(fwname, sizeof(fwname), "gsp/%s-%s", name, ver);
+	return nvkm_firmware_get(&gsp->subdev, fwname, 0, pfw);
+}
+
+int
+r535_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	int ret;
+
+	if (!nvkm_boolopt(subdev->device->cfgopt, "NvGspRm", fwif->enable))
+		return -EINVAL;
+
+	if ((ret = r535_gsp_load_fw(gsp, "gsp", fwif->ver, &gsp->fws.rm)) ||
+	    (ret = r535_gsp_load_fw(gsp, "booter_load", fwif->ver, &gsp->fws.booter.load)) ||
+	    (ret = r535_gsp_load_fw(gsp, "booter_unload", fwif->ver, &gsp->fws.booter.unload)) ||
+	    (ret = r535_gsp_load_fw(gsp, "bootloader", fwif->ver, &gsp->fws.bl))) {
+		r535_gsp_dtor_fws(gsp);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define NVKM_GSP_FIRMWARE(chip)                                  \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-535.54.03.bin");   \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-535.54.03.bin"); \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/bootloader-535.54.03.bin");    \
+MODULE_FIRMWARE("nvidia/"#chip"/gsp/gsp-535.54.03.bin")
+
+NVKM_GSP_FIRMWARE(tu102);
+NVKM_GSP_FIRMWARE(tu104);
+NVKM_GSP_FIRMWARE(tu106);
+
+NVKM_GSP_FIRMWARE(tu116);
+NVKM_GSP_FIRMWARE(tu117);
+
+NVKM_GSP_FIRMWARE(ga100);
+
+NVKM_GSP_FIRMWARE(ga102);
+NVKM_GSP_FIRMWARE(ga103);
+NVKM_GSP_FIRMWARE(ga104);
+NVKM_GSP_FIRMWARE(ga106);
+NVKM_GSP_FIRMWARE(ga107);
+
+NVKM_GSP_FIRMWARE(ad102);
+NVKM_GSP_FIRMWARE(ad103);
+NVKM_GSP_FIRMWARE(ad104);
+NVKM_GSP_FIRMWARE(ad106);
+NVKM_GSP_FIRMWARE(ad107);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index be3c4deafaaa..b9b0e5989bd3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -21,8 +21,170 @@
  */
 #include "priv.h"
 
+#include <subdev/fb.h>
+
+#include <nvfw/flcn.h>
+#include <nvfw/fw.h>
+#include <nvfw/hs.h>
+
+int
+tu102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmware *blob,
+		      struct nvkm_falcon *falcon, struct nvkm_falcon_fw *fw)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	const struct nvkm_falcon_fw_func *func = &gm200_flcn_fw;
+	const struct nvfw_bin_hdr *hdr;
+	const struct nvfw_hs_header_v2 *hshdr;
+	const struct nvfw_hs_load_header_v2 *lhdr;
+	u32 loc, sig, cnt;
+	int ret;
+
+	hdr = nvfw_bin_hdr(subdev, blob->data);
+	hshdr = nvfw_hs_header_v2(subdev, blob->data + hdr->header_offset);
+	loc = *(u32 *)(blob->data + hshdr->patch_loc);
+	sig = *(u32 *)(blob->data + hshdr->patch_sig);
+	cnt = *(u32 *)(blob->data + hshdr->num_sig);
+
+	ret = nvkm_falcon_fw_ctor(func, name, subdev->device, true,
+				  blob->data + hdr->data_offset, hdr->data_size, falcon, fw);
+	if (ret)
+		goto done;
+
+	ret = nvkm_falcon_fw_sign(fw, loc, hshdr->sig_prod_size / cnt, blob->data,
+				  cnt, hshdr->sig_prod_offset + sig, 0, 0);
+	if (ret)
+		goto done;
+
+	lhdr = nvfw_hs_load_header_v2(subdev, blob->data + hshdr->header_offset);
+
+	fw->nmem_base_img = 0;
+	fw->nmem_base = lhdr->os_code_offset;
+	fw->nmem_size = lhdr->os_code_size;
+	fw->imem_base_img = fw->nmem_size;
+	fw->imem_base = lhdr->app[0].offset;
+	fw->imem_size = lhdr->app[0].size;
+	fw->dmem_base_img = lhdr->os_data_offset;
+	fw->dmem_base = 0;
+	fw->dmem_size = lhdr->os_data_size;
+	fw->dmem_sign = loc - fw->dmem_base_img;
+	fw->boot_addr = lhdr->os_code_offset;
+
+done:
+	if (ret)
+		nvkm_falcon_fw_dtor(fw);
+
+	return ret;
+}
+
+static int
+tu102_gsp_fwsec_load_bld(struct nvkm_falcon_fw *fw)
+{
+	struct flcn_bl_dmem_desc_v2 desc = {
+		.ctx_dma = FALCON_DMAIDX_PHYS_SYS_NCOH,
+		.code_dma_base = fw->fw.phys,
+		.non_sec_code_off = fw->nmem_base,
+		.non_sec_code_size = fw->nmem_size,
+		.sec_code_off = fw->imem_base,
+		.sec_code_size = fw->imem_size,
+		.code_entry_point = 0,
+		.data_dma_base = fw->fw.phys + fw->dmem_base_img,
+		.data_size = fw->dmem_size,
+		.argc = 0,
+		.argv = 0,
+	};
+
+	flcn_bl_dmem_desc_v2_dump(fw->falcon->user, &desc);
+
+	nvkm_falcon_mask(fw->falcon, 0x600 + desc.ctx_dma * 4, 0x00000007, 0x00000005);
+
+	return nvkm_falcon_pio_wr(fw->falcon, (u8 *)&desc, 0, 0, DMEM, 0, sizeof(desc), 0, 0);
+}
+
+const struct nvkm_falcon_fw_func
+tu102_gsp_fwsec = {
+	.reset = gm200_flcn_fw_reset,
+	.load = gm200_flcn_fw_load,
+	.load_bld = tu102_gsp_fwsec_load_bld,
+	.boot = gm200_flcn_fw_boot,
+};
+
+int
+tu102_gsp_reset(struct nvkm_gsp *gsp)
+{
+	return gsp->falcon.func->reset_eng(&gsp->falcon);
+}
+
+static u64
+tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	const u64 base = fb_size - 0x100000;
+	u64 addr = 0;
+
+	if (device->disp)
+		addr = nvkm_rd32(gsp->subdev.device, 0x625f04);
+	if (!(addr & 0x00000008))
+		return base;
+
+	addr = (addr & 0xffffff00) << 8;
+	if (addr < base)
+		return fb_size - 0x20000;
+
+	return addr;
+}
+
+int
+tu102_gsp_oneinit(struct nvkm_gsp *gsp)
+{
+	gsp->fb.size = nvkm_fb_vidmem_size(gsp->subdev.device);
+
+	gsp->fb.bios.vga_workspace.addr = tu102_gsp_vga_workspace_addr(gsp, gsp->fb.size);
+	gsp->fb.bios.vga_workspace.size = gsp->fb.size - gsp->fb.bios.vga_workspace.addr;
+	gsp->fb.bios.addr = gsp->fb.bios.vga_workspace.addr;
+	gsp->fb.bios.size = gsp->fb.bios.vga_workspace.size;
+
+	return r535_gsp_oneinit(gsp);
+}
+
+const struct nvkm_falcon_func
+tu102_gsp_flcn = {
+	.disable = gm200_flcn_disable,
+	.enable = gm200_flcn_enable,
+	.addr2 = 0x1000,
+	.reset_eng = gp102_flcn_reset_eng,
+	.reset_wait_mem_scrubbing = gm200_flcn_reset_wait_mem_scrubbing,
+	.bind_inst = gm200_flcn_bind_inst,
+	.bind_stat = gm200_flcn_bind_stat,
+	.bind_intr = true,
+	.imem_pio = &gm200_flcn_imem_pio,
+	.dmem_pio = &gm200_flcn_dmem_pio,
+	.riscv_active = tu102_flcn_riscv_active,
+};
+
+static const struct nvkm_gsp_func
+tu102_gsp_r535_54_03 = {
+	.flcn = &tu102_gsp_flcn,
+	.fwsec = &tu102_gsp_fwsec,
+
+	.sig_section = ".fwsignature_tu10x",
+
+	.wpr_heap.base_size = 8 << 20,
+	.wpr_heap.min_size = 64 << 20,
+
+	.booter.ctor = tu102_gsp_booter_ctor,
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = tu102_gsp_oneinit,
+	.init = r535_gsp_init,
+	.fini = r535_gsp_fini,
+	.reset = tu102_gsp_reset,
+
+	.rm = &r535_gsp_rm,
+};
+
 static struct nvkm_gsp_fwif
 tu102_gsps[] = {
+	{  0,  r535_gsp_load, &tu102_gsp_r535_54_03, "535.54.03" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index d4a94c115b1b..e9f0605abbfd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -21,8 +21,30 @@
  */
 #include "priv.h"
 
+static const struct nvkm_gsp_func
+tu116_gsp_r535_54_03 = {
+	.flcn = &tu102_gsp_flcn,
+	.fwsec = &tu102_gsp_fwsec,
+
+	.sig_section = ".fwsignature_tu11x",
+
+	.wpr_heap.base_size = 8 << 20,
+	.wpr_heap.min_size = 64 << 20,
+
+	.booter.ctor = tu102_gsp_booter_ctor,
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = tu102_gsp_oneinit,
+	.init = r535_gsp_init,
+	.fini = r535_gsp_fini,
+	.reset = tu102_gsp_reset,
+
+	.rm = &r535_gsp_rm,
+};
+
 static struct nvkm_gsp_fwif
 tu116_gsps[] = {
+	{  0,  r535_gsp_load, &tu116_gsp_r535_54_03, "535.54.03" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
-- 
2.41.0

