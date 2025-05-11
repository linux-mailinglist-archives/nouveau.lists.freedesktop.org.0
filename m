Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA83AB2B6A
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35AFF10E230;
	Sun, 11 May 2025 21:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gPYRyE5J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233F110E230
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUmq2NBEZsXZeSFcAfAxcMsVrwISz3d8e1SD1AmWXJf/iitnm7zuLaxaMaj5a8jo9KIfqvagRN+ErH8vuXphHg3r9d1Ey9kwhufKojm+9JTJ7o10vRwmrQkdr58WQeEkofFZphirT3XduVzdjjjbZaeBC/5Dv5RYBOjmyS1r4w2tslCiNc3x2rB0zbjMkh0D8WwEtFClSvhYXuxF2U/19kDGj/oeJBe0hWn+3gB6DGGDB+f/+/T+UAj2f467nXwEe8821wXaT9ybo6Vg9z/5u/8f+iCjtUU4quDF4fSHdw5WgXZcez3kwIfUI/ma1TpWSkjnsLGDHk1TW6cLxu91CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JF5TEmidLk+6hqZRMC2MZB6HRpnpuf+vfn2LDM1fYQ=;
 b=pZihF+4V9TIZGvCM8I9t/LXFTKOHpYMi739zdKFki+KFFegcPpRb0P2eVCyxr3KtujB9Fak5Kq8DlUArA893ZOnuHZk4QUv6yPNCeSd/p/RAP9CLZ3Zdtk4pYCr9npLi9hO7Iq7hLue/H94mTAir7V6BPgfM7iy77YFC1LAnjkWJ9fE4fqxtoZ2yNGHdcGKSfeMj6x4djWvfycJDMdsCrafOBX4OP0v0zPotq6KmObr9KptJ36717338uEcyOL301CwF6JyYttmjT4wQanRT6cp+A7yZEA3TnkDFL85YnPI9gt2bATUb6hPuxBn0WsitGr2MV1r1KQBwXdkzGMUdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JF5TEmidLk+6hqZRMC2MZB6HRpnpuf+vfn2LDM1fYQ=;
 b=gPYRyE5J0iu0oJnuWbSAY8/fgvOjDraKWTPQiVmhMUe/IHFaBdoCJ678xmjyK0MK0u700368rzy2PbUSNOo6C3LR3UYdBRyrBM1vfXYEUYdXgaYlJsAhU7akshc4gV3kSL2RoU7QkSR+dJl1RwskAB1kbIhomnLsRikksLEIOmfgBwPZEMymw4+kM5VNtC7KzcVHFBJwvL20xHiKQwMMbUt7Ru01NasK8YP6SteuVf10ZpAukcW5nBqEiGS3ciCalQUumZGVe7NuSwexxqIFM8X/5qVBVIiv8qJM4OxoqBlmuzhPz2H4JedEquvyQqSdtbnH8D4Zy0OWkmMlvdgbcA==
Received: from DM5PR07CA0098.namprd07.prod.outlook.com (2603:10b6:4:ae::27) by
 SA3PR12MB8437.namprd12.prod.outlook.com (2603:10b6:806:2f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sun, 11 May
 2025 21:09:16 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::ff) by DM5PR07CA0098.outlook.office365.com
 (2603:10b6:4:ae::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sun,
 11 May 2025 21:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:05 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 37/62] drm/nouveau/gsp: add hal for disp.get_connect_state()
Date: Mon, 12 May 2025 07:06:57 +1000
Message-ID: <20250511210722.80350-38-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|SA3PR12MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af59297-7cc3-4a86-e71b-08dd90d01664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o2K2YFcvsvMoMnGWsAoXcuTid3LUAbAsuT4BdeOhpwWdnSK6edR0PQRvXD83?=
 =?us-ascii?Q?4BbZmP9Se6jzlG4IGmcfOJ1JwPBAMxh6NeOk0SOUBys6hIgzCPrlkHET4eYQ?=
 =?us-ascii?Q?j7g9af9XTbQGvbdpBWj4iTUwIskW9dW/ZCt4CbwXDsNDA52j1cWqaY53a/iE?=
 =?us-ascii?Q?lee/gH/d5/CGStSRUwdj8nFqB53bu7zBU2i72O3WpRitAemolbc2Dv2lciC2?=
 =?us-ascii?Q?6UDNkxR7SST7afGEm+ihf/tr8xiDQmewTuVPGKxWJLBPLZFIMETDYmOL7KZp?=
 =?us-ascii?Q?HeVjWbQMajqClGenARQHCius2vLEZxfuPT9GdRVB96GQBsAIy91p9yOYqKgt?=
 =?us-ascii?Q?SfHbui6g5fdvAyRv4sIxXnhZmk3o9wPPLNvy3ovynU1/d2R9V5PZSPT5CCBC?=
 =?us-ascii?Q?rmPbXxrZWSaazXNImYDeFHKs9tx1HWOn0Yo4TCns8FK6+uvxMBbW6HC7XtZi?=
 =?us-ascii?Q?zXOvy/sUn9nPDH7uBdOJ2O+IImnkMwEFR+pEzva6/g9mU0Lgq0kdp3lnavrd?=
 =?us-ascii?Q?Ml3o7rhzcnjTo+cPMZljw0HWAwnailvfOQTOnY+gfSIDTKEkcYQ0vwgMJZE5?=
 =?us-ascii?Q?o0XsFgcDTzyCDiZuwjv/vIsafJE/t2MZZj+9AzLzvrKVxGU6Q3mZRJIxh3SA?=
 =?us-ascii?Q?DFlwXYAprfqRkwoLsc2+jlbHvLOIiNRooSj7WqYWHn+g/K6kTV1mzG8Cx2Qs?=
 =?us-ascii?Q?lpooy/tbd9Y+ugHPzhcz2UIkO5fCuv8CEKglELFXGkmAylDBLFuIboT/ya8i?=
 =?us-ascii?Q?GbdIwMHDTWwQAcm7E0id9DskMoKXuJnqr9wb6S9WB9tMzOgKG7sElaFlOjA0?=
 =?us-ascii?Q?v7IEvW+i8L8rR+2CuV0ogHrNrTF+Vxi0o9vxMyTDV5SAHXTMYzIm02bFGDq/?=
 =?us-ascii?Q?CKYtrBNndQm46KeTUDV+SKjT3DiAknjTWk/lbasUomP6hlGlcHmFbeK36aSu?=
 =?us-ascii?Q?33s97EQ8J+wRY6WW9RjA/3VrlEQcAMBYDhDtWbsK9in71r55WEK9KSA9vmoo?=
 =?us-ascii?Q?wvyQrA4Ycc6QYn2vr4o2yrBGtiAg6yvi1s3ps94F5fDqJnHS8BBeRMPf4DZ3?=
 =?us-ascii?Q?/fPcO/dFiWqJMEeiVuQPT4k4dQCnkdbRuefjyMwXLE23uho4BMFbPfq6eCOs?=
 =?us-ascii?Q?I96qHov16ot7D2e7oPjUrPgAr43McYBQi6sQ13prMpEy6kW8vCByuhVN1uco?=
 =?us-ascii?Q?Fq7hp15UDHDJHzBZ0FLsVDCsqhzNtUlB8yUJlC8E/3PMwih1F4jQNfxq46fT?=
 =?us-ascii?Q?FsnCND3UhjAY7wZLkDcKz6JycPCJpCskaTdemyiS8fDa9tVcE2oYKjSJ1701?=
 =?us-ascii?Q?yqhW5sWk1bViFkG1sZhFaV4H9BUCPMevZBbISgfCI5c3Cq36TLyUzLLG9ln5?=
 =?us-ascii?Q?D2+ow6wZoq1/k+/ZzQUy1kUlzju1lGQFXaDlSx41ZeDKSGL8XK8S3I2V5hzj?=
 =?us-ascii?Q?m9dLN4sX+BWwTpy3ynd4Gef+s6wdRpt27qHqkbJ+oaKTkXeHqz5dCgMHOpJN?=
 =?us-ascii?Q?SUaKhm7ycDdp1cX2FYW+FYHIYfpjuh9djGx4?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:15.7624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af59297-7cc3-4a86-e71b-08dd90d01664
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8437
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

555.42.02 has incompatible changes to
NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 28 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 917a43332dbd..5fa2b05db2cb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -852,10 +852,9 @@ r535_outp_dfp_get_info(struct nvkm_outp *outp)
 }
 
 static int
-r535_outp_detect(struct nvkm_outp *outp)
+r535_disp_get_connect_state(struct nvkm_disp *disp, unsigned display_id)
 {
 	NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS *ctrl;
-	struct nvkm_disp *disp = outp->disp;
 	int ret;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
@@ -864,23 +863,29 @@ r535_outp_detect(struct nvkm_outp *outp)
 		return PTR_ERR(ctrl);
 
 	ctrl->subDeviceInstance = 0;
-	ctrl->displayMask = BIT(outp->index);
+	ctrl->displayMask = BIT(display_id);
 
 	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
-	if (ret) {
-		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-		return ret;
-	}
+	if (ret == 0 && (ctrl->displayMask & BIT(display_id)))
+		ret = 1;
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
 
-	if (ctrl->displayMask & BIT(outp->index)) {
+static int
+r535_outp_detect(struct nvkm_outp *outp)
+{
+	const struct nvkm_rm_api *rmapi = outp->disp->rm.objcom.client->gsp->rm->api;
+	int ret;
+
+	ret = rmapi->disp->get_connect_state(outp->disp, outp->index);
+	if (ret == 1) {
 		ret = r535_outp_dfp_get_info(outp);
 		if (ret == 0)
 			ret = 1;
-	} else {
-		ret = 0;
 	}
 
-	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 	return ret;
 }
 
@@ -1747,6 +1752,7 @@ const struct nvkm_rm_api_disp
 r535_disp = {
 	.get_static_info = r535_disp_get_static_info,
 	.get_supported = r535_disp_get_supported,
+	.get_connect_state = r535_disp_get_connect_state,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 3f0cb6790f00..58c745554544 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -81,6 +81,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
 		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
+		int (*get_connect_state)(struct nvkm_disp *, unsigned display_id);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

