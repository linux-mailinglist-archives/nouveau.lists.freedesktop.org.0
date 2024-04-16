Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1D28A7923
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BA3112F6B;
	Tue, 16 Apr 2024 23:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y6IWfQX3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2086.outbound.protection.outlook.com [40.107.220.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C364D112FB0
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/X+vnywIsY+Pm4EyBT5hVHG59MqI7XSoFDotabtRl1O7Ackg+9o2oweA9UedjFEF3x1hjyT6FJb5PwEBXdvUB7HGWJOA5vevixuti9I0fIKMLnGa0QN370VKqZU4RlcfNY62r5+WsqPqqY1z1YIdnOXrcXRW2iFfYNaHkwCVmvbLxQAGh50AyQLjlg66cqMJ3UXAycxnGwdM0C78ff9AqUKGPbj089NMxdf4exVjpsiYDK/SgEu50l8fa0hkAhycMU1ZsJsktpQgp7u8JAPJMpsOoDBSM7DUsQ8aT6H3GGH9ezAbdRqwJ4REBSVS8WtOQ6cqg7QL1f1FgEF+Yl2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qJzQmz45j34lB27EArLNsOfhX5kip6P0RbwpbbN0sw=;
 b=dKO9kldCiYglwXX3006piPItpwOipQ2i1vJjqvENQ0t2knMjziHQWH25IQsO0l48qk4LUPmGUV5C4uB5MhPSmWb3k6PPo8iFW1BSI4olDDYz9eOaO720ypfIKqUt7Njrda8TXfmCnfMO/L5x1B7cy3mHZmsNtAlV4nlS4rrXA5iMNPmn7HJSvfIUsfR0q3u22LrmLyd+V1gG3ZfASDeSc5S8n/KtjUCs0hMvihtLXfVl60e6x10roPAhrWN6lfgX1sLuGGlSGxmDlvbOcUUlu1sGZABGpV+4ik0vHbpGBqGxEgxxpntPpSrlu1EkK9ewkUzkl8EaAgdAOIxz7HqD6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qJzQmz45j34lB27EArLNsOfhX5kip6P0RbwpbbN0sw=;
 b=Y6IWfQX3Q1H9CU8irZs76nMDuNMnOdelPKrz2/i6TY0rfCta1jnEEGKMYumjTUFP96aUUXKgaiDuIVn71zQp0zks20hIeKquwCP70MkxquYpd1RFWa+4boJnLVb1P7BBqZ+ZLRRWCrIKLFqr4Iq3Tuyn09cXiZ3mSHRnZ4KrTMlfUyO4whBMVXAoe6yu8FHCsgrqU9B+jFc2fbYTXELYwmkPcBgfFV7yzhzaqaZK82I1M4NLB0xs1Sd06vjb+fB31oT/im2bt8GicudJWY1/XaiSvFEkJ0xtHCWxqLunHh21NrscoYaVTXnBS4EU+lVhZEVwjLO4okiwhpJoIa+3BA==
Received: from DS7PR03CA0113.namprd03.prod.outlook.com (2603:10b6:5:3b7::28)
 by MN2PR12MB4077.namprd12.prod.outlook.com (2603:10b6:208:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:03 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::4e) by DS7PR03CA0113.outlook.office365.com
 (2603:10b6:5:3b7::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:47 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:46 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 120/156] drm/nouveau/nvif: rework outp "dp train" api
Date: Wed, 17 Apr 2024 09:39:26 +1000
Message-ID: <20240416234002.19509-121-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|MN2PR12MB4077:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ce3dd1-aba8-4bed-4e9d-08dc5e6ef53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3emE7254TEMVW+XNu5djHB29EbCdhlrUK16UbxO/g0kN8bplm0v5wfh2mNOnhGSzGJpUeZlTryRSI7ecQeGNCENcprSDQtTxGWijgUH9S0zLsD0JUWXDW2cw4o4PaRh+e2+LA7YeuOPu5LjuoUr7iD+/VpKHGgvPbfYSf0fcK41z09NBF9WULvcYxNnwEOAzYovBRbxOEJXm0DeLi9kuLOGhaZJ+uaY1ZfWyTz2uUlZwnghxtPa4QoFgU0qLE0VmBCnvjx1Cj3iea7n9OE/+MWQGJxzLh60msAu1J/iBrRsAUFJDVoAabOf6bOEf88okE02+1bdJmysq0b/xSg/c7uPHemwxYCumb1WiaSmTGkuUfvm74QO1R8cj/d1hg0xInow2xQ0/kuWvwbIq5R4WkeMY17zRLx02qH7KkLUSAbAGgxue85bcoA2ekptCyZxg3sZHTChoz1ho4MdFOTxDTUKOU2QP6bWXmPp9Y7UN3KQ2qAHWgWklWfuLgc0b/01M8Vqwctnq3qABoTNDw67noU1PFfQ+G6a6LKY9WxF7PIQww1EoMKePW8V2otCR6Uh/4X8t0x/fW7Q7oV8yxqgDSkomhQB67gDyTYFWyTUGnv4Md2QY4fMc8eC5b/iIBJdJW6izDXUKOaaED2VnnlA9MEzEuLIUWDtDbhtJO4vMU8H6TNWQCC4PKSEnXUWXvgva7UuvYIVynB9bnYmFIiHIwgKAAYAeovmg0uO+Z6qzLnir69GP1TzIKd/cqGuCyxGr
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:03.2210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ce3dd1-aba8-4bed-4e9d-08dc5e6ef53d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4077
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  4 +++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 14 --------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 16 ++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 33 ++++++++++---------
 4 files changed, 25 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 9395ddad65bf..2660f37c5443 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -1,6 +1,8 @@
 /* SPDX-License-Identifier: MIT */
 #ifndef __NVIF_DRIVERIF_H__
 #define __NVIF_DRIVERIF_H__
+#include <drm/display/drm_dp.h>
+
 struct nvif_event_priv;
 struct nvif_client_priv;
 struct nvif_device_priv;
@@ -334,6 +336,8 @@ struct nvif_outp_impl {
 		int (*aux_pwr)(struct nvif_outp_priv *, bool enable);
 		int (*aux_xfer)(struct nvif_outp_priv *, u8 type, u32 addr, u8 *data, u8 *size);
 		int (*rates)(struct nvif_outp_priv *, struct nvif_outp_dp_rate *, u8 rates);
+		int (*train)(struct nvif_outp_priv *, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
+			     u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain);
 	} dp;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 327ff9aa3ae0..5db1f718e82c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,26 +4,12 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_DP_TRAIN      0x73
 #define NVIF_OUTP_V0_DP_DRIVE      0x74
 #define NVIF_OUTP_V0_DP_SST        0x75
 #define NVIF_OUTP_V0_DP_MST_ID_GET 0x76
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_dp_train_args {
-	struct nvif_outp_dp_train_v0 {
-		__u8  version;
-		__u8  retrain;
-		__u8  mst;
-		__u8  lttprs;
-		__u8  post_lt_adj;
-		__u8  link_nr;
-		__u32 link_bw;
-		__u8 dpcd[DP_RECEIVER_CAP_SIZE];
-	} v0;
-};
-
 union nvif_outp_dp_drive_args {
 	struct nvif_outp_dp_drive_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 68af891505d1..f20846a7f487 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -113,23 +113,13 @@ int
 nvif_outp_dp_train(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
 		   u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain)
 {
-	struct nvif_outp_dp_train_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.retrain = retrain;
-	args.mst = mst;
-	args.lttprs = lttprs;
-	args.post_lt_adj = post_lt_adj;
-	args.link_nr = link_nr;
-	args.link_bw = link_bw;
-	memcpy(args.dpcd, dpcd, sizeof(args.dpcd));
-
-	ret = nvif_object_mthd(&outp->object, NVIF_OUTP_V0_DP_TRAIN, &args, sizeof(args));
+	ret = outp->impl->dp.train(outp->priv, dpcd, lttprs, link_nr, link_bw, mst,
+				   post_lt_adj, retrain);
 	NVIF_ERRON(ret, &outp->object,
 		   "[DP_TRAIN retrain:%d mst:%d lttprs:%d post_lt_adj:%d nr:%d bw:%d]",
-		   args.retrain, args.mst, args.lttprs, args.post_lt_adj, args.link_nr,
-		   args.link_bw);
+		   retrain, mst, lttprs, post_lt_adj, link_nr, link_bw);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 00b66d400f68..673c8c10c782 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -136,25 +136,28 @@ nvkm_uoutp_mthd_dp_drive(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_dp_train(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_dp_train(struct nvif_outp_priv *uoutp, u8 dpcd[DP_RECEIVER_CAP_SIZE], u8 lttprs,
+		    u8 link_nr, u32 link_bw, bool mst, bool post_lt_adj, bool retrain)
 {
-	union nvif_outp_dp_train_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!outp->func->dp.train)
-		return -EINVAL;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
-	if (!args->v0.retrain) {
-		memcpy(outp->dp.dpcd, args->v0.dpcd, sizeof(outp->dp.dpcd));
-		outp->dp.lttprs = args->v0.lttprs;
-		outp->dp.lt.nr = args->v0.link_nr;
-		outp->dp.lt.bw = args->v0.link_bw / 27000;
-		outp->dp.lt.mst = args->v0.mst;
-		outp->dp.lt.post_adj = args->v0.post_lt_adj;
+	if (!retrain) {
+		memcpy(outp->dp.dpcd, dpcd, sizeof(outp->dp.dpcd));
+		outp->dp.lttprs = lttprs;
+		outp->dp.lt.nr = link_nr;
+		outp->dp.lt.bw = link_bw / 27000;
+		outp->dp.lt.mst = mst;
+		outp->dp.lt.post_adj = post_lt_adj;
 	}
 
-	return outp->func->dp.train(outp, args->v0.retrain);
+	ret = outp->func->dp.train(outp, retrain);
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -545,7 +548,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DP_TRAIN     : return nvkm_uoutp_mthd_dp_train     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_DRIVE     : return nvkm_uoutp_mthd_dp_drive     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_SST       : return nvkm_uoutp_mthd_dp_sst       (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_MST_ID_GET: return nvkm_uoutp_mthd_dp_mst_id_get(outp, argv, argc);
@@ -685,6 +687,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.dp.aux_pwr = nvkm_uoutp_dp_aux_pwr;
 		uoutp->impl.dp.aux_xfer = nvkm_uoutp_dp_aux_xfer;
 		uoutp->impl.dp.rates = nvkm_uoutp_dp_rates;
+		uoutp->impl.dp.train = nvkm_uoutp_dp_train;
 		break;
 	default:
 		WARN_ON(1);
-- 
2.41.0

