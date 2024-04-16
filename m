Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E935A8A7904
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ABC2112F7C;
	Tue, 16 Apr 2024 23:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="msTrU5hG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5EB112F4D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXHLH6UvN91xUgHOgXLh3hmVz2xGT4tLrn8Zc/x1B8yvURw5gTZpkLAauxigg8/ux12qTOxFj3WT2XRssPtIpC0wyw71YZ14g8+ynTSgqUO70boqhPHUFQI/frkyqfd/ycxocwSoZQRX5VF5Nvb8sHyvY/gthu1Le4/PbvAMh18IrRkVFwc7uC621XwKBNd9rhrYaAjFvK2aJnGeza9XIrT/wh4479g+fwnyJ2FMiB5qSmy5rTM8Dfp8QT40rUyg7+hb1ylFAJofxxFsjiNvAgudfJy9GBh3DCSLc3DK5mymWkDxSmYfaPiAmCViplNmKSqsrWCdZd5wdrict452aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLr/A2OaH+ZOUIK5t7bnZQL4zZvtKV59AYkq4H3t4r0=;
 b=e9cnpW1DLPFs/9FO+43Ng47+iecxgIq02z834xC0oqWI1PErVB25FHI5lPe193OEJ635bhBQhmXgjzDQIWT358uDVmX7qZzV7vAjAKwZU+m3ry4/JKYOMsg4MTStGbwxyJnmyzk35FxT0ivbwGVv5H/85fe7OYfuZCgn1FnpbqUwpBWKR5gRwde9s1dav1m2KurM94fb3RjpqZIkLpyqKgHoDzNTYr7HIh5MZxKNRJoGb8avgjZwmxPGm4gsvyzIKzqqWS1OOKWpu2JlAEu33KONH5h0qVcVemDHhCjYWF9DV8tS2ObjfC+bxxGzHBQ/54G4uegu/ctgPgVpJ7CCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLr/A2OaH+ZOUIK5t7bnZQL4zZvtKV59AYkq4H3t4r0=;
 b=msTrU5hGx67RrgaFLEdmyyhf2yPlvEsNU9GSewiDjaZgvdUuWcmaXd3WCDjd7BWuGa5p4PMw8c26oYMHnbA7lCDmBvJSSQF9RVy969tBxuF8Gmjw/KpyDqDHqB4I8ffbbyIo898DgofcaoCwo1nqdiTBhck3Fj/YCocU8BB0oAevDYUeI0+Bn5O9dT3Izh8WI67bT0j3D6T+oHSnTnAYgJhNaKdCgkg1VdTvCx2e9Ig0ZHxv9kdglt4VvlChMQDUE+z1yTLufl8iJI46kttCHpUsZnG2r/6t6MgiRuIiPXDcBuQhQ60ph7YCLMUuPdqk7LyrRL3/zS55N8/M7R9LYw==
Received: from DM6PR12CA0010.namprd12.prod.outlook.com (2603:10b6:5:1c0::23)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:30 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::3) by DM6PR12CA0010.outlook.office365.com
 (2603:10b6:5:1c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:30 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:11 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 088/156] drm/nouveau/nvif: rework vmm "get"/"put" apis
Date: Wed, 17 Apr 2024 09:38:54 +1000
Message-ID: <20240416234002.19509-89-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8d94db-5556-41b3-2459-08dc5e6ee1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aUG1uu42I3QZwT7YM96RtBQ0LUOK3m+0HribzxAZtidnbAlEpv610HTCXFVW7yO8WzOpfA42vqy2tpg6tsP4g9xoniIA6T74f3lylCy4NJR+6FUh646tbhiYt6Bju1sKliK2uYyI+T99wcqn/q01j6yN/B38QE9Rxa83/oWSNNL1qBkhSpaOCJjZP6a3mIh6zbkbCv09FbsHr/zWNXsJzgzntOagf8hZzUe1vbv+BZQGc1i8CmGGVZB6wlX9HKQLf+DHLZDBLwQRqIjAzfi4/8WudoNJHT8EwdCCakjB3ojGEl1iJIL5OdoWjBDXHwpXJTEvZTmiuRapjvVetrJUanALdEsPQ6tfkNFCOjzdcKZSZzIbLlvo3pPwkAup2qINUI2mxjXLCxAl+42XpE41neIxyXHNiH0jD2jf/4ikNRFcZyQBI+6Zgzp6m9G0rrFFaYW/0T+BmuOHOGhFZkEFOr7K8lzzqqKw7GVm87OWlKGakpC5vHJzLdws8Kc4aiOXJUs1um31yEf5UkfTlYULCf0Pw6Wyy5/8A32Ry9rTRgXl4nX21Qbz6ku2WjVUCwkFG4b6dG3hg/rk5NGLH37XSbY33t1BXIFgAZG0Q+Tbch/7SIinSGLHLmRqdvcTQ7tSflk/jclgGjIdd6Zmh8hp2+iReCT7K32BNAwK+uvlpz6Ezob32rdsDBuLE3k2PzrqeqfnwFDP4V7jUM70syqfw41JxhN4BckdLgNzuOtfJAkcE3SOeoby5SL3Q7LZbHWF
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:30.4353 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d94db-5556-41b3-2459-08dc5e6ee1bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 10 ++++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 22 ---------
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    | 10 +---
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  4 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |  4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 38 ++++-----------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 46 +++++--------------
 8 files changed, 39 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 7540fe4d02c0..673969d46b66 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -95,6 +95,12 @@ enum nvif_vmm_type {
 	NVIF_VMM_TYPE_RAW,
 };
 
+enum nvif_vmm_get_type {
+	NVIF_VMM_GET_ADDR,
+	NVIF_VMM_GET_PTES,
+	NVIF_VMM_GET_LAZY,
+};
+
 struct nvif_vmm_impl {
 	void (*del)(struct nvif_vmm_priv *);
 
@@ -109,6 +115,10 @@ struct nvif_vmm_impl {
 		bool host;
 		bool comp;
 	} page[8];
+
+	int (*get)(struct nvif_vmm_priv *, enum nvif_vmm_get_type, bool sparse, u8 page,
+		   u8 align, u64 size, u64 *addr);
+	int (*put)(struct nvif_vmm_priv *, u64 addr);
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index f554062469c3..50a834d5eb19 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -1,8 +1,6 @@
 #ifndef __NVIF_IF000C_H__
 #define __NVIF_IF000C_H__
 
-#define NVIF_VMM_V0_GET                                                    0x01
-#define NVIF_VMM_V0_PUT                                                    0x02
 #define NVIF_VMM_V0_MAP                                                    0x03
 #define NVIF_VMM_V0_UNMAP                                                  0x04
 #define NVIF_VMM_V0_PFNMAP                                                 0x05
@@ -10,26 +8,6 @@
 #define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
-struct nvif_vmm_get_v0 {
-	__u8  version;
-#define NVIF_VMM_GET_V0_ADDR                                               0x00
-#define NVIF_VMM_GET_V0_PTES                                               0x01
-#define NVIF_VMM_GET_V0_LAZY	                                           0x02
-	__u8  type;
-	__u8  sparse;
-	__u8  page;
-	__u8  align;
-	__u8  pad05[3];
-	__u64 size;
-	__u64 addr;
-};
-
-struct nvif_vmm_put_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u64 addr;
-};
-
 struct nvif_vmm_map_v0 {
 	__u8  version;
 	__u8  pad01[7];
diff --git a/drivers/gpu/drm/nouveau/include/nvif/vmm.h b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
index 3019ddc98782..375d19345482 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/vmm.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
@@ -1,16 +1,10 @@
 #ifndef __NVIF_VMM_H__
 #define __NVIF_VMM_H__
 #include <nvif/object.h>
-#include <nvif/driverif.h> /* NVIF_VMM_TYPE */
+#include <nvif/driverif.h> /* NVIF_VMM_TYPE_*, NVIF_VMM_GET_* */
 struct nvif_mem;
 struct nvif_mmu;
 
-enum nvif_vmm_get {
-	ADDR,
-	PTES,
-	LAZY
-};
-
 struct nvif_vma {
 	u64 addr;
 	u64 size;
@@ -26,7 +20,7 @@ int nvif_vmm_ctor(struct nvif_mmu *, const char *name,
 		  enum nvif_vmm_type, u64 addr, u64 size, void *argv, u32 argc,
 		  struct nvif_vmm *);
 void nvif_vmm_dtor(struct nvif_vmm *);
-int nvif_vmm_get(struct nvif_vmm *, enum nvif_vmm_get, bool sparse,
+int nvif_vmm_get(struct nvif_vmm *, enum nvif_vmm_get_type, bool sparse,
 		 u8 page, u8 align, u64 size, struct nvif_vma *);
 void nvif_vmm_put(struct nvif_vmm *, struct nvif_vma *);
 int nvif_vmm_map(struct nvif_vmm *, u64 addr, u64 size, void *argv, u32 argc,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index ed81872e2dba..7db05d6699d8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -835,12 +835,12 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
 	struct nvif_vmm *vmm = &drm->client.vmm.vmm;
 	int ret;
 
-	ret = nvif_vmm_get(vmm, LAZY, false, old_mem->mem.impl->page, 0,
+	ret = nvif_vmm_get(vmm, NVIF_VMM_GET_LAZY, false, old_mem->mem.impl->page, 0,
 			   old_mem->mem.impl->size, &old_mem->vma[0]);
 	if (ret)
 		return ret;
 
-	ret = nvif_vmm_get(vmm, LAZY, false, new_mem->mem.impl->page, 0,
+	ret = nvif_vmm_get(vmm, NVIF_VMM_GET_LAZY, false, new_mem->mem.impl->page, 0,
 			   new_mem->mem.impl->size, &old_mem->vma[1]);
 	if (ret)
 		goto done;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 2d6f1c97db1c..fc1d6fd94480 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -138,7 +138,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 
 	mem = nouveau_mem(*res);
 	ttm_resource_init(bo, place, *res);
-	ret = nvif_vmm_get(&drm->cli.vmm.vmm, PTES, false, 12, 0,
+	ret = nvif_vmm_get(&drm->cli.vmm.vmm, NVIF_VMM_GET_PTES, false, 12, 0,
 			   (long)(*res)->size, &mem->vma[0]);
 	if (ret) {
 		nouveau_mem_del(man, *res);
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.c b/drivers/gpu/drm/nouveau/nouveau_vmm.c
index 353c1a3f9714..94dd0bf547dc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.c
@@ -98,7 +98,7 @@ nouveau_vma_new(struct nouveau_bo *nvbo, struct nouveau_vmm *vmm,
 
 	if (nvbo->bo.resource->mem_type != TTM_PL_SYSTEM &&
 	    mem->mem.impl->page == nvbo->page) {
-		ret = nvif_vmm_get(&vmm->vmm, LAZY, false, mem->mem.impl->page, 0,
+		ret = nvif_vmm_get(&vmm->vmm, NVIF_VMM_GET_LAZY, false, mem->mem.impl->page, 0,
 				   mem->mem.impl->size, &tmp);
 		if (ret)
 			goto done;
@@ -106,7 +106,7 @@ nouveau_vma_new(struct nouveau_bo *nvbo, struct nouveau_vmm *vmm,
 		vma->addr = tmp.addr;
 		ret = nouveau_vma_map(vma, mem);
 	} else {
-		ret = nvif_vmm_get(&vmm->vmm, PTES, false, mem->mem.impl->page, 0,
+		ret = nvif_vmm_get(&vmm->vmm, NVIF_VMM_GET_PTES, false, mem->mem.impl->page, 0,
 				   mem->mem.impl->size, &tmp);
 		if (ret)
 			goto done;
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 73c63bfd1e38..cf00e7af6063 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -66,44 +66,26 @@ nvif_vmm_map(struct nvif_vmm *vmm, u64 addr, u64 size, void *argv, u32 argc,
 void
 nvif_vmm_put(struct nvif_vmm *vmm, struct nvif_vma *vma)
 {
-	if (vma->size) {
-		WARN_ON(nvif_object_mthd(&vmm->object, NVIF_VMM_V0_PUT,
-					 &(struct nvif_vmm_put_v0) {
-						.addr = vma->addr,
-					 }, sizeof(struct nvif_vmm_put_v0)));
+	if (vmm && vma->size) {
+		WARN_ON(vmm->impl->put(vmm->priv, vma->addr));
 		vma->size = 0;
 	}
 }
 
 int
-nvif_vmm_get(struct nvif_vmm *vmm, enum nvif_vmm_get type, bool sparse,
+nvif_vmm_get(struct nvif_vmm *vmm, enum nvif_vmm_get_type type, bool sparse,
 	     u8 page, u8 align, u64 size, struct nvif_vma *vma)
 {
-	struct nvif_vmm_get_v0 args;
 	int ret;
 
-	args.version = vma->size = 0;
-	args.sparse = sparse;
-	args.page = page;
-	args.align = align;
-	args.size = size;
-
-	switch (type) {
-	case ADDR: args.type = NVIF_VMM_GET_V0_ADDR; break;
-	case PTES: args.type = NVIF_VMM_GET_V0_PTES; break;
-	case LAZY: args.type = NVIF_VMM_GET_V0_LAZY; break;
-	default:
-		WARN_ON(1);
-		return -EINVAL;
-	}
+	vma->size = 0;
 
-	ret = nvif_object_mthd(&vmm->object, NVIF_VMM_V0_GET,
-			       &args, sizeof(args));
-	if (ret == 0) {
-		vma->addr = args.addr;
-		vma->size = args.size;
-	}
-	return ret;
+	ret = vmm->impl->get(vmm->priv, type, sparse, page, align, size, &vma->addr);
+	if (ret)
+		return ret;
+
+	vma->size = size;
+	return 0;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 15aa6a37060b..066e068589eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -238,23 +238,14 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 }
 
 static int
-nvkm_uvmm_mthd_put(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+nvkm_uvmm_put(struct nvif_vmm_priv *uvmm, u64 addr)
 {
-	union {
-		struct nvif_vmm_put_v0 v0;
-	} *args = argv;
 	struct nvkm_vmm *vmm = uvmm->vmm;
 	struct nvkm_vma *vma;
-	int ret = -ENOSYS;
-	u64 addr;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		addr = args->v0.addr;
-	} else
-		return ret;
+	int ret;
 
 	mutex_lock(&vmm->mutex.vmm);
-	vma = nvkm_vmm_node_search(vmm, args->v0.addr);
+	vma = nvkm_vmm_node_search(vmm, addr);
 	if (ret = -ENOENT, !vma || vma->addr != addr || vma->part) {
 		VMM_DEBUG(vmm, "lookup %016llx: %016llx %d", addr,
 			  vma ? vma->addr : ~0ULL, vma ? vma->part : 0);
@@ -274,27 +265,14 @@ nvkm_uvmm_mthd_put(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 }
 
 static int
-nvkm_uvmm_mthd_get(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+nvkm_uvmm_get(struct nvif_vmm_priv *uvmm, enum nvif_vmm_get_type type, bool sparse,
+	      u8 page, u8 align, u64 size, u64 *addr)
 {
-	union {
-		struct nvif_vmm_get_v0 v0;
-	} *args = argv;
 	struct nvkm_vmm *vmm = uvmm->vmm;
 	struct nvkm_vma *vma;
-	int ret = -ENOSYS;
-	bool getref, mapref, sparse;
-	u8 page, align;
-	u64 size;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		getref = args->v0.type == NVIF_VMM_GET_V0_PTES;
-		mapref = args->v0.type == NVIF_VMM_GET_V0_ADDR;
-		sparse = args->v0.sparse;
-		page = args->v0.page;
-		align = args->v0.align;
-		size = args->v0.size;
-	} else
-		return ret;
+	bool getref = type == NVIF_VMM_GET_PTES;
+	bool mapref = type == NVIF_VMM_GET_ADDR;
+	int ret;
 
 	mutex_lock(&vmm->mutex.vmm);
 	ret = nvkm_vmm_get_locked(vmm, getref, mapref, sparse,
@@ -303,8 +281,8 @@ nvkm_uvmm_mthd_get(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	if (ret)
 		return ret;
 
-	args->v0.addr = vma->addr;
-	return ret;
+	*addr = vma->addr;
+	return 0;
 }
 
 static inline int
@@ -474,8 +452,6 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
 	switch (mthd) {
-	case NVIF_VMM_V0_GET   : return nvkm_uvmm_mthd_get   (uvmm, argv, argc);
-	case NVIF_VMM_V0_PUT   : return nvkm_uvmm_mthd_put   (uvmm, argv, argc);
 	case NVIF_VMM_V0_MAP   : return nvkm_uvmm_mthd_map   (uvmm, argv, argc);
 	case NVIF_VMM_V0_UNMAP : return nvkm_uvmm_mthd_unmap (uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNMAP: return nvkm_uvmm_mthd_pfnmap(uvmm, argv, argc);
@@ -505,6 +481,8 @@ nvkm_uvmm_del(struct nvif_vmm_priv *uvmm)
 static const struct nvif_vmm_impl
 nvkm_uvmm_impl = {
 	.del = nvkm_uvmm_del,
+	.get = nvkm_uvmm_get,
+	.put = nvkm_uvmm_put,
 };
 
 static void *
-- 
2.41.0

