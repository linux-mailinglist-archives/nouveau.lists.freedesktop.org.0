Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDF293CD3D
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC1610E246;
	Fri, 26 Jul 2024 04:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Avw89MfA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B83B10E246
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCJt5JHzk33cGpIGwoN+Y9L0mYXMmbPULe5Mj53hfJW6RXs5J9cRQckdCinK7cS+8Zkafme+llds+anBlGhLhxO9h9OfLqBdYHewKhUC9VHpCUkx5F49AcEiknkQaIJ8kyVfhmvkRiRPSzI25bcT1XAegNYDRzy8F0V6nLRWAfCT7zc6W+h7qW+TEOAgUGh8OUH0JdeyRLl/hN7huZB4OloY6tLGDNz4hB3qtcLsMbR6I1K+duVi/vbKOxhKR4v9PVKWh+KcaWeuV33FaLn10/HuyChPbWPr4shi0h3FKmA6kOzOPNn+jLYFHT5U3CvfxkL/C23AzMOXTm1IQhCpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZw1+qb6esgfGnsiAauzgT6IIZ2aK2fmWoMaEuviZ5U=;
 b=xM8DCwcpzvzpaUyqKZ2WJiIhaYd0QNWeeQMZyweQusbw4eWrVdpAgiJFMsBi7TPTED3DxqfAlfxgqkYvzIfjooHEtbb7QLuN+QiM61d5e8xNr4RYO2cqzfMIUJuIiO8Mlz3SaXS58QtK6GijDPqHiTGFDxdyS6RwhEYXD3eUV5VyjZkAE3ci+bmqu50qBUNconwW8/hChIz+i4/nxrkUjoobXbROLusTtXFMfvOvbnPxf0UMJ3l0BE/OHVFcNvJc4IQQ8jYFuL9AnXBWXKytfh1At4OiRMLNeCwUCcTJwgrqMArOJDbveBbIK2bfQ6SGHZPpKiiCGdvgbjwdZjSrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZw1+qb6esgfGnsiAauzgT6IIZ2aK2fmWoMaEuviZ5U=;
 b=Avw89MfA6sW3/De8Fod5mRjX7+uGIms7BS6PoqbiyuR7mel/VNhBJMK9F5LI8KShcaDhILolcOlWck5KglwfHr3hKSnz+Ew9x1U1ALiSwsWl/7141s50pqvOe3s+CqlaFZmb2p3+JVPc8YrGY/OGId3Itl2fUNgT66PfVu34JbTlZvYI3HbxOLUJI7+IrdLeYMCdVAKKyetRpnTp4ADGqq/nMZzb5C7rQo1QUsXKlHAGUfHDkIhGy3yOoye/P0p8aJOdJ1bml2vvHDs4Oni1eVJYzw+KVRwM2CxLuenl1ZLGmm6q5womwd8bAZ3+xVVYsiVnnhL/1DrKP6sUzHv/Yw==
Received: from DS7PR03CA0106.namprd03.prod.outlook.com (2603:10b6:5:3b7::21)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 04:39:07 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::9a) by DS7PR03CA0106.outlook.office365.com
 (2603:10b6:5:3b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:59 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 10/37] drm/nouveau: remove abi16->handles
Date: Fri, 26 Jul 2024 14:38:01 +1000
Message-ID: <20240726043828.58966-11-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c238646-fdaa-4fda-d590-08dcad2ce293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WE74RhhaeviOH8GXAHhFKCLqcrrX1Ngs2Dmj83DzJWFYrNqLupy4YG4Szq3Y?=
 =?us-ascii?Q?neFJ3IER9r/nAVEMyG2wyDGawUOYi6AeunXxR6smFlBnabr8t6TBKjTtb0v3?=
 =?us-ascii?Q?oc/De76lvewTquAaUxX7ERsOuEtl9Bx/QMG1If26Mn3LwTImMmyuMRd87cN+?=
 =?us-ascii?Q?tOxmtDXe31P30wFSd1PJZJnnADwgPQ9Z9E2famm3EQZOz1dzq9e9+OZal9z2?=
 =?us-ascii?Q?2sCTkhE30JlDA5FS56+wwA0CIvnLJtf2g7qTQwsEcJvGMSwrszsjuyrKZnWv?=
 =?us-ascii?Q?6XLa5tE9pzPMgpY4l8flTS3/0w61RtA5xu4QjLavJiuhcJR3ScQA5jINTE2J?=
 =?us-ascii?Q?GlCVydhnzONvBxwXZxemwNGv+G5WIxRVLjOLMKsi9vMwp0ph85p6ScUlNJcP?=
 =?us-ascii?Q?O/4ub8v6ghirTzZN3rcpQ5pQFmq+6nuujgPDBRAu2oFF1rFzvh05rKEU/GDs?=
 =?us-ascii?Q?TmCifjs4WRbyZaY8mu3cNJmZ6QvTu7vwKk+g78UdEkAOpUQEJuSvxpdkBkfj?=
 =?us-ascii?Q?mz6v20IrMNrnPi0zcFlXgccSs5L21etdu7LnkJA9OVd5r35fkcjcfU8ZQNkX?=
 =?us-ascii?Q?qMrQV40Hjhiy+d5Fg6nRfqnLSgLoSOTzBqeltK0ZMbiX1wN/zsMFiit1UsaT?=
 =?us-ascii?Q?c9pTRgmPY2J/GFqQSpa5b9aP7yNgjpqt3kHQr+TGDrY3mHyUNHYbDVrCGYbG?=
 =?us-ascii?Q?WDvwmmwpGLkIs2OeJMyB7Vat3XTk9XBmkazySVcXNpSo1PrijY831xOr99wK?=
 =?us-ascii?Q?+u+Jkr5XyffmvnTMgwy1h6diHdLfK2j4FjPA5z26n2VKP5tQgOKCTAQVpS1o?=
 =?us-ascii?Q?LwmX9GiQxbV96iaCPUUpkUTYXqaRcPw6BtTGTPkzfVTRJg0XVVoVQ48mGsLQ?=
 =?us-ascii?Q?LQmPuAS0UzsuuatrmuPK7iSm7m2lj9RXX9UU3zBnkBvIZAUtqoyjJuCyyusk?=
 =?us-ascii?Q?modfTf/99bj74B3RPsoK/hA0jv2i06lDtl/ArnxPDe56+2hay5nRIbbrHsro?=
 =?us-ascii?Q?EOuaGclGgO6dSbXgY+ZOxeBVqr2O2sGGa8UGCZP/rn2FU/PywSs8F70rp0/u?=
 =?us-ascii?Q?3nbZaW3Vu9K3yqW3QdXx8FJ3OtFdWnmFgXD3qId+Zq4V9VDvOe2aQcT/Gb7I?=
 =?us-ascii?Q?LagUKzhedqVKXOs97TRKQ81VtFaEfSFhSML9SKCQLdWS4vH5cSwtILv65hUo?=
 =?us-ascii?Q?1ay/WCCy3fl8oE73iqUUXAOSjpU8azfdimpWeyqZJP6RCoR6APz9qcZgc0s0?=
 =?us-ascii?Q?W9cAglpDfHgYbQJCbDU9X5ReKg2vXXRrkPtV5EY/pgC7i4gm+3RU+04zz0rA?=
 =?us-ascii?Q?woB7pYwnjae+dxAp/UoB6LV5LIvTZZIfWKaePTl1hY53DJfw5uil1ycHo7xf?=
 =?us-ascii?Q?oegKtGd8MAZexORrTK71ikfbJVHJt0CpcM0BAOs8szy+pRNYRdWj/m7iOwDJ?=
 =?us-ascii?Q?++IDFcssEjM1WSAtx3uuZf6s/zxpqA4C?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:06.9710 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c238646-fdaa-4fda-d590-08dcad2ce293
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
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

Hasn't been needed since 2015...

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index 4743459ea14c..af6b4e1cefd2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -32,7 +32,6 @@ struct nouveau_abi16_chan {
 struct nouveau_abi16 {
 	struct nouveau_cli *cli;
 	struct list_head channels;
-	u64 handles;
 	struct list_head objects;
 };
 
-- 
2.45.1

