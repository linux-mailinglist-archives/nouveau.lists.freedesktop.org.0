Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76693A1BC1B
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F30010EA0F;
	Fri, 24 Jan 2025 18:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="erIQBJhu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4408510E57E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AB8uLUXHVwKqlkISjc/DyTZRJz6IRwR/viVyxcRcf7U0Xumoj3XceptujKU4cZ99e/MjbRwwZ4enDScxlXwNDO4L3+tnzCg1wvh3oQAyTA30QcP9VPwXp0UCAHKqmZ7tG3kkCVxgPA8AAqgHx6ZzCNPW3Ei5o3lW6W9Pi4jxClkYlfA8Kr6r3DIUgqwgBu8WY2+8hf4gAT3SL9ZfhAx9wxITgUJWpSYJdw4tosBFIrGSSb21rN706cY+Ve0Ovz8fvhFj+Z17y4BJWF11NZdEwCmYt6CwIxNGc1t7CXyr1f+vgi8JrJbf8Z37Z1fi6ixg3ROQqxQGmaOTgaP42Di+EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+ncF6uKa0Vm3zUgVyTVD/rusE8VLpQ8rQ5lYSo6DnE=;
 b=LgMsvjkoEg3hbBgwyZghmirPc629cG0dHLfQL1vmty0usVUkeNbv5gdwfI9MCutfAD55mqpCB9vqmoNdmLk2XgssjXd24D1b4qYhNr9x8I1JhmkwZcgRQBv25uTwJDrCWEopkJAcXp1cpyqLgK+B8szH3pliANGSI5q+YDWrYRc2RpsBmEvTqfnI6HWUoe+Kqlol/B+CWpcziT/65Doy3rd4t6tu4ijZpAZNv1MP4+TmJOR8bIw0ov8H+T3RRkVpZ5T4MRLaOVbhoNxFJSHkf7rOm1HtWQnzXHXU3gPyX2Gw8pvMAYx/VmnGcuqfgJ3yGakSfZ2HLkfiiif/5LQLcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+ncF6uKa0Vm3zUgVyTVD/rusE8VLpQ8rQ5lYSo6DnE=;
 b=erIQBJhuTX39215eS9br4YEKDwccm6CK1t+dKjhJZuwoiCCxXz5XxWERp7SXQx8qbvuvMAMaVN2oYQL20fevlieSAMSVpSd/uTH3Q8UEuT95E7q2IX5/gcJdqdog31TL6K0HP0grZWgqjkMJzeuNRChBn2ZPHqbdmvCBB352FodhibWxA9cFL5quZKGrBOfDiU3hX4QkUcMAR5AptSfyQg2aGeQgrUQsF6B5LvOsEpAg+i1GUYx7B7fMMTF/okyIzjxyZmsSSNnzjjHLZpLomwKTYnEDd8LHereZk+yReS+ocYzr+poGEZiujk4xnSAeBZXmP0O+efi+foNS1qkgUA==
Received: from CH0PR04CA0065.namprd04.prod.outlook.com (2603:10b6:610:74::10)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 18:30:48 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::30) by CH0PR04CA0065.outlook.office365.com
 (2603:10b6:610:74::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 18:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:30 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:29 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:29 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 08/15] drm/nouveau: remove the magic number in
 r535_gsp_rpc_push()
Date: Fri, 24 Jan 2025 10:29:51 -0800
Message-ID: <20250124182958.2040494-9-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 28fa5012-2f90-4ebc-8818-08dd3ca5391d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bnB1f07jZbY0b7eX0j8DDXMikbBsbIepGceXr2dLfaUdiPZ0V4dFefjMi3Qe?=
 =?us-ascii?Q?M7+llHm38l8WijmX7Zipig4OJPTSh0Rab1ijSURDTCPkgEWr1lOg1XVzZwEs?=
 =?us-ascii?Q?LhWflQYhe4bCkjdKX+u7vBHD/1LlRp5XtgNXjGvt26Qk/GR/yrttM+6cOMYd?=
 =?us-ascii?Q?0cnEAtmDc92aKNy9lKEuNs/ZgHUEdVoiGt0gJfxJpqsul4ZXD8zRMv4IeLoa?=
 =?us-ascii?Q?JyIIP5VGCmsmuDF2+yRArDGuW5mKGDt2skDnWI62mRt418ThLvW9sGLia+TB?=
 =?us-ascii?Q?Mvk1kvlPKGfZtyXm1aUjb6Zmbo4atQ5ojhRSn8ID8VtKkk/FrZPUqnrR+Ocz?=
 =?us-ascii?Q?hRADcRkE4mqlIVMgjevNQO+n+FK3TyQS6DUI6l7UMHsFTOckuNtX4RAYmiop?=
 =?us-ascii?Q?u3z+dWwAZlDI0PU7oN4SVJFoc4e/hKsbjIprG/ZuLbiX8gu2vFVjSaAoxdol?=
 =?us-ascii?Q?tbqXW3zz2wD5X7/vnTme0wMSmIuTCQwBMCahg7z1ncPjHpq/UXAr+mTv0rTd?=
 =?us-ascii?Q?qg46cJatdeFQR4Rf27cMk1fgvxWm4eqcrAxUIbI+CeGPNHvS/+6jCjHJi1Ao?=
 =?us-ascii?Q?XUqC5nNxjwdcqfu1WW5ZpubfhW41kfpwVcIhAQanyNJq7NaMeKcaux1YlvkY?=
 =?us-ascii?Q?Rg/z4ko3nivOMCxQHgnexD50oAACed22HrmLetA7UUSN59w89ZYV/EIV79Np?=
 =?us-ascii?Q?nFRDEDeikMnsKd1oiBeN+9dOEINR9C0x+2CsC0i+71UL5JI1SIUDQtlKEcSO?=
 =?us-ascii?Q?rILLFg8HNmBG9Jp9RixfRl+EckTD81cB2g6g7d59qiqAMRGxB+wIbjfEf4EZ?=
 =?us-ascii?Q?pvpHsBL1PQJgK3Cg8/J5NXu5zvIgq34rfWfVQwd0VKjnk2Yj/LczKAzvvn76?=
 =?us-ascii?Q?TmPt5/dBwpPeYLieoeQPgxmu+q/f2QvKqr4uJYwp6MYVd6xLGUfKH6jf+cBN?=
 =?us-ascii?Q?wZmZHcEkUETHhl2MgQTJDN8rtLpc61G+sF+ufb2jSQy+LNhwAvE0lKGqPKM4?=
 =?us-ascii?Q?CaQLePLtW/q63iX/NYWNguL0hiAoIXbnvaBrl/TPFktVndp0mSqpN9B/SrDI?=
 =?us-ascii?Q?E+oxFl2Uk3SIUJvui5/6ynkICf57Ymn4vh5qUijaZRqFlyUz+r7Wpd+yLLcZ?=
 =?us-ascii?Q?k2Bb1VeWCZF5f2NLLCogLwqLwKfQej2OtKPicqrfhFdepBfUoG9i80uBDwzB?=
 =?us-ascii?Q?p0Di0kGRZIkqhtdcl/s9V5wpYeVNEVs008cU5udkPK+DGJIdHCC2QuXuf/V9?=
 =?us-ascii?Q?B5vZ2awRfqH3pahLDU90inPppdsCQ7Jt1Ki//otF1W/ev8OKoWRe1u3WtZXx?=
 =?us-ascii?Q?u8PMpVhK4dhyWMwOfBmV3K18lSCmWUH0qnO6NsVp8Qe0h+KAKN+cj8YJG1ec?=
 =?us-ascii?Q?jLOwX04ByCAFvEL6q2sskma6KuGlrEropoyHq/kHPbmzEK8nUa8e0s3TJzsH?=
 =?us-ascii?Q?pM+3paA+MWNRm5hh5GO9D+EeMqVQtyJkfpSctMEMGN1lX23RFlf62s+wRsJI?=
 =?us-ascii?Q?FXcXmBMcoTSjG9M=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:48.0579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fa5012-2f90-4ebc-8818-08dd3ca5391d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172
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

There has been a GSP_MSG_MAX_SIZE which represents the max size of a GSP
message element header. Use it instead of a magic number.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index dab0117d41fd..442a424d0fed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -796,7 +796,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 {
 	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
 	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
-	const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
+	const u32 max_msg_size = GSP_MSG_MAX_SIZE - sizeof(*cmd);
 	const u32 max_rpc_size = max_msg_size - sizeof(*rpc);
 	u32 rpc_size = rpc->length - sizeof(*rpc);
 	void *repv;
-- 
2.34.1

