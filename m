Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752A5AB2B69
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC2010E221;
	Sun, 11 May 2025 21:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FM2/VC3M";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2CE10E221
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYI4xfLMDMcCRlvRdIOa26pEV1tGtuK2mBebMs3iDuebhSryApRRE14tEEZbPBprINdFmO9Y1DBXJnlLg2GkwayOffJWPuv+tvib3AXTRxDQNBbY6QZfWhcQ8Gjaoq1ceZe1v9DOzY2MkNq2BkPt53kr+5H1JY8+QcjsdAVs8vSwxKjMlV0Ka9oP/Anpt45DPOvVGQ9FcTce8qmEennEVSU2GqtZNVQr2ERRgmTPHeaTUec+TqZr+FWg2XHVmr7nhfnlmGOuOvg9cRMGQ89ok/bLhCskL1OkyrqDoeaiJOVFL43/TKcOBzta51sj0lwiJp0rHc7CAm8gfi6S06xsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5p2e92n2wCDdB6dsgrr7cJ2GQk//eoaDbAh5dR3bu4=;
 b=qyi6kkseVvPuMKw7rlDSfV4eujEZDydwRSetadjRZGOtfQI+sFVW6GJYJiGMLTXPdR8CumZNcWqK3tKR5HWjbtS85sHpUihvvMtIYoeyEXqkDMVyRpeFvnm+asowdCTtUDcJEWqyjjM3eB/wUW7Qu09uFSLQLXh+Yoa3VKeRdc0rnHF9Sf+bY6vUGoMm89Yyk4JiTLYxKzXeQLIB0xUHCRYJn4ptNgoIQtWqBrNi40D7oEXE8mYl3BrWbR4C7F4vhUT1lYLeiB366uwBXxKPmP4oSJiZc+NfZC3iLe3R39z56+3AYu7s0vTQYqtckykPAYuwF0KnfUGCBK5tQkDptg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5p2e92n2wCDdB6dsgrr7cJ2GQk//eoaDbAh5dR3bu4=;
 b=FM2/VC3MzxxPc2NTs05TX+XY/nWkyiwUCLt4wigeffkMGXs0LF2Am3CXx8g2DUUDReRE2bkJZpKxJ2wKJ5jT/ycyrI+aQq8knLULR6n+iqzuP5yVlaVfH3AG+b631uxMLPQb+vo38Bia+AWzKzT3MhaCKiAPA7m8QCf/G+LjlXLDTqHHuD714ga2+Zt4/AkL/W0B5x6NUj4YlKegM0w5QDY1i7DcRKkh6KL2b4e2P0bnazSq5sthVyyN04MlNUM9LWBcGT0YGLuiM6wisxUMS+UHqQ5XhNxWWQbFzHBfBrlPOtgvoZBHHF5W2SgQ7/uBmAlQ4teK+RU8pbTyLyJ5wQ==
Received: from CH2PR10CA0008.namprd10.prod.outlook.com (2603:10b6:610:4c::18)
 by PH7PR12MB7258.namprd12.prod.outlook.com (2603:10b6:510:206::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Sun, 11 May
 2025 21:09:11 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::7c) by CH2PR10CA0008.outlook.office365.com
 (2603:10b6:610:4c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Sun,
 11 May 2025 21:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:04 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 36/62] drm/nouveau/gsp: add hal for disp.get_supported()
Date: Mon, 12 May 2025 07:06:56 +1000
Message-ID: <20250511210722.80350-37-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|PH7PR12MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a29d411-7036-4ed2-9902-08dd90d01379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xz7EdoYWR5gRUE1IVuyKFBk0udVQ40wFZIS8wjNwV3kL+4suBfSrb6h2C/hN?=
 =?us-ascii?Q?oorDmXW/x09lzeilt8liayNnq9uhvGcqhxku3UKFN8pqNpOefA8P1JUgoSu/?=
 =?us-ascii?Q?7jhlbM2G27cy8PKECdBZrQ8gJLNSa6uusKYTz5Pq5EGvBUN/87R8McLrBp8m?=
 =?us-ascii?Q?WTxnroBaYkjgmGJuEAv24EhHw/Xf/ua1sq+oFy0flKWy4szebVqahl6FitNm?=
 =?us-ascii?Q?PKF1rvAcOLj3J5nC0S6MaiyyRx14nTwEqgskir9OgPFISvfymJ0qBy6nS2E7?=
 =?us-ascii?Q?xfATpkjnlQHuhWWHuQ+UiwuXxCQ/dNurVTLq0jxR0IHqtPWAHQBxIpa+cHIK?=
 =?us-ascii?Q?Q0usaBB9GnmFqfAIel7XG1wWFLaDivHuzpenWJjfJ+4JdhPedXRVPBVNlMMv?=
 =?us-ascii?Q?JQtxEQyR5dVroFOV0YhGeUN0jwx2E2Noptme45uUgPU6tFTXr2Rk0MeHqqNU?=
 =?us-ascii?Q?ArQCkqrWG43q/MyGY+Hite/aOvu40lEU/KmnehrVncMXXuggKLHKsQdG/IjC?=
 =?us-ascii?Q?JKDo8+y0QQtMAPNArMUzGGLr24phNKWZ9L4/IqbAa+mC17fph4sKR0ga2gDT?=
 =?us-ascii?Q?Gzcn9qkhGA/szSpekiu1B2krREDBCO611LHiCY65bNh3kSOTGPEy2Joo87OP?=
 =?us-ascii?Q?BvVvzHJZ3vtt/UrOIP/psDhkDB0M8YFLRz/Wl7QYkgw8fTb17f+MxGSGG4Mu?=
 =?us-ascii?Q?LeDWP9hIKVnJQ2GRG88A6O74Dtp9EbM7U71oYe1pnpeTbzxDus1gYpAM7PTz?=
 =?us-ascii?Q?sXw9AuJV27GlxYYYDW2gH1HH3IoM1KeuIZVu/8XebECHQ4gQh36Sk/gW2bUL?=
 =?us-ascii?Q?zuNq6tHACoIwl4TF0rGIUNtN5EoRhl2GfXQnIG2FF6OFQXh38m3Z/NyOIM3P?=
 =?us-ascii?Q?fgJOjImpd1xJ0bsRiVkeJlyJ7BcJmx6KmhGAi6fYuO/JWP5aMO1CtHxda3nT?=
 =?us-ascii?Q?lm6ItpPA8+ghdw7nCM7u4lrULjB0B/6xV2hMuBt98lvI2trsAWzCoa/rrA3U?=
 =?us-ascii?Q?Aoe1IpjgtZ/8WZOvcyIAQh/pa+0C3kB+os90Ca6Q8/yiAxOZ60yTjk4PaJsL?=
 =?us-ascii?Q?J6VCges2dGlraNZukih/Wzluw0HauYEXYfu4V5ZhiUXM8Y17Pw3khtEsyBSC?=
 =?us-ascii?Q?NADEvZAX6TG9QqdbS3s369YzRjP1/u0u7hf/+/GQIRUVb5ubBydXupRMParC?=
 =?us-ascii?Q?fjxwXJDYyQuUW92+b9qddEM8GMuu/0wz8s6k6Sx7XycJDAZLR0Q0kU6XNda2?=
 =?us-ascii?Q?oDodVpMS+jVzjULVHCfeJyrGiOT1MiLg67fIG82K6LoLFFTDMABKRB4ucvG6?=
 =?us-ascii?Q?PmwypEk5fKDBq5mF0DAqNrpxxe6tNU5NAJalmh6ZTLyh3lHi4bm9G01cwT47?=
 =?us-ascii?Q?UUn3duGBfj/gUP5umB3orubI2t8m4lj398lS2u6jgM9NMFlhr+tQ6/vPtPN4?=
 =?us-ascii?Q?FGCu/0pCIppT/47PLsm+kOOYOEWZE2s908OR6uOQHhtVETZfEuhYWzJdkBTD?=
 =?us-ascii?Q?kkt5q8IkV2VWWkude1ZE8XzcJLhgkH8kCzoL?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:10.9579 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a29d411-7036-4ed2-9902-08dd90d01379
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7258
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 42 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index ce84e72ef936..917a43332dbd 100644
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
index ce04ed9e3c27..3f0cb6790f00 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -80,6 +80,7 @@ struct nvkm_rm_api {
 
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
+		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

