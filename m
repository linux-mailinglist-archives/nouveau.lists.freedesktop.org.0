Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4951292AD63
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D973A10E46D;
	Tue,  9 Jul 2024 00:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JeIsRYyI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D210E450
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWrUKOiEW6EQovdUAqeOPCFfIZVYGo9WhEkmztyvp8cwOtJil5VTb4/wGrsNVCH8Xf8KX4Rf6b6hfS51xgAI0+K9HIJdLQTfcQ4SjYoBrGH+Ao5Bf603R+SuF/c4MP1xoKiKEHnT5MF5cL/mLmFYn1csQazrrWXl9Qmy2I+ISeH6ExKHdTuFYxRv79wSZDbpy4/OOSZA/Ir3FfI5oC5u49YIkMcu5+Za2WRILCR7U5YePartr8/0EETy31Dhij1yOJO6jBH3VM9Hp6ZKLBP+RVRoE3Imbfa7m7MosK8d/lsHWkt2MduHmHbAUxVvdqqMt55pctcW45V+biP2Z3fqCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0IlDpDhAVO0NwDssxAddT0uN9C/3PRRK6a7R11O1ns=;
 b=Pnx6gV3cmiTxXnemo4Yjk1DCKxPqOXQ06/0off/yeEQu/6o+oCKi5g4Gvq9LLk4F0bUDlzUot4u5kkAl1N2grwqefi9XOvJVJGNTQDaQwmcOxSbhHtyl2aO8kBmJw5M/7Yra1TxmoBh6cJnuEl1lSENb9b5XBb5Vy3v9qOaI5uNlkDilnccbMcetC7/HQ3lZ/ucWFruokvbNj28iBkJb/Peeva2IvStxpj1PLqBli5lja4bJXscBlA69lp0J9YPxi+3XtXpDMK7WCgnWWkLc5LGwTtlVUWmhEJDyYtJNPSHFhCA3S5uVewzi3165JJ8vD5S93+H4KpwLitVN5mT+ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0IlDpDhAVO0NwDssxAddT0uN9C/3PRRK6a7R11O1ns=;
 b=JeIsRYyIAKGrG++JPSF+rAD3lNCc6jGDv+L/Mn/bHGFaQ+R2tlMAWbsDoDvDFKvEPtvI5wRSoPdDzEeuGOPTNo+HMVDojDMcG6nMHZzjY8ZtEvc3pr77YwVo/Prasa9qfGKcfH5uul6sgY7mcJfUhre65YRiRPQDHpUUyr8RA6oKHZQlio0T8DLZRTvCZrCMfyICU0RrqoZLNmUU3Ig7pWpqZWtLGvRbk8jGSlO2Ml1pZKUDv8Z2XQ/SSv4ISYSoGm576noOWGPfEMtzAdUNYwywaBd58pIusU5xVigpUkfBVJwqM3sIbKmRCcTBjbeMKDvRDted1vpEy1VSlF8oIA==
Received: from CH2PR14CA0017.namprd14.prod.outlook.com (2603:10b6:610:60::27)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:39 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::1a) by CH2PR14CA0017.outlook.office365.com
 (2603:10b6:610:60::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:39 +0000
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
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:27 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 30/37] drm/nouveau: pass drm to nv50_dmac_create(),
 rather than device+disp
Date: Fri, 5 Jul 2024 04:37:14 +1000
Message-ID: <20240704183721.25778-31-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|CH2PR12MB4327:EE_
X-MS-Office365-Filtering-Correlation-Id: f047d922-f700-4352-812b-08dc9fb1d9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nTo2CHd0Pbu68hmWQXCxG0aw8jtiAZsvmYJmDz6UAd1kyMs/+BlRaZUg2K0l?=
 =?us-ascii?Q?TnfIJ5fTdIkkxmL2uMLm6kek6ikP8AhqZmYF2o9IMskxcTO+zn0VP5qZ1c1j?=
 =?us-ascii?Q?VNTr+ZorT7xh7PWyJ8QDiSSzH4xoA88jFD4koAh4bsKaQjP8Ug2k6rhQroPR?=
 =?us-ascii?Q?hWhzD1fNMgRZFui3QrBbxJ+UpEINbA5aRoRLAVrrS4H00iDVEyjDyR94s/rp?=
 =?us-ascii?Q?lzruUqle5tTsjgUMw92bxKoQUJ8jfVESLrVGaoOWadcJQi+lMzdW9TOOyg3L?=
 =?us-ascii?Q?frtZkCRW3o/dM392l97YB511QJhwJ6TC+1fpI4xqhkuoBdP8mz/HJ2Oolhze?=
 =?us-ascii?Q?07kjy778QgwA2sf0hWoRNR4Jc874TAVR8T+frgEMrnXRPOotUzoS3IJnScRJ?=
 =?us-ascii?Q?NRnbNj/00kpCe/s7CZVqhPiV5hzHdghyHJTtmW3EiFKbcyyQILdsq6+jq77v?=
 =?us-ascii?Q?CIurKgWtogG5Wtg5EyDdEZFjnh3OKtEiQsNzD2vEvcr34XZiP0tgTvolBOGT?=
 =?us-ascii?Q?Hy0kFDN1D9bgl0uJYMi2J5UWXMho1vn0DWHJZT2DATBcRoVNLtE52nmN/Us1?=
 =?us-ascii?Q?WYfWpZOgLqoVwWWKQTQ8gwXufa6EyTLMj/Rh3O/GtbbKgpjoU6ZshdMIv8LO?=
 =?us-ascii?Q?lxWVn5YkkNER9Jp9LhAt/9la8ux6QTPTsSYdBoRqJEZ1KO0OQ38l3SqjqWGu?=
 =?us-ascii?Q?vYqOUzmE2Wyg2zvh3mWPoKLEZU5OPjcQcYnbeoGC0OpBPc5XH7Hu0bPGbbOs?=
 =?us-ascii?Q?/iySgOJr+k2RZHqTdNUl1DJS2F7u2FKby5PycLLz9y3oLKHINSsAHOtHD85n?=
 =?us-ascii?Q?UFmewUpy+jzPqykAGJACQD78OoAR+50JbPatHa5lCdN3lziH4HhgrrZFLi34?=
 =?us-ascii?Q?3cpkFkkAsk1ojta7Y01ZjuDFuUA72FfW7r4BhTcllSpbnz8YMHWVn5Tm2nGE?=
 =?us-ascii?Q?a93FAw/fKSAfjCqUeYj6tVosi00/TRFp2hAwjiGtJxqwQSubRokz+nbzLQAB?=
 =?us-ascii?Q?fY6o4A3uOE7IVIoMlKflmYHzS9ylFE1BL8YpErsAGgdBw6wOUnQ8Ou/thtkO?=
 =?us-ascii?Q?fp7Hhmw3dLyUzdhbcf0hykt7onsbCDNWjerELXG7RzPaANrPlng9ZHijkoIN?=
 =?us-ascii?Q?84IePAMolNA7PKpRyOH+089lEVMTna2UVsCX4ROi55ZRrWAHGytx7uXTkscX?=
 =?us-ascii?Q?TaKwSYxnN7eLoJh1K/4jRe88vjzGzrfJM+hyPoHqLuW8zjSMbQsgOT92eBn3?=
 =?us-ascii?Q?6us2XHP0s/Lz9Qe2emVgV3C2ivD3j2ZC4hA8flaIiX4scQg6Y5bJxExeGOfB?=
 =?us-ascii?Q?uznfwe/VDthzFhGOG/lo9akygLFSY76JCYX1jfec48eXHKdrXtbify2Cu6bM?=
 =?us-ascii?Q?pKzXhTiL78AkUs7Bmj2BO5bwaUmMMr7YLaEy5sbkEHwQrcYxYPxXkfIEoRwO?=
 =?us-ascii?Q?OdND3uT03Lbq7otCLKzk4ylHeyCy4vGO?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:38.8461 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f047d922-f700-4352-812b-08dc9fb1d9bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
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

Both of these are stored in nouveau_drm already.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
 drivers/gpu/drm/nouveau/dispnv50/disp.h     | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c | 2 +-
 7 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 70c62b861276..e36a473f2075 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -307,7 +307,6 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nvif_disp_chan_v0 args = {
 		.id = head,
 	};
-	struct nouveau_display *disp = nouveau_display(drm->dev);
 	struct nv50_disp *disp50 = nv50_disp(drm->dev);
 	struct nv50_wndw *wndw;
 	int ret;
@@ -318,7 +317,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp.object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, head, &args, sizeof(args),
 			       disp50->sync->offset, &wndw->wndw);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e5bb5ca950c8..85845e3dc7ba 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -166,7 +166,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 		return -ENOMEM;
 	core->func = func;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
 			       disp->sync->offset, &core->chan);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 80803346b620..deed18876c7d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -229,11 +229,12 @@ static int nv50_dmac_vram_pushbuf = -1;
 module_param_named(kms_vram_pushbuf, nv50_dmac_vram_pushbuf, int, 0400);
 
 int
-nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
+nv50_dmac_create(struct nouveau_drm *drm,
 		 const s32 *oclass, u8 head, void *data, u32 size, s64 syncbuf,
 		 struct nv50_dmac *dmac)
 {
-	struct nouveau_cli *cli = (void *)device->object.client;
+	struct nvif_device *device = &drm->device;
+	struct nvif_object *disp = &drm->display->disp.object;
 	struct nvif_disp_chan_v0 *args = data;
 	u8 type = NVIF_MEM_COHERENT;
 	int ret;
@@ -253,8 +254,7 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	    (nv50_dmac_vram_pushbuf < 0 && device->info.family == NV_DEVICE_INFO_V0_PASCAL))
 		type |= NVIF_MEM_VRAM;
 
-	ret = nvif_mem_ctor_map(&cli->mmu, "kmsChanPush", type, 0x1000,
-				&dmac->_push.mem);
+	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000, &dmac->_push.mem);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 5508a7cfd492..da3add95f354 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -95,7 +95,7 @@ struct nv50_outp_atom {
 	} set, clr;
 };
 
-int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
+int nv50_dmac_create(struct nouveau_drm *,
 		     const s32 *oclass, u8 head, void *data, u32 size,
 		     s64 syncbuf, struct nv50_dmac *dmac);
 void nv50_dmac_destroy(struct nv50_dmac *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 797c1e4e0eaa..73fcfb27c32c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -159,7 +159,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
 			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index ee76b091d4ef..8cb5b79bacbf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
@@ -71,10 +71,9 @@ wimmc37b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	struct nvif_disp_chan_v0 args = {
 		.id = wndw->id,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
 	int ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args), -1,
 			       &wndw->wimm);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index b3deea5aca58..caf40977f455 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -363,7 +363,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
 			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
-- 
2.45.1

