Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7B5ABA719
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A32D10EBC4;
	Sat, 17 May 2025 00:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qHTWIBsl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C158910EBC4
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTQFwqLpj2/Lpi2BZg07REBiVRU5Wa47pz0yzSyhy1n/o91bBOMea9ZAaMYymv2QWQgDxX0mixWKLjuvLOu6+Xs10+rqBUqoSGXL5zHzqNoXCemqlpKhuV32F798JEBmvYliMlzjXzq7vgHoE+kWxV682ftiuAj+oR7EIsNgnueF4uVeNUEy5vz7msmWzfvh94/ieYh9UuSMis91pktxGETglow0HD0KiGp8gby8P1jr+Jn03qm5OTH1z9l2bMoO4R7yMzDJ0cgCMoy0vGnkW0gLBreJtqsVvQtgKGROLBzdJC7pZcm7WL71tdhMISlw0nWD/MQQ1qnM1dP95L+oZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoHimAetnIraqkkUaBbDdLnGa01WqcQoPJCIZ4PjN8U=;
 b=Cs5t8ocwN13ZIYxTKpxzuYWdj6iCBNbRBSeFgjpjQ8ry2Vt0HFqGJiSbC5S9coccBZo5C6IFdu+ci9BRZiyp+gRNy714IqZuGKvDFvxbuuyJtf5Zus13k+m8spzuQ7O2dZ3dp7HZSI3wi9oj3Aq/bcTl8X/7cXZOzC6baM7zyv3Kaq65A8ZsQ3UUzt1Z/cWleIbmhvd7GUU4KGr8NWe5DI9xx3xfwFSvbm7zCp8coNV0tTM43elciEz3PgS94c3PXb9pTBP1HO9oFfsgOaF1rNnOdVnOzeaUe/WK2QdtnwraS3Fv5pNUI4bVH3tv7VM6PiKFyIIYaQN6rkhpdBf3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoHimAetnIraqkkUaBbDdLnGa01WqcQoPJCIZ4PjN8U=;
 b=qHTWIBslpoxSsQpgCk+CH21K+j2sUqmhLmXgSxDaISULksWKbAdPupJ7zeJr0EeuOQzVU/IuDGHcKG3qlCozKwaYD9MnnblJYpItwZV0y41XcW1Cb9gdgMy1woxBcNNIIKMY1pfNB8rs1RnDkPw/oGtbqICQpRr+P85vK68gZyqzNjIzAioFHHH+Rs+9Y6Kn4zvzQkrdEtND/SASR4s1XgnhKH7xTWaJZXRM9nlcYVMV7M2yIu/vLjIfYtYFGqRZDCRH9R0mUrkcCdfCQoSPbNo6Tg+aJEML0Mj6lj/OSZu4f59aDnE/vd3AclaMH9gD4EGun1LUSVCyaI5xQ79i7g==
Received: from BYAPR06CA0045.namprd06.prod.outlook.com (2603:10b6:a03:14b::22)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Sat, 17 May
 2025 00:11:12 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::4f) by BYAPR06CA0045.outlook.office365.com
 (2603:10b6:a03:14b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sat,
 17 May 2025 00:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:57 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:55 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 33/62] drm/nouveau/gsp: add hal for gsp.set_rmargs()
Date: Sat, 17 May 2025 10:09:25 +1000
Message-ID: <20250517000954.35691-34-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 39347b10-c6b0-44b8-72e6-08dd94d754ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ioZ1+HrVkytFRHbEFwms4VTklOPYtfxAp+Q3fAeOMbhIv3/SMhXFU+kEx/VA?=
 =?us-ascii?Q?mof1K9KM/u2K5YXubUriAUdXo7llGWJANUqsxf0viikx/njhBNsPcyQwBB6j?=
 =?us-ascii?Q?tnNPZK2tfAXWH9eeHjkDi1DrdsAd9N5fDpT1zO4hZuXEJeqLmGDU3luVfWHK?=
 =?us-ascii?Q?Ee+yu+29LvBHDDW/mghVYQh+XqfODehbhCp4mQEQVzH/JuMMy3yarDDZEjDT?=
 =?us-ascii?Q?8EfxzLT9U1wWewEb9E9Q4Y309qhWWmZ0b/xl53Ll7k7hDPsLfiPQ3PL4BSZ0?=
 =?us-ascii?Q?r/vIGOcJKP34Sg4lEO+hOhfHLFRz44aSYZ9PfvFt+/9i0jRF/4PKnNQgZ5KY?=
 =?us-ascii?Q?IGAJnlzf9W/w/dgUS3eBnl864/izL/3HSODk+UppT6K6WxIg6iLEWlzVElE0?=
 =?us-ascii?Q?LBFqPYIMIxGRQ4qdMkPDdjgQvDlX8c8SpEgskHdXlBV0S7MGCUJ8CVo4QhrY?=
 =?us-ascii?Q?ni4LxkywnKnTGgoEq6hloIp+GeVyXUPqtKyfkryN5iunb/4E3t2cE0+uwY90?=
 =?us-ascii?Q?ijzdbn3ISRbkBziJyRN2LEIln0C11kdxaHLuw7MR2klf/FJyO4IuE3J6/sms?=
 =?us-ascii?Q?kcLaOKmQoCDnYkJ4fxbfokXzaOVV3GOK6W3J5iAd5i/4uomQiEsaK3bZ8EiT?=
 =?us-ascii?Q?1y+AfHuWHJwjqVWPKt+sHhrUTflaNe2WaT68/KQTfy3pMkl0I0UNo5Hwj1AR?=
 =?us-ascii?Q?HLWlmzNNAQdhX47AjYpXz2EENxbbYH4bufZsDPGbWLmFCpGkmlbTSV0UkblP?=
 =?us-ascii?Q?VxXkZgZfz7okYH1K3DckAoL04WfXKDlsietfYYgwX/KeT7XJeuVogZrt9AMt?=
 =?us-ascii?Q?llRk59tbfv7f4u1dRGzhkTuVB9MM84oe9CMsWxeDQ7Kr+z+JhxyTJ/r+ZWab?=
 =?us-ascii?Q?OKFPI6nwcgl+uow3VOHc1kDdkyDKWKxS2vBI4Wtf/nvDTi0cKfRXRfBXbBBM?=
 =?us-ascii?Q?1pIQA87u4koaAybwU4TLs6/1QD4jMrYYC9u77yOX3oomuLqrOCHDGC/YwFia?=
 =?us-ascii?Q?kdykZhFHCNglLN8MNo9ZRSnLz5OpEHrqyLPMFootoAF/OOVoLhOxZjVtfShP?=
 =?us-ascii?Q?BOe0iB7OkbKzN1P/gDeosOYlyxa1/eK6Ri+EX3FzWamwGVOVzd98hn6VQo8R?=
 =?us-ascii?Q?e4Wf0LY0FtRRtQf9OOTYDj3/kMmKLnZzboy9hYrmrQOzez+i7++l3LFZTjbZ?=
 =?us-ascii?Q?I1I5joe2lzEiJDfHQKC0HOO0zKCofNvQBDmV8rJKo8cmWVOEy2/w9wosIy8R?=
 =?us-ascii?Q?3W4ZsOjA1FeWFxMX5evcvOgmqyAO95pAATDwMlvTLbnSStLBZS+AwkY26fxX?=
 =?us-ascii?Q?EB8XVx/f9jbhefvCPJf+tLyP6hJuWfm93SEKhCK/XMBr34MsF5pfn9V5s+2k?=
 =?us-ascii?Q?Tn2xPtrlJIdBxtz/W4dJK+jbjJDmmMM7l21SFT2kt73NmL3Rd6alQd3DThyW?=
 =?us-ascii?Q?O4VdpVnJm/HJHfMWR7awc7nJ4YZJzpaKKl0ly2svQQz92njLDtZjAihgVCSJ?=
 =?us-ascii?Q?k/fmfy/xRE1P6rXxzt0TUBmWO2X/gKPew4Bl?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:11.6799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39347b10-c6b0-44b8-72e6-08dd94d754ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
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
index f7cc8e03d999..0c05a0448766 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1196,23 +1196,11 @@ r535_gsp_shared_init(struct nvkm_gsp *gsp)
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
@@ -1229,7 +1217,24 @@ r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
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
 
@@ -2174,6 +2179,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 
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

