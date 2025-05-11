Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051EDAB2B57
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C3410E1FC;
	Sun, 11 May 2025 21:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FGRTtToB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B02C10E1B9
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moYOfAvbDPM6d66m3IUQEsVaDTqcUemRtJDqYLRcwlYeKl/CtQp9fKjf3btPvukmK85bAkMLy/VmxETP5pr2fSNMwESq5HBqKm4lKo02Z8lUx5P82OgWJYeeUerF7HaL4bSJkyzbREL+vCDgUUKNNXGXeN3D+ID9vA+91mMWG9lPALIu5n6yKt/3W7Hyd8UaGQlMkWFNks96/i2dyiXgqX+VqUSGQxedphueqX0HlqkcBi5fGwzL7l4u/Eqe4+86gFOUmFjzrTqR0dcmGBAJctbCUEzHnQgl/ylx9LSrBVr5uaSx6D+DV7OfkrTL/XLBgshd8TOymBYcuRgTfcmNwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dS1PuDkBuPoMs1HY0MfCm+YoWScVs+BjcRNuutvg9iE=;
 b=VhgCIwbKyX3uldxD5iirOG0/PVvzuhiy3E+S3Fk1RzRX4KNUhbbEKb4u67JFaE5/McBD2LH1U9jXef9879XOrEAQ8CxfFFt5lxyzf7pqjz1nPivyA2A3zb//ve6LPVaO9LGtD8gd372uW7mdajdUcXqOidCvuAX0hJa1jVRvZdpllGyamvCuNaQTk8Lt4v7iOYsnYbMEZzdHCIWJW2SG+/mnytSRBW8D3ZgPinoFVuW8q9rx0frVvDhfk8GF6IMm8rPnFfwu5psjJ4NxIv38B1O9ZW2UiVnjFz2uoDAM4IUnm2h/Bqo20kkrbtUnRggh92PSjRQW8iFdCjd1H+voSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dS1PuDkBuPoMs1HY0MfCm+YoWScVs+BjcRNuutvg9iE=;
 b=FGRTtToBM9XOrxgRbhf+16CHo/EcBu5csyaRkVku4+j3eLA+geKMbzqo169ak/GBwln6YJPMQ4/BZJjIk04WOpM0DCBoiNe4Z9O/WI18JhXh1E+QSqWTIcIoR5FYxifFkhNojalDV9H32KjCF75uQq1vf+XXMwMyn+9ZClafSJ+7whDI8psxxzBN8Li8LFjyxRq/M41LpZHdcI7AH0kla1okfxQ89e79rS4Sc/I3jXO5NnQ5DMDZI8I7r56Y/P5/Gi5DmOuifjEfmTUdnDC4MsI1uF1N1N2iC9om3EhhF40stQ9qR2JMZW/LFKfXVz0wfot7GGWIrNt5c9xU4CKcPA==
Received: from DM5PR07CA0107.namprd07.prod.outlook.com (2603:10b6:4:ae::36) by
 CY3PR12MB9579.namprd12.prod.outlook.com (2603:10b6:930:10a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.27; Sun, 11 May 2025 21:08:39 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::be) by DM5PR07CA0107.outlook.office365.com
 (2603:10b6:4:ae::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:08:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:34 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 19/62] drm/nouveau/gsp: add defines for rmapi object handles
Date: Mon, 12 May 2025 07:06:39 +1000
Message-ID: <20250511210722.80350-20-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CY3PR12MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 31861c41-8eab-4bf8-48f2-08dd90d000cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gqJcOYePQUK3IX6UcGvHMB4QQHSIXb8znWwd8yaTXvJBFC00cxd533/bzpT1?=
 =?us-ascii?Q?zbCSQZN38zRGb61axeq8JjTWH8cF61fX5oED0AcL6gaPHQgAQXaFLAudXvn1?=
 =?us-ascii?Q?zBXp88p8H1yJmEJ7U807IhPKkrCytpzAu++gcjeN5WquEhp+6dto0MfNht+V?=
 =?us-ascii?Q?lyLHFAUov7/1qt/fiZT5HZzKhevKhhVgwNbIDdhStqjnQITSD15ytLVnzDbg?=
 =?us-ascii?Q?6ggGHm4R3AcaoEtrugEkVkS2GEVXQ95B9ua1IYbLjOdXA5ZgDCLhvGXDe0Xk?=
 =?us-ascii?Q?t0r3/JsejtkvUbU51btFt3Bhy43lthE+eLThJBb0bJb3G9sNPrRbgq5eKG1V?=
 =?us-ascii?Q?HeHs4BsvCXfCf/NbWPzdOE5FdCzHlkyUiQ9r6kk+347H9aYkD+B8eSAQoq2X?=
 =?us-ascii?Q?1qq6WipTAz5iDAe3PEYpdZz//X4ROddnwTFloUgw2h8PQXtYiGknpWL2JgkO?=
 =?us-ascii?Q?c+t/CQq2YH9jx39WT73NXBFaK4pFQZ/Aj5gdIseX9NBqSJ8M9Prn3rt2sEW6?=
 =?us-ascii?Q?YvDtfuJslDIye9yPi72QNB3lbzc/NKKxfGaaZAu3o4TYuJuh6Fy2rmnquvqR?=
 =?us-ascii?Q?x9vF4JqU+Qzn1Y/bghj6QE+zVtuAygZ4xSF8C03VAaBvPT0O5SzrzQtbTCNB?=
 =?us-ascii?Q?zJFUDgvD9oBCTb0R234OuOsGvv2NJks5hrUObB4J+WXAjet4jYuzlo/7Erlb?=
 =?us-ascii?Q?XOgDxIZy3VnMHCEJMO8mOakYS45EmPVPfEM9hohZ3Vf5pG++qVXtigDFs34X?=
 =?us-ascii?Q?AwY7XhYWYXjc564xQlpyfLvxf+4KMVyRBMWIJPl/rxc0/hLGXSLwGQXHS1fn?=
 =?us-ascii?Q?81AvtSieKU10MVk4ukpTIznbB1xs/GUS7O5SAc3TTAa+ORSzSifmMBuikj0T?=
 =?us-ascii?Q?2Q99avtdZuoJJKrk9q8UeidEBP6r3e65tgjAqjF5gZ7ogFo1RK44TFw03jDs?=
 =?us-ascii?Q?/B0H7yxdEJF2hGD1reDG040pezG8Uob4hebtEGleqB180lCI3Jc91owXGBcA?=
 =?us-ascii?Q?TIhuuydSf34hWA9Vocv2u6FCZuYNfD7dNHC4DMdSLC6JERDnLyxZBYzOOd5O?=
 =?us-ascii?Q?7LV5B5ixfDzFGaEEt3J+NfN23qk8t/8PIsKCm7feY6ZdaUFgzJhPYjl1rtmp?=
 =?us-ascii?Q?sME/B1zuyF91TAnA9IqNad+NB1tkGnp7p2d47s42mF0AeOy2TTm0XiHTJbqo?=
 =?us-ascii?Q?Tq+n7soMMeqoYxdXVCj0bOnB6lvXi2KgssGag/T9HVxVXFnt6hW3v/St68Z5?=
 =?us-ascii?Q?DU6eimYGDpOTRkZLrep/uVTmvR2vVgFpIez4J2i21kUfNWLcVzq/lyzDF0Rw?=
 =?us-ascii?Q?sSGuHxbLGwz4WTpOnm2a+q3xFMtIyBuTmOakrJV8ABrjA6NaaAztsQGqgvwv?=
 =?us-ascii?Q?Ex3Tkaim0tEEE3nJaeaOQWpvNQWYo3jWXNUioiZTbpr2evAc1yDwFx6pK4va?=
 =?us-ascii?Q?oZFgyqHOW0qDpMGYTu+qKJO94Tk/cuQ36/kDD/kW+Wfk3zfW+tTF1zKi+HxR?=
 =?us-ascii?Q?0iGh5iU2CHP2FL0EylsBmymmSK3ZHEKhOfRc?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:39.6174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31861c41-8eab-4bf8-48f2-08dd90d000cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9579
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

Add header containing defines for RMAPI handles used by NVKM, and
use them in place of magic values when calling RM_ALLOC.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/handles.h    | 17 +++++++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r535/client.c    |  2 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/device.c    |  6 +++---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c  |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c  |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c    |  4 ++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h |  1 +
 8 files changed, 27 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
new file mode 100644
index 000000000000..50f2f2a86b5a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_HANDLES_H__
+#define __NVKM_RM_HANDLES_H__
+
+/* RMAPI handles for various objects allocated from GSP-RM with RM_ALLOC. */
+
+#define NVKM_RM_CLIENT(id)         (0xc1d00000 | (id))
+#define NVKM_RM_DEVICE              0xde1d0000
+#define NVKM_RM_SUBDEVICE           0x5d1d0000
+#define NVKM_RM_DISP                0x00730000
+#define NVKM_RM_VASPACE             0x90f10000
+#define NVKM_RM_CHAN(chid)         (0xf1f00000 | (chid))
+#define NVKM_RM_THREED              0x97000000
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
index c0146c00584d..449338da1795 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
@@ -53,7 +53,7 @@ r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
 	client->object.client = client;
 	INIT_LIST_HEAD(&client->events);
 
-	args = nvkm_gsp_rm_alloc_get(&client->object, 0xc1d00000 | ret, NV01_ROOT, sizeof(*args),
+	args = nvkm_gsp_rm_alloc_get(&client->object, NVKM_RM_CLIENT(ret), NV01_ROOT, sizeof(*args),
 				     &client->object);
 	if (IS_ERR(args)) {
 		r535_gsp_client_dtor(client);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
index 094abf7b5f97..f830e12a8f6e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
@@ -111,8 +111,8 @@ r535_gsp_subdevice_ctor(struct nvkm_gsp_device *device)
 {
 	NV2080_ALLOC_PARAMETERS *args;
 
-	return nvkm_gsp_rm_alloc(&device->object, 0x5d1d0000, NV20_SUBDEVICE_0, sizeof(*args),
-				 &device->subdevice);
+	return nvkm_gsp_rm_alloc(&device->object, NVKM_RM_SUBDEVICE, NV20_SUBDEVICE_0,
+				 sizeof(*args), &device->subdevice);
 }
 
 static int
@@ -121,7 +121,7 @@ r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *dev
 	NV0080_ALLOC_PARAMETERS *args;
 	int ret;
 
-	args = nvkm_gsp_rm_alloc_get(&client->object, 0xde1d0000, NV01_DEVICE_0, sizeof(*args),
+	args = nvkm_gsp_rm_alloc_get(&client->object, NVKM_RM_DEVICE, NV01_DEVICE_0, sizeof(*args),
 				     &device->object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index e65f9074e94f..1ba86e223978 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1468,7 +1468,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, 0x00730000, NV04_DISPLAY_COMMON, 0,
+	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, NVKM_RM_DISP, NV04_DISPLAY_COMMON, 0,
 				&disp->rm.objcom);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index eb1531c3eabd..4353cd70811a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -101,7 +101,7 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	if (!chan->rm.mthdbuf.ptr)
 		return -ENOMEM;
 
-	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, 0xf1f00000 | chan->id,
+	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, NVKM_RM_CHAN(chan->id),
 				     fifo->func->chan.user.oclass, sizeof(*args),
 				     &chan->rm.object);
 	if (WARN_ON(IS_ERR(args)))
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 3618fa36040c..4c0df52e8683 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -205,7 +205,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	{
 		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
 
-		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, 0xf1f00000,
+		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, NVKM_RM_CHAN(0),
 					     device->fifo->func->chan.user.oclass,
 					     sizeof(*args), &golden.chan);
 		if (IS_ERR(args)) {
@@ -358,7 +358,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 		goto done;
 
 	/* Allocate 3D class on channel to trigger golden context init in RM. */
-	ret = nvkm_gsp_rm_alloc(&golden.chan, 0x97000000, rm->gpu->gr.class.threed, 0, &threed);
+	ret = nvkm_gsp_rm_alloc(&golden.chan, NVKM_RM_THREED, rm->gpu->gr.class.threed, 0, &threed);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index c697885c65d3..99af6c19a9a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -34,7 +34,7 @@ r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 	if (ret)
 		return ret;
 
-	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, 0x90f10000, FERMI_VASPACE_A,
+	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, NVKM_RM_VASPACE, FERMI_VASPACE_A,
 				     sizeof(*args), &vmm->rm.object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index bda22703690a..4d9e5ea3b2fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -5,6 +5,7 @@
 #include <subdev/gsp.h>
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
+#include "handles.h"
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_api *api;
-- 
2.49.0

