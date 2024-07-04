Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD90992AD61
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C1210E46E;
	Tue,  9 Jul 2024 00:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EkmefSc5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0F910E450
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBmY35i0yM8R9TpEquxgCWolruidkPmoAtgy+JjCeAMhv+RESZEngB1ReCAcwIEb2X6g5OK/lv7eqmGWxsoKLLDApyFXf1LyPlEUj4eQ9a7x8gBHCv1xMX7vA0oKoL/2FKge7DPweT7vmNXp6Ih92GYM6BATvZY0My+a3Hdny+gFPTQwdb7MYQxX2GUlekJERBZB2YdYHHUL8ZZ/ssMZwI3CETaqwwOIU4lpiHEBRFSHJqm2cEnHeGobnHpjRXrEqMptc0LztRKroPLtmtJibtse3eHq7rNJdHx/4s59VCnq6br0eYxq4wYvuCF/WE37RkVCQIb9Qjj8wyep4OrekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqJ/JXvdP/KJg5/xLMUdmcZ9QuIh5wNlwUXfTyORD9I=;
 b=gJEAimlh1TLYdaiTtQiZJb2lH+tdY5q25xStHxiW9mjLXnJ2d3BLNS3M2kb0MxnPy6xhbvUEFex14cB/4LcFyd8HDRtwWU/cADDEA+lthC3J0Wec3uRYQud6vqmY9wWOpW41h2d8UCkDbkkMJPOozQyO2tsozBFw0Hp1aVDmCnTqXQot60SpqN78gjbEjwEk6dxObmx8+0mqnLxl9gZRofYz2j3bNvYeWTgXoS37xzGTnSmLbpouRoGmMeIA1ngj4hLXHpXUv+/K6OTapJoxGRth5LujYyuiDLFkMt4UxEgZ9+6LeUOWKKv7iVJfXhgFCUJWjs9sgBuGcbmVAzaktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqJ/JXvdP/KJg5/xLMUdmcZ9QuIh5wNlwUXfTyORD9I=;
 b=EkmefSc5fXDopcftf9y2BC18rbGA5uJ+2e6GNphsOZgqW/urVRzJW5ez/4iUr0u9AKi9IBV+/0p+rAgSmWLWzugaiU6YqiPxpQuAO5oGY25ImTV0+KFsfK+O/P6OqbTuJ5U/wVdc3GIIUxU/gsF1QMKAKEb1fBLCl/yZRGuQA2a0yIx7jcF192TLrK8aa132Z+1GVYiGqz6zVpYMmqogz8hY+RoueAFCZWHyr/KJ9RQ47ErzbCkACsj0o7udSN03cet2KEXqbbJtin0fArASYe9pC4LjlpXcPifNKXDbDtrWBlxirON2dPsWLet9PdgDEa7BjEwCxDNfs5u/hTB+nQ==
Received: from BN0PR04CA0138.namprd04.prod.outlook.com (2603:10b6:408:ed::23)
 by IA1PR12MB6579.namprd12.prod.outlook.com (2603:10b6:208:3a1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:39 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::e1) by BN0PR04CA0138.outlook.office365.com
 (2603:10b6:408:ed::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:25 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 28/37] drm/nouveau: add nvif_mmu to nouveau_drm
Date: Fri, 5 Jul 2024 04:37:12 +1000
Message-ID: <20240704183721.25778-29-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|IA1PR12MB6579:EE_
X-MS-Office365-Filtering-Correlation-Id: 62061172-273c-484b-9176-08dc9fb1da15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mv0tMMV3jU9kkebVMQLdy/4/W2QMXIqV9K9Zk5mSP880OFxRww7LpR6B5H3p?=
 =?us-ascii?Q?8VdCU5ALnyne1YGUTAXivfnQyKoZSyI+CCp3ZocSjZKUdBxd8LqiUbSZvCs3?=
 =?us-ascii?Q?ISI/KTRpZZbqhBui88swwUe+VMracR7NRto09sUx5RnSksJY4Ug5BcROKZQj?=
 =?us-ascii?Q?BfZnvpIWe7T0jwLvV7m+Sm0x9EZz2sD2ezdvxPpTaeq/wIC02P828YjOG2fB?=
 =?us-ascii?Q?b5YFGOI+XOSvGlmDjLJfsbwRzfY/qkaNJqiMc4ShTu1qriDWmQfYbyZy5FTY?=
 =?us-ascii?Q?8HLG77Kt1hwgIEq2awnTW8xk6JUxvbwmI36bsYZzffLEXZO52LIIG8FpugA2?=
 =?us-ascii?Q?VMT/Qq/Efl+rttZDdCr4Dx4CptMdL649Vh5nuMERzcFZ8uExmXfFkeJU7v01?=
 =?us-ascii?Q?SAWmkbtX3lrNLkZeCzckgQFVYb2Ewf0yyyqgD1Orzah29i6dZqSrXkj/ttvf?=
 =?us-ascii?Q?3Y5xSO0cC0KbY6l5zncuxWoEXJIGN5xPkBEfBkZoNfhLGs2mi5s8gXgLgUYl?=
 =?us-ascii?Q?ZxV2AGmnj2+rYj9KyLPo7ZiPayjmHOsWFh08cFGO++RspAqeQFSyJFIqlO6b?=
 =?us-ascii?Q?5Cs+nP643U5Kwb+y0vUhHkg7xgorH1uYbEXrw0tdYpGWsmgDNFYC2wh0Wjbx?=
 =?us-ascii?Q?bx2/yY0tDMEpxe5bP3LGKZo1nGTbQvKLc9uUKuRmd81a1n3fh8mN5VLN0x+t?=
 =?us-ascii?Q?qDlXtMaeF44A3eNhALG8u0kRi8SdNdfi1KR6KMjmy3DmtGodzeBepSFLMv1p?=
 =?us-ascii?Q?s506cGa6m0RLdnfpmri3R9X7HRDe3wtIZFKBPH9WUAzgsfTryobQojWCNKeI?=
 =?us-ascii?Q?ddzDiCsTnODPi1FsLG+Q+JvaIsl+z3YQyAQiHFK0UEYQ0jQlt2yPT12F6ezQ?=
 =?us-ascii?Q?eJKFmurHW/ZIepB1PJxOHROZqzpiaol64mgb/q+Tps/Wj0a+rTzGEBzGBzfE?=
 =?us-ascii?Q?ZFdWTA2XESAfGq9xDUeLH0YBO3uZ2JFuzVE2kNGZ9XvtMLT2E3zGA4m0+t4u?=
 =?us-ascii?Q?JPLt1YD76fz5yeQCgXKVNGJRWqyiAN5Gm24TK3soTKBo71q1sPZodNiEiSM5?=
 =?us-ascii?Q?6i8QmRkSfF/ObjttSOBvnjQ9SrxK48I39f4y5HynBVV3kRk3N6o182BWUl3a?=
 =?us-ascii?Q?j8UITRu33I8psD0/rXV3KDUd8Ursaq4DTYUhrmDcMyKE9ZoFGnhcR502CMeZ?=
 =?us-ascii?Q?N2CGIXK2CwOJLhw1FDgJ8gNEeUgN0hPjg45lXPLy/4UIZPaYXuMH1aUrZXCI?=
 =?us-ascii?Q?LG2sF5aoXg0GUbkvnDjvvHZp1XRQ413Q9tLq+E7jBOl5lpXzg28mGxr6zhfs?=
 =?us-ascii?Q?t2UBdDIegemUKAABLFQq1vOjeBIJAQcmO50klSfwEMAMBoRHhxJ9R4ji0qnQ?=
 =?us-ascii?Q?6MDyMNooZT7BM/ucmA4MFMSbQS+jfyTQs5cl7Azhk4wr33ZeHxTvWGAUdB0C?=
 =?us-ascii?Q?iBptTdkr2K1oeUeTI0bY1mEmqlNzPicH?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:39.4610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62061172-273c-484b-9176-08dc9fb1da15
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6579
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

This allocates a new nvif_mmu in nouveau_drm, and uses it for TTM
backend memory allocations instead of nouveau_drm.master.mmu,
which will be removed in a later commit.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 35 ++++++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5ff116bcbabf..07748cfab233 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -227,13 +227,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{}
 	};
 	static const struct nvif_mclass
-	mmus[] = {
-		{ NVIF_CLASS_MMU_GF100, -1 },
-		{ NVIF_CLASS_MMU_NV50 , -1 },
-		{ NVIF_CLASS_MMU_NV04 , -1 },
-		{}
-	};
-	static const struct nvif_mclass
 	vmms[] = {
 		{ NVIF_CLASS_VMM_GP100, -1 },
 		{ NVIF_CLASS_VMM_GM200, -1 },
@@ -270,13 +263,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 
 	cli->device.object.map.ptr = drm->device.object.map.ptr;
 
-	ret = nvif_mclass(&cli->device.object, mmus);
-	if (ret < 0) {
-		NV_PRINTK(err, cli, "No supported MMU class\n");
-		goto done;
-	}
-
-	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", mmus[ret].oclass,
+	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
 			    &cli->mmu);
 	if (ret) {
 		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
@@ -717,6 +704,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 	if (drm->dev)
 		drm_dev_put(drm->dev);
 
+	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 	nvif_parent_dtor(&drm->parent);
@@ -728,6 +716,13 @@ static struct nouveau_drm *
 nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *parent,
 		       struct nvkm_device *device)
 {
+	static const struct nvif_mclass
+	mmus[] = {
+		{ NVIF_CLASS_MMU_GF100, -1 },
+		{ NVIF_CLASS_MMU_NV50 , -1 },
+		{ NVIF_CLASS_MMU_NV04 , -1 },
+		{}
+	};
 	struct nouveau_drm *drm;
 	int ret;
 
@@ -757,6 +752,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 		goto done;
 	}
 
+	ret = nvif_mclass(&drm->device.object, mmus);
+	if (ret < 0) {
+		NV_ERROR(drm, "No supported MMU class\n");
+		goto done;
+	}
+
+	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
+	if (ret) {
+		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
+		goto done;
+	}
+
 	drm->dev = drm_dev_alloc(drm_driver, parent);
 	if (IS_ERR(drm->dev)) {
 		ret = PTR_ERR(drm->dev);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index a9e0a63c772e..2535a50b99f3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -204,6 +204,7 @@ struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
 	struct nvif_device device;
+	struct nvif_mmu mmu;
 
 	struct nouveau_cli master;
 	struct nouveau_cli client;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 25f31d5169e5..67f93cf753ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -91,7 +91,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_cli *cli = mem->cli;
 	struct nouveau_drm *drm = cli->drm;
-	struct nvif_mmu *mmu = &cli->mmu;
+	struct nvif_mmu *mmu = &drm->mmu;
 	struct nvif_mem_ram_v0 args = {};
 	u8 type;
 	int ret;
@@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 		args.dma = tt->dma_address;
 
 	mutex_lock(&drm->master.lock);
-	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
+	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
 				 reg->size,
 				 &args, sizeof(args), &mem->mem);
 	mutex_unlock(&drm->master.lock);
@@ -128,14 +128,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_cli *cli = mem->cli;
 	struct nouveau_drm *drm = cli->drm;
-	struct nvif_mmu *mmu = &cli->mmu;
+	struct nvif_mmu *mmu = &drm->mmu;
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
 	mutex_lock(&drm->master.lock);
-	switch (cli->mem->oclass) {
+	switch (mmu->mem) {
 	case NVIF_CLASS_MEM_GF100:
-		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
+		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
 					 drm->ttm.type_vram, page, size,
 					 &(struct gf100_mem_v0) {
 						.contig = contig,
@@ -143,7 +143,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 					 &mem->mem);
 		break;
 	case NVIF_CLASS_MEM_NV50:
-		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
+		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
 					 drm->ttm.type_vram, page, size,
 					 &(struct nv50_mem_v0) {
 						.bankswz = mmu->kind[mem->kind] == 2,
-- 
2.45.1

