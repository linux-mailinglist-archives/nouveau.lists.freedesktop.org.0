Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C7B8A78E9
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C92F112F5E;
	Tue, 16 Apr 2024 23:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ON4K376m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2069.outbound.protection.outlook.com [40.107.243.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C824112F2B
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ysbo1SIqWiz5d+sc8IN06xz0/utH87XyodLpDBtZ1IEaIyyVjibd8PIIKD1oYhMcwXR+wK5rhMMy3zFPbeXO6BZycn8u/qvVRnXNrbe8PD0lC6TzbjbhcxGQe71OIOsbru09FbwOfvNEzuJj3yuAzC3HMS9WlEGXQNUtUcery7T5IGuSxyJrZwsNjVROeRj1CfXttxdSUxKhza0bSFvz9wO0DxH1kR4kPaYQb0Lhcln268Wtr8tTzxYUUEHPAwuWyabAEwGiO86amd31drdML1P774myzFdfch4poJ0T1Gfc8irRV0g4MMiPr0ST238krHWA9ayOLx3rh1dvoRbUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dajf5/10/EHZc+3O+fyUie6nOV0jRzuig2CIslMYZEg=;
 b=m6srBGL2kijnZXzCzmgZCJOE/OptDG8ErupJJAXr8u6FKcBL26ZSNv/VIG9K7i7CxXG3FXJ7GQ6ZnMBw1QkP5tC21GPMoWlgrbjQnzyf4uIHWDAT6TrNu5UrGLi7AheWKH5irH0elzuvuGh5K270Eyo2m6wcpV5RKzL1g5xADrGdNvZ5Gd+UsQiSwtJDp9NBWcM+cB9RKsTrpYmAnPGJ/lt8sVfygPh4pKdtNAvdnlzRMLe0qheE47jN4RU47Ue2XiT/ZMDb4f/DZ2aPwPxCT+gjvZCTz2TF4V3x7fD4Dv81zeifWBj1T64Frq1ZXzTyLvKXsRy0PonHsS9wNJf96A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dajf5/10/EHZc+3O+fyUie6nOV0jRzuig2CIslMYZEg=;
 b=ON4K376mdxKPo0rB1rlsTA7WoQfhR7qNTR04d4r9rDjcplHTDSj+cDw4wTYVj2/Wf29GBys21d+aetFVFrLSNouZzQ3kI0919ybBQY6V6wdCKV6x1I+uzbnL+NM3ICJrN9tt/ZHy0c27UH9rdP1yMhj8Hms2kvvugEQGHo20zxeKYqJBGUpaDLhK+gX4J7RanLgV31+wyZ0fxJkAB0vTkEnCjMlXeXLwHWkKCUvDpK+J9v6DM5up3EivjwB77zaM6UHiNSUyHjNd0NhQevOQH1oNYAhBjproWomREN1jmN0cpv9vtgW3qMmv2G87pgeZd8RJZY/RbBoh+keWxEPw6Q==
Received: from DM6PR02CA0043.namprd02.prod.outlook.com (2603:10b6:5:177::20)
 by SA1PR12MB7103.namprd12.prod.outlook.com (2603:10b6:806:2b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:00 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::54) by DM6PR02CA0043.outlook.office365.com
 (2603:10b6:5:177::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:00 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:43 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 063/156] drm/nouveau/nvif: rework client "new device" api
Date: Wed, 17 Apr 2024 09:38:29 +1000
Message-ID: <20240416234002.19509-64-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|SA1PR12MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bfc2c2-51e8-436c-1914-08dc5e6ecfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ffZXQzFoh9x3erOxFLZr1BQOjqZ927zJILFyZNflTakZ+iCAmumNkuyWJeuy9JqW7dfHCTa6QmvGqVcwXaVpc/wUksJ4k7GjDNyYYOgZvdsXA0X0h/zoMgyzN2pKhYTf0EhYKPBY1nbpkUj/VPSpIHWVOSFZuDr/vvVppYDD7is8nHDjMsZuk5or/V8BDbbsecztgpgJtKbJLf+5Zgqie39bdTk2mkoqMDIy6S1DmwVAlCGUGNxRARMcS/clg015OuPoMLFV2UBFFR/hEPfnCb3SmaItUVB/ubX6YG+O959xrD01cGsJNLEYJniGFqJFAM1gDRkpm5m/k9K0Uq7JIctDgT3LYX0eqsyL8hNPBjSt/s6b8KmRKmMUk5lBdIWOJYCs2Uzi+Sgl0jDaD0DKAOPVaYKPcGEHUyzllr+z2ixcEH5VcwRijxDnX2PZchb14mzpruKXT0jB67wEXEFAvVVmqyNHSVWDKGZVF42J/9nYmCZhloo5iXuurOD/8oGV61QSuILx6dZtth75k78WRhKUSJDfa3VY6iBgqBlHmyXY8e1bdCwRxymkum8GO7G+2FKscrnQGiyG4wrOZZEFSZWbZTu+byfJrZu2X65eTqga0ukI0Yw5Pa9+Oy/WLYQNLjXBWreVbMoP88yn282Bp/gUI1KK+kXvp2YmZwo6eA+JBa5l8KnqJ6Q1aZhJWOxJBAXWUx/A4esfGWjLtor7DEAatEexnlmztg66ZAD6hw8G51CloWWf6XnSZTQtaKHR
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:00.3116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bfc2c2-51e8-436c-1914-08dc5e6ecfbe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7103
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
 drivers/gpu/drm/nouveau/include/nvif/device.h |  4 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 11 ++++
 .../drm/nouveau/include/nvkm/core/device.h    |  2 -
 drivers/gpu/drm/nouveau/nvif/device.c         | 24 +++++++--
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 42 ++++++---------
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 52 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/device/user.h    |  9 ++++
 7 files changed, 99 insertions(+), 45 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/device/user.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index fec76f4733a4..c0f8920f0e08 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -1,12 +1,14 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVIF_DEVICE_H__
 #define __NVIF_DEVICE_H__
-
 #include <nvif/object.h>
 #include <nvif/cl0080.h>
+#include <nvif/driverif.h>
 #include <nvif/user.h>
 
 struct nvif_device {
+	const struct nvif_device_impl *impl;
+	struct nvif_device_priv *priv;
 	struct nvif_object object;
 	struct nv_device_info_v0 info;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index a6f95c8475b1..8f56798d6509 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -2,6 +2,7 @@
 #ifndef __NVIF_DRIVERIF_H__
 #define __NVIF_DRIVERIF_H__
 struct nvif_client_priv;
+struct nvif_device_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -12,6 +13,10 @@ struct nvif_driver {
 	void (*unmap)(struct nvif_client_priv *, void __iomem *ptr, u32 size);
 };
 
+struct nvif_device_impl {
+	void (*del)(struct nvif_device_priv *);
+};
+
 struct nvif_client_impl {
 	void (*del)(struct nvif_client_priv *);
 
@@ -20,5 +25,11 @@ struct nvif_client_impl {
 			   const struct nvif_client_impl **, struct nvif_client_priv **,
 			   u64 handle);
 	} client;
+
+	struct {
+		int (*new)(struct nvif_client_priv *,
+			   const struct nvif_device_impl **, struct nvif_device_priv **,
+			   u64 handle);
+	} device;
 };
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index efe1a0048328..fff0d7dd0e1b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -129,8 +129,6 @@ struct nvkm_device_oclass {
 	struct nvkm_sclass base;
 };
 
-extern const struct nvkm_sclass nvkm_udevice_sclass;
-
 /* device logging */
 #define nvdev_printk_(d,l,p,f,a...) do {                                       \
 	const struct nvkm_device *_device = (d);                               \
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 24880931039f..bb95e80f1c81 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -23,6 +23,7 @@
  */
 #include <nvif/device.h>
 #include <nvif/client.h>
+#include <nvif/printf.h>
 
 u64
 nvif_device_time(struct nvif_device *device)
@@ -47,23 +48,40 @@ nvif_device_map(struct nvif_device *device)
 void
 nvif_device_dtor(struct nvif_device *device)
 {
+	if (!device->impl)
+		return;
+
 	nvif_user_dtor(device);
 	kfree(device->runlist);
 	device->runlist = NULL;
-	nvif_object_dtor(&device->object);
+
+	device->impl->del(device->priv);
+	device->impl = NULL;
 }
 
 int
 nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_device *device)
 {
-	int ret = nvif_object_ctor(&client->object, name ? name : "nvifDevice", 0,
-				   0x0080, NULL, 0, &device->object);
+	int ret;
+
 	device->runlist = NULL;
 	device->user.func = NULL;
+
+	ret = client->impl->device.new(client->priv, &device->impl, &device->priv,
+				       nvif_handle(&device->object));
+	NVIF_ERRON(ret, &client->object, "[NEW device]");
+	if (ret)
+		return ret;
+
+	nvif_object_ctor(&client->object, name ?: "nvifDevice", 0, 0, &device->object);
+	device->object.client = client;
+	device->object.priv = device->priv; /*FIXME: used by nvxx_device() */
+
 	if (ret == 0) {
 		device->info.version = 0;
 		ret = nvif_object_mthd(&device->object, NV_DEVICE_V0_INFO,
 				       &device->info, sizeof(device->info));
 	}
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index b57cc0d5a148..1763e863115c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -24,12 +24,28 @@
 #include <core/client.h>
 #include <core/device.h>
 #include <core/option.h>
+#include <device/user.h>
 
 #include <nvif/class.h>
 #include <nvif/driverif.h>
 #include <nvif/event.h>
 #include <nvif/unpack.h>
 
+static int
+nvkm_client_new_device(struct nvif_client_priv *client,
+		       const struct nvif_device_impl **pimpl, struct nvif_device_priv **ppriv,
+		       u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_udevice_new(client->device, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(client, &client->object, handle, object);
+}
+
 static int
 nvkm_client_new_client(struct nvif_client_priv *parent,
 		       const struct nvif_client_impl **pimpl, struct nvif_client_priv **ppriv,
@@ -60,32 +76,9 @@ const struct nvif_client_impl
 nvkm_client_impl = {
 	.del = nvkm_client_del,
 	.client.new = nvkm_client_new_client,
+	.device.new = nvkm_client_new_device,
 };
 
-static int
-nvkm_client_child_new(const struct nvkm_oclass *oclass,
-		      void *data, u32 size, struct nvkm_object **pobject)
-{
-	return oclass->base.ctor(oclass, data, size, pobject);
-}
-
-static int
-nvkm_client_child_get(struct nvkm_object *object, int index,
-		      struct nvkm_oclass *oclass)
-{
-	const struct nvkm_sclass *sclass;
-
-	switch (index) {
-	case 0: sclass = &nvkm_udevice_sclass; break;
-	default:
-		return -EINVAL;
-	}
-
-	oclass->ctor = nvkm_client_child_new;
-	oclass->base = *sclass;
-	return 0;
-}
-
 static void *
 nvkm_client_dtor(struct nvkm_object *object)
 {
@@ -95,7 +88,6 @@ nvkm_client_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_client = {
 	.dtor = nvkm_client_dtor,
-	.sclass = nvkm_client_child_get,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index b30b2e1c590a..a46d448dc244 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -21,6 +21,7 @@
  *
  * Authors: Ben Skeggs
  */
+#include "user.h"
 #include "priv.h"
 #include "ctrl.h"
 
@@ -38,6 +39,8 @@
 struct nvif_device_priv {
 	struct nvkm_object object;
 	struct nvkm_device *device;
+
+	struct nvif_device_impl impl;
 };
 
 static int
@@ -187,6 +190,20 @@ nvkm_udevice_time(struct nvkm_udevice *udev, void *data, u32 size)
 	return ret;
 }
 
+static void
+nvkm_udevice_del(struct nvif_device_priv *udev)
+{
+	struct nvkm_object *object = &udev->object;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_device_impl
+nvkm_udevice_impl = {
+	.del = nvkm_udevice_del,
+};
+
 static int
 nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
@@ -318,26 +335,33 @@ nvkm_udevice = {
 	.sclass = nvkm_udevice_child_get,
 };
 
-static int
-nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
+int
+nvkm_udevice_new(struct nvkm_device *device,
+		 const struct nvif_device_impl **pimpl, struct nvif_device_priv **ppriv,
 		 struct nvkm_object **pobject)
 {
-	struct nvkm_client *client = oclass->client;
 	struct nvif_device_priv *udev;
+	int ret;
 
 	if (!(udev = kzalloc(sizeof(*udev), GFP_KERNEL)))
 		return -ENOMEM;
-	nvkm_object_ctor(&nvkm_udevice, oclass, &udev->object);
+
+	nvkm_object_ctor(&nvkm_udevice, &(struct nvkm_oclass) {}, &udev->object);
+	udev->device = device;
+
+	ret = nvkm_udevice_init(&udev->object);
+	if (ret)
+		goto done;
+
+	udev->impl = nvkm_udevice_impl;
+
+	*pimpl = &udev->impl;
+	*ppriv = udev;
 	*pobject = &udev->object;
 
-	udev->device = client->device;
-	return 0;
-}
+done:
+	if (ret)
+		nvkm_udevice_del(udev);
 
-const struct nvkm_sclass
-nvkm_udevice_sclass = {
-	.oclass = NV_DEVICE,
-	.minver = 0,
-	.maxver = 0,
-	.ctor = nvkm_udevice_new,
-};
+	return ret;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.h b/drivers/gpu/drm/nouveau/nvkm/device/user.h
new file mode 100644
index 000000000000..fb3f94a58960
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_DEVICE_USER_H__
+#define __NVKM_DEVICE_USER_H__
+#include <core/device.h>
+#include <nvif/driverif.h>
+
+int nvkm_udevice_new(struct nvkm_device *, const struct nvif_device_impl **,
+		     struct nvif_device_priv **, struct nvkm_object **);
+#endif
-- 
2.41.0

