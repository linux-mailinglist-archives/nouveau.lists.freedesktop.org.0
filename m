Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049F9897BA
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C240010E2B9;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FUyfJNnm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6637E10E64F
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:07:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoqcigzoVLGXRSZ3DYLzviJz+tIRdfXF7LwlzRJ5Yiu5fECAdtEnc2jejWKIenPKwtcZyCZJS2mhjkeZSNn5hsq22C9EJZirI8qybCmmTnV6qTp8jMujTXGeSe0K/AePtEjhI3tlrYbDLzQxaXmucua4CMYX6PRR1F+WPAo1+SLR2Yy/yTKQ5IT+X0IrdcvJZXkwKAE9GUOWthVFu7nue+VNMN79Y3YaBRhhPqnQZ2yUXV++DR+iB2E7n9dR4tRMmI5kFXs/GJdI2YG9L6WQN/axgZBuhfcr04frF5FwjqT1EhtaVCiRP2VEWVQ25coU6cCWAgnn6BmQutLs/mO6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5y+x/VKpXAOqm2YCkDNG7Vu4npIkFBsmWMNWJXn21E=;
 b=KbSt36MjWcwBq9xibjqIH49HHv0qBAJE4U/ee5ry7BPEesA5w9ZVC7ZNby29DPlUlpZwkZCbBh/lY1FJD5J8Pj3MWUvUFQGJTcwE0mBP5T4v2KDAFqFBiJTqX67XLVsKjgUikLchdYoWqujDNUAlbebJdYdjQ7TrfZ75724jIWryUDCiJzniTNtbimHGWr0yoteo2ixkIvG9HjHaizsL9Rzm3+DZNH2geAqY26R8LpZbPS0Dz5rQ21ktCSQCbNhP6qslAuRQ+jcm+nm9uhnSL5Ft3KJPIDEVXrOlXAY2L0CcmSsaFT/ROo7L6C/Ne5fnng7YKexnRwPPzy3KlezwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5y+x/VKpXAOqm2YCkDNG7Vu4npIkFBsmWMNWJXn21E=;
 b=FUyfJNnmNqLA9V/Ip8qoPqiYx2UfoiX4nj9GUunurRou9R71hJNHS5TMamOivE4qXldDekHkc08HxXeLTJukKWYw+plnIOudSytFQNNDnLx/fsHsu6X2g9F5IG3KNtHmgs/3GrAt+9cwWJypqYUhUMUuyUSipMz5jYi4UfF8DimTD8MLtI402ylkHZic8lj5glAZmso3Ltt/c1mZEav3Itb5zOA0GinFtrRpvB+Oo1bpZX2xbQfcet1LVq7U8REIK8or+V/CoOaiE5hS87O6QzYIKSeO+UYkuYqbiStANI7EHWPv+ZvV0R/u3lylicbLiJ8TaaJnMBkQPonPlyCRXg==
Received: from CH2PR18CA0060.namprd18.prod.outlook.com (2603:10b6:610:55::40)
 by LV8PR12MB9181.namprd12.prod.outlook.com (2603:10b6:408:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 18:07:14 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::15) by CH2PR18CA0060.outlook.office365.com
 (2603:10b6:610:55::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Wed, 31 Jul 2024 18:07:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:07:13 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:07:00 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 11:07:00 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 11:06:59 -0700
Date: Wed, 31 Jul 2024 21:06:59 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 31/37] drm/nouveau: pass cli to nouveau_channel_new()
 instead of drm+device
Message-ID: <20240731210659.000013df.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-32-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-32-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|LV8PR12MB9181:EE_
X-MS-Office365-Filtering-Correlation-Id: 74aa0327-0cd4-493a-7f60-08dcb18b9b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vOF2SAE1qKbS4pXGfHQAbG6klfc3UaiIoxojVUIEX+QhLqBYs6NA48WLkc45?=
 =?us-ascii?Q?JrR3mMA+vxsutUkfQt2BDOBqTTFlVeAE/AoUANxeCnGLioOmX5qTAarDXPIH?=
 =?us-ascii?Q?P32hhjxMW9KA/ToXQOUQ8E2UnN0EOGg97ha4n/g7vvwyW7C1TvMiUlCy5D6G?=
 =?us-ascii?Q?VYxpE7ilWLT/nWFTIqYhloQWh+IzQ0jrxoD6GeKKPCFULiT1Xd+Z8OBUbIwT?=
 =?us-ascii?Q?kkHVaywWL8ZaxlBdzAVgoCtAStoijggSituP+oLjeRBLWN6HNoThrKay312z?=
 =?us-ascii?Q?J0OYtx9Rx34+lTT/ECB05eNq911FeFK1/R0x3amHReVZDrhSK3YtqfaASyjE?=
 =?us-ascii?Q?hMhy7psXZTxL80MGFv/iJ4+u+YHvd5yCEgiZKs1vqvWSnTvLtW1eWP98Cpfz?=
 =?us-ascii?Q?Q67TVhiOo/YKvPnB8XkfhRlum+7lgEZHGgjEPO8FJHP/5P8pmgn5o6oS6dT4?=
 =?us-ascii?Q?loGGEF2bgez+aOpOw8W5N9zVhBNFq3UxNZLYDqT7Fv+ErNn5bHwhjde0Ds4f?=
 =?us-ascii?Q?vrptUGCS8+5H3tunMeYqN1xN2LRJcQFaBwJpw0GFdwYr+TndoqCVoEbWbrYs?=
 =?us-ascii?Q?Zem1er3coNBONq4JNfkLu2vHP0MihsRDAazMo0Qv5e9U+e+ojb5MGc6Ts+oa?=
 =?us-ascii?Q?0IyswQr4iYWFDhSgSskCaGyEXFibewuvqYPzy81Mj4CGZF+d3oGNA2aHF0VQ?=
 =?us-ascii?Q?qeLFs66CgunTf7iRB+WlSkFKn1Kqw5dYPEzfZEKS8M67DS3InEwFomQ91fSf?=
 =?us-ascii?Q?CujLvJ7mF/jd5gWNU0DXn3lN1WE/xI55opeBBwUtFbnMWunX0x8sSFpoBtKm?=
 =?us-ascii?Q?ZRqaZzCBhkBUlStlxB65rtyMDzXdhUEG6lQgihqtj2Hvr1BtupE9Z9jAyVZJ?=
 =?us-ascii?Q?X/pfwnS4wn/bEQQE///Z6+HFm6sKpnHJGcrmccJiHpOCBShxzJ2vk/SWRuzM?=
 =?us-ascii?Q?CB0njqoWMjJkW4OVRKuindbOuTclbY4AFQhR8zaHA7NWv+/6IhhpzGp3J86/?=
 =?us-ascii?Q?lBeilFrVofkEhc0qHzo3HJFh6aFyeoAVXTiVDXW4brDRKnRMlA0UVOnR7zfO?=
 =?us-ascii?Q?551r8J2zvH9NNz52g/VWJ6j2OUnXIUq8jIfBr8uCOGnLgUpPORoliixdKKC1?=
 =?us-ascii?Q?f3CO7RKqIXHcD34wlO7smRXKmMoPXPNlcmIDKUbm0yonc8/EU9QwBIVg3KfO?=
 =?us-ascii?Q?0bX8fc1Yo+fb+BoHkGr7Tj0SN1Ibk0AovtECXMm4YzUZwAWv83z86PJ5rPg7?=
 =?us-ascii?Q?qUaUaWjHrV2XXe4uIuKMPI62OqC8suwszVLU21Reiveen/KA4nbwLuuukiN4?=
 =?us-ascii?Q?p0xquESa2NDgy02p+8oAK+jpDM24ENrtNh9U+ZcbxW3b+WnHaWZEXJF6TvGw?=
 =?us-ascii?Q?QNzuemcb7h6IDFl30V6/mdqD6NeTMJ/rkDI6yEXpV8Bc47YAdorCq63CoxEb?=
 =?us-ascii?Q?jxGP/KRA1ZnrFXQUgS6A3woqNYsQzLbh?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:07:13.8416 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74aa0327-0cd4-493a-7f60-08dcb18b9b0f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9181
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

On Fri, 26 Jul 2024 14:38:22 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Can you elaborate a little bit about the plan for nouveau_cli and
nouveau_drm? Like at what level of the function takes nouveau_cli and
nouveau_drm. I understand their previous positions, but after the
re-factors, their positions seem a little bit overlapped with each
other to me.

> Both of these are stored in nouveau_cli already, and also allows the
> removal of some void casts.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_abi16.c |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c    |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_chan.c  | 21 +++++++++++----------
>  drivers/gpu/drm/nouveau/nouveau_chan.h  |  3 ++-
>  drivers/gpu/drm/nouveau/nouveau_drm.c   |  4 ++--
>  6 files changed, 18 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c index
> 98736f6eab16..2ac5b6b904db 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv04/crtc.c +++
> b/drivers/gpu/drm/nouveau/dispnv04/crtc.c @@ -1172,7 +1172,7 @@
> nv04_crtc_page_flip(struct drm_crtc *crtc, struct drm_framebuffer
> *fb, chan = drm->channel; if (!chan)
>  		return -ENODEV;
> -	cli = (void *)chan->user.client;
> +	cli = chan->cli;
>  	push = chan->chan.push;
>  
>  	s = kzalloc(sizeof(*s), GFP_KERNEL);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c index
> 768912cc5d8a..2a0617e5fe2a 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_abi16.c +++
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c @@ -405,7 +405,7 @@
> nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
> list_add(&chan->head, &abi16->channels); 
>  	/* create channel object and initialise dma and fence
> management */
> -	ret = nouveau_channel_new(drm, device, false, runm,
> init->fb_ctxdma_handle,
> +	ret = nouveau_channel_new(cli, false, runm,
> init->fb_ctxdma_handle, init->tt_ctxdma_handle, &chan->chan);
>  	if (ret)
>  		goto done;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> b/drivers/gpu/drm/nouveau/nouveau_bo.c index
> 6631d85ea749..745b7d7503f7 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_bo.c +++
> b/drivers/gpu/drm/nouveau/nouveau_bo.c @@ -859,7 +859,7 @@
> nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict, {
>  	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>  	struct nouveau_channel *chan = drm->ttm.chan;
> -	struct nouveau_cli *cli = (void *)chan->user.client;
> +	struct nouveau_cli *cli = chan->cli;
>  	struct nouveau_fence *fence;
>  	int ret;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c index
> 16e0a87e030a..e18a80fda2ca 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.c +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.c @@ -52,7 +52,7 @@ static int
>  nouveau_channel_killed(struct nvif_event *event, void *repv, u32
> repc) {
>  	struct nouveau_channel *chan = container_of(event,
> typeof(*chan), kill);
> -	struct nouveau_cli *cli = (void *)chan->user.client;
> +	struct nouveau_cli *cli = chan->cli;
>  
>  	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
>  
> @@ -66,7 +66,7 @@ int
>  nouveau_channel_idle(struct nouveau_channel *chan)
>  {
>  	if (likely(chan && chan->fence &&
> !atomic_read(&chan->killed))) {
> -		struct nouveau_cli *cli = (void *)chan->user.client;
> +		struct nouveau_cli *cli = chan->cli;
>  		struct nouveau_fence *fence = NULL;
>  		int ret;
>  
> @@ -142,10 +142,11 @@ nouveau_channel_wait(struct nvif_push *push,
> u32 size) }
>  
>  static int
> -nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device
> *device, +nouveau_channel_prep(struct nouveau_cli *cli,
>  		     u32 size, struct nouveau_channel **pchan)
>  {
> -	struct nouveau_cli *cli = (void *)device->object.client;
> +	struct nouveau_drm *drm = cli->drm;
> +	struct nvif_device *device = &cli->device;
>  	struct nv_dma_v0 args = {};
>  	struct nouveau_channel *chan;
>  	u32 target;
> @@ -155,6 +156,7 @@ nouveau_channel_prep(struct nouveau_drm *drm,
> struct nvif_device *device, if (!chan)
>  		return -ENOMEM;
>  
> +	chan->cli = cli;
>  	chan->device = device;
>  	chan->drm = drm;
>  	chan->vmm = nouveau_cli_vmm(cli);
> @@ -253,7 +255,7 @@ nouveau_channel_prep(struct nouveau_drm *drm,
> struct nvif_device *device, }
>  
>  static int
> -nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device
> *device, bool priv, u64 runm, +nouveau_channel_ctor(struct
> nouveau_cli *cli, bool priv, u64 runm, struct nouveau_channel **pchan)
>  {
>  	const struct nvif_mclass hosts[] = {
> @@ -278,7 +280,7 @@ nouveau_channel_ctor(struct nouveau_drm *drm,
> struct nvif_device *device, bool p struct nvif_chan_v0 chan;
>  		char name[TASK_COMM_LEN+16];
>  	} args;
> -	struct nouveau_cli *cli = (void *)device->object.client;
> +	struct nvif_device *device = &cli->device;
>  	struct nouveau_channel *chan;
>  	const u64 plength = 0x10000;
>  	const u64 ioffset = plength;
> @@ -297,7 +299,7 @@ nouveau_channel_ctor(struct nouveau_drm *drm,
> struct nvif_device *device, bool p size = ioffset + ilength;
>  
>  	/* allocate dma push buffer */
> -	ret = nouveau_channel_prep(drm, device, size, &chan);
> +	ret = nouveau_channel_prep(cli, size, &chan);
>  	*pchan = chan;
>  	if (ret)
>  		return ret;
> @@ -492,13 +494,12 @@ nouveau_channel_init(struct nouveau_channel
> *chan, u32 vram, u32 gart) }
>  
>  int
> -nouveau_channel_new(struct nouveau_drm *drm, struct nvif_device
> *device, +nouveau_channel_new(struct nouveau_cli *cli,
>  		    bool priv, u64 runm, u32 vram, u32 gart, struct
> nouveau_channel **pchan) {
> -	struct nouveau_cli *cli = (void *)device->object.client;
>  	int ret;
>  
> -	ret = nouveau_channel_ctor(drm, device, priv, runm, pchan);
> +	ret = nouveau_channel_ctor(cli, priv, runm, pchan);
>  	if (ret) {
>  		NV_PRINTK(dbg, cli, "channel create, %d\n", ret);
>  		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h
> b/drivers/gpu/drm/nouveau/nouveau_chan.h index
> 5de2ef4e98c2..260febd634ee 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.h +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.h @@ -12,6 +12,7 @@ struct
> nouveau_channel { struct nvif_push *push;
>  	} chan;
>  
> +	struct nouveau_cli *cli;
>  	struct nvif_device *device;
>  	struct nouveau_drm *drm;
>  	struct nouveau_vmm *vmm;
> @@ -62,7 +63,7 @@ struct nouveau_channel {
>  int nouveau_channels_init(struct nouveau_drm *);
>  void nouveau_channels_fini(struct nouveau_drm *);
>  
> -int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *,
> bool priv, u64 runm, +int  nouveau_channel_new(struct nouveau_cli *,
> bool priv, u64 runm, u32 vram, u32 gart, struct nouveau_channel **);
>  void nouveau_channel_del(struct nouveau_channel **);
>  int  nouveau_channel_idle(struct nouveau_channel *);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 6b33d1d0a4eb..8b9c463d21ac 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -335,7 +335,7 @@
> nouveau_accel_ce_init(struct nouveau_drm *drm) return;
>  	}
>  
> -	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB,
> NvDmaTT, &drm->cechan);
> +	ret = nouveau_channel_new(&drm->client, false, runm,
> NvDmaFB, NvDmaTT, &drm->cechan); if (ret)
>  		NV_ERROR(drm, "failed to create ce channel, %d\n",
> ret); }
> @@ -363,7 +363,7 @@ nouveau_accel_gr_init(struct nouveau_drm *drm)
>  		return;
>  	}
>  
> -	ret = nouveau_channel_new(drm, device, false, runm, NvDmaFB,
> NvDmaTT, &drm->channel);
> +	ret = nouveau_channel_new(&drm->client, false, runm,
> NvDmaFB, NvDmaTT, &drm->channel); if (ret) {
>  		NV_ERROR(drm, "failed to create kernel channel,
> %d\n", ret); nouveau_accel_gr_fini(drm);

