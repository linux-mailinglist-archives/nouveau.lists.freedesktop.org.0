Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDD38A78FF
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B49910E3E6;
	Tue, 16 Apr 2024 23:42:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b6OACRvu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898B710E3E6
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kb76+4TVKb6Ao4B7kKQKkq0lnGVPwMctNXpWi7gQ43TJpJ3T2basj2uN6x3pheAW6eJt1W93AAoZ+vHx8sbEBUPfjqQH6tWn7gut6JSO5W8RnFNSwrf7hC65cA4mxpIr+86/fn/xZy0Ui5eZH3x9XDP8AYWDDCkX912q3/9vcL4yW0+Mt9QP3Z/qrlwoRZYdO88ys75G48xKK9PtyVu+RJHgoBUWaDoSNGPtiwtcTgpxWRKrpRP/fjIIrqTR7+JIq/x6MvpEqtAT0/8pUvPkT0oyY0XVcbSpZkWD/4SQgBq8xOMNrm6IVAEoCbE5xDtChZdx5HyqcHldc56rtxbJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6EKw1KhF+UKdpI+Fppuv+ivBhpYztmMt8Rb2a6SVDE=;
 b=HTcXOsoekVMJBmuxAyJGQYcJpppQpyt2F8Q1kiTpAYPMkJypdFMjISTIFSw+EkIXup2Op1wVf6wJyB/7kPNmQybGI4t48/06/GY2OVRbECv1HIOEe4F8lVVMlCcE01tQmFjq99Uq9RXvhsBd46N1nBWllbuat5ha12gzjlXeNOxGiYnXckODvGPiG2lhuAsNVnsQI9FaaxylS0oqnMN4S4SUmO+OkuzEia5+kXdzwakGPf94mVOZ6DR5uVR+j9ELhZ/cVK7N4hYdEI8eaPHEmXFRpYDzkFzKs0O9UKDKubEnESqRECJkX3PePx04XAFtlLIp9cVbkpGLdZfWs0oN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6EKw1KhF+UKdpI+Fppuv+ivBhpYztmMt8Rb2a6SVDE=;
 b=b6OACRvu2Oyp+QcI5thC8u+6o5eAwkHWJ6v3m9qnr+UI6cwpEB1/kdoj3rdJ53EOe4q664WZywLUo9flf324Vb2bDbcBQ2hE3Kc2SYE0Lyga/LBbUj6/wuEX7F9AB4gOLRfBaW8/OOnJytOIRWa8k+lXljGZ+ozCUCg7sCC0HSeKuJiyJ5ZJNl51fD38gT8Hknnx4Ep1Nozc1Zt7tKtbmg3TTPvtL+t6UutSZsLGcPNOPKJb2o9qui8pCp1JXJ3+D8hKHa7TXpDGHgb599VbcLTVguZL56BnX5yw+tEnjXTyOGyBh9+FJ0zCbaDwcZ4CZBDdacknA2ZieUk0cQ79zA==
Received: from DM6PR12CA0033.namprd12.prod.outlook.com (2603:10b6:5:1c0::46)
 by CY8PR12MB7433.namprd12.prod.outlook.com (2603:10b6:930:53::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 16 Apr
 2024 23:42:23 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::e8) by DM6PR12CA0033.outlook.office365.com
 (2603:10b6:5:1c0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:23 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:05 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:04 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 083/156] drm/nouveau/nvif: rework mmu "new mem" api
Date: Wed, 17 Apr 2024 09:38:49 +1000
Message-ID: <20240416234002.19509-84-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|CY8PR12MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: a415eea1-c873-405b-da8d-08dc5e6edda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IHDG0dzImB1NyZDIa0j7XxAKo8r4s3zOiM17xftPwQpESDZBrK/5BkGwA2LCPcf6aquyiNH3/FLK9T30236vHobifESSlH5kkzr0ab3WmnKEVZa6l9RaE16T88taWxlIS3jxCSLaqSY1HhZ7Ednw/c8EmJns/01pwKYgOEwdPNxrKQmb5QRAbapQfiLs78HNuKB5ijtM4PgUVY4LUH5VU2dyoQmREKcURlgxWI0EwrzbUkX+AIEOUiF7Q+NLKak3hwTLteVCmefrJ9a4aO42+UaOUpnR9Xx7uH1ZFPf1AqjyWgVl7/WaTCxeDqJnHQEIhht3ExRgZ4KQ3+RiMTIxL7cAbhi5dLzirwOs0CW/LkTtWQNQSnsAbaxvro/32mEjU9WV8HfTOHxjwD6SA1YL5clbxIQ5EiKoTKn3FREqnCJkdD04uK19izsExbxE4G3ClUq1kguoeDdfkFK67ZwWKmJZrdPyUlusWTdxrNCSrr+s1vd7tlTIYarmF0JrFxuk0qFRhw1VI0LTzhpP+p/lY2p5DyVSXksc21Vy3Ap4cB+yzLv7NdTO5+BDrRDafU9GUB86U0/8XqB2DrVmuwTB17bP+2wTX5Q6Ap4rnnVq3Tit2PeSXyAtUoR9iff7e2kdfm6fV7qQe6oTp5VIJkNkPCyXzcIUZUbbPUMMDq53qTAyyG+lxIgmb4Vwsan00Awyeg92hxQgFoWBco52XVwSmeO49L55v5HMmxrjCuBPDb8JjNNW3f4adoUK6rhJFOIi
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:23.6540 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a415eea1-c873-405b-da8d-08dc5e6edda7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7433
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
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/lut.c        |  2 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 11 +++++
 drivers/gpu/drm/nouveau/include/nvif/mem.h    |  8 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         | 10 ++--
 drivers/gpu/drm/nouveau/nvif/mem.c            | 43 +++++++----------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    | 47 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.h    |  5 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 23 +++++----
 11 files changed, 92 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 0864d36a06f2..694c25a19e25 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -513,9 +513,9 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 			       (&(struct nv_dma_v0) {
 					.target = NV_DMA_V0_TARGET_VRAM,
 					.access = NV_DMA_V0_ACCESS_RDWR,
-					.start = ctx->mem.addr,
-					.limit =  ctx->mem.addr
-						+ ctx->mem.size - 1,
+					.start = ctx->mem.impl->addr,
+					.limit =  ctx->mem.impl->addr
+						+ ctx->mem.impl->size - 1,
 			       }), sizeof(struct nv_dma_v0),
 			       &ctx->ntfy);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/lut.c b/drivers/gpu/drm/nouveau/dispnv50/lut.c
index 6b2ad1e6eab9..7d68a7efc1d5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/lut.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/lut.c
@@ -34,7 +34,7 @@ nv50_lut_load(struct nv50_lut *lut, int buffer, struct drm_property_blob *blob,
 {
 	struct drm_color_lut *in = blob ? blob->data : NULL;
 	void __iomem *mem = lut->mem[buffer].object.map.ptr;
-	const u32 addr = lut->mem[buffer].addr;
+	const u32 addr = lut->mem[buffer].impl->addr;
 	int i;
 
 	if (!in) {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index f387ec622a45..de380979e1a4 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -6,6 +6,7 @@ struct nvif_device_priv;
 struct nvif_control_priv;
 struct nvif_usermode_priv;
 struct nvif_mmu_priv;
+struct nvif_mem_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -76,6 +77,14 @@ struct nvif_usermode_impl {
 	struct nvif_mapinfo map;
 };
 
+struct nvif_mem_impl {
+	void (*del)(struct nvif_mem_priv *);
+
+	u8 page;
+	u64 addr;
+	u64 size;
+};
+
 struct nvif_mmu_impl {
 	void (*del)(struct nvif_mmu_priv *);
 
@@ -107,6 +116,8 @@ struct nvif_mmu_impl {
 
 	struct {
 		s32 oclass;
+		int (*new)(struct nvif_mmu_priv *, u8 type, u8 page, u64 size, void *argv, u32 argc,
+			   const struct nvif_mem_impl **, struct nvif_mem_priv **, u64 handle);
 	} mem;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mem.h b/drivers/gpu/drm/nouveau/include/nvif/mem.h
index 217d13126f13..8d432d238b95 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mem.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mem.h
@@ -3,11 +3,11 @@
 #include "mmu.h"
 
 struct nvif_mem {
+	const struct nvif_mem_impl *impl;
+	struct nvif_mem_priv *priv;
 	struct nvif_object object;
-	u8  type;
-	u8  page;
-	u64 addr;
-	u64 size;
+
+	u8 type;
 };
 
 int nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0d946e31bccd..6c90f853513d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -835,13 +835,13 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
 	struct nvif_vmm *vmm = &drm->client.vmm.vmm;
 	int ret;
 
-	ret = nvif_vmm_get(vmm, LAZY, false, old_mem->mem.page, 0,
-			   old_mem->mem.size, &old_mem->vma[0]);
+	ret = nvif_vmm_get(vmm, LAZY, false, old_mem->mem.impl->page, 0,
+			   old_mem->mem.impl->size, &old_mem->vma[0]);
 	if (ret)
 		return ret;
 
-	ret = nvif_vmm_get(vmm, LAZY, false, new_mem->mem.page, 0,
-			   new_mem->mem.size, &old_mem->vma[1]);
+	ret = nvif_vmm_get(vmm, LAZY, false, new_mem->mem.impl->page, 0,
+			   new_mem->mem.impl->size, &old_mem->vma[1]);
 	if (ret)
 		goto done;
 
@@ -1001,7 +1001,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
 	nouveau_bo_del_io_reserve_lru(bo);
 
 	if (mem && new_reg->mem_type != TTM_PL_SYSTEM &&
-	    mem->mem.page == nvbo->page) {
+	    mem->mem.impl->page == nvbo->page) {
 		list_for_each_entry(vma, &nvbo->vma_list, head) {
 			nouveau_vma_map(vma, mem);
 		}
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 872d689db7ba..ff67f00c93c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -72,7 +72,7 @@ nouveau_mem_map(struct nouveau_mem *mem,
 		return -ENOSYS;
 	}
 
-	return nvif_vmm_map(vmm, vma->addr, mem->mem.size, &args, argc, &mem->mem, 0);
+	return nvif_vmm_map(vmm, vma->addr, mem->mem.impl->size, &args, argc, &mem->mem, 0);
 }
 
 void
@@ -156,7 +156,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	}
 	mutex_unlock(&drm->client_mutex);
 
-	reg->start = mem->mem.addr >> PAGE_SHIFT;
+	reg->start = mem->mem.impl->addr >> PAGE_SHIFT;
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.c b/drivers/gpu/drm/nouveau/nouveau_vmm.c
index 93807d21ceff..26a41769551a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.c
@@ -97,17 +97,17 @@ nouveau_vma_new(struct nouveau_bo *nvbo, struct nouveau_vmm *vmm,
 	list_add_tail(&vma->head, &nvbo->vma_list);
 
 	if (nvbo->bo.resource->mem_type != TTM_PL_SYSTEM &&
-	    mem->mem.page == nvbo->page) {
-		ret = nvif_vmm_get(&vmm->vmm, LAZY, false, mem->mem.page, 0,
-				   mem->mem.size, &tmp);
+	    mem->mem.impl->page == nvbo->page) {
+		ret = nvif_vmm_get(&vmm->vmm, LAZY, false, mem->mem.impl->page, 0,
+				   mem->mem.impl->size, &tmp);
 		if (ret)
 			goto done;
 
 		vma->addr = tmp.addr;
 		ret = nouveau_vma_map(vma, mem);
 	} else {
-		ret = nvif_vmm_get(&vmm->vmm, PTES, false, mem->mem.page, 0,
-				   mem->mem.size, &tmp);
+		ret = nvif_vmm_get(&vmm->vmm, PTES, false, mem->mem.impl->page, 0,
+				   mem->mem.impl->size, &tmp);
 		if (ret)
 			goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvif/mem.c b/drivers/gpu/drm/nouveau/nvif/mem.c
index 600fe051be11..73e66cbfbe43 100644
--- a/drivers/gpu/drm/nouveau/nvif/mem.c
+++ b/drivers/gpu/drm/nouveau/nvif/mem.c
@@ -21,6 +21,8 @@
  */
 #include <nvif/mem.h>
 #include <nvif/client.h>
+#include <nvif/driverif.h>
+#include <nvif/printf.h>
 
 #include <nvif/if000a.h>
 
@@ -41,7 +43,11 @@ nvif_mem_ctor_map(struct nvif_mmu *mmu, const char *name, u8 type, u64 size,
 void
 nvif_mem_dtor(struct nvif_mem *mem)
 {
-	nvif_object_dtor(&mem->object);
+	if (!mem->impl)
+		return;
+
+	mem->impl->del(mem->priv);
+	mem->impl = NULL;
 }
 
 int
@@ -49,38 +55,21 @@ nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
 		   int type, u8 page, u64 size, void *argv, u32 argc,
 		   struct nvif_mem *mem)
 {
-	struct nvif_mem_v0 *args;
-	u8 stack[128];
+	const u32 oclass = mmu->impl->mem.oclass;
 	int ret;
 
-	mem->object.client = NULL;
 	if (type < 0)
 		return -EINVAL;
 
-	if (sizeof(*args) + argc > sizeof(stack)) {
-		if (!(args = kmalloc(sizeof(*args) + argc, GFP_KERNEL)))
-			return -ENOMEM;
-	} else {
-		args = (void *)stack;
-	}
-	args->version = 0;
-	args->type = type;
-	args->page = page;
-	args->size = size;
-	memcpy(args->data, argv, argc);
+	ret = mmu->impl->mem.new(mmu->priv, type, page, size, argv, argc, &mem->impl, &mem->priv,
+				 nvif_handle(&mem->object));
+	NVIF_DEBUG(&mmu->object, "[NEW mem%08x] (ret:%d)", oclass, ret);
+	if (ret)
+		return ret;
 
-	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifMem", 0, mmu->impl->mem.oclass,
-			       args, sizeof(*args) + argc, &mem->object);
-	if (ret == 0) {
-		mem->type = mmu->impl->type[type].type;
-		mem->page = args->page;
-		mem->addr = args->addr;
-		mem->size = args->size;
-	}
-
-	if (args != (void *)stack)
-		kfree(args);
-	return ret;
+	nvif_object_ctor(&mmu->object, name ?: "nvifMem", 0, mmu->impl->mem.oclass, &mem->object);
+	mem->type = mmu->impl->type[type].type;
+	return 0;
 
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index 45f589eb5d78..f1ec0ed8e7c3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -44,6 +44,8 @@ struct nvif_mem_priv {
 		struct nvkm_vma *bar;
 		void *map;
 	};
+
+	struct nvif_mem_impl impl;
 };
 
 static const struct nvkm_object_func nvkm_umem;
@@ -136,6 +138,19 @@ nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
 	return 0;
 }
 
+static void
+nvkm_umem_del(struct nvif_mem_priv *umem)
+{
+	struct nvkm_object *object = &umem->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_mem_impl
+nvkm_umem_impl = {
+	.del = nvkm_umem_del,
+};
+
 static void *
 nvkm_umem_dtor(struct nvkm_object *object)
 {
@@ -156,35 +171,22 @@ nvkm_umem = {
 };
 
 int
-nvkm_umem_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
+nvkm_umem_new(struct nvkm_mmu *mmu, u8 type, u8 page, u64 size, void *argv, u32 argc,
+	      const struct nvif_mem_impl **pimpl, struct nvif_mem_priv **ppriv,
 	      struct nvkm_object **pobject)
 {
-	struct nvkm_mmu *mmu = container_of(oclass->parent, struct nvif_mmu_priv, object)->mmu;
-	union {
-		struct nvif_mem_v0 v0;
-	} *args = argv;
 	struct nvif_mem_priv *umem;
-	int type, ret = -ENOSYS;
-	u8  page;
-	u64 size;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true))) {
-		type = args->v0.type;
-		page = args->v0.page;
-		size = args->v0.size;
-	} else
-		return ret;
+	int ret;
 
 	if (type >= mmu->type_nr)
 		return -EINVAL;
 
 	if (!(umem = kzalloc(sizeof(*umem), GFP_KERNEL)))
 		return -ENOMEM;
-	nvkm_object_ctor(&nvkm_umem, oclass, &umem->object);
+	nvkm_object_ctor(&nvkm_umem, &(struct nvkm_oclass) {}, &umem->object);
 	umem->mmu = mmu;
 	umem->type = mmu->type[type].type;
 	INIT_LIST_HEAD(&umem->head);
-	*pobject = &umem->object;
 
 	if (mmu->type[type].type & NVKM_MEM_MAPPABLE) {
 		page = max_t(u8, page, PAGE_SHIFT);
@@ -200,8 +202,13 @@ nvkm_umem_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	list_add(&umem->head, &mmu->umem);
 	spin_unlock(&mmu->umem_lock);
 
-	args->v0.page = nvkm_memory_page(umem->memory);
-	args->v0.addr = nvkm_memory_addr(umem->memory);
-	args->v0.size = nvkm_memory_size(umem->memory);
+	umem->impl = nvkm_umem_impl;
+	umem->impl.page = nvkm_memory_page(umem->memory);
+	umem->impl.addr = nvkm_memory_addr(umem->memory);
+	umem->impl.size = nvkm_memory_size(umem->memory);
+
+	*pimpl = &umem->impl;
+	*ppriv = umem;
+	*pobject = &umem->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
index d2012ab625d3..df7017eb98f4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
@@ -1,7 +1,8 @@
 #ifndef __NVKM_UMEM_H__
 #define __NVKM_UMEM_H__
 #include "mem.h"
+#include <nvif/driverif.h>
 
-int nvkm_umem_new(const struct nvkm_oclass *, void *argv, u32 argc,
-		  struct nvkm_object **);
+int nvkm_umem_new(struct nvkm_mmu *, u8 type, u8 page, u64 size, void *, u32,
+		  const struct nvif_mem_impl **, struct nvif_mem_priv **, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 05ec276facd9..8458583af0a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -31,14 +31,6 @@ nvkm_ummu_sclass(struct nvkm_object *object, int index,
 {
 	struct nvkm_mmu *mmu = container_of(object, struct nvif_mmu_priv, object)->mmu;
 
-	if (mmu->func->mem.user.oclass) {
-		if (index-- == 0) {
-			oclass->base = mmu->func->mem.user;
-			oclass->ctor = nvkm_umem_new;
-			return 0;
-		}
-	}
-
 	if (mmu->func->vmm.user.oclass) {
 		if (index-- == 0) {
 			oclass->base = mmu->func->vmm.user;
@@ -50,6 +42,20 @@ nvkm_ummu_sclass(struct nvkm_object *object, int index,
 	return -EINVAL;
 }
 
+static int
+nvkm_ummu_mem_new(struct nvif_mmu_priv *ummu, u8 type, u8 page, u64 size, void *argv, u32 argc,
+		  const struct nvif_mem_impl **pimpl, struct nvif_mem_priv **ppriv, u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_umem_new(ummu->mmu, type, page, size, argv, argc, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(ummu->object.client, &ummu->object, handle, object);
+}
+
 static void
 nvkm_ummu_del(struct nvif_mmu_priv *ummu)
 {
@@ -110,6 +116,7 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	}
 
 	ummu->impl.mem.oclass = mmu->func->mem.user.oclass;
+	ummu->impl.mem.new = nvkm_ummu_mem_new;
 
 	ummu->impl.vmm.oclass = mmu->func->vmm.user.oclass;
 
-- 
2.41.0

