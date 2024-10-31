Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95679B76CD
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BF9310E83D;
	Thu, 31 Oct 2024 08:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vs/x1q0O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26F910E3FE
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoQ7jf8GcWmF7l3t+LGYjZ4InB64cP2e7fzMrOAeEwyrKd6quDfcZscV6mPtTRely+t6y8GRqGpJ3KaCJdhM8S/22K0ljSRMcVkc23OLu5gjSoaPesvU7cS9j5i5ZbTRDMEQOxoEydmyFymWkAWhnHIuSQ4JRLl8Z2FlaSo0lYZpM37y2WbCH20P3WXGk7b6A6OQPSdpy7wC6xsbSlF34m1Lc5NjCmD5je/6iDScQFQoKrzPV1eK3PuBJc1ZKEFnqGpPpVh2+OAZXFwaBaL76u+/NjyBlV072LQEqeOV5DlnA1l3VgAn3khtqfBEh+UYqlEXFI2AsZmTGr32HxoOsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldq2n1KES7wuxIURST88hE2/fdF2kq8fcrklVkc2QKg=;
 b=BxvUHsWUNishEruWLmvTSV2bxCCKHNximDpaMwcB+qcEUpLxRz3PX4ZT3O9DiQgkMUof9oGmvn8yIkZrc/i341fbuuAo1OyqWh0evO76mh4PfSpQQZULPNMaqwxDMRGW5NVwqe66fGEX0uoJgqb4adUrTfmNuYO2SiUXsDIQKPifoZg9o9nCEYBPyDI7UDAOQwo752XM5N5XQHZvgCCTaoS0tU74Ymb02wRahNi3QecsoCdF7umLN69iO8ukptvPJhzIE2Gzq0ItYgAEKrDVEsgZXd4+IAiL8QxkAxT39t0WdRDQs9rD1e71NcIW3iN9jyhql+6Y7hnnQxULb6yoCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldq2n1KES7wuxIURST88hE2/fdF2kq8fcrklVkc2QKg=;
 b=Vs/x1q0O1R/nVC7QFvNsROPDG+DMChSwMNZghoJNOVUK9b17ocCvFPYHXsYT1jXIuOs4ACAZq+NybASyLD0yKGanW0JxFuOlYI5/rDdbwubVh+K2nPbe4g8Idu7kTebqpSdhtsKvIoBwL6BZLZxQFGDre/x58zmE+/nUIkdk/ewMPSIpEqUB7mPhnj4BAmLo7eDWZo8BSLGBsx7A8d54tLxzx9SOKdAfajtgDFQ7MDqtMjsSvWEeL8bqhBxZ/NGWAEcXfL/c3V+Fu+vgh5mJ6JNwdWIkPKAtcvk3gvjNpZAgbm0uxGXNRqcAnEN40M6a3r76Hiuhv3Okj1Ru8W/RWA==
Received: from MN2PR05CA0009.namprd05.prod.outlook.com (2603:10b6:208:c0::22)
 by PH7PR12MB8777.namprd12.prod.outlook.com (2603:10b6:510:26b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Thu, 31 Oct
 2024 08:53:21 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::4a) by MN2PR05CA0009.outlook.office365.com
 (2603:10b6:208:c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.11 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:21 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:10 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:09 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:09 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 06/15] nvkm: rename "argc" to what it represents in GSP RPC
 routines
Date: Thu, 31 Oct 2024 01:52:41 -0700
Message-ID: <20241031085250.2941482-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|PH7PR12MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: 44322e4a-303e-41b7-38f8-08dcf98978d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k2ko+HuSjXg8Tphb7TI+QLsVrssl5uiZMpWFT8OADyVbe9cZjMOLe615dlC9?=
 =?us-ascii?Q?rfVOw60I8ATzp2LdWbO9keNbmy+XgWFwgmP5BtA4I6cvqdhba0aJiGW0Dl5G?=
 =?us-ascii?Q?NZcrJYdtJmQ+fFsSvHKGGC6Tci1yZBcYZmuVubpMMx1PCYpZtoOY4DY7w0KZ?=
 =?us-ascii?Q?p4MP6gziOIG7BPGkOe+GojjQOiWA2mOtFvKowLV316Q6ton5O9BiVM6J2KSF?=
 =?us-ascii?Q?zu75aXOHC6Mf0JgrplunBXtRi+R6U1qqxcq7gutDTeKzkX1Gjyrjq6NHUPma?=
 =?us-ascii?Q?tjjGh9KsFwmodMf2ki6IxbE4IkBxfQnYsYOl/s4dZPZEo1kFJWm+nDTnfbim?=
 =?us-ascii?Q?aHodR/A1g6D37oWH8tSOFQOn2N+2Na689XQi5TJnNCLc/S+uSnTi54kzKJtb?=
 =?us-ascii?Q?G6mHZrYE1mPCXawmmqNCOrDUoOJdDjdpGR+Y6HQxnZVSsk2QnvbX31iHn8ea?=
 =?us-ascii?Q?RV587LnXx0OOZXzKSUccxENcbqUTjNIwsnbCUM8Cpxpe8aWDBhaJ6JUKY3JK?=
 =?us-ascii?Q?LE6h+rtsemliuWj4TwA2rk3Y4pGflU0NhFbhiaBi3puCHhH3BBbGi+ulASpb?=
 =?us-ascii?Q?wj8ciEQwldvFfdOG1tbh1pSVV3FiDwR5e/5feF6kcdw/G0WQ8r4As/hhftny?=
 =?us-ascii?Q?GxHy5QOO1FPrsxQr9UHO3Q8TWxzEr4YLpIQPq3OHfQjnwEtq/eojdSy76khB?=
 =?us-ascii?Q?g90U/z3crHZj9jb3Cpeyf6OQF6Cnk2HeICqSNV47RShccJvBm2rkv89W/rR3?=
 =?us-ascii?Q?lrIaSyQIXwH57k4eQlxTAlrPNE5S/uzcECvHnbw+P0a/YOdBvqROZnr5Groz?=
 =?us-ascii?Q?PCDooR7Nx1WERPzwG6S/rB8ooWDHNgv665WKsRsxRB8b6G5nPAqAfprf18Zc?=
 =?us-ascii?Q?CpH7X8WPMfhojsqOKBIZskMaAa638SbvBdWrtXZmTZ52S+7VKiQlxNu9FMx8?=
 =?us-ascii?Q?pvpoKw3segoZmO+ZZ26LfIKJXVun2Wcaa09tEodQjPTrjUXr8X3g1lC0Hmwj?=
 =?us-ascii?Q?LWji/+pO2loTZqrVUCGceuW+gzd9H4ijy2nKFSvJNSXYzhZ9Ply1P4Qu2spC?=
 =?us-ascii?Q?iywMTDrvAtfPC2CiSVCAxU+Nxy3AqJrR8CqzFI3+nMAWTRZmPmlHIebI69bA?=
 =?us-ascii?Q?Kk1xVmyPF1TbcOQ4f6KFPl/9xu4D8ADtviFWqfV0BpVRtppAcI3QUrvU5y2w?=
 =?us-ascii?Q?5ru8QjsPgfv/YaPVQrWnudlCLRrJzBYcc3mQZWK1k1VK7BQpwa5X1kTDGK+d?=
 =?us-ascii?Q?3ZZ2VY6kCBSnRTuMAvpBJb70mjM9yuRPB+UunAaqLHCcyMNXoci/MnEfNtSq?=
 =?us-ascii?Q?GEX+RWseifwPuAarYCDP16Xo1s0X/Xy3GNowmSFCRTGz9RvyLOpOkRpzNVMb?=
 =?us-ascii?Q?XOJUEFcbRz3lopBK1lqiPxLpg42XVp5DjmAqXzHdizh2KJ13yw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:21.0771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44322e4a-303e-41b7-38f8-08dcf98978d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8777
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

The name "argc" has different meanings in different functions.

To improve the readability, it's better to refine it to a name that
reflects what it represents.

Rename "argc" to what it represents. Add terms in the decoder section to
explain their meaning.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 58 +++++++++++--------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index d00c446e2bf9..3bb6b161c9b7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -107,6 +107,8 @@
  * decoders:
  *
  * - gsp_rpc_len: size of (GSP RPC header + payload)
+ * - params_size: size of params in the payload
+ * - payload_size: size of (header if exists + params) in the payload
  */
 
 struct r535_gsp_msg {
@@ -213,21 +215,21 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 {
 	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
 	struct r535_gsp_msg *cqe;
-	u32 argc = cmd->checksum;
+	u32 gsp_rpc_len = cmd->checksum;
 	u64 *ptr = (void *)cmd;
 	u64 *end;
 	u64 csum = 0;
 	int free, time = 1000000;
-	u32 wptr, size, step;
+	u32 wptr, size, step, len;
 	u32 off = 0;
 
-	argc = ALIGN(GSP_MSG_HDR_SIZE + argc, GSP_PAGE_SIZE);
+	len = ALIGN(GSP_MSG_HDR_SIZE + gsp_rpc_len, GSP_PAGE_SIZE);
 
-	end = (u64 *)((char *)ptr + argc);
+	end = (u64 *)((char *)ptr + len);
 	cmd->pad = 0;
 	cmd->checksum = 0;
 	cmd->sequence = gsp->cmdq.seq++;
-	cmd->elem_count = DIV_ROUND_UP(argc, 0x1000);
+	cmd->elem_count = DIV_ROUND_UP(len, 0x1000);
 
 	while (ptr < end)
 		csum ^= *ptr++;
@@ -255,7 +257,7 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 
 		cqe = (void *)((u8 *)gsp->shm.cmdq.ptr + 0x1000 + wptr * 0x1000);
 		step = min_t(u32, free, (gsp->cmdq.cnt - wptr));
-		size = min_t(u32, argc, step * GSP_PAGE_SIZE);
+		size = min_t(u32, len, step * GSP_PAGE_SIZE);
 
 		memcpy(cqe, (u8 *)cmd + off, size);
 
@@ -264,8 +266,8 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 			wptr = 0;
 
 		off  += size;
-		argc -= size;
-	} while(argc);
+		len -= size;
+	} while (len);
 
 	nvkm_trace(&gsp->subdev, "cmdq: wptr %d\n", wptr);
 	wmb();
@@ -279,17 +281,17 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 }
 
 static void *
-r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 argc)
+r535_gsp_cmdq_get(struct nvkm_gsp *gsp, u32 gsp_rpc_len)
 {
 	struct r535_gsp_msg *cmd;
-	u32 size = GSP_MSG_HDR_SIZE + argc;
+	u32 size = GSP_MSG_HDR_SIZE + gsp_rpc_len;
 
 	size = ALIGN(size, GSP_MSG_MIN_SIZE);
 	cmd = kvzalloc(size, GFP_KERNEL);
 	if (!cmd)
 		return ERR_PTR(-ENOMEM);
 
-	cmd->checksum = argc;
+	cmd->checksum = gsp_rpc_len;
 	return cmd->data;
 }
 
@@ -672,16 +674,22 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 }
 
 static void *
-r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass, u32 argc)
+r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass,
+			  u32 params_size)
 {
 	struct nvkm_gsp_client *client = object->client;
 	struct nvkm_gsp *gsp = client->gsp;
 	rpc_gsp_rm_alloc_v03_00 *rpc;
 
-	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x new obj:0x%08x cls:0x%08x argc:%d\n",
-		   client->object.handle, object->parent->handle, object->handle, oclass, argc);
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x new obj:0x%08x\n",
+		   client->object.handle, object->parent->handle,
+		   object->handle);
 
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC, sizeof(*rpc) + argc);
+	nvkm_debug(&gsp->subdev, "cls:0x%08x params_size:%d\n", oclass,
+		   params_size);
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_ALLOC,
+			       sizeof(*rpc) + params_size);
 	if (IS_ERR(rpc))
 		return rpc;
 
@@ -690,7 +698,7 @@ r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass, u32 argc)
 	rpc->hObject = object->handle;
 	rpc->hClass = oclass;
 	rpc->status = 0;
-	rpc->paramsSize = argc;
+	rpc->paramsSize = params_size;
 	return rpc->params;
 }
 
@@ -733,16 +741,17 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 }
 
 static void *
-r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 argc)
+r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 params_size)
 {
 	struct nvkm_gsp_client *client = object->client;
 	struct nvkm_gsp *gsp = client->gsp;
 	rpc_gsp_rm_control_v03_00 *rpc;
 
-	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x argc:%d\n",
-		   client->object.handle, object->handle, cmd, argc);
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x params_size:%d\n",
+		   client->object.handle, object->handle, cmd, params_size);
 
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL, sizeof(*rpc) + argc);
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
+			       sizeof(*rpc) + params_size);
 	if (IS_ERR(rpc))
 		return rpc;
 
@@ -750,7 +759,7 @@ r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 argc)
 	rpc->hObject    = object->handle;
 	rpc->cmd	= cmd;
 	rpc->status     = 0;
-	rpc->paramsSize = argc;
+	rpc->paramsSize = params_size;
 	return rpc->params;
 }
 
@@ -763,11 +772,12 @@ r535_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 }
 
 static void *
-r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
+r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
 {
 	struct nvfw_gsp_rpc *rpc;
 
-	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + argc, sizeof(u64)));
+	rpc = r535_gsp_cmdq_get(gsp, ALIGN(sizeof(*rpc) + payload_size,
+				sizeof(u64)));
 	if (IS_ERR(rpc))
 		return ERR_CAST(rpc);
 
@@ -776,7 +786,7 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 	rpc->function = fn;
 	rpc->rpc_result = 0xffffffff;
 	rpc->rpc_result_private = 0xffffffff;
-	rpc->length = sizeof(*rpc) + argc;
+	rpc->length = sizeof(*rpc) + payload_size;
 	return rpc->data;
 }
 
-- 
2.34.1

