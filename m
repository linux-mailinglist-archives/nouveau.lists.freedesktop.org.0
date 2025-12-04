Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9210DCA2B31
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 08:55:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64B410E1BD;
	Thu,  4 Dec 2025 07:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eWNyjtCM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B9610E1BD
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 07:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I8mlbMvZ2MLZMGEZmOZy0JTPbMSbhpKXwMYxz68Q+oUP6KnNyUQsraxjTm/agDvzrFyj5zH0CC90CT9y46W0FMcIWxgDJbNNmDSTrU7/q3nxbSu35dHiOYUX+cmx1xmbEKK2ZjNzXEcUhORSgY9/vB7URTuMq5PbRBxi+ESUDeaNDtj4Yy9In2H3vm4znOFch0e7CorejemvEShOAv7expxV2x3ANweBASoiLXv64UOtCfDCAs8T2LuRtNEz303CAbfhNqU9bXVQVegGlck/PjOO9V+20kMKnSLvOEcm7bZUikGYaL1/LH4RFk59U3werhh+T/JtP1r217xzjKiC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSx303C9gWgwViMjfgAwdaP/BzZvhNcncpgvV11qT5g=;
 b=Jm/gCac76FwabxR284nZqTZw4qG3HDeXjB/Jo8XZvo2gg2ueEtJyRgeEdbnTC8EDLqU/GvXCusjMpcsV7+bJI6LF3jZ8udiatVoeqZrnJIFPSUQMhdqgkWY5rqD9sVLAJeBjPW0rZdJ58CArU3jrwI3dKPMcL3zhQb4s63fNXjUzxs12BVYkATmcn/lQmE/cMiA717AX35YgnnUR48B0LE162j4foiUbjXHXFz+DSEVm5y0u9+g/1DV6BEPW3l93dLamW1sxJwGakcgfY2MtCaK6ohl/zXkrMNuQzVDjTyAgeRd82IRXcvwSOLNITIzIT4hkF2F4NYnBZ5VvM98oGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSx303C9gWgwViMjfgAwdaP/BzZvhNcncpgvV11qT5g=;
 b=eWNyjtCMeoGTW9hbAe4L+ZqqzmlLOXxpIxOMFk1ITDVL9k5IUtXGg9buWMRUY8z1hT3jU1XGhAeuO8DyuhexUAGs83U6gl8VHHG557NboSLVYra0d6JWOQ1igvQ14a3iBFvKqaUKuKax/VpPO8dAIJcVMQLOPWnuCv06iGwGq/8eKTdeOHWryvgmLLCvI8QyLFM1vo3d/hixOFuhHCBMKYaMQqIYELu2uAehnFIUcDbgJazcw3XS5qdLSMDiZsPKUfIgw2vn7uNXiXe8cX4otskL1Un5a5QHwiSnNaARVkQYz8obWuL+5jAiZNeoyz8o7Qq2LbWWvGicWnMuPPzlAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFD91879A44.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 07:55:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:55:15 +0000
Message-ID: <f73512e9-085c-4cb3-be23-325c69ec85dc@nvidia.com>
Date: Wed, 3 Dec 2025 23:55:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/31] gpu: nova-core: Hopper/Blackwell: add FMC signature
 extraction
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
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-22-jhubbard@nvidia.com>
 <b9188e96-9ffa-4815-ab22-735e2506fe93@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <b9188e96-9ffa-4815-ab22-735e2506fe93@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFD91879A44:EE_
X-MS-Office365-Filtering-Correlation-Id: 90ce9d16-24d5-4d47-423f-08de330a75c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEVoa0JoK3VCVHhobmo2cTl4NU9LR1lOaGRMZ1pLR2ordklVNzk4ZWUzZjBP?=
 =?utf-8?B?MGd6eVV5VTVRQmdlSjhmZGVIWTNnR3BwZDQ0K1ErUGw0YjFlNlJId3M4N1NT?=
 =?utf-8?B?YkovcWV1S1BkekhHWTVSYmFtdndBQW0yYXQxVnVoRGJaaEFUR1VIazV5K1NX?=
 =?utf-8?B?L0lOT2pXTmJEeGlGN09tWGd0bVVFeFR0eFB0TlFtanNubXh0VjhtN0JZR2VH?=
 =?utf-8?B?RXhwM0ZtenRwQ0J4M3V6Tm9zZ0hORWZiS09UUnRNcDRXYmZLMEE4Z0QxSElJ?=
 =?utf-8?B?cVdtaHNHcWNvWGgwNXZJaFVxTFJOVDFsNGk5YmdiQ3BoL1l2NHJaUlNiYWlL?=
 =?utf-8?B?dG5Nb0E5NGx5aW9nN1NkdW05MlAybTVwSFZldHVlbFg2ZDM3SnZhSzExZXVo?=
 =?utf-8?B?SHAvRXpQUlNuSzFDMGoxOFhHSEd3S1VsWkFnditDK0o1NlJnb2xVRm90cU5q?=
 =?utf-8?B?TDFSdlovQmNoZ25OL0FLalc2RG4xaU52ems3R1ZuRHVXQnZyOURBNWRSbW9W?=
 =?utf-8?B?MVQyajBWNk0vcXhPVEZaOFF0RGRkZlpNM2tPM3NpdmtLc1ZYeDRXeTVnS3hO?=
 =?utf-8?B?Q3JWWGJSY1BkT1RZWEkxVFdkeW8yTE9MOWxWdTRId3FQb1ZNY3dpMlBsbysv?=
 =?utf-8?B?UXBjSUdoTjZoOWw3c1FDMzNQcVRNOWF4Ni9OcjdmZjI4ZlIxTDVUU1BjUzZ3?=
 =?utf-8?B?ajJ4eUpzMjdsZDN5UDVBYVFlK1VJOVdVd01mNVFwSEYzNDQ5MzZvQkRJeE5i?=
 =?utf-8?B?dE40SDBiY3crRG9RaUt5T2Q1c2tqZzFNUzZqajBzOFhaM3F6MVM0MzlyK29o?=
 =?utf-8?B?VEh4V3UwcUlya2MvS3dXT0ZDTTFNNHVYYVNleUdrSWlSbHhkM2ZibzkxU0pE?=
 =?utf-8?B?Vjc2Q1VSYW5mTENacWlzOWRrYkxjUHdrL1c4WVB0aU92Y3VSaktBQnpqMCs5?=
 =?utf-8?B?aFBCSWVxejZmdlRiT3F1VHZOeVU3MVhIUkxZT0JucGk3Wi9TWTllTDlRVTMw?=
 =?utf-8?B?TUpOR09TWUZiZmhkT05pM2p1eXpwdmZpRGtYNU9wNmFTbmRaL0NoOEhCa0NF?=
 =?utf-8?B?NGw0RGhGMmdxWjVVMkNwbmxnMlI4NEpGNVVTSEVpb1VSUjlIblduTmpuTU5U?=
 =?utf-8?B?cWFtRnI4NmxKOUNld2k5SzFBYytTVk1TcTIzTXBwbExnaHMrODlwV0t0elk0?=
 =?utf-8?B?WG5Ndk9vQ1l0VmdidVhXaUlWOG05R0FROHQ2cmVEM3hvM2lYdU9mbGR5ZXE2?=
 =?utf-8?B?QmMwUXUrYU1mcldiLzJwVG5ONHRrd01QdURLWmlLd1N4TkN6U0VRUWhpWDJO?=
 =?utf-8?B?elMyTysrcU5WK2lBQmF6d05BTUEzYXB2UU5ZOTVoLzUzM3hZZzI3L0JDMGw0?=
 =?utf-8?B?TjBTYjBRc3dBYVlZU1NtaVVaaWZ6aTQ0cjQxVHNLcUIzaFZya3J2ZWFhdDlu?=
 =?utf-8?B?L3hFY2dPR2xHekNabmluajZ2Smc1TnZ5dkVRYU1jTDBWK2E4MlptSXYybHFz?=
 =?utf-8?B?TWJENFFObUM4M3pZQmUrZ0VrV0NNT3h3aDJrS05kMndXQ2pDWGNYNWJRRWNq?=
 =?utf-8?B?SU5BYlI2Nmxyb3dNcnVqclJCUTBxSlNNM09WQk84WVQxNVl5amw4SVljdVVL?=
 =?utf-8?B?ZFRMUlBxTGRXSjV4NW9CSHo1elA4TGZESW11cnNSbHU1b09IWHdQbDRhajlq?=
 =?utf-8?B?T2xDTlFRa1JvSlh2dmRWdUpjZ2lGdTlpamxaa3U0T2YxK3BTbURTeGkrd2M4?=
 =?utf-8?B?TjVucC8wRmdQQ0xYR3M1ZlJDMWtNbmp3aVRWK3dWVEZUUDFRa2VNZWkzZkFP?=
 =?utf-8?B?ZDh2Y0E3QmdQNjZlTisyVUJRV3BPZEkrWnBydncrVUpIRlp3cHFtcFlIcGxM?=
 =?utf-8?B?Z2J2Ynd6V2JXemsxRHlFemxOdE84UHJOQnZHbHJGWEdxYlFoMnlGU0NEaWIw?=
 =?utf-8?B?dEtzMWxMUDQ0czVQT2s5K242bWhwT0VTUC9JeE1HVlJVUlhkTkhyeVBOR25T?=
 =?utf-8?B?TXBCYTVBRnB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZmaWJ2aS9IZ2xYakhNOGpsVDVWZkwrc0oyQ3Zpc2Y1amMzZEQzSkV3ZTI0?=
 =?utf-8?B?WnVjOTFwdUVldzlJNnlBV1hqODFjVkxnRnh6YzJ6dGVSL2JncDY4enhvOS9Z?=
 =?utf-8?B?ZHlUVTFYdWtQTFVrcFJwRkhmNEltdVBXaUxVYVFiR0FYdTJ2anF3ZEFHZU95?=
 =?utf-8?B?bGdRdVVRNTU4Z3duQzREY28zL2p0NG1ZYVhVNncwU1l0SEtDTksySFY5azMx?=
 =?utf-8?B?am0rZ2lmWUZ4SGNsU0RnWVdMQ2FITFZZLzRnYktpOElkeVVwQkhMckcyb1Zy?=
 =?utf-8?B?SENJWWkwTmpFL1FDWjA1RGlmT1FTQWdBUHFYOW5sOXUyRkpDUmRZdE1sZmNO?=
 =?utf-8?B?RkkyQ2ozU2EwRW1DNGlDZkZjWlhBYTFmckcvTmNiMHhjdW0wcUY0cjR5Smkr?=
 =?utf-8?B?N1VjYUE4MVpwVVcvSmhDQTNiR05mQXErNlRxWG1HU3RZSkpYbXRkQnZuc0dM?=
 =?utf-8?B?SGxqSjlnQ09kcWlqUzlSZ1BkQVZVYUIyVlpHWDlDMUJrTkQ1VElKZzVMU3VC?=
 =?utf-8?B?RGJ1NENLVm9CTi9Sb25IamU4eDRIZytYdFVIaXcyNmRjeUxPVDZ5ZFlkc3g2?=
 =?utf-8?B?MkEyN0hrd0lKc2Z5NDdUbnlCSTBvWmVxY1NhTDFPUEZZblpQcERKTFZzb1o3?=
 =?utf-8?B?QmJKaUFBbVpuTUNNZzRzYmVsL0U1ak5td0FBbGcwK2dTOUQrNFBjU2c4Tkhj?=
 =?utf-8?B?MFNHVitlVjRYNGN1NzFEckFNbk13MENXRkQwTnZsaTNGK2RrS2dWNU0wWGxV?=
 =?utf-8?B?Z3hRSGI5TUNVOTNNOTExNXRiMGJYKy9BUWl3VnJNTC9CMGhUeFlCM09FMGZH?=
 =?utf-8?B?R3I3dUwwWjlCWkhlZjd3REQ0MTk1clRKWHduT25xazcyeUdJZmpCMFQ2Qy9u?=
 =?utf-8?B?c2VObTJwUjFLcFplM1VET2VRa3FJR3lONlpLYnZGWi9DYWJWWWNYdDhPcG9Q?=
 =?utf-8?B?ejhXZG1KemNpamNqMGdpNTlYTWZKUG9lNDFEUWl6bmF0aHJPUTlNaTFtUitF?=
 =?utf-8?B?bjE3VnBZdmFiWEEvTmRTNSs5cmsxeFhEbHBKT1JzRFZLNFFXUmZFWThHWVhp?=
 =?utf-8?B?Z3NWUGxmK0M1V3l2eXp3UFIyakNKaWxnMHhXMjlYN2FWRm5raW1ON2xvQmo1?=
 =?utf-8?B?T1VpTnFYVUtkMFlObitPQnBzZXc4amVvSk5xTVFsaEYvbDlwS0ljNXIyQUI4?=
 =?utf-8?B?VUg5NElNMm1tQjNYUmtiSUxONE5lM1lGbmFZWWVINUZqU01OOEtkam1MUUVn?=
 =?utf-8?B?WTRlelZNb01HU2xFanhjYTlqN0EySjBLamVEQVpyU0NwM2FnWnB3SlZGUFZO?=
 =?utf-8?B?YlIySDZCVlNQbWNjZFl4aUY3VXcrV0RaMDZDdmtUdndjdHRNOWhWR3BocG5H?=
 =?utf-8?B?WVQycE5Sd1pKZ0FHblhIUmNjS1ZtOGdOMW9zZ1NybDhOKzdZRFFJb09ENFdt?=
 =?utf-8?B?TGp4c1Z1Ulc4ajFNQlNwL0p6U1NzUEpVNi9nWjFVZUdoMGtBUVNhSTA0dEhh?=
 =?utf-8?B?dS9rT3pLSVR4WGJvTlZaTEhtcUJjY3M4dktPMHI1eEZCNW8rZjBSK0YwUFZx?=
 =?utf-8?B?SGFVV0c1VTcxTmJLMWh0RCtMcWRMK1JJNUY5RDZvUU95M2NIdVNEYVVkaHBI?=
 =?utf-8?B?QXVNZlNvbmFhWm5LMEtRYzhmMURFMzhTRzR0clBIT3hySFBFZEpxSHFwZU0z?=
 =?utf-8?B?T3NJeDhTWXlsUkcyT3pxV3gzVUdEa2VJeWdLVHNGWUVESHZEd3RFUG9HaGdN?=
 =?utf-8?B?K0hwWVBNUlI4SUVxZFFGdlFkTEQ5cTA0SjQzbURRamVJdzZQYlUxcitRd3VG?=
 =?utf-8?B?djYxaXUzSXFLYkw3SG1FdldTNVBRRHZXY1lpcS8vbEszeVRzZ2dxRHZ2MVlN?=
 =?utf-8?B?Um1DU3RRNGNONkdoL2JVYjFqQVh4dmY4TXE4Um1XTnFOa0RXNVZhcnlScnZZ?=
 =?utf-8?B?dUQ4cXdaNzU1cnNrcjVQSDhoYTJjVDlpNkY1Vys2MStzZzVYZlhjY3VKM2xo?=
 =?utf-8?B?cDZnaXRBV0tJaHdIeHhWQ1JrRGF2MlF3UDNweHpzcGdLQUlUY1hJeS9YUmN3?=
 =?utf-8?B?MnpCdjYyOHBWaWZPMzU0VnNRNnkzZlFKVldsUk1DMlBYcFZ3b2tzNGJISGhN?=
 =?utf-8?B?RlFTSE5MNmlJdGU4NzNXRisrNjdFL0I1a0hmM0RiMklMUkRMb0JaVFNKZ0l4?=
 =?utf-8?B?clE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ce9d16-24d5-4d47-423f-08de330a75c5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:55:15.3400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKhOQWQIW9eUezMRzLreomogJi44dUmaU3v3RRH6McTcqu+8Y0/paMxxbtKQe3RmLHUdSU34dZyIyQbSLId/Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFD91879A44
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

On 12/3/25 7:45 AM, Joel Fernandes wrote:
> Hi John,
> 
> On 12/3/2025 12:59 AM, John Hubbard wrote:
>> Add extract_fmc_signatures_static() to parse cryptographic signatures
>> from FMC ELF firmware sections. This extracts the SHA-384 hash, RSA
>> public key, and signature needed for Chain of Trust verification.
>>
>> Also exposes the elf_section() helper from firmware.rs for use by FSP.
>>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>   drivers/gpu/nova-core/firmware.rs |   4 +-
>>   drivers/gpu/nova-core/fsp.rs      | 104 ++++++++++++++++++++++++++++++
>>   2 files changed, 107 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
>> index 5cbb8be7434f..7f8d62f9ceba 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -23,6 +23,8 @@
>>       },
>>   };
>>   
>> +pub(crate) use elf::elf_section;
>> +
>>   pub(crate) mod booter;
>>   pub(crate) mod fsp;
>>   pub(crate) mod fwsec;
>> @@ -419,7 +421,7 @@ fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
>>       }
>>   
>>       /// Automatically detects ELF32 vs ELF64 based on the ELF header.
>> -    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
>> +    pub(crate) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
>>           // Check ELF magic.
>>           if elf.len() < 5 || elf.get(0..4)? != b"\x7fELF" {
>>               return None;
>> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
>> index 389c43bfd538..311b6d4c6011 100644
>> --- a/drivers/gpu/nova-core/fsp.rs
>> +++ b/drivers/gpu/nova-core/fsp.rs
>> @@ -256,4 +256,108 @@ pub(crate) fn wait_secure_boot(
>>           })
>>           .map(|_| ())
>>       }
>> +
>> +    /// Extract FMC firmware signatures for Chain of Trust verification.
>> +    ///
>> +    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
>> +    /// Returns signatures in a heap-allocated structure to prevent stack overflow.
>> +    pub(crate) fn extract_fmc_signatures_static(
>> +        dev: &device::Device<device::Bound>,
>> +        fmc_fw_data: &[u8],
>> +    ) -> Result<KBox<FmcSignatures>> {
>> +        dev_dbg!(dev, "FMC firmware size: {} bytes\n", fmc_fw_data.len());
> 
> Let us remove these? I think we discussed [1] that once things are working, we'd
> not want these and can add it on-demand if needed.

Yes, absolutely. Thanks for checking on this, I was having trouble
drawing the line at the right amount of output--I'm sure there is
still too much, now that you point it out.

> 
> [1] https://lore.kernel.org/all/d6c9c7f2-098e-4b55-b754-4287b698fc1c@nvidia.com/
> 
>> +
>> +        // Extract hash section (SHA-384)
>> +        let hash_section = crate::firmware::elf_section(fmc_fw_data, "hash")
>> +            .ok_or(EINVAL)
>> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'hash' section\n"))?;
>> +
>> +        // Extract public key section (RSA public key)
>> +        let pkey_section = crate::firmware::elf_section(fmc_fw_data, "publickey")
>> +            .ok_or(EINVAL)
>> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'publickey' section\n"))?;
>> +
>> +        // Extract signature section (RSA signature)
>> +        let sig_section = crate::firmware::elf_section(fmc_fw_data, "signature")
>> +            .ok_or(EINVAL)
>> +            .inspect_err(|_| dev_err!(dev, "FMC firmware missing 'signature' section\n"))?;
>> +
>> +        dev_dbg!(
>> +            dev,
>> +            "FMC ELF sections: hash={} bytes, pkey={} bytes, sig={} bytes\n",
>> +            hash_section.len(),
>> +            pkey_section.len(),
>> +            sig_section.len()
>> +        );
>> +
> 
> Here as well.

Yes.

> 
>> +        // Validate section sizes - hash must be exactly 48 bytes
>> +        if hash_section.len() != FSP_HASH_SIZE {
>> +            dev_err!(
>> +                dev,
>> +                "FMC hash section size {} != expected {}\n",
>> +                hash_section.len(),
>> +                FSP_HASH_SIZE
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Public key and signature can be smaller than the fixed array sizes
>> +        if pkey_section.len() > FSP_PKEY_SIZE * 4 {
>> +            dev_err!(
>> +                dev,
>> +                "FMC publickey section size {} > maximum {}\n",
>> +                pkey_section.len(),
>> +                FSP_PKEY_SIZE * 4
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        if sig_section.len() > FSP_SIG_SIZE * 4 {
>> +            dev_err!(
>> +                dev,
>> +                "FMC signature section size {} > maximum {}\n",
>> +                sig_section.len(),
>> +                FSP_SIG_SIZE * 4
>> +            );
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // Allocate signature structure on heap to avoid stack overflow
>> +        let mut signatures = KBox::new(FmcSignatures::default(), GFP_KERNEL)?;
>> +
>> +        // Copy hash section directly as bytes (48 bytes exactly)
>> +        // SAFETY: hash384 is a [u32; 12] array (48 bytes), and we create a byte slice of
>> +        // exactly FSP_HASH_SIZE (48) bytes. The pointer is valid and properly aligned.
>> +        let hash_bytes = unsafe {
>> +            core::slice::from_raw_parts_mut(
>> +                signatures.hash384.as_mut_ptr().cast::<u8>(),
>> +                FSP_HASH_SIZE,
>> +            )
>> +        };
>> +        hash_bytes.copy_from_slice(hash_section);
>> +
>> +        // Copy public key section (up to 388 bytes, zero-padded)
>> +        // SAFETY: public_key is a [u32; 96] array (384 bytes), and we create a byte slice of
>> +        // FSP_PKEY_SIZE * 4 bytes. The pointer is valid and properly aligned.
>> +        let pkey_bytes = unsafe {
>> +            core::slice::from_raw_parts_mut(
>> +                signatures.public_key.as_mut_ptr().cast::<u8>(),
>> +                FSP_PKEY_SIZE * 4,
>> +            )
>> +        };
>> +        pkey_bytes[..pkey_section.len()].copy_from_slice(pkey_section);
> 
> Even if this works in practice, I believe it's UB as the `from_raw_parts_mut()`
> should have the entire slice range to be valid memory (see [2]), but
> FSP_PKEY_SIZE * 4 is 388 bytes while public_key is only 384 bytes ([u32; 96]).
> This is vulnerable as the KBox holding the signature may not have the extra
> space even if it does now.
> 
> Can we create a slice with exactly the bytes we need? something like:
> let pkey_bytes = unsafe {
>      core::slice::from_raw_parts_mut(
>          signatures.public_key.as_mut_ptr().cast::<u8>(),
>          pkey_section.len(),
>      )
> };
> pkey_bytes.copy_from_slice(pkey_section);
> 
> Another reason for doing this is, the code is more fragile left as is, as there
> is a risk of unrelated memory leaking into the slice and accessed by new/future
> code.

Sure, I'll go in this direction, thanks for spotting that.


thanks,
-- 
John Hubbard

> 
> [2] "Behavior is undefined if any of the following conditions are violated"
> https://doc.rust-lang.org/std/slice/fn.from_raw_parts_mut.html
> 
> thanks,
> 
>   - Joel
> 
>> +
>> +        // Copy signature section (up to 384 bytes, zero-padded)
>> +        // SAFETY: signature is a [u32; 96] array (384 bytes), and we create a byte slice of
>> +        // FSP_SIG_SIZE * 4 bytes. The pointer is valid and properly aligned.
>> +        let sig_bytes = unsafe {
>> +            core::slice::from_raw_parts_mut(
>> +                signatures.signature.as_mut_ptr().cast::<u8>(),
>> +                FSP_SIG_SIZE * 4,
>> +            )
>> +        };
>> +        sig_bytes[..sig_section.len()].copy_from_slice(sig_section);
>> +
>> +        Ok(signatures)
>> +    }
>>   }
> 


