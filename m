Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C511B2CBE0
	for <lists+nouveau@lfdr.de>; Tue, 19 Aug 2025 20:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C7810E644;
	Tue, 19 Aug 2025 18:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="azTDeidC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC8A710E644
 for <nouveau@lists.freedesktop.org>; Tue, 19 Aug 2025 18:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIfx0aUCCmwWUm+H4nBS3oMsSIeF2MSsLRfJPRz17B3lkVwVNpwZRqDcQlgRs9FuKjQlQSHh+HZ/wLAUrlFwelBM3gHCprdsoVWmNoKX5VGmgkhmL83dd1v3F9yRbislhH8QAKqdvhXzUm/VgMT5/sQDkG2tmO3CMXiaDWwniMQHH03Gf8i+HPZilE3FrhJNPeLmH7pmejwChC1TJWAq5eVGKF6tvKAF5kxaN4HEeqke5Z+sMhN0yR8lfUzjNs709KryYgDFF99WMujFtJ4DqbYAojSyngpqLpCqb9E62PvSDWa7im3LkZko4I7QfnxxbpA6ReLQExddJqnwyWz2yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6A2eokXr1XBlpOCZcS2fGD+F0Kh+MInrfGFrmCpDOY=;
 b=QWLROZ7RtMiN/OvcvA7vcmjCw+b6DcYplq5H8WWlzSZFSRrae8Fu02CdCsxto4goFX6UdKgn9rE/uVI0nz7zfCM6sl1pCzN/wZMDZGzpbzzIL1HCMdcw9THbu8+xlDjiuoZT6v060Sx0oseqLYS/eqzxvWufuiqGU8DIl+JBibrFloPqer2itfayoJFPUjvesDb9ia+qnqHhX3xeuTaepQrwChdLeqqGTNH67SOd2XFD1sb+FslFRoptdlRRQ1wTYGETTuyCus1Re6ZGl0iouuJXZ+tkafbZDptyiCWbIPuhg2N1ncvWXlrMsmD2pQQ3p9TQlW9AiMUzflgt1gUNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6A2eokXr1XBlpOCZcS2fGD+F0Kh+MInrfGFrmCpDOY=;
 b=azTDeidCZpEdN2eBsOv4I8GjzEy7qSO2b0TOfkcd80x+IAR3hdOZIcswZj4sb2j0ehDhF+wRdDzsbBQvD9pEMeG6hYnrZL0sW/r1UQ9yuUneBQR/6D0BtFF2+jYESK+Cv5//WPR6UvaRcwVKjkMfNgwHhTWXhW9qqd1CqUj7c0CKZDkTcO7xnNoEHnuaopnzVI36CPhlwbERV843+LlfLJXfU7/iBmc0LHzjafPWhQjfUERYfxE/94mAeiYs50XKOzbwQ2jneq/aajJESXn3/pWo6vqJrmKVCy9wrhNryLyvbh5Hwim9g/Hq1HAgsu9UGNS44vZ04PG+AFJTbTW1Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by PH7PR12MB6468.namprd12.prod.outlook.com (2603:10b6:510:1f4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 18:25:00 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 18:25:00 +0000
Message-ID: <aaaead9a-05e4-4b2c-8a88-af9966cf2e7d@nvidia.com>
Date: Tue, 19 Aug 2025 11:24:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] rust: pci: provide access to PCI Vendor values
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20250819031117.560568-1-jhubbard@nvidia.com>
 <20250819031117.560568-4-jhubbard@nvidia.com>
 <DC6AHIFTOH7O.1USOTN2YAHGF9@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DC6AHIFTOH7O.1USOTN2YAHGF9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0049.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::26) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|PH7PR12MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e6194a8-192e-44ec-3705-08dddf4db4fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXNwZTBoeDdIa1orTHZMcUtnRVVpL3pSV1VVKzM1dW9TblVOR2tqVTBhdWhG?=
 =?utf-8?B?UG9PSmZFYTJIZEl4RnRCcFU2YVpqZ0t4RmhYRlRkb3dVMG5kL3orUDdNN3dX?=
 =?utf-8?B?bkNYUk93emVlUmNWZTFFTUtmMDhxSkNtR1I5WDhoejFqNUhrbFFzVVlnVFFn?=
 =?utf-8?B?RHlpTzZvOVZTdmFaVDJTOWNYZS9sM1FMZEpwcE5uNkRJM2YzNzcrVjNuMEtT?=
 =?utf-8?B?aDRwQ3o1RGRKTnpLbUVIMnRmY0QxM0hJRkhKUmpKOFV5Y0xXZmJ6M1RLdk9L?=
 =?utf-8?B?VWR5eGJYcnl2cjMvbmhzOXlEWmh2Z1E1dytSUlJXYkRYTmtUTEVESWxXbys5?=
 =?utf-8?B?NGRmZWh4OExmTUhzSlJQVjIvcCtIbThwNmpzYnFzWHBzTWJBK1FTUnllNHc0?=
 =?utf-8?B?eUhUMVFJYUJVcEpaZ0RsVFBxUGg1NnRxZ2xYeGw4Vmg1M0FWSm9yNmRpRitY?=
 =?utf-8?B?UUZqL29tWkZHT0pabUlYaS9XWkpOMzFmL0VSSXRPMmoxSzI4amxJZ000UWVl?=
 =?utf-8?B?UDJCUGZXMVVJR0lxOXNSclhvaG0xaUNndXVuVm5wc3RzMXNpY2ZWaUxsNGVN?=
 =?utf-8?B?bFZWVDUrcUhuQXBpb0dPMWgraUJGRHFvblRGcmVCaUZjWUxCenByUUZQUzVx?=
 =?utf-8?B?cThLelZCUTZJZ2ZDOFVQQkhEK2QweTF4Qk5zanRndzRNTGo1a2xMWW40OTZp?=
 =?utf-8?B?Vkx0c3JDZHNVWWl0NzhDRy9NSW84bU9yZFR3SVZRS2doYzM5K1pXWHhwMjdx?=
 =?utf-8?B?MldicE1mc2p5TWc4c1NFb2pocHJvcjRLMG9xWWhmYzgrR25hT0VSbjRmZ0Fw?=
 =?utf-8?B?WWNJOUNVZGtCcWN4OFFJTXB0Yy9uMEl6OU5MaG43eVN3NlRkY09wSGtPSHNs?=
 =?utf-8?B?eEM1alZJdDQzdGlnd1hLblpBR25mZ2gwdGdHdnlwL0JUem5uR1U3OUN0a0Rh?=
 =?utf-8?B?Q2lzZm1pQ0RCVEtpaFBTaHRQQTlsWERleE5halhNWTQycjlrSFdRR2o2Qm5S?=
 =?utf-8?B?WFg4elAyM25BNGwzbmxneGh2N1lEcFovUHRJUHhQYmdHbFBUbUNHbUpGa2Rm?=
 =?utf-8?B?RWk3bUE2NU52TStZTHVTRzR0YXZYbEdFMTQzNW8rU3BoUUdEeEo3OHFsbE5D?=
 =?utf-8?B?QmNmR0JlK3dyMkNYSUJ5U240blNJM0RjTG1sWGdGTzJFT0tVYWFkSEpYMC81?=
 =?utf-8?B?UXVxTUFNYW1lbXNLWlNnSnpyK1FRcG9kaEtqQ3huUEZUZUZNdVIrRDEwei9n?=
 =?utf-8?B?Y2R0bUxvU1BLT2hTQW8wZFpQeUFxelIzaFZnYmVRR1dOdzNhMWdDQkd1aXBU?=
 =?utf-8?B?TzlsQ1Yrc0s3WTZFYWNBMGN5TnZnUkJ5SWRkeUtqMDhuNnNhaW9mQ1d5TW9o?=
 =?utf-8?B?alpmYXhwMmphVW53bDZ0OHJRRlYrK21pUm9COHVqMXl5NmovMjlBOXJUeEh5?=
 =?utf-8?B?UG9Ia0Iya0FvdG5Rbys4M1F2dVNyYkJZUUlYWG1LWGZpN0lpZGt2aFVpNWFt?=
 =?utf-8?B?K3NTU2RDalgxcjM5QzZLbW9PY0Y4dmhPZFpYSFpmWCsrS1A0U05KUkNaREUy?=
 =?utf-8?B?SWZsNTltbTJpWlhYaFlaazNOdnhTNitBM25BSSs5RnpTZW1IMmZudkVCVUVs?=
 =?utf-8?B?WVcvZXhldnNsVXpLWFhtbHUveXFmRTI3NUlrUkhzUDl0TzBqaHJzbUU1ak45?=
 =?utf-8?B?SkVlRHZ6ME1TbWd0UzVseEhrQ25RNytxMWtQYVlidkM1SWw5TktGQmFtT254?=
 =?utf-8?B?YzQ0dlVZYVl1UUxxMnRSdU9MZG5MUkROVHNyc0svdUUxOWxBN1NHREFHeWVE?=
 =?utf-8?B?dkVhc0dKQmJKd21temZyallkdjh6RXhsODBFNDRGaEFDT1BLVmtXOVJCQVpr?=
 =?utf-8?B?YXpUM2JCTUxhSWNJc2MzYmcwNEJPQytuaE5XeXVuZ0IxUE9BTU1wMFAzZS8r?=
 =?utf-8?Q?YuWYtEbVTPk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDZveWxhelFqNWo2UVdNcHd6c1B4dWZRR3BGN3F3MDEvdnNJUXJqd3RqWDFl?=
 =?utf-8?B?dzl2MUY1RXh3Q1pUY2tKOXhsQ1BoOVZPNXU2ZmhaYTRURUdVZnR6VmxNVlJY?=
 =?utf-8?B?R2hJak0rY2Fyay92UkNJMjh2dGdzYkFHenRneWNiV2EvL0NINHdLZmN0K2x5?=
 =?utf-8?B?WWJ1My8wbnVtTEhISVhETWQ5RlB2Z3RsYXZlSWsrT1hKdEx1NzVpQ2p3R05S?=
 =?utf-8?B?eUtzaGxQU21LUzJybW1UN3hkb2ZtQVBVN2xQN3U0cEs1aDNPNkhQVGxFSFBW?=
 =?utf-8?B?Vjh2blQzWVFmUHQ4QXpOQVNIa2Z2VVZHUVFXdTQ3bnZHTVBCWE9wRFkyZ3Yy?=
 =?utf-8?B?c1VveHNqWllicUxiNXd1WVNJR2IvNjhndDI3WTlDTGhVQnZvbnk4cllDeEFO?=
 =?utf-8?B?SndPNVhSamJhZW13RFA2MmJENWhsV0dmbDU4N0VhZXBhYlBtWTdhdk53cDlu?=
 =?utf-8?B?eXV0UTBhMk5oZjFZUi9RR1JHZlhnenNaZ21FVEFqYXdHdWdEWkpZRTFobHd5?=
 =?utf-8?B?WjJwd1VFeUk3SXVFVjZWWG93a0FtU2VZY2lmSnJRTHRKdHlvdVoxY1A5NkJ6?=
 =?utf-8?B?NHp5b1lpNzl3SGt2aGFuUmFxeFE4dHJ5bllsZ0NXWXI4VjBEdXBjd25YU3BM?=
 =?utf-8?B?OTVRRThWUzNJOXBVdDNqSDBJMk5pRkRaeC81Y1ZWSEFFdWpsUUVFQmR4RWF2?=
 =?utf-8?B?K1QzZzlBa3VEYVJuOGRRaWZBdTMrMjR1ZE5uVkdJaENaRFI2V0NDWWEwbmpw?=
 =?utf-8?B?NC9Za2lXWm53dVdGUWhubkhwcGxac29LZituWVd3cUVzZURialh5bUlBQ2JJ?=
 =?utf-8?B?Y0NDYUxTNTF5UkZQRFFPdy9jZ1hQQ05jdzltSytvMUlXQmQ3ZHFVRTNmM2Er?=
 =?utf-8?B?WHorK2JKQjZsb0o1MXlxRjBuN2swaHNEbEUwclIzWkF1OXp6VFluZGJwMkRs?=
 =?utf-8?B?S0VoV0xhMjFRMndLMEpNSmlhZGFmbFdpelhHalZmWWF4MXBheVR1Z2RnOWdV?=
 =?utf-8?B?eldPWjZPbmZoZXk0N0Z0WTNKelNBT1lOUFpLWWpsb2dCNnMxQkJML0pmM1M5?=
 =?utf-8?B?TXhOakxzeHh5YlhpRkwzR29VL2xaQzhnRHhjd2E5eGJWMHc0SmlMMkVybW0z?=
 =?utf-8?B?L3FmcEFrNlZaZkdzemV6S0g3MFZFSjJHSEQ4VU5GOVpYdjdKeU1HYTF4ZUho?=
 =?utf-8?B?R0RLKzZoWDBWMFpqSVBaU2o1TDc5Ulp3N3NhUVRDWEdjZll1c2xVMEJQeGda?=
 =?utf-8?B?b0hPWEFnMEdaUUFzZnBBcVhMVTZVSzVKTDZETFRNejBYMk9JYkpsTkp5T2tk?=
 =?utf-8?B?dWNxYnVsUUs4eUxNd2pvRjBTeHpJK0treHJDcUFSOU02aTBkSlU2U2FIS1FH?=
 =?utf-8?B?ak1NTWdPUHhNblhrTUI3SXBFZm5PY1N4VklITXB3RG5CcDhOdW1vTXlZdWRV?=
 =?utf-8?B?Qm9mYzIvRzA2QXh0NlJWOTNmdXQyMCtOenltOHhXS1BGaDUzeHBSVWV3Y3h3?=
 =?utf-8?B?N3B4SzhWUFAzeVU2YVkxQVQ1QlZMdmtzZjg5RmNvWTZac1pQY2VESmF1UEZM?=
 =?utf-8?B?OHhOcndKejd6Uk05SFZtMXdZUS9HU01Zbm9EWmxsZXZPem1EL2NzL0hrSjh0?=
 =?utf-8?B?TjgwcElISE5GbjY4dlU5V3RzMFFxQUloMHpXRnVEcGhEcGwyQ2VYRWlTbk9p?=
 =?utf-8?B?UUhKeU50Z3VjRFRZMWFuVVdIM2I4SzAycVdTaklnaTlzQmR5Vit4eGd0Zm5P?=
 =?utf-8?B?ZnIrNm03STdCZXlCdXFaYmROMnhWL0VUbzYzUXRwUVBuODZnWUpQd2VYRmZL?=
 =?utf-8?B?M0R4aVhXNk5rajY0d1VMK0JvQm1YalBNK3Nid2Jna2lNakhnUWJ0cnRaZTVx?=
 =?utf-8?B?cVVDaVZ3ZXROUWNWUEVRQlp5SUF1T3FBZytMY1hyTXhDMmZ3NTJscHRJU2Fl?=
 =?utf-8?B?b0RWdjNUUExSR3VZaDcwZ2VNbVRnbGZXb1AzR2pqdkxTY3FkY2xGZ0d1RkFI?=
 =?utf-8?B?M2cxRDVjc0JjQ0JIc05HWTV6MEFXa2FTYXhFeTNHeUhVZU13U0JmY0lKdkJB?=
 =?utf-8?B?NjhMN3djT0dkWkxvUnBKT0F4WnlMZ2s1R0RKTmlibXpIU2g4SE5iRndZeW5D?=
 =?utf-8?B?bDNFQ3o1dC92TDR2Vk9tSDFubCtja1BScEVwVVVybnhJc04xTXkrM3ZSeXdu?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e6194a8-192e-44ec-3705-08dddf4db4fd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 18:25:00.0577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD/c63d0ZliqYan5CId3WBgX7F4PC2wdyzIGAsSeMRJdOfnBEuv+6M/9f4znYIMBdVvcXx+WiJQKT3T50ml8JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6468
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

On 8/19/25 2:16 AM, Danilo Krummrich wrote:
> On Tue Aug 19, 2025 at 5:11 AM CEST, John Hubbard wrote:
>> +/// PCI vendor IDs.
>> +///
>> +/// Each entry contains the 16-bit PCI vendor ID as assigned by the PCI SIG.
>> +///
>> +/// # Examples
>> +///
>> +/// ```
>> +/// # use kernel::{device::Core, pci::{self, Vendor}, prelude::*};
>> +/// fn probe_device(pdev: &pci::Device<Core>) -> Result<()> {
>> +///     // Validate vendor ID
>> +///     let vendor = Vendor::try_from(pdev.vendor_id() as u32)?;
> 
> Why not change vendor_id() to return a Vendor instance directly?

Yes, will do.

> 
>> +///     dev_info!(
>> +///         pdev.as_ref(),
>> +///         "Detected vendor ID: (0x{:04x})\n",
>> +///         vendor.as_u32()
>> +///     );
>> +///     Ok(())
>> +/// }
>> +/// ```
>> +#[derive(Debug, Clone, Copy, PartialEq, Eq)]
>> +#[repr(transparent)]
>> +pub struct Vendor(u32);
> 
> [ Vendor impl and lots of ids... ]
> 
> Same as for Class; probably better to move it to its own module.
> 
> We could also move both Class and Vendor into a single module, e.g. id.rs and
> keep the module prefix. This would have the advantage that we could have
> pci::id::Class, pci::id::Vendor and pci::id::Device (which, eventually, we want
> as well), without getting a name conflict with pci::Device.

id.rs does provide a nice naming situation, I'll do that.

Thanks for the reviews again!


thanks,
-- 
John Hubbard

