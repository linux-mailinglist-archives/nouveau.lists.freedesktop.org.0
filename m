Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66292AD64
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B34910E473;
	Tue,  9 Jul 2024 00:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MlzQwUSs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D038910E450
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFAS16idkJU7G3vbWzwJdQfvsl+Lbg5grzk/bzY7PUJi1o2Ctn24fd1GrQ/vNxFPWIqOTUrVWBA7AAxkqHJ7avmR8Dk6TEV7VPW9gopAndxInSWJVZqkR2VCoMsWKpvuF3sXBiG56Eo+inkj/d5JtzoAC0o0/EaK5u1J2j82SwgHHHV4hlyzQUo4CZqkJT6qsaTIENyZYNnQ5nw+ovmjc3Icg3Ua8OAYWAIGl9ik6MFMWLM1vqHC9ELlqrXrQaliHuRw3UcJX3juzI106hCG0p8yCokKd+tKAcR5L/YW6kxIgQ7oFtlSH5hFcGDdG3gsFfuePcBG2J4p6dbY+jn5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNMhI4zmXAHNxm1Sc3c3CSBYm3RHk1DhCxJYUbneV1U=;
 b=Oa9/fj87BIEOVif6XMUXQSjh8cBVFU7vN3LRC+uvwyUx0K9YINmH9lOAXG7MUvyFVPymXkzIZp0dqaSHHxqaSL7UqJ9PStCdraWrDO9JrFk+SslaoCQ7fqDjJSQLkQRofU8z7lgMrDAfkuy6h8GZqOPNHISYu15Ly+ylKXX+o6hqQ/U1X/RVxCzPSitcV+HEVj0Gfco3NOdoehWMAuC2UGyyn8YBkCvj7mIso+NoDAu1VuOPoXvJEi6yiUhflHY28ZKwQxmQYZcTVyvjeY7IW3wtHccOuRssBOkUCMk97+OEbUEhkXZV+vzO1F9tD1t20Ia+SjRVZzhYt7US8AcOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNMhI4zmXAHNxm1Sc3c3CSBYm3RHk1DhCxJYUbneV1U=;
 b=MlzQwUSs+g13IO9uqNtlLnVgNxKUDBDwIs0mighZU96l+cDU/p+48kCfx5xIjaIxuOnndenC8VkSmeS7bTluTjq6yEA0ZKlKUKWgbKISwZZ86D1HhiuOp5JPpFZ2mtxlGQ7FwU1DONfTmmnBnn0eZOfYBsqL8v9GvXOvr2/jiCSsz6ukGAIqxnPTTxJqI+dNpGgG3RZgRDn//gWHFnvfj+oFmZe0BZXLgm/C5wFwLF/vWbfIuZ5Sj1AgdXjnqOb84ep6vHpL7vvj2Qb4geS3GsjLIz9jcseza7Dw6AEdVXqoxmav7VOgNgpHFzYEEwh1+PBHxnS3XkUKw1D/R6M2GQ==
Received: from CH2PR14CA0007.namprd14.prod.outlook.com (2603:10b6:610:60::17)
 by PH8PR12MB6772.namprd12.prod.outlook.com (2603:10b6:510:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:41 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::82) by CH2PR14CA0007.outlook.office365.com
 (2603:10b6:610:60::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:32 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 33/37] drm/nouveau: remove chan->drm
Date: Fri, 5 Jul 2024 04:37:17 +1000
Message-ID: <20240704183721.25778-34-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|PH8PR12MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: eb492cfe-df86-495d-38ea-08dc9fb1dad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NUoElVO0+zrJUReO+q4Pc3y2j1W8U6TN/SpLhf7vuVk/1S2fJXbd9w1pR1Tf?=
 =?us-ascii?Q?Al0Ku//nXsdM2xdFMS0WSZK/Ns98qVy55k0sSbWbe4Mj+Xq8tI+QcXuYdyeJ?=
 =?us-ascii?Q?rrNWyQqdxZRMu9zGLkr10W6DYYNidOAb9MfdElDMPTIouGJujlJS5uFMO0zQ?=
 =?us-ascii?Q?eH7b1xkhvENFakzuz9otDp3PLBbJO83ZL/t2C9j2f9kbXaENXegCD+fzLHPC?=
 =?us-ascii?Q?PLmsTzQ3CnfcTdGgl+Pz9kOnZBdvV7Qq2MXmd0C/hTy0sIO474Wxe0Wgjw7g?=
 =?us-ascii?Q?yCYYvzukTBVPcvSQMG190zhLoW3MT+XVXKFXCoZoGIQ0xabwbndVbe2XTvD1?=
 =?us-ascii?Q?HnJh2FDd/DH1HFqK7/e1QpESMPMi/cMpiFqP+LUsAsYqI4gB5uhsNGrTjspH?=
 =?us-ascii?Q?UtWShLiCCjiW3OkFenQWYBocfBjqNrK80+2JxHM8ekOVkwV0tWqCgPTwCoiv?=
 =?us-ascii?Q?JcMebkosHcli5J4mfzVY1qU2sVV13pQ4mD7mq7i7z9HHrZNb5kHE0PxE+mf8?=
 =?us-ascii?Q?fENwpsfHDzpPxLO5ZJq0cqMyDyd4BzJRBuhXh1vjASefI+RwYlCdo0896gID?=
 =?us-ascii?Q?t3yrdCtFkvimK46ogAQvkm2mBavU9R4qsWA9JRmF3jxrs3UNvLkSicbG1NLP?=
 =?us-ascii?Q?CQEbzhmCklBc1yc3dK8vsyPDLBko8+pE0S9CkDFFoTpMvMK+rNBLZd7qj/S8?=
 =?us-ascii?Q?KYohkGxi0OD895m3NzQ7kBF2heGgpK9haGTHY+tW+vip4ZQ+RMNZJrad6wzx?=
 =?us-ascii?Q?jMHQawFAXGrLlEpEgPTESJU3jL5x5HXxMnqRglUwIJ5kXRc0hG66snnEUFbN?=
 =?us-ascii?Q?hW3RGrWn2herB7n24cQjMM8lCXTUwBTJgU0wfpi2dPi/XSINFBA4c+ufMUrY?=
 =?us-ascii?Q?Fw7cWb+FR5G2mjlkqV+ajb1/zjBMn6650yMCbjxjwobNyRQscDE85BT1Xiiv?=
 =?us-ascii?Q?fiPCFVsGADRYUKmaj/aSQnnYstKZDpqJ08y0rrWgI7859xYYgx4GpBiD3U/W?=
 =?us-ascii?Q?O7WSxXfjpl7LTPuccDkpPPVUuvYpYjzFYu5U8cFnygKSlV/W6UeqQOh3wsZ/?=
 =?us-ascii?Q?+tI1NWxU22LJEGG9Lud/2FEl80FJCrxBQ2wCd3RnnB/crRGoYtFGHubfQtsJ?=
 =?us-ascii?Q?BsRPoN227MsXuaNl5P+z5esqxA9p2xjEvxvG8tjCa8drnAwAe8rF7kzIxJ6I?=
 =?us-ascii?Q?1neCKEfY7yDnLkK3LslziB8fo8SfvIhBEA0QSOfQAYiilDXPrL0iHYPo+qXO?=
 =?us-ascii?Q?cYWYJ0s93DLI2GaRZN/D3FsUFihDDcnHpnwDssOtRFu69UYINfkZP7rsBYZX?=
 =?us-ascii?Q?TEcphJWv3i+oFalZQ1jZL2vVpBOLexRTc9/nHxwAQhUr8uPvWMQXYGLyaBDv?=
 =?us-ascii?Q?1KFaXBHcEeTbgFxeyVhf0fYhbVYNYiIxcpq9WU5kjT9QBr7buklYrOCzyR0Y?=
 =?us-ascii?Q?ijj0U5BPr0EZnTTU6lxUzum1Lz3Yc5+W?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:40.7680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb492cfe-df86-495d-38ea-08dc9fb1dad8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6772
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
index b01535ea4ea3..f1665b06c698 100644
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
2.45.1

