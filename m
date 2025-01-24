Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0AA1BC13
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403D910EA04;
	Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgiJAo53";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2056.outbound.protection.outlook.com [40.107.220.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F5C10E57E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFRMp41ug1JLNVkDaOOtNnMAbVFVyZHbA5E1muGnesalS4E8F3cR2NRL4EXIkhvJxwHNIuq+0Fw9k5QszXc422kXTZCc3mttbzJnG5fHWdEyp0cdlow7gr6etR8nuTAWD+Fcn3DFPawaSyv1D4Aq5UTX5tiTUY73X3Uehnoj2nE/PXETHL4D4jkAKucNvHjkpX3y2hvEYVUE/Dh6L6WQrmcymrrW0oQXJCFQKCNRR7IFbjbnuqQQfF0MVqqcT45knIQo7MUmbzIBo4gsTuexk2g3DahjA7i2U8hOmP65CK5BFsUZkZvVbpIjK6BdClc6ToIcgIB5Xg0+dLI30zTJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bZMAo6/RIjvsrWCjv9Mskvyyf4qY3X4J4mq9om/aPw=;
 b=agrIhS0+X6apLH281ZwYU0CMPXc68pE2KZ45JculAR/+cEn3J/JA9CSABzg+xUQbTW1f8mgGGKnzngbaSDW9k9nAFqRvTQw2GT9J0v2gSDyNEn9MPFKKGOygidWx/GRIgNboBQPCVx5RndRN8ULV+51wIU/knFpY31BzzdYjkaHwMV+qB3s36pZXEbF+8FYxxAXyXnV7IQk6oMsTpAL4AoXGdsLOjSU2yHSeb/PLTXnWjnRwAopvLmygZYQzTwB4PT9vDQnRrRM2cn0iC7dDt84JuwIie0PpP0VxRxYnnc+/JfEKMFGM/ctln3CKc6+dbLUUNeh1jwkNZIbA0soq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bZMAo6/RIjvsrWCjv9Mskvyyf4qY3X4J4mq9om/aPw=;
 b=CgiJAo53lSR6poyOjjZJzyG0M3vSApDUG1ED3VmieVVa1BYmH6V98rh/EoKi5HgSRQOSvcfnrDHF6UydEN3OFhy79EvSxcLS8j9Ux3vXdTNnyQcKeWQ9LSGXfvUetCP7/ZTR2c6lik4UwniUVThxUnS0k7mZgspwjRMGnqwzdzkzvX4FBcPfUSt2V6rsm/OfjGUMUsZQpD1NDXrBGMo6kL/S4iAoAv6qyZnzS4Y5Y2y4y1tZKNnellG7iVDtaiC0GFaQVQaarbjncNhx6LuryoPsIvhBps90Dh6WbMWQ+qjwZjJk8Nzss0CiNrc0P8KDufgen3FGfX/IpKcxwoQ7mA==
Received: from CH2PR12CA0015.namprd12.prod.outlook.com (2603:10b6:610:57::25)
 by SN7PR12MB8603.namprd12.prod.outlook.com (2603:10b6:806:260::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Fri, 24 Jan
 2025 18:30:44 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::13) by CH2PR12CA0015.outlook.office365.com
 (2603:10b6:610:57::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Fri,
 24 Jan 2025 18:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:43 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:27 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:27 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:26 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 04/15] drm/nouveau: remove unused param repc in
 *rm_alloc_push()
Date: Fri, 24 Jan 2025 10:29:47 -0800
Message-ID: <20250124182958.2040494-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|SN7PR12MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c2a1b4-9707-4ef5-fb48-08dd3ca53675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fiKUEVaFkT9ZgRwAmYMBWBY6+e9c2eN366wLCXW6HIL0vm+p0uMlBBPkd7j9?=
 =?us-ascii?Q?yqCqU6wE9nkAFvZ92uZ7rTOFyO59Rs+sF2y05Fcz7xwMzP2tYC5NQjJRNin/?=
 =?us-ascii?Q?hgBqwWbPWEZVaH6XuMztrx1Wwm88ve2cJEzp5B7xUQW7ljiTcGAI/Vr+vRyo?=
 =?us-ascii?Q?HfVjYJ9Ddev4xzV0L75PzYAZ8ALIX8Qsc+YSRKGloFUGmaD3oPakufr7LHCE?=
 =?us-ascii?Q?RdUA40JRJbMW6JHmuFrti1M3M3bZdj+TpS5a6sERYXLK6mQgpC7/qF7fxqFd?=
 =?us-ascii?Q?aBqFERdy3VB1TdBPqNGtS6mB/mE4v7fm4Mf7k+KEzED42/VVu892Ykx7qm9K?=
 =?us-ascii?Q?bBJxVQgTkz0WjS0Yizfjibl4GzfuL8AJHip5kMjmwjO3opK/tTa3DgE0M8Ok?=
 =?us-ascii?Q?Mqh4t6yU4+h+CMIzEhgIciZH3OaVI0xcQ074fQ9bfttJ1DTM1iKgZTCYdGqE?=
 =?us-ascii?Q?VWlP2De4KnIZ0wjYGCwVl5w6ptHw6atT5+LdgC614hc9nku2v6n1hMxNjSwn?=
 =?us-ascii?Q?F5UwkBAexiB2TXColXXTLfWXMmdJZ906ib5YVGXn1JxkwbokDb69dH+9IuBH?=
 =?us-ascii?Q?f3f8D1NU/Bxmz1Y8NUvbcipO0hTGzBQkdauIVAj1DMK6+gtZmKvOKOpDwqPh?=
 =?us-ascii?Q?FGwl0iaTMEqx387Gz7xwgjm0NjPKi8DZf6radCpjhq1EC6av1ZTt3DyyEUOf?=
 =?us-ascii?Q?4AcF8KnMOh9M8Ooqem/bErje8/RP1aXQ6MzXl78xY++PWoDLYHcTfic5GGHQ?=
 =?us-ascii?Q?jnMCEIuk1n7mQGT8g5jtGyN2NL2VtUuA+aN4yKSpzrMkAif9usKH8oENfPpX?=
 =?us-ascii?Q?3srl0Ln5TRKAC4Ke6jlvlSHw4dPhuMInNzseSz8uPSfRwNdMUBmFJGM85i1z?=
 =?us-ascii?Q?jkfWjs2RQHQc6bt2qMyiCzErISNz/udlDgjJiKOR3FSVleNa8anI/INlY13y?=
 =?us-ascii?Q?P1IQuflXrtGrxFYciZuT5kkBo7OtJmIQ/n2zMeRzCk+IHVq3iBfgEOPGRYAZ?=
 =?us-ascii?Q?3hTCBGsSzyoY4a401RUjWQoy4+ciSNwrbU/BR27MgB2IplEmszG5X1jzgBMf?=
 =?us-ascii?Q?2NpBpBmhQsfyYefgtw3bCxsEqIM140SUoJ/xmSwSV3kKiBh1Slttf5zJBqf9?=
 =?us-ascii?Q?tuXegQ50pFuJbaIYaRCwQgkYj6TOKGWF4enIhCntlaMt9g2uGD5HqbJSKean?=
 =?us-ascii?Q?HXWVyVi1pIUtWSDPt6CMzY49yYzJGAM+jSGWJ0ohKXBb/KPliv8hT/tt9Yx4?=
 =?us-ascii?Q?009vVYGtGC95dW82ZHJOplopAzTApQmFCzF1+AHOeO48dgcQTq4+9MlPmEXv?=
 =?us-ascii?Q?2PxOYIKYrYEDxXBEYGnOepNmgBrsGkIExAOaoSIQCSjVaPYDHio0ofUBtpQ/?=
 =?us-ascii?Q?Wj2llWx32vJdJQMxjsF90SBsgqeTg92JbYhaKJBbGh8yht23WK4NcMdFpZSC?=
 =?us-ascii?Q?1L5dvwqNXrCMyDiO8LQV5WY+HY4NUGbyDmVDBANCpvyudY6nYXyBzH5lDKjB?=
 =?us-ascii?Q?4RLlPpdjoEK8Nog=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:43.5731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c2a1b4-9707-4ef5-fb48-08dd3ca53675
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8603
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
index 5c5f4607fcc9..746e126c3ecf 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -196,7 +196,7 @@ struct nvkm_gsp {
 		void (*rm_ctrl_done)(struct nvkm_gsp_object *, void *repv);
 
 		void *(*rm_alloc_get)(struct nvkm_gsp_object *, u32 oclass, u32 argc);
-		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv, u32 repc);
+		void *(*rm_alloc_push)(struct nvkm_gsp_object *, void *argv);
 		void (*rm_alloc_done)(struct nvkm_gsp_object *, void *repv);
 
 		int (*rm_free)(struct nvkm_gsp_object *);
@@ -353,9 +353,9 @@ nvkm_gsp_rm_alloc_get(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, u3
 }
 
 static inline void *
-nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
+nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv)
 {
-	void *repv = object->client->gsp->rm->rm_alloc_push(object, argv, repc);
+	void *repv = object->client->gsp->rm->rm_alloc_push(object, argv);
 
 	if (IS_ERR(repv))
 		object->client = NULL;
@@ -366,7 +366,7 @@ nvkm_gsp_rm_alloc_push(struct nvkm_gsp_object *object, void *argv, u32 repc)
 static inline int
 nvkm_gsp_rm_alloc_wr(struct nvkm_gsp_object *object, void *argv)
 {
-	void *repv = nvkm_gsp_rm_alloc_push(object, argv, 0);
+	void *repv = nvkm_gsp_rm_alloc_push(object, argv);
 
 	if (IS_ERR(repv))
 		return PTR_ERR(repv);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index cf19afd6bf44..eb82e589381a 100644
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
 		if (PTR_ERR(ret) != -EAGAIN && PTR_ERR(ret) != -EBUSY)
 			nvkm_error(&gsp->subdev, "RM_ALLOC: 0x%x\n", rpc->status);
-	} else {
-		ret = repc ? rpc->params : NULL;
 	}
 
 	nvkm_gsp_rpc_done(gsp, rpc);
-- 
2.34.1

