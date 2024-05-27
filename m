Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AECE8D11F8
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011110F5B3;
	Tue, 28 May 2024 02:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fSzkn9V4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D5410E227
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4cu1wztOhe/qSIHX92hwpMgq4pxjA7VZyBWQNtGE23KNiZqbZhZ5CjY3ojn5ja+Cd79EobUdT6ug5fpM4+G2xOJkxa+qVV+BZPzzwLfsi7BHeH4RcT6kvW3PO0nwFLtN0PyP1BR6D2XNSUY7heJJZadxbG3Ws8OzG8OJAC09wxGb6SxIq1s6Z97h1nIkmAFthd7mGt9OJaK/wn/VmQLw0A/PJSFzaL7dJwaMbjyiUhxAp1inuHMMludHm/kSYZVH52EfDgtxtXRgrfVzfXHbRW72NRyM15PI9VtWZPrp8+SWrHdJIEopUiu5vekB064bxP35jFz43ehH3dvze5mww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CvqKSBb8FVXyPxz8kzV1bYj8TwgoPR0qoWGBUJ+gwpI=;
 b=b6LsSDPjNMjkNXArAEZYqxTmfexE8/8B3Xs8HquakMuZGFlCrcg5Z1bJj88YqiwY3oeSQ7WsIIArTltRElZ7XK7LE27eWj5FTYJuOq3eJY4cg8hlqvKwRNNjQ8MaT/tKHDKBs8285J/TBDSM0qjVNA8aWNw6cKhqK5ATiwRIzsK/WFUn8gldvzIBwPQv2ft1igvwvoVa+659mvxsvjSvD2hxZSeIfRnxC1xFgvy1cRGRz1g060ftIOUkaEtCaL70yNI5Nkl62FyAOBhfxXeUlYyaz/9g7wzQ81hMzZtbOe8C2nR5tjluoXsASfYgdOOz9POOFsQwYs8jRlhOx8ABAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvqKSBb8FVXyPxz8kzV1bYj8TwgoPR0qoWGBUJ+gwpI=;
 b=fSzkn9V4PiwVQB5PloqCGdK24aWzh3buTnNQspD/ED5kLSkXjF4IGC3gNnAmVavdXvGb/+QzYXzUYl4HYO9X6PRyTdrS+1SDHIgPD8/k+nVVDVq6jwowrtYYx/FzK9jXs0OP6nKlwwFe72OVuTXBtwPLy9QqPQxykSaztXHmqez6TVpJgDsIisSxVhA3wUekcjDB/W5Ii9ILFDiRlkzJF3uANnEaFU5O/1FZu42bXE0zeM5b0ZpPETmDfhzBqBW1O6W66eUwQWVrLiQcdv3aJsIOvLTH9e5XikufCxxw0w/U+zZN3DpPqeYnCXqIA4YdcU94CrO0yKz5nq4OeqPWog==
Received: from BYAPR06CA0052.namprd06.prod.outlook.com (2603:10b6:a03:14b::29)
 by IA1PR12MB8224.namprd12.prod.outlook.com (2603:10b6:208:3f9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 28 May
 2024 02:23:18 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::31) by BYAPR06CA0052.outlook.office365.com
 (2603:10b6:a03:14b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:05 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 12/34] drm/nouveau/nvif: remove route/token
Date: Tue, 28 May 2024 00:19:37 +1000
Message-ID: <20240527141959.59193-13-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|IA1PR12MB8224:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f2e2af-33b1-445a-9b71-08dc7ebd22f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|1800799015|376005|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1bJMNiVRe3kuCI9qkC4PpvKt3SaaX5KxMsk8rIjs6GPJh9212q5/sDSowdB2?=
 =?us-ascii?Q?gTxczdlqciRW9hBNTylxmy5MF1JSyCtBv3Mc6RoRqJ/R3eTQ/fojTv2YzVIw?=
 =?us-ascii?Q?mAd7uctime+cnmCa0Ncbgv1gA0chMdmuIjB1cSfgFv3T18pWTOz/SkiMz+rN?=
 =?us-ascii?Q?C6Pq0u1mrWhLZaHhxBtkMg7wFxQK2mdcZIZmFYV0SvTIObDRgZgSZIWokZEh?=
 =?us-ascii?Q?V0rq/9WHHyOCV3Rb1rP31oecJ2ldvH6bEjjcb0+lg2GTzTKCd5yQHM49WM9H?=
 =?us-ascii?Q?frNJtMxu4WjxAw2sEbEh8i0pX32+/caj130niHkFm4I/Mj4boN8Sp1KitX28?=
 =?us-ascii?Q?QUBJcbFOJpq+w2MHu6AYGUH1IkDMVig1bu2MATQLt3Q8AHML1S2VUrRgKgS0?=
 =?us-ascii?Q?BZ+M25GirXDIe5jZ2HJIAHV7qZX+7KSbnGHAUqiCJ7DhdZiV3WExh3NcQZi6?=
 =?us-ascii?Q?g3rfoj71fGt2XEhDQUgOxerF5wBcIDaLi3lSd0iqu5AJnhusdvQ/ERPeX8xE?=
 =?us-ascii?Q?GmQGB8Y/SSEHq4iPFzp06FQ0kc4WQj346u67zkV3kWsEifBm2mAc33xHCe3S?=
 =?us-ascii?Q?raAQxEaRuddpT/6nPgKo/z87B2K4jyxVghMmEZQtOvFF4zQrjqU9iifRJwPk?=
 =?us-ascii?Q?P2KweZ1ChZPtwHvRDeZkqUDDK5gutH0dp08B5oor8XEP0Idd17UBgXYwZYXV?=
 =?us-ascii?Q?1Dle26vzqeWPbzXHO6QrwmUmofSZF6mH+myF3XGK43cMWsfxz3Ttg9oFO7sX?=
 =?us-ascii?Q?EBijWXMbn6CjR+aN3MvOoq+JoVfdQXJML8vpKxI2dsUNTU0RFBnA6Q6/515m?=
 =?us-ascii?Q?fcrpBkqemMItfwq9zD2nGh1OqBaPnCIU3IG7v48HLjYGjeERy739aL9THbrS?=
 =?us-ascii?Q?vkmEvB2djMdGkCj09AB3JpeOIK00GGUjc5TOl6mWNh5OutXeGeQFnNH8HHEn?=
 =?us-ascii?Q?xx5wdIT0GxGMx7XsN/NPC7Z/UOLByXUTWQrcGMvw23VOVQncLVGLf1+H6DrJ?=
 =?us-ascii?Q?QHuHXM7qxTU45E2iwhM6bnOvRwwzrqPmsLKkwItTVDgNjspKWOmt+c5yb2V9?=
 =?us-ascii?Q?fqGDGk24ThQ+5sOLFqqxBs2utW0Vy6FgijuOtD1wdWlFK0OzVgrqgDYqGSQd?=
 =?us-ascii?Q?dboml/0eso2hKRjlBwOdhfmPn2ezPcth8ECMdGTi17eshfhlG16cATYlHocu?=
 =?us-ascii?Q?3p3AoWQ60YgsaTlCRkCOEebWsN2GIpj6ghYPTAlKD6nMlKxhVjHGU4ABEEfL?=
 =?us-ascii?Q?VdMOzFSKM5V2LpyAVGeG0WyXRpPpF0Wm939LODx/2k7AZksds8HAn5NS3mBm?=
 =?us-ascii?Q?C4wN60IAt5n5e/I8XvWeEuqbHxGmRTG+DfObuIb4zOk5aEFpiD5k8WdlnIku?=
 =?us-ascii?Q?231jJGYa0gjAxvV/eQHFDX9TwGnY?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:17.8670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f2e2af-33b1-445a-9b71-08dc7ebd22f3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8224
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
index daa82b333309..ff550672c2a0 100644
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
2.44.0

