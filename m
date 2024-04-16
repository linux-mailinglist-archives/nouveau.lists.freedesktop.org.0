Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58568A794A
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8093112FF9;
	Tue, 16 Apr 2024 23:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MjRuRjbM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B36112FF6
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W92XZ8+k5lFzKcaJnIsoHrohTKG+qBuXjQpPYG3iilapO0MHXWOSyK0lqAIv1GuomdcN8HxsYHx1YtyoagK02J6wArBukJM/GlN/7PU0tvVS3qrSwL3sl+I15F1xj4kjL/+nyPLik6gd+nr/YowW29vsvsZLTrQSIRbCAoyCZgcNZCnsIjf+GTIhJ4xWXzPhrMtbC7U5416Zco8XsdNPrq4fygrjLrjHQbcFYQn7ELIodUvhVfXHsCSaoK8UytoeUZMJ33fI48+NecgpKIsG4YW1d6upJOoBpr1TC5+oacThWLSnpZYqn2umLAsEdBuQClBr7VqFRC4M332eTpKqpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c9j4dPSiXOs4yPOf4bJMrbfuYKehO/3MRCgH/CZQxs=;
 b=jSwchdfjxY6pDu2FnJcWFMIs6EbVB+CQ8zKkD+EloOn9Z0wnpeUOAp2zDve9BXfakY2KrOP8u/xj5vwLE50xcNdqWXi7UAcfGbcCVoTEG9j9I5q34Fm3XrxnUHXxe9r+LAv1lr2xoXGe+NjycKa0N5sHlJq8XMpKPCec0nsVwWahGeBeuxeaNTvptUGPYsVOLitTp0NFyjPR2bC1K1Q5YLxk5/DCxQdLnitvywf7oJfclOWFD9SOSZVyU2/Uq53I0wqFl2hcZSBcLOui2kCFBaASadElzcOeoSsJ1l68jtVfoeHGDXCZXKgaVDyLkFfp0aoEFsM8Fq+ywGy0oOlxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c9j4dPSiXOs4yPOf4bJMrbfuYKehO/3MRCgH/CZQxs=;
 b=MjRuRjbMeMfjkvvG9w7FxiTkmlSkPpyE9Sjq+4LihFzAn5xRNQtZHp1lynUey5ja0bWJUNhNmScN9wOitQrkKCXSGHfHdqv4kJyGoht5kGuHXHEPpeftJ0YFMr5salCT21WZn0UhFF+HD7Jp/p+KCV7gWdhRqZjCYq2xSQRZicPrD9YJ+2OiyzSk1gaEI3/ww9DPAeeSHOIkXzM6/G+joaHXK5jmVbt+FEuXc2C+mqkV8cqIyw3OX4+DG33y+mVzp+9yLl9X2QmfMelosq0XTH8rk2G6GD/kpIzaKzIdN2ckN3vwXfnAa37huqz0Ib00xQnayNo4x/dbMNRClB8/oQ==
Received: from CH0P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::24)
 by SJ1PR12MB6265.namprd12.prod.outlook.com (2603:10b6:a03:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:51 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::c5) by CH0P223CA0006.outlook.office365.com
 (2603:10b6:610:116::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:51 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:23 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 151/156] drm/nouveau: remove client_mutex
Date: Wed, 17 Apr 2024 09:39:57 +1000
Message-ID: <20240416234002.19509-152-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SJ1PR12MB6265:EE_
X-MS-Office365-Filtering-Correlation-Id: 73d2f041-8bec-43ab-09d2-08dc5e6f11ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aqxdMyyDuvOwbefsh0SDYSXSd9mmcmQ/QJpZVqcGa2rL9u24NAlNHIjWrLwHr8RZBpDUqtfYIhZ9XdQvP6Sbz5ma0GFEKvlppL1vHksA/LU3+hsp8n+fiakYhySgG9wwMJyL2RJNQHoUHDIAZ3UVfypfexwZGeMPqyD7n5FJt1GjS8+/xIx51W5rkYQaZaCPc83j/CsytI64xpB85mGQGTB9aT3//Jvl9h2699rCJ/lvSg1GBYqfp98n73cItHk3YrbO85lNTBgvA4vuJi0Y0OMDPwb7c86MxRbaTJQoZBpUSETWoXwk6vkhc4sHasfWVpElz+kDgowdkz1a2EozJ6e80ogaIyeEGCVTiPgCLtGbcIQ1MhGjH3gWDPFqWcmTZ+945D1qzOd0NXBiweqOlGZj/IjLIXZvE04NsPOBZ6NGsjPxqhAn0RYpVPRCYaOHqKCB3ERebo2mpXbTBgoMO81JCtwouNCpJ3UvRFQJAs05JEep3eePqpFPgcKi2awhbmDaEdQWsYIRXoOVInEtffTZqtCuzzk0+7Dvj+KXWU5P6f+yYS9I4/krK/+sekZ4ynkCQ9IEwOluUbmwgcctL9uaeq1+WFWjsjq7T99tix3Xvwvi473dbAlYIyt5AXH+ylAEK0+4BHr1o50jf/ocHMBIhObgbJ+Chhcbm/nJ50hF7Odyfi/X1G8/F2hb0jHs7D/BO84pKd8ndKR5Ychv5TjQ9NDt3GvOif5+UdViczQODzjmzheYz7Gxhn6tyAX
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:51.3242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73d2f041-8bec-43ab-09d2-08dc5e6f11ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6265
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

- this protected the drm.master object rb, which no longer exists

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 7 -------
 drivers/gpu/drm/nouveau/nouveau_drv.h | 1 -
 drivers/gpu/drm/nouveau/nouveau_mem.c | 6 ------
 3 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index ae6b992c32f9..aac9e57d0204 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -185,9 +185,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nvif_mmu_dtor(&cli->mmu);
 	cli->device.object.map.ptr = NULL;
 	nvif_device_dtor(&cli->device);
-	mutex_lock(&cli->drm->client_mutex);
 	nvif_client_dtor(&cli->base);
-	mutex_unlock(&cli->drm->client_mutex);
 }
 
 static int
@@ -204,9 +202,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	INIT_LIST_HEAD(&cli->worker);
 	mutex_init(&cli->lock);
 
-	mutex_lock(&drm->client_mutex);
 	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
-	mutex_unlock(&drm->client_mutex);
 	if (ret) {
 		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
 		goto done;
@@ -505,7 +501,6 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 
-	mutex_init(&drm->client_mutex);
 	drm->_client.object.parent = &drm->parent;
 
 	ret = nvkm_driver_ctor(drm->nvkm, &driver, &impl, &priv);
@@ -641,7 +636,6 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->_client);
 fail_alloc:
-	mutex_destroy(&drm->client_mutex);
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
 	return ret;
@@ -696,7 +690,6 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	destroy_workqueue(drm->sched_wq);
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-	mutex_destroy(&drm->client_mutex);
 	nvif_parent_dtor(&drm->parent);
 	mutex_destroy(&drm->clients_lock);
 	kfree(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e40416c884a8..046f219328bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -203,7 +203,6 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
-	struct mutex client_mutex;
 	struct nvif_client _client;
 	struct nvif_device device;
 	struct nvif_mmu mmu;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index ff67f00c93c5..aa0503d13cbe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -80,9 +80,7 @@ nouveau_mem_fini(struct nouveau_mem *mem)
 {
 	nvif_vmm_put(&mem->drm->cli.vmm.vmm, &mem->vma[1]);
 	nvif_vmm_put(&mem->drm->cli.vmm.vmm, &mem->vma[0]);
-	mutex_lock(&mem->drm->client_mutex);
 	nvif_mem_dtor(&mem->mem);
-	mutex_unlock(&mem->drm->client_mutex);
 }
 
 int
@@ -113,11 +111,9 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 	else
 		args.dma = tt->dma_address;
 
-	mutex_lock(&drm->client_mutex);
 	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", type, PAGE_SHIFT,
 				 reg->size,
 				 &args, sizeof(args), &mem->mem);
-	mutex_unlock(&drm->client_mutex);
 	return ret;
 }
 
@@ -130,7 +126,6 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
-	mutex_lock(&drm->client_mutex);
 	switch (drm->mmu.impl->mem.oclass) {
 	case NVIF_CLASS_MEM_GF100:
 		ret = nvif_mem_ctor_type(mmu, "ttmVram",
@@ -154,7 +149,6 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 		WARN_ON(1);
 		break;
 	}
-	mutex_unlock(&drm->client_mutex);
 
 	reg->start = mem->mem.impl->addr >> PAGE_SHIFT;
 	return ret;
-- 
2.41.0

