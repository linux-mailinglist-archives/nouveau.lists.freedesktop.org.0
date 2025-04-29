Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE206AA3CA6
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E04410E5B1;
	Tue, 29 Apr 2025 23:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gZ7fjJg0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFED10E5B1
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CX5jRzwZpt/aVKMVM6JtLTOmhp9Do3QTMGR6RIYV+A7tqxvnyvGfDVLjAEULHdPty70yhbU3FRtM3mkipcfpzR/D6BqedKDEKIz8B7GWpOXPfPsX7VKU851aSmt9cmFr6nmaiymudso/9I+ZxhqWNwdprvsMaGyQJ+vDznh07eumXqDthsX5IDVf4gLqoDi/TNbSj4WqzIJHLiFvahGlU1mu26CHovdH9DgZJ7f9krjGqW7XOZxzGMyaMbgYcjEhwGsMLK9JMVGIuz/6b8E+eE79PMHxYScdnQpq/AJuXemQPUMmNcwDrJUMJzmGafUTFjdkOhDAyTo8G2kwadyMlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3kPdR63F8/vcEb6P6m6mTNQi08wKhGKSneddSTp0QY=;
 b=cKuSYkeBpKQq2BGJvYa85JlJGKM/BJcGnCAy0PmDLoCHgngBCH71F6WNnSPMSDKwemeCs1QctCQvQ4eG9UfZHKBoyzlwHKFh12Lkl7Vvi7avGovI/wE9QCNBsa1nJi+rKwf717+tSaCkCHZNJofjPVsCTF8vsUTPyjdAl/dSQjl72/7vV11Fpn9D6HQZxkx3aJl922EX6sSZWOuH60j46F43emck9JJxC6z7b9ex1gBD3fTxPGNHg7SZfUWrj2c73R4rJMGtu4yb4GPiWcCoO7QDHOgjvpapu7pVozewGtwiMAOHZ4xgPu8L4AmACHD51Xg12L8hm2ZZL1wjf+yXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3kPdR63F8/vcEb6P6m6mTNQi08wKhGKSneddSTp0QY=;
 b=gZ7fjJg0QTNA5uXZ3PCssz9Ii56fpGo65DcCu88AqPiO0P92bBS8r3ocso4eyrbze13QfvD7Pmgktf1/M7qVQc035luo0A56nR0Pva1ydgeDq+r+fUFCpweOTscxY+JUNXs7KejOUXA1pV0A6rQsDY8CQAI06+PrNCOP2s4i1wFy4Xed9i6gi0rR4J48lSiVfgo4irNPOt38vT3WwGMILVD72IZbDSz6o+XdhUM1dW+aRfWNRVAEhHwCGowCzeTeLw/F3aL1+errreebJn3LXZzFvEQ1PMUGynJR6dFsxhGrSXO/EfO4lk6snxvuhLhl3ja1LCQKIKxOBkCCRuDxPA==
Received: from SA1P222CA0042.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::16)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:54 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::4f) by SA1P222CA0042.outlook.office365.com
 (2603:10b6:806:2d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:40 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:38 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 50/60] drm/nouveau/gv100-: switch to volta semaphore methods
Date: Wed, 30 Apr 2025 09:39:18 +1000
Message-ID: <20250429233929.24363-51-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a58289-364f-450d-7b0e-08dd8777486e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gFbH+490GYQO/XTR0g+s0jOh5h+LYZJDq1tT0wUUYmjsqCMuDGhIi2eBmPcI?=
 =?us-ascii?Q?rnhVj6oqiukQ/m6g12b2lNyazE9kNTuwPdwkAwYR/qn6iNo0ySbnPULYfFQk?=
 =?us-ascii?Q?CvbtxEb6y2501T//LT31tgK7qolzA2gYWqAvo0VZInJrv/dZsMSw+onDoiSB?=
 =?us-ascii?Q?dJ0PcCGdguz/ou46PDJQRB1BGWtSp57QciL+7acIG+YcPb3BJ+i8USJ9SkbT?=
 =?us-ascii?Q?D5mwlPgdlSkvUaQ1Su0048qHVdKhHucerQVMcjM1EvNdI41Ltuw+MqgIV6ZC?=
 =?us-ascii?Q?lygmRDM8OtUY3aN2YioPsqVjodbJgf/DrstradLmKU+92xVTYbADJ662NxeM?=
 =?us-ascii?Q?XKryc3uiEeyrNvysHjfaggguYX492I/hA5X4Qd7woh7p7WGqfxlbVALHltPI?=
 =?us-ascii?Q?1SZs9LTInhJfdas8bsflNYX5nQj06olx/ceS/5TR3c3SJN5T4CzPg6B9pB7V?=
 =?us-ascii?Q?L4MAAtUdeyxfvvCScX3QmTWbC/dsELJbhqchQmzk/mNbmwSCkTqEccJ/J4+C?=
 =?us-ascii?Q?9rfCMy3lxL0hdeKPoN6eTY7SekC97GoyM2uQTe/ItiX32BmO73unz/sm6G83?=
 =?us-ascii?Q?G5XsJ2NGe574NNMg09c8NNJ1RT6AF0vN/C0Esq56xvX4/R8DCPWvph490W+B?=
 =?us-ascii?Q?lIFPjYGFFEawHhQPg6ptjK0vojy7EEd2iykMd4Wddh6ruilK+tTq3ApND3S3?=
 =?us-ascii?Q?bMtMd5JrrEXFJPfbLhG/hY8cCddbvS2lVho5Zg//buevtudG2xC5uiRHVDWU?=
 =?us-ascii?Q?316ym0t6rgLSVHMJJMqxyqBbdO/M/sG5enG/lOYTT8sRad290OFXsP+62KWU?=
 =?us-ascii?Q?inM9wmk0pxTHn51xr0YQpsek7lHZFnLz09byZsmOtgSIpTJCUmDAhuuZarXu?=
 =?us-ascii?Q?uTxUNZ4RQmqYmtQ1sbwMCUSoWfn4lZef4PFKyiN3iAJu7dtkSium69TEo6Ui?=
 =?us-ascii?Q?eVxpTkquWYLo0l8qRHXx6xOEoZO5yp8xakdQwY/1mQCt9Vfec8zkHNdSAru9?=
 =?us-ascii?Q?VphJzWNLe+VIlx1gPyke2Eoakzn6zWJl6B4A1DFD6ldSrF/lvc9sJUPO9jDW?=
 =?us-ascii?Q?14UIcFHh/YwVqwPEJO7ESBSRErMQBB1Vh+DAAHnOOPX39dYLaLVnIL+suFda?=
 =?us-ascii?Q?s6Q6x+wh4pWIM1EfU0UqSxwza88U9jJ0glC4nTvT2fN4diXDms9u+YIZclOw?=
 =?us-ascii?Q?ORHCn4ZA+KXiw+k0kaS0H4QIaDxMlABpX6b5QeQ0KiP9CXse2OtjpMmh4RcI?=
 =?us-ascii?Q?3fwISOqC5LU2ebaAu9Gg2o49Beh8yElcbdwqELStwx+NIP7FkBuGOss9Ajmm?=
 =?us-ascii?Q?lPfDWY1f3MEd0/e7yur4OKIQLfEzjtRGd6I8T7/WrtF9gmp4sMj7zGVxAOGo?=
 =?us-ascii?Q?rnWbUtU6X9mvpKDp0c0nLkr7QXytug4ZoqDYAliA+CB1BbX3HK+T1Uy7FKY1?=
 =?us-ascii?Q?Fh//aIomL/bQwyAqwYJdrs9sHVKpSFDIitxPHPeuDOv8TuKiF1YufsjXyba5?=
 =?us-ascii?Q?+12Qn0XxnrryznsNlsHzmyKjfmbKSU80xfOr?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:54.1157 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a58289-364f-450d-7b0e-08dd8777486e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821
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
---
 drivers/gpu/drm/nouveau/Kbuild                |   1 +
 drivers/gpu/drm/nouveau/gv100_fence.c         | 110 ++++++++++++++++++
 .../drm/nouveau/include/nvhw/class/clc36f.h   |  52 +++++++++
 .../gpu/drm/nouveau/include/nvif/push906f.h   |   1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h       |   1 +
 6 files changed, 168 insertions(+), 1 deletion(-)
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
index 000000000000..49db088a9cc3
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/gv100_fence.c
@@ -0,0 +1,110 @@
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

