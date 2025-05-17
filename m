Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A8BABA735
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52BED10EBEB;
	Sat, 17 May 2025 00:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qu9wT7yw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2045.outbound.protection.outlook.com [40.107.220.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9404F10EBE7
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXccxLHRWaQafki/aMpoi6iJBW1QhBTm9MwvOahK72cBNZykTXT1K+N2bOgp8n5AZ2APkt6mKQ0Dbmchz64b7rqrtrYAcYoKL7gxUkgY+GS2xrSTACEakTs+5zAR9eEAiD+VH95re/veiWmizSSol1IZv7iGxIiiPHPIBhrtn/OZdGSNO/6HxAt4NcCcgvO4UEXpv3uFnzZqUCr3eM0Qiws07d2bZObIM1f1m09ys0lX4q7rKjNOdPd/GWvEEUgVLZoH7BWAZeOtf4HU31hm1taYsh0jhvOhGLOklM6TOhap00g1EhpCqAPw9Xg1kIHy/lwqrbte7Da/gxAcxAvqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/n1DV3sN7XJPZZmHU0x8e4fsLIjqsImN8FdpSWYW9A=;
 b=HZLGzipt8dQUuIxI4RcnVzlNPL88qEs2KKqe2zOG+SbLridAXzcZxTSa80FsyOnYzuWvsavPRr9h/SxszYBnABvVn+QnZwvUZXq7rG9wy7SO1UxS29b7CyptAOYkEw4HJay4/zCdaeigz8czRJz4dbQ2OODQmy+dWbq33Eq7siF6CVV+xForgKPtEGTw83MjvTu0WMnts+xfWaqHOuP8FMAQRtyYwWhte6tCLSDZ5zxoaPoUSCJPAC+qk2nVi8wJXmyr8JnnJvhcwOeXwQRHULPLLZFIC5fFQ1LSr5ugijgIlFrfUmqUkxMAmnux/gZ803+7Jj2DQufpGIs7yRmwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w/n1DV3sN7XJPZZmHU0x8e4fsLIjqsImN8FdpSWYW9A=;
 b=qu9wT7yw+rxeHUFMcanttimQ5uz1NXGTQlWj3Mmuk3nxMMfTYejtuV1jvDUoOx0L/5XkpEFpnVdnhnR7kEfW7YxMhMWf9Xdebq/pSN+keNhtR3oNJq+p63hFG5NwiBfAAT0nw/9B+OTf1c4v0zhCT/PSi0/KT77o2AhZzKNOfk0hhFOn62QiM8er2me70+HWNtntSggeeoXhOQmjoEnKOEcp0sevalEsyXFTvCGDuCXVzvCa8Q9jDojF9HbPPa47fZ+7Xf2K2iE8AKo2GFlZSInxlL33CEGqd1bcz37NWhFZz/MM30PHFRogPfrNjA44kWYcQEfenckmySEDP+aQrg==
Received: from MW4PR04CA0305.namprd04.prod.outlook.com (2603:10b6:303:82::10)
 by DM4PR12MB6112.namprd12.prod.outlook.com (2603:10b6:8:aa::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.33; Sat, 17 May 2025 00:11:46 +0000
Received: from CY4PEPF0000FCC3.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::26) by MW4PR04CA0305.outlook.office365.com
 (2603:10b6:303:82::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.24 via Frontend Transport; Sat,
 17 May 2025 00:11:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC3.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:29 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:28 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 55/62] drm/nouveau: add helper functions for allocating
 pinned/cpu-mapped bos
Date: Sat, 17 May 2025 10:09:47 +1000
Message-ID: <20250517000954.35691-56-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC3:EE_|DM4PR12MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a7a41e-efec-46d8-fbcc-08dd94d768fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4q0f6zL12hmXX4qj/KCJemLdEaD9o1lBT7eVuVjyiYbwFXGAeoXecYq55WUi?=
 =?us-ascii?Q?+MasadtPuvRDrSzDT+UEcNhfhb6Ch+H7H/uSsuzLZZqD4xfRVEhVqxjp6UmS?=
 =?us-ascii?Q?k/eJlwqdkBYileAzvdrfSCJ/et8DUy6vvcUheCMxCjfqmVfhBeLnwYKFmcMr?=
 =?us-ascii?Q?nQPfLXLnkoThQJSC+GArddDSc3FxmJOPp8ENzTx0U/6xVzyGxyZ1b9sHEpbN?=
 =?us-ascii?Q?VZlKeux4o20ZTaYVNgLUS4n8qQVO+KEFxlVL2IabZAPlb1VQRBLWat8P7Swl?=
 =?us-ascii?Q?BidQrUFeu4Il1i1WYuy8MowAySfjWsJwxk4RrP4gkoxUxdAz4O0QGxpGOOPT?=
 =?us-ascii?Q?qdoVEcT2Ff70JWiUy1QuX6CdRlffgACvTcdBURds45q8G0QyEd1GWCY5AZe3?=
 =?us-ascii?Q?17/o0qU2Idy88s+1Wsi3RP01mPBLPI1Kr/XBUxA+AmUL692jkIB8Jrr3rtLt?=
 =?us-ascii?Q?U+mU589DDLlznSXQdvRyHLJq5vtq+VswuBOCiGo72BtznWGB6XdfpRghyqsc?=
 =?us-ascii?Q?A7kDCC5QlKH6hbTv7N1Djmi1vhiPNypppRDqmMmaALSo4ED/O+RVcVRdl8jP?=
 =?us-ascii?Q?0SWXodpCyuyWHDb60FeGj97hnjtrvXyHUyFHs0IqlyWg9RBwux7KTfgODvoM?=
 =?us-ascii?Q?KBqlT23lbkb7Nr8q8liLLVvYyELZzU+xg7bQEU8+WRK9xxZSfwD00qlOF/Y1?=
 =?us-ascii?Q?GDzIf4ncHwecnyEelmZmsTcUgJFKdhL5B+txoUSclvH2St2z7axL5zUDWkZz?=
 =?us-ascii?Q?Kws0j4zKvXi3reUzV5TRXrrndufv1blyXY1IfZnqW7JlT6Bvt5YJ0g6FKGzl?=
 =?us-ascii?Q?m+jZbBrU6f9SFgk9ag5izhJrf1jA+nVg3cLPnXpvrYYpBk4Cl085OEam7urV?=
 =?us-ascii?Q?jkd3QEPfILS7l8zI60zLU0or13fF/LkyqwMQ8CYEddHnRNuyO86143pYUoHz?=
 =?us-ascii?Q?MIupW8eKvsmSB5X8goN1gUV26/GRWwSXW4O8pzaoRD3+HNCTi6KYitBKNFwd?=
 =?us-ascii?Q?FpTt2xFjksYG3S5zxh36lMpaNcIWviMnQPCsfJoVSV6TuMrxrASS+f7NeWfv?=
 =?us-ascii?Q?kE+w97PJAULEQUIwkyTz5tVuvlMJxmqTo/PZRNU19WQvc6AJzf8nhYjK+Kt2?=
 =?us-ascii?Q?OnlXOn4mjFSYyxNwptRlAmgZePqV1lv4RyK1OiSsLPOST6MO/pAUGGciSOw3?=
 =?us-ascii?Q?jJ44Q6iHx1u6asXSUDmgXiE3LGNO5/lP4in2DAZSQtGt+y0xiI0quJnzd8wG?=
 =?us-ascii?Q?4bW2V9bfr05c0Wlfm/gNcqZS0FmO3md9hrw0c7T8kWSO/lNVyZmTF4zienDe?=
 =?us-ascii?Q?p886GT3iL1rFMHUPGfROOFuRT9B4bxVb25zsKANq6aXLeqtmy34Z4WXObQ+k?=
 =?us-ascii?Q?N//gRhcnRYxEzsc4z7ArRmAYcdsjEfC0iRekKuEaq3+Rn5FnKsaG304yn36R?=
 =?us-ascii?Q?pVZJbWYnwoXfO//axIuCmPD8nqJsLPty8GCP1itjnSUYvlO2qfo/0R8Xcgp1?=
 =?us-ascii?Q?TyWwYTo9vAkZHfToxOL//06xgwn+LQIBUdf7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:45.6243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a7a41e-efec-46d8-fbcc-08dd94d768fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6112
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

Replace some awkward sequences that are repeated in a number of places
with helper functions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c | 22 +++-------
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 20 +--------
 drivers/gpu/drm/nouveau/nouveau_bo.c    | 55 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_bo.h    |  5 +++
 drivers/gpu/drm/nouveau/nouveau_chan.c  | 14 +------
 drivers/gpu/drm/nouveau/nouveau_dmem.c  | 18 +++-----
 drivers/gpu/drm/nouveau/nv10_fence.c    |  6 +--
 drivers/gpu/drm/nouveau/nv17_fence.c    | 15 +------
 drivers/gpu/drm/nouveau/nv50_fence.c    | 15 +------
 drivers/gpu/drm/nouveau/nv84_fence.c    | 19 ++-------
 10 files changed, 81 insertions(+), 108 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 67146f1e8482..c063756eaea3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -768,9 +768,7 @@ static void nv_crtc_destroy(struct drm_crtc *crtc)
 		disp->image[nv_crtc->index] = NULL;
 	}
 
-	nouveau_bo_unmap(nv_crtc->cursor.nvbo);
-	nouveau_bo_unpin(nv_crtc->cursor.nvbo);
-	nouveau_bo_fini(nv_crtc->cursor.nvbo);
+	nouveau_bo_unpin_del(&nv_crtc->cursor.nvbo);
 	nvif_event_dtor(&nv_crtc->vblank);
 	nvif_head_dtor(&nv_crtc->head);
 	kfree(nv_crtc);
@@ -1303,6 +1301,7 @@ nv04_crtc_vblank_handler(struct nvif_event *event, void *repv, u32 repc)
 int
 nv04_crtc_create(struct drm_device *dev, int crtc_num)
 {
+	struct nouveau_cli *cli = &nouveau_drm(dev)->client;
 	struct nouveau_display *disp = nouveau_display(dev);
 	struct nouveau_crtc *nv_crtc;
 	struct drm_plane *primary;
@@ -1336,20 +1335,9 @@ nv04_crtc_create(struct drm_device *dev, int crtc_num)
 	drm_crtc_helper_add(&nv_crtc->base, &nv04_crtc_helper_funcs);
 	drm_mode_crtc_set_gamma_size(&nv_crtc->base, 256);
 
-	ret = nouveau_bo_new(&nouveau_drm(dev)->client, 64*64*4, 0x100,
-			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0x0000, NULL, NULL,
-			     &nv_crtc->cursor.nvbo);
-	if (!ret) {
-		ret = nouveau_bo_pin(nv_crtc->cursor.nvbo,
-				     NOUVEAU_GEM_DOMAIN_VRAM, false);
-		if (!ret) {
-			ret = nouveau_bo_map(nv_crtc->cursor.nvbo);
-			if (ret)
-				nouveau_bo_unpin(nv_crtc->cursor.nvbo);
-		}
-		if (ret)
-			nouveau_bo_fini(nv_crtc->cursor.nvbo);
-	}
+	ret = nouveau_bo_new_map(cli, NOUVEAU_GEM_DOMAIN_VRAM, 64 * 64 * 4, &nv_crtc->cursor.nvbo);
+	if (ret)
+		return ret;
 
 	nv04_cursor_init(nv_crtc);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 9bed728cb00e..10485510b539 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2808,10 +2808,7 @@ nv50_display_destroy(struct drm_device *dev)
 	nvif_object_dtor(&disp->caps);
 	nv50_core_del(&disp->core);
 
-	nouveau_bo_unmap(disp->sync);
-	if (disp->sync)
-		nouveau_bo_unpin(disp->sync);
-	nouveau_bo_fini(disp->sync);
+	nouveau_bo_unpin_del(&disp->sync);
 
 	nouveau_display(dev)->priv = NULL;
 	kfree(disp);
@@ -2843,20 +2840,7 @@ nv50_display_create(struct drm_device *dev)
 	dev->mode_config.normalize_zpos = true;
 
 	/* small shared memory area we use for notifiers and semaphores */
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
-			     NOUVEAU_GEM_DOMAIN_VRAM,
-			     0, 0x0000, NULL, NULL, &disp->sync);
-	if (!ret) {
-		ret = nouveau_bo_pin(disp->sync, NOUVEAU_GEM_DOMAIN_VRAM, true);
-		if (!ret) {
-			ret = nouveau_bo_map(disp->sync);
-			if (ret)
-				nouveau_bo_unpin(disp->sync);
-		}
-		if (ret)
-			nouveau_bo_fini(disp->sync);
-	}
-
+	ret = nouveau_bo_new_map(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, PAGE_SIZE, &disp->sync);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index fbe0144927e8..3a5ddf60380e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -401,6 +401,61 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	return 0;
 }
 
+void
+nouveau_bo_unpin_del(struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo = *pnvbo;
+
+	if (!nvbo)
+		return;
+
+	nouveau_bo_unmap(nvbo);
+	nouveau_bo_unpin(nvbo);
+	nouveau_bo_fini(nvbo);
+
+	*pnvbo = NULL;
+}
+
+int
+nouveau_bo_new_pin(struct nouveau_cli *cli, u32 domain, u32 size, struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	ret = nouveau_bo_new(cli, size, 0, domain, 0, 0, NULL, NULL, &nvbo);
+	if (ret)
+		return ret;
+
+	ret = nouveau_bo_pin(nvbo, domain, false);
+	if (ret) {
+		nouveau_bo_fini(nvbo);
+		return ret;
+	}
+
+	*pnvbo = nvbo;
+	return 0;
+}
+
+int
+nouveau_bo_new_map(struct nouveau_cli *cli, u32 domain, u32 size, struct nouveau_bo **pnvbo)
+{
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	ret = nouveau_bo_new_pin(cli, domain, size, &nvbo);
+	if (ret)
+		return ret;
+
+	ret = nouveau_bo_map(nvbo);
+	if (ret) {
+		nouveau_bo_unpin_del(&nvbo);
+		return ret;
+	}
+
+	*pnvbo = nvbo;
+	return 0;
+}
+
 static void
 set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 596a63a50a20..f402f14bebb0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -9,6 +9,7 @@ struct nouveau_channel;
 struct nouveau_cli;
 struct nouveau_drm;
 struct nouveau_fence;
+struct nouveau_vma;
 
 struct nouveau_bo {
 	struct ttm_buffer_object bo;
@@ -89,6 +90,10 @@ void nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo);
 void nouveau_bo_add_io_reserve_lru(struct ttm_buffer_object *bo);
 void nouveau_bo_del_io_reserve_lru(struct ttm_buffer_object *bo);
 
+int nouveau_bo_new_pin(struct nouveau_cli *, u32 domain, u32 size, struct nouveau_bo **);
+int nouveau_bo_new_map(struct nouveau_cli *, u32 domain, u32 size, struct nouveau_bo **);
+void nouveau_bo_unpin_del(struct nouveau_bo **);
+
 /* TODO: submit equivalent to TTM generic API upstream? */
 static inline void __iomem *
 nvbo_kmap_obj_iovirtual(struct nouveau_bo *nvbo)
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index a14aa6715bb9..4b4bbbd8d7b7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -105,10 +105,7 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_mem_dtor(&chan->mem_userd);
 		nvif_object_dtor(&chan->push.ctxdma);
 		nouveau_vma_del(&chan->push.vma);
-		nouveau_bo_unmap(chan->push.buffer);
-		if (chan->push.buffer && chan->push.buffer->bo.pin_count)
-			nouveau_bo_unpin(chan->push.buffer);
-		nouveau_bo_fini(chan->push.buffer);
+		nouveau_bo_unpin_del(&chan->push.buffer);
 		kfree(chan);
 	}
 	*pchan = NULL;
@@ -163,14 +160,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 	if (nouveau_vram_pushbuf)
 		target = NOUVEAU_GEM_DOMAIN_VRAM;
 
-	ret = nouveau_bo_new(cli, size, 0, target, 0, 0, NULL, NULL,
-			    &chan->push.buffer);
-	if (ret == 0) {
-		ret = nouveau_bo_pin(chan->push.buffer, target, false);
-		if (ret == 0)
-			ret = nouveau_bo_map(chan->push.buffer);
-	}
-
+	ret = nouveau_bo_new_map(cli, target, size, &chan->push.buffer);
 	if (ret) {
 		nouveau_channel_del(pchan);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 61d0f411ef84..ca4932a150e3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -256,20 +256,15 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	chunk->pagemap.ops = &nouveau_dmem_pagemap_ops;
 	chunk->pagemap.owner = drm->dev;
 
-	ret = nouveau_bo_new(&drm->client, DMEM_CHUNK_SIZE, 0,
-			     NOUVEAU_GEM_DOMAIN_VRAM, 0, 0, NULL, NULL,
-			     &chunk->bo);
+	ret = nouveau_bo_new_pin(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, DMEM_CHUNK_SIZE,
+				 &chunk->bo);
 	if (ret)
 		goto out_release;
 
-	ret = nouveau_bo_pin(chunk->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-	if (ret)
-		goto out_bo_free;
-
 	ptr = memremap_pages(&chunk->pagemap, numa_node_id());
 	if (IS_ERR(ptr)) {
 		ret = PTR_ERR(ptr);
-		goto out_bo_unpin;
+		goto out_bo_free;
 	}
 
 	mutex_lock(&drm->dmem->mutex);
@@ -292,10 +287,8 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 
 	return 0;
 
-out_bo_unpin:
-	nouveau_bo_unpin(chunk->bo);
 out_bo_free:
-	nouveau_bo_fini(chunk->bo);
+	nouveau_bo_unpin_del(&chunk->bo);
 out_release:
 	release_mem_region(chunk->pagemap.range.start, range_len(&chunk->pagemap.range));
 out_free:
@@ -426,8 +419,7 @@ nouveau_dmem_fini(struct nouveau_drm *drm)
 
 	list_for_each_entry_safe(chunk, tmp, &drm->dmem->chunks, list) {
 		nouveau_dmem_evict_chunk(chunk);
-		nouveau_bo_unpin(chunk->bo);
-		nouveau_bo_fini(chunk->bo);
+		nouveau_bo_unpin_del(&chunk->bo);
 		WARN_ON(chunk->callocated);
 		list_del(&chunk->list);
 		memunmap_pages(&chunk->pagemap);
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 8c73f40e3bda..40ee95340814 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -85,10 +85,8 @@ void
 nv10_fence_destroy(struct nouveau_drm *drm)
 {
 	struct nv10_fence_priv *priv = drm->fence;
-	nouveau_bo_unmap(priv->bo);
-	if (priv->bo)
-		nouveau_bo_unpin(priv->bo);
-	nouveau_bo_fini(priv->bo);
+
+	nouveau_bo_unpin_del(&priv->bo);
 	drm->fence = NULL;
 	kfree(priv);
 }
diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
index d09bfd11369f..1b0c0aa3c305 100644
--- a/drivers/gpu/drm/nouveau/nv17_fence.c
+++ b/drivers/gpu/drm/nouveau/nv17_fence.c
@@ -130,20 +130,7 @@ nv17_fence_create(struct nouveau_drm *drm)
 	priv->base.context_del = nv10_fence_context_del;
 	spin_lock_init(&priv->lock);
 
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
-			     NOUVEAU_GEM_DOMAIN_VRAM,
-			     0, 0x0000, NULL, NULL, &priv->bo);
-	if (!ret) {
-		ret = nouveau_bo_pin(priv->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-		if (!ret) {
-			ret = nouveau_bo_map(priv->bo);
-			if (ret)
-				nouveau_bo_unpin(priv->bo);
-		}
-		if (ret)
-			nouveau_bo_fini(priv->bo);
-	}
-
+	ret = nouveau_bo_new_map(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, PAGE_SIZE, &priv->bo);
 	if (ret) {
 		nv10_fence_destroy(drm);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
index 62e28dddf87c..e1f0e8adf313 100644
--- a/drivers/gpu/drm/nouveau/nv50_fence.c
+++ b/drivers/gpu/drm/nouveau/nv50_fence.c
@@ -81,20 +81,7 @@ nv50_fence_create(struct nouveau_drm *drm)
 	priv->base.context_del = nv10_fence_context_del;
 	spin_lock_init(&priv->lock);
 
-	ret = nouveau_bo_new(&drm->client, 4096, 0x1000,
-			     NOUVEAU_GEM_DOMAIN_VRAM,
-			     0, 0x0000, NULL, NULL, &priv->bo);
-	if (!ret) {
-		ret = nouveau_bo_pin(priv->bo, NOUVEAU_GEM_DOMAIN_VRAM, false);
-		if (!ret) {
-			ret = nouveau_bo_map(priv->bo);
-			if (ret)
-				nouveau_bo_unpin(priv->bo);
-		}
-		if (ret)
-			nouveau_bo_fini(priv->bo);
-	}
-
+	ret = nouveau_bo_new_map(&drm->client, NOUVEAU_GEM_DOMAIN_VRAM, PAGE_SIZE, &priv->bo);
 	if (ret) {
 		nv10_fence_destroy(drm);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index aa7dd0c5d917..1765b2cedaf9 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -185,10 +185,8 @@ static void
 nv84_fence_destroy(struct nouveau_drm *drm)
 {
 	struct nv84_fence_priv *priv = drm->fence;
-	nouveau_bo_unmap(priv->bo);
-	if (priv->bo)
-		nouveau_bo_unpin(priv->bo);
-	nouveau_bo_fini(priv->bo);
+
+	nouveau_bo_unpin_del(&priv->bo);
 	drm->fence = NULL;
 	kfree(priv);
 }
@@ -222,19 +220,8 @@ nv84_fence_create(struct nouveau_drm *drm)
 		  * will lose CPU/GPU coherency!
 		  */
 		NOUVEAU_GEM_DOMAIN_GART | NOUVEAU_GEM_DOMAIN_COHERENT;
-	ret = nouveau_bo_new(&drm->client, 16 * drm->chan_total, 0,
-			     domain, 0, 0, NULL, NULL, &priv->bo);
-	if (ret == 0) {
-		ret = nouveau_bo_pin(priv->bo, domain, false);
-		if (ret == 0) {
-			ret = nouveau_bo_map(priv->bo);
-			if (ret)
-				nouveau_bo_unpin(priv->bo);
-		}
-		if (ret)
-			nouveau_bo_fini(priv->bo);
-	}
 
+	ret = nouveau_bo_new_map(&drm->client, domain, 16 * drm->chan_total, &priv->bo);
 	if (ret)
 		nv84_fence_destroy(drm);
 	return ret;
-- 
2.49.0

