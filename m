Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06AF92AD47
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709BF10E30E;
	Tue,  9 Jul 2024 00:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dk4gIBSB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2041.outbound.protection.outlook.com [40.107.95.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E26310E21F
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n33ny3oKkwj85pmqoOJiNLiI4JaIeWIrHh1rKqxHlSosUJaXJJjq0PaQeiZGvxubJ+UQEIa8K2sUA5LQw+XZZvjCIscQ407lhqTaXCzo+rq05d24x/PYLK0B4zdWv995AT+hVHaTXsy+s0jcEJdutH0YIYhcGGrObc1wod8Y4WFgIwu7Vsub2etML6NVxKRlSSc5TFLLp9Mvu3bUR6LhW+FD5Jon2wXW08RwotnmBAFkwfa/x4DEysy+K6PoETIjJm3Ht1pBBeFooQph+oELDzItLlJxhX78S3urO8biEuDc+SFlj1P7a4gXFBAwAILNEDumHgUU3MSUu2awMbh9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RivuI3o3b+nPMEGY69fA2chu7s82NxJwUxqt2P88kY4=;
 b=RDWzk4ApJRbx2B+YaIlLtJIoDJq4ZHw63KUp2npMqVIvZILJwc5ROCczG51X6BjrvM1uXF2NNZYsYRR4Vbtcm0dwD//9C1eM5Fv9ly2NDIX7GNsj/gFLatVSCrzJtVEP/kR7CT91FuOPirOQnAlJUWqeNTR4uD3cCGPiII8HILCkoAZFBR0+3v6n8nvKCMMigbUfxxaw4/DTAV0QlkEajbSJmNVmo8pV6cfpdyTxp6iSwqH2LREJVDhqsyLR6sEBi06h58CMBeA0XMMNMAYCLCuNY0rP06O4+ZrL90Y9rjhXhy3pe9mGr2xDsMe5866M88qzRLdqxQGUPuUT9P0adA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RivuI3o3b+nPMEGY69fA2chu7s82NxJwUxqt2P88kY4=;
 b=Dk4gIBSB562z26pCo1vDtkCqbU2jcZrZvapOZXJ8sSNd9D0GGVKendLSEe7BwsZO+7xmNjGuqKGQ8zgRpOk3FvgMOh81ZFNIIiwZElXh9NwpHTIpf0xTndl3c5aq2CZJU8JNBwIVRX2ta15IYzCPOVeVrghGEaDMsi7YWJvQ6BP+BiCyS78bzbGSSbOX8Vb33/6jFuzgY9J6/njNYoYuwm8P5cSw/AmNUsTAgZbji8fhjfvapEG3TzQM4EmwAv614iTCay4wFKffq9ntoZRfT4rHWfN+d6jiRrsCpn8xZv/q4i+25EYo0lgfmPQWHJJZem+xB13a/jobzXeQHvr2qw==
Received: from BN9PR03CA0366.namprd03.prod.outlook.com (2603:10b6:408:f7::11)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:00 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::2f) by BN9PR03CA0366.outlook.office365.com
 (2603:10b6:408:f7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:54:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:52 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:54:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 03/37] drm/nouveau: replace drm_device* with nouveau_drm*
 as dev drvdata
Date: Fri, 5 Jul 2024 04:36:47 +1000
Message-ID: <20240704183721.25778-4-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: 858204a7-9344-4bf6-2717-08dc9fb1c263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rpJ9y6u9Iy1WcZerKDCF7gAqDu/SVy+6g8N/hYXiDe82UaeZs2SGIqfIyTOm?=
 =?us-ascii?Q?3TafGXel8uadc4RAXsLV+skAMhoSq6dGFgl5kSXZgl9k5KenBmE5hjEmw86v?=
 =?us-ascii?Q?trdVcoRYyL+qC7ryxPUp1IUqFF3t0qZQusr0rJl3GcKSlz5VYOKXGfc8t9VX?=
 =?us-ascii?Q?u0cBXOli97q7i0YA2vKGkndzTv1/emoa9N6dzpJW/2OdAs+KEgXTseHIv5Ia?=
 =?us-ascii?Q?2d8YDlW50YRNVNlriF5SJIWMZItrAhZ7G7E3iL6Bj31ysu316jNIIRzgOuOs?=
 =?us-ascii?Q?SsURz4Uo+Hif6rFNB7UM86sc+QLEnJXBbKzcMT6dUInKSixVkQVAq98w68Hg?=
 =?us-ascii?Q?PEdJPIHErtQIroMG/E2ll/bepZmAV+NXJWm0l+rLbunSRGAjTwqsARBOGDRU?=
 =?us-ascii?Q?noQ6h5d9HLR4eFxXuUfBOQDya5QDbTKn2Q+TINtc5x4Oq5X8jhOdmZeDoxug?=
 =?us-ascii?Q?NEVXqaASGRSb7qHebfUIA5d1Wjk8lYjx6hUJwaxm1eUXVUzKMQfIy6ZQ+T40?=
 =?us-ascii?Q?bRal61OKbq7pmp4xYJG1hTrBiJMPQ6NdTTH7glCorPY59W2TCqCqMJopgbna?=
 =?us-ascii?Q?OkDnuJD5hsbrtAdsyyj8iOcc65n0wWRpaQ+dzqCglHgbN/DnnM+lVf1xrM4E?=
 =?us-ascii?Q?gJRLrj/9PQRlCPdmZDLU1/2tdN3/qBsjl2Z/qt3Hx/U8369G5fwIlt1BJNHX?=
 =?us-ascii?Q?aIXykLl+gO/vY31u0xr4+lTFwQWMqaosG/wmSWxiVR+f7qus/ncWL/Bl6UuN?=
 =?us-ascii?Q?6RUmgjKZrvRCVJn0ZhtWdIkASQ/nn+57y648sRS8hZFI3RyvG8JQXM80zZb6?=
 =?us-ascii?Q?HirFam1D73b/+dKLLAfGXo7o/fcUntJWmdcYLVaZ41+kcONbS8AbsqP5/clL?=
 =?us-ascii?Q?05XfzvhAci3zbl+Gw1VzaDyhimYc0DuFMt7Rpw1PYvvu9/UPJBqU4IIQMiEU?=
 =?us-ascii?Q?YfxsY3o+om41w0LlfgRrS6VbnG47VD4DVX/q+gG1mYzLBGc5vs/R4kC3F9AG?=
 =?us-ascii?Q?RWlElBW/Ez9/QhnoPy21WJ49Keh/Led9WOFi6mjJnNwZxJcQJaZF7lofj0CV?=
 =?us-ascii?Q?UgYsHOyf67TaJcAuGQqFYaQDLKIAwscsydNa8+RXBHiA+u5JMg2oJv9sAkIy?=
 =?us-ascii?Q?VRye3SsqHav+NvgQ6mCsXVP+Cbs3/Ea1sGtEi9jL6XGCD61qRHLziNUNk+GX?=
 =?us-ascii?Q?ROtVJIRgm0+d7Rbw6dFpQW7mef1WU4MascN4uACIn7KoI5bF8gi3u2DmIz12?=
 =?us-ascii?Q?hQLmgCixH8L2B8bOUjfErD5/QJaIYDcMwxB9afTL1nRqNmbHf3qGR+MktZVK?=
 =?us-ascii?Q?gQPHBzSm4bCWEhIdCnNyh70+wMAAYQTQipXRzJ2k0ShTgscIq4/YZRDzpbq4?=
 =?us-ascii?Q?omo0x+6Fs1N8UmHhv2GeBj2mK8gzEvRc+LQC/tc8AJyquunESqTmXZr/HNiW?=
 =?us-ascii?Q?Dr21kNfZbqAUV6zpqEv6Fuinj1jRleoH?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:54:59.7042 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 858204a7-9344-4bf6-2717-08dc9fb1c263
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
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
index ac9657d7e92d..6750f66bb1ff 100644
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

