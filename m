Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A015F8A78BF
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6F1112F39;
	Tue, 16 Apr 2024 23:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sBOmMVmw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2076.outbound.protection.outlook.com [40.107.237.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB52E112F35
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jomxkGpDLc9hTLGP4GPCvskzbP5dXybxn7TcaIq2oH+fCa8HoT6xBzG+yDD6xKKXYJ/4i5T9mSTWr3OGC0qT/4SRvoi5TM+6Vf93M/Yo8GRD7hZBosJB1N1UeI5Jq8SCsTreTXOhCv9qySl0S2aOCPCCfqUASQi/HKbOXE5VF2JQjzYkBMYXgnCtNlWOZxYVkn8X9fcuumx2sqv1t4/fhKlIyZgLJoNkjMFBwo3QCatEIvLptDrrS1LjErvwvjz2yfVglY2Wfpl4VowVPoNXlB3zIlGp5P+DLLPXVLsrYgPWKHh0kE8QpFqzWmbSg/Fy2LZLLNzX1tX/ZQLfWMq3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFWDZPCN93v7+pDpJVqfKhkczbl0WnGrNSFcN0+VbfE=;
 b=iQdWKE45EA6jB3xEMzGz9WBQVANAr+YZuB75sNAIhZghq1CvsR6OTz8YRMZ0eWq4AMuIRDE02ueCm1auyCIUIldtZyzH3IuRpAjpE28LdVoNPqhSk5M6TXMsZppB19XYgefQFoPqHlUu4mGrtxWupXsVn6AT+pZrVdpFSfQ+1q13XR4Qn5LWkS7/5O4GE9uwDn5RUha+sxb+ngoV3g6071+c2YjKQ76BLhCZG6LA0nGUzXEJfC5uaqBSYveqQdGOH1GGXTLgCs7GVKB1hgA5yyoyQI8mAELYCB9hXyinIr3ywlIYah7dvyY3sg2r3YNOesV2prVfRUug1CcF/TScsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFWDZPCN93v7+pDpJVqfKhkczbl0WnGrNSFcN0+VbfE=;
 b=sBOmMVmwccaEL9JlzDpGAOuP9eIb50A7cRqHjba+E/08CYzYXFQZ0HmYyfNzmf0PzTyXrfvfbsjoLofZGq4a8tymOqoQkXjeawCaLeDJzZ4O1JVuGySJGCvDHvOZf/uVbieYiLVAHV5LrfkRjJeISLVNWN079SGKJg/Znw6jClkqIEQRGjgsVXD6m3uXDOWoDDna+0rDZrlFKqw4MgiGqIXfWIIAG7EHH4/zcNZ+DD642fI7WQs+7YjJUGHt2x0V8W+/nL/nuKTIXMrXWiifnyBbaCYUV8588ScrWIKOQrJ3qL3aY2HkHWEKJvdZU8bazuwm65HSTogc3K67xL6rMg==
Received: from BN9PR03CA0065.namprd03.prod.outlook.com (2603:10b6:408:fc::10)
 by SN7PR12MB6766.namprd12.prod.outlook.com (2603:10b6:806:26a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:13 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::7b) by BN9PR03CA0065.outlook.office365.com
 (2603:10b6:408:fc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:12 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:57 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:56 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 023/156] drm/nouveau/nvkm: move nouveau_nvif.c to
 nvkm/core/driver.c
Date: Wed, 17 Apr 2024 09:37:49 +1000
Message-ID: <20240416234002.19509-24-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|SN7PR12MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fca38de-0502-4b2e-0c9d-08dc5e6eb369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bce9coHgS3ZsC7b80LpqkLLCRW62xUB1AmYptnrfuovejWR2ZjmkYafqYNHj1ploneMG785UX6sE0LvHasCvyrMmh8kge/o21kvn3sA/GbPHYB82IWJ0ALoex63Iilg331OofrY+qeivFWZCcudbwro3fGSD/IczXZmhHjPETwrEjQwIg/HVWN8stziREx6C661N48uZcglGEiSDjhHeTHY5f1wQ7bwVvNlAF73W1DmLBETMbwIpUambEm91SrJVwHEwS+L7hJkt1QqBQnmgMor8upRcehd67NjeJk5mYSpHCsjXoqf3NmMkZxfKRSxajpJnKxyrFYmX7eHjkPAYrs7rUsQ1/jKVgizdGSsqB0LFXxYVINpeBPfmImHmfIn2YgcbntXR591PZukQowKeqARG9swT8oXElAbNlqrvZRNE8KLGcFr4O00fQmK40lPFdoh/MPzAhJUqkhl4M9nGg84mZvYLWjZ9Gd9UF1IUbkHenXIXmVdGJzsCdoukNxRnrU56k48ZpLW+0k6UJCiSbx0f0p76zJeB8pvuwuNC1k2XyUzyyLgmyCf1yY7RD2f/2vjDHgq8rczrGOmT6CVOEJbsJHWStHWwJ0gI2Hz+hNPgPFjTn9GVHcyP69Zjx1mtFFDVnbrNO8nV4IlUuwPXT3nB4EEkqakvN7aldTyYmC8OOpabkasNLlC+jx9PoWDhTvXujJtakUbe3zklEWd4IMB5ZA1/8Wcr4Xkrzj3iNobkCAZBjonnjsedV9d93ouC
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:12.6999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fca38de-0502-4b2e-0c9d-08dc5e6eb369
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6766
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

- move to a more appropriate place before making changes

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild                |  1 -
 drivers/gpu/drm/nouveau/nvkm/core/Kbuild      |  1 +
 .../{nouveau_nvif.c => nvkm/core/driver.c}    | 36 +++++++++----------
 3 files changed, 18 insertions(+), 20 deletions(-)
 rename drivers/gpu/drm/nouveau/{nouveau_nvif.c => nvkm/core/driver.c} (75%)

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index c3223ec97aff..f99b7b227947 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -25,7 +25,6 @@ nouveau-y += nouveau_drm.o
 nouveau-y += nouveau_hwmon.o
 nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
 nouveau-$(CONFIG_LEDS_CLASS) += nouveau_led.o
-nouveau-y += nouveau_nvif.o
 nouveau-$(CONFIG_NOUVEAU_PLATFORM_DRIVER) += nouveau_platform.o
 nouveau-y += nouveau_vga.o
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/Kbuild b/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
index e40712023c73..7d111a5481d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/core/Kbuild
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: MIT
 nvkm-y := nvkm/core/client.o
+nvkm-y += nvkm/core/driver.o
 nvkm-y += nvkm/core/engine.o
 nvkm-y += nvkm/core/enum.o
 nvkm-y += nvkm/core/event.o
diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
similarity index 75%
rename from drivers/gpu/drm/nouveau/nouveau_nvif.c
rename to drivers/gpu/drm/nouveau/nvkm/core/driver.c
index 9a7e3f64b79f..3494002b40cd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_nvif.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -27,49 +27,48 @@
  ******************************************************************************/
 
 #include <core/client.h>
+#include <core/event.h>
 #include <core/ioctl.h>
 
-#include <nvif/client.h>
 #include <nvif/driver.h>
 #include <nvif/event.h>
-#include <nvif/ioctl.h>
-
-#include "nouveau_drv.h"
 
 static void
-nvkm_client_unmap(void *priv, void __iomem *ptr, u32 size)
+nvkm_driver_unmap(void *priv, void __iomem *ptr, u32 size)
 {
 	iounmap(ptr);
 }
 
 static void __iomem *
-nvkm_client_map(void *priv, u64 handle, u32 size)
+nvkm_driver_map(void *priv, u64 handle, u32 size)
 {
 	return ioremap(handle, size);
 }
 
 static int
-nvkm_client_ioctl(void *priv, void *data, u32 size, void **hack)
+nvkm_driver_ioctl(void *priv, void *data, u32 size, void **hack)
 {
 	return nvkm_ioctl(priv, data, size, hack);
 }
 
 static int
-nvkm_client_resume(void *priv)
+nvkm_driver_resume(void *priv)
 {
 	struct nvkm_client *client = priv;
+
 	return nvkm_object_init(&client->object);
 }
 
 static int
-nvkm_client_suspend(void *priv)
+nvkm_driver_suspend(void *priv)
 {
 	struct nvkm_client *client = priv;
+
 	return nvkm_object_fini(&client->object, true);
 }
 
 static int
-nvkm_client_event(u64 token, void *repv, u32 repc)
+nvkm_driver_event(u64 token, void *repv, u32 repc)
 {
 	struct nvif_object *object = (void *)(unsigned long)token;
 	struct nvif_event *event = container_of(object, typeof(*event), object);
@@ -81,21 +80,20 @@ nvkm_client_event(u64 token, void *repv, u32 repc)
 }
 
 static int
-nvkm_client_driver_init(const char *name, u64 device, const char *cfg,
-			const char *dbg, void **ppriv)
+nvkm_driver_init(const char *name, u64 device, const char *cfg, const char *dbg, void **ppriv)
 {
-	return nvkm_client_new(name, device, cfg, dbg, nvkm_client_event,
+	return nvkm_client_new(name, device, cfg, dbg, nvkm_driver_event,
 			       (struct nvkm_client **)ppriv);
 }
 
 const struct nvif_driver
 nvif_driver_nvkm = {
 	.name = "nvkm",
-	.init = nvkm_client_driver_init,
-	.suspend = nvkm_client_suspend,
-	.resume = nvkm_client_resume,
-	.ioctl = nvkm_client_ioctl,
-	.map = nvkm_client_map,
-	.unmap = nvkm_client_unmap,
+	.init = nvkm_driver_init,
+	.suspend = nvkm_driver_suspend,
+	.resume = nvkm_driver_resume,
+	.ioctl = nvkm_driver_ioctl,
+	.map = nvkm_driver_map,
+	.unmap = nvkm_driver_unmap,
 	.keep = false,
 };
-- 
2.41.0

