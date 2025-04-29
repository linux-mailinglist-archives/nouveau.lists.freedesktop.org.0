Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF0AA3C7E
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557E410E55F;
	Tue, 29 Apr 2025 23:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="o5kR8EYK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF9E10E55F
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E76i5Hom0OBC0QDB4GcOZ3tk9efd5Tjj9yHNQFF6F3aqwlF6Tjv1OohyGveoIRE9s9cjxyVyyXmNvZQiGqHVsyF1A8p1p9Jq8+Yfp2DulreoktNJFRM7Vh2yVWPXu99F/MulgIGhGNs3zmmOtK3SR0BmZg+8GvCTDvHKbsnRMLVFXZFswLswl6nZLQLv/fo1/rqjsnAN2bBzaSu3dum0q7eH6zvzQVmvLQqGi/VKYtmzQ479XACGEweG1VPZYfj+sa/JDL0xc1fTt6OYm/cJRY9wzEzZQzCIDjUWs0vqR+wfKbj7SxuFZH+bAgtYOAN747/oHWoGiVa13LF2mwkZqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZuOV/gdDSGSTpDfjnB1BmZCC4m/DZWn4+DV8JVnAqk=;
 b=RRxEQdHlTK2GbMNwQcK9GhN2Pqez+EM4InyJM2pencU+oMqpEMvwnUFZgMtn+C/gYQYNNjdNhsapy8RBNVxUE4fWUEx33xIFAzVTgwtPyWcC3/HjciPxhG87saKZDc83ffH/TfUWcu/k+hYjsUipZUndDi0XuCIxaBY/1OCtbbN5wQzA7a2RrflGNVjiNVJ1aYylZlEUn7X5QRIJU/IR6DiESwSY7KTCqUuwNwNie3TnLSevDmVysmPp3+u9NIIMEW+oyf/3kkNPDXmT7tmQhyYJLa8t5BqKcFhcnahRwjVpIlhHlwnWom5RR13H1VIxH0JCGIJHoAtKSnwRpTVs2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZuOV/gdDSGSTpDfjnB1BmZCC4m/DZWn4+DV8JVnAqk=;
 b=o5kR8EYKh99Olb4wbCpt4roVcjU1Jyb/YT9e2sl3j3uar37ndzqv3nd2MA8SxerTQBsYQPtiFIeVi6gwCmsHljJIyIaQ7bXRhFNYI8YwW1sSLgHEdlLgcNq3RbwXePdRfDit2E2pGubbXdL77ivYf+2px+/h3z1XjPNACY5n3GQQwG7tkB1F4NRXt2lFQ/zl5L1x7QkcI36vCVIt6cCHAOfLHBAbkpLq/U765KwiLa5BreI2y/tU0IBUVRR8LDDr4hqOrjL/R8V7q6sM7tmQd4f1mvFXJvu2+hIi5NkKkHVR1nS/VzAu2piXIJfYEYjObtFKYalzqvz7dvruk7KXUg==
Received: from MW2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:907::45) by
 DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.28; Tue, 29 Apr 2025 23:40:12 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:907:0:cafe::be) by MW2PR16CA0032.outlook.office365.com
 (2603:10b6:907::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:12 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:59 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 16/60] drm/nouveau/gsp: add usermode class id to gpu hal
Date: Wed, 30 Apr 2025 09:38:44 +1000
Message-ID: <20250429233929.24363-17-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffd5664-8030-4716-c927-08dd87772f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RcRCHjlsTD8w4IOtU5Th4V3bEqjOzDwPi9/yAY+Eshl8BD2qwUy8RSbeGaDz?=
 =?us-ascii?Q?rls1JodTgkP+aEw5HTyDByDVQ167yhklzUXBEIJ7qwE+RtTmXJclJpL1R3Hi?=
 =?us-ascii?Q?Fi0ugc4cS0hkU/FquWuuiH9AMvfCNLF+Kqma3c7GKkDFZWF/AmCv4Hms5H3N?=
 =?us-ascii?Q?9ftuZFq9xz6OAH27ohzV9v3FDK/e6nJC87yeBk8cWDB76VP3Sk/MpXNj2/0A?=
 =?us-ascii?Q?7chpIvgwIYLuZyhvE5k9t7Pdprpg2GlbTMwb6x8DjEEbpB0z0fjtxwcNQ/Sk?=
 =?us-ascii?Q?8mX1zdll/idAtsdXhnL9Vb/7FQ/Z5qEf0S4EU0JSMreHMYRDtJ6NHR4Hc6Jw?=
 =?us-ascii?Q?fOU0sz2OSguyLV5q5cwVvCVSWYkaFRaBqDetlxVKWvN2NvAsiK/YrGp+EhwM?=
 =?us-ascii?Q?UR1b7PTHg8enpmDkDAXSYlPO/8As7LnEhdVDKeYw7idBpQDCLsfkNnHWmAhA?=
 =?us-ascii?Q?IxjrxarE/2SGehCf/RjbULZxykK3uidu3z4etR2HD+gnx/G8LDCdXBT3Zl79?=
 =?us-ascii?Q?uc5g5C8GD0BKm1JPRLr0rQiJrwpKSbgKfYuMRbwa/9DRUrE7I3mTweMDYtzD?=
 =?us-ascii?Q?+8pO8QJfQBZ0tFEKL69EYL5xPSXna2NePmAuqEiOlUD4E+mjn2TGMGC3UL4O?=
 =?us-ascii?Q?/dC6zQduQ4fdY5vMZz2iqnru+yxlXpNVowBld0Mahu4hJa8/HN1csLhWZ/ua?=
 =?us-ascii?Q?xxe7aTGjM40xePbKFWm979aDdrV53CGmzbGb0nHXKqOJmpcm3P004njg3Te6?=
 =?us-ascii?Q?4kFahLxAL2Kla0XrQmeZHV3qLryxb0W6zUjmqsqbQq+7gp7WWYp5FBWriuIn?=
 =?us-ascii?Q?epouBPxAE2hyTfaa1yDBemn2eU0lEhpZlD5Po2ZSz4ZjNMU/v1SMVoLvgclr?=
 =?us-ascii?Q?vm8WHkf6KpZYCgvPaqbyEIXxU2AIFnv5KEAzogGC3yBgyei+LNsZoPMNZ1BA?=
 =?us-ascii?Q?IzYg6krpVB/gtPsx/Ec9YUYJ4AtHiFlll62+4N/nGS2T1zfIZAuQLmV++QkB?=
 =?us-ascii?Q?0RhGnQBeSBM8EkwJInH2DKt3AOd7MF64dn2hTSh/sZoSAJqv7TgdugZNd4A2?=
 =?us-ascii?Q?xKt7s4V006ziSChsMG67wbIcc3NmEn8kqrDyfH8WmNd+OY71P66gQEEoU5vA?=
 =?us-ascii?Q?kemL8RYR9cfGlUSduFLfO5e9VRlmcFPOeWCzr5kBsm6YbpxBQYSKwPB/M2GG?=
 =?us-ascii?Q?KHO/hGbSlO+eXw3a1r2v9hJZpOnKYwAea2ssm8716zM/NKJK7n04sLtU06s4?=
 =?us-ascii?Q?6WcPJ/zkbtB3fedv0wL3e+nujRNLrg2Hw8la42G0zzvpzmkBNvBkUJUzdN7N?=
 =?us-ascii?Q?UhYhg69zzH82WRiwhaHeo68heRKX+D5Axc/mdYGYZ7jSRrgzl6m2iHLqQvYZ?=
 =?us-ascii?Q?snZOfi4potbXPgwBDp8o0XmhnYeFzFfqDdP03IQB/b0s6ENopsXXvzYeLE4E?=
 =?us-ascii?Q?Pj4Ij9zAeRJtA0kuACe3nXQwOtL5qK1w6ZTckvx9U3CGnRos71zliMGwAWx9?=
 =?us-ascii?Q?f7GM9B66fCsBQmOy3g/nGcpU3yTNgKMNUpik?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:12.1735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffd5664-8030-4716-c927-08dd87772f6f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
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
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c |  3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h   |  4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/vfn/r535.c     | 11 +++++++++--
 6 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
index db686911a833..11fc7bebc065 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -33,4 +33,6 @@ ad10x_gpu = {
 		.wimm = GA102_DISP_WINDOW_IMM_CHANNEL_DMA,
 		.curs = GA102_DISP_CURSOR,
 	},
+
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
index 527dd3cf4066..692949dca481 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -21,6 +21,9 @@
  */
 #include "gpu.h"
 
+#include <nvif/class.h>
+
 const struct nvkm_rm_gpu
 ga100_gpu = {
+	.usermode.class = AMPERE_USERMODE_A,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
index aedaaceb9127..00d7aa935ed0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -33,4 +33,6 @@ ga1xx_gpu = {
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
index 11254bee828e..d7436ed95ee2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -33,4 +33,6 @@ tu1xx_gpu = {
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

