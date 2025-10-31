Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08126C2608A
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 17:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A913010EBED;
	Fri, 31 Oct 2025 16:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tGAsaD1x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012059.outbound.protection.outlook.com [52.101.43.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A821F10EBED
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 16:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxkMo1JFJnXvTvkaSPioYdPWN752nngjUnhk+wj79ITDrcidoQXTekdiZx6cL+buywRtkqNXvdXscut/RFsWNYtClO5kgkmptnVnOZWT/+tZDUfeXq1ADy2BO1VJlMBk0CCWl15EgRHtFgfXdD0MfRmhCv9KsFeEAOpGAXSzZRAG/h8G4gSnG64Txjxi9iQ9mSR6s2vJpStaI5A/G5AxlfMlNQ97We8NKzzs69pRqY5/Fm/Fa/Os3Y904woR/7rIjojfQdTsnzW2eDfPVhbmb6DPIdrcd1SxniLpZnl3VP5pr5F6ubtS4dBIcS5ZfE5Xb0/Ru1ZqoFBjmknP43UVtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAHIU0R3/4RPc27iWWX9ouvQ5Iops5OeGAEYIzo5zyw=;
 b=B9CkPD1VYynWtwCX5/D17ff6bMa5b/wBXdJTe1GMtACcqvK+wd9KF5umDSh3yF0wPkanQ2MWgMfsnRxHMp5NsmUFNOW8xZbcbq5wl7TnYjzp3eCPpLmjRkLntkKux3kIFmoE0FIw8KKaQpwkg5ffW5iVcIQho5O3whIPBWZT5tJeU0pRdkWpxuQWbLfL2jeZ8QC97EtVSI2gLfpfBRDXfc3i+KON7ZW5Tis0jck62pLH7pK18b+9Dsmoj7MiPgu/zTOHx2BaSlRAnfKoFe8MNtyXYBH57oaC1Xd4rxxJOQSq/YQdr/MfjKejlHrbrprmFHGWfKPpo1YLXINYuSaH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PAHIU0R3/4RPc27iWWX9ouvQ5Iops5OeGAEYIzo5zyw=;
 b=tGAsaD1xGoQqMpKJKHzRnKIB7SDf6k+rluJWnHW+N+mRHMj6GED119r1ccvaq3LpIKPNzoNeU8zALatuBTF9WncAon5WlEg+WcQEKxolmUcH6VtllskjW9FSbbFGW+sh3yKK4CKH4/08YKSzt0fBgfvhYzNnNyg2GFPgU78a/dvJ7gtj9d313AKATQE8Hi/1fDeAfsc8ETD+p6KK4rNlVzEefa/fneyZ6tmnDWCxgAk6sB1V60V/s2R8X4rNS7UYgq2hcSNa7FMXK74gIlDv5mHYjHH2CTlxENcyFvUkung/kaRJJ4BQYRwZh2sDEuhKQimhy4edbT6cSohehNcUfg==
Received: from MN0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:52c::30)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 16:12:12 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::2f) by MN0PR05CA0018.outlook.office365.com
 (2603:10b6:208:52c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6 via Frontend Transport; Fri,
 31 Oct 2025 16:12:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 16:12:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:12:00 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:11:59 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>, <stable@vger.kernel.org>
Subject: [PATCH] drm/nouveau: set DMA mask before creating the flush page
Date: Fri, 31 Oct 2025 11:10:44 -0500
Message-ID: <20251031161045.3263665-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|MN0PR12MB5930:EE_
X-MS-Office365-Filtering-Correlation-Id: d9dd2216-b9f8-4580-11dd-08de18984023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rBKTFsfxqrAjDVRNIV2e+pPm3m3MAyqB/kXJsR3p1OJj2DZ4l4KIQyehJG8L?=
 =?us-ascii?Q?OKarPAVeua7dszOPwr10bcS6YlvX7PQcCtmL4Vk7ER86DiNEpbyWkRR2faIL?=
 =?us-ascii?Q?qLEd8P9FnOC8Ycb5fvPnlkr60dIA4supjZ9dMlvTwz5zUumqdxOmU/M6NQV0?=
 =?us-ascii?Q?eUXajlPAY5bOwuK4+Aqt2/CRd6ElWqzW4VfZWEGxJj1nbeDfZCCKeVXPxkCl?=
 =?us-ascii?Q?UaV7eviZpsyY9/WiS43Oqwkvg+md0Oxh6va4pBtYq4hbTOrQ6lk1jyqZD8Sw?=
 =?us-ascii?Q?HVLqCke5w4Vw5zlS7Yx1RuL9dYADofdsvUVNRJa6NMifnikPj/AuYRB+fCmD?=
 =?us-ascii?Q?CyZjNAIPw3W4dOpeumuuTYI8w+u7zynxtacxYvuTamWBR8KLfTX9yjlPi+zy?=
 =?us-ascii?Q?g88hsMzbEGz9g+X/H2JeKYnQdWI1m1UNozJIGz9MiyWXJaVrWYA7G1bcSzca?=
 =?us-ascii?Q?QJZYT/liAsgzhck+8H7txzjaUaMYss+iF+xEtqH8Ec2ePD4o1Oq9x8LUvwu0?=
 =?us-ascii?Q?/w0tdq+FzQbJowejpV7ADl3MbcyFn7YcDKNnAepMAHCUMfb4x/lKj4HirAbh?=
 =?us-ascii?Q?TwwW//F7voiCR5mZzxSZDRIQ2oPLgfJO9cpBEsmprtS/6Y8K6Urt4KNoRBLy?=
 =?us-ascii?Q?w+b5/mJN23LqNwOWDQjyNCo7GvqiyPS7TycTJS7q4F4CTPwOuYuQ69AYCvNY?=
 =?us-ascii?Q?KOsbcgqolKJW/vlcoREnmAZmoqLlJqduc1kBVWe4nLozoabIs4zpc3Oi/SOR?=
 =?us-ascii?Q?YQv+cGCgxlTNH3hn6LNaWb4+hd2ksfYEkPpx03dBy6Nwn0GmFC49O/DyUv7D?=
 =?us-ascii?Q?YxJexx2IuJGXUYegMtxrlNSdzERxpvVKwDWCpA4roOQYBM4g/Aib4SrEUaoz?=
 =?us-ascii?Q?5SwGV5T7IMUIE507HtdCPGQAwlicVGtKRJmV917nnsgwFVcLUHhGMT7niL9j?=
 =?us-ascii?Q?13aPCvwEVIu/Z7QznE+dww9gt7X8lYPuNNnJBZMUGC7mnQZpeD7/eV8NT/8a?=
 =?us-ascii?Q?TgkOVbrrSHVrGIZtrAv7YiZd9pOFwm0BL7odrVNsjYQMRIxnB9gyeRxo+kky?=
 =?us-ascii?Q?vYlk4VfLM6Ddvp65q2NNe0uDjaPjVc4GWAv1EjQ/TRnOmzhxHTGA53uhXBam?=
 =?us-ascii?Q?bndyFPKbt8lSn2+aLV8zODudbsSTUZfAN5wCQdkIF9X23Cw0jlZ1wuB20kvI?=
 =?us-ascii?Q?NAcmy0fF8jnISqXu3NlpR01tddcn+wHlmXFmOzSTEzPRWd8nqRuSUCkwOW7S?=
 =?us-ascii?Q?RMkpsARestKP2El40emoK3ljFq6jC9KHkgRDqgdqncmsmG/6tZS7gZjCbe7/?=
 =?us-ascii?Q?4Fg8ClU/jfESfmH1vochIGrcT0K9KG4h1KaIkng0PFtPKI/rVEE3834J2J4a?=
 =?us-ascii?Q?K/rYqyUXGaatbAiYZzjoqKAtPMNgNt/fdnU5K5tnT9GEU7JcPv1YkrqfaEkL?=
 =?us-ascii?Q?PnXrhLrnzXIpiHeoD4wo4LeHc4KbiB/7Exyj6QTCrH9DWqr7jxragVz2/SOZ?=
 =?us-ascii?Q?85Pr6Dv1nsmrGeoy/8FQZHoy0/HJszuWM0Zt49BxQ4g+5F1BBuLWDu0ZXZh0?=
 =?us-ascii?Q?cBtEfbQIiIspn9IzTDk=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:12:12.1483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9dd2216-b9f8-4580-11dd-08de18984023
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930
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

Set the DMA mask before calling nvkm_device_ctor(), so that when the
flush page is created in nvkm_fb_ctor(), the allocation will not fail
if the page is outside of DMA address space, which can easily happen if
IOMMU is disable.  In such situations, you will get an error like this:

nouveau 0000:65:00.0: DMA addr 0x0000000107c56000+4096 overflow (mask ffffffff, bus limit 0).

Commit 38f5359354d4 ("rm/nouveau/pci: set streaming DMA mask early")
set the mask after calling nvkm_device_ctor(), but back then there was
no flush page being created, which might explain why the mask wasn't
set earlier.

Flush page allocation was added in commit 5728d064190e ("drm/nouveau/fb:
handle sysmem flush page from common code").  nvkm_fb_ctor() calls
alloc_page(), which can allocate a page anywhere in system memory, but
then calls dma_map_page() on that page.  But since the DMA mask is still
set to 32, the map can fail if the page is allocated above 4GB.  This is
easy to reproduce on systems with a lot of memory and IOMMU disabled.

An alternative approach would be to force the allocation of the flush
page to low memory, by specifying __GFP_DMA32.  However, this would
always allocate the page in low memory, even though the hardware can
access high memory.

Fixes: 5728d064190e ("drm/nouveau/fb: handle sysmem flush page from common code")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/device/pci.c  | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
index 8f0261a0d618..7cc5a7499583 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
@@ -1695,6 +1695,18 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 	*pdevice = &pdev->device;
 	pdev->pdev = pci_dev;
 
+	/* Set DMA mask based on capabilities reported by the MMU subdev. */
+	if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
+		bits = pdev->device.mmu->dma_bits;
+	else
+		bits = 32;
+
+	ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bits));
+	if (ret && bits != 32) {
+		dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
+		pdev->device.mmu->dma_bits = 32;
+	}
+
 	ret = nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->dev,
 			       pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
 			       pci_find_capability(pci_dev, PCI_CAP_ID_AGP) ?
@@ -1708,17 +1720,5 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
 	if (ret)
 		return ret;
 
-	/* Set DMA mask based on capabilities reported by the MMU subdev. */
-	if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
-		bits = pdev->device.mmu->dma_bits;
-	else
-		bits = 32;
-
-	ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bits));
-	if (ret && bits != 32) {
-		dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
-		pdev->device.mmu->dma_bits = 32;
-	}
-
 	return 0;
 }

base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
-- 
2.51.0

