Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC2AAA3C93
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F12F10E58D;
	Tue, 29 Apr 2025 23:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X47RB/OW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F8810E58D
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzy/GFjK3Q8ZoYffzTEPcd55xtJRR3R8UXk4uieMQ291I0jultFcTRf7OxbGphW0XrNYZ5Rbwd1L7gG5XTvOtyZOuvPAkQbWYEHyzdlAaSfSrzgcCtFyZtthkGZMFhbNXy7x+tEa87AWueOhLxLj538dm3oD7wRgm88354lifDm8snzMdbGDa9uraKTDu6h696BIoplFen+zBB5Vke4uQOZEU5g/4BIX3RifwEusAqln3fdhOivUwSZs/Gf8nk6C6Cf7ZnMvRNrW1AqdNn3eOg9fQJmS1Yfh90Qj3QMt+KrR8zhfkGK+VLqsmE9LJB7PDtiSCbUNr7q/wjKTg4191Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qbeMGaV+8G+5LjTCsYS+Rv2AUWJRhHUnVR+NTBgIQM=;
 b=Zf41DmubeG+mHN3JGqy1Zzvqh9/Az5rg9qK8ihOyWnjT3KhNxDvstRRCPV3IwBVpze69jvDeCEXDqqBCkDLn5hf0zkBTZsN+XTebwzcMDw26xz14DtK2wzcRuQWJjN9c+Fju7TNX2zbJV8joxZITC5iBdjmCYDOJ2ZpVrBN44KmEASd1+wGIp1C+g9pEJ0Nphv/bM0FAQn98SSjDo8D+cBn7mtnS8EWnt77gklwVn2o+PylWgx93Nu5Y9tLY1zeRo+DD25g1Lnp+4ECm+9nmWBqR7Ms3Wu1E+qvmHFGVvzgnZRqqZUzXYYxbOUaq4KnSDGkr8KboOecuC+Qtg3ypLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qbeMGaV+8G+5LjTCsYS+Rv2AUWJRhHUnVR+NTBgIQM=;
 b=X47RB/OWv/j5cA3m3Mk/H/5xbmy+pRW4tjP7FeseUnylJx8PEVv1Do9NB13YESl6lqb6i1spDdlZwHAuSRhjUk20EpPN2inUcQvGDvk10lOVHqfy80QSOB+4v8oFzZh4d2rLceLjRGq6erKiSISCs/2FfPYH/GzJEboIqZ3VqecWMKaPSr6eYigBit0uMxsrp0UtaoPZEHekufP3zPp9bOeM6QmyW8mFxsOWfLzsTGuvCfNUsw8oI7o7rFkK3bLJvhsshb8dUS0ATcY3oMh/WtY9O7oy4DlOhktxdN7PzAW531mERpZiHoHoaO1wItdU6BvQP0i+RwS2Q6DZ52k3Lg==
Received: from PH7P221CA0042.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:33c::10)
 by SJ5PPF000ACABD1.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::984) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 23:40:34 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:33c:cafe::f8) by PH7P221CA0042.outlook.office365.com
 (2603:10b6:510:33c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:19 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 33/60] drm/nouveau/gsp: add hal for gsp.set_rmargs()
Date: Wed, 30 Apr 2025 09:39:01 +1000
Message-ID: <20250429233929.24363-34-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ5PPF000ACABD1:EE_
X-MS-Office365-Filtering-Correlation-Id: 48832bc9-b855-43bb-82b9-08dd87773c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x3tBiwDr10tVU6EtIQRNpK1UktcRJ3myZuG/1/X2ZPKmicUDUN6o2xbhSqiV?=
 =?us-ascii?Q?bh13tfd0pr0vDCv9byqn3d/deJN55vQYmv6JQpmsZwH3XFg5Zj95tZQIEYt5?=
 =?us-ascii?Q?c6beVv54eCppiH9wRUDK4StZKdxqDKkT7L908VUUnWslzQtffR5W9KMYutlM?=
 =?us-ascii?Q?JFWR3yRnAX2QF4AuOHOssJ3FyhkQDLj7DC0X9Xg8biIWfpNOnShxWJoSP7E6?=
 =?us-ascii?Q?gDjIuJmTKA6sYHHc8rAOJ79VENui8ihbAifduykKcjQUJulKZOUNr8TWpM2E?=
 =?us-ascii?Q?mmyxIJj4BthXC/sGsKTEbI9vk7MrcFnG3/YNGfVKR7S65paQcyObCAVZakl8?=
 =?us-ascii?Q?dkwGJEaqjkl2MsN9o28/U/zBqDd1DqmP0yWlqY1dFrvGALfskj0JyXJrDgiz?=
 =?us-ascii?Q?sS7FDEB/0OxbRvdNCq8Cu43NXNKeK8ihbQZMuU6xt9/XdplyZ640REO7vW5v?=
 =?us-ascii?Q?5n2zIKSnG0pTbrgmGd6EMgBOn82cDtjzBScUPNyCUZ5x9uenE3exZHgBM4QF?=
 =?us-ascii?Q?YA6EFfkRK7HappY60ROjns3SN6M1WT45Gn9rEMnmTVkZlAeZmzxcY24h9UIh?=
 =?us-ascii?Q?+T9hUt3g4M5JrEkOjNHpL2BFqtiUIIT7WtaDB004NFnGIZmR2rPAlJHnWL6Y?=
 =?us-ascii?Q?bnvuI16sj4Mg68bdAkMZ9j1FHEvEP3RrefBpgqHO8zLCxE3jHsQyXX+zIRNs?=
 =?us-ascii?Q?9+eGCGs1e6d35Bs0NwjZIeGzWNnesLvhFgbOmpmHL8dps/WFSze5rQywdREp?=
 =?us-ascii?Q?y3hB8/zi/2zZoe1RE9J+x46P/KhVrCHtZwqOEL6oS2lQ95im/Iv+CjYysx2i?=
 =?us-ascii?Q?4bZljzl8ZaAj95KsuLRDfrn7BYtPcs/PkAtYGEzIotOGbc5I1ttzCnz3rA1T?=
 =?us-ascii?Q?TtWz101+po6xqEMRGSWSB1zM5J5ksaGecgRgqDyhqfDWuPVRZ4OoXPE4OSaN?=
 =?us-ascii?Q?OTuaOcMy+Vvun82inROkoLc3I3cHSATs+byW4EkQDutxRMN8S7tbp8nh2lGE?=
 =?us-ascii?Q?/4RelnC6gdCPZdJWqiUHDchafMRX23JIhlkLLzcBuYa2ccnsFarNpAgLPV7e?=
 =?us-ascii?Q?3215z8Q3EYhbZidWR2p92k4uh3q8CepdsmLUIjax+4GRHKvXahFQsKzmM8r2?=
 =?us-ascii?Q?eBUTqwmxtp9EBB+1lYDvOmocSPgn9uSdgX+nJ17zkFTH0oSl4QlVt4P2F9q0?=
 =?us-ascii?Q?oZ7CDxaubAdmf299UbffqBBalfzONhajaWJOjbw4lMkUR6N7sq5tyyc/XnrB?=
 =?us-ascii?Q?r4jO3yllb3KGeGiGKKjmpZyLSe1a0+uLopwJgsWzjhLhkG+HUihqAgqSlwI0?=
 =?us-ascii?Q?/P8VpTeHM1StWr0PJ76RdMYoSmsxbcHkLoxuz55LLM3HsVUsRJwfNNTWqVXz?=
 =?us-ascii?Q?dq2WiCARSOzByvfkVGpAVQoRMRHRcXQjB+ZMPNVrZi0h4YH6vp316mWRwjhx?=
 =?us-ascii?Q?5heQKpxkloXYfrrVLU92LuGrINJn5Wh4MfPKkmBSBG9DBgcC9407Xh36iFRW?=
 =?us-ascii?Q?1JsL2ULYA2uwMv44jLB0xlJHS3ZxhokeaGTD?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:33.8388 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48832bc9-b855-43bb-82b9-08dd87773c55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF000ACABD1
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
index 85c100ab9cb5..173191bdc503 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -28,6 +28,7 @@ struct nvkm_rm_wpr {
 
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

