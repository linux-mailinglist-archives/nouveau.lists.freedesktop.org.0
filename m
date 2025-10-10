Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAEBCDA66
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 16:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF81810EC3A;
	Fri, 10 Oct 2025 14:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zugy34+E";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012030.outbound.protection.outlook.com
 [40.107.200.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E124C10EC3A;
 Fri, 10 Oct 2025 14:59:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J37/+9sxC16dqzXaoEChXHji1Fv5a1VxzaeFeO77EYcjIP1mlS0TROkY4JRWaSo5Zfsk2gUj0XU/VJJIDNW9pRkMvA6zwjzRf1iPLGcYeBNKzD8QnGGwUP5Uk01cd7J+IbZhBvqI54Qlj4PSFbjg+/xLPFIfpz7JswL0N2vLoSUTJwa87JUO0KPU/jmQB4aJ2wkTooVloN1HeRNoTKhSQj6tu/8h8eFQGdYsgaWtg58vN5hVYF1MnGdpFgzZEhYkIougvuQr4tXkjT5c6vdphbeZQfoLaOpipuZ4/7Hld+Vm8CCQplipANjN3TsKz13N+l2C9+HytymzudeCceZtug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltrt+iyS4ikplJ+TI6h0KRm6gxDGy+XovtV5Z+VHUgk=;
 b=pFe1rebo6Hqzf+5bZ85Zfcqwt9f7iMLNUlheM9o5SsQGOiOuIiDnqa3wMPS4L95gALPeRdfbHrLzoI4p7yYyKjt81pwQOIxHpSwu5BK1GdpxW0Lif1SRZn2SyVjPGWxYo+G5YvCPz2p+oReqTSGTinGf7z6nM2syE928DRv6es27rB0tbFwIcAgPlqC2ZqvMJzAftOMtoIEOiOnceYSVr8jLZQvUROkSXH1S9R2WPtG0YaCuEWige6HgSjX3Y3If0LAlblVNd8QAqEQiyNvhZspCzhc/AnqxbTc3cxu127YX4qQc47qsHwI3+WO4WkOUzSby9O/B6qLwtXfN0mwcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ltrt+iyS4ikplJ+TI6h0KRm6gxDGy+XovtV5Z+VHUgk=;
 b=Zugy34+ETNy5YxVsqI+CZiFiRiBMNDBn/tZUv7Pcm8vfPxPoAHHrc2naB6GkPMZ7WvppGhpWzd6UAhVEaBaVC3ZyE5XkEFITfVzSupnU6VDaYOhHEqYlfYOhljeIRtqIzsiDXrc0RVKXLLbYbcpEiLjtKikbgQ4mA70+Jgz/ZNpOl0Two2le9CtB7TSOCrI3tprUizuPpnGchaa0Nf83Zemgm8cMjrZ0oryV+FejeyjrJDoeWhvvBWCO0xlZa450LYwfbVY51V7yIHElJS+mMkdefJCwcVFIzN/pkVJFOymlk7co20oT+Ny2n/FrCpwS2kGw39GbXKX4BK0OHdlxyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA0PPF7D094C5BF.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bd4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Fri, 10 Oct
 2025 14:59:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 14:59:07 +0000
Message-ID: <dc92421e-3768-4f0a-a2cc-cceb18f71b4d@nvidia.com>
Date: Fri, 10 Oct 2025 10:59:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Edwin Peer <epeer@nvidia.com>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
 <1ba060e1-a3ca-4570-a641-e1f09026b13b@nvidia.com>
 <D797D35C-C1ED-4AD5-8779-C3F3E0D6BC6E@nvidia.com>
 <DDEHY1VPGOVS.2P6V3S3GFIOR8@nvidia.com>
 <DDEHZGZPI2LT.3L27MTHN5QYYZ@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DDEHZGZPI2LT.3L27MTHN5QYYZ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0061.namprd20.prod.outlook.com
 (2603:10b6:208:235::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA0PPF7D094C5BF:EE_
X-MS-Office365-Filtering-Correlation-Id: aaa199a8-24a1-4bf8-1837-08de080d8fd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDhrUTNZbEIrNjl2N2M4SFRYM3Q1WDRuK1JjR0E3MnpQM09VM1RTSncrWGIy?=
 =?utf-8?B?YUtLZGFQNmtvTFVtM1VHVzRaRU9jT2FGdmJlOGVZTDdlM1JkSHZldVpTN3VS?=
 =?utf-8?B?Nm96Vm5yeS8xdVp1dmpaUTNzM04wWXlqaktaQ1BDdEpwVjFyOEpzZm9lY2J6?=
 =?utf-8?B?SG80UVdxblJqRDJNOVBHNXVSUElTMncvUDJ6RG8rZlpZSzhROE5jZHdyL2NX?=
 =?utf-8?B?R1E4Y1h1T2txT2dRMVArclNJZHYwajFub2dvdk9NT3R0TTJ6Z0Nmc0NrdWI0?=
 =?utf-8?B?Z1ZEVWhNWjlTY2wvbjYzbGk3TFVlcU5ZK2M1eTdMVWk3Qjd1eE1pN1RYUlhE?=
 =?utf-8?B?VVg2Yk9YbDMzajRnVmdrRlZjUklrTTl4bkFCK0hXYnp0VXl1S2E4U044R0tH?=
 =?utf-8?B?aFhaTWduWCtvMzJOWjA5eWxoSnFOSU1udkcwS1dUbmtDRllQMjRrek0zM3JO?=
 =?utf-8?B?dFgwYndqenNFZXk0dzBLYjR3TlhWQWZTcWxUVXJYRE1JNEdGZlM5ajU2OVhz?=
 =?utf-8?B?NlRhSEo1TGkwVGdDU3RDOXo2bW5SNW1Bc2F6bmMrVlFFMy9pYWhkS0ZUYlV5?=
 =?utf-8?B?SXBPS1FZZHdhNVQvaER6TjdDUyt6dFczNWpnc1puT3lUbWZJVlFwWXVyYTRi?=
 =?utf-8?B?ZW94MVJHbFBOR2I0c3l2UGpxT3hVellFQUNZOFRaZWZQcnp6bkdFbm1tcEFi?=
 =?utf-8?B?dFpkSFBIRVFmb1NMenBqR2l4c3pWZ2Y3dnkrRmxWSFJ5cHlHMmxCSjkxM3Nx?=
 =?utf-8?B?bndXUGN5emhMUysxcmRrcFlib3pmUmxBMjF2aEU5WVF6anZRVWp4UkxIbVhX?=
 =?utf-8?B?MVZMa1UrSUxuUmtHUTVKb1Vra2V3MmRkRXV3Qm96K0I4Qi9WdXNONEVlQUI0?=
 =?utf-8?B?YlhwbTZCcjl2M0ZaT01tS2U0TVJramRDSDRnaUtQMGhrN3JFbEVzUHVLQmlO?=
 =?utf-8?B?U0p0dzJVMTFDRlo5M3VtWFk2d2VRWjhZQkRCcnB3dldMcldSVzBTVCswVzBx?=
 =?utf-8?B?ZDczQWRieWRHaDhIcUh6QmFIWkkyZFBya2tYdWpIS29IdUN5b2tFcE5sV0Rm?=
 =?utf-8?B?UmZESDJCNlpENmhVdllxZVFuUFBqSVoxazhpY0g5UkZPam5Zc0ZCVy91bGwv?=
 =?utf-8?B?cWlGaGoxeUpBRVFTbGQrc2pPWFIrSmJOZkVSOWFGSkw1bUtXRkdJelRFUi9U?=
 =?utf-8?B?Z3FxZEtTTk9udDMzekIyWVl2YzY2YkMzMmNrSnFINDdqUis5OFYzZWFZalYr?=
 =?utf-8?B?TGRFZ1BEYmZGbnBWcWswcHdBV3ZjNDVvVnRzd1l0ZWtNUUI0RUsyUEJKbG0r?=
 =?utf-8?B?RERFajZUWmQrWXJWZ1A4Sm5OZVRMeUlkN25Eak12d2tRdktPS3BZdE9DNHdY?=
 =?utf-8?B?bHNJWXk0WW5zS000U1ZTeHVKVUNaNXltWDBuOEQrd05lK3dmTGlFT0IzWkVt?=
 =?utf-8?B?bEVycTNZYzdldUpLWW1ZMk5IbUNNRFZWaEx5aVNVNld2Q2EvYk00c1gwbFlx?=
 =?utf-8?B?cTlkQ2JtUGFGQ1ZkQXFISE1Da0FWckVnUXVlSjFsYkRFRWVHbEI1ZXU3ZTVl?=
 =?utf-8?B?NWxBaVVFUURTQXhqZ0dmTVZXdDlyL2FiSW0vZVIzdVA2d3Evd3owTWQxanZp?=
 =?utf-8?B?ZUw1UEY2UCtReHJYUW4xYTROVnNhRWpwdXdRaTVXKzV6dFFyQThkVUErUkZH?=
 =?utf-8?B?L0lVaDdMNmhhU0hoTHVtZmFWVW5lZEoweGNIZHVob0t1SnlTZWIvdmpES0JU?=
 =?utf-8?B?dnl4VlJhcGthUlByWEc4M3JPQWpVTnNmRzB2ZGExU3R3WGF3MnNQdDQzZFox?=
 =?utf-8?B?TlZKdXFtTnQ5bURXaDNZZ2lzN1J4WkluZkhDTmVDV1ViT083ZTM5clZJTDdZ?=
 =?utf-8?B?LzJOSlVYMWVZTHRzOFlkZ2o5NE1WNWFqR0VhdFd0YVh0b3ZHWmdGU1N2SmlU?=
 =?utf-8?B?VVF4WnR0UTlzSDQ4Z0dxeDJhc3pQQUp3eUVZdHplenFzeThpZ0pqVEVONjNo?=
 =?utf-8?B?T1lPV29DSmp2d1V2T0dMeXRHY05jMEd5Mll4L0ovNFVYVzZhMHFZVnVZRUNI?=
 =?utf-8?Q?le0MVJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjZMQ0xkejhoLzFIVk8xVjlIbmd3eDZnV0txVXN6NmNrMlBQWnRjeldLVUNY?=
 =?utf-8?B?TkE4bjkzdThCc2lUaVpDcWVXWTAyTmN3RjRaMjJGSXRSUE0yWk1XMTZMdEl3?=
 =?utf-8?B?S0JMYTF3YitldnhaaThJYzBEU01QT0RBWG9TcjlhZDlmKytBaEljVUpMMG9M?=
 =?utf-8?B?UUpQclRjVThFQWY5bkptc0xnOHVsV284elFJTTlhWDd2eWd5T0hFV1pZblNt?=
 =?utf-8?B?dW01UjFmSnI5bWdaYzFFRktnVFgzYjlYdDdyR1VaaFdoc3ZIWk9mMlk1Qngv?=
 =?utf-8?B?Vk55cDU5V1pkUERtK0JCSHJ2M0hpK0YwNFFwMTdabHVUSXZVQWlOOUpMa1dX?=
 =?utf-8?B?ckhjcEppdERMMXJQVzViMGVBZlNwTTJXZEpnY3ZYN2QrMUpwQ1U0THN5VGVE?=
 =?utf-8?B?S25xK09lWEhqeTBLdi9iWEtUUWFiRzJZbTB6ZlB1MG52dEhPeXBWc3N3bnpy?=
 =?utf-8?B?Rmh1c3NVcHZRdmFQL3J6cXVIY0xtcVlkeUZwbTBXQzJtaUJzVlAvbjdEUDVn?=
 =?utf-8?B?M1M4a0xmcDkxS2l3YVYxVFlVRmkranFMQkZsOTF3Mjc2d2NSNEFlOGVseGNR?=
 =?utf-8?B?UlRoKzFTMGxkMW1YVEJ3SGV6bnZYQnRoaFdLS0N6Sy9zaldFaDl4SVZVVVBO?=
 =?utf-8?B?ODZ4TFNTMjNIN0NzL292WVhBVDgzelU0a3FrZFhpbGxXVGhIQ1MvaUdkVWF5?=
 =?utf-8?B?YkRuckJzdENMQVFVWnZFVTdIdTYrN0w3eXlzRmJHbUhaUDgxZkxubEQ4OXFn?=
 =?utf-8?B?dGNydVVUSVNVRSs1cWVTYnR6V2lEbkF0bmxCZHNZNTg5Q2YyU2tsNmlHZ2NZ?=
 =?utf-8?B?L1NQWVNpTFFzL25QZC9yejZBcmoza1NjVWpaK1RzWlg4b1pCYzFtbTVvVHdu?=
 =?utf-8?B?bnFUdGc4LzRPWHltbFBiVzNna0oxTUVzeW5XOWlBbnJ0b2w1Z0JvSHNqR1ll?=
 =?utf-8?B?bWFGZkYrWlNpZ1lTTWFRT3hzWTZvejRHbXNyblJMaWNBTXNKSnFNeE9Gb0w0?=
 =?utf-8?B?U0MwOGJHemV2bU5mU3V2T1lWMjY0cnJtY0t6b3pXaHQyRFVscFU5M2xIRHRw?=
 =?utf-8?B?SkZkTVJ4VVFZZFoyZHo1MzlBbm9BRFBna0FXWVppVnpVS09WQ1VycTg5UVY5?=
 =?utf-8?B?Nm9IRTlVVVdKU3RIcHZYUE5QdkRMYUptai9TWWJKRVY5Y0twV3dFTEhhUTFV?=
 =?utf-8?B?YVV0QjUwNjE3MHM0YlRpOWY0ZWN4Y2kxb3l2cHl5RStKRWJ6ZnBJQ0NHYXBL?=
 =?utf-8?B?UCtDbUFjTHE0ZUZmMVdRU1ZrVUdqRm1qaWZMcHpjbHoyWXloSCthdDdCL1Mr?=
 =?utf-8?B?ZnBjSUdNeFVmcVBpQ28rYnV6a0hIVDhyY2wramZFM3Z6LzZqU3dFMVBHMjh5?=
 =?utf-8?B?aTJFK3pMVUYwZm5zZXpuNk16ZlhLMjdhQ3N4cDhlekw1RnpzSlFqR0M3SUZ6?=
 =?utf-8?B?YnZUcEFjOXkvcUVNM1B1VGhiUkdRWHUrb0xuaTRJeDY5N1FzMlp6RWpoRi9Z?=
 =?utf-8?B?SDhFcEd0UksvNjYzY0JBcFB4alZJM3ROUTZLV0V3OHVUZURBYzJmZWY4OFVa?=
 =?utf-8?B?WGNnc04zbHhBMk9oTGNLNmtZbW41cVV1TS9VSERiaUNuV3U0T0U2T2Vub2NM?=
 =?utf-8?B?MldyMUEzcHErT2JnNDNUL3NDaFZ1akNOSjJuWUMyQ1RpT0xNblAvaVdENjV3?=
 =?utf-8?B?L25CVmp2Q1pLZVlXWFdpdzNwME0zSDRObEZ0ZkRGa0krQ1RaYXNBcExHbDQ0?=
 =?utf-8?B?T3dHUEorcGtCNUVkUjBUaUl2b3JzVHNSOUJvZFBpZDJuSWhBV3VXaW05NUYx?=
 =?utf-8?B?V0oxaEpBZ0RWenlXSFF2SnhlTHIwbWJ4a3F0SEpmRVV3OVZ1OXRSY1RUKzZN?=
 =?utf-8?B?VWw0N0VJN0ZDUGxneUhJclh6cHpSaUJnaGpRcnB3MGg3MkVFbmNGUEtzZzIw?=
 =?utf-8?B?eFRpTUxTbzhPTGFoRzZNaHNjdU5pZ1ltcHBLRUcyQ0pmZVlIZ1Q3TlZ2V3pz?=
 =?utf-8?B?WHZyWWh4VVRDWmJiV3c4UTVJNUFuZnY3Z3pCaVNDSGNVWUp0NVZuVWl1T0JO?=
 =?utf-8?B?cHdSS0pHUCt6ODZqK2M0Nk95Qkh6a0lnZEFCNWREZEYzRjJ4NFJSUTQzVWxL?=
 =?utf-8?Q?fTabNwQyFzo25sPDKPk8yhVna?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa199a8-24a1-4bf8-1837-08de080d8fd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 14:59:07.6578 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZqVb8IKToD9Y6PvNZNXMJxQ3W8iItBtoGDcXTSTS8Y3eyN0FPClYId0B1KCdFAyfTt/TCdZvKXgwzUkXoCFpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF7D094C5BF
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

On 10/10/2025 4:26 AM, Alexandre Courbot wrote:
> On Fri Oct 10, 2025 at 5:24 PM JST, Alexandre Courbot wrote:
>> On Fri Oct 10, 2025 at 12:41 AM JST, Joel Fernandes wrote:
>>>
>>>
>>>> On Oct 9, 2025, at 11:17 AM, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>>>
>>>> ﻿Hi Alex,
>>>>
>>>>> On 10/9/2025 8:37 AM, Alexandre Courbot wrote:
>>>>> The getter method of a field works with the field type, but its setter
>>>>> expects the type of the register. This leads to an asymmetry in the
>>>>> From/Into implementations required for a field with a dedicated type.
>>>>> For instance, a field declared as
>>>>>
>>>>>    pub struct ControlReg(u32) {
>>>>>        3:0 mode as u8 ?=> Mode;
>>>>>        ...
>>>>>    }
>>>>>
>>>>> currently requires the following implementations:
>>>>>
>>>>>    impl TryFrom<u8> for Mode {
>>>>>      ...
>>>>>    }
>>>>>
>>>>>    impl From<Mode> for u32 {
>>>>>      ...
>>>>>    }
>>>>>
>>>>> Change this so the `From<Mode>` now needs to be implemented for `u8`,
>>>>> i.e. the primitive type of the field. This is more consistent, and will
>>>>> become a requirement once we start using the TryFrom/Into derive macros
>>>>> to implement these automatically.
>>>>>
>>>>> Reported-by: Edwin Peer <epeer@nvidia.com>
>>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>>
>>>> As these are incremental improvements, could you please rebase on top of the v6
>>>> bitfield series so it does not conflict?
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=nova.dev.bitfield.submitted.v6
>>>
>>> On second thought, I could just carry this patch on top of my v6 series and avoid too much conflict.
>>>
>>> So if it is ok with you, please only carry the last 2 patches of this series whenever applying.
>>>
>>> For this patch:
>>> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
>>>
>>> I will review the other two patches as well. Thanks.
>>
>> The idea is for this patch to go *before* your series, to avoid the
>> asymmetry in the From/Into implementions of bitfields. We could also put
>> it after, but it would become larger as a result and I think it can be
>> merge soon after -rc1 is tagged anyway.
> 
> I forgot to mention that this patch is not really part of the series ;
> it's just here to allow it to apply on top of drm-rust-next should
> anyone want to try it.

These are incremental improvements, I don't see the point in making the
improvements before bitfield extraction within Nova. Very least, we can apply
the bitfield extraction within nova and then make the improvements (within
nova), since the extraction work happened well before (and it was a non-trivial
amount of work), before any of these improvements. Let us work together to make
sure we don't have to throw away old work due to new patches please. :)

thanks,

 - Joel

