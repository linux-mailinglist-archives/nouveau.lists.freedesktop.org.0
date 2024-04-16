Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AD28A7908
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D61112F59;
	Tue, 16 Apr 2024 23:42:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KJ1wjbJF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3E0112F4D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8Fn+0BimGysaLK6Z222F2nKMvPkh+lrjdnin5bKTFGrb38PdX8De6ag7BzlP6wU6EdJU61wIPYjJ+SzAz7300tWPxqE4OOQ+s/yxkqU6nTEmy5Q4LTyvOawP1qjKjh7vP1nX9IOl9s6FNN9WrxSsyyWGLTxPZWZoIhaheqOfzGVQY5VBMcscoHtsvrJnstB9G6VkT7k9wAWzL4YtcHZfSnqaLrsoHbG3Hm2ByCZYnEcXqcbojrr6JGQq65tmdKFvG3ZLpAxmIEuOjs93AShn/wVztIAEjtieOMyBuydVsynlRN3qraFQuUhhLpbiflJg2TCsHQ48uQDPQIrpk50vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLddHs4p4DqbRMsSUdX+krzvUCgETyxpcwCxYrDm+uM=;
 b=SjIpRJ7w0A/JqVP2wHNWjly/0u2YeWgmTWoSVwFZtUCtSWvs1yqi1nK/Yp5HuSPAWIB8AkcYi8SNAURDGE0JZmm3+lgV0JFbu1NtT8qa9ZlWno9COMKTpJeWdJVRr5LlTn9pd9Ek5i8KZUnFVqiJYaKxV5XqrTQG0Ukmrr3ZIIZZNZrc1+QVZibenTJniygF+sc3SNn5eVgh6k1TOQgI3oYLMq1Y7aKJtPps28TQrfoAv7iZltf4JAWTtgbUOUn+ebQavDWMfQGUwPM4ikyIns/hEXYJK9T7pVdg4twX2wZZ+4qBukNK2D5oD48r8iv9Kcw2z4hZeeb3zKZDn1s/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLddHs4p4DqbRMsSUdX+krzvUCgETyxpcwCxYrDm+uM=;
 b=KJ1wjbJF7xWdC2ADA/neXfSwAnnxBkizbsWwdf4JGbFHqAeoio3I7wqeQfPBudqF3JdUjbQKuGPdTzMq6YGXRmDiCnRMccBItK/uqSfmdoNVI0TklGXB5JwA6y9M528PKnI46iXDnstUj14GeqbnSt6x8nCPEcUc3zfL7BhVmxw7Nltz4xaTQ/XeG9SX7nXgap4o73aTZofSeGxg8Vab7Xlx1K05Jn2q9/ffq0Pl5EYgyFbVax4xi+ghgWFJo93guNCn+m9qzmVSqE3iLV6Jb+Vh+fJFUcEBiM4NrQZAo0pUEKEz+WQO8YgKwMo7Gtm1c+oCMKlFfKfva+4+lJtOww==
Received: from DM6PR07CA0063.namprd07.prod.outlook.com (2603:10b6:5:74::40) by
 DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:42:33 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::c5) by DM6PR07CA0063.outlook.office365.com
 (2603:10b6:5:74::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:33 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:16 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 092/156] drm/nouveau/nvif: rework vmm "raw map"/"raw unmap"
 apis
Date: Wed, 17 Apr 2024 09:38:58 +1000
Message-ID: <20240416234002.19509-93-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DM4PR12MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 7343b86c-44da-49f4-ec37-08dc5e6ee349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+g9nRFppGlZaK6X6b8aGhsjfaEGnZkGZD6uDmZA8j+SGgKRxLiQyYWuAPQtN2igS/xY2nBJj+XCCbSk1p9FcvPQI0/3fZe1FHGjFUo2XmiLR+DGlu6CNF4ZCVLs2KdsTV95DYrHgoDSl87msF12ZRWOpLZinaLf2xBlQBb4unasHzng24UxlBe8FpeQ7SEACTmxc2XRIBYKZ3cGDbWueRxtadxR5RJhSSHH6rCGKMqQXsJmc1vc65nwZcCPg4p+zL8MzQBmxE3yMtOeIBqSEfxjz4u/Ljd2FoGe+UE1wcBWcAMFJrStNVB3NVQO5nCR7x2HNdYHr1GTqg8aisYyUnjXqzJNppAzGFcZu5OMFBVXyLdPHsirfZGMgE7PF78LOyWa5WNAd8zXIqlNNLN8eq1Loeu+lsw/iqG2GhPGcRfERDPYLRTwht0iSHyIoD6M6pkrL4Sg371W6O8H38QyPBLq1ag4+IEwb7wv+ubGTXEzVHV3uaniWpvifVONWSJWOlGZGZe330DnZv/Uz0Po/OlVj5m2A4EDs/so2/Sm04rVnZUG/A1BhqsAS5AH87skDVLF1Am/YvfueIKclsz1upE3X51qkhuBpi1dSy2pRHZ3zFfKw35cAb7q4TDLDnXT7SuoVrxtvFqy1P4WgafHXb8rtgP/pISlaZmWmF5qXu8DbXR52uar7iWYVShJPHcuL8Wv7qmGpUg+HSHFecPgtdKV4wE7aylA3GTUPpXpPg0o5m7OZ1v0gFunfhYXR0ml
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:33.1047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7343b86c-44da-49f4-ec37-08dc5e6ee349
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  3 ++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |  2 -
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 28 +------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 39 +++++++------------
 4 files changed, 19 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 65958649f08c..1cea0a07b2e8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -139,6 +139,9 @@ struct nvif_vmm_impl {
 	struct {
 		int (*get)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size);
 		int (*put)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size);
+		int (*map)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size, void *, u32,
+			   struct nvif_mem_priv *, u64 offset);
+		int (*unmap)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size, bool sparse);
 	} raw;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index c81fae28395a..232cc1142798 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -6,8 +6,6 @@
 
 struct nvif_vmm_raw_v0 {
 	__u8 version;
-#define NVIF_VMM_RAW_V0_MAP	0x2
-#define NVIF_VMM_RAW_V0_UNMAP	0x3
 #define NVIF_VMM_RAW_V0_SPARSE	0x4
 	__u8  op;
 	__u8  sparse;
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index d7ca6afaeb04..16c6aaa81326 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -81,38 +81,14 @@ int
 nvif_vmm_raw_map(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift,
 		 void *argv, u32 argc, struct nvif_mem *mem, u64 offset)
 {
-	struct nvif_vmm_raw_v0 args = {
-		.version = 0,
-		.op = NVIF_VMM_RAW_V0_MAP,
-		.addr = addr,
-		.size = size,
-		.shift = shift,
-		.memory = nvif_handle(&mem->object),
-		.offset = offset,
-		.argv = (u64)(uintptr_t)argv,
-		.argc = argc,
-	};
-
-
-	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
-				&args, sizeof(args));
+	return vmm->impl->raw.map(vmm->priv, shift, addr, size, argv, argc, mem->priv, offset);
 }
 
 int
 nvif_vmm_raw_unmap(struct nvif_vmm *vmm, u64 addr, u64 size,
 		   u8 shift, bool sparse)
 {
-	struct nvif_vmm_raw_v0 args = {
-		.version = 0,
-		.op = NVIF_VMM_RAW_V0_UNMAP,
-		.addr = addr,
-		.size = size,
-		.shift = shift,
-		.sparse = sparse,
-	};
-
-	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
-				&args, sizeof(args));
+	return vmm->impl->raw.unmap(vmm->priv, shift, addr, size, sparse);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 51c7e0fd7876..7c8a7a5dc3f9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -296,40 +296,33 @@ nvkm_uvmm_raw_put(struct nvif_vmm_priv *uvmm, u8 shift, u64 addr, u64 size)
 }
 
 static int
-nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+nvkm_uvmm_raw_map(struct nvif_vmm_priv *uvmm, u8 shift, u64 addr, u64 size, void *argv, u32 argc,
+		  struct nvif_mem_priv *umem, u64 offset)
 {
-	struct nvkm_client *client = uvmm->object.client;
 	struct nvkm_vmm *vmm = uvmm->vmm;
 	struct nvkm_vma vma = {
-		.addr = args->addr,
-		.size = args->size,
+		.addr = addr,
+		.size = size,
 		.used = true,
 		.mapref = false,
 		.no_comp = true,
 	};
 	struct nvkm_memory *memory;
-	void *argv = (void *)(uintptr_t)args->argv;
-	unsigned int argc = args->argc;
-	u64 handle = args->memory;
 	u8 refd;
 	int ret;
 
-	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+	if (!nvkm_vmm_in_managed_range(vmm, addr, size))
 		return -EINVAL;
 
-	ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
+	ret = nvkm_uvmm_page_index(uvmm, size, shift, &refd);
 	if (ret)
 		return ret;
 
 	vma.page = vma.refd = refd;
 
-	memory = nvkm_umem_search(uvmm->vmm->mmu, client, args->memory);
-	if (IS_ERR(memory)) {
-		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
-		return PTR_ERR(memory);
-	}
+	memory = nvkm_umem_ref(umem);
 
-	ret = nvkm_memory_map(memory, args->offset, vmm, &vma, argv, argc);
+	ret = nvkm_memory_map(memory, offset, vmm, &vma, argv, argc);
 
 	nvkm_memory_unref(&vma.memory);
 	nvkm_memory_unref(&memory);
@@ -337,22 +330,20 @@ nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
 }
 
 static int
-nvkm_uvmm_mthd_raw_unmap(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+nvkm_uvmm_raw_unmap(struct nvif_vmm_priv *uvmm, u8 shift, u64 addr, u64 size, bool sparse)
 {
 	struct nvkm_vmm *vmm = uvmm->vmm;
 	u8 refd;
 	int ret;
 
-	if (!nvkm_vmm_in_managed_range(vmm, args->addr, args->size))
+	if (!nvkm_vmm_in_managed_range(vmm, addr, size))
 		return -EINVAL;
 
-	ret = nvkm_uvmm_page_index(uvmm, args->size, args->shift, &refd);
+	ret = nvkm_uvmm_page_index(uvmm, size, shift, &refd);
 	if (ret)
 		return ret;
 
-	nvkm_vmm_raw_unmap(vmm, args->addr, args->size,
-			   args->sparse, refd);
-
+	nvkm_vmm_raw_unmap(vmm, addr, size, sparse, refd);
 	return 0;
 }
 
@@ -382,10 +373,6 @@ nvkm_uvmm_mthd_raw(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 		return ret;
 
 	switch (args->v0.op) {
-	case NVIF_VMM_RAW_V0_MAP:
-		return nvkm_uvmm_mthd_raw_map(uvmm, &args->v0);
-	case NVIF_VMM_RAW_V0_UNMAP:
-		return nvkm_uvmm_mthd_raw_unmap(uvmm, &args->v0);
 	case NVIF_VMM_RAW_V0_SPARSE:
 		return nvkm_uvmm_mthd_raw_sparse(uvmm, &args->v0);
 	default:
@@ -431,6 +418,8 @@ nvkm_uvmm_impl = {
 	.pfnclr = nvkm_uvmm_pfnclr,
 	.raw.get = nvkm_uvmm_raw_get,
 	.raw.put = nvkm_uvmm_raw_put,
+	.raw.map = nvkm_uvmm_raw_map,
+	.raw.unmap = nvkm_uvmm_raw_unmap,
 };
 
 static void *
-- 
2.41.0

