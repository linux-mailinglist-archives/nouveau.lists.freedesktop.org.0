Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4209C92AD67
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81E410E474;
	Tue,  9 Jul 2024 00:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kBXzwc5+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6F910E470
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ieEwq2rp61q1u5D1JLtVlMdGHv3V7Wmilwyg51JW01ODFDpuRq2ld74ARPYiCoMNZ3tpRu3s2qQdfTBkDDJEXl/l7VRLzdBJIof6S9P2SLzdJsfR6A+d6uqBdXyC2ThyJZCfejo1+bLVKn7EIJFx94UZCYTZzoEFwQq1/vne+FTD+QzeZRSrgJoXhw/bCCSNPjx/oTjPUItT1VCXd1cEskkzpEsvP4/t2Wk5Tmea9bSLigO7UdgUa2hNqlSy3lb2Cps6J66LJG4IPclc7CamiHIFZIlwO6aAWcr+fPQHKYSUPHkkWz3sVztC1yIBHaYR8JVdMyOIJ6f6Nt99CsD2JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7Yyw6Ii7tkE83UGMn3l5fKlHsfZHHlEwCMuAnBU98A=;
 b=HMiw+KuBmUxxDVb104Ud7ohSaBwEhV38xB4QdFjsDajHHmqXydLH9AQWQfuDypR5PCwKI+FOVbaZ41mORIPYXXzRL1uz2r9udND2XrT9wUkH21nwbPhTma8sNrzuzGjPcL6wpEFtHcSXZ9Ul+l35QfM3GyZsjfq368FTUXXWY9sE1kDBCeVFD1eBk5/zs6ubc43JDnuryu4UA2M25N5OlrslXZxfbdCHWHyWSzfpdwUgrRP1e94Xbwjq91n2uuYEMpdt//s3c7NlInVPcIpQ6D8Vuu/pMOykc+Zx1kVDcb8P404JJsXHVegFi0hlRYFeyk15YhKUunWQyhhlPEycXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7Yyw6Ii7tkE83UGMn3l5fKlHsfZHHlEwCMuAnBU98A=;
 b=kBXzwc5+013A3nc0cyvYl2a5ydnmoMuPBySBM5isq0bNZTMmyh17cLsbMnSdrJFEomuMUtqFpG0jPoW6QyXXQ1BiC49w0gFhuun69mITx9wl+B2CvczPRKIWmA0sT+yW8dPppIzzF4iEujGInJkliM/qdfBQL9CUF925fKK/4jLfAh51lgZLkH+hAo/PrbxGsvMYOTgM2tPHgshJn6AUU0v/QfQavoT7EvQ0jhLyKcROq8ifs0/s3qU3UWxiytPW1V2fHiO//gxHT8SMbKHz0uR53BMA8SPKu+HAn3JpJ0GQ+MtLpah5bFqUs39gW+IgUdOVey9gEiNo3NiTQj+RiQ==
Received: from CY5P221CA0010.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:b::31) by
 LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:44 +0000
Received: from CY4PEPF0000E9D4.namprd03.prod.outlook.com
 (2603:10b6:930:b:cafe::fa) by CY5P221CA0010.outlook.office365.com
 (2603:10b6:930:b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D4.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:29 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 31/37] drm/nouveau: pass cli to nouveau_channel_new()
 instead of drm+device
Date: Fri, 5 Jul 2024 04:37:15 +1000
Message-ID: <20240704183721.25778-32-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D4:EE_|LV2PR12MB5869:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c20046-9298-4287-24df-08dc9fb1dc58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zaoN/H9APs0L5YhADu4gYsQtzQ3KWEGn4+YkjagCxovJGD08zsDhN7uoZsaz?=
 =?us-ascii?Q?xKcgD92Nnx3IIPOMGOzPfPJjfpPM4EKqOhUWUrPmcrSsHZeXciiXM7VVqEp/?=
 =?us-ascii?Q?oHZwaBVYcLlr/yvoTN7vQJacD0RWtU9IGdO3tjoSwb/MsbkR/fJOBm9BqqX2?=
 =?us-ascii?Q?7DxCbSRfncg03qyIz+meSwjA1AUUuibIOsx3H2xe2L7mwjzZiIUeeR+SSIQp?=
 =?us-ascii?Q?9cAvr4RP2FJQLVc/4uWhFZYbKWk0ueo70A1PnJGd4e9CodL4lHjpRqdzj5J2?=
 =?us-ascii?Q?OvLy891E9/bkvg6Zjq4AvXaeq9RWF5ab6xi9zSgi7NMyTdOeHQrMLwwodab/?=
 =?us-ascii?Q?A8fxwz+t05vnT+ptfi4VoUbw7FMO6qlmqqH08bMh7ZINGSDrRXaGym8b5i/N?=
 =?us-ascii?Q?7ltKOscWOt9WCUrZ/8brNOKuWCpRm6ZYQiftQwD7Ybx92wOghP7FXtHHKnpt?=
 =?us-ascii?Q?Z6IG/GZcwWKyx/sG17NjquswndP77HusMEv6NSdi6861h3IJF57ZztaB2VRo?=
 =?us-ascii?Q?ZPL4eJl+Y6BOQub9e0wmFPgPq+dQ8wKK8s0mGb42grArSWtkhBAal4AKqpZ3?=
 =?us-ascii?Q?amA8i3xr2U2mSENz1DvHp2Zu+HcKbUa9e0WXmqhykK/6Hsg8S6de6wpDcSsn?=
 =?us-ascii?Q?0FSJlSYVtejG16zqvpSeiRPjVAZLU45Go3ZuT5sg3j9k87FNS4nz4cM8iO9u?=
 =?us-ascii?Q?M08MNXHCH2pSMVMYX03IRafvvd4SlB80obMuDlr0IzTmpP7be//7d0K8M+Cm?=
 =?us-ascii?Q?u4L3fa4Wq9PgtHdRoPGzIsfJj7xRL6IabspYNNPBHjtv0VMSpd0jQeXN1sGF?=
 =?us-ascii?Q?vMgT2N1gnhYuFtEwVIBlUJl9SKwMs1PD9ZRIM44ianQpEFNJNpDFOnXMXgoW?=
 =?us-ascii?Q?X7pxkmxCTia78hc2Hzgb9IXvyRTzrRw5CA3L+l7WYwO58DaLgTD4UitMS6t1?=
 =?us-ascii?Q?pe8IEiSPJmWRMkdT/sTK07mwpIlX7x5WE4p5hu/6swCYgZd0Mumaeyn3k/JM?=
 =?us-ascii?Q?lAe6Lt3ximVeEMHwmOp/Ilrg8N7xeunJpgQyRH+Uxw544taUZqXrB27NNJBM?=
 =?us-ascii?Q?Dh9dAwB4Lm/zRYgZBrhkWrBa0I5LW5yrBXJQBejQ4Ewpb7GtSxpmZZAXys5G?=
 =?us-ascii?Q?W7fAtfYauE1V807oRXbokuBNM6hSZtOzUSCHiz99pKxnsWUBj1vJSRSrLR8y?=
 =?us-ascii?Q?EjWqd6NEGGRam+s9QTy2F9d/TJKmk8mIHIqyGaYcFQ0kKc0OEDXkm9zzgt9p?=
 =?us-ascii?Q?AmmVR+XFka4dFFEJp4tbGbWQyLpq2EeNJbUk+x4aTy7vdpRCzFiz5K2pIgSs?=
 =?us-ascii?Q?YptCduv6nNzm55fhxGeKUEnAtIlWlHi1mPkLb0MU8HqiHkvzl+xskq0L9BdD?=
 =?us-ascii?Q?e51hxQ9K4ImzZMWpkqpLGEa5W2G2cQ40qFOYD30Au0OLYseeqeEy0TUHISOf?=
 =?us-ascii?Q?lZ22KCbz6InYWgyrkeQWU6rUAAl7cy2g?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:43.3622 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c20046-9298-4287-24df-08dc9fb1dc58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869
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
index 5d74c36a4ca5..4239f7bedc32 100644
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
index 0105d4704c3a..e5c0d8526e46 100644
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
index 07748cfab233..c6c9a528783a 100644
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

