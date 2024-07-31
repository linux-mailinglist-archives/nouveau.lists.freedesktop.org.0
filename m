Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183198979F
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE1210E0CF;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PNvXN01u";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC7B10E6AA
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:21:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w00//KbOCoINqE/nI2h9XmNLgF/0ybDHHKXKZ9TjV5lOxc/RAlkPJ4WhAhVmPH3l2ytjEC7K5dmfjgUg8x6Q1HtZ7GZUZ+5xGUHSRFZ5+DcSiie6H1jn9fLEb46YL8JnwZLZMPRZlCMli7Idpn9+Bc6yw2qTzIcLdzrX9ZA/VQzb2tBub1fg97phf8G7F7rHrEC7FnC7Zmdpk1xKiOxBurAoBYAiY5lvcSLEay7nROviTgXcvmSTSqEQQx41yVRR4ijBusQEStg3xZhkwspcf8/DgKWK94kSrKFvCKqYTfo/tfAmVhg7XvoD7yfG9q+NMV6fiX4juItgjcZyJsY5Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OuB64XC+NBuMtCh2ypemPQmhUePtHkiRkWWeBL+EAM=;
 b=i2xr+buSNHwIQqubxTzErOj4GgqBZqKHlSLtbPVCG9D3OvtbcUY9daiGF657mxAH98qu3VXt0ARFGrb0t1Q3qT4O/hMokvvhDOw/FYdSX6soPxxg4BceGLaqEJMsEtiJ5VqYtgwRr/Ii/NjigvMmXDg/KKvcepBc8fg+Mo6+x7Ade0CeH8iqEeODx7kxpju6lAEbQDvTH4EQ5YaHPFij6G/w/DKZ/8ttr6qyvNwepcrqpiLL3HX14FGGUELfrilEB8zYzYIVW5RJpG3d6jDadbEbGmjIGiYFFYQwAYR79IeVGDFxaimM3aprtAFzJwhZN8TkxyQBsF96hRLVjqCi0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OuB64XC+NBuMtCh2ypemPQmhUePtHkiRkWWeBL+EAM=;
 b=PNvXN01uVgteQG/eulYzx2Eueh07JTWKGeKgxdw2nQJWyuaDykjUQyG/nc/Q0EgK4KnESW4rZ2IOw0cbSltOVNo7IbNT7ee2N+DK74MCrXpD0DRhSoLAZORAjY7kA32du+8/YRtUmyXR4QGJuW5voMUSlIjDFwwW0OeBt0YG78PdB9xvUpo2QEPwUnEJofNK7UI0Kvc+sqIZIdHKFioUPj3AbqH0l7sGDtSCvaXnv2E7tHg5MxlQXLJwtGhZPu5171GWwpuEP6ohmHPETqqLmT95nGv8iCNyN7iX1ZzLLVRU9802WnPDbqhXmOBdNFWmCy0zVFW7TOghFjz9P3oJfw==
Received: from PH0PR07CA0060.namprd07.prod.outlook.com (2603:10b6:510:e::35)
 by PH0PR12MB7471.namprd12.prod.outlook.com (2603:10b6:510:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 18:21:26 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:e:cafe::3f) by PH0PR07CA0060.outlook.office365.com
 (2603:10b6:510:e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Wed, 31 Jul 2024 18:21:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:21:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:21:14 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 11:21:14 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 11:21:13 -0700
Date: Wed, 31 Jul 2024 21:21:13 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 35/37] drm/nouveau: remove push pointer from
 nouveau_channel
Message-ID: <20240731212113.000078cb.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-36-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-36-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|PH0PR12MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f79dc2-4de3-4293-9d73-08dcb18d972a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4nEiy4qXZD8mTsNXxfa7zAefHLU7TJDrzNPKRm8D84830S++9tF9Me20Jaej?=
 =?us-ascii?Q?8txGhJH5oUJN0JGkjSA8yNkFeVsGaDp/j33EKEMblfIRalBFMjI09kLM1/e+?=
 =?us-ascii?Q?kO/CBvPc7Z2m2zGp9N6aHM/l+Kce1Zjv942h/W6IZUipGXw78FHQGPxztl0N?=
 =?us-ascii?Q?O4HmYbWlqkmOWO5HDDCgBizCxfi7rdHNzTHfXOyRHRt7yBMY/XjS2lrQTp0u?=
 =?us-ascii?Q?vP2BTioKyeolY6PdyBEGTueNx7SlWpQbQ7IkqkOVosu9yeHEuFknvXV43lIn?=
 =?us-ascii?Q?WEqf07LRMEwGQ0kHLens9Ul+TNr5nup2DUfQBHBXDXYxkKCE6M+NQeBEww8v?=
 =?us-ascii?Q?t4KtF/oFcT50WgFc7FIl1ulv065FVfTxKLa04q7VRMpfJSuod3DZUy7L8DpW?=
 =?us-ascii?Q?VQI/LK+XzU58tNQ1GC7b9XXpGtA5VMMryhzYY5UtJ01P5lCukxf49cl4ztuC?=
 =?us-ascii?Q?/Dy589bTtqYhJBnlrXh/7j2eRAlP7J8nUpImUR7T+Iay/SwcnQQOmR9nPjO1?=
 =?us-ascii?Q?OiOoJ8YOCX3l0iLzr6BAVKJYtDSf9UeMzdeJCjO5iXkZFFjCJHCFAP33WlEm?=
 =?us-ascii?Q?2MfSpDNabIwewtgZfOl/drk7FWxnHcixLzQL/3nD28mqflpUn4ibP4aRLPx0?=
 =?us-ascii?Q?RGeIltU6PkVh1WejKzO5V9/00X/Sy86xvzsfvEVXLZNQ9nLyFeZRJehL+1lB?=
 =?us-ascii?Q?fXVriiK0Wb+FfoIREDBVXeNUIaehXhLKRh4UG91NI1Q7qwCsvLFBmw7WcPqj?=
 =?us-ascii?Q?cREosvgqbfW27WC/LpQlOLGnlINRWltGlBBgn/lJP/+Qx5bhQnOj7xRQJ69h?=
 =?us-ascii?Q?ummJLChPqIQYHfO7ISZA/IH55oEQHsV+YaWCy/31spvT33vxTlWF5y+iM9YT?=
 =?us-ascii?Q?9xXVYgGyNajYkqO/PX4cWwEi/lCrwcdQJCpb3zEk3jgPlODX/KS34SayN9Rj?=
 =?us-ascii?Q?2FtRGoZwccVpZ0Gn33I+hrJOZ9sRGHJg8TmQUdZ5794Y03TqAXo7x8nIL0Z1?=
 =?us-ascii?Q?Ucar9euT8aorrYyjiwoEyigtRcOvuXXAoGbtJ/9fXsbB5jEp1FByIWIJZ9Os?=
 =?us-ascii?Q?0Pnrw+bQ7vcb9JxASqcOnf6/ln6wrB4RPIhHoKP2dKc8KGWfM7qnwWfpm1JO?=
 =?us-ascii?Q?5qoYH6fgy7JJjMKpP0ZRJr5Zm9OWBMgQmHnDpn9slVHM2ePZ98Z+0xesQZb8?=
 =?us-ascii?Q?Pn/zFVm2H5O1bJe6pAD7EFdmge84FzlyqYGjD9rR6B+GJWK7wKKLgi5OrIvi?=
 =?us-ascii?Q?jZC01kn84QGY2PdDeiKMqBvY6wA9+6725bldcmhDCPN+e6FKP84kRzFF4cB5?=
 =?us-ascii?Q?8GZxRJximVhaNNA7iQ3e4M7GEcNseqcWV1cnOsrJklJevQRES/ZYtxtevjoq?=
 =?us-ascii?Q?GulI7oqom3cPlmedK1HyVIu5jwZIZrvJbEz6EN6yVzmuKqqWGaDbI+Fm0FsU?=
 =?us-ascii?Q?sxiuZaBqrSUaYuYmP73KINWDRUafZNM1?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:21:26.3331 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f79dc2-4de3-4293-9d73-08dcb18d972a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7471
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

On Fri, 26 Jul 2024 14:38:26 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

With some trivial coding style fixed,
Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The struct itself lives in nouveau_channel already, just use that.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c  |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_bo74c1.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo85b5.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo9039.c |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_bo90b5.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_boa0b5.c |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_chan.c   | 41
> ++++++++++++------------ drivers/gpu/drm/nouveau/nouveau_chan.h   |
> 3 +- drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_drm.c    |  3 +-
>  drivers/gpu/drm/nouveau/nouveau_gem.c    | 14 ++++----
>  drivers/gpu/drm/nouveau/nv04_fence.c     |  2 +-
>  drivers/gpu/drm/nouveau/nv10_fence.c     |  2 +-
>  drivers/gpu/drm/nouveau/nv17_fence.c     |  4 +--
>  drivers/gpu/drm/nouveau/nv84_fence.c     |  4 +--
>  drivers/gpu/drm/nouveau/nvc0_fence.c     |  4 +--
>  18 files changed, 53 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c index
> 33ff21d40cfb..67146f1e8482 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv04/crtc.c +++
> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c @@ -1115,7 +1115,7 @@
> nv04_page_flip_emit(struct nouveau_channel *chan, struct
> nouveau_fence_chan *fctx = chan->fence; struct nouveau_drm *drm =
> chan->cli->drm; struct drm_device *dev = drm->dev;
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	unsigned long flags;
>  	int ret;
>  
> @@ -1173,7 +1173,7 @@ nv04_crtc_page_flip(struct drm_crtc *crtc,
> struct drm_framebuffer *fb, if (!chan)
>  		return -ENODEV;
>  	cli = chan->cli;
> -	push = chan->chan.push;
> +	push = &chan->chan.push;
>  
>  	s = kzalloc(sizeof(*s), GFP_KERNEL);
>  	if (!s)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> b/drivers/gpu/drm/nouveau/nouveau_bo0039.c index
> 2babc6c47241..0b6758e024a1 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo0039.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo0039.c @@ -47,7 +47,7 @@ int
>  nv04_bo_move_m2mf(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
>  	u32 src_offset = old_reg->start << PAGE_SHIFT;
>  	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
> @@ -96,7 +96,7 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan,
> struct ttm_buffer_object *bo, int
>  nv04_bo_move_init(struct nouveau_channel *chan, u32 handle)
>  {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret;
>  
>  	ret = PUSH_WAIT(push, 4);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> b/drivers/gpu/drm/nouveau/nouveau_bo5039.c index
> 0a6b1fce1108..c3de17548d97 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo5039.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo5039.c @@ -40,7 +40,7 @@
> nv50_bo_move_m2mf(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) { struct nouveau_mem *mem =
> nouveau_mem(old_reg);
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	u64 length = new_reg->size;
>  	u64 src_offset = mem->vma[0].addr;
>  	u64 dst_offset = mem->vma[1].addr;
> @@ -136,7 +136,7 @@ nv50_bo_move_m2mf(struct nouveau_channel *chan,
> struct ttm_buffer_object *bo, int
>  nv50_bo_move_init(struct nouveau_channel *chan, u32 handle)
>  {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret;
>  
>  	ret = PUSH_WAIT(push, 6);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c
> b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c index
> 9b7ba31fae13..e6ef79de2498 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo74c1.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo74c1.c @@ -37,7 +37,7 @@
> nv84_bo_move_exec(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) { struct nouveau_mem *mem =
> nouveau_mem(old_reg);
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret;
>  
>  	ret = PUSH_WAIT(push, 7);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c
> b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c index
> a15a38a87a95..c4861d073ad4 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo85b5.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo85b5.c @@ -41,7 +41,7 @@
> nva3_bo_move_copy(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) { struct nouveau_mem *mem =
> nouveau_mem(old_reg);
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	u64 src_offset = mem->vma[0].addr;
>  	u64 dst_offset = mem->vma[1].addr;
>  	u32 page_count = PFN_UP(new_reg->size);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo9039.c
> b/drivers/gpu/drm/nouveau/nouveau_bo9039.c index
> d2bb2687d401..ad82269c7725 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo9039.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo9039.c @@ -38,7 +38,7 @@ int
>  nvc0_bo_move_m2mf(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	struct nouveau_mem *mem = nouveau_mem(old_reg);
>  	u64 src_offset = mem->vma[0].addr;
>  	u64 dst_offset = mem->vma[1].addr;
> @@ -86,7 +86,7 @@ nvc0_bo_move_m2mf(struct nouveau_channel *chan,
> struct ttm_buffer_object *bo, int
>  nvc0_bo_move_init(struct nouveau_channel *chan, u32 handle)
>  {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret;
>  
>  	ret = PUSH_WAIT(push, 2);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c
> b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c index
> 4618f4f5ab56..5eaeef9d25e4 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo90b5.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo90b5.c @@ -34,7 +34,7 @@
> nvc0_bo_move_copy(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) { struct nouveau_mem *mem =
> nouveau_mem(old_reg);
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	u64 src_offset = mem->vma[0].addr;
>  	u64 dst_offset = mem->vma[1].addr;
>  	u32 page_count = PFN_UP(new_reg->size);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c
> b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c index
> 07a5c6302c98..dff2ae0e1e45 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_boa0b5.c +++
> b/drivers/gpu/drm/nouveau/nouveau_boa0b5.c @@ -39,7 +39,7 @@
> nve0_bo_move_copy(struct nouveau_channel *chan, struct
> ttm_buffer_object *bo, struct ttm_resource *old_reg, struct
> ttm_resource *new_reg) { struct nouveau_mem *mem =
> nouveau_mem(old_reg);
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret;
>  
>  	ret = PUSH_WAIT(push, 10);
> @@ -78,7 +78,7 @@ nve0_bo_move_copy(struct nouveau_channel *chan,
> struct ttm_buffer_object *bo, int
>  nve0_bo_move_init(struct nouveau_channel *chan, u32 handle)
>  {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret;
>  
>  	ret = PUSH_WAIT(push, 2);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c index
> e95b8092dae3..02eff65d7231 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.c +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.c @@ -117,24 +117,24 @@
> nouveau_channel_del(struct nouveau_channel **pchan) static void
>  nouveau_channel_kick(struct nvif_push *push)
>  {
> -	struct nouveau_channel *chan = container_of(push,
> typeof(*chan), chan._push);
> -	chan->dma.cur = chan->dma.cur + (chan->chan._push.cur -
> chan->chan._push.bgn);
> +	struct nouveau_channel *chan = container_of(push,
> typeof(*chan), chan.push);

May one extra empty line after the defs. So does
nouveau_channel_wait().

> +	chan->dma.cur = chan->dma.cur + (chan->chan.push.cur -
> chan->chan.push.bgn); FIRE_RING(chan);
> -	chan->chan._push.bgn = chan->chan._push.cur;
> +	chan->chan.push.bgn = chan->chan.push.cur;
>  }
>  
>  static int
>  nouveau_channel_wait(struct nvif_push *push, u32 size)
>  {
> -	struct nouveau_channel *chan = container_of(push,
> typeof(*chan), chan._push);
> +	struct nouveau_channel *chan = container_of(push,
> typeof(*chan), chan.push); int ret;
> -	chan->dma.cur = chan->dma.cur + (chan->chan._push.cur -
> chan->chan._push.bgn);
> +	chan->dma.cur = chan->dma.cur + (chan->chan.push.cur -
> chan->chan.push.bgn); ret = RING_SPACE(chan, size);
>  	if (ret == 0) {
> -		chan->chan._push.bgn =
> chan->chan._push.mem.object.map.ptr;
> -		chan->chan._push.bgn = chan->chan._push.bgn +
> chan->dma.cur;
> -		chan->chan._push.cur = chan->chan._push.bgn;
> -		chan->chan._push.end = chan->chan._push.bgn + size;
> +		chan->chan.push.bgn =
> chan->chan.push.mem.object.map.ptr;
> +		chan->chan.push.bgn = chan->chan.push.bgn +
> chan->dma.cur;
> +		chan->chan.push.cur = chan->chan.push.bgn;
> +		chan->chan.push.end = chan->chan.push.bgn + size;
>  	}
>  	return ret;
>  }
> @@ -176,13 +176,12 @@ nouveau_channel_prep(struct nouveau_cli *cli,
>  		return ret;
>  	}
>  
> -	chan->chan._push.mem.object.parent = cli->base.object.parent;
> -	chan->chan._push.mem.object.client = &cli->base;
> -	chan->chan._push.mem.object.name = "chanPush";
> -	chan->chan._push.mem.object.map.ptr =
> chan->push.buffer->kmap.virtual;
> -	chan->chan._push.wait = nouveau_channel_wait;
> -	chan->chan._push.kick = nouveau_channel_kick;
> -	chan->chan.push = &chan->chan._push;
> +	chan->chan.push.mem.object.parent = cli->base.object.parent;
> +	chan->chan.push.mem.object.client = &cli->base;
> +	chan->chan.push.mem.object.name = "chanPush";
> +	chan->chan.push.mem.object.map.ptr =
> chan->push.buffer->kmap.virtual;
> +	chan->chan.push.wait = nouveau_channel_wait;
> +	chan->chan.push.kick = nouveau_channel_kick;
>  
>  	/* create dma object covering the *entire* memory space that
> the
>  	 * pushbuf lives in, this is because the GEM code requires
> that @@ -461,12 +460,12 @@ nouveau_channel_init(struct
> nouveau_channel *chan, u32 vram, u32 gart) chan->dma.cur =
> chan->dma.put; chan->dma.free = chan->dma.max - chan->dma.cur;
>  
> -	ret = PUSH_WAIT(chan->chan.push, NOUVEAU_DMA_SKIPS);
> +	ret = PUSH_WAIT(&chan->chan.push, NOUVEAU_DMA_SKIPS);
>  	if (ret)
>  		return ret;
>  
>  	for (i = 0; i < NOUVEAU_DMA_SKIPS; i++)
> -		PUSH_DATA(chan->chan.push, 0x00000000);
> +		PUSH_DATA(&chan->chan.push, 0x00000000);
>  
>  	/* allocate software object class (used for fences on <=
> nv05) */ if (device->info.family < NV_DEVICE_INFO_V0_CELSIUS) {
> @@ -476,12 +475,12 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart) if (ret)
>  			return ret;
>  
> -		ret = PUSH_WAIT(chan->chan.push, 2);
> +		ret = PUSH_WAIT(&chan->chan.push, 2);
>  		if (ret)
>  			return ret;
>  
> -		PUSH_NVSQ(chan->chan.push, NV_SW, 0x0000,
> chan->nvsw.handle);
> -		PUSH_KICK(chan->chan.push);
> +		PUSH_NVSQ(&chan->chan.push, NV_SW, 0x0000,
> chan->nvsw.handle);
> +		PUSH_KICK(&chan->chan.push);
>  	}
>  
>  	/* initialise synchronisation */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h
> b/drivers/gpu/drm/nouveau/nouveau_chan.h index
> 3ce9832c9528..016f668c0bc1 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.h +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.h @@ -8,8 +8,7 @@ struct
> nvif_device; 
>  struct nouveau_channel {
>  	struct {
> -		struct nvif_push _push;
> -		struct nvif_push *push;
> +		struct nvif_push push;
>  	} chan;
>  
>  	struct nouveau_cli *cli;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c index
> 7b3b8f4630a2..d2604d0d2d07 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_dmem.c +++
> b/drivers/gpu/drm/nouveau/nouveau_dmem.c @@ -443,7 +443,7 @@
> nvc0b5_migrate_copy(struct nouveau_drm *drm, u64 npages, enum
> nouveau_aper dst_aper, u64 dst_addr, enum nouveau_aper src_aper, u64
> src_addr) {
> -	struct nvif_push *push = drm->dmem->migrate.chan->chan.push;
> +	struct nvif_push *push = &drm->dmem->migrate.chan->chan.push;
>  	u32 launch_dma = 0;
>  	int ret;
>  
> @@ -516,7 +516,7 @@ static int
>  nvc0b5_migrate_clear(struct nouveau_drm *drm, u32 length,
>  		     enum nouveau_aper dst_aper, u64 dst_addr)
>  {
> -	struct nvif_push *push = drm->dmem->migrate.chan->chan.push;
> +	struct nvif_push *push = &drm->dmem->migrate.chan->chan.push;
>  	u32 launch_dma = 0;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> ca63d13efb25..ac7c60fb14d3 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -382,7 +382,8 @@
> nouveau_accel_gr_init(struct nouveau_drm *drm) }
>  
>  		if (ret == 0) {
> -			struct nvif_push *push =
> drm->channel->chan.push;
> +			struct nvif_push *push =
> &drm->channel->chan.push; +
>  			ret = PUSH_WAIT(push, 8);
>  			if (ret == 0) {
>  				if (device->info.chipset >= 0x11) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c index
> 7b6f611a28b1..4a8108f33319 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_gem.c +++
> b/drivers/gpu/drm/nouveau/nouveau_gem.c @@ -871,7 +871,7 @@
> nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data, }
>  	} else
>  	if (drm->client.device.info.chipset >= 0x25) {
> -		ret = PUSH_WAIT(chan->chan.push, req->nr_push * 2);
> +		ret = PUSH_WAIT(&chan->chan.push, req->nr_push * 2);
>  		if (ret) {
>  			NV_PRINTK(err, cli, "cal_space: %d\n", ret);
>  			goto out;
> @@ -881,11 +881,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device
> *dev, void *data, struct nouveau_bo *nvbo = (void *)(unsigned long)
>  				bo[push[i].bo_index].user_priv;
>  
> -			PUSH_CALL(chan->chan.push, nvbo->offset +
> push[i].offset);
> -			PUSH_DATA(chan->chan.push, 0);
> +			PUSH_CALL(&chan->chan.push, nvbo->offset +
> push[i].offset);
> +			PUSH_DATA(&chan->chan.push, 0);
>  		}
>  	} else {
> -		ret = PUSH_WAIT(chan->chan.push, req->nr_push * (2 +
> NOUVEAU_DMA_SKIPS));
> +		ret = PUSH_WAIT(&chan->chan.push, req->nr_push * (2
> + NOUVEAU_DMA_SKIPS)); if (ret) {
>  			NV_PRINTK(err, cli, "jmp_space: %d\n", ret);
>  			goto out;
> @@ -914,10 +914,10 @@ nouveau_gem_ioctl_pushbuf(struct drm_device
> *dev, void *data, push[i].length - 8) / 4, cmd);
>  			}
>  
> -			PUSH_JUMP(chan->chan.push, nvbo->offset +
> push[i].offset);
> -			PUSH_DATA(chan->chan.push, 0);
> +			PUSH_JUMP(&chan->chan.push, nvbo->offset +
> push[i].offset);
> +			PUSH_DATA(&chan->chan.push, 0);
>  			for (j = 0; j < NOUVEAU_DMA_SKIPS; j++)
> -				PUSH_DATA(chan->chan.push, 0);
> +				PUSH_DATA(&chan->chan.push, 0);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/nouveau/nv04_fence.c
> b/drivers/gpu/drm/nouveau/nv04_fence.c index
> cdbc75e3d1f6..fa5c6029f783 100644 ---
> a/drivers/gpu/drm/nouveau/nv04_fence.c +++
> b/drivers/gpu/drm/nouveau/nv04_fence.c @@ -39,7 +39,7 @@ struct
> nv04_fence_priv { static int
>  nv04_fence_emit(struct nouveau_fence *fence)
>  {
> -	struct nvif_push *push =
> unrcu_pointer(fence->channel)->chan.push;
> +	struct nvif_push *push =
> &unrcu_pointer(fence->channel)->chan.push; int ret = PUSH_WAIT(push,
> 2); if (ret == 0) {
>  		PUSH_NVSQ(push, NV_SW, 0x0150, fence->base.seqno);
> diff --git a/drivers/gpu/drm/nouveau/nv10_fence.c
> b/drivers/gpu/drm/nouveau/nv10_fence.c index
> 1a53b8b80467..8c73f40e3bda 100644 ---
> a/drivers/gpu/drm/nouveau/nv10_fence.c +++
> b/drivers/gpu/drm/nouveau/nv10_fence.c @@ -32,7 +32,7 @@
>  int
>  nv10_fence_emit(struct nouveau_fence *fence)
>  {
> -	struct nvif_push *push = fence->channel->chan.push;
> +	struct nvif_push *push = &fence->channel->chan.push;
>  	int ret = PUSH_WAIT(push, 2);
>  	if (ret == 0) {
>  		PUSH_MTHD(push, NV06E, SET_REFERENCE,
> fence->base.seqno); diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c
> b/drivers/gpu/drm/nouveau/nv17_fence.c index
> 51fcac894146..d09bfd11369f 100644 ---
> a/drivers/gpu/drm/nouveau/nv17_fence.c +++
> b/drivers/gpu/drm/nouveau/nv17_fence.c @@ -39,8 +39,8 @@
> nv17_fence_sync(struct nouveau_fence *fence, struct nouveau_cli *cli
> = prev->cli; struct nv10_fence_priv *priv = cli->drm->fence;
>  	struct nv10_fence_chan *fctx = chan->fence;
> -	struct nvif_push *ppush = prev->chan.push;
> -	struct nvif_push *npush = chan->chan.push;
> +	struct nvif_push *ppush = &prev->chan.push;
> +	struct nvif_push *npush = &chan->chan.push;
>  	u32 value;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c
> b/drivers/gpu/drm/nouveau/nv84_fence.c index
> 1f5a02a9239f..aa7dd0c5d917 100644 ---
> a/drivers/gpu/drm/nouveau/nv84_fence.c +++
> b/drivers/gpu/drm/nouveau/nv84_fence.c @@ -35,7 +35,7 @@
>  static int
>  nv84_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32
> sequence) {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret = PUSH_WAIT(push, 8);
>  	if (ret == 0) {
>  		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE,
> chan->vram.handle); @@ -58,7 +58,7 @@ nv84_fence_emit32(struct
> nouveau_channel *chan, u64 virtual, u32 sequence) static int
>  nv84_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32
> sequence) {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret = PUSH_WAIT(push, 7);
>  	if (ret == 0) {
>  		PUSH_MTHD(push, NV826F, SET_CONTEXT_DMA_SEMAPHORE,
> chan->vram.handle); diff --git a/drivers/gpu/drm/nouveau/nvc0_fence.c
> b/drivers/gpu/drm/nouveau/nvc0_fence.c index
> e1461c0b0779..a5e98d0d4217 100644 ---
> a/drivers/gpu/drm/nouveau/nvc0_fence.c +++
> b/drivers/gpu/drm/nouveau/nvc0_fence.c @@ -34,7 +34,7 @@
>  static int
>  nvc0_fence_emit32(struct nouveau_channel *chan, u64 virtual, u32
> sequence) {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret = PUSH_WAIT(push, 6);
>  	if (ret == 0) {
>  		PUSH_MTHD(push, NV906F, SEMAPHOREA,
> @@ -57,7 +57,7 @@ nvc0_fence_emit32(struct nouveau_channel *chan, u64
> virtual, u32 sequence) static int
>  nvc0_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32
> sequence) {
> -	struct nvif_push *push = chan->chan.push;
> +	struct nvif_push *push = &chan->chan.push;
>  	int ret = PUSH_WAIT(push, 5);
>  	if (ret == 0) {
>  		PUSH_MTHD(push, NV906F, SEMAPHOREA,

