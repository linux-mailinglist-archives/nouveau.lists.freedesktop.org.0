Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6599A9897AE
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F9010E20F;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DCEkAbot";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EFD10E229
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 17:21:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y5B/jJ3r/5i2d8YpDTtme6doFXhu7s9a40f2ziv1mUEuEWiEdCdoPeWs3J7bwuCbWNe0+1W2YI91BtLCH9+td1Dgs1N6/9c/fDEziMqypbcludEcX4yE28oHQxJ/FCVWUTye7Mhy9JeDKM+CpLpEPdB8ItTPok7baN2KkdoEFrbU7EZ7ksrSKNiY9KtWcM+Z/lK5ufqnKf8mybFSdHS4wTD8kFWfhqJlhcRdGr17SeCBb39yvqkzGRSyNC7U53+wdL+VnYqHSlZgpNHZoOIqR0PYaKvuRel5mURhw91nv8MxlZBM84lS/BIuULJceA8qqmhlufcEAcBLyJagErtk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMGwNz+xG60cRsdTJMxBK8rd3VWfHA/LbKiq63TTc3U=;
 b=ThufcndPXaMqIiM8dK5mw3qqgynsM/ijw1JvBR7sbNNN6xyUphO5drUtVGwTbaAyZeZR8fwEE+kMv9x7WxV2ozU2k5j0yTmYHJ+K1TjlbWA/h5M43h9pGdovz+5sMHeSR3w87/11yBXGXZBnFICQdwQJha2eWz1bXnG51FG/zzdaF6DDl4dNZUxuJ/Cf0kaZDJtcnO5Dz3Js3TNUc4PW2pOb6/uQD90a3F0qyZKCNmxSg8+juWWrw0NK+IfgBgzHT649puQUwAFBNpn3f6GS0gRwEHUxRdjNC5/ieaIfVUKd8k3lY1EuCxwTLdyM4IarRpA1IeijPQf5GHC4qlz5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMGwNz+xG60cRsdTJMxBK8rd3VWfHA/LbKiq63TTc3U=;
 b=DCEkAbot8f18+eW2ML6cBfEHe2JO4G46FkCrvq6kihMZDuDdy6QCjNmlSry6Zj2SjFUDHmobIw+iEujh1UswssKlmskUCWgR1ZjAnh0yPgvTqSCnye9xfBPSvlpoxwjybapN15zvHqU53tQi7NbGykQELZ5RcPtAHAC/wvRTj1neRN0R93lGB9SdQrgAztscP8Mo/PLkRjKSHIx60nT18KWZ51zE3/21uwpmKS1ZwxCPBtL1+kU64xpWjde+0otAqtvwdMuLl5oPaahsAAjdaIkZ4wjV9IpvZzOH5Iu3TXduUPcu3B2wfuLSooZzeuSwHqjcLzevFgeB5Bob4sO6gw==
Received: from BL1PR13CA0127.namprd13.prod.outlook.com (2603:10b6:208:2bb::12)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 17:21:40 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2bb:cafe::60) by BL1PR13CA0127.outlook.office365.com
 (2603:10b6:208:2bb::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19 via Frontend
 Transport; Wed, 31 Jul 2024 17:21:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 17:21:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:21:14 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:21:14 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 10:21:13 -0700
Date: Wed, 31 Jul 2024 20:21:13 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 24/37] drm/nouveau: always map device
Message-ID: <20240731202113.00004bdf.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-25-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-25-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a9b61f-3f9a-4999-479f-08dcb1853da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nm7J8/FUMXnG6jOTPfSxiNuxecrMtkNt29PeBjth2WsjKAgA+e4zRLEHnA+X?=
 =?us-ascii?Q?ISZuTWm2lAt9YYBLVy0lNQNFuvFwiue2vSFk4Ik6+jBw5L9YxY2oDYjY1bPB?=
 =?us-ascii?Q?GxwSmkCaXX46wlUPs7t4I/KHWCdl5rC3YOLVKT8q4uubZYrQDjl7ES+tEVA1?=
 =?us-ascii?Q?nJoLDC3Eokxp4XXzyZLF8f4TJCphjhazVxF6IP0hQZur42MTlAH62diqNH/4?=
 =?us-ascii?Q?F1C+69W3BvdMIb+ZHw+Tjt4oIVQUOK2CgmeRaCo1fGQm/Ubfzx4IiPAXJ5bK?=
 =?us-ascii?Q?K/gMcCjaFUrgav05sPAvSa+ru9EG0PIsK1tUrNH2CNOfwT39mg+j3AEpAG5b?=
 =?us-ascii?Q?h10Ob8PJxXWvkFszxRvMO/M+RfGWzrgsDp3Etbo74BkRrWEJXsmohNvRpQYx?=
 =?us-ascii?Q?P3Bi0oCtU+4u7MyVCVRYeWYwC8xAsGjw2urBq3F9nLVD2QOT5p6tHh5URNSg?=
 =?us-ascii?Q?Z/GAFSt8+EHYmAlAC1xeAIKXc2REpui6XF3epMYkXqQc16oakKyenz/oNLEK?=
 =?us-ascii?Q?n/H+xM41+0iGvxKzmGFLM1yWnFbY0aJD1r9lgaTM26Etjtg1o6VELwwnctaL?=
 =?us-ascii?Q?GPVLzV2HnqxYlvujTpqw9Qltbrre0P2q6lffIes01WmM4rHcr6rT1XdKvd1w?=
 =?us-ascii?Q?EvBm5tLW5MSbAd5XrEeleYmcai7KMDrD5rJDHOBCy60h9nolhDt3clzrz7Zn?=
 =?us-ascii?Q?SBPgfWy7zHf12DMXtGJikuX7heqHbDskSt2oo1zEOog7DJm8lSObLf83+5bk?=
 =?us-ascii?Q?b7n4QFW0/4HPu4ZjetuV+FoaoNmUi1wPn+O34Mbnw3cVfcpvCDhWE0HtSZnl?=
 =?us-ascii?Q?uOhtLBk9ehhMzoRhExie4VFM+fyQIQ5VvUFrO2Zcu/CO+pXgyAnGR+1a2Pa9?=
 =?us-ascii?Q?ZoUuN/fG078z78R9x3lw716UvtTceqYL/U5iNLNVoexQ03u1yTjWQJG+2P7X?=
 =?us-ascii?Q?Z/A4GeKLR67Djav993EH34PWqf9SZr7T2gYTgGfROQb+M6nIgSCwdRppHf3U?=
 =?us-ascii?Q?plP1vh9BF9rxLm16dnWHDJ6lusAGV/BAPJAHn9nTfy9c8W4YoMOGuZ/xfhs7?=
 =?us-ascii?Q?Ir9Clp08lUOpiUoUqmBxjG0ybFFSN3425fRTxrSq62Azhkg0E/G10OPRywLT?=
 =?us-ascii?Q?/X2mr1nWaNZlTg9hBE3vViDt16DvLEjg68tzXVIIw3rxfos4N7nJSQ036zy/?=
 =?us-ascii?Q?D48w5D1x9lTYKNOdZl5/5BdLHXgYqRqR7jrNikMNxsfjB6G52ci5sfewqQ7N?=
 =?us-ascii?Q?V15gJJhfSthq3bllSdMtCJeoV1Z+e/mEYnqquAPqpAZyXQbjOp6JXVrOWgIC?=
 =?us-ascii?Q?P+5Zn4PxSe4FzVGpwSHr5VEogyBNTJ2z1yjf/fl6HNr9GsIcwtZf3aUTdzu6?=
 =?us-ascii?Q?csR3FZ+RC4AJFwhtRp/E++VuNR2Nzu8sPvMHtrT8sph2Bb/0N+WxIBDuzfQu?=
 =?us-ascii?Q?sjQNnHlCKKq848tnHi+nV3vD2C5Bb4cm?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:21:40.0639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a9b61f-3f9a-4999-479f-08dcb1853da1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622
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

On Fri, 26 Jul 2024 14:38:15 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

I agree that to always map the device so that we can remove extra rd/wr
callbacks in patch 25 and patch 26.

Would you mind to point me the patch you mentioned to clean up this
later as well? I am interested to see the fate of this newly added
function.

> The next commit removes the nvif rd/wr methods from nvif_device, which
> were probably a bad idea, and mostly intended as a fallback if
> ioremap() failed (or wasn't available, as was the case in some tools
> I once used).
> 
> The nv04 KMS driver already mapped the device, because it's mostly
> been kept alive on life-support for many years and still directly
> bashes PRI a lot for modesetting.
> 
> Post-nv50, I tried pretty hard to keep PRI accesses out of the DRM
> code, but there's still a few random places where we do, and those
> were using the rd/wr paths prior to this commit.
> 
> This allocates and maps a new nvif_device (which will replace the
> usage of nouveau_drm.master.device later on), and replicates this
> pointer to all other possible users.
> 
> This will be cleaned up by the end of another patch series, after it's
> been made safe to do so.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/disp.c       |  5 -----
>  drivers/gpu/drm/nouveau/include/nvif/device.h |  1 +
>  drivers/gpu/drm/nouveau/nouveau_drm.c         | 16 ++++++++++++++++
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |  2 ++
>  drivers/gpu/drm/nouveau/nvif/device.c         |  6 ++++++
>  5 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c
> b/drivers/gpu/drm/nouveau/dispnv04/disp.c index
> 13705c5f1497..e8b27bb135e7 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv04/disp.c +++
> b/drivers/gpu/drm/nouveau/dispnv04/disp.c @@ -189,7 +189,6 @@ static
> void nv04_display_destroy(struct drm_device *dev)
>  {
>  	struct nv04_display *disp = nv04_display(dev);
> -	struct nouveau_drm *drm = nouveau_drm(dev);
>  	struct nouveau_encoder *encoder;
>  	struct nouveau_crtc *nv_crtc;
>  
> @@ -206,8 +205,6 @@ nv04_display_destroy(struct drm_device *dev)
>  
>  	nouveau_display(dev)->priv = NULL;
>  	vfree(disp);
> -
> -	nvif_object_unmap(&drm->client.device.object);
>  }
>  
>  int
> @@ -229,8 +226,6 @@ nv04_display_create(struct drm_device *dev)
>  
>  	disp->drm = drm;
>  
> -	nvif_object_map(&drm->client.device.object, NULL, 0);
> -
>  	nouveau_display(dev)->priv = disp;
>  	nouveau_display(dev)->dtor = nv04_display_destroy;
>  	nouveau_display(dev)->init = nv04_display_init;
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/device.h
> b/drivers/gpu/drm/nouveau/include/nvif/device.h index
> f7c1b3a43c84..fec76f4733a4 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/device.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/device.h @@ -20,6 +20,7 @@
> struct nvif_device { 
>  int  nvif_device_ctor(struct nvif_client *, const char *name, struct
> nvif_device *); void nvif_device_dtor(struct nvif_device *);
> +int  nvif_device_map(struct nvif_device *);
>  u64  nvif_device_time(struct nvif_device *);
>  
>  /*XXX*/
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 22cdd987dd2f..316f7877047d 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -206,6 +206,7 @@
> nouveau_cli_fini(struct nouveau_cli *cli) nouveau_vmm_fini(&cli->svm);
>  	nouveau_vmm_fini(&cli->vmm);
>  	nvif_mmu_dtor(&cli->mmu);
> +	cli->device.object.map.ptr = NULL;
>  	nvif_device_dtor(&cli->device);
>  	if (cli != &cli->drm->master) {
>  		mutex_lock(&cli->drm->master.lock);
> @@ -267,6 +268,8 @@ nouveau_cli_init(struct nouveau_drm *drm, const
> char *sname, goto done;
>  	}
>  
> +	cli->device.object.map.ptr = drm->device.object.map.ptr;
> +
>  	ret = nvif_mclass(&cli->device.object, mmus);
>  	if (ret < 0) {
>  		NV_PRINTK(err, cli, "No supported MMU class\n");
> @@ -715,6 +718,7 @@ nouveau_drm_device_del(struct nouveau_drm *drm)
>  	if (drm->dev)
>  		drm_dev_put(drm->dev);
>  
> +	nvif_device_dtor(&drm->device);
>  	nvif_client_dtor(&drm->master.base);
>  	nvif_parent_dtor(&drm->parent);
>  
> @@ -751,6 +755,18 @@ nouveau_drm_device_new(const struct drm_driver
> *drm_driver, struct device *paren if (ret)
>  		goto done;
>  
> +	ret = nvif_device_ctor(&drm->master.base, "drmDevice",
> &drm->device);
> +	if (ret) {
> +		NV_ERROR(drm, "Device allocation failed: %d\n", ret);
> +		goto done;
> +	}
> +
> +	ret = nvif_device_map(&drm->device);
> +	if (ret) {
> +		NV_ERROR(drm, "Failed to map PRI: %d\n", ret);
> +		goto done;
> +	}
> +
>  done:
>  	if (ret) {
>  		nouveau_drm_device_del(drm);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h index
> e7d072a9a477..80ffe15ba76b 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drv.h +++
> b/drivers/gpu/drm/nouveau/nouveau_drv.h @@ -203,6 +203,8 @@
> u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
> struct nouveau_drm { struct nvkm_device *nvkm;
>  	struct nvif_parent parent;
> +	struct nvif_device device;
> +
>  	struct nouveau_cli master;
>  	struct nouveau_cli client;
>  	struct drm_device *dev;
> diff --git a/drivers/gpu/drm/nouveau/nvif/device.c
> b/drivers/gpu/drm/nouveau/nvif/device.c index
> b14bccb9a93f..24880931039f 100644 ---
> a/drivers/gpu/drm/nouveau/nvif/device.c +++
> b/drivers/gpu/drm/nouveau/nvif/device.c @@ -38,6 +38,12 @@
> nvif_device_time(struct nvif_device *device) return
> device->user.func->time(&device->user); }
>  
> +int
> +nvif_device_map(struct nvif_device *device)
> +{
> +	return nvif_object_map(&device->object, NULL, 0);
> +}
> +
>  void
>  nvif_device_dtor(struct nvif_device *device)
>  {

