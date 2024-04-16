Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CD68A78ED
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F55112F34;
	Tue, 16 Apr 2024 23:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OPvSpKhp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE89D112F61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+gXLXlLGMCqpaL88LnKurX7mGSTlUCHJqz+z8MVPyIm9DnJR9eyBYZm/AW5aROJy0fOiSiz9PSRWiRrYySy5HGOEdAqW/GE8pzUktRkS5eGi5dnvWENaNcuSGQYfrBldDEUBtWgJjPFCR/NLGhfCVQVXbJkn7H5QxGlQR29Y1ZvWkQyjrBWTdtwmKVAqEpbhmopB3cuk69SHe0j1IorelRCAJ+s05crSAV9kz9nl/5c6tjxp3n1z6yBuf5xbkMyIz43Mydh5RcHu0GVcR54huxJMrSicZyjGCKLKskvUQxqHml8G+uaCpmwsbqFUBfV6wIDNP5JGPlgR2YQrfqDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awUC/IzCM8gZb1okt1voAOjMH1DZbNpVPvUvjdtfke8=;
 b=GpkvcYtTeDzEy6Q+aFMtFxh8i9oXyiiOpp3iH8inUaUKOSLEyCsB+lmuBa2wHjtapjs17E0zhTv37lNCpERlNIWJFhbjNG9oQJsplgBID5h4IAL5oP4g8ZtAWlmQgf4HATyLiDhJ29mOxziuRP2QkyM56MoFuBssulhGCV3UwwMeUPc8/hwhR2I7qc7Aau+wwYNVtickDO5//+0f3lAS9aSpqRifdsOuH0mgB/UqDfPzZT5+J/wnGYO6wNlvNaIwf845s516dvWU+3NTayFz15JKRlVOlGapJ+zZLFDPkpRWLKjIysPjWfcVpuhqeRfJJc8M8je7iP04L8H3hzfjQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awUC/IzCM8gZb1okt1voAOjMH1DZbNpVPvUvjdtfke8=;
 b=OPvSpKhpxQL7wt/beuCdWY8rynSP+7BFLe+caCX+KCAj+PEKzx4HsV2BKY4V3gheP8DHDDq8DyO8MDJP9ZgAnR+dS7xItgBjHO618C3LuYHujt6RTuQChbO8mAhRif01t9N23hbiMA5uUIOnOYG+RHkUyV4tgIc5GXKCqR9hsyRDiXEV/hyl3e7kkB+mYiQd6ai7PpQFXJ/895CZHEWROIM6it1Lnvz+ih1rjHTodQL+HQojZjdpurKAur1P1JE6CO3vRiAmDy47VrUK4MeVAbr/2nI4wcV6BY/DCQyaJnkmTqqx4B6t2ff3uWPecbCH0Tp9pBQt+Wczm3Sz4TeDTg==
Received: from BN9PR03CA0063.namprd03.prod.outlook.com (2603:10b6:408:fc::8)
 by CH3PR12MB9196.namprd12.prod.outlook.com (2603:10b6:610:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:59 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::63) by BN9PR03CA0063.outlook.office365.com
 (2603:10b6:408:fc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.30 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:38 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:37 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 059/156] drm/nouveau/nvif: move nvif<->nvkm interface
 definitions to driverif.h
Date: Wed, 17 Apr 2024 09:38:25 +1000
Message-ID: <20240416234002.19509-60-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|CH3PR12MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d15a6d0-da55-475f-e5f7-08dc5e6ecef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4U0jS6tyyDWI8Wf7vf0Ya3o6YbnZYCT66fk9kWiY8p0MhhUHv89/TT84v+iV7lqbtTHHYDxg1BclFnagJuua0euQ0K/T6YAwr1Ta09AWXW63xZ8Xr6JM/ELAA0lGo59g2IWdEhZw+p4if/mAttQgq0dOIqG9ITiyEfgrggEuA9i7cuAlydcLLJwyjByjOiBUQOI7I2sscaIhSBMM1k4nQIDeYhs7knzjALNzVLSHejebqiA9eWrj8bEjJf48M7lc5uKs+M7EnmIOVjT/gfKU1yLkc4JXD27RYJ8OL2H0rGtOcNTAjrboq5j4YTOBX1KS64v5hV3DGqdjzRMVVXzLmw4q3lUo+xb7QH+roPuYP9oL+JSc+QVsca/0i8RTOqtMODxbsQys5bTs4dRyfz4zzIsYsRqPdrmLKeqvjq6MqOSO+cwBSNkaDXMnOoH8ZD31b0RXzgLHZN6cPg88PyFfUowpvOsm2q9gFqQhmr68N0pOXxkOmSsA7W7pXOPTztx3OsymU15JB43l2wKjg3SYng/LZFxMNrleMkpBAE1hW6KJtEvjwW5ffeg7pyOGczR7gLqJMNoPcFnvPK0qDBESY7rjlJzUchxh3jWJ9R0Qr/yaST++vPpHk/A+iGigwmtYqtkYG3xQ9jm3gnoS0RmKd5GYP+nNNcip5OTzuZfJHq1mNmEOH7NBkMIzQxhLjl75d/p6spCm3LsWbPlqL4AJxPi9ZwZNxk26+jh/nA/jjWpkq4b46Z5zNkUz8syY8Asz
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:58.9659 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d15a6d0-da55-475f-e5f7-08dc5e6ecef7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9196
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

- "ioctl" interfaces will also be moved here in subsequent patches

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driver.h   | 11 -----------
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 15 +++++++++++++++
 drivers/gpu/drm/nouveau/nvif/client.c           |  1 +
 drivers/gpu/drm/nouveau/nvif/driver.c           |  1 +
 drivers/gpu/drm/nouveau/nvif/object.c           |  2 +-
 drivers/gpu/drm/nouveau/nvkm/core/driver.c      |  2 +-
 6 files changed, 19 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/driverif.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/drm/nouveau/include/nvif/driver.h
index 7b08ff769039..c31fc66a4765 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -4,17 +4,6 @@
 #include <nvif/os.h>
 struct nvif_client;
 
-struct nvif_driver {
-	const char *name;
-	int (*init)(const char *name, u64 device, const char *cfg,
-		    const char *dbg, void **priv);
-	int (*suspend)(void *priv);
-	int (*resume)(void *priv);
-	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
-	void __iomem *(*map)(void *priv, u64 handle, u32 size);
-	void (*unmap)(void *priv, void __iomem *ptr, u32 size);
-};
-
 int nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
 		     const char *name, u64 device, struct nvif_client *);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
new file mode 100644
index 000000000000..c5018452d372
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVIF_DRIVERIF_H__
+#define __NVIF_DRIVERIF_H__
+
+struct nvif_driver {
+	const char *name;
+	int (*init)(const char *name, u64 device, const char *cfg,
+		    const char *dbg, void **priv);
+	int (*suspend)(void *priv);
+	int (*resume)(void *priv);
+	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
+	void __iomem *(*map)(void *priv, u64 handle, u32 size);
+	void (*unmap)(void *priv, void __iomem *ptr, u32 size);
+};
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 098831d92eac..c0f93f4df2bb 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -24,6 +24,7 @@
 
 #include <nvif/client.h>
 #include <nvif/driver.h>
+#include <nvif/driverif.h>
 #include <nvif/ioctl.h>
 
 #include <nvif/class.h>
diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
index acb708df2559..4548ed35c31e 100644
--- a/drivers/gpu/drm/nouveau/nvif/driver.c
+++ b/drivers/gpu/drm/nouveau/nvif/driver.c
@@ -22,6 +22,7 @@
  * Authors: Ben Skeggs
  */
 #include <nvif/driver.h>
+#include <nvif/driverif.h>
 #include <nvif/client.h>
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 0e8340710c11..a71e000ada91 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -24,7 +24,7 @@
 
 #include <nvif/object.h>
 #include <nvif/client.h>
-#include <nvif/driver.h>
+#include <nvif/driverif.h>
 #include <nvif/ioctl.h>
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/driver.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
index 1f5273ff2225..0777b9af0656 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/driver.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -30,7 +30,7 @@
 #include <core/event.h>
 #include <core/ioctl.h>
 
-#include <nvif/driver.h>
+#include <nvif/driverif.h>
 #include <nvif/event.h>
 
 static void
-- 
2.41.0

