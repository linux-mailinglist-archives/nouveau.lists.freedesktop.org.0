Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD8A7B2E19
	for <lists+nouveau@lfdr.de>; Fri, 29 Sep 2023 10:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6310E6E8;
	Fri, 29 Sep 2023 08:42:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076D810E328
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:28 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68fb79ef55eso4499212b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068608; x=1695673408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dF5dvG4/WpMOjO0H9K2DMbRGBYEupO0bNYI62YbR2fU=;
 b=VdRxPuJlFfHlY2lE4U/gumndnEqgFhnVesdVEngLcNU9h7TzJFHJLq+AfexEpJO8fg
 nPdwozDZ9KmAcIonW8Bymv+VYSH/k0BKGM2DipW1JxCFjp1bh+yXeM+4T4N9sOAWS4pC
 gOcwsqCKO+Y4uZ1WP7fmvWVmfkEb7PxSuJ8ePTvEhta4U3Fog+QMt/gJejWffnYyGNRx
 0SuKBbwFnCAI1hrjtgQ809H4Tsp/F5dxk0GbNge3IoN2LDY6rgHvwMPwJIGXQoxmlh2e
 s6H9QOIhP1Z3JX6XYp3DcSg9XAfn+aDYJqbCbcF2ypHockKm2H+9mFJIMv99SNUslzEF
 fA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068608; x=1695673408;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dF5dvG4/WpMOjO0H9K2DMbRGBYEupO0bNYI62YbR2fU=;
 b=KhWNmnzHCJiqpZXbzaDZFnnG2mr3C5BvNRxxGCPc2br6QaGqH6L1FjcyJA1dTz9daV
 ibspB/qNdd7HZdRYY5UzPnYA3eujc7iE1ytAZXdS26y7traZnBCqxAMQ/ob6F0iuI1b8
 YzCRmt1CoZvg3P9D9n2Z8RHwqPOB0jd290fAJfdU6bkCCePSilvida8L7Ey1S0uhxhPp
 RS3mflYneAMqhyh8typc+3KBeO0JG/GzS3vaIp4rG+23cI9hUK+XKW3cuQ1eIGzHR1Fi
 V1hxWhzJs00b+ZNMWtemU37eu+4pxtzQ9cesW8Zb4Vy+E1fHVMvVD/sNdup+7TnlzIJK
 VS9A==
X-Gm-Message-State: AOJu0YxAxCjZZZIrY0x0Ds/KU+JumuDDERquAYKKuQxVx6qLzpU1ghcq
 Ow9x/wSMor3aOxBdWC644TkOxnf3Gt4=
X-Google-Smtp-Source: AGHT+IG+/rOdL/TwDVEFSE/Kc9DsUIeRYI0rb6k/qe5xrnbI58ghV23IybScg6Pnt/TGNTZrwn3HWQ==
X-Received: by 2002:a05:6a21:3d8b:b0:14d:f087:c0cc with SMTP id
 bj11-20020a056a213d8b00b0014df087c0ccmr11543287pzc.48.1695068606576; 
 Mon, 18 Sep 2023 13:23:26 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:26 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:42 +1000
Message-ID: <20230918202149.4343-38-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 29 Sep 2023 08:42:15 +0000
Subject: [Nouveau] [PATCH 37/44] drm/nouveau/disp/r535: initial support
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

Adds support for modesetting on RM.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/core.c       |    1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  141 ++
 drivers/gpu/drm/nouveau/include/nvif/class.h  |    2 +
 .../drm/nouveau/include/nvkm/engine/disp.h    |   19 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   35 +
 .../common/sdk/nvidia/inc/class/cl0005.h      |   38 +
 .../nvidia/inc/class/cl2080_notification.h    |   42 +
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073common.h |   39 +
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h    |  166 ++
 .../sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h |  335 ++++
 .../inc/ctrl/ctrl0073/ctrl0073specific.h      |  216 +++
 .../nvidia/inc/ctrl/ctrl0073/ctrl0073system.h |   34 +
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080event.h  |   41 +
 .../inc/ctrl/ctrl2080/ctrl2080internal.h      |   43 +
 .../535.54.03/common/sdk/nvidia/inc/nvos.h    |   27 +
 .../535.54.03/nvidia/generated/g_allclasses.h |   33 +
 .../nvidia/generated/g_mem_desc_nvoc.h        |   32 +
 .../nvidia/generated/g_rpc-structures.h       |   13 +
 .../nvidia/inc/kernel/gpu/intr/engine_idx.h   |    2 +
 .../nvidia/inc/kernel/os/nv_memory_type.h     |   31 +
 drivers/gpu/drm/nouveau/nvif/disp.c           |    1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |   10 +
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |    3 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  |   52 +
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.h   |    4 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  |    4 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |    2 +
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |    3 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |    3 +
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 1671 +++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |    2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |   31 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  129 ++
 35 files changed, 3202 insertions(+), 8 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_allclasses.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index abefc2343443..f045515696cb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -42,6 +42,7 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 		int version;
 		int (*new)(struct nouveau_drm *, s32, struct nv50_core **);
 	} cores[] = {
+		{ AD102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
 		{ GA102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
 		{ TU102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
 		{ GV100_DISP_CORE_CHANNEL_DMA, 0, corec37d_new },
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 57b6864fb9d0..0f23c2bb814b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1592,6 +1592,146 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 	nv_encoder->crtc = NULL;
 }
 
+// common/inc/displayport/displayport.h
+#define DP_CONFIG_WATERMARK_ADJUST                   2
+#define DP_CONFIG_WATERMARK_LIMIT                   20
+#define DP_CONFIG_INCREASED_WATERMARK_ADJUST         8
+#define DP_CONFIG_INCREASED_WATERMARK_LIMIT         22
+
+static bool
+nv50_sor_dp_watermark_sst(struct nouveau_encoder *outp,
+			  struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	bool enhancedFraming = outp->dp.dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP;
+	u64 minRate = outp->dp.link_bw * 1000;
+	unsigned tuSize = 64;
+	unsigned waterMark;
+	unsigned hBlankSym;
+	unsigned vBlankSym;
+	unsigned watermarkAdjust = DP_CONFIG_WATERMARK_ADJUST;
+	unsigned watermarkMinimum = DP_CONFIG_WATERMARK_LIMIT;
+	// depth is multiplied by 16 in case of DSC enable
+	s32 hblank_symbols;
+	// number of link clocks per line.
+	int vblank_symbols	  = 0;
+	bool bEnableDsc = false;
+	unsigned surfaceWidth = asyh->mode.h.blanks - asyh->mode.h.blanke;
+	unsigned rasterWidth = asyh->mode.h.active;
+	unsigned depth = asyh->or.bpc * 3;
+	unsigned DSC_FACTOR = bEnableDsc ? 16 : 1;
+	u64 pixelClockHz = asyh->mode.clock * 1000;
+	u64 PrecisionFactor = 100000, ratioF, watermarkF;
+	u32 numLanesPerLink = outp->dp.link_nr;
+	u32 numSymbolsPerLine;
+	u32 BlankingBits;
+	u32 surfaceWidthPerLink;
+	u32 PixelSteeringBits;
+	u64 NumBlankingLinkClocks;
+	u32 MinHBlank;
+
+	if (outp->outp.info.dp.increased_wm) {
+		watermarkAdjust = DP_CONFIG_INCREASED_WATERMARK_ADJUST;
+		watermarkMinimum = DP_CONFIG_INCREASED_WATERMARK_LIMIT;
+	}
+
+	if ((pixelClockHz * depth) >= (8 * minRate * outp->dp.link_nr * DSC_FACTOR))
+	{
+		return false;
+	}
+
+	//
+	// For DSC, if (pclk * bpp) < (1/64 * orclk * 8 * lanes) then some TU may end up with
+	// 0 active symbols. This may cause HW hang. Bug 200379426
+	//
+	if ((bEnableDsc) &&
+		((pixelClockHz * depth) < ((8 * minRate * outp->dp.link_nr * DSC_FACTOR) / 64)))
+	{
+		return false;
+	}
+
+	//
+	//  Perform the SST calculation.
+	//	For auto mode the watermark calculation does not need to track accumulated error the
+	//	formulas for manual mode will not work.  So below calculation was extracted from the DTB.
+	//
+	ratioF = ((u64)pixelClockHz * depth * PrecisionFactor) / DSC_FACTOR;
+
+	ratioF /= 8 * (u64) minRate * outp->dp.link_nr;
+
+	if (PrecisionFactor < ratioF) // Assert if we will end up with a negative number in below
+		return false;
+
+	watermarkF = ratioF * tuSize * (PrecisionFactor - ratioF)  / PrecisionFactor;
+	waterMark = (unsigned)(watermarkAdjust + ((2 * (depth * PrecisionFactor / (8 * numLanesPerLink * DSC_FACTOR)) + watermarkF) / PrecisionFactor));
+
+	//
+	//  Bounds check the watermark
+	//
+	numSymbolsPerLine = (surfaceWidth * depth) / (8 * outp->dp.link_nr * DSC_FACTOR);
+
+	if (WARN_ON(waterMark > 39 || waterMark > numSymbolsPerLine))
+		return false;
+
+	//
+	//  Clamp the low side
+	//
+	if (waterMark < watermarkMinimum)
+		waterMark = watermarkMinimum;
+
+	//Bits to send BS/BE/Extra symbols due to pixel padding
+	//Also accounts for enhanced framing.
+	BlankingBits = 3*8*numLanesPerLink + (enhancedFraming ? 3*8*numLanesPerLink : 0);
+
+	//VBID/MVID/MAUD sent 4 times all the time
+	BlankingBits += 3*8*4;
+
+	surfaceWidthPerLink = surfaceWidth;
+
+	//Extra bits sent due to pixel steering
+	PixelSteeringBits = (surfaceWidthPerLink % numLanesPerLink) ? (((numLanesPerLink - surfaceWidthPerLink % numLanesPerLink) * depth) / DSC_FACTOR) : 0;
+
+	BlankingBits += PixelSteeringBits;
+	NumBlankingLinkClocks = (u64)BlankingBits * PrecisionFactor / (8 * numLanesPerLink);
+	MinHBlank = (u32)(NumBlankingLinkClocks * pixelClockHz/ minRate / PrecisionFactor);
+	MinHBlank += 12;
+
+	if (WARN_ON(MinHBlank > rasterWidth - surfaceWidth))
+		return false;
+
+	// Bug 702290 - Active Width should be greater than 60
+	if (WARN_ON(surfaceWidth <= 60))
+		return false;
+
+
+	hblank_symbols = (s32)(((u64)(rasterWidth - surfaceWidth - MinHBlank) * minRate) / pixelClockHz);
+
+	//reduce HBlank Symbols to account for secondary data packet
+	hblank_symbols -= 1; //Stuffer latency to send BS
+	hblank_symbols -= 3; //SPKT latency to send data to stuffer
+
+	hblank_symbols -= numLanesPerLink == 1 ? 9  : numLanesPerLink == 2 ? 6 : 3;
+
+	hBlankSym = (hblank_symbols < 0) ? 0 : hblank_symbols;
+
+	// Refer to dev_disp.ref for more information.
+	// # symbols/vblank = ((SetRasterBlankEnd.X + SetRasterSize.Width - SetRasterBlankStart.X - 40) * link_clk / pclk) - Y - 1;
+	// where Y = (# lanes == 4) 12 : (# lanes == 2) ? 21 : 39
+	if (surfaceWidth < 40)
+	{
+		vblank_symbols = 0;
+	}
+	else
+	{
+		vblank_symbols = (s32)(((u64)(surfaceWidth - 40) * minRate) /  pixelClockHz) - 1;
+
+		vblank_symbols -= numLanesPerLink == 1 ? 39  : numLanesPerLink == 2 ? 21 : 12;
+	}
+
+	vBlankSym = (vblank_symbols < 0) ? 0 : vblank_symbols;
+
+	return nvif_outp_dp_sst(&outp->outp, head->base.index, waterMark, hBlankSym, vBlankSym);
+}
+
 static void
 nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
@@ -1679,6 +1819,7 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		break;
 	case DCB_OUTPUT_DP:
 		nouveau_dp_train(nv_encoder, false, mode->clock, asyh->or.bpc);
+		nv50_sor_dp_watermark_sst(nv_encoder, head, asyh);
 		depth = nv50_dp_bpc_to_depth(asyh->or.bpc);
 
 		if (nv_encoder->outp.or.link & 1)
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index ad1e5de84e80..fa94d69d3eb0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -104,6 +104,7 @@
 #define GV100_DISP                                    /* if0010.h */ 0x0000c370
 #define TU102_DISP                                    /* if0010.h */ 0x0000c570
 #define GA102_DISP                                    /* if0010.h */ 0x0000c670
+#define AD102_DISP                                    /* if0010.h */ 0x0000c770
 
 #define GV100_DISP_CAPS                                              0x0000c373
 
@@ -154,6 +155,7 @@
 #define GV100_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c37d
 #define TU102_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c57d
 #define GA102_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c67d
+#define AD102_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c77d
 
 #define NV50_DISP_OVERLAY_CHANNEL_DMA                 /* if0014.h */ 0x0000507e
 #define G82_DISP_OVERLAY_CHANNEL_DMA                  /* if0014.h */ 0x0000827e
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
index ad9aef2df48f..3e8db8280e2a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
@@ -5,11 +5,29 @@
 #include <core/engine.h>
 #include <core/object.h>
 #include <core/event.h>
+#include <subdev/gsp.h>
 
 struct nvkm_disp {
 	const struct nvkm_disp_func *func;
 	struct nvkm_engine engine;
 
+	struct {
+		struct nvkm_gsp_client client;
+		struct nvkm_gsp_device device;
+
+		struct nvkm_gsp_object objcom;
+		struct nvkm_gsp_object object;
+
+#define NVKM_DPYID_PLUG   BIT(0)
+#define NVKM_DPYID_UNPLUG BIT(1)
+#define NVKM_DPYID_IRQ    BIT(2)
+		struct nvkm_event event;
+		struct nvkm_gsp_event hpd;
+		struct nvkm_gsp_event irq;
+
+		u32 assigned_sors;
+	} rm;
+
 	struct list_head heads;
 	struct list_head iors;
 	struct list_head outps;
@@ -69,4 +87,5 @@ int gp102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct
 int gv100_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
 int tu102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
 int ga102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
+int ad102_disp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_disp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index f5130f4f4a5a..e7e8b30ceb44 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -23,6 +23,9 @@ void nvkm_gsp_sg_free(struct nvkm_device *, struct sg_table *);
 
 typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
 
+struct nvkm_gsp_event;
+typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 repc);
+
 struct nvkm_gsp {
 	const struct nvkm_gsp_func *func;
 	struct nvkm_subdev subdev;
@@ -150,6 +153,8 @@ struct nvkm_gsp {
 			} object;
 
 			struct nvkm_gsp *gsp;
+
+			struct list_head events;
 		} client;
 
 		struct nvkm_gsp_device {
@@ -191,6 +196,10 @@ struct nvkm_gsp {
 
 		int (*device_ctor)(struct nvkm_gsp_client *, struct nvkm_gsp_device *);
 		void (*device_dtor)(struct nvkm_gsp_device *);
+
+		int (*event_ctor)(struct nvkm_gsp_device *, u32 handle, u32 id,
+				  nvkm_gsp_event_func, struct nvkm_gsp_event *);
+		void (*event_dtor)(struct nvkm_gsp_event *);
 	} *rm;
 
 	struct {
@@ -399,6 +408,32 @@ nvkm_gsp_client_device_ctor(struct nvkm_gsp *gsp,
 	return ret;
 }
 
+struct nvkm_gsp_event {
+	struct nvkm_gsp_device *device;
+	u32 id;
+	nvkm_gsp_event_func func;
+
+	struct nvkm_gsp_object object;
+
+	struct list_head head;
+};
+
+static inline int
+nvkm_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
+			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
+{
+	return device->object.client->gsp->rm->event_ctor(device, handle, id, func, event);
+}
+
+static inline void
+nvkm_gsp_event_dtor(struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_device *device = event->device;
+
+	if (device)
+		device->object.client->gsp->rm->event_dtor(event);
+}
+
 int nvkm_gsp_intr_stall(struct nvkm_gsp *, enum nvkm_subdev_type, int);
 int nvkm_gsp_intr_nonstall(struct nvkm_gsp *, enum nvkm_subdev_type, int);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h
new file mode 100644
index 000000000000..987bae11ad91
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h
@@ -0,0 +1,38 @@
+#ifndef __src_common_sdk_nvidia_inc_class_cl0005_h__
+#define __src_common_sdk_nvidia_inc_class_cl0005_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2001-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+typedef struct NV0005_ALLOC_PARAMETERS {
+    NvHandle hParentClient;
+    NvHandle hSrcResource;
+
+    NvV32    hClass;
+    NvV32    notifyIndex;
+    NV_DECLARE_ALIGNED(NvP64 data, 8);
+} NV0005_ALLOC_PARAMETERS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
new file mode 100644
index 000000000000..39652d3b5fa8
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h
@@ -0,0 +1,42 @@
+#ifndef __src_common_sdk_nvidia_inc_class_cl2080_notification_h__
+#define __src_common_sdk_nvidia_inc_class_cl2080_notification_h__
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
+#define NV2080_NOTIFIERS_HOTPLUG                                   (1)
+
+#define NV2080_NOTIFIERS_DP_IRQ                                    (7)
+
+typedef struct {
+    NvU32 plugDisplayMask;
+    NvU32 unplugDisplayMask;
+} Nv2080HotplugNotification;
+
+typedef struct Nv2080DpIrqNotificationRec {
+    NvU32 displayId;
+} Nv2080DpIrqNotification;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
new file mode 100644
index 000000000000..9f2b8557c79c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h
@@ -0,0 +1,39 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073common_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073common_h__
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
+typedef struct NV0073_CTRL_CMD_DSC_CAP_PARAMS {
+    NvBool bDscSupported;
+    NvU32  encoderColorFormatMask;
+    NvU32  lineBufferSizeKB;
+    NvU32  rateBufferSizeKB;
+    NvU32  bitsPerPixelPrecision;
+    NvU32  maxNumHztSlices;
+    NvU32  lineBufferBitDepth;
+} NV0073_CTRL_CMD_DSC_CAP_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
new file mode 100644
index 000000000000..193f2cbc302b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h
@@ -0,0 +1,166 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dfp_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dfp_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2005-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV0073_CTRL_CMD_DFP_GET_INFO (0x731140U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_GET_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_DFP_GET_INFO_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 flags;
+    NvU32 flags2;
+} NV0073_CTRL_DFP_GET_INFO_PARAMS;
+
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL                                       2:0
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_TMDS                       (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_LVDS                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_SDI                        (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DISPLAYPORT                (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DSI                        (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_WRBK                       (0x00000005U)
+#define NV0073_CTRL_DFP_FLAGS_LANE                                         5:3
+#define NV0073_CTRL_DFP_FLAGS_LANE_NONE                         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_SINGLE                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_DUAL                         (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_QUAD                         (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_OCT                          (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_LIMIT                                        6:6
+#define NV0073_CTRL_DFP_FLAGS_LIMIT_DISABLE                     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LIMIT_60HZ_RR                     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER                                   7:7
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_NORMAL                 (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_DISABLE                (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE                                 8:8
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_FALSE                (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_TRUE                 (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE                        9:9
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_FALSE       (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_TRUE        (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE                         10:10
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_FALSE          (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_TRUE           (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE                    11:11
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_FALSE     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_TRUE      (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE                    12:12
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_FALSE     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_TRUE      (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED                               14:14
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_FALSE                (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_TRUE                 (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT                       15:15
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_FALSE        (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_TRUE         (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT                         16:16
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_NONE           (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_PREFER_RBR     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW                                 19:17
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_1_62GBPS               (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_2_70GBPS               (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_5_40GBPS               (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_8_10GBPS               (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_LINK                                       21:20
+#define NV0073_CTRL_DFP_FLAGS_LINK_NONE                         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LINK_SINGLE                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_LINK_DUAL                         (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID                           22:22
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_FALSE            (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_TRUE             (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID                              24:23
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_NONE            (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_A               (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_B               (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_GANGED          (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED                   25:25
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_FALSE    (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_TRUE     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_PHY_REPEATER_COUNT                      29:26
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE                        30:30
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_FALSE         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_TRUE          (0x00000001U)
+
+#define NV0073_CTRL_CMD_DFP_SET_ELD_AUDIO_CAPS                         (0x731144U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_ELD_BUFFER                      96U
+
+typedef struct NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 numELDSize;
+    NvU8  bufferELD[NV0073_CTRL_DFP_ELD_AUDIO_CAPS_ELD_BUFFER];
+    NvU32 maxFreqSupported;
+    NvU32 ctrl;
+    NvU32 deviceEntry;
+} NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS;
+
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD                                     0:0
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD_FALSE              (0x00000000U)
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_PD_TRUE               (0x00000001U)
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV                                   1:1
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV_FALSE            (0x00000000U)
+#define NV0073_CTRL_DFP_ELD_AUDIO_CAPS_CTRL_ELDV_TRUE             (0x00000001U)
+
+#define NV0073_CTRL_CMD_DFP_SET_AUDIO_ENABLE                (0x731150U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvBool enable;
+} NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS;
+
+typedef NvU32 NV0073_CTRL_DFP_ASSIGN_SOR_LINKCONFIG;
+
+typedef struct NV0073_CTRL_DFP_ASSIGN_SOR_INFO {
+    NvU32 displayMask;
+    NvU32 sorType;
+} NV0073_CTRL_DFP_ASSIGN_SOR_INFO;
+
+#define NV0073_CTRL_CMD_DFP_ASSIGN_SOR           (0x731152U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS  4U
+
+typedef struct NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS {
+    NvU32                                 subDeviceInstance;
+    NvU32                                 displayId;
+    NvU8                                  sorExcludeMask;
+    NvU32                                 slaveDisplayId;
+    NV0073_CTRL_DFP_ASSIGN_SOR_LINKCONFIG forceSublinkConfig;
+    NvBool                                bIs2Head1Or;
+    NvU32                                 sorAssignList[NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS];
+    NV0073_CTRL_DFP_ASSIGN_SOR_INFO       sorAssignListWithTag[NV0073_CTRL_CMD_DFP_ASSIGN_SOR_MAX_SORS];
+    NvU8                                  reservedSorMask;
+    NvU32                                 flags;
+} NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS;
+
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO                                      0:0
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO_OPTIMAL                    (0x00000001U)
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_AUDIO_DEFAULT                    (0x00000000U)
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE               1:1
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE_NO  (0x00000000U)
+#define NV0073_CTRL_DFP_ASSIGN_SOR_FLAGS_ACTIVE_SOR_NOT_AUDIO_CAPABLE_YES (0x00000001U)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
new file mode 100644
index 000000000000..76dafc828064
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h
@@ -0,0 +1,335 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dp_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073dp_h__
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073common.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2005-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV0073_CTRL_CMD_DP_AUXCH_CTRL      (0x731341U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_AUXCH_CTRL_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_DP_AUXCH_MAX_DATA_SIZE 16U
+
+typedef struct NV0073_CTRL_DP_AUXCH_CTRL_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvBool bAddrOnly;
+    NvU32  cmd;
+    NvU32  addr;
+    NvU8   data[NV0073_CTRL_DP_AUXCH_MAX_DATA_SIZE];
+    NvU32  size;
+    NvU32  replyType;
+    NvU32  retryTimeMs;
+} NV0073_CTRL_DP_AUXCH_CTRL_PARAMS;
+
+#define NV0073_CTRL_DP_AUXCH_CMD_TYPE                          3:3
+#define NV0073_CTRL_DP_AUXCH_CMD_TYPE_I2C               (0x00000000U)
+#define NV0073_CTRL_DP_AUXCH_CMD_TYPE_AUX               (0x00000001U)
+#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT                       2:2
+#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT_FALSE          (0x00000000U)
+#define NV0073_CTRL_DP_AUXCH_CMD_I2C_MOT_TRUE           (0x00000001U)
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE                      1:0
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_WRITE         (0x00000000U)
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_READ          (0x00000001U)
+#define NV0073_CTRL_DP_AUXCH_CMD_REQ_TYPE_WRITE_STATUS  (0x00000002U)
+
+#define NV0073_CTRL_CMD_DP_CTRL                     (0x731343U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_CTRL_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_DP_CTRL_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 cmd;
+    NvU32 data;
+    NvU32 err;
+    NvU32 retryTimeMs;
+    NvU32 eightLaneDpcdBaseAddr;
+} NV0073_CTRL_DP_CTRL_PARAMS;
+
+#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT                           0:0
+#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT_FALSE                         (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_LANE_COUNT_TRUE                          (0x00000001U)
+#define NV0073_CTRL_DP_CMD_SET_LINK_BW                              1:1
+#define NV0073_CTRL_DP_CMD_SET_LINK_BW_FALSE                            (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_LINK_BW_TRUE                             (0x00000001U)
+#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD                       2:2
+#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD_FALSE                     (0x00000000U)
+#define NV0073_CTRL_DP_CMD_DISABLE_DOWNSPREAD_TRUE                      (0x00000001U)
+#define NV0073_CTRL_DP_CMD_UNUSED                                   3:3
+#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE                          4:4
+#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE_SINGLE_STREAM                (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_FORMAT_MODE_MULTI_STREAM                 (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING                       5:5
+#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING_NO                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_FAST_LINK_TRAINING_YES                       (0x00000001U)
+#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING                         6:6
+#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING_NO                          (0x00000000U)
+#define NV0073_CTRL_DP_CMD_NO_LINK_TRAINING_YES                         (0x00000001U)
+#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING                     7:7
+#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING_FALSE                   (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SET_ENHANCED_FRAMING_TRUE                    (0x00000001U)
+#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING                   8:8
+#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING_DEFAULT               (0x00000000U)
+#define NV0073_CTRL_DP_CMD_USE_DOWNSPREAD_SETTING_FORCE                 (0x00000001U)
+#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING                      9:9
+#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING_NO                       (0x00000000U)
+#define NV0073_CTRL_DP_CMD_SKIP_HW_PROGRAMMING_YES                      (0x00000001U)
+#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED                10:10
+#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED_NO                   (0x00000000U)
+#define NV0073_CTRL_DP_CMD_POST_LT_ADJ_REQ_GRANTED_YES                  (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING                     12:11
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_NO                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_DONOT_TOGGLE_TRANSMISSION (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FAKE_LINK_TRAINING_TOGGLE_TRANSMISSION_ON    (0x00000002U)
+#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER                     13:13
+#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER_NO                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_TRAIN_PHY_REPEATER_YES                       (0x00000001U)
+#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG                        14:14
+#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG_FALSE                        (0x00000000U)
+#define NV0073_CTRL_DP_CMD_FALLBACK_CONFIG_TRUE                         (0x00000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_FEC                             15:15
+#define NV0073_CTRL_DP_CMD_ENABLE_FEC_FALSE                             (0x00000000U)
+#define NV0073_CTRL_DP_CMD_ENABLE_FEC_TRUE                              (0x00000001U)
+
+#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST                         29:29
+#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST_NO                            (0x00000000U)
+#define NV0073_CTRL_DP_CMD_BANDWIDTH_TEST_YES                           (0x00000001U)
+#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE              30:30
+#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE_FALSE              (0x00000000U)
+#define NV0073_CTRL_DP_CMD_LINK_CONFIG_CHECK_DISABLE_TRUE               (0x00000001U)
+#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG                    31:31
+#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG_FALSE                    (0x00000000U)
+#define NV0073_CTRL_DP_CMD_DISABLE_LINK_CONFIG_TRUE                     (0x00000001U)
+
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT                          4:0
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_0                            (0x00000000U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_1                            (0x00000001U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_2                            (0x00000002U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_4                            (0x00000004U)
+#define NV0073_CTRL_DP_DATA_SET_LANE_COUNT_8                            (0x00000008U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW                            15:8
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_1_62GBPS                        (0x00000006U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_16GBPS                        (0x00000008U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_43GBPS                        (0x00000009U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_2_70GBPS                        (0x0000000AU)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_3_24GBPS                        (0x0000000CU)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_4_32GBPS                        (0x00000010U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_5_40GBPS                        (0x00000014U)
+#define NV0073_CTRL_DP_DATA_SET_LINK_BW_8_10GBPS                        (0x0000001EU)
+#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING                  18:18
+#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING_NO                     (0x00000000U)
+#define NV0073_CTRL_DP_DATA_SET_ENHANCED_FRAMING_YES                    (0x00000001U)
+#define NV0073_CTRL_DP_DATA_TARGET                                22:19
+#define NV0073_CTRL_DP_DATA_TARGET_SINK                                 (0x00000000U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_0                       (0x00000001U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_1                       (0x00000002U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_2                       (0x00000003U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_3                       (0x00000004U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_4                       (0x00000005U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_5                       (0x00000006U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_6                       (0x00000007U)
+#define NV0073_CTRL_DP_DATA_TARGET_PHY_REPEATER_7                       (0x00000008U)
+
+#define NV0073_CTRL_MAX_LANES                                           8U
+
+typedef struct NV0073_CTRL_DP_LANE_DATA_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 numLanes;
+    NvU32 data[NV0073_CTRL_MAX_LANES];
+} NV0073_CTRL_DP_LANE_DATA_PARAMS;
+
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS                   1:0
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_NONE    (0x00000000U)
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL1  (0x00000001U)
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL2  (0x00000002U)
+#define NV0073_CTRL_DP_LANE_DATA_PREEMPHASIS_LEVEL3  (0x00000003U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT                  3:2
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL0 (0x00000000U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL1 (0x00000001U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL2 (0x00000002U)
+#define NV0073_CTRL_DP_LANE_DATA_DRIVECURRENT_LEVEL3 (0x00000003U)
+
+#define NV0073_CTRL_CMD_DP_SET_LANE_DATA (0x731346U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_LANE_DATA_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_DP_SET_AUDIO_MUTESTREAM      (0x731359U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 mute;
+} NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID  (0x73135bU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  preferredDisplayId;
+
+    NvBool force;
+    NvBool useBFM;
+
+    NvU32  displayIdAssigned;
+    NvU32  allDisplayMask;
+} NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID (0x73135cU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+} NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_CONFIG_STREAM                   (0x731362U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  head;
+    NvU32  sorIndex;
+    NvU32  dpLink;
+
+    NvBool bEnableOverride;
+    NvBool bMST;
+    NvU32  singleHeadMultistreamMode;
+    NvU32  hBlankSym;
+    NvU32  vBlankSym;
+    NvU32  colorFormat;
+    NvBool bEnableTwoHeadOneOr;
+
+    struct {
+        NvU32  slotStart;
+        NvU32  slotEnd;
+        NvU32  PBN;
+        NvU32  Timeslice;
+        NvBool sendACT;          // deprecated -Use NV0073_CTRL_CMD_DP_SEND_ACT
+        NvU32  singleHeadMSTPipeline;
+        NvBool bEnableAudioOverRightPanel;
+    } MST;
+
+    struct {
+        NvBool bEnhancedFraming;
+        NvU32  tuSize;
+        NvU32  waterMark;
+        NvU32  actualPclkHz;     // deprecated  -Use MvidWarParams
+        NvU32  linkClkFreqHz;    // deprecated  -Use MvidWarParams
+        NvBool bEnableAudioOverRightPanel;
+        struct {
+            NvU32  activeCnt;
+            NvU32  activeFrac;
+            NvU32  activePolarity;
+            NvBool mvidWarEnabled;
+            struct {
+                NvU32 actualPclkHz;
+                NvU32 linkClkFreqHz;
+            } MvidWarParams;
+        } Legacy;
+    } SST;
+} NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT                    (0x731365U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS {
+    NvU32 subDeviceInstance;
+} NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS   (0x731369U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID (0x69U)
+
+typedef struct NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS {
+    NvU32                          subDeviceInstance;
+    NvU32                          sorIndex;
+    NvU32                          maxLinkRate;
+    NvU32                          dpVersionsSupported;
+    NvU32                          UHBRSupported;
+    NvBool                         bIsMultistreamSupported;
+    NvBool                         bIsSCEnabled;
+    NvBool                         bHasIncreasedWatermarkLimits;
+    NvBool                         bIsPC2Disabled;
+    NvBool                         isSingleHeadMSTSupported;
+    NvBool                         bFECSupported;
+    NvBool                         bIsTrainPhyRepeater;
+    NvBool                         bOverrideLinkBw;
+    NV0073_CTRL_CMD_DSC_CAP_PARAMS DSC;
+} NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2                0:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_YES             (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4                1:1
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_YES             (0x00000001U)
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE                           2:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_NONE                          (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62                          (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70                          (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40                          (0x00000003U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10                          (0x00000004U)
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_RGB                (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_444        (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_422 (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_420 (0x00000008U)
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_16           (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_8            (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_4            (0x00000003U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_2            (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1              (0x00000005U)
+
+#define NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES (0x731377U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES        8U
+
+typedef struct NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS {
+    // In
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU16 linkRateTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
+
+    // Out
+    NvU8  linkBwTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
+    NvU8  linkBwCount;
+} NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS;
+
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE                                   3:0
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_BEGIN     (0x00000000U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_CHALLENGE (0x00000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_MONITOR_ENABLE_CHECK     (0x00000002U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_BEGIN      (0x00000003U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_CHALLENGE  (0x00000004U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_DRIVER_ENABLE_CHECK      (0x00000005U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_RESET_MONITOR            (0x00000006U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_INIT_PUBLIC_INFO         (0x00000007U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_GET_PUBLIC_INFO          (0x00000008U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_CMD_STAGE_STATUS_CHECK             (0x00000009U)
+
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_OK                          (0x00000000U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_PENDING                     (0x80000001U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_READ_ERROR                  (0x80000002U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_WRITE_ERROR                 (0x80000003U)
+#define NV0073_CTRL_DP_CMD_ENABLE_VRR_STATUS_DEVICE_ERROR                (0x80000004U)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
new file mode 100644
index 000000000000..bf44b28e7603
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h
@@ -0,0 +1,216 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073specific_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl0073_ctrl0073specific_h__
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
+#define NV0073_CTRL_CMD_SPECIFIC_GET_EDID_V2         (0x730245U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_SPECIFIC_GET_EDID_MAX_EDID_BYTES 2048U
+
+typedef struct NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 bufferSize;
+    NvU32 flags;
+    NvU8  edidBuffer[NV0073_CTRL_SPECIFIC_GET_EDID_MAX_EDID_BYTES];
+} NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA   (0x730250U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_MAX_CONNECTORS                    4U
+
+typedef struct NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 flags;
+    NvU32 DDCPartners;
+    NvU32 count;
+    struct {
+        NvU32 index;
+        NvU32 type;
+        NvU32 location;
+    } data[NV0073_CTRL_MAX_CONNECTORS];
+    NvU32 platform;
+} NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_ENABLE (0x730273U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS {
+    NvU8  subDeviceInstance;
+    NvU32 displayId;
+    NvU8  enable;
+} NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM (0x730275U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS {
+    NvU8  subDeviceInstance;
+    NvU32 displayId;
+    NvU8  mute;
+} NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_ALL_HEAD_MASK (0x730287U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 headMask;
+} NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_OD_PACKET (0x730288U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_SET_OD_MAX_PACKET_SIZE     36U
+
+typedef struct NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  transmitControl;
+    NvU32  packetSize;
+    NvU32  targetHead;
+    NvBool bUsePsrHeadforSdp;
+    NvU8   aPacket[NV0073_CTRL_SET_OD_MAX_PACKET_SIZE];
+} NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS;
+
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE                                     0:0
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE_NO                      (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ENABLE_YES                     (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME                                1:1
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME_DISABLE            (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_OTHER_FRAME_ENABLE             (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME                               2:2
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME_DISABLE           (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SINGLE_FRAME_ENABLE            (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK                                 3:3
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK_DISABLE              (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_ON_HBLANK_ENABLE               (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE                                  4:4
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE_DISABLE              (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_IMMEDIATE_ENABLE               (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT                                  5:5
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT_SW_CONTROLLED        (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_VIDEO_FMT_HW_CONTROLLED        (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY                        6:6
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY_FALSE      (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_STEREO_POLARITY_TRUE       (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING                   7:7
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING_FALSE (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_SET_SELF_REFRESH_SETTING_TRUE  (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE                         9:8
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE_INFOFRAME0  (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_GEN_INFOFRAME_MODE_INFOFRAME1  (0x0000001U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE                     31:31
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE_NO        (0x0000000U)
+#define NV0073_CTRL_SPECIFIC_SET_OD_PACKET_TRANSMIT_CONTROL_RESERVED_LEGACY_MODE_YES       (0x0000001U)
+
+#define NV0073_CTRL_CMD_SPECIFIC_OR_GET_INFO (0x73028bU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  index;
+    NvU32  type;
+    NvU32  protocol;
+    NvU32  ditherType;
+    NvU32  ditherAlgo;
+    NvU32  location;
+    NvU32  rootPortId;
+    NvU32  dcbIndex;
+    NV_DECLARE_ALIGNED(NvU64 vbiosAddress, 8);
+    NvBool bIsLitByVbios;
+    NvBool bIsDispDynamic;
+} NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS;
+
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_NONE                   (0x00000000U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_DAC                    (0x00000001U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_SOR                    (0x00000002U)
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_PIOR                   (0x00000003U)
+
+#define NV0073_CTRL_SPECIFIC_OR_TYPE_DSI                    (0x00000005U)
+
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_DAC_RGB_CRT        (0x00000000U)
+
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_LVDS_CUSTOM    (0x00000000U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_A  (0x00000001U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_B  (0x00000002U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DUAL_TMDS      (0x00000005U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_A           (0x00000008U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_B           (0x00000009U)
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DSI            (0x00000010U)
+
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_DSI                (0x00000011U)
+
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_PIOR_EXT_TMDS_ENC  (0x00000000U)
+
+#define NV0073_CTRL_SPECIFIC_OR_PROTOCOL_UNKNOWN            (0xFFFFFFFFU)
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS (0x730291U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  brightness;
+    NvBool bUncalibrated;
+} NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS (0x730292U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS (0x730293U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 caps;
+} NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED                           0:0
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED_FALSE       (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_GT_340MHZ_CLOCK_SUPPORTED_TRUE        (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED                     1:1
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED_FALSE (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_LTE_340MHZ_SCRAMBLING_SUPPORTED_TRUE  (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED                                      2:2
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED_FALSE                  (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_SCDC_SUPPORTED_TRUE                   (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED                              5:3
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_NONE           (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_3LANES_3G      (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_3LANES_6G      (0x00000002U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_6G      (0x00000003U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_8G      (0x00000004U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_10G     (0x00000005U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_MAX_FRL_RATE_SUPPORTED_4LANES_12G     (0x00000006U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED                                    6:6
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED_FALSE                (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_12_SUPPORTED_TRUE                 (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED                          9:7
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_NONE       (0x00000000U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_3LANES_3G  (0x00000001U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_3LANES_6G  (0x00000002U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_6G  (0x00000003U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_8G  (0x00000004U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_10G (0x00000005U)
+#define NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS_DSC_MAX_FRL_RATE_SUPPORTED_4LANES_12G (0x00000006U)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
index c1f1c8881a42..1ff22f06dc82 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h
@@ -26,6 +26,40 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#define NV0073_CTRL_CMD_SYSTEM_GET_NUM_HEADS (0x730102U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 flags;
+    NvU32 numHeads;
+} NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS;
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED (0x730120U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayMask;
+    NvU32 displayMaskDDC;
+} NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS;
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE (0x730122U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 flags;
+    NvU32 displayMask;
+    NvU32 retryTimeMs;
+} NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS;
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE                (0x730126U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 head;
+    NvU32 flags;
+    NvU32 displayId;
+} NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS;
+
 #define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
new file mode 100644
index 000000000000..472702723057
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h
@@ -0,0 +1,41 @@
+#ifndef __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080event_h__
+#define __src_common_sdk_nvidia_inc_ctrl_ctrl2080_ctrl2080event_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2006-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV2080_CTRL_CMD_EVENT_SET_NOTIFICATION (0x20800301) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_EVENT_INTERFACE_ID << 8) | NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS {
+    NvU32  event;
+    NvU32  action;
+    NvBool bNotifyState;
+    NvU32  info32;
+    NvU16  info16;
+} NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS;
+
+#define NV2080_CTRL_EVENT_SET_NOTIFICATION_ACTION_REPEAT  (0x00000002)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
index e76669fe0453..732f20ee2bbe 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h
@@ -26,6 +26,39 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO (0x20800a01) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS {
+    NvU32  feHwSysCap;
+    NvU32  windowPresentMask;
+    NvBool bFbRemapperEnabled;
+    NvU32  numHeads;
+    NvBool bPrimaryVga;
+    NvU32  i2cPort;
+    NvU32  internalDispActiveMask;
+} NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM (0x20800a49) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 instMemPhysAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 instMemSize, 8);
+    NvU32 instMemAddrSpace;
+    NvU32 instMemCpuCacheAttr;
+} NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER (0x20800a58) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS_MESSAGE_ID" */
+
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS {
+    NvU32  addressSpace;
+    NV_DECLARE_ALIGNED(NvU64 physicalAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 limit, 8);
+    NvU32  cacheSnoop;
+    NvU32  hclass;
+    NvU32  channelInstance;
+    NvBool valid;
+} NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS;
+
 #define NV2080_CTRL_CMD_INTERNAL_INTR_GET_KERNEL_TABLE (0x20800a5c) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS_MESSAGE_ID" */
 
 #define NV2080_CTRL_INTERNAL_INTR_MAX_TABLE_SIZE       128
@@ -81,4 +114,14 @@ typedef struct NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS {
     NV_DECLARE_ALIGNED(NvU64 size, 8);
 } NV2080_CTRL_INTERNAL_FBSR_SEND_REGION_INFO_PARAMS;
 
+#define NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD (0x20800ac6) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_ACPI_DSM_READ_SIZE                   (0x1000) /* finn: Evaluated from "(4 * 1024)" */
+
+typedef struct NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS {
+    NvU32 status;
+    NvU16 backLightDataSize;
+    NvU8  backLightData[NV2080_CTRL_ACPI_DSM_READ_SIZE];
+} NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS;
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
index 28f8aaa9da47..e17e48d30a14 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h
@@ -78,6 +78,33 @@
 #define NVOS02_FLAGS_MAPPING_NO_MAP                                (0x00000001)
 #define NVOS02_FLAGS_MAPPING_NEVER_MAP                             (0x00000002)
 
+#define NV01_EVENT_CLIENT_RM                                       (0x04000000)
+
+typedef struct
+{
+    NvV32    channelInstance;            // One of the n channel instances of a given channel type.
+                                         // Note that core channel has only one instance
+                                         // while all others have two (one per head).
+    NvHandle hObjectBuffer;              // ctx dma handle for DMA push buffer
+    NvHandle hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors/notifications
+    NvU32    offset;                     // Initial offset for put/get, usually zero.
+    NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of UDISP GET/PUT regs
+
+    NvU32    flags;
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB                1:1
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_YES            0x00000000
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_NO             0x00000001
+
+} NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS;
+
+typedef struct
+{
+    NvV32    channelInstance;            // One of the n channel instances of a given channel type.
+                                         // All PIO channels have two instances (one per head).
+    NvHandle hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors.
+    NvP64    pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of control region for PIO channel
+} NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS;
+
 typedef struct
 {
     NvU32   index;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_allclasses.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_allclasses.h
new file mode 100644
index 000000000000..b17520135233
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_allclasses.h
@@ -0,0 +1,33 @@
+#ifndef __src_nvidia_generated_g_allclasses_h__
+#define __src_nvidia_generated_g_allclasses_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2021-2021 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV01_EVENT_KERNEL_CALLBACK_EX            (0x0000007e)
+
+#define NV04_DISPLAY_COMMON                      (0x00000073)
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h
new file mode 100644
index 000000000000..dff4bd362772
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h
@@ -0,0 +1,32 @@
+#ifndef __src_nvidia_generated_g_mem_desc_nvoc_h__
+#define __src_nvidia_generated_g_mem_desc_nvoc_h__
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
+#define ADDR_SYSMEM     1         // System memory (PCI)
+#define ADDR_FBMEM      2         // Frame buffer memory space
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
index 05ac91facca4..9139b34c75d9 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/generated/g_rpc-structures.h
@@ -91,6 +91,19 @@ typedef struct rpc_run_cpu_sequencer_v17_00
     NvU32      commandBuffer[];
 } rpc_run_cpu_sequencer_v17_00;
 
+typedef struct rpc_post_event_v17_00
+{
+    NvHandle   hClient;
+    NvHandle   hEvent;
+    NvU32      notifyIndex;
+    NvU32      data;
+    NvU16      info16;
+    NvU32      status;
+    NvU32      eventDataSize;
+    NvBool     bNotifyList;
+    NvU8       eventData[];
+} rpc_post_event_v17_00;
+
 typedef struct rpc_os_error_log_v17_00
 {
     NvU32      exceptType;
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
index 018e5c3f58d6..2cdea853f265 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/gpu/intr/engine_idx.h
@@ -26,6 +26,8 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#define MC_ENGINE_IDX_DISP                          2
+
 #define MC_ENGINE_IDX_GSP                           49
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h
new file mode 100644
index 000000000000..c8f046bb630f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h
@@ -0,0 +1,31 @@
+#ifndef __src_nvidia_inc_kernel_os_nv_memory_type_h__
+#define __src_nvidia_inc_kernel_os_nv_memory_type_h__
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/535.54.03 */
+
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2020 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
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
+#define NV_MEMORY_WRITECOMBINED      2
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index 097246e10cdb..14da22fa3b5b 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -36,6 +36,7 @@ int
 nvif_disp_ctor(struct nvif_device *device, const char *name, s32 oclass, struct nvif_disp *disp)
 {
 	static const struct nvif_mclass disps[] = {
+		{ AD102_DISP, 0 },
 		{ GA102_DISP, 0 },
 		{ TU102_DISP, 0 },
 		{ GV100_DISP, 0 },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index fc2d896f71ce..1db2ad25f504 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2758,6 +2758,8 @@ nv192_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ad102_disp_new },
+	.dma      = { 0x00000001, gv100_dma_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2775,6 +2777,8 @@ nv193_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ad102_disp_new },
+	.dma      = { 0x00000001, gv100_dma_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2792,6 +2796,8 @@ nv194_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ad102_disp_new },
+	.dma      = { 0x00000001, gv100_dma_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2809,6 +2815,8 @@ nv196_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ad102_disp_new },
+	.dma      = { 0x00000001, gv100_dma_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
@@ -2826,6 +2834,8 @@ nv197_chipset = {
 	.pci      = { 0x00000001, gp100_pci_new },
 	.timer    = { 0x00000001, gk20a_timer_new },
 	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ad102_disp_new },
+	.dma      = { 0x00000001, gv100_dma_new },
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
index e1aecd3fe96c..e346e924fee8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
@@ -27,6 +27,9 @@ nvkm-y += nvkm/engine/disp/gp102.o
 nvkm-y += nvkm/engine/disp/gv100.o
 nvkm-y += nvkm/engine/disp/tu102.o
 nvkm-y += nvkm/engine/disp/ga102.o
+nvkm-y += nvkm/engine/disp/ad102.o
+
+nvkm-y += nvkm/engine/disp/r535.o
 
 nvkm-y += nvkm/engine/disp/udisp.o
 nvkm-y += nvkm/engine/disp/uconn.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
new file mode 100644
index 000000000000..7f300a79aa29
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
@@ -0,0 +1,52 @@
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
+#include "chan.h"
+
+#include <subdev/gsp.h>
+
+#include <nvif/class.h>
+
+static const struct nvkm_disp_func
+ad102_disp = {
+	.uevent = &gv100_disp_chan_uevent,
+	.ramht_size = 0x2000,
+	.root = {  0, 0,AD102_DISP },
+	.user = {
+		{{-1,-1,GV100_DISP_CAPS                  }, gv100_disp_caps_new },
+		{{ 0, 0,GA102_DISP_CURSOR                }, nvkm_disp_chan_new, &gv100_disp_curs },
+		{{ 0, 0,GA102_DISP_WINDOW_IMM_CHANNEL_DMA}, nvkm_disp_wndw_new, &gv100_disp_wimm },
+		{{ 0, 0,AD102_DISP_CORE_CHANNEL_DMA      }, nvkm_disp_core_new, &gv100_disp_core },
+		{{ 0, 0,GA102_DISP_WINDOW_CHANNEL_DMA    }, nvkm_disp_wndw_new, &gv100_disp_wndw },
+		{}
+	},
+};
+
+int
+ad102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	       struct nvkm_disp **pdisp)
+{
+	if (nvkm_gsp_rm(device->gsp))
+		return r535_disp_new(&ad102_disp, device, type, inst, pdisp);
+
+	return -ENODEV;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index 7356e20e5770..457ec5db794d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -137,7 +137,8 @@ nvkm_disp_init(struct nvkm_engine *engine)
 	 * each output resource to 'fully enabled'.
 	 */
 	list_for_each_entry(ior, &disp->iors, head) {
-		ior->func->power(ior, true, true, true, true, true);
+		if (ior->func->power)
+			ior->func->power(ior, true, true, true, true, true);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
index 398336ffb685..020290510157 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.h
@@ -22,6 +22,10 @@ struct nvkm_disp_chan {
 	u64 push;
 
 	u32 suspend_put;
+
+	struct {
+		struct nvkm_gsp_object object;
+	} rm;
 };
 
 int nvkm_disp_core_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
index d632c09d962e..ab0a85c92430 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
@@ -149,7 +149,7 @@ ga102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_disp **pdisp)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_disp_new(&ga102_disp, device, type, inst, pdisp);
 
 	return nvkm_disp_new_(&ga102_disp, device, type, inst, pdisp);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 9fde83fe2e2f..cfa3698d3a2f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -96,7 +96,7 @@ gv100_sor_dp = {
 	.watermark = gv100_sor_dp_watermark,
 };
 
-static void
+void
 gv100_sor_hdmi_infoframe_vsi(struct nvkm_ior *ior, int head, void *data, u32 size)
 {
 	struct nvkm_device *device = ior->disp->engine.subdev.device;
@@ -120,7 +120,7 @@ gv100_sor_hdmi_infoframe_vsi(struct nvkm_ior *ior, int head, void *data, u32 siz
 	nvkm_mask(device, 0x6f0100 + hoff, 0x00000001, 0x00000001);
 }
 
-static void
+void
 gv100_sor_hdmi_infoframe_avi(struct nvkm_ior *ior, int head, void *data, u32 size)
 {
 	struct nvkm_device *device = ior->disp->engine.subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 9beb9d1e8633..3ba04bead2f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -187,6 +187,8 @@ int gp100_sor_new(struct nvkm_disp *, int);
 int gv100_sor_cnt(struct nvkm_disp *, unsigned long *);
 void gv100_sor_state(struct nvkm_ior *, struct nvkm_ior_state *);
 extern const struct nvkm_ior_func_hdmi gv100_sor_hdmi;
+void gv100_sor_hdmi_infoframe_avi(struct nvkm_ior *, int, void *, u32);
+void gv100_sor_hdmi_infoframe_vsi(struct nvkm_ior *, int, void *, u32);
 void gv100_sor_dp_audio(struct nvkm_ior *, int, bool);
 void gv100_sor_dp_audio_sym(struct nvkm_ior *, int, u16, u32);
 void gv100_sor_dp_watermark(struct nvkm_ior *, int, u8);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index bfb2a4db8d64..28adc5a30f2f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -386,7 +386,8 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 	outp->disp = disp;
 	outp->index = index;
 	outp->info = *dcbE;
-	outp->i2c = nvkm_i2c_bus_find(i2c, dcbE->i2c_index);
+	if (!disp->rm.client.gsp)
+		outp->i2c = nvkm_i2c_bus_find(i2c, dcbE->i2c_index);
 
 	OUTP_DBG(outp, "type %02x loc %d or %d link %d con %x "
 		       "edid %x bus %d head %x",
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 13ef71f428b8..a3fd7cb7c488 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -8,6 +8,9 @@ struct nvkm_head;
 struct nvkm_outp;
 struct dcb_output;
 
+int r535_disp_new(const struct nvkm_disp_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
+		  struct nvkm_disp **);
+
 int nvkm_disp_ctor(const struct nvkm_disp_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		   struct nvkm_disp *);
 int nvkm_disp_new_(const struct nvkm_disp_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
new file mode 100644
index 000000000000..6c54c473bb6d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -0,0 +1,1671 @@
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
+#include "chan.h"
+#include "conn.h"
+#include "dp.h"
+#include "head.h"
+#include "ior.h"
+#include "outp.h"
+
+#include <core/ramht.h>
+#include <subdev/bios.h>
+#include <subdev/bios/conn.h>
+#include <subdev/gsp.h>
+#include <subdev/mmu.h>
+#include <subdev/vfn.h>
+
+#include <nvhw/drf.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080_notification.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dfp.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073dp.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073specific.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl0073/ctrl0073system.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.54.03/nvidia/generated/g_allclasses.h>
+#include <nvrm/535.54.03/nvidia/generated/g_mem_desc_nvoc.h>
+#include <nvrm/535.54.03/nvidia/inc/kernel/os/nv_memory_type.h>
+
+#include <linux/acpi.h>
+
+static u64
+r535_chan_user(struct nvkm_disp_chan *chan, u64 *psize)
+{
+	switch (chan->object.oclass & 0xff) {
+	case 0x7d: *psize = 0x10000; return 0x680000;
+	case 0x7e: *psize = 0x01000; return 0x690000 + (chan->head * *psize);
+	case 0x7b: *psize = 0x01000; return 0x6b0000 + (chan->head * *psize);
+	case 0x7a: *psize = 0x01000; return 0x6d8000 + (chan->head * *psize);
+	default:
+		BUG_ON(1);
+		break;
+	}
+
+	return 0ULL;
+}
+
+static void
+r535_chan_intr(struct nvkm_disp_chan *chan, bool en)
+{
+}
+
+static void
+r535_chan_fini(struct nvkm_disp_chan *chan)
+{
+	nvkm_gsp_rm_free(&chan->rm.object);
+}
+
+static int
+r535_chan_push(struct nvkm_disp_chan *chan)
+{
+	struct nvkm_gsp *gsp = chan->disp->engine.subdev.device->gsp;
+	NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	if (chan->memory) {
+		switch (nvkm_memory_target(chan->memory)) {
+		case NVKM_MEM_TARGET_NCOH:
+			ctrl->addressSpace = ADDR_SYSMEM;
+			ctrl->cacheSnoop = 0;
+			break;
+		case NVKM_MEM_TARGET_HOST:
+			ctrl->addressSpace = ADDR_SYSMEM;
+			ctrl->cacheSnoop = 1;
+			break;
+		case NVKM_MEM_TARGET_VRAM:
+			ctrl->addressSpace = ADDR_FBMEM;
+			break;
+		default:
+			WARN_ON(1);
+			return -EINVAL;
+		}
+
+		ctrl->physicalAddr = nvkm_memory_addr(chan->memory);
+		ctrl->limit = nvkm_memory_size(chan->memory) - 1;
+	}
+
+	ctrl->hclass = chan->object.oclass;
+	ctrl->channelInstance = chan->head;
+	ctrl->valid = ((chan->object.oclass & 0xff) != 0x7a) ? 1 : 0;
+
+	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+}
+
+static int
+r535_curs_init(struct nvkm_disp_chan *chan)
+{
+	NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS *args;
+	int ret;
+
+	ret = r535_chan_push(chan);
+	if (ret)
+		return ret;
+
+	args = nvkm_gsp_rm_alloc_get(&chan->disp->rm.object,
+				     (chan->object.oclass << 16) | chan->head,
+				     chan->object.oclass, sizeof(*args), &chan->rm.object);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->channelInstance = chan->head;
+
+	return nvkm_gsp_rm_alloc_wr(&chan->rm.object, args);
+}
+
+static const struct nvkm_disp_chan_func
+r535_curs_func = {
+	.init = r535_curs_init,
+	.fini = r535_chan_fini,
+	.intr = r535_chan_intr,
+	.user = r535_chan_user,
+};
+
+static const struct nvkm_disp_chan_user
+r535_curs = {
+	.func = &r535_curs_func,
+	.user = 73,
+};
+
+static int
+r535_dmac_bind(struct nvkm_disp_chan *chan, struct nvkm_object *object, u32 handle)
+{
+	return nvkm_ramht_insert(chan->disp->ramht, object, chan->chid.user, -9, handle,
+				 chan->chid.user << 25 |
+				 (chan->disp->rm.client.object.handle & 0x3fff));
+}
+
+static void
+r535_dmac_fini(struct nvkm_disp_chan *chan)
+{
+	struct nvkm_device *device = chan->disp->engine.subdev.device;
+	const u32 uoff = (chan->chid.user - 1) * 0x1000;
+
+	chan->suspend_put = nvkm_rd32(device, 0x690000 + uoff);
+	r535_chan_fini(chan);
+}
+
+static int
+r535_dmac_init(struct nvkm_disp_chan *chan)
+{
+	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
+	int ret;
+
+	ret = r535_chan_push(chan);
+	if (ret)
+		return ret;
+
+	args = nvkm_gsp_rm_alloc_get(&chan->disp->rm.object,
+				     (chan->object.oclass << 16) | chan->head,
+				     chan->object.oclass, sizeof(*args), &chan->rm.object);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->channelInstance = chan->head;
+	args->offset = chan->suspend_put;
+
+	return nvkm_gsp_rm_alloc_wr(&chan->rm.object, args);
+}
+
+static int
+r535_dmac_push(struct nvkm_disp_chan *chan, u64 memory)
+{
+	chan->memory = nvkm_umem_search(chan->object.client, memory);
+	if (IS_ERR(chan->memory))
+		return PTR_ERR(chan->memory);
+
+	return 0;
+}
+
+static const struct nvkm_disp_chan_func
+r535_dmac_func = {
+	.push = r535_dmac_push,
+	.init = r535_dmac_init,
+	.fini = r535_dmac_fini,
+	.intr = r535_chan_intr,
+	.user = r535_chan_user,
+	.bind = r535_dmac_bind,
+};
+
+static const struct nvkm_disp_chan_func
+r535_wimm_func = {
+	.push = r535_dmac_push,
+	.init = r535_dmac_init,
+	.fini = r535_dmac_fini,
+	.intr = r535_chan_intr,
+	.user = r535_chan_user,
+};
+
+static const struct nvkm_disp_chan_user
+r535_wimm = {
+	.func = &r535_wimm_func,
+	.user = 33,
+};
+
+static const struct nvkm_disp_chan_user
+r535_wndw = {
+	.func = &r535_dmac_func,
+	.user = 1,
+};
+
+static void
+r535_core_fini(struct nvkm_disp_chan *chan)
+{
+	struct nvkm_device *device = chan->disp->engine.subdev.device;
+
+	chan->suspend_put = nvkm_rd32(device, 0x680000);
+	r535_chan_fini(chan);
+}
+
+static const struct nvkm_disp_chan_func
+r535_core_func = {
+	.push = r535_dmac_push,
+	.init = r535_dmac_init,
+	.fini = r535_core_fini,
+	.intr = r535_chan_intr,
+	.user = r535_chan_user,
+	.bind = r535_dmac_bind,
+};
+
+static const struct nvkm_disp_chan_user
+r535_core = {
+	.func = &r535_core_func,
+	.user = 0,
+};
+
+static int
+r535_sor_bl_set(struct nvkm_ior *sor, int lvl)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+	ctrl->brightness = lvl;
+
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
+static int
+r535_sor_bl_get(struct nvkm_ior *sor)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS *ctrl;
+	int lvl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	lvl = ctrl->brightness;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return lvl;
+}
+
+static const struct nvkm_ior_func_bl
+r535_sor_bl = {
+	.get = r535_sor_bl_get,
+	.set = r535_sor_bl_set,
+};
+
+static void
+r535_sor_hda_eld(struct nvkm_ior *sor, int head, u8 *data, u8 size)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS *ctrl;
+
+	if (WARN_ON(size > sizeof(ctrl->bufferELD)))
+		return;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DFP_SET_ELD_AUDIO_CAPS, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+	ctrl->numELDSize = size;
+	memcpy(ctrl->bufferELD, data, size);
+	ctrl->maxFreqSupported = 0; //XXX
+	ctrl->ctrl  = NVDEF(NV0073, CTRL_DFP_ELD_AUDIO_CAPS_CTRL, PD, TRUE);
+	ctrl->ctrl |= NVDEF(NV0073, CTRL_DFP_ELD_AUDIO_CAPS_CTRL, ELDV, TRUE);
+	ctrl->deviceEntry = head;
+
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static void
+r535_sor_hda_hpd(struct nvkm_ior *sor, int head, bool present)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_DFP_SET_ELD_AUDIO_CAP_PARAMS *ctrl;
+
+	if (present)
+		return;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DFP_SET_ELD_AUDIO_CAPS, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+	ctrl->deviceEntry = head;
+
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static const struct nvkm_ior_func_hda
+r535_sor_hda = {
+	.hpd = r535_sor_hda_hpd,
+	.eld = r535_sor_hda_eld,
+};
+
+static void
+r535_sor_dp_audio_mute(struct nvkm_ior *sor, bool mute)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_SET_AUDIO_MUTESTREAM, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+	ctrl->mute = mute;
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static void
+r535_sor_dp_audio(struct nvkm_ior *sor, int head, bool enable)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_DFP_SET_AUDIO_ENABLE_PARAMS *ctrl;
+
+	if (!enable)
+		r535_sor_dp_audio_mute(sor, true);
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DFP_SET_AUDIO_ENABLE, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+	ctrl->enable = enable;
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+
+	if (enable)
+		r535_sor_dp_audio_mute(sor, false);
+}
+
+static void
+r535_sor_dp_vcpi(struct nvkm_ior *sor, int head, u8 slot, u8 slot_nr, u16 pbn, u16 aligned_pbn)
+{
+	struct nvkm_disp *disp = sor->disp;
+	struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->head = head;
+	ctrl->sorIndex = sor->id;
+	ctrl->dpLink = sor->asy.link == 2;
+	ctrl->bEnableOverride = 1;
+	ctrl->bMST = 1;
+	ctrl->hBlankSym = 0;
+	ctrl->vBlankSym = 0;
+	ctrl->colorFormat = 0;
+	ctrl->bEnableTwoHeadOneOr = 0;
+	ctrl->singleHeadMultistreamMode = 0;
+	ctrl->MST.slotStart = slot;
+	ctrl->MST.slotEnd = slot + slot_nr - 1;
+	ctrl->MST.PBN = pbn;
+	ctrl->MST.Timeslice = aligned_pbn;
+	ctrl->MST.sendACT = 0;
+	ctrl->MST.singleHeadMSTPipeline = 0;
+	ctrl->MST.bEnableAudioOverRightPanel = 0;
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static int
+r535_sor_dp_sst(struct nvkm_ior *sor, int head, bool ef,
+		u32 watermark, u32 hblanksym, u32 vblanksym)
+{
+	struct nvkm_disp *disp = sor->disp;
+	struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_CONFIG_STREAM, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->head = head;
+	ctrl->sorIndex = sor->id;
+	ctrl->dpLink = sor->asy.link == 2;
+	ctrl->bEnableOverride = 1;
+	ctrl->bMST = 0;
+	ctrl->hBlankSym = hblanksym;
+	ctrl->vBlankSym = vblanksym;
+	ctrl->colorFormat = 0;
+	ctrl->bEnableTwoHeadOneOr = 0;
+	ctrl->SST.bEnhancedFraming = ef;
+	ctrl->SST.tuSize = 64;
+	ctrl->SST.waterMark = watermark;
+	ctrl->SST.bEnableAudioOverRightPanel = 0;
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
+static const struct nvkm_ior_func_dp
+r535_sor_dp = {
+	.sst = r535_sor_dp_sst,
+	.vcpi = r535_sor_dp_vcpi,
+	.audio = r535_sor_dp_audio,
+};
+
+static void
+r535_sor_hdmi_scdc(struct nvkm_ior *sor, u32 khz, bool support, bool scrambling,
+		   bool scrambling_low_rates)
+{
+	struct nvkm_outp *outp = sor->asy.outp;
+	struct nvkm_disp *disp = outp->disp;
+	NV0073_CTRL_SPECIFIC_SET_HDMI_SINK_CAPS_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_SINK_CAPS, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(outp->index);
+	ctrl->caps = 0;
+	if (support)
+		ctrl->caps |= NVDEF(NV0073_CTRL_CMD_SPECIFIC, SET_HDMI_SINK_CAPS, SCDC_SUPPORTED, TRUE);
+	if (scrambling)
+		ctrl->caps |= NVDEF(NV0073_CTRL_CMD_SPECIFIC, SET_HDMI_SINK_CAPS, GT_340MHZ_CLOCK_SUPPORTED, TRUE);
+	if (scrambling_low_rates)
+		ctrl->caps |= NVDEF(NV0073_CTRL_CMD_SPECIFIC, SET_HDMI_SINK_CAPS, LTE_340MHZ_SCRAMBLING_SUPPORTED, TRUE);
+
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static void
+r535_sor_hdmi_ctrl_audio_mute(struct nvkm_outp *outp, bool mute)
+{
+	struct nvkm_disp *disp = outp->disp;
+	NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_AUDIO_MUTESTREAM, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(outp->index);
+	ctrl->mute = mute;
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static void
+r535_sor_hdmi_ctrl_audio(struct nvkm_outp *outp, bool enable)
+{
+	struct nvkm_disp *disp = outp->disp;
+	NV0073_CTRL_SPECIFIC_SET_OD_PACKET_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_SET_OD_PACKET, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(outp->index);
+	ctrl->transmitControl =
+		NVDEF(NV0073_CTRL_SPECIFIC, SET_OD_PACKET_TRANSMIT_CONTROL, ENABLE, YES) |
+		NVDEF(NV0073_CTRL_SPECIFIC, SET_OD_PACKET_TRANSMIT_CONTROL, OTHER_FRAME, DISABLE) |
+		NVDEF(NV0073_CTRL_SPECIFIC, SET_OD_PACKET_TRANSMIT_CONTROL, SINGLE_FRAME, DISABLE) |
+		NVDEF(NV0073_CTRL_SPECIFIC, SET_OD_PACKET_TRANSMIT_CONTROL, ON_HBLANK, DISABLE) |
+		NVDEF(NV0073_CTRL_SPECIFIC, SET_OD_PACKET_TRANSMIT_CONTROL, VIDEO_FMT, SW_CONTROLLED) |
+		NVDEF(NV0073_CTRL_SPECIFIC, SET_OD_PACKET_TRANSMIT_CONTROL, RESERVED_LEGACY_MODE, NO);
+	ctrl->packetSize = 10;
+	ctrl->aPacket[0] = 0x03;
+	ctrl->aPacket[1] = 0x00;
+	ctrl->aPacket[2] = 0x00;
+	ctrl->aPacket[3] = enable ? 0x10 : 0x01;
+	ctrl->aPacket[4] = 0x00;
+	ctrl->aPacket[5] = 0x00;
+	ctrl->aPacket[6] = 0x00;
+	ctrl->aPacket[7] = 0x00;
+	ctrl->aPacket[8] = 0x00;
+	ctrl->aPacket[9] = 0x00;
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static void
+r535_sor_hdmi_audio(struct nvkm_ior *sor, int head, bool enable)
+{
+	struct nvkm_device *device = sor->disp->engine.subdev.device;
+	const u32 hdmi = head * 0x400;
+
+	r535_sor_hdmi_ctrl_audio(sor->asy.outp, enable);
+	r535_sor_hdmi_ctrl_audio_mute(sor->asy.outp, !enable);
+
+	/* General Control (GCP). */
+	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000000);
+	nvkm_wr32(device, 0x6f00cc + hdmi, !enable ? 0x00000001 : 0x00000010);
+	nvkm_mask(device, 0x6f00c0 + hdmi, 0x00000001, 0x00000001);
+}
+
+static void
+r535_sor_hdmi_ctrl(struct nvkm_ior *sor, int head, bool enable, u8 max_ac_packet, u8 rekey)
+{
+	struct nvkm_disp *disp = sor->disp;
+	NV0073_CTRL_SPECIFIC_SET_HDMI_ENABLE_PARAMS *ctrl;
+
+	if (!enable)
+		return;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_SET_HDMI_ENABLE, sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return;
+
+	ctrl->displayId = BIT(sor->asy.outp->index);
+	ctrl->enable = enable;
+
+	WARN_ON(nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl));
+}
+
+static const struct nvkm_ior_func_hdmi
+r535_sor_hdmi = {
+	.ctrl = r535_sor_hdmi_ctrl,
+	.scdc = r535_sor_hdmi_scdc,
+	/*TODO: SF_USER -> KMS. */
+	.infoframe_avi = gv100_sor_hdmi_infoframe_avi,
+	.infoframe_vsi = gv100_sor_hdmi_infoframe_vsi,
+	.audio = r535_sor_hdmi_audio,
+};
+
+static const struct nvkm_ior_func
+r535_sor = {
+	.hdmi = &r535_sor_hdmi,
+	.dp = &r535_sor_dp,
+	.hda = &r535_sor_hda,
+	.bl = &r535_sor_bl,
+};
+
+static int
+r535_sor_new(struct nvkm_disp *disp, int id)
+{
+	return nvkm_ior_new_(&r535_sor, disp, SOR, id, true/*XXX: hda cap*/);
+}
+
+static int
+r535_sor_cnt(struct nvkm_disp *disp, unsigned long *pmask)
+{
+	*pmask = 0xf;
+	return 4;
+}
+
+static void
+r535_head_vblank_put(struct nvkm_head *head)
+{
+	struct nvkm_device *device = head->disp->engine.subdev.device;
+
+	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000000);
+}
+
+static void
+r535_head_vblank_get(struct nvkm_head *head)
+{
+	struct nvkm_device *device = head->disp->engine.subdev.device;
+
+	nvkm_wr32(device, 0x611800 + (head->id * 4), 0x00000002);
+	nvkm_mask(device, 0x611d80 + (head->id * 4), 0x00000002, 0x00000002);
+}
+
+static void
+r535_head_state(struct nvkm_head *head, struct nvkm_head_state *state)
+{
+}
+
+static const struct nvkm_head_func
+r535_head = {
+	.state = r535_head_state,
+	.vblank_get = r535_head_vblank_get,
+	.vblank_put = r535_head_vblank_put,
+};
+
+static struct nvkm_conn *
+r535_conn_new(struct nvkm_disp *disp, u32 id)
+{
+	NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS *ctrl;
+	struct nvbios_connE dcbE = {};
+	struct nvkm_conn *conn;
+	int ret, index;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return (void *)ctrl;
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(id);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return (void *)ctrl;
+
+	list_for_each_entry(conn, &disp->conns, head) {
+		if (conn->index == ctrl->data[0].index) {
+			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+			return conn;
+		}
+	}
+
+	dcbE.type = ctrl->data[0].type;
+	index = ctrl->data[0].index;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+	ret = nvkm_conn_new(disp, index, &dcbE, &conn);
+	if (ret)
+		return ERR_PTR(ret);
+
+	list_add_tail(&conn->head, &disp->conns);
+	return conn;
+}
+
+static void
+r535_outp_release(struct nvkm_outp *outp)
+{
+	outp->disp->rm.assigned_sors &= ~BIT(outp->ior->id);
+	outp->ior->asy.outp = NULL;
+	outp->ior = NULL;
+}
+
+static int
+r535_outp_acquire(struct nvkm_outp *outp, bool hda)
+{
+	struct nvkm_disp *disp = outp->disp;
+	struct nvkm_ior *ior;
+	NV0073_CTRL_DFP_ASSIGN_SOR_PARAMS *ctrl;
+	int or;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DFP_ASSIGN_SOR, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(outp->index);
+	ctrl->sorExcludeMask = disp->rm.assigned_sors;
+	if (hda)
+		ctrl->flags |= NVDEF(NV0073_CTRL, DFP_ASSIGN_SOR_FLAGS, AUDIO, OPTIMAL);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	for (or = 0; or < ARRAY_SIZE(ctrl->sorAssignListWithTag); or++) {
+		if (ctrl->sorAssignListWithTag[or].displayMask & BIT(outp->index)) {
+			disp->rm.assigned_sors |= BIT(or);
+			break;
+		}
+	}
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+	if (WARN_ON(or == ARRAY_SIZE(ctrl->sorAssignListWithTag)))
+		return -EINVAL;
+
+	ior = nvkm_ior_find(disp, SOR, or);
+	if (WARN_ON(!ior))
+		return -EINVAL;
+
+	nvkm_outp_acquire_ior(outp, NVKM_OUTP_USER, ior);
+	return 0;
+}
+
+static int
+r535_disp_head_displayid(struct nvkm_disp *disp, int head, u32 *displayid)
+{
+	NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->head = head;
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*displayid = ctrl->displayId;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
+static struct nvkm_ior *
+r535_outp_inherit(struct nvkm_outp *outp)
+{
+	struct nvkm_disp *disp = outp->disp;
+	struct nvkm_head *head;
+	u32 displayid;
+	int ret;
+
+	list_for_each_entry(head, &disp->heads, head) {
+		ret = r535_disp_head_displayid(disp, head->id, &displayid);
+		if (WARN_ON(ret))
+			return NULL;
+
+		if (displayid == BIT(outp->index)) {
+			NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS *ctrl;
+			u32 id, proto;
+			struct nvkm_ior *ior;
+
+			ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+						    NV0073_CTRL_CMD_SPECIFIC_OR_GET_INFO,
+						    sizeof(*ctrl));
+			if (IS_ERR(ctrl))
+				return NULL;
+
+			ctrl->subDeviceInstance = 0;
+			ctrl->displayId = displayid;
+
+			ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+			if (IS_ERR(ctrl))
+				return NULL;
+
+			id = ctrl->index;
+			proto = ctrl->protocol;
+			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+			ior = nvkm_ior_find(disp, SOR, id);
+			if (WARN_ON(!ior))
+				return NULL;
+
+			switch (proto) {
+			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_A:
+				ior->arm.proto = TMDS;
+				ior->arm.link = 1;
+				break;
+			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_B:
+				ior->arm.proto = TMDS;
+				ior->arm.link = 2;
+				break;
+			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DUAL_TMDS:
+				ior->arm.proto = TMDS;
+				ior->arm.link = 3;
+				break;
+			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_A:
+				ior->arm.proto = DP;
+				ior->arm.link = 1;
+				break;
+			case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_B:
+				ior->arm.proto = DP;
+				ior->arm.link = 2;
+				break;
+			default:
+				WARN_ON(1);
+				return NULL;
+			}
+
+			ior->arm.proto_evo = proto;
+			ior->arm.head = BIT(head->id);
+			disp->rm.assigned_sors |= BIT(ior->id);
+			return ior;
+		}
+	}
+
+	return NULL;
+}
+
+static int
+r535_outp_dfp_get_info(struct nvkm_outp *outp)
+{
+	NV0073_CTRL_DFP_GET_INFO_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DFP_GET_INFO, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(outp->index);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	nvkm_debug(&disp->engine.subdev, "DFP %08x: flags:%08x flags2:%08x\n",
+		   ctrl->displayId, ctrl->flags, ctrl->flags2);
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
+static int
+r535_outp_detect(struct nvkm_outp *outp)
+{
+	NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayMask = BIT(outp->index);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	if (ctrl->displayMask & BIT(outp->index)) {
+		ret = r535_outp_dfp_get_info(outp);
+		if (ret == 0)
+			ret = 1;
+	} else {
+		ret = 0;
+	}
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
+
+static int
+r535_dp_mst_id_put(struct nvkm_outp *outp, u32 id)
+{
+	NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_TOPOLOGY_FREE_DISPLAYID, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = id;
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
+static int
+r535_dp_mst_id_get(struct nvkm_outp *outp, u32 *pid)
+{
+	NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_TOPOLOGY_ALLOCATE_DISPLAYID,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(outp->index);
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*pid = ctrl->displayIdAssigned;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
+static int
+r535_dp_drive(struct nvkm_outp *outp, u8 lanes, u8 pe[4], u8 vs[4])
+{
+	NV0073_CTRL_DP_LANE_DATA_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_SET_LANE_DATA, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(outp->index);
+	ctrl->numLanes = lanes;
+	for (int i = 0; i < lanes; i++)
+		ctrl->data[i] = NVVAL(NV0073_CTRL, DP_LANE_DATA,  PREEMPHASIS, pe[i]) |
+				NVVAL(NV0073_CTRL, DP_LANE_DATA, DRIVECURRENT, vs[i]);
+
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
+static int
+r535_dp_train_target(struct nvkm_outp *outp, u8 target, bool mst, u8 link_nr, u8 link_bw)
+{
+	struct nvkm_disp *disp = outp->disp;
+	NV0073_CTRL_DP_CTRL_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_CTRL, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(outp->index);
+	ctrl->cmd = NVDEF(NV0073_CTRL, DP_CMD, SET_LANE_COUNT, TRUE) |
+		    NVDEF(NV0073_CTRL, DP_CMD, SET_LINK_BW, TRUE) |
+		    NVDEF(NV0073_CTRL, DP_CMD, TRAIN_PHY_REPEATER, YES);
+	ctrl->data = NVVAL(NV0073_CTRL, DP_DATA, SET_LANE_COUNT, link_nr) |
+		     NVVAL(NV0073_CTRL, DP_DATA, SET_LINK_BW, link_bw) |
+		     NVVAL(NV0073_CTRL, DP_DATA, TARGET, target);
+
+	if (mst)
+		ctrl->cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_FORMAT_MODE, MULTI_STREAM);
+
+	if (outp->dp.dpcd[DPCD_RC02] & DPCD_RC02_ENHANCED_FRAME_CAP)
+		ctrl->cmd |= NVDEF(NV0073_CTRL, DP_CMD, SET_ENHANCED_FRAMING, TRUE);
+
+	if (target == 0 &&
+	     (outp->dp.dpcd[DPCD_RC02] & 0x20) &&
+	    !(outp->dp.dpcd[DPCD_RC03] & DPCD_RC03_TPS4_SUPPORTED))
+	    ctrl->cmd |= NVDEF(NV0073_CTRL, DP_CMD, POST_LT_ADJ_REQ_GRANTED, YES);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ret = ctrl->err ? -EIO : 0;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
+
+static int
+r535_dp_train(struct nvkm_outp *outp, bool retrain)
+{
+	for (int target = outp->dp.lttprs; target >= 0; target--) {
+		int ret = r535_dp_train_target(outp, target, outp->dp.lt.mst,
+							     outp->dp.lt.nr,
+							     outp->dp.lt.bw);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int
+r535_dp_rates(struct nvkm_outp *outp)
+{
+	NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+
+	if (outp->conn->info.type != DCB_CONNECTOR_eDP ||
+	    !outp->dp.rates || outp->dp.rate[0].dpcd < 0)
+		return 0;
+
+	if (WARN_ON(outp->dp.rates > ARRAY_SIZE(ctrl->linkRateTbl)))
+		return -EINVAL;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(outp->index);
+	for (int i = 0; i < outp->dp.rates; i++)
+		ctrl->linkRateTbl[outp->dp.rate[i].dpcd] = outp->dp.rate[i].rate * 10 / 200;
+
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
+static int
+r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
+{
+	struct nvkm_disp *disp = outp->disp;
+	NV0073_CTRL_DP_AUXCH_CTRL_PARAMS *ctrl;
+	u8 size = *psize;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_AUXCH_CTRL, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(outp->index);
+	ctrl->bAddrOnly = !size;
+	ctrl->cmd = type;
+	if (ctrl->bAddrOnly) {
+		ctrl->cmd = NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD, REQ_TYPE, WRITE);
+		ctrl->cmd = NVDEF_SET(ctrl->cmd, NV0073_CTRL, DP_AUXCH_CMD,  I2C_MOT, FALSE);
+	}
+	ctrl->addr = addr;
+	ctrl->size = !ctrl->bAddrOnly ? (size - 1) : 0;
+	memcpy(ctrl->data, data, size);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	memcpy(data, ctrl->data, size);
+	*psize = ctrl->size;
+	ret = ctrl->replyType;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
+
+static int
+r535_dp_aux_pwr(struct nvkm_outp *outp, bool pu)
+{
+	return 0;
+}
+
+static void
+r535_dp_release(struct nvkm_outp *outp)
+{
+	if (!outp->dp.lt.bw) {
+		if (!WARN_ON(!outp->dp.rates))
+			outp->dp.lt.bw = outp->dp.rate[0].rate / 27000;
+		else
+			outp->dp.lt.bw = 0x06;
+	}
+
+	outp->dp.lt.nr = 0;
+
+	r535_dp_train_target(outp, 0, outp->dp.lt.mst, outp->dp.lt.nr, outp->dp.lt.bw);
+	r535_outp_release(outp);
+}
+
+static int
+r535_dp_acquire(struct nvkm_outp *outp, bool hda)
+{
+	int ret;
+
+	ret = r535_outp_acquire(outp, hda);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct nvkm_outp_func
+r535_dp = {
+	.detect = r535_outp_detect,
+	.inherit = r535_outp_inherit,
+	.acquire = r535_dp_acquire,
+	.release = r535_dp_release,
+	.dp.aux_pwr = r535_dp_aux_pwr,
+	.dp.aux_xfer = r535_dp_aux_xfer,
+	.dp.mst_id_get = r535_dp_mst_id_get,
+	.dp.mst_id_put = r535_dp_mst_id_put,
+	.dp.rates = r535_dp_rates,
+	.dp.train = r535_dp_train,
+	.dp.drive = r535_dp_drive,
+};
+
+static int
+r535_tmds_edid_get(struct nvkm_outp *outp, u8 *data, u16 *psize)
+{
+	NV0073_CTRL_SPECIFIC_GET_EDID_V2_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+	int ret = -E2BIG;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_GET_EDID_V2, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(outp->index);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	if (ctrl->bufferSize <= *psize) {
+		memcpy(data, ctrl->edidBuffer, ctrl->bufferSize);
+		*psize = ctrl->bufferSize;
+		ret = 0;
+	}
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
+
+static const struct nvkm_outp_func
+r535_tmds = {
+	.detect = r535_outp_detect,
+	.inherit = r535_outp_inherit,
+	.acquire = r535_outp_acquire,
+	.release = r535_outp_release,
+	.edid_get = r535_tmds_edid_get,
+};
+
+static int
+r535_outp_new(struct nvkm_disp *disp, u32 id)
+{
+	NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS *ctrl;
+	enum nvkm_ior_proto proto;
+	struct dcb_output dcbE = {};
+	struct nvkm_conn *conn;
+	struct nvkm_outp *outp;
+	u8 locn, link = 0;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SPECIFIC_OR_GET_INFO, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayId = BIT(id);
+
+	ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	switch (ctrl->type) {
+	case NV0073_CTRL_SPECIFIC_OR_TYPE_NONE:
+		return 0;
+	case NV0073_CTRL_SPECIFIC_OR_TYPE_SOR:
+		switch (ctrl->protocol) {
+		case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_A:
+			proto = TMDS;
+			link = 1;
+			break;
+		case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_SINGLE_TMDS_B:
+			proto = TMDS;
+			link = 2;
+			break;
+		case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DUAL_TMDS:
+			proto = TMDS;
+			link = 3;
+			break;
+		case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_A:
+			proto = DP;
+			link = 1;
+			break;
+		case NV0073_CTRL_SPECIFIC_OR_PROTOCOL_SOR_DP_B:
+			proto = DP;
+			link = 2;
+			break;
+		default:
+			WARN_ON(1);
+			return -EINVAL;
+		}
+
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	locn = ctrl->location;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+	conn = r535_conn_new(disp, id);
+	if (IS_ERR(conn))
+		return PTR_ERR(conn);
+
+	switch (proto) {
+	case TMDS: dcbE.type = DCB_OUTPUT_TMDS; break;
+	case   DP: dcbE.type = DCB_OUTPUT_DP; break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	dcbE.location = locn;
+	dcbE.connector = conn->index;
+	dcbE.heads = disp->head.mask;
+	dcbE.i2c_index = 0xff;
+	dcbE.link = dcbE.sorconf.link = link;
+
+	if (proto == TMDS) {
+		ret = nvkm_outp_new_(&r535_tmds, disp, id, &dcbE, &outp);
+		if (ret)
+			return ret;
+	} else {
+		NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS *ctrl;
+		bool mst, wm;
+
+		ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+					    NV0073_CTRL_CMD_DP_GET_CAPS, sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		ctrl->sorIndex = ~0;
+
+		ctrl = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, ctrl, sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		switch (NVVAL_GET(ctrl->maxLinkRate, NV0073_CTRL_CMD, DP_GET_CAPS, MAX_LINK_RATE)) {
+		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62:
+			dcbE.dpconf.link_bw = 0x06;
+			break;
+		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70:
+			dcbE.dpconf.link_bw = 0x0a;
+			break;
+		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40:
+			dcbE.dpconf.link_bw = 0x14;
+			break;
+		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10:
+			dcbE.dpconf.link_bw = 0x1e;
+			break;
+		default:
+			dcbE.dpconf.link_bw = 0x00;
+			break;
+		}
+
+		mst = ctrl->bIsMultistreamSupported;
+		wm = ctrl->bHasIncreasedWatermarkLimits;
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+		if (WARN_ON(!dcbE.dpconf.link_bw))
+			return -EINVAL;
+
+		dcbE.dpconf.link_nr = 4;
+
+		ret = nvkm_outp_new_(&r535_dp, disp, id, &dcbE, &outp);
+		if (ret)
+			return ret;
+
+		outp->dp.mst = mst;
+		outp->dp.increased_wm = wm;
+	}
+
+
+	outp->conn = conn;
+	list_add_tail(&outp->head, &disp->outps);
+	return 0;
+}
+
+static void
+r535_disp_irq(struct nvkm_gsp_event *event, void *repv, u32 repc)
+{
+	struct nvkm_disp *disp = container_of(event, typeof(*disp), rm.irq);
+	Nv2080DpIrqNotification *irq = repv;
+
+	if (WARN_ON(repc < sizeof(*irq)))
+		return;
+
+	nvkm_debug(&disp->engine.subdev, "event: dp irq displayId %08x\n", irq->displayId);
+
+	if (irq->displayId)
+		nvkm_event_ntfy(&disp->rm.event, fls(irq->displayId) - 1, NVKM_DPYID_IRQ);
+}
+
+static void
+r535_disp_hpd(struct nvkm_gsp_event *event, void *repv, u32 repc)
+{
+	struct nvkm_disp *disp = container_of(event, typeof(*disp), rm.hpd);
+	Nv2080HotplugNotification *hpd = repv;
+
+	if (WARN_ON(repc < sizeof(*hpd)))
+		return;
+
+	nvkm_debug(&disp->engine.subdev, "event: hpd plug %08x unplug %08x\n",
+		   hpd->plugDisplayMask, hpd->unplugDisplayMask);
+
+	for (int i = 0; i < 31; i++) {
+		u32 mask = 0;
+
+		if (hpd->plugDisplayMask & BIT(i))
+			mask |= NVKM_DPYID_PLUG;
+		if (hpd->unplugDisplayMask & BIT(i))
+			mask |= NVKM_DPYID_UNPLUG;
+
+		if (mask)
+			nvkm_event_ntfy(&disp->rm.event, i, mask);
+	}
+}
+
+static const struct nvkm_event_func
+r535_disp_event = {
+};
+
+static void
+r535_disp_intr_head_timing(struct nvkm_disp *disp, int head)
+{
+	struct nvkm_subdev *subdev = &disp->engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 stat = nvkm_rd32(device, 0x611c00 + (head * 0x04));
+
+	if (stat & 0x00000002) {
+		nvkm_disp_vblank(disp, head);
+
+		nvkm_wr32(device, 0x611800 + (head * 0x04), 0x00000002);
+	}
+}
+
+static irqreturn_t
+r535_disp_intr(struct nvkm_inth *inth)
+{
+	struct nvkm_disp *disp = container_of(inth, typeof(*disp), engine.subdev.inth);
+	struct nvkm_subdev *subdev = &disp->engine.subdev;
+	struct nvkm_device *device = subdev->device;
+	unsigned long mask = nvkm_rd32(device, 0x611ec0) & 0x000000ff;
+	int head;
+
+	for_each_set_bit(head, &mask, 8)
+		r535_disp_intr_head_timing(disp, head);
+
+	return IRQ_HANDLED;
+}
+
+static void
+r535_disp_fini(struct nvkm_disp *disp, bool suspend)
+{
+	if (!disp->engine.subdev.use.enabled)
+		return;
+
+	nvkm_gsp_rm_free(&disp->rm.object);
+
+	if (!suspend) {
+		nvkm_gsp_event_dtor(&disp->rm.irq);
+		nvkm_gsp_event_dtor(&disp->rm.hpd);
+		nvkm_event_fini(&disp->rm.event);
+
+		nvkm_gsp_rm_free(&disp->rm.objcom);
+		nvkm_gsp_device_dtor(&disp->rm.device);
+		nvkm_gsp_client_dtor(&disp->rm.client);
+	}
+}
+
+static int
+r535_disp_init(struct nvkm_disp *disp)
+{
+	int ret;
+
+	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, disp->func->root.oclass << 16,
+				disp->func->root.oclass, 0, &disp->rm.object);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int
+r535_disp_oneinit(struct nvkm_disp *disp)
+{
+	struct nvkm_device *device = disp->engine.subdev.device;
+	struct nvkm_gsp *gsp = device->gsp;
+	NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
+	int ret, i;
+
+	/* RAMIN. */
+	ret = nvkm_gpuobj_new(device, 0x10000, 0x10000, false, NULL, &disp->inst);
+	if (ret)
+		return ret;
+
+	if (WARN_ON(nvkm_memory_target(disp->inst->memory) != NVKM_MEM_TARGET_VRAM))
+		return -EINVAL;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->instMemPhysAddr = nvkm_memory_addr(disp->inst->memory);
+	ctrl->instMemSize = nvkm_memory_size(disp->inst->memory);
+	ctrl->instMemAddrSpace = ADDR_FBMEM;
+	ctrl->instMemCpuCacheAttr = NV_MEMORY_WRITECOMBINED;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+	if (ret)
+		return ret;
+
+	/* OBJs. */
+	ret = nvkm_gsp_client_device_ctor(gsp, &disp->rm.client, &disp->rm.device);
+	if (ret)
+		return ret;
+
+	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, 0x00730000, NV04_DISPLAY_COMMON, 0,
+				&disp->rm.objcom);
+	if (ret)
+		return ret;
+
+	{
+		NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
+
+		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+					   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
+					   sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		disp->wndw.mask = ctrl->windowPresentMask;
+		disp->wndw.nr = fls(disp->wndw.mask);
+		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	}
+
+	/* */
+	{
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
+		NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS *ctrl;
+		struct nvkm_gsp_object *subdevice = &disp->rm.client.gsp->internal.device.subdevice;
+
+		ctrl = nvkm_gsp_rm_ctrl_get(subdevice,
+					    NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD,
+					    sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		ctrl->status = 0x56; /* NV_ERR_NOT_SUPPORTED */
+
+		{
+			const guid_t NBCI_DSM_GUID =
+				GUID_INIT(0xD4A50B75, 0x65C7, 0x46F7,
+					  0xBF, 0xB7, 0x41, 0x51, 0x4C, 0xEA, 0x02, 0x44);
+			u64 NBCI_DSM_REV = 0x00000102;
+			const guid_t NVHG_DSM_GUID =
+				GUID_INIT(0x9D95A0A0, 0x0060, 0x4D48,
+					  0xB3, 0x4D, 0x7E, 0x5F, 0xEA, 0x12, 0x9F, 0xD4);
+			u64 NVHG_DSM_REV = 0x00000102;
+			acpi_handle handle = ACPI_HANDLE(device->dev);
+
+			if (handle && acpi_has_method(handle, "_DSM")) {
+				bool nbci = acpi_check_dsm(handle, &NBCI_DSM_GUID, NBCI_DSM_REV,
+						           1ULL << 0x00000014);
+				bool nvhg = acpi_check_dsm(handle, &NVHG_DSM_GUID, NVHG_DSM_REV,
+						           1ULL << 0x00000014);
+
+				printk(KERN_ERR "bl: nbci:%d nvhg:%d\n", nbci, nvhg);
+
+				if (nbci || nvhg) {
+					union acpi_object argv4 = {
+						.buffer.type    = ACPI_TYPE_BUFFER,
+						.buffer.length  = sizeof(ctrl->backLightData),
+						.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
+					}, *obj;
+
+					obj = acpi_evaluate_dsm(handle, nbci ? &NBCI_DSM_GUID : &NVHG_DSM_GUID,
+								0x00000102, 0x14, &argv4);
+					if (!obj) {
+						acpi_handle_info(handle, "failed to evaluate _DSM\n");
+					} else {
+						printk(KERN_ERR "bl: obj type %d\n", obj->type);
+						printk(KERN_ERR "bl: obj len %d\n", obj->package.count);
+
+						for (int i = 0; i < obj->package.count; i++) {
+							union acpi_object *elt = &obj->package.elements[i];
+							u32 size;
+
+							if (elt->integer.value & ~0xffffffffULL)
+								size = 8;
+							else
+								size = 4;
+
+							printk(KERN_ERR "elt %03d: type %d size %d\n", i, elt->type, size);
+							memcpy(&ctrl->backLightData[ctrl->backLightDataSize], &elt->integer.value, size);
+							ctrl->backLightDataSize += size;
+						}
+
+						printk(KERN_ERR "bl: data size %d\n", ctrl->backLightDataSize);
+						ctrl->status = 0;
+						ACPI_FREE(obj);
+					}
+
+					kfree(argv4.buffer.pointer);
+				}
+			}
+		}
+
+		ret = nvkm_gsp_rm_ctrl_wr(subdevice, ctrl);
+		if (ret)
+			return ret;
+#endif
+	}
+
+	/* */
+	{
+		NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT_PARAMS *ctrl;
+
+		ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+					    NV0073_CTRL_CMD_DP_SET_MANUAL_DISPLAYPORT,
+					    sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		ret = nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+		if (ret)
+			return ret;
+	}
+
+	/* */
+	{
+		NV0073_CTRL_SYSTEM_GET_NUM_HEADS_PARAMS *ctrl;
+
+		ctrl = nvkm_gsp_rm_ctrl_rd(&disp->rm.objcom,
+					   NV0073_CTRL_CMD_SYSTEM_GET_NUM_HEADS, sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		disp->head.nr = ctrl->numHeads;
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	}
+
+	/* */
+	{
+		NV0073_CTRL_SPECIFIC_GET_ALL_HEAD_MASK_PARAMS *ctrl;
+
+		ctrl = nvkm_gsp_rm_ctrl_rd(&disp->rm.objcom,
+					   NV0073_CTRL_CMD_SPECIFIC_GET_ALL_HEAD_MASK,
+					   sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		disp->head.mask = ctrl->headMask;
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+		for_each_set_bit(i, &disp->head.mask, disp->head.nr) {
+			ret = nvkm_head_new_(&r535_head, disp, i);
+			if (ret)
+				return ret;
+		}
+	}
+
+	disp->sor.nr = disp->func->sor.cnt(disp, &disp->sor.mask);
+	nvkm_debug(&disp->engine.subdev, "   SOR(s): %d (%02lx)\n", disp->sor.nr, disp->sor.mask);
+	for_each_set_bit(i, &disp->sor.mask, disp->sor.nr) {
+		ret = disp->func->sor.new(disp, i);
+		if (ret)
+			return ret;
+	}
+
+	/* */
+	{
+		NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS *ctrl;
+		unsigned long mask;
+		int i;
+
+		ctrl = nvkm_gsp_rm_ctrl_rd(&disp->rm.objcom,
+					   NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED, sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		mask = ctrl->displayMask;
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+
+		for_each_set_bit(i, &mask, 32) {
+			ret = r535_outp_new(disp, i);
+			if (ret)
+				return ret;
+		}
+	}
+
+	ret = nvkm_event_init(&r535_disp_event, &gsp->subdev, 3, 32, &disp->rm.event);
+	if (WARN_ON(ret))
+		return ret;
+
+	ret = nvkm_gsp_device_event_ctor(&disp->rm.device, 0x007e0000, NV2080_NOTIFIERS_HOTPLUG,
+					 r535_disp_hpd, &disp->rm.hpd);
+	if (ret)
+		return ret;
+
+	ret = nvkm_gsp_device_event_ctor(&disp->rm.device, 0x007e0001, NV2080_NOTIFIERS_DP_IRQ,
+					 r535_disp_irq, &disp->rm.irq);
+	if (ret)
+		return ret;
+
+	/* RAMHT. */
+	ret = nvkm_ramht_new(device, disp->func->ramht_size ? disp->func->ramht_size :
+			     0x1000, 0, disp->inst, &disp->ramht);
+	if (ret)
+		return ret;
+
+	ret = nvkm_gsp_intr_stall(gsp, disp->engine.subdev.type, disp->engine.subdev.inst);
+	if (ret < 0)
+		return ret;
+
+	ret = nvkm_inth_add(&device->vfn->intr, ret, NVKM_INTR_PRIO_NORMAL, &disp->engine.subdev,
+			    r535_disp_intr, &disp->engine.subdev.inth);
+	if (ret)
+		return ret;
+
+	nvkm_inth_allow(&disp->engine.subdev.inth);
+	return 0;
+}
+
+static void
+r535_disp_dtor(struct nvkm_disp *disp)
+{
+	kfree(disp->func);
+}
+
+int
+r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
+	      enum nvkm_subdev_type type, int inst, struct nvkm_disp **pdisp)
+{
+	struct nvkm_disp_func *rm;
+	int ret;
+
+	if (!(rm = kzalloc(sizeof(*rm) + 6 * sizeof(rm->user[0]), GFP_KERNEL)))
+		return -ENOMEM;
+
+	rm->dtor = r535_disp_dtor;
+	rm->oneinit = r535_disp_oneinit;
+	rm->init = r535_disp_init;
+	rm->fini = r535_disp_fini;
+	rm->uevent = hw->uevent;
+	rm->sor.cnt = r535_sor_cnt;
+	rm->sor.new = r535_sor_new;
+	rm->ramht_size = hw->ramht_size;
+
+	rm->root = hw->root;
+
+	for (int i = 0; hw->user[i].ctor; i++) {
+		switch (hw->user[i].base.oclass & 0xff) {
+		case 0x73: rm->user[i] = hw->user[i]; break;
+		case 0x7d: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_core; break;
+		case 0x7e: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_wndw; break;
+		case 0x7b: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_wimm; break;
+		case 0x7a: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_curs; break;
+		default:
+			WARN_ON(1);
+			continue;
+		}
+	}
+
+	ret = nvkm_disp_new_(rm, device, type, inst, pdisp);
+	if (ret)
+		kfree(rm);
+
+	mutex_init(&(*pdisp)->super.mutex); //XXX
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index 02b6c9fcb973..dcb9f8ba374c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -235,7 +235,7 @@ tu102_disp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	       struct nvkm_disp **pdisp)
 {
 	if (nvkm_gsp_rm(device->gsp))
-		return -ENODEV;
+		return r535_disp_new(&tu102_disp, device, type, inst, pdisp);
 
 	return nvkm_disp_new_(&tu102_disp, device, type, inst, pdisp);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index ff82bb248492..9f2b8c8de62c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -30,6 +30,23 @@
 
 #include <nvif/if0011.h>
 
+static int
+nvkm_uconn_uevent_gsp(struct nvkm_object *object, u64 token, u32 bits)
+{
+	union nvif_conn_event_args args;
+
+	args.v0.version = 0;
+	args.v0.types = 0;
+	if (bits & NVKM_DPYID_PLUG)
+		args.v0.types |= NVIF_CONN_EVENT_V0_PLUG;
+	if (bits & NVKM_DPYID_UNPLUG)
+		args.v0.types |= NVIF_CONN_EVENT_V0_UNPLUG;
+	if (bits & NVKM_DPYID_IRQ)
+		args.v0.types |= NVIF_CONN_EVENT_V0_IRQ;
+
+	return object->client->event(token, &args, sizeof(args.v0));
+}
+
 static int
 nvkm_uconn_uevent_aux(struct nvkm_object *object, u64 token, u32 bits)
 {
@@ -66,13 +83,14 @@ static int
 nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
 	struct nvkm_conn *conn = nvkm_uconn(object);
-	struct nvkm_device *device = conn->disp->engine.subdev.device;
+	struct nvkm_disp *disp = conn->disp;
+	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvkm_outp *outp;
 	union nvif_conn_event_args *args = argv;
 	u64 bits = 0;
 
 	if (!uevent) {
-		if (conn->info.hpd == DCB_GPIO_UNUSED)
+		if (!disp->rm.client.gsp && conn->info.hpd == DCB_GPIO_UNUSED)
 			return -ENOSYS;
 		return 0;
 	}
@@ -88,6 +106,15 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	if (&outp->head == &conn->disp->outps)
 		return -EINVAL;
 
+	if (disp->rm.client.gsp) {
+		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_DPYID_PLUG;
+		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_DPYID_UNPLUG;
+		if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_DPYID_IRQ;
+
+		return nvkm_uevent_add(uevent, &disp->rm.event, outp->index, bits,
+				       nvkm_uconn_uevent_gsp);
+	}
+
 	if (outp->dp.aux && !outp->info.location) {
 		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_I2C_PLUG;
 		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_I2C_UNPLUG;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index a3f3db4d312b..acc689c336c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -30,16 +30,20 @@
 
 #include <nvrm/nvtypes.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0000.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0005.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl0080.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/class/cl2080.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
 #include <nvrm/535.54.03/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
+#include <nvrm/535.54.03/common/sdk/nvidia/inc/nvos.h>
 #include <nvrm/535.54.03/common/shared/msgq/inc/msgq/msgq_priv.h>
 #include <nvrm/535.54.03/common/uproc/os/common/include/libos_init_args.h>
 #include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h>
 #include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h>
 #include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h>
 #include <nvrm/535.54.03/nvidia/arch/nvalloc/common/inc/rmgspseq.h>
+#include <nvrm/535.54.03/nvidia/generated/g_allclasses.h>
 #include <nvrm/535.54.03/nvidia/generated/g_os_nvoc.h>
 #include <nvrm/535.54.03/nvidia/generated/g_rpc-structures.h>
 #include <nvrm/535.54.03/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
@@ -360,6 +364,81 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
 	return repv;
 }
 
+static void
+r535_gsp_event_dtor(struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_device *device = event->device;
+	struct nvkm_gsp_client *client = device->object.client;
+	struct nvkm_gsp *gsp = client->gsp;
+
+	mutex_lock(&gsp->client_id.mutex);
+	if (event->func) {
+		list_del(&event->head);
+		event->func = NULL;
+	}
+	mutex_unlock(&gsp->client_id.mutex);
+
+	nvkm_gsp_rm_free(&event->object);
+	event->device = NULL;
+}
+
+static int
+r535_gsp_device_event_get(struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_device *device = event->device;
+	NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&device->subdevice,
+				    NV2080_CTRL_CMD_EVENT_SET_NOTIFICATION, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->event = event->id;
+	ctrl->action = NV2080_CTRL_EVENT_SET_NOTIFICATION_ACTION_REPEAT;
+	return nvkm_gsp_rm_ctrl_wr(&device->subdevice, ctrl);
+}
+
+static int
+r535_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
+			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_client *client = device->object.client;
+	struct nvkm_gsp *gsp = client->gsp;
+	NV0005_ALLOC_PARAMETERS *args;
+	int ret;
+
+	args = nvkm_gsp_rm_alloc_get(&device->subdevice, handle,
+				     NV01_EVENT_KERNEL_CALLBACK_EX, sizeof(*args),
+				     &event->object);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->hParentClient = client->object.handle;
+	args->hSrcResource = 0;
+	args->hClass = NV01_EVENT_KERNEL_CALLBACK_EX;
+	args->notifyIndex = NV01_EVENT_CLIENT_RM | id;
+	args->data = NULL;
+
+	ret = nvkm_gsp_rm_alloc_wr(&event->object, args);
+	if (ret)
+		return ret;
+
+	event->device = device;
+	event->id = id;
+
+	ret = r535_gsp_device_event_get(event);
+	if (ret) {
+		nvkm_gsp_event_dtor(event);
+		return ret;
+	}
+
+	mutex_lock(&gsp->client_id.mutex);
+	event->func = func;
+	list_add(&event->head, &client->events);
+	mutex_unlock(&gsp->client_id.mutex);
+	return 0;
+}
+
 static void
 r535_gsp_device_dtor(struct nvkm_gsp_device *device)
 {
@@ -428,6 +507,7 @@ r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
 
 	client->gsp = gsp;
 	client->object.client = client;
+	INIT_LIST_HEAD(&client->events);
 
 	args = nvkm_gsp_rm_alloc_get(&client->object, 0xc1d00000 | ret, NV01_ROOT, sizeof(*args),
 				     &client->object);
@@ -690,6 +770,9 @@ r535_gsp_rm = {
 
 	.device_ctor = r535_gsp_device_ctor,
 	.device_dtor = r535_gsp_device_dtor,
+
+	.event_ctor = r535_gsp_device_event_ctor,
+	.event_dtor = r535_gsp_event_dtor,
 };
 
 static void
@@ -763,6 +846,10 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			type = NVKM_SUBDEV_GSP;
 			inst = 0;
 			break;
+		case MC_ENGINE_IDX_DISP:
+			type = NVKM_ENGINE_DISP;
+			inst = 0;
+			break;
 		default:
 			continue;
 		}
@@ -1151,6 +1238,47 @@ r535_gsp_msg_mmu_fault_queued(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
+static int
+r535_gsp_msg_post_event(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_gsp_client *client;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	rpc_post_event_v17_00 *msg = repv;
+
+	if (WARN_ON(repc < sizeof(*msg)))
+		return -EINVAL;
+	if (WARN_ON(repc != sizeof(*msg) + msg->eventDataSize))
+		return -EINVAL;
+
+	nvkm_debug(subdev, "event: %08x %08x %d %08x %08x %d %d\n",
+		   msg->hClient, msg->hEvent, msg->notifyIndex, msg->data,
+		   msg->status, msg->eventDataSize, msg->bNotifyList);
+
+	mutex_lock(&gsp->client_id.mutex);
+	client = idr_find(&gsp->client_id.idr, msg->hClient & 0xffff);
+	if (client) {
+		struct nvkm_gsp_event *event;
+		bool handled = false;
+
+		list_for_each_entry(event, &client->events, head) {
+			if (event->object.handle == msg->hEvent) {
+				event->func(event, msg->eventData, msg->eventDataSize);
+				handled = true;
+			}
+		}
+
+		if (!handled) {
+			nvkm_error(subdev, "event: cid 0x%08x event 0x%08x not found!\n",
+				   msg->hClient, msg->hEvent);
+		}
+	} else {
+		nvkm_error(subdev, "event: cid 0x%08x not found!\n", msg->hClient);
+	}
+	mutex_unlock(&gsp->client_id.mutex);
+	return 0;
+}
+
 static int
 r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 {
@@ -1872,6 +2000,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
 			      r535_gsp_msg_run_cpu_sequencer, gsp);
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_POST_EVENT, r535_gsp_msg_post_event, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
 			      r535_gsp_msg_mmu_fault_queued, gsp);
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_OS_ERROR_LOG, r535_gsp_msg_os_error_log, gsp);
-- 
2.41.0

