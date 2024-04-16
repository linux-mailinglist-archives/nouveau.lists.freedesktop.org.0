Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFCA8A78DE
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3555C112F51;
	Tue, 16 Apr 2024 23:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YSC7l4UQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9AF112F51
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXE7Qg/fGyPZxS8I8ff8kWYkdE/MoDmtb/61KQ7+ZI3I0fXvkUZkNUiot+2BQqFDO2e+Q7mUsEV0pj/GRvi0M1bRbNOUHHmVIEh5GoAGHoAF/8DYvNBbVPocPwVCIfzu7gvRnbm8gohjYFjkWMrENopjAF0jjpPUWKDoWHatNNWCoejhXYGD2nLSKo1xYORrqlZCIIFkRaKe+L7Witiozt33egvU56vJUs9jotrwUUk2w41/B5+Z44jKaw1JbHT7v4qvNcld1yaTuCE3cRvR+xjervgGP3OQjgzxHs6Rj8k4g9swE4KwIWPvYhkhbCFSc0beT8azFmbzHhJzghZY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNhW2IOz2eSEfu9qccdrLpw7UyDXcUKNmIZyceHQeZ0=;
 b=gbnbWafPaapVryOKWR9+eaA/v7ua93PJaO0yaPhOzo83AVmWOs0ptk5lMvk6ACxsv4x0z8UDyMKtHQOGoiXXF27hFb3Lv5nsxmekGdDCnTOu+hivPoFKH82YCB1d3SE+otxT17tcGFpl0JZ7K7Tk+XD7OwU+dUFcNcZuzPLCjc+rDxqPs6CVc4yPjFKgZ+Ehu9b8OMfB4irjadoc8Ky7/jok6hrLqV4fNysLUhgUZ+B/0AjOnyODhMNMl+m0rhmTNJywEUyfK7eJwCu3niUEsbynUp+j14vIm45HwRxRcU3ycXtlxb9iqpQKpTZ9vvEi0eQMqXYFfy8P8k+w+BAPUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNhW2IOz2eSEfu9qccdrLpw7UyDXcUKNmIZyceHQeZ0=;
 b=YSC7l4UQB1odPlV4YU6t9CvPihC0dIPs1F4F8atsRKZrbpQEJ8P66EVz7hJuW5GZIHyweHyYR86VBFig0RtarOP+ZO5KSJN+Q+e2X50Pb6oAMcANK0XQSFOzNkK3Nu1Chfp4nrc3kp1RNp/tF6XQIWQl7k1Wup9ER7T3O9i4mOs0M57MOiGzXc3YuFElFzC7fHpRsND3Qpzg7WSYumRFCFZ1pbcSpoUpijrJx5DnYJ8LvoLvRc7ed1PCAP1O2/NClsNl7x2efduk8ZMYRDseE4fjZlPmboxXYYVz/61+U4yzbz1LLUuX+pqcOxUdXB6YjG9THfMkqqEcB1CcYcSoZw==
Received: from BN9PR03CA0072.namprd03.prod.outlook.com (2603:10b6:408:fc::17)
 by BY5PR12MB4291.namprd12.prod.outlook.com (2603:10b6:a03:20c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:44 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::43) by BN9PR03CA0072.outlook.office365.com
 (2603:10b6:408:fc::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:20 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 043/156] drm/nouveau/nvkm: rename struct nvkm_ummu
Date: Wed, 17 Apr 2024 09:38:09 +1000
Message-ID: <20240416234002.19509-44-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|BY5PR12MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2ec350-1f3c-4d1f-2399-08dc5e6ec61a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZQAtepOnDfJrecuJf2bqRGfLSkzk7sIRxS4ckRdBYcyw9XR9JPgMk7GDaXO4ZzYalzpXaInjsMONRthb+H/f1BCir5hHexZM/LJl4eYXfQ5BIgd/+qN1FFV/0F7ptuf89l3TBIn+rfD05grxXooBtYEsK6vvkAyUt+y6RnqeV/0b9I3qT+unTDbtswSNmEQJ46mzXbUpXp5Yly/GbyigtLjaaQrab3ka22lHFZuIQGCLPiBx85eP104mxGk/Z9Kp0pZM6coiz0IBP9mYks/yUxZhLu2Rgf3iGizDCG5ki686MVXPERuh0BRVO+z7TrvaH3BwLiI7tPT0+v+vVkX9fKd17GXJnQPcfNhnTHbSOnKenWGkee+z1APnzorgwLTQPwHv/r9QwjVKVrm8pMGMBna1xvfqQ222CE+5GEIhC8/1tinJEixw0H7C8nFoH5BdGVMx9f1i2u1uD0gQ5VUHAS72P5A3JtFAC/Hgs6AstUrG4gIKWPhUrlPFXtc91j7DvYnIGXZ9FNyKp59aWaLlPJ/WqIeob8T6fu0Zn6TV512U3p1hOPtkIjqRDs0WON8BaWOmq1FNLwseojS+0K9IyVCV4nyXdfe4bKzm32SrD0dq3ElbuB5Mf8xgm+BsWtqQYQzp1+T4RxXfCDls9b6NsjS8DErwDnyf/T3Oe2tMWqC9If2vIBVLS1HISp2e02l01gxH6AYdr/RkKdAIA3U+hjm+u0FVedqnjyOvB+B2IJx7p1cxlWHVXpdk0VPT80s
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:44.0439 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2ec350-1f3c-4d1f-2399-08dc5e6ec61a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4291
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

- preparation for upcoming patches
- open-code current nvkm_ummu() macro
- alias remaining use of nvkm_ummu to nvif_mmu_priv, removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c | 6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h | 5 +++--
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index e530bb8b3b17..62d69bb7fe90 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -142,7 +142,7 @@ int
 nvkm_umem_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	      struct nvkm_object **pobject)
 {
-	struct nvkm_mmu *mmu = nvkm_ummu(oclass->parent)->mmu;
+	struct nvkm_mmu *mmu = container_of(oclass->parent, struct nvif_mmu_priv, object)->mmu;
 	union {
 		struct nvif_mem_v0 v0;
 	} *args = argv;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 6870fda4b188..3f008402f451 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -32,7 +32,7 @@ static int
 nvkm_ummu_sclass(struct nvkm_object *object, int index,
 		 struct nvkm_oclass *oclass)
 {
-	struct nvkm_mmu *mmu = nvkm_ummu(object)->mmu;
+	struct nvkm_mmu *mmu = container_of(object, struct nvif_mmu_priv, object)->mmu;
 
 	if (mmu->func->mem.user.oclass) {
 		if (index-- == 0) {
@@ -132,7 +132,7 @@ nvkm_ummu_kind(struct nvkm_ummu *ummu, void *argv, u32 argc)
 static int
 nvkm_ummu_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
-	struct nvkm_ummu *ummu = nvkm_ummu(object);
+	struct nvif_mmu_priv *ummu = container_of(object, typeof(*ummu), object);
 	switch (mthd) {
 	case NVIF_MMU_V0_HEAP: return nvkm_ummu_heap(ummu, argv, argc);
 	case NVIF_MMU_V0_TYPE: return nvkm_ummu_type(ummu, argv, argc);
@@ -157,7 +157,7 @@ nvkm_ummu_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
 		struct nvif_mmu_v0 v0;
 	} *args = argv;
 	struct nvkm_mmu *mmu = device->mmu;
-	struct nvkm_ummu *ummu;
+	struct nvif_mmu_priv *ummu;
 	int ret = -ENOSYS, kinds = 0;
 	u8 unused = 0;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
index 0cd510dcfc68..35ae48758017 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
@@ -1,10 +1,11 @@
 #ifndef __NVKM_UMMU_H__
 #define __NVKM_UMMU_H__
-#define nvkm_ummu(p) container_of((p), struct nvkm_ummu, object)
 #include <core/object.h>
 #include "priv.h"
 
-struct nvkm_ummu {
+#define nvkm_ummu nvif_mmu_priv
+
+struct nvif_mmu_priv {
 	struct nvkm_object object;
 	struct nvkm_mmu *mmu;
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index cf490ff2b9f1..bd51cdb1c578 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -532,7 +532,7 @@ int
 nvkm_uvmm_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	      struct nvkm_object **pobject)
 {
-	struct nvkm_mmu *mmu = nvkm_ummu(oclass->parent)->mmu;
+	struct nvkm_mmu *mmu = container_of(oclass->parent, struct nvif_mmu_priv, object)->mmu;
 	const bool more = oclass->base.maxver >= 0;
 	union {
 		struct nvif_vmm_v0 v0;
-- 
2.41.0

