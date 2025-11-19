Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C585C6D129
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B683A10E220;
	Wed, 19 Nov 2025 07:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XeH11m15";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011047.outbound.protection.outlook.com
 [40.93.194.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CB610E13D;
 Wed, 19 Nov 2025 07:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It66IDil633tNTMV2/RYu0LhZo6H8/F0eZJDyGhw/RWJd/jcleSdOqz0c3uulCJdk/JDioAqvgHnrNjQMXTFNUCNfgiPV5P/a/BcChKlpJ00yHsDOXVLEqL3AqzvyArmxnqy+S5y09ONXWK6q6RJ6dPmamhtzrLBwYF4rHr1ehGFr3E5zcv5pOVnDdNZwHFgnbgwmMsnfZgk9O5DxHK2jmB2CjCK2029lHTvxDlasVgf9vuTQPcNUr9sZPJ2MeRQABkO4pkB+76MGw7dAc8mYcyz7dAtkMpyp1zT+N2BOzO6PGqGGkLeQXPVkWqq1yQVOchx7OXgJB2xRCaCjtfzTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moQEECm4ayxLAvbDghT7CVqs93awKjPNzB1p4xtKfqk=;
 b=bX4KRtLeUG86tnQq3zALqDUKq8Cg+PURXsiNyM+Y46qn06Yn6TV3VbRD+eh4S3PD322gBhVtPXm81pHCC/5cE0fq4u8dD2TTbEYdpvoxzzInZ2UzGRCACO33JnMY/4g0xtrzCG4AUHW89fE+9JH3QiGfAnZaA4YU3wp19rPnNEhAd1o7LhImSu12pskbnj1f1NugB5vlWRi1bs3mEYHYucn3akus2t5/IC53LtqgcphQY2SBB47kbEopEKK5Ec86mY3cC0X/os1/PwgC0eDZNmU5l1upCXMLuOcmD3VOALuzC1I7A8SEHMHI5FGTqCQuj1ZIeks1VYzfBhoD7P2I1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=moQEECm4ayxLAvbDghT7CVqs93awKjPNzB1p4xtKfqk=;
 b=XeH11m15Q4trc4H8OvRBOJ0vFkzhqTgn/+XJn0IW0nFqpRMyRTEEB8GlEk9KhiBIdK0knu/i3y7X97RgyGKc3WR/VNDiEe7bvT8CT7aZ0k4bYYpezUreYI2RUG95yBAdxKNdykjtm2Dppc3iSTRJlkf8ohAlESf1eHvGAQr7l9FL6jf8r+PY7+e/YJX6iwkvYtX056v8Zg+2ACvdeaH05J+rj7h9fPC7wKopfDFegSjJwApDhBYlSKxghKoBGlzbkyOnP8F/4dE+W4QxNCq4OKmAQ1IZRIrmnET/AHZoaPb4ezwWqLs1OQXUnZtv8F0dpYUPuNR7Ya8/8zpOHJC4CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW6PR12MB7070.namprd12.prod.outlook.com (2603:10b6:303:238::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 07:20:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:20:40 +0000
Message-ID: <6b49de5a-280e-40e9-8e11-f95ce41452c0@nvidia.com>
Date: Tue, 18 Nov 2025 23:20:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
To: Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
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
 Edwin Peer <epeer@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
 <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
 <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
 <CAPM=9txhNyBOK2W=fgEabv3vXBscD1MNX0dyk6-OV7yCzD291Q@mail.gmail.com>
 <ff7f82b7-d812-4ccf-b5c7-263f0baaac3b@nvidia.com>
 <CAPM=9tw=n08NhAdFNHV7k=1CKz=nHPxu2bcXuNX8ObjAg1u+Kg@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAPM=9tw=n08NhAdFNHV7k=1CKz=nHPxu2bcXuNX8ObjAg1u+Kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::16) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW6PR12MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: bff8148c-ff21-4475-b433-08de273c24b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnUxVzhrZmJWZElrUld4a2hMSnFaMmxJV2lzamt6MStGRTZRTTBjOGRjaFA2?=
 =?utf-8?B?ckhhTHpCUXFycVJwU3ZCT3ZBUW00N2JLYzlaUEpCTm1GNTZTMnNyNFBSK2do?=
 =?utf-8?B?anUzdFVDWVRvY1ZCVVBnRm55WTRZd1Evb0N4MmtmWDdMU0ZrTDZ3Q2dTbWFq?=
 =?utf-8?B?S25SV0kra3dpb2lha3hNRFdxU3dzSjhUR01WN0IyYmRjNHgvdEY5clJHSlJP?=
 =?utf-8?B?Nm5KZTFvVWIxY1hZOWE1TjM0VVZMWTA4UXU3QU9JTlRFL2MxRzEzNVZsdkly?=
 =?utf-8?B?c05FeERZbDhDeVNOdUV0VVgxMDFxV05NYnFsN0plYWZsSkNrbDliNUFBNllz?=
 =?utf-8?B?WDNqTEdlVGN6SUFOaFZhb2hUdkQzZU16QjQ0Y1hFa0ZrOUEzODFxZVFGNnJ0?=
 =?utf-8?B?TGJ5SU1RdE5hQVd4Y2VPUWo2S0o1MUtEZW9nWVZKb3I0YnNkUXdEeVlGQWVO?=
 =?utf-8?B?WVpVWjJpWHIycHFWV1RvSFFleUdrdDhVNkpDeVB0VmRMWnUrazEzUEFvUzg2?=
 =?utf-8?B?S21YbDJhT05DeDZ4REtqZ0REVjZ2TERBWkV1bmdvWDJsTUdXQUNidXQyZGxH?=
 =?utf-8?B?N2MxU0I2WVU5SUZqUCtqUFJCT21VdXluc2wvaXNpSjdzZmhSbDgxK1hpaTUv?=
 =?utf-8?B?akRPOGN1a1ZUeTZIOXJOZUNoR3JJditldUI4VXd6eTJZL1g3d294ZDVlcTFr?=
 =?utf-8?B?UVM4VDVyekw4c3piYmZ6ck1Ic3RNeWthT0ZsQnhoUjg2WXpHNzlXdno3UlNp?=
 =?utf-8?B?SUthcG1YcnM1TEJEelRDSml2VlNNSmZaUnc0ZDJ3VEU2VzE5QStWdjNtLzdH?=
 =?utf-8?B?aVNDVy9tOHMxUG5BVFEvcmVDdWUwTy9jd0UwQ0ltUzNJYWkwK29VdDVyMGw0?=
 =?utf-8?B?VlV6Z2VQdzZVRHJwcGQ4Yi9RRk9xVEp3YkRZZUNFRjlIa0V5dExUMjdIbUJK?=
 =?utf-8?B?QWFIdXN3UmRoOEhsT1NaYklkdGJVZXdrQ3hQZFNGbER1ZjhWY0FvYnl6elVY?=
 =?utf-8?B?YXhLQ2psWnJFNGZzKzUzVXpUMHMzSGJEcGxXbGVNZjF2cXhkREdzckdXdlNp?=
 =?utf-8?B?K1ZHNk9vUmsyY1JQaWRBUk5yTjF6dU02dHVWK0M0bjBxVEtzNHJYL0ExQndl?=
 =?utf-8?B?WEVJZERXZ3BwZEFiU0hUcGVKK2pDVGlyazEwK1U5eEhSYThHd0pORkIxZlZC?=
 =?utf-8?B?MFBpTnY1ME1HMEFvT0NtVTRGNFlYcDJJNDVXWE9SUGpjSE9NTmZMdzBCVHlv?=
 =?utf-8?B?ZDI3V0xSb2Ixc0htcnVhd3h5NlgyMnJTSmt1WmpvNmpaUisrVGhKdVJkYlZ5?=
 =?utf-8?B?MVJub0tZdGpzSTg4WWUxVHRNQ2pyN2J5V0xUWjVRMU44S2lYdkppOWRZa000?=
 =?utf-8?B?b1hKZEtESTBjNVIwa25xK0tmOHNaaE80bWZobG1ScEhzbVArZm9jenhaN2Na?=
 =?utf-8?B?V0VWZG9JU2IxTWduTk9DQXpPazNIbS9IQlNZL2NjTGNhTnV2UTJIazVobWdw?=
 =?utf-8?B?UjZWakx0L3FqamdFZnBLUUZKQUswUDV2OGtpTjhrTGM2TTRsNS9OcDdXZE1E?=
 =?utf-8?B?MWlTNlRhbDJ5ektINmFLeG5xSGMwd2xkdVVpRnZDYmF2NUFLUHVISHc4VFVh?=
 =?utf-8?B?MGtoYzZHeXFjRkNObVpyQVVTRDFMVTV1UmdOcUNJcWtHNDBEN3dxSGp5b255?=
 =?utf-8?B?RzVkbExHM1N4RzJSRXZuUlBDL3prbDRGTFpxRENpVktOT043V0RsZ29rMHRr?=
 =?utf-8?B?d1hqNUx4WnpTaWNtc3AyVTNzS2dXYkVsQ0hBcGZMQ3ljdmVGVjdPL2ZpL21H?=
 =?utf-8?B?M3EybWppNURDZnhZS0xDeEI4aFJ0Q0pxVXNxeTN6SlNUNkEzZTM3RldPUmpI?=
 =?utf-8?B?WlNoRjlhUFBBWXV6ckRYZ01BWlFsS211eUJLSWxFTnl4UVl2d0hRUmp1d0tZ?=
 =?utf-8?Q?+7mahgYHPdUajzrQvgAUK9k+Dw4AIKaQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU5xYzdLNVJuRm9CbHRuRFN2cFphVzNTTEcxZ05qNEc5S2pJQitsaTlLaGQ3?=
 =?utf-8?B?cVBIZTV5anRYSXhXa01GZ0N4N1BBbjlsT2o1RWpHS09ZK2dNTnVRNEJlN0N4?=
 =?utf-8?B?eVd3QUZaUnRBcXdLUlcvdk4wczFFZGZmYmoyOW9ZcFJvc050a0pQak14cDlm?=
 =?utf-8?B?QXJOdEZBUWpiQk41TXFKSlJUYThXcEw2K0wvVWtMV0J6SkZ5S1JrdnRPRmVR?=
 =?utf-8?B?U3RRaDVoYlNhZS9Pb1ZBWWVMd1JzTlZUKzJBRG9EeHFlRkJ0aHBQZno4akVW?=
 =?utf-8?B?djFkSFR3T0hTalZ3azF0cGxKd1BveUF6M1Y3NkFVSkRpREFpTjVabkxqL2li?=
 =?utf-8?B?aTRZRHBhRUgzRHlkMGJ5anB5elBsRTNlYlVXTGtsRkxJbzl5M2RZZk13VFhO?=
 =?utf-8?B?cnJTeGFwVXFkalowWVFqV1pFaDhxbmhtWFZKcmpadTJtcW5SUmdyNUJ0UTdF?=
 =?utf-8?B?ZWFMOXpsSmZnRE1rUmtUakFKUmE4Yi9IUHRxSDRaMmV3NWJkZXRWcmpvd0tO?=
 =?utf-8?B?SHowUURHMnhacmZISWJ5RjA0cDI3cm9sc0QvRE1HcEVyTko3TGFvN1hoSGRJ?=
 =?utf-8?B?SzhpTGtveDdLQmZCMUkvZ3l6ekpFcGVMNTVVajlJcjY2cjltQ2d4ZHJrK1VO?=
 =?utf-8?B?WlJYSDAyQitoOFRrcU9EaWdKdDgyenBaeVAvZjR0aDFwcFI2UmJvOVJ6eW0r?=
 =?utf-8?B?N0NNY3NDSlRKK0g5TiswOCtUb1RUN1piMGQ0NEtrS0x1VG1HK1RsdEMzQWNE?=
 =?utf-8?B?Tzl1d09rTGlpa3JlMXMvN0VxRlhNZEh1bkdSNVlxZFFSNVdnKzMxSXphWElz?=
 =?utf-8?B?TXV0alY2WVRBTFdibFdDblFhOVBQa21ZSUxuK1p4MzhWWXpQTFk4V2k3U1N6?=
 =?utf-8?B?UCtOZ3Brc1hhWGlQdmJZelgrSGt2ME1INlA1Q3BNb0JKQW9uZWp3d3ljblZY?=
 =?utf-8?B?T1JXdnBRcUxHUk52NDFYb1JrdzdXMXJSOEhMaFpQYU00ekRLaWgvaXE3cjcv?=
 =?utf-8?B?THJ5Q1FLWmptR2tBcmpEM3RnWTRDY25KVVR6UFF3NW1yVXpKTXd6TVVrSVNw?=
 =?utf-8?B?SEpSVE9sK3dBRndrSm5IaThDUHFJcllvZG9zL2hCRXVIWDBoZHJvblpXTGNl?=
 =?utf-8?B?V1c2MXhhZHo1ZjBrMUNkby9tNUR5L29ZalFaYm9EWWNkaHMyVW56OXdudVFU?=
 =?utf-8?B?S2M1OVlpZFBycURla3RNeEVkRmVsd1lCeEhYMmtaaG9CcWRvTGRqOUNOQ1JO?=
 =?utf-8?B?QmlTWk9FOTBrYWRTNFpsbWFHK2J4U1AzaVA0NWJNcHQ1NThRMVRJN0tNakV4?=
 =?utf-8?B?ZS9mRnJGV3RVUWhhQzg2VjkvbFZtdkx2WkI0OUV2bVZVcFpMNmdDZEoxOHJ2?=
 =?utf-8?B?ajgrQitCMUZWcTBjZE4zalB2MVo2U2t3dGh0elJyR3hSYnllYTRQQTI4NGo4?=
 =?utf-8?B?RWt6Vzg1RVpDRmt1azdQL2I0cmgzbDVkNkFuRS9DUTQ4QktRaXVraXNBSGhy?=
 =?utf-8?B?T1V3aVYrZnRDbGR1bFZveUJjN3krbE9sY25hNmQ3UVFBVVRBY01hL21wcW40?=
 =?utf-8?B?bGRHZ1VjRVNwaWRwcWVEaFhxNlN1MFhXVXlTVHY1c3JVK0NLY3d6VW1ZWkpt?=
 =?utf-8?B?OEhhL3cyYklhVFdtV0ZwYi94UHZ0bzBPMXJYRVVVWEg2K29DM05VWUtJaldl?=
 =?utf-8?B?WnZ3YnRydDZsS0Uza1BUd1VHcWNVOFFlTzhqeVYzaU9BdThoRE1rbEl3WjBS?=
 =?utf-8?B?NnJhSHJRbG1iajVNMjlmSzRacys1ZUFmdmFDZEZKUmpsM3YyWkprUnZQZkYy?=
 =?utf-8?B?OWkxRlUvZHk1QkR6TjF1cHQ5NmpwOHQ3RkdDVXlnbTV4QWgzNmZPNHJ6SWFO?=
 =?utf-8?B?bnBuREU0U2c4aFRSQ2g4aDhFaE5FclovZk9yY1A2RnF6YzlGV21Wcll4SFd0?=
 =?utf-8?B?eUVOS3JPemVlZTdXQ09xTTZHbnhLd203ZTVYdVZqUXdMWW0zMjRVOVRNdm8z?=
 =?utf-8?B?TFh6ckNhR21WNmRyQVpVMHpSeGovUXZoZFpZVStUcnI0bjcxZkkzUG94dmox?=
 =?utf-8?B?MXFvN0ROdVcxSkxNS21adHZYY0E1QUZHRHZ0c3RHRWdVdUQyUGlpOHZFbHZR?=
 =?utf-8?B?UENSSDVwRUdRTFlKUXRiU3VXS1ZZcjZFRks5RU5jZ1EybFcxZ3h0Tlh1SXVm?=
 =?utf-8?Q?a+L/TVxQ4GGbpQvkxPL8u1U=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff8148c-ff21-4475-b433-08de273c24b4
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:20:40.2258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uQChF2o2MW7DaJFVu0e34FHwYVqskWSULtPQ64Wdjde7PvwCWDCxHwb3yUvbave+93vDNTeCE/VITUItxSfBkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7070
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

On 11/18/25 11:15 PM, Dave Airlie wrote:
> On Wed, 19 Nov 2025 at 17:08, John Hubbard <jhubbard@nvidia.com> wrote:
>>
>> On 11/18/25 7:15 PM, Dave Airlie wrote:
>>> On Wed, 19 Nov 2025 at 12:46, Alexandre Courbot <acourbot@nvidia.com> wrote:
>> ...
>>       GA102..=GA104 | Architecture::Blackwell
>>
>>
>> for example. Macros are going to require that to be less clean, but
>> let me poke around and see.
> 
> https://gitlab.freedesktop.org/nouvelles/kernel/-/blob/nova-core-experiments-fsp-boot/drivers/gpu/nova-core/gpu.rs?ref_type=heads#L96
> 
> is what I did, but yeah probably not going to get nice ranges like that.
> 

Thanks for the pointer, I was wondering where that was (I didn't see
it in https://github.com/airlied/linux.git, and forgot about the
freedesktop.org repo).

Yes, I see we can really only go so far here.

thanks,
-- 
John Hubbard

