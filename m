Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391C6AB2B52
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFC310E186;
	Sun, 11 May 2025 21:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k5fpC2ae";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8926F10E17A
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+fj1ZqrEuXpSV8pKXR0m6s/DMU1+LqzIep9JV5xHsLiw8Sg3cjlJXZnM5rqS+X2d862FFqEOfhJ9wkiw4crJG9u1EEQ0o12K+kufMrm7/Sd4gmWaWjarLuJ8gaPywK3tiywcrOqWPcl5c9JJNo5L958/Wl6TfZqVN2rhX6877r3xMmY0/dntDdUiCohCbzI8HckZHzLcebqjPdMSZ687DEcnjanqvJfgBgo7Frz3gVmYI3gCxpXe4VCVLz9hTF6LzuaQlo0VfBEuayeL+jPiiksbaq2OAtcEZuGYHAG0yNtjc6P9e4KXBg6z5b0NLSdYPzS50KMOhGs5Z5EctNCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BxwLq8yYlSaPvtUX9vOw5I1XmCWtv2Rm6jsmASSrLI=;
 b=gxGH8ShUZgT3ppeBRSwSiUFj8xju3pSEoBhrQpo7c9awJPq5GS6EjECM/dSKIg9P+YmStDE5XeAxJPRok321VZSLi772lL3xPwnwglM5P0+pqah5aACZ650fSdFQYPu7NPMp8RtYXAhPEgG3qEMa+7A/iWZGm2G2dkqPsUPa+YWt1wL41rrMlN1hmxSZd2sSb0o9ELFyLVtGUhLHUwnEd+AKUCGqp/qrtr7YNIBkBNP4cS1eqfQAaYl6Yj8BEyoGrGSlisWzx4BSCABFr6H6HpxbLpfQrC23CW1/WQIiFewi/MlEXnS9ThQgP3bxZG/bQAPf4+bk3AfVsopyfiuq9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BxwLq8yYlSaPvtUX9vOw5I1XmCWtv2Rm6jsmASSrLI=;
 b=k5fpC2aeuGBuZ4McPZJI7YfIsH8XygY+hBvSYbjyF+728SVO4qOXDILTlmUxRQ4HuhUbf0hL4jyUjcgfCHIXRtwHsWPZ45ADsaUwSrFAu2QQmzevSOAaIgc6zlkwxJSJh2Zicq2BzpGVbgmjdAJFo7BueqMwXuq28fXO7WKJWLwYb4y6IwyZkWse2KFxrp0shYhAlznHb75bMlRcHaRNxK7Qg8ngZSt9cjgzTUSdfSz0ngbU2NTyYOjOXOEyN3Yf16/fkOG7mRwPHpX1LfpprTni4nCMpEXvsd3ShfaxGLvpjQboQVVj43cuiMHQPXGf2U/sd0ovEMjwKdMyQqGjUw==
Received: from DS0PR17CA0002.namprd17.prod.outlook.com (2603:10b6:8:191::25)
 by BL3PR12MB6523.namprd12.prod.outlook.com (2603:10b6:208:3bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 11 May
 2025 21:08:26 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::77) by DS0PR17CA0002.outlook.office365.com
 (2603:10b6:8:191::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sun,
 11 May 2025 21:08:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:21 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 12/62] drm/nouveau/gsp: move subdev/engine impls to
 subdev/gsp/rm/r535/
Date: Mon, 12 May 2025 07:06:32 +1000
Message-ID: <20250511210722.80350-13-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|BL3PR12MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: d8692b65-2a78-4f4c-c03b-08dd90cff88d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Hj3DlXM+1e92TvQ8T+9YdpRHtDmwRCobEyusG8SKabpvmxU6WfwVvfcFZtj?=
 =?us-ascii?Q?8t1aUGJggju+lbWTO2AiouKb9V2c4lv8IqYKKFLcHq45CAK2AhnvKlgK2ouf?=
 =?us-ascii?Q?cjPzAp3Uyid+XjVnuOnip2fFUOJKwSus3OJ2K373LO2YB6kiPoUeAq6QHaij?=
 =?us-ascii?Q?6rSVm0ZynfVY+/o+DtKStPNAaBBg3RdJbNFD68LLrRG6Woq46weZbtzmx1uQ?=
 =?us-ascii?Q?q0zdg9wiJVxIp4dXZQ4SA8P4CflteWeWLgAn5oL2oWWxud3yq01brhgJocx9?=
 =?us-ascii?Q?kHeVyk3au/6JIMhc62HmpKbakz3ku+tCjeD1KwWkrWLKj8iygLiDuZk9MW+4?=
 =?us-ascii?Q?kXDL39ky33hTKn8EbOCYUxt83DKOdF2y7ns0znkilefFnxpapiXKdJfZvOSP?=
 =?us-ascii?Q?ere5oD/HxkrgWrqE+kvh5Dfo11sMMyHpQ9Vtdec5R/YBVtRZrrw5LyvHOJGY?=
 =?us-ascii?Q?ilnwvFsZFIPHH8TXSvBvicWipr0RLOC/XkepUq4dkd4gWFcMwNw4DfRH1R/C?=
 =?us-ascii?Q?wiZoOTbq77RVgFwJ+btNoVnpGCihljPoSBrhzqa8S7+A80DkIeLiv4VAp6aw?=
 =?us-ascii?Q?UJlh2u3EU8uIaOKt76hdbv0IcrlmRrEvSxwI4cXkX9KdftjM/tgN8lwmmVAj?=
 =?us-ascii?Q?vHOuCFyUsT5JWzBdnlCI8xCZKAzXGpUUfkxHd8yH4hQei2FDP7OX/v4a7pbP?=
 =?us-ascii?Q?dmjzJAo7U9VPMqW1qfhtavJMemOA4jjJnJE2EXQs6G8sRg39H3uQNmhkQ1c8?=
 =?us-ascii?Q?qY7FjTekuSPgfO/wOMj+6ChVfShbd3RlGxs7HIhmXs9wotcjmf6ZnFbSpp1v?=
 =?us-ascii?Q?V/L/yFBXAl7eSBLUKXdRUbMEG7zS37U2VL7685syMSvTT64+i0ANseBFAKaE?=
 =?us-ascii?Q?MUb80Wa+PQEkTQCgtx4zM5CspAY/fMzAsJ/bbJ1fwkp7NbQmoEuGSvX4BV0M?=
 =?us-ascii?Q?HnOH2p4QqGzml85VikbssHtcp/UT7/TqjdozUenJgUjTehNVJZ2V8t3TI69d?=
 =?us-ascii?Q?bYwI0FJrBzqac4QTMOQmqRGKnLYFypTBlQnqcNRo8+dhVEtFkfB/cDXR88oo?=
 =?us-ascii?Q?jIuIClLQhMz4OXuj3ZozE/FVb6CZ2dZF6X264jFVrQv/WvzkbuXQPTjTouOm?=
 =?us-ascii?Q?BjP7S45KDOTkQMmsG0Iw890hQNfSE1Axp1T3Pv96JaA8O0VGYGXxTKptw6YI?=
 =?us-ascii?Q?O5Fk1PeiIrzxT0Wvr7vZqZ/yQUk9KoW5z2ir8OBdwK/cW082NfS2vrYzc5qs?=
 =?us-ascii?Q?0yP30EecKUdORyfQKxhxDxTa04gQ/9cBuPBZMO/gFp2fBVafRtYkq7kjczdz?=
 =?us-ascii?Q?EILklbFG4GKrRkvIFkSamlCRTPaJ4PrASPVUz+E8pm8JeShqITcR87fPGPfk?=
 =?us-ascii?Q?/mtI/I1SLLYFz1plVq49b/WegC5OIZ0JQ1iVgvSa0uL5rvmdtMeEgAiaT8fm?=
 =?us-ascii?Q?BSAXd58i34GRfOKX+iBBrwz+aCrLMMcp1rjtNrpz7/x7Ys8AhqygDTmnmamV?=
 =?us-ascii?Q?eihcA/xtemhU7CpvAahAIKPkY9E7KdGrCTKN?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:25.7587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8692b65-2a78-4f4c-c03b-08dd90cff88d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6523
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

