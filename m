Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17CA8A7936
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5A32112FD5;
	Tue, 16 Apr 2024 23:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qpjHSBtk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8E112FCC
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuMZTTdpMu+gqythWrRM70da1F/NSGEVFpt3xO4Crqc5DBxYOfyz+qWHWVloxcJGkVd1q3FnDsYvDbvxmAzDX0xX8ik/SZKR3P+3NL1pCSvq1WSJ5U9WuB2O5mQqcI96MKwM79ZzYpJVfZcT91CX3uzA6EKqoQ9Ap3MUc5l9Hu1ISYocdGdVipN7FrZ5zMCmVdpdRPiHpN+yCp2ZKJ2Pva0A8dBvWJgHkPWML2QOUM20Inebl2FnWo1G4Rbp+pLz8kpQoKRvK45xyC0ltLwJmPN5FiaXmrLAz8+u0vatdH+5pf8K7cjXHoyZRYVHfmcpBaGq3w2hof29YyziiwiQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qv5jl5TFu0t/Ma+i8e31CRS5KFWaY/yLSh40HJyUALs=;
 b=COn7CGTvq/HCi9kPbOFvUAO4J0c47SJuHOaa3VfuyzO8MNV+lpY6R5XUlQ6t994b50g8N3eQq72PFGk/TqwIoNT0u2ydkIlQsG6SZcb/U0t4Mo2UVecPr4UDtUcdi3hCYs5YcyIqc2/U+YnqlKhCtrwLnA0OLZj0djmCQFX828j+OcbMJFBU9q6KNBB3hS5vG4cM7LwW3zRzlWbkia03th+TEpopWGh6/nGBPOq4RwAZN9FStjFFg8KAw/LdemMqOgwWdl4UjZbHDFTjyVX2CQ2Wvkq60ih9g3KsOWPU5fbsMq2OigdVBsde81HYLNToeNU1uR2QmdSl8mxdDF6jjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qv5jl5TFu0t/Ma+i8e31CRS5KFWaY/yLSh40HJyUALs=;
 b=qpjHSBtkB9PZoTOLGg/pT+VbbDP5I+hMRKZu6T6DsqKKfhRet+KhfWEYECRu1bYvWfFuvpAIARv//sMHDdIVj3JLk3Xd8PPP1qQRsUU6cgpje9+9djDOpZAnb1E44ByU353HFHgCEl6xb3UuPsDJaVpsyZsygOtTFbrLASQ95YNTPhgWM3EqXrGy48GYkWFZXIQQrzFuN6rCo+vgXEliZ+fUjKu/1viH4d4sPFnJIZp+shZbHTh2FGUYdBcGbRyct+mYEPZ/pF9IucBoSQ2MmMGrTrRFrSijQKGndJj5bGeM0BzIhQlHWVRgerUAcAajoRXMFKg0ylqyZXBjlPqOLA==
Received: from DM6PR07CA0066.namprd07.prod.outlook.com (2603:10b6:5:74::43) by
 CH3PR12MB8969.namprd12.prod.outlook.com (2603:10b6:610:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:23 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::1c) by DM6PR07CA0066.outlook.office365.com
 (2603:10b6:5:74::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:06 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 136/156] drm/nouveau/nvif: rework device/cgrp "new chan" apis
Date: Wed, 17 Apr 2024 09:39:42 +1000
Message-ID: <20240416234002.19509-137-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CH3PR12MB8969:EE_
X-MS-Office365-Filtering-Correlation-Id: 3439b6d0-c91d-4e4d-b8f6-08dc5e6f016a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 79W69O0LEAK6CjNaLf6Rz3B1yyH84ra19x0H8xgw3tnRX37jr4CnGoaxEM+lO8NhDFhmoXTphOsRrMlhwHiMudQZ4xd5l7TSanKC+KhssxuaiMiVuZRDf5AgcL2LoMzJ/R764Xcgw3/v8smkEzUGr9FfrkiMyoqvDEtMLjzZc9MjFCB3swCI01oSpSIHontTlXfDz/18qow2eBvqHhqXCx8Zr5sTQXr07iFJkfZWucv/fg0a3FZx/cndQwLWMAqqqDpX52UNcxFf/0erZLpzRvSXfdEcubP9dt8iH0965fngL0Px4dwwgp89IR4j5mQvzj/2ICxiQ4yyEU9gjb/Hwhhx9mQL7LjzFCc8znpJxX4NMzSM/DT0H4r8WepRgmf8EjJ3a7JFc296DBqwLPcb5zO2BMGUVnaD+Im/cY1G8CQhlcSfs8T7wsZDtXcmTDGnYYftdZgIH6tgNAuQXkTfL+D+7OUpDyjSWfTUFooDLYJKxrWUQfuEO0T8TpGjyJw7+uk7K2yjODeeT7YDcWjHyW1FItdYuG+bzIgpesGj9ql3zQuA418Q+r86Ky2WPZQ8Tcww6wZyizLtsykVb7gnuEpzZ94yJAPqGBecFzL0GM40QO/GD03xZ5hT6PtN+NFA1ZpRbPiI8E5msJa886jrxUqy7O6TkD59vFhWi1aKH5r/6FiYBP+TqdEPbVrziQ75MGDsIXbDw/UKI2wesyJFUGFZ6Jt1iRwlmnmjrVpwTTo9/MAC6juwyfyxLOynqQ/D
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:23.6357 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3439b6d0-c91d-4e4d-b8f6-08dc5e6f016a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8969
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  25 ++++
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  31 +++++
 drivers/gpu/drm/nouveau/include/nvif/if0020.h |  32 -----
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  14 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  75 +++++------
 drivers/gpu/drm/nouveau/nouveau_chan.h        |   8 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   6 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c       |   3 +-
 drivers/gpu/drm/nouveau/nv17_fence.c          |   2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c          |   2 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild           |   1 +
 drivers/gpu/drm/nouveau/nvif/chan.c           |  45 +++++++
 drivers/gpu/drm/nouveau/nvkm/device/user.c    |  24 ++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |  39 ------
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |   3 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c  |  40 +++---
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 116 ++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.h  |  11 ++
 19 files changed, 268 insertions(+), 211 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/chan.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/chan.h b/drivers/gpu/drm/nouveau/include/nvif/chan.h
new file mode 100644
index 000000000000..80f7ea8c7268
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/chan.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVIF_CHAN_H__
+#define __NVIF_CHAN_H__
+#include <nvif/object.h>
+#include <nvif/driverif.h>
+#include <nvif/push.h>
+struct nvif_cgrp;
+struct nvif_device;
+
+struct nvif_chan {
+	const struct nvif_chan_impl *impl;
+	struct nvif_chan_priv *priv;
+	struct nvif_object object;
+
+	struct nvif_device *device;
+	u8 runl;
+	u8 runq;
+
+	struct nvif_push push;
+};
+
+void nvif_chan_ctor(struct nvif_device *, struct nvif_cgrp *, const char *name, u8 runl, u8 runq,
+		    struct nvif_chan *);
+void nvif_chan_dtor(struct nvif_chan *);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index c1971b85d927..cc858955a97b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -20,6 +20,7 @@ struct nvif_head_priv;
 struct nvif_disp_chan_priv;
 struct nvif_ctxdma_priv;
 struct nvif_cgrp_priv;
+struct nvif_chan_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -431,10 +432,34 @@ struct nvif_disp_impl {
 	} chan;
 };
 
+struct nvif_chan_impl {
+	void (*del)(struct nvif_chan_priv *);
+
+	u16 id;
+	u32 doorbell_token;
+
+	struct {
+		enum {
+			NVIF_CHAN_INST_APER_INST,
+			NVIF_CHAN_INST_APER_VRAM,
+			NVIF_CHAN_INST_APER_HOST,
+			NVIF_CHAN_INST_APER_NCOH,
+		} aper;
+		u64 addr;
+	} inst;
+};
+
 struct nvif_cgrp_impl {
 	void (*del)(struct nvif_cgrp_priv *);
 
 	u16 id;
+
+	struct {
+		int (*new)(struct nvif_cgrp_priv *, u8 runq, bool priv, u16 devm,
+			   u64 gpfifo_offset, u64 gpfifo_length,
+			   struct nvif_mem_priv *userd, u16 userd_offset, const char *name,
+			   const struct nvif_chan_impl **, struct nvif_chan_priv **);
+	} chan;
 };
 
 struct nvif_device_impl {
@@ -566,6 +591,12 @@ struct nvif_device_impl {
 
 		struct {
 			s32 oclass;
+			int (*new)(struct nvif_device_priv *, u8 runl, u8 runq, bool priv, u16 devm,
+				   struct nvif_vmm_priv *, struct nvif_ctxdma_priv *push,
+				   u64 offset, u64 length, struct nvif_mem_priv *userd,
+				   u16 userd_offset, const char *name,
+				   const struct nvif_chan_impl **, struct nvif_chan_priv **,
+				   u64 handle);
 		} chan;
 	} fifo;
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0020.h b/drivers/gpu/drm/nouveau/include/nvif/if0020.h
index 085e0ae8a450..1893b8aa0abb 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0020.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0020.h
@@ -2,38 +2,6 @@
 #ifndef __NVIF_IF0020_H__
 #define __NVIF_IF0020_H__
 
-union nvif_chan_args {
-	struct nvif_chan_v0 {
-		__u8  version;
-		__u8  namelen;
-		__u8  runlist;
-		__u8  runq;
-		__u8  priv;
-		__u8  pad05;
-		__u16 devm;
-		__u64 vmm;
-
-		__u64 ctxdma;
-		__u64 offset;
-		__u64 length;
-
-		__u64 huserd;
-		__u64 ouserd;
-
-		__u32 token;
-		__u16 chid;
-		__u8  pad3e;
-#define NVIF_CHAN_V0_INST_APER_VRAM 0
-#define NVIF_CHAN_V0_INST_APER_HOST 1
-#define NVIF_CHAN_V0_INST_APER_NCOH 2
-#define NVIF_CHAN_V0_INST_APER_INST 0xff
-		__u8  aper;
-		__u64 inst;
-
-		__u8  name[];
-	} v0;
-};
-
 union nvif_chan_event_args {
 	struct nvif_chan_event_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index fdbc982ea566..d7db5c0eeaea 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -430,13 +430,13 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	switch (device->info.family) {
 	case NV_DEVICE_INFO_V0_VOLTA:
-		ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar", 0, VOLTA_DMA_COPY_A,
+		ret = nvif_object_ctor(&chan->chan->chan.object, "abi16CeWar", 0, VOLTA_DMA_COPY_A,
 				       NULL, 0, &chan->ce);
 		if (ret)
 			goto done;
 		break;
 	case NV_DEVICE_INFO_V0_TURING:
-		ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar", 0, TURING_DMA_COPY_A,
+		ret = nvif_object_ctor(&chan->chan->chan.object, "abi16CeWar", 0, TURING_DMA_COPY_A,
 				       NULL, 0, &chan->ce);
 		if (ret)
 			goto done;
@@ -524,7 +524,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 	if (!chan)
 		return nouveau_abi16_put(abi16, -ENOENT);
 
-	ret = nvif_object_sclass_get(&chan->chan->user, &sclass);
+	ret = nvif_object_sclass_get(&chan->chan->chan.object, &sclass);
 	if (ret < 0)
 		return nouveau_abi16_put(abi16, ret);
 
@@ -583,7 +583,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	list_add(&ntfy->head, &chan->notifiers);
 
-	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", init->handle,
+	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16EngObj", init->handle,
 			       oclass, NULL, 0, &ntfy->object);
 
 	if (ret)
@@ -645,7 +645,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 		args.limit += chan->ntfy->offset;
 	}
 
-	ret = nvif_object_ctor(&chan->chan->user, "abi16Ntfy", info->handle,
+	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16Ntfy", info->handle,
 			       NV_DMA_IN_MEMORY, &args, sizeof(args),
 			       &ntfy->object);
 	if (ret)
@@ -768,7 +768,7 @@ nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", args->handle, args->oclass,
+	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16EngObj", args->handle, args->oclass,
 			       NULL, 0, &obj->engobj.object);
 	if (ret)
 		nouveau_abi16_obj_del(obj);
@@ -796,7 +796,7 @@ nouveau_abi16_ioctl_sclass(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *io
 	if (!chan)
 		return -EINVAL;
 
-	ret = nvif_object_sclass_get(&chan->chan->user, &sclass);
+	ret = nvif_object_sclass_get(&chan->chan->chan.object, &sclass);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7db05d6699d8..6c5426fe2007 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -965,7 +965,7 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 		if (chan == NULL)
 			continue;
 
-		ret = nvif_object_ctor(&chan->user, "ttmBoMove",
+		ret = nvif_object_ctor(&chan->chan.object, "ttmBoMove",
 				       mthd->oclass | (mthd->engine << 16),
 				       mthd->oclass, NULL, 0,
 				       &drm->ttm.copy);
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 7c57bc48a8af..21927b817fa8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -93,7 +93,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		if (chan->fence)
 			nouveau_fence(chan->cli->drm)->context_del(chan);
 
-		if (nvif_object_constructed(&chan->user))
+		if (chan->chan.impl)
 			nouveau_svmm_part(chan->vmm->svmm, chan->inst);
 
 		nvif_object_dtor(&chan->blit);
@@ -104,7 +104,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		if (!chan->userd.map.impl)
 			chan->userd.map.ptr = NULL;
 		nvif_object_unmap_cpu(&chan->userd.map);
-		nvif_object_dtor(&chan->user);
+		nvif_chan_dtor(&chan->chan);
 		nvif_mem_dtor(&chan->userd.mem);
 		nvif_ctxdma_dtor(&chan->push.ctxdma);
 		nouveau_vma_del(&chan->push.vma);
@@ -258,10 +258,6 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 {
 	struct nvif_device *device = &cli->device;
 	const u32 oclass = device->impl->fifo.chan.oclass;
-	struct {
-		struct nvif_chan_v0 chan;
-		char name[TASK_COMM_LEN+16];
-	} args;
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
@@ -269,6 +265,11 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	char name[TASK_COMM_LEN];
 	int ret;
 	u64 size;
+	struct nvif_vmm_priv *vmm = NULL;
+	struct nvif_ctxdma_priv *ctxdma = NULL;
+	struct nvif_mem_priv *userd = NULL;
+	u64 offset, length = 0;
+	u16 userd_offset = 0;
 
 	switch (oclass) {
 	case  AMPERE_CHANNEL_GPFIFO_B:
@@ -306,28 +307,17 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	chan->runlist = __ffs64(runm);
 
 	/* create channel object */
-	args.chan.version = 0;
-	args.chan.namelen = sizeof(args.name);
-	args.chan.runlist = cli->drm->device.impl->fifo.runl[chan->runlist].id;
-	args.chan.runq = 0;
-	args.chan.priv = priv;
-	args.chan.devm = BIT(0);
 	if (oclass < NV50_CHANNEL_GPFIFO) {
-		args.chan.vmm = 0;
-		args.chan.ctxdma = nvif_handle(&chan->push.ctxdma.object);
-		args.chan.offset = chan->push.addr;
-		args.chan.length = 0;
+		ctxdma = chan->push.ctxdma.priv;
+		offset = chan->push.addr;
 	} else {
-		args.chan.vmm = nvif_handle(&chan->vmm->vmm.object);
-		if (oclass < FERMI_CHANNEL_GPFIFO)
-			args.chan.ctxdma = nvif_handle(&chan->push.ctxdma.object);
-		else
-			args.chan.ctxdma = 0;
-		args.chan.offset = ioffset + chan->push.addr;
-		args.chan.length = ilength;
+		vmm = chan->vmm->vmm.priv;
+		if (device->impl->fifo.chan.oclass < FERMI_CHANNEL_GPFIFO)
+			ctxdma = chan->push.ctxdma.priv;
+
+		offset = ioffset + chan->push.addr;
+		length = ilength;
 	}
-	args.chan.huserd = 0;
-	args.chan.ouserd = 0;
 
 	/* allocate userd */
 	if (oclass >= VOLTA_CHANNEL_GPFIFO_A) {
@@ -337,23 +327,26 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		if (ret)
 			return ret;
 
-		args.chan.huserd = nvif_handle(&chan->userd.mem.object);
-		args.chan.ouserd = 0;
+		userd = chan->userd.mem.priv;
 	}
 
 	get_task_comm(name, current);
-	snprintf(args.name, sizeof(args.name), "%s[%d]", name, task_pid_nr(current));
+	snprintf(chan->name, sizeof(chan->name), "%s[%d]", name, task_pid_nr(current));
 
-	ret = nvif_object_ctor(&device->object, "abi16ChanUser", 0, oclass,
-			       &args, sizeof(args), &chan->user);
+	ret = device->impl->fifo.chan.new(device->priv, device->impl->fifo.runl[chan->runlist].id,
+					  0, priv, BIT(0), vmm, ctxdma, offset, length,
+					  userd, userd_offset, chan->name,
+					  &chan->chan.impl, &chan->chan.priv,
+					  nvif_handle(&chan->chan.object));
 	if (ret) {
 		nouveau_channel_del(pchan);
 		return ret;
 	}
 
-	chan->chid = args.chan.chid;
-	chan->inst = args.chan.inst;
-	chan->token = args.chan.token;
+	nvif_chan_ctor(device, NULL, chan->name, chan->runlist, 0, &chan->chan);
+	chan->chid = chan->chan.impl->id;
+	chan->inst = chan->chan.impl->inst.addr;
+	chan->token = chan->chan.impl->doorbell_token;
 	return 0;
 }
 
@@ -366,18 +359,18 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	int ret, i;
 
 	if (!chan->userd.mem.impl) {
-		ret = nvif_object_map(&chan->user, NULL, 0);
+		ret = nvif_object_map(&chan->chan.object, NULL, 0);
 		if (ret)
 			return ret;
 
-		chan->userd.map.ptr = chan->user.map.ptr;
+		chan->userd.map.ptr = chan->chan.object.map.ptr;
 	} else {
 		ret = nvif_mem_map(&chan->userd.mem, NULL, 0, &chan->userd.map);
 		if (ret)
 			return ret;
 	}
 
-	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
+	if (chan->chan.object.oclass >= FERMI_CHANNEL_GPFIFO) {
 		struct {
 			struct nvif_event_v0 base;
 			struct nvif_chan_event_v0 host;
@@ -386,7 +379,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		args.host.version = 0;
 		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
 
-		ret = nvif_event_ctor(&chan->user, "abi16ChanKilled", chan->chid,
+		ret = nvif_event_ctor(&chan->chan.object, "abi16ChanKilled", chan->chid,
 				      nouveau_channel_killed, false,
 				      &args.base, sizeof(args), &chan->kill);
 		if (ret == 0)
@@ -412,7 +405,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.limit = device->info.ram_user - 1;
 		}
 
-		ret = nvif_object_ctor(&chan->user, "abi16ChanVramCtxDma", vram,
+		ret = nvif_object_ctor(&chan->chan.object, "abi16ChanVramCtxDma", vram,
 				       NV_DMA_IN_MEMORY, &args, sizeof(args),
 				       &chan->vram);
 		if (ret)
@@ -436,7 +429,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.limit = chan->vmm->vmm.impl->limit - 1;
 		}
 
-		ret = nvif_object_ctor(&chan->user, "abi16ChanGartCtxDma", gart,
+		ret = nvif_object_ctor(&chan->chan.object, "abi16ChanGartCtxDma", gart,
 				       NV_DMA_IN_MEMORY, &args, sizeof(args),
 				       &chan->gart);
 		if (ret)
@@ -444,7 +437,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise dma tracking parameters */
-	switch (chan->user.oclass) {
+	switch (chan->chan.object.oclass) {
 	case NV03_CHANNEL_DMA:
 	case NV10_CHANNEL_DMA:
 	case NV17_CHANNEL_DMA:
@@ -478,7 +471,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 
 	/* allocate software object class (used for fences on <= nv05) */
 	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
-		ret = nvif_object_ctor(&chan->user, "abi16NvswFence", 0x006e,
+		ret = nvif_object_ctor(&chan->chan.object, "abi16NvswFence", 0x006e,
 				       NVIF_CLASS_SW_NV04,
 				       NULL, 0, &chan->nvsw);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 786c929843d1..8f71492e2df3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -4,13 +4,12 @@
 #include <nvif/object.h>
 #include <nvif/ctxdma.h>
 #include <nvif/event.h>
-#include <nvif/push.h>
+#include <nvif/chan.h>
 struct nvif_device;
 
 struct nouveau_channel {
-	struct {
-		struct nvif_push push;
-	} chan;
+	char name[TASK_COMM_LEN+16];
+	struct nvif_chan chan;
 
 	struct nouveau_cli *cli;
 	struct nouveau_vmm *vmm;
@@ -53,7 +52,6 @@ struct nouveau_channel {
 	u32 user_get;
 	u32 user_put;
 
-	struct nvif_object user;
 	struct nvif_object blit;
 
 	struct nvif_event kill;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8ab6b9e03eb5..a2c9e8fa4ebd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -316,12 +316,12 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 	 * on TNT/TNT2 HW that lacks any kind of support in host.
 	 */
 	if (!drm->channel->nvsw.client && device->info.family < NV_DEVICE_INFO_V0_TESLA) {
-		ret = nvif_object_ctor(&drm->channel->user, "drmNvsw",
+		ret = nvif_object_ctor(&drm->channel->chan.object, "drmNvsw",
 				       NVDRM_NVSW, nouveau_abi16_swclass(drm),
 				       NULL, 0, &drm->channel->nvsw);
 
 		if (ret == 0 && device->info.chipset >= 0x11) {
-			ret = nvif_object_ctor(&drm->channel->user, "drmBlit",
+			ret = nvif_object_ctor(&drm->channel->chan.object, "drmBlit",
 					       0x005f, 0x009f,
 					       NULL, 0, &drm->channel->blit);
 		}
@@ -361,7 +361,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 			return;
 		}
 
-		ret = nvif_object_ctor(&drm->channel->user, "drmM2mfNtfy",
+		ret = nvif_object_ctor(&drm->channel->chan.object, "drmM2mfNtfy",
 				       NvNotify0, NV_DMA_IN_MEMORY,
 				       (&(struct nv_dma_v0) {
 						.target = NV_DMA_V0_TARGET_VRAM,
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 09686d038d60..ff31784effeb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -210,7 +210,8 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	args.host.version = 0;
 	args.host.type = NVIF_CHAN_EVENT_V0_NON_STALL_INTR;
 
-	ret = nvif_event_ctor(&chan->user, "fenceNonStallIntr", (chan->runlist << 16) | chan->chid,
+	ret = nvif_event_ctor(&chan->chan.object, "fenceNonStallIntr",
+			      (chan->runlist << 16) | chan->chid,
 			      nouveau_fence_wait_uevent_handler, false,
 			      &args.base, sizeof(args), &fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 5b4ceac49225..17ff00b22e9e 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -92,7 +92,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 	fctx->base.read = nv10_fence_read;
 	fctx->base.sync = nv17_fence_sync;
 
-	ret = nvif_object_ctor(&chan->user, "fenceCtxDma", NvSema,
+	ret = nvif_object_ctor(&chan->chan.object, "fenceCtxDma", NvSema,
 			       NV_DMA_FROM_MEMORY,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 1d8792fdd89b..b418439e6bb1 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -51,7 +51,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 	fctx->base.read = nv10_fence_read;
 	fctx->base.sync = nv17_fence_sync;
 
-	ret = nvif_object_ctor(&chan->user, "fenceCtxDma", NvSema,
+	ret = nvif_object_ctor(&chan->chan.object, "fenceCtxDma", NvSema,
 			       NV_DMA_IN_MEMORY,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
diff --git a/drivers/gpu/drm/nouveau/nvif/Kbuild b/drivers/gpu/drm/nouveau/nvif/Kbuild
index 50489933655c..757e10e8dce5 100644
--- a/drivers/gpu/drm/nouveau/nvif/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvif/Kbuild
@@ -2,6 +2,7 @@
 nvif-y := nvif/object.o
 nvif-y += nvif/client.o
 nvif-y += nvif/cgrp.o
+nvif-y += nvif/chan.o
 nvif-y += nvif/conn.o
 nvif-y += nvif/device.o
 nvif-y += nvif/disp.o
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
new file mode 100644
index 000000000000..cfca4dac5388
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -0,0 +1,45 @@
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved.
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
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <nvif/chan.h>
+#include <nvif/cgrp.h>
+#include <nvif/device.h>
+
+void
+nvif_chan_dtor(struct nvif_chan *chan)
+{
+	if (!chan->impl)
+		return;
+
+	chan->impl->del(chan->priv);
+	chan->impl = NULL;
+}
+
+void
+nvif_chan_ctor(struct nvif_device *device, struct nvif_cgrp *cgrp, const char *name,
+	       u8 runl, u8 runq, struct nvif_chan *chan)
+{
+	nvif_object_ctor(!cgrp ? &device->object : &cgrp->object, name, chan->impl->id,
+			 device->impl->fifo.chan.oclass, &chan->object);
+	chan->device = device;
+	chan->runl = runl;
+	chan->runq = runq;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index fc81d595bdb7..c1ccb75db3c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -31,11 +31,13 @@
 #include <subdev/instmem.h>
 #include <subdev/timer.h>
 #include <subdev/mmu/ummu.h>
+#include <subdev/mmu/uvmm.h>
 #include <subdev/vfn/uvfn.h>
 #include <engine/disp/priv.h>
 #include <engine/disp/udisp.h>
 #include <engine/fifo/ufifo.h>
 #include <engine/fifo/ucgrp.h>
+#include <engine/fifo/uchan.h>
 
 struct nvif_device_priv {
 	struct nvkm_object object;
@@ -95,6 +97,27 @@ nvkm_udevice_time(struct nvif_device_priv *udev)
 	return nvkm_timer_read(udev->device->timer);
 }
 
+static int
+nvkm_udevice_chan_new(struct nvif_device_priv *udev, u8 runl, u8 runq, bool priv, u16 devm,
+		      struct nvif_vmm_priv *uvmm, struct nvif_ctxdma_priv *push,
+		      u64 offset, u64 length, struct nvif_mem_priv *userd, u16 userd_offset,
+		      const char *name, const struct nvif_chan_impl **pimpl,
+		      struct nvif_chan_priv **ppriv, u64 handle)
+{
+	struct nvkm_vmm *vmm = nvkm_uvmm_ref(uvmm);
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_uchan_new(udev->device, NULL, runl, runq, priv, devm, vmm,
+			     push, offset, length, userd, userd_offset, name,
+			     pimpl, ppriv, &object);
+	nvkm_vmm_unref(&vmm);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+}
+
 static int
 nvkm_udevice_cgrp_new(struct nvif_device_priv *udev, u8 runl, struct nvif_vmm_priv *uvmm,
 		      const char *name, const struct nvif_cgrp_impl **pimpl,
@@ -394,6 +417,7 @@ nvkm_udevice_new(struct nvkm_device *device,
 			nvkm_ufifo_ctor(device->fifo, &udev->impl.fifo);
 
 			udev->impl.fifo.cgrp.new = nvkm_udevice_cgrp_new;
+			udev->impl.fifo.chan.new = nvkm_udevice_chan_new;
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 1894a2075079..181c8cf426ab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -69,44 +69,6 @@ nvkm_fifo_fault(struct nvkm_fifo *fifo, struct nvkm_fault_data *info)
 	return fifo->func->mmu_fault->recover(fifo, info);
 }
 
-static int
-nvkm_fifo_class_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
-		    void *argv, u32 argc, struct nvkm_object **pobject)
-{
-	struct nvkm_fifo *fifo = nvkm_fifo(oclass->engine);
-
-	if (oclass->engn == &fifo->func->chan.user)
-		return nvkm_uchan_new(fifo, NULL, oclass, argv, argc, pobject);
-
-	WARN_ON(1);
-	return -ENOSYS;
-}
-
-static const struct nvkm_device_oclass
-nvkm_fifo_class = {
-	.ctor = nvkm_fifo_class_new,
-};
-
-static int
-nvkm_fifo_class_get(struct nvkm_oclass *oclass, int index, const struct nvkm_device_oclass **class)
-{
-	struct nvkm_fifo *fifo = nvkm_fifo(oclass->engine);
-	const struct nvkm_fifo_func_chan *chan = &fifo->func->chan;
-	int c = 0;
-
-	/* *_CHANNEL_DMA, *_CHANNEL_GPFIFO_* */
-	if (chan->user.oclass) {
-		if (c++ == index) {
-			oclass->base = chan->user;
-			oclass->engn = &fifo->func->chan.user;
-			*class = &nvkm_fifo_class;
-			return 0;
-		}
-	}
-
-	return c;
-}
-
 static int
 nvkm_fifo_fini(struct nvkm_engine *engine, bool suspend)
 {
@@ -281,7 +243,6 @@ nvkm_fifo = {
 	.oneinit = nvkm_fifo_oneinit,
 	.init = nvkm_fifo_init,
 	.fini = nvkm_fifo_fini,
-	.base.sclass = nvkm_fifo_class_get,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
index d1386d00fc36..cd02f31b601a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -205,7 +205,4 @@ extern const struct nvkm_engn_func ga100_engn;
 extern const struct nvkm_engn_func ga100_engn_ce;
 extern const struct nvkm_cgrp_func ga100_cgrp;
 extern const struct nvkm_chan_func ga100_chan;
-
-int nvkm_uchan_new(struct nvkm_fifo *, struct nvkm_cgrp *, const struct nvkm_oclass *,
-		   void *argv, u32 argc, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
index 8acfd85cee53..90a85c1c0b56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
@@ -25,6 +25,7 @@
 #include "runl.h"
 
 #include <subdev/mmu/uvmm.h>
+#include <engine/fifo/uchan.h>
 
 struct nvif_cgrp_priv {
 	struct nvkm_object object;
@@ -34,32 +35,23 @@ struct nvif_cgrp_priv {
 };
 
 static int
-nvkm_ucgrp_chan_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		    struct nvkm_object **pobject)
+nvkm_ucgrp_chan_new(struct nvif_cgrp_priv *ucgrp, u8 runq, bool priv, u16 devm,
+		    u64 gpfifo_offset, u64 gpfifo_length,
+		    struct nvif_mem_priv *userd, u16 userd_offset, const char *name,
+		    const struct nvif_chan_impl **pimpl, struct nvif_chan_priv **ppriv)
 {
-	struct nvkm_cgrp *cgrp = container_of(oclass->parent, struct nvif_cgrp_priv, object)->cgrp;
-
-	return nvkm_uchan_new(cgrp->runl->fifo, cgrp, oclass, argv, argc, pobject);
-}
+	struct nvkm_cgrp *cgrp = ucgrp->cgrp;
+	struct nvkm_object *object;
+	int ret;
 
-static int
-nvkm_ucgrp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *oclass)
-{
-	struct nvkm_cgrp *cgrp = container_of(object, struct nvif_cgrp_priv, object)->cgrp;
-	struct nvkm_fifo *fifo = cgrp->runl->fifo;
-	const struct nvkm_fifo_func_chan *chan = &fifo->func->chan;
-	int c = 0;
-
-	/* *_CHANNEL_GPFIFO_* */
-	if (chan->user.oclass) {
-		if (c++ == index) {
-			oclass->base = chan->user;
-			oclass->ctor = nvkm_ucgrp_chan_new;
-			return 0;
-		}
-	}
+	ret = nvkm_uchan_new(cgrp->runl->fifo->engine.subdev.device, cgrp, cgrp->runl->id,
+			     runq, priv, devm, cgrp->vmm, NULL, gpfifo_offset, gpfifo_length,
+			     userd, userd_offset, name, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
 
-	return -EINVAL;
+	nvkm_object_link(&ucgrp->object, object);
+	return 0;
 }
 
 static void
@@ -73,6 +65,7 @@ nvkm_ucgrp_del(struct nvif_cgrp_priv *ucgrp)
 static const struct nvif_cgrp_impl
 nvkm_ucgrp_impl = {
 	.del = nvkm_ucgrp_del,
+	.chan.new = nvkm_ucgrp_chan_new,
 };
 
 static void *
@@ -87,7 +80,6 @@ nvkm_ucgrp_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_ucgrp = {
 	.dtor = nvkm_ucgrp_dtor,
-	.sclass = nvkm_ucgrp_sclass,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 23d992413442..f21cd52d5ae3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -24,10 +24,12 @@
 #include "chan.h"
 #include "chid.h"
 #include "runl.h"
+#include "uchan.h"
 
 #include <core/gpuobj.h>
 #include <core/oproxy.h>
 #include <subdev/mmu.h>
+#include <subdev/mmu/umem.h>
 #include <engine/dma.h>
 
 #include <nvif/if0020.h>
@@ -35,6 +37,8 @@
 struct nvif_chan_priv {
 	struct nvkm_object object;
 	struct nvkm_chan *chan;
+
+	struct nvif_chan_impl impl;
 };
 
 static int
@@ -267,6 +271,20 @@ nvkm_uchan_map(struct nvkm_object *object, void *argv, u32 argc,
 	return 0;
 }
 
+static void
+nvkm_uchan_del(struct nvif_chan_priv *uchan)
+{
+	struct nvkm_object *object = &uchan->object;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_chan_impl
+nvkm_uchan_impl = {
+	.del = nvkm_uchan_del,
+};
+
 static int
 nvkm_uchan_fini(struct nvkm_object *object, bool suspend)
 {
@@ -326,92 +344,84 @@ nvkm_uchan_chan(struct nvkm_object *object)
 }
 
 int
-nvkm_uchan_new(struct nvkm_fifo *fifo, struct nvkm_cgrp *cgrp, const struct nvkm_oclass *oclass,
-	       void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_uchan_new(struct nvkm_device *device, struct nvkm_cgrp *cgrp, u8 runi, u8 runq, bool priv,
+	       u16 devm, struct nvkm_vmm *vmm, struct nvif_ctxdma_priv *upush, u64 offset,
+	       u64 length, struct nvif_mem_priv *uuserd, u16 userd_offset, const char *name,
+	       const struct nvif_chan_impl **pimpl, struct nvif_chan_priv **ppriv,
+	       struct nvkm_object **pobject)
 {
-	union nvif_chan_args *args = argv;
+	struct nvkm_fifo *fifo = device->fifo;
 	struct nvkm_runl *runl;
-	struct nvkm_vmm *vmm = NULL;
-	struct nvkm_dmaobj *ctxdma = NULL;
+	struct nvkm_dmaobj *ctxdma = (void *)upush;
 	struct nvkm_memory *userd = NULL;
 	struct nvif_chan_priv *uchan;
+	struct nvkm_engine *engine;
 	struct nvkm_chan *chan;
 	int ret;
 
-	if (argc < sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	argc -= sizeof(args->v0);
-
-	if (args->v0.namelen != argc)
-		return -EINVAL;
-
 	/* Lookup objects referenced in args. */
-	runl = nvkm_runl_get(fifo, args->v0.runlist, 0);
+	runl = nvkm_runl_get(fifo, runi, 0);
 	if (!runl)
 		return -EINVAL;
 
-	if (args->v0.vmm) {
-		vmm = nvkm_uvmm_search(oclass->client, args->v0.vmm);
-		if (IS_ERR(vmm))
-			return PTR_ERR(vmm);
-	}
+	ctxdma = (void *)upush;
+	userd = nvkm_umem_ref(uuserd);
 
-	if (args->v0.ctxdma) {
-		ctxdma = nvkm_dmaobj_search(oclass->client, args->v0.ctxdma);
-		if (IS_ERR(ctxdma)) {
-			ret = PTR_ERR(ctxdma);
-			goto done;
-		}
+	/* Allocate channel. */
+	uchan = kzalloc(sizeof(*uchan), GFP_KERNEL);
+	if (!uchan) {
+		nvkm_memory_unref(&userd);
+		return -ENOMEM;
 	}
 
-	if (args->v0.huserd) {
-		userd = nvkm_umem_search(fifo->engine.subdev.device->mmu, oclass->client, args->v0.huserd);
-		if (IS_ERR(userd)) {
-			ret = PTR_ERR(userd);
-			userd = NULL;
-			goto done;
-		}
+	engine = nvkm_engine_ref(&fifo->engine);
+	if (IS_ERR(engine)) {
+		kfree(uchan);
+		nvkm_memory_unref(&userd);
+		return PTR_ERR(engine);
 	}
 
-	/* Allocate channel. */
-	if (!(uchan = kzalloc(sizeof(*uchan), GFP_KERNEL))) {
-		ret = -ENOMEM;
-		goto done;
-	}
+	nvkm_object_ctor(&nvkm_uchan, &(struct nvkm_oclass) { .engine = engine }, &uchan->object);
 
-	nvkm_object_ctor(&nvkm_uchan, oclass, &uchan->object);
-	*pobject = &uchan->object;
+	ret = nvkm_chan_new_(fifo->func->chan.func, runl, runq, cgrp, name, priv, devm,
+			     vmm, ctxdma, offset, length, userd, userd_offset,
+			     &uchan->chan);
+	if (ret)
+		goto done;
 
-	ret = nvkm_chan_new_(fifo->func->chan.func, runl, args->v0.runq, cgrp, args->v0.name,
-			     args->v0.priv != 0, args->v0.devm, vmm, ctxdma, args->v0.offset,
-			     args->v0.length, userd, args->v0.ouserd, &uchan->chan);
+	ret = nvkm_uchan_init(&uchan->object);
 	if (ret)
 		goto done;
 
 	chan = uchan->chan;
 
 	/* Return channel info to caller. */
+	uchan->impl = nvkm_uchan_impl;
+	uchan->impl.id = chan->id;
 	if (chan->func->doorbell_handle)
-		args->v0.token = chan->func->doorbell_handle(chan);
-	else
-		args->v0.token = ~0;
-
-	args->v0.chid = chan->id;
+		uchan->impl.doorbell_token = chan->func->doorbell_handle(chan);
 
 	switch (nvkm_memory_target(chan->inst->memory)) {
-	case NVKM_MEM_TARGET_INST: args->v0.aper = NVIF_CHAN_V0_INST_APER_INST; break;
-	case NVKM_MEM_TARGET_VRAM: args->v0.aper = NVIF_CHAN_V0_INST_APER_VRAM; break;
-	case NVKM_MEM_TARGET_HOST: args->v0.aper = NVIF_CHAN_V0_INST_APER_HOST; break;
-	case NVKM_MEM_TARGET_NCOH: args->v0.aper = NVIF_CHAN_V0_INST_APER_NCOH; break;
+	case NVKM_MEM_TARGET_INST: uchan->impl.inst.aper = NVIF_CHAN_INST_APER_INST; break;
+	case NVKM_MEM_TARGET_VRAM: uchan->impl.inst.aper = NVIF_CHAN_INST_APER_VRAM; break;
+	case NVKM_MEM_TARGET_HOST: uchan->impl.inst.aper = NVIF_CHAN_INST_APER_HOST; break;
+	case NVKM_MEM_TARGET_NCOH: uchan->impl.inst.aper = NVIF_CHAN_INST_APER_NCOH; break;
 	default:
 		WARN_ON(1);
 		ret = -EFAULT;
-		break;
+		goto done;
 	}
 
-	args->v0.inst = nvkm_memory_addr(chan->inst->memory);
+	uchan->impl.inst.addr = nvkm_memory_addr(chan->inst->memory);
+
+	*pimpl = &uchan->impl;
+	*ppriv = uchan;
+	*pobject = &uchan->object;
+
 done:
+	if (ret)
+		nvkm_uchan_del(uchan);
+
 	nvkm_memory_unref(&userd);
-	nvkm_vmm_unref(&vmm);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.h
new file mode 100644
index 000000000000..1ab4047644ef
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UCHAN_H__
+#define __NVKM_UCHAN_H__
+#include <engine/fifo.h>
+#include <nvif/driverif.h>
+
+int nvkm_uchan_new(struct nvkm_device *, struct nvkm_cgrp *, u8 runl, u8 runq, bool priv, u16 devm,
+		   struct nvkm_vmm *, struct nvif_ctxdma_priv *push, u64 offset, u64 length,
+		   struct nvif_mem_priv *userd, u16 userd_offset, const char *name,
+		   const struct nvif_chan_impl **, struct nvif_chan_priv **, struct nvkm_object **);
+#endif
-- 
2.41.0

