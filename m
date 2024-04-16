Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEC48A78AC
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E61112F1A;
	Tue, 16 Apr 2024 23:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YKiGU30O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12810112F1A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiXkA4rdcHKjtx+aB/hl/TMgyxYS7ONtfXCwivTkYzgPUGYSbfTihz8XiVbRpMYvFyv9cmbo418vzrwdZ5b8RY2jYZUb0gZKS4w37LtUByyQmiwoAVgbFgVZtUp9tgNbjsUm12NPR1+qpuPAouIAQ5+RJ7YnL47myF+JEoI7pq8kuJiP9IXpfxl6zY4ykCWpQFRpkBxmhk+eLQ1DEP5MWI1wybypLZNoQm3en/MikH5rhcoMUua8wt7J4spf+Zl2RJyuePx4740awNtOzSATI2ZMgtWj7jBaTNVWKU9J3xTwMZkN7sNJhjXhEMz9cSKerFxvc+oxMFfXswM85KDMRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF30/WjLIUm9O7RyvDrFUTReSM3LHiCB12hmVrkri9g=;
 b=lkyIxIk5pwu8A1G9pWIQB+p1eJjcn2crP5YVz9TfxEu+0rXx8jv5UxVYgs7l2Ry47z045iVg3NmYWT3uKLW8/h/fSWlw0M4CyRYTvNDht7pvzaJEQLFq/GOCUjBzjrozhU0fw7ZOUAvRNi4J73wN7dPwCebGeYuxJBbF2D0dUDei7mNKeN+v8lNjii0MsRgbwU0BnKHT7rcUF9huff24Bz494TXCnK81VP/kdFgafu5sYWR4/hGj4zzuDu7HHt/j1kfZTyzx3qUVOkwarosElVtSlYMjkPpNmeXP/Wk7CZyVGvUxG8V1EuFEOubwPtisaGCmqG53E4kKkX88XYjrCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF30/WjLIUm9O7RyvDrFUTReSM3LHiCB12hmVrkri9g=;
 b=YKiGU30OqAZooEbalnT2QTV3EGB+JqYg5Yo5JbeHCvZRokvMWElRwEkHK3RknSrOX2QFHlsweJdxYYgbdnXRdTdI0zUda0jSiI8bUKrqmUQSYpt4UhI5RD4ZXi4gtbA+V8UV2u7m/7JdR6DOHjwUtoxoKVxrrCRdRXNQ/B7FtgiBPiNjUAEg6ckNG1CIlqldSmWXLTNREap0MreZj3l+vTNUH3pI2Knz/enPRGe3S5WFk6TdNrc+WJ3EM0/DrrjHqOX+TRVursafT7jaITufrSPgnUWKTdPUe4opKG1Wdsg1ciTZlT82xC4+f7LQOK74SsNmczksYNLTnJs6tCjkZA==
Received: from DS7PR03CA0093.namprd03.prod.outlook.com (2603:10b6:5:3b7::8) by
 LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:59 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::1a) by DS7PR03CA0093.outlook.office365.com
 (2603:10b6:5:3b7::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:41 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:40 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 009/156] drm/nouveau: remove nouveau_drm.master
Date: Wed, 17 Apr 2024 09:37:35 +1000
Message-ID: <20240416234002.19509-10-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fbc83c-af42-43e6-2d2b-08dc5e6eab1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4cMpF6fnWXE1lUBRVyMP7tp+Lqnb2hH5kY1RAky9QFwzK81eIYjz3YPVX2Qhd46En2Lrv9PbxvmeS0ucRTAVMbrT728BnDC4/ooVrMofpbrYDbOC0pp+DLX6JWBlisoazGtR1PrPl93IBUpcJuZQpXzMKsjznQ7ocf95mY4sE7IMnzGpCElCo/aIT2xRMS2Jt7dFa6imKiVDuh6AqgB9H2coUPAaEQB86qmULCkqAIqhRLqi4XhvRBmjuzz5LIUC3S6q9z68GiteDMlq9cadGhY/0UL1LwpFBofnvZbDG09PvHLtoAWirD62XXA9qQir+2ZnYUpwG1OAoPuby79VCTTyAhi8v3vz6wBf7E06Uh9zeeEVeIVaTwdfSeKEy/sSkx0A3ZMYAOtX8E/Y0veo4/pjobpmHI37hwNaZJwQ+6pJWYoAw0VSeXNS0458gHJBsW4AOsjpU6eu2xam1vW2591EhlVyli8NX0n9T/bspntYxL4d52MuAbkjZaBF2dKxRZennWkstHVRk7gxCqqho6SDru4xLKAoPvnJVngmU2ZdUr04a/cPTk4+os7ucaIVRNX6Du5JPOmt1UtFM+AxNLVMFCM0DT1kq14REu3ZW22/mJ296jES0B2AMqq8ZIoHPs3dw0Ir0WJF3jS2h6Hk/26AMZcbjew32YEdzk2GfqDo9FFVI8IaBwNYl9e9fCWEdeDp8+xaMGXVfGYi17llOQuNQQwWam/fuvPc1tQRMl7r02w31sjeka9kw5zq0TkT
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:58.8460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fbc83c-af42-43e6-2d2b-08dc5e6eab1b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118
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

- preparation for upcoming api changes

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 91 +++++++++++++--------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c | 20 +++---
 3 files changed, 56 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index da5bb7c51dab..ad5de7ed48ce 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -209,9 +209,9 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
 	nvif_device_dtor(&cli->device);
-	mutex_lock(&cli->drm->master.lock);
+	mutex_lock(&cli->drm->client_mutex);
 	nvif_client_dtor(&cli->base);
-	mutex_unlock(&cli->drm->master.lock);
+	mutex_unlock(&cli->drm->client_mutex);
 }
 
 static int
@@ -226,13 +226,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
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
@@ -253,15 +246,10 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	INIT_LIST_HEAD(&cli->worker);
 	mutex_init(&cli->lock);
 
-	if (cli == &drm->master) {
-		ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
-				       cli->name, device, &cli->base);
-	} else {
-		mutex_lock(&drm->master.lock);
-		ret = nvif_client_ctor(&drm->master.base, cli->name, device,
-				       &cli->base);
-		mutex_unlock(&drm->master.lock);
-	}
+	mutex_lock(&drm->client_mutex);
+	ret = nvif_client_ctor(&drm->_client, cli->name, device,
+			       &cli->base);
+	mutex_unlock(&drm->client_mutex);
 	if (ret) {
 		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
 		goto done;
@@ -278,13 +266,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
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
@@ -581,6 +563,13 @@ nouveau_parent = {
 static int
 nouveau_drm_device_init(struct drm_device *dev)
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
 
@@ -590,20 +579,16 @@ nouveau_drm_device_init(struct drm_device *dev)
 	drm->dev = dev;
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
-	drm->master.base.object.parent = &drm->parent;
 
-	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
-					WQ_MAX_ACTIVE);
-	if (!drm->sched_wq) {
-		ret = -ENOMEM;
-		goto fail_alloc;
-	}
+	mutex_init(&drm->client_mutex);
+	drm->_client.object.parent = &drm->parent;
 
-	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
+	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm", nouveau_name(dev),
+			       &drm->_client);
 	if (ret)
-		goto fail_wq;
+		goto fail_alloc;
 
-	ret = nvif_device_ctor(&drm->master.base.object, "drmDevice", 0, NV_DEVICE,
+	ret = nvif_device_ctor(&drm->_client.object, "drmDevice", 0, NV_DEVICE,
 			       &(struct nv_device_v0) {
 					.device = ~0,
 					.priv = true,
@@ -611,19 +596,31 @@ nouveau_drm_device_init(struct drm_device *dev)
 			       &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
-		goto fail_master;
+		goto fail_nvif;
+	}
+
+	ret = nvif_mclass(&drm->device.object, mmus);
+	if (ret < 0) {
+		NV_ERROR(drm, "No supported MMU class\n");
+		goto fail_nvif;
 	}
 
-	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", drm->master.mmu.object.oclass,
-			    &drm->mmu);
+	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
 	if (ret) {
 		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
 		goto fail_nvif;
 	}
 
+	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
+					WQ_MAX_ACTIVE);
+	if (!drm->sched_wq) {
+		ret = -ENOMEM;
+		goto fail_nvif;
+	}
+
 	ret = nouveau_cli_init(drm, "DRM", &drm->cli);
 	if (ret)
-		goto fail_nvif;
+		goto fail_wq;
 
 	nvxx_client(&drm->client.base)->debug =
 		nvkm_dbgopt(nouveau_debug, "DRM");
@@ -687,14 +684,14 @@ nouveau_drm_device_init(struct drm_device *dev)
 fail_ttm:
 	nouveau_vga_fini(drm);
 	nouveau_cli_fini(&drm->cli);
+fail_wq:
+	destroy_workqueue(drm->sched_wq);
 fail_nvif:
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-fail_master:
-	nouveau_cli_fini(&drm->master);
-fail_wq:
-	destroy_workqueue(drm->sched_wq);
+	nvif_client_dtor(&drm->_client);
 fail_alloc:
+	mutex_destroy(&drm->client_mutex);
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
 	return ret;
@@ -746,10 +743,10 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	mutex_unlock(&drm->clients_lock);
 
 	nouveau_cli_fini(&drm->cli);
+	destroy_workqueue(drm->sched_wq);
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-	nouveau_cli_fini(&drm->master);
-	destroy_workqueue(drm->sched_wq);
+	mutex_destroy(&drm->client_mutex);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
@@ -962,7 +959,7 @@ nouveau_do_suspend(struct drm_device *dev, bool runtime)
 	}
 
 	NV_DEBUG(drm, "suspending object tree...\n");
-	ret = nvif_client_suspend(&drm->master.base);
+	ret = nvif_client_suspend(&drm->_client);
 	if (ret)
 		goto fail_client;
 
@@ -987,7 +984,7 @@ nouveau_do_resume(struct drm_device *dev, bool runtime)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	NV_DEBUG(drm, "resuming object tree...\n");
-	ret = nvif_client_resume(&drm->master.base);
+	ret = nvif_client_resume(&drm->_client);
 	if (ret) {
 		NV_ERROR(drm, "Client resume failed with error: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 8f04f3630936..683600db4ff9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -202,10 +202,11 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 
 struct nouveau_drm {
 	struct nvif_parent parent;
+	struct mutex client_mutex;
+	struct nvif_client _client;
 	struct nvif_device device;
 	struct nvif_mmu mmu;
 
-	struct nouveau_cli master;
 	union {
 		struct nouveau_cli client;
 		struct nouveau_cli cli;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 4d9ac9f30f05..baea74899fcf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -80,9 +80,9 @@ nouveau_mem_fini(struct nouveau_mem *mem)
 {
 	nvif_vmm_put(&mem->drm->cli.vmm.vmm, &mem->vma[1]);
 	nvif_vmm_put(&mem->drm->cli.vmm.vmm, &mem->vma[0]);
-	mutex_lock(&mem->drm->master.lock);
+	mutex_lock(&mem->drm->client_mutex);
 	nvif_mem_dtor(&mem->mem);
-	mutex_unlock(&mem->drm->master.lock);
+	mutex_unlock(&mem->drm->client_mutex);
 }
 
 int
@@ -90,8 +90,8 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_drm *drm = mem->drm;
-	struct nouveau_cli *cli = &drm->master;
-	struct nvif_mmu *mmu = &cli->mmu;
+	struct nouveau_cli *cli = &drm->cli;
+	struct nvif_mmu *mmu = &drm->mmu;
 	struct nvif_mem_ram_v0 args = {};
 	u8 type;
 	int ret;
@@ -114,11 +114,11 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 	else
 		args.dma = tt->dma_address;
 
-	mutex_lock(&drm->master.lock);
+	mutex_lock(&drm->client_mutex);
 	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
 				 reg->size,
 				 &args, sizeof(args), &mem->mem);
-	mutex_unlock(&drm->master.lock);
+	mutex_unlock(&drm->client_mutex);
 	return ret;
 }
 
@@ -127,12 +127,12 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_drm *drm = mem->drm;
-	struct nouveau_cli *cli = &drm->master;
-	struct nvif_mmu *mmu = &cli->mmu;
+	struct nouveau_cli *cli = &drm->cli;
+	struct nvif_mmu *mmu = &drm->mmu;
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
-	mutex_lock(&drm->master.lock);
+	mutex_lock(&drm->client_mutex);
 	switch (cli->mem->oclass) {
 	case NVIF_CLASS_MEM_GF100:
 		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
@@ -156,7 +156,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 		WARN_ON(1);
 		break;
 	}
-	mutex_unlock(&drm->master.lock);
+	mutex_unlock(&drm->client_mutex);
 
 	reg->start = mem->mem.addr >> PAGE_SHIFT;
 	return ret;
-- 
2.41.0

