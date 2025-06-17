Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3979ADDDE5
	for <lists+nouveau@lfdr.de>; Tue, 17 Jun 2025 23:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A6410E169;
	Tue, 17 Jun 2025 21:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="efp1k0U5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A26010E174
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jun 2025 21:29:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SjqGwq9BvN/UTcOjcNyh0M/xeO6VSObFDRTK+hrSRJGPno5VbkAPOgYR66dkZ9aaRQQ2xWBL0by3g5VWebFs2aqEdFNkeG500wFjh4ZpZ1hn92IufC9ZhW0DfvUZl7ZUfwx2tCezG/KF2orQarA/L54+lzSZVoDOBoG0Z0QuEdf2/pfS19seW1fKffZhjmpWmu5Yz4x9e5v+3gbK9Z5Xol9vj1Aqwlfa4thbmu1c9d6mi/yOtCqg9osbO1j0WpVo6uZmQgPPKRfDY/x9S5tBtVJN0Oo/ZpQ1t9h0+zubOYA6ApAc9eEUwwqNKeGNB2Sjb7EIWwmm5Gw9md+rpplqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrNyKlNC6/DZVMeih8nohW8Xf5KOsc9PMzoBiYl5SGI=;
 b=d5XUQe55VKfHGoiRm46D9CYTE+/U3fxFe4gjoCBgKIPizMBfiWviNDUgJTwpF2h99o4nSuNzG3CPUTLMyyoVQSskC66taCRna8pTU8uBwsDPfX9MRhEcBU0Gk8JoYoiNuj2fc1qwZuwa8HzZu+kw53/8DdRsDXQt8YCZSqx5kUvygEVesvEz5f6JDTrRe0OtI95BV5+uTvTnirCWNqjwU5wRIgriouAaZ6NdJM/jmwt3n0+Ajh+5ZYpLtqO4I4dqcE1sqvn+5akGstFgCM/wDReZ/niGR9xPgye3XIQQp73IHwxa1HwvsNSn3QPgqtXCwYsVA3SeBe6WYUjYQGXLwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrNyKlNC6/DZVMeih8nohW8Xf5KOsc9PMzoBiYl5SGI=;
 b=efp1k0U5/lM+zixoWWTiBatS+YDl7MRJVJ+Q8lvRxgP1GgNyuN5dFd2NJNagk8GGml2qs7vIAdZDyKZOFwfLoOKZJamiDqw1S1MD6T3HDgPwi6rZTzql1rUsD/G2K+nUiYhLiq8WdwRmTdqR4Q1tZhw7a8Cfi7JuG7K3GHbaKPup2Bioy4ffRxu+rVsJFfzPpCVHsXh9ph8zMzun4s8+z8+1XW2S17EIcGecIkfuni/PLz6AP+A2gqEr7mNkoYMSv/AGbo59ovnlbj0km6vwSc9RWUfalMh+Dr8EohyVJ4Yp+092mcYTSjMqBxcEIaHEj4P6ue1Gmf2QVHyB5BShIQ==
Received: from DM6PR01CA0026.prod.exchangelabs.com (2603:10b6:5:296::31) by
 MN0PR12MB6246.namprd12.prod.outlook.com (2603:10b6:208:3c2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Tue, 17 Jun 2025 21:29:36 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:296:cafe::7f) by DM6PR01CA0026.outlook.office365.com
 (2603:10b6:5:296::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Tue,
 17 Jun 2025 21:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 21:29:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 17 Jun
 2025 14:29:23 -0700
Received: from [10.2.188.60] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 17 Jun
 2025 14:29:21 -0700
Message-ID: <5c0847b0-630f-4626-8e81-71455413bef6@nvidia.com>
Date: Wed, 18 Jun 2025 07:29:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Set DRM_NOUVEAU_GSP_DEFAULT to default y ?
To: Timur Tabi <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "mhenning@darkrefraction.com"
 <mhenning@darkrefraction.com>
CC: "kherbst@redhat.com" <kherbst@redhat.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "faith.ekstrand@collabora.com" <faith.ekstrand@collabora.com>
References: <CAAgWFh2wsJ3H0+Wa5=t7T7uJmnf8Zh49r==h3hbN650buSHEmQ@mail.gmail.com>
 <5a742cb7-1b06-4e84-8de1-9dbe03f99250@nvidia.com>
 <20e965c8a3021f052b15ad4d1626b811391b96be.camel@nvidia.com>
Content-Language: en-US
From: Ben Skeggs <bskeggs@nvidia.com>
In-Reply-To: <20e965c8a3021f052b15ad4d1626b811391b96be.camel@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|MN0PR12MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 70d3a617-e339-4a91-78c9-08ddade60e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OGVlaFVkVGpNTkVQYWJ0Q0R6cmZqVkNwUGxVQjB6djFEQ0hlb3l1R1RRWE5Z?=
 =?utf-8?B?NlE0VXNhcXBMREpYbzNOcVhvNElJQUZpNkJOMjVBM3Z2TDNJV2NqMnFPZWNw?=
 =?utf-8?B?M29wZXUrb040UDEzY1Q3UEVMY0xzTm52N2Yxc2UzL3lZandMYko2b0xYVmVW?=
 =?utf-8?B?M256R2l3QnlRZlZHWTNJRHpOQmJjeXBVVnhpUSsybWE1eWFtOTVKdzh1OG8v?=
 =?utf-8?B?MHdSWFNXOURrZVcwSnltNTUrQkt1Sk5PcXpwOUR3aUdLUzV1NVZMSyt4alBO?=
 =?utf-8?B?M0JocDRrbHQ5eCtML3NIQmpoVUxIWHVhWnROS1RzRXZ1V05YZHVJdkd1a2xS?=
 =?utf-8?B?ZzBwMGpPeE9oTGdkM0g4STN2UGZWZnYraXZIY0NjT01lblQwYjM4N3VQRCts?=
 =?utf-8?B?aFMxeWw3cUQ3U0VSTWMweDVqMExjanI0a09BeGt5Q1JjYTlpdEdkMjF1cytk?=
 =?utf-8?B?ZnhYeVBZMVhvNFg1S0gzOVlzSFdGVVRnbDJJNzhRRFg5OGVmRWRUeTdldE1I?=
 =?utf-8?B?ektZSVE5UmhDU1hPM1RUVVZlK2xmcGw4MnVKZVJtbVYrRVdUZFNOYTNYaE55?=
 =?utf-8?B?bE16UHNGeVB2TnBnRldaZHFNT3JVSG93RnBuOWl6TXBMUFRCSTJKbDR4dFND?=
 =?utf-8?B?dEN5L1VtNE8reDNQKzErS2hOemNlNVlQalRVVERCYUVpcURNWnovdUJXd1lX?=
 =?utf-8?B?YUl6OWVSSW5OK2xETHBLUWpNOWVpZFdEME96bFE4Qm5DdW1GQ0I1UnFxMkVl?=
 =?utf-8?B?S01LbFM4QU5ZaU9HbjA2eS9EbXczYmFOdmlaczVuNkxqOWMrc2wraXNsMzFQ?=
 =?utf-8?B?azZIZGZWOEZxUVYyR1F6Q0N6Zlg3R0ZHdGRFMnFQd3JKOHQyTENFVEc5QXEx?=
 =?utf-8?B?Wkh2eDhVVE9tT3NtU2hWWUNXZCthL2NGUnd6c3VKeFlYNUs0ckJId3NqVVlT?=
 =?utf-8?B?QVVRMnJBaE1zbUFuWTVETzE0SUY4SzVYRkQ1YWR1bnJMYnFRZGh3RitFOU0r?=
 =?utf-8?B?ZXB3M1hPVWozaXRoSFd1aXkrV3Jtb01aK243cEVhRkFEeEtFM1MvMnpMQnBy?=
 =?utf-8?B?a3BSSmpHZ1NPdjFHell2M0xBaS9ZTjdxM3N4NVlSd0RHMkZBRVFweGJCK0FG?=
 =?utf-8?B?cVdSakN0MXh2T1FlclliZ01nQjVtYjlIV2I5b1dCdHJnODNoTmdlVmY1RnZq?=
 =?utf-8?B?MTl6a29wWFY3Z1VPbzhOUE4xRU91SWpTZ1RaV3J1V1FHRHNIcUpxRlhyZ0gx?=
 =?utf-8?B?Rkdpb2JMdUcxeEFodWd2aHpyZzU4eC9weVRvTVpkSWROVzBqaVFrYks0ZnBu?=
 =?utf-8?B?VThIT09wVllFRExub3M5d283bERRSllkQm9oZ24wNzRuZDRrSHp2WjRVaGNX?=
 =?utf-8?B?NW9JTjZPWDEvMkcySHRWQVl0S00zcmpFQk1INHB0RUZ2SXU2SU8zTU1Lb3FG?=
 =?utf-8?B?MWJrWVhMZU42NVhmVDY0aVVUclAxeG5rNEZGZWhNMytWaWxKVFBiaVluTStj?=
 =?utf-8?B?Z0FhTitLUi9qL25WNHpodzJwcm5FTXdhSHJZbXVYdjFibjIwbldQNFpTbSs3?=
 =?utf-8?B?QkdubkRkVFpxYThBRTgwQ2NDMHpoYlhWd01HMEdJeTFtRDgraVJ4aGwwVHZH?=
 =?utf-8?B?OFphN0dLWVZRdEd1TzFnS0hJZFFLZ2V4V2R3ZnJDV1RXeUlSZVJpQkgxVXBs?=
 =?utf-8?B?dUFJTkt1eUV2MThKTTNVOU1ybWt5VXB1WURmVUUyK1YyN1E2OXR1WC9ET3h2?=
 =?utf-8?B?amRSVHlvSmlpamhRczArVlllSE5MMU53S0J0RnhGWkhRSHg1ckc0bHA4d0Vo?=
 =?utf-8?B?Q3RRa0owM1dDMnJCd0U0MEl4VTNqU0R6MzNuT1A1NEN0cGxJeW9wT2VZVDlJ?=
 =?utf-8?B?NzVYQTZBRUNXa1JSSEhpcW9vRUxteU5kcmptYkJHVHpsc1FXclRsUStWa2lY?=
 =?utf-8?B?OThXVWhQS3RVOHU4MDF4ZGRqMDNzcXo2RmNTS2xndTFwU2xoTE9icCtyUmIx?=
 =?utf-8?B?elEwWmk5aVpRV1NIWW1ZMkp1eERYVWkzN3h5NjR2YlJVWDhRa0ZPZit0L29K?=
 =?utf-8?Q?vRkQuB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 21:29:35.1504 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d3a617-e339-4a91-78c9-08ddade60e72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6246
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

On 6/18/25 02:31, Timur Tabi wrote:

> On Tue, 2025-06-17 at 14:09 +1000, Ben Skeggs wrote:
>> I have no objection to this.  Initially, the primary reason for keeping
>> it disabled was to give some time to shake out any regressions - but I
>> think we're well past that point now.
> In that case, why not just simply remove the Kconfig and have Nouveau use GSP if it finds it?  I
> believe it automatically falls back to non-GSP if the firmware images are missing, anyway.
>
> If the CONFIG option is set, is there a way to force non-GSP via the Nouveau command line?
Yes, there is.  One should be able to pass "nouveau.config=NvGspFw=-1" 
to select the non-GSP path on Turing/Ampere.
