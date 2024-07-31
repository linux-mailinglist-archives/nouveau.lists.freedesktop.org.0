Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E139897B3
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D77410E2A9;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nGyHp3jv";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1195A10E307
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 10:09:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ysg0S+nnYBXzyN9zK2FqDTC7KrglzNcSbcgZhwQXLU+pRpOuNKzc482E5NOKwdYdm9DpMuRT1s42kwrMCIHU8iKtIBlHuMO7EyUU5cO64VFFeBZ+/bobxu0yITVPsJOeQaHoVdyVf3s8H49/Xc4/ADVPJUGuDwuDcdqZnAhuptSvASgcelWWPLPb5G93bZUoaoV9VNK5WkhygYaBz+biZNo3diNoRToEl6koLwHfeUeWD4ys1Sb4XkxrZALn1s9SJIkcLzUibbyTw9n3nYQu5sgtV/JcGtnsvDNLODLIs4z3G4PUmBSXMzvYXOFmpwGl42UQVsjCHFw1XR+ccUlcyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSRkTtKhrZVsGnUdbQpcrkk45j4PKNwc1EuqHjA4s68=;
 b=ZN9OCwLPllmN40PH/WJq+6u4F0IPv6Fmu/AjmGNx//iSTxgkzvt/YsxzJ9EwcYeMg+Fd07BtM3jw6CtMy5H87zRPhK0NKkE8ihI+rt68ej1vAkcHLk+aYeP/t3eUAV68OGpw9SrxSvSq8rD0hjilDvouhHuhNNzBM0fTTNh7XtmokqoQ4mm0xgj0NSzRcnxoeCv70R4CTEh8yRuQ54cc43PChNcL2YShpanj3Pr+F5w/F3H8CX+XbhWf3G5/RINGqpbC/7P3JAvLKB0ZIYCg5TYw+oH4qTOdToDJEfXoslcTy5lojbzDbqPLgX9XWYQZfWf/yKk8aBfsWE+Tn6O1+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSRkTtKhrZVsGnUdbQpcrkk45j4PKNwc1EuqHjA4s68=;
 b=nGyHp3jvBtHLwmkKwFvrgpF7f32lRbXXBoCKoHRvUqnFqtdUTZjNxcAY70J33lKkOYW48nxbq+H3mDoLg/cA51YxVH17p+6P/myr556zTQR2XuVu9haiRs1QA7hf3I+RefYdzhvvdoO1QBETBs269jtFg3852sE3dPaJaR84okWmYQrAv7UT6vMPK5MGJqcyiSS9XvLVuWnPCGNWe6YmVMezOfqrymdS9STsBZYroD0uFoipLKqfke387xFU6SAo55DyTk8VVgPVvUBlgU0a4M2JSyhrSfGWxBeXLxDwUl/K2oP3Qya3adf+e64+j4KD+z4ggiqiR3CXKGXiTYXVsA==
Received: from DM5PR07CA0050.namprd07.prod.outlook.com (2603:10b6:4:ad::15) by
 CH3PR12MB8188.namprd12.prod.outlook.com (2603:10b6:610:120::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.27; Wed, 31 Jul 2024 10:09:28 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::88) by DM5PR07CA0050.outlook.office365.com
 (2603:10b6:4:ad::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 10:09:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 10:09:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:09:18 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:09:17 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 03:09:16 -0700
Date: Wed, 31 Jul 2024 13:09:16 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <20240731130916.00003089.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-3-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-3-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|CH3PR12MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 73f5b68d-be1f-45a8-8f73-08dcb148dcfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Eb0q1srLJHetegsYgYum7xV2miip9kVMHhCsEPKoMnWsFUfjugBp65OXpjFT?=
 =?us-ascii?Q?0j86LSLn2cRwk7PDSvxKkOoUHPVwwxMQLGmhre110X5fortwoaj0KtWhamGe?=
 =?us-ascii?Q?Np2OoskTsRe4PjCCSs0sfuiZLvWhpSETAXOsx3im/V6+bg1wj7uBUqB8I4OF?=
 =?us-ascii?Q?NBuhz2fZj28n/9UIqx8CbIRaWRB1Jlt2PWkSY5D2TjV/S/wvLmziDOaKe/J1?=
 =?us-ascii?Q?67wj/raEDr8YByzXog8ryf78v6sxHVVWsfiK6J8b1w71m5tg4FUWnGvenUK8?=
 =?us-ascii?Q?3WtW1FHhuBwa03sPwnp1qlEoHJ97eISxIFF6VLhNrznBp9nG0xdwf0Wfsbb8?=
 =?us-ascii?Q?5Yvx8iCIFwKO0oN68KJbmYY5P0Vo6syI2zANBJK5LRgsaEKWLphhEiCfS1HY?=
 =?us-ascii?Q?DT2CH+Pwogjaa7YrzXdP0Rdi77TPRY1a9HcgoCDgr4l8Ff+EEvYKfwzQXhGs?=
 =?us-ascii?Q?SyewkqHT3BoDT12iFZSRF3hoXutR269xTWOxtOXcyvKdSSRmcs83Kyl9hdgv?=
 =?us-ascii?Q?5OfLeDGtpecj3nXHmoH+kcppO3aj8NZjDFZjy+2JW5wTBR45RL0dG49kk0Bs?=
 =?us-ascii?Q?tQ2mk8Py+QTohi38oso2wT09mVR1w/zpevWVO1YbvRE6opirLKWYYpErpnkm?=
 =?us-ascii?Q?XpN9zA8lAJQU/pRPMWkQjsOBvMAJVUl2D/Gul3+YVrmcFqCj/e28oSEa+1rT?=
 =?us-ascii?Q?1XS/dtM+7L6UeYwSctVLZsJSWbXrMKdJWhIHad6h8Iz2bBWOlVlsdWiCRjVP?=
 =?us-ascii?Q?3Ja2PHf1yNr3VlPC6yEOap/wMo8G/M2BCzgf4A9l42j6ug69g81BRTPyNKZU?=
 =?us-ascii?Q?QWRwngMDgLGdwE6N/cBF7VIi3MhPxIWvgoqL1RGQnPBNHT2FlSHK4B40UeF+?=
 =?us-ascii?Q?5rSXb+YyB+xJyzLTsZH4LxwZsp+Ic3cUwHXP84gmMmkJLhkMIXmV+5Ntai3E?=
 =?us-ascii?Q?RF/8C3jpv4XO0YcGCtJDfUB4IvaEe3PDtxZrSM8D3s6Jx4cZPi/Qy8KvGl1M?=
 =?us-ascii?Q?EsEzU1zYphhsIp9aYTTOy3GVHDEmV7x/dlLb7l3Z4H9Og+PkPecfXMcUCKmS?=
 =?us-ascii?Q?GjIBu6rb1anURzX1Ofn/NNx5P90lWqxkXTvH5HH0+uYaskq2BRlebOZ0PnO7?=
 =?us-ascii?Q?FaGkLeTJT9v5PHbepDcai57EjAxvWAYnUeGOSnvffxnfXs+wdQ+Z/ZnAcymd?=
 =?us-ascii?Q?uBAyRPrV2lRBW9ah/2cKMgjzM1JMPlh/+hOvFQ5qnlDGksvMogcjG3so0OVF?=
 =?us-ascii?Q?p9eSsWt3GIse/nzilzU2IGVd5HWqTBiefsXhsgU8F0iVXTZHmy9P8rBw4o4Z?=
 =?us-ascii?Q?oJPhfy4ScT2wO2PALT1cX62QIleJpF99nyav2Hbs1z7KmqyPmpM54em+Cy3S?=
 =?us-ascii?Q?LAoygeS0jSOocrh2GPTXU/E6MRnd9xmIXDWgd+q2JN46KbEvXPR5bmgIA93k?=
 =?us-ascii?Q?dVPMMv3aeMuos9XPrtBaHATjvAtL9per?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:09:28.1975 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73f5b68d-be1f-45a8-8f73-08dcb148dcfc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8188
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

On Fri, 26 Jul 2024 14:37:53 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> Unify some more of the PCI/Tegra DRM driver init, both as a general
> cleanup, and because a subsequent commit changes the pointer stored
> via dev_set_drvdata(), and this allows the change to be made in one
> place.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c      | 93
> ++++++++++++++-------- drivers/gpu/drm/nouveau/nouveau_platform.c |
> 6 -- 2 files changed, 60 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> eae48c87e3d5..9beff8737617 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -628,20 +628,14 @@
> nouveau_drm_device_fini(struct drm_device *dev)
> destroy_workqueue(drm->sched_wq); nvif_parent_dtor(&drm->parent);
>  	mutex_destroy(&drm->clients_lock);
> -	kfree(drm);
>  }
>  
>  static int
> -nouveau_drm_device_init(struct drm_device *dev)
> +nouveau_drm_device_init(struct nouveau_drm *drm)
>  {
> -	struct nouveau_drm *drm;
> +	struct drm_device *dev = drm->dev;
>  	int ret;
>  
> -	if (!(drm = kzalloc(sizeof(*drm), GFP_KERNEL)))
> -		return -ENOMEM;
> -	dev->dev_private = drm;
> -	drm->dev = dev;
> -
>  	nvif_parent_ctor(&nouveau_parent, &drm->parent);
>  	drm->master.base.object.parent = &drm->parent;
>  
> @@ -711,6 +705,12 @@ nouveau_drm_device_init(struct drm_device *dev)
>  		pm_runtime_put(dev->dev);
>  	}
>  
> +	ret = drm_dev_register(drm->dev, 0);
> +	if (ret) {
> +		nouveau_drm_device_fini(drm->dev);
> +		return ret;
> +	}
> +
>  	return 0;
>  fail_dispinit:
>  	nouveau_display_destroy(dev);
> @@ -728,10 +728,47 @@ nouveau_drm_device_init(struct drm_device *dev)
>  	destroy_workqueue(drm->sched_wq);
>  fail_alloc:
>  	nvif_parent_dtor(&drm->parent);
> -	kfree(drm);
>  	return ret;
>  }
>  
> +static void
> +nouveau_drm_device_del(struct nouveau_drm *drm)
> +{
> +	if (drm->dev)
> +		drm_dev_put(drm->dev);
> +

Out of curiosity, Is it a valid convention in nouveau that allowing to
call the de-constructor of the *failing* object construction in the
error handling path? This usually means the de-constructor has to clean
the half-baked object silently while not be able to catch an invalid use
of the object somewhere else. 

E.g. if (drm->dev)... seems more like for error handling. In a normal
tearing down path, if !drm->dev, then a WARN_ON() or OOPs is expected
to catch the case. IMO, we should not let it slip away silently.

> +	kfree(drm);
> +}
> +
> +static struct nouveau_drm *
> +nouveau_drm_device_new(const struct drm_driver *drm_driver, struct
> device *parent,
> +		       struct nvkm_device *device)
> +{
> +	struct nouveau_drm *drm;
> +	int ret;
> +
> +	drm = kzalloc(sizeof(*drm), GFP_KERNEL);
> +	if (!drm)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm->dev = drm_dev_alloc(drm_driver, parent);
> +	if (IS_ERR(drm->dev)) {
> +		ret = PTR_ERR(drm->dev);
> +		goto done;
> +	}
> +
> +	drm->dev->dev_private = drm;
> +	dev_set_drvdata(parent, drm->dev);
> +
> +done:
> +	if (ret) {
> +		nouveau_drm_device_del(drm);
> +		drm = NULL;
> +	}
> +
> +	return ret ? ERR_PTR(ret) : drm;
> +}
> +
>  /*
>   * On some Intel PCIe bridge controllers doing a
>   * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not
> reappear. @@ -794,7 +831,7 @@ static int nouveau_drm_probe(struct
> pci_dev *pdev, const struct pci_device_id *pent)
>  {
>  	struct nvkm_device *device;
> -	struct drm_device *drm_dev;
> +	struct nouveau_drm *drm;
>  	int ret;
>  
>  	if (vga_switcheroo_client_probe_defer(pdev))
> @@ -825,9 +862,9 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
>  	if (nouveau_atomic)
>  		driver_pci.driver_features |= DRIVER_ATOMIC;
>  
> -	drm_dev = drm_dev_alloc(&driver_pci, &pdev->dev);
> -	if (IS_ERR(drm_dev)) {
> -		ret = PTR_ERR(drm_dev);
> +	drm = nouveau_drm_device_new(&driver_pci, &pdev->dev,
> device);
> +	if (IS_ERR(drm)) {
> +		ret = PTR_ERR(drm);
>  		goto fail_nvkm;
>  	}
>  
> @@ -835,30 +872,22 @@ static int nouveau_drm_probe(struct pci_dev
> *pdev, if (ret)
>  		goto fail_drm;
>  
> -	pci_set_drvdata(pdev, drm_dev);
> -
> -	ret = nouveau_drm_device_init(drm_dev);
> +	ret = nouveau_drm_device_init(drm);
>  	if (ret)
>  		goto fail_pci;
>  
> -	ret = drm_dev_register(drm_dev, pent->driver_data);
> -	if (ret)
> -		goto fail_drm_dev_init;
> -
> -	if (nouveau_drm(drm_dev)->client.device.info.ram_size <= 32
> * 1024 * 1024)
> -		drm_fbdev_ttm_setup(drm_dev, 8);
> +	if (drm->client.device.info.ram_size <= 32 * 1024 * 1024)
> +		drm_fbdev_ttm_setup(drm->dev, 8);
>  	else
> -		drm_fbdev_ttm_setup(drm_dev, 32);
> +		drm_fbdev_ttm_setup(drm->dev, 32);
>  
>  	quirk_broken_nv_runpm(pdev);
>  	return 0;
>  
> -fail_drm_dev_init:
> -	nouveau_drm_device_fini(drm_dev);
>  fail_pci:
>  	pci_disable_device(pdev);
>  fail_drm:
> -	drm_dev_put(drm_dev);
> +	nouveau_drm_device_del(drm);
>  fail_nvkm:
>  	nvkm_device_del(&device);
>  	return ret;
> @@ -877,7 +906,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
>  	device = nvkm_device_find(client->device);
>  
>  	nouveau_drm_device_fini(dev);
> -	drm_dev_put(dev);
> +	nouveau_drm_device_del(drm);
>  	nvkm_device_del(&device);
>  }
>  
> @@ -1369,7 +1398,7 @@ nouveau_platform_device_create(const struct
> nvkm_device_tegra_func *func, struct platform_device *pdev,
>  			       struct nvkm_device **pdevice)
>  {
> -	struct drm_device *drm;
> +	struct nouveau_drm *drm;
>  	int err;
>  
>  	err = nvkm_device_tegra_new(func, pdev, nouveau_config,
> nouveau_debug, @@ -1377,7 +1406,7 @@
> nouveau_platform_device_create(const struct nvkm_device_tegra_func
> *func, if (err) goto err_free;
>  
> -	drm = drm_dev_alloc(&driver_platform, &pdev->dev);
> +	drm = nouveau_drm_device_new(&driver_platform, &pdev->dev,
> *pdevice); if (IS_ERR(drm)) {
>  		err = PTR_ERR(drm);
>  		goto err_free;
> @@ -1387,12 +1416,10 @@ nouveau_platform_device_create(const struct
> nvkm_device_tegra_func *func, if (err)
>  		goto err_put;
>  
> -	platform_set_drvdata(pdev, drm);
> -
> -	return drm;
> +	return drm->dev;
>  
>  err_put:
> -	drm_dev_put(drm);
> +	nouveau_drm_device_del(drm);
>  err_free:
>  	nvkm_device_del(pdevice);
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_platform.c
> b/drivers/gpu/drm/nouveau/nouveau_platform.c index
> bf2dc7567ea4..d0a63f0f54a2 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_platform.c +++
> b/drivers/gpu/drm/nouveau/nouveau_platform.c @@ -34,12 +34,6 @@
> static int nouveau_platform_probe(struct platform_device *pdev) if
> (IS_ERR(drm)) return PTR_ERR(drm);
>  
> -	ret = drm_dev_register(drm, 0);
> -	if (ret < 0) {
> -		drm_dev_put(drm);
> -		return ret;
> -	}
> -
>  	return 0;
>  }
>  

