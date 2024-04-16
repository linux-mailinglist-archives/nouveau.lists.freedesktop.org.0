Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39B8A78C1
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E563112F38;
	Tue, 16 Apr 2024 23:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F7vulsQX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7322112F37
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKyMJ5xWg7VNEGSfQDVu44NlwFI9FG1Jz7/clsHMKb2Iez5iKJNi78jXQynGU8NEF5PA+pK0i3CLnFql2kkYra5hP9yVzutS2TAIc4nZaNOr91taYJ5s2n6ATZYhfE3jl6V2laLUl9QGABBy0VjquCUsBCrnevka8yj8sO7QKJTGInvf0NiQpz/0/Fw5A4lcW/R5u6kncDlmEjkUesFilV6Ee9v3YciiqBY/HjpaupucBAnOY0IiHMjOtvHcg4c1Na8RJ2Kv0BSYlKMkuBukc3IVXVA5/+BEmbEsRBeYj2mtPVjHKB+PtAFDQCBTtnNP9x7Q3nSgEjvlGYS5+usr4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HIbfKujNVf9b+vFia1n1S6XZRpRDQF2sPY5uGy+F4c=;
 b=fi1duIbVqmMO2Hk1Ck9LMjSW9bnLYgdRgUAe6+TEX9cI61vrt+JmnZ6pMEZCDWoITyj//yd+VJ9+dWyyES6dBqimANuhjNNezR6tjL06Zr6NQVKt2TshEWVTtTwS8H8Joe/zwLmP38seNzatA7cb+NoQFjtN0Y0qkzd68pJlJ82qzmKVP+DlNa1vOiYZER9Crve8vM7XRSLXUlq63teS2AbpPNesQ5qi7/q7sJhIO9gqCPxU23JDh8hS0Xz4xEhCIOO8pKpAgSqCslN7+wODqu2Fq/LffcLo6l3/Vnaw4G62ay2qLgLFcnTw9LyezpOBc7UWCmV9kR+XzNYqVrZGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HIbfKujNVf9b+vFia1n1S6XZRpRDQF2sPY5uGy+F4c=;
 b=F7vulsQX1bmOCqI5Py9L7PnjEbxCEND5qvRXgptfkHx4f6Mn9ZHb5kfd+vr16mgZtvW87vhef1w3xm4RK36Zh2oIbgpAjBzZ0TbwdtdAppOIx++6a2NPwGHGDyrl36rvIRSSluleDSkhMa/rVxOK9x3AYD9YSI/lvvlPW4x2I8dM0nFMimTflmmjV11ACSgQoFgLaI6mRP5MxQmdWqwRScDwd24CeLpvsTWcBrCOtKzuNxq94MLQbLi+TCIOjPTTC//h1YQB2HRxwOzqx841VFOT2aW2AF4sEGadryol48vjBZrMdh0P2864RZllbEKLulliw2f+Aq17i0dvkY7etw==
Received: from DS7PR03CA0026.namprd03.prod.outlook.com (2603:10b6:5:3b8::31)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:17 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::2d) by DS7PR03CA0026.outlook.office365.com
 (2603:10b6:5:3b8::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:03 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 028/156] drm/nouveau/nvif: remove route/token
Date: Wed, 17 Apr 2024 09:37:54 +1000
Message-ID: <20240416234002.19509-29-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ac9bef-338e-458c-0627-08dc5e6eb5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OptnSA4nWdG3YDYopwvhSM10Bv4zLohtV0dA1bk3JEqkx2DZ8u7Mf+qbSm3q6qHGx6GXo3gMCMKfK1IXHdvWtLL6cT5eCMZ5hyh54LUzak3z+yirGQsrmYVhMt21pQyyhAcOJMLgskOtDgqbquZ645cwC5z4s01fTmqaUzS2gln9bAuX+y1mLGIvYbu6CdoE4jotbrTRjDj0VRHGXLSmtyPVOSpkqLLSSTA0eWuysxbz4vnRUn1ypftzcJJ5lWuHZAZIryBLPP1Jha0hVQ/xwC1oNCRDggguirjIijRI+fiAdZWVQ20XsnwUWLSP4/5db5d36q0ACrzD1sCPr+i6SbDE/k4rfxIsVISvUhIWeDePd/4hOBneE/kdWHx5CxZS2lhDgkcs0gwlRn9cgssC+0FIS8SphaGwFyLwSDbw2zMEaGj5xmgZb48PYrVJfIvNOybBe4bJL+Wqjlmp8+WL9OxP4b6tVb/22BJpftV/eyxlY9zt7x4HyC3c4+IHqxEL17JAvfVMBjFgSSAWKCh8L5vpKvw3V9EvvItzhj8CHCd6+WLkwuqhTMrL+qA6TMscGpb5nRyToy0bND2SP8CETQ0JZxdKQLI/ZpSJz49tbDW/QvagZHRiswy7qDrG0cZordKCQ9gRt4aXr01XmpM3HEX+x1/5s6dQAzSCnlslaXfXGP8woaVVJWG/W7po+hlsvTIhXESM2hwzYxoVrCJDPi2P7x2VkdCmH/MVjK8mwl/jaA5ZyH+kJdkDIwZ9Y42N
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:16.6813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ac9bef-338e-458c-0627-08dc5e6eb5bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
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

- these are no longer useful for anything

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
index 5ebd19ece13b..2648e42e0496 100644
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
 	struct nvif_device *device = &drm->device;
-	struct nvif_client *client;
 	struct nv_dma_v0 args = {};
 	int ret;
 
@@ -625,7 +620,6 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 	/* completely unnecessary for these chipsets... */
 	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
 		return nouveau_abi16_put(abi16, -EINVAL);
-	client = &abi16->cli->base;
 
 	chan = nouveau_abi16_chan(abi16, info->channel);
 	if (!chan)
@@ -662,11 +656,9 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
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
2.41.0

