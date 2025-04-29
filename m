Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F000AA3C8C
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A4D10E583;
	Tue, 29 Apr 2025 23:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CG3vaDAL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96410E582
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gxT2ItBwIif5P9hbDJierOZHGvXUc7G/0SKuYoESXWzMvXJ3ofnxVcKX+OwY7Ijmtt6bMqGG2baeNh4MAknaVNRQ2uyu5vag2DApT0LI0x9BoV+LibrZQJX5/YD4m2rZSKlWutbahG1wMMApre3WnWLe1aq3h+QsUtTKLo9wKladOf/ZLJLYZjrrXtBJLhiN2pgpRu2HAKuT8kqsQhncTdwocpX8Grq3xGaPm1B+IhRjnuEIq3X0e8wfK49hDWP/K0H7u8+LBXx5dsyRlztHvnidIWOjcp+ei018YV7csNwe2dCAEjye1KBM+GYbCu+dJkp6xazMJWp/zT1dUHgi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IWkpUWPOyUKKuijNFUI7gMfhvit7IiMO1iWuyLn6gE=;
 b=bRsx0mct8CEf9eiD99ZTApX2LbWOQK3Uw9Vn4zoBH2ezP/ChcUF6yAYeEalhTGAExkhJfocfPjkBnz01pWwvsEWizIsAm4T6RiGKaPUWtBAkSieosj0qgSJjJiWF1UfGQAZTlYxLVM8/aUDmzyHk7ZTPWH1qotjBLqlywwkcYvfZXzxypNQ7O4d9NXzrsXXuX2Yder3Ys+ECWd4/VCTvzCJ8J1nMKkIlZTCvfbLteGrWOtuOX66DLZ0vADr6gXyCnCFtOOCosQuLSqmoS12pLZMOxsCeKUccxVAJoBGdkPuyELL2AEUTU/0Gc60ig4eyUo0byELLHgV9a6KSG4+FYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IWkpUWPOyUKKuijNFUI7gMfhvit7IiMO1iWuyLn6gE=;
 b=CG3vaDALyRO5gU+EOEayoz4IHCqf0WnkiP157qn5enMxm5KxsVHcdajGfopSHsnbFQH+8R7+6eUX7IDRV4qzeNJNSFQT5rHb6sVF5gBOZDa3QPghRFiU9cO2AJTditLpBQ46dZMEzNbn4aSH9LQuE92H4vP+mFLcPUgw0SOhLsprHc7iTz33lj2R2GWtqrQB4GZ6xlseGw/xWJpULbapuyM4tDhy2A0JtIHnpQLqfzxDmiio9v1+314WXK7IF1JXGA/aOAvyFpJJpRR91GMkwx0SIiTxToE7nNtDgJ1R8BMK7eXd/WUZY4PGRfSRtqu8xoG6U4FDo9vl1NJqXaTBJg==
Received: from SJ0PR03CA0127.namprd03.prod.outlook.com (2603:10b6:a03:33c::12)
 by SJ1PR12MB6123.namprd12.prod.outlook.com (2603:10b6:a03:45a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Tue, 29 Apr
 2025 23:40:27 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::e4) by SJ0PR03CA0127.outlook.office365.com
 (2603:10b6:a03:33c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:27 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:09 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:08 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 24/60] drm/nouveau/gsp: add hal for gsp.xlat_mc_engine_idx()
Date: Wed, 30 Apr 2025 09:38:52 +1000
Message-ID: <20250429233929.24363-25-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SJ1PR12MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 728f0a64-50a0-4c30-a894-08dd8777383e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ViusJKUWVoypvLjBWxPXY7w+LV7iSJyUB+6S5dMSHk5WUgubWQyCbrcnbeQC?=
 =?us-ascii?Q?L9t2oK8mBXUvJ80HYDsEjCgemqnkxyiN0tSbO5spW4qEANdLA+ExPHVL5JHV?=
 =?us-ascii?Q?MHo371mZp6N0Xu3Mu+snP9VWwOjWVVQN7BXPxYFFPtovyFQ/u10pbCjIuLaY?=
 =?us-ascii?Q?q3xXLsK2AGTaIrdplTclbm+YT7i1OMoj2HT9/p1FQG3MkHsNnkqLuEyPTa2r?=
 =?us-ascii?Q?LDhu34hVeBBoc10VyhagvwDdqMxd9jRDBlbEGoHgXRMcXsejaS0uz0BjqF3K?=
 =?us-ascii?Q?XWVxUQvCaqXCVx8d/TUIHIeYB1Xs4Wjd4S6bKHLPuQ0fJUuurJm5Hon5PRS2?=
 =?us-ascii?Q?NoIi5G2ynL/oYLwsDV5zEPC4BXd6ydn6nhyeRxG6LgEg/J5qZqYyI0Gua9s3?=
 =?us-ascii?Q?WqzMVET+ewvYFmTUquhB7l6B3isqDgz/N7+KweaRyBzZuB5X7NMN9Ujh3Yrp?=
 =?us-ascii?Q?FuoGsHKZVM0aTe+MQc0YKMzOsz6050F0xEvLt729+nXjs7nLhQRMcbi9YBow?=
 =?us-ascii?Q?nAEcNvd3PtIehNfkfcMkNTwNZv9GW06yzBZbhysJcjs2Pq0SrJ5NS3iiotr8?=
 =?us-ascii?Q?h7L3SIwpFt0OSfdJhsTNKHW3ft04YbG7aG97qpVIold92hrnE/7MmrrYl5Xi?=
 =?us-ascii?Q?qjbNC63+BvYngi5uglIsRlwVBwB6HFBu3mcONUdqmnWo674KRnOmomcrTXw0?=
 =?us-ascii?Q?86PRglA2VDHV29wXR4KTjmdsViaagewriyb8uaMtpUul/H0uPWoyvHO2E3AY?=
 =?us-ascii?Q?cYcI89SPDFwBC3fsR9swY/KyoRCgfr1EZ5DfHw4Z4b25XYnCYcsQquzAda7Z?=
 =?us-ascii?Q?PoyU8xZ9LEP//tClwjF9aeVo7S99pu7i+H0PT4k1lWSafx/M4FGa07TN3AFq?=
 =?us-ascii?Q?eoI6XU95KiqdWBCzny8+Eb4RRdIA3TJj2nwKB7AqmcXqPTnimAcaOdy0H78R?=
 =?us-ascii?Q?N5Wu0CmsI08zLRp/fyq5BgX5wmoh6h/5MfiAwyXHOJtiVgSKKfEU3H/jc3N6?=
 =?us-ascii?Q?6DAU7yMcQNPi84mbTmIXiAldf/9vw5FKGtuLfLQS8eLSa5mBlS4LjmyNsKUJ?=
 =?us-ascii?Q?iNj6Wq/ga0CWEIMisOBbtmsIS3YGoEjRpY2zpau8TmOm+wK0RM+mCdtBn7Iu?=
 =?us-ascii?Q?fMXTZIwauvOSrWoGTezdmLWmSeTTE5E49yZKwC8ogiU2bqTReo5HYXbiGf/0?=
 =?us-ascii?Q?8VzYJ9scxbZ2NaEaGpnsPPhPyq0qnS7VWNcJf9EHOK4QqbQn09eLs3i3byG/?=
 =?us-ascii?Q?HICf+U81VnJPoCrJYftGQUnXf9wly2Mt6ZjTD2u4wyQuId/wfgy+7TsKuXYb?=
 =?us-ascii?Q?yFdXKfHiTyN4+mZsJMExn1/0utvZ3rQ7UgIPkJ2IOGUfEcUruz3nP00+uxpJ?=
 =?us-ascii?Q?QPt1E5gsnoTde6bmhZ5/DtmU1jSPpVHQ8JfrIYX7d8TTTuAzaFuc/r6ua2Uz?=
 =?us-ascii?Q?R62r+Lah99BnfTwz5D26pHO1kvL8SOX3owQLewz6YaiWaKN4zDEGg7IkPwtG?=
 =?us-ascii?Q?/Etx085z67fNRyO51lvnK8j9ZuyPjHv6G+VU?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:26.9614 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 728f0a64-50a0-4c30-a894-08dd8777383e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6123
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
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 79 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 338201b65930..af93116a0fd8 100644
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
@@ -2165,4 +2173,5 @@ const struct nvkm_rm_api_gsp
 r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
+	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index cdd2e68b0332..3e5c6b369d82 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -28,6 +28,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_gsp {
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
+		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

