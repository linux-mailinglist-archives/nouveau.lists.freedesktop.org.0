Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F092AD5C
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D6F10E46B;
	Tue,  9 Jul 2024 00:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P7OFRIu1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6933D10E46B
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIqpYBe5+/5VXwzNibYsWFgrz7UNSeNVVJNP1UbZOZg8EiRiXe+9noOhnS84ebmcdeDkrkS5FRTJkuYi11YLLQs+zBCGWjMiNNAQKg0GPUa0Ypmp5IUg1Vx7DS0isgxPachA25heduIoi46rx6CKa8QFXFTXatKLDRG+EDSMFSZCT2oi4GOz/ZLMnFw05eaFfnc/ltAXbqc6aLFkMhTI7d2sJpdfpSlAQG24qdif4pjdQqr/n4NubpB/x9S7VFnwWyeiN8RBbJJUZuWNGF6VJw+6VRrfRoviAKbYTbzG5qvv3L4aVOexq8n3sN7lWOoB6/SmigNRvvPVqD8toJzzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loFJc6A4duXlu6MkN79mJuPklUdBbfkubZuQoo6xV+c=;
 b=a3Yumc0tjt6itHk+zDsyLQJ8Gqbg4gkSQNxM2XmWoJ4la4aS6OEMW8NMEs4Vv3bGHbOKOrAoO5MwiuHRBtF743HIpMtBYLc7AA5hrr7xcagBVORdoxVARQGSSoXdDWCC3wWNnXkETe8YyNYm1stG64OYRYLkRZVV/0tNszZ9tfcKopDJqyoFOFiv+qBxpeOK6FC3Clhvgah9sISWXftvHzKdy+OFzQ7wiCylkWGn76bJ9VgJzKjpviAOYPRUvGgDZgrK8Vsd888f/fdAAKJUTrUAyqNJU11nS2kdvTksnPWOjDXho0gGElF7Is8JyS4ZrI4SUugh15W7Xg4Bu6lnOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loFJc6A4duXlu6MkN79mJuPklUdBbfkubZuQoo6xV+c=;
 b=P7OFRIu1DdvEtrjJdVvnOHJSWqZAzcIUfotmZNL9/v4YmTbnhluM0GT+W1OL0tdtMmpp7ybs5Hx1RqbY0Zm5yhqv5oc1+Oeh2DlQMQ/epGIYlGzWK4uh8MeZq571Ee2M8eHwwN4mBXyG06Yezz0XiTmFyrQ1ZzvOOu1EpWHHHQDM6plOGwPBn0nnl+LWv6cZcnm/5wBAbD2UJt8fVBuEHw8LBYgSVr3KgeDJ1M5RnFt8ZJgZ+qYsvXL4tYfNxg39SzBZDA7HtlI6k5eqqEWBoQv6vbgNCbPgfVfAJB3XNCHrNn1FNlOLfIEgAq23aibn4bWyFaREKsWEKPKsfr4y1w==
Received: from BN9PR03CA0224.namprd03.prod.outlook.com (2603:10b6:408:f8::19)
 by CH3PR12MB7547.namprd12.prod.outlook.com (2603:10b6:610:147::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:31 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::d1) by BN9PR03CA0224.outlook.office365.com
 (2603:10b6:408:f8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:18 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 23/37] drm/nouveau/nvif: remove device args
Date: Fri, 5 Jul 2024 04:37:07 +1000
Message-ID: <20240704183721.25778-24-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|CH3PR12MB7547:EE_
X-MS-Office365-Filtering-Correlation-Id: 78699632-c44d-49ab-b3e9-08dc9fb1d4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wkj0kGVqWRHl2oG9PQw8PBVjGswR/RZpk3RqxL0stfKpXSgpW0YIdmM5zMlV?=
 =?us-ascii?Q?qjDAnHMJP8FFxM8KNaUmtpcMrMrMzD6wLWx+E2WYDpMDywAMba/xBrNEv+i4?=
 =?us-ascii?Q?LcqmOMDo0mzULA5GPXZ/QM2caZR9MNGffk5BbEyz6MnfSrv/PujzxTPia+5a?=
 =?us-ascii?Q?+wrJnVaEE043CgJOBals7pkmcJ8npOpfu1vkTktBs8wknXy+Co4C3nrVstXc?=
 =?us-ascii?Q?9iNV8WgGZzoil7hl9d4W4w8vb0x5j5RjeT9xpnRPeLgOqOhGX2MOyWPKK7Xp?=
 =?us-ascii?Q?63khJokJ0xZQpwf0mTif3/+0n3o7ZvmWUuAYPJeEFb4A1js4Nf/X6rM3dR7U?=
 =?us-ascii?Q?BgFzDFF3cj8J3Z2OaebEFH3mZApp8OJsxxIa4q08hkU82GFZHJOrSXWKzBrq?=
 =?us-ascii?Q?188uoJXFSs6rChLWjUDpIB92HMzYCcL+rwUGSihKDBP/bFSboV6nJJgbzsba?=
 =?us-ascii?Q?5SHfOPIKSKs68PJlpaVmMGEf95GdZZPjKvK1P0bIkwBr2X46KQg9EVbIDSR8?=
 =?us-ascii?Q?yeTKHdkC2KnpV6D/+Z9yhBLypk/N8Q8YGb+JS2dAaakJFymqpngWPmzc9R8j?=
 =?us-ascii?Q?QEmOaRdEQhL6podeESZSp0480vkg9d6D2wYcW7sC4ZifBECHBJvHXvX/WNlz?=
 =?us-ascii?Q?GagKkSszTdiONd8HL7fBliXwVSNxyyWKh32oycAX9bv+vhWubdsSSrF9wXoK?=
 =?us-ascii?Q?Q0KthyCAeymygKctvJrtI8WYx4la6L7KJM5wVypddO1FSCi3k+ll+Dsfc2+3?=
 =?us-ascii?Q?VYBaa/r4qMKXt9rdnP6+nFLkPe3i2cuMBsyVN5oMYT4+w4PBApO+O+55pLs1?=
 =?us-ascii?Q?n4H6/ksxK3J09U0QVPMQZton1d67lf8gztWWVBTOjhMdi8F/safvP9oCE/pJ?=
 =?us-ascii?Q?MLsLFhcwcIEv4llUs4hSPLNaVgQck9Lb2/g/SzIzrxyCjPTfC5tSkw1fYxxc?=
 =?us-ascii?Q?67IZ4JLejCVX4NUEs831MHzb/lfD/SCzQHIRqqS4AWcGxlfkQx9TIGecWARu?=
 =?us-ascii?Q?xRqfY0wZhgbnyLtKySMLO9l341kFiXzccwm3yA/EepQzYStjkLTI71PZc6TT?=
 =?us-ascii?Q?TmGYstOEwilrQGkZllsjZ/JJLokosJrhYByMBylzpnHNxYLZKUu+XGNYCrKc?=
 =?us-ascii?Q?ytfNDuOjrTK+FizmOzhy4QCfyTm+JlNoTQt7u1FBEUoXIW2mwTKkMXHdHZvW?=
 =?us-ascii?Q?dxjJ8eLH9EKyfpIUeUuAzFReG4Fne3IV7GLoWvWky+eUfRQ1PRTJF9GnM+Y3?=
 =?us-ascii?Q?22syfTIlWRsh2uUmW6GtHuz2xAg5EM/g4MMX6SF4Fe0cYuXQsZOcA56PyZx6?=
 =?us-ascii?Q?lmyTHAyYxgk/OA6/2wljFfJt6zhRPvPYGsuSqTLjI6dtZMV/gDlk6s2+jsBh?=
 =?us-ascii?Q?ZkMOafl9j2gBm/qtZOwcrkGL2d/E++e1kGBLKFikV1SCSFk60+a+hk1ZzgC+?=
 =?us-ascii?Q?rXdUHnRhLHda1Bb3HrneD6uv1UFcDR3N?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:30.7850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78699632-c44d-49ab-b3e9-08dc9fb1d4e9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7547
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

These were once used by used by userspace tools (with nvkm built as a
library), to access multiple GPUs from a single nvif_client.

The DRM code just uses the driver's default device, so we can remove
the arguments.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h |  7 ----
 drivers/gpu/drm/nouveau/include/nvif/device.h |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  7 +---
 drivers/gpu/drm/nouveau/nvif/device.c         |  9 +++--
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 36 ++-----------------
 5 files changed, 9 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index fa161b74d967..ea937fa7bc55 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -2,13 +2,6 @@
 #ifndef __NVIF_CL0080_H__
 #define __NVIF_CL0080_H__
 
-struct nv_device_v0 {
-	__u8  version;
-	__u8  priv;
-	__u8  pad02[6];
-	__u64 device;	/* device identifier, ~0 for client default */
-};
-
 #define NV_DEVICE_V0_INFO                                                  0x00
 #define NV_DEVICE_V0_TIME                                                  0x01
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index b0e59800a320..f7c1b3a43c84 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -18,8 +18,7 @@ struct nvif_device {
 	struct nvif_user user;
 };
 
-int  nvif_device_ctor(struct nvif_object *, const char *name, u32 handle,
-		      s32 oclass, void *, u32, struct nvif_device *);
+int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device *);
 void nvif_device_dtor(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 8951a0805239..0beeff8552a2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -261,12 +261,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
-	ret = nvif_device_ctor(&cli->base.object, "drmDevice", 0, NV_DEVICE,
-			       &(struct nv_device_v0) {
-					.device = ~0,
-					.priv = true,
-			       }, sizeof(struct nv_device_v0),
-			       &cli->device);
+	ret = nvif_device_ctor(&cli->base, "drmDevice", &cli->device);
 	if (ret) {
 		NV_PRINTK(err, cli, "Device allocation failed: %d\n", ret);
 		goto done;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 8c3d883f3313..b14bccb9a93f 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -21,8 +21,8 @@
  *
  * Authors: Ben Skeggs <bskeggs@redhat.com>
  */
-
 #include <nvif/device.h>
+#include <nvif/client.h>
 
 u64
 nvif_device_time(struct nvif_device *device)
@@ -48,11 +48,10 @@ nvif_device_dtor(struct nvif_device *device)
 }
 
 int
-nvif_device_ctor(struct nvif_object *parent, const char *name, u32 handle,
-		 s32 oclass, void *data, u32 size, struct nvif_device *device)
+nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_device *device)
 {
-	int ret = nvif_object_ctor(parent, name ? name : "nvifDevice", handle,
-				   oclass, data, size, &device->object);
+	int ret = nvif_object_ctor(&client->object, name ? name : "nvifDevice", 0,
+				   0x0080, NULL, 0, &device->object);
 	device->runlist = NULL;
 	device->user.func = NULL;
 	if (ret == 0) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index d937c54e8dfa..65bd6712bce2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -357,7 +357,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 }
 
 static const struct nvkm_object_func
-nvkm_udevice_super = {
+nvkm_udevice = {
 	.init = nvkm_udevice_init,
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
@@ -371,50 +371,20 @@ nvkm_udevice_super = {
 	.sclass = nvkm_udevice_child_get,
 };
 
-static const struct nvkm_object_func
-nvkm_udevice = {
-	.init = nvkm_udevice_init,
-	.fini = nvkm_udevice_fini,
-	.mthd = nvkm_udevice_mthd,
-	.sclass = nvkm_udevice_child_get,
-};
-
 static int
 nvkm_udevice_new(const struct nvkm_oclass *oclass, void *data, u32 size,
 		 struct nvkm_object **pobject)
 {
-	union {
-		struct nv_device_v0 v0;
-	} *args = data;
 	struct nvkm_client *client = oclass->client;
-	struct nvkm_object *parent = &client->object;
-	const struct nvkm_object_func *func;
 	struct nvkm_udevice *udev;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(parent, "create device size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent, "create device v%d device %016llx\n",
-			   args->v0.version, args->v0.device);
-	} else
-		return ret;
-
-	/* give priviledged clients register access */
-	if (args->v0.priv)
-		func = &nvkm_udevice_super;
-	else
-		func = &nvkm_udevice;
 
 	if (!(udev = kzalloc(sizeof(*udev), GFP_KERNEL)))
 		return -ENOMEM;
-	nvkm_object_ctor(func, oclass, &udev->object);
+	nvkm_object_ctor(&nvkm_udevice, oclass, &udev->object);
 	*pobject = &udev->object;
 
 	/* find the device that matches what the client requested */
-	if (args->v0.device != ~0)
-		udev->device = nvkm_device_find(args->v0.device);
-	else
-		udev->device = nvkm_device_find(client->device);
+	udev->device = nvkm_device_find(client->device);
 	if (!udev->device)
 		return -ENODEV;
 
-- 
2.45.1

