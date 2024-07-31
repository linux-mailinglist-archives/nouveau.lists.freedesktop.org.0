Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0B898979C
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD9910E0CB;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I7KvXgCi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0313710E6A5
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 16:53:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLydFQ9YdbNOlwd2yIyHjEapFef1hM4XrxzwRPGWWhIlhaFIvNeXWcrGjdXUf6K16lJ/9BFCCXP/aH7iPhT0N55LhaXMkHcio+QhoCxwr4202JAub4x4fHGBd5+Vp2ByJtB8tYzEEzLOeEc6BXXbqmp7i8ygWPZKdGy0U9FMKC64tUN5GCFqPGNTn7w5iiVVG9IPEpjjnrKrj363YGCBuGFacF1cZuYUZ+GF2O9brzopbZhs3zrvFFUNMT976ztk+ZvZvK1gJSPRDkUsjmdxLr5Al4yzolvqLPpNnndGIkGo74QyI8mmIT6hZJeapppYOasa+UwfNGSg8aBK81lKtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NjFhrQDhrEmfeNnR+HPtNNOmmcDgk+hhedhuGsmM638=;
 b=qM4R8YIELJINj1sAcPUM4LxyIdTSo4wDuX53p6NNY3XOoxjAxCRFuUWqtqGWkRRdHgeur7z0KCL92qTh6R+ce2mNZlDNWLWdyMIiDt/z8sl5mzU5bmfRYv/r+qg/J4HAhUKIbX+l2BlgUZhulDgUwL4UM0Yefz1y3r4886F8XGlaYs9LA8Dr6vLcic8EWaLK9L6iZF/nVrZ3Jnqld7kgEU075nVnUkkT6H86ChE2SH6KhpdM853HBkfkOO60QgJUP2E7KMuCoGgrRe8gVnCoZaIapgaG7p2htcwYxwPRZ+xgcFkukCsD+FkRt94kA8kHkBIHjQCUiCLOhBBgEWaFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NjFhrQDhrEmfeNnR+HPtNNOmmcDgk+hhedhuGsmM638=;
 b=I7KvXgCi3qFZv4k2KTFwW9L8xNqEi0MzacGSSCQpFzhx1iBw8Nu5r7ciCCXyGQer0GntD5J/sRGUlKqAUkUvKuuji+wKuNPjhXu51t68ZHcY9mRCCi5b7Ta4l/HpN4To2MItCN27Bl2d7AAaneVE7tfmapwUqs15ilZuGEpB7zch6B1ksqGiiSSXFKTMhJnPXSjCGbM2r1l/zY+P+0TPj5coh+5BkbUvtcWZh8+bLh+6d2kaUg1lWzCIEFcFZKZWVl+0DMa7ke3s8hWEnPh/6cYrsReoXuYinBuxjYhC7c3R5K0jekProscbxkkQGfZ46BPFSi52HBSBws7lV7L3UA==
Received: from BY3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:a03:254::8)
 by SA3PR12MB7997.namprd12.prod.outlook.com (2603:10b6:806:307::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Wed, 31 Jul
 2024 16:53:46 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::e3) by BY3PR05CA0003.outlook.office365.com
 (2603:10b6:a03:254::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20 via Frontend
 Transport; Wed, 31 Jul 2024 16:53:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 16:53:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 09:53:33 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 09:53:33 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.8) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 09:53:32 -0700
Date: Wed, 31 Jul 2024 19:53:32 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 06/37] drm/nouveau: move allocation of root client
 out of nouveau_cli_init()
Message-ID: <20240731195332.00002d1d.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-7-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-7-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|SA3PR12MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 816e09fd-e16e-42d7-42c9-08dcb18157ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BjCRlMgTMeXKAp0YlN9SpfjX70wumh30mSOPQotD1/O4KXvrjMSxl8n0InC8?=
 =?us-ascii?Q?XtRY9crUcY4BRIeOlKGdsdzWJC5PLrnG8vDspYV/kpBdoy9tt+sqR2qgxL07?=
 =?us-ascii?Q?W9PjY77af/sLSSPqrRAio5HqOA+OKRfmvPx1In49wrAem+8PQmXw8+wMPPGH?=
 =?us-ascii?Q?MR2ditmKdZ+/7vKt58UXmSR3+C++LG9k27Tu6koxtDxsc+ai9BOg0FBhexaW?=
 =?us-ascii?Q?+uvjxlPPiMETtd4OOE/5iEwhZsOLT3QmRD1HVge0fLfVlOn3hjfTwISJZGaF?=
 =?us-ascii?Q?ol+FGjJ+2QBFU7Z0c5qNDZ+iUXAyQkDtfWYWmk+qow/u//dnLRKSM0MwLNgW?=
 =?us-ascii?Q?Sqv/NzvmKBVbh7rqxTJ17FH+hwndJIPCk2iNHgg6GVh12Wd/btpjrdTKxGbC?=
 =?us-ascii?Q?5Q59FrReV56q50/wfR8tlDw34pVIV0j2ntYb50BshQ8uhdjsx3bX2UqCQk6W?=
 =?us-ascii?Q?aXi6MJW28vfoS4upJhfhZNszxEDP9vQ/NmVI5Rle58CblqxyxYEC75JQ7H7x?=
 =?us-ascii?Q?wXEv9aB01hfCvKGjhjWPzlHTTPwJDkCFHWASsT3Wsrff0AMCNWoEXSoyjx4I?=
 =?us-ascii?Q?Dv7xH9Diwdy3hsamOjtkBNS2qiQeYyNGwCGEWlfq9e3XUXBdYhkKeKlnGRcZ?=
 =?us-ascii?Q?DDzc0/c7Fivl7jKWDklU+YyIQuFkub092B+9jobMoed8Pv7rs0iZx3nwP+uv?=
 =?us-ascii?Q?se2+DZxpS6ljIArlN6MlaDs33PyReJXXr2jP2v1l5lp61jRKHAffrpbJImHx?=
 =?us-ascii?Q?XYwu1xEJ52CG3dIecAsXQQTGTRTnz7GQgoPY63mgku8+4btiKSwZBsmJ4qPX?=
 =?us-ascii?Q?NEs1O8An0Xp0qm40oTqEIJ4wx7yXRgNk0DlHvxif6WgXgMWAHlZksFQ2fvXV?=
 =?us-ascii?Q?y8BSVb6kxDn2kpwE6emDLcwCMzmpF5Z04ejlwPQB7KLJmSs2O9r9Dl/zPbIP?=
 =?us-ascii?Q?DQZ2jbiHxOsAVjnUNSYS5bK4dqABmimusyZoS61ICchWVppANWjPg5puPqhg?=
 =?us-ascii?Q?LOXa2eovsguk/KTr576c35iSCbWTVX+nGOarsLjrvV1ZUzcHjskJM2EUIBVW?=
 =?us-ascii?Q?/pVrFYq6iPHNPTW5oesAcafmAtp7+wATrrFgPBDI4QXXYpFaad0kCCkBfrsx?=
 =?us-ascii?Q?OFbZYj6oIEFvRlgSOdMh8x2+9rJA13DT1Xmx2E2GHSxMKLOomzyE3pzCVIhm?=
 =?us-ascii?Q?qOTpXUuHGvxuvcPmcSi7JN7O5d/V+YChxDdQbNKJL6sOJgaPQEielOa8Uxaj?=
 =?us-ascii?Q?+UyleXkGWtJrnZ/wuxN6QVOWwkgCz9SzDYkqYa45KC47Lk/bG2xgrdz9wvka?=
 =?us-ascii?Q?sBfXgxF+98dASDSHp5Shb/y9bAzxqwsGulqE2Bwn2hhdVJgyvPOScnfyc5WA?=
 =?us-ascii?Q?odlUGrkCfgWZAgSajZFCOMdUgIzYcoojFk93SxIqTb7gHyntxcUjsE2WE77H?=
 =?us-ascii?Q?r0Wdfn3SlaH5weyLkPCwLaF4p4FwVjPP?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 16:53:46.0288 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 816e09fd-e16e-42d7-42c9-08dcb18157ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7997
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

With the workaround "if (cli!= drm->master.base)" removed in
"[PATCH v3 34/37] drm/nouveau: remove master":

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

On Fri, 26 Jul 2024 14:37:57 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> drm->master isn't really a nouveau_cli, and is mostly just used to get
> at an nvif_mmu object to implement a hack around issues with the ioctl
> interface to nvkm.
> 
> Later patches in this series allocate nvif_device/mmu objects in
> nouveau_drm directly, removing the need for master.
> 
> A pending series to remove the "ioctl" layer between DRM and NVKM
> removes the need for the above-mentioned hack entirely.
> 
> The only other member of drm->master that's needed is the nvif_client,
> and is a dependency of device/mmu.  So the first step is to move its
> allocation out of code handling nouveau_cli init.
> 
> v2:
> - modified slightly due to the addition of tegra/pci cleanup patches
> v3:
> - move nvif init below drm_dev_alloc() to avoid changing
> nouveau_name()
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 36
> ++++++++++++++------------- 1 file changed, 19 insertions(+), 17
> deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 140e27af0d64..eb154b44c154 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -209,9 +209,11 @@
> nouveau_cli_fini(struct nouveau_cli *cli) nouveau_vmm_fini(&cli->vmm);
>  	nvif_mmu_dtor(&cli->mmu);
>  	nvif_device_dtor(&cli->device);
> -	mutex_lock(&cli->drm->master.lock);
> -	nvif_client_dtor(&cli->base);
> -	mutex_unlock(&cli->drm->master.lock);
> +	if (cli != &cli->drm->master) {
> +		mutex_lock(&cli->drm->master.lock);
> +		nvif_client_dtor(&cli->base);
> +		mutex_unlock(&cli->drm->master.lock);
> +	}
>  }
>  
>  static int
> @@ -253,10 +255,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const
> char *sname, INIT_LIST_HEAD(&cli->worker);
>  	mutex_init(&cli->lock);
>  
> -	if (cli == &drm->master) {
> -		ret = nvif_driver_init(NULL, nouveau_config,
> nouveau_debug,
> -				       cli->name, device,
> &cli->base);
> -	} else {
> +	if (cli != &drm->master) {
>  		mutex_lock(&drm->master.lock);
>  		ret = nvif_client_ctor(&drm->master.base, cli->name,
> device, &cli->base);
> @@ -626,7 +625,6 @@ nouveau_drm_device_fini(struct nouveau_drm *drm)
>  	nouveau_cli_fini(&drm->client);
>  	nouveau_cli_fini(&drm->master);
>  	destroy_workqueue(drm->sched_wq);
> -	nvif_parent_dtor(&drm->parent);
>  	mutex_destroy(&drm->clients_lock);
>  }
>  
> @@ -636,15 +634,10 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  	struct drm_device *dev = drm->dev;
>  	int ret;
>  
> -	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> -	drm->master.base.object.parent = &drm->parent;
> -
>  	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
>  					WQ_MAX_ACTIVE);
> -	if (!drm->sched_wq) {
> -		ret = -ENOMEM;
> -		goto fail_alloc;
> -	}
> +	if (!drm->sched_wq)
> +		return -ENOMEM;
>  
>  	ret = nouveau_cli_init(drm, "DRM-master", &drm->master);
>  	if (ret)
> @@ -726,8 +719,6 @@ nouveau_drm_device_init(struct nouveau_drm *drm)
>  	nouveau_cli_fini(&drm->master);
>  fail_wq:
>  	destroy_workqueue(drm->sched_wq);
> -fail_alloc:
> -	nvif_parent_dtor(&drm->parent);
>  	return ret;
>  }
>  
> @@ -737,6 +728,9 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>  	if (drm->dev)
>  		drm_dev_put(drm->dev);
>  
> +	nvif_client_dtor(&drm->master.base);
> +	nvif_parent_dtor(&drm->parent);
> +
>  	kfree(drm);
>  }
>  
> @@ -762,6 +756,14 @@ nouveau_drm_device_new(const struct drm_driver
> *drm_driver, struct device *paren drm->dev->dev_private = drm;
>  	dev_set_drvdata(parent, drm);
>  
> +	nvif_parent_ctor(&nouveau_parent, &drm->parent);
> +	drm->master.base.object.parent = &drm->parent;
> +
> +	ret = nvif_driver_init(NULL, nouveau_config, nouveau_debug,
> "drm",
> +			       nouveau_name(drm->dev),
> &drm->master.base);
> +	if (ret)
> +		goto done;
> +
>  done:
>  	if (ret) {
>  		nouveau_drm_device_del(drm);

