Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9E18A7902
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDC0112F78;
	Tue, 16 Apr 2024 23:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gh6+XIzy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55262112F4D
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5zPCQ/Ve/y7TDRUszD8qRhfh/kuXNROmK+69shYn+vCgjhTZlIMtdUUBvAAg9kp09SPSTbwx1ymFidl47eepxDtdirC8kFPedBDRC6rlFflqJw8XKXot5c9dx/V1VDn/rlyFgLdO8UsbuU6SsqyBCgMFdYQhXJvT+Hy3zcFw0Vs5CnDzcb2JmMzWhJFHAeXlLPEyUQZiAt/2uwNTg37qxjC13mbU1U8VKGyH7iAIc0MfrFpqcN+byDxbZZD4cXNXYHUMHX9gFP6a84uS9G7c3wGanBe4hKVy5OgJ8p7UdbtAOO6hT2ZkfmEFSWNx0HUqD/YU0/VuvBqSbJoSIr9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNc3CNyXy6MthohaDRjmf+gJcCon4JznVBzJzG5nKOE=;
 b=UA/IRYJu6UvJ7PbA1MB/q8eZk3+SUAM+q3+J9POfbP7MuOIu1S0T5zjP7RmRFOJmHVVaqLwO+LKIkDhYwGYv3FXCicByXkoNmjFUoKEsR/FJAbyWhLT2+qpXk/ZSFwfR9uymTElIRpgH/KezEcC6DHWaOOFOok8YcS9GNH7jXCMhXZiX2rNj/HywRjxomdJE4nyXT33KkFkLO38Gxp1CP/xl6E6FLw40rHqFzA6abOnSz9lBh6j06aDcLsxuOhEF2kudB/zDWWFCbPuWNpwGXbN6nZXAQ6SgQbuTZwdBQDmyPhcQASshry2Um/QdaUhbr1JiTrFCVesluORz9wIq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNc3CNyXy6MthohaDRjmf+gJcCon4JznVBzJzG5nKOE=;
 b=Gh6+XIzydFUsE1WU/Uhq+Th7KDDFr0i6p2vdBobXDH5pm+B19aGCDTBHavN5w1+NpOXbcLmKT67LSQ2hIS1+L7uN5UcQklGvJpIboh/4uN1+BEWvvvexbnq+ohaBB9FuZJzoM7qrE2aN8A7x0GVMFwzVQGDDhT4VGn2XPQu6Yw3uuOSVMK0NjDo5P5rnqtaljvIlBxEFTKSVpXfWmHGfg3C5sO6z63QY4hTlSfdckMpN8XrTh4CF50sOJhjRiUF445d9gbTtKGOG21Goa+TuvJau3FKFsmD9vDVgvj8Y0VljF4K520xMGOhRmFhJ/mQfUPlVTFQ66tjdEMKKW+aIOw==
Received: from CH0PR13CA0050.namprd13.prod.outlook.com (2603:10b6:610:b2::25)
 by MW6PR12MB8865.namprd12.prod.outlook.com (2603:10b6:303:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:20 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::7f) by CH0PR13CA0050.outlook.office365.com
 (2603:10b6:610:b2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.19 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:03 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:02 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 081/156] drm/nouveau/nvif: rework mmu "type" api
Date: Wed, 17 Apr 2024 09:38:47 +1000
Message-ID: <20240416234002.19509-82-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MW6PR12MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc6028e-848c-4098-c75c-08dc5e6edb50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/3bE424tbey+Wa3l3Hs7u0aWLfzd7a2wwepHk2+lGBqHWWeoGkzm5XVjvQ3+aUx/DWmlZ3qgNDcoAEwXWNxNssD1NuYuhsMI1V49pdgywiuKx6VYHVmP/wjmW15eXoLqghqmy270Y40SqzVV5ewYEbU0GcsSbD2ch2oePpkjO4Kd3P5qfwQYsY4w0Ou8UuV4gtJS6JvZNjBPHYN8znuWy1pKuZzM/4I8BRAYB1qV6m6oyGKxCG9PLvk9js5um/b8KA8lTV21uR2MngP7C8ZbQlyQF0eZ9oJhx7nftO6boF9L2CDgkwSJ2hYgUliYpkYqOFQZlUqDeGKujabmOHh09qSNIdAgRMhHERqTODh7/Ce3pQvPGU+WI41+YQsOJL0SzW2qVTY2grALQCeZldxBigPej92RLclTyXAUUJqak1LztMSnULC8YgouqLdYNjOvPKoWZJbttRBC3clmlysWOdBGetak1lUwZjcYLK0cYFjnRnkNGUsuR/YnJ/k7gDrY83tEFnVENDk2MiWuxZv6qbfRnO7aeXREfsltOtpacHmp94UbkRn6tPh30JsXy6GvSH+kT6obnfAgCSvJP0QPCRYR6hMxy35fkwaQk5vFnNCH+bE5x/vAbmQx7+TX57Jpw8TfmIfL5FuTWqhQFjQWB7gvWZEE5d5SV3C+ER9CkFnhvCE6y94qNvSSgWFwNEwzMDJyY3WpCSlkNLLD1PmcUGCprflb56x1fflkMXb24u9Hr0F4aojINL474Y1AUrx
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:19.7123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc6028e-848c-4098-c75c-08dc5e6edb50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8865
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 13 ++++++
 drivers/gpu/drm/nouveau/include/nvif/if0008.h | 15 -------
 drivers/gpu/drm/nouveau/include/nvif/mmu.h    | 18 +-------
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  5 ++-
 drivers/gpu/drm/nouveau/nouveau_mem.c         |  4 +-
 drivers/gpu/drm/nouveau/nvif/mem.c            |  6 +--
 drivers/gpu/drm/nouveau/nvif/mmu.c            | 30 +------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 45 +++++++------------
 9 files changed, 40 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 9205c2c3b34e..fa08478cc38f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -89,6 +89,19 @@ struct nvif_mmu_impl {
 		u64 size;
 	} heap[4];
 
+	struct {
+#define NVIF_MEM_VRAM     0x01
+#define NVIF_MEM_HOST     0x02
+#define NVIF_MEM_COMP     0x04
+#define NVIF_MEM_DISP     0x08
+#define NVIF_MEM_KIND     0x10
+#define NVIF_MEM_MAPPABLE 0x20
+#define NVIF_MEM_COHERENT 0x40
+#define NVIF_MEM_UNCACHED 0x80
+		u8 type;
+		u8 heap;
+	} type[16];
+
 	struct {
 		s32 oclass;
 	} mem;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0008.h b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
index 551bdf49d6e2..0413e7e4ca0c 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0008.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
@@ -1,23 +1,8 @@
 #ifndef __NVIF_IF0008_H__
 #define __NVIF_IF0008_H__
 
-#define NVIF_MMU_V0_TYPE                                                   0x01
 #define NVIF_MMU_V0_KIND                                                   0x02
 
-struct nvif_mmu_type_v0 {
-	__u8  version;
-	__u8  index;
-	__u8  heap;
-	__u8  vram;
-	__u8  host;
-	__u8  comp;
-	__u8  disp;
-	__u8  kind;
-	__u8  mappable;
-	__u8  coherent;
-	__u8  uncached;
-};
-
 struct nvif_mmu_kind_v0 {
 	__u8  version;
 	__u8  kind_inv;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mmu.h b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
index ff4938911621..203328a2d611 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
@@ -8,23 +8,9 @@ struct nvif_mmu {
 	const struct nvif_mmu_impl *impl;
 	struct nvif_mmu_priv *priv;
 	struct nvif_object object;
-	u8  type_nr;
 	u8  kind_inv;
 	u16 kind_nr;
 
-	struct {
-#define NVIF_MEM_VRAM                                                      0x01
-#define NVIF_MEM_HOST                                                      0x02
-#define NVIF_MEM_COMP                                                      0x04
-#define NVIF_MEM_DISP                                                      0x08
-#define NVIF_MEM_KIND                                                      0x10
-#define NVIF_MEM_MAPPABLE                                                  0x20
-#define NVIF_MEM_COHERENT                                                  0x40
-#define NVIF_MEM_UNCACHED                                                  0x80
-		u8 type;
-		u8 heap;
-	} *type;
-
 	u8 *kind;
 };
 
@@ -45,8 +31,8 @@ static inline int
 nvif_mmu_type(struct nvif_mmu *mmu, u8 mask)
 {
 	int i;
-	for (i = 0; i < mmu->type_nr; i++) {
-		if ((mmu->type[i].type & mask) == mask)
+	for (i = 0; i < mmu->impl->type_nr; i++) {
+		if ((mmu->impl->type[i].type & mask) == mask)
 			return i;
 	}
 	return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index cbb8f54db83f..08d522aaae38 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1212,7 +1212,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 
 		/* Some BARs do not support being ioremapped WC */
 		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA &&
-		    mmu->type[drm->ttm.type_vram].type & NVIF_MEM_UNCACHED)
+		    mmu->impl->type[drm->ttm.type_vram].type & NVIF_MEM_UNCACHED)
 			reg->bus.caching = ttm_uncached;
 		else
 			reg->bus.caching = ttm_write_combined;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 38d33a4d5c49..823fa6d87690 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -318,8 +318,9 @@ nouveau_drm(struct drm_device *dev)
 static inline bool
 nouveau_drm_use_coherent_gpu_mapping(struct nouveau_drm *drm)
 {
-	struct nvif_mmu *mmu = &drm->client.mmu;
-	return !(mmu->type[drm->ttm.type_host[0]].type & NVIF_MEM_UNCACHED);
+	struct nvif_mmu *mmu = &drm->mmu;
+
+	return !(mmu->impl->type[drm->ttm.type_host[0]].type & NVIF_MEM_UNCACHED);
 }
 
 int nouveau_pmops_suspend(struct device *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 75abd545c92d..554500a650db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -100,9 +100,9 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 	else
 		type = drm->ttm.type_host[0];
 
-	if (mem->kind && !(mmu->type[type].type & NVIF_MEM_KIND))
+	if (mem->kind && !(mmu->impl->type[type].type & NVIF_MEM_KIND))
 		mem->comp = mem->kind = 0;
-	if (mem->comp && !(mmu->type[type].type & NVIF_MEM_COMP)) {
+	if (mem->comp && !(mmu->impl->type[type].type & NVIF_MEM_COMP)) {
 		if (mmu->object.oclass >= NVIF_CLASS_MMU_GF100)
 			mem->kind = mmu->kind[mem->kind];
 		mem->comp = 0;
diff --git a/drivers/gpu/drm/nouveau/nvif/mem.c b/drivers/gpu/drm/nouveau/nvif/mem.c
index 0f0b4a7c5e80..600fe051be11 100644
--- a/drivers/gpu/drm/nouveau/nvif/mem.c
+++ b/drivers/gpu/drm/nouveau/nvif/mem.c
@@ -72,7 +72,7 @@ nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
 	ret = nvif_object_ctor(&mmu->object, name ? name : "nvifMem", 0, mmu->impl->mem.oclass,
 			       args, sizeof(*args) + argc, &mem->object);
 	if (ret == 0) {
-		mem->type = mmu->type[type].type;
+		mem->type = mmu->impl->type[type].type;
 		mem->page = args->page;
 		mem->addr = args->addr;
 		mem->size = args->size;
@@ -92,8 +92,8 @@ nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, u8 type,
 
 	mem->object.client = NULL;
 
-	for (i = 0; ret && i < mmu->type_nr; i++) {
-		if ((mmu->type[i].type & type) == type) {
+	for (i = 0; ret && i < mmu->impl->type_nr; i++) {
+		if ((mmu->impl->type[i].type & type) == type) {
 			ret = nvif_mem_ctor_type(mmu, name, i, page,
 						 size, argv, argc, mem);
 		}
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index ec5ec8be98c0..e727a6587658 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -33,7 +33,6 @@ nvif_mmu_dtor(struct nvif_mmu *mmu)
 		return;
 
 	kfree(mmu->kind);
-	kfree(mmu->type);
 	mmu->impl->del(mmu->priv);
 	mmu->impl = NULL;
 }
@@ -42,10 +41,9 @@ int
 nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu)
 {
 	const s32 oclass = device->impl->mmu.oclass;
-	int ret, i;
+	int ret;
 
 	mmu->impl = NULL;
-	mmu->type = NULL;
 	mmu->kind = NULL;
 
 	ret = device->impl->mmu.new(device->priv, &mmu->impl, &mmu->priv,
@@ -56,39 +54,13 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 
 	nvif_object_ctor(&device->object, name ?: "nvifMmu", 0, oclass, &mmu->object);
 
-	mmu->type_nr = mmu->impl->type_nr;
 	mmu->kind_nr = mmu->impl->kind_nr;
 
-	mmu->type = kmalloc_array(mmu->type_nr, sizeof(*mmu->type),
-				  GFP_KERNEL);
-	if (ret = -ENOMEM, !mmu->type)
-		goto done;
-
 	mmu->kind = kmalloc_array(mmu->kind_nr, sizeof(*mmu->kind),
 				  GFP_KERNEL);
 	if (!mmu->kind && mmu->kind_nr)
 		goto done;
 
-	for (i = 0; i < mmu->type_nr; i++) {
-		struct nvif_mmu_type_v0 args = { .index = i };
-
-		ret = nvif_object_mthd(&mmu->object, NVIF_MMU_V0_TYPE,
-				       &args, sizeof(args));
-		if (ret)
-			goto done;
-
-		mmu->type[i].type = 0;
-		if (args.vram) mmu->type[i].type |= NVIF_MEM_VRAM;
-		if (args.host) mmu->type[i].type |= NVIF_MEM_HOST;
-		if (args.comp) mmu->type[i].type |= NVIF_MEM_COMP;
-		if (args.disp) mmu->type[i].type |= NVIF_MEM_DISP;
-		if (args.kind    ) mmu->type[i].type |= NVIF_MEM_KIND;
-		if (args.mappable) mmu->type[i].type |= NVIF_MEM_MAPPABLE;
-		if (args.coherent) mmu->type[i].type |= NVIF_MEM_COHERENT;
-		if (args.uncached) mmu->type[i].type |= NVIF_MEM_UNCACHED;
-		mmu->type[i].heap = args.heap;
-	}
-
 	if (mmu->kind_nr) {
 		struct nvif_mmu_kind_v0 *kind;
 		size_t argc = struct_size(kind, data, mmu->kind_nr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 9a42721eabd8..8be5b1034bc1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -53,35 +53,6 @@ nvkm_ummu_sclass(struct nvkm_object *object, int index,
 	return -EINVAL;
 }
 
-static int
-nvkm_ummu_type(struct nvkm_ummu *ummu, void *argv, u32 argc)
-{
-	struct nvkm_mmu *mmu = ummu->mmu;
-	union {
-		struct nvif_mmu_type_v0 v0;
-	} *args = argv;
-	int ret = -ENOSYS;
-	u8 type, index;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		if ((index = args->v0.index) >= mmu->type_nr)
-			return -EINVAL;
-		type = mmu->type[index].type;
-		args->v0.heap = mmu->type[index].heap;
-		args->v0.vram = !!(type & NVKM_MEM_VRAM);
-		args->v0.host = !!(type & NVKM_MEM_HOST);
-		args->v0.comp = !!(type & NVKM_MEM_COMP);
-		args->v0.disp = !!(type & NVKM_MEM_DISP);
-		args->v0.kind = !!(type & NVKM_MEM_KIND);
-		args->v0.mappable = !!(type & NVKM_MEM_MAPPABLE);
-		args->v0.coherent = !!(type & NVKM_MEM_COHERENT);
-		args->v0.uncached = !!(type & NVKM_MEM_UNCACHED);
-	} else
-		return ret;
-
-	return 0;
-}
-
 static int
 nvkm_ummu_kind(struct nvkm_ummu *ummu, void *argv, u32 argc)
 {
@@ -127,7 +98,6 @@ nvkm_ummu_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_mmu_priv *ummu = container_of(object, typeof(*ummu), object);
 	switch (mthd) {
-	case NVIF_MMU_V0_TYPE: return nvkm_ummu_type(ummu, argv, argc);
 	case NVIF_MMU_V0_KIND: return nvkm_ummu_kind(ummu, argv, argc);
 	default:
 		break;
@@ -164,9 +134,24 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	ummu->impl.heap_nr = mmu->heap_nr;
 	ummu->impl.type_nr = mmu->type_nr;
 	ummu->impl.kind_nr = kinds;
+
 	for (int i = 0; i < mmu->heap_nr; i++)
 		ummu->impl.heap[i].size = mmu->heap[i].size;
 
+	for (int i = 0; i < mmu->type_nr; i++) {
+		u8 type = mmu->type[i].type;
+
+		ummu->impl.type[i].type |= (type & NVKM_MEM_VRAM) ? NVIF_MEM_VRAM : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_HOST) ? NVIF_MEM_HOST : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_COMP) ? NVIF_MEM_COMP : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_DISP) ? NVIF_MEM_DISP : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_KIND) ? NVIF_MEM_KIND : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_MAPPABLE) ? NVIF_MEM_MAPPABLE : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_COHERENT) ? NVIF_MEM_COHERENT : 0;
+		ummu->impl.type[i].type |= (type & NVKM_MEM_UNCACHED) ? NVIF_MEM_UNCACHED : 0;
+		ummu->impl.type[i].heap = mmu->type[i].heap;
+	}
+
 	ummu->impl.mem.oclass = mmu->func->mem.user.oclass;
 
 	ummu->impl.vmm.oclass = mmu->func->vmm.user.oclass;
-- 
2.41.0

