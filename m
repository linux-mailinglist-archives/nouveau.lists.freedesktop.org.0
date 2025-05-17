Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC35ABA72A
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DADE10EBDE;
	Sat, 17 May 2025 00:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ef65Q7Zv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11BF310EBDE
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=estZrNu2g5x1dUww2x+qwPC7Tilv/Ffm3y/mC9QF8ltM0xvVvRZuRT718kyewTvRGJvHVqQunFjOmpodDUebcnCui5S17e2PpKhMv/RcEnB4byCr9Ei3PSWOfNWpy3xY9CoFZnDE2TZmB4v2lq4TaEtbyD2A+tndhZF4RPjj5H3iYS2quWKVLFHcy1FpVw89F9BEIDJXfJGYpF/QyNz8ws2GDloqEr6eh2CCt1c8oWLUx6hXjG3bp8s2cQB1HzckXwE9K5PFXKeVJC44BXoQPE5/I+p1uKcXrVh8t0GxBxvKv5dNGzo8XLw31EFN4xQnLIzhmgTsGA84qghl1P1y5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEhyLbAfkYFBGRWV6nJoErEQPoCFoixRMt331PBn7pM=;
 b=Voi3eQ2Y2q/HxiaiY6qoQOqdJWPr1V9yJITDJ76EFCwMuWgnceRySdOGyyl5qv7dOcNRLFDGDkZLSCKytz3Pk3pYvKQjo8uhIcc/m32gs0LVOeLF1okJStYKNVmxUEwviJbw2UineUIogB2wVDoemYFP6liEXrUgMLbpn8+9ckgUoAfmsaFbgiIZQxMbK5T6DjxLc1X+rjbeKIvLwt1idLSgPYjp0U6fCUCYkTPv0jYQRocEGt5RClssRhkGIqEuanq9amgOFL+JOsbdpsNov7iI+JDSHLYxBzOmrT0f7rBj4Uh7F/cXxxEJ5Bmanu2zJAbC/sQ8iSKlvDP4wY2jGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEhyLbAfkYFBGRWV6nJoErEQPoCFoixRMt331PBn7pM=;
 b=ef65Q7ZvUW3xk5nXpgaU/hngzwoPvXwbFpldkJ/iFx0AIkkEoTjpgUvhHEgXoAtz9QcoVhNTk80U4XHzMDYLK+4+MPIvkcFu4+xZqrk3SGuHKcO2VsTLBXIF2mzLGOEaa+czhNJq2qizUYlAH4PSlUfzN4ckL9XgO1dNEKPUF9eV9mCKxcNqVqEzLNzIXV9rs8GRySLGTeW5+nldWFlKeYSushp1cquJrLKQTQU5/r2GZB7FEAAIgHQoQ5uaWnxEjMF39PK6vArFSda9UE6kMHeLimUaHH83NvYxS2Nnl5bGibYL1mBHBphvT3lB8+wE+OxwZqXF69EjPb/sdbG9Fg==
Received: from SJ0PR05CA0170.namprd05.prod.outlook.com (2603:10b6:a03:339::25)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:11:35 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::91) by SJ0PR05CA0170.outlook.office365.com
 (2603:10b6:a03:339::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.19 via Frontend Transport; Sat,
 17 May 2025 00:11:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:20 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 49/62] drm/nouveau/gsp: fetch level shift and PDE from BAR2
 VMM
Date: Sat, 17 May 2025 10:09:41 +1000
Message-ID: <20250517000954.35691-50-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cce96d6-b1ab-457d-e4d6-08dd94d7629d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JxUN22YRw4QxQWL5A/ltjiGNOlSNqCp4/rupE1r0HljfdC0BSRENi6OL+fpE?=
 =?us-ascii?Q?tAiBZVLVkkITKL8MZN2EAE8aqAAk7RjJ5JWesjtpeRbUDGk4qExGhdDd2uaS?=
 =?us-ascii?Q?YW/e/UEANn/UA89NJ3qtIroLI9RWJ0yOHnbEd1O5Y+6KMMxmu9Wd0uZxRy7r?=
 =?us-ascii?Q?2T/rorNK9hkIPIoe2xhYXI4SqAZ7k/nuY16ZgHRhK6BAG/Btx3aECphu4Lm5?=
 =?us-ascii?Q?aV4RjaZTy0YY0T+4QiUKce1MrpNpYHCCbtE659UShMGzKLLZ9iFROjndHAlG?=
 =?us-ascii?Q?+lONkvRCqmAklBq7wolX1gKYhg/5LGUEnZvDXMVBJeEv7jqtcFfRJHmRryq+?=
 =?us-ascii?Q?vWmErpmyhWjUfBIYqdcevNZf+4Y7+7BbCaE1AOBDEUdTrmAsGnhjclTRgkOr?=
 =?us-ascii?Q?0E2r3LKhpWPGJVFkodEpd5MW8onnI+oSpWnDUHBJS5p8x9XEnJ2hscx82Mo0?=
 =?us-ascii?Q?xJsjDXpnqd1Wv6V7Nyu0zWG+mO59Fpiz7GJlvLGr0n9MZV11EiugNily6Ofr?=
 =?us-ascii?Q?YU6ohS97WQDXG4BnoKMWy+PtO0ligcUowcRbGUIhsJjrqJIuYVmxgeZp6tRs?=
 =?us-ascii?Q?2heba9G6VH4H33iFIHWkBgNTpORXd4jYDnnWikwn4OGktSD3i13CJcwoG5pK?=
 =?us-ascii?Q?sbC1MutkemH8ChgqOXmhI60Qd+AFF/NDQb3Tj4iMt/4duyi/abHQOekTNCII?=
 =?us-ascii?Q?CgWa3oDTupbktFPTqLp9mGUfSDcoO/3KU4roVyk4EgX9VGRu/yiVgKLryENr?=
 =?us-ascii?Q?/x+BK6h5+6zrbBpYwNdVVt9vc1bdEOo3xGdkt8w4j3A/nTmhsbd9Sois5eEo?=
 =?us-ascii?Q?KDWgwfGBjQOGAypm4yHFyA6k6U1xNFsKRlrUYKg/cA/SrHMo9LRuqEflC6Zq?=
 =?us-ascii?Q?1XMEQkbHCn8VT39YYqvdR2mzyplw7+6+XQ/55grsNqt/M3BAMHY4dNyc4PXt?=
 =?us-ascii?Q?7hSFsdF4YDZnlnrVcMgCOEliQR5b68gSJyPA7rROFE2M+bpor/N38gDgdfTc?=
 =?us-ascii?Q?d9ZPCxu7NlffRyC/VNL25qNvbYT0gagDt6DbMbfcb5hq5njVde3OHH/NLYN+?=
 =?us-ascii?Q?Qol5Nyq6zOAoJM5MYLvf3pTGu53K74QZwO66PjGgZkP2Vg/7Yv3JlSWM5LLa?=
 =?us-ascii?Q?ZwEk2zvO9i0vm4BnaSr0Ff3mOM6jQTZOLqXyeQIbU3+zKUR/EL7RMg3Fsx0e?=
 =?us-ascii?Q?wH0nV3HA/GdHfk0IyP8dCRPxgurHWChQafoUzx91V+rMrD3ty9Tt1mRloWPB?=
 =?us-ascii?Q?WP1K2FRv7IQvKCUjw9kdEJvpJzfmbmXOCkugaRi4k5YnvOgGZ5MequTGMYD+?=
 =?us-ascii?Q?6gaslOgDvi+Qkd/+68iU3S5XZZETJHb2InhGb2rbaSzP82zE7+Yf9bOMUpdu?=
 =?us-ascii?Q?O7BW8HGzJ8floDakcVYRc1D8C2uRzONz9t6YS1eotA/Z/i9Zb3Sfnllrkd1r?=
 =?us-ascii?Q?20PZeZ0UTR2VF7DqL4NW/COmfCNSwvyP5v3d8zVCxandEGseCqc8DYhLD7y1?=
 =?us-ascii?Q?TMm4kmW/cGoB/f8XSKrbf4qucQNO+r4D7EHv?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:34.9315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cce96d6-b1ab-457d-e4d6-08dd94d7629d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
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

