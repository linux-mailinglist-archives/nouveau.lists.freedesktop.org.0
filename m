Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F9FC9DE1B
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B316E10E724;
	Wed,  3 Dec 2025 06:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hc5qbVRA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA14210E04E
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:08:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M6kbUJPpdnRZH1JpN2j9u/AtDqEqCjxwfjBMd4MVWpmb0cG1US7qToWidOWwaXuqzYMjKB9vM3VF41bv5zY8mYf7wUQQvzRW+D36AdrZHRJuaYPa8CHHO2umQi4/Mjbb2Ja25JyaCcjuryV05+QjIkpQ1MCOZEmn2jWKMIA5plwTO9JF1GIkt3h0lwWHNi3TNloGq1e5tgI7F15kJ5NeHsgx1pRL2qIwFpkxryJdUlWNpgHO0Y1KUUs2PafsGH0F3pDwA7oOL8A+FG8bYmqDTEAgzCaHQ1Twcbg8r+QRa2fh0J3QaIIPcH4Gxbvn8aa5N7ihuaZI10xdh1Nv7xaBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5pQH2LN5tAhQwXp0O1m3OnOSbQFBQ6JphOGWk2Ca18=;
 b=wdy207M2mgC0pMCzFgAn2TI6OckcF3MrrDHloGffDjd61FoUXhnkDZd/W4TgtE13vfKNcmCWCtBdaRyLJdp7Ky3MGbicfoVZ1Nhl3twM681Nu4XBtkI6GxeFzNETJZa/c+H717pWIVYI5dphKVOEOZ2iETf/6eHqPY5BxEhCDc2L0zXsx/906JbPoZDjydFETtjmbG6VBP6I8JQF7ZEIZFbTfbwTdIQq0Svt/1I8GEtxVDluIKHGAAPS3skbr0VzODAp97eQpLIOmUE75Dk4UOzN+z3pMfx+riW/Ho3XxFOUGJRqRIti4IQSB/Lg1AdVH1HYI2eFMp5SSYTwOLfg4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5pQH2LN5tAhQwXp0O1m3OnOSbQFBQ6JphOGWk2Ca18=;
 b=hc5qbVRAcwPabDmWMxi4tZKqTWjKtG8umxO3qXA2c9h/kYtMfqNstvaPRDpe67GtFUBMs9mdglrW4K9r5nWEKieSOfPsqjnASx9JhQlruhVsxX9TD+q2WUobTK/85xMYos7VazfQlP50hrCngaWONKsSOb5JiGhdb2/svRmu43d/HSO6y1GTeatHxndaOhHPdpopnBRyLhOkUDGssTvgZQsvoqHr+2reWr0A73zmn0VGE6CIFqpfAqBFjFSZEEOyhBBDjgNy3FB0MAurLoqmwAUyGqHejMOlorlZxgaMJ01TJClQ0r9eeui9zn/Ge6s8DnmRYwuWQMcTmIy3cTn/rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CYXPR12MB9317.namprd12.prod.outlook.com (2603:10b6:930:e2::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Wed, 3 Dec 2025 06:08:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 06:08:17 +0000
Message-ID: <98710ca6-0e23-4ed6-8cd5-4d86dfde9be2@nvidia.com>
Date: Tue, 2 Dec 2025 22:07:49 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/31] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
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
 <20251203055923.1247681-16-jhubbard@nvidia.com>
 <a3dab9710988f6ccf2579c92b1751820a350af06.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <a3dab9710988f6ccf2579c92b1751820a350af06.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CYXPR12MB9317:EE_
X-MS-Office365-Filtering-Correlation-Id: 9032c5c4-0a7b-405f-5614-08de323259d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0JuSDF6NUdUeFFhaEEzbU4xVnV3RHdnU3A4d2pDUFFIa1JGZWMrY0pBSWFx?=
 =?utf-8?B?L0d2SkJsejVQZTYxSzRQbnN5ajV3L3ZsQnV1d2VURnkxaEVTaDN5MktBenZs?=
 =?utf-8?B?b05Hb0pNeGhjV3EzWkVwbzcydFVVMFZUK3B5RVJlNXRtYWNJcGNZTWRCYndC?=
 =?utf-8?B?K1V2aDYxV2hVRzBFVzJwRnMwclFmTmdIK0tQTjkwS0RZRnZmRzYvem1ZMjZi?=
 =?utf-8?B?Zmh6T2dqRTA0bHlmbTNKZEs1cVRqL2dsSXExa3VqR2hPYW95UXpHamRxZ0Vx?=
 =?utf-8?B?TjUrUmJxdXY4MjB0ejJlVGZOUGlBQmZsV2pNdTdnZGhESkljTlBSNEpUdzcy?=
 =?utf-8?B?Ym9RSCtqRXBEeVNuVHNZWE5LRWFJRHJUWkhoU2hrUDRzUVFGYXoyWnMxcEM0?=
 =?utf-8?B?Ui9DNDhvMGZoK3lUT09RaEhHRFU4bHRsUThObnpjd3lhb3YzcDJxV2VaSHVU?=
 =?utf-8?B?UlR6NXZ5d3NnOU91WFdyQldoblk1TThwajdoUHUzYXVzVS9KN2pFOUIzRWVp?=
 =?utf-8?B?dDVZQXhlQndQS251R1lvK2JaUjNyZlNzWXloZWFuM0w4MEdpWnRNWVJkbU1V?=
 =?utf-8?B?Q0c1dnJ4Smd5RjZiU3ZBZWVWRUgwUGt1dG9FaEVyaW5hb3NoL08vUkpiRUZY?=
 =?utf-8?B?K1pGWFZUUmY2dlI3K1pBbXhid3E4OHJ6YjkwZmtkb0g5WEhpcDI0eDBhVjEz?=
 =?utf-8?B?OTRLRi9CbnhFbXN6M3ZCeWd0MVpxTk90UW1UcklVRVhkWEl3N1kzelNzd0lF?=
 =?utf-8?B?K2RKVXpmd3plMkN1Z3ArSDlvc1FZL3Z1UzhUaW1ndUNkY0xRVUIvaFZUM2Qx?=
 =?utf-8?B?UUI5WHNJWWt0aUxaMEVUdG12aXpiMy9iYXJ2QW5jRytSOUdjWmVQeUt1Y09y?=
 =?utf-8?B?ZTFlWnRydnB5V3NUZ1Nzb29McGdxL25wb29CNi9VOXJLRWNsaFY2NkNRR1dI?=
 =?utf-8?B?cjlpVG1iaUo3YnozUTVxRUVYZXdibzFoeHA5L3JQVS9sQnVxMkpnUStzcUdM?=
 =?utf-8?B?S005di90cEJvS0NEVHZEK1NKV05GL05UL0VweFJWVGphMmRxSnp5L3NUcFNC?=
 =?utf-8?B?c0VrWXhremlvTHB2OE5wUS9oSWp6T0wxcWw4dmFUWmJycHdrKzQvVlB6Q2Nr?=
 =?utf-8?B?VzRKVFd1cUJyOUNWL3VKWC9wUlJSYmg3UnZiM1k4Q1poVDFzNFRlQTRxYlMz?=
 =?utf-8?B?YXQ2c1NidFlRcmh6ZU53TWNYRVFsQ3hjKzMzUHMwcHF0SmpiaWtTbFhabFZS?=
 =?utf-8?B?LzVlTEVBRVJ5eVZsQklPVC9BYzBQbVVzSzJnaFJFcEZtdExzYWJZNVNZOHRY?=
 =?utf-8?B?SHd2Y1dNUnNwYlkzTmRua2VUSXhScW1Kb1F6amVLa1I0bFRlOThZaTMzeE1F?=
 =?utf-8?B?VnlRS3UxUjNNelJhTXVJbkl5TU1aajIyVzBZSlhVOEFzalJsczFsRWhEQkhN?=
 =?utf-8?B?VFVqTklUQ3c1dWFOSldaejVvOUMvV1lmRHFGNWJxUGQ3ZFFNb2tKTTZlc0lR?=
 =?utf-8?B?NXVaOXRNU1pxSFVsWXNtUHFXRy84MzdwTkNKN3hrR0ZtMkIwTWtMZnhkYytU?=
 =?utf-8?B?RmhoRUVwTHBIemphVm5PM1BTS2ZiUTcrQi94MXAxL3dka2hVaHZVMHUzQ0NC?=
 =?utf-8?B?ejAvTkhnV0l4VFBGZlJsQmN3NkR2SHRCWjdBUmVUenNEMVZWZndTQXJwMnoy?=
 =?utf-8?B?RTZZY0Ztd2ZDOWx6OUUveEowM25KTXhFQUQ1ckVmRjZ2cDA2UmxDeGFFdVlh?=
 =?utf-8?B?bndEVUkzcHRtbTJSb0EycStHb0dRWDF6bWFKUUZmSC94cDZka25iR0srVnEx?=
 =?utf-8?B?VnFXY3lMSzk1dzlQcmJlWlR4WlZ5anZ2NnV4RmJFVDBOUlROalYxMUdzbjVC?=
 =?utf-8?B?eW1kSlE3QUo0RFR0bFR6Z0xVLzRGSHZLRCttVFliMC9BMWRvbUc4VjFLZWxC?=
 =?utf-8?Q?nOQFmfyevijw0JG7po/ZfVkazVnPcexK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmI0RFJLa08xT2NuZUV2Y3dRVlRhOE16Rm1obFBFaTV1cmV0OEdwVmVueGNh?=
 =?utf-8?B?Z1JxNm0zdytDT1pyc3JZYXJFYWlWdVp4NkplRjBsNERZd2krRUtyY014MlV2?=
 =?utf-8?B?QjNpQTVsK1RQa0R0OStIRlhxMGdQcTN2N01uZEZ5L3MrTEduZkszUnBHV3RF?=
 =?utf-8?B?azgydlQzVUV3Z29VM0VJUWFuS2pPRHpoRnpyeHd2cGlxbm14TDg2ZEFuS0g1?=
 =?utf-8?B?K0RRb0VtVEhqeTNJNVBzWXpVT3hUQnhzM2xnallGdVRDMW41OXk2N0lUZEdn?=
 =?utf-8?B?TWF4ZTVaZ0JKaE9lMytFYlVVQXlRN0pJdFppUzRBeEV3MTRqTTBadHRQcVcz?=
 =?utf-8?B?RElEc3JDeisxVms3Tnd4b1ZxOVc0RXlXcy9tUGtSYTJwK2owWG1PVUI0ZHAz?=
 =?utf-8?B?S1ltc0pMUkZTN21aRmg2bVlEajEyUm1XVUFGNjBLOE5rYU1ZTHg3OWVTWnl5?=
 =?utf-8?B?R1pLRUFUeW9wQVZmS2JybjJYWFFsRVYrQWs3MG9laHJNL0hFRjdNM0pBd25I?=
 =?utf-8?B?WFVSYVJhR1BMMytNSEcvVTlTNFhURDlFTUdjWkV0RDQwblVSSkF4Y1ZTS0Iv?=
 =?utf-8?B?eTV6RlY4ZXE3RG9OWjBzYURIayt1M3VSMkIvbTdRVUVSL3orMFVKcGRnRy9Y?=
 =?utf-8?B?MTlGNk0xWHkrZ29OUkh0eElkdjR4c0VEeG9TUjhNREdzcUEwVW1NTFpSMFds?=
 =?utf-8?B?eW5JblRMMVhmUmR1cmpYR2xjUEo3Q3J1UEZiRC9pamRpaHZBd2RLeHduWXNF?=
 =?utf-8?B?WUplNjF1RjNMc0p5eVZuOXRHazR1WmRlc1JrQ2JET0hXOTlBd3pjTFIraVlU?=
 =?utf-8?B?ZGhsTUNTanh2UkJTaHBOczhnRGVaRUo2OFRSYjgxaFlkMmRrT1lGS1pucGg2?=
 =?utf-8?B?anlSWk9GOS9CaTk2ejcxVzNXWk94ejlSRUQyeHI3Q3VnQVdVaTR0MjRobUp3?=
 =?utf-8?B?NGxlZFJxdjE1WjJZKytsenVTODJNQTR1TjQrc2RaazZsK1dPK0hLaGt6K0RK?=
 =?utf-8?B?TjlTSmc0SFNSd21qVkIxbVFiK1hLVmtOSytPVU9hWGVkdHo5RU83QWg3WGlv?=
 =?utf-8?B?S1pDNURQYzJEbEk2MFlnRzJ1VjhuWCtKaWJJT1I0cVA3UXhLNTNZVVpZSHFH?=
 =?utf-8?B?c2tXN0NxeVNnTEgyNGREbTNnemdrU2R2S1NJRytoaVdUQU0zOWt3d2RvQWFX?=
 =?utf-8?B?aDdpU2tzVVhPOGpEUFU4eitjcWdxOWFRS09ybU4rWTNRaVpKY2dPOTNKeWcr?=
 =?utf-8?B?aG12OTVac085SWY2Q2xMQVNBZ1p3QTZtb0tUQU5FT0lIVVl3WjZtRWZzUVBQ?=
 =?utf-8?B?SkF5S0xMUGxqR2FVejBnVjBUVlBsand1NjhQWk9ENjhxeVArcG9qdjFtZlhq?=
 =?utf-8?B?dW4rM2tRcmNKSjIwRkZocVVaeFN5aDh4MElRN0EreHFacFZ5VEhMSVN5bTM4?=
 =?utf-8?B?ZEdiaHphTndWa2plZW5ENUU4T01NaUdCZFJIMDV5ckY0NTJXSjdiOUVrUklM?=
 =?utf-8?B?a0hRcWZlRFNtWFo0UTJ3UjNDVithaUloWCtpM2o4Z2VTRWplY1FHMWRBR0Uw?=
 =?utf-8?B?dktMTlFzZmc5Y2YrN1BIdFU3aUVUc25kcnB6MmpMYzM0dDg3ZDJ5N1JpSmt6?=
 =?utf-8?B?RGRYakJLcGczK0QxeGY1Zk1Sd2lCVmk0ZEt2MGFVRElFSG1NWTBQWHJJbmVD?=
 =?utf-8?B?ako5SEZYT1lNMW05NHRvRVlabCtHOTBmSmpmOHRWN1BpZElvTElKRmxnKzFI?=
 =?utf-8?B?TkxKTkFtSjBTUm5YRjRIUUFXNTdHK05ZcHNGSG1IRWxSQmZsTTNFMFVDRHo0?=
 =?utf-8?B?NTUybWxkdUM3ejN0a2ovclV1VjVhYitTcEFNVXQ1QVF3TUkyQUlFRTh3MDdl?=
 =?utf-8?B?K1ZOWVdVR04ydEdMVXZDTllJZXBvSmZobjZwblBlMlR6UWVESWQwYW0zTEQ1?=
 =?utf-8?B?R2JGNVJ5bFhLcTRWVHRWWHVReGI2cXZTT1drWlgrR1c2emlxdnpnSGFFUExB?=
 =?utf-8?B?cG56VFdvTTdWZjcyQlROblhDWkhWR3o3dTFERitUcUdmUDNUZ01JQ1gwVjJq?=
 =?utf-8?B?aUp3V2RZVFJPQ1FsZlhweEIvZlV5eGpYNXA3Qy84TVBiYTJYM01LK3RPc3g1?=
 =?utf-8?Q?17tf1LSenqv9La1k+9SvfI8jv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9032c5c4-0a7b-405f-5614-08de323259d3
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 06:08:17.1750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ZUpfVkdKJoT9OYEPklBPMQ7FCjNwN8pSJlNwRqLQQqUjkszpLJ/KsFM0jesjfeRIUoqU0p465HOcFO1jt4zQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9317
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

On 12/2/25 10:04 PM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:59 -0800, John Hubbard wrote:
>> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
>> +    #[allow(dead_code)]
>> +    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]) -> Result {
>> +        if offset % 4 != 0 || data.len() % 4 != 0 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
>> +            .set_value(EMEM_CTL_WRITE | offset)
>> +            .write(bar, &Fsp::ID);
>> +
>> +        for chunk in data.chunks_exact(4) {
>> +            let word = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
>> +            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
>> +                .set_data(word)
>> +                .write(bar, &Fsp::ID);
>> +        }
>> +
>> +        Ok(())
>> +    }
> 
> So as you know, this is basically the same as my pio_wr_bytes function (which I should probably
> rename to pio_wr_slice since it writes a slice now).  What do you think about extending
> FalconMem to include Emem and then update pio_wr_bytes/slice to handle Emem like it does Imem
> and Dmem?

Sure, sounds good.

thanks,
-- 
John Hubbard

