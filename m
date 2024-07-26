Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6B393CD37
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD02B10E1A1;
	Fri, 26 Jul 2024 04:39:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XjpDwoqD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F26710E1A1
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YE6NWG4AoZaLp4o4gVjNmvxwOPxQzZKnOozws/lW+81GymB/Ae7KI7pH4QfkRWUs+yU1fUxxmyQRTxe1U0sUIsDhzU1+a81JkcwX9m8eqVNWdjuXg60sn69xnQs3YHOW3XLRypbg+PkHecEKEjmDTuHiI5pugLj2/d9ARqv9snJEbw3LI3zdtRrqNDuakVjfy0Vz8muIb3GA4Kc2ioPH+ROKdLPL4Q1pTfr0LCsYU1rG9ddDskIiGPnkxtAf81z4qAHcWsGLixaHLt7nJJLlb9GK2qE1UxqcvJ290olye2PK/qo5a2e0DXBdz1/AZvkKcDY6UqV+gienCQ0gLQfE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqWCJGem532RZw0kFF33Mld0NVG0el50MVpPr0VUE2o=;
 b=JzBzPz4YOdmfS+lDOhpAAdSex9DR+ITJksRaJqMIR1Kv0aS7HiS5y2wzGcngFwwmFFYqwfEVbXFwFgsxeftsfiLgk8OlEqWcTVfOlmtsNzuX2Fo57xVJLNgyDXSFXuwRTJsYZ7L29smwapcSzvb1AX9IrhVdJc4wg0yV3L7ZdoPuEjXC4Ztu+GrgqNcHluvrxm2NJ2DEKb2ORZLjLpxawOePitm+/0rxpjq9kyNwzvIWO6GSJqpMDIEC6IIE0nvn1xCA3movoGEqkZyLGhcD0Q1SLRbr2iJf8hYuVu26XyZqyu57QZx2TkhNuZBAP41LCTiyhJeHuM5di8pa1joDzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqWCJGem532RZw0kFF33Mld0NVG0el50MVpPr0VUE2o=;
 b=XjpDwoqDEdTSUQ9lZzLtyBEBoUHPJupRwYHkHbLu3eo3oKJR7Xj63j+hpbQLCqOYKy7dQp5P3pwYWzQkMGkdz1hLbEkFfnfbZsl882HoKXyFQ0xiEnMk5Jm/IfPGdcN+Fg+1TuGAzwSaMpJSF+g5fGTmqWX5+vBqpiz82r4F3Y5YTF/pvjnWEHa/+4xrh01Ys/0BhGGGif8SNinqHyMEueJbZfvutFaAf4KatYbe/jekIzGt/skW4yEgbB63S1xQ1DCtbEoGXkUFdaqIb8nEIewm9BMPErg2H/2K6Ge0LNopxPgPezJZFklzViO5p3SoTNkez2JAlJd9AjNc++RnTA==
Received: from DS7PR03CA0293.namprd03.prod.outlook.com (2603:10b6:5:3ad::28)
 by LV3PR12MB9119.namprd12.prod.outlook.com (2603:10b6:408:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:38:57 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3ad:cafe::9e) by DS7PR03CA0293.outlook.office365.com
 (2603:10b6:5:3ad::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:38:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:38:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:50 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:38:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 03/37] drm/nouveau: replace drm_device* with nouveau_drm*
 as dev drvdata
Date: Fri, 26 Jul 2024 14:37:54 +1000
Message-ID: <20240726043828.58966-4-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|LV3PR12MB9119:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa970d3-4e92-41e7-01ea-08dcad2cdca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LofXG5OfTo0ht8YlFV6XtFGdiwJ+RsKcjII7NNuYzq65UbvRghrIeTbnMQ7a?=
 =?us-ascii?Q?PAvaldI/vpJlMWSmTOMfbvEIkyPkkRGpiQxQ/Ur4IV2fJgK2h8Skq/5mc8fv?=
 =?us-ascii?Q?dv0vqbu6HJ7NHXnoAhn0+Zeh9Az6R7W7GEsGoiaP5rMtBorFjPShMo9S9+z8?=
 =?us-ascii?Q?dfrx9V9zvwPzEjqzUuS+OcXdJW9E1DgW/5Y6EDanYsdu2WMjZVJznwzs+pcJ?=
 =?us-ascii?Q?zYtCcZ39FR81mmbPXgdiJOiaMYEkAURL5bnWA7zdp0YKiHsZ184WlHiHX1RM?=
 =?us-ascii?Q?F91GJblboDt3/BfWyNmnKsqGi1EjuweUFaRwDXnD3BOhKO9y/UUCpz8Zi0ea?=
 =?us-ascii?Q?M2J2egDBAQlTKgvTasnyOefOLJQhgxgTPzOpz95hg/y7gE1MHl0mMIB2oo6I?=
 =?us-ascii?Q?62HpLnoyIL764QJenY8jInzcPkAQDgP9TpMtS7PdXZjhgHdAlf9ew5UGgH77?=
 =?us-ascii?Q?RNfjoUjVOQTlw7yUV0V6EvY+RBZLFKrBCD0l79cOJdE0omvwDsT/NRtdLMXk?=
 =?us-ascii?Q?iXjZarnrbmno1b43KFEZI512O+NkRSZ/KSyF5JWAxx7ab48G77Ye8zV2Rf9G?=
 =?us-ascii?Q?5OvSSX04XH+oXI5weYT0iuhpQUEXvq/ZHD/CZCw088k+FqZeI/kkI2hcz/G8?=
 =?us-ascii?Q?FMjMgWDNbGPVpcfOxJCgtzrM390ZxOCNeteMOo0jbro6uAavH7kBIhH/wjQ2?=
 =?us-ascii?Q?1TaQFgpraYdd+VxYEeoDu530zYD6+M11VvxuwUQIKKR2LabuUVpzro+SjW1w?=
 =?us-ascii?Q?8zeraE2uE1F8jI6Qb05aA64EzaPK+khr/9sTboEELR1pMV3Rkqbf6YGwMW3R?=
 =?us-ascii?Q?Wh5LVHLChSrY6YgtLgutrMHnfShye89tTFL9M7ewWGEnqqa8w4CMGQX7Kpaf?=
 =?us-ascii?Q?tACILwY26w4tOO8rdcHDZp2fL+SohtgIx9zAQ4Tu4knRgikeytFiSq5yNQ74?=
 =?us-ascii?Q?VuZjo1sobX8SZWfMXUe/QKUlSO5y1taJdXdo9fpRbUT73ROH56bQBEPyVVAE?=
 =?us-ascii?Q?JkNcZOrQy6WURJIx/zSQKcCR+2vn1nW+HPYpE5/WtVr3SWJCS+08wq/A4aR7?=
 =?us-ascii?Q?1FvtYs7YBBtNRKDQsawRY2AQf5VCnt167C3yCOIoEpl61l82o5rThHDQxZ09?=
 =?us-ascii?Q?qZpY6wHedftBkKMXsAd0J+J0PRmK+qpY/E2GlVdMXPfn9z8pwdGTPmxZWU6y?=
 =?us-ascii?Q?VXFhEyaUlhyNvYAf1TuHNSRCAg6QNm16gDi49nI9LAhHH/VKZoyMVxpqGN9I?=
 =?us-ascii?Q?5NSEK0TUhk9lTcE1LiIPFEiqSR5AxaU33AOzeOPEnDrw0Y44NB+SFOoyqYmL?=
 =?us-ascii?Q?ltQX8ch7DeyJU8VFVJM+scJORvniA5Mf15yS03YIpvaJ1rQr5ub5ODc+afYD?=
 =?us-ascii?Q?GhLXlAsPNQ2qxE/Cf61newVIJmaBTbmkRC/DyW7m0ot20nAyHNR6fow5DlHa?=
 =?us-ascii?Q?V77/CPuEFg1zQWDN00vkMwfCEAknIiFZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:38:56.9845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa970d3-4e92-41e7-01ea-08dcad2cdca0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9119
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

We almost always want to cast the pointer from dev_get_drvdata() to
'struct nouveau_drm *', so just directly store that pointer instead,
simplifying callers, and fixing some clumsy naming of dev/drm_dev
variables at the same time.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c    | 17 ++---
 drivers/gpu/drm/nouveau/nouveau_display.c  |  4 +-
 drivers/gpu/drm/nouveau/nouveau_display.h  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c      | 78 ++++++++++------------
 drivers/gpu/drm/nouveau/nouveau_drv.h      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_platform.c |  5 +-
 drivers/gpu/drm/nouveau/nouveau_vga.c      | 14 ++--
 7 files changed, 58 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 6d20d3c68fa7..58c986528ff6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -593,8 +593,7 @@ static int
 nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
 			     bool *enabled, unsigned char *buf, int max_bytes)
 {
-	struct drm_device *drm_dev = dev_get_drvdata(kdev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct nouveau_drm *drm = dev_get_drvdata(kdev);
 	struct drm_encoder *encoder;
 	struct nouveau_encoder *nv_encoder;
 	struct nouveau_crtc *nv_crtc;
@@ -639,18 +638,17 @@ static int
 nv50_audio_component_bind(struct device *kdev, struct device *hda_kdev,
 			  void *data)
 {
-	struct drm_device *drm_dev = dev_get_drvdata(kdev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct nouveau_drm *drm = dev_get_drvdata(kdev);
 	struct drm_audio_component *acomp = data;
 
 	if (WARN_ON(!device_link_add(hda_kdev, kdev, DL_FLAG_STATELESS)))
 		return -ENOMEM;
 
-	drm_modeset_lock_all(drm_dev);
+	drm_modeset_lock_all(drm->dev);
 	acomp->ops = &nv50_audio_component_ops;
 	acomp->dev = kdev;
 	drm->audio.component = acomp;
-	drm_modeset_unlock_all(drm_dev);
+	drm_modeset_unlock_all(drm->dev);
 	return 0;
 }
 
@@ -658,15 +656,14 @@ static void
 nv50_audio_component_unbind(struct device *kdev, struct device *hda_kdev,
 			    void *data)
 {
-	struct drm_device *drm_dev = dev_get_drvdata(kdev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
+	struct nouveau_drm *drm = dev_get_drvdata(kdev);
 	struct drm_audio_component *acomp = data;
 
-	drm_modeset_lock_all(drm_dev);
+	drm_modeset_lock_all(drm->dev);
 	drm->audio.component = NULL;
 	acomp->ops = NULL;
 	acomp->dev = NULL;
-	drm_modeset_unlock_all(drm_dev);
+	drm_modeset_unlock_all(drm->dev);
 }
 
 static const struct component_ops nv50_audio_component_bind_ops = {
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index aed5d5b51b43..fa30c97bcf90 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -446,10 +446,8 @@ static struct nouveau_drm_prop_enum_list dither_depth[] = {
 } while(0)
 
 void
-nouveau_display_hpd_resume(struct drm_device *dev)
+nouveau_display_hpd_resume(struct nouveau_drm *drm)
 {
-	struct nouveau_drm *drm = nouveau_drm(dev);
-
 	spin_lock_irq(&drm->hpd_lock);
 	drm->hpd_pending = ~0;
 	spin_unlock_irq(&drm->hpd_lock);
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h b/drivers/gpu/drm/nouveau/nouveau_display.h
index 2ab2ddb1eadf..1f506f8b289c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.h
+++ b/drivers/gpu/drm/nouveau/nouveau_display.h
@@ -45,7 +45,7 @@ nouveau_display(struct drm_device *dev)
 int  nouveau_display_create(struct drm_device *dev);
 void nouveau_display_destroy(struct drm_device *dev);
 int  nouveau_display_init(struct drm_device *dev, bool resume, bool runtime);
-void nouveau_display_hpd_resume(struct drm_device *dev);
+void nouveau_display_hpd_resume(struct nouveau_drm *);
 void nouveau_display_fini(struct drm_device *dev, bool suspend, bool runtime);
 int  nouveau_display_suspend(struct drm_device *dev, bool runtime);
 void nouveau_display_resume(struct drm_device *dev, bool runtime);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 9beff8737617..0687bc59d486 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -579,10 +579,10 @@ nouveau_parent = {
 };
 
 static void
-nouveau_drm_device_fini(struct drm_device *dev)
+nouveau_drm_device_fini(struct nouveau_drm *drm)
 {
+	struct drm_device *dev = drm->dev;
 	struct nouveau_cli *cli, *temp_cli;
-	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	if (nouveau_pmops_runtime()) {
 		pm_runtime_get_sync(dev->dev);
@@ -707,7 +707,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
 
 	ret = drm_dev_register(drm->dev, 0);
 	if (ret) {
-		nouveau_drm_device_fini(drm->dev);
+		nouveau_drm_device_fini(drm);
 		return ret;
 	}
 
@@ -758,7 +758,7 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 	}
 
 	drm->dev->dev_private = drm;
-	dev_set_drvdata(parent, drm->dev);
+	dev_set_drvdata(parent, drm);
 
 done:
 	if (ret) {
@@ -811,8 +811,7 @@ nouveau_drm_device_new(const struct drm_driver *drm_driver, struct device *paren
 
 static void quirk_broken_nv_runpm(struct pci_dev *pdev)
 {
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	struct pci_dev *bridge = pci_upstream_bridge(pdev);
 
 	if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
@@ -894,18 +893,17 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 }
 
 void
-nouveau_drm_device_remove(struct drm_device *dev)
+nouveau_drm_device_remove(struct nouveau_drm *drm)
 {
-	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_client *client;
 	struct nvkm_device *device;
 
-	drm_dev_unplug(dev);
+	drm_dev_unplug(drm->dev);
 
 	client = nvxx_client(&drm->client.base);
 	device = nvkm_device_find(client->device);
 
-	nouveau_drm_device_fini(dev);
+	nouveau_drm_device_fini(drm);
 	nouveau_drm_device_del(drm);
 	nvkm_device_del(&device);
 }
@@ -913,20 +911,19 @@ nouveau_drm_device_remove(struct drm_device *dev)
 static void
 nouveau_drm_remove(struct pci_dev *pdev)
 {
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 
 	/* revert our workaround */
 	if (drm->old_pm_cap)
 		pdev->pm_cap = drm->old_pm_cap;
-	nouveau_drm_device_remove(dev);
+	nouveau_drm_device_remove(drm);
 	pci_disable_device(pdev);
 }
 
 static int
-nouveau_do_suspend(struct drm_device *dev, bool runtime)
+nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
 {
-	struct nouveau_drm *drm = nouveau_drm(dev);
+	struct drm_device *dev = drm->dev;
 	struct ttm_resource_manager *man;
 	int ret;
 
@@ -987,10 +984,10 @@ nouveau_do_suspend(struct drm_device *dev, bool runtime)
 }
 
 static int
-nouveau_do_resume(struct drm_device *dev, bool runtime)
+nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
 {
+	struct drm_device *dev = drm->dev;
 	int ret = 0;
-	struct nouveau_drm *drm = nouveau_drm(dev);
 
 	NV_DEBUG(drm, "resuming object tree...\n");
 	ret = nvif_client_resume(&drm->master.base);
@@ -1020,14 +1017,14 @@ int
 nouveau_pmops_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	int ret;
 
-	if (drm_dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
-	    drm_dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return 0;
 
-	ret = nouveau_do_suspend(drm_dev, false);
+	ret = nouveau_do_suspend(drm, false);
 	if (ret)
 		return ret;
 
@@ -1042,11 +1039,11 @@ int
 nouveau_pmops_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	int ret;
 
-	if (drm_dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
-	    drm_dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
+	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
+	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
 		return 0;
 
 	pci_set_power_state(pdev, PCI_D0);
@@ -1056,10 +1053,10 @@ nouveau_pmops_resume(struct device *dev)
 		return ret;
 	pci_set_master(pdev);
 
-	ret = nouveau_do_resume(drm_dev, false);
+	ret = nouveau_do_resume(drm, false);
 
 	/* Monitors may have been connected / disconnected during suspend */
-	nouveau_display_hpd_resume(drm_dev);
+	nouveau_display_hpd_resume(drm);
 
 	return ret;
 }
@@ -1067,17 +1064,17 @@ nouveau_pmops_resume(struct device *dev)
 static int
 nouveau_pmops_freeze(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
-	return nouveau_do_suspend(drm_dev, false);
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+
+	return nouveau_do_suspend(drm, false);
 }
 
 static int
 nouveau_pmops_thaw(struct device *dev)
 {
-	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
-	return nouveau_do_resume(drm_dev, false);
+	struct nouveau_drm *drm = dev_get_drvdata(dev);
+
+	return nouveau_do_resume(drm, false);
 }
 
 bool
@@ -1092,7 +1089,7 @@ static int
 nouveau_pmops_runtime_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	int ret;
 
 	if (!nouveau_pmops_runtime()) {
@@ -1101,12 +1098,12 @@ nouveau_pmops_runtime_suspend(struct device *dev)
 	}
 
 	nouveau_switcheroo_optimus_dsm();
-	ret = nouveau_do_suspend(drm_dev, true);
+	ret = nouveau_do_suspend(drm, true);
 	pci_save_state(pdev);
 	pci_disable_device(pdev);
 	pci_ignore_hotplug(pdev);
 	pci_set_power_state(pdev, PCI_D3cold);
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
+	drm->dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
 	return ret;
 }
 
@@ -1114,9 +1111,8 @@ static int
 nouveau_pmops_runtime_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct drm_device *drm_dev = pci_get_drvdata(pdev);
-	struct nouveau_drm *drm = nouveau_drm(drm_dev);
-	struct nvif_device *device = &nouveau_drm(drm_dev)->client.device;
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct nvif_device *device = &drm->client.device;
 	int ret;
 
 	if (!nouveau_pmops_runtime()) {
@@ -1131,7 +1127,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
 		return ret;
 	pci_set_master(pdev);
 
-	ret = nouveau_do_resume(drm_dev, true);
+	ret = nouveau_do_resume(drm, true);
 	if (ret) {
 		NV_ERROR(drm, "resume failed with: %d\n", ret);
 		return ret;
@@ -1139,10 +1135,10 @@ nouveau_pmops_runtime_resume(struct device *dev)
 
 	/* do magic */
 	nvif_mask(&device->object, 0x088488, (1 << 25), (1 << 25));
-	drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
+	drm->dev->switch_power_state = DRM_SWITCH_POWER_ON;
 
 	/* Monitors may have been connected / disconnected during suspend */
-	nouveau_display_hpd_resume(drm_dev);
+	nouveau_display_hpd_resume(drm);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index e239c6bf4afa..7e624c587fc0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -325,7 +325,7 @@ bool nouveau_pmops_runtime(void);
 struct drm_device *
 nouveau_platform_device_create(const struct nvkm_device_tegra_func *,
 			       struct platform_device *, struct nvkm_device **);
-void nouveau_drm_device_remove(struct drm_device *dev);
+void nouveau_drm_device_remove(struct nouveau_drm *);
 
 #define NV_PRINTK(l,c,f,a...) do {                                             \
 	struct nouveau_cli *_cli = (c);                                        \
diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c b/drivers/gpu/drm/nouveau/nouveau_platform.c
index d0a63f0f54a2..3194b110eff8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_platform.c
+++ b/drivers/gpu/drm/nouveau/nouveau_platform.c
@@ -39,8 +39,9 @@ static int nouveau_platform_probe(struct platform_device *pdev)
 
 static void nouveau_platform_remove(struct platform_device *pdev)
 {
-	struct drm_device *dev = platform_get_drvdata(pdev);
-	nouveau_drm_device_remove(dev);
+	struct nouveau_drm *drm = platform_get_drvdata(pdev);
+
+	nouveau_drm_device_remove(drm);
 }
 
 #if IS_ENABLED(CONFIG_OF)
diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c b/drivers/gpu/drm/nouveau/nouveau_vga.c
index f8bf0ec26844..2525e08938b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_vga.c
+++ b/drivers/gpu/drm/nouveau/nouveau_vga.c
@@ -11,7 +11,7 @@
 static unsigned int
 nouveau_vga_set_decode(struct pci_dev *pdev, bool state)
 {
-	struct nouveau_drm *drm = nouveau_drm(pci_get_drvdata(pdev));
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 	struct nvif_object *device = &drm->client.device.object;
 
 	if (drm->client.device.info.family == NV_DEVICE_INFO_V0_CURIE &&
@@ -34,7 +34,8 @@ static void
 nouveau_switcheroo_set_state(struct pci_dev *pdev,
 			     enum vga_switcheroo_state state)
 {
-	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+	struct drm_device *dev = drm->dev;
 
 	if ((nouveau_is_optimus() || nouveau_is_v1_dsm()) && state == VGA_SWITCHEROO_OFF)
 		return;
@@ -56,21 +57,22 @@ nouveau_switcheroo_set_state(struct pci_dev *pdev,
 static void
 nouveau_switcheroo_reprobe(struct pci_dev *pdev)
 {
-	struct drm_device *dev = pci_get_drvdata(pdev);
-	drm_fb_helper_output_poll_changed(dev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
+
+	drm_fb_helper_output_poll_changed(drm->dev);
 }
 
 static bool
 nouveau_switcheroo_can_switch(struct pci_dev *pdev)
 {
-	struct drm_device *dev = pci_get_drvdata(pdev);
+	struct nouveau_drm *drm = pci_get_drvdata(pdev);
 
 	/*
 	 * FIXME: open_count is protected by drm_global_mutex but that would lead to
 	 * locking inversion with the driver load path. And the access here is
 	 * completely racy anyway. So don't bother with locking for now.
 	 */
-	return atomic_read(&dev->open_count) == 0;
+	return atomic_read(&drm->dev->open_count) == 0;
 }
 
 static const struct vga_switcheroo_client_ops
-- 
2.45.1

