Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E38B1BFBD
	for <lists+nouveau@lfdr.de>; Wed,  6 Aug 2025 07:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C305810E272;
	Wed,  6 Aug 2025 05:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z88+MsxF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7DB310E272;
 Wed,  6 Aug 2025 05:03:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiTzkrxB6QnIrHprudpWAnkl95Cf8rOTTw2ceYO4nxzlYZDcOQkSkTnUEjgeShkPgQdFofQ7LAJNTh5/5TmahZJQ6+7xkxvoS2Yh6XkH4h+hVayezUsq5IgqM9BBzdMzyNMl8uEd9ZaQ4psJjVeMrCfNTpGYRDDounVuWapC1XBS5xXExseE8DYi6ncVcFBFxswv604VxsxYVzeQP7cwX3R0xs1z3o+X5YnoZiMrbM/In74VY0cXJWwjUf2bp5A4G2mXfWTsBNCN3MIFQ0OQ/F2l/2nPtfViZqJiT/NN3u2h+MEzTTYOeOSJCKuGyziHflt5geKWO0TPtqt4bum1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OobxuHk+5/yOp/XhHO8U6ctCtuhkDlpznIvHK9ttHqA=;
 b=Xqf1bQNBWWsrIDB2o/jN4bo2gYZZG0C3y9r9SYx8QvFzZeRVNJQiQXd2rADmzIqgNFu/xzWErjbzvTtnSs/Bu6vQlfqYty1AM2a6l1vq98ajfqlPfTkCWNTYBDq1Ai8Ui4akPbsa/qwRZC/0UIY+V8JfRWCFt1i3XIYJpMy7KwFFP1+Px6Ny6K6DRBQJftD9WBcrmDFnDEWOZ7nXiA1BhuOExIT01xrJW+elqe5ZFVTPRwg5AB4M/sDEvJZEvhgmp8swwuvmDwvpkt6/6BkSRRkAwNaZkKWo6kx+Nd/zwpeS853uMUqq87WNNAGquYFQs5JMweraYDayGC9UDGx4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OobxuHk+5/yOp/XhHO8U6ctCtuhkDlpznIvHK9ttHqA=;
 b=Z88+MsxFJRZ7Gkqzi85cI5eZraDVLs0w8BWCjAYJ6RKApKdg5lfy4Sv5sHXWMVme8KFvcwWTxXGfHZF2SM19yAVxJ2mhiG1fKGkp073kNsLEFtjNGlB9cu9ht2SozMCupMs2DdBH06DZ5aTvXKGSpzOaXI96tOjFyxoIkZKXM2PakFYJWHMYHnltEfCj/Ll5XTHQQBkejfENrbAdeJ2FiBGHmvQYiBEgA5Tst2xhBOUO/ro8UQ8L72IchA7403Wwoit9eOxoTRF3Cqlmu+h3P/hHECqAVnXM0s07UpoXNWs6R9BV+ujGxsujsNxTawG2g5kqEiHoWdG9YIHxe0e5yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7772.namprd12.prod.outlook.com (2603:10b6:8:138::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 05:02:56 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 05:02:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 14:02:52 +0900
Message-Id: <DBV2Y6TJGVZZ.1XZG9FEIWYDBU@nvidia.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
 <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
 <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com>
 <CANiq72=AtpG=B+VcyWoX+qL_tk-uUtgiLXYJD0epOfnwYfPD7Q@mail.gmail.com>
 <DBTGVEJQOUDM.OTGZ6PXLB9JV@nvidia.com>
In-Reply-To: <DBTGVEJQOUDM.OTGZ6PXLB9JV@nvidia.com>
X-ClientProxiedBy: TYAPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:404:29::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7772:EE_
X-MS-Office365-Filtering-Correlation-Id: a09a5996-d9bb-4761-c41e-08ddd4a68191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVlrRnF0S1dUNTFiSng3ZEVuYklWczJmSU5DOERScGxEazNYK05oR0hmOC9Z?=
 =?utf-8?B?NGhsZFJ1d0F3RDZDQVo5L3VlYTgzdjh5cFNnTWswUnJIeWl6TWVlczZla25p?=
 =?utf-8?B?Mm9KQXNwTGM4clpzZjROY0piZlF5ZUhVUU5ycnhmR0dNeFIvc1p6ckZQS1I4?=
 =?utf-8?B?WG5aRTk2L0JTdWZtWGxtY0Q4TjM0R3lpaFN4VG43aTR1RHZ3QkwzV2J6QzU3?=
 =?utf-8?B?K0lOQU4rZ1NzUDlMOGtpRUc4aUp3eUdDZkx4WnBwbDNhZklMYXZ6SDQrMWtK?=
 =?utf-8?B?SlJRaUtEV1VBbkpWUUhXQU5SaFFTZnJUZFZRTXJSbmJuVkVEMnVMaWo2OTBD?=
 =?utf-8?B?WmsxUE1pWFN4K09oMVFzNUNSWmg3VUJYYUZsN1JlOEpaaDJlK2pab3FPa1VO?=
 =?utf-8?B?L3JMaldwNmdBWUJpYVRpV2JNYVo3a3JxT0VGVVpOMXZoZ050bGFJb1pIQzNl?=
 =?utf-8?B?bks0MEIzZGJpemtZZmRJS2grNHZrb2RFQzAvRFllakhWaTNjVmlIaG1yMDhx?=
 =?utf-8?B?cmxkR1FiSXNaTkVCSXRkSlZ1bUQ0UVVQenVTUG5hanVOdnBDTzRTY1NrbW05?=
 =?utf-8?B?bGlRZWNVOUZJbFh1ZkwrVTExNTZGVnI0NEk3ZlAwYTMxOU5POUgvb0NIUHhq?=
 =?utf-8?B?U1NkWnkwVjlZQ3JGVnBNVXRBb3F4SVU4dGllZjllU1h5amE4QXJ1bHlyVllk?=
 =?utf-8?B?VENKWmFlZUZrd25MNWlva0dscnljbStmVlJDLzZZaGF0UG5CUGVtWUw1dUhU?=
 =?utf-8?B?RGRZQk52bnJnUjl3OW1SK1NNakkzUHB2bDQrR0luTFB5SjVpVFR1bEFyd24z?=
 =?utf-8?B?MVVieHE2Rlk4NzduMkdrY2RYY0pJb2o0THR2MmhIQlV2eEY5Y0FJRCswL3hn?=
 =?utf-8?B?cW5XQ0MyVnREOVV5TSsrbkxJQm9WUGVzbUZwYU53MWF3bEZqcTFpakRlbDdY?=
 =?utf-8?B?NkxReEFOcURvVU5UaUQxVDEvaVNqZ1U5RVMxR0Jsb2ZFV0hnZzhKZCtrbjBS?=
 =?utf-8?B?b1RiZXQ1cGpnc2FsWGhzZ0wwMm5wWDdnV3VGV3FhQjJocExHWU5MS1lGc25L?=
 =?utf-8?B?eExscUN3dUpNVVNuN1dHZTQ2bENHc3VkZEtndkgzclgvbmVTMkx0eDVVTEVs?=
 =?utf-8?B?enVTSE91cy9rVjdQeFZqL0hxbHFDODNVdnMxUFJ4d045ck1xWDl6YTJFM2N5?=
 =?utf-8?B?b3Q0KzZYY1pGT3ZtVUFCaGFMTVBSUldITFQyYzMyaTJpc2NGRjd3dVNtSGR4?=
 =?utf-8?B?b2t3QWQ1K21JdHJYTHF2L0JqZDhCQkJxbm41WVhzODNvNy9HTHBPblFPanB4?=
 =?utf-8?B?U21nMmthSWZRLy83NlJDeTI1N1NXN0owMW00YTBwQjdhUXlaTEVuQy9MZW1X?=
 =?utf-8?B?TDhFTXZYWVRwNmdZN01HZUF2K0llNW5hMlFRWk9BcjhzcWxBeFRqMGlXcEtC?=
 =?utf-8?B?SHZBVUJjLzBsWVBSNmNEYWw3bE0zVDV1bE1TL1YvVmMvSmt4TG4zLzJjUWxu?=
 =?utf-8?B?a1lmTDlKbW94SWN4Nkp1QzEzbVdVUEhuQUNzeUVjc0ZUcGxqY2dCU0h0YW1Z?=
 =?utf-8?B?WjFyRWRSbWE0YWU4aUQ5Qk5FeExVZmk0VUFmU2MzemNvakFjeFQ4U2x0YXo1?=
 =?utf-8?B?SGFlK1FiaFhuckRoK0lSYlVsMnFYRCt2Z3R5Rk5QT1ZpK0lVL3UrMDBhOHdN?=
 =?utf-8?B?b09FVVl5UXg5KzNpbWZITWdPWXdLT3dOZXZadXVlampWRDI4QUp2dG4zWVlo?=
 =?utf-8?B?TkNVR2psQzBEM0l2SjVKcmV6Z20rRDVyN1Npa09aNXY4NGxQR28vWmttWi9i?=
 =?utf-8?B?ZTNBZmREd0gxY0UrSGcwS2swZlBwdUJPRkFwYzRRVFJIYlByU1Z6azhuMUh6?=
 =?utf-8?B?QnhXMnhBVnhuT285T1p3bUplZE4yZE5uY1ZLYUtHdW5Pa2c1V0lxNmMzejRI?=
 =?utf-8?Q?RSYDALMLknk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3Urd1ZQNzduVmVISFJ1bk9CNFhlR0NhM3haZ0dJOStML1BNYmJPVmMvbmF2?=
 =?utf-8?B?NWVqMmVQMlV1a2ZsY3lveWM2RGVkQWxjUWc3cUdycWZ3cW1UWTY3SlNQelRD?=
 =?utf-8?B?WEMzbytKdHZhZnRXS2lEanJsWXZ1TVBiWVBzL0V0dHVsOUhlR3FncTUwVVZu?=
 =?utf-8?B?YksyckR2VDQzNjdWcGx4TG9neHI0OTIrWUpMZE13UDFqckZoT1lQLzhSU1BE?=
 =?utf-8?B?MmVodng3ck1pMWZvTUNiMWtaZk5QZU5ua2QwOVYrdjMzek9Fa3pBSjZ4eTU1?=
 =?utf-8?B?aHJzNzh6UFk5UDI5VHBEWmQ2SVdUc2N6TG1hekhoNm1jV0hLRmJyM1ROU2dZ?=
 =?utf-8?B?SU5QbWdEbWlESFJOem5tZGxXY0FVQUU1Vk9WaXdUNDVOT3RJOU5TT3FjM2N1?=
 =?utf-8?B?NEd4MlNlQkRkUzlnWWlDZm1XWWNibHlzWVhDWnF5Y2gxQ09JZjlvZi9hSFZF?=
 =?utf-8?B?ZWZYU0s5RFM5M1pPMjJhMW1WMVdsVEsyNnQ4SjdIVDd5ZFRFaSt0V0tmMjNy?=
 =?utf-8?B?N2htck4vNHBwNmhxZURyYk9PTWpUc0FPaDM4Wm1iZnRyNUhBQmRTck05Wk9r?=
 =?utf-8?B?WVRpVkJnMkhSOURpdE44VkJaSzVPaFU3c2VnQ2MwUHpuc3I1NTlYYm5vVmlE?=
 =?utf-8?B?dEVVL0E2MnhEK3BZeGNXRUc5cEJFbTdwQ3JJM1hSUXlkYnlLcHY4Y3hTL1p5?=
 =?utf-8?B?dUo0Z05XMHhjL3grMGIvWkxRSmwrS1BNRXBLaTBqd3dyWkdHTjU0VCtMYnJF?=
 =?utf-8?B?RkhIZGFRZWxPZDl0bitROU5QczVMeGZlNDdGdk1VN3JIanBxWmZ5aUZ5emZH?=
 =?utf-8?B?UkpraEx3eGsyRllhSHdQVjUyYzJTQklMQlRMT2I3V3NyWUF0MVZ1WmJzM2dS?=
 =?utf-8?B?aFI0WjZhZVE2Y2xGRjlEdURtaHFIL2Fxd3piTm5mS1lCYldic2krREtQTHcw?=
 =?utf-8?B?WEhKeVRubHAwYTBMYTJac1IzaWU5MnVabWowVkRSVU5mNE4rY3VLRStIMWdX?=
 =?utf-8?B?VGUvWHJVK0l1M0pWSi9ua3NWZjVZaGZVaC82WEpXTTJCd04ySXFqRSsvZHRS?=
 =?utf-8?B?UzBoak9wQi8rYTJCbm5PZlZmVW9Vc3cybHhzT3FMRHplbHpuTjk2RjFHcXZ6?=
 =?utf-8?B?L2lhNWR0cjZQYUZiend4S1VEUlBhY25PSGpOVkczSVNVVTk5NlNab0FocTNk?=
 =?utf-8?B?YUZVZWVhWUdkb3p3WWptbnBNVjRKd2RCdDdJRlc1UzU2MnhWc2tzWjFwUFBQ?=
 =?utf-8?B?NGd6ZEpndHN2M0pXVXZTaHU4RXpHb2R0SGJaaGpUczNCSmZRN1ZRL0huVGg2?=
 =?utf-8?B?V20vOEpoTjRQS2Z0dDZOcGVhQlRkYUJXaks1M0FCR0lzLzhoZ0RSL2FkUkhx?=
 =?utf-8?B?bXM0NGFQc1lXWGZsaFV0R1VCUDNhMXhGWkRFNjVKVHhJNDVDZDdIekVOQkdS?=
 =?utf-8?B?eDg4YlppRjdSVitmL3NUWk54dW9OMkNPNHZWTkdNUTJvd2IxcHRMNjFORkYv?=
 =?utf-8?B?dTBNTUROR0J0dkFsVG5wamtELy82WUp1T0Z6TGtyQTJVTGpUT2xCSTlNWXN6?=
 =?utf-8?B?WUE1MDAzK2xmZkUvZmhoWUlGRUsrN3d2Wjh3cGxudDZUdmh1SE1YYXlJM3Ns?=
 =?utf-8?B?TEUrR2JJaWtjWnJqcU9mNWU5VTFXT0hGOWNncmFrUFIvdlBjSGFKU2Z6aDRk?=
 =?utf-8?B?QzB4RXg5dWRoL3krekFYS1pIbVVkTTZ4cjVQSm9rZkdvMzBrR2htakZPZ2hj?=
 =?utf-8?B?THdtV01oUy9DS1J6ZlNudzFFMUVCazg2V0tEU1pQVlFQSDBWeC9FL3dLM2NT?=
 =?utf-8?B?VnAzdWMyc29Sbnh1RTNNWDRiQ1NDMXB6U245emgrSkVwZTk0RS8wSitEcWtn?=
 =?utf-8?B?dGtRb0dQVWVwcXZtTDhnMHdYYzRCWFltem93WTM1NUlOemwzaVBBeDErZE5Q?=
 =?utf-8?B?Y252Y3krL3U3dkZJU0ZhQ1lGaE1xRnJkQmFxeGE4VEZ2L3ZHN0V0aTlRQVpT?=
 =?utf-8?B?YjlaS0NNUjBBbUZ4RlFPaGkzb2pNWitBZDNMOG1IT2U0SE1pdENaOTlxQXR1?=
 =?utf-8?B?bzRhOGZQa2dmNHh5UndxREJjS2xmQkRUYlMrMGNrSG5iQWlOeEVvdlRTWFE2?=
 =?utf-8?B?V3JFNGJzZFhkWFRmaldlM29nbG5wY3BwaDVFVnFBUHlWZHlDcklIOGFlQmU2?=
 =?utf-8?Q?5ndZObfGTsos70173nFNSJXQUIuSsFtjXvlsdOhUy2cI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09a5996-d9bb-4761-c41e-08ddd4a68191
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 05:02:56.3297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3n6mb8fhFW1gD3TQfCC+lcLtZ6lOYH8nudACYsAl5rZE2OzQpp7FkVPRs+p5EfW/IIZQrb7qqxnhWxNU6DF8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7772
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

On Mon Aug 4, 2025 at 4:32 PM JST, Alexandre Courbot wrote:
> On Mon Aug 4, 2025 at 12:15 AM JST, Miguel Ojeda wrote:
>> On Sun, Aug 3, 2025 at 3:13=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>>
>>> We got some interesting feedback on the ACP already. I have been pointe=
d
>>> to `checked_ilog2` as an equivalent of `last_set_bit`, and it *does*
>>> indeed work well as a replacement - with the caveat that the name is
>>> not very natural to me (or anyone familiar with the C interface). Is
>>> this something we can live with? If we decide to go with the existing
>>> standard library method, how can we make sure that folks looking for an
>>> equivalent of `fls` find `checked_ilog2`?
>>
>> One option is using the `doc(alias =3D ...)` attribute, which makes it
>> appear in the search in the rendered docs, and would show easily in
>> greps too.
>>
>> Another option is simply wrapping it in an `inline(always)`, I guess,
>> but I think we can just use the upstream ones, unless we want slightly
>> different semantics.
>
> That would be useful - let's see what the Rust lib folks say, as you
> brought up that question on the ACP as well.
>
> In any case, since we have reasonable alternatives for both `fls`
> (`checked_ilog2`) and `ffs` (`NonZero::trailing_zeros`), I guess this
> means we want to use these directly in the kernel and can drop patch
> 2 of this series?

I didn't expect that, but it looks like the Rust folks want these
methods after all:

https://github.com/rust-lang/libs-team/issues/631#issuecomment-3156000663

I'll proceed with sending a PR, and I guess we can have temporary
implementations in the kernel as well?
