Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DCAA3CB3
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6136310E5C4;
	Tue, 29 Apr 2025 23:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MGIFN6kg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E16510E5C1
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyRzxRjKIMaWIZ0Ifk3fo5EH+2bdjiNs8aI7m7+dqEJcelZGm1EOkRXeEdXo9gOJ6Oh18ZBtrgYQyhBX6wZDwQ1ySvwmGRvqNUGeO9iKX7Qgu+tPNUxYyOH6SeI3nlqkO/YCZ59RMZ2ZfMm1LHEzMlQNzWfSHTEgsgNxbFeNVsCBPBM1W4m+ae+KT+Qs8Op/F5y2sPl5PZzcImgPt+e9K2fl3d1sQyBbXiD8RFqbNtlcAujlr0wW07JoHSTYdWoDxEKZCAt8N7K4iTnIjSeiO9scTDgCbh70B1LtLJx+XM/BtTf2BzNw3X/ukgWvoqK9Z+WRV4f7ss6E3Espw9SitQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMVvyI+AakYddoQ4W795xupi9ENs/rfksFiyWSaYijg=;
 b=YNjiP4qwcGouyr+ojBQIePe1sKVNguuqOczXITZDHoyILeUvzGp5j9vZsz5DYoOC49msbY6TKazY5N67tbAKodI0Mtkiu/B+rnBC3fpJAjZr5pw0eSVj+aQjGIG8Sh4c7MqruaRc54UKnrxQxcHM/lwmBXcZxBPdUyZbR3jSIbdjbbcm0FjDUGF3LRA+D7dYkk4knuvcQjAj32pn2Gw46bPSjA48ylYnSfGLkp0TGeCZlUCUUSiKdBubYe70UFhSK2sZfrn/XZwOA4ArXjmkAhuHwo1UgBUF9OlYrVdbjW+lOZntc77ZUYCfayKo11L51SPLsEYg7FHizgxGCUqHtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMVvyI+AakYddoQ4W795xupi9ENs/rfksFiyWSaYijg=;
 b=MGIFN6kg8ONvgzaAfKlQsANGfhecXEz4iSkVya0hZ9+zE+kqmyTtjvxiXmRulbC3WrWSrr5+TbCeGNfLXb5/kUBkaNvxd1MsB1bkeGhC/9IGbqKE/c+Y/gwEqcB8WSlCi65EbKDCNOeoWhQr482ZCw7N8u1pNC9bDrCY97cXa3Xwx3OgwMG8w4zl+rUMbvqgRwZBXmEBeNvkLAnPAe8X8atPbO2U8RsRiuQiR5nATMBoXy01MjQdoZhgwsqYUMd8DmewOyY0V8PAiws1EJcNmEwhnrtoL4dajCphjBNLh3N6B43+Hlpfp34sWEoj1apc7U9uN/XQiBug8IoQGuOQIw==
Received: from PH0PR07CA0067.namprd07.prod.outlook.com (2603:10b6:510:f::12)
 by LV3PR12MB9117.namprd12.prod.outlook.com (2603:10b6:408:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:41:03 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::5f) by PH0PR07CA0067.outlook.office365.com
 (2603:10b6:510:f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:41:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:41:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:45 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 54/60] drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling out
 from CHANNEL_DMA
Date: Wed, 30 Apr 2025 09:39:22 +1000
Message-ID: <20250429233929.24363-55-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|LV3PR12MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: f19b9169-d54e-4498-174d-08dd87774d91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0IsTIjuBoZtcjGoBiEWKrUcZOXZas5sGhaZMrEUMWk/C+Ht82Kn5Bo8bpV0n?=
 =?us-ascii?Q?DZN0KCHoq5NvWXkSvTBxzaes46U6iBWHzgONnYq1odZKZiExBwRMXl2K4/Lb?=
 =?us-ascii?Q?8yaiM6oDSTlAqCfE2MP8fjKTnLef/42L4u5EB6d225sK4dd4dbhzNLv8w8q1?=
 =?us-ascii?Q?KgU4Tfo95xMYONGFaUZlG3ugwZyqI86+rH3RrFIDDJB4vXd2pOa96D0rmRao?=
 =?us-ascii?Q?Rlv6U8vBv2XZ+RgJyfcJjXWq4u6wS0cxqJQzy+gor8NTOmStbGdH1v9jZIrc?=
 =?us-ascii?Q?EZnraP0pO5wLBDZ72eccuENC3HA8wJ0X4mT1WNn2BRjJmY9tANX1kymNoQx+?=
 =?us-ascii?Q?8i7bCnIZE7eBqR/kIOH39R8U7FiQmVgkwlQM6STmwsIIbbdHGY5UQVbVHzfe?=
 =?us-ascii?Q?+RI6la6rUXIhU+Pad+IVuWSbFx4E7vELnVNIz9Jbvo6qXcOS63z2tiN85ln5?=
 =?us-ascii?Q?gXKO/tcZjKAHssyiUD6uTNYaT+aheBi03n+UxExMbX2maEjbCnkUtg9bmF0I?=
 =?us-ascii?Q?SjYPSvYdnDWk27pTUCGrrW64PHqbPwivSOfqvO787Q+ihl+ogA1p7Iu0tT+7?=
 =?us-ascii?Q?TMinMYeqlDTwY23LGq151sHx8Rgxc2IBgKc5vbCojiNnwMjjlpvGxalpChJf?=
 =?us-ascii?Q?QBbBq/wwwGuJ6H5TJ7io+nM9tuf8G3rtc3c21VUSUAg7/klhdxd0hi0i97HQ?=
 =?us-ascii?Q?zObTSRynWi46Cy7CK5bOpFMUhui+cHFwF8nEM4rXoOo/FdR4WlFUhDnyHcwE?=
 =?us-ascii?Q?fz4inIWVgAzFYWnz3DQmdZUjqCsrEG3o9IC2SRqn3xsePbr27H9M81pOtBrO?=
 =?us-ascii?Q?1hXhKWs0DxChsU/n/ZQ8qjZyk/101xeX1WHn9V33Xeo60+ynrYn5aWjQBOF+?=
 =?us-ascii?Q?awNGWVupUDiIA5kuZWUGWZ/hAU5h8BS8QI5oo3aOIVXY41tEPKgWbCbpu9Js?=
 =?us-ascii?Q?gEisVp2AjmVwQrcMN9rT/tv1NbJlc5GtRyOlUMxmkc1tZgCWmI5FFb9fKQp0?=
 =?us-ascii?Q?ZHEvNbbJ/zHILr+d21FLfnbMQsdoKgoA+2G+vS8xaj8442JGK/EI/M3S1U4o?=
 =?us-ascii?Q?NfoI7pF71Zjl6FgI++bZDLRLesCMG+LV8Zu79TGXWcw9kmS/vEiDrUpAgYWM?=
 =?us-ascii?Q?Ejxm4/jBeeeB9OaSoSCejbFDFiPVkASrcSBWLRm8MrPBsJwzkgHJH/l1PzBB?=
 =?us-ascii?Q?2YnBf67PsHjvObfZkSZmgrMTl0zPCxoukljJRRRIs88ciulPvz5LV5oczsma?=
 =?us-ascii?Q?cDqo80jIA8UHfaB6+E3w63bqRKFX2ieHnyhiSEtWyewbcCbmsdb6uwx8HUT6?=
 =?us-ascii?Q?ymgHrqPKlnerIAFOo0VM994G1e3y8EjNMRpcnD0fGq1iRs7a0l+9wT0TlDqB?=
 =?us-ascii?Q?k/5Cy7MWIgnkFuG8hPNyTDFtM69+2/gJPMfNL50jswFEyPPS75Bis/3fSeju?=
 =?us-ascii?Q?hfApSlnmVXu6goAJY/ftDLxHDrdoAYGkQ7q/ze62ZF3Dp1suAFMBSMtTEcX4?=
 =?us-ascii?Q?J4lZxEg6iK643Vn/NwhgarJ/CPbqFR3xx7sA?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:41:02.7317 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f19b9169-d54e-4498-174d-08dd87774d91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9117
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

Primarily a cleanup to allow for changes in newer CHANNEL_GPFIFO classes
to be more easily implemented.

Compared to the prior implementation, this submits userspace push buffer
segments as subroutines and uses the NV_RAMUSERD_TOP_LEVEL_GET registers
to track the main (kernel) push buffer progress.

Fixes a number of sporadic failures seen during piglit runs.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  56 +++++++
 drivers/gpu/drm/nouveau/include/nvif/object.h |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/push.h   |  14 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  31 ++--
 drivers/gpu/drm/nouveau/nouveau_chan.h        |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c         | 103 +------------
 drivers/gpu/drm/nouveau/nouveau_dma.h         |  13 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  10 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   8 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild           |   5 +
 drivers/gpu/drm/nouveau/nvif/chan.c           | 144 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nvif/chan506f.c       |  89 +++++++++++
 drivers/gpu/drm/nouveau/nvif/chanc36f.c       |  56 +++++++
 14 files changed, 395 insertions(+), 149 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/chan.h
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan506f.c
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chanc36f.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/chan.h b/drivers/gpu/drm/nouveau/include/nvif/chan.h
new file mode 100644
index 000000000000..c1f7a8fce05b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/chan.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVIF_CHAN_H__
+#define __NVIF_CHAN_H__
+#include "push.h"
+
+struct nvif_chan {
+	const struct nvif_chan_func {
+		struct {
+			u32 (*read_get)(struct nvif_chan *);
+		} push;
+
+		struct {
+			u32 (*read_get)(struct nvif_chan *);
+			void (*push)(struct nvif_chan *, bool main, u64 addr, u32 size,
+				     bool no_prefetch);
+			void (*kick)(struct nvif_chan *);
+		} gpfifo;
+	} *func;
+
+	struct {
+		struct nvif_map map;
+	} userd;
+
+	struct {
+		struct nvif_map map;
+		u32 cur;
+		u32 max;
+		int free;
+	} gpfifo;
+
+	struct nvif_push push;
+
+	struct nvif_user *usermode;
+	u32 doorbell_token;
+};
+
+int nvif_chan_dma_wait(struct nvif_chan *, u32 push_nr);
+
+void nvif_chan_gpfifo_ctor(const struct nvif_chan_func *, void *userd, void *gpfifo, u32 gpfifo_size,
+			   void *push, u64 push_addr, u32 push_size, struct nvif_chan *);
+int nvif_chan_gpfifo_wait(struct nvif_chan *, u32 gpfifo_nr, u32 push_nr);
+void nvif_chan_gpfifo_push(struct nvif_chan *, u64 addr, u32 size, bool no_prefetch);
+
+int nvif_chan506f_ctor(struct nvif_chan *, void *userd, void *gpfifo, u32 gpfifo_size,
+		       void *push, u64 push_addr, u32 push_size);
+u32 nvif_chan506f_read_get(struct nvif_chan *);
+u32 nvif_chan506f_gpfifo_read_get(struct nvif_chan *);
+void nvif_chan506f_gpfifo_push(struct nvif_chan *, bool main, u64 addr, u32 size, bool no_prefetch);
+
+int nvif_chanc36f_ctor(struct nvif_chan *, void *userd, void *gpfifo, u32 gpfifo_size,
+		       void *push, u64 push_addr, u32 push_size,
+		       struct nvif_user *usermode, u32 doorbell_token);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 8d205b6af46a..1b32dc701f61 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -16,7 +16,7 @@ struct nvif_object {
 	u32 handle;
 	s32 oclass;
 	void *priv; /*XXX: hack */
-	struct {
+	struct nvif_map {
 		void __iomem *ptr;
 		u64 size;
 	} map;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/push.h b/drivers/gpu/drm/nouveau/include/nvif/push.h
index 6d3a8a3d2087..a493fababe3c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/push.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/push.h
@@ -31,6 +31,12 @@ struct nvif_push {
 	void (*kick)(struct nvif_push *push);
 
 	struct nvif_mem mem;
+	u64 addr;
+
+	struct {
+		u32 get;
+		u32 max;
+	} hw;
 
 	u32 *bgn;
 	u32 *cur;
@@ -41,7 +47,7 @@ struct nvif_push {
 static inline __must_check int
 PUSH_WAIT(struct nvif_push *push, u32 size)
 {
-	if (push->cur + size >= push->end) {
+	if (push->cur + size > push->end) {
 		int ret = push->wait(push, size);
 		if (ret)
 			return ret;
@@ -55,7 +61,11 @@ PUSH_WAIT(struct nvif_push *push, u32 size)
 static inline int
 PUSH_KICK(struct nvif_push *push)
 {
-	push->kick(push);
+	if (push->cur != push->bgn) {
+		push->kick(push);
+		push->bgn = push->cur;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index df11d085ae24..10daa829bad5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -416,7 +416,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	if (nouveau_cli_uvmm(cli)) {
 		ret = nouveau_sched_create(&chan->sched, drm, drm->sched_wq,
-					   chan->chan->dma.ib_max);
+					   chan->chan->chan.gpfifo.max);
 		if (ret)
 			goto done;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 4b4bbbd8d7b7..ad1e99184f7a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -424,25 +424,24 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise dma tracking parameters */
-	switch (chan->user.oclass) {
-	case NV03_CHANNEL_DMA:
-	case NV10_CHANNEL_DMA:
-	case NV17_CHANNEL_DMA:
-	case NV40_CHANNEL_DMA:
+	if (chan->user.oclass < NV50_CHANNEL_GPFIFO) {
 		chan->user_put = 0x40;
 		chan->user_get = 0x44;
 		chan->dma.max = (0x10000 / 4) - 2;
-		break;
-	default:
-		chan->user_put = 0x40;
-		chan->user_get = 0x44;
-		chan->user_get_hi = 0x60;
-		chan->dma.ib_base =  0x10000 / 4;
-		chan->dma.ib_max  = NV50_DMA_IB_MAX;
-		chan->dma.ib_put  = 0;
-		chan->dma.ib_free = chan->dma.ib_max - chan->dma.ib_put;
-		chan->dma.max = chan->dma.ib_base;
-		break;
+	} else
+	if (chan->user.oclass < VOLTA_CHANNEL_GPFIFO_A) {
+		ret = nvif_chan506f_ctor(&chan->chan, chan->userd->map.ptr,
+					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000);
+		if (ret)
+			return ret;
+	} else {
+		ret = nvif_chanc36f_ctor(&chan->chan, chan->userd->map.ptr,
+					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 &drm->client.device.user, chan->token);
+		if (ret)
+			return ret;
 	}
 
 	chan->dma.put = 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 016f668c0bc1..ea8c3cdab46f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -3,13 +3,11 @@
 #define __NOUVEAU_CHAN_H__
 #include <nvif/object.h>
 #include <nvif/event.h>
-#include <nvif/push.h>
+#include <nvif/chan.h>
 struct nvif_device;
 
 struct nouveau_channel {
-	struct {
-		struct nvif_push push;
-	} chan;
+	struct nvif_chan chan;
 
 	struct nouveau_cli *cli;
 	struct nouveau_vmm *vmm;
@@ -41,12 +39,7 @@ struct nouveau_channel {
 		int free;
 		int cur;
 		int put;
-		int ib_base;
-		int ib_max;
-		int ib_free;
-		int ib_put;
 	} dma;
-	u32 user_get_hi;
 	u32 user_get;
 	u32 user_put;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index a1f329ef0641..017a803121d4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -43,8 +43,6 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_get, int *timeout)
 	uint64_t val;
 
 	val = nvif_rd32(chan->userd, chan->user_get);
-        if (chan->user_get_hi)
-		val |= (uint64_t)nvif_rd32(chan->userd, chan->user_get_hi) << 32;
 
 	/* reset counter as long as GET is still advancing, this is
 	 * to avoid misdetecting a GPU lockup if the GPU happens to
@@ -68,111 +66,12 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_get, int *timeout)
 	return (val - chan->push.addr) >> 2;
 }
 
-void
-nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
-	      bool no_prefetch)
-{
-	struct nvif_user *user = &chan->cli->drm->client.device.user;
-	struct nouveau_bo *pb = chan->push.buffer;
-	int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
-
-	BUG_ON(chan->dma.ib_free < 1);
-	WARN_ON(length > NV50_DMA_PUSH_MAX_LENGTH);
-
-	nouveau_bo_wr32(pb, ip++, lower_32_bits(offset));
-	nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8 |
-			(no_prefetch ? (1 << 31) : 0));
-
-	chan->dma.ib_put = (chan->dma.ib_put + 1) & chan->dma.ib_max;
-
-	mb();
-	/* Flush writes. */
-	nouveau_bo_rd32(pb, 0);
-
-	nvif_wr32(chan->userd, 0x8c, chan->dma.ib_put);
-	if (user->func && user->func->doorbell)
-		user->func->doorbell(user, chan->token);
-	chan->dma.ib_free--;
-}
-
-static int
-nv50_dma_push_wait(struct nouveau_channel *chan, int count)
-{
-	uint32_t cnt = 0, prev_get = 0;
-
-	while (chan->dma.ib_free < count) {
-		uint32_t get = nvif_rd32(chan->userd, 0x88);
-		if (get != prev_get) {
-			prev_get = get;
-			cnt = 0;
-		}
-
-		if ((++cnt & 0xff) == 0) {
-			udelay(1);
-			if (cnt > 100000)
-				return -EBUSY;
-		}
-
-		chan->dma.ib_free = get - chan->dma.ib_put;
-		if (chan->dma.ib_free <= 0)
-			chan->dma.ib_free += chan->dma.ib_max;
-	}
-
-	return 0;
-}
-
-static int
-nv50_dma_wait(struct nouveau_channel *chan, int slots, int count)
-{
-	uint64_t prev_get = 0;
-	int ret, cnt = 0;
-
-	ret = nv50_dma_push_wait(chan, slots + 1);
-	if (unlikely(ret))
-		return ret;
-
-	while (chan->dma.free < count) {
-		int get = READ_GET(chan, &prev_get, &cnt);
-		if (unlikely(get < 0)) {
-			if (get == -EINVAL)
-				continue;
-
-			return get;
-		}
-
-		if (get <= chan->dma.cur) {
-			chan->dma.free = chan->dma.max - chan->dma.cur;
-			if (chan->dma.free >= count)
-				break;
-
-			FIRE_RING(chan);
-			do {
-				get = READ_GET(chan, &prev_get, &cnt);
-				if (unlikely(get < 0)) {
-					if (get == -EINVAL)
-						continue;
-					return get;
-				}
-			} while (get == 0);
-			chan->dma.cur = 0;
-			chan->dma.put = 0;
-		}
-
-		chan->dma.free = get - chan->dma.cur - 1;
-	}
-
-	return 0;
-}
-
 int
-nouveau_dma_wait(struct nouveau_channel *chan, int slots, int size)
+nouveau_dma_wait(struct nouveau_channel *chan, int size)
 {
 	uint64_t prev_get = 0;
 	int cnt = 0, get;
 
-	if (chan->dma.ib_max)
-		return nv50_dma_wait(chan, slots, size);
-
 	while (chan->dma.free < size) {
 		get = READ_GET(chan, &prev_get, &cnt);
 		if (unlikely(get == -EBUSY))
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index c52cda82353e..0e27b76d1e1c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -30,9 +30,7 @@
 #include "nouveau_bo.h"
 #include "nouveau_chan.h"
 
-int nouveau_dma_wait(struct nouveau_channel *, int slots, int size);
-void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
-		   bool no_prefetch);
+int nouveau_dma_wait(struct nouveau_channel *, int size);
 
 /*
  * There's a hw race condition where you can't jump to your PUT offset,
@@ -67,7 +65,7 @@ RING_SPACE(struct nouveau_channel *chan, int size)
 {
 	int ret;
 
-	ret = nouveau_dma_wait(chan, 1, size);
+	ret = nouveau_dma_wait(chan, size);
 	if (ret)
 		return ret;
 
@@ -94,12 +92,7 @@ FIRE_RING(struct nouveau_channel *chan)
 		return;
 	chan->accel_done = true;
 
-	if (chan->dma.ib_max) {
-		nv50_dma_push(chan, chan->push.addr + (chan->dma.put << 2),
-			      (chan->dma.cur - chan->dma.put) << 2, false);
-	} else {
-		WRITE_PUT(chan->dma.cur);
-	}
+	WRITE_PUT(chan->dma.cur);
 
 	chan->dma.put = chan->dma.cur;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index a0b5f1b16e8b..eac7cf8940a3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -10,6 +10,8 @@
 #include "nouveau_sched.h"
 #include "nouveau_uvmm.h"
 
+#include <nvif/class.h>
+
 /**
  * DOC: Overview
  *
@@ -131,7 +133,7 @@ nouveau_exec_job_run(struct nouveau_job *job)
 	struct nouveau_fence *fence = exec_job->fence;
 	int i, ret;
 
-	ret = nouveau_dma_wait(chan, exec_job->push.count + 1, 16);
+	ret = nvif_chan_gpfifo_wait(&chan->chan, exec_job->push.count + 1, 16);
 	if (ret) {
 		NV_PRINTK(err, job->cli, "nv50cal_space: %d\n", ret);
 		return ERR_PTR(ret);
@@ -141,7 +143,7 @@ nouveau_exec_job_run(struct nouveau_job *job)
 		struct drm_nouveau_exec_push *p = &exec_job->push.s[i];
 		bool no_prefetch = p->flags & DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH;
 
-		nv50_dma_push(chan, p->va, p->va_len, no_prefetch);
+		nvif_chan_gpfifo_push(&chan->chan, p->va, p->va_len, no_prefetch);
 	}
 
 	ret = nouveau_fence_emit(fence);
@@ -375,10 +377,10 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	if (unlikely(atomic_read(&chan->killed)))
 		return nouveau_abi16_put(abi16, -ENODEV);
 
-	if (!chan->dma.ib_max)
+	if (chan->user.oclass < NV50_CHANNEL_GPFIFO)
 		return nouveau_abi16_put(abi16, -ENOSYS);
 
-	push_max = nouveau_exec_push_max_from_ib_max(chan->dma.ib_max);
+	push_max = nouveau_exec_push_max_from_ib_max(chan->chan.gpfifo.max);
 	if (unlikely(req->push_count > push_max)) {
 		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
 			  req->push_count, push_max);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 67e3c99de73a..5877545c2c50 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -850,8 +850,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	}
 
-	if (chan->dma.ib_max) {
-		ret = nouveau_dma_wait(chan, req->nr_push + 1, 16);
+	if (chan->user.oclass >= NV50_CHANNEL_GPFIFO) {
+		ret = nvif_chan_gpfifo_wait(&chan->chan, req->nr_push + 1, 16);
 		if (ret) {
 			NV_PRINTK(err, cli, "nv50cal_space: %d\n", ret);
 			goto out;
@@ -864,7 +864,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			u32 length = push[i].length & ~NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
 			bool no_prefetch = push[i].length & NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
 
-			nv50_dma_push(chan, addr, length, no_prefetch);
+			nvif_chan_gpfifo_push(&chan->chan, addr, length, no_prefetch);
 		}
 	} else
 	if (drm->client.device.info.chipset >= 0x25) {
@@ -958,7 +958,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 	u_free(push);
 
 out_next:
-	if (chan->dma.ib_max) {
+	if (chan->user.oclass >= NV50_CHANNEL_GPFIFO) {
 		req->suffix0 = 0x00000000;
 		req->suffix1 = 0x00000000;
 	} else
diff --git a/drivers/gpu/drm/nouveau/nvif/Kbuild b/drivers/gpu/drm/nouveau/nvif/Kbuild
index b7963a39dd91..991722951fbb 100644
--- a/drivers/gpu/drm/nouveau/nvif/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvif/Kbuild
@@ -14,6 +14,11 @@ nvif-y += nvif/outp.o
 nvif-y += nvif/timer.o
 nvif-y += nvif/vmm.o
 
+# Channel classes
+nvif-y += nvif/chan.o
+nvif-y += nvif/chan506f.o
+nvif-y += nvif/chanc36f.o
+
 # Usermode classes
 nvif-y += nvif/user.o
 nvif-y += nvif/userc361.o
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
new file mode 100644
index 000000000000..6fe14dfe73bc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -0,0 +1,144 @@
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
+#include <nvif/chan.h>
+
+static void
+nvif_chan_gpfifo_push_kick(struct nvif_push *push)
+{
+	struct nvif_chan *chan = container_of(push, typeof(*chan), push);
+	u32 put = push->bgn - (u32 *)chan->push.mem.object.map.ptr;
+	u32 cnt = push->cur - push->bgn;
+
+	chan->func->gpfifo.push(chan, true, chan->push.addr + (put << 2), cnt << 2, false);
+	chan->func->gpfifo.kick(chan);
+}
+
+static int
+nvif_chan_gpfifo_push_wait(struct nvif_push *push, u32 push_nr)
+{
+	struct nvif_chan *chan = container_of(push, typeof(*chan), push);
+
+	return nvif_chan_gpfifo_wait(chan, 1, push_nr);
+}
+
+void
+nvif_chan_gpfifo_push(struct nvif_chan *chan, u64 addr, u32 size, bool no_prefetch)
+{
+	chan->func->gpfifo.push(chan, false, addr, size, no_prefetch);
+}
+
+int
+nvif_chan_gpfifo_wait(struct nvif_chan *chan, u32 gpfifo_nr, u32 push_nr)
+{
+	struct nvif_push *push = &chan->push;
+	int ret = 0, time = 1000000;
+
+	/* Account for the GPFIFO entry needed to submit pushbuf. */
+	if (push_nr)
+		gpfifo_nr++;
+
+	/* Wait for space in main push buffer. */
+	if (push->cur + push_nr > push->end) {
+		ret = nvif_chan_dma_wait(chan, push_nr);
+		if (ret)
+			return ret;
+	}
+
+	/* Wait for GPFIFO space. */
+	while (chan->gpfifo.free < gpfifo_nr) {
+		chan->gpfifo.free = chan->func->gpfifo.read_get(chan) - chan->gpfifo.cur - 1;
+		if (chan->gpfifo.free < 0)
+			chan->gpfifo.free += chan->gpfifo.max + 1;
+
+		if (chan->gpfifo.free < gpfifo_nr) {
+			if (!time--)
+				return -ETIMEDOUT;
+			udelay(1);
+		}
+	}
+
+	return 0;
+}
+
+void
+nvif_chan_gpfifo_ctor(const struct nvif_chan_func *func, void *userd, void *gpfifo, u32 gpfifo_size,
+		      void *push, u64 push_addr, u32 push_size, struct nvif_chan *chan)
+{
+	chan->func = func;
+
+	chan->userd.map.ptr = userd;
+
+	chan->gpfifo.map.ptr = gpfifo;
+	chan->gpfifo.max = (gpfifo_size >> 3) - 1;
+	chan->gpfifo.free = chan->gpfifo.max;
+
+	chan->push.mem.object.map.ptr = push;
+	chan->push.wait = nvif_chan_gpfifo_push_wait;
+	chan->push.kick = nvif_chan_gpfifo_push_kick;
+	chan->push.addr = push_addr;
+	chan->push.hw.max = push_size >> 2;
+	chan->push.bgn = chan->push.cur = chan->push.end = push;
+}
+
+int
+nvif_chan_dma_wait(struct nvif_chan *chan, u32 nr)
+{
+	struct nvif_push *push = &chan->push;
+	u32 cur = push->cur - (u32 *)push->mem.object.map.ptr;
+	u32 free, time = 1000000;
+
+	do {
+		u32 get = chan->func->push.read_get(chan);
+
+		if (get <= cur) {
+			free = push->hw.max - cur;
+			if (free >= nr)
+				break;
+
+			PUSH_KICK(push);
+
+			while (get == 0) {
+				get = chan->func->push.read_get(chan);
+				if (get == 0) {
+					if (!time--)
+						return -ETIMEDOUT;
+					udelay(1);
+				}
+			}
+
+			cur = 0;
+		}
+
+		free = get - cur - 1;
+
+		if (free < nr) {
+			if (!time--)
+				return -ETIMEDOUT;
+			udelay(1);
+		}
+	} while (free < nr);
+
+	push->bgn = (u32 *)push->mem.object.map.ptr + cur;
+	push->cur = push->bgn;
+	push->end = push->bgn + free;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvif/chan506f.c b/drivers/gpu/drm/nouveau/nvif/chan506f.c
new file mode 100644
index 000000000000..b08aafcb8ed6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chan506f.c
@@ -0,0 +1,89 @@
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
+#include <nvif/chan.h>
+
+static void
+nvif_chan506f_gpfifo_kick(struct nvif_chan *chan)
+{
+	wmb();
+	nvif_wr32(&chan->userd, 0x8c, chan->gpfifo.cur);
+}
+
+void
+nvif_chan506f_gpfifo_push(struct nvif_chan *chan, bool main, u64 addr, u32 size, bool no_prefetch)
+{
+	u32 gpptr = chan->gpfifo.cur << 3;
+
+	if (WARN_ON(!chan->gpfifo.free))
+		return;
+
+	nvif_wr32(&chan->gpfifo, gpptr + 0, lower_32_bits(addr));
+	nvif_wr32(&chan->gpfifo, gpptr + 4, upper_32_bits(addr) |
+					    (main ? 0 : BIT(9)) |
+					    (size >> 2) << 10 |
+					    (no_prefetch ? BIT(31) : 0));
+
+	chan->gpfifo.cur = (chan->gpfifo.cur + 1) & chan->gpfifo.max;
+	chan->gpfifo.free--;
+	if (!chan->gpfifo.free)
+		chan->push.end = chan->push.cur;
+}
+
+u32
+nvif_chan506f_gpfifo_read_get(struct nvif_chan *chan)
+{
+	return nvif_rd32(&chan->userd, 0x88);
+}
+
+u32
+nvif_chan506f_read_get(struct nvif_chan *chan)
+{
+	u32 tlgetlo = nvif_rd32(&chan->userd, 0x58);
+	u32 tlgethi = nvif_rd32(&chan->userd, 0x5c);
+	struct nvif_push *push = &chan->push;
+
+	/* Update cached GET pointer if TOP_LEVEL_GET is valid. */
+	if (tlgethi & BIT(31)) {
+		u64 tlget = ((u64)(tlgethi & 0xff) << 32) | tlgetlo;
+
+		push->hw.get = (tlget - push->addr) >> 2;
+	}
+
+	return push->hw.get;
+}
+
+static const struct nvif_chan_func
+nvif_chan506f = {
+	.push.read_get = nvif_chan506f_read_get,
+	.gpfifo.read_get = nvif_chan506f_gpfifo_read_get,
+	.gpfifo.push = nvif_chan506f_gpfifo_push,
+	.gpfifo.kick = nvif_chan506f_gpfifo_kick,
+};
+
+int
+nvif_chan506f_ctor(struct nvif_chan *chan, void *userd, void *gpfifo, u32 gpfifo_size,
+		   void *push, u64 push_addr, u32 push_size)
+{
+	nvif_chan_gpfifo_ctor(&nvif_chan506f, userd, gpfifo, gpfifo_size,
+			      push, push_addr, push_size, chan);
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvif/chanc36f.c b/drivers/gpu/drm/nouveau/nvif/chanc36f.c
new file mode 100644
index 000000000000..cb697eee03f2
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chanc36f.c
@@ -0,0 +1,56 @@
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
+#include <nvif/chan.h>
+#include <nvif/user.h>
+
+static void
+nvif_chanc36f_gpfifo_kick(struct nvif_chan *chan)
+{
+	struct nvif_user *usermode = chan->usermode;
+
+	nvif_wr32(&chan->userd, 0x8c, chan->gpfifo.cur);
+
+	wmb(); /* ensure CPU writes are flushed to BAR1 */
+	nvif_rd32(&chan->userd, 0); /* ensure BAR1 writes are flushed to vidmem */
+
+	usermode->func->doorbell(usermode, chan->doorbell_token);
+}
+
+static const struct nvif_chan_func
+nvif_chanc36f = {
+	.push.read_get = nvif_chan506f_read_get,
+	.gpfifo.read_get = nvif_chan506f_gpfifo_read_get,
+	.gpfifo.push = nvif_chan506f_gpfifo_push,
+	.gpfifo.kick = nvif_chanc36f_gpfifo_kick,
+};
+
+int
+nvif_chanc36f_ctor(struct nvif_chan *chan, void *userd, void *gpfifo, u32 gpfifo_size,
+		   void *push, u64 push_addr, u32 push_size,
+		   struct nvif_user *usermode, u32 doorbell_token)
+{
+	nvif_chan_gpfifo_ctor(&nvif_chanc36f, userd, gpfifo, gpfifo_size,
+			      push, push_addr, push_size, chan);
+	chan->usermode = usermode;
+	chan->doorbell_token = doorbell_token;
+	return 0;
+}
-- 
2.49.0

