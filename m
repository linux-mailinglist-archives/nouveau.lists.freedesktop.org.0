Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BBCABA72C
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B88E10EBE0;
	Sat, 17 May 2025 00:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mfdm3CO+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D09210EBDD
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rNmD8gUuiKopKJucCckVNUi6T4lX5/XBf1DB7oMbw47YOqFKXe4MHn6Kkh3OmIno2LMNz84tjk2jUWhui2+gMt8kVI95/FV5/Ve2hPF+sigwZ2zLn4i+ZebKywD5Kh9SObCLcfsaDaJgm7gwECaCnIulGeqkwWET6hmqd18U5E02PKVFkCGMKK32C/0AX6JrHrJ3U6fv/8sxFPBVHqQ7FbdovuxNQU2bqIsR+CSYaaZ6UO2ZrszJlVe5aNFwS/rGYpu34g2cpe5CHogTl/F4/MFk9eHx2yohxDYtd8fDU2e7gkGBlX8UbCsHf/DX987KkY+KO8dTI5YYMJNHcw+lNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCUrUPIFMaETgPmxt/bwRc988EF1s3MNaN8sncs8nik=;
 b=ptRAhQad8mCerxl42/4V/m+3YszCtmsST+OmViVQMGbTSWWqQdMBwMV1P2djvyOBIn9AmWGVk9SXMEM814d6lBKe+pcZOpt+jyrolHOrVhUsUUqQ2hytpWHnJDbJnnTo39fa3gCeXdAcx1LJuHU9zn/i31XZU0ypnc6e8/rvWpwBZAr0sWh0AzOTbh483Apns0Sp5QKL5NGNe4y7lCGbL911xcOC30UGdHQCZGh41vKATIW1pyOGhBXyww7dmd9BZH7qQXhYFaWM2kZ+8zio2yRn6J9OOTdr5Bmq9uYA5dhO6zTM6iD/w0WziOH/tzx6xZ7NatuUMAFBVkN8z0SjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCUrUPIFMaETgPmxt/bwRc988EF1s3MNaN8sncs8nik=;
 b=mfdm3CO+Rdk4ouPXKcSj4+If1kMhJwz315y49v7WJeY7Ss7Vw6lHFg6ttOCKk/51GngtXVsZMvJfl+W4Uxm9WZez4mG4dRUhzg653VgjKquEA16FETemjZOfxHIkmeMSZCYuT3QqRUvPXCeksMrcvdCVB37CanYWrsUZSnFiOqDbOP5vTybLgqc0yKPuVdwSz9YSvywSgIMh8dUgUBuak9Orgmfm8DRn9VLbSQrvAJigTZpfvvQ38cATYIs6cjk1CJIyERWIBoPtvLmV4MLvrLT8IT0II3lElva5Fvbjf8kKRdqMkqbCp3S0/fSSo7TjlfgBa3Kq0I+ReXD9frqUYA==
Received: from BY3PR03CA0008.namprd03.prod.outlook.com (2603:10b6:a03:39a::13)
 by BN3PR12MB9571.namprd12.prod.outlook.com (2603:10b6:408:2ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:11:31 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:a03:39a:cafe::da) by BY3PR03CA0008.outlook.office365.com
 (2603:10b6:a03:39a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.30 via Frontend Transport; Sat,
 17 May 2025 00:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:16 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 46/62] drm/nouveau/pci: add PRI address of config space
 mirror to nvkm_pci_func
Date: Sat, 17 May 2025 10:09:38 +1000
Message-ID: <20250517000954.35691-47-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|BN3PR12MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: 423a0f29-29ae-476d-ad21-08dd94d75fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J/csExTw/awt+k8QrHFVTZaIIuzhSLhl2gQCCaBWPBUSc7C9ix9PEKT2Cyi2?=
 =?us-ascii?Q?BLjzgYQ3LgkF8flTo8Dofhp+x5P2ebfBWryNuit011qe/17N0pKk1Sp83jxs?=
 =?us-ascii?Q?tJm4vQuxJQpepAHW6VbPP5M3FXp7elL6ca06RCReBQ4gD5bUoptkgdYfed8E?=
 =?us-ascii?Q?07hDpxanr6muCcw5vNapsUtuoC9IwMwwC3ihpYyATRATv+hzC7u7BJnsizDS?=
 =?us-ascii?Q?4QauvnVI99lrSgcd5jfYvg/bJbJlv1umemTHpvENsjcyRbRLRLnul9yBnqOb?=
 =?us-ascii?Q?/mE3tzb9zsBYvJTtXUU6pG1F9c5F4ffUV8eLsdMeLa6FWUXhIRqe8fNToJ/m?=
 =?us-ascii?Q?5a5qzzHKDiRXZ2q14SfBdq56NGLF6qSmE6yE0VfnXzqUsP8v9/ImIUTZiZsn?=
 =?us-ascii?Q?RQ5zYBw+om2czMLOndRzM208hmu/+HdbB9iTt25kSHF0ovLZGlef7C6bdjma?=
 =?us-ascii?Q?s8VdeSzHYDe42N4thd+f26O0uk1V/0O/C+2uZ6hVjBTFCNP30yZync/LUQmE?=
 =?us-ascii?Q?ZYQil+yJE75dAE79t5oHelGDADvwrDx3KSucSKwxFG4cRM8OBt63Gfm4uXNj?=
 =?us-ascii?Q?tW/NBBRpyP1x2/NY32W3h9QUeOcSvERDRCbiBTfBGEA5svXUeyuoyKTiKcJJ?=
 =?us-ascii?Q?bsMfqTYAFWrP/rOsY6NV1QkeSfI0i0Xa9zCzw2ueDPqYJg2brRWCt2dh7oQe?=
 =?us-ascii?Q?f6MGxsmdL6sFn+iwYBMulaBwgEDOXXIWedEHuUsYRWE9b0jAxxNTGZA6cbVk?=
 =?us-ascii?Q?T4uXM7lAh2QH+ttoI/2WPq6yf7YYWrCMcAaljcaTDyG+ICC38LaDIyRhbr9/?=
 =?us-ascii?Q?/Me8GCoRsbdTVOe1GZ5WYF9fFDX3KHuPn7jXOPQ17n+eD3K9YObm1uq17xs8?=
 =?us-ascii?Q?hMZMS4SrTE0gPJAlmGKmaeIHCSnrJracFME0nGcphi0p8dSRnVblUYd/CWOK?=
 =?us-ascii?Q?grYoz7yBpPplO78QUBkTTPXZkbC3BxIS3vreuo1Msyhc54rvW+wPdd3Ha9Au?=
 =?us-ascii?Q?6YPwN7VLBCLvH7H1C97f/Lp6lnEcA0lCdUFw8zD195z765W7e4URvW0wxGlU?=
 =?us-ascii?Q?x8A9Xy+msU9EsCSpVQFkNyZp3ffMnHs7nBMqigVKGoHO5t5kanWJfs657/wH?=
 =?us-ascii?Q?Vz/gXPQ9oVXXuCU+rBqvcXi5gXjnXXUxa6Ab07R7mh6782BpJRmE8HtpNP29?=
 =?us-ascii?Q?Zb8VXiqjJCVvX4KtstmvVo0MUPT++SI7j7H5fpEVgL+EMUs5Hd95zehX+jGT?=
 =?us-ascii?Q?2kNG9fPJ47zyywqlMqTODfXyVlDFxIvjwSCT9ly/ez5obe6Us3DqHx+ObDfq?=
 =?us-ascii?Q?elYd0a8IlOLWFI4rpF+JZeiEh8w4uwW38Tn95xNhA2EXKJ6CuQ+RWMPFdo/b?=
 =?us-ascii?Q?8QFJCApNmnfHu+QR/ChmcF+sS71zR+jJP4klZpF/m33+jebvibcCyv8KFGT7?=
 =?us-ascii?Q?/NznO1n9ZO+YXQe2qPL+seErz0oqBGlZdNWqigTBaFszy/2YwPhzG0hzO9nE?=
 =?us-ascii?Q?h9jXUgyqCWKvr1UqNrpCPW5hyfUcOX4oPt/i?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:30.1984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423a0f29-29ae-476d-ad21-08dd94d75fcb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9571
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
index ce3d4dd49ac8..e2171d0d25be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -24,6 +24,7 @@
 #include "priv.h"
 
 #include <core/pci.h>
+#include <subdev/pci/priv.h>
 #include <subdev/timer.h>
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
@@ -905,8 +906,8 @@ r535_gsp_set_system_info(struct nvkm_gsp *gsp)
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

