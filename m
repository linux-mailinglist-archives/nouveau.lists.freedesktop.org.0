Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1DABA733
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C9410EBEA;
	Sat, 17 May 2025 00:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eyARzhRf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F20910EBE9
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlFpctObikpf+J4mNdwfvKQWwodv8qGPfrKsTKE6BKbX+JSpYHcC0ui7lM4rtggX91KwAB/6vX+uUaucKXjlqPt+mpUYf18BccWOQZ4EF9iGTq+dxC+GeYfcCUyccZGEFzlyDVDlXNROWE9Her/3srj+Oewy3s2WkLFNq0F9mueci952G1lksM8+Wdem6wd2qBNrtCA/OCvBUTHnCHdUivKiMs2LTMS95esmRj255ZnPKYfyrnZS74n9h1nm34LATQIImWiQLZRSP5mMvXfqUa/OFnAMOjDMkoHjYgFIUgtWczjWDF5WdjQ+1d5LPcp5ueN+pemEZ7CrqOTWw2cDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht/fNtb+Vb4tD8KCmtzpMIcEdWoQaisZlcMeI9CH9e8=;
 b=hbsy0vPO2m6nXUznFSa+0e01Im7hW4Cp/7gz4Bhbofua8/vkEFm/UFwWSwYvOLcBH2zMCZmrdvuV2nKPg8A3chSllOmfF4zp5sP9FEh5BJ0sjV6J4DATsc1ec/8W9WupLzYHnxLOmbtm2iNGldtZ4NF/ejYe4a8Gyz4xemk33YYRwIMqZEqe7s6CAEcODxmsYMjTv+IBz6uHsHLukmv2RoNGbwFEAYrsNUAyN5SS3FYCl/mZmPH2hoW2TOh7B6WfFpVlfTo9AmmNRXZZzQrz3K3OsCaET6NcgiyCLRviqDQBp53rA8eoR7Zyb1GSRveGiN15zCrk7GNqBVcvhV2jtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht/fNtb+Vb4tD8KCmtzpMIcEdWoQaisZlcMeI9CH9e8=;
 b=eyARzhRfqALv1kXbhvhEtZUL5mtWrtays2Al3K4Jh4lTxE3/28y2rp8QuyW/kjOEoukYn5AZPidSJR3TvZP8Wu3k+LC68XXbYKEFJXn/Yk0WEJT4Yz4fQN2Ork5tJHw8XRFBkrP1fJoeVf5vriuZUNnxWPY8nIDhPC6V1Ftp5CC5BEXOLDz2Hq32xYml7uksgmc4b29LLAtvhBrzcSGhiiwB3/1n0VZWBgTvuVzHJ4a7G/ub7wQby2DIZZaqwJVT3P1zksw2SF42kYnJr1xt1aH0Ig86RHpeLnXlroF5wQ3aFmsyI6k+eeOeRw6DWi0Fel/qKTgyN13mrMTqySYKyg==
Received: from CH2PR18CA0006.namprd18.prod.outlook.com (2603:10b6:610:4f::16)
 by MW6PR12MB7085.namprd12.prod.outlook.com (2603:10b6:303:238::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:45 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::6e) by CH2PR18CA0006.outlook.office365.com
 (2603:10b6:610:4f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:33 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 58/62] drm/nouveau: add support for GB10x
Date: Sat, 17 May 2025 10:09:50 +1000
Message-ID: <20250517000954.35691-59-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|MW6PR12MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: 380b330e-8449-402f-d428-08dd94d768eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t+pUl0ss/1cCE1LfzjciDbp3/ZAzXA4E8gzzfBwoaUBJoJ9Z4Ukctl7YKFNY?=
 =?us-ascii?Q?hwudoNTokknOhBp4l+nsdePd0EfSoDTuC38LLzRTfFnsEXVUSav6ELCzj3r1?=
 =?us-ascii?Q?QM3IPfeI3s8hT7eQjjb1v8g60opPpXmnggLtmvsrq0JBfqCxnBseD0i89XnQ?=
 =?us-ascii?Q?1DUT2jTCtzJ3dOyDRNI+6jq5lLlSy3e3sl/eiTtFi1jwDiR7PpmorhaOIb6Q?=
 =?us-ascii?Q?6QI6Z/pZA5TPqis3irID3haAl68gau0LGdohytyphcP/8tGFCIQdfo0E1yhT?=
 =?us-ascii?Q?Bf4larXfRC3YlpJk48ZzsigHAHnhPXnR8h1JfF7iW8/YmUh21clNfrDrgRrx?=
 =?us-ascii?Q?4X3T6RND09JOfs6s4yA2feMIMsZ4aoUqjJDa6oTiMnQi0pK5YNMMGaECsiRm?=
 =?us-ascii?Q?634TbUFYxIr13Gqz6fGOdrdCrFstF2pPELY1eiDeFjhuQDQtF1cixhDwyeDK?=
 =?us-ascii?Q?9MY9+tS5z7ODl1ttdpcnKA4AN2ryv+Mo6pRTCnzn/QjpHeiMS7InwJvw1+Qt?=
 =?us-ascii?Q?m+2E3Pte/Cpt6marXN1SsZWSFwLSmIvTvYJhENwsTSLvgaBqZjO1v9PxpJXj?=
 =?us-ascii?Q?cGfeR5kOguOArbEDkpIbwu4glfC104H9RZHSFqOfAXwJi14YaqaiX8bqwXxw?=
 =?us-ascii?Q?PvJoWtLIJDsapy/knTftLJKoHL+QIH3Qg3JmyrhZ8KzxgIPKfZZTQTvzYmUR?=
 =?us-ascii?Q?w9gATDqUtpdJVQOPKD7FFRvvcPLSW9pZQaLzAp+QPNulpHsaDGLyB1L2UcR+?=
 =?us-ascii?Q?RYhNKevEmZKZNM6aMmIQffoaLY/JCX4AoFTgcRaQQa6JKfIaW4N7dT5UJCVx?=
 =?us-ascii?Q?hOXMyOdxrY5vzA1miBBMa909jbD4uN+7PdnZkW74rzcgiSja4B1jRVJgmVGq?=
 =?us-ascii?Q?nA/NVetuytH5NLd1Uxd9BIQhHjWg6/7yC9mUhEsV0FRtSF+84mQDGUxvUmcq?=
 =?us-ascii?Q?sL/M87T2+4xsEzv3BykITxgZLi/452KPeIyKRn4NvdYUc0Dc4SEAuhQdZ5iU?=
 =?us-ascii?Q?Kf7/1YHvC2H3AyRO/4wYnunfWmV4V1TqeSBTU+GUSa3J4uy6BgI8EJLbZXpb?=
 =?us-ascii?Q?xj9evtWXYEZ7TE+AvR2zgLMH/lDya+4UErhermGx5cQTIpfa7Jwt8nLsNCNJ?=
 =?us-ascii?Q?DcR5MZWpwVgWt3lPse3R7HcWWgQTPB4tsBUpa+gwDYhFoQsJBPgYiedaoKRi?=
 =?us-ascii?Q?lJfueMGW5cH/wLIJJPKRjhgXAua4v8CkOCazYaHEa4C/1NOGrL7SenFL59++?=
 =?us-ascii?Q?DXlYOdQBrXJHUBxDAlTsS8djs+i2Nz50gP8Aj5TojL7bWlZ2YoigJT3jNyhB?=
 =?us-ascii?Q?kZGljEb62RraN8qK1BYy29PBuuA61ImY8OUgcOrfJicCuGo5/pYjud7+CdEU?=
 =?us-ascii?Q?bsUtZUWlMqF2udYtaMuazG1Ualt1/N/at0Evj4grcpoUTmSJV8/mIsKPwVLR?=
 =?us-ascii?Q?OPfmDTs1zyDT/dDnl6n3vrDcyME13iSVvSPpuR7e5hcQLR2S8epSQ3DELNyv?=
 =?us-ascii?Q?DoSnarxidl9suh68EAzc588ucHoyabVIM/RT?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:45.4040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380b330e-8449-402f-d428-08dd94d768eb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7085
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

This commit enables basic support for the GB100/GB102 Blackwell GPUs.

Beyond HW class ID plumbing there's very little change here vs GH100.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../include/nvhw/ref/gb100/dev_hshub_base.h   | 28 +++++++++++++++
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |  9 +++++
 .../drm/nouveau/include/nvkm/core/device.h    |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fsp.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 33 ++++++++---------
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 33 +++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/gb100.c    | 34 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c   | 24 +++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fsp/priv.h    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c   | 35 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c   | 17 +++++----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c    | 27 ++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  | 16 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 ++
 27 files changed, 257 insertions(+), 23 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb100/dev_hshub_base.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gb100/dev_hshub_base.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb100/dev_hshub_base.h
new file mode 100644
index 000000000000..c9d74bd95e0b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb100/dev_hshub_base.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gb100_dev_hshub_base_h__
+#define __gb100_dev_hshub_base_h__
+
+#define NV_PFB_HSHUB0      0x00870fff:0x00870000
+
+#define NV_PFB_HSHUB                                   0x00000FFF:0x00000000 /* RW--D */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO              0x00000E50 /* RW-4R */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR                31:0 /* RWIVF */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR_INIT     0x00000000 /* RWI-V */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR_MASK     0xFFFFFF00 /* ----V */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI              0x00000E54 /* RW-4R */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR                31:0 /* RWIVF */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_INIT     0x00000000 /* RWI-V */
+#define NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_MASK     0x000FFFFF /* ----V */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO           0x000006C0 /* RW-4R */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR             31:0 /* RWIVF */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR_INIT  0x00000000 /* RWI-V */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR_MASK  0xFFFFFF00 /* ----V */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI           0x000006C4 /* RW-4R */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR             31:0 /* RWIVF */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_INIT  0x00000000 /* RWI-V */
+#define NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_MASK  0x000FFFFF /* ----V */
+
+#endif // __gb100_dev_hshub_base_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index 60a52ef52071..ea8267e0d8da 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -30,6 +30,7 @@ struct nv_device_info_v0 {
 #define NV_DEVICE_INFO_V0_AMPERE                                           0x0d
 #define NV_DEVICE_INFO_V0_ADA                                              0x0e
 #define NV_DEVICE_INFO_V0_HOPPER                                           0x0f
+#define NV_DEVICE_INFO_V0_BLACKWELL                                        0x10
 	__u8  family;
 	__u8  pad06[2];
 	__u64 ram_size;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 83acf367a65c..606483fc850b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -57,6 +57,7 @@
 
 #define KEPLER_INLINE_TO_MEMORY_A                                    0x0000a040
 #define KEPLER_INLINE_TO_MEMORY_B                                    0x0000a140
+#define BLACKWELL_INLINE_TO_MEMORY_A                                 0x0000cd40
 
 #define NV04_DISP                                     /* cl0046.h */ 0x00000046
 
@@ -87,6 +88,7 @@
 #define AMPERE_CHANNEL_GPFIFO_A                       /* if0020.h */ 0x0000c56f
 #define AMPERE_CHANNEL_GPFIFO_B                       /* if0020.h */ 0x0000c76f
 #define HOPPER_CHANNEL_GPFIFO_A                                      0x0000c86f
+#define BLACKWELL_CHANNEL_GPFIFO_A                                   0x0000c96f
 
 #define NV50_DISP                                     /* if0010.h */ 0x00005070
 #define G82_DISP                                      /* if0010.h */ 0x00008270
@@ -198,6 +200,8 @@
 
 #define HOPPER_A                                                     0x0000cb97
 
+#define BLACKWELL_A                                                  0x0000cd97
+
 #define NV74_BSP                                                     0x000074b0
 
 #define NVB8B0_VIDEO_DECODER                                         0x0000b8b0
@@ -205,6 +209,7 @@
 #define NVC6B0_VIDEO_DECODER                                         0x0000c6b0
 #define NVC7B0_VIDEO_DECODER                                         0x0000c7b0
 #define NVC9B0_VIDEO_DECODER                                         0x0000c9b0
+#define NVCDB0_VIDEO_DECODER                                         0x0000cdb0
 
 #define GT212_MSVLD                                                  0x000085b1
 #define IGT21A_MSVLD                                                 0x000086b1
@@ -234,6 +239,7 @@
 #define AMPERE_DMA_COPY_A                                            0x0000c6b5
 #define AMPERE_DMA_COPY_B                                            0x0000c7b5
 #define HOPPER_DMA_COPY_A                                            0x0000c8b5
+#define BLACKWELL_DMA_COPY_A                                         0x0000c9b5
 
 #define NVC4B7_VIDEO_ENCODER                                         0x0000c4b7
 #define NVC7B7_VIDEO_ENCODER                                         0x0000c7b7
@@ -257,15 +263,18 @@
 #define AMPERE_COMPUTE_B                                             0x0000c7c0
 #define ADA_COMPUTE_A                                                0x0000c9c0
 #define HOPPER_COMPUTE_A                                             0x0000cbc0
+#define BLACKWELL_COMPUTE_A                                          0x0000cdc0
 
 #define NV74_CIPHER                                                  0x000074c1
 
 #define NVB8D1_VIDEO_NVJPG                                           0x0000b8d1
 #define NVC4D1_VIDEO_NVJPG                                           0x0000c4d1
 #define NVC9D1_VIDEO_NVJPG                                           0x0000c9d1
+#define NVCDD1_VIDEO_NVJPG                                           0x0000cdd1
 
 #define NVB8FA_VIDEO_OFA                                             0x0000b8fa
 #define NVC6FA_VIDEO_OFA                                             0x0000c6fa
 #define NVC7FA_VIDEO_OFA                                             0x0000c7fa
 #define NVC9FA_VIDEO_OFA                                             0x0000c9fa
+#define NVCDFA_VIDEO_OFA                                             0x0000cdfa
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 926542350abc..0664195e5684 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -48,6 +48,7 @@ struct nvkm_device {
 		GA100    = 0x170,
 		GH100    = 0x180,
 		AD100    = 0x190,
+		GB10x    = 0x1a0,
 	} card_type;
 	u32 chipset;
 	u8  chiprev;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index c114903ce388..7bd73f9f749b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -103,6 +103,7 @@ int tu102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int ga100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int ga102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int gh100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
+int gb100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 
 #include <subdev/bios.h>
 #include <subdev/bios/ramcfg.h>
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
index 2a8c1d5a65f9..7122f814e4d0 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
@@ -19,4 +19,5 @@ int nvkm_fsp_boot_gsp_fmc(struct nvkm_fsp *, u64 args_addr, u32 rsvd_size, bool
 			  u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig);
 
 int gh100_fsp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
+int gb100_fsp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 8f611b2503b7..c5982fd74725 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -492,4 +492,5 @@ int ga100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_
 int ga102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int gh100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ad102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
+int gb100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a32a50f41a43..1a9a74c26e8e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1000,6 +1000,7 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 			    struct ttm_resource *, struct ttm_resource *);
 		int (*init)(struct nouveau_channel *, u32 handle);
 	} _methods[] = {
+		{  "COPY", 4, 0xc9b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "COPY", 4, 0xc8b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "COPY", 4, 0xc7b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "GRCE", 0, 0xc7b5, nve0_bo_move_copy, nvc0_bo_move_init },
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 2a775d908e24..726de0aa0fcf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -249,22 +249,23 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
 	const struct nvif_mclass hosts[] = {
-		{  HOPPER_CHANNEL_GPFIFO_A, 0 },
-		{  AMPERE_CHANNEL_GPFIFO_B, 0 },
-		{  AMPERE_CHANNEL_GPFIFO_A, 0 },
-		{  TURING_CHANNEL_GPFIFO_A, 0 },
-		{   VOLTA_CHANNEL_GPFIFO_A, 0 },
-		{  PASCAL_CHANNEL_GPFIFO_A, 0 },
-		{ MAXWELL_CHANNEL_GPFIFO_A, 0 },
-		{  KEPLER_CHANNEL_GPFIFO_B, 0 },
-		{  KEPLER_CHANNEL_GPFIFO_A, 0 },
-		{   FERMI_CHANNEL_GPFIFO  , 0 },
-		{     G82_CHANNEL_GPFIFO  , 0 },
-		{    NV50_CHANNEL_GPFIFO  , 0 },
-		{    NV40_CHANNEL_DMA     , 0 },
-		{    NV17_CHANNEL_DMA     , 0 },
-		{    NV10_CHANNEL_DMA     , 0 },
-		{    NV03_CHANNEL_DMA     , 0 },
+		{ BLACKWELL_CHANNEL_GPFIFO_A, 0 },
+		{    HOPPER_CHANNEL_GPFIFO_A, 0 },
+		{    AMPERE_CHANNEL_GPFIFO_B, 0 },
+		{    AMPERE_CHANNEL_GPFIFO_A, 0 },
+		{    TURING_CHANNEL_GPFIFO_A, 0 },
+		{     VOLTA_CHANNEL_GPFIFO_A, 0 },
+		{    PASCAL_CHANNEL_GPFIFO_A, 0 },
+		{   MAXWELL_CHANNEL_GPFIFO_A, 0 },
+		{    KEPLER_CHANNEL_GPFIFO_B, 0 },
+		{    KEPLER_CHANNEL_GPFIFO_A, 0 },
+		{     FERMI_CHANNEL_GPFIFO  , 0 },
+		{       G82_CHANNEL_GPFIFO  , 0 },
+		{      NV50_CHANNEL_GPFIFO  , 0 },
+		{      NV40_CHANNEL_DMA     , 0 },
+		{      NV17_CHANNEL_DMA     , 0 },
+		{      NV10_CHANNEL_DMA     , 0 },
+		{      NV03_CHANNEL_DMA     , 0 },
 		{}
 	};
 	DEFINE_RAW_FLEX(struct nvif_chan_v0, args, name, TASK_COMM_LEN + 16);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5b6bb4c2f78b..0be604af5b29 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -510,6 +510,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		case AMPERE_CHANNEL_GPFIFO_A:
 		case AMPERE_CHANNEL_GPFIFO_B:
 		case HOPPER_CHANNEL_GPFIFO_A:
+		case BLACKWELL_CHANNEL_GPFIFO_A:
 			ret = gv100_fence_create(drm);
 			break;
 		default:
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 5082fe5f1966..f6f23cbc7a73 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2802,6 +2802,36 @@ nv197_chipset = {
 	.sec2     = { 0x00000001, ga102_sec2_new },
 };
 
+static const struct nvkm_device_chip
+nv1a0_chipset = {
+	.name = "GB100",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb100_fb_new },
+	.fsp      = { 0x00000001, gb100_fsp_new },
+	.gsp      = { 0x00000001, gb100_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
+static const struct nvkm_device_chip
+nv1a2_chipset = {
+	.name = "GB102",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb100_fb_new },
+	.fsp      = { 0x00000001, gb100_fsp_new },
+	.gsp      = { 0x00000001, gb100_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
 struct nvkm_subdev *
 nvkm_device_subdev(struct nvkm_device *device, int type, int inst)
 {
@@ -3119,6 +3149,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x170: device->card_type = GA100; break;
 		case 0x180: device->card_type = GH100; break;
 		case 0x190: device->card_type = AD100; break;
+		case 0x1a0: device->card_type = GB10x; break;
 		default:
 			break;
 		}
@@ -3227,6 +3258,8 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x194: device->chip = &nv194_chipset; break;
 	case 0x196: device->chip = &nv196_chipset; break;
 	case 0x197: device->chip = &nv197_chipset; break;
+	case 0x1a0: device->chip = &nv1a0_chipset; break;
+	case 0x1a2: device->chip = &nv1a2_chipset; break;
 	default:
 		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
 			switch (device->chipset) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 57c2678022b5..07f45cc16210 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -149,6 +149,7 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 	case GA100: args->v0.family = NV_DEVICE_INFO_V0_AMPERE; break;
 	case AD100: args->v0.family = NV_DEVICE_INFO_V0_ADA; break;
 	case GH100: args->v0.family = NV_DEVICE_INFO_V0_HOPPER; break;
+	case GB10x: args->v0.family = NV_DEVICE_INFO_V0_BLACKWELL; break;
 	default:
 		args->v0.family = 0;
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index f13312934131..b438a57f2efc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -36,6 +36,7 @@ nvkm-y += nvkm/subdev/fb/tu102.o
 nvkm-y += nvkm/subdev/fb/ga100.o
 nvkm-y += nvkm/subdev/fb/ga102.o
 nvkm-y += nvkm/subdev/fb/gh100.o
+nvkm-y += nvkm/subdev/fb/gb100.o
 
 nvkm-y += nvkm/subdev/fb/r535.o
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
new file mode 100644
index 000000000000..1c78c8853617
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gb100/dev_hshub_base.h>
+
+static void
+gb100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
+{
+	const u32 addr_hi = upper_32_bits(fb->sysmem.flush_page_addr);
+	const u32 addr_lo = lower_32_bits(fb->sysmem.flush_page_addr);
+	const u32 hshub = DRF_LO(NV_PFB_HSHUB0);
+	struct nvkm_device *device = fb->subdev.device;
+
+	nvkm_wr32(device, hshub + NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI, addr_hi);
+	nvkm_wr32(device, hshub + NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO, addr_lo);
+	nvkm_wr32(device, hshub + NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI, addr_hi);
+	nvkm_wr32(device, hshub + NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO, addr_lo);
+}
+
+static const struct nvkm_fb_func
+gb100_fb = {
+	.sysmem.flush_page_init = gb100_fb_sysmem_flush_page_init,
+	.vidmem.size = ga102_fb_vidmem_size,
+};
+
+int
+gb100_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
+{
+	return r535_fb_new(&gb100_fb, device, type, inst, pfb);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
index ff04992b181d..337772acdddc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
@@ -4,3 +4,4 @@
 
 nvkm-y += nvkm/subdev/fsp/base.o
 nvkm-y += nvkm/subdev/fsp/gh100.o
+nvkm-y += nvkm/subdev/fsp/gb100.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c
new file mode 100644
index 000000000000..e06636bf54b6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+static const struct nvkm_fsp_func
+gb100_fsp = {
+	.wait_secure_boot = gh100_fsp_wait_secure_boot,
+	.cot = {
+		.version = 2,
+		.size_hash = 48,
+		.size_pkey = 97,
+		.size_sig = 96,
+		.boot_gsp_fmc = gh100_fsp_boot_gsp_fmc,
+	},
+};
+
+int
+gb100_fsp_new(struct nvkm_device *device,
+	      enum nvkm_subdev_type type, int inst, struct nvkm_fsp **pfsp)
+{
+	return nvkm_fsp_new_(&gb100_fsp, device, type, inst, pfsp);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
index 9f4285af3fed..2815be4bf5de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
@@ -237,7 +237,7 @@ gh100_fsp_boot_gsp_fmc(struct nvkm_fsp *fsp, u64 args_addr, u32 rsvd_size, bool
 	return gh100_fsp_send_sync(fsp, NVDM_TYPE_COT, (const u8 *)&msg, sizeof(msg));
 }
 
-static int
+int
 gh100_fsp_wait_secure_boot(struct nvkm_fsp *fsp)
 {
 	struct nvkm_device *device = fsp->subdev.device;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
index 91517f3dedfb..f0b2c605c33d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/priv.h
@@ -23,6 +23,7 @@ struct nvkm_fsp_func {
 int nvkm_fsp_new_(const struct nvkm_fsp_func *,
 		  struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
 
+int gh100_fsp_wait_secure_boot(struct nvkm_fsp *);
 int gh100_fsp_boot_gsp_fmc(struct nvkm_fsp *, u64 args_addr, u32 rsvd_size, bool resume,
 			   u64 img_addr, const u8 *hash, const u8 *pkey, const u8 *sig);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
index 3c6c1309c4b4..4aebea4f6a64 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
@@ -9,5 +9,6 @@ nvkm-y += nvkm/subdev/gsp/ga100.o
 nvkm-y += nvkm/subdev/gsp/ga102.o
 nvkm-y += nvkm/subdev/gsp/gh100.o
 nvkm-y += nvkm/subdev/gsp/ad102.o
+nvkm-y += nvkm/subdev/gsp/gb100.o
 
 include $(src)/nvkm/subdev/gsp/rm/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
new file mode 100644
index 000000000000..12a3f2c1ed82
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+static const struct nvkm_gsp_func
+gb100_gsp = {
+	.flcn = &ga102_gsp_flcn,
+
+	.sig_section = ".fwsignature_gb10x",
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = gh100_gsp_oneinit,
+	.init = gh100_gsp_init,
+	.fini = gh100_gsp_fini,
+
+	.rm.gpu = &gb10x_gpu,
+};
+
+static struct nvkm_gsp_fwif
+gb100_gsps[] = {
+	{ 0, gh100_gsp_load, &gb100_gsp, &r570_rm_gb10x, "570.144", true },
+	{}
+};
+
+int
+gb100_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_gsp **pgsp)
+{
+	return nvkm_gsp_new_(gb100_gsps, device, type, inst, pgsp);
+}
+
+NVKM_GSP_FIRMWARE_FMC(gb100, 570.144);
+NVKM_GSP_FIRMWARE_FMC(gb102, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
index 3ad71696c111..ce31e8248807 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
@@ -16,7 +16,7 @@
 #include <nvhw/ref/gh100/dev_falcon_v4.h>
 #include <nvhw/ref/gh100/dev_riscv_pri.h>
 
-static int
+int
 gh100_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
 	struct nvkm_falcon *falcon = &gsp->falcon;
@@ -65,7 +65,7 @@ gh100_gsp_lockdown_released(struct nvkm_gsp *gsp, u32 *mbox0)
 	return !NVVAL_GET(data, NV_PFALCON, FALCON_HWCFG2, RISCV_BR_PRIV_LOCKDOWN);
 }
 
-static int
+int
 gh100_gsp_init(struct nvkm_gsp *gsp)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
@@ -74,6 +74,7 @@ gh100_gsp_init(struct nvkm_gsp *gsp)
 	struct nvkm_gsp_mem *meta;
 	GSP_FMC_BOOT_PARAMS *args;
 	int ret, time = 4000;
+	u32 rsvd_size;
 	u32 mbox0;
 
 	if (!resume) {
@@ -97,7 +98,11 @@ gh100_gsp_init(struct nvkm_gsp *gsp)
 	args->gspRmParams.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM;
 	args->gspRmParams.bootArgsOffset = gsp->libos.addr;
 
-	ret = nvkm_fsp_boot_gsp_fmc(device->fsp, gsp->fmc.args.addr, gsp->fb.heap.size, resume,
+	rsvd_size = gsp->fb.heap.size;
+	if (gsp->rm->wpr->rsvd_size_pmu)
+		rsvd_size = ALIGN(rsvd_size + gsp->rm->wpr->rsvd_size_pmu, 0x200000);
+
+	ret = nvkm_fsp_boot_gsp_fmc(device->fsp, gsp->fmc.args.addr, rsvd_size, resume,
 				    gsp->fmc.fw.addr, gsp->fmc.hash, gsp->fmc.pkey, gsp->fmc.sig);
 	if (ret)
 		return ret;
@@ -157,7 +162,7 @@ gh100_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 	meta->gspFwHeapSize = tu102_gsp_wpr_heap_size(gsp);
 	meta->frtsSize = 0x100000;
 	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
-	meta->pmuReservedSize = 0;
+	meta->pmuReservedSize = gsp->rm->wpr->rsvd_size_pmu;
 	return 0;
 }
 
@@ -254,7 +259,7 @@ elf_section(const void *elf, const char *name, unsigned int *len)
 	return NULL;
 }
 
-static int
+int
 gh100_gsp_oneinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
@@ -319,7 +324,7 @@ gh100_gsp = {
 	.rm.gpu = &gh100_gpu,
 };
 
-static int
+int
 gh100_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 {
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 86ec580ba936..4f14e85fc69e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -26,6 +26,8 @@ int gv100_gsp_nofw(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
 int tu102_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
 int tu102_gsp_load_rm(struct nvkm_gsp *, const struct nvkm_gsp_fwif *);
 
+int gh100_gsp_load(struct nvkm_gsp *, int, const struct nvkm_gsp_fwif *);
+
 #define NVKM_GSP_FIRMWARE_BOOTER(chip,vers)                      \
 MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_load-"#vers".bin");   \
 MODULE_FIRMWARE("nvidia/"#chip"/gsp/booter_unload-"#vers".bin"); \
@@ -75,6 +77,10 @@ int ga102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware
 			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
 int ga102_gsp_reset(struct nvkm_gsp *);
 
+int gh100_gsp_oneinit(struct nvkm_gsp *);
+int gh100_gsp_init(struct nvkm_gsp *);
+int gh100_gsp_fini(struct nvkm_gsp *, bool suspend);
+
 void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index 2a71868d6710..2efef4b694d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -12,6 +12,7 @@ nvkm-y += nvkm/subdev/gsp/rm/ga100.o
 nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
 nvkm-y += nvkm/subdev/gsp/rm/gh100.o
+nvkm-y += nvkm/subdev/gsp/rm/gb10x.o
 
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
 include $(src)/nvkm/subdev/gsp/rm/r570/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
new file mode 100644
index 000000000000..3a296d8fd2e0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+#include <nvif/class.h>
+
+const struct nvkm_rm_gpu
+gb10x_gpu = {
+	.usermode.class = HOPPER_USERMODE_A,
+
+	.fifo.chan = {
+		.class = BLACKWELL_CHANNEL_GPFIFO_A,
+	},
+
+	.ce.class = BLACKWELL_DMA_COPY_A,
+	.gr.class = {
+		.i2m = BLACKWELL_INLINE_TO_MEMORY_A,
+		.twod = FERMI_TWOD_A,
+		.threed = BLACKWELL_A,
+		.compute = BLACKWELL_COMPUTE_A,
+	},
+	.nvdec.class = NVCDB0_VIDEO_DECODER,
+	.nvjpg.class = NVCDD1_VIDEO_NVJPG,
+	.ofa.class = NVCDFA_VIDEO_OFA,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 443753f3369a..e84376c85e99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -63,4 +63,5 @@ extern const struct nvkm_rm_gpu ga100_gpu;
 extern const struct nvkm_rm_gpu ga1xx_gpu;
 extern const struct nvkm_rm_gpu ad10x_gpu;
 extern const struct nvkm_rm_gpu gh100_gpu;
+extern const struct nvkm_rm_gpu gb10x_gpu;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
index 8a641e5a5b92..7e5b411fa543 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
@@ -29,6 +29,16 @@ r570_wpr_libos3_gh100 = {
 	.offset_set_by_acr = true,
 };
 
+static const struct nvkm_rm_wpr
+r570_wpr_libos3_gb10x = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+	.heap_size_non_wpr = 0x200000,
+	.rsvd_size_pmu = ALIGN(0x0800000 + 0x1000000 + 0x0001000, 0x20000),
+	.offset_set_by_acr = true,
+};
+
 static const struct nvkm_rm_api
 r570_api = {
 	.gsp = &r570_gsp,
@@ -65,3 +75,9 @@ r570_rm_gh100 = {
 	.wpr = &r570_wpr_libos3_gh100,
 	.api = &r570_api,
 };
+
+const struct nvkm_rm_impl
+r570_rm_gb10x = {
+	.wpr = &r570_wpr_libos3_gb10x,
+	.api = &r570_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 626ebce39be5..2e9bd74d39be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -26,6 +26,7 @@ struct nvkm_rm_wpr {
 	u32 base_size;
 	u64 heap_size_min;
 	u32 heap_size_non_wpr;
+	u32 rsvd_size_pmu;
 	bool offset_set_by_acr;
 };
 
@@ -176,6 +177,7 @@ extern const struct nvkm_rm_api_engine r535_ofa;
 extern const struct nvkm_rm_impl r570_rm_tu102;
 extern const struct nvkm_rm_impl r570_rm_ga102;
 extern const struct nvkm_rm_impl r570_rm_gh100;
+extern const struct nvkm_rm_impl r570_rm_gb10x;
 extern const struct nvkm_rm_api_gsp r570_gsp;
 extern const struct nvkm_rm_api_client r570_client;
 extern const struct nvkm_rm_api_fbsr r570_fbsr;
-- 
2.49.0

