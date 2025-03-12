Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E1A5E6B8
	for <lists+nouveau@lfdr.de>; Wed, 12 Mar 2025 22:38:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB110E7D8;
	Wed, 12 Mar 2025 21:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="08MsLOKc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FA510E7D9
 for <nouveau@lists.freedesktop.org>; Wed, 12 Mar 2025 21:38:15 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-4768f90bf36so2189161cf.0
 for <nouveau@lists.freedesktop.org>; Wed, 12 Mar 2025 14:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1741815495;
 x=1742420295; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7UKutuEwhVD7yGDccvnoEKKNb9MYQap61/Ud9OJrcOg=;
 b=08MsLOKcCxGRjvvrnlFD0JYuDSSr9geCB36jR9xmG6fnh81SkVwGa/p8yeXNMTqlk2
 QT24r8rEqvAeY/lKS3cIyLe4a6y/xzh33klDEqa90nO2qrtpBdEgvmoYeoafAn/LcWD8
 F0MjJusfkwo0++96h5CJYMuapfze3Kb5zLdG1qm9Px3D7Ec5pqnR0guzao3kYMh3VYvd
 IkB4AKXu7WHWa/IEeAF52wgtnpY55mmFoM06dTPw3mIp24vpcHb/g/UCSQyyKRlgNNuB
 vKznAQ2+9wzMrC4rN9XiE1NAnPMPYVO9yUsww0b2HMqKRwvtb25IOqCrTQW1WvzkhGUt
 XCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741815495; x=1742420295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7UKutuEwhVD7yGDccvnoEKKNb9MYQap61/Ud9OJrcOg=;
 b=hGpNKCAewGj2emBOKbLWV7fTNadovwM6AQYq7VLUx43Kqv6lTRdS0QrNta2Geh1Ruj
 r6vK43a16BqtDjAMxl0DQBWnmW4NnjEC833c0LTKp4Q2ACnDf7/bjoXosMvTRtPIQMXG
 wYLVPdQZRMpkzyQhZEcfIY0PwffpZpwMg7HEiof1zxcEw3j0Mzp3ywzlwSMwroqp8sFq
 xYP8qyEuq4UOhHk8yn2U1+r6orCsnMFyw+fKKoAz41rpzrhdk31NgRmpVkaH940DNs9D
 ZyD204gXfHApP/cJfaBGqq/8JXEavnB8XZiGvVyHfN0wjCL62KNzabhQ+6rh/NEovLQt
 3jZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyJGNxYwjgvDmnOPfJZfyC6N4zXglsptPXVXiCv4PBvEdNxU3IRp2IkE+i4/li+LIFNYS4qx26@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAqKpKxlGYpcUpA0Ir+8XC9L9P/fatkXoNSXhFre2BigImNlsi
 uJP5q+Ewb2aCtLz01AekOAEzuqlr0WwRDuVy82GuNJ+tfE1EhnIiWavJmzmShNw=
X-Gm-Gg: ASbGnctUsl0JjwNkFTk4o1v1LpcxemEN39z+aBMG33h3K3wTDUtY/vtgaYnZJ0mbHkJ
 ZS72J//VVeEXaCuT1u0DXz+VMd9xgHQt0Hfes5D6fJxJTifYDeXeoXYQQBrva/l2VQwvZiKSIrh
 Ix5rMbtNS0tiXZxi36djkUm7zxqaYb0V7SBz8Drvcu+gHFHFsF5HSJ5uH637EwQSXk7eRFhlmAQ
 GOq8DHQztILwxgGZyosNTGPFWs3Bo1ZLMDR6BS6Q510zTCjp5Fq7KDn17HQmKaVZhhVgHJrFCcP
 xNCpWxKnwbs3k4HqDJRExTQecVUKAdA0+y9yIgTAn9/FKHf7DwqtuFjiA+hKSlMhYDNn9J5p9z/
 4VuC9Rfy3TZ1Nhg==
X-Google-Smtp-Source: AGHT+IE1G9ai641Sg1oT7iCHFbhZVLoVv0Ai3FAy8OMZcmEA/0ux/1L/fDK/KIzcln1+KpcKeORAjA==
X-Received: by 2002:a05:622a:138f:b0:476:83b5:fa63 with SMTP id
 d75a77b69052e-47683b5ffadmr227961181cf.44.1741815494822; 
 Wed, 12 Mar 2025 14:38:14 -0700 (PDT)
Received: from m-kiwi.mynetworksettings.com
 ([2600:4040:9834:3d00:ea98:25f3:a3:e5c5])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-47690deda7csm40220361cf.29.2025.03.12.14.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 14:38:14 -0700 (PDT)
From: Mel Henning <mhenning@darkrefraction.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: Mel Henning <mhenning@darkrefraction.com>
Subject: [PATCH 2/2] drm/nouveau: DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER
Date: Wed, 12 Mar 2025 17:36:15 -0400
Message-ID: <20250312213746.228042-3-mhenning@darkrefraction.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250312213746.228042-1-mhenning@darkrefraction.com>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
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

We add this ioctl to set up the zcull context switch buffer so userspace
can manage it. This also includes support for unbinding the buffer,
which helps simplify device teardown on the userspace side.

Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0020.h |  6 +++
 .../gpu/drm/nouveau/include/nvkm/engine/gr.h  |  1 +
 .../sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h | 53 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 46 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |  8 +++
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |  2 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   | 26 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 17 ++++++
 include/uapi/drm/nouveau_drm.h                | 16 ++++++
 11 files changed, 177 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0020.h b/drivers/gpu/drm/nouveau/include/nvif/if0020.h
index 085e0ae8a450..78be9689b3c5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0020.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0020.h
@@ -42,4 +42,10 @@ union nvif_chan_event_args {
 		__u8 type;
 	} v0;
 };
+
+#define NVIF_CHAN_MTHD_SET_ZCULL_CTXSW_BUFFER 0x00000000
+
+struct nvif_chan_mthd_set_zcull_ctxsw_buffer {
+	u64 addr;
+};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
index 8145796ffc61..7646b0d9a9ed 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/gr.h
@@ -9,6 +9,7 @@ struct nvkm_gr {
 };
 
 u64 nvkm_gr_units(struct nvkm_gr *);
+int nvkm_gr_set_zcull_ctxsw_buffer(struct nvkm_gr *gr, struct nvkm_chan *chan, u64 addr);
 int nvkm_gr_tlb_flush(struct nvkm_gr *);
 int nvkm_gr_ctxsw_pause(struct nvkm_device *);
 int nvkm_gr_ctxsw_resume(struct nvkm_device *);
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
index 01884b926c9c..36fee8bf59be 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h
@@ -26,6 +26,11 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+/* valid zcullMode values */
+#define NV2080_CTRL_CTXSW_ZCULL_MODE_GLOBAL          (0x00000000U)
+#define NV2080_CTRL_CTXSW_ZCULL_MODE_NO_CTXSW        (0x00000001U)
+#define NV2080_CTRL_CTXSW_ZCULL_MODE_SEPARATE_BUFFER (0x00000002U)
+
 /**
  * NV2080_CTRL_CMD_GR_GET_ZCULL_INFO
  *
@@ -95,6 +100,54 @@ typedef struct NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS {
     NvU32 subregionHeightAlignPixels;
 } NV2080_CTRL_GR_GET_ZCULL_INFO_PARAMS;
 
+
+/*
+ * NV2080_CTRL_CMD_GR_CTXSW_ZCULL_BIND
+ *
+ * This command is used to set the zcull context switch mode and virtual address
+ * for the specified channel. A value of NV_ERR_NOT_SUPPORTED is
+ * returned if the target channel does not support zcull context switch mode
+ * changes.
+ *
+ *   hClient
+ *     This parameter specifies the client handle of
+ *     that owns the zcull context buffer. This field must match
+ *     the hClient used in the control call for non-kernel clients.
+ *   hChannel
+ *     This parameter specifies the channel handle of
+ *     the channel that is to have its zcull context switch mode changed.
+ *   vMemPtr
+ *     This parameter specifies the 64 bit virtual address
+ *     for the allocated zcull context buffer.
+ *   zcullMode
+ *     This parameter specifies the new zcull context switch mode.
+ *     Legal values for this parameter include:
+ *       NV2080_CTRL_GR_SET_CTXSW_ZCULL_MODE_GLOBAL
+ *         This mode is the normal zcull operation where it is not
+ *         context switched and there is one set of globally shared
+ *         zcull memory and tables.  This mode is only supported as
+ *         long as all channels use this mode.
+ *       NV2080_CTRL_GR_SET_CTXSW_ZCULL_MODE_NO_CTXSW
+ *         This mode causes the zcull tables to be reset on a context
+ *         switch, but the zcull buffer will not be saved/restored.
+ *       NV2080_CTRL_GR_SET_CTXSW_ZCULL_MODE_SEPARATE_BUFFER
+ *         This mode will cause the zcull buffers and tables to be
+ *         saved/restored on context switches.  If a share channel
+ *         ID is given (shareChID), then the 2 channels will share
+ *         the zcull context buffers.
+ */
+#define NV2080_CTRL_CMD_GR_CTXSW_ZCULL_BIND        (0x20801208U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GR_INTERFACE_ID << 8) | NV2080_CTRL_GR_CTXSW_ZCULL_BIND_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_GR_CTXSW_ZCULL_BIND_PARAMS_MESSAGE_ID (0x8U)
+
+typedef struct NV2080_CTRL_GR_CTXSW_ZCULL_BIND_PARAMS {
+    NvHandle hClient;
+    NvHandle hChannel;
+    NV_DECLARE_ALIGNED(NvU64 vMemPtr, 8);
+    NvU32    zcullMode;
+} NV2080_CTRL_GR_CTXSW_ZCULL_BIND_PARAMS;
+/* valid zcullMode values same as above NV2080_CTRL_CTXSW_ZCULL_MODE */
+
 typedef enum NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS {
     NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_MAIN = 0,
     NV2080_CTRL_CMD_GR_CTXSW_PREEMPTION_BIND_BUFFERS_SPILL = 1,
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 981abea97546..07f8215e61bd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -27,6 +27,7 @@
 #include <nvif/ioctl.h>
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
+#include <nvif/if0020.h>
 #include <nvif/unpack.h>
 
 #include "nouveau_drv.h"
@@ -348,6 +349,51 @@ nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
 	}
 }
 
+int
+nouveau_abi16_ioctl_set_zcull_ctxsw_buffer(ABI16_IOCTL_ARGS)
+{
+	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
+	struct nouveau_abi16_chan *chan16;
+	struct nouveau_channel *chan = NULL;
+	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvkm_device *device = drm->nvkm;
+	struct drm_nouveau_set_zcull_ctxsw_buffer *req = data;
+	int ret = 0;
+
+	if (unlikely(!device->has_zcull_info))
+		return nouveau_abi16_put(abi16, -ENODEV);
+
+	if (unlikely(req->pad))
+		return nouveau_abi16_put(abi16, -EINVAL);
+
+	if (unlikely(!abi16))
+		return nouveau_abi16_put(abi16, -ENOMEM);
+
+	/* abi16 locks already */
+	list_for_each_entry(chan16, &abi16->channels, head) {
+		if (chan16->chan->chid == req->channel) {
+			chan = chan16->chan;
+			break;
+		}
+	}
+
+	if (!chan)
+		return nouveau_abi16_put(abi16, -ENOENT);
+
+	if (unlikely(atomic_read(&chan->killed)))
+		return nouveau_abi16_put(abi16, -ENODEV);
+
+	struct nvif_chan_mthd_set_zcull_ctxsw_buffer args = {
+		.addr = req->addr,
+	};
+
+	ret = nvif_mthd(&chan->user, NVIF_CHAN_MTHD_SET_ZCULL_CTXSW_BUFFER,
+			&args, sizeof(args));
+
+	return nouveau_abi16_put(abi16, ret);
+}
+
+
 int
 nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 134b3ab58719..2ac0842aee88 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -7,6 +7,7 @@
 
 int nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS);
+int nouveau_abi16_ioctl_set_zcull_ctxsw_buffer(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_channel_free(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 4c4168b50e60..352620023a01 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1245,6 +1245,7 @@ nouveau_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(NOUVEAU_NOTIFIEROBJ_ALLOC, nouveau_abi16_ioctl_notifierobj_alloc, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GPUOBJ_FREE, nouveau_abi16_ioctl_gpuobj_free, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GET_ZCULL_INFO, nouveau_abi16_ioctl_get_zcull_info, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(NOUVEAU_SET_ZCULL_CTXSW_BUFFER, nouveau_abi16_ioctl_set_zcull_ctxsw_buffer, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_INIT, nouveau_svmm_init, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_SVM_BIND, nouveau_svmm_bind, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(NOUVEAU_GEM_NEW, nouveau_gem_ioctl_new, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..0460cc3286d9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -345,6 +345,14 @@ nvkm_chan_get_chid(struct nvkm_engine *engine, int id, unsigned long *pirqflags)
 	return NULL;
 }
 
+int
+nvkm_chan_set_zcull_ctxsw_buffer(struct nvkm_chan *chan, u64 addr)
+{
+	if (chan->func->set_zcull_ctxsw_buffer)
+		return chan->func->set_zcull_ctxsw_buffer(chan, addr);
+	return -ENODEV;
+}
+
 int
 nvkm_chan_new_(const struct nvkm_chan_func *func, struct nvkm_runl *runl, int runq,
 	       struct nvkm_cgrp *cgrp, const char *name, bool priv, u32 devm, struct nvkm_vmm *vmm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
index 013682a709d5..5c9380d39468 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
@@ -54,6 +54,7 @@ struct nvkm_chan_func {
 	void (*stop)(struct nvkm_chan *);
 	void (*preempt)(struct nvkm_chan *);
 	u32 (*doorbell_handle)(struct nvkm_chan *);
+	int (*set_zcull_ctxsw_buffer)(struct nvkm_chan *, u64 addr);
 };
 
 int nvkm_chan_new_(const struct nvkm_chan_func *, struct nvkm_runl *, int runq, struct nvkm_cgrp *,
@@ -73,6 +74,7 @@ int nvkm_chan_cctx_get(struct nvkm_chan *, struct nvkm_engn *, struct nvkm_cctx
 		       struct nvkm_client * /*TODO: remove need for this */);
 void nvkm_chan_cctx_put(struct nvkm_chan *, struct nvkm_cctx **);
 void nvkm_chan_cctx_bind(struct nvkm_chan *, struct nvkm_engn *, struct nvkm_cctx *);
+int nvkm_chan_set_zcull_ctxsw_buffer(struct nvkm_chan *chan, u64 addr);
 
 #define CHAN_PRCLI(c,l,p,f,a...) CGRP_PRINT((c)->cgrp, l, p, "%04x:[%s]"f, (c)->id, (c)->name, ##a)
 #define CHAN_PRINT(c,l,p,f,a...) CGRP_PRINT((c)->cgrp, l, p, "%04x:"f, (c)->id, ##a)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index 3454c7d29502..11d5c5769f59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -39,6 +39,7 @@
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080ce.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080fifo.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gr.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrla06f/ctrla06fgpfifo.h>
 #include <nvrm/535.113.01/nvidia/generated/g_kernel_channel_nvoc.h>
@@ -328,6 +329,30 @@ r535_chan_id_get(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64 ouserd)
 	return ret;
 }
 
+static int
+r535_chan_set_zcull_ctxsw_buffer(struct nvkm_chan *chan, u64 addr)
+{
+	NV2080_CTRL_GR_CTXSW_ZCULL_BIND_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&chan->vmm->rm.device.subdevice,
+		NV2080_CTRL_CMD_GR_CTXSW_ZCULL_BIND, sizeof(*ctrl));
+
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
+
+	ctrl->hClient = chan->vmm->rm.client.object.handle;
+	ctrl->hChannel = chan->rm.object.handle;
+	if (addr) {
+		ctrl->vMemPtr = addr;
+		ctrl->zcullMode = NV2080_CTRL_CTXSW_ZCULL_MODE_SEPARATE_BUFFER;
+	} else {
+		ctrl->vMemPtr = 0;
+		ctrl->zcullMode = NV2080_CTRL_CTXSW_ZCULL_MODE_NO_CTXSW;
+	}
+
+	return nvkm_gsp_rm_ctrl_wr(&chan->vmm->rm.device.subdevice, ctrl);
+}
+
 static const struct nvkm_chan_func
 r535_chan = {
 	.id_get = r535_chan_id_get,
@@ -338,6 +363,7 @@ r535_chan = {
 	.start = r535_chan_start,
 	.stop = r535_chan_stop,
 	.doorbell_handle = r535_chan_doorbell_handle,
+	.set_zcull_ctxsw_buffer = r535_chan_set_zcull_ctxsw_buffer,
 };
 
 static const struct nvkm_cgrp_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 9e56bcc166ed..44c18a77cf10 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -31,6 +31,7 @@
 #include <subdev/mmu.h>
 #include <engine/dma.h>
 
+#include <nvkm/engine/gr.h>
 #include <nvif/if0020.h>
 
 struct nvkm_uchan {
@@ -268,6 +269,21 @@ nvkm_uchan_map(struct nvkm_object *object, void *argv, u32 argc,
 	return 0;
 }
 
+static int
+nvkm_uchan_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
+{
+	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
+	struct nvif_chan_mthd_set_zcull_ctxsw_buffer *args = argv;
+
+	if (mthd != NVIF_CHAN_MTHD_SET_ZCULL_CTXSW_BUFFER)
+		return -ENOTTY;
+
+	if (argc < sizeof(*args))
+		return -EINVAL;
+
+	return nvkm_chan_set_zcull_ctxsw_buffer(chan, args->addr);
+}
+
 static int
 nvkm_uchan_fini(struct nvkm_object *object, bool suspend)
 {
@@ -312,6 +328,7 @@ nvkm_uchan = {
 	.dtor = nvkm_uchan_dtor,
 	.init = nvkm_uchan_init,
 	.fini = nvkm_uchan_fini,
+	.mthd = nvkm_uchan_mthd,
 	.map = nvkm_uchan_map,
 	.sclass = nvkm_uchan_sclass,
 	.uevent = nvkm_uchan_uevent,
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 33361784eb4e..e9638f4dd7e6 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -448,6 +448,20 @@ struct drm_nouveau_get_zcull_info {
 	__u32 ctxsw_align;
 };
 
+struct drm_nouveau_set_zcull_ctxsw_buffer {
+	/**
+	 * @ptr: The virtual address for the buffer, or null to bind nothing
+	 */
+	__u64 addr;
+
+	/**
+	 * @channel: the channel to set the buffer on
+	 */
+	__u32 channel;
+
+	__u32 pad;
+};
+
 #define DRM_NOUVEAU_GETPARAM           0x00
 #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
 #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02
@@ -462,6 +476,7 @@ struct drm_nouveau_get_zcull_info {
 #define DRM_NOUVEAU_VM_BIND            0x11
 #define DRM_NOUVEAU_EXEC               0x12
 #define DRM_NOUVEAU_GET_ZCULL_INFO     0x13
+#define DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER 0x14
 #define DRM_NOUVEAU_GEM_NEW            0x40
 #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
 #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
@@ -532,6 +547,7 @@ struct drm_nouveau_svm_bind {
 #define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
 
 #define DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO     DRM_IOR (DRM_COMMAND_BASE + DRM_NOUVEAU_GET_ZCULL_INFO, struct drm_nouveau_get_zcull_info)
+#define DRM_IOCTL_NOUVEAU_SET_ZCULL_CTXSW_BUFFER  DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_SET_ZCULL_CTXSW_BUFFER, struct drm_nouveau_set_zcull_ctxsw_buffer)
 #if defined(__cplusplus)
 }
 #endif
-- 
2.48.1

