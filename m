Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0173AABA713
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 999B010EBC6;
	Sat, 17 May 2025 00:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PlUGDRhc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E5410EBC3
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwEE2Y8xoejRwdEll0k/S5xzxY2VDpi3EXkjCO0ojbL4CnyhUtXW8cDNN6tFF/d10XW54y61PTdnYyI1nqvVzSZVGL8xb0mGfRup8MpxDfOSqbwd95dsdM/2AQwYYbSB7TP+0C8Ow6dMuE/gpuRnuIz5jrpFnMjCk4D02XDUEQVkLTKU/C4Rll6hcfKvdW3iKh5tZUbOn5MJ4Psv8c3lv35P2XUfzR/g3vqTmidykdni2WdoNrrTKTHGVQgGCQVlslR6Uihnnl5jhnD7aqNFVyoraG989GyEp5KwA+zWrmIF62qsBjqa1Hy5MZgUycZi8ex/myBb1mZuwD16VgOh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2ffH3bYVtBqT46Icbg3+SbFp+FStOn6b54JPkDFHMk=;
 b=KS7N/leWFu4ePRo7GWQwZ8DZyKViCRkDXh1toc5U9y9rDgAeqruDkaDjOlc8AxL/1D6Nwpuspp+9rAyQHm0TcwY3tzKqkUjWl3Qh95HsNh+jdxrurjVhrVWCCKCaaExVTap6bhshjxSdqzD4Vo72+YZCB8fckGNmmimrD70rGa/7ZQ9gl3JkxwZN0qTWNsZ3OSLzENRFPB5N00XB47gyLkMThpRxE456jlNPPd9Nab/Fp1WtJutcxKZEFaMG/qzJiV0CHd96ezphweLCBNSXy+WHj7hTe4TRpsYWzzBqzG5wQDEEsQgNWWuvNcDW1ye9mTN8G95pvXkldv4S7IVN8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2ffH3bYVtBqT46Icbg3+SbFp+FStOn6b54JPkDFHMk=;
 b=PlUGDRhcdWUujE0c3IzA1D4uQnNjRM/gAQF+QwxRVtn2xiC6Z8eunsouJeq5l13CBpQbVd8v465TM2pzERZaxh2+pbcVCajWt0YFI+lyqfPfH2Ef3NXFxYFDpPqSato+qaz6OO0ASXEhAE1BlZh/tKIF43O2SSW5Rj7UTt2PPSvhoIdt8taA8qW3tCeu/6CMzCXCRV4hcLNvFL78cdkUUq5lSRf1UV7pIe/Xw71wBjQa/8FOrFG2sY4oKE+nqL+0aieSXxEYwKVmxQ5/VCpdLDWiHQrVhd8NG3HogsoJgCdPwRKzWwHO1tdegWWk6fb5GeVmcgR6oljVJaov6iNfEw==
Received: from PH8P221CA0046.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::21)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Sat, 17 May
 2025 00:11:02 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::f5) by PH8P221CA0046.outlook.office365.com
 (2603:10b6:510:346::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.24 via Frontend Transport; Sat,
 17 May 2025 00:11:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:48 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:47 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 27/62] drm/nouveau/gsp: add hal for
 disp.dp.set_indexed_link_rates()
Date: Sat, 17 May 2025 10:09:19 +1000
Message-ID: <20250517000954.35691-28-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|BY5PR12MB4177:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ffa139c-d68a-4a0a-b36e-08dd94d74e8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cSqGJiqwKk9k2PrBMVISNnvW2o3LX4xDSw0RPlfkq/HCEky66iai4vwtJsVy?=
 =?us-ascii?Q?/52A71LpZ04P/eptu/6AJ3+S3ZGiAUoV/696lXJYgqe9sQTxP+Ou4WOIVi7U?=
 =?us-ascii?Q?p/EYsOXyjc40ifvqzHWeyLXnmvbUi7JFUMDtLP0Yvra8hDNAoCQrLPuDxrfT?=
 =?us-ascii?Q?gnEZ/OuM4GypIEJZCAeRCSl8ilPOnWvlRJuBfwEE13VzpVDIw/RD9l6XqwGs?=
 =?us-ascii?Q?7bnNX+PtBPzIU4O6tzIC4b4KE/JmiHx/6xervxqNzgm44NakA9Jjzj/BfbEj?=
 =?us-ascii?Q?l8JQDDSJ8l82BmqIQSVyvovxlUtOR0ZQWpeVfhB+ABN8AIwBEGm9f8U3wm+Q?=
 =?us-ascii?Q?AdStIgG4662qXg8wSfiuUNpde75mQ2mAqVwk2C6oxHdk/ghPzhfzpXOHkMA0?=
 =?us-ascii?Q?ag4h23/vafJMrOGdS4eZlOENTD318m7DgXxjcrCHjY+JejD4oox8GXhNOzPF?=
 =?us-ascii?Q?0Sa2LJ8LSiFLM4a/rGesPqGOQubEz59ksii3vsWNn73BWJJSzMraia/vokD4?=
 =?us-ascii?Q?tdCiaRpNhzK9WuwIkLIIcYkoKVaJq/petr3WyZn0x5gP1IpmC4m8xB77NSCU?=
 =?us-ascii?Q?/bHuTUczqnQof69uWgJcZpNXA8hFw4HS3oLP6uKNXurceXhQc+v1Vv5uC20C?=
 =?us-ascii?Q?/TFEURpXz7NoVF82tLBW4/TguYF0SgTFIURYNasRM+n+DgxJFC+L3G0U2zLX?=
 =?us-ascii?Q?zqsoSccdEULKkCIvHzpP5DExOJVp5s19OIdbJ+27gtW7rE+zXirZZTJ3y3nQ?=
 =?us-ascii?Q?awiWFVxH01bR9V0KuUxXp9/0qK1TDh0gi38YG11V9vJpRXQupCnkTaq0XlZx?=
 =?us-ascii?Q?RgZKzwWdpKva3stWn6L0X9pzdKk/bJYDdI8Z2ZF4vcw9wd6PV7pWcehjZ0DV?=
 =?us-ascii?Q?Xm9SSdIdy4T+SIHOmGH4Ptl+fBVwlqHV0j25RsIINLVwgzsb5iCi/9hZxVE0?=
 =?us-ascii?Q?aZYXP2QBuOWGZHjTBAYU2v1ZHmqa/WTxdsjMjB8zWqPIGaU+zpxjNEf25Rs5?=
 =?us-ascii?Q?Sj80eCNTAYNsLVhjORw8mSHuFqMYZ5pawTdRSgh0RITkLklKOPR315sEiL/2?=
 =?us-ascii?Q?Cg9xevpwyKjIG4h07XCLTG3mGcLrLpnwiFm48nEQ2SZSzFQ7BC5ZP0jzjOJQ?=
 =?us-ascii?Q?l964LiX5CtTaXCrzLKc+GEC9r65Kik2L+MfmLyytTpva3nNgcB8X1mWfeKon?=
 =?us-ascii?Q?7HEd5V+OTRaKAFajW+nK3+Rmy1v/V42EXcW7Bb/Tt4y9cAXXZIOXJnviRO8i?=
 =?us-ascii?Q?xCK2gLgpIQRatQMKVw9lf94OY0k2PcYxSxK0N+Fh0/iSmcNWBoQ3SiZpEY0c?=
 =?us-ascii?Q?RmbeREBRfPdk6mbakO5+6DGIo5WfZJiTjkt6VU/8UsB8Sp7iv/az7ehfAS/w?=
 =?us-ascii?Q?QQjn2E92OIYTqygmqLJzfU43nE5wd1aZHNOVYs73SKN6zm9ngIXuMvJyXzos?=
 =?us-ascii?Q?YBRm47D1k+oHwrkvLf6/Hmgy7OWF+fxf5qrScFruAK3jDObtcujY8fFvOZN+?=
 =?us-ascii?Q?zQpYq5Bc/vHMdirC6Y+7rHHgCbhK+mujZWoT?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:01.2541 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ffa139c-d68a-4a0a-b36e-08dd94d74e8f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177
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

545.23.06 has incompatible changes to
NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 21 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 +++++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 1e9bbfd402d3..9eff06e12fca 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1021,15 +1021,11 @@ r535_dp_train(struct nvkm_outp *outp, bool retrain)
 }
 
 static int
-r535_dp_rates(struct nvkm_outp *outp)
+r535_dp_set_indexed_link_rates(struct nvkm_outp *outp)
 {
 	NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS *ctrl;
 	struct nvkm_disp *disp = outp->disp;
 
-	if (outp->conn->info.type != DCB_CONNECTOR_eDP ||
-	    !outp->dp.rates || outp->dp.rate[0].dpcd < 0)
-		return 0;
-
 	if (WARN_ON(outp->dp.rates > ARRAY_SIZE(ctrl->linkRateTbl)))
 		return -EINVAL;
 
@@ -1045,6 +1041,18 @@ r535_dp_rates(struct nvkm_outp *outp)
 	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
 }
 
+static int
+r535_dp_rates(struct nvkm_outp *outp)
+{
+	struct nvkm_rm *rm = outp->disp->rm.objcom.client->gsp->rm;
+
+	if (outp->conn->info.type != DCB_CONNECTOR_eDP ||
+	    !outp->dp.rates || outp->dp.rate[0].dpcd < 0)
+		return 0;
+
+	return rm->api->disp->dp.set_indexed_link_rates(outp);
+}
+
 static int
 r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
 {
@@ -1726,4 +1734,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 const struct nvkm_rm_api_disp
 r535_disp = {
 	.bl_ctrl = r535_bl_ctrl,
+	.dp = {
+		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
+	}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 2386e419be62..9df95c5b9961 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,7 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 #include "handles.h"
+struct nvkm_outp;
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_wpr *wpr;
@@ -72,6 +73,10 @@ struct nvkm_rm_api {
 
 	const struct nvkm_rm_api_disp {
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
+
+		struct {
+			int (*set_indexed_link_rates)(struct nvkm_outp *);
+		} dp;
 	} *disp;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

