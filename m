Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE2C606C3
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 15:14:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D892410E1A0;
	Sat, 15 Nov 2025 14:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nt2zYKQF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013068.outbound.protection.outlook.com
 [40.93.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2C10E1A0;
 Sat, 15 Nov 2025 14:14:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5TEoWHGbEd/UZ0/Cwi95Y+LFJyOLBJiKhu5pMg98beXYez4kVJE7TzvN/Stq4+BET7fkXSN4VWWZUcR4PaE9l+NfzNrPHIJHOQto4pqsvTva7i8oGkocI5/PeC6/GSMuhziobnwTPcUL8me7KxmiZntV1bNrMtiXEsjaRZIU8eMLz21GvkxUX8lW1A/fKgy8tg9p33+98Xlw5/+9pdgHowmIU6Xap0KklCu/jjitmPn5476YgxBaBQJdeT/LuvE8+U5RyHCW03P9eEs30KDKcXIJCzlqWZVXPoRxpE/Za03ei+bzOg18C5YuyORgQW3otJyP8jEpOSQG8r35LjzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71mOfzlUr8vJD24lYEJgvDQXk4bhy3KHoTZltzYJYbM=;
 b=a6veBm4MNOFGEYnFWSO0dWI9F1eKPPJoRn1hsPl45dI73O2K8PiOFwgUuea8LH0KvnGWKEV4HN+TcigYGeaCfhdk89NsFbZlq/sXC3X807V7+NsBdZTvL0nWf/4pkqsuv/eLbwHqYGXAM2SNBpBnXi2RsAbig5zrO6g+m8YxRVjxgeIV8Q8gKmWFjBL1bzj5QFy2tS6ddB7/Ek2vnjOUb4fqefskxZd57btGDa2x60eSKK0FJpHXeVXBQZNc6DmOFlsfH6PPHqZAHOKUL7B1lf9jZ8mDZO7t56xp2/VmjufdY3fWg1E6RFwDSdYaE+EbdruAL3miFEJ0VaPc6N3i9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71mOfzlUr8vJD24lYEJgvDQXk4bhy3KHoTZltzYJYbM=;
 b=nt2zYKQFQ0d+j67LMS/DKh+zvVjwq866NWR/x0+fOPnqnfQ0k4f9gNhOJ2YVpJ+i0H4aXFfUDAgXH2On+smMqCPbRg+3WdAHUHg4qVV1wrhl68bP7aZRcM1kc1sjxOZ/wXlCBTZvCr4pTCu3ZO0udtAWf4L/cSvV5VURyjlWf2O5YqonlyLusooMU/9Zo82i85P856pX+ZkvYbxjZTOwdYvCCQ+k7z/JCwBX2dOmf/7cnO8Owger2a5HeoF4Nho73C0yPfIhNBB+4HgwWWxOVEqhFIrDXHhuzP8ho7o5Gn+CBlN3hIEBXyWL+GMo5A4YfLNMPZe6ie84Li8tJIdj8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6822.namprd12.prod.outlook.com (2603:10b6:806:25d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Sat, 15 Nov
 2025 14:14:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 14:13:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 23:13:53 +0900
Message-Id: <DE9BX3JU2CXF.2TOJUW5WCLENA@nvidia.com>
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
Subject: Re: [PATCH v9 3/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251115010923.1192144-1-jhubbard@nvidia.com>
 <20251115010923.1192144-4-jhubbard@nvidia.com>
In-Reply-To: <20251115010923.1192144-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6822:EE_
X-MS-Office365-Filtering-Correlation-Id: cf5a46f3-0910-4e86-39e2-08de2451371b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|10070799003|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bysrb21HWWZ2d2ljMlZ3RkVFem41cE5Lc0ttcmZYOFBsVUV6aGRDQXVFTytk?=
 =?utf-8?B?Y2hWeUdhL0pLbnprNUs3ellVNFNPeU9NQWFxcHhqbFZ4bXA4ZWNWOWdSdjE4?=
 =?utf-8?B?bmEyRHFNQ1duWGRjZHJjS2NzWkJtb2VlUWNoTmc2Uzg0cUUzbFlMWi9kN3ZW?=
 =?utf-8?B?Y1RMaDc2N0ZqYjQ2ejhaU1orWVhubWU4Wk9JVzBwbS9xT3N4dUlWTEl1akcx?=
 =?utf-8?B?NDM5a05uYUwxdll5cjgrakVxZWtPcjU0enhlZjhlSzJqa1FpcGUyK3NZc0pW?=
 =?utf-8?B?R3JHMjAxK1NHdUU4SGZTWC9UR29XZjlHWC9UQkJzL2FYNnY4UUNCbGFubVZ4?=
 =?utf-8?B?OE12MGRLYlEraTlVSkp5WktwTkE4c0k0OE51TzJ3RndyMnkvTlNibmJzRjda?=
 =?utf-8?B?TWg1cGFXajJJWE1EdnU5Q0VNYXRnK2E0Z0dHZkdreWVEdXhDbnVmcE5pVmhu?=
 =?utf-8?B?MmVFNVZYN2YwRStYRnh5Tjl0TFNkeTF4NFNKeFBDeGFXL0NBVVg5aUI3L2gw?=
 =?utf-8?B?TWNDcVpXdlBHdHJabWVnclFsNE9QS0c5OVRGVGUxWjVCaDhRZG5RRVFOZ01x?=
 =?utf-8?B?bmV0T3NNUjVZdGZ6SWpwTXVlOVZEOXdKOS9yejZOZTc0OFd4djVHVkE4WlFq?=
 =?utf-8?B?ZTErS3hTaTlmY245cGZDSVd6T2JTZXNPT0dpVmRkTTdkUFFDeVVTKzlYL0F6?=
 =?utf-8?B?UXFLVlNsM3hDVlR2QUkzcUtoNVdTWnY3UnJIVitkQ3RkTGZlVWJUUVN1VXdM?=
 =?utf-8?B?WHFDT2ljVGhrS21vUGdlQVNscXBoSkJuaWF2VmszbGVoM3J4aldkRzlndnRP?=
 =?utf-8?B?RmV3YmV1dFRCancrVmMxaWdFbElLVjk4TWIwalNBSlBjeHc3OVRpR1ozL2xH?=
 =?utf-8?B?SjJ2MWhFQXRnNUZpakd3eU93cGd4TDd2LzhMT2JRMHVMeGM1bFIyZ2lMbjk5?=
 =?utf-8?B?VFFrMjV4b29uRURFeXJHMnAwQ1JwT2tjUlA2NUVsMnUzNDhJYS90c0Z5K2xn?=
 =?utf-8?B?VFUwUVZZMkYxZGFrczZXdzR2eGhDUklFejlHaE5ZQi9FdUp1R1poMXE3USsy?=
 =?utf-8?B?TjJvc2loMzBWNWk5K1RkY2I0MkpuVU9wbGRVUmtYcUFjWm9kOGphUnNxaDZp?=
 =?utf-8?B?R2Y0ajU0OXNWenE5YzRXbkZ4b1RXWlQ4YWlCMjlRUGxPVDBFZXArcDkraElv?=
 =?utf-8?B?MkFEd3hvUXMvLzR1dDZzaXlHbkc5WmI1eTBnWFo3OGN6bkZDVHlHQmQ0bENz?=
 =?utf-8?B?NjExZ2IxRS9DSnIyTVdiMDNibjd0cWRxTjJFSU5xY2IyU21YQ2R6TDVLeHZy?=
 =?utf-8?B?bG1Xb0ZkWldNTWlobFZEeDg4bmY0VDQ0TjhVN3RUSGVPUjVSMWZGY1g4QXNo?=
 =?utf-8?B?c1VkdThHRi85ZmxhUFhXZ094Rk44RjdkVGtHaHpGU1gxVHhYNzBpQ3FFQ1l1?=
 =?utf-8?B?V3FseXFPNzBmUDZGeDZkVW12VGRoQ1RzcDNtZG5VRzR6aU5SVmxneWNlUzh0?=
 =?utf-8?B?OCtQMmZWeG0wSHBMOWl2NlZZOVNpc1BkMEVvT3BJVHdoUEhBaXd6Mi9oZ2hy?=
 =?utf-8?B?NG5MT2xWK1NwRm1oRGtmSlZWWm4rbzZvc012MEt4ZXBVR0pCMHJpS1d6b2I0?=
 =?utf-8?B?Tk1uYTcwZGVNRWM3MVNJWDJXaW40a3lYSjBWYkpTaDByY2pHUlRKNmFzOTN4?=
 =?utf-8?B?a0pMSldqUFZ5a1EyZW9tTzByczNUYUZkK0lhRUxtc3NncE8xRjFVdk9mM3A0?=
 =?utf-8?B?Nmx1eklRZUdpMjQ0ak5Pc3Z3YmVIN3VsbDVEbFZabVM2c28yN2ppQ05XWUh3?=
 =?utf-8?B?WEc3aEtvQndDTVlpeTZ5dFRoc1Nxa3VtT1BZUkNnbEQ3ZUk1Q3FobVFTOHJ3?=
 =?utf-8?B?elFnVGgyZnMwTFNJODROK0lIZU1EVk1iOEFqb2RWajFHdXJ6eFlUaEVnOXFx?=
 =?utf-8?Q?Q2xvmTWYDOK0oNRwMZw3RZlovaQ+tHmS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(10070799003)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnNBUVdhVDJIaHROY01lZklNcGZQR0lPOU1IUDAvT0g0R2FtSzQxTEJYSUhv?=
 =?utf-8?B?bzY0Tm01SlFBQnNsVkFPZnhTMWxhalh2amxrbVhicDZFS0szcTdUbFlJSDI3?=
 =?utf-8?B?YmFYK1VaWU4wbEY5cHROYjA3UGtPNzRMMWhpbGtQUXN4Q2pPdXNjN0RDNlgy?=
 =?utf-8?B?dE5xQWVXTlJSYTBZeXUvNjBIQ0NORCt5S1FtMU5xSW84aS93aWlzNC9zeDFi?=
 =?utf-8?B?dnJWWkpxZXp3WVAreHFDN0EzODRDZ1BSNUdaYXhaU01oM1hPNkJ3SkRtdUUr?=
 =?utf-8?B?bTh3a0pnejlPZU8wVC9YUUJDSVppN1N5aTk1Zlkyd1hNamkvdUc5bDZCSTJ6?=
 =?utf-8?B?dGVDbnRMWEs4UUw1WUhoY2ZRTE15MVpWMFdTNDFIU2V2NEZxOEthc1BSUUdV?=
 =?utf-8?B?akxPY28wQ0wzZjdObC9KWnlMeXVweUpyVkhnTzZ6b3h6WXM4RVlITEhpNXZZ?=
 =?utf-8?B?U2cyL29qRjNLVUpPblFwQkg5OUxWMDF5djlRRHp2L2daY0ROaEV4eHM1Z3BT?=
 =?utf-8?B?VkxDdExZWk1haTZJSXVqd1F5ZldtdXA5UkRmRGw5YlZUMXFGK1pCNnBOaEw3?=
 =?utf-8?B?SlduekRvUndVdkd0YzZ6T2piUFNTeGFnQ251K0Q3NHpvV2szUnBNYUh0WnBM?=
 =?utf-8?B?eDQ5U2ZHQ041UlNPSitrM1duSnozcFpZYldpMlhkeHhlRnNtdUhTV0NJV2li?=
 =?utf-8?B?cFlvRnBJNTNHajNHZ1kzcjA4L2drVjZpNzMzb0tYRzVmeHE5c1JMZTJmUUph?=
 =?utf-8?B?cU1INGpYdktyRGhhQ2o2WHNacjZiYk10eTZBYi9vSVhTNjBjQnppQStTK2hY?=
 =?utf-8?B?Qk5uazJ1TWpQWlo4dCtjdzR3TEFXNk9vVXZQUlFGa1dnbXV5MFZVSlNVdnVC?=
 =?utf-8?B?UG1sRGhDZ1ZQWVBDQXJNSi93OUVjYWdFUlc1YW8wNWhTbk5IZXd0OGhKc1BU?=
 =?utf-8?B?cE1nQ05LdVpWQjRxNW1XU0tSVzFwWW5XL3pSNXhNTTlCbDRUWDcwM0ZjSTVN?=
 =?utf-8?B?eE41VDNEZk5mclFjai8zbE9SdEQvWi83N2c2MFQyeFdHODdkdEdRSkd1bGJ6?=
 =?utf-8?B?cURHRGVoQ2NtTy9SVXJ6c20yVVFZMHJsbGEwY2o2YnJqV2VnYUVmVVpvVmVx?=
 =?utf-8?B?TVFtOUdZOHFHMlZmR3NvVDFZRTNiSnlOQ2NPNVFpUVdCQWZrV3dGNHloelpm?=
 =?utf-8?B?bU9NWi9RcVhkNEZLTk1PK0pBKzhVcWlyRDhNZ0tWalZCR2xtVVVBZys1aG9B?=
 =?utf-8?B?eGFLa1BTbi9FdU5KaElGeTZrSEVKNjBhSGhOakFjUzBGazZzYVZlU1c4TlNx?=
 =?utf-8?B?OWc4M2p2MTNHb2ZEQXJNYXZRYWJnSTRMekhMdWxxR3JraVg0UnUyR3NjdlQ2?=
 =?utf-8?B?MVdIL1JlRU96YmIwZ0pnVHNtOVo0MmYrVzZERkZlZEpoVVZZRFFoQ1o3Qm9r?=
 =?utf-8?B?MVRvRmk2akU5Q0lFYXdXZU5IZXlzRitXb29sNkl3d0tTY1lERkU4SXRpVjhP?=
 =?utf-8?B?NHkzWDlOK3FtR1poTzVsSmE2ZFVUNlBvQUIvai9YbTZ4TnFEbk1hUDBHbTZY?=
 =?utf-8?B?NGNSbDR6WnJMalQyL0Mza2pMZlNKVThRaGdzSkhRRTVlL1pkU2s5Rjhhd1Ey?=
 =?utf-8?B?aU03b29TaVJZTWhOd1NyMTFhTWp2TUNHTDFTZDdnaTJDSk5IYU02K0ZXeDZD?=
 =?utf-8?B?MDVOZHRvdjEzbFVobEdpUWVaMWpwckV5VTdZa3MvR2lmN3d1RjBBbE95OU1p?=
 =?utf-8?B?WVVyK0ZmUzhQT2k1ZmhZUDBOMWIrd0FxMml6R21iM0JYZWN5UXV6TjMweVQ0?=
 =?utf-8?B?RGdONElab2t5VmVsRjJvRnc5cFdlZnZmUitwUVpnTWQ0dUsvOGdUTnNJejhN?=
 =?utf-8?B?RDlla3c2ZTdqNFhxUGc5M1l5WjJURGtyYjNvbkdiU3lQMk5PN21RT2cwL3J1?=
 =?utf-8?B?Q2JHZGlNTmc0eVhvQVdhYSs4bGZYVWtEd1MwK2YremFvRzFJdUJoSUFnbHFr?=
 =?utf-8?B?OS9sM2hlQjkrQnM3VTdTUHRvTTJ3KzZWZzZYZ2NGRnpHZHV3YXUrSnUxWWth?=
 =?utf-8?B?S3NGZUdkNGEzSHdUMFJzZ3o2WHk1TDV1N2UzbXNXR20zMTA5TmlLTEVGN0ZO?=
 =?utf-8?B?UlFvWmVkeXVET0hEUU9BNXhodHUxVFUrZEF0NVdyUC9xdkpDVTBzTm05TmNo?=
 =?utf-8?Q?zzOspOo2b/OMFUjpV5sY+vBxz2IDQoib0YIb5RorEhnm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf5a46f3-0910-4e86-39e2-08de2451371b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 14:13:57.1851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ddV+gL5K1sHHEP5Y+K5yiojJXJ7bac6NJ7SEu8qCuK2HuxP1CN3vvWpH69b6jmpYwsL9+4jlxaEfIki1J+qFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6822
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
> NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
> architecture and revision details, and will instead use NV_PMC_BOOT_42
> in the future. NV_PMC_BOOT_0 will contain a specific set of values
> that will mean "go read NV_PMC_BOOT_42 instead".
>
> Change the selection logic in Nova so that it will claim Turing and
> later GPUs. This will work for the foreseeable future, without any
> further code changes here, because all NVIDIA GPUs are considered, from
> the oldest supported on Linux (NV04), through the future GPUs.
>
> Add some comment documentation to explain, chronologically, how boot0
> and boot42 change with the GPU eras, and how that affects the selection
> logic.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  | 41 ++++++++++++++++++++++++++++++-----
>  drivers/gpu/nova-core/regs.rs | 21 +++++++++++++-----
>  2 files changed, 52 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 88a6d7af9f37..8e04628ca3d9 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -169,6 +169,15 @@ fn from(boot0: regs::NV_PMC_BOOT_0) -> Self {
>      }
>  }
> =20
> +impl From<regs::NV_PMC_BOOT_42> for Revision {
> +    fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
> +        Self {
> +            major: boot0.major_revision(),
> +            minor: boot0.minor_revision(),
> +        }
> +    }
> +}

Just one nit: similarly to how we are converting the `TryFrom<BOOT_0>
for Spec` into a `TryFrom<BOOT_42>`, I think we don't need to keep
`From<BOOT_0> for Revision`. Actually we don't even want it, as using it
would mean we are relying on BOOT_0 instead of BOOT_42, which this
patchset nicely makes our only source of truth.

I'll thus remove the `From<BOOT_0>` implementation before applying.

