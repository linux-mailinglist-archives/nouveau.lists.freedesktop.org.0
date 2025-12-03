Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BACA197C
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 21:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C0910E147;
	Wed,  3 Dec 2025 20:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lqtvykLA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012021.outbound.protection.outlook.com
 [40.93.195.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4767010E147
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 20:51:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2YuzUM1ef4myYNjP8dvjs2sOejMvjtQwXvrMydCibOm0hdkN02h2h6FXLxReWnRw2ZABdFcFF5gLSHRX3KtBK00xDLafNxH2jgOiP41x/iA4bYXlcEXdZY+Kr0kz0tUQ8FVOB7xkm/rhVLfnLD4zgfG+oAUD+cufo3HQFdG3SaRh72Qgds1quIQXDXJlk2yGeqeoqxrjIuZQN/HcpHfkSpxHWCoFWuFC/zn0/Jw+TbbI4hcVtLSlxcAgSP5vQOeJIcwKyk9whTBFOYmBoj7NHN90prLy7z4xLKQbW0yIKTr/Iwts78esE8MkxmN/hkLxHtmtotJMKay0hBe5H5tXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRd0A7Ci5rp8SAL25UErJthpz0WxkoOcaJdUeJsdJZ4=;
 b=Y9diwTJQpt3Ds+FvCLsscrM/Fx6NrGnc91k42LLayd+PcBmD4W++1mb62oLrFmLBBLNLSeIl5j8k1Wf5l8E9x7PfrL1sEMiH5v8PTQ40waUZjYZGMGNQZ52cqPMg27LvMYwNKnqtTRAY3ftGM6xXS++QuY4RuWSYOuCLLcOhLRyCA88H4K1SEOUyKrjdAzAi89Wcryhkf+x/z2/5i+TxoZMihaOIQgepLkrcRh5B1DyBe7sn8eqSlxD0ojWOwHIPLlA85r6pd0GPRMJBbVbniVbAhszlE97dQLNG1Zq4Sc068DFAlbwXLAHc7Siycz/fwkK54ZKYXnWfxcLBpd5l4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRd0A7Ci5rp8SAL25UErJthpz0WxkoOcaJdUeJsdJZ4=;
 b=lqtvykLAWEqJRaMx6WoZHkrIBTsW82HNtHn1rHQ7hkm3rU/+1yDyT5KXbfkn4siGD9HNEcPdFv0UH3HryOLbB632Qok4jTmtpqVo0zeGwP/e4V2FBtcZBRfl9y8vwwI75s3NfJ8S5U0j0uWWMqonvZNnb94kRwHS9AUsMoZvYAVcAbfdMXFYnwAvBoGq7pV6aYX/14hFOaWElM58D1aiNr78VYHdnFKnV93Smiwmuo2q6jxUyQja5ya62T4mVQEiHhRNn86oSbbC0ge0WR2Blyib/IyFYTDiQ72+5q69JtZYwgVuJwg3OOpqv6lf0Ir89Xif1fqsR6GhhnF4xRxPFQ==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 20:51:45 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 20:51:45 +0000
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
Subject: Re: [PATCH 18/31] gpu: nova-core: Hopper/Blackwell: add
 needs_large_reserved_mem()
Thread-Topic: [PATCH 18/31] gpu: nova-core: Hopper/Blackwell: add
 needs_large_reserved_mem()
Thread-Index: AQHcZBoM4utadEgV4Ey5CjdRCNkJJ7UQZQ8A
Date: Wed, 3 Dec 2025 20:51:45 +0000
Message-ID: <0cc12131c0f48613811df893309904e940abf1a5.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-19-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-19-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|MW6PR12MB8914:EE_
x-ms-office365-filtering-correlation-id: cfd6ee31-9ec7-4c14-39af-08de32adc574
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?dXRVY2xUbmpYUkYvQVhhSVEvVFVtUWJyOGp3UHY5WGVjYVNCUVkxWFkzQTRI?=
 =?utf-8?B?UG9UQnFOdjgvdlFKa3kzMW9HRnI3S1JHYWFleTVKb2ZsVmd1ekNkbEgvMkwz?=
 =?utf-8?B?a0dhaW9pUk02d21zSy9ncDBTYThtTVBMVnJCZjBSRVNSU3J6c2p4YXNvSGs0?=
 =?utf-8?B?eHlPQmdyQW1pY1lJdi9ZOTVtNTJrb0dCd0ZXeGFXdXF6S3FJSUpjaDBkcitQ?=
 =?utf-8?B?bGZ2eTh2d010aHN3TTVMU0RudGhlOGtON3lLWVFZNjljR3lJUWRQMDNhdFdP?=
 =?utf-8?B?TDBEY1RsNmQwdERMVi90NGRjMUJPRUl0SkpZVGJEZ0JRZGR5dFBSR0FMb0hj?=
 =?utf-8?B?WHNWLzhzNG9GaHE5MjZVYW05dXMvTFVadmVKbHdKUTJreXJwYTRJSmRaVTZK?=
 =?utf-8?B?ZU1oSDdUT0crSW1PMzRrLzIvMVdSWjZOM0xMa3BhWVlYOGNQcnhwTFZCbWRV?=
 =?utf-8?B?NVdnQzdSampCanJkenRYNW1YSDRrQVdjTzlPNWcwV1J4dzdhOVczek1RQzAx?=
 =?utf-8?B?Z3l6OUFHQmxERWM5NWtPeTVaMkZIS3N2UFM4d3B2SVdLWk1CU09FdlZmanZK?=
 =?utf-8?B?bUtmWkxYWk1VMlNEUUJOcVZJUHlLMEpXdXUvUTNVT3U5VXhxTFFmTkNGWnpP?=
 =?utf-8?B?NDhrM0JYYnlTUEsvVnVZTnpIVi9pUzl3b0x0N1QrVURzQnk3MUVGQ2JibHNk?=
 =?utf-8?B?Z2Q0TWNVZk95a1g0TmNoR1FVRG10RGpCUFg2emxadk1pK1o0TVFWMnYvTHZn?=
 =?utf-8?B?VjNYaUZKT3BkY2tQQUdCd3BkeDJrTnJGV1BVeWFVMWpuUmNpWDRmYzlHWnVM?=
 =?utf-8?B?L0s5cWhSTmpyeG9UTEVzMHI1M1pzdGorNU1XcHdVWjFFVW9MOVRTbzMrZ3dn?=
 =?utf-8?B?b1dKbmtmcEU2LzJzT1Q1TDBpOGtlY0I4ZVNsT0lyRjlyeXBYWEk4QUo5YkRx?=
 =?utf-8?B?SGtTQ0VMNnA4NlA4SEZQOTU0QjRjSml0K244QnFTTHJLVDZzUTF5ODNmZkZE?=
 =?utf-8?B?cStaallYYVZOVGxYNmxjK09WZjhpN1JraE1wK05BblFiYXpWenFuUVJVUEla?=
 =?utf-8?B?Wmlxa0FMU2JFK1F1czd4c21rVDU4VzU2alNvdEZpWEpVOS8wSTVHenhyQVR4?=
 =?utf-8?B?Sk13d3VsRTJDQmcxVlFJYWNrdi9nNXVLS2tGbzg0T2dnNE5vNTFjOEdLb3E3?=
 =?utf-8?B?b2pBL0xhVjBacGt3bWphOGxNaEY5dzgzYUVjOVFRQkY0OUZabXV4WXpaRWJa?=
 =?utf-8?B?T3VQNkMyYVk2V0laK042SlQzQmllZU9kcENwMEhkNWtpMTV2N2tWYXpNWjBp?=
 =?utf-8?B?NXpPL3liOEhWMHZvZTJ3ODdHbnZvWTVBbWhmVXdwT29jQ2FKV2UvTC9nZVZi?=
 =?utf-8?B?dWlWS1M2WVZPYlduVmhIY2NFbWpTRlNXWGpYaVl5dzJLZUxmVUt2L0Q2azNv?=
 =?utf-8?B?VFQyUzNJbTQrLytVT2NFbDdFcGpHSkVJMGFXc2lxYmNlbXNsS0lLUkh2TUNT?=
 =?utf-8?B?VThUWVFTQVEwVXRDOUtyVEY5MFBvR1ZoL0RpeTN4L1FLenBLb01uTE56ODhT?=
 =?utf-8?B?cFd3WmdKdm1QcHFKSzRmV2luTUlvS214a25LODFYY1FqZG90V1djUGhXNU9H?=
 =?utf-8?B?VWM2SmgveXhZcXVYbDJCT1hha3ZITlkyemhHbmpVVWhMYkFRNzBHaCtPWk9t?=
 =?utf-8?B?RmFVemU1bTFreEhxb25lRFRsOW5XNlVnWVhZUTY3b3hWQTQ1R2EvZDZ2QlZX?=
 =?utf-8?B?bE41MDM1MU1INmltakdiTUQxRHZCNXJPQnl3ZUk0clR4T0dkQkhqOU9BSVY0?=
 =?utf-8?B?d0ZhZHFjTGwwOE5sb2d3UVNZWnYzeFZIc29Nc2lqOHlFN1JmUTV5cUYvTGhk?=
 =?utf-8?B?U3IraTl5eGo3TWtaY3haRWtMbnc1Z1hZOEdKdE84eGsrTHFZUEZjS2pVQ3Fk?=
 =?utf-8?B?Z3dYclFJZ2JFV2gvamxOSEUwY0gwSmdTR3FrUkExNndiMGhyZ2NxR1VUZTdj?=
 =?utf-8?B?bktoVnVwS004UnorQ0t0Q0p4cHpPWU91OTY4amF1RS9qNGNBWEM4YXZFemt4?=
 =?utf-8?Q?nEsGkm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEhodjJwMU9STWptSkM5dHlySGZCaCtkQ0JIZVdXYWtFZldLYWFJZHdPcjBs?=
 =?utf-8?B?M2V0bDFZaDBZL2l1Q2h1bjBxZlZTaHpQbDY0dUZaajJpZFBKbWRqTmtYcGQ5?=
 =?utf-8?B?eU54dDlvQm96MWgxWS9zUldyeVVTMmJScTk0amV1NlZBWkk2Qm00U29sZ0ht?=
 =?utf-8?B?VHFOVFRZQUhUMldSL3Z3WDJPVEl5bFg2U3JjQmZHSk1ZT2hLeEplZElBVktN?=
 =?utf-8?B?aUFXc0x2MzFxcnVoT3FZZ3I4WWYrT2gxTzF6YVRtTjZxakV1bmJMRVhvUlpu?=
 =?utf-8?B?UVdrVTNiMGd3RzlzUlNzczhEcVYvcG1iclBnM20wa0tPeWl1QXZlK2JQWG1k?=
 =?utf-8?B?TUNySHl5cXBVZHdTZWl4K1VGRFVtZk9xdW81RGF2djZRbElYc004cmpWNEs4?=
 =?utf-8?B?dUt2WllUNTlWSUdNV0VRSzhLNE01SFN5UU10VzFuVTJJZWo2UjFWQUJtbzZB?=
 =?utf-8?B?NDRaM2pQdDZVZGl3TjJlQjhyMFBKK252WDBmU05MSVZGQzRqWlZWa1FnNjZE?=
 =?utf-8?B?ZlBVRGtOQ1o2NVlvb0Q3T0I4VjZraFVKK0JGdUpaWUh0elRhemRRVk1SQ3hW?=
 =?utf-8?B?dTNSd1k1U2dTbGxRajVrRWovQ2FCcmY2anVFSFprVUw5dFhRZDF1bnlRbGNi?=
 =?utf-8?B?RXhTUG9SQ2c1NkZ0UmFwaEpWZUFLNjZyY010dTZvY1dXL1NnZ3l6cmViNlY3?=
 =?utf-8?B?WUdCWFZ6QTQrTHZLOGs5RCtQL2FSQmtLViszeWVwd1g5VUpVZ1Ztd0kyRWhJ?=
 =?utf-8?B?VHA0ZU5KODdOalZORHp3NDBLeDBMYm4yeFVCeHJQYzRETWUySFZ2cTVjcitH?=
 =?utf-8?B?V2FLRnpycm0vOEd5ZzRQV2FENm5kVERJZVFBOXM3MWZLSk1LVGp4MDZPZnBI?=
 =?utf-8?B?NnVlNWVINGM4MkFJUEJuT3hxTlZMNlVoT3BmdWZzaE12cU1XUzhTZ2o4c01x?=
 =?utf-8?B?QkN4L2o1MVBMNnNSaWdNWFRHZU84QjQ4RElkTWdQZFFWZG1WTFhaZWdxcm4y?=
 =?utf-8?B?TUJPTk5uRUFoam1lelVNNk5BOWhTcGlZKy9mSXRuZUFlSzRJQ0FVSCtzaFpx?=
 =?utf-8?B?ZDJVa2ZDMGFDcWxGeXJ4cHhLTnZWWFd1eG5OZ1NyY3ZpTzNEdHI5ZDQ0M1Nt?=
 =?utf-8?B?M09NMlZkdFZGN2Zra1VKa3ZIUzdHQXVEdHpQSUlsekx3RDJOWlpGazdIVEt2?=
 =?utf-8?B?eFpqMUFobzVzNXovSnAydXN2cEprMFlpc1N0a3RXM2hWaXo1UDJYQ200VWlu?=
 =?utf-8?B?MWhQTVU4WEZHZE1IbkI0NWNrRlZYcGxRb3pObVFDWnRlMEw5WS95bDV3VTJ4?=
 =?utf-8?B?MlRuMXBCYTZ0aXRqTm55UTdVSExhbnIvemllZXQ4aEptVWdMY0grN21sTUww?=
 =?utf-8?B?YWFVVGlDZDRmL3ArOGwxdWFwejlRU2ZsVzFyTUtaZnFaNkY4clo2eWxMUlla?=
 =?utf-8?B?Qk4rL2V0UFhoZzNCT2xWU2VLQkxTemE1QW03d1hvaHpvV2tNM0NMRnVoRGlo?=
 =?utf-8?B?c0tDWFN4b3hPWW9VaU4yRElNV1NQOXJlNTlrTGNiYWU0ajMxMERmNEUwa3dY?=
 =?utf-8?B?SHlYNmQzYmZwNmV6ZUlqTktlNXBJWXlvQ1p5SlBvTUJ2UG9EalpSbXFCeUlL?=
 =?utf-8?B?WDhnNkNlUmpnU2k2TFFlRTRFdEoxU2RKMWdrVk5yZUI1bnJISXBQWjB4c3V3?=
 =?utf-8?B?UWd3VFcwZkYwc3kyQXJaN0MwMkFuVXFIYmtKZW5rTkllTzlTc3E2eXRIRy9K?=
 =?utf-8?B?V1JvbytDRlJ4ZHBxeDJJYnovUkdSYWhpVloveno0RmkzMU1MZC83UlptaUdY?=
 =?utf-8?B?Q20xQ28zSzBLeFArUkJwc1hLT2h3SVE3aTZxcjc5c1lqalhOVmlhN2tjNW93?=
 =?utf-8?B?VmVic2gvZ3liS3ZJZ2hoUE5qaW1naDRqNnRjSGw2Qnl0TG43a3ZvVDdibDFk?=
 =?utf-8?B?TnNpUVh6QmRpMnBwOEdOckcxb3NXaUoreDlBWXNHV3VmbWd5N1BreksyWDlR?=
 =?utf-8?B?VFVrRUxKVE9aSU0yZEE2OUtsS2hUSldGa0NZRG1NVlhINEdMdTk3RWxDK2Jv?=
 =?utf-8?B?M3RIbVI4cmJQSFpJWnlIM2MvV05YWndCQTJxaVdEUVV1TTR3c0MxajlJMUJL?=
 =?utf-8?Q?cpgidHzpw+wDxkBNpXg5vzfyC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D0907CBF368F6428A6C67AE8F6D7B1E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfd6ee31-9ec7-4c14-39af-08de32adc574
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 20:51:45.6169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aGNLIMVfKfNIB2F3xS/O5+UPJ6n30hXZ/E/hr/YrhIseYjUY+HrcvcnsXvijEVH1yfR7npZAlrGpjJf+Gs+eMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ICsNCj4gK8KgwqDCoCAjW2V4cGVjdChkZWFkX2NvZGUpXQ0KPiArwqDCoMKgIHB1YihjcmF0ZSkg
Zm4gbmVlZHNfbGFyZ2VfcmVzZXJ2ZWRfbWVtKCZzZWxmKSAtPiBib29sIHsNCj4gK8KgwqDCoMKg
wqDCoMKgIG1hdGNoZXMhKHNlbGYuYXJjaCgpLCBBcmNoaXRlY3R1cmU6OkhvcHBlciB8IEFyY2hp
dGVjdHVyZTo6QmxhY2t3ZWxsKQ0KPiArwqDCoMKgIH0NCg0KV291bGRuJ3QgaXQgYmUgY2xlYW5l
ciB0byByZXR1cm4gdGhlIGFjdHVhbCBhbW91bnQgb2YgbWVtb3J5IG5lZWRlZCwgaW5zdGVhZCBv
ZiBqdXN0IHNheWluZywgIkhleSwgSQ0KbmVlZCBtb3JlLCB3aGF0ZXZlciBtb3JlIGlzIj8NCg0K
ICAgICAgICAgbGV0IGZydHNfb2Zmc2V0ID0gaWYgIXJlc3VtZSB7DQogICAgICAgICAgICAgbGV0
IG11dCBmcnRzX3Jlc2VydmVkX3NpemUgPSBpZiBjaGlwc2V0Lm5lZWRzX2xhcmdlX3Jlc2VydmVk
X21lbSgpIHsNCi0gICAgICAgICAgICAgICAgMHgyMjAwMDAgLy8gaGVhcF9zaXplX25vbl93cHIg
Zm9yIEhvcHBlci9CbGFja3dlbGwrDQorICAgICAgICAgICAgICAgIGNyYXRlOjpmYjo6Y2FsY19u
b25fd3ByX2hlYXBfc2l6ZShjaGlwc2V0KQ0KICAgICAgICAgICAgIH0gZWxzZSB7DQogICAgICAg
ICAgICAgICAgIHRvdGFsX3Jlc2VydmVkX3NpemUNCiAgICAgICAgICAgICB9Ow0KDQpNYXliZSBo
YXZlIGNhbGNfbm9uX3dwcl9oZWFwX3NpemUoKSBiZSBhIEhBTCBmdW5jdGlvbj8NCg0K
