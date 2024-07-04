Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0F492AD62
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954410E45B;
	Tue,  9 Jul 2024 00:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bf8t+WPJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1B310E470
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTOJlsKMU0rtxls1S45I8BUe5Er0e5EDS6QtyVcOcUfEPA9WyZX2gFV1kE3aklXaVMATlpghFmpdRDNwx+hYhUoLxhYbydQYUVQUgozSuXib2x/wRZx26VdwEpUK/z21Wcd11pT4a/wkwbjLcOieY8WcoqxAyzSDXqoyoCx11D2tAALjITL7u8I13IyUPHT6nfqS5Dx78ry4yTlZxTx5zyzTrmbCIqBaCg5VdNg7Cm5Jqn9telZKJzRSvn8keYbYEVlQ4Mx9XAfYWB/kA4gwunbyi0c1WwRo1gb5hpONIc6q2zpSyWEtnIgITVDJdT7ryrxY+NLbQEJPT+z6jMD+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRLnNmm1aNouhUJV3PmWr/qUlwIroGq8WP3qeAQzTnE=;
 b=MDYaxXK3HfSE0R03PCtE3onYlcbhvJ5bCmocKcGY08fmaOSw0rt551yYxhAZNM3i5uVxJ1BiofxvTNe0kxDOf2NEZqwH5CisgDMnhOB8TLHAmvNuKMQ9K/qUrZtyqFH+XpekrMkSztGGPbHURSPk7AZ8D6YPp1BwJYayQacHsCyB4zMqzOWJtEDvlId0GjOw+c8851V2xLyqCPOcFuh+WmyGkbHs8rAQByq1fq5/9dgDhJvhIc5iRetjua3o8lGJ7XTGiaCU/2RY3TEu4BFxdSWUpj5G8qc3IATyRPgksgvcB2AAOKsBCHMg/I6rTxnK4f89EkN4VZ1MErrA/8kBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRLnNmm1aNouhUJV3PmWr/qUlwIroGq8WP3qeAQzTnE=;
 b=Bf8t+WPJxR/rZCr4gG3mnlGWSlVj/qMqTjojvQUe1ahmGaUZNoGU0Ml6aWkKRmuOpJgSzxBClifNfutQ0UpZruT6KAsr1us66Gng37dgWSQ0PIfpZlE4ToVU9QfKqlsHIvZzqZf+LJ76+CJF4qVA1rWCBDBL3Dl+QafWXWuYG96iWpcs4KKZKlQ6DTLuemPBqz93nO/uVTzfr7q6iZsfbkGnhX1X0Nx3VtQGwXRCIoenRMZ2hlMVKt0iN0sY1SsTPyIMpyRYMdC6luxh8TVnOwCk1DBTBH2npoGE1QT9awCzbVS6OFo4W3/BkUvF3tI96DL9eNGJJPfOSDCib0Q7Mg==
Received: from BN9PR03CA0380.namprd03.prod.outlook.com (2603:10b6:408:f7::25)
 by PH7PR12MB8105.namprd12.prod.outlook.com (2603:10b6:510:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:37 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::83) by BN9PR03CA0380.outlook.office365.com
 (2603:10b6:408:f7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:24 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:22 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 27/37] drm/nouveau: move nvxx_* definitions to nouveau_drv.h
Date: Fri, 5 Jul 2024 04:37:11 +1000
Message-ID: <20240704183721.25778-28-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|PH7PR12MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 371acaef-34d6-461d-9f07-08dc9fb1d8ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lj3gkPWpfzWidV/5w85+oSjl8WturVqHMPNRh3J/Jf9Lo5tVu3J5ySKDRo1S?=
 =?us-ascii?Q?I5oklWwrJLUrEzBQj9NSFovkPQtUB6LdvmCRk+txw99L1T5OgnMfNFmAhPgD?=
 =?us-ascii?Q?3lx7kb2/H3HJ5kruERXFOzQPUjVJbUtUP56ElKKPB+eQF7a3L14iW2Ab/f5o?=
 =?us-ascii?Q?0HuKMkiUa40E5VqI8JSrIFmyzUHV++htLIsV6mEGJroOzWAF+phWwULzGdM0?=
 =?us-ascii?Q?ZF2x9QGrTqAjK/yVxe/QSzF+hNeXAZqfu3Alr0MRkSUX1GQv/Mk3F4EDGbjJ?=
 =?us-ascii?Q?CFQYVqUeOPJpOyMuGdyaYHZxxgWgmiRCdHrLz/vg2Vd47v+teDT+dvBieD2x?=
 =?us-ascii?Q?7lZYGeN8HyjvNXCp3bccP2h5iDr3okExtKZu2bnm0W/i6mt8nm4tsiPcjAt7?=
 =?us-ascii?Q?/o6N++aY0cgvBKCbfz+87x+v04T/1G3FtgkSN3mPYcL07ELAq6Pf318qM0Oo?=
 =?us-ascii?Q?uxA9IPZOs1nBrE8nds8kK945TOA3ENuiYgfL4upz5GZRmkn0STc1nnEVyXQb?=
 =?us-ascii?Q?WTXM+rMICx8xMBcLidZ6EOvsIsaVvcSbQhH2g69e87yRM/rdLVY/OMe4oZzq?=
 =?us-ascii?Q?2Zvvp336aCx8WMWO5nAA+zLkfwUFPoNFx/QASeqtFXzlX++Ay5IgWfhg5FEm?=
 =?us-ascii?Q?RkfvBlil9m2CxYjqLKw9XkRVFEKQEb2xCULChVKCq3zA3L9KLiR1X5JJPLAl?=
 =?us-ascii?Q?iYCzcmFRKYrdvc3DpZvlO73YkVEshQxkJHCooW7EIngl6GvdwFMQQ0ALA1sH?=
 =?us-ascii?Q?08u0/GlnG6q9CoejhigzL4G+kJAJok0CLpUxd1g6FdTcn27XRWLXE1G5ZxCE?=
 =?us-ascii?Q?5XLCcFIk8O7Unyra/vEirk8AMAqkqGA5eEr6RjZTYuBzULzLF8CmcMsll+qI?=
 =?us-ascii?Q?RqlwFHHMgcO0Qf2jpQK4EJ63qzVoR4aa9Bnc/+rKNM7c5ihbugLAS8XLGVOC?=
 =?us-ascii?Q?94qyTf8SfpJVgyWWaKPqzRxtWbUKb78W/E/BCuxNjaCnwinCb2eO4lG01nLg?=
 =?us-ascii?Q?4Ncq2D09O0HtOstyqIK8L5m+94k8rUVSXbxRCiQ5yce0phtHjPp4P2SZ+cbk?=
 =?us-ascii?Q?aNetW+MedjNZ+uwuaQhuzzkndL/4AFLBUGNvROWF3YB7pPsPNd1v1JsWIhBR?=
 =?us-ascii?Q?CPUJ/zD6wi/Lh94q//H+apmlElir+5jODGkkb+yz04/OaEdZ9b1s4r4BB9nr?=
 =?us-ascii?Q?dFquK2/u6RnbVpNHjxctrzu2Pzn5Y11ZoZG12PzdVegG+eVhXiO439B0Jarj?=
 =?us-ascii?Q?uMV0eWPKgKrDYsLdDK7eWTe9iA5GD/33V70NVAVP+GDH/tWt1HEU/CbZl6Xv?=
 =?us-ascii?Q?7TeHtD62L4r7Yc3XBNEr7LD/b0yd+PJcHc5cJNy05SWBqeTRJ8UFpxjDCcJz?=
 =?us-ascii?Q?8Aj7ga/c/w8Xv4Wq5fzqSr4bBq9scIcFm06jq7yDdWpNeMaEDJLfTFRwo9ES?=
 =?us-ascii?Q?oY+L+d6LrB+kf1GBqi1ZI7XhuPpP41A8?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:37.0957 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 371acaef-34d6-461d-9f07-08dc9fb1d8ac
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8105
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

These are some dodgy "convenience" macros for the DRM driver to peek
into NVKM state.  They're still used in a few places, but don't belong
in nvif/device.h in any case.

Move them to nouveau_drv.h, and modify callers to pass a nouveau_drm
instead of an nvif_device.

v2:
- use drm->nvkm pointer for nvxx_*() macros, removing some void*

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/dac.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/dfp.c        |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.c       |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/disp.h       |  2 +-
 drivers/gpu/drm/nouveau/dispnv04/hw.c         |  9 ++--
 drivers/gpu/drm/nouveau/dispnv04/tvnv04.c     |  4 +-
 drivers/gpu/drm/nouveau/dispnv04/tvnv17.c     |  6 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  6 +--
 drivers/gpu/drm/nouveau/include/nvif/device.h | 33 -------------
 drivers/gpu/drm/nouveau/include/nvif/object.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.h        |  1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 ++--
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         | 27 +++++++++++
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 46 +++++++++----------
 drivers/gpu/drm/nouveau/nouveau_led.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
 21 files changed, 83 insertions(+), 91 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 4310ad71870b..e5067d5a4801 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
@@ -118,8 +118,8 @@ static void nv_crtc_calc_state_ext(struct drm_crtc *crtc, struct drm_display_mod
 {
 	struct drm_device *dev = crtc->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
-	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
+	struct nvkm_bios *bios = nvxx_bios(drm);
+	struct nvkm_clk *clk = nvxx_clk(drm);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
 	struct nv04_mode_state *state = &nv04_display(dev)->mode_reg;
 	struct nv04_crtc_reg *regp = &state->crtc_reg[nv_crtc->index];
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dac.c b/drivers/gpu/drm/nouveau/dispnv04/dac.c
index d6b8e0cce2ac..2e12bf136607 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dac.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dac.c
@@ -237,7 +237,7 @@ uint32_t nv17_dac_sample_load(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_object *device = &nouveau_drm(dev)->client.device.object;
-	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
+	struct nvkm_gpio *gpio = nvxx_gpio(drm);
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 	uint32_t sample, testval, regoffset = nv04_dac_output_offset(encoder);
 	uint32_t saved_powerctrl_2 = 0, saved_powerctrl_4 = 0, saved_routput,
diff --git a/drivers/gpu/drm/nouveau/dispnv04/dfp.c b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
index d5b129dc623b..504c421aa176 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/dfp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/dfp.c
@@ -626,7 +626,7 @@ static void nv04_tmds_slave_init(struct drm_encoder *encoder)
 	struct drm_device *dev = encoder->dev;
 	struct dcb_output *dcb = nouveau_encoder(encoder)->dcb;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, NVKM_I2C_BUS_PRI);
 	struct nvkm_i2c_bus_probe info[] = {
 		{
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index e8b27bb135e7..e563a160571a 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -211,7 +211,7 @@ int
 nv04_display_create(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct dcb_table *dcb = &drm->vbios.dcb;
 	struct drm_connector *connector, *ct;
 	struct drm_encoder *encoder;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.h b/drivers/gpu/drm/nouveau/dispnv04/disp.h
index 11a6663758ec..85ec0f534392 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.h
@@ -176,7 +176,7 @@ static inline void
 nouveau_bios_run_init_table(struct drm_device *dev, u16 table,
 			    struct dcb_output *outp, int crtc)
 {
-	nvbios_init(&nvxx_bios(&nouveau_drm(dev)->client.device)->subdev, table,
+	nvbios_init(&nvxx_bios(nouveau_drm(dev))->subdev, table,
 		init.outp = outp;
 		init.head = crtc;
 	);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index f7d35657aa64..8b376f9c8746 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -166,7 +166,7 @@ nouveau_hw_get_pllvals(struct drm_device *dev, enum nvbios_pll_type plltype,
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_object *device = &drm->client.device.object;
-	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
+	struct nvkm_bios *bios = nvxx_bios(drm);
 	uint32_t reg1, pll1, pll2 = 0;
 	struct nvbios_pll pll_lim;
 	int ret;
@@ -258,9 +258,8 @@ nouveau_hw_fix_bad_vpll(struct drm_device *dev, int head)
 	 */
 
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvif_device *device = &drm->client.device;
-	struct nvkm_clk *clk = nvxx_clk(device);
-	struct nvkm_bios *bios = nvxx_bios(device);
+	struct nvkm_clk *clk = nvxx_clk(drm);
+	struct nvkm_bios *bios = nvxx_bios(drm);
 	struct nvbios_pll pll_lim;
 	struct nvkm_pll_vals pv;
 	enum nvbios_pll_type pll = head ? PLL_VPLL1 : PLL_VPLL0;
@@ -470,7 +469,7 @@ nv_load_state_ramdac(struct drm_device *dev, int head,
 		     struct nv04_mode_state *state)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_clk *clk = nvxx_clk(&drm->client.device);
+	struct nvkm_clk *clk = nvxx_clk(drm);
 	struct nv04_crtc_reg *regp = &state->crtc_reg[head];
 	uint32_t pllreg = head ? NV_RAMDAC_VPLL2 : NV_PRAMDAC_VPLL_COEFF;
 	int i;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
index de3ea731d6e6..d3014027a812 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv04.c
@@ -53,7 +53,7 @@ static struct nvkm_i2c_bus_probe nv04_tv_encoder_info[] = {
 int nv04_tv_identify(struct drm_device *dev, int i2c_index)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, i2c_index);
 	if (bus) {
 		return nvkm_i2c_bus_probe(bus, "TV encoder",
@@ -205,7 +205,7 @@ nv04_tv_create(struct drm_connector *connector, struct dcb_output *entry)
 	struct drm_encoder *encoder;
 	struct drm_device *dev = connector->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus = nvkm_i2c_bus_find(i2c, entry->i2c_index);
 	int type, ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
index 670c9739e5e1..c11f58033018 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c
@@ -47,7 +47,7 @@ static uint32_t nv42_tv_sample_load(struct drm_encoder *encoder)
 {
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
+	struct nvkm_gpio *gpio = nvxx_gpio(drm);
 	uint32_t testval, regoffset = nv04_dac_output_offset(encoder);
 	uint32_t gpio0, gpio1, fp_htotal, fp_hsync_start, fp_hsync_end,
 		fp_control, test_ctrl, dacclk, ctv_14, ctv_1c, ctv_6c;
@@ -131,7 +131,7 @@ static bool
 get_tv_detect_quirks(struct drm_device *dev, uint32_t *pin_mask)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 
 	if (device->quirk && device->quirk->tv_pin_mask) {
 		*pin_mask = device->quirk->tv_pin_mask;
@@ -363,7 +363,7 @@ static void  nv17_tv_dpms(struct drm_encoder *encoder, int mode)
 {
 	struct drm_device *dev = encoder->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
+	struct nvkm_gpio *gpio = nvxx_gpio(drm);
 	struct nv17_tv_state *regs = &to_tv_enc(encoder)->state;
 	struct nv17_tv_norm_params *tv_norm = get_tv_norm(encoder);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 42375f757d7c..80803346b620 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -561,7 +561,7 @@ nv50_dac_create(struct nouveau_encoder *nv_encoder)
 {
 	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus;
 	struct drm_encoder *encoder;
 	struct dcb_output *dcbe = nv_encoder->dcb;
@@ -1884,7 +1884,7 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct drm_encoder *encoder;
 	struct dcb_output *dcbe = nv_encoder->dcb;
 	struct nv50_disp *disp = nv50_disp(connector->dev);
@@ -2051,7 +2051,7 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
 	struct drm_device *dev = connector->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv50_disp *disp = nv50_disp(dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus = NULL;
 	struct nvkm_i2c_aux *aux = NULL;
 	struct i2c_adapter *ddc;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h b/drivers/gpu/drm/nouveau/include/nvif/device.h
index fec76f4733a4..7877a2a79da9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/device.h
@@ -22,37 +22,4 @@ int  nvif_device_ctor(struct nvif_client *, const char *name, struct nvif_device
 void nvif_device_dtor(struct nvif_device *);
 int  nvif_device_map(struct nvif_device *);
 u64  nvif_device_time(struct nvif_device *);
-
-/*XXX*/
-#include <subdev/bios.h>
-#include <subdev/fb.h>
-#include <subdev/bar.h>
-#include <subdev/gpio.h>
-#include <subdev/clk.h>
-#include <subdev/i2c.h>
-#include <subdev/timer.h>
-#include <subdev/therm.h>
-#include <subdev/pci.h>
-
-#define nvxx_device(a) ({                                                      \
-	struct nvif_device *_device = (a);                                     \
-	struct {                                                               \
-		struct nvkm_object object;                                     \
-		struct nvkm_device *device;                                    \
-	} *_udevice = _device->object.priv;                                    \
-	_udevice->device;                                                      \
-})
-#define nvxx_bios(a) nvxx_device(a)->bios
-#define nvxx_fb(a) nvxx_device(a)->fb
-#define nvxx_gpio(a) nvxx_device(a)->gpio
-#define nvxx_clk(a) nvxx_device(a)->clk
-#define nvxx_i2c(a) nvxx_device(a)->i2c
-#define nvxx_iccsense(a) nvxx_device(a)->iccsense
-#define nvxx_therm(a) nvxx_device(a)->therm
-#define nvxx_volt(a) nvxx_device(a)->volt
-
-#include <engine/fifo.h>
-#include <engine/gr.h>
-
-#define nvxx_gr(a) nvxx_device(a)->gr
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 8d205b6af46a..3534b241cad9 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -15,7 +15,7 @@ struct nvif_object {
 	const char *name;
 	u32 handle;
 	s32 oclass;
-	void *priv; /*XXX: hack */
+	void *priv;
 	struct {
 		void __iomem *ptr;
 		u64 size;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 704977530b6b..5d74c36a4ca5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -240,8 +240,8 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvif_device *device = &drm->client.device;
-	struct nvkm_device *nvkm_device = nvxx_device(&drm->client.device);
-	struct nvkm_gr *gr = nvxx_gr(device);
+	struct nvkm_device *nvkm_device = nvxx_device(drm);
+	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_getparam *getparam = data;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 79cfab53f80e..a8da6492efd3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2020,7 +2020,7 @@ uint8_t *nouveau_bios_embedded_edid(struct drm_device *dev)
 static bool NVInitVBIOS(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
+	struct nvkm_bios *bios = nvxx_bios(drm);
 	struct nvbios *legacy = &drm->vbios;
 
 	memset(legacy, 0, sizeof(struct nvbios));
@@ -2091,7 +2091,7 @@ nouveau_bios_init(struct drm_device *dev)
 
 	/* only relevant for PCI devices */
 	if (!dev_is_pci(dev->dev) ||
-	    nvkm_gsp_rm(nvxx_device(&drm->client.device)->gsp))
+	    nvkm_gsp_rm(nvxx_device(drm)->gsp))
 		return 0;
 
 	if (!NVInitVBIOS(dev))
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.h b/drivers/gpu/drm/nouveau/nouveau_bios.h
index 18eb061ccafb..62b5f5889041 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.h
@@ -48,6 +48,7 @@ struct bit_entry {
 
 int bit_table(struct drm_device *, u8 id, struct bit_entry *);
 
+#include <subdev/bios.h>
 #include <subdev/bios/dcb.h>
 #include <subdev/bios/conn.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 0712d0b15170..6631d85ea749 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -58,7 +58,7 @@ nv10_bo_update_tile_region(struct drm_device *dev, struct nouveau_drm_tile *reg,
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	int i = reg - drm->tile.reg;
-	struct nvkm_fb *fb = nvxx_fb(&drm->client.device);
+	struct nvkm_fb *fb = nvxx_fb(drm);
 	struct nvkm_fb_tile *tile = &fb->tile.region[i];
 
 	nouveau_fence_unref(&reg->fence);
@@ -109,7 +109,7 @@ nv10_bo_set_tiling(struct drm_device *dev, u32 addr,
 		   u32 size, u32 pitch, u32 zeta)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_fb *fb = nvxx_fb(&drm->client.device);
+	struct nvkm_fb *fb = nvxx_fb(drm);
 	struct nouveau_drm_tile *tile, *found = NULL;
 	int i;
 
@@ -1171,7 +1171,7 @@ static int
 nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nvif_mmu *mmu = &drm->client.mmu;
 	int ret;
@@ -1291,7 +1291,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
 	int i, ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index ce04c40e6f8f..0105d4704c3a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -218,8 +218,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 			 */
 			args.target = NV_DMA_V0_TARGET_PCI;
 			args.access = NV_DMA_V0_ACCESS_RDWR;
-			args.start = nvxx_device(device)->func->
-				resource_addr(nvxx_device(device), 1);
+			args.start = nvxx_device(drm)->func->resource_addr(nvxx_device(drm), 1);
 			args.limit = args.start + device->info.ram_user - 1;
 		} else {
 			args.target = NV_DMA_V0_TARGET_VRAM;
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 936eb32fc8c4..5ff116bcbabf 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -424,8 +424,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
 	 * any GPU where it's possible we'll end up using M2MF for BO moves.
 	 */
 	if (device->info.family < NV_DEVICE_INFO_V0_FERMI) {
-		ret = nvkm_gpuobj_new(nvxx_device(device), 32, 0, false, NULL,
-				      &drm->notify);
+		ret = nvkm_gpuobj_new(nvxx_device(drm), 32, 0, false, NULL, &drm->notify);
 		if (ret) {
 			NV_ERROR(drm, "failed to allocate notifier, %d\n", ret);
 			nouveau_accel_gr_fini(drm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 80ffe15ba76b..a9e0a63c772e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -360,4 +360,31 @@ void nouveau_drm_device_remove(struct nouveau_drm *);
 
 extern int nouveau_modeset;
 
+/*XXX*/
+#include <subdev/bios.h>
+#include <subdev/fb.h>
+#include <subdev/gpio.h>
+#include <subdev/clk.h>
+#include <subdev/i2c.h>
+#include <subdev/timer.h>
+#include <subdev/therm.h>
+
+static inline struct nvkm_device *
+nvxx_device(struct nouveau_drm *drm)
+{
+	return drm->nvkm;
+}
+
+#define nvxx_bios(a) nvxx_device(a)->bios
+#define nvxx_fb(a) nvxx_device(a)->fb
+#define nvxx_gpio(a) nvxx_device(a)->gpio
+#define nvxx_clk(a) nvxx_device(a)->clk
+#define nvxx_i2c(a) nvxx_device(a)->i2c
+#define nvxx_iccsense(a) nvxx_device(a)->iccsense
+#define nvxx_therm(a) nvxx_device(a)->therm
+#define nvxx_volt(a) nvxx_device(a)->volt
+
+#include <engine/gr.h>
+
+#define nvxx_gr(a) nvxx_device(a)->gr
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index db30a4c2cd4d..5c07a9ee8b77 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -52,7 +52,7 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	return sysfs_emit(buf, "%d\n",
 			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
@@ -64,7 +64,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp(struct device *d,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	long value;
 
 	if (kstrtol(buf, 10, &value))
@@ -85,7 +85,7 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device *d,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	return sysfs_emit(buf, "%d\n",
 			  therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
@@ -97,7 +97,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp_hyst(struct device *d,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	long value;
 
 	if (kstrtol(buf, 10, &value))
@@ -118,7 +118,7 @@ nouveau_hwmon_get_pwm1_max(struct device *d,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	int ret;
 
 	ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MAX_DUTY);
@@ -134,7 +134,7 @@ nouveau_hwmon_get_pwm1_min(struct device *d,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	int ret;
 
 	ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MIN_DUTY);
@@ -150,7 +150,7 @@ nouveau_hwmon_set_pwm1_min(struct device *d, struct device_attribute *a,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	long value;
 	int ret;
 
@@ -173,7 +173,7 @@ nouveau_hwmon_set_pwm1_max(struct device *d, struct device_attribute *a,
 {
 	struct drm_device *dev = dev_get_drvdata(d);
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	long value;
 	int ret;
 
@@ -247,7 +247,7 @@ static umode_t
 nouveau_power_is_visible(const void *data, u32 attr, int channel)
 {
 	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
+	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
 
 	if (!iccsense || !iccsense->data_valid || list_empty(&iccsense->rails))
 		return 0;
@@ -272,7 +272,7 @@ static umode_t
 nouveau_temp_is_visible(const void *data, u32 attr, int channel)
 {
 	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm || !therm->attr_get || nvkm_therm_temp_get(therm) < 0)
 		return 0;
@@ -296,7 +296,7 @@ static umode_t
 nouveau_pwm_is_visible(const void *data, u32 attr, int channel)
 {
 	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm || !therm->attr_get || !therm->fan_get ||
 	    therm->fan_get(therm) < 0)
@@ -315,7 +315,7 @@ static umode_t
 nouveau_input_is_visible(const void *data, u32 attr, int channel)
 {
 	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
+	struct nvkm_volt *volt = nvxx_volt(drm);
 
 	if (!volt || nvkm_volt_get(volt) < 0)
 		return 0;
@@ -335,7 +335,7 @@ static umode_t
 nouveau_fan_is_visible(const void *data, u32 attr, int channel)
 {
 	struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm || !therm->attr_get || nvkm_therm_fan_sense(therm) < 0)
 		return 0;
@@ -367,7 +367,7 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 	int ret;
 
 	if (!therm || !therm->attr_get)
@@ -416,7 +416,7 @@ nouveau_fan_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm)
 		return -EOPNOTSUPP;
@@ -439,7 +439,7 @@ nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
+	struct nvkm_volt *volt = nvxx_volt(drm);
 	int ret;
 
 	if (!volt)
@@ -470,7 +470,7 @@ nouveau_pwm_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm || !therm->attr_get || !therm->fan_get)
 		return -EOPNOTSUPP;
@@ -496,7 +496,7 @@ nouveau_power_read(struct device *dev, u32 attr, int channel, long *val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
+	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
 
 	if (!iccsense)
 		return -EOPNOTSUPP;
@@ -525,7 +525,7 @@ nouveau_temp_write(struct device *dev, u32 attr, int channel, long val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm || !therm->attr_set)
 		return -EOPNOTSUPP;
@@ -559,7 +559,7 @@ nouveau_pwm_write(struct device *dev, u32 attr, int channel, long val)
 {
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
+	struct nvkm_therm *therm = nvxx_therm(drm);
 
 	if (!therm || !therm->attr_set)
 		return -EOPNOTSUPP;
@@ -664,9 +664,9 @@ nouveau_hwmon_init(struct drm_device *dev)
 {
 #if defined(CONFIG_HWMON) || (defined(MODULE) && defined(CONFIG_HWMON_MODULE))
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.device);
-	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
-	struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
+	struct nvkm_iccsense *iccsense = nvxx_iccsense(drm);
+	struct nvkm_therm *therm = nvxx_therm(drm);
+	struct nvkm_volt *volt = nvxx_volt(drm);
 	const struct attribute_group *special_groups[N_ATTR_GROUPS];
 	struct nouveau_hwmon *hwmon;
 	struct device *hwmon_dev;
diff --git a/drivers/gpu/drm/nouveau/nouveau_led.c b/drivers/gpu/drm/nouveau/nouveau_led.c
index 2c5e0628da12..ac950518a820 100644
--- a/drivers/gpu/drm/nouveau/nouveau_led.c
+++ b/drivers/gpu/drm/nouveau/nouveau_led.c
@@ -78,7 +78,7 @@ int
 nouveau_led_init(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_gpio *gpio = nvxx_gpio(&drm->client.device);
+	struct nvkm_gpio *gpio = nvxx_gpio(drm);
 	struct dcb_gpio_func logo_led;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 486f39f31a38..53553819bcac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -261,7 +261,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
 int
 nouveau_ttm_init(struct nouveau_drm *drm)
 {
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 	struct nvkm_pci *pci = device->pci;
 	struct nvif_mmu *mmu = &drm->client.mmu;
 	struct drm_device *dev = drm->dev;
@@ -348,7 +348,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 void
 nouveau_ttm_fini(struct nouveau_drm *drm)
 {
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 
 	nouveau_ttm_fini_vram(drm);
 	nouveau_ttm_fini_gtt(drm);
-- 
2.45.1

