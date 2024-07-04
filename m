Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAC092AD6A
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298DF10E477;
	Tue,  9 Jul 2024 00:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IvNe6/9s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E70010E478
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYAbEEMjo06t8Y+lfO7TaUZ35HcjBy48uTGMjDUA5XpJnHIeqmq8lqndy8+6z9m57XCKgUdh7I4KZR8dzEYrRMD5spgo5z3Yqsyl/pzyIG0Hgjj/88L8GaSoYP/ewjQ2XCA883YGUk7d/8Tb9P6K5UsYJNWBtRdQptFnyZlbV0ljb4TunQp54aGx41kwCJ8CKZliZu0rTqFYjPWoGVo0a0swgEEbiZwGwYpIidjBY6IXJCcv+Qv/hxmApYE59z0pDuSnu6eK3sG99wuAYR2s+iRXc9FSY4qaCXhojd8933LAnK/tyu/WXVwUOhBAogrspYmGDcC0A+D+G1k2Dt6L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rfh4F6F4I88UDosbd70v4SJ6R06U/FzaGDlO/TVdZZQ=;
 b=bJf204akSLhcTf18h8g/URvs9W9BiV614bhcvW9vhVGhPCHPtfHsfort2ayfF4dHonPjnM1hpPWaUHfEYHb2RWUQ335XSilgzEzVj5S7QwSFYbLGWE9dY517Xc9RFFDzPfS4q6qXAxVDFxlzVN3fChgsrULyTolxhzmIx202Cry0ww8wa3kmhu+lT3ULfDRHn6wk23uIqj6Y2RUEIDFvqP0ylqpXYkeCN57VdEGZr2s386f4GriOCJXFsqaolAOq3ehnng5M6/IVSfmpez2vmP5VL//xswiHu2VTg6i4kAd88+4kDRF/juFIjuTg84771p26pJFSYiXmnYB0vOfXOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rfh4F6F4I88UDosbd70v4SJ6R06U/FzaGDlO/TVdZZQ=;
 b=IvNe6/9sF53kC1XYyDiNE0w8nURwyQ+lOj6fjQ+UtmmIZ8gM3+yXCdMINMkYT1XVLLWyfXILQQArLAnUBa4QTcE1dJ17wKXO/dsn9jFAOA47RJQOhdcuip9vtgq6jyu/4Qvn0j7dtAAbos9znvlvukX38D4u8gsBtTMgboXZKTJb+XDDEo6iGSJ/pgijq/PEFk0a/69JwHAdx3b6Vjn0KFKPYG8/sXZhts8dD/1xrdbdQQSr9VpARnYzi311Ba3b1DIUFViAAYAHJKD5nw1yZZH+I0kI3k8VEbTk9KyLh9KdtnApPFU8zNABki9WZJydnVVEFHGGQu1rnuI1iPxxbg==
Received: from CH2PR14CA0003.namprd14.prod.outlook.com (2603:10b6:610:60::13)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:46 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::60) by CH2PR14CA0003.outlook.office365.com
 (2603:10b6:610:60::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:46 +0000
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
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:35 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:33 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 35/37] drm/nouveau: remove push pointer from nouveau_channel
Date: Fri, 5 Jul 2024 04:37:19 +1000
Message-ID: <20240704183721.25778-36-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a36e5a-0304-4c6d-b350-08dc9fb1dddc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HixRetB68JP0hZPpEeyuVUqSa3/r7a5xD8Qc3SuOowekb3UZHeWiQe3ucJnx?=
 =?us-ascii?Q?RyVdQxUi0rJ6AnA4dvcEgM8dMZApV+NOSRryBFZ9e9MYP9ibu+7q6NoKPDuM?=
 =?us-ascii?Q?zBqa2NdCRC3EllXlJtv7CWV4e86YG07tWj/9WQFH3rSMMHci3yPm6Ocub81F?=
 =?us-ascii?Q?viWRS1MfJmKFIIv+RxNNXzkJ/FK6WnU0nn2qiD4mhvFjAx5FoXregVr4n03t?=
 =?us-ascii?Q?VuarI3GBcKQoClkfQeZZOG2plD+TiafFWDWOUsBc8d3+1nCI4shQYJ+nIAt+?=
 =?us-ascii?Q?6NntOWHCJc4OadIr1j8FcRwE8Q3xwAAVzTw1azfXHGeB0XbqrbBNgompvEwl?=
 =?us-ascii?Q?1r+XUtwjTEyNkUwSPYr+XCYBhvnSpBZPB5AHd6TMArTWkpKgAIFJsUunFjmV?=
 =?us-ascii?Q?Jj9r3zyr3SYBB75W+wwVURC3aYgA//GqCa5yWcd66fSYoajnMnMLcfbKtxLa?=
 =?us-ascii?Q?V+mALnaVUa0r9Ml4noW2H0vPcVV5rKYz1kwEoCBWeTAtabB1jrZGP8DwnzYo?=
 =?us-ascii?Q?h99KvhxUKTw4nEi3VpHfx+IrBVwJMdiJlw3T5UHA39rnbFL1zbUnYB0Suy4g?=
 =?us-ascii?Q?ptflXGafaUB9hjESVADJhJonn82x69pRvGSLtkV039lGBxwW1Du5ZsPKgkWE?=
 =?us-ascii?Q?Pskle2fOwELgNGkFtUqyOk/f2O6k4eMyGLKLlsLNOuEjzYyYsPFQ3IpTX95H?=
 =?us-ascii?Q?D54TyME71dtHgCgiDaO7GOI28xT2KKVbfaAQZh5GqbC1eT19PkOksRD1idZz?=
 =?us-ascii?Q?8CIE/zNb1mlFWeYn5OW/nMKP0iMXz0G3kQEsOav8OcL448QwkOZ0TzafkVE6?=
 =?us-ascii?Q?LqATJDSgVqF4sX5spFLjASH5bzbQNdDICKn74OA5IKsbloeoKwp3HUNI5ZoZ?=
 =?us-ascii?Q?SxG8/lgbe5C0HoZ389mObQCI2NSmRkIWd4pgjlhsDYQ/8CZPH/AxMwRf0k6W?=
 =?us-ascii?Q?q57WNzpGbw/MLEJvNHeWJ2lraXtPlAf0ukLL5om1MOw2NvwwoZMVWu9Kyj8F?=
 =?us-ascii?Q?3hQzO/uUCZXD8Rij7BTm98R8HwokefX+Xf5HsQ8r58TRIETW0yqt/Im9OpV5?=
 =?us-ascii?Q?wlBKN3mApkW4Tvh0rlBvRKjpJXryGN+xELEwlE8EonIMD+lRT/pzpm8A/q21?=
 =?us-ascii?Q?/pivQj0imBelkD3T25wvSmTdIAXKoUGeYDsVrgn2RJxZyGRzwBh6TyYtjxGK?=
 =?us-ascii?Q?FApNSC0MLAnTsnOnxb2eAnrDBhqltG6MRxaBJTq21xukUoZ40XglRWOOqsfB?=
 =?us-ascii?Q?2Mw+/F+V80LUwzu+YX39w0L7WdR4t8utJLhhseLBeMpCnDFqw15zWaHchBJs?=
 =?us-ascii?Q?VcUHQh3v87PxWmiJ3CnnwvKsgZD1ip8zBN6H3YVk0r/n5The2mPgPQPZkDTh?=
 =?us-ascii?Q?e5uKKmnNn+pJHyl3hsrIuMGeOx6F/wxccREeosC8/dBNmJccCPvTgLfeNuw7?=
 =?us-ascii?Q?yDo8A9rZnGReSEk9eMkP25tDqkIqv+r9?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:45.8305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a36e5a-0304-4c6d-b350-08dc9fb1dddc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349
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

The struct itself lives in nouveau_channel already, just use that.

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
index eff43bfb7521..90e549541981 100644
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
index f1665b06c698..75a2ebc6e576 100644
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
index 6719353e2e13..56dc612b3ea4 100644
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
index 85214d35fd5d..ea3b2865f51b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -382,7 +382,8 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 		}
 
 		if (ret == 0) {
-			struct nvif_push *push = drm->channel->chan.push;
+			struct nvif_push *push = &drm->channel->chan.push;
+
 			ret = PUSH_WAIT(push, 8);
 			if (ret == 0) {
 				if (device->info.chipset >= 0x11) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 7b6f611a28b1..4a8108f33319 100644
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
2.45.1

