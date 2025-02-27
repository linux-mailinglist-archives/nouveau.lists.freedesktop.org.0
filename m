Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80028A47140
	for <lists+nouveau@lfdr.de>; Thu, 27 Feb 2025 02:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3944610EA06;
	Thu, 27 Feb 2025 01:36:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aJcKHr6a";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C2E10EA06
 for <nouveau@lists.freedesktop.org>; Thu, 27 Feb 2025 01:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlzO8sPfqyRytnzVjNKWc2Ufuns2suDjT0PMk58c123lLeFtyNrb97dd2LiSE9FTyeKk27zceCsWlrY2rP2NwlDqA6CNTrYvpI0jLvx5827jGK8bGXDKO0bgYOOxND7irdb24udG7FDjYTSbWavUgkNOhLegJ2McrMM6ox33bs4lSV/2qEoA822RDJqzC/rc9dX4kmFKnejvKhhlldKBvELDRg5bQPmqJaAqwabq08p4nE/LnzsvvVPnYtyqAObIFLtajDxvT+L6WLmvlJm/Erpu/c5ALMOBCylXHkjtWPo+65pCh+nypRhHvxEuui65SLf06ZMfzjBTTEQdYakluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OWV0l38rTZ8Ix5PuSCls/rUyOF7iojyxxhgcPr4SQE=;
 b=Xue/T4PrEb9quuuxrnWDWBCVThUpOub5zRl/tYkrvosZUUVcP84uCf9DuuCEi0IADTgvE+04Wb+Wl2u2Y9rc7/+7EU3o0pk8YbAoJSefOwTIfyIp4tf1ueE9gaYYE+q42cl1Eul8eLoMFEsPvVoYBe3x14pux18VjfW8XulB3+rnc29k8QdC50f9k85fbIpW8U5fTIsUO0R/QZ27Bt7y6U8NBvZHcj2TbvE7RBznhGaEmw9iBrc0vEa4xTQpGllhqK6gQ9OTmR0GbbhSxBDjEZ5IwfprC7PbSwe9CY7b/WBPt1UPgFPiYpT8nUqjBETGMkfwua0I4eQ2qUYh6PZ9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OWV0l38rTZ8Ix5PuSCls/rUyOF7iojyxxhgcPr4SQE=;
 b=aJcKHr6aImPPK+BOnfpjo2cOYcozznq70QQxzXffc9BNBzmYfO9U3VDJFGhc1F/TqAMBSPofjtYMapQvFvaynGDGap4GgdaOHTV/WK5WqpcBo3Zx2UfFGi/Q9Dmvag1oXuhEqkyJyD4aDZ9oemlFwA2AYINs8dtwmQj2FUPrnosCpRbcvnEILp08TeC5QyBgIUL2Xf3v2WXYkCwZB0cDt4M7e+D2v1wBpZJXeMpvGTfq0jJD75hQdSOYO2FfqIl3lxqSUZkoXlnHchPh8oEV3OzIlBfDhtQFj+ukIMPRiLrrBuM6OCN2EfiyNs8fPaRrsgrlq3vB2WXnJFtMmGd73w==
Received: from PH7PR10CA0003.namprd10.prod.outlook.com (2603:10b6:510:23d::24)
 by PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 01:36:14 +0000
Received: from BY1PEPF0001AE17.namprd04.prod.outlook.com
 (2603:10b6:510:23d:cafe::f0) by PH7PR10CA0003.outlook.office365.com
 (2603:10b6:510:23d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.19 via Frontend Transport; Thu,
 27 Feb 2025 01:36:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE17.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 27 Feb 2025 01:36:13 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 26 Feb
 2025 17:35:57 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 26 Feb
 2025 17:35:56 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 26 Feb 2025 17:35:56 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: [PATCH v3 1/2] drm/nouveau/nvkm: factor out current GSP RPC command
 policies
Date: Thu, 27 Feb 2025 01:35:53 +0000
Message-ID: <20250227013554.8269-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250227013554.8269-1-zhiw@nvidia.com>
References: <20250227013554.8269-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE17:EE_|PH7PR12MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: bb6fb1ef-7f69-49b7-13b4-08dd56cf1f12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jv8RJeXvWFbKKTQR/GUCBytAVGTNqc17vCE8pQaWCcUKOwUpq4aFUXvzXMmq?=
 =?us-ascii?Q?RkpXxWq50DWHiRhOF2LjoFs8IoK9HtB1c06BUbltPq7lcQVklTsOQPsislxW?=
 =?us-ascii?Q?L7Il/DTh01xLZ951Wh8XO83yL2vRygUMLx19h24wM0ilBtsK+QC/mAuOWumb?=
 =?us-ascii?Q?cSXGg/OBTpqhI/iGUFToXKGKAR66umXs1J4fBNsOaAHSzZXWEb3oLy/y/WCg?=
 =?us-ascii?Q?68RQUPmUvmttoMWvnMCy1aa6vqoz07b8j1NRcM3wzzamtfF1NAYvu1dVCSH4?=
 =?us-ascii?Q?Qa2p1Lt7/LTyulgqPHtWJWp7hPtoSXJ/Btyv8T9754ekMyiSFp4XBJq8xcSw?=
 =?us-ascii?Q?+rxojtFdWnInpBxpW+qVWm2V60BQLzE6jtPgi12w+HxlJ3QU6Fq2voaIr7Cs?=
 =?us-ascii?Q?fInpnw/2Oen9AZY9eQQG12yFUeOwjGrWusIyjcPHpvnhQvBK4bESXD280fi8?=
 =?us-ascii?Q?sIbNAtNPhMEwxDy96r/UgZ8O+Cj7bhW1udMiZFgELHsjzrmzdT1RtCHnPhih?=
 =?us-ascii?Q?n/TY9Z2DDIGH04KtOYImdnzSdnDFClrmrbMSVKOVTx7sbh4UAxZtQ0XNgi4b?=
 =?us-ascii?Q?+Ks5R4KWTcQHq0uPFPlv9tNofajxAPd85YUeW13G9KleN7NzfPiK4oSbMNDO?=
 =?us-ascii?Q?7UwB1jjuUhhGt16M/nSwRuwE0tJRIwrscm3MqgojE+Sl5IPkdbCnG6Tz1coT?=
 =?us-ascii?Q?24kxLcUmzVDUyPh7y6vDFsKuXHubbIN82Uek2WjEuaJd2uc3Vj+4WjsFO1Um?=
 =?us-ascii?Q?5KTpJfHyMuhSZnBolAJVQuNmbUrIK01cl5H96j7yHRYxhUfgE7snSPA16Ki3?=
 =?us-ascii?Q?05JYj/YqV22CleAfMPGTZu3mt1a6jQaGT8jFYiYSyqj7siA/sHeIVDzQiE6N?=
 =?us-ascii?Q?WelR1sRdr9ByU3uLmxc4OlF4ceEjMpwK2wZD4IAA2G1vQtQ/XAkr3d773uXr?=
 =?us-ascii?Q?k+81Bz/na7biEpPQbKyJNJx1Xitcgi2L8VSikKH9x6AjNtsV8rbG4YDE35zx?=
 =?us-ascii?Q?qI8+4z/FCQmK+osCFIQuuqHcNO2CoaY0W3RkhV/EcX6N005GU7f/GaJIbafx?=
 =?us-ascii?Q?NC6AnRdG32qe+XkUU7O7Ma/gGd2d/cJEW036WEIagBG/O+wZHswAwSpQjRXk?=
 =?us-ascii?Q?Y7HzeCneczh93ddA5rDgZdzp37hfwFJN9BfUMkXZQTZaSJY73DxVl8wmbvMV?=
 =?us-ascii?Q?uAgkWNn9KWuZcsIR32pt2jGFNqfDh9xNSgZI39eu2QJKgnM+6OG0BX1+s5wn?=
 =?us-ascii?Q?HRt42zBrWVAasKIw+nGzBjufRAN8AUvBw2t/OtnGoxFYbf0EtEDV/BVlIugm?=
 =?us-ascii?Q?lMe2wKC6JIq93lBaLPhkh0SLa+Wcibp470Tz3wkicLN55gect9P6RiiUU968?=
 =?us-ascii?Q?QmjZVjau6vpMdqIgztwUu72z6LnkhH/HipjVQLZp5vHjJR+HmqagtR41VShA?=
 =?us-ascii?Q?7S0dAKDuWUGjlgXYMo9n9mz6OVjJeG1DpxbhRVXJeF9m3Ts6QXZef1u/2wh0?=
 =?us-ascii?Q?NjbiC+3ew8iTUJ8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 01:36:13.4725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb6fb1ef-7f69-49b7-13b4-08dd56cf1f12
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE17.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000
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
the reply of GSP RPC commands according to the requirement of the
callers and the nature of the GSP RPC commands.

The current supported reply policies are "callers don't care" and "receive
the entire message" according to the requirement of the callers. To
introduce a new policy, factor out the current RPC command reply polices.
Also, centralize the handling of the reply in a single function.

Factor out NVKM_GSP_RPC_REPLY_NOWAIT as "callers don't care" and
NVKM_GSP_RPC_REPLY_RECV as "receive the entire message". Introduce a
kernel doc to document the policies. Factor out
r535_gsp_rpc_handle_reply().

No functional change is intended for small GSP RPC commands. For large GSP
commands, the caller decides the policy of how to handle the returned GSP
RPC message.

Cc: Ben Skeggs <bskeggs@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nouveau.rst                 |  3 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 34 +++++++--
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 75 ++++++++++---------
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
 5 files changed, 72 insertions(+), 44 deletions(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index 0f34131ccc27..b8c801e0068c 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -27,3 +27,6 @@ GSP Support
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
    :doc: GSP message queue element
+
+.. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+   :doc: GSP message handling policy
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 746e126c3ecf..e5fe44589bbd 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -31,6 +31,25 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 fn, void *repv, u32 repc);
 struct nvkm_gsp_event;
 typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv, u32 repc);
 
+/**
+ * DOC: GSP message handling policy
+ *
+ * When sending a GSP RPC command, there can be multiple cases of handling
+ * the GSP RPC messages, which are the reply of GSP RPC commands, according
+ * to the requirement of the callers and the nature of the GSP RPC commands.
+ *
+ * NVKM_GSP_RPC_REPLY_NOWAIT - If specified, immediately return to the
+ * caller after the GSP RPC command is issued.
+ *
+ * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire GSP
+ * RPC message after the GSP RPC command is issued.
+ *
+ */
+enum nvkm_gsp_rpc_reply_policy {
+	NVKM_GSP_RPC_REPLY_NOWAIT = 0,
+	NVKM_GSP_RPC_REPLY_RECV,
+};
+
 struct nvkm_gsp {
 	const struct nvkm_gsp_func *func;
 	struct nvkm_subdev subdev;
@@ -188,7 +207,8 @@ struct nvkm_gsp {
 
 	const struct nvkm_gsp_rm {
 		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
-		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
+		void *(*rpc_push)(struct nvkm_gsp *gsp, void *argv,
+				  enum nvkm_gsp_rpc_reply_policy policy, u32 repc);
 		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
 
 		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
@@ -255,9 +275,10 @@ nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 }
 
 static inline void *
-nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
+nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv,
+		  enum nvkm_gsp_rpc_reply_policy policy, u32 repc)
 {
-	return gsp->rm->rpc_push(gsp, argv, wait, repc);
+	return gsp->rm->rpc_push(gsp, argv, policy, repc);
 }
 
 static inline void *
@@ -268,13 +289,14 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 	if (IS_ERR_OR_NULL(argv))
 		return argv;
 
-	return nvkm_gsp_rpc_push(gsp, argv, true, argc);
+	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
 }
 
 static inline int
-nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, bool wait)
+nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv,
+		enum nvkm_gsp_rpc_reply_policy policy)
 {
-	void *repv = nvkm_gsp_rpc_push(gsp, argv, wait, 0);
+	void *repv = nvkm_gsp_rpc_push(gsp, argv, policy, 0);
 
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
index db2602e88006..f73dcc3e1c0d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -585,13 +585,34 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 }
 
 static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
-		  u32 gsp_rpc_len)
+r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
+			  enum nvkm_gsp_rpc_reply_policy policy,
+			  u32 gsp_rpc_len)
+{
+	struct nvfw_gsp_rpc *reply;
+	void *repv = NULL;
+
+	switch (policy) {
+	case NVKM_GSP_RPC_REPLY_NOWAIT:
+		break;
+	case NVKM_GSP_RPC_REPLY_RECV:
+		reply = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
+		if (!IS_ERR_OR_NULL(reply))
+			repv = reply->data;
+		else
+			repv = reply;
+		break;
+	}
+
+	return repv;
+}
+
+static void *
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
+		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
-	struct nvfw_gsp_rpc *msg;
 	u32 fn = rpc->function;
-	void *repv = NULL;
 	int ret;
 
 	if (gsp->subdev.debug >= NV_DBG_TRACE) {
@@ -605,15 +626,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
 	if (ret)
 		return ERR_PTR(ret);
 
-	if (wait) {
-		msg = r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
-		if (!IS_ERR_OR_NULL(msg))
-			repv = msg->data;
-		else
-			repv = msg;
-	}
-
-	return repv;
+	return r535_gsp_rpc_handle_reply(gsp, fn, policy, gsp_rpc_len);
 }
 
 static void
@@ -797,7 +810,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 	rpc->params.hRoot = client->object.handle;
 	rpc->params.hObjectParent = 0;
 	rpc->params.hObjectOld = object->handle;
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 static void
@@ -815,7 +828,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 	struct nvkm_gsp *gsp = object->client->gsp;
 	void *ret = NULL;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc));
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
@@ -876,7 +889,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 	struct nvkm_gsp *gsp = object->client->gsp;
 	int ret = 0;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
 	if (IS_ERR_OR_NULL(rpc)) {
 		*params = NULL;
 		return PTR_ERR(rpc);
@@ -948,8 +961,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
 }
 
 static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
-		  u32 gsp_rpc_len)
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
+		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
 	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
@@ -967,7 +980,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		rpc->length = sizeof(*rpc) + max_payload_size;
 		msg->checksum = rpc->length;
 
-		repv = r535_gsp_rpc_send(gsp, payload, false, 0);
+		repv = r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
 		if (IS_ERR(repv))
 			goto done;
 
@@ -988,7 +1001,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 
 			memcpy(next, payload, size);
 
-			repv = r535_gsp_rpc_send(gsp, next, false, 0);
+			repv = r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
 			if (IS_ERR(repv))
 				goto done;
 
@@ -997,20 +1010,10 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		}
 
 		/* Wait for reply. */
-		rpc = r535_gsp_msg_recv(gsp, fn, payload_size +
-					sizeof(*rpc));
-		if (!IS_ERR_OR_NULL(rpc)) {
-			if (wait) {
-				repv = rpc->data;
-			} else {
-				nvkm_gsp_rpc_done(gsp, rpc);
-				repv = NULL;
-			}
-		} else {
-			repv = wait ? rpc : NULL;
-		}
+		repv = r535_gsp_rpc_handle_reply(gsp, fn, policy, payload_size +
+						 sizeof(*rpc));
 	} else {
-		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
+		repv = r535_gsp_rpc_send(gsp, payload, policy, gsp_rpc_len);
 	}
 
 done:
@@ -1327,7 +1330,7 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 		rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0;
 	}
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 enum registry_type {
@@ -1684,7 +1687,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 
 	build_registry(gsp, rpc);
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, false);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOWAIT);
 
 fail:
 	clean_registry(gsp);
@@ -1893,7 +1896,7 @@ r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
 	info->pciConfigMirrorSize = 0x001000;
 	r535_gsp_acpi_info(gsp, &info->acpiMethodData);
 
-	return nvkm_gsp_rpc_wr(gsp, info, false);
+	return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
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

