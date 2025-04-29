Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95E6AA3CA7
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1D110E5B2;
	Tue, 29 Apr 2025 23:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bvdb8CbQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2053.outbound.protection.outlook.com [40.107.236.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9ED110E5B2
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sf6Qn9byhu7ljdAu1ATwH+QYMdfb2RuxokwSI9VwSX+egckptDkKMvCPC2GJOMZt8FBRk+SA3zzdkEX7xTxyPt6KACCa0H45OPSIqGrwpTpJIJlxL5SaJQ5P/L344lO47YoI8WxSc1NWXDxMHZBYtV7QXu5lJ0bwbt4bS/NfclH/ghSSvpXKcugc0tXnHw2T3rb8WUM6M2UhkTPUCxQSJFmqcHrSXzkLSEBnPZ2nrRw0lRRn76Iswvxao3jA7L7/dHYjhYIRZfgiqzzyiiH80aBvh8/NC1ipfDFY5kY8P480TUEv9jnWXziCOdtIou17Ude4ZxZkYLqTL1VZWxRKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZWdtd25rPRWYnaqLzLVDmJsJ1dp0ZVbXz696zGKV8s=;
 b=uxeOFc3NyGpb2zJXQVlYFERLHDqMQQcPmhOvImlIvQm6IW2gbbYpT4pvZnv/D9h6XQ0ARFpuKOTsQbJR6IXWY/sHMwyfmRtl7kmKovEL27CWIp7OaD6XF8FHz3cgptsfY8745vdiMyaf8gjy4JrMQawR2hQiaPg3bKPzrcwztGnX3KzkWZ/ao9W2cRnmmCIvOOWA8F4NRS2ZGBV/ukL4pNM7AJN1sLDc55ut2ViSOlLcltlcw2hWr4qksAepXUoFyuZz8LQzvnPtVNm0OTZAWCzCwppTK5el66pX4+kLPErqZdvdQpnsEWQrghrl9yf+cjnO4BimggYbSLPFPna3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZWdtd25rPRWYnaqLzLVDmJsJ1dp0ZVbXz696zGKV8s=;
 b=Bvdb8CbQfT8tJeR6xdVc3Yx6K/8fvr8PqjvaSNjtLfCuZvb8d9CZi7o4rgWUlBkJPlkXADMEsDRGTfYPKi5lhzB+0UudSHJ694RfLPY2Tl6gehZLoe2HdeSflqcGzBFA3Kjaq+3uvsBugHCstztq18WF9qp02Jf70kaMobz+MJ1GdnpYdUjCpONOvEeN4wRGp+pQzYggkbccgTHHcZnl+C4gbU2RbO27M2jv6KPaWOQPpMxQQAGUZNttelRWesdvqnt1UTXN/D+7DmmKmPHXY6oRfwTcXdqUVZepBvu2nJSlILgpAG7x68woIt1Bcs63FAxXjiLZMSYGsw18vjE5uQ==
Received: from SJ0PR13CA0184.namprd13.prod.outlook.com (2603:10b6:a03:2c3::9)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 23:40:57 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::39) by SJ0PR13CA0184.outlook.office365.com
 (2603:10b6:a03:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.18 via Frontend Transport; Tue,
 29 Apr 2025 23:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:38 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:37 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 49/60] drm/nouveau/gsp: init VMMs with
 NV0080_CTRL_DMA_SET_PAGE_DIRECTORY
Date: Wed, 30 Apr 2025 09:39:17 +1000
Message-ID: <20250429233929.24363-50-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bad843a-b94e-417a-b421-08dd87774a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5iqVeXd2NFJCdGSTBFizuWUcMf5TaJK3kobailOljbPiqcU7MGNgeVPo37bb?=
 =?us-ascii?Q?a1TjD+VQLnHNo5Bq8K834d1DDc7T7DebDI+XDe3sijzPvFEX9zpefWyZjLPf?=
 =?us-ascii?Q?ui34P4Um7y7OdBjRl8vRmWWuxaogfSFo1yPIkIvMUNSwvuqNzgoYjLm1RKCW?=
 =?us-ascii?Q?1qxt0MbVVOUKZ3IcUaparNqWipIc+CCowdTDLh2NS7WbhTTsb1G/SKXkXx6h?=
 =?us-ascii?Q?Bo5/AV636ua1tz5UFP7FpvmRW8eamXFHFvJAMBdVEVO/FvL0xen+PGbpucSQ?=
 =?us-ascii?Q?oumMgxVIMhvJV4erI7X1CR5AGN3oBIS1QTZhdB2r/P8kpSfnQiPQYMVs+B9w?=
 =?us-ascii?Q?QxFtBTKiACM2JLJcV4Aq/baK8OqaMBLXj7SQGJOhqNgjgb+LYo5fUQM9tkT7?=
 =?us-ascii?Q?0ZT80ddNhTTiC7pWtS02ISfIkjj9YsIWklJywhwT68K4fDYhhMA/B0UoNlzM?=
 =?us-ascii?Q?hLQHgsOZdlwfQbX0GIFi1g+EBLMXphHuMnR9dphqRsEU1TCyxDoJs9kZJ127?=
 =?us-ascii?Q?L5rwkgcrAGSHgflDrqZ1wTfXzvpxG9PsCHlgVsTmmA1m/Y8wQru9Aj5r7ZSF?=
 =?us-ascii?Q?aNs3A8CClEDu58LznyJrfudv35ZrCVQOZ+E3qSTYqubfm/5pCF3Iq18RQ6YT?=
 =?us-ascii?Q?E8Ag6cIfqwL1nxNvZJjPa+MP4wYYJyxYxrxUQfum/w/MC92KOaV9KO0WTFsg?=
 =?us-ascii?Q?4yRQL3DoldIQwtA4qJRw6S9NtOm9jglzC4qd6sF1+N/mtgt8b3IgCT9kdWdl?=
 =?us-ascii?Q?GFRpGHa2kMt5ZdzE2hve0n+gmNPseNLoeAXxbQqO1RGl+PqwcK6mkcvO3Qns?=
 =?us-ascii?Q?JM8rjX4Ut9F67Yj6oQ26XteiA7ezrGYr6hQv6b6uhGNAEtkGYPt7AOmoy7Zg?=
 =?us-ascii?Q?+4igm4QGkgtY5N+krCN7qoXV+vRKpZl7c/Y7lHJzFwYnViReik8U3CPbw0hy?=
 =?us-ascii?Q?ujA+BVHDh/6sgKouZJvco0n/fsv7UYwJU5aVJMUesG50jvHERhPiEwupvrLL?=
 =?us-ascii?Q?bEDfgkYTZkw7ZqSFBs+fi4siImDyGwWa6bFs2zeDxI4HbXY7Te198Onnnpsc?=
 =?us-ascii?Q?D+zejCKRwfTDw6n3FKV19Uz2aH9IGY29njFVlp0RAc5SuByYBT3/vjQo1Ain?=
 =?us-ascii?Q?TET0VV/fapUd+F9NHTHK4Q4IzdyOHpjUC3eJsma4PvaSmafhwJ41NTv4A/HL?=
 =?us-ascii?Q?d2CJToXWXFytq4BpHh1AN3qZygRm6+UdS1OWpXX9jbaRUWRLtE85xNmZJZMX?=
 =?us-ascii?Q?AfQdTdHM+33v4Sjwo6Vnj7Oopxw42rIXPKUFHf9hA4VsYST8dFKW3UmMF/Ln?=
 =?us-ascii?Q?Y1B5rKpZrV42PCXCRh5ChpDtK4upETSu5qXEt5qjggVtZEeFWkSeVs87d/0e?=
 =?us-ascii?Q?PgYhQDKltytZosubYLu6k04rjQFGQfh/f8FPFDOlf87EpukaKFJvgVGaqiyB?=
 =?us-ascii?Q?eZjBwrS+6nNwZKxKroYkPO7z+li7YSfUSjF88VF4kA1OO3ENHYNqyh0m0tim?=
 =?us-ascii?Q?wXxdNpil5H3PLUksyRA47CQQXfOxJAWcD4w+?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:57.4782 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bad843a-b94e-417a-b421-08dd87774a6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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

Fortunately, it appears that RM never allocates anything within its
reserved area, and the COPY_SERVER_RESERVED_PDES control call primarily
serves to allow RM to locate the root page table when initialising a
channel's instance block.

Instead of fixing the existing code, flag the VASPACE as externally
owned, and use NV0080_CTRL_CMD_DMA_SET_PAGE_DIRECTORY to inform RM of
the root page table in a similar way to NVIDIA's UVM driver.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  2 -
 .../nvkm/subdev/gsp/rm/r535/nvrm/vmm.h        | 94 ++++++-------------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 41 +++-----
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  1 -
 4 files changed, 41 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 1e461d3b53e6..bd0d8c66ccd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -69,8 +69,6 @@ struct nvkm_vmm {
 		u64 bar2_pdb;
 
 		struct nvkm_gsp_object object;
-
-		struct nvkm_vma *rsvd;
 	} rm;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
index f58edf62e4ae..5e33b12a0059 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvrm/vmm.h
@@ -23,68 +23,34 @@ typedef struct
 
 #define NV_VASPACE_ALLOCATION_INDEX_GPU_NEW                                 0x00 //<! Create new VASpace, by default
 
-#define GMMU_FMT_MAX_LEVELS  6U
-
-#define NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES (0x90f10106U) /* finn: Evaluated from "(FINN_FERMI_VASPACE_A_VASPACE_INTERFACE_ID << 8) | NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS_MESSAGE_ID" */
-typedef struct NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS {
-    /*!
-     * [in] GPU sub-device handle - this API only supports unicast.
-     *      Pass 0 to use subDeviceId instead.
-     */
-    NvHandle hSubDevice;
-
-    /*!
-     * [in] GPU sub-device ID. Ignored if hSubDevice is non-zero.
-     */
-    NvU32    subDeviceId;
-
-    /*!
-     * [in] Page size (VA coverage) of the level to reserve.
-     *      This need not be a leaf (page table) page size - it can be
-     *      the coverage of an arbitrary level (including root page directory).
-     */
-    NV_DECLARE_ALIGNED(NvU64 pageSize, 8);
-
-    /*!
-     * [in] First GPU virtual address of the range to reserve.
-     *      This must be aligned to pageSize.
-     */
-    NV_DECLARE_ALIGNED(NvU64 virtAddrLo, 8);
-
-    /*!
-     * [in] Last GPU virtual address of the range to reserve.
-     *      This (+1) must be aligned to pageSize.
-     */
-    NV_DECLARE_ALIGNED(NvU64 virtAddrHi, 8);
-
-    /*! 
-     * [in] Number of PDE levels to copy.
-     */
-    NvU32    numLevelsToCopy;
-
-   /*!
-     * [in] Per-level information.
-     */
-    struct {
-        /*!
-         * Physical address of this page level instance.
-         */
-        NV_DECLARE_ALIGNED(NvU64 physAddress, 8);
-
-        /*!
-         * Size in bytes allocated for this level instance.
-         */
-        NV_DECLARE_ALIGNED(NvU64 size, 8);
-
-        /*!
-         * Aperture in which this page level instance resides.
-         */
-        NvU32 aperture;
-
-        /*!
-         * Page shift corresponding to the level
-         */
-        NvU8  pageShift;
-    } levels[GMMU_FMT_MAX_LEVELS];
-} NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS;
+#define NV_VASPACE_ALLOCATION_FLAGS_IS_EXTERNALLY_OWNED                   BIT(3)
+
+#define NV0080_CTRL_CMD_DMA_SET_PAGE_DIRECTORY (0x801813U) /* finn: Evaluated from "(FINN_NV01_DEVICE_0_DMA_INTERFACE_ID << 8) | NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_PARAMS_MESSAGE_ID" */
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
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index 9c6f6901ec45..6e1ef05f7f41 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -21,6 +21,7 @@
  */
 #include <subdev/mmu/vmm.h>
 
+#include <nvhw/drf.h>
 #include "nvrm/vmm.h"
 
 static int
@@ -43,47 +44,27 @@ r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 	}
 
 	args->index = NV_VASPACE_ALLOCATION_INDEX_GPU_NEW;
+	args->flags = NV_VASPACE_ALLOCATION_FLAGS_IS_EXTERNALLY_OWNED;
 
 	ret = nvkm_gsp_rm_alloc_wr(&vmm->rm.object, args);
 	if (ret)
 		return ret;
 
 	{
-		NV90F1_CTRL_VASPACE_COPY_SERVER_RESERVED_PDES_PARAMS *ctrl;
+		NV0080_CTRL_DMA_SET_PAGE_DIRECTORY_PARAMS *ctrl;
 
-		mutex_lock(&vmm->mutex.vmm);
-		ret = nvkm_vmm_get_locked(vmm, true, false, false, 0x1d, 32, 0x20000000,
-					  &vmm->rm.rsvd);
-		mutex_unlock(&vmm->mutex.vmm);
-		if (ret)
-			return ret;
-
-		ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.object,
-					    NV90F1_CTRL_CMD_VASPACE_COPY_SERVER_RESERVED_PDES,
+		ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.object,
+					    NV0080_CTRL_CMD_DMA_SET_PAGE_DIRECTORY,
 					    sizeof(*ctrl));
 		if (IS_ERR(ctrl))
 			return PTR_ERR(ctrl);
 
-		ctrl->pageSize = 0x20000000;
-		ctrl->virtAddrLo = vmm->rm.rsvd->addr;
-		ctrl->virtAddrHi = vmm->rm.rsvd->addr + vmm->rm.rsvd->size - 1;
-		ctrl->numLevelsToCopy = vmm->pd->pde[0]->pde[0] ? 3 : 2;
-		ctrl->levels[0].physAddress = vmm->pd->pt[0]->addr;
-		ctrl->levels[0].size = 0x20;
-		ctrl->levels[0].aperture = 1;
-		ctrl->levels[0].pageShift = 0x2f;
-		ctrl->levels[1].physAddress = vmm->pd->pde[0]->pt[0]->addr;
-		ctrl->levels[1].size = 0x1000;
-		ctrl->levels[1].aperture = 1;
-		ctrl->levels[1].pageShift = 0x26;
-		if (vmm->pd->pde[0]->pde[0]) {
-			ctrl->levels[2].physAddress = vmm->pd->pde[0]->pde[0]->pt[0]->addr;
-			ctrl->levels[2].size = 0x1000;
-			ctrl->levels[2].aperture = 1;
-			ctrl->levels[2].pageShift = 0x1d;
-		}
-
-		ret = nvkm_gsp_rm_ctrl_wr(&vmm->rm.object, ctrl);
+		ctrl->physAddress = vmm->pd->pt[0]->addr;
+		ctrl->numEntries = 1 << vmm->func->page[0].desc->bits;
+		ctrl->flags = NVDEF(NV0080_CTRL_DMA_SET_PAGE_DIRECTORY, FLAGS, APERTURE, VIDMEM);
+		ctrl->hVASpace = vmm->rm.object.handle;
+
+		ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.object, ctrl);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index b6295423c339..158202810db4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1035,7 +1035,6 @@ nvkm_vmm_dtor(struct nvkm_vmm *vmm)
 		unsigned int id = vmm->rm.object.handle & 0xffff;
 		nvkm_gsp_rm_free(&vmm->rm.object);
 		ida_free(&mmu->rm.vmm_ids, id);
-		nvkm_vmm_put(vmm, &vmm->rm.rsvd);
 	}
 
 	if (0)
-- 
2.49.0

