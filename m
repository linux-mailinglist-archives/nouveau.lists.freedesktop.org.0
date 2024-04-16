Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A58A7938
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73E8112FA6;
	Tue, 16 Apr 2024 23:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sn2yd1Bn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2042.outbound.protection.outlook.com [40.107.95.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B63112FD2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXz22iRVP8EGZSD2exkRu/tOV7Q7JZBHyarRHyeDOKFV/RdJP8fmS7q/ZIfw57lZk6KTHp1e03GDZvqzCrKtWKYLOCA9BneZkNFaiXG4Gu4ZsQiAHq7iHC69ZQoxSvb1AQsbjI8wBGnGedlHvK+k7mCRVhZtPh2H09BySaxuONhqvuUFX7Ww6KTgagHMSpjAg3TVz7yqEnMcZAr31SNhG97gwn/GYTUC7wgN7XiguzsGw1RUiz+8imjBiagPnpLlk+UnUmDfGeK5j9xl129u9H/xw6mYGiMgEy1oVvaVn8jNx3kAUyWAyn9JF4w+ZaTQGFTRiB2T2fVrU4MlZ9+WWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylgi3APASX2mwrp+7VnSFkXpKWLNuSCap/4VdFy3OEE=;
 b=Oy+7zgjOoa4sKqLD3WCCVpWdpxYZYG6yAztLrw3lnN+TO1qleVnJb+W/XryNGCdcCGN4Ok6KpWnfmUeJwa/4BMoPMVU+f6as9tzjuRSlJTHF1rG6ZYICb4VJ/f2hIZKcqw+pQVaGyrTfK307Yx4PhoYiZeQdqUvWVw1gpMAcIFGPHsQw4NhisswFA0VWpZkiclANnAS9cFTOFNWP9L5N28Tb8fICx3nLPVbDihTneYIOhy7FFO8yu/dgblZLP/Z3vtBC3rGNa3Zcqtk3anMrj1SO5FR1a+hjAg7maPmgoypWXGRwWyLlUOFhKKEaM/GNM+2CIPPF5zucoiKoD95GFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylgi3APASX2mwrp+7VnSFkXpKWLNuSCap/4VdFy3OEE=;
 b=Sn2yd1BnXES/hsTPqYyTG7WSqkACnPHSaUabmyqXJGCQZare3Pfm5vRe70dmurvYjCt/+l9Y8xasXCYy0En51qEGjcL4iIKaqmZzXDX9kH3LvDdill3TP6NXoXiICYnm+zEXA8FrZxGfx3wSE6QMnJpPZakmIBrsOZIe0Tdba/PEXNgWyjqxz3jvjA5Qnjndk+UWLtZuiJUlcMWGyxUYv5nJ/9/qtKBNUHkLkdPaDdhw2foy2y9S9JDJU9vhMcJ8zcvm+KgmwHOI5oTddreRN2s8d92UpXux9WFqi1ZUp3cTWAXJKdsGg3rvZHFM8jT695ynp3zzpbcfjj7UqFxwjw==
Received: from DM6PR06CA0090.namprd06.prod.outlook.com (2603:10b6:5:336::23)
 by DM6PR12MB4089.namprd12.prod.outlook.com (2603:10b6:5:213::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:29 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::7c) by DM6PR06CA0090.outlook.office365.com
 (2603:10b6:5:336::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:14 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:13 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 143/156] drm/nouveau/nvif: rework chan "new event" apis
Date: Wed, 17 Apr 2024 09:39:49 +1000
Message-ID: <20240416234002.19509-144-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|DM6PR12MB4089:EE_
X-MS-Office365-Filtering-Correlation-Id: 94fa3114-5ca1-497a-abf7-08dc5e6f0487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dxfMGBiy8lq++Jc9DdCMRmxEVlyPymdfygOOwMnotHyvUFehrkioI5Mt4RWTjxa3DIDG/B5ZtUyZf5grXJ657I2iVUU5ameHUHu+Gu5A9Jttk4pmadv9jmfsFU/sUOdpRwVs8Et6eyFrhoXwaLpm1o04u2LV9KHkPDkP/sPgV2EUNFz0vTk6tvkRM3zVduV0gx60ctoj3lQMzYRfrhPBRVz8gesHFJVfTt6XyRN1/LDi9EMr5tYKrFjXJGfSuD1539lc1/0b+3e6pPWhmBDutS6syn24cobyTc8raTIXhF4HUhlrnjRkAU5Dkr916yqG200ci/p+E5+insROyiDalRP73llVAq54EPNBQr5KYuCj1Uk8gx5xrYyiEHtZXrsyLKcXhfjylNSyQbF8r7OCCR8VmqIWXb/LsDGONKzN5IKVRDSmXHDTgVhZ/if5pKRFa8hTxwCYXxOyiWdTB+T9+lF7JiZmXYTPy6CuUcgxSqxUVwpA02kX8dn9/WAx3XvSCpwmQig/k4Mo5C9cO2GoCHB1pjKmi4RtoWpe4NDB4GJDT7mr5XoMvqsS68GyvY/j8bccfiYss750a9W8mz70Dq9A9Iwb6QstYn43k0ccYXKOVpjf3S3+5HFzdgxyuTqQyBefqX9qKjpYWKWQpO5tksPuib+NU/noXdnR4sQO47T4djrUMCULenpp7YdhZjdctb+hXJN/eVNdD547gDbquvNHe5YE/EX2omDa+sHcKu6qpm4KcY7LlpdUevCWomAR
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:28.8430 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94fa3114-5ca1-497a-abf7-08dc5e6f0487
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
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
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  6 +++
 drivers/gpu/drm/nouveau/include/nvif/class.h  |  1 -
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  7 +++
 drivers/gpu/drm/nouveau/include/nvif/if0020.h | 13 -----
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 15 ++----
 drivers/gpu/drm/nouveau/nouveau_fence.c       | 17 ++----
 drivers/gpu/drm/nouveau/nvif/chan.c           | 17 ++++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |  2 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 53 +++++++++----------
 9 files changed, 60 insertions(+), 71 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0020.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/chan.h b/drivers/gpu/drm/nouveau/include/nvif/chan.h
index 80f7ea8c7268..45c82cef6b1d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/chan.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/chan.h
@@ -3,6 +3,7 @@
 #define __NVIF_CHAN_H__
 #include <nvif/object.h>
 #include <nvif/driverif.h>
+#include <nvif/event.h>
 #include <nvif/push.h>
 struct nvif_cgrp;
 struct nvif_device;
@@ -22,4 +23,9 @@ struct nvif_chan {
 void nvif_chan_ctor(struct nvif_device *, struct nvif_cgrp *, const char *name, u8 runl, u8 runq,
 		    struct nvif_chan *);
 void nvif_chan_dtor(struct nvif_chan *);
+
+int nvif_chan_event_ctor(struct nvif_chan *, const char *name,
+			 int (*ctor)(struct nvif_chan_priv *, u64 token,
+				     const struct nvif_event_impl **, struct nvif_event_priv **),
+			 nvif_event_func, struct nvif_event *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 6174999eacd3..517bac332797 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -33,7 +33,6 @@
 #define NVIF_CLASS_HEAD                              /* if0013.h */  0x80000013
 #define NVIF_CLASS_DISP_CHAN                         /* if0014.h */  0x80000014
 
-#define NVIF_CLASS_CHAN                              /* if0020.h */  0x80000020
 #define NVIF_CLASS_CGRP                              /* if0021.h */  0x80000021
 
 /* the below match nvidia-assigned (either in hw, or sw) class numbers */
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 75861e0327ac..6e109da67bbe 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -448,6 +448,13 @@ struct nvif_chan_impl {
 	} inst;
 
 	struct nvif_mapinfo map;
+
+	struct {
+		int (*killed)(struct nvif_chan_priv *, u64 token,
+			      const struct nvif_event_impl **, struct nvif_event_priv **);
+		int (*nonstall)(struct nvif_chan_priv *, u64 token,
+				const struct nvif_event_impl **, struct nvif_event_priv **);
+	} event;
 };
 
 struct nvif_cgrp_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0020.h b/drivers/gpu/drm/nouveau/include/nvif/if0020.h
deleted file mode 100644
index 1893b8aa0abb..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0020.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0020_H__
-#define __NVIF_IF0020_H__
-
-union nvif_chan_event_args {
-	struct nvif_chan_event_v0 {
-		__u8 version;
-#define NVIF_CHAN_EVENT_V0_NON_STALL_INTR 0x00
-#define NVIF_CHAN_EVENT_V0_KILLED         0x01
-		__u8 type;
-	} v0;
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 60be87d5fd59..7116d61535f8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -25,7 +25,6 @@
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
-#include <nvif/if0020.h>
 
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
@@ -368,17 +367,9 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	if (chan->chan.object.oclass >= FERMI_CHANNEL_GPFIFO) {
-		struct {
-			struct nvif_event_v0 base;
-			struct nvif_chan_event_v0 host;
-		} args;
-
-		args.host.version = 0;
-		args.host.type = NVIF_CHAN_EVENT_V0_KILLED;
-
-		ret = nvif_event_ctor(&chan->chan.object, "abi16ChanKilled", chan->chid,
-				      nouveau_channel_killed, false,
-				      &args.base, sizeof(args), &chan->kill);
+		ret = nvif_chan_event_ctor(&chan->chan, "abi16ChanKilled",
+					   chan->chan.impl->event.killed,
+					   nouveau_channel_killed, &chan->kill);
 		if (ret == 0)
 			ret = nvif_event_allow(&chan->kill);
 		if (ret) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ff31784effeb..9443cbaa8cff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -29,8 +29,6 @@
 #include <linux/sched/signal.h>
 #include <trace/events/dma_fence.h>
 
-#include <nvif/if0020.h>
-
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
 #include "nouveau_fence.h"
@@ -184,10 +182,6 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	struct nouveau_cli *cli = chan->cli;
 	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_fence_priv *priv = (void*)drm->fence;
-	struct {
-		struct nvif_event_v0 base;
-		struct nvif_chan_event_v0 host;
-	} args;
 	int ret;
 
 	INIT_WORK(&fctx->uevent_work, nouveau_fence_uevent_work);
@@ -207,14 +201,9 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	if (!priv->uevent)
 		return;
 
-	args.host.version = 0;
-	args.host.type = NVIF_CHAN_EVENT_V0_NON_STALL_INTR;
-
-	ret = nvif_event_ctor(&chan->chan.object, "fenceNonStallIntr",
-			      (chan->runlist << 16) | chan->chid,
-			      nouveau_fence_wait_uevent_handler, false,
-			      &args.base, sizeof(args), &fctx->event);
-
+	ret = nvif_chan_event_ctor(&chan->chan, "fenceNonStallIntr",
+				   chan->chan.impl->event.nonstall,
+				   nouveau_fence_wait_uevent_handler, &fctx->event);
 	WARN_ON(ret);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
index cfca4dac5388..e8ade9a64d97 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -23,6 +23,23 @@
 #include <nvif/cgrp.h>
 #include <nvif/device.h>
 
+int
+nvif_chan_event_ctor(struct nvif_chan *chan, const char *name,
+		     int (*ctor)(struct nvif_chan_priv *, u64,
+				 const struct nvif_event_impl **, struct nvif_event_priv **),
+		     nvif_event_func func, struct nvif_event *event)
+{
+	int ret;
+
+	ret = ctor(chan->priv, nvif_handle(&event->object), &event->impl, &event->priv);
+	NVIF_ERRON(ret, &chan->object, "[NEW EVENT]");
+	if (ret)
+		return ret;
+
+	nvif_event_ctor(&chan->object, name ?: "nvifChanEvent", 0, func, event);
+	return 0;
+}
+
 void
 nvif_chan_dtor(struct nvif_chan *chan)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..920e012d169b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -31,8 +31,6 @@
 #include <subdev/mmu.h>
 #include <engine/dma.h>
 
-#include <nvif/if0020.h>
-
 const struct nvkm_event_func
 nvkm_chan_event = {
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index e9279902c472..ed1e53b15be4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -32,8 +32,6 @@
 #include <subdev/mmu/umem.h>
 #include <engine/dma.h>
 
-#include <nvif/if0020.h>
-
 struct nvif_chan_priv {
 	struct nvkm_object object;
 	struct nvkm_chan *chan;
@@ -41,32 +39,6 @@ struct nvif_chan_priv {
 	struct nvif_chan_impl impl;
 };
 
-static int
-nvkm_uchan_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
-{
-	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
-	struct nvkm_runl *runl = chan->cgrp->runl;
-	union nvif_chan_event_args *args = argv;
-
-	if (!uevent)
-		return 0;
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
-	switch (args->v0.type) {
-	case NVIF_CHAN_EVENT_V0_NON_STALL_INTR:
-		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event, runl->id,
-				       NVKM_FIFO_NONSTALL_EVENT, NULL);
-	case NVIF_CHAN_EVENT_V0_KILLED:
-		return nvkm_uevent_add(uevent, &runl->chid->event, chan->id,
-				       NVKM_CHAN_EVENT_ERRORED, NULL);
-	default:
-		break;
-	}
-
-	return -ENOSYS;
-}
-
 struct nvkm_uobj {
 	struct nvkm_oproxy oproxy;
 	struct nvkm_chan *chan;
@@ -254,6 +226,26 @@ nvkm_uchan_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *ocl
 	return -EINVAL;
 }
 
+static int
+nvkm_uchan_event_nonstall(struct nvif_chan_priv *uchan, u64 token,
+			  const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
+{
+	struct nvkm_runl *runl = uchan->chan->cgrp->runl;
+
+	return nvkm_uevent_new_(&uchan->object, token, &runl->fifo->nonstall.event, false,
+				runl->id, NVKM_FIFO_NONSTALL_EVENT, NULL, pimpl, ppriv);
+}
+
+static int
+nvkm_uchan_event_killed(struct nvif_chan_priv *uchan, u64 token,
+			const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
+{
+	struct nvkm_runl *runl = uchan->chan->cgrp->runl;
+
+	return nvkm_uevent_new_(&uchan->object, token, &runl->chid->event, false,
+				uchan->chan->id, NVKM_CHAN_EVENT_ERRORED, NULL, pimpl, ppriv);
+}
+
 static void
 nvkm_uchan_del(struct nvif_chan_priv *uchan)
 {
@@ -266,6 +258,7 @@ nvkm_uchan_del(struct nvif_chan_priv *uchan)
 static const struct nvif_chan_impl
 nvkm_uchan_impl = {
 	.del = nvkm_uchan_del,
+	.event.killed = nvkm_uchan_event_killed,
 };
 
 static int
@@ -313,7 +306,6 @@ nvkm_uchan = {
 	.init = nvkm_uchan_init,
 	.fini = nvkm_uchan_fini,
 	.sclass = nvkm_uchan_sclass,
-	.uevent = nvkm_uchan_uevent,
 };
 
 struct nvkm_chan *
@@ -404,6 +396,9 @@ nvkm_uchan_new(struct nvkm_device *device, struct nvkm_cgrp *cgrp, u8 runi, u8 r
 		uchan->impl.map.length = chan->func->userd->size;
 	}
 
+	if (fifo->func->nonstall)
+		uchan->impl.event.nonstall = nvkm_uchan_event_nonstall;
+
 	*pimpl = &uchan->impl;
 	*ppriv = uchan;
 	*pobject = &uchan->object;
-- 
2.41.0

