Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C717AB2B79
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D4310E27B;
	Sun, 11 May 2025 21:09:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M6kVshMW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28B210E27B
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYiDuoswHbZ3bcpD8ubmNCvWlZMBcX3/A5sb9hpNsTk3qwKs99do6IByLeXEbQACJHzANykBhBpQB/+8JP2WN5i8ZCE85BlzRODjkUXOw7HE6E7UVZVuK+GZvzoyWUKHp5Ayup7i+SKboyjaBlZ79z85AMoaMxbs4Wc0Zf9TnjYjPnvqxfkWf7JFDcCWvab7daEGInRw3PHeQHhx8Ac0BgL4en9iNN/QQ2F24+GGLOgMjsEdXHdwRhkPv8mZwWY08QkKUR+t1X2pLpHbHTJLHOth7O+7l7mdd5EaHCFobdFvusd9BJPvQhVDGFH7MJio3BS4UqyOqOLswZYaPT8YpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/n1DV3sN7XJPZZmHU0x8e4fsLIjqsImN8FdpSWYW9A=;
 b=emEJnhq/Waa0ePg3ybF9aQqXJcdeiJCv1y340D6+vbbBUI2fSNobfYcNdBlwbmQavJyA9/yreUsZkSiOHBlRRxjjTI80CJv/hl4Go9wDzCCGeCckm2UAGp0zhtOYtlcdRcYkrVz8h5h88/IH1SHyeBKKgvuMJVin7CxstPXhxOVnAlPT0O8XQ7I0h26LE16gdTINwRCAi98cQDkkyY57/B/L/QY5LrUSc2h3RoGpVmP3SUYtRx62Mq1pOrr5yxKRe53Vz9m88HnXrA2gnosl0Td70wegxEXvScWZPZcerZ/DI5odVN9J1OTodlp6jakLJb5skiLdw/jqDPSJE/oNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/n1DV3sN7XJPZZmHU0x8e4fsLIjqsImN8FdpSWYW9A=;
 b=M6kVshMWUFZ4fXptuP+wjG29fdZyZzna9/6XT2HBGk82X1InOYcFqOL9n6dov+5lTiMgc+h2IFgOA33om7j55/ZgEf+yWSfbr7FzlhHIVXx0V8i7AXsA2M8cNanHiyTlxgCEFXWNofw10VJFzvnzz/Hd2pvWIjHXdDAF70nP9AE8Jp4qGAiSWqc6x+RkoMyEBmAK6aam5JLQu+XaNQfcJ2d+ccisGB8vBfZn43J73QtLDSA+tdVJi+MEiyaMyVrw1Wt9EvuhB79m07w0kZs4syPtgQY2AyKDLJu8fgOOcppfe/1wXcACcMvOEoMMSqsAw0rfJUIq+U1uK07TlqI0+Q==
Received: from DM6PR10CA0005.namprd10.prod.outlook.com (2603:10b6:5:60::18) by
 SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Sun, 11 May
 2025 21:09:43 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:5:60:cafe::45) by DM6PR10CA0005.outlook.office365.com
 (2603:10b6:5:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:09:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:37 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 55/62] drm/nouveau: add helper functions for allocating
 pinned/cpu-mapped bos
Date: Mon, 12 May 2025 07:07:15 +1000
Message-ID: <20250511210722.80350-56-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|SA3PR12MB7921:EE_
X-MS-Office365-Filtering-Correlation-Id: 846fd742-5107-407f-aa8e-08dd90d026bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?77KzJa+QqzOoYKqWJn/TrYt5kfW09lqY7cW2alBRAjjZ5pdRHekAW+yyJK7P?=
 =?us-ascii?Q?cLkXvsK2+Ty6SZpSVwYFox+3jBSXeO00jqflIHvhGCGDVGzsiNCmNscnOfaO?=
 =?us-ascii?Q?f5DaNy/FWsoNg152LgJ8kU8e8f97Ed9nIXq/6uX3GwQj60VMU3pHD/tvNeOZ?=
 =?us-ascii?Q?NNqWsW1S0vLknVus0/58e0FBlM4TyGV/07fRG6DfBExGMWUcbhmlu+UgougK?=
 =?us-ascii?Q?Jy0eXO6+gOLaNeOV2SVeI2Fpni1v9Dtje1FesLPOubE6gnJ0znQWs6VAMSey?=
 =?us-ascii?Q?pbGtzye/q3DeJaD2rnmvhhtlra73P2poGizCCc8Q2mQoDLr77ZJvsSnuuvcV?=
 =?us-ascii?Q?OiNLWlw5Q9zn91YlCwIcAf6II7UsYmJ9RSNeFtmGQexY2elWPFQktVHrkEPm?=
 =?us-ascii?Q?fTR7vRlGLQC8X538ANfmiEyr1gYWGYZYbc1l2cV18Tj4j793qu+qSYlHOep/?=
 =?us-ascii?Q?qaaIKO1Y7+Kn0OeuyBg/kcZwtqN7T8yFa2FJinyS5TkXa5wgR9iT+9URoqPS?=
 =?us-ascii?Q?cciymjWRfXpEjk3nkI5gMj0vFH3rC4wnnG/zO6TjlaUThi1FtLRrXOg8C2Mc?=
 =?us-ascii?Q?p8SxVMxsOruuMIzBarGhwqltG6RjqCSvHzW+11bD2/S5UJaZ0LBcJPhM4/9L?=
 =?us-ascii?Q?wprQ1a0mv40Wqb6jvl88ueRVrhaVf7fiKbogAcfcffzNpcATHtrwr6/1i65s?=
 =?us-ascii?Q?N4x7XZZsZFbcez/EKWohmIj5fsThqeiEZzNqAi1+DMBwXY98PYln5KoSNCTb?=
 =?us-ascii?Q?AYTgT4hrTCP68MQCBmc2e0FCLx+NCu+DWprOrprFrvBAGiuBGwKZwOyjTK6q?=
 =?us-ascii?Q?9zJN1jcWrvqdVgh21B6wVSw3w0Vhd2oLQGeRs2uvcJW1OgGuNY5ijqYredK4?=
 =?us-ascii?Q?6vIRLaw0BUO8JpthPYfCrhPR5OAhs1TkeKLm6v75oNVfnjk+6Ya/UdmUM1LM?=
 =?us-ascii?Q?4ymqc8IojnKuiQlTSjQ4+7KtARDV8vX4UwipfjR2e2HEKjf3yl2iCBQSAU13?=
 =?us-ascii?Q?zqhDKf9JNYs6PhcHIpm90KQzCFvDze2EnXa6D7I+7D8JQCWOCGc4K15QOZg+?=
 =?us-ascii?Q?UVjuh+ZzEccbD1s8XNsd2K7nl+pJ5snyQPM9lpM9UCz4YV30SWVZ/siwOMiM?=
 =?us-ascii?Q?cECXy0IuUABOfZvNGfmzLjp8ZHbaFkP+D8SFAMB9zSRgVOFa81XosIoLeArI?=
 =?us-ascii?Q?sqACK/W4X8XwI4VzGGk4W6XN0enT74CYo1agQa/VbKJFuuKLgN+fWjHQP8To?=
 =?us-ascii?Q?wxOvISWg3l6/KU2I+LZxLOw/m+3OfS8alGWhXxHy7xhVBGoQj4FYJy9J0NG3?=
 =?us-ascii?Q?Jb3bDBAd9i9aJiMmnEmsvSPTTKQI3KO+dq/iAXBt/o9R5N/v0mKkgimkhf6H?=
 =?us-ascii?Q?EB1tIRAzkSQBk1Hgc3yGQ8zJ5p8F6iCkzDVG82Xjc051yRx9RgqhV1MUM5g5?=
 =?us-ascii?Q?TKUw2OnP7CqlVNujSWwCvjDb7seaJU9dwaUHNQlEIdDvzio+bPDHHCviVh9V?=
 =?us-ascii?Q?I/J2GjPn9PUQ7yESX1sk7v9rZrfOd2SdqWEw?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:43.2548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846fd742-5107-407f-aa8e-08dd90d026bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921
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

Replace some awkward sequences that are repeated in a number of places
with helper functions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 22 +++-------
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 +--------
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 55 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h    |  5 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 14 +------
 drivers/gpu/drm/nouveau/nouveau_dmem.c  | 18 +++-----
 drivers/gpu/drm/nouveau/nv10_fence.c    |  6 +--
 drivers/gpu/drm/nouveau/nv17_fence.c    | 15 +------
 drivers/gpu/drm/nouveau/nv50_fence.c    | 15 +------
 drivers/gpu/drm/nouveau/nv84_fence.c    | 19 ++-------
 10 files changed, 81 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 67146f1e8482..c063756eaea3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -768,9 +768,7 @@ static void nv_crtc_destroy(struct drm_crtc *crtc)
 		disp->image[nv_crtc->index] = NULL;
 	}
 
-	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
-	nouveau_bo_unpin(nv_crtc->cursor.nvbo);
-	nouveau_bo_fini(nv_crtc->cursor.nvbo);
+	nouveau_bo_unpin_del(&nv_crtc->cursor.nvbo);
 	nvif_event_dtor(&nv_crtc->vblank);
 	nvif_head_dtor(&nv_crtc->head);
 	kfree(nv_crtc);
@@ -1303,6 +1301,7 @@ nv04_crtc_vblank_handler(struct nvif_event *event, void *repv, u32 repc)
 int
 nv04_crtc_create(struct drm_device *dev, int crtc_num)
 {
+	struct nouveau_cli *cli = &nouveau_drm(dev)->client;
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_crtc *nv_crtc;
 	struct drm_plane *primary;
@@ -1336,20 +1335,9 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
 
-	ret = nouveau_bo_new(&nouveau_drm(dev)->client, 64*64*4, 0x100,
-			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0x0000, NULL, NULL,
-			     &nv_crtc->cursor.nvbo);
-	if (!ret) {
-		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo,
-				     NOUVEAU_GEM_DOMAIN_VRAM, false);
-		if (!ret) {
-			ret = nouveau_bo_map(nv_crtc->cursor.nvbo);
-			if (ret)
-				nouveau_bo_unpin(nv_crtc->cursor.nvbo);
-		}
-		if (ret)
-			nouveau_bo_fini(nv_crtc->cursor.nvbo);
-	}
+	ret = nouveau_bo_new_map(cli, NOUVEAU_GEM_DOMAIN_VRAM, 64 * 64 * 4, &nv_crtc->cursor.nvbo);
+	if (ret)
+		return ret;
 
 	nv04_cursor_init(nv_crtc);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9bed728cb00e..10485510b539 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2808,10 +2808,7 @@ nv50_display_destroy(struct drm_device *dev)
 	nvif_object_dtor(&disp->caps);
 	nv50_core_del(&disp->core);
 
-	nouveau_bo_unmap(disp->sync);
-	if (disp->sync)
-		nouveau_bo_unpin(disp->sync);
-	nouveau_bo_fini(disp->sync);
+	nouveau_bo_unpin_del(&disp->sync);
 
 	nouveau_display(dev)->priv = NULL;
 	kfree(disp);
@@ -2843,20 +2840,7 @@ nv50_display_create(struct drm_device *dev)
 	dev->mode_config.normalize_zpos = true;
 
 	/* small shared memory area we use for notifiers and semaphores */
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
-			     NOUVEAU_GEM_DOMAIN_VRAM,
-			     0, 0x0000, NULL, NULL, &disp->sync);
-	if (!ret) {
-		ret = nouveau_bo_pin(disp->sync, NOUVEAU_GEM_DOMAIN_VRAM, true);
-		if (!ret) {
-			ret = nouveau_bo_map(disp->sync);
-			if (ret)
-				nouveau_bo_unpin(disp->sync);
-		}
-		if (ret)
-			nouveau_bo_fini(disp->sync);
-	}
-
+	ret = nouveau_bo_new_map(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, PAGE_SIZE, &disp->sync);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fbe0144927e8..3a5ddf60380e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -401,6 +401,61 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	return 0;
 }
 
+void
+nouveau_bo_unpin_del(struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo = *pnvbo;
+
+	if (!nvbo)
+		return;
+
+	nouveau_bo_unmap(nvbo);
+	nouveau_bo_unpin(nvbo);
+	nouveau_bo_fini(nvbo);
+
+	*pnvbo = NULL;
+}
+
+int
+nouveau_bo_new_pin(struct nouveau_cli *cli, u32 domain, u32 size, struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	ret = nouveau_bo_new(cli, size, 0, domain, 0, 0, NULL, NULL, &nvbo);
+	if (ret)
+		return ret;
+
+	ret = nouveau_bo_pin(nvbo, domain, false);
+	if (ret) {
+		nouveau_bo_fini(nvbo);
+		return ret;
+	}
+
+	*pnvbo = nvbo;
+	return 0;
+}
+
+int
+nouveau_bo_new_map(struct nouveau_cli *cli, u32 domain, u32 size, struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	ret = nouveau_bo_new_pin(cli, domain, size, &nvbo);
+	if (ret)
+		return ret;
+
+	ret = nouveau_bo_map(nvbo);
+	if (ret) {
+		nouveau_bo_unpin_del(&nvbo);
+		return ret;
+	}
+
+	*pnvbo = nvbo;
+	return 0;
+}
+
 static void
 set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 596a63a50a20..f402f14bebb0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -9,6 +9,7 @@ struct nouveau_channel;
 struct nouveau_cli;
 struct nouveau_drm;
 struct nouveau_fence;
+struct nouveau_vma;
 
 struct nouveau_bo {
 	struct ttm_buffer_object bo;
@@ -89,6 +90,10 @@ void nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo);
 void nouveau_bo_add_io_reserve_lru(struct ttm_buffer_object *bo);
 void nouveau_bo_del_io_reserve_lru(struct ttm_buffer_object *bo);
 
+int nouveau_bo_new_pin(struct nouveau_cli *, u32 domain, u32 size, struct nouveau_bo **);
+int nouveau_bo_new_map(struct nouveau_cli *, u32 domain, u32 size, struct nouveau_bo **);
+void nouveau_bo_unpin_del(struct nouveau_bo **);
+
 /* TODO: submit equivalent to TTM generic API upstream? */
 static inline void __iomem *
 nvbo_kmap_obj_iovirtual(struct nouveau_bo *nvbo)
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index a14aa6715bb9..4b4bbbd8d7b7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -105,10 +105,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_mem_dtor(&chan->mem_userd);
 		nvif_object_dtor(&chan->push.ctxdma);
 		nouveau_vma_del(&chan->push.vma);
-		nouveau_bo_unmap(chan->push.buffer);
-		if (chan->push.buffer && chan->push.buffer->bo.pin_count)
-			nouveau_bo_unpin(chan->push.buffer);
-		nouveau_bo_fini(chan->push.buffer);
+		nouveau_bo_unpin_del(&chan->push.buffer);
 		kfree(chan);
 	}
 	*pchan = NULL;
@@ -163,14 +160,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 	if (nouveau_vram_pushbuf)
 		target = NOUVEAU_GEM_DOMAIN_VRAM;
 
-	ret = nouveau_bo_new(cli, size, 0, target, 0, 0, NULL, NULL,
-			    &chan->push.buffer);
-	if (ret == 0) {
-		ret = nouveau_bo_pin(chan->push.buffer, target, false);
-		if (ret == 0)
-			ret = nouveau_bo_map(chan->push.buffer);
-	}
-
+	ret = nouveau_bo_new_map(cli, target, size, &chan->push.buffer);
 	if (ret) {
 		nouveau_channel_del(pchan);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 61d0f411ef84..ca4932a150e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -256,20 +256,15 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
-	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
-			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
-			     &chunk->bo);
+	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
+				 &chunk->bo);
 	if (ret)
 		goto out_release;
 
-	ret = nouveau_bo_pin(chunk->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-	if (ret)
-		goto out_bo_free;
-
 	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
 	if (IS_ERR(ptr)) {
 		ret = PTR_ERR(ptr);
-		goto out_bo_unpin;
+		goto out_bo_free;
 	}
 
 	mutex_lock(&drm->dmem->mutex);
@@ -292,10 +287,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 
 	return 0;
 
-out_bo_unpin:
-	nouveau_bo_unpin(chunk->bo);
 out_bo_free:
-	nouveau_bo_fini(chunk->bo);
+	nouveau_bo_unpin_del(&chunk->bo);
 out_release:
 	release_mem_region(chunk->pagemap.range.start, range_len(&chunk->pagemap.range));
 out_free:
@@ -426,8 +419,7 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
 		nouveau_dmem_evict_chunk(chunk);
-		nouveau_bo_unpin(chunk->bo);
-		nouveau_bo_fini(chunk->bo);
+		nouveau_bo_unpin_del(&chunk->bo);
 		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
 		memunmap_pages(&chunk->pagemap);
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 8c73f40e3bda..40ee95340814 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -85,10 +85,8 @@ void
 nv10_fence_destroy(struct nouveau_drm *drm)
 {
 	struct nv10_fence_priv *priv = drm->fence;
-	nouveau_bo_unmap(priv->bo);
-	if (priv->bo)
-		nouveau_bo_unpin(priv->bo);
-	nouveau_bo_fini(priv->bo);
+
+	nouveau_bo_unpin_del(&priv->bo);
 	drm->fence = NULL;
 	kfree(priv);
 }
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index d09bfd11369f..1b0c0aa3c305 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -130,20 +130,7 @@ nv17_fence_create(struct nouveau_drm *drm)
 	priv->base.context_del = nv10_fence_context_del;
 	spin_lock_init(&priv->lock);
 
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
-			     NOUVEAU_GEM_DOMAIN_VRAM,
-			     0, 0x0000, NULL, NULL, &priv->bo);
-	if (!ret) {
-		ret = nouveau_bo_pin(priv->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-		if (!ret) {
-			ret = nouveau_bo_map(priv->bo);
-			if (ret)
-				nouveau_bo_unpin(priv->bo);
-		}
-		if (ret)
-			nouveau_bo_fini(priv->bo);
-	}
-
+	ret = nouveau_bo_new_map(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, PAGE_SIZE, &priv->bo);
 	if (ret) {
 		nv10_fence_destroy(drm);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 62e28dddf87c..e1f0e8adf313 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -81,20 +81,7 @@ nv50_fence_create(struct nouveau_drm *drm)
 	priv->base.context_del = nv10_fence_context_del;
 	spin_lock_init(&priv->lock);
 
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
-			     NOUVEAU_GEM_DOMAIN_VRAM,
-			     0, 0x0000, NULL, NULL, &priv->bo);
-	if (!ret) {
-		ret = nouveau_bo_pin(priv->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-		if (!ret) {
-			ret = nouveau_bo_map(priv->bo);
-			if (ret)
-				nouveau_bo_unpin(priv->bo);
-		}
-		if (ret)
-			nouveau_bo_fini(priv->bo);
-	}
-
+	ret = nouveau_bo_new_map(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, PAGE_SIZE, &priv->bo);
 	if (ret) {
 		nv10_fence_destroy(drm);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index aa7dd0c5d917..1765b2cedaf9 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -185,10 +185,8 @@ static void
 nv84_fence_destroy(struct nouveau_drm *drm)
 {
 	struct nv84_fence_priv *priv = drm->fence;
-	nouveau_bo_unmap(priv->bo);
-	if (priv->bo)
-		nouveau_bo_unpin(priv->bo);
-	nouveau_bo_fini(priv->bo);
+
+	nouveau_bo_unpin_del(&priv->bo);
 	drm->fence = NULL;
 	kfree(priv);
 }
@@ -222,19 +220,8 @@ nv84_fence_create(struct nouveau_drm *drm)
 		  * will lose CPU/GPU coherency!
 		  */
 		NOUVEAU_GEM_DOMAIN_GART | NOUVEAU_GEM_DOMAIN_COHERENT;
-	ret = nouveau_bo_new(&drm->client, 16 * drm->chan_total, 0,
-			     domain, 0, 0, NULL, NULL, &priv->bo);
-	if (ret == 0) {
-		ret = nouveau_bo_pin(priv->bo, domain, false);
-		if (ret == 0) {
-			ret = nouveau_bo_map(priv->bo);
-			if (ret)
-				nouveau_bo_unpin(priv->bo);
-		}
-		if (ret)
-			nouveau_bo_fini(priv->bo);
-	}
 
+	ret = nouveau_bo_new_map(&drm->client, domain, 16 * drm->chan_total, &priv->bo);
 	if (ret)
 		nv84_fence_destroy(drm);
 	return ret;
-- 
2.49.0

