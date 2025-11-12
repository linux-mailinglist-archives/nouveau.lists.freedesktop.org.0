Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB9C506B8
	for <lists+nouveau@lfdr.de>; Wed, 12 Nov 2025 04:36:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF8B910E17D;
	Wed, 12 Nov 2025 03:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k50I2Lqg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010065.outbound.protection.outlook.com [52.101.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B5410E17D;
 Wed, 12 Nov 2025 03:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmk54+OM9aAGScK6Q6VNI2PpzxN2e5CZ0V1XCDkotJd+5zAF50MGWL8FEpaAlNPbuRbEEmzxoM2FzN3pkhP5Mf28kVV9mh259TjMqIJEytLHnjIdE74n6faEASjV7e2umm4ASb2SYPS5ib8BBg1mF8uyi10Mu5VerVqRVJGpKnELSe4vsA4pBmKpTZNiE+inkLP876oaErX2pLTkuRoaeE68FHWddtQBn04upO3Z5xuTQVDD8JLJSt9Z4acNyLY4Mbc4OyhOX2hOEfWKVSHFpu7ON3ZSXVoTmNMj/kXTIg/RJib24tAm0WkX8nlMmXnIKMIN7+kpRDBsstjXdgWydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCrP+TcJJ1MdaAQvXBNbHK4aNxiQHQDwnx+qiicoqgk=;
 b=zWKPT4h5If/Y/lpxc444hkKWeSy0JEp/I0oxVRTkHTbsXRuLxxyw355TYGn0KHOo5x/SDzsx1Q7Cb0hYE4/If82VDCupBS9OFHUzG+ie8LXdMrDVM2UDZ+IsYAiAyCk3UbkOuT0v2wVC07SEka62wDoXfjD6N0Zr4Cec5BIY3frX8C7PDxB0KYQ+gbyzAbBW+8VNux7wI0y2yTqcjXuc9jGCPY0GDA0mmMPnp7PdQnJ/PZdPwrmkUby1AUNtSeaW5j5D97qMPtKUrQfmbQ5sh2gh1CHRRDzxKOLGoYcWu/9aIUUnhNIAUff4ImQJkNZv/M9biMCh9AstSalNUd21PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCrP+TcJJ1MdaAQvXBNbHK4aNxiQHQDwnx+qiicoqgk=;
 b=k50I2Lqg7F48ebr11b7orv2ckIKMyOvH2X+E67yfRJix/DWwCo2z6aqzLBuD8O2BozhcSM691L/lp+qhM+X+5rHGOOUNA0R6zEJNna4W17v47QB1DsDs84dSqzBibRHbmIEMlbxmsECWM5KYOeyr5BxAkxu64Ca9KNgZ6TK2kj37YORf5f26oy3sE7KdolCiGM1YiBtaf+R6aK8SsC48Vyd9ta7rsdy8XWpEyiU75THuUjbLNfxfdo9vPP3j3k0tHdAHmU3EEoW4zIIW84YN2R63+xsV7cePLtKTie0ObkcdbP5N9BK6F3MAhE15JSNVIu4HN1dUnt1IH4WveIIr7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY1PR12MB9603.namprd12.prod.outlook.com (2603:10b6:930:108::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 03:36:45 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 03:36:44 +0000
Message-ID: <853de693-8ad1-4b3f-afa0-51b22b81a295@nvidia.com>
Date: Tue, 11 Nov 2025 19:36:28 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-4-jhubbard@nvidia.com>
 <5342a0f10a3e9ef7d3165bd8912bd042ae7f68f5.camel@nvidia.com>
 <05cdeb51-2731-43f0-b24e-53534b524a44@nvidia.com>
 <DE3ADB75TBUH.3ROHW8XJAC6K0@nvidia.com>
 <a8cc96d5ae80a256b9e0101acb1d1b38169d21b4.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <a8cc96d5ae80a256b9e0101acb1d1b38169d21b4.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0090.namprd03.prod.outlook.com
 (2603:10b6:a03:331::35) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY1PR12MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: 23600149-a622-4ccc-a620-08de219cb395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDE5YWhWZzNsWHA2MGRLRFpkRkQzWXo0K20rMHViajhqNFhObW9Qb3N1cUFo?=
 =?utf-8?B?cjNkSEoxR0E3eVFpWlI1Z0RsMVdoWmRTcC91Nml6b3FDaHhjRVB5ajljdHgr?=
 =?utf-8?B?dU1uai9oRjIyWkplcVU5blNsSGxNN2xrMCtOWDlCSVZVbzVpTHBwVkl6VjVt?=
 =?utf-8?B?N0w5eVp6VTlFekE4Z1Jialk2RzdncktKNU8wWjYyZzdmMHRvNCtCaUFQTjFh?=
 =?utf-8?B?aUNNVENtN3JqUlZZRWQ5UTZNak1ycTY3enE4bGt4WERMVm0zTmZHV3MyNENC?=
 =?utf-8?B?QllkS0FHdmNmZHJWRit2T2U0cmFHZllKK3dUcUNCc29JVDBybVpLWm1SWFM3?=
 =?utf-8?B?STFYUklSMk9vUnFnT29rWTQxMVJVRmNXRUh5YThLNlkydnNYQjRFZkREeDVL?=
 =?utf-8?B?MkV6eFpRbUwvYUw1clZEZHBWZ2dvUFRtNmhBdjV6SENmQVRkZnB0Qi9nZVdq?=
 =?utf-8?B?VEZpUEQxWVpYZmJqK21Yc3VZd1ZMbUZqVms4L1dtUnFkZ1VabEJJSE1YSytu?=
 =?utf-8?B?WmJlMENCLzdjV284MEkwc0dnRTVSRFNIdXhqWlArdmhnSjVyRUVGOG5MamQx?=
 =?utf-8?B?dmpxR2s0VHFFOTR0UnIwZXYzUUlZcnhZaXdoMkNROUFaZE1pRC96eDgvNGMx?=
 =?utf-8?B?NXRFNkV2N0xNaDBJSzY3OHM1R1BGSTlIVDVFQWJXUENvZG9hcmZ5a3JNUnBI?=
 =?utf-8?B?Ri9xdXdlamlwWm1VSUtudFNyVWd5UmVIYk5tdkFEbVQ0OTgzUG5ZeVp1NFhX?=
 =?utf-8?B?VjhSS2xsSWh0ZC9rdmxzUjFiUTRnYzZsdFBGYTBpbysvSE5ucUgzQ3BsT2JO?=
 =?utf-8?B?ekU3SUM1Z1FBOXRNNWtybEpUVkdFN2dMTVd0RDVBYWJEanl6RGVSRHZZcHZh?=
 =?utf-8?B?N0UwNXNHNVFZNDQ2eXJPalMwVTJDVFd4TW1IdEVhbEhsQm44L2M2R1diWmg2?=
 =?utf-8?B?SkQ5UW1SUjhNNU1jK1lPdFVISmorLzVBMFlxSjVTdDQ5Mmt4UUFZL29JTlY5?=
 =?utf-8?B?cW5BWWdqU3FIK29CQXI4YnZJT3hyQU52Z1lvcG8rbFRJdEpwcFAxVE1ieldt?=
 =?utf-8?B?L0F2bkJaMTVXN1RtaGdDcWZtUlBwQ0pOamtmMUZvYjdUZTNCcGJ0TVFQWjhC?=
 =?utf-8?B?QWM0Qk5BZkRrMXUwdERtSERsZ25oL3NSdmlQQmN6Q1M5ZWc3QTNPN05TOENp?=
 =?utf-8?B?K3VWOEd4MnVlelZET2dnSE0ybHRlZTdnTU1LeWtIc1BsV2o3WHFyK3NoaUZt?=
 =?utf-8?B?djJSdUNZS2pZbmJYQjYwbWVJMjd6MVdQckw1MHM2bVB6Z3pCTXJYUHg5c3px?=
 =?utf-8?B?Y04zWnczSnM5YjY5clRIV3c2bXdnVWw0R29NRmd6VytKeTNSNy9ieW9YRDE3?=
 =?utf-8?B?Yy9UMDNLbkRVR0VoOHpIWlgycENNN1ZQZHE1bktRejFuRWxZUWVhTjA0MTBB?=
 =?utf-8?B?RlhTWGpLelV4bzBDclhGbHhUSVl3dVVUVkRaSWhCWHBqenpyQmh6RjR1Unp5?=
 =?utf-8?B?S0IyRm5uVTFCK1pGY3l2c0VrM2tQWVJ4aHdOZ052MUVJUWQ0NHNCUXZPZGIy?=
 =?utf-8?B?QVovNm1haDJUZnQ3Y1JIQXBJZzJvdTBTdGhkMlFQMVdzVmxEQ2RvYU9jUW94?=
 =?utf-8?B?bDZFQlAyVXcyY1RtQk9ES21VUUM2ZTVJWTJCdnl2MzdSMms4VmYwQVFqaDI2?=
 =?utf-8?B?cjVOUXdLbi9HV2FWN055VElWMWx2R1VlVitnY1VvTCtGeWFMaGViRHEwSHVD?=
 =?utf-8?B?NXJkaklJMzRVQkhEMjIvcDdoeEFrWXZuOG1zM2ViTDBnWW5pMHBkdmtJdmFR?=
 =?utf-8?B?YUw1VzU2b3VyUEFKUDIrWWFEakVmQ0xSZEEwdnFycXIrejI0ajZDSVYwN0dB?=
 =?utf-8?B?a0NKMDdlZytqMnpncVRqYXBVK2xSTHM2Mkkwc0FNV1lTOTd4QjFWY0YwcmxR?=
 =?utf-8?Q?X+NdAER+8AKW9qrLnftQCkO/Faq/1a/5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHcwcTlkZmNScCtCZUlqY1RHcjQ3QmMxWVRDSlhQbGtLUFljL2lranl4d01Y?=
 =?utf-8?B?bi9WNE9PdmJBdzZKeVJQTDRjWTQ1bW9XQzRVVk82K1BTa3BkL0V6NVpsVDNs?=
 =?utf-8?B?UWExb3VFbG9FdVVvMXRCSjRySEdtN0VzWlBGQURPa21VbUtRSlZOek9vbE84?=
 =?utf-8?B?bXpZQnoxWUMxWS9PMW5sRjR2YmNkb3BWSExoSk9nelM1YXNDdzRCbDRvZjE3?=
 =?utf-8?B?ZDJPREhiUlFGbHZ2NTgzbFJIemdNY1U4OFlXRFY4M0ZXZ0xEQlRJWnlUUUFV?=
 =?utf-8?B?MVFya1JsTzdybnFhSVNUd09hQVN0OUxMaUl4RDIvaXpveFNWVlZ3eTA0c1hG?=
 =?utf-8?B?RmllQmpUa3Jtd3RsUTFSdSsvQkZuNmM4cFZlMVlGTERHSllid05pZWtXSndO?=
 =?utf-8?B?Ym1mSTgyUURVemtzeHZVVGxsYzNPeDRmZjZqdWhUU05ZR2prT1R0VEVTR0pX?=
 =?utf-8?B?TzFSelM2Nzl1VnlKOXc1RXNqdUNwaFhqT0dvL2hGRkdGQXMyYXpsMTVtYmZh?=
 =?utf-8?B?Wk5BUzE3VWp2c3dsTXpMd3pkRHd5THRFNnRzQ1dRcWlWR3BFNnVSeWgxNEpU?=
 =?utf-8?B?TmVWWTN0OW02K0t3eXVRQVFBOTVXeVI1THE3TzdrLzVhMGFwYnlYUHZOQW1S?=
 =?utf-8?B?NldDOGNTMitPekpiQzF3Y1loZk1RMEtNbjFWWlNxQXAyMWttdWRERG05NlE3?=
 =?utf-8?B?YlpBejhGdlNQUkJ3U1plcnJNUm82S2c0d1prMGpYMytaYTZSOWdYbEw3ZWFq?=
 =?utf-8?B?YlFleWtOYXhWV25sOUQ0cHN2bTFnWVBDcmRuZTU2MzgzYWhHbnNKS3BDc0Iy?=
 =?utf-8?B?clBJQUZmcXFGeEQxczZDdzlvZVpsTXR3UHBZL2c4djQxdHY4am85VUFKRlEw?=
 =?utf-8?B?L2NLNGh1WGNGOXI5SHhYN3pqZGFZelZrNTA4dWV4ZmltMWE3bTRzUjNTUE1E?=
 =?utf-8?B?Vndlc2NjT1pEaTBGVWdXZjU0L3RqRks0TzBPUWJkTHJ1SHR6WmEzcWZSdEFm?=
 =?utf-8?B?M0tzbDZVNC9TbVRoZE41Q0JKd2RBN1JJeTVIMXIyMklJdGhGeTh4NW8vT0tS?=
 =?utf-8?B?VnJTREFzUFF4SXI1blI0VWVoSkZvbmU3a2p0dzJVUUV6WnZSZml4cHhZNW9l?=
 =?utf-8?B?TnBHUWN4SDlTdXBhLzlJaW1YaGVVSEQzaDdUekpRemM4b2NJSUVhSjR1R0Zz?=
 =?utf-8?B?NmVqWmsrTjdEaVRXQnRhMW1hbzN1WndsRkRUelRRQVUxRXNTaVBValZhYkhX?=
 =?utf-8?B?VE80K2VEQjJEUGt0a2JNM3RkU3J3L1RBRVNoY01JOVF4KzhJUHUvLzVNWkEr?=
 =?utf-8?B?eHJDa0JQTWEyemQ1UTFQWGQ3OGxTeTZVZWlBNFNXbnBtcjVMSERYS0FlQXo5?=
 =?utf-8?B?Wk9RZFRmcHh4b2kxZExTekc4cVY0dS9hME9WM2dLbVE2MjNXM2ExOU8wbjho?=
 =?utf-8?B?K0FKcVJ4QkcrT1BHQWl6OVpqckJ3UVRWSlRaY05FWHJLOEw0c1JwYjJ6bXRT?=
 =?utf-8?B?MnlpYjRadzhGTm12ZzVwQWM0eHBQbXhDOHNoMk1YbUpGajc3QWZHenNlVE1B?=
 =?utf-8?B?eW9oTkRIK2kxMVFoZnVBZEFVbUxzUG8vWkwrU0hyQUFSSWZJaTEyVlBaVlQ0?=
 =?utf-8?B?L2FtTUZuWXFUQXF1OVRJSjFob2t5ZHkyMEpya2lmYk5VZCt5aWFGQ3Y0RUhz?=
 =?utf-8?B?TlBZWGRwcmpTdVNpcU1aZmZMTFc3ODlXeldYOTFOaVc2S1hLOVR3aWhyR0dD?=
 =?utf-8?B?QldvSDUrT3FNelJSKysvRjFPYnNNNkQzUUNIRjFFb2JQUW9Jcll0RzhBUGhQ?=
 =?utf-8?B?Z0dpT3BpVWRWclJ5dysyNnExQUIrME9WcXVUUVVoTDB2NXc1NzJXeWFjZWpZ?=
 =?utf-8?B?WTB1WVJsTWJDdk5qeUlEb082UVFhYkdxRnBJYjg0Q0l3UkNrZnhrL0xrWmUy?=
 =?utf-8?B?dTkwTm1vK2J6SSsxQWtNL0NHa0NCUm94WFdJWmxkdkVycS9mTDJDNGp6UHdV?=
 =?utf-8?B?eHI4OXVxMVN0Z29veVRDdlRBVHNrNm9PTGF5UWdJZHRua0NCT2FMZmFLWWxO?=
 =?utf-8?B?dG5udDJCT2h2MnhUL2QxUUQwaVJKUzAxaU9mK1ZpOXlEL29UMUR6OUhMVTBQ?=
 =?utf-8?Q?d0R5fFBhgrD2ih/Ky/vuHPgEl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23600149-a622-4ccc-a620-08de219cb395
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 03:36:44.7304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hkfm72m5WwlGQcLQxY1L63Z2AJhPNeGUSaea4wgeTZKLTHVgbq9x3cneiAhiLntxzZ/KfLRvZ5qFkPKGBh8B5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9603
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

On 11/8/25 9:27 AM, Timur Tabi wrote:
> On Sat, 2025-11-08 at 20:45 +0900, Alexandre Courbot wrote:
>> To be precise, we need to supply this because of a shortcoming in the
>> `register`` macro: it doesn't support read-only registers yet, and write
>> support requires a `Default` implementation for its fields. This is
>> subject to be fixed in the future but for now we need this little
>> workaround.
> 
> This definitely feels like something that needs a TODO comment.

I've drafted it this way, for the next patchset revision:

/// Enum representation of the GPU generation.
///
/// TODO: remove the `Default` trait implementation, and the `#[default]`
/// attribute, once the register!() macro (which creates Architecture items) no
/// longer requires it for read-only fields.


thanks,
-- 
John Hubbard

