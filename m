Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C67069897AF
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 693F410E2AB;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QKg2wdtt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8AE10E307
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 10:09:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xe6voGr6l6s7ofoFHl/Ob+oMyKuSVu5SsrPLdyfKzREn2n0Gm9oK0yROy5wvkYNi8tAbBhVYKIX8HLyfsi2zuYREOUi5UbPhur003ADpGL/zJ57IsYUFhM+wXGDICoxZqMkB1QPfBzlQyXX+8AnuolRujVat5s50p33o5whvEOcaYHEppD11/iXxsb5LBGSkmjeU8afr4iZFhaMdIGYkeMJRCitO1UQblmF1Pjpl0j3vfyPyoDcyEWrQCsxxX/J0lOGlm5AVj7SEJuOviLVqhsrnqv+/gM5Dp7uw+lYMek6UsSXHvZplSd7KinTBYbs1DCEq5Xjk5UIAXE5kC3ME8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F63L2enG7/o3jyDDUu1WmIXZ8qrASg5PvVtlm3F3q9I=;
 b=uR6THN1YsPzKf/iLr8ETZsrH5BvVSgXyU+W7c3WDRXwYtM33fypGhDxToOsnk2ppB0XNSJRZGWnH3jCUiJcvWEPEW8ucYZLWECLTHajv/M0ea5XlDMqOVzJvPy/kmmd4/bDrrgz3UfjfgxIoYBEfThvff0YYv5IvBV+CC3yaFPXnjSonMOjn8vu96ZgzdO4lGw0+QJnYqKAf+xbA+0BYmBL7FyWWyjK9s7gCvngBW4ZfC4eYVHYbb+ApyqUdUhDY/GvTw8wgTyKsmyJxFWzg+XhZjLDWo3xf/MForIhPv2Cl5RXHWZdKc4+bcU4y59cBgDBs14ixDQ0x3/6OnCosFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F63L2enG7/o3jyDDUu1WmIXZ8qrASg5PvVtlm3F3q9I=;
 b=QKg2wdttECvQ7G8m2T+QVLLyMk52kKwmLIczgWBq+qc0scY2YzKCJ2mu0bBcKZKwlUieuNVWEAif8uDFRPbFDAqMXwqlmC3D5DWlQavl/Ef0OVF1gMsS3muZLE7vBYERCCsVZRNS/kXmZj6E3HSJWqb0Sgd3woNapLAi0/1X+oUfRUulbpzVvihbPKqc158ngJbG35Mo8e2AJKcXqhoEkctgyTPEYixx7FBBOScGBaZY8ySPpsWX1ugv3Lg7GftjxDqsFyUNUDy0w21faBgfNs96pz13VcFafC0e98Quy2RRr9QYklWy1N1D7NMJEPq3ye/QhylDAFvcyzEWJblNQw==
Received: from SJ0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:a03:39e::35)
 by PH7PR12MB8015.namprd12.prod.outlook.com (2603:10b6:510:26a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.30; Wed, 31 Jul
 2024 10:09:00 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:a03:39e:cafe::6f) by SJ0PR03CA0300.outlook.office365.com
 (2603:10b6:a03:39e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 10:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 10:08:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:08:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:08:47 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 03:08:45 -0700
Date: Wed, 31 Jul 2024 13:08:45 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/37] drm/nouveau: handle pci/tegra drm_dev_{alloc,
 register} from common code
Message-ID: <20240731130845.0000723b.zhiw@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|PH7PR12MB8015:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c8cad4-45c6-492e-b90c-08dcb148cbf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mbVhn+siWQEs7QJQIEFSsv/3Hh4pql092b9sabRCAnHvmo+sHM+MSG1Jasc1?=
 =?us-ascii?Q?sCa/z8s3NVVfvQzqx8BKgcBw5lPvh+96EUfNJrCtBpSlyBmyEFRN0eanVCZZ?=
 =?us-ascii?Q?/IMyk/zlftiAB73BAsBgerBOOQzsdfG2VVoBCwWhJiHc5xSkal+1J7dCCxCN?=
 =?us-ascii?Q?1vSKbQlI2TwzTfPT3nT32y8HGVmoeWfvYjjgWJFxNCbvlBORW+R88qe0DsKH?=
 =?us-ascii?Q?wOsNEloRI+R0LdqHg/q5cPVCWzMt+a9+OEiiviB2vmM/8TDzasEA5IWE65mP?=
 =?us-ascii?Q?b+gwPwTGNY7NsXD9xFj5MOT0evPSuaA62GKGT3aVzzvCY8d95tAqAe0ljgyB?=
 =?us-ascii?Q?VmR+zk0Dos9fiuRRv0inj3Yzb7E55WwmmMkA4iA4xlZbjpi0KzJWlJ1ZGstD?=
 =?us-ascii?Q?u6Xy867mljRS3w1UobqZ4gczq0lRjyBAmnsWn1omYsuY2XXnOFtMdASBnAY7?=
 =?us-ascii?Q?elNpg83FvsitdGi6HIxGhNFq6lzDPgWCoSVueVM6ndpHd0SfGfa2C2H/Tqus?=
 =?us-ascii?Q?HLXeUHLvXISItrSW582glK96pWbaPfh94tUOocV5neC/jAcqwTNkuqqPHLTS?=
 =?us-ascii?Q?8gY0cToM4Bimc0P5LWHN8bUZ7c4TnFiQ0aksPa86ky4TwbdkpLSbrr9va1wP?=
 =?us-ascii?Q?3mvfVehAJHNHhNP+52AMnBl+VAnAWhZU4tA4TKF/I3+vK9joPwKYxXzpevW/?=
 =?us-ascii?Q?ecPxrXakWJLcSDBkfJBJnvgF+DFJvWEZmB5g2GHlV5sOQj6k+8se3Ygec35E?=
 =?us-ascii?Q?EWzmSIaHkGMBWnE6JttJ1u42e/YfzDX9vUDpx0gSIJBy3NU6hnzZCgML/SCC?=
 =?us-ascii?Q?AIudN9W5oC9T0I2so8ZYQK8+u0hBWb/Bt/ygNWYRfaCgOHeDMhN4QBE5FV3n?=
 =?us-ascii?Q?d3Xw5E+hqFy86sBUDnYYFaMJZWmHFpyxRlo7mPwOBmy2O/IIU1sJ/iumSlJt?=
 =?us-ascii?Q?pug7SZQI5ogg4KgJAzepgG6VoFTb5g3o2mDzXXGYCIR2cSvGAzXdHd204yy4?=
 =?us-ascii?Q?kUmKv9upOKLXGa0B1wNm8NvZpJ6q6IjF7AkOBCdpvOoO5GMscs4tq3U7pGw/?=
 =?us-ascii?Q?6EFTUIYHFhwZjpt/o9ZERsYRAdtKLPQET0ALm1rozIWRPVBK1NQcmDkA4nYC?=
 =?us-ascii?Q?AI2BHH5xnc1p4yW+YkYqMlZnkgtMvsij7MKSZmXcE9jf9+iKjI2sbQS2HkTU?=
 =?us-ascii?Q?dJoRHuDgc0XZYbzL3lecmKk4jkK3JUzUSXZCbOQ1RVonTV2FKuNXlPlLV47y?=
 =?us-ascii?Q?xs+mP29SPxX3ix3k/gSD1LMYuRuRcLFM560ULbZ2pTt7euWhjcGKr9kEXKEe?=
 =?us-ascii?Q?qCZN5CWtI/tpgXFLHGOb87Qiysb29kLC9fQOMxatMpD1efFOkWN3UxrU5e3O?=
 =?us-ascii?Q?zGYCb1TrPf8riAjw0zkIu8wdAddhGvwELoKwUilUOZkjmUBgOp/ICBg18Oto?=
 =?us-ascii?Q?/NSsBOLm/U5PN77nY3MamxsT4dPIOWHJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:08:59.5648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c8cad4-45c6-492e-b90c-08dcb148cbf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8015
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

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
