Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A596BAB2B4E
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7671510E0F2;
	Sun, 11 May 2025 21:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CRNgGcDt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5960D10E0DE
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aG8eE98HByqKmhC6lElBc6i47g0QnWr9kPYJjP3KSVsI4UGO1FvOJxP8uh4F22rfjWqFZpxGpWrxRvxQjrV7DuOTVS6GV3AeIXWgu+Br+F8pxQdYEYyn3711HtIScS24ZgxMarK+Gp/0ZeBDOOjT6ZCiHOzcZIp+Va2W2PO8gy4lWcsCCRoGuflApZLkGlTrbHnlizxq4C623voBbLJSZZotxu9qwjaSwpktvNseUQl/b/XqZK0spmxHnpVNO0Wf2VVU+cZV+k4v+hGnzvosYsAkou+pko4bLcJPlkd7HrcgAswPrNFCRWEMujIF+HPxtxpxvE5EzhiUn8AVxfzFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuLE+93cuC5gGn4BqULiMNtem1amk9/Us0RglWq8lks=;
 b=nMuZnK0xicQ+zSaZUJAADJ8vxIt38NGFJ1TeG7X9u6ai2UJj5tjYFpPeh8CzMHQ/B/kXiv5lKlQYtH9t20PPyaONALU0EVyiHVuTt/YPF+NHeSygxoMNJwzRcsj+Na1fsVw6wUGHnDD2U3JrLBlfXOl8WM+drR9zWK3rYZZi2aoJGsCc9IEnLXWhOUE7P5tVUG7NQG9zC7VJOIBGE+28NkZqtWYOp0LknZzwNeMQ2uk7B7QbvSsq4O32vrP4MU4k54PiYNM/IPoMsn1mkrJDIpIkPnDh1Gmc8mgHkW0JJ0u193Csm7PQIi8wyg9WMBmsvuiUB9N4nEL4D2v8PY2buA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuLE+93cuC5gGn4BqULiMNtem1amk9/Us0RglWq8lks=;
 b=CRNgGcDtKMuApkgGsDiE/07bal2tYfo1BRQgB97eYW1a8FTPj6hun96IM15bEB5bZGm6+GFpS3VJd+zxOCHbGuP+ap5gZznJZYb38i6PQ50H7Kj4tYWLfZMHkQBkEGbMl1flMcZeLM4r+gpjMnF0QyuAdG7NUfdbKorIChV4u+2UN/lzl6hCvWUhQ9mopz4v9GzQNsXcq6nuZ8bHbJvHkLKVQ/AVpMbcLiedizYAL4SohRu/Z5OPE7mu1wFyZiJ4cAV0GNq1aPSz3xe9/8blr063DWSnN/lUgELgs0kMjESNls4gerp1IHtal0k6JTkjg6F3WTL23o7+hJeHtvFO0A==
Received: from DM5PR07CA0082.namprd07.prod.outlook.com (2603:10b6:4:ad::47) by
 IA0PR12MB7674.namprd12.prod.outlook.com (2603:10b6:208:434::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:08:22 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::71) by DM5PR07CA0082.outlook.office365.com
 (2603:10b6:4:ad::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:08:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:16 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 09/62] drm/nouveau/gsp: split device handling out on its own
Date: Mon, 12 May 2025 07:06:29 +1000
Message-ID: <20250511210722.80350-10-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|IA0PR12MB7674:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eb4b1b7-e3f4-4604-1d58-08dd90cff664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I0uQ+bzULsX6yT8XPa6FznBUNXd7D+r/XOj3jcY0nqv+uIFAhs8HcVAugcT3?=
 =?us-ascii?Q?YMHObn0I6P5lOe21k2INLcPWMekYLHQOB6VsQerZkduCbhOR1frJA3qNAuFQ?=
 =?us-ascii?Q?RzX5cCdtilJ/BO+SMlwnMBgte0Pa61jkyXO+RZwPwZ9+pJ9rtEXQi0i7jFRS?=
 =?us-ascii?Q?I8FveEvfZFJ0llz6nG3vEqxOOZA07kfQeX4yXuSu+Mp0jXFJkh6Pi0aK+nQM?=
 =?us-ascii?Q?oZ9L0gmiKB7LI0cQhrputZAZbC9zYoJ697+95OF//+b4aUoBLUz5HUwuC85m?=
 =?us-ascii?Q?uUyRKDWnehhnMfwmFQCOh19UDJzLLFRzpC7HcXj/W3kxD4yVzaI8UEKMullG?=
 =?us-ascii?Q?TFOwdJyC3hDYCVzsEUMi55BWa9uTmNp8BSZQNKgi/dveEnznI9tHCiPtDw1M?=
 =?us-ascii?Q?v//pMUP85DKDWVRQMm+7aHu8WmGV6Y3qGL6tbzJ8GoL+8SjOZ6rJHwuvNibe?=
 =?us-ascii?Q?w+A5HnsZxEk26cHD62zpsgRLaK11aoawmvi4vJq55SzpsAPfipwFcW31D4jt?=
 =?us-ascii?Q?yL/hZkNQwC9YbZzjRkAlKU47Fewsh6FAH3B6IokP6iz8Nevz8xkYMiz3r1T5?=
 =?us-ascii?Q?VOnywKJI1PQKBxdg5/Kmwwc6kXQdqMHBGCofzZO9CSlBPK/fZkjau76vFMQU?=
 =?us-ascii?Q?8u+6M49CjY/LNjl5Jo87qluMmFajRONyMBZJhHD1YtvJktCu0siICbkmdN3x?=
 =?us-ascii?Q?XbKrzTR50LGpKMElB61jeGSoiLkbwEaxQ149td46NqUO2CqgOUBYiUSgA8ez?=
 =?us-ascii?Q?MjERQU+3TWZ/Ft780cGvQBAJOxUcX1RNlMw6sprGNPM2WIl4zHSTqEQGFLbT?=
 =?us-ascii?Q?RbCza33ZtXYDcnSaouXE0eNB5zlJy3Qw8LHfgXc6+Ffd1/A3mRvVVEcqDoyo?=
 =?us-ascii?Q?tqcZ4LkhczbL0p6r4VGLCT+j8K46CeNe8uKPH8fEXb6xcAbJemuM6zbKy8gV?=
 =?us-ascii?Q?G4Hu3p65bmzMqHNPm2ZZ0CRC6QigcPaPiGl4IUTVZRd7VVjGbFT7a22tsGny?=
 =?us-ascii?Q?gNUL2D4Q9j/WhqWYEramzRCa36pY3PtasK/H57oFNd0faXtdRGvRtyHEh37M?=
 =?us-ascii?Q?Exm19+yWzGHWNn0KlaVOQbsFl6eYn5CmEXuYT0Z1H+Re5IWY++CKrz05ofQ/?=
 =?us-ascii?Q?hf/6lAvoa+XGpm4Qr0XMxHfDT9u+tN++G641Kcypt3wQrL9IY30Hv5cnvg63?=
 =?us-ascii?Q?2cHBDeufaEHRQZx5CnRCqlfkHqbyeomx8fWEZ+vy8a8c+Sl81N64l59OVwuc?=
 =?us-ascii?Q?L6sBUv55tEAW53nq349JtG+Fb70hXB6Pawvh3NsFCh46QKR7xYPrQfkV3iW4?=
 =?us-ascii?Q?6M2oNtyml8rUWMjw+cYtv1t1qByQFd1+t+P9f8rWd3EggR61o3q6Bi0gVZMz?=
 =?us-ascii?Q?Wui4PuYbMnhfrOy5YlbXpQZwNbKWyUq1Hpdv1yZTb2nWgpjKAt61Sd0pt+f/?=
 =?us-ascii?Q?6KmOhxK7rC2Zzjt+XL+lyx7k+g15Wqs7+AJj3zGtmyBWOBieL/szlIoRr6Pw?=
 =?us-ascii?Q?C8tDoxlvPnxnHd8aiB7KvFTivdKaufoUyBjx?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:22.1433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb4b1b7-e3f4-4604-1d58-08dd90cff664
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7674
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

