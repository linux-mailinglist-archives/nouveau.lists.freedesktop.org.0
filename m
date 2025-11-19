Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380AFC6C967
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 04:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C855D10E0B8;
	Wed, 19 Nov 2025 03:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sungQ7jt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013057.outbound.protection.outlook.com
 [40.93.201.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E015910E0B8;
 Wed, 19 Nov 2025 03:27:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DfxCf0MU+b0c5yC2NYY/zTUgIHLpMlPbMleA+2diQB+4UTR3qiN1TnHCOTDyehZE0bqaFDgwaFknU/yd9Nu8qu07qEiYnmNULwpXRQLAyZrZQHRzRhCMk3MSxSaEjeowhtlXQJVtrVBcMYlgkL961kdD89rujgGI8TmngnE0QD2Bsjqn+3SZSZZwCvKry4o78Ynr5mnpdV7qnWrojAR3GHryS1Io2tkAC9N2F04i45qjKfnarcrxn+DzhCwxiAssZSqfkyT4zhGoa7eVZQ2wcLg/kjmDSb9HSme0Rx+boM/I6j5/bGnFep7YslzBbArazxgUvyGMtBdCcupKXC3Q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KagysmyZCJY5y6N++WtXqMM1DiSa3Ba2RibD4UqDl8=;
 b=hXgmNUD0OBusswROXGmG7uglni64MbrPYyR7whFmvrbxz+ghjNgRROFAbPj3soRLKo7JL61EL2dMss9tM0vC1noNsslEgn8RfrUleuAVBlZ2fa6D+r/zC8VMC+oVBTRleTkp0H/45xeaVYdTy+dXKnFt8jKzBJmmMoSqfVqycn+L8eDKldUXegBRuI9H8xpzNtLGSPeTl0s4a5mF6IFvKOjxjCC34ZnqTqWKsQDaE+z9Tky6vJnkO6EMJP3s/uZQ7MJT/yyq2n4KE6reb5+hn9UW/UarLxEKnO9fvgHa0zCn46AQONH4Y6YtoZzUfq0nzi+b6TB5ydzPsE7Hiq4d8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KagysmyZCJY5y6N++WtXqMM1DiSa3Ba2RibD4UqDl8=;
 b=sungQ7jtk21pAkgOrMqArViQKu4sA32Nf0BjlLKALBTipnr/xi0amCcEldGCZFLbxKMLsTiubsa1LDkLCUtDkx3YvQuC/TY4ODaXkuwsXB9OrFi+0SV5aXm8ZqS/xuVFG/gP7Sh6eE5mkUJ6fK9oN7+0dzASvlpsNgAYygW2Icg4FOYtfk8pyle3rVgbKNPAIDoVjPBExYag44s+nwq0t9hoEI524u5y4P6WDdHb6lfBplmygIdjTPYY2Bom0HmkdvPgFdE8k0+k/6EUER3tou26XQ7HFESipgOlLagq3S7TLj3HVxruHAUiilpnV48xGfS75RLpMSUU2QOBoPxBzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5709.namprd12.prod.outlook.com (2603:10b6:510:1e0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 03:27:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 03:27:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 12:27:13 +0900
Message-Id: <DECCO5NHBQWU.1A5DGQ570SM9I@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "John Hubbard" <jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
In-Reply-To: <20251114233045.2512853-10-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: 40a53357-a78c-4c53-0e80-08de271b8a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFczTVA3T1JJVldHN2dETjZZa2lSOXAvRGpmWWlpb3d1VkNpYXppS1pNdkhE?=
 =?utf-8?B?NGs1czhYNjB0MTFmOFVPR0JLZnFSL01qNWhJb0EvODZWRHRDaTVpQ0NnZEZW?=
 =?utf-8?B?cU5ZKzVJUmdaZzhUd05PcFdnZ09XS0VBUWFOYmtjVzFITE5wUlJ1NjMxbTNi?=
 =?utf-8?B?NEoycnI3YjhISkdlejlYTk05NXRGYnFEOWs4ZlNTYTlqcEUwbzY5TjBuSkM0?=
 =?utf-8?B?RzRKUklhQUdqZzF6OUlWbW45cmpGakNLMkU5NitDQkE3aTExSTNiZ0JSV2lx?=
 =?utf-8?B?Ny9rTXlKWGdkelZCN3pOWE5zSEgwLzdUSTBRVDl4QUJ6N0FlcHZ1R2tidzVh?=
 =?utf-8?B?bEttNFN3SEJpTkpSM20yZ1RmZ3UvR014dUU0aWtyVDhkSVlJZ2tIK2tvK2Z6?=
 =?utf-8?B?UlVBbG0zOUdwVEg3eVNjZC8ySTY4Sm01NHdkZWxub2xIL1lLUHBhcG1iSC84?=
 =?utf-8?B?TnY2NGxNeTZ4Y1VsNW0rdHE0Qmk4SnQ1aFRIaE55WU9kbm5BQy8zNTJqbC9p?=
 =?utf-8?B?eHl6dnhPTmZRWS9OVzJkRGpHa1hoc1hwYmw0eXdvV24yRk9xeWJsWEtGcnc1?=
 =?utf-8?B?aTZwOUpWQ2EwRzI4Tm83aGVvVmVNa2ZYaVg1WVdPZjZodGVuYTFJYkQ2ODUz?=
 =?utf-8?B?TDQ3b3VQRk40SkN0L1RaNTg3Tzh3SVJnemc5bXRaQTNHMWk0a05CNk0wN3Fs?=
 =?utf-8?B?d2w5VzRqWVA5RHdTZUp4b2pzb3VmbHk0QnZPNVB3di92YjBGTjU5TFNBRjRM?=
 =?utf-8?B?eVp3NFc0eEYrTFM5NmF1TGYyTDhPYmlyTGlhQzhva2xhNU5iZUordUdwTFh3?=
 =?utf-8?B?RlEyc3crcWRnVGN1S0NURUpITGxFTVBwSExkT3Izcit6YkFkdTYyT3lPYXJG?=
 =?utf-8?B?WWw1NmtuQklOZlpPditVbE9JYTR2MktmVDJteUYwOTVNQ3EvQVd5eURJZEZi?=
 =?utf-8?B?YmJlV3pTQXNNRS8zdDAxZGliYUh3VW12cmRIeldudkhxT1pmL3BFMG1OcS80?=
 =?utf-8?B?aCsxUTAwSUpiRHlyQnpyUUZ2SitJYkNucnZOUmJJSmdEUjVwa1JTWUpNQ1lY?=
 =?utf-8?B?RTBxZ0o1NHozc1pHZzNtRFFsUGJrVGFxNzgxeDJrZnROYUJQQUNKUGdaYU96?=
 =?utf-8?B?cmV5cXRBU1lXS3VuUC9od3A5a0dWRjc4S2xNRjBuM1QraVlSN3l2aWZ2aWpO?=
 =?utf-8?B?RUVwSUxsQmFlRU9GVm5DRjRtcUNWRlR1VzgyT2ZHVzVEOHF2amJ1QWk5VlNl?=
 =?utf-8?B?ZU04a2FqbDd2Zm10UUcwUlFaZ2FkMFQrK1JkL0tRQndPS2dlak5ZNXh1cDV2?=
 =?utf-8?B?SGRRZjlsSko4WXd3K0NFRlBBYUtHNmFWSEhBY0h2VzEvZVVmNUIzaGUzYW5y?=
 =?utf-8?B?K3crNEtlY013NDBjbVNMb1NpdXlkbU5RRVJsTjJhSTE5MlUzV2ZEdmdlY1Vs?=
 =?utf-8?B?R0VPcGpnRm5YSTYvVjB5dXRRd0FoQkVqdnE4K1Fjb0M2V1pHbEJPTXRSVDlr?=
 =?utf-8?B?TkxBdjEzSDltZzloRDRoTTlHaXZGNERTSFJ1Sk9GOWw3L21pL3JDd20rMjV5?=
 =?utf-8?B?d1BGcGhGWnlkZzlsUWtQR2NPcHVCTW9tQmhudmEyaWdjSGd5aVpXekZPQmpY?=
 =?utf-8?B?ZG1kT3Z2K3VmS21lb0NXV1lsejd2Rm1zWkRwT2luN1lUQVVqaWZEWTVXTEgx?=
 =?utf-8?B?VXBremRNd2YvL3VxMXIxVFI3bFRsYmJvRXZidFFyczFjUnFUaVZyZTRicFBr?=
 =?utf-8?B?QUYxV0w5OU5LWlBrL0JYcUFRc2ZQS21NcFZOdnNJaFdDMEExRkdpTThiempC?=
 =?utf-8?B?MjRMb2w1eGpYQXA0aVBlN2VXYU8vRkhMcmwxV3gzTlJTR3dVcXU2dTEzdm5i?=
 =?utf-8?B?eVp6WXV3Yld3WTdRc2lqdTNRT0dnR1NWSndFWXNrRzlsazZIT1B5M3hFanpw?=
 =?utf-8?Q?dLbT1IBcTgPzxuwcvZHq+p6WnRGG4SOj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1BkbXU0TFpobGdvOGJhZlhpUVJBTmlOZDZFdXQ1QjFuQkc2R1dEWExPZG1S?=
 =?utf-8?B?c2VCZnNjYk5WbFhvamd2aXhNTlhVcEdaaTdJSUx5YnBuRDllbTFIV0RINzdP?=
 =?utf-8?B?Zis4Q3hHdmo4VC96S09YRHJ4M3ZYOWxrWWlDSlZ4WGYyUFM4cHMrUWVCcmh2?=
 =?utf-8?B?Y3l3V0hucTI0SVMydUVHbjVjWE5CYXFBeGtVbmNsWmxwelVHTFl6KytDb0RM?=
 =?utf-8?B?MFYxMFZrWVFJbjdFWmZFUnE2YlZMVHJUSEozZDBTZzRzVDU0ZUtXN3l0UzNS?=
 =?utf-8?B?U1N2WW9XTTAxSDdPQm9pcWI1dUo4anBEUzA1RHRraEJzZWR2M2lORG5BanVU?=
 =?utf-8?B?TWxrcnJsdVFpbHY5WjhtWXZ3TDlXSktLRE9RSlMzdDJNMHFMS1RaMmNKRVd1?=
 =?utf-8?B?NUlEVTZ1WkJDVzYwWmpKYnVSK3AydGMwNlNmQ2k4L3d4NjgvUW1zQ01WZ1BO?=
 =?utf-8?B?YkUyckJuMS9zWCsrNmxZMmp3NGpxREVsSnZEaktoMzRSQk9jWE5xWTZTUnhs?=
 =?utf-8?B?dHAwT3RieGFYZlh6QVFRbkpRWEROVTZLZE9sbndmanBQSXA2amdVa1ZWSG9Q?=
 =?utf-8?B?VnpodTZ4WUdXWVBIWElpWHRMTzNBNzMxTGNPS1N4eWdReWdwaFZRMER2SHQz?=
 =?utf-8?B?TG9UcHZxMkdTQWhURUp3NjQ5a1hQNnNCaThsMmxsVXo4R1c4TGVkME5BQzVC?=
 =?utf-8?B?MlZ2aVJ5dHc5RzVnSktLb0NVdWl1NWdIdEdhT3lKcmxFN1lSbTBlZzg5cG4w?=
 =?utf-8?B?YXI2UTRHclYyd1NtNlZVVko0Mk0wdkwvVFVyekw2bTd1K0lXc2Nleko3N3BH?=
 =?utf-8?B?SzdLSUtxVGtZNmdDRkdaOXlSK3BBd09jUDlVY2E2REMzTUpYL0tNbmFQYUlx?=
 =?utf-8?B?QkZGNGg4R0cvUmtiaTMyejQ3Sm5JdzFQMmFidG9mSVZoekozdFFoUGNuRkRD?=
 =?utf-8?B?YVpCYzE0NE9jMm1BaDMxMHZOdURkWThxZWRKWGNMcGtPTEZhSWhzcWs2TVhk?=
 =?utf-8?B?RElPL1drMHNjNDVtSGlmYTQzM2RXclhoWEZzb0NFODZ0bWoxVFhRV3pJVkdT?=
 =?utf-8?B?RTJONkJ2LysyVHFuM0prUU0zNmFzd2ZsWTZPUHY2aHIzTGNmQmF5RzBvYlh3?=
 =?utf-8?B?Ylh6NytybXVPdC9TbmRBNjU4Z3NBZ2k4bVVUQ1NzdHAwQ2RFY0ZSSzVlTkZF?=
 =?utf-8?B?b3U3eEhWT2VYeGVrSXEvR2ZSNnNVdmtobGxteVl1M3RRTmN2NWhlSTMzRWds?=
 =?utf-8?B?YmkrVGhKZUhHc0JvNU5DbTdiMDF2TFVkd29pTm9FUVkxVHdaeTA0S2NRV2VQ?=
 =?utf-8?B?TVowWkNibTlvR1loMGdHM2FHUWdQT1ZITW1Bc0t3VHBIalhpdE1UVFQyYm56?=
 =?utf-8?B?aGhQWXpyQmluTnJiVmRxTDliZGZmUGZ5UWlDRHVuN21yOHZ0Wm9OMkF2Rzk3?=
 =?utf-8?B?UWRMS1U3U1NIWWs2c0FvMUtvb3pELzlRUG0wOXBjdytBYThVdXlVMFcvSUd0?=
 =?utf-8?B?VkI3TFdCVVozRHlTUk1HTXo3OWU1UnlZK3JKM3JRT1dmVW1YQ0tiUzBlc2oy?=
 =?utf-8?B?ZlgvbGNhZDM0WXZHcmI5UzhQODFsbHQ1ME9PTHM3UFNaaFlzVGpHY2FRVWJM?=
 =?utf-8?B?QzhtR3krYTg2TVpGVitHN2VHZWdWaGV1ZDJsVFVSOHNqejU2eXYzVmlZUmE1?=
 =?utf-8?B?Zk1UQzhHY1BYOWhSb3BMcFRnRXJvWm1NNFdmTXovSVphZzhjZm45Y3BUdldt?=
 =?utf-8?B?TGhUa3hxaWJPQzFhWG9sWldGNFR1N3VZZjJGdytGZmdtbGJUd2VkRUdPL1d4?=
 =?utf-8?B?ZUZvaGRlam9TbmlFc1FIeWQ5Yi80NWlHcUVYeDNoVUMxNWJtUVZoZll5bFpV?=
 =?utf-8?B?WnNjVTlsaXRLQTg2YWFtV2YxNjNEWnlZTmpSaldTQ2thOGNPc3VPMzVDRy8r?=
 =?utf-8?B?dE9mSFQ4NjhaVDBQL0ZkZXZoRGYyOGNySWlmN1d5VDZiSTVxdHB4ajM1ZDhi?=
 =?utf-8?B?Um1kdmE0YktRWFdFMGoxT2svbE9ZOTR1cVFoRmhnL3R1VFY5cWc0TDkyU0FX?=
 =?utf-8?B?RTNmZ3FJaSt2VFU0TG45RmpUaFF6NWtUZCtvSENTY2JyUWdnME9jeU9lWkRm?=
 =?utf-8?B?dWlaZjVHZDE3Q1VqSm8rOHRGc0tySUpUZGE2TCtScXM1VWFQZ3p3YXJpTVg4?=
 =?utf-8?Q?jHBlGJ70ZGlzObiM582pjfFRBHQ0R8JvJfTPRf15ThDL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a53357-a78c-4c53-0e80-08de271b8a45
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:27:17.2964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TFh+I9luXqNy8EeSE8rlg/dAjAA/0irjOal72L1+Gq63fIuKh0v9sV3ikTixgy9lE+vduHfV/IbJTIM3Donnsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5709
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

On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
<snip>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index abf423560ff4..860d6fb3f516 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -19,6 +19,8 @@
>      driver::Bar0,
>      firmware::{
>          fwsec::Bcrt30Rsa3kSignature,
> +        FalconUCodeDesc,
> +        FalconUCodeDescV2,
>          FalconUCodeDescV3, //
>      },
>      num::FromSafeCast,
> @@ -1004,19 +1006,10 @@ fn build(self) -> Result<FwSecBiosImage> {
> =20
>  impl FwSecBiosImage {
>      /// Get the FwSec header ([`FalconUCodeDescV3`]).
> -    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
> +    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
>          // Get the falcon ucode offset that was found in setup_falcon_da=
ta.
>          let falcon_ucode_offset =3D self.falcon_ucode_offset;
> =20
> -        // Make sure the offset is within the data bounds.
> -        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>=
() > self.base.data.len() {
> -            dev_err!(
> -                self.base.dev,
> -                "fwsec-frts header not contained within BIOS bounds\n"
> -            );
> -            return Err(ERANGE);
> -        }
> -
>          // Read the first 4 bytes to get the version.
>          let hdr_bytes: [u8; 4] =3D self.base.data[falcon_ucode_offset..f=
alcon_ucode_offset + 4]
>              .try_into()
> @@ -1024,33 +1017,60 @@ pub(crate) fn header(&self) -> Result<&FalconUCod=
eDescV3> {
>          let hdr =3D u32::from_le_bytes(hdr_bytes);
>          let ver =3D (hdr & 0xff00) >> 8;
> =20
> -        if ver !=3D 3 {
> -            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?=
}\n", ver);
> -            return Err(EINVAL);
> +        let hdr_size =3D match ver {
> +            2 =3D> core::mem::size_of::<FalconUCodeDescV2>(),
> +            3 =3D> core::mem::size_of::<FalconUCodeDescV3>(),
> +            _ =3D> {
> +                dev_err!(self.base.dev, "invalid fwsec firmware version:=
 {:?}\n", ver);
> +                return Err(EINVAL);
> +            }
> +        };
> +        // Make sure the offset is within the data bounds
> +        if falcon_ucode_offset + hdr_size > self.base.data.len() {
> +            dev_err!(
> +                self.base.dev,
> +                "fwsec-frts header not contained within BIOS bounds\n"
> +            );
> +            return Err(ERANGE);
>          }
> =20
> -        // Return a reference to the FalconUCodeDescV3 structure.
> -        //
> -        // SAFETY: We have checked that `falcon_ucode_offset + size_of::=
<FalconUCodeDescV3>` is
> -        // within the bounds of `data`. Also, this data vector is from R=
OM, and the `data` field
> -        // in `BiosImageBase` is immutable after construction.
> -        Ok(unsafe {
> +        let v2 =3D unsafe {
> +            &*(self
> +                .base
> +                .data
> +                .as_ptr()
> +                .add(falcon_ucode_offset)
> +                .cast::<FalconUCodeDescV2>())
> +        };
> +
> +        let v3 =3D unsafe {
>              &*(self
>                  .base
>                  .data
>                  .as_ptr()
>                  .add(falcon_ucode_offset)
>                  .cast::<FalconUCodeDescV3>())
> -        })
> +        };

Mmm, we are creating references to both versions of the header, one of
which is going to be invalid.

Let's do the casting in the match arm below:

match ver {
    2 =3D> {
      let v2 =3D unsafe {
         ...
      };

      Ok(FalconUCodeDesc::V2(v2.clone()))
    }
    3 =3D> {
      let v3 =3D unsafe {
         ...
      };

      Ok(FalconUCodeDesc::V3(v3.clone()))
    }
}

