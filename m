Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2911D8A78EC
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D63F112F65;
	Tue, 16 Apr 2024 23:42:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SqEYk4gq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B18112F66
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9xn3dRbz9LlETZ4aMFP7qqmRw9ib8qIXT1CH4S42FtcTOI17l48v0NdurjKy5MgjxeTQIylOBM/dk8le7vPcuDJN9884SnG97HfVzIjXXrc2rKFUIV7QPk/6PJT4nZdG1QHYMljmfpUsX4aAsboD43AMXt6DECgdp5KPFDYoKkTJGwHSCGWaY9/Of0w7cbI7HKDHvXT950deeO6t0JE/wwP7PXr64hInDQs8dDlXR9/Xpr9zvj2uLcQylQpdsTL+6UWUlwQnSYrArWSIQ2WLZwR/i6P6GcuvwXQP66w1zqeDq5tn8X4dvRM5X6IyctzwqEiKkVO7oX9O/+rA4WYkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HE/X8+AYoSOUqgy2/XNz/OgUJsZzO+zIWTJFd7p47M=;
 b=D4L2Nw8G+0d3JBdrRe+m7im3YiVzvYmKLIxGFaC4JKqOo5uOuqLy/G4fpTPnDGRpnT0rIuTO3XTh9d30oOCqAp17Da+VTYTGf80Pkrg80k98JcKfzL/o1fgkVvXD7IISQmtINlRcNGpWQfFL3YjNXHz7NSLwnI0IZvVOQYCkpaOnih3YfnADnxvIuoreSzrAWpJTQRILR6rJ7bD7d3MBexI+8zi2/Irm/LTQHTy3EunGgP1cXjGr4CIVTMxzU0YZtXGykW/8KcZ5euHz9zWLjO1m0zcHw1EELJtbXyPDm86ye7UwmjVntKHQUzIfbH7aqkftU+euoxFj2iJE4G7wBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HE/X8+AYoSOUqgy2/XNz/OgUJsZzO+zIWTJFd7p47M=;
 b=SqEYk4gqvt0UPrtuOLjegrttzAPoUWHtaePRn9DAREQKYOYWc4IAjw+UdXCza5jJDkkx+wxU1dpPMvqp/2902HA6xFz9TzzheoOyeqzuGuBFUb8K/QGg88eu0TGZUWkol1y7BpJDrJblV/C88jmBAbBmHChv8sQyf0z9indOvDgP+fp1zOrzzWaP31YHhwVXhyEsCWl7RHLGl9N1lNENcTongZCiP/xvtbodJODsfVDs4F1+O84w5IxDTcErt0iknUpBm56qMpyZWhKJPV8ZRxNjstWOU93nQI8XZI7hxkBFIqapKWeqUp8++e1GaGOaFGacVngwFQWIPpRZK7upaA==
Received: from DM6PR02CA0064.namprd02.prod.outlook.com (2603:10b6:5:177::41)
 by MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:57 +0000
Received: from DS2PEPF0000343F.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::cd) by DM6PR02CA0064.outlook.office365.com
 (2603:10b6:5:177::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:56 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:39 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:38 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 060/156] drm/nouveau/nvif: rework "new driver" api
Date: Wed, 17 Apr 2024 09:38:26 +1000
Message-ID: <20240416234002.19509-61-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343F:EE_|MN0PR12MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 018cdcf0-c5c9-4160-1e83-08dc5e6ecd9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /F3lVfKe4qkXSRw1RC51JCfUH05ulvoSPYxbHSKDPgD9A6jXdY2KRdSf4vsq784CBkwCIfdVJuD+l+Ig4a7qFwA49VL3+bweJt5PnN/zJJzKcUfvuyy6AdAdRju1GLOg9ROE2nlUie+IVF+czMHeWcTE/kMzOSwgNRHqpV5pUh1PUjA2oUTrZHwN6iaY20/6VzhdlWEFz6Xi0p4FZivuC1HE+cwtmhL0VHt1i/jiFubEHF+ilYZnwiRh5D5UlgN1hraVkwKhdy3XpSVITon0dCK7pT6ACnBUllzAoeJIBtxUnApUvhGuj0XxNFwlY5RhOVoHBoFLpKAbf7W2gZqi1iS9flQgQmSeOTIy8EvZI9cizBsdrOx6JGjP8O7WoMPBpij+lom2PjyPezDxbu0/nRKdOB7ok4PMLQZvgIemlxLw/MwtTqVh48dlWAI6JFjlCUCOG/uc0roU2I5dnwRlgo3Hr83h3UuOC5b49OSDvDW4DDgH5dD/juWgAqa4zb8I85vHyinVm9xxvN7FHOvZaf6MmPAT7jQTOJA02N4nVdnIYUymcErP6KwyMEMOrC3L34WueHglbzgteByFB5EsoaKqKFxCB14gl6fC2gxnF2wocvGIhghXv4Yoxtc1Ju9X5EcNoRfCSnxTY1tvtObAA4Mf8BIZCWNK2jEvIsqU8QXFimbxaU0R82qp412MqpaCg3xrfpQy5s/UKR9L/7Q0zZuZNK6x8zsvQBjXnhRMPmZGl+wC8+TNPr+1HO7GIwEv
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:56.7335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 018cdcf0-c5c9-4160-1e83-08dc5e6ecd9c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6101
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

- cleans up init of first nvkm client ("driver")

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h |  3 ++
 drivers/gpu/drm/nouveau/include/nvif/driver.h | 11 +++--
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 15 ++++---
 .../drm/nouveau/include/nvkm/core/client.h    | 10 +++--
 .../drm/nouveau/include/nvkm/core/driver.h    |  9 ++++
 .../gpu/drm/nouveau/include/nvkm/core/os.h    |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 +++-
 drivers/gpu/drm/nouveau/nvif/client.c         | 14 ++++--
 drivers/gpu/drm/nouveau/nvif/driver.c         | 22 +++++-----
 drivers/gpu/drm/nouveau/nvif/object.c         |  6 +--
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 24 ++++++++---
 drivers/gpu/drm/nouveau/nvkm/core/driver.c    | 43 +++++++++++--------
 drivers/gpu/drm/nouveau/nvkm/device/user.c    |  6 +--
 13 files changed, 112 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/include/nvkm/core/driver.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 87dc55f8bde6..f8e4e25d6e86 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -5,7 +5,10 @@
 #include <nvif/object.h>
 
 struct nvif_client {
+	const struct nvif_client_impl *impl;
+	struct nvif_client_priv *priv;
 	struct nvif_object object;
+
 	const struct nvif_driver *driver;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h b/drivers/gpu/drm/nouveau/include/nvif/driver.h
index c31fc66a4765..8ca210b0bca6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driver.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driver.h
@@ -2,10 +2,13 @@
 #ifndef __NVIF_DRIVER_H__
 #define __NVIF_DRIVER_H__
 #include <nvif/os.h>
+struct nvif_parent;
+struct nvif_driver;
+struct nvif_client_impl;
+struct nvif_client_priv;
 struct nvif_client;
 
-int nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
-		     const char *name, u64 device, struct nvif_client *);
-
-extern const struct nvif_driver nvif_driver_nvkm;
+void nvif_driver_ctor(struct nvif_parent *, const struct nvif_driver *, const char *name,
+		      const struct nvif_client_impl *, struct nvif_client_priv *,
+		      struct nvif_client *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index c5018452d372..655bd389044d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -1,15 +1,18 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVIF_DRIVERIF_H__
 #define __NVIF_DRIVERIF_H__
+struct nvif_client_priv;
 
 struct nvif_driver {
 	const char *name;
-	int (*init)(const char *name, u64 device, const char *cfg,
-		    const char *dbg, void **priv);
-	int (*suspend)(void *priv);
-	int (*resume)(void *priv);
+	int (*suspend)(struct nvif_client_priv *);
+	int (*resume)(struct nvif_client_priv *);
 	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
-	void __iomem *(*map)(void *priv, u64 handle, u32 size);
-	void (*unmap)(void *priv, void __iomem *ptr, u32 size);
+	void __iomem *(*map)(struct nvif_client_priv *, u64 handle, u32 size);
+	void (*unmap)(struct nvif_client_priv *, void __iomem *ptr, u32 size);
+};
+
+struct nvif_client_impl {
+	void (*del)(struct nvif_client_priv *);
 };
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index f7f195d87838..e35aea7a751f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -3,10 +3,12 @@
 #define __NVKM_CLIENT_H__
 #include <core/object.h>
 
+#include <nvif/driverif.h>
+
 struct nvkm_client {
 	struct nvkm_object object;
 	char name[32];
-	u64 device;
+	struct nvkm_device *device;
 	u32 debug;
 
 	struct rb_root objroot;
@@ -16,8 +18,10 @@ struct nvkm_client {
 	int (*event)(u64 token, void *argv, u32 argc);
 };
 
-int  nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
-		     int (*)(u64, void *, u32), struct nvkm_client **);
+int nvkm_client_new(const char *name, struct nvkm_device *, int (*event)(u64, void *, u32),
+		    struct nvif_client_priv **);
+
+extern const struct nvif_client_impl nvkm_client_impl;
 
 /* logging for client-facing objects */
 #define nvif_printk(o,l,p,f,a...) do {                                         \
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/driver.h b/drivers/gpu/drm/nouveau/include/nvkm/core/driver.h
new file mode 100644
index 000000000000..8ad2278e700a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/driver.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_DRIVER_H__
+#define __NVKM_DRIVER_H__
+#include <nvif/driverif.h>
+struct nvkm_device;
+
+int nvkm_driver_ctor(struct nvkm_device *, const struct nvif_driver **,
+		     const struct nvif_client_impl **, struct nvif_client_priv **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
index 668338d7bda3..9d16413239d4 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
@@ -32,4 +32,5 @@ nvkm_blob_dtor(struct nvkm_blob *blob)
 	for (p = nvkm_list_find(p, (h), m, (c)); p; p = nvkm_list_find_next(p, (h), m, (c)))
 
 #define nvkm_uevent nvif_event_priv
+#define nvkm_client nvif_client_priv
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9c6df2ba52d5..d793afd929c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -37,6 +37,7 @@
 #include <drm/drm_ioctl.h>
 #include <drm/drm_vblank.h>
 
+#include <core/driver.h>
 #include <core/gpuobj.h>
 #include <core/option.h>
 #include <core/pci.h>
@@ -567,6 +568,9 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 		{}
 	};
 	struct nouveau_drm *drm;
+	const struct nvif_driver *driver;
+	const struct nvif_client_impl *impl;
+	struct nvif_client_priv *priv;
 	int ret;
 
 	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
@@ -580,11 +584,12 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	mutex_init(&drm->client_mutex);
 	drm->_client.object.parent = &drm->parent;
 
-	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug, "drm", nouveau_name(dev),
-			       &drm->_client);
+	ret = nvkm_driver_ctor(drm->nvkm, &driver, &impl, &priv);
 	if (ret)
 		goto fail_alloc;
 
+	nvif_driver_ctor(&drm->parent, driver, "drm", impl, priv, &drm->_client);
+
 	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index c0f93f4df2bb..4c4a856ab861 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -33,19 +33,27 @@
 int
 nvif_client_suspend(struct nvif_client *client)
 {
-	return client->driver->suspend(client->object.priv);
+	return client->driver->suspend(client->priv);
 }
 
 int
 nvif_client_resume(struct nvif_client *client)
 {
-	return client->driver->resume(client->object.priv);
+	return client->driver->resume(client->priv);
 }
 
 void
 nvif_client_dtor(struct nvif_client *client)
 {
-	nvif_object_dtor(&client->object);
+	if (!client->impl) {
+		nvif_object_dtor(&client->object);
+		client->driver = NULL;
+		return;
+	}
+
+	client->impl->del(client->priv);
+	client->impl = NULL;
+	client->object.client = NULL;
 	client->driver = NULL;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvif/driver.c b/drivers/gpu/drm/nouveau/nvif/driver.c
index 4548ed35c31e..95515f2023f4 100644
--- a/drivers/gpu/drm/nouveau/nvif/driver.c
+++ b/drivers/gpu/drm/nouveau/nvif/driver.c
@@ -25,17 +25,17 @@
 #include <nvif/driverif.h>
 #include <nvif/client.h>
 
-int
-nvif_driver_init(const char *drv, const char *cfg, const char *dbg,
-		 const char *name, u64 device, struct nvif_client *client)
+void
+nvif_driver_ctor(struct nvif_parent *parent, const struct nvif_driver *driver, const char *name,
+		 const struct nvif_client_impl *impl, struct nvif_client_priv *priv,
+		 struct nvif_client *client)
 {
-	int ret;
+	client->object.parent = parent;
+	client->object.client = client;
 
-	client->driver = &nvif_driver_nvkm;
-
-	ret = client->driver->init(name, device, cfg, dbg, &client->object.priv);
-	if (ret)
-		return ret;
-
-	return nvif_client_ctor(client, name, device, client);
+	nvif_object_ctor(&client->object, name ?: "nvifDriver", 0, 0, &client->object);
+	client->object.priv = priv;
+	client->driver = driver;
+	client->impl = impl;
+	client->priv = priv;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index a71e000ada91..f172f632979b 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -169,8 +169,8 @@ nvif_object_unmap(struct nvif_object *object)
 	struct nvif_client *client = object->client;
 	if (object->map.ptr) {
 		if (object->map.size) {
-			client->driver->unmap(client, object->map.ptr,
-						      object->map.size);
+			client->driver->unmap(client->object.priv, object->map.ptr,
+								   object->map.size);
 			object->map.size = 0;
 		}
 		object->map.ptr = NULL;
@@ -186,7 +186,7 @@ nvif_object_map(struct nvif_object *object, void *argv, u32 argc)
 	int ret = nvif_object_map_handle(object, argv, argc, &handle, &length);
 	if (ret >= 0) {
 		if (ret) {
-			object->map.ptr = client->driver->map(client,
+			object->map.ptr = client->driver->map(client->object.priv,
 							      handle,
 							      length);
 			if (ret = -ENOMEM, object->map.ptr) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 7dc425e67dd4..fa8d0795805e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -26,6 +26,7 @@
 #include <core/option.h>
 
 #include <nvif/class.h>
+#include <nvif/driverif.h>
 #include <nvif/event.h>
 #include <nvif/if0000.h>
 #include <nvif/unpack.h>
@@ -42,8 +43,8 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))){
 		args->v0.name[sizeof(args->v0.name) - 1] = 0;
-		ret = nvkm_client_new(args->v0.name, args->v0.device, NULL,
-				      NULL, oclass->client->event, &client);
+		ret = nvkm_client_new(args->v0.name, oclass->client->device,
+				      oclass->client->event, &client);
 		if (ret)
 			return ret;
 	} else
@@ -65,6 +66,19 @@ nvkm_uclient_sclass = {
 	.ctor = nvkm_uclient_new,
 };
 
+static void
+nvkm_client_del(struct nvif_client_priv *client)
+{
+	struct nvkm_object *object = &client->object;
+
+	nvkm_object_del(&object);
+}
+
+const struct nvif_client_impl
+nvkm_client_impl = {
+	.del = nvkm_client_del,
+};
+
 static int
 nvkm_client_child_new(const struct nvkm_oclass *oclass,
 		      void *data, u32 size, struct nvkm_object **pobject)
@@ -103,8 +117,8 @@ nvkm_client = {
 };
 
 int
-nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
-		int (*event)(u64, void *, u32), struct nvkm_client **pclient)
+nvkm_client_new(const char *name, struct nvkm_device *device, int (*event)(u64, void *, u32),
+		struct nvif_client_priv **pclient)
 {
 	struct nvkm_oclass oclass = { .base = nvkm_uclient_sclass };
 	struct nvkm_client *client;
@@ -116,7 +130,7 @@ nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
 	nvkm_object_ctor(&nvkm_client, &oclass, &client->object);
 	snprintf(client->name, sizeof(client->name), "%s", name);
 	client->device = device;
-	client->debug = nvkm_dbgopt(dbg, "CLIENT");
+	client->debug = NV_DBG_ERROR;
 	client->objroot = RB_ROOT;
 	spin_lock_init(&client->obj_lock);
 	client->event = event;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/driver.c b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
index 0777b9af0656..ea00b8724f24 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/driver.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/driver.c
@@ -25,8 +25,8 @@
 /*******************************************************************************
  * NVIF client driver - NVKM directly linked
  ******************************************************************************/
-
 #include <core/client.h>
+#include <core/driver.h>
 #include <core/event.h>
 #include <core/ioctl.h>
 
@@ -34,13 +34,13 @@
 #include <nvif/event.h>
 
 static void
-nvkm_driver_unmap(void *priv, void __iomem *ptr, u32 size)
+nvkm_driver_unmap(struct nvif_client_priv *client, void __iomem *ptr, u32 size)
 {
 	iounmap(ptr);
 }
 
 static void __iomem *
-nvkm_driver_map(void *priv, u64 handle, u32 size)
+nvkm_driver_map(struct nvif_client_priv *client, u64 handle, u32 size)
 {
 	return ioremap(handle, size);
 }
@@ -52,18 +52,14 @@ nvkm_driver_ioctl(void *priv, void *data, u32 size, void **hack)
 }
 
 static int
-nvkm_driver_resume(void *priv)
+nvkm_driver_resume(struct nvif_client_priv *client)
 {
-	struct nvkm_client *client = priv;
-
 	return nvkm_object_init(&client->object);
 }
 
 static int
-nvkm_driver_suspend(void *priv)
+nvkm_driver_suspend(struct nvif_client_priv *client)
 {
-	struct nvkm_client *client = priv;
-
 	return nvkm_object_fini(&client->object, true);
 }
 
@@ -79,20 +75,29 @@ nvkm_driver_event(u64 token, void *repv, u32 repc)
 	return NVKM_EVENT_DROP;
 }
 
-static int
-nvkm_driver_init(const char *name, u64 device, const char *cfg, const char *dbg, void **ppriv)
-{
-	return nvkm_client_new(name, device, cfg, dbg, nvkm_driver_event,
-			       (struct nvkm_client **)ppriv);
-}
-
-const struct nvif_driver
-nvif_driver_nvkm = {
+static const struct nvif_driver
+nvkm_driver = {
 	.name = "nvkm",
-	.init = nvkm_driver_init,
 	.suspend = nvkm_driver_suspend,
 	.resume = nvkm_driver_resume,
 	.ioctl = nvkm_driver_ioctl,
 	.map = nvkm_driver_map,
 	.unmap = nvkm_driver_unmap,
 };
+
+int
+nvkm_driver_ctor(struct nvkm_device *device, const struct nvif_driver **pdrv,
+		 const struct nvif_client_impl **pimpl, struct nvif_client_priv **ppriv)
+{
+	struct nvif_client_priv *client;
+	int ret;
+
+	ret = nvkm_client_new("driver", device, nvkm_driver_event, &client);
+	if (ret)
+		return ret;
+
+	*pdrv = &nvkm_driver;
+	*pimpl = &nvkm_client_impl;
+	*ppriv = client;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index af5aa9e1e5ea..b30b2e1c590a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -330,11 +330,7 @@ nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 	nvkm_object_ctor(&nvkm_udevice, oclass, &udev->object);
 	*pobject = &udev->object;
 
-	/* find the device that matches what the client requested */
-	udev->device = nvkm_device_find(client->device);
-	if (!udev->device)
-		return -ENODEV;
-
+	udev->device = client->device;
 	return 0;
 }
 
-- 
2.41.0

