Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B218A7940
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4B2112FE8;
	Tue, 16 Apr 2024 23:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YwrwH1uv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8161B112FA2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcH7moBnIVDryP5zpoA7677HQzzrMxbAc1wxGq//17lVUCH5Nmz4QQsVkDK0ZTwVJ7toN91caT9uyKsljca4pN4Q7iNHfD3ux74NU0RSgk99X08+LWuuPH+UfHav5qH0bKIX218ISWLj71vhgJHEJMwPGiHEwbqH0PxMZT1M9JNBhKAi9aBt0iqtbRgwN9ixejPn9r8JRa9yDKzxGZIjs051QZH+pTPk8Q0K0icuOJZvRLJGY9UqKHImEYmjwCHcb6WPYvEsIN4vZY1eGsLtGg7owJLa9j35GIGmjBEkOV51n4l3LYID1DSxTV/+tQ2tge/uEHRgCvT+CEaIT3uCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sZFe43ZkAi8HJP33wKkvpsdS7GmJ6pDOskIlYb/RbMw=;
 b=dzUorEUBlL2pn5Ea98bFeM1CG3VhuTIRKnGfZwMhEAmj/t/Tmza4LYJdKbz+EGIjwj5FyPLt/SXiDRb+RLdslAhVpKoxawEql0du0S/GNOxX3klh/sibcEC6y3wjjvqH3ApCQklY62oMaPrkOCnxSVlvKlGwNWlQ2HJivJ9vI1RIlu0gK74xGmFZ/8D6/Ljz1ay+J66NTumysP300Xrd/+wwbZhjliGohNM7WJRU7lIz9IGQnuzfRN3K+H1qGHAXpmtAFYGTXYTKkoF92BKXgQa7EoLBHA0fswrXtlV0QTYX+smjPcrUe3TtooZPye2uXsQAZAhqZ9eshu82K8dE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZFe43ZkAi8HJP33wKkvpsdS7GmJ6pDOskIlYb/RbMw=;
 b=YwrwH1uvRYSF3usSiM1Lk2TCrtJaaMRrWcBokdnELd4wL/Q4nFNLLaki/NFiGBbsvyCC7cwFfH7wRONHiSGsHIKZK+kyxYeZVaCQAkVLoc1j/7gpkULrdNMi1vAt196Z8CsgAAaauCW1eBPPkV2/dF6vSJSZgnp1HJt2A8htKRtqfkKrzA/ClxaCrdy8DDLQsXn8rgpIgPEo27dpGCevW0P4u5ipOu/tUbURwTfxs1+7TjDPINQC22IMA5DBYfQ8DraXYkpxmWw++0bo6g1WLH2HlVsiWapRt27ELuYfDs4uX8UzTALJNiBNC4qd4bwMnA/tU76+iOuaf7D9VeDzZw==
Received: from CH0PR03CA0401.namprd03.prod.outlook.com (2603:10b6:610:11b::35)
 by DS7PR12MB6192.namprd12.prod.outlook.com (2603:10b6:8:97::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.46; Tue, 16 Apr 2024 23:43:30 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::d1) by CH0PR03CA0401.outlook.office365.com
 (2603:10b6:610:11b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:16 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 145/156] drm/nouveau/nvif: rework chan "new engobj" apis
Date: Wed, 17 Apr 2024 09:39:51 +1000
Message-ID: <20240416234002.19509-146-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|DS7PR12MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc2cc87-8371-4c8a-a1b3-08dc5e6f052d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEz7f1zhHDzwAZEh4gXjpl9MskGKtjEMRkGjqnRFfBUTe4SDKZJcCXkNqBNTnvUM0Z1etHWzESSY1lF/soQRv4bdCzjGIgp/dm2vu39pvWixyAuLswhRYv6NTd0bMdoip1kcs4ptvDl9sJz035gMLQtC+OfvTfXh2ynBI2b8tPMqvl8DX1PU5AZVPsvh/JhqSLS2fMmav/E88m4kAXVuvEvCWsdAPqCKUtGugKbBNnfeCSCSLcubeJvQnNxBKUHdCcwsq6qP/+ik/gJpINM0dbxApRUo4mKkEIfrXXOJwKyzHp3MZKmXW4Td9gtseK7T4LlSS4q+TAApreu7lq5eKdfNK1up0vwsZQxBG9bUtalVx7xu1txCw76qkVZtKVviXLAncPVjyBWtrKna+5zNVQjiY69e9VA7oBVH0YpunqYiYKIT6WpWeWYFlK8Z+DBBROe+w77dcLo/c8PgAyAHT5GhvnvlyrV9flfFeiW+/k6eBICAPmFIKbNC9/zhsiAeqxFduD7qNVgvujpyxTa/BizynYzYMSbe6N7DrpfQn2V3hC0oC7R+dg4lUWSNRDCHql3RHlLSncppDXJbZvWyAxio6w7MdeXw3bwowf/XeUb6iyLjoumwCwoQcHI+G/8bGMZXIQy5Fw355BEn3MfrvUQk0VM96VWI1mAv3vFwUfHrAO4Gt/2OzFATrLlCDfG4Jg0W7wS/8JwB+JF+oYeZh6eoyvkfq8eB/2c4KY8mQlxqlI2DKmj885HE9L430sDp
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:29.9462 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc2cc87-8371-4c8a-a1b3-08dc5e6f052d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6192
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/include/nvif/chan.h   |  10 ++
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  11 ++
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  31 ++---
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |   4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |   9 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  11 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |   4 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |   2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  18 ++-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   3 +-
 drivers/gpu/drm/nouveau/nv04_fence.c          |   2 +-
 drivers/gpu/drm/nouveau/nvif/chan.c           |  51 +++++++
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 124 ++++++++++++------
 14 files changed, 200 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index e8b27bb135e7..3e10ba2ed20f 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -236,7 +236,7 @@ nv04_display_create(struct drm_device *dev)
 
 	/* Request page flip completion event. */
 	if (drm->channel) {
-		ret = nvif_event_ctor(&drm->channel->nvsw, "kmsFlip", 0, nv04_flip_complete,
+		ret = nvif_event_ctor(&drm->channel->nvsw.object, "kmsFlip", 0, nv04_flip_complete,
 				      true, NULL, 0, &disp->flip);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/chan.h b/drivers/gpu/drm/nouveau/include/nvif/chan.h
index 1115318f8b9d..d43c6ba2a35e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/chan.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/chan.h
@@ -32,4 +32,14 @@ int nvif_chan_event_ctor(struct nvif_chan *, const char *name,
 
 int nvif_chan_ctxdma_ctor(struct nvif_chan *, const char *name, u32 handle, s32 oclass,
 			  void *argv, u32 argc, struct nvif_ctxdma *);
+
+struct nvif_engobj {
+	const struct nvif_engobj_impl *impl;
+	struct nvif_engobj_priv *priv;
+	struct nvif_object object;
+};
+
+int nvif_engobj_ctor(struct nvif_chan *chan, const char *name, u32 handle, s32 oclass,
+		     struct nvif_engobj *);
+void nvif_engobj_dtor(struct nvif_engobj *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 8e805633ded5..69428a879c37 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -21,6 +21,7 @@ struct nvif_disp_chan_priv;
 struct nvif_ctxdma_priv;
 struct nvif_cgrp_priv;
 struct nvif_chan_priv;
+struct nvif_engobj_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -431,6 +432,10 @@ struct nvif_disp_impl {
 	} chan;
 };
 
+struct nvif_engobj_impl {
+	void (*del)(struct nvif_engobj_priv *);
+};
+
 struct nvif_chan_impl {
 	void (*del)(struct nvif_chan_priv *);
 
@@ -460,6 +465,12 @@ struct nvif_chan_impl {
 		int (*new)(struct nvif_chan_priv *, u32 handle, s32 oclass, void *argv, u32 argc,
 			   const struct nvif_ctxdma_impl **, struct nvif_ctxdma_priv **);
 	} ctxdma;
+
+	struct {
+		int (*new)(struct nvif_chan_priv *, u32 handle, u8 engi, s32 oclass,
+			   const struct nvif_engobj_impl **, struct nvif_engobj_priv **,
+			   u64 object);
+	} engobj;
 };
 
 struct nvif_cgrp_impl {
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index ff310b48fa34..8cc7b2410a04 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -81,9 +81,7 @@ struct nouveau_abi16_obj {
 	u64 object;
 
 	union {
-		struct {
-			struct nvif_object object;
-		} engobj;
+		struct nvif_engobj engobj;
 	};
 
 	struct list_head head;
@@ -141,7 +139,7 @@ nouveau_abi16_ntfy_fini(struct nouveau_abi16_chan *chan,
 	if (ntfy->ctxdma.impl)
 		nvif_ctxdma_dtor(&ntfy->ctxdma);
 	else
-		nvif_object_dtor(&ntfy->engobj);
+		nvif_engobj_dtor(&ntfy->engobj);
 	nvkm_mm_free(&chan->heap, &ntfy->node);
 	list_del(&ntfy->head);
 	kfree(ntfy);
@@ -179,7 +177,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16 *abi16,
 
 	/* destroy channel object, all children will be killed too */
 	if (chan->chan) {
-		nvif_object_dtor(&chan->ce);
+		nvif_engobj_dtor(&chan->ce);
 		nouveau_channel_del(&chan->chan);
 	}
 
@@ -400,7 +398,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
 		init->subchan[0].handle = 0x00000000;
 		init->subchan[0].grclass = 0x0000;
-		init->subchan[1].handle = chan->chan->nvsw.handle;
+		init->subchan[1].handle = chan->chan->nvsw.object.handle;
 		init->subchan[1].grclass = 0x506e;
 		init->nr_subchan = 2;
 	}
@@ -415,14 +413,14 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 */
 	switch (device->info.family) {
 	case NV_DEVICE_INFO_V0_VOLTA:
-		ret = nvif_object_ctor(&chan->chan->chan.object, "abi16CeWar", 0, VOLTA_DMA_COPY_A,
-				       NULL, 0, &chan->ce);
+		ret = nvif_engobj_ctor(&chan->chan->chan, "abi16CeWar", 0, VOLTA_DMA_COPY_A,
+				       &chan->ce);
 		if (ret)
 			goto done;
 		break;
 	case NV_DEVICE_INFO_V0_TURING:
-		ret = nvif_object_ctor(&chan->chan->chan.object, "abi16CeWar", 0, TURING_DMA_COPY_A,
-				       NULL, 0, &chan->ce);
+		ret = nvif_engobj_ctor(&chan->chan->chan, "abi16CeWar", 0, TURING_DMA_COPY_A,
+				       &chan->ce);
 		if (ret)
 			goto done;
 		break;
@@ -536,8 +534,8 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
 
 	list_add(&ntfy->head, &chan->notifiers);
 
-	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16EngObj", init->handle,
-			       oclass, NULL, 0, &ntfy->engobj);
+	ret = nvif_engobj_ctor(&chan->chan->chan, "abi16EngObj", init->handle, oclass,
+			       &ntfy->engobj);
 
 	if (ret)
 		nouveau_abi16_ntfy_fini(chan, ntfy);
@@ -680,8 +678,11 @@ nouveau_abi16_ioctl_del(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl
 		return -EINVAL;
 
 	obj = nouveau_abi16_obj_find(abi16, ioctl->object);
-	if (obj)
+	if (obj) {
+		if (obj->type == ENGOBJ)
+			nvif_engobj_dtor(&obj->engobj);
 		nouveau_abi16_obj_del(obj);
+	}
 
 	return 0;
 }
@@ -721,8 +722,8 @@ nouveau_abi16_ioctl_new(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl
 	if (IS_ERR(obj))
 		return PTR_ERR(obj);
 
-	ret = nvif_object_ctor(&chan->chan->chan.object, "abi16EngObj", args->handle, args->oclass,
-			       NULL, 0, &obj->engobj.object);
+	ret = nvif_engobj_ctor(&chan->chan->chan, "abi16EngObj", args->handle, args->oclass,
+			       &obj->engobj);
 	if (ret)
 		nouveau_abi16_obj_del(obj);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h b/drivers/gpu/drm/nouveau/nouveau_abi16.h
index fdf239545c41..c37d304e3f5f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.h
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.h
@@ -14,7 +14,7 @@ int nouveau_abi16_ioctl_gpuobj_free(ABI16_IOCTL_ARGS);
 
 struct nouveau_abi16_ntfy {
 	struct nvif_ctxdma ctxdma;
-	struct nvif_object engobj;
+	struct nvif_engobj engobj;
 	struct list_head head;
 	struct nvkm_mm_node *node;
 };
@@ -22,7 +22,7 @@ struct nouveau_abi16_ntfy {
 struct nouveau_abi16_chan {
 	struct list_head head;
 	struct nouveau_channel *chan;
-	struct nvif_object ce;
+	struct nvif_engobj ce;
 	struct list_head notifiers;
 	struct nouveau_bo *ntfy;
 	struct nouveau_vma *ntfy_vma;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 6c5426fe2007..a94735ec3a9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -965,14 +965,13 @@ nouveau_bo_move_init(struct nouveau_drm *drm)
 		if (chan == NULL)
 			continue;
 
-		ret = nvif_object_ctor(&chan->chan.object, "ttmBoMove",
-				       mthd->oclass | (mthd->engine << 16),
-				       mthd->oclass, NULL, 0,
+		ret = nvif_engobj_ctor(&chan->chan, "ttmBoMove",
+				       (mthd->engine << 16) | mthd->oclass, mthd->oclass,
 				       &drm->ttm.copy);
 		if (ret == 0) {
-			ret = mthd->init(chan, drm->ttm.copy.handle);
+			ret = mthd->init(chan, drm->ttm.copy.object.handle);
 			if (ret) {
-				nvif_object_dtor(&drm->ttm.copy);
+				nvif_engobj_dtor(&drm->ttm.copy);
 				continue;
 			}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 5ac0756714c1..80099dfcd3d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -95,8 +95,8 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		if (chan->chan.impl)
 			nouveau_svmm_part(chan->vmm->svmm, chan->inst);
 
-		nvif_object_dtor(&chan->blit);
-		nvif_object_dtor(&chan->nvsw);
+		nvif_engobj_dtor(&chan->blit);
+		nvif_engobj_dtor(&chan->nvsw);
 		nvif_ctxdma_dtor(&chan->gart);
 		nvif_ctxdma_dtor(&chan->vram);
 		nvif_event_dtor(&chan->kill);
@@ -459,9 +459,8 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 
 	/* allocate software object class (used for fences on <= nv05) */
 	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
-		ret = nvif_object_ctor(&chan->chan.object, "abi16NvswFence", 0x006e,
-				       NVIF_CLASS_SW_NV04,
-				       NULL, 0, &chan->nvsw);
+		ret = nvif_engobj_ctor(&chan->chan, "abi16NvswFence", 0x006e,
+				       NVIF_CLASS_SW_NV04, &chan->nvsw);
 		if (ret)
 			return ret;
 
@@ -469,7 +468,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		if (ret)
 			return ret;
 
-		PUSH_NVSQ(&chan->chan.push, NV_SW, 0x0000, chan->nvsw.handle);
+		PUSH_NVSQ(&chan->chan.push, NV_SW, 0x0000, chan->nvsw.object.handle);
 		PUSH_KICK(&chan->chan.push);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 1340c64c4357..b1dbffd93894 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -26,7 +26,7 @@ struct nouveau_channel {
 
 	struct nvif_ctxdma vram;
 	struct nvif_ctxdma gart;
-	struct nvif_object nvsw;
+	struct nvif_engobj nvsw;
 
 	struct {
 		struct nouveau_bo *buffer;
@@ -52,7 +52,7 @@ struct nouveau_channel {
 	u32 user_get;
 	u32 user_put;
 
-	struct nvif_object blit;
+	struct nvif_engobj blit;
 
 	struct nvif_event kill;
 	atomic_t killed;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index fed91756846f..a0c24456e031 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -570,7 +570,7 @@ nvc0b5_migrate_clear(struct nouveau_drm *drm, u32 length,
 static int
 nouveau_dmem_migrate_init(struct nouveau_drm *drm)
 {
-	switch (drm->ttm.copy.oclass) {
+	switch (drm->ttm.copy.object.oclass) {
 	case PASCAL_DMA_COPY_A:
 	case PASCAL_DMA_COPY_B:
 	case  VOLTA_DMA_COPY_A:
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 28347aa056b8..ae6b992c32f9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -257,7 +257,7 @@ static void
 nouveau_accel_ce_fini(struct nouveau_drm *drm)
 {
 	nouveau_channel_idle(drm->cechan);
-	nvif_object_dtor(&drm->ttm.copy);
+	nvif_engobj_dtor(&drm->ttm.copy);
 	nouveau_channel_del(&drm->cechan);
 }
 
@@ -315,15 +315,13 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 	 * synchronisation of page flips, as well as to implement fences
 	 * on TNT/TNT2 HW that lacks any kind of support in host.
 	 */
-	if (!drm->channel->nvsw.client && device->info.family < NV_DEVICE_INFO_V0_TESLA) {
-		ret = nvif_object_ctor(&drm->channel->chan.object, "drmNvsw",
-				       NVDRM_NVSW, nouveau_abi16_swclass(drm),
-				       NULL, 0, &drm->channel->nvsw);
+	if (device->info.family < NV_DEVICE_INFO_V0_TESLA) {
+		ret = nvif_engobj_ctor(&drm->channel->chan, "drmNvSw", NVDRM_NVSW,
+				       nouveau_abi16_swclass(drm), &drm->channel->nvsw);
 
 		if (ret == 0 && device->info.chipset >= 0x11) {
-			ret = nvif_object_ctor(&drm->channel->chan.object, "drmBlit",
-					       0x005f, 0x009f,
-					       NULL, 0, &drm->channel->blit);
+			ret = nvif_engobj_ctor(&drm->channel->chan, "drmBlit", 0x005f, 0x009f,
+					       &drm->channel->blit);
 		}
 
 		if (ret == 0) {
@@ -332,12 +330,12 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 			ret = PUSH_WAIT(push, 8);
 			if (ret == 0) {
 				if (device->info.chipset >= 0x11) {
-					PUSH_NVSQ(push, NV05F, 0x0000, drm->channel->blit.handle);
+					PUSH_NVSQ(push, NV05F, 0x0000, 0x005f);
 					PUSH_NVSQ(push, NV09F, 0x0120, 0,
 							       0x0124, 1,
 							       0x0128, 2);
 				}
-				PUSH_NVSQ(push, NV_SW, 0x0000, drm->channel->nvsw.handle);
+				PUSH_NVSQ(push, NV_SW, 0x0000, drm->channel->nvsw.object.handle);
 			}
 		}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3d661148943c..e40416c884a8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -40,6 +40,7 @@
 
 #include <linux/notifier.h>
 
+#include <nvif/chan.h>
 #include <nvif/client.h>
 #include <nvif/ctxdma.h>
 #include <nvif/device.h>
@@ -237,7 +238,7 @@ struct nouveau_drm {
 			    struct ttm_buffer_object *,
 			    struct ttm_resource *, struct ttm_resource *);
 		struct nouveau_channel *chan;
-		struct nvif_object copy;
+		struct nvif_engobj copy;
 		int mtrr;
 		int type_vram;
 		int type_host[2];
diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c b/drivers/gpu/drm/nouveau/nv04_fence.c
index fa5c6029f783..802a051428e2 100644
--- a/drivers/gpu/drm/nouveau/nv04_fence.c
+++ b/drivers/gpu/drm/nouveau/nv04_fence.c
@@ -59,7 +59,7 @@ static u32
 nv04_fence_read(struct nouveau_channel *chan)
 {
 	struct nv04_nvsw_get_ref_v0 args = {};
-	WARN_ON(nvif_object_mthd(&chan->nvsw, NV04_NVSW_GET_REF,
+	WARN_ON(nvif_object_mthd(&chan->nvsw.object, NV04_NVSW_GET_REF,
 				 &args, sizeof(args)));
 	return args.ref;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
index 78f380ef01b7..ff4485ed0e89 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -24,6 +24,57 @@
 #include <nvif/ctxdma.h>
 #include <nvif/device.h>
 
+void
+nvif_engobj_dtor(struct nvif_engobj *engobj)
+{
+	if (!engobj->impl)
+		return;
+
+	engobj->impl->del(engobj->priv);
+	engobj->impl = NULL;
+}
+
+int
+nvif_engobj_ctor(struct nvif_chan *chan, const char *name, u32 handle, s32 oclass,
+		 struct nvif_engobj *engobj)
+{
+	const struct nvif_device_impl_fifo *fifo = &chan->device->impl->fifo;
+	const struct nvif_device_impl_runl *runl = &fifo->runl[chan->runl];
+	int ret = -ENODEV, engi;
+
+	for (engi = 0; engi < runl->engn_nr; engi++) {
+		int engine = runl->engn[engi].engine;
+		int runq = 0;
+
+		for (int i = 0; i < fifo->engine[engine].oclass_nr; i++) {
+			if (fifo->engine[engine].oclass[i] == oclass) {
+				if (fifo->engine[engine].type == NVIF_ENGINE_CE) {
+					if (chan->runq != runq++)
+						continue;
+				}
+
+				ret = 0;
+				break;
+			}
+		}
+
+		if (ret == 0)
+			break;
+	}
+
+	if (ret)
+		return ret;
+
+	ret = chan->impl->engobj.new(chan->priv, handle, engi, oclass, &engobj->impl,
+				     &engobj->priv, nvif_handle(&engobj->object));
+	NVIF_ERRON(ret, &chan->object, "[NEW engobj handle:%08x oclass:%08x]", handle, oclass);
+	if (ret)
+		return ret;
+
+	nvif_object_ctor(&chan->object, name ?: "nvifEngObj", handle, oclass, &engobj->object);
+	return 0;
+}
+
 int
 nvif_chan_ctxdma_ctor(struct nvif_chan *chan, const char *name, u32 handle, s32 oclass,
 		      void *argv, u32 argc, struct nvif_ctxdma *ctxdma)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index f6dfba41da8c..6e5a0d980446 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -46,6 +46,21 @@ struct nvkm_uobj {
 	int hash;
 };
 
+static void
+nvkm_uchan_object_del(struct nvif_engobj_priv *priv)
+{
+	struct nvkm_uobj *uobj = (void *)priv;
+	struct nvkm_object *object = &uobj->oproxy.base;
+
+	nvkm_object_fini(object, false);
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_engobj_impl
+nvkm_uchan_object_impl = {
+	.del = nvkm_uchan_object_del,
+};
+
 static int
 nvkm_uchan_object_fini_1(struct nvkm_oproxy *oproxy, bool suspend)
 {
@@ -162,7 +177,7 @@ nvkm_uchan_object_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 					.client = oclass->client,
 					.parent = uobj->cctx->vctx->ectx->object ?: oclass->parent,
 					.engine = engn->engine,
-				 }, argv, argc, &uobj->oproxy.object);
+				 }, NULL, 0, &uobj->oproxy.object);
 	if (ret)
 		return ret;
 
@@ -176,54 +191,87 @@ nvkm_uchan_object_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 }
 
 static int
-nvkm_uchan_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *oclass)
+nvkm_uchan_engobj_new(struct nvif_chan_priv *uchan, u32 handle, u8 engi, s32 oclass,
+		      const struct nvif_engobj_impl **pimpl, struct nvif_engobj_priv **ppriv,
+		      u64 _handle)
 {
-	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
-	struct nvkm_engn *engn;
-	int ret, runq = 0;
+	struct nvkm_chan *chan = uchan->chan;
+	struct nvkm_runl *runl = chan->cgrp->runl;
+	struct nvkm_engn *engt, *engn = NULL;
+	struct nvkm_engine *engine;
+	struct nvkm_oclass _oclass = {};
+	struct nvkm_object *object = NULL;
+	int ret, i = 0;
 
-	nvkm_runl_foreach_engn(engn, chan->cgrp->runl) {
-		struct nvkm_engine *engine = engn->engine;
-		int c = 0;
+	nvkm_runl_foreach_engn(engt, runl) {
+		if (i++ == engi) {
+			engn = engt;
+			break;
+		}
+	}
+
+	if (!engn)
+		return -EINVAL;
 
-		/* Each runqueue, on runlists with multiple, has its own LCE. */
-		if (engn->runl->func->runqs) {
-			if (engine->subdev.type == NVKM_ENGINE_CE) {
-				if (chan->runq != runq++)
-					continue;
+	engine = engn->engine;
+
+	_oclass.handle = handle;
+	_oclass.client = uchan->object.client;
+	_oclass.parent = &uchan->object;
+	_oclass.engine = engine;
+
+	if (engine->func->fifo.sclass) {
+		i = 0;
+		do {
+			_oclass.base.oclass = 0;
+			engine->func->fifo.sclass(&_oclass, i++);
+			if (_oclass.base.oclass == oclass)
+				break;
+		} while (_oclass.base.oclass);
+	} else {
+		for (i = 0; engine->func->sclass[i].oclass; i++) {
+			if (engine->func->sclass[i].oclass == oclass) {
+				_oclass.base = engine->func->sclass[i];
+				break;
 			}
 		}
+	}
 
-		oclass->engine = engine;
-		oclass->base.oclass = 0;
+	if (!_oclass.base.oclass)
+		return -EINVAL;
 
-		if (engine->func->fifo.sclass) {
-			ret = engine->func->fifo.sclass(oclass, index);
-			if (oclass->base.oclass) {
-				if (!oclass->base.ctor)
-					oclass->base.ctor = nvkm_object_new;
-				oclass->ctor = nvkm_uchan_object_new;
-				return 0;
-			}
+	if (!_oclass.base.ctor)
+		_oclass.base.ctor = nvkm_object_new;
 
-			index -= ret;
-			continue;
-		}
+	if (engine) {
+		_oclass.engine = nvkm_engine_ref(engine);
+		if (IS_ERR(_oclass.engine))
+			return PTR_ERR(_oclass.engine);
+	}
 
-		while (engine->func->sclass[c].oclass) {
-			if (c++ == index) {
-				oclass->base = engine->func->sclass[index];
-				if (!oclass->base.ctor)
-					oclass->base.ctor = nvkm_object_new;
-				oclass->ctor = nvkm_uchan_object_new;
-				return 0;
-			}
-		}
+	ret = nvkm_uchan_object_new(&_oclass, NULL, 0, &object);
+	nvkm_engine_unref(&_oclass.engine);
+	if (ret)
+		goto done;
 
-		index -= c;
+	ret = nvkm_object_init(object);
+	if (ret) {
+		nvkm_object_fini(object, false);
+		goto done;
 	}
 
-	return -EINVAL;
+	*pimpl = &nvkm_uchan_object_impl;
+	*ppriv = (void *)container_of(object, struct nvkm_uobj, oproxy.base);
+
+	ret = nvkm_object_link_rb(uchan->object.client, &uchan->object, _handle, object);
+	if (ret)
+		nvkm_object_fini(object, false);
+
+done:
+	if (ret)
+		nvkm_object_del(&object);
+
+	return ret;
 }
 
 static void
@@ -310,6 +358,7 @@ nvkm_uchan_impl = {
 	.del = nvkm_uchan_del,
 	.event.killed = nvkm_uchan_event_killed,
 	.ctxdma.new = nvkm_uchan_ctxdma_new,
+	.engobj.new = nvkm_uchan_engobj_new,
 };
 
 static int
@@ -356,7 +405,6 @@ nvkm_uchan = {
 	.dtor = nvkm_uchan_dtor,
 	.init = nvkm_uchan_init,
 	.fini = nvkm_uchan_fini,
-	.sclass = nvkm_uchan_sclass,
 };
 
 struct nvkm_chan *
-- 
2.41.0

