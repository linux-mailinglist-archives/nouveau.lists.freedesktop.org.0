Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06B9C5A73A
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 00:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D77C10E955;
	Thu, 13 Nov 2025 23:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jnICztFi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010034.outbound.protection.outlook.com [52.101.61.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F3C310E956
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 23:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvZRuOv3rKZj13/kJmdgI+VsVpVOgyVOt9rESH0babOMZ7YQal7PJx5MKvheUHreDBpFe5eWVSWFWECdjzMvgVSnEOi1GapYes4XBLffVZJxU08wNaBaJTyuIaYWsxa/9Qv8AKwUUDpU42UXlvWOZZPyUmSrfmgm80ywhOQcu8xqJ+TjQJMbPZwtfmNSQf6wlhkTBvFL8O0r86aYg3BgKDDBjz6piG4s0f/4yKST5Vge0TkUg23/jk1mZdKNuDr1qZIMu61Rd8uplxIdecfCaz6G14p92Rk2lkGNFMGNhO9LVAveVp90rNdgd3IMsMrZ9tLFnrDzQmUgzxPIqteKzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Irw9+XsLhZSPcsH0VlaxZhq8fDSOMkJN3ibae8QROI=;
 b=se4FHUP4grkebbVufIOndwcsqkrYP7TqvnKeks8yGmR71ttF9XT8tkbFxPFN7XVSo8aEny/QBsq1Cg5dGsJ1vgrfJsL9rP9StJ1U9bJwZEHXUudm8ZoZJgnCrEoNJMuCeWzcScpBHIF0eCc7QCx26WFF/CLXLPLbJBxGKAwC/Rvk0rcVlqAa2CdGpTzFGmZ9twZwUu0wEr8Z9du9Uyb3ES66ThIF7svaxDrzOZLNy22yKYqD2BqtY1MdeLS5OqD9vIa+CC+/P6x2aVvD+9JzciyHR9XKGlTwPYbmXwWAuYhZEVQIR4f5O444JaJMu1Kc9tySCvXmTXj413ZUN+WRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Irw9+XsLhZSPcsH0VlaxZhq8fDSOMkJN3ibae8QROI=;
 b=jnICztFiUutZ/Pfr99Z3Nd521rGP/mupiJxsJyoZ+XFwt3ECpmAbc35Qb/oa2pMwbWBfKJj/t8L5JoyNYRIjpBsUN4pc5HZ23QH6ELxvNDhFUIq18dmmjdira3WBKrFbmjlf7MOfNLgQiuNIuAlqk5/wU8xuwWdt374t5OxLISb7AbbSOOLu6Qpwe9SMr7Y4NhHecV2JKSjeA4KNvrL4E/Snn101uevyd9/BlCaLdpQbMvTagkCQidAzFuQf2EauAzBe4NO6HrBSgNspqrRsih2nyhGWfYKKxAtUfzhi2UGL6FonK3vnFwb6USE3QpXxU9K0rimrcP3e+5vL27vx7A==
Received: from SN6PR01CA0027.prod.exchangelabs.com (2603:10b6:805:b6::40) by
 IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 23:03:51 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:805:b6:cafe::b2) by SN6PR01CA0027.outlook.office365.com
 (2603:10b6:805:b6::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 23:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 23:03:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 15:03:33 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 15:03:32 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "Dave
 Airlie" <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/nouveau: verify that hardware supports the flush page
 address
Date: Thu, 13 Nov 2025 17:03:23 -0600
Message-ID: <20251113230323.1271726-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251113230323.1271726-1-ttabi@nvidia.com>
References: <20251113230323.1271726-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a32c1d-447e-4766-fb7f-08de2308e922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g1buA0dovN+oYTHqFydc1ZGEMQ5HWcGC4csfAgncWcBUBBry66nv/I84FJ5A?=
 =?us-ascii?Q?O1llDmLvCS1AwaqQGYrCqgTMU0cl1f5CxZcYDPe04lh2ilRYRctJZjAEQFnx?=
 =?us-ascii?Q?xGpKYhwB+WbCGhpUdEKg/HQFST0JRA8iruQsqLY3MJAZgAzLaAU/rDAV2yWJ?=
 =?us-ascii?Q?Y5giAEpfrsG43oEzjKFc/9qwoTvlWXw4bWg28ye8KXcefZgXqCuRZAaMqiah?=
 =?us-ascii?Q?ILZMhgfdUW0t/CHpxhM9lUbGV/3HcY+556JVEGQi4FL7ux2kBxDOzXzvogk3?=
 =?us-ascii?Q?jR8xxWlZoV/Du0JCNXydbe3/GJyQfVPIFfutXbLQikIYmz8P+JRr36/ovDFW?=
 =?us-ascii?Q?J3SD5/eWvR9U2doId6vUC+FlvdvhvO1dvLwB+B68ObOE4Eg17mpnKwfap/BQ?=
 =?us-ascii?Q?ikoVOWjDVkXgNiUJk/tjcZqNeMPs3lsQSN5yhNNKQfah/YQobbMwk6aPbS/l?=
 =?us-ascii?Q?pt7aPYX/FrToPukXgAISsAUNFKGy3GfU5djNxOXe1Uml1ongWFXE+9PQDQSN?=
 =?us-ascii?Q?qlXCDitUIuW8KzQxwtgpyHFyemstzUoxWq5JbzaJsnnT5idFcD+j7tBCDu62?=
 =?us-ascii?Q?l46nDFvW10TjqxUZMtZFMcXRIFYOYAQrSehqNy3EgkbRuxnAFqPzjYZ9FBMk?=
 =?us-ascii?Q?gMbm9TMP/4W3rCU532BSOrXJRr/ZtFn5ISino4vTl7Fu32Zb3cBnI6Eh7qhA?=
 =?us-ascii?Q?OR2fUjdGG/A+2b7peJ1KoUjotgLWvQD22MulCqooILQG7ur8y/+wU5XhZDhg?=
 =?us-ascii?Q?ARnnop1QYI23Fxkrz+xubjBH2smFO87R4ekDbHF1+2FQ37/Oi/DFezn659av?=
 =?us-ascii?Q?5ePAa67cS9FdgMdJlffQACkc28BzuUrlXZU6nT6t++58SvIlOKDDybXH7DWS?=
 =?us-ascii?Q?noBHn5x/a9ZbwpwoEpc5DDbJ0dW1Ljw/NkgxpgplJXauULReCqAglA/V1gh7?=
 =?us-ascii?Q?T5XEtufltpRfmcOClpswSau0wdTDNn6mxgCaW5pTidraDFFx0gbJzeDNFViJ?=
 =?us-ascii?Q?UGwi/KynTVStxQCim3YSbcXAwIkLgtkeS14A9Zkep+nf0J/98EGDjDIFCDNP?=
 =?us-ascii?Q?peHLeUHvq5866p6VPkGntAz5l/kr6t5ooXBR6YF0grkqB4CMEcekWdX2gnMm?=
 =?us-ascii?Q?kwn7DvbeNGaX3FxYQ8IHG0Ay1azfSoZNuVCuRAKmxgj/Ku1//VEF3n3e5cFp?=
 =?us-ascii?Q?iRFRc/ldohILahl71evEIInye4uquhngPb20tFv981duuZJfCFFecEZAAekI?=
 =?us-ascii?Q?tLS0XB10CTr5O99AFkrSCIkskrx6tK0GnV1Y7W1sdOZ7ulSezBQAr+VJid/1?=
 =?us-ascii?Q?xUtiKbfQCP+xhmYDXYfg0ngYqrvRrEYq2cS12wYK99LHMVh/5GkexqoN0oEM?=
 =?us-ascii?Q?dvJCLbFeaGNfvpBwuJSh80xF9JRzi8aMU0m9PC9Ib8Q06ORDxqC743vWEzzZ?=
 =?us-ascii?Q?D4tRrCOJotAs8IUdcWBIJXpq16KZrzg0XLDTGGKHdr+Q33nwYjasFbZJuioF?=
 =?us-ascii?Q?iyGTzJjTHMPl1z3KD05DmFgV+Ui0ZIk/yxStpAiqfHHQoxqOoDtHajFq1tYh?=
 =?us-ascii?Q?6FYFnm5so58qFaAb8cQ=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 23:03:50.9679 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a32c1d-447e-4766-fb7f-08de2308e922
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D
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

Ensure that the DMA address of the framebuffer flush page is not larger
than its hardware register.

On GPUs older than Hopper, the register for the address can hold up to a
40-bit address (right-shifted by 8 so that it fits in the 32-bit
register), and on Hopper and later it can be 52 bits (64-bit register
where bits 52-63 must be zero).

Recently it was discovered that under certain conditions, the flush page
could be allocated outside this range.  Although this bug was fixed, we
can ensure that any future changes to this code don't accidentally
generate an invalid page address.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c | 3 +++
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c  | 3 +++
 5 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
index 1c78c8853617..170776cc82fb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb100.c
@@ -15,6 +15,9 @@ gb100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
 	const u32 hshub = DRF_LO(NV_PFB_HSHUB0);
 	struct nvkm_device *device = fb->subdev.device;
 
+	// Ensure that the address is within hardware limits
+	WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
+
 	nvkm_wr32(device, hshub + NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_HI, addr_hi);
 	nvkm_wr32(device, hshub + NV_PFB_HSHUB_PCIE_FLUSH_SYSMEM_ADDR_LO, addr_lo);
 	nvkm_wr32(device, hshub + NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_HI, addr_hi);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
index 848505026d02..a21bf19e1041 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gb202.c
@@ -13,6 +13,9 @@ gb202_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
 	struct nvkm_device *device = fb->subdev.device;
 	const u64 addr = fb->sysmem.flush_page_addr;
 
+	// Ensure that the address is within hardware limits
+	WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
+
 	nvkm_wr32(device, NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_HI, upper_32_bits(addr));
 	nvkm_wr32(device, NV_PFB_FBHUB0_PCIE_FLUSH_SYSMEM_ADDR_LO, lower_32_bits(addr));
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c
index 07db9b397ac1..64281a09fb39 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gf100.c
@@ -80,6 +80,9 @@ gf100_fb_init_page(struct nvkm_fb *fb)
 void
 gf100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
 {
+	// Ensure that the address can actually fit in the register
+	WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(40));
+
 	nvkm_wr32(fb->subdev.device, 0x100c10, fb->sysmem.flush_page_addr >> 8);
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
index 2d8c51f882d5..8c9394048f25 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gh100.c
@@ -13,6 +13,9 @@ gh100_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
 	const u64 addr = fb->sysmem.flush_page_addr >> NV_PFB_NISO_FLUSH_SYSMEM_ADDR_SHIFT;
 	struct nvkm_device *device = fb->subdev.device;
 
+	// Ensure that the address is within hardware limits
+	WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(52));
+
 	nvkm_wr32(device, NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_HI, upper_32_bits(addr));
 	nvkm_wr32(device, NV_PFB_FBHUB_PCIE_FLUSH_SYSMEM_ADDR_LO, lower_32_bits(addr));
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c
index a6efbd913c13..076d968b7297 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c
@@ -214,6 +214,9 @@ nv50_fb_tags(struct nvkm_fb *base)
 static void
 nv50_fb_sysmem_flush_page_init(struct nvkm_fb *fb)
 {
+	// Ensure that the address can actually fit in the register
+	WARN_ON(fb->sysmem.flush_page_addr > DMA_BIT_MASK(40));
+
 	nvkm_wr32(fb->subdev.device, 0x100c08, fb->sysmem.flush_page_addr >> 8);
 }
 
-- 
2.51.2

