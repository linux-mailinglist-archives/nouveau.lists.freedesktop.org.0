Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA693CD4E
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497810E2AB;
	Fri, 26 Jul 2024 04:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GHYOTPVx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA7410E913
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNHTcPtJxMbhs8HGZia+R1wmReSpyNJZ+XGsScSiv7DmOeenViDWnS7DLj13PEj6FgRGV9EDZzvaBcwmwSJxgRVSie4uqVkFzjlV1CVdMAu7sescx2w19wmb8BkWSIgoHyWAvyrvAW1IUdJhcWRVIYeh/g4hHBZN4ZsVZ9QFup+zHPkpSVXYp51n7lBGVqDnytbF5cLCP5k5OecI2OYKw7uktXOL+T6/DecL4eN0fCmV2GIWT1aYpOoCWgrTnw/qP2KI1Kh2F3EcR1508jy3RKy0zWs3NMhUDGSFoTw+p8w2uENsC4FlLAL/slNLvRyTg1NJLNSU5PJ0DA6NWaLcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dMti1ZCAWytSSUwk/Cg93NLPYlxs6JcaoAa5onIgJ4=;
 b=T2j5mK9tl03S7MfPbotCGwtPSgTXqmVkeBTxhquuKH+hVHOH/gvc3PZ98doLypNSOSQ9n5N3RbnL40qKjbIoicxzrAKH5wddfaD/Ip1fKcFpFiSMxKUW/xTkGui0tTEvDe9ByGsOREEno2PGWl0TwVwPZyVtvu6ZXh+xV51chEOnXLBEA8a0JnQZhruQ0zLjqkVZm+obF+bwf8SBO9uYMbTFfUIbaMHzf+AdgWkxrFWjLT1Yt1MfXGG+sqvFi4oZ738b/DSBOBDzYe+kCJQzyQ2F67rFik6UMWO8AAOB8Nh6A13FnvdjaL5HLxyrQGcPGfBhArkJ8TKfF4d75Lol+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dMti1ZCAWytSSUwk/Cg93NLPYlxs6JcaoAa5onIgJ4=;
 b=GHYOTPVxBbqodQSjTvkhUZDjANmsKG70qtTYWgN/6/c9axOS8+vMUJbbl+Vhadhphud6bHfzzPoPSSGsBymWCYqj2XbCzgRaxSkKl/0BGU6vn99b1ICmW0aHYd8zPX41TSS0RTLd6zK5p+8RxT/HmyqoULnDr73aOZ+P/FHo9PuSY3Gb3i0UQIg1thSD+/YWriIovMkGRm+M6xxLEyjPpSe3D6pqspP1SqkNP1nJw0MheCdmaVRzunS3KA+aU+Wj8jnoUmpXsvkJsu61V8Yfir959PLzRb87sfbAxrhFxYDqsMTQV8x93ZgbfEZlR4iZZXsMY+jrIDljoMWahcCTcQ==
Received: from DS7PR03CA0091.namprd03.prod.outlook.com (2603:10b6:5:3b7::6) by
 IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 04:39:27 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::9d) by DS7PR03CA0091.outlook.office365.com
 (2603:10b6:5:3b7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:18 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 24/37] drm/nouveau: always map device
Date: Fri, 26 Jul 2024 14:38:15 +1000
Message-ID: <20240726043828.58966-25-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 9544eb8d-71b8-48a0-acbd-08dcad2ceed0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p8CXz3GAFTCbVNTc6QVg3T4uNEe6I0e4fmQE9PjaJX78PTdqC/gYf8tRib5Y?=
 =?us-ascii?Q?WFkGWIQqbJtZHSrMZjtu6ymi9MG8TN7QxmTgTNH45ixKeJn5gFQ80hcAj4Fn?=
 =?us-ascii?Q?0rEwW8gu50zpV3rPLcmPsJ2nAQUoszuXMARQCbccttDDPLsZg5+Wb0lZwnKG?=
 =?us-ascii?Q?CVwP0DT4HX6YTO7eeIqtK3wTG1cLFl819ii+XrSdhj81UJWy1OFP6amjMJ5E?=
 =?us-ascii?Q?tCQ50M66mP1VtZRw0AIk8+Ql2cCga5MbwNy0FFXE/G6orYnQearkm8ClRmeH?=
 =?us-ascii?Q?6s7pTHgThlQZl8wUWEN+tmXvt4aFhdsVbu3Qk73mBBQQi1r1LXVp6eV+G2Od?=
 =?us-ascii?Q?4JAo0PdQVSUG7eW3dR7/WZnQxgvQwrkAIlV3Jbh/nXyVlPgOV5JabhKBSIqb?=
 =?us-ascii?Q?pGvHtEiV3lxT/PoUeyY5x4NhPk2kJL/KabMCriR1vQDffmiE5jAqdtkDCNMm?=
 =?us-ascii?Q?Icipfsck0SXVmDf7GfwVtBe2Y2ooJU+0+qoHPJfPetykLGim58/y0FBCjo7/?=
 =?us-ascii?Q?uKkbv4VpZtHt19iPnIem8jLu/dIHANFzD/XcX5WJxWmcfx/GkXJKzvIKCXIX?=
 =?us-ascii?Q?MSTnAvf4iY8ZDeeFK247T228JX2UI0pl/IwEqmV84phZfbPt2EuZ7XzH9vN8?=
 =?us-ascii?Q?xffNCP+C8jz19fxXmtx0JyZpCEg2qMualFCPx+qjqckRPYmGi6Ha5LRYqDQv?=
 =?us-ascii?Q?LhdQTMUuS9j6+UqbqRHMSf3RLVx7EY6K2kSP+fYFZnY0V5lrzCj2acSXsHeM?=
 =?us-ascii?Q?ywLEsUvYAa/6rEC+lilcq59Fs+YVWC417MFa15ulNvwJF0lMBBMBLE3yUE5t?=
 =?us-ascii?Q?wzutnIRc2nYN3Dqk4atHGwXI0qPONvJMJEuEs185IyoNG3DEDF5QWpykSeJ5?=
 =?us-ascii?Q?b+XgiVLc6UCVuj8ZpOIzXXVggpnU/jv6hlWJy730YdLPw9+vpbPyj5YOOirO?=
 =?us-ascii?Q?RvReokmfFLv0K8ilwr4JdA7XTHHGbwFNUKAlfr5ZU9Tz10f0S9fKC7NXTnNE?=
 =?us-ascii?Q?D2OFhtH7vjJFkgy1MaLhA3rhO1UZyool7U2/hVkG8Ui1nCFmDSpz9rIBeGxl?=
 =?us-ascii?Q?9ziVfBibpNebaWa4tL6Qy5Y5W7DN2x5BF8+sfn3ZMBtSXfM9afuqK4y8kXPf?=
 =?us-ascii?Q?0A+/iV//q5Mt7QDb9QTrr1DONs65Qk4+8uP46DopSNSQE/5Nh2Oc7JrV+j/t?=
 =?us-ascii?Q?Nb7N8FhdezlJMYgmoWwi55AVO9157kkFX8lQPT2MnUEpYL1612ru+3cW2ZrI?=
 =?us-ascii?Q?Vycjv7KM5RYbYVjpBPb++XmNG+BQ91g8HOixX/mNo5o7At8O3jCcB6gtYVY0?=
 =?us-ascii?Q?hchEHCx0n3BnmOOVz7Kv6R2GJICq0gU0rpYTqJQtnjr4sngwD9bM5lzQak8c?=
 =?us-ascii?Q?+Tb/rTvglaFd0WscCA+zPUkLZnT6dG26oN1LPE81bSAYGkaX2p5i5sP3OwJ9?=
 =?us-ascii?Q?mlVGYVgbjsSFBFnx6Hh8SlANPKkevUNl?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:27.5024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9544eb8d-71b8-48a0-acbd-08dcad2ceed0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
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

The next commit removes the nvif rd/wr methods from nvif_device, which
were probably a bad idea, and mostly intended as a fallback if ioremap()
failed (or wasn't available, as was the case in some tools I once used).

The nv04 KMS driver already mapped the device, because it's mostly been
kept alive on life-support for many years and still directly bashes PRI
a lot for modesetting.

Post-nv50, I tried pretty hard to keep PRI accesses out of the DRM code,
but there's still a few random places where we do, and those were using
the rd/wr paths prior to this commit.

This allocates and maps a new nvif_device (which will replace the usage
of nouveau_drm.master.device later on), and replicates this pointer to
all other possible users.

This will be cleaned up by the end of another patch series, after it's
been made safe to do so.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |  5 -----
 drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 16 ++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 ++
 drivers/gpu/drm/nouveau/nvif/device.c         |  6 ++++++
 5 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 13705c5f1497..e8b27bb135e7 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -189,7 +189,6 @@ static void
 nv04_display_destroy(struct drm_device *dev)
 {
 	struct nv04_display *disp = nv04_display(dev);
-	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_encoder *encoder;
 	struct nouveau_crtc *nv_crtc;
 
@@ -206,8 +205,6 @@ nv04_display_destroy(struct drm_device *dev)
 
 	nouveau_display(dev)->priv = NULL;
 	vfree(disp);
-
-	nvif_object_unmap(&drm->client.device.object);
 }
 
 int
@@ -229,8 +226,6 @@ nv04_display_create(struct drm_device *dev)
 
 	disp->drm = drm;
 
-	nvif_object_map(&drm->client.device.object, NULL, 0);
-
 	nouveau_display(dev)->priv = disp;
 	nouveau_display(dev)->dtor = nv04_display_destroy;
 	nouveau_display(dev)->init = nv04_display_init;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index f7c1b3a43c84..fec76f4733a4 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -20,6 +20,7 @@ struct nvif_device {
 
 int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device *);
 void nvif_device_dtor(struct nvif_device *);
+int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
 
 /*XXX*/
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 22cdd987dd2f..316f7877047d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -206,6 +206,7 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
 	nvif_mmu_dtor(&cli->mmu);
+	cli->device.object.map.ptr = NULL;
 	nvif_device_dtor(&cli->device);
 	if (cli != &cli->drm->master) {
 		mutex_lock(&cli->drm->master.lock);
@@ -267,6 +268,8 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
+	cli->device.object.map.ptr = drm->device.object.map.ptr;
+
 	ret = nvif_mclass(&cli->device.object, mmus);
 	if (ret < 0) {
 		NV_PRINTK(err, cli, "No supported MMU class\n");
@@ -715,6 +718,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
 	if (drm->dev)
 		drm_dev_put(drm->dev);
 
+	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 	nvif_parent_dtor(&drm->parent);
 
@@ -751,6 +755,18 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	if (ret)
 		goto done;
 
+	ret = nvif_device_ctor(&drm->master.base, "drmDevice", &drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
+		goto done;
+	}
+
+	ret = nvif_device_map(&drm->device);
+	if (ret) {
+		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
+		goto done;
+	}
+
 done:
 	if (ret) {
 		nouveau_drm_device_del(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e7d072a9a477..80ffe15ba76b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -203,6 +203,8 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
+	struct nvif_device device;
+
 	struct nouveau_cli master;
 	struct nouveau_cli client;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index b14bccb9a93f..24880931039f 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -38,6 +38,12 @@ nvif_device_time(struct nvif_device *device)
 	return device->user.func->time(&device->user);
 }
 
+int
+nvif_device_map(struct nvif_device *device)
+{
+	return nvif_object_map(&device->object, NULL, 0);
+}
+
 void
 nvif_device_dtor(struct nvif_device *device)
 {
-- 
2.45.1

