Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9BE8A7927
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EBF4112FBB;
	Tue, 16 Apr 2024 23:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZVsagUlA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C410FDD6
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bf5tbDHp0mseXdxDBWHT/W/Ih/ObECzhugNkpinBqVL/nufoJyli4tUI8hX2gKpjno46tQUq3iSUXlnxl4dew8R200tlGMeh3C0vZHBSZbRc7/bg2DFnhGmioXWheMQBB1UGiGZz8KfXBLOanQnOkfV48MWGVHxR1Ap8/rFMchK3VtW3L6ChOw8E27gcp4ijxwZX5IxbLoMogtJ9OCUNJsY6Uxyfx+X8LsGMlr9hcjR4gbHwheUKyjfTS5/duov3CtdK0w1dIeOTb88w7vNH1nl0mdQhz9Lkp0Kslhk2RaDwbOQVmEHVvnp3MNrtSzbdMaOb7tr8x+Z+pGaQK9zZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QHeWm+hnu29YSyo+1iRGT9F+gAyNIB3TNFt35vHkzbE=;
 b=aJ99VAey9LDXKMgiWtCT8CC9RezCRMHlJIzorVz16QVD8cyzd6qcgi0VOH6gSQk2MqybhWthqxeclyDxQgxN67hvC3+d3IdPKCa6/2nopU3hO2EQwDfPqddbXtEl7+zwLxzsxOO8yr6PDQz0O7o94nkp/5FmSeJo1ESTlQnoEWxPz2CFoQCj+elo8vfSm6jEmRQU7AHkajCQWLKRrxwxYbQaTPC/5rt6XIqVZkahv0PjPEOD2y+BObUxCUtLlZZAqPYrPxuT/nPjgwuQ7+qV1X39o35WgZhw820S5KH+sWG1RNaibAMaJyzF/4gO79wCXvOBTS2VJOWsiDq5tEZfaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHeWm+hnu29YSyo+1iRGT9F+gAyNIB3TNFt35vHkzbE=;
 b=ZVsagUlA+HvRb9inr1lD79FYxUVagxGxUHurYtxkCx7QIcgtNBLo1Lq1FBhokr+4anp/ZaCQevVdkHtEVfUfCw1+TWrH7zMCmJVi7n9w53wtimnEJ3VuDMX01rp5Eb6nh31IfcfR4TIRf9jpNwc2Rv7ZP+2b8P1UUdVHbQgKMd+VImdUdNw0esntQFQrobCEBshpZtHIKrVJIoJOnxOnnTDFYsyTStl0rE0az6Oz6emZXjWfBd/DJWtlKvCRmJlTiOsieVpQCm9oMwS8Ykuu4UAmVUFGjYP2JwQ/t7XLG15YIIRQvdsPJ761XkaJKWe5fYS811wPLAdCY9OZWGr28Q==
Received: from DM6PR07CA0063.namprd07.prod.outlook.com (2603:10b6:5:74::40) by
 CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:43:01 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::f7) by DM6PR07CA0063.outlook.office365.com
 (2603:10b6:5:74::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:01 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:44 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 117/156] drm/nouveau/nvif: rework outp "dp aux pwr" api
Date: Wed, 17 Apr 2024 09:39:23 +1000
Message-ID: <20240416234002.19509-118-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d390b9a-c310-41be-f9e7-08dc5e6ef3f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1dN4kYDAufxWrnEne+HFx46XTOiI0IeUkoSqXHpKRq4RLUDULpG+bKuOf1Q5RdDdsKqKyz8unMBLnN0Nz4qIQceCjHAf84oQKg2XN8OVU9Nk/fA9Lw5iuJX09o2AHH0UWvmpaFuFJpqAUZlECSHSa4JyDIdHdgreajvdzEjH4tpSNHT1bO2LwVLmOLOCtYrYfI3BRA7MC3mFAN9GyFoXSa0VbyhF2EIvcmM9UBfHWCV+jpp0Ele9DtqyQiPBA9QqsrcuLSVCTH5ida6pef64hqjDjiw7vFJ6ofCRgxusT7JEJBsyOsyyzURgBYS+Mfg7WtAPNeQkmCXN00utAOJEeCyN6yOEPdZ9lJMotLnox+urmHi0FQVcTvXJzBSEZBzyL1fgMuQ1EJGqCH3aW+qHZHFKMNo2/DWExNP4q5kKXfGhygdo12S7zmCMsCy7rbJZBtoZfITjkKQnHogWqjyoFba4LngSmCTk12CJsmzk+PWe10fG4WtY9F6BvrmvqbXHYQDS9BZtfdw6hhCFDjpImMdO5uaTWLGEYz2dE0jmA0E8Jqprfyknr+xaXZ0R5Ji4UjZRVQVsSKAAE+xWPQ2w2nt/YY8Fh8VrFH3SF15FGL241UpngBDQliEDKEjoU9QujSR8NMBQipwLSwWIY2DmbmOPZbMS46qWqGz6WPluKb8kbpIdNg6Gkm/tX6oH//H6WhALjA0nwlblEJzSN3YiWfRB5w66dz9p3QQKrQB7OD5mnuDlNRlZ58IIjJiKMg6
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:01.0733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d390b9a-c310-41be-f9e7-08dc5e6ef3f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h |  2 ++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h   |  9 ---------
 drivers/gpu/drm/nouveau/nvif/outp.c             |  8 ++------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c    | 17 ++++++++---------
 4 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 742cf0e1678b..0dd85d4fa9ab 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -325,6 +325,8 @@ struct nvif_outp_impl {
 		u8 increased_wm;
 		u8 link_nr;
 		u32 link_bw;
+
+		int (*aux_pwr)(struct nvif_outp_priv *, bool enable);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 160387dfc2a0..c0981a5f9e87 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_DP_AUX_PWR    0x70
 #define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
@@ -14,14 +13,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_aux_pwr_args {
-	struct nvif_outp_dp_aux_pwr_v0 {
-		__u8 version;
-		__u8 state;
-		__u8 pad02[6];
-	} v0;
-};
-
 union nvif_outp_dp_aux_xfer_args {
 	struct nvif_outp_dp_aux_xfer_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index cf79c56aae0c..8b09a7ae9876 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -181,14 +181,10 @@ nvif_outp_dp_aux_xfer(struct nvif_outp *outp, u8 type, u8 *psize, u32 addr, u8 *
 int
 nvif_outp_dp_aux_pwr(struct nvif_outp *outp, bool enable)
 {
-	struct nvif_outp_dp_aux_pwr_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.state = enable;
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_AUX_PWR, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[DP_AUX_PWR state:%d]", args.state);
+	ret = outp->impl->dp.aux_pwr(outp->priv, enable);
+	NVIF_ERRON(ret, &outp->object, "[DP_AUX_PWR state:%d]", enable);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 7184f13f39f5..36b4ea9a10fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -195,16 +195,15 @@ nvkm_uoutp_mthd_dp_aux_xfer(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_aux_pwr(struct nvif_outp_priv *uoutp, bool enable)
 {
-	union nvif_outp_dp_aux_pwr_args *args = argv;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!outp->func->dp.aux_pwr)
-		return -EINVAL;
+	struct nvkm_outp *outp = uoutp->outp;
+	int ret;
 
-	return outp->func->dp.aux_pwr(outp, !!args->v0.state);
+	nvkm_uoutp_lock(uoutp);
+	ret = outp->func->dp.aux_pwr(outp, enable);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -564,7 +563,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_XFER: return nvkm_uoutp_mthd_dp_aux_xfer(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_RATES   : return nvkm_uoutp_mthd_dp_rates   (outp, argv, argc);
 	default:
@@ -705,6 +703,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.increased_wm = outp->dp.increased_wm;
 		uoutp->impl.dp.link_nr = outp->info.dpconf.link_nr;
 		uoutp->impl.dp.link_bw = outp->info.dpconf.link_bw * 27000;
+		uoutp->impl.dp.aux_pwr = nvkm_uoutp_dp_aux_pwr;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

