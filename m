Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336E2AB2B4B
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B02010E0B4;
	Sun, 11 May 2025 21:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NeeyXDuK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7574210E0A8
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvWGS0t249YWshGFXQDgE16f4XvAFbaPlDMrKwAMpaODni1s3ask9cVzn+0MzuqFFcCrqFqMDLDRQ9XhBiipDv6RIAi8FAPOQFyg/gQNA2H7OZO8tnjupdybP+zleszOw8C+LKrJLIojacY9PQl4hAIcquw5Sun/WBAuI4HA/CsCUrCn+RjrNXr/hy0tIPPjiw2g+8+M7KjWNWfIfBI/x4swMVCPriTlaC2hAAEZnKGbv2r831gt39d04et1xBpMqLn1EluCq6M9XiP1qiAAUkrWtUywwO93oaBFN0XMBNFb+yDIeiZK/aix8W+sSsIocVYHFH9XE3hz8+KfgcjvDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmi1VCQgq+hiPksMPY582l/CLNfSblurWDcoLMzhSHI=;
 b=ogFEuqC0P5UrNr6dWYGR7oCXWAgZQ2r+fHNR6obXD0iSQ1HvMB9vCa9MbmxElY7/l/E3HV4tD6Cfcj+IEec9dUx2Mmtd9XvOPIxEg4SNufW3Zl1lpz06iZYhic7jpJ6rzMXRf76eXVa8qlOnQ/5IhBZ3lmu70pPju1YPl2hOLMvtUY4sdrlqFjoUYPVpQZaDM2+/qmD04QYHKkif1m2rGvRoUpGFpV/D9wgtgRXZcdXhl5cvSQt4mWAXKi2aDkvL8JcYqUrh5HSMyEYktgF9X6eGztV4OErw4Suml5tz7/lSl0h06/CSy4EeQFsvzud0gGufooyplyyPW/WQnDUNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmi1VCQgq+hiPksMPY582l/CLNfSblurWDcoLMzhSHI=;
 b=NeeyXDuKm1A4F/LkxDmoYnYvwXEegOVcSVLG1TnhYfNa8JUtkgvoQyHMypK7BKPXyfuF9hm6JO6Q30MGaDWzCYaZYbQwGQNnPh0XxxjgKSWd/dHlBUuf25QeLDKMcGS8HDv80LjvJzFfoLwjgKTU2GUas+6Bu7Mrj7cPXkseK22vd/HQDBpd9t9hF57RfwrDdVOoEYhJclFOqrwFY52k04BvMPqfPAVGAwdGQoh+V0qczqpzMqdloRZzXTfWAFwlETc0NHFxlG7M5EzBeZ869LjjtCaq4+VjgXG2aIh1wlzY/NPqhnNOMljAW5nu/4EfF1Jx8eLF7bJvH286mUuZrw==
Received: from DS0PR17CA0018.namprd17.prod.outlook.com (2603:10b6:8:191::18)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:20 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::9b) by DS0PR17CA0018.outlook.office365.com
 (2603:10b6:8:191::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:08:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:12 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 07/62] drm/nouveau/gsp: split rm alloc handling out on its
 own
Date: Mon, 12 May 2025 07:06:27 +1000
Message-ID: <20250511210722.80350-8-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bcb2e94-246b-4a3e-e77a-08dd90cff4e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZvVQteJLKk+5fph/W2bBvMErZ7c3ZGxmr6IoBSu5I43vrfvY5WXv1+CwuMSb?=
 =?us-ascii?Q?IyG5/1gkvBt7pSCTtwcIGkAcI5MsmhjB69RqgYxa+Ypaj4oy+14MfZwAaPSp?=
 =?us-ascii?Q?2OIx5+m1uz/o2vhJAoL0v3iP/EUsVsnbGaEkUYDTS49wXhZDiF06D1nZIx+X?=
 =?us-ascii?Q?uQhU9b+SfekIa7iXq1y8gMkeHcUihyocxjzXfL6gjqPiWpgOKaB8wXzA+xJd?=
 =?us-ascii?Q?ue1Rm09Us43eOfNIIdHiEQ0qThywmjTLeluuklt4Degy9Ymf1dN8WnJaRdIa?=
 =?us-ascii?Q?HyztkwPh0dt5xiYcuXNgk/aZyciwQghgwjUwVG75IsbboVP1kzcB1HTxdDuf?=
 =?us-ascii?Q?VI0RezNXimUDzDmjFaS/OXgr8jwLYGyUUIhdbR0VW/qYcbFkvZWMnd0//I/g?=
 =?us-ascii?Q?NKSuXkPwjUm8IqL8hxysYGpGWnResdLnOpEl4uLI/f/1TnwnIgBwkNKrrub+?=
 =?us-ascii?Q?V8OZAWiRL/gDai4OdiHirgcQfjecACx9qx9EW0vLQA3f4G6XU0WdMOa0yXqj?=
 =?us-ascii?Q?gnjZAedoko/WMV7RdrshzJ1lY9Le817jKwViqFCJKVt5CHkGq5ZA2BZLdllZ?=
 =?us-ascii?Q?a8EhOZP1iLOXBxntUXJcz1zHyCjNqzQn0c3H5D083f+VJ2JOg+D52Zv9AE0W?=
 =?us-ascii?Q?Gv2IsTD8AkoQg85+c6z3C8PNYQ8tbnjd0zWPJ3jw6rJvsANbd0L751vGBV2b?=
 =?us-ascii?Q?LoPzemSt142fr48QEq6FEuDLVPd8stpibSAx+RjHOeyjCH5snLJ6R4LhlOWv?=
 =?us-ascii?Q?6Pi2chapwje7u2IdAiRUZXACaGaIxSGTOVcD5n6+U5tEgMcDO8QZi4Cwiz3c?=
 =?us-ascii?Q?gyA7iYLDyDvH+RWQvL0sDZyxpp9+ucMrvamxjL7FIvOKi7ojz0LKwOe0WO27?=
 =?us-ascii?Q?QmESMq8Zhm6SyArw6V/o51cHrBUhTuNdC77deLflRmCR3eZ4sFRGrhGmpCTx?=
 =?us-ascii?Q?nnVmZlk+u5Aenmg8kvi5PJ4JWH+xVxhE4k069tEa2fO+QcL9Kl5Wb15Ixlj8?=
 =?us-ascii?Q?Rxs6Kx2rcdb+c2xszj1fO0UqwYuA41t6Wbl29EODaRvr5DNVUH4hWmfJ5Yy8?=
 =?us-ascii?Q?aR6bfUjr58JcHujWyRpK5VB5KC7emO2zkip+nbIivEYnjU3xi8y+8ZtXS+RL?=
 =?us-ascii?Q?/OydJzLTOQFBvDPc9Hs4pR+AO79iRvyT9XDIM9I4xN6NfeyNEHmKjP2Ef7xB?=
 =?us-ascii?Q?asxw5/LlBba3zSJD+n5a/6QDcGbprrifRyD2zfleLd7jsgi0iAJfo7IyIme5?=
 =?us-ascii?Q?l1HO3vYjlCg8yGppbf2h9Qaf+Qo1Kb490PXi/WB5Q2BtZJRaxoEsSXPed4nh?=
 =?us-ascii?Q?5GELwfT2E1kp9UtsOAkzcddU6lYKEDF9JyyJiPrkjkipa7s94SO+Pi0E5SRA?=
 =?us-ascii?Q?6qFA4vFfLafvpQ67Mk7NVynYGk3B5iQcyRjA5Rs+TFOt0m9ih2tmuV1Gl/xL?=
 =?us-ascii?Q?5T8ka5RuzUQHsq16eftwcgNmgItwGiAbe+8A3Wm++nG3fC2IO9njafPrR2DW?=
 =?us-ascii?Q?klZQet24NePtn4AHA3n5p7AeMZbdKZ4YwGdE?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:19.6373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bcb2e94-246b-4a3e-e77a-08dd90cff4e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
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

