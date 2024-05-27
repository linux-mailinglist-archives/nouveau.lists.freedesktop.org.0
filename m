Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 424178D120A
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385E510FE32;
	Tue, 28 May 2024 02:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rIQpFQb8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2747A10FE29
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgOH2kBdGowRS6JnSK4y4W6iyYYaPIvan0Wl8qQnAWkrMjn3CprJ1uYiUco156F2LvN618k2NOUaQUriypDEA+QaqUMnu/mWGoBm8dxZxelsKeQPrpX8+luM5gPoOMf1sSUmX2pltgaaOWHvRToskrw1KCw29M9Zs2vrPRP78bXCpFb7TQ1XgcWdaDFjSMHm9qDBywiJjvs9XbUV2fm6vXQ6Vty0mnzlDWgDxC+ROmXuNHkJF0R3BeJKX6lTOzUJnKeFVNeppyx6uGiE1c5hEZklDpz0vhbc+HdPj68PsmncXJIF7wdvTdcU6e8pecW7FbKkdURpfMwbm/sJA8z7qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3oxlSjyiKaw0hITa4qapGPtMz97Jw/BGJuKwZ/j8fE=;
 b=YnyCNSdhV475tRsV3i0ifqNHE3OYC4vjXYTsnx/3PDK0EXVh2uRINEP3RrsKZUrQAP6MLka9o+ONe+mZlQ+lSGeeRyP1lwGswkiaSemUfyNrmhUqGfTP3PfU1R/H04MPXH0Qgyp+deJ6EoNmjgA11GQAeD3tDoS2QPcH5FFFvOX613LTc4BOA1NW8cvUrqrkRP2vUQTYWaCFOFqtW7c2J9czi05r8pk1hWosmRDUJvud1Ff6MK0vFA2kMehK1rnZi9tglFs6NHrvH3Utzcgr/p4zeVmZQ3//3XfhZR270qpwy4qUwx1Mak10yOUg03hey21Fa50vJHpxWHmjcUZ58A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3oxlSjyiKaw0hITa4qapGPtMz97Jw/BGJuKwZ/j8fE=;
 b=rIQpFQb8sXOVX2GAl+c6UFSnuWKzWU1Fkw+je7Hs+ru600mnOj5ORPOy8UV1WpPINebbeZCqPQGu9Npw92/PiWULLX6xRyFRNPF+CzaVV5sPV5Lg9+0Qg13OAvdymzlbcpEYcCNCMbn5U1oV7CtgaNs4krafkr5HAUhb2q4anDhnc/6EfxUXhEx4X5PynDUUOyQ2vTev2xKKeEsrLyglvtcpv8bWnHmL1QTwsNUiiZjROatEhJomQQsEY5AOksRG4wAi6ZrCuIjaLqjGH2ZxXxdLW2Jeq+AmujsH2GbIUItHs++g70c3VmRmIU/ZBEC8DLIWtCUEY7CQUuIYTDN4qQ==
Received: from SN7P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::21)
 by PH7PR12MB5854.namprd12.prod.outlook.com (2603:10b6:510:1d5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:47 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::6b) by SN7P222CA0003.outlook.office365.com
 (2603:10b6:806:124::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:34 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 31/34] drm/nouveau: remove master
Date: Tue, 28 May 2024 00:19:56 +1000
Message-ID: <20240527141959.59193-32-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|PH7PR12MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f73bfe-1371-475f-1e77-08dc7ebd34ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|1800799015|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fwjPXo8FtIegoA8sqa16+Rtjf/zP0NONk+Zw76kxHtsgf4CXrvBGkB8R78GR?=
 =?us-ascii?Q?gf6oWOcdA3c8yI1gQ67JyFiEiXu97v+pm276LZhq71CUboOCixdTD22hoNez?=
 =?us-ascii?Q?db9NCgob6rVz3NujASC5q3R6hWy1SH85chihefrM+S4LbPkvqTv6DwYts5yc?=
 =?us-ascii?Q?BPwTSaeqZQc6TaW2H8BmyC19FBe663x0Orujq52EPmWoe3vCnerBy0JlXyzJ?=
 =?us-ascii?Q?pu/FJUVlcwo9tfXZA3riXkqcbnarn86DjepxMpImz3BKZkqpmkJfjH9ELzct?=
 =?us-ascii?Q?+h2EO/kWjiYfl43PhIbnUDlA7G13tbWL1NLHODStOlnQh75Q8JMSyAWH0Ez8?=
 =?us-ascii?Q?IpXwsWfLTtOw+MZym1lNeFDFN1SvJuMIt9En/qYGlGv+b0pyoQ/YxTrIxGxI?=
 =?us-ascii?Q?svZ3PHkNRpERjp/XH1xwuZHZle16kvUyLyUljtqqSIS7o3w6GOYWhRFR0N/O?=
 =?us-ascii?Q?qtAuXerzcXx6zVmXt3cjGlSRKfADTSwDJB95ZDR0YzTcqnnSUK+l93ZrTbBj?=
 =?us-ascii?Q?GP96hpaUunnpPLZdWtSEDYLLjqwyxAthbPwxrpgB3VHC9EWgcDOTZhlOsfkK?=
 =?us-ascii?Q?4wNGeDNoNjX/3W8Ph0FzjdeUN17I9r3E5lmAuPDwIaGMIBwehattuTKX+U+E?=
 =?us-ascii?Q?j0f3Sq/0rkYD/ns0k9l9mCrSHJe2jH//2jlqUPVurBiUS9V2u5WnItIkbLDE?=
 =?us-ascii?Q?HirEBJetuBhkKama/uFUnvUXPnR6hkb7yotKzS/mdMZmLTvRhngnpplsEUAI?=
 =?us-ascii?Q?VU2o7iURbE84Io0DaSxXdScIDH8XvBupdySN9SGX8lmlTjcT6dC/lP13O/5T?=
 =?us-ascii?Q?wKUOa7KKPx5JoqCBWsQoLHpmPxLs4oHP6+jGj9MaNMyqdZWKGBjoolmbXRDq?=
 =?us-ascii?Q?A8hc30s42gJxpy7shmfy09DYmHf9G5OUsxFFQKHmO3s8UV/kii7i2AJ6Fid6?=
 =?us-ascii?Q?LGZOrOGAmy+Doms5up1t/oatS3xuycN/SH8cdTl5EkCGkjzD4g0wCykomk4G?=
 =?us-ascii?Q?VLaU0/bU+p2PQ+6TcaUQL2sfVHUD97/VEj6ZBdrksP7pffZV4iH/p0hBW3jU?=
 =?us-ascii?Q?JBMgfZtivdkNbPuF+L/gjGvNogSlvUt7XiVkY9tQz9cYSxD0dIRfxTbjr4wV?=
 =?us-ascii?Q?P1sQpLa//LjwYg8xfg3exGuCA0V+J+AScH/4eBVB5pYpKC9VR1GCKWO2p5YK?=
 =?us-ascii?Q?xOsqDrdB5PrIgqdnnV+E2knk1mEbXCzWE+7y2rcdjKVY2iPfziVrwGdkosWk?=
 =?us-ascii?Q?L9inUo9FiSOGf6jkM+zZ8FxY9g7wIFUWlZ0CSyx3CVa91Wypts0nqcqKqGI/?=
 =?us-ascii?Q?UfGwApaAtLOCI1PLBTF1Ujn30wXC3/8DYA/kCyv1VO9Gav+rcsjsD9avJUAl?=
 =?us-ascii?Q?eAmdBAXzPO57CbFkb4hAvqs3AL5V?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:47.5975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f73bfe-1371-475f-1e77-08dc7ebd34ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5854
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
 drivers/gpu/drm/nouveau/nouveau_drm.c | 42 +++++++++++----------------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++----
 3 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index cfff32168fd5..74c4c1f4b22a 100644
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
@@ -576,14 +572,15 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	drm->nvkm = nvkm;
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
-	drm->master.base.object.parent = &drm->parent;
+	mutex_init(&drm->client_mutex);
+	drm->_client.object.parent = &drm->parent;
 
 	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm",
-			       nouveau_name(dev), &drm->master.base);
+			       nouveau_name(dev), &drm->_client);
 	if (ret)
 		goto fail_alloc;
 
-	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
+	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
 		goto fail_nvif;
@@ -614,13 +611,9 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 		goto fail_nvif;
 	}
 
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
@@ -681,15 +674,14 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 fail_ttm:
 	nouveau_vga_fini(drm);
 	nouveau_cli_fini(&drm->client);
-fail_master:
-	nouveau_cli_fini(&drm->master);
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
 fail_nvif:
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-	nvif_client_dtor(&drm->master.base);
+	nvif_client_dtor(&drm->_client);
 fail_alloc:
+	mutex_destroy(&drm->client_mutex);
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
 	return ret;
@@ -741,11 +733,11 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	mutex_unlock(&drm->clients_lock);
 
 	nouveau_cli_fini(&drm->client);
-	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-	nvif_client_dtor(&drm->master.base);
+	mutex_destroy(&drm->client_mutex);
+	nvif_client_dtor(&drm->_client);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
@@ -946,7 +938,7 @@ nouveau_do_suspend(struct drm_device *dev, bool runtime)
 	}
 
 	NV_DEBUG(drm, "suspending object tree...\n");
-	ret = nvif_client_suspend(&drm->master.base);
+	ret = nvif_client_suspend(&drm->_client);
 	if (ret)
 		goto fail_client;
 
@@ -971,7 +963,7 @@ nouveau_do_resume(struct drm_device *dev, bool runtime)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	NV_DEBUG(drm, "resuming object tree...\n");
-	ret = nvif_client_resume(&drm->master.base);
+	ret = nvif_client_resume(&drm->_client);
 	if (ret) {
 		NV_ERROR(drm, "Client resume failed with error: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 0b1cf2f2f9bc..c0b2bfaab4e8 100644
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
2.44.0

