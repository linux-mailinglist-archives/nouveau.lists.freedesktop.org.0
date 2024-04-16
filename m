Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C38A7946
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388F0112FE9;
	Tue, 16 Apr 2024 23:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I1KiaAYe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84D8112FED
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apW+vYjDeJwW2hogTOo2sDndDZHUg6/FnifufHwXkyAN+LMvZit5pqb/me5OfIczqEF8eGpyFoZ32qLGc1J13uBuKsxHkNUh1EN3Cr0rk0o8FA0UCL7/FP+pjtf0ZWi3kxwrZWO17AnpcVYCn0IDuX9oHLQDhPopOhohKKIfW9viOkGLtBBjjBvTRz70q+Zp1iiItQGOVbPu/5ymW9LxESUiWLcHzonNPzAl/Olo7RntDu9QJXxOHK90dzMYI8rdX+scezCEjKRVI8PvdcmXykPFegrh0zBcrnR5JmSVMZ7S7YJgOru+mvz/g4l5y30B70OHZdhPh3mi8dPLw1FWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKm3TsQzSwJ5zYIA8W9utcXOY7oxqW6L5B4oTNW4U6Q=;
 b=JRbp97PTXrE3DCQpYXdbUESoVrQExMvJyqeCBVA0TYJWLuceps9vkrO5/6fpr+MuTlB7hx+NxiQwqvPtMNc2ErqYsdjRRnmONLDFxKXz2+RVApHdrfDKmMJuZMcXm9V3sP+SXQrUCAN4OyHLBnNigNWLf7QapMaRvPJGEmXH5imL0XKmowKQGo/7YUb5d65Ty2SzEZbu1S6bYI1F2H/syQgA/JY2mV2O1UvVx3hOZIuFim4FO8gniftDSZ+LirKMnivagXIOHoZlvqSKydKSdw4rGf+oKrYTgpW75UpEd5Lqj9Pi/1yZjIhooAP8ysGiEewgOLoRKjEFxOqV5s3AKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKm3TsQzSwJ5zYIA8W9utcXOY7oxqW6L5B4oTNW4U6Q=;
 b=I1KiaAYe5c+6TbNI37znPbjuHz6Gy01ZHrIW+LpvSnxiBEs9oqAaXNz9IcyKVcbk8NbS8RTtUFoCQgd7PZQAgjMRWOgPIOQxl0Gp6QDw5dfFJRbOY7ZpYi0eKPHbV5LWoOVP5mV1TI+R0GolY4fZS9cXYBNxhVlOQnX0+isjmbZcRWSgiPoDiB98s8HKMK6Ia2K4yFpFnVdz858GL5tez5W2W5750jLaQGp86jPdOIRnR3C33pYAscxBKES5YkuV7THAa79tmX9bUG/r8SihsZYRk+AjvJwh8e6qmjuFcxj0khLwcZxtVTVfKBVZvH7Q1KN+iZ+p3XIice9Qj5cN+g==
Received: from CH0PR03CA0415.namprd03.prod.outlook.com (2603:10b6:610:11b::26)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:43 +0000
Received: from DS2PEPF0000343C.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::54) by CH0PR03CA0415.outlook.office365.com
 (2603:10b6:610:11b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343C.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:43 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:27 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 154/156] drm/nouveau: remove remaining usage of
 nvif_device.info
Date: Wed, 17 Apr 2024 09:40:00 +1000
Message-ID: <20240416234002.19509-155-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343C:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb965ff-1b09-4195-5943-08dc5e6f0d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ptZEfewuhGiwudEILe6VeiAZP7otWje9XW9BDEyNDcCbr/uDMoacS6S9ezYrz11NbALndqFx9f+QqIWPKVHpa6Gp/tpx5ALxJhiexojYgedv7u4DO6hIqwScrdNO9NM/Eu88GhYPYAjCHueTCssCHRWY9/Fr9MOhnKgcqnJbBCWqBT2oY6Mosngm9J0pRvic0KEal5lw4yAxHCZV9Iv8BpU8z1HEJ4S4Q3QMSb6Pq+xf6Hs7rsQpYTIY4l/d+F50Q+Hv5HY7kjjE9So7LUUsTvvE3YQiHijxuOKii1RZeZP05rU4Uuuu2K6a56wLJT8Q5+oC0Uykn/8++TWHXsSHEVUOcGxL3hVO+lzucslVY3PffCNeGZMFQsutSZSWdEq6/3tx+DWoP+4B6Gkc9BXvvCNB+ew6gnypS2o12yerVQkJglxaVS5yI0vn8yYPtV7Vn12KWiYn0rV5fUH3LDW0AU/VXN9auWWc5iXnGxiIMsXL2vLhPRQz308AJPlTjXplaUfmJ4UW9G52ro3PqKU3EojK8lbhuUvv6HZ2Qpv5iD+Krzg0DoQ+Y5W+Qw1XZiPbT7pi6Pb0mVOll19EIS2+EZnsAaFkB65mbr4rYPrkngpql3Dr61LznYfWt/e51nSCMrPForfkZxyfgMtAF68dA/MLpv+fB99ehhXyUXC6UHr9pep9gys/POxQC/mLbW5oF2g3BW74iAcpf83FpU8LTiRzhi+GC30Ep3yTqyLh8kB09F0rWniQVMSyWrJRaglw
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:43.4619 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb965ff-1b09-4195-5943-08dc5e6f0d3e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

- complete the switch to nvif_device.impl

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c        |  7 +-
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       | 34 +++++-----
 drivers/gpu/drm/nouveau/dispnv04/cursor.c     |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |  6 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  8 +--
 drivers/gpu/drm/nouveau/dispnv04/disp.h       |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.c         | 66 +++++++++----------
 drivers/gpu/drm/nouveau/dispnv04/hw.h         | 25 ++++---
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    | 13 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     | 10 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       | 12 ++--
 drivers/gpu/drm/nouveau/include/nvif/device.h |  3 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c       | 50 ++++++++------
 drivers/gpu/drm/nouveau/nouveau_backlight.c   | 22 +++----
 drivers/gpu/drm/nouveau/nouveau_bios.c        | 12 ++--
 drivers/gpu/drm/nouveau/nouveau_bo.c          | 38 +++++------
 drivers/gpu/drm/nouveau/nouveau_chan.c        | 20 +++---
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 22 +++----
 drivers/gpu/drm/nouveau/nouveau_display.c     | 27 ++++----
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 14 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 ++--
 drivers/gpu/drm/nouveau/nouveau_sgdma.c       |  2 +-
 drivers/gpu/drm/nouveau/nouveau_svm.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         | 21 +++---
 drivers/gpu/drm/nouveau/nouveau_vga.c         |  8 +--
 drivers/gpu/drm/nouveau/nv84_fence.c          |  2 +-
 drivers/gpu/drm/nouveau/nvif/device.c         | 14 ----
 29 files changed, 224 insertions(+), 237 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index 1d3542d6006b..8a56b0868128 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -193,8 +193,7 @@ static void
 nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
 		int *burst, int *lwm)
 {
-	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	struct nv_fifo_info fifo_data;
 	struct nv_sim_state sim_data;
 	int MClk = nouveau_hw_get_clock(dev, PLL_MEMORY);
@@ -226,7 +225,7 @@ nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
 		sim_data.mem_page_miss = ((cfg1 >> 4) & 0xf) + ((cfg1 >> 31) & 0x1);
 	}
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_TNT)
+	if (device->impl->family == NVIF_DEVICE_TNT)
 		nv04_calc_arb(&fifo_data, &sim_data);
 	else
 		nv10_calc_arb(&fifo_data, &sim_data);
@@ -254,7 +253,7 @@ nouveau_calc_arb(struct drm_device *dev, int vclk, int bpp, int *burst, int *lwm
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_KELVIN)
+	if (drm->device.impl->family < NVIF_DEVICE_KELVIN)
 		nv04_update_arb(dev, vclk, bpp, burst, lwm);
 	else if ((pdev->device & 0xfff0) == 0x0240 /*CHIPSET_C51*/ ||
 		 (pdev->device & 0xfff0) == 0x03d0 /*CHIPSET_C512*/) {
diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 90e549541981..7f83927ddf96 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -143,7 +143,7 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	 * has yet been observed in allowing the use a single stage pll on all
 	 * nv43 however.  the behaviour of single stage use is untested on nv40
 	 */
-	if (drm->client.device.info.chipset > 0x40 && dot_clock <= (pll_lim.vco1.max_freq / 2))
+	if (drm->device.impl->chipset > 0x40 && dot_clock <= (pll_lim.vco1.max_freq / 2))
 		memset(&pll_lim.vco2, 0, sizeof(pll_lim.vco2));
 
 
@@ -153,10 +153,10 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 	state->pllsel &= PLLSEL_VPLL1_MASK | PLLSEL_VPLL2_MASK | PLLSEL_TV_MASK;
 
 	/* The blob uses this always, so let's do the same */
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 		state->pllsel |= NV_PRAMDAC_PLL_COEFF_SELECT_USE_VPLL2_TRUE;
 	/* again nv40 and some nv43 act more like nv3x as described above */
-	if (drm->client.device.info.chipset < 0x41)
+	if (drm->device.impl->chipset < 0x41)
 		state->pllsel |= NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_MPLL |
 				 NV_PRAMDAC_PLL_COEFF_SELECT_SOURCE_PROG_NVPLL;
 	state->pllsel |= nv_crtc->index ? PLLSEL_VPLL2_MASK : PLLSEL_VPLL1_MASK;
@@ -275,7 +275,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
 		horizEnd = horizTotal - 2;
 		horizBlankEnd = horizTotal + 4;
 #if 0
-		if (dev->overlayAdaptor && drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
+		if (dev->overlayAdaptor && drm->device.impl->family >= NVIF_DEVICE_CELSIUS)
 			/* This reportedly works around some video overlay bandwidth problems */
 			horizTotal += 2;
 #endif
@@ -510,7 +510,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 	regp->cursor_cfg = NV_PCRTC_CURSOR_CONFIG_CUR_LINES_64 |
 			     NV_PCRTC_CURSOR_CONFIG_CUR_PIXELS_64 |
 			     NV_PCRTC_CURSOR_CONFIG_ADDRESS_SPACE_PNVM;
-	if (drm->client.device.info.chipset >= 0x11)
+	if (drm->device.impl->chipset >= 0x11)
 		regp->cursor_cfg |= NV_PCRTC_CURSOR_CONFIG_CUR_BPP_32;
 	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
 		regp->cursor_cfg |= NV_PCRTC_CURSOR_CONFIG_DOUBLE_SCAN_ENABLE;
@@ -551,26 +551,26 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 	 * 1 << 30 on 0x60.830), for no apparent reason */
 	regp->CRTC[NV_CIO_CRE_59] = off_chip_digital;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE)
+	if (drm->device.impl->family >= NVIF_DEVICE_RANKINE)
 		regp->CRTC[0x9f] = off_chip_digital ? 0x11 : 0x1;
 
 	regp->crtc_830 = mode->crtc_vdisplay - 3;
 	regp->crtc_834 = mode->crtc_vdisplay - 1;
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 		/* This is what the blob does */
 		regp->crtc_850 = NVReadCRTC(dev, 0, NV_PCRTC_850);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE)
+	if (drm->device.impl->family >= NVIF_DEVICE_RANKINE)
 		regp->gpio_ext = NVReadCRTC(dev, 0, NV_PCRTC_GPIO_EXT);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS)
 		regp->crtc_cfg = NV10_PCRTC_CONFIG_START_ADDRESS_HSYNC;
 	else
 		regp->crtc_cfg = NV04_PCRTC_CONFIG_START_ADDRESS_HSYNC;
 
 	/* Some misc regs */
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE) {
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE) {
 		regp->CRTC[NV_CIO_CRE_85] = 0xFF;
 		regp->CRTC[NV_CIO_CRE_86] = 0x1;
 	}
@@ -582,7 +582,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 
 	/* Generic PRAMDAC regs */
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS)
 		/* Only bit that bios and blob set. */
 		regp->nv10_cursync = (1 << 25);
 
@@ -591,7 +591,7 @@ nv_crtc_mode_set_regs(struct drm_crtc *crtc, struct drm_display_mode * mode)
 				NV_PRAMDAC_GENERAL_CONTROL_PIXMIX_ON;
 	if (fb->format->depth == 16)
 		regp->ramdac_gen_ctrl |= NV_PRAMDAC_GENERAL_CONTROL_ALT_MODE_SEL;
-	if (drm->client.device.info.chipset >= 0x11)
+	if (drm->device.impl->chipset >= 0x11)
 		regp->ramdac_gen_ctrl |= NV_PRAMDAC_GENERAL_CONTROL_PIPE_LONG;
 
 	regp->ramdac_630 = 0; /* turn off green mode (tv test pattern?) */
@@ -655,7 +655,7 @@ nv_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
 
 	nv_crtc_mode_set_vga(crtc, adjusted_mode);
 	/* calculated in nv04_dfp_prepare, nv40 needs it written before calculating PLLs */
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK, nv04_display(dev)->mode_reg.sel_clk);
 	nv_crtc_mode_set_regs(crtc, adjusted_mode);
 	nv_crtc_calc_state_ext(crtc, mode, adjusted_mode->clock);
@@ -716,7 +716,7 @@ static void nv_crtc_prepare(struct drm_crtc *crtc)
 
 	/* Some more preparation. */
 	NVWriteCRTC(dev, nv_crtc->index, NV_PCRTC_CONFIG, NV_PCRTC_CONFIG_START_ADDRESS_NON_VGA);
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE) {
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE) {
 		uint32_t reg900 = NVReadRAMDAC(dev, nv_crtc->index, NV_PRAMDAC_900);
 		NVWriteRAMDAC(dev, nv_crtc->index, NV_PRAMDAC_900, reg900 & ~0x10000);
 	}
@@ -892,7 +892,7 @@ nv04_crtc_do_mode_set_base(struct drm_crtc *crtc,
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_FF_INDEX);
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_FFLWM__INDEX);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_KELVIN) {
+	if (drm->device.impl->family >= NVIF_DEVICE_KELVIN) {
 		regp->CRTC[NV_CIO_CRE_47] = arb_lwm >> 8;
 		crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_47);
 	}
@@ -965,7 +965,7 @@ static void nv11_cursor_upload(struct drm_device *dev, struct nouveau_bo *src,
 		{
 			struct nouveau_drm *drm = nouveau_drm(dev);
 
-			if (drm->client.device.info.chipset == 0x11) {
+			if (drm->device.impl->chipset == 0x11) {
 				pixel = ((pixel & 0x000000ff) << 24) |
 					((pixel & 0x0000ff00) << 8) |
 					((pixel & 0x00ff0000) >> 8) |
@@ -1006,7 +1006,7 @@ nv04_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	if (ret)
 		goto out;
 
-	if (drm->client.device.info.chipset >= 0x11)
+	if (drm->device.impl->chipset >= 0x11)
 		nv11_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
 	else
 		nv04_cursor_upload(dev, cursor, nv_crtc->cursor.nvbo);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/cursor.c b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
index 4c6440d29c3f..625c66da3367 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/cursor.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/cursor.c
@@ -55,7 +55,7 @@ nv04_cursor_set_offset(struct nouveau_crtc *nv_crtc, uint32_t offset)
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_HCUR_ADDR0_INDEX);
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_HCUR_ADDR1_INDEX);
 	crtc_wr_cio_state(crtc, regp, NV_CIO_CRE_HCUR_ADDR2_INDEX);
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 		nv_fix_nv40_hw_cursor(dev, nv_crtc->index);
 }
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index 2e12bf136607..4d8e34274c4e 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -236,7 +236,7 @@ uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	struct nvkm_gpio *gpio = nvxx_gpio(drm);
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 	uint32_t sample, testval, regoffset = nv04_dac_output_offset(encoder);
@@ -288,7 +288,7 @@ uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
 	/* nv driver and nv31 use 0xfffffeee, nv34 and 6600 use 0xfffffece */
 	routput = (saved_routput & 0xfffffece) | head << 8;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CURIE) {
+	if (device->impl->family >= NVIF_DEVICE_CURIE) {
 		if (dcb->type == DCB_OUTPUT_TV)
 			routput |= 0x1a << 16;
 		else
@@ -403,7 +403,7 @@ static void nv04_dac_mode_set(struct drm_encoder *encoder,
 	}
 
 	/* This could use refinement for flatpanels, but it should work this way */
-	if (drm->client.device.info.chipset < 0x44)
+	if (drm->device.impl->chipset < 0x44)
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0xf0000000);
 	else
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0x00100000);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index 504c421aa176..da2a759dbaab 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -282,7 +282,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 			      struct drm_display_mode *adjusted_mode)
 {
 	struct drm_device *dev = encoder->dev;
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(encoder->crtc);
 	struct nv04_crtc_reg *regp = &nv04_display(dev)->mode_reg.crtc_reg[nv_crtc->index];
@@ -418,7 +418,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 	if ((nv_connector->dithering_mode == DITHERING_MODE_ON) ||
 	    (nv_connector->dithering_mode == DITHERING_MODE_AUTO &&
 	     fb->format->depth > connector->display_info.bpc * 3)) {
-		if (drm->client.device.info.chipset == 0x11)
+		if (device->impl->chipset == 0x11)
 			regp->dither = savep->dither | 0x00010000;
 		else {
 			int i;
@@ -429,7 +429,7 @@ static void nv04_dfp_mode_set(struct drm_encoder *encoder,
 			}
 		}
 	} else {
-		if (drm->client.device.info.chipset != 0x11) {
+		if (device->impl->chipset != 0x11) {
 			/* reset them */
 			int i;
 			for (i = 0; i < 3; i++) {
@@ -465,7 +465,7 @@ static void nv04_dfp_commit(struct drm_encoder *encoder)
 		NVReadRAMDAC(dev, head, NV_PRAMDAC_FP_TG_CONTROL);
 
 	/* This could use refinement for flatpanels, but it should work this way */
-	if (drm->client.device.info.chipset < 0x44)
+	if (drm->device.impl->chipset < 0x44)
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0xf0000000);
 	else
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL + nv04_dac_output_offset(encoder), 0x00100000);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index 85ec0f534392..8eba76ab880e 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -135,7 +135,7 @@ nv_two_heads(struct drm_device *dev)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	const int impl = to_pci_dev(dev->dev)->device & 0x0ff0;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS && impl != 0x0100 &&
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS && impl != 0x0100 &&
 	    impl != 0x0150 && impl != 0x01a0 && impl != 0x0200)
 		return true;
 
@@ -154,7 +154,7 @@ nv_two_reg_pll(struct drm_device *dev)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	const int impl = to_pci_dev(dev->dev)->device & 0x0ff0;
 
-	if (impl == 0x0310 || impl == 0x0340 || drm->client.device.info.family >= NV_DEVICE_INFO_V0_CURIE)
+	if (impl == 0x0310 || impl == 0x0340 || drm->device.impl->family >= NVIF_DEVICE_CURIE)
 		return true;
 	return false;
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index 8b376f9c8746..ab240df4d85c 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -89,7 +89,7 @@ NVSetOwner(struct drm_device *dev, int owner)
 	if (owner == 1)
 		owner *= 3;
 
-	if (drm->client.device.info.chipset == 0x11) {
+	if (drm->device.impl->chipset == 0x11) {
 		/* This might seem stupid, but the blob does it and
 		 * omitting it often locks the system up.
 		 */
@@ -100,7 +100,7 @@ NVSetOwner(struct drm_device *dev, int owner)
 	/* CR44 is always changed on CRTC0 */
 	NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_44, owner);
 
-	if (drm->client.device.info.chipset == 0x11) {	/* set me harder */
+	if (drm->device.impl->chipset == 0x11) {	/* set me harder */
 		NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_2E, owner);
 		NVWriteVgaCrtc(dev, 0, NV_CIO_CRE_2E, owner);
 	}
@@ -149,7 +149,7 @@ nouveau_hw_decode_pll(struct drm_device *dev, uint32_t reg1, uint32_t pll1,
 		pllvals->NM1 = pll1 & 0xffff;
 		if (nv_two_reg_pll(dev) && pll2 & NV31_RAMDAC_ENABLE_VCO2)
 			pllvals->NM2 = pll2 & 0xffff;
-		else if (drm->client.device.info.chipset == 0x30 || drm->client.device.info.chipset == 0x35) {
+		else if (drm->device.impl->chipset == 0x30 || drm->device.impl->chipset == 0x35) {
 			pllvals->M1 &= 0xf; /* only 4 bits */
 			if (pll1 & NV30_RAMDAC_ENABLE_VCO2) {
 				pllvals->M2 = (pll1 >> 4) & 0x7;
@@ -165,7 +165,7 @@ nouveau_hw_get_pllvals(struct drm_device *dev, enum nvbios_pll_type plltype,
 		       struct nvkm_pll_vals *pllvals)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	struct nvkm_bios *bios = nvxx_bios(drm);
 	uint32_t reg1, pll1, pll2 = 0;
 	struct nvbios_pll pll_lim;
@@ -184,7 +184,7 @@ nouveau_hw_get_pllvals(struct drm_device *dev, enum nvbios_pll_type plltype,
 		pll2 = nvif_rd32(device, reg2);
 	}
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CELSIUS && reg1 >= NV_PRAMDAC_VPLL_COEFF) {
+	if (device->impl->family == NVIF_DEVICE_CELSIUS && reg1 >= NV_PRAMDAC_VPLL_COEFF) {
 		uint32_t ramdac580 = NVReadRAMDAC(dev, 0, NV_PRAMDAC_580);
 
 		/* check whether vpll has been forced into single stage mode */
@@ -397,21 +397,21 @@ nv_save_state_ramdac(struct drm_device *dev, int head,
 	struct nv04_crtc_reg *regp = &state->crtc_reg[head];
 	int i;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS)
 		regp->nv10_cursync = NVReadRAMDAC(dev, head, NV_RAMDAC_NV10_CURSYNC);
 
 	nouveau_hw_get_pllvals(dev, head ? PLL_VPLL1 : PLL_VPLL0, &regp->pllvals);
 	state->pllsel = NVReadRAMDAC(dev, 0, NV_PRAMDAC_PLL_COEFF_SELECT);
 	if (nv_two_heads(dev))
 		state->sel_clk = NVReadRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK);
-	if (drm->client.device.info.chipset == 0x11)
+	if (drm->device.impl->chipset == 0x11)
 		regp->dither = NVReadRAMDAC(dev, head, NV_RAMDAC_DITHER_NV11);
 
 	regp->ramdac_gen_ctrl = NVReadRAMDAC(dev, head, NV_PRAMDAC_GENERAL_CONTROL);
 
 	if (nv_gf4_disp_arch(dev))
 		regp->ramdac_630 = NVReadRAMDAC(dev, head, NV_PRAMDAC_630);
-	if (drm->client.device.info.chipset >= 0x30)
+	if (drm->device.impl->chipset >= 0x30)
 		regp->ramdac_634 = NVReadRAMDAC(dev, head, NV_PRAMDAC_634);
 
 	regp->tv_setup = NVReadRAMDAC(dev, head, NV_PRAMDAC_TV_SETUP);
@@ -453,7 +453,7 @@ nv_save_state_ramdac(struct drm_device *dev, int head,
 	if (nv_gf4_disp_arch(dev))
 		regp->ramdac_8c0 = NVReadRAMDAC(dev, head, NV_PRAMDAC_8C0);
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE) {
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE) {
 		regp->ramdac_a20 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A20);
 		regp->ramdac_a24 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A24);
 		regp->ramdac_a34 = NVReadRAMDAC(dev, head, NV_PRAMDAC_A34);
@@ -474,21 +474,21 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
 	uint32_t pllreg = head ? NV_RAMDAC_VPLL2 : NV_PRAMDAC_VPLL_COEFF;
 	int i;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS)
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS)
 		NVWriteRAMDAC(dev, head, NV_RAMDAC_NV10_CURSYNC, regp->nv10_cursync);
 
 	clk->pll_prog(clk, pllreg, &regp->pllvals);
 	NVWriteRAMDAC(dev, 0, NV_PRAMDAC_PLL_COEFF_SELECT, state->pllsel);
 	if (nv_two_heads(dev))
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_SEL_CLK, state->sel_clk);
-	if (drm->client.device.info.chipset == 0x11)
+	if (drm->device.impl->chipset == 0x11)
 		NVWriteRAMDAC(dev, head, NV_RAMDAC_DITHER_NV11, regp->dither);
 
 	NVWriteRAMDAC(dev, head, NV_PRAMDAC_GENERAL_CONTROL, regp->ramdac_gen_ctrl);
 
 	if (nv_gf4_disp_arch(dev))
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_630, regp->ramdac_630);
-	if (drm->client.device.info.chipset >= 0x30)
+	if (drm->device.impl->chipset >= 0x30)
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_634, regp->ramdac_634);
 
 	NVWriteRAMDAC(dev, head, NV_PRAMDAC_TV_SETUP, regp->tv_setup);
@@ -525,7 +525,7 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
 	if (nv_gf4_disp_arch(dev))
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_8C0, regp->ramdac_8c0);
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE) {
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE) {
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A20, regp->ramdac_a20);
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A24, regp->ramdac_a24);
 		NVWriteRAMDAC(dev, head, NV_PRAMDAC_A34, regp->ramdac_a34);
@@ -606,10 +606,10 @@ nv_save_state_ext(struct drm_device *dev, int head,
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_FFLWM__INDEX);
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_21);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_KELVIN)
+	if (drm->device.impl->family >= NVIF_DEVICE_KELVIN)
 		rd_cio_state(dev, head, regp, NV_CIO_CRE_47);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE)
+	if (drm->device.impl->family >= NVIF_DEVICE_RANKINE)
 		rd_cio_state(dev, head, regp, 0x9f);
 
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_49);
@@ -618,14 +618,14 @@ nv_save_state_ext(struct drm_device *dev, int head,
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR2_INDEX);
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_ILACE__INDEX);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS) {
 		regp->crtc_830 = NVReadCRTC(dev, head, NV_PCRTC_830);
 		regp->crtc_834 = NVReadCRTC(dev, head, NV_PCRTC_834);
 
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE)
+		if (drm->device.impl->family >= NVIF_DEVICE_RANKINE)
 			regp->gpio_ext = NVReadCRTC(dev, head, NV_PCRTC_GPIO_EXT);
 
-		if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+		if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 			regp->crtc_850 = NVReadCRTC(dev, head, NV_PCRTC_850);
 
 		if (nv_two_heads(dev))
@@ -637,7 +637,7 @@ nv_save_state_ext(struct drm_device *dev, int head,
 
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_SCRATCH3__INDEX);
 	rd_cio_state(dev, head, regp, NV_CIO_CRE_SCRATCH4__INDEX);
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS) {
 		rd_cio_state(dev, head, regp, NV_CIO_CRE_EBR_INDEX);
 		rd_cio_state(dev, head, regp, NV_CIO_CRE_CSB);
 		rd_cio_state(dev, head, regp, NV_CIO_CRE_4B);
@@ -666,12 +666,12 @@ nv_load_state_ext(struct drm_device *dev, int head,
 		  struct nv04_mode_state *state)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 	struct nv04_crtc_reg *regp = &state->crtc_reg[head];
 	uint32_t reg900;
 	int i;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
+	if (device->impl->family >= NVIF_DEVICE_CELSIUS) {
 		if (nv_two_heads(dev))
 			/* setting ENGINE_CTRL (EC) *must* come before
 			 * CIO_CRE_LCD, as writing CRE_LCD sets bits 16 & 17 in
@@ -683,20 +683,20 @@ nv_load_state_ext(struct drm_device *dev, int head,
 		nvif_wr32(device, NV_PVIDEO_INTR_EN, 0);
 		nvif_wr32(device, NV_PVIDEO_OFFSET_BUFF(0), 0);
 		nvif_wr32(device, NV_PVIDEO_OFFSET_BUFF(1), 0);
-		nvif_wr32(device, NV_PVIDEO_LIMIT(0), drm->client.device.info.ram_size - 1);
-		nvif_wr32(device, NV_PVIDEO_LIMIT(1), drm->client.device.info.ram_size - 1);
-		nvif_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(0), drm->client.device.info.ram_size - 1);
-		nvif_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(1), drm->client.device.info.ram_size - 1);
+		nvif_wr32(device, NV_PVIDEO_LIMIT(0), device->impl->ram_size - 1);
+		nvif_wr32(device, NV_PVIDEO_LIMIT(1), device->impl->ram_size - 1);
+		nvif_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(0), device->impl->ram_size - 1);
+		nvif_wr32(device, NV_PVIDEO_UVPLANE_LIMIT(1), device->impl->ram_size - 1);
 		nvif_wr32(device, NV_PBUS_POWERCTRL_2, 0);
 
 		NVWriteCRTC(dev, head, NV_PCRTC_CURSOR_CONFIG, regp->cursor_cfg);
 		NVWriteCRTC(dev, head, NV_PCRTC_830, regp->crtc_830);
 		NVWriteCRTC(dev, head, NV_PCRTC_834, regp->crtc_834);
 
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE)
+		if (device->impl->family >= NVIF_DEVICE_RANKINE)
 			NVWriteCRTC(dev, head, NV_PCRTC_GPIO_EXT, regp->gpio_ext);
 
-		if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE) {
+		if (device->impl->family == NVIF_DEVICE_CURIE) {
 			NVWriteCRTC(dev, head, NV_PCRTC_850, regp->crtc_850);
 
 			reg900 = NVReadRAMDAC(dev, head, NV_PRAMDAC_900);
@@ -719,23 +719,23 @@ nv_load_state_ext(struct drm_device *dev, int head,
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_FF_INDEX);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_FFLWM__INDEX);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_KELVIN)
+	if (device->impl->family >= NVIF_DEVICE_KELVIN)
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_47);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE)
+	if (device->impl->family >= NVIF_DEVICE_RANKINE)
 		wr_cio_state(dev, head, regp, 0x9f);
 
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_49);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR0_INDEX);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR1_INDEX);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_HCUR_ADDR2_INDEX);
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (device->impl->family == NVIF_DEVICE_CURIE)
 		nv_fix_nv40_hw_cursor(dev, head);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_ILACE__INDEX);
 
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_SCRATCH3__INDEX);
 	wr_cio_state(dev, head, regp, NV_CIO_CRE_SCRATCH4__INDEX);
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
+	if (device->impl->family >= NVIF_DEVICE_CELSIUS) {
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_EBR_INDEX);
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_CSB);
 		wr_cio_state(dev, head, regp, NV_CIO_CRE_4B);
@@ -743,7 +743,7 @@ nv_load_state_ext(struct drm_device *dev, int head,
 	}
 	/* NV11 and NV20 stop at 0x52. */
 	if (nv_gf4_disp_arch(dev)) {
-		if (drm->client.device.info.family < NV_DEVICE_INFO_V0_KELVIN) {
+		if (device->impl->family < NVIF_DEVICE_KELVIN) {
 			/* Not waiting for vertical retrace before modifying
 			   CRE_53/CRE_54 causes lockups. */
 			nvif_msec(&drm->client.device, 650,
@@ -815,7 +815,7 @@ void nouveau_hw_save_state(struct drm_device *dev, int head,
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
-	if (drm->client.device.info.chipset == 0x11)
+	if (drm->device.impl->chipset == 0x11)
 		/* NB: no attempt is made to restore the bad pll later on */
 		nouveau_hw_fix_bad_vpll(dev, head);
 	nv_save_state_ramdac(dev, head, state);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.h b/drivers/gpu/drm/nouveau/dispnv04/hw.h
index 6987e1766cd2..b565cd34ed67 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.h
@@ -164,13 +164,12 @@ static inline uint8_t NVReadVgaCrtc5758(struct drm_device *dev, int head, uint8_
 static inline uint8_t NVReadPRMVIO(struct drm_device *dev,
 					int head, uint32_t reg)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
-	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 	uint8_t val;
 
 	/* Only NV4x have two pvio ranges; other twoHeads cards MUST call
 	 * NVSetOwner for the relevant head to be programmed */
-	if (head && drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (head && device->impl->family == NVIF_DEVICE_CURIE)
 		reg += NV_PRMVIO_SIZE;
 
 	val = nvif_rd08(device, reg);
@@ -180,12 +179,11 @@ static inline uint8_t NVReadPRMVIO(struct drm_device *dev,
 static inline void NVWritePRMVIO(struct drm_device *dev,
 					int head, uint32_t reg, uint8_t value)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
-	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 
 	/* Only NV4x have two pvio ranges; other twoHeads cards MUST call
 	 * NVSetOwner for the relevant head to be programmed */
-	if (head && drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (head && device->impl->family == NVIF_DEVICE_CURIE)
 		reg += NV_PRMVIO_SIZE;
 
 	nvif_wr08(device, reg, value);
@@ -258,10 +256,9 @@ static inline void NVVgaProtect(struct drm_device *dev, int head, bool protect)
 static inline bool
 nv_heads_tied(struct drm_device *dev)
 {
-	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
-	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nvif_device *device = &nouveau_drm(dev)->device;
 
-	if (drm->client.device.info.chipset == 0x11)
+	if (device->impl->chipset == 0x11)
 		return !!(nvif_rd32(device, NV_PBUS_DEBUG_1) & (1 << 28));
 
 	return NVReadVgaCrtc(dev, 0, NV_CIO_CRE_44) & 0x4;
@@ -317,7 +314,7 @@ NVLockVgaCrtcs(struct drm_device *dev, bool lock)
 	NVWriteVgaCrtc(dev, 0, NV_CIO_SR_LOCK_INDEX,
 		       lock ? NV_CIO_SR_LOCK_VALUE : NV_CIO_SR_UNLOCK_RW_VALUE);
 	/* NV11 has independently lockable extended crtcs, except when tied */
-	if (drm->client.device.info.chipset == 0x11 && !nv_heads_tied(dev))
+	if (drm->device.impl->chipset == 0x11 && !nv_heads_tied(dev))
 		NVWriteVgaCrtc(dev, 1, NV_CIO_SR_LOCK_INDEX,
 			       lock ? NV_CIO_SR_LOCK_VALUE :
 				      NV_CIO_SR_UNLOCK_RW_VALUE);
@@ -334,7 +331,7 @@ static inline int nv_cursor_width(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 
-	return drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS ? NV10_CURSOR_SIZE : NV04_CURSOR_SIZE;
+	return drm->device.impl->family >= NVIF_DEVICE_CELSIUS ? NV10_CURSOR_SIZE : NV04_CURSOR_SIZE;
 }
 
 static inline void
@@ -356,7 +353,7 @@ nv_set_crtc_base(struct drm_device *dev, int head, uint32_t offset)
 
 	NVWriteCRTC(dev, head, NV_PCRTC_START, offset);
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_TNT) {
+	if (drm->device.impl->family == NVIF_DEVICE_TNT) {
 		/*
 		 * Hilarious, the 24th bit doesn't want to stick to
 		 * PCRTC_START...
@@ -381,7 +378,7 @@ nv_show_cursor(struct drm_device *dev, int head, bool show)
 		*curctl1 &= ~MASK(NV_CIO_CRE_HCUR_ADDR1_ENABLE);
 	NVWriteVgaCrtc(dev, head, NV_CIO_CRE_HCUR_ADDR1_INDEX, *curctl1);
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 		nv_fix_nv40_hw_cursor(dev, head);
 }
 
@@ -397,7 +394,7 @@ nv_pitch_align(struct drm_device *dev, uint32_t width, int bpp)
 		bpp = 8;
 
 	/* Alignment requirements taken from the Haiku driver */
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_TNT)
+	if (drm->device.impl->family == NVIF_DEVICE_TNT)
 		mask = 128 / bpp - 1;
 	else
 		mask = 512 / bpp - 1;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 33f29736024a..103b6dddfac4 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -118,7 +118,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 		  struct drm_modeset_acquire_ctx *ctx)
 {
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
-	struct nvif_object *dev = &drm->client.device.object;
+	struct nvif_device *dev = &drm->device;
 	struct nouveau_plane *nv_plane =
 		container_of(plane, struct nouveau_plane, base);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
@@ -127,7 +127,7 @@ nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
 	bool flip = nv_plane->flip;
 	int soff = NV_PCRTC0_SIZE * nv_crtc->index;
 	int soff2 = NV_PCRTC0_SIZE * !nv_crtc->index;
-	unsigned shift = drm->client.device.info.chipset >= 0x30 ? 1 : 3;
+	unsigned shift = dev->impl->chipset >= 0x30 ? 1 : 3;
 	unsigned format = 0;
 	int ret;
 
@@ -286,7 +286,7 @@ nv10_overlay_init(struct drm_device *device)
 	if (!plane)
 		return;
 
-	switch (drm->client.device.info.chipset) {
+	switch (drm->device.impl->chipset) {
 	case 0x10:
 	case 0x11:
 	case 0x15:
@@ -511,9 +511,10 @@ nv04_overlay_init(struct drm_device *device)
 void
 nouveau_overlay_init(struct drm_device *device)
 {
-	struct nvif_device *dev = &nouveau_drm(device)->client.device;
-	if (dev->info.chipset < 0x10)
+	struct nvif_device *dev = &nouveau_drm(device)->device;
+
+	if (dev->impl->chipset < 0x10)
 		nv04_overlay_init(device);
-	else if (dev->info.chipset <= 0x40)
+	else if (dev->impl->chipset <= 0x40)
 		nv10_overlay_init(device);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index c11f58033018..1119c087d52f 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -155,8 +155,8 @@ nv17_tv_detect(struct drm_encoder *encoder, struct drm_connector *connector)
 		return connector_status_disconnected;
 
 	if (reliable) {
-		if (drm->client.device.info.chipset == 0x42 ||
-		    drm->client.device.info.chipset == 0x43)
+		if (drm->device.impl->chipset == 0x42 ||
+		    drm->device.impl->chipset == 0x43)
 			tv_enc->pin_mask =
 				nv42_tv_sample_load(encoder) >> 28 & 0xe;
 		else
@@ -436,7 +436,7 @@ static void nv17_tv_prepare(struct drm_encoder *encoder)
 	/* Set the DACCLK register */
 	dacclk = (NVReadRAMDAC(dev, 0, dacclk_off) & ~0x30) | 0x1;
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE)
+	if (drm->device.impl->family == NVIF_DEVICE_CURIE)
 		dacclk |= 0x1a << 16;
 
 	if (tv_norm->kind == CTV_ENC_MODE) {
@@ -493,7 +493,7 @@ static void nv17_tv_mode_set(struct drm_encoder *encoder,
 			tv_regs->ptv_614 = 0x13;
 		}
 
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_RANKINE) {
+		if (drm->device.impl->family >= NVIF_DEVICE_RANKINE) {
 			tv_regs->ptv_500 = 0xe8e0;
 			tv_regs->ptv_504 = 0x1710;
 			tv_regs->ptv_604 = 0x0;
@@ -588,7 +588,7 @@ static void nv17_tv_commit(struct drm_encoder *encoder)
 	nv17_tv_state_load(dev, &to_tv_enc(encoder)->state);
 
 	/* This could use refinement for flatpanels, but it should work */
-	if (drm->client.device.info.chipset < 0x44)
+	if (drm->device.impl->chipset < 0x44)
 		NVWriteRAMDAC(dev, 0, NV_PRAMDAC_TEST_CONTROL +
 					nv04_dac_output_offset(encoder),
 					0xf0000000);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index a23e1d264294..36547f3b6111 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2637,7 +2637,7 @@ nv50_display_create(struct drm_device *dev)
 	if (disp->disp->object.oclass >= TU102_DISP)
 		nouveau_display(dev)->format_modifiers = wndwc57e_modifiers;
 	else
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_FERMI)
+	if (drm->device.impl->family >= NVIF_DEVICE_FERMI)
 		nouveau_display(dev)->format_modifiers = disp90xx_modifiers;
 	else
 		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 1e6e27782ce8..38853dbe57c5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -81,18 +81,18 @@ nv50_wndw_ctxdma_new(struct nv50_wndw *wndw, struct drm_framebuffer *fb)
 	args.base.target = NV_DMA_V0_TARGET_VRAM;
 	args.base.access = NV_DMA_V0_ACCESS_RDWR;
 	args.base.start  = 0;
-	args.base.limit  = drm->client.device.info.ram_user - 1;
+	args.base.limit  = drm->device.impl->ram_user - 1;
 
-	if (drm->client.device.info.chipset < 0x80) {
+	if (drm->device.impl->chipset < 0x80) {
 		args.nv50.part = NV50_DMA_V0_PART_256;
 		argc += sizeof(args.nv50);
 	} else
-	if (drm->client.device.info.chipset < 0xc0) {
+	if (drm->device.impl->chipset < 0xc0) {
 		args.nv50.part = NV50_DMA_V0_PART_256;
 		args.nv50.kind = kind;
 		argc += sizeof(args.nv50);
 	} else
-	if (drm->client.device.info.chipset < 0xd0) {
+	if (drm->device.impl->chipset < 0xd0) {
 		args.gf100.kind = kind;
 		argc += sizeof(args.gf100);
 	} else {
@@ -295,7 +295,7 @@ nv50_wndw_atomic_check_acquire(struct nv50_wndw *wndw, bool modeset,
 
 		if (asyw->image.kind) {
 			asyw->image.layout = NV507C_SURFACE_SET_STORAGE_MEMORY_LAYOUT_BLOCKLINEAR;
-			if (drm->client.device.info.chipset >= 0xc0)
+			if (drm->device.impl->chipset >= 0xc0)
 				asyw->image.blockh = tile_mode >> 4;
 			else
 				asyw->image.blockh = tile_mode;
@@ -666,7 +666,7 @@ static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
 	struct nouveau_drm *drm = nouveau_drm(plane->dev);
 	uint8_t i;
 
-	if (drm->client.device.info.chipset < 0xc0) {
+	if (drm->device.impl->chipset < 0xc0) {
 		const struct drm_format_info *info = drm_format_info(format);
 		const uint8_t kind = (modifier >> 12) & 0xff;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index 0ec8d80133c7..8947edd9b25b 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -2,7 +2,6 @@
 #ifndef __NVIF_DEVICE_H__
 #define __NVIF_DEVICE_H__
 #include <nvif/object.h>
-#include <nvif/cl0080.h>
 #include <nvif/driverif.h>
 #include <nvif/user.h>
 struct nvif_ctxdma;
@@ -13,8 +12,6 @@ struct nvif_device {
 	struct nvif_object object;
 	struct nvif_map map;
 
-	struct nv_device_info_v0 info;
-
 	struct nvif_user user;
 };
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index ef668f20111a..bf0b6d427364 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -27,6 +27,7 @@
 #include <nvif/ioctl.h>
 #include <nvif/class.h>
 #include <nvif/cl0002.h>
+#include <nvif/cl0080.h>
 #include <nvif/unpack.h>
 
 #include "nouveau_drv.h"
@@ -211,7 +212,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_device *device = &drm->client.device;
+	struct nvif_device *device = &drm->device;
 	struct nvkm_device *nvkm_device = nvxx_device(drm);
 	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_getparam *getparam = data;
@@ -219,27 +220,27 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 
 	switch (getparam->param) {
 	case NOUVEAU_GETPARAM_CHIPSET_ID:
-		getparam->value = device->info.chipset;
+		getparam->value = device->impl->chipset;
 		break;
 	case NOUVEAU_GETPARAM_PCI_VENDOR:
-		if (device->info.platform != NV_DEVICE_INFO_V0_SOC)
+		if (device->impl->platform != NVIF_DEVICE_SOC)
 			getparam->value = pdev->vendor;
 		else
 			getparam->value = 0;
 		break;
 	case NOUVEAU_GETPARAM_PCI_DEVICE:
-		if (device->info.platform != NV_DEVICE_INFO_V0_SOC)
+		if (device->impl->platform != NVIF_DEVICE_SOC)
 			getparam->value = pdev->device;
 		else
 			getparam->value = 0;
 		break;
 	case NOUVEAU_GETPARAM_BUS_TYPE:
-		switch (device->info.platform) {
-		case NV_DEVICE_INFO_V0_AGP : getparam->value = 0; break;
-		case NV_DEVICE_INFO_V0_PCI : getparam->value = 1; break;
-		case NV_DEVICE_INFO_V0_PCIE: getparam->value = 2; break;
-		case NV_DEVICE_INFO_V0_SOC : getparam->value = 3; break;
-		case NV_DEVICE_INFO_V0_IGP :
+		switch (device->impl->platform) {
+		case NVIF_DEVICE_AGP : getparam->value = 0; break;
+		case NVIF_DEVICE_PCI : getparam->value = 1; break;
+		case NVIF_DEVICE_PCIE: getparam->value = 2; break;
+		case NVIF_DEVICE_SOC : getparam->value = 3; break;
+		case NVIF_DEVICE_IGP :
 			if (!pci_is_pcie(pdev))
 				getparam->value = 1;
 			else
@@ -324,7 +325,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	engine = NVIF_ENGINE_GR;
 
 	/* hack to allow channel engine type specification on kepler */
-	if (device->info.family >= NV_DEVICE_INFO_V0_KEPLER) {
+	if (device->impl->family >= NVIF_DEVICE_KEPLER) {
 		if (init->fb_ctxdma_handle == ~0) {
 			switch (init->tt_ctxdma_handle) {
 			case NOUVEAU_FIFO_ENGINE_GR:
@@ -386,7 +387,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 
 	init->channel = chan->chan->chid;
 
-	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA)
+	if (device->impl->family >= NVIF_DEVICE_TESLA)
 		init->pushbuf_domains = NOUVEAU_GEM_DOMAIN_VRAM |
 					NOUVEAU_GEM_DOMAIN_GART;
 	else
@@ -395,7 +396,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	else
 		init->pushbuf_domains = NOUVEAU_GEM_DOMAIN_GART;
 
-	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
+	if (device->impl->family < NVIF_DEVICE_CELSIUS) {
 		init->subchan[0].handle = 0x00000000;
 		init->subchan[0].grclass = 0x0000;
 		init->subchan[1].handle = chan->chan->nvsw.object.handle;
@@ -411,14 +412,14 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	 *
 	 * Userspace was fixed prior to adding Ampere support.
 	 */
-	switch (device->info.family) {
-	case NV_DEVICE_INFO_V0_VOLTA:
+	switch (device->impl->family) {
+	case NVIF_DEVICE_VOLTA:
 		ret = nvif_engobj_ctor(&chan->chan->chan, "abi16CeWar", 0, VOLTA_DMA_COPY_A,
 				       &chan->ce);
 		if (ret)
 			goto done;
 		break;
-	case NV_DEVICE_INFO_V0_TURING:
+	case NVIF_DEVICE_TURING:
 		ret = nvif_engobj_ctor(&chan->chan->chan, "abi16CeWar", 0, TURING_DMA_COPY_A,
 				       &chan->ce);
 		if (ret)
@@ -437,7 +438,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
 	if (ret)
 		goto done;
 
-	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (device->impl->family >= NVIF_DEVICE_TESLA) {
 		ret = nouveau_vma_new(chan->ntfy, chan->chan->vmm,
 				      &chan->ntfy_vma);
 		if (ret)
@@ -558,7 +559,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 		return -ENOMEM;
 
 	/* completely unnecessary for these chipsets... */
-	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
+	if (unlikely(device->impl->family >= NVIF_DEVICE_FERMI))
 		return nouveau_abi16_put(abi16, -EINVAL);
 
 	chan = nouveau_abi16_chan(abi16, info->channel);
@@ -578,7 +579,7 @@ nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS)
 
 	args.start = ntfy->node->offset;
 	args.limit = ntfy->node->offset + ntfy->node->length - 1;
-	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (device->impl->family >= NVIF_DEVICE_TESLA) {
 		args.target = NV_DMA_V0_TARGET_VM;
 		args.access = NV_DMA_V0_ACCESS_VM;
 		args.start += chan->ntfy_vma->addr;
@@ -643,6 +644,7 @@ static int
 nouveau_abi16_ioctl_mthd(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioctl, u32 argc)
 {
 	struct nouveau_cli *cli = abi16->cli;
+	struct nvif_device *device = &cli->drm->device;
 	struct nvif_ioctl_mthd_v0 *args;
 	struct nouveau_abi16_obj *obj;
 	struct nv_device_info_v0 *info;
@@ -664,8 +666,14 @@ nouveau_abi16_ioctl_mthd(struct nouveau_abi16 *abi16, struct nvif_ioctl_v0 *ioct
 	if (info->version != 0x00)
 		return -EINVAL;
 
-	info = &cli->drm->device.info;
-	memcpy(args->data, info, sizeof(*info));
+	info->platform = device->impl->platform;
+	info->chipset = device->impl->chipset;
+	info->revision = device->impl->revision;
+	info->family = device->impl->family;
+	info->ram_size = device->impl->ram_size;
+	info->ram_user = device->impl->ram_user;
+	strscpy(info->chip, device->impl->chip, sizeof(info->chip));
+	strscpy(info->name, device->impl->name, sizeof(info->name));
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d47442125fa1..925856f3b21b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -292,7 +292,7 @@ nouveau_backlight_init(struct drm_connector *connector)
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
 	struct nouveau_backlight *bl;
 	struct nouveau_encoder *nv_encoder = NULL;
-	struct nvif_device *device = &drm->client.device;
+	struct nvif_device *device = &drm->device;
 	char backlight_name[BL_NAME_SIZE];
 	struct backlight_properties props = {0};
 	const struct backlight_ops *ops;
@@ -317,18 +317,18 @@ nouveau_backlight_init(struct drm_connector *connector)
 	if (!bl)
 		return -ENOMEM;
 
-	switch (device->info.family) {
-	case NV_DEVICE_INFO_V0_CURIE:
+	switch (device->impl->family) {
+	case NVIF_DEVICE_CURIE:
 		ret = nv40_backlight_init(nv_encoder, &props, &ops);
 		break;
-	case NV_DEVICE_INFO_V0_TESLA:
-	case NV_DEVICE_INFO_V0_FERMI:
-	case NV_DEVICE_INFO_V0_KEPLER:
-	case NV_DEVICE_INFO_V0_MAXWELL:
-	case NV_DEVICE_INFO_V0_PASCAL:
-	case NV_DEVICE_INFO_V0_VOLTA:
-	case NV_DEVICE_INFO_V0_TURING:
-	case NV_DEVICE_INFO_V0_AMPERE: //XXX: not confirmed
+	case NVIF_DEVICE_TESLA:
+	case NVIF_DEVICE_FERMI:
+	case NVIF_DEVICE_KEPLER:
+	case NVIF_DEVICE_MAXWELL:
+	case NVIF_DEVICE_PASCAL:
+	case NVIF_DEVICE_VOLTA:
+	case NVIF_DEVICE_TURING:
+	case NVIF_DEVICE_AMPERE: //XXX: not confirmed
 		ret = nv50_backlight_init(bl, nouveau_connector(connector),
 					  nv_encoder, &props, &ops);
 		break;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 829e98da56d0..c9c68416d558 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -322,7 +322,7 @@ static int
 get_fp_strap(struct drm_device *dev, struct nvbios *bios)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 
 	/*
 	 * The fp strap is normally dictated by the "User Strap" in
@@ -336,10 +336,10 @@ get_fp_strap(struct drm_device *dev, struct nvbios *bios)
 	if (bios->major_version < 5 && bios->data[0x48] & 0x4)
 		return NVReadVgaCrtc5758(dev, 0, 0xf) & 0xf;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_MAXWELL)
+	if (device->impl->family >= NVIF_DEVICE_MAXWELL)
 		return nvif_rd32(device, 0x001800) & 0x0000000f;
 	else
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+	if (device->impl->family >= NVIF_DEVICE_TESLA)
 		return (nvif_rd32(device, NV_PEXTDEV_BOOT_0) >> 24) & 0xf;
 	else
 		return (nvif_rd32(device, NV_PEXTDEV_BOOT_0) >> 16) & 0xf;
@@ -1255,7 +1255,7 @@ olddcb_table(struct drm_device *dev)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	u8 *dcb = NULL;
 
-	if (drm->client.device.info.family > NV_DEVICE_INFO_V0_TNT)
+	if (drm->device.impl->family > NVIF_DEVICE_TNT)
 		dcb = ROMPTR(dev, drm->vbios.data[0x36]);
 	if (!dcb) {
 		NV_WARN(drm, "No DCB data found in VBIOS\n");
@@ -2070,7 +2070,7 @@ nouveau_bios_posted(struct drm_device *dev)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	unsigned htotal;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA)
 		return true;
 
 	htotal  = NVReadVgaCrtc(dev, 0, 0x06);
@@ -2096,7 +2096,7 @@ nouveau_bios_init(struct drm_device *dev)
 	if (!NVInitVBIOS(dev))
 		return -ENODEV;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA) {
 		ret = parse_dcb_table(dev, bios);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 60ce4b46a3a4..523464cfea9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -175,23 +175,23 @@ static void
 nouveau_bo_fixup_align(struct nouveau_bo *nvbo, int *align, u64 *size)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	struct nvif_device *device = &drm->client.device;
+	struct nvif_device *device = &drm->device;
 
-	if (device->info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (device->impl->family < NVIF_DEVICE_TESLA) {
 		if (nvbo->mode) {
-			if (device->info.chipset >= 0x40) {
+			if (device->impl->chipset >= 0x40) {
 				*align = 65536;
 				*size = roundup_64(*size, 64 * nvbo->mode);
 
-			} else if (device->info.chipset >= 0x30) {
+			} else if (device->impl->chipset >= 0x30) {
 				*align = 32768;
 				*size = roundup_64(*size, 64 * nvbo->mode);
 
-			} else if (device->info.chipset >= 0x20) {
+			} else if (device->impl->chipset >= 0x20) {
 				*align = 16384;
 				*size = roundup_64(*size, 64 * nvbo->mode);
 
-			} else if (device->info.chipset >= 0x10) {
+			} else if (device->impl->chipset >= 0x10) {
 				*align = 16384;
 				*size = roundup_64(*size, 32 * nvbo->mode);
 			}
@@ -243,7 +243,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	nvbo->contig = !(tile_flags & NOUVEAU_GEM_TILE_NONCONTIG);
 	if (!nouveau_cli_uvmm(cli) || internal) {
 		/* for BO noVM allocs, don't assign kinds */
-		if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI) {
+		if (drm->device.impl->family >= NVIF_DEVICE_FERMI) {
 			nvbo->kind = (tile_flags & 0x0000ff00) >> 8;
 			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
 				kfree(nvbo);
@@ -251,7 +251,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			}
 
 			nvbo->comp = mmu->impl->kind[nvbo->kind] != nvbo->kind;
-		} else if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		} else if (drm->device.impl->family >= NVIF_DEVICE_TESLA) {
 			nvbo->kind = (tile_flags & 0x00007f00) >> 8;
 			nvbo->comp = (tile_flags & 0x00030000) >> 16;
 			if (!nvif_mmu_kind_valid(mmu, nvbo->kind)) {
@@ -272,7 +272,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 			 *
 			 * Skip page sizes that can't support needed domains.
 			 */
-			if (cli->device.info.family > NV_DEVICE_INFO_V0_CURIE &&
+			if (drm->device.impl->family > NVIF_DEVICE_CURIE &&
 			    (domain & NOUVEAU_GEM_DOMAIN_VRAM) && !vmm->impl->page[i].vram)
 				continue;
 			if ((domain & NOUVEAU_GEM_DOMAIN_GART) &&
@@ -408,10 +408,10 @@ static void
 set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
-	u64 vram_size = drm->client.device.info.ram_size;
+	u64 vram_size = drm->device.impl->ram_size;
 	unsigned i, fpfn, lpfn;
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CELSIUS &&
+	if (drm->device.impl->family == NVIF_DEVICE_CELSIUS &&
 	    nvbo->mode && (domain & NOUVEAU_GEM_DOMAIN_VRAM) &&
 	    nvbo->bo.base.size < vram_size / 4) {
 		/*
@@ -476,7 +476,7 @@ int nouveau_bo_pin_locked(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 
 	dma_resv_assert_held(bo->base.resv);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA &&
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA &&
 	    domain == NOUVEAU_GEM_DOMAIN_VRAM && contig) {
 		if (!nvbo->contig) {
 			nvbo->contig = true;
@@ -873,7 +873,7 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 	 * old nvkm_mem node, these will get cleaned up after ttm has
 	 * destroyed the ttm_resource
 	 */
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA) {
 		ret = nouveau_bo_move_prep(drm, bo, new_reg);
 		if (ret)
 			return ret;
@@ -1034,7 +1034,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
 	if (new_reg->mem_type != TTM_PL_VRAM)
 		return 0;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_CELSIUS) {
+	if (drm->device.impl->family >= NVIF_DEVICE_CELSIUS) {
 		*new_tile = nv10_bo_set_tiling(dev, offset, bo->base.size,
 					       nvbo->mode, nvbo->zeta);
 	}
@@ -1087,7 +1087,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	if (ret)
 		goto out_ntfy;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA) {
 		ret = nouveau_bo_vm_bind(bo, new_reg, &new_tile);
 		if (ret)
 			goto out_ntfy;
@@ -1137,7 +1137,7 @@ nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
 	}
 
 out:
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA) {
 		if (ret)
 			nouveau_bo_vm_cleanup(bo, NULL, &new_tile);
 		else
@@ -1210,7 +1210,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 		reg->bus.is_iomem = true;
 
 		/* Some BARs do not support being ioremapped WC */
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA &&
+		if (drm->device.impl->family >= NVIF_DEVICE_TESLA &&
 		    mmu->impl->type[drm->ttm.type_vram].type & NVIF_MEM_UNCACHED)
 			reg->bus.caching = ttm_uncached;
 		else
@@ -1305,7 +1305,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 	 * nothing to do here.
 	 */
 	if (bo->resource->mem_type != TTM_PL_VRAM) {
-		if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA ||
+		if (drm->device.impl->family < NVIF_DEVICE_TESLA ||
 		    !nvbo->kind)
 			return 0;
 
@@ -1316,7 +1316,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 
 	} else {
 		/* make sure bo is in mappable vram */
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA ||
+		if (drm->device.impl->family >= NVIF_DEVICE_TESLA ||
 		    bo->resource->start + PFN_UP(bo->resource->size) < mappable)
 			return 0;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 1cd8953740f5..cb5b75bc53d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -190,7 +190,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 	 */
 	chan->push.addr = chan->push.buffer->offset;
 
-	if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (device->impl->family >= NVIF_DEVICE_TESLA) {
 		ret = nouveau_vma_new(chan->push.buffer, chan->vmm,
 				      &chan->push.vma);
 		if (ret) {
@@ -200,7 +200,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 
 		chan->push.addr = chan->push.vma->addr;
 
-		if (device->info.family >= NV_DEVICE_INFO_V0_FERMI)
+		if (device->impl->family >= NVIF_DEVICE_FERMI)
 			return 0;
 
 		args.target = NV_DMA_V0_TARGET_VM;
@@ -209,7 +209,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 		args.limit = chan->vmm->vmm.impl->limit - 1;
 	} else
 	if (chan->push.buffer->bo.resource->mem_type == TTM_PL_VRAM) {
-		if (device->info.family == NV_DEVICE_INFO_V0_TNT) {
+		if (device->impl->family == NVIF_DEVICE_TNT) {
 			/* nv04 vram pushbuf hack, retarget to its location in
 			 * the framebuffer bar rather than direct vram access..
 			 * nfi why this exists, it came from the -nv ddx.
@@ -217,12 +217,12 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 			args.target = NV_DMA_V0_TARGET_PCI;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
 			args.start = nvxx_device(drm)->func->resource_addr(nvxx_device(drm), 1);
-			args.limit = args.start + device->info.ram_user - 1;
+			args.limit = args.start + device->impl->ram_user - 1;
 		} else {
 			args.target = NV_DMA_V0_TARGET_VRAM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
 			args.start = 0;
-			args.limit = device->info.ram_user - 1;
+			args.limit = device->impl->ram_user - 1;
 		}
 	} else {
 		if (drm->agp.bridge) {
@@ -378,8 +378,8 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 	}
 
 	/* allocate dma objects to cover all allowed vram, and gart */
-	if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
-		if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (device->impl->family < NVIF_DEVICE_FERMI) {
+		if (device->impl->family >= NVIF_DEVICE_TESLA) {
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_VM;
 			args.start = 0;
@@ -388,7 +388,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 			args.target = NV_DMA_V0_TARGET_VRAM;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
 			args.start = 0;
-			args.limit = device->info.ram_user - 1;
+			args.limit = device->impl->ram_user - 1;
 		}
 
 		ret = nvif_chan_ctxdma_ctor(&chan->chan, "abi16ChanVramCtxDma", vram,
@@ -397,7 +397,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		if (ret)
 			return ret;
 
-		if (device->info.family >= NV_DEVICE_INFO_V0_TESLA) {
+		if (device->impl->family >= NVIF_DEVICE_TESLA) {
 			args.target = NV_DMA_V0_TARGET_VM;
 			args.access = NV_DMA_V0_ACCESS_VM;
 			args.start = 0;
@@ -456,7 +456,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		PUSH_DATA(&chan->chan.push, 0x00000000);
 
 	/* allocate software object class (used for fences on <= nv05) */
-	if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
+	if (device->impl->family < NVIF_DEVICE_CELSIUS) {
 		ret = nvif_engobj_ctor(&chan->chan, "abi16NvswFence", 0x006e,
 				       NVIF_CLASS_SW_NV04, &chan->nvsw);
 		if (ret)
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 3063ef792023..a8e5f01ba9dd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -513,13 +513,13 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 		return;
 	nv_connector->detected_encoder = nv_encoder;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA) {
 		if (nv_encoder->dcb->type == DCB_OUTPUT_DP)
 			connector->interlace_allowed =
 				nv_encoder->caps.dp_interlace;
 		else
 			connector->interlace_allowed =
-				drm->client.device.info.family < NV_DEVICE_INFO_V0_VOLTA;
+				drm->device.impl->family < NVIF_DEVICE_VOLTA;
 		connector->doublescan_allowed = true;
 	} else
 	if (nv_encoder->dcb->type == DCB_OUTPUT_LVDS ||
@@ -528,8 +528,8 @@ nouveau_connector_set_encoder(struct drm_connector *connector,
 		connector->interlace_allowed = false;
 	} else {
 		connector->doublescan_allowed = true;
-		if (drm->client.device.info.family == NV_DEVICE_INFO_V0_KELVIN ||
-		    (drm->client.device.info.family == NV_DEVICE_INFO_V0_CELSIUS &&
+		if (drm->device.impl->family == NVIF_DEVICE_KELVIN ||
+		    (drm->device.impl->family == NVIF_DEVICE_CELSIUS &&
 		     (pdev->device & 0x0ff0) != 0x0100 &&
 		     (pdev->device & 0x0ff0) != 0x0150))
 			/* HW is broken */
@@ -1045,7 +1045,7 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 		/* Note: these limits are conservative, some Fermi's
 		 * can do 297 MHz. Unclear how this can be determined.
 		 */
-		if (drm->client.device.info.chipset >= 0x120) {
+		if (drm->device.impl->chipset >= 0x120) {
 			const int max_tmds_clock =
 				info->hdmi.scdc.scrambling.supported ?
 				594000 : 340000;
@@ -1053,18 +1053,18 @@ get_tmds_link_bandwidth(struct drm_connector *connector)
 				min(info->max_tmds_clock, max_tmds_clock) :
 				max_tmds_clock;
 		}
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_KEPLER)
+		if (drm->device.impl->family >= NVIF_DEVICE_KEPLER)
 			return 297000;
-		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_FERMI)
+		if (drm->device.impl->family >= NVIF_DEVICE_FERMI)
 			return 225000;
 	}
 
 	if (dcb->location != DCB_LOC_ON_CHIP ||
-	    drm->client.device.info.chipset >= 0x46)
+	    drm->device.impl->chipset >= 0x46)
 		return 165000 * duallink_scale;
-	else if (drm->client.device.info.chipset >= 0x40)
+	else if (drm->device.impl->chipset >= 0x40)
 		return 155000 * duallink_scale;
-	else if (drm->client.device.info.chipset >= 0x18)
+	else if (drm->device.impl->chipset >= 0x18)
 		return 135000 * duallink_scale;
 	else
 		return 112000 * duallink_scale;
@@ -1348,7 +1348,7 @@ nouveau_connector_create(struct drm_device *dev, int index)
 		 * figure out something suitable ourselves
 		 */
 		if (nv_connector->type == DCB_CONNECTOR_NONE &&
-		    !WARN_ON(drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)) {
+		    !WARN_ON(drm->device.impl->family >= NVIF_DEVICE_TESLA)) {
 			struct dcb_table *dcbt = &drm->vbios.dcb;
 			u32 encoders = 0;
 			int i;
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 3f75c7f33429..f6fb4e6ab4f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -155,7 +155,7 @@ nouveau_decode_mod(struct nouveau_drm *drm,
 		*tile_mode = (uint32_t)(modifier & 0xF);
 		*kind = (uint8_t)((modifier >> 12) & 0xFF);
 
-		if (drm->client.device.info.chipset >= 0xc0)
+		if (drm->device.impl->chipset >= 0xc0)
 			*tile_mode <<= 4;
 	}
 }
@@ -196,9 +196,8 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
 	struct nouveau_display *disp = nouveau_display(drm->dev);
 	int mod;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA)
 		return -EINVAL;
-	}
 
 	BUG_ON(!disp->format_modifiers);
 
@@ -240,9 +239,9 @@ nouveau_get_height_in_blocks(struct nouveau_drm *drm,
 	uint32_t log_gob_height;
 	uint32_t log_block_height;
 
-	BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
+	BUG_ON(drm->device.impl->family < NVIF_DEVICE_TESLA);
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
+	if (drm->device.impl->family < NVIF_DEVICE_FERMI)
 		log_gob_height = 2;
 	else
 		log_gob_height = 3;
@@ -260,9 +259,9 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 	uint32_t gob_size, bw, bh;
 	uint64_t bl_size;
 
-	BUG_ON(drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA);
+	BUG_ON(drm->device.impl->family < NVIF_DEVICE_TESLA);
 
-	if (drm->client.device.info.chipset >= 0xc0) {
+	if (drm->device.impl->chipset >= 0xc0) {
 		if (tile_mode & 0xF)
 			return -EINVAL;
 		tile_mode >>= 4;
@@ -271,7 +270,7 @@ nouveau_check_bl_size(struct nouveau_drm *drm, struct nouveau_bo *nvbo,
 	if (tile_mode & 0xFFFFFFF0)
 		return -EINVAL;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI)
+	if (drm->device.impl->family < NVIF_DEVICE_FERMI)
 		gob_size = 256;
 	else
 		gob_size = 512;
@@ -307,7 +306,7 @@ nouveau_framebuffer_new(struct drm_device *dev,
 	int ret;
 
         /* YUV overlays have special requirements pre-NV50 */
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA &&
 
 	    (mode_cmd->pixel_format == DRM_FORMAT_YUYV ||
 	     mode_cmd->pixel_format == DRM_FORMAT_UYVY ||
@@ -698,15 +697,15 @@ nouveau_display_create(struct drm_device *dev)
 
 	dev->mode_config.min_width = 0;
 	dev->mode_config.min_height = 0;
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_CELSIUS) {
+	if (drm->device.impl->family < NVIF_DEVICE_CELSIUS) {
 		dev->mode_config.max_width = 2048;
 		dev->mode_config.max_height = 2048;
 	} else
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA) {
 		dev->mode_config.max_width = 4096;
 		dev->mode_config.max_height = 4096;
 	} else
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_FERMI) {
+	if (drm->device.impl->family < NVIF_DEVICE_FERMI) {
 		dev->mode_config.max_width = 8192;
 		dev->mode_config.max_height = 8192;
 	} else {
@@ -717,7 +716,7 @@ nouveau_display_create(struct drm_device *dev)
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
 
-	if (drm->client.device.info.chipset < 0x11)
+	if (drm->device.impl->chipset < 0x11)
 		dev->mode_config.async_page_flip = false;
 	else
 		dev->mode_config.async_page_flip = true;
@@ -854,7 +853,7 @@ nouveau_display_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
 	args->size = roundup(args->size, PAGE_SIZE);
 
 	/* Use VRAM if there is any ; otherwise fallback to system memory */
-	if (nouveau_drm(dev)->client.device.info.ram_size != 0)
+	if (nouveau_drm(dev)->device.impl->ram_size != 0)
 		domain = NOUVEAU_GEM_DOMAIN_VRAM;
 	else
 		domain = NOUVEAU_GEM_DOMAIN_GART;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a0c24456e031..2cb06f0a217f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -591,7 +591,7 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 	int ret;
 
 	/* This only make sense on PASCAL or newer */
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_PASCAL)
+	if (drm->device.impl->family < NVIF_DEVICE_PASCAL)
 		return;
 
 	if (!(drm->dmem = kzalloc(sizeof(*drm->dmem), GFP_KERNEL)))
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index fb01f51fd689..6c4469f31c53 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -311,11 +311,11 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 	 * synchronisation of page flips, as well as to implement fences
 	 * on TNT/TNT2 HW that lacks any kind of support in host.
 	 */
-	if (device->info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (device->impl->family < NVIF_DEVICE_TESLA) {
 		ret = nvif_engobj_ctor(&drm->channel->chan, "drmNvSw", NVDRM_NVSW,
 				       nouveau_abi16_swclass(drm), &drm->channel->nvsw);
 
-		if (ret == 0 && device->info.chipset >= 0x11) {
+		if (ret == 0 && device->impl->chipset >= 0x11) {
 			ret = nvif_engobj_ctor(&drm->channel->chan, "drmBlit", 0x005f, 0x009f,
 					       &drm->channel->blit);
 		}
@@ -325,7 +325,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 
 			ret = PUSH_WAIT(push, 8);
 			if (ret == 0) {
-				if (device->info.chipset >= 0x11) {
+				if (device->impl->chipset >= 0x11) {
 					PUSH_NVSQ(push, NV05F, 0x0000, 0x005f);
 					PUSH_NVSQ(push, NV09F, 0x0120, 0,
 							       0x0124, 1,
@@ -346,7 +346,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 	 * even if notification is never requested, so, allocate a ctxdma on
 	 * any GPU where it's possible we'll end up using M2MF for BO moves.
 	 */
-	if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
+	if (device->impl->family < NVIF_DEVICE_FERMI) {
 		ret = nvkm_gpuobj_new(nvxx_device(drm), 32, 0, false, NULL, &drm->notify);
 		if (ret) {
 			NV_ERROR(drm, "failed to allocate notifier, %d\n", ret);
@@ -435,7 +435,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
 	}
 
 	/* Volta requires access to a doorbell register for kickoff. */
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_VOLTA) {
+	if (device->impl->family >= NVIF_DEVICE_VOLTA) {
 		ret = nvif_user_ctor(&drm->device, "drmUsermode");
 		if (ret)
 			return;
@@ -577,7 +577,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 	 * nosnoop capability.  hopefully won't cause issues until a
 	 * better fix is found - assuming there is one...
 	 */
-	if (drm->client.device.info.chipset == 0xc1)
+	if (drm->device.impl->chipset == 0xc1)
 		nvif_mask(&drm->client.device.object, 0x00088080, 0x00000800, 0x00000000);
 
 	nouveau_vga_init(drm);
@@ -799,7 +799,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (ret)
 		goto fail_drm_dev_init;
 
-	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32 * 1024 * 1024)
+	if (nouveau_drm(drm_dev)->device.impl->ram_size <= 32 * 1024 * 1024)
 		drm_fbdev_generic_setup(drm_dev, 8);
 	else
 		drm_fbdev_generic_setup(drm_dev, 32);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 9ae2cee1c7c5..ede2bf30ebc2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -286,7 +286,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	 */
 	nvbo->valid_domains = NOUVEAU_GEM_DOMAIN_VRAM |
 			      NOUVEAU_GEM_DOMAIN_GART;
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA)
 		nvbo->valid_domains &= domain;
 
 	if (nvbo->no_share) {
@@ -305,6 +305,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
+	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_vma *vma;
 
 	if (is_power_of_2(nvbo->valid_domains))
@@ -328,10 +329,10 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 	rep->map_handle = drm_vma_node_offset_addr(&nvbo->bo.base.vma_node);
 	rep->tile_mode = nvbo->mode;
 	rep->tile_flags = nvbo->contig ? 0 : NOUVEAU_GEM_TILE_NONCONTIG;
-	if (cli->device.info.family >= NV_DEVICE_INFO_V0_FERMI)
+	if (drm->device.impl->family >= NVIF_DEVICE_FERMI)
 		rep->tile_flags |= nvbo->kind << 8;
 	else
-	if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA)
 		rep->tile_flags |= nvbo->kind << 8 | nvbo->comp << 16;
 	else
 		rep->tile_flags |= nvbo->zeta;
@@ -600,7 +601,7 @@ validate_list(struct nouveau_channel *chan,
 			return ret;
 		}
 
-		if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+		if (drm->device.impl->family < NVIF_DEVICE_TESLA) {
 			if (nvbo->offset == b->presumed.offset &&
 			    ((nvbo->bo.resource->mem_type == TTM_PL_VRAM &&
 			      b->presumed.domain & NOUVEAU_GEM_DOMAIN_VRAM) ||
@@ -870,7 +871,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 			nv50_dma_push(chan, addr, length, no_prefetch);
 		}
 	} else
-	if (drm->client.device.info.chipset >= 0x25) {
+	if (drm->device.impl->chipset >= 0x25) {
 		ret = PUSH_WAIT(&chan->chan.push, req->nr_push * 2);
 		if (ret) {
 			NV_PRINTK(err, cli, "cal_space: %d\n", ret);
@@ -965,7 +966,7 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 		req->suffix0 = 0x00000000;
 		req->suffix1 = 0x00000000;
 	} else
-	if (drm->client.device.info.chipset >= 0x25) {
+	if (drm->device.impl->chipset >= 0x25) {
 		req->suffix0 = 0x00020000;
 		req->suffix1 = 0x00000000;
 	} else {
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 172744470bd1..e90d8b47be47 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -42,7 +42,7 @@ nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_resou
 	if (ret)
 		return ret;
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA) {
 		ret = nouveau_mem_map(mem, &drm->cli.vmm.vmm, &mem->vma[0]);
 		if (ret) {
 			nouveau_mem_fini(mem);
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 534448f82daa..55895e746003 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -1048,7 +1048,7 @@ nouveau_svm_init(struct nouveau_drm *drm)
 	 * otherwise clients will have a trivial way to trash the GPU
 	 * for everyone.
 	 */
-	if (drm->client.device.info.family > NV_DEVICE_INFO_V0_PASCAL)
+	if (drm->device.impl->family > NVIF_DEVICE_PASCAL)
 		return;
 
 	switch (drm->device.impl->faultbuf.oclass) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 36f5be963851..5b0f78e48cc7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -70,7 +70,7 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	int ret;
 
-	if (drm->client.device.info.ram_size == 0)
+	if (drm->device.impl->ram_size == 0)
 		return -ENOMEM;
 
 	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
@@ -180,7 +180,7 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
 static int
 nouveau_ttm_init_vram(struct nouveau_drm *drm)
 {
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA) {
 		struct ttm_resource_manager *man = kzalloc(sizeof(*man), GFP_KERNEL);
 
 		if (!man)
@@ -204,7 +204,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA) {
 		ttm_resource_manager_set_used(man, false);
 		ttm_resource_manager_evict_all(&drm->ttm.bdev, man);
 		ttm_resource_manager_cleanup(man);
@@ -221,7 +221,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
 	unsigned long size_pages = drm->gem.gart_available >> PAGE_SHIFT;
 	const struct ttm_resource_manager_func *func = NULL;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA)
 		func = &nouveau_gart_manager;
 	else if (!drm->agp.bridge)
 		func = &nv04_gart_manager;
@@ -246,8 +246,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 {
 	struct ttm_resource_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_TT);
 
-	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
-	    drm->agp.bridge)
+	if (drm->device.impl->family < NVIF_DEVICE_TESLA && drm->agp.bridge)
 		ttm_range_man_fini(&drm->ttm.bdev, TTM_PL_TT);
 	else {
 		ttm_resource_manager_set_used(man, false);
@@ -271,15 +270,15 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	if (ret)
 		return ret;
 
-	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA &&
-	    drm->client.device.info.chipset != 0x50) {
+	if (drm->device.impl->family >= NVIF_DEVICE_TESLA &&
+	    drm->device.impl->chipset != 0x50) {
 		ret = nouveau_ttm_init_host(drm, NVIF_MEM_KIND);
 		if (ret)
 			return ret;
 	}
 
-	if (drm->client.device.info.platform != NV_DEVICE_INFO_V0_SOC &&
-	    drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
+	if (drm->device.impl->platform != NVIF_DEVICE_SOC &&
+	    drm->device.impl->family >= NVIF_DEVICE_TESLA) {
 		typei = nvif_mmu_type(mmu, NVIF_MEM_VRAM | NVIF_MEM_MAPPABLE |
 					   NVIF_MEM_KIND |
 					   NVIF_MEM_COMP |
@@ -310,7 +309,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 	}
 
 	/* VRAM init */
-	drm->gem.vram_available = drm->client.device.info.ram_user;
+	drm->gem.vram_available = drm->device.impl->ram_user;
 
 	arch_io_reserve_memtype_wc(device->func->resource_addr(device, 1),
 				   device->func->resource_size(device, 1));
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index f8bf0ec26844..ff7aeafb068b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -12,13 +12,13 @@ static unsigned int
 nouveau_vga_set_decode(struct pci_dev *pdev, bool state)
 {
 	struct nouveau_drm *drm = nouveau_drm(pci_get_drvdata(pdev));
-	struct nvif_object *device = &drm->client.device.object;
+	struct nvif_device *device = &drm->device;
 
-	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE &&
-	    drm->client.device.info.chipset >= 0x4c)
+	if (device->impl->family == NVIF_DEVICE_CURIE &&
+	    device->impl->chipset >= 0x4c)
 		nvif_wr32(device, 0x088060, state);
 	else
-	if (drm->client.device.info.chipset >= 0x40)
+	if (device->impl->chipset >= 0x40)
 		nvif_wr32(device, 0x088054, state);
 	else
 		nvif_wr32(device, 0x001854, state);
diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c b/drivers/gpu/drm/nouveau/nv84_fence.c
index 0626c24ca065..4b107c1a5686 100644
--- a/drivers/gpu/drm/nouveau/nv84_fence.c
+++ b/drivers/gpu/drm/nouveau/nv84_fence.c
@@ -215,7 +215,7 @@ nv84_fence_create(struct nouveau_drm *drm)
 	mutex_init(&priv->mutex);
 
 	/* Use VRAM if there is any ; otherwise fallback to system memory */
-	domain = drm->client.device.info.ram_size != 0 ?
+	domain = drm->device.impl->ram_size != 0 ?
 		NOUVEAU_GEM_DOMAIN_VRAM :
 		 /*
 		  * fences created in sysmem must be non-cached or we
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 131286239b51..7c2b57d562a4 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -85,19 +85,5 @@ nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_devic
 
 	nvif_object_ctor(&client->object, name ?: "nvifDevice", 0, 0, &device->object);
 	device->object.client = client;
-
-	if (ret == 0) {
-		/*FIXME: remove after moving users to device->impl */
-		device->info.version = 0;
-		device->info.platform = device->impl->platform;
-		device->info.chipset = device->impl->chipset;
-		device->info.revision = device->impl->revision;
-		device->info.family = device->impl->family;
-		device->info.ram_size = device->impl->ram_size;
-		device->info.ram_user = device->impl->ram_user;
-		strscpy(device->info.chip, device->impl->chip, sizeof(device->info.chip));
-		strscpy(device->info.name, device->impl->name, sizeof(device->info.name));
-	}
-
 	return ret;
 }
-- 
2.41.0

