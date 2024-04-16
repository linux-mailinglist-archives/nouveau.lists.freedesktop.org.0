Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7588A793F
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D9D112FE7;
	Tue, 16 Apr 2024 23:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EF1j9RJ+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C1A112FDA
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klemb0g3j4XqImXRIU2xs+htvf/rOrBEuvzAy0dRskWS6xEPbUatDhfu2SBKi48la4cFtQlbKyfOfWTeJfFy1LZ3OhDjhFm6obHuhjKOarng+BsXS77MX0legXJ2F0gzRsqykQ3Nfm6WT+zXXKE59+jUKX2Jqpzq5tAE4fX7Gykk5LMAuDx7aghx4Lrn05eM+m60yG/8mmlMncV3efPH4ptoBM7zbVoShstIOvsiOpgd6hE9AYzGx4GpMwal3Q5NGZDjYQ0Oyeuaq3BcQ6tRzjAPKhhW3Nac773sSpGJcZvlX1Oe68o0GEx+md2pIXjSQcL3IKnQOsZWTsiHF/Ybbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAjywBrtyi4Vh67AGi+GbfvyyPcSMCswR8AxK42w7nM=;
 b=RG0pXSBrQz5LpeljUxcMs2E40auLn5JrsGnbssRE8piFjaS010zs7kHnXJ2uME7fe6NQGg4wi+YgSbUAJVeIEJSdYeRjB+qu3LQ1IBx4ad+b15N3xx5bgyS97LbsB9m6Zgu+EdxdSbRd87CWGxOGyZDXTBh9MC4876OtcMDVKRAuedtRorMq7gqPW3+YOuNfZFyJSWZb5CMyrQu+HrZOP6d1QN5FYa3cpYNfTYD3IyYr8IJ6BR+7Qb7VQfTQ02+HVRAaF7sZ5oGr+diJirWGPz40JJ/av1msGZCrQkNQtNc9WHBZpZgtDELIZMm6QL7eVWxfPMQ9iNSk7+Y8g2SEDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAjywBrtyi4Vh67AGi+GbfvyyPcSMCswR8AxK42w7nM=;
 b=EF1j9RJ+B7WO54EZZEOdW+zaIiXWpqe9b11ZGL4bb4q62nhmuArvwPQzQzqrp+4o9OXitkl1d+77waAiHOjgoUZi6uxqSKBYZ4Fz6HOkn1l+jiY0C8HghVm+JVeK8SAsYP0l8fPudqRyuFngPEUArGSE4mmeEcykYDFGtPtGXax125aOcoJQccavPXPlvCdWVDrDT/MgVNqysf77goUnQEOJ3UrPmoCyZgnRYVd0y6e6PlXgEh92VI9xyu2X/sMdbGhPsDtIXUz353YxXg0RBwQxoBXFW82yY+quScO2VWk2FoNY8TrKHzBsoZKo4mGf8lrAH4CwyqTt42yDZPsjRg==
Received: from CH0PR13CA0035.namprd13.prod.outlook.com (2603:10b6:610:b2::10)
 by PH0PR12MB7487.namprd12.prod.outlook.com (2603:10b6:510:1e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:31 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::f3) by CH0PR13CA0035.outlook.office365.com
 (2603:10b6:610:b2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:07 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:06 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 137/156] drm/nouveau/nvif: remove mem from object rb
Date: Wed, 17 Apr 2024 09:39:43 +1000
Message-ID: <20240416234002.19509-138-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH0PR12MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: b1573539-96f0-4121-6757-08dc5e6f05db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o+h7rlrNQZ3xH7q+RGIvlTI6zQH+hpJPOZIdWrzk8l5o4Bdl2ajls0QdUaBx?=
 =?us-ascii?Q?UlfwGVxhwKzA0KJv+tj3dNccfiIBbRObnjlH20ocrkQUhngXEiv+9IB8mUNe?=
 =?us-ascii?Q?sSqpVmVKwkt/z3dzjjGOWgiS7OM4Cc+ZC1D/Yiu0I2JWw8QbP25tyb6hCAdY?=
 =?us-ascii?Q?Vzqc/7W/TrEu8u94JZcsVWv6rDBFmldOha5J6mRulyVNBnWh39zmEu2hgSoz?=
 =?us-ascii?Q?886HHTb+laTh7DnSlsTDUBsvz1AK9myrxqnvHTjYMN5jZiQRu//GIRJtKppZ?=
 =?us-ascii?Q?j39mVla6lDtPSElDSamtuWQmhqqHziEEELFlNmf6KHW0mZPkvj2NHiosL1wx?=
 =?us-ascii?Q?c9Y8gSUz184/HGYRhCaHbn/uCnGlzxzJ8PvgWbqOSsKc56fp8X+7c/JljuAS?=
 =?us-ascii?Q?n8GgFefeHzUxowv0YGqVCT2ztU68w04rgZCCWBYoPO+VRxAh1+N4jCwr5MLC?=
 =?us-ascii?Q?Y03pRl7eLryQqsZ6g2I1BRFw/Izid9WblKehFweeq5r9sveOkN7C66DMFWpH?=
 =?us-ascii?Q?wZdR8GxFFXcLq6dOQa+hD6/l7a4oD+UgaBWzDmV5TQ7AKrAlaa5H6mMyP74H?=
 =?us-ascii?Q?dKwn+BewzDEx4fqlY4Xyj/4v3IG4OJ7KRBsUT/PASwHUpO67qFXSKFpBUsVw?=
 =?us-ascii?Q?xb/wjmx4Zok9TE7XVqtZ+/t7rx3h7G3IWVlzEke57Y3StAVuU2jEE8AczpM8?=
 =?us-ascii?Q?IDwmba5S0Oa/XWOgAxnQ8YjIsrzP7mnVS6Y7zYRvlTbo11ZiuHXSSuEnlo+V?=
 =?us-ascii?Q?9UDR6Pwr1rsep1cFgUgcPbu1kBd3KfuTb1A+arue4ETn/iu+jAxFBRKKewKa?=
 =?us-ascii?Q?GoUYVZsuq9aQS6mhfH9xMbpAyBaSX6Fg/xJ3p5xTW2Oa0dgSjVFBaEXNc2MN?=
 =?us-ascii?Q?o7ExEi8/A7VU76PlFYIOMZ9YqRP90IsoEJj0oqOYJQyHvIS8AW1LhTn2vWFd?=
 =?us-ascii?Q?RYsSxPwksvkSzQNGhVZhZI/E9ACPMHmy8UxuqJUiMRZaYEtnYXclVNseJw2B?=
 =?us-ascii?Q?/a3yCapcrQPVU3zWD7LX7ykMsb19iO+KAOUbdf9HJLFo9rcxcHE/WqUk417z?=
 =?us-ascii?Q?YaBVZtjk+QpTnjRWPtU3LYji9+MKDXIIJZor8RMzKcgtNNH8j/tBmHZ8XwZi?=
 =?us-ascii?Q?YzhyDrbCgJ+weB6wosmdvP8Nh4LLc+nKWJu9hOq7aSLVS4WRfkvb2tRNPN9L?=
 =?us-ascii?Q?ltzmMkSKKvgqmNZKre6G4CkWCfiiApXAJ4HvEYAT7BNQXe7J1ck9yu85bQcP?=
 =?us-ascii?Q?IQ4cI9zt5eCqZJcREcfi6PdBMloRxwsHK0UMgSTTzd5ZPw+ccEzOcvXaf6oK?=
 =?us-ascii?Q?VR2KFtoAPXwvVclfTRhmZ7Zszu4RgXNES6ux/FFIGlAr1nDTp62qCUY0GxTg?=
 =?us-ascii?Q?iaKyvik=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:31.0851 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1573539-96f0-4121-6757-08dc5e6f05db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7487
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

- also removes umem list hack
- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  4 ---
 drivers/gpu/drm/nouveau/nvif/mem.c            |  3 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |  2 --
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    | 36 -------------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    |  5 +--
 6 files changed, 5 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index cc858955a97b..0a460eaaf76b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -202,7 +202,7 @@ struct nvif_mmu_impl {
 	struct {
 		s32 oclass;
 		int (*new)(struct nvif_mmu_priv *, u8 type, u8 page, u64 size, void *argv, u32 argc,
-			   const struct nvif_mem_impl **, struct nvif_mem_priv **, u64 handle);
+			   const struct nvif_mem_impl **, struct nvif_mem_priv **);
 	} mem;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index f2d23bfdf29a..6a1472b9499f 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -109,7 +109,6 @@ int nvkm_vmm_map(struct nvkm_vmm *, struct nvkm_vma *, void *argv, u32 argc,
 		 struct nvkm_vmm_map *);
 void nvkm_vmm_unmap(struct nvkm_vmm *, struct nvkm_vma *);
 
-struct nvkm_memory *nvkm_umem_search(struct nvkm_mmu *, struct nvkm_client *, u64);
 struct nvkm_vmm *nvkm_uvmm_search(struct nvkm_client *, u64 handle);
 
 struct nvkm_mmu {
@@ -148,9 +147,6 @@ struct nvkm_mmu {
 	struct mutex mutex; /* serialises mmu invalidations */
 
 	struct nvkm_device_oclass user;
-
-	spinlock_t umem_lock;
-	struct list_head umem;
 };
 
 int nv04_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
diff --git a/drivers/gpu/drm/nouveau/nvif/mem.c b/drivers/gpu/drm/nouveau/nvif/mem.c
index 91faecc4c080..3aa04ed651c8 100644
--- a/drivers/gpu/drm/nouveau/nvif/mem.c
+++ b/drivers/gpu/drm/nouveau/nvif/mem.c
@@ -105,8 +105,7 @@ nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
 	if (type < 0)
 		return -EINVAL;
 
-	ret = mmu->impl->mem.new(mmu->priv, type, page, size, argv, argc, &mem->impl, &mem->priv,
-				 nvif_handle(&mem->object));
+	ret = mmu->impl->mem.new(mmu->priv, type, page, size, argv, argc, &mem->impl, &mem->priv);
 	NVIF_DEBUG(&mmu->object, "[NEW mem%08x] (ret:%d)", oclass, ret);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index 08ad3ed84631..c7fe7222c3a3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -427,8 +427,6 @@ nvkm_mmu_ctor(const struct nvkm_mmu_func *func, struct nvkm_device *device,
 	nvkm_mmu_ptc_init(mmu);
 	mutex_init(&mmu->mutex);
 	mmu->user.base = func->mmu.user;
-	spin_lock_init(&mmu->umem_lock);
-	INIT_LIST_HEAD(&mmu->umem);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index 0676615093bb..93324d4f9d22 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -57,35 +57,6 @@ nvkm_umem_ref(struct nvif_mem_priv *umem)
 	return NULL;
 }
 
-static const struct nvkm_object_func nvkm_umem;
-struct nvkm_memory *
-nvkm_umem_search(struct nvkm_mmu *mmu, struct nvkm_client *client, u64 handle)
-{
-	struct nvkm_client *master = client->object.client;
-	struct nvkm_memory *memory = NULL;
-	struct nvkm_object *object;
-	struct nvif_mem_priv *umem;
-
-	object = nvkm_object_search(client, handle, &nvkm_umem);
-	if (IS_ERR(object)) {
-		if (client != master) {
-			spin_lock(&mmu->umem_lock);
-			list_for_each_entry(umem, &mmu->umem, head) {
-				if (umem->object.object == handle) {
-					memory = nvkm_memory_ref(umem->memory);
-					break;
-				}
-			}
-			spin_unlock(&mmu->umem_lock);
-		}
-	} else {
-		umem = container_of(object, typeof(*umem), object);
-		memory = nvkm_memory_ref(umem->memory);
-	}
-
-	return memory ? memory : ERR_PTR(-ENOENT);
-}
-
 static int
 nvkm_umem_unmap(struct nvif_mem_priv *umem)
 {
@@ -163,9 +134,6 @@ nvkm_umem_dtor(struct nvkm_object *object)
 {
 	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
 
-	spin_lock(&umem->mmu->umem_lock);
-	list_del_init(&umem->head);
-	spin_unlock(&umem->mmu->umem_lock);
 	nvkm_memory_unref(&umem->memory);
 	return umem;
 }
@@ -203,10 +171,6 @@ nvkm_umem_new(struct nvkm_mmu *mmu, u8 type, u8 page, u64 size, void *argv, u32
 	if (ret)
 		return ret;
 
-	spin_lock(&mmu->umem_lock);
-	list_add(&umem->head, &mmu->umem);
-	spin_unlock(&mmu->umem_lock);
-
 	umem->impl = nvkm_umem_impl;
 	umem->impl.page = nvkm_memory_page(umem->memory);
 	umem->impl.addr = nvkm_memory_addr(umem->memory);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 7afb68dc4bed..b3883758828d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -42,7 +42,7 @@ nvkm_ummu_vmm_new(struct nvif_mmu_priv *ummu, enum nvif_vmm_type type, u64 addr,
 
 static int
 nvkm_ummu_mem_new(struct nvif_mmu_priv *ummu, u8 type, u8 page, u64 size, void *argv, u32 argc,
-		  const struct nvif_mem_impl **pimpl, struct nvif_mem_priv **ppriv, u64 handle)
+		  const struct nvif_mem_impl **pimpl, struct nvif_mem_priv **ppriv)
 {
 	struct nvkm_object *object;
 	int ret;
@@ -51,7 +51,8 @@ nvkm_ummu_mem_new(struct nvif_mmu_priv *ummu, u8 type, u8 page, u64 size, void *
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(ummu->object.client, &ummu->object, handle, object);
+	nvkm_object_link(&ummu->object, object);
+	return 0;
 }
 
 static void
-- 
2.41.0

