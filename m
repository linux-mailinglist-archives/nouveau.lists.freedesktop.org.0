Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5BCAB2B65
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3110E1FD;
	Sun, 11 May 2025 21:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O1gGTQS1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC0E10E1D7
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5z2MtR05O4nR4Fk2sV8ts4iS5aHPhG5m3fwa5w3Ud8BaoAjmyMkN+R45Z+DAFIe/fGH1DW64D9Jn7djnWxb8tBCgd1BBz+A4YDTk3XY3n3/ltMetbG1QTDVNpByB/klcrULx3i0fSWXdVFMxMIqP8EIb7Btdl1GQfYorjvGLZ8wcI4r5r5gDb4/RRCRM7VPL+bEayaViSaiQruEpLHBfrfOJPBrfo/6+B60ARIQyKuUX0iDm6zrO6ip+jc+d2c6fcgcpiGjM0c2ddjqYrXOHPHdjkn6cahVUeDz8noLVcjMWwvEQB5wLwRSUCi+fFujopJVfrVupsyzcPzTm8jJQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6aqC+iXvn4/+LR+i9lpG2fJDPSAXH5pZ3/JtFl2WEw=;
 b=LiBWiZqDAc79LDqnQWu5TXkxsos19wtoz8dG3CcqZPD/RCsieN5KcPeetrIydQSYYouil0IZmQQ2oYI4RtYYIfPw/tVLcvykc8ruoCjCZEBmjAAhd7UNcQEH+1vGvtr7X5f8hSVxp6i/Dp5QCo/nQhPxLI9Tj02NrrHdDZ/32l/m02J99yu0a1kXlzlmjuIc5Lwye2XpYHTDKJacpkECvoQ6+vlWKfoYV4RYI5voCeAkchUxtowM0XbPjeWjrxMUcyZRD0fp1tfwEkacFsqWcut3lHfqF8/tKHDy5ZB+n1jZL7uxcXdVcnuZwLazRcBmbx2YJcyTTxMgcg7L+udNtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6aqC+iXvn4/+LR+i9lpG2fJDPSAXH5pZ3/JtFl2WEw=;
 b=O1gGTQS1ranyjE6ArGfgz5Zekm0P9I6Ysthjga1qcOG2y8dT8O3JnU5WT6y/VIXwsAubnZihehf5UG1bCBSDm/cWo9PlFCayQE2EnE5GgbtQ7Pz9UV6qKJNT7L5FW8mPbF+TJJGkBVa0BnTVKxpRRCmCZlq/i9GuIRgy2pjom3ZSC7DZKLRaZEXoVr5GyJuYgjwXerlMuah9xMaUBZy+lserpddK/FrzFIlSs9C9s5f93QqmjFrsYHUcAqoZob6qNUaGYilEIStRPu/ZPP3AmKJzcDXMTUgaTloEClMw1bz/NHSITS19WIvpqYS/swOJkjuQojWpgy1RptjxfMfYaQ==
Received: from CH2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:610:4c::27)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Sun, 11 May
 2025 21:09:06 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::96) by CH2PR10CA0017.outlook.office365.com
 (2603:10b6:610:4c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:00 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 34/62] drm/nouveau/gsp: add hal for gsp.set_rmargs()
Date: Mon, 12 May 2025 07:06:54 +1000
Message-ID: <20250511210722.80350-35-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c785921-9aa0-43e1-b646-08dd90d01087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pNWIMCnGvW13ASwydsYB5frnO3AlDlr9v4OnmvDjJDwn3tRoTUpvb99OQgIs?=
 =?us-ascii?Q?iwd+HtOl06FxuNHhZ7Y6qbzLcUg9xg5TdGUna4PC2QcyX5te0oYyX4MDaUbJ?=
 =?us-ascii?Q?oGEfqhI5jBfaKdlhEHSGhVrB+I5KwAe3dIkXYFmhJmy7nvzC8/QtvqCkrhaX?=
 =?us-ascii?Q?z1G8PBp4bQ9u2gSgMZAxPjUkroenRWVTFQcz3BnqLM/J8e+hvIK0eTB6JIW2?=
 =?us-ascii?Q?FMy7+tglyfHvVfiNprPX611JdZqsQfFd0qsFy8PZh0GAEIcl4TsS7XytZlIL?=
 =?us-ascii?Q?soX7En7uPVbxe9ts6CC9KnPwZSpC+blG+kw8uTDbJ5jqi8XB48SmNNT3jUeS?=
 =?us-ascii?Q?thVcZmpDHF2iXN7dKbJtNzCvswPtjynzmX93BJ0lBOj63cnFV1tfUGdpIrUM?=
 =?us-ascii?Q?orRqykeQD6slhbZoR5DRgJW21qTU5pdv5Wpb2D3Dm1DnrrTD6FRAY3G5woO5?=
 =?us-ascii?Q?sPzM8WVviofSpLlZvxCMfUocWTdYdXqiRjmXqkbePYIQkrkvXGoER39xcZ5B?=
 =?us-ascii?Q?7Yq86JzLX1dIgkLOV4ZVrMiiIZ5zRz7DY7ZZ+8Yu9gtgkN5xY8p18SsVAqLi?=
 =?us-ascii?Q?GMSLj15y4f8CzHqRriFRt9dhm1jp0D6atbNRDsRHMY2gQbz78i6Zcx7cJZvQ?=
 =?us-ascii?Q?Rw/xs7CCp5EGaYMUwTsedMnKamhK598OJRrc5vV23pgJsF/hNS9AAjrqY6iA?=
 =?us-ascii?Q?jeDH+x1txQsKEUt1iv0xchiR3X0J8Pxs11K1qjXbY39b81vyyNLHUGAEQglK?=
 =?us-ascii?Q?FXPZg9QAqtZ8nWxQ2dTuu61nFDOVAy0pfnNy11pKXQtLQIQoTM/yUzikxQ1r?=
 =?us-ascii?Q?f9AzWlxzufSa/qUi+RktB5ur6ExI+oE9/qXU11svqeCbyDO7tIzwCLdOR43J?=
 =?us-ascii?Q?nru0BFtjIhaCbtzLoLOXl/p47useYGCbeJ550TfZKPmNPFmUeP4zprM4n8SV?=
 =?us-ascii?Q?zDrGQIXOolNAgKY3AfKDKyAd8n/ansiKKHH8rn3kSEPulOJvAokb6YfyQwLM?=
 =?us-ascii?Q?v0Xzd8oZEGwAzQW17SvehIbofQ77OmTb7AxWcT6ykS/XR/r1WcR4V2/TCXXm?=
 =?us-ascii?Q?/MNj4WsdTm3BRrWCzguc8qBsCtxbKk2e+G4WXQD8/+8CFuVbB3/H8XOlD/aR?=
 =?us-ascii?Q?ewlFxUm265boHTAhwiyyH5jkk196uNgnDxjGjFPjl52Sw9hzwl+gv8gYkotr?=
 =?us-ascii?Q?HgPcwFQ9N02ga93lyP4TxcFCEq72Pnp/LkYz69MNN64ihJ8P+DOx3lBqC0c+?=
 =?us-ascii?Q?4pKdpXDics0d71s1xa1XlTm+yOFfXJSMsiCpQefFuNJk9b2btvH8bv2pkh8N?=
 =?us-ascii?Q?TVBI5ied2CgF9UpC4TOzwWGcYi52CspiXsnZVm2ZgYbIrxAskJAZ5SbzF8wh?=
 =?us-ascii?Q?ri9nHTQz6KLf2kT70AS2nkFuq1tMtSgY7tTnZSAn5DaJhaLu7pMt9hiZ7T1B?=
 =?us-ascii?Q?/Lv7OjvLN616/rhGCWBSyyfxwbww82eqUvFQbsNBydtXxUuOI0zHkBd7BnhN?=
 =?us-ascii?Q?/J6+stJWOENWzP1hxBoEwL64uZotK3CAiH38?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:06.0161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c785921-9aa0-43e1-b646-08dd90d01087
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123
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

555.42.02 has incompatible changes to GSP_ARGUMENTS_CACHED.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 -
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 36 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |  2 +-
 4 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index d42ae235d2f4..c8429863b642 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -71,7 +71,6 @@ void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
-int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 218a7141ba97..2df551d61abb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1201,23 +1201,11 @@ r535_gsp_shared_init(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-int
-r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
+static void
+r535_gsp_set_rmargs(struct nvkm_gsp *gsp, bool resume)
 {
-	GSP_ARGUMENTS_CACHED *args;
-	int ret;
+	GSP_ARGUMENTS_CACHED *args = gsp->rmargs.data;
 
-	if (!resume) {
-		ret = r535_gsp_shared_init(gsp);
-		if (ret)
-			return ret;
-
-		ret = nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->rmargs);
-		if (ret)
-			return ret;
-	}
-
-	args = gsp->rmargs.data;
 	args->messageQueueInitArguments.sharedMemPhysAddr = gsp->shm.mem.addr;
 	args->messageQueueInitArguments.pageTableEntryCount = gsp->shm.ptes.nr;
 	args->messageQueueInitArguments.cmdQueueOffset =
@@ -1234,7 +1222,24 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 		args->srInitArguments.flags = 0;
 		args->srInitArguments.bInPMTransition = 1;
 	}
+}
+
+static int
+r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
+{
+	int ret;
+
+	if (!resume) {
+		ret = r535_gsp_shared_init(gsp);
+		if (ret)
+			return ret;
+
+		ret = nvkm_gsp_mem_ctor(gsp, 0x1000, &gsp->rmargs);
+		if (ret)
+			return ret;
+	}
 
+	gsp->rm->api->gsp->set_rmargs(gsp, resume);
 	return 0;
 }
 
@@ -2179,6 +2184,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 
 const struct nvkm_rm_api_gsp
 r535_gsp = {
+	.set_rmargs = r535_gsp_set_rmargs,
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
 	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index f085e25e4e08..3d677e5bdd2c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -29,6 +29,7 @@ struct nvkm_rm_wpr {
 
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_gsp {
+		void (*set_rmargs)(struct nvkm_gsp *, bool resume);
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index a07f59e5ef7a..b080a8da1caf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -183,7 +183,7 @@ tu102_gsp_init(struct nvkm_gsp *gsp)
 		mbox0 = lower_32_bits(gsp->wpr_meta.addr);
 		mbox1 = upper_32_bits(gsp->wpr_meta.addr);
 	} else {
-		r535_gsp_rmargs_init(gsp, true);
+		gsp->rm->api->gsp->set_rmargs(gsp, true);
 
 		mbox0 = lower_32_bits(gsp->sr.meta.addr);
 		mbox1 = upper_32_bits(gsp->sr.meta.addr);
-- 
2.49.0

