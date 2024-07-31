Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 349759897AB
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDA710E1DF;
	Sun, 29 Sep 2024 21:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="T6NDLQ8t";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21B610E0A4
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 10:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYJDolqyswCyAM44eSklwRdSXfTKYJcJxkh2Z93gyaSVdY6u7tSTO6IIcGZG+RvOgYW15PaYiX3aqAvo2SYVmGFWL8xwqik3cFmoEjjyRguA8s2mP1tT6etJrUp8dt9j3qbJnoycXA4xbZJzh61Nn5GgkwIjAsyrFyr4fWzYP94XZM4ie7aR1K2WvDR2ebFs5a9gGPINNPM1ajG3UUT8EoMqUUboob6XAbOZTuWpgS7Sdyc022C5rF0kGWMx3vhdErso+qxyAQgwhIaNu5KTbvsPeMaoTOgSXEAFwzPe/U+eX4CWUwl2JWkhlscg1sSLgMGiGSIV3UhdvGPtogg52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnbLnKZLE1MAHVON3qCpO1EewXQ8tfc1moOpaiA2Qg0=;
 b=HTEuljGDG/lD0BvDD7WoiIYASVeRUs1h7gg/GHQ19a5ADYR1YJC8G2CTSIc/Jlesaye882QMDcaW6lt+L9EFaPZmbv+Qvg+CJQn0wOurLjU7dNDznB5Xy83iqh07SLd+tRFDBaALfRfW5IhWluUAPM7iGp+3yRzV+zskwi2lpVLQuSx63JYoyaTAKhKKUw0fF8SutG+9PdeYXQd+7TzhVIOhOTTKHCc+wd9O+KHAgx9ecBit67bKo+2swm47T5mD3tes6/Z/4aL6kReu8cuyvruH+sO21lIRwhrk+q9LPBAAq0mp7M+UfNXcJlz/9Y39poNVrl6SuHWz7SbzQwllAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnbLnKZLE1MAHVON3qCpO1EewXQ8tfc1moOpaiA2Qg0=;
 b=T6NDLQ8tfyLl6KutD4FiIua/7+tZsMLpKN0wTKFrTSYRVd20idHoe3ObvXTIteci0RLxq/BvbqhMUk4XJ0TeNKpExl24BJxkI0rwp7Wco8ZL9JFyW049tlZAAeHU6s05u/6TodcmN7f7q3lJYy90x1vkUa/7XFU1TltM7todOFEXYBb4nPPJuZohp8xN1DWgga1r29V7p4E7qlxMOuRgtKDe35IEKP0sHJ/dt8otoOkJSqoBxreNBbqS1JIOsEPBmNrXo/cxCesaRUA+dd9WYYyv1k1V4MN48MktIh2dP6FUeLk0Htofwg1BZCy3t+nYab904q2zQQvFuxJPexdiWg==
Received: from BN9PR03CA0427.namprd03.prod.outlook.com (2603:10b6:408:113::12)
 by CY5PR12MB6370.namprd12.prod.outlook.com (2603:10b6:930:20::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 10:21:11 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::e9) by BN9PR03CA0427.outlook.office365.com
 (2603:10b6:408:113::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21 via Frontend
 Transport; Wed, 31 Jul 2024 10:21:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 10:21:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:20:59 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 03:20:59 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.10) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Wed, 31 Jul 2024 03:20:58 -0700
Date: Wed, 31 Jul 2024 13:20:57 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v3 04/37] drm/nouveau: create pci device once
Message-ID: <20240731132057.00005b5f.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-5-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-5-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|CY5PR12MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: 94290fcd-a28d-4ca8-0f60-08dcb14a7fa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZmB8b7CcOoIgzBB44yU9Yk5O59D0uH9Kw30jH2Lvnliht4mCsZbrrAp3FzWz?=
 =?us-ascii?Q?dciUIlMKeSFrt/ejph3rWkXPIGicMtBjLk3FJKrb9FGoKoozz5kGu9EhBElB?=
 =?us-ascii?Q?GamvLcKSbBBEFX3wjKQxq/yPTtZPQkGA+kKpbQZ3m7NuoDjy7QdXki+9RuZE?=
 =?us-ascii?Q?B4kmvzL4SK1Pq6JzzTho6C8PavoDEevz2eQgDBrWEPEjcFbmwMAhpC0PTTQ9?=
 =?us-ascii?Q?DdSsny6gZ6iMyemDLMoYnKvRkci2doodmcmkxzj9ul81sxCIDJBDyugmS2+1?=
 =?us-ascii?Q?LaB09Zxmp2pZVJ4Ig8MgnZfx2dYnpmwX88eCdLivxtt4sbciBCK2YsnZKjIE?=
 =?us-ascii?Q?I3V/r4RnBk5kCbDh/ZnTDagIQfOkgBK6a7EuTJN8zP4/OjukWaU2+p9Yt2ZN?=
 =?us-ascii?Q?qQ0b9F75pD4jJAlfwzy5jm590KkXCWju2VzMoqnIfNS/FJ41Mf8SFalSN80Z?=
 =?us-ascii?Q?8gmoyeHenW78q3PG2EgzNi8KOwi7e6iedhuyBq9o9yL5OehhkGWDdBRp6AVf?=
 =?us-ascii?Q?S6iHajE8qdAEiJrOn1bARBC4AglQnkE72hRcwtsq3n5rNyjIjobWs8A1StNv?=
 =?us-ascii?Q?zUFOSVkpknJn7h1RYFBZGiUlna03vH8Ux1avGs5tnC4x4H7/euGSWvnBQTIw?=
 =?us-ascii?Q?/Q3B8AhGAQ5iol9c6Hm4D12IN3jiM3jGttASo+g5lWvE+NUrCDSAg1H3xVNr?=
 =?us-ascii?Q?szcf8t1mrZ412wnJp8+j8l7GjHp2QD7uOVLcDApGlhej8s5HZQJSj28yqls0?=
 =?us-ascii?Q?KrZpXFwjBJc+FKQAHDRB1dUxKj8C5+2M3IfWTnafzZ1vIdc2le7TpKnnSrLz?=
 =?us-ascii?Q?kiZKHAmfQRNipt5eLfCVj8bHfSOtmC3Mb5B6PnwkwwTpuB4Wdg87HU0lJ4F8?=
 =?us-ascii?Q?fJs2+2M1/bJw2/DP+/VONwwg3wtx4TB3XfYcxBeyVP+vpScJF49jyuyR6Ah9?=
 =?us-ascii?Q?kMZ/3gwtKWh281IhGi69yssaVROiuePqj2+KAWxQFNsEYfIHeyzHhPQCGpdm?=
 =?us-ascii?Q?223S/RM5vnSTsCWo3+Gtzuq1lM+5e2fCnz1fPY6Ia2GC45643NsDz+O1Vwov?=
 =?us-ascii?Q?skUkqRZaoZSmBgKFiR70fdhDQfr1ozpJcDSVFjaHsCaK3EtRe4V58KRyIRxO?=
 =?us-ascii?Q?SLtV+DDEcznCkgkiEQVF4UW/FR5mbtZn+AioH1T9ZO1vLbXRZcduSkpVsMK9?=
 =?us-ascii?Q?8/2/CPNYd8YhJK2nPiyIpoWYbC0u+4ugEiKgjJO5s03+ukRmggqAibwVXTu+?=
 =?us-ascii?Q?raki4gBGJkQ0B5XfeYDlZWOhCd4hvo9vv8o+suPX+rPtMEscbepbbzBVawST?=
 =?us-ascii?Q?BcJMPI4wsdpsnQhanmxeCQznwLR71U0Oyt/4Vd4EnZwY/trPIR/L/O4UvqNA?=
 =?us-ascii?Q?DrcJWWTeicc/hIyJDqD5F24qecWmpDYL8uoiUqFoQ9oVvsYuv70ySg1GdsRc?=
 =?us-ascii?Q?DLvtiqdMLl/531VYfPQp+ewgfhnjAJnC?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 10:21:10.5153 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94290fcd-a28d-4ca8-0f60-08dcb14a7fa8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6370
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

On Fri, 26 Jul 2024 14:37:55 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

> HW isn't touched anymore (aside from detection) until the first
> nvif_device has been allocated, so we no longer need a separate
> probe-only step before kicking efifb (etc) off the HW.
>

The patch LGTM. I am curious about what was the situation back to the
time when this probe-only step was required? Like there was a period
that nvkm_device_pci_new() would affect the HW states?
 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c
> b/drivers/gpu/drm/nouveau/nouveau_drm.c index
> 0687bc59d486..f372bf2954aa 100644 ---
> a/drivers/gpu/drm/nouveau/nouveau_drm.c +++
> b/drivers/gpu/drm/nouveau/nouveau_drm.c @@ -839,23 +839,16 @@ static
> int nouveau_drm_probe(struct pci_dev *pdev, /* We need to check that
> the chipset is supported before booting
>  	 * fbdev off the hardware, as there's no way to put it back.
>  	 */
> -	ret = nvkm_device_pci_new(pdev, nouveau_config, "error",
> -				  true, false, 0, &device);
> +	ret = nvkm_device_pci_new(pdev, nouveau_config,
> nouveau_debug,
> +				  true, true, ~0ULL, &device);
>  	if (ret)
>  		return ret;
>  
> -	nvkm_device_del(&device);
> -
>  	/* Remove conflicting drivers (vesafb, efifb etc). */
>  	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev,
> &driver_pci); if (ret)
>  		return ret;
>  
> -	ret = nvkm_device_pci_new(pdev, nouveau_config,
> nouveau_debug,
> -				  true, true, ~0ULL, &device);
> -	if (ret)
> -		return ret;
> -
>  	pci_set_master(pdev);
>  
>  	if (nouveau_atomic)

