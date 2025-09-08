Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB64BB48CD2
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 14:06:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F82110E4DE;
	Mon,  8 Sep 2025 12:06:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kGja1yE5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA02910E4DA
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 12:06:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvuJatm4+L6nUNxoq35IsJTXR56OTvl2liTYnkA0VzQnL9fcsqF6bZoz91L40hVjObZrkbaytGNgHh+z9Se/s1Ue/YXOD8KMgVCAGg0qqV6UPDkz8aZ23NsHgYzo31GpGEDyJgGfClB+X4XzR65YesogcWX5vYYYDIJUO6DkETES807wik5PyPNxm31mWRLrURBlfrQBQj2fDRwFJT9UcshX3IWHkllcRSNUB4fdarca8v01bM8WV5Appo1WJKIeAcMvGWYn4PboyhVFY+8damuJuE4UCevs5imNZaqVr6bgywYr9nstJdDixDsR0ojbOe0/B9ZuUdmpaxNMcbPxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jb+nRDuWNUkg6NqCWrngLvuYhnOzQ+gbqlLJveAWPQ8=;
 b=bF5EztOIvuUfnSZGHNxUQOOVCoft9ThzQ0LY6s1nZXq+I4qBVENU+vTsnGcqnZ2TdvNszPXKTzvEcmHngKZCn0pA4xl5y7dZ1QUZCemEh9xABFbcwLnQQSEwQmTqw2JcwxOtQrUD/GlKCgsnKbaKLzJgz4K+pPI+r0L/kSndYMxghVLPqx0+53XUaMyRXdOr5BnmiVutiNYv9cn3b4cfKDA2MLC6SDLG1LXft31mnaUg7KfgAK35CCgS/IcJefwB8mVdSKJOy8caUUWGACkTV72L74bdV7TjeF3qeBzLg++triXeJ9dzfOiv7XT/SdeHCyZovgZmR/sY3APTIIvtWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jb+nRDuWNUkg6NqCWrngLvuYhnOzQ+gbqlLJveAWPQ8=;
 b=kGja1yE5kdDJBS7RJPfUTcpAW/hZ8GA4zruHpqEJzxonvrxkVcm4Hut5vAABW70XyNyotqotUz7BYDDPVQCfeDloFOPIp4tSI2UXmGkeavwkH33AjRAGxHuUmuzBmbvSXg+ZPJeQUMz0aRFvHTNn9nwBA8qKOrDyBzijkx/Oqki91vhnxzx3Nh2DTZEkIdvF3qQ4ZEmPo0csKZJmv1jqz6SXmInDD9WV4RYZTt5fIh38IWz14ZaTAMmvmJjj2rOap3qD3IghaMhOa4MjaICwBx4y6wAr8TE1vmcbGPn0l04j95Nd1lYK7puFuu1qp/IF0xjG/QaNePaFwInXlh03+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6357.namprd12.prod.outlook.com (2603:10b6:8:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 12:06:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 12:06:11 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 21:06:08 +0900
Message-Id: <DCNEM8ECAQED.1CTI4N9WE311P@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
 <20250821-num-v4-1-1f3a425d7244@nvidia.com>
 <c3e8e0fc-5582-49ce-99fe-6dea37c39ddb@kernel.org>
In-Reply-To: <c3e8e0fc-5582-49ce-99fe-6dea37c39ddb@kernel.org>
X-ClientProxiedBy: TYCP286CA0326.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: d8fdf91f-a1b1-4171-334e-08ddeed019f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|10070799003|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTFJUGp2RHhxeERnbTF2WFNwTmhQWGhHMXhoZWJMVEJ1SktIOURYakI5WDMy?=
 =?utf-8?B?RzRmNkZtMzdtWVRUWHlqQ05tdU50czFZVDl6SkduZndnOXZ2Y1h0SEtpWlNq?=
 =?utf-8?B?bWJpeHBPd3dQemtGQXQ4WEVmWXg5d3pGRnhGdE5HSG1yR21tTGNlUWMwTTVX?=
 =?utf-8?B?UGpqaFZoZlhxWURLa0NsOEJnU3U3dFJqaitnZUVPZjNpRllQaTRRT3ZiamFX?=
 =?utf-8?B?Ukxwak1tc3NjdlI1WmRUbUY3SFdUaFZSdU1hY0s1Z090aUppWWNGSDVJVUtj?=
 =?utf-8?B?MjQ3UlZlRlpxVEZQTVRHS1JMalYyWERRODg2MnJ3bkxNWWNoRi8xZFc2elF3?=
 =?utf-8?B?aFBlMWcybU9BdkgzZURVWEg3Z3JPMitYdGRkUlB4ekdMUWZhOERuQ20wTmpp?=
 =?utf-8?B?MzAyNklXckJiVm9uZGJPKzJha1h1c09LZmcrVnVydjRMeFJ4UTRDVHpETnZq?=
 =?utf-8?B?dWpvMW94K0FCMk9xWXZVNDhSS2ZpNXdyb2tjZlh0S1pCK1hmM09yeVZwdi9o?=
 =?utf-8?B?b2RkT3V6blMxZjVyNEZsRm84Z0lMbDNiSDVBKzlUQ3VhTmNEZE5WMk04akdn?=
 =?utf-8?B?UzNOM2FwRlMyODhXQVJDbFVSQytFU1ZHVGpEUU9sMUdoN1V4Z2FFT2ZqeXFv?=
 =?utf-8?B?RktUWmE0dnFZSWVNUzlDaGh3cTZOY3AxWjVmemZCaWc1NFVqdzh6OUw4ays4?=
 =?utf-8?B?TlVqV0RwZ2hoVU45TDVtY0cvOW9WamFYdVBkVExEbnlEZnRKNS9JVWZ5MzRu?=
 =?utf-8?B?c0JVVlZsdFFVeG8vTVhyNnByMHBjQjA2M3ZNV0hjMFdiUndqSHRDT1lMT2JJ?=
 =?utf-8?B?YytuVVVSY05wME1kd2JDYjVRNFJ3ZlJZZlcrcERQWmVBV0N5bzUvSm55VC9t?=
 =?utf-8?B?MkN1MGcxNnpwOWVBa3dNWlJzYTdBYmZaa0xkY0czaFVrc0VWanhwSXNZL0t1?=
 =?utf-8?B?Q29PTWFzaE1GZW9zMGdtSmZCZURyU0kybExGSHpsV2YyNWJ3ZGtCT0d0ZFRO?=
 =?utf-8?B?NGtxaWpjZ2xuTUtqaXZPRjlmWk5nTGNSSWxUS1h0TExmL1BydGt6Q1UxMjJ0?=
 =?utf-8?B?UmdudnkrdUFzQzlyUFNPVmVxZnp6RmFBQzBwOGgxcGoxeEszY0hFKzE0cXdN?=
 =?utf-8?B?QUpUNmVYY3hLZElZTnNVTWkrMmx4blAySU5IVDdOQTN2djVJZGZPdm56andN?=
 =?utf-8?B?a1krNFh6dEtsdk9RNWVjOCtiYXVUWXowNi9rd0ErTVQ3aXZDN0w5MStNZjBm?=
 =?utf-8?B?ZVpPNmJVVEZSRTE3YXJET1VzUllZWGpYaUVzZUhwTjBzN0h3TEZwQ3R0M0lr?=
 =?utf-8?B?UTlGdk1oL0VwaXdBTE5RdXFFVXRTb2Y5MHdjdjRrV29CRHAvM28yUFgzVFpU?=
 =?utf-8?B?STg1bnBZbUYvZHFMaStaVE5FMVYyUUVQSUJMVzJWTkFOL0RUOEY0V3p5bXpF?=
 =?utf-8?B?REovVHhwKzV4ZHFNQmZ3aE5zS2JBRExOelZ5UmFNQkZqeTNHM3pjVEZUVjR2?=
 =?utf-8?B?SUZVb01id1hVQWIwRTFjN0k0KzBndFpBZ1NHUzBkWjBqM3VKbkFhaU4yNjQy?=
 =?utf-8?B?OGtRejhxQ2RrUnBWTzBkNUNQcldsZmlVa2RpdXBXNDhEM3I2T0x6OTN6aWN3?=
 =?utf-8?B?cmd6T1lrNjdkSTJUL3dhVVQ2Wnp6TDV3K3NQMDA3dWFXNm1ZN3pNc011Q1Q1?=
 =?utf-8?B?OUI1OHJQUnAyM1M4Q2N2bXhQbEJXdDJraUNQSTBpa1QxUUJTVGN0VWZ6T0Fu?=
 =?utf-8?B?L0RYNWYwaDY2cmJSVTBub1RaQnNISGR0c1NpdlZrUUJoNkNMaTh0Ti9hbWNZ?=
 =?utf-8?B?QzJ5eDl3c1Fmd041RDg3TVVRSm41SUdWSnRqcVVYcVV4ZEd4Z2dFRHlCV212?=
 =?utf-8?B?N2NoZGJQUUNkMlVhMUJkSDBXT3AwV2FpakoxRENpZ2xFeTBOQjhQUlI0c2hq?=
 =?utf-8?Q?KLzrhrq3J6I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(10070799003)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXdGTXZBM1R2ckhDU2ZvSTYrdURuWm9Yc2Z6c05ydldla2pTbkpqVWpqQU1P?=
 =?utf-8?B?QlBWeTRMa0NRYXJFRGNLakQrQlhzQ0o0WTQ4b0ZXb0ZyalV0UWN4UVErRWR3?=
 =?utf-8?B?NDhMQVFTbitBYzlya1N5QzUram9VMjdvQWJsL0JDWGx5NEYxTXF1VEFqWjdB?=
 =?utf-8?B?VWVyQXdLdm02NzZvS09UVlJBVUxWblArQ3VJVDRndjhkT0J3QjRTeWhBT2RH?=
 =?utf-8?B?Q1M2Y1dhMzFiTXpRVTlmZXV6bm1IdmxITWQzT2R4NnRncFFrQzV5cm1yNTdP?=
 =?utf-8?B?WTVkZGZzTldha2VyVTVTSGZhTzBTZCswaTRSc3lRQUZab2pacXBuNG9PM3gw?=
 =?utf-8?B?MzBkODcrVXRBQ1h2cXQ3MWZzSm93SU9haHR0MTd3bE9kZE8rV2U4OHJlOVRD?=
 =?utf-8?B?UWJvNmRPYXJ4VVMyaE1hN3hpSThxOFU1dWdpUTRMSGtqWDFZYWdEdXZiNGg2?=
 =?utf-8?B?b1pFa2hUV1NTSzZJSkFIVUh0TGVCS3lwN3Y1T2FoYlJNQjRBdVRzNDB4U1J5?=
 =?utf-8?B?S0x3L3NGNC9keU8xaTAvcFZJTlFmYjcxcWZIbDNpbHR1cXlOaE1qWlpDeGVN?=
 =?utf-8?B?VmNWcDB6SU5aanJWbVFLOWVxYjZTTUJGdU1SMHhndUVWM1NKWTl3cDYzWXZm?=
 =?utf-8?B?SUV3UzRWUHNtcUFLSlFacnFDaVluY203aEh6d1lpUmFiQ2xRN1lZSXUzS0pN?=
 =?utf-8?B?eG9uTjJSc3RvUFBBUEd0NEsyNWdlODl0WkhYOHUwYzAxREdpS0JKTmhUT2xs?=
 =?utf-8?B?S3VsUlhTWXMxVVU3a0N6eGIvMGdxYTF1ci91Q3MyVHBpeTJUNUhIRjBqUlk1?=
 =?utf-8?B?Wnl1S2tKLzVmNlNPNVVtbFhUR3NTMzgwbGdydzg4TmpIMHRHY29TTHcvc1o2?=
 =?utf-8?B?OHJJeXl2OHdUYWx5SGtrcEdndUVQMjVWNDBnVVJqQU5YUWdSU1FFNTVKZmxa?=
 =?utf-8?B?ako1MVFCZGxKc3NvdDFnTjdHT0Q4eXcrVEV2U2k0YStuM2xkTXltei9ZOUYw?=
 =?utf-8?B?Nkp3NHJZdlNTQmEyaTk0QkFnZ25RKzhwSXBSUFlVeC9mb2JjTW5CN0U1ZEw0?=
 =?utf-8?B?N0xMMTRndDFvdDN0Sm5tTXpKbEVNMEhLVWhTb3VNbFU5V0o0Z1pxQk5jbFVD?=
 =?utf-8?B?K09HMkQwUzA0QTNRS2I0YlRWSW43K0kvSlhMbnNKWmFrSTY2TnFvWnN1ZlRv?=
 =?utf-8?B?UnZQUUlBaTJ5c2tXd2JJdytlYVIveVB1OWszV1pnMFR4M2FoaGJmZjlnSDRi?=
 =?utf-8?B?QjhDekZPK3pDU0w1MUkxUWJNYmQrY3dsMmZJTGROSkFMS0FnTnVqbVB2K1ZN?=
 =?utf-8?B?bWd3aGVjclZQTnBBSjZYbEwwU1ZhaXlDMVl6dnJ3Sk94dm1ScDBNT2ZkWnk4?=
 =?utf-8?B?ZDJlVi93TTRDZmlpZFVJMHhPWk4zVlR2a1hXdkZkNVNPenA3QnJuV0N5L1dB?=
 =?utf-8?B?R0djSy82WjE3eWpGeEQ1MUNPQnBoK2ZCMk5CQ0dPSUUzTE9MQlEwdm54Ly9l?=
 =?utf-8?B?cWJhakFTSUs0RTVNd3FzNUttemxsWHhMVXlGTEJ4eTNnTTd6aXpDVWJQM0Rp?=
 =?utf-8?B?TWRxOVYvU2I3S0N1dzVBUnM2WHpaRFFpaUY4d2lGVnpSaTdQTmt2a1h4UnBM?=
 =?utf-8?B?MG8rWm1IUHZ0c1dXYldGVEdKQnZuTlRFVG1vSThGckJzOEhyVW9HYVRhM2hv?=
 =?utf-8?B?cjV6ZHpacE1ROGMzZXIxSTFGTnErSkRPNUxNZ3VEOTNWa1FKUDJPbEt0YXh5?=
 =?utf-8?B?Wk5ZcnBTbFZ2cFdaZ2htV056ZnlnK2tQazlhL045ejE2SHdBS3ZiUndodTRh?=
 =?utf-8?B?MUdEV01RTXBMeFBaWHAyQnN2RlV4d3VBNks4cE9pMVhXcndORzFHZjFlOTRp?=
 =?utf-8?B?ZFFtZU9lcWJ2Qk9Xb1BpdkQwWFd6ZVM2cTNqOXZSc2tpbE1oQUFzLzNwNEV6?=
 =?utf-8?B?dGE3ck1yemFZZDNLRzhWcUVCM1QyUWVQa3M0WGZpMkxDMmdjbnE5UFJQZTJJ?=
 =?utf-8?B?YzFnSVlhdWg3Zzh4MXRmekttSWRNTEkzTzNjSE96TUN5WWdKRng2bVI4TzFK?=
 =?utf-8?B?YjFZTld4RWxjeU0xT1FrNlRYZVNwOWxIdVIvQjNpUEU5dzA1THBGRE1EQlZP?=
 =?utf-8?B?bHBsVC92UlRNSE5EZ0pRVWVybVdyaE51RFhmVVZwNDFQVTBYMGI5cVhYMkcw?=
 =?utf-8?Q?zJ6LFKgCoAUzIIGdjwFUSO1IGTyX33CzIegyLyZ3y/OE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8fdf91f-a1b1-4171-334e-08ddeed019f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 12:06:11.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkjfvupyrHGvfHslAFPieaeI3U+FFJ6Y89AmsgvIHJf0SQxSrlYv99vtWvR0V/ofBrDZ7qvYj1RhddlaXDlitQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6357
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

On Mon Sep 8, 2025 at 9:02 PM JST, Danilo Krummrich wrote:
> On 8/21/25 2:42 PM, Alexandre Courbot wrote:
>> +    /// Validates that `align` is a power of two at build-time, and ret=
urns an [`Alignment`] of the
>> +    /// same value.
>> +    ///
>> +    /// A build error is triggered if `align` cannot be asserted to be =
a power of two.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// let v =3D Alignment::new(16);
>> +    /// assert_eq!(v.as_usize(), 16);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn new(align: usize) -> Self {
>> +        build_assert!(align.is_power_of_two());
>> +
>> +        // INVARIANT: `align` is a power of two.
>> +        // SAFETY: `align` is a power of two, and thus non-zero.
>> +        Self(unsafe { NonZero::new_unchecked(align) })
>> +    }
>
> For DmaMask::new() we used a const generic instead, which makes it more o=
bvious
> to the caller that the argument must be known at compile time. So, I'd pr=
efer
> this here as well.

Ah, being consistent is good, and I think I prefer the const generic as
well. Let's do the same thing here.
