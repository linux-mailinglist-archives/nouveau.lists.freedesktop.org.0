Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6F6A1BC19
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A2D10E57E;
	Fri, 24 Jan 2025 18:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aREFJnCA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2070.outbound.protection.outlook.com [40.107.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7019310EA0E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeNjfl75nyOlwXoanap8Rwx/sZreUsldvoFwac11kq8rTDTytLbggcan9WUgzVXKmlzHalSyPQrUHYwP4R9wnDls6nQNOaUn3Kkz5JZT90J4O9HpUKkw50znbyh1al6fROF1d+kpnMF5T0zqIojmt+amJgREb81jPNoPZFHNDdPRh68yRsVQhDIwRY1dcp5engMUNXJyFuXkaQg1prcnYvpAu0RJWMTxNr/fI0Kci/kF8e76jckHH+HYjEEaa4fFwZoMUq+ZXkNBAZMs+ReOi6KaGZfkBrWWB05cUee3T9Aybi5QOf45pNCSxPmMi/wepyntzFvTFYOsrcMWAzqebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiw2TtYbSOM4ZCfcfvQAEMNAMxxvNspIiH0KQoIAsSk=;
 b=u9WfOnl5u/vpZmS1kqra1P+sAgbEZPDhyrBSCK5zT7VuJg/7o5DIDzr71v+qRPPB+cJtXaJN5kr8XVTzsA70rbR1sljEUcN1Cn+FfJ9iJaEZbd1sIw3rEqo43oOgWHStQLnQBkfIeu6e22o1M0c/2IAD7NX6jWjEX7CtSVcSht/+IVSA/tE9+lpk3O+sfgcADxKGZe/s6YjU7+n+KWl82Xo66G8phQxR2Ucwobr1QumL03uW4+YytDYzwVvI7dM9vpbmTvTuLhd4fwVpleoeEXxiViifGC/8VFyuoDR48k1gpcR3zy+s6lvNq9y/JT3aRNJdplIEXh84wtML9OQjGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiw2TtYbSOM4ZCfcfvQAEMNAMxxvNspIiH0KQoIAsSk=;
 b=aREFJnCA1h1OCHWGvbJYgnb9i96zgL8n4+1ZmuyG+Wr+z5m+J6QAvevTOO+g5fY9Ex3k5YmEomPYwDcFQMa9aOl4y/Dv2y1hfUHkJ5eO3t8Fl6dazACbAsDdlsDcaa38PB6H38xOi2fR6aJmmV7XW94OOI6sCrT4IPjoRvTN+cj4Hg9HKohg9tfGPsNAj4E3SJZ5qZ8wreBT8yxYTOQ8Pl/mmDuf+AoLou8NLm9KEym1A7C3WmTHMLdKjtd/UoFjCL/Pgsq6flXAsMWXLrBnntxIiB25MYSNiCNw+zSSeO8/0gzx/X5g3aH5Lmul7zLmM9MSVraWBF7ZeHvl4WfSzw==
Received: from BYAPR01CA0023.prod.exchangelabs.com (2603:10b6:a02:80::36) by
 MN0PR12MB6272.namprd12.prod.outlook.com (2603:10b6:208:3c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 18:30:43 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::f7) by BYAPR01CA0023.outlook.office365.com
 (2603:10b6:a02:80::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 18:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:29 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:29 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:28 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 07/15] drm/nouveau: fix the broken marco GSP_MSG_MAX_SIZE
Date: Fri, 24 Jan 2025 10:29:50 -0800
Message-ID: <20250124182958.2040494-8-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|MN0PR12MB6272:EE_
X-MS-Office365-Filtering-Correlation-Id: ff299561-a45f-4fb3-354a-08dd3ca535d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OsbIsfS/0qzkcYMat+7h4WUwZ85Rv8opLyGDHg49k8rX3BgQL5l6CEoV4Hd5?=
 =?us-ascii?Q?2AIt7OauHk1N6KSqzsbDvDJTlCl8fzGQjzZUAB8jO7Vj+8befj4NuToB/+qq?=
 =?us-ascii?Q?lWGBkekzdIvxXPS2ns6Po6b6F+cmqR+R6oSNl3mvlZRBm3Nb4V2E0JFHVgEh?=
 =?us-ascii?Q?P6CiQ9AwDKEr5YSev7xpQVkLw8phOBls4NludgKbnBZhjND9IobdbGJTiIlT?=
 =?us-ascii?Q?t6z401htmg4bwAWf4oKzoao04Az0XZrbxjcMWw3goGzMMHKe9M11JcLfa/bw?=
 =?us-ascii?Q?f15qS/lK4UMH007hd1iwLHqi5Xxb9vQUuSdcfuDK5w+3GaTIiBGP7NhOjn09?=
 =?us-ascii?Q?oxa+IePiSgt69nz1hYJmjDFPF/MHAMYrRat0crzxESkoLhbo+kCz+lW79qpg?=
 =?us-ascii?Q?rlcQu5ciNiH8YpMj/Iq4ico37BS9EkrXE0TNEhBATBwVTz7oFwZwz+vSsCeY?=
 =?us-ascii?Q?EPqguasfIcoXt6IWYpBqSC9Y8+43zJvNI1ZGETAqTCr7KyUO/ZMn1dMXvquy?=
 =?us-ascii?Q?rVgggnAq3TSxQgD88imPnWSsc20KmRVVeSW+zohUCGgLNJ0Ime0cfxUOYv0k?=
 =?us-ascii?Q?m39n6RhYp3TIXCRa1z25oh9AmCKnjOQIfls9b1r9/UF9g7ETTcdL47ynKD2u?=
 =?us-ascii?Q?gW9ZPUCLFUyquyh+eRInbwBYWyTWlAyqFXYkrnNva1Lr0ED7TW2JszaGk6e+?=
 =?us-ascii?Q?hNjIl32b94G8S2fHiug8Vx4WcB6ovXquE7kQQc/vjVfhGYQLYjoYIsvgaoL1?=
 =?us-ascii?Q?q0d751PBdIjD//yZFceD1GdJgEK6ksoLS6QTebYb5jP2sL67OADvF6kejuNg?=
 =?us-ascii?Q?U152X0o5KoiPCl/Rn/8fgtgw+TgFRqS/xkz0TQ6YlUGhcvZlx/H09U+GN5By?=
 =?us-ascii?Q?waZvXArOL3xfdSaN8uxlz95fnNFHGrjK7cTCrvua1R5wQ1o512/V1a8nEEtV?=
 =?us-ascii?Q?BgSECFo8jw3gTuUFr5eUP9Zvi8+Wid4Xgv+LPvT77ibobSikRjPmE7YnAEkM?=
 =?us-ascii?Q?mIquQzbQQXGKfVYwPVLfeyeAuCkaQNdKgqVw9I3xstFw6sQs9zzncOGmN/5W?=
 =?us-ascii?Q?s9CyhVLfKndbm3XUve9dndSHuolUgbAxLw8wMft0uJFeGY4Ebgg7YLj3J/p2?=
 =?us-ascii?Q?UhTRP5609Cn4ikMf7TD+93j8E2JIH57twzpgj7ZWbIqCdP+GdiV3XxGKsRaB?=
 =?us-ascii?Q?7jmhc67foUy47bPzPTsqfRRdLYCh8gkfeLq8OESUkCQILx32A/msv8FkNAIt?=
 =?us-ascii?Q?IZPWsG+K2mQR95IIwsoMZi5F2l082itLg5aMnKgM0RyjJ79LZUUgZ3lNpFzY?=
 =?us-ascii?Q?vIOWPDZ7wQard0NFsT6dZ2CwMk1Ofe9hjaIcomznIS1unR2rKiYgT6DO65Wh?=
 =?us-ascii?Q?ttPDqz85WTL5Jo9bcp6faJlWOL83cQY1AlrOEwpB4KHu+dTzZ3uHPmW7nWpV?=
 =?us-ascii?Q?xNMgrQ8d0SBis5ZI9//R1Cj2HAuwYGVr7l/zZvC+VjaMxdRj4YqU+51sBa0A?=
 =?us-ascii?Q?AkK1PBUR4i9SJ6w=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:42.6732 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff299561-a45f-4fb3-354a-08dd3ca535d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6272
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

The macro GSP_MSG_MAX_SIZE refers to another macro that doesn't exist.
It represents the max GSP message element size.

Fix the broken marco so it can be used to replace some magic numbers in
the code.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 92daed69cd46..dab0117d41fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -61,7 +61,7 @@
 extern struct dentry *nouveau_debugfs_root;
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
-#define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
+#define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
 
 /**
  * DOC: GSP message queue element
-- 
2.34.1

