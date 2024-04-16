Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550708A7913
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D757F112F66;
	Tue, 16 Apr 2024 23:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VZufIFtI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF46112F9A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KM6pmEk/rPUcbo6+cfUvoRIGhViO/puz3ndAn6Ojt85O7mx7IpKYzI+0bcQ7COqIopj31NmWS+952SQrEXjpHIoRwBQpGpHLy1JHRA5Qxu4vJZJSy277yiT1EHkNvujua4tu0+P6myAbNmH4EPJ84vcchN19xlXJILCBOlV8nPSC7JRezRTOn1ZUjY2ud9fzopj9e1j/yPTfvX5HmJXrcjGQ24k9Fy+fNQYfolgkwlgAmPb61vjK0M/1eLHr/DCsYyWAamFAQ2VcEGqkVlhAxMJMXUZSQHI3v5wHyAh5BKSgh3bgK25UHiFiyULElSCsjm8w4qLAaHX2sa1kE1vUSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pJU2/vg5S4U+AUK7UVKYVCU++bq4rq/xp/ryHWYC6c=;
 b=Myo8mmKWEtloqeLzNLNJTF9p4wLmWqYw82pXFLtbpvZauTJE5ZBcmNaOjOsNjHdTo6xXQ9LIjfqcvHlOCrqjOqz8yXtQ6tIuE81LYsTtDzITLS+DZHHKnE7UR44O76JBBNLHFfHwWWo3AvkPpL+YB08TnRLyZONFWqBSijMWgYdrcqzy6nKL60zAJQy/BDOaPKxwcbH5uAw7RJDQMC7UPjroMdGiISv2pMSxx9Q4LbI3Tuko7Om0xi7PggpdOKIpv3xNiUbEFmvOPE40pQ9KMiI2bix48PZGQq5PDAKbTTh/U8C5uaA/LjF7QhTvfBg0p23K/Rl6AfxPNVX43A5J7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pJU2/vg5S4U+AUK7UVKYVCU++bq4rq/xp/ryHWYC6c=;
 b=VZufIFtIPsfCt9OykTqjD4JR6QHMycySyA9sIKHj5PxLmYlqb85MbKaH5R/aa5/3GcSdPd1W7mmrmgeZ6DxGiRHNtFkMkn9bbi4aWwBAiEU2gRHH+QSjGhWlko26sA+0whkYfQaCZWlIvQcVvc2KaHAS6BZdpnr2S8aDKwZ3NYbooL0I2rID8y9aI9Brm+unGbip9mv+8L9d9MDZcWw7GNQu2CSNAykUiG3rm0irb8O3RTbHPB9LiHfBWM4fdJHjS8DUGUyzvcVevnbxURcovkTwu+F9PULU1lGu1pRoVOyuhWhxgfrddjEGze1o6Et0XV+wgBlGsyLBCD9wVsR+zA==
Received: from CH0PR13CA0037.namprd13.prod.outlook.com (2603:10b6:610:b2::12)
 by CY5PR12MB6058.namprd12.prod.outlook.com (2603:10b6:930:2d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:45 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::53) by CH0PR13CA0037.outlook.office365.com
 (2603:10b6:610:b2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:26 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 101/156] drm/nouveau/nvif: rework disp "new caps" api
Date: Wed, 17 Apr 2024 09:39:07 +1000
Message-ID: <20240416234002.19509-102-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|CY5PR12MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 540d9f60-a83e-4c0c-720b-08dc5e6eea75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oum5a2/Sh4yZiviAgU0MHDd8/PnvQxsDyUgKUgLYgPWRfDzWlvB//LOZF9I0KDfdkwnmbdhZxmQd8Nw0Ec1aPofMgFEI3eajimwGdrSmIyLE8z6LMCyopS3kanh7+vKuefu8lS68tjszhyFEJATXMCFDkBYdGbiFcE4CzsRkjWCfXCLYPEGZRrt3em8geBG9wFsdo8O2cPbfXHSFHJPbEVLAQF+JgtSXj5gtIfTWvSdGKPA3tgbugdqjlRgZeAkIdvkJdKv7H5K7P8F+NHV8ZhrL+7xlvLzBRkEPHqkdxMCxA0TzAbHtKceHcVp7hLXO6DNtZZHiMoNc20dKDdKBPcif6ittnsIK0uCX393kLiBYpvzBmT/mUAvYKpDJ9hMGSBOB+Vl8W6Tvrz6/s8lI3k3eRqtVNw2h+kBOG0hz5v5WtNRqGla6ZlUkqwKWc8Rq+4uQ46xvvTjdBZ7tKT0F1ZukKIUn/J+Jg+DZPdhnsZOq8GFKr9qG4QpETLKBU2hltHv9Zx0PmhJTrySkquWQlgwWTjZNng1+tThe+EY+878TYjZGSf1zkLy2VRySh6o7DrPq7Ar+KIswRgcWjkc9QykMk8ATPPgJM0IS9djxvB6NE0N0E8l2EhgKfpdClTO2riMSEIJ7dCIpPhV99vhl4Mi3AVe2/odfZSnyw82OkIVuBYFAdEXe/gQhlrfCL0wMTruY/jwrOY0bAlVmApCIHstb/6Cw8UjMaroWbrTg475scH+ZufJcXOxPmk1N7m3z
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:45.1184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 540d9f60-a83e-4c0c-720b-08dc5e6eea75
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6058
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c   | 11 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |  2 +-
 drivers/gpu/drm/nouveau/include/nvif/disp.h   | 11 +++
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  8 +++
 drivers/gpu/drm/nouveau/nvif/disp.c           | 32 +++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/ad102.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ga102.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/gv100.c  | 42 ++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  5 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/tu102.c  |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/ucaps.c  | 70 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/ucaps.h  |  9 +++
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 23 ++++--
 15 files changed, 161 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index 9525fd30c8fc..60535526ac89 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -104,8 +104,7 @@ int corec37d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 {
 	int ret;
 
-	ret = nvif_object_ctor(&disp->disp->object, "dispCaps", 0,
-			       GV100_DISP_CAPS, NULL, 0, &disp->caps);
+	ret = nvif_disp_caps_ctor(disp->disp, "dispCaps", &disp->caps);
 	if (ret) {
 		NV_ERROR(drm,
 			 "Failed to init notifier caps region: %d\n",
@@ -113,14 +112,6 @@ int corec37d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 		return ret;
 	}
 
-	ret = nvif_object_map(&disp->caps, NULL, 0);
-	if (ret) {
-		NV_ERROR(drm,
-			 "Failed to map notifier caps region: %d\n",
-			 ret);
-		return ret;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b89a8f4ee506..802dccace624 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2788,8 +2788,7 @@ nv50_display_destroy(struct drm_device *dev)
 
 	nv50_audio_component_fini(nouveau_drm(dev));
 
-	nvif_object_unmap(&disp->caps);
-	nvif_object_dtor(&disp->caps);
+	nvif_disp_caps_dtor(&disp->caps);
 	nv50_core_del(&disp->core);
 
 	nouveau_bo_unmap(disp->sync);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 9485f8c90cac..39aaa385cd6a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -12,7 +12,7 @@ struct nouveau_encoder;
 struct nv50_disp {
 	struct nvif_disp *disp;
 	struct nv50_core *core;
-	struct nvif_object caps;
+	struct nvif_disp_caps caps;
 
 #define NV50_DISP_SYNC(c, o)                                ((c) * 0x040 + (o))
 #define NV50_DISP_CORE_NTFY                       NV50_DISP_SYNC(0      , 0x00)
diff --git a/drivers/gpu/drm/nouveau/include/nvif/disp.h b/drivers/gpu/drm/nouveau/include/nvif/disp.h
index 06f56cc63893..b41ff8c091b1 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/disp.h
@@ -17,4 +17,15 @@ struct nvif_disp {
 
 int nvif_disp_ctor(struct nvif_device *, const char *name, struct nvif_disp *);
 void nvif_disp_dtor(struct nvif_disp *);
+
+struct nvif_disp_caps {
+	const struct nvif_disp_caps_impl *impl;
+	struct nvif_disp_caps_priv *priv;
+
+	struct nvif_object object;
+	struct nvif_map map;
+};
+
+int nvif_disp_caps_ctor(struct nvif_disp *, const char *name, struct nvif_disp_caps *);
+void nvif_disp_caps_dtor(struct nvif_disp_caps *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index f96638ce4b12..412b2dff3a74 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -11,6 +11,7 @@ struct nvif_mem_priv;
 struct nvif_vmm_priv;
 struct nvif_faultbuf_priv;
 struct nvif_disp_priv;
+struct nvif_disp_caps_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -217,11 +218,18 @@ struct nvif_faultbuf_impl {
 	} event;
 };
 
+struct nvif_disp_caps_impl {
+	void (*del)(struct nvif_disp_caps_priv *);
+	struct nvif_mapinfo map;
+};
+
 struct nvif_disp_impl {
 	void (*del)(struct nvif_disp_priv *);
 
 	struct {
 		u32 oclass;
+		int (*new)(struct nvif_disp_priv *,
+			   const struct nvif_disp_caps_impl **, struct nvif_disp_caps_priv **);
 	} caps;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index f3c425daf7d5..d2824e4d29f8 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -25,6 +25,38 @@
 
 #include <nvif/class.h>
 
+void
+nvif_disp_caps_dtor(struct nvif_disp_caps *caps)
+{
+	if (!caps->impl)
+		return;
+
+	nvif_object_unmap_cpu(&caps->map);
+
+	caps->impl->del(caps->priv);
+	caps->impl = NULL;
+}
+
+int
+nvif_disp_caps_ctor(struct nvif_disp *disp, const char *name, struct nvif_disp_caps *caps)
+{
+	const u32 oclass = disp->impl->caps.oclass;
+	int ret;
+
+	ret = disp->impl->caps.new(disp->priv, &caps->impl, &caps->priv);
+	NVIF_ERRON(ret, &disp->object, "[NEW caps%04x]", oclass);
+	if (ret)
+		return ret;
+
+	nvif_object_ctor(&disp->object, name ?: "nvifDispCaps", 0, oclass, &caps->object);
+
+	ret = nvif_object_map_cpu(&caps->object, &caps->impl->map, &caps->map);
+	if (ret)
+		nvif_disp_caps_dtor(caps);
+
+	return ret;
+}
+
 void
 nvif_disp_dtor(struct nvif_disp *disp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
index e346e924fee8..f0856423af91 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/Kbuild
@@ -32,6 +32,7 @@ nvkm-y += nvkm/engine/disp/ad102.o
 nvkm-y += nvkm/engine/disp/r535.o
 
 nvkm-y += nvkm/engine/disp/udisp.o
+nvkm-y += nvkm/engine/disp/ucaps.o
 nvkm-y += nvkm/engine/disp/uconn.o
 nvkm-y += nvkm/engine/disp/uoutp.o
 nvkm-y += nvkm/engine/disp/uhead.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
index f818828e3f04..190aa0303fd3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ad102.c
@@ -32,7 +32,7 @@ ad102_disp = {
 	.ramht_size = 0x2000,
 	.user = {
 		.root = { AD102_DISP },
-		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps },
 		.curs = { GA102_DISP_CURSOR                , &gv100_disp_curs },
 		.wimm = { GA102_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
 		.core = { AD102_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
index c6b77e4d08a0..7712e6a5caac 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ga102.c
@@ -135,7 +135,7 @@ ga102_disp = {
 	.ramht_size = 0x2000,
 	.user = {
 		.root = { GA102_DISP },
-		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps },
 		.curs = { GA102_DISP_CURSOR                , &gv100_disp_curs },
 		.wimm = { GA102_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
 		.core = { GA102_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
index 7876241e10e7..81ebec100d93 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/gv100.c
@@ -791,45 +791,13 @@ gv100_disp_core = {
 	.mthd = &gv100_disp_core_mthd,
 };
 
-#define gv100_disp_caps(p) container_of((p), struct gv100_disp_caps, object)
-
-struct gv100_disp_caps {
-	struct nvkm_object object;
-	struct nvkm_disp *disp;
-};
-
-static int
-gv100_disp_caps_map(struct nvkm_object *object, void *argv, u32 argc,
-		    enum nvkm_object_map *type, u64 *addr, u64 *size)
+void
+gv100_disp_caps(struct nvkm_disp *disp, u64 *addr, u64 *size)
 {
-	struct gv100_disp_caps *caps = gv100_disp_caps(object);
-	struct nvkm_device *device = caps->disp->engine.subdev.device;
-	*type = NVKM_OBJECT_MAP_IO;
+	struct nvkm_device *device = disp->engine.subdev.device;
+
 	*addr = 0x640000 + device->func->resource_addr(device, 0);
 	*size = 0x1000;
-	return 0;
-}
-
-static const struct nvkm_object_func
-gv100_disp_caps = {
-	.map = gv100_disp_caps_map,
-};
-
-#include "udisp.h"
-int
-gv100_disp_caps_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
-		    struct nvkm_object **pobject)
-{
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
-	struct gv100_disp_caps *caps;
-
-	if (!(caps = kzalloc(sizeof(*caps), GFP_KERNEL)))
-		return -ENOMEM;
-	*pobject = &caps->object;
-
-	nvkm_object_ctor(&gv100_disp_caps, oclass, &caps->object);
-	caps->disp = disp;
-	return 0;
 }
 
 void
@@ -1238,7 +1206,7 @@ gv100_disp = {
 	.ramht_size = 0x2000,
 	.user = {
 		.root = { GV100_DISP },
-		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps },
 		.curs = { GV100_DISP_CURSOR                , &gv100_disp_curs },
 		.wimm = { GV100_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
 		.core = { GV100_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 324a7971a0eb..822c4ffe5a38 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -42,8 +42,7 @@ struct nvkm_disp_func {
 
 		struct {
 			s32 oclass;
-			int (*ctor)(const struct nvkm_oclass *, void *argv, u32 argc,
-				    struct nvkm_object **);
+			void (*addr)(struct nvkm_disp *, u64 *addr, u64 *size);
 		} caps;
 
 		struct nvkm_disp_func_chan {
@@ -76,7 +75,7 @@ void gv100_disp_fini(struct nvkm_disp *, bool suspend);
 void gv100_disp_intr(struct nvkm_disp *);
 void gv100_disp_super(struct work_struct *);
 int gv100_disp_wndw_cnt(struct nvkm_disp *, unsigned long *);
-int gv100_disp_caps_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
+void gv100_disp_caps(struct nvkm_disp *, u64 *addr, u64 *size);
 
 int tu102_disp_init(struct nvkm_disp *);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
index 21b945a88823..6d0806da18ef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/tu102.c
@@ -221,7 +221,7 @@ tu102_disp = {
 	.ramht_size = 0x2000,
 	.user = {
 		.root = { TU102_DISP },
-		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps_new },
+		.caps = { GV100_DISP_CAPS                  ,  gv100_disp_caps },
 		.curs = { TU102_DISP_CURSOR                , &gv100_disp_curs },
 		.wimm = { TU102_DISP_WINDOW_IMM_CHANNEL_DMA, &gv100_disp_wimm },
 		.core = { TU102_DISP_CORE_CHANNEL_DMA      , &gv100_disp_core },
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.c
new file mode 100644
index 000000000000..2f22a88cb97b
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.c
@@ -0,0 +1,70 @@
+/*
+ * Copyright (c) 2024, NVIDIA CORPORATION. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ */
+#include "ucaps.h"
+
+struct nvif_disp_caps_priv {
+	struct nvkm_object object;
+	struct nvkm_disp *disp;
+
+	struct nvif_disp_caps_impl impl;
+};
+
+static void
+nvkm_ucaps_del(struct nvif_disp_caps_priv *ucaps)
+{
+	struct nvkm_object *object = &ucaps->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_disp_caps_impl
+nvkm_ucaps_impl = {
+	.del = nvkm_ucaps_del,
+};
+
+static const struct nvkm_object_func
+nvkm_ucaps = {
+};
+
+int
+nvkm_ucaps_new(struct nvkm_disp *disp, const struct nvif_disp_caps_impl **pimpl,
+	       struct nvif_disp_caps_priv **ppriv, struct nvkm_object **pobject)
+{
+	struct nvif_disp_caps_priv *ucaps;
+
+	ucaps = kzalloc(sizeof(*ucaps), GFP_KERNEL);
+	if (!ucaps)
+		return -ENOMEM;
+	*pobject = &ucaps->object;
+
+	nvkm_object_ctor(&nvkm_ucaps, &(struct nvkm_oclass) {}, &ucaps->object);
+	ucaps->disp = disp;
+	ucaps->impl = nvkm_ucaps_impl;
+
+	ucaps->impl.map.type = NVIF_MAP_IO;
+	disp->func->user.caps.addr(disp, &ucaps->impl.map.handle, &ucaps->impl.map.length);
+
+	*pimpl = &ucaps->impl;
+	*ppriv = ucaps;
+	*pobject = &ucaps->object;
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.h
new file mode 100644
index 000000000000..690a92930363
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ucaps.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UCAPS_H__
+#define __NVKM_UCAPS_H__
+#include "priv.h"
+#include <nvif/driverif.h>
+
+int nvkm_ucaps_new(struct nvkm_disp *, const struct nvif_disp_caps_impl **,
+		   struct nvif_disp_caps_priv **, struct nvkm_object **);
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index fd8590514c7e..cef8427cca91 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "udisp.h"
+#include "ucaps.h"
 #include "chan.h"
 #include "conn.h"
 #include "head.h"
@@ -50,12 +51,6 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 		return 0;
 	}
 
-	if (disp->func->user.caps.oclass && index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { -1, -1, disp->func->user.caps.oclass };
-		sclass->ctor = disp->func->user.caps.ctor;
-		return 0;
-	}
-
 	if (disp->func->user.core.oclass && index-- == 0) {
 		sclass->base = (struct nvkm_sclass) { 0, 0, disp->func->user.core.oclass };
 		sclass->ctor = nvkm_disp_core_new;
@@ -101,6 +96,21 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 	return -EINVAL;
 }
 
+static int
+nvkm_udisp_caps_new(struct nvif_disp_priv *udisp,
+		    const struct nvif_disp_caps_impl **pimpl, struct nvif_disp_caps_priv **ppriv)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_ucaps_new(udisp->disp, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	nvkm_object_link(&udisp->object, object);
+	return 0;
+}
+
 static void
 nvkm_udisp_del(struct nvif_disp_priv *udisp)
 {
@@ -173,6 +183,7 @@ nvkm_udisp_new(struct nvkm_device *device, const struct nvif_disp_impl **pimpl,
 
 	if (disp->func->user.caps.oclass) {
 		udisp->impl.caps.oclass = disp->func->user.caps.oclass;
+		udisp->impl.caps.new = nvkm_udisp_caps_new;
 	}
 
 	list_for_each_entry(conn, &disp->conns, head)
-- 
2.41.0

