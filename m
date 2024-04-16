Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 339578A78AA
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F27112F16;
	Tue, 16 Apr 2024 23:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JcwO3iPa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01665112F24
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:40:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yp/SxFkAtsHiIUZ93VdZ+n2dZ1YauXhCTXGQWISV2tWAXM/xGwHWBHmR10y8XQ63IbV+piwXdfzxMCsDVHgTT7m/gvrzWYHVtszN4ZsSvFYNZ3SXvIQvIytdxEV2vVpK1qkVPhUYhcq2bPFPE3lWu43VbDqwlxQmV+eN3mNUg2+ucUDxNUsRcHfOxqANIwYO9yGcSZaH62PtlS24gJ+l/FXwgjMLrSrmkf6s2JBYnpoGBxEHkEh46YtuoRAwP9Y7yRA8/ofRVaCAP2x4Dt3tMAG9ktnABe0kC0eG+GKT6gs5VfH0dhcKgQvvRo/XctbkQ7+bg5XivzKIBKeileCqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB6vxvivdWW8JLt2h+MMiAHWmMbkDo8FGmZQ4tka3Jw=;
 b=ZBkAZvFI+U6ak5N8BuJw6VQK3FCihGWWbrJADFlE0SoegJUP2UBlk/8AjtDRM2GuQifJx67BvozdD2fhKuUAw9CYDJs5U2whSTKrOZ96zx4rJWNK3Bo+e392+QnKCcnXVMIcoMqVN2puywTl+EK/KYrRfxWbBxUOPJ5MdvqHtl9sSBXgDpqTI0n5DlstaysAMXgzoTJM5KLs1p0Y+HRJ1JEI+n87Y40xJwvyapJUMcg7IlVoR/pf/OLqguCuc+8w+q7744lEQMxv5pvREAYQ6XjS8kC9Fv8c+3zqMq4ZyU1HafzIPUy7a8UroHzdtjbcCFKDHXkbwRr29hwKDrSPOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JB6vxvivdWW8JLt2h+MMiAHWmMbkDo8FGmZQ4tka3Jw=;
 b=JcwO3iPa417zlDVkN+X6eoKFyPVQ4VDLu6/JFiveOqmhFvCmYgOBZ0Gf0D2a6MTmC6aFcPeX1GjTA7RkTYrvuVcBSsXpgPzRgQBx3eaVKlXXtElFYnOGpA2KaFmU+F+QeZg6tPGA+MTbZs7eAXjXIKzcQUvcWFS2Opnv3aiIx/6LVKbLTdyugB5wE+8eQqHMr1DlUw5udijn2Ofb2P/lEAr7r9bUKNxs6/swTaJH4kfelX47RsB7wcQIBomWKbgxjXONGfYwxux/u4rFmQcJ+GNE3SCIoAUlfCgTC1E5XK/I48ehVG5LxfSC+sY+AQxGG2IrHv4APAxP4ASDTNLe4Q==
Received: from MN2PR16CA0066.namprd16.prod.outlook.com (2603:10b6:208:234::35)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:56 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::9c) by MN2PR16CA0066.outlook.office365.com
 (2603:10b6:208:234::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:36 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 005/156] drm/nouveau: pass cli to nouveau_channel_new()
 instead of drm+device
Date: Wed, 17 Apr 2024 09:37:31 +1000
Message-ID: <20240416234002.19509-6-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 169fd2a0-c07a-483f-eb5c-08dc5e6ea945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VDIImDWIEDoGN2vEFIzfjZUuYJGse/GtBYJ4Xou0aZ091ZqnuTzw9P/Scua7J8JIQbtPWdLL6m+tQlBA9nNBd0SUfTldMw6ZJpObfWpQta0XpK/LenuyqL590qiBNIShikTphV/VmBKVZpmoTzbFFsdJdgHoo9XTwsPlcv6KS2HqF+Ger5Kj40/xrsDkQHJUX+TcUyizVMRAxqPQXhRdfSib16pXyUFpTDxO5plIupe/dYbj1brMrq1/YwjPb2PLgOeUVEJY6w+JxU1nEFu6H8ep6a0kYpScrMHG3afgWU3hobahtNbd9foxlTHNTc7tx/aB/MWVie1UdpYKitzEE4Pyc6n6yNW1ckNWHwwzGdm2WL5IfuJYNUeDLDfLI2RC3r6vsFl7Tj4KUzsm1M8YwcyGSnvf7PKc7BGTqnduaHHqCVJxtK4QKMtKnCBDP+lkvXRwnn894eE0nvBAFVdL+s5Q1eBCVSC3H+MPYlE8LYCF3mF1BiLTHuhSJ8+8AJ+a9BERniWXiPIWyppMrdyoSzrvbpE8EIAINaPkBjOtyn8DAq/59BcbZMayHv81jcUuD006b1edxa88jO8KttBUZQSvBzBGtpuIhDqmvPzr/TSnIj5NX3DsgiEcu47NbaEu1R+gcXl7ts7nhorZwv44yIop94DRc/ya8gJBZdt+z36FxgbwY/9jySEZYVg2Q8UnakPf+h1lItc970PGrwL/AXwv6KDPeyFI0/WdoQT5D8QP4cm4dpx++qe0S18UGRAB
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:55.7238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169fd2a0-c07a-483f-eb5c-08dc5e6ea945
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265
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

- both of these are stored in nouveau_cli already

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 17 +++++++++--------
 drivers/gpu/drm/nouveau/nouveau_chan.h  |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  4 ++--
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index f465fe93b1f7..291107ddc59b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -353,7 +353,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	list_add(&chan->head, &abi16->channels);
 
 	/* create channel object and initialise dma and fence management */
-	ret = nouveau_channel_new(drm, device, false, runm, init->fb_ctxdma_handle,
+	ret = nouveau_channel_new(cli, false, runm, init->fb_ctxdma_handle,
 				  init->tt_ctxdma_handle, &chan->chan);
 	if (ret)
 		goto done;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 7c97b2886807..290523522717 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
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
@@ -254,7 +256,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 }
 
 static int
-nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool priv, u64 runm,
+nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 		     struct nouveau_channel **pchan)
 {
 	const struct nvif_mclass hosts[] = {
@@ -279,7 +281,7 @@ nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool p
 		struct nvif_chan_v0 chan;
 		char name[TASK_COMM_LEN+16];
 	} args;
-	struct nouveau_cli *cli = (void *)device->object.client;
+	struct nvif_device *device = &cli->device;
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
@@ -298,7 +300,7 @@ nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device, bool p
 		size = ioffset + ilength;
 
 	/* allocate dma push buffer */
-	ret = nouveau_channel_prep(drm, device, size, &chan);
+	ret = nouveau_channel_prep(cli, size, &chan);
 	*pchan = chan;
 	if (ret)
 		return ret;
@@ -493,13 +495,12 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
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
index be9088ed273e..da5bb7c51dab 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -356,7 +356,7 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	ret = nouveau_channel_new(&drm->cli, false, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }
@@ -384,7 +384,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB, NvDmaTT, &drm->channel);
+	ret = nouveau_channel_new(&drm->cli, false, runm, NvDmaFB, NvDmaTT, &drm->channel);
 	if (ret) {
 		NV_ERROR(drm, "failed to create kernel channel, %d\n", ret);
 		nouveau_accel_gr_fini(drm);
-- 
2.41.0

