Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC29897B7
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B300A10E2B6;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pcRjyTRq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AB210E012
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 10:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r/PUQbjTwC0deAkm/PTMoMvUe7JJYwmlw3QCLdgr6jA+R4vNhPjmIIG4YcDcXo00XW0ZYgtVIjXoXjc22Y3l66FixAMvLgexYVYzPg/MO1JWW906JbQQ4QxodPlvQnlOoxYqjjKxeqPwlF2y659VrGvyE4+Qj8ewNl774b7aX1QJCe07+bUKMFpFDpGp2eqfh4g51oQVqRD3o7/MJNzw9b6BLOODtqRShpObG7fzKsvx6j+S9buPToVH+fT0WqFlW5YA7C4szNLk4G6btYmzTu5GR6WASLFH20axwm/EDSwwy8kFqXVYBSATd2zAx8Q+QOYrqVE7DedQNxq6fvNzrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkLQkq4UMstLBfWcI8rmZb3NVahPDmGxqzPrJREJwCw=;
 b=XGQTJJB7zM1Fcd3l/R1/iF4TsQ/LJu4s0wN55aYvlWXPeh2VTBYTAZ30SwBPK285uQqv9o/n+TuWiGtGlVxiQW4Q0FyC4L16p9uGDiKAr0HMLm2gZNMe6aFjG3DbfkfaM7LexGdpD6ZbOJELBpHft4WxjnfJMoNqhkkttoVYexejLaCRDdIRucQ8En/UGB1v2G/xMlTADDMmCCZAE+JI+jGr/Ifbj52bBYfAx8QXBLyXX8wPsxBrQ7Ei1UjEkEn47V5Np9d3K6AFWFuIXsVyUDdbbrXKO06Yhv1T6Tj669TzDQ1aR2LmhCkWlLOp3Rb5ZI23hhnZDD5gfCnS4b1RsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkLQkq4UMstLBfWcI8rmZb3NVahPDmGxqzPrJREJwCw=;
 b=pcRjyTRqvMYC6gFbzZ8CondN/87Wj/D+5DPR5h77Ls33VqlhaqDFzDnmHcjvUg6RJBFcbhUUU089W9kXB1ZdzVg8V2sCFLD3n1Fdj2x7fZ5cI9xIN45iA7L/VjGe3vLmVxKRRRmOZf5aK9AlEkw1T/UpdJ6gS1LpQWbZq+MeJgoPYoD43Q62kLZAv/bPmOJpKTYseNgFSL2LkT0D5mghH1nYNmkYvhIzeoeiB6hUZ3MxglSkaNkeEkg09J6jYalBVthspNK9/c/VALmqIHfsFLgBK4sL7f3Bsb63Adr9cxCVW+EY6p9ORHlHLAZqW9WT+YgThCA+fFaRF8VP9EsHaQ==
Received: from BL0PR0102CA0049.prod.exchangelabs.com (2603:10b6:208:25::26) by
 CH3PR12MB8727.namprd12.prod.outlook.com (2603:10b6:610:173::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 10:33:58 +0000
Received: from BL6PEPF0001AB73.namprd02.prod.outlook.com
 (2603:10b6:208:25:cafe::57) by BL0PR0102CA0049.outlook.office365.com
 (2603:10b6:208:25::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Wed, 31 Jul 2024 10:33:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB73.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 10:33:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:33:50 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 03:33:50 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 03:33:49 -0700
Date: Wed, 31 Jul 2024 13:33:49 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 05/37] drm/nouveau: store nvkm_device pointer in
 nouveau_drm
Message-ID: <20240731133349.00002161.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-6-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-6-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB73:EE_|CH3PR12MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: 772002e7-44bc-4b81-c87a-08dcb14c490f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+GUDcXT3mygQ4s9Rlu//nYajm1XqyOl0XL9PrEnjcEvbyz6y278cIAcLNcKX?=
 =?us-ascii?Q?7aCHM9CfKDejcitVO5kgcSnyoe3fmSI/W/ynY9pZtm1xLeoqQUg6mmrfLSf/?=
 =?us-ascii?Q?2NAj541H5RwayGFtdH9v796bEt2TbR7yANEq9UntE683PEG3cSnBY9jDRakD?=
 =?us-ascii?Q?wybP340oFo+V5r07YnIy8ZuDur2N7dw8AyPSYDOuOzVpJjBRW2g0ODvtWBBr?=
 =?us-ascii?Q?rbfDRkqX9GqtVewsPFeqDIDJO5LtSbgou3kYdlelacmaXaRpjaAoEetdXjcM?=
 =?us-ascii?Q?2F9DuI3YKigz9YK2ucAihj5MWdym+AXusSdb265ZXZXy2LKBwc4p9T2vtA4t?=
 =?us-ascii?Q?491pW4RG1ROlLjeI+s1g6jvqnNdkQNBvjc4HQatXl711OB7kuUj5mZaJvY4n?=
 =?us-ascii?Q?ofDWyMxbWOz1ZgApm7Cx9/0OCPbfl6EwTimOx+t5hnDqEpMdLEduz6U1n8Td?=
 =?us-ascii?Q?cvEV5Fmsu4DNKMO/rsjELmr5imkAAKUXX7aKL2UqUi6jT8uB/5bFYRETdLAI?=
 =?us-ascii?Q?m/YpM+EozMMq2uo9OM8WqZYkRGC6CnP4mJ6XUaVocS8Jl+WUFjT8Hx8Sxach?=
 =?us-ascii?Q?zsHLWcXA4fH6vY9CxaXcHWZXgPIzzTQGwXcG+Pz4D3p3PXOcDnLHt/HWULjH?=
 =?us-ascii?Q?/zrvR3IZndh1gKAwgwtU0KO4iMgFf4++kxXUl6Krp8vopr1mfNNL/JebMJTe?=
 =?us-ascii?Q?tlJoVpzjy3hicAQ5oFqItUh8VMpFM1qWEX3Ygonkp3OA/Noj6bx10Ww3s++O?=
 =?us-ascii?Q?7aZD8/2pPZqU6Oca4ZG+EUPnZpUPcqSa8f8UnPY5/fYeUtjTVGTjEq0k8yZN?=
 =?us-ascii?Q?687Wiidz0Q9/sTe3Tkhx4qzsSMl/TFolmf15RB1c7jwtmy/ZzlZC6I3uvZ//?=
 =?us-ascii?Q?h41S2l5nI8eJlJ7fcC4+kJcd82Vvfjxsfd4+t/kF5Dn0BMaZM1yvzfF2vuK1?=
 =?us-ascii?Q?4GACrJbDFk86Oot3bIZ2OImTk/BkKzy0aSwZOLpVOQP2uAUwJFln/gM+a59R?=
 =?us-ascii?Q?8ZUE92p5SEih5FiNdNKxY2mvhwUyIKG7Ol+W16s/gBkw50XbxUEmWzoWDaEh?=
 =?us-ascii?Q?eQ/EPeVCaYtTuMC0AP6q/xafuKISlmF56SLkhlGByLpcCE5z/VwCfNq6lJyy?=
 =?us-ascii?Q?K2AmpshcBATt282kOboDVkXwKpeiUcv1DtW8xJpOaix/xEM7oHDiEQ7yPS9B?=
 =?us-ascii?Q?qO07iXOhHrTFbFnkqN3f/gjwFwmHySblqFJ4HSx3GPiq4EIzZ6FhcLqvdNWx?=
 =?us-ascii?Q?ZLjjJCgPyfiEvldQyZPull6LzqCO8ku+hIBtyB1mB+ZeZGLiJiIYffbNammt?=
 =?us-ascii?Q?ihKb7EGJBTTCsm/ebpiHXxoMQe0Yml1XeJQ71kpG8KkTIZb6uQvHJiIbzZMg?=
 =?us-ascii?Q?K1bebLskK43hgLjWVD/DNm6aRmltgTF244sz3l9eEKkTxrnZdj1Cky2mr3b0?=
 =?us-ascii?Q?EOhQ29KBXCd97A8DBDn35iiyndJtp3u+?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:33:57.9450 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 772002e7-44bc-4b81-c87a-08dcb14c490f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB73.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8727
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

On Fri, 26 Jul 2024 14:37:56 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> There's various different places in the drm code that get at the
> nvkm_device via various creative (and not very type-safe) means.
> 
> One of those being via nvif_device.object.priv.
> 
> Another patch series is going to entirely remove the ioctl-like
> interfaces beween the drm code and nvkm, and that field will no
> longer exist.
> 
> This provides a safer replacement for accessing the nvkm_device,
> and will used more in upcoming patches to cleanup other cases.
> 
> v2:
> - fixup printk macros to not oops if used before client ctor
> 

What is the change in this patch series cause the NV_PRINTK marcos
to oops? Was thinking the justification of the NV_PRINTK_().

> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c |  8 +++-----
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 16 ++++++++++------
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> f372bf2954aa..140e27af0d64 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -751,6 +751,8 @@
> nouveau_drm_device_new(const struct drm_driver *drm_driver, struct
> device *paren if (!drm) return ERR_PTR(-ENOMEM);
>  
> +	drm->nvkm = device;
> +
>  	drm->dev = drm_dev_alloc(drm_driver, parent);
>  	if (IS_ERR(drm->dev)) {
>  		ret = PTR_ERR(drm->dev);
> @@ -888,14 +890,10 @@ static int nouveau_drm_probe(struct pci_dev
> *pdev, void
>  nouveau_drm_device_remove(struct nouveau_drm *drm)
>  {
> -	struct nvkm_client *client;
> -	struct nvkm_device *device;
> +	struct nvkm_device *device = drm->nvkm;
>  
>  	drm_dev_unplug(drm->dev);
>  
> -	client = nvxx_client(&drm->client.base);
> -	device = nvkm_device_find(client->device);
> -
>  	nouveau_drm_device_fini(drm);
>  	nouveau_drm_device_del(drm);
>  	nvkm_device_del(&device);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h index
> 7e624c587fc0..e7d072a9a477 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drv.h +++
> b/drivers/gpu/drm/nouveau/nouveau_drv.h @@ -201,6 +201,7 @@
> u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> #include <nvif/parent.h> 
>  struct nouveau_drm {
> +	struct nvkm_device *nvkm;
>  	struct nvif_parent parent;
>  	struct nouveau_cli master;
>  	struct nouveau_cli client;
> @@ -332,18 +333,21 @@ void nouveau_drm_device_remove(struct
> nouveau_drm *); dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name,
> ##a);                \ } while(0)
>  
> -#define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
> -#define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
> -#define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
> -#define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
> +#define NV_PRINTK_(l,drm,f,a...) do {             \
> +	dev_##l((drm)->nvkm->dev, "drm: "f, ##a); \
> +} while(0)
> +#define NV_FATAL(drm,f,a...) NV_PRINTK_(crit, (drm), f, ##a)
> +#define NV_ERROR(drm,f,a...) NV_PRINTK_(err, (drm), f, ##a)
> +#define NV_WARN(drm,f,a...) NV_PRINTK_(warn, (drm), f, ##a)
> +#define NV_INFO(drm,f,a...) NV_PRINTK_(info, (drm), f, ##a)
>  
>  #define NV_DEBUG(drm,f,a...) do {
>           \ if (drm_debug_enabled(DRM_UT_DRIVER))
>              \
> -		NV_PRINTK(info, &(drm)->client, f, ##a);
>           \
> +		NV_PRINTK_(info, (drm), f, ##a);
>           \ } while(0)
>  #define NV_ATOMIC(drm,f,a...) do {
>           \ if (drm_debug_enabled(DRM_UT_ATOMIC))
>              \
> -		NV_PRINTK(info, &(drm)->client, f, ##a);
>           \
> +		NV_PRINTK_(info, (drm), f, ##a);
>           \ } while(0)
>  
>  #define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)

