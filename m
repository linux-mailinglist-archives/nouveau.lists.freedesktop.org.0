Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B185A9897BD
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED36610E343;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="geaZqCes";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309A10E307
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 10:10:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uamqquAL6dODEeC+0I1tDty1tjJ5WpBlYpjfkabar2yx6svtEuRuD1Kd984hFEUEUi1eXUZEQxi4HSKq4NFzXlZS70Izt9FPpHB0ull8md57431GQlvaSdxDjsYW1ace2CO+S01nlmg9/0nVMy+6X/YYdgj6vS2WCaBF1ycP00UZqMe7PaykeW6GgyyfRjggpL4REcR9xwSZCm0SIMRliSOdfBIPlXnzEXEwiwXq/CTMmbpMZXFTbiVxyyqsTN8Q8jpnWBzo45L/+YN2dr5zROL7vs0yGctezinX/F+/SM56v0FWU70zwyZD4jIjoAgMOiFgf9ld2clRqybhW8gIBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvy0PCnt6qaFSqxVj+y2EOesMgFfDKughF+he7rhurk=;
 b=EPM0o6t9GsmrEPYIjiB7SaNePAolNPxSm++ay6eRA33EsOM1GDkC5EYKVw33Peeb1XWUAcl6/CEWwLaz9W78YvYNqT1VxYR0BYHb0iSAzuEiuLSRgIDvgh2ODo7k2Zvg2EGw1wdqkPCjHDv8mdL/7Rsn97KQVZ5DuLVkeMDUS27k5/z6EDtV7YjLZYaImQkRBbJTT7r7/YYnBOyzRnXOjf9uR4Eoj3fYFtxlI1V9mNdn/bjhVDum+j7KB6dVAjzfWAsIuB88D1KtseLNJHyHQUpIiNx5lKCpfvWgY0MwjqXhCaEYePJoi3cqnGUOVAZwBYLhyjx+PUIN7eFrYzHZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvy0PCnt6qaFSqxVj+y2EOesMgFfDKughF+he7rhurk=;
 b=geaZqCesTlfVOzIum808zNyET+yZuJYLOGZdCgLcB0B34GGiLpD0pifz74fTtV2dgv0GBYO6SDUlL4nGncpN5w4inUnEOd63P2Dc1eulugYJNKTDkJUvZioHuSP7RNz83Q4WhAIqy6Xsbym3OTkt9ge4S0IYkthGthLUojutQ06nGB0dVj17hVH39KeouMyXtKj8Dlpz/p0dPHLTY7r5/pCetJG+H9csB12cRdUh65Mh0mZG6zyRx4ibpdyz/EDpZ1KpWwjLT3a9FCFPXzbLL8iQA2NL2uE5mAyM0ww6rC0aT3gxFXNXSDcUJyUGy8ZO3O/2AmDBb622exaRaZIdLg==
Received: from BN9PR03CA0926.namprd03.prod.outlook.com (2603:10b6:408:107::31)
 by LV2PR12MB5800.namprd12.prod.outlook.com (2603:10b6:408:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 10:10:49 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::d3) by BN9PR03CA0926.outlook.office365.com
 (2603:10b6:408:107::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 10:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 10:10:49 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:10:31 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 03:10:31 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 03:10:30 -0700
Date: Wed, 31 Jul 2024 13:10:30 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 01/37] drm/nouveau: move nouveau_drm_device_fini()
 above init()
Message-ID: <20240731131030.00004a7f.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-2-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-2-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|LV2PR12MB5800:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f5b7d45-70b1-40da-6675-08dcb1490d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KDMVc6LTCvLRZ+8sTNjf1vy8K6erA/Jun96tDEgc38WvKysgw0YRHz3KkIoc?=
 =?us-ascii?Q?9uam6AzzlSRufXdzvc+rMDyjKANHISTYO/s4LleG9ysMeGpDSxKtqZIs+LjK?=
 =?us-ascii?Q?hFAOm3st5Uq5gsY61DdoVSTpsMNw8af8NiDRvKBM7WREJj1rYAeQubcSrdQt?=
 =?us-ascii?Q?+bh9ONhewh+RqWfcUdFGR1Ocdkz6KABEdYyNHNUwFbiQ5rBmiodUyzRGwB5b?=
 =?us-ascii?Q?kKrxiTWNTzDlGSbReOXeh8tZ6+IoyeZuuueyM30r+BbeOn2gtltu/OXZjOSi?=
 =?us-ascii?Q?csXIGoD/7YZTTs5+FkEaFuBsLNy3eamH7N++TIwxps1ED0nsvt2cVjAxFJDE?=
 =?us-ascii?Q?yV8dpsNhSHyfJ1QRdqxDZf3+HTpVCzXlaLBjAwXbUzwBrNZotuiC14xvEZFS?=
 =?us-ascii?Q?kNycqIIAvW1goiJusXhjpWu4QwCSMgq3fiUM6+VjRqvbqjVTfvI4O+W28/R6?=
 =?us-ascii?Q?WEYqWiEYcpQKPomnlwuc/nbxG3rn0VJIe2FPo68pGWjSql8dacfR7YOwIj1c?=
 =?us-ascii?Q?ixgHSRtoW0h14pTcqwELUrGU8U7Pk+XEYd/A+4CRoerpAGgBpldE19xpj8Ct?=
 =?us-ascii?Q?e8Tr31SPtY4Xz8zZQkaTRR8X5iTOdghDsNjllCpG5l5JQFRptXe8uBIm9ytV?=
 =?us-ascii?Q?yKNH9E/0yVmBLvxJTDC+7fRzEa7G4NOsYaSFywdItZ2kyB1yATLaGDTxeU50?=
 =?us-ascii?Q?USwmXfJKUYh9Ji6DgZrFunNTykeLDZrIdRb6ox/BA9KIKEGEiccIwsf7/iPh?=
 =?us-ascii?Q?xbxslSnrnur4hUlBmVvfCzkAOXgVAU62JjT7kztK+smJe7Z6t2MYjerATL2K?=
 =?us-ascii?Q?QSi28bWaZwKnpyxxnjFfvNgiw2frlG8QpU9AxlYnTIwS5n9s1jsTLIT5NAjA?=
 =?us-ascii?Q?Po/IhBTRwbeUF2rHXQ02zlmmgVLseJcBFRqfJmIcJKwW+/NEmuIwqZILM6Br?=
 =?us-ascii?Q?noZTqc15zznlUUcS8xHX+J0nQs0jIKvncyGUw2GT20OcSA6QYmidW7s4ag4d?=
 =?us-ascii?Q?fX76t+YtfN7MG+fGFW+5BNEOPJsrLlH0HZhGZfiniIlgi8y2HUWKp7qTyO5r?=
 =?us-ascii?Q?+DqjVzWv+v7hHgGlFwBeIQxF7LQG3GIBSug5S7hH+9yMfa6AOYAAVomWtZM8?=
 =?us-ascii?Q?7PXT5ho3vMf7iYu7jFmEk+ggrUdcTj0sTuA1pNKeyvP+ZoncPdXeYGBVm+9Q?=
 =?us-ascii?Q?7EGA7Z8HNdJzX/8KMQMtHzCk4l4v9aJYZ95+lFxMyj5+nHkqRlHofDkwNxk9?=
 =?us-ascii?Q?6gNOwxUZf/BCIKV0MFg0NxD2ACJwYtV5A/1fyvAh2pRFLZ00i6J3EJBmlmPO?=
 =?us-ascii?Q?toCuqY+3QgapJPMIZcdsJJWqzz69RzTEcvYExV3P2v3cr+qvPC8/3mmSxGFO?=
 =?us-ascii?Q?pnw0UecEXLO2wqf+fqTu6mqwk09DC9y3yXGzO7Bg2BCiwwNuOGEWemv++89e?=
 =?us-ascii?Q?hqKSWlOVKcCJCmNzZ4G63D0kXhjD2UYx?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:10:49.4117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f5b7d45-70b1-40da-6675-08dcb1490d6e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5800
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

On Fri, 26 Jul 2024 14:37:52 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> The next commit wants to be able to call fini() from an init() failure
> path to remove the need to duplicate a bunch of cleanup.
> 
> Moving fini() above init() avoids the need for a forward-declaration.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 106
> +++++++++++++------------- 1 file changed, 53 insertions(+), 53
> deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> a58c31089613..eae48c87e3d5 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -578,6 +578,59 @@
> nouveau_parent = { .errorf = nouveau_drm_errorf,
>  };
>  
> +static void
> +nouveau_drm_device_fini(struct drm_device *dev)
> +{
> +	struct nouveau_cli *cli, *temp_cli;
> +	struct nouveau_drm *drm = nouveau_drm(dev);
> +
> +	if (nouveau_pmops_runtime()) {
> +		pm_runtime_get_sync(dev->dev);
> +		pm_runtime_forbid(dev->dev);
> +	}
> +
> +	nouveau_led_fini(dev);
> +	nouveau_dmem_fini(drm);
> +	nouveau_svm_fini(drm);
> +	nouveau_hwmon_fini(dev);
> +	nouveau_debugfs_fini(drm);
> +
> +	if (dev->mode_config.num_crtc)
> +		nouveau_display_fini(dev, false, false);
> +	nouveau_display_destroy(dev);
> +
> +	nouveau_accel_fini(drm);
> +	nouveau_bios_takedown(dev);
> +
> +	nouveau_ttm_fini(drm);
> +	nouveau_vga_fini(drm);
> +
> +	/*
> +	 * There may be existing clients from as-yet unclosed files.
> For now,
> +	 * clean them up here rather than deferring until the file
> is closed,
> +	 * but this likely not correct if we want to support
> hot-unplugging
> +	 * properly.
> +	 */
> +	mutex_lock(&drm->clients_lock);
> +	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head)
> {
> +		list_del(&cli->head);
> +		mutex_lock(&cli->mutex);
> +		if (cli->abi16)
> +			nouveau_abi16_fini(cli->abi16);
> +		mutex_unlock(&cli->mutex);
> +		nouveau_cli_fini(cli);
> +		kfree(cli);
> +	}
> +	mutex_unlock(&drm->clients_lock);
> +
> +	nouveau_cli_fini(&drm->client);
> +	nouveau_cli_fini(&drm->master);
> +	destroy_workqueue(drm->sched_wq);
> +	nvif_parent_dtor(&drm->parent);
> +	mutex_destroy(&drm->clients_lock);
> +	kfree(drm);
> +}
> +
>  static int
>  nouveau_drm_device_init(struct drm_device *dev)
>  {
> @@ -679,59 +732,6 @@ nouveau_drm_device_init(struct drm_device *dev)
>  	return ret;
>  }
>  
> -static void
> -nouveau_drm_device_fini(struct drm_device *dev)
> -{
> -	struct nouveau_cli *cli, *temp_cli;
> -	struct nouveau_drm *drm = nouveau_drm(dev);
> -
> -	if (nouveau_pmops_runtime()) {
> -		pm_runtime_get_sync(dev->dev);
> -		pm_runtime_forbid(dev->dev);
> -	}
> -
> -	nouveau_led_fini(dev);
> -	nouveau_dmem_fini(drm);
> -	nouveau_svm_fini(drm);
> -	nouveau_hwmon_fini(dev);
> -	nouveau_debugfs_fini(drm);
> -
> -	if (dev->mode_config.num_crtc)
> -		nouveau_display_fini(dev, false, false);
> -	nouveau_display_destroy(dev);
> -
> -	nouveau_accel_fini(drm);
> -	nouveau_bios_takedown(dev);
> -
> -	nouveau_ttm_fini(drm);
> -	nouveau_vga_fini(drm);
> -
> -	/*
> -	 * There may be existing clients from as-yet unclosed files.
> For now,
> -	 * clean them up here rather than deferring until the file
> is closed,
> -	 * but this likely not correct if we want to support
> hot-unplugging
> -	 * properly.
> -	 */
> -	mutex_lock(&drm->clients_lock);
> -	list_for_each_entry_safe(cli, temp_cli, &drm->clients, head)
> {
> -		list_del(&cli->head);
> -		mutex_lock(&cli->mutex);
> -		if (cli->abi16)
> -			nouveau_abi16_fini(cli->abi16);
> -		mutex_unlock(&cli->mutex);
> -		nouveau_cli_fini(cli);
> -		kfree(cli);
> -	}
> -	mutex_unlock(&drm->clients_lock);
> -
> -	nouveau_cli_fini(&drm->client);
> -	nouveau_cli_fini(&drm->master);
> -	destroy_workqueue(drm->sched_wq);
> -	nvif_parent_dtor(&drm->parent);
> -	mutex_destroy(&drm->clients_lock);
> -	kfree(drm);
> -}
> -
>  /*
>   * On some Intel PCIe bridge controllers doing a
>   * D0 -> D3hot -> D3cold -> D0 sequence causes Nvidia GPUs to not
> reappear.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
