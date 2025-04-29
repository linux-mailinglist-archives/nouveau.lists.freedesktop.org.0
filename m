Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFFBAA3C94
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0456910E592;
	Tue, 29 Apr 2025 23:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SLlL/6cy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F6310E592
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pn/WHkHWXU2NobXkznwJG896gw6o4FCh+oc5OOOqmRHRLV7FyQlNN3NeSBCmax8o9oiHjlZIDbbMrsDIKwzuS5e7Y8oB2KXScxlhLjVDpYiXJ0p5fYUBL4P9dXoASUPFQl/40YiHXLcQk2IMcnRQyJLgXvPf8Hta/Z1Z0WMpHP8R7XfuUDPRuecNVAf0En/LgpruGMOtFZk0Ek9LhoSVak2scu2MonwSUehKapCiZkf46e1oMzwVb2OlKSwjJnZkljcN7mEuYj8v6ZdO1y+ryeVJxSP+dVQ7VlLqXu7Us2auUlQMB7F/BsrjVhRMe5mZYUbM0rfjwSzoMJ2gLEcohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dGCQoesK+rMQWZLE2RBQPsQHgqqmICVB4J4q9PK6P8s=;
 b=ZoFhbQDSsAB8ecwT56o8C+pBUypKU0Y3XnOc/xy8s2xC6zibsp14R6FWXKMd48O/wUQFB3eezJU1jkeLP7j3NWYdHU/ylugY2Fejo+rNwrMkZOuDw3PVJZm4mLkqS+uBYlGibbgohyut2gsu+tEKm6nC5vNRGKHLV6mEUlkp88iZeQ6AqoWH1HJUcbPDE+JdB2aw2sruPHVjn5SRFE5jyaEeX4CUF2C993g+gPCQ0LC6YQPwbQrxs6K6Q/ztL13Jxkaj3HMfoU+hdPXliNoaQbhj+DTqlKuqecbA0d8rIJ0AXES6jP5guviKj99Z5p2MoaBipe5xr5mhZ2fx4yJfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dGCQoesK+rMQWZLE2RBQPsQHgqqmICVB4J4q9PK6P8s=;
 b=SLlL/6cywnvhO04UVQSpg0hQNKGyyss5t72H1EVcfQCCgmOL2jk9zsxYDGUyizMirZJtpMNICzVnFs2wYOyA1FP1QdkZAM64bWxmzla7wbziRyVvF/YU3I48gHeAE31JTNUR+8ysFK0tzS3SCjeZRhs46C/1IOQ8cEGI1xYJ8BcZZdh4LhMFGiE2jpjLplbK6ly8AGLoorCN2ER5IL6ihvoDUsRTcN5zC6fGj43XrWoVyYS+KjBpJ7yVVBGuNtnNfnPiPvstDujPqZjYe2l3NDqL09rxJsAvxLJRtUufxI9lDGArv9yovoPwJnJBAIQEbSuP7M23OUjrDDNAS/jQ/g==
Received: from SA1P222CA0042.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::16)
 by SA1PR12MB6895.namprd12.prod.outlook.com (2603:10b6:806:24e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.35; Tue, 29 Apr
 2025 23:40:38 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::37) by SA1P222CA0042.outlook.office365.com
 (2603:10b6:806:2d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:23 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 36/60] drm/nouveau/gsp: add hal for disp.get_connect_state()
Date: Wed, 30 Apr 2025 09:39:04 +1000
Message-ID: <20250429233929.24363-37-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SA1PR12MB6895:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd81c96-e4f8-4253-de79-08dd87773ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p1GOAumy4mwBppn5lduHP/N1jx9PENdE1eTEBmz5SLEN0+vZv2asyAif/pO3?=
 =?us-ascii?Q?u5hG+1BZYGg7dxgzAcTT7srWZc7a7U+geXefHyf6uYCvq+g7VZO8SRGpoMEs?=
 =?us-ascii?Q?jtRTbs7/O2ummEsdFHPIN/OW/WC0DX/8p/0dqB+GiAImLm3SC30Sd3VtfWsy?=
 =?us-ascii?Q?s73Rm/Cjnuojb647htcitd67Qt8Mpw8VSNc9LEiAy6Tow8gOFzgA3Mr5o8Hu?=
 =?us-ascii?Q?+cpOcR+aq+ca/nkovag834iZGRqNkdsQeFTHM4FRko5+o+oTzdCF0arnT+X5?=
 =?us-ascii?Q?kXqdoi1rO4yH5w3UI0TJ61xPITCCABkOefpg4sXiUpqmDTaPn0RZIMCpLjLg?=
 =?us-ascii?Q?jp3wNdF3q/oM1KNroG8NweKMQ8b2tJ3PNEOrSPZLUYsPkf2o5VTaKw63Qt3M?=
 =?us-ascii?Q?0m9snJMSUGCeETWxGTrDm8LDg6TxvBOjJe0bUn1yvfVkawgt9duLYMmnH4sc?=
 =?us-ascii?Q?Pinc6zEiI6MIMq8M5i5Onq1Bw2/M2guUY4kFT90fe8pb6mznRbEH6wDJH+lK?=
 =?us-ascii?Q?/YLkSCnZqVpkMXs98X9g0pKJtZWFF/YcrnZEuI8LZFykr34pUHJaKIEdOH6s?=
 =?us-ascii?Q?eRCEyX8MYaBiuuv8jwLyNbNfGP8Drdn2ozNXD/eOJ5QS5hfpfMUHNnzRdo0y?=
 =?us-ascii?Q?x2EBdlw4puP90JCgIs8dq5GFU1oqeF64w93sZJkbBgW+nloMsJfoZNU92mxd?=
 =?us-ascii?Q?QyN4djcOxCF72N1vtgkWkLFZgseDQQPCTnvkW4UfY2EfLCKs+6jFYPPAI8r2?=
 =?us-ascii?Q?C5DZMnpRgAcGVDWGWoSmggiQ64t/mW2ewwuNxzo538Hw+hMtH1LOkCwY72Xu?=
 =?us-ascii?Q?6OpuSwwYTeTRa5+N0N8E4ExPKgDwoFbV7qxYbvq95/2uNAf/97ZYdZrSTmea?=
 =?us-ascii?Q?DJZ75K3R9BMjiF0yACkgqeb6fSkwjOhX1X/0AWN/0camHuxgBt3ypaIRI1ak?=
 =?us-ascii?Q?y74Xg6wLEU6En8EAINJrQplMfk2K1kT+KpcSUqS5TAd5NL63koh2Qb3JR9SQ?=
 =?us-ascii?Q?/totJJqLiN0fYK+5h59Cnh0LMNUonMyuWV9ngoxlfCtkrXZIKO0HJkBupNMd?=
 =?us-ascii?Q?hCELsSlUXdJpwxETWwYzqu2Cl9/AHZhDwu3n1ArpVoqQHtE83eD0ZJ/VCDm0?=
 =?us-ascii?Q?3sa06KSry92/fSJomQx5k4pkG/7J3Zuakmp3DSiPki2bO40Dm0aWzEiWSJ3l?=
 =?us-ascii?Q?70RxpviKR6/wf2eseI9EexOA/JywC7YGByUharxaLfCOA4gAFRJ4IxHODAam?=
 =?us-ascii?Q?MbEgKZPIsgpl/JvER9D1TMls2Z/J8yvd1Isn+1MfC87+5scmco0goxtohk+w?=
 =?us-ascii?Q?cfWdVFeGI/OnfeGWkEO+dZPEwyTjjb6HyT68v9zmvXrjx3Vnu32WXbzB5JgT?=
 =?us-ascii?Q?g5hmJ4gE2WKg2hN2kaf+mB7lkjb6Gzrp5loZfMHvo+62rIg9EinTi/+77J07?=
 =?us-ascii?Q?9gqc93W36RYlcUDEH1nec7NA4Q+48WUXMOVkOgIouycUmNBJUOyAmycA9So4?=
 =?us-ascii?Q?Eh8QDkHk8gLoyBeJJRpqjpyowWO58LmUAIVo?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:37.9946 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd81c96-e4f8-4253-de79-08dd87773ed2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6895
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
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 28 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 46eae0a61827..b055aa37edcf 100644
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
 
@@ -1747,6 +1752,7 @@ const struct nvkm_rm_api_disp
 r535_disp = {
 	.get_static_info = r535_disp_get_static_info,
 	.get_supported = r535_disp_get_supported,
+	.get_connect_state = r535_disp_get_connect_state,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 8bf2456c78be..138e7c77b0c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -80,6 +80,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
 		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
+		int (*get_connect_state)(struct nvkm_disp *, unsigned display_id);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

