Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D694DC431D2
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 18:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B010E081;
	Sat,  8 Nov 2025 17:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ow47JNZl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0734910E081;
 Sat,  8 Nov 2025 17:27:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuL4nVIjvFwsnw2bftXSHCvWOO2iw36IDI75DXRL5mCZVRJ840QrkCF8ZgS7lzCyUmKGPGRilulB3cLyWqRN5em/zDiofuqj5jmgALkTB9w0U1w9+kDjA42eVJer0zHEuI0qTGiEpWL7l+oKEP6aW5yhuHGehD+27VDIsbB0oWrw7BwalTdF0calg46nhmJgtZSN2fDUCONiiPCkqjgLtYvV3snmfn8YX5vBFzjyCGFl3Byct5fpmyw10+xb9sx3WvfgVTnY9lMND1DhKCAPKB9F3j19CmTWLHnJyHGsTNTCWDRVyMbuMNh8jpEPPedocqIAf+pmG6CDXQyX86Pt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH6qUsoYl1IBB6MceeaWanrDHq1i0+UEJzOTGxA23No=;
 b=hfv6jIZfyxNOTwl6EN3KuQ0vuIJKtJAHmvtwVVAoDi0YGPMFAGbJAuN0ySR8rfa635aQnn1QGH4s0XRrmOTfyaimFn6uUYLK/RmbkvyqwHDrwATGx1cTgkTQsTsJuB4mt3sFJug/Qn0SVfAi2/Q/axlUKCUR4KM0RuQ5FVKxcLt9vkvubgnswF8igIg67kT2X2mifyvTePQqYwDNw2MxZ+Nc98RFNAGukxtCM/ovsqLGkgK7ZofyZrCahD+55FSJwMdzxBDvMmtH+x+KQ8BDoT8jfItg+/Jvz4PPRW1UPixxyUmsfP/Av+VnDba/bMY2dOBiv8X+lxdFJCAtQgC+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH6qUsoYl1IBB6MceeaWanrDHq1i0+UEJzOTGxA23No=;
 b=ow47JNZlIAEZzaWjK6FWW4xYXcTqOJNQ4a9d26NsUJx/J8IrbzB15SyEzZHVhAtLq/odyrz3XGs4i1hfrY1qSPxTnuJmhDpCIfLc66AS4T7D9RsVInpRT7d1ajM6uPkgwQJnvDNPGI7lIp3DDp026rx5R1E/db7Dp4CYTCFdhiEEnpjiCfJaJCXadW82klm2W15oc1BxIMVb+UHRZ93KvKHKJZW130jp9IZDnAPk+NUtIvJgvCg6apCuuHzAEy1abreAFlfHaJ8ZPw/PknczATl8ewCkJpDC5BWPa8TGLrpmU7jJCmDBLWwDA+ZJwJB6Kp2sC5APMeps0W7Z4RXqKQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Sat, 8 Nov
 2025 17:27:14 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 17:27:14 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, Edwin Peer <epeer@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple
 <apopple@nvidia.com>
Subject: Re: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
Thread-Topic: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
Thread-Index: AQHcUGm4XHfVkDQe+kGD6KnInhYSULToOVSAgAABVYCAAG6/AIAAX5uA
Date: Sat, 8 Nov 2025 17:27:14 +0000
Message-ID: <a8cc96d5ae80a256b9e0101acb1d1b38169d21b4.camel@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-4-jhubbard@nvidia.com>
 <5342a0f10a3e9ef7d3165bd8912bd042ae7f68f5.camel@nvidia.com>
 <05cdeb51-2731-43f0-b24e-53534b524a44@nvidia.com>
 <DE3ADB75TBUH.3ROHW8XJAC6K0@nvidia.com>
In-Reply-To: <DE3ADB75TBUH.3ROHW8XJAC6K0@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|BL1PR12MB5804:EE_
x-ms-office365-filtering-correlation-id: 3acc630a-ce01-48b4-f8ac-08de1eec0eb7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TWtzUVVWZnl6OE1HV3ZiLzVlRkY2SnN6bENmL1NFZTNzalNCNXExZXgzV1Z2?=
 =?utf-8?B?empva3g3aXBRV1FWU241dU9CWVhXUi9xRmdUSW93cFk3TXBuRkRyRm5YMEdE?=
 =?utf-8?B?K2VyZmxkWHdqK2dIaS94UTM2TjRjVjdxOGthbTMvUnFBNTN5T0RJc1IrTVpY?=
 =?utf-8?B?QnB3NWZBRWJTOUZqMXRQeVMrbHhaSU5zMUFWdVZqLzJXTjc1c1M3b2J4R1hz?=
 =?utf-8?B?OXR2Sm9oNzI3UG8ybXUvT1BuaVFhRE02Mm1BR1pQaDk0VkZpeUZTRUR3UXpI?=
 =?utf-8?B?WEp5enQvQ2FGYlkxMVFsMUZ1ZER1NjdDNUNBWU9uMEp2VEF1c1AxZ0thYjRj?=
 =?utf-8?B?TzRWNE5kdzZITk44UnFQZ1FYWm4yMGxPbldrczJmbFNCUFk4bUNSc2dJcTFS?=
 =?utf-8?B?Vk5xRDlhRzNWQ096N0svOEtQY21ybHVkdGVRYlhxL200QnNBcjVhdSt5elZB?=
 =?utf-8?B?ak5vMHRReUZOa0hOMjFVdlBJbXFGUE02YWJka0FLbVIrZTJlQnV1ekdadEQ1?=
 =?utf-8?B?aWcwMWo4WXZWcnorM1cwTXFXdlErU0pwTkZ4T24vNEI5NEZXVE5ld2lFWjFa?=
 =?utf-8?B?Rk9ySTRlUis1c1p3TEwrMUxmaEQ4Nll4TzRsbWptM2ttL1JBVGtSczdXK1VK?=
 =?utf-8?B?L3FSUEdkK2x3MGpJK2k0L1Fjbkh3QXI1aFNyamdWZWN0ZWJiZjgwb2VWS3pY?=
 =?utf-8?B?WlV6SnFBMzVEQTVZQ0JUbVQ2dmVzOXFLWkJ1VmgxSXZsL1VhL05wK3JhdDZB?=
 =?utf-8?B?WkgydEpZK0paY0dCMERKZDRhWVN4SXMraTRVd21WSHBDcDV4aXprNlcrWU1B?=
 =?utf-8?B?SEdGcDR1dmx6eXNuTnlrK1MwQ3E4dmhjQm9JQlo3K0ZaMUdhNWFyZ1pNOXly?=
 =?utf-8?B?WnhGUWJadmpnU2JzRnc1QzN0K2VzNGxMbU03NWRTV1FtK0oxK2M1VVBDQ2ti?=
 =?utf-8?B?U3JDelJMaU9mbUovWEJoelR4WDRoRlNFQWhiRUtiaGp0TGMzU3FnV0lFMEty?=
 =?utf-8?B?UzhCN0FSeC90Q3I2RnBWdUltTVVBMjEzalptUFJZYzJ1WnpTanl4NlM1OWwx?=
 =?utf-8?B?ZnI3T3pETytwZ0pYUnFYYzY4KzdmMm43cG5WaFRwZDc5aTZMbkJ6MGJVKytu?=
 =?utf-8?B?NVJjTUwvNG1ySGprb3VlVDB0MGdKWENFYjJiWXBYZGxzK0FyY24wWHptd1Zi?=
 =?utf-8?B?QUUvdk9iQmpPSVN1OTlhVnZYREFNdXhZSWdQRko2WWdLNWdwWmRCN0NKcUZ6?=
 =?utf-8?B?bHExajVSZVkyOXduTVM1d0VhNmNEaVdTUUJMSmtWS2RtNVh0RWtMZG4rOE9Z?=
 =?utf-8?B?SWIyeVBkaVFLdy9ZSU1Ccmk0a0lWNVRSY1B2aUxXOUlUajJFbjdra1lrS0o4?=
 =?utf-8?B?VWVzYjNvTTNrZDNzdDlOaWhOdU5CUnZQR3VacktZSU05TzBlWmd2bmNkNUs5?=
 =?utf-8?B?T1h1WXNWcTZkVjhaNnA5MDd5bkhXTFJuOWpoZzU5eC94ZS9wMGNxdVAyQXA5?=
 =?utf-8?B?M1pqcmRNaTQzcXJzQmlDZjFkZW5BQ2VSeTBQeDdxdkVrLzhjZEVjV3hqWHJ6?=
 =?utf-8?B?Zk5QWE5XNHl3OE5zSVk2bUhHS01RRkJ1TVdsditGaERVaEpzZ3ZxN0pweUJS?=
 =?utf-8?B?amxFenZVeE9ReXcrNnBUUFA3dFVEMERrOUc2Q013UXJtWVhDajBUemVXdC9K?=
 =?utf-8?B?UGRmaEpOSndVUFl1TjZuSnZ1c0JTRGRtUXk0MnZwVXlWK3IrNy9nTEVMNjF5?=
 =?utf-8?B?V2hWY1VFczZwMkxsdC9yZEJpRkZBSDZxREM0QVVYaDd4aWhlcGNDTmtscUI4?=
 =?utf-8?B?MVJTZjNzWUsyTHBVMnpVRzY3Zk5NWkV0dDlicXowNVJvdjBEcFo4RHVrMWpU?=
 =?utf-8?B?MlZlZnFsVTg3c1loU1B0eWpxWGx4L3J1dnhGeTQ1L3FpQVRLTEo0dkZheW9Z?=
 =?utf-8?B?YnZwYzBRU1pFZGE3akpDOXJIL1EvT1BtUFlHTkxSdGpxbUk0a1lZaEM3WkdB?=
 =?utf-8?B?ZjZjSWdCcTdVRUZWdURQY1NWZ2UyVVZiNXhyRnRyZ1ozSWh5S1hldkFhaXhX?=
 =?utf-8?Q?n2SwVO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXZvUDRPV3FqWHpmbEE0SWJOeGVxeHpZVkR0WnVjeUg3bm5uc1l0bjFrNWRX?=
 =?utf-8?B?SnlJYzhQek13SklvV013QVpZVElNOVZjeHZwQzVYTENKcDdXNStHZjBUaEZR?=
 =?utf-8?B?aU5GeWpZZWE1SG1iNXpTblFhajlCeU5Nc01FanMxMHZhRzlUY0EwR0czMElp?=
 =?utf-8?B?QzZqUUU4RnVqNWZ0bktKU0tlenhsenVzMGZlSzFMUDlmNGJNOEhkSVRSUE93?=
 =?utf-8?B?Sk5uQklMcEpqTGxWVzdGQ3J5SjBFVFgwSEM4UHJlelZwcVQyUTIrSmV2eGRM?=
 =?utf-8?B?c0JhMnVyTDh0b2ZQNHdacXJPYndWb3BiR05BRSt1MkJuSFRGVk9mQ0Z2OFpY?=
 =?utf-8?B?OTQ5TnRsVmRXbnlVUitoN2ZhNXdVRXdkRkdqYmhhVHd0WWFhbm1jYzgxYmJi?=
 =?utf-8?B?RWlyVlBQZ1VyNEZQZ3Naa1lKWVVJWHNFN1RWNGRWNWhXUi9iVEd4aWxSMVFn?=
 =?utf-8?B?WlV6NTZaVnUvRVhocEUwUkQrVmN5TEFUYWo3TEtsWGMyWUVBc2h0bmRBbkRn?=
 =?utf-8?B?aG1LNzBNOHdycGVlam0wekJtMWZuemlkOUVYYndBNGsrQXlkMnZtSVVzSUg4?=
 =?utf-8?B?MDB2eFhkazNHZ3c1cjZIWU5MdWRSbkhZbXVzUjluVXFEemdmRWVmZkxWbUNM?=
 =?utf-8?B?eU1CbFVFQnlkaitHUzhjWlo5bFJCSUpzci9NUkpQY1FhNXJ1TEhhaWh4WUV0?=
 =?utf-8?B?SHZ1M3pXNWQ3SXZ2aW9BTTdxZVVOeXRKaVl4NzZlbzZVWElmVlQra2JnQjMv?=
 =?utf-8?B?dUxKWExQQXNzNmZnb0NDNDM4c2JJVG1pN280S0E5VzlhSGhjMGRSUmgycXpK?=
 =?utf-8?B?SmtFTHZNb1BRTC9NWlZWZEQ5bjdxaUJETVFoY1NsamowS0NtZmJvVmVUOHZU?=
 =?utf-8?B?dDRkVUg3dmlnTnFKZklFSmw4WVR3UkFXWE5lbkJRWFUrZlppWmdMQXJUWUFm?=
 =?utf-8?B?Rkl2aE5JKzJWRmNaUVg4QWxZQUNMSkdmSUlReG1IemFVYS9aWE5XKzkxREZD?=
 =?utf-8?B?TzlWUXM2WDg2alBscFV2TE5XbGFaTkpWYjFpRVp0VWlrVVkveVBvc0RCYUpO?=
 =?utf-8?B?NWFnRnJDTU1VcmhIeE1tZjZiUEMrVHMzdkRtVkF4V0tGU1l5c1dQUGV0MG40?=
 =?utf-8?B?ZG5VeFZKdnhVa20yb0RoZEJvK05rOHJLaHJhUUVPZ3N5Uk50b3FURlU4NWZV?=
 =?utf-8?B?ZFRtVUhzTXovVnIzYTFaazI3TzZleFRnL0ZuRjZFd2Y3cnBzOXJqRXRSdDFs?=
 =?utf-8?B?dWRRQmFaWk1UTDJWQnFDU1NKaGpnT053aSt4Vi8vWnpPbHlkdG9Qc0pZWU1R?=
 =?utf-8?B?TE05L21mTzJjTisxeUxnbFhaRlM2MHFhVG9pSjEvZDYxNHRYOCtxK1pFZXJF?=
 =?utf-8?B?R0lHQmRFL1RQWlVEak5hUWljeTVabTl4dXhoMmxGZDNqN1JFcmdjMm9yYUZv?=
 =?utf-8?B?SnhabVo5VzgybW1Td0ZUUWNlbVE5bm1lMkx2WG83M2FHb0Z3RlAreTFhOEgx?=
 =?utf-8?B?NXlrRWJWTk0vMitFa0M0ZmE0SnBsWTM0UmgzQm1TYmIrTG1GY2dZR0xtK1FQ?=
 =?utf-8?B?U2pyRnY5b3o2cVFZb25maEZQNDJ3bzBHUndiWC9Td2xwMTFiYURZRUVmaGNs?=
 =?utf-8?B?Q25QYkZDd0dJUloycEQ4azUvZGJIai9OYkZ3TlpNWmVlUk9DdkhVLytzMzBw?=
 =?utf-8?B?YVIwdmkyZWZ1ZWlDZzJ2YkpmUmxFanNQSmM0d0VBZFhKUitOY2dQMWZlZlJq?=
 =?utf-8?B?Nk54dW94L2NXNGVCYk03SG91TFBha3lLQ05rTTJqM2RHRXFQdURmTmZtNU45?=
 =?utf-8?B?dk1YU291ay9wMWJ2Q0NjSURRK0J1WFNiMTZrTGplUjdIeGJaWW9BcmZyL2hB?=
 =?utf-8?B?VVVjalByckRRb1NLVG5VdzBPTjFBdmZORDRKcjFNR1RNYXFTTzBjTTQvMWll?=
 =?utf-8?B?by9ubG1ISVlRditNazRhcTNPSU81MXlacEM0dmJicWI0RTFWM00rV1NKY2ha?=
 =?utf-8?B?QzlJdWpEd0Q3TlNycUwrd3ZjNyt0cldybERsbHB3Vis4TXBsVU9yUzA0bnNv?=
 =?utf-8?B?UTkvSTBtRVVhK3JKYkVMSUxqRlo5YUhEaDdkQm13dGEwaWFlUWVtU0xUV05F?=
 =?utf-8?Q?7JqJTCSdSXX/GrgHIYncEo2rN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D718C6812E2D647926CD7EDF86BA9AA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3acc630a-ce01-48b4-f8ac-08de1eec0eb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 17:27:14.0827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5Z9kr4t8fNyeU6Zca3niIt2j8PKvHT+dYBDJagZQtZjA7vvR0K+/WkZkp4zpbAvCsM/+ssOmA5udaut/SmS1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

T24gU2F0LCAyMDI1LTExLTA4IGF0IDIwOjQ1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gVG8gYmUgcHJlY2lzZSwgd2UgbmVlZCB0byBzdXBwbHkgdGhpcyBiZWNhdXNlIG9mIGEg
c2hvcnRjb21pbmcgaW4gdGhlDQo+IGByZWdpc3RlcmBgIG1hY3JvOiBpdCBkb2Vzbid0IHN1cHBv
cnQgcmVhZC1vbmx5IHJlZ2lzdGVycyB5ZXQsIGFuZCB3cml0ZQ0KPiBzdXBwb3J0IHJlcXVpcmVz
IGEgYERlZmF1bHRgIGltcGxlbWVudGF0aW9uIGZvciBpdHMgZmllbGRzLiBUaGlzIGlzDQo+IHN1
YmplY3QgdG8gYmUgZml4ZWQgaW4gdGhlIGZ1dHVyZSBidXQgZm9yIG5vdyB3ZSBuZWVkIHRoaXMg
bGl0dGxlDQo+IHdvcmthcm91bmQuDQoNClRoaXMgZGVmaW5pdGVseSBmZWVscyBsaWtlIHNvbWV0
aGluZyB0aGF0IG5lZWRzIGEgVE9ETyBjb21tZW50Lg0K
