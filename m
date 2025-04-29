Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5D6AA3C79
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C9610E55D;
	Tue, 29 Apr 2025 23:40:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uXlS7yQ8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B23310E558
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q480zlbEpKXBXjvUZWxeGvL97b4OeAwIgwdQGbUpsRzGzWNHt5HeUyflIU75e3swA7UNx0DCZB/WieGqdcNzR7IZqcHtqz7E33rmg4NWsF5W17cthdaNHXoJxpmC0/79AOIh4PToAz+kigBLMHwRhUnDryDjtE6y2HzDLsAgQYVStm3hhTeL5A6zH8l42d0CUAaRjgKag9gHrBiflOC6FRE8lcZP2GQ+JuDuD2iXqZa4CYX5XV1d5OB7iYJhK9mf3lVZ7kOxpiwxYl0QlAB2A+ByTZVFk8Lg140b7adMSmChAKB1wGTSkr9nLoKYgrTuJQn+OQcyd1hMeyOEkt97jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzbJsF3oMp9dyJBVoCsnKmnRrkpDy5VhTL80Eko1Dvs=;
 b=eEzGQcbR4ys/f1WptmqGgaILhTU4yJkOtP90jn4C92ixliYcRE2WaKKEY1AsOvUFijpbM1ZhBFPxJksmdEBLMWWPAs7co0UkUeS9Q4vIrbvrFky0/peDB92ze4waLzVzrboJ11X7LbOW6wita14l9Rk4iSncGpqtU/DxOjhw7xgAG7yvuCNDICpvAdBrTtKie2SHeAOc8buKwsoqFdl8yE0h1+jQpvAdYO3nSHnNv0xK0PkEFmbghQG/nbuhlnUkHa0YoKabIn5n7iormh5fUC69qQAivvQwubIEO8TcrjkbWKke8tAW7KYlp7Ox+N1A2KqjXHh5mF9u9M74EcrEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzbJsF3oMp9dyJBVoCsnKmnRrkpDy5VhTL80Eko1Dvs=;
 b=uXlS7yQ8+cRHXVdageex8n2FQ9ynBs2tFCJqgW+tnJuIPITpNxMCMC9BKq4Ud9fDprhm9XJBa1mVdjsKXENRp+uTCFEq2beLRlP4u614GF+n95mnZeCCRDVefMQm/MmlEfSYpgyTJ7SaohgX9ibSa/tziwupRrpmhLulS7aOzisRxvyIodFTWIluWcKrC8FPq65VmWl0E/Ff8ZJb9VUonOxSvR9sVcTYigMsgUMXecPqi/tQNfGmzQHeDvc+P6QwcI0QEnTXRGvKarDAAV4hqtHBYBtbNNfus6pZOwiOpjbp/63z83X40HJfuJtiVlcCd10VrSXxQrSS9DVhMK97qQ==
Received: from SJ0PR03CA0376.namprd03.prod.outlook.com (2603:10b6:a03:3a1::21)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:06 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::ee) by SJ0PR03CA0376.outlook.office365.com
 (2603:10b6:a03:3a1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:39:53 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:39:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 12/60] drm/nouveau/gsp: move subdev/engine impls to
 subdev/gsp/rm/r535/
Date: Wed, 30 Apr 2025 09:38:40 +1000
Message-ID: <20250429233929.24363-13-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8027d5-3e8a-4b09-85a8-08dd87772b9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SfNbZZMg3fS8bP8u0oIOlzjidvdm+Y7ZfGoKLEhnp/u7vQ72MJ3VqXyHDmKG?=
 =?us-ascii?Q?DTRV6vTfxrDUvrMfbO8BvhOMEzvNgXhVZwTTNWm23KyAk4iwwDZ8dpCUerji?=
 =?us-ascii?Q?CZDPpZnhMhtOly1sw1DVOGy4JAu5MBy4Q9r0uOi4891nEMFht9hik1ieS886?=
 =?us-ascii?Q?YJA0rihWYwcsbbW6dpKhUdNkP0Ba0BYSt+9w0X4lCX7wyBQrUWuJYlSIHvo8?=
 =?us-ascii?Q?E53kBjgE+BuTncaWSu6q0bQv+VXzPg6p69ebxdphKLW0YVXNcLdDBLcveqD7?=
 =?us-ascii?Q?1BZyGMLV56MhjYFqpmtFdZLVKGg5Bl5rUVqFVvt+0zp5PT+Ypg2EhZOhh7Sl?=
 =?us-ascii?Q?SKjVrxXXNgaIrJACoxw+hwzwaWnArwdw1apyxW/nH739JvlrdxKvMwv0cyah?=
 =?us-ascii?Q?OH8l1qCRChwqQE7vAuMqm5ppu+75NPdkX0Wemr+Y0OLfp/OXRpL1CyEpLiv/?=
 =?us-ascii?Q?eDHDsC6e5Ca0SAqHXTvx2XTUQtvuipYScWzOGu33EUo2aJM9SzbLJJJ3cgnu?=
 =?us-ascii?Q?0MF3brAb7PwUahurg1CG7wE7nHspif2970GML0/RKoF2qwuWwzZmFExclK76?=
 =?us-ascii?Q?rmfO1m4hVsaEQXanzeG3VgSgaMIynEXndlXLg4SaoFqcm9CJLqhzR7OnPAGn?=
 =?us-ascii?Q?P/QjDDR4yT+k+gYyaTzDYyHYu+cbGFXx1HulNygDsXzInEO//Q/JRa+z86pT?=
 =?us-ascii?Q?pEyy5V6cXknaSmYY9L7V+w54xAboFI0llLTEa0h0CPjAZzK/23w/i+Qvv3NE?=
 =?us-ascii?Q?a/VFtBOCuoedVtd5XWFLHjsLY4xQjU6L8inYmaCykg8ojvk7KTsWi+4tb23E?=
 =?us-ascii?Q?TdsBDXgafZ/I/zU6IlEcvldmgf/zOeOAMuyEczSAmVXzWhSkINKlOg4yjQ36?=
 =?us-ascii?Q?ZQ8FwcVQN4kwBhwSSQpUWUA5NNUVq+gBkV7QhQzNPM9vIP8VJLVHiPvPtqse?=
 =?us-ascii?Q?ctH6ArCNP1fjeoz1qcGwvH9gdtgP/XBQL44urmdBrd+H0shSWTYeE/4dAL4d?=
 =?us-ascii?Q?Pc5fN5r2FxcQZlxOKL7nyJ+OIAGwROcVbLIK9UqVY9PIwGk+vwq3u15uF2oF?=
 =?us-ascii?Q?IvP2d26Sxpk+8xhh7ZFHBZMPz9L3z8p8R77d0LM78Kwb2tGmo2+heoaYePWo?=
 =?us-ascii?Q?oY72MkzpP2OIvkw0bOZXzQBah81aIOBPHgAun13FeoJNvWfIa2Vy9BKD3pMv?=
 =?us-ascii?Q?2llBy+nHyTpRzmM/bphXNitkaMzVMp6LZ/xH7gWxRYK9AEU+YfaL2nMAaf29?=
 =?us-ascii?Q?BM9aaABoWM+WNUfVXUHRJnpaAWQTnW925QMrQ6kUAat1ydo7q+8mnaoklPdy?=
 =?us-ascii?Q?fGEt9U4RfLNhXShHsk0VEiQXaMsgOZu35MWiq7vdCJzwphmvsqY32lWtvoqb?=
 =?us-ascii?Q?mKa8KwdXtNcRgGvD9qxT5CYBmbhM3TfZba6hol5Dym8eryOosDYwUp/k/1wY?=
 =?us-ascii?Q?ugkDBcQZinORae6o2untJrX+ksTdJq75B9zQqXHaA7NeFQPs6pmBGt3po6Cf?=
 =?us-ascii?Q?hRkScaXyYPYrM5us3A1+3+ciHdlDnJdfAlRG?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:05.8749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8027d5-3e8a-4b09-85a8-08dd87772b9d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073
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

Move all the remaining GSP-RM code together underneath a versioned path,
to make the code easier to work with when adding support for a newer RM
version.

Aside from adjusting include paths, no code change is intended.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild     |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild   |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild     |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild  |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild  |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild  |  2 --
 drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild    |  2 --
 drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild    |  2 --
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild    |  2 --
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild    | 15 +++++++++++++++
 .../nvkm/subdev/{bar/r535.c => gsp/rm/r535/bar.c} |  2 +-
 .../{engine/ce/r535.c => subdev/gsp/rm/r535/ce.c} |  2 +-
 .../disp/r535.c => subdev/gsp/rm/r535/disp.c}     | 14 +++++++-------
 .../subdev/{instmem/r535.c => gsp/rm/r535/fbsr.c} |  2 +-
 .../fifo/r535.c => subdev/gsp/rm/r535/fifo.c}     | 10 +++++-----
 .../{engine/gr/r535.c => subdev/gsp/rm/r535/gr.c} |  2 +-
 .../nvkm/subdev/gsp/{r535.c => rm/r535/gsp.c}     |  0
 .../nvdec/r535.c => subdev/gsp/rm/r535/nvdec.c}   |  2 +-
 .../nvenc/r535.c => subdev/gsp/rm/r535/nvenc.c}   |  2 +-
 .../nvjpg/r535.c => subdev/gsp/rm/r535/nvjpg.c}   |  2 +-
 .../ofa/r535.c => subdev/gsp/rm/r535/ofa.c}       |  2 +-
 .../nvkm/subdev/{mmu/r535.c => gsp/rm/r535/vmm.c} |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild    |  2 --
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild    |  2 --
 25 files changed, 36 insertions(+), 45 deletions(-)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{bar/r535.c => gsp/rm/r535/bar.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/ce/r535.c => subdev/gsp/rm/r535/ce.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/disp/r535.c => subdev/gsp/rm/r535/disp.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{instmem/r535.c => gsp/rm/r535/fbsr.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/fifo/r535.c => subdev/gsp/rm/r535/fifo.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/gr/r535.c => subdev/gsp/rm/r535/gr.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/gsp/{r535.c => rm/r535/gsp.c} (100%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvdec/r535.c => subdev/gsp/rm/r535/nvdec.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvenc/r535.c => subdev/gsp/rm/r535/nvenc.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/nvjpg/r535.c => subdev/gsp/rm/r535/nvjpg.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/{engine/ofa/r535.c => subdev/gsp/rm/r535/ofa.c} (99%)
 rename drivers/gpu/drm/nouveau/nvkm/subdev/{mmu/r535.c => gsp/rm/r535/vmm.c} (99%)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
index 165d61fc5d6c..8bf1635ffabc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/Kbuild
@@ -10,5 +10,3 @@ nvkm-y += nvkm/engine/ce/gv100.o
 nvkm-y += nvkm/engine/ce/tu102.o
 nvkm-y += nvkm/engine/ce/ga100.o
 nvkm-y += nvkm/engine/ce/ga102.o
-
-nvkm-y += nvkm/engine/ce/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
index e346e924fee8..23a10e081081 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
@@ -29,8 +29,6 @@ nvkm-y += nvkm/engine/disp/tu102.o
 nvkm-y += nvkm/engine/disp/ga102.o
 nvkm-y += nvkm/engine/disp/ad102.o
 
-nvkm-y += nvkm/engine/disp/r535.o
-
 nvkm-y += nvkm/engine/disp/udisp.o
 nvkm-y += nvkm/engine/disp/uconn.o
 nvkm-y += nvkm/engine/disp/uoutp.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
index aff92848abfe..5a074b9970ab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/Kbuild
@@ -26,7 +26,5 @@ nvkm-y += nvkm/engine/fifo/tu102.o
 nvkm-y += nvkm/engine/fifo/ga100.o
 nvkm-y += nvkm/engine/fifo/ga102.o
 
-nvkm-y += nvkm/engine/fifo/r535.o
-
 nvkm-y += nvkm/engine/fifo/ucgrp.o
 nvkm-y += nvkm/engine/fifo/uchan.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
index 1555f8c40b4f..487fcc14b9a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/Kbuild
@@ -43,8 +43,6 @@ nvkm-y += nvkm/engine/gr/tu102.o
 nvkm-y += nvkm/engine/gr/ga102.o
 nvkm-y += nvkm/engine/gr/ad102.o
 
-nvkm-y += nvkm/engine/gr/r535.o
-
 nvkm-y += nvkm/engine/gr/ctxnv40.o
 nvkm-y += nvkm/engine/gr/ctxnv50.o
 nvkm-y += nvkm/engine/gr/ctxgf100.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
index 2b0e923cb755..5cc317abc42c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/Kbuild
@@ -5,5 +5,3 @@ nvkm-y += nvkm/engine/nvdec/tu102.o
 nvkm-y += nvkm/engine/nvdec/ga100.o
 nvkm-y += nvkm/engine/nvdec/ga102.o
 nvkm-y += nvkm/engine/nvdec/ad102.o
-
-nvkm-y += nvkm/engine/nvdec/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
index 2c1495b730f3..3d71f2973dab 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/Kbuild
@@ -4,5 +4,3 @@ nvkm-y += nvkm/engine/nvenc/gm107.o
 nvkm-y += nvkm/engine/nvenc/tu102.o
 nvkm-y += nvkm/engine/nvenc/ga102.o
 nvkm-y += nvkm/engine/nvenc/ad102.o
-
-nvkm-y += nvkm/engine/nvenc/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
index 1408f664add6..1d9bddd68605 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/Kbuild
@@ -1,5 +1,3 @@
 # SPDX-License-Identifier: MIT
 nvkm-y += nvkm/engine/nvjpg/ga100.o
 nvkm-y += nvkm/engine/nvjpg/ad102.o
-
-nvkm-y += nvkm/engine/nvjpg/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
index 99f1713d7e51..3faf73b35f5a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ofa/Kbuild
@@ -2,5 +2,3 @@
 nvkm-y += nvkm/engine/ofa/ga100.o
 nvkm-y += nvkm/engine/ofa/ga102.o
 nvkm-y += nvkm/engine/ofa/ad102.o
-
-nvkm-y += nvkm/engine/ofa/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild
index 9754c6872543..8faee3317a74 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/Kbuild
@@ -7,5 +7,3 @@ nvkm-y += nvkm/subdev/bar/gk20a.o
 nvkm-y += nvkm/subdev/bar/gm107.o
 nvkm-y += nvkm/subdev/bar/gm20b.o
 nvkm-y += nvkm/subdev/bar/tu102.o
-
-nvkm-y += nvkm/subdev/bar/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
index af6e55603763..ba892c111c26 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/Kbuild
@@ -9,6 +9,4 @@ nvkm-y += nvkm/subdev/gsp/ga100.o
 nvkm-y += nvkm/subdev/gsp/ga102.o
 nvkm-y += nvkm/subdev/gsp/ad102.o
 
-nvkm-y += nvkm/subdev/gsp/r535.o
-
 include $(src)/nvkm/subdev/gsp/rm/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
index d50f2c351d93..a5f6b2abfd33 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/Kbuild
@@ -3,8 +3,23 @@
 # Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
 
 nvkm-y += nvkm/subdev/gsp/rm/r535/rm.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/gsp.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/rpc.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/ctrl.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/alloc.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/client.o
 nvkm-y += nvkm/subdev/gsp/rm/r535/device.o
+
+nvkm-y += nvkm/subdev/gsp/rm/r535/bar.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/fbsr.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/vmm.o
+
+nvkm-y += nvkm/subdev/gsp/rm/r535/disp.o
+
+nvkm-y += nvkm/subdev/gsp/rm/r535/fifo.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/ce.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/gr.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/nvdec.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/nvenc.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/nvjpg.o
+nvkm-y += nvkm/subdev/gsp/rm/r535/ofa.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
index 90186f98065c..ce2c86c159b5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "gf100.h"
+#include <subdev/bar/gf100.h>
 
 #include <core/mm.h>
 #include <subdev/fb.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
index bd0d435dbbd3..0d73906f4a5a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ce.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include <engine/ce/priv.h>
 
 #include <core/object.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 99110ab2f44d..1aae15167249 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -19,13 +19,13 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
-#include "chan.h"
-#include "conn.h"
-#include "dp.h"
-#include "head.h"
-#include "ior.h"
-#include "outp.h"
+#include <engine/disp/priv.h>
+#include <engine/disp/chan.h>
+#include <engine/disp/conn.h>
+#include <engine/disp/dp.h>
+#include <engine/disp/head.h>
+#include <engine/disp/ior.h>
+#include <engine/disp/outp.h>
 
 #include <core/ramht.h>
 #include <subdev/bios.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index 35ba1798ee6e..6305f3a93810 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include <subdev/instmem/priv.h>
 
 #include <subdev/gsp.h>
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 3454c7d29502..ad770c1442f5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -19,11 +19,11 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
-#include "cgrp.h"
-#include "chan.h"
-#include "chid.h"
-#include "runl.h"
+#include <engine/fifo/priv.h>
+#include <engine/fifo/cgrp.h>
+#include <engine/fifo/chan.h>
+#include <engine/fifo/chid.h>
+#include <engine/fifo/runl.h>
 
 #include <core/gpuobj.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index f4bed3eb1ec2..37bde547ae65 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "gf100.h"
+#include <engine/gr/gf100.h>
 
 #include <core/memory.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
similarity index 100%
rename from drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
index 75a24f3e6617..16c1928f6d68 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvdec/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvdec.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include <engine/nvdec/priv.h>
 
 #include <core/object.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
index c8a2a9196ce5..b6808a50c4a8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include <engine/nvenc/priv.h>
 
 #include <core/object.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
index 1babddc4eb80..994232b3d030 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvjpg.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include <engine/nvjpg/priv.h>
 
 #include <core/object.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
index 438dc692eefe..200201c35f0b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ofa/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "priv.h"
+#include <engine/ofa/priv.h>
 
 #include <core/object.h>
 #include <subdev/gsp.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
similarity index 99%
rename from drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
rename to drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index d3e95453f25d..94cad290e17e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#include "vmm.h"
+#include <subdev/mmu/vmm.h>
 
 #include <nvrm/nvtypes.h>
 #include <nvrm/535.113.01/common/sdk/nvidia/inc/class/cl90f1.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
index 553d540f2736..06cbe19ce376 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/Kbuild
@@ -4,5 +4,3 @@ nvkm-y += nvkm/subdev/instmem/nv04.o
 nvkm-y += nvkm/subdev/instmem/nv40.o
 nvkm-y += nvkm/subdev/instmem/nv50.o
 nvkm-y += nvkm/subdev/instmem/gk20a.o
-
-nvkm-y += nvkm/subdev/instmem/r535.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
index 7ba35ea59c06..a602b0cb5b31 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/Kbuild
@@ -16,8 +16,6 @@ nvkm-y += nvkm/subdev/mmu/gp10b.o
 nvkm-y += nvkm/subdev/mmu/gv100.o
 nvkm-y += nvkm/subdev/mmu/tu102.o
 
-nvkm-y += nvkm/subdev/mmu/r535.o
-
 nvkm-y += nvkm/subdev/mmu/mem.o
 nvkm-y += nvkm/subdev/mmu/memnv04.o
 nvkm-y += nvkm/subdev/mmu/memnv50.o
-- 
2.49.0

