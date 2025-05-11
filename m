Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B315AAB2B77
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A11710E274;
	Sun, 11 May 2025 21:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sG64EwUT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA4C10E274
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T3s9GIrI9UZYqL5+fEX3gUuZMlliMdSvvVnLKS+FCmW0pY3aStKKswfmdlBL6sqDbNPWZvR3cLF9a3ZkkZP5maljij91iQw2vdczlIM3vsGzl4GkP4um+5QkidUS1PwFcNoTnNQya9cwIOlhXLW+s3UMkWlN3AVPT8XtWew8g6fMkzJu0LI6S6Mx0fJb9cxUc27EGzJjKpajWfmxMdv/sRa6fticFIXamvy6SPSDyS97hNiFuudkwOQ+F303c8UwHzGqur3VuvXezIVHCi0dDYWBZY35tbOmr2nrI6W3ymEKooqHcBaWecfo3NONDp8sHW2NeUbio6s4PSoPLnvd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hPvIOMuCdXdPhbBRcytZ7Nn7aQdZyicZx/qd5Pc9YuQ=;
 b=w7YsbE+4eGAjpR/7NZUVqgWR8QqdoC7yuiCs8gmrLsolOM0lKGAujzOBC51zMFMCZP6s10ju9cytFPErNziYkgDiG5e/D2ajjmZG9mlChurm8cr97HAUPVy7vs3GjlriV7Gu7d2vHv+oXav05UTpnsoWH9K7I46Bj7NIEdK98VYZZq+t2IF8BhQbPPwhhlT+gJXV4E9Gd++/IMes8soMo+pk/zXWIQbCJODaYMdZ28SvhJErLET54KQj8lgKEItjb2yDcTTkSfkk79A5WnxI6X7F+Z6BkV6WScjTYw3cMI/VV0mhGGavxPX5T3U6Lrj8Zx3VupVEqdGvAPq1UDnERQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPvIOMuCdXdPhbBRcytZ7Nn7aQdZyicZx/qd5Pc9YuQ=;
 b=sG64EwUTLhGkO7mKA5rZ+QD6hf1t2WoBoqcxtZDHzgVylrN/nymv1P1EfklCBghWf6yM8nLkbR3KsUjPOE0JHHr/b56zUUet55KsSNks0qspJrBteQ98JQRrdADBzIR1H4/pdx9jlXhZVwua24GQ7Ox5r1mmnEHErvKPyIKPzz4hk0s0hE21hH8rPeBIJ5L5ytXU+JxpSqiWAItISQsoFKnI2jWGFuobAYAtgvr6vX0OSw2iRrm9O8aNXY4LUotAB9CXL3phQIq6jSVc9zTPanXjqP52WzbqQPDcyfZi/cLQguc/icWizjoHtdjEC/00R3CaAPx3+hasBvcNS8YcPQ==
Received: from DS0PR17CA0011.namprd17.prod.outlook.com (2603:10b6:8:191::13)
 by CH0PR12MB8506.namprd12.prod.outlook.com (2603:10b6:610:18a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:37 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::f0) by DS0PR17CA0011.outlook.office365.com
 (2603:10b6:8:191::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:09:37 +0000
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
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:28 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 50/62] drm/nouveau/gsp: init client VMMs with
 NV0080_CTRL_DMA_SET_PAGE_DIRECTORY
Date: Mon, 12 May 2025 07:07:10 +1000
Message-ID: <20250511210722.80350-51-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CH0PR12MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a16ccfd-dce8-4634-4ae4-08dd90d02310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ToCCXStSKDP6gXvjlQJb98iZVcw2db/EarnsBpbzu/Py1KP2a8dU+JvA0BW2?=
 =?us-ascii?Q?uA4o7YpM1wYJeL0TbgEmOcmicaqT/SwoOrjdBYhEvtHsGDHd7y8O9A2CgGpU?=
 =?us-ascii?Q?akQXEOZbXPPKKRXei10GOLfiRrgrmOI/r2eDsMbv1ERwN7R9havOws8mOPUu?=
 =?us-ascii?Q?TWbTpVxMPDTRCMj6E3YghvwA/gN7qbtfVx1QZV0pR7DWZTzuetFLf/ar/xtv?=
 =?us-ascii?Q?lmXcOLOQ8TSAa8zqxoqFSII0U4SEFBwRE5Ybat0vRbXTetdaWw+oHUiiSnRm?=
 =?us-ascii?Q?vse8RTSwOYHdAc0feA9WDb+vvcqQ00S9ajRC3p8Zf2FfkbdctwbStYuAkoDx?=
 =?us-ascii?Q?jo8jmiNoJcUnDjm82hiwwgujYmQ6ogY5HyjG1MCIgtrDDM+dTa+hcXMXvL5a?=
 =?us-ascii?Q?oXdvhwWiPd8hitfz/PFrN4CO2Yhr2H2AETO+joCCB1qtkJFAWpU9ARnSWcBV?=
 =?us-ascii?Q?aw52pliTxgd1FH8taJwloABJnDsyAd6gpT4Ud1VX+0ySXae74iL/CS8fhPGf?=
 =?us-ascii?Q?e+n5/JAFOeoDfQ9WgBHqHd8rO/DxN/kCABFZRQWQQS9XNViMZ8W7SN3M5vQR?=
 =?us-ascii?Q?x6B2+Yx5Lm3xYWr3NbfKXtEJW+wq3s8jtMP5Bbx3zfGv0nvnTS+VXEMo/Yv1?=
 =?us-ascii?Q?Y/9qvWDq+LMgib49sgon3BY3dT3l5DCRU9DzIbXx5biNvw6+COpqlG3SseOW?=
 =?us-ascii?Q?c8EQCDHJR1EXhwWGveLrhQG0JcxiXyW/o/h2LGyQJX/g04yiR530rdanO0zo?=
 =?us-ascii?Q?XE7BGFWvYjo+6yGIdVyn+PUcTCeuE8HwPt2N1sPX22dECjF3hQpUjj+5K1fs?=
 =?us-ascii?Q?sQKNlnGy43aH1vaorsS26bM9bwsgFzyF+5iTQi3VIFL/TkSb2/N5OusL1Yu2?=
 =?us-ascii?Q?sMuTKnRGvlg+3iHR9yT8RwpA0MiXImtRZdvYE50b7Qpb0mSmfBqtppD2mVLk?=
 =?us-ascii?Q?PEpeGN8YqDkdCop7TVF1kZbOIEUWp5dYyMx9MUPqeo8ync2mjISvw+aB+1Ed?=
 =?us-ascii?Q?XSjGQacLYwrEiamPIH2sxaaFqSf1nAjHFKN1PG9HCZHGwdv73dbkq3lUhQdr?=
 =?us-ascii?Q?ESktYYauZcrli6InRk9OLRsrwpXowYLb12k2fK/iCLrAQ0sHi8zWPTXQ22/p?=
 =?us-ascii?Q?Xfn4pgR+42aloZfnFPs3SBRHXJo3KiO83vtvky8OYAvHgEb4q5LMJ+ZxMo7/?=
 =?us-ascii?Q?OK1geoXOqUXQ3tBF4ggXCeVXwKGc+I3Er3WIbj7zMLqAIH6bfyHgWoFG40R2?=
 =?us-ascii?Q?YJw50x6/mDi30UXhrGcxewvNB0yUv1ioNNolVknJR2F8VLIisaWOGkgc8PkZ?=
 =?us-ascii?Q?mWDcGcJLFGN6fWmdwLlDubU6WpU2Nwk4Jz+x+h7nPj8DzvIF/9bmvACrB/3l?=
 =?us-ascii?Q?r1zn3jsdU+MJyz85DHpEjrS0Lj6btJ3CiHpR3+caQGz98rbA17f2k8v9MBnL?=
 =?us-ascii?Q?iU4v9rUCm8/Y4KQ+vxJBn6//r6GP1EXszMMyH2cDL75R2uR+rJCj4yH3UQ/x?=
 =?us-ascii?Q?81n8bOILFEyTAeGS5VO9PjTBlHE7zBE/wKDg?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:37.1350 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a16ccfd-dce8-4634-4ae4-08dd90d02310
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8506
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

The current code using NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES
not only requires changes to support the new page table layout used on
Hopper/Blackwell GPUs, but is also broken in that it always mirrors the
PDEs used for virtual address 0, rather than the area reserved for RM.

This works fine for the non-NVK case where the kernel has full control
of the VMM layout and things end up in the right place, but NVK puts
its kernel reserved area much higher in the address space.

Fixing the code to work at any VA is not enough as some parts of RM want
the reserved area in a specific location, and NVK would then hit other
assertions in RM instead.

Fortunately, it appears that RM never needs to allocate anything within
its reserved area for DRM clients, and the COPY_SERVER_RESERVED_PDES
control call primarily serves to allow RM to locate the root page table
when initialising a channel's instance block.

Flag VMMs allocated by the DRM driver as externally owned, and use
NV0080_CTRL_CMD_DMA_SET_PAGE_DIRECTORY to inform RM of the root page
table in a similar way to NVIDIA's UVM driver.

The COPY_SERVER_RESERVED_PDES paths are kept for the golden context
image and gr scrubber channel, where RM needs the reserved area.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/handles.h  |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  3 +-
 .../nvkm/subdev/gsp/rm/r535/nvrm/vmm.h        | 35 +++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 39 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +-
 6 files changed, 69 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
index 0308fb7b9647..8d070e68aa3a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
@@ -11,6 +11,7 @@
 #define NVKM_RM_DEVICE              0xde1d0000
 #define NVKM_RM_SUBDEVICE           0x5d1d0000
 #define NVKM_RM_DISP                0x00730000
+#define NVKM_RM_VASPACE_GOLDEN      0xa5000000
 #define NVKM_RM_VASPACE(id)        (0x90f10000 | (id))
 #define NVKM_RM_CHAN(chid)         (0xf1f00000 | (chid))
 #define NVKM_RM_THREED              0x97000000
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 0ea6279ef9e6..e9812eae97a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -276,7 +276,6 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	struct nvkm_device *device = subdev->device;
 	struct nvkm_gsp *gsp = device->gsp;
 	struct nvkm_rm *rm = gsp->rm;
-	struct nvkm_mmu *mmu = device->mmu;
 	struct {
 		struct nvkm_memory *inst;
 		struct nvkm_vmm *vmm;
@@ -295,7 +294,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	ret = mmu->func->promote_vmm(golden.vmm);
+	ret = r535_mmu_vaspace_new(golden.vmm, NVKM_RM_VASPACE_GOLDEN, false);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
index f58edf62e4ae..cdbe55eacf41 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
@@ -23,6 +23,8 @@ typedef struct
 
 #define NV_VASPACE_ALLOCATION_INDEX_GPU_NEW                                 0x00 //<! Create new VASpace, by default
 
+#define NV_VASPACE_ALLOCATION_FLAGS_IS_EXTERNALLY_OWNED                   BIT(3)
+
 #define GMMU_FMT_MAX_LEVELS  6U
 
 #define NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES (0x90f10106U) /* finn: Evaluated from "(FINN_FERMI_VASPACE_A_VASPACE_INTERFACE_ID << 8) | NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS_MESSAGE_ID" */
@@ -87,4 +89,37 @@ typedef struct NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS {
         NvU8  pageShift;
     } levels[GMMU_FMT_MAX_LEVELS];
 } NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS;
+
+#define NV0080_CTRL_CMD_DMA_SET_PAGE_DIRECTORY (0x801813U) /* finn: Evaluated from "(FINN_NV01_DEVICE_0_DMA_INTERFACE_
+ID << 8) | NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 physAddress, 8);
+    NvU32    numEntries;
+    NvU32    flags;
+    NvHandle hVASpace;
+    NvU32    chId;
+    NvU32    subDeviceId; // ID+1, 0 for BC
+    NvU32    pasid;
+} NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_PARAMS;
+
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_APERTURE                  1:0
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_APERTURE_VIDMEM           (0x00000000U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_APERTURE_SYSMEM_COH       (0x00000001U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_APERTURE_SYSMEM_NONCOH    (0x00000002U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_PRESERVE_PDES             2:2
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_PRESERVE_PDES_FALSE       (0x00000000U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_PRESERVE_PDES_TRUE        (0x00000001U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_ALL_CHANNELS              3:3
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_ALL_CHANNELS_FALSE        (0x00000000U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_ALL_CHANNELS_TRUE         (0x00000001U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_IGNORE_CHANNEL_BUSY       4:4
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_IGNORE_CHANNEL_BUSY_FALSE (0x00000000U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_IGNORE_CHANNEL_BUSY_TRUE  (0x00000001U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_EXTEND_VASPACE            5:5
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_EXTEND_VASPACE_FALSE      (0x00000000U)
+#define NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_FLAGS_EXTEND_VASPACE_TRUE       (0x00000001U)
+
+#define SPLIT_VAS_SERVER_RM_MANAGED_VA_START   0x100000000ULL  // 4GB
+#define SPLIT_VAS_SERVER_RM_MANAGED_VA_SIZE     0x20000000ULL  // 512MB
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 81ceafd30e41..0b1b41bf6230 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -21,10 +21,11 @@
  */
 #include <subdev/mmu/vmm.h>
 
+#include <nvhw/drf.h>
 #include "nvrm/vmm.h"
 
 int
-r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
+r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 {
 	struct nvkm_mmu *mmu = vmm->mmu;
 	struct nvkm_gsp *gsp = mmu->subdev.device->gsp;
@@ -37,12 +38,14 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
 		return PTR_ERR(args);
 
 	args->index = NV_VASPACE_ALLOCATION_INDEX_GPU_NEW;
+	if (external)
+		args->flags = NV_VASPACE_ALLOCATION_FLAGS_IS_EXTERNALLY_OWNED;
 
 	ret = nvkm_gsp_rm_alloc_wr(&vmm->rm.object, args);
 	if (ret)
 		return ret;
 
-	{
+	if (!external) {
 		NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS *ctrl;
 
 		mutex_lock(&vmm->mutex.vmm);
@@ -52,6 +55,11 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
 		if (ret)
 			return ret;
 
+		/* Some parts of RM expect the server-reserved area to be in a specific location. */
+		if (WARN_ON(vmm->rm.rsvd->addr != SPLIT_VAS_SERVER_RM_MANAGED_VA_START ||
+			    vmm->rm.rsvd->size != SPLIT_VAS_SERVER_RM_MANAGED_VA_SIZE))
+			return -EINVAL;
+
 		ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.object,
 					    NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES,
 					    sizeof(*ctrl));
@@ -70,14 +78,27 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
 		ctrl->levels[1].size = 0x1000;
 		ctrl->levels[1].aperture = 1;
 		ctrl->levels[1].pageShift = 0x26;
-		if (vmm->pd->pde[0]->pde[0]) {
-			ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
-			ctrl->levels[2].size = 0x1000;
-			ctrl->levels[2].aperture = 1;
-			ctrl->levels[2].pageShift = 0x1d;
-		}
+		ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
+		ctrl->levels[2].size = 0x1000;
+		ctrl->levels[2].aperture = 1;
+		ctrl->levels[2].pageShift = 0x1d;
 
 		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.object, ctrl);
+	} else {
+		NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_PARAMS *ctrl;
+
+		ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
+					    NV0080_CTRL_CMD_DMA_SET_PAGE_DIRECTORY,
+					    sizeof(*ctrl));
+		if (IS_ERR(ctrl))
+			return PTR_ERR(ctrl);
+
+		ctrl->physAddress = vmm->pd->pt[0]->addr;
+		ctrl->numEntries = 1 << vmm->func->page[0].desc->bits;
+		ctrl->flags = NVDEF(NV0080_CTRL_DMA_SET_PAGE_DIRECTORY, FLAGS, APERTURE, VIDMEM);
+		ctrl->hVASpace = vmm->rm.object.handle;
+
+		ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.object, ctrl);
 	}
 
 	return ret;
@@ -93,7 +114,7 @@ r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 	if (id < 0)
 		return id;
 
-	ret = r535_mmu_vaspace_new(vmm, NVKM_RM_VASPACE(id));
+	ret = r535_mmu_vaspace_new(vmm, NVKM_RM_VASPACE(id), true);
 	if (ret) {
 		ida_free(&mmu->rm.vmm_ids, id);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
index a899da67c15e..742ef80188fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
@@ -119,7 +119,7 @@ r570_gr_scrubber_init(struct r535_gr *gr)
 	if (ret)
 		goto done;
 
-	ret = r535_mmu_vaspace_new(gr->scrubber.vmm, KGRAPHICS_SCRUBBER_HANDLE_VAS);
+	ret = r535_mmu_vaspace_new(gr->scrubber.vmm, KGRAPHICS_SCRUBBER_HANDLE_VAS, false);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 2865683fdfca..14e5bb5ad30e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -148,7 +148,7 @@ extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 void r535_gsp_client_dtor(struct nvkm_gsp_client *);
 extern const struct nvkm_rm_api_device r535_device;
-int r535_mmu_vaspace_new(struct nvkm_vmm *, u32 handle);
+int r535_mmu_vaspace_new(struct nvkm_vmm *, u32 handle, bool external);
 extern const struct nvkm_rm_api_fbsr r535_fbsr;
 void r535_fbsr_resume(struct nvkm_gsp *);
 int r535_fbsr_memlist(struct nvkm_gsp_device *, u32 handle, enum nvkm_memory_target,
-- 
2.49.0

