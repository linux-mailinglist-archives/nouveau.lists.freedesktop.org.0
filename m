Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1C9AA3C7F
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C96110E572;
	Tue, 29 Apr 2025 23:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5jwxwUW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2079.outbound.protection.outlook.com [40.107.96.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6741610E565
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaaBK1lTkC/jA4gEFAOlSkk4HvkpiNMraPIufNhUDxOUBU78T8pW6ohHY2+zyRENdPFuTE6qCClmuAV5zVsKEb/olQl34Lro89KYQoRyY3b1bjItA/pU0a8V6Ay2f3aGVNGeUWld+DOEe3xR2pXijiGNFWGXKobJ3YGYJnRbCuGprtD0+SGfi4+e/P/dqQHt5+9soCE3R9RbqAWk8QGt1MuD9Xw0foKxbLmCf3Jlevd2jMN6nb9iMJ3yC04glx6yStq/x6rcglNG/znIOXtxiQkj5ZHu4+kPLhBo0KaJVgPPAb76KEuywZGFGJ/u+b8xvwgPRGkqqewUmiZUpJrtcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYSjejFywWgg8ASWDkXagPbbocdf1ZSaGJFN/z9oF/U=;
 b=K9LbJ4sb2S0zg8xTW1ZKtxAUgbawLpKL27g4NylfyjD2GuGWvAxFAtMUpJ3q+UOQwnmmEQCI2xdWvsmUFAioxobsHA95JWA8Lfqa3QHia1DKshYvwnMHC0v7siPmjYXpm9HVMCuT0q07YxV5wpTgVZ5Wiip5L6LldTVdDrLLPLWz1pIcOn4pljJdgtTjwVkzK7QQvsi305P0QCjiGr0hmDwdfCOKCO0O5aZPSmC/4kZMLHLZ5uxWCRSyAOlwqkS+81vPL0E964//+qoku94Go5IQOzlKHoY3oUrbr9P7rLO+tmTvWV6WBdGIhJZgpiD3OD8i41PMC0wVFtfqF/VcUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYSjejFywWgg8ASWDkXagPbbocdf1ZSaGJFN/z9oF/U=;
 b=t5jwxwUWWdWHcoDn+b2Vss0gP6vqhWpE3P8Ai5CrWivUPdsXzDHVeTG47XRuqgdGV7tgA9CC94SqcL1mDWfrrhk+9MuTQOmL/sh35U1Sv/8Gu2/tCrbaKe8knNj0z13CZILMcxHdaNkWvt3UwqO42/Suaxl6w9GG88GODbiSeFme5r+kel9ktsTl9DbYhQ3CmtzZ3ADPe4yLJUGXIyh1AEUGO3zxM2Bb0sHo/n01HGMdKwSTEoAWP8Yy4LCHqOHxX/f65J+QEXcdUJyp6N+cjP3ZJuc7Zi56WwMa4uw+rRJ3rIPYaJ8aYPF9ERxwmXiirscmLkGVNEqNlIXYY3cYEg==
Received: from MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36) by
 DM4PR12MB8499.namprd12.prod.outlook.com (2603:10b6:8:181::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Tue, 29 Apr 2025 23:40:13 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:907:0:cafe::50) by MW2PR16CA0023.outlook.office365.com
 (2603:10b6:907::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:01 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:59 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 17/60] drm/nouveau/gsp: add channel class id to gpu hal
Date: Wed, 30 Apr 2025 09:38:45 +1000
Message-ID: <20250429233929.24363-18-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DM4PR12MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8a0ba6-6599-4d0d-dbf7-08dd8777300c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hcsGaC0BOtTRssL/VczhZmeY6/K2qR0OMOieBnyd12ZD85urE/4Naw9wI7uc?=
 =?us-ascii?Q?aygk/Ci+n9GcoOUVykUBrzhvSlZbrTIfr0Bgwdw2Su47Q0aMCMO2QWWw65vp?=
 =?us-ascii?Q?fiROCQpRQQAk+DlNLbH5DcATiUP8DfOjzFvsFXpp+jzBTMe+rLibWq6EgZ7v?=
 =?us-ascii?Q?AOLHqUi6+pdmVdXgVZB06epsxaRypfRuQS3sv5xpu2OdcjfFsXCAN9WW3Is6?=
 =?us-ascii?Q?0dL0ahMOhE3QPxUHdQTSyoVmM3kJXxY0bx6WUCxPpGdrQdFIq3oIv4QTHWdD?=
 =?us-ascii?Q?/+XuugJvfjCBoSdcB9FC+x25J39EZvAWC2XsbH637MryHOOp1fUC3mm8HJpe?=
 =?us-ascii?Q?qRMwjCvqUZBrUizDvQARyIQLwTQXuAxYwIR4CqhjyYN3ukRmhvo97muo5xtW?=
 =?us-ascii?Q?TWLdM0Kmr3M+iIfwizFj9soRccXyl65nwTbygygCnVpZEOfadGKVUeXwdb35?=
 =?us-ascii?Q?BA/CC/MXuPJkhvn6tB0Q6UMErgOACMFqKZZVpc/vSrJ3NY/1uf3wphpUWQDI?=
 =?us-ascii?Q?RDwnKU0CE5LRpJqxN2IEm51TEge3iN5Ceko8VIR0qqO5r+5LAtK1TWEsg1c+?=
 =?us-ascii?Q?cKyXfuhJiIN+dW8JGNT4uh8dCYkxW1keDEXmYMM88fZlaraxmW04sRjZ/0XX?=
 =?us-ascii?Q?eMPC/sz8cONNuPwENO3935vU230CkXxBWHKytMFkFhnKJTWjNhF1VH82TtV9?=
 =?us-ascii?Q?SReH/d1qap8QWyJc6mCpjosHZKg1M+mSR5zonoG05fcjjo7owmXLYsXZgbbk?=
 =?us-ascii?Q?+2TsVvWEM0/gi+7lH7ZlGcWFUNs8ur1vUe1qsv8C0Sz/8okMMMcIv2pT6q8V?=
 =?us-ascii?Q?Vd+S5uvQ+cQkvJ3o+jpJCqoUAtpbV3r3sQYDltHvPtNb04mROQeOTrhz4svn?=
 =?us-ascii?Q?kC2e9ApgUlAIOaL9MEWQLqmy8qupTf4MmkJrUCPzSravLNtwMboqVMkYICYH?=
 =?us-ascii?Q?wD5IPNH7zYaW0QLF833F9ojckuQrBAmP/XfVU7Q+EM9egq/eBdbWM4dPjnYs?=
 =?us-ascii?Q?ac3LakJBj31bvoB67d7fNxF/mVJUDQs0+HJpV0FTrL7Xf2GFD8YKM+mOk3zj?=
 =?us-ascii?Q?T9YLXM2GaiimDx0PJePEDg/WTwYMT1/1M2kziikwwTXvCRWxyZuAlWQ6fN4k?=
 =?us-ascii?Q?u5MpsqUVwZdiS2TbFAJuRdqJYSLSsUySZI+Pc8XamS2rFSXjxWfp3U26aQcV?=
 =?us-ascii?Q?10RKbRHzeWjH1FosXv2XnysHytjHQ6d8iLHk66fNdAIgLN9EipS9QVIPRTQm?=
 =?us-ascii?Q?0VO2UIFPMvzCOOeuSdRnLxs17KkbMCrS6BNsmOVKJqbpyX1lHhs7KP6p5jJp?=
 =?us-ascii?Q?e+rv3z+Tiq2BVFoQOIdk7iqbI+dQfz3YACyeja7lKznXvPDyK+K/mSLbNf2n?=
 =?us-ascii?Q?+VcEOzeWEidnM65ZV96hjwQ1Cx3K8WG/wQ9d0ZfuHVcKBfL9sq94EbuVUBCt?=
 =?us-ascii?Q?+GsnflEoO4IhN5OuU0TgAx6sy5OERAgmu88D6C3udFkppSiKYNo/BmFz0klO?=
 =?us-ascii?Q?TTnYrq3p+S3NhB546WA649Te+EK3bdvAWKFJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:13.2517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8a0ba6-6599-4d0d-dbf7-08dd8777300c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8499
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
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c    |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c    |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c    |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h      |  6 ++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 11 ++++-------
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c    |  4 ++++
 6 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index 11fc7bebc065..3f99826466b2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -35,4 +35,8 @@ ad10x_gpu = {
 	},
 
 	.usermode.class = AMPERE_USERMODE_A,
+
+	.fifo.chan = {
+		.class = AMPERE_CHANNEL_GPFIFO_A,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index 692949dca481..1031ec26eb47 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -26,4 +26,8 @@
 const struct nvkm_rm_gpu
 ga100_gpu = {
 	.usermode.class = AMPERE_USERMODE_A,
+
+	.fifo.chan = {
+		.class = AMPERE_CHANNEL_GPFIFO_A,
+	},
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index 00d7aa935ed0..e4f83cf5be7c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -35,4 +35,8 @@ ga1xx_gpu = {
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
index d7436ed95ee2..e3ce8c9b0172 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -35,4 +35,8 @@ tu1xx_gpu = {
 	},
 
 	.usermode.class = TURING_USERMODE_A,
+
+	.fifo.chan = {
+		.class = TURING_CHANNEL_GPFIFO_A,
+	},
 };
-- 
2.49.0

