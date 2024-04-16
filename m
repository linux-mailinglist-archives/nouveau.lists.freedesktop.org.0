Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E7B8A78EB
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8E4112F63;
	Tue, 16 Apr 2024 23:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WHnJftJo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2083.outbound.protection.outlook.com [40.107.96.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97F5112F5E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KYw8LpEO0blSVMPs/jQkF8RrfCnT1aGmYMrJqmFE1hG0toqXjzfyqAuTpJuoO1ffYzD4HzE6Fag01jV3wEqeuqE5bAkp1ddOrEIkTpcjFAlu8ugz9SDZzHZQ7ShWXYMAhHtAbqvyugnQEZznEt7lZePK5SC86zpXmJQKE85P+sEYLQ24enK/Xdy9EOOvEafQ2LCGIO9hmn/Q/evQP6wpWbs7My+sTqvBVfC8FcKyRIhKhMFy2ckToJd3Z6mrQOkeFvjyP52ZqWYbLU45RVRTnYSsZTnrzCfbbF9Zx2DXI3akXOKdLd1BcB4wn5baXdByb7ARiqFq68ai+nrZOWsZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ifc8eDztTKnP1h6QkMfRE+DmEJPpDzutiqaLi5NbWI=;
 b=NvrGpApkZG03mFyX65NgP14LAaEWIaG5VbKYshb6XbIAiDQU4jhu0L4Psd+HwAyhvoc8YemAhY+3v16bfUG4T071ZzQdl/CT04Ws81/f00Rz6LhZq/HaMbE4QX0bV/ajTzdTXpTHC9LJhrh0LVi+y02H0sPk8vSFiKxOKlcxNh9e+nXD2ESiC+IussN1vLQB0U33SsXLxijXh6zpeDE9PllrKlHB2Na6dRs3/4f5ymbzkABW30qI5tn6HSBsBJCobW6YIa4eKfeOl/16Z27WTohzLUE2DKXTR3P1sxeAK9EpuliX1T8OBAofIbNyNE5cgNPHUs8a0/rpaYBY9zcZrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ifc8eDztTKnP1h6QkMfRE+DmEJPpDzutiqaLi5NbWI=;
 b=WHnJftJoNW7IYSQWDHJQajXJWPmRVHkVQ3Rdx4sp1Bl/lA4ss/u/sF8GXv9oZ76QXp4KeclrQ/URoTNcgD7pFOEHtSQW8p4waPN51Xuer4O+KPyg7JtKp4tXEvdolSRbhzJa8MwAntWJCdadN19DQtnO2rdRbAqLI9EArF5zbhaDCtXWRjwHG1qlj4XEN7bXn/0fs8S1qa9q9Q/hgiHs5MW33RMMeYePRQ6u9VOGOHLz6Msj26o6hnjb1cB4kAylbWliAyiHY5rNUuNMATtmV1p585drtB9A5v8dDiJyFwmf3bePYrduA3ofX7dePIGwqIoZdSGPeXKZ7j+ILR4VAQ==
Received: from CH5P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::10)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.56; Tue, 16 Apr
 2024 23:41:58 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::56) by CH5P220CA0002.outlook.office365.com
 (2603:10b6:610:1ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:36 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 057/156] drm/nouveau/nvif: add alternate version of
 nvif_object_ctor()
Date: Wed, 17 Apr 2024 09:38:23 +1000
Message-ID: <20240416234002.19509-58-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: f20bed01-8379-4f37-33db-08dc5e6ece3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3I/RdkOHkNQLN1ExY27NHuUtzxkL2hm1KlahMoouf5d0MtBqqOv5MyxNXGq8KjwBpDfKfwwCUnnfaSD2N/DDJP8QbabheFsqWKOCquhNDEoZhGt7p8iKxi3osNq4PgCVFRZmwSQeNIv+rmVSMvV01Fr6jO7i/EYfwYVcCXpKv6gJaIhlYBX9+SWvugvO/Gr9zdQty5hVYig78TOx7Q/CC8NNejQCzJnqW5CIltkBee5GgeayQWn72CoB/wPYSzW6dPbpyC6FmhgvCoR/m2SoyKdcnYkKKo+7Gva0d3RlxpDY9lW4/muemBrqjKAPN6i93rrcUUq3e1ZkkV1ZcSbxVtnhO8wVvQUUK+XiUgHNScl/ebIMMzn8XDsh5cDHD1ICQNFaXYK5p4huaafsBDrk4VTamnq2kbzKe/l+2T20D9YhAV//8+s088XaB0Qo5REPOznnXToIqx93IMhvUVqlheHEm0uAawJ9fVoH0yq3cRdjR5G+/ITKE7mxgh1ARZ9g8hc1xl5lvUnFlc+sETzI9jS/CCXwwbOX+dzSnHvcKKbCw7giTAiaj4dS5BzpISHihehF5OliSnJxIHPRxhLkWVMcNFoTirW5nMc6CfVSgeIlwLryysBJSyn4enW58teffpQQOBUVLCfUAP9Qp3XkrkHv5GthNrnfAFtaznzyHd6FF5DLqp+G+kcYudrzNmSvhQ3eS2jMNCLh8Xnp9cSuI2TSECp13RtwEGxryxFHOWhN1nV8qCIcXWy+Mv/YfeH5
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:57.7423 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f20bed01-8379-4f37-33db-08dc5e6ece3d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
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

- callers will transition to new args in upcoming patches
- some macro trickery to avoid temporary renames, will be removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/core.c       | 12 ++++++------
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  4 ++--
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  8 ++++----
 drivers/gpu/drm/nouveau/include/nvif/object.h | 12 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  4 ++--
 drivers/gpu/drm/nouveau/nv17_fence.c          |  4 ++--
 drivers/gpu/drm/nouveau/nv50_fence.c          |  4 ++--
 drivers/gpu/drm/nouveau/nvif/object.c         | 18 ++++++++++++++++--
 8 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index 1864f3e3bbc3..a9c3e53ef909 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -84,24 +84,24 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 
 	ret = nvif_object_ctor(&core->chan.base.user, "kmsCoreSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
 			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = disp->sync->offset + 0x0000,
-					.limit = disp->sync->offset + 0x0fff,
-			       }, sizeof(struct nv_dma_v0),
+					.limit = disp->sync->offset + 0x0fff
+			       }), sizeof(struct nv_dma_v0),
 			       &core->sync);
 	if (ret)
 		return ret;
 
 	ret = nvif_object_ctor(&core->chan.base.user, "kmsCoreVramCtxdma", NV50_DISP_HANDLE_VRAM,
 			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = 0,
-					.limit = drm->device.info.ram_user - 1,
-			       }, sizeof(struct nv_dma_v0),
+					.limit = drm->device.info.ram_user - 1
+			       }), sizeof(struct nv_dma_v0),
 			       &core->vram);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 9c942fbd836d..0864d36a06f2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -510,13 +510,13 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 	ret = nvif_object_ctor(&core->chan.base.user, "kmsCrcNtfyCtxDma",
 			       NV50_DISP_HANDLE_CRC_CTX(head, idx),
 			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = ctx->mem.addr,
 					.limit =  ctx->mem.addr
 						+ ctx->mem.size - 1,
-			       }, sizeof(struct nv_dma_v0),
+			       }), sizeof(struct nv_dma_v0),
 			       &ctx->ntfy);
 	if (ret)
 		goto fail_fini;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 1dbf0e73b5de..19606755daf5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -707,24 +707,24 @@ nv50_wndw_ctor(struct nv50_wndw *wndw)
 
 	ret = nvif_object_ctor(&wndw->wndw.base.user, "kmsWndwSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
 			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = disp->sync->offset + 0x0000,
 					.limit = disp->sync->offset + 0x0fff,
-			       }, sizeof(struct nv_dma_v0),
+			       }), sizeof(struct nv_dma_v0),
 			       &wndw->sync);
 	if (ret)
 		return ret;
 
 	ret = nvif_object_ctor(&wndw->wndw.base.user, "kmsWndwVramCtxDma", NV50_DISP_HANDLE_VRAM,
 			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = 0,
 					.limit = drm->device.info.ram_user - 1,
-			       }, sizeof(struct nv_dma_v0),
+			       }), sizeof(struct nv_dma_v0),
 			       &wndw->vram);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 8d205b6af46a..a84cdb423471 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -28,8 +28,16 @@ nvif_object_constructed(struct nvif_object *object)
 	return object->client != NULL;
 }
 
-int  nvif_object_ctor(struct nvif_object *, const char *name, u32 handle,
-		      s32 oclass, void *, u32, struct nvif_object *);
+int nvif_object_ctor_0(struct nvif_object *, const char *name, u32 handle,
+		       s32 oclass, void *, u32, struct nvif_object *);
+void nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
+			struct nvif_object *);
+
+#define nvif_object_ctor_(A,B,C,D,E,F,G,IMPL,...) IMPL
+#define nvif_object_ctor(A...) nvif_object_ctor_(A, nvif_object_ctor_0, \
+						    nvif_object_ctor__, \
+						    nvif_object_ctor_1)(A)
+
 void nvif_object_dtor(struct nvif_object *);
 int  nvif_object_ioctl(struct nvif_object *, void *, u32, void **);
 int  nvif_object_sclass_get(struct nvif_object *, struct nvif_sclass **);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9caadcdb3c29..9c6df2ba52d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -420,12 +420,12 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 
 		ret = nvif_object_ctor(&drm->channel->user, "drmM2mfNtfy",
 				       NvNotify0, NV_DMA_IN_MEMORY,
-				       &(struct nv_dma_v0) {
+				       (&(struct nv_dma_v0) {
 						.target = NV_DMA_V0_TARGET_VRAM,
 						.access = NV_DMA_V0_ACCESS_RDWR,
 						.start = drm->notify->addr,
 						.limit = drm->notify->addr + 31
-				       }, sizeof(struct nv_dma_v0),
+				       }), sizeof(struct nv_dma_v0),
 				       &drm->ntfy);
 		if (ret) {
 			nouveau_accel_gr_fini(drm);
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 4415a6de680b..5b4ceac49225 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -94,12 +94,12 @@ nv17_fence_context_new(struct nouveau_channel *chan)
 
 	ret = nvif_object_ctor(&chan->user, "fenceCtxDma", NvSema,
 			       NV_DMA_FROM_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = start,
 					.limit = limit,
-			       }, sizeof(struct nv_dma_v0),
+			       }), sizeof(struct nv_dma_v0),
 			       &fctx->sema);
 	if (ret)
 		nv10_fence_context_del(chan);
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 8b76cb227f55..1d8792fdd89b 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -53,12 +53,12 @@ nv50_fence_context_new(struct nouveau_channel *chan)
 
 	ret = nvif_object_ctor(&chan->user, "fenceCtxDma", NvSema,
 			       NV_DMA_IN_MEMORY,
-			       &(struct nv_dma_v0) {
+			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
 					.start = start,
 					.limit = limit,
-			       }, sizeof(struct nv_dma_v0),
+			       }), sizeof(struct nv_dma_v0),
 			       &fctx->sema);
 	if (ret)
 		nv10_fence_context_del(chan);
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 8a2a7bfec2f8..0e8340710c11 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -220,9 +220,23 @@ nvif_object_dtor(struct nvif_object *object)
 	object->client = NULL;
 }
 
+void
+nvif_object_ctor_1(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
+		   struct nvif_object *object)
+{
+	object->parent = parent->parent;
+	object->client = parent->client;
+	object->name = name ?: "nvifObject";
+	object->handle = handle;
+	object->oclass = oclass;
+	object->priv = NULL;
+	object->map.ptr = NULL;
+	object->map.size = 0;
+}
+
 int
-nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
-		 s32 oclass, void *data, u32 size, struct nvif_object *object)
+nvif_object_ctor_0(struct nvif_object *parent, const char *name, u32 handle,
+		   s32 oclass, void *data, u32 size, struct nvif_object *object)
 {
 	struct {
 		struct nvif_ioctl_v0 ioctl;
-- 
2.41.0

