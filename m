Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A636EABA708
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AD110EBB0;
	Sat, 17 May 2025 00:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="braKTvEh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D4310EBAC
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksYg4CIx3dJY6TP1O/9waqAhx5fRHNqEnRafO5raLJiRp6+KY4YJQYkq5Oynjhtd2njWUGrpU7P/XH60MSdqLECuogbLh4ujDax/aauC6AfknFryVnkxw5WwTADrBiKPLwgtRvLiEEkFDd2YjsfQDAoBZMBHby4aknVJrVfhLqA4YknnmuPdsEORqmt0DiD7z6E18nJvXMjRqxfh2DacJBC8ZxdfTuSn/uytPO1hVSD3a5GtzAShOPA5LqmMQnV0NMCMdVARVsEHIfpJCylc2IDzLmcwJEftG1rJUVLPWJCUaJJZ++mwneb3xmVZ8eFhJHEwFilcJolS19MpnZRXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgA5U+iWwsfCExvSgUtIc8aPsarthg0tiPsuYwX6v4E=;
 b=jngh+3540QPeeC+1BUVPxCoxYVFCQMEm3nOBw79dD0yIDa/HSLDbbO08IiEvt35K7R0ag1bGVkVsCKrEUtMTKurkarcj+54E3ldsQieQPGSbTjaWKzyhv5463SO32PojOsNgf9D9YS/ardkr4dyUWne6I6VSicn8yrYBYcaTtAjLGi9/udBqJdR/SjpK657NGJKfD+lsexCwWx46OGwPt0pFCekvbKarzVXTR2quogO06iWvud+PV0jgUJxEtk3ozCMOt6M+zJH0Vmx+uaeTRQEiFFCMs482fr3xSMIA7atInheprJXwyOwh6AqLKDkaxzzAPCRfp90Og1XDxehzuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgA5U+iWwsfCExvSgUtIc8aPsarthg0tiPsuYwX6v4E=;
 b=braKTvEhoSHeMrLKuCXEPhWzoa+m+up61HzVIsXzO0j2AFIDH/f7B2H/sctZE5ddDX8Kp09l8VkaPAlhAhFX6OZrDCesJxRiGw6u5wApIaqMH/dWc2jsPTdPfe79JTuG+PqglGbcRQkVSAPNqhgDYg7hDdKLc+g6e6uosKjCJqP+K+CdvcmdsBZqy12MV+JSUgAnTYPy+EMLMNGGAk20xfzh4PZSBcRGD3uB76SToxgMuup+b2p9MR1xK7Np3ZIfwAaH3yq0AMTRBVYozcDk84JsjyiNHtk6Ib76/LnGkZ5y+W9vMfvgUOgrf404j8ClJRtz0BqA80ZvIl4V2P3OnA==
Received: from CH0PR03CA0093.namprd03.prod.outlook.com (2603:10b6:610:cd::8)
 by BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sat, 17 May
 2025 00:10:46 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::6c) by CH0PR03CA0093.outlook.office365.com
 (2603:10b6:610:cd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:10:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:31 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 15/62] drm/nouveau/gsp: add gpu hal stubs
Date: Sat, 17 May 2025 10:09:07 +1000
Message-ID: <20250517000954.35691-16-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|BL3PR12MB6595:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c91bdd3-f9b8-43b4-833c-08dd94d7457f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?naf4pzr3nxGxDs9N6FEkRzdqlQH0nYuzhlPVewtMH5MI0MBTv4wrbNd7BrKD?=
 =?us-ascii?Q?+iFhk7jT+kB8i+mCC8K864j2LjzGq37wQXRNoMTc0ZKdIjAs3HDYiAkIMPp6?=
 =?us-ascii?Q?PDmXYJYXXG21Z6j2OH+CP7R6o6y+iQ06gRykLNBBE+Ipcu8W30SZri6qt6ay?=
 =?us-ascii?Q?NVTyN4f1fHrGjrz0by3qC1WoKMrFHFPQVD43TyAAWIoKVs0zDJXx/lwgf3Vm?=
 =?us-ascii?Q?DC5DQsKcTjWhouw9vGAVp++qmstCRsdmLmk1VV1At1bqyie12XYuIk+YHtgT?=
 =?us-ascii?Q?tH1FY2/fZcZJFpexvA7cIuBaNw8dacFAa0tD2ykZmkiW+KJU8IFWqBCS0Gxm?=
 =?us-ascii?Q?fYRT14sZsBdWfNtzBMnUGL3hGpej8dOa11jFVYklb20x32iXUA2YxStnGTgr?=
 =?us-ascii?Q?zEZAfCINr5FGJ1ZgezAiGWJ+TzoBe+D5sWoQerQgVPhlSqtvJwUe12vacxUN?=
 =?us-ascii?Q?yOLD5aOgMKA3PQshF5xCl60cuWzlxT2svxxA3IgL3IJlN3h87WnzBKFzvgeB?=
 =?us-ascii?Q?DUJGJXqQxf0bpIkWhJihHecN/nhYRuPT06vWD2hSBnOXwaHIMsuMZ2A4KbUN?=
 =?us-ascii?Q?H2lG+2TzUpKE0Gt2SGqxg9L8fGJZlYG0hEdJqnrN2l3jFq6GYvxvn7l0zUUG?=
 =?us-ascii?Q?0k7snxPCm+bfBNcmWMF5YCnkpBPoX4i7H7yYXYf6a+QERMqddnelXKKkBMMh?=
 =?us-ascii?Q?5xzIMirPiuIhPyDJtZ9xD/SQiwr/JR7K9WCeDb7IJXPFv9vUg7C4Qrq+tGJn?=
 =?us-ascii?Q?dWXBs/ZShTLMw33wiS++StwLLE8cZzKnokTCICl2UBop1T7wknUWw0O287T4?=
 =?us-ascii?Q?KXRx6OK+cUDxQXKRWNPZsQCiUF2z0qxOCHM0XItqZiMmNR2SrqzdGhmOQCS5?=
 =?us-ascii?Q?1BhYKqFF9xlFfXnm2dGpMLIY2yFrTWmS1bnWcuNCjCsBbIURCEpunFk9XeZm?=
 =?us-ascii?Q?AWpLDpHnJoHlSDYSMnCC2vACibgFn5ezcw3lKH1Xzw6BbFnb4YJ4XiotZ8vR?=
 =?us-ascii?Q?PgAwg/e6uzFXfYDJsUGHo5gR0K3YVO5Tourt9B06f0GZJUsSbe9o4CoB0gIC?=
 =?us-ascii?Q?WYf4KyiPLGvFi2v/5ygobl+KAeBzlcUAjo2X10osdTK1zrIDZxeusevhRGdj?=
 =?us-ascii?Q?IYer/wRnNxEOjvuScPBkBaAGPOWWqAOgxTkqtnjLfo9wAejzwfZDs91BC6El?=
 =?us-ascii?Q?0EgyfsEmBhniVKvi4fCMqkUcuqq8u7cVOwA7xnrfLGCKOCPJRFvBozOrqOp7?=
 =?us-ascii?Q?F+LALAkTkEMbNZMy4z5+odUQRckA6SyPK4GRNLeEejJQSHTsA25rys4wolo0?=
 =?us-ascii?Q?mzG3Jht0cyv++vC1lwKDU0gQmI9GMrJ0txi6H0GVGNauf9b/ehbw75Bf+b2M?=
 =?us-ascii?Q?xpj3VUI8Tko7BX97MbIQhjgOSNeRqV4h2qRRzMGQ7o73BsAuoDDDktbbQMp1?=
 =?us-ascii?Q?MPUoYRNn87TKg5/kLLTl/z3Amk6wCuoQRusIh8lpijDGF7ceNdXO32LAcstY?=
 =?us-ascii?Q?39Lxdc4ZrjYMeSQ//FKOicFcKwsgwa3H2ZH1?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:45.9831 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c91bdd3-f9b8-43b4-833c-08dd94d7457f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
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

With GSP-RM handling the majority of the HW programming, NVKM's usual
HALs are more elaborate than necessary, resulting in a fair amount of
duplicated boilerplate.

Adds 'nvkm_rm_gpu' which serves to provide GPU-specific constants and
functions in a more streamlined manner.

This is initially used in subsequent commits to store engine class IDs,
and replace the per-engine/engobj boilerplate with common code for all
GSP-RM supported engines - and is further extended when adding GH100,
GB10x and GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h    |  6 ++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c   | 12 +++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h   |  7 +++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild    |  5 +++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c   |  9 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c   |  9 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c   |  9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h | 16 ++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c    |  5 -----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c | 14 ++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h  | 13 ++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c   |  9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c  |  6 +++---
 17 files changed, 114 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 3fd279be8340..eeaf72f6add3 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -209,9 +209,7 @@ struct nvkm_gsp {
 		u8 tpcs;
 	} gr;
 
-	const struct nvkm_gsp_rm {
-		const struct nvkm_rm_api *api;
-	} *rm;
+	struct nvkm_rm *rm;
 
 	struct {
 		struct mutex mutex;
@@ -467,7 +465,7 @@ static inline int
 nvkm_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
 			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
 {
-	const struct nvkm_gsp_rm *rm = device->object.client->gsp->rm;
+	struct nvkm_rm *rm = device->object.client->gsp->rm;
 
 	return rm->api->device->event.ctor(device, handle, id, func, event);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index ea2821e7a54e..d7933bfc59fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -22,7 +22,7 @@
 #include "priv.h"
 
 static const struct nvkm_gsp_func
-ad102_gsp_r535_113_01 = {
+ad102_gsp = {
 	.flcn = &ga102_gsp_flcn,
 	.fwsec = &ga102_gsp_fwsec,
 
@@ -40,12 +40,12 @@ ad102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ad10x_gpu,
 };
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
-	{ 0, tu102_gsp_load, &ad102_gsp_r535_113_01, "535.113.01", true },
+	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01", true },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index 78f2a15f0d42..0f8526aa969f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -102,6 +102,7 @@ nvkm_gsp_dtor(struct nvkm_subdev *subdev)
 		gsp->func->dtor(gsp);
 
 	nvkm_falcon_dtor(&gsp->falcon);
+	kfree(gsp->rm);
 	return gsp;
 }
 
@@ -139,7 +140,16 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 		return PTR_ERR(fwif);
 
 	gsp->func = fwif->func;
-	gsp->rm = gsp->func->rm;
+
+	if (fwif->rm) {
+		gsp->rm = kzalloc(sizeof(*gsp->rm), GFP_KERNEL);
+		if (!gsp->rm)
+			return -ENOMEM;
+
+		gsp->rm->device = device;
+		gsp->rm->gpu = fwif->func->rm.gpu;
+		gsp->rm->api = fwif->rm->api;
+	}
 
 	return nvkm_falcon_ctor(gsp->func->flcn, &gsp->subdev, gsp->subdev.name, 0x110000,
 				&gsp->falcon);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index d9cdec4810b4..77e3501296c9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -39,7 +39,7 @@ ga100_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-ga100_gsp_r535_113_01 = {
+ga100_gsp = {
 	.flcn = &ga100_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -56,12 +56,12 @@ ga100_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ga100_gpu,
 };
 
 static struct nvkm_gsp_fwif
 ga100_gsps[] = {
-	{  0, tu102_gsp_load, &ga100_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga100_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 7b8db70f3cb3..709a046d86bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -150,7 +150,7 @@ ga102_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-ga102_gsp_r535_113_01 = {
+ga102_gsp_r535 = {
 	.flcn = &ga102_gsp_flcn,
 	.fwsec = &ga102_gsp_fwsec,
 
@@ -168,7 +168,7 @@ ga102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ga1xx_gpu,
 };
 
 static const struct nvkm_gsp_func
@@ -178,7 +178,7 @@ ga102_gsp = {
 
 static struct nvkm_gsp_fwif
 ga102_gsps[] = {
-	{  0, tu102_gsp_load, &ga102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga102_gsp_r535, &r535_rm_ga102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &ga102_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index e6f0e865848a..de274f6426c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_GSP_PRIV_H__
 #define __NVKM_GSP_PRIV_H__
 #include <subdev/gsp.h>
+#include <rm/gpu.h>
 enum nvkm_acr_lsf_id;
 
 int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
@@ -11,6 +12,7 @@ struct nvkm_gsp_fwif {
 	int version;
 	int (*load)(struct nvkm_gsp *, int ver, const struct nvkm_gsp_fwif *);
 	const struct nvkm_gsp_func *func;
+	const struct nvkm_rm_impl *rm;
 	const char *ver;
 	bool enable;
 };
@@ -51,7 +53,9 @@ struct nvkm_gsp_func {
 	int (*fini)(struct nvkm_gsp *, bool suspend);
 	int (*reset)(struct nvkm_gsp *);
 
-	const struct nvkm_gsp_rm *rm;
+	struct {
+		const struct nvkm_rm_gpu *gpu;
+	} rm;
 };
 
 extern const struct nvkm_falcon_func tu102_gsp_flcn;
@@ -73,7 +77,6 @@ void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
-extern const struct nvkm_gsp_rm r535_gsp_rm;
 int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index 1c07740215ec..841b690c0c0a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -2,4 +2,9 @@
 #
 # Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
 
+nvkm-y += nvkm/subdev/gsp/rm/tu1xx.o
+nvkm-y += nvkm/subdev/gsp/rm/ga100.o
+nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
+nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
+
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
new file mode 100644
index 000000000000..1e519bf166dd
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ad10x_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
new file mode 100644
index 000000000000..b10e6ff9e9b6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ga100_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
new file mode 100644
index 000000000000..725ccb2c27dc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ga1xx_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
new file mode 100644
index 000000000000..32d87ce2b77d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_GPU_H__
+#define __NVKM_RM_GPU_H__
+#include "rm.h"
+
+struct nvkm_rm_gpu {
+};
+
+extern const struct nvkm_rm_gpu tu1xx_gpu;
+extern const struct nvkm_rm_gpu ga100_gpu;
+extern const struct nvkm_rm_gpu ga1xx_gpu;
+extern const struct nvkm_rm_gpu ad10x_gpu;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 48af5d8d22e8..8ca0f99ccbac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -44,11 +44,6 @@
 
 extern struct dentry *nouveau_debugfs_root;
 
-const struct nvkm_gsp_rm
-r535_gsp_rm = {
-	.api = &r535_rm,
-};
-
 static void
 r535_gsp_msgq_work(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 39cc3d0c740c..3c17b75b5e37 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -4,11 +4,21 @@
  */
 #include <rm/rm.h>
 
-const struct nvkm_rm_api
-r535_rm = {
+static const struct nvkm_rm_api
+r535_api = {
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
 };
+
+const struct nvkm_rm_impl
+r535_rm_tu102 = {
+	.api = &r535_api,
+};
+
+const struct nvkm_rm_impl
+r535_rm_ga102 = {
+	.api = &r535_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 20841305fa55..41d4ed70fc10 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,16 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 
+struct nvkm_rm_impl {
+	const struct nvkm_rm_api *api;
+};
+
+struct nvkm_rm {
+	struct nvkm_device *device;
+	const struct nvkm_rm_gpu *gpu;
+	const struct nvkm_rm_api *api;
+};
+
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
@@ -45,7 +55,8 @@ struct nvkm_rm_api {
 	} *device;
 };
 
-extern const struct nvkm_rm_api r535_rm;
+extern const struct nvkm_rm_impl r535_rm_tu102;
+extern const struct nvkm_rm_impl r535_rm_ga102;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
new file mode 100644
index 000000000000..d455a4f19854
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+tu1xx_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 451d3e588d26..fef9c4444017 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -268,7 +268,7 @@ tu102_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-tu102_gsp_r535_113_01 = {
+tu102_gsp = {
 	.flcn = &tu102_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -285,7 +285,7 @@ tu102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &tu1xx_gpu,
 };
 
 static int
@@ -336,7 +336,7 @@ tu102_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 
 static struct nvkm_gsp_fwif
 tu102_gsps[] = {
-	{  0, tu102_gsp_load, &tu102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu102_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 1bc806a18010..5f279813626f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -22,7 +22,7 @@
 #include "priv.h"
 
 static const struct nvkm_gsp_func
-tu116_gsp_r535_113_01 = {
+tu116_gsp = {
 	.flcn = &tu102_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -39,12 +39,12 @@ tu116_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &tu1xx_gpu,
 };
 
 static struct nvkm_gsp_fwif
 tu116_gsps[] = {
-	{  0, tu102_gsp_load, &tu116_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu116_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
-- 
2.49.0

