Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71584C5FB19
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 01:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F4A10EC98;
	Sat, 15 Nov 2025 00:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O8ReZ0cM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CE610EC98;
 Sat, 15 Nov 2025 00:11:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThnyTIknC34s2b/trtxXkvjHj1V8ZotTzs7LMeQ6gagPR9atBAxUyKRLkqhCTQDqFAenAiTSaj74962VTuHU/nPGe3NK4gWzY02Un9L0UVrvAcrpuFydX/dLc0vGgMy+1UZX0+gEh5rLzZm01EzuLYHaixb+fXLEMH7E+hqZ3SOYv9/Bqva8Dp3PvWgbJAIQQ7qXzJjnpoS+S+JCVj3SuEP3ULtemxQJWA8LtAO8ZQ6l3mTg+1OZ/3De/6NG16suyiZ4OUdWL/psaHrJUfj1HC6X7msOozFm29Vzb9/jO3dIVIFHnh6q5fOAn+b8IxqXP/lBJVnGeS/J4wN1keq0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5gPUziWEfITRW72/iAmotGw8vwyltQ3X52rTUQe7lA=;
 b=vXTEhhYTA1bo71N831qI59W4z4kHHv9mWD8syifzVqkpcdNW7yjc6Ltl+Dci6N3yWQrZBWGx8xInPog/ENZWMwy1NPY7QQru5nqAtwUMWmPGaFKlNw1Um2irYGVp6Bcsk8k5K/zEmlVNFtwOUCpVrNhoR5FL/EqCmWTWKzAjXFHA4aSmxEgI4SHHWSGJ4n6OxOc62ap0BRBzt5nuHj7kzHCXoL6Lg8x5XP4+QoMITQa1GKYxEs0nfMXP3ndLq6QhSkugtyMV1CugEJByp3Pbo5J71y08D2eTtZXJmMGUpuSncW2zWiVEFy7/+mPccytngyA8AcuKPgYBSEbHqNplPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5gPUziWEfITRW72/iAmotGw8vwyltQ3X52rTUQe7lA=;
 b=O8ReZ0cM2Bk76f1Atke/CvBKk/JgMugNEroTmu4/3VWNl6yBiqlZWq5LMSfmZeZ7jAdAT7t1Jm+zecbqqYUy43NKtZ/wonLYwBGPnqBLrmFBaMjqh1rotFdg93BXBmgHgCSi9/2kCX4ZkI0Phx2pj1N46TLv9hv5BQ2f78vSTDeply9lRC8b8BvMMg2HMG8GAYgPuAq2QVWd+row9PmmBTATFGY1+q0jixdKCEMgsZnl5WKlqWpjfuCtBcDvbPQUwuKqCxlpEiErOPDoYgSv9+xlfuMZ/mmUdxJTgAcnw+ns8SRypzIUZWqiocxBcPqcJekLy5p+k4ve941YCKJq/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB6801.namprd12.prod.outlook.com (2603:10b6:303:1e8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Sat, 15 Nov 2025 00:11:13 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Sat, 15 Nov 2025
 00:11:13 +0000
Message-ID: <5db58446-f79e-4674-8cea-9f31034adfca@nvidia.com>
Date: Fri, 14 Nov 2025 16:10:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/6] gpu: nova-core: add boot42 support for next-gen
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
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-6-jhubbard@nvidia.com>
 <DE8H17HDS2CL.2PKRL4FNPAXDJ@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE8H17HDS2CL.2PKRL4FNPAXDJ@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB6801:EE_
X-MS-Office365-Filtering-Correlation-Id: d818c4f9-c7ff-4462-2d36-08de23db7cbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2RPYjB6ZUZhUU9WbDllOGFsWkMzVDMrS0lZYStIQUJMQW5IWS9kcmpvWWpI?=
 =?utf-8?B?VGhvYm1nTFI1TUdNYWs1a0ZSSUhST2g0OFBibGxReS9oTjZPb2xRQmVIcDJQ?=
 =?utf-8?B?akx2TlNkcm5IRE0wSDBPdi9HY2cwNEZRdE9Hc1M3L0M3b0dyOUdaWHpDQlFw?=
 =?utf-8?B?RExiNU04Rm5JZEVhM1V1NVlJc1J4SnJkaFJPUmhrUUxJRkl3bFMyUFNZM0J0?=
 =?utf-8?B?WjIzekxSazQ4Y000c3NKRHlQTlNwUTQyb0V0aHhPMXRsNjRUS0phVjZKSVAx?=
 =?utf-8?B?dTJjVHZRQzBDOUtpK2srTUdGcUNwTTRBZUVMY0taNnVzcUw4VVROcmV0bVhM?=
 =?utf-8?B?dlFTZ0w1T3RjVkFEaWNhRTh3L2FVZ0t2M2Y3QTdIVXVrV01pc3ZJdWYrUUVB?=
 =?utf-8?B?Y0YvQlVTRTJCd0QxVFFZNUhBVWpuZWFOKzFsYmYrNmQxRm9oY2hPdmRyUjJh?=
 =?utf-8?B?djQ2b0NKcjJQTGw1SWdvallmWjI0TnAwK1FCb0RuVHBHaXdCVXhDSm5BdzZq?=
 =?utf-8?B?aXNPZkZ4eEVuM3E2V01pcmFuYzZRenYxSDhQQWRDMi9hMkhINU1PaXgyemho?=
 =?utf-8?B?d2g4Tnpxd1Y5SklYN1dKa2FKN2FQVHpEM3VpdVVuNXB4anljeVJkSjlRY1hi?=
 =?utf-8?B?TlAydmkrc1ZlR3h6aFFXNlV0ci9UaUQ3Nk9wTGZwbW1kV1lWUm1pZkZhSXpI?=
 =?utf-8?B?Vzg0SjNsN0gzd3FxM3V0TUVYZXZuVUdHZmtGd3F1VlNBVTZFSzBEbnVSb2pP?=
 =?utf-8?B?dFh1cGxRRzBlTFVuemlkMDVKQWNaSXJCYWt3TjhWM0ZaMzhYcndUOENrSXQ1?=
 =?utf-8?B?dHpXLzhoRGY1aGwxQzViVGh5bHJERHFoaUx6YWVUbVlkTW9nSDlmdXJQaGdu?=
 =?utf-8?B?bTRNRFUrNVl3RlZ3dWdNaHVpVzg1L2dWTWlZWGhiU0piN1A4WUtsZHBRUUtj?=
 =?utf-8?B?Tk1EWHpyWmNnUTJ6ZkljTGltMGFlZE52VTc4MHBNS1NmdG5HbFgyUjB1bGpt?=
 =?utf-8?B?cXJhOXFscFFyUlhhSldjaUJ1VzUxK1F6Y0dYS0RFdmcya1krZ0ppMXRtYnpX?=
 =?utf-8?B?QnRzcCtLYXowMTkwOVdmcHdta0RlZVc3WHlZaUxvRmZCNVY1cjVaQU9XSk0x?=
 =?utf-8?B?YkwzMjZrSm9XUEZNdWFYR294T0lFS2tFWnZDWGhzVFEvaGpQa3E4WGVsZ1Ix?=
 =?utf-8?B?UkRqQzFDdU42b0kzSENFZTBZVjRWNktKemFYa2xvZUpSdWowSjA4TXFDNElJ?=
 =?utf-8?B?TDFMVy8vNzFXUEhxUkcwM1p6NFlhZmdxZ0dzR2JxNm1KaTA4WHhhcE1uaGhR?=
 =?utf-8?B?OE9GS24wUUpKQUtGelE1NXdkenhZU2hnNzBQR3RBODVvSjVSRjZVY3R4YnJI?=
 =?utf-8?B?YWdhcXUzRmpBelBQb3FYNGdhQjV0YzgvdFJ2OGtNbEFhaE5qa0VZak9mdi9n?=
 =?utf-8?B?QitJZk5Gc0RvUDd2OFh2THZuSnZ0K2R4OHhkVnk2VW15Q2RGZU0vSlUraFJM?=
 =?utf-8?B?RUs2UGFWbFBVQUxMVzBJa0ZucHdLUk1BTFEzWUw2bGlxY3VRNXlxQUVhTVhu?=
 =?utf-8?B?YjBNby9kSUN6SXRJNFdyaU0zZ2I1aVNMQklkR0M0YStzM0VzQ1N1TjFTSEJX?=
 =?utf-8?B?L0FzdWU1Q1dqU0RWbXgzc0VFOHM4aFhySVN4RDBjTmpwanJvd3lBdmdwT1Zv?=
 =?utf-8?B?V3BLL3B6ZG1PeTlaZkJyRmdkMWhCcHZ3SHZMVmJKUmtEa1FjRjlEcFl6V2NT?=
 =?utf-8?B?amFTVVRNcG5zVFNUVzNLdlU4MVdOQkJvQVg1Z0F1dFNhd0d0ZHRVWlo1S1RG?=
 =?utf-8?B?RDVBMEVGcG1saXlHSk1wcUUvVFA0K2JBdFlhYVNzLzNmQTZ2RGEvRmw3dkF3?=
 =?utf-8?B?U29CcTk3UmQ4bTllMGEvSUYyT0Y1U1VLUVFMTVV3NzFRUnZUamVBdXFWaHBB?=
 =?utf-8?Q?1FCxlxxsrngQAQ6/q49JxDkuFSvDKaq9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUxvNHI0VElsVVNaMy9sYkNUbWV3NlVnd0pwQ25UWmUrQk9ZQkFJcWRkNW9X?=
 =?utf-8?B?akJBU0tjS3AwdzNZcUE2OHg2ZWpYd1oySURaSWJvdmdENmJQMEpTUGZIclVD?=
 =?utf-8?B?SkJLY25hZDNaL05OYkZZY3JJOElwQzhrMWMyenBxWUo3M1liTXI1ZXNiQU0z?=
 =?utf-8?B?YmVPMWRxRWlHOFhXV2pHL0xkcFRRdFhPZGQzdnJLOVJmSFljL3Z3SXNtRENl?=
 =?utf-8?B?eWdIVU9YN25ZRXQzMjcvOE9oaU1EUXBXVTdXUDdQVGhoOStERDYwQ0IzSFd5?=
 =?utf-8?B?enJKbG1GT2JBbHRxR0FTaVhGY2tvV0FtZ1JJRk9SemJKc1lUK1l3OW1XVDFQ?=
 =?utf-8?B?c1hnZlRLZWVqTWthUHFrRXJoaUh4T2JyaGxyNHk4VXhXaHpsQ2hQcnU1ajVS?=
 =?utf-8?B?V0R6aEVMWmQrNE1QMUl2aWVrcjlJQTgySGhHKys3cGVEbk51UmFCR294SDl5?=
 =?utf-8?B?cFE0VnZNVlF3dHNFU2FTamJPOXZnbXZNZ3hNcFlZTDdLS2tmMkFtZnp1NHZR?=
 =?utf-8?B?WEFiK2xnc0ZERCsyNkF0M05UdzV5d0tZNktSY3U4YWE5ZEhxYWJES1UxT3Ay?=
 =?utf-8?B?Q3F6a2hyaG5XR2VqTUtlOTgyK0VSTEY5N2NjRjZ5MDFKejRMdi9pWVpBSlhN?=
 =?utf-8?B?YTVwdEgvZ2NsNi9ZSkVMVWRGaXBIRmRhVHJVREw0ek5uWHJuSmFCanBxdDdX?=
 =?utf-8?B?T0lsWXBubU5uVXJicHFkZEFDQyswdHN4aC9qTVBwbU1wcFloazQyUG5jOFEx?=
 =?utf-8?B?UFA5dHFPa09ZK2NsUUJ6dXpyWVpkZlZhR1h4enBrb0lZUHRmTng0S3hFbVJ5?=
 =?utf-8?B?MGZYOUc5MisxM2Vxb0l2elZtSloyemNBY1ovNW1PTmNCZTZaT2V0TytlOUts?=
 =?utf-8?B?R3BJT09Ya25LYWRYRGF5OWFQQ255SXMxdC8wTnJpUWVWM0hHQ1h1TEdOczQ0?=
 =?utf-8?B?eE9nZWRNUzRIQURYM1UzQlp4ZlZaL0NCeUd4Ym1lUGtxcFFwY21abmNvMTdT?=
 =?utf-8?B?QVpBSDk4Qnh0V0M3b0k5MzcxQ05aaWlkQjJqZEo0ZmtkYTlISlhuNXZKQzI4?=
 =?utf-8?B?dG1nelVWcVlKZTFySWY2bzI5eFJUWEcrK2RrMFlsNHU4Mmp1c0Y2eE1XYm0r?=
 =?utf-8?B?VXAyWUFIOTgwVkd3WGtXYmZVRlM1NkdUTnIyVHRaZDNjb0pSV1pTUEpvNUNl?=
 =?utf-8?B?bkVHY2NGL1ZEVDdJNERBc2l5aTFDaHg1bmJZQlNMY2ZRMFRFbHNFM2VMNEpX?=
 =?utf-8?B?UFZaRk1vSGVJSEZYUk5QT3pkUE1TRzBHRzB3eXZocjlVNmVhaGUySmxhOGdJ?=
 =?utf-8?B?VlRYdGpqaFBDQitOOHllUE1wTVpUejFCdmYrWS9zSFhtWDRXc0pwNmd2N0Rw?=
 =?utf-8?B?NnB1SnBRMzdpMUpaeWhBcS8xTVBaM0xITFo4TmNJemZKRXBxN0tzZThFWnZs?=
 =?utf-8?B?cGc1TmJ0ekZXazZHS0RCeVhiOUZXUGVKMThITTJIYzU3bjBhM3BjanJBb3hl?=
 =?utf-8?B?M2xTWldpaFQ2amZzNXVlYjJlcTI2dTROdzRRUndVbmdlWmJTN2x0a01HUlkz?=
 =?utf-8?B?Y24wUmxvd1pnMTliczJHbjNNbllzbi9uYm9oU1FPcUVrT1B3NHd6M2p4aTBX?=
 =?utf-8?B?RVhZbldwQzNLREM3cmkvbWlPbngvcEJCT3ZHVEtiV1pTUm9RRmpJc25temNL?=
 =?utf-8?B?Z2hvUERtSXVqblIyU21zWDZlVHZQSmJsTHNlQzA4QmMzcmQwOXd4aEVJdVc4?=
 =?utf-8?B?M2Q3TzBwdWxubC9GRFZpWXJUUlZNMVhsRXZJbHlpMDlOSDVzYVVWRStOYXkx?=
 =?utf-8?B?Z0UxT1hvbWljWHdkbzRBMEVnQzBTS01jY3FyanFGWFM2TGgyRENQRk0xQmdU?=
 =?utf-8?B?NVZLVEdVM20wYlVFeTRuWUQzV1NZWHhIZmFGUUh6UkpmNTZmYUI4WURUVEx5?=
 =?utf-8?B?SHZCZlBRNHlIaGtSTzFvcDRHdGdzbCt4UzJ3Yzd3SVZKSTR3L3ljcUdCRlVM?=
 =?utf-8?B?SE4zY2Q5SXBZZ1grOWtnU1pnVExoL2lDbmpYdVp3QUY0Q3BLWTdNL2dNbnRy?=
 =?utf-8?B?NGhNeE1VekhwSHVFMXgzRnNvMmlCMlFPYWdPcVJZVlIyaE5jcW4yM29SRGhE?=
 =?utf-8?Q?JCFciYA/14dPKBWODU6AGxgI/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d818c4f9-c7ff-4462-2d36-08de23db7cbb
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:11:13.2309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBXCX8ES82zuEmP+tfzlw46+giLtM3NLIYn2ZFkfSxaz6LPvclcYJr/km6G2EBLj6aGyD29n3j5QiEdASCpaJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6801
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

On 11/14/25 6:01 AM, Alexandre Courbot wrote:
> On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
> <snip>
>> +register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture information" {
>> +    15:12   minor_revision as u8, "Minor revision of the chip";
>> +    19:16   major_revision as u8, "Major revision of the chip";
>> +    23:20   implementation as u8, "Implementation version of the architecture";
>> +    29:24   architecture as u8 ?=> Architecture, "Architecture value";
>> +});
>>  
>> -    /// Combines `architecture` and `implementation` to obtain a code unique to the chipset.
> 
> This comment for the `chipset` method got deleted. Is there a reason? If not I'll restore it when applying.

Ah yes. It got deleted because NV_PMC_BOOT_0::chipset() also got deleted.
And then, I didn't add a corresponding comment for NV_PMC_BOOT_42::chipset().

I'll add it. I have to respin anyway. Thanks for catching it!


thanks,
-- 
John Hubbard

