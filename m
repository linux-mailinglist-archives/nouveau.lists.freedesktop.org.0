Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C348D1209
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:24:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9A410E227;
	Tue, 28 May 2024 02:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qGRitZ6R";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1169710FE2E
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7oS4XHSz6A2KWz4G9uwtSsrfRj7HTB6BVjk46/eJ/jUO7/eFm+TomSFKdB0K/d55QUJf6B6cwjis1JNK9oIMV3BZwkzx2NxDAYq4HllxnpnIxSKUTsJsF9mZLHl4Gv05OeBJGdnbOyaK8EAPjMSUpMZWYDWPJBEp7i2ENPdlNKOArc5672Uld2hSGv1z4Ale05TQnUqcieosfq6z46ukLAnV1CA6Yl9+nI2YtgnmMqEtRSTnZQ09xysz72oR5QRjC4W6Vxuz/kyALXR2iPzvu9CZr8llAoSV9ZoCSA+gqF1j0+ngAN7IbqWTURa2K6qxeaCoH8Sa/Nlrpt2XnFjZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AN43JiF9t5SFj0Fxm1st1FTQcxQ5BP0LlqXXRA1Msc=;
 b=W9nEbEGH/YcEz2s7BFCoAmsjz1Gd180BYoW2c58mMcm4Sb3QXb/yknOz8JBxpHn+zTzLJA+r9IQ5NfcmPG7guJif7JtkD51n2l4yPgeDyLfh+7Th4wXLSTI0i73JGEXjQS8e9l7VCDQ8SmQc+2MmPSD/zVCiKS8oovvbk8ayOhDgwuTuIOZPGv4uheJzO76q1byTJvngCvnGyXh2Yolz3oJZHK6VzMN6dWc/EK19RbnZxIwRokmHPc1iAtKN6er0AbLVOMFDQ6Sfi0xvxfAPimgPS/AxgYgG6qcukPYPfjUF4eW0rMjTlmqTYWV1C7/Ac326K3LwXVgCCdMLKhX4kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AN43JiF9t5SFj0Fxm1st1FTQcxQ5BP0LlqXXRA1Msc=;
 b=qGRitZ6RkElCYy3SpdE1Y7WPV+CxbIyPpi7cyMorJB2ARU3Yx2bVABadd/NblcXPcR5u7sjNDcgOJk/gO0ZKH2y4RLoMIduIO8K34QBA8OCJW0fg/tmVbk1GKMH3VmPA+pybR9V6WzrpMbiceWHn2q8uBaRbAKQkZUxRQnIpuWY0kWJHJRdI2IIrDXctY+xg6PT7kBFqVRHJjumhjQsobw/qGaxIZEG0FCx54brV7pLFuCp0pq4aeGGrQI2s83REXp/IiYcW533gcbJX0ecvgd5B+y93WHnXXwMLC1xAVo3aMQTwGX0kjCbYVKoM5MzjI9sn3tP+LsjSCUjNvEHEcA==
Received: from SN7P222CA0003.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::21)
 by MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:45 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::6b) by SN7P222CA0003.outlook.office365.com
 (2603:10b6:806:124::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:29 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 28/34] drm/nouveau: pass cli to nouveau_channel_new() instead
 of drm+device
Date: Tue, 28 May 2024 00:19:53 +1000
Message-ID: <20240527141959.59193-29-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|MN0PR12MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bba11f7-d31f-4725-30f5-08dc7ebd32db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SD4ODoHZipAOGnMr1XnkUOMRJc6HC3oKvNGq8gIc3GXJI73qVH8ukpSinpcm?=
 =?us-ascii?Q?XmObPHMgOJqoO3aB7ENmD8MHoe8YJwXwmIm3UZpcUSZ7Wn98sPmRI4fR7K9V?=
 =?us-ascii?Q?bOq4LR6TSjN3EbeJG0ALPI0P9zbb7BYDDcfFsumEdk+e56v0uUZjnk75sS13?=
 =?us-ascii?Q?DtGMY2Y2e/K2uGG5lUW7mUsncREwNNHw+WlTG+FGAbkMt6JPVLqnTx/Joxk7?=
 =?us-ascii?Q?nArJlupsEVOl0PnU3zGSRBhFFEF4y7XCgfyEoJCHGWGYM6MoyozPKuXSzPin?=
 =?us-ascii?Q?o2BjpcPOiNyKcQjZ6UCXLq838GrianjeO9c0hs/WDU6TdgicsaHRWRdXmQSg?=
 =?us-ascii?Q?g2XyGQVrj7Z6BoKGyQHq2gN1d7HjDHQpTg+TW2XuwdZ2thzxoDTGMWCF2rbt?=
 =?us-ascii?Q?nxLQdT2/+CcGsXm40yyUhrNemSLH5Bzozrer0WewSkndW4Ulxy89IAV6wNUa?=
 =?us-ascii?Q?SuK7Q56qsGqNR3E7QOc8/3nxDRMwBjqxf4lQX607OuKezVrFOolxaldtHP5y?=
 =?us-ascii?Q?H+6ctnzejpE6L7uscHRLfJaZLqikNzAroSfgFjwr6TwtxRbLn5KHIkT53nj0?=
 =?us-ascii?Q?NxFSPhj4qYpWh0Cu2mSW2U0er4UcB13Cz5d3KGTeii5KtSa8EKLAWiMo8rCH?=
 =?us-ascii?Q?p4EddFBWp2143cxYbfxALp9hwRkqFII94UC1NUzGWfBArPXF0qm/UrcxZBus?=
 =?us-ascii?Q?Yta6bdhILR86cI5EQ1qAdy3WmseFZvszVq+pX/MJFOShI/KIPGURoSNU5FXb?=
 =?us-ascii?Q?W2PelUj66djGsCZCWmxpRflFQtSifKXUUE1qh4PBeJl0TqJmXHcL3SDlniYH?=
 =?us-ascii?Q?lGjmHJgx/icXDo+gehSAtMAZqNUJaLkLYnF12C193Z1Eyx/DnXWNtNU5jAHu?=
 =?us-ascii?Q?3Kvp6IHmnNPr7UHqjiKgPiCdjRcFZ2tIWvrbZd7rRWVq5Q4ob5LdjLXKHqnU?=
 =?us-ascii?Q?H+umOdRz134R+ZXp9FOsq0DmDKBjBzJkeKG7JqydqQDziRjpZn1eYPdan1rX?=
 =?us-ascii?Q?8C0nELEnOnYeQxevWclm0rp7bzZvV7rmlaW2v2YX7l9UvKi+PtJr98U5LxVH?=
 =?us-ascii?Q?64PPmiEEGg8a49fpOEx6lbO61JzvNedB70P2yI4TMj2Vzca5twYt23Y9xwtk?=
 =?us-ascii?Q?NVshfZaUOD6Mfh5pUfWdBm0dnIQ4WagfVAok7UIaeIaMBYc7/sDiTsSLZJnL?=
 =?us-ascii?Q?BIS6czaIgdqlyHlPho+Ap+Pao24GFeYMTN68e3jUY6yvGEh9rB6x2Ooonu0V?=
 =?us-ascii?Q?Ujh1R2h8huddCOxgdMSK8Fnprsh20L89f2DfGtrJqHkwiN2kdgyQpXfw/6qz?=
 =?us-ascii?Q?rF8OtWCx6pRrB5W5jnMSG6z+vHiw/q3Xa9dsr/zHS1Y6TIK6cbo+OVxopMnc?=
 =?us-ascii?Q?WSQg7egByYCZA3Qrdy7Pu8MIDzfK?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:44.5349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bba11f7-d31f-4725-30f5-08dc7ebd32db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6293
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
index e5067d5a4801..41fd6e339221 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1157,7 +1157,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
 	chan = drm->channel;
 	if (!chan)
 		return -ENODEV;
-	cli = (void *)chan->user.client;
+	cli = chan->cli;
 	push = chan->chan.push;
 
 	s = kzalloc(sizeof(*s), GFP_KERNEL);
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 6042f2fd205b..5cea12a0af08 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -396,7 +396,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	list_add(&chan->head, &abi16->channels);
 
 	/* create channel object and initialise dma and fence management */
-	ret = nouveau_channel_new(drm, device, false, runm, init->fb_ctxdma_handle,
+	ret = nouveau_channel_new(cli, false, runm, init->fb_ctxdma_handle,
 				  init->tt_ctxdma_handle, &chan->chan);
 	if (ret)
 		goto done;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 7987f407b2e4..b4f56141c8ad 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -865,7 +865,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_channel *chan = drm->ttm.chan;
-	struct nouveau_cli *cli = (void *)chan->user.client;
+	struct nouveau_cli *cli = chan->cli;
 	struct nouveau_fence *fence;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index d1ecadb4667e..0742fd061e01 100644
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
index 652d38a71211..cfff32168fd5 100644
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
2.44.0

