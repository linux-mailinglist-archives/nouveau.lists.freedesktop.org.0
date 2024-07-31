Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB8F9897BC
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C465110E2BA;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FaBPPkoR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44B310E5CD
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:43:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R7SszKycwk0Gf5dX2ipscAbiC5ksdWI6ouyNfYILUc5kHKwvdz+xRZ4sALsCHL7NCE9ampwpoUJNTNBriFnOv1Yngr5dAzswJljYVJf/vjeenA422rl04LXPROXfV8aBAgz2uicNo++09hjs4UTVJrHCb16QilrqPH8oQyIioG28mZ1ehZ/zDP68CrZDzwe/1/Pe6rCDlY1DtuKZwQZF3aaVFQW4bMmcjbK9ue+6iMrdx3CQOK3SQH9frIQHIg2LgAtOmgKuNdnRuS5UgisGJF4n2prEtoAo6dB7MAariOvwqykOnqiars9+Tnoygr2+oRTXXaEhY1DIADve2z3hbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+rdgDqiZnpm0HtAGvOAvIU+mddaJ+3GuWnvP/rLmes=;
 b=u1LgDfgsqcLHEw4YXzquQ4sapG9yeiu5skAYmWMfS+4oeqVqa7KZaoU+/aokVaRLYZlZTO4As3Yg8oqKxUk342zCuUqE0d7XOMckUVjKPtTH9AjygqRCS029dbhAbP9cDUQ0Ml01dhOBNryfGXpjbTB9l3oq/T0lEEcByE3eu8l97yUwHOcqgPvDAVC8IFmGYZVR1xaE9G7dRwHx3+GFrgC1vaeOoNNoixw7yBaTVF8KE69n9VTJnH/pf2G8Siql3aWs0f6/fby7q3TGkIxdGKCbScrRY/OPI8KMjrymi7SnpOg+sI3gfgB/noslEgjHRMnM2CUo43JlFAdixpLVdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+rdgDqiZnpm0HtAGvOAvIU+mddaJ+3GuWnvP/rLmes=;
 b=FaBPPkoR1DNrCpG/vsud8UfpAmB3qOGLy705MmaitQ7GKoH/lc69m44cqWkk6Ik7Na5mC2hkgUp29+XU55ei8t6nwavnZF1xTPgjYq+VOsMwiXwDJlNLzgNY+di1J/O2H4UxJt1fuMzW64HRHzoQMlLnkLX2cWWxisGMd29colw9Rb/9wbEmhL94U5Pq4UN1BYN/6XomheSrZw/MNsgcM21IS8B24TpZ9n0dXdWUA61LUE3uMzX/Ac19ijVtovk22dO/VgY18UTsQOi7KUaRoMzr739CZjH4S/EKwursWNInh+wXSchMxADIPHVzEzaVJAFXdsWToxKSLpBLrIDPgQ==
Received: from BN8PR15CA0055.namprd15.prod.outlook.com (2603:10b6:408:80::32)
 by PH8PR12MB6939.namprd12.prod.outlook.com (2603:10b6:510:1be::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 11:43:56 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::71) by BN8PR15CA0055.outlook.office365.com
 (2603:10b6:408:80::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 11:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:43:55 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:43:46 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 04:43:46 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 04:43:45 -0700
Date: Wed, 31 Jul 2024 14:43:44 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 17/37] drm/nouveau/nvif: remove nvxx_client()
Message-ID: <20240731144344.0000416c.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-18-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-18-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|PH8PR12MB6939:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e3a634-e7f6-45f6-11fe-08dcb1560f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oK5vnC9p/6uPYK/7tGnxgaBqCTT7arzOlgZreWUrfwGseEQif8Ef1yBc6aRx?=
 =?us-ascii?Q?CvHbiFDh1NkLKZ7x8SI1NBZs4fL+iWMnlrPjUHMox/zYOdYygpXYU2j8Kb7V?=
 =?us-ascii?Q?+g+BTjLDE39Lrh7Hstn4zYeYxwnfjHRJhDllYsO8EzGt85eN01tKWuH78Txn?=
 =?us-ascii?Q?TgTd6Rd5hcBpP+G/dWFddDdeAbY83Ez0GchJEFfonp7XPcbXTUEenPWNLvEN?=
 =?us-ascii?Q?GREleSTc9TTfEdt4W6ZdzwyaQ3n72Qjtg1ryohcSmHqBBBI5cZhsFA+USbiZ?=
 =?us-ascii?Q?8L2gpoWIqB4qCglqgbd+JMe9veg7jrQYKUE/2SC9BTzRVmrQCb0gfnd9hKtU?=
 =?us-ascii?Q?xn47gnDAefQ8L6Bfc3p+K1Cadc+iwQrrsck7L6o65eWHxKCETj/4haTMCofJ?=
 =?us-ascii?Q?p3eHv+TYx07q/DVI0fPH2s7FAUdxkBCWarsDmRl/dpOKH+Q6TTQcvaURTTaR?=
 =?us-ascii?Q?NRmMzP4NXPEuaxIGHYT1Amvdh44WBb4UuNnQLF2478ELd5DTI4JiPVaHxA7x?=
 =?us-ascii?Q?D4kJaFiU1GRYVyoCMXpuzOVjiyUigGCuDMvaJurfNfMLUdKh3E2ZY1h1f2hK?=
 =?us-ascii?Q?kPwFEnAbtbY4VE4RnHKqlXw2ptB2LRTO/xM2RYBVvR/E1a4MYCwC1QEpUXzH?=
 =?us-ascii?Q?06oUOrfYXHRTCZSPIug9RRIbYmoaLfpGhM+mQBh4xok7ZxpevZFI9Icft/ze?=
 =?us-ascii?Q?fUM3fNk3Tce6r35ChwzNJC7AFSc4qAtqHFf7gPhpn+buaQ1kqbMB/e4wD3nH?=
 =?us-ascii?Q?HXGU1RwQW1Rx9qZXxjwTh7yWU/sj97wfCJbTr8DByQiZ2dtmMjq2J3HzP1Oq?=
 =?us-ascii?Q?gHtVwPHQG4M5ZmqiIbOYXzNaAihC91MvXb8Vz3zZ/ob6W88RCImpm2aXli45?=
 =?us-ascii?Q?GWjO+3/5K4MXMaNzmmX8k6zSFoxwaZcEXhTWSFX2+aBaK6GJIdAMkzYsGJg3?=
 =?us-ascii?Q?y77UW0C3piB8WB7xyNEESrKcLWxq5fcO7dMi9ms1n6KPiCEY3nnqpQmY6YWY?=
 =?us-ascii?Q?NT6bk3YUcOgfhW4L4NL02lMlVD5iz2G75nkLn5UOzKpoAehSl+nnLs4F52s4?=
 =?us-ascii?Q?s3g+Hno/jKoCfv5TY1PEF1d6Vpu09UAoht9/KmvE7cX2Ia2Vb6xzuV6UEltD?=
 =?us-ascii?Q?N2Vg7+H4kvwk2swzrsUYCkp0vAZ87nx2czTyUuElt4f3TINrrL9vxH6bxwhG?=
 =?us-ascii?Q?1yDNseB8cIua2XaWeXfWo7faYRtRdOh4foY2KkPlz4rbB+re+Lkw1fV/OLgQ?=
 =?us-ascii?Q?PfXAuAYCok6jWXPacLMs1KTxpSDT520sjGzxeAYI9hIZBi+LnW8rAliQgB9F?=
 =?us-ascii?Q?ONsWCHPrTPdUA9tIgTKvkiBMnibPER/gn5k0HQFTGagp5pd07hwfCl+5oQHg?=
 =?us-ascii?Q?3hvY7TMjsiwm/4sLXh6fSSXe3TrrWQq59EgvAxg+CcahUfpjwiLKzMFIclKb?=
 =?us-ascii?Q?REaatJoasNXr5X8gObGRNChUPYzrzi9q?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:43:55.6563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e3a634-e7f6-45f6-11fe-08dcb1560f1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6939
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

On Fri, 26 Jul 2024 14:38:08 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Make use of nouveau_cli.name instead of nvkm_client.name.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/client.h | 5 -----
>  drivers/gpu/drm/nouveau/nouveau_chan.c        | 2 +-
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 3 ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c       | 2 +-
>  4 files changed, 2 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h
> b/drivers/gpu/drm/nouveau/include/nvif/client.h index
> 64b033222c56..5210007d7669 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/client.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/client.h @@ -18,9 +18,4 @@ int
>  nvif_client_suspend(struct nvif_client *); int
> nvif_client_resume(struct nvif_client *); 
>  /*XXX*/
> -#include <core/client.h>
> -#define nvxx_client(a) ({
>           \
> -	struct nvif_client *_client = (a);
>           \
> -	(struct nvkm_client *)_client->object.priv;
>           \ -})
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c
> b/drivers/gpu/drm/nouveau/nouveau_chan.c index
> f568ea251e3b..a58185171db8 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_chan.c +++
> b/drivers/gpu/drm/nouveau/nouveau_chan.c @@ -78,7 +78,7 @@
> nouveau_channel_idle(struct nouveau_channel *chan) 
>  		if (ret) {
>  			NV_PRINTK(err, cli, "failed to idle channel
> %d [%s]\n",
> -				  chan->chid,
> nvxx_client(&cli->base)->name);
> +				  chan->chid, cli->name);
>  			return ret;
>  		}
>  	}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 950184b2c1c2..526c16f79196 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -644,9 +644,6 @@
> nouveau_drm_device_init(struct nouveau_drm *drm) if (ret)
>  		goto fail_master;
>  
> -	nvxx_client(&drm->client.base)->debug =
> -		nvkm_dbgopt(nouveau_debug, "DRM");
> -
>  	INIT_LIST_HEAD(&drm->clients);
>  	mutex_init(&drm->clients_lock);
>  	spin_lock_init(&drm->tile.lock);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
> b/drivers/gpu/drm/nouveau/nouveau_fence.c index
> ba469767a20f..1450fb8c57c3 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_fence.c +++
> b/drivers/gpu/drm/nouveau/nouveau_fence.c @@ -200,7 +200,7 @@
> nouveau_fence_context_new(struct nouveau_channel *chan, struct
> nouveau_fence_cha else if (chan == chan->drm->channel)
> strcpy(fctx->name, "generic kernel channel"); else
> -		strcpy(fctx->name, nvxx_client(&cli->base)->name);
> +		strcpy(fctx->name, cli->name);
>  
>  	kref_init(&fctx->fence_ref);
>  	if (!priv->uevent)

