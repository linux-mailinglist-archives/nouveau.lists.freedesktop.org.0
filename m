Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FB18A78B9
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90690112F31;
	Tue, 16 Apr 2024 23:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LCzca8fq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2044.outbound.protection.outlook.com [40.107.100.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FC5112F2E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbIkU1fzAu4ZyI3yFUc6g2rQk9PeIdLphZzCcWXAZIDJ2mKDIwoe5KVjF+tOLZ+e2mKvg5WeDkCR2tKy9qswQI9x8EEG/9fMo1BfjpvDSDaVnCmF1uLVHrlAxBgcy2iNXMp5ZBnawcGu9TpPEw6UDcaIU4+VRNllLawKvTrEppIZHQTLCCxrx0rORqDSDLSsT4lcxHWxaOXQoFcDezSaHWGzmkreNRo4pwChYKWUzaBJ1QwUEXqc6aiBIhTscToW8OFtoEfSSD4EnIoNzFO6QRy/GPEI1oL0hx2F2QQbGvdEYUijCKiQd6JXbjYeifxrIYt+ljXu/RUbDYQiGRDDPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LZl3OXRugzkW21jrw6YxcFLW37wXydUqFoPnfX5Uho=;
 b=T187xv8/KcxtdZihTZBv5+zFo2j4EHPfGv9lZGHqGRe1WFrpZRZXchJcJrdn2azmzagUtS3KWX7eH2Y31NQ/EkGNF6+9Mn2ajq54xfbRmLxsVcOOy+IaCsrUeGePujBaTbi9To0PGp00+57TC4lBuVhEBKf10nwAMIzHBsYOBGCuYmNqSWfe1WWrrCm9i15ICrp0Pm/yhnm/ztbY9HyOyHmY90ewt+CBiOYC1411L7UVvOwQ/yfb16Ljs2k14VlhEq+5/nOA/ZUiDHt+xSXM7PNIqLPnw/WSeyo3h4/Ptg+LAQIMzb6TXKFvtyR0Zz+YGE6YgyxbTdM+GQWNOY/zBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LZl3OXRugzkW21jrw6YxcFLW37wXydUqFoPnfX5Uho=;
 b=LCzca8fqf2g5i59hYfbExYlx9n6ztpC5vx4ftdqsEv0cCCfbAtpOe3debUmVbWdb0HETqqI57hd/HJDJevjmOubKZp7khlsefclPj+4T/klGlH5LkpkYV4cPL5lW5XKTyYnRQG185MR3Ur7h+Ne0JjQ0EY4MquIDRES7BIPuqYgxKpTrN5sofIXlXoDZh+xr96jQlT+eYvTQf0vn9hZdziRlKC5wWPfsd+aOfgwxAgoPHT1xGWkd2yfdSWN0kVux9bFybUMrKjXMtHNigY2Ozxj2M4/89ZRxNCiNeWrJadFEkYsrIN+bjeW5eE1vqcORxJomcoGz9ciw3OCd8a4qfw==
Received: from BN9PR03CA0070.namprd03.prod.outlook.com (2603:10b6:408:fc::15)
 by IA0PR12MB7507.namprd12.prod.outlook.com (2603:10b6:208:441::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:08 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::36) by BN9PR03CA0070.outlook.office365.com
 (2603:10b6:408:fc::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:50 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:49 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 017/156] drm/nouveau: remove push pointer from nouveau_channel
Date: Wed, 17 Apr 2024 09:37:43 +1000
Message-ID: <20240416234002.19509-18-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA0PR12MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 61528325-e1f8-455b-3c55-08dc5e6eb0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +TCmwl2a2OXIdCq7TCQAiFHJiY6ZoKQBa7HMO80jCHcCA8buUoWV5vwqtLJtvwRwpR8+W3/TaiPIc17zu30usmifuQQnK9h73MjtxrdbPXrwYvq5YozXxRQqc/06K5pdOldsINkDB0A6xQXHLJAb9HatN/ajyaLGTPXzYH8OGsrciOPmZGhHF4XNVJedLA6WRDO3o8eLWDoQ+ZRMbSWJCF3KQLQeSHpcZErzmCynsfpe0ZYwC+u9xYUTMJBzbNHcGyZzfrDGExkZu2KvcukOYwjVNDQLjTyFjLNwHaHpLPegFWJFloUrwh2sTIqmIld2FvwcPPMlQmQxzR/NCtM8HnzHQNV/8rVbAXgWOaC/CPg5x+OqzaYGZH7cj7y9fXBEdLT0/9TFhjWw5D0YE29Cont6+7JffUnu0pKWh9VqWptPeUJT6u9B3GYQBqL9lHp5/80y/gEnh2Je0DRH4vH2PBNq+8SMMa5bmvlyzrzVBLR15BOVXH9YweaTo3NEGdYAT+sD3QoC7jHh/F3VlQEDMeT/mxQruFLt8Tv7wmUXX74WRNQpdC8D0uACIz/2nV2xH1P3EZw3gpz/4GgFcTw/pd2RJ5DH0Mbqv8jyKrdUUhYmocuAG31Hf6DNNZ3kawMecYCiSP1HfsavTzQ351Ema6x3AG421dqCEg7Jwpq/Zlk57LeVREyCqi/GzgZZnM/EYck+r21phmoMeqPUigg8MyBzytZgxQfvBFOydO+i396+ie4f0KQgJTwjz80+0Duq
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:08.5749 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61528325-e1f8-455b-3c55-08dc5e6eb0f1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7507
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

- the struct itself lives in nouveau_channel already, just use that

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c  |  4 +--
 drivers/gpu/drm/nouveau/nouveau_bo0039.c |  4 +--
 drivers/gpu/drm/nouveau/nouveau_bo5039.c |  4 +--
 drivers/gpu/drm/nouveau/nouveau_bo74c1.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo85b5.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo9039.c |  4 +--
 drivers/gpu/drm/nouveau/nouveau_bo90b5.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_boa0b5.c |  4 +--
 drivers/gpu/drm/nouveau/nouveau_chan.c   | 41 ++++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_chan.h   |  3 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 +--
 drivers/gpu/drm/nouveau/nouveau_drm.c    |  3 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c    | 14 ++++----
 drivers/gpu/drm/nouveau/nv04_fence.c     |  2 +-
 drivers/gpu/drm/nouveau/nv10_fence.c     |  2 +-
 drivers/gpu/drm/nouveau/nv17_fence.c     |  4 +--
 drivers/gpu/drm/nouveau/nv84_fence.c     |  4 +--
 drivers/gpu/drm/nouveau/nvc0_fence.c     |  4 +--
 18 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 3535cf571300..8e8a43b28f71 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1100,7 +1100,7 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_drm *drm = chan->cli->drm;
 	struct drm_device *dev = drm->dev;
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	unsigned long flags;
 	int ret;
 
@@ -1158,7 +1158,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	if (!chan)
 		return -ENODEV;
 	cli = chan->cli;
-	push = chan->chan.push;
+	push = &chan->chan.push;
 
 	s = kzalloc(sizeof(*s), GFP_KERNEL);
 	if (!s)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
index 2babc6c47241..0b6758e024a1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
@@ -47,7 +47,7 @@ int
 nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
 	u32 src_offset = old_reg->start << PAGE_SHIFT;
 	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
@@ -96,7 +96,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 int
 nv04_bo_move_init(struct nouveau_channel *chan, u32 handle)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 4);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
index 0a6b1fce1108..c3de17548d97 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo5039.c
@@ -40,7 +40,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	u64 length = new_reg->size;
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
@@ -136,7 +136,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 int
 nv50_bo_move_init(struct nouveau_channel *chan, u32 handle)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 6);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
index 9b7ba31fae13..e6ef79de2498 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
@@ -37,7 +37,7 @@ nv84_bo_move_exec(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 7);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
index a15a38a87a95..c4861d073ad4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
@@ -41,7 +41,7 @@ nva3_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
 	u32 page_count = PFN_UP(new_reg->size);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
index d2bb2687d401..ad82269c7725 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo9039.c
@@ -38,7 +38,7 @@ int
 nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
@@ -86,7 +86,7 @@ nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 int
 nvc0_bo_move_init(struct nouveau_channel *chan, u32 handle)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 2);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
index 4618f4f5ab56..5eaeef9d25e4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
@@ -34,7 +34,7 @@ nvc0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	u64 src_offset = mem->vma[0].addr;
 	u64 dst_offset = mem->vma[1].addr;
 	u32 page_count = PFN_UP(new_reg->size);
diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
index 07a5c6302c98..dff2ae0e1e45 100644
--- a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
+++ b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
@@ -39,7 +39,7 @@ nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 		  struct ttm_resource *old_reg, struct ttm_resource *new_reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(old_reg);
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 10);
@@ -78,7 +78,7 @@ nve0_bo_move_copy(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
 int
 nve0_bo_move_init(struct nouveau_channel *chan, u32 handle)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 2);
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index ea8db569bd1a..db86cca9ea37 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -117,24 +117,24 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 static void
 nouveau_channel_kick(struct nvif_push *push)
 {
-	struct nouveau_channel *chan = container_of(push, typeof(*chan), chan._push);
-	chan->dma.cur = chan->dma.cur + (chan->chan._push.cur - chan->chan._push.bgn);
+	struct nouveau_channel *chan = container_of(push, typeof(*chan), chan.push);
+	chan->dma.cur = chan->dma.cur + (chan->chan.push.cur - chan->chan.push.bgn);
 	FIRE_RING(chan);
-	chan->chan._push.bgn = chan->chan._push.cur;
+	chan->chan.push.bgn = chan->chan.push.cur;
 }
 
 static int
 nouveau_channel_wait(struct nvif_push *push, u32 size)
 {
-	struct nouveau_channel *chan = container_of(push, typeof(*chan), chan._push);
+	struct nouveau_channel *chan = container_of(push, typeof(*chan), chan.push);
 	int ret;
-	chan->dma.cur = chan->dma.cur + (chan->chan._push.cur - chan->chan._push.bgn);
+	chan->dma.cur = chan->dma.cur + (chan->chan.push.cur - chan->chan.push.bgn);
 	ret = RING_SPACE(chan, size);
 	if (ret == 0) {
-		chan->chan._push.bgn = chan->chan._push.mem.object.map.ptr;
-		chan->chan._push.bgn = chan->chan._push.bgn + chan->dma.cur;
-		chan->chan._push.cur = chan->chan._push.bgn;
-		chan->chan._push.end = chan->chan._push.bgn + size;
+		chan->chan.push.bgn = chan->chan.push.mem.object.map.ptr;
+		chan->chan.push.bgn = chan->chan.push.bgn + chan->dma.cur;
+		chan->chan.push.cur = chan->chan.push.bgn;
+		chan->chan.push.end = chan->chan.push.bgn + size;
 	}
 	return ret;
 }
@@ -176,13 +176,12 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		return ret;
 	}
 
-	chan->chan._push.mem.object.parent = cli->base.object.parent;
-	chan->chan._push.mem.object.client = &cli->base;
-	chan->chan._push.mem.object.name = "chanPush";
-	chan->chan._push.mem.object.map.ptr = chan->push.buffer->kmap.virtual;
-	chan->chan._push.wait = nouveau_channel_wait;
-	chan->chan._push.kick = nouveau_channel_kick;
-	chan->chan.push = &chan->chan._push;
+	chan->chan.push.mem.object.parent = cli->base.object.parent;
+	chan->chan.push.mem.object.client = &cli->base;
+	chan->chan.push.mem.object.name = "chanPush";
+	chan->chan.push.mem.object.map.ptr = chan->push.buffer->kmap.virtual;
+	chan->chan.push.wait = nouveau_channel_wait;
+	chan->chan.push.kick = nouveau_channel_kick;
 
 	/* create dma object covering the *entire* memory space that the
 	 * pushbuf lives in, this is because the GEM code requires that
@@ -461,12 +460,12 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	chan->dma.cur = chan->dma.put;
 	chan->dma.free = chan->dma.max - chan->dma.cur;
 
-	ret = PUSH_WAIT(chan->chan.push, NOUVEAU_DMA_SKIPS);
+	ret = PUSH_WAIT(&chan->chan.push, NOUVEAU_DMA_SKIPS);
 	if (ret)
 		return ret;
 
 	for (i = 0; i < NOUVEAU_DMA_SKIPS; i++)
-		PUSH_DATA(chan->chan.push, 0x00000000);
+		PUSH_DATA(&chan->chan.push, 0x00000000);
 
 	/* allocate software object class (used for fences on <= nv05) */
 	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
@@ -476,12 +475,12 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		if (ret)
 			return ret;
 
-		ret = PUSH_WAIT(chan->chan.push, 2);
+		ret = PUSH_WAIT(&chan->chan.push, 2);
 		if (ret)
 			return ret;
 
-		PUSH_NVSQ(chan->chan.push, NV_SW, 0x0000, chan->nvsw.handle);
-		PUSH_KICK(chan->chan.push);
+		PUSH_NVSQ(&chan->chan.push, NV_SW, 0x0000, chan->nvsw.handle);
+		PUSH_KICK(&chan->chan.push);
 	}
 
 	/* initialise synchronisation */
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 3ce9832c9528..016f668c0bc1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -8,8 +8,7 @@ struct nvif_device;
 
 struct nouveau_channel {
 	struct {
-		struct nvif_push _push;
-		struct nvif_push *push;
+		struct nvif_push push;
 	} chan;
 
 	struct nouveau_cli *cli;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 6fb65b01d778..b2f20e33bf66 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -443,7 +443,7 @@ nvc0b5_migrate_copy(struct nouveau_drm *drm, u64 npages,
 		    enum nouveau_aper dst_aper, u64 dst_addr,
 		    enum nouveau_aper src_aper, u64 src_addr)
 {
-	struct nvif_push *push = drm->dmem->migrate.chan->chan.push;
+	struct nvif_push *push = &drm->dmem->migrate.chan->chan.push;
 	u32 launch_dma = 0;
 	int ret;
 
@@ -516,7 +516,7 @@ static int
 nvc0b5_migrate_clear(struct nouveau_drm *drm, u32 length,
 		     enum nouveau_aper dst_aper, u64 dst_addr)
 {
-	struct nvif_push *push = drm->dmem->migrate.chan->chan.push;
+	struct nvif_push *push = &drm->dmem->migrate.chan->chan.push;
 	u32 launch_dma = 0;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9a4f2b0a8463..92b347b79919 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -389,7 +389,8 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 		}
 
 		if (ret == 0) {
-			struct nvif_push *push = drm->channel->chan.push;
+			struct nvif_push *push = &drm->channel->chan.push;
+
 			ret = PUSH_WAIT(push, 8);
 			if (ret == 0) {
 				if (device->info.chipset >= 0x11) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 22f4ee483ff3..9ae2cee1c7c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -871,7 +871,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		}
 	} else
 	if (drm->client.device.info.chipset >= 0x25) {
-		ret = PUSH_WAIT(chan->chan.push, req->nr_push * 2);
+		ret = PUSH_WAIT(&chan->chan.push, req->nr_push * 2);
 		if (ret) {
 			NV_PRINTK(err, cli, "cal_space: %d\n", ret);
 			goto out;
@@ -881,11 +881,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			struct nouveau_bo *nvbo = (void *)(unsigned long)
 				bo[push[i].bo_index].user_priv;
 
-			PUSH_CALL(chan->chan.push, nvbo->offset + push[i].offset);
-			PUSH_DATA(chan->chan.push, 0);
+			PUSH_CALL(&chan->chan.push, nvbo->offset + push[i].offset);
+			PUSH_DATA(&chan->chan.push, 0);
 		}
 	} else {
-		ret = PUSH_WAIT(chan->chan.push, req->nr_push * (2 + NOUVEAU_DMA_SKIPS));
+		ret = PUSH_WAIT(&chan->chan.push, req->nr_push * (2 + NOUVEAU_DMA_SKIPS));
 		if (ret) {
 			NV_PRINTK(err, cli, "jmp_space: %d\n", ret);
 			goto out;
@@ -914,10 +914,10 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 						push[i].length - 8) / 4, cmd);
 			}
 
-			PUSH_JUMP(chan->chan.push, nvbo->offset + push[i].offset);
-			PUSH_DATA(chan->chan.push, 0);
+			PUSH_JUMP(&chan->chan.push, nvbo->offset + push[i].offset);
+			PUSH_DATA(&chan->chan.push, 0);
 			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
-				PUSH_DATA(chan->chan.push, 0);
+				PUSH_DATA(&chan->chan.push, 0);
 		}
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index cdbc75e3d1f6..fa5c6029f783 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -39,7 +39,7 @@ struct nv04_fence_priv {
 static int
 nv04_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = unrcu_pointer(fence->channel)->chan.push;
+	struct nvif_push *push = &unrcu_pointer(fence->channel)->chan.push;
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index c6a0db5b9e21..1e45b5fcbf23 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -32,7 +32,7 @@
 int
 nv10_fence_emit(struct nouveau_fence *fence)
 {
-	struct nvif_push *push = fence->channel->chan.push;
+	struct nvif_push *push = &fence->channel->chan.push;
 	int ret = PUSH_WAIT(push, 2);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV06E, SET_REFERENCE, fence->base.seqno);
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index 7fa52ec61b30..4415a6de680b 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -39,8 +39,8 @@ nv17_fence_sync(struct nouveau_fence *fence,
 	struct nouveau_cli *cli = prev->cli;
 	struct nv10_fence_priv *priv = cli->drm->fence;
 	struct nv10_fence_chan *fctx = chan->fence;
-	struct nvif_push *ppush = prev->chan.push;
-	struct nvif_push *npush = chan->chan.push;
+	struct nvif_push *ppush = &prev->chan.push;
+	struct nvif_push *npush = &chan->chan.push;
 	u32 value;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 7f62089dc940..a9cbea2d1cc0 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -35,7 +35,7 @@
 static int
 nv84_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret = PUSH_WAIT(push, 8);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE, chan->vram.handle);
@@ -58,7 +58,7 @@ nv84_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 static int
 nv84_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret = PUSH_WAIT(push, 7);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE, chan->vram.handle);
diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c b/drivers/gpu/drm/nouveau/nvc0_fence.c
index e1461c0b0779..a5e98d0d4217 100644
--- a/drivers/gpu/drm/nouveau/nvc0_fence.c
+++ b/drivers/gpu/drm/nouveau/nvc0_fence.c
@@ -34,7 +34,7 @@
 static int
 nvc0_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret = PUSH_WAIT(push, 6);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV906F, SEMAPHOREA,
@@ -57,7 +57,7 @@ nvc0_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 static int
 nvc0_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32 sequence)
 {
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	int ret = PUSH_WAIT(push, 5);
 	if (ret == 0) {
 		PUSH_MTHD(push, NV906F, SEMAPHOREA,
-- 
2.41.0

