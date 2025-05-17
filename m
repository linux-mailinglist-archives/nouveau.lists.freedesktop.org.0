Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F50CABA700
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1985810EBA4;
	Sat, 17 May 2025 00:10:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MHcn+jww";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A492610EBA4
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guyxJ2zC0ZEzArYv0tX7xR4vBUyLs/zoyZdf2HKxMr3dYZV7ZXdqaAgOIATPIZ995ckEKNVO1ymmqdA6n2mVi24Nu3Qt94zaFdGeWAVyBIVsQUXsON8n5DKoARFTmCRCPJmoaoqf0VdjsaGIxYi79wGa1TbjgzKSMnUkV69FHw5vLjWtrHpvCUNS2ZF/zpRPwlfKlqXvtUeDOY9yJEBqn0U1HB3vP7+B+/p7dQ/D7fOVBV40s2ygxC2gFTIQjFqoEWmdebTtn1E3iWIf0mnyX+K+RD7MD08KTjnqQV/y+XZlkdwnCDGLoo+o9GHs7SL2cn+BJF8WiCkwvEzUDDlsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hi3MhFbOQaPMKVSc3vKE2r/XWjANYxoIPgeFQB8ZA4g=;
 b=mAz90rGCYcaMilYeZhwxicqFi4PKYRHWe9xNHirCLKfm2jqb6+q8jvYLVCFK1jUNGLSbTOJ8gB/XcsJgxJELPwFmi/0tAn7r1h2vskLA5L0gH5Scu0Z69jC5dNEWSlu1wWLsieuHp+HkMhSREvX82k4jyExUVhTDmpr07yLclYd3X+UDG88iCBe6ts6Ahf9vToEXGoSqsC4TZaWSPb0zvwBqyA+CinJjgKIRf82PYi3+FhTb4zgqkETYnppEYmOUDNHojDqXr1zqiTCITT45UtXaxZSqKeZWrSTNY4aaImfBX/2GqBEhCmV5l7mInom+1Q06cIOts6OmNw5PygDV0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hi3MhFbOQaPMKVSc3vKE2r/XWjANYxoIPgeFQB8ZA4g=;
 b=MHcn+jwwjmfOZO/BuFulMwA0FvcO3tv4zSEml16vTGF+Bdv74J/zELJ7R3qEhB1L7SdD5sHepSz1dnU3RUvhPMUTQOmkIb1g8VWTLqp/Q6HOzYIe3GJ8da5khui1+vUozRaH5UazYDKnmO8t/mvm8FyXRq3DD5NvXHcjVF92efE8AEZWQKZcYnkDyegP98y6usXuWqZv44BvOrd8FhvnKDmegXtYpaTYHG0jPqL5kfPZmnYQ2NlzhX4ghAnQ+aiJ0zrAgc8fi7UkrYVZJ/TOSxqyfxh6zmB9UoKwGwS9ffqKbGStgESL4S2M/rGdb3Yzd2fIgHMIsFBEONXZ2Ss7JA==
Received: from SJ0PR03CA0294.namprd03.prod.outlook.com (2603:10b6:a03:39e::29)
 by MN0PR12MB5857.namprd12.prod.outlook.com (2603:10b6:208:378::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sat, 17 May
 2025 00:10:35 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::d4) by SJ0PR03CA0294.outlook.office365.com
 (2603:10b6:a03:39e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.16 via Frontend Transport; Sat,
 17 May 2025 00:10:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:20 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 08/62] drm/nouveau/gsp: split rm alloc handling out on its
 own
Date: Sat, 17 May 2025 10:09:00 +1000
Message-ID: <20250517000954.35691-9-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|MN0PR12MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0e4a83-ee14-44cf-4600-08dd94d73f0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9YWC1pnT3+b3R5EL67WXL2gi/GBmT8b93PHG8GeI8LOzUrqT9f9W1z6zEu7F?=
 =?us-ascii?Q?BjGwSPVoYhP8yoHDHLAz0ZHSry71AKSRuor4xCQUByz+aEUDd9sI1BNxwZ9r?=
 =?us-ascii?Q?D3FkZMIw1pzxbBORb6GP0zw4vKPTGzKrjoJWllNCQq3aGRrep6wsymlSZeNa?=
 =?us-ascii?Q?dOHRanioMWB7cV2r1uEYQAEtjbSTlPIlPkQvsb3SXm5IxMxkPfpPDsfDcl9k?=
 =?us-ascii?Q?eO/Ebcjxi7BtJYksID1TS7Q655LS8oDuOw7yDwppE5aUYPQWQ/4uWRYK4Rf6?=
 =?us-ascii?Q?1eCNtynPa/bIRdv5DS7QeRnR3IE+G/4glPgMUAi0TmohD96dRj42+9kqIBJW?=
 =?us-ascii?Q?b5m84ctzbiAFpjaXLef6FNAlPeJtLXf9W4+WCdHB2ysbUKrukyWuE3UECI8h?=
 =?us-ascii?Q?cnt6RM193NXQviF3JMMSBOsZFfDF8E/CjP8YkxQpKOCOWffxIDx5+Pb711em?=
 =?us-ascii?Q?zUgBEVs2noXZSGjruetnJoL0yOqxDvHOmBshm9OVwL5tJsr+fIRujSmK/F5Q?=
 =?us-ascii?Q?yt7r3U0xWF7SF89Ahven5w5bUTl+IXDWyKK4Vi5lIcXo2CrHMVnOBxKvQ4Iw?=
 =?us-ascii?Q?kjz9NbP6+WR+HZuy/Q79Kwd5tL8bc5qn5w4hskPl85MvJApZ9Ca7/6snLjdw?=
 =?us-ascii?Q?K+Z7MLwlqBRkc3qqzpstyt27JIXykx/FBMRjPgebG6P27AM0uolMuxGpkqFP?=
 =?us-ascii?Q?SZEV0cwSwee+Ng8uL2RGCYAhz+yj1v7xqf6SOX+w8EUBq93W9CILUQD+OpoP?=
 =?us-ascii?Q?RP2BJMhqgq4MpsrtSWv1Gh/zJRMF6D2ldjDfXg9CXMQdfEYy/IcS7Ne2mdjx?=
 =?us-ascii?Q?mHCedYoR4NJYIvEVgUAjfPG/APkfAkuVRgpfgyD7+i59trySK6o8chmg/7TV?=
 =?us-ascii?Q?ECFtqoOw+0WPpOHrWNfcfbePaQMhWy0I0CtO4I2Tc+PFZ9EXqzuxsYxo9vEa?=
 =?us-ascii?Q?hqcNWJ2GzjgheJebT+e1xHDXD84Yq4e9LwAGmPx7eNj2UCc3y4TqkC1icbDs?=
 =?us-ascii?Q?FaiBEIZTiJqoGeLcZVNUzFF+7/LfaSoR+5hOgqdtVi9vl7bk7UY8T2ZSKehv?=
 =?us-ascii?Q?cJhLfOtUqcYuvqYc7EqwkRIMm9BD0V51HQk7mPYxX+RkeSG4VOMmfzKwFeAT?=
 =?us-ascii?Q?Dv8j1t8LFNExBkuN1qMIUL2G/edX4A1A4leAljzCGaAIu5Bf9cjm/Vc6vbW6?=
 =?us-ascii?Q?LRrQa2YUaJhhRYQ37HUD8X2J0QSyhDQy3beb3wvqN5SusjBdp/ON8JXT7kZ+?=
 =?us-ascii?Q?e4URAwO71vSfCWF1NSnAw7YRxpt0Xd0d9ZC2k/1BXzRqGRMYjmB6GBwE6gdh?=
 =?us-ascii?Q?cfVGRLEG/ekuMG3myG+l6acWxt2ghP5t7j0OIwa2920NjwMf6C8gO1iMXR1N?=
 =?us-ascii?Q?PvOOmy1+4/Mt3PdSOpBcyMaYz3nQx6f4zLq+HXiJaOUZY+V6SOKxh4Uyrs0n?=
 =?us-ascii?Q?T8DFwzb2MvP7FohsLzfQHwEuSdkY+BmottKjJGHoKe05QevhMoa+n0/KesMV?=
 =?us-ascii?Q?F8l5RwPP7ccClp/NEFkIrGJcyXQGu0crd2DR?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:35.2108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0e4a83-ee14-44cf-4600-08dd94d73f0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5857
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  19 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  85 -------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |   1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/alloc.c   | 113 ++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   9 ++
 6 files changed, 132 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index bc2cf837aa9f..66e3873155f0 100644
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
@@ -416,8 +410,11 @@ nvkm_gsp_rm_alloc(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u32 ar
 static inline int
 nvkm_gsp_rm_free(struct nvkm_gsp_object *object)
 {
-	if (object->client)
-		return object->client->gsp->rm->rm_free(object);
+	if (object->client) {
+		int ret = object->client->gsp->rm->api->alloc->free(object);
+		object->client = NULL;
+		return ret;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 4797a92708e9..e9be8c2ef07e 100644
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
index a3ee277a999d..f6fcd89ec502 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -8,4 +8,5 @@ const struct nvkm_rm_api
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

