Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE773ABA71B
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC4F10EBCE;
	Sat, 17 May 2025 00:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PJnbPMvC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36F110EBCE
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djpjhUWqt1zQv73KNCZWHGrUkd7l7f4vSrm2vR95A/daAU1D46OyzlH91OQm2JclwDWrZEhjuU3tcSvKhm2pyZNkQvi/5cIxEpmt1nlmLyl8pyb/nj9Y4O/G5tjOPj+KRhNtgimiwh/BPhAxoCmjk9Qcszj8BOMPnk7ngc+fPiwkz0kIq+qUgN/2OqwbjndFRsnKaX8RETeTjSsT0J3Roetdgn6rRd9QOlOZxRzL3nTESkFwP3yw5Wy+2SOeHaCRlLDfJq19x6n+tAJaJ7gojkT6PH4EIucxGQDEn6f2pbn6AUZr6vjFoTjGFL1KWxHppHWmIHEvM2qbIU/LVIiH7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4MiC0HLY9douua8sSllPt5Tl19xsilpLJdUasVN5OY=;
 b=f+po5SA0u//b15zOM9r1hGvRDtJJX8xhb0mAtkXcIpfkKNaORjEOSeobBEr+ZtJu7WdgX7ggO/jFugtpvVpeQNq08O0kDRnaMqoShB6yd8NHnMpfGsIFFHA2POMFLpdiPT8+nu8K/a7dHPC6KJdmIGzZYxqaRilkWM3r7eD5GLYXHbxFBn0VickA9jAPvfj9lFLHEjBHcQNb+pNgUZgryM+HRZAzgLXa9DsqD363hLnAUGl5Iz7WUTTj5bJQK9N7nxpthJ+4zI5Qq34FflqP32d47zhOj0rnDIUs3TAlpUSKgy2kMgd8lGKcmzPyA4dJ1SUpprT4WzpjHAKrdz+eGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4MiC0HLY9douua8sSllPt5Tl19xsilpLJdUasVN5OY=;
 b=PJnbPMvCL5q6x2+Gx+AFY7qtIAnzBv92QxMOEP5vTbifeTY+wo9cqsgeUfjrv3YUMAY2g7sqEddn8FmHAEM6+XekFU1VqsvISV83dPjUGkPyNO3dWr7vrsdRdNsXiHJsT7wgK0eMcrzCtG5ZudyMAO9CX7TZ2oePih3CIpuOu3357b8DqTGwm2DhuiYnU3W3lnzUz5Y2CHDfzpxFPFsS76XHYmLGyjib+o+ZC2RO3ldNj6Dx5jdd5slubSrjRy93Tt9rD4bgpfyg9tvl5c08+FoG/kvPkNuP1pGSdNZ71UzmT0/E34yUQS8yebwl51m8zFGSc2NekraEk1cPBCVrQQ==
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by DM4PR12MB6158.namprd12.prod.outlook.com (2603:10b6:8:a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:12 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::30) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Sat,
 17 May 2025 00:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:00 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:58 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 35/62] drm/nouveau/gsp: add hal for disp.get_supported()
Date: Sat, 17 May 2025 10:09:27 +1000
Message-ID: <20250517000954.35691-36-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|DM4PR12MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: c5778d04-f6aa-4afb-6634-08dd94d75520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e96L7jn8S0+GE4EKDLa0ML4Xlk/By1WPeRgGZx2VJ30sECnExtw3udeNXJq1?=
 =?us-ascii?Q?gOcPsHWox4gTdpiyuXMXz/lmfQ40uXVUzfeu2orqIepbDcjt0kmwA7UJKumB?=
 =?us-ascii?Q?8GAh1smPZuADka180+bWSLrtsTADSYNJjL6vOqqRWSdnpVSZ7h7X7a0t3ioB?=
 =?us-ascii?Q?1eXLwDK5OtJHsjsZPdJJ5QFs6TyK937uZL0pPmW9xGpn/SXWxEHTelgI+KCA?=
 =?us-ascii?Q?NcUvruTsTHQmbcvL9hAo1kiS9WJ9OVAEKl74nY+L9I+52PWA5czsTdK6loJt?=
 =?us-ascii?Q?c5QEFEqVgfA5t12jDOJqNeV13zeCuQP7VLbsGXgFRMXITdKroxWuIjSBgEKE?=
 =?us-ascii?Q?OuzAZBvWeDI/m4j8cHaif52GejG2BfEUJYA0N07hxFCkTugn+NX82ecuHqsJ?=
 =?us-ascii?Q?BawI7RKW6r4JT0hah83ET62ojUfVnwBYs6lDns196e0GrQKePpthFXFaWvsd?=
 =?us-ascii?Q?mnlhul8+osi/kS5O3JhlYplY7qvpdFdLN3vNuo7qU9XkeTAL3vCmFzECUYpO?=
 =?us-ascii?Q?RUZ11rDU6VIag8OM3EaBD9a8/Z9g8fFNL94/6vaIil6XwwbWDjpXxens0yiR?=
 =?us-ascii?Q?dKY56y/jCqzsQlFXhMR35MRgZ2zz+CauE6yDEe71rfmELcOSLkEMUWkEpKw3?=
 =?us-ascii?Q?Lm4/FN0g6PhXHAZi3KNUIwC8pAaf/wSxC1zHzNjT72ReN6ni5be1jtjDf43m?=
 =?us-ascii?Q?47/T5a/5kuTR5jpN0wUgtPVuR6eL7krWfLLH5gQshDxOkoG2UxcqhJpGPTzQ?=
 =?us-ascii?Q?ankENPQ3JI6QRbvMaBnAYQAKF4+bMRWkzbBxvKwAB2ZRcaNUfJANW11jNkWm?=
 =?us-ascii?Q?nkfD2AlaINnLqsuDtsGLg9/yvRjZrXAFjBrPz6PmB01gIoJ0WZZ6OS5IzFBE?=
 =?us-ascii?Q?zKJ0CY+rkYPPc9a/3mdmflAuwYIhYrF8ogEpGH6sF8Wh//mTJX0DJrPq/qbj?=
 =?us-ascii?Q?z+tKts6l5AYUP5jYKnYNZzgI7wtTAz1KnzulgxCwezM4gifKT39E+LONM59t?=
 =?us-ascii?Q?lbKhD0tXk4M1S3ShUrsp9MZNO6X/gnW62MliOVBLvAQx+AihoymOEmIV6ic1?=
 =?us-ascii?Q?kwpc7nmdl/X8OZtSuXdAhY5JCno4jRh8dyEEAqUtFHdV/lzkzLC/tsMEYcV+?=
 =?us-ascii?Q?v91QAWqL/mFBuOsZkv64sxTbfUWXrdCnMEkp/KBFSInB47iN2jf5eSxFsdaw?=
 =?us-ascii?Q?QQ+aD8w8stjJZoy5zzlHYSwl3HZEXlWV1LM8V6S5EGk6TSHMgNg7yU5q+OER?=
 =?us-ascii?Q?Cw69n0m/cgIuyFZRT0koiqoSaaiVKi5h1Mrf1Q3dGVs9jAhn2M9BABphAp7Q?=
 =?us-ascii?Q?Lg5n6C19UKGOXZopn3IZi8fc35TKPQInEPQ0cgCFPKVRkcdPG/FteHrqTGon?=
 =?us-ascii?Q?seTR42o3W1C8x82UWyaD4usY49wQwuP8cFYsfj1BT2nlULq6ZsOLSsPc1L5g?=
 =?us-ascii?Q?Qg4DcLUBFrG7omGqh8Ud5b/OUjT2YZBtznuYLO6BgyD59LlzEIt94hV3QOnA?=
 =?us-ascii?Q?ir109J+tF5EIVQpAPMDEHWvzBqGFtRIkVTC5?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:12.2180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5778d04-f6aa-4afb-6634-08dd94d75520
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6158
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
index 389b2738f711..40c50d9fca0b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1442,6 +1442,21 @@ r535_disp_init(struct nvkm_disp *disp)
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
@@ -1468,6 +1483,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	struct nvkm_gsp *gsp = device->gsp;
 	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
+	unsigned long mask;
 	int ret, i;
 
 	/* RAMIN. */
@@ -1634,25 +1650,14 @@ r535_disp_oneinit(struct nvkm_disp *disp)
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
@@ -1746,6 +1751,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
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

