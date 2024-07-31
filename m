Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0059897A1
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13B610E12E;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q7ur1lUO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061.outbound.protection.outlook.com [40.107.212.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8015210E6AD
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:13:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZOf2j4LZ/UuainlKfi3r4ddOatFZ6rmDibKxEsVYyoIGcTj3Cy8XOSHt0HgZZESP4064zMZSTw7bkTXfXqoejs4r7wgt5J7xzvbp8bzCh0wnxFABhvK5/X6QohmeLLw4OWtTudIVZ9+GWckuM44te0jE612m5gPoSKHIZHgaZrjJRIYZ5WeHG+OtZvsGaKmM5JOUyrqBuYyDUKpD5FRoMJh5U/w3igwGdLtYDPslN1B91U+PpfBnXGZw9tg8ABX+EnBOCzcjkK0xo5DNknbzuvqQ/+iqsGMbFFOoJQ/Lx9LmMOIVAtMGOx1jKLCiQ6lE5cVQ/zEidQ8V1L98dY1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9SYXSHL5lgneBXx/4GnbLYrulq1NnTpD+dZj+X0DFM=;
 b=p2a0CMu/p5kbNn3jo+hRC1IoYuDH8NCPHvEFnclLdIXhz4E7QW++WwWbiYfUSoBquXT5+G3bXl79rNs/t1/QUmOnlk8/cFwA7ao7xzHCIUjJOCKi/Z8LGVJVWcOq9a9mOIK8TgO+y/3RjK171MaRudcFDmLRsBhYHPzVdkY4pfuPZxMaK1CgHhKQgOameRwMaNiOva4LtqJPqwSOxuUfHjGoxvYuHmAwUY+I5JVkvTxwiU4pJpoWXG2Glc+iNkGPSMVpvP16kndtabxP834I2lQ0kQYIgbDXunCV6BzdS2NWzXAsBIS0Z08tje4hmFmNHlb73Oub0z01Bhld40CKbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9SYXSHL5lgneBXx/4GnbLYrulq1NnTpD+dZj+X0DFM=;
 b=q7ur1lUOpmYmre3ocZpHhvUYpDFEDt2bZyk32AYDBDMkTHFtvTIejhrit3b9w+17vI6vfHmmq+3KtViwbdIEoDWyPrtmBTT7LfZ15zN/i5Q9oLEH7ItR26X3NEeV9gAW1DOCrztp4KByW/+iJktgZNzJorwMxd101NgFD1hiyxG1+fKi9K9cCMs6dwuQrMX2A9oZKiHnsbGArJaLw/uSAtmCVMOwdfNV+anMwWDIJHqn6/xl7RdDJ3DRUmONDSz9fSy07CdoiJty521hZddwlUvOUDmRuDm02Ef3D1/T8nc66w7XO5Xh9NKKK0Oo6gDOOK02Acq6VLjW+tSGYIrQ8g==
Received: from PH7PR03CA0008.namprd03.prod.outlook.com (2603:10b6:510:339::34)
 by DS0PR12MB6560.namprd12.prod.outlook.com (2603:10b6:8:d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 18:13:38 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::9f) by PH7PR03CA0008.outlook.office365.com
 (2603:10b6:510:339::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 18:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:13:37 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:13:22 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:13:21 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 11:13:20 -0700
Date: Wed, 31 Jul 2024 21:13:20 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 33/37] drm/nouveau: remove chan->drm
Message-ID: <20240731211320.00007644.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-34-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-34-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|DS0PR12MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f20e5e-b363-4a85-ec77-08dcb18c7f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CwlfN3LYA3kRh967ISSzGdJ72j5aDN3RVKBFO7u+sxcbZrrcxdZmrd9wionW?=
 =?us-ascii?Q?+KYQ9yvekRXwIg82CyVcStU79jHGWLs8kUM07MLl/RKjwVfcJvxjU6gHiyCP?=
 =?us-ascii?Q?2lhijMDu6q3MPH36w8MBGeGC27l5hvnUgi//uo64KzttCqj7JH2+dfroHsGJ?=
 =?us-ascii?Q?CvvLWXAVnKOeIN6EIMFfLLySPLowiA8eltNdrQYtrT+X8knUD7vO8Hw0/Bwq?=
 =?us-ascii?Q?JyoxnDhDT5l19hYzXt0q6nHOibWeYgLHAnkXxq8SoinGmJ7jpovSWs9IviKX?=
 =?us-ascii?Q?n1zTPZ0UiVGKnLdw6awQCn81zDDtG3J6lT1eD22LSqL8A3MT9/nDNQoKzqSZ?=
 =?us-ascii?Q?n0tX8lnjPU8zrloAzG4goc2IBxFF8isDgpJXLZaj0hPDU2xDQSTHQdEDqX0s?=
 =?us-ascii?Q?Dphgp9ePyyuENw4eQum3TxXDwDs8stlxyKE6Nw98XBxemjtjqogU5VQJMYKi?=
 =?us-ascii?Q?RazyDmLCs8FWeA8Gz00KsJcv99VVN9MN6d/899+TAZctR8i9iQNV2iympbxS?=
 =?us-ascii?Q?uJz9kQsJCSLrcYuDS+8UQnT4OfugyLrk1ihPGTnQBpJij6sxVMP+3/xdwVGj?=
 =?us-ascii?Q?xlTIfCWDNCSZCNyCxjRaKfTiHsUKAzGg9krAd62Z1a91eCo1QnxzJJms2Jrk?=
 =?us-ascii?Q?k7y0HGOZTEzCMAO5pq0KcgFsJxYvQ5NB591q6N4gUopQCEg7dbL531XQ4BQL?=
 =?us-ascii?Q?G1wc+KokYI1KzNx02/W9CCQxx8OxlnWJAOQ3H38URZQBWdf7G1+ade4kCnwR?=
 =?us-ascii?Q?E0OONZFrEv+8woqHgPKwhVIicfzK943wfRGJlBxzRv4numOss5hfRJ1pV/nc?=
 =?us-ascii?Q?PF7FNd/K2PSBTJ4PoJmCLXFbAZbEbnTi1lGeOh6zWPIPEvc59mwCTgSE9O6b?=
 =?us-ascii?Q?ZgprC6wopTyF+6Yh3l3CJNEOxZ9HgNpriGLTRtP2EQQZfsfQ5RRyGfpUUe2h?=
 =?us-ascii?Q?zUzVtNCmlb1XVDVYyg3HsdtXEQg91EV+VU8CEzpf1/OS94DdkScGvjzLyLnm?=
 =?us-ascii?Q?OJxYnnMyL0ICCnZyzDfmRX5PnFGjDnCnvSSvlg5L6iTj2qVtBQCCuWbAs1rU?=
 =?us-ascii?Q?6jTA7ExbWTGcDfO4+tKEZGfYiaXdfG0HfZAN6ZObCyFpy6eICo7zjT4v26zd?=
 =?us-ascii?Q?wBNVLASQS7YCLJSpsod8TfLkFwtwSOdZDTj6byY3crJUDcgkq4B94IIlKCOX?=
 =?us-ascii?Q?OFzmCJ8tJzz92HBHtCcWclS84DacuFdy7E+9kPFMYamry6ktDMlRgch1hQ4h?=
 =?us-ascii?Q?a8uZ3NLJCJMXILIi5Bog+z1MKRV+Bovdj/BEdjP+1bXSjHL+JtxYY2FvM4/d?=
 =?us-ascii?Q?gmyanMzY74NNAjg3KlOsQe/3f4WRfgq2sFPTLZvStbOVHXUa/eKXT+SmAP1L?=
 =?us-ascii?Q?jWxj6XNAS1sA1KBdKCvOH4VrQ6sBbYDiNDJdFosQM/gqsVAMXSRLZG3co5Ry?=
 =?us-ascii?Q?f7hfzmxKO1IuZrd9RAU3K1H+wrLSUvfx?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:13:37.1433 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f20e5e-b363-4a85-ec77-08dcb18c7f81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6560
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

On Fri, 26 Jul 2024 14:38:24 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The nouveau_cli that owns the channel is now stored in nouveau_chan,
> and it has a pointer to the drm device already.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c  |  4 ++--
>  drivers/gpu/drm/nouveau/nouveau_bo0039.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo5039.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c   | 23 +++++++++--------------
>  drivers/gpu/drm/nouveau/nouveau_chan.h   |  1 -
>  drivers/gpu/drm/nouveau/nouveau_dma.c    |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_fence.c  | 15 ++++++++-------
>  drivers/gpu/drm/nouveau/nouveau_gem.c    |  7 ++++---
>  drivers/gpu/drm/nouveau/nv17_fence.c     |  6 +++---
>  drivers/gpu/drm/nouveau/nv50_fence.c     |  2 +-
>  drivers/gpu/drm/nouveau/nv84_fence.c     |  8 ++++----
>  11 files changed, 34 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c index
> 2ac5b6b904db..33ff21d40cfb 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv04/crtc.c +++
> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c @@ -1057,7 +1057,7 @@
> nv04_finish_page_flip(struct nouveau_channel *chan, struct
> nv04_page_flip_state *ps) {
>  	struct nouveau_fence_chan *fctx = chan->fence;
> -	struct nouveau_drm *drm = chan->drm;
> +	struct nouveau_drm *drm = chan->cli->drm;
>  	struct drm_device *dev = drm->dev;
>  	struct nv04_page_flip_state *s;
>  	unsigned long flags;
> @@ -1113,7 +1113,7 @@ nv04_page_flip_emit(struct nouveau_channel
> *chan, struct nouveau_fence **pfence)
>  {
>  	struct nouveau_fence_chan *fctx = chan->fence;
> -	struct nouveau_drm *drm = chan->drm;
> +	struct nouveau_drm *drm = chan->cli->drm;
>  	struct drm_device *dev = drm->dev;
>  	struct nvif_push *push = chan->chan.push;
>  	unsigned long flags;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> b/drivers/gpu/drm/nouveau/nouveau_bo0039.c index
> e2ce44adaa5c..2babc6c47241 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo0039.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo0039.c @@ -104,6 +104,6 @@
> nv04_bo_move_init(struct nouveau_channel *chan, u32 handle) return
> ret; 
>  	PUSH_MTHD(push, NV039, SET_OBJECT, handle);
> -	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_NOTIFIES,
> chan->drm->ntfy.handle);
> +	PUSH_MTHD(push, NV039, SET_CONTEXT_DMA_NOTIFIES,
> chan->cli->drm->ntfy.handle); return 0;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo5039.c
> b/drivers/gpu/drm/nouveau/nouveau_bo5039.c index
> c6cf3629a9f9..0a6b1fce1108 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo5039.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo5039.c @@ -144,7 +144,7 @@
> nv50_bo_move_init(struct nouveau_channel *chan, u32 handle) return
> ret; 
>  	PUSH_MTHD(push, NV5039, SET_OBJECT, handle);
> -	PUSH_MTHD(push, NV5039, SET_CONTEXT_DMA_NOTIFY,
> chan->drm->ntfy.handle,
> +	PUSH_MTHD(push, NV5039, SET_CONTEXT_DMA_NOTIFY,
> chan->cli->drm->ntfy.handle, SET_CONTEXT_DMA_BUFFER_IN,
> chan->vram.handle, SET_CONTEXT_DMA_BUFFER_OUT, chan->vram.handle);
>  	return 0;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c index
> 127bd518030d..e95b8092dae3 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.c +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.c @@ -90,12 +90,10 @@
> nouveau_channel_del(struct nouveau_channel **pchan) {
>  	struct nouveau_channel *chan = *pchan;
>  	if (chan) {
> -		struct nouveau_cli *cli = (void *)chan->user.client;
> -
>  		if (chan->fence)
> -			nouveau_fence(chan->drm)->context_del(chan);
> +
> nouveau_fence(chan->cli->drm)->context_del(chan); 
> -		if (cli)
> +		if (nvif_object_constructed(&chan->user))
>  			nouveau_svmm_part(chan->vmm->svmm,
> chan->inst); 
>  		nvif_object_dtor(&chan->blit);
> @@ -157,7 +155,6 @@ nouveau_channel_prep(struct nouveau_cli *cli,
>  		return -ENOMEM;
>  
>  	chan->cli = cli;
> -	chan->drm = drm;
>  	chan->vmm = nouveau_cli_vmm(cli);
>  	atomic_set(&chan->killed, 0);
>  
> @@ -228,12 +225,11 @@ nouveau_channel_prep(struct nouveau_cli *cli,
>  			args.limit = device->info.ram_user - 1;
>  		}
>  	} else {
> -		if (chan->drm->agp.bridge) {
> +		if (drm->agp.bridge) {
>  			args.target = NV_DMA_V0_TARGET_AGP;
>  			args.access = NV_DMA_V0_ACCESS_RDWR;
> -			args.start = chan->drm->agp.base;
> -			args.limit = chan->drm->agp.base +
> -				     chan->drm->agp.size - 1;
> +			args.start = drm->agp.base;
> +			args.limit = drm->agp.base + drm->agp.size -
> 1; } else {
>  			args.target = NV_DMA_V0_TARGET_VM;
>  			args.access = NV_DMA_V0_ACCESS_RDWR;
> @@ -420,12 +416,11 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart) args.start = 0;
>  			args.limit = chan->vmm->vmm.limit - 1;
>  		} else
> -		if (chan->drm->agp.bridge) {
> +		if (drm->agp.bridge) {
>  			args.target = NV_DMA_V0_TARGET_AGP;
>  			args.access = NV_DMA_V0_ACCESS_RDWR;
> -			args.start = chan->drm->agp.base;
> -			args.limit = chan->drm->agp.base +
> -				     chan->drm->agp.size - 1;
> +			args.start = drm->agp.base;
> +			args.limit = drm->agp.base + drm->agp.size -
> 1; } else {
>  			args.target = NV_DMA_V0_TARGET_VM;
>  			args.access = NV_DMA_V0_ACCESS_RDWR;
> @@ -490,7 +485,7 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart) }
>  
>  	/* initialise synchronisation */
> -	return nouveau_fence(chan->drm)->context_new(chan);
> +	return nouveau_fence(drm)->context_new(chan);
>  }
>  
>  int
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h
> b/drivers/gpu/drm/nouveau/nouveau_chan.h index
> 18a9cbfef8ca..3ce9832c9528 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.h +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.h @@ -13,7 +13,6 @@ struct
> nouveau_channel { } chan;
>  
>  	struct nouveau_cli *cli;
> -	struct nouveau_drm *drm;
>  	struct nouveau_vmm *vmm;
>  
>  	struct nvif_mem mem_userd;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c
> b/drivers/gpu/drm/nouveau/nouveau_dma.c index
> b01c029f3a90..a1f329ef0641 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_dma.c +++
> b/drivers/gpu/drm/nouveau/nouveau_dma.c @@ -72,7 +72,7 @@ void
>  nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
>  	      bool no_prefetch)
>  {
> -	struct nvif_user *user = &chan->drm->client.device.user;
> +	struct nvif_user *user = &chan->cli->drm->client.device.user;
>  	struct nouveau_bo *pb = chan->push.buffer;
>  	int ip = (chan->dma.ib_put * 2) + chan->dma.ib_base;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> b/drivers/gpu/drm/nouveau/nouveau_fence.c index
> 1450fb8c57c3..6407bb4a3be9 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_fence.c +++
> b/drivers/gpu/drm/nouveau/nouveau_fence.c @@ -181,8 +181,9 @@
> nouveau_fence_wait_uevent_handler(struct nvif_event *event, void
> *repv, u32 repc void nouveau_fence_context_new(struct nouveau_channel
> *chan, struct nouveau_fence_chan *fctx) {
> -	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
> -	struct nouveau_cli *cli = (void *)chan->user.client;
> +	struct nouveau_cli *cli = chan->cli;
> +	struct nouveau_drm *drm = cli->drm;
> +	struct nouveau_fence_priv *priv = (void*)drm->fence;
>  	struct {
>  		struct nvif_event_v0 base;
>  		struct nvif_chan_event_v0 host;
> @@ -193,11 +194,11 @@ nouveau_fence_context_new(struct
> nouveau_channel *chan, struct nouveau_fence_cha
> INIT_LIST_HEAD(&fctx->flip); INIT_LIST_HEAD(&fctx->pending);
>  	spin_lock_init(&fctx->lock);
> -	fctx->context = chan->drm->runl[chan->runlist].context_base
> + chan->chid;
> +	fctx->context = drm->runl[chan->runlist].context_base +
> chan->chid; 
> -	if (chan == chan->drm->cechan)
> +	if (chan == drm->cechan)
>  		strcpy(fctx->name, "copy engine channel");
> -	else if (chan == chan->drm->channel)
> +	else if (chan == drm->channel)
>  		strcpy(fctx->name, "generic kernel channel");
>  	else
>  		strcpy(fctx->name, cli->name);
> @@ -221,7 +222,7 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  {
>  	struct nouveau_channel *chan = unrcu_pointer(fence->channel);
>  	struct nouveau_fence_chan *fctx = chan->fence;
> -	struct nouveau_fence_priv *priv = (void*)chan->drm->fence;
> +	struct nouveau_fence_priv *priv =
> (void*)chan->cli->drm->fence; int ret;
>  
>  	fence->timeout  = jiffies + (15 * HZ);
> @@ -354,7 +355,7 @@ nouveau_fence_sync(struct nouveau_bo *nvbo,
> struct nouveau_channel *chan, if (i == 0 && usage ==
> DMA_RESV_USAGE_WRITE) continue;
>  
> -			f = nouveau_local_fence(fence, chan->drm);
> +			f = nouveau_local_fence(fence,
> chan->cli->drm); if (f) {
>  				struct nouveau_channel *prev;
>  				bool must_wait = true;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c index
> 2e535caa7d6e..7b6f611a28b1 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_gem.c +++
> b/drivers/gpu/drm/nouveau/nouveau_gem.c @@ -567,10 +567,11 @@
> validate_init(struct nouveau_channel *chan, struct drm_file
> *file_priv, } 
>  static int
> -validate_list(struct nouveau_channel *chan, struct nouveau_cli *cli,
> +validate_list(struct nouveau_channel *chan,
>  	      struct list_head *list, struct
> drm_nouveau_gem_pushbuf_bo *pbbo) {
> -	struct nouveau_drm *drm = chan->drm;
> +	struct nouveau_cli *cli = chan->cli;
> +	struct nouveau_drm *drm = cli->drm;
>  	struct nouveau_bo *nvbo;
>  	int ret, relocs = 0;
>  
> @@ -642,7 +643,7 @@ nouveau_gem_pushbuf_validate(struct
> nouveau_channel *chan, return ret;
>  	}
>  
> -	ret = validate_list(chan, cli, &op->list, pbbo);
> +	ret = validate_list(chan, &op->list, pbbo);
>  	if (unlikely(ret < 0)) {
>  		if (ret != -ERESTARTSYS)
>  			NV_PRINTK(err, cli, "validating bo list\n");
> diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c
> b/drivers/gpu/drm/nouveau/nv17_fence.c index
> 2c99f2c1ddcd..51fcac894146 100644 ---
> a/drivers/gpu/drm/nouveau/nv17_fence.c +++
> b/drivers/gpu/drm/nouveau/nv17_fence.c @@ -36,8 +36,8 @@ int
>  nv17_fence_sync(struct nouveau_fence *fence,
>  		struct nouveau_channel *prev, struct nouveau_channel
> *chan) {
> -	struct nouveau_cli *cli = (void *)prev->user.client;
> -	struct nv10_fence_priv *priv = chan->drm->fence;
> +	struct nouveau_cli *cli = prev->cli;
> +	struct nv10_fence_priv *priv = cli->drm->fence;
>  	struct nv10_fence_chan *fctx = chan->fence;
>  	struct nvif_push *ppush = prev->chan.push;
>  	struct nvif_push *npush = chan->chan.push;
> @@ -76,7 +76,7 @@ nv17_fence_sync(struct nouveau_fence *fence,
>  static int
>  nv17_fence_context_new(struct nouveau_channel *chan)
>  {
> -	struct nv10_fence_priv *priv = chan->drm->fence;
> +	struct nv10_fence_priv *priv = chan->cli->drm->fence;
>  	struct ttm_resource *reg = priv->bo->bo.resource;
>  	struct nv10_fence_chan *fctx;
>  	u32 start = reg->start * PAGE_SIZE;
> diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c
> b/drivers/gpu/drm/nouveau/nv50_fence.c index
> 6fa18f9d26b6..62e28dddf87c 100644 ---
> a/drivers/gpu/drm/nouveau/nv50_fence.c +++
> b/drivers/gpu/drm/nouveau/nv50_fence.c @@ -35,7 +35,7 @@
>  static int
>  nv50_fence_context_new(struct nouveau_channel *chan)
>  {
> -	struct nv10_fence_priv *priv = chan->drm->fence;
> +	struct nv10_fence_priv *priv = chan->cli->drm->fence;
>  	struct nv10_fence_chan *fctx;
>  	struct ttm_resource *reg = priv->bo->bo.resource;
>  	u32 start = reg->start * PAGE_SIZE;
> diff --git a/drivers/gpu/drm/nouveau/nv84_fence.c
> b/drivers/gpu/drm/nouveau/nv84_fence.c index
> 9ce4c2d60fe3..1f5a02a9239f 100644 ---
> a/drivers/gpu/drm/nouveau/nv84_fence.c +++
> b/drivers/gpu/drm/nouveau/nv84_fence.c @@ -79,7 +79,7 @@
> nv84_fence_sync32(struct nouveau_channel *chan, u64 virtual, u32
> sequence) static inline u32 nv84_fence_chid(struct nouveau_channel
> *chan) {
> -	return chan->drm->runl[chan->runlist].chan_id_base +
> chan->chid;
> +	return chan->cli->drm->runl[chan->runlist].chan_id_base +
> chan->chid; }
>  
>  static int
> @@ -105,14 +105,14 @@ nv84_fence_sync(struct nouveau_fence *fence,
>  static u32
>  nv84_fence_read(struct nouveau_channel *chan)
>  {
> -	struct nv84_fence_priv *priv = chan->drm->fence;
> +	struct nv84_fence_priv *priv = chan->cli->drm->fence;
>  	return nouveau_bo_rd32(priv->bo, nv84_fence_chid(chan) *
> 16/4); }
>  
>  static void
>  nv84_fence_context_del(struct nouveau_channel *chan)
>  {
> -	struct nv84_fence_priv *priv = chan->drm->fence;
> +	struct nv84_fence_priv *priv = chan->cli->drm->fence;
>  	struct nv84_fence_chan *fctx = chan->fence;
>  
>  	nouveau_bo_wr32(priv->bo, nv84_fence_chid(chan) * 16 / 4,
> fctx->base.sequence); @@ -127,7 +127,7 @@
> nv84_fence_context_del(struct nouveau_channel *chan) int
>  nv84_fence_context_new(struct nouveau_channel *chan)
>  {
> -	struct nv84_fence_priv *priv = chan->drm->fence;
> +	struct nv84_fence_priv *priv = chan->cli->drm->fence;
>  	struct nv84_fence_chan *fctx;
>  	int ret;
>  

