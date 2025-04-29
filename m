Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A610AA3C9F
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC29B10E5A5;
	Tue, 29 Apr 2025 23:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B54n325x";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E269B10E5A5
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XET2Iom4YS1XI0T/egP2Sg9tvQeHGBPLfBqkOMe7RUlB/kS3yRkjSCUoY1LTqSX4w7Qbasjh7zROOV4L6YPlpR4z/EdHaFXiqScxVeLIl/au6+YD+bZ1cHv+bNH0QWiQccR/VTI2Vidh4fWTSHUypIVGF0YAfPYm25TsYIL1d+xtdIj2yR768SK/mgUpwPzy83CoqCqmF7Q5O0jYymF+f9RVkdCu3LcFsyvWOoawovH/I02hFCclAoencqNi/HFQpkpv7zlECxS3aopm/nxbn9WWu/peUHb1KAam+JPHOvt63QwVALQ9ZAuP96Q9W5ew4qvhC6aKHBPISpHhS4AxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvXppITDgGXqLn/eCiaUHnKSoCXQdPNna89Eml2sCmY=;
 b=PS2PCk6CJdPSIkkNcIY+DKdy4oBO7hMAABTQmD5OxGFxeGAjPKU+UEwKUf5dhlNLN38qxdsCGiJetiCMOfy6kHSP80mEO7PQ2Tqqb6prVTKO2MfqOz1TGdgi0DPL1OlbhScj+VNO97CGCxzmBHeqoUD3XJ7juECKxYOZ8IWSWdhHjtAO3QHmM+oMYaH0RbspcTHIXUM3hKauDOQr7FP7bM3cihs1OhJhU1mZMxgXSzMQ1G6x8937eV1Eruymu6yMnvvo2CmbScyAfkvDkPPKI1x2n4Vf2CGUv77WgHSRFDPfOds/lAm9XOTEXro1mO9hALkxoymPk6X0eGFV7/c59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvXppITDgGXqLn/eCiaUHnKSoCXQdPNna89Eml2sCmY=;
 b=B54n325xeJw5D18nYBnyfEcrbyGgVlFlyJIqo21HzTJ+bB39Tv21I8eg2rEZDuDjuC7FVLp5CgeXs1nFFi+7XDspZsTsS+aNzAuPIv5edl2XTLmCo+msErYX8AD3EWwbwIInq7d1vgl51V1a1PWfAKFeNz0LRSq+z5V2HayFiCEss/EWgPc+LKyyfnvSBmYI4bzS/d7UaGIm3xocREiZSZIzAWuUz1e+Y7jhGmCadcSVjDqoJTNMjr9doKva5k2JUz5saSqKNbYrQQ2JNL/YIXBqLWrKO39QhjWHhCJIeAR+AYRkKXSz7cVAIqWjp34H6mmA9aiNex77JlqTt1oY1g==
Received: from SA1PR03CA0005.namprd03.prod.outlook.com (2603:10b6:806:2d3::6)
 by CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 29 Apr
 2025 23:40:49 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::e3) by SA1PR03CA0005.outlook.office365.com
 (2603:10b6:806:2d3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 23:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:34 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 45/60] drm/nouveau/pci: add PRI address of config space mirror
 to nvkm_pci_func
Date: Wed, 30 Apr 2025 09:39:13 +1000
Message-ID: <20250429233929.24363-46-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 021d4a0a-503c-4058-b7cd-08dd877745ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wy+9dvxYh6NtHVC8RhBFbHjBMxhRn3FdQC+7EPSLA6hpvuMSZ1O2dveVzuUM?=
 =?us-ascii?Q?l/5idlhaNutuzPHWOR+x77GhKZEF6+B3IVF7//8S5Pen6cxHgEih/n6twSMw?=
 =?us-ascii?Q?yQlkMRrTOPxt9B0TOY9uk3zt5M1qQpRJKSu998bO40NiuXM183sbBZA45DHW?=
 =?us-ascii?Q?UhQ1gIxMTMQYSKVAZDeFJtTegPfIoa9Ixc7YrlMzbegxmV0z0TIk3BK9To80?=
 =?us-ascii?Q?dPkztLOsNXw76l5zq/NVgPm9QFOEREX8U6r76zaK8zIQ6+7ai3JpzB3e+nOT?=
 =?us-ascii?Q?PCxtwszJ0hIkFQf7JPp3E8OEIKzi7EnW81fr3r1BA261BQGx/RMbwxtP2mTV?=
 =?us-ascii?Q?TABZmzFPV6AUBx49NrhLVLOTZkOhcJgbesU27vJB/lUpBHfufMNEeEcGW3/a?=
 =?us-ascii?Q?JoFNylAp9/KgRlR0pvV8GcxJMecWnaL4e8Xl4lotycgtOPSK0C60xdraEIch?=
 =?us-ascii?Q?FU4/Eq/RG5tX9g4NeZFPp2u6VGFspJqfYVjFaZ7ALK5mHifBID5Fxn9ywQbJ?=
 =?us-ascii?Q?cf94eVd8B3fZT8KQO06sXzNncKlOvYvk8ieUMeU9EOXsyJRgoeQKikFgmsC3?=
 =?us-ascii?Q?cQytELKSwQohnhmCKwWFAWS3D6Hm526UuKTkxeUDPbXaCBsmWH1eCOE7yPWJ?=
 =?us-ascii?Q?0QXZUa0hlYYuRhHhma2g5Ffw6fi+51VfJlBkmqoSlJpHHZoOkLgCa7tAT6tz?=
 =?us-ascii?Q?wjcywi/phcdck40nRoUD4/diVTV13ybWS594z9H/+oTrXYwb9asnSewXgqJX?=
 =?us-ascii?Q?Tls390QYKuBWj7IhiNAEN6w7zppdCjza6O0TovtgN/qJE0boonaCaOgynzYs?=
 =?us-ascii?Q?BMH0jd/sNAnTQ3hYymlbyB7iaCu1Sy1bpv3lI47Yc2Q4eHfX/tmcmU8htlzs?=
 =?us-ascii?Q?VzYpBIxmLsmLi7Vjtqlhuk1cI+p1W4NMiGA4k0uyZU9NEvkDy3Rmsb7sQgbu?=
 =?us-ascii?Q?9q8SPOPu0wNp9KkMS9bjIqmElAYn/KSeobRzaE8/DGBuFNxmVx1UlqubYEao?=
 =?us-ascii?Q?TKALCczREwMOBuImX9UrmIaxNp8q8aTOpHD6ok7gD6PCMvLkuOUpLx0C0AXt?=
 =?us-ascii?Q?Xeos4M7XadjbynX+QBWoceFzZOhuxHNaCip7hZF3NluW3sDkM2UgMlEQdvjE?=
 =?us-ascii?Q?i0UnHSx3EdxioZ7e+b2pJOgy4bnpGKrjW4OwgHqcSDRWlRnzl3vLqWXdsOPo?=
 =?us-ascii?Q?BULHzgBLopvTJZQHEFcsm3OSEWr6mDPn4llyKDC2jwgqp3IQStDEIh+e7bs5?=
 =?us-ascii?Q?sA1+E2cfIyhTmfrxESbER7PioHsyqm3v8HxKKu9QusmSW8uCaWrshqeKhidB?=
 =?us-ascii?Q?MaP/EYodaRYl0Psa2/uxBMVVOGgRdKoO7BJF1D4EPCa/l8OfQnaTCAMf/1De?=
 =?us-ascii?Q?XLy3bADTysunruy+UzWlxPjWFAyq/M3JKSR/tmQZNOsgFMIOLcbf2KrH8beK?=
 =?us-ascii?Q?wa34TwLByQ86yDDrDvu+qm9YD2/mqV4xqb5cPSCTqloKh07Jdnsys2u81j+p?=
 =?us-ascii?Q?Jm6gJvrQOTwATknN05wMuEjH8tTzyxNPOAcY?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:49.4668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 021d4a0a-503c-4058-b7cd-08dd877745ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743
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

These registers have moved on GH100/GBxxx, and the GSP-RM init code uses
hardcoded values from earlier GPUs to fill GspSystemInfo.

Replace the per-GPU accessors in nvkm_pci_func with region info, and use
it when initialising GspSystemInfo.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  5 ++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |  5 ++--
 .../gpu/drm/nouveau/nvkm/subdev/pci/base.c    | 10 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c |  5 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c |  5 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c |  5 ++--
 .../gpu/drm/nouveau/nvkm/subdev/pci/gf100.c   |  5 ++--
 .../gpu/drm/nouveau/nvkm/subdev/pci/gf106.c   |  5 ++--
 .../gpu/drm/nouveau/nvkm/subdev/pci/gk104.c   |  5 ++--
 .../gpu/drm/nouveau/nvkm/subdev/pci/gp100.c   |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv04.c    | 25 +------------------
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv40.c    | 25 +------------------
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv46.c    |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c    |  4 +--
 .../gpu/drm/nouveau/nvkm/subdev/pci/priv.h    | 11 ++++----
 15 files changed, 33 insertions(+), 90 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 2f2e9acd6a2a..c553c415d7b0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -24,6 +24,7 @@
 #include "priv.h"
 
 #include <core/pci.h>
+#include <subdev/pci/priv.h>
 #include <subdev/timer.h>
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
@@ -906,8 +907,8 @@ r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 	info->gpuPhysInstAddr = device->func->resource_addr(device, 3);
 	info->nvDomainBusDeviceFunc = pci_dev_id(pdev->pdev);
 	info->maxUserVa = TASK_SIZE;
-	info->pciConfigMirrorBase = 0x088000;
-	info->pciConfigMirrorSize = 0x001000;
+	info->pciConfigMirrorBase = device->pci->func->cfg.addr;
+	info->pciConfigMirrorSize = device->pci->func->cfg.size;
 	r535_gsp_acpi_info(gsp, &info->acpiMethodData);
 
 	return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
index 2459583af0d3..18be95f429c2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -29,6 +29,7 @@
 #include "nvrm/msgfn.h"
 
 #include <core/pci.h>
+#include <subdev/pci/priv.h>
 
 static u32
 r570_gsp_sr_data_size(struct nvkm_gsp *gsp)
@@ -174,8 +175,8 @@ r570_gsp_set_system_info(struct nvkm_gsp *gsp)
 	info->gpuPhysInstAddr = device->func->resource_addr(device, 3);
 	info->nvDomainBusDeviceFunc = pci_dev_id(pdev);
 	info->maxUserVa = TASK_SIZE;
-	info->pciConfigMirrorBase = 0x088000;
-	info->pciConfigMirrorSize = 0x001000;
+	info->pciConfigMirrorBase = device->pci->func->cfg.addr;
+	info->pciConfigMirrorSize = device->pci->func->cfg.size;
 	info->PCIDeviceID = (pdev->device << 16) | pdev->vendor;
 	info->PCISubDeviceID = (pdev->subsystem_device << 16) | pdev->subsystem_vendor;
 	info->PCIRevisionID = pdev->revision;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
index 5a0de45d36ce..6867934256a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/base.c
@@ -39,26 +39,26 @@ nvkm_pci_msi_rearm(struct nvkm_device *device)
 u32
 nvkm_pci_rd32(struct nvkm_pci *pci, u16 addr)
 {
-	return pci->func->rd32(pci, addr);
+	return nvkm_rd32(pci->subdev.device, pci->func->cfg.addr + addr);
 }
 
 void
 nvkm_pci_wr08(struct nvkm_pci *pci, u16 addr, u8 data)
 {
-	pci->func->wr08(pci, addr, data);
+	nvkm_wr08(pci->subdev.device, pci->func->cfg.addr + addr, data);
 }
 
 void
 nvkm_pci_wr32(struct nvkm_pci *pci, u16 addr, u32 data)
 {
-	pci->func->wr32(pci, addr, data);
+	nvkm_wr32(pci->subdev.device, pci->func->cfg.addr + addr, data);
 }
 
 u32
 nvkm_pci_mask(struct nvkm_pci *pci, u16 addr, u32 mask, u32 value)
 {
-	u32 data = pci->func->rd32(pci, addr);
-	pci->func->wr32(pci, addr, (data & ~mask) | value);
+	u32 data = nvkm_pci_rd32(pci, addr);
+	nvkm_pci_wr32(pci, addr, (data & ~mask) | value);
 	return data;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c
index 5b29aacedef3..5308f6539a3f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g84.c
@@ -132,10 +132,9 @@ g84_pcie_init(struct nvkm_pci *pci)
 
 static const struct nvkm_pci_func
 g84_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
 	.init = g84_pci_init,
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
 	.msi_rearm = nv46_pci_msi_rearm,
 
 	.pcie.init = g84_pcie_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c
index a9e0674009c6..8ae7aa02e675 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g92.c
@@ -33,10 +33,9 @@ g92_pcie_version_supported(struct nvkm_pci *pci)
 
 static const struct nvkm_pci_func
 g92_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
 	.init = g84_pci_init,
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
 	.msi_rearm = nv46_pci_msi_rearm,
 
 	.pcie.init = g84_pcie_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c
index 7bacd0693283..df745d0690ca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/g94.c
@@ -25,10 +25,9 @@
 
 static const struct nvkm_pci_func
 g94_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
 	.init = g84_pci_init,
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
 	.msi_rearm = nv40_pci_msi_rearm,
 
 	.pcie.init = g84_pcie_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c
index 099906092fe1..6ce941df87b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf100.c
@@ -78,10 +78,9 @@ gf100_pcie_set_link(struct nvkm_pci *pci, enum nvkm_pcie_speed speed, u8 width)
 
 static const struct nvkm_pci_func
 gf100_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
 	.init = g84_pci_init,
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
 	.msi_rearm = gf100_pci_msi_rearm,
 
 	.pcie.init = gf100_pcie_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c
index bcde609ba866..712ca7e0959a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gf106.c
@@ -25,10 +25,9 @@
 
 static const struct nvkm_pci_func
 gf106_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
 	.init = g84_pci_init,
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
 	.msi_rearm = nv40_pci_msi_rearm,
 
 	.pcie.init = gf100_pcie_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
index 6be87ecffc89..ec6d0a7de995 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gk104.c
@@ -204,10 +204,9 @@ gk104_pcie_set_link(struct nvkm_pci *pci, enum nvkm_pcie_speed speed, u8 width)
 
 static const struct nvkm_pci_func
 gk104_pci_func = {
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
+
 	.init = g84_pci_init,
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
 	.msi_rearm = nv40_pci_msi_rearm,
 
 	.pcie.init = gk104_pcie_init,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c
index a5fafda0014d..4204316a544f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/gp100.c
@@ -31,9 +31,7 @@ gp100_pci_msi_rearm(struct nvkm_pci *pci)
 
 static const struct nvkm_pci_func
 gp100_pci_func = {
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
 	.msi_rearm = gp100_pci_msi_rearm,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c
index 9ab64194b185..b8a3f6850fa7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv04.c
@@ -23,32 +23,9 @@
  */
 #include "priv.h"
 
-static u32
-nv04_pci_rd32(struct nvkm_pci *pci, u16 addr)
-{
-	struct nvkm_device *device = pci->subdev.device;
-	return nvkm_rd32(device, 0x001800 + addr);
-}
-
-static void
-nv04_pci_wr08(struct nvkm_pci *pci, u16 addr, u8 data)
-{
-	struct nvkm_device *device = pci->subdev.device;
-	nvkm_wr08(device, 0x001800 + addr, data);
-}
-
-static void
-nv04_pci_wr32(struct nvkm_pci *pci, u16 addr, u32 data)
-{
-	struct nvkm_device *device = pci->subdev.device;
-	nvkm_wr32(device, 0x001800 + addr, data);
-}
-
 static const struct nvkm_pci_func
 nv04_pci_func = {
-	.rd32 = nv04_pci_rd32,
-	.wr08 = nv04_pci_wr08,
-	.wr32 = nv04_pci_wr32,
+	.cfg = { .addr = 0x001800, .size = 0x1000 },
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c
index 6a3c31cf0200..1971dbbdeb2b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv40.c
@@ -23,27 +23,6 @@
  */
 #include "priv.h"
 
-u32
-nv40_pci_rd32(struct nvkm_pci *pci, u16 addr)
-{
-	struct nvkm_device *device = pci->subdev.device;
-	return nvkm_rd32(device, 0x088000 + addr);
-}
-
-void
-nv40_pci_wr08(struct nvkm_pci *pci, u16 addr, u8 data)
-{
-	struct nvkm_device *device = pci->subdev.device;
-	nvkm_wr08(device, 0x088000 + addr, data);
-}
-
-void
-nv40_pci_wr32(struct nvkm_pci *pci, u16 addr, u32 data)
-{
-	struct nvkm_device *device = pci->subdev.device;
-	nvkm_wr32(device, 0x088000 + addr, data);
-}
-
 void
 nv40_pci_msi_rearm(struct nvkm_pci *pci)
 {
@@ -52,9 +31,7 @@ nv40_pci_msi_rearm(struct nvkm_pci *pci)
 
 static const struct nvkm_pci_func
 nv40_pci_func = {
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
 	.msi_rearm = nv40_pci_msi_rearm,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c
index 9cad17f178ec..0093eabac9ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv46.c
@@ -38,9 +38,7 @@ nv46_pci_msi_rearm(struct nvkm_pci *pci)
 
 static const struct nvkm_pci_func
 nv46_pci_func = {
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
 	.msi_rearm = nv46_pci_msi_rearm,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c
index 741e34bf307c..b445081bb80e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/nv4c.c
@@ -25,9 +25,7 @@
 
 static const struct nvkm_pci_func
 nv4c_pci_func = {
-	.rd32 = nv40_pci_rd32,
-	.wr08 = nv40_pci_wr08,
-	.wr32 = nv40_pci_wr32,
+	.cfg = { .addr = 0x088000, .size = 0x1000 },
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/priv.h
index 9b7583532962..988eeee1471c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/priv.h
@@ -8,10 +8,12 @@ int nvkm_pci_new_(const struct nvkm_pci_func *, struct nvkm_device *, enum nvkm_
 		  struct nvkm_pci **);
 
 struct nvkm_pci_func {
+	struct {
+		u32 addr;
+		u16 size;
+	} cfg;
+
 	void (*init)(struct nvkm_pci *);
-	u32 (*rd32)(struct nvkm_pci *, u16 addr);
-	void (*wr08)(struct nvkm_pci *, u16 addr, u8 data);
-	void (*wr32)(struct nvkm_pci *, u16 addr, u32 data);
 	void (*msi_rearm)(struct nvkm_pci *);
 
 	struct {
@@ -27,9 +29,6 @@ struct nvkm_pci_func {
 	} pcie;
 };
 
-u32 nv40_pci_rd32(struct nvkm_pci *, u16);
-void nv40_pci_wr08(struct nvkm_pci *, u16, u8);
-void nv40_pci_wr32(struct nvkm_pci *, u16, u32);
 void nv40_pci_msi_rearm(struct nvkm_pci *);
 
 void nv46_pci_msi_rearm(struct nvkm_pci *);
-- 
2.49.0

