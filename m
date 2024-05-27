Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA818D1208
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFB310FE2C;
	Tue, 28 May 2024 02:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VzokLWIA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59310FE2C
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsnPF792lgqVnp5kBoStpgHWoDFbKuYBlK+0ewunXYGg3mhVH9J38J5e8AfoOPvvSO+GYj5w9DA3Rw+gmT30PJDb63gnFcu651LavdWe5i5tXsuBGMv/HFEZikKQUPZmC8WfzhFpaVGge0RT157a427aKqawL3PrnkHfs7CnTreacGIicfn+riN1hjG4WoRTWTcSz5AQHjNhd24pW9y8idE50DZ2BNY7LbUGm1BeALsYSZO+0+XVF9Q4i4wkuY5DqI0FyZiUOHZ8CrgyCZl7eI30gviLg/g67TvSL0X6Rl3wCVmbLbDqtAkqmxLU2hha+wNt3faDmFJ2vFQUY8oXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vx304RXQ/tOJxHi5KmWE5DVdqqABIEB67jWTsvC6VGQ=;
 b=KvjjFORooqfJXqigU7BPx5WbzYEv0ml5I+HHXzWZ9XrvDhMBLoc+HZnIUiLN7fX6jmP7Mfb12TtVRFibXwMYVs2Dkbq7wbxtNh0xBp6YSda5EoqzC/j1/8/H31XmwttPgLX98wKrARDG75ymm6w1hfzPoTCuYVtDTe/KDC+w0ys9RmjSsmDYPcuAGrs5AntQ2LkN7+05um1/dLT1bFaHaIogKbbjaDDD49vF2vGKHXMn/tIaPKjJk7f2X6RqyRJBaPfcV/yREpi54YfcrCLpavbTjd3yTp/AhX9GEzlNFiEM71YDbiQEOPJWw4oaxU2+Rxe6bKfU1nuEoX4RWd62UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vx304RXQ/tOJxHi5KmWE5DVdqqABIEB67jWTsvC6VGQ=;
 b=VzokLWIA489ec3LmuCsESvey3JIqvIP1HJxmoVBpG1HbHU7N9RQdOQcwY9bd6IXNnK69FLH9FMWE4gExBDGFYWnv9lkiWCHzwCjDy/6VpF4PFpb9a2hTFmQZMtuq8YY0tKK6S2qMMssdv52HTiHyi5XM+ozWhZg2qlTU7RSiHU1O1TVlZwiyt3ImYTZOPIhAVOuZGn/ZPHfcx68Z2kTexyznHYxXJbAcsS4k/Rg1RPKQ0BuYo0Uzuk5U+eRRHWBjbgS26L+Abavge4p213t0nT3UUpeQlHCsvGwna6CrA3JIX6ffJaTjeyJkn290loZkMu63ToGmdYdCprTeUiv6Gw==
Received: from SA0PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:d3::24)
 by SA3PR12MB9228.namprd12.prod.outlook.com (2603:10b6:806:39c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:47 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::2e) by SA0PR11CA0019.outlook.office365.com
 (2603:10b6:806:d3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:32 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 30/34] drm/nouveau: remove chan->drm
Date: Tue, 28 May 2024 00:19:55 +1000
Message-ID: <20240527141959.59193-31-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA3PR12MB9228:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f92949-3691-4255-3f6e-08dc7ebd3456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|376005|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?URcpyZtg+25tel1PSrhkeRDAZ/zlaEMXJVREoLbc6xgJ8YwDeASqWL9kUHvW?=
 =?us-ascii?Q?KzF8TwEDXdYh5krWnn18HcetI/fWgwxyhw1nnvo5YM9TGGcEPKJy+s42VtFG?=
 =?us-ascii?Q?efRYzgtBkRZKkJOn5WuUoPJvwWbaOZyl43sGIWQxQVUXWh5i2phRrrJx1qjb?=
 =?us-ascii?Q?/HjOpVwlL+zD5BSOpAigjvTTZCjgOYsr5IC627/RxeYXk7DuuRjfjfgd5NPs?=
 =?us-ascii?Q?jawuURKMPFlMEz+hKFhdCuQ/M+L585tr5U0ef5GchJa80k8m3c6G7tF8OFEN?=
 =?us-ascii?Q?XU2UDuxtJLJgsPBq0YG4ConFKzvKlqcjBHREhJu3Ke6u2dbD8s8eEPs+x7BM?=
 =?us-ascii?Q?2dmhbmFDefmGwWZ9Tj9fVTOaRhL3tsXTANGuGgHHTYR51yRitoHEMoIbfuRR?=
 =?us-ascii?Q?6NvneQlNzdOAYz7qyWw0hD3/NB29Qr4ktH2Bul3YTB8BQ6r7wK3SusNn+l2w?=
 =?us-ascii?Q?Q2D/ojmATH1NlKQm1KPteVvVtqSUzwPFVj0QMD2lT+FY1UI6o8d95fm1WTQK?=
 =?us-ascii?Q?6o/r+pubaaOZeCuzrwVyfMyoiHg3tfyDjn8/f2q/qk95WHRRVaDlknVRJZ5n?=
 =?us-ascii?Q?J/Ft/5fwO+CC5etNKtExuZiJbMtT2BTIRrvjohMGW1QoW8vTpLA3ZWeL78r2?=
 =?us-ascii?Q?8B+6+THIT/LoH6RlNA/l9RC6RPdlHha4s/UGU/FDBw3tbmAT8Vg8XSbohrsz?=
 =?us-ascii?Q?NE4poV8lSQ0zcR7kity1hIsGJrqFh1HHLPgHf7lBCNcU8UdAvGX8RzjRfBX2?=
 =?us-ascii?Q?2W1PN0uc+qj1U4zWBXm81fQZxV4CUDR3iYZLSofV4mlMn3PTJ6Q7OXeXdVaX?=
 =?us-ascii?Q?jTC0GGKjyLLn7z/ybqVFDxpD0L+2f6OT70lLfupLfXgAxaf9JMF16VAKmCWt?=
 =?us-ascii?Q?qa/rOe58yd9frnMfug1N4VIbr2NYk3dMNU4d9Ki4vdjX+Dl5bJj6xCIcMXZY?=
 =?us-ascii?Q?g26pxN+YpUFM+V4NrYq+LE3G1BB1k/vk0O/G5iX/bWyEcykazuj2Ix3i6Cbb?=
 =?us-ascii?Q?6JctszVYOwC8hKxzjn0DgHWtV2UByH47Di62bVxZBBL1JKaLn2b66ckmafg7?=
 =?us-ascii?Q?LHeabkSjzpJRkLpnYTzGQauLbe97QEblx/J4XRRXa33/xlWdeKbVa/Zij70q?=
 =?us-ascii?Q?aO/scBokSZmbREW0VT8DdpkAFZZrvRrJ344gjgNSZvbg6KjpS82krWItrF2P?=
 =?us-ascii?Q?Cb5lUcv+ZaThtTSexfrHnQ1Ecl4+v3xt2mea1WLb8ouRErKA/Br66a7ziDBp?=
 =?us-ascii?Q?Da8F8NNSDQM49oZY1vkltz8PWaIgDm6c3J9EqolJbvM1aODvjV+t9hBMDlCC?=
 =?us-ascii?Q?PRdFDlCh7DXAfhxk6ONt6AjkQQ1F98o0w+xqnTZzB3TZJAqaWcnOsS4SVmAs?=
 =?us-ascii?Q?LOWf5NI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:47.0347 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f92949-3691-4255-3f6e-08dc7ebd3456
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9228
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

The nouveau_cli that owns the channel is now stored in nouveau_chan, and
it has a pointer to the drm device already.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c  |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_bo0039.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo5039.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c   | 23 +++++++++--------------
 drivers/gpu/drm/nouveau/nouveau_chan.h   |  1 -
 drivers/gpu/drm/nouveau/nouveau_dma.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_fence.c  | 15 ++++++++-------
 drivers/gpu/drm/nouveau/nouveau_gem.c    |  7 ++++---
 drivers/gpu/drm/nouveau/nv17_fence.c     |  6 +++---
 drivers/gpu/drm/nouveau/nv50_fence.c     |  2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c     |  8 ++++----
 11 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 41fd6e339221..eff43bfb7521 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1042,7 +1042,7 @@ nv04_finish_page_flip(struct nouveau_channel *chan,
 		      struct nv04_page_flip_state *ps)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct nouveau_drm *drm = chan->drm;
+	struct nouveau_drm *drm = chan->cli->drm;
 	struct drm_device *dev = drm->dev;
 	struct nv04_page_flip_state *s;
 	unsigned long flags;
@@ -1098,7 +1098,7 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 		    struct nouveau_fence **pfence)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct nouveau_drm *drm = chan->drm;
+	struct nouveau_drm *drm = chan->cli->drm;
 	struct drm_device *dev = drm->dev;
 	struct nvif_push *push = chan->chan.push;
 	unsigned long flags;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index e2ce44adaa5c..2babc6c47241 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -104,6 +104,6 @@ nv04_bo_move_init(struct nouveau_channel *chan, u32 handle)
 		return ret;
 
 	PUSH_MTHD(push, NV039, SET_OBJECT, handle);
-	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_NOTIFIES, chan->drm->ntfy.handle);
+	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_NOTIFIES, chan->cli->drm->ntfy.handle);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index c6cf3629a9f9..0a6b1fce1108 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -144,7 +144,7 @@ nv50_bo_move_init(struct nouveau_channel *chan, u32 handle)
 		return ret;
 
 	PUSH_MTHD(push, NV5039, SET_OBJECT, handle);
-	PUSH_MTHD(push, NV5039, SET_CONTEXT_DMA_NOTIFY, chan->drm->ntfy.handle,
+	PUSH_MTHD(push, NV5039, SET_CONTEXT_DMA_NOTIFY, chan->cli->drm->ntfy.handle,
 				SET_CONTEXT_DMA_BUFFER_IN, chan->vram.handle,
 				SET_CONTEXT_DMA_BUFFER_OUT, chan->vram.handle);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 88152dbff8ac..287c74072c65 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -90,12 +90,10 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 {
 	struct nouveau_channel *chan = *pchan;
 	if (chan) {
-		struct nouveau_cli *cli = (void *)chan->user.client;
-
 		if (chan->fence)
-			nouveau_fence(chan->drm)->context_del(chan);
+			nouveau_fence(chan->cli->drm)->context_del(chan);
 
-		if (cli)
+		if (nvif_object_constructed(&chan->user))
 			nouveau_svmm_part(chan->vmm->svmm, chan->inst);
 
 		nvif_object_dtor(&chan->blit);
@@ -157,7 +155,6 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		return -ENOMEM;
 
 	chan->cli = cli;
-	chan->drm = drm;
 	chan->vmm = nouveau_cli_vmm(cli);
 	atomic_set(&chan->killed, 0);
 
@@ -228,12 +225,11 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 			args.limit = device->info.ram_user - 1;
 		}
 	} else {
-		if (chan->drm->agp.bridge) {
+		if (drm->agp.bridge) {
 			args.target = NV_DMA_V0_TARGET_AGP;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
-			args.start = chan->drm->agp.base;
-			args.limit = chan->drm->agp.base +
-				     chan->drm->agp.size - 1;
+			args.start = drm->agp.base;
+			args.limit = drm->agp.base + drm->agp.size - 1;
 		} else {
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
@@ -420,12 +416,11 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.start = 0;
 			args.limit = chan->vmm->vmm.limit - 1;
 		} else
-		if (chan->drm->agp.bridge) {
+		if (drm->agp.bridge) {
 			args.target = NV_DMA_V0_TARGET_AGP;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
-			args.start = chan->drm->agp.base;
-			args.limit = chan->drm->agp.base +
-				     chan->drm->agp.size - 1;
+			args.start = drm->agp.base;
+			args.limit = drm->agp.base + drm->agp.size - 1;
 		} else {
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
@@ -490,7 +485,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* initialise synchronisation */
-	return nouveau_fence(chan->drm)->context_new(chan);
+	return nouveau_fence(drm)->context_new(chan);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 18a9cbfef8ca..3ce9832c9528 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -13,7 +13,6 @@ struct nouveau_channel {
 	} chan;
 
 	struct nouveau_cli *cli;
-	struct nouveau_drm *drm;
 	struct nouveau_vmm *vmm;
 
 	struct nvif_mem mem_userd;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index b01c029f3a90..a1f329ef0641 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -72,7 +72,7 @@ void
 nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
 	      bool no_prefetch)
 {
-	struct nvif_user *user = &chan->drm->client.device.user;
+	struct nvif_user *user = &chan->cli->drm->client.device.user;
 	struct nouveau_bo *pb = chan->push.buffer;
 	int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index ff602a0f674d..09686d038d60 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -181,8 +181,9 @@ nouveau_fence_wait_uevent_handler(struct nvif_event *event, void *repv, u32 repc
 void
 nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_chan *fctx)
 {
-	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
-	struct nouveau_cli *cli = (void *)chan->user.client;
+	struct nouveau_cli *cli = chan->cli;
+	struct nouveau_drm *drm = cli->drm;
+	struct nouveau_fence_priv *priv = (void*)drm->fence;
 	struct {
 		struct nvif_event_v0 base;
 		struct nvif_chan_event_v0 host;
@@ -193,11 +194,11 @@ nouveau_fence_context_new(struct nouveau_channel *chan, struct nouveau_fence_cha
 	INIT_LIST_HEAD(&fctx->flip);
 	INIT_LIST_HEAD(&fctx->pending);
 	spin_lock_init(&fctx->lock);
-	fctx->context = chan->drm->runl[chan->runlist].context_base + chan->chid;
+	fctx->context = drm->runl[chan->runlist].context_base + chan->chid;
 
-	if (chan == chan->drm->cechan)
+	if (chan == drm->cechan)
 		strcpy(fctx->name, "copy engine channel");
-	else if (chan == chan->drm->channel)
+	else if (chan == drm->channel)
 		strcpy(fctx->name, "generic kernel channel");
 	else
 		strcpy(fctx->name, cli->name);
@@ -221,7 +222,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
 {
 	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
+	struct nouveau_fence_priv *priv = (void*)chan->cli->drm->fence;
 	int ret;
 
 	fence->timeout  = jiffies + (15 * HZ);
@@ -382,7 +383,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 			if (i == 0 && usage == DMA_RESV_USAGE_WRITE)
 				continue;
 
-			f = nouveau_local_fence(fence, chan->drm);
+			f = nouveau_local_fence(fence, chan->cli->drm);
 			if (f) {
 				struct nouveau_channel *prev;
 				bool must_wait = true;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5a887d67dc0e..22f4ee483ff3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -567,10 +567,11 @@ validate_init(struct nouveau_channel *chan, struct drm_file *file_priv,
 }
 
 static int
-validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
+validate_list(struct nouveau_channel *chan,
 	      struct list_head *list, struct drm_nouveau_gem_pushbuf_bo *pbbo)
 {
-	struct nouveau_drm *drm = chan->drm;
+	struct nouveau_cli *cli = chan->cli;
+	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_bo *nvbo;
 	int ret, relocs = 0;
 
@@ -642,7 +643,7 @@ nouveau_gem_pushbuf_validate(struct nouveau_channel *chan,
 		return ret;
 	}
 
-	ret = validate_list(chan, cli, &op->list, pbbo);
+	ret = validate_list(chan, &op->list, pbbo);
 	if (unlikely(ret < 0)) {
 		if (ret != -ERESTARTSYS)
 			NV_PRINTK(err, cli, "validating bo list\n");
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 07c2e0878c24..7fa52ec61b30 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -36,8 +36,8 @@ int
 nv17_fence_sync(struct nouveau_fence *fence,
 		struct nouveau_channel *prev, struct nouveau_channel *chan)
 {
-	struct nouveau_cli *cli = (void *)prev->user.client;
-	struct nv10_fence_priv *priv = chan->drm->fence;
+	struct nouveau_cli *cli = prev->cli;
+	struct nv10_fence_priv *priv = cli->drm->fence;
 	struct nv10_fence_chan *fctx = chan->fence;
 	struct nvif_push *ppush = prev->chan.push;
 	struct nvif_push *npush = chan->chan.push;
@@ -76,7 +76,7 @@ nv17_fence_sync(struct nouveau_fence *fence,
 static int
 nv17_fence_context_new(struct nouveau_channel *chan)
 {
-	struct nv10_fence_priv *priv = chan->drm->fence;
+	struct nv10_fence_priv *priv = chan->cli->drm->fence;
 	struct ttm_resource *reg = priv->bo->bo.resource;
 	struct nv10_fence_chan *fctx;
 	u32 start = reg->start * PAGE_SIZE;
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index ea1e1f480bfe..8b76cb227f55 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -35,7 +35,7 @@
 static int
 nv50_fence_context_new(struct nouveau_channel *chan)
 {
-	struct nv10_fence_priv *priv = chan->drm->fence;
+	struct nv10_fence_priv *priv = chan->cli->drm->fence;
 	struct nv10_fence_chan *fctx;
 	struct ttm_resource *reg = priv->bo->bo.resource;
 	u32 start = reg->start * PAGE_SIZE;
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 812b8c62eeba..7f62089dc940 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -79,7 +79,7 @@ nv84_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 static inline u32
 nv84_fence_chid(struct nouveau_channel *chan)
 {
-	return chan->drm->runl[chan->runlist].chan_id_base + chan->chid;
+	return chan->cli->drm->runl[chan->runlist].chan_id_base + chan->chid;
 }
 
 static int
@@ -105,14 +105,14 @@ nv84_fence_sync(struct nouveau_fence *fence,
 static u32
 nv84_fence_read(struct nouveau_channel *chan)
 {
-	struct nv84_fence_priv *priv = chan->drm->fence;
+	struct nv84_fence_priv *priv = chan->cli->drm->fence;
 	return nouveau_bo_rd32(priv->bo, nv84_fence_chid(chan) * 16/4);
 }
 
 static void
 nv84_fence_context_del(struct nouveau_channel *chan)
 {
-	struct nv84_fence_priv *priv = chan->drm->fence;
+	struct nv84_fence_priv *priv = chan->cli->drm->fence;
 	struct nv84_fence_chan *fctx = chan->fence;
 
 	nouveau_bo_wr32(priv->bo, nv84_fence_chid(chan) * 16 / 4, fctx->base.sequence);
@@ -127,7 +127,7 @@ nv84_fence_context_del(struct nouveau_channel *chan)
 int
 nv84_fence_context_new(struct nouveau_channel *chan)
 {
-	struct nv84_fence_priv *priv = chan->drm->fence;
+	struct nv84_fence_priv *priv = chan->cli->drm->fence;
 	struct nv84_fence_chan *fctx;
 	int ret;
 
-- 
2.44.0

