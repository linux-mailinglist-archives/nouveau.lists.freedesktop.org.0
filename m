Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB68D9897B9
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1237F10E35A;
	Sun, 29 Sep 2024 21:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jhA6pT2Y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2671910E649
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 17:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUDhVJjmVMlOUdDjkbT7S1iawFCx7dwlE/LjSy4LBMORt9yng/d/IaUzLd6y/Q15S3tLMlmTZghuh9weUrHNzzAcl3+5TKhQUJCwMHR/EYpKCByTXcVdhBW65FWxbrql21EbwOtSxesTubHYFqQor9/Bq5o/0iqEh4OXYJ/GcmYAI4pXKf5tldbb7hGScX9F0ddckcyvyoIG258eUrVYwzJg+YxfP2wJtv2LddTAdas01o5cyXnYrrraYxsf9gCOqv5Kd4aPG/VPevcxqH/vq1kRHNWtesyNUNlrEvVbWG8nLCfzvVAH/Q7LaftZYfKo58pCBbMsGbz8uGmUlT7Clw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kudl1rTPcj9qyV0gcCTucxrZa6QFKJ2MiQg9Tkzkrs=;
 b=MToKXMhmMKGorCit4TCnvOrqvVTnubI3XihFN93hSzzWCLf7yy9d5064WFZNu1GsI0pWkW4VEbuLNMtoXJyRetta827+AY11uGUS4yhZSAskIP9el3E6W2mwVJOXsHvJNsM+af/fIW+GXPVDEinB4f7gsJmHc7+hm0GrDJbppMhhRFRisZ4DG9fyeF0d9mpSuj0KDDGk/TakKn2E5A8VG1iuCV3wjaO4f3Lic3Z1VTYVeX3IScetDGxEp6Fxv1gXuNopwShJvsULEXDHDL3tFA/6gPKiBslS2doofoAsqHjIxJ4d1AZ59d8/2G3KhZDIJ5hb2P/N/kfT1/i96UX4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kudl1rTPcj9qyV0gcCTucxrZa6QFKJ2MiQg9Tkzkrs=;
 b=jhA6pT2YvR3U50en1jKn9mmoz9DgMRSqTp/IXnNWrwFFyzw91yLA3aPmgmV8/AErOO7RxPiX0e9j0BPysQK385CncjJFOdBKy7BEtAV+ovd+pRvSYGhIu3rVXx9i2ikbvdcKpFMcLUeJDAYQWz2Gbc75zEdKvk09uQYw3DImindnnFrndJnAMxgMVZiAK6O9CrKSrnwugE6iDLz71m7f8sBWsJAAEb70cIqa+5T9crjHjJfrF7Hj9L+8Y734aQkJuujwHGzwmltgE/YkOzUAat0OWNGziK1L9upECC+eFWPevQiLWBzBctEBTBOaR6B8TOcOPQFvNW5riDS2LYD+lg==
Received: from MN2PR01CA0024.prod.exchangelabs.com (2603:10b6:208:10c::37) by
 DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Wed, 31 Jul 2024 17:55:29 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:10c:cafe::37) by MN2PR01CA0024.outlook.office365.com
 (2603:10b6:208:10c::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Wed, 31 Jul 2024 17:55:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 17:55:28 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:55:04 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:55:04 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 10:55:03 -0700
Date: Wed, 31 Jul 2024 20:55:02 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 28/37] drm/nouveau: add nvif_mmu to nouveau_drm
Message-ID: <20240731205502.00001b17.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-29-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-29-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad76d77-f936-4de4-391e-08dcb189f680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LnOTYQJGUrtc/oBPPNgD4lkEjJwR9PsYUydVhWFebTtcn5mkg46AxSXpQZUN?=
 =?us-ascii?Q?lI7oj3RlqvUlJRonpg1qRGH+JC2iOx7I55TURe+KO+CutM1nVxze2TEoG159?=
 =?us-ascii?Q?PVpABRiA5N83ixypQpCUEDqJzy2DTiaSmv+e1BzlSblQE2QElk0Tb7jbJ98z?=
 =?us-ascii?Q?w/muRahmPdzRwjJSpPhl+k6x3xYFnhUwK+xQbbgiaRb6TeIXGb6Fz7NaJzkM?=
 =?us-ascii?Q?kjpH1KOLwBt5mwm891GGsTU8TawqrKAjhhaabliPV1mlGOxdJi6erlubKi1n?=
 =?us-ascii?Q?uS6j4ukfw9fGRJ+F98fNz+jMBN05ShUgXWUVN7SmGiLivw76x34Ug6/9zkZT?=
 =?us-ascii?Q?+DoRwStrLLYAZddEh88jhZTxgafYNv/6hj/Gfblxjx3MRQUHqzUhni+fBFxQ?=
 =?us-ascii?Q?so1ZMSaQevF6MBHDHxBgQBBOlbWo4dD1kMMvaa/KNjNhBXucgDajjJzYHqMA?=
 =?us-ascii?Q?tPcofSkgkHv0ECsmAp0/62tCe4IKo7Dy+/RyNdLH1FreVb/Ex7zhsDzBLKRq?=
 =?us-ascii?Q?xdAG9EZzkWhOqqfUQbDC+4EVvGjiLiXXx08As9mLfoAiowjSXN504sOUCMR+?=
 =?us-ascii?Q?WL0QvSHakL2E+gvDyeZPB3JvKQ8w05DO4lkgk2aFsK6cv5J9zlcUgtpV7Km+?=
 =?us-ascii?Q?Be6hI2xK+VgDJx4FSuuZyySq0NpO6onAyn0WZvWGW2Sl4XeCh51U6bBJ6CAc?=
 =?us-ascii?Q?/LmK/G+TbklyiW8YGFR6JiLar7ueQplmuC0j6xFiNapb6/Xyf0Tyk8a7y+uo?=
 =?us-ascii?Q?7oRPaMgCXwh1dkS/S10R5d8c5KY0wP9GZz7LZLkSq52TtCv1uOhmpX3d0NzI?=
 =?us-ascii?Q?fq5oS2EUUZ0c5tgO5unThlSEAUgsGSvfSKcCc4NhZWMtjAHT0mc4I14xGT93?=
 =?us-ascii?Q?LJxtBsdMfn9q+ge6OUuBF5khdaR58VHrNgmuUHj/Njj8iVvsI9LuMsaYjTLy?=
 =?us-ascii?Q?h12+uZssBxc6YR0VilaK0PMLiRsbKTSZDyj4KbFIJgDhqmjiQdXk8oQeyqTA?=
 =?us-ascii?Q?ij+59YJ4naFIw3s/J9shGBE6uiHVoMpyp6z0SxwdcGe4b24zu2hdryDWfUDU?=
 =?us-ascii?Q?ZT78dOLrvDCFCEY3Klvjcoz8qfZaGgJzCq39MEx2b/acDbSzdfyMVF4YSCyL?=
 =?us-ascii?Q?3+GWP7dFOShv7TU88sDN5b1P2kt0DzVXOrn5GO4CAPYEUBsSUJM+Y1ih7Qbf?=
 =?us-ascii?Q?POEBMlr5IHV/1SIRlenFH1LmGFNl36WWW7Q8my3kwQTu+biJTZruINmaHV0G?=
 =?us-ascii?Q?FhWxs+i4PXZasJAExc5j/iKObc/hWvEFXnE/gLabjQLx97N4UvsNCrpdQUyi?=
 =?us-ascii?Q?cJVxBigb6bEvN1pOoL6e1Rvt4q/JHD4bgPZEdd2Etk1LPmJHlF53QyGqEAWE?=
 =?us-ascii?Q?/fB0L+gwD76jzvOSd0Oi3PY8XTluXoYBgrapUxfE3YrB9ksYm8Com7Rb5xOg?=
 =?us-ascii?Q?Ig8IbctleGE/3m6sJprdWfoE53FBVlBH?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:55:28.1189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad76d77-f936-4de4-391e-08dcb189f680
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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

On Fri, 26 Jul 2024 14:38:19 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Also remove cli->mem? as there seems no users for it.

> This allocates a new nvif_mmu in nouveau_drm, and uses it for TTM
> backend memory allocations instead of nouveau_drm.master.mmu,
> which is removed by a later commit that removes nouveau_drm.master
> entirely.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 35
> ++++++++++++++++----------- drivers/gpu/drm/nouveau/nouveau_drv.h |
> 1 + drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
>  3 files changed, 28 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 16104a61b7b8..6b33d1d0a4eb 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -227,13 +227,6 @@
> nouveau_cli_init(struct nouveau_drm *drm, const char *sname, {}
>  	};
>  	static const struct nvif_mclass
> -	mmus[] = {
> -		{ NVIF_CLASS_MMU_GF100, -1 },
> -		{ NVIF_CLASS_MMU_NV50 , -1 },
> -		{ NVIF_CLASS_MMU_NV04 , -1 },
> -		{}
> -	};
> -	static const struct nvif_mclass
>  	vmms[] = {
>  		{ NVIF_CLASS_VMM_GP100, -1 },
>  		{ NVIF_CLASS_VMM_GM200, -1 },
> @@ -270,13 +263,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const
> char *sname, 
>  	cli->device.object.map.ptr = drm->device.object.map.ptr;
>  
> -	ret = nvif_mclass(&cli->device.object, mmus);
> -	if (ret < 0) {
> -		NV_PRINTK(err, cli, "No supported MMU class\n");
> -		goto done;
> -	}
> -
> -	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu",
> mmus[ret].oclass,
> +	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu",
> drm->mmu.object.oclass, &cli->mmu);
>  	if (ret) {
>  		NV_PRINTK(err, cli, "MMU allocation failed: %d\n",
> ret); @@ -717,6 +704,7 @@ nouveau_drm_device_del(struct nouveau_drm
> *drm) if (drm->dev)
>  		drm_dev_put(drm->dev);
>  
> +	nvif_mmu_dtor(&drm->mmu);
>  	nvif_device_dtor(&drm->device);
>  	nvif_client_dtor(&drm->master.base);
>  	nvif_parent_dtor(&drm->parent);
> @@ -728,6 +716,13 @@ static struct nouveau_drm *
>  nouveau_drm_device_new(const struct drm_driver *drm_driver, struct
> device *parent, struct nvkm_device *device)
>  {
> +	static const struct nvif_mclass
> +	mmus[] = {
> +		{ NVIF_CLASS_MMU_GF100, -1 },
> +		{ NVIF_CLASS_MMU_NV50 , -1 },
> +		{ NVIF_CLASS_MMU_NV04 , -1 },
> +		{}
> +	};
>  	struct nouveau_drm *drm;
>  	int ret;
>  
> @@ -766,6 +761,18 @@ nouveau_drm_device_new(const struct drm_driver
> *drm_driver, struct device *paren goto done;
>  	}
>  
> +	ret = nvif_mclass(&drm->device.object, mmus);
> +	if (ret < 0) {
> +		NV_ERROR(drm, "No supported MMU class\n");
> +		goto done;
> +	}
> +
> +	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu",
> mmus[ret].oclass, &drm->mmu);
> +	if (ret) {
> +		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
> +		goto done;
> +	}
> +
>  done:
>  	if (ret) {
>  		nouveau_drm_device_del(drm);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h index
> 89d7d940381b..c55665faf2c1 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drv.h +++
> b/drivers/gpu/drm/nouveau/nouveau_drv.h @@ -204,6 +204,7 @@ struct
> nouveau_drm { struct nvkm_device *nvkm;
>  	struct nvif_parent parent;
>  	struct nvif_device device;
> +	struct nvif_mmu mmu;
>  
>  	struct nouveau_cli master;
>  	struct nouveau_cli client;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c
> b/drivers/gpu/drm/nouveau/nouveau_mem.c index
> 25f31d5169e5..67f93cf753ba 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_mem.c +++
> b/drivers/gpu/drm/nouveau/nouveau_mem.c @@ -91,7 +91,7 @@
> nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt) struct
> nouveau_mem *mem = nouveau_mem(reg); struct nouveau_cli *cli =
> mem->cli; struct nouveau_drm *drm = cli->drm;
> -	struct nvif_mmu *mmu = &cli->mmu;
> +	struct nvif_mmu *mmu = &drm->mmu;
>  	struct nvif_mem_ram_v0 args = {};
>  	u8 type;
>  	int ret;
> @@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct
> ttm_tt *tt) args.dma = tt->dma_address;
>  
>  	mutex_lock(&drm->master.lock);
> -	ret = nvif_mem_ctor_type(mmu, "ttmHostMem",
> cli->mem->oclass, type, PAGE_SHIFT,
> +	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type,
> PAGE_SHIFT, reg->size,
>  				 &args, sizeof(args), &mem->mem);
>  	mutex_unlock(&drm->master.lock);
> @@ -128,14 +128,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool
> contig, u8 page) struct nouveau_mem *mem = nouveau_mem(reg);
>  	struct nouveau_cli *cli = mem->cli;
>  	struct nouveau_drm *drm = cli->drm;
> -	struct nvif_mmu *mmu = &cli->mmu;
> +	struct nvif_mmu *mmu = &drm->mmu;
>  	u64 size = ALIGN(reg->size, 1 << page);
>  	int ret;
>  
>  	mutex_lock(&drm->master.lock);
> -	switch (cli->mem->oclass) {
> +	switch (mmu->mem) {
>  	case NVIF_CLASS_MEM_GF100:
> -		ret = nvif_mem_ctor_type(mmu, "ttmVram",
> cli->mem->oclass,
> +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>  					 drm->ttm.type_vram, page,
> size, &(struct gf100_mem_v0) {
>  						.contig = contig,
> @@ -143,7 +143,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool
> contig, u8 page) &mem->mem);
>  		break;
>  	case NVIF_CLASS_MEM_NV50:
> -		ret = nvif_mem_ctor_type(mmu, "ttmVram",
> cli->mem->oclass,
> +		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
>  					 drm->ttm.type_vram, page,
> size, &(struct nv50_mem_v0) {
>  						.bankswz =
> mmu->kind[mem->kind] == 2,

