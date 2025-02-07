Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5680FA2CAA1
	for <lists+nouveau@lfdr.de>; Fri,  7 Feb 2025 18:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42F910EB95;
	Fri,  7 Feb 2025 17:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XfIoyfpi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D2D10EB96
 for <nouveau@lists.freedesktop.org>; Fri,  7 Feb 2025 17:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LalwQmL5IVoDQ+xGLLd7nZkY3rEv3mt/nyovlUYQYD4tHUwLEBbM0rUPwNFy5bJ9z6L2miPZB5Fxbp1o9+H+GrLjUVC/G55+oSmLwCpwlwntz4Rl0bIYxWwxwQuipIvsqJBnLw09XP579GBkD+G3RIhga6gUssx+8//3Y8hL4spiuw5jYmnBzuj5fOTgi4njfLO30D/ePYuy3iB1j0N0JtDg3deN8RzHc+7nRNyHehc4eyCmFxR8MOLT/cLK4QSUPmZkMLPhHmyaO8h0yIPlNEHzxUJilcIV0Zd62acJXfKsFj5jLCWMYKGCgaj+RWiZQR0RjrM9fmSbnKjj36I/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKpC3+bx6xePgBDo31m67LGmnOT1sFRmoLJMiI6/LwA=;
 b=R9YfiIa8FroLJFs/PK8gsawGB7l7CXVSDMGDl9fTLGI2PASYrv2Bu0I/JTtpp7T3hJKGSs1bCDyFmIEVt2MW6xMjJnBSlTfznP+jUG3S9alNFTXAOQAur7vg3Z0ek/13mBmyu4WyOxHquETsZdiAxMai01ivYUuWvRT0igY2ta0yMzumeaT7qfKJuf/EhLyCEDrwFYhRBNcN6nI+dFxJJqEPes9K1hMLuXgRhjfqI8S4aHrlgPzzsZIzhCQKnhjl81+omrMziZUpNpa9okKcAvTV1/8Ub/r7r5B6vFisb2FnCFtFtLmmzlLFbndcPhlGjPrIcq6Pa4j/zewWLu0PhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKpC3+bx6xePgBDo31m67LGmnOT1sFRmoLJMiI6/LwA=;
 b=XfIoyfpiJgggh10gZ5ppupC5LoEwXWURjusRj1kw8HOSdighl8BZYgXtzYNuB6YB4L7prQhzpeNS6ata6zMEcpj2AT+njnoXYVDNnuIbyGiIbgw7pU7lKAS+5UhpJIO6oAOVDYf4va9ZVDdCBvvRPwSlc4nEBrvShTSxCIXMAWBydYwZ0PxAhM12jLs8HQryiGBt+sWmZ6v0uXvr2NuU3w9iG3KUGzZUzzQW1soAmY53001RsDKiH7e7rz4mB1ygeUb3M1t3w7fz/SYqSA3b8x5KtKCxiKj+FtHs7X/dVmg+ucZBBabvVB7JkjwhaYSGkEBGzBeDSfLOhm4Yya11Fw==
Received: from SJ0PR03CA0230.namprd03.prod.outlook.com (2603:10b6:a03:39f::25)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Fri, 7 Feb
 2025 17:58:38 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::45) by SJ0PR03CA0230.outlook.office365.com
 (2603:10b6:a03:39f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.30 via Frontend Transport; Fri,
 7 Feb 2025 17:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Fri, 7 Feb 2025 17:58:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 7 Feb 2025
 09:58:21 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 7 Feb
 2025 09:58:21 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Fri, 7 Feb 2025 09:58:20 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH 2/5] drm/nouveau/nvkm: factor out the current RPC command
 reply policies
Date: Fri, 7 Feb 2025 17:58:03 +0000
Message-ID: <20250207175806.78051-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250207175806.78051-1-zhiw@nvidia.com>
References: <20250207175806.78051-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c10733-2fc9-4690-d364-08dd47a10b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KZYail2wIs1gWQbMQTvJoZS9Kc6nojHOo/scUp2XXVkmv8SgIZd6HINEYqY0?=
 =?us-ascii?Q?bnWlCIGr4+d4CfHgl6NiCRiJ+GA6Bm+KrxEoVzlVegLzaR79n7hjD88tM6xf?=
 =?us-ascii?Q?F/pv5ng8CSfHk1XBKFBSVdqYuEIV7CgJCqce7rTAqxQriO5FzHGjPH5QX0zC?=
 =?us-ascii?Q?1baFsCttr+Ud0h5j8biYJXySl/kUlqVrWNfmSg8ryrPHzNPz+Lw+5YZUJ93t?=
 =?us-ascii?Q?2MY/uHDBSLY7QMpWsgPcXvgSKXCfuX2dx0jJQgi3IwOL3vvU7WDcyyZILC//?=
 =?us-ascii?Q?AocKcqGfci6LwT2BwKSBHJsi8Sbw1iGPLtd4HDmR4qrbS110jw5QXPWIX6X8?=
 =?us-ascii?Q?ssQz02IrsRo/u6akYr8fBr0lm/nSkXTrTJ1qi1PYKSRayYd/ExHu10+pul0o?=
 =?us-ascii?Q?r5Yso2AwYpr/8ElNYn9/fGlPn4awwte2myiDzIKUqa3paL8Gm5X2+TbGI4U2?=
 =?us-ascii?Q?q+m6AEtj5DxUIAVfufi9pPB+K13rBVRg5H1LYWQjrG/PD4dzkXEJy6NeVVnW?=
 =?us-ascii?Q?MRohxsqn/sLFBoo3MyFdHEh1oyNE/yhM5aTz+zyq54BiZqdHBqwOVVST05II?=
 =?us-ascii?Q?HpmkzrkOnNGnEEOyYzuThCsEskrWdL7y2LfFMNGAj3rR2Fd6DnV4eYNcQ/hl?=
 =?us-ascii?Q?1K5i1loTLrYQDCVSbnOAYBjk1bRr0Omk/s9zGR3ZO7mXU/wcfgXu+3OIni+Z?=
 =?us-ascii?Q?sBz9gxD1ddDFATOyNeFRVI/ZANIp9aSm70Eo3qVz4fMZ2rl3BMSbKZOFJJAX?=
 =?us-ascii?Q?g398k7U1t2aQTcVCq8E2ntg9ReW426NXnKTHFs8NP7BATXdLHuNdDvl5g1un?=
 =?us-ascii?Q?6FS9EVl4Qdz3MI6Z2g3untA6ydhzdBeTAFJ9x74xkn0dbFerEftjf+DAExQg?=
 =?us-ascii?Q?1t1xj07KY/r6a0wu8aQOjX4u1JnVgUyPpcYgrYAtdLzrPfVThnQiTO6ENXji?=
 =?us-ascii?Q?I3OXM30B6JMK5kpHouVqCdouPdZfQFKfyOAcWBeAgPsIIDfEFYyDnh3DA7il?=
 =?us-ascii?Q?93RNcU4RS6hgWPJbzA37tDeqEFB+5S6qUAR6unUtc1dV2eZa3w1QCAaRmXMe?=
 =?us-ascii?Q?gx0ch4qh/RgzTr5aThZtVwi0BCAC7pd7jprZeHFDlgOJxMQvtusEhzhswBCu?=
 =?us-ascii?Q?uIDnXrm/eBo8308rbRU/SuwcL5sIe9IP+IC54XWjSwQa4piHro26wN36T3PS?=
 =?us-ascii?Q?MDP2wCWAvoHIq6p2ucSwt5BXl1FuBKur732uNpd+QKoqPL1jJtBV3mQiGY4X?=
 =?us-ascii?Q?7s7f7Uos0XTt0KDFQorHIs9p9uTUVl40tGcdvDS3EG3i7NGm/MRo3JXfFubk?=
 =?us-ascii?Q?kX7tJi2fQvntbSh/YtIZyb7ItqKmncibf/addHyBCmRLcxBb836NrwR5/UAB?=
 =?us-ascii?Q?ETPn+t4xtm341I50NmRGhsq99wfhcHAm2VjkqUZD4ds8XKP8I2XWFsK3CUDu?=
 =?us-ascii?Q?TpA0zffwGyyhPsI6dlaamhhKpIzrw7VMxq4h7J1Nae1/zzdc9/ImQoyEVFAp?=
 =?us-ascii?Q?Ubn9okOEMBC3szI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 17:58:35.8859 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c10733-2fc9-4690-d364-08dd47a10b34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
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

There can be multiple cases of handling the GSP RPC messages, which are
the reply of GSP RPC commands according to the requirement of the callers
and the nature of the GSP RPC commands.

The current supported reply policies are "callers don't care" or "receive
the entire message" according to the requirement of the caller. For
introducing a new policy, factor out the current RPC command reply
polices.

Factor out NVKM_GSP_RPC_REPLY_RECV as "receive the entire message". If
none is specified, the default is "callers don't care".

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 16 +++++---
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 41 +++++++++++--------
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
 4 files changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 746e126c3ecf..c467e44cab47 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -31,6 +31,10 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
 struct nvkm_gsp_event;
 typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 repc);
 
+enum {
+	NVKM_GSP_RPC_REPLY_RECV = 1,
+};
+
 struct nvkm_gsp {
 	const struct nvkm_gsp_func *func;
 	struct nvkm_subdev subdev;
@@ -188,7 +192,7 @@ struct nvkm_gsp {
 
 	const struct nvkm_gsp_rm {
 		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
-		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
+		void *(*rpc_push)(struct nvkm_gsp *gsp, void *argv, int reply, u32 repc);
 		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
 
 		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
@@ -255,9 +259,9 @@ nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 }
 
 static inline void *
-nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, int reply, u32 repc)
 {
-	return gsp->rm->rpc_push(gsp, argv, wait, repc);
+	return gsp->rm->rpc_push(gsp, argv, reply, repc);
 }
 
 static inline void *
@@ -268,13 +272,13 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 	if (IS_ERR_OR_NULL(argv))
 		return argv;
 
-	return nvkm_gsp_rpc_push(gsp, argv, true, argc);
+	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
 }
 
 static inline int
-nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, bool wait)
+nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, int reply)
 {
-	void *repv = nvkm_gsp_rpc_push(gsp, argv, wait, 0);
+	void *repv = nvkm_gsp_rpc_push(gsp, argv, reply, 0);
 
 	if (IS_ERR(repv))
 		return PTR_ERR(repv);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
index 3a30bea30e36..90186f98065c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
@@ -56,7 +56,7 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr)
 	rpc->info.entryValue = addr ? ((addr >> 4) | 2) : 0; /* PD3 entry format! */
 	rpc->info.entryLevelShift = 47; //XXX: probably fetch this from mmu!
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 1ed7d5624a56..bc8eb9a3cb28 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -584,25 +584,32 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 }
 
 static void *
-r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, bool wait,
+r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn, int reply,
 			  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *msg;
 	void *repv = NULL;
 
-	if (wait) {
+	if (!reply)
+		return NULL;
+
+	switch (reply) {
+	case NVKM_GSP_RPC_REPLY_RECV:
 		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
 		if (!IS_ERR_OR_NULL(msg))
 			repv = msg->data;
 		else
 			repv = msg;
+		break;
+	default:
+		repv = ERR_PTR(-EINVAL);
+		break;
 	}
-
 	return repv;
 }
 
 static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, int reply,
 		  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
@@ -620,7 +627,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
 	if (ret)
 		return ERR_PTR(ret);
 
-	return r535_gsp_rpc_handle_reply(gsp, function, wait, gsp_rpc_len);
+	return r535_gsp_rpc_handle_reply(gsp, function, reply, gsp_rpc_len);
 }
 
 static void
@@ -804,7 +811,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 	rpc->params.hRoot = client->object.handle;
 	rpc->params.hObjectParent = 0;
 	rpc->params.hObjectOld = object->handle;
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 static void
@@ -822,7 +829,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 	struct nvkm_gsp *gsp = object->client->gsp;
 	void *ret = NULL;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc));
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
@@ -883,7 +890,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 	struct nvkm_gsp *gsp = object->client->gsp;
 	int ret = 0;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
 	if (IS_ERR_OR_NULL(rpc)) {
 		*params = NULL;
 		return PTR_ERR(rpc);
@@ -955,7 +962,7 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
 }
 
 static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, int reply,
 		  u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
@@ -974,7 +981,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		rpc->length = sizeof(*rpc) + max_payload_size;
 		msg->checksum = rpc->length;
 
-		repv = r535_gsp_rpc_send(gsp, payload, false, 0);
+		repv = r535_gsp_rpc_send(gsp, payload, 0, 0);
 		if (IS_ERR(repv))
 			goto done;
 
@@ -995,7 +1002,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 
 			memcpy(next, payload, size);
 
-			repv = r535_gsp_rpc_send(gsp, next, false, 0);
+			repv = r535_gsp_rpc_send(gsp, next, 0, 0);
 			if (IS_ERR(repv))
 				goto done;
 
@@ -1004,12 +1011,12 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		}
 
 		/* Wait for reply. */
-		repv = r535_gsp_rpc_handle_reply(gsp, fn, wait, payload_size +
+		repv = r535_gsp_rpc_handle_reply(gsp, fn, reply, payload_size +
 						 sizeof(*rpc));
 		if (IS_ERR_OR_NULL(repv))
-			repv = wait ? repv : NULL;
+			repv = reply ? repv : NULL;
 	} else {
-		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
+		repv = r535_gsp_rpc_send(gsp, payload, reply, gsp_rpc_len);
 	}
 
 done:
@@ -1326,7 +1333,7 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 		rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0;
 	}
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 enum registry_type {
@@ -1683,7 +1690,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 
 	build_registry(gsp, rpc);
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, false);
+	return nvkm_gsp_rpc_wr(gsp, rpc, 0);
 
 fail:
 	clean_registry(gsp);
@@ -1892,7 +1899,7 @@ r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
 	info->pciConfigMirrorSize = 0x001000;
 	r535_gsp_acpi_info(gsp, &info->acpiMethodData);
 
-	return nvkm_gsp_rpc_wr(gsp, info, false);
+	return nvkm_gsp_rpc_wr(gsp, info, 0);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
index 5f3c9c02a4c0..2789efe9c100 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
@@ -105,7 +105,7 @@ fbsr_memlist(struct nvkm_gsp_device *device, u32 handle, enum nvkm_memory_target
 			rpc->pteDesc.pte_pde[i].pte = (phys >> 12) + i;
 	}
 
-	ret = nvkm_gsp_rpc_wr(gsp, rpc, true);
+	ret = nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 	if (ret)
 		return ret;
 
-- 
2.43.5

