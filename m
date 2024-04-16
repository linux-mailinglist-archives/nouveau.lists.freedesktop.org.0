Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D8B8A78F4
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D80112F61;
	Tue, 16 Apr 2024 23:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EqOzypMl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1BB6112F61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt/prZuRiiN/FVvAvLP3SzXr1r41PV7gSle7XDh7BdHHB+tjxB9czEonkxTMcjy2hT8KM4b0DD2gF6D1CHe11RUYaF+wWGKRjqj8S8dQeWF+a7RH+lX45uZn4JngDSUuv23uv2r5VGYStdeoCrHQdf2aweORGdiRafqEDyjD0vTtDUnyGo52ALEXubWFvikkFsC63lOErvRWGEDdjWTaJMwhrMYOjobmb7TTB3DB6n+/fRGavIJRGU/s9+Sb2Dw1P54ZZCLdCkAvzwRayApn6GplnbVPDJj6+FttdJbnEkdf/L7z5BxADUtAGQMikabkd7mBKD0o4Cq3+CNvDdO3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk36IHis9xI4Pw7nehwVkdqQdKYdHVMkjSzyuZV1snE=;
 b=FxUPPeHZuRq5Q2tGp10VaWeI8Yi8Or9azntZbeumrxXTbd+TaTgbY7JorJ4qUYvn1LE815TYECbrVD39x0YNrraxXHPV1siV+b9n9H1kuqScn5UVZAzZaWAG/PzyQrfbvcd7oDcJrnBvMGOyUV936NqZrWz9Yxoxgk7XBOv3WjpKgW9PmDH49TT1BJK47JNBw8rJ56X/aT39ZvZ+fIu4IogVfRmbWmvrxIdc1UdX2ejMZJTjdufYWSrNbee2J3Nc4SNyARJRCuae6CNWkJVFudMe9jmdjYI/krODAnDqR2SQ2i0Li7WHCvsjBupsGVyK3Og5RSRzXJGoA7KJWTIt+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk36IHis9xI4Pw7nehwVkdqQdKYdHVMkjSzyuZV1snE=;
 b=EqOzypMlmcGd5aXNO33yU6maE0h7Vcr3nHPfxOvFkR9LZFNTXVHEpbCMwKtMx3FfU6j5ThVP0MNwD+TGsFlOJHqFKmh8hDppPPXGKV6xu7IOJuLOo6auWaJtSC4UHIdAMXltltZ7XRV45pFyYKxOsHSbNqokk3ZW/54xIHoHlYAUegpWoQI81hDC2DU4aiaqJnPzpayPeqR8a8S9mY1qZeoCmIWoAdZX4rV7O66oZfEP6KpiJ6VnS4DadC9P2EcY3AbcUys/PEoBNhp7A3NLiWPYFHm+Vh3WDqbo15lfb3ouS5S+O2GUwtwQw0ZL4qVhBmJMtK8XnTFIVUjj/50j7Q==
Received: from DS7PR03CA0063.namprd03.prod.outlook.com (2603:10b6:5:3bb::8) by
 CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:42:12 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::d6) by DS7PR03CA0063.outlook.office365.com
 (2603:10b6:5:3bb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:51 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 070/156] drm/nouveau/nvif: rework device "new ctrl" api
Date: Wed, 17 Apr 2024 09:38:36 +1000
Message-ID: <20240416234002.19509-71-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f59f876-c26a-4d8f-f536-08dc5e6ed6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ek71wyoIOTZpgJEHMzUI/pcLXFv7vpm4uUoiIiLIHOwPRgVRgRVIu38B6LIKSXZOeSZz/Rch9YuYSrmZmtRZZcHDZr5nKEpy6gxbNnrjCOxppUSxiDaxcRRLWOW/t+9/BarbNG7p2DQ6akMsTxGO+R25+qjMdpUhnj9n2qLr89MkcHRz5IQfFg5wpeUrAzROQ77se1eKO3xI8ak+1BPhh5fLOFxdsZr/xvLXT5C7+x1KSBeUhNRfdO8w/sZNBHPdW3lilkjhwtznTtJor72hXPUc6I8VcmhuYD5G0kAX8qkk9TJw+i/jsJrazcu8AYh6zRBuaGIc8ws99m/zJcmzVzFZFyWKOQukXlxASFuZHYEdhJdkpmPHRVWbSXBVX8kmGFoEAdFxuaQlQ1suiNhZQmnFLRjUechNMxfmkkHrWHpdmhMcVkN8yj63bwnGfntpQkjbmc/T56hAWP0OmKJ2ty8ZHF8nvc4evnleGYysiPaR/+te2iJcEmiMrVkQOTqmjtADhbW07YOEIYLt9VVp5ElyYDBfI7QSx3AQFaa6+rNM1TxuhcamPeycYdWiWo/2gevFOTLYghN16QPEWXdQf9c3xY5H/A0qdOsYsPAfBeY1vkxBQGeaJF1CXtfps9zWLVTYtayiahsOqt25Clj8nOp/o/H5SiD7dgVer3kpHnJzHzTG1jKxiYLa0D6DS23dn4SLQur74gxZLRVtzKDxaIxR+lAHcd57ecdeVmZkkguoamGfIlNnmxbTkOqWYchl
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:12.0588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f59f876-c26a-4d8f-f536-08dc5e6ed6c0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/class.h  |  2 --
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 11 ++++++
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 17 +++++----
 drivers/gpu/drm/nouveau/nouveau_debugfs.h     |  2 ++
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c    | 35 +++++++++++--------
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.h    |  5 ++-
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 20 +++++++++--
 7 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index b6bba7231750..6174999eacd3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -3,8 +3,6 @@
 #define __NVIF_CLASS_H__
 
 /* these class numbers are made up by us, and not nvidia-assigned */
-#define NVIF_CLASS_CONTROL                           /* if0001.h */ -0x00000001
-
 #define NVIF_CLASS_SW_NV04                           /* if0004.h */ -0x00000004
 #define NVIF_CLASS_SW_NV10                           /* if0005.h */ -0x00000005
 #define NVIF_CLASS_SW_NV50                           /* if0005.h */ -0x00000006
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 44064b5da897..aa1061266557 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -3,6 +3,7 @@
 #define __NVIF_DRIVERIF_H__
 struct nvif_client_priv;
 struct nvif_device_priv;
+struct nvif_control_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -22,6 +23,10 @@ struct nvif_mapinfo {
 	u64 length;
 };
 
+struct nvif_control_impl {
+	void (*del)(struct nvif_control_priv *);
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
@@ -63,6 +68,12 @@ struct nvif_device_impl {
 
 	u64 (*time)(struct nvif_device_priv *);
 
+	struct {
+		int (*new)(struct nvif_device_priv *,
+			   const struct nvif_control_impl **, struct nvif_control_priv **,
+			   u64 handle);
+	} control;
+
 	struct {
 		s32 oclass;
 	} usermode;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index e83db051e851..e061ef7a1707 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -29,7 +29,6 @@
  */
 
 #include <linux/debugfs.h>
-#include <nvif/class.h>
 #include <nvif/if0001.h>
 #include "nouveau_debugfs.h"
 #include "nouveau_drv.h"
@@ -295,20 +294,26 @@ nouveau_drm_debugfs_init(struct drm_minor *minor)
 int
 nouveau_debugfs_init(struct nouveau_drm *drm)
 {
+	int ret;
+
 	drm->debugfs = kzalloc(sizeof(*drm->debugfs), GFP_KERNEL);
 	if (!drm->debugfs)
 		return -ENOMEM;
 
-	return nvif_object_ctor(&drm->client.device.object, "debugfsCtrl", 0,
-				NVIF_CLASS_CONTROL, NULL, 0,
-				&drm->debugfs->ctrl);
+	ret = drm->device.impl->control.new(drm->device.priv, &drm->debugfs->impl,
+					    &drm->debugfs->priv, nvif_handle(&drm->debugfs->ctrl));
+	if (ret)
+		return ret;
+
+	nvif_object_ctor(&drm->device.object, "debugfsCtrl", 0, 0, &drm->debugfs->ctrl);
+	return 0;
 }
 
 void
 nouveau_debugfs_fini(struct nouveau_drm *drm)
 {
-	if (drm->debugfs && drm->debugfs->ctrl.priv)
-		nvif_object_dtor(&drm->debugfs->ctrl);
+	if (drm->debugfs && drm->debugfs->impl)
+		drm->debugfs->impl->del(drm->debugfs->priv);
 
 	kfree(drm->debugfs);
 	drm->debugfs = NULL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.h b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
index 77f0323b38ba..197e81f771d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.h
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.h
@@ -9,6 +9,8 @@
 #include "nouveau_drv.h"
 
 struct nouveau_debugfs {
+	const struct nvif_control_impl *impl;
+	struct nvif_control_priv *priv;
 	struct nvif_object ctrl;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
index a74fb78ca7ab..5caa93665cc9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
@@ -26,7 +26,6 @@
 #include <core/client.h>
 #include <subdev/clk.h>
 
-#include <nvif/class.h>
 #include <nvif/if0001.h>
 #include <nvif/ioctl.h>
 #include <nvif/unpack.h>
@@ -195,25 +194,33 @@ nvkm_control = {
 	.mthd = nvkm_control_mthd,
 };
 
-static int
-nvkm_control_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
-		 void *data, u32 size, struct nvkm_object **pobject)
+static void
+nvkm_control_del(struct nvif_control_priv *ctrl)
+{
+	struct nvkm_object *object = &ctrl->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_control_impl
+nvkm_control_impl = {
+	.del = nvkm_control_del,
+};
+
+int
+nvkm_control_new(struct nvkm_device *device, const struct nvif_control_impl **pimpl,
+		 struct nvif_control_priv **ppriv, struct nvkm_object **pobject)
 {
 	struct nvif_control_priv *ctrl;
 
 	if (!(ctrl = kzalloc(sizeof(*ctrl), GFP_KERNEL)))
 		return -ENOMEM;
-	*pobject = &ctrl->object;
+
+	nvkm_object_ctor(&nvkm_control, &(struct nvkm_oclass) {}, &ctrl->object);
 	ctrl->device = device;
 
-	nvkm_object_ctor(&nvkm_control, oclass, &ctrl->object);
+	*pimpl = &nvkm_control_impl;
+	*ppriv = ctrl;
+	*pobject = &ctrl->object;
 	return 0;
 }
-
-const struct nvkm_device_oclass
-nvkm_control_oclass = {
-	.base.oclass = NVIF_CLASS_CONTROL,
-	.base.minver = -1,
-	.base.maxver = -1,
-	.ctor = nvkm_control_new,
-};
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
index d241329a1e7a..c435ddf0a713 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.h
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVKM_DEVICE_CTRL_H__
 #define __NVKM_DEVICE_CTRL_H__
+#include <core/device.h>
+#include <nvif/driverif.h>
 
-extern const struct nvkm_device_oclass nvkm_control_oclass;
+int nvkm_control_new(struct nvkm_device *, const struct nvif_control_impl **,
+		     struct nvif_control_priv **, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index b37c857863b8..14d548c3f6b0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -39,6 +39,21 @@ struct nvif_device_priv {
 	struct nvif_device_impl impl;
 };
 
+static int
+nvkm_udevice_control_new(struct nvif_device_priv *udev,
+			 const struct nvif_control_impl **pimpl, struct nvif_control_priv **ppriv,
+			 u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_control_new(udev->device, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+}
+
 static u64
 nvkm_udevice_time(struct nvif_device_priv *udev)
 {
@@ -58,6 +73,7 @@ static const struct nvif_device_impl
 nvkm_udevice_impl = {
 	.del = nvkm_udevice_del,
 	.time = nvkm_udevice_time,
+	.control.new = nvkm_udevice_control_new,
 };
 
 static int
@@ -134,9 +150,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 	}
 
 	if (!sclass) {
-		if (index-- == 0)
-			sclass = &nvkm_control_oclass;
-		else if (device->mmu && index-- == 0)
+		if (device->mmu && index-- == 0)
 			sclass = &device->mmu->user;
 		else if (device->fault && index-- == 0)
 			sclass = &device->fault->user;
-- 
2.41.0

