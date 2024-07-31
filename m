Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B69897A2
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C7110E11D;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dgcOLjmc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2073.outbound.protection.outlook.com [40.107.94.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BC510E3FD
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6fnaLtRgxu82othYFwlALL140MKEQS7Dj7tpqogvYuIhzsVUf+FYzA95uTRSP5YVw4Ro/z5GAVjl6VTsityrLh8PKEX8UDNcML48IdlgLOEBc9CamERHUylMod98K0zsbhbCG4X1YpiEN6nGP5sk23m9iy3LgQWfpcIpK+yrFv+wR3C6DoYm5voQcRInud4ZREst8IW4bukOpWLn2/0W32cAY//RfTqEYLqKsY1R3WKqcjwJglm0g6wOjKtIbdzBZ8hFat+Smfk6DlpA2IkRySE+VGRA3EKckchDKtvE/OAtIZV650QFnVxI0j8cpgBoOA8//VhPB68eJN7Ewf7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktTNX0a3YmEly1XEHxw7P7tSg+FaC/sIoZNKKh5lECo=;
 b=bbEfJzKRQ652RQ1C+RYrMj6oHsBGXQyomqYJC7isj2PED4rZcxitRgNMl/CXbcwZ3FwlqxXL2BHCXgZX24PK6EtJ3fYypx1zoa9EXn304a1lGHiLLKQV7TdsNIx7w3a+Jtb9hX8uoJq78pgg97OktF2X/iD9dH972IYdSuvQ8q2gMjE7cu6Tnzj+apexrigmvuL/sZ2z99SAsAJnxt11WECWL7mSEhhwuVYNoNwc7+k1gEPFkS1PlNlP246Fk8081jC1qELrHCvaFBz+9jcK74mnlECKBFesiknIk4zc8swKiNifz/Rdyh8k6ePdsbsAn2aaIRylG/KzrBetWrO7nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktTNX0a3YmEly1XEHxw7P7tSg+FaC/sIoZNKKh5lECo=;
 b=dgcOLjmcadKhmMGj3c0pp9RH8MkmnW7oQ8JBjul8/Svtl2RtC/KdUE7qnqITlOViBS/AhuxQ8jZ8BeaGmTw2qASRRzLWKARBvkLqk/6OeSI1QnAJBujLkZkySP2Idxkek8uy44GOp8rio1aIloAmxONDQG0adXdLZQcXkbGA3IJQMryaECipFa8Qg4pJQmTID1W+xPsGhhWwErOIl2YtB2Si+TAKJ1zPyRg4cYCVFs9gXqWSu0AcWKzGGtxUBabs/RxcWU3WAkSv7tW3CgJO9Z3RVRhgmGK9HDrvaPEHMgqTxzrY4HyRsQiSB++LtGhwHraowPNylhchReJJnD6e8g==
Received: from BN1PR12CA0004.namprd12.prod.outlook.com (2603:10b6:408:e1::9)
 by SJ0PR12MB8613.namprd12.prod.outlook.com (2603:10b6:a03:44d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 11:26:06 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:e1:cafe::a3) by BN1PR12CA0004.outlook.office365.com
 (2603:10b6:408:e1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 11:26:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:26:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:25:51 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 04:25:50 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 04:25:49 -0700
Date: Wed, 31 Jul 2024 14:25:49 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 11/37] drm/nouveau/nvkm: remove
 detect/mmio/subdev_mask from device args
Message-ID: <20240731142549.00001031.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-12-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-12-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|SJ0PR12MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: c34956cb-dc66-41b0-125c-08dcb15391c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9gQuh9rWpn9lL253ERYRyAkWgbd9t8WKsDUUJVaZ5ux/sUi0tIAmmE1C0Atk?=
 =?us-ascii?Q?430zCgoT9jaGuAdWRWYsI78KdadmqOJLtdvgKPkZ2aEmFTlqlrsiDA91Exzk?=
 =?us-ascii?Q?PfvEJzdtTSe9HYF6C8uR5N7A2z2BapX3BfLBWpX9vohGT1XAnpHBB+Qk8Nq+?=
 =?us-ascii?Q?R2OtgnNVbyI5j4BuxpDNWdJAIwJu0E26ebMF65H1JwQcc8Ojc06CGJ9WULp2?=
 =?us-ascii?Q?4l1gCXc64LnEHP+mLfPz0KBIw6Wk33HONcQwpdfAZLdED9hGJbbtFnSoyAai?=
 =?us-ascii?Q?7WkYVm7bNm1DeQXbH/rzkotT2KpmKC77rRoLc2RU47wLauGQEoIBarJcmVhy?=
 =?us-ascii?Q?v7Vi70TAxSqUCSXrALuFfZEZoKkHdRS5CTqdPthSk3n6CY694MDJDVlIV8GU?=
 =?us-ascii?Q?2Pg3DrBbqflF2p6ItDngXhh82e3aZNd67/CaveEUenJU+fs7l4wFCnstzl+Q?=
 =?us-ascii?Q?sZXXdaXRhXCEuUfB46FZ5gWiIMvn5xmhSd/Nm/yk7+HiJ3ABqGsjLCHq5Yc3?=
 =?us-ascii?Q?WdtK/FqgdMe5QtrDOLbsD0f5LDoylPBcry6IR98ObqZfRwf/UefTmdNciGTT?=
 =?us-ascii?Q?R60WoH8Stxf80nr1vpTBjs62KVN31aNg1gNW2kQg6yjBpqNg2tacSC33zHgx?=
 =?us-ascii?Q?+2MlZu1fkLYpIFHex5R+WmibHZY0JYjKgHryJZgu937Pujac4XVEBGs1wV4W?=
 =?us-ascii?Q?L44abxN4CWeh0JQqV/iJQ1fY9v9R+yVw9vAKnEIZ4MthfI0mIEt+grUaxlox?=
 =?us-ascii?Q?rlPI3Zy0hRmmwH+9r8qK6XC+uAKx0eveBWSLW/6Ikq8OPyVN/78bvwp8qmBO?=
 =?us-ascii?Q?Vog87Zfc6HxZCcby2KkxuXQToFSGcmdZ9qK5s/MvJB8N9DpVUqfCKlt+BHNI?=
 =?us-ascii?Q?7Z+WSSDnB9KSU3cuaZtnpcGMmFIMX1UhhY3dYVRoGu5ZAKbrVUaaQmYrjdYW?=
 =?us-ascii?Q?2g3qrRIslarO86y9D4a3ET5G+k8u0KnoqZ47M9Vf/q6hCaEfPswYLiah/jpT?=
 =?us-ascii?Q?mdTKzR/ZJLdeOTOz41mMyN+aV6XUjBmmTaeELJjduBH2kLQd3MfP6MvWMGob?=
 =?us-ascii?Q?peb4Hb6QveGp+yC5QTBZYWAKmhYY4PiZJ1WKNM68hZUCWF++g0AilVFTQ7Df?=
 =?us-ascii?Q?WdTagOPzvX3bQXTGn+16a+NTFs+atpcpCdfNJxVyPlPewqk8mYLdIfpSGiIF?=
 =?us-ascii?Q?Fd7r0HttFkS2NitI2gTZ3UT8hNIB99qf7hIPCDdqYC4d8y3mOtKzOuiYU7I7?=
 =?us-ascii?Q?Osa5/BR7uMld/oPZLP8Cz/EmeMyE9tDpUS+Hk2LmBKGo/LpPCwQguSO+5mrf?=
 =?us-ascii?Q?gh45qStvZLYnY9mvRV/R3OXysJxNBB1JlkQnKIbXe7A/r3Ej90yc904+KX0w?=
 =?us-ascii?Q?ZLmHOz8ntAQox7BWNISufBm0Ib8lCE5mJPEo6ihX3DIj7j7+JU6+3/GCgyVC?=
 =?us-ascii?Q?iuQsDSH1UqjSbnqUx1zmPPcmy0pvy05f?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:26:06.3618 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c34956cb-dc66-41b0-125c-08dcb15391c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8613
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

On Fri, 26 Jul 2024 14:38:02 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> All callers now pass "detect=true, mmio=true, subdev_mask=~0ULL",
> so remove the function arguments, and associated code.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  .../gpu/drm/nouveau/include/nvkm/core/pci.h   |   1 -
>  .../gpu/drm/nouveau/include/nvkm/core/tegra.h |   1 -
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |   6 +-
>  .../gpu/drm/nouveau/nvkm/engine/device/base.c | 422
> +++++++++--------- .../gpu/drm/nouveau/nvkm/engine/device/pci.c  |
> 4 +- .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 -
>  .../drm/nouveau/nvkm/engine/device/tegra.c    |   5 +-
>  7 files changed, 209 insertions(+), 231 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h
> b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h index
> b4b5df3e1610..7444c4d59e09 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h +++
> b/drivers/gpu/drm/nouveau/include/nvkm/core/pci.h @@ -10,6 +10,5 @@
> struct nvkm_device_pci { };
>  
>  int nvkm_device_pci_new(struct pci_dev *, const char *cfg, const
> char *dbg,
> -			bool detect, bool mmio, u64 subdev_mask,
>  			struct nvkm_device **);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h
> b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h index
> ccee53d4e4ec..22f74fc88cd7 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h +++
> b/drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h @@ -51,6 +51,5 @@
> struct nvkm_device_tegra_func { int nvkm_device_tegra_new(const
> struct nvkm_device_tegra_func *, struct platform_device *,
>  			  const char *cfg, const char *dbg,
> -			  bool detect, bool mmio, u64 subdev_mask,
>  			  struct nvkm_device **);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> a018b5475478..950184b2c1c2 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -840,8 +840,7 @@ static
> int nouveau_drm_probe(struct pci_dev *pdev, /* We need to check that
> the chipset is supported before booting
>  	 * fbdev off the hardware, as there's no way to put it back.
>  	 */
> -	ret = nvkm_device_pci_new(pdev, nouveau_config,
> nouveau_debug,
> -				  true, true, ~0ULL, &device);
> +	ret = nvkm_device_pci_new(pdev, nouveau_config,
> nouveau_debug, &device); if (ret)
>  		return ret;
>  
> @@ -1387,8 +1386,7 @@ nouveau_platform_device_create(const struct
> nvkm_device_tegra_func *func, struct nouveau_drm *drm;
>  	int err;
>  
> -	err = nvkm_device_tegra_new(func, pdev, nouveau_config,
> nouveau_debug,
> -				    true, true, ~0ULL, pdevice);
> +	err = nvkm_device_tegra_new(func, pdev, nouveau_config,
> nouveau_debug, pdevice); if (err)
>  		goto err_free;
>  
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c index
> 31ed3da32fe7..006f01e93b9b 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c +++
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c @@ -67,12 +67,6
> @@ nvkm_device_list(u64 *name, int size) return nr;
>  }
>  
> -static const struct nvkm_device_chip
> -null_chipset = {
> -	.name = "NULL",
> -	.bios     = { 0x00000001, nvkm_bios_new },
> -};
> -
>  static const struct nvkm_device_chip
>  nv4_chipset = {
>  	.name = "NV04",
> @@ -3104,7 +3098,6 @@ nvkm_device_ctor(const struct nvkm_device_func
> *func, const struct nvkm_device_quirk *quirk,
>  		 struct device *dev, enum nvkm_device_type type, u64
> handle, const char *name, const char *cfg, const char *dbg,
> -		 bool detect, bool mmio, u64 subdev_mask,
>  		 struct nvkm_device *device)
>  {
>  	struct nvkm_subdev *subdev;
> @@ -3132,233 +3125,228 @@ nvkm_device_ctor(const struct
> nvkm_device_func *func, mmio_base =
> device->func->resource_addr(device, 0); mmio_size =
> device->func->resource_size(device, 0); 
> -	if (detect || mmio) {
> -		device->pri = ioremap(mmio_base, mmio_size);
> -		if (device->pri == NULL) {
> -			nvdev_error(device, "unable to map PRI\n");
> -			ret = -ENOMEM;
> -			goto done;
> -		}
> +	device->pri = ioremap(mmio_base, mmio_size);
> +	if (device->pri == NULL) {
> +		nvdev_error(device, "unable to map PRI\n");
> +		ret = -ENOMEM;
> +		goto done;
>  	}
>  
>  	/* identify the chipset, and determine classes of
> subdev/engines */
> -	if (detect) {
> -		/* switch mmio to cpu's native endianness */
> -		if (!nvkm_device_endianness(device)) {
> -			nvdev_error(device,
> -				    "Couldn't switch GPU to CPUs
> endianness\n");
> -			ret = -ENOSYS;
> -			goto done;
> -		}
>  
> -		boot0 = nvkm_rd32(device, 0x000000);
> -
> -		/* chipset can be overridden for devel/testing
> purposes */
> -		chipset = nvkm_longopt(device->cfgopt, "NvChipset",
> 0);
> -		if (chipset) {
> -			u32 override_boot0;
> -
> -			if (chipset >= 0x10) {
> -				override_boot0  = ((chipset & 0x1ff)
> << 20);
> -				override_boot0 |= 0x000000a1;
> -			} else {
> -				if (chipset != 0x04)
> -					override_boot0 = 0x20104000;
> -				else
> -					override_boot0 = 0x20004000;
> -			}
> +	/* switch mmio to cpu's native endianness */
> +	if (!nvkm_device_endianness(device)) {
> +		nvdev_error(device,
> +			    "Couldn't switch GPU to CPUs
> endianness\n");
> +		ret = -ENOSYS;
> +		goto done;
> +	}
>  
> -			nvdev_warn(device, "CHIPSET OVERRIDE: %08x
> -> %08x\n",
> -				   boot0, override_boot0);
> -			boot0 = override_boot0;
> -		}
> +	boot0 = nvkm_rd32(device, 0x000000);
>  
> -		/* determine chipset and derive architecture from it
> */
> -		if ((boot0 & 0x1f000000) > 0) {
> -			device->chipset = (boot0 & 0x1ff00000) >> 20;
> -			device->chiprev = (boot0 & 0x000000ff);
> -			switch (device->chipset & 0x1f0) {
> -			case 0x010: {
> -				if (0x461 & (1 << (device->chipset &
> 0xf)))
> -					device->card_type = NV_10;
> -				else
> -					device->card_type = NV_11;
> -				device->chiprev = 0x00;
> -				break;
> -			}
> -			case 0x020: device->card_type = NV_20; break;
> -			case 0x030: device->card_type = NV_30; break;
> -			case 0x040:
> -			case 0x060: device->card_type = NV_40; break;
> -			case 0x050:
> -			case 0x080:
> -			case 0x090:
> -			case 0x0a0: device->card_type = NV_50; break;
> -			case 0x0c0:
> -			case 0x0d0: device->card_type = NV_C0; break;
> -			case 0x0e0:
> -			case 0x0f0:
> -			case 0x100: device->card_type = NV_E0; break;
> -			case 0x110:
> -			case 0x120: device->card_type = GM100; break;
> -			case 0x130: device->card_type = GP100; break;
> -			case 0x140: device->card_type = GV100; break;
> -			case 0x160: device->card_type = TU100; break;
> -			case 0x170: device->card_type = GA100; break;
> -			case 0x190: device->card_type = AD100; break;
> -			default:
> -				break;
> -			}
> -		} else
> -		if ((boot0 & 0xff00fff0) == 0x20004000) {
> -			if (boot0 & 0x00f00000)
> -				device->chipset = 0x05;
> +	/* chipset can be overridden for devel/testing purposes */
> +	chipset = nvkm_longopt(device->cfgopt, "NvChipset", 0);
> +	if (chipset) {
> +		u32 override_boot0;
> +
> +		if (chipset >= 0x10) {
> +			override_boot0  = ((chipset & 0x1ff) << 20);
> +			override_boot0 |= 0x000000a1;
> +		} else {
> +			if (chipset != 0x04)
> +				override_boot0 = 0x20104000;
>  			else
> -				device->chipset = 0x04;
> -			device->card_type = NV_04;
> +				override_boot0 = 0x20004000;
>  		}
>  
> -		switch (device->chipset) {
> -		case 0x004: device->chip = &nv4_chipset; break;
> -		case 0x005: device->chip = &nv5_chipset; break;
> -		case 0x010: device->chip = &nv10_chipset; break;
> -		case 0x011: device->chip = &nv11_chipset; break;
> -		case 0x015: device->chip = &nv15_chipset; break;
> -		case 0x017: device->chip = &nv17_chipset; break;
> -		case 0x018: device->chip = &nv18_chipset; break;
> -		case 0x01a: device->chip = &nv1a_chipset; break;
> -		case 0x01f: device->chip = &nv1f_chipset; break;
> -		case 0x020: device->chip = &nv20_chipset; break;
> -		case 0x025: device->chip = &nv25_chipset; break;
> -		case 0x028: device->chip = &nv28_chipset; break;
> -		case 0x02a: device->chip = &nv2a_chipset; break;
> -		case 0x030: device->chip = &nv30_chipset; break;
> -		case 0x031: device->chip = &nv31_chipset; break;
> -		case 0x034: device->chip = &nv34_chipset; break;
> -		case 0x035: device->chip = &nv35_chipset; break;
> -		case 0x036: device->chip = &nv36_chipset; break;
> -		case 0x040: device->chip = &nv40_chipset; break;
> -		case 0x041: device->chip = &nv41_chipset; break;
> -		case 0x042: device->chip = &nv42_chipset; break;
> -		case 0x043: device->chip = &nv43_chipset; break;
> -		case 0x044: device->chip = &nv44_chipset; break;
> -		case 0x045: device->chip = &nv45_chipset; break;
> -		case 0x046: device->chip = &nv46_chipset; break;
> -		case 0x047: device->chip = &nv47_chipset; break;
> -		case 0x049: device->chip = &nv49_chipset; break;
> -		case 0x04a: device->chip = &nv4a_chipset; break;
> -		case 0x04b: device->chip = &nv4b_chipset; break;
> -		case 0x04c: device->chip = &nv4c_chipset; break;
> -		case 0x04e: device->chip = &nv4e_chipset; break;
> -		case 0x050: device->chip = &nv50_chipset; break;
> -		case 0x063: device->chip = &nv63_chipset; break;
> -		case 0x067: device->chip = &nv67_chipset; break;
> -		case 0x068: device->chip = &nv68_chipset; break;
> -		case 0x084: device->chip = &nv84_chipset; break;
> -		case 0x086: device->chip = &nv86_chipset; break;
> -		case 0x092: device->chip = &nv92_chipset; break;
> -		case 0x094: device->chip = &nv94_chipset; break;
> -		case 0x096: device->chip = &nv96_chipset; break;
> -		case 0x098: device->chip = &nv98_chipset; break;
> -		case 0x0a0: device->chip = &nva0_chipset; break;
> -		case 0x0a3: device->chip = &nva3_chipset; break;
> -		case 0x0a5: device->chip = &nva5_chipset; break;
> -		case 0x0a8: device->chip = &nva8_chipset; break;
> -		case 0x0aa: device->chip = &nvaa_chipset; break;
> -		case 0x0ac: device->chip = &nvac_chipset; break;
> -		case 0x0af: device->chip = &nvaf_chipset; break;
> -		case 0x0c0: device->chip = &nvc0_chipset; break;
> -		case 0x0c1: device->chip = &nvc1_chipset; break;
> -		case 0x0c3: device->chip = &nvc3_chipset; break;
> -		case 0x0c4: device->chip = &nvc4_chipset; break;
> -		case 0x0c8: device->chip = &nvc8_chipset; break;
> -		case 0x0ce: device->chip = &nvce_chipset; break;
> -		case 0x0cf: device->chip = &nvcf_chipset; break;
> -		case 0x0d7: device->chip = &nvd7_chipset; break;
> -		case 0x0d9: device->chip = &nvd9_chipset; break;
> -		case 0x0e4: device->chip = &nve4_chipset; break;
> -		case 0x0e6: device->chip = &nve6_chipset; break;
> -		case 0x0e7: device->chip = &nve7_chipset; break;
> -		case 0x0ea: device->chip = &nvea_chipset; break;
> -		case 0x0f0: device->chip = &nvf0_chipset; break;
> -		case 0x0f1: device->chip = &nvf1_chipset; break;
> -		case 0x106: device->chip = &nv106_chipset; break;
> -		case 0x108: device->chip = &nv108_chipset; break;
> -		case 0x117: device->chip = &nv117_chipset; break;
> -		case 0x118: device->chip = &nv118_chipset; break;
> -		case 0x120: device->chip = &nv120_chipset; break;
> -		case 0x124: device->chip = &nv124_chipset; break;
> -		case 0x126: device->chip = &nv126_chipset; break;
> -		case 0x12b: device->chip = &nv12b_chipset; break;
> -		case 0x130: device->chip = &nv130_chipset; break;
> -		case 0x132: device->chip = &nv132_chipset; break;
> -		case 0x134: device->chip = &nv134_chipset; break;
> -		case 0x136: device->chip = &nv136_chipset; break;
> -		case 0x137: device->chip = &nv137_chipset; break;
> -		case 0x138: device->chip = &nv138_chipset; break;
> -		case 0x13b: device->chip = &nv13b_chipset; break;
> -		case 0x140: device->chip = &nv140_chipset; break;
> -		case 0x162: device->chip = &nv162_chipset; break;
> -		case 0x164: device->chip = &nv164_chipset; break;
> -		case 0x166: device->chip = &nv166_chipset; break;
> -		case 0x167: device->chip = &nv167_chipset; break;
> -		case 0x168: device->chip = &nv168_chipset; break;
> -		case 0x172: device->chip = &nv172_chipset; break;
> -		case 0x173: device->chip = &nv173_chipset; break;
> -		case 0x174: device->chip = &nv174_chipset; break;
> -		case 0x176: device->chip = &nv176_chipset; break;
> -		case 0x177: device->chip = &nv177_chipset; break;
> -		case 0x192: device->chip = &nv192_chipset; break;
> -		case 0x193: device->chip = &nv193_chipset; break;
> -		case 0x194: device->chip = &nv194_chipset; break;
> -		case 0x196: device->chip = &nv196_chipset; break;
> -		case 0x197: device->chip = &nv197_chipset; break;
> -		default:
> -			if (nvkm_boolopt(device->cfgopt,
> "NvEnableUnsupportedChipsets", false)) {
> -				switch (device->chipset) {
> -				case 0x170: device->chip =
> &nv170_chipset; break;
> -				default:
> -					break;
> -				}
> -			}
> +		nvdev_warn(device, "CHIPSET OVERRIDE: %08x ->
> %08x\n",
> +			   boot0, override_boot0);
> +		boot0 = override_boot0;
> +	}
>  
> -			if (!device->chip) {
> -				nvdev_error(device, "unknown chipset
> (%08x)\n", boot0);
> -				ret = -ENODEV;
> -				goto done;
> -			}
> +	/* determine chipset and derive architecture from it */
> +	if ((boot0 & 0x1f000000) > 0) {
> +		device->chipset = (boot0 & 0x1ff00000) >> 20;
> +		device->chiprev = (boot0 & 0x000000ff);
> +		switch (device->chipset & 0x1f0) {
> +		case 0x010: {
> +			if (0x461 & (1 << (device->chipset & 0xf)))
> +				device->card_type = NV_10;
> +			else
> +				device->card_type = NV_11;
> +			device->chiprev = 0x00;
>  			break;
>  		}
> +		case 0x020: device->card_type = NV_20; break;
> +		case 0x030: device->card_type = NV_30; break;
> +		case 0x040:
> +		case 0x060: device->card_type = NV_40; break;
> +		case 0x050:
> +		case 0x080:
> +		case 0x090:
> +		case 0x0a0: device->card_type = NV_50; break;
> +		case 0x0c0:
> +		case 0x0d0: device->card_type = NV_C0; break;
> +		case 0x0e0:
> +		case 0x0f0:
> +		case 0x100: device->card_type = NV_E0; break;
> +		case 0x110:
> +		case 0x120: device->card_type = GM100; break;
> +		case 0x130: device->card_type = GP100; break;
> +		case 0x140: device->card_type = GV100; break;
> +		case 0x160: device->card_type = TU100; break;
> +		case 0x170: device->card_type = GA100; break;
> +		case 0x190: device->card_type = AD100; break;
> +		default:
> +			break;
> +		}
> +	} else
> +	if ((boot0 & 0xff00fff0) == 0x20004000) {
> +		if (boot0 & 0x00f00000)
> +			device->chipset = 0x05;
> +		else
> +			device->chipset = 0x04;
> +		device->card_type = NV_04;
> +	}
>  
> -		nvdev_info(device, "NVIDIA %s (%08x)\n",
> -			   device->chip->name, boot0);
> +	switch (device->chipset) {
> +	case 0x004: device->chip = &nv4_chipset; break;
> +	case 0x005: device->chip = &nv5_chipset; break;
> +	case 0x010: device->chip = &nv10_chipset; break;
> +	case 0x011: device->chip = &nv11_chipset; break;
> +	case 0x015: device->chip = &nv15_chipset; break;
> +	case 0x017: device->chip = &nv17_chipset; break;
> +	case 0x018: device->chip = &nv18_chipset; break;
> +	case 0x01a: device->chip = &nv1a_chipset; break;
> +	case 0x01f: device->chip = &nv1f_chipset; break;
> +	case 0x020: device->chip = &nv20_chipset; break;
> +	case 0x025: device->chip = &nv25_chipset; break;
> +	case 0x028: device->chip = &nv28_chipset; break;
> +	case 0x02a: device->chip = &nv2a_chipset; break;
> +	case 0x030: device->chip = &nv30_chipset; break;
> +	case 0x031: device->chip = &nv31_chipset; break;
> +	case 0x034: device->chip = &nv34_chipset; break;
> +	case 0x035: device->chip = &nv35_chipset; break;
> +	case 0x036: device->chip = &nv36_chipset; break;
> +	case 0x040: device->chip = &nv40_chipset; break;
> +	case 0x041: device->chip = &nv41_chipset; break;
> +	case 0x042: device->chip = &nv42_chipset; break;
> +	case 0x043: device->chip = &nv43_chipset; break;
> +	case 0x044: device->chip = &nv44_chipset; break;
> +	case 0x045: device->chip = &nv45_chipset; break;
> +	case 0x046: device->chip = &nv46_chipset; break;
> +	case 0x047: device->chip = &nv47_chipset; break;
> +	case 0x049: device->chip = &nv49_chipset; break;
> +	case 0x04a: device->chip = &nv4a_chipset; break;
> +	case 0x04b: device->chip = &nv4b_chipset; break;
> +	case 0x04c: device->chip = &nv4c_chipset; break;
> +	case 0x04e: device->chip = &nv4e_chipset; break;
> +	case 0x050: device->chip = &nv50_chipset; break;
> +	case 0x063: device->chip = &nv63_chipset; break;
> +	case 0x067: device->chip = &nv67_chipset; break;
> +	case 0x068: device->chip = &nv68_chipset; break;
> +	case 0x084: device->chip = &nv84_chipset; break;
> +	case 0x086: device->chip = &nv86_chipset; break;
> +	case 0x092: device->chip = &nv92_chipset; break;
> +	case 0x094: device->chip = &nv94_chipset; break;
> +	case 0x096: device->chip = &nv96_chipset; break;
> +	case 0x098: device->chip = &nv98_chipset; break;
> +	case 0x0a0: device->chip = &nva0_chipset; break;
> +	case 0x0a3: device->chip = &nva3_chipset; break;
> +	case 0x0a5: device->chip = &nva5_chipset; break;
> +	case 0x0a8: device->chip = &nva8_chipset; break;
> +	case 0x0aa: device->chip = &nvaa_chipset; break;
> +	case 0x0ac: device->chip = &nvac_chipset; break;
> +	case 0x0af: device->chip = &nvaf_chipset; break;
> +	case 0x0c0: device->chip = &nvc0_chipset; break;
> +	case 0x0c1: device->chip = &nvc1_chipset; break;
> +	case 0x0c3: device->chip = &nvc3_chipset; break;
> +	case 0x0c4: device->chip = &nvc4_chipset; break;
> +	case 0x0c8: device->chip = &nvc8_chipset; break;
> +	case 0x0ce: device->chip = &nvce_chipset; break;
> +	case 0x0cf: device->chip = &nvcf_chipset; break;
> +	case 0x0d7: device->chip = &nvd7_chipset; break;
> +	case 0x0d9: device->chip = &nvd9_chipset; break;
> +	case 0x0e4: device->chip = &nve4_chipset; break;
> +	case 0x0e6: device->chip = &nve6_chipset; break;
> +	case 0x0e7: device->chip = &nve7_chipset; break;
> +	case 0x0ea: device->chip = &nvea_chipset; break;
> +	case 0x0f0: device->chip = &nvf0_chipset; break;
> +	case 0x0f1: device->chip = &nvf1_chipset; break;
> +	case 0x106: device->chip = &nv106_chipset; break;
> +	case 0x108: device->chip = &nv108_chipset; break;
> +	case 0x117: device->chip = &nv117_chipset; break;
> +	case 0x118: device->chip = &nv118_chipset; break;
> +	case 0x120: device->chip = &nv120_chipset; break;
> +	case 0x124: device->chip = &nv124_chipset; break;
> +	case 0x126: device->chip = &nv126_chipset; break;
> +	case 0x12b: device->chip = &nv12b_chipset; break;
> +	case 0x130: device->chip = &nv130_chipset; break;
> +	case 0x132: device->chip = &nv132_chipset; break;
> +	case 0x134: device->chip = &nv134_chipset; break;
> +	case 0x136: device->chip = &nv136_chipset; break;
> +	case 0x137: device->chip = &nv137_chipset; break;
> +	case 0x138: device->chip = &nv138_chipset; break;
> +	case 0x13b: device->chip = &nv13b_chipset; break;
> +	case 0x140: device->chip = &nv140_chipset; break;
> +	case 0x162: device->chip = &nv162_chipset; break;
> +	case 0x164: device->chip = &nv164_chipset; break;
> +	case 0x166: device->chip = &nv166_chipset; break;
> +	case 0x167: device->chip = &nv167_chipset; break;
> +	case 0x168: device->chip = &nv168_chipset; break;
> +	case 0x172: device->chip = &nv172_chipset; break;
> +	case 0x173: device->chip = &nv173_chipset; break;
> +	case 0x174: device->chip = &nv174_chipset; break;
> +	case 0x176: device->chip = &nv176_chipset; break;
> +	case 0x177: device->chip = &nv177_chipset; break;
> +	case 0x192: device->chip = &nv192_chipset; break;
> +	case 0x193: device->chip = &nv193_chipset; break;
> +	case 0x194: device->chip = &nv194_chipset; break;
> +	case 0x196: device->chip = &nv196_chipset; break;
> +	case 0x197: device->chip = &nv197_chipset; break;
> +	default:
> +		if (nvkm_boolopt(device->cfgopt,
> "NvEnableUnsupportedChipsets", false)) {
> +			switch (device->chipset) {
> +			case 0x170: device->chip = &nv170_chipset;
> break;
> +			default:
> +				break;
> +			}
> +		}
>  
> -		/* vGPU detection */
> -		boot1 = nvkm_rd32(device, 0x0000004);
> -		if (device->card_type >= TU100 && (boot1 &
> 0x00030000)) {
> -			nvdev_info(device, "vGPUs are not
> supported\n");
> +		if (!device->chip) {
> +			nvdev_error(device, "unknown chipset
> (%08x)\n", boot0); ret = -ENODEV;
>  			goto done;
>  		}
> +		break;
> +	}
>  
> -		/* read strapping information */
> -		strap = nvkm_rd32(device, 0x101000);
> +	nvdev_info(device, "NVIDIA %s (%08x)\n",
> +		   device->chip->name, boot0);
>  
> -		/* determine frequency of timing crystal */
> -		if ( device->card_type <= NV_10 || device->chipset <
> 0x17 ||
> -		    (device->chipset >= 0x20 && device->chipset <
> 0x25))
> -			strap &= 0x00000040;
> -		else
> -			strap &= 0x00400040;
> +	/* vGPU detection */
> +	boot1 = nvkm_rd32(device, 0x0000004);
> +	if (device->card_type >= TU100 && (boot1 & 0x00030000)) {
> +		nvdev_info(device, "vGPUs are not supported\n");
> +		ret = -ENODEV;
> +		goto done;
> +	}
>  
> -		switch (strap) {
> -		case 0x00000000: device->crystal = 13500; break;
> -		case 0x00000040: device->crystal = 14318; break;
> -		case 0x00400000: device->crystal = 27000; break;
> -		case 0x00400040: device->crystal = 25000; break;
> -		}
> -	} else {
> -		device->chip = &null_chipset;
> +	/* read strapping information */
> +	strap = nvkm_rd32(device, 0x101000);
> +
> +	/* determine frequency of timing crystal */
> +	if ( device->card_type <= NV_10 || device->chipset < 0x17 ||
> +	    (device->chipset >= 0x20 && device->chipset < 0x25))
> +		strap &= 0x00000040;
> +	else
> +		strap &= 0x00400040;
> +
> +	switch (strap) {
> +	case 0x00000000: device->crystal = 13500; break;
> +	case 0x00000040: device->crystal = 14318; break;
> +	case 0x00400000: device->crystal = 27000; break;
> +	case 0x00400040: device->crystal = 25000; break;
>  	}
>  
>  	if (!device->name)
> @@ -3368,7 +3356,7 @@ nvkm_device_ctor(const struct nvkm_device_func
> *func, nvkm_intr_ctor(device);
>  
>  #define NVKM_LAYOUT_ONCE(type,data,ptr)
>                         \
> -	if (device->chip->ptr.inst && (subdev_mask &
> (BIT_ULL(type)))) {                     \
> +	if (device->chip->ptr.inst) {
>                         \ WARN_ON(device->chip->ptr.inst !=
> 0x00000001);                               \ ret =
> device->chip->ptr.ctor(device, (type), -1, &device->ptr);
>  \ subdev = nvkm_device_subdev(device, (type), 0);
>           \ @@ -3387,7 +3375,7 @@ nvkm_device_ctor(const struct
> nvkm_device_func *func, #define NVKM_LAYOUT_INST(type,data,ptr,cnt)
>                                                \
> WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) -
> 1));             \ for (j = 0; device->chip->ptr.inst && j <
> ARRAY_SIZE(device->ptr); j++) {            \
> -		if ((device->chip->ptr.inst & BIT(j)) &&
> (subdev_mask & BIT_ULL(type))) {    \
> +		if (device->chip->ptr.inst & BIT(j)) {
>                         \ ret = device->chip->ptr.ctor(device,
> (type), (j), &device->ptr[j]);  \ subdev = nvkm_device_subdev(device,
> (type), (j));                    \ if (ret) {
>                                   \ @@ -3409,7 +3397,7 @@
> nvkm_device_ctor(const struct nvkm_device_func *func, 
>  	ret = nvkm_intr_install(device);
>  done:
> -	if (device->pri && (!mmio || ret)) {
> +	if (ret && device->pri) {
>  		iounmap(device->pri);
>  		device->pri = NULL;
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c index
> abccb2bb68a6..3ff6436007fa 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c +++
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c @@ -1626,7 +1626,6
> @@ nvkm_device_pci_func = { 
>  int
>  nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const
> char *dbg,
> -		    bool detect, bool mmio, u64 subdev_mask,
>  		    struct nvkm_device **pdevice)
>  {
>  	const struct nvkm_device_quirk *quirk = NULL;
> @@ -1680,8 +1679,7 @@ nvkm_device_pci_new(struct pci_dev *pci_dev,
> const char *cfg, const char *dbg, pci_dev->bus->number << 16 |
>  				    PCI_SLOT(pci_dev->devfn) << 8 |
>  				    PCI_FUNC(pci_dev->devfn), name,
> -			       cfg, dbg, detect, mmio, subdev_mask,
> -			       &pdev->device);
> +			       cfg, dbg, &pdev->device);
>  
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h index
> bf3176bec18a..c182d9c3e4fa 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h +++
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h @@ -56,7 +56,6 @@
> int  nvkm_device_ctor(const struct nvkm_device_func *, const struct
> nvkm_device_quirk *, struct device *, enum nvkm_device_type, u64
> handle, const char *name, const char *cfg, const char *dbg,
> -		      bool detect, bool mmio, u64 subdev_mask,
>  		      struct nvkm_device *);
>  int  nvkm_device_init(struct nvkm_device *);
>  int  nvkm_device_fini(struct nvkm_device *, bool suspend);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c index
> 87caa4a72921..d1c294f00665 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c +++
> b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c @@ -237,7 +237,6
> @@ int nvkm_device_tegra_new(const struct nvkm_device_tegra_func
> *func, struct platform_device *pdev,
>  		      const char *cfg, const char *dbg,
> -		      bool detect, bool mmio, u64 subdev_mask,
>  		      struct nvkm_device **pdevice)
>  {
>  	struct nvkm_device_tegra *tdev;
> @@ -311,8 +310,7 @@ nvkm_device_tegra_new(const struct
> nvkm_device_tegra_func *func, tdev->gpu_speedo_id =
> tegra_sku_info.gpu_speedo_id; ret =
> nvkm_device_ctor(&nvkm_device_tegra_func, NULL, &pdev->dev,
> NVKM_DEVICE_TEGRA, pdev->id, NULL,
> -			       cfg, dbg, detect, mmio, subdev_mask,
> -			       &tdev->device);
> +			       cfg, dbg, &tdev->device);
>  	if (ret)
>  		goto powerdown;
>  
> @@ -333,7 +331,6 @@ int
>  nvkm_device_tegra_new(const struct nvkm_device_tegra_func *func,
>  		      struct platform_device *pdev,
>  		      const char *cfg, const char *dbg,
> -		      bool detect, bool mmio, u64 subdev_mask,
>  		      struct nvkm_device **pdevice)
>  {
>  	return -ENOSYS;

