Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FB48A7909
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B834D112F88;
	Tue, 16 Apr 2024 23:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iTBRgGb/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44CD112F55
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLclRXH1QPdcK37UR8Hq6AGrwfviG9hHyVib6J0sTitNtdIg331TiDCsT0af6UZkLs80eD23gS6vHFZxoBK0Bdpwjmc7qy+mXt/KEIJX7WQtOxrO9BUE7gXUA+2GvyibkEB/JZxBPwQ27NW0j5eEcAWtDgCl/py5BoqceATlfPjtgicYufVFo5pciKdirZxHybXk60uUAKmX6WN/aNG1TST/lZi3bfHGKpvGpj7+kjUaDxrvthKKGweJ1Ky5ty2DZyWbMJTWAib42hphXq4VI2xIyLXm0wP+xf1QcsvL9egucZZtRWTJhgkOD9MKheflKKOdrLAc40niBAMPt6DxYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmqgSi3GEhZxb4y1o7efOSzhjxP1jzQ6QR7UPsovGGc=;
 b=V/1SBc2P4VAs/l1qIzKvnOfo31m7g6gT7RqqlVVWLZsJYDfrp/LBbQvLmTk6btIVqZbI74mxVDAVCL2icw7BV7wrCIa2+g5HfwGYga9/BsG2XAPT6kJQTNwLQ/ilk8AOGFjCL4RTE1GKck3ptMEa3Gl23M9RvVDvF5gZmhqrRNRrte2zNqW9ex9VIcfFGvxLhVfzj47KJKo4F+qXQWZ/1syh6rOnAz/KQjGoLKazIZFQk4AXGnK9go9U9uy1oSevzKn61s3OpH6q91ssOARpw0bgImxafXLct7HpM5LDUHcNmhSxAzhuXqFTXpM6Jrckp469080bSObAiwdU9K1mLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmqgSi3GEhZxb4y1o7efOSzhjxP1jzQ6QR7UPsovGGc=;
 b=iTBRgGb/2OJdQLKx5z4BqpO1KCf+NaccEoAuyyz7crbQ+Lf8jWafDMKgklBNthIsta2bNX2C6IMDJHipeaiMKBqyYKM6y5YR1SV3UOoz1GZrHdw9rrmuWTN3jHixHL0f7Tj+fLA4UZTldXxcK0zhj3ovGxUpnYi/uRJBD0ISW16mu0nwW4jQ9LohoXpwlh7Pj+CC2xcZmWji/JprcF8Qj7pyJ+Dsozb5gEWf/umBQseT2q9rpjkzImTy1wMOOgqOhosBVFgpaljYQw+5C+y2FPm8dR3AAytqlxk0B2BV/xZ7h5nyyuSOAfV5+NwN0mnUDr2oOwtrX62US/74VIJCPg==
Received: from DS7PR03CA0071.namprd03.prod.outlook.com (2603:10b6:5:3bb::16)
 by LV8PR12MB9208.namprd12.prod.outlook.com (2603:10b6:408:182::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:27 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::a) by DS7PR03CA0071.outlook.office365.com
 (2603:10b6:5:3bb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:08 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 085/156] drm/nouveau/nvif: rework mmu "new vmm" api
Date: Wed, 17 Apr 2024 09:38:51 +1000
Message-ID: <20240416234002.19509-86-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|LV8PR12MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7cf9d1-7d04-4ded-513f-08dc5e6edff9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QFN4Ngtbkq1mmmJgTUoUXz65W2L394WvSddF1J9wy6CzZn5Osv6thzFOGISueTNo+J+DgrJzvAGcX/Z3EXUs1aG47zTCJxSBCx6EB8rizEmzFfivUltw/CxrIuAojzwYBLvaCHg6/iTJSo+T97tJZmsfmULrR4lRobtWa9BxYL370PEWJyW4cmTJ1k3/YswCmGrq1xZqIGEeJAROcfsNH5+H3uQ7TKc0flKJpEE8eJqOkBZvX+HxqU6Hy+angZ8mb8ppf+ftSciDeclNj8AH6hveGEWwa27fKcp2DJalEOQvD68+pdteXd2kVRjvDMfixjnAkAgVAVsQb2TGKniLOxl4oODD6OB2x7s0qWtsvln/ZPAoi3wVjPkeIMo+pR0wvfWdH4M2EAa4pbqU133PUKG4YVNMS+scskdG3r3ZMIjqWh5MGHMTwouxnqsOe+EexPpFtGs2aQstPaur9Wz7D7i35t3hms4yohqU6CE8AAXcc2/QbNLzErDzS3SN+FqUlcXgIgiVEM8529uojKObsc1leWAYehRTwPitDVHvRuAhVSZCOze0bYLcUhiJ1YTXqFswdQrI9iMm3+lsA+Rppy9yGoNseZ1CkXbFY0SnfvB0+tLLNYE0IdIbbdlrwJGyMar+itcvQIJPw2UzYjim3uGYO7e7ZvZX7MV1+rm4U6LIct+S/XY5T30J6FDvl6ORu6cIG8xKdaUM6u2+gatHy3HtoLoDwW5NeQllGhAqJ2CBfc9pedxPpbcpVGeSOY6L
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:27.4183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7cf9d1-7d04-4ded-513f-08dc5e6edff9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9208
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 18 +++++++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 12 -----
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    | 12 ++---
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |  2 +-
 drivers/gpu/drm/nouveau/nvif/mmu.c            |  2 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 48 +++++++----------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 24 ++++-----
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h    |  2 -
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 51 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h    |  4 +-
 15 files changed, 94 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 2d883125f02b..4d256a3c3fcf 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -7,6 +7,7 @@ struct nvif_control_priv;
 struct nvif_usermode_priv;
 struct nvif_mmu_priv;
 struct nvif_mem_priv;
+struct nvif_vmm_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -88,6 +89,20 @@ struct nvif_mem_impl {
 	int (*unmap)(struct nvif_mem_priv *);
 };
 
+enum nvif_vmm_type {
+	NVIF_VMM_TYPE_UNMANAGED,
+	NVIF_VMM_TYPE_MANAGED,
+	NVIF_VMM_TYPE_RAW,
+};
+
+struct nvif_vmm_impl {
+	void (*del)(struct nvif_vmm_priv *);
+
+	u64 start;
+	u64 limit;
+	u8 page_nr;
+};
+
 struct nvif_mmu_impl {
 	void (*del)(struct nvif_mmu_priv *);
 
@@ -125,6 +140,9 @@ struct nvif_mmu_impl {
 
 	struct {
 		s32 oclass;
+		int (*new)(struct nvif_mmu_priv *, enum nvif_vmm_type type, u64 addr, u64 size,
+			   void *, u32, const struct nvif_vmm_impl **, struct nvif_vmm_priv **,
+			   u64 handle);
 	} vmm;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index a5a182b3c28d..c505c5de0088 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -1,17 +1,5 @@
 #ifndef __NVIF_IF000C_H__
 #define __NVIF_IF000C_H__
-struct nvif_vmm_v0 {
-	__u8  version;
-	__u8  page_nr;
-#define NVIF_VMM_V0_TYPE_UNMANAGED                                         0x00
-#define NVIF_VMM_V0_TYPE_MANAGED                                           0x01
-#define NVIF_VMM_V0_TYPE_RAW                                               0x02
-	__u8  type;
-	__u8  pad03[5];
-	__u64 addr;
-	__u64 size;
-	__u8  data[];
-};
 
 #define NVIF_VMM_V0_PAGE                                                   0x00
 #define NVIF_VMM_V0_GET                                                    0x01
diff --git a/drivers/gpu/drm/nouveau/include/nvif/vmm.h b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
index e8d8fbd56010..c4b5d53d9bfd 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/vmm.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
@@ -1,15 +1,10 @@
 #ifndef __NVIF_VMM_H__
 #define __NVIF_VMM_H__
 #include <nvif/object.h>
+#include <nvif/driverif.h> /* NVIF_VMM_TYPE */
 struct nvif_mem;
 struct nvif_mmu;
 
-enum nvif_vmm_type {
-	UNMANAGED,
-	MANAGED,
-	RAW,
-};
-
 enum nvif_vmm_get {
 	ADDR,
 	PTES,
@@ -22,9 +17,9 @@ struct nvif_vma {
 };
 
 struct nvif_vmm {
+	const struct nvif_vmm_impl *impl;
+	struct nvif_vmm_priv *priv;
 	struct nvif_object object;
-	u64 start;
-	u64 limit;
 
 	struct {
 		u8 shift;
@@ -33,7 +28,6 @@ struct nvif_vmm {
 		bool host:1;
 		bool comp:1;
 	} *page;
-	int page_nr;
 };
 
 int nvif_vmm_ctor(struct nvif_mmu *, const char *name,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 4c7aced7c398..29e00f8fdd12 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -264,7 +264,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 		nvbo->mode = tile_mode;
 
 		/* Determine the desirable target GPU page size for the buffer. */
-		for (i = 0; i < vmm->page_nr; i++) {
+		for (i = 0; i < vmm->impl->page_nr; i++) {
 			/* Because we cannot currently allow VMM maps to fail
 			 * during buffer migration, we need to determine page
 			 * size for the buffer up-front, and pre-allocate its
@@ -311,7 +311,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			return ERR_PTR(-EINVAL);
 
 		/* Determine the desirable target GPU page size for the buffer. */
-		for (i = 0; i < vmm->page_nr; i++) {
+		for (i = 0; i < vmm->impl->page_nr; i++) {
 			/* Because we cannot currently allow VMM maps to fail
 			 * during buffer migration, we need to determine page
 			 * size for the buffer up-front, and pre-allocate its
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index db6eb3de694e..27c477ed6b9b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -208,7 +208,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		args.target = NV_DMA_V0_TARGET_VM;
 		args.access = NV_DMA_V0_ACCESS_VM;
 		args.start = 0;
-		args.limit = chan->vmm->vmm.limit - 1;
+		args.limit = chan->vmm->vmm.impl->limit - 1;
 	} else
 	if (chan->push.buffer->bo.resource->mem_type == TTM_PL_VRAM) {
 		if (device->info.family == NV_DEVICE_INFO_V0_TNT) {
@@ -237,7 +237,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
 			args.start = 0;
-			args.limit = chan->vmm->vmm.limit - 1;
+			args.limit = chan->vmm->vmm.impl->limit - 1;
 		}
 	}
 
@@ -404,7 +404,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_VM;
 			args.start = 0;
-			args.limit = chan->vmm->vmm.limit - 1;
+			args.limit = chan->vmm->vmm.impl->limit - 1;
 		} else {
 			args.target = NV_DMA_V0_TARGET_VRAM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
@@ -422,7 +422,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_VM;
 			args.start = 0;
-			args.limit = chan->vmm->vmm.limit - 1;
+			args.limit = chan->vmm->vmm.impl->limit - 1;
 		} else
 		if (drm->agp.bridge) {
 			args.target = NV_DMA_V0_TARGET_AGP;
@@ -433,7 +433,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
 			args.start = 0;
-			args.limit = chan->vmm->vmm.limit - 1;
+			args.limit = chan->vmm->vmm.impl->limit - 1;
 		}
 
 		ret = nvif_object_ctor(&chan->user, "abi16ChanGartCtxDma", gart,
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index a478b5a9ed0a..cf5dfbe63e69 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -346,7 +346,7 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	 * All future channel/memory allocations will make use of this
 	 * VMM instead of the standard one.
 	 */
-	ret = nvif_vmm_ctor(&cli->mmu, "svmVmm", MANAGED,
+	ret = nvif_vmm_ctor(&cli->mmu, "svmVmm", NVIF_VMM_TYPE_MANAGED,
 			    args->unmanaged_addr, args->unmanaged_size,
 			    &(struct gp100_vmm_v0) {
 				.fault_replay = true,
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index f87ca8a0e6ae..2d6f1c97db1c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -326,7 +326,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 
 	/* GART init */
 	if (!drm->agp.bridge) {
-		drm->gem.gart_available = drm->client.vmm.vmm.limit;
+		drm->gem.gart_available = drm->cli.vmm.vmm.impl->limit;
 	} else {
 		drm->gem.gart_available = drm->agp.size;
 	}
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index d35096071c1a..1340138bbc13 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1865,7 +1865,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
-	ret = nvif_vmm_ctor(&cli->mmu, "uvmm", RAW,
+	ret = nvif_vmm_ctor(&cli->mmu, "uvmm", NVIF_VMM_TYPE_RAW,
 			    init->kernel_managed_addr,
 			    init->kernel_managed_size,
 			    NULL, 0, &uvmm->vmm.vmm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.c b/drivers/gpu/drm/nouveau/nouveau_vmm.c
index 26a41769551a..353c1a3f9714 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.c
@@ -131,7 +131,7 @@ nouveau_vmm_fini(struct nouveau_vmm *vmm)
 int
 nouveau_vmm_init(struct nouveau_cli *cli, struct nouveau_vmm *vmm)
 {
-	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", UNMANAGED,
+	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", NVIF_VMM_TYPE_UNMANAGED,
 				PAGE_SIZE, 0, NULL, 0, &vmm->vmm);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index d1d09e5a6909..cf1d27f2678d 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -50,5 +50,5 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 		return ret;
 
 	nvif_object_ctor(&device->object, name ?: "nvifMmu", 0, oclass, &mmu->object);
-	return ret;
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 2738ea9229cc..35564e9c93ab 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -20,7 +20,9 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <nvif/vmm.h>
+#include <nvif/driverif.h>
 #include <nvif/mem.h>
+#include <nvif/printf.h>
 
 #include <nvif/if000c.h>
 
@@ -191,8 +193,12 @@ nvif_vmm_raw_sparse(struct nvif_vmm *vmm, u64 addr, u64 size, bool ref)
 void
 nvif_vmm_dtor(struct nvif_vmm *vmm)
 {
+	if (!vmm->impl)
+		return;
+
 	kfree(vmm->page);
-	nvif_object_dtor(&vmm->object);
+	vmm->impl->del(vmm->priv);
+	vmm->impl = NULL;
 }
 
 int
@@ -200,47 +206,27 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name,
 	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
 	      struct nvif_vmm *vmm)
 {
-	struct nvif_vmm_v0 *args;
-	u32 argn = sizeof(*args) + argc;
-	int ret = -ENOSYS, i;
+	const u32 oclass = mmu->impl->vmm.oclass;
+	int ret, i;
 
-	vmm->object.client = NULL;
 	vmm->page = NULL;
 
-	if (!(args = kmalloc(argn, GFP_KERNEL)))
-		return -ENOMEM;
-	args->version = 0;
-	args->addr = addr;
-	args->size = size;
-
-	switch (type) {
-	case UNMANAGED: args->type = NVIF_VMM_V0_TYPE_UNMANAGED; break;
-	case MANAGED: args->type = NVIF_VMM_V0_TYPE_MANAGED; break;
-	case RAW: args->type = NVIF_VMM_V0_TYPE_RAW; break;
-	default:
-		WARN_ON(1);
-		return -EINVAL;
-	}
-
-	memcpy(args->data, argv, argc);
-
-	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifVmm", 0,
-			       mmu->impl->vmm.oclass, args, argn, &vmm->object);
+	ret = mmu->impl->vmm.new(mmu->priv, type, addr, size, argv, argc, &vmm->impl, &vmm->priv,
+				 nvif_handle(&vmm->object));
+	NVIF_ERRON(ret, &mmu->object, "[NEW vmm%08x]", oclass);
 	if (ret)
-		goto done;
+		return ret;
 
-	vmm->start = args->addr;
-	vmm->limit = args->size;
+	nvif_object_ctor(&mmu->object, name ?: "nvifVmm", 0, oclass, &vmm->object);
 
-	vmm->page_nr = args->page_nr;
-	vmm->page = kmalloc_array(vmm->page_nr, sizeof(*vmm->page),
+	vmm->page = kmalloc_array(vmm->impl->page_nr, sizeof(*vmm->page),
 				  GFP_KERNEL);
 	if (!vmm->page) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	for (i = 0; i < vmm->page_nr; i++) {
+	for (i = 0; i < vmm->impl->page_nr; i++) {
 		struct nvif_vmm_page_v0 args = { .index = i };
 
 		ret = nvif_object_mthd(&vmm->object, NVIF_VMM_V0_PAGE,
@@ -258,6 +244,6 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name,
 done:
 	if (ret)
 		nvif_vmm_dtor(vmm);
-	kfree(args);
+
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 8458583af0a7..7afb68dc4bed 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -26,20 +26,18 @@
 #include <core/client.h>
 
 static int
-nvkm_ummu_sclass(struct nvkm_object *object, int index,
-		 struct nvkm_oclass *oclass)
+nvkm_ummu_vmm_new(struct nvif_mmu_priv *ummu, enum nvif_vmm_type type, u64 addr, u64 size,
+		  void *argv, u32 argc, const struct nvif_vmm_impl **pimpl,
+		  struct nvif_vmm_priv **ppriv, u64 handle)
 {
-	struct nvkm_mmu *mmu = container_of(object, struct nvif_mmu_priv, object)->mmu;
-
-	if (mmu->func->vmm.user.oclass) {
-		if (index-- == 0) {
-			oclass->base = mmu->func->vmm.user;
-			oclass->ctor = nvkm_uvmm_new;
-			return 0;
-		}
-	}
+	struct nvkm_object *object;
+	int ret;
 
-	return -EINVAL;
+	ret = nvkm_uvmm_new(ummu->mmu, type, addr, size, argv, argc, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(ummu->object.client, &ummu->object, handle, object);
 }
 
 static int
@@ -71,7 +69,6 @@ nvkm_ummu_impl = {
 
 static const struct nvkm_object_func
 nvkm_ummu = {
-	.sclass = nvkm_ummu_sclass,
 };
 
 int
@@ -119,6 +116,7 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	ummu->impl.mem.new = nvkm_ummu_mem_new;
 
 	ummu->impl.vmm.oclass = mmu->func->vmm.user.oclass;
+	ummu->impl.vmm.new = nvkm_ummu_vmm_new;
 
 	*pimpl = &ummu->impl;
 	*ppriv = ummu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
index c03563aa4cae..d80b2af494dd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
@@ -5,8 +5,6 @@ struct nvkm_device;
 
 #include <nvif/driverif.h>
 
-#define nvkm_ummu nvif_mmu_priv
-
 struct nvif_mmu_priv {
 	struct nvkm_object object;
 	struct nvkm_mmu *mmu;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 761a50047b42..28d491a03c59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -34,6 +34,8 @@
 struct nvif_vmm_priv {
 	struct nvkm_object object;
 	struct nvkm_vmm *vmm;
+
+	struct nvif_vmm_impl impl;
 };
 
 static const struct nvkm_object_func nvkm_uvmm;
@@ -521,6 +523,19 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 	return -EINVAL;
 }
 
+static void
+nvkm_uvmm_del(struct nvif_vmm_priv *uvmm)
+{
+	struct nvkm_object *object = &uvmm->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_vmm_impl
+nvkm_uvmm_impl = {
+	.del = nvkm_uvmm_del,
+};
+
 static void *
 nvkm_uvmm_dtor(struct nvkm_object *object)
 {
@@ -537,33 +552,22 @@ nvkm_uvmm = {
 };
 
 int
-nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+nvkm_uvmm_new(struct nvkm_mmu *mmu, u8 type, u64 addr, u64 size, void *argv, u32 argc,
+	      const struct nvif_vmm_impl **pimpl, struct nvif_vmm_priv **ppriv,
 	      struct nvkm_object **pobject)
 {
-	struct nvkm_mmu *mmu = container_of(oclass->parent, struct nvif_mmu_priv, object)->mmu;
-	const bool more = oclass->base.maxver >= 0;
-	union {
-		struct nvif_vmm_v0 v0;
-	} *args = argv;
 	const struct nvkm_vmm_page *page;
 	struct nvif_vmm_priv *uvmm;
 	int ret = -ENOSYS;
-	u64 addr, size;
 	bool managed, raw;
 
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, more))) {
-		managed = args->v0.type == NVIF_VMM_V0_TYPE_MANAGED;
-		raw = args->v0.type == NVIF_VMM_V0_TYPE_RAW;
-		addr = args->v0.addr;
-		size = args->v0.size;
-	} else
-		return ret;
+	managed = type == NVIF_VMM_TYPE_MANAGED;
+	raw = type == NVIF_VMM_TYPE_RAW;
 
 	if (!(uvmm = kzalloc(sizeof(*uvmm), GFP_KERNEL)))
 		return -ENOMEM;
 
-	nvkm_object_ctor(&nvkm_uvmm, oclass, &uvmm->object);
-	*pobject = &uvmm->object;
+	nvkm_object_ctor(&nvkm_uvmm, &(struct nvkm_oclass) {}, &uvmm->object);
 
 	if (!mmu->vmm) {
 		ret = mmu->func->vmm.ctor(mmu, managed || raw, addr, size,
@@ -571,7 +575,7 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		if (ret)
 			return ret;
 
-		uvmm->vmm->debug = max(uvmm->vmm->debug, oclass->client->debug);
+		uvmm->vmm->debug = NV_DBG_ERROR;
 	} else {
 		if (size)
 			return -EINVAL;
@@ -586,11 +590,16 @@ nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 			return ret;
 	}
 
+	uvmm->impl = nvkm_uvmm_impl;
+	uvmm->impl.start = uvmm->vmm->start;
+	uvmm->impl.limit = uvmm->vmm->limit;
+
 	page = uvmm->vmm->func->page;
-	args->v0.page_nr = 0;
 	while (page && (page++)->shift)
-		args->v0.page_nr++;
-	args->v0.addr = uvmm->vmm->start;
-	args->v0.size = uvmm->vmm->limit;
+		uvmm->impl.page_nr++;
+
+	*pimpl = &uvmm->impl;
+	*ppriv = uvmm;
+	*pobject = &uvmm->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
index cf0172a320c3..51c639cd0ce0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.h
@@ -1,7 +1,9 @@
 #ifndef __NVKM_UVMM_H__
 #define __NVKM_UVMM_H__
 #include "vmm.h"
+#include <nvif/driverif.h>
 
-int nvkm_uvmm_new(const struct nvkm_oclass *, void *argv, u32 argc,
+int nvkm_uvmm_new(struct nvkm_mmu *mmu, u8 type, u64 addr, u64 size,
+		  void *, u32, const struct nvif_vmm_impl **, struct nvif_vmm_priv **,
 		  struct nvkm_object **);
 #endif
-- 
2.41.0

