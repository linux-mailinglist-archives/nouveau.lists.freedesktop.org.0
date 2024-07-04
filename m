Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453CC92AD52
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0325D10E45E;
	Tue,  9 Jul 2024 00:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mv3NyOZH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2070.outbound.protection.outlook.com [40.107.92.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1E210E440
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJKHgxvPJdTBk6gSqzIwU3b/S/GpNc4OcWac7nSGiQMbSGn3u6ZZa6TP4/dwEioE9p8DiXS4l1dF6/ceK0q8P6TMfAte9jz0FYlkM7LzMLVHAHZOfkST2xkj9VCd+VBiiQT6ozidzhdofmNj5LXsdAx3MF1YdkbrmjiPMRoXP3iTf1rEMMXN4AVirKK2ADPhggTjhvW9kLBQeOcHH/LR2/+aTpIYCYaQaLZV4d/qjLzcm1rfeIBvOVZgkNudYB6o71lz8oYD6n22qxUSAztgPU4WDm+R29kHXNAwC5jsB14kVppxcZJLftgB3NgukhNw9tp1b6NKYc7Fjpj/Y4HUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLZI8ePxrnt4CHqhaA5/+yhXj+ab7UlCnVPtpS8Hg3A=;
 b=gIttG+YDRElLS/AGS/5LuvALr6Lt5TJJpp03sVUjBB4mKb5UpfuGe/5fRipf1vwyPWrR3yXMh+GWll711dsWaGafupRsJU6irjbF0IYXaGCct4QbY4O81H42H5VjpjQWvcgBYa5QLS+bKKdC7WA1vHolcdaHHeC8VKu1C8wdzK0/G9tLcGBBRJSdIt7l4KHvGf6N45tHW6X8dL0TEKdDY7SLUh0l26sUfnUF/CCsSAXQItzl61OlrLnRjuwiUAS6aT5NVAnedYpj0ejtVnaFG9DLJ8k+5xKua0WZHeQuX9G0fy+rvkMsTLliAIq0kzQ5eE5a1ZegcWtIb/57uvK9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLZI8ePxrnt4CHqhaA5/+yhXj+ab7UlCnVPtpS8Hg3A=;
 b=mv3NyOZHqKccYP5IgRur9LjTKIKHBxx90x+ENwJNEUAKvKkBor+5/ZAsZLA4vh8HRMZa4Qn+QNQHp+8TX602Rb+FnUq/rQ4f1oPtlk1OJ1wVvA5Nqr+s1Zhgp1yx+DYt5mI52uQl2l8HQZaTIJFuU8FxKPIDXUY+TYb4lmcAvLpuzqBlOMxZpqXcco9eu4BfxYRmqTxd1GWFp+HmIR7iZGX9MC0o5+JbvW67Jc0Qd7fW3gL3fQaYY1mw4IlUKk16zehARID8/7KHUtnCFQfSOzGvMAbz9ufKTFHdM8OePdztmBsp5Xd1CrO7jWYKIwkKCTU6JYXpsosUwPBuUgDgsg==
Received: from CH2PR05CA0029.namprd05.prod.outlook.com (2603:10b6:610::42) by
 CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:18 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::ed) by CH2PR05CA0029.outlook.office365.com
 (2603:10b6:610::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:08 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 15/37] drm/nouveau/nvif: remove route/token
Date: Fri, 5 Jul 2024 04:36:59 +1000
Message-ID: <20240704183721.25778-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: badd652b-7f6e-42e5-703a-08dc9fb1cd90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pq0Ny7fggB+p//9WsfTGJlN7ySa6GSY2HnwZo+AhnjOS0eChuH4LQ+6EX5d2?=
 =?us-ascii?Q?D7060uKqJjP8Q1nvr357eHFUvo/d/NKeDI8kuG3jk6OBF/H6qCvewgDlQBv8?=
 =?us-ascii?Q?dHBAxyKeK1e4LYpd9n4SeGSAn76nUGMKWqOt+o++ajT5L4WkjOUxf5ULlJBw?=
 =?us-ascii?Q?YKPn7qAC8Pbei/ffLCh/2GEWjTBxagsPGJa++I5NOK9pjXr1RySwgrD+/Yhi?=
 =?us-ascii?Q?oe233FufIQcEZL8vMfZZwx4f6JlAeEhdwwX72ljvfHRXuMKzt7J/vCEXwNOZ?=
 =?us-ascii?Q?Fhuepee6B/9rfKJD64CkFCHLRTqpEInYjMt2963pwWf7/Hf1I2ePZs5OqEOc?=
 =?us-ascii?Q?c2ekVYoASL+SZppgeG4AJn0HIK0/dFhaPGpmjbXW1GPe8OAEelCGQSpM4i2F?=
 =?us-ascii?Q?8MlRNUjJBVd9Hs2PVsgybHKEAfYbRwxQvQCXnc4rcjCszrt3PGa1USvHOK0g?=
 =?us-ascii?Q?Rkqis5/Ilu2Cmxozv+ychePpzj7Cf0dJP7BVrxz0XwE/Nmbh/Yuf/KTWFhf7?=
 =?us-ascii?Q?H0DkMeRPY6M85Kdy99cPmXcTm/FY8faH3NUFB5huI8nVjqZWBld65mcbNunT?=
 =?us-ascii?Q?PL8GjoPb33WqrB+RGMm4UU3xB5Bd/A5XmxeoHcx9oUhyRszGN99JbtW9xxYn?=
 =?us-ascii?Q?uOlIzry/3/YSivt7fsR3jXOQxdQrWBp5Xu2LnbD/LCja+5WWJJspwVSlRx7M?=
 =?us-ascii?Q?B8jb3KJPBGCKU/SpT+SeFiExx1MsMcaF/Y1BavwfXshI2lPxmco/Fq01gbZr?=
 =?us-ascii?Q?NI3onZyQ5I6KiK+YZa3IduJVvZvY/TvLlRWk7hPp+kSptffaJBHHhHRwgYA7?=
 =?us-ascii?Q?0jd/9l6X7BY2P5qgsWqUTv3Qyhv0W+0jMilG1+lMrQTvuK3IVz7eMl1UwHI/?=
 =?us-ascii?Q?iofZKMapATkXRhxWZ6eRlYyCb9a8XU1jfgO6in0meWoWKMp88ZhIHrq4zrjR?=
 =?us-ascii?Q?wwSLY4hSdKzdrWLADJvTAuHBwFql/zS15QO88tX3FhgGH1HkN3Dl083Kweiw?=
 =?us-ascii?Q?/yZy2MUDRnCXj3cBc0t69scgdKrWWSBf7DP2QfGmfeDJS5LW+KOpe2PHNPc3?=
 =?us-ascii?Q?hVVZ4/IztSDHpgMwfuAN+sX9NbPwIFGJAJLO1Sisd4GSFR7vKMQooCg6kB8O?=
 =?us-ascii?Q?mhLx4NaqwFaBH6DUDtLnfMLPxCwBvjaL1T6miLLyPeWxjSe6DuUKg8GoTP1n?=
 =?us-ascii?Q?s97j6SsaFJn1UEl+cuw503s7J0J2PJHZkgr8m33tCFcpTFYFgp2gOtdeLtw2?=
 =?us-ascii?Q?25nAzWmSNHM6GGLhns/1BFx1KTKNPaNL0F39Peu2gtOMmZns9cbxRv7cnaUe?=
 =?us-ascii?Q?0NmQU/Ty90voS0garngXG4Sa7ymMRzNCaCqT5QVxQdOt8ES4UYuz7uHMWrge?=
 =?us-ascii?Q?h1kqZaaN35Aslmkr6DavyGmXGw+YjGNKblIA+TI1b7J6v7PB3A2MOKUNKIbc?=
 =?us-ascii?Q?vkPML2Noaue1W14Bss2k1GGwIX3XLXZn?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:18.5028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: badd652b-7f6e-42e5-703a-08dc9fb1cd90
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
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

These were a cludge used to prevent userspace's nvif ioctl from
accessing objects created by the kernel for the same client.

That interface was removed in a previous patch, so these are no
longer useful for anything.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/client.h |  1 -
 .../drm/nouveau/include/nvkm/core/object.h    |  2 --
 .../drm/nouveau/include/nvkm/core/oclass.h    |  2 --
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  8 --------
 drivers/gpu/drm/nouveau/nvif/client.c         |  1 -
 drivers/gpu/drm/nouveau/nvif/object.c         |  3 ---
 drivers/gpu/drm/nouveau/nvkm/core/client.c    |  2 --
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 19 ++++---------------
 drivers/gpu/drm/nouveau/nvkm/core/object.c    |  2 --
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c    |  4 ++--
 10 files changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h b/drivers/gpu/drm/nouveau/include/nvif/client.h
index 5d9395e651b6..64b033222c56 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/client.h
@@ -8,7 +8,6 @@ struct nvif_client {
 	struct nvif_object object;
 	const struct nvif_driver *driver;
 	u64 version;
-	u8 route;
 };
 
 int  nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index ed1f66360782..d4f1c964ba31 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -15,8 +15,6 @@ struct nvkm_object {
 
 	struct list_head head;
 	struct list_head tree;
-	u8  route;
-	u64 token;
 	u64 object;
 	struct rb_node node;
 };
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h b/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
index 8e1b945d38f3..cad05f0e7948 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/oclass.h
@@ -21,8 +21,6 @@ struct nvkm_oclass {
 	const void *priv;
 	const void *engn;
 	u32 handle;
-	u8  route;
-	u64 token;
 	u64 object;
 	struct nvkm_client *client;
 	struct nvkm_object *parent;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 6f0548e57f9e..704977530b6b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -521,7 +521,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
-	struct nvif_client *client;
 	struct nvif_sclass *sclass;
 	s32 oclass = 0;
 	int ret, i;
@@ -531,7 +530,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	if (init->handle == ~0)
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, init->channel);
 	if (!chan)
@@ -596,10 +594,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	list_add(&ntfy->head, &chan->notifiers);
 
-	client->route = NVDRM_OBJECT_ABI16;
 	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", init->handle,
 			       oclass, NULL, 0, &ntfy->object);
-	client->route = NVDRM_OBJECT_NVIF;
 
 	if (ret)
 		nouveau_abi16_ntfy_fini(chan, ntfy);
@@ -615,7 +611,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
 	struct nvif_device *device;
-	struct nvif_client *client;
 	struct nv_dma_v0 args = {};
 	int ret;
 
@@ -626,7 +621,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	/* completely unnecessary for these chipsets... */
 	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, info->channel);
 	if (!chan)
@@ -663,11 +657,9 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 		args.limit += chan->ntfy->offset;
 	}
 
-	client->route = NVDRM_OBJECT_ABI16;
 	ret = nvif_object_ctor(&chan->chan->user, "abi16Ntfy", info->handle,
 			       NV_DMA_IN_MEMORY, &args, sizeof(args),
 			       &ntfy->object);
-	client->route = NVDRM_OBJECT_NVIF;
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 3a27245f467f..cd5439b73ac7 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -79,7 +79,6 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 
 	client->object.client = client;
 	client->object.handle = ~0;
-	client->route = NVIF_IOCTL_V0_ROUTE_NVIF;
 	client->driver = parent->driver;
 
 	if (ret == 0) {
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 4d1aaee8fe15..2b3e05197846 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -40,7 +40,6 @@ nvif_object_ioctl(struct nvif_object *object, void *data, u32 size, void **hack)
 			args->v0.object = nvif_handle(object);
 		else
 			args->v0.object = 0;
-		args->v0.owner = NVIF_IOCTL_V0_OWNER_ANY;
 	} else
 		return -ENOSYS;
 
@@ -286,8 +285,6 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle,
 		args->ioctl.version = 0;
 		args->ioctl.type = NVIF_IOCTL_V0_NEW;
 		args->new.version = 0;
-		args->new.route = parent->client->route;
-		args->new.token = nvif_handle(object);
 		args->new.object = nvif_handle(object);
 		args->new.handle = handle;
 		args->new.oclass = oclass;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 48416c5039a1..95cbb5b682f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -51,8 +51,6 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 
 	client->object.client = oclass->client;
 	client->object.handle = oclass->handle;
-	client->object.route  = oclass->route;
-	client->object.token  = oclass->token;
 	client->object.object = oclass->object;
 	client->debug = oclass->client->debug;
 	*pobject = &client->object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 0b33287e43a7..39d5c9700867 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -112,10 +112,9 @@ nvkm_ioctl_new(struct nvkm_client *client,
 
 	nvif_ioctl(parent, "new size %d\n", size);
 	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(parent, "new vers %d handle %08x class %08x "
-				   "route %02x token %llx object %016llx\n",
+		nvif_ioctl(parent, "new vers %d handle %08x class %08x object %016llx\n",
 			   args->v0.version, args->v0.handle, args->v0.oclass,
-			   args->v0.route, args->v0.token, args->v0.object);
+			   args->v0.object);
 	} else
 		return ret;
 
@@ -127,8 +126,6 @@ nvkm_ioctl_new(struct nvkm_client *client,
 	do {
 		memset(&oclass, 0x00, sizeof(oclass));
 		oclass.handle = args->v0.handle;
-		oclass.route  = args->v0.route;
-		oclass.token  = args->v0.token;
 		oclass.object = args->v0.object;
 		oclass.client = client;
 		oclass.parent = parent;
@@ -331,7 +328,7 @@ nvkm_ioctl_v0[] = {
 
 static int
 nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
-		void *data, u32 size, u8 owner, u8 *route, u64 *token)
+		void *data, u32 size)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -342,13 +339,6 @@ nvkm_ioctl_path(struct nvkm_client *client, u64 handle, u32 type,
 		return PTR_ERR(object);
 	}
 
-	if (owner != NVIF_IOCTL_V0_OWNER_ANY && owner != object->route) {
-		nvif_ioctl(&client->object, "route != owner\n");
-		return -EACCES;
-	}
-	*route = object->route;
-	*token = object->token;
-
 	if (ret = -EINVAL, type < ARRAY_SIZE(nvkm_ioctl_v0)) {
 		if (nvkm_ioctl_v0[type].version == 0)
 			ret = nvkm_ioctl_v0[type].func(client, object, data, size);
@@ -374,8 +364,7 @@ nvkm_ioctl(struct nvkm_client *client, void *data, u32 size, void **hack)
 			   args->v0.version, args->v0.type, args->v0.object,
 			   args->v0.owner);
 		ret = nvkm_ioctl_path(client, args->v0.object, args->v0.type,
-				      data, size, args->v0.owner,
-				      &args->v0.route, &args->v0.token);
+				      data, size);
 	}
 
 	if (ret != 1) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index aea3ba72027a..580b8c7f25af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -313,8 +313,6 @@ nvkm_object_ctor(const struct nvkm_object_func *func,
 	object->engine = nvkm_engine_ref(oclass->engine);
 	object->oclass = oclass->base.oclass;
 	object->handle = oclass->handle;
-	object->route  = oclass->route;
-	object->token  = oclass->token;
 	object->object = oclass->object;
 	INIT_LIST_HEAD(&object->head);
 	INIT_LIST_HEAD(&object->tree);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
index ba9d9edaec75..cc254c390a57 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
@@ -116,9 +116,9 @@ nvkm_uevent_ntfy(struct nvkm_event_ntfy *ntfy, u32 bits)
 	struct nvkm_client *client = uevent->object.client;
 
 	if (uevent->func)
-		return uevent->func(uevent->parent, uevent->object.token, bits);
+		return uevent->func(uevent->parent, uevent->object.object, bits);
 
-	return client->event(uevent->object.token, NULL, 0);
+	return client->event(uevent->object.object, NULL, 0);
 }
 
 int
-- 
2.45.1

