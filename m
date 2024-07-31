Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 350779897B0
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3AB10E2AF;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bS/GbUio";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4C810E6AA
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:16:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEsm5KpMACLHZh3fUlVzsHxbPTcEi37ErL00Mm56RNA8H9zczYK2MnJFrjbyfBBA7sr1mGEnCPMkJ0yuhnzwPHuzeUsnjLhrJ7vBTRSGGdWbD0DQsTg+oY/vNBPMdum6EQXrtGktsds8ZkbOONQIMGPf1dbs0M8mGjkKlK+Tsf3vXcSc2528BYCAEKduoKgnTFdMLR55w+tVYYe3CoBiNOBfiM/RVBg44qGZyYEGnQk41O/OvjkfaURiqgppbKcrKYMl+TDjmT/eN8ZcKKnXaaA4iFJ6fQwI9JLtlyGsu7zzDLPoXphxveG9+XRCthmODyRgUl9PJsdKz6n47JWvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hFXV1C/054HqIUf7KbOY/HvB0vJVNw8kJhcDOsVcQE=;
 b=mGis7DKFlZX89qPFwhAPFAkL11MG/HnW7DMY+nUrEaEqAZ2KQlkq77gf5Mgrsa2UxRix9zLW0sgSa8Im6SWcBam4aLWqCBh91ppinO+CDXM8gtXeG+4uwMeeQWTpQpKEoBUB98ELWaYegVPlrpQIG/S6kKpWuhbpEx4yQ+lGGznCcGSXc6thw5dTDZFaP59dYKH9ua/sVLHAtrugHkoFd+CmrGDOstzwfbvgOdsIMmrtFTy38cGnX3d+Qv7oyI2XxlckycdGEJ+xWFDBXlozZ10egl8JWlLPP+WATEnY4UkELmavgVhbhclBnImtc/A1CtkvzBuTUmvPpgSUitXAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hFXV1C/054HqIUf7KbOY/HvB0vJVNw8kJhcDOsVcQE=;
 b=bS/GbUioz6qLDFuIbixknVMuktBFdcAiBTvt3w/SVabVgJojZJ+5oKKqxCmSBCttR2HciO0sqRNfet2vWaT/SMHCtO6Mw5gxlRDk9Di32KrPFhhNhQndpfzqSjDC4JzuDPQTlE7f4bVHDYw3ApXk7EkV7KnwXAmI2IB9fspdOhqyyzXlwd+Xgmys/JPlTw81zYKo0ZK8mZ+2Za15JkWaWTwna3o42OkOWh78ZSyrhN7UcJzm813mY3ST3u+suEFjngrLCYDNMCVjyEbTp1dcRSO+2pxx6AFNqzmQmOqNWMSqPRvQW6EVhWVZV4cydHY1m4u+3gxeHJjJTflqgVSf4A==
Received: from PH7P220CA0053.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::15)
 by DS7PR12MB5885.namprd12.prod.outlook.com (2603:10b6:8:78::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 18:16:33 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::a1) by PH7P220CA0053.outlook.office365.com
 (2603:10b6:510:32b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Wed, 31 Jul 2024 18:16:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:16:32 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:16:21 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:16:20 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 11:16:19 -0700
Date: Wed, 31 Jul 2024 21:16:19 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 34/37] drm/nouveau: remove master
Message-ID: <20240731211619.000068dd.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-35-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-35-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DS7PR12MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c713906-84ef-4573-05bb-08dcb18ce814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qziVAHkemypC4QyNT7Kv9L0IDlhJhFGwBflEZzDCvHuXDlF14kBQzpcc1po7?=
 =?us-ascii?Q?bjA673Pj2+2d+Ta71tORHAue28eZ/bPBvBylBC021bvVQ7qFXdJYEdbb9sAJ?=
 =?us-ascii?Q?AaZeWTJK6LR2txP8esDs6PG3lLOZCRS50sX7nlzTj5ajqNV7U3ZjwX3RwwkY?=
 =?us-ascii?Q?b8de4AEmmvF2j7g1Kh1IuC+5YCf1v24fUWLt8DTeibei/E+2v/2Pxc7zG380?=
 =?us-ascii?Q?KMclQl9WyXjpCTNYTs5PHSQaiPpS8y/voQdpPFMxqdIZuK5wP+1hax7FDc9d?=
 =?us-ascii?Q?EHjLn1SIy88Ud2YrRbRVTzNtDWjsK77EKYq2MRYrsAqY0XahZwBtxBmPO3RA?=
 =?us-ascii?Q?SQsL0FpP2NhowKWie6ADkU3W0e9JXGlV2MHhH/MiUbUIh58cH6OaTFO2hAg9?=
 =?us-ascii?Q?eWE0N4SJvbr01NN2PcdidQ+Nz7KzYji4dN2lPjzngUkRVbRb7PvC36Sorqn6?=
 =?us-ascii?Q?/Dqr+RLohLJy4vuA0Jd1Y6vbf7NXdqrvs1YD/8ZfEgEgr5xFtcXm3HpbJvYs?=
 =?us-ascii?Q?wknZWRVENUyrRqhst0zdzaa8LyiVxGMMwc7NT+ieMq/xbiZaYM9XUtJnWbnl?=
 =?us-ascii?Q?HJq/svYS/w7O+RyUZJiD538iWfeetEJ/qb3Vt2qkJITb3O/6pOs8joFn5jPo?=
 =?us-ascii?Q?qV8F+9jePoeTYGZjg4YN8TMsZ8Qy8tzrvAOaELnQd8tZKVIIbsjn2LrfX9RN?=
 =?us-ascii?Q?exqklnfOLVgJtQeQQB5N7NI/SGDrcGjLYewRqBzv9n9PwUeRZeDoe5YMa7P6?=
 =?us-ascii?Q?OuqsdKZflRpCdD/IzUKUFQ+8M3gBZUg0f1s7Ec5bjWNaeOPt8SxfHRnp6bnR?=
 =?us-ascii?Q?S/LpqE1oZ/my52dmCfJ/OOUH0ZQmxKhhmq3vy58bWqCXyBwx8c9FF0E4SfXj?=
 =?us-ascii?Q?5knaV4WW1A/KAn0UlFgburw5LBE2hTdNRoGhNtK/dxr6r06/MQqs5wRhmpAC?=
 =?us-ascii?Q?+KmLPEDOLEcPQODec55myaP5v3UpYUQ5oxA3vVK5xfWZSGsJ/w7t7W/rDK/j?=
 =?us-ascii?Q?qujU041Zr0/rPtIwHcfCyrBPU9v4DliJiMHFbVpPJV29r4uEQRVTEhUCr3po?=
 =?us-ascii?Q?9jVwOwFGx91wDnE2CZvonwSLRlMPuI+mvzSk8N5vcITki9O3tu5o7seHS0/2?=
 =?us-ascii?Q?58fEoyJRl0wXQOy4k0N3QRoTS1vFOlg+ftWCiFSIsz2+q6IfWN/Aa0AEKEy7?=
 =?us-ascii?Q?tyEozUWzBBYVn5AhbDNp2JvpQW1OUVzTGUCBFZNm/pgWwW4s3HpHVfuE0T/5?=
 =?us-ascii?Q?6yqRsiVRpthSTko4ogxtMF0M3WC/h6t+Ykv08xyI73bTU+n+y54bd6rMVyXQ?=
 =?us-ascii?Q?y9mZJwASW3IwMYLarzy3ryo9GiDaTXa9eAf2Z+EWjuo0aF8YaLVsNOoZdjPo?=
 =?us-ascii?Q?epA+aTcQ4AE/wB3ia74QHYjBKctj7+JWruS5Ip84ve2DLso0t5jdeARgAgph?=
 =?us-ascii?Q?TG742LPJ9+GAbCCwT2l5FZH2k0lRVZmz?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:16:32.6306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c713906-84ef-4573-05bb-08dcb18ce814
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5885
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

On Fri, 26 Jul 2024 14:38:25 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Can you paste a link that shows how the workaround got removed?

> The only remaining nouveau_drm.master struct member that's being used
> is the mutex that protects its object tree.  Move that into
> nouveau_drm and remove nouveau_drm.master entirely.
> 
> A pending series to remove the "ioctl" layer between DRM and NVKM also
> removes the need for object handle lookups, and hence this mutex, but
> it's still required for the moment.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 39
> +++++++++++---------------- drivers/gpu/drm/nouveau/nouveau_drv.h |
> 3 ++- drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
>  3 files changed, 23 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 8b9c463d21ac..ca63d13efb25 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -208,11 +208,9 @@
> nouveau_cli_fini(struct nouveau_cli *cli) nvif_mmu_dtor(&cli->mmu);
>  	cli->device.object.map.ptr = NULL;
>  	nvif_device_dtor(&cli->device);
> -	if (cli != &cli->drm->master) {
> -		mutex_lock(&cli->drm->master.lock);
> -		nvif_client_dtor(&cli->base);
> -		mutex_unlock(&cli->drm->master.lock);
> -	}
> +	mutex_lock(&cli->drm->client_mutex);
> +	nvif_client_dtor(&cli->base);
> +	mutex_unlock(&cli->drm->client_mutex);
>  }
>  
>  static int
> @@ -245,11 +243,9 @@ nouveau_cli_init(struct nouveau_drm *drm, const
> char *sname, INIT_LIST_HEAD(&cli->worker);
>  	mutex_init(&cli->lock);
>  
> -	if (cli != &drm->master) {
> -		mutex_lock(&drm->master.lock);
> -		ret = nvif_client_ctor(&drm->master.base, cli->name,
> &cli->base);
> -		mutex_unlock(&drm->master.lock);
> -	}
> +	mutex_lock(&drm->client_mutex);
> +	ret = nvif_client_ctor(&drm->_client, cli->name, &cli->base);
> +	mutex_unlock(&drm->client_mutex);
>  	if (ret) {
>  		NV_PRINTK(err, cli, "Client allocation failed:
> %d\n", ret); goto done;
> @@ -602,7 +598,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>  	mutex_unlock(&drm->clients_lock);
>  
>  	nouveau_cli_fini(&drm->client);
> -	nouveau_cli_fini(&drm->master);
>  	destroy_workqueue(drm->sched_wq);
>  	mutex_destroy(&drm->clients_lock);
>  }
> @@ -618,13 +613,9 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  	if (!drm->sched_wq)
>  		return -ENOMEM;
>  
> -	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
> -	if (ret)
> -		goto fail_wq;
> -
>  	ret = nouveau_cli_init(drm, "DRM", &drm->client);
>  	if (ret)
> -		goto fail_master;
> +		goto fail_wq;
>  
>  	INIT_LIST_HEAD(&drm->clients);
>  	mutex_init(&drm->clients_lock);
> @@ -691,8 +682,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  fail_ttm:
>  	nouveau_vga_fini(drm);
>  	nouveau_cli_fini(&drm->client);
> -fail_master:
> -	nouveau_cli_fini(&drm->master);
>  fail_wq:
>  	destroy_workqueue(drm->sched_wq);
>  	return ret;
> @@ -706,9 +695,10 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>  
>  	nvif_mmu_dtor(&drm->mmu);
>  	nvif_device_dtor(&drm->device);
> -	nvif_client_dtor(&drm->master.base);
> +	nvif_client_dtor(&drm->_client);
>  	nvif_parent_dtor(&drm->parent);
>  
> +	mutex_destroy(&drm->client_mutex);
>  	kfree(drm);
>  }
>  
> @@ -742,14 +732,15 @@ nouveau_drm_device_new(const struct drm_driver
> *drm_driver, struct device *paren dev_set_drvdata(parent, drm);
>  
>  	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> -	drm->master.base.object.parent = &drm->parent;
> +	mutex_init(&drm->client_mutex);
> +	drm->_client.object.parent = &drm->parent;
>  
>  	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
> "drm",
> -			       nouveau_name(drm->dev),
> &drm->master.base);
> +			       nouveau_name(drm->dev),
> &drm->_client); if (ret)
>  		goto done;
>  
> -	ret = nvif_device_ctor(&drm->master.base, "drmDevice",
> &drm->device);
> +	ret = nvif_device_ctor(&drm->_client, "drmDevice",
> &drm->device); if (ret) {
>  		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
>  		goto done;
> @@ -966,7 +957,7 @@ nouveau_do_suspend(struct nouveau_drm *drm, bool
> runtime) }
>  
>  	NV_DEBUG(drm, "suspending object tree...\n");
> -	ret = nvif_client_suspend(&drm->master.base);
> +	ret = nvif_client_suspend(&drm->_client);
>  	if (ret)
>  		goto fail_client;
>  
> @@ -991,7 +982,7 @@ nouveau_do_resume(struct nouveau_drm *drm, bool
> runtime) int ret = 0;
>  
>  	NV_DEBUG(drm, "resuming object tree...\n");
> -	ret = nvif_client_resume(&drm->master.base);
> +	ret = nvif_client_resume(&drm->_client);
>  	if (ret) {
>  		NV_ERROR(drm, "Client resume failed with error:
> %d\n", ret); return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h index
> c55665faf2c1..f3da66a12dd3 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drv.h +++
> b/drivers/gpu/drm/nouveau/nouveau_drv.h @@ -203,10 +203,11 @@
> u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> struct nouveau_drm { struct nvkm_device *nvkm;
>  	struct nvif_parent parent;
> +	struct mutex client_mutex;
> +	struct nvif_client _client;
>  	struct nvif_device device;
>  	struct nvif_mmu mmu;
>  
> -	struct nouveau_cli master;
>  	struct nouveau_cli client;
>  	struct drm_device *dev;
>  
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c
> b/drivers/gpu/drm/nouveau/nouveau_mem.c index
> b112b62dca3c..fac92fdbf9cc 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_mem.c +++
> b/drivers/gpu/drm/nouveau/nouveau_mem.c @@ -80,9 +80,9 @@
> nouveau_mem_fini(struct nouveau_mem *mem) {
>  	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[1]);
>  	nvif_vmm_put(&mem->drm->client.vmm.vmm, &mem->vma[0]);
> -	mutex_lock(&mem->drm->master.lock);
> +	mutex_lock(&mem->drm->client_mutex);
>  	nvif_mem_dtor(&mem->mem);
> -	mutex_unlock(&mem->drm->master.lock);
> +	mutex_unlock(&mem->drm->client_mutex);
>  }
>  
>  int
> @@ -113,11 +113,11 @@ nouveau_mem_host(struct ttm_resource *reg,
> struct ttm_tt *tt) else
>  		args.dma = tt->dma_address;
>  
> -	mutex_lock(&drm->master.lock);
> +	mutex_lock(&drm->client_mutex);
>  	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type,
> PAGE_SHIFT, reg->size,
>  				 &args, sizeof(args), &mem->mem);
> -	mutex_unlock(&drm->master.lock);
> +	mutex_unlock(&drm->client_mutex);
>  	return ret;
>  }
>  
> @@ -130,7 +130,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool
> contig, u8 page) u64 size = ALIGN(reg->size, 1 << page);
>  	int ret;
>  
> -	mutex_lock(&drm->master.lock);
> +	mutex_lock(&drm->client_mutex);
>  	switch (mmu->mem) {
>  	case NVIF_CLASS_MEM_GF100:
>  		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
> @@ -154,7 +154,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool
> contig, u8 page) WARN_ON(1);
>  		break;
>  	}
> -	mutex_unlock(&drm->master.lock);
> +	mutex_unlock(&drm->client_mutex);
>  
>  	reg->start = mem->mem.addr >> PAGE_SHIFT;
>  	return ret;

