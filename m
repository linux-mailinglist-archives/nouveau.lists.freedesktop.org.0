Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FFD8A7906
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387CA112F80;
	Tue, 16 Apr 2024 23:42:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sNggSHt6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371F6112F80
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAydv1YtG+VApWqFDrxpHT36VAHPSeKcjrRax2L7PJevzdEHsgpR0PLtIERdMWjuwinpQ/G2VDBLD5kmLAph3ys/gJMEjV/MZ5sSTrfI53rl/P9X9tieWFkIQvSH3tNSafpMFiWRrbg4xBLNzYpzre1rtFf3KsnmcgX3uOH6aPZOD90w3yICBPhMuca6hxr+/+nX3xivQHZ8pvAIm6Xi/Y5ufsyu2thfPs8DmgMUM31zCfOcY/4jFOqIy8PemYKhYAmIYmistDbrkQi6x2N+XupND9Oq3/JD1dS2SZlkzA8ZLpxrVIKuoPnO+bI9fMZEaYfNuM8jvGRZtEv6i1tmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvzBwUCwui63MSwwPxQ6Hz3gNYjvrm8iL6Jxwo3v/aQ=;
 b=MSE7vZp73RLX2d4de7OIU+Sn3hQo3fl0Dkd/IUQZPSCeUXOH4IUiLbMa64/cJTFdQ7WlI68Wd9zRAfcJNCA8GIQn8iMOapos+Ph1DeQzjGoFpfR27R0qPVcm6ESFkBkTIUlJ9djcAugbdRCuOdE07d5B4es1FRaAhFmUUcDmKAzT/H/0jjCcc/cmcyvYEPBg2EkSv2TjxRjx8elE9wQYPrp72cQln8A4bMW9D1MtXatykU3QawxBjYOIZap+i2Q9/YQggy77azKySw4jF1F9D7D4GpACUs4kHZAKkK0CPk2s5NgiPOXFP4aqQkrsm6Uvafzcbn3jYradNm+yl7vDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvzBwUCwui63MSwwPxQ6Hz3gNYjvrm8iL6Jxwo3v/aQ=;
 b=sNggSHt6p6WfktOjTsRfqAlH7PTAcGWiTXd+/24vY0ZkZesYoi6a4l7fuiMavXEzKZOSl1PYei67TWAdy/OMGVm4veENEP+WLL01bRbGPimDXaXDReAfgmmx7K8/e16G6/dFA+ubQUB3G0Ne2+UtVGJgite4+t6NBUgxzbgsxnP0zqhLsjkpKIzcbAJT+pfrGJT4BNcCScD9wQCc8jFXEebochwFVqHgGXTUTwsfXDJuFOxG6CeSknAlruL9oNfbFFFnM9Srt4AD26vlwVA6cDMxp2oARvVWywlhnTZzHznHx5rH6HtBqbN5ihfmc9J9CUbr90J4thR35v45qtxkqg==
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:31 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::63) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:12 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 089/156] drm/nouveau/nvif: rework vmm "map"/"unmap" apis
Date: Wed, 17 Apr 2024 09:38:55 +1000
Message-ID: <20240416234002.19509-90-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a1c961-d2c2-47b3-bf39-08dc5e6ee218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z5IyuYn+ghMXkT0Dc+g3dSVd6iNJdLLirQtlkgz9eXL0jlfzEODUKqyMntuUkdTG3KEHmq9h3VuUDkbi7P+yKfPwdknbwUqYyZg93IKLHUzcNWIGqCspRKCntip5ZsIYvJv3yzGmYujR3SQLxUsyWw84AbvsmLpDkkSeKjDiRRGqaOjg/v2KO959Lzo26wEZYu5xszgny8sX1P0Fo6DrUplOWQ3qa8okP6gjI9zy4SUQ4mT7jdwfJpxzPhv1CCp+qMJV66T8Hm9/6iRfOU6AZ9SFefHP62rv6wjsOkQAUr4/1wY7bN5rTEhXdXb6Gsdppzzouu5qwOQ6LfO34Hx8lBPZ+c8SYkfoDcMsicFbG+QHBpvPxLpFvJobnufodmsrv9pnRPgMFuVXChcz/f9F9EbTxLFh8jkpx5+E33kIrJX3ZYF2fviCJH+qU2pz7RbXAVgJ86jvkMHBvek9+Brwq40/bxZGXzp3m24NYw9DCvsgisIypDycIMgXbjLIlvZWnKNM/O3YAWAfPAvpXoPjn8KaDId2wyyW+hS4465wazM7xG7m03VKNuacYVeMtQMO3u29vgWtdDVCCTvYvn+d8WnQYP5DPenwwzbiiTPIITb17T6STX1N3xCp7tdkXZTnX2VnTkS4CieUwE7Vwi9yl5M7jqhvPseWHWYCK9gZYJ5GSqy5znEe7g0A7LRpDqEXXM9eCqtVYgQZyzCRep7aFIXCI/OkRNv2vFD9rainB9tpDjDZO1ttMI0jwq5lPkq8
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:31.1047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a1c961-d2c2-47b3-bf39-08dc5e6ee218
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  4 ++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h | 18 --------
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 28 +------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    |  9 ++++
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.h    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 41 ++++---------------
 6 files changed, 24 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 673969d46b66..94d0fb23ed2f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -119,6 +119,10 @@ struct nvif_vmm_impl {
 	int (*get)(struct nvif_vmm_priv *, enum nvif_vmm_get_type, bool sparse, u8 page,
 		   u8 align, u64 size, u64 *addr);
 	int (*put)(struct nvif_vmm_priv *, u64 addr);
+
+	int (*map)(struct nvif_vmm_priv *, u64 addr, u64 size, void *, u32,
+		   struct nvif_mem_priv *, u64 offset);
+	int (*unmap)(struct nvif_vmm_priv *, u64 addr);
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index 50a834d5eb19..9b979fa5c7ac 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -1,29 +1,11 @@
 #ifndef __NVIF_IF000C_H__
 #define __NVIF_IF000C_H__
 
-#define NVIF_VMM_V0_MAP                                                    0x03
-#define NVIF_VMM_V0_UNMAP                                                  0x04
 #define NVIF_VMM_V0_PFNMAP                                                 0x05
 #define NVIF_VMM_V0_PFNCLR                                                 0x06
 #define NVIF_VMM_V0_RAW                                                    0x07
 #define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
 
-struct nvif_vmm_map_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u64 addr;
-	__u64 size;
-	__u64 memory;
-	__u64 offset;
-	__u8  data[];
-};
-
-struct nvif_vmm_unmap_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u64 addr;
-};
-
 struct nvif_vmm_raw_v0 {
 	__u8 version;
 #define NVIF_VMM_RAW_V0_GET	0x0
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index cf00e7af6063..6821d8657e12 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -29,38 +29,14 @@
 int
 nvif_vmm_unmap(struct nvif_vmm *vmm, u64 addr)
 {
-	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_UNMAP,
-				&(struct nvif_vmm_unmap_v0) { .addr = addr },
-				sizeof(struct nvif_vmm_unmap_v0));
+	return vmm->impl->unmap(vmm->priv, addr);
 }
 
 int
 nvif_vmm_map(struct nvif_vmm *vmm, u64 addr, u64 size, void *argv, u32 argc,
 	     struct nvif_mem *mem, u64 offset)
 {
-	struct nvif_vmm_map_v0 *args;
-	u8 stack[48];
-	int ret;
-
-	if (sizeof(*args) + argc > sizeof(stack)) {
-		if (!(args = kmalloc(sizeof(*args) + argc, GFP_KERNEL)))
-			return -ENOMEM;
-	} else {
-		args = (void *)stack;
-	}
-
-	args->version = 0;
-	args->addr = addr;
-	args->size = size;
-	args->memory = nvif_handle(&mem->object);
-	args->offset = offset;
-	memcpy(args->data, argv, argc);
-
-	ret = nvif_object_mthd(&vmm->object, NVIF_VMM_V0_MAP,
-			       args, sizeof(*args) + argc);
-	if (args != (void *)stack)
-		kfree(args);
-	return ret;
+	return vmm->impl->map(vmm->priv, addr, size, argv, argc, mem->priv, offset);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index 6756e3e207d9..0676615093bb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -48,6 +48,15 @@ struct nvif_mem_priv {
 	struct nvif_mem_impl impl;
 };
 
+struct nvkm_memory *
+nvkm_umem_ref(struct nvif_mem_priv *umem)
+{
+	if (umem)
+		return nvkm_memory_ref(umem->memory);
+
+	return NULL;
+}
+
 static const struct nvkm_object_func nvkm_umem;
 struct nvkm_memory *
 nvkm_umem_search(struct nvkm_mmu *mmu, struct nvkm_client *client, u64 handle)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
index df7017eb98f4..a548a578758f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.h
@@ -5,4 +5,5 @@
 
 int nvkm_umem_new(struct nvkm_mmu *, u8 type, u8 page, u64 size, void *, u32,
 		  const struct nvif_mem_impl **, struct nvif_mem_priv **, struct nvkm_object **);
+struct nvkm_memory *nvkm_umem_ref(struct nvif_mem_priv *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 066e068589eb..dae965fe2977 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -113,20 +113,11 @@ nvkm_uvmm_mthd_pfnmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 }
 
 static int
-nvkm_uvmm_mthd_unmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+nvkm_uvmm_unmap(struct nvif_vmm_priv *uvmm, u64 addr)
 {
-	union {
-		struct nvif_vmm_unmap_v0 v0;
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
 
 	if (nvkm_vmm_in_managed_range(vmm, addr, 0) && vmm->managed.raw)
 		return -EINVAL;
@@ -157,34 +148,18 @@ nvkm_uvmm_mthd_unmap(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 }
 
 static int
-nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
+nvkm_uvmm_map(struct nvif_vmm_priv *uvmm, u64 addr, u64 size, void *argv, u32 argc,
+	      struct nvif_mem_priv *mem, u64 offset)
 {
-	struct nvkm_client *client = uvmm->object.client;
-	union {
-		struct nvif_vmm_map_v0 v0;
-	} *args = argv;
-	u64 addr, size, handle, offset;
 	struct nvkm_vmm *vmm = uvmm->vmm;
 	struct nvkm_vma *vma;
 	struct nvkm_memory *memory;
-	int ret = -ENOSYS;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, true))) {
-		addr = args->v0.addr;
-		size = args->v0.size;
-		handle = args->v0.memory;
-		offset = args->v0.offset;
-	} else
-		return ret;
+	int ret;
 
 	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
 		return -EINVAL;
 
-	memory = nvkm_umem_search(vmm->mmu, client, handle);
-	if (IS_ERR(memory)) {
-		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
-		return PTR_ERR(memory);
-	}
+	memory = nvkm_umem_ref(mem);
 
 	mutex_lock(&vmm->mutex.vmm);
 	if (ret = -ENOENT, !(vma = nvkm_vmm_node_search(vmm, addr))) {
@@ -452,8 +427,6 @@ nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
 	switch (mthd) {
-	case NVIF_VMM_V0_MAP   : return nvkm_uvmm_mthd_map   (uvmm, argv, argc);
-	case NVIF_VMM_V0_UNMAP : return nvkm_uvmm_mthd_unmap (uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNMAP: return nvkm_uvmm_mthd_pfnmap(uvmm, argv, argc);
 	case NVIF_VMM_V0_PFNCLR: return nvkm_uvmm_mthd_pfnclr(uvmm, argv, argc);
 	case NVIF_VMM_V0_RAW   : return nvkm_uvmm_mthd_raw   (uvmm, argv, argc);
@@ -483,6 +456,8 @@ nvkm_uvmm_impl = {
 	.del = nvkm_uvmm_del,
 	.get = nvkm_uvmm_get,
 	.put = nvkm_uvmm_put,
+	.map = nvkm_uvmm_map,
+	.unmap = nvkm_uvmm_unmap,
 };
 
 static void *
-- 
2.41.0

