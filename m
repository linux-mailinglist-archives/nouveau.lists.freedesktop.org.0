Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923B1AA3C91
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76A010E590;
	Tue, 29 Apr 2025 23:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E7QV8XMP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AB610E584
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1kTluXI22oFU5Gh6jpIF71OdtFOtu09zJeKl+vTEN8GSxjos9hUlsF4dMnr2n+gNMquHSo+ebkDsd+4RAT0sQ4Rrva2k7KKVGaP6lkWqc3pWX4D6GlXsX77y04v9Um/ZkWJhbYoL3kyeOMIV/4gRyNHzepDlllm2E2Y3w6fzTCLpY7wZVZ2RyfFeJzK+OWfu8OcN3B75+0wUpK578ntg+EMMy2jISEUm39LqfQBHIuyhYYWanbcjPgh9DFcmYjkWulTjonqZd1MvYY3kEDCJN9mHVfel7iqXMNrRMhPnz4cmvWa3kvep+MPwzlqa0SO76UtewNII+gW8cgGfmpkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xH/uy/QVPy0CpW9A/ZbNcqXza4zGyHsJGXP3/m2je0=;
 b=K6/UVcI8Zy0gLVAf80dyKLZtZPAnuY1s37X95dA3TQH8gxrvpPMCKIQsWnWD7x/uClWvOGOmUgzFRvn9S1mv79yhO8/2Tavan5T+ha/abvb/j3f7ONtAtMRpYFRgO5ZRBujz2sRZeht4Qn4XEXFofayEjzN0WOHTUM8uM49GXXTkDxNUPK+nHAb70S+VFaHpGGlpnKk8Hh9P5EUd19rrO1By0uUNkLjZ1YNnxDGRHN2dWhZ0YrvMWgT4GKgmplW9E00Hv7iwCzL0YaXBZ4hDremPFIlTj9I6oc4kzgQzU416f/3c+lRX8mj/TydCDuKywTwAZTftB0L8lFitF+kPKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3xH/uy/QVPy0CpW9A/ZbNcqXza4zGyHsJGXP3/m2je0=;
 b=E7QV8XMPuVNEj2tnrS7pEdX2a0zjXbVBWpKkYUL1GPBGawPUyn4Knh5c16hFtKXxNWPROWHrpFk+pB8J47GK0wHhYH2OZfqLfO3itlqZ6NJJrSPNksCd00DSozdTGNQF89SBpqwXMCFzX35GuENMIGoHH6p423TKvve9xJfJyhzwwjlNi3MXtYJ7tlJhn3HK+XoWNq2K+D7KpX0cXTvrV+lY1nkS5SIUSP5qvIhC920sntc6d6jOju4fv9c/vcNogE6YALgShO4E1N+W2L5bmC08qjl8zh8oYZvPXlhc0Rzahj6YlW6duNJX6nEFZe4lvDHHGd1QKPjVUXagwf0CUg==
Received: from SJ0PR03CA0138.namprd03.prod.outlook.com (2603:10b6:a03:33c::23)
 by DS5PPF266051432.namprd12.prod.outlook.com (2603:10b6:f:fc00::648)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 29 Apr
 2025 23:40:32 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:33c:cafe::8b) by SJ0PR03CA0138.outlook.office365.com
 (2603:10b6:a03:33c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.38 via Frontend Transport; Tue,
 29 Apr 2025 23:40:32 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:13 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:12 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 28/60] drm/nouveau/gsp: add hal for disp.get_static_info()
Date: Wed, 30 Apr 2025 09:38:56 +1000
Message-ID: <20250429233929.24363-29-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|DS5PPF266051432:EE_
X-MS-Office365-Filtering-Correlation-Id: 335cf565-3938-4261-591d-08dd87773b4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hCejOsj7GwFHxxi04uqnuml5qZHmbfUhvJA23tAeYiJWtgkQasJFulnTF0Yj?=
 =?us-ascii?Q?yUCVOij53ha5RFSYhodFwbhqUyqsxhH/iUt+qSwWeZG6n7OM+wUK/LjBll0V?=
 =?us-ascii?Q?Kkfjfp7pQayfW2rc2DiyFRbEB2/xHWstu2gMiKt85oJaivbHcDj0G5P6iV6w?=
 =?us-ascii?Q?nWARC/E0kp3HZBx/u3rcMzgYK4dYgxuvKa9WdlrNfAD52OgJGQ109BWiZGx8?=
 =?us-ascii?Q?F1FVdr9K8t2Oa20LToW1YHhReBCInjrhS46pwn9CZoKcnAogfPwO0i8ElMD0?=
 =?us-ascii?Q?JUmGv/24fwVvIWRTRxoKy0DD5R1mtdnsSFn8pkbe80Gfvxq4FLT0b4qmuBOc?=
 =?us-ascii?Q?l6lJTp8q5kW1q0AQzMP+ZQNw6htmCPJnakTCtrRjCuoIuWlmF7hc6Ul32q8o?=
 =?us-ascii?Q?EUBX9EGySbiGvIrtJyWqA8POp0nkT2m8e86LFirjIng2DwfGBG4lopTuYoWy?=
 =?us-ascii?Q?jZxuHtYqxbpqEMYds/zHZFm93U5DyXthbFz6nmM3UYD3dX8Vr4Pri/nLaWcj?=
 =?us-ascii?Q?6Dqg06uKUT9bItKQVUhKIt9jKMF32uKhXM2G7ewBoV1Y+FEkh1P929w0lAcu?=
 =?us-ascii?Q?Qsy6wthZ+tEJWl2BTZCpREUGvOcHiL0A4yE6pkwmu4CUSGQyQTMIji1ohv35?=
 =?us-ascii?Q?XRY24izWyYFn14pz6HwZBU9G9mXxQT+qPSJtLAqUAjwgwQkJ83OxalesQ8xk?=
 =?us-ascii?Q?AilyyiaTeyzYy+dZLTh/t6uAwQAd9Wc3Xv1IyEtGTs74Uy6WsSkZn37NssTi?=
 =?us-ascii?Q?MEDXUNwR+CPkazHC4Fo42SPN5MfQgnjydTPkDzQH8Sd3bm5sS/uHB2L4odcV?=
 =?us-ascii?Q?L0h84z1S188QKfLca/vgTAS+Bu8cAw4HQfMnu4ukrzcUcAbzwLbyrp2c67Un?=
 =?us-ascii?Q?Gr5QcZDAMA0m0I9NBZvHDo0kFDCfJwjCF3UjwyzZ8qNAljpd+quH7aCoylDI?=
 =?us-ascii?Q?tp/HaRUBi9XLGPZ2bnv3KQf0pY4hc+jFoDUCBk4tfYc6Tg5a+7KCoadUVQvo?=
 =?us-ascii?Q?PgB4yJ0Ad6J923tykml0keMTpUrGyG/J27yt8uKpDD8ps2E1BzYc2mZKNinr?=
 =?us-ascii?Q?s7h1NghoRVmpNwdJL48txEy1JvPvK/KKd4RDsB6O8zlyncyN2S48m0yS+cnA?=
 =?us-ascii?Q?ihaw0LxKik7W9e1+cevLK2JhEzBa017WgwCkoRcXaMALkwyDqSkG+ZBA8o3r?=
 =?us-ascii?Q?Y1KijVf85Fkirks8jTlQlyNUQ+95qvMdgSwMZjApDttNCYyBoaeTfjGD1VI3?=
 =?us-ascii?Q?r2QZpHEKFVQoka0yGESMJL1pSYrEy2F4meTNSbTkITWw4Pi8xNcvRoz4NxS4?=
 =?us-ascii?Q?WFaDsZrejJzppwFObuzMU3Uzysd7606V4INdIK2NvAL8P18f5WiabQXbBOjU?=
 =?us-ascii?Q?4dy4FDeuqL/iZaT0LzeBAQkJNn6XazvU5aV3CWuwnctV6zA+1Y00vszAyL4q?=
 =?us-ascii?Q?+FGJl9NXMk1NwRmbiRXuCTsDWDCtOvC6SI5Q0p2zbb7mW95n69teFjRI76vo?=
 =?us-ascii?Q?i2NxH3Se5cy9+MipsWtA0bEw+yZ0nR75nXDZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:32.1022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 335cf565-3938-4261-591d-08dd87773b4f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF266051432
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

550.40.07 has incompatible changes to
NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 37 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 313aa46356c5..736ae9c96616 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1439,11 +1439,31 @@ r535_disp_init(struct nvkm_disp *disp)
 	return 0;
 }
 
+static int
+r535_disp_get_static_info(struct nvkm_disp *disp)
+{
+	NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	disp->wndw.mask = ctrl->windowPresentMask;
+	disp->wndw.nr = fls(disp->wndw.mask);
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
 static int
 r535_disp_oneinit(struct nvkm_disp *disp)
 {
 	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvkm_gsp *gsp = device->gsp;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
 	int ret, i;
 
@@ -1476,19 +1496,9 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	{
-		NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
-
-		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
-					   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
-					   sizeof(*ctrl));
-		if (IS_ERR(ctrl))
-			return PTR_ERR(ctrl);
-
-		disp->wndw.mask = ctrl->windowPresentMask;
-		disp->wndw.nr = fls(disp->wndw.mask);
-		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
-	}
+	ret = rmapi->disp->get_static_info(disp);
+	if (ret)
+		return ret;
 
 	/* */
 	{
@@ -1728,6 +1738,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 
 const struct nvkm_rm_api_disp
 r535_disp = {
+	.get_static_info = r535_disp_get_static_info,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 1182f48ddb53..00bbb75297a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -71,6 +71,8 @@ struct nvkm_rm_api {
 	} *device;
 
 	const struct nvkm_rm_api_disp {
+		int (*get_static_info)(struct nvkm_disp *);
+
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
 		struct {
-- 
2.49.0

