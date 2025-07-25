Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3B6B126C7
	for <lists+nouveau@lfdr.de>; Sat, 26 Jul 2025 00:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B3610E23C;
	Fri, 25 Jul 2025 22:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QnahRU3f";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C92810E23C
 for <nouveau@lists.freedesktop.org>; Fri, 25 Jul 2025 22:17:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5KhTnnNC1ZHUVvrDdgrD86+tI6vPCHkxjjdG5E00Uv/RgLhEYDEiGVD2MQD6iuAnaVe/dkq980NT8y0gqFwMj1AO4UY4aHxlKZvUyJI6MbWYMpFTjhe6wZpWQfeNFTbX4H4kSseLVqnzRBD8x1j+AyUTzGCVgEegBP9Ks5SDSgPGQcVBR7y8r8TkOqxbAlSRtSRhrWZShR9TCIrXPfRSqAIkUXSRYZ8AY27xriPBAucwil/baBJOL/yzzg1/8PvGwEPcrx8CO3HS7Ro2pu/OwkWa0jroU/1PHugZFWzURkQJcrYJF7AxU8D7G7Juk+xiog9IOr8Um3sII+EB3nOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0zygEvlfYhmK5zLSaqFPSWLq+jA4LBJXEeMT5XXFm0=;
 b=Q4pWsCzXbqDPBmyGsy/IBVavkXtLImY0n4u24CkisTnqiF+sppSzz9l82ZitRn45I8QDWh4gugM3tIM6mTlOIR0U01vygJcoEmHr0iEKNWvGrNtjnpM39JaTlTGnE7NtcEYv8kBf8NNKOn3l3DgHcoeNDZTo0Vx9wZ3ww0OsFxpj77TWNnIYraqj+Fs+Tslhzik5MDyLGLRkzkiBNqnj4CCbFZLRPbi1KK287NI5Hx4LngJv45C6+89W3W/df/4s2E/qe7h7P8necs6rfusIuw6JrIJlTHCezM3jRKUecxYJEYrVjR9D6dC/juLtU/3eOB9tP6O4CC6H3XZRjSBflw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0zygEvlfYhmK5zLSaqFPSWLq+jA4LBJXEeMT5XXFm0=;
 b=QnahRU3fvf+nBGiEIvCfCQkjUTas2AZrd50c1XTyDYTlElfeeL5xKLvISIfVgDBqrg+2SpdMge2J49E8/vHk/a4fvphUNT9W/5YVaqKSWB4Od7XXheSGTOwM3GdBaj9ByWc3Atw+/8NT8DR1ticCHwkvVPrhr/SjPl6UMpPWiWsqXV/vA+ktWaiEZCnaAnYp8XSn0wtBOTLcCFeQFsCq3+H5CJQs1Ko2YFAlnTuUiSmOQWSYfZ7FtYMSGalcyHmbGcxu1GaIOigsLMJm861yOykFQTYD43nE731Dn6AL9TX7sBwIRgAWN21h5lqegfYw+++NMsrNld9U6+Pph7vW9Q==
Received: from BL1PR13CA0105.namprd13.prod.outlook.com (2603:10b6:208:2b9::20)
 by LV3PR12MB9353.namprd12.prod.outlook.com (2603:10b6:408:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 22:17:46 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2b9:cafe::63) by BL1PR13CA0105.outlook.office365.com
 (2603:10b6:208:2b9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.7 via Frontend Transport; Fri,
 25 Jul 2025 22:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 22:17:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 15:17:26 -0700
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 25 Jul
 2025 15:17:25 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <bskeggs@nvidia.com>
Subject: [RESEND][PATCH] drm/nouveau: remove unused increment in
 gm200_flcn_pio_imem_wr
Date: Fri, 25 Jul 2025 17:17:17 -0500
Message-ID: <20250725221717.671983-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|LV3PR12MB9353:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afa4d65-348f-415e-df01-08ddcbc91522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5TsNQmrkNXhwL1sYFXkWn2sPC426aBMvsnXxiWXQmXZ2kqjbSMLr2Xx0OVml?=
 =?us-ascii?Q?jTUkH3Q2WEA2Wm1ZXrNdHVlgw2inRqC+fX38WrZ8TBzTrWkcwbPPCHa4/Tcj?=
 =?us-ascii?Q?iGYtOFD7ugl0yclzMUixnD92ZTx5mG2+fQAP4MAUSOtkdyvZhbOst01qN94A?=
 =?us-ascii?Q?+dhRSqP3nIK8xTA/mPDi0mUhAsRIq1Kzc+M5shW8z/fiZTtS812DoJOwwJrK?=
 =?us-ascii?Q?4xkIGmwyo9dU9n7UN1CghydTjEI59Edm4qx3aIaBk2noMGDBK2Qn8l/Yfx8Z?=
 =?us-ascii?Q?/D1Bf8CMguwPSsnJwE35mR2gZWx8kTKWzBnkgmNL+NRnOjDOOGgIc2SrXaU+?=
 =?us-ascii?Q?5w0r7FJL0WFS1ibCellEUAstMsofote6J3sVLV3JagqTbl7g48/6QTMIZZAg?=
 =?us-ascii?Q?UfHC0k4Sr9brN70cB/oVdgsMDI4l3hUT5unoFkg4oK1I8IZ9xnQmLvsSWtfT?=
 =?us-ascii?Q?5WCvSFNw287hclTLc2ocAP6H4sP+BJMPSWCSl/0yYv/y7G4hn8U//1fYnBct?=
 =?us-ascii?Q?qgTZvi9nOhWxq26kMJ3vk4qhejfmSX4qBoBvxub6i4GFr+37uZ9e6VGsl4hv?=
 =?us-ascii?Q?Ghw+h+yU6giNscTEsFrIq579tpbps2NUu8ceazVoSZkru3X7vgYMnRiou6Ld?=
 =?us-ascii?Q?PTrJa68wK/pWlKACBSiq/LH3TLEh3NH5bJBUPrKcKaMgvIdxv7ZDm7JBbL8s?=
 =?us-ascii?Q?19bGAcMLaoiYdYVaZnv6xQ/geTvVmjQKjDbYLO5L5TWQpZYPh9IJI7GiPPxz?=
 =?us-ascii?Q?uMMvZVJdMZ38jGaClgNKnCjFEN4ah4mLtUvhNU+8ca4KJBOlQUrA9/7WVoiu?=
 =?us-ascii?Q?nWLQAHF2SbSHWi+YSd5gTq5YfBTmWt7ztAWi4IhknLinEEFOiZqIOmBZ5wJw?=
 =?us-ascii?Q?xwjFHyB3wtgxS7JmaNBYhih21oXg++E6tUJ/zDofadFXXLquNHSWOm3IPC/N?=
 =?us-ascii?Q?PfQGNM/Nmk8wornZtOSe2NT67kkZTtcOIOCP0H01b+cUT1kvrFuqy6SK+1xZ?=
 =?us-ascii?Q?KHaeiPDiQB81IaFlrIKLvEiAY8nRUbKdO/ZBT374c9KT7+m8fls4ZIlgOjEX?=
 =?us-ascii?Q?sqtTiFfGWC0WiX1JxR9exlhl993cgmymhMa4JNQ4dkULX7iqyPFOD185RDlD?=
 =?us-ascii?Q?gitmKp2o0zgxuSrdHv7UF8nI5T8cYKZOP5jDfhbkifBlm9ERUuCGspoQ1L9n?=
 =?us-ascii?Q?Lpu3t4Na7y/s3Fl3DvCwA7hpRfKafcnbK/wDcitfYHFeHxynpf63WI47d31r?=
 =?us-ascii?Q?VsyUgkQ3T7HI2W2Ad323C3KnrtYjzxDlKjSl4z0L4+JD7YssrGFmdTT9u/Qy?=
 =?us-ascii?Q?ujqEIm1GxtjBgcrFhpdHwslwlZlZcuZm7OJCd2rlomfZCHQnmhFa+/Zxhbu/?=
 =?us-ascii?Q?P6eVg4X351XpM/wI3yadIPJztJQ1xkoU0PGsJOUa5ENwMv6aZdPi9PpSXpUS?=
 =?us-ascii?Q?2gTiCXXAcVMqSr8y/cmqa+c/CgN6OBjHBXU6eK/BUoU5pU9pi1cUHghaTUcp?=
 =?us-ascii?Q?oppXyoCGKSROqnq3e89Lvtun2vnJdf1p8r3s?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 22:17:45.8038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afa4d65-348f-415e-df01-08ddcbc91522
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9353
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

The 'tag' parameter is passed by value and is not actually used after
being incremented, so remove the increment.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index f0acfaa153d1..7c43397c19e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -103,7 +103,7 @@ gm200_flcn_pio_imem_wr_init(struct nvkm_falcon *falcon, u8 port, bool sec, u32 i
 static void
 gm200_flcn_pio_imem_wr(struct nvkm_falcon *falcon, u8 port, const u8 *img, int len, u16 tag)
 {
-	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag++);
+	nvkm_falcon_wr32(falcon, 0x188 + (port * 0x10), tag);
 	while (len >= 4) {
 		nvkm_falcon_wr32(falcon, 0x184 + (port * 0x10), *(u32 *)img);
 		img += 4;

base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.43.0

