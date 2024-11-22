Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 583A09D5F61
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCDF10EB7E;
	Fri, 22 Nov 2024 12:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kicVPrb0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D4810EB73
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMURgFIyZbsvdTR/OnMkjZnk0gPszhIvLwwfDYupEyIY+YEGQTud4bnKL3MUijT1vDPaOGH1hsZU+hC4Gh1sJ5i6WkpP1RKocQ6uj9tlxA4PiME7a6+97TlZ4t8bxLNtc5xquClWthJg62sa0cz8KQBdNWahcSDSdmYbUeZhFeSnTyOAvLQgjpvI6O+HV0ENj8VbB2ta4+6jaNBHWKuilxE2VQrtCKLdoRutoPsBnqTV/V6Hv1rgenOnLHgUa49Jry4rLUpObfeI1f3QV7ZSnVovi6Dk3+hkLews4Mf9LFt+m+j4AtM5PFq6kowZ82NmdrcGDRVq5F+i77r57qRM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWPilNaoWTLgxl1a9bcLxQRmS1nWHKBCkv9ahE6r6Bs=;
 b=ctr1JywgGXFCy5YWO3GNOB9aboZwtXQdFqK5VdvuXf9PYwTWOKh0ZWiZpVO9/iOZ4PJ0s3i1pSAnX7ovSs34qPe2OyiCOkOuxl84KjJcP7nSF8H+xCiCKHAK7wqObrY3VL91wN28ztm2TT99ZeHPGExQWBV+LanKzl87JPcuzK15UG30lecnpGZGH1NdEBc33I9bfeIif0n1BwMefFfIwZGPVxzOIt47HgxKN0IuRZ/6emm+FM2vWVRfNJVAJhNt/akRjV/Ro3lrm2MMDXauFRzH1F078vbVBK7Yp0NTJOqYubwQICFpEQDe5p9jz6rY/k0UMpy2a+vgSQeJeLXsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWPilNaoWTLgxl1a9bcLxQRmS1nWHKBCkv9ahE6r6Bs=;
 b=kicVPrb0sJSCmhUUO/YMKB7wo0DuKpzWACyaHzGUW9zVzuFsJcqGwyabBJWnPYMvdnNnWRxSvxrrKhNUiksiuQThvuyVqPq0g9+tr5Xhj6HR2GDXnooSlSZM82FFvoNfvd9jI5MgRpYp0s37iiK6pL+oe1YatWYnNkV+ME/eF3qL81h/c1Pv09hqKUlCaQoEeru/wVNAzidwMQ5qRU6RNKebP3UuGCRnZTek7RHa9jO0ahUcG0bDXXveDV9Gu2acPA/U2IgBqj1FgWnOp+zbCyf+RN0jUf/3S+wSabwoh7/WxYEiiZ8r9uWNgaGPQwGu0DNh5gbCIij1hW2g23eyXw==
Received: from BN9PR03CA0792.namprd03.prod.outlook.com (2603:10b6:408:13f::17)
 by PH7PR12MB7235.namprd12.prod.outlook.com (2603:10b6:510:206::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 12:57:27 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::ea) by BN9PR03CA0792.outlook.office365.com
 (2603:10b6:408:13f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:26 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:26 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:25 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:25 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 2/8] drm/nouveau: introduce tu102_gsp_init_fw_heap()
Date: Fri, 22 Nov 2024 04:57:06 -0800
Message-ID: <20241122125712.3653406-3-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|PH7PR12MB7235:EE_
X-MS-Office365-Filtering-Correlation-Id: 06fdcdb7-8654-46a0-e7ba-08dd0af5376a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lOu3TEBWXTQvF7lKsfBfolRiyYo8QvoVtCDmJ3ReVTWiBgbHTB8OQCHBfBxn?=
 =?us-ascii?Q?gk955DQvQ/misWFaE9XDxt2gJ2v41aWlJioqoSjr9vUq8PzmGVeGt0Iye1nt?=
 =?us-ascii?Q?z4sHSSEXDz0Xcsh5gH/qGn0M1ocR3h0cOWbsGCKdSLCp6Faq0zC1I/a8aVs8?=
 =?us-ascii?Q?dk5e774kZi8CcU4GQA+Br+IQzkSBNtGwkmK7wllBdFtzDKLWUFsm3JB+cBz9?=
 =?us-ascii?Q?dYnycGA+/W05Er/1wix3Mrnh45q/KdO6nNF1TlNEjkFAgwVnJJgGPPnn7GZy?=
 =?us-ascii?Q?R5Qc+rroqbJeUb1N2iTK1HoCB8/SECLEU9tL5oEkN9tRBXynoyqYbnrQ+A8Y?=
 =?us-ascii?Q?f5bzXRdtNLx7pTvgCyftXs62MM+mZFkjTSbtUa2GCoPjtbw+s1+kSBQrqenb?=
 =?us-ascii?Q?6zPcccuNAcz2+ycm8a/B+D7hAHAEwELaJHGGlB4gLzhdy2JkcpRwlwjpusm9?=
 =?us-ascii?Q?Mz82EuhtP5sa94LqZg55e163p1Pu4g/ZS1HPILpKHo0hWndxv44A8yGcQgTj?=
 =?us-ascii?Q?HvqVzJcwZ8+QRxYCnV8gQZQq4lDk3I7EQej018/WchlzHKq2COq/s1ceaKjU?=
 =?us-ascii?Q?i8duGtzLbCUHXo5D2zcSGQRxGL1IsmNpNT6P9TicTUkGVDL9edNaA72VelGy?=
 =?us-ascii?Q?JEmoSpn2vBujyD4TsXpxRbo92sm2C76qWgVjDj9CuJHZzo7peOXWT0TSJQVg?=
 =?us-ascii?Q?1yPk3jsS5W4IK8gSqiFK+WCvX3zMmi1X7BBD9HaOLm3N4NUtcwZLSo6Ratca?=
 =?us-ascii?Q?fr3snL2rTyE/b5odwPekemjzFNDa6Z6Tt5o7C4UzqC0mNc3Nr3JBwG3vn1MR?=
 =?us-ascii?Q?NAn1g1T/hLJMGckS1YSouy27AaE9B1IYeKPHds4Q/TL+VYnI9EEupAf0B4Zc?=
 =?us-ascii?Q?7f/KsB0q4lJCBhaC6QBi4JYDRKW5K/mvAA5NXNIRHbdR+qfbZhVGNcOIzSaA?=
 =?us-ascii?Q?nzHtCRjP3kgKraqigAiqETLIUJVDcQMxBSwYwwibBV6Mku3qWmYx9fXAwv26?=
 =?us-ascii?Q?ZsAZnfxBe95ItPiVgxhfcwJyXRYOcMVW2fRbukMSHc5xMprTw2KGHmxoc11K?=
 =?us-ascii?Q?pzEVRGoR54XDRD/7WjOw2VT/PQFI0yMq65gXE+3ClZNPglNfTcoShyLu9Exr?=
 =?us-ascii?Q?jOoVLblpyHcZKLtsWuHqTYrw/8GnNzXL6k19LLRyddTIhXmNrxVq018QMxc5?=
 =?us-ascii?Q?cyzwkV0BJziixznuJDqsC4utDacy+74iuQE3/703r7fe8/jBAbXoqy8KGKJ7?=
 =?us-ascii?Q?VWp0FbFGTTnqOahxzreZ6QYTq/lR2X8Qg/4grSO5c55BQ1Y2FoVW3g7LgVO4?=
 =?us-ascii?Q?NuUZSl6mx73sIHSIzYYWAGjXla5cDMuKd5T1GHMnHg+QtgKhzHosZJ5PIk1N?=
 =?us-ascii?Q?K3EmiOSW3MrYUfBHxkPNxQgyf8Q+d8s25t/4nuVO9sIi6KCY4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:26.7621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06fdcdb7-8654-46a0-e7ba-08dd0af5376a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7235
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

To support the per-SKU GSP WPR2 heap initialization, introduce
tu102_gsp_init_fw_heap() as the common function for the support SKUs.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h  | 2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c  | 4 +++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c | 9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c | 1 +
 7 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index c849c6299c52..00a7ec875400 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -31,6 +31,7 @@ ad102_gsp_r535_113_01 = {
 	.wpr_heap.os_carveout_size = 20 << 20,
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 84 << 20,
+	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
 
 	.booter.ctor = ga102_gsp_booter_ctor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index 223f68b532ef..e5423199232a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -47,6 +47,7 @@ ga100_gsp_r535_113_01 = {
 
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 64 << 20,
+	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
 
 	.booter.ctor = tu102_gsp_booter_ctor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 4c4b4168a266..a79dcca873f0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -159,6 +159,7 @@ ga102_gsp_r535_113_01 = {
 	.wpr_heap.os_carveout_size = 20 << 20,
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 84 << 20,
+	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
 
 	.booter.ctor = ga102_gsp_booter_ctor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index 579d83048164..dfb41be3d677 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -28,6 +28,7 @@ struct nvkm_gsp_func {
 		u32 os_carveout_size;
 		u32 base_size;
 		u64 min_size;
+		int (*init_fw_heap)(struct nvkm_gsp *gsp);
 	} wpr_heap;
 
 	struct {
@@ -48,6 +49,7 @@ extern const struct nvkm_falcon_func tu102_gsp_flcn;
 extern const struct nvkm_falcon_fw_func tu102_gsp_fwsec;
 int tu102_gsp_booter_ctor(struct nvkm_gsp *, const char *, const struct firmware *,
 			  struct nvkm_falcon *, struct nvkm_falcon_fw *);
+int tu102_gsp_init_fw_heap(struct nvkm_gsp *gsp);
 int tu102_gsp_oneinit(struct nvkm_gsp *);
 int tu102_gsp_reset(struct nvkm_gsp *);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 6f2319845322..c56c545f2bdb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2619,7 +2619,9 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	/* Release FW images - we've copied them to DMA buffers now. */
 	r535_gsp_dtor_fws(gsp);
 
-	nvkm_gsp_init_fw_heap(gsp);
+	ret = gsp->func->wpr_heap.init_fw_heap(gsp);
+	if (WARN_ON(ret))
+		return ret;
 
 	ret = nvkm_gsp_fwsec_frts(gsp);
 	if (WARN_ON(ret))
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 59c5f2b9172a..e279a322704a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -76,6 +76,14 @@ tu102_gsp_booter_ctor(struct nvkm_gsp *gsp, const char *name, const struct firmw
 	return ret;
 }
 
+int
+tu102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
+{
+	nvkm_gsp_init_fw_heap(gsp);
+
+	return 0;
+}
+
 static int
 tu102_gsp_fwsec_load_bld(struct nvkm_falcon_fw *fw)
 {
@@ -171,6 +179,7 @@ tu102_gsp_r535_113_01 = {
 
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 64 << 20,
+	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
 
 	.booter.ctor = tu102_gsp_booter_ctor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 04fbd9ed28b1..daa954835ef9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -30,6 +30,7 @@ tu116_gsp_r535_113_01 = {
 
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 64 << 20,
+	.wpr_heap.init_fw_heap = tu102_gsp_init_fw_heap,
 
 	.booter.ctor = tu102_gsp_booter_ctor,
 
-- 
2.34.1

