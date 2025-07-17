Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFE6B087A4
	for <lists+nouveau@lfdr.de>; Thu, 17 Jul 2025 10:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D6710E7DD;
	Thu, 17 Jul 2025 08:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U1HL0zeJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED1710E7DD
 for <nouveau@lists.freedesktop.org>; Thu, 17 Jul 2025 08:10:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sudTI/hepnvuBsmIu87Ug5Rju0ax0VFpCJLRPyBb99U+KimNr9UJYEsqmKqBgRev0wyFKsMb5ARJOmjk/Cj2YeTT6HliD+6XRlD6cNOVdbbwbiXUpN0oDlVeX2euze5rIr/iA4pYBLYO1VY+3ledlIqjJQfYPu9c4zfctL4Qws60xRNpM1K1rx0aukCF7KnvQJ/qUc8P6yOa8VF+a/qrDUTErhHtgh0rz+Qu6fT6tNAsQFC5J7Vg+v8IHHbmNJ+B9q8HWZo1T11W71r1VnWy8lOC0RNyoiPKeqKt25nNUPWnnmjYMRzcMNjhPey8oO95s/m6k/eG9o4m2wdz4cuf6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uz92jb04nDgcopvZ0VjmFA6I6z2uXmPuatUGeAhQs14=;
 b=WeQRjqtSPBO7IfWiQWxRscIyqFjQgTC1d3/HOoMLnAJIkTEyleA5Vv+cc0+82qo5qUO+hn6mr36KzWHpwsOUlgBVbxELppUpDqFwnSY9Cgmk1SSMGk3HKlLAJgKFrWG0ZLvQnz8XUbh8p6v4kLGqPfpW6vvDoFmGKxKe71K0XXDzjNgCVwno8s2gvK9WG+QiK4/bmuhqDXBkcl9WbjS2YCUmGCyAz95BKbf/ZrGW/9Rm5UDM/nz+hJIe46JogiyTJnAw2j26A0FLtmo6YnTO7soaetXI7T3h7hnp5cXHOEipAu6MvjmitKhsYuqOYMo0WuNq2A55RH1898mPo++/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uz92jb04nDgcopvZ0VjmFA6I6z2uXmPuatUGeAhQs14=;
 b=U1HL0zeJBuEMEPoLQ4mYf29iUa/pY9jSWzUcq3Iwks+ShgA1e/DOMbvjRkgpRMidpyla6uO5ZDqTXKLTnYcE2noHBGLU+3I2RSwiI0fYKYNri6kWL8fOHDJ9hHprOh9jyxX+5R+NiyPLDAFiOLTfSppaCKwiDMlhr9TMOpGhPgCl24spEVwHgyOUX2/m436kukpqcUR11dCnpbrrfqdZ14i3AxpYnDaDUvI/tfnOr2yC8zGTyuTYxfnZfkDZm5vueT9NUs3xBxdKB3VzC9sRAF0QXpfROHLPNHlhhEd8gMlTW95uQJyNO0opkZZAnRdSY2T6Q3zki9WX2GNLqt4byQ==
Received: from SJ0PR03CA0063.namprd03.prod.outlook.com (2603:10b6:a03:331::8)
 by BN7PPFDE2ACDA69.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6e6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 17 Jul
 2025 08:10:28 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:331:cafe::13) by SJ0PR03CA0063.outlook.office365.com
 (2603:10b6:a03:331::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Thu,
 17 Jul 2025 08:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 08:10:27 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 01:10:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Jul 2025 01:10:16 -0700
Received: from inno-thin-client (10.127.8.11) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 01:10:15 -0700
Date: Thu, 17 Jul 2025 11:10:14 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
CC: Ben Skeggs <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: fix error path in nvkm_gsp_fwsec_v2
Message-ID: <20250717111014.7975bc53.zhiw@nvidia.com>
In-Reply-To: <20250715210559.1188776-1-ttabi@nvidia.com>
References: <20250715210559.1188776-1-ttabi@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|BN7PPFDE2ACDA69:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e2506a-ff94-47ee-bc2d-08ddc5096406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mSpKvDvJSFDqmduDvOx/vIbSJZnitj5ic/jTtT+DzXnAS/P1S12OlAipoHUg?=
 =?us-ascii?Q?anoMjjQ6wIgeqa9J96I1c6+Mu9I04K1T3wTNKimFV/Y20c6F26WKC8C8gGkf?=
 =?us-ascii?Q?x2jG2hBwampohZIx5Ayeq6PN+kA9s+snAql05ykCZmUp4fn/6RhnzGa9bm5C?=
 =?us-ascii?Q?X6JSzr+hm0e3eWu6eL1/j1yecDvSTx7XMoSFBaKCKnjZl40KHzF5EG6W2KMC?=
 =?us-ascii?Q?+S8HKsDpy4iGQEkaPhs+sUrLAJKNVPurB1vEtzmdiusd680Aq/Izxu3mY3nm?=
 =?us-ascii?Q?18kjE2+ohiBLc3ah3GF3Lt+E6RlbGe001V7TArSeiNaPibCBxBupU56/lCk1?=
 =?us-ascii?Q?p627DPTtq26bB3Tkdsm4ZiA+OlUqvG27hDkvoEKJZQ1q42+10Juf52ITHeHJ?=
 =?us-ascii?Q?Ar3mE8LY3hMN7QYXepoRwBDuitJvJoT5FWo4asX/ZR9kqosIkxIxFI8mmhGk?=
 =?us-ascii?Q?Cz+KODYxwypjdjLv2mPHrBznVvkHDOwLcld25l2FvDi5QUW7uKuv6Vnc3lu9?=
 =?us-ascii?Q?8wx5J9wvRVaAp4ECM3LvRZOcU+EblXgsx6sQuzCFReQWQgvGauqM+zCnXhCi?=
 =?us-ascii?Q?+1t7SPjDmpkjXuPCQZjYl0oPTT5Uhwf0NcMEyT247XVKhhBiaN8eFVH2T96m?=
 =?us-ascii?Q?dPcS81MZf0IU4I090zFOREK02RdV2OKGbkfR/nOMKyqSm802no2uR7vKTuPb?=
 =?us-ascii?Q?6rWcakDHTgvQxrBori+8lyDK+MQoVPd0EVPPvpUAX8+LVUtE21CP2oprWnvA?=
 =?us-ascii?Q?5GIeuIJvpY+7aWeTJlW8iHydO5mi62N3ziIg7lRKDwTgAX1XUgyI7bZE5gpi?=
 =?us-ascii?Q?YEKimFjX4x+wMJTimlgJwr++fE0TZLGd2rAgPfJwBXsjsy29dbYGkQi9nQ3Y?=
 =?us-ascii?Q?zY2gl15KGvPZu8Jlh6B+SRKxq4bQOEhC7p4w2O8UwlNa/CuPD0hAISFBZKqU?=
 =?us-ascii?Q?35zOl6gyhcUl/QlvyiYfDqk8rothVtAr4bub650xZXhi1ecCUo0666z6vrnx?=
 =?us-ascii?Q?pjyZFPSV5+ZPAViaW2lNe40toM5O3CYz+7lZFXh3MtrsZPoteFnzANLMv990?=
 =?us-ascii?Q?mq9OMJvM4WB9IRpdiRaAnltSxKL1L3tgi/zVc4vf8fLLe1SC5ffGXxYSLhVZ?=
 =?us-ascii?Q?Suw+/NKAhn+KQlX9D5xfEBNjgcF+NTEOaIgEPYQMIadNBk/HWW7R2y6xkWf0?=
 =?us-ascii?Q?IUof72PQfBuhoFP5+uzvIt5BeuR9bPZ9JGvg/vJwSWVERuv6JZYxIS9g+v1T?=
 =?us-ascii?Q?MxLd17f1rj4w2D+Q4/kx45aCAmprY3lbwNkRKjqnA4/R6Zhq1qqBHSmQ160z?=
 =?us-ascii?Q?LWuvY443m7yAYqK3FUNswO3nUpE/f9UV7N1aUVd0Uwj8vsSLQ59R8i0uLzZ7?=
 =?us-ascii?Q?2EnZL+kW59k6dJ8lVK2ISO1poB185o/21Yzifb9ZT+FRLOzIk2OXZ7KjpAVZ?=
 =?us-ascii?Q?Ilnu9GoF8oV3TfF1wKWCgbauMqIsjzrOf0CXuKaLWgk+xYVIAbbLSzZn2wrC?=
 =?us-ascii?Q?nZYCLdWrghjYzWLV8+ILZzrgVuRL9ut4uqdx?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:10:27.9689 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e2506a-ff94-47ee-bc2d-08ddc5096406
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFDE2ACDA69
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

On Tue, 15 Jul 2025 16:05:58 -0500
Timur Tabi <ttabi@nvidia.com> wrote:

> Function nvkm_gsp_fwsec_v2() sets 'ret' if the kmemdup() call fails,
> but it never uses or returns 'ret' after that point.  We always need
> to release the firmware regardless, so do that and then check for
> error.
> 

LGTM. Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting
> GSP-RM") Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c index
> 52412965fac1..5b721bd9d799 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c +++
> b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/fwsec.c @@ -209,11 +209,12
> @@ nvkm_gsp_fwsec_v2(struct nvkm_gsp *gsp, const char *name,
> fw->boot_addr = bld->start_tag << 8; fw->boot_size = bld->code_size;
>  	fw->boot = kmemdup(bl->data + hdr->data_offset +
> bld->code_off, fw->boot_size, GFP_KERNEL);
> -	if (!fw->boot)
> -		ret = -ENOMEM;
>  
>  	nvkm_firmware_put(bl);
>  
> +	if (!fw->boot)
> +		return -ENOMEM;
> +
>  	/* Patch in interface data. */
>  	return nvkm_gsp_fwsec_patch(gsp, fw, desc->InterfaceOffset,
> init_cmd); }
> 
> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0

