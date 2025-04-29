Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC82AA3C75
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259AF10E54E;
	Tue, 29 Apr 2025 23:40:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OYlrkbx0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A09E10E54B
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTc5Sl+y2KfCwOdJnTqRP7m8m8Rap4YKb+m9SnSTq3clA9dwYQNrH5VOs641tziZy3G7z7ukK8WoObkWYawGL3GkG2/oCuu5xW7sCzRcuJ/1SxxWle/Z0DyKWhggn5AqCkK3rRwj7Fqd0g6IIGef3iJYjC9iNgrjgVhXIJPL1WK5XbBG+mAzey3084gnedd2636Z3pkS5aDi5LGMYofIZTaglCf3n+0eKpEfQVnKSlrBktPfkKmdEP4jSKiNolhnn0+FdlEU8RJp/nItMhacFF19aP9e/7JVAQPKvhakKCtgPSc2jyeMsC0n9paqzt202bG+P219wV3p8Lrvz5h2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KiiyWYftQXjOB2uDGWHeQYO6tOfjYGfjD8BWAdFhKHI=;
 b=njWmkm5mBPCVEM8g9huPadlVldk11qvWwEIiN6oNeBHsxTA1kk8b8RW1nsHyLQLnXyiHNZwBZf95SgJGf2AKYh+vVMUbcU1ifStD4COlp592mAa/DHT9nthbGhQp1KdMktvwTk84qp69MhsjDiUfEJYkpmlnFq/WTYVw8U29ik/i0h04qSu7JW7UV61zV07UDplCgyGecbh9644p7d4CA3mFENc9SgkJbThP2z+NfK7Jsu77xJ8q7+C5S6iT6jUreFKr1eFKfypSkKHp5bUrSWKrUyZ7wi6vDjImcnwceFeEy5ilvEHJ+YonV/+4STr6sArnLxhdXW+BqW2bBi2gtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KiiyWYftQXjOB2uDGWHeQYO6tOfjYGfjD8BWAdFhKHI=;
 b=OYlrkbx0RCKmNaKcs+kkQhRVm023eXPbW8pr611Id8Gc8BgVtetrV7y4OcTgePu2m7rE12oxCsz+cyYu/C+OKQfUwyMlze7Xyg6MzGQOIvemzSDlVbGlhBYA+isN7toSH5HSXhBCc4ETjx/0GK/uLp9lCnxV1MFFHOS189zHTvqXdlsgjgU0aZ8hWaY/bKRZwolEGmcGHcOjfaLar4zfbxnvuI62KUqY5FTB2ucuPxRmsEMCa91gQdncKrSnNuqirhanqJpqo8iZcrt6qWnI8d7br0IuOkSs2CvFsIe5ty1DBfq/kMkKD+HDXAAjompVGRKg0EQDx80QPtzczJS+Ng==
Received: from BYAPR07CA0029.namprd07.prod.outlook.com (2603:10b6:a02:bc::42)
 by CY5PR12MB6383.namprd12.prod.outlook.com (2603:10b6:930:3d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:39:59 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::16) by BYAPR07CA0029.outlook.office365.com
 (2603:10b6:a02:bc::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:39:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:39:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:46 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:45 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 06/60] drm/nouveau/gsp: split rm ctrl handling out on its own
Date: Wed, 30 Apr 2025 09:38:34 +1000
Message-ID: <20250429233929.24363-7-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|CY5PR12MB6383:EE_
X-MS-Office365-Filtering-Correlation-Id: ee967095-847d-4444-09d0-08dd877727a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e/igSxIqCKrb7sB0CL37q/ZBSxC7KbBt86wCn9rdxDRIlHFdG3H20dIkEmu5?=
 =?us-ascii?Q?QcPIbclVXbOgG/m+pqolRneIgCtGkfZx0gmg+a3+nYg92++7OcQHF6r4b/A8?=
 =?us-ascii?Q?cpMJqXJsVdqg36CXLIzlj70Sy9PXtwXK/ha7c0pWt+Uqq+53xJm9J0KfIngk?=
 =?us-ascii?Q?s0R4K5uEGcHTW0cdFvcjYXo6vMiiaqnxBvBYU8x/6E/wu3hWPD+SWtpPuLB5?=
 =?us-ascii?Q?gAYm2gSLCgkEUPk4QPP+DOimHWvMZnJ7vMQLY5i0JNqMJo/gXfVJuzHx9ANs?=
 =?us-ascii?Q?CALeBVFoYgV9WxfeztNDYFkxeRvy+o8z7e0kcMdHl6YYOwDwUmurcPl4VyBo?=
 =?us-ascii?Q?iPeAAzJIqFd7vwxkU+ezi+Lw31STDcoTnjlloJLD1iHWXcKSabkiEm7l3R0L?=
 =?us-ascii?Q?+LaU/paos1vxBd1oLrQVuQfieKsaAWFVGuJDASZ7gzdOj4DHayz9SBiLG6zK?=
 =?us-ascii?Q?8AQlDVM6MWrlxNFeZL8rBX46eT9VHysxQDWxH+10osOWoHnK3REmBZwfc+pZ?=
 =?us-ascii?Q?xENybCfouEJYSp8QQ4KnPJSOZbwPGVCc/oPUQEjen8N1v2iK/JfZf6VauBMH?=
 =?us-ascii?Q?ovnCURJWRekQY5bcpoabqq7TjD/jvsZvq40g1ms/WLfauYo3K9WKcC0FVSnb?=
 =?us-ascii?Q?sb2eks2wP2MePfNWeNECow1NDtNqFoiL4XDb2OtFuyI/70xVVPC4cdvco4by?=
 =?us-ascii?Q?FZ37GVxhyUzL05ct2MzwmumwQahv5JhR0CHsPHadLGqMlygiKW6LZuVwgtdZ?=
 =?us-ascii?Q?76cJ1QY7hl2nibzIKPGPRTxd5DC5/iWUvP0GperStR4Itp9940yjjbfpaKoV?=
 =?us-ascii?Q?I623pCl+ACgWBtTf1IzB4DY5JFCNr3nW5eHMjcfXMJ5TPmxFSzog39txOshf?=
 =?us-ascii?Q?ZVFSrQ5jJcD7KZbaP+bF1atw2LjUqIFgCvDF+87zmaY+YvNlADKCMkMkaNRn?=
 =?us-ascii?Q?5QTD6Gj5fvnOEKKWZSwgkMb/E3eTTmVnxa+HvCOQp7CZXVWsIIkGQLcx89G6?=
 =?us-ascii?Q?EjKQkX53SuWgE3CST3VEDsv+S0xNJhz+Z+/jcCbgcnNpmBZwFvrW3VS/+6Xx?=
 =?us-ascii?Q?FW4eWvkaQUrGKPhb+dxsGi2SWcxmUsJow97VjSNyNChWtbTSYA4jyj1qUCE5?=
 =?us-ascii?Q?p/J5de30LaWnoDn7364xUUuz8joU2/CE8QBt0DmoN/hzkX2gjoZfTmNhNO+0?=
 =?us-ascii?Q?L8jqkWh/cQ22bmpLSM5lSR8EXK4MF3DxbGCzFEhO3comlaWY5frQb5Ybtsc+?=
 =?us-ascii?Q?T3nYYm5GTECDK3c9cpUaQ81ZRLkFdrAGRRntCWI2FKfTsV8WpQHOdWNicXvF?=
 =?us-ascii?Q?0h/1zfwu7xRhPlV75VlfMCCpe97+BE9/jTmAgMSPVVuo7aaixhtxcBuMaJN9?=
 =?us-ascii?Q?czwneuutayljAS5/ZVtC3vH6qeaGH2Y3F0s5sHF9W49Az7LVufYJst/flqr1?=
 =?us-ascii?Q?l1V9xw8cQsmwseeu9cxaSu+lcLb5Z0q3EVdwR0BfTKB9RwVu59KNSej8PvKZ?=
 =?us-ascii?Q?BLEseb+4w/wjFeiToHiiCYV2sP3VfnIzDTFQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:39:59.1695 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee967095-847d-4444-09d0-08dd877727a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6383
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

Split base RM_CONTROL handling out into its own module.

Aside from moving the function pointers, no code change is intended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 10 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 66 +------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    |  1 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c    | 94 +++++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  7 ++
 6 files changed, 107 insertions(+), 72 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index b543c31d3d32..bc2cf837aa9f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -212,10 +212,6 @@ struct nvkm_gsp {
 	const struct nvkm_gsp_rm {
 		const struct nvkm_rm_api *api;
 
-		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
-		int (*rm_ctrl_push)(struct nvkm_gsp_object *, void **argv, u32 repc);
-		void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
-
 		void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc);
 		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv);
 		void (*rm_alloc_done)(struct nvkm_gsp_object *, void *repv);
@@ -316,13 +312,13 @@ nvkm_gsp_rpc_done(struct nvkm_gsp *gsp, void *repv)
 static inline void *
 nvkm_gsp_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 argc)
 {
-	return object->client->gsp->rm->rm_ctrl_get(object, cmd, argc);
+	return object->client->gsp->rm->api->ctrl->get(object, cmd, argc);
 }
 
 static inline int
 nvkm_gsp_rm_ctrl_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
 {
-	return object->client->gsp->rm->rm_ctrl_push(object, argv, repc);
+	return object->client->gsp->rm->api->ctrl->push(object, argv, repc);
 }
 
 static inline void *
@@ -353,7 +349,7 @@ nvkm_gsp_rm_ctrl_wr(struct nvkm_gsp_object *object, void *argv)
 static inline void
 nvkm_gsp_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
 {
-	object->client->gsp->rm->rm_ctrl_done(object, repv);
+	object->client->gsp->rm->api->ctrl->done(object, repv);
 }
 
 static inline void *
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 53a4af001039..24d90910cee0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <rm/rpc.h>
+
 #include "priv.h"
 
 #include <core/pci.h>
@@ -304,75 +305,10 @@ r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass,
 	return rpc->params;
 }
 
-static void
-r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
-{
-	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr(params, rpc);
-
-	if (!params)
-		return;
-	nvkm_gsp_rpc_done(object->client->gsp, rpc);
-}
-
-static int
-r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
-{
-	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
-	struct nvkm_gsp *gsp = object->client->gsp;
-	int ret = 0;
-
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
-	if (IS_ERR_OR_NULL(rpc)) {
-		*params = NULL;
-		return PTR_ERR(rpc);
-	}
-
-	if (rpc->status) {
-		ret = r535_rpc_status_to_errno(rpc->status);
-		if (ret != -EAGAIN && ret != -EBUSY)
-			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
-				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
-	}
-
-	if (repc)
-		*params = rpc->params;
-	else
-		nvkm_gsp_rpc_done(gsp, rpc);
-
-	return ret;
-}
-
-static void *
-r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 params_size)
-{
-	struct nvkm_gsp_client *client = object->client;
-	struct nvkm_gsp *gsp = client->gsp;
-	rpc_gsp_rm_control_v03_00 *rpc;
-
-	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x params_size:%d\n",
-		   client->object.handle, object->handle, cmd, params_size);
-
-	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
-			       sizeof(*rpc) + params_size);
-	if (IS_ERR(rpc))
-		return rpc;
-
-	rpc->hClient    = client->object.handle;
-	rpc->hObject    = object->handle;
-	rpc->cmd	= cmd;
-	rpc->status     = 0;
-	rpc->paramsSize = params_size;
-	return rpc->params;
-}
-
 const struct nvkm_gsp_rm
 r535_gsp_rm = {
 	.api = &r535_rm,
 
-	.rm_ctrl_get = r535_gsp_rpc_rm_ctrl_get,
-	.rm_ctrl_push = r535_gsp_rpc_rm_ctrl_push,
-	.rm_ctrl_done = r535_gsp_rpc_rm_ctrl_done,
-
 	.rm_alloc_get = r535_gsp_rpc_rm_alloc_get,
 	.rm_alloc_push = r535_gsp_rpc_rm_alloc_push,
 	.rm_alloc_done = r535_gsp_rpc_rm_alloc_done,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
index 21c818ec0701..c8d7419b754f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -4,3 +4,4 @@
 
 nvkm-y += nvkm/subdev/gsp/rm/r535/rm.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/ctrl.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
new file mode 100644
index 000000000000..f3f0fcd22cac
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c
@@ -0,0 +1,94 @@
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
+static void
+r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
+{
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr(params, rpc);
+
+	if (!params)
+		return;
+	nvkm_gsp_rpc_done(object->client->gsp, rpc);
+}
+
+static int
+r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
+{
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
+	struct nvkm_gsp *gsp = object->client->gsp;
+	int ret = 0;
+
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
+	if (IS_ERR_OR_NULL(rpc)) {
+		*params = NULL;
+		return PTR_ERR(rpc);
+	}
+
+	if (rpc->status) {
+		ret = r535_rpc_status_to_errno(rpc->status);
+		if (ret != -EAGAIN && ret != -EBUSY)
+			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
+				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
+	}
+
+	if (repc)
+		*params = rpc->params;
+	else
+		nvkm_gsp_rpc_done(gsp, rpc);
+
+	return ret;
+}
+
+static void *
+r535_gsp_rpc_rm_ctrl_get(struct nvkm_gsp_object *object, u32 cmd, u32 params_size)
+{
+	struct nvkm_gsp_client *client = object->client;
+	struct nvkm_gsp *gsp = client->gsp;
+	rpc_gsp_rm_control_v03_00 *rpc;
+
+	nvkm_debug(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x params_size:%d\n",
+		   client->object.handle, object->handle, cmd, params_size);
+
+	rpc = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
+			       sizeof(*rpc) + params_size);
+	if (IS_ERR(rpc))
+		return rpc;
+
+	rpc->hClient    = client->object.handle;
+	rpc->hObject    = object->handle;
+	rpc->cmd	= cmd;
+	rpc->status     = 0;
+	rpc->paramsSize = params_size;
+	return rpc->params;
+}
+
+const struct nvkm_rm_api_ctrl
+r535_ctrl = {
+	.get = r535_gsp_rpc_rm_ctrl_get,
+	.push = r535_gsp_rpc_rm_ctrl_push,
+	.done = r535_gsp_rpc_rm_ctrl_done,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 943c932623b6..2f6dc4365589 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -24,4 +24,5 @@
 const struct nvkm_rm_api
 r535_rm = {
 	.rpc = &r535_rpc,
+	.ctrl = &r535_ctrl,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 7a0ece979167..9558fbb59ae4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -13,8 +13,15 @@ struct nvkm_rm_api {
 			      enum nvkm_gsp_rpc_reply_policy policy, u32 repc);
 		void (*done)(struct nvkm_gsp *gsp, void *repv);
 	} *rpc;
+
+	const struct nvkm_rm_api_ctrl {
+		void *(*get)(struct nvkm_gsp_object *, u32 cmd, u32 params_size);
+		int (*push)(struct nvkm_gsp_object *, void **params, u32 repc);
+		void (*done)(struct nvkm_gsp_object *, void *params);
+	} *ctrl;
 };
 
 extern const struct nvkm_rm_api r535_rm;
 extern const struct nvkm_rm_api_rpc r535_rpc;
+extern const struct nvkm_rm_api_ctrl r535_ctrl;
 #endif
-- 
2.49.0

