Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D25D905F73
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2024 01:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFCED10E943;
	Wed, 12 Jun 2024 23:53:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="synBzWGE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2053.outbound.protection.outlook.com [40.107.212.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2FB10E0BF
 for <nouveau@lists.freedesktop.org>; Wed, 12 Jun 2024 23:53:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cyzFU5Hm7dj1sq75+Yzz/S/Tp0Mg3Qvn0gdsdtV3ZrPJhynr0DENRRCMBUbX1nVXhHT2ve1SyZEl4R2CaBvg44eTDJ62iW+dfZuQBue9ZUG0lscT9HkFpRygx/FgSHfuDeEu4dYMnazZpfXpSIifsXUw8hxFLwBqLTaWK/IgV21I3EtXS2iTGcvS67+csxuLC8NkyjEMUdUqLAu73BqvlZDwc/1lhFE7zsOvzWaWXUUwtWcWAaOLNNkeXbFRBuRqBGIHMOA6A7SZLaRDsvwoLlWSxaIffkySSBpBpblVg+ZELsPQrQ466v9hityLtfH5EPwsArK8nv0Kw6OL6Zq6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omKYVbAt1x4pWnNyy/eEhb7BJYQA3C481Z6kOrzv44k=;
 b=X1D8y6ickpwD+A2d+PjAahK5g/bf6duwPO5oBuMme0/a/V9rH5eBp8yB48aCl7bGpkJOhZLEhWylhAL58vth/BW+m6tv4HRiuxGgEhxmI0cbmXAygvIXc4bOolU9/LQOBrPIe1oHzej+A0KU15EXt9+f7gSwZd6akTxgYqEh172ssLZcusCPq6Z5lCXfRwSJy54WniGe1WAy2udtCb/AVnFmSNcgt8gAQhOID0aPzzdGR8sJjD8f967AMvbswATxjVK0g2w2XB9NUZwr2riE9cbFpHb9NjErf7+eXtGhhzSkUJE9F8qHgu4R99E7f7BX3Ml7WtLfqmHH7j/IjLpgSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=omKYVbAt1x4pWnNyy/eEhb7BJYQA3C481Z6kOrzv44k=;
 b=synBzWGEgCmT/Ejmr/tYBulJRliTbjiLTeC74sx6WrWj5HLEwJwmjgn0cOECyYARcyWg0jy6ialG4cwYoa6QiLJxWGYGFp50HOzOGszc+lNhivtY/vwW7ofHJdlmn73xZ5NKHuFg9+vrn1j+6zbmJ8FHTtIAh/0LGYTlbur9z5+IylAm1222bERAOVSSpi2xrR8ooMBcZeX9TUsaymqsiWkZWXCudsoXlq6tzdrN7z99k8I/zBtjr4jZYEvLHVsCR5rQYuJqJIfZr2hXZCuaUtW3KV1X0IKWjOKf/hyR3FJfkG03Qk8XDZBk6ctP4F/PBj2LKvJHWQHgBF3wMm61AQ==
Received: from BYAPR08CA0067.namprd08.prod.outlook.com (2603:10b6:a03:117::44)
 by DS0PR12MB8366.namprd12.prod.outlook.com (2603:10b6:8:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 23:53:26 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::82) by BYAPR08CA0067.outlook.office365.com
 (2603:10b6:a03:117::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21 via Frontend
 Transport; Wed, 12 Jun 2024 23:53:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 23:53:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Jun
 2024 16:53:11 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 12 Jun
 2024 16:53:10 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] [v5] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Date: Wed, 12 Jun 2024 18:52:53 -0500
Message-ID: <20240612235253.1624004-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612235253.1624004-1-ttabi@nvidia.com>
References: <20240612235253.1624004-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|DS0PR12MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 872dfb1a-128a-4e69-0e7c-08dc8b3ada12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230034|376008|1800799018|82310400020|36860700007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FbC/bYxmbWiIhcg2rXD1BQkGLNabnLdJTm93OFuxyQU6Y3poMZbQgtJbFFSt?=
 =?us-ascii?Q?e4Aye6HHJYpMttd3bmrzSUBvrXYh+f44Vct+HjNQnxGQCluIoXzAqZfWStSQ?=
 =?us-ascii?Q?gefUBWxfYZ+V4f8mg0UHidy616obiOoSBuJBC3X4lzvvqTOAYtTijDcAUlEu?=
 =?us-ascii?Q?+zD43xti+6cpnqqfhyktacN+xGnriupVR2MfC+nnDQYzGfvvcy0n28BeI1P9?=
 =?us-ascii?Q?gEl2kely7QXibwwibTBI/9auX5qo33UtmYY4gC82kjJzuuJZdUL88gvtXCFg?=
 =?us-ascii?Q?z9O+1diE0yiiTw+J8WW1tcHkxuh5rIu8bl4GZgLLl9fpRjXy1E+hKvYSL+bL?=
 =?us-ascii?Q?eyP8TgwmANfmG43U+qXYnQY862XvMgZc5pdyfBLwqAkC9XnhcJfokAIxQ44Z?=
 =?us-ascii?Q?FM3rh6bcGAV9LEItWeqf8sVd8BXsZ7QrAXyXw9FC4jrG2JDJcqfMtckxAkQ8?=
 =?us-ascii?Q?584TtT6bIq4RZp0Rrjv91+aZD/yLF3E8BbbEpNIuKP2M+7g7zX2idcCeOr8L?=
 =?us-ascii?Q?zA7iG+z4fewGgYWYdbN6hmaCvrthszy1bx0BwTm9FuN8qbsGoj0shgdfWolm?=
 =?us-ascii?Q?CV8v8WS0bWVocpAOEjmxVNeIPAttdpf4nauoxasq5DUTUfNLVNewq/TViyvQ?=
 =?us-ascii?Q?/qYAIiqh2aEcL5P2wC1aOapsxFTpTrDPV5xfSTAIyE+vgfyWhGXrIeQUybSZ?=
 =?us-ascii?Q?IkBayReGCsovmoiJnRw3E5E33h6ath2GxgFhj7gPUipgm04WcPtxZxk4Bx40?=
 =?us-ascii?Q?20eH7kxctWBVDjLfmtZgdGtnRh+PB9YuD3gBKTuphfHPGLRDCNrfusKUimyj?=
 =?us-ascii?Q?5sxS7Dxxw0IqFDTDYQ48MzdRBeGNwylaMKfy7OZHjImCBRALY6JtxeFtXgUK?=
 =?us-ascii?Q?iblUoew+3at33jbcc1oBEFiXZIkD5Kn8fZebR6yhvyjeqlvYedGBidrLQrIw?=
 =?us-ascii?Q?4RIjzTa6pRThZuSJ87JqIwJw1jf7HpeoXeXgXDmcX5nhp9+m85jrhIfHplBx?=
 =?us-ascii?Q?MJnjNGparTgmrX7DXnQRmAj6G1WXZw4KJH41Fc8d1B0q6M9MA6D+iUtR7ZBW?=
 =?us-ascii?Q?qIuhwdVXzfvXC1apiwjmm6+A9gEAk4hLJm8XvLq1oxYATneshyZFT5hToNgo?=
 =?us-ascii?Q?OYtMqJK5pQNPNfq0CAy5nf9Th7+U+h/39Q6NT7cCV9D9xyLHL3hmUPkRve4B?=
 =?us-ascii?Q?dXb3MOpIgb+QMl52zUeRgMqDChJm9JogIlsxbMqOT8CM1gZOXqPw3YiNtoXQ?=
 =?us-ascii?Q?6LRNm4sk7ke/qFFXbqdivD8+67FBYofZY949pYBdX3hmLRngBfcYsIF6V7SM?=
 =?us-ascii?Q?fgiYdms7/C2Io+xmAZM2cLjBeJPTSFoNRjm7By23Z30zkMzSkF4xm5OxII1X?=
 =?us-ascii?Q?tYYwKHfM4hBq2Z2Er+9qtkRverQke68qCLIn2+w2N8JBgOtb0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230034)(376008)(1800799018)(82310400020)(36860700007); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 23:53:26.1498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 872dfb1a-128a-4e69-0e7c-08dc8b3ada12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8366
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
addresses are passed to GSP-RM during initialization.  The buffers are
required for GSP-RM to initialize properly.

LOGPMU is also allocated by Nouveau, but its contents are updated
when Nouveau receives an NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPC from
GSP-RM.  Nouveau then copies the RPC to the buffer.

The messages are encoded as an array of variable-length structures that
contain the parameters to an NV_PRINTF call.  The format string and
parameter count are stored in a special ELF image that contains only
logging strings.  This image is not currently shipped with the Nvidia
driver.

There are two methods to extract the logs.

OpenRM tries to load the logging ELF, and if present, parses the log
buffers in real time and outputs the strings to the kernel console.

Alternatively, and this is the method used by this patch, the buffers
can be exposed to user space, and a user-space tool (along with the
logging ELF image) can parse the buffer and dump the logs.

This method has the advantage that it allows the buffers to be parsed
even when the logging ELF file is not available to the user.  However,
it has the disadvantage the debubfs entries need to remain until the
driver is unloaded.

The buffers are exposed via debugfs.  If GSP-RM fails to initialize,
then Nouveau immediately shuts down the GSP interface.  This would
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
created if debugfs is available.  Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
v5:
rebased to drm-misc-next
repaced nvkm_gsp_log with nvif_log
minor rearrangement of some code

 drivers/gpu/drm/nouveau/include/nvif/log.h    |  32 ++
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  13 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  19 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 360 +++++++++++++++++-
 4 files changed, 423 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/log.h b/drivers/gpu/drm/nouveau/include/nvif/log.h
new file mode 100644
index 000000000000..c89ba85a701d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/log.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/* SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. */
+
+#ifndef __NVIF_LOG_H__
+#define __NVIF_LOG_H__
+
+/**
+ * nvif_log - structure for tracking logging buffers
+ * @head: list head
+ * @shutdown: pointer to function to call to clean up
+ *
+ * Structure used to track logging buffers so that they can be cleaned up
+ * when the driver exits.
+ */
+struct nvif_log {
+	struct list_head head;
+	void (*shutdown)(struct nvif_log *log);
+};
+
+#ifdef CONFIG_DEBUG_FS
+/**
+ * gsp_logs - list of nvif_log GSP-RM logging buffers
+ *
+ * Head pointer to a a list of nvif_log buffers that is created for each GPU
+ * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
+ * specified.  This is used to track the alternative debugfs entries for the
+ * GSP-RM logs.
+ */
+extern struct list_head gsp_logs;
+#endif
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index a45a4ad843b9..836443fd5659 100644
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
+	 * Logging buffers in debugfs.  The wrapper objects need to remain
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
index a58c31089613..3d0fa1f64872 100644
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
+LIST_HEAD(gsp_logs);
+#endif
+
 static u64
 nouveau_pci_name(struct pci_dev *pdev)
 {
@@ -1446,6 +1454,17 @@ nouveau_drm_exit(void)
 #endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
+
+#ifdef CONFIG_DEBUG_FS
+	if (!list_empty(&gsp_logs)) {
+		struct nvif_log *log, *n;
+
+		list_for_each_entry_safe(log, n, &gsp_logs, head) {
+			/* shutdown() should also delete the log entry */
+			log->shutdown(log);
+		}
+	}
+#endif
 }
 
 module_init(nouveau_drm_init);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index bbab6d452aa2..51ac66031b06 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -26,6 +26,8 @@
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
 #include <engine/sec2.h>
+#include <drm/drm_device.h>
+#include <nvif/log.h>
 
 #include <nvfw/fw.h>
 
@@ -2062,6 +2064,169 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 	return 0;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+/*
+ * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
+ * logging debugfs entries will be deleted, and it will not be possible to
+ * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
+ * to copy the logging buffers to new debugfs entries, and these entries are
+ * retained until the driver unloads.
+ */
+static bool keep_gsp_logging;
+module_param(keep_gsp_logging, bool, 0444);
+MODULE_PARM_DESC(keep_gsp_logging,
+		 "Migrate the GSP-RM logging debugfs entries upon exit");
+
+#define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
+
+/**
+ * r535_gsp_msg_libos_print - capture log message from the PMU
+ * @priv: gsp pointer
+ * @fn: function number (ignored)
+ * @repv: pointer to libos print RPC
+ * @repc: message size
+ *
+ * See _kgspRpcUcodeLibosPrint
+ */
+static int r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
+{
+	struct nvkm_gsp *gsp = priv;
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct {
+		u32 ucodeEngDesc;
+		u32 libosPrintBufSize;
+		u8 libosPrintBuf[];
+	} *rpc = repv;
+	unsigned int class = rpc->ucodeEngDesc >> 8;
+
+	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
+		   class, rpc->libosPrintBufSize);
+
+	if (class != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
+		nvkm_warn(subdev,
+			  "received libos print from unknown class 0x%x\n",
+			  class);
+		return -ENOMSG;
+	}
+
+	if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
+		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
+			   rpc->libosPrintBufSize);
+		return -E2BIG;
+	}
+
+	memcpy(gsp->blob_pmu.data, rpc->libosPrintBuf, rpc->libosPrintBufSize);
+
+	return 0;
+}
+
+/**
+ * r535_gsp_libos_debugfs_init - create logging debugfs entries
+ * @gsp: gsp pointer
+ *
+ * Create the debugfs entries.  This exposes the log buffers to
+ * userspace so that an external tool can parse it.
+ *
+ * The 'logpmu' contains exception dumps from the PMU. It is written via an
+ * RPC sent from GSP-RM and must be only 4KB.  We create it here because it's
+ * only useful if there is a debugfs entry to expose it.  If we get the PMU
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
+ * is called too late.  We really want to create these debugfs entries before
+ * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
+ * there could still be a log to capture.
+ */
+static void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
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
+	r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, gsp);
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
@@ -2112,7 +2277,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
  * written to directly by GSP-RM and can be any multiple of GSP_PAGE_SIZE.
  *
  * The physical address map for the log buffer is stored in the buffer
- * itself, starting with offset 1. Offset 0 contains the "put" pointer.
+ * itself, starting with offset 1. Offset 0 contains the "put" pointer (pp).
+ * Initially, pp is equal to 0.  If the buffer has valid logging data in it,
+ * then pp points to index into the buffer where the next logging entry will
+ * be written.  Therefore, the logging data is valid if:
+ *   1 <= pp < sizeof(buffer)/sizeof(u64)
  *
  * The GSP only understands 4K pages (GSP_PAGE_SIZE), so even if the kernel is
  * configured for a larger page size (e.g. 64K pages), we need to give
@@ -2183,6 +2352,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
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
 
@@ -2493,6 +2667,182 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
 	gsp->fws.rm = NULL;
 }
 
+#ifdef CONFIG_DEBUG_FS
+
+struct r535_gsp_log {
+	struct nvif_log log;
+
+	/*
+	 * Logging buffers in debugfs.  The wrapper objects need to remain
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
+ * pointer, and it is initialized to 0.  If the pointer is still 0 when
+ * GSP-RM is shut down, that means that it was never written do, so it
+ * can be ignored.
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
+ * deleted if GSP-RM fails to load.  So we create a new debugfs root, allocate
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
+	list_add(&log->log.head, &gsp_logs);
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
 void
 r535_gsp_dtor(struct nvkm_gsp *gsp)
 {
@@ -2514,6 +2864,14 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	nvkm_gsp_mem_dtor(&gsp->rmargs);
 	nvkm_gsp_mem_dtor(&gsp->wpr_meta);
 	nvkm_gsp_mem_dtor(&gsp->shm.mem);
+
+#ifdef CONFIG_DEBUG_FS
+	r535_gsp_retain_logging(gsp);
+
+	kfree(gsp->blob_pmu.data);
+	gsp->blob_pmu.data = NULL;
+#endif
+
 	nvkm_gsp_mem_dtor(&gsp->loginit);
 	nvkm_gsp_mem_dtor(&gsp->logintr);
 	nvkm_gsp_mem_dtor(&gsp->logrm);
-- 
2.34.1

