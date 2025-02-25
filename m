Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C97A45089
	for <lists+nouveau@lfdr.de>; Tue, 25 Feb 2025 23:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21F510E816;
	Tue, 25 Feb 2025 22:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rUbI1tN5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E8D10E814
 for <nouveau@lists.freedesktop.org>; Tue, 25 Feb 2025 22:54:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNxlIQI4hl8ui7rOHHzLcA+Z5McdSWcnOsAlJoeMtxcve9yEkxB6A9bf1BZvstrkwmhicP4Z8ytwPyzPIa4CuTW095tMJO28FPJJkB7gpL2NN/ySqScq9OwC703rDNseSwnoTO+JxQYKH7tH0+hpFpPMVbv8pIQzsOlZHdnqBDLC7NQ7hK9pigbN4owpUxssyMogWG/VBU64CPYkkBreo0+l/OHt7jR8H53viaRPX1tjU4F4B/1h7Xzku9FxIvnq5GHgCezA9FLcqZiBRSQhtvry6VA018XvmTxV9i/9ESlA/Fu6ujEa3LMTU6aYQDD+7mW0YBe5GbrWdy6lWlUiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8dv3fFddMLbYyDlbmPfJDNe5iAuwNRNyBLCGEG3L7A=;
 b=toeEgqwmJOYvmjQFNsvZbMpQICVGzbH/n4GMhTdgN5QquCeMMsc4wK1k3gf2Xm5GSVCpH3cjd89D4IeoK6QpCIjVe4SCscBWk/XpaIEMPCWAH4uO0pBjCJgM2QJML+9HiOeakp4IwwvFOb/EZC0AHzgp2u5tiNXSKZEQZ2i1MaTpSuiUCZ+rrHxLO1DhNSj0HbflBySct8TnJKguBrjH3oKEdVASWlZOyHD+DPnq3iEENLpo9dbOcyP4QaNecGl0YmQSj70kSGWAJlqxGMUr2+rDTwZmyVeCsCcwcLKNa00ub89ZDRsrPXUXKwNz3Q5ZSUkrKcWQ7rVwxxhyNRrF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8dv3fFddMLbYyDlbmPfJDNe5iAuwNRNyBLCGEG3L7A=;
 b=rUbI1tN51rWH6gvsocKMMIRdn6v6/PZzXK2A1zw+bAbkOZqDpTFD+0v11Fr4I5JBce18TARDWFsi6sVnPB9fqes7wq7BFSHj0kaOyDuXlScN5oIfdwtyrIpkVKwFAppIusfZ35DkEYf6t8yQHxf1Z3xgTGtOgbZ9DXTindcvPSA4hGBTk+6QNBi++5fDpLzyam5e9Xn8uUkfqMJ9W1UfRxHj9iXP+RBEGX6ZYOf9vIXcDADfVzfrPzW/i1ssw38lhIVitMC2KGq+dfOsV6DdK3ya+1oFe43AKJpxQS714arZKWOlP8O5fTKeO4IkYJmizAGvGFVLOS7eaXXd+1xPqA==
Received: from CH0PR03CA0181.namprd03.prod.outlook.com (2603:10b6:610:e4::6)
 by BL3PR12MB9050.namprd12.prod.outlook.com (2603:10b6:208:3b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 22:54:09 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::78) by CH0PR03CA0181.outlook.office365.com
 (2603:10b6:610:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Tue,
 25 Feb 2025 22:54:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 22:54:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 25 Feb
 2025 14:53:55 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 14:53:55 -0800
Received: from ipp2-2314.ipp2u1.colossus.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 25 Feb 2025 14:53:55 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>
Subject: [PATCH v2 1/2] drm/nouveau/nvkm: factor out current GSP RPC command
 policies
Date: Tue, 25 Feb 2025 22:53:51 +0000
Message-ID: <20250225225353.12642-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250225225353.12642-1-zhiw@nvidia.com>
References: <20250225225353.12642-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|BL3PR12MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: 07bfa29f-7e43-4ff0-7ee2-08dd55ef50be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rPEJsok7HSFAwSAtH8Mu7SR5NqRPsbA/qauLNnvh04WJMKcRBn8Ios0m++Ee?=
 =?us-ascii?Q?7KeNoKDzJT5v/EkhYNagnl4g/3nbf7x3Vb+Pz6BceoJdOnDVfRtWMepCZ+de?=
 =?us-ascii?Q?PqJlMDsixp0aZJjMlPvd5D3GKGoNebroUMhnKkwf5j8YTES69Iz/IPvTkdkc?=
 =?us-ascii?Q?DavEpZO8qGU78CpcL3Wk+SKJGVePerZfy2OJV6W9/rmM1jqtSVGOCu+/IqL9?=
 =?us-ascii?Q?Ox2pmZ3V1JBW3KpFvZTahxik14B3sNG9FPPGxQdvkY0b4Y82b66KoNkzXc3T?=
 =?us-ascii?Q?EWkRlMreYVHU2E2P7UT32398769BSnYEs2qYvDQSexMZ54MO+3Mm8oCDMdBQ?=
 =?us-ascii?Q?YHhHpcK49mwQx+IAcyyU6C6ysaTNqd70XhBWO2G6brvxL3GF2nNz8679rXsK?=
 =?us-ascii?Q?B5nBgeHAir4R1miX+dCalFov0IGjeGmNkeLXaht1Pw0ZK5IEGncmKPdpCcOc?=
 =?us-ascii?Q?wv0cv6jggVLdUam+UaIjkEv3z+rz8ZAVVAnrqr5jzC5dfpuYyVNCXJjpW1qk?=
 =?us-ascii?Q?b5gHt7eYheRTrZ9TBTZRpmloUlOh48SJrsmXvMEsd7B5fnz9HFuuC/MrIgd6?=
 =?us-ascii?Q?OJ1xdD0yjlIIARVOOF9PKJLGOuUa8NYq0FYALSqNrOvIdJuZGESUxBFbTRky?=
 =?us-ascii?Q?il1DFmMUPUF9cLk0aW1H70VJv4PkUpdlF2J30fx3K7Hj0M10KAinCZlFlq5c?=
 =?us-ascii?Q?XeDD758NM/mdeXQ4sgHEBAFlTkpdqFWMvWcrT0ZTe8iPKblY+F3RQ2Z342I7?=
 =?us-ascii?Q?nTq6W2mfljHSMkUFdwmOlx316Se9PSRUjY4FITwdm7DMt1i2B4h7bGl59Foc?=
 =?us-ascii?Q?/o3OsXyLBn3o+857cP2vX3P9a6FB+2liQ4K8/77AKsLjBLV8rMxXhRvEu/BR?=
 =?us-ascii?Q?hiXp96y7KdWFrD1pWWRk7mSPcuhNTXj0hRUsRP4NvdYUSjHHE59YnajzEX7c?=
 =?us-ascii?Q?0e/zSbrHHmIrgOvzVd7m0DOYoDyff3OWCZh2/pwzYlGEdp6XsmoHfu7JJj1j?=
 =?us-ascii?Q?ZIqvI2Tw5wKShDi8qaWtc2BLVIqAeqPUIuapNzOhJIGVIal/DCnn7Pv6ZNHK?=
 =?us-ascii?Q?iLKCTGauY06da6OvhCQSwwdtvn8PUYooTvGwE48JKlJoUAP+1lnk21z6qP1/?=
 =?us-ascii?Q?BcL6WDMjAduFYLEBtA5L4XB4OVmTTGn2Z9p7l08uLAQSE9sqrBnT/oBQOXvk?=
 =?us-ascii?Q?+d8TtAAZSU0NRRwd1s44jpEWOziigdWDkANUJeXHeVTkC1kZnn8uIQbpoLo8?=
 =?us-ascii?Q?bvVGLGuF/iNMGgwXyRGL6vZfGxVDvrS4Ei7v3Dp8xeSPj9e4b24Amnhxa1r2?=
 =?us-ascii?Q?wykz6rOZ2UrTtfp+yG2yta3q3EnyBC+i/O2nt4lm1uIp1c7USuBRordUnBqT?=
 =?us-ascii?Q?rYeAdmqlIHdVocnxZxdba2lNQrkzXAuE8Sb8XUUVgTGQTV+qXCg+HniJrJpJ?=
 =?us-ascii?Q?saIIVhgjpbBCyNKywL2pPAQei/VeRNFH/2gDGwvttz7BRQtJrh2L3d7rFKZf?=
 =?us-ascii?Q?2W6/ZucGh5Ch2/Q=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 22:54:09.4653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07bfa29f-7e43-4ff0-7ee2-08dd55ef50be
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9050
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

Cc: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 Documentation/gpu/nouveau.rst                 |  3 +
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 34 +++++++--
 .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 76 ++++++++++---------
 .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
 5 files changed, 72 insertions(+), 45 deletions(-)

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
index db2602e88006..0465fcece47c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -585,13 +585,33 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 }
 
 static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
-		  u32 gsp_rpc_len)
+r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
+			  enum nvkm_gsp_rpc_reply_policy policy,
+			  u32 gsp_rpc_len)
 {
-	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
-	struct nvfw_gsp_rpc *msg;
-	u32 fn = rpc->function;
+	struct nvfw_gsp_rpc *reply;
 	void *repv = NULL;
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
+{
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
 	int ret;
 
 	if (gsp->subdev.debug >= NV_DBG_TRACE) {
@@ -605,15 +625,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
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
+	return r535_gsp_rpc_handle_reply(gsp, rpc->function, policy, gsp_rpc_len);
 }
 
 static void
@@ -797,7 +809,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 	rpc->params.hRoot = client->object.handle;
 	rpc->params.hObjectParent = 0;
 	rpc->params.hObjectOld = object->handle;
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 static void
@@ -815,7 +827,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 	struct nvkm_gsp *gsp = object->client->gsp;
 	void *ret = NULL;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc));
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rpc));
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
@@ -876,7 +888,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 rep
 	struct nvkm_gsp *gsp = object->client->gsp;
 	int ret = 0;
 
-	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
+	rpc = nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
 	if (IS_ERR_OR_NULL(rpc)) {
 		*params = NULL;
 		return PTR_ERR(rpc);
@@ -948,8 +960,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 payload_size)
 }
 
 static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
-		  u32 gsp_rpc_len)
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
+		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
 	struct r535_gsp_msg *msg = to_gsp_hdr(rpc, msg);
@@ -967,7 +979,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		rpc->length = sizeof(*rpc) + max_payload_size;
 		msg->checksum = rpc->length;
 
-		repv = r535_gsp_rpc_send(gsp, payload, false, 0);
+		repv = r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
 		if (IS_ERR(repv))
 			goto done;
 
@@ -988,7 +1000,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 
 			memcpy(next, payload, size);
 
-			repv = r535_gsp_rpc_send(gsp, next, false, 0);
+			repv = r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
 			if (IS_ERR(repv))
 				goto done;
 
@@ -997,20 +1009,10 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
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
@@ -1327,7 +1329,7 @@ r535_gsp_rpc_unloading_guest_driver(struct nvkm_gsp *gsp, bool suspend)
 		rpc->newLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_0;
 	}
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, true);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
 
 enum registry_type {
@@ -1684,7 +1686,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 
 	build_registry(gsp, rpc);
 
-	return nvkm_gsp_rpc_wr(gsp, rpc, false);
+	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_NOWAIT);
 
 fail:
 	clean_registry(gsp);
@@ -1893,7 +1895,7 @@ r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
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

