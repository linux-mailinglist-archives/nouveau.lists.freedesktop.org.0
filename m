Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761FABA70F
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E188E10EBC1;
	Sat, 17 May 2025 00:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lD6tPzZo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6AF10EBBB
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALmOBnfEq20amvjQyD3SvWMRmHTyBCTWZjc0GyC7rfFqMyC2QcrXbH8Sri1YVEVhmSHXENaGqWTB81N6xN+kkMpeaetRVGrDFh20C8myulbWeDtyqOi6qeDirl+SJVs141OTW8p8oeZLGezhf4BIGz4zafOhiGsT2G5MV9LEDystiCb/2VIIuihHHDqZt/igGsh4Br7nPHzLVV0/2zW4GLaMHTDm9f36ClVnB7Qs500VMyLkF2IhypVsPIQzVeD6h0PB7/bgTzdl7JHCs0jETd/HsCtdSanUXPrv/kBFpJ+9BGhbREN/KpKNZFUB6ReNgCUCC2orAbvEx1khf4n4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON25mOJjV2AI2f//tBjTsuk6JFNxlIeYOhlfwwPb7q0=;
 b=EVXdgJ5mksedG8CC8wc+m3SEG6Ss5mlJgjPBQ/OA2OklYWFeYA5KJTWsYeaKpUV2SZ+qtvO1bObg3rCvjc/mWRMFn0AAfC5HXcFftCgn8a8EDyC4/S7Fv4xvAlQ4rOSzqWeFzZ/wNNNNPC/2A7LHYqqqS5CItMkj64HLtBBGCTzxPMrquAoE16noVvhQiaGbSXMg4WhSfL/AvGkily/KPnvzxNI3SeSe91bopaILdh5ZmjtOztdudxCflF4zCM3hL+jyhObM5DVBO8sDDbtgktbJnPEVwnp038deU18BLDlg4/3kJUebDbP85NwtgkoUUAhQWsSV+aiFxty2s9OGzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON25mOJjV2AI2f//tBjTsuk6JFNxlIeYOhlfwwPb7q0=;
 b=lD6tPzZoi3DofR9xKHM6ZMxqvtwQ3vPZwApsP9IePtsWXrMVpcqKbILJyei3ZkTgJNqROx/QiJ46BA03NyjMFpTs2q7He0qV+6OvQwcq5Lhmp9DWJolJEKUDgotn+sJMGmTCVcrR3jC1Y5PDYtvHh+Ma4rRjOGTKXcFXPOwDv0JrQg+HcClZCgk2dx8FYgnb5WWpHL+FIkzL4cyjhjmHrjHGZngjoVDrYSR+SyP7VaRioQ7HrDjC7zjXGw8Hvk7WYcfoLvUYr54XaJzSw9yiMERAEPcP01Lv0vts8/1SNxEq7PdZrOOGxwfGH6GPBPhhV6RaOMxBWF/DDAkOj/TQIw==
Received: from CH0PR03CA0015.namprd03.prod.outlook.com (2603:10b6:610:b0::20)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:10:57 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:b0:cafe::90) by CH0PR03CA0015.outlook.office365.com
 (2603:10b6:610:b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:44 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 24/62] drm/nouveau/gsp: add hal for gsp.xlat_mc_engine_idx()
Date: Sat, 17 May 2025 10:09:16 +1000
Message-ID: <20250517000954.35691-25-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CY5PR12MB6549:EE_
X-MS-Office365-Filtering-Correlation-Id: 7097282f-f1b0-4d89-4dd4-08dd94d74c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J2CcrPHH0RzXFfmFyshcF/PhaILDGnwUcPVHU0sqIpxR8HFQKuJd0Z6bEpek?=
 =?us-ascii?Q?24RkZNBO1SWW8oMMKK1NniV4sj6CSmLIijs1zPO7M15VWu0cWr1WupdMgxyl?=
 =?us-ascii?Q?MdlzTw9WdG86xwHwnYG5ixcccMl0ZhAZGBsufmUENOeqOCqtJB5UUe4kuvUY?=
 =?us-ascii?Q?SOV4S5p/DqkxTtTe4kNJLlVEvAiNw6VjgKj3Xk/E+7vvPv5NRO3Z2Tn1TjfT?=
 =?us-ascii?Q?+bt/0/LpQSttJoCh7S14LqFHqR1q4SdocreI5E5HRyQXL9Jd4BsDSdk+7j17?=
 =?us-ascii?Q?F/Wx22hQ87d3V1OcWSRCOUvRjDLE3KUHdolcbINjn1zGZCGnLwoJbx+4p+lR?=
 =?us-ascii?Q?IQSygjOsr7S8yOWtubFGQ9Kso8seW4waLE6Pd0J6GWQlRFHTywwZ4bjmMnmy?=
 =?us-ascii?Q?OtAbxMXbi6fKJ0kLHzrr6YRI2xym1nFig6fDztVnBO+RPUGXWKOaLxTNMrCJ?=
 =?us-ascii?Q?3IWgA7B2j2MNWuMzNpz/noLxx1+V3iOxjjIcCgA+nZC2YGQsZAsNB0aj/8mt?=
 =?us-ascii?Q?bcWqLtXH97/MRZdtHJbeoQ5dbP8aB5n/Y3QBwMqFfbFhXSMe8CitIru8xrRP?=
 =?us-ascii?Q?xpqutHcEhASQ4w4XiRrgHjC1IHfcLr0l9Ar6NgCiSw5z3hjuDL8aimDeg9BW?=
 =?us-ascii?Q?jxtt5PQGzqmU9eZfv+Tjx0DkoIAzBibohkpKv7yfUOFRoZMoUC12ENAl9JjG?=
 =?us-ascii?Q?fbjor2S9WIj6dQT8zt4mlrbzzYGiliiFIw9Zpn9I45bmkv9vFjddEAxS8vOS?=
 =?us-ascii?Q?EmJDg6/1t9gBjIeCClfDOxVmFy5+VPaYsuzWE9oKo2lZFC9ggGO2vTbpRDwH?=
 =?us-ascii?Q?9Ze/WoN2AupLoWDvU5iUBMFJvL4KnxYqq+mWXzJF9Iy2L0q7TzFbnNw7zBLb?=
 =?us-ascii?Q?kiGsz8U9FoJ8ehaRBLeoq4pWiBYCqzD7sGlW2kJ4NDKwQ+1F4diQZr4F0hKk?=
 =?us-ascii?Q?7XhIaz9A7+E2EtFr2Cyx3Tb6t7jEsQocFl2mTd8srKkhmZ590D/4sKB1BZul?=
 =?us-ascii?Q?FNxIwvl0HyX607/FAT57ouxUc+i7mlOGl/KxWtQmGdT2iFbnDJTMWTmCQdxr?=
 =?us-ascii?Q?ZZf4ZSE69bEOBooCHUoJRCedtIi2o8wGQxe+QWZp7wA5Dhg/Y+I5KxhmqAbE?=
 =?us-ascii?Q?WgXSl7qq+h8zngFNwH24JQSNTJGZJijNO9byjyNYUJxRnUfxZ//Svv95nTta?=
 =?us-ascii?Q?W9ab2HTiY8GA5AiGzf+GxN3n8DcFs3E6QiGKEIrrcERaJau57vR205qv8eHU?=
 =?us-ascii?Q?KlIEbByvT33O39ZFRO/fExsPsE1x43RWgwms2Zby658kEerzMTVoBxbubU57?=
 =?us-ascii?Q?z0y9j4G4J0OLFTrD+DNGIUJNiDypGu0Ljq+AYepzUo0zOba0/f46n0n3EK17?=
 =?us-ascii?Q?tzNiYmHcE437FRg5Bh5uHy1p/3wsX6WgO7J+FjKpgsBfJFZoaFB5CxbUTvyc?=
 =?us-ascii?Q?YtRzlXIOmmX5tYUPxXA+Qs5Sepl2e3jUXuK/5ev2Blk8IOUM6kK94GiJa/6e?=
 =?us-ascii?Q?o6G4CtEnXW9YFD9w4BqWUWMkG/iE4u7N+B6d?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:56.8928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7097282f-f1b0-4d89-4dd4-08dd94d74c02
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
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

545.23.06 has incompatible changes to MC_ENGINE_IDX definitions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 79 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index ed0fbfbd5168..65640b43f477 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -86,10 +86,52 @@ r535_gsp_intr(struct nvkm_inth *inth)
 	return IRQ_HANDLED;
 }
 
+static bool
+r535_gsp_xlat_mc_engine_idx(u32 mc_engine_idx, enum nvkm_subdev_type *ptype, int *pinst)
+{
+	switch (mc_engine_idx) {
+	case MC_ENGINE_IDX_GSP:
+		*ptype = NVKM_SUBDEV_GSP;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_DISP:
+		*ptype = NVKM_ENGINE_DISP;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE9:
+		*ptype = NVKM_ENGINE_CE;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_CE0;
+		return true;
+	case MC_ENGINE_IDX_GR0:
+		*ptype = NVKM_ENGINE_GR;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_NVDEC0 ... MC_ENGINE_IDX_NVDEC7:
+		*ptype = NVKM_ENGINE_NVDEC;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVDEC0;
+		return true;
+	case MC_ENGINE_IDX_MSENC ... MC_ENGINE_IDX_MSENC2:
+		*ptype = NVKM_ENGINE_NVENC;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_MSENC;
+		return true;
+	case MC_ENGINE_IDX_NVJPEG0 ... MC_ENGINE_IDX_NVJPEG7:
+		*ptype = NVKM_ENGINE_NVJPG;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVJPEG0;
+		return true;
+	case MC_ENGINE_IDX_OFA0:
+		*ptype = NVKM_ENGINE_OFA;
+		*pinst = 0;
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int
 r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 {
 	NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS *ctrl;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	int ret = 0;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
@@ -112,42 +154,8 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			   ctrl->table[i].engineIdx, ctrl->table[i].pmcIntrMask,
 			   ctrl->table[i].vectorStall, ctrl->table[i].vectorNonStall);
 
-		switch (ctrl->table[i].engineIdx) {
-		case MC_ENGINE_IDX_GSP:
-			type = NVKM_SUBDEV_GSP;
-			inst = 0;
-			break;
-		case MC_ENGINE_IDX_DISP:
-			type = NVKM_ENGINE_DISP;
-			inst = 0;
-			break;
-		case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE9:
-			type = NVKM_ENGINE_CE;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_CE0;
-			break;
-		case MC_ENGINE_IDX_GR0:
-			type = NVKM_ENGINE_GR;
-			inst = 0;
-			break;
-		case MC_ENGINE_IDX_NVDEC0 ... MC_ENGINE_IDX_NVDEC7:
-			type = NVKM_ENGINE_NVDEC;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVDEC0;
-			break;
-		case MC_ENGINE_IDX_MSENC ... MC_ENGINE_IDX_MSENC2:
-			type = NVKM_ENGINE_NVENC;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_MSENC;
-			break;
-		case MC_ENGINE_IDX_NVJPEG0 ... MC_ENGINE_IDX_NVJPEG7:
-			type = NVKM_ENGINE_NVJPG;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVJPEG0;
-			break;
-		case MC_ENGINE_IDX_OFA0:
-			type = NVKM_ENGINE_OFA;
-			inst = 0;
-			break;
-		default:
+		if (!rmapi->gsp->xlat_mc_engine_idx(ctrl->table[i].engineIdx, &type, &inst))
 			continue;
-		}
 
 		if (WARN_ON(gsp->intr_nr == ARRAY_SIZE(gsp->intr))) {
 			ret = -ENOSPC;
@@ -2160,4 +2168,5 @@ const struct nvkm_rm_api_gsp
 r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
+	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 445793d8147b..aecb066982d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -29,6 +29,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_gsp {
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
+		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

