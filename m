Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE8B1A0AC
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 13:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D95210E1B2;
	Mon,  4 Aug 2025 11:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="A3oPvh1m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68EC310E1B2
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 11:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wudor25qE6BlLyoQuMYeyiqb9bANqZlTpZYP+O04q9lb96isJXp/apARA8ceKh9ZLjKbncZHVN6Pi7Co2Rsveu/QLWPkTRxUsmGY37Kuo6Ku7iG0mn9o0hHr6Man1NasYdo3us/Ka6fTUxwRXLDHYnsnzPm2fzPVCWSeC+gQIGvdZdFjQGJJBawoSmTSRDe2SVNrFP/TFJL+3nzTQWuAT5I9yrZP3PTnsJ3CaCFC4CSkkU4CdKtb3FKRJ+/M0wOKJHK7I1r9r/Z8/v5POs/IvNeOAWtxvCllfokrQ5NvMvDIbduoaJzyxH9rtIYt+5fKU802HdeJHvTq051GEyFtiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8XV5+wNpnd2bfyJ1Z4cj2LIIvmcjGvnZDH4ts7JMgY=;
 b=Gws2uNRFrZzq+rFLAzglTaxhFXdx05alKV8dQU8j/d+1/eaKXAAXSnMdn80qfjZS2C6B98vBwTZHVtiGCpLNAsfcdgBv7JDLadQRFy3q0ltvlLH/SMtGj9e3Vmlbk5KR4GnBLi11erMxdahgeXGnP/eaySRMrWifDjiwmtd09LCqYHXms1dZI3W0dIygFVrwzILb+kgprankeIGcjr58PjFwjvmbpDQKJMpwot9eR3+LreNV6pEkA1YY4A/zIRmR3v9mIUHlWEIoz4w+giFz8Dhkra5rQIPL1QDIzSDKFlT7ZLpgSkApJ4u0JJJ8wzwqUsCyn6ADkv96daDipQjt2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8XV5+wNpnd2bfyJ1Z4cj2LIIvmcjGvnZDH4ts7JMgY=;
 b=A3oPvh1mSPuIiSoobHtAuqzbg8JbnZQuYeKG2apClsIti3IRn2rUeOJtUpgZk2hJpADHcGEAFLsgOMWzzsG8wm79EJyIae0nuKFgOYD4R39uIcVD0wsk3u5n+9Bc2jGB4ZX9JpRBQZdJbIap1DRmRDGQ+wnHKhDEghDNUWEbL3HuVkIf37GFlBg8VAtwqu11Ihb5ojaiovFdW0BcAwUQIN+ncFtP4M/T6c1VNZbkYixpm+EYtebR+Zh+WnBOz1APs/p8O6M9ZCaDmdCL2nb5oks/pM/4i9/hlqblZcbdhAyf1LJxRvKB7GUw457z1o4rEByLI07F3e0L5iXVoOeHPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Mon, 4 Aug
 2025 11:45:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 11:45:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/4] rust: add `Alignment` type
Date: Mon, 04 Aug 2025 20:45:23 +0900
Message-Id: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFOdkGgC/1XMwQ6CMBAE0F8he7ZmWxTEk/9BOOB2kT3QmlYaD
 em/W7l5fJOZ2SByEI5wrTYInCSKdwXmUAHNo3uwElsMBs0ZG4PKrYvqToUXTWiohdJ8Bp7kvb/
 0Q/Es8eXDZz9N+pf+75NWqFqm2tbTHRvqbi6JlfFIfoEh5/wF1/x+XJcAAAA=
X-Change-ID: 20250620-num-9420281c02c7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0338.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dfadd1d-7513-48ca-c360-08ddd34c6bce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0NzbE9HY1lheTJGUjBraTlxQXpBNEluQUZjcWJ4Z3UyTlU1RzdVRHRMMzZo?=
 =?utf-8?B?bkRLU2xENjU0Q3g2OVIwckVoL2RrN3Q4Z05DOFRBQkQzTGN6S1pPbDBnVU5I?=
 =?utf-8?B?Z01XYVB2SmtsRk4zdlZxOGc2R0RvV0lnOVlJbkt1QitqNGk0UW5sbEpic1RC?=
 =?utf-8?B?NHVyOGxhL0ZpL3Nnam52am9PbEU3dE5Zbm5YVHBsY0cwNmMxUGFKcXlWTmlv?=
 =?utf-8?B?bWFlSHpLaExLLzhJekZLZVI4MjE3dUUrMjM0VDhQT2RpYXRHNmVwOXdJbnd4?=
 =?utf-8?B?SXNPTDUvVUxpb084Z3dJU2g2aVpnYVN3YTdnRnphR0ViVjhpclZ3bWhVekNK?=
 =?utf-8?B?UTJHTzVmcEZZSFkwVU92R1J2NXROVWZ3cStvSE5qdEI3T29rV1BTSUFQVUEr?=
 =?utf-8?B?Z1BXNGxUNDFqVWVMSDhiVmFqMVdka3J2d1AwWkVRU1lSOG9FNnlUdVowUVZo?=
 =?utf-8?B?MDh5K1E2RjhRdUZ5eUxzaVdCaWNRb2VsN0tMVzhYbzU3VjkrQU4vN0ErWkUy?=
 =?utf-8?B?dHJmekpBRVVJRGo4d0xueU5SODdGK0IwbHpCS2ZJNjlob3VRN2VrYVFHbnFQ?=
 =?utf-8?B?dHRjY0lDRzlQYSt4WGJnUGpFY3ZhTU5odmlUbHY3cmIvbTk1Q3BXQXo3TnZ6?=
 =?utf-8?B?M2FIdmNReTNiYmhlbWFWNTRPUDRLZ00yNDhMOUVZd0JxdEk2dmIwUGl0cmFh?=
 =?utf-8?B?dkx4UkszcVRPclNkc2dZLy92bzcxd0JkMnRkU1hzNG5wSk9zZm42ZjJqdTJi?=
 =?utf-8?B?QWkwKzFjdVAybWthYi9NRUtobnRQZ1J5eWhjSUJHV29NeDlwckNhSnhWWml0?=
 =?utf-8?B?Yy83L3R6SkI5YUwwckk1eGpPbG53UzRiMFNWZVhKSXV2aTJyaHBVRmVnT25l?=
 =?utf-8?B?b3hhR1RtZWp1UzBycDYwVTJ3TWxlUXkwQUJFY254WkR6c1lsUGxRbjBIRFFE?=
 =?utf-8?B?Y3dIYTVkQjM1L1F6cGZseDZrckhUWGtnYytweHBWaVBvM2dxT2cxTmgxdXp0?=
 =?utf-8?B?NWFIUW5VQWpBQm4zSUtBdGM4SjZxeXQwc09UUEEyY3g3cnlBRml2dnM4L1J5?=
 =?utf-8?B?TTRkd3AzaUtuWFRPMHNBcU9lWDNmeFkvVU9wUUplNnJrWFcvaGRMelZsMFl0?=
 =?utf-8?B?aU9jbmE0VjR4M2E4STZUYXZ6VFNYb0YxREhzNTB4YTFHSXYra2ZuUmlZZGpL?=
 =?utf-8?B?bVljZEUwcHlOTGUxOXNKTlFpT3docVZpQjh6K0tHS3p4Zk1iUmRmMnRXdzRq?=
 =?utf-8?B?bEJObzN3QWlvbFJNMDFCbUFYOUdEOWpENHlxSDdkcEZpb1Y5OEFvR3FodURO?=
 =?utf-8?B?M1F3OGtzZ1lIMVhoeWlaMTAzUTA2M05XNFpUbWJaR1R3WVRrdWlKZ1hST25B?=
 =?utf-8?B?elY2citqSmxZZVFTbnF2NFB2UjZYV2kwMHptZ1N5U2hkTVZTa2EzNW01WDhm?=
 =?utf-8?B?ZGdWaS91YUFGRTdueFpLZDl5Y1dCVmhhVHVhSmh4OWhkWGFyMDd0YXUvMlpB?=
 =?utf-8?B?WVhiRGNVcUpuQ3kwQ3Uxc2ZlYjZObmV1cm9GQTlURUdEMDFLdEFmYWMxMGdl?=
 =?utf-8?B?dk8vMWRwZUQ4WWJzK1ByRnZRRjllQURndHJCbmFnS2dlbmhUQmpZRWR2RGYw?=
 =?utf-8?B?TElDVGdybFVkM0g5TUp5cDQyMGFBQy9TRHd4Yk5FUmIwTjJIZmdDempOV3Q3?=
 =?utf-8?B?a1VxY09xS3QxWVBHZFdQV2RIY05CQ2xXODF1cmFEaWV0UUFDVWJveUNManpj?=
 =?utf-8?B?akExOThGQ08xTFZBZ2tiaWhWd2pVR1dQR0ErTU5uTGYvWDFKRGxpK2ZxNTRq?=
 =?utf-8?B?T3R1SUtEaldOSEgzN1Fxb2hQWDNDQ0FQRk1obTV3RmFhT2dkZmNUS0VvOFZs?=
 =?utf-8?B?dzFRQ0ZyNzkrTGVEUEpvOVVqc0VRWDF0SzZOaGxUTHJUa3Yvc1ZiNnJpRzF2?=
 =?utf-8?B?bFRLNHBsbEZ6UGUwUU1TTU5xOXBZSTBzLzRNUjRvSGNKRGVTTVNOeEFUTEFi?=
 =?utf-8?Q?BZx2UM1TzfZKH5fAalm1k/Di/KY75s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VWclk2MllVRmFXVEFGRVRtcDJ1RmhoLzRRNzRkMmVxQ0dvclFoblFkY1l0?=
 =?utf-8?B?NjBKMzB4azcrRzVqNDA3ZGFrc0svME4xeTBPMTl4N21BQ3poY09XQmR5Nm0y?=
 =?utf-8?B?ajV1UTVpZWtHcFk4UlkxVVBwbURzUkpzWUxPejBOVk1obk1PV29hVVRCeUVx?=
 =?utf-8?B?bHBtNVlvZFM3T1RBSmErczdIemhFczdPNDBnenJKekFHeUwwWkUxL3FlVVM2?=
 =?utf-8?B?Z1dlVmVESnhyS3FpY1p6VzgxeGpsWmFXRzNsSWU2QlYwQ0lHMTF4b0lPS0dY?=
 =?utf-8?B?OGdRQTBRUFlXV0ZHYitzQVI3MjhXajJxUExxdmJ1eTBWY05HcjRwZ2I5TGF3?=
 =?utf-8?B?bU9VeDI2bXlpUkh6bkNOS1RBZlJuQWViYXBwZnlONjM3ZExERmpvQm9oWkFp?=
 =?utf-8?B?elhLbVNJWlFVR3dTRVdQQXZGbUFJMC9LWEw1c2c5THArLzdZVVI2ZENHbmZo?=
 =?utf-8?B?VEFoVm5JTWg4dDVIRjRaWFlDOXRHQXRZUEFOcnpieC9zdGJHMUFGL2tRWnhJ?=
 =?utf-8?B?dmt0UmxCbUl3TjVObnV1MHpadEcxRVI1MGJjcUp5dDc4VG8zV1NUQjFDREw5?=
 =?utf-8?B?OEJGQk1XT1FXdkhzZzVEQ0VoaXlnM2hQeVFHcFROLzlPRkxYYmROU2htb0Zh?=
 =?utf-8?B?dlJWcHBpcEs2ZnVQOVJSTFJsSE5tNWREYVhmSExjV0ttSlJMc3M1QzhFSGZO?=
 =?utf-8?B?L2tCV3NtMW84RkNQSWdwWnhmcXNRNkJNWUJXclAxa25RL0hPUEcrRjFXTkNr?=
 =?utf-8?B?bjY5U254Wmp6TCtMTTk3TUc3Mkw5K0FLeHo4eUMrVHNvL25XNm50QmJ3b2k4?=
 =?utf-8?B?cEtRUjBFZUIxd0xNWmJGT1VDTHFacWJYbUE3MkdxUG5NcStyMjRlTDlicWNv?=
 =?utf-8?B?dm9OKzJnRkFMeUZERGtmazhKOWp4eGtiODJmNDVqYjc0L2JOV1hzWXpTenNM?=
 =?utf-8?B?d0ZtaGFrcmVhOFF5M1gxNVhIQ0RwN29YMStiNm9yQUpuMVlYbWttRExlb0x3?=
 =?utf-8?B?Z2JCWnhXY3hCS1k0Q29oUmpMNGU0UWVzdlQrcnZIRE8vVGRvZlViTjRwTXRW?=
 =?utf-8?B?anBmQmdyQ1RrYjFza203aHE3TmczL1owV3AvTUpRTHVDK0lrYjB4enB1ZndF?=
 =?utf-8?B?bG5kNGNIVUdlUTBMdEFJamE4K3N3bVVsTGtHbGFQMlRpMmZkV2VvZlFNOG1K?=
 =?utf-8?B?aTRvM1hudDFORkdnREtIcWYrWUtlL2tnNGgxOTF6T0t0VHJUckdEeUxWVVJs?=
 =?utf-8?B?MWZZdkFvTFIxTUU4Y2ZUT2V4Zk5OSUNsU0IxbnMwTWRuWk9Qa1M0a0xKZjJT?=
 =?utf-8?B?WXBwZG9QWGF2QnVuUVNBTm01WGlOMVJGR04raVBjV1ZjTkRKT1VLU3BnS2k2?=
 =?utf-8?B?WTMzakhOaERqWkFUZUJkK0l3S2pvMFBBbVBlMG9UUkc2Q3NxOTVlSWUvNXFm?=
 =?utf-8?B?Ujl4ZkY5M29FSDlNRWprVzJsL1IwOEVDUEJZWmxZOGJJVElIMGRjc3dWK2gv?=
 =?utf-8?B?eUppTXROaW1YWXJQKzVma200bWIzWGxRelF3VXJSNVhCNWxiM1lNNFdXNW1s?=
 =?utf-8?B?RytqaEVWL0VKRCtKaWU2L01Od0YxVTBJdUk2Q2dmKy9Ba1ZQV2s5ZDNBcElM?=
 =?utf-8?B?Umd6R1kvS2xWOVd5K2dIaFl4cFM4TkUwd2N6NU4xTmhWV0FhZWg0SWFpUFN5?=
 =?utf-8?B?b29aUS9INExNS0FqUDhVNWxnb2VnSEJTQVBEOVJtZzE2Qi9MZjNOM1RrYWZj?=
 =?utf-8?B?Z0dRR1FkQnNPTlU2dlR6Wi9yMFB0YzBIcHdPeWtPMGNEL1g1VFhzYWd1VGFw?=
 =?utf-8?B?WGZBZjQ3VDZPOTJ5R0liNElVMVlRamJUVVEzb3Y4Qm1KOWdsUGE4bm1ZOHhZ?=
 =?utf-8?B?akNpc051QzNSZW9TejFSQ0lOOHAwbGtmdFB2dXg5bWt0Y1l3VHdOWFZxcVJ3?=
 =?utf-8?B?S2k0VXBhOWR4RTRZNk0rN2E3SjI5RFN4eGlnd25nVVdxeFlLTFdlbFFUcGlj?=
 =?utf-8?B?K3R0d0pFbEV2OUZUY2tFY0h1STRsRW1INkxuNVNTNWZCVUlLOXJXZ2V2SElF?=
 =?utf-8?B?VUtKT1NqWjdXUHV4a1JXNk0waFpsaHJLUzgvVE5tejlhMUxPcW02Z01aQ29s?=
 =?utf-8?B?dHdzY1IzYm1jbHpXeHdDMkQwd2wrYW9Bc0drZG1pYXZveUQxYW94UmNjN0pT?=
 =?utf-8?Q?vBNd82pBeAYQd4GEFQ2wK58UhC8RgJ73IH7xAbuwR5j/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dfadd1d-7513-48ca-c360-08ddd34c6bce
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 11:45:33.9151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKEFKhjtA6A8Qly98SGb9qBYnWmNB7oNv6I3UmWHl4Wh8Hx8XlkJRnH/L5uyBXDlpjic7wtBqn+vsxfLYsue7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8841
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

After some discussions on the list [1] and the Rust libs team [2], this
patchset undergoes two major changes:

- The `PowerOfTwo` type is replaced by `Alignment`, which is heavily
  inspired by the nightly type of the same name in the standard library
  [3].
- The `last_set_bit` function is dropped, with the recommendation to use
  the standard library's `checked_ilog2` which does essentially the same
  thing.

The upstream `Alignment` is more constrained than the `PowerOfTwo` of
the last revision: it uses `usize` internally instead of a generic
value, and does not provide `align_down` or `align_up` methods.

These two shortcomings come together very nicely to gift us with a nice
headache: we need to align values potentially larger than `usize`, thus
need to make `align_down` and `align_up` generic. The generic parameter
needs to be constrained on the operations used to perform the alignment
(e.g. `BitAnd`, `Not`, etc) and there is one essential operation for
which no trait exists in the standard library: `checked_add`. Thus the
first patch of this series introduces a trait for it in the `num` module
and implements it for all integer types. I suspect we will need
something alongside these lines for other purposes anyway, and probably
other traits too.

This generic nature also restricts these methods to being non-const,
unfortunately. I have tried to implement them as macros instead, but
quickly hit a wall due to the inability to convert `Alignment`'s `usize`
into the type of the value to align.

So here it is, not perfect but the need for a standard way to align is
starting to become more pressing.

[1] https://lore.kernel.org/rust-for-linux/DBTGVEJQOUDM.OTGZ6PXLB9JV@nvidia.com/T/#m09e068ecadf5b41099d4c6c55e13fbb3a98c5839
[2] https://github.com/rust-lang/libs-team/issues/631
[3] https://doc.rust-lang.org/std/ptr/struct.Alignment.html

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Fix indentation of paste! in impl_last_set_bit.
- Link to v1: https://lore.kernel.org/r/20250620-num-v1-0-7ec3d3fb06c9@nvidia.com

Changes since split from the nova-core series:
- Rename `fls` to `last_set_bit`,
- Generate per-type doctests,
- Add invariants section to `PowerOfTwo`.
- Do not use reference to `self` in `PowerOfTwo` methods since it
  implements `Copy`,
  - Use #[derive] where possible instead of implementing traits
    manually,
    - Remove `Deref` and `Borrow` implementations.

---
Alexandre Courbot (4):
      rust: add `CheckedAdd` trait
      rust: add `Alignment` type
      gpu: nova-core: use Alignment for alignment-related operations
      gpu: nova-core: use `checked_ilog2` to emulate `fls`

 Documentation/gpu/nova/core/todo.rst      |  15 ---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   4 +-
 drivers/gpu/nova-core/fb.rs               |   6 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   |  11 +-
 drivers/gpu/nova-core/vbios.rs            |   4 +-
 rust/kernel/lib.rs                        |   2 +
 rust/kernel/num.rs                        |  28 ++++
 rust/kernel/ptr.rs                        | 213 ++++++++++++++++++++++++++++++
 8 files changed, 255 insertions(+), 28 deletions(-)
---
base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
change-id: 20250620-num-9420281c02c7

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

