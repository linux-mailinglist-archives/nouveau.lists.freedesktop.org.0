Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4F9ABA70A
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A0B10EBB7;
	Sat, 17 May 2025 00:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DszBsa1P";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A5110EBB7
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHMQ4O9VbV0ySzFckPKX3tZk5BPVXSBZpt4Uf1oEkO8ZMhIAtSlMIKWlgFiI7gPIz4BwJUXPmzFwzQuPavr1p1x6A0N67SlxwrEhTyV0WkNrYDxhbPAIc4vIWINmYSRr8hbwQFLJqrqE44dd1xyfGJEFaJAAZf0iuVaiQ5m/ziX9Wu1eMBsEBRdikKg7JHO3C9vmQtxJMQ318a3+sXnutJDsD+vVi2ZnFGJ6cytvqC6FP+zO0qaHLyl3zutkJjI1PHwiyjesz59RGMqbXh6dFiD49Bdf66JUjXTgYYbrOa/GKbf2itEzgEZGalPnJ8QZ7YuOto6N+arxUL7GO0eDFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pOAuqJonAMRNHbM5GoA12bdJRYjiydfirCvkORbln4w=;
 b=FCt08YU6LxP6WpII//Ad+LrjEUDEhSoasM4KwLmT2LNhA4/f/HR839NtSYsU3prTFDSebPU2dg4TC64uDtf1Wwr/qTIB7by/pSwCPWCqSMfgnksCgGqFIbqwqX/2CXoWRaHYBdzes6FtYlvv7A3/w+m9UP4a1jwOWVnt/RpaCBHpzdNkl0x+SfD3PmCd5gaqjBg/KNfem6b78A5SDxmHTyZpAVGU/0FFYzsYqt76fwot9xhojE+kr5Ls8Ea1HBFLNYyvnJdDm9A1LYKrUs2L64v24oxg+NpfRKrCq+IIh6r7OmGfW1x3qhO39tPsBFBoHTmTFlj90NZCnEn9kamZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pOAuqJonAMRNHbM5GoA12bdJRYjiydfirCvkORbln4w=;
 b=DszBsa1Pr5OJcTfId3cbH6MCReUPEK7V+GanF2T2mzLvteNyeSBi822a23W2QR1vQYEiAz8mHY64NZwQvUBp+bIKouKzSTysBCa9hSDgtToB9dLrj+cChgXIXepy//F8+1wZJ8wx69NNW/sOkCrERBXTtSEeZcHxRCBBbes6eeh72Szcd7qWUWhxLjA30w3Y/pNGTaPzETlwWP8jJTZcEPPPU2Sy4/zOU15kYbiHcl/l/3sV5162v1KPOsbVvsHRhT8wf0CeLkZ5pvAbmrXINLXv/XRKNKkeqVoNb+NhOUTChC6Xep91GwA94keGjyupl78etSYyCDC+xCRKFmSWDw==
Received: from SJ0PR05CA0161.namprd05.prod.outlook.com (2603:10b6:a03:339::16)
 by DS0PR12MB8814.namprd12.prod.outlook.com (2603:10b6:8:14e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:50 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::17) by SJ0PR05CA0161.outlook.office365.com
 (2603:10b6:a03:339::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.26 via Frontend Transport; Sat,
 17 May 2025 00:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:35 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:34 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 18/62] drm/nouveau/gsp: add channel class id to gpu hal
Date: Sat, 17 May 2025 10:09:10 +1000
Message-ID: <20250517000954.35691-19-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS0PR12MB8814:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e77eba-8d5f-403f-2eb4-08dd94d747e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oHunqQ8DMlKK0G4GS/uoD5W30I9UWr3E6cZYgB5VGzqn6qVNnd1wkE5dYsbK?=
 =?us-ascii?Q?ru3LUKJI9AAhN6JsjWPdM1M7/WRNROxpAVZgrJheadE0gfyQjhfI15l3N82S?=
 =?us-ascii?Q?OMd7BjQCgt3CMQr5Gw4bnNQtJLTSliV3XztW3w45QcNGmatYIcO192WvqhrS?=
 =?us-ascii?Q?nKMy/FlkR4S+Khpbq1gosrT1Oaze1tESSUOObf9EfZr6BUnNTwscC7S4d1Ob?=
 =?us-ascii?Q?hKWA7vqHTqLXq4Z6x1jBv5egwId8cWB9j/1nnXmdu7phi+baxMW2JwBoKJHb?=
 =?us-ascii?Q?/4Ww9eEgS5Ch56Xq7g6k/yxAQFMWHI29ySK88G3neSNntaj9njCBYGb1HSJW?=
 =?us-ascii?Q?dW4YPIyFOiZ1ayWxMZW+bE29p8HmUoIfQ9wCfYibs0UlYo+TGpcBovg4bEed?=
 =?us-ascii?Q?HUBaskPAYpZYwVERh5X3pzXTtKDs6z+y4QK0mZx3QHf51YH+oJN1kTc2sI78?=
 =?us-ascii?Q?ngpOWD7C36ooQYQBG76Mqb4GC7B32vFD0vCnkrIHc/DF4wXz2oZML3vSMxrX?=
 =?us-ascii?Q?ppI1LicIv2jmpLXhobiqgljnzZq5JDyCyQzVFLs3B45Y1SgSEqJKFUQF/di2?=
 =?us-ascii?Q?goIxOEHWPFFMrDEs+KLWz5fBWSWCZ7C4JP14tcnCUbVfi74CiKfwAAomBMCC?=
 =?us-ascii?Q?zoQK/0EfpWy+smu4NmRjaxz7U/IhMEzR1e9fOYX7CxJd2egU34I/U+CpxfKL?=
 =?us-ascii?Q?YXuNqyoYfDx34lQ2SbZ9loTm9Qrl4bCGAcuw00v46cALi+rOx7F72Cf+NzMh?=
 =?us-ascii?Q?DjazbuwaIR97P62uOPoVHwNNac7xLBfNOG5StvqA4TgdWay7X8mDFtGmYrSv?=
 =?us-ascii?Q?nYNLLJVSrrZ9yE+ImmYKMsMkkd+1tScCe/U8qW+s4VFwGQte4GVloXLagGpJ?=
 =?us-ascii?Q?5NPId/o+jOaQGF3DStehlpfL2zLjJ3ATDSfo1xdScvp+3H0OYdTB12z8x31I?=
 =?us-ascii?Q?oopdpNEOaXjWRpWIr+69pcNMK/ZXXo9N2hMjxMwggD0nxKETkY/SOsMmSDIh?=
 =?us-ascii?Q?N/OSyUVBDNCggxca7y9204WUffkaSANBXeUWRSMruZLxpd76LhYFK0VwLvck?=
 =?us-ascii?Q?T+8uGcE0pl+LiOgFrUeLvwe3qIkB/uiqCkHmqytgx4GKUOu4f4DV/cCKuYJa?=
 =?us-ascii?Q?u7dbEd0GtRhcVK3m+DNqCP//5/amwVJiZy19stLMHFN6sgycON8xYgCW8RO7?=
 =?us-ascii?Q?yTrFWrdz9yCbrNcSVQc+i/FopELOsOgC/orkNzGRPnTh+iAl/ZC0paMp35cJ?=
 =?us-ascii?Q?S2uT97dbswD527hk/bW/+deiAFtKWZ4lJ2pzMs1Lib4kJ2WUNE6H6WmbkD8U?=
 =?us-ascii?Q?QNfxrFoXKkcC994NYHVPSWBlffuNB+tqyuL1IC6pFo8Kc4bghxwa4E2SzBPS?=
 =?us-ascii?Q?gc4erMvHwQo8N61XKP13ruXbUkaMnWiF+0AsSedc4F/r1uRrgOOnvV2al0Kd?=
 =?us-ascii?Q?FjNSPLOht2nR3xky1nY2xtnqozvjzlFdA8rU+4/Inq54g/1729bskrBJbiFO?=
 =?us-ascii?Q?pdjqa89aUtcojuuyfcfxABOFCPPoIeG0osI9?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:50.0791 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e77eba-8d5f-403f-2eb4-08dd94d747e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8814
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

Use channel class ID from nvkm_rm_gpu, instead of copying it from the
non-GSP HALs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c    |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c    |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c    |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h      |  6 ++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 11 ++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c    |  4 ++++
 6 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index 170264d2a61b..d5b64da712bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -18,4 +18,8 @@ ad10x_gpu = {
 	},
 
 	.usermode.class = AMPERE_USERMODE_A,
+
+	.fifo.chan = {
+		.class = AMPERE_CHANNEL_GPFIFO_A,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index 164f46e0a93b..9bf80e196149 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -9,4 +9,8 @@
 const struct nvkm_rm_gpu
 ga100_gpu = {
 	.usermode.class = AMPERE_USERMODE_A,
+
+	.fifo.chan = {
+		.class = AMPERE_CHANNEL_GPFIFO_A,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index f1d4778c4bc3..55c90148a0d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -18,4 +18,8 @@ ga1xx_gpu = {
 	},
 
 	.usermode.class = AMPERE_USERMODE_A,
+
+	.fifo.chan = {
+		.class = AMPERE_CHANNEL_GPFIFO_A,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 7d005f73326e..4aeeb4b32dc8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -21,6 +21,12 @@ struct nvkm_rm_gpu {
 	struct {
 		u32 class;
 	} usermode;
+
+	struct {
+		struct {
+			u32 class;
+		} chan;
+	} fifo;
 };
 
 extern const struct nvkm_rm_gpu tu1xx_gpu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 594a6bbb1db2..28ac97415e8f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -31,6 +31,8 @@
 #include <subdev/vfn.h>
 #include <engine/gr.h>
 
+#include <rm/gpu.h>
+
 #include <nvhw/drf.h>
 
 #include "nvrm/fifo.h"
@@ -216,10 +218,6 @@ r535_chan = {
 	.doorbell_handle = r535_chan_doorbell_handle,
 };
 
-static const struct nvkm_cgrp_func
-r535_cgrp = {
-};
-
 static int
 r535_engn_nonstall(struct nvkm_engn *engn)
 {
@@ -522,6 +520,7 @@ int
 r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 	      enum nvkm_subdev_type type, int inst, struct nvkm_fifo **pfifo)
 {
+	const struct nvkm_rm_gpu *gpu = device->gsp->rm->gpu;
 	struct nvkm_fifo_func *rm;
 
 	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
@@ -530,9 +529,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 	rm->dtor = r535_fifo_dtor;
 	rm->runl_ctor = r535_fifo_runl_ctor;
 	rm->runl = &r535_runl;
-	rm->cgrp = hw->cgrp;
-	rm->cgrp.func = &r535_cgrp;
-	rm->chan = hw->chan;
+	rm->chan.user.oclass = gpu->fifo.chan.class;
 	rm->chan.func = &r535_chan;
 	rm->nonstall = &ga100_fifo_nonstall;
 	rm->nonstall_ctor = ga100_fifo_nonstall_ctor;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
index 7aea54dd89ae..bb674b9cef69 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -18,4 +18,8 @@ tu1xx_gpu = {
 	},
 
 	.usermode.class = TURING_USERMODE_A,
+
+	.fifo.chan = {
+		.class = TURING_CHANNEL_GPFIFO_A,
+	},
 };
-- 
2.49.0

