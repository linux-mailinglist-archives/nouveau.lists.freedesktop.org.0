Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C428A78A9
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571AA112F1C;
	Tue, 16 Apr 2024 23:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cJcdidu0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4447C112F17
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:40:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlotF7a9/X0iKeQGNxJykOuOqTk/APa7yGcMSzKQ9Xyb+vT/Xm7/bFUtZHn35R1zgD6jRZXM5QgG+iDfrHZX0KA3j7837BES2LOAMfBwO0kOGDh5u6bUur0IzGciHVlEbcfR1Pk0Sz2Yi1lHozR2AEzB9pMY8ftpewFscpCuuZbU/7ERhFBLOrHjBRMYHRoCnyKavA0U83xiLroT6f/Vaq/zSigWPcHucqHzv/L8ZlZtoXexs1WdRrEqU1YhR/kJRuJ+3RKnKYIbXps1qBRFawr/rbiZx7Q8rS7WZXHu4vhNPJXIqaZ8NzU26fNrhkEgs7+JEdZNCdKLGLzl/PMdVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2+2NSIPvLp9Ze3C1N+MxiA5WzYQa1x6ClZLr93rK0n4=;
 b=FfW1pVunoEcr5i9INUFR/NdqTmB7cZrasfJNTzm1uLcKNK2kAI9jca6baW9VxEx2rDj8+txsV8F8aGCgmNXtwnDk9nREtveP7EajoHJzSpdJaMFEvXpAHWsUjOBfSqhLCQvb7RbHP2g3U1PGIixas4ex2Wxpds323F6erbJUj5Hxyg5fM+tgau4TiMWTsnU0NV4p4XXX0aXzvfeW7a2VAf8zz4ZXTKyvwxurE/+k1K7cAZBv1hlMYQ9N3LPQ5z7ac74A3liXmrxxA4WRSVyMSmlMlNUkbK8x6HSJPLKepsMsU0CfpL7ajX71asmAWMV5eHElgwi5jphf8nzbxH93DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+2NSIPvLp9Ze3C1N+MxiA5WzYQa1x6ClZLr93rK0n4=;
 b=cJcdidu0ZoXvEW1phMZFbMjFF3WxavpbImZOC8eRL95aYbPxtcfs2HpWCCKf1lKcHOfUAmagbGVLqGCeUEpH9tcBwZ1jZnIwFbiFIWdIhVf3sjQPpV/tALFMFWSCPdSsUQWFVXw2gp77WXBeXcIqvjesKXU2nNCOmmlbhrUWsbs3nr/rWf8hjTZSTBjbsQhDnZF9AxnjK6SxclY8ZS/g04sspWiuNnSAL357UVTBBke4W/AxrN9Pw/GREJLm8PYNBWh9Gjt0Osu3kvdV+4b1IXjmXzkINSeYkoUXDaZ65x0p/JwqEaC1SamY7gxqwDfNvF/Z5RNA3iYSZ8QUmmI6oA==
Received: from BN9PR03CA0684.namprd03.prod.outlook.com (2603:10b6:408:10e::29)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:40:54 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::78) by BN9PR03CA0684.outlook.office365.com
 (2603:10b6:408:10e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:40:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:40:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:35 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:34 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 004/156] drm/nouveau: pass drm to nv50_dmac_create(),
 rather than device+disp
Date: Wed, 17 Apr 2024 09:37:30 +1000
Message-ID: <20240416234002.19509-5-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f26893-9036-462b-8f3f-08dc5e6ea83b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQJAf58uPwGM49iZvo/mbvQjc2mVyw05kXgb9EpZ8+SCe21aUz4Ze9vu/HyO/gIXX5RSj1F8+APLqPBZ6c7aSOdOVHamjaOdfRH+FwaqXkzAlY1Ji75+QLDACSTTh5BSwnaIfvFj4VSq2c9q52+PRIIOjiCyRdD0IUccD8aYPJtp0of6A1cGIwIgKkC0H1XkRkYVh6f0TRa2NY+o10KWIK+0SeB4EA+YgYlTbMhChdd7zP+FEpZ6akrIcSOJCL3NCrXwJHV40NjWtYJ+ICY3iOHXEGeK/vb83g1RyBA5cnAbdSUdtkpsZQ2kUveHYIkbhT8eYnr6Y/UCATwFbU/N1YjLuPTsW5ZcDiKKpDoGlb/Xkhp5FFOk04i36umuwHfH2y5BZLgUU3MiaQxY2N0PalIQw7yJZm9BOcCqwx9EjGdoxynI0pjiLS3/W2EhhHDK/neOpa2ecRn4PDQRDnpPHLeM8MQg9Rzz1Y/cUnga2KXPuoiGrV2whtBjkNaBZX1vEtw7f45dSItxdU52hRq3R+q2s4RsvBNPhZV3GFlWdgu3GQo6VRUQOT0EG/OqxKhQAMHf/r0M1H7jFOF+wNI6E1G+NyOBxSxpGPquKWbItsTPBT6Hq7+rcftjcNH9jj83OeJeOhK86nJm7KuC/0BqwlR2PiW8EVqZrI256DzHXrl0VUx5bOQ+lbPaV12NeGXfMD/hhyeE//zZIe5GgYJQXFESH9jICPJ/pJZ6231LrUJ9l3Ysf8ST9h9p+XueEBiH
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:40:53.9000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f26893-9036-462b-8f3f-08dc5e6ea83b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

- zero reason to do otherwise

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/core507d.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 7 ++++---
 drivers/gpu/drm/nouveau/dispnv50/disp.h     | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c | 2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c | 3 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c | 2 +-
 7 files changed, 10 insertions(+), 11 deletions(-)

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
index 0c3d88ad0b0e..f8ca57cc7af6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -226,11 +226,12 @@ static int nv50_dmac_vram_pushbuf = -1;
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
@@ -250,7 +251,7 @@ nv50_dmac_create(struct nvif_device *device, struct nvif_object *disp,
 	    (nv50_dmac_vram_pushbuf < 0 && device->info.family == NV_DEVICE_INFO_V0_PASCAL))
 		type |= NVIF_MEM_VRAM;
 
-	ret = nvif_mem_ctor_map(&cli->mmu, "kmsChanPush", type, 0x1000,
+	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000,
 				&dmac->_push.mem);
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
2.41.0

