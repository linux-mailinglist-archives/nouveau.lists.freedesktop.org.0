Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B396EAB2B81
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E241910E295;
	Sun, 11 May 2025 21:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEeaQav/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE93510E295
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk2dgS27/KUL0TZKDDZr5f2kobBRSK2TUNTnp/gaJjQzD/dpD4+koLLDJArLymZzMvK3Jw0gO9BtD0lOcHgFcezC85k+/6tZLGCxa9DBt0+QbAbSebkVn5Cr/qepY2ur7nfGeiaoaCenPl6A9ukYJ8KbaEb1MjwPQiE+4KW65n4gVxFjrSdGLFQdqMKbhulKNdJzn6FknsXYSq/5wgraXssnqWvMOhs/UAQ/5UDkM8GYYrpN0ajjW9CSsEPh92ES00nkdDc/1UaRHHC1YuFpiYscno3bKfj6EQ18gQ1ENWqIqGDfsUHoRqjmhRMltoOfZfHMxxK13NZO2LqipdP6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTwD6XWviz6e2ULNjf+zIWIicfji+0R4vNBaBPHQ2Ig=;
 b=KTNVMuHQFubxSC1M7O38xvuJnuB6uWJL9aLtzVu3VGZ3j+sTmAEM2BmVG/dXs99T0tPnJoCpwM94dUgsE4mi/qFQGXialO5QTDTND8jYf0sin8ZvjuOX9J1fblimmhxNhqYoTDNExqZzi8SwQIqqDyOZSg2KSajo8i2K6ZXAMwph/WO/Y7b8D4e0zxv0CvDuHcE5mUdiEEf4s8jjlsHvOWsADkHuWa+w/Xtkg8uiwmzlPykv7Kv7TBUlflt4l3shhVYIG5Y5AFYHWHHgo/SmbnS4l5HO15PYIEvfuQIL4lBS6Qp9d8j9mIOCoFxHlBRx3wS27hETnAUHsRpN9c9anQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTwD6XWviz6e2ULNjf+zIWIicfji+0R4vNBaBPHQ2Ig=;
 b=hEeaQav/QJ65sZ8i4Oudnx+HUalQLYbA/yMSNEXfqBTYWd2rH65ZDu5mAtH8SvV9YTbCiVI9Ukv3HJloLLJ7+NO4cUw4kGoo+fh2tYTdM6j8sVrK17SnF9yd7BMEwo9wRDZknaRMw004+E729IVttjL4IRqOkBKVKRLpVmRGtC6by3ogS9tjMoztx3UW99H8t3zPYM1JO/m/4pzacm3B4/640jZu45MJVYbRma3adusuWXUFbBknZ0MScB/88wFKlFjNG6+RJP5GWdI2BKz5nHZJ5WJiB4/4Vt6LHTK7Oyc5YK8SJaZkwatwiUJ9WZCoYi2a3tQWnw7I5Evhpl6rzw==
Received: from DM6PR07CA0042.namprd07.prod.outlook.com (2603:10b6:5:74::19) by
 DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Sun, 11 May 2025 21:09:56 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::e4) by DM6PR07CA0042.outlook.office365.com
 (2603:10b6:5:74::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:09:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:45 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 60/62] drm/nouveau: add support for GB20x
Date: Mon, 12 May 2025 07:07:20 +1000
Message-ID: <20250511210722.80350-61-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|DS7PR12MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: a7380806-c05d-4a42-29f8-08dd90d02ea6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?509JUg0CV5aU3vkyZBsKDsr2z/9aE6ok19ms0GAiBXfIeMfsGIe9T5BRWdn5?=
 =?us-ascii?Q?fnYgbIzptmSYG1V/JVwVPGdn+ff6EsNaZKODfqZP2UNq3hZ8ITkx4O1+iJOf?=
 =?us-ascii?Q?+0oEKVwkmhTnkDjrHcTlLfwxMcfpXxJeayAmH87zJowAy9oP2uAykD7LGDRk?=
 =?us-ascii?Q?IGRCsHeqGO/8EFDE/e5bFCiB66l7hXGdZci5i4rf8ukbYGUXmqpb+oTbsJtO?=
 =?us-ascii?Q?qdRm2g2MLxo6HGM48VjL+VSQF7Kp2083hQY62w7nnbsFBW/BvBQwjY7gwvBH?=
 =?us-ascii?Q?9QxQsLjSonoz2pbtNYBNFPxgbdBqqb9PwKU9gVqwODelRucLmJx3cq8weXHf?=
 =?us-ascii?Q?JiCoLilE6f4Pd4zMc8hVYKlsVqLwRrwxX/jdlddOjxw6Plx7MzRZr3bUqPvu?=
 =?us-ascii?Q?hfgd+rlfg2qxUBJQNZvg86yj2YOe0V66V6/Sd9y/PnOjShNPEdOEvSgMA4iu?=
 =?us-ascii?Q?OEygQdFL9wBhlccgEh4zp0sstMeq9n27EthdEyDhOV5AMKdsBsEKvYW9yR/e?=
 =?us-ascii?Q?iYd4AMqfDLIpcAQe0VSzmd+jU49rlNS5D3c4cks5Bli60sYgqCW6xNgsg6VB?=
 =?us-ascii?Q?OVS4xye5RDFFRcJ1bs0kk86z1jt0JjvrnJ1ciE0xs+qzxySSKTJNa5XG33Vo?=
 =?us-ascii?Q?ue4lrgdlxKPNaFoDU6AbAHEYu+P7YhrayGzQ8feoi6SwNuI1gl4s7MLM7tND?=
 =?us-ascii?Q?cAps7PZE5ep5Dcg5ptJaGmnyirA2MQw+OYjhKBOYRTdNgwdGGJTsm78z2PP1?=
 =?us-ascii?Q?SoTqg8dBDhh8N4exLu+UUBC0eD1ktHAQOn6BEk2MG3HY6fG+G2qYVovt1p9F?=
 =?us-ascii?Q?KviVzRonfIv+F396Sk2JaHfn9ZBfM/KaqTx2hxyTrq5DpuRekI1iHxG6I5/O?=
 =?us-ascii?Q?t+StrY5u5nNzXUcEOxkFJAEY5PHvCXqo4ooWu9CxP7MeFHgmiE+FKi3Q7OHG?=
 =?us-ascii?Q?xKFBfvGE79r2AmJxHcBvnvNG+j/ywUqHIGZ0rIyi3OkQIVi7mUWHD4atJSy5?=
 =?us-ascii?Q?CM9gBpDAzd3Xka6I0cwbfGlB7oHW/FxPc54dwwjw95d5ZEN0Hydqwd7GYOnt?=
 =?us-ascii?Q?TX17/YsP+PNRhngewjHS88PVlAVn8yRkiGJfV7xGadhAHctUiFtdsYwvn8BX?=
 =?us-ascii?Q?vZVLIlqyM6hOZBRxtTa/IgYqoRkBYx+/82lhdA7nEfaCpgEamK1vyoQafxgH?=
 =?us-ascii?Q?J3J2m2a5kiRjMZBvuuMY6fJsOAWkdxiUgarZGuqKkfjcW6zDKBi6Dr0yhLiF?=
 =?us-ascii?Q?OBZwVYqRE3gW9nq7O6zPBZGzFLVPikMaSIFZ3LnQbXw/cD1l1ius81J1k+WR?=
 =?us-ascii?Q?+4QvZZi/lKtzFvvWOx8m8khiduZC9p3F0ID5F7+Yjh0EUGUOckiuwewJZs/i?=
 =?us-ascii?Q?zYADhCEgtDqo3ORanCZegu8HBd09477x37auxFa/+XkpjNEQmu1gmo5XBn4U?=
 =?us-ascii?Q?riJ8P09gzAXPDIQZoFU7/q39FEfKEgaEKPebSam29Xh6BjYMS0EbtEg+OV0B?=
 =?us-ascii?Q?DYjWpxFBkNeylYa7t/Grt1Cx8lP3NkqLyp97?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:56.5154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7380806-c05d-4a42-29f8-08dd90d02ea6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5744
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

This commit adds support for the GB20x GPUs found on GeForce RTX 50xx
series boards.

Beyond a few miscellaneous register moves and HW class ID plumbing,
this reuses most of the code added to support GH100/GB10x.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../include/nvhw/ref/gb10b/dev_fbhub.h        | 18 ++++
 .../nouveau/include/nvhw/ref/gb202/dev_ce.h   | 12 +++
 .../include/nvhw/ref/gb202/dev_therm.h        | 17 ++++
 drivers/gpu/drm/nouveau/include/nvif/class.h  | 15 ++++
 .../drm/nouveau/include/nvkm/core/device.h    |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fb.h  |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/fsp.h |  1 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  1 +
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  1 +
 drivers/gpu/drm/nouveau/nvif/user.c           |  9 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild |  1 +
 .../gpu/drm/nouveau/nvkm/engine/ce/gb202.c    | 16 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h |  2 +
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 86 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/fifo/gb202.c  | 14 +++
 .../gpu/drm/nouveau/nvkm/engine/fifo/priv.h   |  2 +
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fb/gb202.c    | 30 +++++++
 .../gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c   | 45 ++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c   | 38 ++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c    | 44 ++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h  |  2 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 16 ++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  | 16 ++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 32 files changed, 393 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb10b/dev_fbhub.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ce.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_therm.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c

diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gb10b/dev_fbhub.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb10b/dev_fbhub.h
new file mode 100644
index 000000000000..4d0bb8e14298
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb10b/dev_fbhub.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gb10b_dev_fb_h__
+#define __gb10b_dev_fb_h__
+
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO                                0x008a1d58 /* RW-4R */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR                                  31:0 /* RWIVF */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR_INIT                       0x00000000 /* RWI-V */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO_ADR_MASK                       0xffffff00 /* RW--V */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI                                0x008a1d5c /* RW-4R */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR                                  31:0 /* RWIVF */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_INIT                       0x00000000 /* RWI-V */
+#define NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI_ADR_MASK                       0x000fffff /* RW--V */
+
+#endif // __gb10b_dev_fb_h__
+
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ce.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ce.h
new file mode 100644
index 000000000000..b09f04b31738
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_ce.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gb202_dev_ce_h__
+#define __gb202_dev_ce_h__
+
+#define NV_CE_GRCE_MASK                                                       0x001040d8 /* C--4R */
+#define NV_CE_GRCE_MASK_VALUE                                                        9:0 /* C--VF */
+#define NV_CE_GRCE_MASK_VALUE_INIT                                                 0x00f /* C---V */
+
+#endif // __gb202_dev_ce_h__
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_therm.h b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_therm.h
new file mode 100644
index 000000000000..ed359cb528fb
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/ref/gb202/dev_therm.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __gb202_dev_therm_h__
+#define __gb202_dev_therm_h__
+
+#define NV_THERM_I2CS_SCRATCH                                                  0x00ad00bc /* RW-4R */
+#define NV_THERM_I2CS_SCRATCH_DATA                                                   31:0 /* RWIVF */
+#define NV_THERM_I2CS_SCRATCH_DATA_INIT                                        0x00000000 /* RWI-V */
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE                                   NV_THERM_I2CS_SCRATCH
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS                                             31:0
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS                               0x000000FF
+#define NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_FAILED                                0x00000000
+
+#endif // __gb202_dev_therm_h__
+
diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index 606483fc850b..ff6823cb2cd8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -65,6 +65,7 @@
 #define TURING_USERMODE_A                                            0x0000c461
 #define AMPERE_USERMODE_A                                            0x0000c561
 #define HOPPER_USERMODE_A                                            0x0000c661
+#define BLACKWELL_USERMODE_A                                         0x0000c761
 
 #define MAXWELL_FAULT_BUFFER_A                        /* clb069.h */ 0x0000b069
 #define VOLTA_FAULT_BUFFER_A                          /* clb069.h */ 0x0000c369
@@ -89,6 +90,7 @@
 #define AMPERE_CHANNEL_GPFIFO_B                       /* if0020.h */ 0x0000c76f
 #define HOPPER_CHANNEL_GPFIFO_A                                      0x0000c86f
 #define BLACKWELL_CHANNEL_GPFIFO_A                                   0x0000c96f
+#define BLACKWELL_CHANNEL_GPFIFO_B                                   0x0000ca6f
 
 #define NV50_DISP                                     /* if0010.h */ 0x00005070
 #define G82_DISP                                      /* if0010.h */ 0x00008270
@@ -106,8 +108,10 @@
 #define TU102_DISP                                    /* if0010.h */ 0x0000c570
 #define GA102_DISP                                    /* if0010.h */ 0x0000c670
 #define AD102_DISP                                    /* if0010.h */ 0x0000c770
+#define GB202_DISP                                                   0x0000ca70
 
 #define GV100_DISP_CAPS                                              0x0000c373
+#define GB202_DISP_CAPS                                              0x0000ca73
 
 #define NV31_MPEG                                                    0x00003174
 #define G82_MPEG                                                     0x00008274
@@ -122,6 +126,7 @@
 #define GV100_DISP_CURSOR                             /* if0014.h */ 0x0000c37a
 #define TU102_DISP_CURSOR                             /* if0014.h */ 0x0000c57a
 #define GA102_DISP_CURSOR                             /* if0014.h */ 0x0000c67a
+#define GB202_DISP_CURSOR                                            0x0000ca7a
 
 #define NV50_DISP_OVERLAY                             /* if0014.h */ 0x0000507b
 #define G82_DISP_OVERLAY                              /* if0014.h */ 0x0000827b
@@ -132,6 +137,7 @@
 #define GV100_DISP_WINDOW_IMM_CHANNEL_DMA             /* if0014.h */ 0x0000c37b
 #define TU102_DISP_WINDOW_IMM_CHANNEL_DMA             /* if0014.h */ 0x0000c57b
 #define GA102_DISP_WINDOW_IMM_CHANNEL_DMA             /* if0014.h */ 0x0000c67b
+#define GB202_DISP_WINDOW_IMM_CHANNEL_DMA                            0x0000ca7b
 
 #define NV50_DISP_BASE_CHANNEL_DMA                    /* if0014.h */ 0x0000507c
 #define G82_DISP_BASE_CHANNEL_DMA                     /* if0014.h */ 0x0000827c
@@ -157,6 +163,7 @@
 #define TU102_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c57d
 #define GA102_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c67d
 #define AD102_DISP_CORE_CHANNEL_DMA                   /* if0014.h */ 0x0000c77d
+#define GB202_DISP_CORE_CHANNEL_DMA                                  0x0000ca7d
 
 #define NV50_DISP_OVERLAY_CHANNEL_DMA                 /* if0014.h */ 0x0000507e
 #define G82_DISP_OVERLAY_CHANNEL_DMA                  /* if0014.h */ 0x0000827e
@@ -168,6 +175,7 @@
 #define GV100_DISP_WINDOW_CHANNEL_DMA                 /* if0014.h */ 0x0000c37e
 #define TU102_DISP_WINDOW_CHANNEL_DMA                 /* if0014.h */ 0x0000c57e
 #define GA102_DISP_WINDOW_CHANNEL_DMA                 /* if0014.h */ 0x0000c67e
+#define GB202_DISP_WINDOW_CHANNEL_DMA                                0x0000ca7e
 
 #define NV50_TESLA                                                   0x00005097
 #define G82_TESLA                                                    0x00008297
@@ -201,6 +209,7 @@
 #define HOPPER_A                                                     0x0000cb97
 
 #define BLACKWELL_A                                                  0x0000cd97
+#define BLACKWELL_B                                                  0x0000ce97
 
 #define NV74_BSP                                                     0x000074b0
 
@@ -210,6 +219,7 @@
 #define NVC7B0_VIDEO_DECODER                                         0x0000c7b0
 #define NVC9B0_VIDEO_DECODER                                         0x0000c9b0
 #define NVCDB0_VIDEO_DECODER                                         0x0000cdb0
+#define NVCFB0_VIDEO_DECODER                                         0x0000cfb0
 
 #define GT212_MSVLD                                                  0x000085b1
 #define IGT21A_MSVLD                                                 0x000086b1
@@ -240,10 +250,12 @@
 #define AMPERE_DMA_COPY_B                                            0x0000c7b5
 #define HOPPER_DMA_COPY_A                                            0x0000c8b5
 #define BLACKWELL_DMA_COPY_A                                         0x0000c9b5
+#define BLACKWELL_DMA_COPY_B                                         0x0000cab5
 
 #define NVC4B7_VIDEO_ENCODER                                         0x0000c4b7
 #define NVC7B7_VIDEO_ENCODER                                         0x0000c7b7
 #define NVC9B7_VIDEO_ENCODER                                         0x0000c9b7
+#define NVCFB7_VIDEO_ENCODER                                         0x0000cfb7
 
 #define FERMI_DECOMPRESS                                             0x000090b8
 
@@ -264,6 +276,7 @@
 #define ADA_COMPUTE_A                                                0x0000c9c0
 #define HOPPER_COMPUTE_A                                             0x0000cbc0
 #define BLACKWELL_COMPUTE_A                                          0x0000cdc0
+#define BLACKWELL_COMPUTE_B                                          0x0000cec0
 
 #define NV74_CIPHER                                                  0x000074c1
 
@@ -271,10 +284,12 @@
 #define NVC4D1_VIDEO_NVJPG                                           0x0000c4d1
 #define NVC9D1_VIDEO_NVJPG                                           0x0000c9d1
 #define NVCDD1_VIDEO_NVJPG                                           0x0000cdd1
+#define NVCFD1_VIDEO_NVJPG                                           0x0000cfd1
 
 #define NVB8FA_VIDEO_OFA                                             0x0000b8fa
 #define NVC6FA_VIDEO_OFA                                             0x0000c6fa
 #define NVC7FA_VIDEO_OFA                                             0x0000c7fa
 #define NVC9FA_VIDEO_OFA                                             0x0000c9fa
 #define NVCDFA_VIDEO_OFA                                             0x0000cdfa
+#define NVCFFA_VIDEO_OFA                                             0x0000cffa
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index 0664195e5684..99579e7b9376 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -49,6 +49,7 @@ struct nvkm_device {
 		GH100    = 0x180,
 		AD100    = 0x190,
 		GB10x    = 0x1a0,
+		GB20x    = 0x1b0,
 	} card_type;
 	u32 chipset;
 	u8  chiprev;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
index 7bd73f9f749b..e0d777a933e1 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fb.h
@@ -104,6 +104,7 @@ int ga100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct n
 int ga102_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int gh100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 int gb100_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
+int gb202_fb_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fb **);
 
 #include <subdev/bios.h>
 #include <subdev/bios/ramcfg.h>
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
index 7122f814e4d0..8a3dbb1cbb46 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/fsp.h
@@ -20,4 +20,5 @@ int nvkm_fsp_boot_gsp_fmc(struct nvkm_fsp *, u64 args_addr, u32 rsvd_size, bool
 
 int gh100_fsp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
 int gb100_fsp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
+int gb202_fsp_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_fsp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 534a38feed7b..1c9f7a7a87bc 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -506,4 +506,5 @@ int ga102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_
 int gh100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int ad102_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 int gb100_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
+int gb202_gsp_new(struct nvkm_device *, enum nvkm_subdev_type, int, struct nvkm_gsp **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1a9a74c26e8e..b96f0555ca14 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1000,6 +1000,7 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 			    struct ttm_resource *, struct ttm_resource *);
 		int (*init)(struct nouveau_channel *, u32 handle);
 	} _methods[] = {
+		{  "COPY", 4, 0xcab5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "COPY", 4, 0xc9b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "COPY", 4, 0xc8b5, nve0_bo_move_copy, nve0_bo_move_init },
 		{  "COPY", 4, 0xc7b5, nve0_bo_move_copy, nve0_bo_move_init },
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 726de0aa0fcf..b1e92b1f7a26 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -249,6 +249,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
 	const struct nvif_mclass hosts[] = {
+		{ BLACKWELL_CHANNEL_GPFIFO_B, 0 },
 		{ BLACKWELL_CHANNEL_GPFIFO_A, 0 },
 		{    HOPPER_CHANNEL_GPFIFO_A, 0 },
 		{    AMPERE_CHANNEL_GPFIFO_B, 0 },
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 0be604af5b29..0c82a63cd49d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -511,6 +511,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
 		case AMPERE_CHANNEL_GPFIFO_B:
 		case HOPPER_CHANNEL_GPFIFO_A:
 		case BLACKWELL_CHANNEL_GPFIFO_A:
+		case BLACKWELL_CHANNEL_GPFIFO_B:
 			ret = gv100_fence_create(drm);
 			break;
 		default:
diff --git a/drivers/gpu/drm/nouveau/nvif/user.c b/drivers/gpu/drm/nouveau/nvif/user.c
index ae470a1fdfb8..53f03fa1c9c2 100644
--- a/drivers/gpu/drm/nouveau/nvif/user.c
+++ b/drivers/gpu/drm/nouveau/nvif/user.c
@@ -41,10 +41,11 @@ nvif_user_ctor(struct nvif_device *device, const char *name)
 		int version;
 		const struct nvif_user_func *func;
 	} users[] = {
-		{ HOPPER_USERMODE_A, -1, &nvif_userc361 },
-		{ AMPERE_USERMODE_A, -1, &nvif_userc361 },
-		{ TURING_USERMODE_A, -1, &nvif_userc361 },
-		{  VOLTA_USERMODE_A, -1, &nvif_userc361 },
+		{ BLACKWELL_USERMODE_A, -1, &nvif_userc361 },
+		{    HOPPER_USERMODE_A, -1, &nvif_userc361 },
+		{    AMPERE_USERMODE_A, -1, &nvif_userc361 },
+		{    TURING_USERMODE_A, -1, &nvif_userc361 },
+		{     VOLTA_USERMODE_A, -1, &nvif_userc361 },
 		{}
 	};
 	int cid, ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
index 8bf1635ffabc..9754bac65df7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
@@ -10,3 +10,4 @@ nvkm-y += nvkm/engine/ce/gv100.o
 nvkm-y += nvkm/engine/ce/tu102.o
 nvkm-y += nvkm/engine/ce/ga100.o
 nvkm-y += nvkm/engine/ce/ga102.o
+nvkm-y += nvkm/engine/ce/gb202.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c
new file mode 100644
index 000000000000..37c3c619c71b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gb202.c
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gb202/dev_ce.h>
+
+u32
+gb202_ce_grce_mask(struct nvkm_device *device)
+{
+	u32 data = nvkm_rd32(device, NV_CE_GRCE_MASK);
+
+	return NVVAL_GET(data, NV_CE, GRCE_MASK, VALUE);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
index 806a76a72249..34fd2657134b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
@@ -16,4 +16,6 @@ int ga100_ce_oneinit(struct nvkm_engine *);
 int ga100_ce_init(struct nvkm_engine *);
 int ga100_ce_fini(struct nvkm_engine *, bool);
 int ga100_ce_nonstall(struct nvkm_engine *);
+
+u32 gb202_ce_grce_mask(struct nvkm_device *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index f6f23cbc7a73..3375a59ebf1a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2832,6 +2832,86 @@ nv1a2_chipset = {
 	.fifo     = { 0x00000001, ga102_fifo_new },
 };
 
+static const struct nvkm_device_chip
+nv1b2_chipset = {
+	.name = "GB202",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb202_fb_new },
+	.fsp      = { 0x00000001, gb202_fsp_new },
+	.gsp      = { 0x00000001, gb202_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ga102_disp_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
+static const struct nvkm_device_chip
+nv1b3_chipset = {
+	.name = "GB203",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb202_fb_new },
+	.fsp      = { 0x00000001, gb202_fsp_new },
+	.gsp      = { 0x00000001, gb202_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ga102_disp_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
+static const struct nvkm_device_chip
+nv1b5_chipset = {
+	.name = "GB205",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb202_fb_new },
+	.fsp      = { 0x00000001, gb202_fsp_new },
+	.gsp      = { 0x00000001, gb202_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ga102_disp_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
+static const struct nvkm_device_chip
+nv1b6_chipset = {
+	.name = "GB206",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb202_fb_new },
+	.fsp      = { 0x00000001, gb202_fsp_new },
+	.gsp      = { 0x00000001, gb202_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ga102_disp_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
+static const struct nvkm_device_chip
+nv1b7_chipset = {
+	.name = "GB207",
+	.bar      = { 0x00000001, tu102_bar_new },
+	.fb       = { 0x00000001, gb202_fb_new },
+	.fsp      = { 0x00000001, gb202_fsp_new },
+	.gsp      = { 0x00000001, gb202_gsp_new },
+	.imem     = { 0x00000001, gh100_instmem_new },
+	.mmu      = { 0x00000001, gh100_mmu_new },
+	.pci      = { 0x00000001, gh100_pci_new },
+	.timer    = { 0x00000001, gk20a_timer_new },
+	.vfn      = { 0x00000001, ga100_vfn_new },
+	.disp     = { 0x00000001, ga102_disp_new },
+	.fifo     = { 0x00000001, ga102_fifo_new },
+};
+
 struct nvkm_subdev *
 nvkm_device_subdev(struct nvkm_device *device, int type, int inst)
 {
@@ -3150,6 +3230,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 		case 0x180: device->card_type = GH100; break;
 		case 0x190: device->card_type = AD100; break;
 		case 0x1a0: device->card_type = GB10x; break;
+		case 0x1b0: device->card_type = GB20x; break;
 		default:
 			break;
 		}
@@ -3260,6 +3341,11 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
 	case 0x197: device->chip = &nv197_chipset; break;
 	case 0x1a0: device->chip = &nv1a0_chipset; break;
 	case 0x1a2: device->chip = &nv1a2_chipset; break;
+	case 0x1b2: device->chip = &nv1b2_chipset; break;
+	case 0x1b3: device->chip = &nv1b3_chipset; break;
+	case 0x1b5: device->chip = &nv1b5_chipset; break;
+	case 0x1b6: device->chip = &nv1b6_chipset; break;
+	case 0x1b7: device->chip = &nv1b7_chipset; break;
 	default:
 		if (nvkm_boolopt(device->cfgopt, "NvEnableUnsupportedChipsets", false)) {
 			switch (device->chipset) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 69c8b73d6055..721d32321fb5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -150,6 +150,7 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 	case AD100: args->v0.family = NV_DEVICE_INFO_V0_ADA; break;
 	case GH100: args->v0.family = NV_DEVICE_INFO_V0_HOPPER; break;
 	case GB10x: args->v0.family = NV_DEVICE_INFO_V0_BLACKWELL; break;
+	case GB20x: args->v0.family = NV_DEVICE_INFO_V0_BLACKWELL; break;
 	default:
 		args->v0.family = 0;
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
index 5a074b9970ab..376e9c3bcb1a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
@@ -25,6 +25,7 @@ nvkm-y += nvkm/engine/fifo/gv100.o
 nvkm-y += nvkm/engine/fifo/tu102.o
 nvkm-y += nvkm/engine/fifo/ga100.o
 nvkm-y += nvkm/engine/fifo/ga102.o
+nvkm-y += nvkm/engine/fifo/gb202.o
 
 nvkm-y += nvkm/engine/fifo/ucgrp.o
 nvkm-y += nvkm/engine/fifo/uchan.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c
new file mode 100644
index 000000000000..b469e8afeb0b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gb202.c
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+#include "cgrp.h"
+#include "chan.h"
+#include "runl.h"
+
+u32
+gb202_chan_doorbell_handle(struct nvkm_chan *chan)
+{
+	return BIT(30) | (chan->cgrp->runl->id << 16) | chan->id;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
index 9ebb35c31db0..5e81ae195329 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/priv.h
@@ -208,6 +208,8 @@ extern const struct nvkm_engn_func ga100_engn_ce;
 extern const struct nvkm_cgrp_func ga100_cgrp;
 extern const struct nvkm_chan_func ga100_chan;
 
+u32 gb202_chan_doorbell_handle(struct nvkm_chan *);
+
 int nvkm_uchan_new(struct nvkm_fifo *, struct nvkm_cgrp *, const struct nvkm_oclass *,
 		   void *argv, u32 argc, struct nvkm_object **);
 int nvkm_ucgrp_new(struct nvkm_fifo *, const struct nvkm_oclass *, void *argv, u32 argc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
index b438a57f2efc..8d8a5382d1b1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/Kbuild
@@ -37,6 +37,7 @@ nvkm-y += nvkm/subdev/fb/ga100.o
 nvkm-y += nvkm/subdev/fb/ga102.o
 nvkm-y += nvkm/subdev/fb/gh100.o
 nvkm-y += nvkm/subdev/fb/gb100.o
+nvkm-y += nvkm/subdev/fb/gb202.o
 
 nvkm-y += nvkm/subdev/fb/r535.o
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
new file mode 100644
index 000000000000..848505026d02
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gb10b/dev_fbhub.h>
+
+static void
+gb202_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
+{
+	struct nvkm_device *device = fb->subdev.device;
+	const u64 addr = fb->sysmem.flush_page_addr;
+
+	nvkm_wr32(device, NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI, upper_32_bits(addr));
+	nvkm_wr32(device, NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO, lower_32_bits(addr));
+}
+
+static const struct nvkm_fb_func
+gb202_fb = {
+	.sysmem.flush_page_init = gb202_fb_sysmem_flush_page_init,
+	.vidmem.size = ga102_fb_vidmem_size,
+};
+
+int
+gb202_fb_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_fb **pfb)
+{
+	return r535_fb_new(&gb202_fb, device, type, inst, pfb);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
index 337772acdddc..1a9ded3a86f8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/Kbuild
@@ -5,3 +5,4 @@
 nvkm-y += nvkm/subdev/fsp/base.o
 nvkm-y += nvkm/subdev/fsp/gh100.o
 nvkm-y += nvkm/subdev/fsp/gb100.o
+nvkm-y += nvkm/subdev/fsp/gb202.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c
new file mode 100644
index 000000000000..3438aac6383e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fsp/gb202.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+#include <nvhw/drf.h>
+#include <nvhw/ref/gb202/dev_therm.h>
+
+static int
+gb202_fsp_wait_secure_boot(struct nvkm_fsp *fsp)
+{
+	struct nvkm_device *device = fsp->subdev.device;
+	unsigned timeout_ms = 4000;
+
+	do {
+		u32 status = NVKM_RD32(device, NV_THERM, I2CS_SCRATCH, FSP_BOOT_COMPLETE_STATUS);
+
+		if (status == NV_THERM_I2CS_SCRATCH_FSP_BOOT_COMPLETE_STATUS_SUCCESS)
+			return 0;
+
+		usleep_range(1000, 2000);
+	} while (timeout_ms--);
+
+	return -ETIMEDOUT;
+}
+
+static const struct nvkm_fsp_func
+gb202_fsp = {
+	.wait_secure_boot = gb202_fsp_wait_secure_boot,
+	.cot = {
+		.version = 2,
+		.size_hash = 48,
+		.size_pkey = 97,
+		.size_sig = 96,
+		.boot_gsp_fmc = gh100_fsp_boot_gsp_fmc,
+	},
+};
+
+int
+gb202_fsp_new(struct nvkm_device *device,
+	      enum nvkm_subdev_type type, int inst, struct nvkm_fsp **pfsp)
+{
+	return nvkm_fsp_new_(&gb202_fsp, device, type, inst, pfsp);
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
index 4aebea4f6a64..e9c948b67bbd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
@@ -10,5 +10,6 @@ nvkm-y += nvkm/subdev/gsp/ga102.o
 nvkm-y += nvkm/subdev/gsp/gh100.o
 nvkm-y += nvkm/subdev/gsp/ad102.o
 nvkm-y += nvkm/subdev/gsp/gb100.o
+nvkm-y += nvkm/subdev/gsp/gb202.o
 
 include $(src)/nvkm/subdev/gsp/rm/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
new file mode 100644
index 000000000000..c1d718172ddf
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/gb202.c
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "priv.h"
+
+static const struct nvkm_gsp_func
+gb202_gsp = {
+	.flcn = &ga102_gsp_flcn,
+
+	.sig_section = ".fwsignature_gb20x",
+
+	.dtor = r535_gsp_dtor,
+	.oneinit = gh100_gsp_oneinit,
+	.init = gh100_gsp_init,
+	.fini = gh100_gsp_fini,
+
+	.rm.gpu = &gb20x_gpu,
+};
+
+static struct nvkm_gsp_fwif
+gb202_gsps[] = {
+	{ 0, gh100_gsp_load, &gb202_gsp, &r570_rm_gb20x, "570.144", true },
+	{}
+};
+
+int
+gb202_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_gsp **pgsp)
+{
+	return nvkm_gsp_new_(gb202_gsps, device, type, inst, pgsp);
+}
+
+NVKM_GSP_FIRMWARE_FMC(gb202, 570.144);
+NVKM_GSP_FIRMWARE_FMC(gb203, 570.144);
+NVKM_GSP_FIRMWARE_FMC(gb205, 570.144);
+NVKM_GSP_FIRMWARE_FMC(gb206, 570.144);
+NVKM_GSP_FIRMWARE_FMC(gb207, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index a963bb7e0475..8e9b791d7804 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -12,6 +12,7 @@ nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
 nvkm-y += nvkm/subdev/gsp/rm/gh100.o
 nvkm-y += nvkm/subdev/gsp/rm/gb10x.o
+nvkm-y += nvkm/subdev/gsp/rm/gb20x.o
 
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
 include $(src)/nvkm/subdev/gsp/rm/r570/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c
new file mode 100644
index 000000000000..950471d9996e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gb20x.c
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+#include <engine/ce/priv.h>
+#include <engine/fifo/priv.h>
+
+#include <nvif/class.h>
+
+const struct nvkm_rm_gpu
+gb20x_gpu = {
+	.disp.class = {
+		.root = GB202_DISP,
+		.caps = GB202_DISP_CAPS,
+		.core = GB202_DISP_CORE_CHANNEL_DMA,
+		.wndw = GB202_DISP_WINDOW_CHANNEL_DMA,
+		.wimm = GB202_DISP_WINDOW_IMM_CHANNEL_DMA,
+		.curs = GB202_DISP_CURSOR,
+	},
+
+	.usermode.class = BLACKWELL_USERMODE_A,
+
+	.fifo.chan = {
+		.class = BLACKWELL_CHANNEL_GPFIFO_B,
+		.doorbell_handle = gb202_chan_doorbell_handle,
+	},
+
+	.ce = {
+		.class = BLACKWELL_DMA_COPY_B,
+		.grce_mask = gb202_ce_grce_mask,
+	},
+	.gr.class = {
+		.i2m = BLACKWELL_INLINE_TO_MEMORY_A,
+		.twod = FERMI_TWOD_A,
+		.threed = BLACKWELL_B,
+		.compute = BLACKWELL_COMPUTE_B,
+	},
+	.nvdec.class = NVCFB0_VIDEO_DECODER,
+	.nvenc.class = NVCFB7_VIDEO_ENCODER,
+	.nvjpg.class = NVCFD1_VIDEO_NVJPG,
+	.ofa.class = NVCFFA_VIDEO_OFA,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
index 77aa7b13a3af..46a6325641b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -31,6 +31,7 @@ struct nvkm_rm_gpu {
 
 	struct {
 		u32 class;
+		u32 (*grce_mask)(struct nvkm_device *);
 	} ce;
 
 	struct {
@@ -65,4 +66,5 @@ extern const struct nvkm_rm_gpu ga1xx_gpu;
 extern const struct nvkm_rm_gpu ad10x_gpu;
 extern const struct nvkm_rm_gpu gh100_gpu;
 extern const struct nvkm_rm_gpu gb10x_gpu;
+extern const struct nvkm_rm_gpu gb20x_gpu;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 2a41b2ed347c..5bc8e767ead4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -622,6 +622,22 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 			continue;
 		}
 
+		/* Skip SW engine - there's currently no support for NV SW classes. */
+		if (type == NVKM_ENGINE_SW)
+			continue;
+
+		/* Skip lone GRCEs (ones not paired with GR on a runlist), as they
+		 * don't appear to function as async copy engines.
+		 */
+		if (type == NVKM_ENGINE_CE &&
+		     rm->gpu->ce.grce_mask &&
+		    (rm->gpu->ce.grce_mask(device) & BIT(inst)) &&
+		    !nvkm_runl_find_engn(engn, runl, engn->engine->subdev.type == NVKM_ENGINE_GR)) {
+			RUNL_DEBUG(runl, "skip LCE %d - GRCE without GR", inst);
+			nvkm_runl_del(runl);
+			continue;
+		}
+
 		ret = nvkm_rm_engine_new(gsp->rm, type, inst);
 		if (ret) {
 			nvkm_runl_del(runl);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
index 5a5c4f962e5b..2276ca251aa6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
@@ -39,6 +39,16 @@ r570_wpr_libos3_gb10x = {
 	.offset_set_by_acr = true,
 };
 
+static const struct nvkm_rm_wpr
+r570_wpr_libos3_gb20x = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_GH100,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+	.heap_size_non_wpr = 0x220000,
+	.rsvd_size_pmu = ALIGN(0x0800000 + 0x1000000 + 0x0001000, 0x20000),
+	.offset_set_by_acr = true,
+};
+
 static const struct nvkm_rm_api
 r570_api = {
 	.gsp = &r570_gsp,
@@ -80,3 +90,9 @@ r570_rm_gb10x = {
 	.wpr = &r570_wpr_libos3_gb10x,
 	.api = &r570_api,
 };
+
+const struct nvkm_rm_impl
+r570_rm_gb20x = {
+	.wpr = &r570_wpr_libos3_gb20x,
+	.api = &r570_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 9ca7b5defdc7..829a05605da7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -178,6 +178,7 @@ extern const struct nvkm_rm_impl r570_rm_tu102;
 extern const struct nvkm_rm_impl r570_rm_ga102;
 extern const struct nvkm_rm_impl r570_rm_gh100;
 extern const struct nvkm_rm_impl r570_rm_gb10x;
+extern const struct nvkm_rm_impl r570_rm_gb20x;
 extern const struct nvkm_rm_api_gsp r570_gsp;
 extern const struct nvkm_rm_api_client r570_client;
 extern const struct nvkm_rm_api_fbsr r570_fbsr;
-- 
2.49.0

