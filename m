Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 039119D5F66
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD73210EB81;
	Fri, 22 Nov 2024 12:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ClVdRyT4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AA8D10EB88
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7UBPfE6TsqaXxCcBxiD+/9kOcDTsVVne+iCtCrq8MbOVklqPnzzsE8mCIOK1kQG5V0VNI6ius63371QfLvC63phrkFpifSxhJJFfrD+evzkDyfH/iJ5iV+avmUVJsxgVGPp9zKqCAgSfXU0nPVb2mgO70l8sXxUEEU6f3OwO6BLdTWMhAjK3rakd182bcu5aMRP9PIrMMbE/T0HMKhuACeL1LnSuDQgL3D4EG+u4rp9bHC8G1js6inCnFKghe1D8BuOo7ysbQ9k9rdOMjdQnwSbguqkXrSqOh+ptse7mewvvzhk8NU32z9d6wmRA3j3uaDjDQTr0Xt9v5O7Nk1Mxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnfN7uTJuOei52lNnLRJT4qM5NmUmI3Qd0SbtYQ4oNU=;
 b=MOq43H4mwAUDm9q76kXtN6X4V5FbXmUDSN7A8GGS5DPrwlJ7HjT7yz4TaVeiI9psMwGLP5HEzFpkPz0fMsS76Tt40TWxSWxigyzw80dhYRGF428QM4KiyjuvN9uEuhEHPWNOxzx+1rY5NNGQNxBHgUQwig+p2Ns7xfTTZIfCO8jgq0+8lxZ7HWKv0dl+GRzYPIyZvFek7NmzH8zcbjgVwqxU9HQ1BqgercSw3OVO1ZHLhlOg+bwqRq9VzkWnuXsDbQB7bwph7rEU64P3tsK2dtGhedEixyitIe4R/pyA0Pwlk6ue/e8NJWdzjhSR29Rs3ifbTYGUtAGswxvfDUxzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnfN7uTJuOei52lNnLRJT4qM5NmUmI3Qd0SbtYQ4oNU=;
 b=ClVdRyT4iuzMoqwf8CIpfc9Fk4WxdPJcHsWxYa73hcgC+94Ed6Xj31NuXtVqjTgFtlAMtSLRnqFe/aufzj2M7J8c8sL1hODadBNGwqOX/uEaMhz3hlK0lpJAzAsGyGCz5DU+trbaNAsDjqEbmPU36RZJhsMVB8onrCi+rYlSP7m8bk3NjFLN9onCvpH9tEs2Q3AZWWho2hNTjx0m+3sY3sd8YI+FhkvYPupVeEsr+frcf5jSL8nnjXX182bD4ghnK0Pb1DUhZeYvCKHMTimKyhmdBlw3abHv618ckyWm+dsjDH7rdfPgYkmb1sWNqq4hfNpGYHo9uAl/owYjfeji2Q==
Received: from PH8PR15CA0001.namprd15.prod.outlook.com (2603:10b6:510:2d2::13)
 by MN2PR12MB4469.namprd12.prod.outlook.com (2603:10b6:208:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Fri, 22 Nov
 2024 12:57:36 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::a8) by PH8PR15CA0001.outlook.office365.com
 (2603:10b6:510:2d2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:30 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:30 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:29 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 7/8] drm/nouveau: set max supported vGPU count when SRIOV is
 supported
Date: Fri, 22 Nov 2024 04:57:11 -0800
Message-ID: <20241122125712.3653406-8-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|MN2PR12MB4469:EE_
X-MS-Office365-Filtering-Correlation-Id: aa124a3d-f01a-4335-a132-08dd0af53c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LrcozXYg1GuGEBPBqUnz/I1qnhBZSHsFLLCHInPNDbFxgvRvlzQMfLRVx3tP?=
 =?us-ascii?Q?Bd4/kqicLb49sol6yCYH/pM4oGPiUktmw1vlCear2bhZU8sd8RF6rSKtXFAi?=
 =?us-ascii?Q?0i7af3oS06zmHMyjc0Uqh4Hqpv7c4LawjOwQMvG325vyjMajDkPhmZsnpW21?=
 =?us-ascii?Q?zyKLaFXH+Mtknvwt8OjDX5WTmZqB17I3lnv9nTY8ECzwZiZcmMm6Czx57CAw?=
 =?us-ascii?Q?eqVYPKBHOeVlx1dqkN20Ludx7O3X04yUE1X0C+gbGNA6ZRfwWyJNEtzSE86i?=
 =?us-ascii?Q?lFBFAttzM+g7pbrxdLGNc8PkWbgE5ZHyABNaf9sLJLLVFGlrbfIv/UuTJibw?=
 =?us-ascii?Q?Jxotys9wiU5cDU4TzhIgeU+JrpwUwGBFC6xUePbIeOyhZIzx57nmeNJgkuFa?=
 =?us-ascii?Q?BAGl0nY2H5N/+O+VxtZHwgP4B0OXKlP5o3w9fUZUJ6mx1rN96PBd0KC7MZLj?=
 =?us-ascii?Q?qs+HTEeqwc16SbBG4GqPnbXWTLwxFdjX8N7c7C1GcgnG7tURbEK/Lyod1lKy?=
 =?us-ascii?Q?UoVOrLYLFkyRytTi+b0mBHu8UXAOF0ZnYq9fkKdAwG6xhos8VBlnzlN5nHZB?=
 =?us-ascii?Q?7l24ZxlyVNVTlDpaGGimjDMn821jm0f5j3EId5FN4tuNXFhG3wyGs4v5Ir31?=
 =?us-ascii?Q?X+c2Gr3qpg+IxYTSJJ+ga1q85jaDTih6UXfDp103CoOkmIqLSYBtNhSoFNEP?=
 =?us-ascii?Q?Crqvc39HKq4y1CxzskUs68LdOdSuhUwIxVMINQ5sdQQo4KspXRDIrFtTjyMG?=
 =?us-ascii?Q?ZapKK0j6a/Pkcuj6GN/DzWpjkJOWfZY/GZAhana5VrUiTn7G69TWghHtDlmI?=
 =?us-ascii?Q?1HWDFLPJ5dVi04s/NVVhn+bONR3SX2JmIaH5LKg2IOqTSwg3+ZHNyEoF9fja?=
 =?us-ascii?Q?JdNGC92Soy1qGaHAUBVQEctp1dzaVHKerZKbdbsJ+y0iKhpM9oiDnOhPSmUt?=
 =?us-ascii?Q?84c2e5Xp9iF9fuJQTTFazTV03aHqHYqAxUxyMajto69L3tvL7D+VJy4qYo9E?=
 =?us-ascii?Q?tLoKnCF5gbBXc2TEUGulOhF054Zx/XcF+aaLf7XPVDASUXCrOlJKLR9RN/kC?=
 =?us-ascii?Q?ozqrLyXNbWjGsh0Ko+Y9dFdv9MUNMg23WBcCJ+1mOpY4lQDtDIyNMLucXekj?=
 =?us-ascii?Q?f76Izyo1NH4Cs1GAP47pWouuDIsuOW9AyxplqM8DKWU6+Pawbh9y5jM47J1x?=
 =?us-ascii?Q?Yqtki14oWuPqZ7G3eZzfMsA1+OwkK2ZNESSxI/ccdzK0gCCzX3wyPtCPCKUD?=
 =?us-ascii?Q?lrcu//bNWbJ8NiypYSY5ra26WY2mibPWoSu6BjDnroqRuriZVT9j4unDlgZT?=
 =?us-ascii?Q?X9Z3e0rUydy8PDRQlLqXLytG1NYdbg1c77hJsj9dsRteTjxYIc2eL7E069fC?=
 =?us-ascii?Q?NJS4g1SfkC5pisZn6BzrTJaFPNTk/a78EP1X9CMCzBi9jd5nug=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:35.1837 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa124a3d-f01a-4335-a132-08dd0af53c61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4469
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

Set the max supported vGPU count according to the number of VFs when
SRIOV is supported on Ada.

Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Surath Mitra <smitra@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index c6fe2d9d47de..6e244af1e815 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -64,6 +64,7 @@ struct nvkm_gsp {
 			} frts, boot, elf, heap;
 			u64 addr;
 			u64 size;
+			u64 max_vgpu_count;
 		} wpr2;
 		struct {
 			u64 addr;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 1e403dbd7323..80d6d73fe352 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -69,8 +69,10 @@ ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 	num_vfs = pci_sriov_get_totalvfs(device_pci->pdev);
 	if (!num_vfs)
 		nvkm_gsp_init_fw_heap(gsp, 0);
-	else
+	else {
 		nvkm_gsp_init_fw_heap(gsp, 576 * SZ_1M);
+		gsp->fb.wpr2.max_vgpu_count = num_vfs;
+	}
 
 	if (gsp->fb.wpr2.heap.size <= SZ_256M)
 		return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 5a47201bf0c4..2647a83773d2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1968,6 +1968,7 @@ r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 	meta->partitionRpcAddr = 0;
 	meta->partitionRpcRequestOffset = 0;
 	meta->partitionRpcReplyOffset = 0;
+	meta->gspFwHeapVfPartitionCount = gsp->fb.wpr2.max_vgpu_count;
 	meta->verified = 0;
 	return 0;
 }
-- 
2.34.1

