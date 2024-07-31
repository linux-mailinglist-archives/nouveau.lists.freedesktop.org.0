Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 570DA9897C3
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CD410E36C;
	Sun, 29 Sep 2024 21:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ME4aZDgd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E83410E6AD
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:08:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8Dasn95RltpnShVcgSA7/+qmJpqbjbOQwK/t0kAZDBOe9TrjrawZf8LbYWbN7cHQ6pNp+rCzv3cliDKUJna+2SBS1yexialFkIOPc2NWJPG0WFJ/6v3KHtfo9EZNQq6dNIbmAN1yPHV5ZtS1o4KOBsEz6M52Nj4EyFLDSSm8ZrrgYIsKaiz0EeDm8ggX0UbnZBhzZ08ewzJW5Zpkxz1vehd3QRZNA09C9aU8P17zrn9+T8FpGzvlyO9aU3ETETA+/mWqt6PpYmeL+lb6CM0inp+usZkjJYpFKblgxWAICV/fjIKECjtgZoGjmDY7imjrpxtG2EWyouCzORfxdqgtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH0Wp+J71EfCBu59mgKvsCJKIg0lI1AIEoKZVSOeprQ=;
 b=ETSsC/xo44dtTHaxR5AybXnWpn44BHZ+gzmU8AkbUtAzpKduMaat4adzPgTBrzpgHPjN5gCwMpUHyQjw6HN/p7pvEH8Z9pVez05JedO/Zt7D0GNfquvBfqqqpIHkM+0Ot8/S/VmpWDyvIof9Z6kJqz8wZWdQTjpU1SQY+4f60NF2prog2cRBdYOKC2itHR6W6+AJ4oW/2KeXoysc3AmrAYeLU4i09oEzWJR7DwkJ/KyBKnl8jRhgzimCAJ8LYD/0dNt2xWfRx1kutHHE6jzsR+Z9U8+pv54P5lsjkn4lNrx00ZQNSI57X42kgTVKAXlXRjE0glE0q/mXecGWflISSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH0Wp+J71EfCBu59mgKvsCJKIg0lI1AIEoKZVSOeprQ=;
 b=ME4aZDgdWWdhwRJCIo73Gr8ZUWmXi0NkFtxkA5tgA4Wm7ZMAdG9TC0ytOmI2g1L92S8SuQK6pIPtt5WFIUs5QzbNWBynVCaG8Z1QURPYr36ySaQIFdhG/Zfh4i5nwP1jvOAew9pw5xFIUdyAWmHc2M13q/fgVGY19bYP5Cst8aSQLBtbPZFqx29GonFB1NPJffTGxl7P0PiYUywvfUIaNlr2VFzjYchXuUf+Qqek2Hm5usUqu9cm2IhjmPTqHTXYctjGlYBMdVGt0Co2ipMKJS9fm1XyypVzIGLjXhx/NskjH6b0a6jx5fAsQulCJXsj7rMKFy7BlpYUGm/ZXgKsVQ==
Received: from SA0PR11CA0198.namprd11.prod.outlook.com (2603:10b6:806:1bc::23)
 by DS7PR12MB5741.namprd12.prod.outlook.com (2603:10b6:8:70::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Wed, 31 Jul 2024 18:08:31 +0000
Received: from SA2PEPF00003AEB.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::17) by SA0PR11CA0198.outlook.office365.com
 (2603:10b6:806:1bc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 18:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00003AEB.mail.protection.outlook.com (10.167.248.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:08:30 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:08:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 11:08:16 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 11:08:15 -0700
Date: Wed, 31 Jul 2024 21:08:15 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 32/37] drm/nouveau: remove nouveau_chan.device
Message-ID: <20240731210815.00004a3a.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-33-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-33-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEB:EE_|DS7PR12MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 04342c83-067c-4f06-3daf-08dcb18bc8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7aLPTXrtd6GLHIICFmHkb29OmhAaUUtbQw0YheKsmnf3gBbSjuhPiNYxucAW?=
 =?us-ascii?Q?Bj+XpFDXlZ3NdyLDf9W0pN3QCbXfLnC9PoKxr16I96oFsFWegfsWL7DxMRRX?=
 =?us-ascii?Q?bnMH8S0X4FKsqGv0Ao/342DbVscHXIm36wChdM1tRP3ZuLPdqpcq/FYQ/A+n?=
 =?us-ascii?Q?EXO8Jl3Ysv+d+/k2362JYUYwwv18EsWz47TXDzj9dKidBcLuMUfUU4a1I1ja?=
 =?us-ascii?Q?nztOPQbVqMiAWBd9fZs2YlZOnS3sSiqyDZO84pXlvxLNTtA9xHgqvFFnXI5n?=
 =?us-ascii?Q?SVYzHlsPGRF2/LlS8F4Wlqc2DyCCmUEIW/p56oZ2Zrbe9vxameHtHRNwPViL?=
 =?us-ascii?Q?aVYE0rXeJzh1JVlQvPvF1QInGw91huuUGVDG66P9YDPt7YhomK1GKPX825DA?=
 =?us-ascii?Q?TRAAaXm+0WgzJEbpRTnqkgvqzF1BTKbrU3arLlSTm7cFiiWNPl0nL4qOm+WL?=
 =?us-ascii?Q?ioGxbOUSbsXf1cnUpWoEgaITmyiqaUpTb7mq9EPTRJTJ+KVzt7ABnBzgStHe?=
 =?us-ascii?Q?9hwT2DM+voIWsr+EYUyT0V6qHsk8B7vjqyt3vA13WYe49O4bG5rnJIZMLBRy?=
 =?us-ascii?Q?B0TKr8Jerf4j5H2Xuds3hujXLDO2+ihH0t8/BuuLbeaT3UdAkp24xI5WAGzK?=
 =?us-ascii?Q?dC81paQVthK/5Mm0h9C/NAz91MH1GJA8gL90TSHrxKMI96N5cSQEU7piRT2D?=
 =?us-ascii?Q?wDu+yuxD0CncCGlvJ4w1RDW6HDmVlBMJWCYMWvfDH9uaLeqd5L7oxILW9lLr?=
 =?us-ascii?Q?Eh+TkBfJZNsoEPsKLymTU5MkluLiUTB2iLUAx29qivLGdKC3a/bXTyoQlMRr?=
 =?us-ascii?Q?ePlcU9w7SPxj6Ndme6ZGB+cTpzmnvu5vS1H2OrGjhORuHmVEAPTU5DlcqB3h?=
 =?us-ascii?Q?VESLtmsbUNed21IYDf3FQKozc0s7lvAhkuXxzLCumVSxIVGm9KwrpOVhrlxd?=
 =?us-ascii?Q?TqfIQj3TxI9tBhbo/jIQ4m9bIwKiE57rSU7aJnB8fNKsx5Zm8/wJQ4FQ4xiw?=
 =?us-ascii?Q?cytFHsJByXpgsl5wIUkXF3CVyZRbEzFtI5kFZ3E8BcoA5Z9XySMcvKIKfQ8y?=
 =?us-ascii?Q?Wvw2sfL1zMViUuPrRVokvC20YfRrT2ox0GxkI3NFDDr4AuyPJPHjxLDe7jmC?=
 =?us-ascii?Q?jpget84CJDyHClcV1lZoT/tGdJovkFejjVloLU+7Olcpbz2LcMlMr2vfO26q?=
 =?us-ascii?Q?xqJkwl9ppLc8h96T21JB4ZAI/6SuNDYVr0sk081RCVFHOfSkpQZN+kwE3zYf?=
 =?us-ascii?Q?EOszqoTP0J1j1gTZtHee+y//S7TXk7lNK20NSFu4zqzETc6G3rCbZmYmxxx7?=
 =?us-ascii?Q?itdol6zYkRfbzXwLvI+80REJz3CGV3oq/WHw/fz1wWeWgZlV4a9jyCPm+MjU?=
 =?us-ascii?Q?/i411+Z4tYvaW4w6OmIHOmm5zg6RKgqAmwwbWi0Kwqa0yRYGcJqlDIz08nX7?=
 =?us-ascii?Q?F13UY+6XmUBogE71qcRuMdK0bMZ3bIxI?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:08:30.7186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04342c83-067c-4f06-3daf-08dcb18bc8dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AEB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5741
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

On Fri, 26 Jul 2024 14:38:23 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

LGTM.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> nouveau_chan.device is always the same as nouveau_chan.cli.device,
> so there's no need to store it separately.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c | 6 +++---
>  drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c index
> e18a80fda2ca..127bd518030d 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.c +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.c @@ -157,7 +157,6 @@
> nouveau_channel_prep(struct nouveau_cli *cli, return -ENOMEM;
>  
>  	chan->cli = cli;
> -	chan->device = device;
>  	chan->drm = drm;
>  	chan->vmm = nouveau_cli_vmm(cli);
>  	atomic_set(&chan->killed, 0);
> @@ -364,8 +363,9 @@ nouveau_channel_ctor(struct nouveau_cli *cli,
> bool priv, u64 runm, static int
>  nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32
> gart) {
> -	struct nvif_device *device = chan->device;
> -	struct nouveau_drm *drm = chan->drm;
> +	struct nouveau_cli *cli = chan->cli;
> +	struct nouveau_drm *drm = cli->drm;
> +	struct nvif_device *device = &cli->device;
>  	struct nv_dma_v0 args = {};
>  	int ret, i;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h
> b/drivers/gpu/drm/nouveau/nouveau_chan.h index
> 260febd634ee..18a9cbfef8ca 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.h +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.h @@ -13,7 +13,6 @@ struct
> nouveau_channel { } chan;
>  
>  	struct nouveau_cli *cli;
> -	struct nvif_device *device;
>  	struct nouveau_drm *drm;
>  	struct nouveau_vmm *vmm;
>  

