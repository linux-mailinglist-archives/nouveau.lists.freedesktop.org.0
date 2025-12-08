Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9310ACAC1E8
	for <lists+nouveau@lfdr.de>; Mon, 08 Dec 2025 07:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D13D10E0D7;
	Mon,  8 Dec 2025 06:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SBmqcACx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ACB10E0DF
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 06:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPWgEXZEvscOnN5pT3Xoq/57z46oZLT5OXn2SZ3lQKK8ihdIzTf+c6eoBfNwiiyex8VIEwyYpvFtz4tI4lvbFzjIYr+yUdoyBTQ7omr1CdRrVJKZ1Q1I7flqEwzcSgF7ccf9NQIR6mBzdkH+vShHaZ/6rHFHuOcWZJzLaWgSCS6nuTwe82jSI6oPzLTJs4CUO33BRtjX6b3CGKgdnrqQdOvQEZuR5t3xMjbRsV9n/+AWb/G5cE89rWn6D/tcRE8Zm4G55LOVfFB1+r+C7YiR27kyQOLFIDLz4cthMFiZPF63iCvw2qMWNi7bWmHOkDFlaBc2o4bEUbNYc9FjBpMR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvTvthd5FWkeXDhav1di00NK/fhAPL7rLPPmrjLo6dg=;
 b=TjXC9vpOYBBpT0GIXdBa2udUyAozftgwVbo6hI6KuJO12lxvuVEIOx7kZp7xV/PBqEHQGmcQ6UCvZaT4kUIC4OtRP7NHC223se6fh27y9gVWJxMgomI1QdBMYEkIn5Yvrm35KpYHdw/mKL/rTyy94rT85BRtaKhCpQgWI7NfL3m1gbR5s8iToBedh23cT8FvxwYxar77XrYAffGHeEB+poc/xvqtUqjzBoPyM3qVClHbV8nkApVhwiMlrrqrdOoSg3+yslNWhyPg9XwkpHBSujsOZCm7z/uyo6WCZpdOzyfK44VIu151+18jBM23JhuDbPh3VbuO/nKrq1ws69X1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvTvthd5FWkeXDhav1di00NK/fhAPL7rLPPmrjLo6dg=;
 b=SBmqcACxlVjhbsErFDFZqj7eCZOxnXdDKxuuE8svqNTnyjD89aQJO9kktce9tyr8VJ68M4TMA0rXQhxnTougsQSnive4mEOdu8lAMJQa/hHi0meDrcSnJ7kVOVGlVEKb4trzgygE2+Ir/Kt+AszZUCAzs/WBWXqbONb6d4tL6RdBirZtvmDmDnmtnuyZnUOl2RDHryoL2AAWtU6rS81GyvgmEYXRqAuPGmr+Pm4rTaEY7ZCufweyXuIwpQxZEOhXbQS1GADV0huCWkjB07cVcYHe/XDtEbROn97J32VgD+s40FVFDTk3FBM9JbgzljqrRHFp3olQLQlJTh3uaykN9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:09:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:09:24 +0000
Message-ID: <d9ca3708-8192-4897-9608-33232be14c20@nvidia.com>
Date: Sun, 7 Dec 2025 22:09:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-24-jhubbard@nvidia.com>
 <20251206213614.GA177930@joelbox2>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251206213614.GA177930@joelbox2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0035.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::48) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: 46fddbe4-5c68-4054-a585-08de3620561a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnRHREgrUXBNS0JPQjJ3eFV3VWJ4eXU3QjE5MUVoUHY3Y1FPeUMrSllsTW1x?=
 =?utf-8?B?SndnZGJoekFkZHFMa251eVVzNVNvbytqQmNTZno1NjI4TU1MNjVoUS82K25W?=
 =?utf-8?B?dFlQd3FpZDBoNTREa2FSUXU1SlpYZ1hEYSs2azhEejA4aGN3dWxDVStFOEV1?=
 =?utf-8?B?cWVXWXMvSjJqNjJWUlJMN2svVjgxbiswOHVPQzBTNUtMVzBiS21iRURNdlRi?=
 =?utf-8?B?VUthaVhQZVJwUitOczNPZWhuSUI2ekNrOGZTcnYzZ1U0OHFGVGZCWGR2a01C?=
 =?utf-8?B?a0tzNHBXTTQ5RjRSbU5oOGUxTVpKdDZMSVRSdWZtSFFibkJ4M3ZWN3RUQWxO?=
 =?utf-8?B?SkVVZW42ODNvZlBOa0pnUFJYYWd6T1plS25ZS21WWDB6YVhVazJhMG1jZjJS?=
 =?utf-8?B?K0hzUTgyQVkyN2xiSG9MY3htalV0TE1YbUQvR0tIeVNpTHVWVldWeUlMQVZl?=
 =?utf-8?B?N3g3QlFsUEwzZ2FqcmVjT2NYaFlzbnFiWFI4eU9mME0vSENUYmtpOVc5UUNx?=
 =?utf-8?B?MUl5bWVyM0JGSldEU2hiMTFQYzFmQUZuRTUzclNubldENExCNGdBQ04ySW1l?=
 =?utf-8?B?ZEJWZFJURHV5NEpiNXBPbkt0STBMbm1JSGZzSHdzS3dnMTBBVUNKTVh3YkVQ?=
 =?utf-8?B?UW5sQ3NMYk9xazZ2M1lRcE12UVpWN0hYN2VvWktLZnlNQUNDWml0N1BzcTNo?=
 =?utf-8?B?RXM2RGpnUVdCMk05L3V4dDZxNG1QTXRlM24ycFJpbzlsNE5QYlVsUHJGWEVX?=
 =?utf-8?B?VytNTWYyMG1lMGRvM3U3WEwxNDl2aWx1a0lqZWxVbEFIU1NTYnR0NUd3RlZt?=
 =?utf-8?B?YjNGaUd0bTJzZmdjZEgzejlVK3NFU1RjbWFYL2tJSVNidXJLOHR4NGJrNFlK?=
 =?utf-8?B?b2lqNFRadENBSFA4Y2pJa1YwY1NnTFgrS3dvWmV1SHpSM29qejNlN1YyNm1C?=
 =?utf-8?B?aGNqRjdGTHRSVmJsTE9TcVI3aS85OTMwWnR0RUV5UkZHa2lNQzF2SjBNbDFl?=
 =?utf-8?B?bmF4NGhsa3A2d3lzcEc1T0E0RGJobW84QStWWCsrZnZOYmFTR01PV2s5ZlFF?=
 =?utf-8?B?cUdhMXV3QUVmeDZFV2h1WjVHN0ZuMllpbGdYVVRmZlJ6UnFQUHpwbGw4djBh?=
 =?utf-8?B?UmZMenNYRklhK3ZqVVVDVzhvSmg3czJUSXZhZjl6WTIwKzFwRzBSMm9LM2VU?=
 =?utf-8?B?U3piUGZ5ZlJxNGN3UC9MWEdzSWMvR1NKL3ZhN21uSkt2cGZYVzZ3Mjc2SVpT?=
 =?utf-8?B?TjJKWVpYRzR1dFEzd3JPMHlLdDBTZ1pBUEc5VFRZUGRlWXUrbFd6cE5SREhM?=
 =?utf-8?B?Nm5kdDZvUmZ0eU01K0FLSWdpWExQNXJ1cmZvR1krN3U5N2ROSVdFb2FBdHpP?=
 =?utf-8?B?VmF5UWxwVGxYdGN0d2MxZWJUZVF3dlhCUzZtSFBnemZuRjJXVXFiODViMjc3?=
 =?utf-8?B?dElZR2RFT2IvSHcvQ0EwZnRuZTY1aWlpS2tXRWp6ZXl4VlhQVEZnT3pXTXlk?=
 =?utf-8?B?TFBsM0R1Rm80WkZvZ2RMRDA3UHRTTzlIUi9KNDVkUVY0NWZya3hEbGN3dzkr?=
 =?utf-8?B?ZUlva1p4THhLUkptT3cwaGd1YUx4OEM2eW82eEFBV1JFemRWM290aW5BeFd2?=
 =?utf-8?B?VTNZUGpQSWJDWXdjOGhETXFlOUdsZTFaN0w0WjV5c2V4V0szWkN1blFBTlFx?=
 =?utf-8?B?dk41TTRROHVUWEFQZlpMbkJtcldkbU1ENy9zQzNMd3hYWFVsVmZlSnUxdm1T?=
 =?utf-8?B?cGRCR1JIaS9BcUZtTW5aTUFTV01KY0tMVVVEM3BNQUY5T3EzRUc4amVMbUln?=
 =?utf-8?B?VEp4bDBzelZnRnRVVVkzRWpmQWorMUxmRno5dTQ3Rk5nQVZ4MmVsRDYvOHhU?=
 =?utf-8?B?cHlmbDRXaEVtdW1CdEtKd2EreGxaQ2FwVTdKcXBWTGpNeHRhZ1p3dS9kZ0VY?=
 =?utf-8?Q?S3TLgnJ4MSEGw+pN/axk+tVgLHnUZZ3j?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzlON3VkeXpES3hlWWppblJmazQwMG5JYlNsNG5xckxzSGxzYmx5WWt2TWMy?=
 =?utf-8?B?dWpPTjZMbEwyZ2FFL1lVZ0VVQWQ3WmVubTFERUV6dFpoVzNoK2pSNFdsbmlU?=
 =?utf-8?B?SmxzWEt3eDNMSVB3U0RGM1o0ODExR1dONmpFN2RrZzltbUsxTWorWERYeEJk?=
 =?utf-8?B?UTJ1WkptaUJYSjYvWXFKNUNFcUIwRFBrT3VlSFBpTFBLUHZHemMvcjVYb2sy?=
 =?utf-8?B?anBscG1vYUpYNkRwN3JZWWdVblNoZlJ4ZEFTcGJCV21pUWhacHdqT0NEVGo2?=
 =?utf-8?B?TExyZGJwWS9FUy9uQ0hQOE00UnpjUVpsTTlrRmsvQVNzbGRUdmNsUnhWeFMy?=
 =?utf-8?B?akdHdGNTYms3Qll6MEsyOFZyUEtxamxJUDI1MGRrTlhIQ2o0TjRydXpMUkRp?=
 =?utf-8?B?S3lGN2p3R0hEVUtzeDdHZk5CU2RGY2MwSHF1cXZKREQ3ZnRrekwrYitodGli?=
 =?utf-8?B?SkFiVGZsbDJYc2J5YVlVN2hucDlnZEpLRWF3NmRLVXlUQ25LZG9rTlJObDVZ?=
 =?utf-8?B?QjRoVWR2SVVIaWdYSWdoaFVrVGs5aDVqQ3N5bFJhNVRKMmVhR3ZYYWxOcXVN?=
 =?utf-8?B?amVmekNqVGhLSGh0aDZoZG1Rd3NXaHVyQ0VSZndCQ2ZFWGhicVF0cGZwSzFR?=
 =?utf-8?B?VmtyTVh3eHljZlR2SkF0a2NNd3ROcVlxQUc2dFdBL1VWbXRIcHE4SVRRUXdi?=
 =?utf-8?B?T1FzSHUvVHM5bkVUSENjY0VJWHJ5RENXYWgvZHg0TUlpeHFpOXpHRUxwY3kx?=
 =?utf-8?B?aHhoRVgxL0JCclU1MFFiekpTOEVJVHpEQk5NRHJlUmwvb2NuR0xsNnVwVmt0?=
 =?utf-8?B?OGVyV0w0L05VV29Nc08wM3JZcC9WcGtUTThMOHorVHpsQzZLL0pkaDFGYm1j?=
 =?utf-8?B?WHhJRDNXQ3YvMENqVXdsSzgxcUN6UmV4SHBWVDFTcUxHU0d3bVBYYmI4UUlr?=
 =?utf-8?B?Mm4xTnY3RjNOUXFoOWVpYndkZmxjMkZmMDJvWElQdE14QytjT3FtMWtlVWRm?=
 =?utf-8?B?L3lMUy94akIvWmMyQS9nUDV0SG5jb3h1MjV2ZFlkRHI1R25qQlVtS2Q3bUp0?=
 =?utf-8?B?dEVFaHRmMU9LZXVLSmk0MTQ3eUVManRIS3lBMTIreXkxR2NlSHZjaFI1QXZP?=
 =?utf-8?B?Q0xOY2Z4eGpNT2JtdE5LNEIwM1F0MlhhYW5jVjR4eVh4VlQ0NWx2WVlXeXdF?=
 =?utf-8?B?UVE2UkdHeFVFNk9OUmpudUhMMmNReXduVUlNNVQ5WG9SVUNUekxYN3NrTFFI?=
 =?utf-8?B?Q0FWelp1YjNHUFIrcy9zWGpEZzMrZTVRczV2WkR3MFRvV21pcUt1MjFFUWRD?=
 =?utf-8?B?Q2JNbXhxQ1RNVzh4QmRDaHFTaS80bkV1RXFZbjBFOFp0TmkvSVNpaldud0JH?=
 =?utf-8?B?NzliOURxbEk3VUtFaGNpeWFLZWlZKzZnTkRNM0Q2ZC9VbFJBR0t1RE5YTkE3?=
 =?utf-8?B?T3F0d0JyNTRMU2JsWDd6Nm1oRFg5eDZwQ1hvL0U4ZzZEVUtjTnJyU3NIdHIx?=
 =?utf-8?B?UHlJSVQ1U0xrS21GSW5ZRHJaTWtwQ3dEMjB0MFExcTI0MHB6VGFSdVhCSGlL?=
 =?utf-8?B?R3FjdU81dkhIaU1MQ0ZmWmV0emRuUDRTdW10OUJSU0pxampiNUNoTml6clNK?=
 =?utf-8?B?aTYwcU9vQjBOVHFVMVgxRDBPUVlkalVvVE9nNVg2RjhJTUtLRWZNalkwUDd4?=
 =?utf-8?B?RzJLbGFzR0ZKMzhQQmRnTGxGYU5OVXFyS25jMzJlN1pOaWJRbnZCRDVrU0k4?=
 =?utf-8?B?Zy9UWFBvQlhqcWFyVklQYXlhdWxhd0NKb3ZTMVJkb0Vuenk1d3VVVU1keTJF?=
 =?utf-8?B?SVdIVUZPRVNUei9QWDNrOFlFZGlZY0VzWkc2Y2lLMUcxY203V0RrMDlkZzcz?=
 =?utf-8?B?TDJLdVlNU01wMEl6U0toY1o1Q3Y1Z3RMQmtNOVovZHJpdGM3dndkNkg3Vkd0?=
 =?utf-8?B?QW5RVm9CaG1kOEM3ZmRiaWpUZUNBTUExRGZTTVpwcEFlSEdtdnpRdUlMVWpz?=
 =?utf-8?B?K2lYaytEMDc2RHJUSHBSaDBZdnRRenJ0V0VUdVI5cGJQT1JSbmxZenkwTjhQ?=
 =?utf-8?B?a1pjSm14ZDdKT0ZlNlZkZmNTU0tUZ3JKd3B3V2JVTjBSSFJWdGJNeWlZeXEy?=
 =?utf-8?B?SWswaVVlaHZmK0F3ZnRBTkhPdWRJR0hFbGhXWjF5OHp5WEh6U1FRRmNodFBS?=
 =?utf-8?Q?8PxXP2vwFU9Ge7Uh5uoi5WU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46fddbe4-5c68-4054-a585-08de3620561a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:09:24.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZGKkNjFvS53WmLZnuF3DqZlbA8wyJEk8J/3nKcKZLoaiOy/G4Fi+GmX/u+qhAkPsuYpjstToKWucKbi0DYqmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
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

On 12/6/25 1:36 PM, Joel Fernandes wrote:
> On Tue, Dec 02, 2025 at 09:59:15PM -0800, John Hubbard wrote:
...
>> +/// FSP Chain of Trust (COT) version for Blackwell.
>> +/// GB202 uses version 2 (not 1 like GH100)
>> +const FSP_COT_VERSION: u16 = 2;
> 
> the comment says that Hopper needs this to be version 1 so how does this
> series boot on Hopper? maybe we need to add a new function to return a
> different version number for Hopper versus Blackwell?

That's correct. And the signature size is also different between
them, I'll fix that up too.

I'll work on getting the Hopper testing done, to shake out any
other issues.

> 
> edit: I just noticed in the cover letter that you mentioned this is tested
> only on Blackwell. I think perhaps we should drop the claim that the series
> works on hopper in the patches / cover letter.
> 
Yes, the cover letter mentions not tested on Hopper, because it
hasn't been. I don't recall any hard claims that it works on Hopper,
only that "support" has been added (code complete, not tested).

But hopefully I'll get a Hopper test run finished soon, to fortify
the v2 posting of this series.

thanks,
-- 
John Hubbard

