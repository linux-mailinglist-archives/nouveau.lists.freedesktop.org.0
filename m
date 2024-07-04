Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652092AD65
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5FB10E471;
	Tue,  9 Jul 2024 00:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GjD+WQV7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D7C10E450
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S800a2eysHegpzrGOqQ/4vGNsE7gwfTnYJsPI7wpB30E6asHiPq/kGXj75up4ZPBFywBJDC3JXZ185Vf+uHHn92B/ofvjKqlwnP6KzaZd9e6sNQixECHiH/D+Q7QgbT0mxE6pL+h5sufljMFuE4JbK1Yc4fyLeyPOKAUfsjG/DQXJiGfjQTFT4bGZZ8Nj5pmZg0Nq6bVPMqO2St2pdQkSldwC4/u1JeTFeK3LwV9dwckuzGkDWqZ70NYSQDcc54WAu0IU20y3q8DaTary2A93EXW4cnjGD+kuWpN/ohUu3sQ4ejiyBuQYN1teEGCMmsTcSpST/xnqbep+It+j47GHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owjsD44Edkdv9BlVnuGUR+N31ExGTHWsibBGkzPu9ag=;
 b=FtPkKYCflnbXHF3xCYy2YVbnnkZOFpMR6c3uOxZmK7qQK3lYKPkX9xeTIhCMm3MHnL3eojBgvW5FFJOJ6WGuDRJJjcIJjezrZt/o4BL2z14m09Ozid77lI8TdELg44kc5PgTbA5RAPgLF5o355NKargojwhA74Af2vMtIa+N+K2yyGH+p3jjOCtX3eFkIMYlSTKxAuvJT5ObDJyvyInvMVQkNmaAComrttlrSr3wllDCVVILBLiek5uXlrlOx9dmIlEW8SGbrWaEF8BBktS65gcNTJlR0Fc5pAf9FhESQ+dPXYEDHMcDTxkUWlG9i9FpzLaK2CuAYK9vMEyGOsGdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owjsD44Edkdv9BlVnuGUR+N31ExGTHWsibBGkzPu9ag=;
 b=GjD+WQV7SSYvh/gSsWNx144AhfIYepIaiQI8VLL8HAn9OVSOUxLsc8bbB70C525IelixO88wB6i2a30zyo/oEFGWCmlEPYGquuhm974lCj5ubC2PBBZZFLZSxxiFJ5dBbjnWD0QQb2F3zEOhnnGdZMurHhZh95P3bJJWzY6/esTLoC8y5DG+y2uickjJnTZVKLDj9Nd+nifkKSS7iT1gIfqqsGOmEaUuqlnAdo90HhAH/6p+zFaSpfkKlMS+MKV76Mx+oVIgZnYeiNdeQOiLKnPzlPcbBrFqBHejJ94Y+VRNDeYOwMXZJ4o6SfPdDRmARkXr0UTRiyYWlFH89n8a1g==
Received: from PH7PR17CA0029.namprd17.prod.outlook.com (2603:10b6:510:323::23)
 by BY5PR12MB4196.namprd12.prod.outlook.com (2603:10b6:a03:205::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:41 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:323:cafe::6f) by PH7PR17CA0029.outlook.office365.com
 (2603:10b6:510:323::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:26 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 29/37] drm/nouveau: pass drm to nouveau_mem_new(),
 instead of cli
Date: Fri, 5 Jul 2024 04:37:13 +1000
Message-ID: <20240704183721.25778-30-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|BY5PR12MB4196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eeea639-11d1-440c-9140-08dc9fb1db22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kp+fpm4DKraLrzEkuroFA2AZWG8gUE6IVwYPFvXMzxgu0dL0BesAAuOJhi+C?=
 =?us-ascii?Q?x6++Dyu66y1rr4f57mO8+xOOTDwK/5li4DXic2OSma7u2OXuN7lRIgnca1f7?=
 =?us-ascii?Q?SGKrGwYMqX+ipJvadgH+urLQk7+nvFnJTNnp8weZMVsrI5oixBfmzxCgGCIo?=
 =?us-ascii?Q?5g3DfG5QysBJK+wCth/N8R3CXAqeqRYZv79yPNzlcEdgSZamkozVCuLIWFXo?=
 =?us-ascii?Q?qTtQesZJSwjD0UeDDTaEPWpkzX1OiNWk+kHC4SvC0M781/brR3EQ73AAoEKP?=
 =?us-ascii?Q?i3rrB4Y+9bA657vF9UeIxZllTeuF1eClJsvoP9Xz6MLoUGgHeW80GGwBqLzS?=
 =?us-ascii?Q?JwMB5mAIzRSHJTE47FbPw/VcFNgjLpyffsmbnyL/ksLmjc3P8EY+UUaA7/la?=
 =?us-ascii?Q?fKuLil5/AY5Ed7EcXd+MKZ5cNqmftZIe2Pynvn9R0pOLnnedE++CioAo+o8U?=
 =?us-ascii?Q?SucV+WGvUJkvPwsuMsIBqRHlhU/JgjDjmk5PaO05TWbNmWim1JsjDbw5oHNX?=
 =?us-ascii?Q?Z6vIvEw6nDEosHbvrbuO8TqYSs9nBidUpGrQYY1ivvNyBdT3NklzROpn98Y4?=
 =?us-ascii?Q?RSPvpzTwC8VA/qFeEUNMYQ3Vc7nHd8bI1rvoaWBwgR0DkdXoqTutDTSFD3sy?=
 =?us-ascii?Q?THtOX9eCUp3rbsotbmTfdW/qo7Cmi8z3HKxI/QpChN6fTpRgCGJj6xicXDj7?=
 =?us-ascii?Q?oPesIj0m+cZ8PT/3ABSDBvLtjA6y8zbSET1UBertlw+xrQeEXY39GCz196TJ?=
 =?us-ascii?Q?AQdQZBPVK1cI3Y2qGjJZk1Q1jl7K4tCfTrQd8pE8Tkwhvf1GGYF11ZLb1AvJ?=
 =?us-ascii?Q?+6iF5JPz0dpj1XLYK1aSWZNCbub8VTnQ3NhcJ0TiB+a450de5vLUIBvPCuv8?=
 =?us-ascii?Q?QXGH47BJ9yC7gUNSiBPkMR2bGP2YBRIuCsPjX9dlqL2nsfnH670awCWGlUgh?=
 =?us-ascii?Q?HYPVoHDt47YzqlXAqvc7v2/QVzc7Qwbx3vdHwjVvlnup5JnNzP0Dz6LAu1/J?=
 =?us-ascii?Q?ytbXFp5NjOuLoTS0Ox44rgq24NE6hFrkhgPFOfXZuZP6PkJSMRY3nhicZIRE?=
 =?us-ascii?Q?SOT7ZfLjHFq9y3fVmuROEwEZHPjeeRd0bU9MsjIJ5QR1KcCB72s599f85/XU?=
 =?us-ascii?Q?/oIXZmvFRO2rG8JNyA6ni1MBgCL9a6jhM+doI40oZ3462/yJQ6SMKlyS0GI6?=
 =?us-ascii?Q?qhn9CIDEmZnXuetCHbwAglYiuP0oeZx/54RUJsv3yyGiyCJaUoPcgmYCxzgR?=
 =?us-ascii?Q?IqsczKa7JSVZ1aMCHWBDDgF15fn82bCmfdb2JTwgtpRph0rOs89ZNo8acd/m?=
 =?us-ascii?Q?sFTEObn+4EN0cdU9b4G8Tc3YqjaPco0TwHO+2sUg8gwPtq5rSWOOP7RaRDjG?=
 =?us-ascii?Q?Kpc2P3RG5KC4qHou40EJl0tk/1ZOFGMeAnpDikBx6vLNqzkrpYogTnGrrO2R?=
 =?us-ascii?Q?r2KGJvmxFTioGumMGe1/2iGv3plg94UX?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:41.2865 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eeea639-11d1-440c-9140-08dc9fb1db22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4196
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

