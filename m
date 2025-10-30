Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB09C1DEC2
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 01:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2E10E86D;
	Thu, 30 Oct 2025 00:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KAhE3kvJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B129B10E86D
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 00:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdVW05SV6o3CsX7WZNrlprDz7FupZf0tkMSh5xYPDjfrM5qUlbxmFlWhI2lOrdCq6FkWEWFRANHu605eV+hLWE9cKaIW/W/AY7vASKSy43Vuu2EIclW0wl2Doxrd42t/KS4cvsQyb2evyK7FN/HOFX2TrGiQtNwg4IlNSd14V9rWFyV+IieoBj6tY6j9T/tCDSW6tUf32Q6yCG+YkdqE9GSqqdARD1ToVNtjY7CksV9Vk0CFMcc2b18Ig+ZO+D0Ki7nfojAYTlbgLs1i7s9dnLlmxy3mCre0bS7Ab623yIXNAbCERUL+ZU7XJYJi8SAmjXM13IVLrRRJH1XH5I/LJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=901vLHzEVfFNXfbIGFL1Ass+leILnrlgsmaZqT3B3Jw=;
 b=ixvFJK3PNLejQ3JPt5KEv6t0Z3SFKumQCX5kCjw6N22VlPB8sTMPlQXTinzhdWZLmajEXbEBAsiGRWOUg8BE67pOiWpmviLcX6v9x9PlItI+2+bRB83cOykwata/v9aLP7Pm+SaflN0BOlM6sezs7itfrzpYYyA37IUAb03nLc2EWk32m+FXPUppwsOBwkMKZsOB29+6EqvQFF+evld5CKukY4vffwInNWNUtQCkmMkw7ltot8A/RZ6AwQg0wog891KjesaH2JWvzWVItHyvMbOR+mgFYRxuXAgfdGtJSQ7DY3gyvzo8PaL4kQe+R+KfpZZWCWjCkWvJdJlsAPNr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=901vLHzEVfFNXfbIGFL1Ass+leILnrlgsmaZqT3B3Jw=;
 b=KAhE3kvJcS53gyY9EcYHkE0+Rf6w3GFn0UGDIpNkZfkj6q1VJogjRYHeRvkfzss5T+6i/jzGF8TdQ30Zm+MqsGIdoaRa5DlTHUC6Eq/GmzSqKO69tYlSjfWHrjoEpUMjTU5xatKbNO0cVtfg3Frv6cvKOa9dMMKNBibuGPQB3gyIwQIynFZhSwSc/KVPfl//QWaxYuo63PJjchRMLwO9B4G/aM+MO55amYqhP6xlpOhcD7fZsWe9cuvnxl3wmQruGpdLK+YxgTRmhxeiuUJdU0AX31HNVvDj/267Ak/BqxB/eL962pt70NyHwVhzncqSXVAXb/Q5IZupAa6w6ABzSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 00:35:24 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 00:35:24 +0000
Message-ID: <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
Date: Wed, 29 Oct 2025 17:35:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
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
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
 <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_
X-MS-Office365-Filtering-Correlation-Id: b73516e6-712d-41e0-5338-08de174c373c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGdKN1hUdlZsTUt2c3lDa3dYMUhpdUx3ME01SE1EYkErdlc5b3JOVkk0a0Zx?=
 =?utf-8?B?QXh5TXQ4cnNVM2JYblgxa1NnTXlWY21VdWVVYXRBZGx6YUhPQThnMUI5UEIz?=
 =?utf-8?B?RzlkWGRkUHFXVVk4VldzYW5VNUF6QjNtbEJ6a2dhUGhRNjV4Z3FPOTBnRzFs?=
 =?utf-8?B?QjQwWjl4VlFQbGtCQzM3R2lWMFNRU2M5NWdhV3NuOW9lQmFEczJGUkJiejR2?=
 =?utf-8?B?YjZOOWMwQ0J5bFRTVE9SK243ODRlM1UvakFtRkpKTWFTSXpCWklsQVAyN0Q1?=
 =?utf-8?B?QmVUWlFlRjAwSlFsNCtjZ2FWWmhMMEM2NXgwL1ZnQnNtSzJFeFFyVjdHU0Yv?=
 =?utf-8?B?aUdMTkZVNUZNNU01eHZCRC9tM2hoYTFnTmc1NXNhTFh4WWRYZzdtK3kxcEFR?=
 =?utf-8?B?VG4xbHFhL01Ua0tHSTlMY09tQjJMVE10enEwSkN4MDY4NEIxelhaVEwwd2VI?=
 =?utf-8?B?ZEhCeXhROThmaVRlS1lmMUhudEZYbVdoV0NmdzdNVkxTUkVOeXVWTHZTWFZo?=
 =?utf-8?B?ajdGMjlyLzhxVDJHeWw3bWt5bGhUZHBlVU9wTlhSVitPcUFkcyt3Mk5hdHdM?=
 =?utf-8?B?K0JTRXZWODF6WmM3QVNVZHZzNVhneWFpaVp2QTYvSWJYcnRrWHVIRHYzSC9E?=
 =?utf-8?B?bDBYUWNvS2ZnajFDSUh6ajJGUUdXRnNFRWt5ajNPZlZ3aEhsTmdzNWtIWlo2?=
 =?utf-8?B?QktXYlVPYlkwVkFqVGUwSFBEWTl3WFJhUWFIQTBTZVlVYjZXYkc4M0pRVkln?=
 =?utf-8?B?NnFMcFc4b2NIUysrQytMU3Exak5aaDZTN0dyUEFSdEkvRHN5NHF5MXRIVTB1?=
 =?utf-8?B?Vnpta0VZeTBaUGx4UDhFS3dmNWNsSWtseEdtSklkc1dvQmRrRFNGdUVZUHF1?=
 =?utf-8?B?clgrNUlBVTErUGZrTCtxN0t6cyt1dzFMa0ZLMyt6cFhJdjduVnJ4Q3dlTi9Y?=
 =?utf-8?B?MUJCL2tqcXp2VW5FVXFsREE1M1NYMlIzUnRNR1hhdUZURTVJVG9qeFA2S1pB?=
 =?utf-8?B?VkJUTVRMOXpXUitVTU1vV204bjdFUS92ZWNZdGFPWFg3OFpGNGJ1SEJlZEVo?=
 =?utf-8?B?TE5HZjZpUFd2MVVNUW50ck15eGpQZGFBNXBUUnl4Vm9IYmNwaFZRZSsyNWk5?=
 =?utf-8?B?bVRaVjFhQWNCZmhmWS9sUkVlaGlDeFI3NFd1UXlQYUJkbkl5ZytmTlFldzNr?=
 =?utf-8?B?dzRXbFRZUWVTRE96dkE2TGUzZlVjYk1hNUpQWTZJaFpGa09oNTZ1MHJWOW9q?=
 =?utf-8?B?UXZwMCtvUExCSTJ0ZlplQ2RyTUNBc2plZzZZZEdEZmdKU0N4dURFQW5UQzVC?=
 =?utf-8?B?dWc3TDQwcG1PdXR4bGdNU24xTmozdDJNL3FGb0JjNW9kV0lYdVhJVHB3M1Fy?=
 =?utf-8?B?RVV6TzVlWUxFRW9uSit3YVQ5bzFnUmVId2hKY2VKVHlabjJaRTZHMnQzSE5I?=
 =?utf-8?B?QTVPVXBRVTFFazFpTnR4MEZSbGtiYlBKbnRSekdTZ24zWC8zbU1ZTk16QkZl?=
 =?utf-8?B?eHpmVjZCWHZRYWs1azRxeFoyZ0NUcWg2OFk2S2MwU2s0Q2N4eHR3Zk5kZFhE?=
 =?utf-8?B?MG5ZU1oybWVMb1lqaWFPUVhzVXlDbUdCUjkwYkVZT1Q0blhWTXpiSzlQWUtR?=
 =?utf-8?B?SUpPeEFvaXJxQUI3ejcrSWc3U3pYNWJ2bTYxd3oyU3BlVDF4bzJ0bUk3V3pv?=
 =?utf-8?B?cW9IR3JueXNxd0djN3gyb3Z5Qk8rUUNGN091SVFZTmIwMGVVS2JHcWtkU2Y5?=
 =?utf-8?B?c0Y4R2RRM1JiaE9qQ3l6MlRSbUpFTEVKZ2F3RnNYZUMweXJhRWlQc1pYakFt?=
 =?utf-8?B?dWlUNHFCbGtkcDZpdXl3MFFZWjJ2N3JnaEIxUGNPZm5CaHR3cUJjZ2FVK3ly?=
 =?utf-8?B?dVp1bCtrLzYrMEozSHpMMGxOaVoxQW5jQjdvRkkyNU9NTHlLMkxDZnFWMkVU?=
 =?utf-8?Q?SQWVNdd79ciAvq9NfalcVCpT661EYMK6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVR1TU44RE9MWksyUXYrRHBtUDNWcm1aQmNyd3J4ZkJMVUs3clZkQTFiVTJD?=
 =?utf-8?B?c3lyWHp4MHFxcjM4SC9MLys1bGgrRlpQOHhMU0hQWlFRVU5ZUHRqYi9FUHFE?=
 =?utf-8?B?R1BzU2pKcXg5SWtsNkVYQThDNkNMNmNDUVQ0cC9IT0NOUFhHcWNnenBQTy9F?=
 =?utf-8?B?L3FxNTBwM0xyUFFOdU9kdDZvdzZlaHA1ZGRVZnBGbnNXbUhUY2dsZC96MVJk?=
 =?utf-8?B?RnlGRjBRdmF0bEJQa2kwSG52SGxjMmpITFdwVGNaakt0cVpZd205TU9yNjBG?=
 =?utf-8?B?QVllMEJhKzBacENmTVZta2dEMEVpYjVzVUxvOWlvSUswY3lNQkcyZXZoUlRJ?=
 =?utf-8?B?NGRNYU1tYjJ1OWJRcENidVBkTFpOSUJhSjV0SkVIdWF0T0Y0WlZSNWIxeEkw?=
 =?utf-8?B?TlluWGdQTUJRQ1U5RTlzQk0ybFdWV0dRYmVuQWxWVnhRemtZRElVOWpQbldH?=
 =?utf-8?B?VmxHVDMvRmJvck5DS3FST01EVUFEN2dhS2JjS2dGdktJNWE0dW0yaUs2SmVE?=
 =?utf-8?B?bzhjaHNWNEhDQUVHWFRvU0JRUGVjVEhhTEM3a0Vid2MxU2dwUWdJeW1rZG40?=
 =?utf-8?B?bC9sR0xic2tYaCs5SlZldldWUmtaN0FDNndaOFNjTktManQ4OUR0Z3NJcTUr?=
 =?utf-8?B?bldMNzZ3QmRRa1BpMm90TGF5Ym5raU5VNUIvdzR0amF0MmY4Kzg1bGpGY2w3?=
 =?utf-8?B?VUVnbGNNc0F5bXVvU2tJSDRWSHh5Z2JYUjdJMUlWSmRqZm15VCszeGdWdUdU?=
 =?utf-8?B?a1N1a3JiSTRmNEhiN2tqMDZnVEluZHFWaWp3eVdZbXpYR3Zsa01IOTZXQUVW?=
 =?utf-8?B?NEs0QnpWU1JJYnBtczBNTDdrSElkM3RURzFsVERZeTFqZ3BVT2NsUnY4d3hT?=
 =?utf-8?B?VUZka2s5Nm56ckwwVzRKQ2dBK0VuMVQrOCs3YlRiTkpzZXh1ZjlsQy9pSXhL?=
 =?utf-8?B?bTJ4NVplSlVZWDY0ZjU4anZ1MnZwZU40V09WYXJrMmY4STFVUTVwd3VIQ0xQ?=
 =?utf-8?B?TE9zdmsxbWppeHZ5UEtYRHlhN0xnKzVSeUtnTVJRTDJ0eFhlMjdWOVhPZ0JQ?=
 =?utf-8?B?b3ltZE5WN0RPM3hRUUN0YnJQSWJ0Nk41YkNiR1NzR2V5c2g5K05KaU1KQU1s?=
 =?utf-8?B?bW9YMHBYZW0yTEdtMjBvaHdnVkxvYVpEUHB6NE1zdlFlWStKcFBiOEFEWUFq?=
 =?utf-8?B?d3dkVkxTcUIwNWRseGlzNS8zZVZMYzNCeDZFQXZXTGNGUnZ5Snl6ckY4L1hu?=
 =?utf-8?B?andmYnlLZ2JvWE5OOWYxRi8wMXg1N3VqODNQN0tsbzlxTHRoek5janExYUpV?=
 =?utf-8?B?eWlsQVM0bVk2cmw4WU9DK3ZpV0l1WEY2UDUzSnFkb3hQei9NM01GU2RRbG1U?=
 =?utf-8?B?ZC9OVzRVT0t5aVRxZFU2akk2Q3hoQ2J0Z1ZsNkJIaGFGV1dVWmRYZ2RDMk0y?=
 =?utf-8?B?K2h3eVA5cGVmb0VrS2o2K2tFZ25oWkNDZUZBQmcxQlJNaFJGb1ZUdm9YRVpz?=
 =?utf-8?B?NXRtaDArYWR4UVRFYjk0ZnlNRHltSVhRNTg1dFh3MkhZM3ZJRWZJNzNsVDZD?=
 =?utf-8?B?ckc0TjNYbkJ0bTNMaXZMd3Z6QU9rVUp6NkpGa3Mzb2ZEWmxzb1U5UzA5N2VJ?=
 =?utf-8?B?OFNUNU56WWd2dUFtVEl4VXpOSFBpZXFFTHRvTFJXb0cxSytGUnlRY2NSMHNq?=
 =?utf-8?B?Q2I2ckFhektiV1prQU9vTTVKS29SdTNPbzFGY1ZRZ1RjZjJjaitXd3JTNkZW?=
 =?utf-8?B?dThMTHl5c0t6RVBhQzM4bjgvaTVpaWlnRGtYVnhFOW9NZGV3SE8yV0dGUk9Y?=
 =?utf-8?B?RUkza0F0aGtrN1YzVlFGN0wxdUFmYWF3N2JMcU5aUDZXeGNuc2RZMWxrQlVG?=
 =?utf-8?B?a0lmUFVmOXhXUFNWbWRPQi9FNHBoQ0U2Mk1xYVA0OWx4TUtVdEk3Q2Q0bFVE?=
 =?utf-8?B?TXFuQXJsVE54cld4Njh0NG94WHFYMzYwc3pvQ1ZpNXg2TldMNENBNGUyV2Fo?=
 =?utf-8?B?UTMxWGpqVkRWWlFYS2hIUGM1SXlZOTBaaVBncW5sWVpRcERadDcrbmdyaXFs?=
 =?utf-8?B?MjZxV1dBQnVBeHBBcmwrRC8zNDZtaVpEeUVnbkJXTEJZSUgxekxzRXIxOFUz?=
 =?utf-8?Q?K93l5HXAXvpnm+ThjHDOw0UGl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73516e6-712d-41e0-5338-08de174c373c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:35:24.6069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZSOq0l/2kw09nYIxuqCc+oWq2PVNquIsRqGYn/euOFXLCkHjbyRKALaCyiNCr1XXR37eX7i9foPx1Wy0FpnRnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4116
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

On 10/29/25 5:31 PM, Timur Tabi wrote:
> On Wed, 2025-10-29 at 17:29 -0700, John Hubbard wrote:
>> That, combined with Timur's comment, made me realize that .is_next_gen()
>> can be made reliable enough that we don't even need is_nv04() at all.
> 
> Please, not "next gen".  Technically speaking, BOOT42 is "current gen" and BOOT0 is "last gen".
> 
> And this all assumes that BOOT42 won't be replaced by something even bigger for
> Blackwell+++++++++++.

OK, I think this wants to be called use_boot42_instead(), approximately.

...and I've fortified the code accordingly:

impl NV_PMC_BOOT_0 {
    pub(crate) fn use_boot42_instead(self) -> bool {
        // "Future" GPUs (some time after Rubin) will set `architecture_0`
        // to 0, and `architecture_1` to 1, and put the architecture details in
        // boot42 instead.
        self.architecture_0() == 0 && self.architecture_1() == 1
    }

thanks,
-- 
John Hubbard

