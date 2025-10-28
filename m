Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F455C161E1
	for <lists+nouveau@lfdr.de>; Tue, 28 Oct 2025 18:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4844210E61C;
	Tue, 28 Oct 2025 17:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aD/msNEJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5644B10E61C;
 Tue, 28 Oct 2025 17:23:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFid/CR+hjsibLUJGMN9WZraI7KSsAR7BRr8AMgyi8DAKzUKlEH7lQVueejQnyp50kUgkfTEcsIVzj/Yr6YvUWXjdmSHKI2qY0SSXGPuJCmyw/3Vw8blyQzLw799ABAaL3GN2e3g/mpGEcjevJgA/imDPMWswMHU6PbEsyN+Yf6P+teDRX65YZMbfNLvhtGQj8Ik1CaP6RkBHV+WIhN7HOaMVDP/Itt/c0SJRbB79nAaG6XbkB9cYStzjlrdAMLRysWQqBeBnlNNPS+GEE0UJP4SdADDWp98le5FkCaSAORwUfOUgPhciruIB91m0p5kJpytSn9wSpALYAHHKw4MEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ByivNLZGHDLwxifTC4HtnT39ILB5Rwz/1Ql6jGLFp3Q=;
 b=S1zAGcKYV3qpMdUZjvXSzpKELwxyPbMHEKMUsemmb9KyAwOf2akJzqkdaWlCLI85UemFKTHF8Fcc2DY7HBBeFnVTc7CjyrfNdVeH6hPUOvQ4JCz/kMEpIV6nEoR3l+osi9/sU4gJEDbi6nRXuVUWsDoZjeZn4SANNo/dCSxuLao3Gz3eUGJh2Ey+b47Qs/jdkG1NjGRGjfHVftg2gi3eJn3AG697mMbJDLweWHcrQU54eG+87m5/gqtNlaLWgmO+6KCTa8fVC4SWej3aDFFsTFtYuCu8o0qr9c4QQZgjLnqQdvNeKymFPx29BFlmZ73ciBZlhmyyagN7AAvFfrWgGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByivNLZGHDLwxifTC4HtnT39ILB5Rwz/1Ql6jGLFp3Q=;
 b=aD/msNEJOzl62/QcryGg+rn3CupbLz/iDp4xMceeCtePFW/TgdwBMy4MxsPbuwbID9WyNmY1oPmumMd+/16BQSpvJO6J+ug7PpK0g5SOh+CZRz8fYpeHlOti5gHwhpc3IwATjc2ryHmzd1syvBTMAl8YyapaOQZmfIcRQ8mqtTzwfVWmIj4b6u/A1yOdtSOobSvEqUN9UF/iieleTx+yfyf4K6tN5EZ8SZznK1fCEsCGjRD8sFyogW9F3q3+PT9hAlqAs5Ln513lIFqx1aLmnVd0o+KVq3uj/tAhoVwCxZ5OxSfsk5ujd8RJYicgOjyfU8D9N4tSqywuVYQ/bTLB+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 17:23:03 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 17:23:03 +0000
Message-ID: <f35d57d3-149e-4bbe-98d8-e152ca7c1da7@nvidia.com>
Date: Tue, 28 Oct 2025 10:22:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251028023937.1313108-1-jhubbard@nvidia.com>
 <20251028023937.1313108-3-jhubbard@nvidia.com>
 <DDTXFK7JE59S.19TLPYTWTFHSU@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDTXFK7JE59S.19TLPYTWTFHSU@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:510:325::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 8400b142-9944-4f12-429d-08de1646a6af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXNLVE5LcU9IUHRCR29zOTMrSWVWRnA2UkNHc2NzQlFneGVVREk3MGZ4NzhR?=
 =?utf-8?B?VHUwY3JxVEI0THNaL0lTNytaSXVMWGhMNk5HYjNDZ2YyK3Z4allzd3pLZFY3?=
 =?utf-8?B?MU5VandEdkdtSXA2UVFveEZCWFVDbHJiclJ2eUhHditBbStSbk9iWlhDSUxL?=
 =?utf-8?B?WFNrb0VDdVdCWmxDYi81cm8xYnN1VUpVOWI0V1NpTVhoVEJ4bDFRanl4NTgw?=
 =?utf-8?B?QXRoeWhuVUluWVFWUFBqc25yUGo2bXNKZkNKamVKWVJoZXVUek9kZHU0d1RT?=
 =?utf-8?B?SXRVcWM3bno2QnNTQXd0YXhCWktTU1hndUJQQkg5cDZOL1hjYzNyTTF5ZGZp?=
 =?utf-8?B?ZWVUSjJtU2JwQWk4WTQ4VDVTY2U1cVR0bk9Gd0RUQXFqTXJNbGlLcE4rZXpG?=
 =?utf-8?B?TUdoSk1pdjB5cmFCeE9Rb3BlaFcwQkRpcnVWUFRTNlRnT2t3WGpwdmpKWjhH?=
 =?utf-8?B?UmYzU0thamkzcThUaFNBdEp5TVRrK0tsUmRlKzlRWU9WUGczWE9rTmM4QWJV?=
 =?utf-8?B?QW94Ui9Dd1dJTUhlOE5rTk5OdVp6c3IvNjY4bDJFNHdSbDJ1VWF5OVRrZE9s?=
 =?utf-8?B?ZW1BbGM2NzBrNDlVTmxtK0dDRjFybzZLS3YvMm9GcTF4SDNwNERmSHRzc1NL?=
 =?utf-8?B?UTZOTmJsc0hBUTg5MVRnU2M3S29TdWoxY0M1alRaVHdHSjhPdmxPZENRUXhD?=
 =?utf-8?B?cnRCaUpQNVZNWmdOM3p4cXU5RzRjTSs3WVVDZzNsdENFQlR0MW5CR2Nkcmdz?=
 =?utf-8?B?RVhMcndWTHh2VUlsME9QempEM2E4eXY5ZjdxZEhvV3B5a29FOVEwMHZTcTd3?=
 =?utf-8?B?czBRL2ZSNjE0eFF6Y1RnOHlrNmE5S0xoMVJFRDZucVg4Sk8wNFNlT1NEbmFT?=
 =?utf-8?B?a29TTWVYOE02OUdJeGU5ZTBQUGJnMUJ5N0ZOVWxpVWdCZStuQkluNE03d1Z6?=
 =?utf-8?B?Q1pLRE5QMEVYK0xLazJNMXNYTXRZL3dxTHI2L3hYNXNTREx4Ym9ObGlnM05l?=
 =?utf-8?B?V3lYdlAyYTlDMVQzOHdnMXZMd0kvMjl0VzNmcG9rNnRxWlBEMWxHbWFjZlYx?=
 =?utf-8?B?Z0ZLL2taajBBSVVqVXo5VzVrbUY2MU9yZXBVT1dVSkdCZS9KdTBvTFZsSW9I?=
 =?utf-8?B?cDFScUFWRTMzV3pTMEFObGJjdFJCQTZEU3BabVY4VVBYQzBtaGJHaElUVWFF?=
 =?utf-8?B?RmpEenFQK2lvTGVJbDlyQ3pUdVlBYW9xZjFVOHB6ZVRpS3MwUldmNjJJdE5H?=
 =?utf-8?B?V09PSGdCWEVTVytqL01zRGg5d3pQRlVVSy8yVVFMTXBFWEFSVGxWSjZWSXk1?=
 =?utf-8?B?ajNmK0RBR1RXTlNmcHFRL290L2xSUVYyYUNuWGhid2dLblNHV2o3Z1BqSEtY?=
 =?utf-8?B?bDY4YUUzaU5lOVVRVHNkUDdPb04zc3VUZW9RU2h0M0lqMnE5UzRxbm9MT3JC?=
 =?utf-8?B?T09ubmFPRmREYU5MN01haFp1S3IzZXFKN0U2cHE5cHhwaER6ZEZ4T2tKQ3Bm?=
 =?utf-8?B?S1lIbk0wNTZ2eXkwcW5TWU1hRm9ud3pKQ2dOZ3BZeDNZYXA1V0xnT1V1bmF3?=
 =?utf-8?B?VWZLVExHYnZTTW1naitjaHlwZVZTWW1wWmh3b2Y0UFVOeDBjUUhlUUpmV0Uw?=
 =?utf-8?B?UU84S284S0xPckZxcG9vKzBRbWFSYjRuVXo3dGQ5QWJSa01NZnd2WVZaeTMx?=
 =?utf-8?B?MEZIV0dPSW9rUkVlNHlCYXVEVEJ2c0ZZYWFLZ2w0eFlCVnoraVNBTWFyem02?=
 =?utf-8?B?aE9aQnRWRWFTaTl6bW4rM3RrZC95NUJWR3hxRloxV2dHYi96cFI0WEwrNkZh?=
 =?utf-8?B?Rk1FUno0TnNIdTk4emUvTlZVdkRYN29ZcENSL0l1VTN3MVduMDNxVzhKRkQ4?=
 =?utf-8?B?bGt1Qyt4d2JQNC9aODN5RGdWUFBaM2ExZEpxNElqQzVyek9xT1BTb1B5ckZS?=
 =?utf-8?Q?sH3pvbubcTzO7btZx120mgYb5/Bxp67R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRXMDBEKy8rVS82NERpSzdqMG9IQnBFZ2Jac200ZFYrZ0VCeEdpY1lFeEJp?=
 =?utf-8?B?aGhRMk5DaWlrcDRrMTJUeHk2VjJjWDJpVnQ5L2lSOTR6b0gyWkZRWS9UZVpT?=
 =?utf-8?B?aStzRmVlOWhmdHh4Y25uSnJLUEZWMklTZ3NZQk1ENXpQeVd0UG0vTnB0OHg0?=
 =?utf-8?B?bFZtM0VVVDkwdDJ5Zy9haWtyNUt6YXhDbmh3SXJDeGV1NlEraDc2VnN5dE9P?=
 =?utf-8?B?S1VyellhYzZFVE4zMm9SRU10SUlUM0lUd3dFbExiMFhpMlZwMmdFU3JsMXMx?=
 =?utf-8?B?ZjlNQUxDdjNoZU5jNFg2R0ZPMjNlL2RFMlNad09iL00rcDgydDZqcVV3azY4?=
 =?utf-8?B?d3BaRWlDK0Rla2lIVlVvbmJYelg3S3ZHMTdqR2pFOHpka3dKVXhvWkpxMHNE?=
 =?utf-8?B?SHlYT3JmcnZuRERaRWFWK1JtQTBoTEFaSEFWNjM1REZiSDRQSUxtS2tFUlFj?=
 =?utf-8?B?eXZsbml1U1lkNXBXbVpETmtJTlVocm9yQU8rWUt3UW5KNTA2dUhuUk9OYVJR?=
 =?utf-8?B?ZUZvTGhFUWpPMStMZE9xc1h0dkpiWSsyZzVkTUxXNWxYYzcvNzc1cE1zODRi?=
 =?utf-8?B?QXUvbU9BaHQ2Y2N2SmlxcnhhWWpRdTJLU2VndGs2VEtvVHIwUkJXbkJMWWl5?=
 =?utf-8?B?c094aEZUbWZoRVZJVFl6OWxPc2tib2dKZHh2Ti9EZTZMdCtOODhPa0ttd1Qr?=
 =?utf-8?B?NnptWkRXbFJVMGhJL3huNWNOck00UFlnZFROWEd2RG9NRHRNNkRVYU1UZXVU?=
 =?utf-8?B?ZVZORnd1YjBLOE1HdlY0NjhNZVJya0dkTjBabVlrS0pHSEx0V2lJT0Fsc3Fj?=
 =?utf-8?B?cDEveWpsWnNudUs1dnFaTGljUkFwejltKytVaW10RjdQa2pJbnMwZGR6bGh5?=
 =?utf-8?B?SUxSRE9QNkJKcWsrNHE3ZTdIbGE5czIycW9GcmFtanNIRFFsZUE0dmpqTTV2?=
 =?utf-8?B?Qi9KaVFHc2Y5L2FCRGg5eWVUNjFqUUIyN3hIQUl1dC8wMFdJcDVCQ21YMk1P?=
 =?utf-8?B?QUptOHZSVHVYdUozK2piYlV0M2ZlczFRN3pUaGxyTHc0ZVhPdXRST1BlQ3M5?=
 =?utf-8?B?Q0xJczhPR2VaT25lcjh6Q0g1d0tEL1Nqd3FNVGVXOWxhakRMUmlyMXpXU1Z6?=
 =?utf-8?B?TnlaV0p4cTlyNmFoWUEzYjU4WTZLUFFsYWx6M0VhYnRGUFJjNUMvRWtoOUlI?=
 =?utf-8?B?cSs0UjVWQThFdExlYVhVcjJOelY2SWI3aXJGMlhtN2dIbXNSTEJCN2VnZTlF?=
 =?utf-8?B?SEVGOSsyTkFEbnd1ZzFVdFhHTzgvbjRpTzVqNHZBOEtEWlgybzc4U0ZQRy9Y?=
 =?utf-8?B?ckdiTmpTNWJqcU54VGRBbENNL3dDSmxha0V1bkQ4UnJ6aHVDa21Yd0U0bzgy?=
 =?utf-8?B?bXRJYUg4N0U2d2htcit5Y2NORTJncXd5dUdSVXlGZXNxVmMySnNwb2N3Skhx?=
 =?utf-8?B?QkdaK3ArMm5IcGNyUXNYYzE4a0pZdEZpQzVtT3o3cm04ODBtdUs4WUQ0djZQ?=
 =?utf-8?B?NDFNSWV1Zlo2Skp3eVRNMWtRQ0c5YlRuUEFlYmZkeHErNzY4dFlBQ2hFM1Ez?=
 =?utf-8?B?MnRzWUt6YWl3TmNCSnhYaGdLMXlCU1kwL25aY2o2WlVqR2Q5V0lVaEwzOHJi?=
 =?utf-8?B?SkV5dVpvMC9BWkJRc3VhQXQ1MTlTNFZkTVk0QlJjYmpJY2dXQXdnSHIycDZH?=
 =?utf-8?B?d2R3ajZwMnZTTmZqZ0RJNGpwRm9oMTlTeVYvWFcyN2hHOTRiazRwUHRiZkZ6?=
 =?utf-8?B?b1JHa1FUUis1aC8vdHlnTUpyWTFKc1B2R2poU29JUDhoR0NDSkVtQzBFSkxn?=
 =?utf-8?B?eTl3U0ZldUtNRWt1dWpPMzZEUWZqWDU0YXRZTXlIMnJ5SVRDelAxRE1Tdmx2?=
 =?utf-8?B?NDZIQStqUG4wUng1N29IVXV1VzhTRXVhVkNVV0lGRjNnV21UTU56WXYvQ2lS?=
 =?utf-8?B?c0FMVSt2MlZwVE5DNysyUVJZd29EbXN3M0UvWDU4NkdDdjY0bFlRZklsNVlE?=
 =?utf-8?B?OFFWMTVLaDQraWFDZWM4N0xmTHN0UDhUdER0TkVKam0vbXBpODJlK3pHK1l4?=
 =?utf-8?B?b1RGbFM0RE1uRnNaZGM0TjY1UHVvWHBhZDloZ0greTZCNEgyZnIrV1pibGhL?=
 =?utf-8?Q?G14VNFJbSgOeEkR81mvRU8U4A?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8400b142-9944-4f12-429d-08de1646a6af
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:23:03.4790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XslmTNXpdBLiKGP5o0m0COAax5oGPTFqpML4bxNyVwbGerErrStutE9Ol1if+ydkVo3vGL78Lhp59FsOB2WRrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6095
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

On 10/28/25 4:42 AM, Alexandre Courbot wrote:
> On Tue Oct 28, 2025 at 11:39 AM JST, John Hubbard wrote:
> <snip>
>> +        // Now that we know it is something more recent than NV04, use boot42 if we
>> +        // previously determined that boot42 was both valid and relevant, and boot0
>> +        // otherwise.
>> +        let (chipset, major_revision, minor_revision) = if let Some(boot42) = boot42 {
>> +            (
>> +                boot42.chipset()?,
>> +                boot42.major_revision(),
>> +                boot42.minor_revision(),
>> +            )
>> +        } else {
>> +            // Current/older GPU: use BOOT0
>> +            (
>> +                boot0.chipset()?,
>> +                boot0.major_revision(),
>> +                boot0.minor_revision(),
>> +            )
>> +        };
>> +
>>           Ok(Self {
>> -            chipset: boot0.chipset()?,
>> -            major_revision: boot0.major_revision(),
>> -            minor_revision: boot0.minor_revision(),
>> +            chipset,
>> +            major_revision,
>> +            minor_revision,
>>           })
> 
> Can we implement `TryFrom<NV_PMC_BOOT_0> for Spec` (and same for
> `NV_PMC_BOOT_42`)? That way this code can become:
> 
>      boot42.map(Spec::try_from).unwrap_or_else(|| Spec::try_from(boot0))
> 
> (untested ; but hopefully not too incorrect)
> 

OK, interesting technique. I'll do that.

thanks,
John Hubbard
