Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD0F8A7945
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439CF112FED;
	Tue, 16 Apr 2024 23:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wcho1F+V";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B133112FC1
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayMzmCBFmdydtRL4rRwMIAwqHp3nmv9ivjXH11oVDAIl2wHYGmiPDLAvioLrN4Jr9nTbWET4ysPc4Qkc70+hnHhBHRhOhSPTL+ta8LHiSCFa1FaeGcps0ysAdPvhZ8bxxae2GZo2Xyx2WU94H1Av8nM2CxGxcUxDZYPW7UOCux56QDxvziyMPPNigwaDeltTsdJ60syRNhI7HKcrJcKYjfwhZI6i8GsSPJpRR169okHJx04+d6QkYME3eEbKBnyI3Jlpyrgh/F3OpoZ//eCNEPmXRbAbBDGyeFypDItvjmJ4iMYANt8mIstCFrMI/YhpKunL6ELDeB0JzG3ojQSvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3knOibNWRSQogd0x1ivs3z/ICin9kquzwqOAxsox59E=;
 b=mDDyRzegDOIYTI9Pm8QparyvsgBKQ1cJuEgEhcpnIH2PrADazqNSbsPav840f7xDd3XHaxCLm7ndo8omliszuehb7glIUIjQJTa2yKxeYgtsuC2uVnuSg/dZN2uTYYopxBqb/z3vnppwTKfKvKMlLlObcSuYjCgk0Ah+E5mAOq5QnA9VDcDtT1uJixZcLClcikaRLHd9/iF8P0XBufmvU749J5GQw7pWNo40/Jx3ieZcx802ReRxI7q7cuRBmMFIlHi4tFIPapOWmprCuPPKPPSm2h0W2IdD6ES2D5jR9V8BdQAkmiE61oaVCRAzF87sRIgm4q1POfPtJlvk6GFiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3knOibNWRSQogd0x1ivs3z/ICin9kquzwqOAxsox59E=;
 b=Wcho1F+V8aUxVvLWGVPBfBJjldUMojbRJAXCwPn3VlOyyFvgLsxAaChEouR7XadSLC4faXMu7sqOA0HEChJXxXd11waX8Zz96pEPpCCAdFBdUXYSosh8BL6jzBmH1Rq+sVWrsMx0V42WQsklWeHqAtdGnNV2FeF3m7WFsDDqu/s2dBPWCRb41BHjrTazhXZ7EA5yuxduOAOVExzyKgnszMSs5DcXyGHdJBgdTSxTS6cxGJBzmnI/2rv0A/C+ZDzeLwjaI1RzUPG3SxeZVhdFbpSRRiyX+rkh5uo6/jA8VA4ywzwIkNkihQstFKqrubi1wi4mYbuFxhHSG0gK+mG59w==
Received: from DM6PR01CA0013.prod.exchangelabs.com (2603:10b6:5:296::18) by
 BL1PR12MB5922.namprd12.prod.outlook.com (2603:10b6:208:399::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:43:46 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:296:cafe::27) by DM6PR01CA0013.outlook.office365.com
 (2603:10b6:5:296::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:29 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 156/156] drm/nouveau: remove remaining usage of
 nouveau_drm.client
Date: Wed, 17 Apr 2024 09:40:02 +1000
Message-ID: <20240416234002.19509-157-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|BL1PR12MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 40894af1-0f01-4c5f-a899-08dc5e6f0f06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xev8041XyomRxSYcQeCft33R866RBHaSpaIDgI42CJMjpxbsR2bsva7gXd61PJAw+4KEUwcGk7bkDdmn6iUX1dCgA2ZAZPGIozTcWCInvbEc/hVkxlCaU3xiShs2NaSyX/bl2636UiGO5FRJveaevumztDvX31ODZvp03uMyZWsBcRDPK4DX+ryFMWy8b7h4plyKOx30Iz0DIbW9H1M6Up3ln+Vt8YVNxWiOEruz1ABIILiwgZnl7gI4K6/1hayRW6KncOArxyGM4IzF6wKTsm7wUzdMH2c9PBo2qSRuveJjtRFDLrN90Eak1dK6KDt/a3ML43Mb4nUV/reideY3Ktz4OkEb0F9tT1fFH4M/UhZYCb/83405l1DronUn+uxagqpmstu4VwS4tD1Z8WOsAtaEIJKBFUXLQB3vL9MIrHmezjAw6VljQKqx8yLI3isamWmnrc5VeQgwi98aJmCM80ymurmUdt33aaF484y6OejvQAJ3hpjYVcbQr2NHOh4XY8H0YsH48i2/hqhetLtcMnle2Zd0LyLtM4Hg+DnRSUpLFmqOaszHphqYZrRq2MZsjy2oFrC6Sbvnuu6Dr9NHfUAVfmZZG5XBUrrqRlM3Fu1Z73RWQo42xnsL7k3DVQrzBOWW1q3sEnTO8lFiZPsKB/W6nsZLvRj8amPs22Bp3GT29Uar2giI3rGE+CPcnphQqzNfcwXF+KSZtHOW4h2X1q387Gr/FgmtOTq+IrXQBQ8C70B2Ni6PzrrCpdIF7kxU
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:46.4680 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40894af1-0f01-4c5f-a899-08dc5e6f0f06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5922
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

- complete the switch to nouveau_drm.cli
- renames drm._client to drm.client

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/head.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c   | 14 +++++++-------
 drivers/gpu/drm/nouveau/nouveau_drv.h   | 25 +++++++++++--------------
 drivers/gpu/drm/nouveau/nouveau_prime.c |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c   |  4 ++--
 drivers/gpu/drm/nouveau/nv17_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv50_fence.c    |  2 +-
 drivers/gpu/drm/nouveau/nv84_fence.c    |  2 +-
 14 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 7f83927ddf96..225716d47c56 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -1317,7 +1317,7 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
 
-	ret = nouveau_bo_new(&nouveau_drm(dev)->client, 64*64*4, 0x100,
+	ret = nouveau_bo_new(&nouveau_drm(dev)->cli, 64*64*4, 0x100,
 			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0x0000, NULL, NULL,
 			     &nv_crtc->cursor.nvbo);
 	if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 6d1395b8c597..fd3360b096b4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -541,7 +541,7 @@ int nv50_crc_set_source(struct drm_crtc *crtc, const char *source_str)
 	struct nv50_head *head = nv50_head(crtc);
 	struct nv50_crc *crc = &head->crc;
 	const struct nv50_crc_func *func = nv50_disp(dev)->core->func->crc;
-	struct nvif_mmu *mmu = &nouveau_drm(dev)->client.mmu;
+	struct nvif_mmu *mmu = &nouveau_drm(dev)->cli.mmu;
 	struct nv50_head_atom *asyh;
 	struct drm_crtc_state *crtc_state;
 	enum nv50_crc_source source;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 36547f3b6111..45ef47b1997d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2604,7 +2604,7 @@ nv50_display_create(struct drm_device *dev)
 	dev->mode_config.normalize_zpos = true;
 
 	/* small shared memory area we use for notifiers and semaphores */
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
+	ret = nouveau_bo_new(&drm->cli, 4096, 0x1000,
 			     NOUVEAU_GEM_DOMAIN_VRAM,
 			     0, 0x0000, NULL, NULL, &disp->sync);
 	if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index 3a192dd8635a..187feceb300a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -618,7 +618,7 @@ nv50_head_create(struct drm_device *dev, int index)
 				   head->func->olut_size);
 
 	if (head->func->olut_set) {
-		ret = nv50_lut_init(disp, &drm->client.mmu, &head->olut);
+		ret = nv50_lut_init(disp, &drm->cli.mmu, &head->olut);
 		if (ret) {
 			nv50_head_destroy(crtc);
 			return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 38853dbe57c5..8f6f431d682a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -736,7 +736,7 @@ nv50_wndw_prep(const struct nv50_wndw_func *func, struct drm_device *dev,
 	       struct nv50_wndw **pwndw)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_mmu *mmu = &drm->client.mmu;
+	struct nvif_mmu *mmu = &drm->cli.mmu;
 	struct nv50_disp *disp = nv50_disp(dev);
 	struct nv50_wndw *wndw;
 	const u64 *format_modifiers;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 523464cfea9e..c4e420b9deef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -832,7 +832,7 @@ nouveau_bo_move_prep(struct nouveau_drm *drm, struct ttm_buffer_object *bo,
 {
 	struct nouveau_mem *old_mem = nouveau_mem(bo->resource);
 	struct nouveau_mem *new_mem = nouveau_mem(reg);
-	struct nvif_vmm *vmm = &drm->client.vmm.vmm;
+	struct nvif_vmm *vmm = &drm->cli.vmm.vmm;
 	int ret;
 
 	ret = nvif_vmm_get(vmm, NVIF_VMM_GET_LAZY, false, old_mem->mem.impl->page, 0,
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 2cb06f0a217f..43c5b583caef 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -254,7 +254,7 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
-	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
+	ret = nouveau_bo_new(&drm->cli, DMEM_CHUNK_SIZE, 0,
 			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
 			     &chunk->bo);
 	if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 26a89ab6d462..98085bb9eb78 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -201,7 +201,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 	INIT_LIST_HEAD(&cli->worker);
 	mutex_init(&cli->lock);
 
-	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
+	ret = nvif_client_ctor(&drm->client, cli->name, &cli->base);
 	if (ret) {
 		NV_PRINTK(err, cli, "Client allocation failed: %d\n", ret);
 		goto done;
@@ -497,15 +497,15 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 
 	nvif_parent_ctor(&nouveau_parent, &drm->parent);
 
-	drm->_client.object.parent = &drm->parent;
+	drm->client.object.parent = &drm->parent;
 
 	ret = nvkm_driver_ctor(drm->nvkm, &driver, &impl, &priv);
 	if (ret)
 		goto fail_alloc;
 
-	nvif_driver_ctor(&drm->parent, driver, "drm", impl, priv, &drm->_client);
+	nvif_driver_ctor(&drm->parent, driver, "drm", impl, priv, &drm->client);
 
-	ret = nvif_device_ctor(&drm->_client, "drmDevice", &drm->device);
+	ret = nvif_device_ctor(&drm->client, "drmDevice", &drm->device);
 	if (ret) {
 		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
 		goto fail_nvif;
@@ -630,7 +630,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 fail_nvif:
 	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
-	nvif_client_dtor(&drm->_client);
+	nvif_client_dtor(&drm->client);
 fail_alloc:
 	nvif_parent_dtor(&drm->parent);
 	kfree(drm);
@@ -886,7 +886,7 @@ nouveau_do_suspend(struct drm_device *dev, bool runtime)
 	}
 
 	NV_DEBUG(drm, "suspending object tree...\n");
-	ret = nvif_client_suspend(&drm->_client);
+	ret = nvif_client_suspend(&drm->client);
 	if (ret)
 		goto fail_client;
 
@@ -911,7 +911,7 @@ nouveau_do_resume(struct drm_device *dev, bool runtime)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	NV_DEBUG(drm, "resuming object tree...\n");
-	ret = nvif_client_resume(&drm->_client);
+	ret = nvif_client_resume(&drm->client);
 	if (ret) {
 		NV_ERROR(drm, "Client resume failed with error: %d\n", ret);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 12c9ac68a23e..bf11f30da77c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -203,14 +203,11 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
 struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
-	struct nvif_client _client;
+	struct nvif_client client;
 	struct nvif_device device;
 	struct nvif_mmu mmu;
 
-	union {
-		struct nouveau_cli client;
-		struct nouveau_cli cli;
-	};
+	struct nouveau_cli cli;
 	struct drm_device *dev;
 
 	struct list_head clients;
@@ -340,25 +337,25 @@ void nouveau_drm_device_remove(struct drm_device *dev);
 	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
 } while(0)
 
-#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
-#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
-#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
-#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
+#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->cli, f, ##a)
+#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->cli, f, ##a)
+#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->cli, f, ##a)
+#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->cli, f, ##a)
 
 #define NV_DEBUG(drm,f,a...) do {                                              \
 	if (drm_debug_enabled(DRM_UT_DRIVER))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+		NV_PRINTK(info, &(drm)->cli, f, ##a);                       \
 } while(0)
 #define NV_ATOMIC(drm,f,a...) do {                                             \
 	if (drm_debug_enabled(DRM_UT_ATOMIC))                                  \
-		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
+		NV_PRINTK(info, &(drm)->cli, f, ##a);                       \
 } while(0)
 
 #define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
 
-#define NV_ERROR_ONCE(drm,f,a...) NV_PRINTK_ONCE(err, &(drm)->client, f, ##a)
-#define NV_WARN_ONCE(drm,f,a...) NV_PRINTK_ONCE(warn, &(drm)->client, f, ##a)
-#define NV_INFO_ONCE(drm,f,a...) NV_PRINTK_ONCE(info, &(drm)->client, f, ##a)
+#define NV_ERROR_ONCE(drm,f,a...) NV_PRINTK_ONCE(err, &(drm)->cli, f, ##a)
+#define NV_WARN_ONCE(drm,f,a...) NV_PRINTK_ONCE(warn, &(drm)->cli, f, ##a)
+#define NV_INFO_ONCE(drm,f,a...) NV_PRINTK_ONCE(info, &(drm)->cli, f, ##a)
 
 extern int nouveau_modeset;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index b58ab595faf8..df29c6805f4e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -49,7 +49,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 	int ret;
 
 	dma_resv_lock(robj, NULL);
-	nvbo = nouveau_bo_alloc(&drm->client, &size, &align,
+	nvbo = nouveau_bo_alloc(&drm->cli, &size, &align,
 				NOUVEAU_GEM_DOMAIN_GART, 0, 0, true);
 	if (IS_ERR(nvbo)) {
 		obj = ERR_CAST(nvbo);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 5b0f78e48cc7..f4224ebb38b2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -159,7 +159,7 @@ const struct ttm_resource_manager_func nv04_gart_manager = {
 static int
 nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 {
-	struct nvif_mmu *mmu = &drm->client.mmu;
+	struct nvif_mmu *mmu = &drm->cli.mmu;
 	int typei;
 
 	typei = nvif_mmu_type(mmu, NVIF_MEM_HOST | NVIF_MEM_MAPPABLE |
@@ -262,7 +262,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 {
 	struct nvkm_device *device = nvxx_device(drm);
 	struct nvkm_pci *pci = device->pci;
-	struct nvif_mmu *mmu = &drm->client.mmu;
+	struct nvif_mmu *mmu = &drm->cli.mmu;
 	struct drm_device *dev = drm->dev;
 	int typei, ret;
 
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index ba499dfb621d..94975d988002 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -129,7 +129,7 @@ nv17_fence_create(struct nouveau_drm *drm)
 	priv->base.context_del = nv10_fence_context_del;
 	spin_lock_init(&priv->lock);
 
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
+	ret = nouveau_bo_new(&drm->cli, 4096, 0x1000,
 			     NOUVEAU_GEM_DOMAIN_VRAM,
 			     0, 0x0000, NULL, NULL, &priv->bo);
 	if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 405a3f8ff4d4..f34ce93ff2ab 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -80,7 +80,7 @@ nv50_fence_create(struct nouveau_drm *drm)
 	priv->base.context_del = nv10_fence_context_del;
 	spin_lock_init(&priv->lock);
 
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
+	ret = nouveau_bo_new(&drm->cli, 4096, 0x1000,
 			     NOUVEAU_GEM_DOMAIN_VRAM,
 			     0, 0x0000, NULL, NULL, &priv->bo);
 	if (!ret) {
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 4b107c1a5686..c4ff1d2c9823 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -222,7 +222,7 @@ nv84_fence_create(struct nouveau_drm *drm)
 		  * will lose CPU/GPU coherency!
 		  */
 		NOUVEAU_GEM_DOMAIN_GART | NOUVEAU_GEM_DOMAIN_COHERENT;
-	ret = nouveau_bo_new(&drm->client, 16 * drm->chan_total, 0,
+	ret = nouveau_bo_new(&drm->cli, 16 * drm->chan_total, 0,
 			     domain, 0, 0, NULL, NULL, &priv->bo);
 	if (ret == 0) {
 		ret = nouveau_bo_pin(priv->bo, domain, false);
-- 
2.41.0

