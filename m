Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB08A7924
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD0E112FB5;
	Tue, 16 Apr 2024 23:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eYdAnBr1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD1B112F2D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXXW5M6e8gGNSlnfAow2uloXPP4AGmbIolg4ncE70Mdx2s/LfocWSOfaJ5ALF81FnNzybmn4V0Sa+fitoMDqzxzWtQmyLAqKQAT7AwEnz7mfNQh0b8zqOWTsgzaj+Rx/yh+g9yQqfQveTX2yteE4Sc98fQO8HTTRHayaKKKc0N5XB8BYw3NqWKpZ0Z15FT3AwXZq9MTLewe3E6mdELH1GOn4No4/6ox1MLlAdQglcbVK7lIDL2qNiPDLZqgsYQBkSNLNwYpe9ALPdYfAvA4ekSTX6PKAl34hpY3eR4DjQiktl7DxcyOqUCVtUS1s9bL8CNYkVJlQIPb13ISC/RXSlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1qtoRtHwTnFSN4HTKVYQsTK0b64jZZz1xI7gp/jiSDY=;
 b=hcCRK/cHLyz+ZmG0QAx91cP4N0p0ER4EqQL8ioSUvIs/Spl/PZceVyiUknjA4TdRRWiVTQqvzKk9hqGHIAmtVFXH+OkArHZnW7vYZ1ixGRZHt5xXaKUcCBafK/XN3PEhP2d+i2CKsh2JzzdL7xTb+ZjTTwgj2iduTLxFSzA7fZiZ4mcLtYCYvIu7kH6XrgTZH+Crxj9UNPCcjTsXNdmQgjs5P0N8grDuGy/piGQMJa8eWDW8m2HrPsb2sjSJz5JEdA2VP+KDL7wKcM72QMdDp0NmUi6P/I2TUU6ecrdd7uiTs72M02Wnp2SacbfKXH/Nwtt45/FraBAyFuzQcEb0NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1qtoRtHwTnFSN4HTKVYQsTK0b64jZZz1xI7gp/jiSDY=;
 b=eYdAnBr1IiUuf3MYhPXzlLJ49Tovri4y6hwB3EM38BJyBPCp1am4ibygckBkGVi/DNVhnMHrCiQP3x9MQMSaLD3HdYR2f2g/CUn8U6bwt0WDRbN/C5I9f7ciCyyAbOC2cqlmjTNIYTeSG/HTAzcyLljRztovFJObtBgGzK9dvIJH1KgfSsMMm7FJk0SONgsNLNfxPrezSRKPmtTMpipdNWqaoDneyPsx2IUBRGCyynmhXIV7Vo1kVLDt9II3YPhJVFbuVy3DgJpvTfa8OTR4f+L7zbxJIR5V70r4VNpCRh2Ia4xNY98Aqm8OOHPsej/gfTePWpHpU3Pmc+hECzcYNw==
Received: from DM6PR06CA0100.namprd06.prod.outlook.com (2603:10b6:5:336::33)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:04 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:5:336:cafe::3c) by DM6PR06CA0100.outlook.office365.com
 (2603:10b6:5:336::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:49 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 121/156] drm/nouveau/nvif: rework outp "dp drive" api
Date: Wed, 17 Apr 2024 09:39:27 +1000
Message-ID: <20240416234002.19509-122-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: 017919cf-cd80-4c39-97fe-08dc5e6ef5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WZMGpErz2B0bEXFtqZVf7qmTSRiLw24XXU+GcE1eSa8ebynymGhBPR1L/fXNtwT293dGVQhpNHO2t+j3kPFzsqRQY5oWpS7gDolJiEJF+xgjCVJzgJNvGz3yrPQ48PrDmm1A7u/8tvPNH/pNGBLtBZ7aN9j+twkisZkC7HLP5FgyyJosLKq502YHxOsJFeU+ZdgXhGz85Pq5T8ge5qSsWU2P9P9XyZ1kVcvYHD99F8eKiKJzidgFvAuLHbPeRqXongLqqt+fjTxbu405uZ7JXPkHwujOFU3XeqCGWiTqI7XeaICfRkE7B+LTbsBLcOQBC4v7acFw/oM+fCGd7qhLkH/GATRceVq8Q/8k/743rUrjJ2hEza+zt3PELxtny+haJFA11zl1Z0mrEFasDB8BsHzR/0BRrRkkyB1E8YSu+CeQ9zGGQDSzVUtb424vaKPngoIXMYH93U3vYnUXJnXzpGpR05MyCdkm1MUfTW5HDRMcchGQZY2iKS2ueqn0vY+e62qm/8YQNvNiyRvA8H7+9e9WDMACq8q0DOFKT50qdnineFjwWGwPxbhTXj7SosboJC6zzA0Iyk76Fp69B1FIkQTR+poQeKCjtxcG4aYK4/9kBt0yk/9useAMVGa9OWUMKvY3WE9PlGz1NU8MEUgC1zw+khHJJu0Ab5WJSof/qjYYNs5iizC52MY3/RULA8WopZn/qouZUSvLEPmUKOxOnZ/77ZBKQVvS1ZMAYI52IO8iDzpJSjNehUACgdbjsol+
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:04.3098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 017919cf-cd80-4c39-97fe-08dc5e6ef5ea
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
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
 drivers/gpu/drm/nouveau/include/nvif/if0012.h  | 13 -------------
 drivers/gpu/drm/nouveau/nvif/outp.c            | 12 +++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   | 18 ++++++++++--------
 4 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 2660f37c5443..db6fb1347b72 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -338,6 +338,7 @@ struct nvif_outp_impl {
 		int (*rates)(struct nvif_outp_priv *, struct nvif_outp_dp_rate *, u8 rates);
 		int (*train)(struct nvif_outp_priv *, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
 			     u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain);
+		int (*drive)(struct nvif_outp_priv *, u8 lanes, u8 pe[4], u8 vs[4]);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 5db1f718e82c..8b0f90327187 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -2,24 +2,11 @@
 #ifndef __NVIF_IF0012_H__
 #define __NVIF_IF0012_H__
 
-#include <drm/display/drm_dp.h>
-
-#define NVIF_OUTP_V0_DP_DRIVE      0x74
 #define NVIF_OUTP_V0_DP_SST        0x75
 #define NVIF_OUTP_V0_DP_MST_ID_GET 0x76
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_drive_args {
-	struct nvif_outp_dp_drive_v0 {
-		__u8  version;
-		__u8  pad01[2];
-		__u8  lanes;
-		__u8  pe[4];
-		__u8  vs[4];
-	} v0;
-};
-
 union nvif_outp_dp_sst_args {
 	struct nvif_outp_dp_sst_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index f20846a7f487..3d4461e3a2cd 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -94,18 +94,12 @@ nvif_outp_dp_sst(struct nvif_outp *outp, int head, u32 watermark, u32 hblanksym,
 }
 
 int
-nvif_outp_dp_drive(struct nvif_outp *outp, u8 link_nr, u8 pe[4], u8 vs[4])
+nvif_outp_dp_drive(struct nvif_outp *outp, u8 lanes, u8 pe[4], u8 vs[4])
 {
-	struct nvif_outp_dp_drive_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.lanes   = link_nr;
-	memcpy(args.pe, pe, sizeof(args.pe));
-	memcpy(args.vs, vs, sizeof(args.vs));
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_DRIVE, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[DP_DRIVE lanes:%d]", args.lanes);
+	ret = outp->impl->dp.drive(outp->priv, lanes, pe, vs);
+	NVIF_ERRON(ret, &outp->object, "[DP_DRIVE lanes:%d]", lanes);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 673c8c10c782..3d5b6cee97bc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -123,16 +123,18 @@ nvkm_uoutp_mthd_dp_sst(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_drive(struct nvif_outp_priv *uoutp, u8 lanes, u8 pe[4], u8 vs[4])
 {
-	union nvif_outp_dp_drive_args *args = argv;
+	struct nvkm_outp *outp;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!outp->func->dp.drive)
-		return -EINVAL;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
-	return outp->func->dp.drive(outp, args->v0.lanes, args->v0.pe, args->v0.vs);
+	ret = outp->func->dp.drive(outp, lanes, pe, vs);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -548,7 +550,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_ID_GET: return nvkm_uoutp_mthd_dp_mst_id_get(outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_ID_PUT: return nvkm_uoutp_mthd_dp_mst_id_put(outp, argv, argc);
@@ -688,6 +689,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.aux_xfer = nvkm_uoutp_dp_aux_xfer;
 		uoutp->impl.dp.rates = nvkm_uoutp_dp_rates;
 		uoutp->impl.dp.train = nvkm_uoutp_dp_train;
+		uoutp->impl.dp.drive = nvkm_uoutp_dp_drive;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

