Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3CB11723
	for <lists+nouveau@lfdr.de>; Fri, 25 Jul 2025 05:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BEB10E415;
	Fri, 25 Jul 2025 03:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aTJlMP3g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE4710E415
 for <nouveau@lists.freedesktop.org>; Fri, 25 Jul 2025 03:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLD3s04ZfJLnRzoCenlX+2mwfxaCNjkNV5My8KmjGKBBvGdXDSygCjC+yZf23Zodl3JMUigIHd+4+x4Oi3c3DaJalGa+3b6xi4nIO7d8yM0xi17sF1SQiTD459EEVRfPQAlTB/WJadXBLLu29BlBnFwLKSpeEQ9J+a4+yvtSQxvrwQM0GlawAhoS25usoE3qgfvxau0lvsula0Ca/fDTMbNejfwHSWQjFvhDaOZ3LCZrcJyy5TGxXxaZ0lStkrIK+kAb99++59NWGpdPU4/eiGChrt6Xg4CsJ/+j+difgHux9vkP4/9UfP5WhShCnD6G34gkRd21xdFknUYCMegsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59TvI6tj6GC414ET551NlbhQTfsDprNIfdv3eKSnQpA=;
 b=vz1RJjo6+lPeR+BGBCd/Qgucg0HpJ9cQqQymwzG2vNnbQL/yrHvnWz7EyBw+4jpEp3KhW2/S57nLDz7n/UGpdE7U2aVsBKmonj3VjHSdY1TtdTwCkqoZ4sK66PreqI4MfoB/cyojmZHwQ8uFZNDVayhKT+Xn6wyg3D8NFL0cdGbAys/AzZixC+x3uK2zcKEkQnt7AKnW+Uz2CRZ8cqUFOJ84aKL8JzOfm/xiZGQi8GCZTcWCq7kbltdeCI4LyVjpeHoHw8jVo5V0VmJjQkxrxnGevM+dvcQbhb9PSsJDcpQzp6dtDtUvv2ISKnRabMbkU1DNd3LygsEsttOLmFa2tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59TvI6tj6GC414ET551NlbhQTfsDprNIfdv3eKSnQpA=;
 b=aTJlMP3gQbPpCw3DQ69DhM0uzKUBO7bEdYylTg+4UWHLMcQ5jvLGkOso0eG0SrNHlgPYlcIGrjj/Ym89S5ityybZpQaAqGIel9d14qoou1e7dnKOFF03CrznOfNo3UCffjucG+CdYWWMzEmc1AY3gbAb7nJINw5JLvGrZhsF5Cs5s6aIN2V83ORpeEb12nK4q+c9ImwPr7pg0QpawnQdr8rn7wHCG0fwA8jn88pK6jO1SzVYsOI9r7cYXLw9ciSivQO+BNO9vYsP4e0t+klFKhRpBanH6BcpS/yyRab7spGIKr/UlZtZOnzQ1JxMGMNGxvJU7UVgTPORU2HhnKF2lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY1PR12MB9603.namprd12.prod.outlook.com (2603:10b6:930:108::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 03:39:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 03:39:01 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 12:38:57 +0900
Message-Id: <DBKTNE4OF0IB.3C32NVHQ9UKQ3@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <DASWS1A63LYM.399CKUDL4Z7UC@kernel.org>
In-Reply-To: <DASWS1A63LYM.399CKUDL4Z7UC@kernel.org>
X-ClientProxiedBy: TYCP286CA0234.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY1PR12MB9603:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ecf53fb-bddf-44e7-bedb-08ddcb2ccb2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azVZaVh3c2I1VWtZZytwT2p1N1lTVzVINjVyMi9pSmp0K1lUN3BSQXRaSEZ0?=
 =?utf-8?B?cUpZbHg4Z1I4MXp2ZU15L0hsSGEwcXV3R29hdVAveXlZbmZsWitaVVIveDhU?=
 =?utf-8?B?eVcxeHVneEZHREtmejh0SDduZFJuVE0zeHFrZ2xCZ01DMjZ5V25pSUZNTHlp?=
 =?utf-8?B?V3RnSHdueEJ6QkpDUSsxK0d0YUswUzdJU2YyampqN2MzTTVOTlExTmJlL1Bq?=
 =?utf-8?B?MFhXRlplMlBxNCttZVMzYjVLdTU2eHZsTGIxbzJqdTZOVFhIV21NWHJDZnl1?=
 =?utf-8?B?OTZQOVhsaldzQVlRTnBCa1JWRWxEY0gwNnJMcmxrc0QyRWoybnBqS1pITWZx?=
 =?utf-8?B?MFFuUEk2NnZkT3JvMklJbktGa2c1eGhrY1VLRkxVUDRiZGpwUWpGL25YeERo?=
 =?utf-8?B?L0lhRDdBcDR2K1QyL0loeno4TEk3UFhJOW5OZFVyN2ZyVTJCUU1vSlZQcVRJ?=
 =?utf-8?B?TVBkb1RHWmpJLzArcGZNalkwWko1THlQWlBrYytqQ0xhQ3N1L1p0SWtnRlRF?=
 =?utf-8?B?MXoybi9wK3JxNnJySHJHejV0QzN0MUVQdkRPQ1N2bG5hK25uSEM1a2NtbUxS?=
 =?utf-8?B?NktlYURQY0txeG56QTZpMWJwY1lQQytDN2RkZ0hYNCt4NnVyTE9DVTJjOTZ4?=
 =?utf-8?B?b0FTenRRQjgrcE5FdUVzbWZqSnhHbHR0NWdZUDNWcllteVBoQlJxa0g2S0Ux?=
 =?utf-8?B?WlE0T1RadFRHYzRpWHhhalZkUG50bkh4MVZiZktkM0ZPZ1hlYzdTYW51SkJY?=
 =?utf-8?B?a0UyS3NTeHZoNmpUTnJrbWhtQ3hZOEgzc0FIaTRudzRWanBKcVhwWHY5cFRp?=
 =?utf-8?B?cElIenhjZGJsWElvQnV1cDlPbU5POUlJdEdPNUE3S013R0UyWHExMWw4UTQz?=
 =?utf-8?B?QkNnU01ORXNZaGZBdk16Zjl5aDFycUFIeDNxWmxnanZ4dEIzU2lib2UzOTha?=
 =?utf-8?B?THF0bEpMZ0RWVTZuTjYvcDlYV1A3RStIK2NHdEc4OG54dDc4VjNoMHM2d2Iy?=
 =?utf-8?B?TzdBWWJHNUJXdHFrVEhrTUZBRHFBSnhxNUlFUFlVS3R5ZG1pNGdDenZqQlFn?=
 =?utf-8?B?OFI4ajNDZDNGc2srSHBoOVhLUnJJdmR6dXNYNlZUVzBScWdRZldoR2k1UDlS?=
 =?utf-8?B?ZDByR0tHT1VNMG9ITDNZYXBGY1YyZDlMT3ZjdmIzajYwMFN0ZVVSaWsrSzZ1?=
 =?utf-8?B?VHJmK3pWVE1CUCtVbnVjVUt0a0xFbmdpeGlQajBnWFBsYW43M09MSVVheTgw?=
 =?utf-8?B?MnlHa0lEV05SYVNXT3VNTmlpV29ZUGxRTjNRUS9jMjVVSE9RUWlkNHJpQ2R2?=
 =?utf-8?B?YXRldDBXMUFvV3VEbk5QbnRDaVYwdS9LaG0vYUcybzNuR0cwWGtZQ3BVSndp?=
 =?utf-8?B?WWhRaElTcDF4RC9nMGdPcDZrSnNqVHQyL3h1bXVDZjc2akxJUVh4MC93U0w0?=
 =?utf-8?B?ZXhVdE8yeFd6SGkrOWtDL3lwRWJXYU1BV3RJR2VySnVPbDY2c2N5L1pnaDQz?=
 =?utf-8?B?ZEYyL01kRjlhdVNkQjRaWWc1QWp3eHNGbWcwb1JqMGMzVXJCZFJTYmE0WDZZ?=
 =?utf-8?B?ejdXRm1HbnFBcWhETWxNZXFja0lPUmhMY1FXYlRuOHdmSjJZQ0F5cllOZlhO?=
 =?utf-8?B?TXJBaWdUb0lXT1RxRzZGbDlhUHVvU0xuL01tL3Y5VHJkMjVRV241eW52enpG?=
 =?utf-8?B?S2I3TGVBazYyZnJZNDhjeVh4L1dSdDNjZGxWVUxzc3UvOUVXZmN1L2hIZUpa?=
 =?utf-8?B?c2VsRGZUQXJERWN0QWp3NVNieG4xMkNtVkJqdnM0OEZQeFJoYXBLSTlmMGJY?=
 =?utf-8?B?ZTlhRmNzdTFUbk00K2dLZWZnZWY3YjAxMTdudHBXcFNXakc2Unc3bFpMS1RQ?=
 =?utf-8?B?UWZRYnE2TnV6T3BDZllRTTc3K3R2dU1MSHZKMUJOeTk1SjRUYUU0RFJ1OVRZ?=
 =?utf-8?B?eXVVNm1SYXdmSEFjS2o2NGdXNlhzejZnQUw5RGtVUm4wdHd1eWd5djUwc0Yv?=
 =?utf-8?B?VkNJSklTR3hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmcvNHczOXNDaTQ0aVNyRGxjNlhUc0NyTEd3QmZwTEYvSzJjWjhxY1hwZ240?=
 =?utf-8?B?cHByWkJaZGVvNTF5cHNYY3p2QU0zTVNBdjd3UFVZZEJnUitXLzFrL25hYy9C?=
 =?utf-8?B?ekcyNG5HMlloTzdRQWlyNnpGUldtSzNJTDFScHk0N3RTczMwRWY0OXQrT2ZD?=
 =?utf-8?B?M3phWm9IalFLUUdCellKbjRPMkdZMFZGUlRmcGZBdVozd253SmVZY21rRUlp?=
 =?utf-8?B?eXVtdStST2xOSy9CbnljdEdDQUE1eVJ6TGJnOGpsVEdtUXk0NXBFaldyT0dz?=
 =?utf-8?B?SThJZjJHY0U5clJjV3pLMXpIMDNQYWtnRmQyMlRMRGpzS2FSMU1RK3FSZm1m?=
 =?utf-8?B?QjN1VmJiK0xDUklPQ2JMMGlJaDI2U1RYRGIweGhpZ09MTUlkc2lMT1lzMEhj?=
 =?utf-8?B?YmJBQ3Q5ck9KY2tOWGxncCsybzdNaVlYUW9wS1lqT09RenM4S3pwS0FjWC95?=
 =?utf-8?B?aVlhOWxFRTZHZjRiWk5sdXArMUh5cjNHVmZWRVNiMDc4M24vYlFUTHR2cDFL?=
 =?utf-8?B?WkErdEo3QTNKYlgzMDllL09MNmkrSFRReU9la0dTZ2h4NHdTN01BVUZaL1lR?=
 =?utf-8?B?aytWWjE5a1Voc21kSjhxanljNGMzSVhuUmZUaWtVV2llenA1Ly92Q25yNCtF?=
 =?utf-8?B?S000aDl4SGc4eUpDNjI2ZXFxM0RiRyt2WStiem1SWWU3aTRlUjFqTkRLOGV5?=
 =?utf-8?B?NlVDcDZkSjBCN3pGNG1pdnJKdXlKcE5uTDE2VkdDMHFFZHRiNE9iWENGVGFw?=
 =?utf-8?B?MTRMaEg0alZqV0twczI1UUw1QXIrNUVwZEQ1dk9MeXdkWGJNWHE1N0IrSzht?=
 =?utf-8?B?bUM4MGk2bkEzRzJacm90SFlGVkpFVDdzZ3puS3Y4Um8xdkdUdVBFWFFUaXRE?=
 =?utf-8?B?bUprdng2RWpROEZUdEhLVlJQWTFEODQ0anFPdjMxZlZ6b3NaZHhQL0pMMGtC?=
 =?utf-8?B?SEw1Z2tJbEJ5T2pLdVQzbmlyNkR6VVVqQlRuKzBzR1VJNGVwSFQ3QjNMekda?=
 =?utf-8?B?NmVGVStjNHBnMlRjK3NEUlVPcWxQdmhXVnJ0RkVTSDhGZDFpemFxdlU4bks1?=
 =?utf-8?B?UkdEZExQd1JHN1JHYVluYU1sb3lkdFJURHg2RTZZR2pFb0psMUxaVUh4dm1Z?=
 =?utf-8?B?RjIyMUlEWkNFU05VaG96aHpUMEJuYTBFSVBBdGJ4M0RMdlhHaXB1R0lXa0J4?=
 =?utf-8?B?VWw2QWlUa2ZHcnFtSExmcENyVURSYXhxUGJaOHZwYVpRNE8vUm95V1h2a1Jv?=
 =?utf-8?B?Q3BTb3hxY1F0SkZOeWZqOGx4aDVyQzlIVUtmNmlsZUtVY1ltazVzOXFEYUUy?=
 =?utf-8?B?aDNYbUwxOVQvRlkrMllqMEp1eVlEVnZ3SFNBL0tSckZvVDc0YTBuZVRPTks1?=
 =?utf-8?B?bG5aNnNGWEVwK2w0ZUlERW9DUGp0d0kzZlFCMGxXRU5hVGRuVzg2MHl1alA4?=
 =?utf-8?B?MUNJZDVLQXRDVTcxQXM0ZFlPdER4eUxENlF5ZDhORzNoQzVVUCtFSTRHWU4w?=
 =?utf-8?B?L2MreEVQeGdKaFF2dzBJRmlPbFhXT1ZKbStGbVNncXIxdlRpQlhQVmg0YTM1?=
 =?utf-8?B?c3k4bjB3QVpvVWZVRXBwZWx1MFUxS3FvdjUrNHBXdVhxOG54UDZSSjMyL21h?=
 =?utf-8?B?VkVPNVNBdEtsMzBpcVQzQURzSDBnMG1ua2tHRUVhU3hLOGZ4U01COFFVMWtW?=
 =?utf-8?B?UzRlRUZjT3BleW1pZ3R2YmVadTN1STR6Y0t5Tkg5R29XNUluc0ZBcmkrK0p1?=
 =?utf-8?B?T1JFbDZCNzhkeGJYc2xMa3pKek1haHZLS3o5a3JVN0xTSWJhSjNtTGRIY3Jh?=
 =?utf-8?B?Uy9WTEF3YlYyaHNQSGQzb0cwQzJVSEk5ZTBDL292MDlNVzZwUU5FVHlBRUQw?=
 =?utf-8?B?bXlBdTlMUXhlSnFyRlhCQ2xoT1FTTnlWMnJkOU9BbGQ0MWtSZ1NBOFlaN2R3?=
 =?utf-8?B?bHhQU1VYZXdKckdkRytSTkwxMjlVbStHOEV5OThtamxkdkZhOWFvdk4yaEpK?=
 =?utf-8?B?cXdtZEx0V1p0MThKUWFOWmk4aUkwOXl1ZlhGMXlMeE9tcFFIUWRGNFg1T2FI?=
 =?utf-8?B?bkdBdWlncnZRVUx5UkFlWDh1ZmFJWHJPMlRzZDBuZnU4OW1PdjZHRTU2eTEy?=
 =?utf-8?B?VlozNDY4RXNmZFFYbVk0akJLc2oxY3duaHNaZXhNTHg5M3hHWmhjazhYMUhF?=
 =?utf-8?Q?in53PSZxZA9A1PM5kDSYR5F30YQUJtcGj+GsNb/St8Qc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ecf53fb-bddf-44e7-bedb-08ddcb2ccb2e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 03:39:00.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFQHNNPEkAKcJZKo64rS3H04DtXbREaAVeHkeZ6weV+LT++fRPyZ6aji4o0xPjXyoi9/jfJpqMl6Kwsg2PAL+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9603
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

Hi Benno,

Sorry, took some time to come back to this!

On Sun Jun 22, 2025 at 5:11 PM JST, Benno Lossin wrote:
> On Fri Jun 20, 2025 at 3:14 PM CEST, Alexandre Courbot wrote:
>> +/// An unsigned integer which is guaranteed to be a power of 2.
>> +///
>> +/// # Invariants
>> +///
>> +/// The stored value is guaranteed to be a power of two.
>> +#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
>> +#[repr(transparent)]
>> +pub struct PowerOfTwo<T>(T);
>> +
>> +macro_rules! power_of_two_impl {
>> +    ($($t:ty),+) =3D> {
>> +        $(
>> +            impl PowerOfTwo<$t> {
>
> I tried to use this type in a doctest like this:
>
>     use kernel::num::PowerOfTwo;
>   =20
>     fn new(x: usize) -> PowerOfTwo<usize> {
>         PowerOfTwo::new(1 << x)
>     }
>
> And it doesn't compile :(
>
>     error[E0034]: multiple applicable items in scope
>         --> rust/doctests_kernel_generated.rs:4930:17
>          |
>     4930 |     PowerOfTwo::new(1 << x)
>          |                 ^^^ multiple `new` found
>          |
>          =3D note: candidate #1 is defined in an impl for the type `Power=
OfTwo<u128>`
>          =3D note: candidate #2 is defined in an impl for the type `Power=
OfTwo<u16>`
>          =3D note: candidate #3 is defined in an impl for the type `Power=
OfTwo<u32>`
>          =3D note: candidate #4 is defined in an impl for the type `Power=
OfTwo<u64>`
>          =3D note: and 2 others
>    =20
>     error: aborting due to 1 previous error
>
> The problem is that the function `new` exists 6 times for each of the
> integer types. You can write `PowerOfTwo::<usize>::new()` instead, but
> that's annoying...

This should go away as we switch to the non-generic `Alignment` type
thankfully.

>
> We probably need an `Integer` trait and then do
>
>     impl<I: Integer> PowerOfTwo<I> {
>         pub const fn new(value: I) -> Self;
>     }
>
>> +                /// Validates that `v` is a power of two at build-time,=
 and returns it wrapped into
>> +                /// [`PowerOfTwo`].
>> +                ///
>> +                /// A build error is triggered if `v` cannot be asserte=
d to be a power of two.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify!=
($t), ">::new(16);")]
>> +                /// assert_eq!(v.value(), 16);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn new(v: $t) -> Self {
>> +                    build_assert!(v.count_ones() =3D=3D 1);
>
> Why not `v.is_power_of_two()`?

Why not indeed. :) Fixed.

>
>> +                    Self(v)
>
> Missing `// INVARIANT` comment.

Added (and in other places as well).

>
>> +                }
>> +
>> +                /// Validates that `v` is a power of two at runtime, an=
d returns it wrapped into
>> +                /// [`PowerOfTwo`].
>> +                ///
>> +                /// [`None`] is returned if `v` was not a power of two.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                #[doc =3D concat!(
>> +                    "assert_eq!(PowerOfTwo::<",
>> +                    stringify!($t),
>> +                    ">::try_new(16), Some(PowerOfTwo::<",
>> +                    stringify!($t),
>> +                    ">::new(16)));"
>> +                )]
>> +                #[doc =3D concat!(
>> +                    "assert_eq!(PowerOfTwo::<",
>> +                    stringify!($t),
>> +                    ">::try_new(15), None);"
>> +                )]
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn try_new(v: $t) -> Option<Self> {
>
> Maybe `new_checked` is a better name, since it doesn't return a result?

Definitely.

>
>> +                    match v.count_ones() {
>
> Why not `is_power_of_two()`?

Fixed, thanks.

>
>> +                        1 =3D> Some(Self(v)),
>
> Missing `// INVARIANT` comment.
>
>> +                        _ =3D> None,
>> +                    }
>> +                }
>> +
>> +                /// Returns the value of this instance.
>> +                ///
>> +                /// It is guaranteed to be a power of two.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify!=
($t), ">::new(16);")]
>> +                /// assert_eq!(v.value(), 16);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn value(self) -> $t {
>> +                    self.0
>
> Let's add:
>
>     if !self.0.is_power_of_two() {
>         core::hint::unreachable_unchecked()
>     }
>     self.0

Sure. Is it to enable compiler optimizations by making assumptions about
the returned value?

>
>> +                }
>> +
>> +                /// Returns the mask corresponding to `self.value() - 1=
`.
>> +                ///
>> +                /// # Examples
>> +                ///
>> +                /// ```
>> +                /// use kernel::num::PowerOfTwo;
>> +                ///
>> +                #[doc =3D concat!("let v =3D PowerOfTwo::<", stringify!=
($t), ">::new(0x10);")]
>> +                /// assert_eq!(v.mask(), 0xf);
>> +                /// ```
>> +                #[inline(always)]
>> +                pub const fn mask(self) -> $t {
>> +                    self.0.wrapping_sub(1)
>
> Then use `self.value().wrapping_sub(1)` here instead to also propagate
> the information.

Ack.
