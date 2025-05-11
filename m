Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F1AB2B5D
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33EB10E19A;
	Sun, 11 May 2025 21:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dMCF8vLu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2073.outbound.protection.outlook.com [40.107.212.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D940E10E19A
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBzDsgGQDh/4M/xhAwEK59q+m6i0YihVinfApyi9naMccmZGb5Xd/NTxBcs8llAav2uHLwnNU8r6Us/vxtMzZhYwqkh3lOdB5kQxcVcksaHxIWPFZoiO5yrTWEW/tSdZPSObgk8aglW8Zu/UPeL095eiIqhkHEhVEYPsKVlKIUdxqSgy8WlIcibVySZwmgU8ggajUMTXHXWdUtb1MVCX8rsUrmQVSpsRYIrK7psn8ff/OffGY7cHTb22KhkdBoLKqfm9LZMAT4WwMHK/0ItPhbtP7WKgyvJdgqzVEAA1+7nlaOSibzEEMt6ftY2N+4cGfWeAf3C6nkn8A+pTDDdX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nFDqu+Mxpzc/BCrppoj9+JVy/faB3By3aUu+mkOE8gg=;
 b=N6VTV4412hoHEdSYjy8aC1r0SuKbLGChc3nXf9PqRETrRUgU4fQTDPBWEId3tOyspo2Zc2VIYC2ItH0s9v7OVqvAWvK5qHtVqu9r8iFZdjk5dCFQ5pTtuSRXdL1kwCo/FORMw3MxqyrOZ6ubh6OqSiK3wKNFejbYCip8bE5Q6qFEd26M9p54v6ien22g8xz+0ZDoPLQbyAr6gA2lkX9bQGC8l26Wkxxts9RoWdt8kBN2qRz5PSZLg+xm72pC9gI3wx1sYRb3z7OXGthNev9W7gmuKJ33DAgL+DlUH/9MWfrc1bgNIgXBL71wY61uS/0v2yD4xlXYVt5kpohlyJntzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFDqu+Mxpzc/BCrppoj9+JVy/faB3By3aUu+mkOE8gg=;
 b=dMCF8vLuebz6KxPtLJ7jkWZQOirobyqiPl3TXhwwUQI+aekdcVeou4dhiSaTslwy4+w53JeeQZXNiMr22dCbSlAyktGaasnEBkGhUC3aTBBC1yC+M8k66nOv69wg5MQ0arlpMBDJVe6qKab1aqzLvuBJ4ovu80Dz9Q/tqYPeh3Npft0PcoQRpPZPOxibn8UPUPuzT+0zjQJ62c8mJ/Kh8UEV9If0d0a+7kn+Njypd2CsSsmDwjouY6K0v1r4ToSWv4h5+fJgQ7bySCxcuWDtglSGsYina0Vr2C3WsA+rJbtLrOX/+oxG/cOOz1/Adqll9RpeS6akTLwq00zxu0MCyg==
Received: from DS0PR17CA0003.namprd17.prod.outlook.com (2603:10b6:8:191::17)
 by SA1PR12MB7101.namprd12.prod.outlook.com (2603:10b6:806:29d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Sun, 11 May
 2025 21:08:53 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::ea) by DS0PR17CA0003.outlook.office365.com
 (2603:10b6:8:191::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:43 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:41 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 24/62] drm/nouveau/gsp: add hal for gsp.get_static_info()
Date: Mon, 12 May 2025 07:06:44 +1000
Message-ID: <20250511210722.80350-25-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|SA1PR12MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bdcd8f-69c6-463e-8c8e-08dd90d008aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hMue4H9/+nTphS1bvaP7wk4Xm2guNiNRzHnTrmhtjlUE8wPjHWRxzAI8nA2t?=
 =?us-ascii?Q?nhcTS1XXcGv6EhmarBlz6IPZSSHbt9jQkhZIAHgsaheQw+SmteZBWkCxIxqK?=
 =?us-ascii?Q?La/OkfyK17tsJcnId6jZ+6fF8BRNMvDRkX1MWmjDzJhlh3xjYxdD7gTi+SKs?=
 =?us-ascii?Q?5+XL/IvBqpiUEg2nOCtVwp/cp3+lp78eT1hDyELbyeOEMomvF1w2yMsPbKgd?=
 =?us-ascii?Q?Gt6vNscpZSozZiSV5XFxIeyD2EteAlPQk1ZmSSLHyPcQ1D0BIsErdR3B+3Cv?=
 =?us-ascii?Q?X/N9D2NaWbfA26ymI9tSnbVV+3i3JNefUILPkAFrxHaVbe7eF+HZvOD3Uuo2?=
 =?us-ascii?Q?PPlIYDM4Z6UEQ8nKK5BWpuJEhZaF1KYkGfba+xNnEBRE/Y4V9ZC0D+UlTRaw?=
 =?us-ascii?Q?b8YTXs5JcmFRp75cFbe+vthMT7X0K10A86EzslKoyhr5yWtVVhk2RIh9o3xT?=
 =?us-ascii?Q?MFY0E0nEQ4iZUHlN9FTHSs3IJa/AxBgMz/DN47suXanKsvbLoOgLXevnlabY?=
 =?us-ascii?Q?EdEUZvPNzxPguSYY8HrLOHfU2lEOmXLNzfBQK4R7lmDuAyvKGQ4vHy069K5G?=
 =?us-ascii?Q?FRW+IOYsp+2M4LEs3gn/SV3u/Eler3id9bokcHYsCdl9k4RJQpSUIjtvVHyn?=
 =?us-ascii?Q?EVXYFCROx4MHaPdtsyxVYiXIMc6GaEbjMRNw9f9ZomJfu6GoQL8+xnyJ3agc?=
 =?us-ascii?Q?oSwQmarcw+2e/U1kifHPJo2Mbw2xl+QSDhSO34WUu6vHGtEUXyVQmLZ1mhb5?=
 =?us-ascii?Q?+pTpZ/x0mglau9qqVQ9IinmrUrLDF1KU8Bh+oK89p8v5Jq3tf8nXtkWfAuiV?=
 =?us-ascii?Q?EDHeDZfMuky3EYzpS5+6CQK4dSTOBhgEPFCKJpkicl/ADHD+TBNIn8QDpy/X?=
 =?us-ascii?Q?bjqrzOqsHr35Si24NIjw/OMbM5LNLyZNlNIrZzRinuaAn9WTU4he1Lsxk0o9?=
 =?us-ascii?Q?cgSXrwOyWzDvbMqrVPPNTW3yHiOm8BsrBh04FlyogJW1JcN9qWYtRo1waiA2?=
 =?us-ascii?Q?dH1JQZcTJcl2k6xInjSCIWfgkMn3L6RV2K30sRSoYDp+22Uuw+zwI2/tU/xr?=
 =?us-ascii?Q?GZpo3LoVCr0v0+NHbSAqIW7ROdG+64D3VPFhbTrDd6pyrxgLSTeDjWfMxcwU?=
 =?us-ascii?Q?tGIWgxBEyqdSdE+BevqrtSPq7Qd5J7d44mTib3XOoaYpkMn3Dt9f9a/+gkAU?=
 =?us-ascii?Q?bOXXrQb+dzInczyFW7l4h/zUMXNgZCkVD7vQWAGGKmoEfiNRMT8o2Obd7KJp?=
 =?us-ascii?Q?1iYC77VSx46m27S6uWFb5OEyRx2/7iyi3MEXym6buKR+IWp85xLW2GKnq+8J?=
 =?us-ascii?Q?zC1yBXAWOzaFoZ1l0/J/mia90u8w3ksS/918Khd00C5bjTXqJ97mwwq49XMC?=
 =?us-ascii?Q?CE8Gk4OyeiO8wWnE5MEBo4MNgndYUyPidtyDLetOlP2j2nkT+4Sfrt1aY0eP?=
 =?us-ascii?Q?CetxoYzPAs2FyAJ18tG9egFV+fLo65ov/7GPcWhtd6u0oKluUvUs4FX1sQH3?=
 =?us-ascii?Q?wMqI7He82r3CnMV/ix07w+kNwflfacMjjo5q?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:52.8010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bdcd8f-69c6-463e-8c8e-08dd90d008aa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7101
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
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 67 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index b225dd06d490..338201b65930 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -165,36 +165,14 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
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
-	INIT_LIST_HEAD(&gsp->internal.client.events);
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
@@ -216,10 +194,39 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
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
+	INIT_LIST_HEAD(&gsp->internal.client.events);
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
@@ -278,9 +285,10 @@ static int
 r535_gsp_postinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	int ret;
 
-	ret = r535_gsp_rpc_get_gsp_static_info(gsp);
+	ret = rmapi->gsp->get_static_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
@@ -2156,4 +2164,5 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
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

