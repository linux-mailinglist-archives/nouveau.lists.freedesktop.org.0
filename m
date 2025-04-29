Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EBBAA3C90
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6D9310E58E;
	Tue, 29 Apr 2025 23:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XeZC6xHC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ED910E589
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvpLUgyh7fYkqzqfcimY2q7CvDdvOu0mE/+2XpPZ8WBE/WYn1zxR/Gw9vPX5z+CXmn1/bDxC4J4+Hh0zEWTemoUm5dHp4kfScbStHCXF2ur2FknOT8Jb6q2Ioxu03C0BLl+Yd33PlPCsd91tmIi5eHHaj/9cPZVoFNucwJngqt5LfkMmbIIuDABi+Y8RtEomc5HQIRwIsKqtF2aL1DXfI/VWiar0L0Lob1QbJ2kCY4+GEQaqz2GWnqfBVVAU1e7SsYlhg5lF2gGFUW0mOJcNOv4bGAUucudgwQYD77V4kDJ/wDW0ZaNxFE4kazABgni+bZ5HoeDdRDbWzB8ndI8UUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BhKTmb9B8+jAr3cYXAoJHtnmzexNRba+jetk0O0fh7Q=;
 b=k4LbYNfSvaqSh2SifwVzvASH46ZVphMD7KykWkWy5v6CXSVCS2EuDePUthAp0a5bIuweqIaGpKHJSLiT9vlrYJW5ny9ls6kWJFskiS7XPsAqGhWlS5GCRWB2+67obY1FE4dlpzd0bVL6wrkUtZjdVAk5NWhAF3+g3DVozAMYHHNUsTFXDn5uw9c5EAexwrbbUSTZL1i8xXHJnl/rceX3VwHVEH+Amhp2KdrnvlFPJTWHrIjEPMXpprDNsslVp9lBWJo6riB4LTBzZcms6cFs/orYde8sbObfR4yUlsEaRYD1gzLTbAavdJE2RGUkieRep6fnltesKV3GNs2Kisufig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BhKTmb9B8+jAr3cYXAoJHtnmzexNRba+jetk0O0fh7Q=;
 b=XeZC6xHCoIT6fhcmtblksF0E65gcp0CEuX0qSCK0WRzcMCaFnPeKjvBu3YSdxI1qU4BCbEBLLvJe7VmZYepaKg8ZhJGJCeUnF9x8a1YdadC3ye1e8Sj9My7bZDeiqk6EHBMZCbOQJ0F8fVS8PQBQYLVKSEd+0M1g/7vhbU0nTCBOYYFDJe+tqjeNIkLMRbLkMCimnleBNs8Lk3JVud5ah6SpgGBAkIIFxuqAJwU+YGln2kmlqLwsbiKmob5QhsyKrGtgUJUMS3U/tHm/rJ64+B+Zt8IwO+36kjpvo8SHc+qcQh/1n6jsb/RXxTgPWgpnPW1eqt+y5UjNiz2GSvGswg==
Received: from SA0PR11CA0079.namprd11.prod.outlook.com (2603:10b6:806:d2::24)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:29 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::b4) by SA0PR11CA0079.outlook.office365.com
 (2603:10b6:806:d2::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 23:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:15 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 29/60] drm/nouveau/gsp: add hal for disp.chan.set_pushbuf()
Date: Wed, 30 Apr 2025 09:38:57 +1000
Message-ID: <20250429233929.24363-30-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ecc63a0-092c-414b-ff9b-08dd877739a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kN/5GuBPuVDNjFdP/4RRzIUCSAtZkgfInbhDXZgZ/JfTAznZ+0CprruFFFwv?=
 =?us-ascii?Q?SBZdfnh2ovHtuqqKB1DhH9NEdYWUHdiY8h6ZAOp/UR4lld2M5HeKJHqyiRtI?=
 =?us-ascii?Q?YflthnMcs8ANuYTuJWyGkXBz3tY5IIdwqO3wthLqlBB+XC+mOnyWfI3SgD+K?=
 =?us-ascii?Q?znkU+Wn4CNp6A/t4cuAZ469gjVDAefYJDDMK3ML2J4E1sUmFYt8pHhrS3Hz2?=
 =?us-ascii?Q?cimd8gCD8DgHb94gacwtWhCWGNg3ZhTc3sQmVeN6p8vLyie9+HNgz90ZLBhC?=
 =?us-ascii?Q?CqBuIbfFglpPVNPhMZ8f2GRAq52QOj8typuxQ3RBnlLdl3sUtcuBCp9lKZDP?=
 =?us-ascii?Q?d2l0W9HGI0B9ZDVzNiScecdkbGMo12HvRJNEE01k9Q//M4lta6D9x3tT/RjN?=
 =?us-ascii?Q?oLXviGfKxmfn5LgL2b4RoWYWsyPX2/jdbbkFiaZ0VaYjsZvFndMEh5QX2fxb?=
 =?us-ascii?Q?axoW8+7YcFerG5R9pSpeWq2LqrOcvT4553NbMVCY/BAkrsIZl+0Z5G8d0xRq?=
 =?us-ascii?Q?lSDTlp3sRS0KAdxCsZeNiTQdaiBpovty46BKhWQL118AwmneMehaji1ud39m?=
 =?us-ascii?Q?riDlVMaU59jPRoYj0rt4PsnvzbtNYJ8u1l3681/3StiAAS3Bzl7ShLsd0n9B?=
 =?us-ascii?Q?HEYE1tLgfaecSiLV/amyCbMHeTRQ2ZRJTxsf+iRUuCTJwwQooQ9ShXXexDxu?=
 =?us-ascii?Q?IHLTApA4lQVJHZo2SdPc/M+lqAT7QTL490RD5JjjA6Hp1TlXvR1M8jgcokzr?=
 =?us-ascii?Q?7DC+Al4nAdRq5aIX0SZOJX7qER0pHRNtYI3LMentNL8xiNQd3ntPVL5RiwxQ?=
 =?us-ascii?Q?3wUDsVzozX5ZhmZ11bZsRFYli59AAEMNvGH0wV++661PV1d4oQgYrP/6KK+H?=
 =?us-ascii?Q?BsI64oFMZg2/7YIN+UR6tztqoDnxKsVG/TDuOJmI6+QW1ML2q0ba+yBWfLfO?=
 =?us-ascii?Q?r5BFoaJIC2lB69A6LcKrZwcHVAr1Ozxax+JrNKd79b5aFMPsmILoDhO0Gzf3?=
 =?us-ascii?Q?/wcpLZZOnVWu+vGwnNy1rl5DM6VYa7xiaE1lxcVXqcWTgjkyzDw3yk5yrYqR?=
 =?us-ascii?Q?lGSz8yYPNDSaEfesVU3yenAx8eHrTsH/zqt67Hb7KkfpzWVgmra0XX70AaM7?=
 =?us-ascii?Q?V5H/cwPNS2ORjpALhg+DOZEreyYocLztM1Wvm1CoZapMq6Ql3rx013RE6M1G?=
 =?us-ascii?Q?LU5ld8NuNsygC5MR6UkMIqiCaroA6HgOdOaFIQxdKw3T+XugVtqEn1ROu8pn?=
 =?us-ascii?Q?ygK/nTSJc3KCUf2ST5nHXbDl0Jn9X0LSJE7VSSfrSFllAbcVCbxRgwQb7Gba?=
 =?us-ascii?Q?pK5NgZPtL9fKnaTFKO7ndHWHT3xgYv/uf5Qx4jWQfKSaTQfI8/GRVZk+T6Yt?=
 =?us-ascii?Q?qzW3/jm93n0WDJ43ECnIHRRfUcQBHKFbOXQjjfSIxbFiIgHxT9tRJrZ1VZ7s?=
 =?us-ascii?Q?VWBeDyb3baCrlKIhFyBUFVNacMOR/AMPQI5pCu2u+G3rSxxysXAmdnB7JsFw?=
 =?us-ascii?Q?AjnU7L+gzNpc9VF1L75K3MZPeo3LgCxo2+cO?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:29.3335 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecc63a0-092c-414b-ff9b-08dd877739a8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806
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
NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 27 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 ++++
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 736ae9c96616..615daad4b9f6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -70,9 +70,9 @@ r535_chan_fini(struct nvkm_disp_chan *chan)
 }
 
 static int
-r535_chan_push(struct nvkm_disp_chan *chan)
+r535_disp_chan_set_pushbuf(struct nvkm_disp *disp, s32 oclass, int inst, struct nvkm_memory *memory)
 {
-	struct nvkm_gsp *gsp = chan->disp->engine.subdev.device->gsp;
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
 	NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS *ctrl;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
@@ -81,8 +81,8 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
-	if (chan->memory) {
-		switch (nvkm_memory_target(chan->memory)) {
+	if (memory) {
+		switch (nvkm_memory_target(memory)) {
 		case NVKM_MEM_TARGET_NCOH:
 			ctrl->addressSpace = ADDR_SYSMEM;
 			ctrl->cacheSnoop = 0;
@@ -99,13 +99,13 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 			return -EINVAL;
 		}
 
-		ctrl->physicalAddr = nvkm_memory_addr(chan->memory);
-		ctrl->limit = nvkm_memory_size(chan->memory) - 1;
+		ctrl->physicalAddr = nvkm_memory_addr(memory);
+		ctrl->limit = nvkm_memory_size(memory) - 1;
 	}
 
-	ctrl->hclass = chan->object.oclass;
-	ctrl->channelInstance = chan->head;
-	ctrl->valid = ((chan->object.oclass & 0xff) != 0x7a) ? 1 : 0;
+	ctrl->hclass = oclass;
+	ctrl->channelInstance = inst;
+	ctrl->valid = ((oclass & 0xff) != 0x7a) ? 1 : 0;
 
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
@@ -113,10 +113,11 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 static int
 r535_curs_init(struct nvkm_disp_chan *chan)
 {
+	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
 	NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = r535_chan_push(chan);
+	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, NULL);
 	if (ret)
 		return ret;
 
@@ -166,10 +167,11 @@ r535_dmac_fini(struct nvkm_disp_chan *chan)
 static int
 r535_dmac_init(struct nvkm_disp_chan *chan)
 {
+	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
 	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = r535_chan_push(chan);
+	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, chan->memory);
 	if (ret)
 		return ret;
 
@@ -1742,5 +1744,8 @@ r535_disp = {
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
+	},
+	.chan = {
+		.set_pushbuf = r535_disp_chan_set_pushbuf,
 	}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 00bbb75297a7..1a8aa18d2e84 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -78,6 +78,11 @@ struct nvkm_rm_api {
 		struct {
 			int (*set_indexed_link_rates)(struct nvkm_outp *);
 		} dp;
+
+		struct {
+			int (*set_pushbuf)(struct nvkm_disp *, s32 oclass, int inst,
+					   struct nvkm_memory *);
+		} chan;
 	} *disp;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

