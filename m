Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC99ABA72F
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BEA410EBE4;
	Sat, 17 May 2025 00:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dYQDe5Rp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C56410EBE3
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJgOjhx2ipoupueSXyZtcgznkQl2rHKTUTIQtVI1Oi1VMcZtT+HqSY8x55X7Uy6f7z/k8JypEWp720WvXQ2BlMFp/0r3u4xiHyv+Ka1KxBZdRNmle3dwMHyEAIHh2L+1qTwEs0NemzH4RpB2R/p6/uRxYLJ4vo4rX2wpHu8qmx5LOlnQTlWacWIrCkCtoLAOCFijTNN2O4mTX2H+Be5y8BK9LabQ+qdASnNewG8s788edmL/RhZZ73i+wdj/AOEkLfIy9vnvtQIpYc36lQgEwxUL5CdAfEjxqDrIMMDkeJeer2BpnDO72ZCE5b2UgtsTFJGHIDir0xa93my3EftyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4F64ETeujc4NK1+WYu1Mnz5M4w31YL1Q8MTa+6tkzxA=;
 b=HaPpPx+zpZNfBb1mVdkqJ+ydZIYRqI1E8Cfm5ou18o7jPLEKmf+IDEei4tsN/L2mAoXGb7obdUKgoU3xdfoNo2UNI4NJIkm7yP5UZn5zW3//LzGba27wuYGe20YT3WceQm4nxaQ46LSGmMAqF7jLCGyboibMoj54bih/VQoToxkRbpLx+F8n4Ub3Jf+gA21u4nmGgRY5nOH7lHZ9q5STgkMZu7TQjZ2sZRuu8MpoUBZtqnlqOcfovFIQejkLtW+PbD86n9pNkHs6isdGHy6W7IIK/fGNG+7bZ8q6pmtQBlWLBNVORvissAxnY6pk6W/EeyHZfbEF37NohQKcRXV4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4F64ETeujc4NK1+WYu1Mnz5M4w31YL1Q8MTa+6tkzxA=;
 b=dYQDe5RpcmFIEtX2IgV9KXBKk0lu25uns7F8ruORMF3PwElAsC8zWzK/k/CEwFgy40/Qx9ihCOZUsnP7HCAN4qSejPc/wsdcQlyISWgNRYOXgiTlEMBTrtlmcTi/U+s8GV0vjANbpJW3bSizZQ0fvrxo7JPR2+pRwyoE/VsZXW2tcn5t9XvWOzgA6M3SB70aMM7CxpaZwYJv50V5/OjcmvM/MeD2uJ8WNRpJHflDiOsMuSMEJZc3CqT9392CWM2qe/mPkhvYRhm49pMV61xcvjLbygNMNB7uA7O90l/g38xNKJ71Ca5wfR8mu0zoTcvfOAT3cuTvyG07M1A/MVfrtg==
Received: from CH0PR04CA0118.namprd04.prod.outlook.com (2603:10b6:610:75::33)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:11:36 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::bd) by CH0PR04CA0118.outlook.office365.com
 (2603:10b6:610:75::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Sat,
 17 May 2025 00:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:24 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:23 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 52/62] drm/nouveau/gv100-: switch to volta semaphore methods
Date: Sat, 17 May 2025 10:09:44 +1000
Message-ID: <20250517000954.35691-53-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|DS0PR12MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: e93fbf04-ae03-4bb0-ec5d-08dd94d76379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iCEi8XpExTyM7yhv8E5MGyDdZuz8lbQhnQEgoRJobTic9pp2Xu20xPv/y/MB?=
 =?us-ascii?Q?MBBj+hELg8KE1VrjEPWBT7hSoBpbpjakHwLoLpX099Nwue6Ab5PB8OVMVt3g?=
 =?us-ascii?Q?aO9YJkp4x77tLqh5beumdE/PTVqznu8CVZCSC0n08nXtNh+hlD+FA7ILf5Z1?=
 =?us-ascii?Q?RMRkO8/Dvb9XPl7IEZeTRf5IZpxICmBul5eMtUwtazffnCLXHHigZG/u3Tdv?=
 =?us-ascii?Q?A2lB0iJKL2qwfYtNtVHKzaugBiYmQGbPgreTq4lDufgq8ccTYqNDp83g5zpy?=
 =?us-ascii?Q?8LHyVMG9Ksc0lQwIQT9kBtAAmWH+0LLmNXN/60NdLzMlKArEjEFfp1l91Xk5?=
 =?us-ascii?Q?pIcK3T8mfSKaA54OHq/Mtdi+gG7vRjhkWFwAjMtu8kTRHHV7cWV1cqXLEY8q?=
 =?us-ascii?Q?QqiR5Kw/l1hC/nrx22L/S3pIt+/qUU/SqMd08UeDZXSCR/1k4zYAfrP9x/pk?=
 =?us-ascii?Q?gnEX4D7eX+4XqKuMhVguX/iFzCpeEHfky9mXI57Rk0SMvNpIj6JSzfAidy5k?=
 =?us-ascii?Q?1oiYsbhMTz6d1sqStDk5ICuIZBinjIbHA/c7MT8fvrfvhNSXWfZh/Ox6gFcD?=
 =?us-ascii?Q?grMLfHqCfdC0c8RrjZRlNRcdmyE9b5sU6WD/hnFWgS4NXjCVTozD9WBi8Npu?=
 =?us-ascii?Q?jvBweiq7f3S6Ime0R4O1CManG7Fu+1eHlXCQvI6Zj/cti24Sjvk8HbshZmHF?=
 =?us-ascii?Q?hv661rNhZYmv3apTGY7Z8mXtCduibcTfQ0VYtPDG2fpISlh+uuKriBhOBXwu?=
 =?us-ascii?Q?0lEeB+DP/cyI6pqXfKzixTbm+VRDaGCAFJWdImKvTOrsK752Ujhz7C7ySEMJ?=
 =?us-ascii?Q?n66pmRAKH4gC+VLFLwDgeud6Wa8BtL9DB9m1m4JhFexn9AR1M1h4iZOHbmAc?=
 =?us-ascii?Q?F8E/flwFfAIMm3rAMlOPxgk2pByUxFxmbRuyhiUpRl2AjjcB7tM0E9DvPn85?=
 =?us-ascii?Q?kBOilw5eq2KRXMQvbhIBtSFdpJyCPVwRD9d43/11NMFZVSrEKsFZnQcP3uRV?=
 =?us-ascii?Q?arJf+ePX3Onnrp6BYw2f/UdEU6yPixBVkvetyg7fSWKNLdQOfv1CPTthwUGR?=
 =?us-ascii?Q?uNBaTzGgZbxrog1CpnqzElCnlGP9jRlGjtah1cBoxu/yt1qfMjx3zNDC118a?=
 =?us-ascii?Q?Va48QhhcpAtE3ngusOmvZ1eEHXawdWQKN88VobLkj4SjjzG/HhGqOftNCAlW?=
 =?us-ascii?Q?s20d+Dt9K4a7XpB+1WWoHwjExlOvHu+KoWYylNgf8yb1JXWixXNwtyevRr1G?=
 =?us-ascii?Q?IH1kwyPG6Mrmbn5Um5u1EJhRTsv1t8ohs+PWUOJ98VHQGw0XtUWQpcZX+jCi?=
 =?us-ascii?Q?a/VKQjmrbrMjtvFjRhOTmTadtwluizISJMuFcwLjMnawx0f2tlUgWCKzPOjg?=
 =?us-ascii?Q?Hr6gX3aN67iraUIeOhLgNYULM+tlpWse/0NJAHeSqYSn+grNCfqSE1EDLDAM?=
 =?us-ascii?Q?fqQO28RP6i0Btm5GgGuKm5RUi5djGT02AFwbPxaT5M3H1+84axMoie4Mu8Lu?=
 =?us-ascii?Q?M8mnoaq/B4ZyvSAPPPD+fOLzBNwoylGPtgb+?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:36.2686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e93fbf04-ae03-4bb0-ec5d-08dd94d76379
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969
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

