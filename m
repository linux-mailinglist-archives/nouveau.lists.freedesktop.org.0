Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B48AB2B78
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9CFE10E279;
	Sun, 11 May 2025 21:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cuAX7BmA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C490110E274
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaGIht0c4z9o0xU0Wtvcd8M9srA4GcjKPzDQplgWnR5Dt4zCKrbbI1LlJt3veVOpxarOOOTAF0tNbes9+cuPp1gZVKkQuiOafMRcSfECP/tle3xQVM4l6KbixTHdSWKhfnUA+svBB9rZLwq00PW879a2CfFknWnc9w1Ld+Jru3blDtPDQI2DrzMudAfw7Y6DqJZCCFkfVDyWjCRJdJfAsko1LPwvgLAzDvY1g9y1UuIq/j6KqE14ydVistF+kZiOKF7lGSdiXkxNDmoIUutXnrA5WfY0FYtR1EX75iIj1+XzLODYhP8dgwiumm/PeaYC8kcgjTkcEaZ56Y+R7+uWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4F64ETeujc4NK1+WYu1Mnz5M4w31YL1Q8MTa+6tkzxA=;
 b=PKlYIFMbDafO/DnbfQo9/2J5r94523UIYE0GcGygOevpo37CRVGSpBCia0m6yPBdSBLvuY4m1fWDcwqUf9umFbCqQBZkyt0gxxU00kR1Vr2SG+MPS/My6DBcitOxu3TxLOz7IFCf38RBnWvxkMod8j8jJIU52KZo/Xxwivd3Y/HHWE/DYo1/eZa2SOZczVD6Le4zTHI2tqafsqIxc6KiKvd8tD+2sz+hsO3+6KVSgWh/g73GBMzRi3Q7U9ssG9Z1rOGA7xWPJAw5242d5f8vSFb5qju0MzPeXlB2AUF3ggde6bfVi3XoWV08nX6OylwdkLTPqYjbqQOWu07vF2y09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F64ETeujc4NK1+WYu1Mnz5M4w31YL1Q8MTa+6tkzxA=;
 b=cuAX7BmAEs7gLRvLKPuSc/2pXIkQXwf7Rd/h7H7TpDTlaGW2uH/mbxmsRBSTHogTHHf8ubBNV5QhXjbzEYUVQQHKf8flKOIycc1Df/2pdbaQ6kQxP5XTw3+aoLhcsaB0S/d6serYZakPdE09f8Rn/GJD0eYU3Ntvdj3NEQEgEaNRWdiP1ercecajtOfNHJBPis5OmdtYi4BkmDaXl0ywMmY0v9ZlMYk6V/GVcDabkWbG4oYpySteulmOPD0jmWGCz5ZGUjVPFBrEGspvz1pwhs6kwPMXQjz5mvPe5DfOB1ZW3/5zkHtkvxCmEAJIVD64AJeVz5/e1+999Fy6EWLMiA==
Received: from CH0PR04CA0035.namprd04.prod.outlook.com (2603:10b6:610:77::10)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:09:41 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::22) by CH0PR04CA0035.outlook.office365.com
 (2603:10b6:610:77::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:31 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 52/62] drm/nouveau/gv100-: switch to volta semaphore methods
Date: Mon, 12 May 2025 07:07:12 +1000
Message-ID: <20250511210722.80350-53-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 75b7074a-e263-4724-b85b-08dd90d02539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IW86vDG3EV4dGALSLXHbDGEDxZdR5DKMp4cazLk0jeqoMntttoV3j+nqGBs6?=
 =?us-ascii?Q?Bp7t+wy0oNbip6kEakEs+Kfsg8nIvzRYdOgnUGzKHhY/IGx//EQNUkE7dJy7?=
 =?us-ascii?Q?yt8CvVFWkNe8L8ezv2tiHvQTi4k4n4wh9e4zXgiAzG049WIcfXT8eFgAjf8I?=
 =?us-ascii?Q?chAr2KUSnOa5ff1M7TzVZVyCUHj87/cvlA3H4daVs1v8492UymURs4s5fBrE?=
 =?us-ascii?Q?AxI8aOobY26OJLlooblD/3IPvz3vNRNfFFowaGmCYuxWt/OZtiz1dpMgFKCI?=
 =?us-ascii?Q?CZFI1V2GcerNDklkwRtso49GANNZ4P1d/tp4T4n8VeK+ckMqVB20Ag9tGaJ7?=
 =?us-ascii?Q?eOpEoJkFxHt8oJwWouElpIS6pXszxs4XcllcqQFKRW6yXTgvd2vxknA/EzvB?=
 =?us-ascii?Q?QptL/aJyn3q7tH16gawsqOtZ+J4/KAoXLM1rLTJ0d+4PllBxVpRblP1bIG8y?=
 =?us-ascii?Q?hjKKjpCpPTxhLFeR6ABor0xvg2r8dEaKuEtwiBnr1e66Ei6c1UWoiq6fvdFl?=
 =?us-ascii?Q?T/c77urpE/lOBP4K3+qBeDsojFKu+7SsRjR+bb/fE78WDdLFXE5vUzIEfrZp?=
 =?us-ascii?Q?wMJRgyz0tTnCFU+TX/cxFbXOmLRO3v7bVybd2xdEB8cfgRMk0Wbg4ej8ApiL?=
 =?us-ascii?Q?8Dd8jk4Z1uOtGx+8H8t343ymgZDqoiMXdNeAKGkbESl8OQVAAeGgz2gWBPpw?=
 =?us-ascii?Q?20JipHQqShbMcD0xAx8asZtZm5Nfz8gLEAg9kECvOClkOP6IzfkrI4B/CDIR?=
 =?us-ascii?Q?IvYz6Z0WoRRZ86pTfM9Gz/yPFZi7tVCSRmSKBc78a8J4ymx+SOcRcQP5Cydo?=
 =?us-ascii?Q?c6AWqxnQ0yu8YlNMadBer6SMm1A3yl9tC8jHbud0wWXD3IsWWxc0AM+w7EEN?=
 =?us-ascii?Q?rWt4AekmzN4SqHfhIsigmb+4NLc8RdW9kvn/FDLMsF8rlcw+ad1/JhK434/g?=
 =?us-ascii?Q?3pWvOssOGZ4Oytp18yShK62k/gD0d+Gl8/7/++Y8NCZ6yXuh+l3KwGtyFY3w?=
 =?us-ascii?Q?WagmZTNSSeW4xG1JKF+uFV/fRlRBscQ7KyiTgRWcSQIP16xYGb17v6yIB4K1?=
 =?us-ascii?Q?yioz0JQSHeAYt/32E131+mjrV8IAuAwod9J83vTCd8sdzrlwN8Wmli9Dooi2?=
 =?us-ascii?Q?bCU8TIkK6yo9/r1eoQlcCX7I8SRMRP2f5AdJZqNg7TgZt45B3Z4ZazHQ+tds?=
 =?us-ascii?Q?uCoP3wd1iQpwZMRXNQqCX6S0BgwBwLNFwkNtnMsA0URYa7sPAcp82j3Aw9PT?=
 =?us-ascii?Q?saq80JjkuCiU9Vt7YYDKde5w1DPKFZgshEuRAE9mKZmTA9iTNflxrydJBRkn?=
 =?us-ascii?Q?RvbwFYoBYAiiycMvqU+pRyMBapHOoJ222KFfP5Okjn/X70H63YcqaczfRR6e?=
 =?us-ascii?Q?ydkua6NP9h1yCnIHSWEu6CBXGP6CDOtqDSbuKKNCbyfdxjqqGgc6kAEMpW3G?=
 =?us-ascii?Q?ueYl99qHifBhdzqaX/++FVi9XJIPqh1QBlaPq+usbqgaSnspIF/uWGtn4sc5?=
 =?us-ascii?Q?zgiTUhoF0mW1DUxsMLCW5OP5mLw5VX4DEvp5?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:40.7113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b7074a-e263-4724-b85b-08dd90d02539
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312
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

HOPPER_CHANNEL_GPFIFO_A removes the SEMAPHORE[A-D] methods that are
currently used by nouveau to implement fences on GF100 and newer.

Switch to the newer SEM methods available from VOLTA_CHANNEL_GPFIFO,
which are also available on the Hopper/Blackwell host classes.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild                |  1 +
 drivers/gpu/drm/nouveau/gv100_fence.c         | 93 +++++++++++++++++++
 .../drm/nouveau/include/nvhw/class/clc36f.h   | 52 +++++++++++
 .../gpu/drm/nouveau/include/nvif/push906f.h   |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h       |  1 +
 6 files changed, 151 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/gv100_fence.c
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index 0759ba15954b..385d24530d1e 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -69,5 +69,6 @@ nouveau-y += nv17_fence.o
 nouveau-y += nv50_fence.o
 nouveau-y += nv84_fence.o
 nouveau-y += nvc0_fence.o
+nouveau-y += gv100_fence.o
 
 obj-$(CONFIG_DRM_NOUVEAU) += nouveau.o
diff --git a/drivers/gpu/drm/nouveau/gv100_fence.c b/drivers/gpu/drm/nouveau/gv100_fence.c
new file mode 100644
index 000000000000..cccdeca72002
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/gv100_fence.c
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "nouveau_drv.h"
+#include "nouveau_dma.h"
+#include "nouveau_fence.h"
+
+#include "nv50_display.h"
+
+#include <nvif/push906f.h>
+
+#include <nvhw/class/clc36f.h>
+
+static int
+gv100_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
+{
+	struct nvif_push *push = &chan->chan.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 8);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(virtual),
+				SEM_ADDR_HI, upper_32_bits(virtual),
+				SEM_PAYLOAD_LO, sequence);
+
+	PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
+		  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, RELEASE) |
+		  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_WFI, EN) |
+		  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
+		  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
+
+	PUSH_MTHD(push, NVC36F, NON_STALL_INTERRUPT, 0);
+
+	PUSH_KICK(push);
+	return 0;
+}
+
+static int
+gv100_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
+{
+	struct nvif_push *push = &chan->chan.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 6);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(virtual),
+				SEM_ADDR_HI, upper_32_bits(virtual),
+				SEM_PAYLOAD_LO, sequence);
+
+	PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
+		  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, ACQ_CIRC_GEQ) |
+		  NVDEF(NVC36F, SEM_EXECUTE, ACQUIRE_SWITCH_TSG, EN) |
+		  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT));
+
+	PUSH_KICK(push);
+	return 0;
+}
+
+static int
+gv100_fence_context_new(struct nouveau_channel *chan)
+{
+	struct nv84_fence_chan *fctx;
+	int ret;
+
+	ret = nv84_fence_context_new(chan);
+	if (ret)
+		return ret;
+
+	fctx = chan->fence;
+	fctx->base.emit32 = gv100_fence_emit32;
+	fctx->base.sync32 = gv100_fence_sync32;
+	return 0;
+}
+
+int
+gv100_fence_create(struct nouveau_drm *drm)
+{
+	struct nv84_fence_priv *priv;
+	int ret;
+
+	ret = nv84_fence_create(drm);
+	if (ret)
+		return ret;
+
+	priv = drm->fence;
+	priv->base.context_new = gv100_fence_context_new;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
new file mode 100644
index 000000000000..8735dda4c8a7
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clc36f.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef _clc36f_h_
+#define _clc36f_h_
+
+#define NVC36F_NON_STALL_INTERRUPT                                 (0x00000020)
+#define NVC36F_NON_STALL_INTERRUPT_HANDLE                                 31:0
+#define NVC36F_SEM_ADDR_LO                                         (0x0000005c)
+#define NVC36F_SEM_ADDR_LO_OFFSET                                         31:2
+#define NVC36F_SEM_ADDR_HI                                         (0x00000060)
+#define NVC36F_SEM_ADDR_HI_OFFSET                                          7:0
+#define NVC36F_SEM_PAYLOAD_LO                                      (0x00000064)
+#define NVC36F_SEM_PAYLOAD_LO_PAYLOAD                                     31:0
+#define NVC36F_SEM_PAYLOAD_HI                                      (0x00000068)
+#define NVC36F_SEM_PAYLOAD_HI_PAYLOAD                                     31:0
+#define NVC36F_SEM_EXECUTE                                         (0x0000006c)
+#define NVC36F_SEM_EXECUTE_OPERATION                                       2:0
+#define NVC36F_SEM_EXECUTE_OPERATION_ACQUIRE                        0x00000000
+#define NVC36F_SEM_EXECUTE_OPERATION_RELEASE                        0x00000001
+#define NVC36F_SEM_EXECUTE_OPERATION_ACQ_STRICT_GEQ                 0x00000002
+#define NVC36F_SEM_EXECUTE_OPERATION_ACQ_CIRC_GEQ                   0x00000003
+#define NVC36F_SEM_EXECUTE_OPERATION_ACQ_AND                        0x00000004
+#define NVC36F_SEM_EXECUTE_OPERATION_ACQ_NOR                        0x00000005
+#define NVC36F_SEM_EXECUTE_OPERATION_REDUCTION                      0x00000006
+#define NVC36F_SEM_EXECUTE_ACQUIRE_SWITCH_TSG                            12:12
+#define NVC36F_SEM_EXECUTE_ACQUIRE_SWITCH_TSG_DIS                   0x00000000
+#define NVC36F_SEM_EXECUTE_ACQUIRE_SWITCH_TSG_EN                    0x00000001
+#define NVC36F_SEM_EXECUTE_RELEASE_WFI                                   20:20
+#define NVC36F_SEM_EXECUTE_RELEASE_WFI_DIS                          0x00000000
+#define NVC36F_SEM_EXECUTE_RELEASE_WFI_EN                           0x00000001
+#define NVC36F_SEM_EXECUTE_PAYLOAD_SIZE                                  24:24
+#define NVC36F_SEM_EXECUTE_PAYLOAD_SIZE_32BIT                       0x00000000
+#define NVC36F_SEM_EXECUTE_PAYLOAD_SIZE_64BIT                       0x00000001
+#define NVC36F_SEM_EXECUTE_RELEASE_TIMESTAMP                             25:25
+#define NVC36F_SEM_EXECUTE_RELEASE_TIMESTAMP_DIS                    0x00000000
+#define NVC36F_SEM_EXECUTE_RELEASE_TIMESTAMP_EN                     0x00000001
+#define NVC36F_SEM_EXECUTE_REDUCTION                                     30:27
+#define NVC36F_SEM_EXECUTE_REDUCTION_IMIN                           0x00000000
+#define NVC36F_SEM_EXECUTE_REDUCTION_IMAX                           0x00000001
+#define NVC36F_SEM_EXECUTE_REDUCTION_IXOR                           0x00000002
+#define NVC36F_SEM_EXECUTE_REDUCTION_IAND                           0x00000003
+#define NVC36F_SEM_EXECUTE_REDUCTION_IOR                            0x00000004
+#define NVC36F_SEM_EXECUTE_REDUCTION_IADD                           0x00000005
+#define NVC36F_SEM_EXECUTE_REDUCTION_INC                            0x00000006
+#define NVC36F_SEM_EXECUTE_REDUCTION_DEC                            0x00000007
+#define NVC36F_SEM_EXECUTE_REDUCTION_FORMAT                              31:31
+#define NVC36F_SEM_EXECUTE_REDUCTION_FORMAT_SIGNED                  0x00000000
+#define NVC36F_SEM_EXECUTE_REDUCTION_FORMAT_UNSIGNED                0x00000001
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/push906f.h b/drivers/gpu/drm/nouveau/include/nvif/push906f.h
index cc2866bc8b0a..79df71de98d2 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/push906f.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/push906f.h
@@ -7,6 +7,7 @@
 #ifndef PUSH906F_SUBC
 // Host methods
 #define PUSH906F_SUBC_NV906F	0
+#define PUSH906F_SUBC_NVC36F	0
 
 // Twod
 #define PUSH906F_SUBC_NV902D	3
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index c69139701056..e7544942791d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -503,11 +503,13 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		case KEPLER_CHANNEL_GPFIFO_B:
 		case MAXWELL_CHANNEL_GPFIFO_A:
 		case PASCAL_CHANNEL_GPFIFO_A:
+			ret = nvc0_fence_create(drm);
+			break;
 		case VOLTA_CHANNEL_GPFIFO_A:
 		case TURING_CHANNEL_GPFIFO_A:
 		case AMPERE_CHANNEL_GPFIFO_A:
 		case AMPERE_CHANNEL_GPFIFO_B:
-			ret = nvc0_fence_create(drm);
+			ret = gv100_fence_create(drm);
 			break;
 		default:
 			break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 8bc065acfe35..6a983dd9f7b9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -83,6 +83,7 @@ void nv17_fence_resume(struct nouveau_drm *drm);
 int nv50_fence_create(struct nouveau_drm *);
 int nv84_fence_create(struct nouveau_drm *);
 int nvc0_fence_create(struct nouveau_drm *);
+int gv100_fence_create(struct nouveau_drm *);
 
 struct nv84_fence_chan {
 	struct nouveau_fence_chan base;
-- 
2.49.0

