Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5063CC1DFDA
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 02:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F36B010E878;
	Thu, 30 Oct 2025 01:09:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sYK0Gp72";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC16310E878;
 Thu, 30 Oct 2025 01:09:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xop8bKWc5utLQ/42LEr1E0WLEeTo/d0cQsZVkbHZPw9J9XDwQl/GbuIogn9hBddwfk2jZc8tFUqYrULzSs7uyFlmAPr20AsavWtrKPldbdQbPgxv/XT7rixvbNf/yllZS3OdwBrMy/yGM4l5o0k7lLPZ09y+AV/yCbGefyCMr035LUvLee8mkjb4+C6ue9e6zFuqv13TdIsXXIj8WOadtDyOUJZhDTD5QjSB6zfh2yEOeZkPc7c9WNMxK6N4Dx2necao2a/ebl02CwIZKtv8Unth4EDqLFyvEWmQSYmLoxe6cqEwpuWfq+TZEhUlq1l/+PPVScFhgz1hkpdSxcK2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K7LuEVBLhVWoCJFZVr3MjVqBTsYw5BLI13SzvzotZ4k=;
 b=rI61Fo3YlMV9jH79V1DRoHM6uFdtMCxmF9LmRsIKymKX6qSJ6r3fE+nnkRNcl/rj/IkF/lWACHw0QdYNCmgelc8irmP0sNrKABZ5H4aNwD/1imT5aeumqLd67K3kK5Pauz+nmO+bpZPoNk60Oa+Ur8Fj2CCgz2/gZYmPHSsVropjHUqndtded7CqQ9RbgylqdN3Kb9zPdTzgVPKprDWP4laOgHpB8qMPVZ3dCOPTpMvKj9r5+yY+5gbimoy3RCht5Gk/MQ+YKJpVTULRucZBBWNhcJYiEn5I6yzuTcXC1z70jzkMS8gvB3lm/5dJNBtk3T/OOYY00mT2LwNrK8+/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K7LuEVBLhVWoCJFZVr3MjVqBTsYw5BLI13SzvzotZ4k=;
 b=sYK0Gp72xVsknyW95urJ2XOWiFarQ3PB6q+F3LvS8RVNd/U6fRBtzq/lPQpn7WA71h/B1sMLgNzyfOwrnORWNwQQ6qf1KPemCK7DxvB5PTNc/Uy8A3syDOtYslY5rDeB/G09gjnXgDP5N++3uKpdAZwPYN88cU8MYI8AoMXVaJixU606GCp0bD8GWZPZW37JJ/EocoMAu2RPQrxnoOE986TqI7Mtnc2N/gOmY0Ws4M2HXbHjTOx3uYwaywfEdFu92mjpFN9yCP3jVnNiXXO5iYOXMiEIHcn8fKJbESHmfqD3iOEocYtNSGBRCbjrfFa7sh3kUMYyZkv5aKuyWHt/hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS0PR12MB8526.namprd12.prod.outlook.com (2603:10b6:8:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 01:09:10 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 01:09:10 +0000
Message-ID: <5fabf22d-1aec-42d2-99b5-fa13dcc94950@nvidia.com>
Date: Wed, 29 Oct 2025 18:09:01 -0700
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
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <DDUUUUL0GXAM.2LNWCIEW124JY@nvidia.com>
 <b0ba09ba-5e28-44c7-b9b3-e199bb968fe6@nvidia.com>
 <DDV8W8QCD59Y.1HXCXMUS42JI5@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDV8W8QCD59Y.1HXCXMUS42JI5@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0021.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::34) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS0PR12MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e425fe-b146-4ae3-54a1-08de1750eea3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXJXVFgvZGI5VmZrS2pRNTRkU3lEZldoelhYREJVRnp6bDRCeitub2ZYZmk3?=
 =?utf-8?B?TlExUGhXcWJOMjlKOFFCZXJETi9sVDZnUEdxbk9qT0llOXFVNWtObVZqL1F4?=
 =?utf-8?B?M1F0cUVyb1BQaUNZQ3BQdlFRVm5Ld3h5ZXJEZXRRUXoxOTRYT2xXSWYvVUFl?=
 =?utf-8?B?Z0xVVFZ4Zm5zMlY3dEdBVjlaczFpQ2ZZK200RjFMTnNGQ2Y2OVVDSEZLdVcz?=
 =?utf-8?B?MzBaSExLdVpZaDN1YmdNOGFXcmN3Vjk2OEU3Umd1U3I4WkRpK3JjYjBkRktF?=
 =?utf-8?B?SEtyWlF4MThoUHJaT0FWcG5jMS9Qak9HRHM5TldrSG1HNDVScGhoVkZSYmlQ?=
 =?utf-8?B?dGRwUmpQeDF6TUFPaDEwdGtKSUlCTFBocTI3N2U0ZmFjbGNOTytjSDJoS2h5?=
 =?utf-8?B?N2FZKyswNWdrbm9OVHRCWG9aSHBETzVtMlp4M00wL2VLQ1BETUFnNmNIa3pQ?=
 =?utf-8?B?VUhuRlRBcjVqKzZaSDZxcUttNEdZNXpKdHRuSmVUdmNoVVJVN1VFc0M2MjBK?=
 =?utf-8?B?cXRpaTBKWkQ4TXJIMlMrRGJ4ZDE4S2RhZUU3YWh1cWlXSFAxSkpydnFMemd6?=
 =?utf-8?B?WnhGVVpQSTF3ZXZMTFZKOWFMdlMwVEZpWVAwRHpFK3lDbVB4Mmd0ajJRdzRZ?=
 =?utf-8?B?MUZ3ZHV3NXEwa0M3NEtnZlhxNEhxSWtUWDBxc3UyaERRNk15VGM1UkRTZEZZ?=
 =?utf-8?B?MXVrVCtwbXRleWRDVURjcWtybEtPa1hHSVNVa0tPaHA4aDRrNGlzcjROMEdl?=
 =?utf-8?B?T3JQaDlJbmt2VFR3VlRZZEFlUmttNE05R04xbHpxZ3hwQ2JhbGY1cHp6TnQw?=
 =?utf-8?B?OWpQQUVvbEVKdUtzTHF5WlZJYzMrcXV1RlpiZmNjU1ZUZ0xOWGJQRFJrYzRD?=
 =?utf-8?B?ckFpWlllQ0VDTjl5OXIzQnpwSHJoRGc1YlM2MEkwK3JwZUdmVUJCUGFtVE9S?=
 =?utf-8?B?eUw3WjJoRk1WOHZBaDk4dldyRVk2NDdDWmFCRllMQzlQcFNrZ0lOT2J4SmZM?=
 =?utf-8?B?MXQvaWxldHFuTTNCeEdHRk1YUTM2bjI3TitacEFFNlVoa1dRY0NySnBuSGx1?=
 =?utf-8?B?cGNWOXk4OEg2dEZ4RENCMkUxWHhnbVRxaVJGVndsemlZZGsxMU84UEd2UTNN?=
 =?utf-8?B?Ym5DVHRlaTlNYWJhME9JdytnYzY3Qzc2MVo2MjQrQ2ZHMVJwdkZ4ZDNyakNO?=
 =?utf-8?B?bnRwOGZUTkVRRm1xM2ovYm1KSmMybEtTMGZubENsdlM3a3o0Zk9oZFBNWCtO?=
 =?utf-8?B?WFVrZEw2KzFJNkR1Q2FvSFBaWjhXOTNhSjJGNHI1N1ZrNEJLZ3U2NGVKWmEw?=
 =?utf-8?B?Mmw2RXNINVI2NUxQWlBhRGQxRGYyeWwyZmJMSXBmVkI4ZkpLeFFNM1JmWDBS?=
 =?utf-8?B?Y3ptek1wc2RGS3RTUlhNOE5XVmZjVG5tY2t3OCtLN0p0QTdUOFFaMXZtK1pv?=
 =?utf-8?B?eEk4WGxLOEFmR0Q0NndWWHhvbm1hdWhSOXRwSThwQU9jRkM0ZEc0UG4vMkFq?=
 =?utf-8?B?OXRIYVlFSUgxNWkrbUUwTlZNYnZFREFMMlNuK1J6NFFsOFd3c0wvbGNjMTMv?=
 =?utf-8?B?MWo2Y01oTXIwZXZ1d2R0bk9rNFJXMEF2cmwyeS9hRmI5NVRkc0dUZDFhK0wv?=
 =?utf-8?B?VWUxRzk1TWM4cjNjOURULzJ2czJsVG9xaFArVXIrQzhPRTlyTkRYL1h4UjBv?=
 =?utf-8?B?ck9UcE92VjJjZE83NUUzcnd4MlVxQURvUStON1p1Y25VYnNuZk1KVzZQRWxJ?=
 =?utf-8?B?MzVtMXJUTHVqaTJtMHNsTTU2L2MxMXRHTytXbTBlZVhudUNnMS9sTDZ6RDNp?=
 =?utf-8?B?bDc1eGs4Y1ZjMVJ6VE5DVHNTNjJCK1dZYzRwd09aVko2QnNaUjRGNTFnL1dt?=
 =?utf-8?B?ZjM5R1A5RFA2WElZM2tyMFVlSjBQK01zM29HY3B5ajM4YzZ4MmdnTnJ1ZmMy?=
 =?utf-8?Q?BnwLRsazboWHM3q7WP6YL74dd+QLvQRD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SFpxZERUZ1ZIckFwZVV3U09ZYzdLTHBlYmREVlNFbmdzcE1lT2xCeno0dVVp?=
 =?utf-8?B?VUp2NUdKb0kzWFFEbjVCY0E3V3hVV0ErK0EzaVp4ODBsOFdORXpLSUZuSmw5?=
 =?utf-8?B?OTlGU0hjTjJrOTNxaSt0NmdMdjlmN0pGRC9pOFRIalp0b1hFUkdFOFduTFBY?=
 =?utf-8?B?SmpOOWFOQVdoK0RVeW1WY3VKdmQ3b0dCdHNjV1lRV1lSRkVuYWFhYm1yWmFX?=
 =?utf-8?B?K05OditTTklNc0VRV0U1QUVaR2dzZFFMaG5rNUtGT1hqK0dmWlBrcVVzQ3Bs?=
 =?utf-8?B?a3FaSFF3aklxS3BNa3B2RzN2RElYTzVZT3QzZ1lGUkZCZzdFUW8zT1JRVWtm?=
 =?utf-8?B?aWNUa3Zyam5yMVZQbDVwUFAwcHQ3NVByMXl4R0NYUlFmMHZKRXFOVU8yMTZ1?=
 =?utf-8?B?Y2pGUnBkUTdjOUx3VWZaUGpRZHgyblNkRXlKaXpSN0FIenUxYWlPR2ZpRUth?=
 =?utf-8?B?Q0tsVFlkeFBxNGpETkxTV0hvRzZQeWxwKzU0UXNHWkdBVk5IUmtHRWxxcy9Z?=
 =?utf-8?B?MUVoTmNuTDdMSXJRdXBERWFBcVNNaWRKZm8xNmZ0dHFKMVB0RlFxM0xwaEo1?=
 =?utf-8?B?YXhIZ2FUVUR6S0tkd3FYRVByVE5qZnA0V1VpR2h2VS9vN2oxblBKMEszaXdz?=
 =?utf-8?B?UytTUHNzL1lsaUZRUUg2ZGs3eEFJMUtKY2pxaVJORGFQUjc1N0hlQkhWbndK?=
 =?utf-8?B?cDhqTDdIUVJtMGE2Z3pxRDhJakw4SDFQbitTNjJkYzFpaW1GeHlZenZJOWl0?=
 =?utf-8?B?K2g4c05ZeFJYVGYzUGw0TERwemRObUpuVUxUaVZaVVR0Mko1RUZ5TnRuRkI1?=
 =?utf-8?B?aXArVXBobVl5WWJJZXlGa0ZDQmRwSnI5R3pBcHN4bmh4YnMvNzhHYURTWGp0?=
 =?utf-8?B?S2VDSjV1RFZUQmxFbTRyQzNqTU4wZXBCaXFYNE8wME1qMDcybUhiRnRNZ0tz?=
 =?utf-8?B?Ni81bEV1a01aSENyM252SWcxSURuTmZjTDhPbmZsQzJGREQxVVVPOWI4eUcr?=
 =?utf-8?B?ajFuVzZWdTdQN0ltbHkyaHQyc2N4OERnQ2lZakNoMlNHQkJ6bFlqTXJ1RHZM?=
 =?utf-8?B?WlJNQks3eDBQc0YvSnpFRm9TNmJzcDlMb1czYlJoV3pybmZmMExMRXI4eXcv?=
 =?utf-8?B?bDIvMi94MnNFSHkzcER6RTJ4bVNOSXRYamd6YzZ2MjNMU2N2bDJjcW9qWnZV?=
 =?utf-8?B?aXZwcFpSdkZUTVJPM0xOcWpnTThVbVNQQ0ZYYUtMMkNzUEtSTDdsM0w5OWNR?=
 =?utf-8?B?b09pZzRTZ25QRE1SSitKeVRqc0xub0dLWXpnMWJYUEp0M3VIcllrakJuTHRn?=
 =?utf-8?B?TEtwUUxDeVdtMklZMmZvNGJaL0t1RVhIWW1rbWwwWWt4UVlnaHZjL0h0OVVW?=
 =?utf-8?B?dm9iSmhjRTFMRzdDWTE1QTRjZ2Y4NDFqL3JsQzFWaXVSUURMSzRaWndYeUxP?=
 =?utf-8?B?QnRyOFEvemx6eXdONXZIazVuOU9ia243ZnVLcGFGRTlQUlJxNzlhWUZkZGdV?=
 =?utf-8?B?ZHM5UzBNUjhPVnBoa1VTL083MHppL2FPK3JsTWZ0ZTlobHBleHlXV0JiUlhH?=
 =?utf-8?B?TDE0V28vV202M1o2RjhRVHNBNjlQK0IxOGNNdjhrbGZDU1ppb2k1UEZNVGpk?=
 =?utf-8?B?a2NGNHAvK2VIT1VnaTc5cUlPemRKR1NScE1rT280Qy92WmpjU3VWWUhvTmVy?=
 =?utf-8?B?MGltZ0xhWk5kTENiVDZlc0FjbGtQWkhuWmt6Yk80UW5nRFN2UFNBWDBMclAr?=
 =?utf-8?B?VnpTdG5CaTY3WFg5Und4RzJ3WTlKWHJ1NmFyajgxbUFpakV5bzh5eURJZGFY?=
 =?utf-8?B?RkxNaXNHVjRkSm9rVXhtUmo4VmZqQ3l3T2dxTUpSd3J2cXp1bWdiaHo4bEFY?=
 =?utf-8?B?aTE3SENzUnhpaVZxWmlxZ0RJZU9PWUtyb0NtTEJOSUljYUM5S2VoZ1ZFdDJO?=
 =?utf-8?B?b1JXRUsvNzdKZ25kZ04rcGl1bVZ3WVIxVFY0NEdzc3lMdXpSMVJLemNLMXhW?=
 =?utf-8?B?UFFiZmRxMlJ5RG5uQ09BOVVBc1dPRDRlQnUxak5DYlhsTHo5LzJmQnp2SkZs?=
 =?utf-8?B?OXpTN0JMaGNrTnMyNzlVTHBHdzFhU3FSMDRna0QwK1Zra3JYMGtJL1oreWVV?=
 =?utf-8?Q?SR34S45pBpRiv5A3CgNes0lSc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e425fe-b146-4ae3-54a1-08de1750eea3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 01:09:10.3157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyJ8sKGYw8vmibyZ4A9zlR+r1Af97t6IV3dvHyopjG382t/sYzVy/56JjlKHejV7PR9qWlZgJdKqetkCCgQ74w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8526
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

On 10/29/25 5:54 PM, Alexandre Courbot wrote:
> On Thu Oct 30, 2025 at 9:37 AM JST, John Hubbard wrote:
>> On 10/29/25 6:54 AM, Alexandre Courbot wrote:
>>> On Wed Oct 29, 2025 at 8:26 PM JST, Danilo Krummrich wrote:
>>> <snip>
>> ...
>>
>> Done. Final code snippet looks like this:
>>
>>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>
>>          if boot0.use_boot42_instead() {
>>              Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>>          } else {
>>              Spec::try_from(boot0)
>>          }
> 
> The previous code was returning `ENODEV` in case of NV04, aren't we
> losing this? Or is it moved to BOOT0's `try_from`?

Exactly, this is by intention now. We can fully determine the answers
via .use_boot42_instead(). The nv04 check is redundant.

thanks,
John Hubbard

