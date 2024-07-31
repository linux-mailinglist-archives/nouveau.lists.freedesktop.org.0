Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D99399897CB
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877DB10E00D;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JCi71htT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA2410E6AA
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 18:23:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aisSEctqTCn0yvlix6NZ6PZq3fJ+SAEXishSeFJC3YIxUK5CZhNA7cw+1zFSaw76anxr6edT7PmjaeuMFpDh8YKNkDLaAYi8DaIrKWehaOCghK4r7+skm1HBmYqrV5gBa3cj0aCNAIOMWjFkyBm5eho51ZhFy0cWv2yhh5WrJIIxjEklqBeq+3zkFoPVdCzKelo7oNuWo34uIXWC9oceLe/g/cw3LJRKCVLlrn6H8ljaJ6pekp+/4KpN3O970+pCrfQQljGY2XJViGfuC5hgCx2NXgsyF9rk+d+f0RomouOeCdFUzsIX5rpVJcPZY+CzqMA61/zcRPz2HUe3VfwT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFrjEug/GmXI+ETmf4LNaqJs7uLiRkACNHO/dy7Sy0s=;
 b=pm65HdK/4gDipY3rHwSsaSom665I8HMcd8+9pINsh9JsrWeGgkRJLdKFDpWlaVfyyZKX5TUDTVCI52jJRDhs5epw2JIzlan0g2x6clZXBY3EoNeLU/DtXknE4XGezzNSoV1lI9WLWQJsvALzOS+cE6TFz7dcFWTCTnvi9e0e0LPPcg1K3ub8Ef7ZwBD375ENgJIPLLY8wMp9SINjqwLa9H1y53ehip/gi1W8gpVoGux3iVy1M3S8S7enfescO+wOcl5/isCFfzS0Mcfdq45zliNDxfcG1eVq9RG8hU7zellzlizUdugRu4sKU1N4ewLH9wT2SJRuot/7Yr2EMmCEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VFrjEug/GmXI+ETmf4LNaqJs7uLiRkACNHO/dy7Sy0s=;
 b=JCi71htT55KCygdLm4FbW74djKGA2N0ssHBSV1+fw4XBJLqKypzQHC2gpMf03WsOElBfMhcsuoEPWtuasfnfRS75r8n60B12q/BO+jfh8WlVU76JczYFGSMuaaXK/vci0aR1cpkwHLML7TSY6d3Cf/r5haxOvFdxbOJH9KZiuV+W4XivCcR/gnEIhzB1+MP/cZTTmRV+woR2dTXIg8kF+GcFraBFFPpzWtY1KJ6T28uo4i2Y+SyritNVe0wTSibyfTJ9GbpHA241XRjl33GrSGSJUUrxiwgWMmX+EwaX0mil/GOggq8Q91lt/T+uIjYTVlz10A9iBPUoqgUiS7nw4Q==
Received: from SN6PR08CA0008.namprd08.prod.outlook.com (2603:10b6:805:66::21)
 by SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 18:23:30 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:805:66:cafe::e0) by SN6PR08CA0008.outlook.office365.com
 (2603:10b6:805:66::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Wed, 31 Jul 2024 18:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 18:23:30 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:23:18 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 11:23:17 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Wed, 31 Jul 2024 11:23:16 -0700
Date: Wed, 31 Jul 2024 21:23:16 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 36/37] drm/nouveau/kms: remove a few unused struct
 members and fn decls
Message-ID: <20240731212316.0000499a.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-37-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-37-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: e9792b20-9f82-41ea-4c6f-08dcb18de120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QpBso73OMtw81Nq3ncCMIqWd0cMpO1/Fvb+Y5EvtlprqBLo6rwimKEl+Lj/K?=
 =?us-ascii?Q?fQiFkLOaKtJ4c/YRRcvvUkqL11p8Z5kvFkwQvYvY9ddnoQ9e2ZXykSKi0hY0?=
 =?us-ascii?Q?vBqhSj9Pssgk5Uzo9aKUIsYL9E82FEaYF0KXDzj0UqZYzLLR/p7sVLZTWVDb?=
 =?us-ascii?Q?g/nMSmuejXr/chOuSlN1Ji/jQVu/X3pjB7rSG/FQa/lPslogi05ZHcPn4irc?=
 =?us-ascii?Q?tEgzPcs09AwBIynnhnVScms5e+S37R/XUd5mD96mnvVnLf/2BwHvj3qZQR/w?=
 =?us-ascii?Q?qUNK9hGWdlWVYjIhsxfEeFYYN0LhzvFoLPJeZUlIQDoIAuCkdKumhJ4x/Km5?=
 =?us-ascii?Q?ej/jp6aePUfUhg+n6jP0B5UHJ+R/cJMRl6RWENuWL/gauiRhpj028SRIbqbA?=
 =?us-ascii?Q?NsBoggnad/EQCXwvQunz9+BL1obJwy8tgEIfWk/S0jzHqhgTMjO9WddQD8gn?=
 =?us-ascii?Q?GGGEG/7i0WmWLb0voFYPLpgxCty9ez2tO0c9ikQSCte12a4A1H8EjDJHHr4j?=
 =?us-ascii?Q?2aWiGy/olzKIOH3HdIWfnVir//CsuSJfzk85GGp4l1n+IiHn4h6JxsZS02fp?=
 =?us-ascii?Q?4NiZy/3KuUq9p3+dlCRc72jiJdX0dGk2cV3yYHHJF8nyBdEE5it7QRAckVO0?=
 =?us-ascii?Q?ODan6XIcIAWffHMyLtLjnrp0k3BV+tFxbcKG39XW7okYW0UduXD+3aNF7fcA?=
 =?us-ascii?Q?v8KAEPYTfarQKXRDxlYMGK56VaaeNtweleipZ3ja69qMaZft/ki9Tgqnkknf?=
 =?us-ascii?Q?24vG3ibublptguVnkQCI2SDwnJ3mUw2MLVayMGjfJK7Lhblz5iFytvVXhf5R?=
 =?us-ascii?Q?LAMtVoqBYlLGPvvHJakR6IGcmPvf9LOG6ymk4QGSfJhx+p2DegIHe7ESg+YH?=
 =?us-ascii?Q?B6pOf7aBtAOYgT0p8iy0nvxNzPgT1NHTxgHGOzjEoKuDgg7loDnJ5GIPfZ2h?=
 =?us-ascii?Q?SNuq1vqf1yWczQ1UzfRNygw0inJ3Im9JNBAN1EhfjhhTVCssPt5QL3TeDejQ?=
 =?us-ascii?Q?gaRqCKtwQsvu4use2IdCCATg8ZooCP+UHwh6hRzOxUow8CIuMNnkQ8cOBrOr?=
 =?us-ascii?Q?XVLXrv6BUD+fVGuNUiFMp0gUvkJmbOIsqj4bnwRabcpMV5CH5JLWbjQrNg3l?=
 =?us-ascii?Q?cMomEpnJLLyJNvhqMLI6ubU080/hH2hdqq/rgt7ZXDZNKhPgc2eUqNawGz5h?=
 =?us-ascii?Q?uzFudsiv+QFUQ6YRtGVx2sWKFL2OD4n2VZ2SWJIOV06rnTkpRyTSxk2H+XyV?=
 =?us-ascii?Q?AkpyBqt6PUBhqthwDexl6EOuxJfU7Hd5qZ20/1fq38U+axUErsFV/nfEiX4m?=
 =?us-ascii?Q?34QPPLlrcNbqA29MUARvlbBUIhNyJiSae7EtixUTqhoiI+Nstk3wlujtNUcd?=
 =?us-ascii?Q?dedddap2y4dzaAu12j8oJRBDHNOpv0Yb426Z0gXtD2oyRaUBrscT4Duev6dW?=
 =?us-ascii?Q?OuU8hs9djHT45hNCi/OcYR6GOoQ4pXjk?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 18:23:30.4325 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9792b20-9f82-41ea-4c6f-08dcb18de120
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142
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

On Fri, 26 Jul 2024 14:38:27 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Left-overs from the past that are completely unused now.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.h | 9 ---------
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c index
> 242887ab4ba0..22ecda545550 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/disp.c +++
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c @@ -239,8 +239,6 @@
> nv50_dmac_create(struct nouveau_drm *drm, u8 type = NVIF_MEM_COHERENT;
>  	int ret;
>  
> -	mutex_init(&dmac->lock);
> -
>  	/* Pascal added support for 47-bit physical addresses, but
> some
>  	 * parts of EVO still only accept 40-bit PAs.
>  	 *
> @@ -258,7 +256,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
>  	if (ret)
>  		return ret;
>  
> -	dmac->ptr = dmac->_push.mem.object.map.ptr;
>  	dmac->_push.wait = nv50_dmac_wait;
>  	dmac->_push.kick = nv50_dmac_kick;
>  	dmac->push = &dmac->_push;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h
> b/drivers/gpu/drm/nouveau/dispnv50/disp.h index
> da3add95f354..b66a30915af2 100644 ---
> a/drivers/gpu/drm/nouveau/dispnv50/disp.h +++
> b/drivers/gpu/drm/nouveau/dispnv50/disp.h @@ -64,16 +64,10 @@ struct
> nv50_dmac { 
>  	struct nvif_push _push;
>  	struct nvif_push *push;
> -	u32 *ptr;
>  
>  	struct nvif_object sync;
>  	struct nvif_object vram;
>  
> -	/* Protects against concurrent pushbuf access to this
> channel, lock is
> -	 * grabbed by evo_wait (if the pushbuf reservation is
> successful) and
> -	 * dropped again by evo_kick. */
> -	struct mutex lock;
> -
>  	u32 cur;
>  	u32 put;
>  	u32 max;
> @@ -108,9 +102,6 @@ void nv50_dmac_destroy(struct nv50_dmac *);
>   */
>  struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
>  
> -u32 *evo_wait(struct nv50_dmac *, int nr);
> -void evo_kick(u32 *, struct nv50_dmac *);
> -
>  extern const u64 disp50xx_modifiers[];
>  extern const u64 disp90xx_modifiers[];
>  extern const u64 wndwc57e_modifiers[];

