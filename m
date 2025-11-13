Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA901C59EF2
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 21:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B771110E949;
	Thu, 13 Nov 2025 20:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sn09os9n";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010058.outbound.protection.outlook.com [52.101.56.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8826B10E94F
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 20:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOXOUjpYz0ACrkLqcvSH7SXmXZuOshxD/oi+HsunzjOHy2VREPDU2whcqmqdYcIHVirJuVbCsNQkpafPLb9B1KFrXMJ4i3115MXu5SN2F+pk4qF0zlytM4owlBrx1j++WswbACIPdhD2BpnDO7OsyvBD9h5GmIp2ORGquJIdNzT3nYLc+QKgr5PfFT/7hIEZs9LgXQz2Y28fK9liVSqQWzwyy4u5o9q5pxNBwAUpZal/0Uz9ALQpIH+MnKmMFYD5axDYHn1yRzxILXPXkaNvf0DMv89eb0X+H7EF8PEzw9zFAE/jFrw5d2F8yrv4AJsVwFJIiHT+mmHKeYYfMvk1GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZCwL3pbi4y9vOPIbsz/Zc7HQw5sq/pWgDaw+qR37RnQ=;
 b=oT05cyHvM07rD9DxJfV/DXPrP7vRxki7BSTV7A/aikwKA8uffcZcgKuP44kzsQypPRbRCkYsB4KGqizKJDVheQq1xVPcZV5dqnGC3N4PChHceeOZdYTKP2X5/LHkTNqyAZfX3dAfAtIK45lq0zR/vvZ1kBstpOK+2JHsLN6W8M0zwepngh/jU3YnC4eNa0jJ0F4wNkuTYAfyDaA5NvMBt9K8udBemhL0cWZWzkb7brY0aBbU0FVzjVBaFtfx1hJ0XiQH+gB0XiSsbufyJqACI2xY+xGTjJg6xZjHzjOMWczj4ngoAbA5+d/6grSgSr6EmYpowS2kpnL08kgWFok6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZCwL3pbi4y9vOPIbsz/Zc7HQw5sq/pWgDaw+qR37RnQ=;
 b=sn09os9nQ1QLrw4f24SVYtwwOQGxZSVDZKmo/UoP5BM9443/WZekohjQbr4knFFyEAueUZZq3sSnxwZvbH/0U4HvRAUugQc+SsIUq3C75TKvak4fzTrZiZU48+t/pkbbjQ/Y1R7yr1E/QutQ/K3nX4STXLF+u32j3v1iuaQ9igxRiH4ELpYTNhd5jG1Sjq1rDh7Pi6Jv7hxFvauy60lwKkhnhKEfMkinldV4/97HUWYyvDH3QDBPdXpNiZ5VBHanc7gkNj0NB9UXCEbslFpKpYAuRjY5LsShivF/koq1oCRWt+bMcpIQgPAj7OUBk7y5PZz3/Q0+0VYay+iSBoMfKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 20:16:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:16:43 +0000
Message-ID: <4b3badf1-e3ec-47a9-b90f-5f13234afd5c@nvidia.com>
Date: Thu, 13 Nov 2025 12:16:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-5-jhubbard@nvidia.com>
 <04594008-7b83-44bf-9e60-930a673dc2ec@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <04594008-7b83-44bf-9e60-930a673dc2ec@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 451d328f-04a6-4100-9bef-08de22f18fb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnhTbnlDNHp5bGsxSkg0QUtKblpQNE95RU92amNTcDV5TEtnS2hLcEwwVkVY?=
 =?utf-8?B?QXZQUm9nYjRJOVZTcWtncm4rbXNPaFpZV0FlaWM5bzFMN2hvRWt1WGkrWFlo?=
 =?utf-8?B?ZEJaSHpzY1lEVmtudHF3S2JKQlJaVmNWK1NyQnFxZ3dVWXgvVXFLamkyaWF4?=
 =?utf-8?B?VndqVjZOSW1jYzN1K2ZqdDNlRXh1T08zTkdGWWt6cEIzdlpPT0I3QmU4RlR4?=
 =?utf-8?B?aXVtVldSZGhQZmF3T0NITENaREZmeWoyLy9JUjdBTktIWitRM084WURxR2tY?=
 =?utf-8?B?b2g1cDMwVEY1dkdhM3VXZ0swVlJKekRldVlscWVMRjQ4MGN4R04rVWxCc2Jy?=
 =?utf-8?B?T3BkSjA5dXcwamVPazZYTnhIV2J1V3hmQ0MzUDZzaFRkclU3QlhQMGdkS0pF?=
 =?utf-8?B?U3VYWnpkWEtnV3JoRndacHlhRHNidzNjZ1kvZW5ZVnF6SnlHeVVoTjNxdU8w?=
 =?utf-8?B?L1NVV3VJU0J3d3FsK2lISld1aWYzTldJUWVjQmZHeGZOZnBnbi9VR2IzZExm?=
 =?utf-8?B?akJGd2NkalVYbGJjRjVvdU9WbEdjN096dkgvdnZVMG5VWTc4S3U4TXJ6SDlT?=
 =?utf-8?B?YWRVZENsZWxWU1FBQzNRZzRkUUZGaHVpdkxyb3I0bHZFWVdmVzVlcWdzd0c1?=
 =?utf-8?B?Zmh3UVVlUG9DMTcwTDE0NUJ3cy83Qytkc2VsQlF3bHVjTjU5U1Q4TkNtQTZQ?=
 =?utf-8?B?YUlwNzM1MGFPMmpFQ28rWlJ3Vm5QeFVJa3ZLWTNiYk4rQUVFMnd0a2pmeVpt?=
 =?utf-8?B?YUF3eGRIWlpNREJoYzdMK0Q5ektoT1lFNXR3djNTZFV1dXdDbFZqc0tCNkFI?=
 =?utf-8?B?VVJyb2NpMWlIV0tCd3VyYjRPMk00ZGZRaUdpVHVVM3BTUXpTU0ppSkFGdCsy?=
 =?utf-8?B?UXdlOFBQdkVTM05vV3JpZlVGSGNUUm5TaTF1OFVDWThYMERDT1NmZkZUNllz?=
 =?utf-8?B?NVpRRUQ4ZldxYVhvUEJkZXpNbzRwSUM2VGw2VXQ4eEdLekJKOWloV1pJK2tm?=
 =?utf-8?B?M1Vvc3UxcVVrc2RsVlNyeUt1RlRIUjhJeUZoQmlIVkFFSXF5OXluZGw4d2xC?=
 =?utf-8?B?Q1FZWjFNeDkvSHBqeUZqSEtQVGo4ZW9Dbnh5WE11NXUySkgyS2xtYlVZdldC?=
 =?utf-8?B?THBqUHhwSnNlR1RQQjRxRXpYUStUdGFSdnFKM1h3WCs5OWcySkF6MEgxV2Jh?=
 =?utf-8?B?MkVRN2hCRzVDTXR2RlJ1amVPN0JYYTBCNndwMnBQUEVaaERWQmZrdVdSYkpC?=
 =?utf-8?B?RCs0N29scWRwWnVhOWV3R0JhdEFJdnN6VDVDNHZWSFZ5RVFvb2g0WWRtZitO?=
 =?utf-8?B?OXp6MGpLcHA1aWdDdFNJWXQvc1V2SkxUMGdhR3RpRGxCemhOUGo5QS9WdXMz?=
 =?utf-8?B?aVhoM0JKaDBpTXQ0a1NpQUZZMEVXQ1lvU1VqcDBzUTBLakF1VUlVMUtrbkht?=
 =?utf-8?B?aEZ6eVlXL3lLSjVNZHR5N2g2WnpPTkUzNWMxajMzc3dWajk3dDF5VURuVHVh?=
 =?utf-8?B?TWRha0ZrUGJSdWpTRFBORnQ3Tm5KZ1lZcm5ZR3o4N0Z4clRhNTd6QnArSjFP?=
 =?utf-8?B?Y2d1WEFybVpTemRmNGVxcXExQ1dPUnk5UlY0QVBpS3NzeHFmaUxwaThmb0tX?=
 =?utf-8?B?WlpRdnZrYmZDK3lFL0dCai9uVUIxb1pEdVFIcHRaSThML1pibjFlUjZsK3hj?=
 =?utf-8?B?UTFUdVJkZGprRVdQZXN3Z2ZSRmRscTFwMDlOSnVtNFNIQlROZGlEM1BrSE9X?=
 =?utf-8?B?QW9WUjJYYnRuYW1adDBvVmU3RmNvVkQ2ZFQ3Yy8zY29QMXVvc2U3R09zVzVC?=
 =?utf-8?B?eTg4OVdPZDBiQ0lxa0kzOG5qd3ZiT3hlZ29xMGM0MzZpRHdqaTRlcTE1ZWVO?=
 =?utf-8?B?cUsybHEySkJXcURGTnVJNC83ZGJWckI5bEVnZjh0WURsNkthTjNQQXphcTZa?=
 =?utf-8?Q?yqBHpK7JUNfKOZCejYaV9aJKTBWi7n74?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpteDFPL3RLQ3E5ZjR3aTgvR3k1dTQ4Q3JibE9Ra05zNkVZeXRRMU5lVHZU?=
 =?utf-8?B?TDVMWHVTK1FjZU1Tbk5pRzhWUGR6V3RHUFZOUjgvMW5CczdKQXV0d2ZESGYv?=
 =?utf-8?B?cTgzb0RRMUROR244Si9VRlNEYXE3Q3RnY1k0eDViZ2pLUng3VnJQZ0xhQytS?=
 =?utf-8?B?RDRKcU1hbG9hOE1Tc0xaTlNyeGZ3VDlqRTlHZnJ2MjA5cjdMMDduckJ2ZHNI?=
 =?utf-8?B?VHV0d1RlVC9nSFprUks1OGZYZFRwRHNWbUxBazZINkUzbnlEeUxHajViTysw?=
 =?utf-8?B?NUhIbWw1eG40VHptU0dDZjBLUHo4UHE2OGFnaTFRd0J5cWhzdlpSdGg0aVRp?=
 =?utf-8?B?QjRBVWxkSGJQUUs4UE5yVVo2WXBnWmNrdDZxK2V2Nnd2alYyTGRsS0s1UXdn?=
 =?utf-8?B?REorb1hHcDZaWmpGOSswaitIRkpqdnRzWmhQaC9XcjF4bTRtZ0J0NFZOenly?=
 =?utf-8?B?cWE2ekp2QWNpOXhLVnRoRnhJemhWcmNlUWx3eFpqa2dLNG4rWTM0N3VqUjJq?=
 =?utf-8?B?NmpJU1JCUDI4ZUxFenJQN1c5QlgvRGtDZlVXbzY3V2ZqOFpnTzgzTEl6emtM?=
 =?utf-8?B?OGVBa0RYN2dVMDJDRk1qbUFiRW4xOWVCdTlQOWJmdG9Tc0ppazBla0thSEkv?=
 =?utf-8?B?YUhxK0hmTHV4VGpsT2lQZ21RSUpreWhMQzlvU0NGY1hKeEx0VzBhOFpxVDQ4?=
 =?utf-8?B?M1RkYnhOTG9EdFV2eURJZ3J3STR4TGhDcFZIWGhUWmFGUUkwUko1NVUyb0hr?=
 =?utf-8?B?eVg0KzB6OHpTNG51ZTJIQWJpZ0VCU3BKTnhoYkgvWXp3MFlMcEJkVDVaUXd6?=
 =?utf-8?B?ZlJHeUFsSTlKVmUzTTdQdksxT2lBZUI1MTluR3pLZEhDcDQrMWEzWXBTU3BF?=
 =?utf-8?B?VTJkNjRmOThaS0JwSE10R2xmMFcxVFNzbldpQllhaG5UdFZNN1UwWk5CVUVN?=
 =?utf-8?B?NjdHb3YvNlpLZStmNy9QNlFFMDhXTnZtTEkvcDBqcXlBNUU1M3g0WGdHbklk?=
 =?utf-8?B?bXBDM2wyV3BKTTRaNjZxV08xWUxwZWJqSVNjcGtwZnNLeGV4UGNoSEJ2WU9Q?=
 =?utf-8?B?YU5lV0pRS3YvUUxqbE9Ra2pLc1luZWRkQVlwaVBFMm81d3BDSnUyQ3VQdWgz?=
 =?utf-8?B?TE0yWDFqczVTOHdMdm5Qb0hsV1AyRkVlOFpuUlI4NWJXb0RWQ2Q0cCt0Zlh1?=
 =?utf-8?B?YXF2bCtoSmM5bUV3ejRJQ2U3czJBUzE0WXc0YzRReHg3R1dkYnJXVjZJZVIx?=
 =?utf-8?B?cWZXcTY0TzdYVGFYYjd2cWJUZHB5L0djQ0R3Y0Y4QlFjZy9RWGxSQWQrSElX?=
 =?utf-8?B?WUVpUVY3YlNTTGN1UzZYakNubVU0VjZNaVVzU01MYUltNXJSbFdiVHk5b1ZI?=
 =?utf-8?B?YTdNcXFwNHdFVnd0OHk1Q0NwQkIyRnZWRENYMXRNZ29sQW5ZcTZiSUdvWWJF?=
 =?utf-8?B?ZDNNSVZDSEJ3bG52N05PVGhmL0UwZ2J2bGN3UG1pNCtuWUJBMlJZS3dyR1JO?=
 =?utf-8?B?MU0vK3hYZUJwN1ZVaHZkazFreldtWWs2V2RacmM2Zis0Y3RmZTZTUjhCSmRt?=
 =?utf-8?B?dHpscDFsTHpDemRKV1hvdGwzNU90K053YzkrTUNINWw0aGJMQ3hvNFAvdVRS?=
 =?utf-8?B?c3AxZk5ucnlRNmRpOHM1QjJuVFgyS1ZmUHlsN1dIU2xLSUFQcyt2Y2hYSldi?=
 =?utf-8?B?eS9QR1ZVYWxVNUw3VVhEL1dBN3lXczFCVlo3QXQvZnRvTld3d0xGUm9WdFBu?=
 =?utf-8?B?eHBhMDdDTnR3NEllU0IzdzRvZCt0RDNqbjBQQ2FJMXVOcHhEZzhDSG9jTk1o?=
 =?utf-8?B?VC9QRm84bm5sMTV2L1UvcDNHNW1TYk5sc2Z0cDh1N1VFZmx5QUxzQXNVVDlP?=
 =?utf-8?B?OFVoMU9oVnhGVmlReHJUQlpnUTZkc3RGaGY4OVlCSGhzSkhMV3VnVnUyaXJl?=
 =?utf-8?B?QUZzVk05cXdpQVRRQytEdUw4eGFtZWMwcFFLbEkvT29KZ0swYXNZNjYybUNr?=
 =?utf-8?B?Uk9pT2w4WXBuNkdpenllRlo0WVdTYkNBcVJkaXhUelNPengvZ21YMTdBY3pQ?=
 =?utf-8?B?d1hyOEpjLzNsUGJjaVdaY0J5TUtjM3JEQTVUcHpCVXM2SGdnZlpjMFhpbS9Y?=
 =?utf-8?Q?+tFUrkffv7XwhNd3WaR+3HxPO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451d328f-04a6-4100-9bef-08de22f18fb5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:16:42.9411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2syvl1t4ozQyp4NceqzIb4zcq3TKFgjdjY2rFwN3DDorSeyq7TJzX2KOjvBtdW+OGy6fuYBRk0XBMJ4cRJK5rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
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

On 11/13/25 11:59 AM, Joel Fernandes wrote:
> Hi John,
> 
...
>> -        Spec::try_from(boot0)
>> +        if boot0.is_older_than_fermi() {
>> +            return Err(ENOTSUPP);
>> +        }
>> +
>> +        Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
> 
> There is an inconsistency in error return here, if NV04 through NV50, it returns
> -ENOTSUPP. For Fermi through Volta, it will read boot42 but will return -ENODEV
> because `Spec::try_from()` -> `boot42.chipset()` with return -ENODEV. I am Ok
> with either error return, but it would be good to make it consistent.
> 

Yes, good catch. It should be -ENOTSUPP for sure.

> There also does not seem to be a diagnostic if the chipset is not supported. It
> would be good diagnostic that the chipset did not match, right now it will
> return -ENODEV, which could mean the device does not exist. -ENOTSUPP is better
> though but an actual dmesg error message would be nice.

Yes. The "not supported" case would happen in two situations:

a) Someone found a pre-Fermi GPU to use for (probably) display, and they
also have a Turing+ GPU in the same system (!), and they have both Nouveau
and Nova drivers available.

Here, it's not really an error situation. If this actually works, then
Nova not supporting the older GPU is just expected operation.

But these older GPUs are not even really directly supported, so this
is a fringe case anyway.

b) A newer GPU is installed, and Nova does not yet support it. Here,
an error message is OK, because Nova is eventually (soon) going to 
support that GPU.

So I think that means an error message is reasonable here.

> 
> With these,
> 
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> 

Thanks for the review!

Alex, I think I'd better re-spin and re-test, in order to safely collect
the various small fixes from you and Joel. I can do that today.

thanks,
-- 
John Hubbard

