Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE87C3E64D
	for <lists+nouveau@lfdr.de>; Fri, 07 Nov 2025 04:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9810010E18E;
	Fri,  7 Nov 2025 03:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qKdhV7GV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3984010E18E;
 Fri,  7 Nov 2025 03:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEII5gNcyGAfN7hyQkum+6vSgDaFJz2bNGIOY274+rnHwTjDXEKTwHNncc/UgxPI8B1RnqGeWBUbyEe3GXjc7eE2SOb5zVBaTourZhxXL2gXyZ1yzb7qt4sfMrEx5GWTcHiWaWyby4a/Lc4EquCBDy/bUW+cu0RQdkb3gGqoNgGJjuRz0gS5hxqqpTfA7EiZP0zPQAO6KKRWR0vZBVreY4/vhIRaOLhLduiK5c85eXHtwLfIYtfCWpg0DsCVL+KFVYmRlusdhlX+IYJGoVGNKguvydsaq+Ysk0ogld6ugbDurhZC0+OXaY0waRh0Qc04WZV3YdVKwT3ZNtkYes/0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wth6JPuz124Rp28+RyJvMNVD/MMk9ghUoWieAt+GM+I=;
 b=pcG816BVqlbKXLZzf7aKE3YzFt/HRrSyOwf1tHXDxP+F7y4DsPPb1BepqPY5ly4bonYe/c/nQGV/gdJ8G9j4as3kIBQkyhS84QsKKoDYG/wkbGyPKKEiUMmPSgXmHaEtlfv6qqAJFs+vILLzPtCEWc0Hc/6HjmSK3ZHGdgpQa3V3IgQNakncRhvIcw9x5K7mJD+mlt7rQdgxjKmp9MpS7m8ac1uqKRDcV3LtYqlzXdXk6SlhGTW9YxJIdveCpqCWBeobfWIzYK1oV2sYj2TvYcLT1UVDCKp1Y1/hi3uIFCTxnckBib5r5VZz2976grngSGb3Gn6CClE1uPjalP9cAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wth6JPuz124Rp28+RyJvMNVD/MMk9ghUoWieAt+GM+I=;
 b=qKdhV7GVQLMOZazufFRp1EKH+wcCfUCRhZAOm/YHzIs/vNHLmgHgffEXmrBtrWvyQmGE/L7YffwE5ygdokYqpr2S59i4gsqOOT2lQ1RFB3q/N+dIHDwNRQv1hMoSvMtrjEinBWVAs9w375AKNjVaSMwhpHpHKQ/ADEHkbF+wR/xDPqksZatByRb4LyQUw9S90in8lZXaDqGfFF0pomAY2lVMN3C91JVJfkpVul9N37ea7zhYe/q0HEIJZs+1agWYadVeyVzlh2x2XvLYsnNVhsuju6pduHarnW8j5SKTlDIj8xdHGAHzTp1QmHy8SWZ2X3C+2KF1cgGylG3Dby8ZQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 03:49:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 03:49:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Nov 2025 12:49:34 +0900
Message-Id: <DE25MQ4SPYQ1.2BGMVJ0GKWRNX@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] gpu: nova-core: apply the one "use" item per line policy
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251107021006.434109-1-jhubbard@nvidia.com>
In-Reply-To: <20251107021006.434109-1-jhubbard@nvidia.com>
X-ClientProxiedBy: OSTP286CA0109.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:225::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 10477ef5-1f0a-4470-e999-08de1db0acbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmdRUTBlcUJ1WXZSeXk0RzQ0UlFXMzdWZWxBTGw5ZGt3MmlHMW5RZGg1Mmpm?=
 =?utf-8?B?Zy83NzdLZitSbTNpM1YrOHNkR3gvS0poMmpIaytCTGlINm0za3NQMHNPU20y?=
 =?utf-8?B?VFBFaGlTR0VEOVdoSS83RzBkbXkzSFdGMm9oVmJBMm9raUtEVWlOVEtsbWhL?=
 =?utf-8?B?MCt6WEh0NllpajJWSzlXc3F5emVXQ2RhYmlCZjNQaGxNY3hFaDRPKzlvS3hw?=
 =?utf-8?B?a1JkbE40QUx6N2JKQXBEakFRRU5COE1NbDd6cm8xclRkcjhEMEtEb1lXQ3ZB?=
 =?utf-8?B?Q2Fra2ZPcU15UnExZlVXUDlRbi9JeGxWNDZYRHExNFB2Rm9CU2VtOURvNXEx?=
 =?utf-8?B?dXVCTGFqc2xrNXdJWXhnNklnQ0ZJVUEvSHBKU1I0Y2RvVm5GanJ0MEE3VVZv?=
 =?utf-8?B?UEkyRjUxTnZlbCtnZ3VhaW5Jcmw2U2prZDhuSzA2ejhZYzZuK2Fid0laZW9t?=
 =?utf-8?B?NkowN2hJS1J0OTJMaXpsRkFydHI1ZU5yK3gzbkVZR2ZvWDFLeUprcmlRdUtU?=
 =?utf-8?B?aEZBV0QwR1dKcDl3cTBKRUhkVU5zTE1KV1k5ZHBkakFobGExeUdMTmtHQk8r?=
 =?utf-8?B?UDRrUUNpMGJrREt4WDZPVmdTSm5JdzdJeUpFWmNNNE8yVy9sRGlEckZPSmcr?=
 =?utf-8?B?N1JYV1hrbFVUc3B4Q3RwM2MwSC9iSXhiUUNjMmNGYWZMdzVwV05qaVlKRU8x?=
 =?utf-8?B?dWdxRUM2WEY3MTVPVUY4TEtTMXFHQ2JQV0NPMU13ZWliR0NubmhxT1RRWGNQ?=
 =?utf-8?B?MFlTTEdyazJxcVBkbGpZRG9paTE1UDlrOWZXS09uVktpd09HZ3puTGJjM3A2?=
 =?utf-8?B?aHg2NVdyNS9NZjBnYitnOEFCTFZsaW01Z3lnTlBWUW54UVFFZnQxdk5oVlgz?=
 =?utf-8?B?WFpjM3hhcWFIeFkrejZkTzZDN1VWaUd6S2FLOCs2WGUvbUZiZWZrQU8xSlpK?=
 =?utf-8?B?Zy85SjFEMFZDc0NXdEN6eEdtUm5vdUgyQklVcGw5cDFLaU1XaFRUNWtlSVRi?=
 =?utf-8?B?K2RkRlpmUlUvbmY2dDVJeXp2dzE4YmVwQnpPVEFndDJ3VnQ4RVMzVkpheU8v?=
 =?utf-8?B?cUxQS1ZiRHE0ZXA4UFVjMGE5NHhyVTU0RWNjYWlvRUFBVUpJUm90RUZJUk54?=
 =?utf-8?B?UFQ5OTVPRUxHQ3pZelRBeFphM1JRbUU1NkRCditldHI4VHFFU2VTT2tqU25h?=
 =?utf-8?B?RThGWXZ1QjVIVWxZQ292L0YrbkdLMnZWU3k2eXNwL1BiOXc1RzZvREVIWXcz?=
 =?utf-8?B?ZkdvWXBhWlM3b0lZMHZqNnYrR1hwdG9KTUNoYUljUVhNY2s1cTBaWjR1M213?=
 =?utf-8?B?SlpHY1R2c1VLaHJWRjVhK2t5U25rVGRjaVQ2aHRxeDVLRUJITmVndXdMRGxz?=
 =?utf-8?B?NjZpbmhnWkhzME9DWE5xRkdHZWVNRUk5TEJ1eUVXd2tsS0N6cForYnZYMTdw?=
 =?utf-8?B?MTVVZ1N4T2NwMHpHcEJIRDVEKy90djYrRmFlN1NWM3hzYUdoUElEbnlJRWQv?=
 =?utf-8?B?a2VoTHRCOUIyaDRodGdvNXN0dXpHamE1QytXRENiVCtkZHJycmVsbXEvby9s?=
 =?utf-8?B?NFFuU2VXK3l4dVhRWXhpaWp0eFU5RGlDVGw5a0JTVGIySUFzOUFEMmFPaVlW?=
 =?utf-8?B?RHRCLzQrSGRRRmtCOXJOeTd0L2lhSzZlVnFYYXNETFEyWSszd2hVZFdwUkVX?=
 =?utf-8?B?ZEw1cm9Oc0ppSXc4MGlQRUUremJvdnpPT0M4MVNtYUNScVJFa1k4blJtNTJS?=
 =?utf-8?B?ZzkyTEdCWVh2R0JLS2hHc3ZEMCtwWEZNWE1VZUZ0WUhKNlJZL2oxRmRNRWdD?=
 =?utf-8?B?Z1BuOEVyWWhLL3Zla2ZodzhhY2pZQWt2WUpEMFo3VXM0NUtKczhPMU1uR3h4?=
 =?utf-8?B?dEgwRUhOT1NDV1BjWFRnVmpESy9RcWRPMlhOanRKQTBXaFQ2TTFzNjJ6QVRB?=
 =?utf-8?B?dGxxQmF6T2hIVDBvS3AzWHZnK1NMakNZRmE4VTNmRmpQZ09xa2FjclhoaC9t?=
 =?utf-8?B?elIyVzc5VWdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUorL1FFZGRQVDFpenYwTHMwKzRUaGt6NG82aG8venFIQ1VOdXlSNWZLZ2tO?=
 =?utf-8?B?S0ZtWGhsb29mTnZQY1R1cnQvdjU3SGE3aG92bmU3akc4WUJZaVJ1Y25sc2Zh?=
 =?utf-8?B?cWJXbFI2MzNZZ2RpdnlCSHBmZkszdjdXSlVOLzZuRm5KeisyV3Z6UkJEU2ta?=
 =?utf-8?B?WnpFa0ZDNDdMR1hhamUwVVM1NFdUK0hWYkJqYWxwVXdQcml5SnVSNFphWUZa?=
 =?utf-8?B?THRTNDRCZGJxdEpPcFFUZkdPdER3YjlhSEtmUTRjTE4xbVFObnpZZzljaXdp?=
 =?utf-8?B?cWhSN0hieTVpY1owNFZwRFNGYVdRVUpUVmdHTndnSU9mc1FScnJSWlF1UGlo?=
 =?utf-8?B?eEgvOE45TnFBUWNvd1hlcFErWElGd2g0ZzZPT2V0WGlJZGZOUXJFaG1pQmth?=
 =?utf-8?B?RGh6alYyQjdWblBhQXRCY1ZhQmN0eGdwdWZFMzFWeGExY2N6Rncxc1F1Z3R1?=
 =?utf-8?B?MUcyRU5IZFM1WnZCQ0ZSRVQxWmdMblFxUUJDTWc5R1dKTlQrMlJsSEhPRndv?=
 =?utf-8?B?TURLc2JyaHVnSlZVc3hPWS9tMEl6YlEzWmFXam1yT1VSOXlxeDBEaXVhTGFm?=
 =?utf-8?B?Wms4ZjVtbngzRThKZitBbENsc3BMUm9TWGdnMGNjT3dzMEVUcEw1ZUlFR3Fv?=
 =?utf-8?B?QVk4bzVlMkQvbEx4dy9lM0NnenRVMWI4OEdTVGNNMmttTWpucmRCQ3AvRkJJ?=
 =?utf-8?B?V2xPUGdsVFZzU2t4STlSMVZNS2VRbWxVWEhuL0ptemNWS2NjMlRXWHdTZWRF?=
 =?utf-8?B?S0NJa3d0OFRIYXdXWXBzcitibzRoMUwyVkEzVU5ucXoyUXl0K1RjVVR0ZlJv?=
 =?utf-8?B?a3BIN0dhSEdzamZRMlkvM0N5WDZsblk4M0pEeW8rdmZwTXZ5T09ZdjBxOTF5?=
 =?utf-8?B?bDFpNkM5Yyt6R0pNckxYdkdvZkVDSDlqcjB6WUJua1BvTXFQT0ZXUHdGZ1Rl?=
 =?utf-8?B?OEJUL3BZYXArcHNnbElleWVrOVpXNmYxZHpHOUNUS2NGYU1SbDBPc1I3THY3?=
 =?utf-8?B?MDR6bUY0UEtBbVZVM3o0TVRBelRaWTlrOEtwVjhHKzVhWXF6d3ZlUDFvZDJV?=
 =?utf-8?B?eG0rYVR1WE1rTVo3Z2luczUvTFpEc0g1L0NnN3lNY0pHVTM2Y3dEZWhidzMx?=
 =?utf-8?B?THVxZW5sSEl0OUZKNkJWOHZkYlpxdEcveFNjUlRQOTZrckxYdjF4KzJDVnlX?=
 =?utf-8?B?WjBCSDQwL0taKzlKQVViV3ZBSWFwQXNGbzYwdnpwNXVJN3lwYWNhdHJpcVho?=
 =?utf-8?B?SWVFVDB2a1M3RmNQNEtqbmxMekM4MEhYazhzUUhDTk1LdHFvWVVjOUdvaXYy?=
 =?utf-8?B?clFyYkVBdEdrZ2VuWGpOK0FCbnk2WDhNcmpTM3FyaVpzQWNhT2JJM2s0eEZ3?=
 =?utf-8?B?V1hIUjd3Z2NHUWlpVitmMzI3cmxCMmhwcVZwR2Y2WnNnMDZmbkFtWEdFUjkw?=
 =?utf-8?B?b3E4L2FVcmhNUHVmNVlyNVF0SjVERGJpYTVtbERBbldOQ2F5SC9FWnVReW8z?=
 =?utf-8?B?UXh2R3oxOW95YzlTRHZMa1d6UVdjenczTTh1TWNxSURKeDJqM0tWRVl1cVdJ?=
 =?utf-8?B?R2JFYjVTWEdIR1YweGJna21zSzMwcTUxUnlrV0h5Y21IL0dFOEYzNGZaSEVa?=
 =?utf-8?B?ZkU3Q2Vxc3N4dDdJblgzYmx2ZDFwdlAvamdmN3JQT3dUU2J3d25Oa2JMbldq?=
 =?utf-8?B?Zk95U09pMWNkdnYvMlhSZktBTHR4SWpOb3I4K0xtVWEydFRlanUrSmZaTjE0?=
 =?utf-8?B?WlZCYVdscHhoUHpEa0xCR2xvK0JzdElvNjE0S0xCSlB1ZTNCK29pUGsySkNF?=
 =?utf-8?B?Mk5zYm02akcwekFxdVdQNFg0YVJNWTB0Y1ovWThJTUlxNW9KTm01cGZKRW1K?=
 =?utf-8?B?WXRKeVZsYm1SamljTHpFVnVBWHQzamhtQjNVdVYwM2tCUXR3WU9yY1hQSzRa?=
 =?utf-8?B?dDA2VWI5WjF3Y1hpMzJYdUorUFZmWWtBWkJVZGZHcWxFbHIwTXN4WTY3OUFO?=
 =?utf-8?B?cThmK2haZFZNR3Y3UE1nWFpBb2RtNUYzNnVHdENSUUxQWU5KeGVMajJXQmpp?=
 =?utf-8?B?V01lMGVBSGZVSzd6V1BYcmZ1RllOVVhLWFlUSGZTb2xBZXBIbTk0N0RPUm1O?=
 =?utf-8?B?TFFNeGxkTEd5bS85eEZFem1LRHUremJoVnN0c1pseXFUTldVcTAzSlhjZHVl?=
 =?utf-8?Q?CidK324MzDIZerLvO+/n2yUa9BdqZi0tKh5c/dKX6Ggr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10477ef5-1f0a-4470-e999-08de1db0acbb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 03:49:38.6721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 85ykSRHxQYFLBPwEOfJvyHmMC4gbLY2KUFIQy8boBmkywpvVbzrDHCNZ6i9rBBBUJu69cg3gCHBKwr58VkT95g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6798
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

On Fri Nov 7, 2025 at 11:10 AM JST, John Hubbard wrote:
> As per [1], we need one "use" item per line, in order to reduce merge
> conflicts. Furthermore, we need a trailing ", //" in order to tell
> rustfmt(1) to leave it alone.
>
> This does that for the entire nova-core driver.
>
> [1] https://docs.kernel.org/rust/coding-guidelines.html#imports
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Thanks a lot for this! I think we will want to merge this one before
anything else so series currently under review can be rebased.

I will push this tomorrow unless someone objects by then.
