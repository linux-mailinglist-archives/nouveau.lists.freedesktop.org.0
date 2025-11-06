Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C55C3D95C
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 23:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D977610E9E0;
	Thu,  6 Nov 2025 22:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L9iAsdop";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012028.outbound.protection.outlook.com [40.107.209.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2848710E5A6
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 22:24:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NhnC0Jurjg1CyHtMLDMIP903wupvLryHInc6ytJ0QS6EfU/8e3lOqenyIY1GYcCG5qo24a4NR0DPOHwoLeSLeA+V6YdskkF7ldG6HEXah28CTLSO0C2eb9+TxfzpEL9WWGt5LPOCjezU7sk6E0qr0LTx1UwDRw8asfruv+l5H6432J60Dm+Y00XtCHN5SIPq3ysVPjNysh/s1WH3qJ2VDo1wut0lf0rzicXKU/4UuKwlc6bRTawE1Tyb+6vvXDZQlHboGhMrs1GxrF5VYcoDzvK36qTfdg2zkfHg6t31V4VN+07rAgbxBcsLz4EuV7HCVkHuLB/p3d/58FO6DaCFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzeTwDjwDr4r0WqLOBoINzqSPJ1kciFSze0gh03xkbo=;
 b=nHxghN4EoYNpfapHW13peO0IymmhMxSfzxGuY7bBL+/PDjZMPUpu9J3F5xSD/2N8T8zNUAAarakWaWBfjkLzuZl0PoBwV1B14uzeVtJl1l1zVdkaz3AoP0/3D0s+VfE9IDwodT72ip02w30PgzACOGrKf9SoN/73PFo9XbF4U5dA0qSHY52D5eEoQ5Fq1C3AwDdRHr4UOhnZ0MaAOFWOTGDnlzlDJeyOKJXyM3Xsz0il+E3wWHTo7clDcQcfys/xaB6P3FYGlLaNrViJ0Hg+lDZjiY4BabNyeZ/YmcDotmczRIxlaUvg2gQDR4vJ8fXZGSzLTRP4btloG0FyeNmHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzeTwDjwDr4r0WqLOBoINzqSPJ1kciFSze0gh03xkbo=;
 b=L9iAsdopYzHXZQg5LoEqOAlSQlXn6lK++LzLD3xIDqVRBFziuPv/Cy/PMnZFNntoTJc1xFLfpQSqJCK68KaeR9iKkmOE8ww6pvMMaMeR0LHMQUJyeftqv1MD2shPxbrWKFE+EoVmk0kWDjpnOLxglnLAzMdUcaV4t7GyF+JhiDoznwyiQ89zSY+DSWhd77Sa74p1AfNlYtkQLIwXi+kPe43GzKyQKt+oEpUw3qszstVvRuGGxhygl70ek3dFBx1JEAjMWB2bd566acjkZ+Xf5BqLwHM1XFs/iBrCNjRrpfJYY+lIsfhGeT3zruwItnzEWW4hmyUwBPYBOXVqLXQiSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN2PR12MB4062.namprd12.prod.outlook.com (2603:10b6:208:1d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 22:24:31 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 22:24:31 +0000
Message-ID: <29656806-3759-4e81-8c0e-d0bbb0f6db9f@nvidia.com>
Date: Thu, 6 Nov 2025 14:23:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] gpu: nova-core: regs.rs: clean up chipset(),
 architecture()
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
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-6-jhubbard@nvidia.com>
 <76dee3d0589b7747c9e60fd802aae008f2389c8b.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <76dee3d0589b7747c9e60fd802aae008f2389c8b.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN2PR12MB4062:EE_
X-MS-Office365-Filtering-Correlation-Id: ace2ed11-0e24-4c3e-e0d8-08de1d834157
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmNVRm1tVEZINC9OdnYwY2ltUWhIOGpHZW8vQnJOY09sMHpkQTUwM2pkd3Vp?=
 =?utf-8?B?Q1J5WmJqSWhDRXlSMlNkS3F5eGJGdUlsek5Ucmhiazg1bk5sRFpDbFZuVXFh?=
 =?utf-8?B?cCtvVTFxZDdaL2dYdExHUWlhNjJNd045YkxFOWh4aG5PRVpvc2tneWtpSXZp?=
 =?utf-8?B?Z09Xbkt4a3RaUzdRMEJPR2xiampHekFqWktDTjRmY21iR3dsaWYyVVhTSUY3?=
 =?utf-8?B?Q1FUbmdUQ1NxOTVhTUZWY21oWGd2aXNQSHlRS2xweDhncUZYSWtJQnBmTlRM?=
 =?utf-8?B?dk1FSXhQNkJMQTJhcDJqZWxDN0FoUVl2OWR6cVhlcFc5REVrSWlmMEU5dVhz?=
 =?utf-8?B?cjVFMmtDUkJ5ZVYxQm8xV3dnNWhqclc2RWlKd0dLQ1ZwMXRoZDVSZGJudUg0?=
 =?utf-8?B?bG9QWnRwcWI5SWFmOHhLaStYQnJ4cmdvZXBLL3ZPV0FzRFBKeVExeXZkREpk?=
 =?utf-8?B?eUM1cGtuWjhUTnRjTk9MTzVQaEN2QjV6OS9DZG9WWFp4MWpYRU4rL0piVFkw?=
 =?utf-8?B?Sm9jL29kZ3BNVGR4OEh5OUFJOVJ3RkQyWVozdDJFMGZ2eE4weHY0V0V0K0d5?=
 =?utf-8?B?RmRDSFRSRWVFMWY0ME03VnBjM3Z2NDRUT2w4WDR6eDN0R0s3dS9IT0F6dFBj?=
 =?utf-8?B?UmQwNDYyRm95U0p5K3g4VzZQTCtwdEJ1Q0FGS0lFK1ArVUxpdCtLdXJkYktV?=
 =?utf-8?B?eWwzV3h2Q0o0cFNVQXFZdlhEUEZna2x5Vk1ONTluVkNvVEQvYmVtVTlZNkFV?=
 =?utf-8?B?T2lwTUpRSlRvVEVWdmM1NUwyRTkrMVJISFE2RUwwMU8wMkhPeElTQ1NZTzJh?=
 =?utf-8?B?ckZRRVVrT21RV1ZHWlhPZVJRaG93dGNIMGRXMGF0aTI0ZEgyeTNXSnRMRHhH?=
 =?utf-8?B?YnRxamljY0tweEpiaWZFYUNJcENPckxUN1lQUnRUMmg5dldJeVdVSXU0V1NN?=
 =?utf-8?B?NWtMNS9rU2JJZHQvTVNvbUU3clRPb2lacHVkN211MVVLa3BSWm5YbExZYy9N?=
 =?utf-8?B?R2J3ZHB6cGs2K3BreFE5ajAxbXF0WjQxMHNhTTBnRXNERU1RYVlzc211Vm1n?=
 =?utf-8?B?Z1FyaWhFRmRIUUFhN04wYnVWR050SDRST01TNTYrTjBxUGEzMGNMMjZrZWVv?=
 =?utf-8?B?TzNCb0FwZUx5aTRpaGUvSHF3N29BWnNwc1pxY3QzSUNJdC9xVFVUdUNNUjJW?=
 =?utf-8?B?dk5ZMm1QYVk4NWdDZGlIQU5LUVAwanVyb3hKcnlvQm1SeXhyeGVZREtGUXRM?=
 =?utf-8?B?NVYxakgrZEprc0N3MWZwSHVUVzR5MUNvT1d2aDZkTFl2ekMwdDJRQWZlUnFi?=
 =?utf-8?B?b2JNRVhzbG83NTN4cG9WVzg0TnkxM09lWlFleUZRRmFCVnl3d0pwbGI3TDE0?=
 =?utf-8?B?NzZ3NVYvQVN6LzFGRFZROTkyelNZUS9nYjNBcVFUeC8vR0F2cHBDaTJmM1lL?=
 =?utf-8?B?dDU5eE1FTEQvRHdneXVXY2tTOG9sQ0pLMXRQZUdpaElyR1ZubndFMGN4TGpl?=
 =?utf-8?B?M0tsQ1BiMDF4OFlUZENTbmVvWWhWNFUxOVBXZVNwMm9hRWtqTU9aZUpSaXkw?=
 =?utf-8?B?ek14QXR1SlU2c3ROTmd2MkIrTXp2M1d0dzJ4dEFoRWZnT1pnNTF6SkxFTXBp?=
 =?utf-8?B?VzZDUE9EL280NlNHWEVjYTZEcEpUT1FOVFY0QmdEK2oyeTZta1RQZlV3cXh1?=
 =?utf-8?B?T2FwaXZKN2VMb3dJdHcxOVZscXh6OXJiQmJyb1pQSDJOQVcrcXArWGMzb3hh?=
 =?utf-8?B?NXdJSGtyTWJheWdZQkZHTCszdW1jTy9JUSsrV2t0SksraG1TMDZSVG1UOXdD?=
 =?utf-8?B?R0FZaTNPUGRHd3NnV2k1aGZNeHdGSVJTbzd3MGRoa0JVWWJyV1hWS2QvNHRI?=
 =?utf-8?B?U2FzbW12QVNlbnQ3TVNIdk50ZEg4dVZuZW94bW1MZ29WOGgvNC9uVUpUYTZW?=
 =?utf-8?Q?74Lshswo/Qa28EKCzFcLa1HdfrUTZlaM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGxDSHZVY1Q0Q2JrWUlISE1TSjFsejdmYjZkSnpiSS93T3NJVitTN3h4eXNv?=
 =?utf-8?B?dExndXBSWkxhWFI1cmg4b0ViQmQ0T2dnS0xDVUVOYlBwNkVBTlFzdGNIWkVl?=
 =?utf-8?B?Vy9aME1uWmVZMHBYTEdTRlZFblVQeXhBS2tUek01ZFRRRTB5ditISnFieVFz?=
 =?utf-8?B?WldZVHVpWk5wT2tjellmNlRQd29xYk5HR1gvU1lLUmtFLzJmQ3ZPcVh4bVYx?=
 =?utf-8?B?aDhkaVpYOWdJWHVyWDg0TVJHaFozRFB0dTdsekhxcWMwbnIyNytjdk1QWTJM?=
 =?utf-8?B?bUJMUnM3Zk5QMzJGTTdrbjl1ejJjeVZiSXRXeVF4bWxGemJmbWdSVGc4MGRx?=
 =?utf-8?B?QnJ1S2EwcVAyUGMxNDJXRHlFRUxPVEtoc3Y2dHdFWlV4cFFuSlRXVnZnQVJx?=
 =?utf-8?B?K1BoRXJ4RzlGbVBGcytiWEJkYU5tWE9UVjlDUXFMME5GOGRBaVZ1QnhmNmhx?=
 =?utf-8?B?YzJaVzkzN0FZSHdaNmRhVlFtSmtNK1hycTR6M0l0Q2xCUzl3RmhTWElZelZT?=
 =?utf-8?B?QWljSy9lV3R6Zk1iWUkyTDVFd1M1TVE4b0JMTWFkVHcwVmFycXFkQjJLVkNO?=
 =?utf-8?B?aGU4NkpYaWs2blFLdjQ3dW1BejYyWE9IN0cvQUV0SUZ2WXVXcDRnYlJLNGxk?=
 =?utf-8?B?akhQclZnMnNXeFI2dVcwSmxMQlQzWHpoSmZkN2M4OVhueTN0YmNKWmdWbnJk?=
 =?utf-8?B?YnZFZVBHN0RSckN0ekZwUFRFN1ZKcHh5dFUvQVlJSS84T1pVSFNjVHg0MUdZ?=
 =?utf-8?B?YS8zdSsvbkJ0cVA3eXFldnN6SGlZRkJFc3kwNXU2UE1ER0w1Ym51Q2FMcmZJ?=
 =?utf-8?B?aDB1YkpJOEVpOGdPeEUzNmF4NEVLZzAzUEtSRHRIQUxlbUErcEhZYmZYelZC?=
 =?utf-8?B?YllaL2tFdnRGc3ZwZmJlbEF5S0FxaUFqeXlWRDd0Y2FNUGRiZnRCbGNmK2pN?=
 =?utf-8?B?ZHNBdUp0bkkwRW9uNXVqeG5kaXpZSWxXMTQ2VGxhRkdDRkNGVElCK3grcWFx?=
 =?utf-8?B?cWFLN1crcm5uekoxU1hyNUM4ZHdFZUNQUDRXRkx6YmJRUmxLR1lMbkRFUnhL?=
 =?utf-8?B?RWFHaDkrVkE2VDJTemVqei9QOS9rVFVGbWI0Vmp5SlJnVnY0SVJKVXJQU04x?=
 =?utf-8?B?cEVabk81Uk5NTExUeE1EUGM1UnBvRlRRL001dy85UmlVS05HdHlOY1MyQjlW?=
 =?utf-8?B?NkhUQXlmbUxqa0FtVHRHN01XbW1aeFJ0dDk0OTNyUURob2dVOUQ5NGZaalE2?=
 =?utf-8?B?TjNnQ1IzUWNSMjd5bU9PNVNJUy9XRThUTyt0WVI2UTEweCtvU2laaHJsZTJE?=
 =?utf-8?B?bHRpb2I1anpGVXd3MmJ4OFRZaENyTE9xQkovM3ArVlgxa0hGRTVaQkZjWXNL?=
 =?utf-8?B?a3VLaXlvdFpZOGpFMFRVUTduZkRBUDFyaCtXMU85THN1RnBMSVFXdzVMK1JM?=
 =?utf-8?B?cC9vaGRnbVpRV2xFRjhzQzYvSTBDQXZLMDNkMnUrUDJZQ1BnSTRTVlJhVWJV?=
 =?utf-8?B?ak1HOHFQb1U3RFZlbHpFOEcrYytGeHhtRjB6MDhyZ2JmekVPb2pZSGg4MHFh?=
 =?utf-8?B?NndpSDFOZEFtT1lYaWRZejArOEJSSCtuNFNuTkFoakNmREJaQUpHUmwveWZy?=
 =?utf-8?B?QXVTK0JjS29aSVMweUV2dDM4djhhbkRmcVFNY1NIQWZpeG03cDFaNTFSc0pl?=
 =?utf-8?B?TGsvMHg3REY4bmVYYjlqZUJCSS9rRHg1TU5tbG9lUzFUazk5OGlZRnNFQlFH?=
 =?utf-8?B?UVVpeHI2MFdiRHI2ME5rdGQ4ZUdQK1I0NFYxMnlIMmRJL0FGQU5kM0ZReUdD?=
 =?utf-8?B?bERrQkphVTc0Q0hBK0VOb3BnTWlqWTZ4VnNaZXRzSW1zRldUNmxkaVZ2NjVM?=
 =?utf-8?B?Uys0RXZzMDNKZy9Qb0tMN3NEN1FjZ3JQTHFFQkxyYTNHTEQ2TGdMUHdLVnZl?=
 =?utf-8?B?TWJqUFVlYjEyVEVtYVBVSnhjN1hjcGNtZ21EUnBWUlk1TThTYmRlNHN1aThE?=
 =?utf-8?B?SUd6MXhmbGszd0FxVUlJektMVGFpRXUvd0tQT1AyOVFuZHM2YlYvM2RYYWpm?=
 =?utf-8?B?L1BYM2l1WENhVkd3cGVBb3VDN0tGcldxcTZwdTVHbEQ1R0FnMDBEaHY2R1ZD?=
 =?utf-8?Q?Aa2Dh/iAwUkpPocRceRRDuuta?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace2ed11-0e24-4c3e-e0d8-08de1d834157
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 22:24:30.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4UWE7o08a8g1d28TbJaF1NnPhJwWuhcdf1YN8sn2dXlgQye5hWtLiL4ai/cz8+VdUGBMI6ebYRN4Vs3L8CD3+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4062
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

On 11/6/25 6:39 AM, Timur Tabi wrote:
> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
>>   }
>> -
>>   register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture information" {
> 
> Did you intend to delete this blank line?

Nope. :)


thanks,
John Hubbard
