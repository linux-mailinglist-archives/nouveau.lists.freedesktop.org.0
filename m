Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3447ABA731
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5532910EBE7;
	Sat, 17 May 2025 00:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="okCxWhMy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD1210EBE7
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdDQkTR17nxVsNablUZUC1EHd2PTYrNUU741wSCDDGmQNiIEFmJXDMWYjDQwKz5pen/kOiCgYhF/U0hbU/zNao2yjzb59gEkq8yGq8JMVcIEPxwcVmrRo6mirMQkDHkXrg2T9Qwu+RKYdeVFxpIkKVRh/ueC/9g4ZZODcoYM8sh7NjdaMKtOhmLl6uN0ys6zcuX0fZe1uFSy78JGfZPekLKq0/S4COYmwn3ADFs24sV/PVsuoRAmf+lEaMW6xLNErJ+PYXWC4SkfHZZysCV9GtNmrsJuyJaahpN60RwhNgFsN+NYmpWdRRAFNnJPOo4my1xbYBd3PCMcJ7Ooi1tiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqFctlfCR0IT2P91ENl5XfTnOrSlyJaMNNIaoA1hlik=;
 b=xRSesm8wTZzslUIv8q65MhBVIlUqE7oYXT5knuWPGJGmb3Jz5ipczW+BtpBdjOSnpPOYI9gEln67U+ZL17a2TwrIJMX4xJ81B5xXPRP3mLCZSCX4zJe/FnuLMRVLl2i2yJZGZFmY34Y3qJulgabVO/7jtkSxP338rFD+87i/PqnL3+JCm2pXGV4/WQVBuwAzSXFzX/MbGT7iBpiMfA4OvdwKoBtOVyXRsrQEtOPuKIYe8pjw7+fjPQVFln3B66aunfjFqjiNl4jMivPu79Yvxus7kPjqU/4+UKTVuNTGbyrSuTMVgfp186c0ooegw2pKwmrsulvbHqVShDXnLnj6eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqFctlfCR0IT2P91ENl5XfTnOrSlyJaMNNIaoA1hlik=;
 b=okCxWhMyt3IWUXVM50jp+8LyD7Y4GfrHklhdLnL69fWx8di8sIUW63Zp7FFNNozqXpMJVZrEBa4q1qAmuLjuKcs/24cOsGtB4NM5tt/M6uobRPKGqielx8GIpN8PXLYSsBuTFLxkAWS7/J+7dMPR8BmMl1pDlwfd7sVLvYuhnmMAmZ3tttJLt0IisXJYFLSvHkp71D8qpYypQ4xXfAuxD/iZVzikDHIJKjV8G7wru/1IjMznQenVrolbELe+KqnDHc8BNsMk6Y1ePL3w/AZcN+Y1uROfz6JFsSxVOhuQK6t8eDDULE9YvTyNsURInYnM2CjmuQXY3OklD0uqXd4BLg==
Received: from CH2PR18CA0004.namprd18.prod.outlook.com (2603:10b6:610:4f::14)
 by IA1PR12MB6305.namprd12.prod.outlook.com (2603:10b6:208:3e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:44 +0000
Received: from CH2PEPF00000147.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::a0) by CH2PR18CA0004.outlook.office365.com
 (2603:10b6:610:4f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sat,
 17 May 2025 00:11:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000147.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:30 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 56/62] drm/nouveau/nv50-: separate CHANNEL_GPFIFO handling
 out from CHANNEL_DMA
Date: Sat, 17 May 2025 10:09:48 +1000
Message-ID: <20250517000954.35691-57-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000147:EE_|IA1PR12MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: b26695bf-7ea6-4334-9f17-08dd94d76807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RUhPamjQHCjTEryG81lOhfucryov4/rDa+yVvyE+qospCBt/6HJ5INiuy7le?=
 =?us-ascii?Q?SN5Poiw2ZHCepoVFUtunXXIvhLRXUXNKzOTpg1ZlwwUwqI9VQxa1CCxJAHsE?=
 =?us-ascii?Q?5BZ2sNojKqOaaplpJ16MwWc4aKvcHDOxH/CtJ3metHWIi77VqncG+aKpZTdO?=
 =?us-ascii?Q?jwM5jVHauriU6blMBSYtg1yo5iI0X/9KbrOu+TH5iLZZANEdUX52V/kuuXtB?=
 =?us-ascii?Q?DWHGinYPedjhhtRIMkewxVFrBTx3TiBEUp8bGViy7lLNMZP4DoKzXF/0Txis?=
 =?us-ascii?Q?s5T5jVkYqyc8GhQF65JeLnM7e+ogu8Ob519n3Nzbd5Hg4vhvl/3LHrJob1CC?=
 =?us-ascii?Q?Ju/HpNCvAcEmVDMHTPlQswZRsohFr/TBY0PPBhmu7Ei2Rpku0+/qQUYzcJQo?=
 =?us-ascii?Q?WBKc9CaNZhn9CuhctoSAC0yM68IkSvXf46McBZ9m46H1DQ8O0BVDnEb+51E2?=
 =?us-ascii?Q?00cjnnykUkXf8euyYDB+oHUMl8bWzm3OZj0HLUISlv563KbCVx3mB5PVCpnx?=
 =?us-ascii?Q?UlMFfunj14LZcMuqRtXn6QrErdu6VIF16HAjcu3Dr09jPmV30JVj6duPGQoy?=
 =?us-ascii?Q?9JNJioCwZsOqUZZPencwYwjo5eA9IXPmomMRB27pSgVjeiKDjtkJkCpRoE6C?=
 =?us-ascii?Q?eQkvCUeWW8Bxe74A1x7bQ4BTdN9rfU1kQIe0k4uRkzQzaBsUGlZh+XTeKTXd?=
 =?us-ascii?Q?s8WWB1qOQRvPBu/9weV4tU9Mutgu/9kqjBfu/07akYAMHaQYzWDZRWf5vmCD?=
 =?us-ascii?Q?nlHaQTqoW2uf/RfOMlAqkyGs9VJ6rg1jm17Zc2zwpfsDq9tt9WfXhw/om5Eu?=
 =?us-ascii?Q?jAty0IAPPn1dBkkzVYlC8yPMx/hrFFsYC2OQfW1ejm77UoCLPq9jcqYxiGGp?=
 =?us-ascii?Q?QumVQr3PATzejXQO9XeQrt8SVKUfOjpV/APOSiAhrxElvzUZ+MTKFCiGH6LG?=
 =?us-ascii?Q?L5a2oXx8JgmWzZTPR+0I9mZVx/gQVpSHDRX1xV09HIuxD6p4B8vvB7Fiipgc?=
 =?us-ascii?Q?I2RR4fiVf3CKSkqKPsNKkqBTOHX0Ajh1Oz88Ck1fZJREDB1+JrH1fx71CBOf?=
 =?us-ascii?Q?z02kkfaGWPtPWBUnvl+DZ1VWhXAKYiXMXHe5RBrFNqd5WGMVHUBW+g3Nb8Xz?=
 =?us-ascii?Q?k68kHmWTCtHWjrJhwgwhpkhu4QFhE1CEw9IbX0KammX9c4EfMCWRIDEJh6e6?=
 =?us-ascii?Q?ma+VLIrzH7vhU3NTevAwpmkIuDq2nS44QVDi+D2rh+FW0yWqitlboYZISdAR?=
 =?us-ascii?Q?8mHdEuogkQtvKy+kvKXdyDlGglKS5yZjH6yyLu6zqCOSlifFFfhqQH1HiaNK?=
 =?us-ascii?Q?a4ctZo8hVQO664/u9jj+rUUU/c192mbKkz2OcRe34T7y2lM8eoMYFv8S45aY?=
 =?us-ascii?Q?umkQ7+9+eaIMatGMMxsKfoC36zqXHV0/P2RsSvFF0GbR+iFqsePo60sRzyhq?=
 =?us-ascii?Q?KLe894MUnrU2SlDr+0lLlN/CcnId/OanLrV3fgFgo7hGS88KhYHPZ11EO2jX?=
 =?us-ascii?Q?3ad5Mz2lxXK2WbPn3MRwGDtEo4DyPToprVdr?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:43.9576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b26695bf-7ea6-4334-9f17-08dd94d76807
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000147.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6305
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  56 ++++++++
 drivers/gpu/drm/nouveau/include/nvif/object.h |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/push.h   |  14 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  31 +++--
 drivers/gpu/drm/nouveau/nouveau_chan.h        |  11 +-
 drivers/gpu/drm/nouveau/nouveau_dma.c         | 103 +-------------
 drivers/gpu/drm/nouveau/nouveau_dma.h         |  13 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  10 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   8 +-
 drivers/gpu/drm/nouveau/nvif/Kbuild           |   5 +
 drivers/gpu/drm/nouveau/nvif/chan.c           | 127 ++++++++++++++++++
 drivers/gpu/drm/nouveau/nvif/chan506f.c       |  72 ++++++++++
 drivers/gpu/drm/nouveau/nvif/chanc36f.c       |  39 ++++++
 14 files changed, 344 insertions(+), 149 deletions(-)
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
index 4c100005ef81..a3ba07fc48a0 100644
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
index 000000000000..7f58a1c17979
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
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
index 000000000000..5a5f8ddc058f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chan506f.c
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
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
index 000000000000..28a4207a4390
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chanc36f.c
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
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

