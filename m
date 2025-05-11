Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5D6AB2B62
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9764410E1CA;
	Sun, 11 May 2025 21:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="F0leGtzn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2075.outbound.protection.outlook.com [40.107.95.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C1E10E1CA
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0mAf7GDz9Pz8h8QExb1Awlq+KBq3AL5Z5NTKAGLWFYIrYRj7QPFeTePSkNmDA9X/vVHhkCZeACDw6I+W1BZ48sPUMCnIIC3qFMWmFf1pxMQI9SGM57l5svzJmv/wfJgkGl7OBYb/ZH5i38idxkC9aJAy+BHYCnpC6oQzgWA9zBooxRizfYuW7d/dxgi26Ne6PgzWE6Tbn8bLcueYsvOjgtgDaCm081pI59eR2n9hNCdOqLwDUBttCdE2lm9HkfxAXCqcI07nIMjQ88ovxeqyy7fkY/48F4bgkgztFQ3w5DyzcDLSKWmDUVWFBy78u2jOjC30jY7r1x611/LbML70w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o0b9NrX5++PpMNRjiqUCYWxBPtMcgpl51IRmCQeeO8g=;
 b=I8ekkaTYOgO6KpJxQL3PCIuyGcTATjCWCdtKX7Oq3D1jKqcTUVPcAYaHRZZZ+zFsYWv9ZW+5cxtOCtH7+tcZ1CuHqpR4b8MYgnOuRtHHZRb4Gh5mIjbzFz0iIjzgbP8YM2ZO+gITs5TdAex7oAqZIA+qtYBbapvH0DA3ZcUrVM475Mjou1rCQ2k91ugVYO5jw5Bm3phkzZwQs3Qu3IuWXJ1e2R8IOItEAgSutcbtRTXzdV9pLhsxBeNJ3vS3zIfq+4/c88qdN4sP8hnr25jfAKSgiuR0JDnYy2R4UCmWHKx4W+WsEL8SG2ghjl1dYKo1wJlQR0BDBJVSjFowEaq3QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o0b9NrX5++PpMNRjiqUCYWxBPtMcgpl51IRmCQeeO8g=;
 b=F0leGtznrssr85vbKj++4GzJ6i/d/ObmXrnTujoq2UL9VmeibcU3NXcPDX0emSireJ1x0jcC2unra1X87dPxQZtDsfwOhZAiYkwJ4rxZTdnPjzydvDLsBnfVuHXBkp28A4wm3ILUxEmvaxADifBmVP8hFLOQ3+h0PA2LVu6vj/hjfcIHu9Oyk3PwqHqb+FZG9tUsbfJhEmRMtvIwbZtuY8bwGCU+ESQesyf4VqX7tOfj7TobbPtBCTtdfTQRQd9OtsJFL6FEZVDyVbJb0bARdYOb22o1+dHejJ6YmULQaIt8ssom4e+OONJRGtGMFrfXGy96tjgZQYOrMUvlIbSAKg==
Received: from DM6PR07CA0059.namprd07.prod.outlook.com (2603:10b6:5:74::36) by
 LV3PR12MB9118.namprd12.prod.outlook.com (2603:10b6:408:1a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:09:01 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::3b) by DM6PR07CA0059.outlook.office365.com
 (2603:10b6:5:74::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.25 via Frontend Transport; Sun,
 11 May 2025 21:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:53 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 30/62] drm/nouveau/gsp: add hal for disp.chan.set_pushbuf()
Date: Mon, 12 May 2025 07:06:50 +1000
Message-ID: <20250511210722.80350-31-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|LV3PR12MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a93c43-7e72-4e62-c66d-08dd90d00dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?75Q8MKR1ykUitHNyEVplOjK2WfZrarWfgPwWAsFuCFbOc/dpJh3s5GogF8AP?=
 =?us-ascii?Q?bhR8YPo2oadBFcAMAdLmbfUROYy+FsbwiRaGzOfBhGtQLdJMRb/3Y+4Fhr7R?=
 =?us-ascii?Q?Y50Vh84IYKMPMbBGMj5UP9yAeBxwqLtu+bprnzG4QynLP1Y9cEfHicYn/YLS?=
 =?us-ascii?Q?KRsSuSAu/k4JYLEtmfjE7PQ+tkoU9PB6YWgzI1nylIvUcJbDGsijRW0dswcj?=
 =?us-ascii?Q?33s1Y80stOYC5mdipoeQ6lt6kAfnJIUpIlP8kXxgnb9+ou7uUj3BFEe6+Knm?=
 =?us-ascii?Q?cWZLxnWUQJO0mf9W5dSTrT9QHgTec0nQMBhoWtjnXhGU5f1PLwp06k5m/QzJ?=
 =?us-ascii?Q?RWU0Ui3APyuV6RyBQMmA6sL5TjwFPhFfVUDLEQegP2r5CWRye5deppnde/Rc?=
 =?us-ascii?Q?+A4nBSUJxYmYfuaCqOdyF2i5KxJnVaAWL9rG9fD0hFG5D1XBEwSYvLFCPQm1?=
 =?us-ascii?Q?MhCumIqN5wG1XHuc351r3G0b7kh1JVYYr7OqbkSqmvMmAqFvNHYRPDcrlz5M?=
 =?us-ascii?Q?1VF9oCv4a6ueFZHFlz26UKcipsnxIYaZrzxDvd/YMeuVxs92rw3Ic+FOX/nz?=
 =?us-ascii?Q?edYcJ4fgHwz2pSC9Ziv6mgeC7mh1/k0PNZfdLhkdlQDQc7GZcaRamNG+TQZu?=
 =?us-ascii?Q?f8suCXeKK+NcCD6WR7/O4YQxEWbKBPbYxVNQKb8o5CDTM3x8munb6jA77LVX?=
 =?us-ascii?Q?e7+2jg7dXc1p11p3Ukd/iujolwA6ehz2vQytOJbTA/V9WEOR/AHO01rREiaH?=
 =?us-ascii?Q?v9UEw/ujssdGnRGUHPojquBQMamyXIAz8myfTB4A2YrYjdO+4RXW889eBVA+?=
 =?us-ascii?Q?jkUk+zEHrvZweYvLBGfgP7kobL0Y3sLbGhr/0sZGGQAKL+Q4r/CLVU8IPd6p?=
 =?us-ascii?Q?p1BSYPv6JzPDYMAqPfMYHvRARVk34XMEDeXRwKapfd9SEpBNqG2+vJPerQlJ?=
 =?us-ascii?Q?EDAhiqlw6Dr4Vec42vmqpUZYNrFdaw7BN3GLN4i0hvwu2Xn7W+uIIB8CgU43?=
 =?us-ascii?Q?TK76JTno62IyBGJhYJzhdob+qLTa1AMdXbzeZ8TUOGp+EmA+VCHiVGDndKOx?=
 =?us-ascii?Q?McDkSgDdSOvsCa30CGBdFGhiYCkRYzOHkYuK/xZOJYkT4TG1T4Qu0pfLQbmv?=
 =?us-ascii?Q?bJ4OvmB/Kii1QN59yTFnOhPuxaxQSvdEDkWFhYqvBYW37vcvJh8rXO911l39?=
 =?us-ascii?Q?uhtyBgabjx53dF7OkxtEI4/nidt3LNKDAQaz8DItY9VPy1u0Bg7XUsFWDWby?=
 =?us-ascii?Q?5hStlMm4OpI9IlLLxxsLWO+cERdrFsyYD3LIyoGEHT2s6r8vVpMHLDCXtBvh?=
 =?us-ascii?Q?yzFIIgZxs6eEWxjnzjO2gLPcKPd+yhuuXzkXkwKJ20pQWitpkR8zHQK+b3ES?=
 =?us-ascii?Q?CgVi5KJ+bsoDi8Jh8ysEgY7pwBpFKskGTcmaK6OS0lFfIFGZS+ESvK5PuhsC?=
 =?us-ascii?Q?tbRAc5lsYbg7vt/NpPLft6ghv99FRFgZiHgffwpZrzDO/7bIS6gq9ZWKsmLX?=
 =?us-ascii?Q?ksAdcTJ+OEqtH/8/P4tVSbESJ55utuhnf8Ow?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:01.4613 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a93c43-7e72-4e62-c66d-08dd90d00dd4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9118
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

550.40.07 has incompatible changes to
NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 27 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 ++++
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 8cc0b6529296..ce84e72ef936 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -70,9 +70,9 @@ r535_chan_fini(struct nvkm_disp_chan *chan)
 }
 
 static int
-r535_chan_push(struct nvkm_disp_chan *chan)
+r535_disp_chan_set_pushbuf(struct nvkm_disp *disp, s32 oclass, int inst, struct nvkm_memory *memory)
 {
-	struct nvkm_gsp *gsp = chan->disp->engine.subdev.device->gsp;
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
 	NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS *ctrl;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
@@ -81,8 +81,8 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
-	if (chan->memory) {
-		switch (nvkm_memory_target(chan->memory)) {
+	if (memory) {
+		switch (nvkm_memory_target(memory)) {
 		case NVKM_MEM_TARGET_NCOH:
 			ctrl->addressSpace = ADDR_SYSMEM;
 			ctrl->cacheSnoop = 0;
@@ -99,13 +99,13 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 			return -EINVAL;
 		}
 
-		ctrl->physicalAddr = nvkm_memory_addr(chan->memory);
-		ctrl->limit = nvkm_memory_size(chan->memory) - 1;
+		ctrl->physicalAddr = nvkm_memory_addr(memory);
+		ctrl->limit = nvkm_memory_size(memory) - 1;
 	}
 
-	ctrl->hclass = chan->object.oclass;
-	ctrl->channelInstance = chan->head;
-	ctrl->valid = ((chan->object.oclass & 0xff) != 0x7a) ? 1 : 0;
+	ctrl->hclass = oclass;
+	ctrl->channelInstance = inst;
+	ctrl->valid = ((oclass & 0xff) != 0x7a) ? 1 : 0;
 
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
@@ -113,10 +113,11 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 static int
 r535_curs_init(struct nvkm_disp_chan *chan)
 {
+	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
 	NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = r535_chan_push(chan);
+	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, NULL);
 	if (ret)
 		return ret;
 
@@ -166,10 +167,11 @@ r535_dmac_fini(struct nvkm_disp_chan *chan)
 static int
 r535_dmac_init(struct nvkm_disp_chan *chan)
 {
+	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
 	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = r535_chan_push(chan);
+	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, chan->memory);
 	if (ret)
 		return ret;
 
@@ -1742,5 +1744,8 @@ r535_disp = {
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
+	},
+	.chan = {
+		.set_pushbuf = r535_disp_chan_set_pushbuf,
 	}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index b9c775aec58e..a8f070871d80 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -79,6 +79,11 @@ struct nvkm_rm_api {
 		struct {
 			int (*set_indexed_link_rates)(struct nvkm_outp *);
 		} dp;
+
+		struct {
+			int (*set_pushbuf)(struct nvkm_disp *, s32 oclass, int inst,
+					   struct nvkm_memory *);
+		} chan;
 	} *disp;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

