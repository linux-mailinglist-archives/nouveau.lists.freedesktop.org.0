Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 399A0CA2B0D
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 08:50:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81C0010E8D4;
	Thu,  4 Dec 2025 07:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y5+Q4xXm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013044.outbound.protection.outlook.com
 [40.93.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E495E10E8D4
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 07:50:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThqaBAns2fnKE3K6yl6pwLJ3IfwpWMh7LQqu/hFdNehOQyiwj1kTb7aIyscLCEWFismW7C8IvckIvIT2/LbEyIPLv3BYWp5e+aNTpxBYSt/pr1bc+fQxZx5V2peudQtKZkL0jkywtYUuxcoXcWR/TOG/Os7MR0uPfnHSAen5FCUqBhXv7tkhVlycaBgFjICfx6dsB2rz9HhJCN7jPwWnoH3giC+ro/eVkITAGA86tpPl+Om6lJ024dMDSNXLFZo6na5XCxR1M27qxPLVNmC3vYc5+MWOFfHT+BAMrfYXa+Cpp9v9XMu20cgh7rczY8is/RWhp6C3Q6s5Ug9OrYyFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLtuq3ww0xgbcT92WOBdg3+UUDGhihAThp4RLQKpnGE=;
 b=pMDBPHv/3J4vlmzbnR4hX7bxynzInDr+ZH8irUuuurTCUwxiqn+AvEsrKEkb4wNAhWuToCwwg5ZJ4v6ilnatuRk8+YszKzjFx9oatWr0YS+Gwfb2AdXPyEFHmekKnOH9kNE0a40BdxgEak/Ww3hUoGvuorwVytgZ/z44R3ubxmfly90VkEMEArzuAmrDy4P+37zaDUb/0UfKsWiFZkOtyxG8Epv0HefYLet+IAMQ12CYzavCHbvXgDYWX/y1pPpJjUxe6EOjjAkvzSDnk/whzWxWjdtry01o59Ik9sUiGFGS2aAS+PPQa7fBkSKtB9XVJ/RhMUasZ5Ov5LcQnuWD9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLtuq3ww0xgbcT92WOBdg3+UUDGhihAThp4RLQKpnGE=;
 b=Y5+Q4xXmdcS90Xrnyq/eS0Jv5v7eARXOoNnBSkE7z2dpgwsGjiOZcEg1Kkq2T42/5orjsNCv4mlS+NUvWXYB4elwzcoPvKxtPGm36E33SaTXAfW9l2EpO7yukFIB4G8LvrtvPmE8hbM2jrK3pI8mYxa8m+j9dQwWEKfaG+cy/TlZsrMawAJ5ZPwiI9zWu5KYKUyp1P9sOfj+8ZrOySeOi6qNY0auZJkvwdI2vZ3y/n4HjCSvu5oqXgW7OYM5Z2Y2A3F8dKZM1KzLp1oMYaUz+mu1mcQmmiSFhpZ3FvaJE4Vln0uFYoEqDXjzV94zBGaOYNl4xXOhibVgRjuohsmTOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS4PR12MB9708.namprd12.prod.outlook.com (2603:10b6:8:278::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 07:50:07 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:50:06 +0000
Message-ID: <c04a5d5b-71a7-496c-b763-1130cddd1842@nvidia.com>
Date: Wed, 3 Dec 2025 23:49:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 28/31] gpu: nova-core: Hopper/Blackwell: add GSP lockdown
 release polling
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-29-jhubbard@nvidia.com>
 <c54382056317ee02de20827d403e8097b1551cef.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <c54382056317ee02de20827d403e8097b1551cef.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS4PR12MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f3b07de-cc5b-4777-fadf-08de3309bdde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnpCTTUwdGtOaGVPUGJNV1pBRlRoV0JsVDFqMlZNa3hKMVZNNUpYcDdvWHdm?=
 =?utf-8?B?eWtvakFEYnMzTlFaNmsrV3FZZlRDMnhtWWRidlZ3RkVMQTFFVVJDeUc5Sk1z?=
 =?utf-8?B?WTQrT0s2SzZzcGJBc2NwSit2M3RaN210NE92Z2tjMXU5di9xVm1IVjU2MFIv?=
 =?utf-8?B?UzJwdThvaXVRVnROTzNiQkMvQ3BKZU9qc1RZN0dlOWJGT1ROVHRUVE5mSElR?=
 =?utf-8?B?dnRLR2FEUHNrZEF5aXppL255dnc2WWN0Q3JwRUFhQkxNMmJzN3pXNDllVzMv?=
 =?utf-8?B?dCtrOGVwVGVZa0xrNUsxeVdSbWVoUjVFbHhsNkRrSzdrNmZob0ZJOGorVHNx?=
 =?utf-8?B?QUs3R0Ria2phcVBCNDV1dE5KZklETi9EZzBBa2RIZVUrVkVoU3lVdmE5TWhY?=
 =?utf-8?B?R1lmNGducW50enEvWmFnRzRTS2x1VE1LbEZ2U1Z3VjczYW5vRXU0enVUc1BY?=
 =?utf-8?B?ektXWHpveWpzK3JEbFVHMXpxRVl6SGVMdjF6eVJSRDBVb3RoV1Bua0lKYm40?=
 =?utf-8?B?blZTT0lRb1EraXlIWG5MSVAzN09ydVltcGxzQVgxclp6YktCR2d0MjBhRVFr?=
 =?utf-8?B?b0pvMmYreE9OejJFZXZISExnUG5YanR1YVg4V3kwZjcrL2MzYnhKSUVTbGU3?=
 =?utf-8?B?MGl5SmFqM0NlN0VQSWdxU0NtanRrODB5Ly9EVXFYRTBNbzBOVjdYNnplanBz?=
 =?utf-8?B?ODloQVUxRXd2R2ZRcEhGQW5JUEVJUGtIZmg5d0l0LzZKNTJCbWh2RnFNUkxr?=
 =?utf-8?B?YldPakZCN21YY01sY0RwbnNoeXYvZ2NUZWtGb05PRU50b1YzaGpYdkgvdFlj?=
 =?utf-8?B?OHFwU3JueXptdDhtK05WOE9KZWZMS0dKUlp4VDBEU3Q3dDlhaGhFY0RnOXUr?=
 =?utf-8?B?S2tGcFhVUTNKREdWSlREeVk5SGNhc2RrRTJHOTVhSlo0RDVaL0xEQ09YSDZJ?=
 =?utf-8?B?MjloZFpyUlVTemUrNXNTMnhNSVc2NVdFeFNnR3lmc0txTi9WM0s3cThaanhS?=
 =?utf-8?B?ZXBGQXNNU05ac3dyRzVRS2FOYWlHejljdEVmT1laMUdTeUV3ZnNOVjB6bk1l?=
 =?utf-8?B?M3RJbERwNjMzYjFGbzlEWGR2SG16ZkpqR2VCM2dFdnVPdFJMS0s5ckt5ZlFP?=
 =?utf-8?B?c2h6Vm9IMlBUSUdCMzV0TXMrQkFwZk1QNiszdXkrVGNWYWxHdEhLb2dPYytm?=
 =?utf-8?B?OFU2bC8rdGFWZnZ1MFFDaVVkK0gzdDQ3TFFUNTd2WTBybnlCTmIzK0xyaEt6?=
 =?utf-8?B?cXZxeWw0OW85REJuVThIOHVRK3hlbDVlNllUYlY0d1NkemdNVTUrSE1zOVVk?=
 =?utf-8?B?VDZSMFpoTFY4T0xIa2xTZUxZT0U0ZTRtSmxEOHdqZVJ0VDI2dGJhZURKc0Y1?=
 =?utf-8?B?TU9PSDc4WE0xOFhRbVNSQUlOOUJBKzJuQlhDY3dvMVB3V1ZLV25YNnJDM1dh?=
 =?utf-8?B?c2pnR1diazhlRFRibGw3OU8rMEtSNE40WFZOMXQ2Ym92SDhYYjRBVG9MT3RV?=
 =?utf-8?B?ZEJaL29teFRRVEhxREV3aURxTVN2MXpkUlJGb05VcXpMbk5hQzdBZlJNN1hU?=
 =?utf-8?B?K0syU3ErNU5lRFJDUFhrVDFUTCtWY3p5VE50cTNyaWloTUk1NmJUZTVlUXMr?=
 =?utf-8?B?cjU1U0l4YjdCS1ZVdDl3QzdQZVVKay9uOFV3MnBkbXl3THhHMUNTTGlYSjFK?=
 =?utf-8?B?S2tHMmtqMVpSOVlpYk51dUFGZWhNN2wybFROajlLdG85T1A2MXFDeG9sMjNy?=
 =?utf-8?B?TmVmeE03LzJwYmdoZllXTFcyczAxU0FmVVB5V1B6MGRrYWJydUNuM3dSR2Y5?=
 =?utf-8?B?bjd2UHVjYmxWOXdtZEFUWVJiT29hbzczOFZoMjNnRzcrcHQzM3BRaG9lWmdq?=
 =?utf-8?B?VlVTb1N4SGJZaFJ0VFZHTHBCYXppeDQzdkhjN3RRUWlBaWRRTFNhczg4VlR1?=
 =?utf-8?Q?m7Lbsjfq5bU4EekP1f7I6dX73C6qq+4i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWJ1QkxXWWN1SnJySndUbmlhWlpDamZjNTlTZjNwK1NiU2JUdU56YnZBZENF?=
 =?utf-8?B?b3k2OG9JM1E1ZFEvbUlyQkFEMGJGWUVNdTRJNmsvcGs5VytOdklGRDRkL2lr?=
 =?utf-8?B?OEpxcDNqVHFPN09jMDcvYnREdlFndTdUOVJBOFFiOE8zUmIyUUpGUWtDS2hw?=
 =?utf-8?B?MFhjeitLSnVxekVmb2c3a0xsV29vUXdoK1prVjJVVTYzbU1naHlyRGY1QUMx?=
 =?utf-8?B?Smh5dURSZW5rNjVyY1FwRmlyV2hJSjUyelJjVHB4dVVUakNQZjh2cjVLdGFn?=
 =?utf-8?B?Q2J6QnJtWE10ck5VdzZmNjVDSHE1eDFjNURSY2wrNXFFSVFmVXV3NE5lb1o0?=
 =?utf-8?B?dnhacUdNNXFYdEJQaXBlM3hBc0RjRytsalE3WmN4Um5jb2UzSGQ1VGdTbWd5?=
 =?utf-8?B?RUEyTGlVakZuRXVxNnJueWoydmlQRDZoNWc4TThkWGNPVjM3Vm1SV2RGdllV?=
 =?utf-8?B?Wlh2d09PNldMSDQ1cmdpMjVPUmQ0MFhVaEdDUy9JTWZqU3l4WCs3Mm5lQmJh?=
 =?utf-8?B?bWdNcHNtUWx2N0FuNlFKaFFnOVRDRFhvUjFSTlgvdXpYZ3Bya1B0bUJDRHNT?=
 =?utf-8?B?bXZrSmtQOFR2RGtQMVZ3Sk9PaTE2Q3A3cDZFRmhSUDFMbGlZNWJCSHhia2Ix?=
 =?utf-8?B?TmljQ01rS3ZIQXBjMWdWRGdMeXFJUWYwTHozNU9PeEpXMmNodXpYQytTcWVz?=
 =?utf-8?B?dG8ybEE3cTJ0QlJRRHduT09SSkduN0lHSGlhbUV6ak4wSFkrbFNobVl2eHNy?=
 =?utf-8?B?dThsRkFkMFlrQ0M0Q015TGtQK0NJbUtCSjdPMU5aOWtJdzNHUzRxQmhwZnhq?=
 =?utf-8?B?dEYzU1F1T1RoMVg4cUVrdEdaUk8yb3ViU2dnM09iVUVVdTIrMm9YWEpPWWRw?=
 =?utf-8?B?Z2VjaUR4d0Y1ZjY0bmEwd3I2aXFXeTRaWDZIbDRIeEJTYlo4MnpHYTdJUlVU?=
 =?utf-8?B?anlqNjRabXVKTkU4WUxJcmxuZW9qQUhFSHp1NXozNFQvR2pFV3puVEpyaHlR?=
 =?utf-8?B?dTRXYVZkRGhqNzNoRGI2L3ROWG5DWnJVc3FicDdiNFRML0tVZUl5M0h3VENi?=
 =?utf-8?B?YmhML1hxWDlsc0M2NjY2Y0M0a1AzMjMyWXEzTUY3blBpMHF5bFFpWEk4Tlov?=
 =?utf-8?B?UVZqM21XTjBrK243TWRxOGpjNXdjajNMTWlhU3FLWDVEVlgzTXRNOU1QZEh1?=
 =?utf-8?B?b1QwaEw3M1F2OEl6THh5bGtUb01Gem9JYloxL2M2NUZyVFpOaVdsZHdXWWRj?=
 =?utf-8?B?WlhUa05UMG9CT2M1eTF2d0RnVmpxQklpa1BwSjBidHh5VWJwWlZwUGZ4Rlcy?=
 =?utf-8?B?a05PdzhLVzREWjFmWHU3T2Jhc1FjL1VFZ2hDdW91UURzd3N6RDhQdXJ3VGNB?=
 =?utf-8?B?d0xRWXFVNDBtajJsbWxBcEZmTnFvdCtPOXFUQzVMZXVPOVZuU3M3QVQ2WFhv?=
 =?utf-8?B?ZVduYkh1Rld2VDlheTk0STJHRjUyTDNTaHozSHMxMnBjSmxZbFpsY00wOWhI?=
 =?utf-8?B?MEV4eHVGRHIzcVkxV2xka29YUmpTeEZGY3BRamwzMFU3YnovL3h2Zlc2eFRZ?=
 =?utf-8?B?ek1mUzFRNG9Vc3kzaFUzZWRwc2cyWVlzQ0VmbUFkSXVvL2VDSDdhVnByL0dO?=
 =?utf-8?B?eHphNmVIV05HWTVVZ1lJMzkrSkpEVVJ3WGtDTHVCMEpmV3FxM0xubkhrWkVv?=
 =?utf-8?B?cWtxa21LQlRLb0VTSThJSE5hK3BRaVY4VUtvOFIzRFNJOEo1STJmS0syZWlV?=
 =?utf-8?B?NUdCUGFFSFZKeUJqVVN5SVlPc3EvY05yU2hSMW9ncUlEbTQ2dVJtY3VMM3BG?=
 =?utf-8?B?d0x4NGE0Q2RaMjZtSmU4VjdNT0JhMUNjQmtqVkhIQ3phNUNTeWFybUl2aHJH?=
 =?utf-8?B?ZFpRYk9HOVBhT0txRXAydFp3cWpYVlZQVjhGZ2ZJMWNxbkJLYm1ZOTVqWFB6?=
 =?utf-8?B?dHpqR0pwb2w1MytWaVJTbytkQ0FkMUhrTUhEQTN1RlJGOGpvM0wvSkhNREV3?=
 =?utf-8?B?YUVRYllxc0xGTGg4WUtjUlF0WFFxc2RqcEFMWFJYU2VhRGZPZjVHVEVpdlVy?=
 =?utf-8?B?R3Y3VFg0Q05YUjRtME1wVmo1cVBYcEtKdWVRbnppOS90SXpXb0pudlJvbEJH?=
 =?utf-8?B?Z3BzUWVCUzdxV1IrajRiaTBsUTIrSGpydUlZTzJ2MW45YzBGZmRFVHV2VTM4?=
 =?utf-8?B?SWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f3b07de-cc5b-4777-fadf-08de3309bdde
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:50:06.8696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyyrlpgedH2bvGsTjRz5balNptHvtCWmogY4MuD51+b+xKezqi4aF8RgqzgqjaEg7eGECD6Hxi5t3x/OFwD56Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9708
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

On 12/3/25 12:59 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>> +        // Read GSP falcon mailbox0
>> +        *mbox0 = gsp_falcon.read_mailbox0(bar);
>> +
>> +        // Check 1: If mbox0 has 0xbadf4100 pattern, GSP is still locked down
>> +        if *mbox0 != 0 && (*mbox0 & 0xffffff00) == 0xbadf4100 {
>> +            return false;
>> +        }
> 
> Isn't this effectively triggering a PRI exception, because the register cannot be read and that's
> why it's returning BADF?
> 

Ah no, this is a PRI *error code*, rather than an actual PRI exception.

 From Open RM:

#define GPU_READ_PRI_ERROR_MASK  0xFFF00000
#define GPU_READ_PRI_ERROR_CODE  0xBAD00000

...and:

//
// HW will return 0xbad in the upper 3 nibbles
// when there is a possible issue.
//
if ((value & GPU_READ_PRI_ERROR_MASK) == GPU_READ_PRI_ERROR_CODE)
{
     gpuHandleSanityCheckRegReadError_HAL(pGpu, addr, value);
}

And in this case, it's just part of expected normal operation
while waiting for GSP to get done with "lockdown mode" (which
it is in while booting up).

Here's the Open RM code for reference:

static NvBool
_kfspIsGspTargetMaskReleased
(
     OBJGPU  *pGpu,
     void    *pVoid
)
{
     const NvU32   privErrTargetLocked      = 0xBADF4100U;
     const NvU32   privErrTargetLockedMask  = 0xFFFFFF00U; // Ignore LSB - it has extra error information
     NvU32 reg;

     //
     // This register is read with GPU_REG_RD32_UNCHECKED to avoid the 0xbadf sanity checking
     // done by the usual register read utilities.
     //
     reg = GPU_REG_RD32_UNCHECKED(pGpu, DRF_BASE(NV_PGSP) + NV_PFALCON_FALCON_HWCFG2);

     return ((reg != 0) && ((reg & privErrTargetLockedMask) != privErrTargetLocked));
}

thanks,
-- 
John Hubbard

