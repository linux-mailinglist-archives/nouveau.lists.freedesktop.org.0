Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EE693CD46
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ADB10E906;
	Fri, 26 Jul 2024 04:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KgkNbrKg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B246610E564
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiulCZmJ4oPKowuh8vLw2zL14321bzyZUxquqFvMJKK5dnB1c+/SrME0wd4ikD10n/0q6SD0jXj46ZFNiikV+NJG6rB9FyTR3FYA9aFXMh7e8UFCJdtBfecmelh3NOWKOS5IKGg/blyuDfahSzL5ZeMb52/8qjLjyaeKUGHLswljgawrsnX0AiRnbPEPBPZP4txAtgCtI4bY9uFfQ2OM1VyioylDrbv/OPnFZQhVdLA3ilNYZyoawLXiSUgwtaGsoqrt0wU6OhrJEuGndpxJU56VTR6nO1DXPQhBYGdYtPRNv0xFHKYp/3XeSxbb4kF/dHcGfKompEZyuPpGrK4BVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGjPUKtWSYLQINl68K08HVSBZc1w3k6XcbNohfo6tx8=;
 b=pO9ZaYinqtaJINwOJelJXM2WX+s30uUuH5FjDh8osI2SoB8fDzy0vYzSK+/g08EVxVa5bWbz2NBAenGKt1oRYeTpqoKKPTN88RA71qBmOl5kTTdAyUGyYo4TNPZZDObASHNMzO0zRPn9upp6tDEpdTEVvKFEBR6xI8wu+mnX5bWAitZwsi8eS75lVuX5jq1HkukXTxlXnpb3CxY26jV8uedem145TWBkpX9oHse8NGAwHAamZUFZ0hNL2balKz2hkA/xhoBzP2omthZuD1dLF1rBxn9jdoVVYshYjVv8ePFT5nTkO4qck/tLHXoyvqv3uAlFS3OwzXaBzsV913DY6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGjPUKtWSYLQINl68K08HVSBZc1w3k6XcbNohfo6tx8=;
 b=KgkNbrKgf13RnryJGx9nxvJ3FjF5Bhwz6NTUbHLYfcB2/uUrGMrvo+TJNWNvCUAHg3azZJk95FwtwkbV4n9Sd/FFK4Mn4pW9Cxem3GyyB8Oy3Mpxj4Cxi3Q9EOaqP1cVnTd0i5YbWgMwBiN/c5rUMmoHeAJ+tCxWDSRpQ68noqHLaWmEsMGq3vwHVI2iCxh7mkEk01dLaynFi975plB2YSQt6yRYTl7ia+oSyQQWLX/lUmg9hpzN0wUjkRrrgXNJJ185txz4TcILLLBQiEMRJbgeQMraO/KgZNR6eTw47XseWRXqlKjHNlW5Whyx1QXKH85XmjVZ+8CMMfGEbCuXPQ==
Received: from DM6PR08CA0046.namprd08.prod.outlook.com (2603:10b6:5:1e0::20)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:16 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::a4) by DM6PR08CA0046.outlook.office365.com
 (2603:10b6:5:1e0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:06 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 15/37] drm/nouveau/nvif: remove route/token
Date: Fri, 26 Jul 2024 14:38:06 +1000
Message-ID: <20240726043828.58966-16-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 950a1f63-5f0b-4103-428b-08dcad2ce80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4JXSN2z/DuDZTW4+nZ8dRz0nNp9xRbQtlgDZ/Lqi4xXqJLqMx/krJUzbOsD/?=
 =?us-ascii?Q?w95hCDrde3NWyjQ+L9TShBI2pg/Nd95ZKxLiy+XWrnqoLGOxOuAxD7h64rtE?=
 =?us-ascii?Q?pRF8+4VsQN2cngT7zPABgi9U+DapuBGHrBzENDGKNwygFPiN6i9lxEYWsvCR?=
 =?us-ascii?Q?ScpKMpcFPeXu3ADI5oWm6rXfIFqVy+5g8cTNkz8zAeSl/OF9j/NpEXSaDF3m?=
 =?us-ascii?Q?VCWnPoXBVCVmxzM+7+6MXj0LuHmbQwCLEI6dVhtKpUqcCueu55KyP+4ijAYW?=
 =?us-ascii?Q?D1Q8nyBuDbFn8AXiuWDoMSPjeIp8Ph8m+8zKnWcR0ct+GQqGEICmGpAuIAr+?=
 =?us-ascii?Q?Ck+TpRGLmqwU+5QyevC4zHF63vI1WmnH2ThXIIC7iDr6VqA3ALe5VRSffrhv?=
 =?us-ascii?Q?Llj7tJcMxbgKT4N8dx+b97aUDI+ONMLZw5SqbvKhMlzGMiond5i++K6GbLoa?=
 =?us-ascii?Q?XYHP5QOg+QzZx9trE7PHpkp+CEKwD+HhDngmq3yJijOxG8KfYVUzwyOcCchk?=
 =?us-ascii?Q?DxK+GepATxs+GoSL4hSt2kPicNo5WnbxO6ea0oRRySAJTHmY7ssWa/8jsB8p?=
 =?us-ascii?Q?5yFAH6XX1cjPftEa5bQX+dfFYlg/SK25vfOoIjeBUSp6/oj2M/Zs3JB5bsVJ?=
 =?us-ascii?Q?WvWM0rUrTzecjBR5BIC5l4j52kdmdEfCWKzHTkX9Tk1pu14qnsbFq/+PVfv/?=
 =?us-ascii?Q?rILZzZGqTjvhCGx/uNQbbqj99OtcNlwQ3FuEjEJ5b+tbuLnR/NEXHsSj4Ivd?=
 =?us-ascii?Q?SV9pR9jc3s49q7Eb71cyvlC/Z5+/M9QSurQZM6+mFU99yn3+8tY0OK44sHjB?=
 =?us-ascii?Q?WG7DSP+G4nHFY3yj2niC1/IHTqmRh7h2wih0MYF/vxOu/Wko4xTdhrx9AwyW?=
 =?us-ascii?Q?McOsaiamlH4PqPCV4fpHwDikYjJnl7VBCV/KRBfqDsjLLsITIZYZh8ivUhLx?=
 =?us-ascii?Q?2eDtigI0s3i0z/mSdCEYwKSrDk0luv3h/3YSRXcxTSebGdny6b+g4Qfvfsto?=
 =?us-ascii?Q?mfbXSwlLii2OqFWqgh6uktkLH00TeCUR8CsVCmi57v9Ee2bCHNt6cqWr4IBF?=
 =?us-ascii?Q?oVRyD/eNjIoNVMD5hUHGcIShUQEoDoynzx8gzgPk4q78S8Yo8HVMnh1Qr7Z4?=
 =?us-ascii?Q?PagiG/FXn93DRoZsYvor2hBwQ69hvBkSLIhcjXxjGrHl91OO87tAnrMIi82B?=
 =?us-ascii?Q?zV1LSV2daMWNRYrIzQJL+8WirSMlVkT8wlABwJdUd2odNYO94V6VFAy9myTQ?=
 =?us-ascii?Q?rJ9MtTUO/bWpExvN3KA6d7StbXm9teHEcCA2F7SY3RiuRbVZE+KmEWO+udgS?=
 =?us-ascii?Q?FJMAw/SUEcGrtiptlChBaPjGMmqTyPf375SP2F6gn/YWxdgStsEGkD2VeuhK?=
 =?us-ascii?Q?VCx5qVQ+Ib6/InzTjiPmEPPOU7U0l3SqDGYyStrUBKrTvTV4hSUvxtp58ol9?=
 =?us-ascii?Q?PlzQ+NtAz1TNClefpx+0ykv5Yj+Gshzj?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:16.1685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 950a1f63-5f0b-4103-428b-08dcad2ce80f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
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
index a05131920052..81ddb9eadc8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -530,7 +530,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv);
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
-	struct nvif_client *client;
 	struct nvif_sclass *sclass;
 	s32 oclass = 0;
 	int ret, i;
@@ -540,7 +539,6 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	if (init->handle == ~0)
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, init->channel);
 	if (!chan)
@@ -605,10 +603,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	list_add(&ntfy->head, &chan->notifiers);
 
-	client->route = NVDRM_OBJECT_ABI16;
 	ret = nvif_object_ctor(&chan->chan->user, "abi16EngObj", init->handle,
 			       oclass, NULL, 0, &ntfy->object);
-	client->route = NVDRM_OBJECT_NVIF;
 
 	if (ret)
 		nouveau_abi16_ntfy_fini(chan, ntfy);
@@ -624,7 +620,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	struct nouveau_abi16_chan *chan;
 	struct nouveau_abi16_ntfy *ntfy;
 	struct nvif_device *device;
-	struct nvif_client *client;
 	struct nv_dma_v0 args = {};
 	int ret;
 
@@ -635,7 +630,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	/* completely unnecessary for these chipsets... */
 	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, info->channel);
 	if (!chan)
@@ -672,11 +666,9 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
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

