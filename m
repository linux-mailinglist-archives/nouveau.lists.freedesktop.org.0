Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2AABA716
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C020F10EBCA;
	Sat, 17 May 2025 00:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ty334xQ3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8493210EBC4
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gbz6/5YniAiapHttb8e/0BmTwXM1AwMIy2UVLCxzl4Ml4JJCqQUQiBj3SVIgm6/8GYPli/ZwJgELgCeD4PIuVCtS00DdlQ5XGjhVizMPqDdb0GdCPvBakhVho8KCVVI7nT74hyeuppsgKORShjYewEofbnd+OTgcbHqDLo41WajI/PoIuGhDICSneDAR34nX2qaaRjTT1+NfzltmuNsEqQGey9svuiu5Q4p90HMAKLnBR6n2E/wTj2wvhmnXTx4i9ydobCwp4NBzrYzwA71KPPzqmtRc3o2PqVWoah6JnpyKqY1ZeChYnJoC9bNqU1qvyyDNSzRQZ2vcqPdEnRahfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEPpK/5oyzshS0UA8soxMcdyJBAi7I/hgC85kuk7rd0=;
 b=MxzDgjlDB6znWntfFec7WFHxXmqByyH9jKNW7o10HMl2TYfbBgwVLT/WkJM1tz3/MW5BiDcwXwqK5wsuvi8Sb2LR7YV3DwMrVCBt4Betum9lLHGSGlsEXADDJx/cj1XnZDiS1h43aotgAScv9qdCs55epq6TEz89JB3lLIpgAGra7mzeetGbBZ5STxNTPLYbgq46GT/oTdg8TGUkhfCIIEjikPxMzaTmLkvA96sRACdj0YvuibYUa04daNHyMpvGriQmYENmrz4Q0EbP+j9a/Q6ZvGVFf5D/TUb44FGz2pOI7pTREfyBsVnxqosytaLz9C8Zt5q5Rqo/UMgyNYKYMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEPpK/5oyzshS0UA8soxMcdyJBAi7I/hgC85kuk7rd0=;
 b=ty334xQ3dKTs68YEeSe3pkg3c6u5wOE5qDAet1WBKQKSZRwBuZKTz2FHNbK7lCGlcSCvUp63qgQB0zrTU/2xtUpyJWGthsn3l9FbP7J9+o+U9j70UnEcf0YhyLcNaltJzXcsQou0qsPSgHyC/MBNOvHUrBmz3gbSqm3AJijSH14p1kmWoRDl0WJxJNDHOjPZAzDmQQTJN7LoU+Fu+Zq3gJS/RvjEGXpM2fIAKybd+LPAUuvMVmqFGWpk/C0giXpgW5T3nMwkzRwZFxPqKJmLPXwBxt/y7MXFSh8IiDIO+KAD/szJbqBf/wanFpg1btXDh/rTuVZTzNBXU7f7si7Ixg==
Received: from CH0PR03CA0095.namprd03.prod.outlook.com (2603:10b6:610:cd::10)
 by IA1PR12MB8465.namprd12.prod.outlook.com (2603:10b6:208:457::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:11:06 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::b) by CH0PR03CA0095.outlook.office365.com
 (2603:10b6:610:cd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Sat,
 17 May 2025 00:11:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:53 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:51 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 30/62] drm/nouveau/gsp: add hal for
 fifo.xlat_rm_engine_type()
Date: Sat, 17 May 2025 10:09:22 +1000
Message-ID: <20250517000954.35691-31-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|IA1PR12MB8465:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a03931-05a6-48a7-19a1-08dd94d751ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9j9U8x7vuzpUarXD44mixmikVGqSkdZqJgsi/ATx7PdYrX9vw2ac/HNGtK/V?=
 =?us-ascii?Q?+llzute26FwNG8x6L+A16GRotsIFPvZBJFqu3XzPUSwrz3FlreV2beNA8XgC?=
 =?us-ascii?Q?cntMKq4QdgogH8SIV7O1WYtGTkpEVKS2+g+tZX5I08oGjDdmMtmfJoD3iIVv?=
 =?us-ascii?Q?szIpQloLcG8u/X+sdc8oslQm6/Sm5Jt7nXOu0TgR3OQoO2dUgZijuUOVQ/t/?=
 =?us-ascii?Q?MjVQEG8+zsC/MrIHCsf20WUjpVytpd8ax/z1PsFjNRbU/HP/mp2uKr+OVAxR?=
 =?us-ascii?Q?3tosjv8D07XrhBacvJQmL9wrBRnkObPko683x9WOKenZffrspxH6znw8DwGz?=
 =?us-ascii?Q?GUpmXjXYavjzBP617gYHW2AqMa6469jyJY8vGHUoQv2rW06SsJ1APXb72NP9?=
 =?us-ascii?Q?g0YBZGUMIqBTpL3J+Y3yz3t+5P6gHc+sUXlNdWGWnQQlEa4Mg+RvDGlQOAde?=
 =?us-ascii?Q?hYVmarHZ8ynvtYi43k5To4Lm7Xy4DRK2v8upUpJfVeowM8rWPwwdsbH7+tfM?=
 =?us-ascii?Q?/1QP5aoGv00sUK7R8H2j0ps1hATnEZgpKWE+cF9I/GaD6TJMDZEVHa3nfdsb?=
 =?us-ascii?Q?X2jEWnk1cWsfUKjV/bzzfDhozqwiA3q+3W+DiPafHINaJx9Af9uFb0WfIjHg?=
 =?us-ascii?Q?Q8g1pnS8iTqGBCIJDWDLg2ELgEkQIWV/z1yObUCkCPY0Lr9VznUOM88khOqb?=
 =?us-ascii?Q?S2MgadR6wbxDqGYB+UefkKdKW2IfeToFutKELGbyVHCL/MaY8NXqb0lqSZxl?=
 =?us-ascii?Q?rDXyOdMh+sTOFewd0xeSsrw4I4Py/mctVcPE5UKFhSiBL5ZcG77MfzVBVHrm?=
 =?us-ascii?Q?7q1SDSlb4oNk/Z3CeQtZ0g5auz02KY+APF5lSvj88IyV0NmIyn+plOW5WT4u?=
 =?us-ascii?Q?act0uPWKXAPAi/5cIRp1J+k0d7luAeARd1ZG5A4JD9YvzTrLibTEMWZ493Nj?=
 =?us-ascii?Q?UkL9ASE1r588b9xw6eHrxQFOoO9oJwVYeQ9pJHDGpkrVCxQEk53uOX69uMgn?=
 =?us-ascii?Q?PpBCBBiKUuqmC0hKWYG7njHzcHw1OmJT/Uk9K8wLQqrb4d09rVl7Snr3EA63?=
 =?us-ascii?Q?3jN0oDB+GxN95b6DXhHqeHFFisRzvxFafTbGJGJvAtMUfADn4T0WGej/lysh?=
 =?us-ascii?Q?FJvIPn61eTxgHAPcU/bVnJ2BCNbJrvREQFmgvuoYZ6bv7csRDeeLQWgQkHE3?=
 =?us-ascii?Q?7+QfWpOfUkjdHcX/NzL2/jCzExRfAbOG04ujUyNQLyKTJAJxuOc+77Cs8iUD?=
 =?us-ascii?Q?256su1Len9wKkcIE5Hfg7N267sZU1mNS8LSWx/SORNID9CX3TcC8TOxCPipJ?=
 =?us-ascii?Q?DR1YCv0ubgDCdDCbhKT5GysLRhQjks34vJmZ4YB2M+LFyUiaJIeCBFFpoVFn?=
 =?us-ascii?Q?jdShvaKD/oaeQ861rJTGT+LaL6twHlgF6W7fxVVmOnAkc3imu8O6KdEEJhxS?=
 =?us-ascii?Q?Y5p/QYQfE1mSFJYmv1olXtBn3dhNcfiLqT5+3Y/9+AqN22HWk4Gh0sQs32Vq?=
 =?us-ascii?Q?dOqfYkxR4fnt9ck7L9QLnvbkR+Lm91urQp3z?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:06.4191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a03931-05a6-48a7-19a1-08dd94d751ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8465
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

550.40.07 has incompatible changes to RM_ENGINE_TYPE defines.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    | 101 +++++++++---------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |   1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   6 ++
 3 files changed, 56 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index ad9d93f9820d..136a64d82973 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -324,56 +324,52 @@ r535_runl = {
 };
 
 static int
-r535_fifo_2080_type(enum nvkm_subdev_type type, int inst)
+r535_fifo_xlat_rm_engine_type(u32 rm, enum nvkm_subdev_type *ptype, int *p2080)
 {
-	switch (type) {
-	case NVKM_ENGINE_GR: return NV2080_ENGINE_TYPE_GR0;
-	case NVKM_ENGINE_CE: return NV2080_ENGINE_TYPE_COPY0 + inst;
-	case NVKM_ENGINE_SEC2: return NV2080_ENGINE_TYPE_SEC2;
-	case NVKM_ENGINE_NVDEC: return NV2080_ENGINE_TYPE_NVDEC0 + inst;
-	case NVKM_ENGINE_NVENC: return NV2080_ENGINE_TYPE_NVENC0 + inst;
-	case NVKM_ENGINE_NVJPG: return NV2080_ENGINE_TYPE_NVJPEG0 + inst;
-	case NVKM_ENGINE_OFA: return NV2080_ENGINE_TYPE_OFA;
-	case NVKM_ENGINE_SW: return NV2080_ENGINE_TYPE_SW;
-	default:
-		break;
-	}
+#define RM_ENGINE_TYPE(RM,NVKM,INST)              \
+	RM_ENGINE_TYPE_##RM:                      \
+		*ptype = NVKM_ENGINE_##NVKM;      \
+		*p2080 = NV2080_ENGINE_TYPE_##RM; \
+		return INST
 
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static int
-r535_fifo_engn_type(RM_ENGINE_TYPE rm, enum nvkm_subdev_type *ptype)
-{
 	switch (rm) {
-	case RM_ENGINE_TYPE_GR0:
-		*ptype = NVKM_ENGINE_GR;
-		return 0;
-	case RM_ENGINE_TYPE_COPY0...RM_ENGINE_TYPE_COPY9:
-		*ptype = NVKM_ENGINE_CE;
-		return rm - RM_ENGINE_TYPE_COPY0;
-	case RM_ENGINE_TYPE_NVDEC0...RM_ENGINE_TYPE_NVDEC7:
-		*ptype = NVKM_ENGINE_NVDEC;
-		return rm - RM_ENGINE_TYPE_NVDEC0;
-	case RM_ENGINE_TYPE_NVENC0...RM_ENGINE_TYPE_NVENC2:
-		*ptype = NVKM_ENGINE_NVENC;
-		return rm - RM_ENGINE_TYPE_NVENC0;
-	case RM_ENGINE_TYPE_SW:
-		*ptype = NVKM_ENGINE_SW;
-		return 0;
-	case RM_ENGINE_TYPE_SEC2:
-		*ptype = NVKM_ENGINE_SEC2;
-		return 0;
-	case RM_ENGINE_TYPE_NVJPEG0...RM_ENGINE_TYPE_NVJPEG7:
-		*ptype = NVKM_ENGINE_NVJPG;
-		return rm - RM_ENGINE_TYPE_NVJPEG0;
-	case RM_ENGINE_TYPE_OFA:
-		*ptype = NVKM_ENGINE_OFA;
-		return 0;
+	case RM_ENGINE_TYPE(    GR0,    GR, 0);
+	case RM_ENGINE_TYPE(  COPY0,    CE, 0);
+	case RM_ENGINE_TYPE(  COPY1,    CE, 1);
+	case RM_ENGINE_TYPE(  COPY2,    CE, 2);
+	case RM_ENGINE_TYPE(  COPY3,    CE, 3);
+	case RM_ENGINE_TYPE(  COPY4,    CE, 4);
+	case RM_ENGINE_TYPE(  COPY5,    CE, 5);
+	case RM_ENGINE_TYPE(  COPY6,    CE, 6);
+	case RM_ENGINE_TYPE(  COPY7,    CE, 7);
+	case RM_ENGINE_TYPE(  COPY8,    CE, 8);
+	case RM_ENGINE_TYPE(  COPY9,    CE, 9);
+	case RM_ENGINE_TYPE( NVDEC0, NVDEC, 0);
+	case RM_ENGINE_TYPE( NVDEC1, NVDEC, 1);
+	case RM_ENGINE_TYPE( NVDEC2, NVDEC, 2);
+	case RM_ENGINE_TYPE( NVDEC3, NVDEC, 3);
+	case RM_ENGINE_TYPE( NVDEC4, NVDEC, 4);
+	case RM_ENGINE_TYPE( NVDEC5, NVDEC, 5);
+	case RM_ENGINE_TYPE( NVDEC6, NVDEC, 6);
+	case RM_ENGINE_TYPE( NVDEC7, NVDEC, 7);
+	case RM_ENGINE_TYPE( NVENC0, NVENC, 0);
+	case RM_ENGINE_TYPE( NVENC1, NVENC, 1);
+	case RM_ENGINE_TYPE( NVENC2, NVENC, 2);
+	case RM_ENGINE_TYPE(NVJPEG0, NVJPG, 0);
+	case RM_ENGINE_TYPE(NVJPEG1, NVJPG, 1);
+	case RM_ENGINE_TYPE(NVJPEG2, NVJPG, 2);
+	case RM_ENGINE_TYPE(NVJPEG3, NVJPG, 3);
+	case RM_ENGINE_TYPE(NVJPEG4, NVJPG, 4);
+	case RM_ENGINE_TYPE(NVJPEG5, NVJPG, 5);
+	case RM_ENGINE_TYPE(NVJPEG6, NVJPG, 6);
+	case RM_ENGINE_TYPE(NVJPEG7, NVJPG, 7);
+	case RM_ENGINE_TYPE(     SW,    SW, 0);
+	case RM_ENGINE_TYPE(   SEC2,  SEC2, 0);
+	case RM_ENGINE_TYPE(    OFA,   OFA, 0);
 	default:
 		return -EINVAL;
 	}
+#undef RM_ENGINE_TYPE
 }
 
 static int
@@ -410,7 +406,9 @@ static int
 r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 {
 	struct nvkm_subdev *subdev = &fifo->engine.subdev;
-	struct nvkm_gsp *gsp = subdev->device->gsp;
+	struct nvkm_device *device = subdev->device;
+	struct nvkm_gsp *gsp = device->gsp;
+	struct nvkm_rm *rm = gsp->rm;
 	struct nvkm_runl *runl;
 	struct nvkm_engn *engn;
 	u32 cgids = 2048;
@@ -450,19 +448,13 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		if (!runl)
 			continue;
 
-		inst = r535_fifo_engn_type(rmid, &type);
+		inst = rm->api->fifo->xlat_rm_engine_type(rmid, &type, &nv2080);
 		if (inst < 0) {
 			nvkm_warn(subdev, "RM_ENGINE_TYPE 0x%x\n", rmid);
 			nvkm_runl_del(runl);
 			continue;
 		}
 
-		nv2080 = r535_fifo_2080_type(type, inst);
-		if (nv2080 < 0) {
-			nvkm_runl_del(runl);
-			continue;
-		}
-
 		ret = nvkm_rm_engine_new(gsp->rm, type, inst);
 		if (ret) {
 			nvkm_runl_del(runl);
@@ -544,3 +536,8 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 
 	return nvkm_fifo_new_(rm, device, type, inst, pfifo);
 }
+
+const struct nvkm_rm_api_fifo
+r535_fifo = {
+	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 9eff944f6c39..8d41df85fb19 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -29,6 +29,7 @@ r535_api = {
 	.client = &r535_client,
 	.device = &r535_device,
 	.disp = &r535_disp,
+	.fifo = &r535_fifo,
 	.ce = &r535_ce,
 	.nvdec = &r535_nvdec,
 	.nvenc = &r535_nvenc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index a8f070871d80..23a9a2043d9c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -86,6 +86,11 @@ struct nvkm_rm_api {
 		} chan;
 	} *disp;
 
+	const struct nvkm_rm_api_fifo {
+		int (*xlat_rm_engine_type)(u32 rm_engine_type,
+					   enum nvkm_subdev_type *, int *nv2080_type);
+	} *fifo;
+
 	const struct nvkm_rm_api_engine {
 		int (*alloc)(struct nvkm_gsp_object *chan, u32 handle, u32 class, int inst,
 			     struct nvkm_gsp_object *);
@@ -101,6 +106,7 @@ extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
 extern const struct nvkm_rm_api_disp r535_disp;
+extern const struct nvkm_rm_api_fifo r535_fifo;
 extern const struct nvkm_rm_api_engine r535_ce;
 void *r535_gr_dtor(struct nvkm_gr *);
 int r535_gr_oneinit(struct nvkm_gr *);
-- 
2.49.0

