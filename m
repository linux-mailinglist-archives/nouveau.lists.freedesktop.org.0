Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC787A5403
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B5E10E331;
	Mon, 18 Sep 2023 20:23:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A23610E32D
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:37 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68fbd31d9deso4529513b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068616; x=1695673416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=icfFkqmMOMqHF+idaW8zFkVPH27ySXUI7mMzO5HUY3E=;
 b=f88e3uOdHblApJa6bLfSdv3VODxnvzy4QAjPTCGzHBsFbCCvpYBC8li3b/TW2szUAO
 BOdH6dr4Ks/RcIgh0lS/yG3nlGk2ayQNYCYe2cj8O0XZY4EeWDZGBGUgOU1pKQT+Aqyr
 HDsADvII/UUb3kaq7ZqPjU1jQYJOK3QfrXTJUQJpb6XpHDJd0oxeYdExulsz4urP4xik
 iERcJmitK30h0GWlOQMkc79QTVZw88OhGpY9ksDd/Js+tgQAfTzKYqq6CZJ5Z+p+yN3g
 d74bl4YTkPUKeK1VLCT0bpIO47PZlEti8l+TXLGtHrqLYlkHHMoDMhVWixx/+whRsYV1
 DvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068616; x=1695673416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=icfFkqmMOMqHF+idaW8zFkVPH27ySXUI7mMzO5HUY3E=;
 b=fLpeAkCG4UqxyxuzzHTlprSeFnjsCct5ARXh1kiekzFtURbpATFFB7lvPLgJ8UHVb7
 JXqLm7v9WBZIdi/fZeIvZiqkSo6p4Y3b0g/qDp+a7rflzIuaeOOaPPSPCASuEK0wvkm4
 gD0/pJbiAsknriOd/LksulmzHFemROtgMpHzuLoyFCWDUrymmZU+nqKfK/veEFEYlxEW
 SxcDIyIZ1EOV5DpVXDNX/NzFNMK12h2CuUKHdY6sI4MzHkm1gECJdyeWNewMZQoZwHcv
 E6W4I4Cd6BxMlHzHedIF6PQPRceLNi+BJfOp596QmKYWWlEMbkhRjcRc+x0CAOIgUnB5
 PKiA==
X-Gm-Message-State: AOJu0YyDYhl/fNFN30iUrcK8XgnBvu5xUMbx3ESqHm9b0dAXI7Hqf/qz
 aN0C5gv67nZ5b6tmqNiUpF2ysTRjkjI=
X-Google-Smtp-Source: AGHT+IGUDCiSIhI6yDTa14iPxMQgi93ybKDYm7ta7mQrghKxjrdYyNPWRkf2mp5B5bqHwfp/KKPPhg==
X-Received: by 2002:a05:6a00:22d0:b0:690:4362:7011 with SMTP id
 f16-20020a056a0022d000b0069043627011mr10196420pfj.24.1695068616052; 
 Mon, 18 Sep 2023 13:23:36 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:35 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:46 +1000
Message-ID: <20230918202149.4343-42-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 41/44] drm/nouveau/nvdec/r535: initial support
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

Adds support for allocating VIDEO_DECODER classes from RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   5 +
 .../drm/nouveau/include/nvkm/engine/nvdec.h   |   2 +
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |  16 +++
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |   7 ++
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |   6 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   6 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   |  91 ++++++++++++++-
 .../gpu/drm/nouveau/nvkm/engine/fifo/runl.h   |   5 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild  |   4 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c |  44 +++++++
 .../gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c |  14 ++-
 .../gpu/drm/nouveau/nvkm/engine/nvdec/priv.h  |   5 +
 .../gpu/drm/nouveau/nvkm/engine/nvdec/r535.c  | 110 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c |  12 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |   4 +
 16 files changed, 370 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 550e96db41a0..17a8867648b9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -198,6 +198,11 @@
 
 #define NV74_BSP                                                     0x000074b0
 
+#define NVC4B0_VIDEO_DECODER                                         0x0000c4b0
+#define NVC6B0_VIDEO_DECODER                                         0x0000c6b0
+#define NVC7B0_VIDEO_DECODER                                         0x0000c7b0
+#define NVC9B0_VIDEO_DECODER                                         0x0000c9b0
+
 #define GT212_MSVLD                                                  0x000085b1
 #define IGT21A_MSVLD                                                 0x000086b1
 #define G98_MSVLD                                                    0x000088b1
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
index ca83caa55157..8d2e170883e1 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/nvdec.h
@@ -13,5 +13,7 @@ struct nvkm_nvdec {
 
 int gm107_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 int tu102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
+int ga100_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 int ga102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
+int ad102_nvdec_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_nvdec **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
index 25994b299c82..cfe53c7cb4ce 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
@@ -57,6 +57,22 @@ typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS {
 
 #define NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO (0x20800a32) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO_PARAMS_MESSAGE_ID" */
 
+typedef struct NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO {
+    NvU32 engDesc;
+    NvU32 ctxAttr;
+    NvU32 ctxBufferSize;
+    NvU32 addrSpaceList;
+    NvU32 registerBase;
+} NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO;
+#define NV2080_CTRL_CMD_INTERNAL_MAX_CONSTRUCTED_FALCONS     0x40
+
+#define NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO (0x20800a42) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS {
+    NvU32                                        numConstructedFalcons;
+    NV2080_CTRL_INTERNAL_CONSTRUCTED_FALCON_INFO constructedFalconsTable[NV2080_CTRL_CMD_INTERNAL_MAX_CONSTRUCTED_FALCONS];
+} NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS;
+
 #define NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM (0x20800a49) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS_MESSAGE_ID" */
 
 typedef struct NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS {
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
index e17e48d30a14..5c1cad9bc5db 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
@@ -105,6 +105,13 @@ typedef struct
     NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of control region for PIO channel
 } NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS;
 
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;
+    NvU32 engineInstance;               // Select NVDEC0 or NVDEC1 or NVDEC2
+} NV_BSP_ALLOCATION_PARAMETERS;
+
 typedef struct
 {
     NvU32   index;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
index 6cef62a0698d..b5cc77ab05a3 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -34,6 +34,12 @@
 
 #define MC_ENGINE_IDX_GSP                           49
 
+#define MC_ENGINE_IDX_BSP                           64
+#define MC_ENGINE_IDX_NVDEC                         MC_ENGINE_IDX_BSP
+#define MC_ENGINE_IDX_NVDEC0                        MC_ENGINE_IDX_NVDEC
+
+#define MC_ENGINE_IDX_NVDEC7                        71
+
 #define MC_ENGINE_IDX_GR                            82
 #define MC_ENGINE_IDX_GR0                           MC_ENGINE_IDX_GR
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 8cd57e0e7333..cc54cb3365d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2592,6 +2592,7 @@ nv170_chipset = {
 	.vfn      = { 0x00000001, ga100_vfn_new },
 	.ce       = { 0x000003ff, ga100_ce_new },
 	.fifo     = { 0x00000001, ga100_fifo_new },
+	.nvdec    = { 0x0000001f, ga100_nvdec_new },
 };
 
 static const struct nvkm_device_chip
@@ -2763,6 +2764,7 @@ nv192_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
+	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2785,6 +2787,7 @@ nv193_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
+	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2807,6 +2810,7 @@ nv194_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
+	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2829,6 +2833,7 @@ nv196_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
+	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2851,6 +2856,7 @@ nv197_chipset = {
 	.dma      = { 0x00000001, gv100_dma_new },
 	.fifo     = { 0x00000001, ga102_fifo_new },
 	.gr       = { 0x00000001, ad102_gr_new },
+	.nvdec    = { 0x0000000f, ad102_nvdec_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index 82303e4c5c2e..553658a20025 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -38,6 +38,8 @@
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h>
 #include <nvrm/535.54.03/nvidia/generated/g_kernel_channel_nvoc.h>
 #include <nvrm/535.54.03/nvidia/generated/g_kernel_fifo_nvoc.h>
@@ -378,6 +380,58 @@ r535_gr = {
 	.ctor2 = r535_gr_ctor,
 };
 
+static int
+r535_flcn_bind(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *chan)
+{
+	struct nvkm_gsp_client *client = &chan->vmm->rm.client;
+	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&chan->vmm->rm.device.subdevice,
+				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->hClient = client->object.handle;
+	ctrl->hObject = chan->rm.object.handle;
+	ctrl->hChanClient = client->object.handle;
+	ctrl->virtAddress = vctx->vma->addr;
+	ctrl->size = vctx->inst->size;
+	ctrl->engineType = engn->id;
+	ctrl->ChID = chan->id;
+
+	return nvkm_gsp_rm_ctrl_wr(&chan->vmm->rm.device.subdevice, ctrl);
+}
+
+static int
+r535_flcn_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *chan)
+{
+	int ret;
+
+	if (WARN_ON(!engn->rm.size))
+		return -EINVAL;
+
+	ret = nvkm_gpuobj_new(engn->engine->subdev.device, engn->rm.size, 0, true, NULL,
+			      &vctx->inst);
+	if (ret)
+		return ret;
+
+	ret = nvkm_vmm_get(vctx->vmm, 12, vctx->inst->size, &vctx->vma);
+	if (ret)
+		return ret;
+
+	ret = nvkm_memory_map(vctx->inst, 0, vctx->vmm, vctx->vma, NULL, 0);
+	if (ret)
+		return ret;
+
+	return r535_flcn_bind(engn, vctx, chan);
+}
+
+static const struct nvkm_engn_func
+r535_flcn = {
+	.nonstall = r535_engn_nonstall,
+	.ctor2 = r535_flcn_ctor,
+};
+
 static void
 r535_runl_allow(struct nvkm_runl *runl, u32 engm)
 {
@@ -447,6 +501,36 @@ r535_fifo_engn_type(RM_ENGINE_TYPE rm, enum nvkm_subdev_type *ptype)
 	}
 }
 
+static int
+r535_fifo_ectx_size(struct nvkm_fifo *fifo)
+{
+	NV2080_CTRL_INTERNAL_GET_CONSTRUCTED_FALCON_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = fifo->engine.subdev.device->gsp;
+	struct nvkm_runl *runl;
+	struct nvkm_engn *engn;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO,
+				   sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
+
+	for (int i = 0; i < ctrl->numConstructedFalcons; i++) {
+		nvkm_runl_foreach(runl, fifo) {
+			nvkm_runl_foreach_engn(engn, runl) {
+				if (engn->rm.desc == ctrl->constructedFalconsTable[i].engDesc) {
+					engn->rm.size =
+						ctrl->constructedFalconsTable[i].ctxBufferSize;
+					break;
+				}
+			}
+		}
+	}
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
 static int
 r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 {
@@ -511,6 +595,9 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		case NVKM_ENGINE_GR:
 			engn = nvkm_runl_add(runl, nv2080, &r535_gr, type, inst);
 			break;
+		case NVKM_ENGINE_NVDEC:
+			engn = nvkm_runl_add(runl, nv2080, &r535_flcn, type, inst);
+			break;
 		case NVKM_ENGINE_SW:
 			continue;
 		default:
@@ -522,6 +609,8 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			nvkm_runl_del(runl);
 			continue;
 		}
+
+		engn->rm.desc = ctrl->entries[i].engineData[ENGINE_INFO_TYPE_ENG_DESC];
 	}
 
 	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
@@ -540,7 +629,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
 	}
 
-	return 0;
+	return r535_fifo_ectx_size(fifo);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
index b450b79bb1d6..19e6772ead11 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.h
@@ -29,6 +29,11 @@ struct nvkm_engn {
 
 	int fault;
 
+	struct {
+		u32 desc;
+		u32 size;
+	} rm;
+
 	struct list_head head;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
index 37b0cdc760c7..2b0e923cb755 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
@@ -2,4 +2,8 @@
 nvkm-y += nvkm/engine/nvdec/base.o
 nvkm-y += nvkm/engine/nvdec/gm107.o
 nvkm-y += nvkm/engine/nvdec/tu102.o
+nvkm-y += nvkm/engine/nvdec/ga100.o
 nvkm-y += nvkm/engine/nvdec/ga102.o
+nvkm-y += nvkm/engine/nvdec/ad102.o
+
+nvkm-y += nvkm/engine/nvdec/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
new file mode 100644
index 000000000000..d72b3aae9a2b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ad102.c
@@ -0,0 +1,44 @@
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
+#include <subdev/gsp.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+ad102_nvdec = {
+	.sclass = {
+		{ -1, -1, NVC9B0_VIDEO_DECODER },
+		{}
+	}
+};
+
+int
+ad102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_nvdec **pnvdec)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_nvdec_new(&ad102_nvdec, device, type, inst, pnvdec);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
new file mode 100644
index 000000000000..932934227b9c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga100.c
@@ -0,0 +1,44 @@
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
+#include <subdev/gsp.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+ga100_nvdec = {
+	.sclass = {
+		{ -1, -1, NVC6B0_VIDEO_DECODER },
+		{}
+	}
+};
+
+int
+ga100_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+		struct nvkm_nvdec **pnvdec)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_nvdec_new(&ga100_nvdec, device, type, inst, pnvdec);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
index 1ec88a9b6504..022a9c824304 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/ga102.c
@@ -22,8 +22,16 @@
 #include "priv.h"
 
 #include <subdev/gsp.h>
-#include <subdev/mc.h>
-#include <subdev/timer.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+ga102_nvdec_gsp = {
+	.sclass = {
+		{ -1, -1, NVC7B0_VIDEO_DECODER },
+		{}
+	}
+};
 
 static const struct nvkm_falcon_func
 ga102_nvdec_flcn = {
@@ -59,7 +67,7 @@ ga102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst
 		struct nvkm_nvdec **pnvdec)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_nvdec_new(&ga102_nvdec_gsp, device, type, inst, pnvdec);
 
 	return nvkm_nvdec_new_(ga102_nvdec_fwif, device, type, inst, 0x848000, pnvdec);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
index 2a7ef527ed31..f506ae83bfd7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/priv.h
@@ -5,6 +5,8 @@
 
 struct nvkm_nvdec_func {
 	const struct nvkm_falcon_func *flcn;
+
+	struct nvkm_sclass sclass[];
 };
 
 struct nvkm_nvdec_fwif {
@@ -18,4 +20,7 @@ extern const struct nvkm_nvdec_fwif gm107_nvdec_fwif[];
 
 int nvkm_nvdec_new_(const struct nvkm_nvdec_fwif *fwif, struct nvkm_device *,
 		    enum nvkm_subdev_type, int, u32 addr, struct nvkm_nvdec **);
+
+int r535_nvdec_new(const struct nvkm_engine_func *, struct nvkm_device *,
+		   enum nvkm_subdev_type, int, struct nvkm_nvdec **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
new file mode 100644
index 000000000000..fd6c35e01510
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
@@ -0,0 +1,110 @@
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
+#include <core/object.h>
+#include <subdev/gsp.h>
+#include <engine/fifo.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+
+struct r535_nvdec_obj {
+	struct nvkm_object object;
+	struct nvkm_gsp_object rm;
+};
+
+static void *
+r535_nvdec_obj_dtor(struct nvkm_object *object)
+{
+	struct r535_nvdec_obj *obj = container_of(object, typeof(*obj), object);
+
+	nvkm_gsp_rm_free(&obj->rm);
+	return obj;
+}
+
+static const struct nvkm_object_func
+r535_nvdec_obj = {
+	.dtor = r535_nvdec_obj_dtor,
+};
+
+static int
+r535_nvdec_obj_ctor(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+		 struct nvkm_object **pobject)
+{
+	struct nvkm_chan *chan = nvkm_uchan_chan(oclass->parent);
+	struct r535_nvdec_obj *obj;
+	NV_BSP_ALLOCATION_PARAMETERS *args;
+
+	if (!(obj = kzalloc(sizeof(*obj), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_object_ctor(&r535_nvdec_obj, oclass, &obj->object);
+	*pobject = &obj->object;
+
+	args = nvkm_gsp_rm_alloc_get(&chan->rm.object, oclass->handle, oclass->base.oclass,
+				     sizeof(*args), &obj->rm);
+	if (WARN_ON(IS_ERR(args)))
+		return PTR_ERR(args);
+
+	args->size = sizeof(*args);
+	args->engineInstance = oclass->engine->subdev.inst;
+
+	return nvkm_gsp_rm_alloc_wr(&obj->rm, args);
+}
+
+static void *
+r535_nvdec_dtor(struct nvkm_engine *engine)
+{
+	struct nvkm_nvdec *nvdec = nvkm_nvdec(engine);
+
+	kfree(nvdec->engine.func);
+	return nvdec;
+}
+
+int
+r535_nvdec_new(const struct nvkm_engine_func *hw, struct nvkm_device *device,
+	       enum nvkm_subdev_type type, int inst, struct nvkm_nvdec **pnvdec)
+{
+	struct nvkm_engine_func *rm;
+	int nclass;
+
+	for (nclass = 0; hw->sclass[nclass].oclass; nclass++);
+
+	if (!(rm = kzalloc(sizeof(*rm) + (nclass + 1) * sizeof(rm->sclass[0]), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_nvdec_dtor;
+	for (int i = 0; i < nclass; i++) {
+		rm->sclass[i].minver = hw->sclass[i].minver;
+		rm->sclass[i].maxver = hw->sclass[i].maxver;
+		rm->sclass[i].oclass = hw->sclass[i].oclass;
+		rm->sclass[i].ctor = r535_nvdec_obj_ctor;
+	}
+
+	if (!(*pnvdec = kzalloc(sizeof(**pnvdec), GFP_KERNEL))) {
+		kfree(rm);
+		return -ENOMEM;
+	}
+
+	return nvkm_engine_ctor(rm, device, type, inst, true, &(*pnvdec)->engine);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
index fe95b6e22f21..808c8e010b9e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/tu102.c
@@ -23,12 +23,22 @@
 
 #include <subdev/gsp.h>
 
+#include <nvif/class.h>
+
+static const struct nvkm_engine_func
+tu102_nvdec = {
+	.sclass = {
+		{ -1, -1, NVC4B0_VIDEO_DECODER },
+		{}
+	}
+};
+
 int
 tu102_nvdec_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_nvdec **pnvdec)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_nvdec_new(&tu102_nvdec, device, type, inst, pnvdec);
 
 	return nvkm_nvdec_new_(gm107_nvdec_fwif, device, type, inst, 0, pnvdec);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 71b90adb4382..eb82dad1f74e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -859,6 +859,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			type = NVKM_ENGINE_GR;
 			inst = 0;
 			break;
+		case MC_ENGINE_IDX_NVDEC0 ... MC_ENGINE_IDX_NVDEC7:
+			type = NVKM_ENGINE_NVDEC;
+			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVDEC0;
+			break;
 		default:
 			continue;
 		}
-- 
2.41.0

