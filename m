Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC549897BF
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318E810E364;
	Sun, 29 Sep 2024 21:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oFskpzNB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDD010E307
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 10:14:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFZtItnfqiYy7ygoP3OtIj6s4IiRK467yjOJxxQptPIbWAyEFAwhd1eafyoav3JfWIYFn66buvGJ/dToNetTiZ/ITtZF8u4Sz7nDf/yvNEu8CaoHVkXM0c4dy88QrjHtX0o6TLEXpSi7uaSpHgkc3Zxwk4mOx/9Q63qQW7IBFoSN3FPqlh/RZorqZRF823uwGjFgqzjOo3f7clrCV0v/Ns7jLV2VOD14TLBHHg0b46Q70o8ag8/6RKCHEHk3dJ1X9McvQCIX8eb/Otb3GE+fAF2SLbh9EklgQ/KJw0mN58JEZMTd+f9UmoBYXSSDTz/WwNaS9diQUINQ2U/BkGR/7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXgcYST5nLB8YeSqfXyeyNKpjIH3dr0QZPLOj5zAH0Y=;
 b=JgyuzmA22cskIZJ6F25mqAJIQJ2QtnQEnTopYnx4VRfP7vt4KxwAHOAiAiJFXSpXhMlDbt8nC6nJD4qNO/llgsJTNOL+v2ceLrM4UrfmIJfjuIpKK9gpwHsbTMA3ykDad2rSoP1nTys3grkfxgUCJ9GPyDkzP/rKmv8o9R9VRRltyn6rAp9qgfZmghZ88xsqre+HcJGTLpZ5MmirJsdoA5veDctiLe6SuKth8byf+wRduAyKucvHqgutmTjv7IjD5sjYtGKEQ1w2kIwIluauSXXY8XQEgCS6S6OToJyW5D38YEvQXnnH4uzJWbEHwU6Inc4wEEHVLigxMbagO4SuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXgcYST5nLB8YeSqfXyeyNKpjIH3dr0QZPLOj5zAH0Y=;
 b=oFskpzNBac12WiGn5TTJ49vxskfxCH302hpyBAjXjTIEnNBRmEawU85U9mThq1Ngx0qlLNqfcYhiLwx0I6UqDN4EXjPoD/qGX0Xyqhd1VtUWzxaFF+pNzmEMo01eEhKE02PnvvpGUgYmDELI88M5TMtD4qeS9xGOCMAs6S4qnveFgVe2bPerTod3IIMyIchSKq9sKQ3saR8Q0Y5WW6ehE2DBuuvVPlAtI4Tuh+UNusJPTzyscFmz578lf9CPlvMOT5lmKaxGUmlM45ckoml01LjEWwDDsVIunneaeWRH3l08eqneo+gW6SoEr2I1jN9zFguaaX5tYYrhc0L4hq92Gw==
Received: from DS7P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::11) by
 DS7PR12MB5719.namprd12.prod.outlook.com (2603:10b6:8:72::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.20; Wed, 31 Jul 2024 10:14:11 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::f0) by DS7P222CA0009.outlook.office365.com
 (2603:10b6:8:2e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Wed, 31 Jul 2024 10:14:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 10:14:11 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:13:58 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 03:13:57 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 03:13:56 -0700
Date: Wed, 31 Jul 2024 13:13:56 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 03/37] drm/nouveau: replace drm_device* with
 nouveau_drm* as dev drvdata
Message-ID: <20240731131356.00005f49.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-4-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-4-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DS7PR12MB5719:EE_
X-MS-Office365-Filtering-Correlation-Id: 72bff628-ad20-4b60-a852-08dcb1498599
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F6H7NXN0+d7n2FYi/toDs9T1E49kC7DQ9bMh39L5Y0pxEBtSbAzYauR2LjAw?=
 =?us-ascii?Q?WutmRO8UKf159ElEhW/SdpK4Plt08fp4hqyPRSOdZlwDIOpPBNcFwbc36h+x?=
 =?us-ascii?Q?OFo/8zMz1M/peIADQUi/AvoWbOHY8yFLGs+DNbXTY0GbksQTquNfVP+tzviL?=
 =?us-ascii?Q?zh7n2D7sMdDovCmEAKf2Pm/YkdoxSIiM/tbfXA7cNtRVD2c62xtZV/a1fny5?=
 =?us-ascii?Q?GpJUTn2nk/SJUazaEj2y9STQpXrR7fkBdKPsLOCGPJ8oKWH3/HE/N92pFI3S?=
 =?us-ascii?Q?vsAY7FZ1myJ/iGERpRdrIx2c5VdxYw3vlyTP3UkKOCAvGM2i64MrcmTyoYut?=
 =?us-ascii?Q?ClQcFaIqBJ5Z95upkhi6VLdUAMS12mN7UDGPtkzMVmoPJnDvrxeST5l5T6Xm?=
 =?us-ascii?Q?lA+7kA43lCz6EGdXuGExY/Tfbs1q1zDEwi+gItzmoaUvYFL8tXOxtq4FCFsI?=
 =?us-ascii?Q?3cvP+NVha9vE6KDJNe+WCoQA2fyCXQOkMu/eWuoRMtKzbr0zVMHQAvnbyN0K?=
 =?us-ascii?Q?OQ/vhnTRdMxcGCELr58aqMqiMtCtXszVu4kwB76oDZ4JVTei2H+CVVCTrgrh?=
 =?us-ascii?Q?jU16vjzQWT1NraQvZY8OTaVOvTRSD+YSudOsIfqbzswXnRgefhkCxufxaGO6?=
 =?us-ascii?Q?B23RDOBBdbU7/1K1o6onOwT/xcQeNUty/dm/4/mQjILmYeCDUYf5XhApZIzq?=
 =?us-ascii?Q?U1iS9NAGjwa/2F97WOb8rh4kmJVK4iA+P5/CoJ8rTPDmu7k0xxfVLiVrI4To?=
 =?us-ascii?Q?ixsM7hqtRE+sOj6bkQdPULeSap1L/v1XKYRSD9iKDZ/uy4xnQMGFGlsLCDyO?=
 =?us-ascii?Q?4sjt9u5sPJ5BAUNBLvCLBz/KvAIcBYxSb+KjlYhH1I0eLZ0TJcOONzPz5j+A?=
 =?us-ascii?Q?v+Z7Dho/0eYEX2PGqqFkuFsRzQyGdaJg3NdMrTe10kPMWlCBJCKgWJiHgRGf?=
 =?us-ascii?Q?12TJScx7G10YQ3UQyxWQ1Nt2Un9iEL9yWKOIL/3rbrxIAPaERNjWvC7wfMP9?=
 =?us-ascii?Q?MN8PXzAd9thZTZFsEIyTd/O2EMJomDBPq7MbNhIXRgykK+eYSj/JwMU2ViyL?=
 =?us-ascii?Q?SVN5AGhFNBDqYkkcX0AjoxmGfjfqTHkGW1QEO1NKSj89tj0I0wQsgwRCxr0v?=
 =?us-ascii?Q?3ALy0ffGP2xgxCGXl8qwCGqVsterxJ5HnKVnNKjH+INePyoVphFcG2f1jUH/?=
 =?us-ascii?Q?cXu3x+IRG2LnlIo36/GMOdzF8b620K7PTdv+xMfgg2ld63+qfg0z2bOI48Em?=
 =?us-ascii?Q?DNdRQb/5ZB2oPhlJwDuNVihY67gGmXO19jp6GmLkBq5/TMOyl2g/cPWekR+b?=
 =?us-ascii?Q?gfM9ehOO4b62POSiGZJXACNkCnvVTAy9mTe+vM7n7SD2dT50bVFcthHqJ16a?=
 =?us-ascii?Q?yIdn87YMZZF2pRtIGVsLGoDui0KQb0uam2xJCf9/YeksMWwjPTlnC3Ta2aTL?=
 =?us-ascii?Q?6tlnxzeEVrMjWXFxYj0Zn5g2DmSoqd7u?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:14:11.0999 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bff628-ad20-4b60-a852-08dcb1498599
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5719
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:50 +0000
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

On Fri, 26 Jul 2024 14:37:54 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> We almost always want to cast the pointer from dev_get_drvdata() to
> 'struct nouveau_drm *', so just directly store that pointer instead,
> simplifying callers, and fixing some clumsy naming of dev/drm_dev
> variables at the same time.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c    | 17 ++---
>  drivers/gpu/drm/nouveau/nouveau_display.c  |  4 +-
>  drivers/gpu/drm/nouveau/nouveau_display.h  |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c      | 78
> ++++++++++------------ drivers/gpu/drm/nouveau/nouveau_drv.h      |
> 2 +- drivers/gpu/drm/nouveau/nouveau_platform.c |  5 +-
>  drivers/gpu/drm/nouveau/nouveau_vga.c      | 14 ++--
>  7 files changed, 58 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c index
> 6d20d3c68fa7..58c986528ff6 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/disp.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c @@ -593,8 +593,7 @@ static
> int nv50_audio_component_get_eld(struct device *kdev, int port, int
> dev_id, bool *enabled, unsigned char *buf, int max_bytes)
>  {
> -	struct drm_device *drm_dev = dev_get_drvdata(kdev);
> -	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +	struct nouveau_drm *drm = dev_get_drvdata(kdev);
>  	struct drm_encoder *encoder;
>  	struct nouveau_encoder *nv_encoder;
>  	struct nouveau_crtc *nv_crtc;
> @@ -639,18 +638,17 @@ static int
>  nv50_audio_component_bind(struct device *kdev, struct device
> *hda_kdev, void *data)
>  {
> -	struct drm_device *drm_dev = dev_get_drvdata(kdev);
> -	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +	struct nouveau_drm *drm = dev_get_drvdata(kdev);
>  	struct drm_audio_component *acomp = data;
>  
>  	if (WARN_ON(!device_link_add(hda_kdev, kdev,
> DL_FLAG_STATELESS))) return -ENOMEM;
>  
> -	drm_modeset_lock_all(drm_dev);
> +	drm_modeset_lock_all(drm->dev);
>  	acomp->ops = &nv50_audio_component_ops;
>  	acomp->dev = kdev;
>  	drm->audio.component = acomp;
> -	drm_modeset_unlock_all(drm_dev);
> +	drm_modeset_unlock_all(drm->dev);
>  	return 0;
>  }
>  
> @@ -658,15 +656,14 @@ static void
>  nv50_audio_component_unbind(struct device *kdev, struct device
> *hda_kdev, void *data)
>  {
> -	struct drm_device *drm_dev = dev_get_drvdata(kdev);
> -	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +	struct nouveau_drm *drm = dev_get_drvdata(kdev);
>  	struct drm_audio_component *acomp = data;
>  
> -	drm_modeset_lock_all(drm_dev);
> +	drm_modeset_lock_all(drm->dev);
>  	drm->audio.component = NULL;
>  	acomp->ops = NULL;
>  	acomp->dev = NULL;
> -	drm_modeset_unlock_all(drm_dev);
> +	drm_modeset_unlock_all(drm->dev);
>  }
>  
>  static const struct component_ops nv50_audio_component_bind_ops = {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
> b/drivers/gpu/drm/nouveau/nouveau_display.c index
> aed5d5b51b43..fa30c97bcf90 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_display.c +++
> b/drivers/gpu/drm/nouveau/nouveau_display.c @@ -446,10 +446,8 @@
> static struct nouveau_drm_prop_enum_list dither_depth[] = { } while(0)
>  
>  void
> -nouveau_display_hpd_resume(struct drm_device *dev)
> +nouveau_display_hpd_resume(struct nouveau_drm *drm)
>  {
> -	struct nouveau_drm *drm = nouveau_drm(dev);
> -
>  	spin_lock_irq(&drm->hpd_lock);
>  	drm->hpd_pending = ~0;
>  	spin_unlock_irq(&drm->hpd_lock);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.h
> b/drivers/gpu/drm/nouveau/nouveau_display.h index
> 2ab2ddb1eadf..1f506f8b289c 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_display.h +++
> b/drivers/gpu/drm/nouveau/nouveau_display.h @@ -45,7 +45,7 @@
> nouveau_display(struct drm_device *dev) int
> nouveau_display_create(struct drm_device *dev); void
> nouveau_display_destroy(struct drm_device *dev); int
> nouveau_display_init(struct drm_device *dev, bool resume, bool
> runtime); -void nouveau_display_hpd_resume(struct drm_device *dev);
> +void nouveau_display_hpd_resume(struct nouveau_drm *); void
> nouveau_display_fini(struct drm_device *dev, bool suspend, bool
> runtime); int  nouveau_display_suspend(struct drm_device *dev, bool
> runtime); void nouveau_display_resume(struct drm_device *dev, bool
> runtime); diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 9beff8737617..0687bc59d486 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -579,10 +579,10 @@
> nouveau_parent = { }; 
>  static void
> -nouveau_drm_device_fini(struct drm_device *dev)
> +nouveau_drm_device_fini(struct nouveau_drm *drm)
>  {
> +	struct drm_device *dev = drm->dev;
>  	struct nouveau_cli *cli, *temp_cli;
> -	struct nouveau_drm *drm = nouveau_drm(dev);
>  
>  	if (nouveau_pmops_runtime()) {
>  		pm_runtime_get_sync(dev->dev);
> @@ -707,7 +707,7 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  
>  	ret = drm_dev_register(drm->dev, 0);
>  	if (ret) {
> -		nouveau_drm_device_fini(drm->dev);
> +		nouveau_drm_device_fini(drm);
>  		return ret;
>  	}
>  
> @@ -758,7 +758,7 @@ nouveau_drm_device_new(const struct drm_driver
> *drm_driver, struct device *paren }
>  
>  	drm->dev->dev_private = drm;
> -	dev_set_drvdata(parent, drm->dev);
> +	dev_set_drvdata(parent, drm);
>  
>  done:
>  	if (ret) {
> @@ -811,8 +811,7 @@ nouveau_drm_device_new(const struct drm_driver
> *drm_driver, struct device *paren 
>  static void quirk_broken_nv_runpm(struct pci_dev *pdev)
>  {
> -	struct drm_device *dev = pci_get_drvdata(pdev);
> -	struct nouveau_drm *drm = nouveau_drm(dev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  	struct pci_dev *bridge = pci_upstream_bridge(pdev);
>  
>  	if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
> @@ -894,18 +893,17 @@ static int nouveau_drm_probe(struct pci_dev
> *pdev, }
>  
>  void
> -nouveau_drm_device_remove(struct drm_device *dev)
> +nouveau_drm_device_remove(struct nouveau_drm *drm)
>  {
> -	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nvkm_client *client;
>  	struct nvkm_device *device;
>  
> -	drm_dev_unplug(dev);
> +	drm_dev_unplug(drm->dev);
>  
>  	client = nvxx_client(&drm->client.base);
>  	device = nvkm_device_find(client->device);
>  
> -	nouveau_drm_device_fini(dev);
> +	nouveau_drm_device_fini(drm);
>  	nouveau_drm_device_del(drm);
>  	nvkm_device_del(&device);
>  }
> @@ -913,20 +911,19 @@ nouveau_drm_device_remove(struct drm_device
> *dev) static void
>  nouveau_drm_remove(struct pci_dev *pdev)
>  {
> -	struct drm_device *dev = pci_get_drvdata(pdev);
> -	struct nouveau_drm *drm = nouveau_drm(dev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  
>  	/* revert our workaround */
>  	if (drm->old_pm_cap)
>  		pdev->pm_cap = drm->old_pm_cap;
> -	nouveau_drm_device_remove(dev);
> +	nouveau_drm_device_remove(drm);
>  	pci_disable_device(pdev);
>  }
>  
>  static int
> -nouveau_do_suspend(struct drm_device *dev, bool runtime)
> +nouveau_do_suspend(struct nouveau_drm *drm, bool runtime)
>  {
> -	struct nouveau_drm *drm = nouveau_drm(dev);
> +	struct drm_device *dev = drm->dev;
>  	struct ttm_resource_manager *man;
>  	int ret;
>  
> @@ -987,10 +984,10 @@ nouveau_do_suspend(struct drm_device *dev, bool
> runtime) }
>  
>  static int
> -nouveau_do_resume(struct drm_device *dev, bool runtime)
> +nouveau_do_resume(struct nouveau_drm *drm, bool runtime)
>  {
> +	struct drm_device *dev = drm->dev;
>  	int ret = 0;
> -	struct nouveau_drm *drm = nouveau_drm(dev);
>  
>  	NV_DEBUG(drm, "resuming object tree...\n");
>  	ret = nvif_client_resume(&drm->master.base);
> @@ -1020,14 +1017,14 @@ int
>  nouveau_pmops_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  	int ret;
>  
> -	if (drm_dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> -	    drm_dev->switch_power_state ==
> DRM_SWITCH_POWER_DYNAMIC_OFF)
> +	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> +	    drm->dev->switch_power_state ==
> DRM_SWITCH_POWER_DYNAMIC_OFF) return 0;
>  
> -	ret = nouveau_do_suspend(drm_dev, false);
> +	ret = nouveau_do_suspend(drm, false);
>  	if (ret)
>  		return ret;
>  
> @@ -1042,11 +1039,11 @@ int
>  nouveau_pmops_resume(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  	int ret;
>  
> -	if (drm_dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> -	    drm_dev->switch_power_state ==
> DRM_SWITCH_POWER_DYNAMIC_OFF)
> +	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> +	    drm->dev->switch_power_state ==
> DRM_SWITCH_POWER_DYNAMIC_OFF) return 0;
>  
>  	pci_set_power_state(pdev, PCI_D0);
> @@ -1056,10 +1053,10 @@ nouveau_pmops_resume(struct device *dev)
>  		return ret;
>  	pci_set_master(pdev);
>  
> -	ret = nouveau_do_resume(drm_dev, false);
> +	ret = nouveau_do_resume(drm, false);
>  
>  	/* Monitors may have been connected / disconnected during
> suspend */
> -	nouveau_display_hpd_resume(drm_dev);
> +	nouveau_display_hpd_resume(drm);
>  
>  	return ret;
>  }
> @@ -1067,17 +1064,17 @@ nouveau_pmops_resume(struct device *dev)
>  static int
>  nouveau_pmops_freeze(struct device *dev)
>  {
> -	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> -	return nouveau_do_suspend(drm_dev, false);
> +	struct nouveau_drm *drm = dev_get_drvdata(dev);
> +
> +	return nouveau_do_suspend(drm, false);
>  }
>  
>  static int
>  nouveau_pmops_thaw(struct device *dev)
>  {
> -	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> -	return nouveau_do_resume(drm_dev, false);
> +	struct nouveau_drm *drm = dev_get_drvdata(dev);
> +
> +	return nouveau_do_resume(drm, false);
>  }
>  
>  bool
> @@ -1092,7 +1089,7 @@ static int
>  nouveau_pmops_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  	int ret;
>  
>  	if (!nouveau_pmops_runtime()) {
> @@ -1101,12 +1098,12 @@ nouveau_pmops_runtime_suspend(struct device
> *dev) }
>  
>  	nouveau_switcheroo_optimus_dsm();
> -	ret = nouveau_do_suspend(drm_dev, true);
> +	ret = nouveau_do_suspend(drm, true);
>  	pci_save_state(pdev);
>  	pci_disable_device(pdev);
>  	pci_ignore_hotplug(pdev);
>  	pci_set_power_state(pdev, PCI_D3cold);
> -	drm_dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
> +	drm->dev->switch_power_state = DRM_SWITCH_POWER_DYNAMIC_OFF;
>  	return ret;
>  }
>  
> @@ -1114,9 +1111,8 @@ static int
>  nouveau_pmops_runtime_resume(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
> -	struct drm_device *drm_dev = pci_get_drvdata(pdev);
> -	struct nouveau_drm *drm = nouveau_drm(drm_dev);
> -	struct nvif_device *device =
> &nouveau_drm(drm_dev)->client.device;
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +	struct nvif_device *device = &drm->client.device;
>  	int ret;
>  
>  	if (!nouveau_pmops_runtime()) {
> @@ -1131,7 +1127,7 @@ nouveau_pmops_runtime_resume(struct device *dev)
>  		return ret;
>  	pci_set_master(pdev);
>  
> -	ret = nouveau_do_resume(drm_dev, true);
> +	ret = nouveau_do_resume(drm, true);
>  	if (ret) {
>  		NV_ERROR(drm, "resume failed with: %d\n", ret);
>  		return ret;
> @@ -1139,10 +1135,10 @@ nouveau_pmops_runtime_resume(struct device
> *dev) 
>  	/* do magic */
>  	nvif_mask(&device->object, 0x088488, (1 << 25), (1 << 25));
> -	drm_dev->switch_power_state = DRM_SWITCH_POWER_ON;
> +	drm->dev->switch_power_state = DRM_SWITCH_POWER_ON;
>  
>  	/* Monitors may have been connected / disconnected during
> suspend */
> -	nouveau_display_hpd_resume(drm_dev);
> +	nouveau_display_hpd_resume(drm);
>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h index
> e239c6bf4afa..7e624c587fc0 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drv.h +++
> b/drivers/gpu/drm/nouveau/nouveau_drv.h @@ -325,7 +325,7 @@ bool
> nouveau_pmops_runtime(void); struct drm_device *
>  nouveau_platform_device_create(const struct nvkm_device_tegra_func *,
>  			       struct platform_device *, struct
> nvkm_device **); -void nouveau_drm_device_remove(struct drm_device
> *dev); +void nouveau_drm_device_remove(struct nouveau_drm *);
>  
>  #define NV_PRINTK(l,c,f,a...) do {
>           \ struct nouveau_cli *_cli = (c);
>              \ diff --git
> a/drivers/gpu/drm/nouveau/nouveau_platform.c
> b/drivers/gpu/drm/nouveau/nouveau_platform.c index
> d0a63f0f54a2..3194b110eff8 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_platform.c +++
> b/drivers/gpu/drm/nouveau/nouveau_platform.c @@ -39,8 +39,9 @@ static
> int nouveau_platform_probe(struct platform_device *pdev) static void
> nouveau_platform_remove(struct platform_device *pdev) {
> -	struct drm_device *dev = platform_get_drvdata(pdev);
> -	nouveau_drm_device_remove(dev);
> +	struct nouveau_drm *drm = platform_get_drvdata(pdev);
> +
> +	nouveau_drm_device_remove(drm);
>  }
>  
>  #if IS_ENABLED(CONFIG_OF)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_vga.c
> b/drivers/gpu/drm/nouveau/nouveau_vga.c index
> f8bf0ec26844..2525e08938b3 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_vga.c +++
> b/drivers/gpu/drm/nouveau/nouveau_vga.c @@ -11,7 +11,7 @@
>  static unsigned int
>  nouveau_vga_set_decode(struct pci_dev *pdev, bool state)
>  {
> -	struct nouveau_drm *drm = nouveau_drm(pci_get_drvdata(pdev));
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  	struct nvif_object *device = &drm->client.device.object;
>  
>  	if (drm->client.device.info.family ==
> NV_DEVICE_INFO_V0_CURIE && @@ -34,7 +34,8 @@ static void
>  nouveau_switcheroo_set_state(struct pci_dev *pdev,
>  			     enum vga_switcheroo_state state)
>  {
> -	struct drm_device *dev = pci_get_drvdata(pdev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +	struct drm_device *dev = drm->dev;
>  
>  	if ((nouveau_is_optimus() || nouveau_is_v1_dsm()) && state
> == VGA_SWITCHEROO_OFF) return;
> @@ -56,21 +57,22 @@ nouveau_switcheroo_set_state(struct pci_dev *pdev,
>  static void
>  nouveau_switcheroo_reprobe(struct pci_dev *pdev)
>  {
> -	struct drm_device *dev = pci_get_drvdata(pdev);
> -	drm_fb_helper_output_poll_changed(dev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> +
> +	drm_fb_helper_output_poll_changed(drm->dev);
>  }
>  
>  static bool
>  nouveau_switcheroo_can_switch(struct pci_dev *pdev)
>  {
> -	struct drm_device *dev = pci_get_drvdata(pdev);
> +	struct nouveau_drm *drm = pci_get_drvdata(pdev);
>  
>  	/*
>  	 * FIXME: open_count is protected by drm_global_mutex but
> that would lead to
>  	 * locking inversion with the driver load path. And the
> access here is
>  	 * completely racy anyway. So don't bother with locking for
> now. */
> -	return atomic_read(&dev->open_count) == 0;
> +	return atomic_read(&drm->dev->open_count) == 0;
>  }
>  
>  static const struct vga_switcheroo_client_ops

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
