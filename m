Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A08D1207
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C293D10FE2D;
	Tue, 28 May 2024 02:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RHUQ+pio";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92B810FE29
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODa/alwph5TtIkoDXjX2mrVly7zsWTFLCL70Xu3vrIPPdsm5RERZ+CADlIzF0dnp45xmz5P8fz3YnPV2qyrVP7E+bN0tYNt++lkC0elpvwzzBLjmvhYA+PIDJXV4AzNSRadax3Z+ks2WbXUaICuHhA43COz+5Yhal5xXUf/fGjrQ37+NcZK1zfcZ3YRN6iHhSd6ta0E2EOXCNv+TEkxuTUyMZGnS7u7gCNIx1dSF7J7w6GTMEIunBUhUhP/KWFM8nZoTsJ7n41HRVL/Kybt1PQrFYuj6w5nPJcnUkuoxJ8aIzBPeUYbbHgPd0J0X5dFs2zu50E2suFkmCRwpAybTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaUCc79O7PDYsXFlcgZqCASzqv6lnYANN+Efdc+/+LI=;
 b=ZtsripV5MJqNPGIjrG+DxKX2FMLIjKJJXv9rdANnAbSKqNcHr2vvreW6AzIgw6Yn63fPVSoGuOS0uAJFwIfkI16s+2eZIDpUGMUz4z6q07wsU1+W5Dgact0vCHQQT7+PNIFgNRQaYiQjnvK9EeqwGJkyYkH/humu2TZ3rWRLPwQ/VUB3+OeCuGJ4oGNZKRJFb2NoXd5QMknHyOsoSVZ0czXsgjQ1boOGOz1x2h4vAY4fsFU7TvlRLwzMfktYhg1Y3xNPnknO0IkvIOd97hPUSkaw/+qhGOnE3vHBwy965LJQw4wtD+UwikFmWzHrbnEsnpCXB2ejSN4CnxQF8otJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaUCc79O7PDYsXFlcgZqCASzqv6lnYANN+Efdc+/+LI=;
 b=RHUQ+pioTjSimj1X3iLh2b8ip47/Xl/ox3DjdUkRFjvOD+b2Vhrhi+F4jbrq67iJnDX/iqESs4cJVp/zWLf1f0UjBEiz3IK7S0v0lrXAxJzLX6SBctLQs3HjfyszTC7BPwt2aFC0yjj2qR9ryUH4qKrPcJAaZ+SwoEfJv9cYUTRL27gPOAaORl3Md70qIAsJVKYbhwdICdTCHacTcs4QYUAa8uk6+7LHUDfKkj8Gs96gGbjFyB819l5UhLp7DMzOsfeGmBwbH6pzzpA29qk7LF8a9W+SdhjU08d7ajGC9gaZIPGoSZLW2ml/agdA475OYsqHrauXJyYuu2waeK5tLQ==
Received: from SN7P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::26)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:44 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::21) by SN7P222CA0012.outlook.office365.com
 (2603:10b6:806:124::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:43 +0000
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
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:28 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:27 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 27/34] drm/nouveau: pass drm to nv50_dmac_create(),
 rather than device+disp
Date: Tue, 28 May 2024 00:19:52 +1000
Message-ID: <20240527141959.59193-28-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 02e16996-a1bb-4e8e-4a1d-08dc7ebd3253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|82310400017|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VGBOXkI9d3nudfZ2/KHMrOfLWb/OFGGtET3bavi7uWH1UVtH6bTNF7f5Tvl1?=
 =?us-ascii?Q?lqRg5QE/xJq52jK+400aYnCw1Zzq0aC2N7kWqkods2qdO6+r9e9kmr8U9d2I?=
 =?us-ascii?Q?xlruhCivWmTA5rKUEEiEW0A9ufisP/fBqnDAOd5QFRePchQYwiAVELbDHPuI?=
 =?us-ascii?Q?+LXTf4Q6PKSgxAGgjQfuhokI7gmT6ATB/9TAW6eTCtpGlYLdQ7f5cTyPpH+i?=
 =?us-ascii?Q?34MfZIgSKQggKXeHjQPpV+/VPMfVkk7jAaQI+xh/5vfrBImmbGGQanucXmsc?=
 =?us-ascii?Q?66UCOYA442DxgbH3/RZgT7/SG+VdaKpZVZHUQREwlMykYrmu7BULM3icuNfd?=
 =?us-ascii?Q?7OS6qZ0QBRSyy5pkLIKa82JqEyXMpcgvRXp2nTpSJRmCdxsAtzZMURRXpXS/?=
 =?us-ascii?Q?Ga4HDX2GFFOWWkDPo2BUjKjbv5181dBD/T2lZBIRvCciuq+CEonnjRJlyUqD?=
 =?us-ascii?Q?f1niOD3DXQTle2G2NQHYWmcAPPPiGDVmvYsOWgh93W+kT+t1g4lBfrkpLoLv?=
 =?us-ascii?Q?z43Lqa6ISiuxMuNfh5MDHj//bMyoiRa9HtNlJMeDNBGfQhh/EgpuNg7legKV?=
 =?us-ascii?Q?l831Fhs29NyASI2ZWyokvFijzI8RfJFKB6XdSYHtEhrkWlGuqPjlqkO0XygK?=
 =?us-ascii?Q?9PjCt+gXac4KbPFgMoz3ldm/3NpcVxNEu5B9xdBC1+fau3BFA7Urv8We15qn?=
 =?us-ascii?Q?CiytyVlSoiWxHA1J+8l02c9LWzqzr0aYc4k0RGye82+A3dom0OvIxPcK4URq?=
 =?us-ascii?Q?K1fiiqsJr/mjeCJ4XLqfkvWzwzGbmINAwxqHtv2YgHm2PZJVg536W+SK+Svj?=
 =?us-ascii?Q?hkngwyLNGRiqqBa6YwLPek6HsrmdYQ5QAv3j7C5KvDcej89VgULGJ8TzXkFA?=
 =?us-ascii?Q?bddoHWTUJdAN2nSK3luQzcCezxLloSPfZzab7YuzcHVQbhvUiMrMdUCmG/8R?=
 =?us-ascii?Q?tFWyIt220VOwZ5WnIgcxj4Yg5/uy/6HPADKuOGqt9gChPJ14CIKKQq//J7yJ?=
 =?us-ascii?Q?edN2nB9IM16Ky+9gRjfAJHhVzTbf0RlWq3nTqdmNEQHiTcRQSkyyQp8fee43?=
 =?us-ascii?Q?bYvyF3Jqs7rWCmc1k2XJBKQisEU2tqMzgpsXi0J1ZffKytjwHaajikxOt+cX?=
 =?us-ascii?Q?3jtWpZvTR+BbxgUuXyevn9h/R3ADHUpCsJFm2mVpnZgPDpYYWezgBA5RNZIq?=
 =?us-ascii?Q?h1kzVN0y/SPDzePoie0Tl1HCTjxERTSvGMWnjfLG4aYSC2YSnBudGHqVvSkN?=
 =?us-ascii?Q?eEUi1oomUlo9O108AF8jXLQ7lquQqMR03yp6OfJnXpqEOh6NHRaQjM+srUVx?=
 =?us-ascii?Q?VBQBR+4IOgZGY3FohluoDHqMCme4ja2DRSFApEVAVBAGcYTpTtYKVRbYq/wU?=
 =?us-ascii?Q?iVRi9GRFeqZdVONY2vdtbNNokcG9?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:43.6443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e16996-a1bb-4e8e-4a1d-08dc7ebd3253
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080
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
index 175d692088b4..796f9c423259 100644
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
2.44.0

