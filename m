Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA0C3D93E
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 23:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2310E9E5;
	Thu,  6 Nov 2025 22:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Uq0xLEH/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4A110E9E5
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 22:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSpnVY/T3cjaaOMx4YcB5x9rIuWVITinwQvNa5+DSuTIeW2xquF362J194d+6tfV05QuzEPphZRiVrxqAlePxSNUjDspF8TvWn/mQtLqIPndDKutxKVkS8IvsVNkJIhFT9CI+k8VWanqYluoFscBrM1TC1FJbm87iGo2oqfwUg8YAfUOKXjwyyjpRD/oFRRL3gyLzytKKtC1JVNQcP1N8+6rCm9QSxrRDZ6jmbMBw8AlxHUsGCNrG0kpZOJimlp1S2K71RbpUeBcp8chwMwQl5VSF+6228R6rhpl3o2VKgPnStpWKqtWeqfDI/AYORghARimfbAcsL8S/p4fQiQj0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OnkBIUBftVbEHjXjDu5T9LKJ2cRLm1kH9Ng4m24iQ6w=;
 b=GrWYBsiInQYpaMOtNadOlKEYA7O4/VvdUuoB32KDIR0M0ohRyatBlp8En5DHz6abfXndh8qWsB9nuwO0O4m8DLhUlwcx3gQNwlUgog76iwtzj3TUAy6/udD+t2ZkfpIB1kpUgEqSjRTNPptCwWqZgLz7CzFnw5M376s9LjXsyO013Y1SzMTfcHwSo64zwXLFyGxn7NcEgPhaA9NND4pqN9B+S4Ma4QagPmZzMhMN1XxQ8l8U7+eNOSSHcbGE5VdWC9wON0gr/rEc0ZqsGI1Cf4DOj9nrjystoAzKwXL7iINBtscbEierUUPbZi4g5jqe/qMMe61DuDc9Y3BRzDjYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OnkBIUBftVbEHjXjDu5T9LKJ2cRLm1kH9Ng4m24iQ6w=;
 b=Uq0xLEH/sf9hkfzOCTy7cVdhyxMJ6qzDHG44Vg7rGC2EyXpiM6TRxaMCm4uP7uzhejSOViTIgpqaoF9qeyZEgQYP/UARkJC8Ab7IajRMR9NbMkRI+rjnHL763C3xeh4phH4P5Zh32EAImf3KPQ6h9O5fkk9uvjU+pokQtvSBjIVN82pV4phFUJKkWdrOkUXpWB9Ln5+Y8KpjLdyj0oEgQN62hKMUsRapOkWujOMOJaTA5gOTUt25FnW89+EB/vMi3vf89oMxlGnt9lc09PHTrbkobUFrdNm7JbqzXf+/PB6lWYSKn2xlq2c+pPWiG1Sul8io1odDyhVCJ8a7Y/aEZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS5PPFB8FBD73EA.namprd12.prod.outlook.com (2603:10b6:f:fc00::65e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 22:20:21 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 22:20:21 +0000
Message-ID: <4d93d66d-d186-4b0c-b51d-94303c58b791@nvidia.com>
Date: Thu, 6 Nov 2025 14:18:43 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] gpu: nova-core: use gpu::Architecture instead of long
 lists of GPUs
To: Danilo Krummrich <dakr@kernel.org>, Timur Tabi <ttabi@nvidia.com>
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
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-7-jhubbard@nvidia.com>
 <fc6616d404d8fd04a62bd90fa0f79e2c9d2a17da.camel@nvidia.com>
 <1c86eda2-b9ca-426c-8813-f91ddcd22085@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <1c86eda2-b9ca-426c-8813-f91ddcd22085@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:217::13) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS5PPFB8FBD73EA:EE_
X-MS-Office365-Filtering-Correlation-Id: 28484271-67f1-4d20-797f-08de1d82aca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlI5ZlZuUlBUYUdYMmtNelhlMVhOL0R2b2NmblY2QUFoeDA5dkt3bVFWWHRa?=
 =?utf-8?B?cWRSdWdnQngyQTN4TThuMEtKUUd2bjFIM21rd2ZwNEJEdnEvLzhNVVZ3OC81?=
 =?utf-8?B?NTVKMFh5U3dzZ3hEdTFld2duUFd2bGRiVmRhREgvaVpxZVd6Wlp2dndKV25Y?=
 =?utf-8?B?dFJkeTU1TDN3NHRNdkdwaGovYm9aZE9ITWJMTXdkOGR0VXROZ1lBZkp2ZHlW?=
 =?utf-8?B?ck9YV3VMWEF0S1RVV3VTcVVqUlo0ekFBMm5oWlYvRVUvREVzS29DbnFyTTdL?=
 =?utf-8?B?Y2E3ZHRVOXR0QnJJVnRpNFJ3ZzV0cjREbldvNkxWR0dQVkpsb0ZBMlpnaXBX?=
 =?utf-8?B?eC9BU2Z5U0FVTTBrRkJ1UlRCUUFqOExOanlTKzhicFdFRVhaRjFTQ0M4MG5a?=
 =?utf-8?B?TGhUZldndndXQVQ0U1JZMktYYW0yMENKaUszZmdVVWhhTzJ3aVhPSjUzcmdD?=
 =?utf-8?B?N3ZxTC9wWU9ua2x3Y0dLeUo4NEJwR3pzWmJUQkRENGNYTlJjQ1lCUDhBU3BG?=
 =?utf-8?B?N1pCck1QOWZwWVE0VlBCYTVzMnJDOFV4NDc2aGYwbWl2Mjhxd1hEM2lMVXhI?=
 =?utf-8?B?cE8yam5YdTNVMytZeGpWWVI4UExNdDhaMjdZV1B3VnBydXRMaW9ZZ1JXQkgy?=
 =?utf-8?B?NUhYbXBqbGZkVGpySzBTWjJpUEZDT0g4RjdVeVVRLzcrMEp1TmpMSkQ0RUpC?=
 =?utf-8?B?WFpaTkY3WTIvTTdHVE9IZmtjM0RPRGNkQTFVVlZHbnM5cGpqT3pHL3hrb1d5?=
 =?utf-8?B?bFJVa3dVWlA2L0tNVzh5d2p4RTcvajV6RE1uWDNHTkZaTEVZUDl6NGxYWm5p?=
 =?utf-8?B?cGZBVTlhRFBaZUFYcUlRVVJlOHFaR2pNTjIzSkxxMzgwL2tDYjY4ZG9aR1JV?=
 =?utf-8?B?UFVOdko1RVpHZ3FXaW1xNTlnNEx3dUE1K2NyOXJsN3p1alV3ODdKaTNJRUx5?=
 =?utf-8?B?dXMxREhLeWFjS3B6SkVzM0RlWE8wcGl0ZGIzaWZlcUllOUFoMlJRanpTc0lG?=
 =?utf-8?B?d0hjQTV2Q05LaVRpdDdLUnFsK1B2eHYvbytQZFp6VlErS21za3dBcGUxQWQr?=
 =?utf-8?B?ZmUyMlBSSnlMQmtMSEJoS0prUENEMUIyMG9KN2xQREJUcWNhSk0yRjRUT2JX?=
 =?utf-8?B?Z2NndGhJdHpkVUJ3Q0Q3YlVYc3RXVmtBZ1g0YXJSdmtlcEMyMlB0T1pCUHAv?=
 =?utf-8?B?SW1hN2VrK01rZ0psNXVrdW9zckh0ekJqZkdwNWZmejJEbjN5UU1oRkl4aVBj?=
 =?utf-8?B?UzFJUXU5S3lWaGxXMmE3SzZiR2R2TDRobmJqWEZLQWx5cWtHNTVVc0NQc1N5?=
 =?utf-8?B?YTlpdXJNUGY1cHFYNzdGdHhwd1VJeEwvU09INmNOODIzQnF4V0s4bHRaMkhp?=
 =?utf-8?B?cTRNLzloU2JaZ0kxcHhUZlBNaWNsbVMwbk1QeDU5WUFtVEtlWlFCeGlVdDZS?=
 =?utf-8?B?aCtOVE1ZbnErRnM0R01Jd01WeWY2NktRandTMVl4RUdWU1hHbDMrLzlnaUM3?=
 =?utf-8?B?TkE3VHJsWlJTUTVoQlo4QkphN0lHWWRjMUYyK1VHNlk1Z0lDY0IvMHJTUjBl?=
 =?utf-8?B?a1J1dEZKVFh2d3JKK2t4TXJDZGRoQnh0U21ja0dzS2dOWFVnSTQ4Vy9xQ1Zn?=
 =?utf-8?B?MXMyd01iNStka0J3RlFOdGxHdms5Y3Y0SGFjV29IQUtsK053SUV0V2RRdjYx?=
 =?utf-8?B?N3JycmV2Zlk3NG5FVldtNGRUaHZqbk56OVdrbEgrT2diR3BwQlpJSklrWEZ1?=
 =?utf-8?B?NVBSUmc2OEdVTkxkSXJrOGRiSUsrMjNYMU9FVDFBRjdsbEY3ZUp2UzRCNzFk?=
 =?utf-8?B?QVZWWDgwOS9tRzB0VXFEQllhcUNDc0kyVEVreTJ4VjFvUDlKNnZGMnhKZFFt?=
 =?utf-8?B?a2Jpam92UG5udjNmMS9BQVhOUGZETzcyRlk3eHpZRG52VmM4YU51aXVBME0w?=
 =?utf-8?Q?W/f9wEeGCel+krkAmXFxzKUi7pmoBHR6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnFlT2lCNFpxV2JWekJZRjV4akxFK0REcGMvU0c1WHljTGF4ai96dU14VDUr?=
 =?utf-8?B?Q05MbjFFbHJkSFNhcy85dHYxL2h0WnZGQjN2bk05RDVleFM1ZnB5U0pWVXov?=
 =?utf-8?B?NFI4VDlpbHl4NFNoRVZRMnBkdVVtcVpLSmN5OEtsTk44U3NUSlBBQ1ZxVEtp?=
 =?utf-8?B?aW5lalNEU0Nramo1SWduYktLYjZuNEFrRktPUDdCN0xUbTZMbjZXTFlzNm5M?=
 =?utf-8?B?SDNycjl3R29OZmsrYmRsQXovVFBibE56amlyamRjRmwrdnBVUGtFWW4xTEsv?=
 =?utf-8?B?SFd2S0ZlVHJtOGcxS0JXUUZ2UGE0Ty9kd1RmaUk1MFZsNHpmVHJNa3BKRkRw?=
 =?utf-8?B?ZkNiMWlLQXhndE1PWHE5QTBqRkhKVk9uY3F3NUg2bDV1bFFkWlI4SFdqRkx4?=
 =?utf-8?B?ZHVQK2dpVlhXeGZGbExpZktDTzRiS3Q3L3J5Q2dJbGlvUkZEYzVEbkh6aGMz?=
 =?utf-8?B?YkkzNkFKekt0eCtpbWl5ZEp4TmI0dHhqQ3Z1Q1JDUTQwTkZqZC8zTzgwQ01H?=
 =?utf-8?B?UmhwS0ZMSkxXME9GeHFyYkUxWm1pTmVaVGJhUVJwTDcyREdYVEtSd3VMMkhn?=
 =?utf-8?B?U09GNUZISE4zeGRUSFYvdHZwenR0N0MydXpVa0RhbStRM0QrK252REZXKzhv?=
 =?utf-8?B?R2ZRWDhXZVl3WTJYT1hHRDN6dHExamIvNDJXKy9FUUZ2VEFtOG5VQ0tuaFdQ?=
 =?utf-8?B?V1FGL3lzQWZnSmwxV1B0UUNweTRKN2h1b28wbE5GVEJKY25tbDZtQkd1K1RP?=
 =?utf-8?B?QWF1MFJDdmovMG9kS090V05CWGw1RFlWUXUxcCtwVWRaaFllaDFqZFgza1Z4?=
 =?utf-8?B?L1B6TThHTWhsQVJqVm5ocVB1WlNiVUxyNUZrWGJBRjBQclRIZGxJYmpVazNS?=
 =?utf-8?B?YWtqTnFlOGdkQnk0eUl2N3IyV0s0RXo1SzBQMlFMWmFuSlNnQUdZUUc3Z1lo?=
 =?utf-8?B?bzIwelgzTmZySnR0aXEyU3RRNkl2Um92eU16bVNXalFLQlM5WG4rcm9zOU1S?=
 =?utf-8?B?dEI3R1dJbUR5RUZDWlEzcFVYc2dIVkV0Q0Irc0JQWVFpakFET0Yvd0xWb0dp?=
 =?utf-8?B?dnNXcThEZ3ZuUkRlVGlaTDIwK25Xc0NWV2ZxSzl5R0g3SEhnd1RndXppa1c1?=
 =?utf-8?B?dVE1eFhjT2dBVTlFUHl0alQxOWNoL3lvOGFmc0U4ZndBOGFVK284YUYrbWk5?=
 =?utf-8?B?dnFUS0RQTlRjWU4wVFFqZnZUUkVTRThNOUFkZkNGR0NrdjQrckpBREJzRkdL?=
 =?utf-8?B?L0h1VEp6Mjh2bkY5c1ZidHViNU9lWUZ0K0xjb3kya09lQzcrTVo0UWsxNTlS?=
 =?utf-8?B?Y2lZWklQTk5rbzk3WFdhUHVjSDRKRm9BRWVKRzlBVlhRUitmS2xaaFBhcTYx?=
 =?utf-8?B?SGQ3WEh0VUE5OEd1bTh2VHY1Y01UMEw5S1ZXS1JVc1JSNEk4eFFLVEljZXN0?=
 =?utf-8?B?STlkZ1hDNXVjUlRScEs5bnlnRXJZa1FHRm1Oazd3cEc1aDhxZkdYTlc2ODNu?=
 =?utf-8?B?WnNxNEdZYlNmQ2NjR1JGSkhwc0lBMytuRjNvcnJ2a28wK2tCL1hScmtSOWcv?=
 =?utf-8?B?WnVGaWg0OVdib2xDY1hWV1J5VTQ5VmJaOGI4Q2tCSGxkSERGYytpMU5CaFhH?=
 =?utf-8?B?Sjl0VW1OTkhUQ2NDcUJjbHIxd2tzK01xSEVyZE1jNEVxbEVDU3NLWW15SlQv?=
 =?utf-8?B?cnNic01aMWd5SEpRNDcvdWcxL3NSTnE0dk5VZVZ1YXZmTUZnK0tVcHVjaEU1?=
 =?utf-8?B?YkRnWldsc2wvclNXa2dBcGRDUTl3VFhaMkNrdGc4OHVsV2pKM3RLdDBRenAv?=
 =?utf-8?B?SUhyNlVKMTdKOGN4RG8yM2o3V1dNWm9lenBGY2tZdml2V1E0d1d4MWR3R1Bs?=
 =?utf-8?B?cm5ZZGNJU1pNVk9Mb21EUUV6bWtQUDNET2Nzc3dRbFhBMlJHaWJ3eTcxN09B?=
 =?utf-8?B?RWZYVnBqMjVUZmRucjE3WGVUaHdjMVNFcmNFalB0NWVCZ2x4cnRLZFQxWGo3?=
 =?utf-8?B?VGVzOVFvNEtsY091V0tHOXFQeXJGNjlYdDNJRzRIeThmcFI2eDJIc1FDWXZN?=
 =?utf-8?B?U1BsT1FzTzY3WEJHTW5qcGovSUJkODNaUHlQV1Nrb3ZYVHUxeXpTV0xMelBm?=
 =?utf-8?Q?+/+yWAUwQBxU4Jrdi3iixaI+g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28484271-67f1-4d20-797f-08de1d82aca3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 22:20:21.4440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tD333C7SvHm4OZb4ingw13mMkSFZmGEnciyG1eWTj+TSohf4eS8R1K5bfK3m29J2CqK9u+tqj2ytA2Qzoy8UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFB8FBD73EA
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

On 11/6/25 1:42 PM, Danilo Krummrich wrote:
> On 11/6/25 3:41 PM, Timur Tabi wrote:
>> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
>>> -use crate::gpu::{Architecture, Chipset};
>>> +use crate::gpu::{
>>> +    Architecture,
>>> +    Chipset, //
>>> +};
>>
>> I don't think this change should be part of this patch.
> 
> I think it would be good to send a patch converting nova-core (and nova-drm) to
> kernel vertical import style at once and then rebase other patches on top of that.

Yes...thinking out loud, our fiercest merge/rebase conflicts lately
are not due to "use" statements, but other, more difficult items.

I'm thinking we can either do it, before or after the big pending
set of patches that have been posted so far, probably.

thanks,
John Hubbard

