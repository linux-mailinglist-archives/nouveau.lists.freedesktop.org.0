Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3B9897B8
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC6010E2BF;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TNTjx/T2";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2E410E6A6
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 17:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfVOg3qDizSPG0opLYRms5F8/0Fvj5h++fo6Hbjoh3SxkoWfI9LgcHsdJ+tiEVDIdJw+e9b0eIbfDs5lpDl62cR6y7OTeCOXWRbBnupiaESSTo61TlFC3L0tu4TzUnk1zcTQisp5GY96sO9KzQTSyycULtFwwZBQKOa1LBFKTuqrOSPBbl6Z6l0iMAqTXCjoKklokZUc7GH5Nt+2MIvnPOa9Jo8LvdQJMoJkxONFvHdZdy1wnCfmkln61f/xxN0aM2/uqEVR6BpSoBPlY1DF4mLr82uxJRgfx16MjSSwp+tcT/C6nhtBdHQ5ZXtN4HwRzHJPR3qk7r8+Mnac7uj0cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H46lT2BQymxfRTKncGzORO7P2v1oV8J9DvwTVGQmsPc=;
 b=SdXptA5pVbdXD7en7udHCVd7sdpE+5tEWcGerNmsf5tMuYgeo8M4siJnEFSSiviMETZ00g8IaL069mj+WkGJIbfUOl8dJFZrT4hDjrxpAjIEFRGEp1j1GXWVRmAEXx7OtDNutUD2nz6OzQQxyFZihlWQzxVdCWKg6gaFEjZDquNQLv88QMhGl+wZi1LIbCnJpKFjGy/kBmXB11cc3/YjLi6xmF9kgPPBzgUIW1Q0aPEYLqGBiM35phk0A7z87oSYTr322pwVBu6D+WHVnns8EbV/hcgzhxg5eYIdiGs147PTgHExBcp9BUJET/Hkrs1hJU+gBLsdbzJ7BA0hj3NQdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H46lT2BQymxfRTKncGzORO7P2v1oV8J9DvwTVGQmsPc=;
 b=TNTjx/T2aVxbwWf80b8bwuqCnq1VI26xxzJtdsJO8uYrK18ECAGwCkfdKxq0EaTJ+C3phbEbf4Sc4w8Ae4sHWIP16JxiY7FATDCDOlGcbb23WvOqpH6ecom7IGNCs2/Xv1bIXp3vh8mHo+0c6e+L3/ScM327dNlpawbWnyloyMGY/l8Qu3N3YdvMFkn1jJxOXWK7LZRyU4hA7HOZsv0xzUm+3g25oRtLek8sVolviuWW/8Z/pSFpgY5GPgjPMEIyaOtEGVwsBo9qqyU3FajvbKXb+eHIOWpr+SLpn8ilKTGybM345fLgjRizo8SeVm5m1wsHeeE73lon40oM+JybNA==
Received: from PH7P221CA0013.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::9)
 by DS0PR12MB8414.namprd12.prod.outlook.com (2603:10b6:8:fb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Wed, 31 Jul 2024 17:09:04 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:510:32a:cafe::be) by PH7P221CA0013.outlook.office365.com
 (2603:10b6:510:32a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Wed, 31 Jul 2024 17:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 17:09:04 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:08:48 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 10:08:47 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 10:08:46 -0700
Date: Wed, 31 Jul 2024 20:08:46 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 20/37] drm/nouveau/nvif: remove client version
Message-ID: <20240731200846.000008ce.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-21-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-21-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DS0PR12MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: efb2c436-1fd7-474b-6d24-08dcb1837af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZnScFTJKBMqHcMSF/26bgWs5yVdocoJG30dZKtqv0v8ZDp7XRomCLvCnuXhr?=
 =?us-ascii?Q?S50t9c8KfzRcqEezeqJBHL2Y8smQQmDxvO6kKTRS+WQ/sLdx07KT9UGgWtM5?=
 =?us-ascii?Q?UEO26ofJqkSXhkwkT0tu+ITdPtNMi5DwnCDKsHdHfK/W9N15AmiSrfEpXlKE?=
 =?us-ascii?Q?+brXcEAXE0iS7eAg6ESd8ZFUrsyMF4V7URs01ejRCx55xXDH7J44ACwv17Up?=
 =?us-ascii?Q?F2M6o7Ubd088h0vbiRhRD21q0AINhwCq3+3a0sQIPDGWGbeGZaIZQ8MYlVGe?=
 =?us-ascii?Q?8br9DJKuDc+PvMrEZigqqFQbVdDnXmE8S/ZOeHq7yjmfGVnjd/Ftwx+ImLMp?=
 =?us-ascii?Q?x6uYAD+rvV9OMIGROrfsmfycAXeOJSwCmTN4Lcbr+I4SlM6aFHEXGTlm06K4?=
 =?us-ascii?Q?O3FXHXXncGQPzXQuDns6DjmAVJOpEudjMXQXvN+TuXKia0pQ12iNJH/gbX4O?=
 =?us-ascii?Q?obD9Igee5hzKZskv2ycxSNxFs8wChzrw/o++cDaJimjEepNoUrIMEjIOWnOe?=
 =?us-ascii?Q?GJenZc9uW3Fruya89VG0Vm4tlreXuCw75OebH/mLYFVxIBMrpkf3E+Ebo8LN?=
 =?us-ascii?Q?4ANui2YsRG4VznixfkfQhzLjZX4PThhPwU43DxCc0fGE1hRiAtBog4vcamOY?=
 =?us-ascii?Q?xUFg7SR4+u6B5pGvF98o2NSj8UmM7X1rjunJBZ1myqsFCN4t0zyJOuD2o9Ax?=
 =?us-ascii?Q?7WFjAkOBR1oXnFo9HOCh2PXOmUGI/b+HOj7O2Hh2jmgHZZ60T/OEYdTiej1a?=
 =?us-ascii?Q?OH+0KxtbsB4l/D0wUmv62ozgNcrX833CORgfyKm2G2BIGHovWK04bYek/ult?=
 =?us-ascii?Q?1QjDqoD9VgRUwLUAw6bQnTOasrWavrJA+u1/FwR/xdlO40JShAMrb6Kq3X4V?=
 =?us-ascii?Q?FSVmumNLZ2KDe5srEwTfLdgthD55vc7PXPY83HntqeesJuXtJ/SXxrx3jswn?=
 =?us-ascii?Q?tNOQllkxoJB7BLr8IvV9KXmM5Znota2s0QXSJXcI/wnBVQ/1uI7rk5PnUMyw?=
 =?us-ascii?Q?QOVgkS9vOG8UdQ4PVZgIp1YbC7N+wYfZlk4dpw8Gccn6GyBHr08ISvEeURvM?=
 =?us-ascii?Q?GyPzv6BSGP+z8JiwXieqhed137ipSdsSsxNGgBF1X5c7Y5PqhfhiGZzgtbSd?=
 =?us-ascii?Q?zLNhA4OpuSf1CgxlrzmAWgxB3XLHkC3NVGr8YTuTFZhzLya7Qnws4MXvSVa7?=
 =?us-ascii?Q?f4F4j8MwKmF5dANwSETr0QVd7dL9EwyZJ1xptFAVAn1Z9viJh9DqpL5Q641X?=
 =?us-ascii?Q?EiRO3hJ7rIpgc/xdvf5N0W3dkF/9Ho9H2DzrlF9VtmidBAjsxu2rjIiEGh0+?=
 =?us-ascii?Q?sGYuwW0jRfDiIJhRviagxNqFv4JY8wv0Aes7Z/uUS3eRHNKiAwZ3SnqEMlsg?=
 =?us-ascii?Q?2QEr9exn7ueY7a3NvonfLI/u9IqNq2U+trqc6NLl4gw4HWahg4J4T4+/TWcn?=
 =?us-ascii?Q?5HFadK40Sap/k7qIHtHfdIjbAqaE6onf?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 17:09:04.0551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb2c436-1fd7-474b-6d24-08dcb1837af0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8414
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

On Fri, 26 Jul 2024 14:38:11 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

The patch LGTM. What was the original purpose of having this version?

> This is not, and has never, been used for anything.  Remove it.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/client.h |  2 --
>  drivers/gpu/drm/nouveau/include/nvif/ioctl.h  |  7 -------
>  drivers/gpu/drm/nouveau/nvif/client.c         | 20
> +------------------ drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     |
> 13 +----------- 4 files changed, 2 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/client.h
> b/drivers/gpu/drm/nouveau/include/nvif/client.h index
> 2c8e9bec3f79..03f1d564eb12 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/client.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/client.h @@ -7,12 +7,10 @@
>  struct nvif_client {
>  	struct nvif_object object;
>  	const struct nvif_driver *driver;
> -	u64 version;
>  };
>  
>  int  nvif_client_ctor(struct nvif_client *parent, const char *name,
> struct nvif_client *); void nvif_client_dtor(struct nvif_client *);
> -int  nvif_client_ioctl(struct nvif_client *, void *, u32);
>  int  nvif_client_suspend(struct nvif_client *);
>  int  nvif_client_resume(struct nvif_client *);
>  
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h
> b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h index
> 4e047bb1fc07..1e74245621e0 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvif/ioctl.h +++
> b/drivers/gpu/drm/nouveau/include/nvif/ioctl.h @@ -2,11 +2,8 @@
>  #ifndef __NVIF_IOCTL_H__
>  #define __NVIF_IOCTL_H__
>  
> -#define NVIF_VERSION_LATEST
> 0x0000000000000100ULL -
>  struct nvif_ioctl_v0 {
>  	__u8  version;
> -#define NVIF_IOCTL_V0_NOP
>       0x00 #define NVIF_IOCTL_V0_SCLASS
>                 0x01 #define NVIF_IOCTL_V0_NEW
>                           0x02 #define NVIF_IOCTL_V0_DEL
>                                     0x03 @@ -28,10 +25,6 @@ struct
> nvif_ioctl_v0 { __u8  data[];		/* ioctl data (below) */
>  };
>  
> -struct nvif_ioctl_nop_v0 {
> -	__u64 version;
> -};
> -
>  struct nvif_ioctl_sclass_v0 {
>  	/* nvif_ioctl ... */
>  	__u8  version;
> diff --git a/drivers/gpu/drm/nouveau/nvif/client.c
> b/drivers/gpu/drm/nouveau/nvif/client.c index
> bbfc80fcff43..fdf5054ed7d8 100644 ---
> a/drivers/gpu/drm/nouveau/nvif/client.c +++
> b/drivers/gpu/drm/nouveau/nvif/client.c @@ -29,12 +29,6 @@
>  #include <nvif/class.h>
>  #include <nvif/if0000.h>
>  
> -int
> -nvif_client_ioctl(struct nvif_client *client, void *data, u32 size)
> -{
> -	return client->driver->ioctl(client->object.priv, data,
> size, NULL); -}
> -
>  int
>  nvif_client_suspend(struct nvif_client *client)
>  {
> @@ -58,10 +52,6 @@ int
>  nvif_client_ctor(struct nvif_client *parent, const char *name,
> struct nvif_client *client) {
>  	struct nvif_client_v0 args = {};
> -	struct {
> -		struct nvif_ioctl_v0 ioctl;
> -		struct nvif_ioctl_nop_v0 nop;
> -	} nop = {};
>  	int ret;
>  
>  	strscpy_pad(args.name, name, sizeof(args.name));
> @@ -75,13 +65,5 @@ nvif_client_ctor(struct nvif_client *parent, const
> char *name, struct nvif_clien client->object.client = client;
>  	client->object.handle = ~0;
>  	client->driver = parent->driver;
> -
> -	if (ret == 0) {
> -		ret = nvif_client_ioctl(client, &nop, sizeof(nop));
> -		client->version = nop.nop.version;
> -	}
> -
> -	if (ret)
> -		nvif_client_dtor(client);
> -	return ret;
> +	return 0;
>  }
> diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c index
> 39d5c9700867..584fc43c0d75 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c +++
> b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c @@ -33,18 +33,7 @@ static
> int nvkm_ioctl_nop(struct nvkm_client *client,
>  	       struct nvkm_object *object, void *data, u32 size)
>  {
> -	union {
> -		struct nvif_ioctl_nop_v0 v0;
> -	} *args = data;
> -	int ret = -ENOSYS;
> -
> -	nvif_ioctl(object, "nop size %d\n", size);
> -	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0,
> false))) {
> -		nvif_ioctl(object, "nop vers %lld\n",
> args->v0.version);
> -		args->v0.version = NVIF_VERSION_LATEST;
> -	}
> -
> -	return ret;
> +	return -ENOSYS;
>  }
>  
>  #include <nvif/class.h>

