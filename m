Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561793CD58
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E078B10E91D;
	Fri, 26 Jul 2024 04:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zo1g7w2t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5140610E918
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/xGs1X7ntZJPrWycY7pPHyvvKS0cMrHYbjLrTo9WU4jyx1lba54r6IxTNKb/sOt5NOxUlXWvuCDgykbPfDo1SSjrhHPQ/mOOjsr7NTMKcZDEb61CW/HfEhtu7ND1FUF9D5Syld5Nazzq4CmdnuzsRx/3s/LiAvmmKOTJF3S+sE2DLC0Bu+EXzs/P77uBRcpp5WB4Zyvk1Fe9jEkzJXp4lSM0BL+07YJhGb4213Qj30YX/DYYhBh0ZaVjicrnNEO2zqYjdFOehfbLGsYiPhU+jDmxSZDZlEQBTGjz0a3cSIfdTBwat6qAwcvE7kGPRJYHEuAODqlr2+l6kFZUebUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpG059Lw1hJwVkfgYLoOLmc6p5fSbueAh7HqjJoL5WE=;
 b=yfUht+0FcQASPawHeKW+yI7vnVDQtTigCSuogEKi8Nj0mOCLvhjtRXnh1nZxBvq1DG9TmVDXPPKumVrehZ/X7QDjgenpEjlupXbL1wzGPxm2hhTwCMN70ZqABknsAn9K/9fzUI5o1TsDq0Vgn5P4gpu3S7IGloKEuhGg0CAni39RZDOwpxTUkPab0DLsVbWu2uUBPYnjJKEVeouaSuCwuKm2qmXK+l6VkThcekvqsMU7Fa0rtDNDd0crvA2eFg2uKWWCUtWDSniGBFBUOL8Zo/AoAZLhVg+oLKztrd3CG3h2m0tJxK8XTr+gLfOZv13I1UnS87eOgIg5KTct/Rb0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpG059Lw1hJwVkfgYLoOLmc6p5fSbueAh7HqjJoL5WE=;
 b=Zo1g7w2tEtGlmatZAJgjB89p3XCieUbP8/i8DoJcfAzgA6c9Qg7W/I8nxNHl5SEYqYy6I1WyTwjQ6MH2ReOVbNwyBXS5XwHRHBsfVfeb3m1dedpCwa8obWQAUx42njq6f1gOg76xK8lVlOBGfK0BZ6Ft6Z/yzsPaEzLpZNNRJLcZmGGrIen3cc/G08Fy12DqDnlyYQ7QucGaL3a/eBcLzOWzzSBtea4/JPTxRK3+a7/zAZBHMJ8ndbNfk/kTnKnIx0VMgRms0GyfyCjCtdt/7z4mwfUtt3HOT9WXU3Xy4bm/RKPUK3Pr6UWJhTpzvM6IxgEnJKmAp8lkklM6tWgJ+Q==
Received: from DM6PR03CA0062.namprd03.prod.outlook.com (2603:10b6:5:100::39)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 04:39:46 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::63) by DM6PR03CA0062.outlook.office365.com
 (2603:10b6:5:100::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:33 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 35/37] drm/nouveau: remove push pointer from nouveau_channel
Date: Fri, 26 Jul 2024 14:38:26 +1000
Message-ID: <20240726043828.58966-36-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9dbede-046b-4509-e8b8-08dcad2cf99d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6xB6leBpasHeaEYS4/SyhC62SP3CGZ8v9BN9Dluo6/envjRmqOh3lmPRdH+3?=
 =?us-ascii?Q?uI4zfC+Dtdblt2ajV7GSVYSdrj7rCnNlmX2/0GO+oKhePYrz3H5rBrzwzjoA?=
 =?us-ascii?Q?c/mimX/RVISa9bA8UV3b0xbh1YlPocz5x/QPXPyOZN6fX18347g32RUehgiK?=
 =?us-ascii?Q?7RotBH264ZHMZmInEAIuuWSY+nufMRy1hIyFaEbrh5OQcwjY6tendVCPEuJ3?=
 =?us-ascii?Q?2eg8O6KqGTct6NyR7wYc9Na1a9xgUU7/WnAnX70voAbjX/MZ7VdVXqjd4d3/?=
 =?us-ascii?Q?lfgwIWAEZlnrKmNJEbi9Ajxx4nd1/dAPvrtE0TlAwm9T4RkoBe5p7mwrpsqE?=
 =?us-ascii?Q?I7FgRNd+t1QrEh4kwOV+dpfBBF76wSkqZZjEh0EgmDW+Czy9Nc0/058UVCo5?=
 =?us-ascii?Q?18TtpjME7fv0Wkv0a0qROIQRuE7XS4kkdM4XwXcwtXrxdJ7z2NQtXu24GZdf?=
 =?us-ascii?Q?Vo3BZOuITWI0kKMQH8k9tTA2Hz4bSLh+e9BLUnepwvfQB2FiQM48KKVHCkWq?=
 =?us-ascii?Q?iAS0LuVmLZukGlWll3wemllzMspXEMJ9kXRULCxYCI4YfTA3HCt4cfrZCVOc?=
 =?us-ascii?Q?os9Z5UGD7HhPgyfQvULbXyqebn9Pi/1gg6yaapZSlS5Odv45c4b8FjnlFAIn?=
 =?us-ascii?Q?/58eqDUvFm+o957e1pxeLKlKmoMscv6nDqOzh3++R9xFcj5/QkC9DNZbzqXl?=
 =?us-ascii?Q?snCvpxPdl4zIAMWEkaKEumuh13HKcAnJYaUyeDtnJf3w8czO3RnW96mKBK9/?=
 =?us-ascii?Q?Vym03GFehiK8ner+RPu/W6LPiuPOmhoXYo/hWv/J8B6v136IeLa1Fd4sk9yy?=
 =?us-ascii?Q?eGrfMDBne8+AqGvY4sKjtcbfCdGveBDbU8j9AlErwES9Ds43X4fbLLlSP9B/?=
 =?us-ascii?Q?myvaXKvopGNHC5hUwoAp89svZau8mIc7DYOl962JWeKLzpaCRMliTboZKFTL?=
 =?us-ascii?Q?wUsCwMxmYbj6QQYnneodzEdbXFhJePiKVjklLvYBIh2oShaWS6ZLkkOQJYJu?=
 =?us-ascii?Q?i1hXctMWXEzlzWu+tm2qqU9kBOEBUVUvl3WYZUv/rTHwPSej0ijEKZEd6w1E?=
 =?us-ascii?Q?kFJlykxmuLg/ueZvH5hzb3Cea3MUgmIQFj2+0hdhL8z4lGIhr8W25U9ec/Iw?=
 =?us-ascii?Q?L3+DrRsB98QShGwC0zqqHuME9zR8vi3Z/kTjKGHh/P32HwJt2B0qPX8w8kk+?=
 =?us-ascii?Q?ZHR19PGp6QvCMZ8TCggiJSBG4JRf3FsHr39fLlEzJVSL1fnmNsAGptVBX7vW?=
 =?us-ascii?Q?qtKMkVGV6zY8K9YW+8I7hsjhaFZ8Dl1jzZovjQ40uPioPMPTWsgp6ZWvng5s?=
 =?us-ascii?Q?Ql1exB8wSpY9srUFV5sdYlxtIiK2bya3pAQT+BxE3EetbdSKwwgwpGLmV3sh?=
 =?us-ascii?Q?DVR44wo6aAldU54NsoebvvlVOKzX1Zr55k6wRH5UHW1JlK867R/O61P4I360?=
 =?us-ascii?Q?FJaclRpUyRQOND4M6Nr+p9WOKgevwscF?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:45.6247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9dbede-046b-4509-e8b8-08dcad2cf99d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
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
index 33ff21d40cfb..67146f1e8482 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1115,7 +1115,7 @@ nv04_page_flip_emit(struct nouveau_channel *chan,
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_drm *drm = chan->cli->drm;
 	struct drm_device *dev = drm->dev;
-	struct nvif_push *push = chan->chan.push;
+	struct nvif_push *push = &chan->chan.push;
 	unsigned long flags;
 	int ret;
 
@@ -1173,7 +1173,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer *fb,
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
index e95b8092dae3..02eff65d7231 100644
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
index 7b3b8f4630a2..d2604d0d2d07 100644
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
index ca63d13efb25..ac7c60fb14d3 100644
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
index 1a53b8b80467..8c73f40e3bda 100644
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
index 51fcac894146..d09bfd11369f 100644
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
index 1f5a02a9239f..aa7dd0c5d917 100644
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

