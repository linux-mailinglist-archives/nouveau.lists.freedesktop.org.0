Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E25ABA70D
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0029F10EBBA;
	Sat, 17 May 2025 00:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNoRXoA/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7402A10EBB9
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaGVocKUutAZfRVDTikRu8bOR0+7BTQem/2aFej1AG5VzHCgkwC5HWI6/Q+nj7dLHzj/jteMC45Il/uFm+PySm9ErPJmxTmKKzGiIThpreSEuAVixvkS5iAzFm5ZYljBkbtMHGHDPIaFvZ7C3XWfeEh2QpUneAUAd383/7857DndhgviA44xUIXR3FrUvVGRdOR4jJPIeUd+fKSaqid6TiDXrIARfBQxyrWJoYtDUnwAzKB8DJSDBtOhQqZdzrDgeLELPEsrpiPHR5vayPn0ycOiyU5ElpmOXw22jBM8sL2ZHBxGLmlSVden9sn9HDOxCjyR1nYPxlTInclVsPn6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiWgRp5SELkR04rIEe5V8AIdQwuHSkivysxjOralUfk=;
 b=IJRVELozfNgBD4/yg67RScyNh3S7UL2umL+3ZychTbe9QYn8PD115kX7UOAddK5rKlUWU68Wt24+TVjDON6BC7V6EGGN+VgCGk1qfsZZ478eH5ZmboP8YNwJqKp+JDWwhdE1nFaObUOjYM7ImD5pqsvmIe459AghB2wKe5ie695dmHxr3E0Up1Mbkan+8cbSqem6V6AQJB4bAbDSjpYYuShbihek3u1x8mIqwW7elRvNV+N0E36fLpY75JxnOCo8GL0JFxaHzvt476+B64xme41gYbxWW+8A5mcIGSj27l5dBt3fjx/bE3qQD1yc7HSSXzlkZcmKwqEup6qyuvc3CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiWgRp5SELkR04rIEe5V8AIdQwuHSkivysxjOralUfk=;
 b=eNoRXoA/135EDN3aeT1mkH/05UseYTjb12qOoJRrSg5jE9wGP2WnhahybzLhwNz3LuEUJ68KWbrDnjtmKNK94Fzde3+WXUdSFS9mE38Iwg+Pr9ENquT8tMwIMmlerkKJNSXUSMwQd16XnimK8Cp/cuSxnhH4nLvM9i+9mFwTR3baAkmcz2U9m0k2tD1xb4/aROZEXgpCbYEHE3b91AamKFCppWV8dFjGN3BSs8K9b2peyhhTYVJPMja7hrYND/mgCQXWj72YmSDL3VT7kDvMClidweOfEeSnLazv0sR3HTsVmfO2kFBi9uhRtCan8UQtKHkKnX6d6SMQtzi3NLAAhw==
Received: from SJ0PR03CA0279.namprd03.prod.outlook.com (2603:10b6:a03:39e::14)
 by CYYPR12MB8892.namprd12.prod.outlook.com (2603:10b6:930:be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Sat, 17 May
 2025 00:10:56 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::9b) by SJ0PR03CA0279.outlook.office365.com
 (2603:10b6:a03:39e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Sat,
 17 May 2025 00:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:43 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 23/62] drm/nouveau/gsp: add hal for gsp.get_static_info()
Date: Sat, 17 May 2025 10:09:15 +1000
Message-ID: <20250517000954.35691-24-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|CYYPR12MB8892:EE_
X-MS-Office365-Filtering-Correlation-Id: 7294c802-e96f-4110-f44d-08dd94d74b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y/EFmVVONnbTP3Vh64MAV5F+4604q17CSApO2PGMNPNKrScnkdEnoTSnuwIL?=
 =?us-ascii?Q?FUaAxU/MQhcJ31YgQoxOtNg3rCw+HxiNcy5y4vrwoHnhJuH7jQpI83s7bZ1E?=
 =?us-ascii?Q?74nxhe4HGtucUXFYZrS3kdu/CtCY0e+QRoD5tYnwKHDaOBZTZ3ncW8F60BBA?=
 =?us-ascii?Q?bk5QVvhAameVHE5bPYspz8HBFkH3y7FnP72bxOtbvfnecwEkamRZOhefrklY?=
 =?us-ascii?Q?77atzPH/kk1dw7wzqSxI8RIsMKBGKKH2D1pFM2bF7fh58uZJpGfU9pKsKie5?=
 =?us-ascii?Q?eifBASOmzjmXW8i6H4vKLjpThhU5a/Ci3juyCdPIKm5dLQ7+bK9ORY4TVdnb?=
 =?us-ascii?Q?EYnXPHIL+tI8HIvi0erZpC94SwXVIsACJfUYpSGg0subl5xmbaapw7w+/vTb?=
 =?us-ascii?Q?BW9KkqCEAMcIISljIiITI8mHraab+HmCe6epKxyV6av16kmM+RwXxioDGNd3?=
 =?us-ascii?Q?YSRmHeb5LwEvB7omTGgpuHq0HvwDM6Rh4nrFCmvWg04IoWL2r4XKoLKI9OFK?=
 =?us-ascii?Q?sFnDXPJMEAoLJUPZbydO+JVe5aWpxSqz4WECdhiN0eC/kQKSyBJSr3eFafXB?=
 =?us-ascii?Q?tBzavZJgYDkMS4M4LUsK5rPmFw83X0eX8Abze60S+T3e3ocqMNeHtNs//9Hb?=
 =?us-ascii?Q?QJ09v2VFERs326fX9iGFV2hI+yV2+PVDq7F5mx+dlGBgQe3K4Sdje1JvoW0b?=
 =?us-ascii?Q?zsYNt5wUKIo0/tMvKxirPpC5iiWOPzNU0aFbe74hq9RZmjTZUKpO1G1GNjas?=
 =?us-ascii?Q?iHZFeeDGpcqJsmMW3FT090A+PAPJzQUnlpj0MNPP0Q9iExoHAU4cyi6t/voL?=
 =?us-ascii?Q?G1RSAbqFJSq91iybBI7R/i/BeZ4hSMUzW8XJGxXpYtcThtx1QAeCFLzwgfxN?=
 =?us-ascii?Q?rQdcTfIsMIaHW3s176HUTNA8E5bMmCIJm56v9C1A2MhSpHs4KdUdmLEqxuBk?=
 =?us-ascii?Q?ExpD5g4wtTraKSOZHROw2q20UYYDatP6+SuEvwVMimivdlCgd2DPEB7+wF27?=
 =?us-ascii?Q?T9dE8oJFM3lGT4C2iT+FJ21aooLRA4iAsQEPm/OA89o7xhpi1FNh2EPckM2j?=
 =?us-ascii?Q?oz3lgoE/GKu1fuaYN0V5EPTbi0qantjvaMqWBP9SDTskTSZc+paVbqENEjMy?=
 =?us-ascii?Q?tEPUQIScWPokNsQ2WigpXaRbf3vsqm3dOYW9qJ37WV4WmnuLttPMmRMiEcRT?=
 =?us-ascii?Q?9nJzS/sKaypNxqBrGd/ZlyCldLWOnZzlUK7vph3znZ5CnvCKRQGGTfhJzVgJ?=
 =?us-ascii?Q?gazZ47sTbvdlNS6ECOOlj1hw++7Ofn3bae25h9JZEbFYUPOVMrna68+KKHCw?=
 =?us-ascii?Q?/OMQJxBwG+MO6W+NLOIhXTrdSQKJp+8rnlqdCh14FMsEQ6Fl/OGe0il7VDR6?=
 =?us-ascii?Q?ZQaB+Km4iOwKJ7rYLyge1oUjsqHkYPiA1PjInwrM4yLR+nK3J3krfq7zou/8?=
 =?us-ascii?Q?gO8FS5kNiFmlu3+w6/MtDzfMXVftssHT9huDGQujUfI+njXWk6/s6K8o49Nu?=
 =?us-ascii?Q?sWPS3yWT5SersEhCmB01w1DoVuQTTeE7iFsr?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:56.1243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7294c802-e96f-4110-f44d-08dd94d74b84
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8892
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

545.23.06 has incompatible changes to a number of definitions that
impact the layout of GspStaticConfigInfo.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 65 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index f574a3ad2082..ed0fbfbd5168 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -165,35 +165,14 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 	return ret;
 }
 
-static int
-r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
+static void
+r535_gsp_get_static_info_fb(struct nvkm_gsp *gsp,
+			    const struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS *info)
 {
-	GspStaticConfigInfo *rpc;
 	int last_usable = -1;
 
-	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
-	if (IS_ERR(rpc))
-		return PTR_ERR(rpc);
-
-	gsp->internal.client.object.client = &gsp->internal.client;
-	gsp->internal.client.object.parent = NULL;
-	gsp->internal.client.object.handle = rpc->hInternalClient;
-	gsp->internal.client.gsp = gsp;
-
-	gsp->internal.device.object.client = &gsp->internal.client;
-	gsp->internal.device.object.parent = &gsp->internal.client.object;
-	gsp->internal.device.object.handle = rpc->hInternalDevice;
-
-	gsp->internal.device.subdevice.client = &gsp->internal.client;
-	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
-	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
-
-	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
-	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
-
-	for (int i = 0; i < rpc->fbRegionInfoParams.numFBRegions; i++) {
-		NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO *reg =
-			&rpc->fbRegionInfoParams.fbRegion[i];
+	for (int i = 0; i < info->numFBRegions; i++) {
+		const NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO *reg = &info->fbRegion[i];
 
 		nvkm_debug(&gsp->subdev, "fb region %d: "
 			   "%016llx-%016llx rsvd:%016llx perf:%08x comp:%d iso:%d prot:%d\n", i,
@@ -215,10 +194,38 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	}
 
 	if (last_usable >= 0) {
-		u32 rsvd_base = rpc->fbRegionInfoParams.fbRegion[last_usable].limit + 1;
+		u32 rsvd_base = info->fbRegion[last_usable].limit + 1;
 
 		gsp->fb.rsvd_size = gsp->fb.heap.addr - rsvd_base;
 	}
+}
+
+static int
+r535_gsp_get_static_info(struct nvkm_gsp *gsp)
+{
+	GspStaticConfigInfo *rpc;
+
+	rpc = nvkm_gsp_rpc_rd(gsp, NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO, sizeof(*rpc));
+	if (IS_ERR(rpc))
+		return PTR_ERR(rpc);
+
+	gsp->internal.client.object.client = &gsp->internal.client;
+	gsp->internal.client.object.parent = NULL;
+	gsp->internal.client.object.handle = rpc->hInternalClient;
+	gsp->internal.client.gsp = gsp;
+
+	gsp->internal.device.object.client = &gsp->internal.client;
+	gsp->internal.device.object.parent = &gsp->internal.client.object;
+	gsp->internal.device.object.handle = rpc->hInternalDevice;
+
+	gsp->internal.device.subdevice.client = &gsp->internal.client;
+	gsp->internal.device.subdevice.parent = &gsp->internal.device.object;
+	gsp->internal.device.subdevice.handle = rpc->hInternalSubdevice;
+
+	gsp->bar.rm_bar1_pdb = rpc->bar1PdeBase;
+	gsp->bar.rm_bar2_pdb = rpc->bar2PdeBase;
+
+	r535_gsp_get_static_info_fb(gsp, &rpc->fbRegionInfoParams);
 
 	for (int gpc = 0; gpc < ARRAY_SIZE(rpc->tpcInfo); gpc++) {
 		if (rpc->gpcInfo.gpcMask & BIT(gpc)) {
@@ -277,9 +284,10 @@ static int
 r535_gsp_postinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	int ret;
 
-	ret = r535_gsp_rpc_get_gsp_static_info(gsp);
+	ret = rmapi->gsp->get_static_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
@@ -2151,4 +2159,5 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 const struct nvkm_rm_api_gsp
 r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
+	.get_static_info = r535_gsp_get_static_info,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 4a37904f7f9c..445793d8147b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -28,6 +28,7 @@ struct nvkm_rm_wpr {
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_gsp {
 		int (*set_system_info)(struct nvkm_gsp *);
+		int (*get_static_info)(struct nvkm_gsp *);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

