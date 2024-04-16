Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AC78A78AB
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E23112F17;
	Tue, 16 Apr 2024 23:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HObT2OO/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247D4112F19
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYcRCzsPUjkpzUQ1qSO9WNwMwJYUm3wfJ0Y8AJXjboBpZu+hRgqtonKoBaA2E23xkmo0hkW/moB3hRe2H7oCSJj5idpkgsAI6HXkbDSlUjdrSqGErpjeCBuIjM24DbPxyMTPM19r0hnSMMLMwtv6Zf76XHVAjXRGzaaOt7sDNP8Hd3yeofsIfJawpKs/HOuOCb0tS9o2avf1W1qZUaaOK5Zd5HeATgkeeCxQaVziWLhrToTwataZwG/WUX/3xxtTS80uRtGF//x1kLDY4Y08uCPYq2z6I184s0ax+FtN9KJp2aAlY53/8fbGdCwlk/xrLRiF8kvdftPO1wGmWVHVkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGV3+IU1juUasIPNJ1PkZP7LCCrUjlHk2R2CVAXyeWk=;
 b=f0Ah810y1UZ7CIA1nZG8vKIfAaMyu1SyxBFcjlU6weUvbQZEyUfdrl/P3ac1VtSC0Q5B2U5JBZ756gOeeGj3mDrn9Ju7s6XmJRPuDohboq1mtOdCVgmVuoIkLMzfGEe+naAyd3W+CM1kedbD+QbBYWVs4QHAETy0Q1o+4yAPJkCcaQlrWIQAe32bbJzHX0auwea5VuXXGt88Kq8kLLjWOo3ujTtbs2GerTcPBrZx1GQ2+klnqrqZpFkDdFxq+o15Ww4BkaiSAAsXRj/CgOMRuXAzlPwVuZHrxLwVFKGaAZO3uXOPehRLh0JSWsA3hjgjtz4x72CJJlCYHLgrOIDmxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGV3+IU1juUasIPNJ1PkZP7LCCrUjlHk2R2CVAXyeWk=;
 b=HObT2OO/9UE5XYj7MeX7Ouyev24IS8EsFqk1GSYNuTbQS7uhKEUJKgXfs6SXppW04aLyLiEpXeELE5BE2lFZeycKGrOTSDBVsb1ZBHgKyeAMZbpZ3GugX8d5ebUZV57HFRJNsCOEdd8MIN+XolL0lShPEWL8JmLJetYeU6xYLtqF0HBHNGeTYxnodBGdnjC8nkecut6XZAWwdpIhkNIVR3SoLo+1chOklz/ZQ/ToFWPQZdbNKLDsGKJiQ0u+0c6XlfqaY9qDFJi8zZj25hoRpVGavgzL/oxr1flF/wJAQ4/5Hs/5W++K8EZemm1ebCLPtRinhSzC7jz8rb2IkE9eig==
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by BL3PR12MB6428.namprd12.prod.outlook.com (2603:10b6:208:3b7::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:52 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::40) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:34 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 003/156] drm/nouveau: pass drm to nouveau_mem_new(),
 instead of cli
Date: Wed, 17 Apr 2024 09:37:29 +1000
Message-ID: <20240416234002.19509-4-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|BL3PR12MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c956267-b168-4426-d030-08dc5e6ea767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HQiFrOCe7ap37H4EEPsQXbzXzCb6t1PJfLQhWqNS0MR71I5iIwLso86FloPphbez4v8ETlYJiJtx8Z9aegWbpoR5fJaDRDXGMnrberB6Vot22CdgOpEJrjAj12SiZEXBjNrcrGA5zM6DqZ+efzqoVSgvaRpgAV4on8emqjjojLQ4pMyjUSPem812xFQiaFZXntCAgIX3oFkqu/SqU6LZPwlqHJAGdyNufsUcOuTUTsxa1pJxElAFMd1A5aX6R9gnodRSFGVNS6+fmJ7pxOx/+RaVnZEmfC0xk98/n8xUdanWpve4XbihFQD+ZFwOvfVMU1rgmtXU52PJALlyvbde3fuFRzTUDcuQFxvBW1tExqKSAKLbSLf6X2MRJ2Pe3/87pv3Cpip1dmV37FuywnjDQr+rgdMtWDmMSLSVvm/IC9inkGV+VVyxzN8vtxNgaogttePPSjhvVAn3w74WpefEUVQjm+qVuACga5qqFSMadR3DUIXcsak4uCwrG8wATg0GmT2VR4H4n/j6BrwDJhhJ+aS+N7rcn6dZJVx9zBjw7h5vpkpFU9dyaBy5TOvF6ccnmJ13lRc+4lMdIOPZ0Y93HEv9/5e8w7a1VpNda97Jz+1utY1fLsU3JHfF/OrcjZqMYXWZa7rPjLPoAFwhOudvVacslUfbiSN8BiP87Mldp+IAMKECZF2pyhj1r5qI4oQtuOFurJt8WbMz1aySZ68JttCOhlFHMnmjjrL/lEq5AUphPGuc7bLrDLOi+QoLYiEJ
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:52.5748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c956267-b168-4426-d030-08dc5e6ea767
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6428
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

- these only operate on drm.master these days, not per-client

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c   | 20 ++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_mem.h   |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_sgdma.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |  8 ++++----
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 25f31d5169e5..4d9ac9f30f05 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -78,19 +78,19 @@ nouveau_mem_map(struct nouveau_mem *mem,
 void
 nouveau_mem_fini(struct nouveau_mem *mem)
 {
-	nvif_vmm_put(&mem->cli->drm->client.vmm.vmm, &mem->vma[1]);
-	nvif_vmm_put(&mem->cli->drm->client.vmm.vmm, &mem->vma[0]);
-	mutex_lock(&mem->cli->drm->master.lock);
+	nvif_vmm_put(&mem->drm->cli.vmm.vmm, &mem->vma[1]);
+	nvif_vmm_put(&mem->drm->cli.vmm.vmm, &mem->vma[0]);
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
+	struct nouveau_cli *cli = &drm->master;
 	struct nvif_mmu *mmu = &cli->mmu;
 	struct nvif_mem_ram_v0 args = {};
 	u8 type;
@@ -126,8 +126,8 @@ int
 nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
-	struct nouveau_cli *cli = mem->cli;
-	struct nouveau_drm *drm = cli->drm;
+	struct nouveau_drm *drm = mem->drm;
+	struct nouveau_cli *cli = &drm->master;
 	struct nvif_mmu *mmu = &cli->mmu;
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
@@ -173,7 +173,7 @@ nouveau_mem_del(struct ttm_resource_manager *man, struct ttm_resource *reg)
 }
 
 int
-nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
+nouveau_mem_new(struct nouveau_drm *drm, u8 kind, u8 comp,
 		struct ttm_resource **res)
 {
 	struct nouveau_mem *mem;
@@ -181,7 +181,7 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
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
index b14895f75b3c..172744470bd1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -43,7 +43,7 @@ nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_resou
 		return ret;
 
 	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
-		ret = nouveau_mem_map(mem, &mem->cli->vmm.vmm, &mem->vma[0]);
+		ret = nouveau_mem_map(mem, &drm->cli.vmm.vmm, &mem->vma[0]);
 		if (ret) {
 			nouveau_mem_fini(mem);
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 486f39f31a38..57c7e3ba8e7b 100644
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
+	ret = nvif_vmm_get(&drm->cli.vmm.vmm, PTES, false, 12, 0,
 			   (long)(*res)->size, &mem->vma[0]);
 	if (ret) {
 		nouveau_mem_del(man, *res);
-- 
2.41.0

