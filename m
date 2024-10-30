Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198F9B6DB0
	for <lists+nouveau@lfdr.de>; Wed, 30 Oct 2024 21:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9E1E10E09B;
	Wed, 30 Oct 2024 20:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b4Reaj2v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2087.outbound.protection.outlook.com [40.107.96.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC63910E09B
 for <nouveau@lists.freedesktop.org>; Wed, 30 Oct 2024 20:30:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+Ar4rJdAYS97/z3HY9uzpTDSBWnwN2qp56QHfLdvpZOFryHwOF/rc7RhjWXgG2hga/OPPGujUIQSxS7rmwrHJoB/P970N0BD/C2k8KaJBYyi1JRlVzGfwRhujBd3zHeyiN5AXQb86brm0hC17cHEvi4hr9imYbjCJ/le1K4OyZliyoPMVxxGlxDYbhPBKgkirJ6G0bJYWpNUm+2INdiMdDCCJJeHUuCyqbMgf/TK/zyfp5wALk0f7khUXCZrPUgHD9UGJdmpSoUO/MGRCLnXtZMmCFKM8uUBDHeANd1rHekrpP0Eg5bh+Lk4DuXXtQ3LW55pcxEmd8unbWYdlBWJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUKmPOcLqSsSSJa5DhFjmJfHLayA1M+fj9qNd5qIBvQ=;
 b=W5+UqB8DPHV7nYocNhnGBxyEKD+zwo+Pqk31hzgsyNStbdvpAQWk6FUHJ8vqCeaMeiqZ+2pTaUM3z9+z+zzQLDdEM9c0HMK8Vifk0JM69xCHf9+kDCk8c7q+XTbpCc9A9aT2k93oc+SkJTDw7te9vYr2Ob+eiLcfCNszPtBZzoR74iaGOTlM9fUs063ir20JQCBnT1TC0RMecEoJBG40QMHego3KigsapeQYWnYf3w4d44g30d/y738yyL1iwkQMfuOWW0KPYtFcfvA3PZPrhO3DtTvLzq4cayx4813b9ohQKksryIyyjGeWDEDcyvqeAkNH0uUQnJ5EqUI/wItmNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUKmPOcLqSsSSJa5DhFjmJfHLayA1M+fj9qNd5qIBvQ=;
 b=b4Reaj2v9Ym+XZ7JJhdQWAPf8EKayJSeeo00XHOcutAd2su11AcL0uaa1Il0KiDcWP8YXTfi7KiEM1Y3eX9zUQmcr+W9b/Wj/C0UH+YgbPfyKinaL7nPaaUnp5goAtXyOv888/rqT6i2Ph2Vq8e2Mh4JxkuerhOaJNbEDt0rluwUb5ASMrGLp75VYfQzAFdv/HY9PCrLpoQ4+OlvtUaofshbwNYy78IJRMh4Sy1X/RA2Pz7SGATXhZguB5EiNeCUb+O6AJixuK/CEuH28l6T5g+KhHxMp/dmL60JC32uLYjBme2NTZY2WH1gtxkKS5FVcF6KxKPwot/7TA20TGSusg==
Received: from CH5PR05CA0007.namprd05.prod.outlook.com (2603:10b6:610:1f0::12)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 20:30:24 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::8a) by CH5PR05CA0007.outlook.office365.com
 (2603:10b6:610:1f0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.7 via Frontend
 Transport; Wed, 30 Oct 2024 20:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 20:30:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Oct
 2024 13:30:06 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 30 Oct
 2024 13:30:05 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, <bskeggs@nvidia.com>, Dave Airlie
 <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] [v9] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Date: Wed, 30 Oct 2024 15:29:52 -0500
Message-ID: <20241030202952.694055-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030202952.694055-1-ttabi@nvidia.com>
References: <20241030202952.694055-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce2e5b1-e2ba-4fc8-e03a-08dcf921aee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g3mVWqbtrRgx/j0qwMV8iqZAHawzLydfG69LGB7QGtJKbfW5xurf1Q4X20FL?=
 =?us-ascii?Q?csIaQHCct8K3j1jqrCfcCEkt0H4BEs3i1vpoZ5UziRxgFOHR7OHFhBLVFzst?=
 =?us-ascii?Q?GmDnL7Wkemty8072DU+VtRizlNhF0FIQHhVgCuByWJ/cHV1r+awJkLLKf0Hi?=
 =?us-ascii?Q?OmojZQvJPVYIGbPkkICyGjs7Q9BJ2GaRysHsMDE1C8oiEq3OU1ODS4wgN6AT?=
 =?us-ascii?Q?hCdY+icq4V3VPsG2Hb8QynkKl/ahSk2GTKt8EduyAvrsRrfSoKlnX7/OoP4j?=
 =?us-ascii?Q?oVp7NDLgBn1wdgIAZk/mwBfh8HoGYMjld4PKfx48hRbhVZytismrTHQtyUyp?=
 =?us-ascii?Q?RAT7Nv6l0n6Ad01Ta88QVaIK/HnNV3GajYTgl7lKa+nkX0FYwftNySGympmk?=
 =?us-ascii?Q?8vWU0EjdfvnSPlwqcjdnvUZ5HavNwNuOciOKG3i74Oqeyf6nXKRfkjIMMMVN?=
 =?us-ascii?Q?vUk+tPw/cTdi11RzAb1gH/6QTFm/b0y/Er0KltqJ+frfdVOfxBiq0xDqnxGe?=
 =?us-ascii?Q?nvfZutBjrQX6qqAodZpw/LUBrreqXdsnXj+4B0aqfx0GyDsrKowZS3eWkZiR?=
 =?us-ascii?Q?JQXXQN/jKQZAwTlf4k3Pik/KAwd/vQrPLLJdJOida3QbgxikiyvGe6YvjlD3?=
 =?us-ascii?Q?QeCcLCbVKmR7cAwPFSId1k7YgcmlZeY0UVMK5bHK8xONIU/Sv7oDuOYHzb0b?=
 =?us-ascii?Q?UqtWtlZW680//yFoM2JGzvSLGrv5d3th/YRFwqMypF8VEW74yW+QBDvQRB3G?=
 =?us-ascii?Q?Ms+19TzCTO2VAtqgbyx28WY2jwDl7sTXKPA90N1WzZjgFAihemVrOh3WZwhc?=
 =?us-ascii?Q?s+7QEg8IkpH6w16l8FoBio8xZ6vMqcbvEBB7roA4uIwIUCDhniEqWvUnPtC9?=
 =?us-ascii?Q?S8nyadn0mjnIonuu3Fp+Mt/+y8/vt0D9LMFvNmJd1ujgOFi8a4HFesq6NppK?=
 =?us-ascii?Q?BTImB9OPoLur25WwS9B7D0k6G9dL01oJnQa8sobTKIoWZvXap/72aNqLArXk?=
 =?us-ascii?Q?cfmxdQDa0HtFKaJoQ7j2yddyIOBFmY7ZSPqUOu1qFL1HHknCn9GzmcWtrD5B?=
 =?us-ascii?Q?WoymL8/S5G1/rfpodppCcluYu577h9QZRTrYyGH+sdSXE9dQAjOXlcYe3ZAX?=
 =?us-ascii?Q?jgAE7cxKwn0wnQvEqzYH1j7Wl+KZBVQVmgB6MLZGK6Y0O17Vl9YnYOw5/ZwI?=
 =?us-ascii?Q?HzPJj7bhotsSB/Oo2CgUoloQ4dxGVgZf5v2FyWkF4Xh1hPLTvwEYGUgEYQfR?=
 =?us-ascii?Q?Pa3VShRV4hS9nc8vDLLooaFkXApuQ6/Wu60YDjybxdT1iDheIvT8n5lABa7x?=
 =?us-ascii?Q?1R8TW+eJOVuCDdf6WPNxl9YEhdRAd1TnVBM3wwvLIWa5Az8Skp0WinSH/o/J?=
 =?us-ascii?Q?IpX4tatWMaOTBbRIKS3f5U4cTV3AU6Hac7VYfy3q15SK1iyrUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 20:30:24.1389 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce2e5b1-e2ba-4fc8-e03a-08dcf921aee2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
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
it has the disadvantage the debugfs entries need to remain until the
driver is unloaded.

The buffers are exposed via debugfs. If GSP-RM fails to initialize, then
Nouveau immediately shuts down the GSP interface. This would normally
also deallocate the logging buffers, thereby preventing the user from
capturing the debug logs.

To avoid this, introduce the keep-gsp-logging command line parameter. If
specified, and if at least one logging buffer has content, then Nouveau
will migrate these buffers into new debugfs entries that are retained
until the driver unloads.

An end-user can capture the logs using the following commands:

    cp /sys/kernel/debug/nouveau/<path>/loginit loginit
    cp /sys/kernel/debug/nouveau/<path>/logrm logrm
    cp /sys/kernel/debug/nouveau/<path>/logintr logintr
    cp /sys/kernel/debug/nouveau/<path>/logpmu logpmu

where (for a PCI device) <path> is the PCI ID of the GPU (e.g.
0000:65:00.0).

Since LOGPMU is not needed for normal GSP-RM operation, it is only
created if debugfs is available. Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

A simple way to test the buffer migration feature is to have
nvkm_gsp_init() return an error code.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>

---

v9:
- rebased to drm-misc-next
- move nvkm_gsp logging dentries into debugfs struct
- add gsp_logging_debugfs_root and always create the root dentry
- remove root struct in r535.c, along with mutex code
- rename dir to dent
- add missing calls to create_debugfs helper
- r535_gsp_copy_log was not calling i_size_write

 drivers/gpu/drm/nouveau/include/nvif/log.h    |  53 +++
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  20 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  45 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 444 +++++++++++++++++-
 4 files changed, 561 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/log.h b/drivers/gpu/drm/nouveau/include/nvif/log.h
new file mode 100644
index 000000000000..1ebb58f0f7df
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/log.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: MIT */
+/* SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. */
+
+#ifndef __NVIF_LOG_H__
+#define __NVIF_LOG_H__
+
+#ifdef CONFIG_DEBUG_FS
+
+/**
+ * nvif_log - structure for tracking logging buffers
+ * @entry: an entry in a list of struct nvif_logs
+ * @shutdown: pointer to function to call to clean up
+ *
+ * Structure used to track logging buffers so that they can be cleaned up
+ * when the module exits.
+ *
+ * The @shutdown function is called when the module exits. It should free all
+ * backing resources, such as logging buffers.
+ */
+struct nvif_log {
+	struct list_head entry;
+	void (*shutdown)(struct nvif_log *log);
+};
+
+/**
+ * nvif_logs - linked list of nvif_log objects
+ */
+struct nvif_logs {
+	struct list_head head;
+};
+
+#define NVIF_LOGS_DECLARE(logs) \
+	struct nvif_logs logs = { LIST_HEAD_INIT(logs.head) }
+
+static inline void nvif_log_shutdown(struct nvif_logs *logs)
+{
+	if (!list_empty(&logs->head)) {
+		struct nvif_log *log, *n;
+
+		list_for_each_entry_safe(log, n, &logs->head, entry) {
+			/* shutdown() should also delete the log entry */
+			log->shutdown(log);
+		}
+	}
+}
+
+extern struct nvif_logs gsp_logs;
+
+extern struct dentry *gsp_logging_debugfs_root;
+
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index a45a4ad843b9..6deb1c90b0d2 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -5,6 +5,8 @@
 #include <core/falcon.h>
 #include <core/firmware.h>
 
+#include <linux/debugfs.h>
+
 #define GSP_PAGE_SHIFT 12
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
@@ -220,6 +222,24 @@ struct nvkm_gsp {
 
 	/* The size of the registry RPC */
 	size_t registry_rpc_size;
+
+#ifdef CONFIG_DEBUG_FS
+	/*
+	 * Logging buffers in debugfs. The wrapper objects need to remain
+	 * in memory until the dentry is deleted.
+	 */
+	struct {
+		struct dentry *parent;
+		struct dentry *init;
+		struct dentry *rm;
+		struct dentry *intr;
+		struct dentry *pmu;
+	} debugfs;
+	struct debugfs_blob_wrapper blob_init;
+	struct debugfs_blob_wrapper blob_intr;
+	struct debugfs_blob_wrapper blob_rm;
+	struct debugfs_blob_wrapper blob_pmu;
+#endif
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 02dd179a2f31..275fd08c516d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -30,6 +30,7 @@
 #include <linux/vga_switcheroo.h>
 #include <linux/mmu_notifier.h>
 #include <linux/dynamic_debug.h>
+#include <linux/debugfs.h>
 
 #include <drm/drm_client_setup.h>
 #include <drm/drm_drv.h>
@@ -47,6 +48,7 @@
 #include <nvif/fifo.h>
 #include <nvif/push006c.h>
 #include <nvif/user.h>
+#include <nvif/log.h>
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -113,6 +115,18 @@ static struct drm_driver driver_stub;
 static struct drm_driver driver_pci;
 static struct drm_driver driver_platform;
 
+#ifdef CONFIG_DEBUG_FS
+/**
+ * gsp_logs - list of nvif_log GSP-RM logging buffers
+ *
+ * Head pointer to a a list of nvif_log buffers that is created for each GPU
+ * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
+ * specified. This is used to track the alternative debugfs entries for the
+ * GSP-RM logs.
+ */
+NVIF_LOGS_DECLARE(gsp_logs);
+#endif
+
 static u64
 nouveau_pci_name(struct pci_dev *pdev)
 {
@@ -1420,6 +1434,24 @@ nouveau_platform_device_create(const struct nvkm_device_tegra_func *func,
 	return ERR_PTR(err);
 }
 
+/**
+ * gsp_logging_root - debugfs root dentry for GSP-RM logging buffers
+ *
+ * For GPUs booted with GSP-RM, the GSP-RM logging buffers are located under
+ * the /sys/kernel/debug/nouveau/ root.  This root path is used because GSP-RM
+ * is booted before the normal Nouveau entries in /sys/kernel/debug/dri/
+ * are created.  In addition, these buffers may need to remain until the
+ * driver is unloaded, so they will need to exist after the /dri/ paths are
+ * removed.
+ *
+ * If there are no GSP-RM GPUs in the system, then /sys/kernel/debug/nouveau/
+ * will remain empty.  This is okay, because trying to create /nouveau/ only
+ * when needed is a lot more complicated than it seems.
+ */
+#ifdef CONFIG_DEBUG_FS
+struct dentry *gsp_logging_debugfs_root;
+#endif
+
 static int __init
 nouveau_drm_init(void)
 {
@@ -1443,6 +1475,14 @@ nouveau_drm_init(void)
 	nouveau_register_dsm_handler();
 	nouveau_backlight_ctor();
 
+#ifdef CONFIG_DEBUG_FS
+	gsp_logging_debugfs_root = debugfs_create_dir("nouveau", NULL);
+	if (PTR_ERR_OR_ZERO(gsp_logging_debugfs_root)) {
+		pr_err("nouveau: could not create GSP-RM logging buffer root\n");
+		gsp_logging_debugfs_root = NULL;
+	}
+#endif
+
 #ifdef CONFIG_PCI
 	return pci_register_driver(&nouveau_drm_pci_driver);
 #else
@@ -1467,6 +1507,11 @@ nouveau_drm_exit(void)
 #endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
+
+#ifdef CONFIG_DEBUG_FS
+	nvif_log_shutdown(&gsp_logs);
+	debugfs_remove(gsp_logging_debugfs_root);
+#endif
 }
 
 module_init(nouveau_drm_init);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 86450b0cd605..1c278ef67046 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -26,6 +26,8 @@
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
 #include <engine/sec2.h>
+#include <drm/drm_device.h>
+#include <nvif/log.h>
 
 #include <nvfw/fw.h>
 
@@ -2076,6 +2078,218 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
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
+ * create_debufgs - create a blob debugfs entry
+ * @gsp: gsp pointer
+ * @name: name of this dentry
+ * @blob: blob wrapper
+ *
+ * Creates a debugfs entry for a logging buffer with the name 'name'.
+ */
+static struct dentry *create_debugfs(struct nvkm_gsp *gsp, const char *name,
+				     struct debugfs_blob_wrapper *blob)
+{
+	struct dentry *dent;
+
+	dent = debugfs_create_blob(name, 0444, gsp->debugfs.parent, blob);
+	if (IS_ERR(dent)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create %s debugfs entry\n", name);
+		return NULL;
+	}
+
+	/*
+	 * For some reason, debugfs_create_blob doesn't set the size of the
+	 * dentry, so do that here.  See [1]
+	 *
+	 * [1] https://lore.kernel.org/r/linux-fsdevel/20240207200619.3354549-1-ttabi@nvidia.com/
+	 */
+	i_size_write(d_inode(dent), blob->size);
+
+	return dent;
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
+ * requires loading ELF images that are not distributed with the driver and
+ * adding the parsing code to Nouveau.
+ *
+ * Ideally, this should be part of nouveau_debugfs_init(), but that function
+ * is called too late. We really want to create these debugfs entries before
+ * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
+ * there could still be a log to capture.
+ */
+static void
+r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
+{
+	struct device *dev = gsp->subdev.device->dev;
+
+	if (!gsp_logging_debugfs_root)
+		return;
+
+	/* Create a new debugfs directory with a name unique to this GPU. */
+	gsp->debugfs.parent = debugfs_create_dir(dev_name(dev), gsp_logging_debugfs_root);
+	if (IS_ERR(gsp->debugfs.parent)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create %s debugfs root\n", dev_name(dev));
+		return;
+	}
+
+	gsp->blob_init.data = gsp->loginit.data;
+	gsp->blob_init.size = gsp->loginit.size;
+	gsp->blob_intr.data = gsp->logintr.data;
+	gsp->blob_intr.size = gsp->logintr.size;
+	gsp->blob_rm.data = gsp->logrm.data;
+	gsp->blob_rm.size = gsp->logrm.size;
+
+	gsp->debugfs.init = create_debugfs(gsp, "loginit", &gsp->blob_init);
+	if (!gsp->debugfs.init)
+		goto error;
+
+	gsp->debugfs.intr = create_debugfs(gsp, "logintr", &gsp->blob_intr);
+	if (!gsp->debugfs.intr)
+		goto error;
+
+	gsp->debugfs.rm = create_debugfs(gsp, "logrm", &gsp->blob_rm);
+	if (!gsp->debugfs.rm)
+		goto error;
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
+	gsp->debugfs.pmu = create_debugfs(gsp, "logpmu", &gsp->blob_pmu);
+	if (!gsp->debugfs.pmu) {
+		kfree(gsp->blob_pmu.data);
+		goto error;
+	}
+
+	i_size_write(d_inode(gsp->debugfs.init), gsp->blob_init.size);
+	i_size_write(d_inode(gsp->debugfs.intr), gsp->blob_intr.size);
+	i_size_write(d_inode(gsp->debugfs.rm), gsp->blob_rm.size);
+	i_size_write(d_inode(gsp->debugfs.pmu), gsp->blob_pmu.size);
+
+	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
+			      r535_gsp_msg_libos_print, gsp);
+
+	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
+
+	if (keep_gsp_logging) {
+		nvkm_info(&gsp->subdev,
+			  "logging buffers will be retained on failure\n");
+	}
+
+	return;
+
+error:
+	debugfs_remove(gsp->debugfs.parent);
+	gsp->debugfs.parent = NULL;
+}
+
+#endif
+
 static inline u64
 r535_gsp_libos_id8(const char *name)
 {
@@ -2126,7 +2340,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
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
@@ -2197,6 +2415,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
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
 
@@ -2507,6 +2730,222 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
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
+static bool is_empty(const struct debugfs_blob_wrapper *b)
+{
+	u64 *put = b->data;
+
+	return put ? (*put == 0) : true;
+}
+
+/**
+ * r535_gsp_copy_log - preserve the logging buffers in a blob
+ *
+ * When GSP shuts down, the nvkm_gsp object and all its memory is deleted.
+ * To preserve the logging buffers, the buffers need to be copied, but only
+ * if they actually have data.
+ */
+static int r535_gsp_copy_log(struct dentry *parent,
+			     const char *name,
+			     const struct debugfs_blob_wrapper *s,
+			     struct debugfs_blob_wrapper *t)
+{
+	struct dentry *dent;
+	void *p;
+
+	if (is_empty(s))
+		return 0;
+
+	/* The original buffers will be deleted */
+	p = kmemdup(s->data, s->size, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	t->data = p;
+	t->size = s->size;
+
+	dent = debugfs_create_blob(name, 0444, parent, t);
+	if (IS_ERR(dent)) {
+		kfree(p);
+		memset(t, 0, sizeof(*t));
+		return PTR_ERR(dent);
+	}
+
+	i_size_write(d_inode(dent), t->size);
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
+ * deleted if GSP-RM fails to load.
+ *
+ * To preserve the logging buffers, we need to:
+ *
+ * 1) Allocate new buffers and copy the logs into them, so that the original
+ * DMA buffers can be released.
+ *
+ * 2) Preserve the directories.  We don't need to save single dentries because
+ * we're going to delete the parent when the
+ *
+ * If anything fails in this process, then all the dentries need to be
+ * deleted.  We don't need to deallocate the original logging buffers because
+ * the caller will do that regardless.
+ */
+static void r535_gsp_retain_logging(struct nvkm_gsp *gsp)
+{
+	struct device *dev = gsp->subdev.device->dev;
+	struct r535_gsp_log *log = NULL;
+	int ret;
+
+	if (!keep_gsp_logging || !gsp->debugfs.parent) {
+		/* Nothing to do */
+		goto exit;
+	}
+
+	/* Check to make sure at least one buffer has data. */
+	if (is_empty(&gsp->blob_init) && is_empty(&gsp->blob_intr) &&
+	    is_empty(&gsp->blob_rm) && is_empty(&gsp->blob_rm)) {
+		nvkm_warn(&gsp->subdev, "all logging buffers are empty\n");
+		goto exit;
+	}
+
+	log = kzalloc(sizeof(*log), GFP_KERNEL);
+	if (!log)
+		goto error;
+
+	/*
+	 * Since the nvkm_gsp object is going away, the debugfs_blob_wrapper
+	 * objects are also being deleted, which means the dentries will no
+	 * longer be valid.  Delete the existing entries so that we can create
+	 * new ones with the same name.
+	 */
+	debugfs_remove(gsp->debugfs.init);
+	debugfs_remove(gsp->debugfs.intr);
+	debugfs_remove(gsp->debugfs.rm);
+	debugfs_remove(gsp->debugfs.pmu);
+
+	ret = r535_gsp_copy_log(gsp->debugfs.parent, "loginit", &gsp->blob_init, &log->blob_init);
+	if (ret)
+		goto error;
+
+	ret = r535_gsp_copy_log(gsp->debugfs.parent, "logintr", &gsp->blob_intr, &log->blob_intr);
+	if (ret)
+		goto error;
+
+	ret = r535_gsp_copy_log(gsp->debugfs.parent, "logrm", &gsp->blob_rm, &log->blob_rm);
+	if (ret)
+		goto error;
+
+	ret = r535_gsp_copy_log(gsp->debugfs.parent, "logpmu", &gsp->blob_pmu, &log->blob_pmu);
+	if (ret)
+		goto error;
+
+	/* The nvkm_gsp object is going away, so save the dentry */
+	log->debugfs_logging_dir = gsp->debugfs.parent;
+
+	log->log.shutdown = r535_debugfs_shutdown;
+	list_add(&log->log.entry, &gsp_logs.head);
+
+	nvkm_warn(&gsp->subdev,
+		  "logging buffers migrated to /sys/kernel/debug/nouveau/%s\n",
+		  dev_name(dev));
+
+	return;
+
+error:
+	nvkm_warn(&gsp->subdev, "failed to migrate logging buffers\n");
+
+exit:
+	debugfs_remove(gsp->debugfs.parent);
+
+	if (log) {
+		kfree(log->blob_init.data);
+		kfree(log->blob_intr.data);
+		kfree(log->blob_rm.data);
+		kfree(log->blob_pmu.data);
+		kfree(log);
+	}
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
+	/*
+	 * Unlike the other buffers, the PMU blob is a kmalloc'd buffer that
+	 * exists only if the debugfs entries were created.
+	 */
+	kfree(gsp->blob_pmu.data);
+	gsp->blob_pmu.data = NULL;
+#endif
+}
+
 void
 r535_gsp_dtor(struct nvkm_gsp *gsp)
 {
@@ -2528,6 +2967,9 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
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

