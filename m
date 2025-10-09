Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E9BCA92E
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 20:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D3310EAC7;
	Thu,  9 Oct 2025 18:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pKY071aO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C366810EAC7
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 18:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q5k5VlaxkfG0W4hPQP5cmRYlLHk6j0ERbMINEAIlGeAvMB4qzWc7BOFlFwd4FH0oaWMFxNcJDy4GsQk/fAskUeq35U0Q/+K2G6WKmM+bwbVyIPwH2mxJpxxI1wSbAFMGQdZ3CFiyz4KXaL1GcxebGvvQJnNjf+rqIy4A5K3+43cVWrgAhQo0UWoEaIJuQw+Q2NGqvWwdzvvKOprK1joSR3Mc8J4XMs6yQJvA/ZdhiNFOk6XgUPU82UR4DYjmJrSbjZhcUP+bwq93z/5fb52IW5ggmxGqjleZ0b34Jdi+nJKV80czWRwcev9PHoLxkzKD/mYzfDeMET24Jc4f3eOWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6qF0O8PLEW91WZov+DVsRBbyqj0JVm7G899RtAHV6A=;
 b=OsHGzTpNotkUNUWbaLukPO5cPjRMHf7d2s2X9SEZOqiWZG3zgLu6NgXc3K7lrXmvKGw3QIZeey3of4AesYoUKlzM+5+08OYrvgGnZuwhunEce9lotnpTLMl3oWiR+kkeDBsRFbQXYppKH1HfoPViJXnDmZjPG0Y+w6df6Ll7PUZhpNFn+oTShVq+3/Fc7r8QvPD7p5mjaWkqqacb76sVqmW2bg+c0/vlOncptceVRNZ7DYlzd+lPfdh3xJ6UNkAHGFUQyftzzEf2e8v8Qzdp5SPnTP0v1RjRaQHRnLHKhl/ymsEFVbOI8gmbKOuhbLqWeDeWPApSMzH6m4HEX3TtTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6qF0O8PLEW91WZov+DVsRBbyqj0JVm7G899RtAHV6A=;
 b=pKY071aOMhu2By0Xao89WcFV9EqswToPUmxq63EhpQis3xhCG/EAwYcyJ8Iix0E49Wf0JNooOiaLzLD/roAkVZuKlNUT/s55IDnef2a0mu3BrFSIcBoiP0JV66O5U01cMbmNCJDkMqQmOpLhY61vd0HFeXVYDiVa3GBWUxm/YJycgNe8ZNYh32CI2AXO17hqrkVXgHc43Ts/DvUps799ekZE4dpT6OrFW2ubnfCOZ/+lkEalw02CvOyauFihmFs+I7GK9mTrS+4fQPEJgpvAPH213aFtHs/GmdPJKRIy4PHcjp6TA+JFRynyaM0SpTTuWDbdyIxqTbhHr0wsgB4Vnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB9148.namprd12.prod.outlook.com (2603:10b6:610:19d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 18:29:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 18:29:13 +0000
Message-ID: <f83dc79d-d101-489f-acfb-07834494bc65@nvidia.com>
Date: Thu, 9 Oct 2025 14:29:10 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
To: Yury Norov <yury.norov@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feong@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com> <aOflmmHe8O6Nx9Hp@yury>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aOflmmHe8O6Nx9Hp@yury>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:13e::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB9148:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d7ac8c-1f1f-44f5-cad7-08de0761bee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzZYS1BUZmo5NlJWUUZIanNNRDV4cUwrSmxvMm01OTI0QytreVg3cGFIRVda?=
 =?utf-8?B?U2NYaDhvY2dVbGZnU3llVnRnMzltM3JLajZ2OW1SMytRUDVMV0Jsb0g0cHBP?=
 =?utf-8?B?WlJiVzJkeEJwVlQ5L09iWE53eGJxcklOVEZLMzZmR09kRWpUb0pvTWxJaGxO?=
 =?utf-8?B?MDVvL05iNkxmR1k0WU1aNHZhUTRlTWZ2M2Yzd3BEWlc5aTgrS0E3QkxuY3V1?=
 =?utf-8?B?cll6aWNzbEFmRWt3UjhJZWR6RHgyZDJwVmcwaVhCRDMweDRRMHM1TXhUSTZE?=
 =?utf-8?B?TUxIUXBFeXRhSklMZXdaMTRkc3JQSWtpSmxIdXV5S2dab21VVFlIOXhWOGtC?=
 =?utf-8?B?RW1PSmpvVWdyeXAvWTdrVm44RkVDWEdoTFFQNjRkMSs5L0tLRStOZm9FYkNY?=
 =?utf-8?B?Mk1BU3c4SUJIMFo2VGl5eTkwcVk2aDBXU3ErUXYwb0tkQ0pZaG1TNklaVU1U?=
 =?utf-8?B?NXM3QXNJWnpBOU5iRjNid2Q0RXZ0QXFJbGs1cUQ5dHF3QktvZC9GVkJ3WDNL?=
 =?utf-8?B?NFBMQUhNbzRtSFRMcW42c1VHZkxnNkJRdnY0a3pKVE5ZaUdGcGFaaGhwcTZM?=
 =?utf-8?B?OUZEZC9DRGVhVUt5NVF4R0hMTkRyOTVRWlVETzBtWkZ6VTVpU3ltT2JxNVVT?=
 =?utf-8?B?cXJUb0pMaDV0VVFod1NWcm5icGpvbThtbmhSUDlJZVNjdkQ5QjhiSHdsYUNt?=
 =?utf-8?B?c001eldJblNrWXVUcTJFVkEzN1JxVWMzd2NwNlFyc3l2K3BiK3JkYmJjT2Rs?=
 =?utf-8?B?MmI2d3JsdTdJOURDaHRkNG94ckl4UWtpQlRvc1pMU0tRQ1JYZzM1QXhlTEJl?=
 =?utf-8?B?UFdIODRkUEZMWXlaTzU0ODBjYWI5VStDOFVhNnZzZ3poUnhDb1BqalpsdkZX?=
 =?utf-8?B?TG8rNWR6aHFRTVo0L1k0b201aUVZaXdNQll0VG1EVko2Q2J1UVg2cmN1U2Ir?=
 =?utf-8?B?cmFPTmFBNlQ3TXZFRG5mOVRwalZ5bzVNMkIxZ1R4NW85VS9YMHNvUWNlSjlT?=
 =?utf-8?B?WlBtdnRlQzBvUFJET2RiZlFjSGp2R01lQ0RiNjIrWnNIQjdRN3k5MlloelJV?=
 =?utf-8?B?aGp4UElHTStnOVF4RGJJQ3FpM0RtSVVMMk9xcU45N2FGd1ppcHc3dVRCVU1E?=
 =?utf-8?B?T2VPeDJjbUlMOTFFSkFuV0VyMVNXekZGaHAyMTdiNkV5dWZLRC9SWWFNRDBr?=
 =?utf-8?B?ZE9VV24zSUplZUJiVjBJSWFubXNaWnNYeEk5NDNjUXR6UWp1TDdjdXZscita?=
 =?utf-8?B?ZEYrZUEzcjczVTlDbFdrbm55VnEzcjN2NkNpVldrMmR3SlBvK3UxeVhNQTVw?=
 =?utf-8?B?ZlZ4M0lpK1B0NkwwNVdiSFhVdE9XRUIxSllRR2hRekcrK3JGVDJHZlBERTJM?=
 =?utf-8?B?MXhuSkQ3cldORVRMN0FhVDVnRThEcUVyUDcwaUdxTk41T3lrQ0dFMWJBc1Zr?=
 =?utf-8?B?UVZMRzlNWTJVaERueGZ0d0NzWjZlM3NsU2plMHhwdDAvWGhIUGE2bk8vYzZ2?=
 =?utf-8?B?N0Uwbi95WkswbE1qREIwLzhTS2ZlTTcxSHFkcUJzNDM0cU4xdFpyY3NtU1lo?=
 =?utf-8?B?TjVuZUlFazZtSVdkeXJVRE5iSldqdW0rQlhyVGxReXNQdExwd3hTcGF6a01J?=
 =?utf-8?B?cWQ1RUphZUpHZkYwejRmQ2xQNk9ObEgxeDIvRERaS1FkUWU2OHg0UzZQMEF5?=
 =?utf-8?B?WXQzeUhSSk5KVHFIOXJlNmJleldKOGh1d1Bmam80alZ4U1lET3dNeDVzMGV4?=
 =?utf-8?B?RE40VEkzeVk0dVRGYnc3V1AzZ1hyRW1rYUVUNHBHcTJvQ2FxWjA3aHhVbXVQ?=
 =?utf-8?B?QnFYYm92NDJpUmVJckptUnJQR0RXaUY0WHIxb0dyS1ZXSHF2NnVvYktYOVhE?=
 =?utf-8?B?MFhwTDFETi93V3RESSs4cWN2bzYzdzg3TUtLZkNOMmNhMVpsbkxNSmR3Mnhm?=
 =?utf-8?B?MFlBSXczbTQrWkFtWEJEL20wamhZSFJhMTNnZmZFcTNpVDllU1F2NXVqWGJn?=
 =?utf-8?B?YjBZZ3V1ZUxnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDY4QXJ5ZzdlZmFLUFNmb2NscUwrREdXUVRJSzFZL3lrWDN3bTQwYjNWNU55?=
 =?utf-8?B?Z1ZTUTJPeTkrY0xnMWFKeXNMWFVrSVhJbmloVExSb0t0eDhhaFY3TkpWSFdG?=
 =?utf-8?B?Q05ibHFPWkEzU2dsMFFmVzFMRzJHY05QZ24yWjJyWHFxYTh3SllkZFJVTHBu?=
 =?utf-8?B?MnFqekxqTFhMbjE2bE9KWmlGYlNLZ3lET01pTGVYRkc2Mkp3RzdwamNIZ1dK?=
 =?utf-8?B?a3Jqc29NeXBYemN2T2ZpQTA1elNyWStZZEp2ZFB4ZWhPcTJ3K0FBWktvMkY0?=
 =?utf-8?B?WDdxSVBVU292OHJqNDZ0ZFVLdzBSUDJZNWMyc0YyL1JTanEyMDBpY01KaVBT?=
 =?utf-8?B?T010bnNDZ0VaU0pyMk42VHRNUmR5N3l2QjlJSzNYcmFram40alYxTzNYQk83?=
 =?utf-8?B?NEo1Yy9uSGpZZzhFcHc3djJ2N3pFNUNHL0xuT3Vjck1WMDRZdWcwWlhtb2ZH?=
 =?utf-8?B?OVJXY3M4bEJCaHF2NkYvZURlNVd3THFPQkhFQVlpZUphQXdOa2dNMytxaUxo?=
 =?utf-8?B?RmNzWlQ4ck1yRjQyWGZrSENGZlJlWVBrRkxVMUdWUG13SUplQ1NtckVQNmZU?=
 =?utf-8?B?U2pyUEQ2ZWJ5Zy80emFsajZhZFc3ak9DMzBrbzNZSitHNEdodnJoZnQzcFBE?=
 =?utf-8?B?dUhhT0M0clF1M3k2YTFNSEd3V3lvOTNPWCtZYVB0eE5xM0gyUWJaU2Z1dUNI?=
 =?utf-8?B?OEdPNmo5ZzVuOG1haXNGN2dIbS9Jakh4d3c3cndZa2VDV1BPRlpsRFJqYVh4?=
 =?utf-8?B?L0k2ZG1FcHdZSXdUd21sUEpEQ1N5YVlHazJ1L1ZJckR1aG53cXZuTDFYTWN0?=
 =?utf-8?B?cTRLYjRicFh5d0E5MnlHL2xaZ2hxKzI5SU5XMkVaaGFUL1o1STBEZ2czSlhO?=
 =?utf-8?B?d1BlNE5HUzhiVnZabTA0bkVuNG5hTnFGZ2RZUk1FNy8vUHdMSlRmeXJzSThC?=
 =?utf-8?B?ZjY2VTJUQzN1WWpXVGRKdkNyY1oxSzduUWkvR0JBM3lOVXB2TVgwWWZhTVhp?=
 =?utf-8?B?RHJjOU5tclNxZ0g0RWl2N0Fia2k0UTFaalJZcGk2RUQ5SFZqeXgwcGc5aFQy?=
 =?utf-8?B?c3VVVExkWGVHM2N0a1BBelpRZzJZZjIyVDE2TVNmb2duMVIxQzJ3aVZ3QS9C?=
 =?utf-8?B?c2Y3MGQ4UjFVWWozMjVtTDNsTm5ONDBSNmZKOCtVVWN2bjA1a0tIclZpZHN3?=
 =?utf-8?B?Y2UrbStFNUFHS2hNRWNIRlNRaW5xVVBCb09OM2g0ejZIbGNFK1JmYmR1Uk8x?=
 =?utf-8?B?WVd5OVdNcHc1YlZiRDZXVE4wNjJ3Q0tGb1NpR2c0U0MwUTRTeFg1TnVENjlE?=
 =?utf-8?B?cncwcmZJWFdXbzNYTXZzcUJ2Skd2WFk4d2dMNU1DYittRXBUMy9ncDBUTXhF?=
 =?utf-8?B?TUtSQittZWphUjRFMzY1RXBQcnNPaFBzQmlYb1NVVEl3amdMQ1hxWUJWY1lK?=
 =?utf-8?B?RkRrb1pCUDMwSm05UkY2a3ZKN1A2eUNvcFAvaHhlZnVlUHBoTjNsVGRQTGhy?=
 =?utf-8?B?T3hsS3E4RXl2QW5uUVVCdWhUL1U2R2sxdHQzenJWTDcvZWxBVEwva0tuZGpr?=
 =?utf-8?B?eFQ0TkxCSFV1TFc3ajRYV1NXM2hEb1M0WkNnVEFFMWNMY1A0UnB4ZWxKTHc5?=
 =?utf-8?B?aFBMVDN1aVFVRHFKK2pSSnFvNEd0akE0YTlkTnNyZFppamFyVUMzemNtUmlU?=
 =?utf-8?B?NUlvdUV4cHFxRUVRaisyL1duZnR4WEZKVjRYYzZOOVFHWVI1WkQ2TU1JWk9k?=
 =?utf-8?B?eFdTVFBCdkJ5dWljMjlnQzc1eGFFSXpTTUVkLzRPL1BLM1hIbTRjeDRMOWJm?=
 =?utf-8?B?YlNkZTNiZVhHT2xOZksyMWgvdUZ4QzVpNnd3RTZ2UVdHaU4rekd5Qm9RU0RJ?=
 =?utf-8?B?VG13MmozUHF3U25haTNWSUZPSHdQRllTQlJFTDVaOElyTitObVE4WkNzMHVq?=
 =?utf-8?B?dXlHbndrd0lHQndub2o5a0Y4VThnRVF3ejM2VmpNMXAycHliYmpsN0krSlZ5?=
 =?utf-8?B?b1FDYnZBTCtFb2hteVVPMHVmUk8vaDU3VzhsZGZtbjJ6MkovNkpTU1lSWnJt?=
 =?utf-8?B?SjFKVmkwd3B5QTRtalVMZTJjYzVyWWdaemV4aVowSkkwUG1LU1U5aU9reGsr?=
 =?utf-8?B?MG9EMU5yaFpIY0w4Mnk3cHJSbUFpYkZmZWx4NzBEeUZqZmVKWWxmZHAwN2ln?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d7ac8c-1f1f-44f5-cad7-08de0761bee8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 18:29:13.1049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69Esgtb+LWsrUNKoJftgO3jmEWStrcVhCm7VbAOBrOJfo9zW2sZWceyLJS4muxx74/bz+zWOvANKEIB5U/be7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9148
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



On 10/9/2025 12:40 PM, Yury Norov wrote:
[..]
>> The field setter/getters are also simplified. If a field has no target
>> type, then its setter expects any type that implements `Into` to the
>> field's bounded integer type. Due to the many `From` implementations for
>> primitive types, this means that most calls can be left unchanged. If
>> the caller passes a value that is potentially larger than the field's
>> capacity, it must use the `try_` variant of the setter, which returns an
>> error if the value cannot be converted at runtime.
>>
>> For fields that use `=>` to convert to another type, both setter and
>> getter are always infallible.
>>
>> For fields that use `?=>` to fallibly convert to another type, only the
>> getter needs to be fallible as the setter always provide valid values by
>> design.
> 
> Can you share a couple examples? Not sure I understand this part,
> especially how setters may not be fallible, and getters may fail.

Because a getter has to convert the raw bitfield value from memory into an enum,
there is no guarantee that the memory in concern does not overflow the enum, say
if register bit meanings change, or something. ?=> was before fallible in both
directions hence the "?". Now with Alex's patch it is fallible only in one
direction.

>> Outside of the register macro, the biggest changes occur in `falcon.rs`,
>> which defines many enums for fields - their conversion implementations
>> need to be changed from the original primitive type of the field to the
>> new corresponding bounded int type. Hopefully the TryFrom/Into derive
>> macros [1] can take care of implementing these, but it will need to be
>> adapted to support bounded integers... :/
>>
>> But overall, I am rather happy at how simple it was to convert the whole
>> of nova-core to this.
>>
>> Note: This RFC uses nova-core's register!() macro for practical
>> purposes, but the hope is to move this patch on top of the bitfield
>> macro after it is split out [2].
>>
>> [1] https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/
>> [2] https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
> 
> ...
> 
>>          regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>> -            .set_base((dma_start >> 40) as u16)
>> +            .try_set_base(dma_start >> 40)?
>>              .write(bar, &E::ID);
> 
> Does it mean that something like the following syntax is possible?
> 
>         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
>             .try_set_base1(base1 >> 40)?        // fail here

Danilo already replied here, but this code is fine as we early return due to the
try operator (?).

>             .try_set_base2(base2 >> 40)?        // skip
>             .write(bar, &E::ID) else { pr_err!(); return -EINVAL };

Here I am guessing (based on your concern from an earlier thread) but is your
concern was that -EINVAL will get written to the register accidentally? That
wont happen, the above code is fine. Or do you mean something else?

> 
> This is my main concern: Rust is advertised a as runtime-safe language
> (at lease safer than C), but current design isn't safe against one of
> the most common errors: type overflow.

I'd be a bit careful when using "isn't safe" in the context of Rust. Rust's
notion of "safety" is about preventing undefined behavior (UB), not preventing
every possible runtime mistake. In rust, integer overflows for example are not
undefined so overflows are not "unsafe" (it might be a logical bug but that's
not what unsafety is about). In fact an overflow might be exactly what some
algorithm needs (wrap counters in RCU are example of harmless overflow). Another
example is a deadlock is not undefined behavior in Rust, it is defined, even if
bad :).

Thanks.

