Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A32C60B3F
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 22:00:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82A010E073;
	Sat, 15 Nov 2025 21:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="puy4Fhh8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012025.outbound.protection.outlook.com
 [40.107.200.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5405510E073;
 Sat, 15 Nov 2025 21:00:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1W6SyPaBwojx7WS3ujjQhYQM90wAbSfjSFq7UVHhufeg9dKWbpUFqEtoXpf6QRgHi5w2s/EuIDZ3AhPIDLoikpNhdX3SPhUrkQNsW/ae0oCVZPrFKIyM/0AySrGHMhaponSmGAsFqOgzSH2lGqH5ZV7v5TyoxQlmek4/QvRHaMAJIXhSgiDvXL5PHWiqPYuMG/m5Zgx6Uboi5FkLCdjYEaPN2wmw7apOyMKkYJdw/Y50UMRLtcNwDN5zV9o/BINUlXu6/m9Oh6kduE4AogTgfktnAQtPHaAOkUfelCidSwbA1np90kRd/E9Z62oE/Li1pHr/cnAcGVLLJtdzEDCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5F3z6tytmsii8qs1D6jDHiSZRS61xFEEiX6zvHFg3A=;
 b=e4HFojehXASvMl6jHLeqM1vP3SQYNQuBEESntALiqyrXx3ZdSbmFUm5M2b38fo8h/y4enlaua9AxoGIDmxPLmLmhgk2AMurzGvU9zK2EFGPvN/rk8P+3h1Sot2mZesxVhxvgjeX+tzWQRVbgxx4kSBURjWB2cg3HzP3Kk9eYf81gIkg9zDK9N0FVYZoG2o1u2P9hDRgSWS0oJiDhaUBJHTF2R8ZW8SlkQmV7AhMM0MmCjMXF4dtuzcj0hd98q1FdEuXMVvhUSPntPKVeN75SODdgecerxGggQ0vx9Uy/4kqd/9StYuZck2W6jNkrWAL2lVhFu6+9U7UwwjSj5ZIPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5F3z6tytmsii8qs1D6jDHiSZRS61xFEEiX6zvHFg3A=;
 b=puy4Fhh8DiNpUM4EB9mKxlvxnC42d7u1wfAFUhWOTwlWhMLMmxrwEyQUDHcnpZoqGBEXlImWSbM1LcF/QcGeEcjlzx5pk0yfBQIoW0roBRyLgYYbXzkr/kGmrM5YgNMo0pGTIovW2SUp9WFZV2xiqtw6z2h99CQKa9xrsZmv5LcFqz9rw0MuewUuWkgXd1ZFJrsNtN8MuJ+AMhxTEyJnwEV59fd8vBdy+Tu6KAY37w0R+doC4Z2X0V069QVbzwR8ohoQu9gF5t3o4AnKPJUhqjK8gKCFdNI6EqLZFym/yAOca4UAifoU67eALYEXrh7pUNjvj59NXJjdwkN9Nddr6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB9132.namprd12.prod.outlook.com (2603:10b6:806:394::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Sat, 15 Nov
 2025 21:00:08 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 21:00:08 +0000
Message-ID: <67ddd6fb-1465-420f-aa31-a011fe53253e@nvidia.com>
Date: Sat, 15 Nov 2025 12:59:32 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] gpu: nova-core: add boot42 support for next-gen
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
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
 <20251115010923.1192144-4-jhubbard@nvidia.com>
 <DE9BX3JU2CXF.2TOJUW5WCLENA@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE9BX3JU2CXF.2TOJUW5WCLENA@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB9132:EE_
X-MS-Office365-Filtering-Correlation-Id: 337b70cf-2db2-45c9-0bba-08de2489f560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkNKZTRkSFRxQUVtL2NqMWsxdVdxUnJqREVqNmxYcHk4UFBEVE9TWWdYRjVo?=
 =?utf-8?B?V09WKzIyOTJ3U3pscHhoMUVaU2UxVVZXQXcrQXkvam1tQXN2M0VQTzdyMmVY?=
 =?utf-8?B?RDFwMWJXMkRXSkc2WkQ5WDlYYlZDUGh2Z0hYVXQ4TllLbEdKWjhEekNBOUJV?=
 =?utf-8?B?dkJuejgrenlsSWNGbk5hWnVpK1dWYjIvT0hwcldlMWh3dzh4RXhJNG1Bb0Y2?=
 =?utf-8?B?anlkMWNnN0Nhd05MeGxCbmVTVitxSzlXRnBObitJL3h2S0ZWTThMY2RSclVt?=
 =?utf-8?B?MjhPREtVMUpLMlVYMVJESHdoNEl0RmlLUXlRWGZCQ1VEYkdNZXNJVVZJRm1S?=
 =?utf-8?B?RDF3YmRuL2lLc0QyUkExc3Nham9UZjNzV2pZN2g1Yi9LQ2lBVTA4dWpMaG9m?=
 =?utf-8?B?VlZxMnF3QjViWk00WXhUYlArUUh2Q3dvQU5seTMxVnpDSnpveHVWYU9KT2Js?=
 =?utf-8?B?MXNCYkpydDg5VnIyYk1oUGVxaURidlR1amc5VlRTZ1hrYURWYklYN09pQXdy?=
 =?utf-8?B?ZW1wb3g4d2ZDZUxoNTRISHl6WHVLbGVaODlSL2NJNXdqQWlITmlQL0NBLzlM?=
 =?utf-8?B?dzBFUkNKcDhaMlFjeE80UlZ3STRTclhIdW85MWZwdkNaNlA5WjlmdTFWREFF?=
 =?utf-8?B?WEtWUHhoOFd1cklPMVdXaC96TE9oWHJiRGpma2tjZHNJNUhqMWRaRG9oNEJu?=
 =?utf-8?B?d2lpbjdSQ2F6WFhKTi9CZVVqSXlJMUtzV3gydlY1S0l2Y1BXQ3VtM0g5TSt4?=
 =?utf-8?B?Q0x0YnUwdjQxZ0pWUVE3Z1liZHRYN0p6clAzMEdlUXJjbDl5NFpJSGo5Q21m?=
 =?utf-8?B?aHcySmdXYzNUZGFuUWFFcnBOVUc0dEFlTElNOEhETlphSHFMQ2UwN0NjVWdD?=
 =?utf-8?B?WXRrYm5raG0rajdTbmVzRkJQVXZvNWlXWkRzZHZ2bXN2dWZRdEorNkNBRXAx?=
 =?utf-8?B?R1JRL0ZncDFLdWFJMXhPaTRFL0syS0tIVjRrUEN0U1dTdzl1SmR2K25aNUhD?=
 =?utf-8?B?bllGeC9uU2swRno5dmRQTWlDRVRtUFBhYWdnemZrUTlYOFMwU3lMdWx6V21x?=
 =?utf-8?B?M1gxdGRjc0E2TmxYQkZqTmtzdnR4WHFKT3VzMWJuRFRnbnhKVmlhOUw4ajF4?=
 =?utf-8?B?U2FyK2tzWkFBVUlIYzBZR3k4MTZjZEQzTnRDWUJRSnJXOEdiKzdJZklpaXAr?=
 =?utf-8?B?c2FzLzRUb1VtOUpJaVJrTFZFSG1uODR2c1lnOFBYTUJtWXdLekFSRUp4NXQ5?=
 =?utf-8?B?a3p5NWN5bWNWNFJueFg3azhRLzVKS2phYkFnUmJraWFSSzU5NVR6VGh4LzBE?=
 =?utf-8?B?NFJMZ3dEZHZkWVZtcmc5MExpMWdETVFQcDg2UnhaRWR5bVFtalRrOE4yZFVl?=
 =?utf-8?B?ZFNCYUJLZjJRczgxUUxWS2dFbHdkUU9YcGlFU09qTjNIellLaWNEU0swaEIz?=
 =?utf-8?B?VWV4VWthdjNCNWtFc3VHWmFjcWdhV3N5MVhyVXQyNm9CeWpCR1dtVTBJZmN1?=
 =?utf-8?B?VGxyS3Y1eXFrUXYweEtqaGo1OEhYNTVSWWE5ZW9rOVRpQlZUZHVCeEt3L1BL?=
 =?utf-8?B?cjU1Zks3UktmeWVvNnk1djRWQWVsNUxWUjdmQ2F1UGtVZlorM2lyRlZYUm1L?=
 =?utf-8?B?MnFiTDhBMm9OL0xGOWUyZ3NjUTdRQ0NnaEtOeGtKL0ZEcEp5YkRad0FSUWNF?=
 =?utf-8?B?RE56NTBuenVpS0RaWEl0N3pSY2o5ZTNhTWxhdG5rek5LTW1rNjF1N1lZeFV3?=
 =?utf-8?B?U3htK3BUaDI5cjVlRVRzMHJwbVNPY1BFZzFCTGlmNHVlRE5ZZCtaNysrQ0FQ?=
 =?utf-8?B?clMwaWFHODlkRE54cnBtakhBOTRTS0ZabWdoTms5OEt5NWZuT2lUVkY5NFhW?=
 =?utf-8?B?djYvM1gxWTVabmRNZmdoZlBKR0FJQ2hBRlVObWtkN3E1dUJtK2pOakJ3UERs?=
 =?utf-8?Q?l+9n9G2IlIXS3PPsbKHwgI/vNvkXUCYL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2YzTFB2b0k3TmtsYXRKdGVGOStEMzNSS205Q3JrWVJwdTVGNVJJVTVlbHJD?=
 =?utf-8?B?QnNVMFRrVms2RzV5TWdPMHA3WkFUd3pyL2hQdGQyRzNlVi83d0w4dW1kejJX?=
 =?utf-8?B?MHd2cFBMaC9QWGJhaTYrSGpJRG9qYWl0cUJFOGJ2TDk5Z3k4azNHSVdNRzNo?=
 =?utf-8?B?cE41SjZKR3VaYmRNcUdPUVNYWFBKSWFnNEpScVVtcXRwbEhiaGxGTWh2NDFF?=
 =?utf-8?B?VjU1YlRHQW5XMXlwYlhnMVN0d0xaTU5uVE9vcy95eGN4TmVJRmpUelh2ZzUv?=
 =?utf-8?B?Wk9JOXFlbmpsL0RWeHE3KzcvcEp3SlBFRFNBWDM5MlN4QVR3cXdmV3A4d2RO?=
 =?utf-8?B?Q0o0OXJRTmpUc0cyV0tUaFJoUzkvUXVJblZVNEhoSTM1UHJnZ3I5ZDZrMita?=
 =?utf-8?B?dWFSellGTHgzZ0VOaGk3SWdaSFk2RGdXYmlFSUc5UDBrVDgwcEhQNk4yeGhQ?=
 =?utf-8?B?TWprd2VGbUZacnFmK0x3Y3lRT1ZYcVF1aEZMVjdzS1Y2QzlJM1B5cmI4MG4w?=
 =?utf-8?B?U2h4SXZNRW9GeURtZ3VjOGtHZFMwOXJ4UmhKaUFwWDRaNURoYng4TXRXdmpx?=
 =?utf-8?B?UHZZMjVaYkVhTkJ1M2RqQzJHbTJkL0lVSEVoOExCbjQ0R21yZE45YnNHWEdC?=
 =?utf-8?B?MG8wanhsdUpEcTdjZ29JN2lVTmZDcjRueXl2NnkwUnYybUNjZFdkUnJRdmFw?=
 =?utf-8?B?eWs3K216YUxRcy9JWnVUSUFoV2VHU3Z0VGJXUUJ3M0xCYjlnS3ZZU1REczFR?=
 =?utf-8?B?YStHNnVlMVY0YW96emhLTnlRMkwyemRyOU9NMVIyOVo2L004UzA4TEpTUU42?=
 =?utf-8?B?bGJEZnZIc2QwZ01yOUM5QXVWbVYwVWgzODhwc3NDcVYva2pCc2xRbmNRaVNS?=
 =?utf-8?B?N3NWQ0R0dGpMMjN3bEdmVE9FS0dkM2NTeWpMbE5tb2JwTkFaSituTlZad2ls?=
 =?utf-8?B?L3dsakJ2eERUcFJzK3dvR1g5UHdEWm9lbUF2d0tNYmFxQVVaWCtrUXFXQUk0?=
 =?utf-8?B?VlR4WTd6VWVYRlJkektxb3pIOUdDam1QR1BvbGIybW10aXBheUZhT20rWWRp?=
 =?utf-8?B?TkRWSXVoUmRKMWV4RFdoTlROWm84bmlVK1Rkb0tHUmlkdXU3ZytoYXFLOG5C?=
 =?utf-8?B?RkNOVDNOclZaQzBHdDlqcXNtTng3eXZ0MGZybzhjdzZEKzZDU1R2TXJzbTlB?=
 =?utf-8?B?VHBQc0kybWlWdENHd0liaWFXNUViYjBMMFNBTStCMTIxeFRKZWkxMWtlNHRi?=
 =?utf-8?B?Zjh0MXFRc0dsbjRRNy93Qm9WYnkza1dTOHhnNWIzajFFUTdUU0pSL3JJek9q?=
 =?utf-8?B?ZDB5WXJuL1pXek9CSWc0MmlFOHJDWENoV1pOZ2x5bElHQmFkMTBiZnlQMVN6?=
 =?utf-8?B?clhoTm1HVno2VFg5aGpibk5WYzhtc2xRRjZLTzJnalRua3hMeWU2QkNYQ0Fk?=
 =?utf-8?B?N29SWXdMNlVad1Y1Umg4WHNNbElJU3IzdEpBN0piUTVyOU02eFY1SWdQZzJs?=
 =?utf-8?B?R3c2eEdiYjV3dHd1bXp0RC84dXR5R3ROUXRXdGhMWVdKNGRKWTJtYWNuTE95?=
 =?utf-8?B?U3hXQTV0T1pMUlVaSnFaNGRtSFBZWGg5TkJnNXdSVVloR1JIVG1WWmxySmpj?=
 =?utf-8?B?L3hZTkVHZmhnQ2UyZ0dGS1U4KzFwSFNUTUdJQUlPWGw3ZXA1YktwdnBPWnJw?=
 =?utf-8?B?UjM0clFHZnlkQXVRTjRRNWFPU0F4b1RFM1lESURHempjOHd2eHp0T1VyeXhi?=
 =?utf-8?B?VkFpbnpma1ZSQWtLMGU1Si8wc292R3BSNmZhM0VTYUZmMUwzUTVqZWg2bE44?=
 =?utf-8?B?NkFIU1NjclRlL1FNSm81ZHNsS1pxeFdoVEVsMmd5cU1wQktDZ0pTRVdiZHZR?=
 =?utf-8?B?TE8xV050UExoY3RRcllKY2RGUFYrOUpBc1RnenVZZzJReDlRa1hwUUNrYUZh?=
 =?utf-8?B?MC9WOW82VFZEbHR1RHpUdUJKUGwyQjk1QzZKSER6YjVBdjJIb0l4Nm9HcVRW?=
 =?utf-8?B?dmczVFlyM2EyeG83KzNoZ1RValFsclZVRGliQit0RmJGdExRM3VySEtjNktC?=
 =?utf-8?B?NTRDNkZjaFNiNUoyalhLN1VPcnVvaWg5NXV3UVI5RnRmdkVBM05sSWM3Wjgz?=
 =?utf-8?B?YXUwWWYvdlppbUJqM01nc2F1MUxDUGNORXJhejUxUmpKYjdsUllDaFZHWU5h?=
 =?utf-8?B?cUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337b70cf-2db2-45c9-0bba-08de2489f560
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 21:00:08.0724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kH4d/Nsrlmy6ouv1Si/UXM8X8haQDCKtSrhNsntL/HblxevgZekgJ4fErVzwjYgOdrRkvwJx5YSd6xfcE2yy4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9132
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

On 11/15/25 6:13 AM, Alexandre Courbot wrote:
...
>> +impl From<regs::NV_PMC_BOOT_42> for Revision {
>> +    fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
>> +        Self {
>> +            major: boot0.major_revision(),
>> +            minor: boot0.minor_revision(),
>> +        }
>> +    }
>> +}
> 
> Just one nit: similarly to how we are converting the `TryFrom<BOOT_0>
> for Spec` into a `TryFrom<BOOT_42>`, I think we don't need to keep
> `From<BOOT_0> for Revision`. Actually we don't even want it, as using it
> would mean we are relying on BOOT_0 instead of BOOT_42, which this
> patchset nicely makes our only source of truth.
> 
> I'll thus remove the `From<BOOT_0>` implementation before applying.
> 

Yes, leaving it in was an oversight, good catch.

thanks,
-- 
John Hubbard

