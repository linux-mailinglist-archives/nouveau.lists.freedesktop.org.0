Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453F693CD50
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60A010E905;
	Fri, 26 Jul 2024 04:39:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ehluV2Ev";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640C110E917
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXAaxPv1FEXwyE/WKiVk3BojeD1DzD2INDaWzFPLJL9aK/DikobzbLRJ0SaPUHfsGA1cZb8SxJpW5YkSACbu1/+1mRPVEEOTqL5oaSe13RnX1rCQTBFhoZFc3HNoGNdPZlsTJhkdn4wJBCQG8Xu0jmiQzOgz69SKNszZlwed22b0pGZzeCL8r2Ecx7FQ986OzYwmzKvDwQOo6YHTOJSiCO28i7EnfzUNdh7afvKBwmyGy0C0u8O7+Gap2BsNFf6n/8jLRl4sD5AlgwySS9632sKvqT/8TYiw9SNMjQiDf/xzSWrhqhJIUpkao9VFz6vd0+fOBJ4FgGEn1ruzacGQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joJDcPM7J7iPyunQ6aD45Jz+ZOcfK09yPeiyzOWvwTA=;
 b=bqFTvzsPocsEvismBcnd6rMZDai65Anf+AACTQhfsYH2iWmC8Lwl1wICaDnRAXOlvgqfUiIaYQR01/BMysAqkT3wBP5OMhlTpE5l5NKBAst2vuWUA22AWNcEoPLif6GnJzOpx/jNiY4Y4D6eNAR6zQESlA/z/sJ7RmNrUNlv9Z2vlLp7hRt9t2Z3ykCFV3iIH3iMMWn9a1+tiNUGjnLXXwQJB8Ya5rJPcKWZpBuhmR7LcoCug+kbayZouD2QHJFv9fOnIU7gdhd1asgCWvTnjhaehP024uzlMORIoKkOjzOHPgyBrKYZ8901MH8LSDXcDiWUyQwiNpvXwuu3hUmKxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joJDcPM7J7iPyunQ6aD45Jz+ZOcfK09yPeiyzOWvwTA=;
 b=ehluV2EvZt4QCY7ec4ahrSMLgP1l8UwqZVW9V2xQf2MmJKssYeI4lOngA0BkhRHur7WuQ/Hm9Y47MgnRO8wKwVDOddo9F8uhfc+f+TqribL+Du/Q++X7tNWeWFZUKGv96WP+yti5gUDKIihrzK/8I1LBPyueHtLCHELyz8QjfuPv4mdyL+stde+68gAj6mSM7LyYbeVtZurcCBaSONwsowDPWe6F3Nlv2Tsc+OVBRxZBQ+0gmmjqhdlzg/XpfagcNzTHHlAsXhrKT16Kq1M04Olxu7Gi/f6mNnYrG17SELsSf+JNgbgNBb2wFSUPz6tpN/g8lE2igCURZlRmENanyg==
Received: from DS7PR03CA0114.namprd03.prod.outlook.com (2603:10b6:5:3b7::29)
 by IA1PR12MB8080.namprd12.prod.outlook.com (2603:10b6:208:3fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:33 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::44) by DS7PR03CA0114.outlook.office365.com
 (2603:10b6:5:3b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:23 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 28/37] drm/nouveau: add nvif_mmu to nouveau_drm
Date: Fri, 26 Jul 2024 14:38:19 +1000
Message-ID: <20240726043828.58966-29-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd62f6b-5510-4ef0-c2cc-08dcad2cf210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FjuZwtFm8/LZm9edOurfVGWsISeFMr00GzUA5EdxgRhK3oj4uzW1H0xXjKV3?=
 =?us-ascii?Q?MrvhyAtTKg1Z6+0U5uID3m1A5tDw6BnhawfESBY9LQE7vkYcVgUZz3ytKFRf?=
 =?us-ascii?Q?Y6pj1upxHPvugAC+6m4rSknF6I7dvv31kdoid6LPv6DQCOiiJBRkPziCZxdy?=
 =?us-ascii?Q?1+nVequteKTGDV3NEaXNuJdxQdedfRw4w7+W7FNoHQKcvgInTAU3YvD/gw7l?=
 =?us-ascii?Q?+iyKasV6n4odoNXZn+SQBNB/undQDJ/ZdoKxp/Ot6Ld4aEOz1iNIGA2bLB/f?=
 =?us-ascii?Q?GsIM3DGBYif79MmGuh5LulMoCp7YdK5xtYVQvu2+/JdxnKJPTxUpKo1sFqxT?=
 =?us-ascii?Q?xMFRDWJFE5nedxFl3MNEky2WmVEuCmSdZrtbmolAmswTkUbV1IT7j2VYqKVn?=
 =?us-ascii?Q?fiyfP3RepbY1wZ5meGV517oa3arJM57k0GZVBjCK3shmj+K/ik0AXeidx60K?=
 =?us-ascii?Q?afoU+5kyAiHCg3hBqa4SmtzPeX5KawmXhK7L+VFvOs6kyho8Q2LBG220f1UJ?=
 =?us-ascii?Q?HFNqebzuGdGovpSdwymBl//EZQf+bWsMpvnlvcLiQfJg41GPswnozsGi4yMV?=
 =?us-ascii?Q?98e7TJ6ef7ylc2wKfNkLEdL0BOkZNxKWm8XFMDDoUDhHYLdlCLQv5+s0d4F8?=
 =?us-ascii?Q?qFJLHewC1M0dOQUViV/wlN1hN5lLiL05qxLJ9UIFaijSdRaK6Na5mzp6m5GE?=
 =?us-ascii?Q?C1Rpf+KI49ULuCeGyHSBpetnL225Wgjt065/sD/1GaKr48Um+Fr9O5s/qKO6?=
 =?us-ascii?Q?qZWbYS/uElVdaYfgk/b8GtXXbLokUbb1HZplep5VwgVpF7AXg0Z8u3j2RTHC?=
 =?us-ascii?Q?fDKm7dkXx3zXgUEmDAKBKTzHiFka+dVyeIPKsHEvdKvMAoFWimAu3u5Jglir?=
 =?us-ascii?Q?fyQisFIg8hCsBWMGez6qNzc713SIOBYw1g5FlZeBrR1BpbM0jFAhpNfVD827?=
 =?us-ascii?Q?qQIjUPmkIuz7EMD65h9O2xlj/LfbfVYL1IiyEF14VSXftKetVmuyBSJrOEcP?=
 =?us-ascii?Q?NhR+lwaOwLb95Q1ZDT5U8AvisRjvEluZ3FFfIA9JT0n3eJgWImOr1nd24gWi?=
 =?us-ascii?Q?ulQ3UfPo0s5/EGnCERhPOiq1+lkY/p1po1c9T4g+Bj/Ocxas0Lbf5MYJS0As?=
 =?us-ascii?Q?iRwtwYAWkpYnQJh6dPLFC458HAommggwfwXXXze7g2QbjYZPc5ffSFYE+oia?=
 =?us-ascii?Q?pvnqXjePEbg4+mXHtET1MVCGO0o0kUTLhcWRROzLZVoToKm5Hpw5yETNJzZl?=
 =?us-ascii?Q?3HfvMyis4wi6cyjULlUDMWiF7Toca38UvnvIOwnHp5e0k1f5a3oWe4+0Zbwq?=
 =?us-ascii?Q?Ns7vuU9qnSEKdzhwGI2tNG4Y0x5CMniXmF7T4gYLKF9wKrMjKAWmEMVDTh9K?=
 =?us-ascii?Q?Pp3qmsirI4d4UjjDbG/CzK+PP9YMAk+w3r3z1ZqV5zwok7lavONSPTihREre?=
 =?us-ascii?Q?t2E7aoU3FQ9iTs3301JTcRlXI4Wb2K1l?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:32.9400 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcd62f6b-5510-4ef0-c2cc-08dcad2cf210
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080
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
which is removed by a later commit that removes nouveau_drm.master
entirely.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 35 ++++++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
 3 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 16104a61b7b8..6b33d1d0a4eb 100644
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
 
@@ -766,6 +761,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
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
 done:
 	if (ret) {
 		nouveau_drm_device_del(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 89d7d940381b..c55665faf2c1 100644
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

