Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE968D1201
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954A410F8D1;
	Tue, 28 May 2024 02:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JrmwSooz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FCC10F8D1
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QjdbyfcShqSpcFtIcxephBPklEFmUr+FPe9xFV3zZJy6ImuNf+8bQjjiGkVQ4D3GX9cn7++EZQAKVjsWrQq5ucq4Xmo3u5duIrL1mR8CwWhWdseiUI+5XIVIlVVmlOZlF+O2wdNgFFef806LhGhjcXBEZe9VCzsbsdqFgcWpSn374P8+Sx/t2W0ccIK2nHLTb3p++av4LyV+M76KJGlBfiWjWeFOIRsBAb1Va3UTAW/heftM7b2uQodYpqQ1DnBBbNgapie9zjmtUiKVhLHr0Wk5+Xng9FvIiJFhopH5OsN2dC/Qnl8J8cQCrKuE2In2t7ISuZewJVNizRJc3El81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OufAhDB3yyrHCD3feMjcqxP24R5k+Qlg1PXyVq/1hJw=;
 b=J4inhmdBs6kfbAF2G2KD8jzbW0G3A7XA9gCws6ysQiZSHUGJIpSOGKxYIlwrJvMnxEcSPu4QNnayGQh6B+/zyqa8Z+OsgS6ZHpTEIchYCAUkD9Z7UGVnPY4owKJ0Lnbrf+jD5LhPVC/gfwAaOW1tTAXiCdXTIUk2vNAwoD6H+n9pkRb+KIyFyoHdl4TAdoEflpw64K3vn11pNHSpNHQFWkpGC16ZTTPoeIFvshQ2yFOpiDJreHL+Aq+SqFeAVMyanvfqkjLHzxIHLomZ1g3KlL2r5iuFyXWjLkS1Aisnxyl+Oy9BdIOeSyakEhNIdjt0M2MRYVuB9TTZRU0Q0ot0GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OufAhDB3yyrHCD3feMjcqxP24R5k+Qlg1PXyVq/1hJw=;
 b=JrmwSoozfdwV//SwuTgtfSKFZG9ctCMiu7hNvLT0cbl08DetRznU0qxbg049sa9+SBBQjjsMtiuQtnjafkFSyvVPfdZvz+1+aERmZC9WR37ec/0PQI2htqW8reSflsAOhsuLFwSblIhgoApKXrSpPIgFmrDcYTwMIizZLDn6MtzRkjM5lQa7b8BsD5So3zUOQ4gYUcZihLVow7bjNvqYSoY/R005hQeSlbLHQAECQzj3sm5lq4F5JLZEOY2O7597mycbvEDJB0gdL5J3ztULlT2ztuDAuvHcVfSHUnMEGmSijvgqQD6Fks29HegrmJYs2RiTnXgaTFb2WH5lsZypKw==
Received: from SJ0PR13CA0033.namprd13.prod.outlook.com (2603:10b6:a03:2c2::8)
 by CH3PR12MB8880.namprd12.prod.outlook.com (2603:10b6:610:17b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:31 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::1d) by SJ0PR13CA0033.outlook.office365.com
 (2603:10b6:a03:2c2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:18 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 20/34] drm/nouveau/nvif: remove device args
Date: Tue, 28 May 2024 00:19:45 +1000
Message-ID: <20240527141959.59193-21-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|CH3PR12MB8880:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a47b081-4841-42e0-a350-08dc7ebd2abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400017|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?txFd7hJIawvQlT9azM2dxVUMcNq6nv8ZqIlDvhbvTiURyJ+mzYr7mMWx1iCf?=
 =?us-ascii?Q?Z5Bzxh9n6FQH0e4+uSepTDuprxoueFMrT+xwM/are079uVfMpiDYK6e0DGDz?=
 =?us-ascii?Q?TMALqhRGtdQm3OhkVxxI139QPfI6/dO07KPmOL5yODsqwzy2jBCpkKDya9GM?=
 =?us-ascii?Q?saHjWVwwvHmzecLo7LpUXxPqXRdgnln6e3mysdm9MlKzQ60U9D9yk0RS3rLH?=
 =?us-ascii?Q?2mBc5ggvOXHqIvk20vWK5AKMIs0HonN0af5FbboBwxuyRLQec2qLPep4cDcX?=
 =?us-ascii?Q?6j60dqXUxsLamzwjf2j4d3g/qJ5IjfLpZcG5HKyPjHt+uP5AxsnwiRfQtNHp?=
 =?us-ascii?Q?8c3RLuuVDSEAkN7OjKQfeAp/QjHNdlHZyyqM2hGpf7IkZLuo+3eU7C5LUd/R?=
 =?us-ascii?Q?RClLTXv6tYMreqDj56GdA0mJ7yt0tLKQoFikv1BRB7dylaumMPT1tFZZuWv2?=
 =?us-ascii?Q?MHTEQH/FI63PBMQ2owO3Kvqdc505d1PYomREL8HDMQl4tlwz79c3lUcJ+q05?=
 =?us-ascii?Q?kp3IOg8H9Lp8R69VLR+AnM1861cn5sxUrA4rNTswfPUuSvLOamySnTT1bHMG?=
 =?us-ascii?Q?pdy2f/ez1C77yG7+ZUdx+z99QIREeTbLnh33qaJ6uh8Fo4G6yqHuXX8vzfMg?=
 =?us-ascii?Q?hIg3mqk62PKW9lGY6a4xbXAK7UzJ/xvspgvgnP3eNbXWrUT79Xi9mMIZ7yo7?=
 =?us-ascii?Q?S4XO0lr8/U3TI9TF3QRHwFJkavHbBqWov+HyeFT7rb3649JDZrbps0rSc3oz?=
 =?us-ascii?Q?+3SrkHKhD1oguyQZQTIdvdBWM1n3VBzxGuB5NSCFf5+Vqjf8zKxhkI9rfR8w?=
 =?us-ascii?Q?juYnmT+Xp1pZN5UOX5/P+tf4BnriHVhzPXZdw6yVSgGlRFSw0gF413PmoYz/?=
 =?us-ascii?Q?zGAzkLeAcpZ+vc1EwQ6ushfNF2WvSEKUicQs63YNubZQarlsngdnj0340ADK?=
 =?us-ascii?Q?ee3o8mcsMoxpuGGD09BBxrjLPdIXkKZ2XgrdbnbbuA7Yyjg9bReDxEWkBHQh?=
 =?us-ascii?Q?jNltN7NnVFiT/3I9nJrNq6VoYarLbxh4I2tq2a7+eOERGN/54/q15AN6vueP?=
 =?us-ascii?Q?/O5m5ui1ZdgoFVaf4N+3gkfPACLxn2/Y9j/v3yCxswWSm4StkwPI+Gi+u8yP?=
 =?us-ascii?Q?N6CiV3Qv8sB20UOyPTyFaj7eHDtxaBZbZF8fUPn7umufqgIJ1iBnf2+Lzu5o?=
 =?us-ascii?Q?Hq3SYmmmLEyZBsLYPOYa3g4kbEu2V+21iLAHoNSSgm+6LYDCrESykkP95IiU?=
 =?us-ascii?Q?lPaX5+VYS5NTVspLzsYxqxenDZc3iNerC5hbADCOc/rMi3Byj4WrKYHnUrOG?=
 =?us-ascii?Q?MkalAHOinlMpjqi1rb0huU8nxl3t3CUnLZQP47ZWqT4lQbaPHcbIsGZNcCk1?=
 =?us-ascii?Q?J/KBX9Uo0wv5CFmUnC+aVSqoAk1O?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:30.9638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a47b081-4841-42e0-a350-08dc7ebd2abf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8880
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
index 2f6d15060cef..dd0c211ec602 100644
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
2.44.0

