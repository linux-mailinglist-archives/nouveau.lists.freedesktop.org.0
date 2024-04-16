Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D78A7900
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5D10F41A;
	Tue, 16 Apr 2024 23:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z93ZDkh3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D748112F7C
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jg8xEmzH8pYmlybMuArvLU1dMgGARkAqH8ONU10zWmdqi52q4nECwJV/zznYXd/9eLwbOO5gJ4GAruWTaKcmCYN3Bhzl8/1dUAnPrROuhrNeulJ55yuohaONRNjJAp4XmGkWCL/QMHrtijNPyUC85W0d1++x3xGCT3nMi3E9tubjF+/dRBeHfb9bQ/iJii8LBehx8rR9oDgIKGgIRWqutsxFIdwXQDjenrAHTM+KK83qFMFSXJAJ+VoGMxWhYaWRHrM201oL1ivLkBLmBNJiKfUCUN+Dc3YwhbhT69sh3f5cnkXf/S8akMgKY1nUlGeEyhJqkFcOJY4ZQ9jpM6KhYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E33znlFb4TxHZIf82Xvpdk04nhUwO/RiHuGiTaersCM=;
 b=SstkXJtNkkhNDTeBYX6BsI/QF3gQE6KHjVjk01aB7AlDZcf4sGPvtlfPBabQaqDYXSFLQxuMqmwn66s8pa6Xl4ii6RUEUESGoQW5OOTk2BlVTIofV55VCE/c1UeC16hHlmSNYIn/9mE+E092G5Ti7LofyWBZtYhxtBb8SOVRr4QY7ScbspwfpRXi+HeJdDoZuQsK9jP8rol1AvYHXuc2zTTPeFRNbLyKbI+pt8WexlJyrXspOpaJAGU5G6YqikY6aaKAqSP0Tz5mvxMDrbft14x3PR41aWsHKsm4XzNxvjNKSo2HAFrXaAK85FxIzyARmtrpxli7EbUkw2hY6zrQnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E33znlFb4TxHZIf82Xvpdk04nhUwO/RiHuGiTaersCM=;
 b=Z93ZDkh3ZKh67bF+OeUaH6Ue5vvzsd0+SPgGJ/ihgocxbz9cT4Nha5ctaJO1E9U4mOj/nidsQpHgkiKowDXO5YbVmNHYqywCoiD8KiBnfaEE4PQAftuKMSnv/lBJL7GSa1RTQHgP4EV3t6m4E9a8rIXj2CyOMNx5QdydkMLrhlkPsvqPEsV66uCRJGXy2qh5jJnRP8a2yZ31jo7UArJnxh46z9XPOira8u6V+OZ2W0Ge8KCiTiDMeYDfGTdN8cxdiX+opHr+YPC77cfXv9h9xfkXzTGUvB1JUrPvTNPiMPsPPv4AhN1btOsJaYLvauzTQTpIHAGGw/p0pvpOYwO6mg==
Received: from CH5P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::17)
 by DS7PR12MB8231.namprd12.prod.outlook.com (2603:10b6:8:db::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:22 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::8b) by CH5P222CA0008.outlook.office365.com
 (2603:10b6:610:1ee::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:02 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:01 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 080/156] drm/nouveau/nvif: rework mmu "heap" api
Date: Wed, 17 Apr 2024 09:38:46 +1000
Message-ID: <20240416234002.19509-81-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DS7PR12MB8231:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa34aea-7fef-40f5-52e8-08dc5e6edd1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7eJXIfHBDyYNY9ikYnjocvwPuGXPHFsWcqcNtB3B5edtBU2a2jyYAGmxsVNif8T76M1PAS0qY0WY5x5HFH3Gx/9+uMpMZSM3SnRGCOZhRuV7otqi1+VLaWpH4zAyAvvGjxenoC+Eyd+0Tn0gymfeJApvfJPRRNKkcq6L29t5zO2joMu3zgxb3n+EjiQwXasX6TqLLhrrlkEuPgj+9C/ao7DwHlHGUwUUm1N82lFgemqfxv3a7YuZu+mmaeq2lQ5psCmiz45Pz150XVo838T3FCXixzQAi1VH+l0r2eH4oNTcHYRa7AqV+pxulVb41UPpFvNB4EJ4fMKugM0fW9xyMvhTo1g+pYvGfowXYrTEb5gFgAB93dlm1l0YEbcELRR596hDF/1u7CL/ngKaObcGsjeyIU9SO/nIcgWFTjrgv4mAyj7B0mWtEg76Yv+XBYQamnJHr4UrKSielT0DooArw2lgu4u9k12mTQzftgb7TCWYFZxK5DooAEKnywvfPmKOIYaB6jwcgpr/YX1/Oy71Yr4vKbY7hFQ3LLW0xIIo/kMQnpsSHJOvG2/mL6OdRcmhN7wnl3ViA4714A70O8xas8F119Pl+bfskuTji9S37gGB9+/CjSYc6rzog7lHJe2OEr9ivBmgbSA7l36BY0CP3JpWcb0bDHlcEI//MPqUbOMcR+C4eJPIj9jlmE/CwdSgVCGXaWhjGt+TF6Ig9GB/VpjLXaigDeX4GssTlSS059ODZnW0OHTMo1eN+meqEVv1
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:22.6952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa34aea-7fef-40f5-52e8-08dc5e6edd1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8231
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  4 ++++
 drivers/gpu/drm/nouveau/include/nvif/if0008.h |  8 -------
 drivers/gpu/drm/nouveau/include/nvif/mmu.h    |  5 ----
 drivers/gpu/drm/nouveau/nvif/mmu.c            | 18 +--------------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 23 ++-----------------
 5 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index a1b97bc5e933..9205c2c3b34e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -85,6 +85,10 @@ struct nvif_mmu_impl {
 
 	u16 kind_nr;
 
+	struct {
+		u64 size;
+	} heap[4];
+
 	struct {
 		s32 oclass;
 	} mem;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0008.h b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
index 618df13762d3..551bdf49d6e2 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0008.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
@@ -1,17 +1,9 @@
 #ifndef __NVIF_IF0008_H__
 #define __NVIF_IF0008_H__
 
-#define NVIF_MMU_V0_HEAP                                                   0x00
 #define NVIF_MMU_V0_TYPE                                                   0x01
 #define NVIF_MMU_V0_KIND                                                   0x02
 
-struct nvif_mmu_heap_v0 {
-	__u8  version;
-	__u8  index;
-	__u8  pad02[6];
-	__u64 size;
-};
-
 struct nvif_mmu_type_v0 {
 	__u8  version;
 	__u8  index;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mmu.h b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
index ed5d011f4237..ff4938911621 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
@@ -8,15 +8,10 @@ struct nvif_mmu {
 	const struct nvif_mmu_impl *impl;
 	struct nvif_mmu_priv *priv;
 	struct nvif_object object;
-	u8  heap_nr;
 	u8  type_nr;
 	u8  kind_inv;
 	u16 kind_nr;
 
-	struct {
-		u64 size;
-	} *heap;
-
 	struct {
 #define NVIF_MEM_VRAM                                                      0x01
 #define NVIF_MEM_HOST                                                      0x02
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index 7e592a6d8530..ec5ec8be98c0 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -34,7 +34,6 @@ nvif_mmu_dtor(struct nvif_mmu *mmu)
 
 	kfree(mmu->kind);
 	kfree(mmu->type);
-	kfree(mmu->heap);
 	mmu->impl->del(mmu->priv);
 	mmu->impl = NULL;
 }
@@ -46,7 +45,6 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 	int ret, i;
 
 	mmu->impl = NULL;
-	mmu->heap = NULL;
 	mmu->type = NULL;
 	mmu->kind = NULL;
 
@@ -58,15 +56,12 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 
 	nvif_object_ctor(&device->object, name ?: "nvifMmu", 0, oclass, &mmu->object);
 
-	mmu->heap_nr = mmu->impl->heap_nr;
 	mmu->type_nr = mmu->impl->type_nr;
 	mmu->kind_nr = mmu->impl->kind_nr;
 
-	mmu->heap = kmalloc_array(mmu->heap_nr, sizeof(*mmu->heap),
-				  GFP_KERNEL);
 	mmu->type = kmalloc_array(mmu->type_nr, sizeof(*mmu->type),
 				  GFP_KERNEL);
-	if (ret = -ENOMEM, !mmu->heap || !mmu->type)
+	if (ret = -ENOMEM, !mmu->type)
 		goto done;
 
 	mmu->kind = kmalloc_array(mmu->kind_nr, sizeof(*mmu->kind),
@@ -74,17 +69,6 @@ nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu
 	if (!mmu->kind && mmu->kind_nr)
 		goto done;
 
-	for (i = 0; i < mmu->heap_nr; i++) {
-		struct nvif_mmu_heap_v0 args = { .index = i };
-
-		ret = nvif_object_mthd(&mmu->object, NVIF_MMU_V0_HEAP,
-				       &args, sizeof(args));
-		if (ret)
-			goto done;
-
-		mmu->heap[i].size = args.size;
-	}
-
 	for (i = 0; i < mmu->type_nr; i++) {
 		struct nvif_mmu_type_v0 args = { .index = i };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 9f44d469b4da..9a42721eabd8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -53,26 +53,6 @@ nvkm_ummu_sclass(struct nvkm_object *object, int index,
 	return -EINVAL;
 }
 
-static int
-nvkm_ummu_heap(struct nvkm_ummu *ummu, void *argv, u32 argc)
-{
-	struct nvkm_mmu *mmu = ummu->mmu;
-	union {
-		struct nvif_mmu_heap_v0 v0;
-	} *args = argv;
-	int ret = -ENOSYS;
-	u8 index;
-
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		if ((index = args->v0.index) >= mmu->heap_nr)
-			return -EINVAL;
-		args->v0.size = mmu->heap[index].size;
-	} else
-		return ret;
-
-	return 0;
-}
-
 static int
 nvkm_ummu_type(struct nvkm_ummu *ummu, void *argv, u32 argc)
 {
@@ -147,7 +127,6 @@ nvkm_ummu_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
 	struct nvif_mmu_priv *ummu = container_of(object, typeof(*ummu), object);
 	switch (mthd) {
-	case NVIF_MMU_V0_HEAP: return nvkm_ummu_heap(ummu, argv, argc);
 	case NVIF_MMU_V0_TYPE: return nvkm_ummu_type(ummu, argv, argc);
 	case NVIF_MMU_V0_KIND: return nvkm_ummu_kind(ummu, argv, argc);
 	default:
@@ -185,6 +164,8 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
 	ummu->impl.heap_nr = mmu->heap_nr;
 	ummu->impl.type_nr = mmu->type_nr;
 	ummu->impl.kind_nr = kinds;
+	for (int i = 0; i < mmu->heap_nr; i++)
+		ummu->impl.heap[i].size = mmu->heap[i].size;
 
 	ummu->impl.mem.oclass = mmu->func->mem.user.oclass;
 
-- 
2.41.0

