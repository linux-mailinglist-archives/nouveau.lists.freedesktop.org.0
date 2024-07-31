Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBB998979E
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A20510E125;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sze6V8Pf";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2078.outbound.protection.outlook.com [40.107.100.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08F410E649
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 17:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5xAJdAcc1Zr3ruAA04CfJs3kh8CaQINpyckNkbhCRxzgK/QtcmAWGDfobbENsyOH2lB8bcq3zP6cV8f53pOhzLuBSfREx4jDRevESBJoT/ELCqFX4PDhzFH+ORdz16l7lU9NNI3qOa/mhX3GpoH3SKgJAtSH955vu3E5Sx47oFB9HIZnxeLSHE6UeiydEAWsWFie4FUrAODHn1boxpP4il6O0NUw6cy7WI+YbZCNWnei2Jb6hyVVVnCxZk+7GhtDzks3moivLspkmpk3jZ7PkQdQRyVRMM3x/uwu5+5I2DcPuFzfZ794CXIk1qTf131SGGgEfqYlmc95y/ljmWFdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VScTVWzbMLyf4eu+jn6PNyr+OeTAemY170pQvIAbtqM=;
 b=vcovpCUW/45Fc9es/KRBWNioUdgnkquYlmm/bwNxvMnvpVgeu5q03zIhboqQ4YG8fjnJ/ZChIRADx+riBF+56UByPLZspF/u93a6RukYzMsKwCtaL9k0clEEN3X7xalgVpOLazzRd1VAAkMPx/SniIA+8uvBUzfH37YE3dIuHKvOElRjnaXT+evrtsximXR68QUbye0e+XCGEdr1uIz/hSJhLoP4zBDusPrD6V3ljv/neq1mwSqeEpfSsb6K/jlGPs3eqkeQHUU6IUMlxZmhBJF370XzodsdfFvP+m4TD4PKzgIR88Lac7kpFLybjYLcmtUrD0ZQsa9O33RFacZmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VScTVWzbMLyf4eu+jn6PNyr+OeTAemY170pQvIAbtqM=;
 b=Sze6V8PflrHd7NOzCpcKT10piL2A4X8UwjnGhrOil0owyHNK0PgumSy6jH6ZH6IZoRnDZEPvSiAr34SQjM1O7Jlm9R+On36eJzF3GRx1W3S/BQFzmqp7oLgeDfqxgW31bMimdRu3zVhStrMYL7ichuPxIs7qGSX/L6s8IYYqXyeUAXC37ZCNUnY8ruYs4Trl8UONvMOUlWtscchzikae3FXcR3Fh71txIznrT+UpJ06FLbBPOgdDb6xcWBSiS+bVITYdIeB2x/XKMX4o9ex9M18+1+vJQkwMAE5X0Q+tMBy6Quu6b7tEvdBQ6YB4/7zXEzXxFtuvJG6F24Ciz9SsbA==
Received: from BYAPR05CA0082.namprd05.prod.outlook.com (2603:10b6:a03:e0::23)
 by SJ2PR12MB8649.namprd12.prod.outlook.com (2603:10b6:a03:53c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 17:58:40 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:e0:cafe::d0) by BYAPR05CA0082.outlook.office365.com
 (2603:10b6:a03:e0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Wed, 31 Jul 2024 17:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 17:58:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:58:24 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:58:24 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 10:58:23 -0700
Date: Wed, 31 Jul 2024 20:58:22 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 29/37] drm/nouveau: pass drm to nouveau_mem_new(),
 instead of cli
Message-ID: <20240731205822.000062a9.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-30-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-30-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|SJ2PR12MB8649:EE_
X-MS-Office365-Filtering-Correlation-Id: 488b2f67-ca21-475c-d90e-08dcb18a68df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a/f7L0FmWKIWy/58CBu1+XzmZh0DfOKjJtVxS02XNTUWO23sAvo1BVMaV3m5?=
 =?us-ascii?Q?zgcDLYXXISR9bK3HJkDKJ3l3ldAC4n0vL2kcUQtZKoOJLaD5q660XCTBbM0h?=
 =?us-ascii?Q?Lo/Q7+no9Q/BhDm8mKirYOKBK96al5O3T+a7UPtjrgJ3RZUQUR4tfH6em25a?=
 =?us-ascii?Q?pCfEfoEUp0C31Rvob5u/XX5PW+oRff52pFZbiAirG5PUvB2yfcM35MAl221q?=
 =?us-ascii?Q?P8AkcABKUC1IxcUvo16r/Wlw7Tl7lp2MVYda1H3czWyJ6racP8mQamxIONs3?=
 =?us-ascii?Q?wJmh3K8rdUNJ+EHL2REEZPyjfyBNeekI8MhtLcDEdsl+uAhDIwYDrguoDRJB?=
 =?us-ascii?Q?FB9Tfjenn3Rizf+AiCVzWyEi1Q8H3pzqP+QAZt9aEt6ffvTUFgFvBY4k61Pc?=
 =?us-ascii?Q?/Sroq0Vlo0wfDGIHqrxGULkgrRzT6najDYGjder21AAmsQ/9ksC8NsXaVACW?=
 =?us-ascii?Q?r1kMItuasUQ6hKDrVMh6rfgzzM29wlDuJ2GTcb9LLe4GXWt52IJBHsjdGRHS?=
 =?us-ascii?Q?bBolyevE36EjylM1Ht/EcVQ0ZhCRygupfBY3yUCtJTDufkAc4faNEnizOON6?=
 =?us-ascii?Q?Vyvow/LEMN2Jo44fP08CQ3BjWjl+rRTMWxltjOicuYcmQNWz952pa/fMAmf1?=
 =?us-ascii?Q?+y+kLhgtsbfQzkmoXmfj3VVIn/H1X2DwfhGut9ST57hq8OpYu7XevkLk/DK+?=
 =?us-ascii?Q?6NyX6oM2K/rAkPeVyvPrQUfvXMh7GyVZQKn3BHpu7waKLFsy7szOci5+MyAt?=
 =?us-ascii?Q?WXAOXM/ejvrFK8AUf5lP0LiF3wgilyIBM9kbRgt7C+xt4ywY1C+BOk4gj8op?=
 =?us-ascii?Q?CRiPtJ/hWj3YcSLhxic7yTlCKmklUCwt9zN5eRQyw0vmSv6YEsqxzuyG9FXy?=
 =?us-ascii?Q?HcN/JwhFIiAPBmKmalyhMKqsPrL0Ty2Y4CzLGMZfGNBYIfmFnB8txyTWJxgc?=
 =?us-ascii?Q?J8SHwop6RO2Mwny2seT/oOdUAmZ7BLD0rt42yNYaKGez88vpPbdyHvrkOz1r?=
 =?us-ascii?Q?m2AVGrezLnRiMkUQy2cG19F8hX+au31xDVocaB4P7V1ACNpiC3Qm/3dycZMQ?=
 =?us-ascii?Q?88QQRZkx+R9PWHWPBdNDkGE3S9VAjftfxmm8SFpB0GQwrYpYERjgk1fTafVt?=
 =?us-ascii?Q?6IeFpr0XSnV9GstpXKif2+y5d9R02lEoytVDLL/tlJw6OFvwnyPGPQtyDHyR?=
 =?us-ascii?Q?JdXx1zdMte5wgxPTBV0+PaJ2MwG7fsrlGV5KeKk7i87GKLu//rcfNfkqiY9h?=
 =?us-ascii?Q?9rF+SFsu3QytyONgnlzQugPhVR+sp3O2NGR5XF9PsxOD0DqeDgqsOZ0lbJHv?=
 =?us-ascii?Q?hzcDNRwGV6Ex6+G6jbx2h09hVU0blQGiwE7GZo3sf/HVW6c7Fxa1X0N4fpE+?=
 =?us-ascii?Q?DrFxoTKK2QKVsycy5kPOQ9ejC4mIe4CPvUQ/db8g5d67XHK4fRzp1USCZ78K?=
 =?us-ascii?Q?nZPgOP67W1DYin8uAC8hPANRbZUn02sD?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:58:40.1621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 488b2f67-ca21-475c-d90e-08dcb18a68df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8649
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

On Fri, 26 Jul 2024 14:38:20 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

LGTM.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The nouveau_cli pointer is only ever used to eventually access
> nouveau_drm, so just store it directly.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_mem.c   | 18 ++++++++----------
>  drivers/gpu/drm/nouveau/nouveau_mem.h   |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_sgdma.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c   |  8 ++++----
>  4 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c
> b/drivers/gpu/drm/nouveau/nouveau_mem.c index
> 67f93cf753ba..b112b62dca3c 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_mem.c +++
> b/drivers/gpu/drm/nouveau/nouveau_mem.c @@ -78,19 +78,18 @@
> nouveau_mem_map(struct nouveau_mem *mem, void
>  nouveau_mem_fini(struct nouveau_mem *mem)
>  {
> -	nvif_vmm_put(&mem->cli->drm->client.vmm.vmm, &mem->vma[1]);
> -	nvif_vmm_put(&mem->cli->drm->client.vmm.vmm, &mem->vma[0]);
> -	mutex_lock(&mem->cli->drm->master.lock);
> +	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[1]);
> +	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[0]);
> +	mutex_lock(&mem->drm->master.lock);
>  	nvif_mem_dtor(&mem->mem);
> -	mutex_unlock(&mem->cli->drm->master.lock);
> +	mutex_unlock(&mem->drm->master.lock);
>  }
>  
>  int
>  nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
>  {
>  	struct nouveau_mem *mem = nouveau_mem(reg);
> -	struct nouveau_cli *cli = mem->cli;
> -	struct nouveau_drm *drm = cli->drm;
> +	struct nouveau_drm *drm = mem->drm;
>  	struct nvif_mmu *mmu = &drm->mmu;
>  	struct nvif_mem_ram_v0 args = {};
>  	u8 type;
> @@ -126,8 +125,7 @@ int
>  nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>  {
>  	struct nouveau_mem *mem = nouveau_mem(reg);
> -	struct nouveau_cli *cli = mem->cli;
> -	struct nouveau_drm *drm = cli->drm;
> +	struct nouveau_drm *drm = mem->drm;
>  	struct nvif_mmu *mmu = &drm->mmu;
>  	u64 size = ALIGN(reg->size, 1 << page);
>  	int ret;
> @@ -173,7 +171,7 @@ nouveau_mem_del(struct ttm_resource_manager *man,
> struct ttm_resource *reg) }
>  
>  int
> -nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
> +nouveau_mem_new(struct nouveau_drm *drm, u8 kind, u8 comp,
>  		struct ttm_resource **res)
>  {
>  	struct nouveau_mem *mem;
> @@ -181,7 +179,7 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind,
> u8 comp, if (!(mem = kzalloc(sizeof(*mem), GFP_KERNEL)))
>  		return -ENOMEM;
>  
> -	mem->cli = cli;
> +	mem->drm = drm;
>  	mem->kind = kind;
>  	mem->comp = comp;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h
> b/drivers/gpu/drm/nouveau/nouveau_mem.h index
> 5365a3d3a17f..a070ee049f6b 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_mem.h +++
> b/drivers/gpu/drm/nouveau/nouveau_mem.h @@ -8,7 +8,7 @@ struct ttm_tt;
>  
>  struct nouveau_mem {
>  	struct ttm_resource base;
> -	struct nouveau_cli *cli;
> +	struct nouveau_drm *drm;
>  	u8 kind;
>  	u8 comp;
>  	struct nvif_mem mem;
> @@ -21,7 +21,7 @@ nouveau_mem(struct ttm_resource *reg)
>  	return container_of(reg, struct nouveau_mem, base);
>  }
>  
> -int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
> +int nouveau_mem_new(struct nouveau_drm *, u8 kind, u8 comp,
>  		    struct ttm_resource **);
>  void nouveau_mem_del(struct ttm_resource_manager *man,
>  		     struct ttm_resource *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> b/drivers/gpu/drm/nouveau/nouveau_sgdma.c index
> b14895f75b3c..bd870028514b 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_sgdma.c +++
> b/drivers/gpu/drm/nouveau/nouveau_sgdma.c @@ -43,7 +43,7 @@
> nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm,
> struct ttm_resou return ret; 
>  	if (drm->client.device.info.family <
> NV_DEVICE_INFO_V0_TESLA) {
> -		ret = nouveau_mem_map(mem, &mem->cli->vmm.vmm,
> &mem->vma[0]);
> +		ret = nouveau_mem_map(mem, &drm->client.vmm.vmm,
> &mem->vma[0]); if (ret) {
>  			nouveau_mem_fini(mem);
>  			return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> b/drivers/gpu/drm/nouveau/nouveau_ttm.c index
> 53553819bcac..e244927eb5d4 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_ttm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_ttm.c @@ -73,7 +73,7 @@
> nouveau_vram_manager_new(struct ttm_resource_manager *man, if
> (drm->client.device.info.ram_size == 0) return -ENOMEM;
>  
> -	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp,
> res);
> +	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
>  	if (ret)
>  		return ret;
>  
> @@ -105,7 +105,7 @@ nouveau_gart_manager_new(struct
> ttm_resource_manager *man, struct nouveau_drm *drm =
> nouveau_bdev(bo->bdev); int ret;
>  
> -	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp,
> res);
> +	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
>  	if (ret)
>  		return ret;
>  
> @@ -132,13 +132,13 @@ nv04_gart_manager_new(struct
> ttm_resource_manager *man, struct nouveau_mem *mem;
>  	int ret;
>  
> -	ret = nouveau_mem_new(&drm->master, nvbo->kind, nvbo->comp,
> res);
> +	ret = nouveau_mem_new(drm, nvbo->kind, nvbo->comp, res);
>  	if (ret)
>  		return ret;
>  
>  	mem = nouveau_mem(*res);
>  	ttm_resource_init(bo, place, *res);
> -	ret = nvif_vmm_get(&mem->cli->vmm.vmm, PTES, false, 12, 0,
> +	ret = nvif_vmm_get(&drm->client.vmm.vmm, PTES, false, 12, 0,
>  			   (long)(*res)->size, &mem->vma[0]);
>  	if (ret) {
>  		nouveau_mem_del(man, *res);

