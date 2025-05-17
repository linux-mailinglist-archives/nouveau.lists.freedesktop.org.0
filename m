Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA66ABA707
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE3A10EBAC;
	Sat, 17 May 2025 00:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SlIZ9R3s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A618A10EBB0
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICNkp81Iva6ZywJdpmjL6lR2blgmWep4zKafeN+cXfoDzukditymtx74pSa7TdR3iZjgzLrBFIq45CMB/6PFYRigshNbMklpt1YNe1+XvetIq1hW+HAR2BmNZLvovugsHP6jsrjsoqC4lgfj095HhkTQJRd+PbxowwAeTg+CNPZhfdW+6WyKxrrvoP4lZn8lzYy6H6rVKRIXqPYO8H5lFMqXqygL6Oae9sF3iyyYkI+ZHHfFsUMRRZkhH2l53SZq23/6r170TbI3vIA/pT9ZiJjXZMJmwfhKJAQueqH05BWEkRmO0IRWlqFSFEquKaFMAkJfJ46910OSpOh7iKansA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nexZMeas19AZ/4/89snozhPE146uA6TTOK0QAZtps5Q=;
 b=Mx3dMn1XGxZa7Xn2Qx3yxIOJOyv2Ixw+F+38Z8mTW1uVA8YCuzTZ4hKMJW441aRg7z+Y9/8lMV0cD4tMIoiVwF8sOa1WOAwLvuamf47Oj3rzI8Et9p7OmXnrMZAIET98omWBmapox+fi+owjdV99ozcAHCzBL+hvCFIhhOmiRQmGOayHjXSEJFHqHA55B1WW9XL8OoB8w1tEB2Tvq8CzXQt/xkFfc7p8qSDwe8I+0bXpXKGqz0CHyKv27Zq4f6+tZArt+lbV6mdFPtIAefrOpPSfFIvXFEZDTddSmKpolSOyzsluw7pLwKU5uCTkJFpONehmqIovUvPAvQ2WGe8bJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nexZMeas19AZ/4/89snozhPE146uA6TTOK0QAZtps5Q=;
 b=SlIZ9R3sfDyfWzWZIag/9d01/lC6wP8H8ZtMounnPrKsN7M6p0RnNC4rGaJSRW1McuhOeDJoYJBKYnzKSYeWBThVL9FKSmUVrR5eGpvZ5PDiELCbO+sDoG7Q+8T9bX6D/ml1aJU9I4HmgqWMHF3UmRxrZMiK7AdW1prj4fp/yCQnp+/gGPcgyzD+NTd2gOczIZQlZrp12LAQEn1JgVg2IyCQ3l1k9f00UJgS5cfWJDthJ1rN1RlOPDD9GXc/QwVglEV3nwHtgD0XQElZnHf2gP/afeo5eH+ua3QRrL0U8H7+yqfnxVEDR5YdDTVpzcRZYgo9LiM7bEdG8HsiHmhvPQ==
Received: from CH0PR03CA0008.namprd03.prod.outlook.com (2603:10b6:610:b0::13)
 by PH7PR12MB7329.namprd12.prod.outlook.com (2603:10b6:510:20c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:10:48 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::56) by CH0PR03CA0008.outlook.office365.com
 (2603:10b6:610:b0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:10:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:34 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 17/62] drm/nouveau/gsp: add usermode class id to gpu hal
Date: Sat, 17 May 2025 10:09:09 +1000
Message-ID: <20250517000954.35691-18-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|PH7PR12MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: a2285fad-5794-454a-cb0e-08dd94d746ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Rj05zHkKTgNdK6lyp1n+Cnp6DAfNYGysts7GAZDZxz5G1D+/4owI8esk2yn?=
 =?us-ascii?Q?rjCB2uJ80TwuUIQtT4E58cM6UW217HtDo9Z7pQQSzQHzX5pF5sJspM+sB8KZ?=
 =?us-ascii?Q?nEJ4t/7/CfGuhMNYzgKtxbQWza1QTLkl5xp043qkw8nbT6j0xrKCnYbB2BYj?=
 =?us-ascii?Q?g8e0fBq9o1XzLuNRyryZ5/c/OakGo4e/L9N3TDpQ0jDOeJIoNFIxOkHlbpe9?=
 =?us-ascii?Q?uvqHOwBOsYp1pTbcqgKMY916gBsnRpgWFE/jNomkAWojei5ACI7ZsYXzuxdc?=
 =?us-ascii?Q?GVV2PqD+5OETSEIsRbSE/WVGOtaxj9Fv9qz4iR4Smm0brCYT6nhNfxFRdACz?=
 =?us-ascii?Q?dqJ8PnEzIKs8RMk0Z+mlL3ZqabjO5fN+rMaVgeGNauPUcr71qVfzITm+pKyQ?=
 =?us-ascii?Q?K+EW0mJ/MbfZtePMaoUbKiNq+nyfAmly8ohPVLTiLkTJV8WA3VvX/OF6xPX1?=
 =?us-ascii?Q?zJvID66lTLJ+io+s9AHn9Wm+T1PJnBlkMC0XTocWkQ7+QHIqW3ICA1hMsoaV?=
 =?us-ascii?Q?7SpOhnrOyxBd4FylmOuHhlQlXwESnXwx5TAnODtIj9sRvZeCVRlAzpaaQ2AU?=
 =?us-ascii?Q?vgyImxHAe3lBtX7VDQY+Qi3PjYVDjjh3Wg6QOlAoosPVw0J9sUQJ5r+ABfGq?=
 =?us-ascii?Q?DYbfOq/D+YZg4rau5f3IupKAIYv4pe7oylWZozE1zGarX5zZ3/Irtt23lex0?=
 =?us-ascii?Q?I/ASRaDQq9wGW33bpoFJqpg3KlV2hSzXO4BmrjDtPlw9rElb6IOgAfF27bQb?=
 =?us-ascii?Q?AvX0pBsBWvqbgRIhGHMvuby2GLygtmu7/6Uof7vqgMM446Yw3VsNMdwnWLt2?=
 =?us-ascii?Q?uasq46sGKySQot3a4yBTeL4x4M8LTSRC3Iio9Y9oj9YFx1OuG6w0PI2fCvB0?=
 =?us-ascii?Q?sXazPT5QNG6x5Ekb4cveWWzFfV6Wgyk+KNKNGndbxMPT25uT3R1zepyVjoXH?=
 =?us-ascii?Q?VU+8e/3P9yHSxYNxDwccnO51C/AyYfwIaORQNm7+F4Mb+Us/W5AYhcsN+Q9e?=
 =?us-ascii?Q?0yWzrHGEMRkU70RqI68q/OD61F56m/rly7wSHrGaBsKMGNDFf6x0os8ZU55P?=
 =?us-ascii?Q?iXhrcGom0AUcqmkYiLGydeJSgF+oPc7Wwav5zMBc67rR9o9ks4+WTVCr+5lk?=
 =?us-ascii?Q?0ity5Dzp23UK1g1UInAY5GVUAYbIlmzN6r4nDmrYWxydVnTZP5OLXEeBRBjP?=
 =?us-ascii?Q?oeyirQhs4arb0xqPkqFc8VZHgE+HNwDA/R/JxtkwrjzrkPDSxwHRI3KyibcK?=
 =?us-ascii?Q?+ry9ytbLsLovDyX+ZIjAO0ttD615LMyxKd/ZpgmLEGKUfntcfU/GPaL7RSBM?=
 =?us-ascii?Q?pK0YIxwz8/NBNy/CUWuXpSWl5iZ5AnH52XQ8GnV/CuUmdtl0fyWmJGmeRLkW?=
 =?us-ascii?Q?n7Lf5l4Ser8ADgbnvHicFi7UYetbL7bD78/wy2iwzk2/BPIUvrX7sXSFsB9t?=
 =?us-ascii?Q?+2LgOJLnBbj72qAnplJhwF6nw6wsYiMWat2ecUzTPS1BdAvDbQX7vCljrTSu?=
 =?us-ascii?Q?GNseFMXGbYDg1WKNnJYTazEbT8uxz0N68bNk?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:48.3895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2285fad-5794-454a-cb0e-08dd94d746ee
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7329
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

Use usermode class ID from nvkm_rm_gpu, instead of copying it from the
non-GSP HALs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c |  3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h   |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c     | 11 +++++++++--
 6 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index bdeaffbb1077..170264d2a61b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -16,4 +16,6 @@ ad10x_gpu = {
 		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = GA102_DISP_CURSOR,
 	},
+
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index b10e6ff9e9b6..164f46e0a93b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -4,6 +4,9 @@
  */
 #include "gpu.h"
 
+#include <nvif/class.h>
+
 const struct nvkm_rm_gpu
 ga100_gpu = {
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index d4b67ccac608..f1d4778c4bc3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -16,4 +16,6 @@ ga1xx_gpu = {
 		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = GA102_DISP_CURSOR,
 	},
+
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 7f3b5f3fd32b..7d005f73326e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -17,6 +17,10 @@ struct nvkm_rm_gpu {
 			u32 curs;
 		} class;
 	} disp;
+
+	struct {
+		u32 class;
+	} usermode;
 };
 
 extern const struct nvkm_rm_gpu tu1xx_gpu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
index add98b2f3b6d..7aea54dd89ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -16,4 +16,6 @@ tu1xx_gpu = {
 		.wimm = TU102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = TU102_DISP_CURSOR,
 	},
+
+	.usermode.class = TURING_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
index dce337306cab..9446049642e1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c
@@ -21,6 +21,8 @@
  */
 #include "priv.h"
 
+#include <rm/gpu.h>
+
 static void
 r535_vfn_dtor(struct nvkm_vfn *vfn)
 {
@@ -32,6 +34,7 @@ r535_vfn_new(const struct nvkm_vfn_func *hw,
 	     struct nvkm_device *device, enum nvkm_subdev_type type, int inst, u32 addr,
 	     struct nvkm_vfn **pvfn)
 {
+	const struct nvkm_rm_gpu *gpu = device->gsp->rm->gpu;
 	struct nvkm_vfn_func *rm;
 	int ret;
 
@@ -39,8 +42,12 @@ r535_vfn_new(const struct nvkm_vfn_func *hw,
 		return -ENOMEM;
 
 	rm->dtor = r535_vfn_dtor;
-	rm->intr = hw->intr;
-	rm->user = hw->user;
+	rm->intr = &tu102_vfn_intr,
+	rm->user.addr = 0x030000;
+	rm->user.size = 0x010000;
+	rm->user.base.minver = -1;
+	rm->user.base.maxver = -1;
+	rm->user.base.oclass = gpu->usermode.class;
 
 	ret = nvkm_vfn_new_(rm, device, type, inst, addr, pvfn);
 	if (ret)
-- 
2.49.0

