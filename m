Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B482EC29C15
	for <lists+nouveau@lfdr.de>; Mon, 03 Nov 2025 02:04:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC3D10E1E3;
	Mon,  3 Nov 2025 01:04:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="id8Q8KaB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013061.outbound.protection.outlook.com
 [40.93.196.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6CB10E1E3
 for <nouveau@lists.freedesktop.org>; Mon,  3 Nov 2025 01:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1E+Zorjnf0d/fxiyb/cQN/Df4yicMNb6HFmryyrPCYaWWBHGlyz3OIhRZweEclMzLGz7vrV8AofBJ1Yhs9SjarBbuQfIwcJiYTRzOIyJyJDGhGBNJuYc1inUoz2lhArywfngxbD8vK0FDHlXCPBbYwOUDUV58bp+H9GXSfzzcvyHCrLzyk1mT7jt9QbJMAyhLkA5gD6v2esxIWULuIVBbCXlmt9cP0THCgIyaJ9x9u5cJr5IYy3i3hXKmndJLCxldbuSnLD7v6XDFg0f357kSND0pvQmFlOlnOemU7g4rFukBzE1mw/PXOXTd+3u/utvDvNExPWu5uoIopdBl8+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jebNZ7nuQYY0pFD8Fh//yXu/AoDGBqax7AUw+tXklLM=;
 b=NktQ2VhVvUeC9Os4euyAE8pnq8EMYz2CT3Wp9STO/zDHb//33vcQ3PcLIXBmqCU2gALC34eKtBcoSbFogyfbzLkAzhru0c/BBjURjM/uNYVJ0qafUwetvui86Wp8AA/vLzBa7yzDLQaYTk3YAZOGLfzLCdIcLYKRmUwaVwmQbIdezy7lhvmp514WGDpJns83StzckPdfG/CC3lqEZUE+koMNGcYpSLaePmhqkTetkWx4rKTUcPevf83F1YcDOBmnTTdPUsr2zWVoojp/hTw8vTov1KbSDp4XPLHc4pPP4DQ6KV3pOFt+DiJEjcfpHfO5eGlG9QDTftSrr38qDqCeew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jebNZ7nuQYY0pFD8Fh//yXu/AoDGBqax7AUw+tXklLM=;
 b=id8Q8KaBdGVqynH5gM4VOPaPPns6v45r+jYcOxd8xRXzZA6menclc9IOP1MKiT/g9CnZMPbSHdyje9f1ta1zrvPduidl8SG3Mk0NprEGoCA4cMI5QljoYCtUwDaM+7C6zPgyKWsLxRLxXxDKXmKYoO1YQO+NCIkqrNzDkOmYEYzdhVTn+XbXKXpVcefjBVOFgPCDBNIeX1j/v9F66A2yoRGK6vilTezL0CFLfTfNQCWXpPKnzhTSsvoaZ4PXJJt1tRZ/0XMUR+Zuiwo/wwlZBcvoatkQaM8+0W3hvCG2xHqTHDpSKVvlD+y/w2DVexnEIrW56mbCbKLw5ChwAVHrQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS2PR12MB9663.namprd12.prod.outlook.com (2603:10b6:8:27a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 01:04:21 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 01:04:21 +0000
Message-ID: <634b7879-055e-4d5c-aaa8-25f88bbdae75@nvidia.com>
Date: Sun, 2 Nov 2025 17:04:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
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
References: <20251102013656.423235-1-jhubbard@nvidia.com>
 <20251102013656.423235-4-jhubbard@nvidia.com>
 <4c6df1aa00dab5b7e2a43c952180fc74e40f146a.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4c6df1aa00dab5b7e2a43c952180fc74e40f146a.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0018.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::11) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS2PR12MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 243ce85e-d5c0-4b44-0394-08de1a74ebf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3VKTnRodTcvQ0dTQ3ovRG9UaGF1QWVtYm11SnBCUVljYlNCVlE1dEozUHRV?=
 =?utf-8?B?QnFTeDY2SjY3L3NHdmYyUVE1RGtSclZGRFhnUW9DVWl3ckx3WWFQWlhoc2o1?=
 =?utf-8?B?RzdjN1h2MUpJQzZWN05Ta1VmeStZYnNwaHp4aU1VQXBvZVBvWVhFTnlrelBY?=
 =?utf-8?B?LzQvVEpUUTQ4M1pSWmw3Rm5kUTZWbUxvMGJCQ0NPdjZQOGFWNVBobDlqTnhs?=
 =?utf-8?B?VWJHN0d5TTZZbW03WkFPc3FYOStUNHU0bEpUQWZkamxYMDQ3c09Mak1VSEdt?=
 =?utf-8?B?WDdNWUpkSlRMS1JGSFFQYkRJU3M2M3NZWUNTc0lIcTg3elA0M0FZWWczQ2p4?=
 =?utf-8?B?akEwQTlVOU1hcVRGQkJsVlhCOWRHZlpZNmhHa3BvL3VCaDgwWnMwWWVUaGJx?=
 =?utf-8?B?V29UMGRCS3c4Qm5sNEYwaFVRbUsyZ2lxbUF5MlhWRk5ZeHByOEUybVRMREto?=
 =?utf-8?B?TUQxNVF2VEtxQzJFUW1DV2FVNDQzWnVYdm9EQ05ZZG8rbkUzaG1ScU45VDZ0?=
 =?utf-8?B?RnhPNEowMlJBVzgrTzJyVEZzQ1NINDlaRUdURUNITDQ2NFRpOHFSMFhwYXJm?=
 =?utf-8?B?TzhNdE5Ha0pQeGpjNG5PQ0FudmtneE9tTmVkbFdQTTBkOXBqUmJJWWxtaWRX?=
 =?utf-8?B?M2FhRkZvaG5NbFkvTDhUTHB1Z3ZNRjhVcjIyMnRGaGhLZW9Gc0J6eFNieHk2?=
 =?utf-8?B?SVZvMUxjUm15SWVWMENIS0RCcGV3VS9VTTNaOEhkSHViTU1ZQndRVU1uZDh1?=
 =?utf-8?B?T0hYbGpjbkxPVytRbmlwSkxQYjNuNkx0NWdIS0kyNWRGZHZLRzYxMHhkWFE5?=
 =?utf-8?B?Zy9FUlZydWlOVmdBaW4vREFTSFNDeFVxMENVbHNMYnF6NlpUOXdxaHEzckdC?=
 =?utf-8?B?UGtDczBMb1d6M0hTd3Uyd2lPV3BPOVJLZ1hPTnRJaG90ZDZiczd4dVJIZURR?=
 =?utf-8?B?MUpiK0xqZHE0cGdJbk9ybXRnMFQzTVZHNitsRllBbnl1OWV1UU5NZ3RrRFhQ?=
 =?utf-8?B?eDNtV1FXYjRRNE93cFdhUndMaGlLK2FLeUFsdEJ4cS9HV1FpdEozd0tDK0JQ?=
 =?utf-8?B?c0RxTDFSY3RQdHQ3L3hkNzFYNWVmZVhoRTMzbER3MFRSNVRoV2dIWDRBbGJN?=
 =?utf-8?B?U3RyTlZCK2pmR2plczBIRzBNZ1U0TTN1Y2xLcTl5ZTdDbWNmaEE2VHZ4UE5D?=
 =?utf-8?B?SjkzN1dFTE9FTXlVZ1pLanh6Q2wwUHVXNWxENUo4T1ZuM1h4Z1M5NXBFMEVI?=
 =?utf-8?B?RGF6bENTZTF0TUdGVXdCaGdYckxYMUVKdndHS0F5alFabDAwb2dCTFVYOTRX?=
 =?utf-8?B?NVprWVdMZVd4TEI3bWl3THU1MVBEUStmUEU3K0VTcHVlVUJzQzdBTytJUVZy?=
 =?utf-8?B?M2MvaFJYa1J3bGFiOWRaUFlxamQ2c1hUbHpHVU1zVlNtdG02dGNGZEFKUGlU?=
 =?utf-8?B?QUtDTkdPVlFhbWpmZytON2RKSlNCVHdtTWtxTC9yVUovRDRTeFhzSm9Lc25H?=
 =?utf-8?B?K0FpYWVqZy9lUlhWd3VwbG44cEpSMldYbWJISEZsWUUyV0RCemVvRUR2enY2?=
 =?utf-8?B?bDRYTzlUWXl4TUF3WStUV1ZyalNEajVJVmQzbUJ3elY5a1pPeEEvMXludzRL?=
 =?utf-8?B?T0wwVVdDYVplaXFTdjN5SzhoSWJFVi9wZzZhelVKWGFGK1NOSlBmMnNmVWc5?=
 =?utf-8?B?L1pZd3VnL1FmeVNYM3pkRVRVd2RyL203ZnNCNnUrbFA4STFMaWFjM0RIY2xE?=
 =?utf-8?B?TnlhVUhORUtjckpQNnUxR2lwbGJsWXN0RVgrUm8xQUlNOUlyUTdMNGQ3a2VD?=
 =?utf-8?B?a25QZ0JEUnlRWVZONzFnY2tkWlhBc3JFUVhkN1psRzBYb3dlZHpBU0haNWFl?=
 =?utf-8?B?TTZOT1haM2pqVituUkxab3hHOHpUVytxRitIcTVFUjZhT0h1cnhmMmo5SG1Y?=
 =?utf-8?Q?aI1zsYPt7RacWtGrqj3dAP43z5k6QCGO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWlDdjh2dHZiZUt2SFJaUjlNNk5EK2dvSGwyeWk1T2JFbGNhc1lGajNXbCtn?=
 =?utf-8?B?R3NRQmw0Y1A0OHltUm1JL0dDTmlRbG10UGhDLzZpdHViMzd1Vzk4c2EzSUZZ?=
 =?utf-8?B?WU8wZi9FR3ZhZGJrVlBSMEJzQk9wL25JR1U3V014My9lUGR6ajREcUpDTjBW?=
 =?utf-8?B?Wmd4ZGh6RTRyOU9BU3dXaUI5V2t1TFAraE0rNU1SVXZmMHRCQXFCN3pnYm8x?=
 =?utf-8?B?Qk5nZTFEUmUxaXIwckFFM2hTaXFiNytKdksvVTRucUU5MG9rbm9CaStqdlZh?=
 =?utf-8?B?NGhmK0hYT2RZdHJmUE5JL3FOV1hxVWpEbHdWbDB6TnB0cDQ4MVhML1ZEVll1?=
 =?utf-8?B?NVIxRWRCZ1NKaVpHb2hleTBPTHZpd2ZhZm5NZG5idGdNSVRTeVlldUJqSSth?=
 =?utf-8?B?OGt1S2pVbXNOQWh5MTNQdXdlMWpmb2YrQ0dzV3pjVTQ3cHd2aVE3d1NWRlZJ?=
 =?utf-8?B?anV3Y29OVXdlbFQ5cmhiOGVSWUFWM3labHpUZ2xCa09mQnVGYkd3N2NhSEtH?=
 =?utf-8?B?UmJVbXdpbm9jYk1FZ2UvNDVSVkNUZnhCemo3OUpVcGFjMHp5S3VTOE1HRFZk?=
 =?utf-8?B?dVpvU3FZUENFb3JBQ3h5UUtCaUxzYTlKVEdYTFpadldNczBydHdqMVo0SEtq?=
 =?utf-8?B?amFIVUNIRkVkcEFZOEwyeittNCtVNEZDUjllU0J0Mnd5cTN3QmIvK2xjWHpv?=
 =?utf-8?B?OXFSV2Z5cE5UNFFhMHlucFVZeEFaOHdrTURpVlFxMGptTjBzVFhKYjhiN2hP?=
 =?utf-8?B?NFNWZDNsSCtmcDJQVndZSUhVUW1SeCtabUV6RFFBeDZZaUM3NGVRVWdrZjhm?=
 =?utf-8?B?Y1pqSUIzbS80QzlsMmJvYkhmWFZiaDFHMzRlUmwwbE1KUmEyaUxKWENGMDVS?=
 =?utf-8?B?d3NqTDZGVWY3VkhTTWc1djBmTzNmMFc3eFoxa24zRTJyeFRWYlJWMG9Jc2Zn?=
 =?utf-8?B?QlNzT2xhVjVST0hGL3F5NytxWVdOakI3Q21wRFhMOGJDZ3VtZW1SNUM1Z0Nq?=
 =?utf-8?B?STFSbEQyMk5ZaSt2K1RMWGdCSU5aOWVQRksrTWkraWExbWthVTJreWwzY1Iy?=
 =?utf-8?B?Wk5EYnJyTVMrWnFtclExYmErL0JCMnQyaEQ3ZEdiN0hxQjIxaVlIYmRGZ2Z0?=
 =?utf-8?B?VHFrVmR5TVp0c2lGbUR1ZVdHQ29tY0ZrWFNrQ0tycnBPN3lWbGNYOHJyWHJ1?=
 =?utf-8?B?bnZvUkExbkhUbE53S1U5QVRBNkZGMW1IdDhOaXVZN2RQVFg3cmhLaEoxNkpk?=
 =?utf-8?B?a043S0p0R210QXdHVUVjdkNBMUYxQ3FxcTZhOUJzdE5jS3hqd2c4NkhCM1dl?=
 =?utf-8?B?aVBTWXZNd1RBZXNPem54MVRFVXVwQkh4ZGZPdEpCZzFDRmpqMmpyZW5PbDhm?=
 =?utf-8?B?a2wrbHRNdjR3bHMxcEpDcHovbTNzY1ZzUUk5MUlHR0h4LzB3R0YwZnFEOUhC?=
 =?utf-8?B?czdHTHJMUWdPL0NOY0RnakRPVmFGbTZOcUw2T2VmVWFVYTBvMVQxK3U3N2hk?=
 =?utf-8?B?aDFZY1Jib2xJZmVNZW9wYXB1RmxtMHJaRk16NzNTbmRRRzRhLzVpL2JjZ1p6?=
 =?utf-8?B?SHd3ZlV4TnFPajdZWUNvRzZEZzJiMmRETkhxUEs4dFpEU1Fic05YZzZrT3hy?=
 =?utf-8?B?NURMbEkwWmZvUXBLVnB3OGR2d0xyQnBnSkd1YW53Y1k5cXNtT0lGcUpHRERI?=
 =?utf-8?B?dnZwN3Fwb2QzbUxOUkpzSHRqeVV4aEc0cGdkOTdFRW9QZjVGaEFkeFY3dFdM?=
 =?utf-8?B?NllUa25CeFNyMXdPbXoxM2Z1emJvYXkxa1NqQWNhV1ZmNWFBS0tEbk03Zlh5?=
 =?utf-8?B?dTlXckQ3UFZZVmVUYndsOGF1VmpwbGVCUitlWE10a1pibmZVOXJIRnZuVzV2?=
 =?utf-8?B?M29qQVdLR21rczhENnBSaFFubFkzN0lPb1ZnVjhaYkZxa0FlQkIvTDRpMjQ3?=
 =?utf-8?B?TjR6TE5JNkZoRVRsdFJXWS9SL1pISWFVZ2ExWXlwMWlNaGZJSW1RV0pJUE84?=
 =?utf-8?B?eWduT3poMlFnT1ZjdmNjdjhUa05VQUFiNHN2T0t4UVJ6OWUvYzN5bmtvQi8x?=
 =?utf-8?B?VHdzNzZrbktFeml3VHZVTVhuT3JSSHYvOGpyN0pkZVQ3bTBlbnRGN25VcXZD?=
 =?utf-8?B?cTRENVkvMjdSQmV1ZWRWUEhadWpWSFVSVmJyTkNaVWhMT3lyWkpVNm44bkpn?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 243ce85e-d5c0-4b44-0394-08de1a74ebf7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 01:04:21.2438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFgco89cf5h2bylr4YB3e9kf+bZR4jhbJOPfS2C42G8wp18vHFXHobpckL6XMPBgrFalPcoL7+SAvjfny17vYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9663
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

On 11/2/25 10:14 AM, Timur Tabi wrote:
> On Sat, 2025-11-01 at 18:36 -0700, John Hubbard wrote:
>> NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
>> architecture and revision details, and will instead use NV_PMC_BOOT_42
>> in the future. NV_PMC_BOOT_0 will be zeroed out.
> 
> You missed this one.  Boot0 will not be completely zeroed out.
> 

Thanks for catching that, I'll write it like the other case.

>>
>>   
>> +impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
>> +    type Error = Error;
>> +
>> +    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
>> +        Ok(Self {
>> +            chipset: boot42.chipset()?,
>> +            revision: boot42.revision(),
>> +        })
>> +    }
>> +}
>> +
>>   impl fmt::Display for Revision {
>>       fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>           write!(f, "{:x}.{:x}", self.major, self.minor)
>> @@ -169,9 +180,34 @@ pub(crate) struct Spec {
>>   
>>   impl Spec {
>>       fn new(bar: &Bar0) -> Result<Spec> {
>> +        // Some brief notes about boot0 and boot42, in chronological order:
>> +        //
>> +        // NV04 through Volta:
>> +        //
>> +        //    Not supported by Nova. boot0 is necessary and sufficient to identify these
>> GPUs.
>> +        //    boot42 may not even exist on some of these GPUs.boot42
> 
> Did you intend to write more than just "boot42" at the end here?

Nope, that's just an odd typo fragment that I need to delete, thanks
for spotting it.

...
>>           let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>   
>> -        Spec::try_from(boot0)
>> +        if boot0.use_boot42_instead() {
>> +            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>> +        } else {
>> +            Spec::try_from(boot0)
>> +        }
>>       }
>>   }
>>   
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>> index 207b865335af..8b5ff3858210 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -25,6 +25,13 @@
>>   });
>>   
>>   impl NV_PMC_BOOT_0 {
>> +    pub(crate) fn use_boot42_instead(self) -> bool {
>> +        // "Future" GPUs (some time after Rubin) will set `architecture_0`
>> +        // to 0, and `architecture_1` to 1, and put the architecture details in
>> +        // boot42 instead.
>> +        self.architecture_0() == 0 && self.architecture_1() == 1
>> +    }
> 
> So this was the crux of my initial objection, and I just don't think this is truly "forward
> looking".  The code is using boot42 only if boot0 is "zeroed out".  So sometimes Nova will use

To put it another way: the code is only using boot42 if boot0 is
encoded, by the HW team, to go read boot42. As you know, the future
ref manual literally says "go read boot42."

> boot0 and sometimes it will use boot42, depending on the GPU.  It's this inconsistency that
> bothers me.
> 
> Instead, I think Nova should use only boot42, so that we have consistent information across all
> GPUs.  boot0 should only be used to avoid accidentally reading boot42 when it doesn't exist.

I am convinced that the most appropriate thing for a device driver
to do is to match what the HW configuration says. We should draw
the dividing line at the changeover point, which is in an upcoming
ref manual.

Once boot0 has the encoding set to "go read boot42", the driver
does that. Until then, HW promises that boot0 is correct.

It may look all nice and neat to use "Nova is a new driver" to
pick the point to change, but again, it's more accurate and
appropriate for a device driver to follow HW's lead, and use
what boot0 says to do.


> 
> Previously, Danilo said this:
> 
>> I think you're indeed talking about the same thing, but thinking differently
>> about the implementation details.
>>
>> A standalone is_ancient_gpu() function called from probe() like
>>
>> 	if is_ancient_gpu(bar) {
>> 		return Err(ENODEV);
>> 	}
>>
>> is what we would probably do in C, but in Rust we should just call
>>
>> 	let spec = Spec::new()?;
>>
>> from probe() and Spec::new() will return Err(ENODEV) when it run into an ancient
>> GPU spec internally.
> 
> This I agree with.  The first thing that Spec::new() should do is check whether we're on an
> ancient GPU that does not even have boot42.  If so, return Err(ENODEV).  Otherwise, from that
> point onward, no code will ever look at boot0 again.  boot0 should never be used to return the
> actual architecture/gpu information.
> 

I don't think we have a conflict on this point, if you read through how
the code works. The only difference is the point I wrote about above.

I'm hoping you'll allow me to proceed with that.

thanks,
-- 
John Hubbard

