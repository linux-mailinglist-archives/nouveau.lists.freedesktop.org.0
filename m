Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439F9BCEB75
	for <lists+nouveau@lfdr.de>; Sat, 11 Oct 2025 00:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F287710E108;
	Fri, 10 Oct 2025 22:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uTCrrhGM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B21710E108
 for <nouveau@lists.freedesktop.org>; Fri, 10 Oct 2025 22:41:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmRPfURfex4UvjL7iFh50b2fiv5FaLGkV+9ADLgCcjk4anCrlWpyT8yYGWlCJfhujTRFjUtL5IDl4sC5XKAfLbsg0b8jNc7wmkoX8z/KhC+Q/J7IoYcEa803jdhFjm7HmX2t9ls8jSpFIBVbtbk6o2Q30hniYMgvRgHaQHvc/Yg7c8sVUEC2xzjsO9ZpUgbB1is+HAenZ1DIdA2OqxFfbVwEEcNNFv3tT6KXXiLxJv6XU+ZvXu5CQmp9zQvqSingT+M9woDWELQ/Hdux06IiAPIYxftdaJnOurudNuh4shSAZxTX0t0CthMNLVdhm6dgNhp5TVgJTgwYwmF7MnxL8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKmPht1ZPnoZXcXq8g2uUZZOkX9STASECjQeaxlr4JQ=;
 b=hN13U5yKH+LI5SVNv7ZVTSOauNAm/BLj5v+K8Z0H0FZLx4t0lvMPJbu0wmj8+0MzzKVJTHwvmqZTj0tkFa9kk8Whf3kThNXiwQhfwFtxTadijDpNHCYB6+i8C7kl9/cdkaEI2DvBPBBrzfUN9LkTEhtbLpeMQVDzA/9Cppvk+85C/672hJzes87Dg3lSrY6+OxMBZt+L5AoUTel4nAFNNd6ehHiht4K5hLrIMpK7SI6cC87bMileJOqCRVqAxDe2Q2zlIEe2uPf7R6SBpCteTXYGMOk2cPP4lIOoia7C7TXuVqg/rNv/Y+Fx92p/CiOqZayy3w0EPutmlWaPj6vTnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKmPht1ZPnoZXcXq8g2uUZZOkX9STASECjQeaxlr4JQ=;
 b=uTCrrhGMzCEeUI1KRiYkRH1SsqeU/f+aLue7unUAdPXh/zHOaUSU3lTpmOu4XIYfxiULz5x4eeGwGnjFS3pBx1tOObiCdGdJJRW82kmuI+8Bp5+vzOZoSgwpG9ROlUBMzyKIYPWoj73DHZiiqe+wZrh6aLdAwCXAfoellrADsBGna0MEbvGe30sMR1dH7tJoF/iYqxmXljfHYucwFnCCxFHN0TF5Jhg1DdlYk7bh3oNn5VuYt7/vSr/25Hp9lW8ZTv0N4fZwRym6SLuPZKAZ+4swuU/QiOC63KVY8igQj3xnnxheBwJXcPQcp4rFNi1dm6uw2EtZD/oa5w1tIdYdzw==
Received: from BN9PR03CA0692.namprd03.prod.outlook.com (2603:10b6:408:ef::7)
 by SJ2PR12MB9087.namprd12.prod.outlook.com (2603:10b6:a03:562::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 22:41:27 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::dd) by BN9PR03CA0692.outlook.office365.com
 (2603:10b6:408:ef::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 22:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 10 Oct 2025 22:41:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 10 Oct
 2025 15:41:08 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 15:41:08 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: fully define nvfw_hs_load_header_v2
Date: Fri, 10 Oct 2025 17:39:57 -0500
Message-ID: <20251010223957.1078525-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|SJ2PR12MB9087:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca80db6-a82d-47c5-2db1-08de084e25e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DJ01NEzZngTuA3738rF843b52v5rdwfeuSjie8YO3Nsq/jdhsjJraCMfI1uE?=
 =?us-ascii?Q?46KJi+hoCYiHymKAM59zcgI2EgZcs8cZf+OW++H02QyRizdrofwruw88RiC5?=
 =?us-ascii?Q?ABW2wNsU75gW2BvWxoJVIq+WRIDZ02Ic4HxE7XRqv/nU4K/nrLHCqyNxTfMU?=
 =?us-ascii?Q?Jki1e0m10V6OXRJwEq1ceEHEHtmvKEFpz66kGiRaj4tdWWgzmdkE+9XJNfY4?=
 =?us-ascii?Q?nqECFU4IEWRVFvurm2Pm9ncMx9dJHGpMcBpx9ryTj9cK9RK4Vet/finC0Dj3?=
 =?us-ascii?Q?ioE829aWDBhjJtpBzzPf/rL1OmkMLkbMXfkTy8GuhwyCfphLPZsxfnnzdV63?=
 =?us-ascii?Q?ecpL2uhtViaVbPYJD5UHY1qctyZjQZgFxUt/NTZLf6LXQKGzXgTRbwxTr77V?=
 =?us-ascii?Q?+e4QzHIS+ZV2eXXYHADBKggkTanax63i94weZEug+HEJk34OET86miyjZ24g?=
 =?us-ascii?Q?rO3F8OW0hMokzywSqr47FVTGgQRoFlN5eJuaFH4XGeZCWzp+O4709KvOPyza?=
 =?us-ascii?Q?FuCZXO2e6UXvQPI1CmHOxaN4is025qddPTqGy7O+LjvCbdGQvD/XkMDKeNHF?=
 =?us-ascii?Q?nT/hzSRIElyyhqjSj2HHOuHxqSY0QzWV3xHdbnWRzir3e6a2uYDnD0fBj3hr?=
 =?us-ascii?Q?21NSwDzxrh+Htzu5Z95YDfQwV+tSVYWb9P7C0M2CSJRg3wuRi7EOKe1cW1wJ?=
 =?us-ascii?Q?jdZM0Kj8hBJKiGGQgs/BNIYwue7Ph6ZGuLc3qj30uYcdkXQeSsj+RnJ4/6Fb?=
 =?us-ascii?Q?ygZDAjEPfOAAsru2/TXIPDlad8PrFuRnGcBWbP5O5Ab0cH/NTfJ5Hz7N8o77?=
 =?us-ascii?Q?Qn7vpnCZc89qJ9oO/ZelsP4Gsz+bs6huS3t2eYGwN6fzTZrW5tYAr2AvEHzT?=
 =?us-ascii?Q?9IANl5DbmwCHrZY+hqn4bmbWu6G0VhciXTNExbNCv8Nq0AVJhhL7GcvGBwlQ?=
 =?us-ascii?Q?loeWOnra+LWp8Y47OFuk6wpHBRmSXp05hhWL9L6euobGmtSQOnsMNvodW3u6?=
 =?us-ascii?Q?qtpM8F18fvH/BaIvb0vDUY9gXr+oGpQYdy1W0PsrYlKLRpPFjhZ7yI/ALeML?=
 =?us-ascii?Q?m/vckxMqRV2Y5xgRctKjsSL+oOIGvb5H+y9cEnDv517W7fT/XwIHKi0pchf6?=
 =?us-ascii?Q?vp7XiPSfp3m9el2PRhmhI2LbF+WqfyqlS6DMAugOoXxagH+Mvh/4ocGODrt6?=
 =?us-ascii?Q?T17Qdlux/7kLwFFPaSK6MyX4xxaf5Ucr2CVuZOeDLYGYBNnsHmVeVesuCZix?=
 =?us-ascii?Q?NylOuIlbOTzvbUyhFr0G4s/Jqr7+NObdg/tlS5yfKNwY2HQ3Fw13r2ffVRcZ?=
 =?us-ascii?Q?TJ5/fHgKVU580TbMz04wfGuZGr8JZ4sl8B9n8OW2xwSTVz3sfETTpnd04KpI?=
 =?us-ascii?Q?XKJDoKe/4eAQWgmTc6k6SrFj/jdD4AK4K4HEJLfuWpSVWOXJkR7jZNV2jdLy?=
 =?us-ascii?Q?cr9waOPy8eUwBF9d2TfvG+2j+ayJl8W5U5vjddszhfvlTIG6+07JTEAOgh5+?=
 =?us-ascii?Q?Onent4JKpVV+iBsuIzouhZTBmQfCBFEoiRFIwxYihG1NicLrsAWu/4nIRqSE?=
 =?us-ascii?Q?Qt3eEeIWWHSmVZh/AwM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 22:41:26.7573 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca80db6-a82d-47c5-2db1-08de084e25e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9087
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

Add the missing fields of the nvfw_hs_load_header_v2 struct, so that the
struct matches the actual contents of the firmware images.

nvfw_hs_load_header_v2 is a struct that defines a header for some firmware
images used by Nouveau.  The current structure definition is incomplete;
it omits the last two fields because they are unused.

To maintain consistency between Nouveau, OpenRM, and Nova, and to
make it easier to support possible future images, we should fully define
the struct.  Also add a __counted_by tag for the flex array.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvfw/hs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
index 8b58b668fc0c..c78ab11ec3ac 100644
--- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
+++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
@@ -52,7 +52,9 @@ struct nvfw_hs_load_header_v2 {
 	struct {
 		u32 offset;
 		u32 size;
-	} app[];
+		u32 data_offset;
+		u32 data_size;
+	} app[] __counted_by(num_apps);
 };
 
 const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
-- 
2.51.0

