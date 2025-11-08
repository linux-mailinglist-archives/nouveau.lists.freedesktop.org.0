Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D13C42458
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 03:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB19210E1EF;
	Sat,  8 Nov 2025 02:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dH7/4Mx3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FE810E1EF;
 Sat,  8 Nov 2025 02:04:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i299kUUBSuQ+4OF2xuJtOKMq5VS4Hgay2jdcBzaszeRUqNCj0MjVKvlH+BwlprIgPKeZ43s4kKfvmtJq4PM6oXLstS1tFDN/Tu7N/drsnOiGAdEnVi7yXgzBX9p2x33CkXmNHz4DnQXqIq5f9ZhCHUFTgwWOXkhEeGgTcIoqimzqHONx52OGdMu+tBonNZ1vDsL+Rq4zdChUupIuXkOpd3eU77FYdLuBXtKlrfsvd/kH7qohbLRNgG4tnsLe4CdUNgU+vQd1kcXRcjtjOZFKMptXiPRLpwmowhSv786yM46bigkrBLr5U6ToaxQKp27U1VzF97bCVuOUUntMjZB85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=euMrnmoJIxINd/GDNrtOvKYO5jlVfEmKwntM1FOrxGA=;
 b=bRgDpBZD/IEo/efW/beGyP42zTpdqULCt5loddFVydL/w8xS8GbDbt0Hm6rWCBpJ8LgDuZYG79id/WGnHBiTraTtpcJYf8QrF7TCcjtfJTt2lFpPNgFM+O65OyEIQKXQwzC+VJBY9qUdrZoT4fvLqYynnIMIZ2HPpweeA+NbBBH9Y4c41J6vd3k2LBLXnPYBd7Eh1BL4NF0i8nyLF7it45pX+b/tJjeoXIK+6ofOPHzFx5q1z+bMrKGoreC42L9RXhwoSibe2UJVzPJpYVEHLqgAAx8ZvWsU6ijlRrmYn1MjEHaDRECqR/fOhtbdK6zv7ewkaOKFx2JY06aQMOh2BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=euMrnmoJIxINd/GDNrtOvKYO5jlVfEmKwntM1FOrxGA=;
 b=dH7/4Mx30vC0KY00Ty42AyDqd51zCvShR4cs603c7+h0ERdajDOpiil/KWfAxbqFnqa3e/EHhnmEnEgiUI2DDjMZ/H6HXHTRxRlo1rLVXKI5WZ9pmXCeEQRm1v8CSZpw4VMarhZgTw1Z8UpGq/VheSzwbGyHDQyDj59JH0+I3E/3c1PG/E84qiMUOap8QWiiLVw8Krh7QCYYtvD8ok0IXJCmYD3WSDwylgPd1vbTybQFDpOX6Xu4mBRfD0WsQ9V7MklkaHOS+++Z3+Vhl74EZnZdJ+BW/N+29/O1S/FyU+kEJ+6a6SA57NGhPnYSdbZFba0LifBAmmEpW+cAauCrTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 02:04:06 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 02:04:06 +0000
Message-ID: <69b490b1-fb1a-48e6-8b5e-85325c993c63@nvidia.com>
Date: Fri, 7 Nov 2025 18:03:49 -0800
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
 <b8a8c217-954b-4ffa-bce3-9424134518c8@nvidia.com>
 <DE2XU3M6FQLH.1SOIZBPALTHMN@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE2XU3M6FQLH.1SOIZBPALTHMN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0078.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::19) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CYYPR12MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 48427ab5-2dee-4627-32b1-08de1e6b18dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGVPVlowTEtxM0IvQWJOd09KNFVCeUhsaXhQS2Y5Z0MxTDlrMGtKRy84c09y?=
 =?utf-8?B?UkhtUVF2YU1PUVZXMXNyQjY1UjFOdnZxSTg1d3c3WEgxaGRaTU54akRsaVlK?=
 =?utf-8?B?MUE1ZXIxa3BxVENpWVY3TWZEaCtIRFpkMjJZSEtBVVdnalhnTUtKQlZRWUZD?=
 =?utf-8?B?U0tjd2V0d3h4dVdIWGE0d1BlUFpIaG5FTUxIL3dXbG03bVMxcXM2clVDYUdx?=
 =?utf-8?B?bk11SDF6Qk41bEZxanh2cExMS0NSSnFuVGRYcGEzQStpMFZyK3orUC9PanRp?=
 =?utf-8?B?U2tSUUtzZDc5aC9icUZRdXk5Q2dZTlpXZlJmZCt0WVFMeGJ2OU1ZaFFtNnFq?=
 =?utf-8?B?MEZBTzBYNE1XUnZoM2h1MkFVSms2UEpNbnlmQWZ6MzlxWitRd09sdFNXS21L?=
 =?utf-8?B?WUFXZnVDTTlsWVdteHB4dWRoVDZud3dUbk5WTkdoNEd5dUNlUkV5TGx6dlMy?=
 =?utf-8?B?N3NlbXVHUjM0cllFWklpSENaQXZwQmRORUgzUDZ3czQwOWRaVTZ4UUM1OGUv?=
 =?utf-8?B?dGhzTUdEWXhkT3dJcEdJTnh1Vk81M0hjNUFqWG56WHY3OUN2QVQyYzRMYXFC?=
 =?utf-8?B?d1NiSEhxVlhpamJGeCtyOXpUaWhzdDJEYTJseEZ1S1FJZi85WGxMVlNRVk9t?=
 =?utf-8?B?bCtBcXAxZmlTdE9IbHNkQ2ZNc3pJTU9NMzJLUHBRSmdRUGlaWFhSZWxqdG5p?=
 =?utf-8?B?RnQwdmlBRTFadDdORWlPMDVEVlNKSmUyZEJRRjhXREc0UjlaZ2dNcUovMlpn?=
 =?utf-8?B?TzgwcmJtMnM4bkk2QzlVVUFpQ0xWMTUvVzJGWlVHNmlXdjR4ME0zTFRLWCsw?=
 =?utf-8?B?bDIxYkdJK1hCeXkwRXNrNlZEYWRpaGdhTVdnSXBzOFVIUyttM0plNmhtdTNI?=
 =?utf-8?B?MzBMYkRDWE1lWFhxM3NLSVpSRWNxbG8wUzUvdmVvaElSU1YwQVA1bUFHTzd5?=
 =?utf-8?B?L1NnQjluVGpKai9WSEo3Z1FBWUlEZ0Z0TjExRVRHQ0pQcFZPOWpreDJOT1p6?=
 =?utf-8?B?d1RlV1BsUXpDMk1NbWpVb28zbFY4U3pHS01sUmROK2lGNEFCQzRqNzdJdFBy?=
 =?utf-8?B?SWtVR2hGaU9ST1hCTUJDZU90RUxZZ3NqajhYNG5LQkJWZlVoNUt1RU01QjY3?=
 =?utf-8?B?ejBsUUtMelJITjFqZ1VRV25Cc1RqNDY4THdFemhzcXlFN3J3N1psQ3lQTVVI?=
 =?utf-8?B?RWkramlqZnZSWkpHMVBvU0ZxRG1lQjZKclQ2L0xpY2RLNmYrYVJNUGlpbENt?=
 =?utf-8?B?Z3M5VnhqWFlORW9GOEliVFUzUnYyd1g5d0RsSjlGWkVzbktaSVNVQ1cvand0?=
 =?utf-8?B?aHFmejJqSUdpVVFKRjJHYzhUQ041cGYrQ0J3Q0VXYmRvL05ETWw1UUZtZk5I?=
 =?utf-8?B?YzFmMERpVUlYMklVZTJVZ1ZHQU9iSXdsVmdTK0s1anhRK3FPbUEzaGxqVnFi?=
 =?utf-8?B?QnpRdFRiY2F5NVJtY1NxYmhRYkFVYWdOT0plSERvRVVIZElIa3dkSFJ6cEJa?=
 =?utf-8?B?RHREaUhnM3d0Q3ByV0NKUkRpa0drWk5yaitRMm5tMU9KcExDNG5vQWltbGY1?=
 =?utf-8?B?VDIzcXBvZysydk9hVFJxSnJsTjlvbUgxZUY1V1M3UTlDeldoM21vSDZXN2py?=
 =?utf-8?B?SWlyOTU2YTR0Z2lQV2FhdnlJTnhJeU9XQk5Db3EzQXpvVmRvQVlpVlFjMnAy?=
 =?utf-8?B?aU5heW1iT1pmN2g0RlhycTQ3bkYrZFpIUHQvaUprK2FOcEM0WWlNS21iMFc1?=
 =?utf-8?B?NG56NktKTEd4ZjZCYVJDOXZ5Vlp2L3pNZlZCMTV5ekJzSlFJSjZOdWRGZTNX?=
 =?utf-8?B?Q294SlBwVlVQbnZmNWl1bFJWbVJGQVBmMTZZVUdoN2VRWXVqVjhtVkZBMzJX?=
 =?utf-8?B?aFloNzIvb05oUkRCcXBkeUNhRUMxM1BvZ0Y0T044eHJIKzkvdjdJSUlLT2dy?=
 =?utf-8?Q?KBMJH3MRPYM+/FtfAjBAWiwrs+4ge8UW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDluUkwwMGdxU2J3TThEVWRSWWhyNmFnTnF3MVRXK3pINUI2WEQ2MExNdWV5?=
 =?utf-8?B?OFQ4MHY4a3N1QlBWSjlZUFN4T1k5N3lZZDZVU1o0S0FKQWFrS3NaeWFMRG5u?=
 =?utf-8?B?SkFZUFBScjY2R2ZKWGpjdGVjTXc5eGlkNUtwc09FcU51OUluQWs4cjZGaXFs?=
 =?utf-8?B?MVh0MWNVMWFLQlMvcG05aHlmYnB2VlEzWFJCNHptTmpPL3gzUkp2WUF3MlRh?=
 =?utf-8?B?TUoxclJEZ1kvNHFTbFUvNHhGREp4YmdBdGRKczNGYnE4TUhYbnBPc3Zoa1p6?=
 =?utf-8?B?RWs4ck8zWS9KQXZsSnh1M0lLOTB0NVB0REdmVEo2UUc4QWNpY05VdWp3Vmcv?=
 =?utf-8?B?dEpVQUxUdDVaTU5Ub0xaQ2V0dk1XTWJlZko5N0VoQ3lQT1NJdThFSU95elkr?=
 =?utf-8?B?dU5rN3pQMjhiQnhXTGx2V1VwaXE3Z2lsZEsvQ1hPbS9jbHZ5WkhZek9BZlpi?=
 =?utf-8?B?NTdtU3FUTVZjc3BqaU5VV2lIdDVDdjYyNENIUlFQVzFuQkxHSk9iVG0vNXJU?=
 =?utf-8?B?UzV2QmxGUWswOURPNkV2d0xhTXowNDkrU29KNXF6d3VmL0Zrb1IvOGZKZzNZ?=
 =?utf-8?B?cVlCODg1ZDEwbXBFeFl4TFhDby9UMnkwK2hHdEUydXUveG4yM3RDZUlYNUtG?=
 =?utf-8?B?L1g3NjJsUG5taHVDS0lPVlA3TGxOTmxqVlRCcWY2ZkRucDNYbnBIK2w2V3Nq?=
 =?utf-8?B?djlNVmo0d3lBeExtSStBSFE1TVlHYWRodFpUUy9OVTZOVWhpTlcwdlFzKzN3?=
 =?utf-8?B?QlJOQ3JHeG1oYlE5VHY3NDEwMXJJYjhSSGJRSWV5K0FnbXhoTis3VStZMEJz?=
 =?utf-8?B?NzRqSmlhUU5QS3VvbnRyOEhQNmFEUUtEaitVekRnUUZEblJ3cEYvKzZaNi9z?=
 =?utf-8?B?OVd1V3ZhbkZjdndQeDFGaStEcE1lMDhTLzEwUlNIeGRFN3dKRi9YbkZSMmpF?=
 =?utf-8?B?Q2xHUllVME80RjMrLzY4L1dGeUJUeVRHM3UycGZsZzNPaU8rYm5Ga0xZU3ho?=
 =?utf-8?B?TFRDeGJSMDlKZ2lXb1RhS1NRVUllZ0JYejZLcUlhMGJsbVpMZ2pZWURXRllq?=
 =?utf-8?B?SnNFUjlCUUJRVC9tNWNKS0NHQnJBWkViMUJ2azNWTFFiYnRkcHZRS2lhUkc5?=
 =?utf-8?B?Y0h5ODk3a3NKMzlvVDVXSFdObjNxcUxRQllnSVVScXppcmt3dlFVOFFSdEcv?=
 =?utf-8?B?Mmo1Z1RzMmNjcnVwak43K2UxTk9ORHQxL0EzNVR4L3puaW45V3VTSnI4VXl2?=
 =?utf-8?B?RCttSEtTVUFPazlJNm0renRpekVPdEVTWnlBTGUyZHY4WmNKQ0RXL0I3NUl2?=
 =?utf-8?B?KytqQ0F3aDNPN3V2QW4vbWhqT28yMk5wMEk1czY4WXQ3a1BZaHRoa3JWQTVR?=
 =?utf-8?B?eC8vTHJsRlJ6VW9hSVY5aC9tU1BLNFF5SGVmWWFuSENKRlA1VkVDSHFNbkNC?=
 =?utf-8?B?eUc4Z3phMVhuTWQ0QzhuY2pFcjdhTG5LOFZPSUZ1Ui9kZ1BacU02WEJ4cS81?=
 =?utf-8?B?VGtya2FWOHh1cUplc1VHZjd2Vk54bXpHb1grMlc4YjY5SS82S2RMSlBhSkhv?=
 =?utf-8?B?MU1GSFAzanV1TnVWZXA2a2VISm1wZTkxamdBSjNZQkVOYnBzNXNINjRhbkFG?=
 =?utf-8?B?SnhsbkxCNlFTZmJEWFRrQ3MzRTJUQW1aTTNCRitOalBNNlhSYXZCTFJ1dlBS?=
 =?utf-8?B?VWJrbWF0ZU45WEh4RWdpQ05hSXB5TG1GbEJ4VUJFbGJuWmxCS1hpcmtHZm1l?=
 =?utf-8?B?OUtiUW5kMmJYazlKNU5kYkhCbDFzOVBCU3Q4NzQrejNtdGlpUUp3NzZOcXVO?=
 =?utf-8?B?RnpoQ3RKcGxRS1Y5cmc4cUEzYTFkLzdQbnl3TS8zRWFjOHAwK3ljckpYNWw0?=
 =?utf-8?B?ZmZDMmlpLzZ6ckRnV24wN2RNNGVzUG12MWpVK2FmZS9FbXo0UnR2Q2pjVjU5?=
 =?utf-8?B?eWlURjMzMi9hcnlqTTVjaVdaeHhNRjFCMkxQODF4UG1ZeDMxYkpBSURraGo3?=
 =?utf-8?B?a2ZKeTRyeWV6RnVha1F2V29KS2RMbFlZOTJGNm0xOENhdWZKV0RwS2doWHFG?=
 =?utf-8?B?c3p6OEMzSkFuRGdzVEhxNnVDSmVvU0lQOG1YbXZ1ZTJDVkkxQXdiUVhsZW1O?=
 =?utf-8?Q?GuSeIOvmGqW/FA5g/jdFcmKrc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48427ab5-2dee-4627-32b1-08de1e6b18dc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 02:04:06.2220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/5qKH05nry3IlzWfIJLaSqQuLACpWBD2zVVEAZuAsJ/em+1MsRf9NM7z2dBUleJuKV0zAy3as9kFWm4Tb071w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870
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

On 11/7/25 5:55 PM, Alexandre Courbot wrote:
> On Sun Nov 2, 2025 at 12:33 PM JST, John Hubbard wrote:
>> On 11/1/25 7:41 PM, Alexandre Courbot wrote:
>>> On Sun Nov 2, 2025 at 9:34 AM JST, John Hubbard wrote:
>>>> On 10/29/25 7:05 AM, Alexandre Courbot wrote:
>> ...
>>
>>> We can always add doccomments in the macro, as in the patch below. These
>>> will be displayed by LSP when one highlights or tries to use one of
>>> these constants.
>>>
>>> If you think that's adequate, I will send a patch.
>>>
>>> --- a/drivers/gpu/nova-core/bitfield.rs
>>> +++ b/drivers/gpu/nova-core/bitfield.rs
>>> @@ -249,7 +249,10 @@ impl $name {
>>>               { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
>>>       ) => {
>>>           ::kernel::macros::paste!(
>>> +        /// Inclusive range of the bits covered by this field.
>>>           const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
>>
>> Will that let people know that they'll see something like
>> IMPLEMENTATION_RANGE() for a corresponding .implementation field?
>>
>> I'm hoping we can somehow create clear and plain documentation for
>> the various functions that the macro generates.
> 
> I did try to generate better documentation for these using the `#doc`
> directive, actually posted the patch by mistake so I might as well link
> to it:
> 
> https://lore.kernel.org/rust-for-linux/20251108-gsp_boot-v8-16-70b762eedd50@nvidia.com/
> 
> Unfortunately, the final documentation does not appear with
> rust-analyzer/LSP, which drastically limits its usefulness. :/

Thanks for trying that out. I'm starting to believe that in 2025,
we maybe just need to fall back to writing comments directly near
the macro implementation code, and that way there is something
for people to read.

That would still be a significant improvement over visually parsing
the macro implementation, in order to deduce the new function names
that are being pasted together. I think...


thanks,
-- 
John Hubbard

