Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5A9897A0
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D2010E143;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mGt9mFQ/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2052.outbound.protection.outlook.com [40.107.244.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0659010E6AA
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:00:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weAVIFbnRd9n2n0rLiEK0y/G7SzRlg1xIiRFQgQZb2mkuooX7gQU5A3YRtpL9Id2g8aMhu6j5/8rLNyyn6b582mHL4wZpi5Og58Y8qf3YbwpoAlT8L8PVm1PCnjobJ02qSNI6Xq05xtqiCmdaVuoQfEBZaK0iBSMJDEOwnPfx2bCtQ2FzYZ/KwFOClJumDf1YFRFMx+2BF7B5e0BcXd+f7bynP2+DZcHyhuU/9Zo2NildIG/kTOx7thDzztpJx4bovzHrD1Wm7CNY3RjJSyeySiR6yItY8/AcTpYUoi3dccnvfECQGrjYmRhC9v9ouRC5OEtvK4o8Wij+Gq1YMUkqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UzfnjP9k1gd5uvRZsDzgAXMofPVCWeMv60xSbDXyl+U=;
 b=dK0hOoCedKYkW8f3n4KeLH2HS6Ud46hzuFDbQiRK4VT/1S69y6a0Aa2Psp5Zz7UpC0q1Gv7F3E4qW680E8ZU5/T71JzXagKPEqpk2kcPXitqzv2YwFSw5L5T/yCH0I9yie2ySa84sxYAH7ZwUAr1Vv7GtfvrHT1VSIThuNmkCDq9Xe1F3lrxQaNOMYlwLw9+132e5wU5H08+whGgqgtDuwmbWnyWwDwr3M19ziJNOCKJn23/woragiAAbjqtbjjtxxMjp8rGR8AwYyluBMylIANswHQQ2mqDmPGYSTT7Ix+mPEKF/EvcmrCzYkMnJWQT+Qz5ClCX9GZ2lz0M/0xFDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UzfnjP9k1gd5uvRZsDzgAXMofPVCWeMv60xSbDXyl+U=;
 b=mGt9mFQ/RU98fRwlYv3gqtN+Pi8zXNGRnjUNJfiBFhoakQmuIfiGqVn6pIDVtUjRQG+Vcf0rXh90RISp0v076/vg2GD6147cD/nv4LK6bcM03cslF82wwGS7BZPkdrJ+VmzWhrynza8jIIOi8m60pnfxUxT4HzOzePyd+GDv3H+8g/oJ+HllnhLxefSGmVhCjnyO10z23n6Btxi9o6hacyI19yk4Kig/G5urSRDgSsSMjetUIR5bTlmJJJhweE7KxrrBgXkcr4D+LjzjyqXqiWWH3bRfKpldFuKTys3m3c8OIRT9zy8Kp2XScjErZrlF9mawjrCW+yR7sNzZ1NHqEg==
Received: from BY3PR04CA0021.namprd04.prod.outlook.com (2603:10b6:a03:217::26)
 by SJ0PR12MB5661.namprd12.prod.outlook.com (2603:10b6:a03:422::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 18:00:21 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:217:cafe::69) by BY3PR04CA0021.outlook.office365.com
 (2603:10b6:a03:217::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Wed, 31 Jul 2024 18:00:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:00:21 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:00:04 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:00:04 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 11:00:03 -0700
Date: Wed, 31 Jul 2024 21:00:03 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 30/37] drm/nouveau: pass drm to nv50_dmac_create(),
 rather than device+disp
Message-ID: <20240731210003.00005809.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-31-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-31-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SJ0PR12MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bff6e55-6596-4b23-f5e6-08dcb18aa516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h3R3+yLbOmkoAsXpmcHkECKc2TpPGDyqYBiM8ZLO/qCFq69uOWKqALettSli?=
 =?us-ascii?Q?S/o0ZiqMCl1a2iT7dlJuZqAfTyHhDROgvn9ayGMhafhf6bmODK/lB+GSz+HI?=
 =?us-ascii?Q?uYfpVDBqgGqJ/MSaP+xQddLuosS1oGmDC1mVfY+VcdT0qACZe7pYs/O9puI4?=
 =?us-ascii?Q?KaCuKWxX6YyMhQSTBCDLN5vpQURCIx/vt9GEljQRxgqiMXPNNT/j+02pbL+O?=
 =?us-ascii?Q?K8CELg1dJzgnkCcqTUkKzATNljLl6eZa2Pu2hJ949NDImk4Ux7xFT3Gvt+ee?=
 =?us-ascii?Q?rOm6yN09HVzFT3mnw+aaEpmjGOzw0yzlKG4q1DTKG+frdYC6p7Pc0tk+8ZUz?=
 =?us-ascii?Q?TGc5t2yvRVC5XPpe9HY7dsstewTMbMPdi95mYCHLeYdn+vD6UYi+QFaY26XB?=
 =?us-ascii?Q?C5wtWTKSfXpwzp6gPL45bLuQApp5MBK4HqCGaabuAWD8hiLqvpyb3vdhusTd?=
 =?us-ascii?Q?iwBlWjWWDZ76fN5JQlWn/s8G7/JXIljeBrIOr0nmmafUfsoFfOJ1daHRVwP9?=
 =?us-ascii?Q?WSShHCM1GSGwpNA12CzJPcpMTCeRnD7AO21/CEHivIX4cH799eUqGW2Qrayf?=
 =?us-ascii?Q?Pkai6ne9bRfO4YvHVxA2sfh4v6unwjx1Ziz0Tma9AXkkHe/BwUAMkM6ThT8K?=
 =?us-ascii?Q?pRw/K1mr5zGLJ4YZV7nD5i/MdlCyuivRF+/WqU3DGRwciVf4PK8MkMSo1cTm?=
 =?us-ascii?Q?tB8JgSyDDLHp6ifZMnAE2fKoERmOwy5Qwh+x9teAx12+sI+ZzEbsncRxo42j?=
 =?us-ascii?Q?SNRd7+r7kbh2fZCy77YFndiKLKhT8X4CdShr4BUU/Y7qJqbwu9H8lXvUfDSk?=
 =?us-ascii?Q?oA/M2gwfnKe6AjcpcCKD3Z2NMxp+LcG6E9S+C03B9apzxdCOyY5YPY94a8TW?=
 =?us-ascii?Q?t2aFzWFLFAiKNhejAIgIGPNwgWqJHsqfUSTlR9e5UVyntLq5KHi72BbqhuGu?=
 =?us-ascii?Q?HV+rb+PmwR0o4qMlpUP9Dqc2Azf0yMDLdoNnpxJFzY4+WpVvIx/xYk1VlZbc?=
 =?us-ascii?Q?Oex72sBTrCPjSC+v7mFs8e7gPE+CdpPc0oX6aabl5EMgTvKTyUDu9Kfi3XLp?=
 =?us-ascii?Q?w4nMWvRrCn94bKAfnVswLU6lEZcJHMA19RnSdrPC4ZYdKuHuApcqL63aCGGR?=
 =?us-ascii?Q?hYqWyF8mbiQxrQYCPpBzeu5DAETu2IhJU9lvu8yCz19ZlHENnIDG8gntpODs?=
 =?us-ascii?Q?aF78WUZFS3j8eyeEwBwZOhUpixH5gq7HK990ESNvt825lVo5OdYrs5a9o+17?=
 =?us-ascii?Q?V+2jTjSR0FzwJIPAwgmD9tu8oI3TL8P38/Y4zB+Ecu3xGKHdstl3xDlQqxz2?=
 =?us-ascii?Q?TaniH60zTSEY/X776I+iwJyx8wFxq3OtkIQZwkTwtoWgFmrkxTc429dGoYrs?=
 =?us-ascii?Q?f8boHvxhG/8IAen+MvJDxTwJBNc8M4qs8AxhAKpp7oxyIqSyJOFl10YauV2V?=
 =?us-ascii?Q?nN2SThplKghj0cX6ElDeQ0uIlpfPTeyS?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:00:21.1866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bff6e55-6596-4b23-f5e6-08dcb18aa516
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5661
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

On Fri, 26 Jul 2024 14:38:21 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Both of these are stored in nouveau_drm already.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/base507c.c | 3 +--
>  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     | 8 ++++----
>  drivers/gpu/drm/nouveau/dispnv50/disp.h     | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/ovly507e.c | 2 +-
>  drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c | 3 +--
>  drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c | 2 +-
>  7 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
> b/drivers/gpu/drm/nouveau/dispnv50/base507c.c index
> 70c62b861276..e36a473f2075 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/base507c.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/base507c.c @@ -307,7 +307,6 @@
> base507c_new_(const struct nv50_wndw_func *func, const u32 *format,
> struct nvif_disp_chan_v0 args = { .id = head,
>  	};
> -	struct nouveau_display *disp = nouveau_display(drm->dev);
>  	struct nv50_disp *disp50 = nv50_disp(drm->dev);
>  	struct nv50_wndw *wndw;
>  	int ret;
> @@ -318,7 +317,7 @@ base507c_new_(const struct nv50_wndw_func *func,
> const u32 *format, if (*pwndw = wndw, ret)
>  		return ret;
>  
> -	ret = nv50_dmac_create(&drm->client.device,
> &disp->disp.object,
> +	ret = nv50_dmac_create(drm,
>  			       &oclass, head, &args, sizeof(args),
>  			       disp50->sync->offset, &wndw->wndw);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> b/drivers/gpu/drm/nouveau/dispnv50/core507d.c index
> e5bb5ca950c8..85845e3dc7ba 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/core507d.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/core507d.c @@ -166,7 +166,7 @@
> core507d_new_(const struct nv50_core_func *func, struct nouveau_drm
> *drm, return -ENOMEM; core->func = func;
>  
> -	ret = nv50_dmac_create(&drm->client.device,
> &disp->disp->object,
> +	ret = nv50_dmac_create(drm,
>  			       &oclass, 0, &args, sizeof(args),
>  			       disp->sync->offset, &core->chan);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c index
> cfdd533482f8..242887ab4ba0 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/disp.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c @@ -229,11 +229,12 @@
> static int nv50_dmac_vram_pushbuf = -1;
> module_param_named(kms_vram_pushbuf, nv50_dmac_vram_pushbuf, int,
> 0400); int
> -nv50_dmac_create(struct nvif_device *device, struct nvif_object
> *disp, +nv50_dmac_create(struct nouveau_drm *drm,
>  		 const s32 *oclass, u8 head, void *data, u32 size,
> s64 syncbuf, struct nv50_dmac *dmac)
>  {
> -	struct nouveau_cli *cli = (void *)device->object.client;
> +	struct nvif_device *device = &drm->device;
> +	struct nvif_object *disp = &drm->display->disp.object;
>  	struct nvif_disp_chan_v0 *args = data;
>  	u8 type = NVIF_MEM_COHERENT;
>  	int ret;
> @@ -253,8 +254,7 @@ nv50_dmac_create(struct nvif_device *device,
> struct nvif_object *disp, (nv50_dmac_vram_pushbuf < 0 &&
> device->info.family == NV_DEVICE_INFO_V0_PASCAL)) type |=
> NVIF_MEM_VRAM; 
> -	ret = nvif_mem_ctor_map(&cli->mmu, "kmsChanPush", type,
> 0x1000,
> -				&dmac->_push.mem);
> +	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type,
> 0x1000, &dmac->_push.mem); if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h
> b/drivers/gpu/drm/nouveau/dispnv50/disp.h index
> 5508a7cfd492..da3add95f354 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/disp.h +++
> b/drivers/gpu/drm/nouveau/dispnv50/disp.h @@ -95,7 +95,7 @@ struct
> nv50_outp_atom { } set, clr;
>  };
>  
> -int nv50_dmac_create(struct nvif_device *device, struct nvif_object
> *disp, +int nv50_dmac_create(struct nouveau_drm *,
>  		     const s32 *oclass, u8 head, void *data, u32
> size, s64 syncbuf, struct nv50_dmac *dmac);
>  void nv50_dmac_destroy(struct nv50_dmac *);
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
> b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c index
> 797c1e4e0eaa..73fcfb27c32c 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c @@ -159,7 +159,7 @@
> ovly507e_new_(const struct nv50_wndw_func *func, const u32 *format,
> if (*pwndw = wndw, ret) return ret;
>  
> -	ret = nv50_dmac_create(&drm->client.device,
> &disp->disp->object,
> +	ret = nv50_dmac_create(drm,
>  			       &oclass, 0, &args, sizeof(args),
>  			       disp->sync->offset, &wndw->wndw);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
> b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c index
> ee76b091d4ef..8cb5b79bacbf 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c @@ -71,10 +71,9 @@
> wimmc37b_init_(const struct nv50_wimm_func *func, struct nouveau_drm
> *drm, struct nvif_disp_chan_v0 args = { .id = wndw->id,
>  	};
> -	struct nv50_disp *disp = nv50_disp(drm->dev);
>  	int ret;
>  
> -	ret = nv50_dmac_create(&drm->client.device,
> &disp->disp->object,
> +	ret = nv50_dmac_create(drm,
>  			       &oclass, 0, &args, sizeof(args), -1,
>  			       &wndw->wimm);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c index
> b3deea5aca58..caf40977f455 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c @@ -363,7 +363,7 @@
> wndwc37e_new_(const struct nv50_wndw_func *func, struct nouveau_drm
> *drm, if (*pwndw = wndw, ret) return ret;
>  
> -	ret = nv50_dmac_create(&drm->client.device,
> &disp->disp->object,
> +	ret = nv50_dmac_create(drm,
>  			       &oclass, 0, &args, sizeof(args),
>  			       disp->sync->offset, &wndw->wndw);
>  	if (ret) {

