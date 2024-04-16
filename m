Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075388A7901
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61422112F3E;
	Tue, 16 Apr 2024 23:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FjmApv3C";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2066.outbound.protection.outlook.com [40.107.236.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7E8A10F41A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUQcLUG337Mg3BOp3LdPGDUb0OyPJM9p36kDSz7xK7F5AdpBRZM3oFtoiqFCtTSJJGS3MidS3rX+Gzi6CNGIpJuZW9/aW9Nj7jbchnCyRusjBCNuyeDz0rhwgUSeTew75nnyBFl7tsBxIwgSn+h12oCr8TncYH8n17VOFwz1NCwTdf1rMT0hkKqmLnUD9r40IvebLP+EsfaUbZp+GUKjvkahmiPlZboPjGkExPpclRjLFha8rfRAYr/w1B4hJzspH0mTC8Yu3N0zUVKzRb0/+qyMR13DO4CZM28s+pvFAV6HcIYwwkvGoxjqc/vm0LhIYqpuKVWw3bSargqNF5CpmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKCu2maVtEYxT/a8Cu7sInM7+RBAll/XPiXH4j5Hljc=;
 b=BMj3eWgZxNGt8Uzn7fFLeAZh/i1AtU9VVKzB3gg2USGtnzDl2QuL6CFDHfCV7PhT0uT/OLb3fItQs2ssRMbUbfxDg518UdHKsb4c8dt/QuJxz60P42HNr/I2ieKv+Xqzgv40yWhY7HTAH9AaQz+za+A5N2FD3icQ+csYRGJuEIfWTXp7RB+BD0RZFTQp7vUV1DXZ73hEfRM91KJQp1v8SwttrXv6/p5eTvpJucURNl33UnYrM3Mswpycx2o/+7QwvJF+T7USh8N5WzHmr+u/0HnumYlS8TOGueKQhbYLxvJSZc08GqQFxlkWbpOgsgkzsn302q5P2totAbkqTe9XoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKCu2maVtEYxT/a8Cu7sInM7+RBAll/XPiXH4j5Hljc=;
 b=FjmApv3CWWlGWyUdmuLp46vriibrQzik+t9YY30oWDFPZlDcDiTAd0i8q02R25YsYBNUUFff97KnJViOYLKxspohzlkegpBWpsj8tCyaYCcsd084DFJBxFQMFOcIebMNzkgb0uv4KmKJa64dbF6IT/cVzrq3dm3480HwmTY06nBh2t9KuaNrxVdp2zLOQ3CI727hcGlJvANripVB5+Qe2VJ54Ixm7k9d8cQElQlxcbEqKXVO7MpCo1UBGjTCBeXXM/qUC3VsgRUqlJHIJwIaGylGW/rbU+oDJZJf10oyYS0JSo6AAYDAsgF66wZjb75P21IfmPO+pzePmk8DMbOMrA==
Received: from DS7PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:3bb::31)
 by PH8PR12MB6722.namprd12.prod.outlook.com (2603:10b6:510:1cd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:21 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::12) by DS7PR03CA0086.outlook.office365.com
 (2603:10b6:5:3bb::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:20 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:00 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:59 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 078/156] drm/nouveau/nvif: rework device "new mmu" api
Date: Wed, 17 Apr 2024 09:38:44 +1000
Message-ID: <20240416234002.19509-79-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|PH8PR12MB6722:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f6522e-8d57-456e-e4a2-08dc5e6edb9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1zy4NROFjHF3Vmpn8L7SLwXpuPpnf9gOVtOg0skeMDSXAY1oO8aRi/cRXx/E6GrUaZN5E78wjRSqUby01M8VQ2SuwFgxkhAkDluVNUeCP0QA3mBrE5e5sxGjc1YcYxAE5MO29FG0FY8/iV++ensGR21teyuX0U1UsPByEOCuVGPpwFjkbNwC2b0wG+koNd5YiJ7cmG8c/GJvKLy9SSScDX1zlF7hwN2ZKkJUmzJEKSyCTd1CQfdfcw9d+5uOU2EvoQtRsVZxTmgxa7ZCL7fPIzpWW5UF1jtPCxL1WLjIXzyiCiGfDgOoCYkMT1HpNNuT9k58KUHMs3rLZyx6/fkei2JaK9ZkeLTdJeBNLoR6DePoSueIsblPQK8FANzOh1zcHwKRRVoKrnpG0u9pITrksBMS540ED23rIQ2djy3ZuxqEZl4+Ryhzs1swHk/up+y+CcO3TiPhiy1lC3b7Q3BwO+bbZHSDCAAmlb7J2rk1PYNGnPtu1h1Jd0qSw6+UygXvRYonZUHCTufPDfmjKqNOLVmWhqyD9BEvnTpJloL68LRAyD/M9laKzyNdlXXHaLe1uhWUNq/KO7sjqE54NBiNxZTTHmEwFfh+TN/G5drEZ7a2IuxUMd6LE1wYFNKvelceRNGvbnT9YBkQ3Wc8XqQidqP3fqqthBfMQZEC5i5jkQzsN8EOpYj/tNfcX+1ijp0ZKHNsUBOh/gZ7zR++SN4j/3gQI/UYtFhvTv0De68EIVa3w/s9QNemVA62jeeR3Xhb
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:20.2151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f6522e-8d57-456e-e4a2-08dc5e6edb9f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6722
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 13 ++++++
 drivers/gpu/drm/nouveau/include/nvif/if0008.h |  7 ---
 drivers/gpu/drm/nouveau/include/nvif/mmu.h    |  8 ++--
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  5 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
 drivers/gpu/drm/nouveau/nvif/mmu.c            | 30 ++++++------
 drivers/gpu/drm/nouveau/nvkm/device/user.c    | 22 +++++++--
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |  1 -
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c    | 46 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h    | 10 ++--
 10 files changed, 94 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index cd96e9c36f55..7bba8c79d71e 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -5,6 +5,7 @@ struct nvif_client_priv;
 struct nvif_device_priv;
 struct nvif_control_priv;
 struct nvif_usermode_priv;
+struct nvif_mmu_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -75,6 +76,16 @@ struct nvif_usermode_impl {
 	struct nvif_mapinfo map;
 };
 
+struct nvif_mmu_impl {
+	void (*del)(struct nvif_mmu_priv *);
+
+	u8 dmabits;
+	u8 heap_nr;
+	u8 type_nr;
+
+	u16 kind_nr;
+};
+
 struct nvif_device_impl {
 	void (*del)(struct nvif_device_priv *);
 
@@ -129,6 +140,8 @@ struct nvif_device_impl {
 
 	struct {
 		s32 oclass;
+		int (*new)(struct nvif_device_priv *, const struct nvif_mmu_impl **,
+			   struct nvif_mmu_priv **, u64 handle);
 	} mmu;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0008.h b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
index c21d09f04f1d..618df13762d3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0008.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0008.h
@@ -1,12 +1,5 @@
 #ifndef __NVIF_IF0008_H__
 #define __NVIF_IF0008_H__
-struct nvif_mmu_v0 {
-	__u8  version;
-	__u8  dmabits;
-	__u8  heap_nr;
-	__u8  type_nr;
-	__u16 kind_nr;
-};
 
 #define NVIF_MMU_V0_HEAP                                                   0x00
 #define NVIF_MMU_V0_TYPE                                                   0x01
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mmu.h b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
index 2035ef1d35f5..414caaa2230a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mmu.h
@@ -1,10 +1,13 @@
 #ifndef __NVIF_MMU_H__
 #define __NVIF_MMU_H__
 #include <nvif/object.h>
+#include <nvif/driverif.h>
+struct nvif_device;
 
 struct nvif_mmu {
+	const struct nvif_mmu_impl *impl;
+	struct nvif_mmu_priv *priv;
 	struct nvif_object object;
-	u8  dmabits;
 	u8  heap_nr;
 	u8  type_nr;
 	u8  kind_inv;
@@ -31,8 +34,7 @@ struct nvif_mmu {
 	u8 *kind;
 };
 
-int nvif_mmu_ctor(struct nvif_object *, const char *name, s32 oclass,
-		  struct nvif_mmu *);
+int nvif_mmu_ctor(struct nvif_device *, const char *name, struct nvif_mmu *);
 void nvif_mmu_dtor(struct nvif_mmu *);
 
 static inline bool
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index a91ad8e65a0f..1dba64a1e590 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -236,8 +236,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 
 	cli->device.object.map.ptr = drm->device.object.map.ptr;
 
-	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
-			    &cli->mmu);
+	ret = nvif_mmu_ctor(&cli->device, "drmMmu", &cli->mmu);
 	if (ret) {
 		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
 		goto done;
@@ -569,7 +568,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 		goto fail_nvif;
 	}
 
-	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", drm->device.impl->mmu.oclass, &drm->mmu);
+	ret = nvif_mmu_ctor(&drm->device, "drmMmu", &drm->mmu);
 	if (ret) {
 		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
 		goto fail_nvif;
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 57c7e3ba8e7b..f87ca8a0e6ae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -302,8 +302,8 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
 				  dev->anon_inode->i_mapping,
 				  dev->vma_offset_manager,
-				  drm_need_swiotlb(drm->client.mmu.dmabits),
-				  drm->client.mmu.dmabits <= 32);
+				  drm_need_swiotlb(drm->mmu.impl->dmabits),
+				  drm->mmu.impl->dmabits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvif/mmu.c b/drivers/gpu/drm/nouveau/nvif/mmu.c
index c9dd3cff49a0..cc15cf99462c 100644
--- a/drivers/gpu/drm/nouveau/nvif/mmu.c
+++ b/drivers/gpu/drm/nouveau/nvif/mmu.c
@@ -20,6 +20,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include <nvif/mmu.h>
+#include <nvif/device.h>
+#include <nvif/printf.h>
 
 #include <nvif/class.h>
 #include <nvif/if0008.h>
@@ -27,18 +29,18 @@
 void
 nvif_mmu_dtor(struct nvif_mmu *mmu)
 {
-	if (!nvif_object_constructed(&mmu->object))
+	if (!mmu->impl)
 		return;
 
 	kfree(mmu->kind);
 	kfree(mmu->type);
 	kfree(mmu->heap);
-	nvif_object_dtor(&mmu->object);
+	mmu->impl->del(mmu->priv);
+	mmu->impl = NULL;
 }
 
 int
-nvif_mmu_ctor(struct nvif_object *parent, const char *name, s32 oclass,
-	      struct nvif_mmu *mmu)
+nvif_mmu_ctor(struct nvif_device *device, const char *name, struct nvif_mmu *mmu)
 {
 	static const struct nvif_mclass mems[] = {
 		{ NVIF_CLASS_MEM_GF100, -1 },
@@ -46,23 +48,25 @@ nvif_mmu_ctor(struct nvif_object *parent, const char *name, s32 oclass,
 		{ NVIF_CLASS_MEM_NV04 , -1 },
 		{}
 	};
-	struct nvif_mmu_v0 args;
+	const s32 oclass = device->impl->mmu.oclass;
 	int ret, i;
 
-	args.version = 0;
+	mmu->impl = NULL;
 	mmu->heap = NULL;
 	mmu->type = NULL;
 	mmu->kind = NULL;
 
-	ret = nvif_object_ctor(parent, name ? name : "nvifMmu", 0, oclass,
-			       &args, sizeof(args), &mmu->object);
+	ret = device->impl->mmu.new(device->priv, &mmu->impl, &mmu->priv,
+				    nvif_handle(&mmu->object));
+	NVIF_ERRON(ret, &device->object, "[NEW mmu%08x]", oclass);
 	if (ret)
-		goto done;
+		return ret;
+
+	nvif_object_ctor(&device->object, name ?: "nvifMmu", 0, oclass, &mmu->object);
 
-	mmu->dmabits = args.dmabits;
-	mmu->heap_nr = args.heap_nr;
-	mmu->type_nr = args.type_nr;
-	mmu->kind_nr = args.kind_nr;
+	mmu->heap_nr = mmu->impl->heap_nr;
+	mmu->type_nr = mmu->impl->type_nr;
+	mmu->kind_nr = mmu->impl->kind_nr;
 
 	ret = nvif_mclass(&mmu->object, mems);
 	if (ret < 0)
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index cd126f5b165a..e9486d9da64b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -29,6 +29,7 @@
 #include <subdev/fb.h>
 #include <subdev/instmem.h>
 #include <subdev/timer.h>
+#include <subdev/mmu/ummu.h>
 #include <subdev/vfn/uvfn.h>
 #include <engine/disp/priv.h>
 #include <engine/fifo/ufifo.h>
@@ -76,6 +77,22 @@ nvkm_udevice_time(struct nvif_device_priv *udev)
 	return nvkm_timer_read(udev->device->timer);
 }
 
+static int
+nvkm_udevice_mmu_new(struct nvif_device_priv *udev,
+		     const struct nvif_mmu_impl **pimpl, struct nvif_mmu_priv **ppriv,
+		     u64 handle)
+{
+	struct nvkm_device *device = udev->device;
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_ummu_new(device, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+}
+
 static void
 nvkm_udevice_del(struct nvif_device_priv *udev)
 {
@@ -167,9 +184,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 	}
 
 	if (!sclass) {
-		if (device->mmu && index-- == 0)
-			sclass = &device->mmu->user;
-		else if (device->fault && index-- == 0)
+		if (device->fault && index-- == 0)
 			sclass = &device->fault->user;
 		else
 			return -EINVAL;
@@ -283,6 +298,7 @@ nvkm_udevice_new(struct nvkm_device *device,
 
 	if (device->mmu) {
 		udev->impl.mmu.oclass = device->mmu->user.base.oclass;
+		udev->impl.mmu.new = nvkm_udevice_mmu_new;
 	}
 
 	if (device->fault) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index 7b949a43c372..08ad3ed84631 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -426,7 +426,6 @@ nvkm_mmu_ctor(const struct nvkm_mmu_func *func, struct nvkm_device *device,
 	mmu->dma_bits = func->dma_bits;
 	nvkm_mmu_ptc_init(mmu);
 	mutex_init(&mmu->mutex);
-	mmu->user.ctor = nvkm_ummu_new;
 	mmu->user.base = func->mmu.user;
 	spin_lock_init(&mmu->umem_lock);
 	INIT_LIST_HEAD(&mmu->umem);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
index 3f008402f451..f97dec6c3309 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.c
@@ -129,6 +129,19 @@ nvkm_ummu_kind(struct nvkm_ummu *ummu, void *argv, u32 argc)
 	return 0;
 }
 
+static void
+nvkm_ummu_del(struct nvif_mmu_priv *ummu)
+{
+	struct nvkm_object *object = &ummu->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_mmu_impl
+nvkm_ummu_impl = {
+	.del = nvkm_ummu_del,
+};
+
 static int
 nvkm_ummu_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
@@ -150,32 +163,31 @@ nvkm_ummu = {
 };
 
 int
-nvkm_ummu_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
-	      void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_ummu_new(struct nvkm_device *device, const struct nvif_mmu_impl **pimpl,
+	      struct nvif_mmu_priv **ppriv, struct nvkm_object **pobject)
 {
-	union {
-		struct nvif_mmu_v0 v0;
-	} *args = argv;
 	struct nvkm_mmu *mmu = device->mmu;
 	struct nvif_mmu_priv *ummu;
-	int ret = -ENOSYS, kinds = 0;
+	int kinds = 0;
 	u8 unused = 0;
 
+	if (!(ummu = kzalloc(sizeof(*ummu), GFP_KERNEL)))
+		return -ENOMEM;
+
+	nvkm_object_ctor(&nvkm_ummu, &(struct nvkm_oclass) {}, &ummu->object);
+	ummu->mmu = mmu;
+	ummu->impl = nvkm_ummu_impl;
+
 	if (mmu->func->kind)
 		mmu->func->kind(mmu, &kinds, &unused);
 
-	if (!(ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false))) {
-		args->v0.dmabits = mmu->dma_bits;
-		args->v0.heap_nr = mmu->heap_nr;
-		args->v0.type_nr = mmu->type_nr;
-		args->v0.kind_nr = kinds;
-	} else
-		return ret;
+	ummu->impl.dmabits = mmu->dma_bits;
+	ummu->impl.heap_nr = mmu->heap_nr;
+	ummu->impl.type_nr = mmu->type_nr;
+	ummu->impl.kind_nr = kinds;
 
-	if (!(ummu = kzalloc(sizeof(*ummu), GFP_KERNEL)))
-		return -ENOMEM;
-	nvkm_object_ctor(&nvkm_ummu, oclass, &ummu->object);
-	ummu->mmu = mmu;
+	*pimpl = &ummu->impl;
+	*ppriv = ummu;
 	*pobject = &ummu->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
index 35ae48758017..c03563aa4cae 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/ummu.h
@@ -1,15 +1,19 @@
 #ifndef __NVKM_UMMU_H__
 #define __NVKM_UMMU_H__
 #include <core/object.h>
-#include "priv.h"
+struct nvkm_device;
+
+#include <nvif/driverif.h>
 
 #define nvkm_ummu nvif_mmu_priv
 
 struct nvif_mmu_priv {
 	struct nvkm_object object;
 	struct nvkm_mmu *mmu;
+
+	struct nvif_mmu_impl impl;
 };
 
-int nvkm_ummu_new(struct nvkm_device *, const struct nvkm_oclass *,
-		  void *argv, u32 argc, struct nvkm_object **);
+int nvkm_ummu_new(struct nvkm_device *, const struct nvif_mmu_impl **, struct nvif_mmu_priv **,
+		  struct nvkm_object **);
 #endif
-- 
2.41.0

