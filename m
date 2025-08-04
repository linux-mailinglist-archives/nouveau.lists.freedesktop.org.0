Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA58DB1A0AD
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 13:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B4410E43F;
	Mon,  4 Aug 2025 11:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V3FBFGNc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46FE10E43F
 for <nouveau@lists.freedesktop.org>; Mon,  4 Aug 2025 11:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVxRxRtbqNHLgaidvNJQynTAV16Vo5yXJMCpV1H9sjh5ucAC8E+GlXZtYOg6Crinpqtub8oL1uY+v8l7bvOuVISrehZvfotsBgf9vMsEoywFDWgiIYAM9gtp4gyJ5FfvDX3uLWKlYNa5DMiaOb7O7W+aZfPDf6sQFlv5U7ScAZyaCLRSJ+wPLcriPARpA/7z9aYdiuogjzlb3IOUavSXhbKuV9I5TfMabPO3rX2mkiawbCti10kp7hZ0T6qwc76HdjAMrEDaL/ZX8LCfJGxERghKBjlrvEMNCcvQ+TFlw0WdvXVuCiz/kSJKwBGf/+uPB+ULmzq5TgIp8Ig5SkKcEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LPEcQuZicKVeWHahCDoSbvKUGTG6T8K7EQK7lB8xwk=;
 b=ZzyZOl20MpYfgMDISvW5F/j+Ret2oZIi3GP7YWhIohs+Xvfb4/tcqyg2q/myxZfFInGEJoGNY/qxKFd/DIDPFew8iSYUrOv87IYRhkiLWmad/eIRjyUXyWH3Ypl92TGiReYZznEVFXbuq7MEbdY5Hluk4Z1IPLHVEpg0p5aYjWSLQdwYs/BdKHfAETEI8EJVxVBAqFZZq9G4i3NYt0DSnE+4ThmWLQ8uajSg3eFchxiQuM5E6cGXyaxKtju7jJ5Rc0wZWut7tSeXKKw0RrD7+JSjHvD3NtKgTDoXUUCw4qAZy5qGDN8rYpBVDvmudY+9TknPcaU7hk7KPON2vHFyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LPEcQuZicKVeWHahCDoSbvKUGTG6T8K7EQK7lB8xwk=;
 b=V3FBFGNcB0rENxcvewD269toQ2gUgp05Jj1qZ0sBOw60ET0Wv1g0Mvi4uJq5h06qQ77avvrhXFd9C/pk3FZvHCpSD10vCfb3iXUPWq1VcpvcsSADtvnVK86FJcVE5x+mRvUG8wbObGWno5lRZ3qqBLzz62VeHkLRtIqHKsfgJHx2extsm79O53ZYXZiTbJ39VqKdnc/C+pjzsCIytGJ5S24VbOjyt+AU5g69tE87pKZMyp/y58EW3coKicPe2vBRtw6mGXn71fnw0H25dM5iz9nfybKjLDEJQW8rqpTGuxg4Qrt8Hpuc3eqI6jT6D8b37kGnKdFotZfDpEbPsh7D0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8841.namprd12.prod.outlook.com (2603:10b6:806:376::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Mon, 4 Aug
 2025 11:45:38 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 11:45:37 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 04 Aug 2025 20:45:24 +0900
Subject: [PATCH v2 1/4] rust: add `CheckedAdd` trait
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-num-v2-1-a96b9ca6eb02@nvidia.com>
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
In-Reply-To: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: a616c347-d5ea-44ed-22b9-08ddd34c6dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGVpYzRkeW5iN2ZLTGdZWUNuYVlTZyt2QW5wTlVLMkdTQkNGN3A3MVJOWHgz?=
 =?utf-8?B?NVRoMGNOL09wVnZPTHViQldtYUYzL2ZWekxHV1U1VGJIcGQwazMyS0ltdTU3?=
 =?utf-8?B?OGVhTHB1Zk9rREh3dkhKNnhBYkIwUnNSREFVajRENE9JTWRwY3NpbTB5cVBi?=
 =?utf-8?B?eVFwL244VzIxUUdtOTA5b0IwZGNCM01Jc3Fjcm5lMWRNSGNUcmpYZ1JtcGZl?=
 =?utf-8?B?TW81WGtWZGJTdUd5b3piYlNjTzlxRHdGaUhqNTByQWJPaWxKQjRqZW0zTnVH?=
 =?utf-8?B?K09xYXJHbC93aUMyK01McXBYNnphY0p3bHB4K291cFZNVHNhVW9XeVV2Qy9Q?=
 =?utf-8?B?ZWp1MHZ3dk9mMzJyYlh3QTBrb1gzQXJqM2hMdDhRdzNSQ21BdjFKSFV1eGRR?=
 =?utf-8?B?aGFIWjRyWk1pSkVUdzB3Nk9uYXB0Z0trSXFNdjR3NkR2ODNOZHlNUDdpb1hu?=
 =?utf-8?B?LzBxNGt3d2dadzRjbnVHTGhIeGQzOVBhTy80dVFQZ0tUd0ZEaXVCa2d2aHdo?=
 =?utf-8?B?QjVvVzBmaW9na1J1USs4MktNaGtHTTRlL1F0ZG5ucnNJdmRjNmdmcXltZnk0?=
 =?utf-8?B?cmJMZFVCR0UxU0FLQjFFNCt2T0R1KytORXlPby8vQkZGZDlkaERZVXN0bnRp?=
 =?utf-8?B?eldkenhVdG9rMU52RFNoSGhmanBKcTJJbzducU1odmExMFVZcHNzeUx0TkFh?=
 =?utf-8?B?aG1ML2MrZHJ5K3FMLzlib1RoVWZWcnI0KzhLZlhraEdGMDlZM3hRL3Z1OUk0?=
 =?utf-8?B?VUFiMHY4MmdJbDk5b0Rzd3loMjFNV2g1eVhxRmRjL3p3RzZZaU9ITnNtY1Zw?=
 =?utf-8?B?WlRzMXhmbm9sdHdLOEdoazBpd1pad1Q2SXFtOUI3eXprMlJzdU9pLzdnRUtt?=
 =?utf-8?B?RDJMUWNxTEJoVWdhQ2xTT2gwWHcwWDBGUG50MVA3T0puNGt3c0RFR01ubGd5?=
 =?utf-8?B?UVo1TDQ4bzhuYmhNVTdEM0pQTnlmTmJoZlMycnJ4dEJVcnVEWUNPSFRnWHp1?=
 =?utf-8?B?aGljeTNwQWdLMmljNmluYnlCZk5yM1kzZ3owbkY4WHk3WWRPWWxJejgrRUY0?=
 =?utf-8?B?NEFKV2dOY3ZGNFJIQzgzdEQ4Um5ObmJLY1ZtYWI5SWhGNE5GbmYxUyt1TS9W?=
 =?utf-8?B?Rmk0amJCb2Yva0pvajRtQWorYmhTZjBwMEgxSjhFcmkvTUNaeXJ3Smw4UVFo?=
 =?utf-8?B?cy9HYjAyVVdtNmFKOWJPY2ZGcnRidW1TdnI0WVFDRnZReGVVVjBOTmlUWHFH?=
 =?utf-8?B?VDFHdnJ4TVJTV2p1SzJzbUZLTmdQcXdOdWN4OWJvazRpUEwveGlhazU4QVl3?=
 =?utf-8?B?YitiL1VnSExjcERVd091RS9qT1hMU3MxaktPYjhnMEpDMVZ0WVc5NUZJZ2JI?=
 =?utf-8?B?czlFOWZoZ2ZXMlEvTGhEck9QWjBFVkh1VllPMld5a0JXazNLZUJGNWtCUmtw?=
 =?utf-8?B?TUxwakV0UmlPK2l0Qk9YOWpyV0EwdjhmWDJiM01WcHZjQjNCSnovT1VnTEVr?=
 =?utf-8?B?T3huNWJyWS9Oem9zSWV2MVRoSzNyMjdhRmlyOVNCUkJnMXpuN2QwUWtTYkNn?=
 =?utf-8?B?MnRzeHl6bVZyRk90Szd5NmhJSW5Fb2VjdEE3T0ZRSmtkaGMyVU1NSDl4QllT?=
 =?utf-8?B?L1NjbFZXYm5OSXI2NlRkaW1vZU5xNzZrNVdER3BKa0pSVVlVOFpFYzB5ZS8r?=
 =?utf-8?B?RGFzVkNreThWYllWNVRaVlRERUdkd05UNnlsZStLV1Eva2l1bmFURFduVWtm?=
 =?utf-8?B?amNTdEJFZjdBZm1KYmY5aHFCOHoydjBvV1M5WDNDeGRDU0ppdG9xTW0rcmYy?=
 =?utf-8?B?SnM0UTVwQkhTeU0wbEhTWkw0RGx2SDJqUDE2UUgzV2FGTkNOb1FTVjJOOHo0?=
 =?utf-8?B?aUVLaHo2a1ZXcGxHenZqOTlpSFdjd0RWREsyampBelgzS096NEsyTzVESmtT?=
 =?utf-8?B?dGI4TUI1V2ZGR2tTWUdudkp3TnM1UDVLbkZFSUlVR2JYRlNxVGU2ZjlzOCtO?=
 =?utf-8?B?OFhxeWZ1djNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFXRkMvRitpSHIzWW10MkVtbzduL1RZSjA1UFBuN2t3ZVlvNm9yMUhLSmxn?=
 =?utf-8?B?TWlabnN1ZE5oM0tvSW5Qb2loVE5GbzBJUVRsTjFURTdUS0lNVEpjTTRwZnlN?=
 =?utf-8?B?enpQTHRIdEZMbE5rOENNbnRvWVB0ck8xcER6d1c3VDNvbDhtNjNCYXI4bGFX?=
 =?utf-8?B?M1p1VkhEbGdHc3ZRQVd3SGRkdWh2QmJhWXgxam5OZ3hqMGVoY0xWRGpWRW1u?=
 =?utf-8?B?MWd5dFNvUnN0alo1b0RId2RWYnNYVWZRcGFiSlRsRDZGT3lLdVF5Z2N3cFVY?=
 =?utf-8?B?dm1hdzhORVRiRE5tcWxRR0ViTk9YS3EzbVZYejdJYmpaMGcrL1psMEZROXNm?=
 =?utf-8?B?Y1U3VzNQS3AvM1E0YnRCY1djMWxoN29OS3FTb2RtdUJ0ZDNsK1V1ZmNXMjFE?=
 =?utf-8?B?M2FHMUp3T29qSm1hL1BmTFpGamZnc25pa2hraE1Xdjh6eFdjbHExSFNyUzBr?=
 =?utf-8?B?eWhBNVRVSi9MdlR5Y0xXckM5Y2lZYkEzMUlNMk5HdE9yeEg0R0Z0WUYzSjBn?=
 =?utf-8?B?M1M0RmV6UjBBTTBEcEJhNkJ6cXFQN3RPbnZDbXZVVjFyejBpNEFPSzNGbXRl?=
 =?utf-8?B?Rm0wVnd2ZmVYc1NIVDZ1ODVURmduYWdjdXJTNXZEYlBQa0xQUWl0djByTGxj?=
 =?utf-8?B?U2p4b0tBZHpqN2RseFhDOWtjZWRDVGtSektnSWJrWktXbTZEYzhHYmZHYW14?=
 =?utf-8?B?UmZUUUtHUTJudS9UMnhCcWxZYVVxNkVOOFY1cjE2RDFST0h3SlM3RUxlUmlU?=
 =?utf-8?B?U1FaZ29ZYlRWcmlTdTdLcmJGeXZDYnJ3NmNMaS9OSkJHUCtlNEpOMGhzY3Z2?=
 =?utf-8?B?OVphMC9Ndml6TnZTMEtYdVlSclFSSTEvWnp4KzMzSW9tc29tRU5RK0orc09T?=
 =?utf-8?B?ZjNCclQ4OTFGZTU0aGNxeHVwb003M3JVbGtBT3VJeU9lS0Q5bkdZMkRyY2F6?=
 =?utf-8?B?NFFGanNsRDRHVjg4RlJ1TXNaZjVmTFp3d1ZZZ2dmWmZYWklEaGpqNlhlRlp2?=
 =?utf-8?B?SC9DR1R0aW9IT1UrbDIzRDJIUFM5RTh6bVBtVlZaWTBqc2RSQXRzNnFBcjFW?=
 =?utf-8?B?Z2srTDRRc1BMaDdsbE1LK2JEeFI3OTNSRC81REdXZ1o4QzVqd2x6VzVRRjI2?=
 =?utf-8?B?YkNkMG41SnJwVXcxWHdkY3pFNHF1YjRSbjZRNlR1SHV4aXpFT2FYQ3A0ZFV6?=
 =?utf-8?B?WDVjTmhJc1NOMHZaVXFlQWF4TUg1UWJmRnhUT0xvWEs4L2E0dWZ3OFUxOTVs?=
 =?utf-8?B?MTEwN2FRWU45bFA5SitZSVd2WU5EMDdSUDBHWE5yMHo5ZGVuUUs0Z29oOC92?=
 =?utf-8?B?SDAzM1M2YVc2RWxnT3Yza29Way9TQ1Z4V01EdndrRkNMTG5YK0tldzBsaUZN?=
 =?utf-8?B?d2grdTF1TUxHK0xUUnl2dmZDeWxOK0NvZkJYY1pBWmhPek5ZWVJDbzZSS2RU?=
 =?utf-8?B?WTFlVG5LK2J2YW5xdWJ6R1JYVk40Zm00YzZjNVJQWE8raVd6ZVJ6eWZyT2RN?=
 =?utf-8?B?S2tCeUQxbkpMNGQwNDdWc2VLaGVuU2JvbjdyMFArMlZBbXdvRWtlajlISklY?=
 =?utf-8?B?NFVOazh0eUhCVzdzbGpDcDQvbTkrTTcvcGhIUk0vQSs0U2dmSUdlcVFLVDRp?=
 =?utf-8?B?ODUzUkp6UDIvby9PNXF1Q0gxNCtETFdsVG9ZOEkybFJuQS9vZ2NZSlZLUkdT?=
 =?utf-8?B?cWhnNDZaUEtlMU8xL0h2NkZ6Rk5mNHhlaDJRenNKQ1kwUmppc3ZMNTNzbkxR?=
 =?utf-8?B?aXZ4NlpCRUpzTEFKZUFuWjY2dzkwQzRXUlNoRHA4aUZFRUExZXFlTWVKMkR6?=
 =?utf-8?B?YkY4RXhqKzl3WkN1eS96MG5vSFpiNFlCNUtOYUdqNEFDWk9ablgzRmdzRks5?=
 =?utf-8?B?MzhVdzMrWEJQdys2SmlGT2lGSnpMM2Q3aHBFaU1XWnhrWkRUM2taTVE5R2l4?=
 =?utf-8?B?Rm5hUE0xMkhuM0xHRTRqbHRnLzlRM1BISERmWHpoMzljbWRWVUR5RzBUUnBs?=
 =?utf-8?B?VjdxTWJUNG1RTHlRMnlQK1BlTDVqUXloaVFsNDl4Y04vTVhBR3hIZ0UzNGlM?=
 =?utf-8?B?dHU4UFdxRnBlRUdBK05OeXZ3VUJ0ZERSWVdCMEJjaDlSckhTbThVMkRmWjZZ?=
 =?utf-8?B?dkhWQVFReWovdlRJL2s4ZUFZSVMvN1pJMWxjZGFqaGR1WFpNQXRTaUdka0JT?=
 =?utf-8?Q?8CMjhwqVwH+La/U2kvQehqE2tNVzwfPqQj+aKiyCnVkg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a616c347-d5ea-44ed-22b9-08ddd34c6dee
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 11:45:37.8752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyHsqMkiJZno4/sT2iPN4KIqOMHMtFxHDJ5XY+jILJGZvRK41QV4LvQeyLK1y7QMPECkstwP5xZ85frvzYEgeg==
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

Rust provides traits for standard arithmetic and logic operations, but
in the context of the kernel we often need to consider overflows. The
checked Rust arithmetic methods are unfortunately not behind a trait,
which makes them unavailable to generic code.

As a start, add the `CheckedAdd` trait providing the `checked_add`
operation and implement it for all integer types. Its name and location
are inspired by the user-space `num` crate.

This trait is to be first used by the `Alignment` type.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |  1 +
 rust/kernel/num.rs | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 6b4774b2b1c37f4da1866e993be6230bc6715841..2955f65da1278dd4cba1e4272ff178b8211a892c 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -89,6 +89,7 @@
 pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 0000000000000000000000000000000000000000..c81bb046078b70c321dd52aa9c2b5518be49d249
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical and binary utilities for primitive types.
+
+use core::ops::Add;
+
+/// Trait for performing a checked addition that returns `None` if the operation would overflow.
+///
+/// This trait exists in order to represent scalar types already having a `checked_add` method in
+/// generic code.
+pub trait CheckedAdd: Sized + Add<Self, Output = Self> {
+    /// Computes `self + rhs`, returning `None` if an overflow would occur.
+    fn checked_add(self, rhs: Self) -> Option<Self>;
+}
+
+macro_rules! impl_checked_add {
+    ($($t:ty),*) => {
+        $(
+        impl CheckedAdd for $t {
+            fn checked_add(self, rhs: Self) -> Option<Self> {
+                self.checked_add(rhs)
+            }
+        }
+        )*
+    };
+}
+
+impl_checked_add!(u8, u16, u32, u64, usize, i8, i16, i32, i64, isize);

-- 
2.50.1

