Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD709897EC
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B822010E39A;
	Sun, 29 Sep 2024 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QgD4zTW1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9568110E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 12:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gO6t8yqT4xtHlBGiPHLHTv/T5SbEmZA+XyHHOH31/pMsDnHeObDheRojnM36IKK49/cd0E9Hqe5wkI2e10E45nQ9+km1vHgsu1b3+oaTLG5QPCWzmlMpCtwwgcfR436RKjVGWiQTP8twb18YJyNpEj/LyLcTtZDZ8QQvEeKqE4zi53kTisdA7amHZH4zFJS4jp3cw4IIyi6Xoog0FU36sA08TzqGMeCFZJYNVKrGDXgIB3ZAsYdeoX9FeBPeBfdFfjPJ0B9AZOnFeC86c32PSb26UYeediScXeQg5DwNSaqeox+zYY1Q5CiJS41ZiGvgw1+W9FxA9voEAOPSM2AULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=vU2P7Mtfod7SDrH/U09qAUk7d01V+n4dvYVapPr6cdHLHBUy3o8YQ+CCmpHf0AqmFVJ8d0eWRFqi3rd7GnTRop1t0t/XsToDzODF1eclREBmh5wqO2QwLqEHggv3FdlOdYdouHE+J7i3p/IaX+0lrCAPRtMxEiAfHFXStJJwMcMETioxVBQprd+L/XWLIKmuxumy0KQLFt+pWGJd9llv0Y0eP4yHws7h64/dtiOV1ds+dTYG8tnALjxUeBkEoMS3xxr+oskn+bcQjSplOPUMyPVAF0N+iWQ4IFH33Ae/8Xly00j31NxCZQWOSHwRmTDW1IciDdO/xhgP62+nJe77fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlfV+SuI34Lf/N94L4BXIorTOK+ahgrGva1NTedSUEg=;
 b=QgD4zTW1Nn4OwIXzYcE0EQrH7cF08nJAdwQJhvGfeFICi49Xe91kR4jqrJJTzwRWULYIclCnpNpDZ0B9O+fzy+HspT6ri258Zi4KGDGRcmX2uQURTDTXnild31yosgkmMhzDhMFlfDViBoY5WCNuTGFuKif06uDn2i9Yvp8UeqH/91GjYL74ZFkYdOOkwnXW7YMFeP7yehOPRz0FbFf8ejE7Q1xec5dD/tHV3H70c3NURLwfCjuBJy247Zw2LkS3cfd/M6MvYEyLHD1Ziq9YXrBy2TCW7vDkguiUEp6GuHB0cvOZyqukVWNFhm+YDo6YzoOuQ+/9q6lXe0+AXqh5PA==
Received: from DS7PR03CA0064.namprd03.prod.outlook.com (2603:10b6:5:3bb::9) by
 IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 12:09:10 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::59) by DS7PR03CA0064.outlook.office365.com
 (2603:10b6:5:3bb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Sun, 29 Sep 2024 12:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 12:09:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:09:01 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 05:09:01 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 05:09:00 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 1/2] nouveau/dmem: Fix privileged error in copy engine channel
Date: Sun, 29 Sep 2024 15:08:55 +0300
Message-ID: <20240929120856.440950-2-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929120856.440950-1-ymaman@nvidia.com>
References: <20240929120856.440950-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 1521c33c-08cb-421d-3249-08dce07f86a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b6K9j15H7MYz5yfUZAfz+eqmcE1B30zeLjY4EUtDACsuZuKJ/2ILUXO06sFH?=
 =?us-ascii?Q?1APwQBxYf3qE1pMb3a97nT6d15u7ml/nPX3jCCqBA9E1yvXwzZ3L68xrGVeI?=
 =?us-ascii?Q?BhwW8KS0SjVqzoEDlQCK3LzDFjwaa8tzRp8BnFQQzLmnMCzVFmOI0PNGiVQ0?=
 =?us-ascii?Q?gZdGcsVUb0mUS2rpU+nmKjMX6gdQD4mhH0gobpp9eEI5rkKqkXsFO3ltC6JY?=
 =?us-ascii?Q?W4Qpcu5q2vPEbhlb9Pk8NxXG+tOA58LooZyOyZLZJjLjTHqxB7nAHtDxeJf5?=
 =?us-ascii?Q?qXcpITegBG1Svkf437te8Ye87OspZ/3n594aperl+FmtQIe4J4IJD9hlVw1v?=
 =?us-ascii?Q?TAhRDiHbnV6g3p+A89FoHKPugTiHKAxOAXUVd4u9L+ZoIBFWurAanh1BLAMy?=
 =?us-ascii?Q?vcgLBs43iljm7uWMoOKHQ8esuN2nuWQPRP0gJa91NKqhOVxQbCw1sP8VINi5?=
 =?us-ascii?Q?C9rFuEhTRPOf4W2HObd1GwfyYm1JVRtSQ7iZvq9+ZRo6DlL7nnwZeXDamTrg?=
 =?us-ascii?Q?S982W+0Dwz7oxadRPWyBrPPJwzjos9IfBkMfhapnEsad6Dr89kYTTiHiQQ76?=
 =?us-ascii?Q?2G5hSwfFHOZUUvvPXeGmR6ZcxyJ2O/3p1YIFKsL6tDEWC9RtVUUY5LthrasM?=
 =?us-ascii?Q?mbQnWOUA6R0Aeeg6OAARMdQrSTxLolJp9bm3QZcIAS/Wj8UdD4ZHraYqWrS+?=
 =?us-ascii?Q?8ZLD4orkIghgRgv3lo6qjnqCpU7uUvtg3/KWyzp6wzNMkTgjipaXFc1dHUaW?=
 =?us-ascii?Q?Bz9fEwxGxOKHJIXvKWBWTFAq4L118dAGFGLo7+j0S85NG0ye/peXULe50jNi?=
 =?us-ascii?Q?YIkdBvriDQpdxyBl8HxymDGxDoksC5wfftwjQtH3gcSg9orklQ2q1kPLO6Ax?=
 =?us-ascii?Q?7o+YsFEnEE6XYKIRT4rzYUglRNWhDyrYFQhaRcBwR2XQHsDOBELR/MIvGNYY?=
 =?us-ascii?Q?pjMb3LQ2KFxKVDLUVumx6Q9FPqAxfmHD2esLMYIpMW49+/2AIW5QFugQdOK6?=
 =?us-ascii?Q?jRauBRMsQrC7RJi3UjYRihTXqO8AEOUX1nu7IKoFK5s+pflEBvouqQymGx4V?=
 =?us-ascii?Q?ENQmqW2NHe7tBUzOY4RarwJiq/1+AjKbxK0jUFVGsG78OwLaul4K4kyvAdbI?=
 =?us-ascii?Q?h0tl+hLIkhwr4tD7MiYrlJys1rLwXLLojvJYPUI6jD5zw8BWg0AlwmhLdC0D?=
 =?us-ascii?Q?eWZowCUYT3Lm82MFzyrNyU+Vwff07VW0MuU6LISA+axpUlfavj+qJhdCzkAn?=
 =?us-ascii?Q?BPy/seuf4fLlnyoUznxuOhoPGZvvTuCZX6tEgnvL0nj8y7OfLnkCCmvrSDaH?=
 =?us-ascii?Q?dnwI+AMZBAQFgh+ePSAzDiTy2f1oUzUGl7UHo1d2GKDVpaY1owNM7ANb0LS6?=
 =?us-ascii?Q?0umWMuSz31dGlmhCd5XHaPZB/uUv979ADmjjRS7bBxtt4qvZSBOxHCxICA8U?=
 =?us-ascii?Q?Y61XrAxPZeR69ApxB6C2/6kvYcN4LGcl?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 12:09:10.2868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1521c33c-08cb-421d-3249-08dce07f86a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

When `nouveau_dmem_copy_one` is called, the following error occurs:

[272146.675156] nouveau 0000:06:00.0: fifo: PBDMA9: 00000004 [HCE_PRIV]
ch 1 00000300 00003386

This indicates that a copy push command triggered a Host Copy Engine
Privileged error on channel 1 (Copy Engine channel). To address this
issue, modify the Copy Engine channel to allow privileged push commands

Fixes: 6de125383a5cc
Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..0a75ce4c5021 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(drm, device, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
-- 
2.34.1

