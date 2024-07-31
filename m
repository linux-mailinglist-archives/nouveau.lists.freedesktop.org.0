Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A199897CA
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639BD10E36D;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="inbbDho/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4361010E3FD
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 11:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXm83Io5goqH5mjS4uIVYnRLi1unfVxNvoEkU3ftuzbzxN3eLir97DD71yWxYxBd/q+Bf1ujnTFGZ/NWI/5ipF3f+HxIiktcQatU/pmvbzt74g3wRw0g41dgrQV86iw9bfuPYWzkQlkOq9XaSMUbw9wd2+dLyx4GzcG8ijMeMQiF5GmQsaXNU1YQgYk7NhO0oXV+36WCwRm7FLbY+9ZsWynMrWbAYZpw1Q1fupr4ehZrlQ4RuhDBrare6tK2Qu4XHo9a5Dtsv6TABchXXS+8hktKSF6nQvSOkTonMd8SMWmbZwPWz5Eu8TN89U6PmEkhDRjUXhfv7pZ26cdDuQG2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AatYFCZDjegGU0EYnZWt7fiTuLlRP5dZnS+hpi004tw=;
 b=Fi/lCFh7BpFQ/B4nycbLaaLfjcMWRWKfyJlA/zXKKAyrYNvzdiYYNVxSj7cEjg9s1EgU14WN0AGWALo4ldOY7T/sxCq5CBaROeT6f24mtbhsDiLrLNHFvGUbliKnFYzJos75gwISGtb326ZXTSOhCuKf2R1ABdJRTT7lR3zL2E0fZodeEHwl6FLUdvCCVkNnHfGIBgbl553w47Kq+rxLGiQZAsaB2ougZ8dKKyUncQ65s4Hkr1dafde+8yxDP3kVqmbgHqcmZZVlh/y7sMhLwQrTzA/tNlR+Jw7Qq90I1CzqssDav4EBFegjID8QU9MTQbel76eAF27mIgGear9cUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AatYFCZDjegGU0EYnZWt7fiTuLlRP5dZnS+hpi004tw=;
 b=inbbDho/uHfQ8NKDQSvi/uqcA3QLRNhSU7slIl3nHNSgN+kkzWWNWVNgOwol1FWIvjv85QiyaKjxkT6Q6jO1rSDKngPp0f5brlTPWaaFu8T1lo4SJwmwRg2wzfVBj5CmPy6fVvoDA8s4zQD0/1CK8Y85tOMdX3646qeGl2+nSdjJkWRGZpxJ2HuCZyu/OIi2K3BBLdgk7069QtvRJs9+3pRdVM2Xrj6jf78HuXBLWSTWOvwvYWwkQrMDo3/asuR4Q/O9LcRFfxfjUxPskFhLhSoM9eChsjfDeueAnskalsKux2Is8mpm33rBeO+czb4nm4B/T/pw9VBwyY8Pt1fY/A==
Received: from CH0PR03CA0320.namprd03.prod.outlook.com (2603:10b6:610:118::25)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 11:28:07 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::9c) by CH0PR03CA0320.outlook.office365.com
 (2603:10b6:610:118::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Wed, 31 Jul 2024 11:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Wed, 31 Jul 2024 11:28:06 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:27:57 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 31 Jul
 2024 04:27:56 -0700
Received: from localhost (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Wed, 31 Jul 2024
 04:27:55 -0700
Date: Wed, 31 Jul 2024 14:27:55 +0300
From: Zhi Wang <zhiw@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>
CC: <nouveau@lists.freedesktop.org>, <zhiwang@kernel.org>
Subject: Re: [PATCH v3 13/37] drm/nouveau/nvkm: remove nvkm_client_search()
Message-ID: <20240731142755.000038b9.zhiw@nvidia.com>
In-Reply-To: <20240726043828.58966-14-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
 <20240726043828.58966-14-bskeggs@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c20a58b-f6e0-4f91-01d8-08dcb153d95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QfXAj5YrS6g08J3otHjWeJnabFuxFBbDczgIxfMYM9OY6pQe81GZXjpPjjIN?=
 =?us-ascii?Q?J2np0hQhjXV+MEAeaaQR7khwR+zG70ROIyc9/MDnc/Bzk6xYV8oCralnUde3?=
 =?us-ascii?Q?NRmrxCyO7Kzkc0r+HlD7OxIeCIY1L9mYmYbBjU6CLp9/GM2LAyI89zl5cYmy?=
 =?us-ascii?Q?/gUT9de7/3eYmAZvlzxq/OqrXhnv3VlQAJH7uX4EArUXIhY19miz+Nf64Izo?=
 =?us-ascii?Q?/vKZHyCFsti0MM3XawvJOo2w9zo0iKkHauD0Cypj75mXO9+qmkL3KnxZnU0C?=
 =?us-ascii?Q?e97hPQXaSmdVNONz+Rm1Ga7yYWewPumEuRdiuB0k66sjl0KMzq0VgXc58n9f?=
 =?us-ascii?Q?LL3TkpCY/R0cmIcUp0RQhDA5R+p3T9e/F3+kXxnfyESGvQ++pTDcAZPs4+2o?=
 =?us-ascii?Q?FhHIbj/eR0crO/mPivySvQG2KlFK70yQFmtwWkK5ciFKIpj7GXpgwI8Sd9T4?=
 =?us-ascii?Q?ywqEQHM6cQAECle4/VpuKccC5+a6QyXzvqp4UBIBZfPRuQQ+nqx93WSP66Qg?=
 =?us-ascii?Q?+YVy/X+yVRMB4nl3ehQAq8KUAFNsfWRb89CeYDPhR+NIn7KBf4fDNFcjQy02?=
 =?us-ascii?Q?KaPTKkiANwERWSfn30LJQBOhLX5rtRhFGpJGxmn6Cj4ZitmsNkab3Gz2yVLT?=
 =?us-ascii?Q?ZqAdUi1hGmQ6yuGXwPr0n7Vf9+juslHknOuSrWFcBRAPtvHcGFy3F0aId7sG?=
 =?us-ascii?Q?/Qmkxsup1m02iDOx70Xig8H7dc0ObOfJy6/eXjVZrJZsG8blmP9l8iGV+8t9?=
 =?us-ascii?Q?7EekBGtVKLAPqBYFx8qEGB00FdJsjZslxtn7HB3DEktWPWByXt0mkg9K4xLv?=
 =?us-ascii?Q?1zzN8jCK7a/NJdcAyR1bJh1+cxql9jXTy+Re8Eu3o08tb6gCZeZjx1ng5Z5H?=
 =?us-ascii?Q?UQgh2oLvnkkJLhUIdSaxSIlq2HUX0vkuLNMgtbrxKjxRZ1wYysYbV8yEOIJu?=
 =?us-ascii?Q?GWSu6skUkCkJ/UhKtFFmXvMCebP2fc3Fm5H8Ra9ItrW1jjXbRmITGfDe2xgm?=
 =?us-ascii?Q?WjnKdVxY+agntBkK8vkmfp6/BVMGZT8NhAN8tD9Nq0xEbqg64DqQzpivqE5C?=
 =?us-ascii?Q?0w4PlLhSepKKD7SRXBKTJfGa1cH5xVAxYIldywZZ/SQHwJJElOJgOfMklDuj?=
 =?us-ascii?Q?oS407pFnDL5rc8Tv9uJD7l1w74rl2crTX13KI8kPoNTM23AldG3ZvJ/cs3fw?=
 =?us-ascii?Q?HX3mn7pLQ6H3M19HVkUzSleOuz1wHzA1N2neWu2h7iWv6jnmGjZXKqk8RIH8?=
 =?us-ascii?Q?+eMoZwm/IgMAVLwuNz46ChB/7EhyHy1c1Etomi+LEP5fxn3auYRQf3ue7AIh?=
 =?us-ascii?Q?SANzGXP269gbA5dgx3st6DTPO9uXYWEeKwq9ZzVd+fF0Qxv5Vc8Lhw6W1qCr?=
 =?us-ascii?Q?5b02AydJX2/ct9jiIqbfefyPOHtLHAAZnnWJ7XEKP6EtFtekL2xcN2hnUzHY?=
 =?us-ascii?Q?JX9OioeJh43c/LMoqQ2OUjyF2Tie2rTO?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:28:06.5645 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c20a58b-f6e0-4f91-01d8-08dcb153d95f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
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

On Fri, 26 Jul 2024 14:38:04 +1000
Ben Skeggs <bskeggs@nvidia.com> wrote:

Reviewed-by: Zhi Wang <zhiw@nvidia.com>

> Has been unused for a while now.
> 
> Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/client.h |  1 -
>  drivers/gpu/drm/nouveau/nvkm/core/client.c         | 13 -------------
>  2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h
> b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h index
> 932c9fd0b2d8..15f27fdd877a 100644 ---
> a/drivers/gpu/drm/nouveau/include/nvkm/core/client.h +++
> b/drivers/gpu/drm/nouveau/include/nvkm/core/client.h @@ -22,7 +22,6
> @@ struct nvkm_client { 
>  int  nvkm_client_new(const char *name, u64 device, const char *cfg,
> const char *dbg, int (*)(u64, void *, u32), struct nvkm_client **);
> -struct nvkm_client *nvkm_client_search(struct nvkm_client *, u64
> handle); 
>  /* logging for client-facing objects */
>  #define nvif_printk(o,l,p,f,a...) do {
>           \ diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c
> b/drivers/gpu/drm/nouveau/nvkm/core/client.c index
> c55662937ab2..48416c5039a1 100644 ---
> a/drivers/gpu/drm/nouveau/nvkm/core/client.c +++
> b/drivers/gpu/drm/nouveau/nvkm/core/client.c @@ -67,19 +67,6 @@
> nvkm_uclient_sclass = { .ctor = nvkm_uclient_new,
>  };
>  
> -static const struct nvkm_object_func nvkm_client;
> -struct nvkm_client *
> -nvkm_client_search(struct nvkm_client *client, u64 handle)
> -{
> -	struct nvkm_object *object;
> -
> -	object = nvkm_object_search(client, handle, &nvkm_client);
> -	if (IS_ERR(object))
> -		return (void *)object;
> -
> -	return nvkm_client(object);
> -}
> -
>  static int
>  nvkm_client_mthd_devlist(struct nvkm_client *client, void *data, u32
> size) {

