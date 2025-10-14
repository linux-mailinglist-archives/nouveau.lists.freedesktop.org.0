Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87E6BDAD54
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 19:46:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994CF10E159;
	Tue, 14 Oct 2025 17:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wm5CdoDG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012062.outbound.protection.outlook.com
 [40.107.200.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A910E159
 for <nouveau@lists.freedesktop.org>; Tue, 14 Oct 2025 17:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cseje09GjzXi1ESTSERZYPyHOY7S9Q/iOoVzNVTKCXt3q4jmfl6ekYSWQyUrjVWybRI6BJdhatGYgnicPsWFZchQpjKHPnDh6XOQmSUaizxLLwOje8YT5hgIO60WtpTK8jds2kAwJdVos9YQaBwdWvN36XmVyLR91zT0tSoJnWOwqO687TmiocMCw45h6cI6hIMJ8CIU3CI7/nrA0XosQENLpnWBezIFJzV4+MQBCrkkHbGPwwgbkGal5pvJcRbUMSU2SH5WPl0Un9TkL/m7yuI0rPUfdD+cjfGYlZ2ywODioCn+T9nqrDYrrY1Y11BXfyRi5cbKTZE/TN4vyJHAog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LxkNi/MSKg7SFIn0sVvOa53gI2bU7XuH2lsrfWqeuTk=;
 b=Q8sPpNWj7hPtOw8eZ5VzWN6JOt3E/KnuK+7ZtIESJ1Yj9wG/+iHFyssLK+3pFCDgOPZcPxU34ZuI7+dsxhIvYyWiVpFqiSr7zNf+p0urRa5QGKNUB50IHgd0nxJPWvJ65wkw3p/Vi5meDwtQoHv+/OUBs7gxciY4jgwtTQhh4m1stYt/cawi572RAfYKSyAq55W/i+ajx7zh3KfmuQaQqtH+1OTIOZKMHFtuSqXpIeDT5OzLaWCLypT5x2k8w8lS7xPisXuNvSZzzJMwbhn7CVu8SdN2lG2Sfy2KtPZ0K+QtSnKXyclsAACOZikj4S1EWTjPEtYz2Qi+9FGj56Iwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxkNi/MSKg7SFIn0sVvOa53gI2bU7XuH2lsrfWqeuTk=;
 b=Wm5CdoDGhvbB94PV0bZxx/Y0SLqFcreEJy5g8Hkpk7TwcArJolkg1QFW7f1XyizDmaalFuMzag8Q3eF3M4jouuu86OQIAbumJ7CYmNn7Ulew8O3j5WixcAjOCOcjdSj/iNOMSYKmvb7K1qTUt3ZAczV4w67GWkpd7huWk7SZ6j8l5iemc0RuVIhotZmIfRnruA4/zAATwVT8mb97+T6T38SA7h9RGfWoprPG/EcMSnjYsenMJTnJ2frbWqCfqrRFldE2insEUxQiZk63FqzEXBTEGzj8BW314BQdZFgVq8JTvmwyUG74FojyxqcuTmHQdZE3usjMJULbH+1bP7ndRQ==
Received: from SA1P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::14)
 by MW4PR12MB5644.namprd12.prod.outlook.com (2603:10b6:303:189::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 17:46:36 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:22c:cafe::c8) by SA1P222CA0004.outlook.office365.com
 (2603:10b6:806:22c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 17:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 17:46:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Tue, 14 Oct
 2025 10:46:21 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 10:46:20 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Ard
 Biesheuvel" <ardb@kernel.org>, David Airlie <airlied@gmail.com>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: set DMA mask before creating the flush page
Date: Tue, 14 Oct 2025 12:45:12 -0500
Message-ID: <20251014174512.3172102-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|MW4PR12MB5644:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f598d1-f263-4678-9327-08de0b499f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+0kPVhAaosmVgXE824Cfsxsaf4vbe3TLOwE1ieutiTy+aH4gbpqiTikGIe5D?=
 =?us-ascii?Q?a9xtfFQCXeaSMgGyscZL77llJimW0MTtcStcSoIe43wvRU5dMsMs0dtKbjFB?=
 =?us-ascii?Q?adfIxUv1Pw8FaeHQYkPFPOh019yLkOGx02dKvkyLBdVJ8cWb/E9A4tshbY4q?=
 =?us-ascii?Q?eSHkQujqfZ6hTbUcICzLIWgZoKW7/aAnMMM6Bf0LMcWGoERS+Np7ZJTmlCWb?=
 =?us-ascii?Q?zO6F5shK2i8YkO1p3bYIHswMmEDkrnaCojpbJGma6Un7ARF+MHAe9pzwWTFZ?=
 =?us-ascii?Q?z5xsRLO3hZeraD283OwlQMnmiqdr3kxg1QUcp2TG/Spnipeat4GUkJhLLE+d?=
 =?us-ascii?Q?8LYE3J6dl5/ZZJR9qWjuaxUq2yVt3Lq9MMFAaeBpvvOryRg2BhyLwiPDv7Bt?=
 =?us-ascii?Q?I20pxbCcdiZtGf7S1gxnHgUd/IoXiONvSQr0RW4P3S+p2i+T+tmmF/gqd0rX?=
 =?us-ascii?Q?l2EKFA3TT/L6Y6NuDi8S1ZyoBjRPJ3nr4mrxtRTtG0z0xNc7ZiB6s038WZ8L?=
 =?us-ascii?Q?9rdAGnlk4uQsIzCKeH8PKh14arRjx7TNPHmjEt7fkQPzghg2IWsJnSgroUaJ?=
 =?us-ascii?Q?7+0EYSG31jfmMxUj0jWBepDN5ebg/8IrS1BjgzyHx7eQEZiFwD1IuXsacyM1?=
 =?us-ascii?Q?OP3Sc5CAExQza8kkN81Obn3zNODGiuWseyYSBRaTj6XL3S6CMPCnHF8/g88W?=
 =?us-ascii?Q?Y8C/T6NJ9uJwgH2sGCKlh9kbAiL3xMWVZzIj7GmKbUr/xAEXthUkiLlD8Fxg?=
 =?us-ascii?Q?2klWTO8G6qkuZNl8IOj3sCB7HE5NKnC2fjWfGZrns9ntdHt3NL1AAePBauF7?=
 =?us-ascii?Q?79QP6g4ycDxmNraZ0S1hymMl5vNYA8b0LdpPSi8YuCsMHRW883Lkf8SQZ/Lz?=
 =?us-ascii?Q?RBpfuTasmhy5ZG3ixJxwmkZpS0ibTfML4a7wnqnH2al2XjRCNqhtnpb4F6+4?=
 =?us-ascii?Q?K5lIuNYg6fPB2A4vYtoIGzPw7OnsyC5oCYLHMlpah0SY18VxuaqGh3qodrgN?=
 =?us-ascii?Q?ha2kpePUTChFmWguJle9WZuM7Hefs0RhuE1FMJj+wmrZUdwVrLvNHNSU6wjc?=
 =?us-ascii?Q?efsSzWa9regcr/fEywss0AzODsDRUWXPTXzIF0hGLcXdUZkrlrWHDfucFQ7U?=
 =?us-ascii?Q?7yPXHYHINfJoSKsdCBSN4D4U3L47klzr5BApyaJGV3OHU1blEsDuzPkDaQSG?=
 =?us-ascii?Q?l6vP9bG1IaUiQVU33OzzDzMYin4XNRWSELyJglM5n9NnPZIe4szYQugL0ZfQ?=
 =?us-ascii?Q?YKRqQUy+PMZ9iJ1DRvhoaFz2FEnapuPDL9z2ZqvdoZYcUGoL1kDsUqFMthei?=
 =?us-ascii?Q?CZK5CTsyKCs3bziOBFctx7hjlMTvUtyAqiKn9Ze7R2/bNtCHsYHwtRbADQDv?=
 =?us-ascii?Q?c3xi2U0/3DbrqGcXNq8R9cJOqb3e/zCusQUbZI3mTgAXAWrCetOx6E6RAHnx?=
 =?us-ascii?Q?jPk0LAnFTsV8aDdQfvTc+BorXIXEY+6jsJBZa5sjoAV09DeL63f/Yo2HBRvG?=
 =?us-ascii?Q?AFr+vusyDNAcYHY3/E0k0xBFV9MIdFoxqlYmKPH1+YBkA1QWpdofA16xHXWZ?=
 =?us-ascii?Q?7Ok4SVLNJxDjwx+qbgM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:46:36.0328 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f598d1-f263-4678-9327-08de0b499f07
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5644
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

