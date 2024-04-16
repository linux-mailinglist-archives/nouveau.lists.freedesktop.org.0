Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F4E8A78E8
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B71112F2B;
	Tue, 16 Apr 2024 23:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kje+gDvS";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA96A112F61
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBjEQlHPm298IJ3nQTji0kpQ8aVoooZkuL8KuhgGeSxk8AYVGirkfMU8cDqiqASod2SB7M6lvxrlPFjbcR+wEGcKRErukqIhPVjAHZ5Jel6+5+ji3nfxkXz8A4rRMAP3C5Reo63n1Ll4CeoIYforGBI0ZCVK6UZRxTuweVQPkvk0YraSnHml5of6PwbiDxST4E7WGFQVECAiDw93Bi/itWmmvFTHTJQJzH6IWwFw2ZnwqzogZX+FLsrG6sYoFTnrOj8SEZZvnQZXIziB9NUgQl00/WMgTa45lVD1yGlBFyxmj/sN1xkFiftK+EFXxCkEy8Ro1G1XOFeHu46JSxLE0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrIu424OdtRmXj1aUCR2SzOWBWWEjKq33G5Yb5vY6Ck=;
 b=KerFNP9P1kabkQzdM3L0DtW2XjLIgcze3yN+HFgXN5iCPuqJg1iMxsz83MB6Ef3bWRC1DklkpwidFoLdKzc0T1iaCNjc+VtNwZrI5hJYJvBXX7jLGdrGc6blCGEhoRSSCADJTQ02G8fYbhOv36HKS1h9qWgv3d9c6d3ZDnXClvgyiOJyo0HZFmKt4XrfhOF4Ua0zSBaJGp9ITqh1KSfa+Y573SjQnpElMYX29CYY5aLdRGQaDPxpYYXBOm8BLVnY7oDTYcub40s1d2pJrgCLOxfCZs3nEuJWLcH+VgR5o3iWBNRDkfCP8XjznrJNcBzifhZR/1kWo5rvWgxXetyAqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrIu424OdtRmXj1aUCR2SzOWBWWEjKq33G5Yb5vY6Ck=;
 b=kje+gDvSwVYNafRNfydRnlUjFug2wJAAGPRccNuoK/szCyAO00p0/4YCWubJt9T179N2jQGkR/nGGzxM+Wm/lMixY6dOPlXi130tEndTZRzX2ncJCJ2SsuJeLCWMBJrAIGOWlAmzomJaYXIGC0Hv4IKGXjkbsCHAvYrDVvlmztosxghE/juU5g753dKMLXvAdzrYp8oiLXjT8vnoOYcPFHd/QbvON3gZw7N2EPEiFYcxg9VAEx1xlOcnRfu7gFxlqV9vVScQQZhAjbNY+DSpZ8xmsJyyBIsFZTF+gAc3qAhk6i7MOekYpcCKamA8a2t6GMA1tDRlVjbYKuThdsRDyg==
Received: from CH5P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::25)
 by MW4PR12MB7468.namprd12.prod.outlook.com (2603:10b6:303:212::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.37; Tue, 16 Apr
 2024 23:41:56 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::b3) by CH5P220CA0018.outlook.office365.com
 (2603:10b6:610:1ef::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:33 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:32 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 055/156] drm/nouveau/disp: simplify hw user definition
Date: Wed, 17 Apr 2024 09:38:21 +1000
Message-ID: <20240416234002.19509-56-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MW4PR12MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: acaf693a-276a-4fbe-559e-08dc5e6eccfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vbToD/TgnZ1llRMGG29emvZpHos/ri0hB8MEPbDimHUltu1LsZrfgiYOQPPt?=
 =?us-ascii?Q?j8eRhpdLkDLFIaI1KqOCVJJ1auLgGbN6AdwDTDM7V8ZmdiUWT7sXnLe5T5AX?=
 =?us-ascii?Q?4GSHmdIK0obhF28sbMdEhgfU+D71pjkbVZ+CGhoXW3PYGr3HyGDTeYGLDana?=
 =?us-ascii?Q?DEQXO/Lb7TCsmmdvgDq7n8xif34caGPaqbY94kCP6uF3/9qXUTCWIJ7DiJHh?=
 =?us-ascii?Q?zbt0ibvQGZw/QExC1rX69A1fpxrEgaaeoYCKmGy27kqPCIMmIX6q9fhs0GuW?=
 =?us-ascii?Q?LMHm08lzPYicXNrLq8/ib6hC6++ASOon9CxYumaDFho1PeIQOEdI2SMFDt5a?=
 =?us-ascii?Q?wMiSwejd8q1FgtxEGFlUGavJSLNB0Eh/bNj4VSn3Zi9xVznubJBzj4omgXMO?=
 =?us-ascii?Q?qYE530OjzL23/lPNbSsuu7WBSDm+52d0QtfsDZ4QFSx7kDfJM6CRxa65Sqw6?=
 =?us-ascii?Q?TiEm8MeXRU7E1wajzNlPbJRAEAcLwWBeo0NAOzPFFYbanMpjL/6xp6g5VTNH?=
 =?us-ascii?Q?4v+2eTmBWSr6WA8Ye9OMfqjIzQdN/baYLFFtISorNbLMSFuic7uuWwdaAfuq?=
 =?us-ascii?Q?toRuWYlYNA7tmfYjbI4qB95VPt3JgV+mafr94d3XUH//RyJ1YxmJZkHV57r7?=
 =?us-ascii?Q?QCcBu9UZp6223GEazNomtd1NDQup9r+4C1kvV3/IA/sDIT9f0mHSOMwWOvz0?=
 =?us-ascii?Q?/FL8ACjJjWxJhAJpM8ZEBtpGyRExUYf6XtzrOd2qV1Azq/rl3JLILjeYcewg?=
 =?us-ascii?Q?80TW34FXdIQZPdp2Q80QUbQ7rik0x8LBfb2I7IgBak7ODrgpKSQ2deijlanC?=
 =?us-ascii?Q?B3nkx4ZTLkJkm6tcxIpjcs8ckNHCTyo3ilLHGMd+4nUaEkeYg13N0lE/Etpy?=
 =?us-ascii?Q?F8YcXt0ZzPYzwE1ml8+N2deJkH0itm+R3Khh/rik53d4GsoGKnwZcUESGhis?=
 =?us-ascii?Q?lPYeidh8zAlVbev+Nd3NIs9GmWWP/OrxJK03xRh8BFj73nrdhGD+IVLJm6s3?=
 =?us-ascii?Q?QTREZYgDI9bjfPGTS7EXrrXCEqIxO9QAplE3IM1vlCM7GXLZp1ZkFBawBHA7?=
 =?us-ascii?Q?wn/8qLu/+aCyXudjoMIQGoaazaf+Mx5y+lzbpDEqNzIG3IoMefddwyaQL9F+?=
 =?us-ascii?Q?CDRZHkCVcs4yOYgsp+JGNFjjyhyCE1yo8cWqu6ItF27okFlU7rLyEB8zqcSz?=
 =?us-ascii?Q?hwvr8NsbHNVqIoG6dRKmkYLnxkhfXiB8GsKjOidSooDPa9JGISaJe7aqVc8z?=
 =?us-ascii?Q?U+qZXfde8sQlpeh6XxlB3oU+ytCeY+dgN33QmYbyss8Lvv2dbB3pgOg5vMTo?=
 =?us-ascii?Q?Sh8N4VawTEzjDKmkPEIwlLf0T5IjcVln03MnpdTTkqOMi5rTKHia93WRa7M3?=
 =?us-ascii?Q?s9Ac4ws=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:55.6642 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acaf693a-276a-4fbe-559e-08dc5e6eccfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7468
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

- needed for upcoming changes to display channel allocation APIs

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/base.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c   | 15 ++++--
 .../gpu/drm/nouveau/nvkm/engine/disp/g84.c    | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/g94.c    | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gf119.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gk104.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gk110.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gm107.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gm200.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gp100.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gp102.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gt200.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gt215.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp77.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/mcp89.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/nv04.c   |  5 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/nv50.c   | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   | 24 ++++++---
 .../gpu/drm/nouveau/nvkm/engine/disp/r535.c   | 26 +++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  | 13 +++--
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 49 +++++++++++++++++--
 24 files changed, 194 insertions(+), 161 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
index 7f300a79aa29..f818828e3f04 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
@@ -30,14 +30,13 @@ static const struct nvkm_disp_func
 ad102_disp = {
 	.uevent = &gv100_disp_chan_uevent,
 	.ramht_size = 0x2000,
-	.root = {  0, 0,AD102_DISP },
 	.user = {
-		{{-1,-1,GV100_DISP_CAPS                  }, gv100_disp_caps_new },
-		{{ 0, 0,GA102_DISP_CURSOR                }, nvkm_disp_chan_new, &gv100_disp_curs },
-		{{ 0, 0,GA102_DISP_WINDOW_IMM_CHANNEL_DMA}, nvkm_disp_wndw_new, &gv100_disp_wimm },
-		{{ 0, 0,AD102_DISP_CORE_CHANNEL_DMA      }, nvkm_disp_core_new, &gv100_disp_core },
-		{{ 0, 0,GA102_DISP_WINDOW_CHANNEL_DMA    }, nvkm_disp_wndw_new, &gv100_disp_wndw },
-		{}
+		.root = { AD102_DISP },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.curs = { GA102_DISP_CURSOR                , &gv100_disp_curs },
+		.wimm = { GA102_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
+		.core = { AD102_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
+		.wndw = { GA102_DISP_WINDOW_CHANNEL_DMA    , &gv100_disp_wndw },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
index e93646d53378..6850c703ff2d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/base.c
@@ -84,7 +84,7 @@ nvkm_disp_class_get(struct nvkm_oclass *oclass, int index,
 {
 	struct nvkm_disp *disp = nvkm_disp(oclass->engine);
 	if (index == 0) {
-		oclass->base = disp->func->root;
+		oclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.root.oclass };
 		*class = &nvkm_disp_sclass;
 		return 0;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index d3c0537c08db..86938c633272 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -187,15 +187,24 @@ static int
 nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oclass,
 		    void *argv, u32 argc, struct nvkm_object **pobject)
 {
+	const struct nvkm_disp_func_chan *chans[] = {
+		&disp->func->user.core,
+		&disp->func->user.base,
+		&disp->func->user.ovly,
+		&disp->func->user.wndw,
+		&disp->func->user.wimm,
+		&disp->func->user.curs,
+		&disp->func->user.oimm,
+	};
 	const struct nvkm_disp_chan_user *user = NULL;
 	struct nvif_disp_chan_priv *uchan;
 	struct nvkm_disp_chan *chan;
 	union nvif_disp_chan_args *args = argv;
 	int ret, i;
 
-	for (i = 0; disp->func->user[i].ctor; i++) {
-		if (disp->func->user[i].base.oclass == oclass->base.oclass) {
-			user = disp->func->user[i].chan;
+	for (i = 0; i < ARRAY_SIZE(chans); i++) {
+		if (chans[i]->oclass == oclass->base.oclass) {
+			user = chans[i]->chan;
 			break;
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c
index 1be97a68a83e..1ee61eb1faf2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g84.c
@@ -330,14 +330,13 @@ g84_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = nv50_sor_cnt, .new = g84_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0,0,G82_DISP },
 	.user = {
-		{{0,0,G82_DISP_CURSOR             }, nvkm_disp_chan_new, &nv50_disp_curs },
-		{{0,0,G82_DISP_OVERLAY            }, nvkm_disp_chan_new, &nv50_disp_oimm },
-		{{0,0,G82_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, & g84_disp_base },
-		{{0,0,G82_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, & g84_disp_core },
-		{{0,0,G82_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, & g84_disp_ovly },
-		{}
+		.root = { G82_DISP },
+		.curs = { G82_DISP_CURSOR             , &nv50_disp_curs },
+		.oimm = { G82_DISP_OVERLAY            , &nv50_disp_oimm },
+		.base = { G82_DISP_BASE_CHANNEL_DMA   , & g84_disp_base },
+		.core = { G82_DISP_CORE_CHANNEL_DMA   , & g84_disp_core },
+		.ovly = { G82_DISP_OVERLAY_CHANNEL_DMA, & g84_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
index 843a2661ce9d..7165b924e514 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/g94.c
@@ -360,14 +360,13 @@ g94_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = g94_sor_cnt, .new = g94_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0,0,GT206_DISP },
 	.user = {
-		{{0,0,  G82_DISP_CURSOR             }, nvkm_disp_chan_new, & nv50_disp_curs },
-		{{0,0,  G82_DISP_OVERLAY            }, nvkm_disp_chan_new, & nv50_disp_oimm },
-		{{0,0,GT200_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &  g84_disp_base },
-		{{0,0,GT206_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &  g94_disp_core },
-		{{0,0,GT200_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, &gt200_disp_ovly },
-		{}
+		.root = { GT206_DISP },
+		.curs = {   G82_DISP_CURSOR             , & nv50_disp_curs },
+		.oimm = {   G82_DISP_OVERLAY            , & nv50_disp_oimm },
+		.base = { GT200_DISP_BASE_CHANNEL_DMA   , &  g84_disp_base },
+		.core = { GT206_DISP_CORE_CHANNEL_DMA   , &  g94_disp_core },
+		.ovly = { GT200_DISP_OVERLAY_CHANNEL_DMA, &gt200_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
index ab0a85c92430..c6b77e4d08a0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
@@ -133,14 +133,13 @@ ga102_disp = {
 	.head = { .cnt = gv100_head_cnt, .new = gv100_head_new },
 	.sor = { .cnt = gv100_sor_cnt, .new = ga102_sor_new },
 	.ramht_size = 0x2000,
-	.root = {  0, 0,GA102_DISP },
 	.user = {
-		{{-1,-1,GV100_DISP_CAPS                  }, gv100_disp_caps_new },
-		{{ 0, 0,GA102_DISP_CURSOR                }, nvkm_disp_chan_new, &gv100_disp_curs },
-		{{ 0, 0,GA102_DISP_WINDOW_IMM_CHANNEL_DMA}, nvkm_disp_wndw_new, &gv100_disp_wimm },
-		{{ 0, 0,GA102_DISP_CORE_CHANNEL_DMA      }, nvkm_disp_core_new, &gv100_disp_core },
-		{{ 0, 0,GA102_DISP_WINDOW_CHANNEL_DMA    }, nvkm_disp_wndw_new, &gv100_disp_wndw },
-		{}
+		.root = { GA102_DISP },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.curs = { GA102_DISP_CURSOR                , &gv100_disp_curs },
+		.wimm = { GA102_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
+		.core = { GA102_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
+		.wndw = { GA102_DISP_WINDOW_CHANNEL_DMA    , &gv100_disp_wndw },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
index 83a1323600ae..5234edda8306 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gf119.c
@@ -1242,14 +1242,13 @@ gf119_disp = {
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.dac = { .cnt = gf119_dac_cnt, .new = gf119_dac_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gf119_sor_new },
-	.root = { 0,0,GF110_DISP },
 	.user = {
-		{{0,0,GF110_DISP_CURSOR             }, nvkm_disp_chan_new, &gf119_disp_curs },
-		{{0,0,GF110_DISP_OVERLAY            }, nvkm_disp_chan_new, &gf119_disp_oimm },
-		{{0,0,GF110_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gf119_disp_base },
-		{{0,0,GF110_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gf119_disp_core },
-		{{0,0,GF110_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gf119_disp_ovly },
-		{}
+		.root = { GF110_DISP },
+		.curs = { GF110_DISP_CURSOR             , &gf119_disp_curs },
+		.oimm = { GF110_DISP_OVERLAY            , &gf119_disp_oimm },
+		.base = { GF110_DISP_BASE_CHANNEL_DMA   , &gf119_disp_base },
+		.core = { GF110_DISP_CORE_CHANNEL_DMA   , &gf119_disp_core },
+		.ovly = { GF110_DISP_OVERLAY_CONTROL_DMA, &gf119_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
index a3e2fbadade4..2f22d0cfc8ae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk104.c
@@ -314,14 +314,13 @@ gk104_disp = {
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.dac = { .cnt = gf119_dac_cnt, .new = gf119_dac_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gk104_sor_new },
-	.root = { 0,0,GK104_DISP },
 	.user = {
-		{{0,0,GK104_DISP_CURSOR             }, nvkm_disp_chan_new, &gf119_disp_curs },
-		{{0,0,GK104_DISP_OVERLAY            }, nvkm_disp_chan_new, &gf119_disp_oimm },
-		{{0,0,GK104_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gf119_disp_base },
-		{{0,0,GK104_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gk104_disp_core },
-		{{0,0,GK104_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gk104_disp_ovly },
-		{}
+		.root = { GK104_DISP },
+		.curs = { GK104_DISP_CURSOR             , &gf119_disp_curs },
+		.oimm = { GK104_DISP_OVERLAY            , &gf119_disp_oimm },
+		.base = { GK104_DISP_BASE_CHANNEL_DMA   , &gf119_disp_base },
+		.core = { GK104_DISP_CORE_CHANNEL_DMA   , &gk104_disp_core },
+		.ovly = { GK104_DISP_OVERLAY_CONTROL_DMA, &gk104_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c
index 1704aa381ee9..205c05ad0306 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gk110.c
@@ -40,14 +40,13 @@ gk110_disp = {
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.dac = { .cnt = gf119_dac_cnt, .new = gf119_dac_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gk104_sor_new },
-	.root = { 0,0,GK110_DISP },
 	.user = {
-		{{0,0,GK104_DISP_CURSOR             }, nvkm_disp_chan_new, &gf119_disp_curs },
-		{{0,0,GK104_DISP_OVERLAY            }, nvkm_disp_chan_new, &gf119_disp_oimm },
-		{{0,0,GK110_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gf119_disp_base },
-		{{0,0,GK110_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gk104_disp_core },
-		{{0,0,GK104_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gk104_disp_ovly },
-		{}
+		.root = { GK110_DISP },
+		.curs = { GK104_DISP_CURSOR             , &gf119_disp_curs },
+		.oimm = { GK104_DISP_OVERLAY            , &gf119_disp_oimm },
+		.base = { GK110_DISP_BASE_CHANNEL_DMA   , &gf119_disp_base },
+		.core = { GK110_DISP_CORE_CHANNEL_DMA   , &gk104_disp_core },
+		.ovly = { GK104_DISP_OVERLAY_CONTROL_DMA, &gk104_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c
index 688e123ad482..a57cf832e789 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm107.c
@@ -94,14 +94,13 @@ gm107_disp = {
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.dac = { .cnt = gf119_dac_cnt, .new = gf119_dac_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gm107_sor_new },
-	.root = { 0,0,GM107_DISP },
 	.user = {
-		{{0,0,GK104_DISP_CURSOR             }, nvkm_disp_chan_new, &gf119_disp_curs },
-		{{0,0,GK104_DISP_OVERLAY            }, nvkm_disp_chan_new, &gf119_disp_oimm },
-		{{0,0,GK110_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gf119_disp_base },
-		{{0,0,GM107_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gk104_disp_core },
-		{{0,0,GK104_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gk104_disp_ovly },
-		{}
+		.root = { GM107_DISP },
+		.curs = { GK104_DISP_CURSOR             , &gf119_disp_curs },
+		.oimm = { GK104_DISP_OVERLAY            , &gf119_disp_oimm },
+		.base = { GK110_DISP_BASE_CHANNEL_DMA   , &gf119_disp_base },
+		.core = { GM107_DISP_CORE_CHANNEL_DMA   , &gk104_disp_core },
+		.ovly = { GK104_DISP_OVERLAY_CONTROL_DMA, &gk104_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
index 511e7831b2f5..350b10d19288 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gm200.c
@@ -177,14 +177,13 @@ gm200_disp = {
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.dac = { .cnt = gf119_dac_cnt, .new = gf119_dac_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gm200_sor_new },
-	.root = { 0,0,GM200_DISP },
 	.user = {
-		{{0,0,GK104_DISP_CURSOR             }, nvkm_disp_chan_new, &gf119_disp_curs },
-		{{0,0,GK104_DISP_OVERLAY            }, nvkm_disp_chan_new, &gf119_disp_oimm },
-		{{0,0,GK110_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gf119_disp_base },
-		{{0,0,GM200_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gk104_disp_core },
-		{{0,0,GK104_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gk104_disp_ovly },
-		{}
+		.root = { GM200_DISP },
+		.curs = { GK104_DISP_CURSOR             , &gf119_disp_curs },
+		.oimm = { GK104_DISP_OVERLAY            , &gf119_disp_oimm },
+		.base = { GK110_DISP_BASE_CHANNEL_DMA   , &gf119_disp_base },
+		.core = { GM200_DISP_CORE_CHANNEL_DMA   , &gk104_disp_core },
+		.ovly = { GK104_DISP_OVERLAY_CONTROL_DMA, &gk104_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c
index 4070447bd800..c0a9e18f1ccb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp100.c
@@ -66,14 +66,13 @@ gp100_disp = {
 	.uevent = &gf119_disp_chan_uevent,
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gp100_sor_new },
-	.root = { 0,0,GP100_DISP },
 	.user = {
-		{{0,0,GK104_DISP_CURSOR             }, nvkm_disp_chan_new, &gf119_disp_curs },
-		{{0,0,GK104_DISP_OVERLAY            }, nvkm_disp_chan_new, &gf119_disp_oimm },
-		{{0,0,GK110_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gf119_disp_base },
-		{{0,0,GP100_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gk104_disp_core },
-		{{0,0,GK104_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gk104_disp_ovly },
-		{}
+		.root = { GP100_DISP },
+		.curs = { GK104_DISP_CURSOR             , &gf119_disp_curs },
+		.oimm = { GK104_DISP_OVERLAY            , &gf119_disp_oimm },
+		.base = { GK110_DISP_BASE_CHANNEL_DMA   , &gf119_disp_base },
+		.core = { GP100_DISP_CORE_CHANNEL_DMA   , &gk104_disp_core },
+		.ovly = { GK104_DISP_OVERLAY_CONTROL_DMA, &gk104_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c
index 07e9aeec5e08..6513d0456749 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gp102.c
@@ -181,14 +181,13 @@ gp102_disp = {
 	.uevent = &gf119_disp_chan_uevent,
 	.head = { .cnt = gf119_head_cnt, .new = gf119_head_new },
 	.sor = { .cnt = gf119_sor_cnt, .new = gp100_sor_new },
-	.root = { 0,0,GP102_DISP },
 	.user = {
-		{{0,0,GK104_DISP_CURSOR             }, nvkm_disp_chan_new, &gp102_disp_curs },
-		{{0,0,GK104_DISP_OVERLAY            }, nvkm_disp_chan_new, &gp102_disp_oimm },
-		{{0,0,GK110_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &gp102_disp_base },
-		{{0,0,GP102_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &gp102_disp_core },
-		{{0,0,GK104_DISP_OVERLAY_CONTROL_DMA}, nvkm_disp_chan_new, &gp102_disp_ovly },
-		{}
+		.root = { GP102_DISP },
+		.curs = { GK104_DISP_CURSOR             , &gp102_disp_curs },
+		.oimm = { GK104_DISP_OVERLAY            , &gp102_disp_oimm },
+		.base = { GK110_DISP_BASE_CHANNEL_DMA   , &gp102_disp_base },
+		.core = { GP102_DISP_CORE_CHANNEL_DMA   , &gp102_disp_core },
+		.ovly = { GK104_DISP_OVERLAY_CONTROL_DMA, &gp102_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c
index 6f69c4e3ade2..b97970800a90 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt200.c
@@ -90,14 +90,13 @@ gt200_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = nv50_sor_cnt, .new = g84_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0,0,GT200_DISP },
 	.user = {
-		{{0,0,  G82_DISP_CURSOR             }, nvkm_disp_chan_new, & nv50_disp_curs },
-		{{0,0,  G82_DISP_OVERLAY            }, nvkm_disp_chan_new, & nv50_disp_oimm },
-		{{0,0,GT200_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &  g84_disp_base },
-		{{0,0,GT200_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &  g84_disp_core },
-		{{0,0,GT200_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, &gt200_disp_ovly },
-		{}
+		.root = { GT200_DISP },
+		.curs = {   G82_DISP_CURSOR             , & nv50_disp_curs },
+		.oimm = {   G82_DISP_OVERLAY            , & nv50_disp_oimm },
+		.base = { GT200_DISP_BASE_CHANNEL_DMA   , &  g84_disp_base },
+		.core = { GT200_DISP_CORE_CHANNEL_DMA   , &  g84_disp_core },
+		.ovly = { GT200_DISP_OVERLAY_CHANNEL_DMA, &gt200_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
index 6318721b66f6..ea75b23c38b3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gt215.c
@@ -248,14 +248,13 @@ gt215_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = g94_sor_cnt, .new = gt215_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0,0,GT214_DISP },
 	.user = {
-		{{0,0,GT214_DISP_CURSOR             }, nvkm_disp_chan_new, & nv50_disp_curs },
-		{{0,0,GT214_DISP_OVERLAY            }, nvkm_disp_chan_new, & nv50_disp_oimm },
-		{{0,0,GT214_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &  g84_disp_base },
-		{{0,0,GT214_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &  g94_disp_core },
-		{{0,0,GT214_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, &  g84_disp_ovly },
-		{}
+		.root = { GT214_DISP },
+		.curs = { GT214_DISP_CURSOR             , & nv50_disp_curs },
+		.oimm = { GT214_DISP_OVERLAY            , & nv50_disp_oimm },
+		.base = { GT214_DISP_BASE_CHANNEL_DMA   , &  g84_disp_base },
+		.core = { GT214_DISP_CORE_CHANNEL_DMA   , &  g94_disp_core },
+		.ovly = { GT214_DISP_OVERLAY_CHANNEL_DMA, &  g84_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 5787fd26e5c7..7876241e10e7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -1236,14 +1236,13 @@ gv100_disp = {
 	.head = { .cnt = gv100_head_cnt, .new = gv100_head_new },
 	.sor = { .cnt = gv100_sor_cnt, .new = gv100_sor_new },
 	.ramht_size = 0x2000,
-	.root = {  0, 0,GV100_DISP },
 	.user = {
-		{{-1,-1,GV100_DISP_CAPS                  }, gv100_disp_caps_new },
-		{{ 0, 0,GV100_DISP_CURSOR                },  nvkm_disp_chan_new, &gv100_disp_curs },
-		{{ 0, 0,GV100_DISP_WINDOW_IMM_CHANNEL_DMA},  nvkm_disp_wndw_new, &gv100_disp_wimm },
-		{{ 0, 0,GV100_DISP_CORE_CHANNEL_DMA      },  nvkm_disp_core_new, &gv100_disp_core },
-		{{ 0, 0,GV100_DISP_WINDOW_CHANNEL_DMA    },  nvkm_disp_wndw_new, &gv100_disp_wndw },
-		{}
+		.root = { GV100_DISP },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.curs = { GV100_DISP_CURSOR                , &gv100_disp_curs },
+		.wimm = { GV100_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
+		.core = { GV100_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
+		.wndw = { GV100_DISP_WINDOW_CHANNEL_DMA    , &gv100_disp_wndw },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
index 841e3b69fcaf..3d065b77229b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp77.c
@@ -53,14 +53,13 @@ mcp77_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = g94_sor_cnt, .new = mcp77_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0,0,GT206_DISP },
 	.user = {
-		{{0,0,  G82_DISP_CURSOR             }, nvkm_disp_chan_new, & nv50_disp_curs },
-		{{0,0,  G82_DISP_OVERLAY            }, nvkm_disp_chan_new, & nv50_disp_oimm },
-		{{0,0,GT200_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &  g84_disp_base },
-		{{0,0,GT206_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &  g94_disp_core },
-		{{0,0,GT200_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, &gt200_disp_ovly },
-		{}
+		.root = { GT206_DISP },
+		.curs = {   G82_DISP_CURSOR             , & nv50_disp_curs },
+		.oimm = {   G82_DISP_OVERLAY            , & nv50_disp_oimm },
+		.base = { GT200_DISP_BASE_CHANNEL_DMA   , &  g84_disp_base },
+		.core = { GT206_DISP_CORE_CHANNEL_DMA   , &  g94_disp_core },
+		.ovly = { GT200_DISP_OVERLAY_CHANNEL_DMA, &gt200_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c
index e0c5fb6df3d7..3b25c147c0c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/mcp89.c
@@ -68,14 +68,13 @@ mcp89_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = g94_sor_cnt, .new = mcp89_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0,0,GT214_DISP },
 	.user = {
-		{{0,0,GT214_DISP_CURSOR             }, nvkm_disp_chan_new, &nv50_disp_curs },
-		{{0,0,GT214_DISP_OVERLAY            }, nvkm_disp_chan_new, &nv50_disp_oimm },
-		{{0,0,GT214_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, & g84_disp_base },
-		{{0,0,GT214_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, & g94_disp_core },
-		{{0,0,GT214_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, & g84_disp_ovly },
-		{}
+		.root = { GT214_DISP },
+		.curs = { GT214_DISP_CURSOR             , &nv50_disp_curs },
+		.oimm = { GT214_DISP_OVERLAY            , &nv50_disp_oimm },
+		.base = { GT214_DISP_BASE_CHANNEL_DMA   , & g84_disp_base },
+		.core = { GT214_DISP_CORE_CHANNEL_DMA   , & g94_disp_core },
+		.ovly = { GT214_DISP_OVERLAY_CHANNEL_DMA, & g84_disp_ovly },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c
index e4cf11a33969..7ba9c84b027c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv04.c
@@ -106,8 +106,9 @@ nv04_disp_intr(struct nvkm_disp *disp)
 static const struct nvkm_disp_func
 nv04_disp = {
 	.intr = nv04_disp_intr,
-	.root = { 0, 0, NV04_DISP },
-	.user = { {} },
+	.user = {
+		.root = { NV04_DISP },
+	}
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 682628fe5b20..0625f35bffec 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1771,14 +1771,13 @@ nv50_disp = {
 	.dac = { .cnt = nv50_dac_cnt, .new = nv50_dac_new },
 	.sor = { .cnt = nv50_sor_cnt, .new = nv50_sor_new },
 	.pior = { .cnt = nv50_pior_cnt, .new = nv50_pior_new },
-	.root = { 0, 0, NV50_DISP },
 	.user = {
-		{{0,0,NV50_DISP_CURSOR             }, nvkm_disp_chan_new, &nv50_disp_curs },
-		{{0,0,NV50_DISP_OVERLAY            }, nvkm_disp_chan_new, &nv50_disp_oimm },
-		{{0,0,NV50_DISP_BASE_CHANNEL_DMA   }, nvkm_disp_chan_new, &nv50_disp_base },
-		{{0,0,NV50_DISP_CORE_CHANNEL_DMA   }, nvkm_disp_core_new, &nv50_disp_core },
-		{{0,0,NV50_DISP_OVERLAY_CHANNEL_DMA}, nvkm_disp_chan_new, &nv50_disp_ovly },
-		{}
+		.root = { NV50_DISP },
+		.curs = { NV50_DISP_CURSOR             , &nv50_disp_curs },
+		.oimm = { NV50_DISP_OVERLAY            , &nv50_disp_oimm },
+		.base = { NV50_DISP_BASE_CHANNEL_DMA   , &nv50_disp_base },
+		.core = { NV50_DISP_CORE_CHANNEL_DMA   , &nv50_disp_core },
+		.ovly = { NV50_DISP_OVERLAY_CHANNEL_DMA, &nv50_disp_ovly },
 	}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 6f0b119dfd90..82b16cc9212a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -35,14 +35,22 @@ struct nvkm_disp_func {
 
 	u16 ramht_size;
 
-	struct nvkm_sclass root;
-
-	struct nvkm_disp_user {
-		struct nvkm_sclass base;
-		int (*ctor)(const struct nvkm_oclass *, void *argv, u32 argc,
-			    struct nvkm_object **);
-		const struct nvkm_disp_chan_user *chan;
-	} user[];
+	struct {
+		struct {
+			s32 oclass;
+		} root;
+
+		struct {
+			s32 oclass;
+			int (*ctor)(const struct nvkm_oclass *, void *argv, u32 argc,
+				    struct nvkm_object **);
+		} caps;
+
+		struct nvkm_disp_func_chan {
+			s32 oclass;
+			const struct nvkm_disp_chan_user *chan;
+		} core, base, ovly, wndw, wimm, curs, oimm;
+	} user;
 };
 
 int nv50_disp_oneinit(struct nvkm_disp *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
index f94858bc64f9..067e5e7177d6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
@@ -1417,8 +1417,8 @@ r535_disp_init(struct nvkm_disp *disp)
 {
 	int ret;
 
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, disp->func->root.oclass << 16,
-				disp->func->root.oclass, 0, &disp->rm.object);
+	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, disp->func->user.root.oclass << 16,
+				disp->func->user.root.oclass, 0, &disp->rm.object);
 	if (ret)
 		return ret;
 
@@ -1674,7 +1674,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	struct nvkm_disp_func *rm;
 	int ret;
 
-	if (!(rm = kzalloc(sizeof(*rm) + 6 * sizeof(rm->user[0]), GFP_KERNEL)))
+	if (!(rm = kzalloc(sizeof(*rm), GFP_KERNEL)))
 		return -ENOMEM;
 
 	rm->dtor = r535_disp_dtor;
@@ -1685,21 +1685,11 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	rm->sor.cnt = r535_sor_cnt;
 	rm->sor.new = r535_sor_new;
 	rm->ramht_size = hw->ramht_size;
-
-	rm->root = hw->root;
-
-	for (int i = 0; hw->user[i].ctor; i++) {
-		switch (hw->user[i].base.oclass & 0xff) {
-		case 0x73: rm->user[i] = hw->user[i]; break;
-		case 0x7d: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_core; break;
-		case 0x7e: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_wndw; break;
-		case 0x7b: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_wimm; break;
-		case 0x7a: rm->user[i] = hw->user[i]; rm->user[i].chan = &r535_curs; break;
-		default:
-			WARN_ON(1);
-			continue;
-		}
-	}
+	rm->user = hw->user;
+	rm->user.core.chan = &r535_core;
+	rm->user.wndw.chan = &r535_wndw;
+	rm->user.wimm.chan = &r535_wimm;
+	rm->user.curs.chan = &r535_curs;
 
 	ret = nvkm_disp_new_(rm, device, type, inst, pdisp);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index dcb9f8ba374c..21b945a88823 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -219,14 +219,13 @@ tu102_disp = {
 	.head = { .cnt = gv100_head_cnt, .new = gv100_head_new },
 	.sor = { .cnt = gv100_sor_cnt, .new = tu102_sor_new },
 	.ramht_size = 0x2000,
-	.root = {  0, 0,TU102_DISP },
 	.user = {
-		{{-1,-1,GV100_DISP_CAPS                  }, gv100_disp_caps_new },
-		{{ 0, 0,TU102_DISP_CURSOR                },  nvkm_disp_chan_new, &gv100_disp_curs },
-		{{ 0, 0,TU102_DISP_WINDOW_IMM_CHANNEL_DMA},  nvkm_disp_wndw_new, &gv100_disp_wimm },
-		{{ 0, 0,TU102_DISP_CORE_CHANNEL_DMA      },  nvkm_disp_core_new, &gv100_disp_core },
-		{{ 0, 0,TU102_DISP_WINDOW_CHANNEL_DMA    },  nvkm_disp_wndw_new, &gv100_disp_wndw },
-		{}
+		.root = { TU102_DISP },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.curs = { TU102_DISP_CURSOR                , &gv100_disp_curs },
+		.wimm = { TU102_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
+		.core = { TU102_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
+		.wndw = { TU102_DISP_WINDOW_CHANNEL_DMA    , &gv100_disp_wndw },
 	},
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 272d6a040a51..750db6a1eb44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "udisp.h"
+#include "chan.h"
 #include "conn.h"
 #include "head.h"
 #include "outp.h"
@@ -50,9 +51,51 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 		return 0;
 	}
 
-	if (disp->func->user[index].ctor) {
-		sclass->base = disp->func->user[index].base;
-		sclass->ctor = disp->func->user[index].ctor;
+	if (disp->func->user.caps.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { -1, -1, disp->func->user.caps.oclass };
+		sclass->ctor = disp->func->user.caps.ctor;
+		return 0;
+	}
+
+	if (disp->func->user.core.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.core.oclass };
+		sclass->ctor = nvkm_disp_core_new;
+		return 0;
+	}
+
+	if (disp->func->user.base.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.base.oclass };
+		sclass->ctor = nvkm_disp_chan_new;
+		return 0;
+	}
+
+	if (disp->func->user.ovly.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.ovly.oclass };
+		sclass->ctor = nvkm_disp_chan_new;
+		return 0;
+	}
+
+	if (disp->func->user.curs.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.curs.oclass };
+		sclass->ctor = nvkm_disp_chan_new;
+		return 0;
+	}
+
+	if (disp->func->user.oimm.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.oimm.oclass };
+		sclass->ctor = nvkm_disp_chan_new;
+		return 0;
+	}
+
+	if (disp->func->user.wndw.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.wndw.oclass };
+		sclass->ctor = nvkm_disp_wndw_new;
+		return 0;
+	}
+
+	if (disp->func->user.wimm.oclass && index-- == 0) {
+		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.wimm.oclass };
+		sclass->ctor = nvkm_disp_wndw_new;
 		return 0;
 	}
 
-- 
2.41.0

