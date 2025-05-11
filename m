Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9AAB2B72
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7E310E25D;
	Sun, 11 May 2025 21:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fIQtXx1L";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6710F10E25D
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IfmpuxRTF+dQ5jjwb2iG7OGZvwk92UwrmaCEsaIcP31nUQdlFXO+wGRzoJkq49sYYQl9J1XwsHlKPZw9ET8AQd1aS+qMGUPx63MxrUo4UqN2bfMw9DEsj8cMd0JEGZ0BWHP+TBIdphipY7jZkA25ieR6x5LnxtrqZxBA1IQVHEwUIDzMdvSuXWNE8p3DPmWvP4eH3IjI6YEBNp+GjTrKhcBvYv56xaITNnMy/FMDWTmNa+8YBCaGxXSHQm9MKEz336b4mUd6tlX+Zgz549xFlwQxKkfgsmLvInpG1CgQFSW3+IveLJ8bOOeCL4NmGgmesULJ/HLfoktaVX+ZzYKrag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ce3KGArOyPrMHJGxD8yTgGyjS26TH6kQepTRYt6kf8=;
 b=p5V0CgKZeSAObIYR1EemlS33qChnYUknc+HWj0DQTgOhwRyZ9OsMIM0RGZ35k3U9xIN2lyawhrDH+wPMWjCDwdEmyNV8i5314QAJ79k7b7zvqZ/q0fBBreoRybmdbn40bBsyyy9qOunc2BWMg6mtRLHd+n2nLqjiHq9B2pH4A3bA9SUeI+WBTAu4EcXhnUUvZ4aRtZEv9C1r+Tg41gXdwUoR1pFqFrfBjywa8AHJgfPLJIjN+9PjeJd6lr2NILfSBT1+hoRd/C36Ehv8ICS1bUulJWBkyLQsifjvLSLdRe2Mwh2wlyKW5VxJT5Lp9DwziFAcj9k8va/GDj3kBvxgTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ce3KGArOyPrMHJGxD8yTgGyjS26TH6kQepTRYt6kf8=;
 b=fIQtXx1LoMi67hPrB0L5oseo53gZ+7CQVoK9G/DQXZQQ+snPTMqDKApqFiDklp/7rmPotiDLhaUSsTB5INcHjd4OzvPF1BxOwx/ZH/Jf69CiZ0c5RGJ7wDOT25fThBjTCy38+J4wideKwkLOqQB5IGGOhbl8Vf/UJajsmXtjpm0Er9tqtISpp00GWpUK59DlZGgxH/vZ3zYhCD8zFGIFdM2jsZGLveOcRfs48DSTB6j02AZWdfuVLIjOl8UO59K5tJ1Ge8aXW0pXiLCZfnKwr28x7tcQOYYx+L2siOQvLdhp8AI7bCRxjg+xmcTSH30vwrCGvGyV+GRtvGj+8Ymnpg==
Received: from DS0PR17CA0002.namprd17.prod.outlook.com (2603:10b6:8:191::25)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Sun, 11 May 2025 21:09:32 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::42) by DS0PR17CA0002.outlook.office365.com
 (2603:10b6:8:191::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sun,
 11 May 2025 21:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:21 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 46/62] drm/nouveau/pci: add PRI address of config space
 mirror to nvkm_pci_func
Date: Mon, 12 May 2025 07:07:06 +1000
Message-ID: <20250511210722.80350-47-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: de1d88ed-506a-4b88-e48e-08dd90d02039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cRw6UbORNkuLlIF3WrExie9TPZ1BDUAhrzGu//jlawYZ9qiSbPXp2ZdxAIjP?=
 =?us-ascii?Q?kuEuAO/wdhCgTWL7XCZIzyX4xleMmNIxmgzphmUwi7l/oeUiIZYDgGE4TNPQ?=
 =?us-ascii?Q?bJOYO9+uubsG1L6jpyqaVPESNM7BSEZ9sJDRki0PYdbi9wcKh/QS4EUR35LB?=
 =?us-ascii?Q?SWN3m2zzZOIpEGKxds+rm4GYTnxLWBV1A/3FA+kP3NmXBk0+BEMs+9fIFGtn?=
 =?us-ascii?Q?kw+Xy0hDZQ2OcytlhwUDln4c6qP8FeTc/SaKJA858tedZalJ5FwStxiU41ao?=
 =?us-ascii?Q?0GSGNdGF/E2/UF6BsgnndKJ1gTgLMuRY2U+/VXso030qWNFHezBJs7Umk5Lm?=
 =?us-ascii?Q?L2FyLDyBV64bhJE0u4/k9wlE1EZTZuo6S6m5zz8tSsy2NpPprctZ72577khA?=
 =?us-ascii?Q?zoaUOFWf+nHTG09JGODDGf6RtWIYaa0D+FCqLF676e9CREv7k7xUhiinoJJk?=
 =?us-ascii?Q?M1q6tpw1k63kmaIGvFF0sAVi+ypzEXQ7OjAvpqfdMmAy7hoWttyq/xgs3Jgf?=
 =?us-ascii?Q?FEzu6ZYSbTt/bBSSwQ79yzjTjBUSBGrbkkB9ENBcW2d53XturrtloO4j8bRc?=
 =?us-ascii?Q?JTTy/TX+RMZq0TT6vc5cNc3VP1sEYgyAAZ4eQNW+r2v5C39b8rY6RiXMYBSi?=
 =?us-ascii?Q?UM0gX2F9dCFASxlkXiU12Es4Wj1d5jtaCJlQiUoPxHHLCS+50DjZFTw5CSrk?=
 =?us-ascii?Q?MHg3hPeTv9+QI9VBGC95qzvK3ecn2yTVwdIZXcRXo06jB+BXNxEbCQJ0fwS9?=
 =?us-ascii?Q?JuRp0q/OOUxQ6Rgdqo5zrTXHvxlHFECFTxS73X8c9FPd+X4eduRtscE/fisF?=
 =?us-ascii?Q?tyQGoSr5hKm9TZOgrYHEN7rSkAzjvBvcFO9Y32ZfP95gkbat46QGtBbIws+8?=
 =?us-ascii?Q?qPTe1ym0RJfq6PFsVgt7WLhGjOjEbf4QrgeDSyuhBz9nSoQXGz/c3hVzQnjU?=
 =?us-ascii?Q?bXObi4qIrZNiqupVidhcCL8tMWuAWcyzMdFPn0U2M9CRrrqsvlHz/GP7MMTg?=
 =?us-ascii?Q?ZDr9e0RQCnuCTHLyy2ar/TjShjkhtpBLuCUcHlHyLLmzPNMFPY5CWipTAlmS?=
 =?us-ascii?Q?A7Vl32XnpkP41LTQK8U67jV4rkQaw+Lsa6Dd8AH1hBkRSfIgZKNHhOdaZ3RC?=
 =?us-ascii?Q?c4ICMb+M/pCOfVOex6WGC5D8/1a5KOTKJo/Tn75MUdc6aRyth9jCma4VHsc3?=
 =?us-ascii?Q?nASyAY5p6xSek1x8g0ctUmNHyhEdNlioHTUF14YafyJWTqZ/wZRlOD08lGOb?=
 =?us-ascii?Q?ZB8KAEBpKcINdYyTiwAqHlVEoKE2LCSdJN8NRZ1cRpM2VdoRuACA+5a/+eLd?=
 =?us-ascii?Q?xnD9KhnD2VRXumE/hnbZ1pjsd1taqKYoKptM0HeO6Ak7hY4LZbamNdUL/7QK?=
 =?us-ascii?Q?tN3h6CqZOwBtuh29KDWrYpwjx/C6lugPFqQ2zn35dtvJXCeckeM7MhHpoFvB?=
 =?us-ascii?Q?YtIcdBj80DNKoxWsL69xtxZemrUHaTdMc3SOpFHNEbBLT1tYV/ryW83J+JN8?=
 =?us-ascii?Q?nSEHeeCxWDfLyM2FpHXPBhDWWnRAWMKmGN7j?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:32.3716 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de1d88ed-506a-4b88-e48e-08dd90d02039
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
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
index 55795c49371f..a3c070d41923 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -12,6 +12,7 @@
 #include "nvrm/msgfn.h"
 
 #include <core/pci.h>
+#include <subdev/pci/priv.h>
 
 static u32
 r570_gsp_sr_data_size(struct nvkm_gsp *gsp)
@@ -157,8 +158,8 @@ r570_gsp_set_system_info(struct nvkm_gsp *gsp)
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

