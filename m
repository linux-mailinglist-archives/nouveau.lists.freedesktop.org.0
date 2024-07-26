Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A327F93CD42
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4159410E70C;
	Fri, 26 Jul 2024 04:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mr3HTJSA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6394310E252
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HR+F3rcCryRlT9OZLmwM5+HjpAr/4knUmcBJJmoiLjXhmfVG9IqtoIh5YJQ3C6EY+YUjxtIbBcwu86osTC/N6WcyM7vmDR0SsMJzV2HlidAGq+ws+g5Wwa5gOjrjoMOJUxVdp242nn2HUa7ww1IWA2Vkyjg1xpAD5aHmlZHUWKlD2LC23LbxME5RclimTsj2gIdNeD+8gQ2R16DmRPtkLli/Y3lbelhWJz+9R/681eJhYBViAbXdTKhUfKufLueb+8DbvRi+vTtJezvZxWqwJ97Zxyepbc6pVww2aNWll+V53nEcykeKLWfzsFR2bz8uk/0lzC9Ec+YLeKE576RhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOJ+7I9y+R2jlizmlp3FR9oJepglGGL8Rv8WVQ+dQ5o=;
 b=AVwX2aHkFC9kU5IS8BB3yfugLq/Wg8LOYVowAroe3wHvNrnkZbUL8zwUK5cCWilLmn35O/PEmVAAIr2jp55Pxv/rZeNTObqXH/RdAYFzDv9791i0gWug1wEQPhchJiu4Bf0cDhK0z6cegC2Mp4V1Uj8Tk/UGhqK4jeS8yrk4TMYOcPuxnUaxiLTRLwgpHTGK3T35sPeXqdoUlwQdAH3a33XRHcGsqWOWru6om65xjUdR+GiZnCMnY+WeGIt1GXd0ft0U7Q1TxY8/Ydd4tRCB2xVVkNL6om/QDlINxhoaQm6TIct0a61BjXeZk8dKAcxBowqoqyQWU+5riuGOHYAtZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOJ+7I9y+R2jlizmlp3FR9oJepglGGL8Rv8WVQ+dQ5o=;
 b=Mr3HTJSAntJjx/cLAzrV08FtF/mHs15l77URz5uaK9FeBZkxw24+6BYM4kx7+tZ2nFPE72SYpcrHs3/L660YDrnInnDmpDNoZLE+WCYa9oFzLECO2jrU7jBaFrSp7/CNU9+KTZpNoydQOJhqmkgIC+soVtZuH6u7NvgJs2+P5CtRpL270333JWtrx4usBppKrck+8U2TXwVFLkM80eXnv4CR6WPq5n45++BNOl+reoM6N7R64eT9mKl3yuRMED7UYxgRnGJKW+QqGHyhOA/X+tlSnXAOcdYQmyMXA8sWIRvvKKA41o+ed8I1/LmnzHj/77rc4gzvuN3JoxBK1xqJfw==
Received: from DM6PR08CA0037.namprd08.prod.outlook.com (2603:10b6:5:1e0::11)
 by CY5PR12MB6621.namprd12.prod.outlook.com (2603:10b6:930:43::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:10 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::e1) by DM6PR08CA0037.outlook.office365.com
 (2603:10b6:5:1e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:01 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:59 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 11/37] drm/nouveau/nvkm: remove detect/mmio/subdev_mask
 from device args
Date: Fri, 26 Jul 2024 14:38:02 +1000
Message-ID: <20240726043828.58966-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|CY5PR12MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fcc704d-1c2d-4dab-d273-08dcad2ce4a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Sw3WCiGexOrChD/kEaTdtuWCR18GmMjp8Ye4GNV5ijhLeXv7Rp5oEmJtmv08?=
 =?us-ascii?Q?pPgKk+TGE4qxNR11oIhx1G1K0XjJtVKxUoelrRgvVx4aKUyOOyBPe0gWfXkf?=
 =?us-ascii?Q?NDvcDuu8RjQlaznSQBhRlpS6lFvBI0ncqoJVsdAkipLNUN1tbbRSh+vkdTWy?=
 =?us-ascii?Q?syJQE3BrlBfiqqsuH/NCnonliaz7NETqTIKYWWFcjuhJX9hbK/9ZsmxkOxnD?=
 =?us-ascii?Q?pOMqRndgB6UsFMY50W+inp7UY3jXwz2fA9CiHPx8GnzFlputbVI2aadda4L5?=
 =?us-ascii?Q?QGZ5VxP3W42MQvzpIBPmpqy5GZ1+TMwhsS2BuNNNqtloT0+95HByQyPU9Aeo?=
 =?us-ascii?Q?ubj0jaE+BNig1X2nV3oW0IcvoKZwha4uMeS60C4xEsLkbAqW6ComuxgztxTQ?=
 =?us-ascii?Q?fwDo7+2tfNz9U2wdeZYYBWI0KUNXB6HXgRayJgygNItFHTHtpNtxbEzLjnw9?=
 =?us-ascii?Q?p4xavh8+hsG2WsSd24HpZKuMYUMD/HO8mx7PDvuZYz2jxVKplMOqhA6nLpvH?=
 =?us-ascii?Q?nkAykDKiCjQJenKK4wGHD0FdIiy/HeRz4ip/ufLnnGYM2+DLrgwYPBfQT/70?=
 =?us-ascii?Q?qXAzXWUcn+M9N0C+6CAI71ivR+VVty2BtMyJhPbTau3gfOZlvu2nSUcwbNEX?=
 =?us-ascii?Q?1gw/tAKluCPZWlsHDEskDFeslLOfshNeiZR6nqeh3wzAx9L4uiCGD7tk6Rxl?=
 =?us-ascii?Q?r+RBLw6u2xnzust7ieJ4a2CBhFHQzVvdhDAf9wUq7fDqaG0kEhr7hcc1K83R?=
 =?us-ascii?Q?pHZ2YFJc5OypSoCPqQga4iukdMqtnOlMMiybH3ZnoZ1QspdUMsxXs56VgXOd?=
 =?us-ascii?Q?pMFiECWx0DxJB53HURc4Vtq1wPLz0AqDChp6ZjSJuQro/MMLNdew4Q3N4w72?=
 =?us-ascii?Q?LLZIEkx800wBRA2hLrzRHFqEtXqncpvXNbNucGaGSXxC2WcyE1iVQWSbdWKH?=
 =?us-ascii?Q?gij2PYKGC6cWwKcdDWRw/h9e7JaRgnfn8RP4ZNLIkV8P410RhI5n8TDspyyI?=
 =?us-ascii?Q?wi6PML34Fr1eqf1G/D4s0J8CPR/B3KuBWbnZ3EAG8ANowuyIfpGjAf2NhCiy?=
 =?us-ascii?Q?4MKEJSJt4DrgLKcx/NfP9VEeKRmSY7h7HJQrnBjybRR2BFdwXVQyH+QPi7kp?=
 =?us-ascii?Q?/7zG851ObMUbChmEezVsB7YYnxMviw+gyvMhaLPfJIUIS1Q8m7quL3hyxQin?=
 =?us-ascii?Q?093Su3xbLGaXBl7xP+koPLE/q2Al6rUbcXqowvJ/6Uqx17hPcoOIPc9kubPj?=
 =?us-ascii?Q?bJ0Dm4EawNeBG0C1cDkqxY/kHkDyyYGywjEfxT9ww9FG5oetMmtII78chR+Y?=
 =?us-ascii?Q?W2kqSnbXIWMLvbJt3RJGmOzgVRRyXP1wSUSsl4MKGVAtw8xGkttaC/vTd8n8?=
 =?us-ascii?Q?mcp5rZpva7xEvI8Kx1xH88rTsh0epS4pthNRveuU0Vt4vaV7nmDPViDm8mL1?=
 =?us-ascii?Q?atsLrSrTNRN5QIseFQBPOZVo3OaVZI3h?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:10.4444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcc704d-1c2d-4dab-d273-08dcad2ce4a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6621
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

All callers now pass "detect=true, mmio=true, subdev_mask=~0ULL",
so remove the function arguments, and associated code.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
 .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   6 +-
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 422 +++++++++---------
 .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |   4 +-
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 -
 .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
 7 files changed, 209 insertions(+), 231 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
index b4b5df3e1610..7444c4d59e09 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
@@ -10,6 +10,5 @@ struct nvkm_device_pci {
 };
 
 int nvkm_device_pci_new(struct pci_dev *, const char *cfg, const char *dbg,
-			bool detect, bool mmio, u64 subdev_mask,
 			struct nvkm_device **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
index ccee53d4e4ec..22f74fc88cd7 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
@@ -51,6 +51,5 @@ struct nvkm_device_tegra_func {
 int nvkm_device_tegra_new(const struct nvkm_device_tegra_func *,
 			  struct platform_device *,
 			  const char *cfg, const char *dbg,
-			  bool detect, bool mmio, u64 subdev_mask,
 			  struct nvkm_device **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a018b5475478..950184b2c1c2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -840,8 +840,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	/* We need to check that the chipset is supported before booting
 	 * fbdev off the hardware, as there's no way to put it back.
 	 */
-	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug,
-				  true, true, ~0ULL, &device);
+	ret = nvkm_device_pci_new(pdev, nouveau_config, nouveau_debug, &device);
 	if (ret)
 		return ret;
 
@@ -1387,8 +1386,7 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	struct nouveau_drm *drm;
 	int err;
 
-	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug,
-				    true, true, ~0ULL, pdevice);
+	err = nvkm_device_tegra_new(func, pdev, nouveau_config, nouveau_debug, pdevice);
 	if (err)
 		goto err_free;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 31ed3da32fe7..006f01e93b9b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -67,12 +67,6 @@ nvkm_device_list(u64 *name, int size)
 	return nr;
 }
 
-static const struct nvkm_device_chip
-null_chipset = {
-	.name = "NULL",
-	.bios     = { 0x00000001, nvkm_bios_new },
-};
-
 static const struct nvkm_device_chip
 nv4_chipset = {
 	.name = "NV04",
@@ -3104,7 +3098,6 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		 const struct nvkm_device_quirk *quirk,
 		 struct device *dev, enum nvkm_device_type type, u64 handle,
 		 const char *name, const char *cfg, const char *dbg,
-		 bool detect, bool mmio, u64 subdev_mask,
 		 struct nvkm_device *device)
 {
 	struct nvkm_subdev *subdev;
@@ -3132,233 +3125,228 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	mmio_base = device->func->resource_addr(device, 0);
 	mmio_size = device->func->resource_size(device, 0);
 
-	if (detect || mmio) {
-		device->pri = ioremap(mmio_base, mmio_size);
-		if (device->pri == NULL) {
-			nvdev_error(device, "unable to map PRI\n");
-			ret = -ENOMEM;
-			goto done;
-		}
+	device->pri = ioremap(mmio_base, mmio_size);
+	if (device->pri == NULL) {
+		nvdev_error(device, "unable to map PRI\n");
+		ret = -ENOMEM;
+		goto done;
 	}
 
 	/* identify the chipset, and determine classes of subdev/engines */
-	if (detect) {
-		/* switch mmio to cpu's native endianness */
-		if (!nvkm_device_endianness(device)) {
-			nvdev_error(device,
-				    "Couldn't switch GPU to CPUs endianness\n");
-			ret = -ENOSYS;
-			goto done;
-		}
 
-		boot0 = nvkm_rd32(device, 0x000000);
-
-		/* chipset can be overridden for devel/testing purposes */
-		chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
-		if (chipset) {
-			u32 override_boot0;
-
-			if (chipset >= 0x10) {
-				override_boot0  = ((chipset & 0x1ff) << 20);
-				override_boot0 |= 0x000000a1;
-			} else {
-				if (chipset != 0x04)
-					override_boot0 = 0x20104000;
-				else
-					override_boot0 = 0x20004000;
-			}
+	/* switch mmio to cpu's native endianness */
+	if (!nvkm_device_endianness(device)) {
+		nvdev_error(device,
+			    "Couldn't switch GPU to CPUs endianness\n");
+		ret = -ENOSYS;
+		goto done;
+	}
 
-			nvdev_warn(device, "CHIPSET OVERRIDE: %08x -> %08x\n",
-				   boot0, override_boot0);
-			boot0 = override_boot0;
-		}
+	boot0 = nvkm_rd32(device, 0x000000);
 
-		/* determine chipset and derive architecture from it */
-		if ((boot0 & 0x1f000000) > 0) {
-			device->chipset = (boot0 & 0x1ff00000) >> 20;
-			device->chiprev = (boot0 & 0x000000ff);
-			switch (device->chipset & 0x1f0) {
-			case 0x010: {
-				if (0x461 & (1 << (device->chipset & 0xf)))
-					device->card_type = NV_10;
-				else
-					device->card_type = NV_11;
-				device->chiprev = 0x00;
-				break;
-			}
-			case 0x020: device->card_type = NV_20; break;
-			case 0x030: device->card_type = NV_30; break;
-			case 0x040:
-			case 0x060: device->card_type = NV_40; break;
-			case 0x050:
-			case 0x080:
-			case 0x090:
-			case 0x0a0: device->card_type = NV_50; break;
-			case 0x0c0:
-			case 0x0d0: device->card_type = NV_C0; break;
-			case 0x0e0:
-			case 0x0f0:
-			case 0x100: device->card_type = NV_E0; break;
-			case 0x110:
-			case 0x120: device->card_type = GM100; break;
-			case 0x130: device->card_type = GP100; break;
-			case 0x140: device->card_type = GV100; break;
-			case 0x160: device->card_type = TU100; break;
-			case 0x170: device->card_type = GA100; break;
-			case 0x190: device->card_type = AD100; break;
-			default:
-				break;
-			}
-		} else
-		if ((boot0 & 0xff00fff0) == 0x20004000) {
-			if (boot0 & 0x00f00000)
-				device->chipset = 0x05;
+	/* chipset can be overridden for devel/testing purposes */
+	chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
+	if (chipset) {
+		u32 override_boot0;
+
+		if (chipset >= 0x10) {
+			override_boot0  = ((chipset & 0x1ff) << 20);
+			override_boot0 |= 0x000000a1;
+		} else {
+			if (chipset != 0x04)
+				override_boot0 = 0x20104000;
 			else
-				device->chipset = 0x04;
-			device->card_type = NV_04;
+				override_boot0 = 0x20004000;
 		}
 
-		switch (device->chipset) {
-		case 0x004: device->chip = &nv4_chipset; break;
-		case 0x005: device->chip = &nv5_chipset; break;
-		case 0x010: device->chip = &nv10_chipset; break;
-		case 0x011: device->chip = &nv11_chipset; break;
-		case 0x015: device->chip = &nv15_chipset; break;
-		case 0x017: device->chip = &nv17_chipset; break;
-		case 0x018: device->chip = &nv18_chipset; break;
-		case 0x01a: device->chip = &nv1a_chipset; break;
-		case 0x01f: device->chip = &nv1f_chipset; break;
-		case 0x020: device->chip = &nv20_chipset; break;
-		case 0x025: device->chip = &nv25_chipset; break;
-		case 0x028: device->chip = &nv28_chipset; break;
-		case 0x02a: device->chip = &nv2a_chipset; break;
-		case 0x030: device->chip = &nv30_chipset; break;
-		case 0x031: device->chip = &nv31_chipset; break;
-		case 0x034: device->chip = &nv34_chipset; break;
-		case 0x035: device->chip = &nv35_chipset; break;
-		case 0x036: device->chip = &nv36_chipset; break;
-		case 0x040: device->chip = &nv40_chipset; break;
-		case 0x041: device->chip = &nv41_chipset; break;
-		case 0x042: device->chip = &nv42_chipset; break;
-		case 0x043: device->chip = &nv43_chipset; break;
-		case 0x044: device->chip = &nv44_chipset; break;
-		case 0x045: device->chip = &nv45_chipset; break;
-		case 0x046: device->chip = &nv46_chipset; break;
-		case 0x047: device->chip = &nv47_chipset; break;
-		case 0x049: device->chip = &nv49_chipset; break;
-		case 0x04a: device->chip = &nv4a_chipset; break;
-		case 0x04b: device->chip = &nv4b_chipset; break;
-		case 0x04c: device->chip = &nv4c_chipset; break;
-		case 0x04e: device->chip = &nv4e_chipset; break;
-		case 0x050: device->chip = &nv50_chipset; break;
-		case 0x063: device->chip = &nv63_chipset; break;
-		case 0x067: device->chip = &nv67_chipset; break;
-		case 0x068: device->chip = &nv68_chipset; break;
-		case 0x084: device->chip = &nv84_chipset; break;
-		case 0x086: device->chip = &nv86_chipset; break;
-		case 0x092: device->chip = &nv92_chipset; break;
-		case 0x094: device->chip = &nv94_chipset; break;
-		case 0x096: device->chip = &nv96_chipset; break;
-		case 0x098: device->chip = &nv98_chipset; break;
-		case 0x0a0: device->chip = &nva0_chipset; break;
-		case 0x0a3: device->chip = &nva3_chipset; break;
-		case 0x0a5: device->chip = &nva5_chipset; break;
-		case 0x0a8: device->chip = &nva8_chipset; break;
-		case 0x0aa: device->chip = &nvaa_chipset; break;
-		case 0x0ac: device->chip = &nvac_chipset; break;
-		case 0x0af: device->chip = &nvaf_chipset; break;
-		case 0x0c0: device->chip = &nvc0_chipset; break;
-		case 0x0c1: device->chip = &nvc1_chipset; break;
-		case 0x0c3: device->chip = &nvc3_chipset; break;
-		case 0x0c4: device->chip = &nvc4_chipset; break;
-		case 0x0c8: device->chip = &nvc8_chipset; break;
-		case 0x0ce: device->chip = &nvce_chipset; break;
-		case 0x0cf: device->chip = &nvcf_chipset; break;
-		case 0x0d7: device->chip = &nvd7_chipset; break;
-		case 0x0d9: device->chip = &nvd9_chipset; break;
-		case 0x0e4: device->chip = &nve4_chipset; break;
-		case 0x0e6: device->chip = &nve6_chipset; break;
-		case 0x0e7: device->chip = &nve7_chipset; break;
-		case 0x0ea: device->chip = &nvea_chipset; break;
-		case 0x0f0: device->chip = &nvf0_chipset; break;
-		case 0x0f1: device->chip = &nvf1_chipset; break;
-		case 0x106: device->chip = &nv106_chipset; break;
-		case 0x108: device->chip = &nv108_chipset; break;
-		case 0x117: device->chip = &nv117_chipset; break;
-		case 0x118: device->chip = &nv118_chipset; break;
-		case 0x120: device->chip = &nv120_chipset; break;
-		case 0x124: device->chip = &nv124_chipset; break;
-		case 0x126: device->chip = &nv126_chipset; break;
-		case 0x12b: device->chip = &nv12b_chipset; break;
-		case 0x130: device->chip = &nv130_chipset; break;
-		case 0x132: device->chip = &nv132_chipset; break;
-		case 0x134: device->chip = &nv134_chipset; break;
-		case 0x136: device->chip = &nv136_chipset; break;
-		case 0x137: device->chip = &nv137_chipset; break;
-		case 0x138: device->chip = &nv138_chipset; break;
-		case 0x13b: device->chip = &nv13b_chipset; break;
-		case 0x140: device->chip = &nv140_chipset; break;
-		case 0x162: device->chip = &nv162_chipset; break;
-		case 0x164: device->chip = &nv164_chipset; break;
-		case 0x166: device->chip = &nv166_chipset; break;
-		case 0x167: device->chip = &nv167_chipset; break;
-		case 0x168: device->chip = &nv168_chipset; break;
-		case 0x172: device->chip = &nv172_chipset; break;
-		case 0x173: device->chip = &nv173_chipset; break;
-		case 0x174: device->chip = &nv174_chipset; break;
-		case 0x176: device->chip = &nv176_chipset; break;
-		case 0x177: device->chip = &nv177_chipset; break;
-		case 0x192: device->chip = &nv192_chipset; break;
-		case 0x193: device->chip = &nv193_chipset; break;
-		case 0x194: device->chip = &nv194_chipset; break;
-		case 0x196: device->chip = &nv196_chipset; break;
-		case 0x197: device->chip = &nv197_chipset; break;
-		default:
-			if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
-				switch (device->chipset) {
-				case 0x170: device->chip = &nv170_chipset; break;
-				default:
-					break;
-				}
-			}
+		nvdev_warn(device, "CHIPSET OVERRIDE: %08x -> %08x\n",
+			   boot0, override_boot0);
+		boot0 = override_boot0;
+	}
 
-			if (!device->chip) {
-				nvdev_error(device, "unknown chipset (%08x)\n", boot0);
-				ret = -ENODEV;
-				goto done;
-			}
+	/* determine chipset and derive architecture from it */
+	if ((boot0 & 0x1f000000) > 0) {
+		device->chipset = (boot0 & 0x1ff00000) >> 20;
+		device->chiprev = (boot0 & 0x000000ff);
+		switch (device->chipset & 0x1f0) {
+		case 0x010: {
+			if (0x461 & (1 << (device->chipset & 0xf)))
+				device->card_type = NV_10;
+			else
+				device->card_type = NV_11;
+			device->chiprev = 0x00;
 			break;
 		}
+		case 0x020: device->card_type = NV_20; break;
+		case 0x030: device->card_type = NV_30; break;
+		case 0x040:
+		case 0x060: device->card_type = NV_40; break;
+		case 0x050:
+		case 0x080:
+		case 0x090:
+		case 0x0a0: device->card_type = NV_50; break;
+		case 0x0c0:
+		case 0x0d0: device->card_type = NV_C0; break;
+		case 0x0e0:
+		case 0x0f0:
+		case 0x100: device->card_type = NV_E0; break;
+		case 0x110:
+		case 0x120: device->card_type = GM100; break;
+		case 0x130: device->card_type = GP100; break;
+		case 0x140: device->card_type = GV100; break;
+		case 0x160: device->card_type = TU100; break;
+		case 0x170: device->card_type = GA100; break;
+		case 0x190: device->card_type = AD100; break;
+		default:
+			break;
+		}
+	} else
+	if ((boot0 & 0xff00fff0) == 0x20004000) {
+		if (boot0 & 0x00f00000)
+			device->chipset = 0x05;
+		else
+			device->chipset = 0x04;
+		device->card_type = NV_04;
+	}
 
-		nvdev_info(device, "NVIDIA %s (%08x)\n",
-			   device->chip->name, boot0);
+	switch (device->chipset) {
+	case 0x004: device->chip = &nv4_chipset; break;
+	case 0x005: device->chip = &nv5_chipset; break;
+	case 0x010: device->chip = &nv10_chipset; break;
+	case 0x011: device->chip = &nv11_chipset; break;
+	case 0x015: device->chip = &nv15_chipset; break;
+	case 0x017: device->chip = &nv17_chipset; break;
+	case 0x018: device->chip = &nv18_chipset; break;
+	case 0x01a: device->chip = &nv1a_chipset; break;
+	case 0x01f: device->chip = &nv1f_chipset; break;
+	case 0x020: device->chip = &nv20_chipset; break;
+	case 0x025: device->chip = &nv25_chipset; break;
+	case 0x028: device->chip = &nv28_chipset; break;
+	case 0x02a: device->chip = &nv2a_chipset; break;
+	case 0x030: device->chip = &nv30_chipset; break;
+	case 0x031: device->chip = &nv31_chipset; break;
+	case 0x034: device->chip = &nv34_chipset; break;
+	case 0x035: device->chip = &nv35_chipset; break;
+	case 0x036: device->chip = &nv36_chipset; break;
+	case 0x040: device->chip = &nv40_chipset; break;
+	case 0x041: device->chip = &nv41_chipset; break;
+	case 0x042: device->chip = &nv42_chipset; break;
+	case 0x043: device->chip = &nv43_chipset; break;
+	case 0x044: device->chip = &nv44_chipset; break;
+	case 0x045: device->chip = &nv45_chipset; break;
+	case 0x046: device->chip = &nv46_chipset; break;
+	case 0x047: device->chip = &nv47_chipset; break;
+	case 0x049: device->chip = &nv49_chipset; break;
+	case 0x04a: device->chip = &nv4a_chipset; break;
+	case 0x04b: device->chip = &nv4b_chipset; break;
+	case 0x04c: device->chip = &nv4c_chipset; break;
+	case 0x04e: device->chip = &nv4e_chipset; break;
+	case 0x050: device->chip = &nv50_chipset; break;
+	case 0x063: device->chip = &nv63_chipset; break;
+	case 0x067: device->chip = &nv67_chipset; break;
+	case 0x068: device->chip = &nv68_chipset; break;
+	case 0x084: device->chip = &nv84_chipset; break;
+	case 0x086: device->chip = &nv86_chipset; break;
+	case 0x092: device->chip = &nv92_chipset; break;
+	case 0x094: device->chip = &nv94_chipset; break;
+	case 0x096: device->chip = &nv96_chipset; break;
+	case 0x098: device->chip = &nv98_chipset; break;
+	case 0x0a0: device->chip = &nva0_chipset; break;
+	case 0x0a3: device->chip = &nva3_chipset; break;
+	case 0x0a5: device->chip = &nva5_chipset; break;
+	case 0x0a8: device->chip = &nva8_chipset; break;
+	case 0x0aa: device->chip = &nvaa_chipset; break;
+	case 0x0ac: device->chip = &nvac_chipset; break;
+	case 0x0af: device->chip = &nvaf_chipset; break;
+	case 0x0c0: device->chip = &nvc0_chipset; break;
+	case 0x0c1: device->chip = &nvc1_chipset; break;
+	case 0x0c3: device->chip = &nvc3_chipset; break;
+	case 0x0c4: device->chip = &nvc4_chipset; break;
+	case 0x0c8: device->chip = &nvc8_chipset; break;
+	case 0x0ce: device->chip = &nvce_chipset; break;
+	case 0x0cf: device->chip = &nvcf_chipset; break;
+	case 0x0d7: device->chip = &nvd7_chipset; break;
+	case 0x0d9: device->chip = &nvd9_chipset; break;
+	case 0x0e4: device->chip = &nve4_chipset; break;
+	case 0x0e6: device->chip = &nve6_chipset; break;
+	case 0x0e7: device->chip = &nve7_chipset; break;
+	case 0x0ea: device->chip = &nvea_chipset; break;
+	case 0x0f0: device->chip = &nvf0_chipset; break;
+	case 0x0f1: device->chip = &nvf1_chipset; break;
+	case 0x106: device->chip = &nv106_chipset; break;
+	case 0x108: device->chip = &nv108_chipset; break;
+	case 0x117: device->chip = &nv117_chipset; break;
+	case 0x118: device->chip = &nv118_chipset; break;
+	case 0x120: device->chip = &nv120_chipset; break;
+	case 0x124: device->chip = &nv124_chipset; break;
+	case 0x126: device->chip = &nv126_chipset; break;
+	case 0x12b: device->chip = &nv12b_chipset; break;
+	case 0x130: device->chip = &nv130_chipset; break;
+	case 0x132: device->chip = &nv132_chipset; break;
+	case 0x134: device->chip = &nv134_chipset; break;
+	case 0x136: device->chip = &nv136_chipset; break;
+	case 0x137: device->chip = &nv137_chipset; break;
+	case 0x138: device->chip = &nv138_chipset; break;
+	case 0x13b: device->chip = &nv13b_chipset; break;
+	case 0x140: device->chip = &nv140_chipset; break;
+	case 0x162: device->chip = &nv162_chipset; break;
+	case 0x164: device->chip = &nv164_chipset; break;
+	case 0x166: device->chip = &nv166_chipset; break;
+	case 0x167: device->chip = &nv167_chipset; break;
+	case 0x168: device->chip = &nv168_chipset; break;
+	case 0x172: device->chip = &nv172_chipset; break;
+	case 0x173: device->chip = &nv173_chipset; break;
+	case 0x174: device->chip = &nv174_chipset; break;
+	case 0x176: device->chip = &nv176_chipset; break;
+	case 0x177: device->chip = &nv177_chipset; break;
+	case 0x192: device->chip = &nv192_chipset; break;
+	case 0x193: device->chip = &nv193_chipset; break;
+	case 0x194: device->chip = &nv194_chipset; break;
+	case 0x196: device->chip = &nv196_chipset; break;
+	case 0x197: device->chip = &nv197_chipset; break;
+	default:
+		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
+			switch (device->chipset) {
+			case 0x170: device->chip = &nv170_chipset; break;
+			default:
+				break;
+			}
+		}
 
-		/* vGPU detection */
-		boot1 = nvkm_rd32(device, 0x0000004);
-		if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
-			nvdev_info(device, "vGPUs are not supported\n");
+		if (!device->chip) {
+			nvdev_error(device, "unknown chipset (%08x)\n", boot0);
 			ret = -ENODEV;
 			goto done;
 		}
+		break;
+	}
 
-		/* read strapping information */
-		strap = nvkm_rd32(device, 0x101000);
+	nvdev_info(device, "NVIDIA %s (%08x)\n",
+		   device->chip->name, boot0);
 
-		/* determine frequency of timing crystal */
-		if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
-		    (device->chipset >= 0x20 && device->chipset < 0x25))
-			strap &= 0x00000040;
-		else
-			strap &= 0x00400040;
+	/* vGPU detection */
+	boot1 = nvkm_rd32(device, 0x0000004);
+	if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
+		nvdev_info(device, "vGPUs are not supported\n");
+		ret = -ENODEV;
+		goto done;
+	}
 
-		switch (strap) {
-		case 0x00000000: device->crystal = 13500; break;
-		case 0x00000040: device->crystal = 14318; break;
-		case 0x00400000: device->crystal = 27000; break;
-		case 0x00400040: device->crystal = 25000; break;
-		}
-	} else {
-		device->chip = &null_chipset;
+	/* read strapping information */
+	strap = nvkm_rd32(device, 0x101000);
+
+	/* determine frequency of timing crystal */
+	if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
+	    (device->chipset >= 0x20 && device->chipset < 0x25))
+		strap &= 0x00000040;
+	else
+		strap &= 0x00400040;
+
+	switch (strap) {
+	case 0x00000000: device->crystal = 13500; break;
+	case 0x00000040: device->crystal = 14318; break;
+	case 0x00400000: device->crystal = 27000; break;
+	case 0x00400040: device->crystal = 25000; break;
 	}
 
 	if (!device->name)
@@ -3368,7 +3356,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	nvkm_intr_ctor(device);
 
 #define NVKM_LAYOUT_ONCE(type,data,ptr)                                                      \
-	if (device->chip->ptr.inst && (subdev_mask & (BIT_ULL(type)))) {                     \
+	if (device->chip->ptr.inst) {                                                        \
 		WARN_ON(device->chip->ptr.inst != 0x00000001);                               \
 		ret = device->chip->ptr.ctor(device, (type), -1, &device->ptr);              \
 		subdev = nvkm_device_subdev(device, (type), 0);                              \
@@ -3387,7 +3375,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 #define NVKM_LAYOUT_INST(type,data,ptr,cnt)                                                  \
 	WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
 	for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
-		if ((device->chip->ptr.inst & BIT(j)) && (subdev_mask & BIT_ULL(type))) {    \
+		if (device->chip->ptr.inst & BIT(j)) {                                       \
 			ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
 			subdev = nvkm_device_subdev(device, (type), (j));                    \
 			if (ret) {                                                           \
@@ -3409,7 +3397,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 
 	ret = nvkm_intr_install(device);
 done:
-	if (device->pri && (!mmio || ret)) {
+	if (ret && device->pri) {
 		iounmap(device->pri);
 		device->pri = NULL;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
index abccb2bb68a6..3ff6436007fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
@@ -1626,7 +1626,6 @@ nvkm_device_pci_func = {
 
 int
 nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
-		    bool detect, bool mmio, u64 subdev_mask,
 		    struct nvkm_device **pdevice)
 {
 	const struct nvkm_device_quirk *quirk = NULL;
@@ -1680,8 +1679,7 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 				    pci_dev->bus->number << 16 |
 				    PCI_SLOT(pci_dev->devfn) << 8 |
 				    PCI_FUNC(pci_dev->devfn), name,
-			       cfg, dbg, detect, mmio, subdev_mask,
-			       &pdev->device);
+			       cfg, dbg, &pdev->device);
 
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
index bf3176bec18a..c182d9c3e4fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -56,7 +56,6 @@ int  nvkm_device_ctor(const struct nvkm_device_func *,
 		      const struct nvkm_device_quirk *,
 		      struct device *, enum nvkm_device_type, u64 handle,
 		      const char *name, const char *cfg, const char *dbg,
-		      bool detect, bool mmio, u64 subdev_mask,
 		      struct nvkm_device *);
 int  nvkm_device_init(struct nvkm_device *);
 int  nvkm_device_fini(struct nvkm_device *, bool suspend);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 87caa4a72921..d1c294f00665 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -237,7 +237,6 @@ int
 nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		      struct platform_device *pdev,
 		      const char *cfg, const char *dbg,
-		      bool detect, bool mmio, u64 subdev_mask,
 		      struct nvkm_device **pdevice)
 {
 	struct nvkm_device_tegra *tdev;
@@ -311,8 +310,7 @@ nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 	tdev->gpu_speedo_id = tegra_sku_info.gpu_speedo_id;
 	ret = nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
 			       NVKM_DEVICE_TEGRA, pdev->id, NULL,
-			       cfg, dbg, detect, mmio, subdev_mask,
-			       &tdev->device);
+			       cfg, dbg, &tdev->device);
 	if (ret)
 		goto powerdown;
 
@@ -333,7 +331,6 @@ int
 nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
 		      struct platform_device *pdev,
 		      const char *cfg, const char *dbg,
-		      bool detect, bool mmio, u64 subdev_mask,
 		      struct nvkm_device **pdevice)
 {
 	return -ENOSYS;
-- 
2.45.1

