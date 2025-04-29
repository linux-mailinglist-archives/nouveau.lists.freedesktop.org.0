Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 326D4AA3C6D
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DF810E519;
	Tue, 29 Apr 2025 23:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DxK81O78";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D30710E522
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXlsSBPBvOnAOLkEiQLyGBCkCmAzN5S37ZJeaReZbNqcZOWhgIqjpA0LQ5SCJUF84A4IWgq4EPvz4IXxt7Fy8KXr56Tm0hL20v3bgwv1hSjGAXELyXXPMpiMukBR6IDOp9L/bqzyCvmuh04uLc3BMxO9LAYRt6exYM+W7RppW5RqOAaix1UZeSa+K09uU0ImPl6o2siauKrctsZTycZC8l2o5x74gKv9rMfjeMi1T1JWVwbHhP1zs2QphY98MIFVz2tN3P2yh2rX9HDEBRvzoVXsH1b9v+Iht3OlkfEugRIiCYP86hjbFbdl8lfrH69VYDFC7u031K0CxDi4rsFvBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqubUf5vD+rbcbAsCgHxOmAwdawtGgVoZ5//rqXay+A=;
 b=ViuoT4zkvuOUtstre5c8paHYlZw7yB/38mUk4LKCK7ieHgkqPcfs4DhMNRlla/4rftoRQKwppmf5ystpK11q0wGhVNXqjW1woPR0Oe8PmC2uRhf7CU6ASP5rgE7IpLsRlErOsxczlXnVdcDlWVqaxyZO8Wopl6YMouexFvNgdpyvjlaymjXxMYN0bb03BA1nBdi7+EQjE0FuYPup5C2iKV1mBHXz9xkidXXRnEthzV1QO/V2gVJ+xi81H6UxtSFSbzim+h4CUtcvn/nhBvsQBCpFoZ8yT2ueuHQIUHKsWeQ8vuV/a8HeV/13gbFlOpxwoA2nhw/Jx27qLC17ivHYRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqubUf5vD+rbcbAsCgHxOmAwdawtGgVoZ5//rqXay+A=;
 b=DxK81O78eUwksssUJPTMKZwmbItb0lVy6TABG+c8zK+ZRYZ7pvavG/V2NlonFYCpert6QOj40dPl7E6b8S3bLtTB9bHkjE6Ck7g81BhkPy//FsyZdaqt1RqVPAg/CRXwKJ1Kyq+4ZsdKmdyX4Wc61CY6UFG4o/wHwxetbJWLSrI/YQawb4DNlYrnY80RmqynsbU3cqBwUFLeePddirR/Hq8Ohlqro71ayFHgMYZhR5JWAynP8wjm1DuyNq7kpP0+RjYCsOaiCFo+0dSN+a9l4I5DrFGdJ/1s1osvUtqojSqs2rvJm6jFIgtP4L4O+uY3xIYZpIaexoT4IXnireRyYg==
Received: from BY5PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:1e0::26)
 by IA1PR12MB7688.namprd12.prod.outlook.com (2603:10b6:208:420::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 23:39:58 +0000
Received: from MWH0EPF000A6730.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::af) by BY5PR03CA0016.outlook.office365.com
 (2603:10b6:a03:1e0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:39:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6730.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:39:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:43 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:42 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 03/60] drm/nouveau/nvenc: bump max instances to 4
Date: Wed, 30 Apr 2025 09:38:31 +1000
Message-ID: <20250429233929.24363-4-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6730:EE_|IA1PR12MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e77956-f085-4926-4df2-08dd877726fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gfKm9aJndyJcO+WXGAXlU/7eRK/M0odNZUfek8XCARHvwBVSDZVZlWT0YU4J?=
 =?us-ascii?Q?4WftySPyqSSQM6CiurgIVQTCOSpteduFdmk2ZyaL/WRbaqDP42usXbIn1I/v?=
 =?us-ascii?Q?5zB1iDAO+1l8SWYW9rFHGvufm4JZhC8+z0SwOiG8Hh1o4SHJ0kjR4O6NPr3g?=
 =?us-ascii?Q?jcQ0tKFHrDr1ayXIdhwRAcOYpKKh0mgYjg2PlGbwCTs1/AJj1hJFORfILWe5?=
 =?us-ascii?Q?mgZJTK1HmYbLT3zA1keueq1lFrNFXa6u6T4gaSzdYDEWslg2nMl5UXz4l8Mh?=
 =?us-ascii?Q?+Dr6KrkdEnyW4mfZ+vHBglzZYzgcNVwgmsuXJldVZWtp0CmGoaIbDjZFoaeH?=
 =?us-ascii?Q?IoM0kNL3446ukm5lYS5vj2EgBw+uG4RQuLTboNDiLoWtWjwDciNEioM5fcqb?=
 =?us-ascii?Q?QarIiP1Vmly52fBS1Y/+Vk97mtgQTaBaZiA6kF8tOiokdOB7cc1WrCCPWK+y?=
 =?us-ascii?Q?3DOI89k0qOcin5hTVSP22F+saBffqhygw6CKl0kWXI3iSKRDo2Kxv+AUIM+u?=
 =?us-ascii?Q?hJpIxNrk7okxHGapGwKpHIkl2wDYWc3XOLinEmQsot4+lP8r5tZUWkpJSaiK?=
 =?us-ascii?Q?3gmsXRJN4z4Ie86xELrTs+fHFsbacICofM23aSVGCj0NivHEU/IMUu0vAggS?=
 =?us-ascii?Q?2j67kFpf9qSY2UlFelXhUPRBCqCZEKryi76UrUe8/MsLl8xclNEY2GZN7qGD?=
 =?us-ascii?Q?4H2X720QGxCREPqBV7wLKj+YQop3Xy5Ni0543CAO8s2tkuZ1sGtaHwD1mWbg?=
 =?us-ascii?Q?EH2CY+ue8CtsitwrOMcSjQZ3KBX+doP/Pqnq/F6rugC1mEkcE2wgvXUTYs9p?=
 =?us-ascii?Q?K96huj1aSejKNKoiAxBrjikk1CRR/Afynx7F7ZSxOw/8QvLKHjq9VMcgLx0/?=
 =?us-ascii?Q?AfFdTSe3ZM28g6WUwCJEJBs15cOsMWhv2j4FlSjGjPY5CkwGkQzM8wnEyNhM?=
 =?us-ascii?Q?+dn0/p8vW0nH8nDrTr8C7ub/z4F92jC/+ziD/ylWK/n5pqNzcFgXJr/fNv6j?=
 =?us-ascii?Q?ICukolULLWoPbxGZ2tQ138zbypB/8UABM7VMS+9745SS7Q2gxA/5j5MBla+S?=
 =?us-ascii?Q?MAA8AbmrXRqcFIHB2Pkd1CekoG26S6MUX81XfejfdG+FjNTd7+b6RvaeMmnK?=
 =?us-ascii?Q?8UjhJx6jSBp55hnkQjghOtx+SynaPWVC8QnmB0Ta71qBPu6P7/LEBelVTwjb?=
 =?us-ascii?Q?3Ax2xI/r1+wL49o9fwogTMnuvkwkHEsrSN5YCP8xM37Yrs8IviAmf76mmqY8?=
 =?us-ascii?Q?MLRcbnE7AVt56p1QTil7aUm4uyY2jbBATmwWAQEncE7Ee8jo0yTCwAtDzAWw?=
 =?us-ascii?Q?l45X8APPVH77mxeDV83xFQTZXdeZBHm6tqwja88/RbfD/fwh2s6XMsi5JEj0?=
 =?us-ascii?Q?M+47jF5rEw9x7+8XGsVmt6Qbj/dkZ/Sq2WpxbU97Rm73qqWfl1FKLE94TQwE?=
 =?us-ascii?Q?rL1k5Jn4AAjG11ynJB9QJNtNJOPoimC6QzZzu5vJom5nOrIF2hBfa8CxZFSR?=
 =?us-ascii?Q?H0EDYT1hM2KZJmW/o8VIrp1vlTlE7ru2BSGY?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:39:58.0090 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e77956-f085-4926-4df2-08dd877726fc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6730.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7688
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

570.86.16 supports more NVENC instances.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 4e027c5b00c3..33e3bc519b9b 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -43,7 +43,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPDEC  , struct nvkm_engine  ,   mspdec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPPP   , struct nvkm_engine  ,    msppp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
-NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 3)
+NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 4)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
-- 
2.49.0

