Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F04FCB4AB3
	for <lists+nouveau@lfdr.de>; Thu, 11 Dec 2025 05:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269F110E106;
	Thu, 11 Dec 2025 04:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JfUhlgDt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010039.outbound.protection.outlook.com
 [40.93.198.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1C110E106
 for <nouveau@lists.freedesktop.org>; Thu, 11 Dec 2025 04:12:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XohdRdp/XvcvEcqaaYs0+HIotRcVrh4M4yEE7YBc5ZYh+sVXbOqmPNeQDn7bKHhXbHB2E7pZG5QDzMuNxdhEp0kmxOvmPpEv2a60niu5TjzUAzN9iE4ypQLzcKQ/nxjVOezb8g5YHRsYnIMiyibXeCicr8mEcUhkaFHQu4wpqiFHhDpuVwb7fCpy5XT5ZmKXrwEXOy2GU6J93vv42dk1wb6XeeOFIqudgIr1M0fpgSs9iQowuQmJC2tPbenvo3F2eOk1wYo4o63Dt3+R22vTMkRJ4+1uwbmCKcROQJRhmkyhEhFB03X9a5bwQ8zSmdF2pqo6XmLzvXEMBh8CoCxgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5gfbzRHqs5zxnwT/eYnLlkuUIQe/BkJB6Pi+0jpvZg=;
 b=xdwEiZr/QNXdOuM3ee8X9Y+SSwJWLmcHfgZhglm7mSlepm1VKdQElAn2I4mWGIsDWXszauSZtXbOtZ+OvBlR/V5usEsVJI8waha33x8lpuJXDKmkafQor+r4fwR5hL+AMTzvY/NYHS/aIM+I9MpUPToB1RCAxDIuBJ+A+5soRca2hclTq35PCBoxO0kIdbZOG+GJvt06nZr7YpY4VA/5TX1w7HjUOk6buJLTFwRT8HnCTV4IioEtlI2J98hyGLmXEbXV7gNQTAKamBnONuH+58R0o7B5KHVvvQrdndrb+/3fOmMcuN4L4vmfcR5uUzwKof0Cg3M7Qy31dzgLgtuuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5gfbzRHqs5zxnwT/eYnLlkuUIQe/BkJB6Pi+0jpvZg=;
 b=JfUhlgDt5ovSNk6emNsRg0detGqamzn+uxAVylCbZlatW4qDup8UB4t+7oW6a/zSXtCFYkwVTEiYO3YM3FM/FXuCIDF392rHv4AQ3n2m+paLzr3MB2xuynfQ9AzEfGYWlo6OO9/zjCEAzbK7lQiCYD80tKwMhAut0MVuPd8JoWV8yvnXipXinYcwL6b+szwulXu0330/kyXfSBF/MojYRpW2MezpDB5sUzNj7hgiuGoBf0S+gnZoq5VhhNnzQtvbndZy6ehlsAGTU1mq2Ko2cZ0YgUFYl3E1cpkehma5P2YdIPxZz9mNKJFPNnA1j0wkOiv2aot2GpuugzQ1M9qADA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6088.namprd12.prod.outlook.com (2603:10b6:8:af::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 04:11:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 04:11:59 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Zhi Wang <zhiw@nvidia.com>
CC: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>, 
 "aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "markus.probst@posteo.de" <markus.probst@posteo.de>,
 "helgaas@kernel.org" <helgaas@kernel.org>, Neo Jia <cjia@nvidia.com>,
 "alex@shazbot.org" <alex@shazbot.org>, Surath Mitra <smitra@nvidia.com>,
 Ankit Agrawal <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti
 Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
 <jhubbard@nvidia.com>, "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [RFC 4/7] gpu: nova-core: populate GSP_VF_INFO when vGPU is
 enabled
Thread-Topic: [RFC 4/7] gpu: nova-core: populate GSP_VF_INFO when vGPU is
 enabled
Thread-Index: AQHcZq3HpdYIM6R3LUqn4UkIOuqAAbUVdjWAgAPfaACAAoWe7g==
Date: Thu, 11 Dec 2025 04:11:59 +0000
Message-ID: <84CBADE2-95CC-472D-967A-FAEB37050B21@nvidia.com>
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-5-zhiw@nvidia.com>
 <9cf6135e-43c4-4c31-acf5-03fbe32e2bae@nvidia.com>
 <20251209154114.09cf245b@inno-ThinkPad-X280>
In-Reply-To: <20251209154114.09cf245b@inno-ThinkPad-X280>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DM4PR12MB6088:EE_
x-ms-office365-filtering-correlation-id: aba991ad-ed28-4f1e-0cbf-08de386b6e40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?utf-8?B?a2k2eXA0bnQzcGlSSU1PVC9MOTQ4RC9VN01GK0l4R3RRV0ppQU1jdmRwRGhm?=
 =?utf-8?B?UHhFSzNrTjYzcWk1Qk8rYVo5UlJSbTlkNzZ2a0tScWhJVVNudlJrNXVBa29z?=
 =?utf-8?B?a2YyVEpsdTducythLzNhMUsyYlhhL3EzY042WUxKeWorbHhTZmN0TnlaQlJw?=
 =?utf-8?B?WDZRNnhoY2IzV3RWUndxUXQrRUM3YmpYanRvSDY0Qk16R1ZzbHZybVRGdy9F?=
 =?utf-8?B?aDQwNTV4T1pVSGxGRVJqZm1vc0tMSWMvRDk4VTExL3Qvc05MMmR4Z2dzcDRT?=
 =?utf-8?B?VzV1S1QycHFPa3U5QklqM2Q1NmtJalVhUklnWk9LTGEvTXRaWGFzd1MxZ3Qv?=
 =?utf-8?B?eUJaRU83VFkySGk3VkNKVXJIY2VqSkFxZHBqUVdqZzNwbDBmaDZCbXJldjc1?=
 =?utf-8?B?SXpSN0ZLS1BUcWIvTzAySDdNRXNZTzJEWmFVbFFsR2N1V3NCNFMvTzQrU3p6?=
 =?utf-8?B?cCt3UUZDdWM2VkxJNDVoRVVVSllQbWNqZm1YSWtDSkt1bVJ5aUFvQjNiUGlx?=
 =?utf-8?B?R0d4OG84eFZjYlpGM1lZTUxaODkwWXZldzBQQ2NxcG5xRjhtOEhNOUdyU1dq?=
 =?utf-8?B?ajl6SXhUVW9ON2FiL0lid2srNEdrcDRlN1hwYm1BSUtEeGNrb2pnM3NkYjdv?=
 =?utf-8?B?d0tXZ01MWEdoMWdtdjExd05YdEpFYldrcGhHU2t6WkgveUkzL2d3S3k2aVhr?=
 =?utf-8?B?cTNsME9qTEVGeEpHS2gvQTR3VS9aeW85NnFESm85Sy9JakU1QUFTSllmM2xG?=
 =?utf-8?B?V1JKZ0hGQWUyVG5ZcWxlZmgrZGFMeGE2MjhkenpnYzlYTDZNaDg4MEJZRGpv?=
 =?utf-8?B?S2ZzbldVQ2M1MTNtNWkreGpKdmxZR29Pc0JVbWV1WS81ck5SMFptM2U1MGcy?=
 =?utf-8?B?U1VjT0NuY2ZHUWJCd0dPNS9GTVM5N0szYmtDMnIwaEJTSU10T3o1Z1lkVmtY?=
 =?utf-8?B?SThzRlI5SWFTcVptWUNheXhrc2gxUlBjbFBQb0taazJiN0RGeUtmN0dtRVpm?=
 =?utf-8?B?Z3IxaUdQTnRlcXhmM1huZ3h0YXl3dStub1ZhMEZWSExoWjNUbDNrZVo3emwz?=
 =?utf-8?B?aFcwWk5jK1NBR0hvWTBrWEorRnV3V2ZUeUE0LzNHdE01QmlYaUhidzNRdVlF?=
 =?utf-8?B?S0VsZVRrbE1WVFNPbGowMmRyU3NlSWJtZTZLMkhKQnJTV21nSU1CamJVTmxK?=
 =?utf-8?B?WXpiRHdoekpMcy8xOTJRVGxrRkc5NjhqKzRVNDZveUM0bExRbWxsM0ZzY3BF?=
 =?utf-8?B?bU43Mmh2YWYvUkJ0cWhjTDZpRUEwZzJEeUt4NUxncThlaGZLak1uZkFuakNr?=
 =?utf-8?B?MnB0OXgyaEpqZUNRZy9WVGVkbVNOUWduS2p4c3NYVFVHc0RlTm1mSWhZY1Jr?=
 =?utf-8?B?OXNQZTk2Zm1nak9wL2hkdEk4dFVZNVBHWWxIMnMveXdtejUyMnZSbHFaTTd4?=
 =?utf-8?B?MFViZHMyc1NQaGsybkJvQUFMWUI0MWtnQkx6a2hDZ2ZWQkVtK1p6NVJyMUI1?=
 =?utf-8?B?RXAxbmU3T05WaGVYZ3dLKzV5Y00wZElZRDA4OWRoSnkrZWJ0RHRiNHFCWDN3?=
 =?utf-8?B?aTdTM0xoSXE2ejRQYjZKTlBKbFJMRXVNZ3dscVBQelZUOEdBb3RxQkRWYWIw?=
 =?utf-8?B?ZUQ5QVBKV1JJOGVYcmphM3hyakp6b0l4alh6TEtxT1NZeGhuTUJYU1RSd28r?=
 =?utf-8?B?bnQwWnFrRndxZ21ScHBiVHAraHcvTzBiem1ueFd2d1NFalhhdjk5VjhLUVNl?=
 =?utf-8?B?em13VmRRajNGK2xYaXJtaGtRZnZ6eFArNHMvVGhJSjJRNFd1K1liSGRFOWQ5?=
 =?utf-8?B?RHJNZkJHbWhTRUdqaVhiNUxUakxCR1dZTlRIbVFuRWYxTjREaDIxdDRVQ3Jw?=
 =?utf-8?B?RC85enZmenV2aUJpZ0J5cHloZ1FndGNGeENxRmlmc0tIejF3b0lWQitSQlAw?=
 =?utf-8?B?OEw2MzhsZHo2cHFsYlE4WVVSMlYxbUZNNUU3L2xrMXRsSGVOZ2JXNXU5bzh2?=
 =?utf-8?B?NDJHdVZVNHNBZ1hFa1VIUHVMbkoxci9mWXZvUmNlM1V1WG4ybFdxWFJNcjB6?=
 =?utf-8?Q?8y0nm+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SU1wc1QzYzF4YmcrUnlqc0lwSnMySUlpWm13Qy9QU1JQWlVkZ2d1RzJPUUh4?=
 =?utf-8?B?UDNWZmpRMXhGMmk2TzdZQllsdGljQlJqVFFhd014M0ZLam1xSURzWEM5WFhF?=
 =?utf-8?B?QmtmNVBBNzJOckxWNk1QVWMyZGtPeW9GRmdjNTQvU25vamhwcVN1UDl1OWJT?=
 =?utf-8?B?SXduS2ZpNU0yRDl5VjhqcXZibmZTRDhndGp2NWJDeFZBZ3pBMTFmZjZxTmtw?=
 =?utf-8?B?OHM0UE14ZmhxSGt2c2pmL3Uxdkh3dytiZXAwTE4zTTZ6TFpDa2VhRjlydWlu?=
 =?utf-8?B?SXM2OEl2NzJpM2lyVHJtSDBxNGF3UXhkZnhTeEVhNStuT0JtaDNvOHRhd0pS?=
 =?utf-8?B?M1JLZ1VNYXVNclNtUUxNTDZoOTlZVGZIZVNQend0bHE5WFU2NTVIZDVudXY2?=
 =?utf-8?B?M3N6c3ZDaTJielVwRVVaSEdkVEZDUFBRRXVMVWpBNm0waTVlNG15NXlFeGhz?=
 =?utf-8?B?bkR1Qk9yamlQVU1HaE1vUHVhK2hOYTBma1ZmTTBJWlBQeXl4ZUxyNktBYWEv?=
 =?utf-8?B?QnRiNmpsNTVsOU11dWZKeFVvMWpnbElqWnRaaDA5UmM2M3RmbjJOdUZmb3gr?=
 =?utf-8?B?SU05SDdrTDkvN0FENkZtS2pBMlBRRzZ0eC83ZXZsQ25qTWw3S2paZlF5N2NT?=
 =?utf-8?B?ZHVLd0xIOGhmS0I4SVgyaWJ6NTZWaTZGUTZhRFlvWkN5ejltN3V1TmVqSmFm?=
 =?utf-8?B?dHlBVE5ZYlY1SEwwSkN2akZiN3hxeHpzUThZT2xJUWRFY3ducldDaDRwQ0Vu?=
 =?utf-8?B?UERKbjE0ODVUd3ltRG1XWEh0bUhSa3ZYVE0vMVhldmJ0VkpIcVUvSklsZThI?=
 =?utf-8?B?cDN0NlV2VFllRGxPMmRGRGg0TmMrRGV2TUVSUVZMc1B6RkdLNmtCSFNmeHZ3?=
 =?utf-8?B?WDBFSXk4Vkt0cW1sV3Z5UXpRNU15cngra1JWcDdaNDFQYm1RdjJneVJxdENI?=
 =?utf-8?B?MmxkWHlQMDhFQjQ1dkZjM0ZCNkZoWURodVdBWTdRMkR4WDQwSVdmc096K0RK?=
 =?utf-8?B?UWtkNm1oT0twRitaRWlxcDhZdVNPOGdLM1RZZ1E4L3J1eDhMNlBmd0s4SGNa?=
 =?utf-8?B?endTcUYyQmZyUjFkQjdsVlRnZmhVVndaR1plY04xaFhRS2FmZWZqL1RicVl2?=
 =?utf-8?B?L1ZZYW9CS1k5Z2F2d2lFbVhwbjNxUWJhbWZHS1RRSnp3OHU1cVBJeHViQnl2?=
 =?utf-8?B?MXdCT1hvYW1YZVFsODFHckk0U2tmWEFWNjNCRWIybDhUaWtUVGZPZ0x4dXAr?=
 =?utf-8?B?MVI2alNOcGRodmRDeWZvZEtQcnk3NlJaU0xMQzRkVEhwNUZUd0hsdGxaYVFZ?=
 =?utf-8?B?Z0NjSTRNdnRPdjFzdDZmQXhtY0J2K3hJMDBUQU9KblphQ2Rud0oxZmVPdnZm?=
 =?utf-8?B?alMwZjVJT1hyNE0rNWRvNG41RzVseDJNYWR0Z0NhOWR6azkzcGJFTUtJYWxa?=
 =?utf-8?B?Y29FUkM3dUZYd1VXWDJPd3JjWkM0TkgzTTNxSlZQUUN6YnhPd1Vqc3QzTTZ4?=
 =?utf-8?B?S0dkcExOSHNNMzdnYzZOTVI5L2lFUmxqSmNEOGZ0bXpwT2pEUTR5L0ZmY2N4?=
 =?utf-8?B?aFR0cGpUV29SZFFHdmd6L0xVRmREbVVQVks2Sy8rSCtqc2VjVU9VS2FpQ2Z6?=
 =?utf-8?B?dGhva0MyZ2VOR055K1pkWUUwNkNzYkZzTXJVZW5CMHowbHFuSDZBMWZWdFl2?=
 =?utf-8?B?R3F6UU5MK1BDMGJ2ZUNramhmWTAycmJhUTQvTEV5NXlVdWk4TkhveCtydEFl?=
 =?utf-8?B?SFdORGVlMFdnWG8rMXF1RGNTSS9vTnR2SWtMaUl1UnJacDNhdVZXNEJ4b1VS?=
 =?utf-8?B?MVhCUkNVQVRPVWROOUJxZ3UrMDZIclFUL1dPOG9kMEI0dUZmS2F0M3M0KzA3?=
 =?utf-8?B?SWhrMnpPVC9GVGZnNHFGUjVmVUEwUERqcVk2cU1aNUUvdmVXWjJVSzFpWjly?=
 =?utf-8?B?YVY1QkU4YmhxSXp5RXpMbitaOFhMS2tyUlg1N2hwWWZtWEpVRmtNK09id29J?=
 =?utf-8?B?UUMwdWdaU2RPSG5GZjBXNFNQNDhYNmVLWG1Gc3ZsbEh1NER3L0V5TTIxemM5?=
 =?utf-8?B?VFJxdGF4NkhXS0Q1d1dMejU2Snk3WjE5RVBwOU4zTEVIQ0Rsbm5JZjBjSklJ?=
 =?utf-8?Q?zz2I1sdvvqo+W5ZFJdohqY9+f?=
Content-Type: multipart/alternative;
 boundary="_000_84CBADE295CC472D967AFAEB37050B21nvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aba991ad-ed28-4f1e-0cbf-08de386b6e40
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2025 04:11:59.4944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oUobfllX9PXJ/1oN788vPm0mkt+M+1yroKIRwk3GZMMfuHXLeexOnUMB71hJ3TDlWJ14aSTQwrETY63wKWMc6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6088
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

--_000_84CBADE295CC472D967AFAEB37050B21nvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQpPbiBEZWMgOSwgMjAyNSwgYXQgMTA6NDHigK9QTSwgWmhpIFdhbmcgPHpoaXdAbnZpZGlhLmNv
bT4gd3JvdGU6DQoNCu+7v09uIFNhdCwgNiBEZWMgMjAyNSAyMTozMjo1MSAtMDUwMA0KSm9lbCBG
ZXJuYW5kZXMgPGpvZWxhZ25lbGZAbnZpZGlhLmNvbT4gd3JvdGU6DQoNCkhpIFpoaSwNCg0KT24g
MTIvNi8yMDI1IDc6NDIgQU0sIFpoaSBXYW5nIHdyb3RlOg0KDQpzbmlwDQoNCj09DQoweDAwMDAw
MDA0KTsgKw0KKyAgICAgICAgICAgIGxldCB2YWwgPSBiYXIucmVhZDMyKDB4ODgwMDAgKyAweGJm
Yyk7DQorICAgICAgICAgICAgaW5mby5iNjRiaXRCYXIyID0gdTg6OmZyb20oKHZhbCAmIDB4MDAw
MDAwMDYpID09DQoweDAwMDAwMDA0KTsNCg0KUGxlYXNlIG5vIG1hZ2ljIG51bWJlcnMsIHBsZWFz
ZSB1c2UgcHJvcGVyIG5hbWVkIGNvbnN0YW50cyB3aXRoDQpkb2N1bWVudGF0aW9uIGNvbW1lbnRz
IGV4cGxhaW5pbmcgdGhlIHZhbHVlcy4NCg0KQWxzbyBCQVIgcmVhZHMgaGVyZSBuZWVkIHByb3Bl
ciByZWdpc3RlciBtYWNybyBkZWZpbml0aW9ucy9hY2Nlc3MuDQoNCg0KVGhhdCBpcyB0cnVlLiA6
KSBCdXQgdGhpcyBpcyBiZWNhdXNlIHRoZXJlIGlzIG5vIHJlZ2lzdGVyIGRlZmluaXRpb24gaW4N
CnRoZSBPcGVuUk0gY29kZS9ub24gT3BlblJNIGNvZGUgYXMgd2VsbC4gSSBoYXZlIG5vIGlkZWEg
YWJvdXQgdGhlIG5hbWUNCmFuZCBiaXQgZGVmaW5pdGlvbnMgb2YgdGhpcyByZWdpc3Rlci4NCg0K
QWggaW50ZXJlc3RpbmcuIExldCBtZSBhbHNvIGxvb2sgaW50byBpdCBvbiBteSBzaWRlLCBzZWUg
aWYgSSBjYW4gZmluZCBtb3JlIGluZm9ybWF0aW9uLiBUaGFua3MgZm9yIG1lbnRpb25pbmcgdGhl
IGNoYWxsZW5nZS4NCg0KDQpTdXBwb3NlIEkgd2lsbCBoYXZlIHRvIGZpbmQgc29tZSBjbHVlcyBm
cm9tIHNvbWUgZm9sa3MgdGhlbiBkb2N1bWVudA0KdGhlbSBoZXJlIHdoZW4gZ29pbmcgdG8gcGF0
Y2hlcyByZXF1ZXN0IGZvciBtZXJnZWQuIDopDQoNClllcywgSSB3b3VsZCBzYXkgd2UgZGVmaW5p
dGVseSBuZWVkIHRvIGRpZyBtb3JlIGludG8gdGhpcyA7KSBmdW4uDQoNCg0KQWxzbyB0aGUgYWJv
dmUgY29kZSBpcyBsYWNraW5nIGluIGNvbW1lbnRzLiBBbGwgdGhlIHN0ZXBzIGFib3ZlIG5lZWQN
CnByb3BlciBjb21tZW50cyBJTU8uDQoNCkdlbmVyYWwgcGhpbG9zb3BoeSBvZiBOb3ZhIGlzIGl0
IGlzIGEgd2VsbCBkb2N1bWVudGVkLCBjbGVhbmx5DQp3cml0dGVuIGRyaXZlciB3aXRoIG1pbmlt
YWwvbm8gbWFnaWMgbnVtYmVycyBhbmQgYWJ1bmRhbnQgY29tbWVudHMuIDopDQoNCg0KQWdyZWUu
IDopDQoNClRoYW5rcyA6KQ0KDQogLSBKb2VsDQoNCg==

--_000_84CBADE295CC472D967AFAEB37050B21nvidiacom_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5IGRpcj0iYXV0byI+DQo8
YnI+DQo8ZGl2IGRpcj0ibHRyIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPk9uIERlYyA5LCAy
MDI1LCBhdCAxMDo0MeKAr1BNLCBaaGkgV2FuZyAmbHQ7emhpd0BudmlkaWEuY29tJmd0OyB3cm90
ZTo8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiPg0KPGRpdiBkaXI9Imx0ciI+77u/PHNwYW4+T24gU2F0LCA2IERlYyAyMDI1IDIxOjMyOjUx
IC0wNTAwPC9zcGFuPjxicj4NCjxzcGFuPkpvZWwgRmVybmFuZGVzICZsdDtqb2VsYWduZWxmQG52
aWRpYS5jb20mZ3Q7IHdyb3RlOjwvc3Bhbj48YnI+DQo8c3Bhbj48L3NwYW4+PGJyPg0KPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+SGkgWmhpLDwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3Rl
Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+T24gMTIvNi8yMDI1IDc6NDIgQU0sIFpo
aSBXYW5nIHdyb3RlOjwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8c3Bhbj48L3NwYW4+PGJy
Pg0KPHNwYW4+c25pcDwvc3Bhbj48YnI+DQo8c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+PT08L3Nw
YW4+PGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRl
Ij48c3Bhbj4weDAwMDAwMDA0KTsgKzwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Jsb2Nr
cXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUi
PjxzcGFuPisgJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7bGV0IHZhbCA9IGJhci5yZWFkMzIoMHg4ODAwMCArIDB4YmZjKTs8
L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3RlPg0KPC9ibG9ja3F1b3RlPg0KPGJsb2NrcXVvdGUgdHlw
ZT0iY2l0ZSI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj4rICZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO2luZm8u
YjY0Yml0QmFyMiA9IHU4Ojpmcm9tKCh2YWwgJmFtcDsgMHgwMDAwMDAwNikgPT08L3NwYW4+PGJy
Pg0KPC9ibG9ja3F1b3RlPg0KPC9ibG9ja3F1b3RlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj4weDAwMDAwMDA0KTs8L3NwYW4+PGJyPg0K
PC9ibG9ja3F1b3RlPg0KPC9ibG9ja3F1b3RlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNw
YW4+PC9zcGFuPjxicj4NCjwvYmxvY2txdW90ZT4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxz
cGFuPlBsZWFzZSBubyBtYWdpYyBudW1iZXJzLCBwbGVhc2UgdXNlIHByb3BlciBuYW1lZCBjb25z
dGFudHMgd2l0aDwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj48c3Bhbj5kb2N1bWVudGF0aW9uIGNvbW1lbnRzIGV4cGxhaW5pbmcgdGhlIHZhbHVlcy48
L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3RlPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+
PC9zcGFuPjxicj4NCjwvYmxvY2txdW90ZT4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxzcGFu
PkFsc28gQkFSIHJlYWRzIGhlcmUgbmVlZCBwcm9wZXIgcmVnaXN0ZXIgbWFjcm8gZGVmaW5pdGlv
bnMvYWNjZXNzLjwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIj48c3Bhbj48L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3RlPg0KPHNwYW4+PC9zcGFuPjxicj4N
CjxzcGFuPlRoYXQgaXMgdHJ1ZS4gOikgQnV0IHRoaXMgaXMgYmVjYXVzZSB0aGVyZSBpcyBubyBy
ZWdpc3RlciBkZWZpbml0aW9uIGluPC9zcGFuPjxicj4NCjxzcGFuPnRoZSBPcGVuUk0gY29kZS9u
b24gT3BlblJNIGNvZGUgYXMgd2VsbC4gSSBoYXZlIG5vIGlkZWEgYWJvdXQgdGhlIG5hbWU8L3Nw
YW4+PGJyPg0KPHNwYW4+YW5kIGJpdCBkZWZpbml0aW9ucyBvZiB0aGlzIHJlZ2lzdGVyLjwvc3Bh
bj48YnI+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2PkFo
IGludGVyZXN0aW5nLiBMZXQgbWUgYWxzbyBsb29rIGludG8gaXQgb24gbXkgc2lkZSwgc2VlIGlm
IEkgY2FuIGZpbmQgbW9yZSBpbmZvcm1hdGlvbi4gVGhhbmtzIGZvciBtZW50aW9uaW5nIHRoZSBj
aGFsbGVuZ2UuPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+DQo8ZGl2IGRpcj0ibHRyIj48c3Bhbj48L3NwYW4+PGJyPg0KPHNwYW4+U3VwcG9zZSBJIHdp
bGwgaGF2ZSB0byBmaW5kIHNvbWUgY2x1ZXMgZnJvbSBzb21lIGZvbGtzIHRoZW4gZG9jdW1lbnQ8
L3NwYW4+PGJyPg0KPHNwYW4+dGhlbSBoZXJlIHdoZW4gZ29pbmcgdG8gcGF0Y2hlcyByZXF1ZXN0
IGZvciBtZXJnZWQuIDopPC9zcGFuPjxicj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48
YnI+DQo8L2Rpdj4NCjxzcGFuIHN0eWxlPSJjYXJldC1jb2xvcjogcmdiKDAsIDAsIDApOyBjb2xv
cjogcmdiKDAsIDAsIDApOyI+WWVzLCBJIHdvdWxkIHNheSB3ZSBkZWZpbml0ZWx5IG5lZWQgdG8g
ZGlnIG1vcmUgaW50byB0aGlzIDspIGZ1bi48L3NwYW4+DQo8ZGl2Pjxmb250IGNvbG9yPSIjMDAw
MDAwIj48c3BhbiBzdHlsZT0iY2FyZXQtY29sb3I6IHJnYigwLCAwLCAwKTsiPjxicj4NCjwvc3Bh
bj48L2ZvbnQ+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4NCjxkaXYgZGlyPSJsdHIiPjxzcGFu
Pjwvc3Bhbj48YnI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5BbHNvIHRoZSBhYm92
ZSBjb2RlIGlzIGxhY2tpbmcgaW4gY29tbWVudHMuIEFsbCB0aGUgc3RlcHMgYWJvdmUgbmVlZDwv
c3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj5w
cm9wZXIgY29tbWVudHMgSU1PLjwvc3Bhbj48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3RlPg0KPGJsb2NrcXVv
dGUgdHlwZT0iY2l0ZSI+PHNwYW4+R2VuZXJhbCBwaGlsb3NvcGh5IG9mIE5vdmEgaXMgaXQgaXMg
YSB3ZWxsIGRvY3VtZW50ZWQsIGNsZWFubHk8L3NwYW4+PGJyPg0KPC9ibG9ja3F1b3RlPg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSI+PHNwYW4+d3JpdHRlbiBkcml2ZXIgd2l0aCBtaW5pbWFsL25v
IG1hZ2ljIG51bWJlcnMgYW5kIGFidW5kYW50IGNvbW1lbnRzLiA6KTwvc3Bhbj48YnI+DQo8L2Js
b2NrcXVvdGU+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj48c3Bhbj48L3NwYW4+PGJyPg0KPC9i
bG9ja3F1b3RlPg0KPHNwYW4+PC9zcGFuPjxicj4NCjxzcGFuPkFncmVlLiA6KTwvc3Bhbj48L2Rp
dj4NCjwvYmxvY2txdW90ZT4NCjxicj4NCjwvZGl2Pg0KPGRpdj5UaGFua3MgOik8L2Rpdj4NCjxk
aXY+PGJyPg0KPC9kaXY+DQo8ZGl2PiZuYnNwOy0gSm9lbDwvZGl2Pg0KPGRpdj48YnI+DQo8L2Rp
dj4NCjwvYm9keT4NCjwvaHRtbD4NCg==

--_000_84CBADE295CC472D967AFAEB37050B21nvidiacom_--
