Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A965ABA71D
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3EF10EBD2;
	Sat, 17 May 2025 00:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FToXKqQi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ABD10EBD5
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oziLjSkGIT+GeHvIbIsns6etowgqQrWeAhr0enZtyM3slA6e3W/a2WhLPfbbV1C2Q85hCuGcS+76Zacof8pr6Eb4p4Nhu0okW+f8sk9WgGUJAMx4pn/Q2jTxcu2YfZgvhbueNghK75Pnf1cHbMN7H22i5IPV/hT5PkEr6R3V8Il+BS0maww2MANyk2OdRQBtGG/MfJtXdo6lUUx75Uk5fiFdnr1ePivnYRCV1yH7KJUqq6P0prze90TDMiV2zRNnD0p71ibbuoIZPMgUg6vBt6kcbDnjQEvtbNBIKEYqPs9gKdYlWOeDbmIu+r1FXHLWQGqnodOedOpJ0A9lX7/rBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFHpUQ17dCQjuS7AK5w89MYUxyXIHGaf23g054cOmsk=;
 b=soK0lHq5wkxZUccaQxr7Guh+gZ5pHWSlU9BdVQ65eek0OzlgbBvm5LMPHh3Pk3qEFVqCmndOmkvwTC2HjtX7b07vXlDxXw308EEPPdC6xS2hUJHm3zhAUemwcBNS16ErOR4d38V3vL390G565FhewEPdP4aDI0IHWONXZNbAYXD57L53CR/htvh5JdjtRysp19k9fZl8+/Z+eCTdG8I1aIW6gKcFeHY772vlGq84DWVnlUu0E/yEyFeGENkDhl8dwteH405wlYkG6HoZkUoTRQT+ymTbqC5ndBd0qbzj03ZPN3jm2f3DE0lZZQXF3NnTvxflyjlc6B+BRxlixi1wSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFHpUQ17dCQjuS7AK5w89MYUxyXIHGaf23g054cOmsk=;
 b=FToXKqQi7CIU3tiR15uF6OP/0kpyXBm0fPiAaHB5WBluLkYmDicccsMfEwdVyk7Rfqgq9LlJbxk4/1F/NX6LZEtD8Omg0EQ2x1D4r3M8p1uZqDLCdp9pEnWEv3WOqPzHTEDmUW7FVPThVzzQDI/bIUvr1m8sO3Wm6xRP4cKTtvimbUj/3zbZ0m09yw3LvHbxfIfTiuc3kijvlkNrpgfCotWTtdconULJsk24kdb8xrY950wF9ThfqCPf01DEVdQ49aiYnCXrGKqmtU8ySA+DY5Re/2us+CnQFfGbqrsX8oYwPrGoTjx42+8hdxHUWxwJCvSpLi5mjPqpSwUEsVWi7g==
Received: from CH2PR14CA0017.namprd14.prod.outlook.com (2603:10b6:610:60::27)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Sat, 17 May
 2025 00:11:16 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::be) by CH2PR14CA0017.outlook.office365.com
 (2603:10b6:610:60::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:11:16 +0000
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
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:03 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:01 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 37/62] drm/nouveau/gsp: add hal for disp.get_active()
Date: Sat, 17 May 2025 10:09:29 +1000
Message-ID: <20250517000954.35691-38-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: c175e67a-c7e3-4bdb-595c-08dd94d7579d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pg4ovHi7FEcb6Sr+9b4E20gHUvszRMntidFCX0PCAhz0yQzQ639PhuQTK9Ui?=
 =?us-ascii?Q?lBJAXtp74qKlhUGnGeuCjZtNmspjpvB47wwX0Yo89GcfMSoLN5vjlNQfeWGl?=
 =?us-ascii?Q?Mc/JgoMzbSvhYxgjctD5iClUmK1UwGPyUJD8FuAN5ULZdtxIjwQc4kFgxbP2?=
 =?us-ascii?Q?VTOvU7vM1d7OU61+HHlisOH91ds+hdJLLVMQBeHISIrgbDdKBSibfF7hyRyS?=
 =?us-ascii?Q?QbF8aH1f88EM/mMvGuUHLB7CZC4n7Zom+R+43XLNbYYq8vEkIli+GViqVqjI?=
 =?us-ascii?Q?muZ4DLnxP2ofCpv+G1rdDIIc7iWE62A4Vx8lnBp6nSIO55BxAnBKpWryQ3Ri?=
 =?us-ascii?Q?cr61WuWeQGOcj6FoYMgiwH6jDWU4RB58fM36r7tPnJf2lJoZXHSn389UaudO?=
 =?us-ascii?Q?oyfdYxsjlXSsC7xj2PlkwfGVmuJj9qrPizQTD3O69O1iPhN0WLPgyGBZV/Zs?=
 =?us-ascii?Q?3XQJKCiQ4KChssud9m00Ed6gazpbHut7Xcz8lO06lWQs4+WbJauysf7VqW3n?=
 =?us-ascii?Q?QBONEE/gaqhvFjB5o4AuBJj1DHZcJ123L6ejnph34qKq5hguNx+03KiIZp+B?=
 =?us-ascii?Q?jkGNYZSiVO14Ydjo1OwxBG1gqvI4zzPUU0dgGeOxsRYh+3NxEpjQXMLOahPF?=
 =?us-ascii?Q?7EtkQae2TK4k2YpessqfIiEL0jWs+hZ8I5rHm74Ut7Lawd+6IoB1ltaF39m4?=
 =?us-ascii?Q?9xGa9W5+kaK0c4HCFKF5g13ONLx4l068hWDNLxibKIh9aHve+5X2Jf84a5Lf?=
 =?us-ascii?Q?K4QZe1MTM8HGPJxOxq7vyUEd+67ltSPUutODj2RVPCSyhDdf2rxPMGPjlsLb?=
 =?us-ascii?Q?t5YSrA44lxGRvFo7EemdjUGtgUUdgOmgKHW7F+V16bBs/eOGPFjWPSjVU2rD?=
 =?us-ascii?Q?ckKu4Z2oQcH7tNKNS8IfT9Dy09Ut/F5MU66D8pUHEz8iW4c41oqr+lKFwxD7?=
 =?us-ascii?Q?EecBnYDxf087b0GIbBdTCOjaraLFB1YAtVsJrCBB3Eu6UIQ/bxCeAVE/AacS?=
 =?us-ascii?Q?2BUJv0WHu91PBzbQ54fUvkMPGxk9/hekmGwqbnkGsUdqYVhCWUD80ZXyhuuj?=
 =?us-ascii?Q?nB1KtiWK4g9kXi+0L5Y0Pf5ZB+56J3DrlX3ILj9LLRCk2B7d6V+/s75Jq37g?=
 =?us-ascii?Q?2RdHeVr4C7GLthpz3fvoJgnAwdC6qQSFd4Plg+lDRqKOL3bIHrKCAqubrGbg?=
 =?us-ascii?Q?Y7uWpAsEVkmU4p4tkoUOJfs9YzDGCoDB2DagvZCrtoOq8KhC0U/MEQKcSIMA?=
 =?us-ascii?Q?/337bRAdTp/oqZ0WOhw76x76Db9XtUwBC0ETSz1ExZfEf4jy3hJNB8dOz3NF?=
 =?us-ascii?Q?PFrkw5vjKiE/zyrhsTr+C0U+cQxdaaMyU2PhGY78hl7wWqxyUnBpBSHCKaxK?=
 =?us-ascii?Q?mcRuhjw2BLYtHnvDSBPxTa92hUbDagWDbcnurDIPNe8M7bufRXsnn/0bJmT7?=
 =?us-ascii?Q?0no4ISly67gqcPiAeZsaN2QEHUkaFkC6affRAIIAEsFWkmKmCtO7h9CvnFJE?=
 =?us-ascii?Q?/lgARvil4AU4L4DtJT4saRS67G207rx27MI+?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:16.3735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c175e67a-c7e3-4bdb-595c-08dd94d7579d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270
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

555.42.02 has incompatible changes to NV0073_CTRL_CMD_SYSTEM_GET_ACTIVE.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 7 +++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 4df5b2b72d29..97b7e54df61f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -724,7 +724,7 @@ r535_outp_acquire(struct nvkm_outp *outp, bool hda)
 }
 
 static int
-r535_disp_head_displayid(struct nvkm_disp *disp, int head, u32 *displayid)
+r535_disp_get_active(struct nvkm_disp *disp, unsigned head, u32 *displayid)
 {
 	NV0073_CTRL_SYSTEM_GET_ACTIVE_PARAMS *ctrl;
 	int ret;
@@ -757,7 +757,9 @@ r535_outp_inherit(struct nvkm_outp *outp)
 	int ret;
 
 	list_for_each_entry(head, &disp->heads, head) {
-		ret = r535_disp_head_displayid(disp, head->id, &displayid);
+		const struct nvkm_rm_api *rmapi = disp->rm.objcom.client->gsp->rm->api;
+
+		ret = rmapi->disp->get_active(disp, head->id, &displayid);
 		if (WARN_ON(ret))
 			return NULL;
 
@@ -1758,6 +1760,7 @@ r535_disp = {
 	.get_static_info = r535_disp_get_static_info,
 	.get_supported = r535_disp_get_supported,
 	.get_connect_state = r535_disp_get_connect_state,
+	.get_active = r535_disp_get_active,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 58c745554544..f25539401b20 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -82,6 +82,7 @@ struct nvkm_rm_api {
 		int (*get_static_info)(struct nvkm_disp *);
 		int (*get_supported)(struct nvkm_disp *, unsigned long *display_mask);
 		int (*get_connect_state)(struct nvkm_disp *, unsigned display_id);
+		int (*get_active)(struct nvkm_disp *, unsigned head, u32 *display_id);
 
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
-- 
2.49.0

