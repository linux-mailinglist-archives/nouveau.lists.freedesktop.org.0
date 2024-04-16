Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F7A8A78FD
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7054112F79;
	Tue, 16 Apr 2024 23:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jhscCuVr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C064B112F78
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Perd7osa50wFCib7E+6bEwDPJ/gAXqOfg5eEeDNC6WEKQ78aeeO6/YsluHlkYOLiv5Wwp+p7IpIykr1VUXfh/u8tQPUSZCPvVErTbEaUdsZLklfONK/Bf6ErJNWAcSp5tRQMwtEcTUfLEfU8eHJ7zD3j07y6XClscaldqo31tORQPtHSjGt8/7uMyPmnH/cwLRyNJ1RDt99DPBCYAI8YBOUfCzg0zxD1bMbvfCkigFEFW+3aRoJV7Bi3PlaCX6ja335472m7VTMe9RjXQY/CF6lo9fQhq2g47YN9U0s00K1g8qFMtRQ9uH5MopBPammjzb9zHnHkKi4T90JFKZr/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/xF0EPVSzSnjDHgsoeuPF/QdiIp2pRvTi6MlooXfOs=;
 b=nAauOpvH/+6i5qFLTVMsXHsLrNf8fIghvE/mfIRkPwoWG7K5WWj7WFqQABpvFSIc55aeEP5iI3RycpkuEM9oIPnLNx/NJd/KfJFqqpt6vyLw0iYvpKFPUItdV9jEprwdHVQ6bd0abFsj4ifxNSC/37JuyZGDt9QpUhgc0Vo9SGGuTowORlDdIZ/MjU2lRFg+neWO3680SsXOgMOaoxJTZ/R0aMOAWVV5PJvruYs4WKgcQkMu+feFKtKtNurCqY8X2zULJvoQ0eTVcrW4ZQZMXXU6fm2bMcXtkpOwBTkpEFeHXKPPrHGUno1p+AUEwiOTYKJgeIkN0lAtbSQTxufOQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/xF0EPVSzSnjDHgsoeuPF/QdiIp2pRvTi6MlooXfOs=;
 b=jhscCuVrAiQfxJx1yLUkTWFOVKYc8C87JSjiDpivq/T/CYEjeWbqykBha6zuvv0cthpTe9wFKvBgCeRityhK+arLQ8X/9EATKbRPfJ4+pkwOw8BglP6gFwSFvNdnlEVMQhEiN816Y5E3knE9edprC9uRoTiOibXad4VlBHfh181I4RpdHIC350m3fFwNhTX+BAP4i602YqnueB4rvISVnJrz8lxqPB55h2yk2JM+VIRqMJ3c7OcRJSt1Ep5nxZAXnBxerAdL7zk7LWNpN/aoOjyextxLSD9zIrRuj8ovF88A5qUrQxcnW1T5DI406MPf50DXunaIFU9D0BFfXVuKsQ==
Received: from DS7PR03CA0063.namprd03.prod.outlook.com (2603:10b6:5:3bb::8) by
 LV8PR12MB9136.namprd12.prod.outlook.com (2603:10b6:408:18e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:42:21 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::18) by DS7PR03CA0063.outlook.office365.com
 (2603:10b6:5:3bb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:21 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:01 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:00 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 079/156] drm/nouveau/nvif: rework mmu "sclass" api
Date: Wed, 17 Apr 2024 09:38:45 +1000
Message-ID: <20240416234002.19509-80-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|LV8PR12MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: dcae2ddc-24a1-4dbb-a3ad-08dc5e6edc20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4636kA2BsWZ9jVG4L1M0n9O+23pEwbBTYYM+qco2OmmJ/AZix8cnEEJoIEcZDQY3e3Raz2SHqkkbRJrRlaWRNvEO5fo2/QgeM+/uGUlCCyQ83WE2V2O+58pUAK4J9YMWCynXkL6HFm3vQZaZ0JTkShdswTPkmKfVef4zXimmK3na0ckc11nhFx29OSBCzI9h+ukAxlRnqUD3e66WGM3lP4yDCOrt9ExYSngRIr33lZRUUa2g7cSfG7ML9vS3AssmIBeQL8Zg6ykufdD5FZJuliuE6EKz4yVjp7BKb1rhjAlphk5U/4w2pJyoKLEvA42ZQZzZfdC2PCqELOtOR4OarNl+9NdCehJ/QNMS1DZO1lZP8QesI+QEKGOgn8MIbDEgzc5SQ4ONtsHAB/NIO6A+kfgvneeyclaBYdugDC3f7LK4OQ9LWAPOPMiki1TUYd+eEk1RFuRJJMhzuPY0Sy55K/ajjftG1QkXedNxUM7e125xjseO1EGIwiS27E3pIPiL8ZqLEJMKMMuCzUkqvz7UYVjm3z5f5X0uvVH0rmkgc+tWGiEx4ZFY3hAf8cgrNkFD5EXyRssBIXr+tOq/vmH8POcMewgYONaTIxr3m+Eq1r40p8P4bKldEGJUQAILD6YtrOBKYj8GIJr/qWlRwOwvTSFIrD7zCcM2SC/94e+DwLvIUv+kIGHKjLmws2tJmk2pZqEg/J2UL7OROOt8gyIJOQ8H3o+xM44kK4Uf1+tyyPuaYsK+DdMrLlOOnIRKkXPU
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:21.0589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dcae2ddc-24a1-4dbb-a3ad-08dc5e6edc20
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9136
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  8 +++
 drivers/gpu/drm/nouveau/include/nvif/mem.h    |  4 +-
 drivers/gpu/drm/nouveau/include/nvif/mmu.h    |  1 -
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 54 ++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 -
 drivers/gpu/drm/nouveau/nouveau_mem.c         | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_svm.c         |  3 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  3 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_vmm.h         |  2 +-
 drivers/gpu/drm/nouveau/nvif/mem.c            | 10 ++--
 drivers/gpu/drm/nouveau/nvif/mmu.c            | 11 ----
 drivers/gpu/drm/nouveau/nvif/vmm.c            |  4 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    |  4 ++
 17 files changed, 60 insertions(+), 74 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 7bba8c79d71e..a1b97bc5e933 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -84,6 +84,14 @@ struct nvif_mmu_impl {
 	u8 type_nr;
 
 	u16 kind_nr;
+
+	struct {
+		s32 oclass;
+	} mem;
+
+	struct {
+		s32 oclass;
+	} vmm;
 };
 
 struct nvif_device_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mem.h b/drivers/gpu/drm/nouveau/include/nvif/mem.h
index 9e1071dd56a0..217d13126f13 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mem.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mem.h
@@ -10,10 +10,10 @@ struct nvif_mem {
 	u64 size;
 };
 
-int nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name, s32 oclass,
+int nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
 		       int type, u8 page, u64 size, void *argv, u32 argc,
 		       struct nvif_mem *);
-int nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, u8 type,
+int nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, u8 type,
 		  u8 page, u64 size, void *argv, u32 argc, struct nvif_mem *);
 void nvif_mem_dtor(struct nvif_mem *);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mmu.h b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
index 414caaa2230a..ed5d011f4237 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
@@ -12,7 +12,6 @@ struct nvif_mmu {
 	u8  type_nr;
 	u8  kind_inv;
 	u16 kind_nr;
-	s32 mem;
 
 	struct {
 		u64 size;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/vmm.h b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
index 0ecedd0ee0a5..e8d8fbd56010 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/vmm.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/vmm.h
@@ -36,7 +36,7 @@ struct nvif_vmm {
 	int page_nr;
 };
 
-int nvif_vmm_ctor(struct nvif_mmu *, const char *name, s32 oclass,
+int nvif_vmm_ctor(struct nvif_mmu *, const char *name,
 		  enum nvif_vmm_type, u64 addr, u64 size, void *argv, u32 argc,
 		  struct nvif_vmm *);
 void nvif_vmm_dtor(struct nvif_vmm *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index e1483fd5d283..cbb8f54db83f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1158,7 +1158,7 @@ nouveau_ttm_io_mem_free_locked(struct nouveau_drm *drm,
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 
-	if (drm->client.mem->oclass >= NVIF_CLASS_MEM_NV50) {
+	if (drm->mmu.impl->mem.oclass >= NVIF_CLASS_MEM_NV50) {
 		switch (reg->mem_type) {
 		case TTM_PL_TT:
 			if (mem->kind)
@@ -1179,7 +1179,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
 	struct nvkm_device *device = nvxx_device(&drm->client.device);
 	struct nouveau_mem *mem = nouveau_mem(reg);
-	struct nvif_mmu *mmu = &drm->client.mmu;
+	struct nvif_mmu *mmu = &drm->mmu;
 	int ret;
 
 	mutex_lock(&drm->ttm.io_reserve_mutex);
@@ -1198,7 +1198,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 			reg->bus.caching = ttm_write_combined;
 		}
 #endif
-		if (drm->client.mem->oclass < NVIF_CLASS_MEM_NV50 ||
+		if (mmu->impl->mem.oclass < NVIF_CLASS_MEM_NV50 ||
 		    !mem->kind) {
 			/* untiled */
 			ret = 0;
@@ -1217,7 +1217,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 		else
 			reg->bus.caching = ttm_write_combined;
 
-		if (drm->client.mem->oclass >= NVIF_CLASS_MEM_NV50) {
+		if (mmu->impl->mem.oclass >= NVIF_CLASS_MEM_NV50) {
 			union {
 				struct nv50_mem_map_v0 nv50;
 				struct gf100_mem_map_v0 gf100;
@@ -1225,7 +1225,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 			u64 handle, length;
 			u32 argc = 0;
 
-			switch (mem->mem.object.oclass) {
+			switch (mmu->impl->mem.oclass) {
 			case NVIF_CLASS_MEM_NV50:
 				args.nv50.version = 0;
 				args.nv50.ro = 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 636ca1f284f8..dd4f9915ccaf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -328,7 +328,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 
 	/* allocate userd */
 	if (oclass >= VOLTA_CHANNEL_GPFIFO_A) {
-		ret = nvif_mem_ctor(&cli->mmu, "abi16ChanUSERD", NVIF_CLASS_MEM_GF100,
+		ret = nvif_mem_ctor(&cli->mmu, "abi16ChanUSERD",
 				    NVIF_MEM_VRAM | NVIF_MEM_COHERENT | NVIF_MEM_MAPPABLE,
 				    0, PAGE_SIZE, NULL, 0, &chan->mem_userd);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 1dba64a1e590..8ab6b9e03eb5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -194,22 +194,6 @@ static int
 nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		 struct nouveau_cli *cli)
 {
-	static const struct nvif_mclass
-	mems[] = {
-		{ NVIF_CLASS_MEM_GF100, -1 },
-		{ NVIF_CLASS_MEM_NV50 , -1 },
-		{ NVIF_CLASS_MEM_NV04 , -1 },
-		{}
-	};
-	static const struct nvif_mclass
-	vmms[] = {
-		{ NVIF_CLASS_VMM_GP100, -1 },
-		{ NVIF_CLASS_VMM_GM200, -1 },
-		{ NVIF_CLASS_VMM_GF100, -1 },
-		{ NVIF_CLASS_VMM_NV50 , -1 },
-		{ NVIF_CLASS_VMM_NV04 , -1 },
-		{}
-	};
 	int ret;
 
 	snprintf(cli->name, sizeof(cli->name), "%s", sname);
@@ -242,26 +226,12 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		goto done;
 	}
 
-	ret = nvif_mclass(&cli->mmu.object, vmms);
-	if (ret < 0) {
-		NV_PRINTK(err, cli, "No supported VMM class\n");
-		goto done;
-	}
-
-	ret = nouveau_vmm_init(cli, vmms[ret].oclass, &cli->vmm);
+	ret = nouveau_vmm_init(cli, &cli->vmm);
 	if (ret) {
 		NV_PRINTK(err, cli, "VMM allocation failed: %d\n", ret);
 		goto done;
 	}
 
-	ret = nvif_mclass(&cli->mmu.object, mems);
-	if (ret < 0) {
-		NV_PRINTK(err, cli, "No supported MEM class\n");
-		goto done;
-	}
-
-	cli->mem = &mems[ret];
-
 	/* Don't pass in the (shared) sched_wq in order to let
 	 * nouveau_sched_create() create a dedicated one for VM_BIND jobs.
 	 *
@@ -574,6 +544,28 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 		goto fail_nvif;
 	}
 
+	switch (drm->mmu.impl->mem.oclass) {
+	case NVIF_CLASS_MEM_GF100:
+	case NVIF_CLASS_MEM_NV50:
+	case NVIF_CLASS_MEM_NV04:
+		break;
+	default:
+		NV_ERROR(drm, "No supported MEM class (0x%04x)\n", drm->mmu.impl->mem.oclass);
+		goto fail_nvif;
+	}
+
+	switch (drm->mmu.impl->vmm.oclass) {
+	case NVIF_CLASS_VMM_GP100:
+	case NVIF_CLASS_VMM_GM200:
+	case NVIF_CLASS_VMM_GF100:
+	case NVIF_CLASS_VMM_NV50:
+	case NVIF_CLASS_VMM_NV04:
+		break;
+	default:
+		NV_ERROR(drm, "No supported VMM class (0x%04x)\n", drm->mmu.impl->vmm.oclass);
+		goto fail_nvif;
+	}
+
 	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 35dfc95b32ed..38d33a4d5c49 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -100,8 +100,6 @@ struct nouveau_cli {
 
 	struct nouveau_sched *sched;
 
-	const struct nvif_mclass *mem;
-
 	struct list_head head;
 	void *abi16;
 	struct list_head objects;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index baea74899fcf..75abd545c92d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -90,7 +90,6 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_drm *drm = mem->drm;
-	struct nouveau_cli *cli = &drm->cli;
 	struct nvif_mmu *mmu = &drm->mmu;
 	struct nvif_mem_ram_v0 args = {};
 	u8 type;
@@ -115,7 +114,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 		args.dma = tt->dma_address;
 
 	mutex_lock(&drm->client_mutex);
-	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
+	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", type, PAGE_SHIFT,
 				 reg->size,
 				 &args, sizeof(args), &mem->mem);
 	mutex_unlock(&drm->client_mutex);
@@ -127,15 +126,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_drm *drm = mem->drm;
-	struct nouveau_cli *cli = &drm->cli;
 	struct nvif_mmu *mmu = &drm->mmu;
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
 	mutex_lock(&drm->client_mutex);
-	switch (cli->mem->oclass) {
+	switch (drm->mmu.impl->mem.oclass) {
 	case NVIF_CLASS_MEM_GF100:
-		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
+		ret = nvif_mem_ctor_type(mmu, "ttmVram",
 					 drm->ttm.type_vram, page, size,
 					 &(struct gf100_mem_v0) {
 						.contig = contig,
@@ -143,7 +141,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 					 &mem->mem);
 		break;
 	case NVIF_CLASS_MEM_NV50:
-		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
+		ret = nvif_mem_ctor_type(mmu, "ttmVram",
 					 drm->ttm.type_vram, page, size,
 					 &(struct nv50_mem_v0) {
 						.bankswz = mmu->kind[mem->kind] == 2,
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 477336672652..a478b5a9ed0a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -346,8 +346,7 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 	 * All future channel/memory allocations will make use of this
 	 * VMM instead of the standard one.
 	 */
-	ret = nvif_vmm_ctor(&cli->mmu, "svmVmm",
-			    cli->vmm.vmm.object.oclass, MANAGED,
+	ret = nvif_vmm_ctor(&cli->mmu, "svmVmm", MANAGED,
 			    args->unmanaged_addr, args->unmanaged_size,
 			    &(struct gp100_vmm_v0) {
 				.fault_replay = true,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 0a0a11dc9ec0..d35096071c1a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1865,8 +1865,7 @@ nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
-	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
-			    cli->vmm.vmm.object.oclass, RAW,
+	ret = nvif_vmm_ctor(&cli->mmu, "uvmm", RAW,
 			    init->kernel_managed_addr,
 			    init->kernel_managed_size,
 			    NULL, 0, &uvmm->vmm.vmm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.c b/drivers/gpu/drm/nouveau/nouveau_vmm.c
index 3dda885df5b2..93807d21ceff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.c
@@ -129,9 +129,9 @@ nouveau_vmm_fini(struct nouveau_vmm *vmm)
 }
 
 int
-nouveau_vmm_init(struct nouveau_cli *cli, s32 oclass, struct nouveau_vmm *vmm)
+nouveau_vmm_init(struct nouveau_cli *cli, struct nouveau_vmm *vmm)
 {
-	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", oclass, UNMANAGED,
+	int ret = nvif_vmm_ctor(&cli->mmu, "drmVmm", UNMANAGED,
 				PAGE_SIZE, 0, NULL, 0, &vmm->vmm);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_vmm.h b/drivers/gpu/drm/nouveau/nouveau_vmm.h
index 2b98d975f37e..196d8a819617 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_vmm.h
@@ -28,6 +28,6 @@ struct nouveau_vmm {
 	struct nouveau_svmm *svmm;
 };
 
-int nouveau_vmm_init(struct nouveau_cli *, s32 oclass, struct nouveau_vmm *);
+int nouveau_vmm_init(struct nouveau_cli *, struct nouveau_vmm *);
 void nouveau_vmm_fini(struct nouveau_vmm *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvif/mem.c b/drivers/gpu/drm/nouveau/nvif/mem.c
index 0e1b7b4c2e91..0f0b4a7c5e80 100644
--- a/drivers/gpu/drm/nouveau/nvif/mem.c
+++ b/drivers/gpu/drm/nouveau/nvif/mem.c
@@ -28,7 +28,7 @@ int
 nvif_mem_ctor_map(struct nvif_mmu *mmu, const char *name, u8 type, u64 size,
 		  struct nvif_mem *mem)
 {
-	int ret = nvif_mem_ctor(mmu, name, mmu->mem, NVIF_MEM_MAPPABLE | type,
+	int ret = nvif_mem_ctor(mmu, name, NVIF_MEM_MAPPABLE | type,
 				0, size, NULL, 0, mem);
 	if (ret == 0) {
 		ret = nvif_object_map(&mem->object, NULL, 0);
@@ -45,7 +45,7 @@ nvif_mem_dtor(struct nvif_mem *mem)
 }
 
 int
-nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name, s32 oclass,
+nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
 		   int type, u8 page, u64 size, void *argv, u32 argc,
 		   struct nvif_mem *mem)
 {
@@ -69,7 +69,7 @@ nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name, s32 oclass,
 	args->size = size;
 	memcpy(args->data, argv, argc);
 
-	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifMem", 0, oclass,
+	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifMem", 0, mmu->impl->mem.oclass,
 			       args, sizeof(*args) + argc, &mem->object);
 	if (ret == 0) {
 		mem->type = mmu->type[type].type;
@@ -85,7 +85,7 @@ nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name, s32 oclass,
 }
 
 int
-nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, u8 type,
+nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, u8 type,
 	      u8 page, u64 size, void *argv, u32 argc, struct nvif_mem *mem)
 {
 	int ret = -EINVAL, i;
@@ -94,7 +94,7 @@ nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass, u8 type,
 
 	for (i = 0; ret && i < mmu->type_nr; i++) {
 		if ((mmu->type[i].type & type) == type) {
-			ret = nvif_mem_ctor_type(mmu, name, oclass, i, page,
+			ret = nvif_mem_ctor_type(mmu, name, i, page,
 						 size, argv, argc, mem);
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index cc15cf99462c..7e592a6d8530 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -42,12 +42,6 @@ nvif_mmu_dtor(struct nvif_mmu *mmu)
 int
 nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu)
 {
-	static const struct nvif_mclass mems[] = {
-		{ NVIF_CLASS_MEM_GF100, -1 },
-		{ NVIF_CLASS_MEM_NV50 , -1 },
-		{ NVIF_CLASS_MEM_NV04 , -1 },
-		{}
-	};
 	const s32 oclass = device->impl->mmu.oclass;
 	int ret, i;
 
@@ -68,11 +62,6 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 	mmu->type_nr = mmu->impl->type_nr;
 	mmu->kind_nr = mmu->impl->kind_nr;
 
-	ret = nvif_mclass(&mmu->object, mems);
-	if (ret < 0)
-		goto done;
-	mmu->mem = mems[ret].oclass;
-
 	mmu->heap = kmalloc_array(mmu->heap_nr, sizeof(*mmu->heap),
 				  GFP_KERNEL);
 	mmu->type = kmalloc_array(mmu->type_nr, sizeof(*mmu->type),
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index 99296f03371a..2738ea9229cc 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -196,7 +196,7 @@ nvif_vmm_dtor(struct nvif_vmm *vmm)
 }
 
 int
-nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
+nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name,
 	      enum nvif_vmm_type type, u64 addr, u64 size, void *argv, u32 argc,
 	      struct nvif_vmm *vmm)
 {
@@ -225,7 +225,7 @@ nvif_vmm_ctor(struct nvif_mmu *mmu, const char *name, s32 oclass,
 	memcpy(args->data, argv, argc);
 
 	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifVmm", 0,
-			       oclass, args, argn, &vmm->object);
+			       mmu->impl->vmm.oclass, args, argn, &vmm->object);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index f97dec6c3309..9f44d469b4da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -186,6 +186,10 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	ummu->impl.type_nr = mmu->type_nr;
 	ummu->impl.kind_nr = kinds;
 
+	ummu->impl.mem.oclass = mmu->func->mem.user.oclass;
+
+	ummu->impl.vmm.oclass = mmu->func->vmm.user.oclass;
+
 	*pimpl = &ummu->impl;
 	*ppriv = ummu;
 	*pobject = &ummu->object;
-- 
2.41.0

