Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA31B23CF8
	for <lists+nouveau@lfdr.de>; Wed, 13 Aug 2025 02:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C654010E675;
	Wed, 13 Aug 2025 00:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CqInkMNE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A8410E675
 for <nouveau@lists.freedesktop.org>; Wed, 13 Aug 2025 00:11:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlIdwF4aTGv4hdY+qzmLHoaY0HsuPFAaZPI4mOBtjfG8TGlCxfVVWD516zdKSjO3UvE/OwkJtJv+D5Hncij+J0LheLM4sN3nTUhsyUTaxeZSfjqO8L8ufqFNq87WsMSeHCVrjQHHF/tB6ggXcOIwjcOBYjE+b905sCAgs+wx0uVwbK58xPTEz9xG38ZbvfaaxTY9h11A4Y0qMe419YnK13uAfzld5sRK163UN70N3KsPh9GdGNeFiBJGghcg4p7cv5vNFcil3LYILAJsU5cTaCD1fibhiOHB+zYc/QImERXUAj2govgfZZTLw4U+gjjLXI3B8WkOkL7V0nOrpApdbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CgDQ4iwlF2L7c5ohDx98sF/obbiM/3M4e+jr7HIw6Jo=;
 b=h9yLnP3Z3TQMQ+omGPSqH2FJ5byF3GdcaL71qCZITLuCCBuMyDUDFlnIEBCrVE3rSF6/2ktzuASijpW05O3YhMCc/LY4FrJBkLncxysVwGmq5RqnIENB/suZdHOdJzueHO220wOYEsO2/TGt75BeafBwMK7aGd2KG+CMNcfI8/3tiza8Uwbo/qw+Rp93Akwu/UXkhRegI/z0WLyVj4pDRtk66aWoRI4sLKTEM/vFPvBaGvpj4Rq37uhIGPqnib5BM9ayVoXQlMXrEuaPn2gh6wPoCp8K5O3lV8Br9ncShSubu3cfNpd0WX/Eof69+EUNvel60m6Rga73TFb0JUCXJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CgDQ4iwlF2L7c5ohDx98sF/obbiM/3M4e+jr7HIw6Jo=;
 b=CqInkMNEVAppbarZBa4Z7KIc+apIjZlbDFOHGHEcQuhFowSNCJFDpTLl3bvG/pPUdtTgwzT0dQlE1xHuQU4nemw1EipihkJhYtDkLpweL+7igHYa1Q5lY8XfBHcWYd7BbcJraphjXcI0pPpAQoeusNsbwIPcLNK5x4BT8btqVl4V5RFNGk4I8XTmfu+9GfrYL7sOfKTjaepDGnpxx31IOsOs+iFKPgaywdzgcWsChJEmH68zMUFnAI83qxRuVyacVke8tbhFN8pgF4XjQOb4yR0RJdLwktABVz+1mAEx/wPFQDZGwYCidYNNEUMt/4EsO8jKQYgRrUS7fTbI2NfJtg==
Received: from SJ0PR03CA0386.namprd03.prod.outlook.com (2603:10b6:a03:3a1::31)
 by SA3PR12MB7999.namprd12.prod.outlook.com (2603:10b6:806:312::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Wed, 13 Aug
 2025 00:11:42 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::8b) by SJ0PR03CA0386.outlook.office365.com
 (2603:10b6:a03:3a1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Wed,
 13 Aug 2025 00:11:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Wed, 13 Aug 2025 00:11:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 17:11:23 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 17:11:22 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH v3 3/3] drm/nouveau: remove unused memory target test
Date: Tue, 12 Aug 2025 19:10:04 -0500
Message-ID: <20250813001004.2986092-3-ttabi@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813001004.2986092-1-ttabi@nvidia.com>
References: <20250813001004.2986092-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|SA3PR12MB7999:EE_
X-MS-Office365-Filtering-Correlation-Id: 350c3788-eb94-466e-e2a6-08ddd9fdfb22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iiH3Orcpf09Q6JQxaFTtGkv7FOKQO9UmknpFljd7M8/u4cGj0AGrlgULV5ti?=
 =?us-ascii?Q?5nc3IVxyXyG+CJl+NyrLzL0K8ImXoscAKpUvQrNXu9JqDDtmGVGWpWHfoUwe?=
 =?us-ascii?Q?YFLT160GhyXnUA12Jgvvs7BhXnVRpipKbEdE2jLOYCIZyLV2KL96/b3B4niU?=
 =?us-ascii?Q?v4Krc/nSDBrhQQXI4392csyjqf44koa2vHSiZnfwczzLf234qiXoRR1wzEFH?=
 =?us-ascii?Q?zrzl7apE72zX6i/X/56qXnzVGym31MI9iGSwXIJdKw0B3S05vExWH41gvMSb?=
 =?us-ascii?Q?aKSYrYzwLKmKoIWoQuq3UJIKdY5YM6hBcWECvrGIDkZzimjcudVdWTW0Ex94?=
 =?us-ascii?Q?oyv35LNkGNgEpK+jYp5N/9sGA2F3juZVLqWcUzn8T6yT1hy9bTcqfFgTdWj7?=
 =?us-ascii?Q?RQKZgXfXbBHN+WCA2SxgOAeYMwrIyL0SEzfthWvUBVBD+HVyUatxkJIDnFbU?=
 =?us-ascii?Q?spc0YEs/AX8RAG/ov4AAr5zs5zqKttnpVEy4u1oIFYgTFpwerlqVvW4z+UAB?=
 =?us-ascii?Q?35Hfu9Cq2Ap/po3HJJ57sye3tMwUUj5WtLOjmgBADKEXwYAH7hqQxq1P5ivL?=
 =?us-ascii?Q?v3P4d8/0zNenmwPDBitENqwuhcFFj3Vl/ivPkNV8OMVixYQwA219yQF9tNZL?=
 =?us-ascii?Q?FnZQL6rNGlH4+8JH2kMltK32rk96DFaiwsE/Whwkt7lGz5JRMKd57ZUBSOk6?=
 =?us-ascii?Q?7xHVBJAq+IesxOTG1o+rz0kF2S6uqZGW4ZIDLY845PLf+OOPFJtqNy0vJXPp?=
 =?us-ascii?Q?DPt0Q8nGj+tMEyZReW7BsNHQ8nvswRtVy+oOuXh6bNm/YFqvkAulCK5/yZhk?=
 =?us-ascii?Q?ygpOKUFChhRhW41f2GqA+6ys4TZBb+TYqVMz72miIOKZYvR/LY2PSBx8tBsn?=
 =?us-ascii?Q?xCUZslBcX86ZrNj9C3lWH8JETLujWS4QBr/EavblQN/FCPI0qDv99n/ptwzd?=
 =?us-ascii?Q?JmTKNhewT4WI+54C2UYGhmCtqutZ5UfwgGwh88I+e4Vl/cmOxmcaetzYnRMO?=
 =?us-ascii?Q?wnxGpmoWDcYmoIAtXA/Gu6H7856o9JPmejljkPmtf9uCrTnvGBEgYqpgJuXJ?=
 =?us-ascii?Q?hVKEO2PCNinmuzmg+2mcktw06pCVlnj0g2sOVs/EqG5+ccquxYW4sYVYk4Xv?=
 =?us-ascii?Q?fGd530jUUl6hzHU5ZqGBS3QaMOeIVebHpR3S1LfhWjzy5W2LQBRQT7kV6od2?=
 =?us-ascii?Q?yk/434qXcJotH+IGZCxaqePmpEBaf7h+Y/mAx9dpJyUy3TqWyVXWaee9454L?=
 =?us-ascii?Q?bcJBUxcWhOJeNzwFM2rBfbRURv7GClVQppmKQ3BCjYpWd3HlOBMgQjs+Lxuy?=
 =?us-ascii?Q?IuD46I+B37cBIr6etDNmwDOWc3JjSVL6QGVCMJ8KFlDKtKeQShLJQXt4zn4m?=
 =?us-ascii?Q?5ngR44U/GnP9d0AONWRPZCzSvdE0VrGzHM4Xj5v/f+pikKAdmepn3l2lA3F8?=
 =?us-ascii?Q?TvLM/qOElVF+V9GFu/AKP2HJWHGOQvf40sR5ZXQTOQyIMuF1U6WBf39ZnSN9?=
 =?us-ascii?Q?9yWoUhgchhi9UGDBsoNn0RloVnLQJNlI2UV8?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 00:11:41.7840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 350c3788-eb94-466e-e2a6-08ddd9fdfb22
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7999
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

The memory target check is a hold-over from a refactor.  It's harmless
but distracting, so just remove it.

Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for ACR FWs")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index 6a004c6e6742..7c43397c19e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -249,9 +249,11 @@ int
 gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
 {
 	struct nvkm_falcon *falcon = fw->falcon;
-	int target, ret;
+	int ret;
 
 	if (fw->inst) {
+		int target;
+
 		nvkm_falcon_mask(falcon, 0x048, 0x00000001, 0x00000001);
 
 		switch (nvkm_memory_target(fw->inst)) {
@@ -285,15 +287,6 @@ gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
 	}
 
 	if (fw->boot) {
-		switch (nvkm_memory_target(&fw->fw.mem.memory)) {
-		case NVKM_MEM_TARGET_VRAM: target = 4; break;
-		case NVKM_MEM_TARGET_HOST: target = 5; break;
-		case NVKM_MEM_TARGET_NCOH: target = 6; break;
-		default:
-			WARN_ON(1);
-			return -EINVAL;
-		}
-
 		ret = nvkm_falcon_pio_wr(falcon, fw->boot, 0, 0,
 					 IMEM, falcon->code.limit - fw->boot_size, fw->boot_size,
 					 fw->boot_addr >> 8, false);
-- 
2.43.0

