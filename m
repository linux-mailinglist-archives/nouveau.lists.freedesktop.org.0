Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546398A78E0
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75729112F54;
	Tue, 16 Apr 2024 23:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Vj5wzQ8Y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF71A112F51
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4B2SPWi5YNqjBGF9cqRbtCfmJ8m+n3IIt+j7AtXiX+04FYsvI1cgh5xCCoovxj2SdQVm5jPULsZFaZ+hb8L/uQl1be029AhI3Im9cKvZleNFwEuYg+ex4rLB5bXU6dcKfw8+eAlORdDLjhyftCbK3IHpYk9gqeCWQrFylzElLywDBmB6D2zwXeZ5M0lSd/MMLoUuB/0WvrOwJUtJ9EBF8+coSygdNA8cyaN2brtJzuvY6AvLozpbMeP8sroz1NQt2moS+7o3tomkeq9VOIG2oUUTQeNU/p4q4C5FIqdpk8xslKsINK6SBcAAKdNdnamBU5rboXcp/LyTPoODnmA4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPTVdLY6NcmkRz8jYoi9nZy9YCeyShOIKztk771aCEw=;
 b=KUe/LpFDzl6wtEQ7UUGqfZiKO8ygPu8eXu4KXIOrnK6kZ2g1a1hZMURPvLEObbxkv5VQwSRhoaGbiXGtoq9TEAG96e0NYiMrjbuDRHXBlndZg+JMccO5UIK+w65IAn9cXiLisHH2tJG4VFxXN/pEbMRQ8sIdbg1AOPVErk3MThEP7WQLJcGc9Z/v4VyEVjG7aO7jI7qXbXD5ytqUV5s1jD4P/sJm3gJ05HJ4BsMISZzHwkwWnkuAp6e4t5THsH+5o3O6DVcK2u67OvZX69oHYAfuogYrZWOwxdj4yYlJy09ROpEphd+OlHxmutNRlnue04RF/PH+sHgMMyiTQRJQxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPTVdLY6NcmkRz8jYoi9nZy9YCeyShOIKztk771aCEw=;
 b=Vj5wzQ8Y4EGDLYDpxBH4bwCz/GQDYfCllfDlRDPeBDx2G0z05brsEOypRDch88R5ORmLcydQUg8NtrTtBUlUZxbeGjx6SOj6jiAntR8t6fabzUBkB1XPs3mupk2dNVJ4fiuLpa4GBsoePYW/9e+ySu/L9NVZofIRP+4j5RoPSx3mJSf7/CymfIqFMXuLfGr43pniauZy1XQ/x3bAulFCphakFnire4LqDvrDp3ec0eyt3pi4mhtFy2mJND9PFOw7vd60aXtwj49jjq1KyLyP1BARYE6f70HOL5dftqR1AIwe4hwkISW5uHqngmFcu5TwaM3uImai32AM0CdD6pdAUQ==
Received: from DM6PR07CA0062.namprd07.prod.outlook.com (2603:10b6:5:74::39) by
 DS0PR12MB8317.namprd12.prod.outlook.com (2603:10b6:8:f4::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:41:48 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:74:cafe::8d) by DM6PR07CA0062.outlook.office365.com
 (2603:10b6:5:74::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:48 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:32 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:31 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 054/156] drm/nouveau/nvkm: move umem list to mmu
Date: Wed, 17 Apr 2024 09:38:20 +1000
Message-ID: <20240416234002.19509-55-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|DS0PR12MB8317:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b19b0bb-4173-40bf-b8fe-08dc5e6ec8b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bxOGYCquQ3JXUxHK4A0F8mgc+Y4EyGvYsroizFtCMvkQKkysXfYYPPp7BEHnksffnsYv6wfolEFPS0g/NSvS3TJwt3ET8FGVZXprquGvDD0OAIqDPlPSe6GolEZ9SAog8l96+46WTt+sDqelpJdqUkGz1eZzQOR5pgfsn4E8b5jRiiPzPqeSo61VQdpMeqZoMT6oqGWJTBFjmEVZvvaWexzAIh2ynQ1ttgLzjyIBRtoMAwyC3y5/dnzmiueZB+8lgSGbbf8ydEATOftDMwn22z/jHHqVTU0MEyB9jCbI3BVeT0c+r1ns1B88ohn6iqRTwR5DeTrbKSfIE1W0j6qQYhjapnfBiqgDpc4rnLKd3RGMJxMq0mfbIOxfUN7JPPvil7Sw30aAKJxx5eypmQL4XY2s7Xy0u9eL8g8HAGl/ejD8ZL/q2YJTKBrekDdVr19m4kuSy/Xm4L3iLfrLTF8KcGcj+VI3co8NavuqRg6LRi04WH385WhyJKov4Ou2hFptg3yZKMdTV3MdY7dBk/ycVfPChqTeekq2XtmeQBWhxXmHt1CKANZf+CPAg6T4GsxmGZEc3p6sx/tnCYaZSsx9q35j5P2pDX9jJ3Wy6rprSrAMHSbusRSwAMaqoyvi2O+AlvkJeW6vxfuZ5+H7rvym7Voh0gwjRmGhSla33YgRj+xlEfwJMaLqnQReyxxfAQuhi9SIdq3tvMG3iNoWhqztn5mwOSdklHJja9UZuzeIISaEaaCATjuXlYy5JSNX3SGJ
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(376005)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:48.4799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b19b0bb-4173-40bf-b8fe-08dc5e6ec8b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8317
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

This hack will be removed entirely later in the series, but for now we
need to move it out of client for upcoming changes.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/core/client.h |  3 ---
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h  |  5 ++++-
 drivers/gpu/drm/nouveau/nvkm/core/client.c     |  2 --
 .../gpu/drm/nouveau/nvkm/engine/disp/chan.c    |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c |  2 ++
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c | 18 +++++++++---------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c |  4 ++--
 8 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
index 4045b9f5ef4e..f7f195d87838 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
@@ -14,9 +14,6 @@ struct nvkm_client {
 
 	void *data;
 	int (*event)(u64 token, void *argv, u32 argc);
-
-	struct list_head umem;
-	spinlock_t lock;
 };
 
 int  nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 935b1cacd528..f2d23bfdf29a 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -109,7 +109,7 @@ int nvkm_vmm_map(struct nvkm_vmm *, struct nvkm_vma *, void *argv, u32 argc,
 		 struct nvkm_vmm_map *);
 void nvkm_vmm_unmap(struct nvkm_vmm *, struct nvkm_vma *);
 
-struct nvkm_memory *nvkm_umem_search(struct nvkm_client *, u64);
+struct nvkm_memory *nvkm_umem_search(struct nvkm_mmu *, struct nvkm_client *, u64);
 struct nvkm_vmm *nvkm_uvmm_search(struct nvkm_client *, u64 handle);
 
 struct nvkm_mmu {
@@ -148,6 +148,9 @@ struct nvkm_mmu {
 	struct mutex mutex; /* serialises mmu invalidations */
 
 	struct nvkm_device_oclass user;
+
+	spinlock_t umem_lock;
+	struct list_head umem;
 };
 
 int nv04_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index b127676078b1..7dc425e67dd4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -120,7 +120,5 @@ nvkm_client_new(const char *name, u64 device, const char *cfg, const char *dbg,
 	client->objroot = RB_ROOT;
 	spin_lock_init(&client->obj_lock);
 	client->event = event;
-	INIT_LIST_HEAD(&client->umem);
-	spin_lock_init(&client->lock);
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
index b34615dcc8eb..d3c0537c08db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/chan.c
@@ -234,7 +234,7 @@ nvkm_disp_chan_new_(struct nvkm_disp *disp, int nr, const struct nvkm_oclass *oc
 	*pobject = &uchan->object;
 
 	if (chan->func->push) {
-		chan->memory = nvkm_umem_search(uchan->object.client, args->v0.pushbuf);
+		chan->memory = nvkm_umem_search(disp->engine.subdev.device->mmu, uchan->object.client, args->v0.pushbuf);
 		if (IS_ERR(chan->memory))
 			return PTR_ERR(chan->memory);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 3dbc424869b3..23d992413442 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -365,7 +365,7 @@ nvkm_uchan_new(struct nvkm_fifo *fifo, struct nvkm_cgrp *cgrp, const struct nvkm
 	}
 
 	if (args->v0.huserd) {
-		userd = nvkm_umem_search(oclass->client, args->v0.huserd);
+		userd = nvkm_umem_search(fifo->engine.subdev.device->mmu, oclass->client, args->v0.huserd);
 		if (IS_ERR(userd)) {
 			ret = PTR_ERR(userd);
 			userd = NULL;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index b67ace7ae93c..7b949a43c372 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -428,6 +428,8 @@ nvkm_mmu_ctor(const struct nvkm_mmu_func *func, struct nvkm_device *device,
 	mutex_init(&mmu->mutex);
 	mmu->user.ctor = nvkm_ummu_new;
 	mmu->user.base = func->mmu.user;
+	spin_lock_init(&mmu->umem_lock);
+	INIT_LIST_HEAD(&mmu->umem);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index 45ab7e445d58..45f589eb5d78 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -48,7 +48,7 @@ struct nvif_mem_priv {
 
 static const struct nvkm_object_func nvkm_umem;
 struct nvkm_memory *
-nvkm_umem_search(struct nvkm_client *client, u64 handle)
+nvkm_umem_search(struct nvkm_mmu *mmu, struct nvkm_client *client, u64 handle)
 {
 	struct nvkm_client *master = client->object.client;
 	struct nvkm_memory *memory = NULL;
@@ -58,14 +58,14 @@ nvkm_umem_search(struct nvkm_client *client, u64 handle)
 	object = nvkm_object_search(client, handle, &nvkm_umem);
 	if (IS_ERR(object)) {
 		if (client != master) {
-			spin_lock(&master->lock);
-			list_for_each_entry(umem, &master->umem, head) {
+			spin_lock(&mmu->umem_lock);
+			list_for_each_entry(umem, &mmu->umem, head) {
 				if (umem->object.object == handle) {
 					memory = nvkm_memory_ref(umem->memory);
 					break;
 				}
 			}
-			spin_unlock(&master->lock);
+			spin_unlock(&mmu->umem_lock);
 		}
 	} else {
 		umem = container_of(object, typeof(*umem), object);
@@ -141,9 +141,9 @@ nvkm_umem_dtor(struct nvkm_object *object)
 {
 	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
 
-	spin_lock(&umem->object.client->lock);
+	spin_lock(&umem->mmu->umem_lock);
 	list_del_init(&umem->head);
-	spin_unlock(&umem->object.client->lock);
+	spin_unlock(&umem->mmu->umem_lock);
 	nvkm_memory_unref(&umem->memory);
 	return umem;
 }
@@ -196,9 +196,9 @@ nvkm_umem_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	if (ret)
 		return ret;
 
-	spin_lock(&umem->object.client->lock);
-	list_add(&umem->head, &umem->object.client->umem);
-	spin_unlock(&umem->object.client->lock);
+	spin_lock(&mmu->umem_lock);
+	list_add(&umem->head, &mmu->umem);
+	spin_unlock(&mmu->umem_lock);
 
 	args->v0.page = nvkm_memory_page(umem->memory);
 	args->v0.addr = nvkm_memory_addr(umem->memory);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 6f261f81a2ad..761a50047b42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -178,7 +178,7 @@ nvkm_uvmm_mthd_map(struct nvkm_uvmm *uvmm, void *argv, u32 argc)
 	if (nvkm_vmm_in_managed_range(vmm, addr, size) && vmm->managed.raw)
 		return -EINVAL;
 
-	memory = nvkm_umem_search(client, handle);
+	memory = nvkm_umem_search(vmm->mmu, client, handle);
 	if (IS_ERR(memory)) {
 		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
 		return PTR_ERR(memory);
@@ -421,7 +421,7 @@ nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
 
 	vma.page = vma.refd = refd;
 
-	memory = nvkm_umem_search(client, args->memory);
+	memory = nvkm_umem_search(uvmm->vmm->mmu, client, args->memory);
 	if (IS_ERR(memory)) {
 		VMM_DEBUG(vmm, "memory %016llx %ld\n", handle, PTR_ERR(memory));
 		return PTR_ERR(memory);
-- 
2.41.0

