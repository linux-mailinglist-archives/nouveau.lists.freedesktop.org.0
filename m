Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4DC1DF9B
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 02:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6315210E876;
	Thu, 30 Oct 2025 01:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DK9UUFs/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013023.outbound.protection.outlook.com
 [40.93.201.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510EB10E876
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 01:02:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUbnuR73g+ccnmn6nfiaXUYzzYEq7UVS29t1P3HMJcl++pwx7Wn2IMUFgk5TClbtV3SDyUVjVUPoWI7Ydri77Fr6VOFChl0XKcgCs+hWKO4E84ova5dL8a10ZOgOIO7xA4W2Q0RK3ekYwD2TzqdnhFGezj7todIsKJfCnpSaugJ3UD4PiJRw4KnuXQxci2RlXOIM94YIu1B1PgicSIJmgyKxob4LHOVdVr2ZObhdrFPzM0M9JuEqBRP4fXp3N02hx7Uzha2mWuAEDCfLnLlES618LTP2JX2xCkVetSGocQStzOWmba577U8sCXAIR4JY8shttzzkDyZollyH4ABO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gyIfu54PLpS38XpMHPhMjMex/fWpMGwiq7MIDw4dm/U=;
 b=m7OptyapLSkNaUo3PEebjvHkJR9Ii2SzFt2QUiKqpakQ3Rb/BN3aQ7hYfSpEKwvNRdr51NfUrR9hB0l4h5UCsZ+fZFP5jN2mrVnYpoQUndKPg8HY1zmB3jzcvd3lDG8xPpIgqkazbENcbevsvuhR3GKJtUcddF2bRcfcQr3e9vt3t40/iniSrzL+PNlBJJLUdF4lP4tDbj8K2O4i638IT6bG2rfk92Ikxp230pYJtEG9HI8S4yM1zUq/61oH8HxJxmXdGoG8POwvJ3qFKfTWz83+bek/Ltx7bMeuTFZ7OlCwhHyi/SPixNAH5GqzpNIWyZhOMaDZvYMz/HrUjWt6jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyIfu54PLpS38XpMHPhMjMex/fWpMGwiq7MIDw4dm/U=;
 b=DK9UUFs/5NySeCWNlLLKvnMAKem8ti0LbBpUeE8D2MC2pJqJkcDHPXRfLzthcNUe3wVJyQpBdpYl76QnQlLEzp+Sxoa7dIaiG7jFXz3zazmv7UprM86rIUUWOUhJbojlsEo1hESgEUXf3F9q78T5hLXum2KCWH8WCixHSujiLwrhkN1JpR9nnSVsTBLlVNnqBwiVxFljmy1y8vry0dR/CB2iex3PAQUDBe2skO+GxTbzdDmscFLzwRMvYH4JcHxkb/BfTjJVuNQ/KDEUDBmhS8n6UqtMhjSXBdDhzwtyqXXZpDD8yj2M+BnIRmkPMF2vh4L6upTKJgWXzHlnL/SFrQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA3PR12MB7783.namprd12.prod.outlook.com (2603:10b6:806:314::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 01:02:00 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 01:01:59 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
CC: "lossin@kernel.org" <lossin@kernel.org>, "a.hindborg@kernel.org"
 <a.hindborg@kernel.org>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, Zhi
 Wang <zhiw@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "tmgross@umich.edu" <tmgross@umich.edu>, "alex.gaynor@gmail.com"
 <alex.gaynor@gmail.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, Edwin Peer
 <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, Alexandre
 Courbot <acourbot@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcSICfwqqVMX2fo0egTMdmm17vE7TY/MCAgADaswCAAACzAIAAAPSAgAAHe4A=
Date: Thu, 30 Oct 2025 01:01:59 +0000
Message-ID: <479ae6b7fb05376d21bdfe1fcde9e3705c11ecc4.camel@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <a24876cd-1a41-488f-968f-38d2ebebdd39@nvidia.com>
 <72be0fbab026191152154b1f04a45b32dfeb402d.camel@nvidia.com>
 <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
In-Reply-To: <b9686644-e2dd-4abf-9dd7-fc12081f400f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA3PR12MB7783:EE_
x-ms-office365-filtering-correlation-id: 85406d8b-eac3-4d7f-a0c7-08de174fee25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?S1FpUEc4aUM0czBXNENHZ2phOUZ4STdJQWc0TThvWmdEY2puWEJEaEc3Y1hG?=
 =?utf-8?B?OHJSbncxL2NtZmdTRTk2Ym5MejgzOFhSUFhwcXBKNmlEMWEvMGFqbHZZSDFx?=
 =?utf-8?B?Q3dYRDVPWS8xRFdjdlVOajNrdlZKalNOcGhUMngvYWVzSHNKbWNsQ3VXMmdJ?=
 =?utf-8?B?eCs4WWF5MitMc21xdS9nZW82S0pxQWsyOTJNTEJLSFY2OGZ4KzBMRDg0Nkxt?=
 =?utf-8?B?d3JZVXl5Z0ZyWURuaGIyOExjelF5ck1IeE0zN2Y2M3RkR2ZzalFoYjV2YTAy?=
 =?utf-8?B?K21taWM4aTRFYjlSblRRS1k2dkxKZUVEN2pDcXVOYW9pZlEzR29TcTkyV0ZO?=
 =?utf-8?B?WmE0eU5GSmd1ZVlYcXg5SEQ2WTNldzdKaUtEcU1GMzZwZlUxeEJNOSt2VGYv?=
 =?utf-8?B?K3ZRV1A1RXNoaVA1VHBPU2E4SnlLcUcvUlJ4dTIwNGVRd0x2RWppYjJzYlI4?=
 =?utf-8?B?UnRkLy9LMS9MMzMyRWdDWTM1OWV2V25Yc0JITVhndXlOYlc2QXFBYVNXbmNx?=
 =?utf-8?B?ZklGVVBwNW14T1JyY2hXTm5TbDRibnJaZlFlYmhuNkx5N1NaTEJhV3Y0cjVl?=
 =?utf-8?B?NXNhNjFiTkpiYjdTekpQQS9CNU9PQnpkeXpnMWlxemdLMnlRTGpTY1ZORHJL?=
 =?utf-8?B?cTkrV2x4SkQraGNndEJMUWFlRzZqV1BPMkhMMFNNbG5XOFRZT2p6TVlKYUpz?=
 =?utf-8?B?cXJWREpKdGNmb1REMWcvb0FBNk1QZjZldDF2bUhxWCtwZXNJeC9ham5seXIw?=
 =?utf-8?B?UGYyUnZOOEYwdzdKMUxnMHpLYklsM2NEN2E1SFptT25WNkNSZGhubm4wa0Qr?=
 =?utf-8?B?MzJlcGl2eEQwZTh0MGFMWkVIU1NEOTkvdnBsdTNsUHI1Mk9GTWhueWdQeita?=
 =?utf-8?B?djFCWUhGZXhGeWFtT1hSdlBzS2h5Qkg2cUVxQnVwVFNBUkxFTWVOTjRjZlR5?=
 =?utf-8?B?eWxZcEJ3cGNIYzNCblFpTWx6OFZyMWlqdnFSNnYzS0wrQ2lTY3RhNndmVjZG?=
 =?utf-8?B?YStxZzlVMFptTWgwbE9LQW9rbzZJTXJWKzRUeStmYTNQeEV5MFVRK0owTy9v?=
 =?utf-8?B?TnByN1JSVGhXWWswZWtrZmloaFhPSUdQZUNFdHJyaTRXZDJNZ1VzU2Q1cFdk?=
 =?utf-8?B?UEt6aUxhOHFjQUFMRUphR24xSmEveHVRcVIxN0t4eEdjRy8rOTZNdngxd01k?=
 =?utf-8?B?NndtS3k0Ukw3S2VqQ3BTQklHTXVLVHpzQklxZEdlNUhKM1YvTm1NOFdUYW9U?=
 =?utf-8?B?NDNUSThLZWQxSzVvUzBCRVdBU3JOdFQrcTFEU3hKY29yZjR4NnMvWnBYMnAy?=
 =?utf-8?B?dHVRckNmWmZpelIxSnl3U1ZHci9XeXpEN2NtSks1UVdCWGQweUxrSGFieHQ0?=
 =?utf-8?B?WjBsMFNoNzNWS0hZeldLMzFWMTVwTld6SCsyMW94MUlwNkc2QVZ0QlBDcEdp?=
 =?utf-8?B?QVRvUVN4aVFnRFZEY2NnQW1NQXVpY1ZYbklwaEw4WFBGbHNkd3JGSVFjQVkv?=
 =?utf-8?B?aU0zaTNzblA4UEhCT3RvMFRkaHgyWjh2ZFNpVXFBWTJBeklHTExHU0FIN0tF?=
 =?utf-8?B?QzVMOWFtVysvM3RFZmNEWXZ2UmVVRUdOTC92T2hsN09ZZVc4bDNWbVZhNWR3?=
 =?utf-8?B?YUJ3TGpGUkhKbGtWZURiVjNFM3hJazlEM1Z3ZVpORmtwaFF0VTZNcG8yWU0r?=
 =?utf-8?B?eVQ0QnpHUHBwcGRCYWZrSUZ3ZGZFZ2JlMElQa0V5cGFEWnNiN0lRNUJ1MXM0?=
 =?utf-8?B?dEQ4dzNKbWVZRDMxQjJsYnJqekhiUU92MVNtcUkvUmt2V050RFNPL2NlUkg1?=
 =?utf-8?B?U2xSQ3BNUHhsQlVqdkJGRUozcDFKbmg3M0kwUnIySjI0amZTL25jd3F1dk5o?=
 =?utf-8?B?Y0pBb040WEdMZllaN05QcXRHNTRDdk1DWlpxL21tTHhsZjVtV1JCV2tDbWpF?=
 =?utf-8?B?Q1NIUWJLY1M3d3ljc1ZadjJIYnRzcm43WWFCVmhOWEVLdW12OEZnNk0zTk0v?=
 =?utf-8?B?d2UwWE5pNzlaaWlER2RnUkJOZms2MVppdi9BN0x3VFhNOVZpdGlydng2MjZE?=
 =?utf-8?Q?rn3MiE?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFpzRDNPZVJ0NVBTN0c3ODQvRVVCTGg0K21UdjBRNkNsVXhvTFpiWGhheXVr?=
 =?utf-8?B?ODV5M2VEZVp3eVVuaVBhOFZWL2JNRUtQWjQvZC8rcmwrQ2ttMXkwMU1MOFR5?=
 =?utf-8?B?bXJrdmx6YVFNTlZtQ1NYN3RlZ0tIMnFxR0w1LzBUbi8zZ3ZhN0NXeXkrN0pK?=
 =?utf-8?B?ZTdIQ2JGYXpiZ0QrQ0tKM2dxS3I0WEFzWSsxcWRwWkkxS2RpUG5zOVpobXph?=
 =?utf-8?B?WlR3enMzWFk1UE54Vi9HWURpL2swZDFiZGJRd3VkcFp6cWlHZ0diUlFqeUQy?=
 =?utf-8?B?Z1lVYmk3b1RZeWxBOExTZkJKcWdVUjZma1owUUl1cHBMZTZudHg5MGt4VUFW?=
 =?utf-8?B?NU9KS1pHU24vUGNvNHBLVDFjNEQ0NVBKSTFON0VXMEJxNEV6QUFHbk5KTHN1?=
 =?utf-8?B?MnVsWm9kK0RwMkNJRndFZWxZUUZsUTUvbEtRM3lGUDlTcjZSUkF4N3AzNUd1?=
 =?utf-8?B?emMveGNacCt1QXpDV1NUQzBVVzJ0TjhRdEUyazhIVkRkTDJkcitQdVFGa3ZD?=
 =?utf-8?B?WXUvaGYyUzJKSlp6QUlGUjBkSkh1WXlCdFVpbWh2Vi8rT2p2Y0pNZ3RNRUtR?=
 =?utf-8?B?Z0t1cEpFQ0E4d3VJQWViNmdmVlZDU1dkMGFoZU1QLzBhYzFTTDZhQ0JOK0NM?=
 =?utf-8?B?WkRleGY0ZVZCSDlWYU1QOWVJN3VhYTdlSHFaODJJdCtrSTIrbGY1TVdmRmps?=
 =?utf-8?B?TTFhTytJTm4yZVk3VlBFMXdBbzg4TGFvUVp6WTVlMWMrOWcvekNtME11cXhH?=
 =?utf-8?B?a2ZmUnFBdVRGRHJZVjBaTlBqbXhCcVBDM3dDRTRKVnV3Q2hJUWx4akNPT3RP?=
 =?utf-8?B?QVZzSDUxOUErY3I4QjVRUmlESTI0OFJVTVlaN1BVOEZ4VUFnZlRYZjNYNFMw?=
 =?utf-8?B?VmJERk4rY0MvYjlYbmFqRnpES0xFZ0FGTUtwcGtFbjFoSFVndUhBZG5uSnBR?=
 =?utf-8?B?Wk9wWnc4OE83bUJ2ZkZxWjF3VzVGaU1JT0dQdjBnbXMxa2ZPb0J6MllDMHFr?=
 =?utf-8?B?dWdMUTVDM0R3OHJrRzA2akh5S1dzWmxzUk9rRlZnMkpkUldoODZIYkxBYkVx?=
 =?utf-8?B?M3NnNXdSM0FDSXhKa080M3g1Znh6dzR4RitHYTNhMnJ0ODhzeklOZVdoVTc0?=
 =?utf-8?B?TSsrOTRSUU5LcFZieFVoREZLM05FdnlScWlGZy9paHJBQ3A5V2tNMkNhUEcr?=
 =?utf-8?B?SWxsMkd5R1B6c1ZQdTVCSHZaa3R0ZkVGNDJKNENOV21Ra2Fwd2h6UnltZGVV?=
 =?utf-8?B?d21Ta0I3cHZDYlY4Mi90TTZDZ1dZUXltQTdzaDlzcHBMK2o1dDFZWTlIY0NY?=
 =?utf-8?B?b3NXVWxGQVQyMm9Odmh6TzMwaUpLNnh1SSt5SlU3OVZiZHVHZVd3Vk52TnNz?=
 =?utf-8?B?SGlLMm9kMUhnejFUVHBhSlR3MmtBR1E2dzNVNU8xRDBsVG52RkJKSk8yd0Yv?=
 =?utf-8?B?WU5oWjFoWWo4R1c4Sno4dlZ2KzREQmxwRndlckhiM01NVHk4TUlERi9Fckx4?=
 =?utf-8?B?empCb0xBRFp6NlRjU1MzNmdWcDBHM05EYitacGNtcmdkM0FKR25PeSt5bGtQ?=
 =?utf-8?B?cFN4bTFLMG53RUVvVnJralkvRW8rdVFPaElxS2NYZG1DM3RUSGtVTFZ4SjVP?=
 =?utf-8?B?ay9VZGdpQ29IUDczemNXbDd1VjdWUFNmNTk2bVh5amJEekoxejFabHZwd0pG?=
 =?utf-8?B?eVFwTFByWWtlT0ZUTHBZVENqZnBXOVUvL0E1VFhBYUVWNEd2ek42UXB0OGMv?=
 =?utf-8?B?eHVscTRxTENkQlNmc2kvdGpPNlRjOGNQZENsSVpHQXYvR1NGSUViazZDUDF4?=
 =?utf-8?B?cGpDL1lNT2pERi8zNTlzeHVjMHp0MnBsa3g0aXdXK1g1RjgwWUloYStOMi9v?=
 =?utf-8?B?S0F5ZVZmc1dqaGlNSEoxTXMwWjlxK0ZFU3dMNTZzMHFzaGZnQnUxUU9XUlhm?=
 =?utf-8?B?eW1ubm4rbFVhMzFnN1RoMUNuU0V1V1F0Tlo5RnNUeGtVcjl5ZmpXMnBxWVQz?=
 =?utf-8?B?YW96NmN4RE50cjh2M3g2TTJ0enpaZlJtOFBIelNCYkxQR2ZIL2pXRTlWUita?=
 =?utf-8?B?ank3S05id2V0VTJOOEl5Y2I0Z3ZHZmNodVJmdlNRZnpCejQ5bVFLRk9Lekty?=
 =?utf-8?Q?Y/g4+w6d+q40sqK/8zQoBdPVC?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <383142179ABC4F459ECBDE79BD346445@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85406d8b-eac3-4d7f-a0c7-08de174fee25
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 01:01:59.8127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ede7gUTHGH8mjhO8SKYqTPIo+9LNdFqdZEagvqCtp8mN9d5A08Nw9QUSvrT+gM7TIXomr2cxlfWYyuBwrW+Yrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7783
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDE3OjM1IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IMKgwqDCoMKgwqDCoMKgIC8vICJGdXR1cmUiIEdQVXMgKHNvbWUgdGltZSBhZnRlciBSdWJpbikg
d2lsbCBzZXQgYGFyY2hpdGVjdHVyZV8wYA0KPiDCoMKgwqDCoMKgwqDCoCAvLyB0byAwLCBhbmQg
YGFyY2hpdGVjdHVyZV8xYCB0byAxLCBhbmQgcHV0IHRoZSBhcmNoaXRlY3R1cmUgZGV0YWlscyBp
bg0KPiDCoMKgwqDCoMKgwqDCoCAvLyBib290NDIgaW5zdGVhZC4NCg0KSSBkb24ndCB3YW50IHRv
IGtpY2sgYSBkZWFkIGhvcnNlIGhlcmUsIGJ1dCBhcmVuJ3QgdGhlIGFyY2hpdGVjdHVyZSBkZXRh
aWxzIGFscmVhZHkgaW4gYm9vdDQyDQpmb3IgVHVyaW5nPyAgSSB0aG91Z2h0IHRoZSB3aG9sZSBw
b2ludCB3YXMgdGhhdCB3ZSBkb24ndCBuZWVkIGJvb3QwIGFueSBtb3JlLCBhbmQgb25seSBOb3V2
ZWF1DQpoYXMgdG8gd29ycnkgYWJvdXQgYm9vdDAgdnMgYm9vdDQyLg0K
