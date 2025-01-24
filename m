Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF91A1BC12
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9910E156;
	Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XkhpOmD1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9619210E57E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P58VWj41G2D++xhaOfFf7XTdGjx/m+ZPQHd6dFDwekdPxyEw1snqRH1VoIoE0gSjhWB2yW+tM1sRdWW34cvElhYGLGGW1oyYocLyZgysckn73X82lB7iYOQWyUja8BlCfqipZIHF+C4yLR1vH+XlGQvlgsjKjQlMJwpE+ziBaxAeP/IYbkCNX+kthW+3IXbquvcyrOPxxwcKPg+ejhKtITWeImD8+hCTASYpahWfDYXeRcJOICAJeTtI7F4thVm98j7bwt5KJtnIG1RWwmeF4fqPVI41XiW9ucnDU3hBuEYGMdmFF+axFf0NKc5FDk2U8S3YofyCRD5O5uNHXW4mQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1Ptps4hMgLQ86vk0f8WQBFl8d0yNa8XtB0ZX5s5Kwk=;
 b=i5LMq2sExLNgromyOLL17iDH1HDiUifIFUtiUESDYJioc+OikPsn//K0snTRUAy5/SGVvTuwWh56NPNL9EMjZdXaqmWw+NK7nx04Q9fClXHznqm6NK5F0j800ODeKs/p5emHTEq+uG5HPLT4wMm/szb0UsGPj8pctTIFFb+GVZwJQDdfsAN1kL55+IL+4ujbfZUAw2FwoYsAoy4AtR9jj2mube74R91pzLPrsUzCvy7w3VukPE7MELBLtmdGdVAtDyyckypHtMIrWxyIDHzpccyGSbdfYbXpaN46YG6AhUjguPZJ/gTHVHVU0ERj0yOxdH/WPIyHd2ze2CK8gAL9TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1Ptps4hMgLQ86vk0f8WQBFl8d0yNa8XtB0ZX5s5Kwk=;
 b=XkhpOmD1U8/GCMbRHRVQ0e95EcJV6EIuEbd7P+m1RfRaZUjSgsnIemwEa3zUj9oO75RpIqCGG9/FonwIrkDSTEf4RBOrTLAx2OAe3JXPyG/qpA95uVkg0bukVnEwIzzepOeipfbW4jUEKBB5oc3LbSwzZp0KIId/npMR/n2moovMYHpw9/YDv9lMD5QApwoZfACuKTQ8JGxzgP7qB9pP/BzzNHzL/LCUjJvN4Imqa6kiJkxltt4NQYtIjYTeEILCbgaZe9GNurm0pTWAOFnY6EBoe/w/lg4/pVrgi8ySMcGuFgmfb9c6RD8idm44rVehmhP9Tz4T1RqhCEAkbCAHSQ==
Received: from DS7PR03CA0032.namprd03.prod.outlook.com (2603:10b6:5:3b5::7) by
 IA1PR12MB7565.namprd12.prod.outlook.com (2603:10b6:208:42f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 18:30:40 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::2e) by DS7PR03CA0032.outlook.office365.com
 (2603:10b6:5:3b5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Fri,
 24 Jan 2025 18:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:25 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:25 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:24 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 01/15] drm/nouveau: add a kernel doc to introduce the GSP
 RPC
Date: Fri, 24 Jan 2025 10:29:44 -0800
Message-ID: <20250124182958.2040494-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|IA1PR12MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 9230fa86-46b7-42bc-999a-08dd3ca53469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wCzwU0O2KNairs4kNXmKVacIu09jT07MF6jn35lEppNbNqaiM1SVby1UJN4T?=
 =?us-ascii?Q?Pyhe4EL9I6+b9aVMqmV7LmjEdVAawi/mGR//K9CZ1DqkeLuatZxp7MOR32TK?=
 =?us-ascii?Q?6UNuppMRxMTU9pOtjKayMcJlMesHlha0Xv/UJxgzAnu77euv0MJIVcGSaEuA?=
 =?us-ascii?Q?u84M+JgVXspdn/xhAxN/rdrEXsE0xArNxNGE8x0Brx65tCLtILWB/1iKaJUZ?=
 =?us-ascii?Q?uwqhUPVEtyiqIBQTgsfDlEFeqrLp9vjevX8qJ4bQyTdsNmlXTrME7XtFs3yi?=
 =?us-ascii?Q?Xi4mY7XXtrTn4YAoh5vde36TdcdCxUwzu71/kP2UGA9sBTnxjJ3YdnrusRUZ?=
 =?us-ascii?Q?QOmGta6E5+2Kwu7COM1fwKCxfSqNyXAJ7j4zCgJ17JRhf6LHyVPpY7GhklYR?=
 =?us-ascii?Q?ExS353QWivJEJHKBcUJVklsyo9k8pBrUIHaZXPTQjPd+KsZAombfFpBgcs2x?=
 =?us-ascii?Q?LYu1QKdnlBL0cG6JXyBGj09hm79QY4gaXNPByG3PKgi734ccUeYN0QSV/1T7?=
 =?us-ascii?Q?31PCz5f8ONvXw+TAobKQ3WxKOiUC7qTr/F4aKgwdE6KTWsZFRhf9Z5XBWIYw?=
 =?us-ascii?Q?taw3u0bDwXNpCqhAGXF67BZ8cH6o7ky38WH0/mRlDJbj5JW+GAmbBji2SQjE?=
 =?us-ascii?Q?5HB6Gg9wZP0N41rP2i5Sj7nwB2DM5+RodrAcC9NMc7xAw2hhYJqO/qNL8ysv?=
 =?us-ascii?Q?fDkcrPtPrTT/oM/Onj9E6+gjEU+o9asvf8h1vc27krIB3+dhDFpZkbDCU+6N?=
 =?us-ascii?Q?S+gSzmBU9S7mRZ/y3tCLBPzRg2NEQU+bRjXU4G4/kg8ludvvbB5URCX+F1vm?=
 =?us-ascii?Q?sD5P1E2nC6gYgfRHvRGJ7ZBXUygr/TfBTzim8TullGBaVxbK0t2IARMUiKvG?=
 =?us-ascii?Q?8XvuUdnAX8fCt3GyOvkdKzn/n7hmTRbZtT0rDjuxoJrtVFdJEn//DP50L53N?=
 =?us-ascii?Q?D/UumyorTNnH1w/pP3derR3WRy/SVDDEDDUvrHCwgt1J2G06AuflaxhlMd9g?=
 =?us-ascii?Q?XaWPmoakAOTZ7mlARQhJMdIwahTgMWQrxerQCNvHt3TRwZwZHrU/2sZhoRJV?=
 =?us-ascii?Q?i67rhzsLZYXeEetX4W60pCJlqCZa7KLY6nOZlTFkDh6i3LN7GyfJBYY/F9MM?=
 =?us-ascii?Q?EqqBBp0/dfZq7Ldgz+5BoM7K4aAKEpJgHjXSQD9jQ8hCOkOs+pgiHATbPRpx?=
 =?us-ascii?Q?q9MWronkDomFCBmg2B/FMR/HbuVn9AXhMb5W1jFNq9tHY8hXY1lSF50ecKNQ?=
 =?us-ascii?Q?Rvdq1sR7e0kNkENYtyUwWn2iLYKQqwqkMwU+9jCrZKfnm/XgTxaCm2NrGzni?=
 =?us-ascii?Q?6K7iypu2HJ+DMnIplYkdhbd4wocr2U4l9oEiFIAMxx6X+sw2ywgiXWrK1gFT?=
 =?us-ascii?Q?QK7TZdy3LTpdYH++uk9o88hUkOy2iIiIAVJQpN09vBBj/KjL9dmaJVcrDhv6?=
 =?us-ascii?Q?pX1X9B0d6tUAkL+No6ypnI0AWCWc09cffCGix/7XCWOGd8N2jXqMHqs9rteJ?=
 =?us-ascii?Q?0cymaOoXx+2Ae/E=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:40.1678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9230fa86-46b7-42bc-999a-08dd3ca53469
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7565
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

In order to explain the name clean-ups in GSP RPC routines, a kernel
doc to explain the memory layout and terms is required.

Add a kernel doc to introduce the GSP RPC.

Cc: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/drivers.rst                 |  1 +
 Documentation/gpu/nouveau.rst                 | 27 +++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 45 +++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 Documentation/gpu/nouveau.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index 1f17ad0790d7..74fc2cbf1b6f 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -10,6 +10,7 @@ GPU Driver Documentation
    imagination/index
    mcde
    meson
+   nouveau
    pl111
    tegra
    tve200
diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
new file mode 100644
index 000000000000..127e15c92b74
--- /dev/null
+++ b/Documentation/gpu/nouveau.rst
@@ -0,0 +1,27 @@
+===============================
+ drm/nouveau NVIDIA GPU Driver
+===============================
+
+The drm/nouveau driver provides support for a wide range of NVIDIA GPUs,
+covering GeForce, Quadro, and Tesla series, from the NV04 architecture up
+to the latest Turing, Ampere, Ada families.
+
+NVKM: NVIDIA Kernel Manager
+===========================
+
+The NVKM component serves as the core abstraction layer within the nouveau
+driver, responsible for managing NVIDIA GPU hardware at the kernel level.
+NVKM provides a unified interface for handling various GPU  architectures.
+
+It enables resource management, power control, memory handling, and command
+submission required for the proper functioning of NVIDIA GPUs under the
+nouveau driver.
+
+NVKM plays a critical role in abstracting hardware complexities and
+providing a consistent API to upper layers of the driver stack.
+
+GSP Support
+------------------------
+
+.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+   :doc: GSP message queue element
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 58502102926b..2a315fe55857 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -63,6 +63,51 @@ extern struct dentry *nouveau_debugfs_root;
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
 
+/**
+ * DOC: GSP message queue element
+ *
+ * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/535/src/nvidia/inc/kernel/gpu/gsp/message_queue_priv.h
+ *
+ * The GSP command queue and status queue are message queues for the
+ * communication between software and GSP. The software submits the GSP
+ * RPC via the GSP command queue, GSP writes the status of the submitted
+ * RPC in the status queue.
+ *
+ * A GSP message queue element consists of three parts:
+ *
+ * - message element header (struct r535_gsp_msg), which mostly maintains
+ * the metadata for queuing the element.
+ *
+ * - RPC message header (struct nvfw_gsp_rpc), which maintains the info
+ * of the RPC. E.g., the RPC function number.
+ *
+ * - The payload, where the RPC message stays. E.g. the params of a
+ * specific RPC function. Some RPC functions also have their headers
+ * in the payload. E.g. rm_alloc, rm_control.
+ *
+ * The memory layout of a GSP message element can be illustrated below::
+ *
+ *    +------------------------+
+ *    | Message Element Header |
+ *    |    (r535_gsp_msg)      |
+ *    |                        |
+ *    | (r535_gsp_msg.data)    |
+ *    |          |             |
+ *    |----------V-------------|
+ *    |    GSP RPC Header      |
+ *    |    (nvfw_gsp_rpc)      |
+ *    |                        |
+ *    | (nvfw_gsp_rpc.data)    |
+ *    |          |             |
+ *    |----------V-------------|
+ *    |       Payload          |
+ *    |                        |
+ *    |   header(optional)     |
+ *    |        params          |
+ *    +------------------------+
+ *
+ */
+
 struct r535_gsp_msg {
 	u8 auth_tag_buffer[16];
 	u8 aad_buffer[16];
-- 
2.34.1

