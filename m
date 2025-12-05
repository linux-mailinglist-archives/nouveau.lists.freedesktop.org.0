Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64754CA885B
	for <lists+nouveau@lfdr.de>; Fri, 05 Dec 2025 18:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86B10EB6C;
	Fri,  5 Dec 2025 17:15:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gg/UnruQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012066.outbound.protection.outlook.com [40.107.209.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F5410EB6C
 for <nouveau@lists.freedesktop.org>; Fri,  5 Dec 2025 17:15:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GujjMio9ULhHZS1tP2ysuCInP1Q5rDPqwfI5ONGx3A3f7dqQiZ93wkfZyVOPyuBovOc3YAUQBVdYi1ap5ryLv2rtLNLjj9mZBSLloeEs6Iv3dAu7FaX4Aj8JMPYx0eWIf+pAsJFjGr3K/GHxof22mlwluCNfZhvhQLS0Hj8xHgJbr9NwsMGpuTbas4WsjjUevhaLeC+nwThAN7PvoKD8y4KXkS4Kyf6DWLYOlJBm8f6bSaevpW/zQydYVT8jDyqdt3mF1e5Vto1d+pUp/xN5hULvK+S1YtiZNDJNrXpF0ioGeK1Wm9L6vDYT5+VtKND2poha8YQTjGvqMX2pONngnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qAIaI/Iu1xSKASHYDnwBb70DoIqT2a1Y89SBsn8b3N0=;
 b=GyazPU3MBNBxv4/BivgdfrkgSxTak/8lcp09AJJSRweL4Fatm4Q59DPbKlBZ+5JWHKgO6AZxtb2qdwtgUhn2rftnTruUVTjje92cRPLq7ZjtMvtNYcn0VrLeLURuLBQZbqEI+NqJ36FrQmLN/U8cLDigDxd1kM7JhKN/+d3xolxSCQQB2sNcYg7czj9UWAgcdDDCV916D7+0bsBdxgQQymJlAylFb0MXtiiwzkjUSSw5GDKgCSQmvpgXFHS7bXfRrI0ld91U20VXKxOy6EYImU4tnFOIpFYSkwHb0CCQ8pN+huc+433PSBV4/Kecb+2L8qlIApnQykCSVAigWh20pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAIaI/Iu1xSKASHYDnwBb70DoIqT2a1Y89SBsn8b3N0=;
 b=Gg/UnruQfRXZjY2SV4ESFyXs1gKNX0Li9wW7/nHyu1RoiBxFxuP8rOu30FhB47reNgVd9NiY+Zp3izj/0vtgaB2HhUqbIJHV3SPv1J/uE1yZ9TvOax6onwv265q8AXQ0Wo9zG0y4BCxhiVl5OjwEMkiC0zdjnOthNMKGKlIlmDjld12/I+x4edvm+CKPZ3C39KbuJ4ppLcRQt+uCXn+PGupR8sqVaf/vM3J64KfZJ/FJw29B+Kusek104dXA3m8HzsRabjRZ81sTpoKR69LtCYcgYeTaHoBYu9GfPCvIPTGCTSrFSPp1nHWC8sUFmw1l1vrBAVwDNJExUpNog0rFmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB6662.namprd12.prod.outlook.com (2603:10b6:8:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 17:15:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 17:15:32 +0000
Message-ID: <dcd18bd8-cb7e-4c28-b4c6-95a201710270@nvidia.com>
Date: Fri, 5 Dec 2025 12:15:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
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
 <20251203055923.1247681-24-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251203055923.1247681-24-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0482.namprd03.prod.outlook.com
 (2603:10b6:408:130::7) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB6662:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a820f5-f62f-4def-760f-08de3421e53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UE1IdXpLajQ0a1lQcGFnV2xxbXJOYlBUamlkc0tjNC9iR1cwa2pPOWNBTllp?=
 =?utf-8?B?bFE4djNibXlEZkx2NGp4NGJGV0lVT1NJbVhYSzBqaVNXV0dBL1MvT2oremZW?=
 =?utf-8?B?aTYzZmtGdXp5aWEweGVoYy94UXJkQUlrZnVhTlJsektCaWtneWplWVdtR2pq?=
 =?utf-8?B?L0lBcWw2TVkzWHYrb1ZmU2RCQ2V2dFBTVVZkdlRJbElWUmVJZFhDbTlubjN4?=
 =?utf-8?B?NjFRMElrd0doZ2pxaWl5VmZzbkhDSTBUK2ZLZGdQayt4ZTRoWGQ5bUNWV3VL?=
 =?utf-8?B?WmVyUU5xTnVFVWFzejZFZERMWXdaNTFnYy8ybzM5bUR3b0VkQ1dSVEVBRW5E?=
 =?utf-8?B?K0dSV0IwdEM5UFZjZzFuREUxd0duc2FjMmRZdkVqQ05Xc2RXZ3NDdDVSbTN2?=
 =?utf-8?B?OUVRaTdDMzNvckQza2taSjlrWEN0bk9ZSjljNEJRd2o2Mk9qWmltQkhJL2Rh?=
 =?utf-8?B?aGpvcHBnVXlZMjgzeVNrd1RBeHhjSHE3Z1ZIOTd5Z3RYdDdKdTBkeDlHZkxU?=
 =?utf-8?B?cGluZkxKa1JaR3Z5K0REV3kydGRkUDlBMWl4cys5UUo3dXo0aVk3QTd0YlhJ?=
 =?utf-8?B?QkloSHRibUF6cWhjdU5LZ0l3bm41WGZDUTU1VmNaUCtWWDJQRFYrSVplMDV4?=
 =?utf-8?B?ZXBZVGZ6SEw4dlFVdHpESzN3bnE5d0pEMEN6a2xuK0tLNmUxWlkyYm8zSDdl?=
 =?utf-8?B?ZDg5RzRocTV1eHB4OGJEd2o2UG1KV3hEaU1pKzlVRDBla2ZDQ3QxcWFnRHNR?=
 =?utf-8?B?YXl2SThqY3JzTElIa25nS2hZWVBReTUxUVFobzB4Nk1mb09TS0NUcGtlOWpJ?=
 =?utf-8?B?ODQwb2YwZE52NFhzNkt4NXpWUGpvRXA4UUNZVkdCTjJ2ZDhTTHdhelBXNWVE?=
 =?utf-8?B?K1c2RjhLelo3djJZcHh0dGYyKzNjZXNISHdqRENVYXdFZitaS0xuSlNqNWZ2?=
 =?utf-8?B?ckZXbXU2QVZKVzdWbnV3OVU3ZUc3L0l4WTVtQWxMRmpJb2k0QXJaLzI4azN1?=
 =?utf-8?B?TUdGNDQ3ODVKbDQvUHlwSXZLNFhEU1JTVEFIVkpvdjBmTlhIeUFCUUk3QVZI?=
 =?utf-8?B?NWtKbGZDWkN1d3dDYUpTdVVoZ3labkk3OXZHTEZxTXpsQjBLTWFqaENEdXhi?=
 =?utf-8?B?NVpqTCsyQVJLNEJtTlQ5MC9TK2ZkVUVzTGcvWVRvc2ttRDFhTStqbDhOZUdq?=
 =?utf-8?B?aWpnYlRDQ1BFUlMzRU1lclU3Kzgwa0lCVzVzd1htWlNQZklycytzWmhxUDYr?=
 =?utf-8?B?dEsyU3ZGaG84QlFaY08rOWY2dm90MnRBeGM1YkN6eVpVaFF4aDI0NlpjVzI4?=
 =?utf-8?B?Y1NDU2F6bStUbzBtRXlvcnk3QWlLd3lMc2xEdkZ0WmFwTzk1Ykk2eHlPSVV6?=
 =?utf-8?B?MldsWGJ6N3VETndyRjdtUXNXdTFLQTFtaUl2bDc1VHc4OE5RQnFGcHlPSzBE?=
 =?utf-8?B?T0o3YkkrT0JQK2l6U05KTlYyVmw0NzBWNnZTY2EySVM0dTdaaWs3RVpBRVpZ?=
 =?utf-8?B?TjJZZUFtWUFNM0lCSFU0YUhBVHVPMEtFaG5NelM1MlFHV0ZySWxjNUZrS2VF?=
 =?utf-8?B?VzZUSzVhUi8xdGl6dTNtanBQTVVnc2cwTlVzcmQ4UmtZRVpNeXRLL05nYndS?=
 =?utf-8?B?OFhuVUNWSVdXVjdPV3dHcXIzRlRmZy9nNE5wUk5DSzVDVGtvVFJtQUpCT3hU?=
 =?utf-8?B?QjhTdXdBQkVHc3dqbXNwclArQmxFVTVyUGV2WVFhTWZ3UVVtQ0dGRFc5Y2F1?=
 =?utf-8?B?eVVHT2ZLZUUvcUF3NXFMLzNsZlNtMEY4eHdib2xzRjltZDdFQWtWZnZEbWFG?=
 =?utf-8?B?Tml2MkNpT09FUDhkQi9EbXRyRFVRY2loS0daZnBVWWxidnZsV21tbTZkbnZh?=
 =?utf-8?B?UnB4WUgwODYreitwbzJtOHM3aWFubnhqMmhWVmxDa1pXT2FxbHlRYXVRREpW?=
 =?utf-8?B?YWN1aWpzOFpaNzZweTFRbVEreDlqdnI5WkdOZ3lSZUJJd3FuMlF0ZFhVdjJB?=
 =?utf-8?B?NEFMMmhqMVpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEN0SjFEekMwNDNjMUFDWVRxSnJKa1dTSnNORWtmT2VKN2d1MXZGK0FkRmJT?=
 =?utf-8?B?a2V5d2JleUxxeWpYd2xZOUxlRUk5dlZWcmNCNWVPcnVXdFJobHNLU0dZTzN3?=
 =?utf-8?B?WjJvNytkbWVKZllubFZLYnlzOUVjR0VtVFFuK2Y1WmxrZTUwZTArOE93d0N4?=
 =?utf-8?B?cWdHYkYwem1wTW82Tjl2ZTB2clFjNFhsbE0wU3dkMEhkNEoxSmR5MVpNdHFX?=
 =?utf-8?B?OHN5WGJWNXFuQ2p0RndZTW9FMTBvdm9aNjZCNDFjeFBBeEU1a2ZnemYwY21z?=
 =?utf-8?B?R3FxekhsRmFPQjJJbjAwd0YreFlrdTBiUkRCSldRaC9vNnBzV2tQc2hMYkNy?=
 =?utf-8?B?VTRmblEyWEkrUGlFNHdaRnVUTE1iOXFIbmtMQ2orTHY1bEpqaW4xMVlwSjFn?=
 =?utf-8?B?MUxoNE45QVNHS0lqSkNRWkhVKy9uU1prQ3crZ1hFRlRFTzJ1QmZaNFFFcXVq?=
 =?utf-8?B?dTZuWnJpWTFOUG5jUnRDVjdOZDIvL3ZFaFErUTBpbGtLWnExeDN2NDdYWnRU?=
 =?utf-8?B?VWJUaUcxRjVNbzYzOHZ1WnJHaThYLytQWWM4OG5Jc0VHRzZRMlpiSjVrSEo3?=
 =?utf-8?B?cTJPTEVIY1hRWWxRWlBScDE4NnNCdlRlRC85VnhTdnlRSnE1andTV2dMNEJp?=
 =?utf-8?B?eG0vbXZzaFcxVGRIald3RFBpWHFzTUVXK1VPWHlvSEFrSnpJdjJwQklEQWU1?=
 =?utf-8?B?czk4R1ZGcjY3cndKdlN6OU4vckJZWW5FNWhydUFjM1FDdGxYVkl0WXlvU3g1?=
 =?utf-8?B?d2JENVFTSElaVkNaR3hldkpPempxTTRyZ0ZPaFVBSVJwbXIwQzBWeDF0Mmor?=
 =?utf-8?B?UGU5bnVZdWRCSUdUakJZVzhFMkI3RmtRZno2V2lnVWdIQmNrMld1eTVJOXFm?=
 =?utf-8?B?ZHpQU3ZiVEdaT3JBcVZyV3RRdlNHTzVBTWJGWUxIWW1HZnZmdFBIdDM3emdz?=
 =?utf-8?B?YzVhYzBuNERDeGdyWm1FaURva21LcDVQZ3B5MUdBRktnVUR5Z3gyd2tBcHds?=
 =?utf-8?B?cGVLclpaQ3RtaStyRHJrYUdKdjVEc0dRSzJQb2pMS293eUpiUThmKzN0NkhB?=
 =?utf-8?B?eXc1MEtjNUZnN2ZkOEF5ZXYrbXBrQXdEZDlPVFBXSFJuSTkvWlNtVVVUQTVz?=
 =?utf-8?B?NU44Y1M4NjViaTZLOElONjM4Z21JMTM5ang1NUs0VGRZSHhtYzJsTWhwR0Zr?=
 =?utf-8?B?Z2U5NkgwZWxSanV6c095TDJ1elZuMkhUOXBDbWFLL2lYeEdFL0VrNitnaXBB?=
 =?utf-8?B?dU5GWVFuQ0pMT1VGZlZET0dIbkZKbklJZ2pxZWQ5aHAzRU5Fem9XdkU3STRI?=
 =?utf-8?B?RVQ1UWRQblIvYnZnNDdQdXQ5cTRqbTV1UG1pRUxvbjJnaDdoRWZxeVd6V0JJ?=
 =?utf-8?B?c0xCSDRQbGY2ajEra0dndHYrak5JWEkrRitOWURkdlVtbzgyM1Q5Smo3aVV6?=
 =?utf-8?B?R3JDdlVIVlNra3kzYnVXeWZQdkJMWG82N2dEMk02SXVkVnBpS09VdE1NYXdt?=
 =?utf-8?B?clFsRWQ2ekV4eWVjOHZaM1h2ZFlNL2RJY1pEN2lySWlCUURpemFJNUd5Uzh5?=
 =?utf-8?B?SE9FUjhQcTR6bDduQU1ScU9MWUl1dURMd0hhb214ZnlMa1psNVVOVnhzYmJr?=
 =?utf-8?B?S2JOZGRXeG5zWGZkU0pnZHpJOExPVHNXbXBJOWNVZEpnR3daWmVURG52QjRZ?=
 =?utf-8?B?ZytqRWpPWW1YRHZabWZwa1pUVUpBQ1ZiQ0hWc09hU0pmMUlEbGhTT0gweFZk?=
 =?utf-8?B?dUJQdk00dTVzMXFIRGxVbUFzckZvZ2tlY0F0V3ZxcGZrTWlxVFVTUDhlUUdC?=
 =?utf-8?B?QnY4NnV2dU9NZjk3U2JnRXhnM1pDREkwQkp6bDh3cWV2c2FHYzcxTnE2TzZN?=
 =?utf-8?B?OHZ4Y290RWhZUk40NjlOV0RpZ1FTNm9tYjRUSzcveDZ1WTUwekRpaFJKaS9u?=
 =?utf-8?B?b0RLR3BoL2podVk2MGg3elk5YmRjbU5IOGI4MkRjNDZ1SjY1bi9icXMrNVp0?=
 =?utf-8?B?VXEwZEliZlNIaWI3UFF4K1MwSTR2MzVna1VVaHdPTSt6NkZwWlhma1Q4UlFZ?=
 =?utf-8?B?VUxwS2Jaa1MyVjdkOGVHM0R4bFdhUnhrN1JLUElDbGRpSkwra0JMRHR4bEp5?=
 =?utf-8?Q?PmZUbX86LDpjoz5UtA3RVnf4x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a820f5-f62f-4def-760f-08de3421e53f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 17:15:31.9199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: In7rAr4uruclHhHXPkmYa045UanpVOdSlhtgwRlex5mhV2UZj1aYOag07Q1mDsuYHW9GenhVfQ4PwTq7Rscp9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6662
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

Hi John,

On 12/3/2025 12:59 AM, John Hubbard wrote:
> +    ///
> +    /// This version takes pre-extracted signatures and FMC image data.
> +    /// Used when signatures are extracted separately from the full ELF file.
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn boot_gsp_fmc_with_signatures(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        chipset: crate::gpu::Chipset,
> +        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
> +        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
> +        total_reserved_size: u64,
> +        resume: bool,
> +        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
> +        signatures: &FmcSignatures,
> +    ) -> Result<()> {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);

I see lots of dev_dbg left as you also pointed. I guess you will remove these as
we discussed in the other thread.

> +
> +        // Build FSP Chain of Trust message
> +        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
> +        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
> +        let frts_offset = if !resume {
> +            let mut frts_reserved_size = if chipset.needs_large_reserved_mem() {
> +                0x220000 // heap_size_non_wpr for Hopper/Blackwell+

Can we please use constants for the magic numbers? Also with comment headers
clearly documenting the constants where they are defined.

> +            } else {
> +                total_reserved_size
> +            };
> +
> +            // Add PMU reserved size
> +            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<0x200000>())
> +                .unwrap_or(frts_reserved_size)
> +        } else {
> +            0
> +        };
> +        let frts_size = if !resume { 0x100000 } else { 0 }; // 1MB FRTS size


Should use SZ_ constants, here and everywhere. Like SZ_1M etc [1].

[1] https://rust.docs.kernel.org/src/kernel/sizes.rs.html

> +
> +        // Build the FSP message
> +        let msg = KBox::new(
> +            FspMessage {
> +                mctp_header: (mctp::HEADER_SOM << 31)
> +                    | (mctp::HEADER_EOM << 30)
> +                    | (mctp::HEADER_SEID << 16)
> +                    | (mctp::HEADER_SEQ << 28),
> +
> +                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
> +                    | (mctp::VENDOR_ID_NV << 8)
> +                    | (mctp::NVDM_TYPE_COT << 24),
> +
> +                cot: NvdmPayloadCot {
> +                    version: FSP_COT_VERSION,
> +                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
> +                    gsp_fmc_sysmem_offset: fmc_addr,
> +                    frts_sysmem_offset: 0,
> +                    frts_sysmem_size: 0,
> +                    frts_vidmem_offset: frts_offset,
> +                    frts_vidmem_size: frts_size,
> +                    hash384: signatures.hash384,
> +                    public_key: signatures.public_key,
> +                    signature: signatures.signature,
> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
> +                },
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        // Convert message to bytes for sending
> +        let msg_bytes = msg.as_bytes();
> +
> +        dev_dbg!(
> +            dev,
> +            "FSP COT Message:\n  size={} bytes\n  fmc_addr={:#x}\n  boot_params={:#x}\n  \
> +             frts_offset={:#x}\n  frts_size={:#x}\n",
> +            msg_bytes.len(),
> +            fmc_addr,
> +            fmc_boot_params_addr,
> +            frts_offset,
> +            frts_size
> +        );
> +
> +        // Send COT message to FSP and wait for response
> +        Self::send_sync_fsp(dev, bar, fsp_falcon, mctp::NVDM_TYPE_COT, msg_bytes)?;

This seems to diverge from the pattern we use in GSP `cmdq`. Can we keep it
consistent, like `send_sync_fsp<M>` ?

    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
    where
        M: CommandToGsp,

Alistair/Alex may have more design suggestions since they came up with this
pattern. Especially around safety (guarantees that the part of buffer being read
will not be modified by HW etc).

Over all, I feel we have 3 different mechanisms now (1 upstream, 2 in the
works). The GSP cmdq, RM control and then this one. It would be good to get some
consistency in the API designs for all these different mechanisms (and possibly
share any common code).

Thanks!

 - Joel




