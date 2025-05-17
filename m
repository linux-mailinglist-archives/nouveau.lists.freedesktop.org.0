Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60DEABA706
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AA610EBA9;
	Sat, 17 May 2025 00:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KXh9h8ZZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD5910EBA9
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZHn55MVO2bLKD+UTvplwrJ0u2RblxliFr+VnIvQYQeNS5pbYgxmi3Vy7SW/NGxcXjoXAijVlxYDRBIZ53OSRAnqNGCDfNTYRt7zQXUmNudsmTpguNGbzkcf0jFX0h1rNJrD+9UvUx06SiJOAOnBY8hNHAczoLijCdgJA9IEDegkDDMMr09HVNCVXjVvV5hgJAC3sCNbwwRZO5YBW9ToUVegxdNOJUMKS32NTyBsSchywMOd0AdEDHRqCNjRW2Qz9EKV6336BZMmmfb+ApLMYlkDIcc1pCzOYRSiRlADGVJbibE0RcPZfyYsISItVw/R+x8PniBslzXOYODN2xaCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hyse2yO/e6FzgflKSTpOmPDjyP20ZEeicI+H2A6OLWg=;
 b=i18ST1hll6GpksqtqnJHOm5jhySvXIRWJBk4QMe9A2WCOTts0+TuY59sH+K281Wch6NZ/J3JqRd8eFjb8KGtduLuW7ga5kh1QKoguaQTgHgqeAyPx4seSnslqZm7yOer1H1qJFfn7UDDBG48Q5VR7Wlp7Zm2xSB8oumPLyng7EsC77XPPaygxLjzpX/Dyya+KDm5mnujGjgGDF4pexq3ibcyu2ByAs99yE3ExqxgBSYSPFsYFvPfBlFBsR+9CF2dZBqpLTGRy60J71StOENG9X7mj0+6U01SLE9CsNAsK20Nule9CcGmweTdcH5CkF7jg9PQEr9bKoCfKrg19stbCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hyse2yO/e6FzgflKSTpOmPDjyP20ZEeicI+H2A6OLWg=;
 b=KXh9h8ZZ8W7YILzOWhJWVis4UNu8ellqjUFn35OIGj3seqKlw0XfKr4qARcyiMFnJK4SUO4v46inuHfrPwqxcsEGHaNRT1GM2Ih26eh8o6gn46smGdAvMfVipJYFlJ9xmlSrn2zRUsZma8MwTjvdXLe3kWvPssMlHU0HqiIxtHFRWF2jx6fH6m46IGXgasBwYc8wONpmwsZOWAGIX1BmjY1PuYynX7UZ2rDcmhqAkGRreiR7ZtQsyJ9i+glYyXyHvskS1dm5rEEEsvuEJ9E6Nu8+3GHWKl7PXVW/zLaYnk1JlVbx3MSKPSV/dtn3bPLenU3BHrm0UT3AC+KAMWn6CA==
Received: from BYAPR06CA0065.namprd06.prod.outlook.com (2603:10b6:a03:14b::42)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:10:41 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::84) by BYAPR06CA0065.outlook.office365.com
 (2603:10b6:a03:14b::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sat,
 17 May 2025 00:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:27 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 13/62] drm/nouveau/gsp: move subdev/engine impls to
 subdev/gsp/rm/r535/
Date: Sat, 17 May 2025 10:09:05 +1000
Message-ID: <20250517000954.35691-14-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a595dc0-9052-4248-c076-08dd94d742ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8aQfHaJDnecZqMWBKEnZD5PFzqczYxWm+x4jr4kBE0bq/sFCoENFIBze6P3E?=
 =?us-ascii?Q?6F7Ti4M+3L9u/hYyj13QMxdooiPLOZywpgkg2M2JW3dgOXs3nIRoBhkyZC1P?=
 =?us-ascii?Q?3AhtcnzM8+tATCbr6ai6h5vgxdwqwmNSSd4lk8pAD38aMrwxox1Apa01z3Oj?=
 =?us-ascii?Q?yLqnfzEcd0tp0kXwyi9gX5somLySeJTdYoFWVkScRSbBmVJMB5bkw0HYKh2b?=
 =?us-ascii?Q?J2SKYEuuM3xI6z7PusDCMS4W2uoVLdekznVcgk2Dchwnx8OuR2bIvWvtHYW1?=
 =?us-ascii?Q?p7D9jz3vDol/JQEgwXqu2mEjyHMIYfRsop2Abaq47KMfGZukWzRhW3ZCrFYV?=
 =?us-ascii?Q?vJNIstSHfnpoENi1XO2ibxxGuws4l7ojcabD/4PAdnA6tTm4EMpDzwBQ/ICB?=
 =?us-ascii?Q?9O5WjuJKIaywpW36ShMRkife5ndH70Z3hbEP2y8kjk4MncGNOCiYINbScPU/?=
 =?us-ascii?Q?5AyLcP7gQE9bd6QZcfCquxXDNRLRoFJcAgIZmKaF8n5HpIeNqvqS6CVbiRf0?=
 =?us-ascii?Q?w5nLpffepc5NRdnJ1RWWVnSLUR+nblllJ0YWaF5zcbvLChgU2yQhBUXnpEO7?=
 =?us-ascii?Q?1K2rb+cSHHCgAKc06Ck6Rg9nA9URDHbg6ccjkuXOhVzlcNZgpmdbHkNbLny7?=
 =?us-ascii?Q?+XLT2+6e0LF1NTNUNJMtIyPYok1cBb1uzt9XYDy/Q27/Awi34FJ0RzO3WHr7?=
 =?us-ascii?Q?1iCWFCr7SylebUq5EOoUC0N0ea0NCduB0BfVrHHAzUFEJSp2qyJesNhALzAI?=
 =?us-ascii?Q?Oi3oXQb5SpHWMjUsbXUyLC/bieGw963MN0ohBFU6sz22hQ04WA8M+U4hx/I0?=
 =?us-ascii?Q?Vo/Q7ybwT1KZe8+KUPifCG3ISTf9HwWRd879OI2r6npc9I4T3biY2nHy899F?=
 =?us-ascii?Q?CiMC+N9YUX3zPyITyzCtS2oI3y9328a+UnzRPFpMo6zG/O2m1ww8MhpWNnSL?=
 =?us-ascii?Q?AbO9ensxbINEhPoL+bEH0uH1cngf4F5ddI9xMECENP017JRCUMppyFcZIMi0?=
 =?us-ascii?Q?2O0tCAHto5BTUA8i3Bf/BP5kNbVBvGueOP+Vp6u5cZdjZZSUwJbWrGIai5TK?=
 =?us-ascii?Q?bmvnAxC+GvCxKB+m9QBdQIEaifxRep8ZqMjUZCQoNwnwmMyZhHo4J3a1/1W/?=
 =?us-ascii?Q?zgYPw+0jB95tzAUkgoBiCkp7c1THPXFPDuok+AozsxnCKXWgvDwVCgnDGDvo?=
 =?us-ascii?Q?n8w6REC9wYWxp0B9PBbvv+RzqHnxSQKq2ovarH65M9t8SD7OlST7z9Nh+7Ha?=
 =?us-ascii?Q?2B0v4zxJ7lYFpo8beOR13WHeaaHXXt+bu5/LHHNpHexVIA35oaT8mP6gJwqA?=
 =?us-ascii?Q?jq+ODYZIRtK5U99GcxQhCclwwtoeXvNhGtG4lcOsIv0avI5sW/nERWzkfKYc?=
 =?us-ascii?Q?22J0WzJzB7VhrpQ2mg0xifXn5pDRNvwId6O+gJuWlQcs/tZJTEHBaR2j+Ffm?=
 =?us-ascii?Q?3D/CzX5u1FRg41Qmug8Zpnj6dz3ptAEoTjj53eiqZULI0HdZTLjrhqjxqIn/?=
 =?us-ascii?Q?i4ZibvOlECvoucpbIvwQx11EDfASMHn9GwLZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:41.3509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a595dc0-9052-4248-c076-08dd94d742ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
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
index 129f274c9bfd..621e5dfe898a 100644
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

