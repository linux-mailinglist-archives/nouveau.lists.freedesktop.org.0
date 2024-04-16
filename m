Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DADD8A793A
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C27A112FDA;
	Tue, 16 Apr 2024 23:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xt+gf5wf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AEB112FD2
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GL0KNDv9+kWCueyvuMNNoQYba2p5F5NfntWqXir8KGQBBC4JaO6w4t0Otnaw3FMLx24t2b+Z2fdboWugG1rstKH++JRda0JnVE1ZNKeo9jPEiWGVkT5N5S9MkeV3z2Qc+kfchMpIuiSFN+8qY7pG+bMDE/jv3PHtsaO7GXX4uunsuspYbLqM5aOQA0EMLM8LoFfVpWoYrUnkhI+Zbo2qRq3wndvVrQMmtyf+wLIKeKmetWbbxLyvbchFachR19QebJwUIme+tlsMki44SyW5yH0Q9tItb+5rGExI0WVWmiTLVyC66E9ZoemS+SY+1j+WWj+1YEsFPSKdCy9PXK9lzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzGnzj2Bl5MwMIB8JwldG48gIp/SdTkddxztFgfseuY=;
 b=buTpuTAfBXDyDCMcVuV42qK8znSuAJk8KyscMpKBz/0I3KybHAY1IIEb5Zi7RfI5Hxoh86kVrJRQa6CwFsC0/FUYJyO6fy/FiJX9UhfH7ibG5NU9L/UzdedQeu+jvRxRFJBxhWadbA+Igj/sR1cRiGSsoaDRO/wd0xPO4mn+P37LEhAxRdGsW7XdEaAkcDbJV9RGlhQtQ7Zf7OUCF3CHmecqzeMHmuHwLBtGuPaTpnwQNm1CSjkGsdGGx2ErVX5owzDpCpIIJf+ogdB2gYdMCe2b2Z0CoyBVUbAlfA2GHogJBtCPXfcCJlh4q+D7UdnG9gFSsZCrOXDyXC6qLh9zAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzGnzj2Bl5MwMIB8JwldG48gIp/SdTkddxztFgfseuY=;
 b=Xt+gf5wfXAtVL2qEuq2II6KK6chvl37+Ci1uWhdCCPhRv0r03Shc+ATjDsGPBwM2Q8JKQOHrzR1rjjBR6YEIm7OX1IYmw0g6w9E+ODXQFElhU1mc680vduvitBgieYa4PxoMH9vJUuOp/kZRp8AqMxmTwXNSfrJSa5iI3xbIpEbHKD8i0HXDeQPJ5aHz2rL92KSzv2y9iEevFpdWPIjkGLRln+ZidFmXeQA88MfoFCuikDPLtAzrxwkSKiQxGWKXOYZ06tSf2PMYgKIjtfLJZRrUb0UC5rT7yCYUOKRVyqjkoKrr6P1fFxXeUa3a9VW7Fms0CBh1VCt9Jcc0IxlOEg==
Received: from CH5P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::21)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:32 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::26) by CH5P220CA0003.outlook.office365.com
 (2603:10b6:610:1ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:08 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 138/156] drm/nouveau/nvif: remove vmm from object rb
Date: Wed, 17 Apr 2024 09:39:44 +1000
Message-ID: <20240416234002.19509-139-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 395a327a-be75-45d4-294c-08dc5e6f068c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m1eiWlpR7orlbTzzJIMOFap2+3jeuTZQHxVMG3yLBUNG6Ym/9cTkgvR4859yrZos7wZXQHn4ORk3NW7RwRqDPnXPQwm7PkwsPrWXFOpGuUuNn4qCqAMSJJy5gqSgjGdPRizOdv2OaESYROWRT88DLoUFt8oydweePMdvGXn9ItIq9OmhXP7882Jtx+AjVO3+k/OeUh9MAiYeTPFB8jRJOOSsbXi+lrghaSB6W5pkN4AtGS6/Y2cwNzLDHnKcT1OqeaV/Kb0HcIrZ0j1/gRrRhbz2nxW+Au8l2dZ6zADG6Zhi3Id01nPn8iIZa3ha7d37KSpyEiZCNCeWa4hIH8pm9B7G08fJOc+1xQ9b34UDuySXbcaUcyNGp4v/slmHkv0hODGAMMgL9nO7t+v37E4FxU/TyQhxjqTwFPaXwR5RwYN7FDlSZozL+c52QFagkDkR0XaR5pC+7iOUSe6bqbCYX14p96MhdgoR1QfcpZz5cjffTkRLJUbX667R2sLcGJ9kT/j3WAkBkFCK3bvr8S7dhB3Fhy7wYfTsEdtFFDQ7rHBDjFRdPcMw8BNULK63DXgZ8czDUB0fNmmoIhMxNA1gpfQRbfU4xJEIf1Io3UF6vods4Cc1Rs4frvS0qCNIUTBw343Cpnief7xeVq1AqGgDqOhhpJJzGfFsliyQXDBYIVYEF0RVhlvQuWvrBB1gSPYO4AkASclzyZO5V5uZXp2bEjmIQem7jX/cBRYIHMSCnPFajYqjuFYpueGP6mH/s9UL
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:32.2434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 395a327a-be75-45d4-294c-08dc5e6f068c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h   |  3 +--
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  2 --
 drivers/gpu/drm/nouveau/nvif/vmm.c                |  3 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    |  5 +++--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 13 -------------
 5 files changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 0a460eaaf76b..de9c55dea9bf 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -208,8 +208,7 @@ struct nvif_mmu_impl {
 	struct {
 		s32 oclass;
 		int (*new)(struct nvif_mmu_priv *, enum nvif_vmm_type type, u64 addr, u64 size,
-			   void *, u32, const struct nvif_vmm_impl **, struct nvif_vmm_priv **,
-			   u64 handle);
+			   void *, u32, const struct nvif_vmm_impl **, struct nvif_vmm_priv **);
 	} vmm;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 6a1472b9499f..4e68fb5b2d2e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -109,8 +109,6 @@ int nvkm_vmm_map(struct nvkm_vmm *, struct nvkm_vma *, void *argv, u32 argc,
 		 struct nvkm_vmm_map *);
 void nvkm_vmm_unmap(struct nvkm_vmm *, struct nvkm_vma *);
 
-struct nvkm_vmm *nvkm_uvmm_search(struct nvkm_client *, u64 handle);
-
 struct nvkm_mmu {
 	const struct nvkm_mmu_func *func;
 	struct nvkm_subdev subdev;
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index fe342828ce8c..c12c79e7d9bd 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -113,8 +113,7 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name,
 	const u32 oclass = mmu->impl->vmm.oclass;
 	int ret;
 
-	ret = mmu->impl->vmm.new(mmu->priv, type, addr, size, argv, argc, &vmm->impl, &vmm->priv,
-				 nvif_handle(&vmm->object));
+	ret = mmu->impl->vmm.new(mmu->priv, type, addr, size, argv, argc, &vmm->impl, &vmm->priv);
 	NVIF_ERRON(ret, &mmu->object, "[NEW vmm%08x]", oclass);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index b3883758828d..2734b75b34f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -28,7 +28,7 @@
 static int
 nvkm_ummu_vmm_new(struct nvif_mmu_priv *ummu, enum nvif_vmm_type type, u64 addr, u64 size,
 		  void *argv, u32 argc, const struct nvif_vmm_impl **pimpl,
-		  struct nvif_vmm_priv **ppriv, u64 handle)
+		  struct nvif_vmm_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -37,7 +37,8 @@ nvkm_ummu_vmm_new(struct nvif_mmu_priv *ummu, enum nvif_vmm_type type, u64 addr,
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(ummu->object.client, &ummu->object, handle, object);
+	nvkm_object_link(&ummu->object, object);
+	return 0;
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 5fac19738815..571f79b90fd3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -42,19 +42,6 @@ nvkm_uvmm_ref(struct nvif_vmm_priv *uvmm)
 	return NULL;
 }
 
-static const struct nvkm_object_func nvkm_uvmm;
-struct nvkm_vmm *
-nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
-{
-	struct nvkm_object *object;
-
-	object = nvkm_object_search(client, handle, &nvkm_uvmm);
-	if (IS_ERR(object))
-		return (void *)object;
-
-	return nvkm_vmm_ref(container_of(object, struct nvif_vmm_priv, object)->vmm);
-}
-
 static void
 nvkm_uvmm_fault_cancel(struct nvif_vmm_priv *uvmm, u64 inst, u8 hub, u8 gpc, u8 client)
 {
-- 
2.41.0

