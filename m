Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10F8D1204
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC76510FE2A;
	Tue, 28 May 2024 02:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="czwgaVsD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F7810FBF3
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4Y2U/L4ErKXKE6mVPimM3hWZlq/3lU+tm0Bx49x2L8c9rXWRVGjCl17qqk3H4S93iJr2loz6qbo0d3r2k5fcAegyugSjvoas4HP/rjxZeJ1dzOSYaS5RpHihcz3LDN/jpHgLNb7IYpjSBDiXS979whQuesKYh1k2tQDDNMKcd+QOtKNhpEEcAgFFWSo4zTnrLQ37TF+TyQZgGlBcF0jja5Iize/9Ejl5ztvTh9AFgFltiAR119psoCyZpbt/n6egcFAp/P0RtZLyqIYlJMt2c+JPAICG/NsG6GBIrUXzDC6N5GbXgfegMOJxH6F5rCaJ8tlefdqUe8LGV6rFGsd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNDT+raD08oTPUDZkSwlGuEzzvWRk7esYu9bArNn5mI=;
 b=GZp6mEgUPdceTsaZokHq3CZ4Y6OutomM/MUKFzhj4tJxLWMatm0xFJyATY9bclrScNYJZHTe8aOo/qFzUhmf+9NajlzWjTxFHV+0v/YW3DCE05L7nINOjU8PAmC/TrCbeksFWCWVqivFwy0MV1dJORXwZvXTUb81wxK/tALGa6mJHxxdyY4rN0JdjLchOD+N3Wa4Bfh9Z9BUkNS27JM5e19oenh9b/STXbwTx7Tqfn/PbeKdhyEE7o2egotJAxpRdZyeWeq9YwGlcpN/jtBW+EirATiQjWOoNYEKNzzhL7gOmVs/Gi7DyanRYTsCNJwmFZcoo0xTen6vaaFb0BGGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNDT+raD08oTPUDZkSwlGuEzzvWRk7esYu9bArNn5mI=;
 b=czwgaVsDofL0erbwU3ypHghrzljdVPCC5PsqgSK/2hK4jIOZLlb2dtnJ74jWWPKMT/IWmLeZqUn79PJi+l13YicgAnvsKMJuvaDMeV6OPfmBBcclJ/qdocp7WuanbScarVa6NcdarGczPkjsAzJDPlVR7s13HcTlAFA0trGj0p7bddd+4kgc3af0ZMv9tTF7PwtwV81wAYx76uwUxd788tFasRYSvKoImKVeN6uJF1YC/HIc63BfgM2yQZGMhrFFOJD8bnGI4fzdlq8bwOgWHV+Dc2IC5ZTp3wOMm8RE7Ah3kn6p0RLJhEXmuPJpmV+yx1fHeREVnbRYFi2mMbrVKA==
Received: from PH1PEPF00013303.namprd07.prod.outlook.com (2603:10b6:518:1::12)
 by DS7PR12MB6286.namprd12.prod.outlook.com (2603:10b6:8:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:41 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2a01:111:f403:f90d::) by PH1PEPF00013303.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30 via Frontend
 Transport; Tue, 28 May 2024 02:23:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:27 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 26/34] drm/nouveau: pass drm to nouveau_mem_new(),
 instead of cli
Date: Tue, 28 May 2024 00:19:51 +1000
Message-ID: <20240527141959.59193-27-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|DS7PR12MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 16906ce4-5d2c-487c-ad11-08dc7ebd30de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hmZqlOv0TwjdsJREO4j3EwZtRGgodEo7aaW+HXJnNkIyKwKdIc9r9RWt6JC5?=
 =?us-ascii?Q?G/QX0buUiohRwj3u7UGTjdDL8oD1MVHlKfAGni72Rxlx1lwXHWd1VQl/x9qM?=
 =?us-ascii?Q?N+LSR4Zdte/BCnsV0hRTnHry8g6ORnagSKxLa1Upwtt8yklCuNse8IFwSbuC?=
 =?us-ascii?Q?27wMOZAoOKZyhIYG1SS6NScl+OpLlgjcrDTMmd9qjo+Vv0bjMKMDyqFgCq8g?=
 =?us-ascii?Q?BeDCxw4XIofBCEV/iLjrx8v/9WanDdZS9PIYQy7Z+OdtaEY2Ba0z0Ets5Ygs?=
 =?us-ascii?Q?b0dM8QKblEanllf/C3XqeiDDuMc3Lqphj7z+22qGMu/Efvj8QNyK+JMM7Y3T?=
 =?us-ascii?Q?DpDzzno8R8ydHSlDZ8s+H6KCV6JV03+4WsW6wkEN66VLi1CK+Eb2clJJq1tC?=
 =?us-ascii?Q?oXdtDc8Ku31rrMw3OYwSWZ51O9qMt6XGmCV+3GALwAOWrI0em50Ha+33I3dB?=
 =?us-ascii?Q?JZy+4Sg6U06Qo9/8Tz4xdTrGR2KrfbGuU+PFvDXYhXBJVD17IXLF5rVuymtk?=
 =?us-ascii?Q?zJcuU/9lBhJW1Y4ijsCsNZe9fVK9HwyKVKKqYydstoZTNPOSRTPX03ArpK83?=
 =?us-ascii?Q?aYZxjX3Vff4osgMcv/FJJkzLwyH9Z6Jb14FHxibXrPH4d4zSou8n2E66Keab?=
 =?us-ascii?Q?f5FZVEpumBQg+R9eJvH4ldGf3LCH885N1jQHLBobqWAq3vD8xEAOxCnHuvsv?=
 =?us-ascii?Q?vJyjLBl2kUP0YCeTGatoq92R+pr//ixZine4EonNj4N5ciVWD7ghzQQZRTaK?=
 =?us-ascii?Q?CerNfzX3c6qErWFkJGxTaPpzJzHXING7BbCeH7m149ZzwJuE9Wq/eWPb330N?=
 =?us-ascii?Q?Px3QJnj8GlD/M1gvcv7M2xIo9SguGTwho/Up8D7ML8Ti03JW/mjQsTFxTcWp?=
 =?us-ascii?Q?fCNagXsWzJeWBJUcbtu3nEpnCZ1cqq/o6RYSK39y5Owng21INqz77YzrhA/E?=
 =?us-ascii?Q?tENzb/y1DaJGYALyQKepyw5Rb0P1pLD09aKP5ogjhSybe4vXHPUQuIcmkO6d?=
 =?us-ascii?Q?GtoOYGyJyQsgUpNKSvjEA7+MmbIiBEFRPvEL96qcuHXApOc9uq93rjyHX4wA?=
 =?us-ascii?Q?xpB+VsfGNexoFVRReFSN9U+UHWbevI/mAjKtUe+rG4Go7L/B9qpHc02D32L7?=
 =?us-ascii?Q?XdRZx7tM0NTTYOxvmUmg6saETcYC++UoU3MKJTCyirSRcvOf3HI458YRfs6L?=
 =?us-ascii?Q?7sQCDoWpQsGOAsVvid1XkCFBu6sO+Z/mMCXTGk9stEwD1VXMfSGvSN4tQumR?=
 =?us-ascii?Q?oBrFCmhInviIG3YiIiImTStvAj1KlgV1HaymAdk/+RdnEMvghhh+Sm85RCGz?=
 =?us-ascii?Q?pyg+Ts57mGhJqX4FyhQfahPSr13EK0gAaGDgOorQS8ndCW+PlkOJPUtp+z1l?=
 =?us-ascii?Q?0N3P66+/B/yJ3/QnZy6GvID87g68?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:41.2179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16906ce4-5d2c-487c-ad11-08dc7ebd30de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6286
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
2.44.0

