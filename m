Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10910ABA704
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C97D10EBB2;
	Sat, 17 May 2025 00:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dFko1lRX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB3D10EBB0
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK0P12z8X0V0k1yl0PDAy3rL1giOUbr6Q0GPJKX00tjzNIgNKt3NI5zKfX+7to+dewvjU4PxZpWV4Du3VVLnXnghNgljIAH3BF4V4fX3qcwW6OKw4QpNYaLd7CVplpR5HPJH79B9+muAT5mNEnn1e3nWpMmRozczX1RB0MS62RoE4E3/qpJ1jCkzuaUdiagOTSgEayYEB+9GlhB23bytbO2c/X17+x4Y6KmzHnOe2wHsiYhpkR6ebFBTBVl5SwvuDchY5m2CyEjNYMvGY66cfQmGC18je3nEaWB4hiIyhXAKaXiI27Mp7w4aBDRoXQ1A2V0ZtVAb/W8NMmAgRJTjOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+94+m10IhTN5xA1P4vfz3ztvNaI3m05r5WMymSRkA68=;
 b=WtPoBexHchy62UM7UOV5HHqYT1iDtDLGY9yyWO8qUqsUd2YpWEIW93SYrQ/7e5W6ZphSm35GsUE92xnUXTKNJCYJMLir88PtjfNUKVlkBvKs+gZe7KInUCZ/t6goyQtzvqL9enYQsv6ZdQVH4tmFm2DWMeOFFDyVe1/ATvDQNAsmOsR3EsrhY0sNHDQcCqcJNELwcP8FrBfkd9b92uKJoNDOpgG2nkepFW4TiSAkTxFP3omEqAssVKvWcUxs8bUuao9EEVs23CYYPrPh2q280Rxl02XU0q42G5YFhEFBKPYza6eMSRDGRC6DSQwB/go80/nBPEIea1zrHwsZvTPt9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+94+m10IhTN5xA1P4vfz3ztvNaI3m05r5WMymSRkA68=;
 b=dFko1lRXcx+xaUnZ8sTkAeVum79sWDXP4nXuZAmJxubUJyj2fIi8lsRdoOzjoKj+L5k0CGGsS+vsUO6tnAQEEeQvmrAx3DeLSCddg7bmRtYTT1WQbG1T23SqRFMIS8JaJUniVEX/mwX51Hr56VMUri6+LK9KHvglcWYdQ607cGObCd76OXir+sU2c4bdrPrG98SvIOIIzAaQxTCopRTPslnWcCMAEatJ/r8IxmPmI0V/l+a/OFiQWaSkUXHEnj8G3RqBLuqhzFDJFlfsXSqZSjm+TQC7U57seqX0/fRIyvo6PveWxhddsjbFXc1yYg5cRnsnRRbmkiTBHv/Q93Sl6g==
Received: from CH0PR03CA0378.namprd03.prod.outlook.com (2603:10b6:610:119::33)
 by DS5PPF922753E5F.namprd12.prod.outlook.com (2603:10b6:f:fc00::65a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 17 May
 2025 00:10:39 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::e2) by CH0PR03CA0378.outlook.office365.com
 (2603:10b6:610:119::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Sat,
 17 May 2025 00:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:25 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 12/62] drm/nouveau/gsp: move booter handling to
 GPU-specific code
Date: Sat, 17 May 2025 10:09:04 +1000
Message-ID: <20250517000954.35691-13-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|DS5PPF922753E5F:EE_
X-MS-Office365-Filtering-Correlation-Id: 608897cf-266e-457a-6506-08dd94d74165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v52gapJgjverXNeIBr8WdNPZKncDCKS3nfMAUP5zDWHjXfidTj8fetSjWXkE?=
 =?us-ascii?Q?28mGDPsiKcEeutEFBgaEA4hGT1u2m7/2LtF0WjnBmifwwKRCAm6GguNxSTqd?=
 =?us-ascii?Q?OIuiWbzauWQaJ6WDQi8b/cVYFh4hmje/zOGHWCZvrbYGRneZJNrZ1Uq5/tpy?=
 =?us-ascii?Q?uWUWsRlu/E6St7wQPn7UrOCTdV2cwMA9IiyXpCypcFWXrbqAm/sXL15OFtWw?=
 =?us-ascii?Q?ChaMdDcCZ9k/QzRnwaJQcPRvxNylHemL/lifOqKR89f+MezDe+6ljI8RAQNE?=
 =?us-ascii?Q?l0EUy8gmooZrqEYRLI0dubAdntfUkJ2dVWt7RfUA7wmXThWq2X5LIr6EJN9z?=
 =?us-ascii?Q?la5uinUojxbvuuUvtNcByOjVopjURVKPsnvUOFqyQbErhGxVWvNbPczDKAs1?=
 =?us-ascii?Q?JBfq7V5UnZhFq0/pHHNLSkH3o8mqwAjSSWYxgsmgZvlJnDkYNrXTULxyLI/4?=
 =?us-ascii?Q?ZmNs3ltYfeoROZ9nr94bgd1nsG6gf8+KrB0jwommI/qx1H3Zu1NIHd0fckCD?=
 =?us-ascii?Q?pFWx2RTC7A5j0S36kC/9Az4CJ2Fdoi8vjtc0Hub03SdbfOxhfqeUGYagVV5Y?=
 =?us-ascii?Q?8Nk3JlsmENbWhPIIc4KRPr30SXI1elFA9Bi+Qyyxh8YyVr3vg4FGlyQc7GYW?=
 =?us-ascii?Q?msDiHA+7rAGoykCVWPuLdB9DciHm6U9PiCR4ij35hMwYKdjAgeLX7uz9i7kb?=
 =?us-ascii?Q?Hn+Tgc5JZx3agjifsRoBletj8GZ3y8cyDO2U0WaLNI6BPavHMao9Jktnb+Q4?=
 =?us-ascii?Q?LqmIhtQrEut4OSki9WcqYD6mJPZYvPmiq65BSg1D09IttlYUXBtI1qN118tx?=
 =?us-ascii?Q?MieyUIjuvLGDvUJZmFYIMq9uVhE6OMYWlsh8+moOu2V6LqEre0KJhscHymUp?=
 =?us-ascii?Q?Zk9JsPD8qpQx1KaR16f5WzlpfEKvvUjr1zMwX8HwIg0ugcbt9dSSmSG6NWQU?=
 =?us-ascii?Q?M4q660MvZD0mJZ0vPXVJvR1PN9Glyrzxp6miruVIkyYlUofSAiPifUkz++Yh?=
 =?us-ascii?Q?YHA7sHa+ry46KbD+0Sp297004t16hV9dwOdoJLncsMrqKTf2ofr8c4C0O2wW?=
 =?us-ascii?Q?3ajTwCeO+JCr8cDqt5QfADiBMMOQdWhi3tM8ybuywOgplh/FPLmZ33dp+Caw?=
 =?us-ascii?Q?PuSoya+qe6fZqSww8w0fZdmvv0FjF2eb0jmN2DSpaLBj5ZqzcD2cZR95/+RF?=
 =?us-ascii?Q?mgcaBN/IzQTqNvJebnLA2BC62y5FWSZ5Wp/5OjbGk4PKLougACsg09tE1gP0?=
 =?us-ascii?Q?jrG7Si2dDH7IUrTWFHIWosNs6w79MFPGKy3hxJFQ+87wPpM9R+mw85X5MWZM?=
 =?us-ascii?Q?VK3Z8STuD4VO51rAuz4igXJXedQAOAdOTkp9DIbMcjo6p0Ux4eIXsjBVpoL2?=
 =?us-ascii?Q?AkVCIy2OysEiyTLUakIv1lhW7Y0f/8m+2FNLt9e5G5dw0z0HaK9moy49dHe9?=
 =?us-ascii?Q?5IaagdrpkvHJLRdkv8FgEhILWO7/j1BLnOCYvdRcw3H9wnlK4ImITpOmuvTc?=
 =?us-ascii?Q?vgJygJRD5z1nKfU2kspXSxubaWTmSGEWjrLQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:39.1065 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 608897cf-266e-457a-6506-08dd94d74165
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF922753E5F
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
index 9d5b77b3cb2f..f42879b2ea7e 100644
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

