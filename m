Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4318A7926
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC1F112FBC;
	Tue, 16 Apr 2024 23:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ht4WpLtj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1F33112FB6
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7t+sCD8d3b0I7ijxO4Kmnjpx7IBwHbLudV+n3NXGnkWC/qzSS/HXIETZkwQDJG/q/3xq3o9UkKNPPG08LAC7v9bujsL+86RtiSHRIszI6Kg3PBCz/iNpFD3GmsxbuP1PnBxX6bJnA/v6+rNJF/9X8IRRH7S1SGUuThmIJMFHKqoN4XDtGPNKNGolw+cHz/r4ldLrcwxWOKHrix/Xo+rMIjz99UpoK0FL6QFNoI9BnEq653rnBFrDwh712G+DofIFMiMDYVduEvemFi4ybjWsSVFgJxmEPHQQCBfFYvK6pEg7xHMyHdn3QyyVOVJ59a8ODlnRlMaU5HgHqwbiKM4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xMJuC//XkJ2/kpEGu7UNsIUc7id0wVb31FkDXo8gXI=;
 b=cRiqRAtIelLtFrO1giWMQVyaihZRSknf8vswLOA59BpzfvSPU55OghrLcSIExXzAQJysBQ/UjazdtMK/UPv88Iy4YAubNLwYCMgRnfPb6aMNcgxY5ZOz6kgptILeKN9HTToMHgzko7CFu88WpFxnfH6k4SGO2hNDVljSx6adpsk+ijjX8zRAA1ljuq6aDVSccZYHqnltjwTM5eIeqddeIPJjSZhGVXS1lPMMcu4hTDSaLsg40gFI7iax5n4Ox4IWvJ32P3UBe69IC5t0DkmXWu39alaGF33E6foWB0CLebhLenblwdQCJV7RY/kDbhx9Fz2U4Zv3htYxoEv9JtoNjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xMJuC//XkJ2/kpEGu7UNsIUc7id0wVb31FkDXo8gXI=;
 b=ht4WpLtj27ZofAJqJ9i+xhZe8Wpb4gNP/KyJxe4FfTY3eCI57hTxw+5G8AVnyvUWYzi5VJmNOHiEsVJADGHSYPMTKo+xEKmekSdzwz0VBakwFlICMvGzKmG0oad27blLY+3T9Ez+XncPzAZygjQjayi2F5wM29IOesSzWmglAIW9RQfm/ES977T7tjtRxkFiUev4zAI8811Uhr/czS2xTxL/YdsLhZoFOx2/jaALj59VpwRtAZnOOaU+HNOEsCq9wp64veiDLQRf0ZDzpopDSg5InqlSynTq8b3H02PeUOy2HlqYsUW4CyyC292+Nk1SXNOX67cJTm1iSl+XzWSsGQ==
Received: from CH2PR15CA0017.namprd15.prod.outlook.com (2603:10b6:610:51::27)
 by DM6PR12MB4057.namprd12.prod.outlook.com (2603:10b6:5:213::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:08 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::87) by CH2PR15CA0017.outlook.office365.com
 (2603:10b6:610:51::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:45 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:44 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 118/156] drm/nouveau/nvif: rework outp "dp aux xfer" api
Date: Wed, 17 Apr 2024 09:39:24 +1000
Message-ID: <20240416234002.19509-119-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DM6PR12MB4057:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cd9d1e-7e03-428d-b415-08dc5e6ef856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QI7ruMfKAthntgViQHFGpz0PyJFUYTuvLWtSBNTdReFljVcC3FQWJ7P+Eb+jxK5HBlxz191nq/iZee4QWOdk/x5YD0yRS9RGzhOlsswaK/tckew0PL58C/SFpmBmaMo3xPwzRVGpmdq2TbZxfudApknuron/+tw+9TicM2vTgie5ObYy7ZGCal9I5oS/JqZGZTZhDH9yo0EG/wxffPI2lz2nRbC+6gWbX0Rs/u4Sc5lVwG+F50oMe6WMn7sgXN6yxS4lXKeyDHYElHcHEZyPdA07I+sPzrqLhxs4BjEXcaudcNGrpuF3JCUY9Wyi0vY66whXNEapfXzkJfgbj8nkmSewilw7shSYmDOxoS1QC+sSGzEs6eqjxr2StHIvPwrZAb4/B4HRmzIa9EAVOxfrx2FwFqReeHLpNaGs+2hKBg6Hrk+3Yev9tsqEJbL5XtwQ1wu0N8CutEhjaaZurxJhgae0L99G+G7Ly5D2zF37QuT4qg2G97RMKA+GSKBA+4kir2MUpyY8GZ1jwd70JXeFMwDSxbNQpLK8JHeuaZarThEWO1qak2V1l3f254kZLEic30uwiw1BZHC6sdy9o501PmfYPFUKsk56K+0eeaLkYuGBPnUludpNTozUBEk9lJv/LTPCBuJBLXqjHNc7i9+2WEXmrANVsGw/+p86kT1k0O4DIKERKrzztLi9UxbgB9Pkb7gEoMcudlkwE5ZZ1CNIQqJ/udNNuhlEHFxaHulatf+6Y8mMrPf7uzg8SlQTan+9
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:08.3894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cd9d1e-7e03-428d-b415-08dc5e6ef856
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4057
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
 .../gpu/drm/nouveau/include/nvif/driverif.h    |  1 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h  | 12 ------------
 drivers/gpu/drm/nouveau/nvif/outp.c            | 14 +++-----------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   | 18 ++++++++----------
 4 files changed, 12 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 0dd85d4fa9ab..2069eedde843 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -327,6 +327,7 @@ struct nvif_outp_impl {
 		u32 link_bw;
 
 		int (*aux_pwr)(struct nvif_outp_priv *, bool enable);
+		int (*aux_xfer)(struct nvif_outp_priv *, u8 type, u32 addr, u8 *data, u8 *size);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index c0981a5f9e87..b036197aadea 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_DP_AUX_XFER   0x71
 #define NVIF_OUTP_V0_DP_RATES      0x72
 #define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
@@ -13,17 +12,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_aux_xfer_args {
-	struct nvif_outp_dp_aux_xfer_v0 {
-		__u8  version;
-		__u8  pad01;
-		__u8  type;
-		__u8  size;
-		__u32 addr;
-		__u8  data[16];
-	} v0;
-};
-
 union nvif_outp_dp_rates_args {
 	struct nvif_outp_dp_rates_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 8b09a7ae9876..602362aa0203 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -157,24 +157,16 @@ nvif_outp_dp_rates(struct nvif_outp *outp, struct nvif_outp_dp_rate *rate, int r
 int
 nvif_outp_dp_aux_xfer(struct nvif_outp *outp, u8 type, u8 *psize, u32 addr, u8 *data)
 {
-	struct nvif_outp_dp_aux_xfer_v0 args;
 	u8 size = *psize;
 	int ret;
 
-	args.version = 0;
-	args.type = type;
-	args.size = size;
-	args.addr = addr;
-	memcpy(args.data, data, size);
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_AUX_XFER, &args, sizeof(args));
+	ret = outp->impl->dp.aux_xfer(outp->priv, type, addr, data, &size);
 	NVIF_DEBUG(&outp->object, "[DP_AUX_XFER type:%d size:%d addr:%05x] %d size:%d (ret: %d)",
-		   args.type, size, args.addr, ret, args.size, ret);
+		   type, *psize, addr, ret, size, ret);
 	if (ret < 0)
 		return ret;
 
-	*psize = args.size;
-
-	memcpy(data, args.data, size);
+	*psize = size;
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 36b4ea9a10fd..f7226bcb9ef4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -181,17 +181,15 @@ nvkm_uoutp_mthd_dp_rates(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_aux_xfer(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_aux_xfer(struct nvif_outp_priv *uoutp, u8 type, u32 addr, u8 *data, u8 *size)
 {
-	union nvif_outp_dp_aux_xfer_args *args = argv;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!outp->func->dp.aux_xfer)
-		return -EINVAL;
+	struct nvkm_outp *outp = uoutp->outp;
+	int ret;
 
-	return outp->func->dp.aux_xfer(outp, args->v0.type, args->v0.addr,
-					     args->v0.data, &args->v0.size);
+	nvkm_uoutp_lock(uoutp);
+	ret = outp->func->dp.aux_xfer(outp, type, addr, data, size);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -563,7 +561,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DP_AUX_XFER: return nvkm_uoutp_mthd_dp_aux_xfer(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_RATES   : return nvkm_uoutp_mthd_dp_rates   (outp, argv, argc);
 	default:
 		break;
@@ -704,6 +701,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.link_nr = outp->info.dpconf.link_nr;
 		uoutp->impl.dp.link_bw = outp->info.dpconf.link_bw * 27000;
 		uoutp->impl.dp.aux_pwr = nvkm_uoutp_dp_aux_pwr;
+		uoutp->impl.dp.aux_xfer = nvkm_uoutp_dp_aux_xfer;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

