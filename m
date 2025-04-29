Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25046AA9EAE
	for <lists+nouveau@lfdr.de>; Tue,  6 May 2025 00:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBD810E337;
	Mon,  5 May 2025 22:01:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gclKn85T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3137310E5B8
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:41:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GktdfbAubUK/RKmLTnfSZnWmM7bZDTSLeNX6LzvdCyxq6356VpqwwNfcx5m28Js+vjWsyBQCpFFOQ5BsJvAAXZiMRTFr12xhpT8DKoPTo3QNEQhWjzztM5WxqoCPI04HnGMinselm+ZnX9ySIKPew4gYziXoLzttf/9DbQo5YkuIwS99pXUBXp8oXpCeq5LoPIr+KrbTc0Mt9QA3OGnKA+zo1FNCjIXmRi36e/jiwpyzWIVs7K4atpf9FHF9H4xZfAN3xpEtpmVDjAlBDO2fF4VA57zKf6DGd80Ug4mpfB62/lbkgwzV6Wk1Jom38b5T4cHA+HG1jBnacCOB4+5JEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkHbpuIqz3qAl+ioK0jqB1z5HxllwXM1ohTislZjYUM=;
 b=Eqg8Dy4vrHXPDzb/xE+0UzQy0MIKZkBiZOjIeC1q5FTdJ63HZ6Vl9BqbSRLLBwtqzPTvxLg0boqYCmuPJ5VpiV3/tbntRzts9nJyVJBLKkYHMqQ0qIFC000vLYc/Cn62wq/wMksiG1CI0O4TTnZmb7uQmuo3BQYOiMFjzjQRnfzNVzilQtJhRqcG4oDUAgYuuDIJVp7lxOFEpPcUcm7gYeI4yQF4vPHhLN1DikUrGBOW3FZ6jWvVtnU8vmX4Umo+NuwC9GdZILds9rRM71U/Rz73GGKBdTCnDjcr00bLG0tWO+9uW5DhI8ZkD+9VS5Nl5kOKz6g79TuxS+DS4UHMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkHbpuIqz3qAl+ioK0jqB1z5HxllwXM1ohTislZjYUM=;
 b=gclKn85TLD/67W1zSVz9LdZG2ZcgZUxE7SIGyJykIagJ84z/WvX1kEgnTITHJK9wfFgnjFokhDvk5dUiqkdNU2trLiiu4YBTXvMKIKFY8h6IAXc2m27wHx0hBnVFH7yDR3ri121qPl5o5UxaV7DbTVXZInVfBh/GGUkKSayGVWqvxU4LYibMmn3zU8KqPI1lTavt4QuWbGK2SRLvJHMbyr8LfMvvEyTku9nwAa/hTYHyKzIa6WyasZTQYEJul+dIVVka6ljaMSnbFPqlrCfqskC6H6h8XrBHoaTyFVLT1obA2nrBMXjsBjvzk5t5F2R6wFBc9LmeTa747J9jj9ZXPw==
Received: from SJ0PR13CA0210.namprd13.prod.outlook.com (2603:10b6:a03:2c3::35)
 by DS0PR12MB9448.namprd12.prod.outlook.com (2603:10b6:8:1bb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 23:40:52 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::7c) by SJ0PR13CA0210.outlook.office365.com
 (2603:10b6:a03:2c3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.13 via Frontend Transport; Tue,
 29 Apr 2025 23:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:33 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 44/60] drm/nouveau/gsp: add support for 570.144
Date: Wed, 30 Apr 2025 09:39:12 +1000
Message-ID: <20250429233929.24363-45-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|DS0PR12MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: 73334f38-6b6f-4503-f7a8-08dd8777468f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pawEdNjTlWR4K5z/tXZbDs+64VO2gyedcNsGUKxx/ZFVk4GkSVyqo58xDrV/?=
 =?us-ascii?Q?fFlBNjDMEJ6r4ym1VOXmwBeXiTWIb1QwKwxB/oBaCiwnpl9WVhKPE3FOHbX6?=
 =?us-ascii?Q?Jv5PDgP4quU5yKgCgSXSFc0RpYSEZbDY/hXmc1+fmK+HG9GuMAEXkHsbr07K?=
 =?us-ascii?Q?dTLu/WNjPZblHxgkmSteYplcVoF+oKwBEQladCFkkPdAYxkZEoAlq5KpTxlx?=
 =?us-ascii?Q?Vn+PgtR3ZuXMfJ7mH+qinzyvB80NmBolCbBJ1Jfn5wM7mb+V4pVW2ORyTZBB?=
 =?us-ascii?Q?GkkruD2rdFqDRB9RjI4a6n1LEg6LNaOgShlyXr7jamNM8kj0ifGsPKglWaLH?=
 =?us-ascii?Q?abSdGQbwu/JygfOVCkbJYQbd4lFQVNiM3ybt8mAkxgFOyVmIkdabL8mELp3Y?=
 =?us-ascii?Q?GegrMF4X/zy9d6uolTI6DpLe7Po0HJpln3tT3X5YY/XdScHFy36FWYqkNIgE?=
 =?us-ascii?Q?itJluShsR6jKAMLhhc0CLVUSQw2Xe8fzRJDFAsYSrExvyuBGnaIyGj4o+dvb?=
 =?us-ascii?Q?aJljEwbmgtI3OYpYN8qSTOHOTSahnbMSZMTLNTKYQybyPDaBhUcstrFbAtrk?=
 =?us-ascii?Q?MkrQca0MU8rs214dS3ofRzskI6jcVfzPkI2YhIDrcJCuupCxoS1ZuskFYfsS?=
 =?us-ascii?Q?MdfT8r7p2ZsPvBPkAcyyVBGl/vg3k/nSGlUvwmjluBBJoiH6mJrKUCOwXK1w?=
 =?us-ascii?Q?6i+lXb2vZ21tLHAHljycuo9PFBzR5XSg5NKYZtK+ZS0057VPUhd7APIoaM09?=
 =?us-ascii?Q?b3wGlOtdIMykTAHJjmBHebMmmajGODjK6TdkOmt+iW0l8irfG5N3XJwazgEV?=
 =?us-ascii?Q?xCAJ7vRIzcrAuc9nSrDgBEkkJ7RhJ4kyqvpVtiKCoqEJJxzFzXRbfwY2oiZl?=
 =?us-ascii?Q?fmp5lSgFVvA9N7vBM44p+lHyonk1cq6sfkWV+J+J+gMNMLVEL41asRq4MmLs?=
 =?us-ascii?Q?vElVHTYlfoTY3p//8lfCp3BYEJeKNfqDdMipy6L/E9w8ZYvFawXNfWltjaPr?=
 =?us-ascii?Q?IOVAtE/p0bCyNTlCOkfkGft+oNxHtAGgRxscaFNfOipkO7gnEJDbc8Ja+0v5?=
 =?us-ascii?Q?CVUp5g/NTc23HrEFotPj9WreNKKJl6tEiklKB1L5WFBVCBhMakpJPdo7RxMs?=
 =?us-ascii?Q?2lHi6hUWPXRRgu7lCc3Tcb00LOpktldBFPm7A19c2tNk4K4ssAVSoKdxaXON?=
 =?us-ascii?Q?t9QoEbfmX7lZvuHTDS8psMtcrUNlY9/g1ovWNoCjm+Vc/Vyl9tZdxMSENU2W?=
 =?us-ascii?Q?q7IF5bw/+ji7xg8NEbAITEarzdQHBasobAlBpzs0MmmkFhlMOJkaLU0jjNOP?=
 =?us-ascii?Q?rGBHDL8i91IuzGoE9JtXKQl62UVIppINmjsPzq4JIt98ffmZYRqOxFgV0zTA?=
 =?us-ascii?Q?nOGTly5qBaqqpopalamedBQhTGDWkZa50tZsLn11DgZf8GkhRGPohOawgvqU?=
 =?us-ascii?Q?7Gq9DNC6sC4qWRxtpZf4x9gF49CQUFX22blMbH1a1EiIqzWf3KO3f/sXqngL?=
 =?us-ascii?Q?+GZNsVwJtT7kkAOEMZVjTu7JxRvXvv6FDIeY?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:50.9817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73334f38-6b6f-4503-f7a8-08dd8777468f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9448
X-Mailman-Approved-At: Mon, 05 May 2025 22:01:53 +0000
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

Add r570-specific HAL routines, and support loading of GSP-RM version
570.144 if firmware is available.

There should be no impact on r535, or non-GSP paths.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |   7 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |   7 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h   |   4 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c |   8 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/client.c  |   2 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    |  16 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |   2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |   2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  10 +-
 .../nouveau/nvkm/subdev/gsp/rm/r570/Kbuild    |   8 +
 .../nouveau/nvkm/subdev/gsp/rm/r570/disp.c    | 280 +++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 166 +++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/fifo.c    | 234 +++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c  |  88 +++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c | 223 +++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/disp.h       | 355 +++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/engine.h     | 318 ++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h       |  19 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/fifo.h       | 213 +++++++
 .../nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h |  69 +++
 .../nvkm/subdev/gsp/rm/r570/nvrm/gsp.h        | 576 ++++++++++++++++++
 .../nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h      |  57 ++
 .../nvkm/subdev/gsp/rm/r570/nvrm/ofa.h        |  17 +
 .../nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h      | 249 ++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c |  45 ++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c  |  68 +++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  28 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   |   5 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |   4 +
 33 files changed, 3070 insertions(+), 17 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fifo.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ofa.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 8f53460444e4..7f74176b698f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -411,7 +411,7 @@ nvkm_gsp_rm_free(struct nvkm_gsp_object *object)
 static inline int
 nvkm_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
 {
-	if (WARN_ON(!gsp->rm))
+	if (WARN_ON(!gsp->rm || !gsp->rm->api->client))
 		return -ENOSYS;
 
 	return gsp->rm->api->client->ctor(gsp, client);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 8ab02d683c90..eb765da0876e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -41,6 +41,7 @@ ad102_gsp = {
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
+	{ 1, tu102_gsp_load, &ad102_gsp, &r570_rm_ga102, "570.144", true },
 	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01", true },
 	{}
 };
@@ -57,3 +58,9 @@ NVKM_GSP_FIRMWARE_BOOTER(ad103, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad104, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad106, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ad107, 535.113.01);
+
+NVKM_GSP_FIRMWARE_BOOTER(ad102, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ad103, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ad104, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ad106, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ad107, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index be6bbf06d58b..3a452349afde 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -142,6 +142,8 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 	gsp->func = fwif->func;
 
 	if (fwif->rm) {
+		nvkm_info(&gsp->subdev, "RM version: %s\n", fwif->ver);
+
 		gsp->rm = kzalloc(sizeof(*gsp->rm), GFP_KERNEL);
 		if (!gsp->rm)
 			return -ENOMEM;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index a6836a85b2ac..d201e8697226 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -58,6 +58,7 @@ ga100_gsp = {
 
 static struct nvkm_gsp_fwif
 ga100_gsps[] = {
+	{  1, tu102_gsp_load, &ga100_gsp, &r570_rm_tu102, "570.144" },
 	{  0, tu102_gsp_load, &ga100_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
@@ -71,3 +72,4 @@ ga100_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 }
 
 NVKM_GSP_FIRMWARE_BOOTER(ga100, 535.113.01);
+NVKM_GSP_FIRMWARE_BOOTER(ga100, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 202b5bdc3980..917f7e2f6c46 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -174,6 +174,7 @@ ga102_gsp = {
 
 static struct nvkm_gsp_fwif
 ga102_gsps[] = {
+	{  1, tu102_gsp_load, &ga102_gsp_r535, &r570_rm_ga102, "570.144" },
 	{  0, tu102_gsp_load, &ga102_gsp_r535, &r535_rm_ga102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &ga102_gsp },
 	{}
@@ -191,3 +192,9 @@ NVKM_GSP_FIRMWARE_BOOTER(ga103, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga104, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga106, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(ga107, 535.113.01);
+
+NVKM_GSP_FIRMWARE_BOOTER(ga102, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ga103, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ga104, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ga106, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(ga107, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index e5d5f8880d31..83a5e994cd91 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -12,3 +12,4 @@ nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
 nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
 
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
+include $(src)/nvkm/subdev/gsp/rm/r570/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
index c6d82dc94e05..081f540ba0ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gr.h
@@ -35,4 +35,8 @@ struct r535_gr_chan {
 	struct nvkm_memory *mem[R515_GR_MAX_CTXBUFS];
 	struct nvkm_vma    *vma[R515_GR_MAX_CTXBUFS];
 };
+
+struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO;
+void r535_gr_get_ctxbuf_info(struct r535_gr *, int i,
+			     struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index f72e2a7ac6bc..b8fb8150ae48 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -33,6 +33,14 @@
 static void
 r535_bar_flush(struct nvkm_bar *bar)
 {
+	/* Use NV_PFLUSH in resume path - needed on R570 to flush writes before
+	 * BAR2 page tables have been restored.
+	 */
+	if (unlikely(!bar->bar2)) {
+		g84_bar_flush(bar);
+		return;
+	}
+
 	ioread32_native(bar->flushBAR2);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
index c0146c00584d..578c6b726feb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
@@ -23,7 +23,7 @@
 
 #include "nvrm/client.h"
 
-static void
+void
 r535_gsp_client_dtor(struct nvkm_gsp_client *client)
 {
 	struct nvkm_gsp *gsp = client->gsp;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 0e436c4fb4e0..1976d0030d17 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -48,9 +48,9 @@ struct fbsr {
 	u64 sys_offset;
 };
 
-static int
-fbsr_memlist(struct nvkm_gsp_device *device, u32 handle, enum nvkm_memory_target aper,
-	     u64 phys, u64 size, struct sg_table *sgt, struct nvkm_gsp_object *object)
+int
+r535_fbsr_memlist(struct nvkm_gsp_device *device, u32 handle, enum nvkm_memory_target aper,
+		  u64 phys, u64 size, struct sg_table *sgt, struct nvkm_gsp_object *object)
 {
 	struct nvkm_gsp_client *client = device->object.client;
 	struct nvkm_gsp *gsp = client->gsp;
@@ -117,8 +117,8 @@ fbsr_send(struct fbsr *fbsr, struct fbsr_item *item)
 	struct nvkm_gsp_object memlist;
 	int ret;
 
-	ret = fbsr_memlist(&fbsr->device, fbsr->hmemory, NVKM_MEM_TARGET_VRAM,
-			   item->addr, item->size, NULL, &memlist);
+	ret = r535_fbsr_memlist(&fbsr->device, fbsr->hmemory, NVKM_MEM_TARGET_VRAM,
+				item->addr, item->size, NULL, &memlist);
 	if (ret)
 		return ret;
 
@@ -155,8 +155,8 @@ fbsr_init(struct fbsr *fbsr, struct sg_table *sgt, u64 items_size)
 	struct nvkm_gsp_object memlist;
 	int ret;
 
-	ret = fbsr_memlist(&fbsr->device, fbsr->hmemory, NVKM_MEM_TARGET_HOST,
-			   0, fbsr->size, sgt, &memlist);
+	ret = r535_fbsr_memlist(&fbsr->device, fbsr->hmemory, NVKM_MEM_TARGET_HOST,
+				0, fbsr->size, sgt, &memlist);
 	if (ret)
 		return ret;
 
@@ -200,7 +200,7 @@ fbsr_inst(struct fbsr *fbsr, const char *type, struct nvkm_memory *memory)
 	return fbsr_vram(fbsr, type, nvkm_memory_addr(memory), nvkm_memory_size(memory));
 }
 
-static void
+void
 r535_fbsr_resume(struct nvkm_gsp *gsp)
 {
 	/* RM has restored VRAM contents already, so just need to free the sysmem buffer. */
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index a98e50f74c5c..608d8210299d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -454,7 +454,7 @@ r535_runl = {
 	.allow = r535_runl_allow,
 };
 
-static void
+void
 r535_fifo_rc_chid(struct nvkm_fifo *fifo, int chid)
 {
 	struct nvkm_chan *chan;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index c8ea05ea972c..d47733582453 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -170,7 +170,7 @@ r535_gr_units(struct nvkm_gr *gr)
 	return (gsp->gr.tpcs << 8) | gsp->gr.gpcs;
 }
 
-static void
+void
 r535_gr_get_ctxbuf_info(struct r535_gr *gr, int i,
 			struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO *info)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 57eee1c5ae88..2f2e9acd6a2a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -173,7 +173,7 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 	return ret;
 }
 
-static void
+void
 r535_gsp_get_static_info_fb(struct nvkm_gsp *gsp,
 			    const struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS *info)
 {
@@ -709,7 +709,7 @@ r535_gsp_rpc_set_registry(struct nvkm_gsp *gsp)
 }
 
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
-static void
+void
 r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DATA *caps)
 {
 	const guid_t NVOP_DSM_GUID =
@@ -743,7 +743,7 @@ r535_gsp_acpi_caps(acpi_handle handle, CAPS_METHOD_DATA *caps)
 	kfree(argv4.buffer.pointer);
 }
 
-static void
+void
 r535_gsp_acpi_jt(acpi_handle handle, JT_METHOD_DATA *jt)
 {
 	const guid_t JT_DSM_GUID =
@@ -835,7 +835,7 @@ r535_gsp_acpi_mux(acpi_handle handle, DOD_METHOD_DATA *dod, MUX_METHOD_DATA *mux
 	}
 }
 
-static void
+void
 r535_gsp_acpi_dod(acpi_handle handle, DOD_METHOD_DATA *dod)
 {
 	acpi_status status;
@@ -2147,6 +2147,8 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT, NULL, NULL);
 	if (rmapi->gsp->drop_send_user_shared_data)
 		rmapi->gsp->drop_send_user_shared_data(gsp);
+	if (rmapi->gsp->drop_post_nocat_record)
+		rmapi->gsp->drop_post_nocat_record(gsp);
 
 	ret = r535_gsp_rm_boot_ctor(gsp);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild
new file mode 100644
index 000000000000..c6b011a67445
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/Kbuild
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: MIT
+nvkm-y += nvkm/subdev/gsp/rm/r570/rm.o
+nvkm-y += nvkm/subdev/gsp/rm/r570/gsp.o
+nvkm-y += nvkm/subdev/gsp/rm/r570/fbsr.o
+nvkm-y += nvkm/subdev/gsp/rm/r570/disp.o
+nvkm-y += nvkm/subdev/gsp/rm/r570/fifo.o
+nvkm-y += nvkm/subdev/gsp/rm/r570/gr.o
+nvkm-y += nvkm/subdev/gsp/rm/r570/ofa.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
new file mode 100644
index 000000000000..58cda7bab512
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/disp.c
@@ -0,0 +1,280 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rm.h>
+
+#include <engine/disp.h>
+#include <engine/disp/outp.h>
+
+#include "nvhw/drf.h"
+
+#include "nvrm/disp.h"
+
+static int
+r570_dmac_alloc(struct nvkm_disp *disp, u32 oclass, int inst, u32 put_offset,
+		struct nvkm_gsp_object *dmac)
+{
+	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
+
+	args = nvkm_gsp_rm_alloc_get(&disp->rm.object, (oclass << 16) | inst, oclass,
+				     sizeof(*args), dmac);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->channelInstance = inst;
+	args->offset = put_offset;
+	args->subDeviceId = BIT(0);
+
+	return nvkm_gsp_rm_alloc_wr(dmac, args);
+}
+
+static int
+r570_disp_chan_set_pushbuf(struct nvkm_disp *disp, s32 oclass, int inst, struct nvkm_memory *memory)
+{
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
+	NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	if (memory) {
+		switch (nvkm_memory_target(memory)) {
+		case NVKM_MEM_TARGET_NCOH:
+			ctrl->addressSpace = ADDR_SYSMEM;
+			ctrl->cacheSnoop = 0;
+			ctrl->pbTargetAperture = PHYS_PCI;
+			break;
+		case NVKM_MEM_TARGET_HOST:
+			ctrl->addressSpace = ADDR_SYSMEM;
+			ctrl->cacheSnoop = 1;
+			ctrl->pbTargetAperture = PHYS_PCI_COHERENT;
+			break;
+		case NVKM_MEM_TARGET_VRAM:
+			ctrl->addressSpace = ADDR_FBMEM;
+			ctrl->pbTargetAperture = PHYS_NVM;
+			break;
+		default:
+			WARN_ON(1);
+			return -EINVAL;
+		}
+
+		ctrl->physicalAddr = nvkm_memory_addr(memory);
+		ctrl->limit = nvkm_memory_size(memory) - 1;
+	}
+
+	ctrl->hclass = oclass;
+	ctrl->channelInstance = inst;
+	ctrl->valid = ((oclass & 0xff) != 0x7a) ? 1 : 0;
+	ctrl->subDeviceId = BIT(0);
+
+	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+}
+
+static int
+r570_dp_set_indexed_link_rates(struct nvkm_outp *outp)
+{
+	NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS *ctrl;
+	struct nvkm_disp *disp = outp->disp;
+
+	if (WARN_ON(outp->dp.rates > ARRAY_SIZE(ctrl->linkRateTbl)))
+		return -EINVAL;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(outp->index);
+	for (int i = 0; i < outp->dp.rates; i++)
+		ctrl->linkRateTbl[outp->dp.rate[i].dpcd] = outp->dp.rate[i].rate * 10 / 200;
+
+	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
+}
+
+static int
+r570_dp_get_caps(struct nvkm_disp *disp, int *plink_bw, bool *pmst, bool *pwm)
+{
+	NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_GET_CAPS, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->sorIndex = ~0;
+
+	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+	if (ret) {
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+		return ret;
+	}
+
+	switch (NVVAL_GET(ctrl->maxLinkRate, NV0073_CTRL_CMD, DP_GET_CAPS, MAX_LINK_RATE)) {
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62:
+		*plink_bw = 0x06;
+		break;
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70:
+		*plink_bw = 0x0a;
+		break;
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40:
+		*plink_bw = 0x14;
+		break;
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10:
+		*plink_bw = 0x1e;
+		break;
+	default:
+		*plink_bw = 0x00;
+		break;
+	}
+
+	*pmst = ctrl->bIsMultistreamSupported;
+	*pwm = ctrl->bHasIncreasedWatermarkLimits;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
+static int
+r570_bl_ctrl(struct nvkm_disp *disp, unsigned display_id, bool set, int *pval)
+{
+	u32 cmd = set ? NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS :
+			NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS;
+	NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, cmd, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->displayId = BIT(display_id);
+	ctrl->brightness = *pval;
+	ctrl->brightnessType = NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_TYPE_PERCENT100;
+
+	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+	if (ret)
+		return ret;
+
+	*pval = ctrl->brightness;
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
+static int
+r570_disp_get_active(struct nvkm_disp *disp, unsigned head, u32 *displayid)
+{
+	NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->head = head;
+
+	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+	if (ret) {
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+		return ret;
+	}
+
+	*displayid = ctrl->displayId;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+static int
+r570_disp_get_connect_state(struct nvkm_disp *disp, unsigned display_id)
+{
+	NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->subDeviceInstance = 0;
+	ctrl->displayMask = BIT(display_id);
+
+	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+	if (ret == 0 && (ctrl->displayMask & BIT(display_id)))
+		ret = 1;
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
+
+static int
+r570_disp_get_supported(struct nvkm_disp *disp, unsigned long *pmask)
+{
+	NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&disp->rm.objcom,
+				   NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*pmask = ctrl->displayMask;
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
+static int
+r570_disp_get_static_info(struct nvkm_disp *disp)
+{
+	NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = disp->engine.subdev.device->gsp;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	disp->wndw.mask = ctrl->windowPresentMask;
+	disp->wndw.nr = fls(disp->wndw.mask);
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
+const struct nvkm_rm_api_disp
+r570_disp = {
+	.get_static_info = r570_disp_get_static_info,
+	.get_supported = r570_disp_get_supported,
+	.get_connect_state = r570_disp_get_connect_state,
+	.get_active = r570_disp_get_active,
+	.bl_ctrl = r570_bl_ctrl,
+	.dp = {
+		.get_caps = r570_dp_get_caps,
+		.set_indexed_link_rates = r570_dp_set_indexed_link_rates,
+	},
+	.chan = {
+		.set_pushbuf = r570_disp_chan_set_pushbuf,
+		.dmac_alloc = r570_dmac_alloc,
+	},
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
new file mode 100644
index 000000000000..655f8bb71758
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c
@@ -0,0 +1,166 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <subdev/instmem/priv.h>
+#include <subdev/bar.h>
+#include <subdev/gsp.h>
+#include <subdev/mmu/vmm.h>
+
+#include "nvrm/fbsr.h"
+#include "nvrm/fifo.h"
+
+static int
+r570_fbsr_suspend_channels(struct nvkm_gsp *gsp, bool suspend)
+{
+	NV2080_CTRL_CMD_INTERNAL_FIFO_TOGGLE_ACTIVE_CHANNEL_SCHEDULING_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_FIFO_TOGGLE_ACTIVE_CHANNEL_SCHEDULING,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->bDisableActiveChannels = suspend;
+
+	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+}
+
+static void
+r570_fbsr_resume(struct nvkm_gsp *gsp)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	struct nvkm_instmem *imem = device->imem;
+	struct nvkm_instobj *iobj;
+	struct nvkm_vmm *vmm;
+
+	/* Restore BAR2 page tables via BAR0 window, and re-enable BAR2. */
+	list_for_each_entry(iobj, &imem->boot, head) {
+		if (iobj->suspend)
+			nvkm_instobj_load(iobj);
+	}
+
+	device->bar->bar2 = true;
+
+	vmm = nvkm_bar_bar2_vmm(device);
+	vmm->func->flush(vmm, 0);
+
+	/* Restore remaining BAR2 allocations (including BAR1 page tables) via BAR2. */
+	list_for_each_entry(iobj, &imem->list, head) {
+		if (iobj->suspend)
+			nvkm_instobj_load(iobj);
+	}
+
+	vmm = nvkm_bar_bar1_vmm(device);
+	vmm->func->flush(vmm, 0);
+
+	/* Resume channel scheduling. */
+	r570_fbsr_suspend_channels(device->gsp, false);
+
+	/* Finish cleaning up. */
+	r535_fbsr_resume(gsp);
+}
+
+static int
+r570_fbsr_init(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size)
+{
+	NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS *ctrl;
+	struct nvkm_gsp_object memlist;
+	int ret;
+
+	ret = r535_fbsr_memlist(&gsp->internal.device, 0xcaf00003, NVKM_MEM_TARGET_HOST,
+				0, size, sgt, &memlist);
+	if (ret)
+		return ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_INTERNAL_FBSR_INIT, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->hClient = gsp->internal.client.object.handle;
+	ctrl->hSysMem = memlist.handle;
+	ctrl->sysmemAddrOfSuspendResumeData = gsp->sr.meta.addr;
+	ctrl->bEnteringGcoffState = 1;
+
+	ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
+	if (ret)
+		return ret;
+
+	nvkm_gsp_rm_free(&memlist);
+	return 0;
+}
+
+static int
+r570_fbsr_suspend(struct nvkm_gsp *gsp)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_instmem *imem = device->imem;
+	struct nvkm_instobj *iobj;
+	u64 size;
+	int ret;
+
+	/* Stop channel scheduling. */
+	r570_fbsr_suspend_channels(gsp, true);
+
+	/* Save BAR2 allocations to system memory. */
+	list_for_each_entry(iobj, &imem->list, head) {
+		if (iobj->preserve) {
+			ret = nvkm_instobj_save(iobj);
+			if (ret)
+				return ret;
+		}
+	}
+
+	list_for_each_entry(iobj, &imem->boot, head) {
+		ret = nvkm_instobj_save(iobj);
+		if (ret)
+			return ret;
+	}
+
+	/* Disable BAR2 access. */
+	device->bar->bar2 = false;
+
+	/* Allocate system memory to hold RM's VRAM allocations across suspend. */
+	size  = gsp->fb.heap.size;
+	size += gsp->fb.rsvd_size;
+	size += gsp->fb.bios.vga_workspace.size;
+	nvkm_debug(subdev, "fbsr: size: 0x%llx bytes\n", size);
+
+	ret = nvkm_gsp_sg(device, size, &gsp->sr.fbsr);
+	if (ret)
+		return ret;
+
+	/* Initialise FBSR on RM. */
+	ret = r570_fbsr_init(gsp, &gsp->sr.fbsr, size);
+	if (ret) {
+		nvkm_gsp_sg_free(device, &gsp->sr.fbsr);
+		return ret;
+	}
+
+	return 0;
+}
+
+const struct nvkm_rm_api_fbsr
+r570_fbsr = {
+	.suspend = r570_fbsr_suspend,
+	.resume = r570_fbsr_resume,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c
new file mode 100644
index 000000000000..9cd8211040bc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fifo.c
@@ -0,0 +1,234 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rm.h>
+
+#include <subdev/mmu.h>
+#include <engine/fifo/priv.h>
+#include <engine/fifo/chan.h>
+#include <engine/fifo/runl.h>
+
+#include "nvhw/drf.h"
+
+#include "nvrm/fifo.h"
+#include "nvrm/engine.h"
+
+#define CHID_PER_USERD 8
+
+static int
+r570_chan_alloc(struct nvkm_gsp_device *device, u32 nv2080_engine_type, u8 runq, bool priv,
+		int chid, u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
+		struct nvkm_vmm *vmm, u64 gpfifo_offset, u32 gpfifo_length,
+		struct nvkm_gsp_object *chan)
+{
+	struct nvkm_gsp *gsp = device->object.client->gsp;
+	struct nvkm_fifo *fifo = gsp->subdev.device->fifo;
+	const int userd_p = chid / CHID_PER_USERD;
+	const int userd_i = chid % CHID_PER_USERD;
+	NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
+
+	args = nvkm_gsp_rm_alloc_get(&device->object, 0xf1f00000 | chid,
+				     fifo->func->chan.user.oclass, sizeof(*args), chan);
+	if (WARN_ON(IS_ERR(args)))
+		return PTR_ERR(args);
+
+	args->gpFifoOffset = gpfifo_offset;
+	args->gpFifoEntries = gpfifo_length / 8;
+
+	args->flags  = NVDEF(NVOS04, FLAGS, CHANNEL_TYPE, PHYSICAL);
+	args->flags |= NVDEF(NVOS04, FLAGS, VPR, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_MAP_REFCOUNTING, FALSE);
+	args->flags |= NVVAL(NVOS04, FLAGS, GROUP_CHANNEL_RUNQUEUE, runq);
+	if (!priv)
+		args->flags |= NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, FALSE);
+	else
+		args->flags |= NVDEF(NVOS04, FLAGS, PRIVILEGED_CHANNEL, TRUE);
+	args->flags |= NVDEF(NVOS04, FLAGS, DELAY_CHANNEL_SCHEDULING, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_DENY_PHYSICAL_MODE_CE, FALSE);
+
+	args->flags |= NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_VALUE, userd_i);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_FIXED, FALSE);
+	args->flags |= NVVAL(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_VALUE, userd_p);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_USERD_INDEX_PAGE_FIXED, TRUE);
+
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_DENY_AUTH_LEVEL_PRIV, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_SKIP_SCRUBBER, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_CLIENT_MAP_FIFO, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, SET_EVICT_LAST_CE_PREFETCH_CHANNEL, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_VGPU_PLUGIN_CONTEXT, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, CHANNEL_PBDMA_ACQUIRE_TIMEOUT, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, GROUP_CHANNEL_THREAD, DEFAULT);
+	args->flags |= NVDEF(NVOS04, FLAGS, MAP_CHANNEL, FALSE);
+	args->flags |= NVDEF(NVOS04, FLAGS, SKIP_CTXBUFFER_ALLOC, FALSE);
+
+	args->hVASpace = vmm->rm.object.handle;
+	args->engineType = nv2080_engine_type;
+
+	args->instanceMem.base = inst_addr;
+	args->instanceMem.size = fifo->func->chan.func->inst->size;
+	args->instanceMem.addressSpace = 2;
+	args->instanceMem.cacheAttrib = 1;
+
+	args->userdMem.base = userd_addr;
+	args->userdMem.size = fifo->func->chan.func->userd->size;
+	args->userdMem.addressSpace = 2;
+	args->userdMem.cacheAttrib = 1;
+
+	args->ramfcMem.base = inst_addr;
+	args->ramfcMem.size = 0x200;
+	args->ramfcMem.addressSpace = 2;
+	args->ramfcMem.cacheAttrib = 1;
+
+	args->mthdbufMem.base = mthdbuf_addr;
+	args->mthdbufMem.size = fifo->rm.mthdbuf_size;
+	args->mthdbufMem.addressSpace = 1;
+	args->mthdbufMem.cacheAttrib = 0;
+
+	if (!priv)
+		args->internalFlags = NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, USER);
+	else
+		args->internalFlags = NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, PRIVILEGE, ADMIN);
+	args->internalFlags |= NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ERROR_NOTIFIER_TYPE, NONE);
+	args->internalFlags |= NVDEF(NV_KERNELCHANNEL, ALLOC_INTERNALFLAGS, ECC_ERROR_NOTIFIER_TYPE, NONE);
+
+	return nvkm_gsp_rm_alloc_wr(chan, args);
+}
+
+static int
+r570_fifo_rc_triggered(void *priv, u32 fn, void *repv, u32 repc)
+{
+	rpc_rc_triggered_v17_02 *msg = repv;
+	struct nvkm_gsp *gsp = priv;
+
+	if (WARN_ON(repc < sizeof(*msg)))
+		return -EINVAL;
+
+	nvkm_error(&gsp->subdev, "rc engn:%08x chid:%d gfid:%d level:%d type:%d scope:%d part:%d "
+				 "fault_addr:%08x%08x fault_type:%08x\n",
+		   msg->nv2080EngineType, msg->chid, msg->gfid, msg->exceptLevel, msg->exceptType,
+		   msg->scope, msg->partitionAttributionId,
+		   msg->mmuFaultAddrHi, msg->mmuFaultAddrLo, msg->mmuFaultType);
+
+	r535_fifo_rc_chid(gsp->subdev.device->fifo, msg->chid);
+	return 0;
+}
+
+static int
+r570_fifo_ectx_size(struct nvkm_fifo *fifo)
+{
+	NV2080_CTRL_GPU_GET_CONSTRUCTED_FALCON_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = fifo->engine.subdev.device->gsp;
+	struct nvkm_runl *runl;
+	struct nvkm_engn *engn;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_GPU_GET_CONSTRUCTED_FALCON_INFO,
+				   sizeof(*ctrl));
+	if (WARN_ON(IS_ERR(ctrl)))
+		return PTR_ERR(ctrl);
+
+	for (int i = 0; i < ctrl->numConstructedFalcons; i++) {
+		nvkm_runl_foreach(runl, fifo) {
+			nvkm_runl_foreach_engn(engn, runl) {
+				if (engn->rm.desc == ctrl->constructedFalconsTable[i].engDesc) {
+					engn->rm.size =
+						ctrl->constructedFalconsTable[i].ctxBufferSize;
+					break;
+				}
+			}
+		}
+	}
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
+static int
+r570_fifo_xlat_rm_engine_type(u32 rm, enum nvkm_subdev_type *ptype, int *p2080)
+{
+#define RM_ENGINE_TYPE(RM,NVKM,INST)              \
+	RM_ENGINE_TYPE_##RM:                      \
+		*ptype = NVKM_ENGINE_##NVKM;      \
+		*p2080 = NV2080_ENGINE_TYPE_##RM; \
+		return INST
+
+	switch (rm) {
+	case RM_ENGINE_TYPE(    GR0,    GR, 0);
+	case RM_ENGINE_TYPE(  COPY0,    CE, 0);
+	case RM_ENGINE_TYPE(  COPY1,    CE, 1);
+	case RM_ENGINE_TYPE(  COPY2,    CE, 2);
+	case RM_ENGINE_TYPE(  COPY3,    CE, 3);
+	case RM_ENGINE_TYPE(  COPY4,    CE, 4);
+	case RM_ENGINE_TYPE(  COPY5,    CE, 5);
+	case RM_ENGINE_TYPE(  COPY6,    CE, 6);
+	case RM_ENGINE_TYPE(  COPY7,    CE, 7);
+	case RM_ENGINE_TYPE(  COPY8,    CE, 8);
+	case RM_ENGINE_TYPE(  COPY9,    CE, 9);
+	case RM_ENGINE_TYPE( COPY10,    CE, 10);
+	case RM_ENGINE_TYPE( COPY11,    CE, 11);
+	case RM_ENGINE_TYPE( COPY12,    CE, 12);
+	case RM_ENGINE_TYPE( COPY13,    CE, 13);
+	case RM_ENGINE_TYPE( COPY14,    CE, 14);
+	case RM_ENGINE_TYPE( COPY15,    CE, 15);
+	case RM_ENGINE_TYPE( COPY16,    CE, 16);
+	case RM_ENGINE_TYPE( COPY17,    CE, 17);
+	case RM_ENGINE_TYPE( COPY18,    CE, 18);
+	case RM_ENGINE_TYPE( COPY19,    CE, 19);
+	case RM_ENGINE_TYPE( NVDEC0, NVDEC, 0);
+	case RM_ENGINE_TYPE( NVDEC1, NVDEC, 1);
+	case RM_ENGINE_TYPE( NVDEC2, NVDEC, 2);
+	case RM_ENGINE_TYPE( NVDEC3, NVDEC, 3);
+	case RM_ENGINE_TYPE( NVDEC4, NVDEC, 4);
+	case RM_ENGINE_TYPE( NVDEC5, NVDEC, 5);
+	case RM_ENGINE_TYPE( NVDEC6, NVDEC, 6);
+	case RM_ENGINE_TYPE( NVDEC7, NVDEC, 7);
+	case RM_ENGINE_TYPE( NVENC0, NVENC, 0);
+	case RM_ENGINE_TYPE( NVENC1, NVENC, 1);
+	case RM_ENGINE_TYPE( NVENC2, NVENC, 2);
+	case RM_ENGINE_TYPE( NVENC3, NVENC, 3);
+	case RM_ENGINE_TYPE(NVJPEG0, NVJPG, 0);
+	case RM_ENGINE_TYPE(NVJPEG1, NVJPG, 1);
+	case RM_ENGINE_TYPE(NVJPEG2, NVJPG, 2);
+	case RM_ENGINE_TYPE(NVJPEG3, NVJPG, 3);
+	case RM_ENGINE_TYPE(NVJPEG4, NVJPG, 4);
+	case RM_ENGINE_TYPE(NVJPEG5, NVJPG, 5);
+	case RM_ENGINE_TYPE(NVJPEG6, NVJPG, 6);
+	case RM_ENGINE_TYPE(NVJPEG7, NVJPG, 7);
+	case RM_ENGINE_TYPE(     SW,    SW, 0);
+	case RM_ENGINE_TYPE(   SEC2,  SEC2, 0);
+	case RM_ENGINE_TYPE(   OFA0,   OFA, 0);
+	case RM_ENGINE_TYPE(   OFA1,   OFA, 1);
+	default:
+		return -EINVAL;
+	}
+#undef RM_ENGINE_TYPE
+}
+
+const struct nvkm_rm_api_fifo
+r570_fifo = {
+	.xlat_rm_engine_type = r570_fifo_xlat_rm_engine_type,
+	.ectx_size = r570_fifo_ectx_size,
+	.rsvd_chids = 8,
+	.rc_triggered = r570_fifo_rc_triggered,
+	.chan = {
+		.alloc = r570_chan_alloc,
+	},
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
new file mode 100644
index 000000000000..c20a7a40783c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gr.c
@@ -0,0 +1,88 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/gr.h>
+
+#include "nvrm/gr.h"
+
+int
+r570_gr_tpc_mask(struct nvkm_gsp *gsp, int gpc, u32 *pmask)
+{
+	NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_GPU_GET_FERMI_TPC_INFO, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->gpcId = gpc;
+
+	ret = nvkm_gsp_rm_ctrl_push(&gsp->internal.device.subdevice, &ctrl, sizeof(*ctrl));
+	if (ret)
+		return ret;
+
+	*pmask = ctrl->tpcMask;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
+int
+r570_gr_gpc_mask(struct nvkm_gsp *gsp, u32 *pmask)
+{
+	NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_GPU_GET_FERMI_GPC_INFO, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*pmask = ctrl->gpcMask;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
+static int
+r570_gr_get_ctxbufs_info(struct r535_gr *gr)
+{
+	NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS *info;
+	struct nvkm_subdev *subdev = &gr->base.engine.subdev;
+	struct nvkm_gsp *gsp = subdev->device->gsp;
+
+	info = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO,
+				   sizeof(*info));
+	if (WARN_ON(IS_ERR(info)))
+		return PTR_ERR(info);
+
+	for (int i = 0; i < ARRAY_SIZE(info->engineContextBuffersInfo[0].engine); i++)
+		r535_gr_get_ctxbuf_info(gr, i, &info->engineContextBuffersInfo[0].engine[i]);
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, info);
+	return 0;
+}
+
+const struct nvkm_rm_api_gr
+r570_gr = {
+	.get_ctxbufs_info = r570_gr_get_ctxbufs_info,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
new file mode 100644
index 000000000000..2459583af0d3
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c
@@ -0,0 +1,223 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rm.h>
+#include <rm/rpc.h>
+
+#include <asm-generic/video.h>
+
+#include "nvrm/gsp.h"
+#include "nvrm/rpcfn.h"
+#include "nvrm/msgfn.h"
+
+#include <core/pci.h>
+
+static u32
+r570_gsp_sr_data_size(struct nvkm_gsp *gsp)
+{
+	GspFwWprMeta *meta = gsp->wpr_meta.data;
+
+	return (meta->frtsOffset + meta->frtsSize) -
+	       (meta->nonWprHeapOffset + meta->nonWprHeapSize);
+}
+
+static void
+r570_gsp_drop_post_nocat_record(struct nvkm_gsp *gsp)
+{
+	if (gsp->subdev.debug < NV_DBG_DEBUG)
+		r535_gsp_msg_ntfy_add(gsp, NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD, NULL, NULL);
+}
+
+static bool
+r570_gsp_xlat_mc_engine_idx(u32 mc_engine_idx, enum nvkm_subdev_type *ptype, int *pinst)
+{
+	switch (mc_engine_idx) {
+	case MC_ENGINE_IDX_GSP:
+		*ptype = NVKM_SUBDEV_GSP;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_DISP:
+		*ptype = NVKM_ENGINE_DISP;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE19:
+		*ptype = NVKM_ENGINE_CE;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_CE0;
+		return true;
+	case MC_ENGINE_IDX_GR0:
+		*ptype = NVKM_ENGINE_GR;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_NVDEC0 ... MC_ENGINE_IDX_NVDEC7:
+		*ptype = NVKM_ENGINE_NVDEC;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVDEC0;
+		return true;
+	case MC_ENGINE_IDX_NVENC ... MC_ENGINE_IDX_NVENC3:
+		*ptype = NVKM_ENGINE_NVENC;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVENC;
+		return true;
+	case MC_ENGINE_IDX_NVJPEG0 ... MC_ENGINE_IDX_NVJPEG7:
+		*ptype = NVKM_ENGINE_NVJPG;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVJPEG0;
+		return true;
+	case MC_ENGINE_IDX_OFA0 ... MC_ENGINE_IDX_OFA1:
+		*ptype = NVKM_ENGINE_OFA;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_OFA0;
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int
+r570_gsp_get_static_info(struct nvkm_gsp *gsp)
+{
+	GspStaticConfigInfo *rpc;
+	u32 gpc_mask;
+	u32 tpc_mask;
+	int ret;
+
+	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	gsp->internal.client.object.client = &gsp->internal.client;
+	gsp->internal.client.object.parent = NULL;
+	gsp->internal.client.object.handle = rpc->hInternalClient;
+	gsp->internal.client.gsp = gsp;
+	INIT_LIST_HEAD(&gsp->internal.client.events);
+
+	gsp->internal.device.object.client = &gsp->internal.client;
+	gsp->internal.device.object.parent = &gsp->internal.client.object;
+	gsp->internal.device.object.handle = rpc->hInternalDevice;
+
+	gsp->internal.device.subdevice.client = &gsp->internal.client;
+	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
+	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
+
+	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
+	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
+
+	r535_gsp_get_static_info_fb(gsp, &rpc->fbRegionInfoParams);
+
+	nvkm_gsp_rpc_done(gsp, rpc);
+
+	ret = r570_gr_gpc_mask(gsp, &gpc_mask);
+	if (ret)
+		return ret;
+
+	for (int gpc = 0; gpc < 32; gpc++) {
+		if (gpc_mask & BIT(gpc)) {
+			ret = r570_gr_tpc_mask(gsp, gpc, &tpc_mask);
+			if (ret)
+				return ret;
+
+			gsp->gr.tpcs += hweight32(tpc_mask);
+			gsp->gr.gpcs++;
+		}
+	}
+
+	return 0;
+}
+
+static void
+r570_gsp_acpi_info(struct nvkm_gsp *gsp, ACPI_METHOD_DATA *acpi)
+{
+#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
+	acpi_handle handle = ACPI_HANDLE(gsp->subdev.device->dev);
+
+	if (!handle)
+		return;
+
+	acpi->bValid = 1;
+
+	r535_gsp_acpi_dod(handle, &acpi->dodMethodData);
+	r535_gsp_acpi_jt(handle, &acpi->jtMethodData);
+	r535_gsp_acpi_caps(handle, &acpi->capsMethodData);
+#endif
+}
+
+static int
+r570_gsp_set_system_info(struct nvkm_gsp *gsp)
+{
+	struct nvkm_device *device = gsp->subdev.device;
+	struct pci_dev *pdev = container_of(device, struct nvkm_device_pci, device)->pdev;
+	GspSystemInfo *info;
+
+	if (WARN_ON(device->type == NVKM_DEVICE_TEGRA))
+		return -ENOSYS;
+
+	info = nvkm_gsp_rpc_get(gsp, NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO, sizeof(*info));
+	if (IS_ERR(info))
+		return PTR_ERR(info);
+
+	info->gpuPhysAddr = device->func->resource_addr(device, 0);
+	info->gpuPhysFbAddr = device->func->resource_addr(device, 1);
+	info->gpuPhysInstAddr = device->func->resource_addr(device, 3);
+	info->nvDomainBusDeviceFunc = pci_dev_id(pdev);
+	info->maxUserVa = TASK_SIZE;
+	info->pciConfigMirrorBase = 0x088000;
+	info->pciConfigMirrorSize = 0x001000;
+	info->PCIDeviceID = (pdev->device << 16) | pdev->vendor;
+	info->PCISubDeviceID = (pdev->subsystem_device << 16) | pdev->subsystem_vendor;
+	info->PCIRevisionID = pdev->revision;
+	r570_gsp_acpi_info(gsp, &info->acpiMethodData);
+	info->bIsPrimary = video_is_primary_device(device->dev);
+	info->bPreserveVideoMemoryAllocations = false;
+
+	return nvkm_gsp_rpc_wr(gsp, info, NVKM_GSP_RPC_REPLY_NOWAIT);
+}
+
+static void
+r570_gsp_set_rmargs(struct nvkm_gsp *gsp, bool resume)
+{
+	GSP_ARGUMENTS_CACHED *args;
+
+	args = gsp->rmargs.data;
+	args->messageQueueInitArguments.sharedMemPhysAddr = gsp->shm.mem.addr;
+	args->messageQueueInitArguments.pageTableEntryCount = gsp->shm.ptes.nr;
+	args->messageQueueInitArguments.cmdQueueOffset =
+		(u8 *)gsp->shm.cmdq.ptr - (u8 *)gsp->shm.mem.data;
+	args->messageQueueInitArguments.statQueueOffset =
+		(u8 *)gsp->shm.msgq.ptr - (u8 *)gsp->shm.mem.data;
+
+	if (!resume) {
+		args->srInitArguments.oldLevel = 0;
+		args->srInitArguments.flags = 0;
+		args->srInitArguments.bInPMTransition = 0;
+	} else {
+		args->srInitArguments.oldLevel = NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3;
+		args->srInitArguments.flags = 0;
+		args->srInitArguments.bInPMTransition = 1;
+	}
+
+	args->bDmemStack = 1;
+}
+
+const struct nvkm_rm_api_gsp
+r570_gsp = {
+	.set_rmargs = r570_gsp_set_rmargs,
+	.set_system_info = r570_gsp_set_system_info,
+	.get_static_info = r570_gsp_get_static_info,
+	.xlat_mc_engine_idx = r570_gsp_xlat_mc_engine_idx,
+	.drop_post_nocat_record = r570_gsp_drop_post_nocat_record,
+	.sr_data_size = r570_gsp_sr_data_size,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
new file mode 100644
index 000000000000..06e972835d77
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/disp.h
@@ -0,0 +1,355 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_DISP_H__
+#define __NVRM_DISP_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO (0x20800a01) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS {
+    NvU32  feHwSysCap;
+    NvU32  windowPresentMask;
+    NvBool bFbRemapperEnabled;
+    NvU32  numHeads;
+    NvU32  i2cPort;
+    NvU32  internalDispActiveMask;
+    NvU32  embeddedDisplayPortMask;
+    NvBool bExternalMuxSupported;
+    NvBool bInternalMuxSupported;
+    NvU32  numDispChannels;
+} NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS;
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED (0x730107U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayMask;
+    NvU32 displayMaskDDC;
+} NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS;
+
+#define NV0073_CTRL_MAX_CONNECTORS                  4U
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_CONNECTOR_DATA (0x730250U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 flags;
+    NvU32 DDCPartners;
+    NvU32 count;
+    struct {
+        NvU32 index;
+        NvU32 type;
+        NvU32 location;
+    } data[NV0073_CTRL_MAX_CONNECTORS];
+    NvU32 platform;
+} NV0073_CTRL_SPECIFIC_GET_CONNECTOR_DATA_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS   (0x731369U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_CMD_DSC_CAP_PARAMS {
+    NvBool bDscSupported;
+    NvU32  encoderColorFormatMask;
+    NvU32  lineBufferSizeKB;
+    NvU32  rateBufferSizeKB;
+    NvU32  bitsPerPixelPrecision;
+    NvU32  maxNumHztSlices;
+    NvU32  lineBufferBitDepth;
+} NV0073_CTRL_CMD_DSC_CAP_PARAMS;
+
+typedef struct NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS {
+    NvU32                          subDeviceInstance;
+    NvU32                          sorIndex;
+    NvU32                          maxLinkRate;
+    NvU32                          dpVersionsSupported;
+    NvU32                          UHBRSupportedByGpu;
+    NvU32                          minPClkForCompressed;
+    NvBool                         bIsMultistreamSupported;
+    NvBool                         bIsSCEnabled;
+    NvBool                         bHasIncreasedWatermarkLimits;
+    NvBool                         bIsPC2Disabled;
+    NvBool                         isSingleHeadMSTSupported;
+    NvBool                         bFECSupported;
+    NvBool                         bIsTrainPhyRepeater;
+    NvBool                         bOverrideLinkBw;
+    NvBool                         bUseRgFlushSequence;
+    NvBool                         bSupportDPDownSpread;
+    NV0073_CTRL_CMD_DSC_CAP_PARAMS DSC;
+} NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_GET_CAPS   (0x731369U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID" */
+#define NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS_MESSAGE_ID (0x69U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2                0:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_2_YES             (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4                1:1
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP1_4_YES             (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP2_0                2:2
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP2_0_NO              (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DP_VERSIONS_SUPPORTED_DP2_0_YES             (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE                           2:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_NONE                          (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62                          (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70                          (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40                          (0x00000003U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10                          (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR10_0                     0:0
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR10_0_NO                  (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR10_0_YES                 (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR13_5                     1:1
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR13_5_NO                  (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR13_5_YES                 (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR20_0                     2:2
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR20_0_NO                  (0x00000000U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_UHBR_SUPPORTED_UHBR20_0_YES                 (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_RGB                (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_444        (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_422 (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_ENCODER_COLOR_FORMAT_Y_CB_CR_NATIVE_420 (0x00000008U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_16           (0x00000001U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_8            (0x00000002U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_4            (0x00000003U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1_2            (0x00000004U)
+#define NV0073_CTRL_CMD_DP_GET_CAPS_DSC_BITS_PER_PIXEL_PRECISION_1              (0x00000005U)
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE (0x730108U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 flags;
+    NvU32 displayMask;
+    NvU32 retryTimeMs;
+} NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS;
+
+#define NV0073_CTRL_CMD_DFP_GET_INFO (0x731140U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DFP_INTERFACE_ID << 8) | NV0073_CTRL_DFP_GET_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DFP_GET_INFO_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 flags;
+    NvU32 UHBRSupportedByDfp;
+} NV0073_CTRL_DFP_GET_INFO_PARAMS;
+
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL                                       2:0
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_TMDS                       (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_LVDS                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_SDI                        (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DISPLAYPORT                (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_DSI                        (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_SIGNAL_WRBK                       (0x00000005U)
+#define NV0073_CTRL_DFP_FLAGS_LANE                                         5:3
+#define NV0073_CTRL_DFP_FLAGS_LANE_NONE                         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_SINGLE                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_DUAL                         (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_QUAD                         (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_LANE_OCT                          (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_LIMIT                                        6:6
+#define NV0073_CTRL_DFP_FLAGS_LIMIT_DISABLE                     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LIMIT_60HZ_RR                     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER                                   7:7
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_NORMAL                 (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_SLI_SCALER_DISABLE                (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE                                 8:8
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_FALSE                (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_CAPABLE_TRUE                 (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE                        9:9
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_FALSE       (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_LIMITED_CAPABLE_TRUE        (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE                         10:10
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_FALSE          (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_RANGE_AUTO_CAPABLE_TRUE           (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE                    11:11
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_FALSE     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR422_CAPABLE_TRUE      (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE                    12:12
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_FALSE     (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_FORMAT_YCBCR444_CAPABLE_TRUE      (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_TYPE_C_TO_DP_CONNECTOR                     13:13
+#define NV0073_CTRL_DFP_FLAGS_TYPE_C_TO_DP_CONNECTOR_FALSE      (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_TYPE_C_TO_DP_CONNECTOR_TRUE       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED                               14:14
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_FALSE                (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_HDMI_ALLOWED_TRUE                 (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT                       15:15
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_FALSE        (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_EMBEDDED_DISPLAYPORT_TRUE         (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT                         16:16
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_NONE           (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_CONSTRAINT_PREFER_RBR     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW                                 19:17
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_1_62GBPS               (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_2_70GBPS               (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_5_40GBPS               (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_DP_LINK_BW_8_10GBPS               (0x00000004U)
+#define NV0073_CTRL_DFP_FLAGS_LINK                                       21:20
+#define NV0073_CTRL_DFP_FLAGS_LINK_NONE                         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_LINK_SINGLE                       (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_LINK_DUAL                         (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID                           22:22
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_FALSE            (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_FORCE_RM_EDID_TRUE             (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID                              24:23
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_NONE            (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_A               (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_B               (0x00000002U)
+#define NV0073_CTRL_DFP_FLAGS_DSI_DEVICE_ID_DSI_GANGED          (0x00000003U)
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED                   25:25
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_FALSE    (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DP_POST_CURSOR2_DISABLED_TRUE     (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS_DP_PHY_REPEATER_COUNT                      29:26
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE                        30:30
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_FALSE         (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS_DYNAMIC_MUX_CAPABLE_TRUE          (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_10_0GBPS                  0:0
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_10_0GBPS_FALSE (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_10_0GBPS_TRUE  (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_13_5GBPS                  1:1
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_13_5GBPS_FALSE (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_13_5GBPS_TRUE  (0x00000001U)
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_20_0GBPS                  2:2
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_20_0GBPS_FALSE (0x00000000U)
+#define NV0073_CTRL_DFP_FLAGS2_DP_UHBR_SUPPORTED_20_0GBPS_TRUE  (0x00000001U)
+
+#define NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE                (0x73010cU) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SYSTEM_INTERFACE_ID << 8) | NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 head;
+    NvU32 flags;
+    NvU32 displayId;
+} NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS;
+
+#define NV0073_CTRL_CMD_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS (0x730292U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_SET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_CMD_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS (0x730291U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_SPECIFIC_INTERFACE_ID << 8) | NV0073_CTRL_SPECIFIC_GET_BACKLIGHT_BRIGHTNESS_PARAMS_MESSAGE_ID" */
+
+typedef struct NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  displayId;
+    NvU32  brightness;
+    NvBool bUncalibrated;
+    NvU8   brightnessType;
+} NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES (0x731377U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS_MESSAGE_ID" */
+
+#define NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES        8U
+
+typedef struct NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS {
+    // In
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU16 linkRateTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
+
+    // Out
+    NvU16 linkBwTbl[NV0073_CTRL_DP_MAX_INDEXED_LINK_RATES];
+    NvU8  linkBwCount;
+} NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_CTRL                         (0x731343U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_CTRL_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DP_CTRL_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 cmd;
+    NvU32 data;
+    NvU32 err;
+    NvU32 retryTimeMs;
+    NvU32 eightLaneDpcdBaseAddr;
+} NV0073_CTRL_DP_CTRL_PARAMS;
+
+typedef struct NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS {
+    NvU32  subDeviceInstance;
+    NvU32  head;
+    NvU32  sorIndex;
+    NvU32  dpLink;
+
+    NvBool bEnableOverride;
+    NvBool bMST;
+    NvU32  singleHeadMultistreamMode;
+    NvU32  hBlankSym;
+    NvU32  vBlankSym;
+    NvU32  colorFormat;
+    NvBool bEnableTwoHeadOneOr;
+
+    struct {
+        NvU32  slotStart;
+        NvU32  slotEnd;
+        NvU32  PBN;
+        NvU32  Timeslice;
+        NvBool sendACT;          // deprecated -Use NV0073_CTRL_CMD_DP_SEND_ACT
+        NvU32  singleHeadMSTPipeline;
+        NvBool bEnableAudioOverRightPanel;
+    } MST;
+
+    struct {
+        NvBool bEnhancedFraming;
+        NvU32  tuSize;
+        NvU32  waterMark;
+        NvBool bEnableAudioOverRightPanel;
+    } SST;
+} NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS;
+
+#define NV0073_CTRL_CMD_DP_SET_AUDIO_MUTESTREAM             (0x731359U) /* finn: Evaluated from "(FINN_NV04_DISPLAY_COMMON_DP_INTERFACE_ID << 8) | NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS_MESSAGE_ID" */
+typedef struct NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS {
+    NvU32 subDeviceInstance;
+    NvU32 displayId;
+    NvU32 mute;
+} NV0073_CTRL_DP_SET_AUDIO_MUTESTREAM_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER (0x20800a58) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS {
+    NvU32  addressSpace;
+    NV_DECLARE_ALIGNED(NvU64 physicalAddr, 8);
+    NV_DECLARE_ALIGNED(NvU64 limit, 8);
+    NvU32  cacheSnoop;
+    NvU32  hclass;
+    NvU32  channelInstance;
+    NvBool valid;
+    NvU32  pbTargetAperture;
+    NvU32  channelPBSize;
+    NvU32  subDeviceId;
+} NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS;
+
+#define ADDR_SYSMEM                    (1)
+
+#define ADDR_FBMEM      2         // Frame buffer memory space
+
+typedef enum
+{
+    PB_SIZE_4KB = 0,
+    PB_SIZE_8KB,
+    PB_SIZE_16KB,
+    PB_SIZE_32KB,
+    PB_SIZE_64KB
+} ChannelPBSize;
+
+typedef struct
+{
+    NvV32         channelInstance;            // One of the n channel instances of a given channel type.
+                                              // Note that core channel has only one instance
+                                              // while all others have two (one per head).
+    NvHandle      hObjectBuffer;              // ctx dma handle for DMA push buffer
+    NvHandle      hObjectNotify;              // ctx dma handle for an area (of type NvNotification defined in sdk/nvidia/inc/nvtypes.h) where RM can write errors/notifications
+    NvU32         offset;                     // Initial offset for put/get, usually zero.
+    NvP64         pControl NV_ALIGN_BYTES(8); // pControl gives virt addr of UDISP GET/PUT regs
+
+    NvU32         flags;
+    ChannelPBSize channelPBSize;              // Size of Push Buffer requested by client (allowed values in enum)
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB                1:1
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_YES            0x00000000
+#define NV50VAIO_CHANNELDMA_ALLOCATION_FLAGS_CONNECT_PB_AT_GRAB_NO             0x00000001
+
+    NvU32    subDeviceId;                // One-hot encoded subDeviceId (i.e. SDM) that will be used to address the channel in the pushbuffer stream (via SSDM method)
+} NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS;
+
+#define NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_TYPE_PERCENT100        1
+#define NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_TYPE_PERCENT1000       2
+#define NV0073_CTRL_SPECIFIC_BACKLIGHT_BRIGHTNESS_TYPE_NITS              3
+
+typedef enum
+{
+    IOVA,
+    PHYS_NVM,
+    PHYS_PCI,
+    PHYS_PCI_COHERENT
+} PBTARGETAPERTURE;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h
new file mode 100644
index 000000000000..7997050a4f29
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/engine.h
@@ -0,0 +1,318 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_ENGINE_H__
+#define __NVRM_ENGINE_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#define MC_ENGINE_IDX_NULL                          0 // This must be 0
+#define MC_ENGINE_IDX_TMR                           1
+#define MC_ENGINE_IDX_DISP                          2
+#define MC_ENGINE_IDX_FB                            3
+#define MC_ENGINE_IDX_FIFO                          4
+#define MC_ENGINE_IDX_VIDEO                         5
+#define MC_ENGINE_IDX_MD                            6
+#define MC_ENGINE_IDX_BUS                           7
+#define MC_ENGINE_IDX_PMGR                          8
+#define MC_ENGINE_IDX_VP2                           9
+#define MC_ENGINE_IDX_CIPHER                        10
+#define MC_ENGINE_IDX_BIF                           11
+#define MC_ENGINE_IDX_PPP                           12
+#define MC_ENGINE_IDX_PRIVRING                      13
+#define MC_ENGINE_IDX_PMU                           14
+#define MC_ENGINE_IDX_CE0                           15
+#define MC_ENGINE_IDX_CE1                           16
+#define MC_ENGINE_IDX_CE2                           17
+#define MC_ENGINE_IDX_CE3                           18
+#define MC_ENGINE_IDX_CE4                           19
+#define MC_ENGINE_IDX_CE5                           20
+#define MC_ENGINE_IDX_CE6                           21
+#define MC_ENGINE_IDX_CE7                           22
+#define MC_ENGINE_IDX_CE8                           23
+#define MC_ENGINE_IDX_CE9                           24
+#define MC_ENGINE_IDX_CE10                          25
+#define MC_ENGINE_IDX_CE11                          26
+#define MC_ENGINE_IDX_CE12                          27
+#define MC_ENGINE_IDX_CE13                          28
+#define MC_ENGINE_IDX_CE14                          29
+#define MC_ENGINE_IDX_CE15                          30
+#define MC_ENGINE_IDX_CE16                          31
+#define MC_ENGINE_IDX_CE17                          32
+#define MC_ENGINE_IDX_CE18                          33
+#define MC_ENGINE_IDX_CE19                          34
+#define MC_ENGINE_IDX_CE_MAX                        MC_ENGINE_IDX_CE19
+#define MC_ENGINE_IDX_VIC                           35
+#define MC_ENGINE_IDX_ISOHUB                        36
+#define MC_ENGINE_IDX_VGPU                          37
+#define MC_ENGINE_IDX_NVENC                         38
+#define MC_ENGINE_IDX_NVENC1                        39
+#define MC_ENGINE_IDX_NVENC2                        40
+#define MC_ENGINE_IDX_NVENC3                        41
+#define MC_ENGINE_IDX_C2C                           42
+#define MC_ENGINE_IDX_LTC                           43
+#define MC_ENGINE_IDX_FBHUB                         44
+#define MC_ENGINE_IDX_HDACODEC                      45
+#define MC_ENGINE_IDX_GMMU                          46
+#define MC_ENGINE_IDX_SEC2                          47
+#define MC_ENGINE_IDX_FSP                           48
+#define MC_ENGINE_IDX_NVLINK                        49
+#define MC_ENGINE_IDX_GSP                           50
+#define MC_ENGINE_IDX_NVJPG                         51
+#define MC_ENGINE_IDX_NVJPEG                        MC_ENGINE_IDX_NVJPG
+#define MC_ENGINE_IDX_NVJPEG0                       MC_ENGINE_IDX_NVJPEG
+#define MC_ENGINE_IDX_NVJPEG1                       52
+#define MC_ENGINE_IDX_NVJPEG2                       53
+#define MC_ENGINE_IDX_NVJPEG3                       54
+#define MC_ENGINE_IDX_NVJPEG4                       55
+#define MC_ENGINE_IDX_NVJPEG5                       56
+#define MC_ENGINE_IDX_NVJPEG6                       57
+#define MC_ENGINE_IDX_NVJPEG7                       58
+#define MC_ENGINE_IDX_REPLAYABLE_FAULT              59
+#define MC_ENGINE_IDX_ACCESS_CNTR                   60
+#define MC_ENGINE_IDX_NON_REPLAYABLE_FAULT          61
+#define MC_ENGINE_IDX_REPLAYABLE_FAULT_ERROR        62
+#define MC_ENGINE_IDX_NON_REPLAYABLE_FAULT_ERROR    63
+#define MC_ENGINE_IDX_INFO_FAULT                    64
+#define MC_ENGINE_IDX_BSP                           65
+#define MC_ENGINE_IDX_NVDEC                         MC_ENGINE_IDX_BSP
+#define MC_ENGINE_IDX_NVDEC0                        MC_ENGINE_IDX_NVDEC
+#define MC_ENGINE_IDX_NVDEC1                        66
+#define MC_ENGINE_IDX_NVDEC2                        67
+#define MC_ENGINE_IDX_NVDEC3                        68
+#define MC_ENGINE_IDX_NVDEC4                        69
+#define MC_ENGINE_IDX_NVDEC5                        70
+#define MC_ENGINE_IDX_NVDEC6                        71
+#define MC_ENGINE_IDX_NVDEC7                        72
+#define MC_ENGINE_IDX_CPU_DOORBELL                  73
+#define MC_ENGINE_IDX_PRIV_DOORBELL                 74
+#define MC_ENGINE_IDX_MMU_ECC_ERROR                 75
+#define MC_ENGINE_IDX_BLG                           76
+#define MC_ENGINE_IDX_PERFMON                       77
+#define MC_ENGINE_IDX_BUF_RESET                     78
+#define MC_ENGINE_IDX_XBAR                          79
+#define MC_ENGINE_IDX_ZPW                           80
+#define MC_ENGINE_IDX_OFA0                          81
+#define MC_ENGINE_IDX_OFA1                          82
+#define MC_ENGINE_IDX_TEGRA                         83
+#define MC_ENGINE_IDX_GR                            84
+#define MC_ENGINE_IDX_GR0                           MC_ENGINE_IDX_GR
+#define MC_ENGINE_IDX_GR1                           85
+#define MC_ENGINE_IDX_GR2                           86
+#define MC_ENGINE_IDX_GR3                           87
+#define MC_ENGINE_IDX_GR4                           88
+#define MC_ENGINE_IDX_GR5                           89
+#define MC_ENGINE_IDX_GR6                           90
+#define MC_ENGINE_IDX_GR7                           91
+#define MC_ENGINE_IDX_ESCHED                        92
+#define MC_ENGINE_IDX_ESCHED__SIZE                  64
+#define MC_ENGINE_IDX_GR_FECS_LOG                   156
+#define MC_ENGINE_IDX_GR0_FECS_LOG                  MC_ENGINE_IDX_GR_FECS_LOG
+#define MC_ENGINE_IDX_GR1_FECS_LOG                  157
+#define MC_ENGINE_IDX_GR2_FECS_LOG                  158
+#define MC_ENGINE_IDX_GR3_FECS_LOG                  159
+#define MC_ENGINE_IDX_GR4_FECS_LOG                  160
+#define MC_ENGINE_IDX_GR5_FECS_LOG                  161
+#define MC_ENGINE_IDX_GR6_FECS_LOG                  162
+#define MC_ENGINE_IDX_GR7_FECS_LOG                  163
+#define MC_ENGINE_IDX_TMR_SWRL                      164
+#define MC_ENGINE_IDX_DISP_GSP                      165
+#define MC_ENGINE_IDX_REPLAYABLE_FAULT_CPU          166
+#define MC_ENGINE_IDX_NON_REPLAYABLE_FAULT_CPU      167
+#define MC_ENGINE_IDX_PXUC                          168
+#define MC_ENGINE_IDX_SYSLTC                        169
+#define MC_ENGINE_IDX_LRCC                          170
+#define MC_ENGINE_IDX_GSPLITE                       171
+#define MC_ENGINE_IDX_GSPLITE0                      MC_ENGINE_IDX_GSPLITE
+#define MC_ENGINE_IDX_GSPLITE1                      172
+#define MC_ENGINE_IDX_GSPLITE2                      173
+#define MC_ENGINE_IDX_GSPLITE3                      174
+#define MC_ENGINE_IDX_GSPLITE_MAX                   MC_ENGINE_IDX_GSPLITE3
+#define MC_ENGINE_IDX_DPAUX                         175
+#define MC_ENGINE_IDX_DISP_LOW                      176
+#define MC_ENGINE_IDX_MAX                           177
+
+typedef enum
+{
+    RM_ENGINE_TYPE_NULL                            =       (0x00000000),
+    RM_ENGINE_TYPE_GR0                             =       (0x00000001),
+    RM_ENGINE_TYPE_GR1                             =       (0x00000002),
+    RM_ENGINE_TYPE_GR2                             =       (0x00000003),
+    RM_ENGINE_TYPE_GR3                             =       (0x00000004),
+    RM_ENGINE_TYPE_GR4                             =       (0x00000005),
+    RM_ENGINE_TYPE_GR5                             =       (0x00000006),
+    RM_ENGINE_TYPE_GR6                             =       (0x00000007),
+    RM_ENGINE_TYPE_GR7                             =       (0x00000008),
+    RM_ENGINE_TYPE_COPY0                           =       (0x00000009),
+    RM_ENGINE_TYPE_COPY1                           =       (0x0000000a),
+    RM_ENGINE_TYPE_COPY2                           =       (0x0000000b),
+    RM_ENGINE_TYPE_COPY3                           =       (0x0000000c),
+    RM_ENGINE_TYPE_COPY4                           =       (0x0000000d),
+    RM_ENGINE_TYPE_COPY5                           =       (0x0000000e),
+    RM_ENGINE_TYPE_COPY6                           =       (0x0000000f),
+    RM_ENGINE_TYPE_COPY7                           =       (0x00000010),
+    RM_ENGINE_TYPE_COPY8                           =       (0x00000011),
+    RM_ENGINE_TYPE_COPY9                           =       (0x00000012),
+    RM_ENGINE_TYPE_COPY10                          =       (0x00000013),
+    RM_ENGINE_TYPE_COPY11                          =       (0x00000014),
+    RM_ENGINE_TYPE_COPY12                          =       (0x00000015),
+    RM_ENGINE_TYPE_COPY13                          =       (0x00000016),
+    RM_ENGINE_TYPE_COPY14                          =       (0x00000017),
+    RM_ENGINE_TYPE_COPY15                          =       (0x00000018),
+    RM_ENGINE_TYPE_COPY16                          =       (0x00000019),
+    RM_ENGINE_TYPE_COPY17                          =       (0x0000001a),
+    RM_ENGINE_TYPE_COPY18                          =       (0x0000001b),
+    RM_ENGINE_TYPE_COPY19                          =       (0x0000001c),
+    RM_ENGINE_TYPE_NVDEC0                          =       (0x0000001d),
+    RM_ENGINE_TYPE_NVDEC1                          =       (0x0000001e),
+    RM_ENGINE_TYPE_NVDEC2                          =       (0x0000001f),
+    RM_ENGINE_TYPE_NVDEC3                          =       (0x00000020),
+    RM_ENGINE_TYPE_NVDEC4                          =       (0x00000021),
+    RM_ENGINE_TYPE_NVDEC5                          =       (0x00000022),
+    RM_ENGINE_TYPE_NVDEC6                          =       (0x00000023),
+    RM_ENGINE_TYPE_NVDEC7                          =       (0x00000024),
+    RM_ENGINE_TYPE_NVENC0                          =       (0x00000025),
+    RM_ENGINE_TYPE_NVENC1                          =       (0x00000026),
+    RM_ENGINE_TYPE_NVENC2                          =       (0x00000027),
+    // Bug 4175886 - Use this new value for all chips once GB20X is released
+    RM_ENGINE_TYPE_NVENC3                          =       (0x00000028),
+    RM_ENGINE_TYPE_VP                              =       (0x00000029),
+    RM_ENGINE_TYPE_ME                              =       (0x0000002a),
+    RM_ENGINE_TYPE_PPP                             =       (0x0000002b),
+    RM_ENGINE_TYPE_MPEG                            =       (0x0000002c),
+    RM_ENGINE_TYPE_SW                              =       (0x0000002d),
+    RM_ENGINE_TYPE_TSEC                            =       (0x0000002e),
+    RM_ENGINE_TYPE_VIC                             =       (0x0000002f),
+    RM_ENGINE_TYPE_MP                              =       (0x00000030),
+    RM_ENGINE_TYPE_SEC2                            =       (0x00000031),
+    RM_ENGINE_TYPE_HOST                            =       (0x00000032),
+    RM_ENGINE_TYPE_DPU                             =       (0x00000033),
+    RM_ENGINE_TYPE_PMU                             =       (0x00000034),
+    RM_ENGINE_TYPE_FBFLCN                          =       (0x00000035),
+    RM_ENGINE_TYPE_NVJPEG0                         =       (0x00000036),
+    RM_ENGINE_TYPE_NVJPEG1                         =       (0x00000037),
+    RM_ENGINE_TYPE_NVJPEG2                         =       (0x00000038),
+    RM_ENGINE_TYPE_NVJPEG3                         =       (0x00000039),
+    RM_ENGINE_TYPE_NVJPEG4                         =       (0x0000003a),
+    RM_ENGINE_TYPE_NVJPEG5                         =       (0x0000003b),
+    RM_ENGINE_TYPE_NVJPEG6                         =       (0x0000003c),
+    RM_ENGINE_TYPE_NVJPEG7                         =       (0x0000003d),
+    RM_ENGINE_TYPE_OFA0                            =       (0x0000003e),
+    RM_ENGINE_TYPE_OFA1                            =       (0x0000003f),
+    RM_ENGINE_TYPE_RESERVED40                      =       (0x00000040),
+    RM_ENGINE_TYPE_RESERVED41                      =       (0x00000041),
+    RM_ENGINE_TYPE_RESERVED42                      =       (0x00000042),
+    RM_ENGINE_TYPE_RESERVED43                      =       (0x00000043),
+    RM_ENGINE_TYPE_RESERVED44                      =       (0x00000044),
+    RM_ENGINE_TYPE_RESERVED45                      =       (0x00000045),
+    RM_ENGINE_TYPE_RESERVED46                      =       (0x00000046),
+    RM_ENGINE_TYPE_RESERVED47                      =       (0x00000047),
+    RM_ENGINE_TYPE_RESERVED48                      =       (0x00000048),
+    RM_ENGINE_TYPE_RESERVED49                      =       (0x00000049),
+    RM_ENGINE_TYPE_RESERVED4a                      =       (0x0000004a),
+    RM_ENGINE_TYPE_RESERVED4b                      =       (0x0000004b),
+    RM_ENGINE_TYPE_RESERVED4c                      =       (0x0000004c),
+    RM_ENGINE_TYPE_RESERVED4d                      =       (0x0000004d),
+    RM_ENGINE_TYPE_RESERVED4e                      =       (0x0000004e),
+    RM_ENGINE_TYPE_RESERVED4f                      =       (0x0000004f),
+    RM_ENGINE_TYPE_RESERVED50                      =       (0x00000050),
+    RM_ENGINE_TYPE_RESERVED51                      =       (0x00000051),
+    RM_ENGINE_TYPE_RESERVED52                      =       (0x00000052),
+    RM_ENGINE_TYPE_RESERVED53                      =       (0x00000053),
+    RM_ENGINE_TYPE_LAST                            =       (0x00000054),
+} RM_ENGINE_TYPE;
+
+#define NV2080_ENGINE_TYPE_NULL                       (0x00000000)
+#define NV2080_ENGINE_TYPE_GRAPHICS                   (0x00000001)
+#define NV2080_ENGINE_TYPE_GR0                        NV2080_ENGINE_TYPE_GRAPHICS
+#define NV2080_ENGINE_TYPE_GR1                        (0x00000002)
+#define NV2080_ENGINE_TYPE_GR2                        (0x00000003)
+#define NV2080_ENGINE_TYPE_GR3                        (0x00000004)
+#define NV2080_ENGINE_TYPE_GR4                        (0x00000005)
+#define NV2080_ENGINE_TYPE_GR5                        (0x00000006)
+#define NV2080_ENGINE_TYPE_GR6                        (0x00000007)
+#define NV2080_ENGINE_TYPE_GR7                        (0x00000008)
+#define NV2080_ENGINE_TYPE_COPY0                      (0x00000009)
+#define NV2080_ENGINE_TYPE_COPY1                      (0x0000000a)
+#define NV2080_ENGINE_TYPE_COPY2                      (0x0000000b)
+#define NV2080_ENGINE_TYPE_COPY3                      (0x0000000c)
+#define NV2080_ENGINE_TYPE_COPY4                      (0x0000000d)
+#define NV2080_ENGINE_TYPE_COPY5                      (0x0000000e)
+#define NV2080_ENGINE_TYPE_COPY6                      (0x0000000f)
+#define NV2080_ENGINE_TYPE_COPY7                      (0x00000010)
+#define NV2080_ENGINE_TYPE_COPY8                      (0x00000011)
+#define NV2080_ENGINE_TYPE_COPY9                      (0x00000012)
+#define NV2080_ENGINE_TYPE_BSP                        (0x00000013)
+#define NV2080_ENGINE_TYPE_NVDEC0                     NV2080_ENGINE_TYPE_BSP
+#define NV2080_ENGINE_TYPE_NVDEC1                     (0x00000014)
+#define NV2080_ENGINE_TYPE_NVDEC2                     (0x00000015)
+#define NV2080_ENGINE_TYPE_NVDEC3                     (0x00000016)
+#define NV2080_ENGINE_TYPE_NVDEC4                     (0x00000017)
+#define NV2080_ENGINE_TYPE_NVDEC5                     (0x00000018)
+#define NV2080_ENGINE_TYPE_NVDEC6                     (0x00000019)
+#define NV2080_ENGINE_TYPE_NVDEC7                     (0x0000001a)
+#define NV2080_ENGINE_TYPE_MSENC                      (0x0000001b)
+#define NV2080_ENGINE_TYPE_NVENC0                      NV2080_ENGINE_TYPE_MSENC  /* Mutually exclusive alias */
+#define NV2080_ENGINE_TYPE_NVENC1                     (0x0000001c)
+#define NV2080_ENGINE_TYPE_NVENC2                     (0x0000001d)
+#define NV2080_ENGINE_TYPE_VP                         (0x0000001e)
+#define NV2080_ENGINE_TYPE_ME                         (0x0000001f)
+#define NV2080_ENGINE_TYPE_PPP                        (0x00000020)
+#define NV2080_ENGINE_TYPE_MPEG                       (0x00000021)
+#define NV2080_ENGINE_TYPE_SW                         (0x00000022)
+#define NV2080_ENGINE_TYPE_CIPHER                     (0x00000023)
+#define NV2080_ENGINE_TYPE_TSEC                       NV2080_ENGINE_TYPE_CIPHER
+#define NV2080_ENGINE_TYPE_VIC                        (0x00000024)
+#define NV2080_ENGINE_TYPE_MP                         (0x00000025)
+#define NV2080_ENGINE_TYPE_SEC2                       (0x00000026)
+#define NV2080_ENGINE_TYPE_HOST                       (0x00000027)
+#define NV2080_ENGINE_TYPE_DPU                        (0x00000028)
+#define NV2080_ENGINE_TYPE_PMU                        (0x00000029)
+#define NV2080_ENGINE_TYPE_FBFLCN                     (0x0000002a)
+#define NV2080_ENGINE_TYPE_NVJPG                      (0x0000002b)
+#define NV2080_ENGINE_TYPE_NVJPEG0                     NV2080_ENGINE_TYPE_NVJPG
+#define NV2080_ENGINE_TYPE_NVJPEG1                    (0x0000002c)
+#define NV2080_ENGINE_TYPE_NVJPEG2                    (0x0000002d)
+#define NV2080_ENGINE_TYPE_NVJPEG3                    (0x0000002e)
+#define NV2080_ENGINE_TYPE_NVJPEG4                    (0x0000002f)
+#define NV2080_ENGINE_TYPE_NVJPEG5                    (0x00000030)
+#define NV2080_ENGINE_TYPE_NVJPEG6                    (0x00000031)
+#define NV2080_ENGINE_TYPE_NVJPEG7                    (0x00000032)
+#define NV2080_ENGINE_TYPE_OFA                        (0x00000033)
+#define NV2080_ENGINE_TYPE_OFA0                       NV2080_ENGINE_TYPE_OFA
+#define NV2080_ENGINE_TYPE_COPY10                     (0x00000034)
+#define NV2080_ENGINE_TYPE_COPY11                     (0x00000035)
+#define NV2080_ENGINE_TYPE_COPY12                     (0x00000036)
+#define NV2080_ENGINE_TYPE_COPY13                     (0x00000037)
+#define NV2080_ENGINE_TYPE_COPY14                     (0x00000038)
+#define NV2080_ENGINE_TYPE_COPY15                     (0x00000039)
+#define NV2080_ENGINE_TYPE_COPY16                     (0x0000003a)
+#define NV2080_ENGINE_TYPE_COPY17                     (0x0000003b)
+#define NV2080_ENGINE_TYPE_COPY18                     (0x0000003c)
+#define NV2080_ENGINE_TYPE_COPY19                     (0x0000003d)
+#define NV2080_ENGINE_TYPE_OFA1                       (0x0000003e)
+#define NV2080_ENGINE_TYPE_NVENC3                     (0x0000003f)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY0          (0x00000040)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY1          (0x00000041)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY2          (0x00000042)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY3          (0x00000043)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY4          (0x00000044)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY5          (0x00000045)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY6          (0x00000046)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY7          (0x00000047)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY8          (0x00000048)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY9          (0x00000049)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY10         (0x0000004a)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY11         (0x0000004b)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY12         (0x0000004c)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY13         (0x0000004d)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY14         (0x0000004e)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY15         (0x0000004f)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY16         (0x00000050)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY17         (0x00000051)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY18         (0x00000052)
+#define NV2080_ENGINE_TYPE_COMP_DECOMP_COPY19         (0x00000053)
+#define NV2080_ENGINE_TYPE_LAST                       (0x00000054)
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
new file mode 100644
index 000000000000..8af432375f7a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fbsr.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_FBSR_H__
+#define __NVRM_FBSR_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#define NV2080_CTRL_CMD_INTERNAL_FBSR_INIT (0x20800ac2) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS {
+    NvHandle hClient;
+    NvHandle hSysMem;
+    NvBool   bEnteringGcoffState;
+    NV_DECLARE_ALIGNED(NvU64 sysmemAddrOfSuspendResumeData, 8);
+} NV2080_CTRL_INTERNAL_FBSR_INIT_PARAMS;
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fifo.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fifo.h
new file mode 100644
index 000000000000..2b002ca64e0f
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/fifo.h
@@ -0,0 +1,213 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_FIFO_H__
+#define __NVRM_FIFO_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#define NV_MAX_SUBDEVICES             8
+
+typedef struct NV_MEMORY_DESC_PARAMS {
+    NV_DECLARE_ALIGNED(NvU64 base, 8);
+    NV_DECLARE_ALIGNED(NvU64 size, 8);
+    NvU32 addressSpace;
+    NvU32 cacheAttrib;
+} NV_MEMORY_DESC_PARAMS;
+
+#define CC_CHAN_ALLOC_IV_SIZE_DWORD    3U
+
+#define CC_CHAN_ALLOC_NONCE_SIZE_DWORD 8U
+
+typedef struct NV_CHANNEL_ALLOC_PARAMS {
+
+    NvHandle hObjectError; // error context DMA
+    NvHandle hObjectBuffer; // no longer used
+    NV_DECLARE_ALIGNED(NvU64 gpFifoOffset, 8);    // offset to beginning of GP FIFO
+    NvU32    gpFifoEntries;    // number of GP FIFO entries
+
+    NvU32    flags;
+
+
+    NvHandle hContextShare; // context share handle
+    NvHandle hVASpace; // VASpace for the channel
+
+    // handle to UserD memory object for channel, ignored if hUserdMemory[0]=0
+    NvHandle hUserdMemory[NV_MAX_SUBDEVICES];
+
+    // offset to beginning of UserD within hUserdMemory[x]
+    NV_DECLARE_ALIGNED(NvU64 userdOffset[NV_MAX_SUBDEVICES], 8);
+
+    // engine type(NV2080_ENGINE_TYPE_*) with which this channel is associated
+    NvU32    engineType;
+    // Channel identifier that is unique for the duration of a RM session
+    NvU32    cid;
+    // One-hot encoded bitmask to match SET_SUBDEVICE_MASK methods
+    NvU32    subDeviceId;
+    NvHandle hObjectEccError; // ECC error context DMA
+
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS instanceMem, 8);
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS userdMem, 8);
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS ramfcMem, 8);
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS mthdbufMem, 8);
+
+    NvHandle hPhysChannelGroup;              // reserved
+    NvU32    internalFlags;                 // reserved
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS errorNotifierMem, 8); // reserved
+    NV_DECLARE_ALIGNED(NV_MEMORY_DESC_PARAMS eccErrorNotifierMem, 8); // reserved
+    NvU32    ProcessID;                 // reserved
+    NvU32    SubProcessID;                 // reserved
+
+    // IV used for CPU-side encryption / GPU-side decryption.
+    NvU32    encryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
+    // IV used for CPU-side decryption / GPU-side encryption.
+    NvU32    decryptIv[CC_CHAN_ALLOC_IV_SIZE_DWORD];          // reserved
+    // Nonce used CPU-side signing / GPU-side signature verification.
+    NvU32    hmacNonce[CC_CHAN_ALLOC_NONCE_SIZE_DWORD];       // reserved
+    NvU32    tpcConfigID; // TPC Configuration Id as supported by DTD-PG Feature
+} NV_CHANNEL_ALLOC_PARAMS;
+
+typedef NV_CHANNEL_ALLOC_PARAMS NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS;
+
+#define NVOS04_FLAGS_CHANNEL_TYPE                                  1:0
+#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL                         0x00000000
+#define NVOS04_FLAGS_CHANNEL_TYPE_VIRTUAL                          0x00000001  // OBSOLETE
+#define NVOS04_FLAGS_CHANNEL_TYPE_PHYSICAL_FOR_VIRTUAL             0x00000002  // OBSOLETE
+#define NVOS04_FLAGS_VPR                                           2:2
+#define NVOS04_FLAGS_VPR_FALSE                                     0x00000000
+#define NVOS04_FLAGS_VPR_TRUE                                      0x00000001
+#define NVOS04_FLAGS_CC_SECURE                                     2:2
+#define NVOS04_FLAGS_CC_SECURE_FALSE                               0x00000000
+#define NVOS04_FLAGS_CC_SECURE_TRUE                                0x00000001
+#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING                  3:3
+#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_FALSE            0x00000000
+#define NVOS04_FLAGS_CHANNEL_SKIP_MAP_REFCOUNTING_TRUE             0x00000001
+#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE                       4:4
+#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_DEFAULT               0x00000000
+#define NVOS04_FLAGS_GROUP_CHANNEL_RUNQUEUE_ONE                   0x00000001
+#define NVOS04_FLAGS_PRIVILEGED_CHANNEL                           5:5
+#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_FALSE                     0x00000000
+#define NVOS04_FLAGS_PRIVILEGED_CHANNEL_TRUE                      0x00000001
+#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING                     6:6
+#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_FALSE               0x00000000
+#define NVOS04_FLAGS_DELAY_CHANNEL_SCHEDULING_TRUE                0x00000001
+#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE                7:7
+#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_FALSE          0x00000000
+#define NVOS04_FLAGS_CHANNEL_DENY_PHYSICAL_MODE_CE_TRUE           0x00000001
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_VALUE                    10:8
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED                    11:11
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_FALSE              0x00000000
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_FIXED_TRUE               0x00000001
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_VALUE               20:12
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED               21:21
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_FALSE         0x00000000
+#define NVOS04_FLAGS_CHANNEL_USERD_INDEX_PAGE_FIXED_TRUE          0x00000001
+#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV                 22:22
+#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_FALSE           0x00000000
+#define NVOS04_FLAGS_CHANNEL_DENY_AUTH_LEVEL_PRIV_TRUE            0x00000001
+#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER                        23:23
+#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_FALSE                  0x00000000
+#define NVOS04_FLAGS_CHANNEL_SKIP_SCRUBBER_TRUE                   0x00000001
+#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO                      24:24
+#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_FALSE                0x00000000
+#define NVOS04_FLAGS_CHANNEL_CLIENT_MAP_FIFO_TRUE                 0x00000001
+#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL           25:25
+#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_FALSE     0x00000000
+#define NVOS04_FLAGS_SET_EVICT_LAST_CE_PREFETCH_CHANNEL_TRUE      0x00000001
+#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT                  26:26
+#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_FALSE            0x00000000
+#define NVOS04_FLAGS_CHANNEL_VGPU_PLUGIN_CONTEXT_TRUE             0x00000001
+#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT                 27:27
+#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_FALSE           0x00000000
+#define NVOS04_FLAGS_CHANNEL_PBDMA_ACQUIRE_TIMEOUT_TRUE            0x00000001
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD                          29:28
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_DEFAULT                  0x00000000
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_ONE                      0x00000001
+#define NVOS04_FLAGS_GROUP_CHANNEL_THREAD_TWO                      0x00000002
+#define NVOS04_FLAGS_MAP_CHANNEL                                   30:30
+#define NVOS04_FLAGS_MAP_CHANNEL_FALSE                             0x00000000
+#define NVOS04_FLAGS_MAP_CHANNEL_TRUE                              0x00000001
+#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC                          31:31
+#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_FALSE                    0x00000000
+#define NVOS04_FLAGS_SKIP_CTXBUFFER_ALLOC_TRUE                     0x00000001
+
+typedef enum {
+    /*!
+     * Initial state as passed in NV_CHANNEL_ALLOC_PARAMS by
+     * kernel CPU-RM clients.
+     */
+    ERROR_NOTIFIER_TYPE_UNKNOWN = 0,
+    /*! @brief Error notifier is explicitly not set.
+     *
+     * The corresponding hErrorContext or hEccErrorContext must be
+     * NV01_NULL_OBJECT.
+     */
+    ERROR_NOTIFIER_TYPE_NONE,
+    /*! @brief Error notifier is a ContextDma */
+    ERROR_NOTIFIER_TYPE_CTXDMA,
+    /*! @brief Error notifier is a NvNotification array in sysmem/vidmem */
+    ERROR_NOTIFIER_TYPE_MEMORY
+} ErrorNotifierType;
+
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE                       1:0
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_USER                  0x0
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_ADMIN                 0x1
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_PRIVILEGE_KERNEL                0x2
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE             3:2
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_UNKNOWN     ERROR_NOTIFIER_TYPE_UNKNOWN
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_NONE        ERROR_NOTIFIER_TYPE_NONE
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_CTXDMA      ERROR_NOTIFIER_TYPE_CTXDMA
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ERROR_NOTIFIER_TYPE_MEMORY      ERROR_NOTIFIER_TYPE_MEMORY
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE         5:4
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_UNKNOWN ERROR_NOTIFIER_TYPE_UNKNOWN
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_NONE    ERROR_NOTIFIER_TYPE_NONE
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_CTXDMA  ERROR_NOTIFIER_TYPE_CTXDMA
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_ECC_ERROR_NOTIFIER_TYPE_MEMORY  ERROR_NOTIFIER_TYPE_MEMORY
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_GSP_OWNED                       6:6
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_GSP_OWNED_NO                    0x0
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_GSP_OWNED_YES                   0x1
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_UVM_OWNED                       7:7
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_UVM_OWNED_NO                    0x0
+#define NV_KERNELCHANNEL_ALLOC_INTERNALFLAGS_UVM_OWNED_YES                   0x1
+
+typedef struct rpc_rc_triggered_v17_02
+{
+    NvU32      nv2080EngineType;
+    NvU32      chid;
+    NvU32      gfid;
+    NvU32      exceptLevel;
+    NvU32      exceptType;
+    NvU32      scope;
+    NvU16      partitionAttributionId;
+    NvU32      mmuFaultAddrLo;
+    NvU32      mmuFaultAddrHi;
+    NvU32      mmuFaultType;
+    NvBool     bCallbackNeeded;
+    NvU32      rcJournalBufferSize;
+    NvU8       rcJournalBuffer[];
+} rpc_rc_triggered_v17_02;
+
+#define NV2080_CTRL_GPU_MAX_CONSTRUCTED_FALCONS         0x40
+
+typedef struct NV2080_CTRL_GPU_CONSTRUCTED_FALCON_INFO {
+    NvU32 engDesc;
+    NvU32 ctxAttr;
+    NvU32 ctxBufferSize;
+    NvU32 addrSpaceList;
+    NvU32 registerBase;
+} NV2080_CTRL_GPU_CONSTRUCTED_FALCON_INFO;
+
+#define NV2080_CTRL_CMD_GPU_GET_CONSTRUCTED_FALCON_INFO (0x208001b0) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GPU_INTERFACE_ID << 8) | NV2080_CTRL_GPU_GET_CONSTRUCTED_FALCON_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_GPU_GET_CONSTRUCTED_FALCON_INFO_PARAMS {
+    NvU32                                   numConstructedFalcons;
+    NV2080_CTRL_GPU_CONSTRUCTED_FALCON_INFO constructedFalconsTable[NV2080_CTRL_GPU_MAX_CONSTRUCTED_FALCONS];
+} NV2080_CTRL_GPU_GET_CONSTRUCTED_FALCON_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_CMD_INTERNAL_FIFO_TOGGLE_ACTIVE_CHANNEL_SCHEDULING_PARAMS {
+    NvBool bDisableActiveChannels;
+} NV2080_CTRL_CMD_INTERNAL_FIFO_TOGGLE_ACTIVE_CHANNEL_SCHEDULING_PARAMS;
+
+#define NV2080_CTRL_CMD_INTERNAL_FIFO_TOGGLE_ACTIVE_CHANNEL_SCHEDULING (0x20800ac3) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_CMD_INTERNAL_FIFO_TOGGLE_ACTIVE_CHANNEL_SCHEDULING_PARAMS_MESSAGE_ID" */
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
new file mode 100644
index 000000000000..221ac0f2acc6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gr.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_GR_H__
+#define __NVRM_GR_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#define NV2080_CTRL_CMD_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO (0x20800a32) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_INTERNAL_INTERFACE_ID << 8) | NV2080_CTRL_INTERNAL_STATIC_KGR_GET_CONTEXT_BUFFERS_INFO_PARAMS_MESSAGE_ID" */
+
+#define NV2080_CTRL_INTERNAL_GR_MAX_ENGINES         8
+
+#define NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT 0x1a
+
+typedef struct NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO {
+    NvU32 size;
+    NvU32 alignment;
+} NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO;
+
+typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO {
+    NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_BUFFER_INFO engine[NV2080_CTRL_INTERNAL_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT];
+} NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO;
+
+typedef struct NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS {
+    NV2080_CTRL_INTERNAL_STATIC_GR_CONTEXT_BUFFERS_INFO engineContextBuffersInfo[NV2080_CTRL_INTERNAL_GR_MAX_ENGINES];
+} NV2080_CTRL_INTERNAL_STATIC_GR_GET_CONTEXT_BUFFERS_INFO_PARAMS;
+
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID                          4:0
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS                 (0x00000000)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_VLD                      (0x00000001)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_VIDEO                    (0x00000002)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_MPEG                     (0x00000003)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_CAPTURE                  (0x00000004)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_DISPLAY                  (0x00000005)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_ENCRYPTION               (0x00000006)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_POSTPROCESS              (0x00000007)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ZCULL           (0x00000008)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PM              (0x00000009)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COMPUTE_PREEMPT          (0x0000000a)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PREEMPT         (0x0000000b)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_SPILL           (0x0000000c)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PAGEPOOL        (0x0000000d)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_BETACB          (0x0000000e)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_RTV             (0x0000000f)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PATCH           (0x00000010)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_BUNDLE_CB       (0x00000011)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PAGEPOOL_GLOBAL (0x00000012)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_ATTRIBUTE_CB    (0x00000013)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_RTV_CB_GLOBAL   (0x00000014)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_GFXP_POOL       (0x00000015)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_GFXP_CTRL_BLK   (0x00000016)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_FECS_EVENT      (0x00000017)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_PRIV_ACCESS_MAP (0x00000018)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_GRAPHICS_SETUP           (0x00000019)
+#define NV0080_CTRL_FIFO_GET_ENGINE_CONTEXT_PROPERTIES_ENGINE_ID_COUNT                    (0x0000001a)
+
+#define NV2080_CTRL_CMD_GPU_GET_FERMI_GPC_INFO (0x20800137U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GPU_INTERFACE_ID << 8) | NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS {
+    NvU32 gpcMask;
+} NV2080_CTRL_GPU_GET_FERMI_GPC_INFO_PARAMS;
+
+#define NV2080_CTRL_CMD_GPU_GET_FERMI_TPC_INFO (0x20800138U) /* finn: Evaluated from "(FINN_NV20_SUBDEVICE_0_GPU_INTERFACE_ID << 8) | NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS_MESSAGE_ID" */
+typedef struct NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS {
+    NvU32 gpcId;
+    NvU32 tpcMask;
+} NV2080_CTRL_GPU_GET_FERMI_TPC_INFO_PARAMS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
new file mode 100644
index 000000000000..4685a898fac6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h
@@ -0,0 +1,576 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_GSP_H__
+#define __NVRM_GSP_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES 16U
+
+#define NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES           17U
+
+typedef NvBool NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MEM_TYPES];
+
+typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    NV_DECLARE_ALIGNED(NvU64 base, 8);
+    NV_DECLARE_ALIGNED(NvU64 limit, 8);
+    NV_DECLARE_ALIGNED(NvU64 reserved, 8);
+    NvU32                                                  performance;
+    NvBool                                                 supportCompressed;
+    NvBool                                                 supportISO;
+    NvBool                                                 bProtected;
+    NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG blackList;
+} NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO;
+
+typedef struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    NvU32 numFBRegions;
+    NV_DECLARE_ALIGNED(NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO fbRegion[NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_MAX_ENTRIES], 8);
+} NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
+
+#define NV0080_CTRL_GR_CAPS_TBL_SIZE            23
+
+#define NV2080_GPU_MAX_GID_LENGTH             (0x000000100ULL)
+
+typedef struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    NvU32 index;
+    NvU32 flags;
+    NvU32 length;
+    NvU8  data[NV2080_GPU_MAX_GID_LENGTH];
+} NV2080_CTRL_GPU_GET_GID_INFO_PARAMS;
+
+typedef struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
+    NvU32 BoardID;
+    char  chipSKU[9];
+    char  chipSKUMod[5];
+    NvU32 skuConfigVersion;
+    char  project[5];
+    char  projectSKU[5];
+    char  CDP[6];
+    char  projectSKUMod[2];
+    NvU32 businessCycle;
+} NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS;
+
+#define MAX_GPC_COUNT           32
+
+typedef struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
+    NvU32  totalVFs;
+    NvU32  firstVfOffset;
+    NvU32  vfFeatureMask;
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar0Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar1Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 FirstVFBar2Address, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar0Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar1Size, 8);
+    NV_DECLARE_ALIGNED(NvU64 bar2Size, 8);
+    NvBool b64bitBar0;
+    NvBool b64bitBar1;
+    NvBool b64bitBar2;
+    NvBool bSriovEnabled;
+    NvBool bSriovHeavyEnabled;
+    NvBool bEmulateVFBar0TlbInvalidationRegister;
+    NvBool bClientRmAllocatedCtxBuffer;
+    NvBool bNonPowerOf2ChannelCountSupported;
+    NvBool bVfResizableBAR1Supported;
+} NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS;
+
+#include "engine.h"
+
+#define NVGPU_ENGINE_CAPS_MASK_BITS                32
+
+#define NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX           ((RM_ENGINE_TYPE_LAST-1)/NVGPU_ENGINE_CAPS_MASK_BITS + 1)
+
+#define NV2080_GPU_MAX_NAME_STRING_LENGTH                  (0x0000040U)
+
+typedef struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS 
+{
+    NvU32 numHeads;
+    NvU32 maxNumHeads;
+} VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS;
+
+typedef struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS 
+{
+    NvU32 headIndex;
+    NvU32 maxHResolution;
+    NvU32 maxVResolution;
+} VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS;
+
+#define MAX_GROUP_COUNT 2
+
+typedef struct
+{
+    NvU32 ecidLow;
+    NvU32 ecidHigh;
+    NvU32 ecidExtended;
+} EcidManufacturingInfo;
+
+typedef struct
+{
+    NvU64 nonWprHeapOffset;
+    NvU64 frtsOffset;
+} FW_WPR_LAYOUT_OFFSET;
+
+typedef struct GspStaticConfigInfo_t
+{
+    NvU8 grCapsBits[NV0080_CTRL_GR_CAPS_TBL_SIZE];
+    NV2080_CTRL_GPU_GET_GID_INFO_PARAMS gidInfo;
+    NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS SKUInfo;
+    NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS fbRegionInfoParams;
+
+    NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS sriovCaps;
+    NvU32 sriovMaxGfid;
+
+    NvU32 engineCaps[NVGPU_ENGINE_CAPS_MASK_ARRAY_MAX];
+
+    NvBool poisonFuseEnabled;
+
+    NvU64 fb_length;
+    NvU64 fbio_mask;
+    NvU32 fb_bus_width;
+    NvU32 fb_ram_type;
+    NvU64 fbp_mask;
+    NvU32 l2_cache_size;
+
+    NvU8 gpuNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvU8 gpuShortNameString[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvU16 gpuNameString_Unicode[NV2080_GPU_MAX_NAME_STRING_LENGTH];
+    NvBool bGpuInternalSku;
+    NvBool bIsQuadroGeneric;
+    NvBool bIsQuadroAd;
+    NvBool bIsNvidiaNvs;
+    NvBool bIsVgx;
+    NvBool bGeforceSmb;
+    NvBool bIsTitan;
+    NvBool bIsTesla;
+    NvBool bIsMobile;
+    NvBool bIsGc6Rtd3Allowed;
+    NvBool bIsGc8Rtd3Allowed;
+    NvBool bIsGcOffRtd3Allowed;
+    NvBool bIsGcoffLegacyAllowed;
+    NvBool bIsMigSupported;
+
+    /* "Total Board Power" refers to power requirement of GPU,
+     * while in GC6 state. Majority of this power will be used
+     * to keep V-RAM active to preserve its content.
+     * Some energy maybe consumed by Always-on components on GPU chip.
+     * This power will be provided by 3.3v voltage rail.
+     */
+    NvU16  RTD3GC6TotalBoardPower;
+
+    /* PERST# (i.e. PCI Express Reset) is a sideband signal
+     * generated by the PCIe Host to indicate the PCIe devices,
+     * that the power-rails and the reference-clock are stable.
+     * The endpoint device typically uses this signal as a global reset.
+     */
+    NvU16  RTD3GC6PerstDelay;
+
+    NvU64 bar1PdeBase;
+    NvU64 bar2PdeBase;
+
+    NvBool bVbiosValid;
+    NvU32 vbiosSubVendor;
+    NvU32 vbiosSubDevice;
+
+    NvBool bPageRetirementSupported;
+
+    NvBool bSplitVasBetweenServerClientRm;
+
+    NvBool bClRootportNeedsNosnoopWAR;
+
+    VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS displaylessMaxHeads;
+    VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS displaylessMaxResolution;
+    NvU64 displaylessMaxPixels;
+
+    // Client handle for internal RMAPI control.
+    NvHandle hInternalClient;
+
+    // Device handle for internal RMAPI control.
+    NvHandle hInternalDevice;
+
+    // Subdevice handle for internal RMAPI control.
+    NvHandle hInternalSubdevice;
+
+    NvBool bSelfHostedMode;
+    NvBool bAtsSupported;
+
+    NvBool bIsGpuUefi;
+    NvBool bIsEfiInit;
+
+    EcidManufacturingInfo ecidInfo[MAX_GROUP_COUNT];
+
+    FW_WPR_LAYOUT_OFFSET fwWprLayoutOffset;
+} GspStaticConfigInfo;
+
+typedef struct
+{
+    NvU16               deviceID;           // deviceID
+    NvU16               vendorID;           // vendorID
+    NvU16               subdeviceID;        // subsystem deviceID
+    NvU16               subvendorID;        // subsystem vendorID
+    NvU8                revisionID;         // revision ID
+} BUSINFO;
+
+#define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
+
+typedef struct DOD_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     acpiIdListLen;
+    NvU32     acpiIdList[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+} DOD_METHOD_DATA;
+
+typedef struct JT_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     jtCaps;
+    NvU16     jtRevId;
+    NvBool    bSBIOSCaps;
+} JT_METHOD_DATA;
+
+typedef struct MUX_METHOD_DATA_ELEMENT
+{
+    NvU32       acpiId;
+    NvU32       mode;
+    NV_STATUS   status;
+} MUX_METHOD_DATA_ELEMENT;
+
+#define NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS             (16U)
+
+typedef struct MUX_METHOD_DATA
+{
+    NvU32                       tableLen;
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxModeTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxPartTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];
+    MUX_METHOD_DATA_ELEMENT     acpiIdMuxStateTable[NV0073_CTRL_SYSTEM_ACPI_ID_MAP_MAX_DISPLAYS];    
+} MUX_METHOD_DATA;
+
+typedef struct CAPS_METHOD_DATA
+{
+    NV_STATUS status;
+    NvU32     optimusCaps;
+} CAPS_METHOD_DATA;
+
+typedef struct ACPI_METHOD_DATA
+{
+    NvBool                                               bValid;
+    DOD_METHOD_DATA                                      dodMethodData;
+    JT_METHOD_DATA                                       jtMethodData;
+    MUX_METHOD_DATA                                      muxMethodData;
+    CAPS_METHOD_DATA                                     capsMethodData;
+} ACPI_METHOD_DATA;
+
+typedef struct GSP_VF_INFO
+{
+    NvU32  totalVFs;
+    NvU32  firstVFOffset;
+    NvU64  FirstVFBar0Address;
+    NvU64  FirstVFBar1Address;
+    NvU64  FirstVFBar2Address;
+    NvBool b64bitBar0;
+    NvBool b64bitBar1;
+    NvBool b64bitBar2;
+} GSP_VF_INFO;
+
+typedef struct
+{
+    // Link capabilities
+    NvU32 linkCap;
+} GSP_PCIE_CONFIG_REG;
+
+typedef struct GspSystemInfo
+{
+    NvU64 gpuPhysAddr;
+    NvU64 gpuPhysFbAddr;
+    NvU64 gpuPhysInstAddr;
+    NvU64 gpuPhysIoAddr;
+    NvU64 nvDomainBusDeviceFunc;
+    NvU64 simAccessBufPhysAddr;
+    NvU64 notifyOpSharedSurfacePhysAddr;
+    NvU64 pcieAtomicsOpMask;
+    NvU64 consoleMemSize;
+    NvU64 maxUserVa;
+    NvU32 pciConfigMirrorBase;
+    NvU32 pciConfigMirrorSize;
+    NvU32 PCIDeviceID;
+    NvU32 PCISubDeviceID;
+    NvU32 PCIRevisionID;
+    NvU32 pcieAtomicsCplDeviceCapMask;
+    NvU8 oorArch;
+    NvU64 clPdbProperties;
+    NvU32 Chipset;
+    NvBool bGpuBehindBridge;
+    NvBool bFlrSupported;
+    NvBool b64bBar0Supported;
+    NvBool bMnocAvailable;
+    NvU32  chipsetL1ssEnable;
+    NvBool bUpstreamL0sUnsupported;
+    NvBool bUpstreamL1Unsupported;
+    NvBool bUpstreamL1PorSupported;
+    NvBool bUpstreamL1PorMobileOnly;
+    NvBool bSystemHasMux;
+    NvU8   upstreamAddressValid;
+    BUSINFO FHBBusInfo;
+    BUSINFO chipsetIDInfo;
+    ACPI_METHOD_DATA acpiMethodData;
+    NvU32 hypervisorType;
+    NvBool bIsPassthru;
+    NvU64 sysTimerOffsetNs;
+    GSP_VF_INFO gspVFInfo;
+    NvBool bIsPrimary;
+    NvBool isGridBuild;
+    GSP_PCIE_CONFIG_REG pcieConfigReg;
+    NvU32 gridBuildCsp;
+    NvBool bPreserveVideoMemoryAllocations;
+    NvBool bTdrEventSupported;
+    NvBool bFeatureStretchVblankCapable;
+    NvBool bEnableDynamicGranularityPageArrays;
+    NvBool bClockBoostSupported;
+    NvBool bRouteDispIntrsToCPU;
+    NvU64  hostPageSize;
+} GspSystemInfo;
+
+typedef struct rpc_os_error_log_v17_00
+{
+    NvU32      exceptType;
+    NvU32      runlistId;
+    NvU32      chid;
+    char       errString[0x100];
+    NvU32      preemptiveRemovalPreviousXid;
+} rpc_os_error_log_v17_00;
+
+typedef struct
+{
+    // Magic
+    // BL to use for verification (i.e. Booter locked it in WPR2)
+    NvU64 magic; // = 0xdc3aae21371a60b3;
+
+    // Revision number of Booter-BL-Sequencer handoff interface
+    // Bumped up when we change this interface so it is not backward compatible.
+    // Bumped up when we revoke GSP-RM ucode
+    NvU64 revision; // = 1;
+
+    // ---- Members regarding data in SYSMEM ----------------------------
+    // Consumed by Booter for DMA
+
+    NvU64 sysmemAddrOfRadix3Elf;
+    NvU64 sizeOfRadix3Elf;
+
+    NvU64 sysmemAddrOfBootloader;
+    NvU64 sizeOfBootloader;
+
+    // Offsets inside bootloader image needed by Booter
+    NvU64 bootloaderCodeOffset;
+    NvU64 bootloaderDataOffset;
+    NvU64 bootloaderManifestOffset;
+
+    union
+    {
+        // Used only at initial boot
+        struct
+        {
+            NvU64 sysmemAddrOfSignature;
+            NvU64 sizeOfSignature;
+        };
+
+        //
+        // Used at suspend/resume to read GspFwHeapFreeList
+        // Offset relative to GspFwWprMeta FBMEM PA (gspFwWprStart)
+        //
+        struct
+        {
+            NvU32 gspFwHeapFreeListWprOffset;
+            NvU32 unused0;
+            NvU64 unused1;
+        };
+    };
+
+    // ---- Members describing FB layout --------------------------------
+    NvU64 gspFwRsvdStart;
+
+    NvU64 nonWprHeapOffset;
+    NvU64 nonWprHeapSize;
+
+    NvU64 gspFwWprStart;
+
+    // GSP-RM to use to setup heap.
+    NvU64 gspFwHeapOffset;
+    NvU64 gspFwHeapSize;
+
+    // BL to use to find ELF for jump
+    NvU64 gspFwOffset;
+    // Size is sizeOfRadix3Elf above.
+
+    NvU64 bootBinOffset;
+    // Size is sizeOfBootloader above.
+
+    NvU64 frtsOffset;
+    NvU64 frtsSize;
+
+    NvU64 gspFwWprEnd;
+
+    // GSP-RM to use for fbRegionInfo?
+    NvU64 fbSize;
+
+    // ---- Other members -----------------------------------------------
+
+    // GSP-RM to use for fbRegionInfo?
+    NvU64 vgaWorkspaceOffset;
+    NvU64 vgaWorkspaceSize;
+
+    // Boot count.  Used to determine whether to load the firmware image.
+    NvU64 bootCount;
+
+    // This union is organized the way it is to start at an 8-byte boundary and achieve natural
+    // packing of the internal struct fields.
+    union
+    {
+        struct
+        {
+            // TODO: the partitionRpc* fields below do not really belong in this
+            //       structure. The values are patched in by the partition bootstrapper
+            //       when GSP-RM is booted in a partition, and this structure was a
+            //       convenient place for the bootstrapper to access them. These should
+            //       be moved to a different comm. mechanism between the bootstrapper
+            //       and the GSP-RM tasks.
+
+            // Shared partition RPC memory (physical address)
+            NvU64 partitionRpcAddr;
+
+            // Offsets relative to partitionRpcAddr
+            NvU16 partitionRpcRequestOffset;
+            NvU16 partitionRpcReplyOffset;
+
+            // Code section and dataSection offset and size.
+            NvU32 elfCodeOffset;
+            NvU32 elfDataOffset;
+            NvU32 elfCodeSize;
+            NvU32 elfDataSize;
+
+            // Used during GSP-RM resume to check for revocation
+            NvU32 lsUcodeVersion;
+        };
+
+        struct
+        {
+            // Pad for the partitionRpc* fields, plus 4 bytes
+            NvU32 partitionRpcPadding[4];
+
+            // CrashCat (contiguous) buffer size/location - occupies same bytes as the
+            // elf(Code|Data)(Offset|Size) fields above.
+            // TODO: move to GSP_FMC_INIT_PARAMS
+            NvU64 sysmemAddrOfCrashReportQueue;
+            NvU32 sizeOfCrashReportQueue;
+
+            // Pad for the lsUcodeVersion field
+            NvU32 lsUcodeVersionPadding[1];
+        };
+    };
+
+    // Number of VF partitions allocating sub-heaps from the WPR heap
+    // Used during boot to ensure the heap is adequately sized
+    NvU8 gspFwHeapVfPartitionCount;
+
+    // Flags to help decide GSP-FW flow.
+    NvU8 flags;
+
+    // Pad structure to exactly 256 bytes.  Can replace padding with additional
+    // fields without incrementing revision.  Padding initialized to 0.
+    NvU8 padding[2];
+
+    //
+    // Starts at gspFwWprEnd+frtsSize b/c FRTS is positioned
+    // to end where this allocation starts (when RM requests FSP to create
+    // FRTS).
+    //
+    NvU32 pmuReservedSize;
+
+    // BL to use for verification (i.e. Booter says OK to boot)
+    NvU64 verified;  // 0x0 -> unverified, 0xa0a0a0a0a0a0a0a0 -> verified
+} GspFwWprMeta;
+
+#define GSP_FW_WPR_META_MAGIC     0xdc3aae21371a60b3ULL
+
+#define GSP_FW_WPR_META_REVISION  1
+
+typedef struct {
+    NvU64 sharedMemPhysAddr;
+    NvU32 pageTableEntryCount;
+    NvLength cmdQueueOffset;
+    NvLength statQueueOffset;
+} MESSAGE_QUEUE_INIT_ARGUMENTS;
+
+typedef struct {
+    NvU32 oldLevel;
+    NvU32 flags;
+    NvBool bInPMTransition;
+} GSP_SR_INIT_ARGUMENTS;
+
+typedef struct
+{
+    MESSAGE_QUEUE_INIT_ARGUMENTS      messageQueueInitArguments;
+    GSP_SR_INIT_ARGUMENTS             srInitArguments;
+    NvU32                             gpuInstance;
+    NvBool                            bDmemStack;
+
+    struct
+    {
+        NvU64                         pa;
+        NvU64                         size;
+    } profilerArgs;
+} GSP_ARGUMENTS_CACHED;
+
+#define NV2080_CTRL_GPU_SET_POWER_STATE_GPU_LEVEL_3            (0x00000003U)
+
+typedef struct
+{
+    // Magic for verification by secure ucode
+    NvU64 magic;  // = GSP_FW_SR_META_MAGIC;
+
+    //
+    // Revision number
+    // Bumped up when we change this interface so it is not backward compatible.
+    //
+    NvU64 revision;  // = GSP_FW_SR_META_MAGIC_REVISION;
+
+    // Members regarding data in SYSMEM
+    NvU64 sysmemAddrOfSuspendResumeData;
+    NvU64 sizeOfSuspendResumeData;
+
+    //
+    // Internal members for use by secure ucode
+    // Must be exactly GSP_FW_SR_META_INTERNAL_SIZE bytes.
+    //
+    NvU32 internal[32];
+
+    // Same as flags of GspFwWprMeta
+    NvU32 flags;
+
+    // Subrevision number used by secure ucode
+    NvU32 subrevision;
+
+    //
+    // Pad structure to exactly 256 bytes (1 DMA chunk).
+    // Padding initialized to zero.
+    //
+    NvU32 padding[22];
+} GspFwSRMeta;
+
+#define GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2                   (0 << 20)   // No FB heap usage
+
+#define GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL        (22 << 20)
+
+#define GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X               (8 << 20)   // Turing thru Ada
+
+#define GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB                (64u)
+
+#define BULLSEYE_ROOT_HEAP_ALLOC_RM_DATA_SECTION_SIZE_DELTA         (12u)
+
+#define BULLSEYE_ROOT_HEAP_ALLOC_BAREMETAL_LIBOS_HEAP_SIZE_DELTA    (70u)
+
+#define GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB \
+                                    (88u + (BULLSEYE_ROOT_HEAP_ALLOC_RM_DATA_SECTION_SIZE_DELTA) + \
+                                    (BULLSEYE_ROOT_HEAP_ALLOC_BAREMETAL_LIBOS_HEAP_SIZE_DELTA))
+
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h
new file mode 100644
index 000000000000..e06643f57695
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/msgfn.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_MSGFN_H__
+#define __NVRM_MSGFN_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#ifndef E
+#    define E(RPC, VAL) NV_VGPU_MSG_EVENT_##RPC = VAL,
+#    define DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+enum {
+#endif
+    E(FIRST_EVENT,                                            0x1000)
+    E(GSP_INIT_DONE,                                          0x1001)
+    E(GSP_RUN_CPU_SEQUENCER,                                  0x1002)
+    E(POST_EVENT,                                             0x1003)
+    E(RC_TRIGGERED,                                           0x1004)
+    E(MMU_FAULT_QUEUED,                                       0x1005)
+    E(OS_ERROR_LOG,                                           0x1006)
+    E(RG_LINE_INTR,                                           0x1007)
+    E(GPUACCT_PERFMON_UTIL_SAMPLES,                           0x1008)
+    E(SIM_READ,                                               0x1009)
+    E(SIM_WRITE,                                              0x100a)
+    E(SEMAPHORE_SCHEDULE_CALLBACK,                            0x100b)
+    E(UCODE_LIBOS_PRINT,                                      0x100c)
+    E(VGPU_GSP_PLUGIN_TRIGGERED,                              0x100d)
+    E(PERF_GPU_BOOST_SYNC_LIMITS_CALLBACK,                    0x100e)
+    E(PERF_BRIDGELESS_INFO_UPDATE,                            0x100f)
+    E(VGPU_CONFIG,                                            0x1010)
+    E(DISPLAY_MODESET,                                        0x1011)
+    E(EXTDEV_INTR_SERVICE,                                    0x1012)
+    E(NVLINK_INBAND_RECEIVED_DATA_256,                        0x1013)
+    E(NVLINK_INBAND_RECEIVED_DATA_512,                        0x1014)
+    E(NVLINK_INBAND_RECEIVED_DATA_1024,                       0x1015)
+    E(NVLINK_INBAND_RECEIVED_DATA_2048,                       0x1016)
+    E(NVLINK_INBAND_RECEIVED_DATA_4096,                       0x1017)
+    E(TIMED_SEMAPHORE_RELEASE,                                0x1018)
+    E(NVLINK_IS_GPU_DEGRADED,                                 0x1019)
+    E(PFM_REQ_HNDLR_STATE_SYNC_CALLBACK,                      0x101a)
+    E(NVLINK_FAULT_UP,                                        0x101b)
+    E(GSP_LOCKDOWN_NOTICE,                                    0x101c)
+    E(MIG_CI_CONFIG_UPDATE,                                   0x101d)
+    E(UPDATE_GSP_TRACE,                                       0x101e)
+    E(NVLINK_FATAL_ERROR_RECOVERY,                            0x101f)
+    E(GSP_POST_NOCAT_RECORD,                                  0x1020)
+    E(FECS_ERROR,                                             0x1021)
+    E(RECOVERY_ACTION,                                        0x1022)
+    E(NUM_EVENTS,                                             0x1023)
+#ifdef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+};
+#   undef E
+#   undef DEFINING_E_IN_RPC_GLOBAL_ENUMS_H
+#endif
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ofa.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ofa.h
new file mode 100644
index 000000000000..fcaef7f553a6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/ofa.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_OFA_H__
+#define __NVRM_OFA_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+typedef struct
+{
+    NvU32 size;
+    NvU32 prohibitMultipleInstances;  // Prohibit multiple allocations of OFA?
+    NvU32 engineInstance;
+} NV_OFA_ALLOCATION_PARAMETERS;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h
new file mode 100644
index 000000000000..2d67b598c58b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/rpcfn.h
@@ -0,0 +1,249 @@
+/* SPDX-License-Identifier: MIT */
+
+/* Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved. */
+
+#ifndef __NVRM_RPCFN_H__
+#define __NVRM_RPCFN_H__
+#include <nvrm/nvtypes.h>
+
+/* Excerpt of RM headers from https://github.com/NVIDIA/open-gpu-kernel-modules/tree/570.144 */
+
+#ifndef X
+#    define X(UNIT, RPC, VAL) NV_VGPU_MSG_FUNCTION_##RPC = VAL,
+#    define DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
+enum {
+#endif
+    X(RM, NOP,                                                    0)
+    X(RM, SET_GUEST_SYSTEM_INFO,                                  1)
+    X(RM, ALLOC_ROOT,                                             2)
+    X(RM, ALLOC_DEVICE,                                           3) // deprecated
+    X(RM, ALLOC_MEMORY,                                           4)
+    X(RM, ALLOC_CTX_DMA,                                          5)
+    X(RM, ALLOC_CHANNEL_DMA,                                      6)
+    X(RM, MAP_MEMORY,                                             7)
+    X(RM, BIND_CTX_DMA,                                           8) // deprecated
+    X(RM, ALLOC_OBJECT,                                           9)
+    X(RM, FREE,                                                   10)
+    X(RM, LOG,                                                    11)
+    X(RM, ALLOC_VIDMEM,                                           12)
+    X(RM, UNMAP_MEMORY,                                           13)
+    X(RM, MAP_MEMORY_DMA,                                         14)
+    X(RM, UNMAP_MEMORY_DMA,                                       15)
+    X(RM, GET_EDID,                                               16) // deprecated
+    X(RM, ALLOC_DISP_CHANNEL,                                     17)
+    X(RM, ALLOC_DISP_OBJECT,                                      18)
+    X(RM, ALLOC_SUBDEVICE,                                        19)
+    X(RM, ALLOC_DYNAMIC_MEMORY,                                   20)
+    X(RM, DUP_OBJECT,                                             21)
+    X(RM, IDLE_CHANNELS,                                          22)
+    X(RM, ALLOC_EVENT,                                            23)
+    X(RM, SEND_EVENT,                                             24) // deprecated
+    X(RM, REMAPPER_CONTROL,                                       25) // deprecated
+    X(RM, DMA_CONTROL,                                            26) // deprecated
+    X(RM, DMA_FILL_PTE_MEM,                                       27)
+    X(RM, MANAGE_HW_RESOURCE,                                     28)
+    X(RM, BIND_ARBITRARY_CTX_DMA,                                 29) // deprecated
+    X(RM, CREATE_FB_SEGMENT,                                      30)
+    X(RM, DESTROY_FB_SEGMENT,                                     31)
+    X(RM, ALLOC_SHARE_DEVICE,                                     32)
+    X(RM, DEFERRED_API_CONTROL,                                   33)
+    X(RM, REMOVE_DEFERRED_API,                                    34)
+    X(RM, SIM_ESCAPE_READ,                                        35)
+    X(RM, SIM_ESCAPE_WRITE,                                       36)
+    X(RM, SIM_MANAGE_DISPLAY_CONTEXT_DMA,                         37)
+    X(RM, FREE_VIDMEM_VIRT,                                       38)
+    X(RM, PERF_GET_PSTATE_INFO,                                   39) // deprecated
+    X(RM, PERF_GET_PERFMON_SAMPLE,                                40)
+    X(RM, PERF_GET_VIRTUAL_PSTATE_INFO,                           41) // deprecated
+    X(RM, PERF_GET_LEVEL_INFO,                                    42)
+    X(RM, MAP_SEMA_MEMORY,                                        43)
+    X(RM, UNMAP_SEMA_MEMORY,                                      44)
+    X(RM, SET_SURFACE_PROPERTIES,                                 45)
+    X(RM, CLEANUP_SURFACE,                                        46)
+    X(RM, UNLOADING_GUEST_DRIVER,                                 47)
+    X(RM, TDR_SET_TIMEOUT_STATE,                                  48)
+    X(RM, SWITCH_TO_VGA,                                          49)
+    X(RM, GPU_EXEC_REG_OPS,                                       50)
+    X(RM, GET_STATIC_INFO,                                        51)
+    X(RM, ALLOC_VIRTMEM,                                          52)
+    X(RM, UPDATE_PDE_2,                                           53)
+    X(RM, SET_PAGE_DIRECTORY,                                     54)
+    X(RM, GET_STATIC_PSTATE_INFO,                                 55)
+    X(RM, TRANSLATE_GUEST_GPU_PTES,                               56)
+    X(RM, RESERVED_57,                                            57)
+    X(RM, RESET_CURRENT_GR_CONTEXT,                               58)
+    X(RM, SET_SEMA_MEM_VALIDATION_STATE,                          59)
+    X(RM, GET_ENGINE_UTILIZATION,                                 60)
+    X(RM, UPDATE_GPU_PDES,                                        61)
+    X(RM, GET_ENCODER_CAPACITY,                                   62)
+    X(RM, VGPU_PF_REG_READ32,                                     63) // deprecated
+    X(RM, SET_GUEST_SYSTEM_INFO_EXT,                              64)
+    X(GSP, GET_GSP_STATIC_INFO,                                   65)
+    X(RM, RMFS_INIT,                                              66) // deprecated
+    X(RM, RMFS_CLOSE_QUEUE,                                       67) // deprecated
+    X(RM, RMFS_CLEANUP,                                           68) // deprecated
+    X(RM, RMFS_TEST,                                              69) // deprecated
+    X(RM, UPDATE_BAR_PDE,                                         70)
+    X(RM, CONTINUATION_RECORD,                                    71)
+    X(RM, GSP_SET_SYSTEM_INFO,                                    72)
+    X(RM, SET_REGISTRY,                                           73)
+    X(GSP, GSP_INIT_POST_OBJGPU,                                  74) // deprecated
+    X(RM, SUBDEV_EVENT_SET_NOTIFICATION,                          75) // deprecated
+    X(GSP, GSP_RM_CONTROL,                                        76)
+    X(RM, GET_STATIC_INFO2,                                       77)
+    X(RM, DUMP_PROTOBUF_COMPONENT,                                78)
+    X(RM, UNSET_PAGE_DIRECTORY,                                   79)
+    X(RM, GET_CONSOLIDATED_STATIC_INFO,                           80) // deprecated
+    X(RM, GMMU_REGISTER_FAULT_BUFFER,                             81) // deprecated
+    X(RM, GMMU_UNREGISTER_FAULT_BUFFER,                           82) // deprecated
+    X(RM, GMMU_REGISTER_CLIENT_SHADOW_FAULT_BUFFER,               83) // deprecated
+    X(RM, GMMU_UNREGISTER_CLIENT_SHADOW_FAULT_BUFFER,             84) // deprecated
+    X(RM, CTRL_SET_VGPU_FB_USAGE,                                 85)
+    X(RM, CTRL_NVFBC_SW_SESSION_UPDATE_INFO,                      86)
+    X(RM, CTRL_NVENC_SW_SESSION_UPDATE_INFO,                      87)
+    X(RM, CTRL_RESET_CHANNEL,                                     88)
+    X(RM, CTRL_RESET_ISOLATED_CHANNEL,                            89)
+    X(RM, CTRL_GPU_HANDLE_VF_PRI_FAULT,                           90)
+    X(RM, CTRL_CLK_GET_EXTENDED_INFO,                             91)
+    X(RM, CTRL_PERF_BOOST,                                        92)
+    X(RM, CTRL_PERF_VPSTATES_GET_CONTROL,                         93)
+    X(RM, CTRL_GET_ZBC_CLEAR_TABLE,                               94)
+    X(RM, CTRL_SET_ZBC_COLOR_CLEAR,                               95)
+    X(RM, CTRL_SET_ZBC_DEPTH_CLEAR,                               96)
+    X(RM, CTRL_GPFIFO_SCHEDULE,                                   97)
+    X(RM, CTRL_SET_TIMESLICE,                                     98)
+    X(RM, CTRL_PREEMPT,                                           99)
+    X(RM, CTRL_FIFO_DISABLE_CHANNELS,                             100)
+    X(RM, CTRL_SET_TSG_INTERLEAVE_LEVEL,                          101)
+    X(RM, CTRL_SET_CHANNEL_INTERLEAVE_LEVEL,                      102)
+    X(GSP, GSP_RM_ALLOC,                                          103)
+    X(RM, CTRL_GET_P2P_CAPS_V2,                                   104)
+    X(RM, CTRL_CIPHER_AES_ENCRYPT,                                105)
+    X(RM, CTRL_CIPHER_SESSION_KEY,                                106)
+    X(RM, CTRL_CIPHER_SESSION_KEY_STATUS,                         107)
+    X(RM, CTRL_DBG_CLEAR_ALL_SM_ERROR_STATES,                     108)
+    X(RM, CTRL_DBG_READ_ALL_SM_ERROR_STATES,                      109)
+    X(RM, CTRL_DBG_SET_EXCEPTION_MASK,                            110)
+    X(RM, CTRL_GPU_PROMOTE_CTX,                                   111)
+    X(RM, CTRL_GR_CTXSW_PREEMPTION_BIND,                          112)
+    X(RM, CTRL_GR_SET_CTXSW_PREEMPTION_MODE,                      113)
+    X(RM, CTRL_GR_CTXSW_ZCULL_BIND,                               114)
+    X(RM, CTRL_GPU_INITIALIZE_CTX,                                115)
+    X(RM, CTRL_VASPACE_COPY_SERVER_RESERVED_PDES,                 116)
+    X(RM, CTRL_FIFO_CLEAR_FAULTED_BIT,                            117)
+    X(RM, CTRL_GET_LATEST_ECC_ADDRESSES,                          118)
+    X(RM, CTRL_MC_SERVICE_INTERRUPTS,                             119)
+    X(RM, CTRL_DMA_SET_DEFAULT_VASPACE,                           120)
+    X(RM, CTRL_GET_CE_PCE_MASK,                                   121)
+    X(RM, CTRL_GET_ZBC_CLEAR_TABLE_ENTRY,                         122)
+    X(RM, CTRL_GET_NVLINK_PEER_ID_MASK,                           123) // deprecated
+    X(RM, CTRL_GET_NVLINK_STATUS,                                 124)
+    X(RM, CTRL_GET_P2P_CAPS,                                      125)
+    X(RM, CTRL_GET_P2P_CAPS_MATRIX,                               126)
+    X(RM, RESERVED_0,                                             127)
+    X(RM, CTRL_RESERVE_PM_AREA_SMPC,                              128)
+    X(RM, CTRL_RESERVE_HWPM_LEGACY,                               129)
+    X(RM, CTRL_B0CC_EXEC_REG_OPS,                                 130)
+    X(RM, CTRL_BIND_PM_RESOURCES,                                 131)
+    X(RM, CTRL_DBG_SUSPEND_CONTEXT,                               132)
+    X(RM, CTRL_DBG_RESUME_CONTEXT,                                133)
+    X(RM, CTRL_DBG_EXEC_REG_OPS,                                  134)
+    X(RM, CTRL_DBG_SET_MODE_MMU_DEBUG,                            135)
+    X(RM, CTRL_DBG_READ_SINGLE_SM_ERROR_STATE,                    136)
+    X(RM, CTRL_DBG_CLEAR_SINGLE_SM_ERROR_STATE,                   137)
+    X(RM, CTRL_DBG_SET_MODE_ERRBAR_DEBUG,                         138)
+    X(RM, CTRL_DBG_SET_NEXT_STOP_TRIGGER_TYPE,                    139)
+    X(RM, CTRL_ALLOC_PMA_STREAM,                                  140)
+    X(RM, CTRL_PMA_STREAM_UPDATE_GET_PUT,                         141)
+    X(RM, CTRL_FB_GET_INFO_V2,                                    142)
+    X(RM, CTRL_FIFO_SET_CHANNEL_PROPERTIES,                       143)
+    X(RM, CTRL_GR_GET_CTX_BUFFER_INFO,                            144)
+    X(RM, CTRL_KGR_GET_CTX_BUFFER_PTES,                           145)
+    X(RM, CTRL_GPU_EVICT_CTX,                                     146)
+    X(RM, CTRL_FB_GET_FS_INFO,                                    147)
+    X(RM, CTRL_GRMGR_GET_GR_FS_INFO,                              148)
+    X(RM, CTRL_STOP_CHANNEL,                                      149)
+    X(RM, CTRL_GR_PC_SAMPLING_MODE,                               150)
+    X(RM, CTRL_PERF_RATED_TDP_GET_STATUS,                         151)
+    X(RM, CTRL_PERF_RATED_TDP_SET_CONTROL,                        152)
+    X(RM, CTRL_FREE_PMA_STREAM,                                   153)
+    X(RM, CTRL_TIMER_SET_GR_TICK_FREQ,                            154)
+    X(RM, CTRL_FIFO_SETUP_VF_ZOMBIE_SUBCTX_PDB,                   155)
+    X(RM, GET_CONSOLIDATED_GR_STATIC_INFO,                        156)
+    X(RM, CTRL_DBG_SET_SINGLE_SM_SINGLE_STEP,                     157)
+    X(RM, CTRL_GR_GET_TPC_PARTITION_MODE,                         158)
+    X(RM, CTRL_GR_SET_TPC_PARTITION_MODE,                         159)
+    X(UVM, UVM_PAGING_CHANNEL_ALLOCATE,                           160)
+    X(UVM, UVM_PAGING_CHANNEL_DESTROY,                            161)
+    X(UVM, UVM_PAGING_CHANNEL_MAP,                                162)
+    X(UVM, UVM_PAGING_CHANNEL_UNMAP,                              163)
+    X(UVM, UVM_PAGING_CHANNEL_PUSH_STREAM,                        164)
+    X(UVM, UVM_PAGING_CHANNEL_SET_HANDLES,                        165)
+    X(UVM, UVM_METHOD_STREAM_GUEST_PAGES_OPERATION,               166)
+    X(RM, CTRL_INTERNAL_QUIESCE_PMA_CHANNEL,                      167)
+    X(RM, DCE_RM_INIT,                                            168)
+    X(RM, REGISTER_VIRTUAL_EVENT_BUFFER,                          169)
+    X(RM, CTRL_EVENT_BUFFER_UPDATE_GET,                           170)
+    X(RM, GET_PLCABLE_ADDRESS_KIND,                               171)
+    X(RM, CTRL_PERF_LIMITS_SET_STATUS_V2,                         172)
+    X(RM, CTRL_INTERNAL_SRIOV_PROMOTE_PMA_STREAM,                 173)
+    X(RM, CTRL_GET_MMU_DEBUG_MODE,                                174)
+    X(RM, CTRL_INTERNAL_PROMOTE_FAULT_METHOD_BUFFERS,             175)
+    X(RM, CTRL_FLCN_GET_CTX_BUFFER_SIZE,                          176)
+    X(RM, CTRL_FLCN_GET_CTX_BUFFER_INFO,                          177)
+    X(RM, DISABLE_CHANNELS,                                       178)
+    X(RM, CTRL_FABRIC_MEMORY_DESCRIBE,                            179)
+    X(RM, CTRL_FABRIC_MEM_STATS,                                  180)
+    X(RM, SAVE_HIBERNATION_DATA,                                  181)
+    X(RM, RESTORE_HIBERNATION_DATA,                               182)
+    X(RM, CTRL_INTERNAL_MEMSYS_SET_ZBC_REFERENCED,                183)
+    X(RM, CTRL_EXEC_PARTITIONS_CREATE,                            184)
+    X(RM, CTRL_EXEC_PARTITIONS_DELETE,                            185)
+    X(RM, CTRL_GPFIFO_GET_WORK_SUBMIT_TOKEN,                      186)
+    X(RM, CTRL_GPFIFO_SET_WORK_SUBMIT_TOKEN_NOTIF_INDEX,          187)
+    X(RM, PMA_SCRUBBER_SHARED_BUFFER_GUEST_PAGES_OPERATION,       188)
+    X(RM, CTRL_MASTER_GET_VIRTUAL_FUNCTION_ERROR_CONT_INTR_MASK,  189)
+    X(RM, SET_SYSMEM_DIRTY_PAGE_TRACKING_BUFFER,                  190)
+    X(RM, CTRL_SUBDEVICE_GET_P2P_CAPS,                            191)
+    X(RM, CTRL_BUS_SET_P2P_MAPPING,                               192)
+    X(RM, CTRL_BUS_UNSET_P2P_MAPPING,                             193)
+    X(RM, CTRL_FLA_SETUP_INSTANCE_MEM_BLOCK,                      194)
+    X(RM, CTRL_GPU_MIGRATABLE_OPS,                                195)
+    X(RM, CTRL_GET_TOTAL_HS_CREDITS,                              196)
+    X(RM, CTRL_GET_HS_CREDITS,                                    197)
+    X(RM, CTRL_SET_HS_CREDITS,                                    198)
+    X(RM, CTRL_PM_AREA_PC_SAMPLER,                                199)
+    X(RM, INVALIDATE_TLB,                                         200)
+    X(RM, CTRL_GPU_QUERY_ECC_STATUS,                              201) // deprecated
+    X(RM, ECC_NOTIFIER_WRITE_ACK,                                 202)
+    X(RM, CTRL_DBG_GET_MODE_MMU_DEBUG,                            203)
+    X(RM, RM_API_CONTROL,                                         204)
+    X(RM, CTRL_CMD_INTERNAL_GPU_START_FABRIC_PROBE,               205)
+    X(RM, CTRL_NVLINK_GET_INBAND_RECEIVED_DATA,                   206)
+    X(RM, GET_STATIC_DATA,                                        207)
+    X(RM, RESERVED_208,                                           208)
+    X(RM, CTRL_GPU_GET_INFO_V2,                                   209)
+    X(RM, GET_BRAND_CAPS,                                         210)
+    X(RM, CTRL_CMD_NVLINK_INBAND_SEND_DATA,                       211)
+    X(RM, UPDATE_GPM_GUEST_BUFFER_INFO,                           212)
+    X(RM, CTRL_CMD_INTERNAL_CONTROL_GSP_TRACE,                    213)
+    X(RM, CTRL_SET_ZBC_STENCIL_CLEAR,                             214)
+    X(RM, CTRL_SUBDEVICE_GET_VGPU_HEAP_STATS,                     215)
+    X(RM, CTRL_SUBDEVICE_GET_LIBOS_HEAP_STATS,                    216)
+    X(RM, CTRL_DBG_SET_MODE_MMU_GCC_DEBUG,                        217)
+    X(RM, CTRL_DBG_GET_MODE_MMU_GCC_DEBUG,                        218)
+    X(RM, CTRL_RESERVE_HES,                                       219)
+    X(RM, CTRL_RELEASE_HES,                                       220)
+    X(RM, CTRL_RESERVE_CCU_PROF,                                  221)
+    X(RM, CTRL_RELEASE_CCU_PROF,                                  222)
+    X(RM, RESERVED,                                               223)
+    X(RM, CTRL_CMD_GET_CHIPLET_HS_CREDIT_POOL,                    224)
+    X(RM, CTRL_CMD_GET_HS_CREDITS_MAPPING,                        225)
+    X(RM, CTRL_EXEC_PARTITIONS_EXPORT,                            226)
+    X(RM, NUM_FUNCTIONS,                                          227)
+#ifdef DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
+};
+#   undef X
+#   undef DEFINING_X_IN_RPC_GLOBAL_ENUMS_H
+#endif
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c
new file mode 100644
index 000000000000..95b5fe438ade
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/ofa.c
@@ -0,0 +1,45 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/engine.h>
+
+#include "nvrm/ofa.h"
+
+static int
+r570_ofa_alloc(struct nvkm_gsp_object *parent, u32 handle, u32 oclass, int inst,
+	       struct nvkm_gsp_object *ofa)
+{
+	NV_OFA_ALLOCATION_PARAMETERS *args;
+
+	args = nvkm_gsp_rm_alloc_get(parent, handle, oclass, sizeof(*args), ofa);
+	if (WARN_ON(IS_ERR(args)))
+		return PTR_ERR(args);
+
+	args->size = sizeof(*args);
+	args->engineInstance = inst;
+
+	return nvkm_gsp_rm_alloc_wr(ofa, args);
+}
+
+const struct nvkm_rm_api_engine
+r570_ofa = {
+	.alloc = r570_ofa_alloc,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
new file mode 100644
index 000000000000..32c8349c3bd5
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/rm.c
@@ -0,0 +1,68 @@
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include <rm/rm.h>
+
+#include "nvrm/gsp.h"
+
+static const struct nvkm_rm_wpr
+r570_wpr_libos2 = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB,
+};
+
+static const struct nvkm_rm_wpr
+r570_wpr_libos3 = {
+	.os_carveout_size = GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL,
+	.base_size = GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X,
+	.heap_size_min = GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB,
+};
+
+static const struct nvkm_rm_api
+r570_api = {
+	.gsp = &r570_gsp,
+	.rpc = &r535_rpc,
+	.ctrl = &r535_ctrl,
+	.alloc = &r535_alloc,
+	.device = &r535_device,
+	.fbsr = &r570_fbsr,
+	.disp = &r570_disp,
+	.fifo = &r570_fifo,
+	.ce = &r535_ce,
+	.gr = &r570_gr,
+	.nvdec = &r535_nvdec,
+	.nvenc = &r535_nvenc,
+	.nvjpg = &r535_nvjpg,
+	.ofa = &r570_ofa,
+};
+
+const struct nvkm_rm_impl
+r570_rm_tu102 = {
+	.wpr = &r570_wpr_libos2,
+	.api = &r570_api,
+};
+
+const struct nvkm_rm_impl
+r570_rm_ga102 = {
+	.wpr = &r570_wpr_libos3,
+	.api = &r570_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 9e162769cf3a..a8aa9c85db18 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -33,6 +33,7 @@ struct nvkm_rm_api {
 		int (*get_static_info)(struct nvkm_gsp *);
 		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 		void (*drop_send_user_shared_data)(struct nvkm_gsp *);
+		void (*drop_post_nocat_record)(struct nvkm_gsp *);
 		u32 (*sr_data_size)(struct nvkm_gsp *);
 	} *gsp;
 
@@ -121,20 +122,33 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_gr {
 		int (*get_ctxbufs_info)(struct r535_gr *);
 	} *gr;
-
 };
 
 extern const struct nvkm_rm_impl r535_rm_tu102;
 extern const struct nvkm_rm_impl r535_rm_ga102;
 extern const struct nvkm_rm_api_gsp r535_gsp;
+typedef struct DOD_METHOD_DATA DOD_METHOD_DATA;
+typedef struct JT_METHOD_DATA JT_METHOD_DATA;
+typedef struct CAPS_METHOD_DATA CAPS_METHOD_DATA;
+void r535_gsp_acpi_dod(acpi_handle, DOD_METHOD_DATA *);
+void r535_gsp_acpi_jt(acpi_handle, JT_METHOD_DATA *);
+void r535_gsp_acpi_caps(acpi_handle, CAPS_METHOD_DATA *);
+struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS;
+void r535_gsp_get_static_info_fb(struct nvkm_gsp *,
+				 const struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS *);
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
+void r535_gsp_client_dtor(struct nvkm_gsp_client *);
 extern const struct nvkm_rm_api_device r535_device;
 extern const struct nvkm_rm_api_fbsr r535_fbsr;
+void r535_fbsr_resume(struct nvkm_gsp *);
+int r535_fbsr_memlist(struct nvkm_gsp_device *, u32 handle, enum nvkm_memory_target,
+		      u64 phys, u64 size, struct sg_table *, struct nvkm_gsp_object *);
 extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_fifo r535_fifo;
+void r535_fifo_rc_chid(struct nvkm_fifo *, int chid);
 extern const struct nvkm_rm_api_engine r535_ce;
 extern const struct nvkm_rm_api_gr r535_gr;
 void *r535_gr_dtor(struct nvkm_gr *);
@@ -146,4 +160,16 @@ extern const struct nvkm_rm_api_engine r535_nvdec;
 extern const struct nvkm_rm_api_engine r535_nvenc;
 extern const struct nvkm_rm_api_engine r535_nvjpg;
 extern const struct nvkm_rm_api_engine r535_ofa;
+
+extern const struct nvkm_rm_impl r570_rm_tu102;
+extern const struct nvkm_rm_impl r570_rm_ga102;
+extern const struct nvkm_rm_api_gsp r570_gsp;
+extern const struct nvkm_rm_api_client r570_client;
+extern const struct nvkm_rm_api_fbsr r570_fbsr;
+extern const struct nvkm_rm_api_disp r570_disp;
+extern const struct nvkm_rm_api_fifo r570_fifo;
+extern const struct nvkm_rm_api_gr r570_gr;
+int r570_gr_gpc_mask(struct nvkm_gsp *, u32 *mask);
+int r570_gr_tpc_mask(struct nvkm_gsp *, int gpc, u32 *mask);
+extern const struct nvkm_rm_api_engine r570_ofa;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index b080a8da1caf..97c02aa93d55 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -427,6 +427,7 @@ tu102_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 
 static struct nvkm_gsp_fwif
 tu102_gsps[] = {
+	{  1, tu102_gsp_load, &tu102_gsp, &r570_rm_tu102, "570.144" },
 	{  0, tu102_gsp_load, &tu102_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
@@ -442,3 +443,7 @@ tu102_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 NVKM_GSP_FIRMWARE_BOOTER(tu102, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(tu104, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(tu106, 535.113.01);
+
+NVKM_GSP_FIRMWARE_BOOTER(tu102, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(tu104, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(tu106, 570.144);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 9e897bdcb647..97eb046c25d0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -41,6 +41,7 @@ tu116_gsp = {
 
 static struct nvkm_gsp_fwif
 tu116_gsps[] = {
+	{  1, tu102_gsp_load, &tu116_gsp, &r570_rm_tu102, "570.144" },
 	{  0, tu102_gsp_load, &tu116_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
@@ -55,3 +56,6 @@ tu116_gsp_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 
 NVKM_GSP_FIRMWARE_BOOTER(tu116, 535.113.01);
 NVKM_GSP_FIRMWARE_BOOTER(tu117, 535.113.01);
+
+NVKM_GSP_FIRMWARE_BOOTER(tu116, 570.144);
+NVKM_GSP_FIRMWARE_BOOTER(tu117, 570.144);
-- 
2.49.0

