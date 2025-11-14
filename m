Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D0EC5D9EC
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 15:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C61E710EA84;
	Fri, 14 Nov 2025 14:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gyPbs1Aa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935710EA84;
 Fri, 14 Nov 2025 14:37:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnhmwPxgdVLUX7c7VG7HPMH+oTc5NLOU54Ju81pvn2quqGj4JLH0yp9cVq4qk/uxMjAEzZKpSFZUFUUIYla4ckg+gjQNUdkMx1wKEWYRocqC85RWfcF/dD5LsxhURnvURnGyfZpTbL0afBE08gcEp/osvIU4c0LF0lAlAdFQe8MirvmcOQB/9geWhiVKVhEr8dYad/44kketQkojYgWSCypIwK7xYu5TdDDBElIkVYIpxC6t7RnBzlDM1l/zJlxwRs/WZAgZrG5lrbfeFMmspDCEU+asL65YPuljVKu1ShFpRm3sGmjQ8WZmmVauomEyoqng/pipmP++ENYK6CmKvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+ZQp6CTc/Weo7o4Hku2U7Qshs/quJmuMG2J+9VA+IE=;
 b=KU28OENvDDWxFmhKPQUQeqgbNXKFZpu9Huh3ci/CU9TyqVdzbkQvMFQgZqkl9O/JdRsKQr59VivA70iP0tJObvrU4ZsBvHzKps3hWykJ8CAn3mZ4AeZ9r90jcnSJsYUsBWnGHCYTksUqCjqQERY27yR6SM8UJ2Q4iuHicr8NHDREttWsu7dqhG9gbDg5SWNKJRgk+ESgrHDsTk1V8TiYYS+c/kJjnqf4Epd+YP4t2x9+kN8QJHGdqzwSseXYLbdWY9baYfhKFl83AQFO7Yj2NjDq5OHVPbrMR/O52qVGmuI67TWWinifoqBPoAgZTmoyDQVstPFOacsVqvQy3v/5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+ZQp6CTc/Weo7o4Hku2U7Qshs/quJmuMG2J+9VA+IE=;
 b=gyPbs1AaIyDRs+XEvo9jOsVWitopTtrlQP68BMRcoet3ymD5YTR/y9O2aMgw/hRd1LcGtDxnM9QGJAUiucOGwhrStyKeIr5YOzC8XleKd1mjdEL9gYAPhX89CkrYdRAm1ksQN14tzq17th4iXEhuWMYa1xKxjDl26ZK5e+VC64xaZ6W+HkRARIuT2ynaA17+6dXAzZQ9pumQZb49b8mJ8/kz8lioP1V7viOXS+90cr3iw3ss0lLN0d6IIuxUDCpUmr3QIMVi9gw0vAeAg9txWSIA9nD0R2EX8naAAswJ6z/7Q8MskpqJJvNJIb9FVKL2OghHAR0ydC0/J3c10tEDoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 14:37:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:37:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 23:37:26 +0900
Message-Id: <DE8HSL6JS4DU.2V5WDFEN1L4X2@nvidia.com>
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
Subject: Re: [PATCH v8 2/6] gpu: nova-core: prepare Spec and Revision types
 for boot0/boot42
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-3-jhubbard@nvidia.com>
In-Reply-To: <20251114024109.465136-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P301CA0092.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: 980fe822-b23c-457b-bde6-08de238b5727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVdNdmVGTVRiSnFKOTF5bVV4NmROQmFNczVNMytYaXBoNFRGWWVvMTRheG1k?=
 =?utf-8?B?Mm9yOHhpMkc5WlZaOEx5K3lzdkVER1piaUpicENtRlRwVFFTb0ZCOUdXTlZl?=
 =?utf-8?B?RmlEdWFDcDdJZURPRWdneHBVK0JiUkdTbEl0dFd2dDdiR2hSS0MxdFlMMk1s?=
 =?utf-8?B?UjNhcG5Tc2xJR0ExTnFraUdldEVyREwyVnZ0YUgzZ29nK2VYeitwN0J5YXhj?=
 =?utf-8?B?U2J5WVZjNEJ4MkxPdEp6Vnk3YmtWQis5KzFUS2txeUZaOFJaN3ZzNVlxNDlr?=
 =?utf-8?B?Y3R0QTd5bTdWS1pqT1ZxT05ONVdyRW96U1VwT1JaRnh6QW1JaHZoKzB4bTQv?=
 =?utf-8?B?RHhlSDMyRUFIbXpkV3ZvSHd4Z2FBWkw5UENFblZ2ZXFVVk0rL2xVaWthdDNE?=
 =?utf-8?B?TWcveS9BRDA1WUFzbElOYnBMOHg4cnpZVm9HRnBCNFhZeFZrcEJ0VlExSy9a?=
 =?utf-8?B?SnBCZ21qNkgxZHJHZTJzeDBxT1NQQUN6M0g3ejFyNWZKMWRxU2FHaXg1Y3I1?=
 =?utf-8?B?dG9wUjVIQ1lKZlE0ajJITDJhaHdDS2JueWUyWEhXRUZQQk9LOFNrNG9ERktI?=
 =?utf-8?B?RURSZXFEaEhXMzFybWpPZ281TVpwSitHbkJmUWgxMVhVWkRNUGZqZG9TRnIz?=
 =?utf-8?B?V3I4cFhNUXp3My91K1dXRFd1MEo5MkpLb2tXa0YzaHpjWGVlNHpKVnJMRVVH?=
 =?utf-8?B?eXJjcVN3YUcwWGVwazBpQjBGdmREYW1SdWp0cGowcThmSnY4c3pMTVI4aFNw?=
 =?utf-8?B?ZW1RSlpkMmR3TGlULzhPQmgvMlYxNzVYem5UNllKbTJVSmhDYlptTVlnOHNE?=
 =?utf-8?B?MjNsNENGY1JObWxZV3B2bFlIVkdtc1BYMnVQN242Umt4WXpYcTJCWHp3TUdy?=
 =?utf-8?B?Z3pJNSt2bVIzY1Z6VytoS3ZYQ2dBUkNGRlBiVE5wYjVnYWYyY3FsMXp1VnVS?=
 =?utf-8?B?MEZ5TFR5b09mR0hIZG1ZOFRKUjBCaU9STkxYNG02L1pqcUxSYUw4bDFQT2VD?=
 =?utf-8?B?TjhjRjNQYmlRUlNZWW91elJhUm1SYTE4a29iZ3M3N2ZyN2JBOTRNZXFjcHRS?=
 =?utf-8?B?Ymk2YXcxY1Y2bFV5U05LeXhyZE1oRm9yRSt5d1QyZTJvMC91cXVPL0xHTU1y?=
 =?utf-8?B?NnRoSys1YWx4WkhwelJ6TEdqeWY0YjZDOHU5M2t0KysvcGllVUsrZzdHQjl0?=
 =?utf-8?B?SjIrNWI5a3JhK2Y3dVg4WGVRb1Q1d2c1NVM2MytZelQvVlRJbm1lVU9QNW4x?=
 =?utf-8?B?Q3JnRGpZMGYyM2VrekRzdnlpbXRHR2NnTDhtNjJwa2pmdUhRMWs2RlZSL1Mv?=
 =?utf-8?B?V3QrZWdJT01lSU1LbUxqMytCRmNHVEpSS2tyc1BnTHdQRG0zVStRcW9LL25P?=
 =?utf-8?B?cWwwWktjRndOVVA3SEFjSG9NWDZOWndhcG9LZ1BRM3Jta20vSGRHZUdKNDRi?=
 =?utf-8?B?QXBKSXVoOHZaTVdMcUkwbk9CUllaTkh4YnN6V2tHYStrOEtDVHR6YUF1R3pV?=
 =?utf-8?B?aE5VSko5TUQwaDVaRTJQY3N6cE1iVXp2dEVkSWxGdzZicURPbEM4V043SURv?=
 =?utf-8?B?RVZZMTdUeCthS3lKNkNaZyszQXJNVmRLSnFuNlhtcTg3TkVCN0l4VGJTM0d3?=
 =?utf-8?B?UjhveGtNYTU1WGdFUWZZOWV4emx6WmZScERTSDN5NWdOYnFJbnoxa013UXU3?=
 =?utf-8?B?cXhndEZIMnhBZlJnV2xiRlBEQXdUOEdUTXJqN0E4NzJsZ0Iwbk1QU3E5OHk4?=
 =?utf-8?B?eit6a2N0a0FqVTBPdzVObGRVUmNsMzQzcnhxYkl3VW9KUVIxQ3gyNkFMb1ZB?=
 =?utf-8?B?eXN2aVQwTVRENHpSd3VUajRUUEI3VlZ2MkxjK1Vad3Mxa0NoaFF6YkFSMnZZ?=
 =?utf-8?B?V1ZvMlhncXVydkIwZENDV1NUTHJFd3RneGgvNkRqZHppOVQyL1FSSVdTU1R0?=
 =?utf-8?Q?UHZZlzJZpLIEyJ9YaEHqPQxjWhqUDIgu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(7416014)(366016)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzQ4NnVZQ3hkUkdib0dyYzhKZEFHUGN2RjUzSDY5dWp6TXRpQ2FCN1VzaHlN?=
 =?utf-8?B?b2pqQ01HSnRPakRnbk54WkdoeGY1dklLdnNjU2dpK0duYTlGRGZ6OHo5dUVp?=
 =?utf-8?B?MUxWZE51VXRJWU1YNWRMNmhRZzg2UXA3RVJhQ1VtSFI5RmpVRnFSVXFRY2xu?=
 =?utf-8?B?MEZLNTdBeTFPYUljd3B6aCtFZjI2OUdLSkZ2NEZBQmdLb0l6VjBkSWZvM3hu?=
 =?utf-8?B?RVdvSVRKVGw3bDY5SHFqUnRhNWxJWDRianVpU2IzaWNDRktMTmxQR3k2U3Vi?=
 =?utf-8?B?a3RvNTNoRkdzSXdwa2F5UCtzaTlQT3FOV3A2MklwREdmUEVxR2lwblBLeWwr?=
 =?utf-8?B?OEQwOVR6ZmNNMGh4YUczME43NzN2ZzdsRW5NSFpzeHBURHVEc0lpSy9Pa2Ur?=
 =?utf-8?B?RDBUVk9lcW85b0xsSTJGN09ha2N5eHhSWTFhVzVlSitGL0ZjTUVDSUtCYVhD?=
 =?utf-8?B?NXBtNFpRbWdoNSt0Zmo1TjVpTmdQMHprdVpkM250WGdmNHl4emNWZU45bjla?=
 =?utf-8?B?bjlnNjVQVE9YU3l5VXdQMFBEMHFKcFdJbkhYLzRVQnFSbXFYcW9IS3FOdXZa?=
 =?utf-8?B?VVRNdTlMMXl2RlZBcDYxUjRrc0lsSFFXbTNEbC9BUy9BVmZXbkR6dk9FUmNN?=
 =?utf-8?B?L2dnM092cHJyK3BvN3FyUmFmUjVNTHlMdlVOK0J0NmVOOEZVcjIzU1BtVWlK?=
 =?utf-8?B?V0RuWlVTYmoyYzJVckRmK01QSVIrNG1vVzJjNHcyVlJjWmNOdG11OHBYNjdy?=
 =?utf-8?B?R1ZMMGJtMm5uSzlFeHFYL3poUG9nTEhYZGV0L21oNm1vQ3NIWHp6VFk1eDdO?=
 =?utf-8?B?ekt4YU85bnh5dzZjZERJTVZubW9Menhkb2k4SUJXZUx3RE02bm54L2ZTWGQ1?=
 =?utf-8?B?YVJrTFJ2cmJMVDdsU0JCb0RzNlJ2QURiMm1qM2RaaDltVGxKc0xJR2dyT05v?=
 =?utf-8?B?L1JZdkJlTzhNdWdFWS83VEkyeW1ObjgxM1NWMnV0UVJVQXM4THFMalIreFFR?=
 =?utf-8?B?b1JUcFNUNmpERU9iVFduSXQrWWQveGQ4UEZVVjcrUXRsQjFsS2NEeW9qQVFK?=
 =?utf-8?B?U255QU16Vi9oU2Q1Rm1yajNDbUNscTE2cVJ6aFk0TUJnOHNYOGloVVIzaDAx?=
 =?utf-8?B?L0tMZzB1VE5jSzNiR1k0SjBrZnhMRU1Da2lPZmlhT1AyUVZ3Z3lrNlUwakFL?=
 =?utf-8?B?RklDRmNzZllxWDdnZVAxV2krUE9uM0s4RmkrSCtIcTJPamc1Z0wyMGkyQmRP?=
 =?utf-8?B?ZEltREQzcDkrUy94RVZ5U1A5OE1VdDNvTHFVRi9FSnU5YXJXUEJES1l6ZzJi?=
 =?utf-8?B?T0NZaFlsVk1HVnlleCtPYzQ1b0xTSFptbVNsazQxY2FEUlI4ejZ2YkpDRWVM?=
 =?utf-8?B?TzZET2d3VUFEZU5LNjRveS9nMDRGL3orK01GSmVJcmpnTDN3ZGpHYndxZDRu?=
 =?utf-8?B?WENZNGxFbklhdWFqcXRzK3lPTWVGM3BuU0U5ZXJ4eXFTNE5LZ1Rza1N4bWxz?=
 =?utf-8?B?SmlhbWFZRUZ5SDlET2V3akM4ajcwQ1B5bDg2cnZ0N3Nna2JRSjBFcUpQWHls?=
 =?utf-8?B?aDdXWFBQL1NQSUFhVEVpVXEzdE1vKzI4TWh6cHUxV1lPTk9tV2Jlb2xDOTZG?=
 =?utf-8?B?MkhUMEgvMkdvTlBPUldMZ1hvdHhqcVRRZHUrK25sdjlnS1NYNzN3UTRtdDNC?=
 =?utf-8?B?UGJyZTRmWit6UllmdTVQUmRCMTliOHdpTjV6MFU3SVNQN2FJeGFHazFMTk42?=
 =?utf-8?B?c2VPYXJiQ1FxMS9mQURWTThDb0huaVZxMyttaFczMVV2TUxKSWJ3TklHZE0v?=
 =?utf-8?B?ZTBZTCtvQTFCSFRpMHY0d1VvejJZU2RpbitPM0FEOGUrU0JaL2V5NVZiZFM5?=
 =?utf-8?B?VEJHZVRwdlE3VTZZK0JISmVaTmJveWFVc0E5WGQ1OXFtaW91Q1MwZmYzZGh1?=
 =?utf-8?B?M1h2SkYzTWNOUVEweWl1Ry9EL0VRN1YvYUt4REZXWXpQNXFPSVhrTFMrZUo0?=
 =?utf-8?B?czdkbDdJRE1zZERMMit1K0ZRUWFrMXY5YVR4dklFV3FRNXlZdzJRWjRyNXBQ?=
 =?utf-8?B?MGJtOTRINEh5TXgvMmIveVM4RVkrZWpvWlNocTlvaXdTU1VSNER6OG1HbTVx?=
 =?utf-8?B?R1FkWkxmUzJiRzZqZGtyaldCVXlLbk9BdVdkUzA3Q2Z5RXdycmpRMkNGYnZG?=
 =?utf-8?Q?gETS75S++tqHGZ6zQMIQ/zapID3qvn53dyGMIeb6DGKc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 980fe822-b23c-457b-bde6-08de238b5727
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:37:30.5078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+jd3c94Ql8XFf94gkWW5L6li72nJiLXUG0XfMX+9ZInU1c80NFKCNUiC0FktCf6tDA69GRgecBPbJ2MwLZfGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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

On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
> 1) Decouple Revision from boot0.
>
> 2) Enhance Revision, which in turn simplifies Spec::new().
>
> 3) Also, slightly enhance the comment about Spec, to be more precise.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  | 26 ++++++++++++--------------
>  drivers/gpu/nova-core/regs.rs | 11 ++++++++++-
>  2 files changed, 22 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 7fd9e91771a6..8f438188fc03 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -143,17 +143,8 @@ fn try_from(value: u8) -> Result<Self> {
>  }
> =20
>  pub(crate) struct Revision {
> -    major: u8,
> -    minor: u8,
> -}
> -
> -impl Revision {
> -    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
> -        Self {
> -            major: boot0.major_revision(),
> -            minor: boot0.minor_revision(),
> -        }
> -    }
> +    pub(crate) major: u8,
> +    pub(crate) minor: u8,

Something felt a bit off with this diff, and I only realized why now.

We are moving, for no good reason, the creation of `Revision` into the
boot0 (and later boot42) register, which forces us to increase the
visibility of its fields.

And while `Revision` is now created by a method of the register it
originates from, `Spec` for some reason isn't, and we even add a
`TryFrom` implementation for it here. This creates an asymmetry that has
no justification afaict.

Instead, what if we replaced this `from_boot0` method by a `From<BOOT0>`
implementation? That way, we have consistency in how we derive our chip
information structures, and this patch can be reduced to this (with the
other changes below):

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index dfeba9d5d8f6..57c20d1e7274 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -147,8 +147,8 @@ pub(crate) struct Revision {
     minor: u8,
 }

-impl Revision {
-    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
+impl From<regs::NV_PMC_BOOT_0> for Revision {
+    fn from(boot0: regs::NV_PMC_BOOT_0) -> Self {
         Self {
             major: boot0.major_revision(),
             minor: boot0.minor_revision(),
@@ -162,10 +162,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Resu=
lt {
     }
 }

-/// Structure holding the metadata of the GPU.
+/// Structure holding a basic description of the GPU: `Chipset` and `Revis=
ion`.
 pub(crate) struct Spec {
     chipset: Chipset,
-    /// The revision of the chipset.
     revision: Revision,
 }

@@ -173,9 +172,17 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);

+        Spec::try_from(boot0)
+    }
+}
+
+impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+    type Error =3D Error;
+
+    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
         Ok(Self {
             chipset: boot0.chipset()?,
-            revision: Revision::from_boot0(boot0),
+            revision: boot0.into(),
         })
     }
 }

... and the subsequent patches also get some simplification.

>  }
> =20
>  impl fmt::Display for Revision {
> @@ -162,10 +153,9 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Re=
sult {
>      }
>  }
> =20
> -/// Structure holding the metadata of the GPU.
> +/// Structure holding a basic description of the GPU: `Architecture`, `C=
hipset` and `Revision`.

There is no `Architecture` in this structure though?

>  pub(crate) struct Spec {
>      chipset: Chipset,
> -    /// The revision of the chipset.
>      revision: Revision,
>  }
> =20
> @@ -173,9 +163,17 @@ impl Spec {
>      fn new(bar: &Bar0) -> Result<Spec> {
>          let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
> =20
> +        Spec::try_from(boot0)
> +    }
> +}
> +
> +impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
> +    type Error =3D Error;
> +
> +    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
>          Ok(Self {
>              chipset: boot0.chipset()?,
> -            revision: Revision::from_boot0(boot0),
> +            revision: boot0.revision(),
>      }
>          })
>  }
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 934003cab8a8..8c9af3c59708 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -24,7 +24,8 @@
>      },
>      gpu::{
>          Architecture,
> -        Chipset, //
> +        Chipset,
> +        Revision, //
>      },
>      num::FromSafeCast,
>  };
> @@ -56,6 +57,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>              })
>              .and_then(Chipset::try_from)
>      }
> +
> +    /// Returns the revision information of the chip.
> +    pub(crate) fn revision(self) -> Revision {
> +        Revision {
> +            major: self.major_revision(),
> +            minor: self.minor_revision(),
> +        }
> +    }

With the `From<BOOT0> for Revision` implementation we can also drop this
method.
