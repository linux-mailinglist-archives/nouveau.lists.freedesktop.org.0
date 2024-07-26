Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348FE93CD55
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56C710E914;
	Fri, 26 Jul 2024 04:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iLPsXJc8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8C510E91A
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BsVw/AAV/SZIJyBjPMNWiJySsAFwuroAQRGQnT8V91q9KIxojAtV1lqziMhoGn8/AVo0KiwoTRkkv+txmF8JFE+Q2RjfQOA/YTH9G+EA8ibUSPmVZR1cTEysbIm58GFYt62h3OG8kRH+rmAyyynBO5nJIwL6MqgQOTh4k6EKIjc+4/CGzPHjHhWMyhvfzKNXe4lvD985QvRUVkiamGfmeAY8PPZ96ECjsrMn9Aew745bgEDrYHC2+DYMojCYR0CQNzRDp6hOdzUkUssX8LZvk2zxaJo2yrRO0YKKO+5zftejIqDS1oPJdpHXNU83O04z6ZMFo3AxodYUhjscDMLGwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Dbfs6x0xEFt7dfWSOUWCG07A/49TybR5h7+uLGL6sk=;
 b=XwIQH8ZMAs7IXjSl3SgNkPP2k001W4b8+MC+S0qqrj6ODmGku5xn0nhYgkhdZ10xjsqVreapnU67ufZoSipX4nLF3FiJ0KTBCkpkAgG0MJuBQXRNWGiPlCq6Pa9PrCyUK/Flrt205I6rZjnc9aRxbgngpFiUU4Ltcd7RBY7dvyImnMOJstiVESbkvW0lwwEKOFuooPZpB1xME8CzcM4Kp+G5w4RgOg3XBZTts7yx4AA7iU897olLN3SoYs94x27Ph/Q9kCXG2vVEDA4cIuEzAh2ZwGxOs+q09B3mcxF5woAvcAmXN7dWonQuoVQMtL+D2dnzytyGcI3HXf+z/rFsLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Dbfs6x0xEFt7dfWSOUWCG07A/49TybR5h7+uLGL6sk=;
 b=iLPsXJc8dGilotDEY55tEYffZ0E+hNdlLIOHtsEIED8c8vEAyRmF4xLsZgNUXFr1r29khzub8Qu5+8VTzzYh/pLVljIHYVSzdIb21PO7r8+3w2GxiKvAwMERWXc52uGqDo04mmby/0KQPDbWrKxCHyvnmLLuugg/UEGTuR6gEVTTkBF3nF79n3So1BU8KrbGJFIvDt9yptK2xBxQXTxMKUIQygl2OS63I+wFYQHXn9ZeAWBqGyKd87kHdgjYKV3KPHQMmbLNr7S5/WiILRsNDCYEFW/kasLLtO/ngqOolLUfWSgPruSBvOS3mf+KDRAcjzawqMBKd3zjIUVgzx24sw==
Received: from CH0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:610:75::7)
 by DM4PR12MB6565.namprd12.prod.outlook.com (2603:10b6:8:8c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.32; Fri, 26 Jul
 2024 04:39:40 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::a1) by CH0PR04CA0092.outlook.office365.com
 (2603:10b6:610:75::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:27 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 31/37] drm/nouveau: pass cli to nouveau_channel_new()
 instead of drm+device
Date: Fri, 26 Jul 2024 14:38:22 +1000
Message-ID: <20240726043828.58966-32-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|DM4PR12MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: 525c6529-7cc5-437a-f0eb-08dcad2cf61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KCNvByh2W1KuzmRZrWY2JQy7momxYyOYSJphAaGZHxyvu2UIrKoGVFhVPhxp?=
 =?us-ascii?Q?1hBgu19UuedbF/MWUnjEk1UPrAJLMIm5tE0PpNAIjxZ4WQAwFjrLdAu83Man?=
 =?us-ascii?Q?fIv6vDnGXUy7iuqKoRXYo6Y6cmi/hGxQDXtCtUvbzscM72XYWumu6OiC/qqJ?=
 =?us-ascii?Q?odX/d189c6FZkEzZO+FANslMiiQ9IEniw3/A1mreycZv2FI217yHXC+Xdel0?=
 =?us-ascii?Q?M96+gjB6Y8xeJBMza+E5ZTTddQSJiKuGlGBsJbZkF7eQiVitQ5mS2fNH7AjF?=
 =?us-ascii?Q?Dg8eFB5csl7oafSZ/ojTOfkRplaY0y5g+S6J5g/4xUcQlDjhomy6lX+KAhAA?=
 =?us-ascii?Q?gHzCgKdJgd29XTEEtfb6g7WLiK5gzB0xEykJJx2mfNOyCnG2FjSJBTZTiEoZ?=
 =?us-ascii?Q?iauX3zpaJ9Rb6oH+2rQW0jzUOTutq4VLR3+5mtMknYSrDlaFXt6IgzTwmDYt?=
 =?us-ascii?Q?Q0enkoBaivgm6Pq4i+qNKtPy4pDbMctW2jd3fdz8K0uhFVYbk6LjAfvVwdkY?=
 =?us-ascii?Q?kD7DKDuIx7BAcpoCCU+t4J9d859aOATv+COoht6IDmegzu72CkzILlEQks5K?=
 =?us-ascii?Q?7ggikAMVhISjlG7AZIgsJL0pDjFZLRAJG9patLA+Gf1vhiVZM7KKf7GEDSEm?=
 =?us-ascii?Q?pi2UCcytbL8VAwu29hn1sc/llKCdWeI2qL6dtsQiJb5rgv9RMmUNLcLYB/Om?=
 =?us-ascii?Q?sVNEJQAX3K4hkiCdO3dsfHlt2KS+ebrtCdrPKuuMR0UmPlJBxl4tLtqNLbYN?=
 =?us-ascii?Q?Sb3ofFP0TsUgYmuFo+YJ60D6e6LgcMpXSx07rd0/JYUoK087UKrnjoqpT9zk?=
 =?us-ascii?Q?iD8MCy0QyfbToxh6iBHpEuEcapyWXu0sjaCvx9bvyuFp8ue2t6xGcAm6uQf/?=
 =?us-ascii?Q?I1SpLrtZVlhCpSCfcWo0mBJUT7EHMyqtQAewuSPtmNVEs59kEPc0BZq5prrE?=
 =?us-ascii?Q?3sWTf42G50zHdyG8NNC5csNTlwbtx2XFYwBOTRC1tMe8/7MmUvdWB21YUuf+?=
 =?us-ascii?Q?nwhRnbRNnGc3GCox7ONYaNBw730dk97z68t/dFrxTPZDIwc9aXYot113aZjc?=
 =?us-ascii?Q?9lFhwLJ7Kkq8suPmUpgv9ONXoSAzk5cgy4oXVXLK3YqJ3kI/gfM+/5jt1n0s?=
 =?us-ascii?Q?Zpw58SMhejxp7cMTLgOWgVjiD8jrWUdu+he+8WJZy5L8w4jJkF1D4fI07u6Y?=
 =?us-ascii?Q?n5jHPSwcbgoTBK0jZMy6voZZPQxsJKtYW9ziVh0pojehr5SOvYklg6YL612k?=
 =?us-ascii?Q?n2X2WQsHJDLqObuKpLLuvxsLmSDaY3fOboBW1+SB7toZovQoSQf+WTnUgih2?=
 =?us-ascii?Q?4uqVa2e400IRPEfGSRoo8XCWhyBPoQh8MixNRZRNg6brwjzcCiHYuP1C2BHf?=
 =?us-ascii?Q?TGlxb1E8b5biKVPFwqV6L/St15T2p5YGAMCziC7CymfyX4+/ltAxWkLF1WGs?=
 =?us-ascii?Q?Me95J5ZD1tfTV5kBrhTDfU5AkC0fd7oU?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:39.7463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 525c6529-7cc5-437a-f0eb-08dcad2cf61c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6565
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

Both of these are stored in nouveau_cli already, and also allows the
removal of some void casts.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 21 +++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_chan.h  |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  4 ++--
 6 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 98736f6eab16..2ac5b6b904db 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1172,7 +1172,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	chan = drm->channel;
 	if (!chan)
 		return -ENODEV;
-	cli = (void *)chan->user.client;
+	cli = chan->cli;
 	push = chan->chan.push;
 
 	s = kzalloc(sizeof(*s), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 768912cc5d8a..2a0617e5fe2a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -405,7 +405,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	list_add(&chan->head, &abi16->channels);
 
 	/* create channel object and initialise dma and fence management */
-	ret = nouveau_channel_new(drm, device, false, runm, init->fb_ctxdma_handle,
+	ret = nouveau_channel_new(cli, false, runm, init->fb_ctxdma_handle,
 				  init->tt_ctxdma_handle, &chan->chan);
 	if (ret)
 		goto done;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 6631d85ea749..745b7d7503f7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -859,7 +859,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_channel *chan = drm->ttm.chan;
-	struct nouveau_cli *cli = (void *)chan->user.client;
+	struct nouveau_cli *cli = chan->cli;
 	struct nouveau_fence *fence;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 16e0a87e030a..e18a80fda2ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -52,7 +52,7 @@ static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
 	struct nouveau_channel *chan = container_of(event, typeof(*chan), kill);
-	struct nouveau_cli *cli = (void *)chan->user.client;
+	struct nouveau_cli *cli = chan->cli;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
 
@@ -66,7 +66,7 @@ int
 nouveau_channel_idle(struct nouveau_channel *chan)
 {
 	if (likely(chan && chan->fence && !atomic_read(&chan->killed))) {
-		struct nouveau_cli *cli = (void *)chan->user.client;
+		struct nouveau_cli *cli = chan->cli;
 		struct nouveau_fence *fence = NULL;
 		int ret;
 
@@ -142,10 +142,11 @@ nouveau_channel_wait(struct nvif_push *push, u32 size)
 }
 
 static int
-nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
+nouveau_channel_prep(struct nouveau_cli *cli,
 		     u32 size, struct nouveau_channel **pchan)
 {
-	struct nouveau_cli *cli = (void *)device->object.client;
+	struct nouveau_drm *drm = cli->drm;
+	struct nvif_device *device = &cli->device;
 	struct nv_dma_v0 args = {};
 	struct nouveau_channel *chan;
 	u32 target;
@@ -155,6 +156,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 	if (!chan)
 		return -ENOMEM;
 
+	chan->cli = cli;
 	chan->device = device;
 	chan->drm = drm;
 	chan->vmm = nouveau_cli_vmm(cli);
@@ -253,7 +255,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 }
 
 static int
-nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool priv, u64 runm,
+nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
 	const struct nvif_mclass hosts[] = {
@@ -278,7 +280,7 @@ nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool p
 		struct nvif_chan_v0 chan;
 		char name[TASK_COMM_LEN+16];
 	} args;
-	struct nouveau_cli *cli = (void *)device->object.client;
+	struct nvif_device *device = &cli->device;
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
@@ -297,7 +299,7 @@ nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool p
 		size = ioffset + ilength;
 
 	/* allocate dma push buffer */
-	ret = nouveau_channel_prep(drm, device, size, &chan);
+	ret = nouveau_channel_prep(cli, size, &chan);
 	*pchan = chan;
 	if (ret)
 		return ret;
@@ -492,13 +494,12 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 }
 
 int
-nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device *device,
+nouveau_channel_new(struct nouveau_cli *cli,
 		    bool priv, u64 runm, u32 vram, u32 gart, struct nouveau_channel **pchan)
 {
-	struct nouveau_cli *cli = (void *)device->object.client;
 	int ret;
 
-	ret = nouveau_channel_ctor(drm, device, priv, runm, pchan);
+	ret = nouveau_channel_ctor(cli, priv, runm, pchan);
 	if (ret) {
 		NV_PRINTK(dbg, cli, "channel create, %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 5de2ef4e98c2..260febd634ee 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -12,6 +12,7 @@ struct nouveau_channel {
 		struct nvif_push *push;
 	} chan;
 
+	struct nouveau_cli *cli;
 	struct nvif_device *device;
 	struct nouveau_drm *drm;
 	struct nouveau_vmm *vmm;
@@ -62,7 +63,7 @@ struct nouveau_channel {
 int nouveau_channels_init(struct nouveau_drm *);
 void nouveau_channels_fini(struct nouveau_drm *);
 
-int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv, u64 runm,
+int  nouveau_channel_new(struct nouveau_cli *, bool priv, u64 runm,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 6b33d1d0a4eb..8b9c463d21ac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -335,7 +335,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(&drm->client, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
@@ -363,7 +363,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->channel);
+	ret = nouveau_channel_new(&drm->client, false, runm, NvDmaFB, NvDmaTT, &drm->channel);
 	if (ret) {
 		NV_ERROR(drm, "failed to create kernel channel, %d\n", ret);
 		nouveau_accel_gr_fini(drm);
-- 
2.45.1

