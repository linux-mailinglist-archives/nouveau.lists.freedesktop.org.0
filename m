Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9844BA1BC16
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B15810EA0B;
	Fri, 24 Jan 2025 18:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SnVQN1AV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6279B10EA08
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAKZX4edvGjbJ/XwdECqMuNZ78uO4OzTgGeGeOFwy0sKuC/tKN9K9W3KeUwofV37V2Kvj+XWQnqv+2d9R93/wUG6EVzRqIf09l7/YNMG4QbwGrdTtgUB3qBLsLihotMSduhTjmKqEIk9zoVYv71Z33ehirXqSUZzMm8YZpGSyqLvIj+u/FJoKfcQz18KHeqRXf5jlYUWy2CGVsu5qklKoyVAHZr8EmwvJMUgv7tjOrdQY6qNRoDkvG7wFKkz0sK/gt2MetU/35WVsSJZTsIsKLlXuf9f6s6RQbjTdt94NLc9R2Dz53FYMqYQ+FPTLrQneq0lVSOyZmtItxEOfNtB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWuwt3dbAaYYARws18RGpCN8Si+npr7sDPP353z9QzQ=;
 b=h76yhibQHnozyZO9fd3RhS34VQ6Xfx5qn2tXSleOtVY0F3bJkWNo2HdJ5jQd2Qb3iGyGBeXWztdENQpw9oyadvGyUPy6yXGsKBt9QyNJxgEnuMf38nSM013mqKveGkOwcgPPJFufxWTb7WRQlBfAF6rhYZs68SzRxySc/Okuee3in0YizelnEnZTjk8t14FwL+qX6bWsfEN+RFPnPcHbTcWKqdrkL2LHCpTHudLp3/CkJq3SIJ5/bxGpUFlifj0C/iFMQ5JV2OScYldk6w6w2bSLz24AhXyu2WpHv3wrnTwpYRCZtDuTnT4fJEoy6yGAQcESyuQ9nhw64NNxcLEXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWuwt3dbAaYYARws18RGpCN8Si+npr7sDPP353z9QzQ=;
 b=SnVQN1AVZ+hkgAeg0CIoo6jgPJLzIw+5hfr9jBHnitnUBblt8xnZv9/CUCQkCxhuyjCWE1gydoNtB5RA+fyLpzytDpCGbZrY6XZ4JMM2jrUt1oYW+wpDQP02JJvYthvtmV5EvmG4gWgisLmFrn587F0K/goxWJtcG6nGG/SC7R8GkUkov+93vARiY0Z4QIkbcPT3hqk75jjxRssoO4t8ur9hKAT7HBpdhAziRfICAeZU8wBpyoGSR4mII2bzLyUc0qrqIzWauMB3vVJr5466ZO4fK1a3SNpiS9IEJDmOSiiK/AgcmnH9FB/zBcQzzJYSOIoT+7PGlyerm3LQVfIeuA==
Received: from BYAPR05CA0081.namprd05.prod.outlook.com (2603:10b6:a03:e0::22)
 by IA1PR12MB8405.namprd12.prod.outlook.com (2603:10b6:208:3d8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 18:30:43 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::54) by BYAPR05CA0081.outlook.office365.com
 (2603:10b6:a03:e0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.10 via Frontend Transport; Fri,
 24 Jan 2025 18:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:28 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:28 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:28 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 06/15] drm/nouveau: rename "argc" to what it represents in
 GSP RPC routines
Date: Fri, 24 Jan 2025 10:29:49 -0800
Message-ID: <20250124182958.2040494-7-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|IA1PR12MB8405:EE_
X-MS-Office365-Filtering-Correlation-Id: 02352607-2fd9-4424-63f1-08dd3ca53593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n6Zb5XU6XzN7Fvy/ak++S9jxb3iqLwIfudi4AjiYlUybbAYXC8otPivwMZfO?=
 =?us-ascii?Q?xzbdXRq9zywjh0SQ0IrPJxH5NILHXIvS1DcwuBOuGlhy5zQyeRVrng0B8tpW?=
 =?us-ascii?Q?mL/xYSnmn2cF1SkWXRFjE4+woJGLqYzncA+D18thAIAqndRsCaTY9Hiyi7NB?=
 =?us-ascii?Q?Ayg2njiDXcLKOk+xJcb0DgZ+p6RjV/N6slYz349NnddHMl3pLR2Rr9ulMpIV?=
 =?us-ascii?Q?ic9n+/VnkuDSe2z9RDN0IkZDCHRSxOEFs2OzI0vfb8niKCHTqqKhOK7uri9P?=
 =?us-ascii?Q?z9P+OQzJNTtx3eZTg+F6F2kW2bDFtTCFfY7CaUUaG4XPsv14tmQp4/TOZ8v1?=
 =?us-ascii?Q?z+6XA3FXVzyRByZ2aJVEbfUIOtts8T0DzMaw6tJoNDtO3rpXHZwZNPkuohgL?=
 =?us-ascii?Q?OW+gIhTEgN5BO9cJmlNcDKeoutfXTSVNpOjf0Dfdz9GFrESZaT/376fxI+sd?=
 =?us-ascii?Q?JPgL0EtrVHx1srrkeSk/myNLRI3HJ0xWZ4OhJ6GmKPcizBKGj9NYzEhO56LR?=
 =?us-ascii?Q?wIHQ7bt5z8ImlAVbAdbykBQFJ0kyKdZonTf69VEAj96Q45ZwPZ4aSqlI8C3d?=
 =?us-ascii?Q?jjkSJQKgMz6AiCayblSebcQh4nI4qZB0+TDXUOpGnHJeZQPUHALxdiwB+6WO?=
 =?us-ascii?Q?59jOttXDyuzIewP8NTN/PNSdst8HXtxV8B8d7fiD5lxcSO9rtRGfRv8alejq?=
 =?us-ascii?Q?vogUo+S/H0t+Kgn16MO8iI9OpW9bqi0mj3VtCn6Okze8FaRy4BpEoCjZ2ZXp?=
 =?us-ascii?Q?Y0aGL7V7lBn4F/I649dWnaZHvNfbAPunFIl41rdU0R+oXiEDtH0Ewf+dtu60?=
 =?us-ascii?Q?Ln6gnyHZ8JGfe85CKKgknDffroPeqM4iub0gNSw2ZzO96Fbd50rBh29WznU8?=
 =?us-ascii?Q?VjK0QYpjA9jsONSOHaZ9swGJ7LE8jBmSTJDfFoDi3H9HheRvJXPYTKiRH1Dd?=
 =?us-ascii?Q?3CzNu2/LnPFy4XcTpXCnjMdsRwGBA7+Jmvg/i2QozklogqK60QJibvxuY1ir?=
 =?us-ascii?Q?cUOpVSzEWCaYmGnrLl5saj74oEynrVzzyS/r2SkU4chM21xx5N9GlH7ZTOFm?=
 =?us-ascii?Q?xXdg1FaGRV/1rZTAFZJ114vcqrP2obyt5UDZq5o9uzEf9jJdfB9Fwl9gYAO4?=
 =?us-ascii?Q?wQi2jIXgWsS5dL5fboO4R8urKtMVhSuCZzOn4ZrTFMY1EaoiSxY+yFX7RLkI?=
 =?us-ascii?Q?38oZeMJiVJyO0jMSOfyZt7srrcsTAYab6NsgIJOi8OFb2SP/KCMKiVM+UM92?=
 =?us-ascii?Q?UeVnMDrWyWpYj1l/snR9doXcGyf9bFji8nLGZ2znSjPvizVBuhYoESQcuMWd?=
 =?us-ascii?Q?FAq+knNkQD5XSnKdaGkLiuu2fsdL1L7QxTZ3F9YoGpvD4O43MeFdvLqf0Ems?=
 =?us-ascii?Q?stYwjNpu08D7v8miQKCsMFwxvtPphH1IV2oqGKi7oZV0ryR8jd9cQLbc68gS?=
 =?us-ascii?Q?jw25TLebjOLshp5NWD8YUGgqJmOsPxwDfws8qboKDxDv2arR+Eixo/fUiU5z?=
 =?us-ascii?Q?Xkmob03BC4BG3Bo=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:42.2288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02352607-2fd9-4424-63f1-08dd3ca53593
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8405
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
index 3bc5f25f1e8c..92daed69cd46 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -109,6 +109,8 @@ extern struct dentry *nouveau_debugfs_root;
  * Terminology:
  *
  * - gsp_rpc_len: size of (GSP RPC header + payload)
+ * - params_size: size of params in the payload
+ * - payload_size: size of (header if exists + params) in the payload
  */
 
 struct r535_gsp_msg {
@@ -215,21 +217,21 @@ r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
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

