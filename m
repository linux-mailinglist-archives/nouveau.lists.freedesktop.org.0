Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B576293CD52
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4F410E919;
	Fri, 26 Jul 2024 04:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SCWSDONu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC87B10E911
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m6P3DIyxwGZ0PQ0ZZphTA/oEk4djPo5yKAVmmWAIdM7bpt90DGVe0tvISgYyCM+iJrlEzIcq2rxtKj5Z85oQyXz9lFhCFvUuyYR1l8CiFiB6/qjvsD+KEY2iKsa3CavtsOWDcZ8StkLIHbPRlPy7gG/bX/znyHBnYrPf8XKLFjIbriInpbyihUwNkOBRsEzwn0VLScDfiwDJQN9zSURgOUBxQ1VRwXf5CV1puJ3l9ZtCmqpZTtoubOO9lE1vZlZ7Zst/ZYGZ9HTpWhOWwNEM+SBgVEwwBeNjWiYf/j93M2yX72N0GoFYYhXubzSdwMqgYP+TDQkXp3NGy7yBUN4BmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owjsD44Edkdv9BlVnuGUR+N31ExGTHWsibBGkzPu9ag=;
 b=v+8sfugExQ4hB/gO5jvjj6Lkt+2z5n0EPr/1MQrSq2N/tdB4gx6DYw+yDNz2WN8V2ZoL+rx99IBa+Ek/UBRbS6kSMfjehqtGd90tSuApbnhkI+lD5IVAlGQbdpHpDbTk0980y6IyAhbh6S6S0i5OhOOTT+2joRjm5ceuldt2trF0M6Hv7wci/axq3mzdgXgKlIozX0LRDgFyC4qXmXFa0t8Q0egcBp183Wf/hef7R6ef6r4zT/AfjzN63q/2KkQHv5Bh/MNh28DagV6ZyC5pHQwD7ZaF2xAvcF1TSRPp7v/n6Ov6llcU0DOOSth1w+vhtt/B36zU9TO48BUNbx11aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owjsD44Edkdv9BlVnuGUR+N31ExGTHWsibBGkzPu9ag=;
 b=SCWSDONuEccR0nora5yF3ndoyV+lNvAaFmPosQdJAr3E6zOvLo+htJoGuqcOEUi+ciRt6v47M7JCfrZjnDXdKT9AhwgJpKxg4CBh0XN/rlPunpKAxw03ECk34HC3f7pWQJosFUFlhHVskx3aUoA+Ftx3JPDU07Qs3Axjf7cjUA1H4Iz+vvccRVReXsTi5G+2pBGqHSZORiiDlqpNuoWniQWXWfa0UGEpkFcho7jMmNc3DUcV3zIEUOSp3A5y1h4Mhk+ob9gxaYWbHwn1ApJHKA8dTiOmIYHrJjQsMILBl3/i9iQm+Xoy0itJBDTDxBwC3jYbRPV7ZXfjEU5A06tIcQ==
Received: from DM5PR07CA0073.namprd07.prod.outlook.com (2603:10b6:4:ad::38) by
 SA1PR12MB8948.namprd12.prod.outlook.com (2603:10b6:806:38e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.20; Fri, 26 Jul 2024 04:39:36 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:4:ad:cafe::ed) by DM5PR07CA0073.outlook.office365.com
 (2603:10b6:4:ad::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:25 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:23 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 29/37] drm/nouveau: pass drm to nouveau_mem_new(),
 instead of cli
Date: Fri, 26 Jul 2024 14:38:20 +1000
Message-ID: <20240726043828.58966-30-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|SA1PR12MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb2f6e9-bd36-442d-e867-08dcad2cf3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NHG4GmL9NxX1fe2JLcB8lLZWVPvLe+8OzqyDeQ3+WvyQR/KbasShBOxa++t4?=
 =?us-ascii?Q?QlEIwfwbz/umRGREa7kdK4b3KkxK/WPdiDtRdiqM0j3VKeaDZ+G7F0rrP4qD?=
 =?us-ascii?Q?j1wSO44fCStvBSTr5XW/gTDguhq+eY3iYh9yy+1NA72N14Xh9DvXS4SX3PEE?=
 =?us-ascii?Q?OjNhn0PaBtubak9q1qdCJcnWcDGc+gNrXrK68m51ZrebJKb1k96qjXlbmsQa?=
 =?us-ascii?Q?MuBBtMoWwe9wZdoFHfd49RPNJ5NR5k7g1jNXQBmyAyDf9Mkx8WM2chqeQeUC?=
 =?us-ascii?Q?uASA0erEswM65xdwVnElROuLT9veKukVjABuMXOG++GRVyx622aXAiqYOXuy?=
 =?us-ascii?Q?p0o1XEq816NZ6n0qNPX1dSeVt/ONmNxz/R/FKked98SOahP2+9QjZcnV9qmh?=
 =?us-ascii?Q?XVBTbhVExx6alsHmthmZ/szrbMf+BjkgCFnnCslGpSMjSjAxxqRnXMmbgwmy?=
 =?us-ascii?Q?txPf5rPg6yemcxDXiAaZGstfhEdUGVLoic8lZ1lfLK4W9bjFmXUjOgEO5UoE?=
 =?us-ascii?Q?Zy0/+hngeMaDsxhp0nxOiqHopo1hvFoXJhgnnIOiLACFxt323aUDhVpwkztN?=
 =?us-ascii?Q?hl7KtoU9VtcjA4S5q4T4csFaJc/C/TAKaQukCLhIOiu5v7g0R5wSaIT16Lo+?=
 =?us-ascii?Q?mjysPLHSfuIDtlv7kwzoN6tNk2+4pD416wWTxA6lRgT7aNE0Jjy9w70NuGW+?=
 =?us-ascii?Q?fXN7/Vre1CcGuxQsZVqbqk66DAzJDgTLzt2m0Q5lV6M0xR5xVtsFCfp89qfq?=
 =?us-ascii?Q?FHQir2fZuB9QGi+032Y8fX4PIcdGio8N8R9g5EtyuXARaBncfh8YDsTb2YGd?=
 =?us-ascii?Q?pJvbUgtl2iP36VtGdghDlZf7RrcqoFA/hQ4fjZU4d71hqcdj8nPHFRuAlb9q?=
 =?us-ascii?Q?7S1UhAedGcHkIgBwHkgdv2myywRH++xVOu7aZ66rJ8gHKtHomakp+IdHgmSh?=
 =?us-ascii?Q?jVxf5xEH53X5kfZruX23Qdvq0FkSh2CxnQIsqwmBJ2bGbLC5luefNO3fmKxh?=
 =?us-ascii?Q?dQWczIPkgxz1Ibfvq9KC3QPLcNNxGa/g3DbdB6o8bUnduiZuT8om9I4sCrG2?=
 =?us-ascii?Q?pakqS/s1lEoHxsAGbDAFhR+9sgHXsvCXETuPQn3q98vypmDQxNrIJ7m8DAB7?=
 =?us-ascii?Q?ManLXEP8S8jZegXKDXWJquvPTNy6S+ErWUWUeQlUpTSTVZ1WgspOU68tRacR?=
 =?us-ascii?Q?cBm/fPBU9IhU1wMK+xHGOkurK7wxWzByXpEDXrn8Cp+sjLloWthNjAOGyM2E?=
 =?us-ascii?Q?uLZQ32WfGwDWNsKWmdjF6Cs2uP6FGOnVh8W+ea/xbmKxnWLMgkdm1U4TgdV/?=
 =?us-ascii?Q?fhG0/xCJQFd8EiEqMPVi8TaHL0yh8vFs+6gv1Pc8uLt6xXDGTda2PhKR/HYT?=
 =?us-ascii?Q?R7tuPpST+z+1SFYg9eB9pNiSrgTKeRoysXgzSNue0/lEDXuSZN5hW5n17QZd?=
 =?us-ascii?Q?+43hUiaMNHOI0GnSxeuTFhIgzGd/yF1v?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:36.2031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb2f6e9-bd36-442d-e867-08dcad2cf3fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8948
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

The nouveau_cli pointer is only ever used to eventually access
nouveau_drm, so just store it directly.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c   | 18 ++++++++----------
 drivers/gpu/drm/nouveau/nouveau_mem.h   |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_sgdma.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |  8 ++++----
 4 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 67f93cf753ba..b112b62dca3c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -78,19 +78,18 @@ nouveau_mem_map(struct nouveau_mem *mem,
 void
 nouveau_mem_fini(struct nouveau_mem *mem)
 {
-	nvif_vmm_put(&mem->cli->drm->client.vmm.vmm, &mem->vma[1]);
-	nvif_vmm_put(&mem->cli->drm->client.vmm.vmm, &mem->vma[0]);
-	mutex_lock(&mem->cli->drm->master.lock);
+	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[1]);
+	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[0]);
+	mutex_lock(&mem->drm->master.lock);
 	nvif_mem_dtor(&mem->mem);
-	mutex_unlock(&mem->cli->drm->master.lock);
+	mutex_unlock(&mem->drm->master.lock);
 }
 
 int
 nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
-	struct nouveau_cli *cli = mem->cli;
-	struct nouveau_drm *drm = cli->drm;
+	struct nouveau_drm *drm = mem->drm;
 	struct nvif_mmu *mmu = &drm->mmu;
 	struct nvif_mem_ram_v0 args = {};
 	u8 type;
@@ -126,8 +125,7 @@ int
 nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
-	struct nouveau_cli *cli = mem->cli;
-	struct nouveau_drm *drm = cli->drm;
+	struct nouveau_drm *drm = mem->drm;
 	struct nvif_mmu *mmu = &drm->mmu;
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
@@ -173,7 +171,7 @@ nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
 }
 
 int
-nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
+nouveau_mem_new(struct nouveau_drm *drm, u8 kind, u8 comp,
 		struct ttm_resource **res)
 {
 	struct nouveau_mem *mem;
@@ -181,7 +179,7 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
 	if (!(mem = kzalloc(sizeof(*mem), GFP_KERNEL)))
 		return -ENOMEM;
 
-	mem->cli = cli;
+	mem->drm = drm;
 	mem->kind = kind;
 	mem->comp = comp;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 5365a3d3a17f..a070ee049f6b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -8,7 +8,7 @@ struct ttm_tt;
 
 struct nouveau_mem {
 	struct ttm_resource base;
-	struct nouveau_cli *cli;
+	struct nouveau_drm *drm;
 	u8 kind;
 	u8 comp;
 	struct nvif_mem mem;
@@ -21,7 +21,7 @@ nouveau_mem(struct ttm_resource *reg)
 	return container_of(reg, struct nouveau_mem, base);
 }
 
-int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
+int nouveau_mem_new(struct nouveau_drm *, u8 kind, u8 comp,
 		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource_manager *man,
 		     struct ttm_resource *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index b14895f75b3c..bd870028514b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -43,7 +43,7 @@ nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_resou
 		return ret;
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
-		ret = nouveau_mem_map(mem, &mem->cli->vmm.vmm, &mem->vma[0]);
+		ret = nouveau_mem_map(mem, &drm->client.vmm.vmm, &mem->vma[0]);
 		if (ret) {
 			nouveau_mem_fini(mem);
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 53553819bcac..e244927eb5d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -73,7 +73,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 	if (drm->client.device.info.ram_size == 0)
 		return -ENOMEM;
 
-	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, res);
+	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
 	if (ret)
 		return ret;
 
@@ -105,7 +105,7 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	int ret;
 
-	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, res);
+	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
 	if (ret)
 		return ret;
 
@@ -132,13 +132,13 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 	struct nouveau_mem *mem;
 	int ret;
 
-	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp, res);
+	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
 	if (ret)
 		return ret;
 
 	mem = nouveau_mem(*res);
 	ttm_resource_init(bo, place, *res);
-	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
+	ret = nvif_vmm_get(&drm->client.vmm.vmm, PTES, false, 12, 0,
 			   (long)(*res)->size, &mem->vma[0]);
 	if (ret) {
 		nouveau_mem_del(man, *res);
-- 
2.45.1

