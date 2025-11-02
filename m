Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F263C28995
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 04:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7BE10E191;
	Sun,  2 Nov 2025 03:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MZdWsg09";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012014.outbound.protection.outlook.com [52.101.48.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2097810E191;
 Sun,  2 Nov 2025 03:34:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rDwfgyFhyvyp8NYJxDZKQGx4h3FbAATf4kZ3g5tMUIubn3zWM6Cd/jOKbHCzYczTBUHmlWXkDusVNNpzim62q0q/iFlu1Kz+9K0gRpC4e9QAXjapmoOEfp2XE1T/kXfTT2Q9bNnTuML5u2qUgIFEUhti4rrQEG3Gx0ra2+EgPlzF9JglWvoKgZJSoiTsOlpvtapUItyBNlrrpmmPpbwu+fAq0DwdDsmkTKlZ0EDkCS3ShhEOpMYoTzm5s6EvNkEhl34B7GiF1a7QpkpaCaXZJNjSvJrB/lRY9tsgn9NzbmSq0/0aaNyMshbRznJfesxvSdTCcCbMTheWOImAZz5DCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkOf2Iw7FfZK3IuuPx5URIKpjGxPxnlN1K7+vaJGOSQ=;
 b=JcjxWUQYaL6pSaKqhdVXf4gR5jGu7Bjtue2uNuR57AM1Glj6oUlw6kvAmgwS5+UDzRF2kys0ie8//ZS+CD6g7Gp8eB0PT/l6/H8XMgMQH4uhJQ7Nupw5tSVbxVPHCPzwTJk2dknO5g4KtqYMFKYtuO9qU/P2psiInGpIv6LVzJaHXF4X2yOEGcx3OcewPNT+M5xD1imktTAn5EWschyxnGiEKOASwUHKqFOkpqcmz8vZbD6e/Soj5OWn16I0tDz4DoqOTrliIfkOzea/ImKBbyBYpTfIaaLDZY0yvsdFNIf7mSUs9U/S3td+EJxdIya/Hl8NrdYabsCk1rScAqik0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkOf2Iw7FfZK3IuuPx5URIKpjGxPxnlN1K7+vaJGOSQ=;
 b=MZdWsg094grzAm8kwi76fKxOksfPi+AYadrVj3kXrh5DKzTxwtQqjLAZ4Nk1oFFCM6CQauCDUKUl6d9mBZ/gUqKsP6eoMn08HgaVKdiCYQZML9VUitMKEmClp3AAHbYyf059vzSrnPf5NcWB6V33fXQSQTs6KRwUBHJ9RyqTVUnR5B7XBh/mma2IaYclsuZbgeYtb83+0Mg2WG4c7TBAfSSUGXVhMsnH9zQamfmVOyGW7gUhhFaBNXWbSfZGSfg6UL2Liy57hAAa9ArK7lb1DhBzCqOC+T/pevopOPC0pntw1TAfSekTKwclis7GpjVMRFQyMKy81LHd22CgOj8OFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 03:33:56 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 03:33:56 +0000
Message-ID: <b8a8c217-954b-4ffa-bce3-9424134518c8@nvidia.com>
Date: Sat, 1 Nov 2025 20:33:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
 <64018a2d-1c0c-4851-95d5-989f041d220d@nvidia.com>
 <DDXV1SHI0R3A.2A1HQNM843OR0@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDXV1SHI0R3A.2A1HQNM843OR0@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0070.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::15) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a72f63-63df-4569-6652-08de19c0a718
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TitVMy81QW4zRUdaT0FHVUluL2F5UlhacnJpbEdzUGlOSU5GY21tZzljTFBl?=
 =?utf-8?B?Mk9LRkZzVjVxaWFqRVppSStiQXJiNDFZZ01WaVk0RmFlUDB2NVBvVUFPT084?=
 =?utf-8?B?ZzlnWkdpcXJuZHl3UUIxcHphZXF2U0JsdzV6bGNZZEpNSGtXUkorQ1ovaVgw?=
 =?utf-8?B?Zk5rdThkZE9ReENobC9FZXlwUzF5ZjgxZUZMdVFYc0dDYVF2dEx1SVh3b3pD?=
 =?utf-8?B?TWJwOEFOL1l4Z3dad01FSWc3OURpUURMK2hkbWVFT0QrcDRkMmlaR01MSTZq?=
 =?utf-8?B?YktkajJCZVNnUDJzNVg2U2hTOUVjU2JQQXBTeFhLZ1RjQnBCdEExYnkrSXNN?=
 =?utf-8?B?dTdyTm0xcXpaQlpYVzVhZE1uQTloZmtlY25oajBsTlRLZHFWK3UwUitFdnYv?=
 =?utf-8?B?bHdaeTNEditWR2x4SGJISEpCb2pwLzdqMmkxWFZld0NZUC85Mm9Wemc0UFpX?=
 =?utf-8?B?WGpjSERTSEt0d3BiV2tyd3RJUU1KMGVjNi9yMldZeElGL2dpU1BEWERwalU1?=
 =?utf-8?B?SDliamtHS0Y4eEpmaVM5Um04UXU2MGtNOThZLzNYWUtjRFhDRmF0M0JZZGJq?=
 =?utf-8?B?ejJwTXh2NFRoTU4rQnc4U1M3QWtyRmcza3VTUTNWUHVLSXhqRUhDUGdsRDFy?=
 =?utf-8?B?d2lDZWd4RnAzd0MvQzI4UkFZSWxvdkVBRkE2VGZoZTdMUnFtcElDZWp2RjdQ?=
 =?utf-8?B?b2JFbHR3ZnNhbU9NczRIbEFkeFlNcEpXdWhieTloYnM2eS9sVDVqRlNSbGxQ?=
 =?utf-8?B?cU9NUU43UXFOTXNtRlM3QW96dDAxMTY5MlVpVFNidHdwMlc0YjhjYTV5dER6?=
 =?utf-8?B?ZFBXaStvaWRhQW1YcUM2UnRRVUNhU2VaRGM2bnk3Y29POGJqNVhxMUtjcW5u?=
 =?utf-8?B?eEcvRis2am1reXBEZTFzNGVFWGpxMFVwWHdBT3JSNzJCZ2Rrak1FSVQzVVM0?=
 =?utf-8?B?cEpZa0xXcVlhN3VSS0ljV09CUGtIT2tBcE5pcVdjMnB0emJxb09VdjVXbjFo?=
 =?utf-8?B?K21NMnh3OE5MWTY0ZEdmSkZNYWlUOEV6bmV0Zk9SRkNGS3Exb25pc1cyc21y?=
 =?utf-8?B?Wm40dGVVdlY2ZFVTa3UxaCtJSThVSVJ1b0haUnpuQmVTbWduU3ZMS2pBaGV6?=
 =?utf-8?B?OUVieDdRN2l5U1ZtQ0h0TjJMc2JiYkFmU2xWaGVYL3VvQm9FTURmQlNKSnZK?=
 =?utf-8?B?M1dOOTBwa1JLenBVeWVvc0dxeC8wbUZ3OWFsd21WcUppbzh4alowZjVNYjl2?=
 =?utf-8?B?K2tLUzF4QnIxeDdJd3NzQUlMNnZsaXVLRTlOczlGbEZpWGJKTFQ5SncrWHNx?=
 =?utf-8?B?NCtQWXR1U1ZqQ3ZzdzBPRVVTSGl3QityYWtQZmJJY0dGVFBlbkpkYzNHMnZj?=
 =?utf-8?B?YUIzN1o1Uksrb20yWTZJaEFzRmFYbW9SeVBManBEK0htQm4ra3U1SmwvOW91?=
 =?utf-8?B?aTVYcG1yRnNPTkpjRDczcXd5bUhCL1IzWitPL2tKMk5iRytiU29hMEFBclQ3?=
 =?utf-8?B?U2UvQnppaDJWUzJLbzVGZStuSE5iUTBNTU16UUJtLzdnakdJaTM0aFoxUGp6?=
 =?utf-8?B?VjlFT0gxc2hiNTR0L2hVeFBYb0ViUVhGYU45dU5FU29jV0l1ME5qckRzNFVr?=
 =?utf-8?B?MWN4OHRKdDMyNE9vM2NHMGRjVlJuQnJGQks5V092dEMwMXpkZ1AwSEZUVkRp?=
 =?utf-8?B?OWhlQWFxQTFCSWZMdU5yWER2ajdwaFZyUWtHOG9MUi9nZEhLNnJxa0p5TGRk?=
 =?utf-8?B?TVBibmtwc3JoL3hOMUhRMFhyTWpBV3hVQkNRTkNaM0U1SlkrZ1phSU55aHRT?=
 =?utf-8?B?azVrcDM1YzNXK1h1WVkya08vaEpsUy9IZVIwdmlWc29tenVJRjduSEhxcUcx?=
 =?utf-8?B?VW5kcURtSDQ5UmpmV0dUa3ZNWHdFWU9pbVEvRHdtR0hoa3VCbEplTFRVRzBJ?=
 =?utf-8?Q?7b4JghBbV1BwekplsO3h1ZH2hQkC6b6C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekVxY1p6LzNYaWQrckZuYS9lUUpXVnNoaGUwM21RL3BRNnp5L1VpeDNHN1Ux?=
 =?utf-8?B?eWZ6UFpXTnh6TGN2Tzk0UWdOK0NtYW1kRTVxNExnMGNvSi9GYmErZzVmQlI5?=
 =?utf-8?B?aTBUeWY5cEpQTDdNMHh5UytRRHVvQUdVdkIvbGtJNk1kbXdFd0s0Tm1XVG5w?=
 =?utf-8?B?UGc1aGhlQTNEUkdjcDdhU1V4RVlHNkwvRWxIb3BKaUtWbHFCVjh1eDZKV2Y2?=
 =?utf-8?B?K1dxakh0OXZuNFpzaVh5WTlvZmpNM0E2blFxQ1psZnlSNGhxdk1UMXJVcHJu?=
 =?utf-8?B?MS9JdUJQelV5QVJ1YVJRZU5taWc2TEZORlVvdnRRKzA2dXJ5SU1qR1BwSitk?=
 =?utf-8?B?bXgvcDJYcmhoL3I4dDVUOTFsbktvNDlqMUlXM0loU3c4ZnQ5L1Rka1F1UnJ4?=
 =?utf-8?B?Z1RJWFNXSThhY1RXeUlYQlAwMEtubFdCb2xxZ204eFMzNWpQOWh4Q3NLZkkz?=
 =?utf-8?B?Qm41cHVKNnFWSDhXUDZyeHRUNi9CSmJXRWpFOHFLQmt5ZHZveVFLSGFhWmFM?=
 =?utf-8?B?YTJDemdyaDN6V05yd3VZVjViRTJ0R2JPK2JjRjRpNVJPVEFHS3g1YWlVVGhh?=
 =?utf-8?B?RlNiZVhMTnJiWmtvS2tEYjRlK1FVeWNrQU1aTllLb2JKS2lnbWpvSGZuTUZw?=
 =?utf-8?B?MHJ3UmlWamczSXJ6N0dWYmU1aWx0anpBa1ZtWkdNNGxPVHorL3dwSTZLUGV5?=
 =?utf-8?B?Y3pRcDNmQXdWYUsxMWNnVEVFR1VwWThNUGtiYVIyK3NkcTViU09EUGNWK3RG?=
 =?utf-8?B?cHRsT1pLMVluemFza0pKelpNTUFxcDhDN3pEWDk0aXo3dkxpdW52R294ekQx?=
 =?utf-8?B?MitJeTc4KzhKR1Y1NUNZbFNRYzkxMHdTcnAvWjVESDN3THpQZi83b2RtOUVY?=
 =?utf-8?B?Z2kxM3crZnRQS095RDdWUXJKK253R0U3KzJFMHVzWGxVKzcxUXQ4MmdGamta?=
 =?utf-8?B?YUV3YnZxYm0zU2Y3SWY5MnlUSmlKYlhmY1I0SE9wNVJ1U2RzYTJQR3BJd0tM?=
 =?utf-8?B?TU9XaUtNZ3pQUnpBNEptcFNxKzdnOVNncThIUXFTZXMyTUZ1cGJqTDdMSHg0?=
 =?utf-8?B?T2FRSzFUMGE2UXIrenVvY01abWN0OXlkNzZnbUVNRzBvQSsraThNOVpVNzlT?=
 =?utf-8?B?bjhZZTgrNWNZbFkwdTBHL3UwZ2xmODRRZXpxaHV6dEU2REV4SGFYR0IyOFBY?=
 =?utf-8?B?VGVPVGQ2dWxKcG1VeXRWbVdGM1hIZnpPSjg0T1ZqZm5MMGFFbmUzeWRIMDll?=
 =?utf-8?B?ZmN1aWlnWHllQjFqZkY0VEZtVzl2ZTBlb1FLTDBoT0lhYTJUbW1IQUpQK2Mv?=
 =?utf-8?B?WXBLZm1VOHV5YjI4V2lZVDRUdFNhMTk3ckYvMklXSWVJNkNSajU4eDZCa3dt?=
 =?utf-8?B?NHpBelhNQlZvV1cxRTk4aG40NlJvdWhUaG9UcUkzQlpOTXFSMVZZSE1WZWFr?=
 =?utf-8?B?UUZ6L2xRL0pqNU9wMk9rSWxxU2VvLzliMDVvRkJ2WHNuejh6L1ZmSnU3MTgy?=
 =?utf-8?B?eXlGeHhpVlA5WUd5L0lpYWtGZU5jcnJ1SEJYUkNUZjhoZS9ZcnExNEFUeE1n?=
 =?utf-8?B?dlNxRGE1YjhmRk5ubWVnRStvdWxpWVZ3cTd2Ni80Yi9WQTBEYmk1M0U4L2tV?=
 =?utf-8?B?ZG9Xb21Nc1dkN3BtbHZlaGxBSUlSVU83aEs1Vm1LcktWbFIxVVJkb0IrZ0ZO?=
 =?utf-8?B?bDdvZVhrSkhhc3FvVUhqdUwwQ0pVUU5KS2RrK1pQWWxreVR2OUJPV0VML1hC?=
 =?utf-8?B?MXRkVUkwQzlGOU5EbGRSb0hFWWwrYzV3L0dnU3hxYk96NUt4RU50Tk1QYmg4?=
 =?utf-8?B?ZmkxdjFPM2doTGJtR1Radm5SaUlpcGxWTXZZcUU3bEpSR0pFRFh2OUJLMFZz?=
 =?utf-8?B?QU1uNENveTlPODFCTjllaDFzZVlHekwvdllleURCSHVxWWVNSTNQKzFvMDlC?=
 =?utf-8?B?dVpjUDBtZzRJaktRbVlkRkhoRURaUkloYjhGZ0lqODZ4OHhyWEMyRkVFNVpn?=
 =?utf-8?B?RVpMTFBtMWRNbjE3czMzUjJuSjV3a0dORWh2QU1SZ3o0Q0hmL29QOE1Uc1Yy?=
 =?utf-8?B?MGpEL2swU2wvV0pLQ3luMTIvanJqN1N3SUJhK25NSHFPMXk2TC95aFhRekhp?=
 =?utf-8?B?RHNXdCs2a0tTc1FFcVNKVDkvWGdxS3A5SHZGT29yU3FXSEFSRWFxYmZERVp6?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a72f63-63df-4569-6652-08de19c0a718
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 03:33:56.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5yBYQuMPLfXT9w0XeLerQnPXimGjGoBRWvNFyPQrlFBeJEIVAQkEfGVyuAGrVg58KfZMFaV+t3KviWEOaaTPow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928
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

On 11/1/25 7:41 PM, Alexandre Courbot wrote:
> On Sun Nov 2, 2025 at 9:34 AM JST, John Hubbard wrote:
>> On 10/29/25 7:05 AM, Alexandre Courbot wrote:
...

> We can always add doccomments in the macro, as in the patch below. These
> will be displayed by LSP when one highlights or tries to use one of
> these constants.
> 
> If you think that's adequate, I will send a patch.
> 
> --- a/drivers/gpu/nova-core/bitfield.rs
> +++ b/drivers/gpu/nova-core/bitfield.rs
> @@ -249,7 +249,10 @@ impl $name {
>               { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
>       ) => {
>           ::kernel::macros::paste!(
> +        /// Inclusive range of the bits covered by this field.
>           const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;

Will that let people know that they'll see something like
IMPLEMENTATION_RANGE() for a corresponding .implementation field?

I'm hoping we can somehow create clear and plain documentation for
the various functions that the macro generates.

thanks,
-- 
John Hubbard

> +
> +        /// Mask of the bits making up this field.
>           const [<$field:upper _MASK>]: $storage = {
>               // Generate mask for shifting
>               match ::core::mem::size_of::<$storage>() {
> @@ -260,6 +263,8 @@ impl $name {
>                   _ => ::kernel::build_error!("Unsupported storage type size")
>               }
>           };
> +
> +        /// Shift to apply to a value to align it with the start of this field.
>           const [<$field:upper _SHIFT>]: u32 = $lo;
>           );


