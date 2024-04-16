Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95348A7907
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3DB3112F4D;
	Tue, 16 Apr 2024 23:42:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gkDBwKd/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BA2112F80
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZ9Kx2cU6IOg01CCF5OAU2drCH8IBObOU/OyaXXQOaZEGqJFktQTC0JfFYt7TwqS2fDYv1j9BxWsiU8AZX375KPe7nlR8GrNachBjrF5J2TWRuu4HkNCB2dU6TPBB3PfjE9n3Qlg6JBWn/MuFQNSJXT3bfnMV7C2uCZgLFA5pu/FlCoMq+mgu6nvQCeu54bQ++qEJh/b3QNzHgtS3CNRDt8tF6fkXDhW8k74nOB8NDwZTHwpSHjX/X+MR0lP6A54tHTEoy41F5JRniy9WlusYsK5aoDAG2o9AC9zE2iz/FmMXq7jzWlP8vGzj3h2NowhAtvIvSpITQRwil4spVQ+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEgiUc1XNmQ6RTubdAfy6hSvSyAGcHlj34BprE/15ss=;
 b=WoyHAUk9OfrbN7HRsPAjnYaspXduZEb6vKUmcaRGHmu/TNa2STrlpYyDEiDu6Ez+9sRdw+85x7CftcXPajaWvgfnb6vXo4rxfw8PJR7DS17GptwjsZvIM5ADpYssAEM+XEEbYmVxQafDTOukOnfQo40tMcXpUvivrG2n0lgX/G05idNQXPz3YcWwLTP7ARLPxSgp3I364w0ZCP7gCFWnITQVMTh0oe4/0pGPZuE57fptLDoBgb0OAEUJnfcn1j7+sTJbLkPjKnhLSayv1ocjOJhsmZo780ppClHBpjTry1/vn/6xdx2o50qbcEpPmICzpRc1xkYOhA0lCZVwG/tfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEgiUc1XNmQ6RTubdAfy6hSvSyAGcHlj34BprE/15ss=;
 b=gkDBwKd/hd5J7VU1rUNPLXNaAbkrVDEkuHIS6KtuBXaLiKlKhDIdHa01jUFQKqWpra3UBND7DJ8yK0i5v7wWSZ19G/uPJWvF6bDMwmCVPOiAH4XUNS3SvSAODBWT/yaE5K2T/0TKnUrXX8Jyc5qLkH4/2P0k8Hhe1l7o01t6dOx84pfncMtf6aM4gdy2KX1IL/CXa3zWXrtXZMCC5NqqRy4vYRelXwnhqrjoz+F+uG6Hhof/1kwO/WYhSkS/fuQsX00Wou35DvyCaRx6JZZax+RmfL3MK0dlNw5bI/BZ74a2b0NAScWP3XJXl181JzFGKYHkMRSfbgb5eaCXMQ+ctQ==
Received: from DS7PR03CA0083.namprd03.prod.outlook.com (2603:10b6:5:3bb::28)
 by DS0PR12MB8527.namprd12.prod.outlook.com (2603:10b6:8:161::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:30 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::a3) by DS7PR03CA0083.outlook.office365.com
 (2603:10b6:5:3bb::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:29 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:10 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:09 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 087/156] drm/nouveau/nvif: rework vmm "page" api
Date: Wed, 17 Apr 2024 09:38:53 +1000
Message-ID: <20240416234002.19509-88-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DS0PR12MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: 036bf03c-3060-459f-7ba9-08dc5e6ee149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RR4aVeAFP5qm+yWEMklAM0A3iELpSORh3snH69/oYoMN2C1FVMr5StXUWXYDUapwxYdjrwUNSM5Lv+fUJh/ZlyY51cGQfwhnG7FXzeUEmKJ0PM+E2Kes9/1/OhqwjEJPNA9egl2od7y303/22QdAMmcgerjA6FoiZSZ4IVCZLD2dt+rWFLn+YzxLH2w00nFeb7YImB5NcWAbxcr9fMFaZxgHkk7ShzoTj9oZ3hPupqHlurpz0UU4kbYvNZCJpCIf+VL0fcw7YPw8IUcBYa4/tQyxu5IwSElLGn6SpQWwIycJUERmHpO4F4a8+7Z6T8oqUDMRwXrlU3TvnKr1Y91/bh6dnCpeIDWnvoJeULUsDr7EZTnwCKVFa1Yt+x3JnkwNk6UB3x+5fcmG5Wo6fjagMrFe9bytMa2S3oUOQMgtM6ZISVQnw/kbEuuv5xJHQd/2c0oCVi57o8dLVIXwcKCeaL7nuxYq24sWe09BR74anjv1x4emsnuOhlDohPXtmXVJak2R3238XZERKyGkctGS00O7AQv761G9oXFT3fy5spz7+EftGu5ryzw6IyrgTvAHPwk/NbAt1wstGMCglB0yEGIosH1AzOuB4Uo1FcDUBSVJjTxhv2tl3gJcjd473VCxElSxXIhgQPSGe4QOERUZiuuNY2TRY9Bwdbpz+IxRL53CcsoqgqaevnLNWdC0KTtj7KGE6YUljQJJGBroO+7CRMIIukhl5Aomc+jwbpk9Dia7LPhilgCYS/RnspTWGUwW
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:29.7308 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 036bf03c-3060-459f-7ba9-08dc5e6ee149
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8527
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  8 ++++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 12 ------
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |  8 ----
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 20 +++++-----
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 32 +--------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 40 +++++--------------
 6 files changed, 29 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 8f1410ab8256..7540fe4d02c0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -101,6 +101,14 @@ struct nvif_vmm_impl {
 	u64 start;
 	u64 limit;
 	u8 page_nr;
+
+	struct {
+		u8 shift;
+		bool sparse;
+		bool vram;
+		bool host;
+		bool comp;
+	} page[8];
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index c505c5de0088..f554062469c3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -1,7 +1,6 @@
 #ifndef __NVIF_IF000C_H__
 #define __NVIF_IF000C_H__
 
-#define NVIF_VMM_V0_PAGE                                                   0x00
 #define NVIF_VMM_V0_GET                                                    0x01
 #define NVIF_VMM_V0_PUT                                                    0x02
 #define NVIF_VMM_V0_MAP                                                    0x03
@@ -11,17 +10,6 @@
 #define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
-struct nvif_vmm_page_v0 {
-	__u8  version;
-	__u8  index;
-	__u8  shift;
-	__u8  sparse;
-	__u8  vram;
-	__u8  host;
-	__u8  comp;
-	__u8  pad07[1];
-};
-
 struct nvif_vmm_get_v0 {
 	__u8  version;
 #define NVIF_VMM_GET_V0_ADDR                                               0x00
diff --git a/drivers/gpu/drm/nouveau/include/nvif/vmm.h b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
index c4b5d53d9bfd..3019ddc98782 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/vmm.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
@@ -20,14 +20,6 @@ struct nvif_vmm {
 	const struct nvif_vmm_impl *impl;
 	struct nvif_vmm_priv *priv;
 	struct nvif_object object;
-
-	struct {
-		u8 shift;
-		bool sparse:1;
-		bool vram:1;
-		bool host:1;
-		bool comp:1;
-	} *page;
 };
 
 int nvif_vmm_ctor(struct nvif_mmu *, const char *name,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 29e00f8fdd12..ed81872e2dba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -273,21 +273,21 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			 * Skip page sizes that can't support needed domains.
 			 */
 			if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
-			    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
+			    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->impl->page[i].vram)
 				continue;
 			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
-			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+			    (!vmm->impl->page[i].host || vmm->impl->page[i].shift > PAGE_SHIFT))
 				continue;
 
 			/* Select this page size if it's the first that supports
 			 * the potential memory domains, or when it's compatible
 			 * with the requested compression settings.
 			 */
-			if (pi < 0 || !nvbo->comp || vmm->page[i].comp)
+			if (pi < 0 || !nvbo->comp || vmm->impl->page[i].comp)
 				pi = i;
 
 			/* Stop once the buffer is larger than the current page size. */
-			if (*size >= 1ULL << vmm->page[i].shift)
+			if (*size >= 1ULL << vmm->impl->page[i].shift)
 				break;
 		}
 
@@ -297,12 +297,12 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 		}
 
 		/* Disable compression if suitable settings couldn't be found. */
-		if (nvbo->comp && !vmm->page[pi].comp) {
+		if (nvbo->comp && !vmm->impl->page[pi].comp) {
 			if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
 				nvbo->kind = mmu->impl->kind[nvbo->kind];
 			nvbo->comp = 0;
 		}
-		nvbo->page = vmm->page[pi].shift;
+		nvbo->page = vmm->impl->page[pi].shift;
 	} else {
 		/* reject other tile flags when in VM mode. */
 		if (tile_mode)
@@ -319,24 +319,24 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			 *
 			 * Skip page sizes that can't support needed domains.
 			 */
-			if ((domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->page[i].vram)
+			if ((domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->impl->page[i].vram)
 				continue;
 			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
-			    (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIFT))
+			    (!vmm->impl->page[i].host || vmm->impl->page[i].shift > PAGE_SHIFT))
 				continue;
 
 			/* pick the last one as it will be smallest. */
 			pi = i;
 
 			/* Stop once the buffer is larger than the current page size. */
-			if (*size >= 1ULL << vmm->page[i].shift)
+			if (*size >= 1ULL << vmm->impl->page[i].shift)
 				break;
 		}
 		if (WARN_ON(pi < 0)) {
 			kfree(nvbo);
 			return ERR_PTR(-EINVAL);
 		}
-		nvbo->page = vmm->page[pi].shift;
+		nvbo->page = vmm->impl->page[pi].shift;
 	}
 
 	nouveau_bo_fixup_align(nvbo, align, size);
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 35564e9c93ab..73c63bfd1e38 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -196,7 +196,6 @@ nvif_vmm_dtor(struct nvif_vmm *vmm)
 	if (!vmm->impl)
 		return;
 
-	kfree(vmm->page);
 	vmm->impl->del(vmm->priv);
 	vmm->impl = NULL;
 }
@@ -207,9 +206,7 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name,
 	      struct nvif_vmm *vmm)
 {
 	const u32 oclass = mmu->impl->vmm.oclass;
-	int ret, i;
-
-	vmm->page = NULL;
+	int ret;
 
 	ret = mmu->impl->vmm.new(mmu->priv, type, addr, size, argv, argc, &vmm->impl, &vmm->priv,
 				 nvif_handle(&vmm->object));
@@ -218,32 +215,5 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name,
 		return ret;
 
 	nvif_object_ctor(&mmu->object, name ?: "nvifVmm", 0, oclass, &vmm->object);
-
-	vmm->page = kmalloc_array(vmm->impl->page_nr, sizeof(*vmm->page),
-				  GFP_KERNEL);
-	if (!vmm->page) {
-		ret = -ENOMEM;
-		goto done;
-	}
-
-	for (i = 0; i < vmm->impl->page_nr; i++) {
-		struct nvif_vmm_page_v0 args = { .index = i };
-
-		ret = nvif_object_mthd(&vmm->object, NVIF_VMM_V0_PAGE,
-				       &args, sizeof(args));
-		if (ret)
-			break;
-
-		vmm->page[i].shift = args.shift;
-		vmm->page[i].sparse = args.sparse;
-		vmm->page[i].vram = args.vram;
-		vmm->page[i].host = args.host;
-		vmm->page[i].comp = args.comp;
-	}
-
-done:
-	if (ret)
-		nvif_vmm_dtor(vmm);
-
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 28d491a03c59..15aa6a37060b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -307,34 +307,6 @@ nvkm_uvmm_mthd_get(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	return ret;
 }
 
-static int
-nvkm_uvmm_mthd_page(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
-{
-	union {
-		struct nvif_vmm_page_v0 v0;
-	} *args = argv;
-	const struct nvkm_vmm_page *page;
-	int ret = -ENOSYS;
-	u8 type, index, nr;
-
-	page = uvmm->vmm->func->page;
-	for (nr = 0; page[nr].shift; nr++);
-
-	if (!(nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		if ((index = args->v0.index) >= nr)
-			return -EINVAL;
-		type = page[index].type;
-		args->v0.shift = page[index].shift;
-		args->v0.sparse = !!(type & NVKM_VMM_PAGE_SPARSE);
-		args->v0.vram = !!(type & NVKM_VMM_PAGE_VRAM);
-		args->v0.host = !!(type & NVKM_VMM_PAGE_HOST);
-		args->v0.comp = !!(type & NVKM_VMM_PAGE_COMP);
-	} else
-		return -ENOSYS;
-
-	return 0;
-}
-
 static inline int
 nvkm_uvmm_page_index(struct nvif_vmm_priv *uvmm, u64 size, u8 shift, u8 *refd)
 {
@@ -502,7 +474,6 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
 	switch (mthd) {
-	case NVIF_VMM_V0_PAGE  : return nvkm_uvmm_mthd_page  (uvmm, argv, argc);
 	case NVIF_VMM_V0_GET   : return nvkm_uvmm_mthd_get   (uvmm, argv, argc);
 	case NVIF_VMM_V0_PUT   : return nvkm_uvmm_mthd_put   (uvmm, argv, argc);
 	case NVIF_VMM_V0_MAP   : return nvkm_uvmm_mthd_map   (uvmm, argv, argc);
@@ -595,8 +566,17 @@ nvkm_uvmm_new(struct nvkm_mmu *mmu, u8 type, u64 addr, u64 size, void *argv, u32
 	uvmm->impl.limit = uvmm->vmm->limit;
 
 	page = uvmm->vmm->func->page;
-	while (page && (page++)->shift)
+	for (int i = 0; page->shift; i++, page++) {
+		if (WARN_ON(i >= ARRAY_SIZE(uvmm->impl.page)))
+			break;
+
+		uvmm->impl.page[i].shift  = page->shift;
+		uvmm->impl.page[i].sparse = !!(page->type & NVKM_VMM_PAGE_SPARSE);
+		uvmm->impl.page[i].vram   = !!(page->type & NVKM_VMM_PAGE_VRAM);
+		uvmm->impl.page[i].host   = !!(page->type & NVKM_VMM_PAGE_HOST);
+		uvmm->impl.page[i].comp   = !!(page->type & NVKM_VMM_PAGE_COMP);
 		uvmm->impl.page_nr++;
+	}
 
 	*pimpl = &uvmm->impl;
 	*ppriv = uvmm;
-- 
2.41.0

