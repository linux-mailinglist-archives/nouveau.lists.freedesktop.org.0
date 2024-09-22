Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A088C9897A7
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E443510E2A1;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bsb+eXqk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35A810E0C1
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 12:50:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcNzaUwCK7h9FjGmWhoNusSQcN57ACH2snh5qpcoieiSSmGMB74kDD83HpE0cDmYo6g8J8NJCqnuiI3F1OHukB42jcL/Y6kPPB5ggOdZXEcuaXU00EmHtp21XfQdHwbDI2TnoOACiuu4qs6P8ADYeQCsByesMyV+d2OOWtxRfDvsrN/TvqlxpvFvNqS6lKU+lvJrGqxtn6cjEtzW6jtzbknY5mzFhD5b+X9hPPZeS4+CnxaOrPLHAGgODPFq8CNRdD6p1Qcrr8yYEXqjHXpKoUET32vl2FbYOvjyrFD/oS09jHB0AGmJtnNdEegzo1W6kbYTSs+ethl88OLqoVbE1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HtPBKZcitq34yHYeW8ZKpZIUkfMnrrplcQ0Ok99de0=;
 b=PAuT3DV3zYpeKRx2qvnL43RtG0kLkTPNis7VeSET6YPrklSxDJ0y48e/qVcZjiK8Z7JBjRliu4JRjOapwl7N33TkJC5/A6oBQRmdAe3sBU+r1Mb0KX70MIK3y5nJk4tpWmmnSCNf0NwQMg5Ea0Lm/seufao1cDpZCognflJj32NWSqxYWWEm1Yg+ijO3GzUhaY024jN5kBWvynaiQM4+1Qu83BS6GOmEX+ZK/qQ0/+h+qKWgrUsblHKVdVyBNNXBok5pqSxOx/yLiB3g1MSU7Rt2fX+OO17jBY2QFGRQTUskET8ZDwQ1iN9h8ORtD8B4aC/X4EAm8Lw+vMN5FffxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HtPBKZcitq34yHYeW8ZKpZIUkfMnrrplcQ0Ok99de0=;
 b=bsb+eXqksUXz3ICIzKj3w51FcOtk2xxD2RQ0tBjebH3qsuuu7ybstfjSGUe91HoI8yHn+lgJsMQsQN8Cn1tMcUBfDJ3Zo3QIcAVjenORBsmA76Csjprqfy6lps7aEY2p87NFlsTqSJreoHgbgvRcoaWRhVImdhhkDLrzoM/UC7suJ4tv6zl4p7ztlaEpzGvKdHU/AaBFN3oATNpyxE1PLJr3eRbXPeuIu4KeL2HBaAQgTFIAyQ2EA2rd6wNgDBp0KKdP3W/Mg21dt6z/KITemNjI57UQ5S8pyLZRGa8iIHdhUqgWZqaqBL2rF7kgh/VuT1fQhzFxClZZeFRHP6M0Vw==
Received: from BN0PR04CA0148.namprd04.prod.outlook.com (2603:10b6:408:ed::33)
 by MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Sun, 22 Sep
 2024 12:50:33 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:408:ed:cafe::3f) by BN0PR04CA0148.outlook.office365.com
 (2603:10b6:408:ed::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Sun, 22 Sep 2024 12:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 12:50:32 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 05:50:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 22 Sep 2024 05:50:20 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 05:50:20 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <kvm@vger.kernel.org>, <nouveau@lists.freedesktop.org>
CC: <alex.williamson@redhat.com>, <kevin.tian@intel.com>, <jgg@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 03/29] nvkm/vgpu: reserve a larger GSP heap when NVIDIA vGPU is
 enabled
Date: Sun, 22 Sep 2024 05:49:25 -0700
Message-ID: <20240922124951.1946072-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922124951.1946072-1-zhiw@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a7de02-27fb-439b-61c5-08dcdb052595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SH8NjsTALsyQLLVXYoIDym+AGnuD5Gge7W37SntOokejbaZ3NpxhTX0oU0XW?=
 =?us-ascii?Q?YN47tWjK8lltsnEr1bYV2F52G7oDCcOWXGQEOleMZUBUXu5DQ+hf9JmGBlZB?=
 =?us-ascii?Q?df4QSyCZB5JnGtk3RCU6ebyMFfVZtnn8ejVLJQUQ1w5WixX5vAA0LBzAOCuK?=
 =?us-ascii?Q?zwbZlQj2fEq7kcno3W7sdds7ovvoOAk+vyWIeKdXRPocGogZRwgslSsioMw5?=
 =?us-ascii?Q?gW+ds3WofkjoED2EdYbf8CX1KXhS083tAqGRBYGcYuljHRCMLcvfLKldfb78?=
 =?us-ascii?Q?vM2bl7hekJyPKeQ/luSc8A/3PlUAiojX06afMEXqBNThec3YtzYNecB8XwGk?=
 =?us-ascii?Q?ZTClHh+5o03cCSHfXxxA8/G1mEErmxV3zjh4VpJUkkaWgp6IWGhbQ5Ku1aSG?=
 =?us-ascii?Q?schliBqRmImK8rWVhwK+DooAcoOigOqSFyuokpna201OdIHzeOZ9x1pDJuXV?=
 =?us-ascii?Q?KKVrmM/9fkK4A1edAeRw0Oys7T3ROnXtN+Lpr6pd5ZyU2Fv8BovZtj6Y7/oK?=
 =?us-ascii?Q?5kgIG1bVKioZkIiibro1Ds8HeoCEpDjp8nDLDp+cqj+pMJBmbvlZIdv7Vmxl?=
 =?us-ascii?Q?12BlKLWf6rULaczZoMX7FAEFmtOayHOcmygbQ4fa4XFRcsJkdlXgrVD+RYWl?=
 =?us-ascii?Q?1l9MemTSiW8ej0z338cFtPh1SPg5sve7z7hvGDoz5XG3fJaAvIoeHZN1QSur?=
 =?us-ascii?Q?AMEgZndr0bB86Ms3XjS3p7s+vMVXCxrHGbwbTgNO4QizxO11768DIemqBPV+?=
 =?us-ascii?Q?Ijrzn6Fpcbi+qXjwZS4oLqgA0SNuAbeRgn2Cw9caEWBwI4u6uNVXkUbNVKfw?=
 =?us-ascii?Q?YZzkxfcGt2R119Ul0PU1FKPj/0hQsSgm9z3997T6uOSVBvT5TAKS1y45JPaM?=
 =?us-ascii?Q?w05C8xSRT3qt6oXJ0sOPNv+5I0OqunZ9eUa3M5Cx1f01EMMXRy+ZW2Ce4xfS?=
 =?us-ascii?Q?609IXVtcmG8Lr4G+MBvw4LBqhdaiw/5VY0NJwrHpJ8/pKRjlamdyJCwYiAa/?=
 =?us-ascii?Q?nxhrODFBASUzEDSoGNKzzYpJnIGcWtlYrwcYAaBpXbIvtG82v/DfXrsKqVmn?=
 =?us-ascii?Q?HpFAu+rIbwytWXKvA4cCY1jNxCv9ml44mX5wA4yFxySufu859X6mVsVWihWi?=
 =?us-ascii?Q?Ry2T0acnEsUC2O47qQEFEI0xJFv9KKg4s1EyLpkuaMbv0yNb/qk6YH77/Ipj?=
 =?us-ascii?Q?5Gd1tTcvmEDHeYDFxlPM3Lcu8Qpm7LRGkJNdEIgwN2NtyUjdW5bW5UWAsRiH?=
 =?us-ascii?Q?MOc9blUzfTGpB7ofdmSKUFDp1zFdEMfHZ2euQ8QdBaCnTUe+xwar0XefSFKM?=
 =?us-ascii?Q?b1Kw26Qyv6hSODbYFPA9qfucGRZvF00CPniMqZnBZHoIYQhQjFVx54Y5J/I0?=
 =?us-ascii?Q?JinDz/Ym6jZvGBiYngiqghGmpAlLncQoTt8NT0SJljCKOhPmoXQieaS3Md9Z?=
 =?us-ascii?Q?u3Ak4uzpYXEjKvEBSWejGVnYnGjiW2+B?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 12:50:32.9602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a7de02-27fb-439b-61c5-08dcdb052595
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:51 +0000
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

A larger GSP heap is required when enabling NVIDIA vGPU.

Cc: Neo Jia <cjia@nvidia.com>
Cc: Surath Mitra <smitra@nvidia.com>
Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 18bae367b194..a38a6abcac6f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2638,7 +2638,10 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	gsp->fb.wpr2.elf.size = gsp->fw.len;
 	gsp->fb.wpr2.elf.addr = ALIGN_DOWN(gsp->fb.wpr2.boot.addr - gsp->fb.wpr2.elf.size, 0x10000);
 
-	{
+	if (nvkm_vgpu_mgr_is_supported(device)) {
+		gsp->fb.wpr2.heap.size = SZ_256M;
+	} else {
+
 		u32 fb_size_gb = DIV_ROUND_UP_ULL(gsp->fb.size, 1 << 30);
 
 		gsp->fb.wpr2.heap.size =
-- 
2.34.1

