Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F61484A7E6
	for <lists+nouveau@lfdr.de>; Mon,  5 Feb 2024 22:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE9810FCCE;
	Mon,  5 Feb 2024 21:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mz1YMCrz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3183010FCCE
 for <nouveau@lists.freedesktop.org>; Mon,  5 Feb 2024 21:45:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXKkEmzBDJo62oKvYPUo9iIeWor5IYW34PQt9rqf/fTVCHly5Fpl/i3/CsrfHVmgu7IFr2hN3vXG0uKWUo2Ed1AIwCoHFVs6X/RIQVT2IrGiNBgz4t0V2vypXoiEvmrw4nK8Sdu0gCOSXvndltAc/w9ylsNpabCNACSspRjogOkP0MXJKsauCv0YS9yi62MQ7ALH+S1qp/B0YFNaOs0zW7CwzJ2kDOXsP1y4gSQUFxJqspeebnrhePljh4v5cmMHtYyD81jtP/RQLRbHGqogm3h/YyR7QxNUnuEEDw3SVzM5cxmFuYUeUAjm2NRriWPsoMzUl5Iak7hh2R++FMwTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKMiuCeSQKuRmohJVStCFhBcCIdB1xTQJE6M/lYiWDE=;
 b=URpK6+76InZ5K8rr/MzGSxzZaoTwT5rKfHMrahMylTrZvSnc2eCThRqupDsDS0NGd3++EcYfvyohvYcEmNG8G2EX0rV43m1sj6e6srXyk1of98ElqVebrwZ5ARHqgNPaloEoxJijPHKE0DUL0AEE0IQ/JtpkXnzwzYbuAyASSU+IX+lpGoHCHCujNiWik2Cz0j0nJOtwpWtooagPntAXnP6Q1rKNbul38meotpRaNC1cJAHyAVBe7t6QSw1amDEGr1jF7aAeJyOncCtbr+TgldPFfpAnnDnEm0IuRh0hMPLhTUkkfmcM48SJiH1UkayKi4/gPxp3876tGucRVuqEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zKMiuCeSQKuRmohJVStCFhBcCIdB1xTQJE6M/lYiWDE=;
 b=mz1YMCrz7FCGIB9OUBfRI+wRpZ/3C/TQzpizSl9W3TR/+5LVUGpXxAQrCsqT3N3Fla4OVE30Rnu/UZgVt9uLQlJlC1PwJvIIzb8MNYLCg0PYukb+btsS61LN2CBAX9fu+sOnq1T/buWNh3b8fpfyGcaJz6vUoZYxPhPV4QkiDrAEfqz51+jA8ZnCMbQ0nJkrIYLqSNJGONGOqOiin4T059NK+dzjahWje6qY8sMqXLVQOmNeqmQIOWE/wPQ85ZFtKIRnAOkPuWylpbvg88GQ2ZAYMhNVPb1YPTI5ytwRvs5jzdeJiiROgJzyRXPqhhsXf2s/beJGS5uOSP2XMPdLqA==
Received: from PA7P264CA0225.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:374::8)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Mon, 5 Feb
 2024 21:45:09 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10a6:102:374:cafe::cc) by PA7P264CA0225.outlook.office365.com
 (2603:10a6:102:374::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Mon, 5 Feb 2024 21:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Mon, 5 Feb 2024 21:45:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 5 Feb 2024
 13:44:55 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Mon, 5 Feb 2024 13:44:54 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 5 Feb 2024 13:44:54 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: expose GSP-RM logging buffers via debugfs
Date: Mon, 5 Feb 2024 15:44:52 -0600
Message-ID: <20240205214452.2580940-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: bcbafd17-467b-4ad0-6497-08dc2693b7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /J/W+6K0z+FQQVA78KfY6IqViBpun/97FNvBg2e2nC0JtSghZnwandKPnj4iCn9F8pYEVIfysvgHDVWIl79MjLVFi7tXI3MItCS8wPmTuhQRagk4ZXnJCv80VYfVre7TBaTH0bj3tzaap9Q0xY6MZ/MmAKwDB/BjyijNSKShOG9rGeUdJBRUf05V6Xb+8IcM7TD7Lkks0PTHRgpicFcWuHu6W3yiKC871RC8xONsSDD21x5QsWv/fdNTZdJc2TVLXtOOc93K86msfjrVJ8JH+ZoZrhXmt4QDext/X7CoTCElgu9OdPTj+IKO0p3EcalQ7VuQdqgPOZe6stUCXGiZ5yJhLnvMEak//BqZN+8ZSF8LnpmNdP0nJe1zf0DLj3XtkMZyu9UBP9yvLTZ+WVxZxr2mzq1KZEIUR+B/BRG1u0SgOrLVq88nUU1/PRFHLPSZEp4ZeM+oCmF3wPmHta0N+enDSCHOGTpr+WM9FluuqxKzQ+cLs4bi9LEcOKpPak5ux+w8Ec39urVPdmeHE97yCM7vgK4h/BaeiQds5blFeC0J/KHYHnvZ8wxI0IY8VbPYakOOlJGmNdFMnuOaa2e4Z73tVlEyLP+emu9fnxHvr2qviSWZL2W+yVHISMzpTQI6NBs3ANp4OdxbhJWDhoeoTUOO/2ZpUZmlH6p8Ib3/dAcbVpD7FwYRjv49iIqijKKnVU+MJ7YQWmRE0P6WSFGKOzXoDD+BeQZWAPnjCzckyeN9xkcRSBIfmGT2+Z4tmUHS
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230273577357003)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(40470700004)(36840700001)(46966006)(41300700001)(66899024)(70206006)(8676002)(8936002)(2906002)(70586007)(5660300002)(30864003)(86362001)(110136005)(316002)(36756003)(36860700001)(47076005)(7636003)(82740400003)(356005)(478600001)(7696005)(83380400001)(336012)(26005)(426003)(2616005)(1076003)(40480700001)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 21:45:06.5804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcbafd17-467b-4ad0-6497-08dc2693b7e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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

The buffers are exposed via debugfs.  The debugfs entries must be
created before GSP-RM is started, to ensure that they are available
during GSP-RM initialization.

If GSP-RM fails to initialize, then Nouveau immediately shuts down
the GSP interface.  This would normally also deallocate the logging
buffers, thereby preventing the user from capturing the debug logs.
To avoid this, the keep-gsp-logging command line parameter can be
specified.  This parmater is marked as *unsafe* (thereby taining the
kernel) because the DMA buffer and debugfs entries are never
deallocated, even if the driver unloads.  This gives the user the
time to capture the logs, but it also means that resources can only
be recovered by a reboot.

An end-user can capture the logs using the following commands:

    cp /sys/kernel/debug/nouveau/loginit loginit
    cp /sys/kernel/debug/nouveau/logrm logrm
    cp /sys/kernel/debug/nouveau/logintr logintr
    cp /sys/kernel/debug/nouveau/logpmu logpmu

Since LOGPMU is not needed for GSP-RM initialization, it is only
created if debugfs is available.  Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 ++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 182 +++++++++++++++++-
 2 files changed, 190 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 3fbc57b16a05..999e3be3f38c 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -5,6 +5,8 @@
 #include <core/falcon.h>
 #include <core/firmware.h>
 
+#include <linux/debugfs.h>
+
 #define GSP_PAGE_SHIFT 12
 #define GSP_PAGE_SIZE  BIT(GSP_PAGE_SHIFT)
 
@@ -217,6 +219,16 @@ struct nvkm_gsp {
 
 	/* The size of the registry RPC */
 	size_t registry_rpc_size;
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
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index d065389e3618..8dc2729f5321 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1972,6 +1972,151 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 	return 0;
 }
 
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
+	unsigned int data = rpc->ucodeEngDesc >> 8;
+
+	nvkm_debug(subdev, "received libos print from class 0x%x for %u bytes\n",
+		   data, rpc->libosPrintBufSize);
+
+	if (data != NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU) {
+		nvkm_warn(subdev,
+			  "received libos print from unknown class 0x%x\n",
+			  data);
+		return -ENOMSG;
+	}
+	if (rpc->libosPrintBufSize > GSP_PAGE_SIZE) {
+		nvkm_error(subdev, "libos print is too large (%u bytes)\n",
+			   rpc->libosPrintBufSize);
+		return -E2BIG;
+
+	}
+	memcpy(gsp->blob_pmu.data, rpc->libosPrintBuf, rpc->libosPrintBufSize);
+
+	return 0;
+}
+
+/**
+ * r535_gsp_libos_debugfs_init - create logging debugfs entries
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
+ * is called much too late.  We really want to create these debugfs entries
+ * before r535_gsp_booter_load() is called, so that if GSP-RM fails to
+ * initialize, there could still be a log to capture.
+ *
+ * If the unsafe command line pararameter 'keep-gsp-logging' is specified,
+ * then the logging buffer and debugfs entries will be retained when the
+ * driver shuts down.  This is necessary to debug initialization failures,
+ * because otherwise the buffers will disappear before the logs can be
+ * captured.
+ */
+static void r535_gsp_libos_debugfs_init(struct nvkm_gsp *gsp)
+{
+	struct dentry *dir_init, *dir_intr, *dir_rm, *dir_pmu;
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("nouveau", NULL);
+	if (IS_ERR(dir)) {
+		/* No debugfs */
+		return;
+	}
+
+	if (IS_ERR_OR_NULL(dir)) {
+		nvkm_error(&gsp->subdev,
+			   "error %li creating /sys/kernel/debug/nouveau/\n", PTR_ERR(dir));
+		return;
+	}
+
+	gsp->blob_init.data = gsp->loginit.data;
+	gsp->blob_init.size = gsp->loginit.size;
+	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
+	if (IS_ERR_OR_NULL(dir_init)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create /sys/kernel/debug/nouveau/%s\n", "loginit");
+		debugfs_remove(dir);
+		return;
+	}
+
+	gsp->blob_intr.data = gsp->logintr.data;
+	gsp->blob_intr.size = gsp->logintr.size;
+	dir_intr = debugfs_create_blob("logintr", 0444, dir, &gsp->blob_intr);
+	if (IS_ERR_OR_NULL(dir_intr)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create /sys/kernel/debug/nouveau/%s\n", "logintr");
+		debugfs_remove(dir);
+		return;
+	}
+
+	gsp->blob_rm.data = gsp->logrm.data;
+	gsp->blob_rm.size = gsp->logrm.size;
+	dir_rm = debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm);
+	if (IS_ERR_OR_NULL(dir_rm)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create /sys/kernel/debug/nouveau/%s\n", "logrm");
+		debugfs_remove(dir);
+		return;
+	}
+
+	/*
+	 * Since the PMU buffer is copied from an RPC, it doesn't need to be
+	 * a DMA buffer.
+	 */
+	gsp->blob_pmu.size = GSP_PAGE_SIZE;
+	gsp->blob_pmu.data = kzalloc(gsp->blob_pmu.size, GFP_KERNEL);
+	if (!gsp->blob_pmu.data) {
+		debugfs_remove(dir);
+		return;
+	}
+
+	dir_pmu = debugfs_create_blob("logpmu", 0444, dir, &gsp->blob_pmu);
+	if (IS_ERR_OR_NULL(dir_pmu)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create /sys/kernel/debug/nouveau/%s\n", "logpmu");
+		kfree(gsp->blob_pmu.data);
+		debugfs_remove(dir);
+		return;
+	}
+
+	r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, gsp);
+	gsp->debugfs_logging_dir = dir;
+
+	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
+}
+
 static inline u64
 r535_gsp_libos_id8(const char *name)
 {
@@ -2021,7 +2166,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
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
@@ -2092,6 +2241,9 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
 	args[3].size = gsp->rmargs.size;
 	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
 	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+
+	r535_gsp_libos_debugfs_init(gsp);
+
 	return 0;
 }
 
@@ -2373,6 +2525,18 @@ r535_gsp_dtor_fws(struct nvkm_gsp *gsp)
 	gsp->fws.rm = NULL;
 }
 
+/*
+ * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
+ * logging debugfs entries will be deleted, and it will not be possible to
+ * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
+ * not to free these resources, even if the driver is unloading.  In this
+ * case, the only recovery is a reboot.
+ */
+static bool keep_gsp_logging;
+module_param_unsafe(keep_gsp_logging, bool, 0600);
+MODULE_PARM_DESC(keep_gsp_logging,
+		 "Do not remove the GSP-RM logging debugfs entries upon exit");
+
 void
 r535_gsp_dtor(struct nvkm_gsp *gsp)
 {
@@ -2392,9 +2556,19 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
 	r535_gsp_dtor_fws(gsp);
 
 	nvkm_gsp_mem_dtor(gsp, &gsp->shm.mem);
-	nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
-	nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+
+	if (keep_gsp_logging && gsp->debugfs_logging_dir)
+		nvkm_warn(&gsp->subdev,
+			"GSP-RM logging buffers retained, reboot required to recover\n");
+	else {
+		debugfs_remove(gsp->debugfs_logging_dir);
+		gsp->debugfs_logging_dir = NULL;
+
+		kfree(gsp->blob_pmu.data);
+		nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
+		nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
+		nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+	}
 }
 
 int
-- 
2.34.1

