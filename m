Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933CAB2B51
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5E410E0FB;
	Sun, 11 May 2025 21:08:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IE9emU5t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14FD10E0DE
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P5LfZuMtd47Fu4K9vVWxSAP3hut8rU1yWQ7oZ0kNc3nwle7qS3xoNehhunpfSN21L2+ilVwpLtriv+EnZP2rwdcGGKakD17Vwpj2F/1xok0PNQt/EkZQ913tzGCowIrlo8FNbTXzJrinjqDlAiEtgFfPnoX3kvLtCtK0E1K3Ll4kloAkJI4FdHLsj7NckNqciskDuMcaQlFxaTz5xvp2FbgG98qeK6tsnycT8XighLJsW4nEW3j3Woh6ZmOc7zic20n2uXoXCNNzj9cQ7mFm98hRwnR6RcPCPA7BPyR9LSPSZJf1U/kG/J2hVGop+RhREZGkiJs57vG/Hfgjjcd+fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRqPftHlXl6YkO8VSFG+9BP9/2VUvz8H21PvJywXw2g=;
 b=NFrbkdG/QApbPiWpO8AAjiE+Szzb7EsOJ2DQpieRCpyop2B6+eDUIrQTOljogFnb2nduTRyif6ZHi7M2BZ+dgq1B25Ntv7taXveJFFw3vtKQ9uJx/fIAvAVufJeXXBzvNpF17SuY969j5TzFqaDbHE1ZAiqA7zGkloD7B7H0Y60gqnFVEAMtg7Y6gl5hjQAsTRunzWTAfiLdMvHwhiaxgDTvMCG5BPRIBryJVssU15OBNKzNuKfaV1lmTz21xuf0J6laLwvTkIkeVfXUrtDipZRhCR9BszTvMMAmW01gK9o9olM92eaP/vHnSQR+LBfGRpVfdzOiIdR0mCt9VT8jBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRqPftHlXl6YkO8VSFG+9BP9/2VUvz8H21PvJywXw2g=;
 b=IE9emU5tRKMgII/qgOpIsbPyvb3bLQBpELp5DhfgGH/HmAJt90LMiO3CVRdtiKV51c7b/VecRn+nt2/HHco5DpzdDA8abnrhHpyXtQjPcCwh85tcZ4+vbiftuE8NZS8ZyOd/JrWZXmgRb8OA2mEk/27gLZY2T+v5rrCakA5/8kKOSHU2hD8WUUnEMybDI8jUBhMa9kY8RDfJr/Y17qXZcTMo+hrQcegxWBJPXyHnUzUN3SqretY14LIQmXtqGV9kZlzqUW2stVzyBcnvaLw8cVM9uGJzXEOLX6wYvW3w0CUnDFPvdcYS2ptu7XqRe16Fr3Kcd7LZfi0woAtATXrRaw==
Received: from DS0PR17CA0012.namprd17.prod.outlook.com (2603:10b6:8:191::20)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:08:23 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::96) by DS0PR17CA0012.outlook.office365.com
 (2603:10b6:8:191::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Sun,
 11 May 2025 21:08:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:19 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 11/62] drm/nouveau/gsp: move booter handling to
 GPU-specific code
Date: Mon, 12 May 2025 07:06:31 +1000
Message-ID: <20250511210722.80350-12-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de460ca-9d4e-40e9-4ca1-08dd90cff6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/+mB53N6dJKkD/z6CVPBWk1WF6jb0GnI8K5jUAHIu9NsMEvc0slR07AVJIXm?=
 =?us-ascii?Q?KS5SaLkZySqAZU4GvZhy7VUBeSME1XwKDcjU2gn3PMSwgANcS1XRGMEIWopx?=
 =?us-ascii?Q?JAfM6gkt3fV+RbTNUYDIbRe8tOIwjy/MvGAQqzH1rFiVaKoNMK3/JqO9GJqk?=
 =?us-ascii?Q?LZTYDAPiHQO0y7oVlO27hR/DG+CaKpaoAWMUQglckXGTUtSprSJgkl0xbfkC?=
 =?us-ascii?Q?EdgxBQB6RqB9qOaSeht4KXeaE3YZYjCNnNfv0wm7dZCaGKgzyxTc7VWiA3Jx?=
 =?us-ascii?Q?PnVTA33d3J1D0EXbGhl8yYy7UI7/Y6+arMjJHLEWpoEgNM7TMzJ8fAg1SLse?=
 =?us-ascii?Q?15tdKpu+JBRxHdTsDM1xvLxXDgXuWlsbmxWDRVcAYuX/98an8iIoG4V0atca?=
 =?us-ascii?Q?A9Jfy+0ec4Zr5Cy1PsHtSTBBNexhPzYj7iRPm6ClfkJX/Xq7G079fiwnHw7l?=
 =?us-ascii?Q?BgmI3U+6oAn2ogeCzojXhblh6dJZopxTd7hyYX8hWiGh9nSwsMI0fQ7E4ZrA?=
 =?us-ascii?Q?dwL3G1V/i1Ft2DTvSvp+WNhUxt5NLxbNZbs3kBgaBE3KCfK7hQYE43rrMpxd?=
 =?us-ascii?Q?FXxccbroNHfWgEIwQ1+a3Hnf+WpOLMi87R5umzToXY1gJdoofeLw6Vye/wsE?=
 =?us-ascii?Q?HtQCkAaGlSe4thIJOdq5PgQn6KwDtPUAyYB69UXgPL/h3ZYd5ov166vMjp6u?=
 =?us-ascii?Q?07H29RJdn1jsvG+M3IHB6/epPknC3QKyQjUKl5cVCWn1J2lIDwH5Lle6yUEG?=
 =?us-ascii?Q?fcfKe5mR6zrNn8qAB+7WHpJm4rXals4gXPa+YA0yM4NBCh9eAUjlQA+a50e+?=
 =?us-ascii?Q?3Qqh794Sw5oKzde3qXrTVmWeBwm2fRcj3T+74U3gWqncBF2xnXelq7AejeA9?=
 =?us-ascii?Q?IZdipjx1PQ5N1SL1fzfY23KVdv/2YOlyd2l8RK1rydXg+oow9IrMh4CEzTbZ?=
 =?us-ascii?Q?df7RJS2U2YYoDOU4x7qDjfig5nMS8yZ2ZTz3KG18PZMkbM6w8YoWzcpckJmI?=
 =?us-ascii?Q?TmqTtdXU71KG2E/5xuHHAX6c8EiQP6ybLBl8UqELPf3nx5mI1QtRuI7bH1Ab?=
 =?us-ascii?Q?/1v7wHNZ0W/rFtYygKrFPPhPSO2J0I9c1ZIHaMqagj9AqE0E9THBrW+De0wn?=
 =?us-ascii?Q?xydQivsVb5uqDOKSIZZP8GBfUzYxV6OMUcWyifYiF7fDULU3xZSGXYQX7KzN?=
 =?us-ascii?Q?sT6HkQ/EqHg4ltoFgwHEUcteIFyvKc8+GiUyCCqy5EIcJighHcuDVxAgfWCd?=
 =?us-ascii?Q?tNL9njtbP4QcqHyqXYfnIr0QJd494x2kegLnOjf2e3NUtwSZ9UlBXg/jlLMw?=
 =?us-ascii?Q?GFtQ12vzteav8uOInO2zA2ha9z6DTh/aFPxZ82T7wQfcQrieXgxsIv/qrxkG?=
 =?us-ascii?Q?pIa/9OZSXJ8jlSKqGu9f4/TviPv81ZYZoNLiyAS8AHQQYWvC5tn9WzvtfWz5?=
 =?us-ascii?Q?rru2Aes+bgXQ7X6M9JV2Vffn8jGR/kut0sCnjDPfF7pz/Z0S33UolPJ2o+zb?=
 =?us-ascii?Q?OKTRHREWxxKYMzjcoU4EOBF5DyLQ223GHGRa?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:22.9523 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de460ca-9d4e-40e9-4ca1-08dd90cff6e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577
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

GH100/GBxxx have significant changes to the GSP-RM boot process.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |   2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c   |   4 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |   3 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |  94 +--------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c   | 113 +++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c   |   4 +-
 8 files changed, 125 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index 221ea0fd8a51..ea2821e7a54e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -36,8 +36,8 @@ ad102_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index fe1cef1b6324..78f2a15f0d42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -52,7 +52,7 @@ nvkm_gsp_fini(struct nvkm_subdev *subdev, bool suspend)
 {
 	struct nvkm_gsp *gsp = nvkm_gsp(subdev);
 
-	if (!gsp->func->fini)
+	if (!gsp->func->fini || !gsp->running)
 		return 0;
 
 	return gsp->func->fini(gsp, suspend);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index c3be72d3390a..d9cdec4810b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -52,8 +52,8 @@ ga100_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index d7385d3989f1..7b8db70f3cb3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -164,8 +164,8 @@ ga102_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 601dd5d503bb..e6f0e865848a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -59,6 +59,8 @@ extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
 int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
 			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
 int tu102_gsp_oneinit(struct nvkm_gsp *);
+int tu102_gsp_init(struct nvkm_gsp *);
+int tu102_gsp_fini(struct nvkm_gsp *, bool suspend);
 int tu102_gsp_reset(struct nvkm_gsp *);
 
 extern const struct nvkm_falcon_func ga102_gsp_flcn;
@@ -72,6 +74,7 @@ int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
 extern const struct nvkm_gsp_rm r535_gsp_rm;
+int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		  struct nvkm_gsp **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 45e3fcbabe4f..ff5ab2635003 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1145,48 +1145,6 @@ r535_gsp_msg_run_cpu_sequencer(void *priv, u32 fn, void *repv, u32 repc)
 	return 0;
 }
 
-static int
-r535_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
-{
-	struct nvkm_subdev *subdev = &gsp->subdev;
-	struct nvkm_device *device = subdev->device;
-	u32 wpr2_hi;
-	int ret;
-
-	wpr2_hi = nvkm_rd32(device, 0x1fa828);
-	if (!wpr2_hi) {
-		nvkm_debug(subdev, "WPR2 not set - skipping booter unload\n");
-		return 0;
-	}
-
-	ret = nvkm_falcon_fw_boot(&gsp->booter.unload, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
-	if (WARN_ON(ret))
-		return ret;
-
-	wpr2_hi = nvkm_rd32(device, 0x1fa828);
-	if (WARN_ON(wpr2_hi))
-		return -EIO;
-
-	return 0;
-}
-
-static int
-r535_gsp_booter_load(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
-{
-	int ret;
-
-	ret = nvkm_falcon_fw_boot(&gsp->booter.load, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
-	if (ret)
-		return ret;
-
-	nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
-
-	if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
-		return -EIO;
-
-	return 0;
-}
-
 static int
 r535_gsp_wpr_meta_init(struct nvkm_gsp *gsp)
 {
@@ -1287,7 +1245,7 @@ r535_gsp_shared_init(struct nvkm_gsp *gsp)
 	return 0;
 }
 
-static int
+int
 r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume)
 {
 	GSP_ARGUMENTS_CACHED *args;
@@ -1816,12 +1774,8 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
-	u32 mbox0 = 0xff, mbox1 = 0xff;
 	int ret;
 
-	if (!gsp->running)
-		return 0;
-
 	if (suspend) {
 		GspFwWprMeta *meta = gsp->wpr_meta.data;
 		u64 len = meta->gspFwWprEnd - meta->gspFwWprStart;
@@ -1844,9 +1798,6 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		sr->revision = GSP_FW_SR_META_REVISION;
 		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.lvl0.addr;
 		sr->sizeOfSuspendResumeData = len;
-
-		mbox0 = lower_32_bits(gsp->sr.meta.addr);
-		mbox1 = upper_32_bits(gsp->sr.meta.addr);
 	}
 
 	ret = r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
@@ -1858,14 +1809,6 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 			break;
 	);
 
-	nvkm_falcon_reset(&gsp->falcon);
-
-	ret = nvkm_gsp_fwsec_sb(gsp);
-	WARN_ON(ret);
-
-	ret = r535_gsp_booter_unload(gsp, mbox0, mbox1);
-	WARN_ON(ret);
-
 	gsp->running = false;
 	return 0;
 }
@@ -1873,23 +1816,12 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 int
 r535_gsp_init(struct nvkm_gsp *gsp)
 {
-	u32 mbox0, mbox1;
 	int ret;
 
-	if (!gsp->sr.meta.data) {
-		mbox0 = lower_32_bits(gsp->wpr_meta.addr);
-		mbox1 = upper_32_bits(gsp->wpr_meta.addr);
-	} else {
-		r535_gsp_rmargs_init(gsp, true);
-
-		mbox0 = lower_32_bits(gsp->sr.meta.addr);
-		mbox1 = upper_32_bits(gsp->sr.meta.addr);
-	}
+	nvkm_falcon_wr32(&gsp->falcon, 0x080, gsp->boot.app_version);
 
-	/* Execute booter to handle (eventually...) booting GSP-RM. */
-	ret = r535_gsp_booter_load(gsp, mbox0, mbox1);
-	if (WARN_ON(ret))
-		goto done;
+	if (WARN_ON(!nvkm_falcon_riscv_active(&gsp->falcon)))
+		return -EIO;
 
 	ret = r535_gsp_rpc_poll(gsp, NV_VGPU_MSG_EVENT_GSP_INIT_DONE);
 	if (ret)
@@ -2220,16 +2152,6 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	mutex_init(&gsp->cmdq.mutex);
 	mutex_init(&gsp->msgq.mutex);
 
-	ret = gsp->func->booter.ctor(gsp, "booter-load", gsp->fws.booter.load,
-				     &device->sec2->falcon, &gsp->booter.load);
-	if (ret)
-		return ret;
-
-	ret = gsp->func->booter.ctor(gsp, "booter-unload", gsp->fws.booter.unload,
-				     &device->sec2->falcon, &gsp->booter.unload);
-	if (ret)
-		return ret;
-
 	/* Load GSP firmware from ELF image into DMA-accessible memory. */
 	ret = r535_gsp_elf_section(gsp, ".fwimage", &data, &size);
 	if (ret)
@@ -2324,14 +2246,6 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (WARN_ON(ret))
 		return ret;
 
-	/* Reset GSP into RISC-V mode. */
-	ret = gsp->func->reset(gsp);
-	if (WARN_ON(ret))
-		return ret;
-
-	nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
-	nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
-
 	mutex_init(&gsp->client_id.mutex);
 	idr_init(&gsp->client_id.idr);
 	return 0;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index e7396344cfdf..451d3e588d26 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -22,11 +22,43 @@
 #include "priv.h"
 
 #include <subdev/fb.h>
+#include <engine/sec2.h>
 
 #include <nvfw/flcn.h>
 #include <nvfw/fw.h>
 #include <nvfw/hs.h>
 
+static int
+tu102_gsp_booter_unload(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
+{
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	u32 wpr2_hi;
+	int ret;
+
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	if (!wpr2_hi) {
+		nvkm_debug(subdev, "WPR2 not set - skipping booter unload\n");
+		return 0;
+	}
+
+	ret = nvkm_falcon_fw_boot(&gsp->booter.unload, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
+	if (WARN_ON(ret))
+		return ret;
+
+	wpr2_hi = nvkm_rd32(device, 0x1fa828);
+	if (WARN_ON(wpr2_hi))
+		return -EIO;
+
+	return 0;
+}
+
+static int
+tu102_gsp_booter_load(struct nvkm_gsp *gsp, u32 mbox0, u32 mbox1)
+{
+	return nvkm_falcon_fw_boot(&gsp->booter.load, &gsp->subdev, true, &mbox0, &mbox1, 0, 0);
+}
+
 int
 tu102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmware *blob,
 		      struct nvkm_falcon *falcon, struct nvkm_falcon_fw *fw)
@@ -114,6 +146,55 @@ tu102_gsp_reset(struct nvkm_gsp *gsp)
 	return gsp->falcon.func->reset_eng(&gsp->falcon);
 }
 
+int
+tu102_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
+{
+	u32 mbox0 = 0xff, mbox1 = 0xff;
+	int ret;
+
+	ret = r535_gsp_fini(gsp, suspend);
+	if (ret && suspend)
+		return ret;
+
+	nvkm_falcon_reset(&gsp->falcon);
+
+	ret = nvkm_gsp_fwsec_sb(gsp);
+	WARN_ON(ret);
+
+	if (suspend) {
+		mbox0 = lower_32_bits(gsp->sr.meta.addr);
+		mbox1 = upper_32_bits(gsp->sr.meta.addr);
+	}
+
+	ret = tu102_gsp_booter_unload(gsp, mbox0, mbox1);
+	WARN_ON(ret);
+	return 0;
+}
+
+int
+tu102_gsp_init(struct nvkm_gsp *gsp)
+{
+	u32 mbox0, mbox1;
+	int ret;
+
+	if (!gsp->sr.meta.data) {
+		mbox0 = lower_32_bits(gsp->wpr_meta.addr);
+		mbox1 = upper_32_bits(gsp->wpr_meta.addr);
+	} else {
+		r535_gsp_rmargs_init(gsp, true);
+
+		mbox0 = lower_32_bits(gsp->sr.meta.addr);
+		mbox1 = upper_32_bits(gsp->sr.meta.addr);
+	}
+
+	/* Execute booter to handle (eventually...) booting GSP-RM. */
+	ret = tu102_gsp_booter_load(gsp, mbox0, mbox1);
+	if (WARN_ON(ret))
+		return ret;
+
+	return r535_gsp_init(gsp);
+}
+
 static u64
 tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
 {
@@ -136,14 +217,38 @@ tu102_gsp_vga_workspace_addr(struct nvkm_gsp *gsp, u64 fb_size)
 int
 tu102_gsp_oneinit(struct nvkm_gsp *gsp)
 {
-	gsp->fb.size = nvkm_fb_vidmem_size(gsp->subdev.device);
+	struct nvkm_device *device = gsp->subdev.device;
+	int ret;
+
+	gsp->fb.size = nvkm_fb_vidmem_size(device);
 
 	gsp->fb.bios.vga_workspace.addr = tu102_gsp_vga_workspace_addr(gsp, gsp->fb.size);
 	gsp->fb.bios.vga_workspace.size = gsp->fb.size - gsp->fb.bios.vga_workspace.addr;
 	gsp->fb.bios.addr = gsp->fb.bios.vga_workspace.addr;
 	gsp->fb.bios.size = gsp->fb.bios.vga_workspace.size;
 
-	return r535_gsp_oneinit(gsp);
+	ret = gsp->func->booter.ctor(gsp, "booter-load", gsp->fws.booter.load,
+				     &device->sec2->falcon, &gsp->booter.load);
+	if (ret)
+		return ret;
+
+	ret = gsp->func->booter.ctor(gsp, "booter-unload", gsp->fws.booter.unload,
+				     &device->sec2->falcon, &gsp->booter.unload);
+	if (ret)
+		return ret;
+
+	ret = r535_gsp_oneinit(gsp);
+	if (ret)
+		return ret;
+
+	/* Reset GSP into RISC-V mode. */
+	ret = gsp->func->reset(gsp);
+	if (ret)
+		return ret;
+
+	nvkm_falcon_wr32(&gsp->falcon, 0x040, lower_32_bits(gsp->libos.addr));
+	nvkm_falcon_wr32(&gsp->falcon, 0x044, upper_32_bits(gsp->libos.addr));
+	return 0;
 }
 
 const struct nvkm_falcon_func
@@ -176,8 +281,8 @@ tu102_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index a8c9480b8024..1bc806a18010 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -35,8 +35,8 @@ tu116_gsp_r535_113_01 = {
 
 	.dtor = r535_gsp_dtor,
 	.oneinit = tu102_gsp_oneinit,
-	.init = r535_gsp_init,
-	.fini = r535_gsp_fini,
+	.init = tu102_gsp_init,
+	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
 	.rm = &r535_gsp_rm,
-- 
2.49.0

