Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04158C3BCEE
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 15:40:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214CB10E8FB;
	Thu,  6 Nov 2025 14:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ltaOcbi4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012027.outbound.protection.outlook.com [52.101.43.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE7910E8FB
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 14:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzqY7YgqKgw9GlBURLBXKeLD4d2u08g9um5SCKIlwz6/5zbiYs0dWBg8vQuBUdRQEdcWn2kn9O4QNChfVPLRYWOoBbhaTEz8sktMdhrSzBSrOyCIp56BoUsEhoB6nHV1F0agtMiMInQZAtNolDV/CpnxjT9SVAu1s/d9B/BWNg1hCaWkMccjN9TUu/pz5+HKekWUpdsmRlqkBD/z2FD/gdYslmbTbUuZKD5OeZVDggpiCPF58pP+A8voQOUWRKH5+PaOhWubvJ8COx9UozfHVWPvv9lrfCe68Mo3MjT5GQCHHCxKCrFC6QuvBHJQSwz25Nt6I2fFhygsIFShppKXYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AU7rczmrxvcSRJkeY7Zc/NVUgbex/xZhiimYMovflY=;
 b=Z8gbs3YIz/t8fpxzgZgrmfiDqtt1WZxgoDoX6Ji6YA0xvJVeHe4AEAKkZvsjZQ+u1/zk8PWQUblvIGHy9BRUc692vM5/xjabWweF5gYdiNqjIC++DTCYToO1JDvTzs1sa+Gy7atSAlapDRU9CZ03A27E7htKETmS5MhX+3mTlVSsQgWlOLm5vuyLSCyvRuZZWJsjktaYxNSrYmNlXxI5HEBBskSCV0qz83KhJLcDqG3I4G6FxXMhfnbtgnss31rtJYcIbNOMfBpu7d9elxZMn1HmpPFW6HRYdUrpbvlEuhXagLMgvkqmAQTEioJRAlnsDJjkRD3VCq7qLKVN9B5uAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6AU7rczmrxvcSRJkeY7Zc/NVUgbex/xZhiimYMovflY=;
 b=ltaOcbi4V/GjLQPr/hfCrQ1mW6gCQt93ldSeg+xl5NABeQvaEWIHQR9E6RQeAVRzuL/vcJuxq7ljxBIt1stY4ojTU5rBcILOsnf7Q35P6crDRGrisJE0N6780FHcZSxAXXvVwEylo9Rd9jVtxl8hnkkAFwaHeA9JruEwkVgXZe5G6AyY8mB5Y+RHoYc2HV0alIhpK/C2kwqqng1xIxQSMWwPIJw8u9I+IZGHMq3bFdZRzBHfpM1Q9doJEodPZb9uGV79FKJncieU3CIIdmgAkNC9lqoBIrPGAbHOU1tvHHqqmtH+1TI5zOesEUSF+zb5YXxen9NAMi1BgzbX4YsayA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by MN0PR12MB6294.namprd12.prod.outlook.com (2603:10b6:208:3c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:39:55 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 14:39:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: Alexandre Courbot <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 5/6] gpu: nova-core: regs.rs: clean up chipset(),
 architecture()
Thread-Topic: [PATCH 5/6] gpu: nova-core: regs.rs: clean up chipset(),
 architecture()
Thread-Index: AQHcTtEW6WvYCASPd0y+Uu4EnajnL7TluMsA
Date: Thu, 6 Nov 2025 14:39:55 +0000
Message-ID: <76dee3d0589b7747c9e60fd802aae008f2389c8b.camel@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-6-jhubbard@nvidia.com>
In-Reply-To: <20251106035435.619949-6-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|MN0PR12MB6294:EE_
x-ms-office365-filtering-correlation-id: cb10b7a0-69c6-4e4f-4a41-08de1d425a58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?VE1GY01DNGM3Yi9KUnJXUkt6dWRlR1djcHBZMDhxSDNvaFRoL1BuL2FnclJ2?=
 =?utf-8?B?aWZ1N1grYVIrRVFzNWNtY2NoSEswMW9UMjlJWWx2QmVKTm1PeTc0cHEyME1G?=
 =?utf-8?B?Kzk0MXM4K0VhNlZBSTUwMzdWbXpIWUlrc3lEZ1gyZUdGOTluWnBWNENuQURJ?=
 =?utf-8?B?dUxUd3dIeWpFWE1OZWhMUEJEcGtPTHZJVnpwckM0dUk4bHltRWJRQk0wd0NO?=
 =?utf-8?B?SmZUYVYrMDg0aUo1M3ZwZUxOUzQ2VldMK1FhcXFWd2xWajVIUThNYit0aUtJ?=
 =?utf-8?B?OFMyUUVLOFNnZXdIQit0V1Qyd3g3ajBhaVEyT2NQOEQzcTFnZGpFYWgyTUl4?=
 =?utf-8?B?UUhLamdqaXN0Q0pzSVhMK0g3dEVqOWFjS3JyUTNlbmNhVTR3VEpsYnpFb01M?=
 =?utf-8?B?aXZZS1hBdjgwNGh0Q3FzWThSUVpKMFVvOVZ1dXp0amZacFZlUWZjd2VadkNG?=
 =?utf-8?B?YjFOQ3hLcWFpcC9HYWk1RFlUSUJjRTJ5Q0UvTzlDK3JzZUtnWmN6c3NwQnla?=
 =?utf-8?B?bi9MaS9JRFQ5akNPTHQ3MWd1RUJhUjM0eDd3YVlxczJiUlFjd3A2cGtQbnJR?=
 =?utf-8?B?N3h6dU5WK3EySkcvMHJhVFNMQ0tkaEVmcVNzQVlNM3BYRVRJR29pbzhVYSs3?=
 =?utf-8?B?bTR5Vm5PMDd4b0ZaUHJ0VUhIRDFnYktQZkp0b3ZTRGIxRnVGMEJ0Qnl5WGIw?=
 =?utf-8?B?Y2l0TmZZTEZHbTlXckJKU25kS09haDFiNFk2SkFoV1VtVkJ3NE9Cc0dEMUFE?=
 =?utf-8?B?bFRGczF1c29Ja1M4OERMNjNKQkM5ank3NWdiQTR1c1RuS1kwRkcva0FEVlk5?=
 =?utf-8?B?Z2hYa0ZET0habjJ4S05FSGxDa3dodHZwZ1JIQ3U1N29CWWxVM0hoVXVRcDVt?=
 =?utf-8?B?bSt2QnI2clRCY2xWZlhGOEFnSWFMZERpeFZjcW9ydGtJVGRFekxDamdBK1ZL?=
 =?utf-8?B?dGJFUEM5TXcwU04vNTdGb01kZEgyWnpwbWxpZmlic1JuaHJGRy9yR2VDVkl0?=
 =?utf-8?B?cWQ3TUY4VGJLZEF4cUwxUkNaZUgzMmVzWjVzWnZoMHRZZ2Z2U1kvSGF1WVo1?=
 =?utf-8?B?UDhjbXh4bkMrY2pUbnhJeXpnQmpkSjdpQ0NiZHM2ME9RY202VG5ya0V5U05U?=
 =?utf-8?B?emhiN3lqOVljbjVxZjF3QlNqZHRwRWFiSExXaFEvN2dSMmROOHp6Tm4ra1ZG?=
 =?utf-8?B?bTJCa1RFNEFvQTdGQXU3S2tqNHV3QXdFZXNBTE0wRyt3UlpvSG5udGtycFg3?=
 =?utf-8?B?cmpvamJ5TmNkaWRrS0RCaHFwRjVHbXJPWkhWNXgrNWJJUzRVS2wzbG8zSzJJ?=
 =?utf-8?B?MVllaW54emZUSVJUMUhkWVYrNHVPYlU3SExzSDlJRXBZcmVOUWtCYW8rR3dO?=
 =?utf-8?B?UU85Sm5EOXBrU0ZyVWQvQzA2WEZFY2ZSb0t0WHh0OVJwbTB5S2t2K2lrZ1hL?=
 =?utf-8?B?Z3FZVUt1N01xa0dMVjF2VFpzTSsrOXRYM3VMZkJUSXlNZjdsU1RYY1l1NW9Y?=
 =?utf-8?B?TzA4RG1kZDN6U1U5WWszWkxGMHVFYUJST002SGM3enI5NjJadUp0cVNCVHFo?=
 =?utf-8?B?RDd2WE5rWURVdnVTZ1A2UFh3VzFIZGdCS0hPU3lDQzRTYVdKSlFaV3IreGd6?=
 =?utf-8?B?dk9tdnc5ZDgvT1dsc3N1WDRCblV1dmtLaVNzWncxNXlvdXpacXVDV0luY0p3?=
 =?utf-8?B?YS9ERkJWZHRqMkxBRUlacnROSXZhby90OU53SWZ4TkhFdFh6eWNrWnRaUW1Q?=
 =?utf-8?B?WEwwenBYTGhWTkFrV0RFU3ZIRWMwTTBBQnFLMzdFMm5vaVk0N3U2NisvSlBz?=
 =?utf-8?B?RzAwQWpDNlp0MjA5eGgzM2NnTHVSVDZ4bFF2TUxpWG1BZVJBdmxnTE9VMUh5?=
 =?utf-8?B?VXFqalY2WWkxdFV4V012alh3bmVGU1Rsa0h4MmRrSnNMMTRjVWVydW1HWkx2?=
 =?utf-8?B?UENOcWVYS3gybCtrSnNaM0J2TTFDdzBTYTM0ODR2Z2xwR3dRTG9YU3JzaFph?=
 =?utf-8?B?OUZId0JramI1M3JVc1lhVGY5OGhLRi9BellvUjhMZ2Z2aWlOYlVJd2xYUGhI?=
 =?utf-8?Q?mMDtbc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KytWQytWN1huWXo5UVJXZHIreXRDOEQ4VnlkOGNBanZzWXZJTGJzSTZzMEcy?=
 =?utf-8?B?TVVkQm45bUtoYXI3a2FBWUVqT2pRcHFvU3RYaERQeXkrdFZjZ2NOWWxRbmhL?=
 =?utf-8?B?K0VlaVZzTXNkK0owYWw0aTd4eFNzWDNDM3Z4OVFGdmRhcnR1N2dweGZEdHda?=
 =?utf-8?B?b0JvekFna1lFODlUNzJIeXhmMkFTQlA3L2ZpKzdIZXIvcVNORTFhMlNYRTVJ?=
 =?utf-8?B?S0NUd2tYVld4THdzQUZhTlY5cWNtYngyUlVWcFJKN0dCNG05R1U0YW8wTVRJ?=
 =?utf-8?B?dDdkcU5vOGE2cGl2MmRSOW5sRFo0L1p0YzF0MGFKSHl2by9GbCsyQ1hjN0FD?=
 =?utf-8?B?UHZWV09RbFlCWEMrdGdnekwzZHNuc0V6cEpJL2NCaFZxQ043Uks0SnI2Sms4?=
 =?utf-8?B?REluS2J5aGtWUnM4QmEreGg4NnludXJnU2xaaXNWenphUGovbi8zeTB1QWVM?=
 =?utf-8?B?dWhwbkxnMkRjYmt0TUJTWnAvUmNFenptZEdJelN2TFZxSWVjUkdDYmYydXYz?=
 =?utf-8?B?eXhFV2RhbU80TlBxdmo5ZUsyam9PbUFuYXdLSkxwazk4M2tUSDRTbHl4dlN1?=
 =?utf-8?B?aDZmNi82NzRhTGJGWUEzeVg4VHc5M1lJdTlVS3ErZmxKVnFray9ablRBbXk2?=
 =?utf-8?B?NnhyTFZpaXZQcDNHdzEvT0h0UW0zUTFFUnJkNWc1ZTFKbGZqUVBIbk1tM1Zo?=
 =?utf-8?B?K09oMUVtUXp6SURtd3pZVS9ha2tHRTNTdVZkb0JqYmlUVHo3Q3Y1OFdkU0R0?=
 =?utf-8?B?c1RhUFJ2czlzVnRxV2JteFhPUHhpdk13M2ZzcFEvRlc5M3c0bndUR1pSUThN?=
 =?utf-8?B?SkJKcVNxcUpLQWF0TTVJSEY0ZTVBaWcwKzJVNFcxa05jNi9iMDhEbEZ6MCs4?=
 =?utf-8?B?UkRjcU1CNWNSZ0FGdUdrc0FkRWhRMVhxdXErWHVTYkJzQVR4eGpPTmFVZXVp?=
 =?utf-8?B?WkFjTHZTR2ptUHUxb2ZZTTRNQWYzRTVSRXpSSWpBWVNQRWx6U0RMakoxTHRV?=
 =?utf-8?B?cFBrZzhBZmZtcGRSQVdKL01POGFXb2E4QjVqMFRacmJHT0JCUVRMZm9jTnpR?=
 =?utf-8?B?eXZJREZDWnNNZDZITFR2RC9BM2RKNjRwZWxmaUZxQ0NyU0lFZ1RySkJVc3Zq?=
 =?utf-8?B?RksrWW1XY0VGKzh1T1ZTaVE2L0Jyd0xPeGNKVmN1dGtwMFM1Q1l0RjkzeUQz?=
 =?utf-8?B?VUZoTGl2QU4yQWhMa3B1Y1NPdG5RV2FHLzU2Ukg3Z3Q3VEhwdTNWQ2QxWGcy?=
 =?utf-8?B?M05oSmoya3lycExSSTl5bzkrWVk3U2hNVFc0Wm5YV3JkOEUxdkpvWlhIUlNu?=
 =?utf-8?B?OSs3aWJMNUc0aTVNRWR4bnVKV09rWUloNFdtYmZaVzRZNHJIRzRWR2sydnlO?=
 =?utf-8?B?UUk4dFY3bGs5VDRMa2JXL3pBUERFVnk1SFlNQmRJQjFDeHpvbzluWmtHU1h1?=
 =?utf-8?B?N0RlSk5WRVMyN3BDVDNseDBTTk1SS3EwR2dhZG1pTGx3aW43d0RLT1NVWWVI?=
 =?utf-8?B?Y1ZQK3hxc3F1akZjZHRSall0amtkTVQ1STRvR2w4SHhMVmtkRzk1Tk4yb1Ew?=
 =?utf-8?B?UE1UVWJaaERpdTJ4R0s2R1F0dTZVQW1BOW1SbXVrM25YRzMvWVNGZGNCaUNa?=
 =?utf-8?B?KzBnRURqelVoZGVjcy9iK1Ura0l2SWVSWFBZVy9ZRDFTbkt4MUNIRVVEaTZW?=
 =?utf-8?B?ajJTK2dPUkhkeFFNZWRzM1YwTnRzODArQi9ZdHIyYlprd2s2Sm9MMFRMb1Fx?=
 =?utf-8?B?ek9PWVpqQVFiZE9TM2J1WFd0T212QXVsRDZYOFh2YSthbzVGbENkN0hFNCs3?=
 =?utf-8?B?VmgwK1ZycjRseStETUV1VDVGbDlCeXVNZVJUM1N2c25yenNJVFo5Q1hEeU01?=
 =?utf-8?B?Mlp2VDVtMXlCN0RYOFk1VVhUaFozbXlEWXdVRGdESVpjcm9zZXd5U0pWZXJp?=
 =?utf-8?B?MFVwalU5QVlNenIrejJhUFkzZVRyNmRoQ3VILzZNWFhBWFZkbFNpUFVEREdt?=
 =?utf-8?B?a21xWU9QZlpUSGxUdXFvUUZYMk1Jeno0WFFRLzJtSnJBYnU5UG43RVJ0cHRD?=
 =?utf-8?B?cUxvcWpyVmduZGdhRFVJK0R2a1ZJRko5aTIrN1hwcHBTVSs0U3A4RlBnOXdq?=
 =?utf-8?Q?KWHqlsFJ2+2AbJvrAFtBNU7Oy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <156E50E150B5894A8AC8D378818B490E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb10b7a0-69c6-4e4f-4a41-08de1d425a58
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 14:39:55.3755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B24hW6szWoKpoDr9u7wnId24cgWvmQBpf7kpBkoWfWJqRu1u5ZVIDqCbl+Y4jxlHJhgm5THVJob5y/Uo/QouTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6294
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

T24gV2VkLCAyMDI1LTExLTA1IGF0IDE5OjU0IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IMKgfQ0KPiAtDQo+IMKgcmVnaXN0ZXIhKE5WX1BNQ19CT09UXzQyIEAgMHgwMDAwMDEwOCwgIkV4
dGVuZGVkIGFyY2hpdGVjdHVyZSBpbmZvcm1hdGlvbiIgew0KDQpEaWQgeW91IGludGVuZCB0byBk
ZWxldGUgdGhpcyBibGFuayBsaW5lPw0K
