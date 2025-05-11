Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF9AB2B6B
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612C010E229;
	Sun, 11 May 2025 21:09:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G09CbFjg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2081.outbound.protection.outlook.com [40.107.212.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C0710E229
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyXG9qQYZPub8rcrjLjZ2jl1/PRKmR0yIGdAG9GBhzj40zA/KBLmZ9qflfDx9/7byUwbNK17s+dAeANzu5g4AaHCLEY/9XXSpbalolmWIbJataVGh6amXXdlqvNjur3hjdfdVZq99+DKJqSR4AVLxypc+/sQyDEHFv+GnJitqnCxUxBjcMYygRUvHH2lWRdbIhai5Elq0VALLTRVltbl+H3vm+BIYjQMsD55v5Zw15d9FjiiMr3qkV4P/WKwrSQl/UkWrDsMtmlDFiustIxtqHAmfq6krj8J3A18rUHXGJZeDUpgP6jpOgVHiiTdwxNsfTenlI+TRFiicAWxN7i4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCqxWDzAkFnXL0TqLYhbfCWrd+F0UDSUqvMT2pCSZ4A=;
 b=DybKFqUU2QlPcxbuRFLjSDZFqj+7r23YW3zn+A4a3RPML2G4fQmoZL7QKU1pC8nsUr0potYY6AZ5ZukQ/UMSK/ojfLunnV5ikwWXlyxrBSO241tv/hI3TZg8LH7LC3u1irB85Yn/IXlqv4FoBPeUrkW7fdQtYFVlHlqhXlTq7/8zcFsgZZNyENgzCdthEEzL5ofusxod0n9XiD3mDp/Ph439SNQ33lGJaOCV5ujuwB2HMOmVUqHYgKSOPM3lh5Jc8yvNDCTnaPa8WPnOAeVf3hgy9eu43Wac7wfZ7OKB7cuvU/MvIRxnBU3GesuEi9L+ycXjMtr4tBKgTCMfLlW6sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCqxWDzAkFnXL0TqLYhbfCWrd+F0UDSUqvMT2pCSZ4A=;
 b=G09CbFjgwe8/2IKlrpoiYhk0KrsoRdV0tx/fN/a2iEesMNfyNDo4Du89VvEAwmmD3w8CelTG5uDN2DeqyGmJHau1Iye00OnFZtJ3Gq9eoJyvN2u9kXKbdH+FnGyAvHdHoMwTXr/cmL3T6LfobSDsMuO3vOAs1DvBYNkKRE5fIPYy0tgMQMttQQRywXy/ycT+/tIMNQj4sugVsZbLjWjBslNE92MKGimJ+RkYJloGCOyam1uCUxgxIS+YeUSZJm3JtGOz5IksitbYfP6YgHdyDG83yCQ7wvqhfh8RnM0TeqrG+qrj8g+TWOIMPGpouzSU4I867PlCDXlgvOsgrm3mYw==
Received: from CH2PR10CA0015.namprd10.prod.outlook.com (2603:10b6:610:4c::25)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:14 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::98) by CH2PR10CA0015.outlook.office365.com
 (2603:10b6:610:4c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:09:14 +0000
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
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:07 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 38/62] drm/nouveau/gsp: add hal for disp.get_active()
Date: Mon, 12 May 2025 07:06:58 +1000
Message-ID: <20250511210722.80350-39-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: 0465a4ae-9a60-47d8-ac6c-08dd90d01544
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NPUyK9mpis3gvl6sXlvN7654tZBkXPamC6ifemTywFSlg3GbtLQDB9t1seOE?=
 =?us-ascii?Q?s7XB8UdKk4nrNpv2DVuQCY4LIoHIGTlpA2sXN/Lf3Y05B7W5TKxXt+4jIQTU?=
 =?us-ascii?Q?OZyXYkP3nvsARrGdoHWFIifFlGwMeJLbwFZF3fnTkpY4EY6oYnfsAX57OFhc?=
 =?us-ascii?Q?QYFxBNkmy6Hlqpgon4S2nsX3mmpn+5Tzdfk4BVxu2lkbRXd3KxrrdyRHN50V?=
 =?us-ascii?Q?QQVrcDfq2nC8tE6H2sMomUE3auPToh+zB/gKjlNATODVo1pvOzeaWnzZdIQr?=
 =?us-ascii?Q?plYN53Ff9jW1aN/YptRDToYUax+piSgcvPlhWAbpD8nWcgBLkI7AoWa29hOe?=
 =?us-ascii?Q?WintCbUuEL8mg1hH7XCDwlV4WhCHJaqagycoJVnlYZG2F7cjIfaaX53sbcqs?=
 =?us-ascii?Q?I7Flp8eFxcYNmB+bQlt8vaipYUjAECZ0P5anSFdd9tu6bJqT19oRW/ErcHcr?=
 =?us-ascii?Q?zwztWT8BJsftQCkZSCeiCo4nc3VGZNfJcaDCGM8Lop6Lu4ruzqYZLOWTSxtN?=
 =?us-ascii?Q?nU2v9ww2KaITEHRX3yT9fSG5hRXcrsfbPS1J92WUj9lBSeSfbQTVC9QmakNc?=
 =?us-ascii?Q?atH1SUAhIjt6SBdEW30a8yf80CLZWl5pQTrjVcv2so22jlvpEJhznf2MIRzG?=
 =?us-ascii?Q?FkRom1OjxmUoDBWheN0/9i7JEOm/kL9weHPa9ssBZBGUbUqSAyJiwzKszDbI?=
 =?us-ascii?Q?YHM4AA82n+zluI2O4Og+CRGKxNyrDo/nUAHKye3qPSO/i4Zme/xBwvdTrWX1?=
 =?us-ascii?Q?SepFoTO3k6gf/Ij0K7vBIYnkylrpY1LEMNZoD9lsIc+NtLbrBpRRqYvxJALm?=
 =?us-ascii?Q?/amSmgnWR5JjuP7rWLtu6Z/Tzp0crhxFOuzXV6zb57kooyk3O4MezGfFAJaT?=
 =?us-ascii?Q?lX1AlFI7owwb3Cj8IKfKPFFjwy1DTTVsesb7G3WnUmczqPPfC8ZBwWMQMINv?=
 =?us-ascii?Q?3Aw3kZ3ZlSmRJk/FmIU/ZUXXRl0kzxmUXiArrVWOYVIEDMTjN0H6yGzGp++4?=
 =?us-ascii?Q?2CH/f+ccngmBNSG73XmZYgyFd9HODigzhidZdB9YI1qs96v3Ngyj3bSSeVWU?=
 =?us-ascii?Q?0GpaBVx9K6ZA58tXizZR9YItY96moCAB+7dgL8jNRtUpKiWVnH3XL4kz0RS9?=
 =?us-ascii?Q?9s8ZvvV0c0mj2eHF+E5/LsSkmKhdyItA35UOjFxvp7B/Kly6FKLIb8UI7W6n?=
 =?us-ascii?Q?8XXbwxUo+uvrhE/J15C0SNCkzFUcQ9z+QJnodvLWO9yB3dMsWvqqbRt5yRSH?=
 =?us-ascii?Q?dHbUgFHIGpkuHt2hA3A/HbI0ZJ4rIuNa5ISy1qsl4c0v2OG/A79LUksOKhsY?=
 =?us-ascii?Q?n7LOZwftjbvkxsTBqhic78JbVUS3VQQXs2SoyXeRc+wLsTTpipOGog7xNzIZ?=
 =?us-ascii?Q?XJw0EUYrrMqym8fDDp+4GvJZVmfFqSA3u4XycdvcLgnpOm1sm3RaVpONQiD8?=
 =?us-ascii?Q?4G/ZZC0Gv/thbHmiiwjjCvlF2BMaSwa55HXcSoMSi4VTJvz9reHfbKudIe2g?=
 =?us-ascii?Q?lBIIHTI3tdV7E4WNrvzBW7//HekHXR7cvTHU?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:13.9534 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0465a4ae-9a60-47d8-ac6c-08dd90d01544
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
index 5fa2b05db2cb..46c3556bdd48 100644
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
 
@@ -1753,6 +1755,7 @@ r535_disp = {
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

