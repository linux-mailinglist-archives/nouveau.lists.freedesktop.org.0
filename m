Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2D4AB2B5E
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C1310E1A1;
	Sun, 11 May 2025 21:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cnhAMPJb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5448210E1A1
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBxCpBb9kY25Cnt5a38z8pNqKjt+Dk4yr4D+HbvRZZeYMBkizgTDdaOEargPk1fhN/nDFqT/LRIMhPoUR1F0dLq5JzN2Tze9F8zo5pd/k7Mb3I5GwV7hmTbW7/h57MCpoYBFXg/TgUB3t5Rt5GgW2Unoznq/fAoZFJy5nZZWjBf46UTGruVcm9dQy/lL1Wmudq7fa5lDrI+oCIk0lBLSoBkCcr3Cy/4JzI8Zwnl1fGz3SXOEXFT3SaVrEWnDGkGIK4tzNUjXamYk1afvOWKYf4zcbSRlXVm2w0JSa2Ck/VbXe5X+s/jIASaBD6m3YNY4spnEcGie2rCFAOrOdiNkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNIdxy7uYWePVfXc747QT4XxRQTGynYBHF3Zu8dYiIw=;
 b=QWKjwKz3cleJuQeae6qC9Dx8pOhHVqt4iQQsZTrxA0WKmfj09DJNSk8mdc04Sy5BolDbwNsPuFIIMe2Hb3gyRIBlJfcBxc4qEzr9RQLIXjH1nmm1NVtuoN1PEA+lx8ag29qjGumdudAIC0+GUWhIPYx5KPvE1/SeWDxs1hWDDqR8ecszuOU7EMSrvrNwZql75IfsURIi6csFEG4wTze1vQ4rzaoPyhrhFv0g7Ck7MFVB7vKzR5CU/eC9jmX4UFmuYTFDu0WtMTIXkSZqfzpr1BGqmFBZBoUkXBfDiwkKuC4J8f6T7lTTQewMTyEDyZIsmpTQc+cr+YSgZhoxUaExLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNIdxy7uYWePVfXc747QT4XxRQTGynYBHF3Zu8dYiIw=;
 b=cnhAMPJbOSNkvBdiSaP2xTrAzZGJduMTE84hePQOuesaghDyCYElKfc1nkbNslSifa4skmaXac82yxzNOTw5s/0N4M+ycGAqH3zzirpaOoPZmJA5Qkyrh/ISimqHCeP55RT8PL+NabvQUB48ElfaLbtyn+7a4OF0lq9+/DX51uVytXItC8qWGMSQjTXpz/f7xhQQ35Nw61LKlX/szoPwZ36Nxa/3tQtQblX5R3O8DFLtf+lyDMCpr5WGi0amidbgz+BmsiPt4CvvkYnsg6QUfaGG59jAqUTfb2+21dmosl2bPMJsl1q7R841wzy+AtUq5AXMaUGpQNFNKBHVo+QLLA==
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 PH0PR12MB7792.namprd12.prod.outlook.com (2603:10b6:510:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.25; Sun, 11 May
 2025 21:08:51 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::b) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:45 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:43 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 25/62] drm/nouveau/gsp: add hal for gsp.xlat_mc_engine_idx()
Date: Mon, 12 May 2025 07:06:45 +1000
Message-ID: <20250511210722.80350-26-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|PH0PR12MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 2479a306-ed4a-41a5-ab59-08dd90d007b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l9VM1Ef2GQdipj1VtXygTNp5MOeVPBP9fFZtqBdQE+HCpgmS5J+9FYg06oin?=
 =?us-ascii?Q?NtVAID9jQhqwQMvcN0BVM35YLqp4NfgqHLj/qekItKiEXueDhoG4+B/+wEhU?=
 =?us-ascii?Q?4ByuYyot3K5q/b01xzmev6Ln1EQpDjXN2HzRvV2j/qHZ1G2tRfuznxzutW8+?=
 =?us-ascii?Q?EBAfaWCSOAbtXPetiC3Ruz0xk1HlwKtmkSmFoOZHrr+smcXfLN3BOU0jwEB8?=
 =?us-ascii?Q?/NJCxr3IvPO8xMzKvSKalm/qq4wnTimfnWxU7miDc1MT5An2FE5ML/bS1lSB?=
 =?us-ascii?Q?U9iEVk+wr3fbujWeRXh/4Sm/I1s/EzIlJI7wODabW/jZsADueQL2WVxJxwzN?=
 =?us-ascii?Q?ejEb8LBdHcLHSnfq1H+fbVkfa8C/b/d4TUstoO85Mx28zfrc7QiQWnrh98r+?=
 =?us-ascii?Q?T9ChZ02OAzdEFBNWhaBIUFHYC+P3vYd96cA5Wgrdlyajas1Mf8kOmsH6qL8b?=
 =?us-ascii?Q?N30MJJ9EOVODor8vUvM33dhBI6VedJ6dnhbUDtyDrgcRLyQLCbmletKHvlBh?=
 =?us-ascii?Q?LERIMs1FK8bTWgzF6pa7Wz5zQjBWYjnJ9ChDIFyKoxHQlF05WldQQ6dIzVkv?=
 =?us-ascii?Q?zhDvUgXrJbtWLX4M81r4TUwBpSUmbuC5AFPMq1tNc4JKX6O+yvgsiSoCHlNO?=
 =?us-ascii?Q?PrzhdIWPZsazcg41gXen9dkHygWni261cyQnCGCPDP8DYxdz4L8obNyaIWsx?=
 =?us-ascii?Q?RIkhs80poxqfrYtMv3z8hIDz4Gr0koQ+OFvrp9mGuaYPdFDXG9rRMVLwtVVE?=
 =?us-ascii?Q?DKLVbugztEo+boS00HbdX0CKaV63Kpqide19NBKwAZ+tt4R2Kb2J3W9Y5Ujo?=
 =?us-ascii?Q?DbsdfX9llENvOPcS5ZQlmf9/NIZsKsJEvo2OmQRa2nWh01IOEY1NT0edrLbm?=
 =?us-ascii?Q?Y5KjLOZH2cTDbe6/UXttgI5oW65p+adNJmmAcJzZ1924ye02L/xJRlX0Nw2o?=
 =?us-ascii?Q?j2A5V53B38eed9tUR+Pf0osfNwJxx4598pZLof+3Z1M2Xl41Y6yn114zAHPM?=
 =?us-ascii?Q?4Do3wIiNfNmTyPv56MLDlBKTxOz81iJfVLlHhnUwsEKYCYGmd5jbd4U24mHQ?=
 =?us-ascii?Q?e61A2RycN8iIQyH2t4K+TfsZcvtmrYLce4xAcPepR0ixjUJY2uhJBMOwaXV9?=
 =?us-ascii?Q?DiYzOkTz1ZvQ1P/5+PrqhlTtBibgXXR9aTv+H26hbiYLyBh80XUMauWNTDfv?=
 =?us-ascii?Q?zD3f110cSN1mn8+jgT9CRZUHl7FrHxntJ9UlXClp+Buqnxscu+H2Bin/nHci?=
 =?us-ascii?Q?+d0C5I35pjovOTdIIgzior01WA2PASXXj37btj1Z6LWWT+CHGZcv6HptRbXn?=
 =?us-ascii?Q?hGBTi8asdwIqxdyA0Wb8wgk+yAY/K07pJfWMFEI5zH5U1u8IypzylpjfqdpQ?=
 =?us-ascii?Q?pXpkqKsflIYBi716hKOGcR/sfe2C3GIFj2V8DnYp1xWYpVwq1NfTmiwNoHi9?=
 =?us-ascii?Q?CAfshI70fEHb809URlGYcmXOtgUn9Ua3b09taeboFX4pF3Cg0kZANkeQDIfv?=
 =?us-ascii?Q?wGwzsvx/pnqi6TUtBci0GF0Q40wfKQQOlZ3O?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:51.2170 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2479a306-ed4a-41a5-ab59-08dd90d007b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7792
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

545.23.06 has incompatible changes to MC_ENGINE_IDX definitions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 79 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  1 +
 2 files changed, 45 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 338201b65930..af93116a0fd8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -86,10 +86,52 @@ r535_gsp_intr(struct nvkm_inth *inth)
 	return IRQ_HANDLED;
 }
 
+static bool
+r535_gsp_xlat_mc_engine_idx(u32 mc_engine_idx, enum nvkm_subdev_type *ptype, int *pinst)
+{
+	switch (mc_engine_idx) {
+	case MC_ENGINE_IDX_GSP:
+		*ptype = NVKM_SUBDEV_GSP;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_DISP:
+		*ptype = NVKM_ENGINE_DISP;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE9:
+		*ptype = NVKM_ENGINE_CE;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_CE0;
+		return true;
+	case MC_ENGINE_IDX_GR0:
+		*ptype = NVKM_ENGINE_GR;
+		*pinst = 0;
+		return true;
+	case MC_ENGINE_IDX_NVDEC0 ... MC_ENGINE_IDX_NVDEC7:
+		*ptype = NVKM_ENGINE_NVDEC;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVDEC0;
+		return true;
+	case MC_ENGINE_IDX_MSENC ... MC_ENGINE_IDX_MSENC2:
+		*ptype = NVKM_ENGINE_NVENC;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_MSENC;
+		return true;
+	case MC_ENGINE_IDX_NVJPEG0 ... MC_ENGINE_IDX_NVJPEG7:
+		*ptype = NVKM_ENGINE_NVJPG;
+		*pinst = mc_engine_idx - MC_ENGINE_IDX_NVJPEG0;
+		return true;
+	case MC_ENGINE_IDX_OFA0:
+		*ptype = NVKM_ENGINE_OFA;
+		*pinst = 0;
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int
 r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 {
 	NV2080_CTRL_INTERNAL_INTR_GET_KERNEL_TABLE_PARAMS *ctrl;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	int ret = 0;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
@@ -112,42 +154,8 @@ r535_gsp_intr_get_table(struct nvkm_gsp *gsp)
 			   ctrl->table[i].engineIdx, ctrl->table[i].pmcIntrMask,
 			   ctrl->table[i].vectorStall, ctrl->table[i].vectorNonStall);
 
-		switch (ctrl->table[i].engineIdx) {
-		case MC_ENGINE_IDX_GSP:
-			type = NVKM_SUBDEV_GSP;
-			inst = 0;
-			break;
-		case MC_ENGINE_IDX_DISP:
-			type = NVKM_ENGINE_DISP;
-			inst = 0;
-			break;
-		case MC_ENGINE_IDX_CE0 ... MC_ENGINE_IDX_CE9:
-			type = NVKM_ENGINE_CE;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_CE0;
-			break;
-		case MC_ENGINE_IDX_GR0:
-			type = NVKM_ENGINE_GR;
-			inst = 0;
-			break;
-		case MC_ENGINE_IDX_NVDEC0 ... MC_ENGINE_IDX_NVDEC7:
-			type = NVKM_ENGINE_NVDEC;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVDEC0;
-			break;
-		case MC_ENGINE_IDX_MSENC ... MC_ENGINE_IDX_MSENC2:
-			type = NVKM_ENGINE_NVENC;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_MSENC;
-			break;
-		case MC_ENGINE_IDX_NVJPEG0 ... MC_ENGINE_IDX_NVJPEG7:
-			type = NVKM_ENGINE_NVJPG;
-			inst = ctrl->table[i].engineIdx - MC_ENGINE_IDX_NVJPEG0;
-			break;
-		case MC_ENGINE_IDX_OFA0:
-			type = NVKM_ENGINE_OFA;
-			inst = 0;
-			break;
-		default:
+		if (!rmapi->gsp->xlat_mc_engine_idx(ctrl->table[i].engineIdx, &type, &inst))
 			continue;
-		}
 
 		if (WARN_ON(gsp->intr_nr == ARRAY_SIZE(gsp->intr))) {
 			ret = -ENOSPC;
@@ -2165,4 +2173,5 @@ const struct nvkm_rm_api_gsp
 r535_gsp = {
 	.set_system_info = r535_gsp_set_system_info,
 	.get_static_info = r535_gsp_get_static_info,
+	.xlat_mc_engine_idx = r535_gsp_xlat_mc_engine_idx,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 445793d8147b..aecb066982d8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -29,6 +29,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_gsp {
 		int (*set_system_info)(struct nvkm_gsp *);
 		int (*get_static_info)(struct nvkm_gsp *);
+		bool (*xlat_mc_engine_idx)(u32 mc_engine_idx, enum nvkm_subdev_type *, int *inst);
 	} *gsp;
 
 	const struct nvkm_rm_api_rpc {
-- 
2.49.0

