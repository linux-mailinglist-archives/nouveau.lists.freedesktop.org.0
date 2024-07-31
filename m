Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F969897B2
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4FF10E1ED;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KnczVxou";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5A910E442
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:19:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8qDICg4Sr7rRvhN2iAzTXlb7U3fGoaTYBlmVkdNkr5f4NIeWYG0sBnZTOKrX8ggM125V4LT2F0ZmJ9Y6t+jd9XGWOVFGHVCrOT3pvSRUC4tDij/cIw1KGvbkFI5RD65g9YQi2P0fNivP2atYIPcWIf7pW8fkE/5mwbLw/De7+apwV/EZa9QKsG4nP6Gv6ku4kCJr5cY9Tu8Tbed3OVg3XZLqCPsiBFq7wsiXIvnUkxVpGa9EbyiYyQ6Nkj+i9CCCobbF4s7rTARGBmez0mgIb3ZG8W7DwYTqFDgoUf+id7Wx69BudH9Ub0V2B4E5hm34+tnuezlCgsT1pA2qkYjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OE70gLzPhc2M5Z1/S+z7dFX8Dmo8W/DUT2YMiuHqZXU=;
 b=MnGQZDOGm2VR2ywUare8nYgSBO+ePIspoXo8mJq9HHfq8Jx8X9k/jH3niJz/5nikwEkPojY4xVP4JjrDaAZ+xQsvcxxI5U9QvtklkDGPBz3sElWrNqR7VIvSO9uNT3yLHf4ABJ/snR39MlZgU9wxcG1XbhkI7uKdGEh+ws3UCg3ap0518PzZyggzfrXvaaUXt7bguouXkIXq3O1Hfbl3kLkJhrwSZfHMAICakURfc46WQz1gKHHhoaxP75DJHavsaiW+7adecTHbQFxZ1g4w7+5nbOi6ARnygz1+rvHdKU6RraprOy531FfJ3NsQvdAIGRpmPpHT0DxhVpdbIaMD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OE70gLzPhc2M5Z1/S+z7dFX8Dmo8W/DUT2YMiuHqZXU=;
 b=KnczVxou0kYq9BtTvk8j69jnDOE5zZV1k6TXmPPp9Oy9G6HW05RE6TEIWjXGX/93CfWoLtRAXb4sbdYF6Wu28pldtHXk+Z28c7Z4dXHaioDSAY8eGXFh17xtu9JTuZfemqZcprla35GDEsKP53OA7e2mQGpkTbkp13v078FAjfwa4fRUvLNahm0RgKQLiSUnKMAHy2TZCtCoqaYb++R7LCbHkcDurKbIkJjC4iulC+c6UFkPfUIOaTCIOmpCPF11tMPie0IYTrw3D95eQVtt4q3rXLgwApxRv0a8+zkRT2omjcTxnu2fihrCcQAZoaSQ6CTY8/IWyAsn6yNe3LhzLQ==
Received: from BN9PR03CA0300.namprd03.prod.outlook.com (2603:10b6:408:f5::35)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 11:19:24 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:f5:cafe::55) by BN9PR03CA0300.outlook.office365.com
 (2603:10b6:408:f5::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 11:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:19:24 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:19:11 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:19:11 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 04:19:10 -0700
Date: Wed, 31 Jul 2024 14:19:10 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 09/37] drm/nouveau: remove abi16->device
Message-ID: <20240731141910.00005f1b.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-10-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-10-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: b9696537-a0f6-4990-025b-08dcb152a231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?//sLt+sQcG214J3hC0hsV0OEythuJw8y9xXMXDswpfKvZhYCGZ2taGLZYEjU?=
 =?us-ascii?Q?ecDaJlYSojrRqDq5UJXJ+3EjTcRbHYBiABm2qRyYtQ+K9XOJgizFfn7C+zXN?=
 =?us-ascii?Q?fhnQRB970znDqaIaz5JlVnJ6g7v3/FXRugPFapKBhC/dfuSfb/1hEMNWX2jl?=
 =?us-ascii?Q?a56Mb+Im81IuRGpL0LaABITs4M8e+8TWiJ2+LTbirmzUrNM3lRqyi6FsMVXC?=
 =?us-ascii?Q?oTb8ly81r3M4OuSrgIV+9fW1qLdIc67I5EL79iA3IJM8ObUYY3v8nQP+QQor?=
 =?us-ascii?Q?f09j9GZ3z1bvfhl+RWDQKDiEQtnTZoP4/6yHxwpFR7LIXyVJII+fgBIyEMtr?=
 =?us-ascii?Q?CXmD9F7oB4JCVZhzIlEkfK8vkpgjZBGQzGyUhUggMWHK/kWEKVv8EtsReMaB?=
 =?us-ascii?Q?LAZtuzW/exdu73qbrVAiApNbJ1Up+K/DZgE1pDm6laIZxnjnVi3n1CjFPiXn?=
 =?us-ascii?Q?S4soUAiR6rQIzRoU+nSAm6byWWErNb6bLAqEU3p3R3hxIPgxbYJdq5Xv/fey?=
 =?us-ascii?Q?dLXmGO82zwNSkcYf9txtHQZj7Nt8HTVnNbqEZ4vFxPp4g82uvwFLJd231y2M?=
 =?us-ascii?Q?KbIW16nxDlRfzwecWXqGJBdNK6xN69G2Qnrr75H2Qipa28KGjeUbc1EBodDL?=
 =?us-ascii?Q?2ud4ssF6vMR/1PlbyAsnpqVHPacqPX9f+gPM9oPO1Lz8D6EQmFGojzDx7Mn4?=
 =?us-ascii?Q?ES1qdwrHv+epAwqYZBHhTVieUsCssyWBApG7yl058iazAD5DZc5BGqOHSF5Y?=
 =?us-ascii?Q?JvVnPUw65ovrRuFZVrRrY+5lgKswb0m4fLYMLAtxB1j4XkAHnZi8yexY2WUJ?=
 =?us-ascii?Q?W9zmaHC4VytQDXCG427tI/1n5tzmq7SsWmvBpF3fgOnaxEx2tfqnN6kyS+si?=
 =?us-ascii?Q?KM7ICYUPZwX4eHCCCWrESUIkuOIJwZbUWxOSOfvNIAZxDLpjJ4LxdjLauGIv?=
 =?us-ascii?Q?bB7NtDCSf6BrJ0dD2DbI6W3x8w7Su9lzfA9kajYqeEc1rs9OItGQHPjJQU9M?=
 =?us-ascii?Q?zsawkXs0gNHKIDY/HVpzP2OEiEsGk71aILXA6Y6I2wW+WLe3NZ8J5LNSkiei?=
 =?us-ascii?Q?uTRdIMTt/XiouyP1iWjIHh70vARu5EvQgFG73+XmcaGHTmOp/GqC4FctDa4T?=
 =?us-ascii?Q?53siGbjrHWeRyLnXeM+mV2XRZj8M7/Ze0SJ9OeBD2rdWyT44bEmjCLQZUOZL?=
 =?us-ascii?Q?1OirbKICyAnt4a32QToMhzOmA+nHhC8nx8b4PzyFb4UCYxGLA3GyaeAofaQj?=
 =?us-ascii?Q?5w88tf/i02h623mPmfpzsvRL3Ap+UJZnSAgPcAmlh3HIxE8TmcH+Ni3JD+nu?=
 =?us-ascii?Q?7afFcvfYW0/NJDjJD9pYzpjjq0ft//d6o/ISOzPI/eJo/Dg5uDb1WfLL/mA7?=
 =?us-ascii?Q?Mb0ksEdPPxmyHXMQVORXDBBpbxVBBum7rKfj7CGKF6BSf7yxpR3C+BsZ9C2l?=
 =?us-ascii?Q?7/0aMmfW1W6d4m9LmcY2X7A5fFKBWYWp?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:19:24.4448 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9696537-a0f6-4990-025b-08dcb152a231
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164
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

On Fri, 26 Jul 2024 14:38:00 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> The previous commit removes the last remnants of userspace's own nvif
> instance, so this isn't needed anymore to hide the abi16 objects from
> userspace and we can use nouveau_cli.device instead.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 25
> +++---------------------- drivers/gpu/drm/nouveau/nouveau_abi16.h |
> 1 - 2 files changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c index
> f2f5031d539f..a05131920052 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_abi16.c +++
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c @@ -46,25 +46,9 @@
> nouveau_abi16(struct drm_file *file_priv) struct nouveau_abi16 *abi16;
>  		cli->abi16 = abi16 = kzalloc(sizeof(*abi16),
> GFP_KERNEL); if (cli->abi16) {
> -			struct nv_device_v0 args = {
> -				.device = ~0ULL,
> -			};
> -
>  			abi16->cli = cli;
>  			INIT_LIST_HEAD(&abi16->channels);
>  			INIT_LIST_HEAD(&abi16->objects);
> -
> -			/* allocate device object targeting client's
> default
> -			 * device (ie. the one that belongs to the
> fd it
> -			 * opened)
> -			 */
> -			if (nvif_device_ctor(&cli->base.object,
> "abi16Device",
> -					     0, NV_DEVICE, &args,
> sizeof(args),
> -					     &abi16->device) == 0)
> -				return cli->abi16;
> -
> -			kfree(cli->abi16);
> -			cli->abi16 = NULL;
>  		}
>  	}
>  	return cli->abi16;
> @@ -241,9 +225,6 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
>  		nouveau_abi16_chan_fini(abi16, chan);
>  	}
>  
> -	/* destroy the device object */
> -	nvif_device_dtor(&abi16->device);
> -
>  	kfree(cli->abi16);
>  	cli->abi16 = NULL;
>  }
> @@ -360,7 +341,7 @@
> nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS) struct
> nouveau_drm *drm = nouveau_drm(dev); struct nouveau_abi16 *abi16 =
> nouveau_abi16_get(file_priv); struct nouveau_abi16_chan *chan;
> -	struct nvif_device *device;
> +	struct nvif_device *device = &cli->device;
>  	u64 engine, runm;
>  	int ret;
>  
> @@ -377,7 +358,6 @@
> nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS) */
>  	__nouveau_cli_disable_uvmm_noinit(cli);
>  
> -	device = &abi16->device;
>  	engine = NV_DEVICE_HOST_RUNLIST_ENGINES_GR;
>  
>  	/* hack to allow channel engine type specification on kepler
> */ @@ -643,13 +623,14 @@
> nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS) struct
> nouveau_abi16 *abi16 = nouveau_abi16_get(file_priv); struct
> nouveau_abi16_chan *chan; struct nouveau_abi16_ntfy *ntfy;
> -	struct nvif_device *device = &abi16->device;
> +	struct nvif_device *device;
>  	struct nvif_client *client;
>  	struct nv_dma_v0 args = {};
>  	int ret;
>  
>  	if (unlikely(!abi16))
>  		return -ENOMEM;
> +	device = &abi16->cli->device;
>  
>  	/* completely unnecessary for these chipsets... */
>  	if (unlikely(device->info.family >= NV_DEVICE_INFO_V0_FERMI))
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h index
> 75a883a44e04..4743459ea14c 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_abi16.h +++
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h @@ -31,7 +31,6 @@ struct
> nouveau_abi16_chan { 
>  struct nouveau_abi16 {
>  	struct nouveau_cli *cli;
> -	struct nvif_device device;
>  	struct list_head channels;
>  	u64 handles;
>  	struct list_head objects;

