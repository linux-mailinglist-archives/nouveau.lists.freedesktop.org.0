Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96648C4277D
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 06:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992810EBB8;
	Sat,  8 Nov 2025 05:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QW83jb9q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012002.outbound.protection.outlook.com
 [40.107.200.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E0C10EBB8
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 05:09:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDxwxZsgaMbon8nZaSRXsti0gZzvy21eSlBK9vvpScP/Q4ja+/1OdLUPgJOplyWwcgvPu965gzTKXV5Y+sqI95eU3OLYO/VWgBSpYz3wImpyW8LfjQuA1qY74v5CmzcV2ZuWhZJCpaxJcNi/ySCHDtH+5TZb8LLl19zmYmeUpm9QM/RqfcjfEJLPjdj97oX4RdNzUWiaGD+q1BQLEBaplyGtdXuSwxWnYk41r0zqhdzBufkvTwiRL57rHH2IVhKaXPTyQ92smohGpqdo267ygJpn2qPyJNO/KkKFp7hbIj/c5qqtj4yO6cU5Y5MpXJDxxzA8Vq73PYRuf5I4K5700Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/WHbE1F/5/BE/fnKQYoDC5OxfB8KQ47T5QNkhDgaJs=;
 b=ebMgMaokCpI9+kmznXiQ77E3hHypRQl+9pzQByQEnSuApbiKe+I5vmtHaS10Bzk0JrQpyOJsmzuYDnZeoznLrp59PUi/vVmd9McyJTiDsAtIypIZYslE1OLxrCpZ9Xua/kbRBQfiMKSxgqNs2zs/jKbbrvgd7f7ryIGddp8uuIL+8uX1SxbxN37D4D8a8Y57ehCjCFcibHmelBHXsnG4fqJj6++alpFqLRnMdu4zzJ4lEtBdhEc3ZybTilZpGlfkdY7IH/hz6Me9sdFnJSf/vVlswAPdl3r9dLAFyuijFWLWysYzQBU8jI/IzRjOrcXekjNFT0Da96DxcMsIsRG10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/WHbE1F/5/BE/fnKQYoDC5OxfB8KQ47T5QNkhDgaJs=;
 b=QW83jb9qhvv5+gga2k/b376j9heC7DyKAsyPQVJ03pyglPixvekAONTIm5j5DW8Q98gw3I4O97Fb5iWxRvi9P9nq/mZguTw7MpBJLtr+a7TvkVn6HwK2SupLup0GdxYuPb72svAq0i9WJtSMJyBQDqEtw3Ox4lsuevg1JrXOR7M4Wg9oWPpb7SGOTlAKH+xz8f2VjjHgecRRl8AfO/K57Y+y2myrX8E37R8uCK07oYUZTv2oMbWvrZhb+mIFNhmjn4OiCb8RcOiWrsF2yWgUgbDksULQTq5zP8QZCuU+RN2QeJEFYho1jUDl5TPhCdzEoq7keZoUk8vTphoI6GSRiw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CYXPR12MB9318.namprd12.prod.outlook.com (2603:10b6:930:de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 05:09:27 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 05:09:27 +0000
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
Subject: Re: [PATCH v6 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Topic: [PATCH v6 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
Thread-Index: AQHcUGm5uy/mFRJmDEqKxXIFnPJjUrToOt4A
Date: Sat, 8 Nov 2025 05:09:27 +0000
Message-ID: <0c3630727945f806610da8c43211242b9c6162d2.camel@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-5-jhubbard@nvidia.com>
In-Reply-To: <20251108043945.571266-5-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2-4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CYXPR12MB9318:EE_
x-ms-office365-filtering-correlation-id: efa0f96e-d8cf-465f-b78e-08de1e84fd9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NUphblgwb0QyUFBsN1hiYXVEM2JRaFFqaGZMUjUyRkNHUUtpSkFOdmUrN3p2?=
 =?utf-8?B?VmlXUVArRkVFUnBqcjNRdk91L0xYbU9tZzNXbnFBVzY2Q1ZKTldhNjA5UWJx?=
 =?utf-8?B?U3RodjN4TDhkcmg5OExDZmVSWnRrRnQ0OW9OZDY4ZnhzclJTR0tEWDM3cmJM?=
 =?utf-8?B?NTlLVGNXS1prYzZDN1ZPbzQwZWdNdTRnZHdoZzZwbHM2NHFpRExaa2wvbUxY?=
 =?utf-8?B?N0dlMDFIR25uZzFPUng4MnZlTU1ES2VreDU2MFByLy9MQktFQnNuOU1WaGRl?=
 =?utf-8?B?eTd0OWRqNW54Y3M4UFhWbW94aDFuUUc0Y2JvZWgxSWxRV2w1NUpONHlkck5v?=
 =?utf-8?B?QWUvRXNmYVhSV0N1LzA4MHlUYUw2aHJONGJzUkQ0c0N3WmtVZnBvQzNDdkY4?=
 =?utf-8?B?aUh3ZWFVdCswN0Jsck5VWGo4aHFBVzUxZWc5ZFhjK2VQQkRCQktYbEJ5WDRH?=
 =?utf-8?B?NXFRL25JWHVJVXFSeUNOcmlBaDhtZEYvcmVjak5ET3hGbnpIUEtscGlZV2Uw?=
 =?utf-8?B?bWlGQzJOdnlpc0FBdXV0ZWFZNzA4NURzQlYvS05OaWRlV2VLUVloZFoyV3hI?=
 =?utf-8?B?VTVXdnBmUm9IVzN2dE0xUFEzRWFuQmNpNndySWRmZkVCWEpDZDlXNUZBazFQ?=
 =?utf-8?B?dTVYZGFndmJ0VEcyc0dta0thclM1VTZ1WXkzMm5tMjUxVEVxaVpTNEcwRmtj?=
 =?utf-8?B?QXRHK1JwMnBOQVdwOHJTL09aUFptbjVQS1FPR3kvSGEwMXZRTmF0YnBTVEEx?=
 =?utf-8?B?UEZkMDRZQURwUEVnRm5iSHZyMmxzMTBmUHVMRWh2cjVnUzA2UWgwQmRPRjA0?=
 =?utf-8?B?cG1qV21zL3g4MWFwNmNTNUorSkxwYktSYVBxWFNBV2FlSmtnTkJKOGZBbVJz?=
 =?utf-8?B?TGJRWUMrbThFb0R0M2R6Z1dWVjJQVUJiSGZyRXZ5dTRtNjZjSkxETG5LcVhi?=
 =?utf-8?B?ZXRoQnB5Ukxod3NxbDZjT2pyUSsraysxamxsU1FJVzNvUmNKVHZNcUpWZmV3?=
 =?utf-8?B?RDBPVWhVSXJkcXRWd2xKTnQ0clJXOGdudTNNMXY2NkE5SFBYL29SK0JMNm9R?=
 =?utf-8?B?L1dBZUt4eEN1NXFybjNFOW9mZmpIbWdDbWlQNk8xcHgwbk1vQ0ZEU09WRWZX?=
 =?utf-8?B?TEFqR2d4a3h2RVl2bWx4MWdjS3V4d1U3V25HTHk4QnFJdjhFV1dUSTcrMlhD?=
 =?utf-8?B?U1podisvMytxcVFoTWl1a2VmMnF5L05aa2daaDJnQzJqcHRLcitabENHNVlh?=
 =?utf-8?B?Vk1lRlNVYWpMNS9vemxwcFd2dERlYWx3UlNvZFZSVlJBUGdQcGRrRUwrWUwz?=
 =?utf-8?B?Ym5RMSs0OVF3Qk5JWFdhaTNlQld6a251ajhPNERjMGR5aXU2WEd3Vkt6eEZ0?=
 =?utf-8?B?MWtvOVp5bWY5bm8zeGJSckZha3FnSUR3WndHMURzVHhOUFAwYjFxcG9XNE9r?=
 =?utf-8?B?RHlTdXBvMCtLMk1wUHAxRHRlUEhIMGpubjEveVA4NHJxRzlTL2xVWUhyNXdS?=
 =?utf-8?B?bCt3RFJ5Q3dKUUoybmp5V3g5OUg4VHdYRXdmVFdUcjVNMzNQNlc0TDR1Szc0?=
 =?utf-8?B?MzQzcVpIQjE3Rlg1N3ZSbW1YaEhVSiszT09aMTZNbFZ3YXNzdThHQVU1Nzc1?=
 =?utf-8?B?S2RKMWZzR3duY1FyNktubDYwRnVRMmpqb1BjZmhScFd0UXhpQ3VOR3c1Y3cy?=
 =?utf-8?B?dUFlWU5IMHplVVB1VlpRYkVqb0RaZnZwY1dPZ2J1d2pITXVxR1k1Z01SaFJS?=
 =?utf-8?B?aW0xQmNBZWRkVGRkbGpOTlVWRHcvQUo0S0Vjc1JSdk9Ya2hkZ081NFZ4VURh?=
 =?utf-8?B?TFdmK1VtZ2dCRzFPeHpLc2VQNW9CK3R5dTRZMmNUNGxQcUtrNUt3WlM4Ukcx?=
 =?utf-8?B?TFdweCtNZElxL3ZTN1lUTE1sL0tQTFA1N1ZlajhKQXVKaWthdjNOWHlOcDd2?=
 =?utf-8?B?OEN0REJJdENoRWxRNWNxOHB0Ty9qZW1HYnNVZUhjdkFkNVViMG54eFlsMGdo?=
 =?utf-8?B?aWxadzhwalZoeVhTOGZ3TmR2SnJwOVJjM1VLVTJTTkpaRm5wRGZlblUvVldu?=
 =?utf-8?Q?AJTkPY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UktESTN1Tm5mQTNVdTVUVUlCU2wxcURkUUtOQkJLOXh3RDZnR1BMVkRpbUJM?=
 =?utf-8?B?S2ZsdlE2MWQ2L1ljUDhnT3FiUWZEYy9TcldKbkF4MmNsekFMU1gzZEdPY2Zy?=
 =?utf-8?B?UmhUY3lLdEh6bU5WMGZsQTRpVlBYRitFcDFXQ0U3YjdRZTJvRDVQVit2dS9M?=
 =?utf-8?B?QXMzbmVZZXdSanNMZHlaejRQUVBTb1BIa2FiSVY0WEtnNjJLTnVaUjI2RWVZ?=
 =?utf-8?B?M2xwS2QrWTdRTkIzT0VuVWo1TUNwenRaUUlKNmhqZm9YNlk3bzh0WkV1Q3Rm?=
 =?utf-8?B?alpWdjFRMmFDeHpwd3dzMHVSdFFsQ0N0T25lUnllRDk1YzZvTFUzQ2VQb1RS?=
 =?utf-8?B?ODdYT3huN2Z3UEczQzdENXBDNGY3MTNkbTlsdlgvSjYwbXRaVzlYRW1kK1lV?=
 =?utf-8?B?S3U1alUzb21hVVA2NTNCa1ZReWprZmpHYjVOSkdPQVo1MityOC9EZlJGaUFj?=
 =?utf-8?B?NjgxU1F2SWR2anBYc2ZHQ2RxVzMvMTA1V1dZZmx2Rmx1V3p2Q09NYUxCWWtV?=
 =?utf-8?B?RlN3M0thZVg0N2JCUG0wYkpFWTZKMHFCc053b29WOWxiUENuZ1lKRmIyOGk0?=
 =?utf-8?B?N2kyV0ovSCtEUEs4R2JzSWZ1ZVQ0REp3Rm9IN1A2RWpmWUFvWE1heVlXK29t?=
 =?utf-8?B?M2UxQnFnM0ZpeWh4bEF5T1Irem4zOHRGTS9uMVhIRTRZTWVYNlJ1b1hLSGhE?=
 =?utf-8?B?d0dqSlk1V0QwdjdsVDUxMXkveE5hNGc5SnlIN1ZzRVlPVlBGK1p2SUZBcXU4?=
 =?utf-8?B?ajM5TEdEMXdCSUdUSEhTNWRRTktaTDN3OHE4Z212WnpyeEVCWWx0VVBPWklH?=
 =?utf-8?B?WVZzWVZwbGp6R2dXRXJ0OE9zZlkwS2phdERwV0FWUVBzM3BUTFlWQi92TkNH?=
 =?utf-8?B?WlRtb0RJUVFHTTYwazNsa3A0V1JjQW5LMC9nREpVK2tSZS9uSnNTZjB0NXNY?=
 =?utf-8?B?ck5ETzhabWFpdjJpVkRnMEVia3dUTjYvZDduR2pYOHcycndFc1ZQT0t0YjFP?=
 =?utf-8?B?WklabDNveW9DaHFxYTkyVUZCNkdXRmxKOXZxR3NKMzVqSnFHSm15RHUvaGdE?=
 =?utf-8?B?SzlyZWpZL3N4eENQaWd5UldNeE1GSVdqcmJ5N0dXZ2E4QmREeGtpR2s3NXRw?=
 =?utf-8?B?TmhEc2Q1d1F6cElKUG9xbjhlZ1dRQ3M3cmQxZG5nN25taW14VitTSTRMVVRo?=
 =?utf-8?B?Ym81VGI4L3BsdHp4T2JiU3dnZVpDbnhpbXFzK09pK2NVQ0hDeTF6ZCsyNDNU?=
 =?utf-8?B?QjltRm11TDRTN2lDaGM4TVlNVzJuVCsreDVBbXpSUzkyQUd5TW1lQVo2dHNY?=
 =?utf-8?B?OENsMjliOXJhVnJLVFpNM0R5eVNzMmkyb1hIVkdMSWFhOVRrQ2hDYk5pY1di?=
 =?utf-8?B?bEc0NnQ2akV6dGpKbzhscVJDU0UrRGVmcVBxb1ZhdkZHQ0tHajdEYTYwWU5G?=
 =?utf-8?B?M1VuZzZ5RHhzZHpJKzZBajB3VUhLUGZmVkxZWmo5SHBoRnB2a0tuVWNxZW1V?=
 =?utf-8?B?S2J6bURic2NndzFyNld6R29nemx4NnNKN0gvOUYrdEtpT1o2Z3RqQnhqMEdh?=
 =?utf-8?B?TU1WQ0M5SlJ3TjUzdVVZMGRtUXBRcmU4bFNzc2kzaHRDYzFvMThISkRmTkgx?=
 =?utf-8?B?ZS9zc2FuN2xBaU0yek9FdzgxTFo1Yk5DQzVSOWNNbDEydkxkVTVnZ2hRZmhO?=
 =?utf-8?B?UGNtUVJ2U1NaaVhLa0o1QjNXeEZIR2haWVJ4Y3c5OFB4ODlHVHVtdDdTams1?=
 =?utf-8?B?QjZCNTFOd3dGK3VzdlJkdThpdXhFeFB2WjFwdUhzREhkN2p1TWpqblRRWTh4?=
 =?utf-8?B?OUd5bUtOeU05VzZwYVpxYnVDUGoxcE91aDhJVUdqVVY0c0tEcjF4NVFOdFRt?=
 =?utf-8?B?ZGNqQW0zcWNJZkhORmYvTlEvRWxCcy8zczJjcVN3eFk0TU90TVZnUlQ2bVhi?=
 =?utf-8?B?cWowY0FoU1BVVWpqRy9HZ3hVZTVsWkhHam4wMU40NkVEVENqQjRBTFFJNDFs?=
 =?utf-8?B?cnpHUEdjSzVrMFZNUkdaSmRiaVQ4RFlsS1I3bDliMmdObVdkb2gydkU2Z3U0?=
 =?utf-8?B?R1JCTzVIZjF1dlZPNkhrcko4WFYrY0VUWkVlbENaRnVOa2pWcVVVODI4TXBI?=
 =?utf-8?Q?wB3zBtj6wC0u+QMLIiYLr2W7m?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE3DCD5C2662634D8C23D936AA4766A6@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa0f96e-d8cf-465f-b78e-08de1e84fd9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2025 05:09:27.2156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/R8dR4HtDYSEJbfjdZk8Ej5DvrKRoRtaqJNRriDDeWFuSkVVN6T7H4hCgKFz+VSuOdutsCEgnaIyt/wNBApSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9318
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

T24gRnJpLCAyMDI1LTExLTA3IGF0IDIwOjM5IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
K8KgwqDCoMKgwqDCoMKgIC8vIFR1cmluZyBhbmQgbGF0ZXI6Cj4gK8KgwqDCoMKgwqDCoMKgIC8v
Cj4gK8KgwqDCoMKgwqDCoMKgIC8vwqDCoMKgwqAgU3VwcG9ydGVkIGJ5IE5vdmEuIElkZW50aWZp
ZWQgYnkgZmlyc3QgY2hlY2tpbmcgYm9vdDAgdG8gZW5zdXJlIHRoYXQgdGhlIEdQVQo+IGlzIG5v
dAo+ICvCoMKgwqDCoMKgwqDCoCAvL8KgwqDCoMKgIGZyb20gYW4gZWFybGllciAocHJlLUZlcm1p
KSBlcmEsIGFuZCB0aGVuIHVzaW5nIGJvb3Q0MiB0byBwcmVjaXNlbHkgaWRlbnRpZnkKPiB0aGUg
R1BVLgo+ICvCoMKgwqDCoMKgwqDCoCAvL8KgwqDCoMKgIFNvbWV3aGVyZSBpbiB0aGUgUnViaW4g
dGltZWZyYW1lLCBib290MCB3aWxsIG5vIGxvbmdlciBoYXZlIHNwYWNlIHRvIGFkZCBuZXcKPiBH
UFUgSURzLgo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgIGxldCBib290MCA9IHJlZ3M6Ok5WX1BNQ19C
T09UXzA6OnJlYWQoYmFyKTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoCBTcGVjOjp0cnlfZnJvbShi
b290MCkKPiArwqDCoMKgwqDCoMKgwqAgaWYgYm9vdDAudXNlX2Jvb3Q0Ml9pbnN0ZWFkKCkgewo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNwZWM6OnRyeV9mcm9tKHJlZ3M6Ok5WX1BNQ19CT09U
XzQyOjpyZWFkKGJhcikpCj4gK8KgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU3BlYzo6dHJ5X2Zyb20oYm9vdDApCj4gK8KgwqDCoMKgwqDCoMKgIH0KPiDC
oMKgwqDCoCB9CgpTcGVjOjp0cnlfZnJvbShib290MCkgd2lsbCBhbHdheXMgZmFpbCwgYmVjYXVz
ZSB3ZSBjYW4ndCBnZW5lcmF0ZSBhIFNwZWMgZnJvbSBhIHByZS1UdXJpbmcgR1BVLApzbyBpdCBz
ZWVtcyB3ZWlyZCB0aGF0IHdlIGhhdmUgaXQgYXMgYW4gZWxzZSBjb25kaXRpb24uCgpJIGRvbid0
IHRoaW5rIHRoZSBjb21tZW50IGFuZCB0aGUgY29kZSBhbGlnbnMuICBUaGUgY29kZSBpbXBsaWVz
IHRoYXQgc29tZXRpbWVzIHdlJ2xsIGJlIHVzaW5nCmJvb3QwIHRvIGdlbmVyYXRlIHRoZSBTcGVj
LCBidXQgdGhhdCBpc24ndCB0cnVlLiAgSG93ZXZlciwgdGhlIGNvbW1lbnQgbWFrZXMgaXQgY2xl
YXIgdGhhdCB3ZSdsbApiZSB1c2luZyBib290NDIgb25seS4K
