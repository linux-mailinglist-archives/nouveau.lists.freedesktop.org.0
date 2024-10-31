Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221209B76D7
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7474110E850;
	Thu, 31 Oct 2024 08:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lZKu8XAI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E346410E84D
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdxDslBqp1jFVUXrK3iAsqznuBbh5R18PeKpvubJoonrE8TLEGBZx+SIKPBPDLk6+y3e4tvbYwNkW7KeBsyFwZyoCg5fmvX+w1rQPGCl4kJ5NjS2COHFWKOR3lRklKWL9CEdaNU3+2JE684ajtPrCHT1v5hdqhZnd3eHrV9u3Kdy1ZubasyP1MCat4RlvkHwer1V6wIxOmxH9ISDuAqp7L3FxW460XbCIkaSCOP8Nf1JZHMqSYhqJpOXqrV1umyVxLudsFCCXn7XvrpJBvewBJtiBzPn7yUXQPKm/dKEqMpX03t0ykpvwc4wSnCh7UvXHFHYITqR5WxsBexnjWa7mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxu31D+oABYlL8wSkT5nvTZFlVZQu/uKYRpWhiNh3TI=;
 b=CPTJraXKFa/hX7dL2ra7mJYXaikCKtcwt2sQJ5EPWs+RA3561ML7vZVpNJ6oTxvNtXNl7BaGv88E7SCJUejFeg+5XKu8UDA2re2WZhU0JaEm9b2Ia61bHPZ7XM44IJ3MzJYUKdV5GkoEHA4mMR0QI9HeogzqbDQwfLhy9Yq8v9uRYwwS2UnCAquogUSmLJ/YoTNLofVvECgNmIjtrDMdJdF0dltTS7aFR4HVso2s0iX1zlx4X2fSl9X0Na3yUfo8MBYJOPGT7OwR2EoO/2xcpeiuHBgs28MgV4ENdD0ITYYS85T6GvVG85hz6hCRppKwZ6xgkrU4LhDfrjA2ZjQH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxu31D+oABYlL8wSkT5nvTZFlVZQu/uKYRpWhiNh3TI=;
 b=lZKu8XAIc/xkj10xjH43w5Eb/rykQIGYFsWYCv4jia2UMlOL9gcrJGAljBJIGcC9fUzfu/cWkc4ciHTyRE0e/5YBYqAuW89OhpDFy0kFttMH2UULn5LK3R92U1BsjfLkUL4zXEZSiwqiVjV7jZPZ2xIlR9vcTuiUH/iGZiTenX4S1dCRJOMyFJTOXNSXhR64YWe7AfDa3hhIWKyNCYiHRIBpf7csOBylHe1PTPCJ48aaqI3jJ+I5cc0sDRHoq6T8dNqXM1PFsMRufxd8zq6JyypsNBe8PiJnIT9ABfwENE8pXnHXzOhyLLoNP1cq21QXvvFHtkKcURscNyV6AfuOVA==
Received: from MW4PR04CA0087.namprd04.prod.outlook.com (2603:10b6:303:6b::32)
 by CY8PR12MB7265.namprd12.prod.outlook.com (2603:10b6:930:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 08:53:37 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::bf) by MW4PR04CA0087.outlook.office365.com
 (2603:10b6:303:6b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:12 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:11 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:11 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 08/15] nvkm: remove the magic number in r535_gsp_rpc_push()
Date: Thu, 31 Oct 2024 01:52:43 -0700
Message-ID: <20241031085250.2941482-9-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|CY8PR12MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: f7782ef1-07a3-4eba-7ced-08dcf9898292
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ow9RnRPqxQ01z+vp+9LiZwaxvHGXsgnadONhXSzdQJ3AwdfxObaOMq4U0F3x?=
 =?us-ascii?Q?cddBvOgvzFSAbpew2Wdd6T8z+zzWAaRvQ/xpdQjIoRuhOicDRuGRmwG7kfK1?=
 =?us-ascii?Q?yBq+4ZGkm9QJ6P9WKVuak06RUw7r3Y4khT9sJ3/YQXIXCjpIqrAeIFOs8Kte?=
 =?us-ascii?Q?KV9JH8JxxlsLUvmuW3kJ4ZyyYszE5G5FgJoeCItN2dJ9uGDUWLfGvWG3f9NC?=
 =?us-ascii?Q?iI2Rn8BpHVlnMfLvVq3iOBxMDAnkik4ObHVwKG4/pJfNfj1mo7MlGEq++q9E?=
 =?us-ascii?Q?PWn2NYzr3Ykuifwu39snj6hH+qMUEImZwfoDTG1hcjlVFVBAHHWsYoDufpqQ?=
 =?us-ascii?Q?UHmGCLklKQE6SDhIQPiDgMfuspxI55UhRze4KbOszz1cwYOXyMnl3e7E4d4F?=
 =?us-ascii?Q?bTdC8qb91OkhmkUi3hPbvwBVJRj2uqlxvna1JRLxgi9HqO+RkTaY+aaLkH3Q?=
 =?us-ascii?Q?QpI32vdcpGloBgZ3cn/+CIgVkl1+l4xVUgMEdLbGDVcSXI9mv6dEuj28pdNQ?=
 =?us-ascii?Q?3PPb1JTjoXZyt1DMnR7/CY+8KXGswm862V2rsuYJRDt91HDsdL6hD2tWTBYG?=
 =?us-ascii?Q?rZcPtxkNyeL2DMZlY4EvvEgWs1lp55fOw1hRV8vtzxt1G4Q37nFXt+oj2AY1?=
 =?us-ascii?Q?CnDlSfh5oG8rcsfOqPjkpJzNmpeUzCddcRCSuWY5E+VpRQD1P5fdbEhBJgKb?=
 =?us-ascii?Q?paUU90gt27DMWyEpuWRlMHkt8GTzvb1fsoEFVmibIMdfi8Dv/aYpYR+bOMvi?=
 =?us-ascii?Q?+oaf1uSre6PgDGwQ/AyLlwgBVNGjXjDxKLVlgbRI38sCWJrJht1BcU6xl4Fn?=
 =?us-ascii?Q?3dZULW+tEguhlIQ+SM6Qic1kD/4zHoLrR0e68m7nCpaM3JAnR8SZMgtab9wc?=
 =?us-ascii?Q?rIGxaq58IHcOapauB+r3ZZ6zLqwky85/s8NCWfFtUM2Mm1F7BwxKXIghQkAl?=
 =?us-ascii?Q?OoBFBeEYLPOyrWYEa/AIETSFuLKs6zv4A5V/Edr3FrJVUI3b3azed5LwHVWa?=
 =?us-ascii?Q?TWBvnC/zr9ziQv1DqQv2eDGO/Y3HavI/duSmMzhdU93Ot9uDiZOh6NBJM2wL?=
 =?us-ascii?Q?zQ2iVvYE7ebHkzGf1u/yN59/wxXbKZcUqeRoS/6anljudkGUNiyyySp42FZw?=
 =?us-ascii?Q?e2d+klRgGIc6gO6mAv0tYCN1wLx/pOqIRC7ZdL2uJ+rTmfXMJN1Fxe1f3jyE?=
 =?us-ascii?Q?tCpR45MSaoYogBPgpXacTkqJVjWzDr+NNs6lB9o0Hh0Z+z50HOmqzZTdtdeA?=
 =?us-ascii?Q?Mfwh0uI+x+Fu0+R+rZ5RniF2avz9M01MxcpCJ+I+eB8gv55i0399b1eiMn+8?=
 =?us-ascii?Q?B58U2IE1HtDgfqi2yJefExHV4GMEcQ9XZzEUU/mbUX7p8cCvoqXXPMF9ilfT?=
 =?us-ascii?Q?m/U3WbTTbBj7YSODEsuFyWwqxqtmtTqhNcfWIELwvzwo/ujhGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:37.5304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7782ef1-07a3-4eba-7ced-08dcf9898292
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7265
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
index 8d7b884f5adb..5bc56a9ba3f8 100644
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

