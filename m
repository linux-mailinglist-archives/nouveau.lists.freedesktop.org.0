Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8158AB2B58
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9759810E16F;
	Sun, 11 May 2025 21:08:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sV2n3gta";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FCE10E16F
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPSaUdnpHqWozTRUZe0L+TVqDRU9WPxqIHPqcnB3QKyqjyKtYlYJX1ERMfVmQaNUMl+c20eEpkqRcdqNcxJ09bWptbjYwENBvYIEVLkiVLPhu+tHdw9u/m/fQ6aokft2238YHGiuCrEyfSO8XxmDL6LsT3Qt7FEq/leL8cO+y+u3DNtXpgdjf2H07XJEsu8iSC3cXl2SyI36zBNYjMkf3QUrdsvUSRWi9FUyzgGPhMORPY8Sp0C0kM4EDcwv8cbfa536nvHFfbFZhTLpMIhdz868uKxQ/jyjUrznh1beLb/E6J4Zf3FXU1faIuYIbZr/d/e4GyD3VwrzzideNAxkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r++VdU+T3kGmU+F3G+3s43y4KpcssADqib9xhXcS4EU=;
 b=Ua0PF+vV+XKDpHJ5pZAOFbXOTk4BSGPuNNk1uqajSbuLQB2irfWPxWH4BVNBKwRtshxNBEfDj10ZoU8bGeNfBqwa177klfaQjMEXXxDYm6jwE8WLUajcan22LLajUaUl23ODv5+fGr3atWK1WMw761daHdhiq4TO2ES1lAApkUaxQ3QbGbhC2DVtwPjr9fgn8sbgx6ZMjUHZBNC/3QIZSAEp/dvq8FxHZt171eCzffnKLpvCnmQbf4Yz6ueVxtURiChOOKuuCTWpzG7y1bm06csCjrG65edrdDbxuyA2zTz4nvV8CkyVWj9vmlz03vTDlteOa9VOzK+vfeJaixTcGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r++VdU+T3kGmU+F3G+3s43y4KpcssADqib9xhXcS4EU=;
 b=sV2n3gtaVNfP9lQGXqIy4Z0mRErrYr3lRM3kW5bpCbti+ZWT4pWoUsDxm+GcYUSz0un7M5cNZqRWg3H3e2WS5ZxmVzJun6Ch5ucxQFONwzBh5VmENeaKvZZR8H05K5Rm6twdNC4/Q695L1b68dKQuvqJEgkDpKduL7WPpR/HeVbaBer30GjXkXGjg3NZwLFc3cY0zvCPBYunod4Q2YStKFHQ3891+zgk1/7FnMrbKAygHBsl9W55fVOUU/mayA4kcMYSXitT0sVPyIBL4kcd12BMHke2jNY3FKMFJZGNdadySLld/rZYuTnF9ckxdkWOoQ95CQutF8sylfojk1DhSw==
Received: from DM5PR07CA0092.namprd07.prod.outlook.com (2603:10b6:4:ae::21) by
 DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.31; Sun, 11 May 2025 21:08:41 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::de) by DM5PR07CA0092.outlook.office365.com
 (2603:10b6:4:ae::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sun,
 11 May 2025 21:08:41 +0000
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
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:36 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 20/62] drm/nouveau/gsp: ignore client engine object handles
Date: Mon, 12 May 2025 07:06:40 +1000
Message-ID: <20250511210722.80350-21-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: 73323198-6708-4961-ddee-08dd90d001b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xGTcgCLJtwr3gh1XjugRjlz7evI2RasRH1SDxFY+EekWssfegWxxqQgLpXRH?=
 =?us-ascii?Q?g88xazg8Ng3NRsHKU69oflaMvM+0Ny2nVB/+UhCkmGPDUmC/oAvzxHVworcs?=
 =?us-ascii?Q?a6p3NaCnDdryaxmUHm48ZCVTyKBaPBCFVkZEt7uqGvTitAsbG6lnKGmI2UbW?=
 =?us-ascii?Q?HDddVD7ULRbYGx8Zy8XpJ5veW2Zh19FPSg+8B/L8gSuExgYZEzGe6e+EzLK1?=
 =?us-ascii?Q?ZRou3dGi5Qvc4xyhd4JLNcz0oWqQYXr13tesTe2OEUpFPhzLnaLVLna/hyLr?=
 =?us-ascii?Q?GpWg+PUdzGLLsrXZ2IqebbAujj83eXaXCQ9effDHX3BUP9RIkjmlZ1w4vYiG?=
 =?us-ascii?Q?O0cFPC9Apcw7/WIs/13aiP3NST437JvXkyxWpM3tNXvzLNibDLJH9TCjNh3H?=
 =?us-ascii?Q?QaT1ivmxac3jv2OgpZs6pnxyWgjbK7pl8/96twiHlusUAEuP3OY4exKbLrrs?=
 =?us-ascii?Q?rjkuWzL2B0/nxwjvSo8qxxNuAmekR0OKeLsjZYZAu8L7GJH+DgXZmnRnvJlM?=
 =?us-ascii?Q?tkFLlR8x1CYl0DAKozGwbqY/FOz3vvSsqe27MkGVE8Z8+tJ+OQP7NZ/DV6r9?=
 =?us-ascii?Q?ENT5MkVepF4s7aUY8cvO8AK/41I15RGxDfZiPDd3oFyAIpY+T/J8NCF/PQDf?=
 =?us-ascii?Q?6Vt0pj4b9bPWlYZTdswyL531/DxkcNBGtmLK959VYFlR05ueQjznpzq3Om8L?=
 =?us-ascii?Q?oDzZZ3sVqV19oqG3uvN4Yb25u00OYND9alZRkfucS7JdCYxD2av51dWqR+2M?=
 =?us-ascii?Q?FVfWYFIgbTiRR/08yvSkMFYEWd5Bi3VD2BldpwR0WQ2tuX0EG3dHcHhN0iAu?=
 =?us-ascii?Q?UN+WzdhRnORY33vzjF7B7j7KlVlNGnzO8iQfv7ZGfr0CPERi0gz85A1kR5n4?=
 =?us-ascii?Q?B/+NVll9F7qGQXILojWvWhsFiZkNJ+m5ssjsvNI41iXEB+bWfAWTQ0b+6DX8?=
 =?us-ascii?Q?NAsh+IlCF+im9oVImzx3VEAD4kupFYeNdwOTTdBbcUoafVCYJ/p4HYkxtGnr?=
 =?us-ascii?Q?xaBpC7LzLEQBdZuKLxaCxRSVk/Nl9MmbK2uiNDqrvmWXOVI4k5QJDAghOU+9?=
 =?us-ascii?Q?3mHdyN+9eiqq1uPpUsZugR+myMdn9n02on9dGZBg/pNbAIcp+AQFXg+ZCjES?=
 =?us-ascii?Q?zBjP1oV12MRhwwifMfhUtmpAU2pdlUuIm4/kBEd9ZnH76YdU3pXF+wqny/sh?=
 =?us-ascii?Q?DXz4ngwxTpNw9kY7KxOSX9Bo1w5OCG4GYiEOR1d1BO8/o4JsbpH+DIPRLwi4?=
 =?us-ascii?Q?2qrpl8uKQFyuEf0FFOGQko24QIHvQfL3zSqh8xSWEhpq922iIqVzPVBwKyOn?=
 =?us-ascii?Q?jU9inxE//YVQ7RXXAegQaPNoOorFMcho5/8rB4ZrvclezF5uJRvOU+dRlOb6?=
 =?us-ascii?Q?gPs3s0F6zcK4IOx9BJ0AjlL1doILpx2fuIi0pfs9l81BkKs/dh2V+vpZPhqp?=
 =?us-ascii?Q?75hgEq0i1uqgqKvJ8XW3aBuhtNpqrYXZK32oKpIWGbkiJPhB3/wkyariiyEw?=
 =?us-ascii?Q?DJ/bte8xeCLcB4yBlIU3q5kU1qEqFoqxXQD/?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:41.1744 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73323198-6708-4961-ddee-08dd90d001b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
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

The next commit moves to using the hInternal{Client,Device,Subdevice}
objects (nearly) everywhere, rather than allocating new ones for each
client.

In order to avoid object handle collisions, generate an object handle
from object class and channel id instead of using the client-provided
handle.

This also effectively means it's not possible to allocate more than a
single object of a given class on a channel, but there's no reason to
do so on recent hardware anyway.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/cl0080.h        |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_abi16.c              | 10 ++++++----
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c    |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h |  1 +
 5 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
index ea937fa7bc55..bad124c15a5b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/cl0080.h
@@ -30,7 +30,8 @@ struct nv_device_info_v0 {
 #define NV_DEVICE_INFO_V0_AMPERE                                           0x0d
 #define NV_DEVICE_INFO_V0_ADA                                              0x0e
 	__u8  family;
-	__u8  pad06[2];
+	__u8  gsp_rm;
+	__u8  pad07;
 	__u64 ram_size;
 	__u64 ram_user;
 	char  chip[16];
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 2a0617e5fe2a..da8efe134f16 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -456,10 +456,12 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 			goto done;
 		break;
 	case NV_DEVICE_INFO_V0_TURING:
-		ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar", 0, TURING_DMA_COPY_A,
-				       NULL, 0, &chan->ce);
-		if (ret)
-			goto done;
+		if (!device->info.gsp_rm) {
+			ret = nvif_object_ctor(&chan->chan->user, "abi16CeWar", 0,
+					       TURING_DMA_COPY_A, NULL, 0, &chan->ce);
+			if (ret)
+				goto done;
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index d7f75b3a43c8..3651d9bf5655 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -153,6 +153,8 @@ nvkm_udevice_info(struct nvkm_udevice *udev, void *data, u32 size)
 		break;
 	}
 
+	args->v0.gsp_rm = nvkm_gsp_rm(device->gsp);
+
 	args->v0.chipset  = device->chipset;
 	args->v0.revision = device->chiprev;
 	if (fb && fb->ram)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
index 3b0e83b2f57f..a073a5d03b65 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/engine.c
@@ -40,7 +40,7 @@ nvkm_rm_engine_obj_new(struct nvkm_gsp_object *chan, int chid, const struct nvkm
 	struct nvkm_rm *rm = chan->client->gsp->rm;
 	const int inst = oclass->engine->subdev.inst;
 	const u32 class = oclass->base.oclass;
-	const u32 handle = oclass->handle;
+	const u32 handle = NVKM_RM_ENGOBJ(class, chid);
 	struct nvkm_rm_engine_obj *obj;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
index 50f2f2a86b5a..66604474e339 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
@@ -14,4 +14,5 @@
 #define NVKM_RM_VASPACE             0x90f10000
 #define NVKM_RM_CHAN(chid)         (0xf1f00000 | (chid))
 #define NVKM_RM_THREED              0x97000000
+#define NVKM_RM_ENGOBJ(class,chid) (((class) << 16) | (chid))
 #endif
-- 
2.49.0

