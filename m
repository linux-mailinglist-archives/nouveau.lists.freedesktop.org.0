Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14099B2F85C
	for <lists+nouveau@lfdr.de>; Thu, 21 Aug 2025 14:42:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F1210E974;
	Thu, 21 Aug 2025 12:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tDrbwYqi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D4710E974
 for <nouveau@lists.freedesktop.org>; Thu, 21 Aug 2025 12:42:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZI9wqWRZDiu+kB7txddXBnzPb1XI11QjoSUjs1Y55P+erE7LR1az5g6uVQ4JYfWTxap8l9xwBzBvWsB9WMOIQgyimAeVfEZyQNPjv1Hj8/o83XbXvFCXm9nzxB15WfGjy3H/psGjwAEfetXOF//jEHMor/wXu1WADiIjHU2HBE8/k4sJKjnlXJMeBXSJWm6m4E+6lqLmKSSNHjvoMgojT3zG3JtsChHkNKHV66PH+o+ZboJ0mdtd4FfCPe7UzWkywajqjVxE1k/ya/WtBrhR8taOmteuMrC37sxJGBrBpn6yyIYXsq2Cx/agX3uoUrTtJd1KzECubkTxk4igq9bQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrY9RsqkiEEeI57yKZsZHAA0BGr6QGXu2ncRvygbbBE=;
 b=E6H5SQ2BeHQBusDDkYIJjAESvWPRzHOESma9x5kH3/OB/rRcKM9QK4oNCmcc7nc2Pj1IwR+ZOlhZiKSFNLiWLF9wiV3rG7QRr2dmzWXzHgXjGF8aqQcnlElBp7dHJkHBPrmWkQ89uCf9boEBWL6x3bK4XgNuQTv0op3QInvJnEmDlv+UJ4Mho1pi+4JPg8Za1UHFh5OcGKsBLwgYyqgaKwE6/DgxOEI0wwrwTETbElZ3K5bPDHUZ3ldQQikT94zrvq+kTfdQ7s59QZAsnJTzCfwkUuQpq0m14R37mOFzspJHVUGm+OVhKLl0Hh0n9LF03XO7nLxCV387ypE6hZJ1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrY9RsqkiEEeI57yKZsZHAA0BGr6QGXu2ncRvygbbBE=;
 b=tDrbwYqiDipkP54TLJOMr3hg9VQXwc3oatkHv49aZ2TWZv9BrT2eP3WtH2TFzADLHO/dLp5osdeVXqU1hMLqddU3+NeJti0GqzOpp0MehzKZM1j2x4NzwyVUbQDh2UOXedvDA/lW2i05oEd1hX7TG2PV0B6+VDHeU8EFOOYc0PhNkGSdE2wccnRuxqbf9frU+jpLUkPWN+kLqmNjVKAaA51+bjZyQbjzybIIYqfWHauJ/T+f27sx7qU/LVLy1/xe9kY3IhLw9UTIW9RhB52ywhFay/rzyItf2RA6gyymRu1bICAfh1z7zbAL0QG4o3RF7feGodLU1fhY1WDQxWSkgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 12:42:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.023; Thu, 21 Aug 2025
 12:42:43 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 21 Aug 2025 21:42:17 +0900
Subject: [PATCH v4 1/2] rust: add `Alignment` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-num-v4-1-1f3a425d7244@nvidia.com>
References: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
In-Reply-To: <20250821-num-v4-0-1f3a425d7244@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:404:15::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bae1dd1-2f9e-4a90-bca0-08dde0b038c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmFXNGJ0UEJnRGpSM2EzTjJvSkpBR0czcXAyUU5aNHkvcmVNZDlNV0xKS2hH?=
 =?utf-8?B?QmVweENyUDBYSXdCN2N6a2V0STdBc3d3Zk5GK2pISkphVjFKb05nbXVYN0Zi?=
 =?utf-8?B?ZmgwZmFyYW9BdVROQTFZV0hXMk56TE9nTGZiQkN2ODFuaG5UdUI5WEpMQyt5?=
 =?utf-8?B?WEprZDJ3bGpLclA0VHJ4TWFucTR0M2I4VUZ3NTd6YXFCYnVRMTljbGJTbElt?=
 =?utf-8?B?Y01rTmdVR0tqSEl0Uk5za1YrNHN5TTU0TjRnMnA5c3hseGg5VjUyZWV3ZXlB?=
 =?utf-8?B?UHd3bUVZL2wveDYyYkRCV3lZTjJHV0pOTFJYQlUybDJJZlRBdVVhRDBtWjVN?=
 =?utf-8?B?MzBWc0QyRU9vYmU5dlhWMmJQY2hSVi9haDkwdHpVTVB6OUVwNVJkZnZlejh3?=
 =?utf-8?B?L253V2JURDNxQ1pDNjF5akVsMFlaWldNejdoSDJ6RnlCY3RvUFhObnE4QnQ1?=
 =?utf-8?B?Z3pqRnV4MDBNbUhwM1hUUlhhSEk1UnpuNXUvUVZJY1hCY1BTUWNkb1FRUjdo?=
 =?utf-8?B?TnpzNzFuU2J3anoya3k5b0VVT1pGVkUxU2RTY2NVYWZzbmhKVDZkd290cUN3?=
 =?utf-8?B?L2dKVzRqOXErWlM3UWYvM0dwRVJxaFhGYWw0MXRXelQ3OWRYMDErN25OaFJU?=
 =?utf-8?B?cTVmcUlKVkJ6OUtzWFVXOEdUWE96a2VxUXV1cTRHUDhBKytsaC8wMjhMWVBW?=
 =?utf-8?B?cWJNR3FoOGNpM040NWk1bGF0ZHpnaGYzYTR4bnJ0YUtVSFZ2VHliRWdrbkIx?=
 =?utf-8?B?Rm1yZVJLbHhybThzR1hLVEpjRHRQaFVGbDJyRTNxd256ckFTdVRvRE10N1Ja?=
 =?utf-8?B?UHRzajAyRERVTjRka2UraXA2dUhhdXpRQ3JxRmJuY2g0azFzSTlMVlptcHdh?=
 =?utf-8?B?VmV6UUpNc1g5Ukw2S2wyam9DdzdwOThLaGZhZm12ZkhIRTRyWGgvTXNqRHNW?=
 =?utf-8?B?S2RGcjFTOHppZUs2enhhUWZiOGg3YTJVaEh6dEpSeVRDR1FudU1yRzZuRzlM?=
 =?utf-8?B?WlNvbVM4dmYvSC8xRk1WL1FhQ2JpVW5mQnBnVFIzdEVIYzdOc0xuSzlLMUZ0?=
 =?utf-8?B?d0FsU1Z4SUNua3crWjVwWjloclhvb3ZqU1MzVHJaRUJFZjZ5WW5GeUVNUnBi?=
 =?utf-8?B?MkhOZ0RzR0lLWmw0Z2N6UkQ2aHN0ZVJOSmpXdDBPeFhyUFN0TEpxTUFPcmpx?=
 =?utf-8?B?SENEVTMxSjVtdVljS3VTL3NGQzROWHNuQkZ3bEZnbkNvMmVKOTdmK2pUTEZu?=
 =?utf-8?B?a1lZQ0dZSEJienJzczlVQUVWVEpRYjJ2RjV6MzhROEZyL3N6OGd2VU90dFND?=
 =?utf-8?B?TmxEVHFOekNJVVkrREV0SGpxdUI1c012cFBkYUo5eXF0SHk2OC9YNVZudkc2?=
 =?utf-8?B?bkJGNkdNN1VneGVmNFdnYkpZQ2g2NnV0Y1FNRlI3UzVHRmtQTE40bndoMEpK?=
 =?utf-8?B?dmdHMEN3WUd6SGFEVEg5TTZqWXpraS9nMVA1TW9ySkRSK2V4T3hlYVZiY0Z6?=
 =?utf-8?B?K05PTGxELzA1MmJvNnJ0UHJ3a2h0aHV4RlpFL2tOWkxDdTNDRkdFSmFFRXUv?=
 =?utf-8?B?Y1ZJMmpmWUxiWGtaR3FPUjRobzF1YWp4ekN6QlZxaUVPTnBFRCsyS2hvK1ZZ?=
 =?utf-8?B?NmtmVlhwdHVQZFlhQ0duODVFa1NqaENlbWV1ODFYUXZra0srcXBxbVEyZFFi?=
 =?utf-8?B?c3RaQVlyZW1GdVBFcCtQQkx3d1I4QkFEemZ1N2FoMGg1cjZ5VnQ1MzhZdUU1?=
 =?utf-8?B?RnhIZDJuQ0s2cjUrU1g1U2N0TVBrbzFLd2FZalpuZ0FjQTVTUUxRUWdpWUNq?=
 =?utf-8?B?R0h1Mk5aMDRHc2NkT1MweUdYWGNqeTJmRkhiR3dpVDJlZHg3cVAyV3B0QTFo?=
 =?utf-8?B?SXpMdFd0YWd0UWp1MTlvTlRocjVZWktoV2pycmh3R0ZtbWNWVzkrQkRhTWpV?=
 =?utf-8?B?VS9IRFhaUVJtVGNISGJxellJeGxiM3IxalcxRFRkeWg5bmc0bWJIRlppWTdC?=
 =?utf-8?B?ckdMMzdYSWF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkN3VU9kd0pkWDVPdWtoT0ZLZldkSlljUXJsYm94ZlhhTU1FMnNRYklNVi94?=
 =?utf-8?B?azlMMm5kRTFGZ1ZsS0pKZVJmRTBzZUV1V2JONEk1Q2Z3THUyT1pEdiswLy9r?=
 =?utf-8?B?Z211VjVFanljMS9hV1ltczIrMDlRMS9DNWptMWh0bEhhc3JXNWxidUFibDhW?=
 =?utf-8?B?WFJibXd4RWxLOWlzQU9kVXNGdkxoZkFyU3U1Rk1XTFl3b01pd2lzZDNBR0dO?=
 =?utf-8?B?czY2eDdncG1hVHl5SEgzSURUZ1NuNjdTT3JndDgyYlQyMzB4VURiaDU0T1Fm?=
 =?utf-8?B?QzdCSnVVcC96MlZnekFPb1ZuL3lLck1Gc3JUdUs4cGpZTW9XbVNwVDVHOHNZ?=
 =?utf-8?B?WElqUFZWb0dGT0xHd210SDZYYjFHcUZRWXVBRkF6dld6V2lsTXBTZi96bHV5?=
 =?utf-8?B?S2xJMy9yYmNXcjV1Q0lHWDMvQTNwVkxQMlluRktqN0hhL1RLaS9zK3RiSlh2?=
 =?utf-8?B?Z094anNSYzBtUTZnNE54T2lnSmNtMVlCbXRBNWRodkNGM0dISjBhWHdtMGhM?=
 =?utf-8?B?R3pFNGltb3ZzVytKeTNMTUswYzJWNzRvVkpwR3pySkVuMnNjM1A5VEszc0Yw?=
 =?utf-8?B?em1haFFjR3hGMk1XQk5mTVI5R0VwaEVXUkpvZitLSmpETCttUFM0bHRscUlV?=
 =?utf-8?B?cjgwankxazZMOGpVRzlIQ0J0U0gzNXZua2ZidzEreWFvbVg3bUNXSmhMWWMv?=
 =?utf-8?B?R2NsUUorcjFpSDh1dEczdVFqQmVwMnpEQkcwaHF1ZlpPU1NKdnlzY1JkVFdS?=
 =?utf-8?B?WmJId29QKzdjOU9OaTJpcnBSOWRvRE8venQ1VkR5ZG9XcUtLcmpMNDlxbVNa?=
 =?utf-8?B?TXFheTlIeHp3NnlSVW41cnZxakpGNmVZUklJNFRmQ1JOcGNKZi9WaTZuOHZY?=
 =?utf-8?B?NEl5c0JYUWs3ZGtpckp3T21IVmZ3eUZkVFRyUDFRVW0xUDhJOU44ZXc3bWZw?=
 =?utf-8?B?alhYTjRrRldJVU1NL25Jd01IM3NZSXdBdVkydjZSYm9oR0IvM3hlUTBkZ0xT?=
 =?utf-8?B?bnBCSVBDSjV5M21vY0ozZFlVeGhIRG5OK3JnZ3BQN25OYjlxcHRzbVJNQzlK?=
 =?utf-8?B?M3NDeUxvdHd3cHJQWENQL1AvRTVRMHYxSWx1bGhvbjNEaFoyYXFtajE1QkI0?=
 =?utf-8?B?NXY5L25ldHJBT3phMGo1QjQ5WkZSSkNPODN0TGJQTXk5NmFuZHkyMVppdVNj?=
 =?utf-8?B?d1A5UGc5MmFVUjN2ZGpoNUVvYlZ2V2xyZEdBdVlFcFkrNXBDMW9VVXVTajRX?=
 =?utf-8?B?M09sRVp2cnp1am1VRDVucUY4ZHZjZ2FRanNpWm1XRmcrVERRY1F0TzhKRHN0?=
 =?utf-8?B?VktxUjNkUlI3K2xpWi9sYTZGeG1GU1pKVnNvTWRHYVRTeTlmbTg4WUJlZFRL?=
 =?utf-8?B?SkN3MWdvZFYzT2Q4SU5CSFNFc3gwZDExbXZjWFJ1SU91bU1pMDFFODNMZVZh?=
 =?utf-8?B?SDVtUkp4TVBkOFJHMDB6MHVHeGswc3Bzb2NoamRxOWxHeEt3QUljMWEvcCtF?=
 =?utf-8?B?V2ZPSDNlSnlNTjBqVnNHeE1rak9yYmNDL0Y1Rlhha3hodlpFcmQzbTdCc1pz?=
 =?utf-8?B?R2V1YjRNYi9xdi8zekRJUDJFWDdKbTN6TVB5L3VkU3VVUHZXT0JWUHo0ektR?=
 =?utf-8?B?MXZlQmFUSWpiR3o2SUVDQndOV1ZEcng2TXBmRG9OK0NoWTZ1Ky9Ca0FCWEpk?=
 =?utf-8?B?cmVMdjlVU2pvWjhiaXVlUHA4Ky9PTjM0NDlnZU1zelZ5VWhZYUxka0kwWW04?=
 =?utf-8?B?Ymp6TGV5cXh4LzYveG43Zm0wd3NkVnhQbUNPMHd1dmY1aGZUcDdqVW10MFdp?=
 =?utf-8?B?OHNiZEwzNWpocTM2Umx2YllrSzNOMks1V0NWVUEzUGdOc2FBZ012VGJtaXNZ?=
 =?utf-8?B?SnRieXFuUW9LV3RpcE9PWEZsUXF4Yk04UU9wNHJLT2dMOUJ5QUxjSDAwM0RT?=
 =?utf-8?B?RUtKRFdCR0VOdjV0ZE9BazB6czNvWGpUdDBXOTkxUkF6OHYvR1Y0TnpBOHpS?=
 =?utf-8?B?L3JmSWJqdGNDQW0wZFo2cFlNSFl6czFmR2l5bS9TUGNmeXRhSUgwYTN5RC81?=
 =?utf-8?B?YzZlVFozU1F5Wm1HK0ZUc3pXV28wWE1NaDdjRjFzeDI3Wnc3QmtMdHUvY0sr?=
 =?utf-8?B?dkxyZHFjM3RxSHl3T0tqSXJyVSt3TWI2V25VcmZQUDVGanU1UW5GOEQ2d05a?=
 =?utf-8?Q?+Z/lC+HJlkt2fOjalmE+Y5aR5/TrCOi3rRbcJ1LV+1P8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bae1dd1-2f9e-4a90-bca0-08dde0b038c8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 12:42:43.0609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ca4d3OEeeBZPjYM44XrpfGX1+enxfrz5xgiHXENAF9MHJtNUHh+zw6fg3xRXXYD8MbFWb1q8ErR3TrUR9t8aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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

Alignment operations are very common in the kernel. Since they are
always performed using a power-of-two value, enforcing this invariant
through a dedicated type leads to fewer bugs and can improve the
generated code.

Introduce the `Alignment` type, inspired by the nightly Rust type of the
same name and providing the same interface, and a new `Alignable` trait
allowing unsigned integers to be aligned up or down.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   2 +
 rust/kernel/ptr.rs | 219 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 221 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ed53169e795c0badf548025a57f946fa18bc73e3..c26a8b235fc78eb2e1bf71ac193f720e2581c6d2 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -17,6 +17,7 @@
 // the unstable features in use.
 //
 // Stable since Rust 1.79.0.
+#![feature(generic_nonzero)]
 #![feature(inline_const)]
 //
 // Stable since Rust 1.81.0.
@@ -110,6 +111,7 @@
 pub mod platform;
 pub mod prelude;
 pub mod print;
+pub mod ptr;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..d7aa59c20fad9706d3c6b9cf4d2c7096115b66a8
--- /dev/null
+++ b/rust/kernel/ptr.rs
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types and functions to work with pointers and addresses.
+
+use core::fmt::Debug;
+use core::mem::align_of;
+use core::num::NonZero;
+
+use crate::build_assert;
+
+/// Type representing an alignment, which is always a power of two.
+///
+/// It is used to validate that a given value is a valid alignment, and to perform masking and
+/// alignment operations.
+///
+/// TODO: Temporary substitute for the [`Alignment`] nightly type from the standard library, and to
+/// be eventually replaced by it.
+///
+/// [`Alignment`]: https://github.com/rust-lang/rust/issues/102070
+///
+/// # Invariants
+///
+/// An alignment is always a power of two.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
+pub struct Alignment(NonZero<usize>);
+
+impl Alignment {
+    /// Validates that `align` is a power of two at build-time, and returns an [`Alignment`] of the
+    /// same value.
+    ///
+    /// A build error is triggered if `align` cannot be asserted to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// let v = Alignment::new(16);
+    /// assert_eq!(v.as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn new(align: usize) -> Self {
+        build_assert!(align.is_power_of_two());
+
+        // INVARIANT: `align` is a power of two.
+        // SAFETY: `align` is a power of two, and thus non-zero.
+        Self(unsafe { NonZero::new_unchecked(align) })
+    }
+
+    /// Validates that `align` is a power of two at runtime, and returns an
+    /// [`Alignment`] of the same value.
+    ///
+    /// [`None`] is returned if `align` is not a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new_checked(16), Some(Alignment::new(16)));
+    /// assert_eq!(Alignment::new_checked(15), None);
+    /// assert_eq!(Alignment::new_checked(1), Some(Alignment::new(1)));
+    /// assert_eq!(Alignment::new_checked(0), None);
+    /// ```
+    #[inline(always)]
+    pub const fn new_checked(align: usize) -> Option<Self> {
+        if align.is_power_of_two() {
+            // INVARIANT: `align` is a power of two.
+            // SAFETY: `align` is a power of two, and thus non-zero.
+            Some(Self(unsafe { NonZero::new_unchecked(align) }))
+        } else {
+            None
+        }
+    }
+
+    /// Returns the alignment of `T`.
+    #[inline(always)]
+    pub const fn of<T>() -> Self {
+        Self::new(align_of::<T>())
+    }
+
+    /// Returns this alignment as a `usize`.
+    ///
+    /// It is guaranteed to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(16).as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn as_usize(self) -> usize {
+        self.as_nonzero().get()
+    }
+
+    /// Returns this alignment as a [`NonZero`].
+    ///
+    /// It is guaranteed to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(16).as_nonzero().get(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn as_nonzero(self) -> NonZero<usize> {
+        // Allow the compiler to know that the value is indeed a power of two. This can help
+        // optimize some operations down the line, like e.g. replacing divisions by bit shifts.
+        if !self.0.is_power_of_two() {
+            // SAFETY: per the invariants, `self.0` is always a power of two so this block will
+            // never be reached.
+            unsafe { core::hint::unreachable_unchecked() }
+        }
+        self.0
+    }
+
+    /// Returns the base-2 logarithm of the alignment.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::of::<u8>().log2(), 0);
+    /// assert_eq!(Alignment::new(16).log2(), 4);
+    /// ```
+    #[inline(always)]
+    pub const fn log2(self) -> u32 {
+        self.0.ilog2()
+    }
+
+    /// Returns the mask for this alignment.
+    ///
+    /// This is equivalent to `!(self.as_usize() - 1)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(0x10).mask(), !0xf);
+    /// ```
+    #[inline(always)]
+    pub const fn mask(self) -> usize {
+        // No underflow can occur as the alignment is guaranteed to be a power of two, and thus is
+        // non-zero.
+        !(self.as_usize() - 1)
+    }
+}
+
+/// Trait for items that can be aligned against an [`Alignment`].
+pub trait Alignable: Sized {
+    /// Aligns `self` down to `alignment`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::{Alignable, Alignment};
+    ///
+    /// assert_eq!(0x2f_usize.align_down(Alignment::new(0x10)), 0x20);
+    /// assert_eq!(0x30usize.align_down(Alignment::new(0x10)), 0x30);
+    /// assert_eq!(0xf0u8.align_down(Alignment::new(0x1000)), 0x0);
+    /// ```
+    fn align_down(self, alignment: Alignment) -> Self;
+
+    /// Aligns `self` up to `alignment`, returning `None` if aligning would result in an overflow.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::{Alignable, Alignment};
+    ///
+    /// assert_eq!(0x4fusize.align_up(Alignment::new(0x10)), Some(0x50));
+    /// assert_eq!(0x40usize.align_up(Alignment::new(0x10)), Some(0x40));
+    /// assert_eq!(0x0usize.align_up(Alignment::new(0x10)), Some(0x0));
+    /// assert_eq!(u8::MAX.align_up(Alignment::new(0x10)), None);
+    /// assert_eq!(0x10u8.align_up(Alignment::new(0x100)), None);
+    /// assert_eq!(0x0u8.align_up(Alignment::new(0x100)), Some(0x0));
+    /// ```
+    fn align_up(self, alignment: Alignment) -> Option<Self>;
+}
+
+/// Implement [`Alignable`] for unsigned integer types.
+macro_rules! impl_alignable_uint {
+    ($($t:ty),*) => {
+        $(
+        impl Alignable for $t {
+            #[inline(always)]
+            fn align_down(self, alignment: Alignment) -> Self {
+                // The operands of `&` need to be of the same type so convert the alignment to
+                // `Self`. This means we need to compute the mask ourselves.
+                ::core::num::NonZero::<Self>::try_from(alignment.as_nonzero())
+                    .map(|align| self & !(align.get() - 1))
+                    // An alignment larger than `Self` always aligns down to `0`.
+                    .unwrap_or(0)
+            }
+
+            #[inline(always)]
+            fn align_up(self, alignment: Alignment) -> Option<Self> {
+                let aligned_down = self.align_down(alignment);
+                if self == aligned_down {
+                    Some(aligned_down)
+                } else {
+                    Self::try_from(alignment.as_usize())
+                        .ok()
+                        .and_then(|align| aligned_down.checked_add(align))
+                }
+            }
+        }
+        )*
+    };
+}
+
+impl_alignable_uint!(u8, u16, u32, u64, usize);

-- 
2.50.1

