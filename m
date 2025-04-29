Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E48DAA3C9A
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C665610E59B;
	Tue, 29 Apr 2025 23:40:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ImVs7VWo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 992C810E59B
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQHxcd4AIv7m46RZBWfu+VwRvqfhwNYn8BLzHu6vQ5/MFM6OXKhLo1SoGWlEj0OY76HAjRxTJV80O4wTpg0SWBh2/B49bL2rJsa61sATBPgr91aqA0TcLtDYpOQLdoe/VgdPU+wNmAv0YhQTnh9JgzBJRJcXuE5w7yR7f33HT4EDvVTfseBD0R0P5fC3rvuFDpnPR+IlqWp1a+bqarljNZ40MignFRjrIPZE9WgsGo1eYdkj4noJFIUHV5wxWMm2ey5oADOZ/M4jZ8AWA6KKbVy/hBAd6LckkcJWoCtUbBVJFbx3iCrMWf592CS+vldZjj65mJ+516YFxpebkBUOYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23SQBa7a/E5exGlcKH9jBvBrN8ZfA/F5qKLVPVpHvRg=;
 b=zCU3YzDpGU93bzM4xYR7Lpba+MC0AAdz3dbtadZhJmrdhejcg0xsfAFnT4bxD4gCldZPC/jYIv70T97Q0+7oW373BW2pGs7Rc9IxhhjKrt+hk9z6AuryW5kG6i5JXbt5fzDqrTmRdu588JFNLrK1j4Loy/VkFnDfH/BXagrfmDyQXOOziXnZ6OdgPb+LgM3rpJEoQT/tErSvmhDjRDwY3CyPpRi2V6HoXXQWyoWdAlRzV8CIP5GSMJbXxBNi40Tgv/mIwTjtQwdiG/eEL6OPTjqkjCbe4ykK5kjFbAtehayy0oZFnAhKEj/vdtUM17YBInyXfQO1GJKT1F8kIMVidw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23SQBa7a/E5exGlcKH9jBvBrN8ZfA/F5qKLVPVpHvRg=;
 b=ImVs7VWo00uyrh9kUWW3srX4dj2XZsAd2mMoOUDpiZBxs4jITLeW/yOYBaFE7u9Emo4wM0x/KlCG3vsEvhm0E/k/D282ddsCx62z7hgerKSSgWkGp/qu/lLEw/3JXIDIYFVv+NWv72Odu0O7f1OM9Aod4NlP8cR5AsGpIDDvroAGxEidOdjnDuk6kKZvXMb+OY4YS+dnZGZ/4TFxFFd5qZXjOepMkUetUQcLas2bFlmqwc/iIzynmKVbGiy7obOb8Td5zgH4Fb4mFFZlnGpvQKR1HsKZTSNXwApLtCeut7RW4zxC9vERKXiXhDi1Gw1dlP3syTDvATNIQxyaov0g1g==
Received: from SJ0PR05CA0014.namprd05.prod.outlook.com (2603:10b6:a03:33b::19)
 by SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:43 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:33b:cafe::5e) by SJ0PR05CA0014.outlook.office365.com
 (2603:10b6:a03:33b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Tue,
 29 Apr 2025 23:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:25 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 38/60] drm/nouveau/gsp: add hal for disp.dp.get_caps()
Date: Wed, 30 Apr 2025 09:39:06 +1000
Message-ID: <20250429233929.24363-39-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|SA3PR12MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: d30beafe-8615-4a2d-69e4-08dd87774191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MKNFsKBfR/E18auj5NGEi1d7tZNPojDOGi6c/s5UvxLoO0LAJUMVdSi9Du6o?=
 =?us-ascii?Q?fbtcQ1XrDRE2ckbshdqe+tpQs8FNddoSH9MAT1kJnaMIU0xKr2vF7D906jkE?=
 =?us-ascii?Q?eCuqmdzt8B/GwNDzyBi9AYTkionp9AImKze+qafoQSa4Zmclqty1oXreq23X?=
 =?us-ascii?Q?Y6/WVqZrEUNLtCmnJJd2tL4T1t2s8IZKw2haMlCtzr9ocObIGsyfU7d/Jpza?=
 =?us-ascii?Q?soAMUAhfJSVJHxBQn72O7RNwPWggz9ejQw81q8xEAvjLyRA9hZRqvIFX4Hxk?=
 =?us-ascii?Q?bQbaftL9eBdgghdQcsZhS4W+CgNTirCauNOerDjcv6rd112iS/9jeHTir3NC?=
 =?us-ascii?Q?3YRT+vCsHMBnlXGGca/NBEwFKyzBKDt+QDAzGVPHNCOFZmzuyTDLQ3UDAlnZ?=
 =?us-ascii?Q?ecC4dFlRFTBtpXLlrQ5T7Pw2fMX3bk6cYoNOdPhCRni9Db5EN5x9t3v+sAAc?=
 =?us-ascii?Q?1I4ZrfyZEvXDnpG+yYnDakSdYsFsoSl3rv3tryMNYtGrb5uAwckdsUAB1mY+?=
 =?us-ascii?Q?YS2UKnupT01ObSJ0qStWj+EpzPMilJ7K1Y6z7uKlFWVez9GEQbaMgbjKrlq4?=
 =?us-ascii?Q?UKqlVjrxy5qHsPCraBLuojR3N+8C+30Y+h2vvY+vlNZsRHiU9y76d5kTShNC?=
 =?us-ascii?Q?LEu1HqPf+YNcepbbusdVD9QOErIjE6UA8+p+nZysR2/Grg24ZIbLNgupY1PX?=
 =?us-ascii?Q?zlbhvK/6JyPAFKP4l8colGjDBjMjRde6G9F3nA7Y++bZTCFLZrGfMBQwpTnr?=
 =?us-ascii?Q?ti0BSbM1Dhln8s+pXJ8JrEC+EINCMC/GL9xvwgWIOJ0PKUem2fM1lLiwdF6P?=
 =?us-ascii?Q?5/bGqaxRu9jCadbkJHbLyHnPqHfeb7xMAaCYmgSGBMzik+AiRE5if4YYnaho?=
 =?us-ascii?Q?o24L+SnIUOGqVG2NZdKM+Zj8gAUrgyByCOdVKfoyuHrP3VqFypUw0tLgQkVm?=
 =?us-ascii?Q?YbUpSYw0IQ2OZkxrO+xSHNZvLyEkDzmEV3uCPRffLGjMIfXQh29vd0CpCGPC?=
 =?us-ascii?Q?aFEKqryDS9+TCgOZdXdWVsXHHlsACkMPqFS6NVpewUZWYwdp1jpiwk8ROUtx?=
 =?us-ascii?Q?+3557QDSFraF1/Vwz2SemZ45VhmMRXFUpNKn5pnDpyFxw8Ar/RMpMXs32J9E?=
 =?us-ascii?Q?cxFeJdwJLqCVnwekZFtSIEUwuMuNhZEMfo39WInJnSAovPcInwZkMW3BaOj+?=
 =?us-ascii?Q?/xvPB1OW8awhvTdEd6NJdTCYnhc/IVVBZGsffMIzivN1tLaNON4KUtKGXRGt?=
 =?us-ascii?Q?/mM7zi5JvoHYKwAAal1LFXA58HqQK2Ujid8/GEXLTY+H3WCZ1a9PGCP/DKrl?=
 =?us-ascii?Q?8J1otN6FCbAxRh0izGCMTKoa8nDRMwKJ/DoBxVrNGz/vghPURTyOo1Z7h1N+?=
 =?us-ascii?Q?I0j+UuB8w0XrOmAYz/EQAgtY72MoEmITLPio957Np5eMpnLP76XhYhrXowuC?=
 =?us-ascii?Q?UBP5CGbOAdKiMHlLASyTFiMd86VlX8392Ls83gu7GOAqQ/ydtugSpwddP28a?=
 =?us-ascii?Q?YVF8WMQHhXh1FS+fpAW0w05ZHPhfS3N+SL13?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:42.5933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d30beafe-8615-4a2d-69e4-08dd87774191
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8802
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
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 81 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 48 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 769a05578f04..ef463a890483 100644
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
index f025ebcc7d69..6a6aca0afaad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -86,6 +86,7 @@ struct nvkm_rm_api {
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
 		struct {
+			int (*get_caps)(struct nvkm_disp *, int *link_bw, bool *mst, bool *wm);
 			int (*set_indexed_link_rates)(struct nvkm_outp *);
 		} dp;
 
-- 
2.49.0

