Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E893CD54
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F202010E915;
	Fri, 26 Jul 2024 04:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h5WE+Hct";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3F310E911
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRtJDBifIi+KWN6nyD0o02NSMat77ouArvzGY8413rQnQRMPWiAoNhsHxXKp0to/8+5pZ5YjmyYxktLHloeSkXtQo9mgIqKqAfRZRvqVqM5gti5RBkmIEgjfhXTTNgZ+/IPbgLFE4ZXq7zTb00LHQWcxvWlReTi/myMTbrkCyzFVXtRKjrBAlTfb549S1rbX8Z1EyO/yRokqk65dvoMi1Af3qFdDXsiAdwu7KM1q1VQ5rce3CQKwQ/G5RBeSgJNPUiDO1hM12Se0E3hhxt0Cggg2poSXKONs6Gg8dpnUVYV0WVgozvu1VsZ77qOYGNzPxipUsFVMOtH4CdhXlyNcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FolVhcYAoFDOeOsNvRzb1Z0qhSX/xdyPrFMBWhW4dEE=;
 b=P7lMpCYH89kDwuLwAx3o3wC4z1Z9cIw9ZzSQPAK9INEzhvBtFGZ50doVMtaTF8bNm0pfbsZ9khge4k2lkHAdnZ7cdU8AGvg3qhbAGM3CTIHmlLylX6rtTDG+siEI08Q/F+uJCyd7K8v1moIn5ReTv/B4uoXRi+sJp1JpIV3kAc8H24/5GF4kzjsmcynYXhJDSNSBz4TsVXAWpRWfkTb7AOPHrOvsg8yI+gfLpuYEB8rvCZ7E/QZfu+vEpqtQbwRvRIzZTwomwTxZv9P411ehejeAsTRx5XkiYMgf9py+jtnld3LO13lEqenzfD4JPSr0v5CufP1IGV2BgkCXTE0PBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FolVhcYAoFDOeOsNvRzb1Z0qhSX/xdyPrFMBWhW4dEE=;
 b=h5WE+HctXBEfqnDSjnlaBXWXUxWu6DGuVkYLyOG8u2gok8DcECAXIvMRoqpGsKmElioJURyifYRf6swyzlYNbkLjJr/slVrMi6+q6W0adTf06NWm1gqsydGzm8lOuE+qEXPS+xHz6PW0bco7dbxzTyaHSEHvZXcOgEaPKu6+97nkDJq3R74lxzcnTqLTjvfTw8tRfonKrvu2qmzxbd7kh3JcsCwSLwvv3qjGPFEp2UNmbi1DMdbIcmEIyGL7G4QdiwiFZ4UA1jgGsqWJtkF6uOlwMJJiYht7+NJ+EsPAaTTH6ZCKcI3S7sfeqKfUPFtoFk67lmthemZyQIDnRZM04Q==
Received: from CH0PR03CA0415.namprd03.prod.outlook.com (2603:10b6:610:11b::26)
 by CH3PR12MB9098.namprd12.prod.outlook.com (2603:10b6:610:19e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Fri, 26 Jul
 2024 04:39:37 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:610:11b:cafe::a1) by CH0PR03CA0415.outlook.office365.com
 (2603:10b6:610:11b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:26 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 30/37] drm/nouveau: pass drm to nv50_dmac_create(),
 rather than device+disp
Date: Fri, 26 Jul 2024 14:38:21 +1000
Message-ID: <20240726043828.58966-31-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CH3PR12MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: 84a115f7-9e51-41cb-0dd8-08dcad2cf478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SLuZsjwvPXDSPhauA0ReGbtmGmskeJIIGWYnISopiG3V0yN1Lu4UOXm7HncC?=
 =?us-ascii?Q?QjrcL9GFirmXdi3rY2+IIrlMslMpFuGAAxuApgTfaoE52gly5qOElHaPigPF?=
 =?us-ascii?Q?k3j0ZjtsyU4FoifU2lVhg53RqpBtHC5G5rv7gl4ON15lRIOEIEc3uYSsbfQn?=
 =?us-ascii?Q?MgPnQi4mMFhkZAMbFXw+0m9PeqddnUdImQpXrqwt1gs3w8XS/ZZYLntUrnrA?=
 =?us-ascii?Q?zIBfa1V2bBiY8ArnfaO5c/Cb2QOPPSVD41fe+2qQMSA9yVnZii51Jxf1H+2S?=
 =?us-ascii?Q?3vnHjtEtQ1s2YHHCygI6n/vlUWTntXjvQM9UOFbVAsV3LLJXiwWzxQ+Ozzy+?=
 =?us-ascii?Q?A/R6nAivQo6SsQzp8tIXo269KhTdxjHDI4X09AAW+LHbG4V5kFZr00viXSZ8?=
 =?us-ascii?Q?pYtW+gpouIMC0RjDWXTNauq7pRWykS22u4q4ZurqCu3/aaRTDrLd1fP/Jr4f?=
 =?us-ascii?Q?af/Y1o0BP6mFPWwlI2vaCebpJ/CQTNZ4RWDP8u37jNQe+RiFf7rCIRGVMcUh?=
 =?us-ascii?Q?+6rCCpRj8fXND9LSX810e8GMZNtZIXUkHU1JCt6URPBEbtfz790urAkpMJ02?=
 =?us-ascii?Q?hdDe6bbCM6R+LavZbQR3qTGO+GtDRbi0Ik6NDN4p+30JJhcMEyLmwWGLwPjh?=
 =?us-ascii?Q?naAECbcoFTtciOqNyXtgjlNyTGSIQr8QE8Pvdsr3dH/fRpggroivmWt7BnqF?=
 =?us-ascii?Q?xj71q4fGqyobUuShqtCZIYFYmfBG53NyKTeIp0su4cSWZUdWbMVW44M1pSf0?=
 =?us-ascii?Q?N9yd41ZvPemjHjLvU6BWExUY4Sb4s6CHrBJTiQ6fko9S3i6ejAOG8b2G1brQ?=
 =?us-ascii?Q?JLDsEbT1MvJ50E+RFfblnPjIO/+Z7mU5QW3ZbJ7P+YeLFJa7XIFIhTan89ol?=
 =?us-ascii?Q?3dT1Bm681He3a625eIN2gCPlIbmE4mGM695O1RLwNSWrT6odKPlWuGz7rwVq?=
 =?us-ascii?Q?cAFhkYC4N+B6dmPunEmifuGMNdWIonfHKv66qElWa895W8yC6BbIS+bDdyju?=
 =?us-ascii?Q?1CCo8CQD9/IzRyRPfAE9FSXdVI8Q6+GVz22P1Chae8Hu6cmo6BEvLnzPVqB3?=
 =?us-ascii?Q?DZqJrUEVtyi2n4bgHG64u0wad7LMAzQRQYkaGIeF3bS8dllqgqTSs/3iFys/?=
 =?us-ascii?Q?6K4My9BA8iBjqQAeC/MwkQvBzyJX7COAL7xXxP/wEC/TxVYgnt0cHTnFzmgT?=
 =?us-ascii?Q?iFVKrYAVnnHStUHLUM3e2YlQGZfOp81iyKNi2Ht9e5QBsU3+HJfZhnl87gd9?=
 =?us-ascii?Q?QhjRqI/6iK1cyVVDKvhTMoF/mcGyPv5r0iKrFSjwMTCqrn9hekEvos/3zKsD?=
 =?us-ascii?Q?/F3S02/FXkvkMO5LFWx0ZKskK69WckYVf5ddwrdKOEjwrbjR3Rjk5owb8AKM?=
 =?us-ascii?Q?hGxa06dzHCFxmKC7kahyPbgv4OstRKEsec21Esd1fT1au990/MbJnYVRi+3W?=
 =?us-ascii?Q?nYHZT1oMQqIUvqSDdDlo9qOfIi3Itmkv?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:37.0348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84a115f7-9e51-41cb-0dd8-08dcad2cf478
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9098
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

Both of these are stored in nouveau_drm already.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
 drivers/gpu/drm/nouveau/dispnv50/disp.h     | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c | 2 +-
 7 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 70c62b861276..e36a473f2075 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -307,7 +307,6 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	struct nvif_disp_chan_v0 args = {
 		.id = head,
 	};
-	struct nouveau_display *disp = nouveau_display(drm->dev);
 	struct nv50_disp *disp50 = nv50_disp(drm->dev);
 	struct nv50_wndw *wndw;
 	int ret;
@@ -318,7 +317,7 @@ base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp.object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, head, &args, sizeof(args),
 			       disp50->sync->offset, &wndw->wndw);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index e5bb5ca950c8..85845e3dc7ba 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -166,7 +166,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 		return -ENOMEM;
 	core->func = func;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
 			       disp->sync->offset, &core->chan);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index cfdd533482f8..242887ab4ba0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -229,11 +229,12 @@ static int nv50_dmac_vram_pushbuf = -1;
 module_param_named(kms_vram_pushbuf, nv50_dmac_vram_pushbuf, int, 0400);
 
 int
-nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
+nv50_dmac_create(struct nouveau_drm *drm,
 		 const s32 *oclass, u8 head, void *data, u32 size, s64 syncbuf,
 		 struct nv50_dmac *dmac)
 {
-	struct nouveau_cli *cli = (void *)device->object.client;
+	struct nvif_device *device = &drm->device;
+	struct nvif_object *disp = &drm->display->disp.object;
 	struct nvif_disp_chan_v0 *args = data;
 	u8 type = NVIF_MEM_COHERENT;
 	int ret;
@@ -253,8 +254,7 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	    (nv50_dmac_vram_pushbuf < 0 && device->info.family == NV_DEVICE_INFO_V0_PASCAL))
 		type |= NVIF_MEM_VRAM;
 
-	ret = nvif_mem_ctor_map(&cli->mmu, "kmsChanPush", type, 0x1000,
-				&dmac->_push.mem);
+	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000, &dmac->_push.mem);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 5508a7cfd492..da3add95f354 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -95,7 +95,7 @@ struct nv50_outp_atom {
 	} set, clr;
 };
 
-int nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
+int nv50_dmac_create(struct nouveau_drm *,
 		     const s32 *oclass, u8 head, void *data, u32 size,
 		     s64 syncbuf, struct nv50_dmac *dmac);
 void nv50_dmac_destroy(struct nv50_dmac *);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 797c1e4e0eaa..73fcfb27c32c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -159,7 +159,7 @@ ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
 			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index ee76b091d4ef..8cb5b79bacbf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
@@ -71,10 +71,9 @@ wimmc37b_init_(const struct nv50_wimm_func *func, struct nouveau_drm *drm,
 	struct nvif_disp_chan_v0 args = {
 		.id = wndw->id,
 	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
 	int ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args), -1,
 			       &wndw->wimm);
 	if (ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index b3deea5aca58..caf40977f455 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -363,7 +363,7 @@ wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm *drm,
 	if (*pwndw = wndw, ret)
 		return ret;
 
-	ret = nv50_dmac_create(&drm->client.device, &disp->disp->object,
+	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
 			       disp->sync->offset, &wndw->wndw);
 	if (ret) {
-- 
2.45.1

