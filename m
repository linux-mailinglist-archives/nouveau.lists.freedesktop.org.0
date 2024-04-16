Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6028A793B
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048A5112FDF;
	Tue, 16 Apr 2024 23:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UHe8DZVR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90630112FD2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nonhw/50pRvRnojLdIOh5hWmmBURvkBG2r576TkEBibrJD/rg00JekmcSpOpEkUpaA+mtHw+ETK0Q1fgD5R0Oo8Gm6fVBmhZH8mAy7Gx+DE9tRnFojjpq26JhxvglHUcJAw6tCCtzg/EbHSo11z41NVmGW9w2FBdytdbUCDUekSdqv65HmhQm754M499EwouCKiYTtD/enCLbspyZmV7kd6X/C8YD5FMh1GUn1IujmIQqyqIMnQO/YQ/uvVEQTG42ph0Yxxa4r/ectfGsa31bWgYWnEPKOqYwLuSry3EMID+boOKAjRmj43/cw3pXULgWjVhpuRQO95DeWv5gDOeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7fufDeXmN6pyIOYzuGF3gVJvBHq/PBlrpzzk8tCb7s=;
 b=JqW5i8TxVZz41rEAJwElaYarK6wVk9eh6GKaunBlML86FhrOvPwY6h4iDvxPZYgn40I6TS8oOYYhr+U7bCMCPC843cB0ny2pUxq4CoPqGsYpVesX1a814t+oN0XKIW/Is5cN/trfqzio17vz0hoi8D+D5aGDE0K4AFLoyiY/sXo3fYwzvbVA3aKL7XxQvRmqtEhF7YJXGuqG57JLjit6LN86528L7+4qIAHu/hwmId9C7Qqcrq0ZaW3C/y/ELnHYhsL9n3+2G0UZQDrEas9hUiKQKSQ+4UzjmyriKgDxvkP9rZwE4m1Akg7ObKYnk+iQDj0Ym7WE+Nhny8DqHodhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7fufDeXmN6pyIOYzuGF3gVJvBHq/PBlrpzzk8tCb7s=;
 b=UHe8DZVRV+bhjODPVOmImLt3WIysveXHndxjgJPQbexVDnnao//dl0Rzjn8qXtt1gqfhsmJbq5Dw2irRXFvbORliAciucvTkwvb3iMADYPOu/OnHWwExKBwhhdiIC8hKLdVXqmp1kEntB238ef0DGHSjk0tuwUWAjzlNZ2FSXtdWyik5hHYIkQTaDvO0DL1rtzptyxO/JNUpT7cYR0pHZlnsghPPkqXDQ+lowox07Dk+7oNGpP2EfImNVSJ2BCSX15HRQrI+M0ijgwldGIJEDhArG4BJcD27YS1/I/Ep9yLbATA0JqcrCvuPfjXA2DtFl/Y8JAU7KDZ/dAckGI0KcA==
Received: from CH0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:610:b2::10)
 by SA1PR12MB6752.namprd12.prod.outlook.com (2603:10b6:806:259::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:27 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::f3) by CH0PR13CA0035.outlook.office365.com
 (2603:10b6:610:b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:01 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 132/156] drm/nouveau/nvif: rework disp chan "new ctxdma" api
Date: Wed, 17 Apr 2024 09:39:38 +1000
Message-ID: <20240416234002.19509-133-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|SA1PR12MB6752:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9dcc13-ec4a-415c-38be-08dc5e6f017d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJiSkOwuWaA9lFtsyvjndaxRLUZnHDH419jy4ZiObIlQFFk91CHcDbK7qqmocRWKql3NFojSHzjVOzEDMFtxDtdxh8UtTAaoRuTI1IzFQ92I6aPufGU5igkwo9MIsYlJulWylgrqi+PUrv/6HK+1vknhOqP05QKA5ZaEh5hz+HjaNOu5vNKhqdHUyEkiV/WzZrLjbBGyllwulDfS5gIs3Oc2OpZa1KYhPHVWPZGODLUxUF6KOCnUkPiwa44dNS1L4WRdNa9Eb/AuIEB/E1+NsE5uDO58xKlPEnO9oToK9faM6oWVwkLJbZhge/saS4C+SnuOjGwO06ub1wDLP1BKKB6WIh7WjwD2W0nQlXZVGJFjc76oh15R2VLerbyCTuaCNgakz8sPKwKr56vhSmN1v1NuXh9Gz0dz/jg/S5mmJEPkWlaV1HyKAsGL9imIFYPAZyLzxaWxqMIub8kKptlT5k0L6qfKwI42v+1XFApSGhaxE6cJyAFMKcc0Lw5ig/2hCbqKNAsBcC+RSLeOLVbxUZ3l12pKnxXQjD/cL/XG1H51+gJjzlHsHepd25eBLVNpeisL8k3LFEU0EAYymBvXEBSX88lrLPvZNzfE7sHPmoMgDfYJZK+trN5BGjcARZ9g6gCij6gvcCOLxtI4gBj2mpeUimdlGp+Ey2BEaDS8z0UlrPr3tL4mN3/jOk05vuTR9ETXyqoT9VwXU7603HzVzWDXtaQYgnuNrxIQt9Uc6TEsLRAT0IUKW8ISOQepkLPm
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:23.7413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9dcc13-ec4a-415c-38be-08dc5e6f017d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6752
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
 drivers/gpu/drm/nouveau/dispnv50/core.c       | 36 ++++----
 drivers/gpu/drm/nouveau/dispnv50/core.h       |  5 +-
 drivers/gpu/drm/nouveau/dispnv50/core507d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c        | 22 +++--
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |  3 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c    |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/curs507a.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c       |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c   |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       | 50 +++++------
 drivers/gpu/drm/nouveau/dispnv50/wndw.h       |  8 +-
 drivers/gpu/drm/nouveau/include/nvif/ctxdma.h | 29 ++++++
 .../gpu/drm/nouveau/include/nvif/dispchan.h   |  4 +
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 13 +++
 drivers/gpu/drm/nouveau/nvif/dispchan.c       | 17 ++++
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 89 ++++++++++---------
 .../gpu/drm/nouveau/nvkm/engine/dma/user.c    |  6 --
 .../drm/nouveau/nvkm/engine/dma/usergf100.c   |  5 --
 .../drm/nouveau/nvkm/engine/dma/usergf119.c   |  5 --
 .../drm/nouveau/nvkm/engine/dma/usergv100.c   |  5 --
 .../drm/nouveau/nvkm/engine/dma/usernv50.c    |  6 --
 25 files changed, 181 insertions(+), 144 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/ctxdma.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index 98ccb67fc95b..3306220003ac 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -32,8 +32,8 @@ nv50_core_del(struct nv50_core **pcore)
 {
 	struct nv50_core *core = *pcore;
 	if (core) {
-		nvif_object_dtor(&core->sync);
-		nvif_object_dtor(&core->vram);
+		nvif_ctxdma_dtor(&core->vram);
+		nvif_ctxdma_dtor(&core->sync);
 		nvif_dispchan_dtor(&core->chan);
 		kfree(*pcore);
 		*pcore = NULL;
@@ -75,27 +75,23 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&core->chan.object, "kmsCoreSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
-			       NV_DMA_IN_MEMORY,
-			       (&(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = disp->sync->offset + 0x0000,
-					.limit = disp->sync->offset + 0x0fff
-			       }), sizeof(struct nv_dma_v0),
-			       &core->sync);
+	ret = nvif_dispchan_ctxdma_ctor(&core->chan, "kmsCoreSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
+					NV_DMA_IN_MEMORY, &(struct nv_dma_v0) {
+						.target = NV_DMA_V0_TARGET_VRAM,
+						.access = NV_DMA_V0_ACCESS_RDWR,
+						.start = disp->sync->offset + 0x0000,
+						.limit = disp->sync->offset + 0x0fff,
+					}, sizeof(struct nv_dma_v0), &core->sync);
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&core->chan.object, "kmsCoreVramCtxdma", NV50_DISP_HANDLE_VRAM,
-			       NV_DMA_IN_MEMORY,
-			       (&(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = 0,
-					.limit = drm->device.info.ram_user - 1
-			       }), sizeof(struct nv_dma_v0),
-			       &core->vram);
+	ret = nvif_dispchan_ctxdma_ctor(&core->chan, "kmsCoreVramCtxdma", NV50_DISP_HANDLE_VRAM,
+					NV_DMA_IN_MEMORY, &(struct nv_dma_v0) {
+						.target = NV_DMA_V0_TARGET_VRAM,
+						.access = NV_DMA_V0_ACCESS_RDWR,
+						.start = 0,
+						.limit = drm->device.impl->ram_user - 1,
+					}, sizeof(struct nv_dma_v0), &core->vram);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index 1343a1d224c0..f9223764a1f5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -5,14 +5,15 @@
 #include "crc.h"
 #include <nouveau_encoder.h>
 
+#include <nvif/ctxdma.h>
 #include <nvif/dispchan.h>
 
 struct nv50_core {
 	const struct nv50_core_func *func;
 	struct nvif_dispchan chan;
 
-	struct nvif_object vram;
-	struct nvif_object sync;
+	struct nvif_ctxdma sync;
+	struct nvif_ctxdma vram;
 
 	bool assign_windows;
 };
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index dab9fb984765..4127bc05ea80 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -135,7 +135,7 @@ core507d_init(struct nv50_core *core)
 	if ((ret = PUSH_WAIT(push, 2)))
 		return ret;
 
-	PUSH_MTHD(push, NV507D, SET_CONTEXT_DMA_NOTIFIER, core->sync.handle);
+	PUSH_MTHD(push, NV507D, SET_CONTEXT_DMA_NOTIFIER, core->sync.object.handle);
 	return PUSH_KICK(push);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index 60535526ac89..7e666c07e96a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -125,7 +125,7 @@ corec37d_init(struct nv50_core *core)
 	if ((ret = PUSH_WAIT(push, 2 + windows * 5)))
 		return ret;
 
-	PUSH_MTHD(push, NVC37D, SET_CONTEXT_DMA_NOTIFIER, core->sync.handle);
+	PUSH_MTHD(push, NVC37D, SET_CONTEXT_DMA_NOTIFIER, core->sync.object.handle);
 
 	for (i = 0; i < windows; i++) {
 		PUSH_MTHD(push, NVC37D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS(i),
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 485892c2e775..e522c1e43a64 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -36,7 +36,7 @@ corec57d_init(struct nv50_core *core)
 	if ((ret = PUSH_WAIT(push, 2 + windows * 5)))
 		return ret;
 
-	PUSH_MTHD(push, NVC57D, SET_CONTEXT_DMA_NOTIFIER, core->sync.handle);
+	PUSH_MTHD(push, NVC57D, SET_CONTEXT_DMA_NOTIFIER, core->sync.object.handle);
 
 	for (i = 0; i < windows; i++) {
 		PUSH_MTHD(push, NVC57D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS(i),
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 72ce4ada284f..97905ec648d0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -507,17 +507,15 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&core->chan.object, "kmsCrcNtfyCtxDma",
-			       NV50_DISP_HANDLE_CRC_CTX(head, idx),
-			       NV_DMA_IN_MEMORY,
-			       (&(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = ctx->mem.impl->addr,
-					.limit =  ctx->mem.impl->addr
-						+ ctx->mem.impl->size - 1,
-			       }), sizeof(struct nv_dma_v0),
-			       &ctx->ntfy);
+	ret = nvif_dispchan_ctxdma_ctor(&core->chan, "kmsCrcNtfyCtxDma",
+					NV50_DISP_HANDLE_CRC_CTX(head, idx),
+					NV_DMA_IN_MEMORY, &(struct nv_dma_v0) {
+						.target = NV_DMA_V0_TARGET_VRAM,
+						.access = NV_DMA_V0_ACCESS_RDWR,
+						.start = ctx->mem.impl->addr,
+						.limit = ctx->mem.impl->addr +
+							 ctx->mem.impl->size - 1,
+					}, sizeof(struct nv_dma_v0), &ctx->ntfy);
 	if (ret)
 		goto fail_fini;
 
@@ -531,7 +529,7 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 static inline void
 nv50_crc_ctx_fini(struct nv50_crc_notifier_ctx *ctx)
 {
-	nvif_object_dtor(&ctx->ntfy);
+	nvif_ctxdma_dtor(&ctx->ntfy);
 	nvif_mem_unmap_dtor(&ctx->mem, &ctx->map);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 48564ceddb97..2b722135af87 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -6,6 +6,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_vblank_work.h>
 
+#include <nvif/ctxdma.h>
 #include <nvif/mem.h>
 #include <nvkm/subdev/bios.h>
 #include "nouveau_encoder.h"
@@ -41,7 +42,7 @@ enum nv50_crc_source_type {
 struct nv50_crc_notifier_ctx {
 	struct nvif_mem mem;
 	struct nvif_map map;
-	struct nvif_object ntfy;
+	struct nvif_ctxdma ntfy;
 };
 
 struct nv50_crc_atom {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index 998978967c4c..0da9ed49017e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -61,7 +61,7 @@ crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 		return ret;
 
 	if (source) {
-		PUSH_MTHD(push, NV907D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.handle);
+		PUSH_MTHD(push, NV907D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.object.handle);
 		PUSH_MTHD(push, NV907D, HEAD_SET_CRC_CONTROL(i), crc_args);
 	} else {
 		PUSH_MTHD(push, NV907D, HEAD_SET_CRC_CONTROL(i), crc_args);
@@ -81,7 +81,7 @@ crc907d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 	if ((ret = PUSH_WAIT(push, 2)))
 		return ret;
 
-	PUSH_MTHD(push, NV907D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx ? ctx->ntfy.handle : 0);
+	PUSH_MTHD(push, NV907D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx ? ctx->ntfy.object.handle : 0);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index 6af15f3232d9..87d54616cb11 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -41,7 +41,7 @@ crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 		return ret;
 
 	if (source) {
-		PUSH_MTHD(push, NVC37D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.handle);
+		PUSH_MTHD(push, NVC37D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.object.handle);
 		PUSH_MTHD(push, NVC37D, HEAD_SET_CRC_CONTROL(i), crc_args);
 	} else {
 		PUSH_MTHD(push, NVC37D, HEAD_SET_CRC_CONTROL(i), 0);
@@ -60,7 +60,7 @@ int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 	if ((ret = PUSH_WAIT(push, 2)))
 		return ret;
 
-	PUSH_MTHD(push, NVC37D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx ? ctx->ntfy.handle : 0);
+	PUSH_MTHD(push, NVC37D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx ? ctx->ntfy.object.handle : 0);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
index ad591dcb0bc9..803275a3dd31 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
@@ -37,7 +37,7 @@ static int crcc57d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_
 		return ret;
 
 	if (source) {
-		PUSH_MTHD(push, NVC57D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.handle);
+		PUSH_MTHD(push, NVC57D, HEAD_SET_CONTEXT_DMA_CRC(i), ctx->ntfy.object.handle);
 		PUSH_MTHD(push, NVC57D, HEAD_SET_CRC_CONTROL(i), crc_args);
 	} else {
 		PUSH_MTHD(push, NVC57D, HEAD_SET_CRC_CONTROL(i), 0);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
index 8017cd0bd636..58bfaf036bbb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs507a.c
@@ -77,7 +77,7 @@ static void
 curs507a_prepare(struct nv50_wndw *wndw, struct nv50_head_atom *asyh,
 		 struct nv50_wndw_atom *asyw)
 {
-	u32 handle = nv50_disp(wndw->plane.dev)->core->vram.handle;
+	u32 handle = nv50_disp(wndw->plane.dev)->core->vram.object.handle;
 	u32 offset = asyw->image.offset[0];
 	if (asyh->curs.handle != handle || asyh->curs.offset != offset) {
 		asyh->curs.handle = handle;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 007857ac8542..3a192dd8635a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -274,7 +274,7 @@ nv50_head_atomic_check_lut(struct nv50_head *head,
 			  size, crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
-	asyh->olut.handle = disp->core->vram.handle;
+	asyh->olut.handle = disp->core->vram.object.handle;
 	asyh->olut.buffer = !asyh->olut.buffer;
 
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head507d.c b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
index 634f6166f38d..dc3847f1f1dc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
@@ -265,7 +265,7 @@ head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 		asyh->core.w = asyh->state.mode.hdisplay;
 		asyh->core.h = asyh->state.mode.vdisplay;
 	}
-	asyh->core.handle = disp->core->vram.handle;
+	asyh->core.handle = disp->core->vram.object.handle;
 	asyh->core.offset = 0;
 	asyh->core.format = NV507D_HEAD_SET_PARAMS_FORMAT_A8R8G8B8;
 	asyh->core.kind = NV507D_HEAD_SET_PARAMS_KIND_KIND_PITCH;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 9cab8d20bc68..1e6e27782ce8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -42,7 +42,7 @@
 static void
 nv50_wndw_ctxdma_del(struct nv50_wndw_ctxdma *ctxdma)
 {
-	nvif_object_dtor(&ctxdma->object);
+	nvif_ctxdma_dtor(&ctxdma->ctxdma);
 	list_del(&ctxdma->head);
 	kfree(ctxdma);
 }
@@ -70,7 +70,7 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 	handle = NV50_DISP_HANDLE_WNDW_CTX(kind);
 
 	list_for_each_entry(ctxdma, &wndw->ctxdma.list, head) {
-		if (ctxdma->object.handle == handle)
+		if (ctxdma->ctxdma.object.handle == handle)
 			return ctxdma;
 	}
 
@@ -101,8 +101,8 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 		argc += sizeof(args.gf119);
 	}
 
-	ret = nvif_object_ctor(wndw->ctxdma.parent, "kmsFbCtxDma", handle,
-			       NV_DMA_IN_MEMORY, &args, argc, &ctxdma->object);
+	ret = nvif_dispchan_ctxdma_ctor(&wndw->wndw, "kmsFbCtxDma", handle, NV_DMA_IN_MEMORY,
+					&args.base, argc, &ctxdma->ctxdma);
 	if (ret) {
 		nv50_wndw_ctxdma_del(ctxdma);
 		return ERR_PTR(ret);
@@ -181,7 +181,7 @@ nv50_wndw_ntfy_enable(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
 	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
 
-	asyw->ntfy.handle = wndw->sync.handle;
+	asyw->ntfy.handle = wndw->sync.object.handle;
 	asyw->ntfy.offset = wndw->ntfy;
 	asyw->ntfy.awaken = false;
 	asyw->set.ntfy = true;
@@ -406,7 +406,7 @@ nv50_wndw_atomic_check_lut(struct nv50_wndw *wndw,
 	memset(&asyw->xlut, 0x00, sizeof(asyw->xlut));
 	if ((asyw->ilut = wndw->func->ilut ? ilut : NULL)) {
 		wndw->func->ilut(wndw, asyw, drm_color_lut_size(ilut));
-		asyw->xlut.handle = wndw->vram.handle;
+		asyw->xlut.handle = wndw->vram.object.handle;
 		asyw->xlut.i.buffer = !asyw->xlut.i.buffer;
 		asyw->set.xlut = true;
 	} else {
@@ -557,7 +557,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 		}
 
 		if (asyw->visible)
-			asyw->image.handle[0] = ctxdma->object.handle;
+			asyw->image.handle[0] = ctxdma->ctxdma.object.handle;
 	}
 
 	ret = drm_gem_plane_helper_prepare_fb(plane, state);
@@ -646,8 +646,8 @@ nv50_wndw_destroy(struct drm_plane *plane)
 
 	nvif_dispchan_dtor(&wndw->wimm);
 
-	nvif_object_dtor(&wndw->vram);
-	nvif_object_dtor(&wndw->sync);
+	nvif_ctxdma_dtor(&wndw->vram);
+	nvif_ctxdma_dtor(&wndw->sync);
 	nvif_dispchan_dtor(&wndw->wndw);
 
 	nv50_lut_fini(&wndw->ilut);
@@ -705,27 +705,23 @@ nv50_wndw_ctor(struct nv50_wndw *wndw)
 	if (!wndw->wndw.impl)
 		return 0;
 
-	ret = nvif_object_ctor(&wndw->wndw.object, "kmsWndwSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
-			       NV_DMA_IN_MEMORY,
-			       (&(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = disp->sync->offset + 0x0000,
-					.limit = disp->sync->offset + 0x0fff,
-			       }), sizeof(struct nv_dma_v0),
-			       &wndw->sync);
+	ret = nvif_dispchan_ctxdma_ctor(&wndw->wndw, "kmsWndwSyncCtxdma", NV50_DISP_HANDLE_SYNCBUF,
+					NV_DMA_IN_MEMORY, &(struct nv_dma_v0) {
+						.target = NV_DMA_V0_TARGET_VRAM,
+						.access = NV_DMA_V0_ACCESS_RDWR,
+						.start = disp->sync->offset + 0x0000,
+						.limit = disp->sync->offset + 0x0fff,
+					}, sizeof(struct nv_dma_v0), &wndw->sync);
 	if (ret)
 		return ret;
 
-	ret = nvif_object_ctor(&wndw->wndw.object, "kmsWndwVramCtxDma", NV50_DISP_HANDLE_VRAM,
-			       NV_DMA_IN_MEMORY,
-			       (&(struct nv_dma_v0) {
-					.target = NV_DMA_V0_TARGET_VRAM,
-					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = 0,
-					.limit = drm->device.info.ram_user - 1,
-			       }), sizeof(struct nv_dma_v0),
-			       &wndw->vram);
+	ret = nvif_dispchan_ctxdma_ctor(&wndw->wndw, "kmsWndwVramCtxdma", NV50_DISP_HANDLE_VRAM,
+					NV_DMA_IN_MEMORY, &(struct nv_dma_v0) {
+						.target = NV_DMA_V0_TARGET_VRAM,
+						.access = NV_DMA_V0_ACCESS_RDWR,
+						.start = 0,
+						.limit = drm->device.impl->ram_user - 1,
+					}, sizeof(struct nv_dma_v0), &wndw->vram);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 68092e6445fa..3efad1f3282f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -5,11 +5,13 @@
 #include "atom.h"
 #include "lut.h"
 
+#include <nvif/ctxdma.h>
 #include <nvif/dispchan.h>
 
 struct nv50_wndw_ctxdma {
 	struct list_head head;
-	struct nvif_object object;
+
+	struct nvif_ctxdma ctxdma;
 };
 
 struct nv50_wndw {
@@ -30,8 +32,8 @@ struct nv50_wndw {
 	struct nvif_dispchan wndw;
 	struct nvif_dispchan wimm;
 
-	struct nvif_object vram;
-	struct nvif_object sync;
+	struct nvif_ctxdma vram;
+	struct nvif_ctxdma sync;
 
 	u16 ntfy;
 	u16 sema;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/ctxdma.h b/drivers/gpu/drm/nouveau/include/nvif/ctxdma.h
new file mode 100644
index 000000000000..ff80db834bd1
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/ctxdma.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVIF_CTXDMA_H__
+#define __NVIF_CTXDMA_H__
+#include <nvif/object.h>
+#include <nvif/driverif.h>
+
+struct nvif_ctxdma {
+	const struct nvif_ctxdma_impl *impl;
+	struct nvif_ctxdma_priv *priv;
+	struct nvif_object object;
+};
+
+static inline void
+nvif_ctxdma_ctor(struct nvif_object *parent, const char *name, u32 handle, s32 oclass,
+		 struct nvif_ctxdma *ctxdma)
+{
+	nvif_object_ctor(parent, name, handle, oclass, &ctxdma->object);
+}
+
+static inline void
+nvif_ctxdma_dtor(struct nvif_ctxdma *ctxdma)
+{
+	if (!ctxdma->impl)
+		return;
+
+	ctxdma->impl->del(ctxdma->priv);
+	ctxdma->impl = NULL;
+}
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/dispchan.h b/drivers/gpu/drm/nouveau/include/nvif/dispchan.h
index b1d3503e054c..d76eb35bc1c6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/dispchan.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/dispchan.h
@@ -3,6 +3,7 @@
 #define __NVIF_DISPCHAN_H__
 #include "disp.h"
 #include "push.h"
+struct nvif_ctxdma;
 
 struct nvif_dispchan {
 	const struct nvif_disp_chan_impl *impl;
@@ -18,4 +19,7 @@ int nvif_dispchan_ctor(struct nvif_disp *, const char *name, u32 handle, s32 ocl
 		       struct nvif_mmu *, struct nvif_dispchan *);
 int nvif_dispchan_oneinit(struct nvif_dispchan *);
 void nvif_dispchan_dtor(struct nvif_dispchan *);
+
+int nvif_dispchan_ctxdma_ctor(struct nvif_dispchan *, const char *name, u32 handle, s32 oclass,
+			      void *argv, u32 argc, struct nvif_ctxdma *ctxdma);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index d317fcd29091..8ae50be82a02 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -18,6 +18,7 @@ struct nvif_conn_priv;
 struct nvif_outp_priv;
 struct nvif_head_priv;
 struct nvif_disp_chan_priv;
+struct nvif_ctxdma_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -361,9 +362,21 @@ struct nvif_head_impl {
 		      const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
+#include <nvif/cl0002.h>
+
+struct nvif_ctxdma_impl {
+	void (*del)(struct nvif_ctxdma_priv *);
+};
+
 struct nvif_disp_chan_impl {
 	void (*del)(struct nvif_disp_chan_priv *);
 	struct nvif_mapinfo map;
+
+	struct {
+		int (*new)(struct nvif_disp_chan_priv *, u32 handle, s32 oclass,
+			   struct nv_dma_v0 *argv, u32 argc,
+			   const struct nvif_ctxdma_impl **, struct nvif_ctxdma_priv **);
+	} ctxdma;
 };
 
 struct nvif_disp_impl {
diff --git a/drivers/gpu/drm/nouveau/nvif/dispchan.c b/drivers/gpu/drm/nouveau/nvif/dispchan.c
index fc4f50da1a43..03738de5d791 100644
--- a/drivers/gpu/drm/nouveau/nvif/dispchan.c
+++ b/drivers/gpu/drm/nouveau/nvif/dispchan.c
@@ -20,6 +20,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 #include <nvif/dispchan.h>
+#include <nvif/ctxdma.h>
 #include <nvif/device.h>
 #include <nvif/driverif.h>
 #include <nvif/push507c.h>
@@ -28,6 +29,22 @@
 #include <nvif/class.h>
 #include <nvhw/class/cl507c.h>
 
+int
+nvif_dispchan_ctxdma_ctor(struct nvif_dispchan *chan, const char *name, u32 handle, s32 oclass,
+			  void *argv, u32 argc, struct nvif_ctxdma *ctxdma)
+{
+	int ret;
+
+	ret = chan->impl->ctxdma.new(chan->priv, handle, oclass, argv, argc,
+				     &ctxdma->impl, &ctxdma->priv);
+	NVIF_ERRON(ret, &chan->object, "[NEW ctxdma%04x handle:%08x]", oclass, handle);
+	if (ret)
+		return ret;
+
+	nvif_ctxdma_ctor(&chan->object, name ?: "nvifDispChanCtxdma", handle, oclass, ctxdma);
+	return 0;
+}
+
 static int
 nvif_dispchan_kick(struct nvif_push *push)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index 3a0366420248..4a59c187b76c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -49,77 +49,83 @@ nvkm_disp_chan_ntfy(struct nvkm_object *object, u32 type, struct nvkm_event **pe
 	return -EINVAL;
 }
 
-struct nvkm_disp_chan_object {
+struct nvif_ctxdma_priv {
 	struct nvkm_oproxy oproxy;
 	struct nvkm_disp *disp;
 	int hash;
 };
 
 static void
-nvkm_disp_chan_child_del_(struct nvkm_oproxy *base)
+nvkm_disp_chan_ctxdma_del(struct nvif_ctxdma_priv *ctxdma)
 {
-	struct nvkm_disp_chan_object *object = container_of(base, typeof(*object), oproxy);
+	struct nvkm_object *object = &ctxdma->oproxy.base;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_ctxdma_impl
+nvkm_disp_chan_ctxdma_impl = {
+	.del = nvkm_disp_chan_ctxdma_del,
+};
+
+static void
+nvkm_disp_chan_ctxdma_dtor(struct nvkm_oproxy *base)
+{
+	struct nvif_ctxdma_priv *object = container_of(base, typeof(*object), oproxy);
 
 	nvkm_ramht_remove(object->disp->ramht, object->hash);
 }
 
 static const struct nvkm_oproxy_func
-nvkm_disp_chan_child_func_ = {
-	.dtor[0] = nvkm_disp_chan_child_del_,
+nvkm_disp_chan_ctxdma = {
+	.dtor[0] = nvkm_disp_chan_ctxdma_dtor,
 };
 
+#include <engine/dma/priv.h>
+
 static int
-nvkm_disp_chan_child_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-			 struct nvkm_object **pobject)
+nvkm_disp_chan_ctxdma_new(struct nvif_disp_chan_priv *uchan, u32 handle, s32 oclass,
+			  struct nv_dma_v0 *args, u32 argc,
+			  const struct nvif_ctxdma_impl **pimpl, struct nvif_ctxdma_priv **ppriv)
 {
-	struct nvif_disp_chan_priv *uchan = container_of(oclass->parent, typeof(*uchan), object);
 	struct nvkm_disp_chan *chan = &uchan->chan;
 	struct nvkm_disp *disp = chan->disp;
 	struct nvkm_device *device = disp->engine.subdev.device;
-	const struct nvkm_device_oclass *sclass = oclass->priv;
-	struct nvkm_disp_chan_object *object;
+	struct nvkm_dma *dma = device->dma;
+	struct nvkm_dmaobj *dmaobj;
+	struct nvif_ctxdma_priv *object;
 	int ret;
 
 	if (!(object = kzalloc(sizeof(*object), GFP_KERNEL)))
 		return -ENOMEM;
-	nvkm_oproxy_ctor(&nvkm_disp_chan_child_func_, oclass, &object->oproxy);
+
+	nvkm_oproxy_ctor(&nvkm_disp_chan_ctxdma, &(struct nvkm_oclass) {}, &object->oproxy);
 	object->disp = disp;
-	*pobject = &object->oproxy.base;
 
-	ret = sclass->ctor(device, oclass, argv, argc, &object->oproxy.object);
+	ret = dma->func->class_new(dma, &(struct nvkm_oclass) {
+					.client = uchan->object.client,
+					.base.oclass = oclass
+				   }, args, argc, &dmaobj);
+	object->oproxy.object = &dmaobj->object;
 	if (ret)
-		return ret;
+		goto done;
 
-	object->hash = chan->func->bind(chan, object->oproxy.object, oclass->handle);
-	if (object->hash < 0)
-		return object->hash;
+	object->hash = chan->func->bind(chan, object->oproxy.object, handle);
+	if (object->hash < 0) {
+		ret = object->hash;
+		goto done;
+	}
 
-	return 0;
-}
+	*pimpl = &nvkm_disp_chan_ctxdma_impl;
+	*ppriv = object;
 
-static int
-nvkm_disp_chan_child_get(struct nvkm_object *object, int index, struct nvkm_oclass *sclass)
-{
-	struct nvif_disp_chan_priv *uchan = container_of(object, typeof(*uchan), object);
-	struct nvkm_disp_chan *chan = &uchan->chan;
-	struct nvkm_device *device = chan->disp->engine.subdev.device;
-	const struct nvkm_device_oclass *oclass = NULL;
+	nvkm_object_link(&uchan->object, &object->oproxy.base);
 
-	if (chan->func->bind)
-		sclass->engine = nvkm_device_engine(device, NVKM_ENGINE_DMAOBJ, 0);
-	else
-		sclass->engine = NULL;
-
-	if (sclass->engine && sclass->engine->func->base.sclass) {
-		sclass->engine->func->base.sclass(sclass, index, &oclass);
-		if (oclass) {
-			sclass->ctor = nvkm_disp_chan_child_new;
-			sclass->priv = oclass;
-			return 0;
-		}
-	}
+done:
+	if (ret)
+		nvkm_disp_chan_ctxdma_del(object);
 
-	return -EINVAL;
+	return ret;
 }
 
 static void
@@ -179,7 +185,6 @@ nvkm_disp_chan = {
 	.init = nvkm_disp_chan_init,
 	.fini = nvkm_disp_chan_fini,
 	.ntfy = nvkm_disp_chan_ntfy,
-	.sclass = nvkm_disp_chan_child_get,
 };
 
 int
@@ -224,6 +229,8 @@ nvkm_disp_chan_new(struct nvkm_disp *disp, const struct nvkm_disp_func_chan *fun
 	uchan->impl.map.type = NVIF_MAP_IO;
 	uchan->impl.map.handle = device->func->resource_addr(device, 0);
 	uchan->impl.map.handle += chan->func->user(chan, &uchan->impl.map.length);
+	if (chan->func->bind)
+		uchan->impl.ctxdma.new = nvkm_disp_chan_ctxdma_new;
 
 	if (chan->func->push) {
 		chan->memory = nvkm_memory_ref(memory);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
index 797131ed7d67..463600e4f368 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/user.c
@@ -71,7 +71,6 @@ nvkm_dmaobj_ctor(const struct nvkm_dmaobj_func *func, struct nvkm_dma *dma,
 	union {
 		struct nv_dma_v0 v0;
 	} *args = *pdata;
-	struct nvkm_object *parent = oclass->parent;
 	void *data = *pdata;
 	u32 size = *psize;
 	int ret = -ENOSYS;
@@ -80,12 +79,7 @@ nvkm_dmaobj_ctor(const struct nvkm_dmaobj_func *func, struct nvkm_dma *dma,
 	dmaobj->func = func;
 	dmaobj->dma = dma;
 
-	nvif_ioctl(parent, "create dma size %d\n", *psize);
 	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(parent, "create dma vers %d target %d access %d "
-				   "start %016llx limit %016llx\n",
-			   args->v0.version, args->v0.target, args->v0.access,
-			   args->v0.start, args->v0.limit);
 		dmaobj->target = args->v0.target;
 		dmaobj->access = args->v0.access;
 		dmaobj->start  = args->v0.start;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.c
index ef7ac360101e..23f7c275dd3b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf100.c
@@ -73,7 +73,6 @@ gf100_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	union {
 		struct gf100_dma_v0 v0;
 	} *args;
-	struct nvkm_object *parent = oclass->parent;
 	struct gf100_dmaobj *dmaobj;
 	u32 kind, user, unkn;
 	int ret;
@@ -90,11 +89,7 @@ gf100_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	ret  = -ENOSYS;
 	args = data;
 
-	nvif_ioctl(parent, "create gf100 dma size %d\n", size);
 	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent,
-			   "create gf100 dma vers %d priv %d kind %02x\n",
-			   args->v0.version, args->v0.priv, args->v0.kind);
 		kind = args->v0.kind;
 		user = args->v0.priv;
 		unkn = 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.c
index c068cee34588..5b0f3d39c226 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergf119.c
@@ -71,7 +71,6 @@ gf119_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	union {
 		struct gf119_dma_v0 v0;
 	} *args;
-	struct nvkm_object *parent = oclass->parent;
 	struct gf119_dmaobj *dmaobj;
 	u32 kind, page;
 	int ret;
@@ -88,11 +87,7 @@ gf119_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	ret  = -ENOSYS;
 	args = data;
 
-	nvif_ioctl(parent, "create gf119 dma size %d\n", size);
 	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent,
-			   "create gf100 dma vers %d page %d kind %02x\n",
-			   args->v0.version, args->v0.page, args->v0.kind);
 		kind = args->v0.kind;
 		page = args->v0.page;
 	} else
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.c
index 39eba9fc82be..c027efbcb85b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usergv100.c
@@ -70,7 +70,6 @@ gv100_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	union {
 		struct gf119_dma_v0 v0;
 	} *args;
-	struct nvkm_object *parent = oclass->parent;
 	struct gv100_dmaobj *dmaobj;
 	u32 kind, page;
 	int ret;
@@ -87,11 +86,7 @@ gv100_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	ret  = -ENOSYS;
 	args = data;
 
-	nvif_ioctl(parent, "create gv100 dma size %d\n", size);
 	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent,
-			   "create gv100 dma vers %d page %d kind %02x\n",
-			   args->v0.version, args->v0.page, args->v0.kind);
 		kind = args->v0.kind != 0;
 		page = args->v0.page != 0;
 	} else
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.c
index 6a85b5dea643..2c3b2e7d3c2e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/dma/usernv50.c
@@ -73,7 +73,6 @@ nv50_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	union {
 		struct nv50_dma_v0 v0;
 	} *args;
-	struct nvkm_object *parent = oclass->parent;
 	struct nv50_dmaobj *dmaobj;
 	u32 user, part, comp, kind;
 	int ret;
@@ -90,12 +89,7 @@ nv50_dmaobj_new(struct nvkm_dma *dma, const struct nvkm_oclass *oclass,
 	ret  = -ENOSYS;
 	args = data;
 
-	nvif_ioctl(parent, "create nv50 dma size %d\n", size);
 	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent, "create nv50 dma vers %d priv %d part %d "
-				   "comp %d kind %02x\n", args->v0.version,
-			   args->v0.priv, args->v0.part, args->v0.comp,
-			   args->v0.kind);
 		user = args->v0.priv;
 		part = args->v0.part;
 		comp = args->v0.comp;
-- 
2.41.0

