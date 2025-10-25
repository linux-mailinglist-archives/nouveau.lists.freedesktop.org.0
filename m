Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB6DC08AA3
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 06:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C0410E246;
	Sat, 25 Oct 2025 04:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IDcwugwO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012008.outbound.protection.outlook.com
 [40.93.195.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3667A10E246
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 04:05:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrI4rWm1C1VyAknAp/LvsFtKb0CM1IcPm1cEzEAnj8BCdFbWfgxhlE3Jy14sTrdKvgYUCjnWDQMVNfBDEa/7G9BLTY7NcT3VdsjAD6dHe7jL0Ffds/VKXozl6JqF/KKMlP94rL6gv8xxbILszdwOAcA5oXSgrTwhYCE9AYfvn10ir6xF9VajLaAPs4bT0fHKKf6pfUlibilB5FWujjIG6JOLCEjyS32nwvYzKpIMGVxzIVXL0tBWDhbegw257xe9B6ahgS8yol+HxvYB+0dPOqpdra6O8y1KcDOjBktVw7d7Mhz/+h6oE8ZjxttCBOi0w5Tqs6v7zEVa+TwgxpAgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOACyZvkM3kQpWEGHa/I1NsUFXCDpaAo64QlnVTOotY=;
 b=CobAdLrlvB3eJ56TgZycSMLapADg/sFmIKyZIlImju8otvetXPxgGq+S6CDoCxSXPF4FjHQoulcP2T1YiqKLfvUODjBvbd/fXBOXiKU+QJgTaomQv9//TKL1O5dP5iKo5+rO+jiMh8ShPlNtBPw+VWmBkPwpXN6XllQFqM+2tSFhCUrmKSZSwIqb5Hf3LVi8mrGQF4JLaAlxT/lzTk2RxZNxxSQBaFdIkaj5ZnMWiaTqrWSsbfuuIk1/Qn8I3lTrHTnr6lNsbiEcGpJZIB4Lfz4C7EwQDURS3/3d5jFfd++MK8XTozAST2/faW/uqbebsYBLtwQi6JybWSQkvCVjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOACyZvkM3kQpWEGHa/I1NsUFXCDpaAo64QlnVTOotY=;
 b=IDcwugwOv7gRJA8aDbgO3l00Ihn7BsNm8ln1uO7iNKmukvuTHQMH+DMgxu6vNfaSSwDgGzVmgh8yApDnhko4CIvG+0gp8UtpzmGC3XSlinxCpWn1LEoeKiYCPj5Sb8PDis66EFo2/2pre3nsb3fKuxEaYU+XzBKHhXkcN8VZMggQNh+nk1peNnBJhKdbjilN0aaXjrSwtHESlMmkaoqwNSvmnQZwtthB8609NjqhO0DIauu1fY+AgvTIvqz3SzTuvG0wo1wErtLn6csYNchSLq3EEWQKI3NFs1i+s/1DSPW8hn3oX9dypqVzi36qevJDIb4os4p16CATzAbHxhIpdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 04:05:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 04:05:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 13:05:37 +0900
Message-Id: <DDR3TXEP1NRO.3G992SB3VFF4C@nvidia.com>
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
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] nova-core: Ada: basic GPU identification
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251025012017.573078-1-jhubbard@nvidia.com>
In-Reply-To: <20251025012017.573078-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP301CA0043.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab770dd-4942-4c72-536d-08de137bc2d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFZBT1RmV1VVSi9sZk5jdnFhR1d3MkhNeUN5TjdRZjZNR1Z2bDN1dURqNDR3?=
 =?utf-8?B?OHJwQWN1VlpvYVhlbFd3cmYyZCtrdkU2Z0MrUHdpV0ZjVWh5REtSRVFxTFha?=
 =?utf-8?B?ZmN4NndJREkxN0RRVzN2OWFMOWdzOFNoTXZvUmJMai8zZTNsQ1I1UzlteW1Q?=
 =?utf-8?B?OERHcHQxZDFOWmlDNkV3K1hncnp3c3JhTDdyQXc5L0ZSYmVHRXRta1NUUWQw?=
 =?utf-8?B?TUhtUm04QjhBUTFWNzJKN1k4VHdQcVcyMjBPNlVxamRadVNESURONEsySEVz?=
 =?utf-8?B?WGI4b3pudWFOZzdxVU5KVXYwaFlaSXdGUDJOQUxzcWZ4WWlpRDQxTnJHN0oz?=
 =?utf-8?B?YVhGL1gyNXhSVFVPeXAwNHN6L0g3cVNWUkkyK2Y0ZTRRb0pQWURrWUxFSm5s?=
 =?utf-8?B?OUN5MU1OQU9rVXl3NDlXWmE5ZndOdWtKTm1BYitJRTUybjRWVXpWU1M3UHRN?=
 =?utf-8?B?Z1VTVVZ3N0o5dENHUUZ1Tk9JYmtzM24zQS9FaFlUWDBlU1d1Uk5aS0k3NzNm?=
 =?utf-8?B?VkphVFV5TGJ6Q1FVemM4VTVnbFNhUlZDajBQK3hwdGYrR0lWbG4xaVlVbG9t?=
 =?utf-8?B?Mkp5dU5aMjRNQTBuQ3pnNXhrSE5XbkZqSjArL0FEbHJOUTdPWnhlbS9ORkxD?=
 =?utf-8?B?YjRtc1hxU2RDRHg1ck1Ea081b1VVSDJEbkZmaDYxdi83aFhFK3ZGbG9Jd1lx?=
 =?utf-8?B?MXJXK3Fib0M5QUhHeE9jYXBoYU93MU9PYUtWaWdveWVVU1NBRXpaSTFXaFNa?=
 =?utf-8?B?RzFVSkRKbExRbDFEand5UEoxUUVxc1dnWDRUTjlCeUw1OTNXK2NaRTR0UGJu?=
 =?utf-8?B?dUpIMWQ0SThiajV4alRYUDJFRlRtT2gyVll6WjlNUTJENGhzSHRyNzd4SDBa?=
 =?utf-8?B?cExtbGpFc2pSUTdYMThCeWlOand6QXk2bE1OMk5iNE81K29BbHowb2ozUmNX?=
 =?utf-8?B?cmdOSG9HMEZsWjk0RlFLdU1JZFYrMGdIRkJacWVtWTZYRUxaNDRIWmpGL2Rk?=
 =?utf-8?B?emE0eDNzMGgzT0ZxaG5ISmVOeWxHRzM0a1paT2tiVEp4WE9vNWhiakMvalg4?=
 =?utf-8?B?MXhsV2l0c0VlRHRLWlMyTFVvcjQxdnFsVHIwY1dlV0MrdzVCcDNRZjhNRng4?=
 =?utf-8?B?dUZIek43bkZPYjdXbzVNdzU5aGY4eXhWVmJxZWhmV2JIWXVoSFZ5MGR4UzhZ?=
 =?utf-8?B?Y1NMbjRGejBNVjhQYTV3V3pHcFZwTUQvYTZPM0VRMC9rY1pSbS9CMnZ4UUU1?=
 =?utf-8?B?QXhTS2RZZ2lYL2ZBcm1Zb2NTS0dtcjUwQi94N0d6RU5oZzIwVjZ4WkVLYUZY?=
 =?utf-8?B?ZkdiSW84QnVKdnM3eEZSNDJZSDFhZ2Qza2U0dkxZZ1JpMGZhQ0R4ZUdYWVU1?=
 =?utf-8?B?cTFsbnNlTHltYjNqMmhRV1hmOU1LR21ZQVBpazluZ3A5R1VSa3pmVkJCOWNL?=
 =?utf-8?B?SVUybjViamNhVWJmSEMramNJMTZRZmpYbmJnQlA1a2E0eVJFVUlXZUNYWk9O?=
 =?utf-8?B?emlyVWI1dDdPeEUwMGRkMStlR25ETnlhcVlaM2lCZHExcGFWOC84V011S1Uv?=
 =?utf-8?B?ZzgxVExnK0ZudUJLd1NhYzNDbTlEWnlWMlZqdGcxSmRldVh3cU94NGU0VFk4?=
 =?utf-8?B?cUw0K0grNHJGTWdmMGRDZEVXUXE4ZU1MTnNuZzR0VWEyWkt5c2R0cmNudmZX?=
 =?utf-8?B?UHRmY1JEaHJvWm1LMlZaWk1VVUIwdlU4WjlvZEM4TzQyN3psM3dIOURULzZC?=
 =?utf-8?B?eFAzNnlXTjRWRWp4VzdHbFlGNndScEs5bTZZZFNEOFk4OXp1U2ljY1I1L2tB?=
 =?utf-8?B?SmV1RFNQVnQ4bDFERmt5OXdJSURVZzVBeE4zNnVuNVlhMVM5RzJBOEY0d1pH?=
 =?utf-8?B?K3Q1K2hVR0lPWVoydkpjM01zYWQ3eXlEK3EwTFBxM0ZXY0hDNGtqQlZZUm93?=
 =?utf-8?Q?sEYH6fxu0ICEH/wotyTIcdgmxBoRGWkr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0lwaDNySy82OG9UK2pwdjdlQ0NMRWdOSUVnZzVDbU1uT21KNXlwTitQVDg3?=
 =?utf-8?B?SzhpZEk5d2pzQmVVdm8wZ1Q0TmVGQ0cxMUpwMkFYRUpLTEJGTElVZGNjclA0?=
 =?utf-8?B?UmtoLzkybWxialU0ZjZNanJ3UlZ2OUtmdWI0ZGtnVFpiRnlMZXBucWRYK2xs?=
 =?utf-8?B?V084YXdMMnVEb3VMWlFsTzgrenFRdmk1RGVWSFJtMmtjRGV2R1Y1RDN3Zmtj?=
 =?utf-8?B?bXl6Z0ZWTDUvVk5UMjN1ay8rYmlER3VXblpZL3JyZk9XdVhWVmJKbHFjUTg5?=
 =?utf-8?B?THZwUnc1MGtldTFzZFlFVE1PVlI5TXlDNGEyR3MzS0dxVXZLeVNXeXFYWjlw?=
 =?utf-8?B?dGE0WmF5cVpRUFdTQjJQTk9zTkFkcUtEcmFFbE8zZ1g3MUJMaitwam1QSTZo?=
 =?utf-8?B?b09ZT0dWUDQ5Q2I3SEZJb3BES3B6QUVsYXArR05Kb3RVODMwRUxqTXRidXpw?=
 =?utf-8?B?ZzhzeEpST3N3Z0hHSGd5cEZtSWhnclE0MnJlSkx1WjRjQkhsNnVSajJpWjBW?=
 =?utf-8?B?NlZRK2ppWVhkT3dZbENBQjBLSEp0dmw1Ty9DV1FRMlRrWjBDZ2p1WGczSFhK?=
 =?utf-8?B?MmlwZGZ6VjcxRW5OTGdlakpGYnFzWmg3clBqai9NNkpCS3F5UkZXWGFrN3Fu?=
 =?utf-8?B?ZEZzUjNQamVMMmE1UXZVZzJYTkp3S0NVem05elhKMi9DY0ZkN2p4MU9Ibldp?=
 =?utf-8?B?UG9LRURQNUMvQUdiOUxXU3dUTGJhd1YwajhZNlY1K3Azc0FoZkIvbWcxY2tC?=
 =?utf-8?B?RjhLQmI2d3V2Qk45TGw3enorOWFUMjBpUFJOY3B3eWFVWmNod2hiNVlTRVZQ?=
 =?utf-8?B?dm5ORlptTUZ5ejl6QzliL2N6VDMvQVZ4cmVuMnREUTdxd1pOVEtNcWFSU1ZB?=
 =?utf-8?B?UXJqemhyMGM1d25lTTBLL1VnakNQZExkbEwvMWJhV0NQR242Vit4eUhXaGJj?=
 =?utf-8?B?SU0xZ29WSHFFR0FsTm5kTEtyanRUaUdUbjJOL3FyWGIwVnRWS2sxd1BHZDlj?=
 =?utf-8?B?b1l0ZUFoTzZXMWkxOUtJMUlHa3QzVVpkZXU3QUYrNEd3djQrb25ROW5Qcith?=
 =?utf-8?B?YWVvN1VqOUF3MVJCZ2pxei9qS2xQNnRBQjZkUzNobnZ4ZytrSEh2cWZrTjhh?=
 =?utf-8?B?L3hLaUwvNFcyV1dZcU56NDROU3RucVp2MlNPVlBueTVadE16aSt6Rml5cEl0?=
 =?utf-8?B?Rm8wOUFUS21GbW1uaDl2N1pBY0k0RWxGTVhiT2huR25tV2FNaWlKTEFHSmNY?=
 =?utf-8?B?VVA4cHR5QXhxRCt0MklLN1VoZThKL0pOWmYyai9mZmgxTkFPY3JJdUdmU0FR?=
 =?utf-8?B?Vjd1QjJiVGVoTklWYi9nQTR0ZzczMEtwZkcwT3lrcmJ3dS9OREgrR1FKck5Z?=
 =?utf-8?B?dWpINlFLMXhIM2VOdW5XMTVYWEZOaHB1cTdsckkwY3hESXpKZHBPaytXL3ZI?=
 =?utf-8?B?Z0ZYU1VNd2F4MDJUU3NZSUpTZG9qcWdDZGE0eWxFWjd1Zno3TTBkd01NRGJt?=
 =?utf-8?B?c0VGNFY0a3JBSU9ORStZSWZmbCtlZDRka3VYOHlSekViV0hMdlNBeWdUYTds?=
 =?utf-8?B?MFpvc0NIU3F6TlF5V3RhcXRnK2hpVjVJQU95c0xsOUxXbHZWWXlyeUF4dXRo?=
 =?utf-8?B?N2RCc0Jvc2dRWkN2c0xRTCtueVRHQ25qbEtwbGNFQ1Zpeko2cE1STlA5cnlT?=
 =?utf-8?B?UytmeVhNWDBXWVhiczFZaUlrMyt1TklJbUlNSjlERVdUUjlUYysxZU0zampY?=
 =?utf-8?B?TFBqaUkxZzhWdFA3amVxaUlsYmRlS01pN0lwS0FvOVpYSy8xaFNrbXgyaVZp?=
 =?utf-8?B?TFRGT0RjcG9MYk9peW5yYmdqTnpXL0lHVFBZWmNpb1Y2ZlNoVFVuQXZWVGl1?=
 =?utf-8?B?RHArY0FOSjlhY3Y4aE82bjBLc29CQW9LWjZ0SmI4Qm1peDNVTUhLT0R6VzNp?=
 =?utf-8?B?dVh2ZXdsTWt5SDlUM3dVaEFlUDNML1FsNDY4L2ZKSE9UWjQ3VUpJelkzeUh4?=
 =?utf-8?B?bUV6WlFwQW1pMmRvRmlXWkhDMnVYd0ZsQXUzckM4UWtKK0FPa2w2NjF3Qmtz?=
 =?utf-8?B?QnR0cGxWNzZVb1RldllPSWdVWUFSRHA5Uzc3MklRQ2JYRHNyc252RFNia0w1?=
 =?utf-8?B?MHNEQnNmUWhhcFB0VFJsbExOZmZGd3E3ZUZQRzNYU2VVZDhwUE5GSnRHdXkv?=
 =?utf-8?Q?LA3b6lW5dtthGv9RksTJ043xVh23Zo3Ty5LRDP8XNufD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab770dd-4942-4c72-536d-08de137bc2d9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 04:05:40.5599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hczcjih5dZeQTycsbdeEZTG1YEngUJdbPnBuZyW5q4jpWnfJK9VncQ3Hg6LwQno0mHyAJQUtsSeDwfiOOPHftQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
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

On Sat Oct 25, 2025 at 10:20 AM JST, John Hubbard wrote:
> ...which is sufficient to make Ada GPUs work, because they use the
> pre-existing Ampere GPU code, unmodified.
>
> Tested on AD102 (RTX 6000 Ada).
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Thanks - staging for merging soonish.
