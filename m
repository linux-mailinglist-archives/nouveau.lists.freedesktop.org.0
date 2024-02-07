Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0568484D255
	for <lists+nouveau@lfdr.de>; Wed,  7 Feb 2024 20:45:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 896BB10E65A;
	Wed,  7 Feb 2024 19:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rMtF/Ynm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF0F10E65A
 for <nouveau@lists.freedesktop.org>; Wed,  7 Feb 2024 19:44:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYfVY3B9uaJZ0U66J3OYcKB3pxeIcr2eog0+H4zaCRtTz6iNVanXxd1RjMI5C4P9sp4zu0YhzV/AybjfHWbo/bOcgcbUxK7sGCUEtS8/UayQ2q5FHpoaF+1MyWrTWfMmwI4e8Hf00IfRfCiz7W8mx7qq0Gu2QxHO1FdQ2j7vjJddUWsokZiQII/yX/3F4rzZsJh4yLm+9nW/kMsxTVoS1DPDngMzYx0l3JCh1cN07kmDp+VqE3i41BZNe1d03qSf7fJGtDE1cvogehyBKJXu2msm8pg+FSMFG/5k9iPGhr/531mJBxu3JD6N4FanOsbjymZyiqBXzGFiPo/QJ5pF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z23sxUmwbd1STUecfMH8cXRMklfYT64lKm+kWO+LP2A=;
 b=CV0P+ui49moI4RaQMhEK0nTeK/grPBaQusEYQ30YeGQi1ehfSK+jdsqwLb8YqxVybbyO5c9KqQ4eus70ROBu3ZbS9muRlnsbo3VWUu2n8zyBFU1BY0hESwDLhKjInx3PkXMN0PDdXG8lYnimLRTuad6MYvILhoPWV6asQk9B2AMWODGe3VRBCdOJCYK93xdxUFgC40+96ED9rGU8IZiPeOBGEC6dyTm13zJvlCTxfjnOCh2BMwb9/VtovDs+jxzGl7waIBMmfBLseVM0qa2r+56s2IKf95/d52fzTbSv7QkZisDctaXqzyVFxgY90ZzmxAxECwHw7pPcdXVSyqIpvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z23sxUmwbd1STUecfMH8cXRMklfYT64lKm+kWO+LP2A=;
 b=rMtF/Ynm6QpOSRMEZQCsaIBl5qc9MO2zRHzWVwIxQmWHcRoquUWuPmEx2g0JJNoXYhWNF3oi1yzlU4VPtkzoFIEewgcB40qBbAziG5aJaf3U/y8jkGa6sTeRSSR3nKX+nNUUeYZOjJWcZd25bDayJxXQWBFDFqzgGt9NsnNmLy1newUW4l1cOBwuhP2LNjVHJFIMGf+H8WIQsX3pvw0GbHh3BH3hG1qTJ/a6vKzWQtbZ9shWq7Lwuk5uT53hBUGgApv72k0s9d2JWA+s/GJQdwerMrvMbwVAWOZviTFV57/ownWkt6/ScJATsf0yXRNwcpIazdxHrjYDJ5CaUgCTAQ==
Received: from SN7PR04CA0040.namprd04.prod.outlook.com (2603:10b6:806:120::15)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.17; Wed, 7 Feb 2024 19:44:51 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:806:120:cafe::80) by SN7PR04CA0040.outlook.office365.com
 (2603:10b6:806:120::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Wed, 7 Feb 2024 19:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 19:44:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 7 Feb 2024
 11:44:37 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Wed, 7 Feb
 2024 11:44:37 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.1258.12 via Frontend Transport;
 Wed, 7 Feb 2024 11:44:36 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] [v2] drm/nouveau: expose GSP-RM logging buffers via debugfs
Date: Wed, 7 Feb 2024 13:44:33 -0600
Message-ID: <20240207194433.3349496-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d82c83-0232-4187-2b01-08dc28153fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u+V/LFSQ5vO8eTEKfUlqaPLJ0VKHhM8IXLEamv3VPGAfU7kNz4GdUMgeKEY8r20/FXdDIsR23Wk4FvuNJlxjXuOsipBqBC0Ny2FN4CiLzjf70GKjwqOwRWBnajXQEbb/L5TNUPVTna5EVWjU0qZdjryp2kdxTuGIbzn7Ho7+gBIEoImzWgnO+XcyevTYObKE4FQEUM3MAuVuzxnEHJ6S3hj48lwempM33pNqQdv7Oq3dFpWh28ii4eKZ27utxsngYxZl81HygLUoP48c/CuOq1uYeJrRFmORgOPYOZZfYTCm9IvuE/XvMs4aGfRAS/X6oHCgo3su7YDsq82xiPVMlWeSmsHzeRYTU+zaMOV+QxCbTYlw3nOc7i18mnPGwfpYfMqrKSkmAlYNhTWqIcUDxX9ArcYXO0cggOwp+MHGzzAF9g06alOSkPuLS2oF80pN2Dv/Z+YsylbCQ40rcmhtJKNd0pkoytCMPIfquRtln36ERI5aFkPBHJU4u4zb0Yr8PACF10ttV/zzDqZw4Mnkc/JX4N2z/LgjATretHDY86OZPT8Dnk2xt2aawklG2rZ5jvc01XI3lkJ6OVIpvH2peUDoit1NOSxG+l/fDai8m5cfDAHl+13zLYdgCMlP+CbpeCGaLAS46JfB8xepExUd2LmeXfwalirWpyKobbV5PDaZb6gxmdK2UkAHrf+3/ZhaOQLBI27v+mwn+TX/RkvjZM8j0tgpnHwS3QcndP79J6+CMKAWHFMNdH2pvJYXgMZ2
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(230273577357003)(186009)(1800799012)(451199024)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(6666004)(426003)(336012)(41300700001)(36860700001)(7696005)(36756003)(478600001)(82740400003)(356005)(86362001)(2616005)(83380400001)(7636003)(1076003)(40480700001)(40460700003)(47076005)(70586007)(316002)(70206006)(30864003)(5660300002)(26005)(66899024)(2906002)(110136005)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 19:44:50.8327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d82c83-0232-4187-2b01-08dc28153fcf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
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

    cp /sys/kernel/debug/dri/<path>/loginit loginit
    cp /sys/kernel/debug/dri/<path>/logrm logrm
    cp /sys/kernel/debug/dri/<path>/logintr logintr
    cp /sys/kernel/debug/dri/<path>/logpmu logpmu

where <path> is the PCI ID of the GPU (e.g. 0000:65:00.0).  If
keep-gsp-logging is specified, then the <path> is the same but with
-debug appended (e.g. 0000:65:00.0-debug).

Since LOGPMU is not needed for normal GSP-RM operation, it is only
created if debugfs is available.  Otherwise, the
NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT RPCs are ignored.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  12 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 212 +++++++++++++++++-
 2 files changed, 220 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 3fbc57b16a05..2ee44bdf8be7 100644
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
+	struct debugfs_blob_wrapper blob_init;
+	struct debugfs_blob_wrapper blob_intr;
+	struct debugfs_blob_wrapper blob_rm;
+	struct debugfs_blob_wrapper blob_pmu;
+	struct dentry *debugfs_logging_dir;
 };
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index d065389e3618..495e443cf63b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1972,6 +1972,194 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
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
+/*
+ * If GSP-RM load fails, then the GSP nvkm object will be deleted, the
+ * logging debugfs entries will be deleted, and it will not be possible to
+ * debug the load failure.  The keep_gsp_logging parameter tells Nouveau
+ * not to free these resources, even if the driver is unloading.  In this
+ * case, the only recovery is a reboot.
+ */
+static bool keep_gsp_logging;
+module_param_unsafe(keep_gsp_logging, bool, 0444);
+MODULE_PARM_DESC(keep_gsp_logging,
+		 "Do not remove the GSP-RM logging debugfs entries upon exit");
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
+ * is called too late.  We really want to create these debugfs entries before
+ * r535_gsp_booter_load() is called, so that if GSP-RM fails to initialize,
+ * there could still be a log to capture.
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
+	struct dentry *root, *dir;
+
+	/* Find the 'dri' root debugfs entry. Every GPU has a dentry under it */
+	root = debugfs_lookup("dri", NULL);
+	if (IS_ERR(root)) {
+		/* No debugfs, or no root dentry for DRM */
+		return;
+	}
+
+	/*
+	 * Under normal circumstances, we add our debugfs entries to the dentry
+	 * created by the DRM layer when the driver registered.  However, this
+	 * dentry and everything in it is deleted if GSP fails to initialize.
+	 *
+	 * If keep-gsp-logging is specified, then a different top-entry dentry
+	 * is created and that is used.  This dentry is never deleted, even if
+	 * the driver exits.
+	 */
+	if (keep_gsp_logging) {
+		char temp[64];
+
+		scnprintf(temp, sizeof(temp), "%s-debug", dev_name(gsp->subdev.device->dev));
+		dir = debugfs_create_dir(temp, root);
+		dput(root);
+		if (IS_ERR_OR_NULL(dir)) {
+			nvkm_error(&gsp->subdev,
+				"failed to create %s debugfs entry\n", temp);
+			return;
+		}
+
+		gsp->debugfs_logging_dir = dir;
+	} else {
+		/* Each GPU has a subdir based on its device name, so find it */
+		dir = debugfs_lookup(dev_name(gsp->subdev.device->dev), root);
+		dput(root);
+		if (IS_ERR(dir)) {
+			nvkm_error(&gsp->subdev, "could not find debugfs path for %s\n",
+				   dev_name(gsp->subdev.device->dev));
+			return;
+		}
+	}
+
+	gsp->blob_init.data = gsp->loginit.data;
+	gsp->blob_init.size = gsp->loginit.size;
+	dir_init = debugfs_create_blob("loginit", 0444, dir, &gsp->blob_init);
+	if (IS_ERR_OR_NULL(dir_init)) {
+		nvkm_error(&gsp->subdev, "failed to create loginit debugfs entry\n");
+		return;
+	}
+	/* debugfs_create_blob should be doing this */
+	d_inode(dir_init)->i_size = gsp->blob_init.size;
+
+	gsp->blob_intr.data = gsp->logintr.data;
+	gsp->blob_intr.size = gsp->logintr.size;
+	dir_intr = debugfs_create_blob("logintr", 0444, dir, &gsp->blob_intr);
+	if (IS_ERR_OR_NULL(dir_intr)) {
+		nvkm_error(&gsp->subdev, "failed to create logintr debugfs entry\n");
+		goto error;
+	}
+	d_inode(dir_intr)->i_size = gsp->blob_intr.size;
+
+	gsp->blob_rm.data = gsp->logrm.data;
+	gsp->blob_rm.size = gsp->logrm.size;
+	dir_rm = debugfs_create_blob("logrm", 0444, dir, &gsp->blob_rm);
+	if (IS_ERR_OR_NULL(dir_rm)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create /sys/kernel/debug/nouveau/%s\n", "logrm");
+		goto error;
+	}
+	d_inode(dir_rm)->i_size = gsp->blob_rm.size;
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
+	if (IS_ERR_OR_NULL(dir_pmu)) {
+		nvkm_error(&gsp->subdev,
+			   "failed to create /sys/kernel/debug/nouveau/%s\n", "logpmu");
+		goto error;
+	}
+	d_inode(dir_pmu)->i_size = gsp->blob_pmu.size;
+
+	r535_gsp_msg_ntfy_add(gsp, 0x0000100C, r535_gsp_msg_libos_print, gsp);
+
+	nvkm_debug(&gsp->subdev, "created debugfs GSP-RM logging entries\n");
+	return;
+
+error:
+	debugfs_remove(gsp->debugfs_logging_dir);
+	gsp->debugfs_logging_dir = NULL;
+
+	kfree(gsp->blob_pmu.data);
+	gsp->blob_pmu.data = NULL;
+}
+
 static inline u64
 r535_gsp_libos_id8(const char *name)
 {
@@ -2021,7 +2209,11 @@ static void create_pte_array(u64 *ptes, dma_addr_t addr, size_t size)
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
@@ -2092,6 +2284,9 @@ r535_gsp_libos_init(struct nvkm_gsp *gsp)
 	args[3].size = gsp->rmargs.size;
 	args[3].kind = LIBOS_MEMORY_REGION_CONTIGUOUS;
 	args[3].loc  = LIBOS_MEMORY_REGION_LOC_SYSMEM;
+
+	r535_gsp_libos_debugfs_init(gsp);
+
 	return 0;
 }
 
@@ -2392,9 +2587,18 @@ r535_gsp_dtor(struct nvkm_gsp *gsp)
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
+		kfree(gsp->blob_pmu.data);
+		gsp->blob_pmu.data = NULL;
+
+		nvkm_gsp_mem_dtor(gsp, &gsp->loginit);
+		nvkm_gsp_mem_dtor(gsp, &gsp->logintr);
+		nvkm_gsp_mem_dtor(gsp, &gsp->logrm);
+	}
 }
 
 int
-- 
2.34.1

