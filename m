Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6149ABA6FB
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7A910E0ED;
	Sat, 17 May 2025 00:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MuU2XiB5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A810E101
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIFceTPcrLOUH85IDCQW39sQz4F6ghRKa8DlZ8MBbW3BSuKl9/udK8TpmSKYfg/PYynGDlcd76scnnQ6rtiJTEsQDWYDtC3jP2EjVbuNLHQvB8wY3I6FeW1byN6oqWe2voEfpLOGeCMgj1XOU8iOtqeMjo0jhX2obmCAyIA/d9AgpQLtckG5EwEzWe5L5bsO4Fp/bOH/feygUDGLO8Q6np5/mj0d20OLZhbK91jW0/yttCeRnpDeg6yEKalfLqdCHZWtokLK893CEDk1zhJLQwZDrkQNpe5G09FYy3B2CLxEioflRIJ0NLy5L9l2yzjaZflSZQ2+Tsew1rBvMsDERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1epugEAI3b8Y1JiOUOXEXGMeAoy6+p7jK/7HONH0ZY=;
 b=emmu1IUxHMe4t+pa4iT8tpZ5uy12sdLQ1/59pQZXkuk+FtmcT7IuN2VkFd183s7W1BTPVfRVa4U8aSsRU34FVNYN+LkK2koq7arMpqJ5X0ffXyCNPUlmevwJGTLRf//b6hUiQpVUNSKr57J4JIvn9MG8HJRTzpv4oZ4amkvitGHDO3CkJ1hhs39qS/4028riz5RN1efPiktyD/RIhwTcUbOQ9Z5rd5vG8fuSSmd4lYVYbjC9OvB43DZV3MrljTYwjjMOUJ7gx7Ga/gXVFB3aSHcNQ3cpU3epooJCKZ8tdyselLV/jvE7XSU93AlZ5S6YvCcsYp9KF19rZdxWEZJGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1epugEAI3b8Y1JiOUOXEXGMeAoy6+p7jK/7HONH0ZY=;
 b=MuU2XiB5fLxVs9TsipKPHrvSxeqRLwKnEaRxcgaI5qHp5iLcL/brh+1H0U/tbs19JPlDFbmKSJfriuYI06wQKHCbWOLqxlLCPrsqZG7d+ZDitObZlM7UnuZ8KM4lD4IhDh4zdnoTvOOBeS/C5szwFqPMzodByUOU5XAbNYk4xnQdedIrRtCnj5EZHhNAZcmSZT4gBvles77dRw0hdpNvpaCGfZzxIOOg4aq0IR+JW5KYeSctL1zjXnaAnQWq57lBSUuoZ/l/7uJLLExA/vTzn2ChywyHq7+nLRNzFko889H2ps85Pfg1y3gduJF/pIYY0M4WIohAqmnT5uRuQ9uNHQ==
Received: from PH7PR10CA0011.namprd10.prod.outlook.com (2603:10b6:510:23d::12)
 by CY3PR12MB9555.namprd12.prod.outlook.com (2603:10b6:930:10a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:10:27 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::5a) by PH7PR10CA0011.outlook.office365.com
 (2603:10b6:510:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:10:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:12 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 03/62] drm/nouveau/ce: bump max instances to 20
Date: Sat, 17 May 2025 10:08:55 +1000
Message-ID: <20250517000954.35691-4-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|CY3PR12MB9555:EE_
X-MS-Office365-Filtering-Correlation-Id: efd4e49f-0f58-4b4e-2aca-08dd94d739d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W4scECcRVgxgHzF4WJUZRtATE22mv2oan3IHo5BhuPlWsMRZpp5K/o9m8PzB?=
 =?us-ascii?Q?sqG0BwQM6FT/vIuaTqIBw/1hI8RKOnlAeNNjS2YgWXrglJpFXl+rxgacH5M1?=
 =?us-ascii?Q?dzTtGtMAgSnuZqDOPOy4uNEL2OgPW8qWCmXdEQhl4dGT7RICBdOTY6Go+Hjn?=
 =?us-ascii?Q?CC8fp2k4+lqKKQP49jGoMUhofg48k80DFERA3HcXilu2CZkn+pUJmM/PtMj5?=
 =?us-ascii?Q?75UuaGSmcxbI30wyGuaKIQu2VDtP7z+OwCgYpvktwVCMD6R9tYn6gb2GJjsd?=
 =?us-ascii?Q?ck2TOnXW3aksy6VfVhyJu5H0UWC5bkQY8lPNHSGwNVwnqesaRxfFd4Xk2RHZ?=
 =?us-ascii?Q?3NXRbHGzSV/rKgM0TlhAlH8TrjwLdsp59pF1ggi+E0VJ2jnzu8l5hY4MeTpU?=
 =?us-ascii?Q?aEh5Jz3WMdy5v5CizYlTgkZpjmPCUMsCaRZ/xgRW0i4gm6hoEUymF1ZXu7Ug?=
 =?us-ascii?Q?Xf71W4458HMHqg10sLT4EcFPu39o4CmcRF6GesaPzeRxzrNee+Oyptpsjq/h?=
 =?us-ascii?Q?8iLgMLxlWLuee7PMGnHpUYm+IYkuyCesg8lDQDFQ1bTYVWCmDYJBzHyKc0Og?=
 =?us-ascii?Q?tOTjdqNkV/9G6fYsLLQKjps551c1T93yHCA3SOWerrtlyi1XHBje/DxvW1jC?=
 =?us-ascii?Q?SNt8W2qekPnw6JGxlljj3daPUwH/yoK4CpQJPL37v99PpqWKvxb+VvcmzZ5f?=
 =?us-ascii?Q?ADg1JHS71MNnmOfHjzqgxslNaU2xoJKno52i4O4Z4gafENpqoDskOVuCEUFg?=
 =?us-ascii?Q?o8Z+JkfshOD4afre8vyHQEA133LvdPEnjR9PiGVvPdUCbpr4/rA6ahgNPXRZ?=
 =?us-ascii?Q?91b9OGNITf30KMuk1Q92jQx/kJNLPEpA1KNNNk+Pn9V+ojf9wjcBubDqSjXm?=
 =?us-ascii?Q?UDlBxtCqww1J60rleuqXecMBgb/S59GmsBiOES1BVEy8EC68Md6j/vfUEIrw?=
 =?us-ascii?Q?ucUz57Q9cd0SJEnlYTBPsKGYf4dB1jWG6cGPvFzca+CtUSuySJA9vDfI4rvq?=
 =?us-ascii?Q?Q1wCgiKN52Bcshl+DPNFoE4cpbUjOLdjh2UFkyXB6VB37pMVt0EfuFTclUR8?=
 =?us-ascii?Q?HXRLmfVy3el76RdddZ5PdicihmfKKgRZCIBy6cWoZ2wXRCgBTIFaU9Jsn0vR?=
 =?us-ascii?Q?pJoidNhYljCdKkfWYqZRJH8sJSdjTdkx2173nghdYpMI8urPFXzAdeLiVznl?=
 =?us-ascii?Q?orH3H+offCe5HsMWQbDSzhC8vJRK5AgxkZw9IyOuzNmoRkMPk7j7iWYWQsg7?=
 =?us-ascii?Q?J/K8eISMngHM2TKIA9ydF7Mxq5TDmhby+AOZsw5AXeF0+ymOIrEye+XW+VZV?=
 =?us-ascii?Q?ZVVCbIRJJ2DqPd+kSed8Wg6RgEzd/DYIayIJaDFChoQ1P0+TdsI4zGM/iPhi?=
 =?us-ascii?Q?+h/w8+ORCVwITueyywIQM3R1jBD1BeKZKajJm82A+oE8AksJccMCqCNyvqHP?=
 =?us-ascii?Q?xFEt+MZaMCaiuKC5FFo12Px8DgmYXeZWkGsTEVMHZS12QAEcL34z2gJm1PwM?=
 =?us-ascii?Q?d1TSiNny6Eu/+HZFTFCMoWA7CNmRlc+QQgnf?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:26.4787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd4e49f-0f58-4b4e-2aca-08dd94d739d9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9555
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

560.28.03 supports more copy engine instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 9d2a1abf64f9..4e027c5b00c3 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -29,7 +29,7 @@ NVKM_LAYOUT_INST(NVKM_SUBDEV_IOCTRL  , struct nvkm_subdev  ,   ioctrl, 3)
 NVKM_LAYOUT_ONCE(NVKM_SUBDEV_FLA     , struct nvkm_subdev  ,      fla)
 
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_BSP     , struct nvkm_engine  ,      bsp)
-NVKM_LAYOUT_INST(NVKM_ENGINE_CE      , struct nvkm_engine  ,       ce, 10)
+NVKM_LAYOUT_INST(NVKM_ENGINE_CE      , struct nvkm_engine  ,       ce, 20)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_CIPHER  , struct nvkm_engine  ,   cipher)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_DISP    , struct nvkm_disp    ,     disp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_DMAOBJ  , struct nvkm_dma     ,      dma)
-- 
2.49.0

