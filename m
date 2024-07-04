Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DF292AD68
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D288010E476;
	Tue,  9 Jul 2024 00:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S03Isdv7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741AF10E474
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tgeq1somV94fkTvneYVD9JWUAlCkVoQMM2yLIBLBqs2QLQv3fX8xDvZTAv3eT/kOznY2HHx7xlZSlegUJcmR3bvPfiyfCxxCaAvF/2G3BIC2D8LwCmk7Gq3NVcVKbBV9EFsV0uUJQNd2f4AcWmvbveC4dLH7frplu8OXdAanILUoSLpbmj6Y6ksEayQv6oWEJgfux/ZCXBJi7YgHP3XGesA9YiA1UCOBxgBNvC/nZnJI571w5gV6Ht917nOIY9U1aw//iAgfu/odYQiSFQB8FN1lsfIYzk8RhOMlXwnYEi8nfTRqChh9UI523USk4YobeyOWSH1GErQRSHnmOELbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKBsio01j55tS6pWGTF9XDxso9B2Hyoo6y7oUIJc6yk=;
 b=hzz8UQQbm3GM6Xd8E54ADaCei7gbn/VY9OJ/cdM/2Wxc3nGnpYp01gvnynDiCs1kgN2VH1H8ztKzCryv9mYHRjBPGoi0YnR3+CTOreCqDd1ihboP9UNMY7PtlTSarsJqPR0k/w8hBHb38lpQmfcoBvVijObG0DdF9QIa2/pXS5g/8qVbzfjfYe7mjYqZhECBEKGUqcgLn8vICBDhiU8cKKWcIzpPev4ZYAOOQXdPyWtAGaCplLQY+YwsystLxwN3EDP/7MUd5ttYUdhVU3WKeQcL7P6jSiodJdyMF6T4PE6N7LTJ6/I8i9x/c88uA1A4xAiW8U98bbiPe/3nSLrJPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKBsio01j55tS6pWGTF9XDxso9B2Hyoo6y7oUIJc6yk=;
 b=S03Isdv7iqF+uMSItCovmrbd8RiMfiL8BtUIZjl8kooAlIenpen1HIBXuzh8jruEY59JSPMG1cwntW0b3K7EFnCrnzsYbv9dc1kkrIZA2rQvj+WVeH02kOL8qQT7jncFsHwlo1LuHu4mnRU7LMGJ86fZh7khXyyWSg8R8/jaweVBTFDQAxT6aVQYXLKgDAIEtzyKwd6IJXKUW0Dz2a2C8pyWCGGvjvaDkOuZFIvEyDKHt5KywX1lnUE9zY3ghf3K4Bklfte9tE92hBgG165d/LnXcYoe5Kc7rGEaJXeBts7p8qHogF8D5r4RcDeJUlguwbvBllIsaXEiUMtBmLOATA==
Received: from CY5P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::9) by
 SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:47 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:b:cafe::66) by CY5P221CA0018.outlook.office365.com
 (2603:10b6:930:b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:33 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 34/37] drm/nouveau: remove master
Date: Fri, 5 Jul 2024 04:37:18 +1000
Message-ID: <20240704183721.25778-35-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: b9f387c4-563e-49b5-3614-08dc9fb1de4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WiKytJ/T0932K/Y5UEIBh0SArpsLNymY1f5Q2LAUntEjMnjLNExudWWH1e3X?=
 =?us-ascii?Q?TxDcKOCWhLnghIUuwtfEGD/N5hPHzZBPEXoKFBLecywKpRfWTouS82NA1Uk/?=
 =?us-ascii?Q?945qLkKBg4IhywxQLPd50BzMCv89tgdvTjxjlwN6MAm1kDOzufrTs67O/paO?=
 =?us-ascii?Q?Xuno++vZkf36ThYxYix+ppXxofMWKjhVH92BM+GltCwledSDGqvtH2B85Btl?=
 =?us-ascii?Q?dEKTKxgtA4Sr+hGPk8HJ9MWjuMwRXp5DAaSJuUxSbXdiWu+0brVT1LDX67r6?=
 =?us-ascii?Q?L6tZyDwYkO2Ek7x72W/SbyYDpLuhXrCosa8LK9TI2rpOzltznr2V8ugCwWv3?=
 =?us-ascii?Q?HFHn2Ftc6xl21Zqk84kW8OYis3Apd5Pwha6T6gi4bPNtmfZyEccGqw/sOHaZ?=
 =?us-ascii?Q?f6T9U1YhccnFXStVTV+FOxodxgs4rTI0ipX/fBkRYX3JwE72Ay1qYnM+lA35?=
 =?us-ascii?Q?6EdeAb9yFwOtQNdE+tOXIB3ySu37svdjkABRb8EUHDzgsdRGJQBBEXEuwJbt?=
 =?us-ascii?Q?DAGfwaUvtRLjsbtHFfCuL0RDTq1L+AfFBGU2IY8CQsO0JR9v9GGbGCY9EeP6?=
 =?us-ascii?Q?/+OQ9TEh776x+1vqphCRtByJpR214PcIoAA1OGBBuSpDb//knHQTzyBht9DW?=
 =?us-ascii?Q?qDUuPVYEsyUqL9gDsz38yX7s+eQTQpzLzyuoFrKZhvnKLVd3X59GSNdMkRWx?=
 =?us-ascii?Q?jrXXQw8joD6Km+bfa3gLPrDo/XnageEJoR+56dlSTmbfY2ngwLQO6yQSYtZr?=
 =?us-ascii?Q?8i98kd1ElRVKUKA+Js1ENkr+Jfpcse2unFSKJI2yHgWz3cqeOutWP6kSZ3un?=
 =?us-ascii?Q?HSJoS1xREzlzJjOKAIuGfQjmqlyvQZfWcuiP/xKu2TkQhszcpNJCXluj9RcR?=
 =?us-ascii?Q?lKDDGScYQyTplk07iRlhph1dLaUYJDdzXSlWvtaStRQRBDl9clqVRL3vgDsg?=
 =?us-ascii?Q?gAkKARj/0CEy4oZN1P4KF6CVLswksJIMq0xYv1HvuBieqfg2mtBZi5MjO9lQ?=
 =?us-ascii?Q?Qc0rgRxDrExdG1IxJvg60mLH1eKfMuhm5TpH7a47vTq0Y4zgVYlJlz6cmAwr?=
 =?us-ascii?Q?nILoce+WrBIqyey7NDh/iUAPy5nb4MvCBr/Siaf/BFdR3QOGWBLIYn9zIE4E?=
 =?us-ascii?Q?FawcGIUd7c7maypYwLTdJUw9pgZ6epD7En1uihfxU572uR0TM8JJb9R92Vxh?=
 =?us-ascii?Q?HrR1tfHG5tAzqUd07SzWhf8GssO6KN5dF2CxfJB5hAj5cN2z/UXLmh8691Fi?=
 =?us-ascii?Q?EVCwjqjujRJDaL+ytRGZ4KgSiCfLVrdmGePztP8B3FjCUx3j9SRHsfHJ2GtZ?=
 =?us-ascii?Q?t/otL1jod4E9DTaXMqgmr3L4hkJ919HdNQBHPhbr7gAgaf9gJh14t92i4Cfh?=
 =?us-ascii?Q?Ik8h/V6Urrwuith/TENAtfydDuPm+qoePpwSZy+ijWQ9vGfUGPt6Apbk/2Gs?=
 =?us-ascii?Q?pyEh+5Ql4VtwEwdF0RqkHuXFpe33mwI5?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:46.6434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f387c4-563e-49b5-3614-08dc9fb1de4f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117
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

The only remaining nouveau_drm.master struct member that's being used is
the mutex that protects its object tree.  Move that into nouveau_drm and
remove nouveau_drm.master entirely.

Another patch series will make it possible to also remove the mutex, but
it's still required for the moment.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++----------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
 3 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c6c9a528783a..85214d35fd5d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -208,11 +208,9 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nvif_mmu_dtor(&cli->mmu);
 	cli->device.object.map.ptr = NULL;
 	nvif_device_dtor(&cli->device);
-	if (cli != &cli->drm->master) {
-		mutex_lock(&cli->drm->master.lock);
-		nvif_client_dtor(&cli->base);
-		mutex_unlock(&cli->drm->master.lock);
-	}
+	mutex_lock(&cli->drm->client_mutex);
+	nvif_client_dtor(&cli->base);
+	mutex_unlock(&cli->drm->client_mutex);
 }
 
 static int
@@ -245,11 +243,9 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	INIT_LIST_HEAD(&cli->worker);
 	mutex_init(&cli->lock);
 
-	if (cli != &drm->master) {
-		mutex_lock(&drm->master.lock);
-		ret = nvif_client_ctor(&drm->master.base, cli->name, &cli->base);
-		mutex_unlock(&drm->master.lock);
-	}
+	mutex_lock(&drm->client_mutex);
+	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
+	mutex_unlock(&drm->client_mutex);
 	if (ret) {
 		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
 		goto done;
@@ -602,7 +598,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
 	mutex_unlock(&drm->clients_lock);
 
 	nouveau_cli_fini(&drm->client);
-	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
 	mutex_destroy(&drm->clients_lock);
 }
@@ -618,13 +613,9 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 	if (!drm->sched_wq)
 		return -ENOMEM;
 
-	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
-	if (ret)
-		goto fail_wq;
-
 	ret = nouveau_cli_init(drm, "DRM", &drm->client);
 	if (ret)
-		goto fail_master;
+		goto fail_wq;
 
 	INIT_LIST_HEAD(&drm->clients);
 	mutex_init(&drm->clients_lock);
@@ -691,8 +682,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 fail_ttm:
 	nouveau_vga_fini(drm);
 	nouveau_cli_fini(&drm->client);
-fail_master:
-	nouveau_cli_fini(&drm->master);
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
 	return ret;
@@ -706,9 +695,10 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-	nvif_client_dtor(&drm->master.base);
+	nvif_client_dtor(&drm->_client);
 	nvif_parent_dtor(&drm->parent);
 
+	mutex_destroy(&drm->client_mutex);
 	kfree(drm);
 }
 
@@ -733,14 +723,15 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	drm->nvkm = device;
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
-	drm->master.base.object.parent = &drm->parent;
+	mutex_init(&drm->client_mutex);
+	drm->_client.object.parent = &drm->parent;
 
 	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
-			       nouveau_name(parent), &drm->master.base);
+			       nouveau_name(parent), &drm->_client);
 	if (ret)
 		goto done;
 
-	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
+	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
 		goto done;
@@ -966,7 +957,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
 	}
 
 	NV_DEBUG(drm, "suspending object tree...\n");
-	ret = nvif_client_suspend(&drm->master.base);
+	ret = nvif_client_suspend(&drm->_client);
 	if (ret)
 		goto fail_client;
 
@@ -991,7 +982,7 @@ nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
 	int ret = 0;
 
 	NV_DEBUG(drm, "resuming object tree...\n");
-	ret = nvif_client_resume(&drm->master.base);
+	ret = nvif_client_resume(&drm->_client);
 	if (ret) {
 		NV_ERROR(drm, "Client resume failed with error: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 2535a50b99f3..630463668a76 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -203,10 +203,11 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
+	struct mutex client_mutex;
+	struct nvif_client _client;
 	struct nvif_device device;
 	struct nvif_mmu mmu;
 
-	struct nouveau_cli master;
 	struct nouveau_cli client;
 	struct drm_device *dev;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index b112b62dca3c..fac92fdbf9cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -80,9 +80,9 @@ nouveau_mem_fini(struct nouveau_mem *mem)
 {
 	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[1]);
 	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[0]);
-	mutex_lock(&mem->drm->master.lock);
+	mutex_lock(&mem->drm->client_mutex);
 	nvif_mem_dtor(&mem->mem);
-	mutex_unlock(&mem->drm->master.lock);
+	mutex_unlock(&mem->drm->client_mutex);
 }
 
 int
@@ -113,11 +113,11 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 	else
 		args.dma = tt->dma_address;
 
-	mutex_lock(&drm->master.lock);
+	mutex_lock(&drm->client_mutex);
 	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
 				 reg->size,
 				 &args, sizeof(args), &mem->mem);
-	mutex_unlock(&drm->master.lock);
+	mutex_unlock(&drm->client_mutex);
 	return ret;
 }
 
@@ -130,7 +130,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
-	mutex_lock(&drm->master.lock);
+	mutex_lock(&drm->client_mutex);
 	switch (mmu->mem) {
 	case NVIF_CLASS_MEM_GF100:
 		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
@@ -154,7 +154,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 		WARN_ON(1);
 		break;
 	}
-	mutex_unlock(&drm->master.lock);
+	mutex_unlock(&drm->client_mutex);
 
 	reg->start = mem->mem.addr >> PAGE_SHIFT;
 	return ret;
-- 
2.45.1

