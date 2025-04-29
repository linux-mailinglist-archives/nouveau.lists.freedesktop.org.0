Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A3EAA3C71
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71EF10E522;
	Tue, 29 Apr 2025 23:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ad3oVfhp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6565710E54E
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTYMqJerGeKKGYYfX9hzEGMMopJvGu2gBzDm7STwrxO6LOkrf5KFcGhMLLROEIr4HLTopPryQaBl/ZckkZpGKSomy1PDrO8HkAdaWrsorsFX1s/lgIayezh+MKsGPomye5qlnSqs2Va5uJavAdHzqWX1DRS6E9zt00cJd8HGFlwgK+r/U58aNRkJFV69/Xmi6dYFIaygusXR3mT5o47M3RIIcdvrBCw3nTVH2crRpXbbntO6jHpJpNrh2oySTdgMJFRGqTsN6VkHSUx0QkF0zmVFjjoFLQf9VM2wK0sNgj4BWwvJIUZcn7s+e1LtMlHs+GmuhcBK+7/nOidh0eOcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAWly35OxsviW2O7Dw0vBcTFj2VHZbaAadva3wKn3ig=;
 b=AXOxh5PxcBhy5ZAwhcQ/YKN+veZthhub67tt5z4+K9gd0T0gZfcwnb++KsQcuUnjMa6urcte2f1kXuBRfWiV48EeqRkv0iHL5vwjC0PY/tpltM+ylTdnAyKA0XPTDABGXL1V8Ab0HNuDAB93dv16ZDQcE7C4COrkPM4BjI9fo5LzVTN7sJVghphNCuyee6wNpXJlRlYM0ueR3GjsgrzpBGtnBgZ43gMPLdnPMeOsvhZ1qi6qEkjvi0Ee3cA7FPOzW0weY9/PsISesC1JLgcXsXGKSwZGHjB3BoJWcmP4ULNZDDMHBF/p77L/+XTfMJTZP9j7aVI6thVWPh1TU3sLoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAWly35OxsviW2O7Dw0vBcTFj2VHZbaAadva3wKn3ig=;
 b=Ad3oVfhpoNK0+5+j5RReGtqu7DAPytwQmKO0iFwpqpozYTbDX2ELjijkOx1xmOpaBGBxU+vxP7f4QGVxYDYakbeNbiX7xUJREsJNItdFAj9tUcGTlxEwbel1ZVcpXOefWKE51W8wyORI12NjPoibC+V42ITOEd2EUNo7N8wFMC+reVB/vyNehj709o1M4Uj+opp3zwnq9CNWE6/R+4h+gGclK85RF38+UvwdyCsqyx6yBLoF5X7lm5ZtPpGgHs3kzC/bItO3f/pVcxbK9AWhJBpxL+Qm7cqpWW26o+/COQ7oyUSFheJXvl9/nehZYoqfW/cksmBJT9uvI8O8RFCu5A==
Received: from SJ0PR03CA0147.namprd03.prod.outlook.com (2603:10b6:a03:33c::32)
 by PH7PR12MB5973.namprd12.prod.outlook.com (2603:10b6:510:1d8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 23:40:03 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::4d) by SJ0PR03CA0147.outlook.office365.com
 (2603:10b6:a03:33c::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:47 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 07/60] drm/nouveau/gsp: split rm alloc handling out on its own
Date: Wed, 30 Apr 2025 09:38:35 +1000
Message-ID: <20250429233929.24363-8-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|PH7PR12MB5973:EE_
X-MS-Office365-Filtering-Correlation-Id: f7333ef5-ab78-400a-3b48-08dd877729f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xpgdra5P8iZCPrO8qachrvRfdHM5QzbQSbTpc08LVtvDRNEbQdi6ni4J6E5A?=
 =?us-ascii?Q?m0WXjH6n9jSAxOIJsDF/HjtDOmY3oS/N2MLPrQzWtUwinbPQGQ8WuXV9Do0j?=
 =?us-ascii?Q?KHB2z+PzVve0tZiQJEAZERikLVLpj3N7X2vKJPRfoZwaN6hIZn27XZpaad5W?=
 =?us-ascii?Q?4UoZG3c23kTpTFsOyS6g5UizZBMCx9+vmwLslQQX2lnaw5F8o5Kd7O074Nmz?=
 =?us-ascii?Q?SY2WwqIKcLMq0KS3+HKApbUKp3zjH/2CfqGdAaGzbGgPuCh25R6Wq19woWnB?=
 =?us-ascii?Q?RDYSc2TbALOTpgorXp6PyiCIQ/bunuCaoO4dlm4n+U+5a4EH0jBmQ5WbItTR?=
 =?us-ascii?Q?KmxVtkvo71DBY/PLNGZ7VfUTz4R+iooFy++jcrXNq1O9iovKzvuMa3hPQz+A?=
 =?us-ascii?Q?7/Lknn0V47g/xGcMj5zEuzEi8/Ep6EufCooMmzCKYTqhKPMRbDAK1HARrboS?=
 =?us-ascii?Q?O8LCCbefBtQOLz8BDm2szJR0o9yZflBgC5WzKd6dHjMc4TEw1JuNPH6XEWNs?=
 =?us-ascii?Q?p4OcTsnskeaFQzGwggH84I3bdgSZ+VAr8rkRTww8T6XsCtezbTkZBtb0lv9s?=
 =?us-ascii?Q?Os1i48Jxvbp2kMIuipMbmO/sGD3q0drttmAWk3gYnDAewIc+1vvQfk/7QHTD?=
 =?us-ascii?Q?nqasuArz2Lt4KBznKqYeLC9xI7fCvPN7p0iKQSQ17Aa67VsR2pq02TZNE6ij?=
 =?us-ascii?Q?J5UnLbapd1azpKu863fnnh/FwSPiXCYLwKdp+EbM08K1FEQR7hPCPtNXGm9X?=
 =?us-ascii?Q?0ulNqawSLsapha7n+SkpgdoEg1Rh6dYjR8wfPw42yOxhxCq9hn1UihaBwzuq?=
 =?us-ascii?Q?I8nBoLpsvSGOw2OA4YcsrnR1vtxl7/6LF7bBAXuCGcq0VkRqX5NNilCOQcUh?=
 =?us-ascii?Q?fiFw5mIitwPU5E3knkJbcQRcqoaZoyv6MKWw1lG6ui0ogx8zCUUWfmo+rxTD?=
 =?us-ascii?Q?cKhqdLsUIkuXiCXg+MyyrYYgYCHowSeaoDXSbWwW6xfztzTL9EB99e/uHiaM?=
 =?us-ascii?Q?DglD3vzCVAmlpcFDJAY+m1H6KIWH5wgWTZHhUKXCeOqNqYG2Y52wxPAwe6Ov?=
 =?us-ascii?Q?m5difnuWzD9lRX7pljToai4RrZdvlvES/tGSwF0g27t/wqZPbYbcJx83ZA+V?=
 =?us-ascii?Q?LqVpLXiu8wDE5H30F+xNyOub8luftkRFRhyMhAUSLCXUifN0zOAHlXjah2VT?=
 =?us-ascii?Q?dVn4cYWw8BsA47CmnXRqL7LPoOwbCSM3r4+6tgo0BEY5a6M8qRzj9EnMpyVs?=
 =?us-ascii?Q?2sLSNLP2rffzIrSWlzn7qAH0crdchbfDlLq/hFMMWQDJF2TIqskPKz5AkuLP?=
 =?us-ascii?Q?NiPCAK3O+SnNhfEUiSEqWUkHX/xiqFW5obfC38sppdG7N4bUHqVTl3Ou0sfO?=
 =?us-ascii?Q?/8Jfir0I3zpaUaQYRThPSOgHwdRbVscUI8/jcsItFC0q7hTvfQ6Tt4EXV7hR?=
 =?us-ascii?Q?U2GwfNdb1Xb/GHrZ3X+7UjWFDUXZbABmBxRpnFgk2wp4mIMA+28HO9QTYCLF?=
 =?us-ascii?Q?u2hUaUP7KkOxNx7KBOQAiX5mpqHrcti4Pogm?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:02.9770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7333ef5-ab78-400a-3b48-08dd877729f5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5973
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

Split base RM_ALLOC handling out into its own module.

Aside from moving the function pointers, no code change is intended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  14 +--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  85 -------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |   1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/alloc.c   | 113 ++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   9 ++
 6 files changed, 128 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index bc2cf837aa9f..dfe2abc6b3a0 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -212,12 +212,6 @@ struct nvkm_gsp {
 	const struct nvkm_gsp_rm {
 		const struct nvkm_rm_api *api;
 
-		void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc);
-		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv);
-		void (*rm_alloc_done)(struct nvkm_gsp_object *, void *repv);
-
-		int (*rm_free)(struct nvkm_gsp_object *);
-
 		int (*client_ctor)(struct nvkm_gsp *, struct nvkm_gsp_client *);
 		void (*client_dtor)(struct nvkm_gsp_client *);
 
@@ -364,7 +358,7 @@ nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u3
 	object->parent = parent;
 	object->handle = handle;
 
-	argv = gsp->rm->rm_alloc_get(object, oclass, argc);
+	argv = gsp->rm->api->alloc->get(object, oclass, argc);
 	if (IS_ERR_OR_NULL(argv)) {
 		object->client = NULL;
 		return argv;
@@ -376,7 +370,7 @@ nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u3
 static inline void *
 nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv)
 {
-	void *repv = object->client->gsp->rm->rm_alloc_push(object, argv);
+	void *repv = object->client->gsp->rm->api->alloc->push(object, argv);
 
 	if (IS_ERR(repv))
 		object->client = NULL;
@@ -398,7 +392,7 @@ nvkm_gsp_rm_alloc_wr(struct nvkm_gsp_object *object, void *argv)
 static inline void
 nvkm_gsp_rm_alloc_done(struct nvkm_gsp_object *object, void *repv)
 {
-	object->client->gsp->rm->rm_alloc_done(object, repv);
+	object->client->gsp->rm->api->alloc->done(object, repv);
 }
 
 static inline int
@@ -417,7 +411,7 @@ static inline int
 nvkm_gsp_rm_free(struct nvkm_gsp_object *object)
 {
 	if (object->client)
-		return object->client->gsp->rm->rm_free(object);
+		return object->client->gsp->rm->api->alloc->free(object);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 24d90910cee0..407777d67431 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -226,95 +226,10 @@ r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
 	return 0;
 }
 
-static int
-r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
-{
-	struct nvkm_gsp_client *client = object->client;
-	struct nvkm_gsp *gsp = client->gsp;
-	rpc_free_v03_00 *rpc;
-
-	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x free\n",
-		   client->object.handle, object->handle);
-
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
-	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
-		return -EIO;
-
-	rpc->params.hRoot = client->object.handle;
-	rpc->params.hObjectParent = 0;
-	rpc->params.hObjectOld = object->handle;
-	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
-}
-
-static void
-r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *params)
-{
-	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
-
-	nvkm_gsp_rpc_done(object->client->gsp, rpc);
-}
-
-static void *
-r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
-{
-	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
-	struct nvkm_gsp *gsp = object->client->gsp;
-	void *ret = NULL;
-
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
-	if (IS_ERR_OR_NULL(rpc))
-		return rpc;
-
-	if (rpc->status) {
-		ret = ERR_PTR(r535_rpc_status_to_errno(rpc->status));
-		if (PTR_ERR(ret) != -EAGAIN && PTR_ERR(ret) != -EBUSY)
-			nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
-	}
-
-	nvkm_gsp_rpc_done(gsp, rpc);
-
-	return ret;
-}
-
-static void *
-r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass,
-			  u32 params_size)
-{
-	struct nvkm_gsp_client *client = object->client;
-	struct nvkm_gsp *gsp = client->gsp;
-	rpc_gsp_rm_alloc_v03_00 *rpc;
-
-	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x new obj:0x%08x\n",
-		   client->object.handle, object->parent->handle,
-		   object->handle);
-
-	nvkm_debug(&gsp->subdev, "cls:0x%08x params_size:%d\n", oclass,
-		   params_size);
-
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC,
-			       sizeof(*rpc) + params_size);
-	if (IS_ERR(rpc))
-		return rpc;
-
-	rpc->hClient = client->object.handle;
-	rpc->hParent = object->parent->handle;
-	rpc->hObject = object->handle;
-	rpc->hClass = oclass;
-	rpc->status = 0;
-	rpc->paramsSize = params_size;
-	return rpc->params;
-}
-
 const struct nvkm_gsp_rm
 r535_gsp_rm = {
 	.api = &r535_rm,
 
-	.rm_alloc_get = r535_gsp_rpc_rm_alloc_get,
-	.rm_alloc_push = r535_gsp_rpc_rm_alloc_push,
-	.rm_alloc_done = r535_gsp_rpc_rm_alloc_done,
-
-	.rm_free = r535_gsp_rpc_rm_free,
-
 	.client_ctor = r535_gsp_client_ctor,
 	.client_dtor = r535_gsp_client_dtor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
index c8d7419b754f..48b432c9005d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -5,3 +5,4 @@
 nvkm-y += nvkm/subdev/gsp/rm/r535/rm.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/ctrl.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/alloc.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
new file mode 100644
index 000000000000..968fb7e01b46
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c
@@ -0,0 +1,113 @@
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
+#include <rm/rpc.h>
+
+#include <nvrm/nvtypes.h>
+#include <nvrm/535.113.01/nvidia/generated/g_rpc-structures.h>
+#include <nvrm/535.113.01/nvidia/kernel/inc/vgpu/rpc_global_enums.h>
+
+static int
+r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
+{
+	struct nvkm_gsp_client *client = object->client;
+	struct nvkm_gsp *gsp = client->gsp;
+	rpc_free_v03_00 *rpc;
+
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x free\n",
+		   client->object.handle, object->handle);
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_FREE, sizeof(*rpc));
+	if (WARN_ON(IS_ERR_OR_NULL(rpc)))
+		return -EIO;
+
+	rpc->params.hRoot = client->object.handle;
+	rpc->params.hObjectParent = 0;
+	rpc->params.hObjectOld = object->handle;
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
+}
+
+static void
+r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *params)
+{
+	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
+
+	nvkm_gsp_rpc_done(object->client->gsp, rpc);
+}
+
+static void *
+r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
+{
+	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
+	struct nvkm_gsp *gsp = object->client->gsp;
+	void *ret = NULL;
+
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
+	if (IS_ERR_OR_NULL(rpc))
+		return rpc;
+
+	if (rpc->status) {
+		ret = ERR_PTR(r535_rpc_status_to_errno(rpc->status));
+		if (PTR_ERR(ret) != -EAGAIN && PTR_ERR(ret) != -EBUSY)
+			nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
+	}
+
+	nvkm_gsp_rpc_done(gsp, rpc);
+
+	return ret;
+}
+
+static void *
+r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass,
+			  u32 params_size)
+{
+	struct nvkm_gsp_client *client = object->client;
+	struct nvkm_gsp *gsp = client->gsp;
+	rpc_gsp_rm_alloc_v03_00 *rpc;
+
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x new obj:0x%08x\n",
+		   client->object.handle, object->parent->handle,
+		   object->handle);
+
+	nvkm_debug(&gsp->subdev, "cls:0x%08x params_size:%d\n", oclass,
+		   params_size);
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC,
+			       sizeof(*rpc) + params_size);
+	if (IS_ERR(rpc))
+		return rpc;
+
+	rpc->hClient = client->object.handle;
+	rpc->hParent = object->parent->handle;
+	rpc->hObject = object->handle;
+	rpc->hClass = oclass;
+	rpc->status = 0;
+	rpc->paramsSize = params_size;
+	return rpc->params;
+}
+
+const struct nvkm_rm_api_alloc
+r535_alloc = {
+	.get = r535_gsp_rpc_rm_alloc_get,
+	.push = r535_gsp_rpc_rm_alloc_push,
+	.done = r535_gsp_rpc_rm_alloc_done,
+	.free = r535_gsp_rpc_rm_free,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 2f6dc4365589..c8694c10cd32 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -25,4 +25,5 @@ const struct nvkm_rm_api
 r535_rm = {
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
+	.alloc = &r535_alloc,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 9558fbb59ae4..6d0eb8e202ca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -19,9 +19,18 @@ struct nvkm_rm_api {
 		int (*push)(struct nvkm_gsp_object *, void **params, u32 repc);
 		void (*done)(struct nvkm_gsp_object *, void *params);
 	} *ctrl;
+
+	const struct nvkm_rm_api_alloc {
+		void *(*get)(struct nvkm_gsp_object *, u32 oclass, u32 params_size);
+		void *(*push)(struct nvkm_gsp_object *, void *params);
+		void (*done)(struct nvkm_gsp_object *, void *params);
+
+		int (*free)(struct nvkm_gsp_object *);
+	} *alloc;
 };
 
 extern const struct nvkm_rm_api r535_rm;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
+extern const struct nvkm_rm_api_alloc r535_alloc;
 #endif
-- 
2.49.0

