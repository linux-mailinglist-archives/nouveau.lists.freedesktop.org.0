Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CE3C9DDF4
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C08C810E728;
	Wed,  3 Dec 2025 06:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MXNk1jhD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AED10E728
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:04:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VoiliotXIzQZVYN1pISEioLZMGREGJ36WpRdzgCCwflNu865rMBPxKuUmIZhaTQX2U/lUnB+Xi0Hy1p0uXmt6Y7UgpJp3SYQRg9aFyTG+AcfnDaHlY2xMLvbYP+jRuZZ+p+1yTZgRFJvp47b81MhA+itbHLh2EqFkx1SDWZB+OlKzvZMAIxC+eWhDB6aQ5bBcL6n24Dfhmm1Dz4+lSJg91XjVpcF6jO7Yjc3lgdrxtrvDnYOQmNIgqgM2e5h2BmEMF3pde9vsUCx/N38vQijzDW8zWtONU0fHYSZJKcXttiBuD79/E54AomiGbhzHHFpVtoNmmWdm0V9TPohRbQPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQb7gDdXaCWpO0DGzmNUWt9SWssb1Rqy99a2T4Z/xMY=;
 b=PlEVmYFw0fX0UW+pWH2yytvybc3kkj8r94cUZZhGu6SsSiKwKBrqO8QdvnpSSF13SyP3yVZ/c4Hf5cvWyptGxUX8DmrtZSVOOqWDYDndZvOapvBAbQO4oYqfaw19r7o4ifDUQ2zjtVnn5xg+LkY4uJJi2sgpu0/n7XadA2vRKD9fCySD1w/WLNCXHfLFxxyupHcvMpFu7FC35bCvoxwIk0kSKpq80mz9L0z2/nAaMyYVPXIn/OPlwkdg7Cm5Y059iBJueiomQzwYTPJkB/XakJm4jiww2UT7SaaTmkR3MLOuIFwG2SX555pFY10qjePfwyrMQRKH1ju0mT+xMNwYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQb7gDdXaCWpO0DGzmNUWt9SWssb1Rqy99a2T4Z/xMY=;
 b=MXNk1jhD8ISB2rmAZ/wvHorasfISpBI6616quyxpPOdp2i3zjz24ip5E+7NA3sxAdEUioY0iukRrLoUiPDB3SQaaT7kWKvC4Df5MFGkc7m68Bqtj+7Oj2GvZiCPprd83xoPu7l7LpF4pdgCM9DBXP2LczIeoJLnYfVozabls3jFV1CuZ6f1t2QwrjqLKfGSNsZ4cJcbs0H+bqLACV3mKRVhEeI8S4yu6xDktsSRaWDu+LRFuMofZNatUCHtzzHd/hvDpPlM13d+JCYM6vOv7k9WjLFO7AzKJvnZRNsZu68UVxvbPjGxqP+rNYfVaXAAGqtRPrsknTO4afH6Y6KpDEA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:177::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 06:04:09 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:04:09 +0000
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
Subject: Re: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
Thread-Topic: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
Thread-Index: AQHcZBoJS0LpWW7qdUKyk5npiPOfsbUPbREA
Date: Wed, 3 Dec 2025 06:04:09 +0000
Message-ID: <a3dab9710988f6ccf2579c92b1751820a350af06.camel@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-16-jhubbard@nvidia.com>
In-Reply-To: <20251203055923.1247681-16-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|LV2PR12MB5752:EE_
x-ms-office365-filtering-correlation-id: ce655ff7-0fff-4787-f514-08de3231c64d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SVBJb29NOUsvTTJ1eGR3cFZuR3ZJelVXL3lJc2xoVEgzcjBKVlVTZGpKaGE4?=
 =?utf-8?B?OHlwYU1mYWR0QjB6TDJPSjFOSlJJN2pENVhUZEhwVXdkeVBBNUVhZW5JSTFX?=
 =?utf-8?B?NWJWcGx0elJUYUhkNTYzdE02bVNBSW5zckNOWHV3R2RxK0QxOWlEVjFhYVZq?=
 =?utf-8?B?TE5oZzZFVVEwTHpLVWVicnBOdlZSd2NSNk92cG9sR0FOb0V4N2RVa3N1R1hs?=
 =?utf-8?B?Y0NTNlVqam1jcG01dGhFQ2lqZjllSVpNNjJ0M2hFQVhkci80UnFIVGlVbVgx?=
 =?utf-8?B?OXJEbTY0dmVyR0tja1QwRW1LWTlpUnVvVnFXOGRlZ3lyUEU0WFF2emthamFi?=
 =?utf-8?B?eFVrcGtJdWIyR0xEOE8wRE9NNkcyWXFYY1ZoY0F6dHpmbUNxRnp5RDV2a2o2?=
 =?utf-8?B?b1ZHQ3JOWUk5ajJNQUhFcGNNVm1oWGFXWDRVRGdxbWFPWlkzVDMwdWpZVXZp?=
 =?utf-8?B?UU1DUCtmZEVZK2VnS1ROV25HcjQ2cXhjdk10aXV1VWcwYlJlU0xIR3NZT05i?=
 =?utf-8?B?MTVTbklqaktqZWFWMG9vUVl5QXFzM3FsbFJXNkNjU2ZZQ3Yva3NtTzlvM2RH?=
 =?utf-8?B?R01lMmJodG40RTh0d0dFWmJ1V21JUVljWmMyQXRMTi9sNEVIemZ1RHhnMmtk?=
 =?utf-8?B?MlJuVlhDQkluODBHblVnRTU1QThFUHJlRlMwaytObDBjMjhpclJvQmV6S3pt?=
 =?utf-8?B?ZXFDVG1QcmtkY2pZZ2s4OXpadytjamxQZWJ3NFY5MTRIcU8yNE56a2tJUUNX?=
 =?utf-8?B?TklqZWZzNXNYYVpJbm5tdEhrSTc2WmN2WDZGK0duMmJ3VExtZzR0R05hTlRk?=
 =?utf-8?B?bFFuMW9GVkRCblNaOHZmdTZwRmE3VGUySEJYNnM5aWVxYzJHc0gyOFN5UkhF?=
 =?utf-8?B?TWovZDNGSmdhUnlxUnUrZk14TStxditDODRyamozbXovOXg0MGtoNmxYRzJ2?=
 =?utf-8?B?NUE3ZEcwNTI4dE5meERvc25yVEJLOXMyalRNUjVWUzExYi9hVFYrSXNXanE5?=
 =?utf-8?B?UHJMNTZ2eHNJMUszY1lRUC8wVW5zVy9TM1oxcVhaanpGbEV6SUJmdStzaFFS?=
 =?utf-8?B?UWhWcDcra1pUbWhQMlFWQWlVQlcvVzh1MTh5dFBVbjJudWxSWEQ5eFVWRCtX?=
 =?utf-8?B?LytoSHhRaDlWOWxhMlpkT0JHSVJFTVVJRU5NQ2lhYkl2OWxOQ0RJVHNkdFRX?=
 =?utf-8?B?aEREL29XQmF5QWxWSWRkMWFWbmdKTXpxWDVWSmRlMVFsVmhsS3VNTW9ZRWd6?=
 =?utf-8?B?TERwb3grRjNqSnRsWnA3cCt3dWgrRnJORnBxSkx4UzVFZFVhNTB4eVBldkFy?=
 =?utf-8?B?TEpIZG8vN293RGRHdTZYYTlodnJCVDgzWFFoOWppM1d0bjhQSklOR0UxQ3Bu?=
 =?utf-8?B?Y25yMGZLYlBrZVRCb1hSaFZKeEMxUHo5TnlNYnMycGE4c2NQemZKRFRQbUJV?=
 =?utf-8?B?UXJVYWE2c1dJbHk5aWsyRi9iakwxTjUvcjZwS3F6Zm1PNjFIZDRuVkZ2OHNx?=
 =?utf-8?B?NTU3d3hYeXdqUm5kSHpTQXhCdWtDRndRVkh4QUxvdGRGNzhENjZDN1RDTDVV?=
 =?utf-8?B?em0yWERLUGI5NDZaUzlaT2hVVDFUSWlZWGl6ZUdxOWJVbU1FdCtiblBxRnZO?=
 =?utf-8?B?ZGxoN0FUZmxTemdzU2FJeTJablNDQ09JanZzTFZBdkw5Y0FmZ2x5Mk8xS1V6?=
 =?utf-8?B?NEorVEd0MFdzZGREM1FqekRqeU9rUHh1TUE4WEI4OEczVWJLRVNiZVlmOGpV?=
 =?utf-8?B?MUYzQTFLQmhJOVRuTElJT2ZPOHpUMXpkcGRIalhqVjFjQjF4bGZHMURYWm1D?=
 =?utf-8?B?VmhwMXo5U3ZQaENYVzF4WUJIbmw0eElRc2QrQ0ZCejFQVHJlaVI2N2E5eGlG?=
 =?utf-8?B?c0tFV1cyK3c3TUZaUGZzbkJuUC9TSUZLNlZrK2lhR0U5cnNxT0RkaTVJaWw3?=
 =?utf-8?B?cnpldW9wbElTU0I1dXM0QUtOQWVLSFpObldhdUI3d29mdi93dlpveUM5NGVZ?=
 =?utf-8?B?V1dtOVoyUGNlbkNKU2twcGlVaE0rZlBBdXRyTmlDejk4RXFQVm04NEZCM1VX?=
 =?utf-8?Q?K6Le2s?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0s5b1NVV2lGc1lwS1NyaEc5bVozUGgwcUI2Yjh6azNTNFRqMS9OenBkc1d6?=
 =?utf-8?B?WGtQL0hvR25IenRKRFdkNnNVV25ZcDdBR1dTN2lVLzhtSlhWa0hlalF4eGlL?=
 =?utf-8?B?MU55Nnd6WTc3WTRFWXVONzFiQ2dtV2dLMkxjZ0Y1d0xabjhRNGVxcFZiYWcy?=
 =?utf-8?B?OXd3S0dFT252bTNvTml6MXc4Y0VEdWdrV1RoUUJCMFF6NDIwSC9DSTFaSC9k?=
 =?utf-8?B?WGUzUE5QM1o5RjA0NVFTY1UzakhWR2Zla1RraDB3cXlBWmZMN245VFpBb3pL?=
 =?utf-8?B?UXo4dTltSXBGSGZ3cGV0UExSelNydUxnMnFmcjhkVXRmU0VqdlZNUG9ZTnV0?=
 =?utf-8?B?M2pxK2RHeWZhTmFpaG90ZmVURW8zVTdlK3lUcVZpNVkwOERJK2JqaDN0M2pY?=
 =?utf-8?B?NWlwRzZhRDFMNkZGazRrbEgzd1lWTEVkUGlvWjBQdThwWFRjSGJQOXEyRnFF?=
 =?utf-8?B?KzBMMEFPNkRmSEloZmF2RXhXUXFYaFVPU2Y3VEo5OUo4VEN0Uy9VTnEvcXpM?=
 =?utf-8?B?TnlNOTdTZGxZL1Y4UzVvdmpWdHFXck13TDVHdnhXNmYrQzZvWTZBQUx3dkRI?=
 =?utf-8?B?SURMMGVPVVNoenVXeVNGK1M4Mis1RHIrZW5DUkwvYUt5TzRDZytCSHNNT1d6?=
 =?utf-8?B?ck9jUmJsRTd5WHR2YmNsNjk2U2ErTXd5M2VkeDJyaVY2cTNmZVlPT0FZR0Zn?=
 =?utf-8?B?SlE4Y0JJTFZ3ZnVabW5hSjR3VXd3K2NhcVptNlppemErUUI0TjViVHp1V2pE?=
 =?utf-8?B?V0F3WkdlTGZHcm1xa0Y0Wll3RDEya0JicmluL3lLbEdLN2RlTGlQNHY0NXhW?=
 =?utf-8?B?ckQ0Lzl6c0d0ZnRPd3Irak1od2VIdWJoVE1MaVgvdUZYRytsaDVNTDcwSVJ2?=
 =?utf-8?B?Yk9iSzZEY0FPUVVoSS96OUNERHJwR1JuZEd5UWxwN1pIRUVGczM4dThGc0RR?=
 =?utf-8?B?d005UStsZG1XcWdteVRPbUVHNXZJSitLM3lyUW9Ld1Z2aW5SM2hzNnM4c0ZB?=
 =?utf-8?B?RFJOZ3VHelE3N0JVVGlYTmwwK1ZjL0c5Nm5PTyt3RHpVRUlkSzJHclA3L0RI?=
 =?utf-8?B?RGQ3STJzT2dLS0oraDdYNmJKTDlZendIeU84Q3VCSGNGSXl3dUdabGNqdU5x?=
 =?utf-8?B?a1VEM2M0ODlyMSt6ODQ2anNsdHkybzVNWHR0RDVleU9EbkVGalVxTUZjUEVh?=
 =?utf-8?B?YzJMVXlLN1c5U2lYZGxUWSt5N2FXYU5VT1U5Y3pKQXBCR0lmcHpBdDllc3ZV?=
 =?utf-8?B?a0JFY2hqMU9TWTJpZkRXdXhpSGttZldUMmh0OVV1eHFnOG1kM1JCTVUvWmY5?=
 =?utf-8?B?aXJvVENZaUl3S29OVWY0ckJzY0wwOURndFowWE53ZmZ4cU94SDlLMjJVWmVm?=
 =?utf-8?B?bUU0cFRxLzNoWHE1L2g4VmxHbUlEZVczalNZdGo0MG5HdnptOER0ZDdzSE5M?=
 =?utf-8?B?SUhyRmxVZjhoUmFVTlgySGVqbWpGYzBwVGVjL2QydEczOGpJZWErbHpLQXJG?=
 =?utf-8?B?WHZpblJkVmRXa3pwTVJ6ekdFaUhRdVMyVFJ5VEQwSVJwdU8xVmdpby9VdnZT?=
 =?utf-8?B?TC84U2d1V2U4MjdHQnJ2RGRzY1BneEdYOWZWUnkrbVlxdmJsVzVHTno2N0lG?=
 =?utf-8?B?YXp2OFltNFM4RG9RakZ3TWZ2VTFXWFloM1l3RWR6RVhMSGN3aWVSU0QvQlh4?=
 =?utf-8?B?QkNhc1ozb0NHWm85OURjbWM5ajNpMis3ZkV4Y05zT1RDa3ZISE9TUFlPYnZQ?=
 =?utf-8?B?OEg5KzA3T1IrWHRQYXYzWktDcExRbzB3ZUFkbmRpMFk1c0pXcTlxcitzd1U2?=
 =?utf-8?B?SVdVZkh0T0RhUVpmcVkyRWRHNFhMV0NTcHlsc05sUEpIV2xUdzREaThTZ0ZG?=
 =?utf-8?B?azVBNE5qZ2h0NVFGeFZyaWZRaHlRZFNsa3JUQThTUlprOGhJT0p0d0F6ckZU?=
 =?utf-8?B?Ukh6WUJ1TnFtMkhybGhGdlZUTjNLNVVHQ241MnFoamFGSUdPenpHVlljSGIx?=
 =?utf-8?B?bG1UWmt1UlhEZEFYeVF0Zm1NeTkxeU02cWNkSUhjTFZWZXExdkF6VURlL0hP?=
 =?utf-8?B?c0JtcWdRV1V4MWZ4dG92d3g1YnBkWEZOYXljQ05yTHRPbTQrbUJHckF0T3pz?=
 =?utf-8?Q?qu63IAAfcGy1ebqpmOHOeU1jl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F77522534867A4AADEF708A6111229B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce655ff7-0fff-4787-f514-08de3231c64d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 06:04:09.4375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R6hLVjPov4mcBxabhitegFmwKcBwI9Xt7DuT1Jt56N2wSNt9JZNpRHY/aSglrMwbfuHxTOv9Jh5tqOgO949ASg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDIxOjU5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K8KgwqDCoCAvLy8gUmV0dXJucyBgRUlOVkFMYCBpZiBvZmZzZXQgb3IgZGF0YSBsZW5ndGggaXMg
bm90IDQtYnl0ZSBhbGlnbmVkLgo+ICvCoMKgwqAgI1thbGxvdyhkZWFkX2NvZGUpXQo+ICvCoMKg
wqAgcHViKGNyYXRlKSBmbiB3cml0ZV9lbWVtKCZzZWxmLCBiYXI6ICZCYXIwLCBvZmZzZXQ6IHUz
MiwgZGF0YTogJlt1OF0pIC0+IFJlc3VsdCB7Cj4gK8KgwqDCoMKgwqDCoMKgIGlmIG9mZnNldCAl
IDQgIT0gMCB8fCBkYXRhLmxlbigpICUgNCAhPSAwIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gRXJyKEVJTlZBTCk7Cj4gK8KgwqDCoMKgwqDCoMKgIH0KPiArCj4gK8KgwqDCoMKg
wqDCoMKgIHJlZ3M6Ok5WX1BGQUxDT05fRkFMQ09OX0VNRU1fQ1RMOjpkZWZhdWx0KCkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAuc2V0X3ZhbHVlKEVNRU1fQ1RMX1dSSVRFIHwgb2Zmc2V0KQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC53cml0ZShiYXIsICZGc3A6OklEKTsKPiArCj4gK8Kg
wqDCoMKgwqDCoMKgIGZvciBjaHVuayBpbiBkYXRhLmNodW5rc19leGFjdCg0KSB7Cj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbGV0IHdvcmQgPSB1MzI6OmZyb21fbGVfYnl0ZXMoW2NodW5rWzBd
LCBjaHVua1sxXSwgY2h1bmtbMl0sIGNodW5rWzNdXSk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnczo6TlZfUEZBTENPTl9GQUxDT05fRU1FTV9EQVRBOjpkZWZhdWx0KCkKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5zZXRfZGF0YSh3b3JkKQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLndyaXRlKGJhciwgJkZzcDo6SUQpOwo+ICvCoMKgwqDCoMKgwqDC
oCB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoCBPaygoKSkKPiArwqDCoMKgIH0KClNvIGFzIHlvdSBr
bm93LCB0aGlzIGlzIGJhc2ljYWxseSB0aGUgc2FtZSBhcyBteSBwaW9fd3JfYnl0ZXMgZnVuY3Rp
b24gKHdoaWNoIEkgc2hvdWxkIHByb2JhYmx5CnJlbmFtZSB0byBwaW9fd3Jfc2xpY2Ugc2luY2Ug
aXQgd3JpdGVzIGEgc2xpY2Ugbm93KS4gIFdoYXQgZG8geW91IHRoaW5rIGFib3V0IGV4dGVuZGlu
ZwpGYWxjb25NZW0gdG8gaW5jbHVkZSBFbWVtIGFuZCB0aGVuIHVwZGF0ZSBwaW9fd3JfYnl0ZXMv
c2xpY2UgdG8gaGFuZGxlIEVtZW0gbGlrZSBpdCBkb2VzIEltZW0KYW5kIERtZW0/Cg==
