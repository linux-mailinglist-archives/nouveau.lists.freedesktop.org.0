Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC269897E8
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAC010E38C;
	Sun, 29 Sep 2024 21:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KMtB8djq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421110E171
 for <nouveau@lists.freedesktop.org>; Sun, 29 Sep 2024 11:44:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO9lgXk9gDF310wJMnNsJXCEtUtikkc2O0L7GzY5+dSWWdYZwHVCPWMGHbjNlYJDM/NvwAfmPBWR9vwEUsIfU3ChCl0xvH7F0P7SjBeGs+QLLkcLdyeaXc9mS2yLmF+ocFgSeXr4vs/ALcGGFJBmDh0PcFYdnfhRHDqL5eWCkMJy8TsxEPcs5Y8aIKFkuLSBOaIC22siLYox84EzC+nHA7WFyg5jkN5aorIAZ3P3ENifSeXoo9ssDSDmXCQv8D/kJvJ+YM6mt3eaSU8Uc38fEyM0KskGgYzr7PIU5AckW4czgUmdc44toAM1a0rzaWgKAb83SQ2wkzYO+5sF1jJfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=iuGwlhfx4HqtXGRnRhSGvRcTpn7tf/muMA24MAszHs1LAzOsLYStSEez8xR1e/7lWCgMvwscRe+LBC/Z44oKFX5WwH34DJnLxXYVG5pJR4LjK/wuebiztNXNf6SM1VWe7/e9yCf0OcfYiab/lLn3KMDs2JMNH9+FQ8Mqa9t39T/2y9yir8tjJO1HP0X9MCFqkeDeRaRMKmv1hr0eQbXMOe0+x7B0qP59CiLGu+Q8DvP9rm2LTR2pL6dAgUWwQfAPPuRwMXwPGuv0CLnWrkmYVw/l7YWVpsgI/1BY0L2dI4JU2MWAMQGeRXKMEpzpc0Pqcu6U07maBKd/9AkpHALROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJqP4zemDkW4wrwSO612eOvMgNvjKhmdH4FHsV63vOs=;
 b=KMtB8djqeiLpnyqnTIE5mz3kWuml8ZAz4oeYveXuq+KAGg/tXJgXtyuzr/FGvVHmjU7TxRVCVKdowhZUXEdV5Z7ZlS+kwx19UUC8WTOXBzMwy8LZ6G5LNB7HeYkXAzCzECQI17LXl0QbxK36wFQE6lNQJoW+YCKJSChvE2Qhk6CIldkFS4+DbwNKBIFuxsop23DRbY8LwC+hohFXTzIdT8hWQyTHjCr1YPOurw5Cr4qL1XqKCBxuhT+mQB6F78N9S3y3x6DGgrBwZ0r/GFUXvaBMWc4gy6Lx2brlpa5SZafU0ugAzgpqQgNlHnTle2yuhswm+1+5U4t20ODXAfOf2A==
Received: from MN2PR19CA0071.namprd19.prod.outlook.com (2603:10b6:208:19b::48)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34; Sun, 29 Sep
 2024 11:44:40 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:19b:cafe::f8) by MN2PR19CA0071.outlook.office365.com
 (2603:10b6:208:19b::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Sun, 29 Sep 2024 11:44:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11 via Frontend Transport; Sun, 29 Sep 2024 11:44:40 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 04:44:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 29 Sep
 2024 04:44:26 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Sun, 29 Sep
 2024 04:44:25 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Yonatan Maman <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH 2/2] nouveau/dmem: Fix memory leak in `migrate_to_ram` upon
 copy error
Date: Sun, 29 Sep 2024 14:44:16 +0300
Message-ID: <20240929114416.420203-3-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240929114416.420203-1-ymaman@nvidia.com>
References: <20240929114416.420203-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 1290aae3-0cd1-4e53-3164-08dce07c1a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pi1NT5tt46DV2Bwpu5jvzTxB6qMeRBqmH14LuZHQVgUoUVK8BSl3TfO2D0yd?=
 =?us-ascii?Q?6DImOT3aWwYk9Uu0TEiz3SGLSKRon89yzI/PM4PoIEp7o+UZIJa9/A75ybZ9?=
 =?us-ascii?Q?5Lzyvnk9rWdoKxJCUuB1dwAVSSPdoJhYPKUI9cuepNm1dqk/C4LvIOa4FS4r?=
 =?us-ascii?Q?igD+3FXeZfgDXapsFcGMn4l7ksZogV95toJwtLjA86GhRTpiEr+6eMtekJHQ?=
 =?us-ascii?Q?ThygTeXlc6knHESGHWC74QtrwY6oa8aoq3XVzxjSykz2C/ctUpTP/JHCdbt/?=
 =?us-ascii?Q?tDhmJhxsOSNtKto/xKDyWovhlDk8A0KEPRuARDbtmFBC7Sac8brDiULJ1CTS?=
 =?us-ascii?Q?heWYgRWQLKSlie71oh0GBn0wiaEurtj81fFX8NOA2NfkxAr/Rb60KGPqgQ52?=
 =?us-ascii?Q?FjdhgfwGgQNXve/y4spq3nEyANxp9+TBvjBVQzDTEkgejs/qGUgcQph4OCyl?=
 =?us-ascii?Q?xurHL5xBhEcYuKFd5LSR+UMzvrONLNcgQS7mbKHNuSvY2ZyBvK5/mTH7Ubcl?=
 =?us-ascii?Q?0RDVuExU6WQCfL9swvnCj5RbQAN1H2R+U8yu7hvouV5zpHIJ2t6GekdwJ0Nw?=
 =?us-ascii?Q?SnCpgadh55A0shqP9eeGntbZ+Ti/S5h44afyjXvl1nsxlk87q9VLviKCfXyW?=
 =?us-ascii?Q?3WgU9jegwWm0Ec1ulsc57MKNGqZ1IlCYhKX7i9JRiZv7iwOppLGf7wZkdoTh?=
 =?us-ascii?Q?RUKA36tL0w+4V4v9l8fD6eF8UXp6neR8YTiXPz0eJI8u67WbNTXMcEuL3LST?=
 =?us-ascii?Q?n0Vn/mxG7m3zD1x6uU0gNC5cQ4KbPdnNI0Ck+v1I0u2UabJ+IIF1svj8v12G?=
 =?us-ascii?Q?Wt/M3XNryzm5g7SvPFkMTqRUPrgbdKuEbPhH1Qs60xhfZUSdlJyzshkRkBK7?=
 =?us-ascii?Q?DKDJWCXp8QSXg8pSELLerP3OZ9AnxMBRNZ4RAHvBZ/YikE/J15LcVfdLX2b3?=
 =?us-ascii?Q?hFKrVgbS8yROjPABV2iQIHbh/uZwEkBGpYgzRkDkR805yWzH6+jsdg68MPJa?=
 =?us-ascii?Q?KXCP1DTtcYhgsZLCiZVcKVMuAllMF6XUv3XlBXZm5WCiX7lltsm1L6sNsHtf?=
 =?us-ascii?Q?5UcOLHtJbMdEhPiAH9vgMS3kJTVZnEKO856tGYyjnsjkDGIkVTbGR2UcWiwV?=
 =?us-ascii?Q?YENWQggTVzAhpFPI0pvx/mG2+bEYtVum+OfPInIPmB/kBp1Aq2hUcNGlf4XH?=
 =?us-ascii?Q?We3iXx1hViaKuQpWTWWc1aToEV36ZPzkP03kFGBt7NeB5+htYxHckKAkOqGZ?=
 =?us-ascii?Q?bVuaA8CCG/uGjOPaZC53o+8BVJg6uhq7Aut/lN8xZEGyoZBt7HeLn1MkGBtb?=
 =?us-ascii?Q?ttjj3fF4vTrHVVDmTH8na+JnIgneM6W8X49Pgd1ly0HJTdQl9TB9R715R7sU?=
 =?us-ascii?Q?QV3mzDKQbqrNvGB3mHM02cqlRwDnzagd9Kn5f+nhOCm37wLsqwMMoydxre43?=
 =?us-ascii?Q?mNuQ1EZf147MjI683EPV5TjKjss+jhFZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 11:44:40.1298 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1290aae3-0cd1-4e53-3164-08dce07c1a65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:29:23 +0000
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

From: Yonatan Maman <Ymaman@Nvidia.com>

A copy push command might fail, causing `migrate_to_ram` to return a
dirty HIGH_USER page to the user.

This exposes a security vulnerability in the nouveau driver. To prevent
memory leaks in `migrate_to_ram` upon a copy error, allocate a zero
page for the destination page.

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..097bd3af0719 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -193,7 +193,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
 		goto done;
 
-	dpage = alloc_page_vma(GFP_HIGHUSER, vmf->vma, vmf->address);
+	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
 	if (!dpage)
 		goto done;
 
-- 
2.34.1

