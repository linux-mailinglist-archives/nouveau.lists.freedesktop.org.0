Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09AF8A794C
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:44:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E49811300C;
	Tue, 16 Apr 2024 23:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PyhJrWww";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2089.outbound.protection.outlook.com [40.107.244.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E53112FFB
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1j7nyZFViYrzkexLLfeeuEJZAswPEtuUW+SCSuVS65lklsDR4UJw5dhjF+KKIVl4n70rqozUfqfZ/5Hw4wIji/deaqsMiYYAxYlftG77qFti2rMP2hq0o2METsFqFNSGm9PM8tumRcU0qnx2y0x0WsD8WeVfqoG6y2CrV6KVG7V3Hvu5s6GVndfWvRsF6jB7YAh2APxcyq/CDdbd7DyzEFV6vHCd+YY7kuRYg+d2vw5+PEB3Xyxy0B6LSgHPw/ShC2Z9upsfXw/ENpiLkoFlykFrJ8z4fVXDelPeO/RoQsUOQy90zufl1S0iQVNSfgwF2759AU1F2r2P/QLvJF62A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/gNaAcngI4H5Q5q6PnOuYaXMhVgJduwAml1DdakNck=;
 b=nMax5V/dOapRLE7HJZ/o25x/aItCkGB6ZqntdE91UsVgBGVb3M85aehuQCNsx5ObmU4qxdoeWEwJt70S0P7Qk6lNXlNczVgynQCPrDf7KPt5l0+f9BsT9JFA9gdyfTMAMoBoEwjwF/5ZfesXD8Cvkq8sZVfEZvcXQVBF/WK74eUHaQpOKQzTlbq1JN1vwEr86eZze77hkKKjxX6NI8RK2042iTPYJ8pxziTUhC55MNSCBnlgkEgD0QBeNgKBo99FJjr0PB94uzCYE7JYb2QrjD8yZ/oEEixN1tCK/Vt8o5DukVk1KFtCBkj6XyUzjSh6L3Mkna5+a4M40yMnq5KucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/gNaAcngI4H5Q5q6PnOuYaXMhVgJduwAml1DdakNck=;
 b=PyhJrWwwDG9/hJyQklF1GXn89niQ8RjvHkaOWY+AJzVKrYpuskDjiNf0HjXcwReL2Nz0bzf+Gyght6VxZZS1libqbqnVStY4PahQzrPGTB9FNFilNabs9w/fpRzbzyDKj9v7Xkv8ZUnVJFAtMgXz8I/kw/wKHUVm3JRFe5ijRxHXjTfxNrWX6nZISc+Vw19ssrUN4+4GQ7YRLsRn/4tU6NrNOoCiqW9hAZXkIPXTQYyZOP/Y1a0OTNPyGGS3IpHwGN0x/KRLPyIvm1BQsRMYjCkmtRcdRkCsP1BdBc3yVAB3GgL1er0f7gMp3kSv8p7XRsvilSnWZ0Y3NzHpHHHlMQ==
Received: from CH2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:610:50::33)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:56 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::58) by CH2PR16CA0023.outlook.office365.com
 (2603:10b6:610:50::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:25 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 153/156] drm/nouveau: pass nouveau_drm to nvxx_*
Date: Wed, 17 Apr 2024 09:39:59 +1000
Message-ID: <20240416234002.19509-154-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1576b6-c9fd-4d0a-9343-08dc5e6f14f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e/6+ylgDJrripaex/1Xc/gXXGrHI0OtoMxYWQCZiweBkB3jenzB/9KXi+W7/+CaLIJORFDBjSkGPBHPeIc7bicJJgx/q3peTm2W2m97haiYxgx7twQK//CAMF6AZzeGvOMh2xveuzY33Xkj5vHdVqhzktLZH6ieP113oLCcQmNqODQ1TysTsV6mM+is2FK2b1rdkpNGrFSSSc9OEOh+rT+EXWvETZfIky/yUPpEMAnpZqtdQsP2eZOO7Z1I6I+meHpB+DfA2zxF08FinAoJ0O7qzLUJuJYueqJm1jZigsqFq6Ov6Z320hBjJdFmJHw/OkKMPctqjTQSm04sx8KxQsKfXDk6U3Ph6GUz8N3Okf4jvZXkk8l//aa9UltD3y29+gAWmCg9NRhAhNzE7HaDAddd7LcC1W/VU63V7HCbluntCVMOaSayHTPeMx8mPi78EH6q5633bjHJ7lgWI98yoUqJ1QXmclsKTTER6vze+dbkWMPlYkMhoFzP2Y9XZZzfsHu0yGRFnt+ys4OxhhwyGakDql6mp3w+1T7jV9YTp03rLlNGJOs/04MGw85ljIEIyRQT9NMRkE+E0xM/GOznhfy6V45F4+XLChRYSGTu6qT3wToLqzLLVPORFo5nHJR739SShFUYeyCEq8cyDBnf8pMQQ9aNBiqsAsVC0UxTKTaA3Ttoh1zXRYwXxTRaFXPZzlU0O/NIuv2wQ7h3ZzCLg52oyGvA9OZVZcqbbHsBss8OpvC+U/o9zjINkUSBl2lS4
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:56.3584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1576b6-c9fd-4d0a-9343-08dc5e6f14f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958
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

- removes usage of nvif_object.priv

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
 drivers/gpu/drm/nouveau/include/nvif/object.h |  1 -
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bios.c        |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  8 ++--
 drivers/gpu/drm/nouveau/nouveau_chan.c        |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_hwmon.c       | 46 +++++++++----------
 drivers/gpu/drm/nouveau/nouveau_led.c         |  2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
 drivers/gpu/drm/nouveau/nvif/device.c         |  1 -
 drivers/gpu/drm/nouveau/nvif/object.c         |  1 -
 21 files changed, 56 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
index 8e8a43b28f71..90e549541981 100644
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
index 3d564512b0f6..1ccd78d270b3 100644
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
index 7762469af47b..a23e1d264294 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -318,7 +318,7 @@ nv50_dac_create(struct nouveau_encoder *nv_encoder)
 {
 	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus;
 	struct drm_encoder *encoder;
 	struct dcb_output *dcbe = nv_encoder->dcb;
@@ -1638,7 +1638,7 @@ nv50_sor_create(struct nouveau_encoder *nv_encoder)
 	struct drm_connector *connector = &nv_encoder->conn->base;
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_drm *drm = nouveau_drm(connector->dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct drm_encoder *encoder;
 	struct dcb_output *dcbe = nv_encoder->dcb;
 	struct nv50_disp *disp = nv50_disp(connector->dev);
@@ -1805,7 +1805,7 @@ nv50_pior_create(struct nouveau_encoder *nv_encoder)
 	struct drm_device *dev = connector->dev;
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nv50_disp *disp = nv50_disp(dev);
-	struct nvkm_i2c *i2c = nvxx_i2c(&drm->client.device);
+	struct nvkm_i2c *i2c = nvxx_i2c(drm);
 	struct nvkm_i2c_bus *bus = NULL;
 	struct nvkm_i2c_aux *aux = NULL;
 	struct i2c_adapter *ddc;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 94722ded1d68..7a90eab48eec 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -9,7 +9,6 @@ struct nvif_object {
 	const char *name;
 	u32 handle;
 	s32 oclass;
-	void *priv; /*XXX: hack */
 	struct {
 		void __iomem *ptr;
 		u64 size;
diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 8cc7b2410a04..ef668f20111a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -212,8 +212,8 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
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
index 479effcf607e..829e98da56d0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -2019,7 +2019,7 @@ uint8_t *nouveau_bios_embedded_edid(struct drm_device *dev)
 static bool NVInitVBIOS(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
-	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
+	struct nvkm_bios *bios = nvxx_bios(drm);
 	struct nvbios *legacy = &drm->vbios;
 
 	memset(legacy, 0, sizeof(struct nvbios));
@@ -2090,7 +2090,7 @@ nouveau_bios_init(struct drm_device *dev)
 
 	/* only relevant for PCI devices */
 	if (!dev_is_pci(dev->dev) ||
-	    nvkm_gsp_rm(nvxx_device(&drm->client.device)->gsp))
+	    nvkm_gsp_rm(nvxx_device(drm)->gsp))
 		return 0;
 
 	if (!NVInitVBIOS(dev))
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index a94735ec3a9e..60ce4b46a3a4 100644
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
 
@@ -1176,7 +1176,7 @@ static int
 nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bdev);
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nvif_mmu *mmu = &drm->mmu;
 	int ret;
@@ -1297,7 +1297,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
 	struct nouveau_bo *nvbo = nouveau_bo(bo);
-	struct nvkm_device *device = nvxx_device(&drm->client.device);
+	struct nvkm_device *device = nvxx_device(drm);
 	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
 	int i, ret;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 54816bcca14c..1cd8953740f5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -216,8 +216,7 @@ nouveau_channel_prep(struct nouveau_cli *cli,
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
index aac9e57d0204..fb01f51fd689 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -347,8 +347,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
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
index b4069d2b31f9..12c9ac68a23e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -374,11 +374,11 @@ extern int nouveau_modeset;
 #include <subdev/pci.h>
 
 #define nvxx_device(a) ({                        \
-	struct nvif_device *_device = (a);       \
+	struct nouveau_drm *_drm = (a);          \
 	struct {                                 \
 		struct nvkm_object object;       \
 		struct nvkm_device *device;      \
-	} *_udevice = _device->object.priv;      \
+	} *_udevice = (void *)_drm->device.priv; \
 	_udevice->device;                        \
 })
 #define nvxx_bios(a) nvxx_device(a)->bios
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
index fc1d6fd94480..36f5be963851 100644
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
diff --git a/drivers/gpu/drm/nouveau/nvif/device.c b/drivers/gpu/drm/nouveau/nvif/device.c
index 480034b5563b..131286239b51 100644
--- a/drivers/gpu/drm/nouveau/nvif/device.c
+++ b/drivers/gpu/drm/nouveau/nvif/device.c
@@ -85,7 +85,6 @@ nvif_device_ctor(struct nvif_client *client, const char *name, struct nvif_devic
 
 	nvif_object_ctor(&client->object, name ?: "nvifDevice", 0, 0, &device->object);
 	device->object.client = client;
-	device->object.priv = device->priv; /*FIXME: used by nvxx_device() */
 
 	if (ret == 0) {
 		/*FIXME: remove after moving users to device->impl */
diff --git a/drivers/gpu/drm/nouveau/nvif/object.c b/drivers/gpu/drm/nouveau/nvif/object.c
index 6044634f20b8..8d4d7a93b92f 100644
--- a/drivers/gpu/drm/nouveau/nvif/object.c
+++ b/drivers/gpu/drm/nouveau/nvif/object.c
@@ -90,7 +90,6 @@ nvif_object_ctor(struct nvif_object *parent, const char *name, u32 handle, s32 o
 	object->name = name ?: "nvifObject";
 	object->handle = handle;
 	object->oclass = oclass;
-	object->priv = NULL;
 	object->map.ptr = NULL;
 	object->map.size = 0;
 }
-- 
2.41.0

