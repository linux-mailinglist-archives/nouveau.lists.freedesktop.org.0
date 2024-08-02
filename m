Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCF994638D
	for <lists+nouveau@lfdr.de>; Fri,  2 Aug 2024 21:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29AB10E19E;
	Fri,  2 Aug 2024 19:05:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B+F1tkJF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E20310E076
 for <nouveau@lists.freedesktop.org>; Fri,  2 Aug 2024 19:05:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLLQNWw646HJB6Y/nwq8xbLKqJ2aeF5kRsj9Vq18T2tI4JOOU1Bq5bYMUh5a4NEhCZsp++fRCMMYh0NdGqsFXygMrTCp7c//oG4ImkD2NdfRmz80nedapRfXATXel8b1tqsdBeYAcl/jhUBEOGXeySKiF+kflNxc3D0Q5D9R/aMyz4en2O6ByNbLCudsTGxRjz9wRw/NNC2xjdqDTt/e9mBgKRzqh/a0ntqMCtasSczJ9ZAK2Xl3I1kUg4EaY22MuzRE+pG9sIpmHI8Yg9Af9uN5Vr/VvSr+6oPYYipqUKmYFd5e5zf53c5/DBVFT4gFN1e1I6zppRhbDrZOUrcKIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b00Zb4prjj4Y4ZnUtQUIBCkLpW4Sm8z0fu2ZGwy2siM=;
 b=wkDwng817nbtfDaZ8QQweiUlNS13xK39WHZdgYoJD/Cp8cxuItRrsCo1IKzNBfZNhs0ZdWcCFYMFL79mMbapr08KZggTtTr900QCTd8OFPbXqLTAeD8Txr3OKPCehPUbaSrOc+j0H+yqGAxrWroNMMsf859JL68Pb8PZk8Ud6CplRbCP/weuV06WWWfm3GyLE9fato1QmAR3AaiGSTYeSKbP5fjNd8TdNjV+MgaFxqRl0RYG6sev5/vbmPQG32mZorg84BINvulqE08+KXEyIE1D2wb7GUPJ1NdCHMqRzj3B3XDUkyfFkVnG5nTU5zloUPNk+alp8e7jvlThqHVMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b00Zb4prjj4Y4ZnUtQUIBCkLpW4Sm8z0fu2ZGwy2siM=;
 b=B+F1tkJFlRhMcQZz6X4h83o/UwbJRbeDY8PudWViIxOknAQZWChzxJEUZEo807lrFt9Xvz0gf1BVWBCHF3v+Sn1LpoyPrYii9I3sQgFpZE5+TlxegiJ9KaUIS9lACE6x2uBjZxnfxZNUpYX+77ooxnlgYDYP+5qC1bO7qiZaMWZq/Md6qWptz+OisZHB5nuMRqt0EzV7DPVd6urKyfGY1GSKPKFMnSheaPRb6bg9P5b1I1nCj0YgyqFH5QCm+fO0kgUZach2m0X9fPACXCuqT1YwlqPLSEwcTPT2qs3X5cn+LTcSp7rjEzDTHRipWxaWLI6RIjy6ewvOmpuVYMeoPw==
Received: from DM6PR10CA0033.namprd10.prod.outlook.com (2603:10b6:5:60::46) by
 SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.23; Fri, 2 Aug 2024 19:05:51 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::7e) by DM6PR10CA0033.outlook.office365.com
 (2603:10b6:5:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 19:05:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 19:05:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 2 Aug 2024
 12:05:32 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 2 Aug 2024
 12:05:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] [v7] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Date: Fri, 2 Aug 2024 14:05:17 -0500
Message-ID: <20240802190517.2548654-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240802190517.2548654-1-ttabi@nvidia.com>
References: <20240802190517.2548654-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: 65cfd718-93c4-43ec-b865-08dcb326202e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xQFrF/tSwGt+rzg0CY+skHH5tjpdTF3zOsB1EkGqz26U/qwNWNhRO6K0ABxM?=
 =?us-ascii?Q?sBSNCRjdtEj9vY112eMb3Ot8sw7o4LcFXRwSpM9nEXFqxpMWXeB3TZO+bbVE?=
 =?us-ascii?Q?nkUpayRSsBlLkJ7bu83RWymM2RMeH1rWFNk6PLHeWP0tXDCS5DkAANAt8bHi?=
 =?us-ascii?Q?nGtoocIlyCqRC5P7OscO7V0C815rhNHARsfeUD1eKz5rRMGNVcsdS8FFS669?=
 =?us-ascii?Q?M3pYY4D4s/75Ay8zgHwV3G+jKBrhwUZWo6Ji/VYS0TppGm0cQim7xZMHBc3z?=
 =?us-ascii?Q?dw+YxWk36n/S5vrZnKtFauDkVMlcikTLr8Y+E5KcfawoCMukq8zQj67d6Vuf?=
 =?us-ascii?Q?cjn3tT6L6/6VDJaYTjnr/2iby7whYjs0swWW3jRKp+bi6m/uVlc3HWz0ShBe?=
 =?us-ascii?Q?GJLb6sn9h+kPkfysq5fihERbGCqR43pe5v8PbG/rp+SOdC1LgOZsZIpjuzPF?=
 =?us-ascii?Q?vUS0HNgKF4Tdf8bxz8PeL8gOpg26erTKwGTQsRLIPl8e6Ed9UNdbLkVxzpn+?=
 =?us-ascii?Q?wHcHSQozrlzMNgEbN1EA9VCF7/KgzFwmXIaL8+NOnubuQEbzd0jik5u9jZoU?=
 =?us-ascii?Q?nF3LgjN5Us0enHAHgR+FMNW/6I4hXX32Ehi/Tt287kYEuY9zFi8N31xZTTj4?=
 =?us-ascii?Q?ct7WdBEVS2kIvihAdQQzkJJ1UnD/Hhh+Z/wP5Rhix+VKktJinR8hpOuIPxiY?=
 =?us-ascii?Q?+97JIG7N4seG2Un7CT/jCJD/Jvku0Ml+gwrqndyCTlSo6uSZctkpnHap4rwy?=
 =?us-ascii?Q?IuVAckM4HVkeSAOWGyQ6B8dAcvBsZQ+a5jOlKaGceRVO8/Csr8u/oE/KiX/f?=
 =?us-ascii?Q?enCS7pD6vuQh9UreImREIax3+n7YMpXU7u7SMqHY3tBvcWSUSJb0/G+JGuTa?=
 =?us-ascii?Q?UGazhGXpzps+IldhYbWD2skEH6+l/2HbDEJYwVZ5gETlIjMXiiy9uX1n6uAd?=
 =?us-ascii?Q?xGX9xbqHh9frCKuMDRZ2FUHjPz1KsV4XdY9P0+1rZRGuJPTAEes/D3oueHkI?=
 =?us-ascii?Q?ALIENXrPTgVEt1C4gSPl9wW7XWFh+jDrJod2HivFPjwmXxHMGODqY2Mq98uU?=
 =?us-ascii?Q?yN1QjO+No1hXoCMFpYPqL3ZBtmnom5+3K1yHtXURUAyZHJ5Bp7enBx9N0mxc?=
 =?us-ascii?Q?ObpQeZEsS58g9V6p8gVPFGOMEo/PblSaFc9fAd9sDlY/DSzfyzg7FNrnnu0I?=
 =?us-ascii?Q?aYDDnfG9NXXC3Yo5DIvcKA47cUUF2QSjjW6FTqIon5o3zIrgEDZZtLZfaADb?=
 =?us-ascii?Q?pUWSV9LcduGNA6y6F8kM4JY2NycZOOcjsYmj6NAw+fdFbY6bZKxmBKHCrBfa?=
 =?us-ascii?Q?wnSQ4QxbdGrW+cRCoxNWVjt/WqHkxsoiusG6gPcmT1+tDK68c1ZAgZxe5slE?=
 =?us-ascii?Q?parOFi6vt+kuHufagt1Z0JNg6Hiv9E94edyEf2MGQZleBrIvtCRzVDCkV67H?=
 =?us-ascii?Q?5JLCqNZiQJm4Pm+FA5CnjkjGXe47kQTQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 19:05:50.8267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65cfd718-93c4-43ec-b865-08dcb326202e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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

    cp /sys/kernel/debug/dri/<path>/loginit loginit
    cp /sys/kernel/debug/dri/<path>/logrm logrm
    cp /sys/kernel/debug/dri/<path>/logintr logintr
    cp /sys/kernel/debug/dri/<path>/logpmu logpmu

where (for a PCI device) <path> is the PCI ID of the GPU (e.g.
0000:65:00.0).

Since LOGPMU is not needed for normal GSP-RM operation, it is only
created if debugfs is available. Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

A simple way to test the buffer migration feature is to have
nvkm_gsp_init() return an error code.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---

Notes:
    v7:
    fixed PCI reference and typos in commit description
    replaced 'driver' with 'module' in comments
    added struct nvif_logs and related changes
    removed unnecessary drm_dev null check
    replaced nvkm_warn with nvkm_info
    add null pointer check in is_empty()
    fixed debugfs_lookup error check

 drivers/gpu/drm/nouveau/include/nvif/log.h    |  57 +++
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  13 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  12 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 397 +++++++++++++++++-
 4 files changed, 478 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/log.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/log.h b/drivers/gpu/drm/nouveau/include/nvif/log.h
new file mode 100644
index 000000000000..a2bf3be08113
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/log.h
@@ -0,0 +1,57 @@
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
+#ifdef CONFIG_DEBUG_FS
+/**
+ * gsp_logs - list of nvif_log GSP-RM logging buffers
+ *
+ * Head pointer to a a list of nvif_log buffers that is created for each GPU
+ * upon GSP shutdown if the "keep_gsp_logging" command-line parameter is
+ * specified. This is used to track the alternative debugfs entries for the
+ * GSP-RM logs.
+ */
+extern struct nvif_logs gsp_logs;
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
index ac7c60fb14d3..506beb078dd9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -46,6 +46,7 @@
 #include <nvif/fifo.h>
 #include <nvif/push006c.h>
 #include <nvif/user.h>
+#include <nvif/log.h>
 
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
@@ -112,6 +113,13 @@ static struct drm_driver driver_stub;
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
@@ -1461,6 +1469,10 @@ nouveau_drm_exit(void)
 #endif
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
+
+#ifdef CONFIG_DEBUG_FS
+	nvif_log_shutdown(&gsp_logs);
+#endif
 }
 
 module_init(nouveau_drm_init);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 86450b0cd605..4345333a52de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -26,6 +26,8 @@
 #include <subdev/vfn.h>
 #include <engine/fifo/chan.h>
 #include <engine/sec2.h>
+#include <drm/drm_device.h>
+#include <nvif/log.h>
 
 #include <nvfw/fw.h>
 
@@ -2076,6 +2078,191 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
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
+		nvkm_info(&gsp->subdev,
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
@@ -2126,7 +2313,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
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
@@ -2197,6 +2388,11 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
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
 
@@ -2507,6 +2703,202 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
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
+	return put ? (*put == 0) : true;
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
+	if (!root) {
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
+	list_add(&log->log.entry, &gsp_logs.head);
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
@@ -2528,6 +2920,9 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
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

