Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39A8A78FE
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77802112F7B;
	Tue, 16 Apr 2024 23:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qMiuFAdp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C58112F49
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNu+A64BqkVLVgRG+bbiJwE57urXpuwuR/tjHy07T26TYy16S20XtK6Dn3pJUEnbYnJZOVle3YFATEJcZJDAjKer8IYXcy0mpKwCzKTKK5diF4mecs3ZHH5tTXXAMaQouCpuKn0iaU1ACou6lF7Btf0t/btTPpcX7ZCU0jnmnHhiD8iKoUFYBPEKUeqvpaM11xb5sWwtLW7Q/FOfa/YIKFw6221sf2dhrcTdK/SpabNqMxc4UkWjI6+OwYiQwuEu63BKBu8msZ986FnZkvk7Pr01dz/sittik4NRArbANJ6jnVa4z0iau/dRMKdgvwykwVJR7jZDmLwMZn9lHkNrmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghtwxhPio/lvMLTtZmkI3X52wG3CECPUeFKIP6v/C+U=;
 b=QUrqTb87Yo7kxpneaxs/Ol6VpqBiW5/uj3Htb5rtSAX0KQ+m+JvMwXGs6enpTvBFACpf5KxOYy1USc8XnmeClUczcdnrxhff1LF4H4qHyp/48dsmXV13auLMNJwXIrXat214mEmRog1IjpSpaVi8bqpVL/v9Gpt+r+JmZEMoFyQJtO0dhg9LBoO6MFzhCBEUWL7Jmfyv3LeJT+6oupAbv1bi2AkEi5X73cPgWxLTZenkCYLlC6Nx0wuYNi1fQ1UT47iDXvMqpX7axx/pJ86F1TOPsDxqFlPcafLDHG0X7hHvzZrfEY7HJ/8cIm2TXU6fcvAyyvd3MIUX0F1KssfhMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghtwxhPio/lvMLTtZmkI3X52wG3CECPUeFKIP6v/C+U=;
 b=qMiuFAdpeuLDZya6n1MhzOkY/w3YvEkIeWKH0MDaIJFTZuzdog6aMrdj3ZCZpXDL6vXQoZ+h6b6QaD1fugtGy74+7pLzoadgbA3CmTaZi18dQyZ6Sz8+iq7y4Y+w2X4AksqbWcOFvOwCAAaXsFesDBHRW6cMmtFzA4sZNuxL51pvcifBPsd8rBbMyb+4x/hUKK4lZGkHASbeH+3ujZLyw0+kE0dnLJJjaLy76ALdMzKuqwgNiq6zAQgucloPghVw4iTGAZcAlTl+u7YXlV3Y2h+cEtvlmZigMFRIeIniMnn3EuyElYMEM/TG3jOqOQlkNHT+FUfDlBo7GKy+yMcgQQ==
Received: from DM6PR12CA0036.namprd12.prod.outlook.com (2603:10b6:5:1c0::49)
 by BY5PR12MB4275.namprd12.prod.outlook.com (2603:10b6:a03:20a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:21 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::11) by DM6PR12CA0036.outlook.office365.com
 (2603:10b6:5:1c0::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:21 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:04 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 082/156] drm/nouveau/nvif: rework mmu "kind" api
Date: Wed, 17 Apr 2024 09:38:48 +1000
Message-ID: <20240416234002.19509-83-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|BY5PR12MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f0ee29-1811-483e-2461-08dc5e6edc4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: quV+T2cqdLacHsakseegWKtAGSRqNdXqhXzFRnaEw19n8rTsQeXMtGuYHvjiUohW0HWPydSd+WxuuuXl+sW3+JCiY1ih21Wji6hEs1Jqe4XuVzw2ymgf0oPgdcV8FDI/rxgUohWPlfVcJFc13vx8wuUplXEFYTFBJGYsqoOMDqg+z05Xvaznw91ZUKFpEF/4kywcyWaZElyCQUdx4UedxXg7B/d5cYd5ZKbOd38bHAppPGMR7b3rsYWnq2xq0UlitpMGOvQN3EalukwVz3TdyBxSIOLfDZ0cASDM9hfBy3kUDi9mn4t2LxEH7juyX+d9zsqXCyOP8WXluT43gzyVERg06aSF5bdhncijFLUpeLOsoDfDVpVFEezfxzYI435zULJgoTICpm6Zh1yktpCQSpWMpk8AeLJJqg+Uruov6oULPqmpuYsePecEXWEvaglnXmECGHC+6pT/jE7jX5yLdH3Rag02EC8Yc3f4mMvQmD4z6hJ8LRcM621tKnEuAYZH9UsjNnGfOk83cZUtBMhB3V8nx/4cfUk+tSylpq/XE7NWyW2C8i8Ssnk9UC9iUeWiNMSEbjmO2KoZpsMkzAtmDfFAaH7hZJAmR/GRYG2pVtVioO3QE7hxmVUkWs1F38eSQ5530/lmLhSFkgylPCk2NvghHtra0ZMnhonugvDY+4SGn6JEORAhGpA9urU6o9OnV2Z7TrN5N3NlUysQr5hH16BpMD7sVnXSgtMU4hnK5RCS6AtWQWkghPTU8OQ/BLje
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:21.3727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f0ee29-1811-483e-2461-08dc5e6edc4e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4275
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  3 ++
 drivers/gpu/drm/nouveau/include/nvif/if0008.h | 12 -----
 drivers/gpu/drm/nouveau/include/nvif/mmu.h    |  6 +--
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 +-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  4 +-
 drivers/gpu/drm/nouveau/nvif/mmu.c            | 31 -----------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 53 ++-----------------
 7 files changed, 13 insertions(+), 100 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0008.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index fa08478cc38f..f387ec622a45 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -83,6 +83,7 @@ struct nvif_mmu_impl {
 	u8 heap_nr;
 	u8 type_nr;
 
+	u8 kind_inv;
 	u16 kind_nr;
 
 	struct {
@@ -102,6 +103,8 @@ struct nvif_mmu_impl {
 		u8 heap;
 	} type[16];
 
+	const u8 *kind;
+
 	struct {
 		s32 oclass;
 	} mem;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0008.h b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
deleted file mode 100644
index 0413e7e4ca0c..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0008.h
+++ /dev/null
@@ -1,12 +0,0 @@
-#ifndef __NVIF_IF0008_H__
-#define __NVIF_IF0008_H__
-
-#define NVIF_MMU_V0_KIND                                                   0x02
-
-struct nvif_mmu_kind_v0 {
-	__u8  version;
-	__u8  kind_inv;
-	__u16 count;
-	__u8  data[];
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mmu.h b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
index 203328a2d611..f1e51a5544da 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
@@ -8,10 +8,6 @@ struct nvif_mmu {
 	const struct nvif_mmu_impl *impl;
 	struct nvif_mmu_priv *priv;
 	struct nvif_object object;
-	u8  kind_inv;
-	u16 kind_nr;
-
-	u8 *kind;
 };
 
 int nvif_mmu_ctor(struct nvif_device *, const char *name, struct nvif_mmu *);
@@ -21,7 +17,7 @@ static inline bool
 nvif_mmu_kind_valid(struct nvif_mmu *mmu, u8 kind)
 {
 	if (kind) {
-		if (kind >= mmu->kind_nr || mmu->kind[kind] == mmu->kind_inv)
+		if (kind >= mmu->impl->kind_nr || mmu->impl->kind[kind] == mmu->impl->kind_inv)
 			return false;
 	}
 	return true;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 08d522aaae38..0d946e31bccd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -250,7 +250,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 				return ERR_PTR(-EINVAL);
 			}
 
-			nvbo->comp = mmu->kind[nvbo->kind] != nvbo->kind;
+			nvbo->comp = mmu->impl->kind[nvbo->kind] != nvbo->kind;
 		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
 			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
 			nvbo->comp = (tile_flags & 0x00030000) >> 16;
@@ -299,7 +299,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 		/* Disable compression if suitable settings couldn't be found. */
 		if (nvbo->comp && !vmm->page[pi].comp) {
 			if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
-				nvbo->kind = mmu->kind[nvbo->kind];
+				nvbo->kind = mmu->impl->kind[nvbo->kind];
 			nvbo->comp = 0;
 		}
 		nvbo->page = vmm->page[pi].shift;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 554500a650db..872d689db7ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -104,7 +104,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 		mem->comp = mem->kind = 0;
 	if (mem->comp && !(mmu->impl->type[type].type & NVIF_MEM_COMP)) {
 		if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
-			mem->kind = mmu->kind[mem->kind];
+			mem->kind = mmu->impl->kind[mem->kind];
 		mem->comp = 0;
 	}
 
@@ -144,7 +144,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 		ret = nvif_mem_ctor_type(mmu, "ttmVram",
 					 drm->ttm.type_vram, page, size,
 					 &(struct nv50_mem_v0) {
-						.bankswz = mmu->kind[mem->kind] == 2,
+						.bankswz = mmu->impl->kind[mem->kind] == 2,
 						.contig = contig,
 					 }, sizeof(struct nv50_mem_v0),
 					 &mem->mem);
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index e727a6587658..d1d09e5a6909 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -24,7 +24,6 @@
 #include <nvif/printf.h>
 
 #include <nvif/class.h>
-#include <nvif/if0008.h>
 
 void
 nvif_mmu_dtor(struct nvif_mmu *mmu)
@@ -32,7 +31,6 @@ nvif_mmu_dtor(struct nvif_mmu *mmu)
 	if (!mmu->impl)
 		return;
 
-	kfree(mmu->kind);
 	mmu->impl->del(mmu->priv);
 	mmu->impl = NULL;
 }
@@ -44,7 +42,6 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 	int ret;
 
 	mmu->impl = NULL;
-	mmu->kind = NULL;
 
 	ret = device->impl->mmu.new(device->priv, &mmu->impl, &mmu->priv,
 				    nvif_handle(&mmu->object));
@@ -53,33 +50,5 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 		return ret;
 
 	nvif_object_ctor(&device->object, name ?: "nvifMmu", 0, oclass, &mmu->object);
-
-	mmu->kind_nr = mmu->impl->kind_nr;
-
-	mmu->kind = kmalloc_array(mmu->kind_nr, sizeof(*mmu->kind),
-				  GFP_KERNEL);
-	if (!mmu->kind && mmu->kind_nr)
-		goto done;
-
-	if (mmu->kind_nr) {
-		struct nvif_mmu_kind_v0 *kind;
-		size_t argc = struct_size(kind, data, mmu->kind_nr);
-
-		if (ret = -ENOMEM, !(kind = kmalloc(argc, GFP_KERNEL)))
-			goto done;
-		kind->version = 0;
-		kind->count = mmu->kind_nr;
-
-		ret = nvif_object_mthd(&mmu->object, NVIF_MMU_V0_KIND,
-				       kind, argc);
-		if (ret == 0)
-			memcpy(mmu->kind, kind->data, kind->count);
-		mmu->kind_inv = kind->kind_inv;
-		kfree(kind);
-	}
-
-done:
-	if (ret)
-		nvif_mmu_dtor(mmu);
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 8be5b1034bc1..05ec276facd9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -25,9 +25,6 @@
 
 #include <core/client.h>
 
-#include <nvif/if0008.h>
-#include <nvif/unpack.h>
-
 static int
 nvkm_ummu_sclass(struct nvkm_object *object, int index,
 		 struct nvkm_oclass *oclass)
@@ -53,33 +50,6 @@ nvkm_ummu_sclass(struct nvkm_object *object, int index,
 	return -EINVAL;
 }
 
-static int
-nvkm_ummu_kind(struct nvkm_ummu *ummu, void *argv, u32 argc)
-{
-	struct nvkm_mmu *mmu = ummu->mmu;
-	union {
-		struct nvif_mmu_kind_v0 v0;
-	} *args = argv;
-	const u8 *kind = NULL;
-	int ret = -ENOSYS, count = 0;
-	u8 kind_inv = 0;
-
-	if (mmu->func->kind)
-		kind = mmu->func->kind(mmu, &count, &kind_inv);
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true))) {
-		if (argc != args->v0.count * sizeof(*args->v0.data))
-			return -EINVAL;
-		if (args->v0.count > count)
-			return -EINVAL;
-		args->v0.kind_inv = kind_inv;
-		memcpy(args->v0.data, kind, args->v0.count);
-	} else
-		return ret;
-
-	return 0;
-}
-
 static void
 nvkm_ummu_del(struct nvif_mmu_priv *ummu)
 {
@@ -93,21 +63,8 @@ nvkm_ummu_impl = {
 	.del = nvkm_ummu_del,
 };
 
-static int
-nvkm_ummu_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvif_mmu_priv *ummu = container_of(object, typeof(*ummu), object);
-	switch (mthd) {
-	case NVIF_MMU_V0_KIND: return nvkm_ummu_kind(ummu, argv, argc);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
 static const struct nvkm_object_func
 nvkm_ummu = {
-	.mthd = nvkm_ummu_mthd,
 	.sclass = nvkm_ummu_sclass,
 };
 
@@ -118,7 +75,6 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	struct nvkm_mmu *mmu = device->mmu;
 	struct nvif_mmu_priv *ummu;
 	int kinds = 0;
-	u8 unused = 0;
 
 	if (!(ummu = kzalloc(sizeof(*ummu), GFP_KERNEL)))
 		return -ENOMEM;
@@ -127,13 +83,9 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	ummu->mmu = mmu;
 	ummu->impl = nvkm_ummu_impl;
 
-	if (mmu->func->kind)
-		mmu->func->kind(mmu, &kinds, &unused);
-
 	ummu->impl.dmabits = mmu->dma_bits;
 	ummu->impl.heap_nr = mmu->heap_nr;
 	ummu->impl.type_nr = mmu->type_nr;
-	ummu->impl.kind_nr = kinds;
 
 	for (int i = 0; i < mmu->heap_nr; i++)
 		ummu->impl.heap[i].size = mmu->heap[i].size;
@@ -152,6 +104,11 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 		ummu->impl.type[i].heap = mmu->type[i].heap;
 	}
 
+	if (mmu->func->kind) {
+		ummu->impl.kind = mmu->func->kind(mmu, &kinds, &ummu->impl.kind_inv);
+		ummu->impl.kind_nr = kinds;
+	}
+
 	ummu->impl.mem.oclass = mmu->func->mem.user.oclass;
 
 	ummu->impl.vmm.oclass = mmu->func->vmm.user.oclass;
-- 
2.41.0

