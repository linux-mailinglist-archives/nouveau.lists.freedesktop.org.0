Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CEDCA2A23
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 08:29:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F304F10E872;
	Thu,  4 Dec 2025 07:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gWFoCn5B";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012042.outbound.protection.outlook.com
 [40.107.200.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0026A10E872
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 07:29:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MPIHUm8fB3DJiU477C9RVONBy/3QD4AWqicnwj4fnO0JJQ4ScQFj221WOpXkaNeSoS5LFZKTQyEsq3v+LjplcWd6h1s2dyypnWPHfCVvreRlRw0HO7udv9Af5zyyh2pkh1mhPvJgreWgvMCxaO71mJGT4PGrppQcRI/Byxv8nLy7cDLwhDvbPy7XlK2ZrTXK1CCba6NSr9+HU81Ms8tNMJuFigcj0THyoIxCsuKHJ4FQJW7OKFyaqsjoEa2qmSKlZqhBa8ILp9wwOt7EKCVO27Vlm6RE9ZDi0E5+jtjRpSiX348aBcgzL5Ad7XdyKU7daFv3Xu9c9ml6l7ZiSe5H0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdxSQyolZ45xnRRHZP4bJmshuo/4RcfsKfCkrIMRhkY=;
 b=tllKEIiOU5pRB0IB1LO/xm1udZAuKj6wh1RP+x3ffR1LBqSSPHn8rtF0zAJIvMmGLSzeTZLmVlFZmDnVXC6X3pV2HcfGJ+KhSSfAuFAGL6sGAXfVSscxtSptQwFcRlk31NfoXC+Sa2jXvHF+oPe4RFDzAiReKtf2cvP1rDQ5J6eyyC0LDiugaf4ByQlHj7DD8hNDYQTSIIF3yuecapu2caDurSVxTuz3uaim65nLlpH6ZRnoK4iNbV6ax8mfAAxrTf89dBoh9NuynaS5csLzkemnLOGRDcB0wPJb/qRrKbnZqmxGCv3DjpCDp85kokJRCO4KeImnkGt+Ib7sFlUEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdxSQyolZ45xnRRHZP4bJmshuo/4RcfsKfCkrIMRhkY=;
 b=gWFoCn5Bdtaj9KVrAEFRKOWqAueFqgxw5R8GbvhYJdTS+QQ7C2yuOLX302Yrsj3yyi2ayZOSTIDQiOe8gx2+62bhHtxOeIIrNjTaj5vsiI/zewhqufCcfWKaL779MHblMi5z0xX81d5773RYRJugkS3ybi4f54qAchw7cN/gPokpxINbUREBsudTyVJuWX1JG+5OrZcKHLJRy1Bk3QxVwQ1R9e9KLTxviVbp3g+b5oZ2SKzwcDpWyBQLM0h3R8X5RmGDo0a2CtNuwEpnvbQeCTK2DvBfHLXYmNmlzA3PnI7V6eoQMKdOjFIlcC07lzJuVfoNB49oLeaht81umN8+Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DM6PR12MB4298.namprd12.prod.outlook.com (2603:10b6:5:21e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 07:28:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:28:57 +0000
Message-ID: <df3f9ee5-8bb9-4a16-8f2f-cd5237e2078d@nvidia.com>
Date: Wed, 3 Dec 2025 23:28:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/31] gpu: nova-core: use GPU Architecture to simplify
 HAL selections
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
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-6-jhubbard@nvidia.com>
 <831684dab42b6ad4208f74f3c1fa1ed390fc49b0.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <831684dab42b6ad4208f74f3c1fa1ed390fc49b0.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DM6PR12MB4298:EE_
X-MS-Office365-Filtering-Correlation-Id: ee5a6092-07bf-4c20-b189-08de3306c8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFF2dGY0OXpxQndGcnQ4QStrUDR1Z1JvZDBWb2pwVENNRmZmQks0T0hHakN5?=
 =?utf-8?B?U2RDZE9UOStKeHVXVm9lS3ZxdmxpbjRhTWwyZlhOaDdzTWQwTVZsZmVDOWYx?=
 =?utf-8?B?aERqNm5lTFdHMlBnS2lJOGl1bTR2MlBpUjJzVWdQeTNOb2MrM3orNFJWRW43?=
 =?utf-8?B?VXZQS3ZGZTh5dmhrQXI3TWthdUpWRnpzcXZUZ3M2c1FNZVlxNTJGdlczeVUv?=
 =?utf-8?B?bURIUWVwTytwZWFxUTFGbVVFY1R0WUpxQmUxZEZHdmQwMURKNGdXOGhHSlBz?=
 =?utf-8?B?dnZ4SUxkRkQwUW1NYnU3S1IzOFVSRlN6SHEvYjVWNmxrQmEyQ2xOajgwT0xN?=
 =?utf-8?B?Vk5FWGg0VFlLSUlPTytvNjdBZGdSVEhxalJLRWpVOUpUNkdhSjdsQm5vNHBz?=
 =?utf-8?B?YnkwNGZVTEpnWjFKTUZvcnB2Si9aeHJ0SW52aElCWmpVdHdiekIyZWM5TFhH?=
 =?utf-8?B?OGZacWhmWmx0cjdubjM4YkpGR3FQTjVZV0dqL29DWGdCcU9DMjhZS1M3a0d0?=
 =?utf-8?B?clNUeXZsODBGcm1aY3JzeTNwUEVkL3JFeDZMSk96Z1lpNHpQcENRbHI1eC85?=
 =?utf-8?B?Q1BzbGMxL3Y3MDA1Yk8zSmdGR3JPbk9sQmN6MkRlaGtNL0tiQUtFMGFiLy9C?=
 =?utf-8?B?ME5Jcm5tandVRzhzUWQ3Nk5HdGJ2eVFGZzZCNzYxL0txWFNPQnZRNjNmazZm?=
 =?utf-8?B?LzlRUEtkRlVvS1NaMTB3dmtUc0s2eU5EZDROTG93SDBHSVBaMmdUWjJWRHJM?=
 =?utf-8?B?MG5MOUozdTh5WDhrTEdyd3pnNkorMnZ3QmxDalltN3NVa1lUZjBzT1FjNkVF?=
 =?utf-8?B?ZTl6K2Y3TnYzRlNjSkxKeWVpbFBKbzN5cE4wVjZpL0VESHdXWFIyLzk1aEcx?=
 =?utf-8?B?NmZtQyt6WEE0YWJzcE9DZDE2TlN4dWJtSkdNMk1pSXRiT2gxT1lHZzRMaW1V?=
 =?utf-8?B?dkRiNC9EZGpjRUFOUU5VTkRlTmRRWC9vZ0JvNjY4SmI4Q2dwY0kzQ3JYZTVP?=
 =?utf-8?B?RSs2ZENpV1RmemlBVHdHWHV2aklXMnJURjB3RU5YdGRCR2RzMm5ZMmhIR3hW?=
 =?utf-8?B?aThkbzhoSGRzSm9iV0tjbTF2K21XRXVJUEM0czV3NEZmMks2d3MxQzBid2lG?=
 =?utf-8?B?U3MyNEVuTmFXUWhqL3BDY3l5cHZzOGFQck1TQW9VN3dyL0VRZGRDYWRBNWdm?=
 =?utf-8?B?UThSTHJoYWR2RFZvaXpIMWhtREFZR3NOUkRqeHFtYUFYUEJsbEcza2I0d1dq?=
 =?utf-8?B?anJwa2IwUTM3bXNGZkJhRkhjR0xPY0hSQWtQeUNBbkdoSHpsaGNDR2hUZ1NG?=
 =?utf-8?B?S1RYYnFmd3Z6KzVYampIUlUrS01UVGlwMkNyeXBUeXdvRm10aXhaeDZLN2tw?=
 =?utf-8?B?LytqbjBrNXdNVGFmRlR5WUdTbVBKYVI2eDdIQjNXUFpYRXBGNWhOOG1mZlBy?=
 =?utf-8?B?VmpFaVFseFlnVkVFK3lkeDlJTmJGSnBtd1RuSnQrRFovZWZXMDhlMGUxVHBv?=
 =?utf-8?B?dHVpVVByTUdvaVE5MXA5UTNWczdHN1kvVDdkMFBaQ1JCalRFMitITGdpaXVW?=
 =?utf-8?B?L05RZXJRaHp5bW91RXZLb0VHT2J1ZG1RQUUzcDB0elpaK1pKQ0MrSDRJN2VL?=
 =?utf-8?B?em9yVFZBM1hqTFVyQnZZbmk2MHVvVHE3RjVHRWNGOEJuNFJ3VUw3NWVsejVF?=
 =?utf-8?B?UDVtTVNpYmFCR3o3NGlQWUtBQnM5LzBDYlQ0OHV5ZG51UTVuNG9aVDZQZnE2?=
 =?utf-8?B?dVZNZzE4alFxSXBHRjlpWTlTMFZLOTFLYWF3Q0FpYXRQS2Q5UTh1aWcrVjNl?=
 =?utf-8?B?N1ZUYXZ1VVdCWjZ2K2xaREhERjF5Zy9PU3UwSE91L1FHS3pxQUxUMWo0bHdk?=
 =?utf-8?B?UkJ4LzdBUVNuRHBCS1NjdXJXeDNScWI5Skp6R1RkWjVZNGlYeGFjNEw3Q3Fv?=
 =?utf-8?Q?Gd1j+wFojoxsKn7lSGovb6CEV4IWZiSd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVJ3czVJSzk4QUlHUjBKcXFaVEVBQjFOUm82dFA3UVp4VzlrbXM0NTZaQVVP?=
 =?utf-8?B?NXZBMGZyeFd5dGxsdUp5b1EvRUJtS3J2enhDcWJoYUJNM0c3SDlpT2Y4ajVs?=
 =?utf-8?B?Y3BTbWU0MEUyb1p6L3EzU01zN3R3L2VSZFc0SkZkWFBQK0pHT2RORFVXalVJ?=
 =?utf-8?B?ZUh6OStuS0RKQ3Avak04cjhvQ3Z0N3JTbXNPSjdFY2ErWE1sMURqWS9KVnhm?=
 =?utf-8?B?WE9tSnZkSFB4K3BkQXhxQnFjZzQwM1IzbUVBQ0JDd3VWQW5qL01kTnR2S3E2?=
 =?utf-8?B?dmVXVTlzb1UrZG5Ucmo1ZDZvRVF4S0U2enVzWlUwcStZd2hYZWx0dGlybDBY?=
 =?utf-8?B?SU16UmJhVDBRUU1sRlUwWitVcVRWUCtieStHNUR5N2lZUmdxRFRMSnpRd2l3?=
 =?utf-8?B?cWIyczJuUGJVUWdrN09DS29OUVJ0U3N4SmoyTXNrQU01RXUzVWE1d2szQkVk?=
 =?utf-8?B?ZkltTDFQUE94TjhFR0VIaTIvdnRSa1NFTklIek4wa3NhZ1AzRTh3U3F3cHZ2?=
 =?utf-8?B?Ym1qN21BblFGTTVkelBlaUxxMU9hcUd4bnIxc2lzV1pzb3VkcmdoQlVTRlZx?=
 =?utf-8?B?Tk50ZnQ4SVI4SXJZUmFmK1V0WVJMOXp2Q21KK09xWGV5cmc3ODdRSktybkZ4?=
 =?utf-8?B?dmlIc3J1MGw2dHNlcUV2Ty9ObHB1L3RwbXZzbStiMlIyM2NqRGFkTFFhUnNG?=
 =?utf-8?B?VHgrVGtjQXFXRUE2U2FpUHViTFFyYlZhcHY2U1BjV2FPK0J2OUdUVGdPMGhw?=
 =?utf-8?B?bm9KOU4wV1lsdmtZTXdlQ3lSNnMwUHVyTFQ1UTU3cTJmcEF6QkdCSEtUc05t?=
 =?utf-8?B?Mk9KdWUvR0NWdmFrZngxbXgzWjAyQ2I1T1J0TzRlaFlCd1hFU0svTUFlVkNo?=
 =?utf-8?B?YkgzMm9TUWVtem52R3ZBWE1CVGlIMXVHNzhYUkMzeEZ1WU5VOUZKbGZhMkJQ?=
 =?utf-8?B?c1k5OEdESTdTbmlrdktrcnBGcDRKdDdzbFU0NnpkV1FPcmFheW1GWTNqMjRL?=
 =?utf-8?B?VkNHWlB1bUZuQ3JLaC9oa09Lc1FDSjF1M2FxQ2tVb1ZMNkY2R2FUWUZxNkR0?=
 =?utf-8?B?Yy95K2cxYm5ieDQ2TFVvNi9zMFVDUDh3RS85L2pMUHNhV2x6c0xrLy9KNHV4?=
 =?utf-8?B?TWdHait1dmVkaUR1QlVZaHY1QjN5TWxJNnFFalhTVWVpRk1SdjliWGhEaTJZ?=
 =?utf-8?B?VUliQzNqN2dPdWQxNHJaYUdJK0hYZDlDLzQ0M0xoUTlzU1FJaGJrRlpMcXpR?=
 =?utf-8?B?NmNsYzArS205RG5PNXRwaWljSDAzL0dSYURKcmExTDFrVXY3d0ZZRE1iNXVQ?=
 =?utf-8?B?WVROV0FjMTJ2OXd4cVdFNWFOS2R1MWFKOXdPQVpZdERDMklvMC9lcjBDS3lR?=
 =?utf-8?B?YVVzdnVHOVh0RGdpeHZKVkhzMm84SmJPcDRmQ0tMRW0rcmp3MGpDelpWZlRl?=
 =?utf-8?B?N3hTa2pEOTlsQVNFakpkOHlUZG45R2lKZmQ1SEF5cUJ6NEVqeUNZY0N6VDhD?=
 =?utf-8?B?OUNodHFObHVJQ3pFa1lwaXk4eFpxazQ1dTR3MlZsNDVrYWE1VUhWckdxeEwz?=
 =?utf-8?B?c0Y5YTdGV0J3c0lwZWU1bnF0TmJtM29kWFkwV1IxVzU3aXFmcTI3aERnZ2tn?=
 =?utf-8?B?QXhFcUNzczM5amw1dXFnYWdZMnZhM1lQMENTNUVMbjQvRjJWTzJ6ZDdjZTBt?=
 =?utf-8?B?cTJHZnpVbmhGRHR2TWp2WTlqRTM0d2w3aWZXMWduUDRtcDZUK3JKM2hROFlB?=
 =?utf-8?B?WmhleU9vbklIM2JPMGRYUU5OS0MrYlZVNGRKSStvYitlcHdXVlJQR2c4L214?=
 =?utf-8?B?ZFZEbGVvTXpRcjJZUGRvQ1V2ajlmVlZHUVFqV1pPZzN5MDFxTkdSN1JSeDlC?=
 =?utf-8?B?N3lmQ0YvVm15UFZROEhkZEtYTHBWTExlSVo2ajBraGhXbDh5TWdJZVN0SVJ5?=
 =?utf-8?B?bElBOGk3Tm82TDVVOFM2T1JlUDBzUkpvZGxvZVVXTnA5aWxaQ3JyWWV5eHRG?=
 =?utf-8?B?R1FmQUNJdHc2dEt0dzRSVHJmSUxOUW54V2gvNjJINDNSeHN1ODZ6a0RwcHVG?=
 =?utf-8?B?QmVualFsMmkxc21GSG5LQnlSY3c2TC95NUdrajNXNmVrVHlLbDl0N2FhQ0RD?=
 =?utf-8?B?ZW0zdUg1NmNWTWhEbi84QkVOd1RRNE1XZjQvSExMVG5LcFVjd2xMak1vY0pF?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5a6092-07bf-4c20-b189-08de3306c8f6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:28:56.9397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3s5TR5oGSJSn2/Pf+F+/IhDbICq+yN1w5ZpRVarNPxf2EjP5SbyY3KMyIBwmdRk98CtktdTd0zGM9BtxmI0OEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4298
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

On 12/3/25 11:38 AM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:58 -0800, John Hubbard wrote:
>> Instead of long, exhaustive lists of GPUs ("Chipsets"), use entire
>> GPU Architectures, such as "Blackwell" or "Turing", to make HAL choices.
>>
>> A tiny side effect: moved a "use" statement out of function scope, in
>> each file, up to the top of the file, as per Rust for Linux conventions.
> 
> This might not work for GA100, which is a Turing in some respects and an Ampere in others.

Let me check, I might have missed that case.

thanks,
-- 
John Hubbard

