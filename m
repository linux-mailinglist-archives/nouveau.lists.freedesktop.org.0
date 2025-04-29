Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FA6AA3C78
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD8210E558;
	Tue, 29 Apr 2025 23:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rt9TUCUD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752E810E557
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7VziIr8qGBmuIUdYbMP4Y6WxU5YfcZG2hlJXyiu0d/A68y1NKIckeYjwyLnjsVxYw2d2IfxuqxB+3B/8Rbh6Q51cYLVgOBtrbiU4sLozygKyJxSgw7VXTHdHzWFfYAIwMI6HwoVOnExZLAZYzl90xMIP5Op3PxtwGuc0j8ns6X/NxyrJrMja8gjQ3dtU+i4UBG9gt/ZCX/mpXT8fL0HtrxI+QK4wkf/+E1pPcELhOAIfjx718xA6xelbMdFE+vx8FyI9CLXlygTo4gn6Eg2iG88mBzvL3Y/O8rkAu2YELeOFgtopfGbmMw4eqLOQQSN/q6mvYknj8TXa7ZiUJ3xWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JG32/BDoXcvu+6y+xu8H/yKZoJMfLbhBE1RL9/IeV4=;
 b=xVv+zAbihlIYNg05vCK393lUGc5/3GnROXNhSHJNiXCfBgTrhLZQw9DF4+M43V5RhPOVX49mDx9uvPiLlNWwxcw2bXZZmdRl+FSXb+lMSDuAXKD/Vu/ZBddslAxsXOiZepGMLaw3OZQkB5+w/HsQ1QLMJQomH4HtGBYvSHaPge87NQNZIWnFXFlPKTJq46wLe7BWrtT8dEzFT5EOD6PplV9d2fj0r7/sMq3iOWFOAU1v9QT+anCfvbmUXYwE8aEyKQ72IZAnz4XqYKlK2pJX+qXeh8BR+JQ3eXHz8dWjxw88GDFCAfbnIS4mleHkmR3yz70fheOLWJEoXY3LlVL6WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JG32/BDoXcvu+6y+xu8H/yKZoJMfLbhBE1RL9/IeV4=;
 b=rt9TUCUDfKc5OzXU0/rWIpFuG9vdaK7prmNVE9X2GmIsVNMpwS+AvV7Jffi69Y8knlqlpLPIczQG0UOIaA/O8wBeyFcvOsN2DDv+NnqImpU+Yhw7miBcHVObkvnTZxt0spEZboqDm14NBoctOjJO9LYlOfy6fCSc13TdW7fJzOqa2BpWcXAuL8p9NYDANiK5p8661zJa/uvbUHPchzw4hkg8zpyUHyJ8mtl8kCGP8EaVnYh7GKGQ+t8LXmNnAY63nGYn0Vaq2IpAYFO/eA2k9JEdwQk57bUnzvNZw9PJjSBST/7cUjtFavEjA1UFpgpHcdKBce94p5pdD3NMkrBwug==
Received: from MW3PR06CA0022.namprd06.prod.outlook.com (2603:10b6:303:2a::27)
 by CY3PR12MB9701.namprd12.prod.outlook.com (2603:10b6:930:103::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:05 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::20) by MW3PR06CA0022.outlook.office365.com
 (2603:10b6:303:2a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:52 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:51 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 11/60] drm/nouveau/gsp: move booter handling to GPU-specific
 code
Date: Wed, 30 Apr 2025 09:38:39 +1000
Message-ID: <20250429233929.24363-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|CY3PR12MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: a87dde1f-30c0-4698-6b21-08dd87772af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vh5JkcRMLT/MjiSVy/HtaEydVjfyLaT12SovnoQ4MipXUzjTrgQxQOwXGe1v?=
 =?us-ascii?Q?tPMMQf8V9cqpG5+sUl55lOsG5mtoTN4HZk6qFoeRdPzhbfXYFMRJZ+OlYxr9?=
 =?us-ascii?Q?OBa0J6vnBhT2UNzR4Ayfxs0c4s3uR3NhyVH2K8CWmI1nlSb7ZtA3tv4ITFKV?=
 =?us-ascii?Q?1SVdTENu6C5PhBQCVUZDoaOCfOVxPL6URoui5is5bq1q7fn90mppUZENY6sV?=
 =?us-ascii?Q?587iPqA8foSdqQLoKvOKlHHu9UKABE2k3u/XAOtIo3he3galaV1224rStP3W?=
 =?us-ascii?Q?n4rphu2bNiDFeV4XYvy4ypcZ59zySI/hpvcNn+qgfyK1uF5PHx/EFfMVIaoR?=
 =?us-ascii?Q?2O+hFp1m99M8bFdBYydYOWHGkzujVVde8qmAt6qzjElsROOoyBvvL11pLe4p?=
 =?us-ascii?Q?55tzUNhf7Cj7ruDCGqe4zO8mR3d6G7A4fYO8i5Gv5R8yEpfpsHweic7AT41J?=
 =?us-ascii?Q?5h7AvVvI+liL5jpvRVJxYpdgGRl3cMkE12c2/E0aXqnriVSx4St1QU1Wy8u6?=
 =?us-ascii?Q?AC23W11QJY1AYYA8/7yq7FgW4kRNOpEvipW8mp3la+MnQ7GWuPrEwqOIba0e?=
 =?us-ascii?Q?2V2RgY9uCiYMSGJAmzQwefQKYazBVcN8Fjr/y2T/27WofdPJp74wbhBB7qub?=
 =?us-ascii?Q?qDwBKmK0NbAxR5bGYxUz8W+Ofa2KE9vTkQ13lDDbcmrGfgwFbUWAtxvBe6cZ?=
 =?us-ascii?Q?JPxyW5T/lPlFipExTicDy3Pq49qc+knlRj+qeegzypSsy6JB/T1rycRJvx5I?=
 =?us-ascii?Q?Eub0SvfjLoBsn66MISL1GM9T93a1cEagloovz+TazA7BuAnNz/YentP0j0LA?=
 =?us-ascii?Q?jHvoq6L8xOsaPuPNiw1WRZj1evPYdz/DB0ndhUy32ouua1OVlTvSCj+7Z2h4?=
 =?us-ascii?Q?nUR6wLBnE1n5kR6Pb6DnWhlKVfXwQAuGeElHDVsoSrbXbdcuCSNsSs70Fw2q?=
 =?us-ascii?Q?mw9aQjBHJZaUfgG0+em8N5MW9HSuohniWW5LVakxGb0WnzZnU2ilpOKQ3Eax?=
 =?us-ascii?Q?O905vFiSdrNhWOtt4J/ISfq0aCG2fpktHBLZTRhitgdrDLg+gdBCYi9k6deu?=
 =?us-ascii?Q?Z/pTwNuEvW5SVM9bZx/jedSl0hInKtCY8Di9mgMw7olXv7O/kXbMXZOFw8IY?=
 =?us-ascii?Q?ucNO5pr8aH7vmeSDAbQTGXXY6rBnOqs+X/o3BhqMfaaLZF1Zstkj9ZheICPG?=
 =?us-ascii?Q?+D+09ohpcLh4zjj271UDkFGeWO5x8rtx0kSPyzAj7tmiYiE1VVsySHAxS86W?=
 =?us-ascii?Q?3q5ipmpBdvWddy/vHAHevcz8sraSCew5nfS0/UvHN7ebh5UB8WrHuyQjg6EF?=
 =?us-ascii?Q?T/7ouLwIIs/k129nTpWY0tlvjaqHtjlmMxFVjUpvh6bVBEsLOXMrJ3yjKMcU?=
 =?us-ascii?Q?eUkasjdtH5fAwYyaINTnR3i9ivojy6xeQiUqMYnREY6tW1Zfd7YxSECTGsEk?=
 =?us-ascii?Q?BcxUu17J5jA3+t0ZP6CS/oDjN5W/HxlSWDbFv7zg7V6ca3pUyABrD/4gTWxK?=
 =?us-ascii?Q?wNA/vJlcYQx3P/CJlaBQr/9+f/QsV0J43f2y?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:04.6987 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a87dde1f-30c0-4698-6b21-08dd87772af3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9701
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

GH100/GBxxx have significant changes to the GSP-RM boot process.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |   3 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  94 +--------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 113 +++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |   4 +-
 8 files changed, 125 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 221ea0fd8a51..ea2821e7a54e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -36,8 +36,8 @@ ad102_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index fe1cef1b6324..78f2a15f0d42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -52,7 +52,7 @@ nvkm_gsp_fini(struct nvkm_subdev *subdev, bool suspend)
 {
 	struct nvkm_gsp *gsp = nvkm_gsp(subdev);
 
-	if (!gsp->func->fini)
+	if (!gsp->func->fini || !gsp->running)
 		return 0;
 
 	return gsp->func->fini(gsp, suspend);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index c3be72d3390a..d9cdec4810b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -52,8 +52,8 @@ ga100_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index d7385d3989f1..7b8db70f3cb3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -164,8 +164,8 @@ ga102_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 601dd5d503bb..e6f0e865848a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -59,6 +59,8 @@ extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
 int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
 			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
 int tu102_gsp_oneinit(struct nvkm_gsp *);
+int tu102_gsp_init(struct nvkm_gsp *);
+int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
 int tu102_gsp_reset(struct nvkm_gsp *);
 
 extern const struct nvkm_falcon_func ga102_gsp_flcn;
@@ -72,6 +74,7 @@ int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
 extern const struct nvkm_gsp_rm r535_gsp_rm;
+int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 45e3fcbabe4f..ff5ab2635003 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1145,48 +1145,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
-static int
-r535_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
-{
-	struct nvkm_subdev *subdev = &gsp->subdev;
-	struct nvkm_device *device = subdev->device;
-	u32 wpr2_hi;
-	int ret;
-
-	wpr2_hi = nvkm_rd32(device, 0x1fa828);
-	if (!wpr2_hi) {
-		nvkm_debug(subdev, "WPR2 not set - skipping booter unload\n");
-		return 0;
-	}
-
-	ret = nvkm_falcon_fw_boot(&gsp->booter.unload, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
-	if (WARN_ON(ret))
-		return ret;
-
-	wpr2_hi = nvkm_rd32(device, 0x1fa828);
-	if (WARN_ON(wpr2_hi))
-		return -EIO;
-
-	return 0;
-}
-
-static int
-r535_gsp_booter_load(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
-{
-	int ret;
-
-	ret = nvkm_falcon_fw_boot(&gsp->booter.load, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
-	if (ret)
-		return ret;
-
-	nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
-
-	if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
-		return -EIO;
-
-	return 0;
-}
-
 static int
 r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 {
@@ -1287,7 +1245,7 @@ r535_gsp_shared_init(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-static int
+int
 r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 {
 	GSP_ARGUMENTS_CACHED *args;
@@ -1816,12 +1774,8 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
-	u32 mbox0 = 0xff, mbox1 = 0xff;
 	int ret;
 
-	if (!gsp->running)
-		return 0;
-
 	if (suspend) {
 		GspFwWprMeta *meta = gsp->wpr_meta.data;
 		u64 len = meta->gspFwWprEnd - meta->gspFwWprStart;
@@ -1844,9 +1798,6 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		sr->revision = GSP_FW_SR_META_REVISION;
 		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.lvl0.addr;
 		sr->sizeOfSuspendResumeData = len;
-
-		mbox0 = lower_32_bits(gsp->sr.meta.addr);
-		mbox1 = upper_32_bits(gsp->sr.meta.addr);
 	}
 
 	ret = r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
@@ -1858,14 +1809,6 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 			break;
 	);
 
-	nvkm_falcon_reset(&gsp->falcon);
-
-	ret = nvkm_gsp_fwsec_sb(gsp);
-	WARN_ON(ret);
-
-	ret = r535_gsp_booter_unload(gsp, mbox0, mbox1);
-	WARN_ON(ret);
-
 	gsp->running = false;
 	return 0;
 }
@@ -1873,23 +1816,12 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 int
 r535_gsp_init(struct nvkm_gsp *gsp)
 {
-	u32 mbox0, mbox1;
 	int ret;
 
-	if (!gsp->sr.meta.data) {
-		mbox0 = lower_32_bits(gsp->wpr_meta.addr);
-		mbox1 = upper_32_bits(gsp->wpr_meta.addr);
-	} else {
-		r535_gsp_rmargs_init(gsp, true);
-
-		mbox0 = lower_32_bits(gsp->sr.meta.addr);
-		mbox1 = upper_32_bits(gsp->sr.meta.addr);
-	}
+	nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
 
-	/* Execute booter to handle (eventually...) booting GSP-RM. */
-	ret = r535_gsp_booter_load(gsp, mbox0, mbox1);
-	if (WARN_ON(ret))
-		goto done;
+	if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
+		return -EIO;
 
 	ret = r535_gsp_rpc_poll(gsp, NV_VGPU_MSG_EVENT_GSP_INIT_DONE);
 	if (ret)
@@ -2220,16 +2152,6 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	mutex_init(&gsp->cmdq.mutex);
 	mutex_init(&gsp->msgq.mutex);
 
-	ret = gsp->func->booter.ctor(gsp, "booter-load", gsp->fws.booter.load,
-				     &device->sec2->falcon, &gsp->booter.load);
-	if (ret)
-		return ret;
-
-	ret = gsp->func->booter.ctor(gsp, "booter-unload", gsp->fws.booter.unload,
-				     &device->sec2->falcon, &gsp->booter.unload);
-	if (ret)
-		return ret;
-
 	/* Load GSP firmware from ELF image into DMA-accessible memory. */
 	ret = r535_gsp_elf_section(gsp, ".fwimage", &data, &size);
 	if (ret)
@@ -2324,14 +2246,6 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (WARN_ON(ret))
 		return ret;
 
-	/* Reset GSP into RISC-V mode. */
-	ret = gsp->func->reset(gsp);
-	if (WARN_ON(ret))
-		return ret;
-
-	nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
-	nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
-
 	mutex_init(&gsp->client_id.mutex);
 	idr_init(&gsp->client_id.idr);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index e7396344cfdf..451d3e588d26 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -22,11 +22,43 @@
 #include "priv.h"
 
 #include <subdev/fb.h>
+#include <engine/sec2.h>
 
 #include <nvfw/flcn.h>
 #include <nvfw/fw.h>
 #include <nvfw/hs.h>
 
+static int
+tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 wpr2_hi;
+	int ret;
+
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	if (!wpr2_hi) {
+		nvkm_debug(subdev, "WPR2 not set - skipping booter unload\n");
+		return 0;
+	}
+
+	ret = nvkm_falcon_fw_boot(&gsp->booter.unload, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
+	if (WARN_ON(ret))
+		return ret;
+
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	if (WARN_ON(wpr2_hi))
+		return -EIO;
+
+	return 0;
+}
+
+static int
+tu102_gsp_booter_load(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
+{
+	return nvkm_falcon_fw_boot(&gsp->booter.load, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
+}
+
 int
 tu102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmware *blob,
 		      struct nvkm_falcon *falcon, struct nvkm_falcon_fw *fw)
@@ -114,6 +146,55 @@ tu102_gsp_reset(struct nvkm_gsp *gsp)
 	return gsp->falcon.func->reset_eng(&gsp->falcon);
 }
 
+int
+tu102_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+{
+	u32 mbox0 = 0xff, mbox1 = 0xff;
+	int ret;
+
+	ret = r535_gsp_fini(gsp, suspend);
+	if (ret && suspend)
+		return ret;
+
+	nvkm_falcon_reset(&gsp->falcon);
+
+	ret = nvkm_gsp_fwsec_sb(gsp);
+	WARN_ON(ret);
+
+	if (suspend) {
+		mbox0 = lower_32_bits(gsp->sr.meta.addr);
+		mbox1 = upper_32_bits(gsp->sr.meta.addr);
+	}
+
+	ret = tu102_gsp_booter_unload(gsp, mbox0, mbox1);
+	WARN_ON(ret);
+	return 0;
+}
+
+int
+tu102_gsp_init(struct nvkm_gsp *gsp)
+{
+	u32 mbox0, mbox1;
+	int ret;
+
+	if (!gsp->sr.meta.data) {
+		mbox0 = lower_32_bits(gsp->wpr_meta.addr);
+		mbox1 = upper_32_bits(gsp->wpr_meta.addr);
+	} else {
+		r535_gsp_rmargs_init(gsp, true);
+
+		mbox0 = lower_32_bits(gsp->sr.meta.addr);
+		mbox1 = upper_32_bits(gsp->sr.meta.addr);
+	}
+
+	/* Execute booter to handle (eventually...) booting GSP-RM. */
+	ret = tu102_gsp_booter_load(gsp, mbox0, mbox1);
+	if (WARN_ON(ret))
+		return ret;
+
+	return r535_gsp_init(gsp);
+}
+
 static u64
 tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
 {
@@ -136,14 +217,38 @@ tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
 int
 tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 {
-	gsp->fb.size = nvkm_fb_vidmem_size(gsp->subdev.device);
+	struct nvkm_device *device = gsp->subdev.device;
+	int ret;
+
+	gsp->fb.size = nvkm_fb_vidmem_size(device);
 
 	gsp->fb.bios.vga_workspace.addr = tu102_gsp_vga_workspace_addr(gsp, gsp->fb.size);
 	gsp->fb.bios.vga_workspace.size = gsp->fb.size - gsp->fb.bios.vga_workspace.addr;
 	gsp->fb.bios.addr = gsp->fb.bios.vga_workspace.addr;
 	gsp->fb.bios.size = gsp->fb.bios.vga_workspace.size;
 
-	return r535_gsp_oneinit(gsp);
+	ret = gsp->func->booter.ctor(gsp, "booter-load", gsp->fws.booter.load,
+				     &device->sec2->falcon, &gsp->booter.load);
+	if (ret)
+		return ret;
+
+	ret = gsp->func->booter.ctor(gsp, "booter-unload", gsp->fws.booter.unload,
+				     &device->sec2->falcon, &gsp->booter.unload);
+	if (ret)
+		return ret;
+
+	ret = r535_gsp_oneinit(gsp);
+	if (ret)
+		return ret;
+
+	/* Reset GSP into RISC-V mode. */
+	ret = gsp->func->reset(gsp);
+	if (ret)
+		return ret;
+
+	nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
+	nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
+	return 0;
 }
 
 const struct nvkm_falcon_func
@@ -176,8 +281,8 @@ tu102_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index a8c9480b8024..1bc806a18010 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -35,8 +35,8 @@ tu116_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
-- 
2.49.0

