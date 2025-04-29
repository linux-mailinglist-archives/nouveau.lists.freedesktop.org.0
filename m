Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D189AA3C98
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993DC10E597;
	Tue, 29 Apr 2025 23:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g5mE9+TK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1210E59C
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XM36uUbA/CSDB3jfLudp02JDSAi2tgeQVvx5gq/tkyeE6kSkLuXrHAa91PWdQclLiAd6ZDQefmuBsbkZXEGuN4zh6kP4lYX88M7roUhoqNj967pZXEF2bdH+yZNxwVPp1+FyDAKkPmDyz/qLg5neMNEkiV4XQ09r5TFycKuswmaC66+SfwSisZvW7d0lYy3m/HqwEwhbvyhhmIrxz7MLXoiGUx5V4xp0gqtHuBol2boIV92g2PqMp0v5WhTzfTG1xdhmncbhEKW5Hja4D/LkykEyjVfOmcDpCijOH5EXe+XNR5wDVm0FMOrtgOvkmV3ASRfgjDnsxHlSKOy8jntMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+S0QZoADvKrc21SQazcZn7s6dwgw/TxIn6+MpXlDqc=;
 b=Yl9MnU7x0olHVHeYaXN6JfAfxfPXQUnOXjnUfec4YLSlYlCdkHLRAT71pPlzyouzdT0/2zSq8XPts+OmgDVDA1qi8xOXSci7PavuDGV0di0aCTyBka263zG/C4IR4KbpKZfh8qOBoiUeOU/DVTRrVFaxE3U6d0d5BajKrUYRIXZpS/8fDwD7GrtOZRIKTkDPeF1/6c9/Z9nVZT3W9mVnodfCnr1owMOmK2mkoGVkzkRQqEclV0OsrCE8g1/IJGOmZ4uPfGqolhS425dJDW6ZgDx+kXla6J0OwWup6w12nQd91FVmYy15WKkMkV4NOLkYKQBEOoDjpWfvnqAjswlurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+S0QZoADvKrc21SQazcZn7s6dwgw/TxIn6+MpXlDqc=;
 b=g5mE9+TKYcdj/2EfRfBS3Onj3NE6kzX/1ubwEUVu4hGV20GZQ4awbp2xxUlgpkMUJeXJcQ5eEv72nzZXKgT8rjBlh1lqXzl1bIaHheojxpab6nXnAwo3CiW7DwP1Uz1sxIFyrsjUlIcX2dgmxaiTfJpeFqv9lqLuzUM+bzjsKf/9yiTH5nC6UvyIi5Q+52R4Ywkpu6DLGh2nNpQ+dRjo8MadvVBr8Xej+8TVmdxntsXSf2lFbURAA5MRLR2Cu1lq8mjEG/iLrGUM07XLzRFhb+ROQnbWgzUTqoHxPAf5VoA8lUCyDeElYubLvr8WEoxrqa6pb5cyFCAQEgjiTSfqAA==
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:39 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::7e) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:22 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:21 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 35/60] drm/nouveau/gsp: add hal for disp.get_supported()
Date: Wed, 30 Apr 2025 09:39:03 +1000
Message-ID: <20250429233929.24363-36-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 453d0f32-848c-4aad-e86d-08dd87773f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N3Ih1F+Pws75S3MNVYxA9UaBBeEg+yGc6GCdGgmaAEOUz2ZNsKBUXMVK8G0h?=
 =?us-ascii?Q?ffyddd6SdDS78B53HOL6GEU3oQqsPqFaprBqHRN9w4ZgYCeeG1CXldTF9lBE?=
 =?us-ascii?Q?JfkP3YS6G9gVSfG8u4DxCYtpjqmaytmhYZATdWGtkmzaouoo0a1pJD50mZs8?=
 =?us-ascii?Q?l2eSvLEbdcBiOEoS1RL6Xi+5pAgzX3KzGG9DZcB8QFOQhZ3/zd353Q9u53Q4?=
 =?us-ascii?Q?QB5jtdNYNqyCH8f64Kl4QBAjiO/5aUsS0ze0UY8ZDxFh6n3BRgHJ1+uypswx?=
 =?us-ascii?Q?HIgn7tvpK+iBPPlifTjCdNxqNS0Gpq4hqE3Vw8lTaPODI4vqUqlT/GxVPV+F?=
 =?us-ascii?Q?WXCJtfBLcONeIeh4ANP9/aRtVHjPdfPDwNNGRwh6/EaUVCH0R84q4CAFLrgh?=
 =?us-ascii?Q?HO8NIes2IewMEAKxCeDHw9uIOTbqfbBNlk+HYuqthWg2g7uWKFE9bQDKC/PW?=
 =?us-ascii?Q?ZXZa895o2qpu7CrHeKf8gUBOVrFXbiTMYA1T1um15uYxCETn58scQnhyhEyF?=
 =?us-ascii?Q?1vt1OtnE474AdC2Gk2Z7aeCiad9ypLEoo3CS/RrDy001ndUAccI/OP00dczh?=
 =?us-ascii?Q?s5PhRkUvEwdMW38fAJULfAvXx79oOK7q9CzglE26uEAZjsPiWABT6cSUm7kV?=
 =?us-ascii?Q?ZejDSpmFGzYzUZQYcy8v3HsTPObSmy1LZgE3a3Y4Rq7/OhYNla5hd9Miv/ot?=
 =?us-ascii?Q?hKmVMx/NujyxG6IAKQ0nT7DSL6GIp2OZNRzvpJJ/T8wraVdvgRcQa/TSbtwa?=
 =?us-ascii?Q?edJ86yn/d71SsIOMfTgxceojVcYIFzdWTJMxiG01VXIeqeNla0/Rt0qXZccL?=
 =?us-ascii?Q?taVAKaEhpXlyWlBM8WqvW+L8cA+4nRf9+2DewbOGYfmCLB5mTKnXPWj34CCa?=
 =?us-ascii?Q?I5LlLu9Ydi1lE2ndbJrHQ7UGcz8oZGqEkoB7ZLHm4jSooOGmXp03VAauyOL+?=
 =?us-ascii?Q?vSnLLzdN72JS82pFVnK2vXf4cj2whC8zYB9nycQu18sVQwuKHnExn5uRCCc2?=
 =?us-ascii?Q?6LM1oBYwfoOyVMzRtlahF/Ack0CCr8wYkewWh+wuWERGw64EhMSM73zybaoB?=
 =?us-ascii?Q?CwtCq5W6G8QCxofzkO0VQt/qnvAIxQwSy6GcBme28uKQiTrEbBUGnUr5rhGV?=
 =?us-ascii?Q?YqzxZx+AK1jHKab2Q0wwFPcr8Z81DAusYkj18PzXbskPK0S83JyBbUNnxqWm?=
 =?us-ascii?Q?6AFTEjVMEgWPj4FDDBBsAhLfCAh1dGQ1tqxaEXVUfLBZTDGGNYgdn+0eAuFe?=
 =?us-ascii?Q?sni7nsk4USWb70bDK8gaOHk+PjAl3pJv+6lU2ZyzcZk0Cr7pEHZr9bt6MBnt?=
 =?us-ascii?Q?1UkNlBcPUEd9JlHp+tzgJmhPDp2hQqTLvrliuhUE1/RxZqLzkxv7bwJyOAbg?=
 =?us-ascii?Q?shmUrw/hYObXDKaUlDXEq8cMRbFqyjIwGCIsF8TcV44DHBDdPsqqZGu58ayn?=
 =?us-ascii?Q?xJ9gtDkIpKJ35MnC1968tDrpsLdgmGPiei+AF5Pgqnkjq7EOaums2wX/RuEJ?=
 =?us-ascii?Q?Lwwm3qQzivn3nKTa6F/BDvUhs+Bx7cfFMbri?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:38.8365 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 453d0f32-848c-4aad-e86d-08dd87773f4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317
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
NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 42 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 615daad4b9f6..46eae0a61827 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1441,6 +1441,21 @@ r535_disp_init(struct nvkm_disp *disp)
 	return 0;
 }
 
+static int
+r535_disp_get_supported(struct nvkm_disp *disp, unsigned long *pmask)
+{
+	NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&disp->rm.objcom,
+				   NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	*pmask = ctrl->displayMask;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
 static int
 r535_disp_get_static_info(struct nvkm_disp *disp)
 {
@@ -1467,6 +1482,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	struct nvkm_gsp *gsp = device->gsp;
 	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
+	unsigned long mask;
 	int ret, i;
 
 	/* RAMIN. */
@@ -1629,25 +1645,14 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 			return ret;
 	}
 
-	/* */
-	{
-		NV0073_CTRL_SYSTEM_GET_SUPPORTED_PARAMS *ctrl;
-		unsigned long mask;
-		int i;
-
-		ctrl = nvkm_gsp_rm_ctrl_rd(&disp->rm.objcom,
-					   NV0073_CTRL_CMD_SYSTEM_GET_SUPPORTED, sizeof(*ctrl));
-		if (IS_ERR(ctrl))
-			return PTR_ERR(ctrl);
-
-		mask = ctrl->displayMask;
-		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	ret = rmapi->disp->get_supported(disp, &mask);
+	if (ret)
+		return ret;
 
-		for_each_set_bit(i, &mask, 32) {
-			ret = r535_outp_new(disp, i);
-			if (ret)
-				return ret;
-		}
+	for_each_set_bit(i, &mask, 32) {
+		ret = r535_outp_new(disp, i);
+		if (ret)
+			return ret;
 	}
 
 	ret = nvkm_event_init(&r535_disp_event, &gsp->subdev, 3, 32, &disp->rm.event);
@@ -1741,6 +1746,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 const struct nvkm_rm_api_disp
 r535_disp = {
 	.get_static_info = r535_disp_get_static_info,
+	.get_supported = r535_disp_get_supported,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 7a0f5c431f94..8bf2456c78be 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -79,6 +79,7 @@ struct nvkm_rm_api {
 
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
+		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

