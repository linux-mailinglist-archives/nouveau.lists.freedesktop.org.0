Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DC4AA3CA2
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE7510E5AE;
	Tue, 29 Apr 2025 23:40:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VGmEbGPH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4FC510E5A8
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbAFgXzJ3TwCPGC65XLVAxl0yqVmwle4vijVeZeZCnjoepXq/vB7Ygo1wp6ktFyIUm18VWQio/1oOu3WHxigG0x8GCc7p6JOXthQoBvmBZjy3bjzWwM2+JMbXRKKQQF8DM8ceBMhe+DlCSaJ4GhQnyAgkJf7piryIkxtLA/Ht7eEkNOztbYcVQtvloqumBg0CwAXnf4/l+YGO8dL2b6DxcRuBVXNysNJ7hn6blFlYv+Icm2tg/3UHOlreUELWcmaYI4D5axQgXACe71nWeuiHa4SWz9xfNjPxeBgeH1ux6rR0AKpdEF9pntA6jhZCYf4Qa3LFaIbN6Fzl10v6pl4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aV+gshjdYye0dF12bt9ZplQKMAUMqpku97xSmedeUrU=;
 b=SRjFl9RB39UqenVK3uxyiJufoOStct5fC4/ANTUrW8pBH5iJNyAndL9zxeRy5Ssxi00CnlkiwrY41XFvhRU4DSKETmCP64vU6s+KH08j4QsMJUJXvyi4IPdwItFwUBX4WUUpama/m2TIIhcVgJMbyDoZ8p+gYHUy/sjUuHswFOTvB+dL4k+++NTmdyNyAJdDQNmr9li4Hn/8Dyghw7Ipzl6QmkQq/uo1gze0e/1qEhYB/9+K6h5pzR0EwAW/vI7I/z2r6tBjr0QiDm/aqIRnEC4P/NtbnM1u7/qGb23kfqrZVegb3jYe5tul7rIdAwdJjWsWu0UNvKXYS4gs+N0+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aV+gshjdYye0dF12bt9ZplQKMAUMqpku97xSmedeUrU=;
 b=VGmEbGPHOluijZtR+rgRtkv6n7OPnbnHBu7VL2ZuLI2NqfSkuGh02xTde6/Zjc8q2alxQ4ss4cic0S+zjEjefL2fbTT5qdpkclwKfWnT4tMNLp4IrLWvoD4OkBu2tq6Vr1zJY43dHtD4i+pMLCmPnM7Z/o5P+nmmo515ie77++70imfWBXMapknOmu8FL4/D3ZGdtNF8/lAQLNsWrWI2VoIidFmdIgkWasKVCkssoPMeEBJFe5LltyjRo2mXzzMtZpvdk/gzapGpCPh4jGCZeClDv+6A7AYZ0tKXMefzm/chItccx2TiroPugd5F1ojbX/tI2F9vZ+f646q5V4S3Vg==
Received: from SA1P222CA0040.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::8)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:52 +0000
Received: from SN1PEPF000252A3.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::47) by SA1P222CA0040.outlook.office365.com
 (2603:10b6:806:2d0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 23:40:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A3.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:37 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 48/60] drm/nouveau/gsp: fetch level shift and PDE from BAR2 VMM
Date: Wed, 30 Apr 2025 09:39:16 +1000
Message-ID: <20250429233929.24363-49-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A3:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: c69fe7a7-6fba-453b-4b8b-08dd8777474e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EuIZLiYIZXhuhKUfWefa+1F8vPey3sl7tkld0K/4pxMZy2Rq8unklZY+JccA?=
 =?us-ascii?Q?UZUvvfrx7SlAtiuXIYhP8KUVHbXDfWVfvAjiI4dt3nGf1rWhjx5WQJENAxYU?=
 =?us-ascii?Q?JMsX//zjSulRQfGlU4Z/NM5wsoVjDhZy0BRIVoKvifzbB2bSRiXRCHj+KdQt?=
 =?us-ascii?Q?QoCqp5ZUFz4+N2nfxDUJBdVwTN3zc0lzTTJiGYdB5CMIfRk76ncH0ZD51scx?=
 =?us-ascii?Q?zGQ45TjSRBwS+AsTsqCloOCQQkaq9gzG10usAp7mqsMzAaAaIKe7CjGVburv?=
 =?us-ascii?Q?ENYfxjUEv+8H82v3PoW7hDMZj3tqjV8n1jbHlv5qOcFFlaAmFJ0Tm1p+ERnP?=
 =?us-ascii?Q?C36OS1WZSc4qhb96ti1kib1qTQWS3vtY/Ap/EvIOdkfiol3uvhf03UlCXXKX?=
 =?us-ascii?Q?ecW8HyKD688YugLVyX0Kr+gUHTkVLFrHK4E7O7WllQG2Dg/dlCvSD1vyiZ4A?=
 =?us-ascii?Q?f11YEDt8aiUezTYLs8FWw6Z1ITmrkDXM7yUxpPXnqED56HDURHAY60llrTaq?=
 =?us-ascii?Q?ijtD1jUCUIotaKPf5NYmCiDzaxe5RtFCvXxUjgpS/Iaua5zSXiwPbR74pmrZ?=
 =?us-ascii?Q?96Ty0ERiUGNvjt5+BFZ4aNMj430lGHaLlh0dH8OLQilawp5q5NGG7T8+PcrC?=
 =?us-ascii?Q?lejP5spTc+P2tZQeltIVfp2+u19JQlRroohtR7E9oWSaN6XhX3kG17pS5z7g?=
 =?us-ascii?Q?hwl9RBr72kJEM2NFz9vGrZtqBl/uk63y80zsxc6I35tF+6GI3EBRw02K26qv?=
 =?us-ascii?Q?CoZ6NVKHWCWSRnsNIWJqNLHQE/o5HdzK6oC+M6uyyItHTlhuoiJJFol+awv0?=
 =?us-ascii?Q?vseXeLrk1p4tvQvp2Wk6whjV4GlnnXbGdIyBIGP7fVHxy1o1zxGGylgboHVR?=
 =?us-ascii?Q?XmyHM6Urf3ijyyFynDR+uq2nWl0UWxFpBj/GrhSO3Oeu2N+tJNajuydhhbWB?=
 =?us-ascii?Q?awBvv5VcqlbOO/6tnvuVYkA7mw30kTtMkD5LTJQuboyAHQvovYvqi7v2Hpee?=
 =?us-ascii?Q?nqUsxZdlh/29N6qaFJE8pJpj54UqBeKUHuS/OfkYDrN8n+l1uJQl8OzoQAKv?=
 =?us-ascii?Q?ieZdiy/2BdhgC8q2yZxgFASy7tybB62oQBH9ixg/KMebSq9sEMlp4ESD0a3M?=
 =?us-ascii?Q?ticS+6EbneBtK2GqwePGAMGzO+5b6v5JJnYevPRqW45sMK42iap9NSprUsq2?=
 =?us-ascii?Q?1XRl0tp23hnR17i+I4ksRl5KhXsIo9YWCBS0PFyMrjRy3j4QWKE2jjy9jcGc?=
 =?us-ascii?Q?M3jmyGWwDoIFk0FvLYm3QBiQpn4rWcXL6D560GQ6REhfksL6rgZHKovn8k+a?=
 =?us-ascii?Q?Hmx9MhRYYsLPXNoedGPgfK5uaMko4GZJty6GD8nurTrX1v/WGIuMDfGQ+y4v?=
 =?us-ascii?Q?uy2N9SzRKN2jHmTs1JBanxwXHAqynUXdcviRPHfVhUj+1EL/o7gNN1MAFNq+?=
 =?us-ascii?Q?J6DFrFZU9atNQTwNb9svzTS0dWVGI7Cfe9//mW6NZZyLRhjiSWc2WYmTBW0R?=
 =?us-ascii?Q?bA5uhbJ/HywjNUqDLI7Sud5CY7rZfBwL9eFf?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:52.2243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c69fe7a7-6fba-453b-4b8b-08dd8777474e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505
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

