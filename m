Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB793CD57
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B81B10E91C;
	Fri, 26 Jul 2024 04:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GubKUDkH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7D110E91D
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tps2xZnwwQ/fMQnqQpvVuA7EYo6RtUW+XHpQgbW9aG2pUKcaUOkxOReqktfcBzIgQb1IC2DzTzTSLxdik6622AXnpo1vVAg8fVQ8fsVHj3OsX6T98J2YjaZzOSWXBD4s8kS9u0EDazeZlbvKJMNpK8SBX/WlaA1CNPbW4ApGNosJZzYrvOT9I99b4UYMQy/lk7522RLFLYKtNGpTtFBdsuLIH0oPZ22K1nnb2CIvhuYebGcLIFT0Gbgh2dH99nIa3Nv61iqLsty2791mlYrdD9QfJenb+SyAFuUPUWlsZ+ltg9nt+/ErPKqolIgtXXoSN7Khj5iuybQ2/ERfHp5zSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9+tAPlc7naIwQykVEx9m3cLwrr2EYU0xspQypxuC1k=;
 b=DJsJ4i6zpGXOyVwg+zEU/UMoLXXtILvE9SSn8qtCOO5yvZ2p+Btp7FQ7h/y0YKfqJTSWGLAySGVls4dwYLlMeM53E7In9bB2yuBt5b60KfscUjmUUOi1mzXR+c4EO0w3XJJDOx3o6Zsjef4IBjL/kZDlwAgWiuOOtS3iyEavbhG7i8Mn43ptMPJ3YMjPGSG17+S2vrnHOEN/4HQ4CpoH/dE/mZKPpqnUAAKP7yKAZCdpKm6auwzIJx8OqO/JZwqzVHw7EfaEZba6GR1QkHfePsPKZxErUyh622GSFhVFvquDmX24sEpfkGxaXB/PpfxKSNfaYy26EMvYqq58ee+wCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9+tAPlc7naIwQykVEx9m3cLwrr2EYU0xspQypxuC1k=;
 b=GubKUDkH9rWlEo4UYtyVUsEaYaN8LqHb/joEeEUSpSD1kpM3KF9a8MJL/jpbBynC+Htbhl95ki9Hey49/ZLmDKPKFgc4msOfG4DRQdEHTI7yb3qS2vz2jxlL+XqpDM+0DdptUW9K+GIxoKZPbvXJpBEJ6C9k+Vphye9ffTGsvXT0LwD1zXZzST3AbQd3XVel45e2TueSRjpax29+ttj+bW5TR1XIyg92+VxBR0Xjr98kD7rVhFGOl5ruD6ZNj2qVBm+d5YnH/GXVsZIJWD22fbEHqR0tQTk5P8x4zCvz4zgGGjR33WovWEgntKSjydouBC5F2BEWB2HdrAQvyXw+qA==
Received: from DS7PR03CA0263.namprd03.prod.outlook.com (2603:10b6:5:3b3::28)
 by DM4PR12MB7501.namprd12.prod.outlook.com (2603:10b6:8:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:41 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::1c) by DS7PR03CA0263.outlook.office365.com
 (2603:10b6:5:3b3::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:31 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 34/37] drm/nouveau: remove master
Date: Fri, 26 Jul 2024 14:38:25 +1000
Message-ID: <20240726043828.58966-35-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM4PR12MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: f96ceaee-c995-4398-d0be-08dcad2cf735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UX7HhYvQ/pobjhCZdSgt47uJq+wi1WwzhddKw0RVcg0yNKRjmiT6xq+dOErh?=
 =?us-ascii?Q?akPhu7Fs5kmh/K/GrJs6i74SW+o3xPVv7kWSDaXQHUANs93glpty8FBzIMyf?=
 =?us-ascii?Q?BDhkcntrnk1vEV34c/P8TNK6CwMPWV5fH2RhwPyY9RdrdbtpCy39cBkzcOT7?=
 =?us-ascii?Q?dRw0rJHseV/xbdAmUBDkLlIgvCwQxUgikBKMwBON1Q73DvsVa/BzGSFCj0eY?=
 =?us-ascii?Q?enarK5EiX7xydePhUfpxGGHRCbjEes9y+f77fFFKCE91gFV8RXNMNClJDe/B?=
 =?us-ascii?Q?L3XsVXPLVd4h2ddNrfQWh0BGYfk26dZuv8FHCW/+gbbZz+MWyAbJqcobFWEl?=
 =?us-ascii?Q?gdsju9z3D26K/vOBpQEGUaLfxX/yne5HYiXMOUPi0wFx47Bb8nsbizCvAq9g?=
 =?us-ascii?Q?rfMn2N3j+qScGvx+Owgwwwn2P5Eyir6AdLcbE3By3bMl2jpPR3UM0GmEzR72?=
 =?us-ascii?Q?9ine6p5e/83fSeivboa9hqqZIHLP91Zb4gHH+eBmBHYt6rcRbmgwT0vWqa6J?=
 =?us-ascii?Q?CJRNBSge4PC54U7EGdT8EH0Lx5f2XDVvbDxWZwNwm4Ysz//eJw18RarTM/DT?=
 =?us-ascii?Q?uECHq40tbRL4/2zZo/T+9Sqa6cV9fp8VbhkSsPVi0TR5yXdk7iAeKCjx8B3J?=
 =?us-ascii?Q?dgBAFypotmXr7+v3ClT8p0bHZvCveyqtj9X9qa1X0nmO5ze2eX4Ba718X20/?=
 =?us-ascii?Q?8Fim9jvx9PDVGp9FGqctsete7uTWEUtJYP4r4FIbv99HKs/cs1290jO4syxb?=
 =?us-ascii?Q?AZBLuv/gVuIwxUd5SsjpGRc5fbng3u0FulygNvYrcXHJ9jflyR/PFmRR1Dwd?=
 =?us-ascii?Q?Gkej71SDzy+4AgHmfC+Wu9SLY4oXpS5+/kAYLVc3hdUsg7aPoaaF+0Txn6NK?=
 =?us-ascii?Q?T2v+Ax+Cx0UiYVUGkBikaoKpJXCaalEVh4Ie68sjkli5hphPqUeZaZN3D30o?=
 =?us-ascii?Q?JE1kZ556r9YHMScP7OGMd120+xhvPUshyAlmVj44JIOU3e+91IQjxfPgzq6U?=
 =?us-ascii?Q?3Ry827BOVVStk4TJqtH/6eo2RVMFlrK7KArmHt9+ffdlezZSPVZEZIOTwnc4?=
 =?us-ascii?Q?YtcURhKPuZ2VBEQJxLthlXDDfrhJxwW3SXbnuLUuMYPkeGZ9BmTBP/AHFrZn?=
 =?us-ascii?Q?pXJKo6s01YNJWAyqWjfjQBASy2VYvz+knq08mlXaTZcbslN3qIlxwyg0hsjJ?=
 =?us-ascii?Q?DOx3zRgPLFdn/B/yaKyQ6FqGz5qz4R8LtDoeboK6G+giTW2nWwAxy6ekG8SX?=
 =?us-ascii?Q?lVqwi8E0Zesmh23fRt9UTaqFC2aJy7+IKQbg/Lb6OW+hIEzg43GcqDUkhqUO?=
 =?us-ascii?Q?U8X2hUx7AA49Zs4rDkTDuiV/TVV7N98Vc4LoTuml8oVFGIPfSMSPwZlYS/+y?=
 =?us-ascii?Q?mZanEkmGPIJS8qm0rlYAtNZfOUjDHRfdQAE8khXIc9U9L5YeFEl7f6Ngn91l?=
 =?us-ascii?Q?Us6ReOPP5kdYLfO17Vvgta0SDnCtATcG?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:41.6027 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f96ceaee-c995-4398-d0be-08dcad2cf735
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7501
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

A pending series to remove the "ioctl" layer between DRM and NVKM also
removes the need for object handle lookups, and hence this mutex, but
it's still required for the moment.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 39 +++++++++++----------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
 3 files changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8b9c463d21ac..ca63d13efb25 100644
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
 
@@ -742,14 +732,15 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	dev_set_drvdata(parent, drm);
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
-	drm->master.base.object.parent = &drm->parent;
+	mutex_init(&drm->client_mutex);
+	drm->_client.object.parent = &drm->parent;
 
 	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
-			       nouveau_name(drm->dev), &drm->master.base);
+			       nouveau_name(drm->dev), &drm->_client);
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
index c55665faf2c1..f3da66a12dd3 100644
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

