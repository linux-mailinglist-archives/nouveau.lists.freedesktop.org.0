Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 921309897B1
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695D610E2AC;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a4Lbi4q9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7E610E52A
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAcKl6tH9+AfWhZfOI+Yc0h18hqrQlcHJdsNLrXi4zS73UJ5v8snoLPOpmcgCQLnupXw0gn9vVrXJ3yB2DySt/tuJ8iL04meGwufvtXDeIaiaVxGt+ERhB3EAMamz5LL5Y5CwJTo1Awol0oGMHzjnqUSHoel9ZerS+/H6rnix3eI+byqWkE53aUfcTdnOd7MLAJ8MEK4Ns0V2L8PlE31OZNoUD74nbuP1rqF0lqjK0uiacsMtseCN+nfn9GZ0L6ass9xM8+dwyN7I2bGBoN6HNCH9Aog+j/OyfcG+HttJJFlDmr5vTA4Ev+IAUFveYZICfLVh3A+5fDWLOdbXV3vJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM5v6qvmbFx6JQA0lxnQUFpfFFcsOaeHP0UwB4KzWP4=;
 b=wvG4iPYg+XLFPI5GpkGRl2rdWNvYKdSIf+ZDcP5rV7CnNG84sJs9uCXB6YQz1vM7jtgH3Ra6G46ab79WJwZ2SJr8zOeNSOaFeNPpGK0jw4SnoNiGjijPQDGYA80RzmXkdgzxga+ESGVtOdxQQMWBf0E75X6SRvUpI4nEjeHHs2xOvy8qI9knzXEZoef1HVTUOD04y+j5BQvD2BoMZtGpHYkCGnvIjoUJlZ37wNkkHEizskjivwxMCKNslzlXVs4F0hZDk0zCbdB7Hj1X9xUySry5QCTbDTt/WmW0kwNz/gGfWqFskHiCVQ8uubMfY7qYHDHy4PNtJS5lh5Ef8R+j4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM5v6qvmbFx6JQA0lxnQUFpfFFcsOaeHP0UwB4KzWP4=;
 b=a4Lbi4q9lk3PL71LmmdgOdAJ/MEoobUFuv5BbyD9yLMluP6NreyJUJ+8kfMJLaJmSV76+n9iosfv5ENftzDriVDfr0+RYlOT6fIT7YnhVjdYgRv/jK3K/eeOkFH9pj7Oun2gzHWsP+E0WH55ngjfB706FOni/HN4tz4SOwD9PH4T4sNaOFJgKZji2nuO1n6hAA1eWYDy6aDte2PWIl1VJzYbmXTaybRoHQK29YFHdsePsGwU3V0uS9VVqID43cWLP3JHbPhdUX+Wubyc3JwxOHVbq1dGYzVzMfcF6qf7YjGYilK76w19O/ZNETjg0L66GPPEXhxYpW23XB+HHhqDNg==
Received: from CY5PR13CA0078.namprd13.prod.outlook.com (2603:10b6:930:a::40)
 by SA1PR12MB6893.namprd12.prod.outlook.com (2603:10b6:806:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 11:42:19 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:a:cafe::2b) by CY5PR13CA0078.outlook.office365.com
 (2603:10b6:930:a::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Wed, 31 Jul 2024 11:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:42:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:42:03 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:42:03 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Wed, 31 Jul 2024 04:42:02 -0700
Date: Wed, 31 Jul 2024 14:42:01 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 16/37] drm/nouveau/nvif: remove nvxx_object()
Message-ID: <20240731144201.00005a6e.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-17-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-17-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|SA1PR12MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: f6586dc4-ec5c-431c-8665-08dcb155d52a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TPhJ9s7rX0+rg4Z5QdK2eaatncognmqPki5YFIfalinCvA0Pac1msSDqEcK4?=
 =?us-ascii?Q?WadvJjAfULehsix2z7LEzhqCR1ALaP8N46WJf1e7oHNgl47Wd4haKYiBJ7eT?=
 =?us-ascii?Q?EdmE4qHWK4d42ApzV/5d/fPS9gQSc73hVfx288F1RRQEYSZi+O+OupZKoutt?=
 =?us-ascii?Q?FHAI4SgVwW0iXdhGug684s4mOrBGUlEAjRPEwJfquTsjYwNi1ssDgSnhDeTj?=
 =?us-ascii?Q?TgBqsD9/dHLtW874MDDNc+jEWsDne3ZWRa8mJdjPTkvwqsLsMsr658eMQNXE?=
 =?us-ascii?Q?Tb1YWVzSh/KvQMaaUvW1bBO0CCmKPUquptfMBMb1W9KXPc7CLDg33LcHavzm?=
 =?us-ascii?Q?3lZgwq8QxQElpQBbCf0TXWgRlZf2AkALK4FMQb7SH7yEUNen4KX4NYv3zgsR?=
 =?us-ascii?Q?NrEg21dR04Iz8e22hnnJbklyPxaFCI0qzFhgG7KAPJ2MP8qHdLWFJRALjp1M?=
 =?us-ascii?Q?Q7410YAf5RHqk08RUDiNmM80MUHvtgg7VSYhz1Hswal0jjZTUDYJYb1oaH6Z?=
 =?us-ascii?Q?gMyXRXTQ6EQKH0Qs1hMI4xYkfuJNRATky70RG0Yh/V0Cp8VImEmxfIneehY5?=
 =?us-ascii?Q?nLJo/5zjCaum1IoT5cUx5ZNrQd3muLzrFdhFBZQGaClhvxwa3GfgF+ewJObB?=
 =?us-ascii?Q?j0AU6WCsbDqmncxbhzUAWs6vsfMrPv1kj2dASmLLzGcctsgAXmrXVQ42onKT?=
 =?us-ascii?Q?Mi6wRVZ0ukOy2UJ5Wb27bbsVW6bVGZ3WNk1fRkw2svyrIIhKBg9D8JvF0m2c?=
 =?us-ascii?Q?77MfN8xU7I0Or8JaQsfwH2nnC6CGuuGXs/cPMq9DBAlErYRUKS3hmdY5l9Oz?=
 =?us-ascii?Q?QA8K3wWt5foA1Cdfmj0Q0uEDj1SF7hvzIX3LF9mnsghjSPQ2Cn7AarwWs5g6?=
 =?us-ascii?Q?etPghlaGj3sIJDX0+vIVF40MzfZpC1DanV6HVko3dcRA8QfK5BLpBQbyEcNU?=
 =?us-ascii?Q?bONfTNE/BRpu2oKBEYBdh6Czd3TEt1B87LoknaH7En/gCaydK2MUyKSmF/Xd?=
 =?us-ascii?Q?8DSX2rszVun55YZMlyQ0MhIwZsDib/Xnw2nQOayoygEreSMwG3KX957T+A3i?=
 =?us-ascii?Q?RgkYbI9T5yaT70Eb2klEHTdRCAkA923YqkVm20CmdXb59do6fXbjjGC+dNoF?=
 =?us-ascii?Q?AcZEUOqX3pS39SHfqpCHvIlLagGYcVDN5BddXYfR6aDdhhvqRJQD4q031tQE?=
 =?us-ascii?Q?OGo5bh/vCasqd4wzqneeq0eeNiaLK+t/TqgCUbdTpN35vXhmEX/R3AMXUjbs?=
 =?us-ascii?Q?G3cJELwl2oK9H44M10cm98/E6e7560BcKH9eh+kflWjpRZBLx5IeOoQ6nS4h?=
 =?us-ascii?Q?Jg1jMq5CQ8xIBMbqGi+1NrSA4+38WYuRlH1znxhkn+tCr5i/h+1ONRrzyIcv?=
 =?us-ascii?Q?RDWGNGGBFmdGMni29GEmPIX2Qts/6+R7SH8tPOtPkNZiMknw9EIXlmgJzuDT?=
 =?us-ascii?Q?m7R6wVZe0plLdcpuafaS08T//mPhGEyq?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:42:18.5032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6586dc4-ec5c-431c-8665-08dcb155d52a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6893
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

On Fri, 26 Jul 2024 14:38:07 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> This hasn't been used in a while.
> 
> Moves io accessors from nvkm/core/os.h to nvif/os.h at the same time
> to fix a compile issue that results from <nvkm/core/object.h> no
> longer being included.
> 

Better split the patches. One for the removal of nxxx_object and one
for fixing the compiling issues.

Regarding to the compiling issues, what causes the compiling issue? And
why it can't be solved by including <core/object.h>?

I am not sure if it is a good idea to move io{read,write}{*}_native() to
nvif/os.h as nvkm_{rd,wr}*() are using them. IMO, architecturally, nvif
sits on top of nvkm, it would be better to keep nvkm self-sufficient.

> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/object.h |  7 -------
>  drivers/gpu/drm/nouveau/include/nvif/os.h     | 19
> +++++++++++++++++++ .../gpu/drm/nouveau/include/nvkm/core/os.h    |
> 19 ------------------- 3 files changed, 19 insertions(+), 26
> deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h
> b/drivers/gpu/drm/nouveau/include/nvif/object.h index
> f52399caee82..478cbb8f2dfe 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/object.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/object.h @@ -134,11 +134,4 @@
> struct nvif_mclass { #define NVIF_MR32(p,A...) DRF_MR(NVIF_RD32_,
> NVIF_WR32_, u32, (p), 0, ##A) #define NVIF_MV32(p,A...)
> DRF_MV(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A) #define
> NVIF_MD32(p,A...) DRF_MD(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A) -
> -/*XXX*/
> -#include <core/object.h>
> -#define nvxx_object(a) ({
>           \
> -	struct nvif_object *_object = (a);
>           \
> -	(struct nvkm_object *)_object->priv;
>           \ -})
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/os.h
> b/drivers/gpu/drm/nouveau/include/nvif/os.h index
> 429d0106c123..a2eaf3929ac3 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/os.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/os.h @@ -34,4 +34,23 @@
>  
>  #include <soc/tegra/fuse.h>
>  #include <soc/tegra/pmc.h>
> +
> +#ifdef __BIG_ENDIAN
> +#define ioread16_native ioread16be
> +#define iowrite16_native iowrite16be
> +#define ioread32_native  ioread32be
> +#define iowrite32_native iowrite32be
> +#else
> +#define ioread16_native ioread16
> +#define iowrite16_native iowrite16
> +#define ioread32_native  ioread32
> +#define iowrite32_native iowrite32
> +#endif
> +
> +#define iowrite64_native(v,p) do {
>           \
> +	u32 __iomem *_p = (u32 __iomem *)(p);
>           \
> +	u64 _v = (v);
>           \
> +	iowrite32_native(lower_32_bits(_v), &_p[0]);
>           \
> +	iowrite32_native(upper_32_bits(_v), &_p[1]);
>           \ +} while(0)
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
> b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h index
> 3fd5c007a663..9b05612e6490 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h +++
> b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h @@ -3,25 +3,6 @@
>  #define __NVKM_OS_H__
>  #include <nvif/os.h>
>  
> -#ifdef __BIG_ENDIAN
> -#define ioread16_native ioread16be
> -#define iowrite16_native iowrite16be
> -#define ioread32_native  ioread32be
> -#define iowrite32_native iowrite32be
> -#else
> -#define ioread16_native ioread16
> -#define iowrite16_native iowrite16
> -#define ioread32_native  ioread32
> -#define iowrite32_native iowrite32
> -#endif
> -
> -#define iowrite64_native(v,p) do {
>           \
> -	u32 __iomem *_p = (u32 __iomem *)(p);
> 	       \
> -	u64 _v = (v);
> 	       \
> -	iowrite32_native(lower_32_bits(_v), &_p[0]);
> 	       \
> -	iowrite32_native(upper_32_bits(_v), &_p[1]);
> 	       \ -} while(0)
> -
>  struct nvkm_blob {
>  	void *data;
>  	u32 size;

