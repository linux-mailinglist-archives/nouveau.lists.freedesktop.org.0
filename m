Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B458A7911
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DEE112F98;
	Tue, 16 Apr 2024 23:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sB2wAjBw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32315112F3A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/MUFGXhP0Zi182SoSrsi90iIdohp5ogPUPqeb3RDrFSj3jMNGJ39MO1/SqwuHjD93WSBN+dQEr/hQ+H8wVjvW7z19OiyIubU5RkhAvu8CCFOKHaHcflAbyPnY5EXg35vUilp8zkdLlYZWPMoMVF3yg36mtu8F0k71hr7iipFKIiAvh29ZtogZjW8C4kIQ97SdEJkLk6iySM9s0hJtRkjAsZP6nGDvMCvNy89MoksHljSIjF+sw1VxjtzKSVa1G4IjHZkf7PHNHRsff8b1mip2+stEA1ft43zDl/huZC+q6yo3Hd9zY3rwpq3nshqit4kxyLnREzAwAyJOSd9hdbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YO5OA3TY9D3tseV5oqraUO2uGXtt4NWVVlWLE3P0j2A=;
 b=SWhlKDaw5CnLoJM6azZauXS3iuILJbdYsaHgomSSlXmIZtZ3lXpjaLQoJCDTPRiI8PL0bS0ZcBsNPz060whLt/ywdHLqPDcmTzjQ6TwvDf4eZ6rG//0tgiwFknmQQ5bjlUVG4EFecfp8Sde2QyFbD9KqSHlybq0ilyFx/etlpoV0StfOzxRntH7Lk6VrKQ969a3XVCt19DbNo5CZfRIqHM0gTwASHbudBfOuvfjrVdbtf/S6mg/hfPywEjOYAw+or7Bbn3+hNX8lkIEKyYD6s0mnSmQs5y3/ljgKhpU9/IOW1ucMw1VPGMbJbPmel6R/S5bNJMsUcTXZoE3phwQlrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO5OA3TY9D3tseV5oqraUO2uGXtt4NWVVlWLE3P0j2A=;
 b=sB2wAjBwvycFovqNenOI9rnhNupT4Ldy034fEw1CGPbSd45Oi3TY1FSS64/sUtQH15L7qkNVZcWTVC1VZvle3tGQgx7TFxzhvOIaYeXwMdDGV/7+FesL/7jMx38MXY7aNU6y/yJp2FT8+9Y+7qI8CTMIQEizVp0tzJplmjypme4LSFB8FMTMkjmgKjpmPV0hFWDnz1lDDVTsChddKRABUzdWF0X2emd/eje58KcKNM2bkcSrvukQdXu+zPgaIgNfaBW/FXDBCLU1DDhb/Rk1Pbz4SQA9YNosKUU7JfvhlwHLIw3uHAcaz6S42zTPPaCZl7We3+o9OGvhkWRY8vZJ1A==
Received: from DS7PR03CA0112.namprd03.prod.outlook.com (2603:10b6:5:3b7::27)
 by SJ2PR12MB8942.namprd12.prod.outlook.com (2603:10b6:a03:53b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:33 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::a8) by DS7PR03CA0112.outlook.office365.com
 (2603:10b6:5:3b7::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.32 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:14 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:13 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 091/156] drm/nouveau/nvif: rework vmm "raw get"/"raw put" apis
Date: Wed, 17 Apr 2024 09:38:57 +1000
Message-ID: <20240416234002.19509-92-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SJ2PR12MB8942:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2ed46e-1a98-4eeb-272a-08dc5e6ee2d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 01W70F5qduRGfA+GIc+nEiA6ZVtzj0fZ/Jvp3aXhk/c4+4ck1HE8Gds0zTN1abb0TcwKkK08Unpn+++YuertVXqt2JztltkCNDbNc1KnTyS5PZahID1dtSp673NsZJrSKNGhWMrHRYYniA/OOdOR/lPaxwue3t6maLxKtevOBiTiXg58H4zLKwPX9Mu0z9Hd6EOiPoZRgHxpdBJYILMis4MSeOukedQIpvZkkZryri+ycW6bP7wJ3jBv1AKtx4YcsNCgvQZkvZl+NkMAFKJ/U4KOKCrfcF9BuJUhrhw9Tv187gRuKeB3W00HZrq242eswYayFmQ+RGcnWccmzAhz3pQ/hou8iLZPdvz0DMQ49zQe+cSUbiY8x6nxLoAItNYluBEgFa74dpf3VrNCmQ1dihgOTRi3o/q/fdiDOK+qgKN/y9eoIpFQkWk7+C599KRNTujNPgKN2x28QhVRCLvnQ8HfiW2uo+VR5sjjut0PyEP9xJElaU3hHXqna+GOmOtXwLC92M16EAmBVt8l070KP67pJjTZW0mdVn5tsgDWf8PEe/xoKY23q/1USszY0YqO6QdbnADGZV/7uSicUkto+CXj1weyZ1Keyq0k8BilWYQ+YeOA5VfyTlYFxaVGoWqNIdPM0XnPt6EDEhi94I26a0eIfSOJu63A1CIylm+KpOqZe2fu5sdIQ3140ll/VVbrYzN3LSsaZarj8KfWw1zEmuDtxvvOizOI+DW6KQX1/YsRO0InRwLTujM6N4UujCd5
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:32.3460 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2ed46e-1a98-4eeb-272a-08dc5e6ee2d6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8942
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

- transition from ioctl interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  5 +++++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |  2 --
 drivers/gpu/drm/nouveau/nvif/vmm.c            | 22 ++-----------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 22 +++++++++----------
 4 files changed, 17 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index afca57d53c8c..65958649f08c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -135,6 +135,11 @@ struct nvif_vmm_impl {
 #define NVIF_VMM_PFNMAP_NONE       0x0000000000000000ULL
 	int (*pfnmap)(struct nvif_vmm_priv *, u8 page, u64 addr, u64 size, u64 *phys);
 	int (*pfnclr)(struct nvif_vmm_priv *, u64 addr, u64 size);
+
+	struct {
+		int (*get)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size);
+		int (*put)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size);
+	} raw;
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
index 709837ffea4e..c81fae28395a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
@@ -6,8 +6,6 @@
 
 struct nvif_vmm_raw_v0 {
 	__u8 version;
-#define NVIF_VMM_RAW_V0_GET	0x0
-#define NVIF_VMM_RAW_V0_PUT	0x1
 #define NVIF_VMM_RAW_V0_MAP	0x2
 #define NVIF_VMM_RAW_V0_UNMAP	0x3
 #define NVIF_VMM_RAW_V0_SPARSE	0x4
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 6821d8657e12..d7ca6afaeb04 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -68,31 +68,13 @@ int
 nvif_vmm_raw_get(struct nvif_vmm *vmm, u64 addr, u64 size,
 		 u8 shift)
 {
-	struct nvif_vmm_raw_v0 args = {
-		.version = 0,
-		.op = NVIF_VMM_RAW_V0_GET,
-		.addr = addr,
-		.size = size,
-		.shift = shift,
-	};
-
-	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
-				&args, sizeof(args));
+	return vmm->impl->raw.get(vmm->priv, shift, addr, size);
 }
 
 int
 nvif_vmm_raw_put(struct nvif_vmm *vmm, u64 addr, u64 size, u8 shift)
 {
-	struct nvif_vmm_raw_v0 args = {
-		.version = 0,
-		.op = NVIF_VMM_RAW_V0_PUT,
-		.addr = addr,
-		.size = size,
-		.shift = shift,
-	};
-
-	return nvif_object_mthd(&vmm->object, NVIF_VMM_V0_RAW,
-				&args, sizeof(args));
+	return vmm->impl->raw.put(vmm->priv, shift, addr, size);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index b1bd1dd3d5dd..51c7e0fd7876 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -260,37 +260,37 @@ nvkm_uvmm_page_index(struct nvif_vmm_priv *uvmm, u64 size, u8 shift, u8 *refd)
 }
 
 static int
-nvkm_uvmm_mthd_raw_get(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+nvkm_uvmm_raw_get(struct nvif_vmm_priv *uvmm, u8 shift, u64 addr, u64 size)
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
 
-	return nvkm_vmm_raw_get(vmm, args->addr, args->size, refd);
+	return nvkm_vmm_raw_get(vmm, addr, size, refd);
 }
 
 static int
-nvkm_uvmm_mthd_raw_put(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
+nvkm_uvmm_raw_put(struct nvif_vmm_priv *uvmm, u8 shift, u64 addr, u64 size)
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
 
-	nvkm_vmm_raw_put(vmm, args->addr, args->size, refd);
+	nvkm_vmm_raw_put(vmm, addr, size, refd);
 
 	return 0;
 }
@@ -382,10 +382,6 @@ nvkm_uvmm_mthd_raw(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 		return ret;
 
 	switch (args->v0.op) {
-	case NVIF_VMM_RAW_V0_GET:
-		return nvkm_uvmm_mthd_raw_get(uvmm, &args->v0);
-	case NVIF_VMM_RAW_V0_PUT:
-		return nvkm_uvmm_mthd_raw_put(uvmm, &args->v0);
 	case NVIF_VMM_RAW_V0_MAP:
 		return nvkm_uvmm_mthd_raw_map(uvmm, &args->v0);
 	case NVIF_VMM_RAW_V0_UNMAP:
@@ -433,6 +429,8 @@ nvkm_uvmm_impl = {
 	.unmap = nvkm_uvmm_unmap,
 	.pfnmap = nvkm_uvmm_pfnmap,
 	.pfnclr = nvkm_uvmm_pfnclr,
+	.raw.get = nvkm_uvmm_raw_get,
+	.raw.put = nvkm_uvmm_raw_put,
 };
 
 static void *
-- 
2.41.0

