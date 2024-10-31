Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6693E9B76DF
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1406C10E162;
	Thu, 31 Oct 2024 08:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WAJzaL50";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFDC10E405
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puEPJ15eE7osJnv+UpPjWV3X4vt/EQi86b88T2G5gATwk0aP2k1/E3Sre1aeu/Sr2BTGI+jpZVEo3cBJJxW5Qg5jiHHQcJLEujwXdcJ9zeY0qbsbjg7rCIRFg6+tt9H89POwMqZmrtRocyoi17vpU7fqUldL0IMTlqTdzCwKfOtNspIMUQghx9nL4OOo6V/cJCS/9azftaSsHzrbfqWU4dIdZlNUnaizukvfjVUj/zvVTmjOzieZhhxUCn3d5cCKQC1EsRV5OEtd8So1INZmAwFc3WV0G9kvJONAs2lChZYnMMMaCcIlKvb0mxHwAxCTDmFRX69IMmRoXod0gbqG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVKwoz89by2228rOsyEw0j9xW/4GkXF4E8L3TSrxuU4=;
 b=I5/2GQEXzuLLK6xopIKbvHnSwqr4rodhMPA9WufR5q100sNghS5RHHHnib+hVN/lzwSbSD8QGVx2iSbd5fX+3uNpfU3yi4tR74qF05XCJRJtXHrlNuh4Ar1gITNanzmQXNvJEfdDSF01nMJbK6ccu/BnsJt481/QkF3Z5JvnEnaAdj6YdFC1E3qv0T4oHcItVYiO1PLHs7ZX6xktLOdL9TvanI5+Uj7FVOBlkwL3hi5ag59RtNicLU5hAz3VZ2PRjkDMfYBPBhsb/FYiUr/cHEE+4EN9fUhkD0Gjy8mMo0IRDudb4AbBKD01g3KvWXeutrhFPrzy0ONZEDckQaz3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVKwoz89by2228rOsyEw0j9xW/4GkXF4E8L3TSrxuU4=;
 b=WAJzaL50hOuHb5dFdjd6kR59SGamLEtRPr6xzam+TsiRceuPU5YA1J0222Cdj6k4spc32rRBy02Oth7InJ54b+/B3o5NseRXcms5nFv7PhSWA/HQej9/bYwsJH3lUMOM49eUHzFApJrXiOQxnuT0LyJ8QtcV9adjzzU/asvpGmvuhPVavfB8YpdQkCKzdf5b8lQWFrWNrilEc/1vz7Ga9RPBNr2zYLDJk+50rq/Jn59kCCoM5DX3FASirM0q5lQBB+AWWDrR7ZY/TLXvbHaxHoJ54e2/FH6hhl185UdAYPokjQ3Sos80haF1p2cCDBdTTiYnhjnzQCgnQq0KslrF6Q==
Received: from MW4PR04CA0084.namprd04.prod.outlook.com (2603:10b6:303:6b::29)
 by CH2PR12MB9457.namprd12.prod.outlook.com (2603:10b6:610:27c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 08:53:34 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::1a) by MW4PR04CA0084.outlook.office365.com
 (2603:10b6:303:6b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:08 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:08 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:07 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 04/15] nvkm: remove unused param repc in *rm_alloc_push()
Date: Thu, 31 Oct 2024 01:52:39 -0700
Message-ID: <20241031085250.2941482-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|CH2PR12MB9457:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca9a6fc-0e7e-4564-e1d1-08dcf9898072
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yp8RQvsu5hjj3YW8a/NOQA4W3I6yZJwBMyh/IuiWHj6p0w04lWZGoEbTnZWk?=
 =?us-ascii?Q?MWEgXavP1h0JmZFZsOQ/sk88ruuNRIEMGG/SQ3dLdo2ry3184sKfrUgMO2En?=
 =?us-ascii?Q?M80x698qpnZ57hp7fxgZbefCHmOxCZu8Te+nxx8bWF8gI6YFvXSvCanriOFA?=
 =?us-ascii?Q?/6cZOrsJT1aYOTpOqWWBGuyxjxRViKWx4/MPxsIkjap8xwWyKA9JgqmqMjQL?=
 =?us-ascii?Q?547CzNIX1lwB6gstfaXKN9BNV20UWLwjLvrRL6/rHna3Dt5cwztcSWLYKhCS?=
 =?us-ascii?Q?PJzJUgKtRllOvxukfwolWSn2phtclx2nnF2eUh2ikqkSgauxWcQQpBMEhSRK?=
 =?us-ascii?Q?qeelGt9tNYgBb2D/MrcQzYNj/F7tVTtx4coUPjBmEh4tA/bxVxzfiDDk2/MO?=
 =?us-ascii?Q?n2IHFfysWxbrj+PE1/z3PAAFjcbSWZuY5mfXDtLG9XvxalzEzJaTxcr6OeWC?=
 =?us-ascii?Q?kQ0m5Fvf8Bz/gZI1Ok4ssHuSf0KysV4Jrh1tfPaexaoZcZT8eJhx5c4wSIae?=
 =?us-ascii?Q?2dfhJ65o1Cvmfv0frjJ1tiykmg+AuxrivJstpjtLixD7NLzuFh+CagEjh2yY?=
 =?us-ascii?Q?TumVHpL9YVa/yBRCMVGtgqVK2mTFQZ2nmk05EHxo5belrZioxrljV+rD8zJD?=
 =?us-ascii?Q?fuZapTLdikdJ7+iPwLTBAwS9jNRlH+A0YiHU72cHaYAs9g35aA7dk0yR4NY4?=
 =?us-ascii?Q?BHcuXZg1218VaJWquXVV4ilnsgl/PEP2Jm/wxXVA7lQjjmMVkW6cQvjciPVJ?=
 =?us-ascii?Q?z4JH7+z4rvvKqYzP6MJMSYa+kP1bkdpItJv2M8Eh4xyCryLsQksUeKpLwQVK?=
 =?us-ascii?Q?aCk+RJzbeUVfYEGbBxVL8AtLHTLQFBjxFguCDDaCQEG4Lt3dsFQ3RI/g/tSc?=
 =?us-ascii?Q?evOvTMEy8Jj6/iC1fqh+WsqK7Gsm90eyJaCpJX5feecXRB0LJfoq6EF2CVk1?=
 =?us-ascii?Q?sFEFvRu2hPLAfP+TYJG55cAIxS5J+67sVkfYu1dOaoVaDCLtwiYex0ZPAae9?=
 =?us-ascii?Q?nTAA5W9eePQUCHO5GJE11MGnpbeh1n1LuYnh0bsSfeg8ocG1ekn9TbWi6mJ/?=
 =?us-ascii?Q?wS/5xhDsfe5iOuKZiNSOZ3cHWWJ4ERHlmCqIGiw5E29CTZoacnLEdapLKqXW?=
 =?us-ascii?Q?maSH1logf6t/CyNTe+BxX+0ZOfwewUohUVG5mbyvgldOqQ61w+k1yL3iW1fz?=
 =?us-ascii?Q?qA/ezHYGcTEwWiashcKADAL8Cisc0BAiJdf3BciRKqSHC+sPo0Kq6j7LNrba?=
 =?us-ascii?Q?aG5+KhwU35Yg5k2Yx30NZDfL7qTMu8D3E4483rR55EOz7ZZQnN+Pw74zfaht?=
 =?us-ascii?Q?/Bp89hq1YxBxESGS0bDMihbTgJjW/jv5pWU/jjj06w6bMMI5N/QlyM6tMQe1?=
 =?us-ascii?Q?0qtxcbusOui3AzM6ZRvzBO4fek745ryfUNOg5Oh2G4PwLujJIA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:33.8897 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca9a6fc-0e7e-4564-e1d1-08dcf9898072
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9457
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

The user of *rm_alloc_push() always pass 0 in repc.

Remove unused param repc since no user actually uses it.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 8 +++-----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index f52143df45c1..79b98f3d8656 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -192,7 +192,7 @@ struct nvkm_gsp {
 		void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
 
 		void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc);
-		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv, u32 repc);
+		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv);
 		void (*rm_alloc_done)(struct nvkm_gsp_object *, void *repv);
 
 		int (*rm_free)(struct nvkm_gsp_object *);
@@ -331,9 +331,9 @@ nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u3
 }
 
 static inline void *
-nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
+nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv)
 {
-	void *repv = object->client->gsp->rm->rm_alloc_push(object, argv, repc);
+	void *repv = object->client->gsp->rm->rm_alloc_push(object, argv);
 
 	if (IS_ERR(repv))
 		object->client = NULL;
@@ -344,7 +344,7 @@ nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
 static inline int
 nvkm_gsp_rm_alloc_wr(struct nvkm_gsp_object *object, void *argv)
 {
-	void *repv = nvkm_gsp_rm_alloc_push(object, argv, 0);
+	void *repv = nvkm_gsp_rm_alloc_push(object, argv);
 
 	if (IS_ERR(repv))
 		return PTR_ERR(repv);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 6a9315addacb..881e6da9987a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -647,13 +647,13 @@ r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *repv)
 }
 
 static void *
-r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
+r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv)
 {
 	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(argv, typeof(*rpc), params);
 	struct nvkm_gsp *gsp = object->client->gsp;
-	void *ret;
+	void *ret = NULL;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc) + repc);
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc));
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
@@ -661,8 +661,6 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
 		ret = ERR_PTR(r535_rpc_status_to_errno(rpc->status));
 		if (PTR_ERR(ret) != -EAGAIN)
 			nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
-	} else {
-		ret = repc ? rpc->params : NULL;
 	}
 
 	nvkm_gsp_rpc_done(gsp, rpc);
-- 
2.34.1

