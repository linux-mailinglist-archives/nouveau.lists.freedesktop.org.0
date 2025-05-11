Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E29CAB2B48
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F7C10E08B;
	Sun, 11 May 2025 21:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XTsLvCLB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD03C10E098
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNBK7AX5voztazCZ8i78bLCgj5Y1IbtqlOJxgEfdXUJS8v1sZnj5d08ww4xWuCvnQht6k9mX97Z/JQJBfqzWqh3CXtR6jP5I9bpSP9MKQd+4tlvx7KsgeLngA2cGhPdX+x/waV9Ajr1mdPUrBv2Td9a2ii6Ik8AVhe7iHlorXJ28nlq+he5wwPWEXZc4y0yx+bOpvy0VEQMI9a168A0NOt7ModyvuRxLpQmC2ETxJ31b2qlMSJPXZzIxllhf9zn+mEGRageoJ2SLzUqaWhpuyCcHxNdmHXLNXLK4R2eKBPWFRwqbxmsrwWk472N4V+dIr2o5jl3U1OjlMmK7pZj7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KoiuivbyNhTQFkwjhZgRsdOMDHaf3W1+cLPk5thxpQ=;
 b=jiUjPYe38TBRoGR3qFanuVX5JajgGH95/9D8UMPWlNvmC9cyppNNp00YIHpBFGeeQPcpXWFqmGACU6R7Ru6ULZQjkPwgN9BjnqegtZAUqmH3vqYvqc2GROVGXIN5DhjPFCsC1twkUWOmiVfbG1gpXioYvoZDNaG/mu7kKLQuY0Y0J9F3qwf8csMWTy/7hh34ojnjAjaOpiNp2w4WyIrD9zEMFHyCYdoCvNQNpKNgU5lP10iKKzn5IcsMP5bSevfmLFhmIsChy8bYnL6OYstnCiWfH6x8mBFOkzF0zfCh+EhNjeyAMMyKIbVhooWQb28VOuKAxDt8Qxd9/q/WbMbNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KoiuivbyNhTQFkwjhZgRsdOMDHaf3W1+cLPk5thxpQ=;
 b=XTsLvCLBok8GATG0oly4wqjlqR0YxRKDIzGHjfnvi8UVQ9DCyo9UrvDETE/4yiYOCMg8f+nMnOQGn0WtzpggDfc4CZB6cDZYJEtb0apablxXhocNuFJBViCEYzPMqX5wcUBwFSH8VTGypROf5q+6Gqr9vdYGKo4pv+BfqZsHWcpOo+CbcJO6qi6BDPYh/zglZxCyiKXDAWY+7pHSuMHTMj+/BFQNgF7fxoJBU+9YeypaVs0Eo7gfFTICm6CyQW3a4ac6M/rpvz4Ej8WUe2dymDW8TQwHpcWmiHV+4j6SbSgsuKL689bseHWjbtdHgAG9Dj9o5RJj7+pQuxY6mE5k+g==
Received: from DS0PR17CA0001.namprd17.prod.outlook.com (2603:10b6:8:191::19)
 by CY5PR12MB6432.namprd12.prod.outlook.com (2603:10b6:930:38::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Sun, 11 May
 2025 21:08:16 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::4e) by DS0PR17CA0001.outlook.office365.com
 (2603:10b6:8:191::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:07 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 04/62] drm/nouveau/ofa: bump max instances to 2
Date: Mon, 12 May 2025 07:06:24 +1000
Message-ID: <20250511210722.80350-5-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|CY5PR12MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ee8f5e7-f71b-4090-dd29-08dd90cff2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cq2hVRl4f/LpIJNTVufoLm+quQMbaVR3A0n6dj/Y7F7uwIW603RMdZqr8vZ5?=
 =?us-ascii?Q?vJUhs1850vzkEMFtQuz4NMXK1xARnw4sI2QtkMXuM/1AJqFQ7yn1pumOKaqZ?=
 =?us-ascii?Q?gNp7hS9c1cqj2IhTHhDh8ivoXQ/ORU2o86YPGC1enO2Y767GZFQ/gFLtD6jd?=
 =?us-ascii?Q?KRPOjSM4/P406fRUztBlWh0X8tmNJUGxoo31+HpCbdjG1RwYvDB3v9skFBSJ?=
 =?us-ascii?Q?09t3JdwHJFzEmTqyAAYfQVGpV/FNL7ZweDHEayEIqw2BawVed46OGyOOGe8H?=
 =?us-ascii?Q?4wZ4UxXx00jar1emORp8O0StaAIFvag3svFCtCEvBoiTq4CFr9tDi8APDVgG?=
 =?us-ascii?Q?QKNx/YRLnjvwFap748AC1kGdIyJvTQG93GXNdegYTaKyKZBlfZkj3XDJSOGB?=
 =?us-ascii?Q?7ZTKVO7xgjoVWzdDa07yS78En6XdjSSANbM/wnUGuTGIPu5LIcxFY4FGMIMR?=
 =?us-ascii?Q?WILPzegdGJn7iDb3TA3b3F9X9ug4EFFwn6Dee53sD4cO3i/c+Wavy2mdCnEg?=
 =?us-ascii?Q?a92Njl8rbzodOYlHjWKkxTaXvh39ny3ZRaU3wAGXC4NNuSlW991/Anan7mhj?=
 =?us-ascii?Q?SPzv752Gp9vCdBDPZP72luZZAm1/jS96B8g1ksfexJ1Cl7mi6Ot23fWbv9EM?=
 =?us-ascii?Q?QlHhj0kf/+0+QhBuBx+C3O4LFZr0XQjROZDykIWjSfgByoa0L8+FCReoqSy/?=
 =?us-ascii?Q?mCPpRh0AM8WBBFybUphBHzdORB0sVNHe/DT1mrMJm4JY4hWN2vqRD28A2k2m?=
 =?us-ascii?Q?9mCP3AsEVZM3gUfSSEvqEwbnx9GUGWdZWla0OBqMwuIjom0UCEgcPMwdIeBw?=
 =?us-ascii?Q?ktndGACj+9B+qIAbOGEvXd/OZqZvL3LB9b+LISZz1X+DtsjOVrKMjRBI9Zwn?=
 =?us-ascii?Q?lT4e7vTpyJQIN9YE+tvIQ86idfDvltPPnC0goPCFXQpMRij9tJ/SHdvjq0sS?=
 =?us-ascii?Q?CrkU48JpFHhLnpGZMQ3eTRHfsFzJfp+Lv0zpGtEUTVYIGTeNwqEyh/6rhEjL?=
 =?us-ascii?Q?4YhccAMEtah+gsKhG6kY7rZ8s8QIS3oWjwfgEO9P37AAc0jvh7RyEHUVRw/R?=
 =?us-ascii?Q?tbayYmArvL5eBXPfDehRrNl9QXnvCMibPRX1h9PspVVi3bH85q1ObkkLt0Em?=
 =?us-ascii?Q?yi3wxU8GkYSh41xXO5By3Ix9nxv9g6NP/l0kK1L8NR9YbSYjBtiGRPyFiQVU?=
 =?us-ascii?Q?kC8JCj1RGsjJgzWeKdGLcVTEAJo/4dBNA/CPqgU7J57Ei3SgRiMObus81VOh?=
 =?us-ascii?Q?TVsnaaUCqNhI+U6ri29JlwTwNr2Tu3SX60/zYGKX+xVIrmbeHbLjzBUxlhl6?=
 =?us-ascii?Q?M1xzWa45HT1rD+ZLpos2AAs2Kp3R/+N9u7VkLG2LJdFHZ+b9cJMXd4lRQlPv?=
 =?us-ascii?Q?j41Lq+feRWpM9vAb/1s8zgVjif4X9M7231qH0oqCrmtA//QpUVab01L38Krn?=
 =?us-ascii?Q?K+93udiQVq1I7GC/qwesdpFM2TttZVwY1c61HWjJXXt+n6E99tQ6TCpWFbXw?=
 =?us-ascii?Q?NRz813G+Jhk21hw73TisSSg78bamvU3qtL5s?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:16.0321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ee8f5e7-f71b-4090-dd29-08dd90cff2bf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6432
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

560.28.03 supports more NVENC instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 33e3bc519b9b..2debef27bd95 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -45,7 +45,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 4)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
-NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
+NVKM_LAYOUT_INST(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa, 2)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC2    , struct nvkm_sec2    ,     sec2)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SW      , struct nvkm_sw      ,       sw)
-- 
2.49.0

