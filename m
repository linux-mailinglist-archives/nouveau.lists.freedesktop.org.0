Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A83AB2B6D
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644A810E243;
	Sun, 11 May 2025 21:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H6LBKYeY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1EB310E242
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyhfx9cEUgCdgaDC6hWNtmO9MzHgSwuWTy2N5Iu95HlHzN+ZkWQRnyL9xUIDKruvzMshpkjKBihy9VfgzgLSFB2Is71yGK78/yg/nQWWXoGicCya+dowl+5k9S1nmpq5eaCUOgZW6vhCVtff7F8rr3znHl00le3rIoRdvJ27wQKcU6MUCkqeUXzKUGVrsKkks/NXoE+vxc4H2/QJeXmbuFUIsSi5gKQv9FFXToaRAGOwPaDThgpWNb/ZxpHG6+e/JLWmEDvFIxnBsOzug8IFMiwpOYbKSfVWKtqsSqXpVNJdDkhFXVTfJfX3uxksQ9H3Khk3EU221IbHhQs0lKhuDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bwd8lcWPLPRcufkA9fD/q7xv+BrlPcFfnnHqoHGQcUI=;
 b=EoMQt+adDYCZ3jT/go1uNwdQYB5xHAt+/xmkFUgkcG5ckDN05LC1y1UfyTpNQJsS2/VDQaUcz1Eglgr1DPrgT/YxXSStNfuQB2B3tVwU+PsLHUZ9AEHZS/cJ3IGNxxfDcj2dm7SqSXOwLlaCSUbA8GssG6MQ767uNHl0s5d2L7ns8I2owgaQ/jODwEt3amY5HHLzpgYq8/1kYN2JkinmIfQVcZkaRHL3Wh6FwK9o4znZh/3ir8s5kDJu3k7vVbujLvWdB97LJsrp9kz35fRYXGTTW2rivBE/eZoCH/iordVx7R8I+qO6KSTHu1QlMLnV+pK5bBDMbzhQZtoKIiuZWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bwd8lcWPLPRcufkA9fD/q7xv+BrlPcFfnnHqoHGQcUI=;
 b=H6LBKYeY7KX/Q9CX4Oh+SRtTzAruVw3Je5haJlAy/ebmulXq/IFAUVsPdk2Yj72FuLlgAsk/FGpLFAensam0XwzT2waUvVpDachE1W1+fSm9zbl4r6Ba41hylE7z5KktlmWajyxLpGwBbFEaOXkMVrLNuHkYQP8C1S4cFrXyHTKIiiyu0mh2KyWwEiZm3XQZfri5+QKMaie8+6hlRcZrFMtw9JQqHUpOSii3P6PWbWjbfOrDsA6et8ZQ/Paq+7Dg7nuXGqPhu7X4HsQybT37K6a93PAHLeJZ2TTY5M+Ink+FG8GPeHdwBmhAkgRy0t39EXcZ1ehzikugwE64fRmVGg==
Received: from CH2PR10CA0029.namprd10.prod.outlook.com (2603:10b6:610:4c::39)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.26; Sun, 11 May 2025 21:09:17 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::f) by CH2PR10CA0029.outlook.office365.com
 (2603:10b6:610:4c::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Sun,
 11 May 2025 21:09:16 +0000
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
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:09 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 39/62] drm/nouveau/gsp: add hal for disp.dp.get_caps()
Date: Mon, 12 May 2025 07:06:59 +1000
Message-ID: <20250511210722.80350-40-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: ddbc7c4d-4e5c-4781-d91c-08dd90d016e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vg9YOMsDSvr3zuyEDQdTj42FMn1vJ+HLzHnwDaNeI9CCiBp8Ckv5U+AObcvb?=
 =?us-ascii?Q?lhI/xBSkFCOBa8igJ/J5Dp3OXIu1nRvfC3nXZH2CVU/tHCfNp4hfUzf6P3Wb?=
 =?us-ascii?Q?tJU5bapgDuolTBLZHF5uMlBvkORkCunEnnOtWcNRq0Jfg15k3ANrilbWB10Y?=
 =?us-ascii?Q?uPqyroSmHCnWJlmqi8o/YSJVMrQmRUAZdwYayrJOEyMDl1LJJdSo+ROq6hvw?=
 =?us-ascii?Q?UmEKtreAAL/mXJAPC1qFMSLaCgCwwEufxfc5LoYjaO5Oxwk9F7dLm7ZK7U6y?=
 =?us-ascii?Q?tyxLnZnzfMGa1xeNNZLcgl3bIHJbD5sBQBoe1viwTMOw9XOnleyFKRDEHjQp?=
 =?us-ascii?Q?u+TSbCZtQZhNIuJrFqYUu7LCPShbXDJNeEANN1eepQf/XcUVTW+byzQ4ljGj?=
 =?us-ascii?Q?p/KLv2QyzaiW/D4DfqZsN57HWnBggBmqQziiWn8/O7G5Q+Pp6UNYb8VN5Qcz?=
 =?us-ascii?Q?h4OpxqzrK2hLeVwwCIvpO3ZzlAyf1mHDQKsFddJ/5RxtL5hWvgSHVqN6GJiQ?=
 =?us-ascii?Q?83HEa/wrCR3rmkbKVDihBAjygWbImpbgF4HX0Yx298KLS/sNPDzhX5alQHnN?=
 =?us-ascii?Q?f+E5QprX+cE1kAbYACdRLl/Whlfvlm4Pp5NWZVXnmx8ibVSeBgXvrhemthsu?=
 =?us-ascii?Q?xL+PFstkKiZlG3BnVzMdzJAygdgOT/CG4B7+y7Lxt9CxhgHjw+3cSghPsYCQ?=
 =?us-ascii?Q?3PqiRg/ogoI0gA8v9Wo/RqBnNorWQUWYiawMlBTHw4J+v9W7/H+h3bycLhGs?=
 =?us-ascii?Q?suQ3wEchl9R0FH45zh1Fn6tbtjRB7zKbL5oFEXJlZrm+EQQ66IB60jeE8/iN?=
 =?us-ascii?Q?+Gpmi/ChQnqnJ0q54UM4fOpYHbjfbiVLwTVsyHYI5wgiQON/KB1KiM0Qb1+Z?=
 =?us-ascii?Q?1Yd3cILzNmFH2LIMvrApAoDnvzrXtU3zwiCzNAa/uR255YOJGAo30UmbUaL3?=
 =?us-ascii?Q?r5IVc2LN95OB2Nxz3plJ+lWKMod5mZocWZ5RBJb8GejHd4BGhgbeRco2I0rJ?=
 =?us-ascii?Q?zxXxoTXqVKxGC3W5PGghjuxGFyYX3fMBzZIyP/nCkS6we1SUndsK8o4FuFbJ?=
 =?us-ascii?Q?VvGTqhng0adJRH2/01VDY834PDjGIIfAOkxyoBvl2MSdSdbo+htUSvJjfICI?=
 =?us-ascii?Q?50WlTm2cN+KtsA8/zI3yBLRvuShjhKpv4SymA8+t+LqpC7Btku1LBbFb76vn?=
 =?us-ascii?Q?aNcbL3afAPLKOn05acZXPVwp3pLc5W71EriFtHqLTUILL7YXfH4B26MjQfRG?=
 =?us-ascii?Q?RvM+LCbV1W206FhJqIp5aq0rTQtUqqJoYcux1Fg21nmYoRpFRdHSPepcEu/9?=
 =?us-ascii?Q?bDnT1ZHJFIVuWrTdZUPQW6T3vHRKYJcqdmtubNg0EocsKsk2TiC5nkfjm+yh?=
 =?us-ascii?Q?b/6vYH26l7Gk0L3Pn8FN4vgzoeZaChFXIoEROGtTzFypztHEpjecAGBwNbac?=
 =?us-ascii?Q?61Zkxhktl09kcOt8EO041AgNXJ7F00Xpq6IDjriMjsnZlYU626SnLOcQSLOC?=
 =?us-ascii?Q?iLd2lHdPdM0oJBK8OH0vSEWKhcqX8kOKYNq1?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:16.6936 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbc7c4d-4e5c-4781-d91c-08dd90d016e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262
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

555.42.02 has incompatible changes to NV0073_CTRL_CMD_DP_GET_CAPS.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 81 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 46c3556bdd48..195ee1b66dcc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1159,6 +1159,49 @@ r535_dp = {
 	.dp.drive = r535_dp_drive,
 };
 
+static int
+r535_dp_get_caps(struct nvkm_disp *disp, int *plink_bw, bool *pmst, bool *pwm)
+{
+	NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS *ctrl;
+	int ret;
+
+	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
+				    NV0073_CTRL_CMD_DP_GET_CAPS, sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	ctrl->sorIndex = ~0;
+
+	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
+	if (ret) {
+		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+		return ret;
+	}
+
+	switch (NVVAL_GET(ctrl->maxLinkRate, NV0073_CTRL_CMD, DP_GET_CAPS, MAX_LINK_RATE)) {
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62:
+		*plink_bw = 0x06;
+		break;
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70:
+		*plink_bw = 0x0a;
+		break;
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40:
+		*plink_bw = 0x14;
+		break;
+	case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10:
+		*plink_bw = 0x1e;
+		break;
+	default:
+		*plink_bw = 0x00;
+		break;
+	}
+
+	*pmst = ctrl->bIsMultistreamSupported;
+	*pwm = ctrl->bHasIncreasedWatermarkLimits;
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return 0;
+}
+
 static int
 r535_tmds_edid_get(struct nvkm_outp *outp, u8 *data, u16 *psize)
 {
@@ -1203,6 +1246,7 @@ r535_tmds = {
 static int
 r535_outp_new(struct nvkm_disp *disp, u32 id)
 {
+	const struct nvkm_rm_api *rmapi = disp->rm.objcom.client->gsp->rm->api;
 	NV0073_CTRL_SPECIFIC_OR_GET_INFO_PARAMS *ctrl;
 	enum nvkm_ior_proto proto;
 	struct dcb_output dcbE = {};
@@ -1287,43 +1331,11 @@ r535_outp_new(struct nvkm_disp *disp, u32 id)
 		if (ret)
 			return ret;
 	} else {
-		NV0073_CTRL_CMD_DP_GET_CAPS_PARAMS *ctrl;
 		bool mst, wm;
 
-		ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
-					    NV0073_CTRL_CMD_DP_GET_CAPS, sizeof(*ctrl));
-		if (IS_ERR(ctrl))
-			return PTR_ERR(ctrl);
-
-		ctrl->sorIndex = ~0;
-
-		ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
-		if (ret) {
-			nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+		ret = rmapi->disp->dp.get_caps(disp, &dcbE.dpconf.link_bw, &mst, &wm);
+		if (ret)
 			return ret;
-		}
-
-		switch (NVVAL_GET(ctrl->maxLinkRate, NV0073_CTRL_CMD, DP_GET_CAPS, MAX_LINK_RATE)) {
-		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_1_62:
-			dcbE.dpconf.link_bw = 0x06;
-			break;
-		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_2_70:
-			dcbE.dpconf.link_bw = 0x0a;
-			break;
-		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_5_40:
-			dcbE.dpconf.link_bw = 0x14;
-			break;
-		case NV0073_CTRL_CMD_DP_GET_CAPS_MAX_LINK_RATE_8_10:
-			dcbE.dpconf.link_bw = 0x1e;
-			break;
-		default:
-			dcbE.dpconf.link_bw = 0x00;
-			break;
-		}
-
-		mst = ctrl->bIsMultistreamSupported;
-		wm = ctrl->bHasIncreasedWatermarkLimits;
-		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 
 		if (WARN_ON(!dcbE.dpconf.link_bw))
 			return -EINVAL;
@@ -1758,6 +1770,7 @@ r535_disp = {
 	.get_active = r535_disp_get_active,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
+		.get_caps = r535_dp_get_caps,
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
 	},
 	.chan = {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index f25539401b20..01cb97f1e494 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -87,6 +87,7 @@ struct nvkm_rm_api {
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
 		struct {
+			int (*get_caps)(struct nvkm_disp *, int *link_bw, bool *mst, bool *wm);
 			int (*set_indexed_link_rates)(struct nvkm_outp *);
 		} dp;
 
-- 
2.49.0

