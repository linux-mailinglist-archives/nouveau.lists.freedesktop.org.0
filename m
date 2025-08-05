Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85388B1BAEC
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 21:26:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD110E2A7;
	Tue,  5 Aug 2025 19:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MEjU8bHU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061.outbound.protection.outlook.com [40.107.94.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA0010E2A7
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 19:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xyn8vCHethTPC8MQUJ6J52JU8f870tcSuKSOu/DZ9sARHQrJAE+ZQi5gvaPb5Hb/+JQ8x4rwqhceqArGHNiSSZX2yzUPvAqbkFaXgGXeiorvfnEyACRJQdIs0VNkzk6Gno76udeINLwhlLeEcBiW6cH8E+hYSzWEqutBKkBEQ1JoXPJIhOACcJgSIPfwaafFFzRVFTnJqd8f+PI6wW4fxk7o35jPthTDQ6EV185SzA84oKqnLGcITVCiOK10pD0CcBV6M9Pgcp3v0Te0SblVNTJbUnoCCD3s/XgQIxaSJ+fNYHcnhPoMpstg7dHKZvnVtz5YeoNIdN4DchS4fs8PRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR38dvRgd6Vktt+8SgJkWG7CWj9TG7KlP9aRuxV255Q=;
 b=jyWaD4cqkdNkWjdBOGEwPZfZbja9DxqtfTIt9iOAbJ3pITJTkffbMMwNznGzqf1gpBdrIxye81ILnEIzml6aDEgXA75SwEuPQIH/XoBUmHaQR5bEcOe/UNJSABTx8oFIQbNnAIyWKWtRHN9tJpEwy2JDoI7/q05FKDxsfc145IJU1uY8g0mDqe0r1ytoZ8ncWNkoeQ7t6dcX5TxPeK0A27vNBS/Rw6T1M8Pun09cDXm81oESQYSDIDaZXyjhxSYJQ+HJRdE6Jm/Q9I7pbXdHJJ8szB9yEggctwZxZz8d6CFQUfZzYm+pVhHk7wOv1PV61hVwlmIPdMt00BkDSsEXxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR38dvRgd6Vktt+8SgJkWG7CWj9TG7KlP9aRuxV255Q=;
 b=MEjU8bHU2nx6pMx2Uw4DwVBCzJyoUXyrl/xlGxr5SRNi8TZTWE0iRUXur/F91G9u8s0LJOzceL8wOIuKmT7J6EyrJGO2xxsdwVJZfG8JwAx9Uiny/gDEyuVrDo1wkbJKmx3KdZXjDCqGzMx5XwJjerU7yaXC3mBGtaOo4Rg6SPjjxXrJY9XSmoUPa4WMg3P0bhHmYkiLpVIYGXAmlGpVqhi7wiC97rvw8m9NPOLVTNgUz8t1ZbaHuTMpuL8QoYL5WkOmIOEjIAGEyJRqxgjKKtyLhCd77yY2/1sF9Hde7pP8MbjV0eesOFdlcvgJQT2urTbj6k4n8HPFZR3J0bjXGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 19:26:30 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%7]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 19:26:30 +0000
Message-ID: <cac21970-e2aa-49a8-ba25-7b41ffbc05f9@nvidia.com>
Date: Tue, 5 Aug 2025 12:26:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] rust: add `Alignment` type
To: Alexandre Courbot <acourbot@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <CANiq72mEDhT_OvSo1b=z4Z4VhND8+DFzeGBY_NNfXhq9jy5GhA@mail.gmail.com>
 <DBUJ19RTU4F8.2XAILWW3HMAWQ@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DBUJ19RTU4F8.2XAILWW3HMAWQ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: bed83b5b-25b0-4e0a-3154-08ddd455faa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXQyQUUrTjFqVzlGQUsyT0dIWVFlZDE0ZTkxTkkrZlJ2RzZqdWhzd3UvRUY5?=
 =?utf-8?B?L01oclYvOUNvOHhYTnVCMysrR2FIWW8ra3RZTS9uMWpyWmVySUE0OE5BV2R1?=
 =?utf-8?B?RFYwcUs4RDB0bHVvMHJpQnltN1poTEswUHVKZUlOSElWTW1HcmRnQ1FCM3Zl?=
 =?utf-8?B?U1JLVWFrb1VyWjRyc2xWK1pOU2FGdTkvNEl6ZFlDYk5zdURKUUVBMExzL1Uv?=
 =?utf-8?B?NXBMTmh5bUhEVUJRL3JyTEIvT1BrVG8ybWV0SHkyMjFPcjNQdnhKZGJPdllV?=
 =?utf-8?B?ZUs3Q0RFb2s1Zk11VlE3UDl1WU10VVAxbWtjZzA0Vk5Ga2UrczNGL2Y4cDZD?=
 =?utf-8?B?UzV5Sm44TUdwYnF5TDhKb1d5MUJwbjFhOHpQOTdKQzdGbG02UCt5RzFOMGk0?=
 =?utf-8?B?ZmloRVhZengwemlpaml0V2hWWk0rMGNrWmcvUEVyeFlBekcrNXlSNjQ1VkR6?=
 =?utf-8?B?bmM3NGVqdjhpd1p1NUVBTEFMaDJvL2FucVpBekNLVGxqRzZhQWFydWZlYXpG?=
 =?utf-8?B?OUhBR1VMUktjVXFWY1VrN05Zbm1jbVJhNmk1QjhCcDhEakZwZ0Z2aVY1YXAr?=
 =?utf-8?B?T01vb01Na0w1eHFvbi9sNmNjY2Y4Rk5XZWk1ZldpTlF0eDFwRklqR3M4bGls?=
 =?utf-8?B?NE9UVHNmMFZMZ1dScGprZ1VLdUJBWHFVeVQrSjRJbjVYdTdyZ2VYdWpvZXFM?=
 =?utf-8?B?ZjFadGpUc0VzZUJMRWV2cFJ6VHY2b2xRbzE1SmZsTElmNFgyalg3TERyME5Q?=
 =?utf-8?B?eFV4RjF6RklVM2JoL2VyeEVXZjcvQ0E0UTUySkNHRmlYbG9uZUZYdHB4WVRv?=
 =?utf-8?B?aStSc2xWL3FSUnN5Z0NxRVNlSVUwRFY1QmRjMW1VSHp1R0RsZld3VklSdU1E?=
 =?utf-8?B?eTlFOVdqK1hFSFFRT21DajEyVHFFbVhjcm5xVVlFeUROczRjbkhUcWF2TkJG?=
 =?utf-8?B?aWZHNkM4ZldlZmlYUTg0RWdaa2pRTXYva1RLMXFQMnB4ZVVwZTl1Tm0wb2Fl?=
 =?utf-8?B?OXNSTnczNGdma1BXNHZaRzkrT2lQU21FbzBxRE1Gc29VcEFSMDJpM1BIc3Rv?=
 =?utf-8?B?QUtaUVhsWDlHWFd5UDNmUm9NUkRhSWV4M3JQcExkZU9Wc21BNmFwMzZuM0tl?=
 =?utf-8?B?MFQ4c1lqeC9GSnpOVTlqWUQxZEU5M0lmd2VINHQ5TzZGZEYwalRhd3RPTGtE?=
 =?utf-8?B?dEh1SEN5aVc1cXVhd1hWR0tZZmo2ZnJsMFFLdUdYWE9zbDZ5TGcwNmZITnNm?=
 =?utf-8?B?OEFRK0ZHMXdRYm05N1EyemVSSlNpeWpqcUZOejR4OU1lNEF0aDI3aVlGREtl?=
 =?utf-8?B?aHFJK2dZOVl6My9vWXVKdGt5QVNOSzNhNXc0MGZLTXQ0WGYvL1lQSjVjVFBO?=
 =?utf-8?B?RU9BS2dqMmNod1A1WERYSmszenI5UitLaXQ1OEZvVjdRZExMTTc2UnhVWWJa?=
 =?utf-8?B?emdXY05wTkdZR0xkWG5ZVnJHcnVRcFVTdEM0KzJkNjREUmozZWFySkFnbzJi?=
 =?utf-8?B?b042K003MkdRTFM0Z3JhZmN2YVM0c1oyQ05VU0FxSUR2RytGMU1LNno2Uk00?=
 =?utf-8?B?VGRQSzRTV2JyOTJwRGIvWW91eU5ZZzhDeXZZME1nZjYwUDl2OVVDM2NjTExw?=
 =?utf-8?B?cFdDQXRTOG03bjJ5K3diTzYyU2MzUDlra0JtbnpJUEp1NFlEOUxCVndLaXZi?=
 =?utf-8?B?TDNBQTYycUthZ3ZKQmIzV3hCV25UUmlpTEhFVVQ5am5ZVk45MVFYcS80SG9L?=
 =?utf-8?B?WWdjekZlazk2dXh2UHhOWUpQaFNJVUZjMTVSUlFlWEpFRHU4aG96N1g4MFpD?=
 =?utf-8?B?VHl6QVFlL1VWcjNDL21xa2VtWkxmUXQrKytqak1RdXhPTTdTYmlzMThrRDhs?=
 =?utf-8?B?V3g1ZWMrVmpESXV3YnoyQUV4UVVSUjJLcXZMOCtKM0c4NUFOejV4aW9GbkxI?=
 =?utf-8?Q?0qaFtqkhSH8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5968.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVgzR2dBamx1UysxOVk5SENWYkI0VzNCWDFhTEpoYzYxVVJoSkkwWFB6WUJ4?=
 =?utf-8?B?S3VPc1VWRGlJaVZ5MlVHd3U2U2RMOXlZcVhmbStORkNIR0tFUy9xdXl0aGI3?=
 =?utf-8?B?ZU9vSk4xcnllcDBPR3UrRk9kQmRoeUlCOWNOUlFsaDh4T3JOazUxOUp1NU41?=
 =?utf-8?B?eE9jSHFITHJOSmIwWUxpallhUDFlK0hWZmVxNXJocXA0cmh2cE0zaVlIb3Bl?=
 =?utf-8?B?OXFFRlUrTnFLYVI1MHhhaDdhTkRaa0l1Vks0UUxsQk1NVVZveUluS05mZGpX?=
 =?utf-8?B?MlN2WHFwMms4aHl4Wk56OUtkUHV1N3dHN1l1U0U4ZkJMckU0cTNTN3ZnQWdN?=
 =?utf-8?B?RnRITkVjYnhCMUVENkJXNTZmWkJaZ1YvRUdUK1R5K0c0dm4vcWU4QVQzMjIy?=
 =?utf-8?B?S0pSeVpQTVM2cktBcDM0RjdsSlQ4dEtDTGF5d3N1b1lNcGRYZWI1MzdjNFpD?=
 =?utf-8?B?andMVHBPbVBGZDlBTm1ROVMzdU8rYVR5NytTak5sRjFNWnpTTmJqTnhWM0x6?=
 =?utf-8?B?Wm9iL2VUdldVTW53eTFkdi9KcWJYUWtidXBPTnFxbUVDSEVTUVFndXNZWkxh?=
 =?utf-8?B?SFRDMU9jRVJmQVBJZWNZdSt4eGJHdkxYSTQ3VCtVd3ZuWlRLaGkwOUVOblE0?=
 =?utf-8?B?ZW5od2xkMzFPUm1IeTdSZ1hOSTdXdGp3TUt2aXFhYXo0NW5KZ3orVXpYUjFC?=
 =?utf-8?B?bGI4dGNwUDR1Vy93VlJtWnR4S0huaHRYWWVmMURQTHQvZXI4eG40OWYrdTFo?=
 =?utf-8?B?d0JMdWM5Qyt6a1RlallNWmIwaXVPbWVKS0tWeFVSOVV3VURSeWxkNEhFR0tC?=
 =?utf-8?B?VEgvSDZoUktML2JhMndDa0dSZzE0cXpzK2dPREt1QWNGcnM3d0pMcFFHb3hi?=
 =?utf-8?B?bGx6ZmJycjNSTmthcVRzQmxGL09JN3MxNUV5UldzZURPN1crWEMzK1Y3K3Fm?=
 =?utf-8?B?c3ZSY2RLQ2tLdUI3RHo2Sy9HVXBPRWhHQXUvQUFVeTV5VVhsRTlSb0YzdmNB?=
 =?utf-8?B?dnRUNEcwazRQL0JUdCtzdTNRZkJaMGs2cEpzYkxhRGlCSjhRdkN3ald5RWtm?=
 =?utf-8?B?OGdKci9TUmVOUllFMkRHRGRUMVdjVFR5dVBhWlcrV3hnZWVEK2hDQXZnTTVP?=
 =?utf-8?B?RWJ6b1VIdUNDQTJkOVVPdU0yeXF1RmlXRTJZcFppYjFiaEtLbktRWXIrL0ZV?=
 =?utf-8?B?NmZOYXltazdpMVFBVysvMDRFMGlOVjl6cUVMdUZPa1FVNkJrMjBSZERUb1hP?=
 =?utf-8?B?VHkzVEhOOTdUWXdFNlZ5VkczdE9CSkhLUXhTK1hhQTlPOG1DMUFoMDNRM1VU?=
 =?utf-8?B?WC9sbFFOWWJwYXp6SDNFWXZmcWVERjVRbHVIVXl1NzdMZG1YSkIrRVRpZGNG?=
 =?utf-8?B?R2VUSFBXSi9UaldPaTBZL3hXZWd1Vi85MHNoRzR4anhyR2s2bnBrUEsrVGt4?=
 =?utf-8?B?WVdSa1E3NG1wQm9NNDdFbHVJWDJaK3dIUGlibjRkQnhXblhLcTExK09hZHVP?=
 =?utf-8?B?UUIwajBRMkdOYy9Vei83RjlMakdGeFVIbzZGVU44Nm83a1JSc2xEa1lZbUc1?=
 =?utf-8?B?RkpFYlJPVDZaWVZVbUF1U2Nrd3R4aGpqUGM4QXdicHhFUjNlUjFoUjVEVC9n?=
 =?utf-8?B?SnlDdHQ2ZGhXRW05TDZidlZSMnc3UUs5RWpmVjczckxDaHNiSlRsVGVWVkha?=
 =?utf-8?B?WWVlM2x2U3ZRQWduZ3pkamUxZnIwSTNBbXF4RHBKMWRhajRVMnd1Q2YxeGJq?=
 =?utf-8?B?WCttdUx0OVJQQkJSZVo3c1RLUjMzZmp6WU5wZjZKWFNhVy8zdnk4TkUzYmx6?=
 =?utf-8?B?ZW9KWXZwRENSTFdDdVhVZW5UZ0tDRTI0K1ZhdTFwMnkvZThtV1VKRVZMVjd1?=
 =?utf-8?B?cVE0cDVnZHAyUHkyc3JwcVQxWG80U0w4QkdoVW5IbmlDNUFlUVpCS1BZd0hR?=
 =?utf-8?B?ZDJqa2pNRDVTdm44RFFyN09VSTh3WlVkazJOTjBPZG5MRXFwdjlFd0w2NzVj?=
 =?utf-8?B?Y0Z4c3ZadExuMmxNUjF6WVU4TGdPeG14WndSTGRIblVFR053RWJYMlRVSkF4?=
 =?utf-8?B?SzhXK1ZzN3ZobFkxT2lHbW0vT2pVV0EzSzhBV0U4cU5jd1FLWVpQWWticVJD?=
 =?utf-8?Q?oMiQapRlOut3BJV0HNQCR/vJS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed83b5b-25b0-4e0a-3154-08ddd455faa8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 19:26:30.1484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA+70kwjXw73u5kxaadIDhf1oyIW97BQe6YlUVRyBdVrf9d/w4m8ceisBN2+Cl6DAojQB7+rkybHjAxdbqpy8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271
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

On 8/5/25 6:26 AM, Alexandre Courbot wrote:
...
> This leaves us with two viable solutions: `Alignable` extension trait
> with `align_up` and `align_down` operations that take an `Alignment` as
> parameter (with the caveat that they could not be const for now), or a

From a readability point of view, this first option sounds nice. It's
clear, concise, and doesn't involve macros.

thanks,
-- 
John Hubbard

> set of per-type functions defined using a macro, similar to bit/genmask.
> I am fine with both but don't know which one would be preferred, can the
> R4L leadership provide some guidance? :)
> 




