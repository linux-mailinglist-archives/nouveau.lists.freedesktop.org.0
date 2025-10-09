Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECFEBC90ED
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 14:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E67210EA1D;
	Thu,  9 Oct 2025 12:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b94ywZ2+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D06810EA1D
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 12:37:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN/weG+s1PSKElqopoomqt0tMAOUPLAT5jOByH5/R2i+K2DxNtsJ3gZIGS3jUpdb9muyrGdMKtNZjzlgdEbOOGnuNUKCXOn+73Q0xB7d6XVyIE0QT6QaIoRoKAoaPIB1Ag1hcYDqta6la5QukmM5qimUMt7T3ig5XbBy2/uxZcggZpcxmxKpjf+UgG4VB0c0Ni4P4FJpUxrEW8GoQC84Re9nObtgALrkszxUlnYc+0kSJmNYfsSFRV7y7Ztv8xdlwT8wqj0aUu/34A0v9w6qsMko32fedDjcUPlggTn0HwpSXk5Id9q1Y3jiR9MsUKtehRvdMKj+jgqFH8RsrZYtvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qH+yJLowws0j6nJTSuZDoxWZdEtWofDOV4UK1VDo+9g=;
 b=k2IEdeDbxpiEo2ScUjMHtonvAYLlJW3DFixxSeyhciOcVKP5wxYq9RvIZ4xHYCteO9QDj6547R0k7UL+I4eJAoYYKd2T9XJ30wUoXLvBVSwqYsIXROZunEtcjHC/QxKmEXmVff7r25BC4i7AkQAh4LYIgOpJYDknH5jg99wRrZmLpKY1oVUdqwHTH/pmx36/qgjMFVTP8NbrBoKpCTQs4pqBAZosGJB8rRqvJhahCRKhknzwt9C4ahE6uyZdtI70EXXPc5KsZbHbp8heCH5me5189mVUaVTHZ42Xolpzz2lH56YDUjdVmrknZE7NRJqMWbdwmmhWJoYJN8ftqGiKGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qH+yJLowws0j6nJTSuZDoxWZdEtWofDOV4UK1VDo+9g=;
 b=b94ywZ2+e33iS6R/6lbMKtwcwOCC2UK+1nj1O3X5SYTEa3VvSvUHw85qYCbzcrirDU5d/lQVFXRhrfR0W7CitishCICQh6I9eyxqMYOLLEPqB/Km6vC6o6MEoP4i5ZNxqaGYsfji1h4kbpgSxfoj4T+WKc2DYUZ5BKS8FGtHOIJCBfM1cegL8YO9uVoZ8UUl3ZiE1s4RHWlliFWU1POG75VaqGl7FV86o1BxNaATqxWC+pynJHKn/qoC6msG8mv6uCxfaMnc8Lm9VPAQOanpljyPQNdM7xac0LCDg4zSmxtoN53gm+iFsGMotKNFpblyUEuDQTa4TD2bUPi+QQJrCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 12:37:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 12:37:32 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 09 Oct 2025 21:37:09 +0900
Subject: [PATCH RFC v2 2/3] rust: kernel: add bounded integer types
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
In-Reply-To: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0016.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 13349d4e-910c-412f-b776-08de07309d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZThkcVIzeklVYmc3a1VTM2JMU3U0cGI1Z284WTd6aE1MUFNVbkhRWG5BQUxE?=
 =?utf-8?B?eXk5ZFNTdkxWM2xLcWNXQVk5L1hTV3EwTlBkVEZ0ODR2SGVneGpsSjRtQkpS?=
 =?utf-8?B?QlAxd3VCS2cvamZMZ1R3ekVPYlhUSDlCN2swcFNaMSs0Ynp2Ry83Nkc5M3lZ?=
 =?utf-8?B?WEZaQlYyNlpYcWg0cjBNRGdQZEloTi9oaE1JOWlZSWQvSE1jZU8vU0l4a096?=
 =?utf-8?B?eWVOUkl2SWZVTm1xUjcxb2xyT0VGd3RhTXdZMy83alJKMS9lRW9WbFZGT2xk?=
 =?utf-8?B?ckNxUStSTElPOWd3LytpOGg4VzVuZ0h1TkNDQlFRbjBSeXZqTThpbkYwZU9C?=
 =?utf-8?B?NDZNTGh4NVZIQ01LaWxYV1lPYTRJRjl1YjVwWWJSODkxcEx2WGplZG11VUMv?=
 =?utf-8?B?bWJOL045M2R0bmkxdkUvdHpDbW05ajRPNThmZ1MwRnlCWG5TWHh6Q3haalFJ?=
 =?utf-8?B?eUR5ZWNYMXlDZExQSEZOU0poMTFFOTNmUlRUWjAzK2w4eFg5blRUeWZIRlJK?=
 =?utf-8?B?Yk5VcFlXdzlJdTc5REVTL3dYZXlHSERIUTVTMms5QjkyMGs0L0xzNGhCZXBO?=
 =?utf-8?B?UnpHaVhaRkpQaVRnSzA5T0xqQytCdWxzZXZEd0NJcDlhbnJVMWMzT09TSStW?=
 =?utf-8?B?d01NMmIwczBTaXNYUE5jNTdybVJrR0p6bldCenVndm5YS2diUjd6VlBnMjVj?=
 =?utf-8?B?ZFlyUk9qdEo2REFWUDUxU0tLd3Y0RC9ZTWNidmRGVWZWZk5WYzl3NHVseG9o?=
 =?utf-8?B?RlJ1OGVYTWxtYmxLVDFVUWl6UzNsOE43T2h6Q2J3TXRvd0N2UTkwMHUzTEpw?=
 =?utf-8?B?RTVJaE5nREZSakpjY05wOGttRnVDR1B6bjA5Q1hycDJaZERQbEZVWGhmK240?=
 =?utf-8?B?eVVhS3pKVSszRmxBZHQ4aFh2OVdOK2JmRTNEYjI3TkRDc0dOYVcrN1hoVDAx?=
 =?utf-8?B?YlpTZm1ZYjI4Yk9kV1g4cUdnVnVTb05QZm8rWUw3V2JNRDBpdGc1Q0paWjRn?=
 =?utf-8?B?V0U2ZjdHTms3VFNtYzVsQ1U4V3lpbUprR3R0TVZ0M3hnYXNqY25kWlNvaHI3?=
 =?utf-8?B?M24yRG9VaS83T0haVjJXQXhCcnpSK0V3MDBqL2RDLy9CczVwMnNwdkkraVht?=
 =?utf-8?B?VlE1cFRSRzNyMFRVcUFUK01xUUIraTRpOFRIZDU5U1JIcXJqUkNTY0Rlam5R?=
 =?utf-8?B?QlMyNllkWjBHdEgvVktMdUl6Vm1jYUNNdEZSb0t1RnMzZnZYb0RBdkZCeEdz?=
 =?utf-8?B?b1RtMmJjc0ZFdWZzR1prOHIzdG1FZEJkeE5sSzJxYUxRdFdObmgxd2cyL3VM?=
 =?utf-8?B?a3BkMTlyVm91RTFDQVVvZ2V4VXh1d3JvaDVYeFZNUEFVOVUxeW5xY1dWSzVX?=
 =?utf-8?B?Tjg4em0vTElVY09MWVhCYjZrbkJHOWxaTHAzU2EvQXRLNXlGdU0xYkNrdVlB?=
 =?utf-8?B?R0N6OTVnejllZ1BRODNYWUxhZGR1MXZ3RWdzNmhZNE1nM2hXLzkwS3FlaHov?=
 =?utf-8?B?Qk1LSlErSVBqdU9mYVJvTTZVbGpqcUxIOUdpcXUzbHJoeTFUMnd2VVpQUHBl?=
 =?utf-8?B?SGMrOUltUHdaL3NSUlJSUFlUcHFKem90R1pqaU1hRmJGOU8yN1FTUFI3N1VU?=
 =?utf-8?B?Ukhla2piZVczU2UwdjRHYm4vL1Q0clVLTkZieHR3MG9IQXhZUGhjUE93Vlky?=
 =?utf-8?B?SjFOUWxNdXVpYVNxYlRIaHluWjk2T1RES0hyRldXVERBSWM2UUQxWnBhRkI0?=
 =?utf-8?B?QlZ1ZWRDTmhSU0M2b1RNQmVFTzd4aHRsL1pUTHlzNG1mN3U4Q21mc2NMYnFm?=
 =?utf-8?B?QmVzalc4V0FNOU0zclp2S0VIL3NrWnBmTDRmbFhwV1lIaFY1bkdQTVIzSmFF?=
 =?utf-8?B?OW1hWXV0UVlWczBjSGRxSUFjNFk2dU5GZDlEWi9WUXg1Z09YYllpNVhLTjZR?=
 =?utf-8?B?dnNuVVdFc0JXeHpCNzZVRGhvSlNkU3lmOVEvZmlMRVE0WHZkQ0s4TUM4TjJW?=
 =?utf-8?Q?B3Js3bg0drevMG3FIRBpFgOfvKuyYw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RS9ybHJOVWphUzYvczJxSzVscGZlSHVyWlgwWENBL1lXc0phNk5zZ29RRm1y?=
 =?utf-8?B?bzd0bGVaNHo5QTlERlhDTjZkNEt2TzhFU3FNY1p0K2l1eDhKM2lSQ2tIWHNJ?=
 =?utf-8?B?ZTlCbGhkSlNrUkxiYk1BRXZwVDIzWXROOEFwUTY0aWJpVlR6VGVlby8rMHpl?=
 =?utf-8?B?UVhUUmtqaE1SN3lMY21kQ2tRcVNCREhlRUY3Mm54cVNSUzh6WmJZYXNKWUp4?=
 =?utf-8?B?ZUxTNTh3cmdBNEJzdWhTREJwSjUvL004QXczSHBmWmc3TUNEVzJFR0xCV0p2?=
 =?utf-8?B?eG9CVGFtVnA5ZHhoVUczVlVJb0Rud2R3WXBza0xYZXVCdDJ1aG5Id0F3MXBE?=
 =?utf-8?B?V3VUWFJHTjhpZlJzMHI1Z3lpNmI0UDdIbmpLTUJQOEVNQTNmWGJpamNMdDNC?=
 =?utf-8?B?VEdKb3EyYU9aSDE2eGFnZG93bXFLN3JZaWwraTl5T0EvbnNDa2lYd3R0aHM4?=
 =?utf-8?B?d0JNdDhSUGU3QzdwTXQxRGsvL3FzTU5adkVpQlVjWVRKQ0hnTU5yZkhRS1Zq?=
 =?utf-8?B?S09zOXR1bXFqcEcrNVBTY2R5S040VVM5eTlzeXovelc3WXdnT21KdHJETXpB?=
 =?utf-8?B?SmNCTElPVHVVV29OaExMc0czNUJGcFYyS0owalhOVkhraWdNZ2QxTGdMZlZF?=
 =?utf-8?B?T2F6M3RuSUJONmFRbWRUWUZTcm9BdzRlMzk1Mm1ySzBNVDRlQzNqeml1Ly9S?=
 =?utf-8?B?SjlGUlRSVDNwb1NpTE1YYnpIV1FzU3RQcEVRNlpDdjloQXRFR28wTG8wbzhM?=
 =?utf-8?B?MzkyZFgyb1FKWmVSd0kwMHRDTmFPYWZNR0VWdHpEdmkyUkJHWHRIdDA5eGRl?=
 =?utf-8?B?QUFBOHFDY21FWDdtL2tIanRWSnJCZk5CVXB0VUppTGR3dWJZNEVEZHZoZ2Iv?=
 =?utf-8?B?NjJLZ0Z6TVE5aEp6c0NtWFdSSnAyeTdXd0h4SmQ3ek85Q0FvOW5nTzc0OWVl?=
 =?utf-8?B?aitwcHRITmZnaURtZEpyOTJIRDJCdy80aWQxTnhnTkovVG8wcENEdVM0STIv?=
 =?utf-8?B?WVc1MFUzK05QaHNQcGRWenBDTU1zQVBGUlNWTXorZ2lEMVlKZmRlMGlERE9x?=
 =?utf-8?B?VTVEc1Z5d0E4TDd0dWxuL2o0TTYrQ1VrdC9JTk5JdDdVMFQ4UG9sVUpkYS9W?=
 =?utf-8?B?bVJZZjJSVUdtbnc4cE43WjUrQ2dQV0RaU21UV2lYeDZEQjVBaHlseXJTaC9x?=
 =?utf-8?B?ZGl1SnF4bkxYZHExU3RVU09XMWFBQ1pLRU12UktwN0xVSkFoQXhRMnpuNXlH?=
 =?utf-8?B?MGZudldvRVpXUDFHd0ZteGN3aFU3cnNrTGJMZXcrZ0dLSHl1b0p0VURSZzho?=
 =?utf-8?B?QjE0YUhGdDY3OEJva3pOclZ1S2JOdWc4bjdQcGhrbWJqOUhMMzJzL1Fibkk0?=
 =?utf-8?B?eVBiVUZyK0FWaFFJdXpkMmhvblJHcjhmcFBxaGNCTEFBd1hCQzg3dHJEbFl5?=
 =?utf-8?B?b2VYYVdZZmlDaFpGQnJSZEh3enRoMTB5TGM1akRwWGRVWVh0aVBENGljSEdX?=
 =?utf-8?B?VGJCVHhOajlBcnJTdkRCTHhhOWFsUUdTcXNyTUY2SklwaHhvUVp4QUpJV2tN?=
 =?utf-8?B?V1NsWHovM0duYTVocnpOTmFRY0x3dEh1V1hoVlNQWndHcGlWSFplTWpqUDRD?=
 =?utf-8?B?VjNHa1pySzFlLzY1VFE3Qk41OFlxdGVRdVZieEVRaVZnRC9ZaEN1ektQSGpK?=
 =?utf-8?B?NUVDQzJiYngxQ2tjaVdUbjYzRG92U0lQbVRlZFYzOGVodnhGakJ4YUc1QzJt?=
 =?utf-8?B?bmxNbXpycEhYcjhydFMxeWl0SDd1dlliT3NRYlhld3FnZ0pWYUtlMnBENDNj?=
 =?utf-8?B?eGZDVkhDaHVMRnllRzdYc0duVk9FVFRsajBJSDQ2NlZWajN3WFE5NDAvWkIz?=
 =?utf-8?B?YnlUNUhVVGZ3eTk1WGxHdnp5S1hvd2l0aFpPNzhhQUhsUmNHeEttTVV5RmZN?=
 =?utf-8?B?MzVlNmFudEZKZVMyOExqd1h1MmJUMk5XazdrZ24yT0hkM0JGekRFSnpoRzk4?=
 =?utf-8?B?cUJCQ0V1ckhzeXh1V2RrM2Jwck5kNk5oWWZWTWhyUzBNZGdVVmFpTEx4VmFj?=
 =?utf-8?B?Z1RGekVWdmE4RlUyV1hWTUQwU0VjSEpKTExkbGs5RE9mWGY3Um5RS1E0YTJh?=
 =?utf-8?B?ZHdVOXJSRTlNWW05MkpSTDlwSGN2NDFGVGdhK3VBTXc5ejY1c3BkNUlIdllJ?=
 =?utf-8?Q?MgxhTXuL2K0FuLFeWIch8xIiQqb3Z9fgGZoaM8yNs5BS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13349d4e-910c-412f-b776-08de07309d90
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:37:32.0220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gzMQFvpBHEQ/1sgun3uXUiRdFcQBkbbzpo/IomgK9u43BQvUntDOTmgeHxWaLFZTxkvkt3K2GDskvxbDr+QZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315
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

Add the BoundedInt type, which restricts the number of bits allowed to
be used in a given integer value. This is useful to carry guarantees
when setting bitfields.

Alongside this type, many `From` and `TryFrom` implementations are
provided to reduce friction when using with regular integer types. Proxy
implementations of common integer traits are also provided.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   1 +
 rust/kernel/num.rs | 499 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 500 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fcffc3988a90..21c1f452ee6a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -101,6 +101,7 @@
 pub mod mm;
 #[cfg(CONFIG_NET)]
 pub mod net;
+pub mod num;
 pub mod of;
 #[cfg(CONFIG_PM_OPP)]
 pub mod opp;
diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
new file mode 100644
index 000000000000..b2aad95ce51c
--- /dev/null
+++ b/rust/kernel/num.rs
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Numerical types for the kernel.
+
+use kernel::prelude::*;
+
+/// Integer type for which only the bits `0..NUM_BITS` are valid.
+///
+/// # Invariants
+///
+/// Stored values are represented with at most `NUM_BITS` bits.
+#[repr(transparent)]
+#[derive(Clone, Copy, Debug, Default, Hash)]
+pub struct BoundedInt<T, const NUM_BITS: u32>(T);
+
+/// Returns `true` if `$value` can be represented with at most `$NUM_BITS` on `$type`.
+macro_rules! is_in_bounds {
+    ($value:expr, $type:ty, $num_bits:expr) => {{
+        let v = $value;
+        v & <$type as Boundable<NUM_BITS>>::MASK == v
+    }};
+}
+
+/// Trait for primitive integer types that can be used with `BoundedInt`.
+pub trait Boundable<const NUM_BITS: u32>
+where
+    Self: Sized + Copy + core::ops::BitAnd<Output = Self> + core::cmp::PartialEq,
+    Self: TryInto<u8> + TryInto<u16> + TryInto<u32> + TryInto<u64>,
+{
+    /// Mask of the valid bits for this type.
+    const MASK: Self;
+
+    /// Returns `true` if `value` can be represented with at most `NUM_BITS`.
+    ///
+    /// TODO: post-RFC: replace this with a left-shift followed by right-shift operation. This will
+    /// allow us to handle signed values as well.
+    fn is_in_bounds(value: Self) -> bool {
+        is_in_bounds!(value, Self, NUM_BITS)
+    }
+}
+
+impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u8 {
+    const MASK: u8 = crate::bits::genmask_u8(0..=(NUM_BITS - 1));
+}
+
+impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u16 {
+    const MASK: u16 = crate::bits::genmask_u16(0..=(NUM_BITS - 1));
+}
+
+impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u32 {
+    const MASK: u32 = crate::bits::genmask_u32(0..=(NUM_BITS - 1));
+}
+
+impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u64 {
+    const MASK: u64 = crate::bits::genmask_u64(0..=(NUM_BITS - 1));
+}
+
+impl<T, const NUM_BITS: u32> BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+{
+    /// Checks that `value` is valid for this type at compile-time and build a new value.
+    ///
+    /// This relies on [`build_assert!`] to perform validation at compile-time. If `value` cannot
+    /// be inferred to be in bounds at compile-time, use the fallible [`Self::try_new`] instead.
+    ///
+    /// When possible, use one of the `new_const` methods instead of this method as it statically
+    /// validates `value` instead of relying on the compiler's optimizations.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::BoundedInt;
+    ///
+    /// # fn some_number() -> u32 { 0xffffffff }
+    ///
+    /// assert_eq!(BoundedInt::<u8, 1>::new(1).get(), 1);
+    /// assert_eq!(BoundedInt::<u16, 8>::new(0xff).get(), 0xff);
+    ///
+    /// // Triggers a build error as `0x1ff` doesn't fit into 8 bits.
+    /// // assert_eq!(BoundedInt::<u32, 8>::new(0x1ff).get(), 0x1ff);
+    ///
+    /// let v: u32 = some_number();
+    /// // Triggers a build error as `v` cannot be asserted to fit within 4 bits...
+    /// // let _ = BoundedInt::<u32, 4>::new(v);
+    /// // ... but this works as the compiler can assert the range from the mask.
+    /// let _ = BoundedInt::<u32, 4>::new(v & 0xf);
+    /// ```
+    pub fn new(value: T) -> Self {
+        crate::build_assert!(
+            T::is_in_bounds(value),
+            "Provided parameter is larger than maximal supported value"
+        );
+
+        Self(value)
+    }
+
+    /// Attempts to convert `value` into a value bounded by `NUM_BITS`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::BoundedInt;
+    ///
+    /// assert_eq!(BoundedInt::<u8, 1>::try_new(1).map(|v| v.get()), Ok(1));
+    /// assert_eq!(BoundedInt::<u16, 8>::try_new(0xff).map(|v| v.get()), Ok(0xff));
+    ///
+    /// // `0x1ff` doesn't fit into 8 bits.
+    /// assert_eq!(BoundedInt::<u32, 8>::try_new(0x1ff), Err(EOVERFLOW));
+    /// ```
+    pub fn try_new(value: T) -> Result<Self> {
+        if !T::is_in_bounds(value) {
+            Err(EOVERFLOW)
+        } else {
+            Ok(Self(value))
+        }
+    }
+
+    /// Returns the contained value as a primitive type.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::BoundedInt;
+    ///
+    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
+    /// assert_eq!(v.get(), 7u32);
+    /// ```
+    pub fn get(self) -> T {
+        if !T::is_in_bounds(self.0) {
+            // SAFETY: Per the invariants, `self.0` cannot have bits set outside of `MASK`, so
+            // this block will
+            // never be reached.
+            unsafe { core::hint::unreachable_unchecked() }
+        }
+        self.0
+    }
+
+    /// Increase the number of bits usable for `self`.
+    ///
+    /// This operation cannot fail.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::BoundedInt;
+    ///
+    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
+    /// let larger_v = v.enlarge::<12>();
+    /// // The contained values are equal even though `larger_v` has a bigger capacity.
+    /// assert_eq!(larger_v, v);
+    /// ```
+    pub const fn enlarge<const NEW_NUM_BITS: u32>(self) -> BoundedInt<T, NEW_NUM_BITS>
+    where
+        T: Boundable<NEW_NUM_BITS>,
+        T: Copy,
+    {
+        build_assert!(NEW_NUM_BITS >= NUM_BITS);
+
+        // INVARIANT: the value did fit within `NUM_BITS`, so it will all the more fit within
+        // `NEW_NUM_BITS` which is larger.
+        BoundedInt(self.0)
+    }
+
+    /// Shrink the number of bits usable for `self`.
+    ///
+    /// Returns `EOVERFLOW` if the value of `self` cannot be represented within `NEW_NUM_BITS`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::BoundedInt;
+    ///
+    /// let v = BoundedInt::<u32, 12>::new_const::<7>();
+    /// let smaller_v = v.shrink::<4>()?;
+    /// // The contained values are equal even though `smaller_v` has a smaller capacity.
+    /// assert_eq!(smaller_v, v);
+    ///
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn shrink<const NEW_NUM_BITS: u32>(self) -> Result<BoundedInt<T, NEW_NUM_BITS>>
+    where
+        T: Boundable<NEW_NUM_BITS>,
+        T: Copy,
+    {
+        BoundedInt::<T, NEW_NUM_BITS>::try_new(self.get())
+    }
+
+    /// Casts `self` into a `BoundedInt` using a different storage type, but using the same
+    /// number of bits for representation.
+    ///
+    /// This method cannot fail as the number of bits used for representation doesn't change.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::num::BoundedInt;
+    ///
+    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
+    /// let smaller_v: BoundedInt<u8, _> = v.cast();
+    /// // The contained values are equal even though `smaller_v` has a smaller storage type.
+    /// assert_eq!(u32::from(smaller_v.get()), v.get());
+    /// ```
+    pub fn cast<U>(self) -> BoundedInt<U, NUM_BITS>
+    where
+        U: TryFrom<T> + Boundable<NUM_BITS>,
+    {
+        // SAFETY: the contained value is represented using `NUM_BITS`, and `U` can be bounded to
+        // `NUM_BITS`, hence the conversion cannot fail.
+        let value = unsafe { U::try_from(self.0).unwrap_unchecked() };
+
+        // INVARIANT: although the storage type has changed, the value is still represented within
+        // `NUM_BITS`.
+        BoundedInt(value)
+    }
+}
+
+/// Validating the value as a const expression cannot be done as a regular method, as the
+/// arithmetic expressions we rely on to check the bounds are not const. Thus, implement
+/// `new_const` using a macro.
+macro_rules! impl_const_new {
+    ($($type:ty)*) => {
+        $(
+        impl<const NUM_BITS: u32> BoundedInt<$type, NUM_BITS> {
+            /// Creates a bounded value for `VALUE`, statically validated.
+            ///
+            /// This method should be used instead of [`Self::new`] when the value is a constant
+            /// expression.
+            ///
+            /// # Examples
+            /// ```
+            /// use kernel::num::BoundedInt;
+            ///
+            #[doc = ::core::concat!(
+                "let v = BoundedInt::<",
+                ::core::stringify!($type),
+                ", 4>::new_const::<7>();")]
+            /// assert_eq!(v.get(), 7);
+            /// ```
+            pub const fn new_const<const VALUE: $type>() -> Self {
+                build_assert!(is_in_bounds!(VALUE, $type, NUM_BITS));
+
+                Self(VALUE)
+            }
+        }
+        )*
+    };
+}
+
+impl_const_new!(u8 u16 u32 u64);
+
+/// Declares a new `$trait` and implements it for all bounded types represented using `$num_bits`.
+///
+/// This is used to declare properties as traits that we can use for later implementations.
+macro_rules! impl_size_rule {
+    ($trait:ident, $($num_bits:literal)*) => {
+        trait $trait {}
+
+        $(
+        impl<T> $trait for BoundedInt<T, $num_bits> where T: Boundable<$num_bits> {}
+        )*
+    };
+}
+
+// Bounds that are larger than a `u64`.
+impl_size_rule!(LargerThanU64, 64);
+
+// Bounds that are larger than a `u32`.
+impl_size_rule!(LargerThanU32,
+    32 33 34 35 36 37 38 39
+    40 41 42 43 44 45 46 47
+    48 49 50 51 52 53 54 55
+    56 57 58 59 60 61 62 63
+);
+// Anything larger than `u64` is also larger than `u32`.
+impl<T> LargerThanU32 for T where T: LargerThanU64 {}
+
+// Bounds that are larger than a `u16`.
+impl_size_rule!(LargerThanU16,
+    16 17 18 19 20 21 22 23
+    24 25 26 27 28 29 30 31
+);
+// Anything larger than `u32` is also larger than `u16`.
+impl<T> LargerThanU16 for T where T: LargerThanU32 {}
+
+// Bounds that are larger than a `u8`.
+impl_size_rule!(LargerThanU8, 8 9 10 11 12 13 14 15);
+// Anything larger than `u16` is also larger than `u8`.
+impl<T> LargerThanU8 for T where T: LargerThanU16 {}
+
+// Bounds that are larger than a boolean.
+impl_size_rule!(LargerThanBool, 1 2 3 4 5 6 7);
+// Anything larger than `u8` is also larger than `bool`.
+impl<T> LargerThanBool for T where T: LargerThanU8 {}
+
+/// Generates `From` implementations from a primitive type into a bounded integer that is
+/// guaranteed to being able to contain it.
+macro_rules! impl_from_primitive {
+    ($($type:ty => $trait:ident),*) => {
+        $(
+        impl<T, const NUM_BITS: u32> From<$type> for BoundedInt<T, NUM_BITS>
+        where
+            Self: $trait,
+            T: From<$type>,
+        {
+            fn from(value: $type) -> Self {
+                Self(T::from(value))
+            }
+        }
+        )*
+    }
+}
+
+impl_from_primitive!(
+    bool => LargerThanBool,
+    u8 => LargerThanU8,
+    u16 => LargerThanU16,
+    u32 => LargerThanU32,
+    u64 => LargerThanU64
+);
+
+impl_size_rule!(FitsIntoBool, 1);
+
+impl_size_rule!(FitsIntoU8, 2 3 4 5 6 7 8);
+
+// Anything that fits into a `bool` also fits into a `u8`.
+impl<T> FitsIntoU8 for T where T: FitsIntoBool {}
+
+impl_size_rule!(FitsIntoU16, 9 10 11 12 13 14 15 16);
+
+// Anything that fits into a `u8` also fits into a `u16`.
+impl<T> FitsIntoU16 for T where T: FitsIntoU8 {}
+
+impl_size_rule!(FitsIntoU32,
+    17 18 19 20 21 22 23 24
+    25 26 27 28 29 30 31 32
+);
+
+// Anything that fits into a `u16` also fits into a `u32`.
+impl<T> FitsIntoU32 for T where T: FitsIntoU16 {}
+
+impl_size_rule!(FitsIntoU64,
+    33 34 35 36 37 38 39 40
+    41 42 43 44 45 46 47 48
+    49 50 51 52 53 54 55 56
+    57 58 59 60 61 62 63 64
+);
+
+// Anything that fits into a `u32` also fits into a `u64`.
+impl<T> FitsIntoU64 for T where T: FitsIntoU32 {}
+
+/// Generates `From` implementations from a bounded integer into a primitive type that is
+/// guaranteed to being able to contain it.
+macro_rules! impl_into_primitive {
+    ($($trait:ident => $type:ty),*) => {
+        $(
+        impl<T, const NUM_BITS: u32> From<BoundedInt<T, NUM_BITS>> for $type
+        where
+            T: Boundable<NUM_BITS>,
+            BoundedInt<T, NUM_BITS>: $trait
+        {
+            fn from(value: BoundedInt<T, NUM_BITS>) -> Self {
+                // SAFETY: per the `BoundedInt` invariants, less than 8 bits are used to the conversion
+                // cannot fail.
+                unsafe { value.get().try_into().unwrap_unchecked() }
+            }
+        }
+        )*
+    }
+}
+
+impl_into_primitive!(
+    FitsIntoU8 => u8,
+    FitsIntoU16 => u16,
+    FitsIntoU32 => u32,
+    FitsIntoU64 => u64
+);
+
+// Conversion to boolean must be handled separately as it does not have `TryFrom` implementation
+// from integers.
+impl<T> From<BoundedInt<T, 1>> for bool
+where
+    T: Boundable<1>,
+    BoundedInt<T, 1>: FitsIntoBool,
+    T: PartialEq + Zeroable,
+{
+    fn from(value: BoundedInt<T, 1>) -> Self {
+        value.get() != Zeroable::zeroed()
+    }
+}
+
+/// Trait similar to `TryInto` to avoid conflicting implementations errors.
+pub trait TryIntoBounded<T: Boundable<NUM_BITS>, const NUM_BITS: u32> {
+    /// Attempts to convert `self` into a value bounded by `NUM_BITS`.
+    fn try_into(self) -> Result<BoundedInt<T, NUM_BITS>>;
+}
+
+/// Any value can be attempted to be converted into a bounded integer of any size.
+impl<T, U, const NUM_BITS: u32> TryIntoBounded<T, NUM_BITS> for U
+where
+    T: Boundable<NUM_BITS>,
+    U: TryInto<T>,
+{
+    fn try_into(self) -> Result<BoundedInt<T, NUM_BITS>> {
+        self.try_into()
+            .map_err(|_| EOVERFLOW)
+            .and_then(BoundedInt::try_new)
+    }
+}
+
+/// `BoundedInts` can be compared if their respective storage types can be.
+impl<T, U, const NUM_BITS: u32, const NUM_BITS_U: u32> PartialEq<BoundedInt<U, NUM_BITS_U>>
+    for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    U: Boundable<NUM_BITS_U>,
+    T: PartialEq<U>,
+{
+    fn eq(&self, other: &BoundedInt<U, NUM_BITS_U>) -> bool {
+        self.get() == other.get()
+    }
+}
+
+impl<T, const NUM_BITS: u32> Eq for BoundedInt<T, NUM_BITS> where T: Boundable<NUM_BITS> {}
+
+/// `BoundedInts` can be ordered if their respective storage types can be.
+impl<T, U, const NUM_BITS: u32, const NUM_BITS_U: u32> PartialOrd<BoundedInt<U, NUM_BITS_U>>
+    for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    U: Boundable<NUM_BITS_U>,
+    T: PartialOrd<U>,
+{
+    fn partial_cmp(&self, other: &BoundedInt<U, NUM_BITS_U>) -> Option<core::cmp::Ordering> {
+        self.get().partial_cmp(&other.get())
+    }
+}
+
+impl<T, const NUM_BITS: u32> Ord for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    T: Ord,
+{
+    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
+        self.get().cmp(&other.get())
+    }
+}
+
+/// Allow comparison with non-bounded values.
+impl<T, const NUM_BITS: u32> PartialEq<T> for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    T: PartialEq,
+{
+    fn eq(&self, other: &T) -> bool {
+        self.get() == *other
+    }
+}
+
+/// Allow ordering with non-bounded values.
+impl<T, const NUM_BITS: u32> PartialOrd<T> for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    T: PartialOrd,
+{
+    fn partial_cmp(&self, other: &T) -> Option<core::cmp::Ordering> {
+        self.get().partial_cmp(other)
+    }
+}
+
+impl<T, const NUM_BITS: u32> core::fmt::Display for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    T: core::fmt::Display,
+{
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        self.0.fmt(f)
+    }
+}
+
+impl<T, const NUM_BITS: u32> core::fmt::LowerHex for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    T: core::fmt::LowerHex,
+{
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        self.0.fmt(f)
+    }
+}
+
+impl<T, const NUM_BITS: u32> core::fmt::UpperHex for BoundedInt<T, NUM_BITS>
+where
+    T: Boundable<NUM_BITS>,
+    T: core::fmt::UpperHex,
+{
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        self.0.fmt(f)
+    }
+}

-- 
2.51.0

