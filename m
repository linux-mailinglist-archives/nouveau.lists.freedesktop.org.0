Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6743C6074B
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 15:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B616710E0B1;
	Sat, 15 Nov 2025 14:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c/2P+uaN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849DE10E0B1;
 Sat, 15 Nov 2025 14:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hn7DIgxEyQ40aMuzODPZJv1i2EV/zK1XtoNkUXTNdAPddAClLwFCyIwFTCSv4/vj0V9/Ar7jzbXB/dMUua+1/Zh3QwZvWzlgAlYguvCCxWz8xafz9tzc1ai2YR6K+adMhC4fKQIPrcpVJEIR1zNWT40TMaHElWFyFdPuPzkCPyynGQq5pe5xiTpDnmqRnzr4Zb7ostBxuoNAtWNMxp7+8cGjqQe1/Lfb2Z1H2YMJXGfVNwXKddE3af5wUldJp+P9ZlmdjSVvyRQ495LoPiP0cRht3CWf1DxjOhyv93Ze/pUDLIHH3RhLCxTmPmYjgKBgfiDO7ZEWtPZM+eZ0z6iwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6/kF29agR2G65GgxatOeFt+A2nIeonKZ8S2SckJrkg=;
 b=sOuurLCKj3R4rWCkfsV2aEhA2gDCtq1+Nw2+x1LdhbzGDZxihoeFgqUtpeS5pXwk6GOCPVVD4OfKePQEVGXBpBX4xxwLjoBmajItYpnkp4Hij8Ht+fAIOlFRUqRkduy4PLzGGRnz3QJ+uAHK23aepujG+UM1Z5X274UjjvfrvjyXEnP87YhNU1I05AmT2Z5Klj4aQ8Iw9LBKIv/QQysLcc86Psjp6EVkctALWvw3SIxswNWca7XfIH7OI8ZmMiNm0x07UrKZ8yLi5oZ3K1jpLpn6u3K5BS8ZdrYO0XNsFJY8XnNSu+jhiyi+sa9d9BDjdNcMUemsOSOGrUoKfM8hsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6/kF29agR2G65GgxatOeFt+A2nIeonKZ8S2SckJrkg=;
 b=c/2P+uaNZrAWJeNxsv2rvqIxykEUL2su+cqWmGD4vk+VPDoIl2FDUh0HezTYHpLktYuqzWQbQ6O37cLmQw/D6t+2b78R7rkVf/ga1zyE4v1JGVpUxpIMekcbkgoCi0WVmQSlWvOSDNqE4REf8CwMMQkldnhR9DQVrrJ8Zmgv0GihlOIB20PmUv0bhi7q0LV0vl7892wf2p9Ju8l4vTPOxouxuC/OUMDIg76qNZ+tWRnj2qWDvRbyTSWO+MOcQK0N9QCIGCavNBi/CkHqDm4+ES8p3rXCgJufS8OrjNFoFojzmXu9RNRormQMzitw3T3caEycrUfnVv52ntAZ0KnWIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY5PR12MB6155.namprd12.prod.outlook.com (2603:10b6:930:25::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 14:25:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 14:25:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 23:25:49 +0900
Message-Id: <DE9C68FD0SEX.ZTWY4J4V0VGP@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v9 0/4] gpu: nova: add boot42 support for next-gen GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
In-Reply-To: <20251115010923.1192144-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:372::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY5PR12MB6155:EE_
X-MS-Office365-Filtering-Correlation-Id: 5980eef6-6f57-44f1-c645-08de2452e1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|366016|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWt2RjlpbFZSSzNHa09VK09US1BGdThocUdZUlJlbVJFVkozZ0VESlJwK3Fh?=
 =?utf-8?B?L0FQRnVmbnR2b25nbVZNSG5HWFE1Y1d5dlFtSUdkUXlVeDR4YnJkWnlsaWk0?=
 =?utf-8?B?VXBLc0QvVEc4TUtCSVcrb3dJdEV6OTNSYnI4WE5DSDg3cVdxOGJhSXVGUzh3?=
 =?utf-8?B?MjNGUGUvU0JYWFFCb3YwVElOMnprMzZqWHpOUEhOYjVJRjlDSE5YL2NCT2pu?=
 =?utf-8?B?cUhpakJON1hrUHk0aXVsQ2w3dlQyUE44TnlZeDNSNTZsYVlKTzE1Q0NRMEdF?=
 =?utf-8?B?cjJKL2hxVVVoakdkQ1o2Zi82YW9aK3N2OExLcnFCRy8xejBaMkZzL09JR3o3?=
 =?utf-8?B?THNWaThpa1B5dDZOc3dwVFFqVHJ6ZnlFVkV3djE3ZGFQV0ttclYyZHJHWWFs?=
 =?utf-8?B?SkZmV0R0NkpOeCtlK3VHeEtqdjlyVTlBeTR5Rjh3WUhLaU92ZVNqS05vcFcy?=
 =?utf-8?B?dkZuSlRMWHNDNlJxeGFhR0xocGlKVmdkYWlDQ2l0TnVxeENCclBHSVNuSW5q?=
 =?utf-8?B?djNtRldXSjB0WGkyNFhSTTRYL0ZEK1VTS01TNTR1TVVRY0VXZEVBMmdPZklO?=
 =?utf-8?B?OGNLR2E0dVNYbjg5RHhhSExEZzV3S0kyaWlibVBxYjlOVURXK0dTYk4yYkVj?=
 =?utf-8?B?ZmdKWXJEOWlJV01yblBWRURDbC9SQ0NsR2lsM2FRc2VzRlJJc1o5TXNYZ2Uz?=
 =?utf-8?B?YnRBQkZJdG91MWwzZkI1eGNkaWhWWUhFSTZUUGF6ZE9CcytLd3hCWjdwUkJh?=
 =?utf-8?B?QStlQ2txM25IeDZDQVBVWG9yOGY1TmNnOHpUNUpUYldJTkdMaEg0M0J3K1gz?=
 =?utf-8?B?QnVHclA3TzRySGdlU2lRZ0czQUpkMGlMYTZMSFcyQkI5T0N2Z3NHVitkVUZN?=
 =?utf-8?B?MUpMZ0NYMmFMb0NWcU1xUFlGRnAxMm9XUHZmOWh2YUlMVWFGNTh0aDljeWpr?=
 =?utf-8?B?ejFIeEhlNCt3RjVVdVNVY2gydS9jM3diRDNWRW1DTWJQd0lXNjRZR2s4Snkx?=
 =?utf-8?B?aG5qWGlnK3BrNGMrZnhxS08wR1dXbEovZW1jU25GaEczamk2aGNkLzNkUVla?=
 =?utf-8?B?bXYyNFJldy9ZODhoMDhUNU5NMVBiWWJpM3VoTHRQY3o0dmZ4bWRQSU1KcTR3?=
 =?utf-8?B?MFNqRlFyVkN2Q1FKWG9IYWd3SGlLeEpQa1J4a3lXVzNRdTdMWHZMbVNCc015?=
 =?utf-8?B?czl5YUxBLzBtb25zSlRBR0dmL0l2SWpIWkpiTk01STRMNmdUWTRsOXRVTzh6?=
 =?utf-8?B?eUxwMlhwQWY1SHpyWXBpbi9HZHZNTkxxY2tkZWJtWGo1TmlnZVZmVm9FMWhJ?=
 =?utf-8?B?UHp1Yzk2bnJVZ1VEOWdkMkxyUTUxbHJ0U0FFbEJNR2YwTDFQdmdnNHZUTFRR?=
 =?utf-8?B?dlpyWWVNTzhvcFpsUXBhZlB1OU9UajF5T0o4VVZtbU1NRDJzMVJBbllCUXpL?=
 =?utf-8?B?cjl1NXA3TzJGc1c4QTZuV2RNaGJULy9wTSs1ZDV5aC9jb2hrMVFLVGxFL3Fl?=
 =?utf-8?B?amc0M2JMOGtmaVlUdGI4UFhnUmxxdmQwaFVoMzRvVkxLT2ZCWVZDeG9uVmVk?=
 =?utf-8?B?N0pZWmx6bHoxeGwrVEdBcGtVdy9UVXVtWXAvOGVTV2FROWhwa2pReUNOYytY?=
 =?utf-8?B?K1lrajdwK3cvKzFOT2tQVzNaK3c4TnJIZXNSY21mRWh1eTFYQ1hQUkhySS8y?=
 =?utf-8?B?LzRzTHFRSlhjbFU0MEVBZGRmV0ZnZkhCUkwyVlRWRGpDTWxUQ3k1Mm5FZy9F?=
 =?utf-8?B?SmsyLzFUV1U2TURpdDk1ZHZGS1EzWVI5RU52UU5nVUxkOWZhdUplTzhBUkpk?=
 =?utf-8?B?eU9pNnc4M01wL2NvcUJqMmxlbXhSNGxwczkvZXZabzRTVGZxSkR1TXFVWENl?=
 =?utf-8?B?TGQyZ3VjdzFRVG0vZFVWNkoyeGx2Z2p0cjRNVzlDSTNWVEU2aFRic2JUQWNI?=
 =?utf-8?Q?TFpqdQUbbjIZzHTnMy+DXRsTfpFL+TFa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0lnN1ozS0dZc2c5MW13ZnE4SU9uU0RCVUNHTlhZV1Y4b1VFT04yNUdYRjhO?=
 =?utf-8?B?MG9sZHJ4b2I3T3BXN243UnFSSWdaQVRYWWYrbnlkWElEUTM2YUE1aXhwL2d4?=
 =?utf-8?B?T0FnZnFaSS9iZitsOXJ2UEpXQ0s2dHhaQnhPMHNza3V5bDBWbEJ2OVZsUVIw?=
 =?utf-8?B?dVo3d3BLUzNjUFZUaUdheE5vZUx2cWRIWmI5aG9yeFFmVlNmSm9yaXkvWUtC?=
 =?utf-8?B?WXF3cEdNRTNmMWJIZXJhZ0Z0RmZ2QjE4cEdWc3dOMnh0TjJhSWd0WjBwSjNj?=
 =?utf-8?B?aFRBZExldXJxcksvcE45YVAvOHFhYlhEVHJQRTg0TjkrT1VnTnFhY2VwVXlP?=
 =?utf-8?B?T0ErZDRCMmxMaDdRRzVzcUhSc3NJYUNmRFF4UjVpblh4eXNPQ1d0eTdZdGFJ?=
 =?utf-8?B?dHpSMzVaUFFpOXFqTW10TXlYSWpLNVNySTdQTjhXdUNqbzBLOXhiVVladUxC?=
 =?utf-8?B?eld4RDZrbnFaR3JpWUxIZjdGaUl4RTJhTWVUZ2ZzSmpOTE9oVGpNdTlra3Bx?=
 =?utf-8?B?M01WZE5OeTR2dHJqVVRtNGFsdWZmS2hiOUlwd2R6d0JFdHNDUkdLUnNVY09z?=
 =?utf-8?B?alVsU29RK1lrN3dQT2xWR2ZTNkhiUTBsT2J4UGgxdU1CMGhraDhzZ3FmdExI?=
 =?utf-8?B?cEdGVWlJRVZoNnlmQ3BRRUFZb1VrZ1IzQXJXKy9LVTBsaDFnYUpCd0xJSTVn?=
 =?utf-8?B?RTZzb1RIMExZbW9PcjhOWU9LbEV3MlNLbzcyQ2M3cHVwZytud0dFY1pUT3Vi?=
 =?utf-8?B?dzNZejg5Qi9qZ0gwVXBiV0tYdVhCOGNpZDhOOExIQ2ZkU20zdE4yQk80TXhR?=
 =?utf-8?B?QStocVNoNS9ZZ055T1QveGhlWWZhZnU0UHNVQ1JKM2FZbEpiVlE1SFVYQThw?=
 =?utf-8?B?OFNCbDdvWGZWM0k3M1hqOUJjY0NmSGduazBnY1pvTkJuNDhpdksvTS9pNTJI?=
 =?utf-8?B?N3dMdlFuaDhneFBWYVNSTVNyT29oTlE0cWhycXBybWFzQ2NXNXJadnFVUGc5?=
 =?utf-8?B?Z0ZpeDZoRFFHd2djMFBKTU9FMCtyTG1ZWnZNWU5XSlhHVERHeGR2UUZ4K09l?=
 =?utf-8?B?V0x2ZHZPSy9rZ0c5QlBEaU94NHR4OWN0UFdITGYzT1liN2dZUnhFaVZsNjVq?=
 =?utf-8?B?cGtqczBLcGZYb2s1MWhkbzdJd0FGekkraUhvUzhCNFY5MUVlNmNxZGtTY3Za?=
 =?utf-8?B?T3lNZ0I3V0IvV2FZdlVxVkhCOGgyeXFUdFhITHNIOEM3NjZOeVBKRmxZM3FZ?=
 =?utf-8?B?cm01OGJCMGNoaGkrQXJ3Vy9uZmRYREpURTZXYklxeWdaY3FtUUp5L3U3anpH?=
 =?utf-8?B?Ukl6OWZidWg1UUdlVFBmN1JrcmNCV0JraVBaN082RVQ3RjhHYUUwZmJYdk1u?=
 =?utf-8?B?Z2ZDYytiTllMSERhM2pHVHdhU3V3NDFkWXBWT2JqWXZESWFMWlJ3WFhzdlhF?=
 =?utf-8?B?UFhBek93d1p1bzFacnY0VG4wTVJVUy9vak43ZTcxOUl5Q0tmc1NhRWxFcFVM?=
 =?utf-8?B?U3djczZxN2hWMm1FdldRUmJyN2ZuQzJIY05SOEw3UFdObExUeUpPWjhmQjdB?=
 =?utf-8?B?Sk9zL2ErVFQ5YmlucktmYkxRYjN3UEtSbUZqUmdQeCttb1hSbjRTWU9Tajdj?=
 =?utf-8?B?bkFDMHhjb295VWNxUWtnMFNjQ2xDOFE0OVMyZ3NmTGwxc3ZpVlpUQlIvQWgv?=
 =?utf-8?B?dE1OM0hRQUVpUEQzbTNHMXRla2JCMmxJbDRyeUpZUXpZZkFHSllQNEpVZjN2?=
 =?utf-8?B?UmxTakRFUnJSOTkwS2RnMTY0UlVjZGhzQVZQbVYyTWdaS2g0RXZKV2dEOUd0?=
 =?utf-8?B?eHVYcWtFWEgzcFppc3NRbk0vbkFOVUhpL3VJTDJuNDV0a3Boc2dxK1BKSlBR?=
 =?utf-8?B?NC9MWVRCTzFGejBYMG53S2s0U0grVDFOYXR0Y28wb3FHeFcvajdvR2lWckN6?=
 =?utf-8?B?R1BCZVI3TGVoME44OU02NkorbC9ZRmkxNEZ1T1pLdXpJY1l5aGwwUFlzZUJI?=
 =?utf-8?B?SHNoL3BQUHMwYkZPMm8wditRU2lpUGxIZEpJTlFOUEhqTEFkamZacDY0NXlH?=
 =?utf-8?B?RlVvbG5yRjZRWHJ6RUpER3BIZXNGOXNLQkxKeDhJTEhtT3p6VE14SmFKVTQw?=
 =?utf-8?B?eUQvdGZwTUJyMmtOTXF5NnplUDBuWm1xQzVVaWJhdVlsS1hRQ0lqUkQyZFRl?=
 =?utf-8?Q?74fslxnzeLqctIkIYXhNU53wqghBBdRDMEynwcXJVt2Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5980eef6-6f57-44f1-c645-08de2452e1b9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 14:25:53.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2s8xlAz7oVQYxctIm4v56mIXIr8xzIwJYrMVdLnsOIlO2moJk8k8tRPJmeSsyJGENFpMooRrTe5kLPoyey6KdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6155
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

On Sat Nov 15, 2025 at 10:09 AM JST, John Hubbard wrote:
> Changes in v9:
>
> 1) Simplified the Revision updates, so that Revision's member fields can
>    remain private (thanks to Alex Courbot).
>
> 2) Restore a missing documentation comment line for chipset().
>
> 3) Removed the patch that changed from ENODEV to ENOTSUPP, and used
>    ENODEV to mean "GPU is not supported", because the driver core
>    expects that specific error code.
>
> 4) Rebased onto drm-rust-next, which already has patch 1/1 from v8, so
>    that one no longer appears in v9.

Pushed to drm-rust-next, thank you!
