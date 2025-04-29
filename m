Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C726AA3C76
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210C210E54A;
	Tue, 29 Apr 2025 23:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aeR8Y22N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFD710E556
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D51aXwr6f/S95ykpoWK3/J29t149hYxJqoCe2pBNFM8YfAXpIYjZwSpqnb5+9IIbQSuUka1bX6NauJJOuCX5iSnmUSejKPUP7HGb00APkQas2ZQAb/FStOQQ+YoBKp4iC/TH6WMOgEqKn8BSa3kUHAC+aKBHo8DTXaS+0xHR+qliAwNt59oCrC5OA3gcCeuGXWl1hX5FWN7JR5D9DtMDU/45W28W7dJQb+j9uIzLP1L5J/LZGPSj54fVGa6ErfT4gPtcqgxMl1q8KIryocNdNyJ9zx1QwpexD92T1ZfoPT+p4ty//dDXPf3kPTIhnOwFkIASyXxElabQgv6JQTd+MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cTpX4rO7suhr4smbWv9q+7vZd14hnUYKUYvI2atq9M=;
 b=s8DOfaxjb47vqFU0PhU8qErKJ3t5ilzPl1EP6dHdwRWARq07Vr9Dwsrobq5y+7qOiKW7aKXub8aOgEso/isbFriwbWLpuGCKTPhNMJUapDN7pfukxyz9q5OWhfvXfMkr1agyWAEYBoGr+g9dyvmm4mX2j1HoZy/yFDEgDhF+3NqkDlkYUw6Vo0xfXgh71iNP/3IULjawykBszT3MxaRNpkwnUt9qctem+n6eTPgWPVOo61x7qrj5h01pxTvZYPEo2o5zAOtdewKMwGpY44lF4DvFyLz6vrZsAk0QKjaq64aqkPFolnADpb5hi4NHLXfw7GYejOEu/8tOF+Ehk3ckWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cTpX4rO7suhr4smbWv9q+7vZd14hnUYKUYvI2atq9M=;
 b=aeR8Y22NLozYj5RPdjD+1Nx1Yi72jt10Xxxd4YnyWAEqvzf+jgi4JC6G7C48S1uOa1joBzqXsRrb8lTZ2eQg25RApjnM2J3OJIPk/R9Cje9a0fzp+TdPzw6EfLLOERC+TLBUI97Xt1YhfbKJ3pH66W/7Nz0mbgNAfdXGoG/Y7XECrOfwAUEztHKp9RRIZf09x/Morn33+Uv0F186/kuVXJd20Bj7MWlNlSBNL6RGFSIe9832KJSmFkTp8f/EDlgHXSuE4jyxDrKsovY0e/dvjXRpUCMft/Ij+3h3v/V8nwa1pi/5XnjUT+nKRQZ2Mf5yntUS0/0KAXJJr8fpYkoYzA==
Received: from MW3PR06CA0023.namprd06.prod.outlook.com (2603:10b6:303:2a::28)
 by DS7PR12MB8417.namprd12.prod.outlook.com (2603:10b6:8:eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Tue, 29 Apr
 2025 23:40:03 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::a9) by MW3PR06CA0023.outlook.office365.com
 (2603:10b6:303:2a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:50 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:49 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 09/60] drm/nouveau/gsp: split device handling out on its own
Date: Wed, 30 Apr 2025 09:38:37 +1000
Message-ID: <20250429233929.24363-10-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|DS7PR12MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: e4782d98-cfc2-44f9-71c9-08dd877729ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bns6JkMWwsnMFcICqLC5VLdct0TFh84I2OIA+qZ1Vn46dfby8u5haHoPJR+X?=
 =?us-ascii?Q?ft7WghQNqfGgdOcj+TCx8jiFgFRbCB2e1kL2ujypaD+Uk7zhk+sxqVenuR76?=
 =?us-ascii?Q?25w/0w+0batnhCH7WpcmbYuZAPEiGWNlZ3qj6Rea/lfCCayuy5eNY60jtSTI?=
 =?us-ascii?Q?iaX4GIPUPrztR0o9B5ydtn5Bd8Bkb8IZ6TFwucoo/Sm48HjJYaMKgf9B94rU?=
 =?us-ascii?Q?8NaVP8j2Iy2vUgBpl4vPyyAbcsG+hmQwklTx9RtRhrouTNPMe9CUlKb1QOeX?=
 =?us-ascii?Q?kHJs5iYm1XA0YjmmJdw/m7dxMmFGBJc4RP2wPPrXA1vsbQy6RvpyVMRbL9wf?=
 =?us-ascii?Q?eQZ/3vtYHImsqdDnkkBeRULIRTiMwzZkmuSgJUsxUKV35oy1UE/gmRSjOFeM?=
 =?us-ascii?Q?oSh54O4YXBD+CQwe+Y6INaONcwJS1j/DelED1wIL8ee/2FHqv/EWZ88ScjFQ?=
 =?us-ascii?Q?8EEct2F5rTjFN/TiRqKOLkVc1NZ9lASs0qX88OON8LmIV+18DFdA3CG8OtKZ?=
 =?us-ascii?Q?wfKy1NAfd9TIdUl56fhU4p6v2oLILmbAk1aO7cei7em4HE2pbzl21TP3xTRZ?=
 =?us-ascii?Q?CmJVrLn6zzLEFl+EA13XoXVx8w+B2ubSznpWWJrZp87mFRwW/4AuPQg1wNxG?=
 =?us-ascii?Q?Jo2js/SRfRJBFe5wofiwcZgTlSE1NTtBx3KHJJUslw7snup+o35x8uBmK6iN?=
 =?us-ascii?Q?Nlc/Cd8+MMcXSdFs7gu0GY87tfiZAqrRxq73K3Ux9VQaNmiwXcIuTrkgrHmb?=
 =?us-ascii?Q?0acZQopIv1jIjzHzGrIYkfKwIezXTMNnux16iuF2JcQapY6n8RA3WkiQ/rv4?=
 =?us-ascii?Q?l/svuSolFLhaG49BuM+T+Rh/WsWpMc85ThfAWl71EcULVKt4yrycflstkIIk?=
 =?us-ascii?Q?63y4pYNvI7zrUDbRhV5d0CadnPkDVhXJCKPsj2A744eqTRGrjO5I7QWyLx6q?=
 =?us-ascii?Q?AscsweisieTbs5TvQgKd/DL5e7z6AhT4yyFtiiM1lyy2OOY+QXjPstPVKMAK?=
 =?us-ascii?Q?rCHd/ok+i72cu7DnnriiHzFTHmnmMtMr2+DOx928eCULhiouuSJKb1EC5ywr?=
 =?us-ascii?Q?xwFJOAlSdxcTgLvtlx3nlu5DpEJnlhQNxwf0iVkkkwMXhEI1yohnvyOKeWc0?=
 =?us-ascii?Q?OskA1SjMYEa3H1ElKtio1cME/di2zEGGDJ/l28ROCb29QAzGr0vuOcWSt9rM?=
 =?us-ascii?Q?tdZqXc2bVRXEK3zQtuOYNagn7bQN/GYp2eumGxzdaQR27Y7jRFbZU/6LkKQp?=
 =?us-ascii?Q?Gr8Q3NCk4td4NyU7rvOe2dn6e4FBRm+Z8QLdwfablyaY2luW1cNRcLDCYqws?=
 =?us-ascii?Q?vT5mUKOl3ef8lKU1yfTMncKlAXkcjY04Z/WNLuk1gxLoW20PTysED5qbqdA/?=
 =?us-ascii?Q?d+1q3cyeToAPU5W+F9qJZPS+4CTbugN60H07S1Gs6rcDQDgwTlJtVyNbkZ8e?=
 =?us-ascii?Q?a0DpMlCrxCfMxA01E1wUoBnDoX/spJIkOY6s+v8EzFHFruDtn0aVJQdhitcQ?=
 =?us-ascii?Q?qdkTOV9q0gwwLUNMxFbZhYDR05xLuhmJwUVH?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:02.5580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4782d98-cfc2-44f9-71c9-08dd877729ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8417
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
index 59ebde1f23c3..0d573ac48502 100644
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
@@ -432,14 +425,14 @@ nvkm_gsp_client_dtor(struct nvkm_gsp_client *client)
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
@@ -471,7 +464,9 @@ static inline int
 nvkm_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
 			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
 {
-	return device->object.client->gsp->rm->event_ctor(device, handle, id, func, event);
+	const struct nvkm_gsp_rm *rm = device->object.client->gsp->rm;
+
+	return rm->api->device->event.ctor(device, handle, id, func, event);
 }
 
 static inline void
@@ -480,7 +475,7 @@ nvkm_gsp_event_dtor(struct nvkm_gsp_event *event)
 	struct nvkm_gsp_device *device = event->device;
 
 	if (device)
-		device->object.client->gsp->rm->event_dtor(event);
+		device->object.client->gsp->rm->api->device->event.dtor(event);
 }
 
 int nvkm_gsp_intr_stall(struct nvkm_gsp *, enum nvkm_subdev_type, int);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index e78b7d041eac..71cdc67e9a9d 100644
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
index 6ab86f96408f..64982d523901 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -27,4 +27,5 @@ r535_rm = {
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

