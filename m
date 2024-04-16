Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCED8A7943
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE87112FC1;
	Tue, 16 Apr 2024 23:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mio5kN5W";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6A1112FEB
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke7sSJ3bf9hOTmtqljvdaQ+pnNAcA9IJk8kZ9TkE+77wi2DUrLxLnaEClQpddpFsxh+uih5FA4krM9lBqx45D9H2TYLQxn5lybmAWR2ec1Pc7mIhFidj1bj6Y0ZVm/8G9Pl5sz9kJ2OPn8mQDlvIeEodHJOpHgskdls7reUq8BaE+nUvxAFivqyJMeACu7sy7MdSLBGj7kXult5dR1jfINlVG6ZTZ7MMIS5WF3userWSRtN8uCbLl7uoftwviOr8+wDKoXjwbh20LdWbzkppDj2JsmVEZ0zBQlNSAmLAQ4lTajQSfEWrLucNl+CHKTGe7Vx/xAdImeLDT61v6ZXPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5h+qWDZ/Rw77CRK9gHlIU2ue7/kHancwEBbnD7/g1+k=;
 b=l+R9SlTLIH2Jj68wSGpH34BiOQi+vLKP3bJuPsrl1UYkeD+lqOMDRCtGFWC3NZ0CUOXwiJ1BtTQnObQ1VjpzLBnTDIUGNduaNt1stP1+OBYvhRvI2U1JC4qW4J8VuBKKiTak4H4dKjbEgZ7TogZhEYSFpBecpmp+iNLMj+n8/UrHmej6Ym8/GpAIrU/226WXI1SDATe5ViSmoCAnvzGdqGlr7EpEgs/4hy4Hw+JOxJadJtpowe8UzqhfZR+9ugpuGtkqnhbzmnO67mabPeHrYqtHjXGWxpCTS3nR5R8pQtdiNMlOCxqr6wZ+bSoUykeqnuRqqJCGAKXNKdejCb58ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5h+qWDZ/Rw77CRK9gHlIU2ue7/kHancwEBbnD7/g1+k=;
 b=mio5kN5Wytq9Gekxa4mWfnBGyDb4E7mpPkfaYlgAqHzO0y8DAW+OvtEKTmhS4/xTCwBdL0MJCy2jMHldrQSoc5uhs+iC0Lc7TIvBtXS20IA5Cdfoyiz8nG1MOlfmFRXwLjNs1xW2WNZ480Zdv4T3exdWZ6GyUStscAYjtLhn9EXyAobfmFSLakges2slxUBGvIjsgBhuG7G4ucGxtmvj8v1GGrFrtRB5/jmmsJsEyxAtW1+ndmJNfn0bVRQSmv8gWiyIJsG6DqezCIpb7ZivUc7hlJFVjd6cuQCa+PeM4+XlrNGQP6nJSlyUyRVDzNCmuh/JfOW0qIxWWbrnj52gbg==
Received: from CH0P223CA0012.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::29)
 by MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 16 Apr
 2024 23:43:42 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::1) by CH0P223CA0012.outlook.office365.com
 (2603:10b6:610:116::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:15 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 144/156] drm/nouveau/nvif: rework chan "new ctxdma" api
Date: Wed, 17 Apr 2024 09:39:50 +1000
Message-ID: <20240416234002.19509-145-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: cea3aa9d-7766-4504-82da-08dc5e6f0cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cC/HwkEgNDAMV9Dua4y+AW3e6uXsri6b3QTS3HFy4eNHI5CfNREVhLYL6Cy5VbdsAYPYyfnY0/IoocwoOxO0fHVoQ8fQhr0//C8U8h/vK/mCM3ELQrEQQ7Kc7w+KHZdSnVkeUywk541MnFngMT5YQEoNQdJaTjYLSC6VwufolZvuuI28luM+W2GGJ+JNLSi1CXlihQKNtWuK70D6lEGfEhrdJu5ZrFOUD/+lTyn4BZ8zki/TLHeB2jMWS1vN/G7TIqSJbgDKuLvKolFsyXJ8zUL9s2aETCeGhtgDmjJnJX/i7zptAOTpt9NKon0yIPKd6tyZVSFc8e9pKGynEQIFRv4X/is9FCCsyUzNAd0rHNQ4BxYa6p5tS1+ss64as2js0u/M7+KGQDsi8j8IoJe2Zo51Zb0KcXFRhbu21J63nf4L0g7eT6HAQ6zK4JkdagLhf6MGym2WcgTHCMY7yMXKPTMiWoVHfS5Oz54EPv0YXEdKzJvRzJAsJPa5zMmKfCblTyNdIdRYBrxN47sM902XzlkesNtTTi25U5pED09NvIoJKiiuh3b29drxdd8mQb/jJisLTXg+yhYHySk48mBHMc+i5v29rtODAAkVkKVU/f2C4QYURBFBSHRvsFB1Q3laUaidvacqdhKOVW9iAqn2yzf94BToiF7QPDniWNCboQTIn5NFB0emh255Quv+31fI/V4pWilufnfcROIv0yH1Fd7tSTGpxYzOdTAzbuej0cbGOvD24mC/FzbDAgock43G
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:42.5742 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea3aa9d-7766-4504-82da-08dc5e6f0cb4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  4 ++
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  5 ++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 15 +++---
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |  3 +-
 drivers/gpu/drm/nouveau/nouveau_bo0039.c      |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c      |  6 +--
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 16 +++---
 drivers/gpu/drm/nouveau/nouveau_chan.h        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 12 ++---
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  3 +-
 drivers/gpu/drm/nouveau/nv10_fence.c          |  2 +-
 drivers/gpu/drm/nouveau/nv10_fence.h          |  2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c          | 13 +++--
 drivers/gpu/drm/nouveau/nv50_fence.c          |  9 ++--
 drivers/gpu/drm/nouveau/nv84_fence.c          |  4 +-
 drivers/gpu/drm/nouveau/nvif/chan.c           | 17 +++++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 51 +++++++++++++++++++
 17 files changed, 125 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/chan.h b/drivers/gpu/drm/nouveau/include/nvif/chan.h
index 45c82cef6b1d..1115318f8b9d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/chan.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/chan.h
@@ -6,6 +6,7 @@
 #include <nvif/event.h>
 #include <nvif/push.h>
 struct nvif_cgrp;
+struct nvif_ctxdma;
 struct nvif_device;
 
 struct nvif_chan {
@@ -28,4 +29,7 @@ int nvif_chan_event_ctor(struct nvif_chan *, const char *name,
 			 int (*ctor)(struct nvif_chan_priv *, u64 token,
 				     const struct nvif_event_impl **, struct nvif_event_priv **),
 			 nvif_event_func, struct nvif_event *);
+
+int nvif_chan_ctxdma_ctor(struct nvif_chan *, const char *name, u32 handle, s32 oclass,
+			  void *argv, u32 argc, struct nvif_ctxdma *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 6e109da67bbe..8e805633ded5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -455,6 +455,11 @@ struct nvif_chan_impl {
 		int (*nonstall)(struct nvif_chan_priv *, u64 token,
 				const struct nvif_event_impl **, struct nvif_event_priv **);
 	} event;
+
+	struct {
+		int (*new)(struct nvif_chan_priv *, u32 handle, s32 oclass, void *argv, u32 argc,
+			   const struct nvif_ctxdma_impl **, struct nvif_ctxdma_priv **);
+	} ctxdma;
 };
 
 struct nvif_cgrp_impl {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 36cf7b035973..ff310b48fa34 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -138,7 +138,10 @@ static void
 nouveau_abi16_ntfy_fini(struct nouveau_abi16_chan *chan,
 			struct nouveau_abi16_ntfy *ntfy)
 {
-	nvif_object_dtor(&ntfy->object);
+	if (ntfy->ctxdma.impl)
+		nvif_ctxdma_dtor(&ntfy->ctxdma);
+	else
+		nvif_object_dtor(&ntfy->engobj);
 	nvkm_mm_free(&chan->heap, &ntfy->node);
 	list_del(&ntfy->head);
 	kfree(ntfy);
@@ -534,7 +537,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 	list_add(&ntfy->head, &chan->notifiers);
 
 	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16EngObj", init->handle,
-			       oclass, NULL, 0, &ntfy->object);
+			       oclass, NULL, 0, &ntfy->engobj);
 
 	if (ret)
 		nouveau_abi16_ntfy_fini(chan, ntfy);
@@ -595,9 +598,9 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 		args.limit += chan->ntfy->offset;
 	}
 
-	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16Ntfy", info->handle,
-			       NV_DMA_IN_MEMORY, &args, sizeof(args),
-			       &ntfy->object);
+	ret = nvif_chan_ctxdma_ctor(&chan->chan->chan, "abi16Ntfy", info->handle,
+				    NV_DMA_IN_MEMORY, &args, sizeof(args),
+				    &ntfy->ctxdma);
 	if (ret)
 		goto done;
 
@@ -628,7 +631,7 @@ nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS)
 	nouveau_channel_idle(chan->chan);
 
 	list_for_each_entry(ntfy, &chan->notifiers, head) {
-		if (ntfy->object.handle == fini->handle) {
+		if (ntfy->ctxdma.object.handle == fini->handle) {
 			nouveau_abi16_ntfy_fini(chan, ntfy);
 			ret = 0;
 			break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index af6b4e1cefd2..fdf239545c41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -13,7 +13,8 @@ int nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS);
 int nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS);
 
 struct nouveau_abi16_ntfy {
-	struct nvif_object object;
+	struct nvif_ctxdma ctxdma;
+	struct nvif_object engobj;
 	struct list_head head;
 	struct nvkm_mm_node *node;
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index 0b6758e024a1..a69fc865bfcd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -40,7 +40,7 @@ nouveau_bo_mem_ctxdma(struct ttm_buffer_object *bo,
 {
 	if (reg->mem_type == TTM_PL_TT)
 		return NvDmaTT;
-	return chan->vram.handle;
+	return chan->vram.object.handle;
 }
 
 int
@@ -104,6 +104,6 @@ nv04_bo_move_init(struct nouveau_channel *chan, u32 handle)
 		return ret;
 
 	PUSH_MTHD(push, NV039, SET_OBJECT, handle);
-	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_NOTIFIES, chan->cli->drm->ntfy.handle);
+	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_NOTIFIES, chan->cli->drm->ntfy.object.handle);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index c3de17548d97..9fd03b68d56d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -144,8 +144,8 @@ nv50_bo_move_init(struct nouveau_channel *chan, u32 handle)
 		return ret;
 
 	PUSH_MTHD(push, NV5039, SET_OBJECT, handle);
-	PUSH_MTHD(push, NV5039, SET_CONTEXT_DMA_NOTIFY, chan->cli->drm->ntfy.handle,
-				SET_CONTEXT_DMA_BUFFER_IN, chan->vram.handle,
-				SET_CONTEXT_DMA_BUFFER_OUT, chan->vram.handle);
+	PUSH_MTHD(push, NV5039, SET_CONTEXT_DMA_NOTIFY, chan->cli->drm->ntfy.object.handle,
+				SET_CONTEXT_DMA_BUFFER_IN, chan->vram.object.handle,
+				SET_CONTEXT_DMA_BUFFER_OUT, chan->vram.object.handle);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 7116d61535f8..5ac0756714c1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -97,8 +97,8 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 
 		nvif_object_dtor(&chan->blit);
 		nvif_object_dtor(&chan->nvsw);
-		nvif_object_dtor(&chan->gart);
-		nvif_object_dtor(&chan->vram);
+		nvif_ctxdma_dtor(&chan->gart);
+		nvif_ctxdma_dtor(&chan->vram);
 		nvif_event_dtor(&chan->kill);
 		nvif_object_unmap_cpu(&chan->userd.map);
 		nvif_chan_dtor(&chan->chan);
@@ -393,9 +393,9 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.limit = device->info.ram_user - 1;
 		}
 
-		ret = nvif_object_ctor(&chan->chan.object, "abi16ChanVramCtxDma", vram,
-				       NV_DMA_IN_MEMORY, &args, sizeof(args),
-				       &chan->vram);
+		ret = nvif_chan_ctxdma_ctor(&chan->chan, "abi16ChanVramCtxDma", vram,
+					    NV_DMA_IN_MEMORY, &args, sizeof(args),
+					    &chan->vram);
 		if (ret)
 			return ret;
 
@@ -417,9 +417,9 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.limit = chan->vmm->vmm.impl->limit - 1;
 		}
 
-		ret = nvif_object_ctor(&chan->chan.object, "abi16ChanGartCtxDma", gart,
-				       NV_DMA_IN_MEMORY, &args, sizeof(args),
-				       &chan->gart);
+		ret = nvif_chan_ctxdma_ctor(&chan->chan, "abi16ChanGartCtxDma", gart,
+					    NV_DMA_IN_MEMORY, &args, sizeof(args),
+					    &chan->gart);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 8f71492e2df3..1340c64c4357 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -24,8 +24,8 @@ struct nouveau_channel {
 	u64 inst;
 	u32 token;
 
-	struct nvif_object vram;
-	struct nvif_object gart;
+	struct nvif_ctxdma vram;
+	struct nvif_ctxdma gart;
 	struct nvif_object nvsw;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a2c9e8fa4ebd..28347aa056b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -285,7 +285,7 @@ static void
 nouveau_accel_gr_fini(struct nouveau_drm *drm)
 {
 	nouveau_channel_idle(drm->channel);
-	nvif_object_dtor(&drm->ntfy);
+	nvif_ctxdma_dtor(&drm->ntfy);
 	nvkm_gpuobj_del(&drm->notify);
 	nouveau_channel_del(&drm->channel);
 }
@@ -361,15 +361,15 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 			return;
 		}
 
-		ret = nvif_object_ctor(&drm->channel->chan.object, "drmM2mfNtfy",
-				       NvNotify0, NV_DMA_IN_MEMORY,
-				       (&(struct nv_dma_v0) {
+		ret = nvif_chan_ctxdma_ctor(&drm->channel->chan, "drmM2mfNtfy",
+					    NvNotify0, NV_DMA_IN_MEMORY,
+					    &(struct nv_dma_v0) {
 						.target = NV_DMA_V0_TARGET_VRAM,
 						.access = NV_DMA_V0_ACCESS_RDWR,
 						.start = drm->notify->addr,
 						.limit = drm->notify->addr + 31
-				       }), sizeof(struct nv_dma_v0),
-				       &drm->ntfy);
+					    }, sizeof(struct nv_dma_v0),
+					    &drm->ntfy);
 		if (ret) {
 			nouveau_accel_gr_fini(drm);
 			return;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 823fa6d87690..3d661148943c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -41,6 +41,7 @@
 #include <linux/notifier.h>
 
 #include <nvif/client.h>
+#include <nvif/ctxdma.h>
 #include <nvif/device.h>
 #include <nvif/ioctl.h>
 #include <nvif/mmu.h>
@@ -271,7 +272,7 @@ struct nouveau_drm {
 	struct nouveau_channel *cechan;
 	struct nouveau_channel *channel;
 	struct nvkm_gpuobj *notify;
-	struct nvif_object ntfy;
+	struct nvif_ctxdma ntfy;
 
 	/* nv10-nv40 tiling regions */
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index cbef6ef4bfb7..3e9f184dd4e8 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -60,7 +60,7 @@ nv10_fence_context_del(struct nouveau_channel *chan)
 {
 	struct nv10_fence_chan *fctx = chan->fence;
 	nouveau_fence_context_del(&fctx->base);
-	nvif_object_dtor(&fctx->sema);
+	nvif_ctxdma_dtor(&fctx->sema);
 	chan->fence = NULL;
 	nouveau_fence_context_free(&fctx->base);
 }
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.h b/drivers/gpu/drm/nouveau/nv10_fence.h
index 300cf3fdbb46..414dfb81e812 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.h
+++ b/drivers/gpu/drm/nouveau/nv10_fence.h
@@ -7,7 +7,7 @@
 
 struct nv10_fence_chan {
 	struct nouveau_fence_chan base;
-	struct nvif_object sema;
+	struct nvif_ctxdma sema;
 };
 
 struct nv10_fence_priv {
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 17ff00b22e9e..ba499dfb621d 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -54,7 +54,7 @@ nv17_fence_sync(struct nouveau_fence *fence,
 
 	ret = PUSH_WAIT(ppush, 5);
 	if (!ret) {
-		PUSH_MTHD(ppush, NV176E, SET_CONTEXT_DMA_SEMAPHORE, fctx->sema.handle,
+		PUSH_MTHD(ppush, NV176E, SET_CONTEXT_DMA_SEMAPHORE, fctx->sema.object.handle,
 					 SEMAPHORE_OFFSET, 0,
 					 SEMAPHORE_ACQUIRE, value + 0,
 					 SEMAPHORE_RELEASE, value + 1);
@@ -62,7 +62,7 @@ nv17_fence_sync(struct nouveau_fence *fence,
 	}
 
 	if (!ret && !(ret = PUSH_WAIT(npush, 5))) {
-		PUSH_MTHD(npush, NV176E, SET_CONTEXT_DMA_SEMAPHORE, fctx->sema.handle,
+		PUSH_MTHD(npush, NV176E, SET_CONTEXT_DMA_SEMAPHORE, fctx->sema.object.handle,
 					 SEMAPHORE_OFFSET, 0,
 					 SEMAPHORE_ACQUIRE, value + 1,
 					 SEMAPHORE_RELEASE, value + 2);
@@ -92,15 +92,14 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 	fctx->base.read = nv10_fence_read;
 	fctx->base.sync = nv17_fence_sync;
 
-	ret = nvif_object_ctor(&chan->chan.object, "fenceCtxDma", NvSema,
-			       NV_DMA_FROM_MEMORY,
-			       (&(struct nv_dma_v0) {
+	ret = nvif_chan_ctxdma_ctor(&chan->chan, "fenceCtxDma", NvSema, NV_DMA_FROM_MEMORY,
+				    &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = start,
 					.limit = limit,
-			       }), sizeof(struct nv_dma_v0),
-			       &fctx->sema);
+				    }, sizeof(struct nv_dma_v0),
+				    &fctx->sema);
 	if (ret)
 		nv10_fence_context_del(chan);
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index b418439e6bb1..405a3f8ff4d4 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -51,15 +51,14 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 	fctx->base.read = nv10_fence_read;
 	fctx->base.sync = nv17_fence_sync;
 
-	ret = nvif_object_ctor(&chan->chan.object, "fenceCtxDma", NvSema,
-			       NV_DMA_IN_MEMORY,
-			       (&(struct nv_dma_v0) {
+	ret = nvif_chan_ctxdma_ctor(&chan->chan, "fenceCtxDma", NvSema, NV_DMA_IN_MEMORY,
+				    &(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = start,
 					.limit = limit,
-			       }), sizeof(struct nv_dma_v0),
-			       &fctx->sema);
+				    }, sizeof(struct nv_dma_v0),
+				    &fctx->sema);
 	if (ret)
 		nv10_fence_context_del(chan);
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index a9cbea2d1cc0..0626c24ca065 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -38,7 +38,7 @@ nv84_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 	struct nvif_push *push = &chan->chan.push;
 	int ret = PUSH_WAIT(push, 8);
 	if (ret == 0) {
-		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE, chan->vram.handle);
+		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE, chan->vram.object.handle);
 
 		PUSH_MTHD(push, NV826F, SEMAPHOREA,
 			  NVVAL(NV826F, SEMAPHOREA, OFFSET_UPPER, upper_32_bits(virtual)),
@@ -61,7 +61,7 @@ nv84_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 	struct nvif_push *push = &chan->chan.push;
 	int ret = PUSH_WAIT(push, 7);
 	if (ret == 0) {
-		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE, chan->vram.handle);
+		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE, chan->vram.object.handle);
 
 		PUSH_MTHD(push, NV826F, SEMAPHOREA,
 			  NVVAL(NV826F, SEMAPHOREA, OFFSET_UPPER, upper_32_bits(virtual)),
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
index e8ade9a64d97..78f380ef01b7 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -21,8 +21,25 @@
  */
 #include <nvif/chan.h>
 #include <nvif/cgrp.h>
+#include <nvif/ctxdma.h>
 #include <nvif/device.h>
 
+int
+nvif_chan_ctxdma_ctor(struct nvif_chan *chan, const char *name, u32 handle, s32 oclass,
+		      void *argv, u32 argc, struct nvif_ctxdma *ctxdma)
+{
+	int ret;
+
+	ret = chan->impl->ctxdma.new(chan->priv, handle, oclass, argv, argc,
+				     &ctxdma->impl, &ctxdma->priv);
+	NVIF_ERRON(ret, &chan->object, "[NEW ctxdma%04x handle:%08x]", oclass, handle);
+	if (ret)
+		return ret;
+
+	nvif_ctxdma_ctor(&chan->object, name ?: "nvifChanCtxDma", handle, oclass, ctxdma);
+	return 0;
+}
+
 int
 nvif_chan_event_ctor(struct nvif_chan *chan, const char *name,
 		     int (*ctor)(struct nvif_chan_priv *, u64,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index ed1e53b15be4..f6dfba41da8c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -226,6 +226,56 @@ nvkm_uchan_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *ocl
 	return -EINVAL;
 }
 
+static void
+nvkm_uchan_ctxdma_del(struct nvif_ctxdma_priv *priv)
+{
+	struct nvkm_uobj *uobj = (void *)priv;
+	struct nvkm_object *object = &uobj->oproxy.base;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_ctxdma_impl
+nvkm_uchan_ctxdma_impl = {
+	.del = nvkm_uchan_ctxdma_del,
+};
+
+static int
+nvkm_uchan_ctxdma_new(struct nvif_chan_priv *uchan, u32 handle, s32 oclass, void *argv, u32 argc,
+		      const struct nvif_ctxdma_impl **pimpl, struct nvif_ctxdma_priv **ppriv)
+{
+	struct nvkm_dma *dma = uchan->chan->cgrp->runl->fifo->engine.subdev.device->dma;
+	struct nvkm_oclass _oclass = {};
+	struct nvkm_object *object;
+	int i, ret;
+
+	_oclass.client = uchan->object.client;
+	_oclass.parent = &uchan->object;
+	_oclass.engine = &dma->engine;
+	_oclass.handle = handle;
+
+	i = 0;
+	do {
+		_oclass.base.oclass = 0;
+		dma->engine.func->fifo.sclass(&_oclass, i++);
+		if (_oclass.base.oclass == oclass)
+			break;
+	} while (_oclass.base.oclass);
+
+	if (!_oclass.base.oclass)
+		return -EINVAL;
+
+	ret = nvkm_uchan_object_new(&_oclass, argv, argc, &object);
+	if (ret)
+		return ret;
+
+	*pimpl = &nvkm_uchan_ctxdma_impl;
+	*ppriv = (void *)container_of(object, struct nvkm_uobj, oproxy.base);
+
+	nvkm_object_link(&uchan->object, object);
+	return 0;
+}
+
 static int
 nvkm_uchan_event_nonstall(struct nvif_chan_priv *uchan, u64 token,
 			  const struct nvif_event_impl **pimpl, struct nvif_event_priv **ppriv)
@@ -259,6 +309,7 @@ static const struct nvif_chan_impl
 nvkm_uchan_impl = {
 	.del = nvkm_uchan_del,
 	.event.killed = nvkm_uchan_event_killed,
+	.ctxdma.new = nvkm_uchan_ctxdma_new,
 };
 
 static int
-- 
2.41.0

