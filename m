Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 061F39897AD
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B16410E2AA;
	Sun, 29 Sep 2024 21:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gQUehYcN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2074.outbound.protection.outlook.com [40.107.101.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489E010E1FA
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:05:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ak7LAkHAA570pm895fNQN7n1M7BKrPQYniQ8mE1gHxNh0cjTd1+93BDkNz1/T0Bt9nZnouI98LO4eyTgHaJ1OV7CgXeM8j4LrTngRAiv+sQbuvNxeDgnK0Ibm07snCG+ZMyltWmw0BbBVmTxqAAZ3W+8vm+MJ+yPRzO0wldJHH/3co+JJcMX3C3SnWH2JDHIoOX4Qc85rIy3PtwcdEEyFJPRXqKphjh+/LR5bbTGFXi8JYNqlXhZhp31su7hGPRudcvZ/relffVc+WO3NBLmCqRmeEDfp9VxNkx6whXEuZLI9dS4y+zwI0xsYdg5ubQ/QNfFPgTuQ4ylmh2RzHl3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZmMrQxLYXARDfeVnuvogDBWMQqzRH29ZxC7fIMVtDA=;
 b=kU1NMISi0mMCY/Sz+VRZ+2H4N3VM50UTOhbIMZTv4IfKSYnDZe2zSTxFkLyj7tBeWiXDryXGy2hDhmkSSY0uf7roZn7tMf88iR0o8x8HpL+3UVN+cM8PkOWDP2YZzbkAC5IIO2ghj9RxPsWlnPK5qbPFljEsC3JddziC/pA8iP4TPoplMW+gzToU/YpoNFk1nd/QXFy9FPQqlvdHx6vQZCHVE+QKbgHENg01xTMy7tc8+Hm3WHpXV56q2yvJd1nFbWQagfOX3jHb/0tlHkNpCUbugbFEsvXSJsU1Wnn5oQz+VRRMpy3Pqx4PvAiWL1lipy6VZQ/Pvb4FqggFnCOXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZmMrQxLYXARDfeVnuvogDBWMQqzRH29ZxC7fIMVtDA=;
 b=gQUehYcNy2Fcmtya2NEQ7urhFfqmoTl3VrSFu4THHCMczdretE2GE46q623TRRZ1IAw7OlyUyrgEUo7Umhoqn9DEx0U9TLGP6+n/PVkWiG+nJChAuhQeN9FHPMQO9D3Wq9+G1zxoCG38kV0ZObmoZ7UuQZr9PSwllDSGT0VHeeieaADAVK2vagr3601qfu2RTBg2v7bf1mn2Kv7SQIcydJW9ZxBHgX2jJSLRTz/AfK76BAcXkOpNW6Sm8RytT/Es/L7cf90JCzraEcyGNXkcBrFe50ve8vscWPooclrIEF/gd+G4hNYHwaPaN8Uh2YuT2VODF5c/XZOnhLCOuw2C2Q==
Received: from MW4PR04CA0127.namprd04.prod.outlook.com (2603:10b6:303:84::12)
 by IA0PR12MB8302.namprd12.prod.outlook.com (2603:10b6:208:40f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 11:05:18 +0000
Received: from CO1PEPF000044F1.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::f5) by MW4PR04CA0127.outlook.office365.com
 (2603:10b6:303:84::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 11:05:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000044F1.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:05:18 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:05:06 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 31 Jul 2024 04:05:05 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul
 2024 04:05:04 -0700
Date: Wed, 31 Jul 2024 14:05:04 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 07/37] drm/nouveau: add nouveau_cli to nouveau_abi16
Message-ID: <20240731140504.00004105.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-8-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-8-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F1:EE_|IA0PR12MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 49cf8ec5-fef0-4e23-15b9-08dcb150a9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HMtwEevf4DTZjFIwxpufzMdW5A0466hr6Ai65oz4dTP+dI8nHQM+lk7Hc8BF?=
 =?us-ascii?Q?b9AFv6QCwD4hrJE9TV4puK8ZJ3McGP1VtUCPOS19SWxg10jiOb0M2Px5p4nd?=
 =?us-ascii?Q?sNtsPLTLj6dfnMTNT+q5K7f65REk/WmyqFYP6kkc5t8mfra+IG5bGzivynn9?=
 =?us-ascii?Q?MrO/gg+S5o8EhDLwKn0NqQ4sUKKkpQdkeif/sBDeVVwvZ7ZVXw6JyW3Aw78P?=
 =?us-ascii?Q?lhzuFOxPWbd9sLQMseZxVjSIZaxwxJRdlomoGq1VsidswNrcy/njWBFnO2wr?=
 =?us-ascii?Q?pWk3ZzLgGz0nfgyu+aV2jXDfVAyQpJ9yeBhgjXYXwAHAmdMfhBYyxxQgeYpI?=
 =?us-ascii?Q?Rh6IunJyjZFAUdq6DCzn3z5OIGmTh6uK75opzKqawE+fNVuuX1WkZhO6sp4T?=
 =?us-ascii?Q?b1dCtfka1JuzUt5gxZY5K0iFM25PEp1Qh9/0flBnv7dHaC2plhzAgO5LPnJ1?=
 =?us-ascii?Q?pIJpisyKgUb9RxJKO7ewU8C2Sv/KEmrKwYWQT/PaVW/r9plFzIxHVX0zVKZV?=
 =?us-ascii?Q?Zp/n8feBJCquiigK3NO9udn1FSFiLgHqizxQubexhaEYn5hUJFqWpNii6QsM?=
 =?us-ascii?Q?LoaTWH+DakEH8r5keLr7ogbAes9fy3ejSE0CWLxC3GaJCXaiOuIf0TM86op9?=
 =?us-ascii?Q?u4HGfdE1aLMp3PMcMBZgVnUzPG5il/v1Gy7r7E/s6NBOlkobXF0tVlBz+NJb?=
 =?us-ascii?Q?qrRBEv1W5NT4xt2E/CK6L0CGotWvYDowB0S5ZOmZqZw9iUUpU632t2zkSl9W?=
 =?us-ascii?Q?R+JS79XvMBndfwfurrZStxZCqAt3RwhAuRmM36OO0EfNnMZ/++EAZsONuSz0?=
 =?us-ascii?Q?J5Ja7131CaLvOxOJhyJXeakEnv3hJ3Jmz//PBwcfsnA9iwrtcH/1FKu4JiGd?=
 =?us-ascii?Q?3sHFiJAOn8rA7UBSu5UzZiQkWyTjg3gpH2J3Zuu+NvsMqnrcf3SoL5f6RutP?=
 =?us-ascii?Q?b2XRNYDd8Z8+3bnXs0/aSGsOwRL92GHxhZdDF86oQ4tAr1UNUq6d/v3la5ho?=
 =?us-ascii?Q?yHkN4NIbDYy033REvy2aDDQQIDnyQzVIn5uVs9U7pgFleUz5I3sFh+swb9/B?=
 =?us-ascii?Q?tEGUu/XsEyqV7y08VDuxHj83XPTvIcH+QBI+4hikwlI76tAm5OSNYZrYAXvy?=
 =?us-ascii?Q?HElDZb2r2YUHcCl8yCrvVjfCjKD1mv3skV5PnNyXlTr9l2QLu/Cctbq6Fkde?=
 =?us-ascii?Q?j+PIHeeYB2SowbiwvLQy6V9E42+vcxC2oaw9+W+kDqV8JehYQ2elDwv5Kqrf?=
 =?us-ascii?Q?8NCgDGT9PSDbRda/3O2QVfrrhVbdpaKLFxCE2O/Wnct0XR8W627AYTAPX7UQ?=
 =?us-ascii?Q?b8V2R2NER6iVErtAraOiF3yh9CYbkhZBFZOCypcZq0nHdC4LD9tb58UoIdAW?=
 =?us-ascii?Q?iKhjXoTR1ALhYu6dP1boDyPHAaMdgTLGjLuKMd3cp6WJeHF1VjtB81k6WvIU?=
 =?us-ascii?Q?roMDmJxkdzxXfTSDKUkTnYkDND5w/MZb?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:05:18.3145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cf8ec5-fef0-4e23-15b9-08dcb150a9cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8302
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

On Fri, 26 Jul 2024 14:37:58 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

We can also cook a patch to clean up the cli = (void *) cast in
dispnv50/disp.c and nouveau_chan.c after this series is merged.

> Store a pointer to struct nouveau_cli in struct nouveau_abi16 to
> avoid some dubious void casts.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 9 +++++----
>  drivers/gpu/drm/nouveau/nouveau_abi16.h | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c index
> d56909071de6..ac50c300d2eb 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_abi16.c +++
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c @@ -50,6 +50,7 @@
> nouveau_abi16(struct drm_file *file_priv) .device = ~0ULL,
>  			};
>  
> +			abi16->cli = cli;
>  			INIT_LIST_HEAD(&abi16->channels);
>  
>  			/* allocate device object targeting client's
> default @@ -82,7 +83,7 @@ nouveau_abi16_get(struct drm_file
> *file_priv) int
>  nouveau_abi16_put(struct nouveau_abi16 *abi16, int ret)
>  {
> -	struct nouveau_cli *cli = (void
> *)abi16->device.object.client;
> +	struct nouveau_cli *cli = abi16->cli;
>  	mutex_unlock(&cli->mutex);
>  	return ret;
>  }
> @@ -164,7 +165,7 @@ nouveau_abi16_chan_fini(struct nouveau_abi16
> *abi16, void
>  nouveau_abi16_fini(struct nouveau_abi16 *abi16)
>  {
> -	struct nouveau_cli *cli = (void
> *)abi16->device.object.client;
> +	struct nouveau_cli *cli = abi16->cli;
>  	struct nouveau_abi16_chan *chan, *temp;
>  
>  	/* cleanup channels */
> @@ -529,7 +530,7 @@ nouveau_abi16_ioctl_grobj_alloc(ABI16_IOCTL_ARGS)
>  
>  	if (init->handle == ~0)
>  		return nouveau_abi16_put(abi16, -EINVAL);
> -	client = abi16->device.object.client;
> +	client = &abi16->cli->base;
>  
>  	chan = nouveau_abi16_chan(abi16, init->channel);
>  	if (!chan)
> @@ -623,7 +624,7 @@
> nouveau_abi16_ioctl_notifierobj_alloc(ABI16_IOCTL_ARGS) /* completely
> unnecessary for these chipsets... */ if (unlikely(device->info.family
> >= NV_DEVICE_INFO_V0_FERMI)) return nouveau_abi16_put(abi16, -EINVAL);
> -	client = abi16->device.object.client;
> +	client = &abi16->cli->base;
>  
>  	chan = nouveau_abi16_chan(abi16, info->channel);
>  	if (!chan)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.h
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h index
> 661b901d8ecc..0a9121e63143 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_abi16.h +++
> b/drivers/gpu/drm/nouveau/nouveau_abi16.h @@ -30,6 +30,7 @@ struct
> nouveau_abi16_chan { };
>  
>  struct nouveau_abi16 {
> +	struct nouveau_cli *cli;
>  	struct nvif_device device;
>  	struct list_head channels;
>  	u64 handles;

