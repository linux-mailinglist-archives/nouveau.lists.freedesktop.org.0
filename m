Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4CD9897CE
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F5610E373;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mQi1pFuJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D94A10E6A5
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 17:04:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnrhndrxUKuKfUbDqbFzQoarj6uprNNPAzogSA3njDEqo4zs5eS6GB7AZo3yWW6SchRxQh1mkZe5/picYQw4fbuq2FG2elgZhuZVdHTR87qr0iK+7sN7tkevmo+H43X9g/Wyd+yidm00PRos7oL5ZJEURNxeJkWvVx+bX/gbcKY3Qte8BQLwYD9KmY9RpBwsoIiFjT9XXNLhCOpGgTWHZNsTlBDAOClFKyi2crDG68FusDchU84Gmlbdjt40v9aAEe3dvUvFCuCcEqNK8KaWeZtUutzjYpmDJdhdZwl+1WNwcOF+GN3r0Dnvu+Q9hRmGBQVy4WdZH+OycyKAyIxcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tbkze6UXQyShC4IzlhCAgN2dOm50gKeHD9BBeC0EedM=;
 b=Ry3+hQDD2s36Sjl2XtyrF8CvvuwJ+09HYuYC/5hFuLKiLqzWaCvUrNBJ/DmqeusV3qifWhZS4GB3rING+UPhm0HMY1kpgGooXtGyy1EzS85hB+g2OrmD2iYL7fDXVWp0BDs5g9VopQORUahEy/Yhv5JZAY/zXsMxjXsYLGEm7o2H1of2i3wu57to6PRdyVvO31VtsmVVLFzNgmNw+JU/YUgzWcDoe+AonmQLpc54uYd/kH9KlgPmi5q5aIpYjQJTAgqrwdSD/OC2VTFwDUCye0qUjEdyXRb8e+BWtK60iJhLa6yIkz1UOcR+MPKTUcSHfpY1Pwe9jMJT9byI5SmCgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tbkze6UXQyShC4IzlhCAgN2dOm50gKeHD9BBeC0EedM=;
 b=mQi1pFuJSW1sw735ITPfO/QSeU8jzU7G7Exq/mcgMw1ot151daSOe3iXzADpmJIZQ5c9VlMQx4BvVvTQzy+Qg6fo3vqY78Fq3eUzYjEb3Bn8v0ZerogibCDk7750cFWJyuU95HfEQRUHV0q+yaquG9oIViyx6EHDDrYm6XtyBNSVLfjuXBk4a4uI9mp2VY8W8H+V9Sbv4I3YHZblglgKnQ7lZqPdapmmKfuqkowBvVwixnxdAPGN2764qbW6C/3g03ea2Qm3kWMke7lGnm4wYzujGrl0YS8tyx2BBUeihDyqKlSEzlYofXitIoKfuHo7rFjuufMk2n8haNiCys+SKA==
Received: from SN7PR04CA0174.namprd04.prod.outlook.com (2603:10b6:806:125::29)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.29; Wed, 31 Jul
 2024 17:04:43 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:125:cafe::a) by SN7PR04CA0174.outlook.office365.com
 (2603:10b6:806:125::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 17:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 17:04:43 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:04:32 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:04:31 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 10:04:30 -0700
Date: Wed, 31 Jul 2024 20:04:30 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 18/37] drm/nouveau/nvif: remove driver keep/fini
Message-ID: <20240731200430.00007b17.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-19-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-19-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: af0b5766-2717-451f-aa69-08dcb182df6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l5KTS/daFrtuZxIgQ5BcmPlpHRD2bFsy08XlM52SqjtVCZgCkNVeG1O+cryU?=
 =?us-ascii?Q?VsouIsril363HEG42NiPGIh80xb/Iaah1BI6Ejvt/HBpHzp05WBgcFWzzpzj?=
 =?us-ascii?Q?3zFHP11uZ3fH/DscWEzL4kZdIcYTT7XYLS8XWJnJ1HtP0s39+6BlYhsIqD1K?=
 =?us-ascii?Q?i0rB9BmSgYdbm+PO+2cNkNw5HGVz/fbUM2d4qOlfDXd1K8G/kSEGXD+h6vr4?=
 =?us-ascii?Q?csQ4fFhQuoQg+ZWH/nHaNs+6GsTQN9Pik8uUOP7X2jLeKxj4vz3BPvkEG2vw?=
 =?us-ascii?Q?FTHNFqpaDSLN1+tdITyYTY5l6Y0XtJ5oIHCLOOHJ/JvVww0XIf7udcAta1hr?=
 =?us-ascii?Q?XmFGpEpi7Du0Qqjz4AY9kPWPt4zONw+kLe51h1R9+7VUd9XktcpDbo1o0se5?=
 =?us-ascii?Q?7mmQFQ3D2P8EzVhTPC7aXVr3gikR8Y324CsXGTR9vzz8vkGW9ByyBdgsKImD?=
 =?us-ascii?Q?y6i3QC9iT0DXTSJy2QPfA+i2wNqw4pxxxyoqMbfIhzRvYwC3kTw6z4X8NAdA?=
 =?us-ascii?Q?v89w1hAuVXxSnGAmYie6tRhgYggDzzbg0jTzGAh2nOiks2uehgAzGyBkrw0f?=
 =?us-ascii?Q?eQOZcDy7mJ5gZEVYgyFAzB2F0MtLMBiroe2pYfRm2xgiRh9ftc1DVmL+LU5A?=
 =?us-ascii?Q?yyKazBEYhCQpGfayjq1jvV3IUijJAlEM8ZhWRpknoyLiqkKHRWiIMx82dys2?=
 =?us-ascii?Q?T3Z4lN/wlEEoOjZXZgTkeuXNPBQZDKEulChL+QcS5pMdzClztUTsG2nU8Nbh?=
 =?us-ascii?Q?SoDOATxn7r4f7IE2foEk3c+XLqZf5WAB4YZxIhSZb2vLuDeSZfg4gwS2qhQO?=
 =?us-ascii?Q?nE8xRjBZZI031DJNVB12wAbLJitGs/McTpz9k0jKDa4ABxgPBT1P/gvNCusD?=
 =?us-ascii?Q?G9YnF6yqafrsMtoURVEUwd6NUdQeouiPhH5exqkVGV69gHib9K5rbDnAQWQu?=
 =?us-ascii?Q?WXlF0v1cK6Jvs0N7l7Pej5Ckz5PYiGyd9SKFZXM6CdirSSJwRZSvPvlD9U/i?=
 =?us-ascii?Q?isLUmwuMUT844OSs8GXiArHLyYGD6e1hI/a8+Miqjz56Cbc0xtcOGNV0Vspg?=
 =?us-ascii?Q?+V0Q+XMGW5g7YCgfIKudFkzLFdM7BKpHJYBqcrgye4y+nQjZCNK+nXBQMP5K?=
 =?us-ascii?Q?eE1Slngjd4Nk6GdTbI8HCVNZUth369Q5TVZR9zB2pfvUZC0vRuodZFd5ckyN?=
 =?us-ascii?Q?hbPSihDSPDHyoQ2BdBSAjZr5GZoSrFPb2JQ3fgaLFXqsfdhs96+JclQ+sKXY?=
 =?us-ascii?Q?7bSpYgtlCrcBplTZrufieJY51yIwihsxpxF5F4WlUm9tKm+IF8ZO2+SkdglD?=
 =?us-ascii?Q?PftcLpgFIMWI9xvhYulyi8rsHNiqHvRaU9L0EIuhMr+Fo3uaEFdjoo03PkpN?=
 =?us-ascii?Q?LdcplAET/7YtJnNMZJ8T3M4ZYt3eYbuRfGDlz6hUxXr0Pce8ehibdq1Dv447?=
 =?us-ascii?Q?e4wDoV+kpWhL+hjRq/4qhck/ekxlruub?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:04:43.1045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af0b5766-2717-451f-aa69-08dcb182df6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468
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

On Fri, 26 Jul 2024 14:38:09 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

Out of curiosity, when digging the nvif_driver for reviewing this
patch, I found:

static const struct nvif_driver *
nvif_driver[] = {
#ifdef __KERNEL__
        &nvif_driver_nvkm,
#else
        &nvif_driver_drm,
        &nvif_driver_lib,
        &nvif_driver_null,
#endif

Does nvif_driver_drm, nvif_driver_lib, nvif_driver_null still have
valid users nowadays in the userspace? Or should they also be removed in
this patch series?


> These are remnants of code long gone.  Remove them.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/driver.h | 2 --
>  drivers/gpu/drm/nouveau/nouveau_nvif.c        | 1 -
>  drivers/gpu/drm/nouveau/nvif/client.c         | 6 +-----
>  3 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/driver.h
> b/drivers/gpu/drm/nouveau/include/nvif/driver.h index
> 8d294ce3cf0a..7b08ff769039 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/driver.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/driver.h @@ -8,13 +8,11 @@
> struct nvif_driver { const char *name;
>  	int (*init)(const char *name, u64 device, const char *cfg,
>  		    const char *dbg, void **priv);
> -	void (*fini)(void *priv);
>  	int (*suspend)(void *priv);
>  	int (*resume)(void *priv);
>  	int (*ioctl)(void *priv, void *data, u32 size, void **hack);
>  	void __iomem *(*map)(void *priv, u64 handle, u32 size);
>  	void (*unmap)(void *priv, void __iomem *ptr, u32 size);
> -	bool keep;
>  };
>  
>  int nvif_driver_init(const char *drv, const char *cfg, const char
> *dbg, diff --git a/drivers/gpu/drm/nouveau/nouveau_nvif.c
> b/drivers/gpu/drm/nouveau/nouveau_nvif.c index
> 9a7e3f64b79f..adb802421fda 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_nvif.c +++
> b/drivers/gpu/drm/nouveau/nouveau_nvif.c @@ -97,5 +97,4 @@
> nvif_driver_nvkm = { .ioctl = nvkm_client_ioctl,
>  	.map = nvkm_client_map,
>  	.unmap = nvkm_client_unmap,
> -	.keep = false,
>  };
> diff --git a/drivers/gpu/drm/nouveau/nvif/client.c
> b/drivers/gpu/drm/nouveau/nvif/client.c index
> cd5439b73ac7..85ad5091e8e2 100644 ---
> a/drivers/gpu/drm/nouveau/nvif/client.c +++
> b/drivers/gpu/drm/nouveau/nvif/client.c @@ -51,11 +51,7 @@ void
>  nvif_client_dtor(struct nvif_client *client)
>  {
>  	nvif_object_dtor(&client->object);
> -	if (client->driver) {
> -		if (client->driver->fini)
> -			client->driver->fini(client->object.priv);
> -		client->driver = NULL;
> -	}
> +	client->driver = NULL;
>  }
>  
>  int

