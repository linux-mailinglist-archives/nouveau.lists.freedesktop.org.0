Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19EAB2B63
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED5010E1CF;
	Sun, 11 May 2025 21:09:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xh7recun";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1FB10E1D7
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+83JI6Lhccoo+baNf+HGDa6HJvO116Xbi6CyoK2BAup1aWs7qQpTw2wTIFGgv1Rbi+aGP4uJ0UVMws29KxdNuYQDIX6kQdaoMRn3Sbos0XGHTR5BNqQSHBO5jjPfy6wNaZU635SMOVRL1W50NwaJ1w37lfkz7fqJHLcBodlTpWk8UxDeyyxwolbbeOtQIjEiguFW73dLS2nqEDgKUOW8MdOojMRHByEc7tjyAqb5+7HAzgo80LcdBYtjKCrkLVzO71BxeJ/TgeJeT1l1Nhq9eT/r5axuPzHRgJjIXlo7eoV+W+W/DojV9aN+zb1/SfuHNogIgvmWeVQV4sfY7NbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwXuqI+gQcQnaPHB7VL1HUr11obRyG9gvJGDyanksp0=;
 b=VMdRo9LIkUKk8RLS97rzfWW+bQy3RTwAzlBj7IvHoQogPUkzkUxRXgJENdJGTv/drusSHqeDUZRlQ8mYqzmaC+MG52N6g/0R5wQIvhwSs5vLuDyiggRWKvF2lSyVNMAanLkkwyUdQONbWqaaAv97ievHN2WGdB0nyQCRKKsKVZrrsvOa2SxmvKsCUA/N8KN3zj1hJ1xxA/bge6cUTaXTF+jP4waIdmlLCeSTfmTrYxUpU64MnOY+/6xmQ5ErdfKQW9TknJ7TCEcex/KRYhFtNGcJ6AO55IAw9eM7eFejfGqpC++IWVKhjgeaHhjOX46zIclyNbd/Kmm1GgISo5bgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwXuqI+gQcQnaPHB7VL1HUr11obRyG9gvJGDyanksp0=;
 b=Xh7recunEAjt8+G6Hxr11XUPEnSjphurA6Gmds3jXVO0E/4XzuXFvhBcJWxyuhRjgYPHYfNUCfIwAmCbCI/wlGbIg7XdAgL7E4OEQDlYkGGkGzLkxuPMz0ctEYiNVZIhLqLgVCp1mwgZOOo8aLjO3pqwnzIm4gRssrS2vpPMQLTw/B3mkh4BSIuEEhMDROEe9DWX82KBAuy3k/LYNCwvh3cm0L1oecEeaZevLpAeq7yBiwLyQASP17Mf6a8VuWmK2vF40QcLaTytnQjMeHYG80Bq3FSPLCpG7utS3HSHVQpR5GzLb8Vm1NGlqUf+QwTNcBnA9/W/ZvuZ0CTBmMkwSw==
Received: from DM5PR07CA0078.namprd07.prod.outlook.com (2603:10b6:4:ad::43) by
 BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:03 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:4:ad:cafe::64) by DM5PR07CA0078.outlook.office365.com
 (2603:10b6:4:ad::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:09:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:55 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 31/62] drm/nouveau/gsp: add hal for
 fifo.xlat_rm_engine_type()
Date: Mon, 12 May 2025 07:06:51 +1000
Message-ID: <20250511210722.80350-32-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BL1PR12MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 072af3e9-4dac-44c8-2b3a-08dd90d00ec1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BxFnQKim67cRL8iDGI3j0lJWYrUcW2KgP83Ekv8CY6Np3Z5fEMLqHLDlKvJt?=
 =?us-ascii?Q?zf1ikNjGdjuRHYHescbW9Ca75GrhqCZ29VfyqKnPRUSLDkM7QzglkXAM9le0?=
 =?us-ascii?Q?KEHpvlkRqBny2Ekj6836Wer2VqK75+WjBeU5xwEbOOtGfxdNbhNLLzQKzwBM?=
 =?us-ascii?Q?XEY/zotekksvGauyImhABwhrcxWVPdNPGuAo4u+WorCX9gVk0KiWOWS3HNxW?=
 =?us-ascii?Q?VSoLTlvBVfvu2N/TIx+4J/ZckIfHnD8ORFciRf2eb/7FTeZ97WNOGM9SghGi?=
 =?us-ascii?Q?sHpR2OZXLtrZ0VLw/2Pwfm5qjitTEzyYK7IR0YLL69kn/jZUX0OcLXBrug/V?=
 =?us-ascii?Q?n4Tt8ay6I10C6p2Clj9iC6/4DHZ1nw32SxPeEt4ZC/W6nRpIRh+x7svyEMIB?=
 =?us-ascii?Q?lnh3YeB2MHThBNJYE0G32aRMuSsWbABwIDktEl7c0TK1oUw9GRWNaLW177U0?=
 =?us-ascii?Q?E6sFu/wWm5UJJ3LYRuAIBI1QlUwrhEC3l+SZc5SRuQ8FHQN90U5q0XwzdshU?=
 =?us-ascii?Q?HawKHRoArCXFSKQ22BUz4u19FnL45X5YT98aLDSYs0mp7lH/ARUPAwyw/daU?=
 =?us-ascii?Q?y2ssJ3ciI7CBhYwXL4VYutlJqWMtJFIJK+ZHmi05za5a46UIgQ25sxR4No3F?=
 =?us-ascii?Q?CkeT6gQk9SqbFlvKrlRJu12j0imLUm+LJQ7iZCJo7cYsQPd+c2cQhGPtvan2?=
 =?us-ascii?Q?dlRt1oOL20WMUynVxzu9NP1vFx8Ex+qMv96GS2UvqoQXBzGXN41b9iTX+Sk7?=
 =?us-ascii?Q?K6c0IT66XBDBXqsg+xsv3evFMVpM2FQ2/dxXF+U/fNsx4rcYNMRbyzVNYN9y?=
 =?us-ascii?Q?BiV0TdeAR5/iBnIaLDF+OADoNvbUqoOJJ2lhWqQeSEyUixVUQYOwEDg66VCA?=
 =?us-ascii?Q?Wom64KAJAheyKWfzPJfANHGar7sphqh4dknBe99NuhtTGT0yVthCYc4jdp07?=
 =?us-ascii?Q?g+0Wv2MximNkDyrQPTHHLI4Hqbs7oPif6Iu5A6nC0RB+k3UCXHYDaAhhYGOx?=
 =?us-ascii?Q?QfVQ5wXPlbTvCmZSkOQ489l19/b0DE7FwPl6RT38XkucnGCoFdaSGc8/XxL8?=
 =?us-ascii?Q?H/qZKFSJ9iXKRLW6vaAH1mswXawUyQq61MxAJxUjOvnP04YWvyxjnxoFSIDW?=
 =?us-ascii?Q?hKGFUtTq+e2gQr+wA7PVdvGiWdhS1/SCRLuLi4JMXw55Bgs0FjAca+v9ie8S?=
 =?us-ascii?Q?E3h6iPDXA0LZ+AcjCPo7wARz9ZFmuuoqY0cc4tC3HTFVfQe6/2w5wEbtsEjM?=
 =?us-ascii?Q?7Mj8yMCGOAEV85qBlevB9f4ZCz8Okt+MZC9QOs/cgRTB4cJGAzO8jt8Vh45Z?=
 =?us-ascii?Q?xoOphfPii/Z1EgFB+naSYogMU6HAyizTSY0Wa1s6x33ehDF1W/HWPRxo/7Hv?=
 =?us-ascii?Q?LPtqA8Qd3l3bras524XMd+RvMv/4abCKyiCCVewUxuJje6ZWFewLSSNZjt5K?=
 =?us-ascii?Q?hdAOsgnI2M6pxS37KXGcWFIZS9sIDqVz5pfwdPAz9fghyGUR92ehe8C2XhLS?=
 =?us-ascii?Q?UECRlhs+b3l3PI+0vY+/2+XrVhKuEPhZ9Kuh?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:03.0242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 072af3e9-4dac-44c8-2b3a-08dd90d00ec1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5849
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
index 663e58b914cd..9da7e0fc70ea 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -439,56 +439,52 @@ r535_runl = {
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
@@ -525,7 +521,9 @@ static int
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
@@ -565,19 +563,13 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
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
@@ -659,3 +651,8 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 
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

