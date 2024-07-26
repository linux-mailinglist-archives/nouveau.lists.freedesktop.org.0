Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 003C093CD59
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EB210E91F;
	Fri, 26 Jul 2024 04:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m96jvMt4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B35E10E918
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6khQF3j38VuMpvhmSE3IlBND5HcVBA+wERZv9KAP6TP15CKcidSaxOT4RZMK1o/xdT0U9du3autOdWH4enYI4wNl7evFuw2XJdaLyXF7CtTATVSuzp78XgxyJExNVHK07C8vNbzvG48W4Sl3U40BE9YnLiMOInKhP2iw1dn906JP7bZIb8+pKdpobfixhpBVV3jyyrVYpqh0DhwqTPyVTf/UOffHz78jGwySRDYlF+GtRed6kqY4Z/n+dBRIES/FNZyiHr9QMKrG0frp//OwsM+v9H/vsd6JBzug+5/CsHe/b9W7vtpQEr9vSI1IWC7jKBgGw1gN0Me5WW/xQbOwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1MkeMKX3Rodqn7dVBfwZDJh/o/jeoqDZX6AmHxFk1U0=;
 b=g4oG9CZmCgiIe4VibfJuMeMxIhARnrIcTMSfOuOkJSNfOLyC28u9cPezz/Hg+nw53TA3qw/XtVBl0jxSDS7R97aKtq+3WHUgOgKs5Wh9iVjaud+CCkS/h0ZFs174bznkmfp3N2gELAG+tjsMVcS9u+Ek/j6j5XvvfWUCGZA06yOuRgXeiygU8Iss/M8F7Gd/ncPBI+5fMQm1aCcmoMQ6u37ucVlLJOQqhk2bmC95IFpxJEwsHz4FPBdNcFY9nJQzO516DK46lBBuMep6mnpe+FA0w4XB9nwaV2JvQDre+FuCh7afbI6IKsCZQkD90hYFWynaKmXvZy83QMCa5mDTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MkeMKX3Rodqn7dVBfwZDJh/o/jeoqDZX6AmHxFk1U0=;
 b=m96jvMt4eWuNvVm0/p/ps4+6efczIvkDzbfT+nTn82nRUxaIXgxouJ/JXEAsl7vOaYrg+NxYH/zB/YWrRmcMFjVMQZuUyt02W86d9G28ZUEDNuJ5DJFQ9lfzZ0gfIkFqXVzQYq+2gSzdAXDIG8ao4+XkSnotAQ5k0ZQqCDKm9UWLJ49tJcYbwNzjP/0YMahSYHRsfMlsvG0s8inQo7+tH2ooQKfzeq6hTWawEuF4N1wA3LkJDRN7EuqI6mZ4Lm8A5kKXfoF7WfVJGCT+NPSHvzfpltapNsG1/OpTRY168F4Evh2TnVkwSguLi8JUZfwKkFgmXkmFcqfjjFxvx5MHDg==
Received: from DS7PR03CA0336.namprd03.prod.outlook.com (2603:10b6:8:55::20) by
 MW3PR12MB4444.namprd12.prod.outlook.com (2603:10b6:303:5c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.28; Fri, 26 Jul 2024 04:39:44 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:8:55:cafe::5c) by DS7PR03CA0336.outlook.office365.com
 (2603:10b6:8:55::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:30 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 33/37] drm/nouveau: remove chan->drm
Date: Fri, 26 Jul 2024 14:38:24 +1000
Message-ID: <20240726043828.58966-34-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MW3PR12MB4444:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f490e70-4573-492a-ecb8-08dcad2cf883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gIC/N2Z4wHJ9rUZMerha+h1pnYczAVFjh7EdY8q4OOzguOBbaVqh0iukdTtJ?=
 =?us-ascii?Q?85feyf/3H/1nrAUU6E27EOf4OCeXbSpWzfDSYkyiDdUY8Tom6OMiRLB2QzCu?=
 =?us-ascii?Q?55Z3Du3IIb1kslJmgunCt9bx8cX+I1Nd4zfNi5tZLF0pdj1h+4q1lkxSF2mA?=
 =?us-ascii?Q?yt62Xo0YZsQgGW7xsJRlrTCAneqDiicSJvu0gYB13aWTRpWq4xQpd8GmHBHO?=
 =?us-ascii?Q?mbYnysCEJyOwhd/wMHaqd0U2FrlD+jBnjbux6vJ57B/TyJmU/P/ifANSNdLb?=
 =?us-ascii?Q?6tYXb9w+fld107XJ00ZPFP4ct91tb+xe4uP1ISyWv1TTPwfD4V2HPHBNIyNI?=
 =?us-ascii?Q?JYQkTUTooaISUYWA1C/HxSVbeGl2MrAYTP+8wD9/mI7H5NSWyl5N3T5OKuBU?=
 =?us-ascii?Q?WYrn/xXLItu7X75drGMc4tqRfxF7pC7BYlUMcO15IZEGoVcMrgS//QXCx6WS?=
 =?us-ascii?Q?V05RuieaOWBJFvXNX+ddwSNVLKY70+j1FfDzGGGrgiIcSwTOSmOFQ4XLaiPk?=
 =?us-ascii?Q?MfDSM7d8F1RvW1weqaGy5n4CiZ4yD83d2fOAtg9to+ubc9a9s6TIEzLJhFM0?=
 =?us-ascii?Q?PGj+PRzVh8LGjlMWftBStlXovcNOQ3q/WGK1WQc9EsmLRitokiwuM4JMOpF8?=
 =?us-ascii?Q?wwYoP5y8T3fuI8uBbG2jLOSViqsGJDom41zDVhagri1iHHYvVoJh3S8c1IYx?=
 =?us-ascii?Q?r0vpf8YGNstCI6LS8lExEcn8+S5YBz6w1QgHGPgnhH/54Rvkxse7TydSj1lS?=
 =?us-ascii?Q?BcEv1slt+hRz4LKh6ewS3FXJZiZDBkPG/uwtTxQ+bqOHXyaqhsIUAVu6twUP?=
 =?us-ascii?Q?914RlCnQlx9iepJTiGmIACAR3v1lec1HG8v/9tpuAg5g2LQS8uts/iY7D0NV?=
 =?us-ascii?Q?ehZKSMF3TURMmpb221VNr9lLgM/y/nwWJs8sveyN6thxH56E+Mj1DjJZZMbR?=
 =?us-ascii?Q?p6p3zomWDx8a24bcudyjpHQmTQm+Ucn0r/BT8JwIbSqkIUHyyDATNzYm7ruS?=
 =?us-ascii?Q?E6xv/TD+YNa1uwMq8HP8oVaeS+gC42JQIKQ3rlWIixGb7zjnci2WqiZT4fAH?=
 =?us-ascii?Q?TPM0a/S/R9NCbHJZegacKkNYnSvxJ76nEXINhsQm3aXtR5O0w17n3V8vbQgL?=
 =?us-ascii?Q?76UBOMqBi1sJQCFe9sHfaAOldq6ZsjBBMxI6R0WqbdL/7htVLfYy+u7/WHGr?=
 =?us-ascii?Q?eOwopGhj2NEgHtDPc0WLuLr7OzgI4WtmMwrZyWCc19a+fo35XnBuBor9a4zU?=
 =?us-ascii?Q?JUErYxoMBokn2BDSg/Mt4ahFCoNTrA011TkAlZD6lixVl0giivGlqKPfzOEO?=
 =?us-ascii?Q?A6P+9YNM5zy902xqJQ75LL3eUx98IaqsmUpv4iAPVn73Q8F6w7JZtE+3Vk1q?=
 =?us-ascii?Q?PWO4dgvSI41/ZRIee6vBOEYoWtevlBfxwH8p+Cvlrng4je4Bft7AxDKIyvHR?=
 =?us-ascii?Q?gE25ORIeUyHs4P2SHzrvG4Eo5deDuPM2?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:43.7766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f490e70-4573-492a-ecb8-08dcad2cf883
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4444
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
index 2ac5b6b904db..33ff21d40cfb 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1057,7 +1057,7 @@ nv04_finish_page_flip(struct nouveau_channel *chan,
 		      struct nv04_page_flip_state *ps)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
-	struct nouveau_drm *drm = chan->drm;
+	struct nouveau_drm *drm = chan->cli->drm;
 	struct drm_device *dev = drm->dev;
 	struct nv04_page_flip_state *s;
 	unsigned long flags;
@@ -1113,7 +1113,7 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
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
index 127bd518030d..e95b8092dae3 100644
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
index 1450fb8c57c3..6407bb4a3be9 100644
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
@@ -354,7 +355,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
 			if (i == 0 && usage == DMA_RESV_USAGE_WRITE)
 				continue;
 
-			f = nouveau_local_fence(fence, chan->drm);
+			f = nouveau_local_fence(fence, chan->cli->drm);
 			if (f) {
 				struct nouveau_channel *prev;
 				bool must_wait = true;
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 2e535caa7d6e..7b6f611a28b1 100644
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
index 2c99f2c1ddcd..51fcac894146 100644
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
index 6fa18f9d26b6..62e28dddf87c 100644
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
index 9ce4c2d60fe3..1f5a02a9239f 100644
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
2.45.1

