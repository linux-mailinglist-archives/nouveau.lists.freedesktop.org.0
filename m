Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF0AB2B74
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB0E10E267;
	Sun, 11 May 2025 21:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kQGITmWL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A28610E26C
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJGkvPqFU9Gpo2kNumsnyJORoyCShFIxadEkd00G1MCdMAGm4KOCxkLOEQbRlcvLLNL8OO/eLvEe+iG9DzauMOw02emlsRe7468UFf//oV/32ahGEzj3uyVsewNS5XZXikhG5lXNaGqhTDD+h+bzVmgWB1om6TlKbLRcaMhE6RkW34PIzX2Y9yDz43MwubVP/FFsibUeqIM4dDaxV6t/8yA3EKBJDBXE31KfvX1EoccJuN8sznMRBD4wsF9Vdk5HLuo2LXH9e6pFXK0jiQLrWZU7JaEsHVtxWmTg11C+Sg0PLGURcahRqKq9tJAITNLSNeP7jI5f7WP+rrU/VMF4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEhyLbAfkYFBGRWV6nJoErEQPoCFoixRMt331PBn7pM=;
 b=WAUJlm0XNS7Ntn94xVHxh3QGSsd5lVHJqjc/TtFEp4r3MdC5myyIxiNNtXPKTzW+ipOkn6TVWm55b/MPZq/3bw79eghLzpnv0ABU5uuh6gXeTKVhD5C4nsMTqLIKWiGmOPZic0zzyPFxeR1vB/KuHKM8KJStHRKClmk1cJURPEX9OQSlSwy2Jf3HR4Ly4Xw7dfiRbH7ujgY4ey/l7H40/0K8Wm50yF3xrzMspnDjGrxv1CfCyYfLln9PdNyEDiPBPI9rgUPyygxRSUo4VyytGrT+WR6Ofm1NaGg9dy5xNAntD7JvGfHIrWu7qDU5HmA37ii8nfiINvTDtKLjZ6JP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEhyLbAfkYFBGRWV6nJoErEQPoCFoixRMt331PBn7pM=;
 b=kQGITmWLPXEwbzmsSC0Hx4Ll9yoovX49wA7RyehRp49/Lrfh4+s6GyPF3kqmx4nt6iMHnY2N1nsuxZDizLBgD/vCihWKujuVjEKve1IgVy3A5nXcFuKUkLRLJ8lCCLfKU0a1kDYPKdQovFWycQwQuCEvrRIKqj6j6RWfvwuwE5XKKULgMUhvBSIUOB1W9dTAvTBQsbenuNmf5yibYd703ks6cf1REreBcV9uU0eyfCDJyspco/MDn9v2FcIQgMitBIEb++yaLU65fy6WTJIShDpllSDit3Hryr59chlxxqwNB6AS5WdCnIDESMhgwdli8sLFqGhMDW50uGTxaVzRow==
Received: from DS7PR03CA0084.namprd03.prod.outlook.com (2603:10b6:5:3bb::29)
 by PH7PR12MB5594.namprd12.prod.outlook.com (2603:10b6:510:134::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Sun, 11 May
 2025 21:09:33 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::d9) by DS7PR03CA0084.outlook.office365.com
 (2603:10b6:5:3bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:09:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:26 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 49/62] drm/nouveau/gsp: fetch level shift and PDE from BAR2
 VMM
Date: Mon, 12 May 2025 07:07:09 +1000
Message-ID: <20250511210722.80350-50-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|PH7PR12MB5594:EE_
X-MS-Office365-Filtering-Correlation-Id: 4551dd63-7880-4a4f-feb8-08dd90d02070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5hYWFqk9rc+brcy7ywyfXzIb7QcmghtQ1bw3NoY3JfK4P8zfiNQSXk0rDT/1?=
 =?us-ascii?Q?7iisTHYdqFw+DIl9YUovHS3jxB3DEWJlcKzBwptWnhlTxtSBusSeEkkNgP6d?=
 =?us-ascii?Q?cGhOb6xw7Etgr6gJS2utOGi58esDcq8NbeJ1SVuLwNjzCqfeJJOeRViwBM6b?=
 =?us-ascii?Q?7Htpknj74QUkbiVW6j0R/9OV87k4nS1W2suFgmQFSpycBTj3FGM5b2M6634I?=
 =?us-ascii?Q?rAs6zMq7dKFP0VsiGytzEubs6pK1QbtkDtZrmSlLvz0iAcce7WcC25HjkFH/?=
 =?us-ascii?Q?v06Ie2T3znjuCe3sc5eHl+TcEpoBefcvenve/EwoUCs7nMNf+ZbNL4xMrQfH?=
 =?us-ascii?Q?o9v4+Qokc/r1K/X3Xkg/uKIJp7R+iaLnxQWhWvFPg1SJgRmkDAOiXrlUbaW9?=
 =?us-ascii?Q?Rlr1pKm/an8oFrGfYJUNbRD3SP5/K9NGPZ7Bz8Y94RTPnt2Pd5Olok7lj6S+?=
 =?us-ascii?Q?AE4dTP/+ZNmnX3nU6Lmez5qtCPZGJjEYJXbjE68oaFlFVOp5qa9Z9kLvQcLB?=
 =?us-ascii?Q?BVfvmba7zquwmGl9fMN75CGhgxyHznnfeh3NPfLPKmdfoJUpAGqtgqtrubK4?=
 =?us-ascii?Q?L+ZlbACoQwcOhz1j7kHyZ5aI/3FfDqqNZhzSCHCMZkpu2JUdblKhszOIpxhX?=
 =?us-ascii?Q?P4UoDLeFbuWtjYiAlP4Z5Bbgi7c1YK/Ps3/NpnUM3gRyEmoSj0WDfZMRNDQB?=
 =?us-ascii?Q?A7TFaSiiIzT5d7WVTF+x9iyrnR8OqlV7OsBIVfVvjYxTe4+Ubyuj0NrfOLuU?=
 =?us-ascii?Q?rbivHUqBz+ITc1Q20XjoTPvg2O8+ld39CzphLsaHd5VC6SIXOtDShTwYez5s?=
 =?us-ascii?Q?ZAfNThrJxSK56KWSTbTi7NHy90erO2eQAV+AS9oimBmxl1d/IXu9TbrZpI2R?=
 =?us-ascii?Q?MNV3Ur2Sep/7Q0R9p6gHBIrj/5I2SKNzqLxkDENDXAgOVfBcSmLnOCf4GZHl?=
 =?us-ascii?Q?eOAlAULKmB/ls7MDMgDrUnBwcPRMNUAsqUhi4vLhauAIlDG3853xT58bDcNT?=
 =?us-ascii?Q?c+xDp3YtrPZx7qP3B03ibNsorl9ci+hQ48XQwfruSOtrTNyiWlIJKvmOqElw?=
 =?us-ascii?Q?rnlxsOXnEy3rzMeu6ro6VXisuCof2pZvJ4wIvGfBWnKriLKflzeiP9CsgXVj?=
 =?us-ascii?Q?C00M/ab5U2pZ9jM5MStQLB7tKMSAo6Ym+uqVWXtzh05TBz4WrfRHC6Gx+iRN?=
 =?us-ascii?Q?cFEsF++3vyr6G5oi53XATzjfc6Z/8N5m4YMPnFj3gaatea+S12c4fATf+Mvw?=
 =?us-ascii?Q?/Bt/9LarPDOyUqJz4XUR11fdJHPsHeJbJdvApUMlxMsQBBVOpx8E6XoQ1mFE?=
 =?us-ascii?Q?CZ76n9rLbBYIh+DiR323qsRPfDaNPBV5nEIVApkS14xmtFb3v39m9qAc1j53?=
 =?us-ascii?Q?mqqJvLh/xNROCqkf8CBxOxrHDuPvmW8t1QzBdUI5rjNVlEd8jcVJBoAd0TUl?=
 =?us-ascii?Q?rfHnaXcW5RsUc1Mg4NE8HEXngbwwtSajCKs8hgC0HrKQQr/kf8rJKaCefhnk?=
 =?us-ascii?Q?/G6lVhzkzn4fYmy1fx4Frl4Wzxe/sLfZNvtB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:32.6915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4551dd63-7880-4a4f-feb8-08dd90d02070
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5594
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

When mirroring BAR2 page tables to RM, we need to know the level shift
for the root page table (which is currently hardcoded), as well as the
raw PDE value (which is currently hardcoded in GP1xx-AD1xx format).

In order to support GH100/GBxxx, modify the code to determine the page
shift from per-GPU info in nvkm_vmm_page, as well as read the relevant
PDE back from the root page table rather than recalculating it.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index b8fb8150ae48..91242f09648e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -50,7 +50,7 @@ r535_bar_bar2_wait(struct nvkm_bar *base)
 }
 
 static int
-r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr)
+r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u8 page_shift, u64 pdbe)
 {
 	rpc_update_bar_pde_v15_00 *rpc;
 
@@ -59,8 +59,8 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr)
 		return -EIO;
 
 	rpc->info.barType = NV_RPC_UPDATE_PDE_BAR_2;
-	rpc->info.entryValue = addr ? ((addr >> 4) | 2) : 0; /* PD3 entry format! */
-	rpc->info.entryLevelShift = 47; //XXX: probably fetch this from mmu!
+	rpc->info.entryValue = pdbe;
+	rpc->info.entryLevelShift = page_shift;
 
 	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
 }
@@ -68,12 +68,13 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr)
 static void
 r535_bar_bar2_fini(struct nvkm_bar *bar)
 {
+	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[0].vmm;
 	struct nvkm_gsp *gsp = bar->subdev.device->gsp;
 
 	bar->flushBAR2 = bar->flushBAR2PhysMode;
 	nvkm_done(bar->flushFBZero);
 
-	WARN_ON(r535_bar_bar2_update_pde(gsp, 0));
+	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->func->page[0].shift, 0));
 }
 
 static void
@@ -82,8 +83,18 @@ r535_bar_bar2_init(struct nvkm_bar *bar)
 	struct nvkm_device *device = bar->subdev.device;
 	struct nvkm_vmm *vmm = gf100_bar(bar)->bar[0].vmm;
 	struct nvkm_gsp *gsp = device->gsp;
-
-	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->pd->pde[0]->pt[0]->addr));
+	struct nvkm_memory *pdb = vmm->pd->pt[0]->memory;
+	u32 pdb_offset = vmm->pd->pt[0]->base;
+	u32 pdbe_lo, pdbe_hi;
+	u64 pdbe;
+
+	nvkm_kmap(pdb);
+	pdbe_lo = nvkm_ro32(pdb, pdb_offset + 0);
+	pdbe_hi = nvkm_ro32(pdb, pdb_offset + 4);
+	pdbe = ((u64)pdbe_hi << 32) | pdbe_lo;
+	nvkm_done(pdb);
+
+	WARN_ON(r535_bar_bar2_update_pde(gsp, vmm->func->page[0].shift, pdbe));
 	vmm->rm.bar2_pdb = gsp->bar.rm_bar2_pdb;
 
 	if (!bar->flushFBZero) {
-- 
2.49.0

