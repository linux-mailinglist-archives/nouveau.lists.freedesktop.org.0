Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D44940185
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2024 01:07:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE39C10E157;
	Mon, 29 Jul 2024 23:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sf0f7D3g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2043.outbound.protection.outlook.com [40.107.220.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943F110E157
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2024 23:07:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTs2W8X0oQbO8kdaotY+oWQc7uFlI4s6Gm2z6yh/Zx4Xn40w2XIEuElKbaM0wI0vobbBpxPApX/wxEIxafynP0mU+qrJ2xi8PUHhBPgGe+7Qw2MvUNpf6veyb/lRtBjjAD42TCSAiFFucz3H1k1+/jouoIRsifH6jmlAzXPf4YhQfBf7itMzz7w8rYK+/jxqyclDyf2Zkad4mrVIkX+A5k5Kh+P5lFxPFRbctCY1sY6qP2BrZY2UeT0eHIVbLgdig8MoMbIFN5qnF1Lo7hCpwW84Xg+b8oVGl/3NA3V3GuZYitGuVi+SVNRPl+kmunqZ80bp5QqHJnyXFaBz0FLfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jlVytcsn/vNbINotVgoDgymGK6ge2x1wkLypNCfdN4=;
 b=gKF1Sa6HHlVELWK4In+Y9+sYM7y0NdpNJob727yrkFRQ0Yx/h6/XJGyvBftB8Xjdqha+QHGqkX+CYKX4YZcZScTz5VJKLyFBQ7ZfuJiAEjOWIWVHTp2hd1q5eBtrjkPHmmMOH8BPawhHM3rLBcGGNTTCAuqMss6ahasF5LUxAyKN+goXbhRkdKh7b8GDf+sBu1Koqsrz+qLKJJ65kmEV1d9Alrr3Jj97ivTa9lIa2Xkud0iec/UhrgUPsHXZHrf0Bs6tikpV22JGOWPV3DtVFr4o6052vlzO0WnOuwxWxyE4zdBMaeG5S5AP1MsPrSd3aRLXOJKi5I1PJN3CqbzeIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/jlVytcsn/vNbINotVgoDgymGK6ge2x1wkLypNCfdN4=;
 b=sf0f7D3g23a2D5f+AeoSU5p53awXChhJ28+tfjjLKNwvN1nzaIZV3C+Q/0pun8jSG28h8/56dmFHF9Qq2S3r+4iFyi4rZdx1TsZpktMq5+2vF6NX6UtRhfacAEmz/I+Vn+VobumaGulmURPUUitaTRdpl6nSczygVRtJcokl1U2uC8S3utq73BbrmA6jl6+xB/dkj8gAlfszo3xug5MRbVz9oDjOQKtQm9RNomSNksY6gC+Im+CTz6oTy1HQwflX4GYpKVbfHayVnxCl5kRrVSd0drcf3eDyNwyTrW1GKqg41kCJjdyLqdxl/7kn6X2DK5XmFzYhIN1W5FcOs+M8/w==
Received: from CH2PR18CA0019.namprd18.prod.outlook.com (2603:10b6:610:4f::29)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Mon, 29 Jul
 2024 23:07:47 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:610:4f:cafe::5c) by CH2PR18CA0019.outlook.office365.com
 (2603:10b6:610:4f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Mon, 29 Jul 2024 23:07:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343F.mail.protection.outlook.com (10.167.18.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Mon, 29 Jul 2024 23:07:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Jul
 2024 16:07:30 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 29 Jul
 2024 16:07:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Date: Mon, 29 Jul 2024 18:07:20 -0500
Message-ID: <20240729230720.1305760-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240729230720.1305760-1-ttabi@nvidia.com>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 35985712-ecb6-4f24-7ace-08dcb02342ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sYXjuaWDsxpQUgFQ9/EX/LjgYxFmhXpybOWsdWhhFqoZX0zPiO40KoY97rsz?=
 =?us-ascii?Q?W1wLK9oVId2GP7uz8TLYuIy7R9X+eFt4SSzy+dZNSXU27S06wxC/bq/yeltd?=
 =?us-ascii?Q?+AIyrdPFAj4Stvd8hEbXmIu1c2gKIfS0yACrT1pW4LV1L5ufkq3Sp78ZBSIL?=
 =?us-ascii?Q?kKcLc9I5kpfdaofo0CpHx1vf9MqmcAz2k7x3L8KD4cchUI+1z0/Khbhjcf1Q?=
 =?us-ascii?Q?GLO6UXDnTlTKLi1ySTW0W8lmOLIZVlL4y6a/z2K/Bg43FsiG0hpegrod3FEG?=
 =?us-ascii?Q?mZn5d01KEP+46T3vGGirddII7UJptynVvJvPUlf8dPz1YxxKScBwIjsyiwzq?=
 =?us-ascii?Q?6QNeRDoP28LGN/qQKdFEbviIxyFQBuvx7+2vhMFYRKlQWDtgzWuWUSBN6BrW?=
 =?us-ascii?Q?S0BAhAIbdidunG21qxWQ0S0Nk8rFKYOE+RcfRLH0g2GzWvBaOwHkCwzPT3jV?=
 =?us-ascii?Q?nInpNT2UcwOEaBOYJV5R7uGT3HNNHLGStDCE4UzcLQr6VUbd9Lk158Ov7tUV?=
 =?us-ascii?Q?7IU0Y0inBq9gQuTvA83rjZ6h3VZFoaRjoZRSrXzwWMZiog5OM5WarSVPPTKS?=
 =?us-ascii?Q?Q6+n6V7poN+kqUG7iCRlkvPNHEtIP6T68GzdXVOtkACC8Oe38J3nOL2NrKJH?=
 =?us-ascii?Q?N+1xU/yohV7YeMzpz29jlkBesiiScujFLvYKU1nEp4mep9oCe0aG5bfpw5vP?=
 =?us-ascii?Q?PpYwalTq9hZhNoJUzBoh31hVmatOW+6K/+iXsmo1AcYB2SukOunPbAoVhHzA?=
 =?us-ascii?Q?tzXmZRMNB1UyoRKcpskWx22PGKvXViPFPd1NrpZjkzOwF1qf9rdFhUN9++5S?=
 =?us-ascii?Q?olJ/kDP3biBsZ3Dg7tnfPKoWvE97DeAKWJaMRSoJLS0iXF3hNxdws6MHiC/g?=
 =?us-ascii?Q?ugKR9b1WK/sfyTu3bC1IZFkNG0WWsbaJB6Ac2n2X4XaBbocrAHJpAZYci9AO?=
 =?us-ascii?Q?60OoSoXQVBHZiaFxAOUOFOk437AJNjDMyMKGUi6J20mORP2xYiluu24SAHjc?=
 =?us-ascii?Q?jMtzP4pvjIPdXq6W7aV1K58DuMPkBafFkP6zrXWrRNY2PrT4xsqOj5YP20oy?=
 =?us-ascii?Q?bu3q9nclAhxlJu96jOWJ7/C/HmAMTwk1bbDnONdPzXm+hu/eHWQNzT6ZobV3?=
 =?us-ascii?Q?1s16ZzpLwQW5RoH0qqgcVoN1ho0nmWRx9aWH83CzUTIJFmivshOGS9kvZlCf?=
 =?us-ascii?Q?KZ0T4RlS4dIUO01uBxA2OvUNKarF3l9SpHeGSZirKK7SfPUe+NXEPHMM0god?=
 =?us-ascii?Q?jiI0yBpQUPwbPh9ArPh7yeJCPymV/amEb/3LFWo814F/DpF+jNioNNNdgi9J?=
 =?us-ascii?Q?TKDlc7mZWjrN/4yzim2fVh2guLNlmGdjgidzTAiRVkEiJLpELbHZBDmf6jY9?=
 =?us-ascii?Q?+F8bQiNq9JweSDedlgr6n5nmWCY+dzS9nXp76nKv2cY0ijKbptqKo7VLEBOJ?=
 =?us-ascii?Q?FiULPtjnua0/JamB5/5mTUTCD0xWqa5T?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 23:07:46.9533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35985712-ecb6-4f24-7ace-08dcb02342ce
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650
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

The LOGINIT, LOGINTR, LOGRM, and LOGPMU buffers are circular buffers
that have printf-like logs from GSP-RM and PMU encoded in them.

LOGINIT, LOGINTR, and LOGRM are allocated by Nouveau and their DMA
addresses are passed to GSP-RM during initialization. The buffers are
required for GSP-RM to initialize properly.

LOGPMU is also allocated by Nouveau, but its contents are updated
when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
GSP-RM. Nouveau then copies the RPC to the buffer.

The messages are encoded as an array of variable-length structures that
contain the parameters to an NV_PRINTF call. The format string and
parameter count are stored in a special ELF image that contains only
logging strings. This image is not currently shipped with the Nvidia
driver.

There are two methods to extract the logs.

OpenRM tries to load the logging ELF, and if present, parses the log
buffers in real time and outputs the strings to the kernel console.

Alternatively, and this is the method used by this patch, the buffers
can be exposed to user space, and a user-space tool (along with the
logging ELF image) can parse the buffer and dump the logs.

This method has the advantage that it allows the buffers to be parsed
even when the logging ELF file is not available to the user. However,
it has the disadvantage the debubfs entries need to remain until the
driver is unloaded.

The buffers are exposed via debugfs. If GSP-RM fails to initialize,
then Nouveau immediately shuts down the GSP interface. This would
normally also deallocate the logging buffers, thereby preventing the
user from capturing the debug logs.

To avoid this, introduce the keep-gsp-logging command line parameter.
If specified, and if at least one logging buffer has content, then
Nouveau will migrate these buffers into new debugfs entries that are
retained until the driver unloads.

An end-user can capture the logs using the following commands:

    cp /sys/kernel/debug/dri/<path>/loginit loginit
    cp /sys/kernel/debug/dri/<path>/logrm logrm
    cp /sys/kernel/debug/dri/<path>/logintr logintr
    cp /sys/kernel/debug/dri/<path>/logpmu logpmu

where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).

Since LOGPMU is not needed for normal GSP-RM operation, it is only
created if debugfs is available. Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

A simple way to test the buffer migration feature is to have
nvkm_gsp_init() return an error code.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>

v6:
rebased onto drm-misc-next
renamed nvif_log.head to entry
only one space after .
added NVIF_LOGS_DECLARE
added nvif_log_shutdown
documented NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU
removed the "See xxx" comments
replaced camelcase with lowercase in r535_gsp_msg_libos_print
replaced 0x100c with NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT
added r535_gsp_libos_debugfs_fini
miscellaneous comment improvements
---
 drivers/gpu/drm/nouveau/include/nvif/log.h    |  50 +++
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  13 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 402 +++++++++++++++++-
 4 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/log.h b/drivers/gpu/drm/nouveau/include/nvif/log.h
new file mode 100644
index 000000000000..dde931ef503f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/log.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+/* SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. */
+
+#ifndef __NVIF_LOG_H__
+#define __NVIF_LOG_H__
+
+/**
+ * nvif_log - structure for tracking logging buffers
+ * @entry: an entry in a list of struct nvif_logs
+ * @shutdown: pointer to function to call to clean up
+ *
+ * Structure used to track logging buffers so that they can be cleaned up
+ * when the driver exits.
+ *
+ * The @shutdown function is called when the driver exits. It should free all
+ * backing resources, such as logging buffers.
+ */
+struct nvif_log {
+	struct list_head entry;
+	void (*shutdown)(struct nvif_log *log);
+};
+
+#define NVIF_LOGS_DECLARE(_log) \
+	struct nvif_log _log = { LIST_HEAD_INIT(_log.entry) }
+
+static inline void nvif_log_shutdown(struct list_head *logs)
+{
+	if (!list_empty(logs)) {
+		struct nvif_log *log, *n;
+
+		list_for_each_entry_safe(log, n, logs, entry) {
+			/* shutdown() should also delete the log entry */
+			log->shutdown(log);
+		}
+	}
+}
+
+#ifdef CONFIG_DEBUG_FS
+/**
+ * gsp_logs - list of nvif_log GSP-RM logging buffers
+ *
+ * Head pointer to a a list of nvif_log buffers that is created for each GPU
+ * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
+ * specified. This is used to track the alternative debugfs entries for the
+ * GSP-RM logs.
+ */
+extern struct nvif_log gsp_logs;
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index a45a4ad843b9..7de3dc43715c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -5,6 +5,8 @@
 #include <core/falcon.h>
 #include <core/firmware.h>
 
+#include <linux/debugfs.h>
+
 #define GSP_PAGE_SHIFT 12
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
@@ -220,6 +222,17 @@ struct nvkm_gsp {
 
 	/* The size of the registry RPC */
 	size_t registry_rpc_size;
+
+#ifdef CONFIG_DEBUG_FS
+	/*
+	 * Logging buffers in debugfs. The wrapper objects need to remain
+	 * in memory until the dentry is deleted.
+	 */
+	struct debugfs_blob_wrapper blob_init;
+	struct debugfs_blob_wrapper blob_intr;
+	struct debugfs_blob_wrapper blob_rm;
+	struct debugfs_blob_wrapper blob_pmu;
+#endif
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a58c31089613..a848ace5d948 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -46,6 +46,7 @@
 #include <nvif/fifo.h>
 #include <nvif/push006c.h>
 #include <nvif/user.h>
+#include <nvif/log.h>
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -113,6 +114,13 @@ static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
 
+#ifdef CONFIG_DEBUG_FS
+/**
+ * gsp_logs - list of GSP debugfs logging buffers
+ */
+NVIF_LOGS_DECLARE(gsp_logs);
+#endif
+
 static u64
 nouveau_pci_name(struct pci_dev *pdev)
 {
@@ -1446,6 +1454,10 @@ nouveau_drm_exit(void)
 #endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
+
+#ifdef CONFIG_DEBUG_FS
+	nvif_log_shutdown(&gsp_logs.entry);
+#endif
 }
 
 module_init(nouveau_drm_init);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 86450b0cd605..897cb760f92a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -26,6 +26,8 @@
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
 #include <engine/sec2.h>
+#include <drm/drm_device.h>
+#include <nvif/log.h>
 
 #include <nvfw/fw.h>
 
@@ -2076,6 +2078,196 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 	return 0;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+/*
+ * If GSP-RM load fails, then the GSP nvkm object will be deleted, the logging
+ * debugfs entries will be deleted, and it will not be possible to debug the
+ * load failure. The keep_gsp_logging parameter tells Nouveau to copy the
+ * logging buffers to new debugfs entries, and these entries are retained
+ * until the driver unloads.
+ */
+static bool keep_gsp_logging;
+module_param(keep_gsp_logging, bool, 0444);
+MODULE_PARM_DESC(keep_gsp_logging,
+		 "Migrate the GSP-RM logging debugfs entries upon exit");
+
+/*
+ * GSP-RM uses a pseudo-class mechanism to define of a variety of per-"engine"
+ * data structures, and each engine has a "class ID" genererated by a
+ * pre-processor. This is the class ID for the PMU.
+ */
+#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
+
+/**
+ * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
+ * @ucode_eng_desc: the engine descriptor
+ * @libos_print_buf_size: the size of the libos_print_buf[]
+ * @libos_print_buf: the actual buffer
+ *
+ * The engine descriptor is divided into 31:8 "class ID" and 7:0 "instance
+ * ID". We only care about messages from PMU.
+ */
+struct rpc_ucode_libos_print_v1e_08 {
+	u32 ucode_eng_desc;
+	u32 libos_print_buf_size;
+	u8 libos_print_buf[];
+};
+
+/**
+ * r535_gsp_msg_libos_print - capture log message from the PMU
+ * @priv: gsp pointer
+ * @fn: function number (ignored)
+ * @repv: pointer to libos print RPC
+ * @repc: message size
+ *
+ * Called when we receive a UCODE_LIBOS_PRINT event RPC from GSP-RM. This RPC
+ * contains the contents of the libos print buffer from PMU. It is typically
+ * only written to when PMU encounters an error.
+ *
+ * Technically this RPC can be used to pass print buffers from any number of
+ * GSP-RM engines, but we only expect to receive them for the PMU.
+ *
+ * For the PMU, the buffer is 4K in size and the RPC always contains the full
+ * contents.
+ */
+static int
+r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct rpc_ucode_libos_print_v1e_08 *rpc = repv;
+	unsigned int class = rpc->ucode_eng_desc >> 8;
+
+	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
+		   class, rpc->libos_print_buf_size);
+
+	if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
+		nvkm_warn(subdev,
+			  "received libos print from unknown class 0x%x\n",
+			  class);
+		return -ENOMSG;
+	}
+
+	if (rpc->libos_print_buf_size > GSP_PAGE_SIZE) {
+		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
+			   rpc->libos_print_buf_size);
+		return -E2BIG;
+	}
+
+	memcpy(gsp->blob_pmu.data, rpc->libos_print_buf, rpc->libos_print_buf_size);
+
+	return 0;
+}
+
+/**
+ * r535_gsp_libos_debugfs_init - create logging debugfs entries
+ * @gsp: gsp pointer
+ *
+ * Create the debugfs entries. This exposes the log buffers to userspace so
+ * that an external tool can parse it.
+ *
+ * The 'logpmu' contains exception dumps from the PMU. It is written via an
+ * RPC sent from GSP-RM and must be only 4KB. We create it here because it's
+ * only useful if there is a debugfs entry to expose it. If we get the PMU
+ * logging RPC and there is no debugfs entry, the RPC is just ignored.
+ *
+ * The blob_init, blob_rm, and blob_pmu objects can't be transient
+ * because debugfs_create_blob doesn't copy them.
+ *
+ * NOTE: OpenRM loads the logging elf image and prints the log messages
+ * in real-time. We may add that capability in the future, but that
+ * requires loading an ELF images that are not distributed with the driver,
+ * and adding the parsing code to Nouveau.
+ *
+ * Ideally, this should be part of nouveau_debugfs_init(), but that function
+ * is called too late. We really want to create these debugfs entries before
+ * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
+ * there could still be a log to capture.
+ */
+static void
+r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
+{
+	struct dentry *dir, *dir_init;
+	struct dentry *dir_intr = NULL, *dir_rm = NULL, *dir_pmu = NULL;
+	struct device *dev = gsp->subdev.device->dev;
+
+	/* Each GPU has a subdir based on its device name, so find it */
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+
+	if (!drm_dev || !drm_dev->debugfs_root) {
+		nvkm_error(&gsp->subdev, "could not find debugfs path\n");
+		return;
+	}
+
+	dir = drm_dev->debugfs_root;
+
+	gsp->blob_init.data = gsp->loginit.data;
+	gsp->blob_init.size = gsp->loginit.size;
+	gsp->blob_intr.data = gsp->logintr.data;
+	gsp->blob_intr.size = gsp->logintr.size;
+	gsp->blob_rm.data = gsp->logrm.data;
+	gsp->blob_rm.size = gsp->logrm.size;
+
+	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
+	if (IS_ERR(dir_init)) {
+		nvkm_error(&gsp->subdev, "failed to create loginit debugfs entry\n");
+		goto error;
+	}
+
+	dir_intr = debugfs_create_blob("logintr", 0444, dir, &gsp->blob_intr);
+	if (IS_ERR(dir_intr)) {
+		nvkm_error(&gsp->subdev, "failed to create logintr debugfs entry\n");
+		goto error;
+	}
+
+	dir_rm = debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm);
+	if (IS_ERR(dir_rm)) {
+		nvkm_error(&gsp->subdev, "failed to create logrm debugfs entry\n");
+		goto error;
+	}
+
+	/*
+	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
+	 * a DMA buffer.
+	 */
+	gsp->blob_pmu.size = GSP_PAGE_SIZE;
+	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
+	if (!gsp->blob_pmu.data)
+		goto error;
+
+	dir_pmu = debugfs_create_blob("logpmu", 0444, dir, &gsp->blob_pmu);
+	if (IS_ERR(dir_pmu)) {
+		nvkm_error(&gsp->subdev, "failed to create logpmu debugfs entry\n");
+		kfree(gsp->blob_pmu.data);
+		goto error;
+	}
+
+	i_size_write(d_inode(dir_init), gsp->blob_init.size);
+	i_size_write(d_inode(dir_intr), gsp->blob_intr.size);
+	i_size_write(d_inode(dir_rm), gsp->blob_rm.size);
+	i_size_write(d_inode(dir_pmu), gsp->blob_pmu.size);
+
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
+			      r535_gsp_msg_libos_print, gsp);
+
+	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
+
+	if (keep_gsp_logging) {
+		nvkm_warn(&gsp->subdev,
+			  "logging buffers will be retained on failure\n");
+	}
+
+	return;
+
+error:
+	debugfs_remove(dir_init);
+	debugfs_remove(dir_intr);
+	debugfs_remove(dir_rm);
+}
+
+#endif
+
 static inline u64
 r535_gsp_libos_id8(const char *name)
 {
@@ -2126,7 +2318,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
  * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
  *
  * The physical address map for the log buffer is stored in the buffer
- * itself, starting with offset 1. Offset 0 contains the "put" pointer.
+ * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+ * Initially, pp is equal to 0. If the buffer has valid logging data in it,
+ * then pp points to index into the buffer where the next logging entry will
+ * be written. Therefore, the logging data is valid if:
+ *   1 <= pp < sizeof(buffer)/sizeof(u64)
  *
  * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
  * configured for a larger page size (e.g. 64K pages), we need to give
@@ -2197,6 +2393,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
 	args[3].size = gsp->rmargs.size;
 	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
 	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+
+#ifdef CONFIG_DEBUG_FS
+	r535_gsp_libos_debugfs_init(gsp);
+#endif
+
 	return 0;
 }
 
@@ -2507,6 +2708,202 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
 	gsp->fws.rm = NULL;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+struct r535_gsp_log {
+	struct nvif_log log;
+
+	/*
+	 * Logging buffers in debugfs. The wrapper objects need to remain
+	 * in memory until the dentry is deleted.
+	 */
+	struct dentry *debugfs_logging_dir;
+	struct debugfs_blob_wrapper blob_init;
+	struct debugfs_blob_wrapper blob_intr;
+	struct debugfs_blob_wrapper blob_rm;
+	struct debugfs_blob_wrapper blob_pmu;
+};
+
+/**
+ * r535_debugfs_shutdown - delete GSP-RM logging buffers for one GPU
+ * @_log: nvif_log struct for this GPU
+ *
+ * Called when the driver is shutting down, to clean up the retained GSP-RM
+ * logging buffers.
+ */
+static void r535_debugfs_shutdown(struct nvif_log *_log)
+{
+	struct r535_gsp_log *log = container_of(_log, struct r535_gsp_log, log);
+
+	debugfs_remove(log->debugfs_logging_dir);
+
+	kfree(log->blob_init.data);
+	kfree(log->blob_intr.data);
+	kfree(log->blob_rm.data);
+	kfree(log->blob_pmu.data);
+
+	/* We also need to delete the list object */
+	kfree(log);
+}
+
+/**
+ * is_empty - return true if the logging buffer was never written to
+ * @b: blob wrapper with ->data field pointing to logging buffer
+ *
+ * The first 64-bit field of loginit, and logintr, and logrm is the 'put'
+ * pointer, and it is initialized to 0. It's a dword-based index into the
+ * circular buffer, indicating where the next printf write will be made.
+ *
+ * If the pointer is still 0 when GSP-RM is shut down, that means that the
+ * buffer was never written to, so it can be ignored.
+ *
+ * This test also works for logpmu, even though it doesn't have a put pointer.
+ */
+static bool is_empty(struct debugfs_blob_wrapper *b)
+{
+	u64 *put = b->data;
+
+	return *put == 0;
+}
+
+static int r535_gsp_copy_log(struct dentry *parent,
+			     const char *name,
+			     struct debugfs_blob_wrapper *s,
+			     struct debugfs_blob_wrapper *d)
+{
+	struct dentry *dir;
+
+	/* If the buffer is empty, just skip it. */
+	if (is_empty(s))
+		return 0;
+
+	d->data = kmemdup(s->data, s->size, GFP_KERNEL);
+	if (!d->data)
+		return -ENOMEM;
+
+	d->size = s->size;
+	dir = debugfs_create_blob(name, 0444, parent, d);
+	if (IS_ERR(dir)) {
+		kfree(d->data);
+		memset(d, 0, sizeof(*d));
+		return PTR_ERR(dir);
+	}
+
+	i_size_write(d_inode(dir), d->size);
+
+	return 0;
+}
+
+/**
+ * r535_gsp_retain_logging - copy logging buffers to new debugfs root
+ * @gsp: gsp pointer
+ *
+ * If keep_gsp_logging is enabled, then we want to preserve the GSP-RM logging
+ * buffers and their debugfs entries, but all those objects would normally
+ * deleted if GSP-RM fails to load. So we create a new debugfs root, allocate
+ * new buffers, then and copy contents of the logging buffers to them.
+ *
+ * These buffers and dentries are not associated with nvkm_gsp and will be
+ * retained until the driver unloads.
+ */
+static void r535_gsp_retain_logging(struct nvkm_gsp *gsp)
+{
+	struct device *dev = gsp->subdev.device->dev;
+	struct dentry *root, *dir;
+	struct r535_gsp_log *log;
+	int ret;
+
+	/* If we were told not to keep logs, then don't. */
+	if (!keep_gsp_logging)
+		return;
+
+	/* Check to make sure at least one buffer has data. */
+	if (is_empty(&gsp->blob_init) && is_empty(&gsp->blob_intr) &&
+	    is_empty(&gsp->blob_rm) && is_empty(&gsp->blob_rm)) {
+		nvkm_warn(&gsp->subdev, "all logging buffers are empty\n");
+		return;
+	}
+
+	/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
+	root = debugfs_lookup("dri", NULL);
+	if (IS_ERR(root)) {
+		/* No debugfs, or no root dentry for DRM */
+		nvkm_warn(&gsp->subdev, "could not find debugfs dri root\n");
+		return;
+	}
+
+	/* Create a new debugfs root. It has the same name as the old one */
+	dir = debugfs_create_dir(dev_name(dev), root);
+	dput(root);
+	if (IS_ERR(dir)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create %s debugfs entry\n", dev_name(dev));
+		return;
+	}
+
+	log = kzalloc(sizeof(*log), GFP_KERNEL);
+	if (!log) {
+		debugfs_remove(dir);
+		return;
+	}
+
+	ret = r535_gsp_copy_log(dir, "loginit", &gsp->blob_init, &log->blob_init);
+	if (ret)
+		goto error;
+
+	ret = r535_gsp_copy_log(dir, "logintr", &gsp->blob_intr, &log->blob_intr);
+	if (ret)
+		goto error;
+
+	ret = r535_gsp_copy_log(dir, "logrm", &gsp->blob_rm, &log->blob_rm);
+	if (ret)
+		goto error;
+
+	ret = r535_gsp_copy_log(dir, "logpmu", &gsp->blob_pmu, &log->blob_pmu);
+	if (ret)
+		goto error;
+
+	log->debugfs_logging_dir = dir;
+	log->log.shutdown = r535_debugfs_shutdown;
+	list_add(&log->log.entry, &gsp_logs.entry);
+
+	nvkm_warn(&gsp->subdev,
+		  "logging buffers migrated to /sys/kernel/debug/dri/%s\n",
+		  dev_name(dev));
+
+	return;
+
+error:
+	nvkm_warn(&gsp->subdev, "failed to migrate logging buffers\n");
+
+	debugfs_remove(log->debugfs_logging_dir);
+	kfree(log->blob_init.data);
+	kfree(log->blob_intr.data);
+	kfree(log->blob_rm.data);
+	kfree(log->blob_pmu.data);
+	kfree(log);
+}
+
+#endif
+
+/**
+ * r535_gsp_libos_debugfs_fini - cleanup/retain log buffers on shutdown
+ * @gsp: gsp pointer
+ *
+ * If the log buffers are exposed via debugfs, the data for those entries
+ * needs to be cleaned up when the GSP device shuts down.
+ */
+static void
+r535_gsp_libos_debugfs_fini(struct nvkm_gsp __maybe_unused *gsp)
+{
+#ifdef CONFIG_DEBUG_FS
+	r535_gsp_retain_logging(gsp);
+
+	kfree(gsp->blob_pmu.data);
+	gsp->blob_pmu.data = NULL;
+#endif
+}
+
 void
 r535_gsp_dtor(struct nvkm_gsp *gsp)
 {
@@ -2528,6 +2925,9 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_gsp_mem_dtor(&gsp->rmargs);
 	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
 	nvkm_gsp_mem_dtor(&gsp->shm.mem);
+
+	r535_gsp_libos_debugfs_fini(gsp);
+
 	nvkm_gsp_mem_dtor(&gsp->loginit);
 	nvkm_gsp_mem_dtor(&gsp->logintr);
 	nvkm_gsp_mem_dtor(&gsp->logrm);
-- 
2.34.1

