Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E1AA3CAA
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C4410E5B5;
	Tue, 29 Apr 2025 23:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dqXC9H3a";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBA010E5B5
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVIjdiK1fMF57rbH/XrK1Dk9+qjh3nHJOjVpupsT3KdE3b8Yzka79t2afdkk8tQz09bh6231P5i+Np7Ztiag8L2TKL8C8q2ytpWkpvvDZAOM9kTfnzzBkOzQ/4sx/ZsYaEKsBZKlaj2hAYvGGLFba3XQ+bDwo+n2PuINrQqWXzu+3xrLVVRxmLsoxaqyaeEzxhfFo27kz9zUh6lf4F5yd+lvIfqg8ypnZDs/Vm22A4TsFyNqeXGq3QBDgdOXqTCNHN2IffXpCfClqjCaOCj0voRvhNcDt1b+tZV0S0hNxtc/I8XZfIhdFHA5sgye+k93SebJByGbZkvrIMWJMPZGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL4xvF9Ug5I0S/32lQ9zOWepUEXMBpy1FdOCfBAbnXA=;
 b=RHbNMlldUh9FQKSC/dr577JFCuzhtysg6fVzJxQ1pa/pe2bOr9a01EFV3ZL9+jI/4fHfIvSLHqBjcOIUlRFY2AdFpHiAup8NfSjBpa/Fu1mWqSZcKmtNjK2oA78DDpLZ2g7bQq8UrwOBfwXTysZ8m66E+FRAar4PNz+bErASg0+3vvoizlW2RjXSOxvc8MXKUtxXwxtYa9AnTi8fI1s+51Rd8P1lzrJAHzQAnvvADh4ovkWnOooFOLDoyclbwAngUgPPmXcoCvTC6sBg2FxqzydcZyEo0EZZKTe2G3ELqUERW7/8eO41D3FUcBzwH5bUtHwvMrd5qQ22mnxvwe6MIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL4xvF9Ug5I0S/32lQ9zOWepUEXMBpy1FdOCfBAbnXA=;
 b=dqXC9H3aTB8XWGEonPb0G/EnuBnv9ndDUqxrbKNqLHy7RnZv4VfP6//0WewXNsVW+FYZxTNLoSVLDT4Xvz5/sod1Lfen637z/Ual8z1bl9M3CO1C7/Sb4qhn3LiwB8P6KDLUBnbSWwFHIdE0X4nK1I+HYhVKdD/pjLi8OY+rY59PvM4pf1umnsACWgHreraejqtTNiFt8lg5tr+kgzcVnlakI/WMlmycmPA3XZU+m0WtZDB221YcIE/umK0UUNI32ICrCBcPWcXaLXSfwZgo9uzeoZK8zjg1J78SxnHUw83JJhxZAg3USmunUjyAcgoREzB+uQz/1WJ11w6yxmfknw==
Received: from PH7P221CA0035.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::15)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:41:02 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::3d) by PH7P221CA0035.outlook.office365.com
 (2603:10b6:510:33c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 23:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:41:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:47 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 56/60] drm/nouveau: add support for GB10x
Date: Wed, 30 Apr 2025 09:39:24 +1000
Message-ID: <20250429233929.24363-57-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: d96415fa-2e3d-413f-df4c-08dd87774d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RNUQkeKBh7OVYxlID9gyBgLPpCWEB9u/ue/t9YTb/G/erAmH+GlIJRfy1fyY?=
 =?us-ascii?Q?8FYaFHZz6gMEi0utITQ9GaZwpbVDjcarg2/dYjgFNn6Cz58WnW2MC0MropZp?=
 =?us-ascii?Q?Pg0ST0mq3l4qd+vB73zJI3Cx/HcgyJEx4q692/fWADF6x6X3S8EOGF4/NtAj?=
 =?us-ascii?Q?N7TIEpLdeOYUezC7XYJMwsRiTeKifZp6uFV5T6nWqDTAa6mvOBcjhcgW23Om?=
 =?us-ascii?Q?ScZx/LNupQvf2Q89RLWwuPC/jeSrn4sYdmRHOBqbNAe86gsz3TIQ6dY5q5ht?=
 =?us-ascii?Q?qKJuaACAe7NMRkeIfaTRToioyZ5nFf/XXBbsNQzxETX8JAUd/q5YE5GhlcTq?=
 =?us-ascii?Q?ECCeHWRxR9W/pgIoPNACmWAePen1cML0Ttd7TZzXV0dB7zANv1GjBLjiM6Xi?=
 =?us-ascii?Q?O/AowaaZ0WnzYu2kntcNlr5VNW9E74PF+EZFfSTkvaOAUem0Mm0vUeC5h9Hh?=
 =?us-ascii?Q?kKNm+77WABXcqVp+gF7ZmRcr6SojtzwVC02Nqxik10wcP2tMF8VawVGSiT2J?=
 =?us-ascii?Q?CrVUAMoxDCZH0LByzzglkYBm+O8a2Sd3Cw7wdnjaLvIauV8WHXEYlHvdCfOF?=
 =?us-ascii?Q?xkOoLD/1bcCf+KnajXCHAGL7Vnk7Y/Tsp5GqhVZ4yDXVAwqmzGUwGBLR0LmP?=
 =?us-ascii?Q?4ZQYmH0u+i28cKEMDoluws5Lj+XP7KdLwdPuCLFyyPN1x2NTaJFFKj5Y6bqk?=
 =?us-ascii?Q?LQ74G1ZueBuUzUUbQojYXBIHdh1TQO9EC04s1MbJ84ilt0lndNazIcTmkqpQ?=
 =?us-ascii?Q?ENOa5kr80Ws4F2feqCVR/+QO+4A0lK/VnRvfZRy4ZJvuYv6OQ2VLRQ5N1+j0?=
 =?us-ascii?Q?T3cZn0dCOHA0G398imCD+cEMC/VzqBKlux8tOFUi+xhXbNeUnaueP1ayekFD?=
 =?us-ascii?Q?RBUOF67GftLD0jRZfy2iMcLLSBKGs+VCACUgfGdtJgeAOecJvGwy1TsGcFqL?=
 =?us-ascii?Q?kIHrQkUv3HsDVSJXps26EOCaXy+DgCOs4vpyJ6gzGhzg/HeHe9yKGR8FJmaO?=
 =?us-ascii?Q?XxVhTg57hngy10ou38KMy8OgIDk3YpnwJ5RR3iAwbNl7XRyL6uInV+zJiuoR?=
 =?us-ascii?Q?K15o7VEVF1lMbSCWLtGwm6XG4NsnV5TfqPAi3+WtNVu2+XKGQ5Ozf3N2Rq1V?=
 =?us-ascii?Q?DyUAh7WV6OdDjXzyNJOW3pFPDX5sF0c6k865amHvxtqqdygylJ6+DSkRB1dS?=
 =?us-ascii?Q?ms7vk+9ADxsawSVKKHe845FYGN8pyHrxRdaVcxnfmao7yfWNcx00bPAPselI?=
 =?us-ascii?Q?8369obVv4oHGAGdz50Wm+9w5D36Mm5CT7adnNMplVzH3mutmegcnsFi4ZN2F?=
 =?us-ascii?Q?rRSHrcEA08oHXdmkvDAsYPZyiRc+FBRAlKdOgVm5rGFKqNaC55sXp+JEIiEu?=
 =?us-ascii?Q?yzBT4NHWXeect1AdbRk543Si/yBbSnqsP7AZDOuPzfgO0P1PkyQDlp53Rgr1?=
 =?us-ascii?Q?jg4KwOAPNb0V6HwM3bEA62R5BDaQX7qN7Aw8ZsajWCPExJAA3+xLgYMwXfLg?=
 =?us-ascii?Q?oFHDOF+dsFB1n0tM3vsy5KMwwAnNl1XL8cEu?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:41:01.8436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d96415fa-2e3d-413f-df4c-08dd87774d09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719
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
---
 .../include/nvhw/ref/gb100/dev_hshub_base.h   | 28 ++++++++++
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  1 +
 drivers/gpu/drm/nouveau/include/nvif/class.h  |  9 ++++
 .../drm/nouveau/include/nvkm/core/device.h    |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fsp.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 33 ++++++------
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 33 ++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/gb100.c    | 51 ++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c   | 41 +++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/fsp/priv.h    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c   | 52 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c   | 17 +++---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  6 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c    | 44 ++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  | 16 ++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 27 files changed, 325 insertions(+), 23 deletions(-)
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
index 96d6e6aab6ff..1943e60c3d11 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -30,6 +30,7 @@ struct nv_device_info_v0 {
 #define NV_DEVICE_INFO_V0_AMPERE                                           0x0d
 #define NV_DEVICE_INFO_V0_ADA                                              0x0e
 #define NV_DEVICE_INFO_V0_HOPPER                                           0x0f
+#define NV_DEVICE_INFO_V0_BLACKWELL                                        0x10
 	__u8  family;
 	__u8  gsp_rm;
 	__u8  pad07;
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
index 6c80bb9424ad..93e81344d45f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -502,4 +502,5 @@ int ga100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_
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
index a3f6b8f48266..69c8b73d6055 100644
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
index 000000000000..7c441138ce25
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
@@ -0,0 +1,51 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
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
index 000000000000..b5caf1dd6333
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb100.c
@@ -0,0 +1,41 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
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
index 2bb318ff40b2..898bd70da35e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gh100.c
@@ -254,7 +254,7 @@ gh100_fsp_boot_gsp_fmc(struct nvkm_fsp *fsp, u64 args_addr, u32 rsvd_size, bool
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
index 000000000000..87840641949e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb100.c
@@ -0,0 +1,52 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
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
index f0ac339060ba..5d0aacbdc8de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gh100.c
@@ -33,7 +33,7 @@
 #include <nvhw/ref/gh100/dev_falcon_v4.h>
 #include <nvhw/ref/gh100/dev_riscv_pri.h>
 
-static int
+int
 gh100_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
 	struct nvkm_falcon *falcon = &gsp->falcon;
@@ -82,7 +82,7 @@ gh100_gsp_lockdown_released(struct nvkm_gsp *gsp, u32 *mbox0)
 	return !NVVAL_GET(data, NV_PFALCON, FALCON_HWCFG2, RISCV_BR_PRIV_LOCKDOWN);
 }
 
-static int
+int
 gh100_gsp_init(struct nvkm_gsp *gsp)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
@@ -91,6 +91,7 @@ gh100_gsp_init(struct nvkm_gsp *gsp)
 	struct nvkm_gsp_mem *meta;
 	GSP_FMC_BOOT_PARAMS *args;
 	int ret, time = 4000;
+	u32 rsvd_size;
 	u32 mbox0;
 
 	if (!resume) {
@@ -114,7 +115,11 @@ gh100_gsp_init(struct nvkm_gsp *gsp)
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
@@ -174,7 +179,7 @@ gh100_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 	meta->gspFwHeapSize = tu102_gsp_wpr_heap_size(gsp);
 	meta->frtsSize = 0x100000;
 	meta->vgaWorkspaceSize = gsp->fb.bios.vga_workspace.size;
-	meta->pmuReservedSize = 0;
+	meta->pmuReservedSize = gsp->rm->wpr->rsvd_size_pmu;
 	return 0;
 }
 
@@ -277,7 +282,7 @@ elf_section(const void *elf, const char *name, unsigned int *len)
 	return NULL;
 }
 
-static int
+int
 gh100_gsp_oneinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
@@ -342,7 +347,7 @@ gh100_gsp = {
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
index 44a62d6ec4f7..a963bb7e0475 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -11,6 +11,7 @@ nvkm-y += nvkm/subdev/gsp/rm/ga100.o
 nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
 nvkm-y += nvkm/subdev/gsp/rm/gh100.o
+nvkm-y += nvkm/subdev/gsp/rm/gb10x.o
 
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
 include $(src)/nvkm/subdev/gsp/rm/r570/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
new file mode 100644
index 000000000000..f549daa0068d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb10x.c
@@ -0,0 +1,44 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
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
index 941656021baa..4a60776cc586 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
@@ -46,6 +46,16 @@ r570_wpr_libos3_gh100 = {
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
@@ -81,3 +91,9 @@ r570_rm_gh100 = {
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
index 1b11fb6cc2bb..dafcd2c8b3b6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -25,6 +25,7 @@ struct nvkm_rm_wpr {
 	u32 base_size;
 	u64 heap_size_min;
 	u32 heap_size_non_wpr;
+	u32 rsvd_size_pmu;
 	bool offset_set_by_acr;
 };
 
@@ -166,6 +167,7 @@ extern const struct nvkm_rm_api_engine r535_ofa;
 extern const struct nvkm_rm_impl r570_rm_tu102;
 extern const struct nvkm_rm_impl r570_rm_ga102;
 extern const struct nvkm_rm_impl r570_rm_gh100;
+extern const struct nvkm_rm_impl r570_rm_gb10x;
 extern const struct nvkm_rm_api_gsp r570_gsp;
 extern const struct nvkm_rm_api_client r570_client;
 extern const struct nvkm_rm_api_fbsr r570_fbsr;
-- 
2.49.0

