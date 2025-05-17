Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E761ABA703
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624B610EBAF;
	Sat, 17 May 2025 00:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S4A/9k4k";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD12B10EBA8
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7ssWRh64ciz3GX3jh/aZLI+cnJqmzk3Mexyi2kPcIn/TE8EjsErNY0vpnE2fDVWXMuUhfEErU6E5CG2jvd3xyYiwBdnLdl9ivAKdJ5UbRKsuMseMeziyE4FvxIFCK5uKo5Yz+infaZdfAIhKSw5IkA6x95i3oZcJL+JCJTcOfPzamOlGwD84/dzp9EY6y/D5bxryvxE92BZso5A15w6mfvj2OjMtikhnfq9QvndwxbQnO+n/Pj5IJevoObwlWwtsYi0p6KJUPAycLNRUXYSM1D597mN4dSM0wbbN6GbSe20LpNBMxjhcAaMIFzcCYCCAV0iSNe5YOtIdcBbHhkBGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9rMWOiB4u9/Gp2Cq2jhrLjH9hObI86PC5CijixL7WM=;
 b=RJ0U+NnMZ2Tm2/qtfAP/X8p8i9WOAnZIvPqfTLQxDGLkHkHZJCDa/095nL0P1zSU8IIhV2KiAfJlt34guTJAT+rci82EGkdZ4KRuBIZSJZT1g9lSrZZfESiW51GnVVffm55IvdSGXo8/qtCGsBJa5OQR6B1ok1JzpHdKKhiu7NtThgzdREPQzhfdFcGziAtYM8Zcnr/ag/lyIUkV0xwj+04RkOdEDo/y1QSgvVHissUiXQAFRGPpuvkGVpId2PWZvLcKHQajskOWF7txtlgfvtF7vivfdo6usHLFpRVyn5s4zMb6f4o6l85I68umhIuWc4nOIsIzN1q2ekkBxqRDYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9rMWOiB4u9/Gp2Cq2jhrLjH9hObI86PC5CijixL7WM=;
 b=S4A/9k4kTxsy83G+Kw6ScsxbJYgWtQweirT34P7M+gTfjhOyzXx4rGrFfbQCHXP3mQ7CE0HM7Tem//MPS6hOYBGfWNUhMQk+Dr5jOq2x5u1YkMHWkdkLqpRWLAu79/7uXhs6K1RAEqwJLkAP/Qs+KUV/fvFnGTwDHYwOcao+iNH1mwB2Wil8GzIe47KNPjk2tRmDcaJp58uWfRBrrfdoU1kUxWLINaASpZPquIr7tWD4+vOGXys5QzqSTJ5m5HOmvYzQMlgXbaZLcP6JW9SVC2o9OKKCJ4/yPH68rar60lDozCJearZzt4We9P61BOysB0fLt18DcYI4shpCiIUFgg==
Received: from SJ0PR03CA0158.namprd03.prod.outlook.com (2603:10b6:a03:338::13)
 by MW4PR12MB6779.namprd12.prod.outlook.com (2603:10b6:303:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:38 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::65) by SJ0PR03CA0158.outlook.office365.com
 (2603:10b6:a03:338::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sat,
 17 May 2025 00:10:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:22 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 10/62] drm/nouveau/gsp: split device handling out on its own
Date: Sat, 17 May 2025 10:09:02 +1000
Message-ID: <20250517000954.35691-11-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c64a255-902e-4910-c4a4-08dd94d740ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fF+4oEMEq9t2gKp2ZxaYGicPYz+ft2pm3qeZvdC7F9wFpbzXRE2Gg12hYOQk?=
 =?us-ascii?Q?ogEh7piN+uQz4PkRsHT82kZMBsSsbGBHMfKb8sF/rsy3zCNDMVAm9T4xawaD?=
 =?us-ascii?Q?21IVoWiIf5GmyjUdbQ6fPQRwdRXe4/GUfYKcOiBZzebvZl8FXuE54lBIICmh?=
 =?us-ascii?Q?V9svn4ji8EPeCGcXKJAGHS/qAb+0/XQKf6fCT5F2M64Rn0JWLLL42Zg77wkD?=
 =?us-ascii?Q?igDpg0eiEjvB1AxMhx4TAGz7kfHbQAm2I2dYUvMQq+gMp73QnJy8l8oJNa1N?=
 =?us-ascii?Q?uq7p29+9BE3+Mp1Yg1cmnrXOsXVq83pRRd7aYtOGJ9pRdvz70b7zvVAAbDEC?=
 =?us-ascii?Q?rg1Uc75qfgd3k0GgGWm10Iv4wYOA0YDUlOqgxBBrJGy5IK8xU3T8MoQlWfCA?=
 =?us-ascii?Q?ArTZy8+eSlx6ncUIYtt1/3OZbc9VY3qpg/OHnsunQrleOtLbwSoW6nziLrTE?=
 =?us-ascii?Q?VmhZENfy6xtn/tSQzF8UsFL125OgSdaTc0SH8JyzvKX2qLGD2+1+i37QQsEk?=
 =?us-ascii?Q?crGuomkld2f2AlOMyvPca3/fErOf3c5ZFshtOikTPKypQZB/2nr6XfQ1vtOd?=
 =?us-ascii?Q?oJuYwNhy/z6Q70oOugKyqNFOYwHXgJGh8EhKUEWILuzR8c0QDYAuUT+G4Frr?=
 =?us-ascii?Q?nlC2mgGEdabrhZjstWqadhBOI1c2I7yai4gTb0yxA6Rphd+NCmNsZdD5fx5w?=
 =?us-ascii?Q?bd6f15fK6o5o5oe2mzgWtJ2GYG6m8AiJIjooiklrxJndInNquwAhVn7Uk93+?=
 =?us-ascii?Q?hK3xAWAI02igRw7DtjKcFNZX+5sKNyKuPsUWEBMJYWXJIEmLR/FhPyVhlzb1?=
 =?us-ascii?Q?u/GsDMO4VMPVXC8vBXmO2iLXgi+v+1N91qLzSMMV/pBHHwiJMzzbGlyqWNV3?=
 =?us-ascii?Q?R+QLpCo74updcai8lvfVNSOQv8Xiu/6Ww+CC1jjlE/REP1Z+uquuKBWU75qb?=
 =?us-ascii?Q?NPeSt2Zp3DRnK3jrfTiE68YQTA0wwUh4DmMo80zIt56Nnvm2dsPrf2Dtuvc0?=
 =?us-ascii?Q?djCY+wKJUZgaPOoX/BoaL/AmP8rv0WpWHjK656NrixePewviyH86O4gpHsZD?=
 =?us-ascii?Q?3bAaIc4S8qXuwh91rqWKcNTXms8gALnmdhhgLuuOHSHFE21Z931RdClRHRB3?=
 =?us-ascii?Q?c7DAvzEjnyyfJgNKSTeNBxHhzDNMjQCRtP301daq8nbOm1vS3ZTZPKwfrty0?=
 =?us-ascii?Q?xkWA9p8xNLRCK9w2bWt3gjK4yRcYcbW/pbRuz4KsEH7JxnP032FusoKFgw0I?=
 =?us-ascii?Q?pA51NySkUarqLkM1af1zTIaXwWAZGMclLa4Cfc4fc2d4ez3UWmwvnry3itPB?=
 =?us-ascii?Q?bdmlvL8ChdSXbI7GFOlsIo4PG/BIPByrvTO0yWhTOTb4QamD3DvdN2S7zYvQ?=
 =?us-ascii?Q?ytahHw/dYWq3t3GzyO0uQUQbcMk8FW+ylXmQ01FXa5cMp+wA7gxEJp0kCevk?=
 =?us-ascii?Q?k2Em43YbGHzItfMm+T7772/OuGv0L+qf6+hFGplFnI1Kh8MM7Mvq+Y2fvX6O?=
 =?us-ascii?Q?xG0B0AoBzFqBpi0LKNvWPYOVI74BvOekucj0?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:38.3270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c64a255-902e-4910-c4a4-08dd94d740ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779
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

Split handling of NV01_DEVICE (and other related objects) out into its
own module.

Aside from moving the function pointers, no code change is intended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  17 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 127 ---------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |   1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/device.c  | 153 ++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  12 ++
 6 files changed, 173 insertions(+), 138 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 2c3d8fd04516..3fd279be8340 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -211,13 +211,6 @@ struct nvkm_gsp {
 
 	const struct nvkm_gsp_rm {
 		const struct nvkm_rm_api *api;
-
-		int (*device_ctor)(struct nvkm_gsp_client *, struct nvkm_gsp_device *);
-		void (*device_dtor)(struct nvkm_gsp_device *);
-
-		int (*event_ctor)(struct nvkm_gsp_device *, u32 handle, u32 id,
-				  nvkm_gsp_event_func, struct nvkm_gsp_event *);
-		void (*event_dtor)(struct nvkm_gsp_event *);
 	} *rm;
 
 	struct {
@@ -435,14 +428,14 @@ nvkm_gsp_client_dtor(struct nvkm_gsp_client *client)
 static inline int
 nvkm_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
 {
-	return client->gsp->rm->device_ctor(client, device);
+	return client->gsp->rm->api->device->ctor(client, device);
 }
 
 static inline void
 nvkm_gsp_device_dtor(struct nvkm_gsp_device *device)
 {
 	if (device->object.client)
-		device->object.client->gsp->rm->device_dtor(device);
+		device->object.client->gsp->rm->api->device->dtor(device);
 }
 
 static inline int
@@ -474,7 +467,9 @@ static inline int
 nvkm_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
 			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
 {
-	return device->object.client->gsp->rm->event_ctor(device, handle, id, func, event);
+	const struct nvkm_gsp_rm *rm = device->object.client->gsp->rm;
+
+	return rm->api->device->event.ctor(device, handle, id, func, event);
 }
 
 static inline void
@@ -483,7 +478,7 @@ nvkm_gsp_event_dtor(struct nvkm_gsp_event *event)
 	struct nvkm_gsp_device *device = event->device;
 
 	if (device)
-		device->object.client->gsp->rm->event_dtor(event);
+		device->object.client->gsp->rm->api->device->event.dtor(event);
 }
 
 int nvkm_gsp_intr_stall(struct nvkm_gsp *, enum nvkm_subdev_type, int);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index c6fce9541c0e..c292f5a4e1ec 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -33,20 +33,14 @@
 #include <nvfw/fw.h>
 
 #include <nvrm/nvtypes.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080internal.h>
-#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
 #include <nvrm/535.113.01/common/shared/msgq/inc/msgq/msgq_priv.h>
 #include <nvrm/535.113.01/common/uproc/os/common/include/libos_init_args.h>
 #include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_sr_meta.h>
 #include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/gsp/gsp_fw_wpr_meta.h>
 #include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmRiscvUcode.h>
 #include <nvrm/535.113.01/nvidia/arch/nvalloc/common/inc/rmgspseq.h>
-#include <nvrm/535.113.01/nvidia/generated/g_allclasses.h>
 #include <nvrm/535.113.01/nvidia/generated/g_os_nvoc.h>
 #include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
 #include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_fw_heap.h>
@@ -61,130 +55,9 @@
 
 extern struct dentry *nouveau_debugfs_root;
 
-static void
-r535_gsp_event_dtor(struct nvkm_gsp_event *event)
-{
-	struct nvkm_gsp_device *device = event->device;
-	struct nvkm_gsp_client *client = device->object.client;
-	struct nvkm_gsp *gsp = client->gsp;
-
-	mutex_lock(&gsp->client_id.mutex);
-	if (event->func) {
-		list_del(&event->head);
-		event->func = NULL;
-	}
-	mutex_unlock(&gsp->client_id.mutex);
-
-	nvkm_gsp_rm_free(&event->object);
-	event->device = NULL;
-}
-
-static int
-r535_gsp_device_event_get(struct nvkm_gsp_event *event)
-{
-	struct nvkm_gsp_device *device = event->device;
-	NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS *ctrl;
-
-	ctrl = nvkm_gsp_rm_ctrl_get(&device->subdevice,
-				    NV2080_CTRL_CMD_EVENT_SET_NOTIFICATION, sizeof(*ctrl));
-	if (IS_ERR(ctrl))
-		return PTR_ERR(ctrl);
-
-	ctrl->event = event->id;
-	ctrl->action = NV2080_CTRL_EVENT_SET_NOTIFICATION_ACTION_REPEAT;
-	return nvkm_gsp_rm_ctrl_wr(&device->subdevice, ctrl);
-}
-
-static int
-r535_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
-			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
-{
-	struct nvkm_gsp_client *client = device->object.client;
-	struct nvkm_gsp *gsp = client->gsp;
-	NV0005_ALLOC_PARAMETERS *args;
-	int ret;
-
-	args = nvkm_gsp_rm_alloc_get(&device->subdevice, handle,
-				     NV01_EVENT_KERNEL_CALLBACK_EX, sizeof(*args),
-				     &event->object);
-	if (IS_ERR(args))
-		return PTR_ERR(args);
-
-	args->hParentClient = client->object.handle;
-	args->hSrcResource = 0;
-	args->hClass = NV01_EVENT_KERNEL_CALLBACK_EX;
-	args->notifyIndex = NV01_EVENT_CLIENT_RM | id;
-	args->data = NULL;
-
-	ret = nvkm_gsp_rm_alloc_wr(&event->object, args);
-	if (ret)
-		return ret;
-
-	event->device = device;
-	event->id = id;
-
-	ret = r535_gsp_device_event_get(event);
-	if (ret) {
-		nvkm_gsp_event_dtor(event);
-		return ret;
-	}
-
-	mutex_lock(&gsp->client_id.mutex);
-	event->func = func;
-	list_add(&event->head, &client->events);
-	mutex_unlock(&gsp->client_id.mutex);
-	return 0;
-}
-
-static void
-r535_gsp_device_dtor(struct nvkm_gsp_device *device)
-{
-	nvkm_gsp_rm_free(&device->subdevice);
-	nvkm_gsp_rm_free(&device->object);
-}
-
-static int
-r535_gsp_subdevice_ctor(struct nvkm_gsp_device *device)
-{
-	NV2080_ALLOC_PARAMETERS *args;
-
-	return nvkm_gsp_rm_alloc(&device->object, 0x5d1d0000, NV20_SUBDEVICE_0, sizeof(*args),
-				 &device->subdevice);
-}
-
-static int
-r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
-{
-	NV0080_ALLOC_PARAMETERS *args;
-	int ret;
-
-	args = nvkm_gsp_rm_alloc_get(&client->object, 0xde1d0000, NV01_DEVICE_0, sizeof(*args),
-				     &device->object);
-	if (IS_ERR(args))
-		return PTR_ERR(args);
-
-	args->hClientShare = client->object.handle;
-
-	ret = nvkm_gsp_rm_alloc_wr(&device->object, args);
-	if (ret)
-		return ret;
-
-	ret = r535_gsp_subdevice_ctor(device);
-	if (ret)
-		nvkm_gsp_rm_free(&device->object);
-
-	return ret;
-}
-
 const struct nvkm_gsp_rm
 r535_gsp_rm = {
 	.api = &r535_rm,
-
-	.device_ctor = r535_gsp_device_ctor,
-	.device_dtor = r535_gsp_device_dtor,
-
-	.event_ctor = r535_gsp_device_event_ctor,
-	.event_dtor = r535_gsp_event_dtor,
 };
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
index f25b438fa3d9..d50f2c351d93 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -7,3 +7,4 @@ nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/ctrl.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/alloc.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/client.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/device.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
new file mode 100644
index 000000000000..09173ca1c050
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
@@ -0,0 +1,153 @@
+/*
+ * Copyright 2023 Red Hat Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rm.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0005.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl0080.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl2080.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080event.h>
+#include <nvrm/535.113.01/common/sdk/nvidia/inc/nvos.h>
+#include <nvrm/535.113.01/nvidia/generated/g_allclasses.h>
+
+static void
+r535_gsp_event_dtor(struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_device *device = event->device;
+	struct nvkm_gsp_client *client = device->object.client;
+	struct nvkm_gsp *gsp = client->gsp;
+
+	mutex_lock(&gsp->client_id.mutex);
+	if (event->func) {
+		list_del(&event->head);
+		event->func = NULL;
+	}
+	mutex_unlock(&gsp->client_id.mutex);
+
+	nvkm_gsp_rm_free(&event->object);
+	event->device = NULL;
+}
+
+static int
+r535_gsp_device_event_get(struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_device *device = event->device;
+	NV2080_CTRL_EVENT_SET_NOTIFICATION_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&device->subdevice,
+				    NV2080_CTRL_CMD_EVENT_SET_NOTIFICATION, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->event = event->id;
+	ctrl->action = NV2080_CTRL_EVENT_SET_NOTIFICATION_ACTION_REPEAT;
+	return nvkm_gsp_rm_ctrl_wr(&device->subdevice, ctrl);
+}
+
+static int
+r535_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
+			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
+{
+	struct nvkm_gsp_client *client = device->object.client;
+	struct nvkm_gsp *gsp = client->gsp;
+	NV0005_ALLOC_PARAMETERS *args;
+	int ret;
+
+	args = nvkm_gsp_rm_alloc_get(&device->subdevice, handle,
+				     NV01_EVENT_KERNEL_CALLBACK_EX, sizeof(*args),
+				     &event->object);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->hParentClient = client->object.handle;
+	args->hSrcResource = 0;
+	args->hClass = NV01_EVENT_KERNEL_CALLBACK_EX;
+	args->notifyIndex = NV01_EVENT_CLIENT_RM | id;
+	args->data = NULL;
+
+	ret = nvkm_gsp_rm_alloc_wr(&event->object, args);
+	if (ret)
+		return ret;
+
+	event->device = device;
+	event->id = id;
+
+	ret = r535_gsp_device_event_get(event);
+	if (ret) {
+		nvkm_gsp_event_dtor(event);
+		return ret;
+	}
+
+	mutex_lock(&gsp->client_id.mutex);
+	event->func = func;
+	list_add(&event->head, &client->events);
+	mutex_unlock(&gsp->client_id.mutex);
+	return 0;
+}
+
+static void
+r535_gsp_device_dtor(struct nvkm_gsp_device *device)
+{
+	nvkm_gsp_rm_free(&device->subdevice);
+	nvkm_gsp_rm_free(&device->object);
+}
+
+static int
+r535_gsp_subdevice_ctor(struct nvkm_gsp_device *device)
+{
+	NV2080_ALLOC_PARAMETERS *args;
+
+	return nvkm_gsp_rm_alloc(&device->object, 0x5d1d0000, NV20_SUBDEVICE_0, sizeof(*args),
+				 &device->subdevice);
+}
+
+static int
+r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *device)
+{
+	NV0080_ALLOC_PARAMETERS *args;
+	int ret;
+
+	args = nvkm_gsp_rm_alloc_get(&client->object, 0xde1d0000, NV01_DEVICE_0, sizeof(*args),
+				     &device->object);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->hClientShare = client->object.handle;
+
+	ret = nvkm_gsp_rm_alloc_wr(&device->object, args);
+	if (ret)
+		return ret;
+
+	ret = r535_gsp_subdevice_ctor(device);
+	if (ret)
+		nvkm_gsp_rm_free(&device->object);
+
+	return ret;
+}
+
+const struct nvkm_rm_api_device
+r535_device = {
+	.ctor = r535_gsp_device_ctor,
+	.dtor = r535_gsp_device_dtor,
+	.event.ctor = r535_gsp_device_event_ctor,
+	.event.dtor = r535_gsp_event_dtor,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index dba1d2058b37..39cc3d0c740c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -10,4 +10,5 @@ r535_rm = {
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
 	.client = &r535_client,
+	.device = &r535_device,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index c3341631fbd5..20841305fa55 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -32,6 +32,17 @@ struct nvkm_rm_api {
 		int (*ctor)(struct nvkm_gsp *, struct nvkm_gsp_client *);
 		void (*dtor)(struct nvkm_gsp_client *);
 	} *client;
+
+	const struct nvkm_rm_api_device {
+		int (*ctor)(struct nvkm_gsp_client *, struct nvkm_gsp_device *);
+		void (*dtor)(struct nvkm_gsp_device *);
+
+		struct {
+			int (*ctor)(struct nvkm_gsp_device *, u32 handle, u32 id,
+				    nvkm_gsp_event_func, struct nvkm_gsp_event *);
+			void (*dtor)(struct nvkm_gsp_event *);
+		} event;
+	} *device;
 };
 
 extern const struct nvkm_rm_api r535_rm;
@@ -39,4 +50,5 @@ extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
+extern const struct nvkm_rm_api_device r535_device;
 #endif
-- 
2.49.0

