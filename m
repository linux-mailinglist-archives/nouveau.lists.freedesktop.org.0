Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D676ABA71C
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198A810EBD0;
	Sat, 17 May 2025 00:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JrodOB/2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC11C10EBCE
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cb8UeKeMkAcJSRui3h/7+1eloUIFjguUN3SGhSsBzhcA3VLG89VXiyaeQAecZPflQK1p92uYucGYney9508EvpxSPaUdBEdXM9xuY0ZXcAH2MPQR5wOgCBpbECrBU4gzgLkMEHxIm9gm6qQCI58pSj918TPlBoZ9eWLtUAOXxMuCDGZJL4E2Ix8eD32VMurQIU6NEWSBK0VN0R2z6+1UopsaaDFL4siLERA2065pBoqyz9XlBlDkOJ0TH/9pDe0TNERMulY1FFrXh6LMVcsg/24/1RbwIQqqL9DYYIlPn9cqA7R2lPSQ9O47eGGhNoPzgr6174lT5Rn6S3wsuzaeuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGFcBMoaZ5RzpTVFoqrk4Cgw9Blngj2j4BI6+68eiuI=;
 b=iGVnmrqVyKnOu3dBhpmdbc1v0Or4CQIKiA+FJpPepmZ2ewKnYX0TsbvElpyj4SCNtcRGnpdr8T29/Bw5P1DkN55YtEkd8/a3ufb3NGvRCljT0aFzgjzZR+R4oWQqljGHQ9RHGfuC6+sYnrsFKRCP1uwcoHdpTzne88E1qAekNj60X4nDW7OMO6fq8wnUkf8YMwwD6Ul7mlQPUZr4TrqBBn+6vQsmBs/ppLzrgqe25J0M0wya3fFD6JYlaYXh83coEDZyG2E423EHpLPUHD+AOkJnlzXwbMt0VMn/HzrLv3GXbutLkx445F8FV/gswOqpF0+sasx9n+1B9G7jcPxn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGFcBMoaZ5RzpTVFoqrk4Cgw9Blngj2j4BI6+68eiuI=;
 b=JrodOB/27yVkkaFgKkiDgq5b2ICLVfmh2ylqnKPf/CBrdanxzCuwGceDz/gfdoMD5GOAEqpPWXRNDRlG12XNpzxWarMqf1XLHJTDx5HPT0VlupxJvpkHCpgucNXHYca404tQa9aVvQste1esWp0G07yptwhf2fsZESZfTinNq5zLAbylFjQkHbXDE++w0Rqu1NA7HJ1dK3wuQ1LMrYBDo5vJdwVjBfq+uBYxa3oc8bVe2vgIWQSUOradlf5u6nwsqKRJt7OM5pownIXR+fU3TZiJfqy4Pd6olcjD8KRA6nCQApUCpu7sV0ZTgWVOzVFEbVW64FXHK8sYMCnDfGKVMA==
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:14 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::b5) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:01 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 36/62] drm/nouveau/gsp: add hal for disp.get_connect_state()
Date: Sat, 17 May 2025 10:09:28 +1000
Message-ID: <20250517000954.35691-37-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: de17003f-19f1-44b8-095e-08dd94d75699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D89KHLvUAf9K8jGM372VFNer2OU2R2LzQAGd8PlLzWAOjOlG2spG/kUtkfz/?=
 =?us-ascii?Q?VH8alhGG0yszk8fMqMl9gpzXfpNWCyAyE6ySu2lW73+K4VLGtHEatP5fHrZw?=
 =?us-ascii?Q?ccTzl4a18q8bSiSiy09YUqN1y7dXacB9PLEpfpmQkEDF2v8qG0qysh/2QX4q?=
 =?us-ascii?Q?N4iEdlU1D89OxgShh6LmIJ4qdKV6H2U5jTMuSFXQ/AEMI0keZVqE845233md?=
 =?us-ascii?Q?FOpvGaAxChkCV4oUSFh5mbobeuFGP/esQYY4o58k4ObfYs/YykGXl5KvuBam?=
 =?us-ascii?Q?eRUv8+mI2J2irK3VVczjf2IM8r3MTyAH4TfuMDCzy8EiBOAl+UCMkpzLG+cX?=
 =?us-ascii?Q?ksIG5xhgqDFP9af3oo1gO4GtZHE+mUO0BYJjVkmcgy5EsTS6UXKIoRZ1Lty8?=
 =?us-ascii?Q?JmyHxhvcWp3DIt6lb+xbkkw3VRUdrIhgw+0FxWQ9l3jAuvQ4d88MqyrEmHXh?=
 =?us-ascii?Q?J2o4464w2oxjxHPPxV9P5VBJXVwjFriO6pdU0aZt1ouoOf9dgPtOFe1h82MB?=
 =?us-ascii?Q?N5dI34gIXtgisEnMx54ycUNO3NLdfx4lRQg9Ttx5mF6J0C+f2RQmnQDCOPFN?=
 =?us-ascii?Q?te0XG/0dUHlYN8JRrtQvHpFWSkyIW3oYn0pD3DEQWwXLcJvyXKVlifhKLdYQ?=
 =?us-ascii?Q?ZmmeY+WYWErYG8zB/iylVSrv1lSL7Piace6SYn8A5oe7W5uiH//yWK2F0zJq?=
 =?us-ascii?Q?YrKMEAvhxSglw8FFZHB4UKgPOtm/xmi5Oo8HlIfaLGU3nT9hPm3jsz/xlCQl?=
 =?us-ascii?Q?jDzh3K0UuKvbsQUOhZoG1CgdRSKWLOteBFGanGPMwlu9fQUbxv4ZoBLKW52M?=
 =?us-ascii?Q?xwKs7tibKg00H30dyxXmJyfPC47u9DSDjpHJtcypoErJmhiqK7x84yU/koWM?=
 =?us-ascii?Q?w8q83sA3LtZB1R9zE+ATchR1u6XWVHlPrr4sidojl63pFaAL34rdmXqQ1ZKo?=
 =?us-ascii?Q?fQcVEPbCx/xSged0Qf6rPPzwX9L7RwPm2mhudluZ1yS9jsbhqM/Qj5vMHCaR?=
 =?us-ascii?Q?Q1ZIzAyP8bgP4d5v8uXAdv+Zly3CI/gTshqyWS0YecsTpnXFrvTgPHxZrQie?=
 =?us-ascii?Q?9+eb865SySpgDvClUk7T2VqrCHnKMko092Kr5G8739rhPvFPgU39otE43n2V?=
 =?us-ascii?Q?WHhSZ7D0mG8HUTrL7Z6OXPwqDcg3Egu8CxjuoyOFZZbwMTdnrXuCKz/m/MzS?=
 =?us-ascii?Q?+L9mE6+Qe7pI6U5YN5LXBR3nY3UDGx5VEqVodKm38k0kx3lvpu0s6ohDSlTP?=
 =?us-ascii?Q?pXXn60iIRZlYliew/wiKt4bmNysT5sce+dicsaaI2LDOyEHavwIArXINIjPR?=
 =?us-ascii?Q?sVkweDHyDfh6HmNNVHVRSHnX5fifgTwlNZ682obVIamfmVujU37T8XUGdh5c?=
 =?us-ascii?Q?H+QyO1s6zvniBccjolCfwAgr5762qlUuDmpGaPmg27R86dccRpdF7xDdEr6Y?=
 =?us-ascii?Q?2TsJZyADQ22ZjZAHh3x6aHX80isdFS2kJ2EaftWI2ZzyfX3JlxNcsjJnPndy?=
 =?us-ascii?Q?w9OZP8gvWFe6IMaUYKi56/TKF0/ba2zR0iJw?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:14.6723 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de17003f-19f1-44b8-095e-08dd94d75699
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431
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
NV0073_CTRL_CMD_SYSTEM_GET_CONNECT_STATE.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 28 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 40c50d9fca0b..4df5b2b72d29 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -852,10 +852,9 @@ r535_outp_dfp_get_info(struct nvkm_outp *outp)
 }
 
 static int
-r535_outp_detect(struct nvkm_outp *outp)
+r535_disp_get_connect_state(struct nvkm_disp *disp, unsigned display_id)
 {
 	NV0073_CTRL_SYSTEM_GET_CONNECT_STATE_PARAMS *ctrl;
-	struct nvkm_disp *disp = outp->disp;
 	int ret;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom,
@@ -864,23 +863,29 @@ r535_outp_detect(struct nvkm_outp *outp)
 		return PTR_ERR(ctrl);
 
 	ctrl->subDeviceInstance = 0;
-	ctrl->displayMask = BIT(outp->index);
+	ctrl->displayMask = BIT(display_id);
 
 	ret = nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ctrl));
-	if (ret) {
-		nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
-		return ret;
-	}
+	if (ret == 0 && (ctrl->displayMask & BIT(display_id)))
+		ret = 1;
+
+	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
+	return ret;
+}
 
-	if (ctrl->displayMask & BIT(outp->index)) {
+static int
+r535_outp_detect(struct nvkm_outp *outp)
+{
+	const struct nvkm_rm_api *rmapi = outp->disp->rm.objcom.client->gsp->rm->api;
+	int ret;
+
+	ret = rmapi->disp->get_connect_state(outp->disp, outp->index);
+	if (ret == 1) {
 		ret = r535_outp_dfp_get_info(outp);
 		if (ret == 0)
 			ret = 1;
-	} else {
-		ret = 0;
 	}
 
-	nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
 	return ret;
 }
 
@@ -1752,6 +1757,7 @@ const struct nvkm_rm_api_disp
 r535_disp = {
 	.get_static_info = r535_disp_get_static_info,
 	.get_supported = r535_disp_get_supported,
+	.get_connect_state = r535_disp_get_connect_state,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 3f0cb6790f00..58c745554544 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -81,6 +81,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
 		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
+		int (*get_connect_state)(struct nvkm_disp *, unsigned display_id);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

