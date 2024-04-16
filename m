Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF608A7921
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8FB112BF1;
	Tue, 16 Apr 2024 23:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SZyj2Ch6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BA74112FB4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTE+k6d/0EfTtPw49dY31KuLcj8V9KcJdSNcj8l4YFo/TfNm1ZVSUp21QtK1otKyLVkUS0GYRp3Q+56pxMvuRVWsCHAo6yzbUMQrTIkz4C4k5QR5tXb9T1C3G0z4NLUujevTD5CdbEJ9Hl9EgfcsfL/t5vc8xztHH8Y6/fyNYhEiQO+VPVsjNskM9dd/W3dM+0wNDTYYsfQp9HLcAJ/4WejC2Z60DVVvS2IVf+tFZdppHfcdHk0WiLUFRonGmsSXZh8nkf7cg/vWI1KltjMy84gb1bIOmpuIq+HyMG+qJ4eymHaWswSnFcgeAOS19wxyiqDa5dMcYLNSwNm4pBZhHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oD5CPcB4cCIR0+o94cZ6YFfZaRVb0xp9mrmm3II5rT4=;
 b=Et9bEh2Rl8OR8+fdg745AZaEKz0EfpKh7gYlOXlM62fY5fmfqsxwuC9ErEpgFoD4Dz5evef67L4TdcPtVrKcz2iW74ChIfxyVvXtZJtkWUTTWc4YYz7jZz+roqu5Ol0fWb5X6sN5vhwM2f/UFMPf31j0F4PyF9xvMDjWzrovQjoQfPhS8S1rAKBeXYJcFZmwdqt8qXO63evhYIspZOGAff5Cvs6Hvz2ixqx4wUkui3tzB8Tqvc4JRmOWCy1jNL6Lh8Kd47pQWMeU6i36ZTYt2+ziwar+OWPqUk4lk0P4GqyjQfHIwIIRmZMJ17P0AyJJh72owgn++YXUVPRFG+JGOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD5CPcB4cCIR0+o94cZ6YFfZaRVb0xp9mrmm3II5rT4=;
 b=SZyj2Ch6L4mnvANgZkX+/w/zpE8CRTUiyaJP8fchqXw0kYvyu1k0YYxHPFjF4CmbIGXQ51hWg74jVUMkaDO7kMcjpua9QSUs/5M+u89zYyGbHxJ9p9IrldScrnzNN0dsP1Bc8H1XZqj1fTMmY37WQXAYa9bZ0CdndEyTrdG8LEjkGORXO38e3Oxw+jzoRdFOPJvTdbQ5rSQNfTrTdvrbCroWBgQmbAeGS5PfPuK1jF20LmmrjU4Bbug7pfc/OTo1c+tZrSY4PZzhjN5ibUsRE+wNFlU7QZE6s/Kgln5tadgfsjCpjFM/lC9gXPe+Ne4J3rZU4q6ZMEKDTHlWRqUyMg==
Received: from CH5P222CA0011.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::26)
 by IA0PR12MB8374.namprd12.prod.outlook.com (2603:10b6:208:40e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:01 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::85) by CH5P222CA0011.outlook.office365.com
 (2603:10b6:610:1ee::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:38 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:37 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 112/156] drm/nouveau/nvif: rework outp "bl get"/"bl set" apis
Date: Wed, 17 Apr 2024 09:39:18 +1000
Message-ID: <20240416234002.19509-113-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|IA0PR12MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 207ed8ef-e7a2-4012-d9ed-08dc5e6ef456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /1X4nvpyuYqeyAqh5I396aE3lwjAIEaMEaiiMDhJcTWWtW+Q7Zcl6nUswMHaLZB0d4kkSaMpcKmtW2wESyHJJEps82WL7/yAYWQ36kad8b89ouI6wnd/fWOp4/Pk+UzjWKVhrNiILUMVeyku0yRw6HNg6B04NCNkmQeFIOlQxIUHwy8m8yoAnWQrbcbFMHtU+1psjSDAUv3w2og8iXfIVAgWMK/VKbsk/HSSWzBsXje4On+HinhY4tkX4nJY0+s6u7hDwliNGKPTiWA9FZu/BHH6dgkr9NMDWm2FJffVdAb72FSPui2Bco4xmyCknkgakGINwD/GAI3sG87pB3ryQqfn4KLt7zrUQkMEQbpbTP3ftLqH2VurH1jCA/OzFQhlhnXrRWS1UdNMtjX4wnrP4EUVTuIx9HKZ9It6uKskWlg0FiFYUFYkM0N73PGzXfK1KcwZHsDLsfI14MmK3x4vQdvVGC15obygH8MiNy4mcS/p/Qi8eNXZmkEiB1zY6haKCkqKQ2Ja1cklOkqE9i1PivbxuUOowpri8rUknCaDBPPZ0REXxKG0V5MaUv3/0lFgG7IxZACdSFhwkmEfIiEpsLN+LYnLmKTNBAM16e5LtMOnwpCSwTg8Nlv57BXRagno/5XbUNegEA9GCRV51Dr3k2oW+Bc4Cm2MQ1pihMRNSOhhOmYBygHNXPk/73oAm09oZpyFlMmweq/6tRo0Vkg9Ce4COVCqFDJT0j/1yfn7CdATQs63sW7hXTzhrgkr7/fM
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:01.6795 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207ed8ef-e7a2-4012-d9ed-08dc5e6ef456
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8374
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  5 +++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 17 --------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 18 +++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 43 ++++++++-----------
 4 files changed, 29 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 2b29ac64e5cd..7c4e3df12a8e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -295,6 +295,11 @@ struct nvif_outp_impl {
 		u8 acpi_edid;
 	} lvds;
 
+	struct {
+		int (*get)(struct nvif_outp_priv *, u8 *level);
+		int (*set)(struct nvif_outp_priv *, u8 level);
+	} bl;
+
 	struct {
 		u8 aux;
 		u8 mst;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 1a8f0720c14a..0bdd8ddc65d3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,9 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_BL_GET        0x30
-#define NVIF_OUTP_V0_BL_SET        0x31
-
 #define NVIF_OUTP_V0_LVDS          0x40
 
 #define NVIF_OUTP_V0_HDMI          0x50
@@ -24,20 +21,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_bl_get_args {
-	struct nvif_outp_bl_get_v0 {
-		__u8  version;
-		__u8  level;
-	} v0;
-};
-
-union nvif_outp_bl_set_args {
-	struct nvif_outp_bl_set_v0 {
-		__u8  version;
-		__u8  level;
-	} v0;
-};
-
 union nvif_outp_lvds_args {
 	struct nvif_outp_lvds_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index efdcc1c28874..7929dc896b6b 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -269,28 +269,22 @@ nvif_outp_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
 int
 nvif_outp_bl_set(struct nvif_outp *outp, int level)
 {
-	struct nvif_outp_bl_set_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.level = level;
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_BL_SET, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[BL_SET level:%d]", args.level);
+	ret = outp->impl->bl.set(outp->priv, level);
+	NVIF_ERRON(ret, &outp->object, "[BL_SET level:%d]", level);
 	return ret;
 }
 
 int
 nvif_outp_bl_get(struct nvif_outp *outp)
 {
-	struct nvif_outp_bl_get_v0 args;
+	u8 level;
 	int ret;
 
-	args.version = 0;
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_BL_GET, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[BL_GET level:%d]", args.level);
-	return ret ? ret : args.level;
+	ret = outp->impl->bl.get(outp->priv, &level);
+	NVIF_ERRON(ret, &outp->object, "[BL_GET level:%d]", level);
+	return ret ? ret : level;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index f5d3b3647dac..5483ca37ca0e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -320,39 +320,29 @@ nvkm_uoutp_mthd_lvds(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_bl_set(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_bl_set(struct nvif_outp_priv *uoutp, u8 level)
 {
-	union nvif_outp_bl_get_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
-	if (outp->func->bl.set)
-		ret = outp->func->bl.set(outp, args->v0.level);
-	else
-		ret = -EINVAL;
-
+	nvkm_uoutp_lock(uoutp);
+	ret = outp->func->bl.set(outp, level);
+	nvkm_uoutp_unlock(uoutp);
 	return ret;
 }
 
 static int
-nvkm_uoutp_mthd_bl_get(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_bl_get(struct nvif_outp_priv *uoutp, u8 *level)
 {
-	union nvif_outp_bl_get_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-
-	if (outp->func->bl.get) {
-		ret = outp->func->bl.get(outp);
-		if (ret >= 0) {
-			args->v0.level = ret;
-			ret = 0;
-		}
-	} else {
-		ret = -EINVAL;
+	nvkm_uoutp_lock(uoutp);
+	ret = outp->func->bl.get(outp);
+	nvkm_uoutp_unlock(uoutp);
+	if (ret >= 0) {
+		*level = ret;
+		ret = 0;
 	}
 
 	return ret;
@@ -552,8 +542,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
-	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_XFER: return nvkm_uoutp_mthd_dp_aux_xfer(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_RATES   : return nvkm_uoutp_mthd_dp_rates   (outp, argv, argc);
@@ -704,6 +692,11 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 	uoutp->impl.heads = outp->info.heads;
 	uoutp->impl.conn = outp->info.connector;
 
+	if (outp->func->bl.get) {
+		uoutp->impl.bl.get = nvkm_uoutp_bl_get;
+		uoutp->impl.bl.set = nvkm_uoutp_bl_set;
+	}
+
 	spin_lock(&disp->user.lock);
 	if (outp->user) {
 		spin_unlock(&disp->user.lock);
-- 
2.41.0

