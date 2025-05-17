Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E71ABA72D
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017A510EBE5;
	Sat, 17 May 2025 00:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qxiaDxIS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 827A410EBE0
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDm/r6G44IoWYoG5LyW+vYZiLrTGmsw8+j9d1+OolIGFyNUZh9opfeg8B4as4jx6jwzswznU3fdo8gTj92o0lYCsyKhBZ3vMr9cO0EGPy2/LCtKrTwBlFYu71gODTO5XLrTxScy1hNiXrb32FSMwng/9vV2SsZyX2qT5b3AoZ0M/PwJAScurpbLscJ+gf8ujHYZYUAiwGwHYeW6x7vNOdB1mZcDAMtBEZR4mtKK12iactN/KepaMsIlRZ+6eqXbEEYgP4xKh08n8Xe8jD/yTpWKgmgm+DnNen1GqSWmSWX6DSpsT51jL2sNpPpqv32rqPgePQZNiMyU+ric7a6sLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QikduUkeZ9EXJZmPBO53+znV+gO14//+Lwdi467BYg=;
 b=Zm/6iYGErdafINL6xVGOHIVO73rzbWa6W9ZphL1aszEOXE/PsIp4H4/3FoI0C3TASDRi3DS/5foGPNDAg3R2+j8c3jj/U9Hbfy1EU8NdnF2vizSp+B7qVt/+jY6C+VM9YvP5ZTrI8BAuDy0ODY6PISbbLRhcCh3SyrasV4Y7MuXpmoA+kyhdXFwtmeBBq8VK9eLBCyLI0jawouBcGZr2hPuK/hfTqF0zzEnyC12FF8xCvLZNw16ZPfYD53Eerlwel00efmxfCJ5ygXEL/TFt94j0QvsX8Fp/R7/F24oeJakKdup2m56QSiYUHgueBPDvBXeXxIM6GuSq5X0FBE/zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QikduUkeZ9EXJZmPBO53+znV+gO14//+Lwdi467BYg=;
 b=qxiaDxISvqLSU57iue+3kj6HHVF5LTc2EvQhM4UkmngMiiRXygq89ZO5kOylNe2QidNvFlA3bkGj0wBu7fRcEmKLe1zytMUet5uBsg2iZzWIZFOwO+3Wijnwg5ZKehbwAnZ9rcv5Fi1LyUhdXIjT0qNS8Jxrvi9y4fU534V/7wBLY3ckwrgxt9BhLYR+h6Paf3VwQ+4DCCX0TDBfH6C8rZeLo7gfpVGN732aUqSJnRpsTR7naXH0OGkx5pMBJHbbQaFR5UNYykQyMzADki2WuUUNrKP7c0WyHVIXLt6jrssWhjAClDfZxaVVVnEDCAcUUG7YAXkNDageXepQpk3aHw==
Received: from SJ0PR03CA0164.namprd03.prod.outlook.com (2603:10b6:a03:338::19)
 by DS0PR12MB7511.namprd12.prod.outlook.com (2603:10b6:8:139::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:37 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::d6) by SJ0PR03CA0164.outlook.office365.com
 (2603:10b6:a03:338::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.26 via Frontend Transport; Sat,
 17 May 2025 00:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:22 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:20 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 50/62] drm/nouveau/gsp: init client VMMs with
 NV0080_CTRL_DMA_SET_PAGE_DIRECTORY
Date: Sat, 17 May 2025 10:09:42 +1000
Message-ID: <20250517000954.35691-51-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e64cbd-908a-47e9-6cea-08dd94d763fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bP4Pqsb6cipWfoJtH21z1jGarHp3Ab2IY0U6XAnntO0zMtQ3o0fhOd1VSJ0r?=
 =?us-ascii?Q?8pPQSrniz7DITRILZfFIM8cii8xuUNahAcb3V6s2xtFB38owGIngxRJJl0Af?=
 =?us-ascii?Q?7qwUoiW5e6E+zrXAKJ3HrnElt54QBIZnNwpWu9ET+VhRAuj0UpnSXb0Csivf?=
 =?us-ascii?Q?/BHAbFttk/OBG1DKq9RJn3ExQy3vnXsqZac8us/3cjxooZ8Ld6vzbfivW7Kp?=
 =?us-ascii?Q?jCXMM4GwQEUVJncK+v3Q2pNFggAFEDKC0IwauN+olrRO8VENNrMSSSU72WHk?=
 =?us-ascii?Q?w5M/4chsz5d0EWrMJuzCzPT63vM+55dJ7Lgbt3x3tN8OzY4t5l3kt/zl0gXw?=
 =?us-ascii?Q?2qj3OB2iadQ0p98hEQKClJCb/AgrmZzoyTw8plp5DzZuOrHZ47HVKUxRz7qp?=
 =?us-ascii?Q?67kUJxdG24sGHimedGTUGEd0TOaEv7eK3xpVxFKilw/zVDI13ueQoqp54bl1?=
 =?us-ascii?Q?Hs9dqCCbQrlB4ANWQVN20sWr3QjQW0iUTMucY5Nd1AiCH9Ra8lvBUiL9DJAD?=
 =?us-ascii?Q?w5N/TX3DaJ3nBui1uTg6/mvaU0BYQQe2y6rBvrCqSKLLtp6bO6My1RUxfYel?=
 =?us-ascii?Q?P6lklXm+gwUKLtRKfy+z1TmN3kq6ysJ1A0biTdMcLEzLM8rYbYMd7BuzCeVC?=
 =?us-ascii?Q?Z/Y+XCvPcFp2cAlz33niS8eIxXLZWnh+nIeRYytU6C62ku/d1GrR+W4TtrPW?=
 =?us-ascii?Q?s4WuPArRS9ofbbvTqWz/qSCS61ASG8uF7hq0h5rz7bcOHvpqkF9ZRGtyRBwS?=
 =?us-ascii?Q?ttYwhXOM4S/dVsCRqe5SuUnG5TAiGpqjlqMfx2KraLgyxPjo6PQjFWOLiVAH?=
 =?us-ascii?Q?lmOFzAtUcoaiuXoYHXfsVtjS8LdAvOZO2Eub2wmNOpDZhflMRAKptMCiz+WF?=
 =?us-ascii?Q?7mt8T/QxK7L5Gn4UARg7hhbO12+qjbj4m0kZK3lRuubzDPw7aRM0zT0Ix3I7?=
 =?us-ascii?Q?/Im7SHLpCe0LJ/qGYQX/S2wOZCrMMjwvYAupgzHNXWlXuUzixW6AN5A5q6Oq?=
 =?us-ascii?Q?Hd7F9csDkpuXBs/go47yuTS0gORyrzLdRYauM/735q464epwJbzhDuDS6hMR?=
 =?us-ascii?Q?TF7Yv7/UkG+Y93oLciN8YHhHYUNdL2jIY3mjl0ucHGvL2MDnljTX9R8zh6w6?=
 =?us-ascii?Q?Mxo1/piQQ4BzgVlSWQGcGxaMEgIl9rCcV+er5VygXZdOKpb+7qJHwwBYOZcp?=
 =?us-ascii?Q?7O4b2AiY4RzM6KK6ahYmXlYTVyMbFzkupy+R3lnnJGhzdwbeP4WRLpuyb0g6?=
 =?us-ascii?Q?9qe/0D+B8Hl06izsDF++EvqVi/fkgNcWCkQSFogMA6vTIpo6PkBiJhjl3dkv?=
 =?us-ascii?Q?lAYes7SMBHcM1Z0CkHmH49mk15Zt5z2QCbPRZK6RvO7ffUaP+EI3L5xfgFiM?=
 =?us-ascii?Q?T/tJFpZegWvcPcmqgkmG7JySPJObL+wiY6lFqxlCLa19kMAniqlalAT9/sr3?=
 =?us-ascii?Q?gJA5y6kzLD0TyTW0mWkK3MwMcAUhOC1xaaCeQhPFDoEwnqX6R76w4c7ycjMK?=
 =?us-ascii?Q?NsvIurx8GSZ2/aF5mIYnsmfrJPXrq8q9/59L?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:37.2267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e64cbd-908a-47e9-6cea-08dd94d763fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511
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
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  3 +-
 .../nvkm/subdev/gsp/rm/r535/nvrm/vmm.h        | 42 ++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 66 ++++++++++++++++---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  3 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  8 +--
 7 files changed, 106 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 7188e3eb2d07..4cab139f3236 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -73,6 +73,7 @@ struct nvkm_vmm {
 		struct nvkm_gsp_object object;
 
 		struct nvkm_vma *rsvd;
+		bool external;
 	} rm;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 1f5cf21f3f61..ddb57d5e73d6 100644
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
+	ret = r535_mmu_vaspace_new(golden.vmm, NVKM_RM_VASPACE, false);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
index f58edf62e4ae..f6ec04efd119 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
@@ -23,6 +23,11 @@ typedef struct
 
 #define NV_VASPACE_ALLOCATION_INDEX_GPU_NEW                                 0x00 //<! Create new VASpace, by default
 
+#define NV_VASPACE_ALLOCATION_FLAGS_IS_EXTERNALLY_OWNED                   BIT(3)
+
+#define SPLIT_VAS_SERVER_RM_MANAGED_VA_START   0x100000000ULL  // 4GB
+#define SPLIT_VAS_SERVER_RM_MANAGED_VA_SIZE     0x20000000ULL  // 512MB
+
 #define GMMU_FMT_MAX_LEVELS  6U
 
 #define NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES (0x90f10106U) /* finn: Evaluated from "(FINN_FERMI_VASPACE_A_VASPACE_INTERFACE_ID << 8) | NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS_MESSAGE_ID" */
@@ -87,4 +92,41 @@ typedef struct NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS {
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
+#define NV0080_CTRL_CMD_DMA_UNSET_PAGE_DIRECTORY                           (0x801814U) /* finn: Evaluated from "(FINN_NV01_DEVICE_0_DMA_INTERFACE_ID << 8) | NV0080_CTRL_DMA_UNSET_PAGE_DIRECTORY_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0080_CTRL_DMA_UNSET_PAGE_DIRECTORY_PARAMS {
+    NvHandle hVASpace;
+    NvU32    subDeviceId; // ID+1, 0 for BC
+} NV0080_CTRL_DMA_UNSET_PAGE_DIRECTORY_PARAMS;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 05690f745bb4..dbddc5cc333d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -21,10 +21,36 @@
  */
 #include <subdev/mmu/vmm.h>
 
+#include <nvhw/drf.h>
 #include "nvrm/vmm.h"
 
+void
+r535_mmu_vaspace_del(struct nvkm_vmm *vmm)
+{
+	if (vmm->rm.external) {
+		NV0080_CTRL_DMA_UNSET_PAGE_DIRECTORY_PARAMS *ctrl;
+
+		ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.object,
+					    NV0080_CTRL_CMD_DMA_UNSET_PAGE_DIRECTORY,
+					    sizeof(*ctrl));
+		if (!IS_ERR(ctrl)) {
+			ctrl->hVASpace = vmm->rm.object.handle;
+
+			WARN_ON(nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.object, ctrl));
+		}
+
+		vmm->rm.external = false;
+	}
+
+	nvkm_gsp_rm_free(&vmm->rm.object);
+	nvkm_gsp_device_dtor(&vmm->rm.device);
+	nvkm_gsp_client_dtor(&vmm->rm.client);
+
+	nvkm_vmm_put(vmm, &vmm->rm.rsvd);
+}
+
 int
-r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
+r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle, bool external)
 {
 	NV_VASPACE_ALLOCATION_PARAMETERS *args;
 	int ret;
@@ -40,12 +66,14 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
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
@@ -55,6 +83,11 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
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
@@ -73,14 +106,29 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
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
+		ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.object,
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
+		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.object, ctrl);
+		if (ret == 0)
+			vmm->rm.external = true;
 	}
 
 	return ret;
@@ -89,7 +137,7 @@ r535_mmu_vaspace_new(struct nvkm_vmm *vmm, u32 handle)
 static int
 r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 {
-	return r535_mmu_vaspace_new(vmm, NVKM_RM_VASPACE);
+	return r535_mmu_vaspace_new(vmm, NVKM_RM_VASPACE, true);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
index c92ec231f09a..b6cced9b8aa1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
@@ -126,7 +126,7 @@ r570_gr_scrubber_init(struct r535_gr *gr)
 	if (ret)
 		goto done;
 
-	ret = r535_mmu_vaspace_new(gr->scrubber.vmm, KGRAPHICS_SCRUBBER_HANDLE_VAS);
+	ret = r535_mmu_vaspace_new(gr->scrubber.vmm, KGRAPHICS_SCRUBBER_HANDLE_VAS, false);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index fc63ac61a9d1..ead48c106bb6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -147,7 +147,8 @@ extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 void r535_gsp_client_dtor(struct nvkm_gsp_client *);
 extern const struct nvkm_rm_api_device r535_device;
-int r535_mmu_vaspace_new(struct nvkm_vmm *, u32 handle);
+int r535_mmu_vaspace_new(struct nvkm_vmm *, u32 handle, bool external);
+void r535_mmu_vaspace_del(struct nvkm_vmm *);
 extern const struct nvkm_rm_api_fbsr r535_fbsr;
 void r535_fbsr_resume(struct nvkm_gsp *);
 int r535_fbsr_memlist(struct nvkm_gsp_device *, u32 handle, enum nvkm_memory_target,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index b54397e5364c..f95c58b67633 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1030,12 +1030,8 @@ nvkm_vmm_dtor(struct nvkm_vmm *vmm)
 	struct nvkm_vma *vma;
 	struct rb_node *node;
 
-	if (vmm->rm.client.gsp) {
-		nvkm_gsp_rm_free(&vmm->rm.object);
-		nvkm_gsp_device_dtor(&vmm->rm.device);
-		nvkm_gsp_client_dtor(&vmm->rm.client);
-		nvkm_vmm_put(vmm, &vmm->rm.rsvd);
-	}
+	if (vmm->rm.client.gsp)
+		r535_mmu_vaspace_del(vmm);
 
 	if (0)
 		nvkm_vmm_dump(vmm);
-- 
2.49.0

