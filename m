Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6CDAB2B54
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EB6310E0E1;
	Sun, 11 May 2025 21:08:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iNcSy/5M";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD3510E0E1
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIPqXhYVwYHSDeFLk3VpOR1jEUwCh/K3ivIupW/LonelFGhe7N5gn0gbktS8QpnG4K/C3ONIOoMnn9Po/Z12eKkYzoJVTXdOBK3zIC8I1GsiugAROmL3dxtmyUWrClQsH8ANaUvOliXZIJG0imjqd5YHVwp7aL6TaNVATq26fOy4eZrApca4qQM7PyOTZVG5ZxX3l6xBoh1V5iZqKfQhC0b0aB6s6hWfnq+y8ETRbVaMVUyA5PQ22JK38hZSuAiJvGZ61KDzCZly0T9+a445IPC9OaYmU1MiOfq7Dy7RF8y1bHbrsyjinUM5z6lXVfatdzBmsQl10EcBBkY2rIourw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhEim/PDCaDLm5lQzQVR9irgV8kWB/msIuijgpAk7ZY=;
 b=CFnPG2QoEDrPJ0VhJFBvlIA3KQ7eBSFcsZ5VNKT4cYNMvjVBH7ynm9Vz0dyP01eKXCjCbQIXKQ6XdvH73otunDKenW3Q6Pzkmt2a4vs66I6ZnU3Ku7NuHqkKTBp6+tqqHpKrNmz74bnysnTnIxm6uFKtNYhjQRyDrbzqbiP69SYIRMo+ZgIz7XR0mHbyUo0XuGyd18DGbgvTnyXtUm9IkI2t8UTJ0nQ6MjK0+TMSUAo2Ja9wWZ/Fz20hpCMTRI/K7oB5tkVooZiOUQRJxLtdCtRbAAN9B1YNTuWG7b0yvXDWwAkd+pr4C2Zc3gEozE1vqJNd6j67tVsEayIu97xKEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhEim/PDCaDLm5lQzQVR9irgV8kWB/msIuijgpAk7ZY=;
 b=iNcSy/5MxcmY13xKYQF5VAu+UkmpvmW9SbBiAGev5IR9zLkmnSbmTkS4bPu/pSQSUK5+EN6jct5DA7lVXPJ8To+tV5JQIipaYhuKt9cP0x3aU4m7tsjhhKkIESd7lltWC+ItIv8ojOeFIVBmh67HBf2CFmlDb8CTECxjgK92Zv2ectJyNyOiQJAJjSgSJpC27CnHCgmD+PEI8AbWqdo+liXeSEZB84G0WUL7vRHv2l/mYDgAkMBHl9V4L7jsdMtRfPooIwXf0Htu93SZoQLAlPC3N7aI29oQfH1WiamTCtZVv24FRWuY9oZYYC9lTq8WiEKaUCjPqx11thCE5fUQMw==
Received: from CH2PR10CA0026.namprd10.prod.outlook.com (2603:10b6:610:4c::36)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:08:37 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::87) by CH2PR10CA0026.outlook.office365.com
 (2603:10b6:610:4c::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sun,
 11 May 2025 21:08:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:31 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 17/62] drm/nouveau/gsp: add channel class id to gpu hal
Date: Mon, 12 May 2025 07:06:37 +1000
Message-ID: <20250511210722.80350-18-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|MN2PR12MB4095:EE_
X-MS-Office365-Filtering-Correlation-Id: 683e96c6-09fe-4732-df8b-08dd90cfff75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G8+Q1v0M6HEja0kTQvtTemeGZF0NKLAxsvrS3sfaGN+dhhMMhlhxSGRMKPo/?=
 =?us-ascii?Q?YfsXg7cDi3G/DbzRgyZHWuyRLFOmvw+DhQk2tnC0qxmGO1FTF5IleRnxBzW5?=
 =?us-ascii?Q?rYjmfyzqN7qHgvwFHtpNjGjiz0Khwkw41tE4zCFgzvU3HwP/6orQVD4K/P0U?=
 =?us-ascii?Q?KKMItaTuXSkIqJuc4JKZWhTYbNONRk+ISxuEH3W3QMNLiG5m//0pwiyYjOmW?=
 =?us-ascii?Q?sPgZWP7tPWEEISk/pmFCnqVmxMgHEHYEGZ6FVnD+JtfH/XyYh1uLtzAnyG14?=
 =?us-ascii?Q?xOmsfgse/N2LIZ0XKLSsFkBKT5ski4mPkZ1qBMS6/yzI8sCopzGpIsBOi9Zv?=
 =?us-ascii?Q?iR5euaCxXxfpt+5oQRyJ5qpBORrzoZjdW4D8WP1TKANGoeK4rm0n3mnhzmUS?=
 =?us-ascii?Q?dJdyIZfcuGL7Onq8+AecV5JQoVYcNR7dqHcSya7pQrj6cTGdT29AxTCoV3ue?=
 =?us-ascii?Q?3iOmZpWIDwXsjCQnwfuXE5JmZc/zOvTsTAHu/pJcbPDjLAWZkxop7p6Hpr89?=
 =?us-ascii?Q?P6UJI2ozE+vEWC+F7P8jr59UG24R7BK20T1d6kkOQAbab8tP1i9qbLJKIZlf?=
 =?us-ascii?Q?bcJl1lYrrywsaomU+7icyoJ5/iPL7zQ8Wwn19w4i2xgNzOiqg9Tg1kdBMECC?=
 =?us-ascii?Q?wZrcgOqPIogX8OHNo1P/plcQcVHU4IbDH5MuBg8LZ9J13NKOqMX4joeEvFGC?=
 =?us-ascii?Q?j4YjiU1zE3ZOiLiSVxnVis4SumnNVtDIMVE9fK0jFKbgvT4AFsPfrxe2kzif?=
 =?us-ascii?Q?Obb32svTr8M78Z5HC0SpP0t1Yx8fYhO3ztegUa60zDDoQt6Q4ZQFnItZjrZ0?=
 =?us-ascii?Q?sHRZiENC1XApAnO8V5MkcG5pXxxRnyx8lz3eDTd44/vD7ULNg7tC3IcyAk8t?=
 =?us-ascii?Q?ZVQroPdXrHx58f48jEzMzs4x+r/fR344Jup2caUSqFZ837yLtqqA92FG9TrQ?=
 =?us-ascii?Q?PBmfdtrcDNdg/LKDp6ktAcAbq3gxEQUyWUTEG/suGMJTBfgVzpE4Uwzk1pfh?=
 =?us-ascii?Q?xsUKcxGGrUrf2+xXxQEOuyf+0PIV5IrgsU5FC/EkpAZENKlLTPyq0LMGvnvd?=
 =?us-ascii?Q?CFT3Z2htVECiVQ+IanLNVdS4LvWO9RIGTRmnhLqsg4q3IVuQarqlD3SD2w9a?=
 =?us-ascii?Q?icXIqT/qy4spauOs+4rYx5T2zbdaJ8m9OwlAVjzBUgjZrrwhx6zwyGWZNpL/?=
 =?us-ascii?Q?ph8TfEvQr+/ygpMWaSkZJfnrqaw3+SmG9XmeRukkjhbeAN7RvqhcTMCNPdVY?=
 =?us-ascii?Q?oG5+5HzETLhrTy02FvqbKkbFEfVJzCExqPZ7T6O7mziM+YZPrPu6DYPs6lie?=
 =?us-ascii?Q?YfjMkBEp+Kj4SSRvUbxVxmH9d3FLn+TXKNIqXKYP5qWTRd0mH323pb5zI6RL?=
 =?us-ascii?Q?eCn5AwAgbfYJIoCxX7jF/a6XauxFJzXmm/B5KiAQxg/gpittA5i5ZhNRxmkU?=
 =?us-ascii?Q?PS+sDUhAdevFtKE6S2rBprmDumKfLL9nL9mueKVnKolaL76oWBh9aX/29+wp?=
 =?us-ascii?Q?9FpVMfAeoCCzSqdKPM/VpcrrJHiuYe/W/ifj?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:37.3792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 683e96c6-09fe-4732-df8b-08dd90cfff75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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
index acfd807b77ed..4459bebcccdf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -31,6 +31,8 @@
 #include <subdev/vfn.h>
 #include <engine/gr.h>
 
+#include <rm/gpu.h>
+
 #include <nvhw/drf.h>
 
 #include "nvrm/fifo.h"
@@ -331,10 +333,6 @@ r535_chan = {
 	.doorbell_handle = r535_chan_doorbell_handle,
 };
 
-static const struct nvkm_cgrp_func
-r535_cgrp = {
-};
-
 static int
 r535_engn_nonstall(struct nvkm_engn *engn)
 {
@@ -637,6 +635,7 @@ int
 r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 	      enum nvkm_subdev_type type, int inst, struct nvkm_fifo **pfifo)
 {
+	const struct nvkm_rm_gpu *gpu = device->gsp->rm->gpu;
 	struct nvkm_fifo_func *rm;
 
 	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
@@ -645,9 +644,7 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
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

