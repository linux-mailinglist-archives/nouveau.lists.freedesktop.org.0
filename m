Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D870ABA71E
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCCA10EBD5;
	Sat, 17 May 2025 00:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="alTzCDv2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BB910EBD4
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TI0kGy40dn1fifo//YExfllqShJXaec0BF4XjhkgyW04kqNkmMj60qan9OjOrlSys+0IQRm0J88vvS3U13meXLsdMCAnb9x32iZL71Jco0oEyAB0xPCcF+upaZNXVjCMxuE7kFMuV8w6YgX01KAgCCrpHyrr1rbvZMUCXhdKCORczPaoXNfPbtynJzlZCnqZHSH0z9yDOF1jMaAykfXZMr5YrS5/Hj0FukxFssfYh9ig1KMT8D3nedp1CITQdofaupdAWMVnVx+GYdg3EuOfRE7XHQKTPV3yfzwSErsNCrmZOengDnzeLfazD9IviknttFFCtc67s4HgVnYRz25ogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrwXmvqNr4ndy0JyWHeK/oidICdHi/0lUXjM4EUzzv4=;
 b=mabBUjl909Ju3wcHVaQPuEG5nmEyty/ieENj1e1b7CXKSh4iYVxRTi6mUS+i8pqEbHddZn2gB7UcfKRMN6igQvF+c0XFj0KZTU1Lr3yZaAqaHiErwzIMKDCPuHJ3MlX4/q7GkV8lNI1h9VJ+9y1z5D2ykFstnsPwZPAXRXd1d09MDQjchbQi3PwjcY4iWYLtLUk8TiprvmfMFhexVVUnS+f3B3Yk9iumzo+aL/nFJ4SA0E/Bv2lY+Kw7CNsbLuSyvlAyaEnnJbu/Y/3ooVBT2a0YYk749CjrKTyc6HmjQZ53lgPK+jaWI3hiCbvZxb1s5Eguou1yRcseC1bJOdlL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrwXmvqNr4ndy0JyWHeK/oidICdHi/0lUXjM4EUzzv4=;
 b=alTzCDv2NqNmHngpNq89KlSaxyGgyTcJjkFLo3fQk6ckjmXSn7K0e9eHrBE3bdeEiVN5/NWuBZfkSpKT2dPuE70fpvQLMoH+/2yMKhyKginhip8In+SUOvoolZ1yt1NtSxPaCRFdKdjRbc5X5Qm+MOF77GKJz55nJHPMGoTZiLA4sgWrSz+rRSF209/nJM788nWOA+WipS02hPClk0U15ueyPzHEvUVSLwgbl2+K63mm1xzVaYRiqlHBLMryg3INErpTuqRj6KXkJSHADp4lziVANyzsW6Lu9HbekylEgATb0z4fc/M8IBOqprgJ4H3e27nV3g2T8xh+WL5P7YZ59g==
Received: from PH7PR10CA0023.namprd10.prod.outlook.com (2603:10b6:510:23d::21)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Sat, 17 May
 2025 00:11:19 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::f6) by PH7PR10CA0023.outlook.office365.com
 (2603:10b6:510:23d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.24 via Frontend Transport; Sat,
 17 May 2025 00:11:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:04 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 38/62] drm/nouveau/gsp: add hal for disp.dp.get_caps()
Date: Sat, 17 May 2025 10:09:30 +1000
Message-ID: <20250517000954.35691-39-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: 7360ecfd-b6a0-4c78-106d-08dd94d758ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uFJp0ujP7DLfvlI82QwPCATmzUh0UW9jA1MuV/p9Ad68TLZpW8N5WxU/TeMc?=
 =?us-ascii?Q?Im/3Mdw8ASEMVy+p1BREsC7SjX2P3ci23ck8l12VdvveVdXWCCYDjh6kGAdp?=
 =?us-ascii?Q?Yqrj6Su2FrBoD0IelE0KM3JKor7P6wzWVh3eWGQDsrC4H39nM0vqGpyU6uTM?=
 =?us-ascii?Q?EZ/7kcaL8mB0bxrAjyQAnalNug0rOT3p49OtdhP5dDq/DZ1LsOSP6mO6KTXm?=
 =?us-ascii?Q?dfMRysJeuJVoSo084mVX0OfclHCmvaP2NjEqanKect+4bUsn2SAoH8np6VPt?=
 =?us-ascii?Q?Ni6xcVS8UzchZi9GHOHvIFJMCNC8TTZvkeYuQN+wHYSvyCr6A96UDxQU3XyD?=
 =?us-ascii?Q?e3V6O9h3cA267Y35MQ29bEWQtYYRJS+GP+Ra6OTYAZCrEEd8POBGaydSJ4YC?=
 =?us-ascii?Q?8zdF293nWUMnC2XhO8MEBQuPHqz3GsQIm+H2ygv5qMg+LFIPdmgkK9rzdKC0?=
 =?us-ascii?Q?8Eh3PKDfOWTBq1uvnHevoeek0GGWmJF6tDXX7dRcU7cUXaGbLIYKL1ePA1hR?=
 =?us-ascii?Q?/KgJhHgI62SyyAxlYDaGhdSPLcbkNPl6YgeeIGt3TUWB3v0wM+MmBctJfAZs?=
 =?us-ascii?Q?sid+ePt13rjeVwb2vjgUNYtXob2+SE+DgAUParMraBNRSMHbUCfMkg/PR5i9?=
 =?us-ascii?Q?bih32rY+2IQvnkfRay/gNdH6zSYMBIDOBpCqo6fTK3SKzK58YPT+WUaacMyL?=
 =?us-ascii?Q?jLu2CKaDSZ+iNIcdYWqror5cdJ+0vlpdICaXu+rYh/B4vYQe5cMqImcFKbAG?=
 =?us-ascii?Q?pVhU7QpUsuDxhWNf0LGlvPee9NSNMSjy5/oy5XioakybSmVb78Q2kBWD6BTS?=
 =?us-ascii?Q?x4goYoKTLBpfqS0dPKi02OSJlFxakKBKpbHnCnhJKdv1F0sS3hsOvtXxs+D9?=
 =?us-ascii?Q?vE2l7jaT0BqMPB/dDqAvC8uvpttytHZYVeixUq+4EzT9V0R4L3fvtOBuSm3O?=
 =?us-ascii?Q?QOMX6KHf/puzoAs81rB4lzLiVBtuP5NuFHiUtx4OZ5+nlPCWQYTI/jFejXTJ?=
 =?us-ascii?Q?em2nGU+WIpNJfmc898LNMyx5ZafaOWaVUJHDbp4j3P3f1PLdG4hatCiaisIG?=
 =?us-ascii?Q?ik31T7fmY8uqOzlaDWkaYYlpmR+CoeKNgvKN27bbIsO5SJRM5Pi9dE+9uRRk?=
 =?us-ascii?Q?nj9i01GEh7hUaMujLHfPH/4cpboLquC0fNH9p2+AfVagwkicW/TAobtMrbtw?=
 =?us-ascii?Q?KArrxxSfQQynMAkcTkqGlsccwqou0ANwoQrdQa9BD6xhUPZYWMe1Yjn636Ko?=
 =?us-ascii?Q?5Dh2eS9gqHTX3Ydq7lt8XfMGokdc5rk94MyPsgFISwFRycztV1vjZMj22Kse?=
 =?us-ascii?Q?damNoaVTs8cFvQkccPOlFKrbw8OZagMVeUd/mN7j79oxkjhlbMWEZ9f1CVUc?=
 =?us-ascii?Q?uj/AQI5Cx2wLs2WgTePwb7F932g+QJdOiu/cedsEM+rPDI937TwkmOwiJtBQ?=
 =?us-ascii?Q?K7Dxn95c0SYrrBb36AhgzbIj3gJ3zUvIivIswWsYGjmusuUD47jOcaWu/+ao?=
 =?us-ascii?Q?TX7sXLuYqoMYEcsk7cFLq3/fdhRycYrQbxg7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:18.7373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7360ecfd-b6a0-4c78-106d-08dd94d758ff
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
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
index 97b7e54df61f..14187e1618b8 100644
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
@@ -1763,6 +1775,7 @@ r535_disp = {
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

