Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B96EF93CD4B
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EE610E564;
	Fri, 26 Jul 2024 04:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ALapMi0s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16B410E90F
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ql/aOUMAEfuFg9N9OowE9JIc59ZPaltkgzFl5twYxr2Ah3bjQoismCQMI+GAmeCCiRRhZ0rvD50PAAYmVzPBCVx/7D4PGXjMCB1mAiNVXS0qJtS5M+jNTLzXg7n2pe9C99rlk1apQLs2bnSe3FKgZkLWEycILoDAlf9aCz7zuoSOW9zpqs7ebXgyvVd3l6gyT5R7SPlh9t7OoQ4I1iiDN3Gl46tuAtsq5vA/cYtlfQN38GJpS9JeRfCq1uGpl9IiufTJMEGDP6CvfTUujGNevDuQ3yVIvmTOjYQJZ/BfdRer0TXjrjvPOV5Cg4cF1LMfBAUh9ZsQaNjrt4PM63LHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FBz11JzZWpobY13G3qmHpOos1vtvEt7de47Sv+dQGg=;
 b=y1DwFlemORn+JVA4KStLa1FzfKd1Wv9UfF7/hLkRVyIPt2zYX8a6709rYkP1i8b1fzKcQYFwMTLVYyGsqWwqVbPtF6/yGp9o62ZpijjbS53ccfJawQ3SaZHgxxqwgfw4waT7hFt/HRwSOeOEaceJyp8X3x54OJYrXusYuA63pEBSbBfh21t+45E1JHAI6i+kS1Pubvt4f2Al+q8WZIv4YEezqXEfaIDDp27cfBeQyGP8SQBUi4QR1Gc1cerQF4EG+PZhJ8/oai5oAzfIFhS75p3nQlHViqyA/5GoU/tjKtr0zARvIxjb0DyWesXrfp+sZ9Wep7QHMZKoY+WWhb1WOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FBz11JzZWpobY13G3qmHpOos1vtvEt7de47Sv+dQGg=;
 b=ALapMi0stkc5hm/toF8FOVkyDEke88QV28txUc7WP37FZmZobLm4kvEFbxdoDtONigH7Ahfcr+PeAsvkMDZPaQWdW+zlT+1wPYuBg9E3aYAZSVQA+QStSYEdDPqkrY0rsk7/HCSnA0qen8uZy2jmD+hC2MVB1jDnqX6Wu/6cZ9VTkYbikgYwMqVSvfjNhOM5zQ0N19tt28wrZ+EYhubbi/B9CV3TF2Ba1M3pBu2rYHJC271A06Yi5c6SuCV2UBPt1MJMGOAhb8PWhlq6+tIoapzHMbab9a7g2NvqOnXc/YRaermINESlP0MO6KWz0XrYsriAtMbJp8095aljPWwSPw==
Received: from DS7PR03CA0100.namprd03.prod.outlook.com (2603:10b6:5:3b7::15)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Fri, 26 Jul 2024 04:39:26 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::78) by DS7PR03CA0100.outlook.office365.com
 (2603:10b6:5:3b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:17 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 23/37] drm/nouveau/nvif: remove device args
Date: Fri, 26 Jul 2024 14:38:14 +1000
Message-ID: <20240726043828.58966-24-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: b51e2ae4-411d-421e-046e-08dcad2cee06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I9+LEOE8q/GKQFbVwvVDP5od2xtwAPbmP0ZbEqGNUwxXNhnJoOYrmOzpG7ms?=
 =?us-ascii?Q?pm8ALx+M/2PODDHw+6iF+4w8mBszmQb6+Tz4rvxjur7VX4Y+kR2mMlY03VJq?=
 =?us-ascii?Q?tz7akhRXyJqjXZd+0maySCSX7tQ38DL8E9W3pmDPAXPhwHjl/Rf4rU5Ybv/x?=
 =?us-ascii?Q?PubPw/poDyILCdz28P2dXDDcV5Ckxv5XD7Fwu+2V9wLWW15W1QeSiwky0j1f?=
 =?us-ascii?Q?l2PF3RdIZMrj4rBJbwvfCYGawIOr8PShPgslAlm3sYsEUZ1SBZ2i9kRDB27h?=
 =?us-ascii?Q?o/kmNJ3ibowRoBG31W4ix8RQJKEMT1TXHzxRnkInxC9nu5WXq2HecW91J23h?=
 =?us-ascii?Q?pT+QEeYOzQPfvZVNqcjh/ofxAdXnN5M5KY5bqmR6g1o8nOtpQ3ivAi30jCV8?=
 =?us-ascii?Q?zGW2sJ//daiPrLoI1+5XHyZImGs2OBR6R4XwmJ52ZsPCWNQOSk7ZGen31KZv?=
 =?us-ascii?Q?+foRliTRSvwkEsehB2SsWlMvScMBazzCJIk+6sUR3ORfV68EkZ/rBr47csDm?=
 =?us-ascii?Q?pj2Vpa5H37dTAa5hyKtdOKdaJ8h7EzXC/CwmLYfZi/n/dSpsc5l9RhrP+oKh?=
 =?us-ascii?Q?GGZ8/EaVL/i0huXu/mtw/d0+6vlZjUnI4G7MRxYd47D/w8n9swXgtqQ5qHy0?=
 =?us-ascii?Q?AqilIpNUYMZaLVqgt8MS+nMZ5+hMbPW4ojVFS2B2yYBMbcYefgcNHhS4hUAE?=
 =?us-ascii?Q?uqFbbxq0XhMe2UkpVTtSuIdgRmelbTOCvgLdHAovW/ML3rK3uWe5wprzMMaJ?=
 =?us-ascii?Q?4j/cpwrY2eF+xzHKHT/T+NhfsAzwzGUIDB1QlFFdAfHysWvqDtk33iP2GyyO?=
 =?us-ascii?Q?3ZjlKvDOLpxnF3/7yhZUoMyJxBd/A68MMzYk52O67NnYdK90rQbQJuABfvWR?=
 =?us-ascii?Q?3FEhh+O3Svz6GP7+wejtCrZRYJSbHkOLSKH3E9WLVxQtjnSNxgkfhFc4jY60?=
 =?us-ascii?Q?MUaquT3gd5/kUS30iP4SJE7V78UtwK5+qDRMSqUSkpmeMSrm+aws5wfcWsvN?=
 =?us-ascii?Q?AWLKUlG7QFp8pep24xmtYCHObF2j5pH8xvfBw/do3ZjxyuZWJ3cX40yc0ky6?=
 =?us-ascii?Q?5/H+41Heuljh3ne0qeH3b2Vwi4lAFBeg66Qp+siDfv7AFSpNp78uojehNmIZ?=
 =?us-ascii?Q?eJ8avRn3ER7GqhvfQ6xnX7CevxSbtbea54TKZuL8OpaMwiMMfmt0vZVUhWOs?=
 =?us-ascii?Q?kTtDv1xqruT3n90pdCwY6+eXCZv/V7NX3coaSoNmytxaIwVgHj/x7VGD8mnt?=
 =?us-ascii?Q?iUXnx5nmQ3fb+WLZXs8MWbNB4arU14YDWFsYbaJ7mvBTUVU1+KAPyMRWJduz?=
 =?us-ascii?Q?ka7cl/sa7w+gybXsN1Y0eQGKlVa6pu2em+B98ripTUqd+loIyRg3Wsp+3/y9?=
 =?us-ascii?Q?C/utNbPe8p7gBVnArIgp2o1Jpwgi+1ZCc8AVsE4t2fSGAD1AK+HGR8+JEftA?=
 =?us-ascii?Q?6F8ajcpNUvV4sPDU22UMHkBTErPd4r2p?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:26.1899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b51e2ae4-411d-421e-046e-08dcad2cee06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446
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

The DRM code just uses the driver's default device, so remove the
arguments.

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
index 8bcfc1f47a26..22cdd987dd2f 100644
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

