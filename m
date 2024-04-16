Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF628A790E
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50EF112F8F;
	Tue, 16 Apr 2024 23:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e40BWlGA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03067112F55
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MBej17bZA4O92am6ON5CNSn1XBV6Gc+70ZWX5JifYHtuuTw5oG2hkSEhiuWpa8+aW+esbnjLCEq84nGbb2hcXEEMApsF32V4HVs/auvf7mZF97PIaMo6mb3hRha3W/23kvFqY2RMJJ/zxK50mgn3rdykkSlo2xVoYFj5+Yon9/2u+Vk5KUyee0sSZ76mXSikVeQ/+Lrl63Sr4Hr+2Nzk+ACOFRFvQBQ/W0qSYmWe1sXbAYyDLTwQFVqLJJiqXFo3c0rjApK+lWeTgdoXRvN3P9TfbsI23dhkaD9XhmHdbCs6B30J43vxK0R90OXIoUXyQ1CZwqWb1XIIX/p28LKzzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF0bfV3ogDdjUTQtcCy+JS9b2MYvoFr6diVp1LgW35I=;
 b=oP2sxS/31P4XBBHVxyqZAXnWazhbMCc6LO4qvqg0QEEkAn+908ULkkEW1JW9f73nZ6O/xte5k21dYIVNjv619vFm7Nwdhh95CSab8VdthUViDZj4ZylwlhP4OXYjYJOlq0yg07pAiIRGE7BSxgCqGNF0aFWNWCh6AqXWl72NF4dxTQHkducL6xaR0uOgNAU5cVryowXVzYuP48D9eeZ+NnlOVzDDbK0XqtuzKVVnVRzilM586YbTR9bMu4nlPaTPGqR6Goh1WhfUxTpBR1Nax9137mxEfDAfugHYZmLXLtQHBnXExyv5AZqA/04s8lXquBMZBLuF3/B410ljlo7A5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF0bfV3ogDdjUTQtcCy+JS9b2MYvoFr6diVp1LgW35I=;
 b=e40BWlGAIhAeXDtT3Kjn2Y1GEXjivXiS46X/aorxAFpL3YktNbjBZGJKI0AfAD1wv0mU7qCPgbAYUOg+mf7FCyen2ScjFlJHhUay2OgRkwDU2txvkOGrAuufB3p3xylBge2HooS/yYXRsqyQCxPwFwmdFH6T7V9Hvsl7L1Ky4XmgYTwmtClpFkug73lKeicuUkjYTuwZTC6KrYfH5JBfXI4KUnSprVaszI6nsF5s7zIoMGhAY2i/qY+OOQ+M8nUgFVetjtiul+y19khZNcsfLbeJoQ3O/M/lMWWL2XYl6GNLpWBoGvm8rwxmSAYhfZ5k6cih1GTXJfhmfrQtwzi4yA==
Received: from DM6PR12CA0013.namprd12.prod.outlook.com (2603:10b6:5:1c0::26)
 by SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 16 Apr
 2024 23:42:33 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::98) by DM6PR12CA0013.outlook.office365.com
 (2603:10b6:5:1c0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:07 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 084/156] drm/nouveau/nvif: rework mem "map"/"unmap" apis
Date: Wed, 17 Apr 2024 09:38:50 +1000
Message-ID: <20240416234002.19509-85-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|SJ2PR12MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 1616f221-5fb2-4ec4-fdb3-08dc5e6ede0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8lzG60OMvGfdqXgPMDz4CrWLJkPOX5EE4JeWYVoIwZdHdadlvkzhh3zHYJY01DTnd3hEukIilrSdnuPkfEc9z46i+TRD70bYbflTsUmRHdHVQJWSdo5gqzOYJ9GcrQiCE2tnmaPrhtQhFO4kFZK6dDrrqf/MmHR2bpHWG1oVIrP7mOs7yP8z+nI3pX8GWgCKHF0ZKwyurOccJRej83IGXL1r5oUZlcwLgjbcdjDngj2EUL/bU3vbitoddlkqAl/ct2dfca2uz3EMfvHnc3dKySyjUtnH+7qIvK6mOkcNvoU+LKgT4FWora1qzxb7Wxt4PGolUR8JEsgaAl9jHadjh2ffbsXiNTSb2JMoJPSD1JSNTF1YbYlCAqW9jLqwN5IHOXgig4wEujYQeSTkggXpCs3bPX+ara/UOqr9jd6CjwWbVQY4wlr8P5s/647mRSPOrf47oB94PvN2sOVCZzAwBfUMZ42gL5N90NscNxNeRw00atV/GaAujqEkHnq7Njc81UQbg+TBuTbKGQ+x9zW4jeSpoRhs7Vw7eYKuya1L3weFiS/jbDjAE2n1V7Big1Hewzgfhp78KX/EWzBr+316fLKZARb3byDyYzsD1O/+g0No3DE74ZaHhfxQ8Iqh93QvawUVJrnnd9YBTKeag+4v28+2O0GGZi8NYcwcojOae2UHDv+HOv4ijxOmUqCpzJjudw7d9frNudmZlwe+/wUmUNowp/toQJRFDK8X11D7NubpFO0gmCHlHCLGcf1BHzSW
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(1800799015)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:24.3102 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1616f221-5fb2-4ec4-fdb3-08dc5e6ede0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8690
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
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |  8 ++--
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |  1 +
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c    |  4 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 14 +++---
 drivers/gpu/drm/nouveau/dispnv50/lut.c        | 12 ++---
 drivers/gpu/drm/nouveau/dispnv50/lut.h        |  5 +-
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  3 ++
 drivers/gpu/drm/nouveau/include/nvif/mem.h    |  6 ++-
 drivers/gpu/drm/nouveau/include/nvif/push.h   |  3 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 21 ++++----
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 31 +++++++-----
 drivers/gpu/drm/nouveau/nouveau_chan.h        |  6 ++-
 drivers/gpu/drm/nouveau/nouveau_dma.c         |  8 ++--
 drivers/gpu/drm/nouveau/nouveau_dma.h         |  2 +-
 drivers/gpu/drm/nouveau/nv10_fence.c          |  2 +-
 drivers/gpu/drm/nouveau/nvif/mem.c            | 48 ++++++++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/umem.c    | 24 ++++------
 18 files changed, 132 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 694c25a19e25..9482e69c3647 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -120,7 +120,7 @@ static void nv50_crc_ctx_flip_work(struct kthread_work *base)
 
 static inline void nv50_crc_reset_ctx(struct nv50_crc_notifier_ctx *ctx)
 {
-	memset_io(ctx->mem.object.map.ptr, 0, ctx->mem.object.map.size);
+	memset_io(ctx->map.ptr, 0, ctx->map.impl->length);
 }
 
 static void
@@ -503,7 +503,7 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 	struct nv50_core *core = nv50_disp(head->base.base.dev)->core;
 	int ret;
 
-	ret = nvif_mem_ctor_map(mmu, "kmsCrcNtfy", NVIF_MEM_VRAM, len, &ctx->mem);
+	ret = nvif_mem_ctor_map(mmu, "kmsCrcNtfy", NVIF_MEM_VRAM, len, &ctx->mem, &ctx->map);
 	if (ret)
 		return ret;
 
@@ -524,7 +524,7 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 	return 0;
 
 fail_fini:
-	nvif_mem_dtor(&ctx->mem);
+	nvif_mem_unmap_dtor(&ctx->mem, &ctx->map);
 	return ret;
 }
 
@@ -532,7 +532,7 @@ static inline void
 nv50_crc_ctx_fini(struct nv50_crc_notifier_ctx *ctx)
 {
 	nvif_object_dtor(&ctx->ntfy);
-	nvif_mem_dtor(&ctx->mem);
+	nvif_mem_unmap_dtor(&ctx->mem, &ctx->map);
 }
 
 int nv50_crc_set_source(struct drm_crtc *crtc, const char *source_str)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 4823f1fde2dd..48564ceddb97 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -40,6 +40,7 @@ enum nv50_crc_source_type {
 
 struct nv50_crc_notifier_ctx {
 	struct nvif_mem mem;
+	struct nvif_map map;
 	struct nvif_object ntfy;
 };
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index a674ba435b05..998978967c4c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -89,7 +89,7 @@ static u32 crc907d_get_entry(struct nv50_head *head,
 			     struct nv50_crc_notifier_ctx *ctx,
 			     enum nv50_crc_source source, int idx)
 {
-	struct crc907d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	struct crc907d_notifier __iomem *notifier = ctx->map.ptr;
 
 	return ioread32_native(&notifier->entries[idx].output_crc[0]);
 }
@@ -98,7 +98,7 @@ static bool crc907d_ctx_finished(struct nv50_head *head,
 				 struct nv50_crc_notifier_ctx *ctx)
 {
 	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
-	struct crc907d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	struct crc907d_notifier __iomem *notifier = ctx->map.ptr;
 	const u32 status = ioread32_native(&notifier->status);
 	const u32 overflow = status & 0x0000003e;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index 4821ce32f9ed..6af15f3232d9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -67,7 +67,7 @@ int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 u32 crcc37d_get_entry(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx,
 		      enum nv50_crc_source source, int idx)
 {
-	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	struct crcc37d_notifier __iomem *notifier = ctx->map.ptr;
 	struct crcc37d_entry __iomem *entry = &notifier->entries[idx];
 	u32 __iomem *crc_addr;
 
@@ -82,7 +82,7 @@ u32 crcc37d_get_entry(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx,
 bool crcc37d_ctx_finished(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
 	struct nouveau_drm *drm = nouveau_drm(head->base.base.dev);
-	struct crcc37d_notifier __iomem *notifier = ctx->mem.object.map.ptr;
+	struct crcc37d_notifier __iomem *notifier = ctx->map.ptr;
 	const u32 status = ioread32_native(&notifier->status);
 	const u32 overflow = status & 0x0000007e;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4508c24720e2..b89a8f4ee506 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -124,7 +124,7 @@ nv50_dmac_destroy(struct nv50_dmac *dmac)
 {
 	nv50_chan_destroy(&dmac->base);
 
-	nvif_mem_dtor(&dmac->push.mem);
+	nvif_mem_unmap_dtor(&dmac->push.mem, &dmac->push.map);
 }
 
 static void
@@ -132,7 +132,7 @@ nv50_dmac_kick(struct nvif_push *push)
 {
 	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
 
-	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
+	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.map.ptr;
 	if (push->hw.put != push->hw.cur) {
 		/* Push buffer fetches are not coherent with BAR1, we need to ensure
 		 * writes have been flushed right through to VRAM before writing PUT.
@@ -198,13 +198,13 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 	if (WARN_ON(size > push->hw.max))
 		return -EINVAL;
 
-	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
+	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.map.ptr;
 	if (push->hw.cur + size >= push->hw.max) {
 		int ret = nv50_dmac_wind(dmac);
 		if (ret)
 			return ret;
 
-		push->cur = dmac->push.mem.object.map.ptr;
+		push->cur = dmac->push.map.ptr;
 		push->cur = push->cur + push->hw.cur;
 		nv50_dmac_kick(push);
 	}
@@ -217,7 +217,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 		return -ETIMEDOUT;
 	}
 
-	push->bgn = dmac->push.mem.object.map.ptr;
+	push->bgn = dmac->push.map.ptr;
 	push->bgn = push->bgn + push->hw.cur;
 	push->cur = push->bgn;
 	push->end = push->cur + free;
@@ -253,13 +253,13 @@ nv50_dmac_create(struct nouveau_drm *drm,
 		type |= NVIF_MEM_VRAM;
 
 	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000,
-				&dmac->push.mem);
+				&dmac->push.mem, &dmac->push.map);
 	if (ret)
 		return ret;
 
 	dmac->push.wait = nv50_dmac_wait;
 	dmac->push.kick = nv50_dmac_kick;
-	dmac->push.bgn = dmac->push.mem.object.map.ptr;
+	dmac->push.bgn = dmac->push.map.ptr;
 	dmac->push.cur = dmac->push.bgn;
 	dmac->push.end = dmac->push.bgn;
 	dmac->push.hw.max = 0x1000/4 - 1;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/lut.c b/drivers/gpu/drm/nouveau/dispnv50/lut.c
index 7d68a7efc1d5..54885e5b3196 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/lut.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/lut.c
@@ -33,8 +33,8 @@ nv50_lut_load(struct nv50_lut *lut, int buffer, struct drm_property_blob *blob,
 	      void (*load)(struct drm_color_lut *, int, void __iomem *))
 {
 	struct drm_color_lut *in = blob ? blob->data : NULL;
-	void __iomem *mem = lut->mem[buffer].object.map.ptr;
-	const u32 addr = lut->mem[buffer].impl->addr;
+	void __iomem *mem = lut->id[buffer].map.ptr;
+	const u32 addr = lut->id[buffer].mem.impl->addr;
 	int i;
 
 	if (!in) {
@@ -59,8 +59,8 @@ void
 nv50_lut_fini(struct nv50_lut *lut)
 {
 	int i;
-	for (i = 0; i < ARRAY_SIZE(lut->mem); i++)
-		nvif_mem_dtor(&lut->mem[i]);
+	for (i = 0; i < ARRAY_SIZE(lut->id); i++)
+		nvif_mem_unmap_dtor(&lut->id[i].mem, &lut->id[i].map);
 }
 
 int
@@ -69,9 +69,9 @@ nv50_lut_init(struct nv50_disp *disp, struct nvif_mmu *mmu,
 {
 	const u32 size = disp->disp->object.oclass < GF110_DISP ? 257 : 1025;
 	int i;
-	for (i = 0; i < ARRAY_SIZE(lut->mem); i++) {
+	for (i = 0; i < ARRAY_SIZE(lut->id); i++) {
 		int ret = nvif_mem_ctor_map(mmu, "kmsLut", NVIF_MEM_VRAM,
-					    size * 8, &lut->mem[i]);
+					    size * 8, &lut->id[i].mem, &lut->id[i].map);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/lut.h b/drivers/gpu/drm/nouveau/dispnv50/lut.h
index b3b9040cfe9a..a7130c3c7a4a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/lut.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/lut.h
@@ -6,7 +6,10 @@ struct drm_color_lut;
 struct nv50_disp;
 
 struct nv50_lut {
-	struct nvif_mem mem[2];
+	struct {
+		struct nvif_mem mem;
+		struct nvif_map map;
+	} id[2];
 };
 
 int nv50_lut_init(struct nv50_disp *, struct nvif_mmu *, struct nv50_lut *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index de380979e1a4..2d883125f02b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -83,6 +83,9 @@ struct nvif_mem_impl {
 	u8 page;
 	u64 addr;
 	u64 size;
+
+	int (*map)(struct nvif_mem_priv *, void *argv, u32 argc, struct nvif_mapinfo *);
+	int (*unmap)(struct nvif_mem_priv *);
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/mem.h b/drivers/gpu/drm/nouveau/include/nvif/mem.h
index 8d432d238b95..e35cbc6f0ef7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/mem.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/mem.h
@@ -8,6 +8,7 @@ struct nvif_mem {
 	struct nvif_object object;
 
 	u8 type;
+	struct nvif_mapinfo mapinfo;
 };
 
 int nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
@@ -16,7 +17,10 @@ int nvif_mem_ctor_type(struct nvif_mmu *mmu, const char *name,
 int nvif_mem_ctor(struct nvif_mmu *mmu, const char *name, u8 type,
 		  u8 page, u64 size, void *argv, u32 argc, struct nvif_mem *);
 void nvif_mem_dtor(struct nvif_mem *);
+int nvif_mem_map(struct nvif_mem *, void *argv, u32 argc, struct nvif_map *);
+int nvif_mem_unmap(struct nvif_mem *);
 
 int nvif_mem_ctor_map(struct nvif_mmu *, const char *name, u8 type, u64 size,
-		      struct nvif_mem *);
+		      struct nvif_mem *, struct nvif_map *map);
+int nvif_mem_unmap_dtor(struct nvif_mem *, struct nvif_map *);
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/push.h b/drivers/gpu/drm/nouveau/include/nvif/push.h
index b88024ef6cc0..8817947a2ea0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/push.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/push.h
@@ -28,6 +28,7 @@
 
 struct nvif_push {
 	struct nvif_mem mem;
+	struct nvif_map map;
 
 	struct {
 		u32 cur;
@@ -68,7 +69,7 @@ PUSH_KICK(struct nvif_push *push)
 #ifdef CONFIG_NOUVEAU_DEBUG_PUSH
 #define PUSH_PRINTF(p,f,a...) do {                              \
 	struct nvif_push *_ppp = (p);                           \
-	u32 __o = _ppp->cur - (u32 *)_ppp->mem.object.map.ptr;  \
+	u32 __o = _ppp->cur - (u32 *)_ppp->map.ptr;             \
 	NVIF_DEBUG(&_ppp->mem.object, "%08x: "f, __o * 4, ##a); \
 	(void)__o;                                              \
 } while(0)
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 6c90f853513d..4c7aced7c398 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -1162,10 +1162,10 @@ nouveau_ttm_io_mem_free_locked(struct nouveau_drm *drm,
 		switch (reg->mem_type) {
 		case TTM_PL_TT:
 			if (mem->kind)
-				nvif_object_unmap_handle(&mem->mem.object);
+				mem->mem.impl->unmap(mem->mem.priv);
 			break;
 		case TTM_PL_VRAM:
-			nvif_object_unmap_handle(&mem->mem.object);
+			mem->mem.impl->unmap(mem->mem.priv);
 			break;
 		default:
 			break;
@@ -1222,7 +1222,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 				struct nv50_mem_map_v0 nv50;
 				struct gf100_mem_map_v0 gf100;
 			} args;
-			u64 handle, length;
+			struct nvif_mapinfo mapinfo;
 			u32 argc = 0;
 
 			switch (mmu->impl->mem.oclass) {
@@ -1244,16 +1244,17 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 				break;
 			}
 
-			ret = nvif_object_map_handle(&mem->mem.object,
-						     &args, argc,
-						     &handle, &length);
-			if (ret != 1) {
-				if (WARN_ON(ret == 0))
-					ret = -EINVAL;
+			ret = mem->mem.impl->map(mem->mem.priv, &args, argc, &mapinfo);
+			if (ret)
+				goto out;
+
+			if (WARN_ON(mapinfo.type != NVIF_MAP_IO)) {
+				mem->mem.impl->unmap(mem->mem.priv);
+				ret = -EINVAL;
 				goto out;
 			}
 
-			reg->bus.offset = handle;
+			reg->bus.offset = mapinfo.handle;
 		}
 		ret = 0;
 		break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index dd4f9915ccaf..db6eb3de694e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -101,8 +101,11 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_object_dtor(&chan->gart);
 		nvif_object_dtor(&chan->vram);
 		nvif_event_dtor(&chan->kill);
+		if (!chan->userd.map.impl)
+			chan->userd.map.ptr = NULL;
+		nvif_object_unmap_cpu(&chan->userd.map);
 		nvif_object_dtor(&chan->user);
-		nvif_mem_dtor(&chan->mem_userd);
+		nvif_mem_dtor(&chan->userd.mem);
 		nvif_object_dtor(&chan->push.ctxdma);
 		nouveau_vma_del(&chan->push.vma);
 		nouveau_bo_unmap(chan->push.buffer);
@@ -131,7 +134,7 @@ nouveau_channel_wait(struct nvif_push *push, u32 size)
 	chan->dma.cur = chan->dma.cur + (chan->chan.push.cur - chan->chan.push.bgn);
 	ret = RING_SPACE(chan, size);
 	if (ret == 0) {
-		chan->chan.push.bgn = chan->chan.push.mem.object.map.ptr;
+		chan->chan.push.bgn = chan->chan.push.map.ptr;
 		chan->chan.push.bgn = chan->chan.push.bgn + chan->dma.cur;
 		chan->chan.push.cur = chan->chan.push.bgn;
 		chan->chan.push.end = chan->chan.push.bgn + size;
@@ -179,7 +182,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 	chan->chan.push.mem.object.parent = cli->base.object.parent;
 	chan->chan.push.mem.object.client = &cli->base;
 	chan->chan.push.mem.object.name = "chanPush";
-	chan->chan.push.mem.object.map.ptr = chan->push.buffer->kmap.virtual;
+	chan->chan.push.map.ptr = chan->push.buffer->kmap.virtual;
 	chan->chan.push.wait = nouveau_channel_wait;
 	chan->chan.push.kick = nouveau_channel_kick;
 
@@ -330,16 +333,12 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	if (oclass >= VOLTA_CHANNEL_GPFIFO_A) {
 		ret = nvif_mem_ctor(&cli->mmu, "abi16ChanUSERD",
 				    NVIF_MEM_VRAM | NVIF_MEM_COHERENT | NVIF_MEM_MAPPABLE,
-				    0, PAGE_SIZE, NULL, 0, &chan->mem_userd);
+				    0, PAGE_SIZE, NULL, 0, &chan->userd.mem);
 		if (ret)
 			return ret;
 
-		args.chan.huserd = nvif_handle(&chan->mem_userd.object);
+		args.chan.huserd = nvif_handle(&chan->userd.mem.object);
 		args.chan.ouserd = 0;
-
-		chan->userd = &chan->mem_userd.object;
-	} else {
-		chan->userd = &chan->user;
 	}
 
 	get_task_comm(name, current);
@@ -366,9 +365,17 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	struct nv_dma_v0 args = {};
 	int ret, i;
 
-	ret = nvif_object_map(chan->userd, NULL, 0);
-	if (ret)
-		return ret;
+	if (!chan->userd.mem.impl) {
+		ret = nvif_object_map(&chan->user, NULL, 0);
+		if (ret)
+			return ret;
+
+		chan->userd.map.ptr = chan->user.map.ptr;
+	} else {
+		ret = nvif_mem_map(&chan->userd.mem, NULL, 0, &chan->userd.map);
+		if (ret)
+			return ret;
+	}
 
 	if (chan->user.oclass >= FERMI_CHANNEL_GPFIFO) {
 		struct {
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 016f668c0bc1..811271ae6fe1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -14,8 +14,10 @@ struct nouveau_channel {
 	struct nouveau_cli *cli;
 	struct nouveau_vmm *vmm;
 
-	struct nvif_mem mem_userd;
-	struct nvif_object *userd;
+	struct {
+		struct nvif_mem mem;
+		struct nvif_map map;
+	} userd;
 
 	int runlist;
 	int chid;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouveau/nouveau_dma.c
index 83eb9c9fa67e..43374a04654a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
@@ -42,9 +42,9 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_get, int *timeout)
 {
 	uint64_t val;
 
-	val = nvif_rd32(chan->userd, chan->user_get);
+	val = nvif_rd32(&chan->userd, chan->user_get);
         if (chan->user_get_hi)
-		val |= (uint64_t)nvif_rd32(chan->userd, chan->user_get_hi) << 32;
+		val |= (uint64_t)nvif_rd32(&chan->userd, chan->user_get_hi) << 32;
 
 	/* reset counter as long as GET is still advancing, this is
 	 * to avoid misdetecting a GPU lockup if the GPU happens to
@@ -89,7 +89,7 @@ nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
 	/* Flush writes. */
 	nouveau_bo_rd32(pb, 0);
 
-	nvif_wr32(chan->userd, 0x8c, chan->dma.ib_put);
+	nvif_wr32(&chan->userd, 0x8c, chan->dma.ib_put);
 	if (user->func && user->func->doorbell)
 		user->func->doorbell(user, chan->token);
 	chan->dma.ib_free--;
@@ -101,7 +101,7 @@ nv50_dma_push_wait(struct nouveau_channel *chan, int count)
 	uint32_t cnt = 0, prev_get = 0;
 
 	while (chan->dma.ib_free < count) {
-		uint32_t get = nvif_rd32(chan->userd, 0x88);
+		uint32_t get = nvif_rd32(&chan->userd, 0x88);
 		if (get != prev_get) {
 			prev_get = get;
 			cnt = 0;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index c52cda82353e..e5d718844c76 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -84,7 +84,7 @@ OUT_RING(struct nouveau_channel *chan, int data)
 #define WRITE_PUT(val) do {                                                    \
 	mb();                                                   \
 	nouveau_bo_rd32(chan->push.buffer, 0);                                 \
-	nvif_wr32(&chan->user, chan->user_put, ((val) << 2) + chan->push.addr);\
+	nvif_wr32(&chan->userd, chan->user_put, ((val) << 2) + chan->push.addr);\
 } while (0)
 
 static inline void
diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c b/drivers/gpu/drm/nouveau/nv10_fence.c
index 1e45b5fcbf23..cbef6ef4bfb7 100644
--- a/drivers/gpu/drm/nouveau/nv10_fence.c
+++ b/drivers/gpu/drm/nouveau/nv10_fence.c
@@ -52,7 +52,7 @@ nv10_fence_sync(struct nouveau_fence *fence,
 u32
 nv10_fence_read(struct nouveau_channel *chan)
 {
-	return NVIF_RD32(&chan->user, NV06E, REFERENCE);
+	return NVIF_RD32(&chan->userd, NV06E, REFERENCE);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvif/mem.c b/drivers/gpu/drm/nouveau/nvif/mem.c
index 73e66cbfbe43..91faecc4c080 100644
--- a/drivers/gpu/drm/nouveau/nvif/mem.c
+++ b/drivers/gpu/drm/nouveau/nvif/mem.c
@@ -26,14 +26,56 @@
 
 #include <nvif/if000a.h>
 
+int
+nvif_mem_unmap(struct nvif_mem *mem)
+{
+	if (!mem->mapinfo.length)
+		return 0;
+
+	mem->impl->unmap(mem->priv);
+	mem->mapinfo.length = 0;
+	return 0;
+}
+
+int
+nvif_mem_map(struct nvif_mem *mem, void *argv, u32 argc, struct nvif_map *map)
+{
+	int ret;
+
+	ret = mem->impl->map(mem->priv, argv, argc, &mem->mapinfo);
+	if (ret)
+		return ret;
+
+	ret = nvif_object_map_cpu(&mem->object, &mem->mapinfo, map);
+	if (ret)
+		mem->impl->unmap(mem->priv);
+
+	return ret;
+}
+
+int
+nvif_mem_unmap_dtor(struct nvif_mem *mem, struct nvif_map *map)
+{
+	int ret = 0;
+
+	if (mem->mapinfo.length) {
+		if (map)
+			ret = nvif_object_unmap_cpu(map);
+
+		nvif_mem_unmap(mem);
+	}
+
+	return ret;
+}
+
 int
 nvif_mem_ctor_map(struct nvif_mmu *mmu, const char *name, u8 type, u64 size,
-		  struct nvif_mem *mem)
+		  struct nvif_mem *mem, struct nvif_map *map)
 {
 	int ret = nvif_mem_ctor(mmu, name, NVIF_MEM_MAPPABLE | type,
 				0, size, NULL, 0, mem);
 	if (ret == 0) {
-		ret = nvif_object_map(&mem->object, NULL, 0);
+		ret = nvif_mem_map(mem, NULL, 0, map);
 		if (ret)
 			nvif_mem_dtor(mem);
 	}
@@ -46,6 +88,8 @@ nvif_mem_dtor(struct nvif_mem *mem)
 	if (!mem->impl)
 		return;
 
+	nvif_mem_unmap(mem);
+
 	mem->impl->del(mem->priv);
 	mem->impl = NULL;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index f1ec0ed8e7c3..6756e3e207d9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -78,10 +78,8 @@ nvkm_umem_search(struct nvkm_mmu *mmu, struct nvkm_client *client, u64 handle)
 }
 
 static int
-nvkm_umem_unmap(struct nvkm_object *object)
+nvkm_umem_unmap(struct nvif_mem_priv *umem)
 {
-	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
-
 	if (!umem->map)
 		return -EEXIST;
 
@@ -101,10 +99,8 @@ nvkm_umem_unmap(struct nvkm_object *object)
 }
 
 static int
-nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
-	      enum nvkm_object_map *type, u64 *handle, u64 *length)
+nvkm_umem_map(struct nvif_mem_priv *umem, void *argv, u32 argc, struct nvif_mapinfo *map)
 {
-	struct nvif_mem_priv *umem = container_of(object, typeof(*umem), object);
 	struct nvkm_mmu *mmu = umem->mmu;
 
 	if (!umem->mappable)
@@ -117,24 +113,24 @@ nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
 		if (ret)
 			return ret;
 
-		*handle = (unsigned long)(void *)umem->map;
-		*length = nvkm_memory_size(umem->memory);
-		*type = NVKM_OBJECT_MAP_VA;
+		map->handle = (unsigned long)(void *)umem->map;
+		map->length = nvkm_memory_size(umem->memory);
+		map->type = NVIF_MAP_VA;
 		return 0;
 	} else
 	if ((umem->type & NVKM_MEM_VRAM) ||
 	    (umem->type & NVKM_MEM_KIND)) {
 		int ret = mmu->func->mem.umap(mmu, umem->memory, argv, argc,
-					      handle, length, &umem->bar);
+					      &map->handle, &map->length, &umem->bar);
 		if (ret)
 			return ret;
 
-		*type = NVKM_OBJECT_MAP_IO;
+		map->type = NVIF_MAP_IO;
 	} else {
 		return -EINVAL;
 	}
 
-	umem->io = (*type == NVKM_OBJECT_MAP_IO);
+	umem->io = (map->type == NVIF_MAP_IO);
 	return 0;
 }
 
@@ -149,6 +145,8 @@ nvkm_umem_del(struct nvif_mem_priv *umem)
 static const struct nvif_mem_impl
 nvkm_umem_impl = {
 	.del = nvkm_umem_del,
+	.map = nvkm_umem_map,
+	.unmap = nvkm_umem_unmap,
 };
 
 static void *
@@ -166,8 +164,6 @@ nvkm_umem_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_umem = {
 	.dtor = nvkm_umem_dtor,
-	.map = nvkm_umem_map,
-	.unmap = nvkm_umem_unmap,
 };
 
 int
-- 
2.41.0

